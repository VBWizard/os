
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
 310000f:	a1 68 1f 10 03       	mov    eax,ds:0x3101f68
 3100014:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100017:	c1 e2 02             	shl    edx,0x2
 310001a:	01 d0                	add    eax,edx
 310001c:	8b 00                	mov    eax,DWORD PTR [eax]
 310001e:	85 c0                	test   eax,eax
 3100020:	74 20                	je     3100042 <cmdPrintEnv+0x42>
/home/yogi/src/os/aproj/kshell/src/commands.c:16
        {
            print("%s\n",environmentLoc[cnt]);
 3100022:	a1 68 1f 10 03       	mov    eax,ds:0x3101f68
 3100027:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 310002a:	c1 e2 02             	shl    edx,0x2
 310002d:	01 d0                	add    eax,edx
 310002f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100031:	83 ec 08             	sub    esp,0x8
 3100034:	50                   	push   eax
 3100035:	68 2d 13 10 03       	push   0x310132d
 310003a:	e8 51 10 00 00       	call   3101090 <kShell+0x39c>
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
 310006a:	e8 2f 06 00 00       	call   310069e <parseParamsShell>
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
 310008b:	68 31 13 10 03       	push   0x3101331
 3100090:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 3100096:	50                   	push   eax
 3100097:	e8 c4 10 00 00       	call   3101160 <kShell+0x46c>
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
 31000ab:	68 33 13 10 03       	push   0x3101333
 31000b0:	e8 db 0f 00 00       	call   3101090 <kShell+0x39c>
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
 31000d7:	e8 24 11 00 00       	call   3101200 <kShell+0x50c>
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
 31000f8:	e8 f3 0f 00 00       	call   31010f0 <kShell+0x3fc>
 31000fd:	83 c4 10             	add    esp,0x10
 3100100:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:39
        varValue = malloc(valueLen);
 3100103:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100106:	83 ec 0c             	sub    esp,0xc
 3100109:	50                   	push   eax
 310010a:	e8 e1 0f 00 00       	call   31010f0 <kShell+0x3fc>
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
 3100126:	e8 55 10 00 00       	call   3101180 <kShell+0x48c>
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
 3100152:	e8 29 10 00 00       	call   3101180 <kShell+0x48c>
 3100157:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:43
        strtrim(varName);
 310015a:	83 ec 0c             	sub    esp,0xc
 310015d:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100160:	e8 6b 10 00 00       	call   31011d0 <kShell+0x4dc>
 3100165:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:44
        strtrim(varValue);
 3100168:	83 ec 0c             	sub    esp,0xc
 310016b:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 310016e:	e8 5d 10 00 00       	call   31011d0 <kShell+0x4dc>
 3100173:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:45
        setenv(varName, varValue);
 3100176:	83 ec 08             	sub    esp,0x8
 3100179:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 310017c:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 310017f:	e8 0c 10 00 00       	call   3101190 <kShell+0x49c>
 3100184:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:46
        free(varName);
 3100187:	83 ec 0c             	sub    esp,0xc
 310018a:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 310018d:	e8 8e 10 00 00       	call   3101220 <kShell+0x52c>
 3100192:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:47
        free(varValue);
 3100195:	83 ec 0c             	sub    esp,0xc
 3100198:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 310019b:	e8 80 10 00 00       	call   3101220 <kShell+0x52c>
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
 31001c4:	e8 47 10 00 00       	call   3101210 <kShell+0x51c>
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
 31001e7:	e8 94 0e 00 00       	call   3101080 <kShell+0x38c>
 31001ec:	83 c4 10             	add    esp,0x10
 31001ef:	a3 98 22 10 03       	mov    ds:0x3102298,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:64
            char ret[10];
            itoa(lastExecExitCode,ret);
 31001f4:	a1 98 22 10 03       	mov    eax,ds:0x3102298
 31001f9:	89 c2                	mov    edx,eax
 31001fb:	83 ec 08             	sub    esp,0x8
 31001fe:	8d 45 ea             	lea    eax,[ebp-0x16]
 3100201:	50                   	push   eax
 3100202:	52                   	push   edx
 3100203:	e8 28 0f 00 00       	call   3101130 <kShell+0x43c>
 3100208:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:65
            setenv("LASTEXIT",ret);
 310020b:	83 ec 08             	sub    esp,0x8
 310020e:	8d 45 ea             	lea    eax,[ebp-0x16]
 3100211:	50                   	push   eax
 3100212:	68 4e 13 10 03       	push   0x310134e
 3100217:	e8 74 0f 00 00       	call   3101190 <kShell+0x49c>
 310021c:	83 c4 10             	add    esp,0x10
 310021f:	eb 13                	jmp    3100234 <kexec+0x88>
/home/yogi/src/os/aproj/kshell/src/commands.c:69
        }
    }
    else
        print("Error executing %s\n",path);
 3100221:	83 ec 08             	sub    esp,0x8
 3100224:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100227:	68 57 13 10 03       	push   0x3101357
 310022c:	e8 5f 0e 00 00       	call   3101090 <kShell+0x39c>
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
 310026d:	e8 2c 04 00 00       	call   310069e <parseParamsShell>
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
 31002a7:	e8 64 0e 00 00       	call   3101110 <kShell+0x41c>
 31002ac:	83 c4 10             	add    esp,0x10
 31002af:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:96
            
//    print ("Executing %s\n",pgm);
    startTicks=getticks();
 31002b2:	e8 89 0e 00 00       	call   3101140 <kShell+0x44c>
 31002b7:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:98
    
    forkPid = fork();
 31002ba:	e8 f1 0e 00 00       	call   31011b0 <kShell+0x4bc>
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
 31002db:	e8 70 0e 00 00       	call   3101150 <kShell+0x45c>
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
 31002f3:	e8 88 0d 00 00       	call   3101080 <kShell+0x38c>
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
 310030d:	e8 de 0e 00 00       	call   31011f0 <kShell+0x4fc>
 3100312:	83 c4 10             	add    esp,0x10
 3100315:	e9 ad 00 00 00       	jmp    31003c7 <execTime+0x190>
/home/yogi/src/os/aproj/kshell/src/commands.c:113
    }
    else if (forkPid < 0)
 310031a:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 310031e:	79 18                	jns    3100338 <execTime+0x101>
/home/yogi/src/os/aproj/kshell/src/commands.c:114
        printf("Fork error %u", forkPid);
 3100320:	83 ec 08             	sub    esp,0x8
 3100323:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100326:	68 6b 13 10 03       	push   0x310136b
 310032b:	e8 70 0d 00 00       	call   31010a0 <kShell+0x3ac>
 3100330:	83 c4 10             	add    esp,0x10
 3100333:	e9 8f 00 00 00       	jmp    31003c7 <execTime+0x190>
/home/yogi/src/os/aproj/kshell/src/commands.c:117
    else
    {
            lastExecExitCode = waitpid(forkPid);
 3100338:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 310033b:	83 ec 0c             	sub    esp,0xc
 310033e:	50                   	push   eax
 310033f:	e8 3c 0d 00 00       	call   3101080 <kShell+0x38c>
 3100344:	83 c4 10             	add    esp,0x10
 3100347:	a3 98 22 10 03       	mov    ds:0x3102298,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:118
            if (lastExecExitCode == 0xBADBADBA)
 310034c:	a1 98 22 10 03       	mov    eax,ds:0x3102298
 3100351:	3d ba ad db ba       	cmp    eax,0xbadbadba
 3100356:	75 16                	jne    310036e <execTime+0x137>
/home/yogi/src/os/aproj/kshell/src/commands.c:119
                printf("Cannot execute %s\n",argv[0]);
 3100358:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 310035b:	8b 00                	mov    eax,DWORD PTR [eax]
 310035d:	83 ec 08             	sub    esp,0x8
 3100360:	50                   	push   eax
 3100361:	68 79 13 10 03       	push   0x3101379
 3100366:	e8 35 0d 00 00       	call   31010a0 <kShell+0x3ac>
 310036b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:120
            if (timeIt)
 310036e:	80 bd b4 fa ff ff 00 	cmp    BYTE PTR [ebp-0x54c],0x0
 3100375:	74 1f                	je     3100396 <execTime+0x15f>
/home/yogi/src/os/aproj/kshell/src/commands.c:122
            {
                endTicks=getticks();
 3100377:	e8 c4 0d 00 00       	call   3101140 <kShell+0x44c>
 310037c:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:123
                print("%u ticks\n",endTicks-startTicks);
 310037f:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 3100382:	2b 45 d4             	sub    eax,DWORD PTR [ebp-0x2c]
 3100385:	83 ec 08             	sub    esp,0x8
 3100388:	50                   	push   eax
 3100389:	68 8c 13 10 03       	push   0x310138c
 310038e:	e8 fd 0c 00 00       	call   3101090 <kShell+0x39c>
 3100393:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:126
            }
            char ret[10];
            itoa(lastExecExitCode,ret);
 3100396:	a1 98 22 10 03       	mov    eax,ds:0x3102298
 310039b:	89 c2                	mov    edx,eax
 310039d:	83 ec 08             	sub    esp,0x8
 31003a0:	8d 85 be fa ff ff    	lea    eax,[ebp-0x542]
 31003a6:	50                   	push   eax
 31003a7:	52                   	push   edx
 31003a8:	e8 83 0d 00 00       	call   3101130 <kShell+0x43c>
 31003ad:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:127
            setenv("LASTEXIT",ret);    
 31003b0:	83 ec 08             	sub    esp,0x8
 31003b3:	8d 85 be fa ff ff    	lea    eax,[ebp-0x542]
 31003b9:	50                   	push   eax
 31003ba:	68 4e 13 10 03       	push   0x310134e
 31003bf:	e8 cc 0d 00 00       	call   3101190 <kShell+0x49c>
 31003c4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:130 (discriminator 1)
    }
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    free(argv);
 31003c7:	83 ec 0c             	sub    esp,0xc
 31003ca:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31003cd:	e8 4e 0e 00 00       	call   3101220 <kShell+0x52c>
 31003d2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:131 (discriminator 1)
    free(pgm);
 31003d5:	83 ec 0c             	sub    esp,0xc
 31003d8:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 31003db:	e8 40 0e 00 00       	call   3101220 <kShell+0x52c>
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
 3100435:	e8 64 02 00 00       	call   310069e <parseParamsShell>
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
 310044f:	e8 cc 0c 00 00       	call   3101120 <kShell+0x42c>
 3100454:	83 c4 10             	add    esp,0x10
 3100457:	a3 9c 22 10 03       	mov    ds:0x310229c,eax
 310045c:	eb 0a                	jmp    3100468 <cmdExit+0x4e>
/home/yogi/src/os/aproj/kshell/src/commands.c:153
    }
    else
        exitCode = 0;
 310045e:	c7 05 9c 22 10 03 00 	mov    DWORD PTR ds:0x310229c,0x0
 3100465:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:154
    timeToExit=true;
 3100468:	c6 05 a8 22 10 03 01 	mov    BYTE PTR ds:0x31022a8,0x1
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
 310047b:	68 60 1f 10 03       	push   0x3101f60
 3100480:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100483:	e8 18 0d 00 00       	call   31011a0 <kShell+0x4ac>
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
 3100494:	68 96 13 10 03       	push   0x3101396
 3100499:	e8 f2 0b 00 00       	call   3101090 <kShell+0x39c>
 310049e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:169
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 31004a1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31004a8:	e9 86 00 00 00       	jmp    3100533 <cmdHelp+0xc1>
/home/yogi/src/os/aproj/kshell/src/commands.c:170
        if (tok!=NULL)
 31004ad:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31004b1:	74 50                	je     3100503 <cmdHelp+0x91>
/home/yogi/src/os/aproj/kshell/src/commands.c:172
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
 31004b3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004b6:	c1 e0 04             	shl    eax,0x4
 31004b9:	05 40 1d 10 03       	add    eax,0x3101d40
 31004be:	8b 00                	mov    eax,DWORD PTR [eax]
 31004c0:	83 ec 04             	sub    esp,0x4
 31004c3:	6a 64                	push   0x64
 31004c5:	50                   	push   eax
 31004c6:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31004c9:	e8 a2 0c 00 00       	call   3101170 <kShell+0x47c>
 31004ce:	83 c4 10             	add    esp,0x10
 31004d1:	85 c0                	test   eax,eax
 31004d3:	75 5a                	jne    310052f <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:173
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 31004d5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004d8:	c1 e0 04             	shl    eax,0x4
 31004db:	05 44 1d 10 03       	add    eax,0x3101d44
 31004e0:	8b 10                	mov    edx,DWORD PTR [eax]
 31004e2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004e5:	c1 e0 04             	shl    eax,0x4
 31004e8:	05 40 1d 10 03       	add    eax,0x3101d40
 31004ed:	8b 00                	mov    eax,DWORD PTR [eax]
 31004ef:	83 ec 04             	sub    esp,0x4
 31004f2:	52                   	push   edx
 31004f3:	50                   	push   eax
 31004f4:	68 a0 13 10 03       	push   0x31013a0
 31004f9:	e8 92 0b 00 00       	call   3101090 <kShell+0x39c>
 31004fe:	83 c4 10             	add    esp,0x10
 3100501:	eb 2c                	jmp    310052f <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:176
        }
        else
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100503:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100506:	c1 e0 04             	shl    eax,0x4
 3100509:	05 44 1d 10 03       	add    eax,0x3101d44
 310050e:	8b 10                	mov    edx,DWORD PTR [eax]
 3100510:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100513:	c1 e0 04             	shl    eax,0x4
 3100516:	05 40 1d 10 03       	add    eax,0x3101d40
 310051b:	8b 00                	mov    eax,DWORD PTR [eax]
 310051d:	83 ec 04             	sub    esp,0x4
 3100520:	52                   	push   edx
 3100521:	50                   	push   eax
 3100522:	68 a0 13 10 03       	push   0x31013a0
 3100527:	e8 64 0b 00 00       	call   3101090 <kShell+0x39c>
 310052c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:169 (discriminator 2)
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 310052f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:169 (discriminator 1)
 3100533:	83 7d f4 07          	cmp    DWORD PTR [ebp-0xc],0x7
 3100537:	0f 86 70 ff ff ff    	jbe    31004ad <cmdHelp+0x3b>
/home/yogi/src/os/aproj/kshell/src/commands.c:178
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
        else
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        
}
 310053d:	90                   	nop
 310053e:	c9                   	leave  
 310053f:	c3                   	ret    

03100540 <cmdPwd>:
cmdPwd():
/home/yogi/src/os/aproj/kshell/src/commands.c:181

void cmdPwd()
{
 3100540:	55                   	push   ebp
 3100541:	89 e5                	mov    ebp,esp
 3100543:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:182
    char* buf=malloc(512);
 3100546:	83 ec 0c             	sub    esp,0xc
 3100549:	68 00 02 00 00       	push   0x200
 310054e:	e8 9d 0b 00 00       	call   31010f0 <kShell+0x3fc>
 3100553:	83 c4 10             	add    esp,0x10
 3100556:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:183
    print("%s\n",getcwd(buf,512));
 3100559:	83 ec 08             	sub    esp,0x8
 310055c:	68 00 02 00 00       	push   0x200
 3100561:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100564:	e8 77 0c 00 00       	call   31011e0 <kShell+0x4ec>
 3100569:	83 c4 10             	add    esp,0x10
 310056c:	83 ec 08             	sub    esp,0x8
 310056f:	50                   	push   eax
 3100570:	68 2d 13 10 03       	push   0x310132d
 3100575:	e8 16 0b 00 00       	call   3101090 <kShell+0x39c>
 310057a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:184
    free(buf);
 310057d:	83 ec 0c             	sub    esp,0xc
 3100580:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100583:	e8 98 0c 00 00       	call   3101220 <kShell+0x52c>
 3100588:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:185
}
 310058b:	90                   	nop
 310058c:	c9                   	leave  
 310058d:	c3                   	ret    

0310058e <cmdSleep>:
cmdSleep():
/home/yogi/src/os/aproj/kshell/src/commands.c:188

void cmdSleep(char *cmdline)
{
 310058e:	55                   	push   ebp
 310058f:	89 e5                	mov    ebp,esp
 3100591:	81 ec 18 05 00 00    	sub    esp,0x518
/home/yogi/src/os/aproj/kshell/src/commands.c:190
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 3100597:	83 ec 04             	sub    esp,0x4
 310059a:	68 00 05 00 00       	push   0x500
 310059f:	8d 85 f4 fa ff ff    	lea    eax,[ebp-0x50c]
 31005a5:	50                   	push   eax
 31005a6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31005a9:	e8 f0 00 00 00       	call   310069e <parseParamsShell>
 31005ae:	83 c4 10             	add    esp,0x10
 31005b1:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:192

    if (params[0][0]==0)
 31005b4:	0f b6 85 f4 fa ff ff 	movzx  eax,BYTE PTR [ebp-0x50c]
 31005bb:	84 c0                	test   al,al
 31005bd:	75 12                	jne    31005d1 <cmdSleep+0x43>
/home/yogi/src/os/aproj/kshell/src/commands.c:194
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 31005bf:	83 ec 0c             	sub    esp,0xc
 31005c2:	68 ac 13 10 03       	push   0x31013ac
 31005c7:	e8 c4 0a 00 00       	call   3101090 <kShell+0x39c>
 31005cc:	83 c4 10             	add    esp,0x10
 31005cf:	eb 22                	jmp    31005f3 <cmdSleep+0x65>
/home/yogi/src/os/aproj/kshell/src/commands.c:198
        return;
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 31005d1:	83 ec 04             	sub    esp,0x4
 31005d4:	6a 0a                	push   0xa
 31005d6:	6a 00                	push   0x0
 31005d8:	8d 85 f4 fa ff ff    	lea    eax,[ebp-0x50c]
 31005de:	50                   	push   eax
 31005df:	e8 3c 0b 00 00       	call   3101120 <kShell+0x42c>
 31005e4:	83 c4 10             	add    esp,0x10
 31005e7:	83 ec 0c             	sub    esp,0xc
 31005ea:	50                   	push   eax
 31005eb:	e8 10 0b 00 00       	call   3101100 <kShell+0x40c>
 31005f0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:199
}
 31005f3:	c9                   	leave  
 31005f4:	c3                   	ret    
 31005f5:	66 90                	xchg   ax,ax
 31005f7:	90                   	nop

031005f8 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:25
void execInternalCommand(char lCommand[256]);
int findCommand(char* command);
char **buildargv (const char *input);

void execInternalCommand(char lCommand[256])
{
 31005f8:	55                   	push   ebp
 31005f9:	89 e5                	mov    ebp,esp
 31005fb:	53                   	push   ebx
 31005fc:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:26
    int i = findCommand(lCommand);
 31005ff:	83 ec 0c             	sub    esp,0xc
 3100602:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100605:	e8 3d 02 00 00       	call   3100847 <findCommand>
 310060a:	83 c4 10             	add    esp,0x10
 310060d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:28

    if(i>0)
 3100610:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100614:	7e 74                	jle    310068a <execInternalCommand+0x92>
/home/yogi/src/os/aproj/kshell/src/kshell.c:30
    {
        i--;
 3100616:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:32
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 310061a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310061d:	c1 e0 04             	shl    eax,0x4
 3100620:	05 c8 1d 10 03       	add    eax,0x3101dc8
 3100625:	8b 00                	mov    eax,DWORD PTR [eax]
 3100627:	a3 90 22 10 03       	mov    ds:0x3102290,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:33
        command_function_p = cmds[i].function;
 310062c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310062f:	c1 e0 04             	shl    eax,0x4
 3100632:	05 c8 1d 10 03       	add    eax,0x3101dc8
 3100637:	8b 00                	mov    eax,DWORD PTR [eax]
 3100639:	a3 80 22 10 03       	mov    ds:0x3102280,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:34
        if (cmds[i].paramCount==0)
 310063e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100641:	c1 e0 04             	shl    eax,0x4
 3100644:	05 cc 1d 10 03       	add    eax,0x3101dcc
 3100649:	8b 00                	mov    eax,DWORD PTR [eax]
 310064b:	85 c0                	test   eax,eax
 310064d:	75 09                	jne    3100658 <execInternalCommand+0x60>
/home/yogi/src/os/aproj/kshell/src/kshell.c:35
            command_function();
 310064f:	a1 90 22 10 03       	mov    eax,ds:0x3102290
 3100654:	ff d0                	call   eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:46
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 3100656:	eb 40                	jmp    3100698 <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:38
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
 3100658:	8b 1d 80 22 10 03    	mov    ebx,DWORD PTR ds:0x3102280
 310065e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100661:	c1 e0 04             	shl    eax,0x4
 3100664:	05 c0 1d 10 03       	add    eax,0x3101dc0
 3100669:	8b 00                	mov    eax,DWORD PTR [eax]
 310066b:	83 ec 0c             	sub    esp,0xc
 310066e:	50                   	push   eax
 310066f:	e8 8c 0b 00 00       	call   3101200 <kShell+0x50c>
 3100674:	83 c4 10             	add    esp,0x10
 3100677:	8d 50 01             	lea    edx,[eax+0x1]
 310067a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310067d:	01 d0                	add    eax,edx
 310067f:	83 ec 0c             	sub    esp,0xc
 3100682:	50                   	push   eax
 3100683:	ff d3                	call   ebx
 3100685:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:46
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 3100688:	eb 0e                	jmp    3100698 <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:44
        }
    }
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
 310068a:	83 ec 0c             	sub    esp,0xc
 310068d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100690:	e8 6c fd ff ff       	call   3100401 <cmdExecp>
 3100695:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:46
    }
}
 3100698:	90                   	nop
 3100699:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 310069c:	c9                   	leave  
 310069d:	c3                   	ret    

0310069e <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:49

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 310069e:	55                   	push   ebp
 310069f:	89 e5                	mov    ebp,esp
 31006a1:	53                   	push   ebx
 31006a2:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/aproj/kshell/src/kshell.c:50
    int x=0,y=0;
 31006a5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31006ac:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:51
    int lRetVal=0,parsedChars=0;
 31006b3:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 31006ba:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:52
    bool needDoubleQuotetoEndParam=0;
 31006c1:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:54
    
    memset(params,0, size);
 31006c5:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 31006c8:	83 ec 04             	sub    esp,0x4
 31006cb:	50                   	push   eax
 31006cc:	6a 00                	push   0x0
 31006ce:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31006d1:	e8 ea 0a 00 00       	call   31011c0 <kShell+0x4cc>
 31006d6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:56
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31006d9:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 31006e0:	e9 24 01 00 00       	jmp    3100809 <parseParamsShell+0x16b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:58
    {
        if(cmdLine[cnt]=='"')
 31006e5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31006e8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31006eb:	01 d0                	add    eax,edx
 31006ed:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31006f0:	3c 22                	cmp    al,0x22
 31006f2:	75 41                	jne    3100735 <parseParamsShell+0x97>
/home/yogi/src/os/aproj/kshell/src/kshell.c:60
        {
            if (!needDoubleQuotetoEndParam)
 31006f4:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 31006f8:	83 f0 01             	xor    eax,0x1
 31006fb:	84 c0                	test   al,al
 31006fd:	74 09                	je     3100708 <parseParamsShell+0x6a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:62
            {
                needDoubleQuotetoEndParam=true;
 31006ff:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
 3100703:	e9 f9 00 00 00       	jmp    3100801 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:66
            }
            else
            {
                params[y][x]='\0';
 3100708:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310070b:	c1 e0 07             	shl    eax,0x7
 310070e:	89 c2                	mov    edx,eax
 3100710:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100713:	01 c2                	add    edx,eax
 3100715:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100718:	01 d0                	add    eax,edx
 310071a:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:67
                {x=0;y++;lRetVal++;}
 310071d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100724:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100728:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:68
                needDoubleQuotetoEndParam=false;
 310072c:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
 3100730:	e9 cc 00 00 00       	jmp    3100801 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:71
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
 3100735:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100738:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310073b:	01 d0                	add    eax,edx
 310073d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100740:	3c 20                	cmp    al,0x20
 3100742:	74 1e                	je     3100762 <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:71 (discriminator 2)
 3100744:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100747:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310074a:	01 d0                	add    eax,edx
 310074c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310074f:	3c 2d                	cmp    al,0x2d
 3100751:	74 0f                	je     3100762 <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:71 (discriminator 4)
 3100753:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100756:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100759:	01 d0                	add    eax,edx
 310075b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310075e:	3c 2c                	cmp    al,0x2c
 3100760:	75 7a                	jne    31007dc <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:71 (discriminator 5)
 3100762:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100766:	83 f0 01             	xor    eax,0x1
 3100769:	84 c0                	test   al,al
 310076b:	74 6f                	je     31007dc <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:74
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 310076d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100770:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100773:	01 d0                	add    eax,edx
 3100775:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100778:	3c 2d                	cmp    al,0x2d
 310077a:	74 0f                	je     310078b <parseParamsShell+0xed>
/home/yogi/src/os/aproj/kshell/src/kshell.c:74 (discriminator 1)
 310077c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310077f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100782:	01 d0                	add    eax,edx
 3100784:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100787:	3c 2f                	cmp    al,0x2f
 3100789:	75 25                	jne    31007b0 <parseParamsShell+0x112>
/home/yogi/src/os/aproj/kshell/src/kshell.c:75
                params[y][x++]=cmdLine[cnt];
 310078b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310078e:	c1 e0 07             	shl    eax,0x7
 3100791:	89 c2                	mov    edx,eax
 3100793:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100796:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3100799:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310079c:	8d 50 01             	lea    edx,[eax+0x1]
 310079f:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31007a2:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31007a5:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 31007a8:	01 da                	add    edx,ebx
 31007aa:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31007ad:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:76
            params[y][x]='\0';
 31007b0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31007b3:	c1 e0 07             	shl    eax,0x7
 31007b6:	89 c2                	mov    edx,eax
 31007b8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31007bb:	01 c2                	add    edx,eax
 31007bd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31007c0:	01 d0                	add    eax,edx
 31007c2:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:77
            if (cnt>0)
 31007c5:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 31007c9:	74 36                	je     3100801 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:78
                {x=0;y++;lRetVal++;}
 31007cb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31007d2:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 31007d6:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:77
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 31007da:	eb 25                	jmp    3100801 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:83
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 31007dc:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31007df:	c1 e0 07             	shl    eax,0x7
 31007e2:	89 c2                	mov    edx,eax
 31007e4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31007e7:	8d 0c 02             	lea    ecx,[edx+eax*1]
 31007ea:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31007ed:	8d 50 01             	lea    edx,[eax+0x1]
 31007f0:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31007f3:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31007f6:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 31007f9:	01 da                	add    edx,ebx
 31007fb:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31007fe:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:85 (discriminator 2)
        }
        parsedChars++;
 3100801:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:56 (discriminator 2)
    int lRetVal=0,parsedChars=0;
    bool needDoubleQuotetoEndParam=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100805:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:56 (discriminator 1)
 3100809:	83 ec 0c             	sub    esp,0xc
 310080c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310080f:	e8 ec 09 00 00       	call   3101200 <kShell+0x50c>
 3100814:	83 c4 10             	add    esp,0x10
 3100817:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 310081a:	0f 87 c5 fe ff ff    	ja     31006e5 <parseParamsShell+0x47>
/home/yogi/src/os/aproj/kshell/src/kshell.c:87
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 3100820:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100824:	74 19                	je     310083f <parseParamsShell+0x1a1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:89
    {
        lRetVal++;
 3100826:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:90
        params[y][x]='\0';
 310082a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310082d:	c1 e0 07             	shl    eax,0x7
 3100830:	89 c2                	mov    edx,eax
 3100832:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100835:	01 c2                	add    edx,eax
 3100837:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310083a:	01 d0                	add    eax,edx
 310083c:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:95
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 310083f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/aproj/kshell/src/kshell.c:96
}
 3100842:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100845:	c9                   	leave  
 3100846:	c3                   	ret    

03100847 <findCommand>:
findCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:99

int findCommand(char* command)
{
 3100847:	55                   	push   ebp
 3100848:	89 e5                	mov    ebp,esp
 310084a:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:103
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 310084d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100854:	eb 4d                	jmp    31008a3 <findCommand+0x5c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:105
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 3100856:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100859:	c1 e0 04             	shl    eax,0x4
 310085c:	05 c0 1d 10 03       	add    eax,0x3101dc0
 3100861:	8b 00                	mov    eax,DWORD PTR [eax]
 3100863:	83 ec 0c             	sub    esp,0xc
 3100866:	50                   	push   eax
 3100867:	e8 94 09 00 00       	call   3101200 <kShell+0x50c>
 310086c:	83 c4 10             	add    esp,0x10
 310086f:	89 c2                	mov    edx,eax
 3100871:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100874:	c1 e0 04             	shl    eax,0x4
 3100877:	05 c0 1d 10 03       	add    eax,0x3101dc0
 310087c:	8b 00                	mov    eax,DWORD PTR [eax]
 310087e:	83 ec 04             	sub    esp,0x4
 3100881:	52                   	push   edx
 3100882:	50                   	push   eax
 3100883:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100886:	e8 e5 08 00 00       	call   3101170 <kShell+0x47c>
 310088b:	83 c4 10             	add    esp,0x10
 310088e:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:107
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 3100891:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100895:	75 08                	jne    310089f <findCommand+0x58>
/home/yogi/src/os/aproj/kshell/src/kshell.c:110
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 3100897:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310089a:	83 c0 01             	add    eax,0x1
 310089d:	eb 0f                	jmp    31008ae <findCommand+0x67>
/home/yogi/src/os/aproj/kshell/src/kshell.c:103 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 310089f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:103 (discriminator 1)
 31008a3:	83 7d f4 07          	cmp    DWORD PTR [ebp-0xc],0x7
 31008a7:	76 ad                	jbe    3100856 <findCommand+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:114
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 31008a9:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:115
}
 31008ae:	c9                   	leave  
 31008af:	c3                   	ret    

031008b0 <buildargv>:
buildargv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:119

/*parts from http://*/
char **buildargv (const char *input)
{
 31008b0:	55                   	push   ebp
 31008b1:	89 e5                	mov    ebp,esp
 31008b3:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:122
  char *arg;
  char *copybuf;
  int squote = 0;
 31008b6:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:123
  int dquote = 0;
 31008bd:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:124
  int bsquote = 0;
 31008c4:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:125
  int argc = 0;
 31008cb:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:126
  int maxargc = 0;
 31008d2:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:127
  char **argv = NULL;
 31008d9:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:131
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 31008e0:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 31008e4:	0f 84 33 02 00 00    	je     3100b1d <buildargv+0x26d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:134
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 31008ea:	83 ec 0c             	sub    esp,0xc
 31008ed:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31008f0:	e8 0b 09 00 00       	call   3101200 <kShell+0x50c>
 31008f5:	83 c4 10             	add    esp,0x10
 31008f8:	83 c0 01             	add    eax,0x1
 31008fb:	83 ec 0c             	sub    esp,0xc
 31008fe:	50                   	push   eax
 31008ff:	e8 ec 07 00 00       	call   31010f0 <kShell+0x3fc>
 3100904:	83 c4 10             	add    esp,0x10
 3100907:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:142
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 310090a:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 310090e:	74 0b                	je     310091b <buildargv+0x6b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:142 (discriminator 1)
 3100910:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100913:	83 e8 01             	sub    eax,0x1
 3100916:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3100919:	7f 3d                	jg     3100958 <buildargv+0xa8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:145
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 310091b:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 310091f:	75 1c                	jne    310093d <buildargv+0x8d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:147
		{
		  maxargc = INITIAL_MAXARGC;
 3100921:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:148
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 3100928:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 310092b:	c1 e0 02             	shl    eax,0x2
 310092e:	83 ec 0c             	sub    esp,0xc
 3100931:	50                   	push   eax
 3100932:	e8 b9 07 00 00       	call   31010f0 <kShell+0x3fc>
 3100937:	83 c4 10             	add    esp,0x10
 310093a:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:150
		}
	      argv = nargv;
 310093d:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 3100940:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:151
	      argv[argc] = NULL;
 3100943:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100946:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 310094d:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100950:	01 d0                	add    eax,edx
 3100952:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:154
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 3100958:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310095b:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:155
	  while (*input != EOS)
 310095e:	e9 ec 00 00 00       	jmp    3100a4f <buildargv+0x19f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100963:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100966:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100969:	3c 20                	cmp    al,0x20
 310096b:	75 16                	jne    3100983 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 1)
 310096d:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100971:	75 10                	jne    3100983 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 2)
 3100973:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100977:	75 0a                	jne    3100983 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 3)
 3100979:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310097d:	0f 84 da 00 00 00    	je     3100a5d <buildargv+0x1ad>
/home/yogi/src/os/aproj/kshell/src/kshell.c:163
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100983:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100987:	74 1d                	je     31009a6 <buildargv+0xf6>
/home/yogi/src/os/aproj/kshell/src/kshell.c:165
		    {
		      bsquote = 0;
 3100989:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:166
		      *arg++ = *input;
 3100990:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100993:	8d 50 01             	lea    edx,[eax+0x1]
 3100996:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100999:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310099c:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310099f:	88 10                	mov    BYTE PTR [eax],dl
 31009a1:	e9 a5 00 00 00       	jmp    3100a4b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:168
		    }
		  else if (*input == '\\')
 31009a6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31009a9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31009ac:	3c 5c                	cmp    al,0x5c
 31009ae:	75 0c                	jne    31009bc <buildargv+0x10c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:170
		    {
		      bsquote = 1;
 31009b0:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 31009b7:	e9 8f 00 00 00       	jmp    3100a4b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:172
		    }
		  else if (squote)
 31009bc:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31009c0:	74 26                	je     31009e8 <buildargv+0x138>
/home/yogi/src/os/aproj/kshell/src/kshell.c:174
		    {
		      if (*input == '\'')
 31009c2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31009c5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31009c8:	3c 27                	cmp    al,0x27
 31009ca:	75 09                	jne    31009d5 <buildargv+0x125>
/home/yogi/src/os/aproj/kshell/src/kshell.c:176
			{
			  squote = 0;
 31009cc:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 31009d3:	eb 76                	jmp    3100a4b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:180
			}
		      else
			{
			  *arg++ = *input;
 31009d5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31009d8:	8d 50 01             	lea    edx,[eax+0x1]
 31009db:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31009de:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31009e1:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31009e4:	88 10                	mov    BYTE PTR [eax],dl
 31009e6:	eb 63                	jmp    3100a4b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:183
			}
		    }
		  else if (dquote)
 31009e8:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31009ec:	74 26                	je     3100a14 <buildargv+0x164>
/home/yogi/src/os/aproj/kshell/src/kshell.c:185
		    {
		      if (*input == '"')
 31009ee:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31009f1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31009f4:	3c 22                	cmp    al,0x22
 31009f6:	75 09                	jne    3100a01 <buildargv+0x151>
/home/yogi/src/os/aproj/kshell/src/kshell.c:187
			{
			  dquote = 0;
 31009f8:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 31009ff:	eb 4a                	jmp    3100a4b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:191
			}
		      else
			{
			  *arg++ = *input;
 3100a01:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a04:	8d 50 01             	lea    edx,[eax+0x1]
 3100a07:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100a0a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100a0d:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100a10:	88 10                	mov    BYTE PTR [eax],dl
 3100a12:	eb 37                	jmp    3100a4b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:196
			}
		    }
		  else
		    {
		      if (*input == '\'')
 3100a14:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a17:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a1a:	3c 27                	cmp    al,0x27
 3100a1c:	75 09                	jne    3100a27 <buildargv+0x177>
/home/yogi/src/os/aproj/kshell/src/kshell.c:198
			{
			  squote = 1;
 3100a1e:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 3100a25:	eb 24                	jmp    3100a4b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:200
			}
		      else if (*input == '"')
 3100a27:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a2a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a2d:	3c 22                	cmp    al,0x22
 3100a2f:	75 09                	jne    3100a3a <buildargv+0x18a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:202
			{
			  dquote = 1;
 3100a31:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 3100a38:	eb 11                	jmp    3100a4b <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:206
			}
		      else
			{
			  *arg++ = *input;
 3100a3a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a3d:	8d 50 01             	lea    edx,[eax+0x1]
 3100a40:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100a43:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100a46:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100a49:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:210
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 3100a4b:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:155
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 3100a4f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a52:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a55:	84 c0                	test   al,al
 3100a57:	0f 85 06 ff ff ff    	jne    3100963 <buildargv+0xb3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:213
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 3100a5d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a60:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:215
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100a63:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100a66:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100a69:	84 c0                	test   al,al
 3100a6b:	0f 84 9e 00 00 00    	je     3100b0f <buildargv+0x25f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:217
          {
            char* temp=malloc(strlen(copybuf)+1);
 3100a71:	83 ec 0c             	sub    esp,0xc
 3100a74:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100a77:	e8 84 07 00 00       	call   3101200 <kShell+0x50c>
 3100a7c:	83 c4 10             	add    esp,0x10
 3100a7f:	83 c0 01             	add    eax,0x1
 3100a82:	83 ec 0c             	sub    esp,0xc
 3100a85:	50                   	push   eax
 3100a86:	e8 65 06 00 00       	call   31010f0 <kShell+0x3fc>
 3100a8b:	83 c4 10             	add    esp,0x10
 3100a8e:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:220
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 3100a91:	83 ec 08             	sub    esp,0x8
 3100a94:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100a97:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100a9a:	e8 d1 05 00 00       	call   3101070 <kShell+0x37c>
 3100a9f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:221
            free(copybuf);
 3100aa2:	83 ec 0c             	sub    esp,0xc
 3100aa5:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100aa8:	e8 73 07 00 00       	call   3101220 <kShell+0x52c>
 3100aad:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:222
            copybuf = (char *) malloc (strlen (input) + 1);
 3100ab0:	83 ec 0c             	sub    esp,0xc
 3100ab3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100ab6:	e8 45 07 00 00       	call   3101200 <kShell+0x50c>
 3100abb:	83 c4 10             	add    esp,0x10
 3100abe:	83 c0 01             	add    eax,0x1
 3100ac1:	83 ec 0c             	sub    esp,0xc
 3100ac4:	50                   	push   eax
 3100ac5:	e8 26 06 00 00       	call   31010f0 <kShell+0x3fc>
 3100aca:	83 c4 10             	add    esp,0x10
 3100acd:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:223
            argv[argc] = temp;
 3100ad0:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100ad3:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100ada:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100add:	01 c2                	add    edx,eax
 3100adf:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 3100ae2:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:225
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 3100ae4:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:226
            argv[argc] = NULL;
 3100ae8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100aeb:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100af2:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100af5:	01 d0                	add    eax,edx
 3100af7:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:227
            input++;
 3100afd:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:228
            free(temp);
 3100b01:	83 ec 0c             	sub    esp,0xc
 3100b04:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100b07:	e8 14 07 00 00       	call   3101220 <kShell+0x52c>
 3100b0c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:231
          }
	}
      while (*input != EOS);
 3100b0f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b12:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100b15:	84 c0                	test   al,al
 3100b17:	0f 85 ed fd ff ff    	jne    310090a <buildargv+0x5a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:234
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 3100b1d:	83 ec 0c             	sub    esp,0xc
 3100b20:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100b23:	e8 f8 06 00 00       	call   3101220 <kShell+0x52c>
 3100b28:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:235
  free(nargv);
 3100b2b:	83 ec 0c             	sub    esp,0xc
 3100b2e:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100b31:	e8 ea 06 00 00       	call   3101220 <kShell+0x52c>
 3100b36:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:236
  return (argv);
 3100b39:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/kshell/src/kshell.c:237
}
 3100b3c:	c9                   	leave  
 3100b3d:	c3                   	ret    

03100b3e <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:240

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
 3100b3e:	55                   	push   ebp
 3100b3f:	89 e5                	mov    ebp,esp
 3100b41:	53                   	push   ebx
 3100b42:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:241
    for (int cnt=0;cnt<pcount;cnt++)
 3100b45:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100b4c:	eb 56                	jmp    3100ba4 <paramsToArgv+0x66>
/home/yogi/src/os/aproj/kshell/src/kshell.c:243 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 3100b4e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100b51:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100b58:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100b5b:	8d 1c 02             	lea    ebx,[edx+eax*1]
 3100b5e:	83 ec 0c             	sub    esp,0xc
 3100b61:	68 80 00 00 00       	push   0x80
 3100b66:	e8 85 05 00 00       	call   31010f0 <kShell+0x3fc>
 3100b6b:	83 c4 10             	add    esp,0x10
 3100b6e:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:244 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 3100b70:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100b73:	c1 e0 07             	shl    eax,0x7
 3100b76:	89 c2                	mov    edx,eax
 3100b78:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100b7b:	01 c2                	add    edx,eax
 3100b7d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100b80:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 3100b87:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100b8a:	01 c8                	add    eax,ecx
 3100b8c:	8b 00                	mov    eax,DWORD PTR [eax]
 3100b8e:	83 ec 04             	sub    esp,0x4
 3100b91:	68 80 00 00 00       	push   0x80
 3100b96:	52                   	push   edx
 3100b97:	50                   	push   eax
 3100b98:	e8 43 05 00 00       	call   31010e0 <kShell+0x3ec>
 3100b9d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:241 (discriminator 3)
  return (argv);
}

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
    for (int cnt=0;cnt<pcount;cnt++)
 3100ba0:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:241 (discriminator 1)
 3100ba4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100ba7:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100baa:	7c a2                	jl     3100b4e <paramsToArgv+0x10>
/home/yogi/src/os/aproj/kshell/src/kshell.c:246
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
 3100bac:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
/home/yogi/src/os/aproj/kshell/src/kshell.c:247
}
 3100baf:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100bb2:	c9                   	leave  
 3100bb3:	c3                   	ret    

03100bb4 <freeArgV>:
freeArgV():
/home/yogi/src/os/aproj/kshell/src/kshell.c:250

void freeArgV(int pcount, char **params)
{
 3100bb4:	55                   	push   ebp
 3100bb5:	89 e5                	mov    ebp,esp
 3100bb7:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:251
    for (int cnt=0;cnt<pcount;cnt++)
 3100bba:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100bc1:	eb 15                	jmp    3100bd8 <freeArgV+0x24>
/home/yogi/src/os/aproj/kshell/src/kshell.c:252 (discriminator 3)
        free(*params);
 3100bc3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100bc6:	8b 00                	mov    eax,DWORD PTR [eax]
 3100bc8:	83 ec 0c             	sub    esp,0xc
 3100bcb:	50                   	push   eax
 3100bcc:	e8 4f 06 00 00       	call   3101220 <kShell+0x52c>
 3100bd1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:251 (discriminator 3)
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 3100bd4:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:251 (discriminator 1)
 3100bd8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100bdb:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100bde:	7c e3                	jl     3100bc3 <freeArgV+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:253
        free(*params);
    free(params);
 3100be0:	83 ec 0c             	sub    esp,0xc
 3100be3:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100be6:	e8 35 06 00 00       	call   3101220 <kShell+0x52c>
 3100beb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:254
}
 3100bee:	90                   	nop
 3100bef:	c9                   	leave  
 3100bf0:	c3                   	ret    

03100bf1 <getEnvVariableValue>:
getEnvVariableValue():
/home/yogi/src/os/aproj/kshell/src/kshell.c:257

bool getEnvVariableValue(char* evName, char* value)
{
 3100bf1:	55                   	push   ebp
 3100bf2:	89 e5                	mov    ebp,esp
 3100bf4:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:259
    
    for (int cnt=0;cnt<50;cnt++)
 3100bf7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100bfe:	eb 70                	jmp    3100c70 <getEnvVariableValue+0x7f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:261
    {
        if (environmentLoc[cnt]!=0)
 3100c00:	a1 68 1f 10 03       	mov    eax,ds:0x3101f68
 3100c05:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100c08:	c1 e2 02             	shl    edx,0x2
 3100c0b:	01 d0                	add    eax,edx
 3100c0d:	8b 00                	mov    eax,DWORD PTR [eax]
 3100c0f:	85 c0                	test   eax,eax
 3100c11:	74 59                	je     3100c6c <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:263
        {
            char* idx = strstr((char*)environmentLoc[cnt],evName);
 3100c13:	a1 68 1f 10 03       	mov    eax,ds:0x3101f68
 3100c18:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100c1b:	c1 e2 02             	shl    edx,0x2
 3100c1e:	01 d0                	add    eax,edx
 3100c20:	8b 00                	mov    eax,DWORD PTR [eax]
 3100c22:	83 ec 08             	sub    esp,0x8
 3100c25:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100c28:	50                   	push   eax
 3100c29:	e8 32 05 00 00       	call   3101160 <kShell+0x46c>
 3100c2e:	83 c4 10             	add    esp,0x10
 3100c31:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:264
            if (idx>0)
 3100c34:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100c38:	74 32                	je     3100c6c <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:266
            {
                idx = strstr(idx,"=");
 3100c3a:	83 ec 08             	sub    esp,0x8
 3100c3d:	68 e9 14 10 03       	push   0x31014e9
 3100c42:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100c45:	e8 16 05 00 00       	call   3101160 <kShell+0x46c>
 3100c4a:	83 c4 10             	add    esp,0x10
 3100c4d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:268
                //++ because we don't want to include the = sign
                strcpy(value, ++idx);
 3100c50:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100c54:	83 ec 08             	sub    esp,0x8
 3100c57:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100c5a:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100c5d:	e8 0e 04 00 00       	call   3101070 <kShell+0x37c>
 3100c62:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:270
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
 3100c65:	b8 01 00 00 00       	mov    eax,0x1
 3100c6a:	eb 0f                	jmp    3100c7b <getEnvVariableValue+0x8a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:259 (discriminator 2)
}

bool getEnvVariableValue(char* evName, char* value)
{
    
    for (int cnt=0;cnt<50;cnt++)
 3100c6c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:259 (discriminator 1)
 3100c70:	83 7d f4 31          	cmp    DWORD PTR [ebp-0xc],0x31
 3100c74:	7e 8a                	jle    3100c00 <getEnvVariableValue+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:274
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
            }
        }
    } 
    return false;
 3100c76:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:275
}
 3100c7b:	c9                   	leave  
 3100c7c:	c3                   	ret    

03100c7d <saveCommand>:
saveCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:288
    
}
*/

void saveCommand(char* command)
{
 3100c7d:	55                   	push   ebp
 3100c7e:	89 e5                	mov    ebp,esp
 3100c80:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:289
    strcpy(commandHistory[commandHistoryMax++],command);
 3100c83:	a1 b0 22 10 03       	mov    eax,ds:0x31022b0
 3100c88:	8d 50 01             	lea    edx,[eax+0x1]
 3100c8b:	89 15 b0 22 10 03    	mov    DWORD PTR ds:0x31022b0,edx
 3100c91:	c1 e0 07             	shl    eax,0x7
 3100c94:	05 c0 22 10 03       	add    eax,0x31022c0
 3100c99:	83 ec 08             	sub    esp,0x8
 3100c9c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100c9f:	50                   	push   eax
 3100ca0:	e8 cb 03 00 00       	call   3101070 <kShell+0x37c>
 3100ca5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:290
}
 3100ca8:	90                   	nop
 3100ca9:	c9                   	leave  
 3100caa:	c3                   	ret    

03100cab <prompt>:
prompt():
/home/yogi/src/os/aproj/kshell/src/kshell.c:293

void prompt()
{
 3100cab:	55                   	push   ebp
 3100cac:	89 e5                	mov    ebp,esp
 3100cae:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:294
    print("%s %s> ",sExecutingProgram, cwd);
 3100cb1:	83 ec 04             	sub    esp,0x4
 3100cb4:	68 80 1f 10 03       	push   0x3101f80
 3100cb9:	68 80 20 10 03       	push   0x3102080
 3100cbe:	68 eb 14 10 03       	push   0x31014eb
 3100cc3:	e8 c8 03 00 00       	call   3101090 <kShell+0x39c>
 3100cc8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:295
}
 3100ccb:	90                   	nop
 3100ccc:	c9                   	leave  
 3100ccd:	c3                   	ret    

03100cce <reprintCommand>:
reprintCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:298

int reprintCommand(char* command)
{
 3100cce:	55                   	push   ebp
 3100ccf:	89 e5                	mov    ebp,esp
 3100cd1:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:299
    resetRow();
 3100cd4:	e8 d7 03 00 00       	call   31010b0 <kShell+0x3bc>
/home/yogi/src/os/aproj/kshell/src/kshell.c:300
    prompt();
 3100cd9:	e8 cd ff ff ff       	call   3100cab <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:301
    print("%s",command);
 3100cde:	83 ec 08             	sub    esp,0x8
 3100ce1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100ce4:	68 f3 14 10 03       	push   0x31014f3
 3100ce9:	e8 a2 03 00 00       	call   3101090 <kShell+0x39c>
 3100cee:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:303
 
}
 3100cf1:	90                   	nop
 3100cf2:	c9                   	leave  
 3100cf3:	c3                   	ret    

03100cf4 <kShell>:
kShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:307


int kShell(int argc, char** argv, char** envp)
{
 3100cf4:	55                   	push   ebp
 3100cf5:	89 e5                	mov    ebp,esp
 3100cf7:	81 ec 38 01 00 00    	sub    esp,0x138
/home/yogi/src/os/aproj/kshell/src/kshell.c:309
    char lCommand[256];
    uint8_t lCurrKey=0;
 3100cfd:	c6 85 eb fe ff ff 00 	mov    BYTE PTR [ebp-0x115],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:310
    int lCurrKeyCount=0;
 3100d04:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:311
    int commandWasFromThisBufferPtr=0;
 3100d0b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:314
    char ansiSeq[20];

    exitCode = 0;
 3100d12:	c7 05 9c 22 10 03 00 	mov    DWORD PTR ds:0x310229c,0x0
 3100d19:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/kshell.c:315
    timeToExit = false;
 3100d1c:	c6 05 a8 22 10 03 00 	mov    BYTE PTR ds:0x31022a8,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:316
    strcpy(delim," \t\n-,");
 3100d23:	83 ec 08             	sub    esp,0x8
 3100d26:	68 f6 14 10 03       	push   0x31014f6
 3100d2b:	68 60 1f 10 03       	push   0x3101f60
 3100d30:	e8 3b 03 00 00       	call   3101070 <kShell+0x37c>
 3100d35:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:317
    environmentLoc = envp;
 3100d38:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100d3b:	a3 68 1f 10 03       	mov    ds:0x3101f68,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:318
    ansiSeq[0]=0x1b;
 3100d40:	c6 85 d7 fe ff ff 1b 	mov    BYTE PTR [ebp-0x129],0x1b
/home/yogi/src/os/aproj/kshell/src/kshell.c:319
    sKShellProgramName=malloc(1024);
 3100d47:	83 ec 0c             	sub    esp,0xc
 3100d4a:	68 00 04 00 00       	push   0x400
 3100d4f:	e8 9c 03 00 00       	call   31010f0 <kShell+0x3fc>
 3100d54:	83 c4 10             	add    esp,0x10
 3100d57:	a3 a0 22 10 03       	mov    ds:0x31022a0,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:320
    strcpy(sKShellProgramName,"kShell");
 3100d5c:	a1 a0 22 10 03       	mov    eax,ds:0x31022a0
 3100d61:	83 ec 08             	sub    esp,0x8
 3100d64:	68 fc 14 10 03       	push   0x31014fc
 3100d69:	50                   	push   eax
 3100d6a:	e8 01 03 00 00       	call   3101070 <kShell+0x37c>
 3100d6f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:321
    strcpy(sExecutingProgram,sKShellProgramName);
 3100d72:	a1 a0 22 10 03       	mov    eax,ds:0x31022a0
 3100d77:	83 ec 08             	sub    esp,0x8
 3100d7a:	50                   	push   eax
 3100d7b:	68 80 20 10 03       	push   0x3102080
 3100d80:	e8 eb 02 00 00       	call   3101070 <kShell+0x37c>
 3100d85:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:324
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 3100d88:	e9 a8 02 00 00       	jmp    3101035 <kShell+0x341>
/home/yogi/src/os/aproj/kshell/src/kshell.c:327
    {
getACommand:
        commandHistoryPtr = commandHistoryMax;
 3100d8d:	a1 b0 22 10 03       	mov    eax,ds:0x31022b0
 3100d92:	a3 ac 22 10 03       	mov    ds:0x31022ac,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:328
        commandWasFromThisBufferPtr = -1;
 3100d97:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:329
        lCurrKey=0;
 3100d9e:	c6 85 eb fe ff ff 00 	mov    BYTE PTR [ebp-0x115],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:330
        lCurrKeyCount=0;
 3100da5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:331
        memset(lCommand,0,256);
 3100dac:	83 ec 04             	sub    esp,0x4
 3100daf:	68 00 01 00 00       	push   0x100
 3100db4:	6a 00                	push   0x0
 3100db6:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100dbc:	50                   	push   eax
 3100dbd:	e8 fe 03 00 00       	call   31011c0 <kShell+0x4cc>
 3100dc2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:332
        getenv("CWD",cwd);
 3100dc5:	83 ec 08             	sub    esp,0x8
 3100dc8:	68 80 1f 10 03       	push   0x3101f80
 3100dcd:	68 03 15 10 03       	push   0x3101503
 3100dd2:	e8 e9 02 00 00       	call   31010c0 <kShell+0x3cc>
 3100dd7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:333
        prompt();
 3100dda:	e8 cc fe ff ff       	call   3100cab <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:335
getAKey:
        lCurrKey=0;
 3100ddf:	c6 85 eb fe ff ff 00 	mov    BYTE PTR [ebp-0x115],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:336
        while(lCurrKey==0)
 3100de6:	eb 16                	jmp    3100dfe <kShell+0x10a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:338
        {
            gets(&lCurrKey,1,1);
 3100de8:	83 ec 04             	sub    esp,0x4
 3100deb:	6a 01                	push   0x1
 3100ded:	6a 01                	push   0x1
 3100def:	8d 85 eb fe ff ff    	lea    eax,[ebp-0x115]
 3100df5:	50                   	push   eax
 3100df6:	e8 d5 02 00 00       	call   31010d0 <kShell+0x3dc>
 3100dfb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:336
        memset(lCommand,0,256);
        getenv("CWD",cwd);
        prompt();
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 3100dfe:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100e05:	84 c0                	test   al,al
 3100e07:	74 df                	je     3100de8 <kShell+0xf4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:341
        {
            gets(&lCurrKey,1,1);
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 3100e09:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100e10:	3c c8                	cmp    al,0xc8
 3100e12:	75 76                	jne    3100e8a <kShell+0x196>
/home/yogi/src/os/aproj/kshell/src/kshell.c:343
        {
            if (commandHistoryPtr>=0)
 3100e14:	a1 ac 22 10 03       	mov    eax,ds:0x31022ac
 3100e19:	85 c0                	test   eax,eax
 3100e1b:	78 c2                	js     3100ddf <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:346
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
 3100e1d:	a1 ac 22 10 03       	mov    eax,ds:0x31022ac
 3100e22:	83 e8 01             	sub    eax,0x1
 3100e25:	85 c0                	test   eax,eax
 3100e27:	78 b6                	js     3100ddf <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:348
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
 3100e29:	a1 ac 22 10 03       	mov    eax,ds:0x31022ac
 3100e2e:	83 e8 01             	sub    eax,0x1
 3100e31:	a3 ac 22 10 03       	mov    ds:0x31022ac,eax
 3100e36:	a1 ac 22 10 03       	mov    eax,ds:0x31022ac
 3100e3b:	c1 e0 07             	shl    eax,0x7
 3100e3e:	05 c0 22 10 03       	add    eax,0x31022c0
 3100e43:	83 ec 08             	sub    esp,0x8
 3100e46:	50                   	push   eax
 3100e47:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100e4d:	50                   	push   eax
 3100e4e:	e8 1d 02 00 00       	call   3101070 <kShell+0x37c>
 3100e53:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:349
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 3100e56:	a1 ac 22 10 03       	mov    eax,ds:0x31022ac
 3100e5b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:350
                    reprintCommand(lCommand);
 3100e5e:	83 ec 0c             	sub    esp,0xc
 3100e61:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100e67:	50                   	push   eax
 3100e68:	e8 61 fe ff ff       	call   3100cce <reprintCommand>
 3100e6d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:351
                    lCurrKeyCount=strlen(lCommand);
 3100e70:	83 ec 0c             	sub    esp,0xc
 3100e73:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100e79:	50                   	push   eax
 3100e7a:	e8 81 03 00 00       	call   3101200 <kShell+0x50c>
 3100e7f:	83 c4 10             	add    esp,0x10
 3100e82:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:353
                }
                goto getAKey;
 3100e85:	e9 55 ff ff ff       	jmp    3100ddf <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:358
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
 3100e8a:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100e91:	3c d0                	cmp    al,0xd0
 3100e93:	0f 85 99 00 00 00    	jne    3100f32 <kShell+0x23e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:360
        {
            if (commandHistoryPtr>=0)
 3100e99:	a1 ac 22 10 03       	mov    eax,ds:0x31022ac
 3100e9e:	85 c0                	test   eax,eax
 3100ea0:	0f 88 39 ff ff ff    	js     3100ddf <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:363
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<=commandHistoryMax)
 3100ea6:	a1 ac 22 10 03       	mov    eax,ds:0x31022ac
 3100eab:	8d 50 01             	lea    edx,[eax+0x1]
 3100eae:	a1 b0 22 10 03       	mov    eax,ds:0x31022b0
 3100eb3:	39 c2                	cmp    edx,eax
 3100eb5:	0f 8f 24 ff ff ff    	jg     3100ddf <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:365
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
 3100ebb:	a1 ac 22 10 03       	mov    eax,ds:0x31022ac
 3100ec0:	83 c0 01             	add    eax,0x1
 3100ec3:	a3 ac 22 10 03       	mov    ds:0x31022ac,eax
 3100ec8:	a1 ac 22 10 03       	mov    eax,ds:0x31022ac
 3100ecd:	c1 e0 07             	shl    eax,0x7
 3100ed0:	05 c0 22 10 03       	add    eax,0x31022c0
 3100ed5:	83 ec 08             	sub    esp,0x8
 3100ed8:	50                   	push   eax
 3100ed9:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100edf:	50                   	push   eax
 3100ee0:	e8 8b 01 00 00       	call   3101070 <kShell+0x37c>
 3100ee5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:366
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 3100ee8:	a1 ac 22 10 03       	mov    eax,ds:0x31022ac
 3100eed:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:367
                    if (commandHistoryPtr>=commandHistoryMax)
 3100ef0:	8b 15 ac 22 10 03    	mov    edx,DWORD PTR ds:0x31022ac
 3100ef6:	a1 b0 22 10 03       	mov    eax,ds:0x31022b0
 3100efb:	39 c2                	cmp    edx,eax
 3100efd:	7c 07                	jl     3100f06 <kShell+0x212>
/home/yogi/src/os/aproj/kshell/src/kshell.c:368
                        commandWasFromThisBufferPtr=-1;
 3100eff:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:369
                    reprintCommand(lCommand);
 3100f06:	83 ec 0c             	sub    esp,0xc
 3100f09:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100f0f:	50                   	push   eax
 3100f10:	e8 b9 fd ff ff       	call   3100cce <reprintCommand>
 3100f15:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:370
                    lCurrKeyCount=strlen(lCommand);
 3100f18:	83 ec 0c             	sub    esp,0xc
 3100f1b:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100f21:	50                   	push   eax
 3100f22:	e8 d9 02 00 00       	call   3101200 <kShell+0x50c>
 3100f27:	83 c4 10             	add    esp,0x10
 3100f2a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:372
                }
                goto getAKey;
 3100f2d:	e9 ad fe ff ff       	jmp    3100ddf <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:377
            }
            else
                goto getAKey;
        }   
        else if (lCurrKey==0xcb) //left
 3100f32:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100f39:	3c cb                	cmp    al,0xcb
 3100f3b:	75 23                	jne    3100f60 <kShell+0x26c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:379
        {
            if (lCurrKeyCount>0)
 3100f3d:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100f41:	0f 8e 98 fe ff ff    	jle    3100ddf <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:381
            {
                print("\033[1D");
 3100f47:	83 ec 0c             	sub    esp,0xc
 3100f4a:	68 07 15 10 03       	push   0x3101507
 3100f4f:	e8 3c 01 00 00       	call   3101090 <kShell+0x39c>
 3100f54:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:382
                lCurrKeyCount--;
 3100f57:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:385
            }
             
            goto getAKey;
 3100f5b:	e9 7f fe ff ff       	jmp    3100ddf <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:387
        }
        else if (lCurrKey==0xcd) //right
 3100f60:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100f67:	3c cd                	cmp    al,0xcd
 3100f69:	0f 84 70 fe ff ff    	je     3100ddf <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:390
        {
        }
        else if (lCurrKey=='\b') //backspace
 3100f6f:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100f76:	3c 08                	cmp    al,0x8
 3100f78:	75 1b                	jne    3100f95 <kShell+0x2a1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:392
        {
            lCurrKeyCount--;
 3100f7a:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:393
            lCommand[lCurrKeyCount]='\0';
 3100f7e:	8d 95 ec fe ff ff    	lea    edx,[ebp-0x114]
 3100f84:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100f87:	01 d0                	add    eax,edx
 3100f89:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:394
            if (lCurrKeyCount>0)
 3100f8c:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100f90:	e9 4a fe ff ff       	jmp    3100ddf <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:406
                cursorMoveTo(cursorGetPosX()-1,lTemp);*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa) //Enter
 3100f95:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100f9c:	3c 0a                	cmp    al,0xa
 3100f9e:	75 21                	jne    3100fc1 <kShell+0x2cd>
/home/yogi/src/os/aproj/kshell/src/kshell.c:408
        {
            print("\n");
 3100fa0:	83 ec 0c             	sub    esp,0xc
 3100fa3:	68 0c 15 10 03       	push   0x310150c
 3100fa8:	e8 e3 00 00 00       	call   3101090 <kShell+0x39c>
 3100fad:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:409
            goto doneGettingKeys;
 3100fb0:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:421
            commandWasFromThisBufferPtr=-1;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 3100fb1:	0f b6 85 ec fe ff ff 	movzx  eax,BYTE PTR [ebp-0x114]
 3100fb8:	84 c0                	test   al,al
 3100fba:	75 3a                	jne    3100ff6 <kShell+0x302>
 3100fbc:	e9 cc fd ff ff       	jmp    3100d8d <kShell+0x99>
/home/yogi/src/os/aproj/kshell/src/kshell.c:413
            print("\n");
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3100fc1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100fc4:	8d 50 01             	lea    edx,[eax+0x1]
 3100fc7:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100fca:	0f b6 95 eb fe ff ff 	movzx  edx,BYTE PTR [ebp-0x115]
 3100fd1:	88 94 05 ec fe ff ff 	mov    BYTE PTR [ebp+eax*1-0x114],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:414
            reprintCommand(lCommand);
 3100fd8:	83 ec 0c             	sub    esp,0xc
 3100fdb:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100fe1:	50                   	push   eax
 3100fe2:	e8 e7 fc ff ff       	call   3100cce <reprintCommand>
 3100fe7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:416
            //Reset pointer to command buffer so that this possibly modified command gets written as a new one
            commandWasFromThisBufferPtr=-1;
 3100fea:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:418
        }
        goto getAKey;
 3100ff1:	e9 e9 fd ff ff       	jmp    3100ddf <kShell+0xeb>
/home/yogi/src/os/aproj/kshell/src/kshell.c:423
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
            goto getACommand;
        if (commandWasFromThisBufferPtr == -1)
 3100ff6:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
 3100ffa:	75 12                	jne    310100e <kShell+0x31a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:424
            saveCommand(lCommand);
 3100ffc:	83 ec 0c             	sub    esp,0xc
 3100fff:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3101005:	50                   	push   eax
 3101006:	e8 72 fc ff ff       	call   3100c7d <saveCommand>
 310100b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:425
        int i = findCommand(lCommand);
 310100e:	83 ec 0c             	sub    esp,0xc
 3101011:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3101017:	50                   	push   eax
 3101018:	e8 2a f8 ff ff       	call   3100847 <findCommand>
 310101d:	83 c4 10             	add    esp,0x10
 3101020:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:426
        execInternalCommand(lCommand);
 3101023:	83 ec 0c             	sub    esp,0xc
 3101026:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 310102c:	50                   	push   eax
 310102d:	e8 c6 f5 ff ff       	call   31005f8 <execInternalCommand>
 3101032:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:324
    sKShellProgramName=malloc(1024);
    strcpy(sKShellProgramName,"kShell");
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 3101035:	0f b6 05 a8 22 10 03 	movzx  eax,BYTE PTR ds:0x31022a8
 310103c:	83 f0 01             	xor    eax,0x1
 310103f:	84 c0                	test   al,al
 3101041:	0f 85 46 fd ff ff    	jne    3100d8d <kShell+0x99>
/home/yogi/src/os/aproj/kshell/src/kshell.c:428
        if (commandWasFromThisBufferPtr == -1)
            saveCommand(lCommand);
        int i = findCommand(lCommand);
        execInternalCommand(lCommand);
    }
    free(sKShellProgramName);
 3101047:	a1 a0 22 10 03       	mov    eax,ds:0x31022a0
 310104c:	83 ec 0c             	sub    esp,0xc
 310104f:	50                   	push   eax
 3101050:	e8 cb 01 00 00       	call   3101220 <kShell+0x52c>
 3101055:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:429
    return exitCode;
 3101058:	a1 9c 22 10 03       	mov    eax,ds:0x310229c
/home/yogi/src/os/aproj/kshell/src/kshell.c:430
}
 310105d:	c9                   	leave  
 310105e:	c3                   	ret    

Disassembly of section .plt:

03101060 <.plt>:
 3101060:	ff 35 d4 1e 10 03    	push   DWORD PTR ds:0x3101ed4
 3101066:	ff 25 d8 1e 10 03    	jmp    DWORD PTR ds:0x3101ed8
 310106c:	00 00                	add    BYTE PTR [eax],al
 310106e:	00 00                	add    BYTE PTR [eax],al
 3101070:	ff 25 dc 1e 10 03    	jmp    DWORD PTR ds:0x3101edc
 3101076:	68 00 00 00 00       	push   0x0
 310107b:	e9 e0 ff ff ff       	jmp    3101060 <kShell+0x36c>
 3101080:	ff 25 e0 1e 10 03    	jmp    DWORD PTR ds:0x3101ee0
 3101086:	68 08 00 00 00       	push   0x8
 310108b:	e9 d0 ff ff ff       	jmp    3101060 <kShell+0x36c>
 3101090:	ff 25 e4 1e 10 03    	jmp    DWORD PTR ds:0x3101ee4
 3101096:	68 10 00 00 00       	push   0x10
 310109b:	e9 c0 ff ff ff       	jmp    3101060 <kShell+0x36c>
 31010a0:	ff 25 e8 1e 10 03    	jmp    DWORD PTR ds:0x3101ee8
 31010a6:	68 18 00 00 00       	push   0x18
 31010ab:	e9 b0 ff ff ff       	jmp    3101060 <kShell+0x36c>
 31010b0:	ff 25 ec 1e 10 03    	jmp    DWORD PTR ds:0x3101eec
 31010b6:	68 20 00 00 00       	push   0x20
 31010bb:	e9 a0 ff ff ff       	jmp    3101060 <kShell+0x36c>
 31010c0:	ff 25 f0 1e 10 03    	jmp    DWORD PTR ds:0x3101ef0
 31010c6:	68 28 00 00 00       	push   0x28
 31010cb:	e9 90 ff ff ff       	jmp    3101060 <kShell+0x36c>
 31010d0:	ff 25 f4 1e 10 03    	jmp    DWORD PTR ds:0x3101ef4
 31010d6:	68 30 00 00 00       	push   0x30
 31010db:	e9 80 ff ff ff       	jmp    3101060 <kShell+0x36c>
 31010e0:	ff 25 f8 1e 10 03    	jmp    DWORD PTR ds:0x3101ef8
 31010e6:	68 38 00 00 00       	push   0x38
 31010eb:	e9 70 ff ff ff       	jmp    3101060 <kShell+0x36c>
 31010f0:	ff 25 fc 1e 10 03    	jmp    DWORD PTR ds:0x3101efc
 31010f6:	68 40 00 00 00       	push   0x40
 31010fb:	e9 60 ff ff ff       	jmp    3101060 <kShell+0x36c>
 3101100:	ff 25 00 1f 10 03    	jmp    DWORD PTR ds:0x3101f00
 3101106:	68 48 00 00 00       	push   0x48
 310110b:	e9 50 ff ff ff       	jmp    3101060 <kShell+0x36c>
 3101110:	ff 25 04 1f 10 03    	jmp    DWORD PTR ds:0x3101f04
 3101116:	68 50 00 00 00       	push   0x50
 310111b:	e9 40 ff ff ff       	jmp    3101060 <kShell+0x36c>
 3101120:	ff 25 08 1f 10 03    	jmp    DWORD PTR ds:0x3101f08
 3101126:	68 58 00 00 00       	push   0x58
 310112b:	e9 30 ff ff ff       	jmp    3101060 <kShell+0x36c>
 3101130:	ff 25 0c 1f 10 03    	jmp    DWORD PTR ds:0x3101f0c
 3101136:	68 60 00 00 00       	push   0x60
 310113b:	e9 20 ff ff ff       	jmp    3101060 <kShell+0x36c>
 3101140:	ff 25 10 1f 10 03    	jmp    DWORD PTR ds:0x3101f10
 3101146:	68 68 00 00 00       	push   0x68
 310114b:	e9 10 ff ff ff       	jmp    3101060 <kShell+0x36c>
 3101150:	ff 25 14 1f 10 03    	jmp    DWORD PTR ds:0x3101f14
 3101156:	68 70 00 00 00       	push   0x70
 310115b:	e9 00 ff ff ff       	jmp    3101060 <kShell+0x36c>
 3101160:	ff 25 18 1f 10 03    	jmp    DWORD PTR ds:0x3101f18
 3101166:	68 78 00 00 00       	push   0x78
 310116b:	e9 f0 fe ff ff       	jmp    3101060 <kShell+0x36c>
 3101170:	ff 25 1c 1f 10 03    	jmp    DWORD PTR ds:0x3101f1c
 3101176:	68 80 00 00 00       	push   0x80
 310117b:	e9 e0 fe ff ff       	jmp    3101060 <kShell+0x36c>
 3101180:	ff 25 20 1f 10 03    	jmp    DWORD PTR ds:0x3101f20
 3101186:	68 88 00 00 00       	push   0x88
 310118b:	e9 d0 fe ff ff       	jmp    3101060 <kShell+0x36c>
 3101190:	ff 25 24 1f 10 03    	jmp    DWORD PTR ds:0x3101f24
 3101196:	68 90 00 00 00       	push   0x90
 310119b:	e9 c0 fe ff ff       	jmp    3101060 <kShell+0x36c>
 31011a0:	ff 25 28 1f 10 03    	jmp    DWORD PTR ds:0x3101f28
 31011a6:	68 98 00 00 00       	push   0x98
 31011ab:	e9 b0 fe ff ff       	jmp    3101060 <kShell+0x36c>
 31011b0:	ff 25 2c 1f 10 03    	jmp    DWORD PTR ds:0x3101f2c
 31011b6:	68 a0 00 00 00       	push   0xa0
 31011bb:	e9 a0 fe ff ff       	jmp    3101060 <kShell+0x36c>
 31011c0:	ff 25 30 1f 10 03    	jmp    DWORD PTR ds:0x3101f30
 31011c6:	68 a8 00 00 00       	push   0xa8
 31011cb:	e9 90 fe ff ff       	jmp    3101060 <kShell+0x36c>
 31011d0:	ff 25 34 1f 10 03    	jmp    DWORD PTR ds:0x3101f34
 31011d6:	68 b0 00 00 00       	push   0xb0
 31011db:	e9 80 fe ff ff       	jmp    3101060 <kShell+0x36c>
 31011e0:	ff 25 38 1f 10 03    	jmp    DWORD PTR ds:0x3101f38
 31011e6:	68 b8 00 00 00       	push   0xb8
 31011eb:	e9 70 fe ff ff       	jmp    3101060 <kShell+0x36c>
 31011f0:	ff 25 3c 1f 10 03    	jmp    DWORD PTR ds:0x3101f3c
 31011f6:	68 c0 00 00 00       	push   0xc0
 31011fb:	e9 60 fe ff ff       	jmp    3101060 <kShell+0x36c>
 3101200:	ff 25 40 1f 10 03    	jmp    DWORD PTR ds:0x3101f40
 3101206:	68 c8 00 00 00       	push   0xc8
 310120b:	e9 50 fe ff ff       	jmp    3101060 <kShell+0x36c>
 3101210:	ff 25 44 1f 10 03    	jmp    DWORD PTR ds:0x3101f44
 3101216:	68 d0 00 00 00       	push   0xd0
 310121b:	e9 40 fe ff ff       	jmp    3101060 <kShell+0x36c>
 3101220:	ff 25 48 1f 10 03    	jmp    DWORD PTR ds:0x3101f48
 3101226:	68 d8 00 00 00       	push   0xd8
 310122b:	e9 30 fe ff ff       	jmp    3101060 <kShell+0x36c>

Disassembly of section .rodata:

03101230 <.rodata>:
 3101230:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101232:	76 00                	jbe    3101234 <kShell+0x540>
 3101234:	50                   	push   eax
 3101235:	72 69                	jb     31012a0 <kShell+0x5ac>
 3101237:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101238:	74 20                	je     310125a <kShell+0x566>
 310123a:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 310123c:	76 69                	jbe    31012a7 <kShell+0x5b3>
 310123e:	72 6f                	jb     31012af <kShell+0x5bb>
 3101240:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101241:	6d                   	ins    DWORD PTR es:[edi],dx
 3101242:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101244:	74 00                	je     3101246 <kShell+0x552>
 3101246:	65                   	gs
 3101247:	78 65                	js     31012ae <kShell+0x5ba>
 3101249:	63 00                	arpl   WORD PTR [eax],ax
 310124b:	45                   	inc    ebp
 310124c:	78 65                	js     31012b3 <kShell+0x5bf>
 310124e:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101251:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3101255:	70 72                	jo     31012c9 <kShell+0x5d5>
 3101257:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101258:	67 72 61             	addr16 jb 31012bc <kShell+0x5c8>
 310125b:	6d                   	ins    DWORD PTR es:[edi],dx
 310125c:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 310125f:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 3101266:	20 
 3101267:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 310126b:	6c                   	ins    BYTE PTR es:[edi],dx
 310126c:	6c                   	ins    BYTE PTR es:[edi],dx
 310126d:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3101270:	6c                   	ins    BYTE PTR es:[edi],dx
 3101271:	70 00                	jo     3101273 <kShell+0x57f>
 3101273:	47                   	inc    edi
 3101274:	65                   	gs
 3101275:	74 20                	je     3101297 <kShell+0x5a3>
 3101277:	68 65 6c 70 20       	push   0x20706c65
 310127c:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3101280:	73 20                	jae    31012a2 <kShell+0x5ae>
 3101282:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3101289:	74 69                	je     31012f4 <kShell+0x600>
 310128b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310128c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310128d:	29 00                	sub    DWORD PTR [eax],eax
 310128f:	70 77                	jo     3101308 <kShell+0x614>
 3101291:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 3101295:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 310129c:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 31012a0:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 31012a4:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 31012a9:	79 00                	jns    31012ab <kShell+0x5b7>
 31012ab:	73 65                	jae    3101312 <kShell+0x61e>
 31012ad:	74 00                	je     31012af <kShell+0x5bb>
 31012af:	53                   	push   ebx
 31012b0:	65                   	gs
 31012b1:	74 20                	je     31012d3 <kShell+0x5df>
 31012b3:	61                   	popa   
 31012b4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31012b5:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 31012b8:	76 69                	jbe    3101323 <kShell+0x62f>
 31012ba:	72 6f                	jb     310132b <kShell+0x637>
 31012bc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31012bd:	6d                   	ins    DWORD PTR es:[edi],dx
 31012be:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31012c0:	74 20                	je     31012e2 <kShell+0x5ee>
 31012c2:	76 61                	jbe    3101325 <kShell+0x631>
 31012c4:	72 69                	jb     310132f <kShell+0x63b>
 31012c6:	61                   	popa   
 31012c7:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 31012cb:	73 6c                	jae    3101339 <kShell+0x645>
 31012cd:	65                   	gs
 31012ce:	65                   	gs
 31012cf:	70 00                	jo     31012d1 <kShell+0x5dd>
 31012d1:	53                   	push   ebx
 31012d2:	6c                   	ins    BYTE PTR es:[edi],dx
 31012d3:	65                   	gs
 31012d4:	65                   	gs
 31012d5:	70 20                	jo     31012f7 <kShell+0x603>
 31012d7:	66 6f                	outs   dx,WORD PTR ds:[esi]
 31012d9:	72 20                	jb     31012fb <kShell+0x607>
 31012db:	78 20                	js     31012fd <kShell+0x609>
 31012dd:	73 65                	jae    3101344 <kShell+0x650>
 31012df:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 31012e2:	64                   	fs
 31012e3:	73 00                	jae    31012e5 <kShell+0x5f1>
 31012e5:	74 69                	je     3101350 <kShell+0x65c>
 31012e7:	6d                   	ins    DWORD PTR es:[edi],dx
 31012e8:	65 00 00             	add    BYTE PTR gs:[eax],al
 31012eb:	00 54 69 6d          	add    BYTE PTR [ecx+ebp*2+0x6d],dl
 31012ef:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 31012f3:	70 72                	jo     3101367 <kShell+0x673>
 31012f5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31012f6:	67 72 61             	addr16 jb 310135a <kShell+0x666>
 31012f9:	6d                   	ins    DWORD PTR es:[edi],dx
 31012fa:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 31012fd:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 3101304:	72 
 3101305:	75 6e                	jne    3101375 <kShell+0x681>
 3101307:	73 2e                	jae    3101337 <kShell+0x643>
 3101309:	0a 09                	or     cl,BYTE PTR [ecx]
 310130b:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 310130e:	61                   	popa   
 310130f:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 3101313:	74 69                	je     310137e <kShell+0x68a>
 3101315:	6d                   	ins    DWORD PTR es:[edi],dx
 3101316:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 310131a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310131b:	67 72 61             	addr16 jb 310137f <kShell+0x68b>
 310131e:	6d                   	ins    DWORD PTR es:[edi],dx
 310131f:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 3101322:	61                   	popa   
 3101323:	72 61                	jb     3101386 <kShell+0x692>
 3101325:	6d                   	ins    DWORD PTR es:[edi],dx
 3101326:	65                   	gs
 3101327:	74 65                	je     310138e <kShell+0x69a>
 3101329:	72 73                	jb     310139e <kShell+0x6aa>
 310132b:	5d                   	pop    ebp
 310132c:	00 25 73 0a 00 3d    	add    BYTE PTR ds:0x3d000a73,ah
 3101332:	00 55 73             	add    BYTE PTR [ebp+0x73],dl
 3101335:	61                   	popa   
 3101336:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 310133a:	73 65                	jae    31013a1 <kShell+0x6ad>
 310133c:	74 20                	je     310135e <kShell+0x66a>
 310133e:	76 61                	jbe    31013a1 <kShell+0x6ad>
 3101340:	72 69                	jb     31013ab <kShell+0x6b7>
 3101342:	61                   	popa   
 3101343:	62 6c 65 3d          	bound  ebp,QWORD PTR [ebp+eiz*2+0x3d]
 3101347:	76 61                	jbe    31013aa <kShell+0x6b6>
 3101349:	6c                   	ins    BYTE PTR es:[edi],dx
 310134a:	75 65                	jne    31013b1 <kShell+0x6bd>
 310134c:	0a 00                	or     al,BYTE PTR [eax]
 310134e:	4c                   	dec    esp
 310134f:	41                   	inc    ecx
 3101350:	53                   	push   ebx
 3101351:	54                   	push   esp
 3101352:	45                   	inc    ebp
 3101353:	58                   	pop    eax
 3101354:	49                   	dec    ecx
 3101355:	54                   	push   esp
 3101356:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 3101359:	72 6f                	jb     31013ca <kShell+0x6d6>
 310135b:	72 20                	jb     310137d <kShell+0x689>
 310135d:	65                   	gs
 310135e:	78 65                	js     31013c5 <kShell+0x6d1>
 3101360:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101363:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 310136a:	00 46 6f             	add    BYTE PTR [esi+0x6f],al
 310136d:	72 6b                	jb     31013da <kShell+0x6e6>
 310136f:	20 65 72             	and    BYTE PTR [ebp+0x72],ah
 3101372:	72 6f                	jb     31013e3 <kShell+0x6ef>
 3101374:	72 20                	jb     3101396 <kShell+0x6a2>
 3101376:	25 75 00 43 61       	and    eax,0x61430075
 310137b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310137c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310137d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310137e:	74 20                	je     31013a0 <kShell+0x6ac>
 3101380:	65                   	gs
 3101381:	78 65                	js     31013e8 <kShell+0x6f4>
 3101383:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101386:	65 20 25 73 0a 00 25 	and    BYTE PTR gs:0x25000a73,ah
 310138d:	75 20                	jne    31013af <kShell+0x6bb>
 310138f:	74 69                	je     31013fa <kShell+0x706>
 3101391:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 3101394:	0a 00                	or     al,BYTE PTR [eax]
 3101396:	48                   	dec    eax
 3101397:	65                   	gs
 3101398:	6c                   	ins    BYTE PTR es:[edi],dx
 3101399:	70 3a                	jo     31013d5 <kShell+0x6e1>
 310139b:	20 25 73 0a 00 09    	and    BYTE PTR ds:0x9000a73,ah
 31013a1:	25 73 3a 20 25       	and    eax,0x25203a73
 31013a6:	73 0a                	jae    31013b2 <kShell+0x6be>
 31013a8:	00 00                	add    BYTE PTR [eax],al
 31013aa:	00 00                	add    BYTE PTR [eax],al
 31013ac:	52                   	push   edx
 31013ad:	65                   	gs
 31013ae:	71 75                	jno    3101425 <kShell+0x731>
 31013b0:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 31013b7:	70 61                	jo     310141a <kShell+0x726>
 31013b9:	72 61                	jb     310141c <kShell+0x728>
 31013bb:	6d                   	ins    DWORD PTR es:[edi],dx
 31013bc:	65                   	gs
 31013bd:	74 65                	je     3101424 <kShell+0x730>
 31013bf:	72 20                	jb     31013e1 <kShell+0x6ed>
 31013c1:	77 68                	ja     310142b <kShell+0x737>
 31013c3:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 31013ca:	74 68                	je     3101434 <kShell+0x740>
 31013cc:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 31013d0:	6d                   	ins    DWORD PTR es:[edi],dx
 31013d1:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 31013d4:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 31013d7:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 31013da:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 31013dd:	64                   	fs
 31013de:	73 20                	jae    3101400 <kShell+0x70c>
 31013e0:	74 6f                	je     3101451 <kShell+0x75d>
 31013e2:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 31013e5:	65                   	gs
 31013e6:	65                   	gs
 31013e7:	70 0a                	jo     31013f3 <kShell+0x6ff>
 31013e9:	00 00                	add    BYTE PTR [eax],al
 31013eb:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 31013ee:	76 00                	jbe    31013f0 <kShell+0x6fc>
 31013f0:	50                   	push   eax
 31013f1:	72 69                	jb     310145c <kShell+0x768>
 31013f3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31013f4:	74 20                	je     3101416 <kShell+0x722>
 31013f6:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31013f8:	76 69                	jbe    3101463 <kShell+0x76f>
 31013fa:	72 6f                	jb     310146b <kShell+0x777>
 31013fc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31013fd:	6d                   	ins    DWORD PTR es:[edi],dx
 31013fe:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101400:	74 00                	je     3101402 <kShell+0x70e>
 3101402:	65                   	gs
 3101403:	78 65                	js     310146a <kShell+0x776>
 3101405:	63 00                	arpl   WORD PTR [eax],ax
 3101407:	45                   	inc    ebp
 3101408:	78 65                	js     310146f <kShell+0x77b>
 310140a:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 310140d:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3101411:	70 72                	jo     3101485 <kShell+0x791>
 3101413:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101414:	67 72 61             	addr16 jb 3101478 <kShell+0x784>
 3101417:	6d                   	ins    DWORD PTR es:[edi],dx
 3101418:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 310141b:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 3101422:	20 
 3101423:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3101427:	6c                   	ins    BYTE PTR es:[edi],dx
 3101428:	6c                   	ins    BYTE PTR es:[edi],dx
 3101429:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 310142c:	6c                   	ins    BYTE PTR es:[edi],dx
 310142d:	70 00                	jo     310142f <kShell+0x73b>
 310142f:	47                   	inc    edi
 3101430:	65                   	gs
 3101431:	74 20                	je     3101453 <kShell+0x75f>
 3101433:	68 65 6c 70 20       	push   0x20706c65
 3101438:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 310143c:	73 20                	jae    310145e <kShell+0x76a>
 310143e:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3101445:	74 69                	je     31014b0 <kShell+0x7bc>
 3101447:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101448:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101449:	29 00                	sub    DWORD PTR [eax],eax
 310144b:	70 77                	jo     31014c4 <kShell+0x7d0>
 310144d:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 3101451:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3101458:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 310145c:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 3101460:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3101465:	79 00                	jns    3101467 <kShell+0x773>
 3101467:	73 65                	jae    31014ce <kShell+0x7da>
 3101469:	74 00                	je     310146b <kShell+0x777>
 310146b:	53                   	push   ebx
 310146c:	65                   	gs
 310146d:	74 20                	je     310148f <kShell+0x79b>
 310146f:	61                   	popa   
 3101470:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101471:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 3101474:	76 69                	jbe    31014df <kShell+0x7eb>
 3101476:	72 6f                	jb     31014e7 <kShell+0x7f3>
 3101478:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101479:	6d                   	ins    DWORD PTR es:[edi],dx
 310147a:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 310147c:	74 20                	je     310149e <kShell+0x7aa>
 310147e:	76 61                	jbe    31014e1 <kShell+0x7ed>
 3101480:	72 69                	jb     31014eb <kShell+0x7f7>
 3101482:	61                   	popa   
 3101483:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 3101487:	73 6c                	jae    31014f5 <kShell+0x801>
 3101489:	65                   	gs
 310148a:	65                   	gs
 310148b:	70 00                	jo     310148d <kShell+0x799>
 310148d:	53                   	push   ebx
 310148e:	6c                   	ins    BYTE PTR es:[edi],dx
 310148f:	65                   	gs
 3101490:	65                   	gs
 3101491:	70 20                	jo     31014b3 <kShell+0x7bf>
 3101493:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3101495:	72 20                	jb     31014b7 <kShell+0x7c3>
 3101497:	78 20                	js     31014b9 <kShell+0x7c5>
 3101499:	73 65                	jae    3101500 <kShell+0x80c>
 310149b:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 310149e:	64                   	fs
 310149f:	73 00                	jae    31014a1 <kShell+0x7ad>
 31014a1:	74 69                	je     310150c <kShell+0x818>
 31014a3:	6d                   	ins    DWORD PTR es:[edi],dx
 31014a4:	65 00 00             	add    BYTE PTR gs:[eax],al
 31014a7:	00 54 69 6d          	add    BYTE PTR [ecx+ebp*2+0x6d],dl
 31014ab:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 31014af:	70 72                	jo     3101523 <kShell+0x82f>
 31014b1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31014b2:	67 72 61             	addr16 jb 3101516 <kShell+0x822>
 31014b5:	6d                   	ins    DWORD PTR es:[edi],dx
 31014b6:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 31014b9:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 31014c0:	72 
 31014c1:	75 6e                	jne    3101531 <kShell+0x83d>
 31014c3:	73 2e                	jae    31014f3 <kShell+0x7ff>
 31014c5:	0a 09                	or     cl,BYTE PTR [ecx]
 31014c7:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 31014ca:	61                   	popa   
 31014cb:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 31014cf:	74 69                	je     310153a <kShell+0x846>
 31014d1:	6d                   	ins    DWORD PTR es:[edi],dx
 31014d2:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 31014d6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31014d7:	67 72 61             	addr16 jb 310153b <kShell+0x847>
 31014da:	6d                   	ins    DWORD PTR es:[edi],dx
 31014db:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 31014de:	61                   	popa   
 31014df:	72 61                	jb     3101542 <kShell+0x84e>
 31014e1:	6d                   	ins    DWORD PTR es:[edi],dx
 31014e2:	65                   	gs
 31014e3:	74 65                	je     310154a <kShell+0x856>
 31014e5:	72 73                	jb     310155a <kShell+0x866>
 31014e7:	5d                   	pop    ebp
 31014e8:	00 3d 00 25 73 20    	add    BYTE PTR ds:0x20732500,bh
 31014ee:	25 73 3e 20 00       	and    eax,0x203e73
 31014f3:	25 73 00 20 09       	and    eax,0x9200073
 31014f8:	0a 2d 2c 00 6b 53    	or     ch,BYTE PTR ds:0x536b002c
 31014fe:	68 65 6c 6c 00       	push   0x6c6c65
 3101503:	43                   	inc    ebx
 3101504:	57                   	push   edi
 3101505:	44                   	inc    esp
 3101506:	00 1b                	add    BYTE PTR [ebx],bl
 3101508:	5b                   	pop    ebx
 3101509:	31 44 00 0a          	xor    DWORD PTR [eax+eax*1+0xa],eax
	...

Disassembly of section .eh_frame:

03101510 <.eh_frame>:
 3101510:	14 00                	adc    al,0x0
 3101512:	00 00                	add    BYTE PTR [eax],al
 3101514:	00 00                	add    BYTE PTR [eax],al
 3101516:	00 00                	add    BYTE PTR [eax],al
 3101518:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 310151b:	00 01                	add    BYTE PTR [ecx],al
 310151d:	7c 08                	jl     3101527 <kShell+0x833>
 310151f:	01 1b                	add    DWORD PTR [ebx],ebx
 3101521:	0c 04                	or     al,0x4
 3101523:	04 88                	add    al,0x88
 3101525:	01 00                	add    DWORD PTR [eax],eax
 3101527:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310152a:	00 00                	add    BYTE PTR [eax],al
 310152c:	1c 00                	sbb    al,0x0
 310152e:	00 00                	add    BYTE PTR [eax],al
 3101530:	d0 ea                	shr    dl,1
 3101532:	ff                   	(bad)  
 3101533:	ff 4f 00             	dec    DWORD PTR [edi+0x0]
 3101536:	00 00                	add    BYTE PTR [eax],al
 3101538:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 310153b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101541:	02 4b c5             	add    cl,BYTE PTR [ebx-0x3b]
 3101544:	0c 04                	or     al,0x4
 3101546:	04 00                	add    al,0x0
 3101548:	1c 00                	sbb    al,0x0
 310154a:	00 00                	add    BYTE PTR [eax],al
 310154c:	3c 00                	cmp    al,0x0
 310154e:	00 00                	add    BYTE PTR [eax],al
 3101550:	ff ea                	jmp    <internal disassembler error>
 3101552:	ff                   	(bad)  
 3101553:	ff 5d 01             	call   FWORD PTR [ebp+0x1]
 3101556:	00 00                	add    BYTE PTR [eax],al
 3101558:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 310155b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101561:	03 59 01             	add    ebx,DWORD PTR [ecx+0x1]
 3101564:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101567:	04 1c                	add    al,0x1c
 3101569:	00 00                	add    BYTE PTR [eax],al
 310156b:	00 5c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bl
 310156f:	00 3c ec             	add    BYTE PTR [esp+ebp*8],bh
 3101572:	ff                   	(bad)  
 3101573:	ff 8b 00 00 00 00    	dec    DWORD PTR [ebx+0x0]
 3101579:	41                   	inc    ecx
 310157a:	0e                   	push   cs
 310157b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101581:	02 87 c5 0c 04 04    	add    al,BYTE PTR [edi+0x4040cc5]
 3101587:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310158a:	00 00                	add    BYTE PTR [eax],al
 310158c:	7c 00                	jl     310158e <kShell+0x89a>
 310158e:	00 00                	add    BYTE PTR [eax],al
 3101590:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
 3101591:	ec                   	in     al,dx
 3101592:	ff                   	(bad)  
 3101593:	ff b1 01 00 00 00    	push   DWORD PTR [ecx+0x1]
 3101599:	41                   	inc    ecx
 310159a:	0e                   	push   cs
 310159b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31015a1:	03 ad 01 c5 0c 04    	add    ebp,DWORD PTR [ebp+0x40cc501]
 31015a7:	04 1c                	add    al,0x1c
 31015a9:	00 00                	add    BYTE PTR [eax],al
 31015ab:	00 9c 00 00 00 38 ee 	add    BYTE PTR [eax+eax*1-0x11c80000],bl
 31015b2:	ff                   	(bad)  
 31015b3:	ff 19                	call   FWORD PTR [ecx]
 31015b5:	00 00                	add    BYTE PTR [eax],al
 31015b7:	00 00                	add    BYTE PTR [eax],al
 31015b9:	41                   	inc    ecx
 31015ba:	0e                   	push   cs
 31015bb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31015c1:	55                   	push   ebp
 31015c2:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31015c5:	04 00                	add    al,0x0
 31015c7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31015ca:	00 00                	add    BYTE PTR [eax],al
 31015cc:	bc 00 00 00 31       	mov    esp,0x31000000
 31015d1:	ee                   	out    dx,al
 31015d2:	ff                   	(bad)  
 31015d3:	ff 19                	call   FWORD PTR [ecx]
 31015d5:	00 00                	add    BYTE PTR [eax],al
 31015d7:	00 00                	add    BYTE PTR [eax],al
 31015d9:	41                   	inc    ecx
 31015da:	0e                   	push   cs
 31015db:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31015e1:	55                   	push   ebp
 31015e2:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31015e5:	04 00                	add    al,0x0
 31015e7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31015ea:	00 00                	add    BYTE PTR [eax],al
 31015ec:	dc 00                	fadd   QWORD PTR [eax]
 31015ee:	00 00                	add    BYTE PTR [eax],al
 31015f0:	2a ee                	sub    ch,dh
 31015f2:	ff                   	(bad)  
 31015f3:	ff 58 00             	call   FWORD PTR [eax+0x0]
 31015f6:	00 00                	add    BYTE PTR [eax],al
 31015f8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31015fb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101601:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3101605:	04 04                	add    al,0x4
 3101607:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310160a:	00 00                	add    BYTE PTR [eax],al
 310160c:	fc                   	cld    
 310160d:	00 00                	add    BYTE PTR [eax],al
 310160f:	00 62 ee             	add    BYTE PTR [edx-0x12],ah
 3101612:	ff                   	(bad)  
 3101613:	ff ce                	dec    esi
 3101615:	00 00                	add    BYTE PTR [eax],al
 3101617:	00 00                	add    BYTE PTR [eax],al
 3101619:	41                   	inc    ecx
 310161a:	0e                   	push   cs
 310161b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101621:	02 ca                	add    cl,dl
 3101623:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101626:	04 00                	add    al,0x0
 3101628:	1c 00                	sbb    al,0x0
 310162a:	00 00                	add    BYTE PTR [eax],al
 310162c:	1c 01                	sbb    al,0x1
 310162e:	00 00                	add    BYTE PTR [eax],al
 3101630:	10 ef                	adc    bh,ch
 3101632:	ff                   	(bad)  
 3101633:	ff 4e 00             	dec    DWORD PTR [esi+0x0]
 3101636:	00 00                	add    BYTE PTR [eax],al
 3101638:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 310163b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101641:	02 4a c5             	add    cl,BYTE PTR [edx-0x3b]
 3101644:	0c 04                	or     al,0x4
 3101646:	04 00                	add    al,0x0
 3101648:	1c 00                	sbb    al,0x0
 310164a:	00 00                	add    BYTE PTR [eax],al
 310164c:	3c 01                	cmp    al,0x1
 310164e:	00 00                	add    BYTE PTR [eax],al
 3101650:	3e                   	ds
 3101651:	ef                   	out    dx,eax
 3101652:	ff                   	(bad)  
 3101653:	ff 67 00             	jmp    DWORD PTR [edi+0x0]
 3101656:	00 00                	add    BYTE PTR [eax],al
 3101658:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 310165b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101661:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
 3101664:	0c 04                	or     al,0x4
 3101666:	04 00                	add    al,0x0
 3101668:	20 00                	and    BYTE PTR [eax],al
 310166a:	00 00                	add    BYTE PTR [eax],al
 310166c:	5c                   	pop    esp
 310166d:	01 00                	add    DWORD PTR [eax],eax
 310166f:	00 88 ef ff ff a6    	add    BYTE PTR [eax-0x59000011],cl
 3101675:	00 00                	add    BYTE PTR [eax],al
 3101677:	00 00                	add    BYTE PTR [eax],al
 3101679:	41                   	inc    ecx
 310167a:	0e                   	push   cs
 310167b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101681:	44                   	inc    esp
 3101682:	83 03 02             	add    DWORD PTR [ebx],0x2
 3101685:	9e                   	sahf   
 3101686:	c5 c3 0c             	(bad)  
 3101689:	04 04                	add    al,0x4
 310168b:	00 20                	add    BYTE PTR [eax],ah
 310168d:	00 00                	add    BYTE PTR [eax],al
 310168f:	00 80 01 00 00 0a    	add    BYTE PTR [eax+0xa000001],al
 3101695:	f0 ff                	lock (bad) 
 3101697:	ff a9 01 00 00 00    	jmp    FWORD PTR [ecx+0x1]
 310169d:	41                   	inc    ecx
 310169e:	0e                   	push   cs
 310169f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31016a5:	44                   	inc    esp
 31016a6:	83 03 03             	add    DWORD PTR [ebx],0x3
 31016a9:	a1 01 c5 c3 0c       	mov    eax,ds:0xcc3c501
 31016ae:	04 04                	add    al,0x4
 31016b0:	1c 00                	sbb    al,0x0
 31016b2:	00 00                	add    BYTE PTR [eax],al
 31016b4:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 31016b5:	01 00                	add    DWORD PTR [eax],eax
 31016b7:	00 8f f1 ff ff 69    	add    BYTE PTR [edi+0x69fffff1],cl
 31016bd:	00 00                	add    BYTE PTR [eax],al
 31016bf:	00 00                	add    BYTE PTR [eax],al
 31016c1:	41                   	inc    ecx
 31016c2:	0e                   	push   cs
 31016c3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31016c9:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 31016cc:	0c 04                	or     al,0x4
 31016ce:	04 00                	add    al,0x0
 31016d0:	1c 00                	sbb    al,0x0
 31016d2:	00 00                	add    BYTE PTR [eax],al
 31016d4:	c4 01                	les    eax,FWORD PTR [ecx]
 31016d6:	00 00                	add    BYTE PTR [eax],al
 31016d8:	d8 f1                	fdiv   st,st(1)
 31016da:	ff                   	(bad)  
 31016db:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 31016e1:	41                   	inc    ecx
 31016e2:	0e                   	push   cs
 31016e3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31016e9:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 31016ef:	04 20                	add    al,0x20
 31016f1:	00 00                	add    BYTE PTR [eax],al
 31016f3:	00 e4                	add    ah,ah
 31016f5:	01 00                	add    DWORD PTR [eax],eax
 31016f7:	00 46 f4             	add    BYTE PTR [esi-0xc],al
 31016fa:	ff                   	(bad)  
 31016fb:	ff 76 00             	push   DWORD PTR [esi+0x0]
 31016fe:	00 00                	add    BYTE PTR [eax],al
 3101700:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101703:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101709:	44                   	inc    esp
 310170a:	83 03 02             	add    DWORD PTR [ebx],0x2
 310170d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310170e:	c5 c3 0c             	(bad)  
 3101711:	04 04                	add    al,0x4
 3101713:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101716:	00 00                	add    BYTE PTR [eax],al
 3101718:	08 02                	or     BYTE PTR [edx],al
 310171a:	00 00                	add    BYTE PTR [eax],al
 310171c:	98                   	cwde   
 310171d:	f4                   	hlt    
 310171e:	ff                   	(bad)  
 310171f:	ff                   	(bad)  
 3101720:	3d 00 00 00 00       	cmp    eax,0x0
 3101725:	41                   	inc    ecx
 3101726:	0e                   	push   cs
 3101727:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310172d:	79 c5                	jns    31016f4 <kShell+0xa00>
 310172f:	0c 04                	or     al,0x4
 3101731:	04 00                	add    al,0x0
 3101733:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101736:	00 00                	add    BYTE PTR [eax],al
 3101738:	28 02                	sub    BYTE PTR [edx],al
 310173a:	00 00                	add    BYTE PTR [eax],al
 310173c:	b5 f4                	mov    ch,0xf4
 310173e:	ff                   	(bad)  
 310173f:	ff 8c 00 00 00 00 41 	dec    DWORD PTR [eax+eax*1+0x41000000]
 3101746:	0e                   	push   cs
 3101747:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310174d:	02 88 c5 0c 04 04    	add    cl,BYTE PTR [eax+0x4040cc5]
 3101753:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101756:	00 00                	add    BYTE PTR [eax],al
 3101758:	48                   	dec    eax
 3101759:	02 00                	add    al,BYTE PTR [eax]
 310175b:	00 21                	add    BYTE PTR [ecx],ah
 310175d:	f5                   	cmc    
 310175e:	ff                   	(bad)  
 310175f:	ff 2e                	jmp    FWORD PTR [esi]
 3101761:	00 00                	add    BYTE PTR [eax],al
 3101763:	00 00                	add    BYTE PTR [eax],al
 3101765:	41                   	inc    ecx
 3101766:	0e                   	push   cs
 3101767:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310176d:	6a c5                	push   0xffffffc5
 310176f:	0c 04                	or     al,0x4
 3101771:	04 00                	add    al,0x0
 3101773:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101776:	00 00                	add    BYTE PTR [eax],al
 3101778:	68 02 00 00 2f       	push   0x2f000002
 310177d:	f5                   	cmc    
 310177e:	ff                   	(bad)  
 310177f:	ff 23                	jmp    DWORD PTR [ebx]
 3101781:	00 00                	add    BYTE PTR [eax],al
 3101783:	00 00                	add    BYTE PTR [eax],al
 3101785:	41                   	inc    ecx
 3101786:	0e                   	push   cs
 3101787:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310178d:	5f                   	pop    edi
 310178e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101791:	04 00                	add    al,0x0
 3101793:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101796:	00 00                	add    BYTE PTR [eax],al
 3101798:	88 02                	mov    BYTE PTR [edx],al
 310179a:	00 00                	add    BYTE PTR [eax],al
 310179c:	32 f5                	xor    dh,ch
 310179e:	ff                   	(bad)  
 310179f:	ff 26                	jmp    DWORD PTR [esi]
 31017a1:	00 00                	add    BYTE PTR [eax],al
 31017a3:	00 00                	add    BYTE PTR [eax],al
 31017a5:	41                   	inc    ecx
 31017a6:	0e                   	push   cs
 31017a7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31017ad:	62                   	(bad)  
 31017ae:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31017b1:	04 00                	add    al,0x0
 31017b3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31017b6:	00 00                	add    BYTE PTR [eax],al
 31017b8:	a8 02                	test   al,0x2
 31017ba:	00 00                	add    BYTE PTR [eax],al
 31017bc:	38 f5                	cmp    ch,dh
 31017be:	ff                   	(bad)  
 31017bf:	ff 6b 03             	jmp    FWORD PTR [ebx+0x3]
 31017c2:	00 00                	add    BYTE PTR [eax],al
 31017c4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31017c7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31017cd:	03 67 03             	add    esp,DWORD PTR [edi+0x3]
 31017d0:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31017d3:	04                   	.byte 0x4

Disassembly of section .interp:

031017d4 <.interp>:
 31017d4:	2f                   	das    
 31017d5:	6c                   	ins    BYTE PTR es:[edi],dx
 31017d6:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 31017dd:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 31017e4:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

031017e8 <.dynsym>:
	...
 31017f8:	09 00                	or     DWORD PTR [eax],eax
	...
 3101802:	00 00                	add    BYTE PTR [eax],al
 3101804:	12 00                	adc    al,BYTE PTR [eax]
 3101806:	00 00                	add    BYTE PTR [eax],al
 3101808:	10 00                	adc    BYTE PTR [eax],al
	...
 3101812:	00 00                	add    BYTE PTR [eax],al
 3101814:	12 00                	adc    al,BYTE PTR [eax]
 3101816:	00 00                	add    BYTE PTR [eax],al
 3101818:	18 00                	sbb    BYTE PTR [eax],al
	...
 3101822:	00 00                	add    BYTE PTR [eax],al
 3101824:	12 00                	adc    al,BYTE PTR [eax]
 3101826:	00 00                	add    BYTE PTR [eax],al
 3101828:	1e                   	push   ds
	...
 3101831:	00 00                	add    BYTE PTR [eax],al
 3101833:	00 12                	add    BYTE PTR [edx],dl
 3101835:	00 00                	add    BYTE PTR [eax],al
 3101837:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
 310183d:	00 00                	add    BYTE PTR [eax],al
 310183f:	00 00                	add    BYTE PTR [eax],al
 3101841:	00 00                	add    BYTE PTR [eax],al
 3101843:	00 12                	add    BYTE PTR [edx],dl
 3101845:	00 00                	add    BYTE PTR [eax],al
 3101847:	00 2e                	add    BYTE PTR [esi],ch
	...
 3101851:	00 00                	add    BYTE PTR [eax],al
 3101853:	00 12                	add    BYTE PTR [edx],dl
 3101855:	00 00                	add    BYTE PTR [eax],al
 3101857:	00 35 00 00 00 00    	add    BYTE PTR ds:0x0,dh
 310185d:	00 00                	add    BYTE PTR [eax],al
 310185f:	00 00                	add    BYTE PTR [eax],al
 3101861:	00 00                	add    BYTE PTR [eax],al
 3101863:	00 12                	add    BYTE PTR [edx],dl
 3101865:	00 00                	add    BYTE PTR [eax],al
 3101867:	00 3a                	add    BYTE PTR [edx],bh
	...
 3101871:	00 00                	add    BYTE PTR [eax],al
 3101873:	00 12                	add    BYTE PTR [edx],dl
 3101875:	00 00                	add    BYTE PTR [eax],al
 3101877:	00 41 00             	add    BYTE PTR [ecx+0x0],al
	...
 3101882:	00 00                	add    BYTE PTR [eax],al
 3101884:	12 00                	adc    al,BYTE PTR [eax]
 3101886:	00 00                	add    BYTE PTR [eax],al
 3101888:	48                   	dec    eax
	...
 3101891:	00 00                	add    BYTE PTR [eax],al
 3101893:	00 12                	add    BYTE PTR [edx],dl
 3101895:	00 00                	add    BYTE PTR [eax],al
 3101897:	00 4e 00             	add    BYTE PTR [esi+0x0],cl
	...
 31018a2:	00 00                	add    BYTE PTR [eax],al
 31018a4:	12 00                	adc    al,BYTE PTR [eax]
 31018a6:	00 00                	add    BYTE PTR [eax],al
 31018a8:	5c                   	pop    esp
	...
 31018b1:	00 00                	add    BYTE PTR [eax],al
 31018b3:	00 12                	add    BYTE PTR [edx],dl
 31018b5:	00 00                	add    BYTE PTR [eax],al
 31018b7:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
	...
 31018c3:	00 12                	add    BYTE PTR [edx],dl
 31018c5:	00 00                	add    BYTE PTR [eax],al
 31018c7:	00 69 00             	add    BYTE PTR [ecx+0x0],ch
	...
 31018d2:	00 00                	add    BYTE PTR [eax],al
 31018d4:	12 00                	adc    al,BYTE PTR [eax]
 31018d6:	00 00                	add    BYTE PTR [eax],al
 31018d8:	72 00                	jb     31018da <kShell+0xbe6>
	...
 31018e2:	00 00                	add    BYTE PTR [eax],al
 31018e4:	12 00                	adc    al,BYTE PTR [eax]
 31018e6:	00 00                	add    BYTE PTR [eax],al
 31018e8:	77 00                	ja     31018ea <kShell+0xbf6>
	...
 31018f2:	00 00                	add    BYTE PTR [eax],al
 31018f4:	12 00                	adc    al,BYTE PTR [eax]
 31018f6:	00 00                	add    BYTE PTR [eax],al
 31018f8:	7e 00                	jle    31018fa <kShell+0xc06>
	...
 3101902:	00 00                	add    BYTE PTR [eax],al
 3101904:	12 00                	adc    al,BYTE PTR [eax]
 3101906:	00 00                	add    BYTE PTR [eax],al
 3101908:	86 00                	xchg   BYTE PTR [eax],al
	...
 3101912:	00 00                	add    BYTE PTR [eax],al
 3101914:	12 00                	adc    al,BYTE PTR [eax]
 3101916:	00 00                	add    BYTE PTR [eax],al
 3101918:	8e 00                	mov    es,WORD PTR [eax]
	...
 3101922:	00 00                	add    BYTE PTR [eax],al
 3101924:	12 00                	adc    al,BYTE PTR [eax]
 3101926:	00 00                	add    BYTE PTR [eax],al
 3101928:	95                   	xchg   ebp,eax
	...
 3101931:	00 00                	add    BYTE PTR [eax],al
 3101933:	00 12                	add    BYTE PTR [edx],dl
 3101935:	00 00                	add    BYTE PTR [eax],al
 3101937:	00 9c 00 00 00 00 00 	add    BYTE PTR [eax+eax*1+0x0],bl
 310193e:	00 00                	add    BYTE PTR [eax],al
 3101940:	00 00                	add    BYTE PTR [eax],al
 3101942:	00 00                	add    BYTE PTR [eax],al
 3101944:	12 00                	adc    al,BYTE PTR [eax]
 3101946:	00 00                	add    BYTE PTR [eax],al
 3101948:	a1 00 00 00 00       	mov    eax,ds:0x0
 310194d:	00 00                	add    BYTE PTR [eax],al
 310194f:	00 00                	add    BYTE PTR [eax],al
 3101951:	00 00                	add    BYTE PTR [eax],al
 3101953:	00 12                	add    BYTE PTR [edx],dl
 3101955:	00 00                	add    BYTE PTR [eax],al
 3101957:	00 a8 00 00 00 00    	add    BYTE PTR [eax+0x0],ch
 310195d:	00 00                	add    BYTE PTR [eax],al
 310195f:	00 00                	add    BYTE PTR [eax],al
 3101961:	00 00                	add    BYTE PTR [eax],al
 3101963:	00 12                	add    BYTE PTR [edx],dl
 3101965:	00 00                	add    BYTE PTR [eax],al
 3101967:	00 b0 00 00 00 00    	add    BYTE PTR [eax+0x0],dh
 310196d:	00 00                	add    BYTE PTR [eax],al
 310196f:	00 00                	add    BYTE PTR [eax],al
 3101971:	00 00                	add    BYTE PTR [eax],al
 3101973:	00 12                	add    BYTE PTR [edx],dl
 3101975:	00 00                	add    BYTE PTR [eax],al
 3101977:	00 b7 00 00 00 00    	add    BYTE PTR [edi+0x0],dh
 310197d:	00 00                	add    BYTE PTR [eax],al
 310197f:	00 00                	add    BYTE PTR [eax],al
 3101981:	00 00                	add    BYTE PTR [eax],al
 3101983:	00 12                	add    BYTE PTR [edx],dl
 3101985:	00 00                	add    BYTE PTR [eax],al
 3101987:	00 bc 00 00 00 00 00 	add    BYTE PTR [eax+eax*1+0x0],bh
 310198e:	00 00                	add    BYTE PTR [eax],al
 3101990:	00 00                	add    BYTE PTR [eax],al
 3101992:	00 00                	add    BYTE PTR [eax],al
 3101994:	12 00                	adc    al,BYTE PTR [eax]
 3101996:	00 00                	add    BYTE PTR [eax],al
 3101998:	c3                   	ret    
	...
 31019a1:	00 00                	add    BYTE PTR [eax],al
 31019a3:	00 12                	add    BYTE PTR [edx],dl
 31019a5:	00 00                	add    BYTE PTR [eax],al
 31019a7:	00 c9                	add    cl,cl
	...
 31019b1:	00 00                	add    BYTE PTR [eax],al
 31019b3:	00 12                	add    BYTE PTR [edx],dl
 31019b5:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

031019b8 <.dynstr>:
 31019b8:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 31019bc:	63 2e                	arpl   WORD PTR [esi],bp
 31019be:	73 6f                	jae    3101a2f <kShell+0xd3b>
 31019c0:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 31019c3:	72 63                	jb     3101a28 <kShell+0xd34>
 31019c5:	70 79                	jo     3101a40 <kShell+0xd4c>
 31019c7:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 31019ca:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 31019d1:	72 
 31019d2:	69 6e 74 00 70 72 69 	imul   ebp,DWORD PTR [esi+0x74],0x69727000
 31019d9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31019da:	74 66                	je     3101a42 <kShell+0xd4e>
 31019dc:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 31019df:	73 65                	jae    3101a46 <kShell+0xd52>
 31019e1:	74 52                	je     3101a35 <kShell+0xd41>
 31019e3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31019e4:	77 00                	ja     31019e6 <kShell+0xcf2>
 31019e6:	67                   	addr16
 31019e7:	65                   	gs
 31019e8:	74 65                	je     3101a4f <kShell+0xd5b>
 31019ea:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31019eb:	76 00                	jbe    31019ed <kShell+0xcf9>
 31019ed:	67                   	addr16
 31019ee:	65                   	gs
 31019ef:	74 73                	je     3101a64 <kShell+0xd70>
 31019f1:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 31019f4:	6d                   	ins    DWORD PTR es:[edi],dx
 31019f5:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 31019f8:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 31019fb:	6c                   	ins    BYTE PTR es:[edi],dx
 31019fc:	6c                   	ins    BYTE PTR es:[edi],dx
 31019fd:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31019fe:	63 00                	arpl   WORD PTR [eax],ax
 3101a00:	73 6c                	jae    3101a6e <kShell+0xd7a>
 3101a02:	65                   	gs
 3101a03:	65                   	gs
 3101a04:	70 00                	jo     3101a06 <kShell+0xd12>
 3101a06:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 3101a09:	6c                   	ins    BYTE PTR es:[edi],dx
 3101a0a:	69 6e 65 54 6f 41 72 	imul   ebp,DWORD PTR [esi+0x65],0x72416f54
 3101a11:	67 76 00             	addr16 jbe 3101a14 <kShell+0xd20>
 3101a14:	73 74                	jae    3101a8a <kShell+0xd96>
 3101a16:	72 74                	jb     3101a8c <kShell+0xd98>
 3101a18:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101a19:	75 6c                	jne    3101a87 <kShell+0xd93>
 3101a1b:	00 69 74             	add    BYTE PTR [ecx+0x74],ch
 3101a1e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101a1f:	61                   	popa   
 3101a20:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3101a23:	74 74                	je     3101a99 <kShell+0xda5>
 3101a25:	69 63 6b 73 00 65 78 	imul   esp,DWORD PTR [ebx+0x6b],0x78650073
 3101a2c:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 3101a2f:	73 74                	jae    3101aa5 <kShell+0xdb1>
 3101a31:	72 73                	jb     3101aa6 <kShell+0xdb2>
 3101a33:	74 72                	je     3101aa7 <kShell+0xdb3>
 3101a35:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101a38:	72 6e                	jb     3101aa8 <kShell+0xdb4>
 3101a3a:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 3101a3d:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101a40:	72 6e                	jb     3101ab0 <kShell+0xdbc>
 3101a42:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3101a45:	00 73 65             	add    BYTE PTR [ebx+0x65],dh
 3101a48:	74 65                	je     3101aaf <kShell+0xdbb>
 3101a4a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101a4b:	76 00                	jbe    3101a4d <kShell+0xd59>
 3101a4d:	73 74                	jae    3101ac3 <kShell+0xdcf>
 3101a4f:	72 74                	jb     3101ac5 <kShell+0xdd1>
 3101a51:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101a52:	6b 00 66             	imul   eax,DWORD PTR [eax],0x66
 3101a55:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101a56:	72 6b                	jb     3101ac3 <kShell+0xdcf>
 3101a58:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 3101a5b:	6d                   	ins    DWORD PTR es:[edi],dx
 3101a5c:	73 65                	jae    3101ac3 <kShell+0xdcf>
 3101a5e:	74 00                	je     3101a60 <kShell+0xd6c>
 3101a60:	73 74                	jae    3101ad6 <kShell+0xde2>
 3101a62:	72 74                	jb     3101ad8 <kShell+0xde4>
 3101a64:	72 69                	jb     3101acf <kShell+0xddb>
 3101a66:	6d                   	ins    DWORD PTR es:[edi],dx
 3101a67:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3101a6a:	74 63                	je     3101acf <kShell+0xddb>
 3101a6c:	77 64                	ja     3101ad2 <kShell+0xdde>
 3101a6e:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101a71:	69 74 00 73 74 72 6c 	imul   esi,DWORD PTR [eax+eax*1+0x73],0x656c7274
 3101a78:	65 
 3101a79:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101a7a:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101a7d:	65 63 61 00          	arpl   WORD PTR gs:[ecx+0x0],sp
 3101a81:	66                   	data16
 3101a82:	72 65                	jb     3101ae9 <kShell+0xdf5>
 3101a84:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 3101a87:	2e                   	cs
 3101a88:	2f                   	das    
 3101a89:	6c                   	ins    BYTE PTR es:[edi],dx
 3101a8a:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3101a91:	4f                   	dec    edi
 3101a92:	53                   	push   ebx
 3101a93:	2f                   	das    
 3101a94:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3101a9b:	62 
 3101a9c:	75 67                	jne    3101b05 <kShell+0xe11>
 3101a9e:	2f                   	das    
 3101a9f:	47                   	inc    edi
 3101aa0:	4e                   	dec    esi
 3101aa1:	55                   	push   ebp
 3101aa2:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3101aa7:	78 00                	js     3101aa9 <kShell+0xdb5>

Disassembly of section .hash:

03101aac <.hash>:
 3101aac:	11 00                	adc    DWORD PTR [eax],eax
 3101aae:	00 00                	add    BYTE PTR [eax],al
 3101ab0:	1d 00 00 00 10       	sbb    eax,0x10000000
 3101ab5:	00 00                	add    BYTE PTR [eax],al
 3101ab7:	00 00                	add    BYTE PTR [eax],al
 3101ab9:	00 00                	add    BYTE PTR [eax],al
 3101abb:	00 15 00 00 00 0c    	add    BYTE PTR ds:0xc000000,dl
 3101ac1:	00 00                	add    BYTE PTR [eax],al
 3101ac3:	00 1a                	add    BYTE PTR [edx],bl
 3101ac5:	00 00                	add    BYTE PTR [eax],al
 3101ac7:	00 00                	add    BYTE PTR [eax],al
 3101ac9:	00 00                	add    BYTE PTR [eax],al
 3101acb:	00 12                	add    BYTE PTR [edx],dl
 3101acd:	00 00                	add    BYTE PTR [eax],al
 3101acf:	00 03                	add    BYTE PTR [ebx],al
 3101ad1:	00 00                	add    BYTE PTR [eax],al
 3101ad3:	00 08                	add    BYTE PTR [eax],cl
 3101ad5:	00 00                	add    BYTE PTR [eax],al
 3101ad7:	00 00                	add    BYTE PTR [eax],al
 3101ad9:	00 00                	add    BYTE PTR [eax],al
 3101adb:	00 17                	add    BYTE PTR [edi],dl
 3101add:	00 00                	add    BYTE PTR [eax],al
 3101adf:	00 11                	add    BYTE PTR [ecx],dl
 3101ae1:	00 00                	add    BYTE PTR [eax],al
 3101ae3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101ae6:	00 00                	add    BYTE PTR [eax],al
 3101ae8:	19 00                	sbb    DWORD PTR [eax],eax
 3101aea:	00 00                	add    BYTE PTR [eax],al
 3101aec:	0d 00 00 00 05       	or     eax,0x5000000
 3101af1:	00 00                	add    BYTE PTR [eax],al
 3101af3:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
	...
 3101b16:	00 00                	add    BYTE PTR [eax],al
 3101b18:	06                   	push   es
 3101b19:	00 00                	add    BYTE PTR [eax],al
 3101b1b:	00 04 00             	add    BYTE PTR [eax+eax*1],al
	...
 3101b2a:	00 00                	add    BYTE PTR [eax],al
 3101b2c:	07                   	pop    es
 3101b2d:	00 00                	add    BYTE PTR [eax],al
 3101b2f:	00 0a                	add    BYTE PTR [edx],cl
 3101b31:	00 00                	add    BYTE PTR [eax],al
 3101b33:	00 0e                	add    BYTE PTR [esi],cl
 3101b35:	00 00                	add    BYTE PTR [eax],al
 3101b37:	00 0f                	add    BYTE PTR [edi],cl
 3101b39:	00 00                	add    BYTE PTR [eax],al
 3101b3b:	00 00                	add    BYTE PTR [eax],al
 3101b3d:	00 00                	add    BYTE PTR [eax],al
 3101b3f:	00 0b                	add    BYTE PTR [ebx],cl
 3101b41:	00 00                	add    BYTE PTR [eax],al
 3101b43:	00 02                	add    BYTE PTR [edx],al
	...
 3101b4d:	00 00                	add    BYTE PTR [eax],al
 3101b4f:	00 13                	add    BYTE PTR [ebx],dl
 3101b51:	00 00                	add    BYTE PTR [eax],al
 3101b53:	00 09                	add    BYTE PTR [ecx],cl
 3101b55:	00 00                	add    BYTE PTR [eax],al
 3101b57:	00 16                	add    BYTE PTR [esi],dl
 3101b59:	00 00                	add    BYTE PTR [eax],al
 3101b5b:	00 18                	add    BYTE PTR [eax],bl
 3101b5d:	00 00                	add    BYTE PTR [eax],al
 3101b5f:	00 00                	add    BYTE PTR [eax],al
 3101b61:	00 00                	add    BYTE PTR [eax],al
 3101b63:	00 01                	add    BYTE PTR [ecx],al
 3101b65:	00 00                	add    BYTE PTR [eax],al
 3101b67:	00 1b                	add    BYTE PTR [ebx],bl
 3101b69:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03101b6c <.eh_frame>:
 3101b6c:	14 00                	adc    al,0x0
 3101b6e:	00 00                	add    BYTE PTR [eax],al
 3101b70:	00 00                	add    BYTE PTR [eax],al
 3101b72:	00 00                	add    BYTE PTR [eax],al
 3101b74:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3101b77:	00 01                	add    BYTE PTR [ecx],al
 3101b79:	7c 08                	jl     3101b83 <kShell+0xe8f>
 3101b7b:	01 1b                	add    DWORD PTR [ebx],ebx
 3101b7d:	0c 04                	or     al,0x4
 3101b7f:	04 88                	add    al,0x88
 3101b81:	01 00                	add    DWORD PTR [eax],eax
 3101b83:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3101b86:	00 00                	add    BYTE PTR [eax],al
 3101b88:	1c 00                	sbb    al,0x0
 3101b8a:	00 00                	add    BYTE PTR [eax],al
 3101b8c:	d4 f4                	aam    0xf4
 3101b8e:	ff                   	(bad)  
 3101b8f:	ff d0                	call   eax
 3101b91:	01 00                	add    DWORD PTR [eax],eax
 3101b93:	00 00                	add    BYTE PTR [eax],al
 3101b95:	0e                   	push   cs
 3101b96:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3101b99:	0c 4a                	or     al,0x4a
 3101b9b:	0f 0b                	ud2    
 3101b9d:	74 04                	je     3101ba3 <kShell+0xeaf>
 3101b9f:	78 00                	js     3101ba1 <kShell+0xead>
 3101ba1:	3f                   	aas    
 3101ba2:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3101ba4:	2a 32                	sub    dh,BYTE PTR [edx]
 3101ba6:	24 22                	and    al,0x22
 3101ba8:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03101bac <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3101bac:	01 1b                	add    DWORD PTR [ebx],ebx
 3101bae:	03 3b                	add    edi,DWORD PTR [ebx]
 3101bb0:	60                   	pusha  
 3101bb1:	f9                   	stc    
 3101bb2:	ff                   	(bad)  
 3101bb3:	ff 15 00 00 00 54    	call   DWORD PTR ds:0x54000000
 3101bb9:	e4 ff                	in     al,0xff
 3101bbb:	ff                   	(bad)  
 3101bbc:	7c f9                	jl     3101bb7 <__GNU_EH_FRAME_HDR+0xb>
 3101bbe:	ff                   	(bad)  
 3101bbf:	ff a3 e4 ff ff 9c    	jmp    DWORD PTR [ebx-0x6300001c]
 3101bc5:	f9                   	stc    
 3101bc6:	ff                   	(bad)  
 3101bc7:	ff 00                	inc    DWORD PTR [eax]
 3101bc9:	e6 ff                	out    0xff,al
 3101bcb:	ff                   	(bad)  
 3101bcc:	bc f9 ff ff 8b       	mov    esp,0x8bfffff9
 3101bd1:	e6 ff                	out    0xff,al
 3101bd3:	ff dc                	call   <internal disassembler error>
 3101bd5:	f9                   	stc    
 3101bd6:	ff                   	(bad)  
 3101bd7:	ff                   	(bad)  
 3101bd8:	3c e8                	cmp    al,0xe8
 3101bda:	ff                   	(bad)  
 3101bdb:	ff                   	(bad)  
 3101bdc:	fc                   	cld    
 3101bdd:	f9                   	stc    
 3101bde:	ff                   	(bad)  
 3101bdf:	ff 55 e8             	call   DWORD PTR [ebp-0x18]
 3101be2:	ff                   	(bad)  
 3101be3:	ff 1c fa             	call   FWORD PTR [edx+edi*8]
 3101be6:	ff                   	(bad)  
 3101be7:	ff 6e e8             	jmp    FWORD PTR [esi-0x18]
 3101bea:	ff                   	(bad)  
 3101beb:	ff                   	(bad)  
 3101bec:	3c fa                	cmp    al,0xfa
 3101bee:	ff                   	(bad)  
 3101bef:	ff c6                	inc    esi
 3101bf1:	e8 ff ff 5c fa       	call   fd6d1bf5 <commandHistory+0xfa5cf935>
 3101bf6:	ff                   	(bad)  
 3101bf7:	ff 94 e9 ff ff 7c fa 	call   DWORD PTR [ecx+ebp*8-0x5830001]
 3101bfe:	ff                   	(bad)  
 3101bff:	ff e2                	jmp    edx
 3101c01:	e9 ff ff 9c fa       	jmp    fdad1c05 <commandHistory+0xfa9cf945>
 3101c06:	ff                   	(bad)  
 3101c07:	ff 4c ea ff          	dec    DWORD PTR [edx+ebp*8-0x1]
 3101c0b:	ff                   	(bad)  
 3101c0c:	bc fa ff ff f2       	mov    esp,0xf2fffffa
 3101c11:	ea ff ff e0 fa ff ff 	jmp    0xffff:0xfae0ffff
 3101c18:	9b                   	fwait
 3101c19:	ec                   	in     al,dx
 3101c1a:	ff                   	(bad)  
 3101c1b:	ff 04 fb             	inc    DWORD PTR [ebx+edi*8]
 3101c1e:	ff                   	(bad)  
 3101c1f:	ff 04 ed ff ff 24 fb 	inc    DWORD PTR [ebp*8-0x4db0001]
 3101c26:	ff                   	(bad)  
 3101c27:	ff 92 ef ff ff 44    	call   DWORD PTR [edx+0x44ffffef]
 3101c2d:	fb                   	sti    
 3101c2e:	ff                   	(bad)  
 3101c2f:	ff 08                	dec    DWORD PTR [eax]
 3101c31:	f0 ff                	lock (bad) 
 3101c33:	ff 68 fb             	jmp    FWORD PTR [eax-0x5]
 3101c36:	ff                   	(bad)  
 3101c37:	ff 45 f0             	inc    DWORD PTR [ebp-0x10]
 3101c3a:	ff                   	(bad)  
 3101c3b:	ff 88 fb ff ff d1    	dec    DWORD PTR [eax-0x2e000005]
 3101c41:	f0 ff                	lock (bad) 
 3101c43:	ff a8 fb ff ff ff    	jmp    FWORD PTR [eax-0x5]
 3101c49:	f0 ff                	lock (bad) 
 3101c4b:	ff c8                	dec    eax
 3101c4d:	fb                   	sti    
 3101c4e:	ff                   	(bad)  
 3101c4f:	ff 22                	jmp    DWORD PTR [edx]
 3101c51:	f1                   	icebp  
 3101c52:	ff                   	(bad)  
 3101c53:	ff e8                	jmp    <internal disassembler error>
 3101c55:	fb                   	sti    
 3101c56:	ff                   	(bad)  
 3101c57:	ff 48 f1             	dec    DWORD PTR [eax-0xf]
 3101c5a:	ff                   	(bad)  
 3101c5b:	ff 08                	dec    DWORD PTR [eax]
 3101c5d:	fc                   	cld    
 3101c5e:	ff                   	(bad)  
 3101c5f:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03101c60 <.rel.dyn>:
 3101c60:	dc 1e                	fcomp  QWORD PTR [esi]
 3101c62:	10 03                	adc    BYTE PTR [ebx],al
 3101c64:	07                   	pop    es
 3101c65:	01 00                	add    DWORD PTR [eax],eax
 3101c67:	00 e0                	add    al,ah
 3101c69:	1e                   	push   ds
 3101c6a:	10 03                	adc    BYTE PTR [ebx],al
 3101c6c:	07                   	pop    es
 3101c6d:	02 00                	add    al,BYTE PTR [eax]
 3101c6f:	00 e4                	add    ah,ah
 3101c71:	1e                   	push   ds
 3101c72:	10 03                	adc    BYTE PTR [ebx],al
 3101c74:	07                   	pop    es
 3101c75:	03 00                	add    eax,DWORD PTR [eax]
 3101c77:	00 e8                	add    al,ch
 3101c79:	1e                   	push   ds
 3101c7a:	10 03                	adc    BYTE PTR [ebx],al
 3101c7c:	07                   	pop    es
 3101c7d:	04 00                	add    al,0x0
 3101c7f:	00 ec                	add    ah,ch
 3101c81:	1e                   	push   ds
 3101c82:	10 03                	adc    BYTE PTR [ebx],al
 3101c84:	07                   	pop    es
 3101c85:	05 00 00 f0 1e       	add    eax,0x1ef00000
 3101c8a:	10 03                	adc    BYTE PTR [ebx],al
 3101c8c:	07                   	pop    es
 3101c8d:	06                   	push   es
 3101c8e:	00 00                	add    BYTE PTR [eax],al
 3101c90:	f4                   	hlt    
 3101c91:	1e                   	push   ds
 3101c92:	10 03                	adc    BYTE PTR [ebx],al
 3101c94:	07                   	pop    es
 3101c95:	07                   	pop    es
 3101c96:	00 00                	add    BYTE PTR [eax],al
 3101c98:	f8                   	clc    
 3101c99:	1e                   	push   ds
 3101c9a:	10 03                	adc    BYTE PTR [ebx],al
 3101c9c:	07                   	pop    es
 3101c9d:	08 00                	or     BYTE PTR [eax],al
 3101c9f:	00 fc                	add    ah,bh
 3101ca1:	1e                   	push   ds
 3101ca2:	10 03                	adc    BYTE PTR [ebx],al
 3101ca4:	07                   	pop    es
 3101ca5:	09 00                	or     DWORD PTR [eax],eax
 3101ca7:	00 00                	add    BYTE PTR [eax],al
 3101ca9:	1f                   	pop    ds
 3101caa:	10 03                	adc    BYTE PTR [ebx],al
 3101cac:	07                   	pop    es
 3101cad:	0a 00                	or     al,BYTE PTR [eax]
 3101caf:	00 04 1f             	add    BYTE PTR [edi+ebx*1],al
 3101cb2:	10 03                	adc    BYTE PTR [ebx],al
 3101cb4:	07                   	pop    es
 3101cb5:	0b 00                	or     eax,DWORD PTR [eax]
 3101cb7:	00 08                	add    BYTE PTR [eax],cl
 3101cb9:	1f                   	pop    ds
 3101cba:	10 03                	adc    BYTE PTR [ebx],al
 3101cbc:	07                   	pop    es
 3101cbd:	0c 00                	or     al,0x0
 3101cbf:	00 0c 1f             	add    BYTE PTR [edi+ebx*1],cl
 3101cc2:	10 03                	adc    BYTE PTR [ebx],al
 3101cc4:	07                   	pop    es
 3101cc5:	0d 00 00 10 1f       	or     eax,0x1f100000
 3101cca:	10 03                	adc    BYTE PTR [ebx],al
 3101ccc:	07                   	pop    es
 3101ccd:	0e                   	push   cs
 3101cce:	00 00                	add    BYTE PTR [eax],al
 3101cd0:	14 1f                	adc    al,0x1f
 3101cd2:	10 03                	adc    BYTE PTR [ebx],al
 3101cd4:	07                   	pop    es
 3101cd5:	0f 00 00             	sldt   WORD PTR [eax]
 3101cd8:	18 1f                	sbb    BYTE PTR [edi],bl
 3101cda:	10 03                	adc    BYTE PTR [ebx],al
 3101cdc:	07                   	pop    es
 3101cdd:	10 00                	adc    BYTE PTR [eax],al
 3101cdf:	00 1c 1f             	add    BYTE PTR [edi+ebx*1],bl
 3101ce2:	10 03                	adc    BYTE PTR [ebx],al
 3101ce4:	07                   	pop    es
 3101ce5:	11 00                	adc    DWORD PTR [eax],eax
 3101ce7:	00 20                	add    BYTE PTR [eax],ah
 3101ce9:	1f                   	pop    ds
 3101cea:	10 03                	adc    BYTE PTR [ebx],al
 3101cec:	07                   	pop    es
 3101ced:	12 00                	adc    al,BYTE PTR [eax]
 3101cef:	00 24 1f             	add    BYTE PTR [edi+ebx*1],ah
 3101cf2:	10 03                	adc    BYTE PTR [ebx],al
 3101cf4:	07                   	pop    es
 3101cf5:	13 00                	adc    eax,DWORD PTR [eax]
 3101cf7:	00 28                	add    BYTE PTR [eax],ch
 3101cf9:	1f                   	pop    ds
 3101cfa:	10 03                	adc    BYTE PTR [ebx],al
 3101cfc:	07                   	pop    es
 3101cfd:	14 00                	adc    al,0x0
 3101cff:	00 2c 1f             	add    BYTE PTR [edi+ebx*1],ch
 3101d02:	10 03                	adc    BYTE PTR [ebx],al
 3101d04:	07                   	pop    es
 3101d05:	15 00 00 30 1f       	adc    eax,0x1f300000
 3101d0a:	10 03                	adc    BYTE PTR [ebx],al
 3101d0c:	07                   	pop    es
 3101d0d:	16                   	push   ss
 3101d0e:	00 00                	add    BYTE PTR [eax],al
 3101d10:	34 1f                	xor    al,0x1f
 3101d12:	10 03                	adc    BYTE PTR [ebx],al
 3101d14:	07                   	pop    es
 3101d15:	17                   	pop    ss
 3101d16:	00 00                	add    BYTE PTR [eax],al
 3101d18:	38 1f                	cmp    BYTE PTR [edi],bl
 3101d1a:	10 03                	adc    BYTE PTR [ebx],al
 3101d1c:	07                   	pop    es
 3101d1d:	18 00                	sbb    BYTE PTR [eax],al
 3101d1f:	00 3c 1f             	add    BYTE PTR [edi+ebx*1],bh
 3101d22:	10 03                	adc    BYTE PTR [ebx],al
 3101d24:	07                   	pop    es
 3101d25:	19 00                	sbb    DWORD PTR [eax],eax
 3101d27:	00 40 1f             	add    BYTE PTR [eax+0x1f],al
 3101d2a:	10 03                	adc    BYTE PTR [ebx],al
 3101d2c:	07                   	pop    es
 3101d2d:	1a 00                	sbb    al,BYTE PTR [eax]
 3101d2f:	00 44 1f 10          	add    BYTE PTR [edi+ebx*1+0x10],al
 3101d33:	03 07                	add    eax,DWORD PTR [edi]
 3101d35:	1b 00                	sbb    eax,DWORD PTR [eax]
 3101d37:	00 48 1f             	add    BYTE PTR [eax+0x1f],cl
 3101d3a:	10 03                	adc    BYTE PTR [ebx],al
 3101d3c:	07                   	pop    es
 3101d3d:	1c 00                	sbb    al,0x0
	...

Disassembly of section .data:

03101d40 <cmds>:
 3101d40:	30 12                	xor    BYTE PTR [edx],dl
 3101d42:	10 03                	adc    BYTE PTR [ebx],al
 3101d44:	34 12                	xor    al,0x12
 3101d46:	10 03                	adc    BYTE PTR [ebx],al
 3101d48:	00 00                	add    BYTE PTR [eax],al
 3101d4a:	10 03                	adc    BYTE PTR [ebx],al
 3101d4c:	00 00                	add    BYTE PTR [eax],al
 3101d4e:	00 00                	add    BYTE PTR [eax],al
 3101d50:	46                   	inc    esi
 3101d51:	12 10                	adc    dl,BYTE PTR [eax]
 3101d53:	03 4b 12             	add    ecx,DWORD PTR [ebx+0x12]
 3101d56:	10 03                	adc    BYTE PTR [ebx],al
 3101d58:	01 04 10             	add    DWORD PTR [eax+edx*1],eax
 3101d5b:	03 01                	add    eax,DWORD PTR [ecx]
 3101d5d:	00 00                	add    BYTE PTR [eax],al
 3101d5f:	00 5d 12             	add    BYTE PTR [ebp+0x12],bl
 3101d62:	10 03                	adc    BYTE PTR [ebx],al
 3101d64:	62 12                	bound  edx,QWORD PTR [edx]
 3101d66:	10 03                	adc    BYTE PTR [ebx],al
 3101d68:	1a 04 10             	sbb    al,BYTE PTR [eax+edx*1]
 3101d6b:	03 01                	add    eax,DWORD PTR [ecx]
 3101d6d:	00 00                	add    BYTE PTR [eax],al
 3101d6f:	00 6e 12             	add    BYTE PTR [esi+0x12],ch
 3101d72:	10 03                	adc    BYTE PTR [ebx],al
 3101d74:	73 12                	jae    3101d88 <cmds+0x48>
 3101d76:	10 03                	adc    BYTE PTR [ebx],al
 3101d78:	72 04                	jb     3101d7e <cmds+0x3e>
 3101d7a:	10 03                	adc    BYTE PTR [ebx],al
 3101d7c:	01 00                	add    DWORD PTR [eax],eax
 3101d7e:	00 00                	add    BYTE PTR [eax],al
 3101d80:	8f                   	(bad)  
 3101d81:	12 10                	adc    dl,BYTE PTR [eax]
 3101d83:	03 93 12 10 03 40    	add    edx,DWORD PTR [ebx+0x40031012]
 3101d89:	05 10 03 00 00       	add    eax,0x310
 3101d8e:	00 00                	add    BYTE PTR [eax],al
 3101d90:	ab                   	stos   DWORD PTR es:[edi],eax
 3101d91:	12 10                	adc    dl,BYTE PTR [eax]
 3101d93:	03 af 12 10 03 4f    	add    ebp,DWORD PTR [edi+0x4f031012]
 3101d99:	00 10                	add    BYTE PTR [eax],dl
 3101d9b:	03 01                	add    eax,DWORD PTR [ecx]
 3101d9d:	00 00                	add    BYTE PTR [eax],al
 3101d9f:	00 cb                	add    bl,cl
 3101da1:	12 10                	adc    dl,BYTE PTR [eax]
 3101da3:	03 d1                	add    edx,ecx
 3101da5:	12 10                	adc    dl,BYTE PTR [eax]
 3101da7:	03 8e 05 10 03 01    	add    ecx,DWORD PTR [esi+0x1031005]
 3101dad:	00 00                	add    BYTE PTR [eax],al
 3101daf:	00 e5                	add    ch,ah
 3101db1:	12 10                	adc    dl,BYTE PTR [eax]
 3101db3:	03 ec                	add    ebp,esp
 3101db5:	12 10                	adc    dl,BYTE PTR [eax]
 3101db7:	03 e8                	add    ebp,eax
 3101db9:	03 10                	add    edx,DWORD PTR [eax]
 3101dbb:	03 01                	add    eax,DWORD PTR [ecx]
 3101dbd:	00 00                	add    BYTE PTR [eax],al
	...

03101dc0 <cmds>:
 3101dc0:	ec                   	in     al,dx
 3101dc1:	13 10                	adc    edx,DWORD PTR [eax]
 3101dc3:	03 f0                	add    esi,eax
 3101dc5:	13 10                	adc    edx,DWORD PTR [eax]
 3101dc7:	03 00                	add    eax,DWORD PTR [eax]
 3101dc9:	00 10                	add    BYTE PTR [eax],dl
 3101dcb:	03 00                	add    eax,DWORD PTR [eax]
 3101dcd:	00 00                	add    BYTE PTR [eax],al
 3101dcf:	00 02                	add    BYTE PTR [edx],al
 3101dd1:	14 10                	adc    al,0x10
 3101dd3:	03 07                	add    eax,DWORD PTR [edi]
 3101dd5:	14 10                	adc    al,0x10
 3101dd7:	03 01                	add    eax,DWORD PTR [ecx]
 3101dd9:	04 10                	add    al,0x10
 3101ddb:	03 01                	add    eax,DWORD PTR [ecx]
 3101ddd:	00 00                	add    BYTE PTR [eax],al
 3101ddf:	00 19                	add    BYTE PTR [ecx],bl
 3101de1:	14 10                	adc    al,0x10
 3101de3:	03 1e                	add    ebx,DWORD PTR [esi]
 3101de5:	14 10                	adc    al,0x10
 3101de7:	03 1a                	add    ebx,DWORD PTR [edx]
 3101de9:	04 10                	add    al,0x10
 3101deb:	03 01                	add    eax,DWORD PTR [ecx]
 3101ded:	00 00                	add    BYTE PTR [eax],al
 3101def:	00 2a                	add    BYTE PTR [edx],ch
 3101df1:	14 10                	adc    al,0x10
 3101df3:	03 2f                	add    ebp,DWORD PTR [edi]
 3101df5:	14 10                	adc    al,0x10
 3101df7:	03 72 04             	add    esi,DWORD PTR [edx+0x4]
 3101dfa:	10 03                	adc    BYTE PTR [ebx],al
 3101dfc:	01 00                	add    DWORD PTR [eax],eax
 3101dfe:	00 00                	add    BYTE PTR [eax],al
 3101e00:	4b                   	dec    ebx
 3101e01:	14 10                	adc    al,0x10
 3101e03:	03 4f 14             	add    ecx,DWORD PTR [edi+0x14]
 3101e06:	10 03                	adc    BYTE PTR [ebx],al
 3101e08:	40                   	inc    eax
 3101e09:	05 10 03 00 00       	add    eax,0x310
 3101e0e:	00 00                	add    BYTE PTR [eax],al
 3101e10:	67 14 10             	addr16 adc al,0x10
 3101e13:	03 6b 14             	add    ebp,DWORD PTR [ebx+0x14]
 3101e16:	10 03                	adc    BYTE PTR [ebx],al
 3101e18:	4f                   	dec    edi
 3101e19:	00 10                	add    BYTE PTR [eax],dl
 3101e1b:	03 01                	add    eax,DWORD PTR [ecx]
 3101e1d:	00 00                	add    BYTE PTR [eax],al
 3101e1f:	00 87 14 10 03 8d    	add    BYTE PTR [edi-0x72fcefec],al
 3101e25:	14 10                	adc    al,0x10
 3101e27:	03 8e 05 10 03 01    	add    ecx,DWORD PTR [esi+0x1031005]
 3101e2d:	00 00                	add    BYTE PTR [eax],al
 3101e2f:	00 a1 14 10 03 a8    	add    BYTE PTR [ecx-0x57fcefec],ah
 3101e35:	14 10                	adc    al,0x10
 3101e37:	03 e8                	add    ebp,eax
 3101e39:	03 10                	add    edx,DWORD PTR [eax]
 3101e3b:	03 01                	add    eax,DWORD PTR [ecx]
 3101e3d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynamic:

03101e40 <_DYNAMIC>:
 3101e40:	01 00                	add    DWORD PTR [eax],eax
 3101e42:	00 00                	add    BYTE PTR [eax],al
 3101e44:	01 00                	add    DWORD PTR [eax],eax
 3101e46:	00 00                	add    BYTE PTR [eax],al
 3101e48:	0f 00 00             	sldt   WORD PTR [eax]
 3101e4b:	00 ce                	add    dh,cl
 3101e4d:	00 00                	add    BYTE PTR [eax],al
 3101e4f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3101e52:	00 00                	add    BYTE PTR [eax],al
 3101e54:	ac                   	lods   al,BYTE PTR ds:[esi]
 3101e55:	1a 10                	sbb    dl,BYTE PTR [eax]
 3101e57:	03 05 00 00 00 b8    	add    eax,DWORD PTR ds:0xb8000000
 3101e5d:	19 10                	sbb    DWORD PTR [eax],edx
 3101e5f:	03 06                	add    eax,DWORD PTR [esi]
 3101e61:	00 00                	add    BYTE PTR [eax],al
 3101e63:	00 e8                	add    al,ch
 3101e65:	17                   	pop    ss
 3101e66:	10 03                	adc    BYTE PTR [ebx],al
 3101e68:	0a 00                	or     al,BYTE PTR [eax]
 3101e6a:	00 00                	add    BYTE PTR [eax],al
 3101e6c:	f1                   	icebp  
 3101e6d:	00 00                	add    BYTE PTR [eax],al
 3101e6f:	00 0b                	add    BYTE PTR [ebx],cl
 3101e71:	00 00                	add    BYTE PTR [eax],al
 3101e73:	00 10                	add    BYTE PTR [eax],dl
 3101e75:	00 00                	add    BYTE PTR [eax],al
 3101e77:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 3101e7d:	00 00                	add    BYTE PTR [eax],al
 3101e7f:	00 03                	add    BYTE PTR [ebx],al
 3101e81:	00 00                	add    BYTE PTR [eax],al
 3101e83:	00 d0                	add    al,dl
 3101e85:	1e                   	push   ds
 3101e86:	10 03                	adc    BYTE PTR [ebx],al
 3101e88:	02 00                	add    al,BYTE PTR [eax]
 3101e8a:	00 00                	add    BYTE PTR [eax],al
 3101e8c:	e0 00                	loopne 3101e8e <_DYNAMIC+0x4e>
 3101e8e:	00 00                	add    BYTE PTR [eax],al
 3101e90:	14 00                	adc    al,0x0
 3101e92:	00 00                	add    BYTE PTR [eax],al
 3101e94:	11 00                	adc    DWORD PTR [eax],eax
 3101e96:	00 00                	add    BYTE PTR [eax],al
 3101e98:	17                   	pop    ss
 3101e99:	00 00                	add    BYTE PTR [eax],al
 3101e9b:	00 60 1c             	add    BYTE PTR [eax+0x1c],ah
 3101e9e:	10 03                	adc    BYTE PTR [ebx],al
	...

Disassembly of section .got.plt:

03101ed0 <_GLOBAL_OFFSET_TABLE_>:
 3101ed0:	40                   	inc    eax
 3101ed1:	1e                   	push   ds
 3101ed2:	10 03                	adc    BYTE PTR [ebx],al
	...
 3101edc:	76 10                	jbe    3101eee <_GLOBAL_OFFSET_TABLE_+0x1e>
 3101ede:	10 03                	adc    BYTE PTR [ebx],al
 3101ee0:	86 10                	xchg   BYTE PTR [eax],dl
 3101ee2:	10 03                	adc    BYTE PTR [ebx],al
 3101ee4:	96                   	xchg   esi,eax
 3101ee5:	10 10                	adc    BYTE PTR [eax],dl
 3101ee7:	03 a6 10 10 03 b6    	add    esp,DWORD PTR [esi-0x49fceff0]
 3101eed:	10 10                	adc    BYTE PTR [eax],dl
 3101eef:	03 c6                	add    eax,esi
 3101ef1:	10 10                	adc    BYTE PTR [eax],dl
 3101ef3:	03 d6                	add    edx,esi
 3101ef5:	10 10                	adc    BYTE PTR [eax],dl
 3101ef7:	03 e6                	add    esp,esi
 3101ef9:	10 10                	adc    BYTE PTR [eax],dl
 3101efb:	03 f6                	add    esi,esi
 3101efd:	10 10                	adc    BYTE PTR [eax],dl
 3101eff:	03 06                	add    eax,DWORD PTR [esi]
 3101f01:	11 10                	adc    DWORD PTR [eax],edx
 3101f03:	03 16                	add    edx,DWORD PTR [esi]
 3101f05:	11 10                	adc    DWORD PTR [eax],edx
 3101f07:	03 26                	add    esp,DWORD PTR [esi]
 3101f09:	11 10                	adc    DWORD PTR [eax],edx
 3101f0b:	03 36                	add    esi,DWORD PTR [esi]
 3101f0d:	11 10                	adc    DWORD PTR [eax],edx
 3101f0f:	03 46 11             	add    eax,DWORD PTR [esi+0x11]
 3101f12:	10 03                	adc    BYTE PTR [ebx],al
 3101f14:	56                   	push   esi
 3101f15:	11 10                	adc    DWORD PTR [eax],edx
 3101f17:	03 66 11             	add    esp,DWORD PTR [esi+0x11]
 3101f1a:	10 03                	adc    BYTE PTR [ebx],al
 3101f1c:	76 11                	jbe    3101f2f <_GLOBAL_OFFSET_TABLE_+0x5f>
 3101f1e:	10 03                	adc    BYTE PTR [ebx],al
 3101f20:	86 11                	xchg   BYTE PTR [ecx],dl
 3101f22:	10 03                	adc    BYTE PTR [ebx],al
 3101f24:	96                   	xchg   esi,eax
 3101f25:	11 10                	adc    DWORD PTR [eax],edx
 3101f27:	03 a6 11 10 03 b6    	add    esp,DWORD PTR [esi-0x49fcefef]
 3101f2d:	11 10                	adc    DWORD PTR [eax],edx
 3101f2f:	03 c6                	add    eax,esi
 3101f31:	11 10                	adc    DWORD PTR [eax],edx
 3101f33:	03 d6                	add    edx,esi
 3101f35:	11 10                	adc    DWORD PTR [eax],edx
 3101f37:	03 e6                	add    esp,esi
 3101f39:	11 10                	adc    DWORD PTR [eax],edx
 3101f3b:	03 f6                	add    esi,esi
 3101f3d:	11 10                	adc    DWORD PTR [eax],edx
 3101f3f:	03 06                	add    eax,DWORD PTR [esi]
 3101f41:	12 10                	adc    dl,BYTE PTR [eax]
 3101f43:	03 16                	add    edx,DWORD PTR [esi]
 3101f45:	12 10                	adc    dl,BYTE PTR [eax]
 3101f47:	03 26                	add    esp,DWORD PTR [esi]
 3101f49:	12 10                	adc    dl,BYTE PTR [eax]
 3101f4b:	03                   	.byte 0x3

Disassembly of section .bss:

03101f60 <delim>:
	...

03101f68 <environmentLoc>:
	...

03101f80 <cwd>:
	...

03102080 <sExecutingProgram>:
	...

03102280 <command_function_p>:
 3102280:	00 00                	add    BYTE PTR [eax],al
	...

03102284 <heapEnd>:
 3102284:	00 00                	add    BYTE PTR [eax],al
	...

03102288 <heapBase>:
 3102288:	00 00                	add    BYTE PTR [eax],al
	...

0310228c <heapCurr>:
 310228c:	00 00                	add    BYTE PTR [eax],al
	...

03102290 <command_function>:
 3102290:	00 00                	add    BYTE PTR [eax],al
	...

03102294 <processEnvp>:
 3102294:	00 00                	add    BYTE PTR [eax],al
	...

03102298 <lastExecExitCode>:
 3102298:	00 00                	add    BYTE PTR [eax],al
	...

0310229c <exitCode>:
 310229c:	00 00                	add    BYTE PTR [eax],al
	...

031022a0 <sKShellProgramName>:
 31022a0:	00 00                	add    BYTE PTR [eax],al
	...

031022a4 <libcTZ>:
 31022a4:	00 00                	add    BYTE PTR [eax],al
	...

031022a8 <timeToExit>:
 31022a8:	00 00                	add    BYTE PTR [eax],al
	...

031022ac <commandHistoryPtr>:
 31022ac:	00 00                	add    BYTE PTR [eax],al
	...

031022b0 <commandHistoryMax>:
	...

031022c0 <commandHistory>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	98                   	cwde   
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
  1c:	03 f5                	add    esi,ebp
  1e:	05 00 00 00 00       	add    eax,0x0
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
  8d:	e0 02                	loopne 91 <cmdPrintEnv-0x30fff6f>
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
  ed:	81 02 00 00 03 36    	add    DWORD PTR [edx],0x36030000
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
 165:	17                   	pop    ss
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
 19e:	92                   	xchg   edx,eax
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
 1ff:	02 91 6c 10 f2 02    	add    dl,BYTE PTR [ecx+0x2f2106c]
 205:	00 00                	add    BYTE PTR [eax],al
 207:	01 1d 3a 00 00 00    	add    DWORD PTR ds:0x3a,ebx
 20d:	02 91 68 10 ae 02    	add    dl,BYTE PTR [ecx+0x2ae1068]
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
 256:	0f c8                	bswap  eax
 258:	02 00                	add    al,BYTE PTR [eax]
 25a:	00 01                	add    BYTE PTR [ecx],al
 25c:	35 5c 01 00 00       	xor    eax,0x15c
 261:	02 91 00 0f 37 04    	add    dl,BYTE PTR [ecx+0x4370f00]
 267:	00 00                	add    BYTE PTR [eax],al
 269:	01 35 3a 00 00 00    	add    DWORD PTR ds:0x3a,esi
 26f:	02 91 04 0f 54 04    	add    dl,BYTE PTR [ecx+0x4540f04]
 275:	00 00                	add    BYTE PTR [eax],al
 277:	01 35 b5 02 00 00    	add    DWORD PTR ds:0x2b5,esi
 27d:	02 91 08 0f e7 02    	add    dl,BYTE PTR [ecx+0x2e70f08]
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
 302:	e7 02                	out    0x2,eax
 304:	00 00                	add    BYTE PTR [eax],al
 306:	01 4b 1c             	add    DWORD PTR [ebx+0x1c],ecx
 309:	01 00                	add    DWORD PTR [eax],eax
 30b:	00 02                	add    BYTE PTR [edx],al
 30d:	91                   	xchg   ecx,eax
 30e:	6b 10 cf             	imul   edx,DWORD PTR [eax],0xffffffcf
 311:	01 00                	add    DWORD PTR [eax],eax
 313:	00 01                	add    BYTE PTR [ecx],al
 315:	4c                   	dec    esp
 316:	3a 00                	cmp    al,BYTE PTR [eax]
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
 36c:	02 91 54 15 9c 02    	add    dl,BYTE PTR [ecx+0x29c1554]
 372:	00 00                	add    BYTE PTR [eax],al
 374:	01 54 02 04          	add    DWORD PTR [edx+eax*1+0x4],edx
 378:	00 00                	add    BYTE PTR [eax],al
 37a:	15 8a 02 00 00       	adc    eax,0x28a
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
 3a1:	10 37                	adc    BYTE PTR [edi],dh
 3a3:	04 00                	add    al,0x0
 3a5:	00 01                	add    BYTE PTR [ecx],al
 3a7:	5a                   	pop    edx
 3a8:	3a 00                	cmp    al,BYTE PTR [eax]
 3aa:	00 00                	add    BYTE PTR [eax],al
 3ac:	03 91 c0 75 10 54    	add    edx,DWORD PTR [ecx+0x541075c0]
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
 3cc:	d9 02                	fld    DWORD PTR [edx]
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
 428:	02 91 00 00 0e 0e    	add    dl,BYTE PTR [ecx+0xe0e0000]
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
 484:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 485:	02 00                	add    al,BYTE PTR [eax]
 487:	00 01                	add    BYTE PTR [ecx],al
 489:	9d                   	popf   
 48a:	72 04                	jb     490 <cmdPrintEnv-0x30ffb70>
 48c:	10 03                	adc    BYTE PTR [ebx],al
 48e:	ce                   	into   
 48f:	00 00                	add    BYTE PTR [eax],al
 491:	00 01                	add    BYTE PTR [ecx],al
 493:	9c                   	pushf  
 494:	cd 04                	int    0x4
 496:	00 00                	add    BYTE PTR [eax],al
 498:	0f 9a 00             	setp   BYTE PTR [eax]
 49b:	00 00                	add    BYTE PTR [eax],al
 49d:	01 9d 5c 01 00 00    	add    DWORD PTR [ebp+0x15c],ebx
 4a3:	02 91 00 0d 74 6f    	add    dl,BYTE PTR [ecx+0x6f740d00]
 4a9:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
 4ac:	9f                   	lahf   
 4ad:	5c                   	pop    esp
 4ae:	01 00                	add    DWORD PTR [eax],eax
 4b0:	00 02                	add    BYTE PTR [edx],al
 4b2:	91                   	xchg   ecx,eax
 4b3:	68 0c a1 04 10       	push   0x1004a10c
 4b8:	03 9c 00 00 00 0d 63 	add    ebx,DWORD PTR [eax+eax*1+0x630d0000]
 4bf:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4c0:	74 00                	je     4c2 <cmdPrintEnv-0x30ffb3e>
 4c2:	01 a9 61 00 00 00    	add    DWORD PTR [ecx+0x61],ebp
 4c8:	02 91 6c 00 00 0b    	add    dl,BYTE PTR [ecx+0xb00006c]
 4ce:	02 01                	add    al,BYTE PTR [ecx]
 4d0:	00 00                	add    BYTE PTR [eax],al
 4d2:	01 b4 40 05 10 03 4e 	add    DWORD PTR [eax+eax*2+0x4e031005],esi
 4d9:	00 00                	add    BYTE PTR [eax],al
 4db:	00 01                	add    BYTE PTR [ecx],al
 4dd:	9c                   	pushf  
 4de:	f1                   	icebp  
 4df:	04 00                	add    al,0x0
 4e1:	00 0d 62 75 66 00    	add    BYTE PTR ds:0x667562,cl
 4e7:	01 b6 5c 01 00 00    	add    DWORD PTR [esi+0x15c],esi
 4ed:	02 91 6c 00 0e 85    	add    dl,BYTE PTR [ecx-0x7af1ff94]
 4f3:	01 00                	add    DWORD PTR [eax],eax
 4f5:	00 01                	add    BYTE PTR [ecx],al
 4f7:	bb 8e 05 10 03       	mov    ebx,0x310058e
 4fc:	67 00 00             	add    BYTE PTR [bx+si],al
 4ff:	00 01                	add    BYTE PTR [ecx],al
 501:	9c                   	pushf  
 502:	32 05 00 00 0f 9a    	xor    al,BYTE PTR ds:0x9a0f0000
 508:	00 00                	add    BYTE PTR [eax],al
 50a:	00 01                	add    BYTE PTR [ecx],al
 50c:	bb 5c 01 00 00       	mov    ebx,0x15c
 511:	02 91 00 10 c3 01    	add    dl,BYTE PTR [ecx+0x1c31000]
 517:	00 00                	add    BYTE PTR [eax],al
 519:	01 bd 20 02 00 00    	add    DWORD PTR [ebp+0x220],edi
 51f:	03 91 ec 75 10 56    	add    edx,DWORD PTR [ecx+0x561075ec]
 525:	01 00                	add    DWORD PTR [eax],eax
 527:	00 01                	add    BYTE PTR [ecx],al
 529:	be 3a 00 00 00       	mov    esi,0x3a
 52e:	02 91 6c 00 11 64    	add    dl,BYTE PTR [ecx+0x6411006c]
 534:	01 00                	add    DWORD PTR [eax],eax
 536:	00 42 05             	add    BYTE PTR [edx+0x5],al
 539:	00 00                	add    BYTE PTR [eax],al
 53b:	12 36                	adc    dh,BYTE PTR [esi]
 53d:	02 00                	add    al,BYTE PTR [eax]
 53f:	00 07                	add    BYTE PTR [edi],al
 541:	00 10                	add    BYTE PTR [eax],dl
 543:	cd 02                	int    0x2
 545:	00 00                	add    BYTE PTR [eax],al
 547:	04 31                	add    al,0x31
 549:	32 05 00 00 05 03    	xor    al,BYTE PTR ds:0x3050000
 54f:	40                   	inc    eax
 550:	1d 10 03 17 bf       	sbb    eax,0xbf170310
 555:	02 00                	add    al,BYTE PTR [eax]
 557:	00 05 34 56 00 00    	add    BYTE PTR ds:0x5634,al
 55d:	00 05 03 88 22 10    	add    BYTE PTR ds:0x10228803,al
 563:	03 17                	add    edx,DWORD PTR [edi]
 565:	a8 01                	test   al,0x1
 567:	00 00                	add    BYTE PTR [eax],al
 569:	05 35 56 00 00       	add    eax,0x5635
 56e:	00 05 03 8c 22 10    	add    BYTE PTR ds:0x10228c03,al
 574:	03 17                	add    edx,DWORD PTR [edi]
 576:	6a 00                	push   0x0
 578:	00 00                	add    BYTE PTR [eax],al
 57a:	05 36 56 00 00       	add    eax,0x5636
 57f:	00 05 03 84 22 10    	add    BYTE PTR ds:0x10228403,al
 585:	03 17                	add    edx,DWORD PTR [edi]
 587:	d2 02                	rol    BYTE PTR [edx],cl
 589:	00 00                	add    BYTE PTR [eax],al
 58b:	05 37 7a 00 00       	add    eax,0x7a37
 590:	00 05 03 a4 22 10    	add    BYTE PTR ds:0x1022a403,al
 596:	03 17                	add    edx,DWORD PTR [edi]
 598:	1d 02 00 00 06       	sbb    eax,0x6000002
 59d:	4c                   	dec    esp
 59e:	b5 02                	mov    ch,0x2
 5a0:	00 00                	add    BYTE PTR [eax],al
 5a2:	05 03 94 22 10       	add    eax,0x10229403
 5a7:	03 18                	add    ebx,DWORD PTR [eax]
 5a9:	17                   	pop    ss
 5aa:	3d 01 00 00 04       	cmp    eax,0x4000001
 5af:	22 ba 05 00 00 05    	and    bh,BYTE PTR [edx+0x5000005]
 5b5:	03 90 22 10 03 07    	add    edx,DWORD PTR [eax+0x7031022]
 5bb:	04 a8                	add    al,0xa8
 5bd:	05 00 00 19 cb       	add    eax,0xcb190000
 5c2:	05 00 00 1a 5c       	add    eax,0x5c1a0000
 5c7:	01 00                	add    DWORD PTR [eax],eax
 5c9:	00 00                	add    BYTE PTR [eax],al
 5cb:	17                   	pop    ss
 5cc:	09 01                	or     DWORD PTR [ecx],eax
 5ce:	00 00                	add    BYTE PTR [eax],al
 5d0:	04 23                	add    al,0x23
 5d2:	dc 05 00 00 05 03    	fadd   QWORD PTR ds:0x3050000
 5d8:	80 22 10             	and    BYTE PTR [edx],0x10
 5db:	03 07                	add    eax,DWORD PTR [edi]
 5dd:	04 c0                	add    al,0xc0
 5df:	05 00 00 11 25       	add    eax,0x25110000
 5e4:	00 00                	add    BYTE PTR [eax],al
 5e6:	00 f3                	add    bl,dh
 5e8:	05 00 00 1b 36       	add    eax,0x361b0000
 5ed:	02 00                	add    al,BYTE PTR [eax]
 5ef:	00 ff                	add    bh,bh
 5f1:	01 00                	add    DWORD PTR [eax],eax
 5f3:	17                   	pop    ss
 5f4:	b1 01                	mov    cl,0x1
 5f6:	00 00                	add    BYTE PTR [eax],al
 5f8:	04 29                	add    al,0x29
 5fa:	e2 05                	loop   601 <cmdPrintEnv-0x30ff9ff>
 5fc:	00 00                	add    BYTE PTR [eax],al
 5fe:	05 03 80 20 10       	add    eax,0x10208003
 603:	03 17                	add    edx,DWORD PTR [edi]
 605:	fb                   	sti    
 606:	02 00                	add    al,BYTE PTR [eax]
 608:	00 04 2a             	add    BYTE PTR [edx+ebp*1],al
 60b:	5c                   	pop    esp
 60c:	01 00                	add    DWORD PTR [eax],eax
 60e:	00 05 03 a0 22 10    	add    BYTE PTR ds:0x1022a003,al
 614:	03 17                	add    edx,DWORD PTR [edi]
 616:	00 00                	add    BYTE PTR [eax],al
 618:	00 00                	add    BYTE PTR [eax],al
 61a:	04 2b                	add    al,0x2b
 61c:	b5 02                	mov    ch,0x2
 61e:	00 00                	add    BYTE PTR [eax],al
 620:	05 03 68 1f 10       	add    eax,0x101f6803
 625:	03 11                	add    edx,DWORD PTR [ecx]
 627:	25 00 00 00 36       	and    eax,0x36000000
 62c:	06                   	push   es
 62d:	00 00                	add    BYTE PTR [eax],al
 62f:	12 36                	adc    dh,BYTE PTR [esi]
 631:	02 00                	add    al,BYTE PTR [eax]
 633:	00 05 00 17 2d 01    	add    BYTE PTR ds:0x12d1700,al
 639:	00 00                	add    BYTE PTR [eax],al
 63b:	04 2c                	add    al,0x2c
 63d:	26                   	es
 63e:	06                   	push   es
 63f:	00 00                	add    BYTE PTR [eax],al
 641:	05 03 60 1f 10       	add    eax,0x101f6003
 646:	03 17                	add    edx,DWORD PTR [edi]
 648:	29 02                	sub    DWORD PTR [edx],eax
 64a:	00 00                	add    BYTE PTR [eax],al
 64c:	04 2d                	add    al,0x2d
 64e:	56                   	push   esi
 64f:	00 00                	add    BYTE PTR [eax],al
 651:	00 05 03 9c 22 10    	add    BYTE PTR ds:0x10229c03,al
 657:	03 17                	add    edx,DWORD PTR [edi]
 659:	97                   	xchg   edi,eax
 65a:	01 00                	add    DWORD PTR [eax],eax
 65c:	00 04 2d 56 00 00 00 	add    BYTE PTR [ebp*1+0x56],al
 663:	05 03 98 22 10       	add    eax,0x10229803
 668:	03 17                	add    edx,DWORD PTR [edi]
 66a:	b4 02                	mov    ah,0x2
 66c:	00 00                	add    BYTE PTR [eax],al
 66e:	04 2e                	add    al,0x2e
 670:	1c 01                	sbb    al,0x1
 672:	00 00                	add    BYTE PTR [eax],al
 674:	05 03 a8 22 10       	add    eax,0x1022a803
 679:	03 11                	add    edx,DWORD PTR [ecx]
 67b:	25 00 00 00 8a       	and    eax,0x8a000000
 680:	06                   	push   es
 681:	00 00                	add    BYTE PTR [eax],al
 683:	12 36                	adc    dh,BYTE PTR [esi]
 685:	02 00                	add    al,BYTE PTR [eax]
 687:	00 ff                	add    bh,bh
 689:	00 1c 63             	add    BYTE PTR [ebx+eiz*2],bl
 68c:	77 64                	ja     6f2 <cmdPrintEnv-0x30ff90e>
 68e:	00 04 2f             	add    BYTE PTR [edi+ebp*1],al
 691:	7a 06                	jp     699 <cmdPrintEnv-0x30ff967>
 693:	00 00                	add    BYTE PTR [eax],al
 695:	05 03 80 1f 10       	add    eax,0x101f8003
 69a:	03 00                	add    eax,DWORD PTR [eax]
 69c:	e2 06                	loop   6a4 <cmdPrintEnv-0x30ff95c>
 69e:	00 00                	add    BYTE PTR [eax],al
 6a0:	04 00                	add    al,0x0
 6a2:	76 01                	jbe    6a5 <cmdPrintEnv-0x30ff95b>
 6a4:	00 00                	add    BYTE PTR [eax],al
 6a6:	04 01                	add    al,0x1
 6a8:	a2 00 00 00 0c       	mov    ds:0xc000000,al
 6ad:	9f                   	lahf   
 6ae:	03 00                	add    eax,DWORD PTR [eax]
 6b0:	00 37                	add    BYTE PTR [edi],dh
 6b2:	00 00                	add    BYTE PTR [eax],al
 6b4:	00 f8                	add    al,bh
 6b6:	05 10 03 67 0a       	add    eax,0xa670310
 6bb:	00 00                	add    BYTE PTR [eax],al
 6bd:	96                   	xchg   esi,eax
 6be:	01 00                	add    DWORD PTR [eax],eax
 6c0:	00 02                	add    BYTE PTR [edx],al
 6c2:	01 06                	add    DWORD PTR [esi],eax
 6c4:	e8 01 00 00 02       	call   20006ca <cmdPrintEnv-0x10ff936>
 6c9:	01 06                	add    DWORD PTR [esi],eax
 6cb:	e1 01                	loope  6ce <cmdPrintEnv-0x30ff932>
 6cd:	00 00                	add    BYTE PTR [eax],al
 6cf:	02 02                	add    al,BYTE PTR [edx]
 6d1:	05 7e 00 00 00       	add    eax,0x7e
 6d6:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
 6dd:	02 08                	add    cl,BYTE PTR [eax]
 6df:	05 68 01 00 00       	add    eax,0x168
 6e4:	04 c5                	add    al,0xc5
 6e6:	03 00                	add    eax,DWORD PTR [eax]
 6e8:	00 02                	add    BYTE PTR [edx],al
 6ea:	2e                   	cs
 6eb:	53                   	push   ebx
 6ec:	00 00                	add    BYTE PTR [eax],al
 6ee:	00 02                	add    BYTE PTR [edx],al
 6f0:	01 08                	add    DWORD PTR [eax],ecx
 6f2:	df 01                	fild   WORD PTR [ecx]
 6f4:	00 00                	add    BYTE PTR [eax],al
 6f6:	02 02                	add    al,BYTE PTR [edx]
 6f8:	07                   	pop    es
 6f9:	39 02                	cmp    DWORD PTR [edx],eax
 6fb:	00 00                	add    BYTE PTR [eax],al
 6fd:	04 0c                	add    al,0xc
 6ff:	02 00                	add    al,BYTE PTR [eax]
 701:	00 02                	add    BYTE PTR [edx],al
 703:	34 6c                	xor    al,0x6c
 705:	00 00                	add    BYTE PTR [eax],al
 707:	00 02                	add    BYTE PTR [edx],al
 709:	04 07                	add    al,0x7
 70b:	ff 01                	inc    DWORD PTR [ecx]
 70d:	00 00                	add    BYTE PTR [eax],al
 70f:	02 08                	add    cl,BYTE PTR [eax]
 711:	07                   	pop    es
 712:	f5                   	cmc    
 713:	01 00                	add    DWORD PTR [eax],eax
 715:	00 02                	add    BYTE PTR [edx],al
 717:	04 05                	add    al,0x5
 719:	6d                   	ins    DWORD PTR es:[edi],dx
 71a:	01 00                	add    DWORD PTR [eax],eax
 71c:	00 05 04 87 00 00    	add    BYTE PTR ds:0x8704,al
 722:	00 06                	add    BYTE PTR [esi],al
 724:	25 00 00 00 02       	and    eax,0x2000000
 729:	01 02                	add    DWORD PTR [edx],eax
 72b:	74 02                	je     72f <cmdPrintEnv-0x30ff8d1>
 72d:	00 00                	add    BYTE PTR [eax],al
 72f:	07                   	pop    es
 730:	10 03                	adc    BYTE PTR [ebx],al
 732:	12 cc                	adc    cl,ah
 734:	00 00                	add    BYTE PTR [eax],al
 736:	00 08                	add    BYTE PTR [eax],cl
 738:	ca 01 00             	retf   0x1
 73b:	00 03                	add    BYTE PTR [ebx],al
 73d:	14 cc                	adc    al,0xcc
 73f:	00 00                	add    BYTE PTR [eax],al
 741:	00 00                	add    BYTE PTR [eax],al
 743:	08 72 00             	or     BYTE PTR [edx+0x0],dh
 746:	00 00                	add    BYTE PTR [eax],al
 748:	03 15 cc 00 00 00    	add    edx,DWORD PTR ds:0xcc
 74e:	04 08                	add    al,0x8
 750:	45                   	inc    ebp
 751:	01 00                	add    DWORD PTR [eax],eax
 753:	00 03                	add    BYTE PTR [ebx],al
 755:	16                   	push   ss
 756:	d2 00                	rol    BYTE PTR [eax],cl
 758:	00 00                	add    BYTE PTR [eax],al
 75a:	08 08                	or     BYTE PTR [eax],cl
 75c:	56                   	push   esi
 75d:	01 00                	add    DWORD PTR [eax],eax
 75f:	00 03                	add    BYTE PTR [ebx],al
 761:	17                   	pop    ss
 762:	3a 00                	cmp    al,BYTE PTR [eax]
 764:	00 00                	add    BYTE PTR [eax],al
 766:	0c 00                	or     al,0x0
 768:	05 04 25 00 00       	add    eax,0x2504
 76d:	00 09                	add    BYTE PTR [ecx],cl
 76f:	04 04                	add    al,0x4
 771:	17                   	pop    ss
 772:	03 00                	add    eax,DWORD PTR [eax]
 774:	00 03                	add    BYTE PTR [ebx],al
 776:	18 93 00 00 00 0a    	sbb    BYTE PTR [ebx+0xa000000],dl
 77c:	8b 03                	mov    eax,DWORD PTR [ebx]
 77e:	00 00                	add    BYTE PTR [eax],al
 780:	01 18                	add    DWORD PTR [eax],ebx
 782:	f8                   	clc    
 783:	05 10 03 a6 00       	add    eax,0xa60310
 788:	00 00                	add    BYTE PTR [eax],al
 78a:	01 9c 0f 01 00 00 0b 	add    DWORD PTR [edi+ecx*1+0xb000001],ebx
 791:	96                   	xchg   esi,eax
 792:	03 00                	add    eax,DWORD PTR [eax]
 794:	00 01                	add    BYTE PTR [ecx],al
 796:	18 cc                	sbb    ah,cl
 798:	00 00                	add    BYTE PTR [eax],al
 79a:	00 02                	add    BYTE PTR [edx],al
 79c:	91                   	xchg   ecx,eax
 79d:	00 0c 69             	add    BYTE PTR [ecx+ebp*2],cl
 7a0:	00 01                	add    BYTE PTR [ecx],al
 7a2:	1a 3a                	sbb    bh,BYTE PTR [edx]
 7a4:	00 00                	add    BYTE PTR [eax],al
 7a6:	00 02                	add    BYTE PTR [edx],al
 7a8:	91                   	xchg   ecx,eax
 7a9:	6c                   	ins    BYTE PTR es:[edi],dx
 7aa:	00 0d 5a 03 00 00    	add    BYTE PTR ds:0x35a,cl
 7b0:	01 30                	add    DWORD PTR [eax],esi
 7b2:	3a 00                	cmp    al,BYTE PTR [eax]
 7b4:	00 00                	add    BYTE PTR [eax],al
 7b6:	9e                   	sahf   
 7b7:	06                   	push   es
 7b8:	10 03                	adc    BYTE PTR [ebx],al
 7ba:	a9 01 00 00 01       	test   eax,0x1000001
 7bf:	9c                   	pushf  
 7c0:	ad                   	lods   eax,DWORD PTR ds:[esi]
 7c1:	01 00                	add    DWORD PTR [eax],eax
 7c3:	00 0b                	add    BYTE PTR [ebx],cl
 7c5:	a2 04 00 00 01       	mov    ds:0x1000004,al
 7ca:	30 cc                	xor    ah,cl
 7cc:	00 00                	add    BYTE PTR [eax],al
 7ce:	00 02                	add    BYTE PTR [edx],al
 7d0:	91                   	xchg   ecx,eax
 7d1:	00 0b                	add    BYTE PTR [ebx],cl
 7d3:	c3                   	ret    
 7d4:	01 00                	add    DWORD PTR [eax],eax
 7d6:	00 01                	add    BYTE PTR [ecx],al
 7d8:	30 c4                	xor    ah,al
 7da:	01 00                	add    DWORD PTR [eax],eax
 7dc:	00 02                	add    BYTE PTR [edx],al
 7de:	91                   	xchg   ecx,eax
 7df:	04 0b                	add    al,0xb
 7e1:	97                   	xchg   edi,eax
 7e2:	04 00                	add    al,0x0
 7e4:	00 01                	add    BYTE PTR [ecx],al
 7e6:	30 3a                	xor    BYTE PTR [edx],bh
 7e8:	00 00                	add    BYTE PTR [eax],al
 7ea:	00 02                	add    BYTE PTR [edx],al
 7ec:	91                   	xchg   ecx,eax
 7ed:	08 0c 78             	or     BYTE PTR [eax+edi*2],cl
 7f0:	00 01                	add    BYTE PTR [ecx],al
 7f2:	32 3a                	xor    bh,BYTE PTR [edx]
 7f4:	00 00                	add    BYTE PTR [eax],al
 7f6:	00 02                	add    BYTE PTR [edx],al
 7f8:	91                   	xchg   ecx,eax
 7f9:	6c                   	ins    BYTE PTR es:[edi],dx
 7fa:	0c 79                	or     al,0x79
 7fc:	00 01                	add    BYTE PTR [ecx],al
 7fe:	32 3a                	xor    bh,BYTE PTR [edx]
 800:	00 00                	add    BYTE PTR [eax],al
 802:	00 02                	add    BYTE PTR [edx],al
 804:	91                   	xchg   ecx,eax
 805:	68 0e aa 04 00       	push   0x4aa0e
 80a:	00 01                	add    BYTE PTR [ecx],al
 80c:	33 3a                	xor    edi,DWORD PTR [edx]
 80e:	00 00                	add    BYTE PTR [eax],al
 810:	00 02                	add    BYTE PTR [edx],al
 812:	91                   	xchg   ecx,eax
 813:	64                   	fs
 814:	0e                   	push   cs
 815:	7f 03                	jg     81a <cmdPrintEnv-0x30ff7e6>
 817:	00 00                	add    BYTE PTR [eax],al
 819:	01 33                	add    DWORD PTR [ebx],esi
 81b:	3a 00                	cmp    al,BYTE PTR [eax]
 81d:	00 00                	add    BYTE PTR [eax],al
 81f:	02 91 60 0e f6 03    	add    dl,BYTE PTR [ecx+0x3f60e60]
 825:	00 00                	add    BYTE PTR [eax],al
 827:	01 34 8c             	add    DWORD PTR [esp+ecx*4],esi
 82a:	00 00                	add    BYTE PTR [eax],al
 82c:	00 02                	add    BYTE PTR [edx],al
 82e:	91                   	xchg   ecx,eax
 82f:	5f                   	pop    edi
 830:	0f d9 06             	psubusw mm0,QWORD PTR [esi]
 833:	10 03                	adc    BYTE PTR [ebx],al
 835:	47                   	inc    edi
 836:	01 00                	add    DWORD PTR [eax],eax
 838:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 83b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 83c:	74 00                	je     83e <cmdPrintEnv-0x30ff7c2>
 83e:	01 38                	add    DWORD PTR [eax],edi
 840:	6c                   	ins    BYTE PTR es:[edi],dx
 841:	00 00                	add    BYTE PTR [eax],al
 843:	00 02                	add    BYTE PTR [edx],al
 845:	91                   	xchg   ecx,eax
 846:	58                   	pop    eax
 847:	00 00                	add    BYTE PTR [eax],al
 849:	10 25 00 00 00 bd    	adc    BYTE PTR ds:0xbd000000,ah
 84f:	01 00                	add    DWORD PTR [eax],eax
 851:	00 11                	add    BYTE PTR [ecx],dl
 853:	bd 01 00 00 7f       	mov    ebp,0x7f000001
 858:	00 02                	add    BYTE PTR [edx],al
 85a:	04 07                	add    al,0x7
 85c:	88 00                	mov    BYTE PTR [eax],al
 85e:	00 00                	add    BYTE PTR [eax],al
 860:	05 04 ad 01 00       	add    eax,0x1ad04
 865:	00 0d e1 03 00 00    	add    BYTE PTR ds:0x3e1,cl
 86b:	01 62 3a             	add    DWORD PTR [edx+0x3a],esp
 86e:	00 00                	add    BYTE PTR [eax],al
 870:	00 47 08             	add    BYTE PTR [edi+0x8],al
 873:	10 03                	adc    BYTE PTR [ebx],al
 875:	69 00 00 00 01 9c    	imul   eax,DWORD PTR [eax],0x9c010000
 87b:	0c 02                	or     al,0x2
 87d:	00 00                	add    BYTE PTR [eax],al
 87f:	0b df                	or     ebx,edi
 881:	04 00                	add    al,0x0
 883:	00 01                	add    BYTE PTR [ecx],al
 885:	62                   	(bad)  
 886:	cc                   	int3   
 887:	00 00                	add    BYTE PTR [eax],al
 889:	00 02                	add    BYTE PTR [edx],al
 88b:	91                   	xchg   ecx,eax
 88c:	00 0c 69             	add    BYTE PTR [ecx+ebp*2],cl
 88f:	00 01                	add    BYTE PTR [ecx],al
 891:	64                   	fs
 892:	6c                   	ins    BYTE PTR es:[edi],dx
 893:	00 00                	add    BYTE PTR [eax],al
 895:	00 02                	add    BYTE PTR [edx],al
 897:	91                   	xchg   ecx,eax
 898:	6c                   	ins    BYTE PTR es:[edi],dx
 899:	0c 72                	or     al,0x72
 89b:	65                   	gs
 89c:	74 00                	je     89e <cmdPrintEnv-0x30ff762>
 89e:	01 65 3a             	add    DWORD PTR [ebp+0x3a],esp
 8a1:	00 00                	add    BYTE PTR [eax],al
 8a3:	00 02                	add    BYTE PTR [edx],al
 8a5:	91                   	xchg   ecx,eax
 8a6:	68 00 0d 4f 04       	push   0x44f0d00
 8ab:	00 00                	add    BYTE PTR [eax],al
 8ad:	01 76 ca             	add    DWORD PTR [esi-0x36],esi
 8b0:	02 00                	add    al,BYTE PTR [eax]
 8b2:	00 b0 08 10 03 8e    	add    BYTE PTR [eax-0x71fceff8],dh
 8b8:	02 00                	add    al,BYTE PTR [eax]
 8ba:	00 01                	add    BYTE PTR [ecx],al
 8bc:	9c                   	pushf  
 8bd:	ca 02 00             	retf   0x2
 8c0:	00 0b                	add    BYTE PTR [ebx],cl
 8c2:	6b 03 00             	imul   eax,DWORD PTR [ebx],0x0
 8c5:	00 01                	add    BYTE PTR [ecx],al
 8c7:	76 81                	jbe    84a <cmdPrintEnv-0x30ff7b6>
 8c9:	00 00                	add    BYTE PTR [eax],al
 8cb:	00 02                	add    BYTE PTR [edx],al
 8cd:	91                   	xchg   ecx,eax
 8ce:	00 0c 61             	add    BYTE PTR [ecx+eiz*2],cl
 8d1:	72 67                	jb     93a <cmdPrintEnv-0x30ff6c6>
 8d3:	00 01                	add    BYTE PTR [ecx],al
 8d5:	78 cc                	js     8a3 <cmdPrintEnv-0x30ff75d>
 8d7:	00 00                	add    BYTE PTR [eax],al
 8d9:	00 02                	add    BYTE PTR [edx],al
 8db:	91                   	xchg   ecx,eax
 8dc:	6c                   	ins    BYTE PTR es:[edi],dx
 8dd:	0e                   	push   cs
 8de:	b2 04                	mov    dl,0x4
 8e0:	00 00                	add    BYTE PTR [eax],al
 8e2:	01 79 cc             	add    DWORD PTR [ecx-0x34],edi
 8e5:	00 00                	add    BYTE PTR [eax],al
 8e7:	00 02                	add    BYTE PTR [edx],al
 8e9:	91                   	xchg   ecx,eax
 8ea:	68 0e 2d 04 00       	push   0x42d0e
 8ef:	00 01                	add    BYTE PTR [ecx],al
 8f1:	7a 3a                	jp     92d <cmdPrintEnv-0x30ff6d3>
 8f3:	00 00                	add    BYTE PTR [eax],al
 8f5:	00 02                	add    BYTE PTR [edx],al
 8f7:	91                   	xchg   ecx,eax
 8f8:	64                   	fs
 8f9:	0e                   	push   cs
 8fa:	ac                   	lods   al,BYTE PTR ds:[esi]
 8fb:	03 00                	add    eax,DWORD PTR [eax]
 8fd:	00 01                	add    BYTE PTR [ecx],al
 8ff:	7b 3a                	jnp    93b <cmdPrintEnv-0x30ff6c5>
 901:	00 00                	add    BYTE PTR [eax],al
 903:	00 02                	add    BYTE PTR [edx],al
 905:	91                   	xchg   ecx,eax
 906:	60                   	pusha  
 907:	0e                   	push   cs
 908:	2c 04                	sub    al,0x4
 90a:	00 00                	add    BYTE PTR [eax],al
 90c:	01 7c 3a 00          	add    DWORD PTR [edx+edi*1+0x0],edi
 910:	00 00                	add    BYTE PTR [eax],al
 912:	02 91 5c 0e 37 04    	add    dl,BYTE PTR [ecx+0x4370e5c]
 918:	00 00                	add    BYTE PTR [eax],al
 91a:	01 7d 3a             	add    DWORD PTR [ebp+0x3a],edi
 91d:	00 00                	add    BYTE PTR [eax],al
 91f:	00 02                	add    BYTE PTR [edx],al
 921:	91                   	xchg   ecx,eax
 922:	58                   	pop    eax
 923:	0e                   	push   cs
 924:	34 04                	xor    al,0x4
 926:	00 00                	add    BYTE PTR [eax],al
 928:	01 7e 3a             	add    DWORD PTR [esi+0x3a],edi
 92b:	00 00                	add    BYTE PTR [eax],al
 92d:	00 02                	add    BYTE PTR [edx],al
 92f:	91                   	xchg   ecx,eax
 930:	54                   	push   esp
 931:	0e                   	push   cs
 932:	54                   	push   esp
 933:	04 00                	add    al,0x0
 935:	00 01                	add    BYTE PTR [ecx],al
 937:	7f ca                	jg     903 <cmdPrintEnv-0x30ff6fd>
 939:	02 00                	add    al,BYTE PTR [eax]
 93b:	00 02                	add    BYTE PTR [edx],al
 93d:	91                   	xchg   ecx,eax
 93e:	50                   	push   eax
 93f:	0e                   	push   cs
 940:	9c                   	pushf  
 941:	04 00                	add    al,0x0
 943:	00 01                	add    BYTE PTR [ecx],al
 945:	80 ca 02             	or     dl,0x2
 948:	00 00                	add    BYTE PTR [eax],al
 94a:	02 91 4c 0f 71 0a    	add    dl,BYTE PTR [ecx+0xa710f4c]
 950:	10 03                	adc    BYTE PTR [ebx],al
 952:	9e                   	sahf   
 953:	00 00                	add    BYTE PTR [eax],al
 955:	00 0e                	add    BYTE PTR [esi],cl
 957:	55                   	push   ebp
 958:	03 00                	add    eax,DWORD PTR [eax]
 95a:	00 01                	add    BYTE PTR [ecx],al
 95c:	d9 cc                	fxch   st(4)
 95e:	00 00                	add    BYTE PTR [eax],al
 960:	00 02                	add    BYTE PTR [edx],al
 962:	91                   	xchg   ecx,eax
 963:	48                   	dec    eax
 964:	00 00                	add    BYTE PTR [eax],al
 966:	05 04 cc 00 00       	add    eax,0xcc04
 96b:	00 0d 10 04 00 00    	add    BYTE PTR ds:0x410,cl
 971:	01 ef                	add    edi,ebp
 973:	ca 02 00             	retf   0x2
 976:	00 3e                	add    BYTE PTR [esi],bh
 978:	0b 10                	or     edx,DWORD PTR [eax]
 97a:	03 76 00             	add    esi,DWORD PTR [esi+0x0]
 97d:	00 00                	add    BYTE PTR [eax],al
 97f:	01 9c 2c 03 00 00 0b 	add    DWORD PTR [esp+ebp*1+0xb000003],ebx
 986:	32 02                	xor    al,BYTE PTR [edx]
 988:	00 00                	add    BYTE PTR [eax],al
 98a:	01 ef                	add    edi,ebp
 98c:	3a 00                	cmp    al,BYTE PTR [eax]
 98e:	00 00                	add    BYTE PTR [eax],al
 990:	02 91 00 0b c3 01    	add    dl,BYTE PTR [ecx+0x1c30b00]
 996:	00 00                	add    BYTE PTR [eax],al
 998:	01 ef                	add    edi,ebp
 99a:	c4 01                	les    eax,FWORD PTR [ecx]
 99c:	00 00                	add    BYTE PTR [eax],al
 99e:	02 91 04 0b 92 04    	add    dl,BYTE PTR [ecx+0x4920b04]
 9a4:	00 00                	add    BYTE PTR [eax],al
 9a6:	01 ef                	add    edi,ebp
 9a8:	ca 02 00             	retf   0x2
 9ab:	00 02                	add    BYTE PTR [edx],al
 9ad:	91                   	xchg   ecx,eax
 9ae:	08 0f                	or     BYTE PTR [edi],cl
 9b0:	45                   	inc    ebp
 9b1:	0b 10                	or     edx,DWORD PTR [eax]
 9b3:	03 67 00             	add    esp,DWORD PTR [edi+0x0]
 9b6:	00 00                	add    BYTE PTR [eax],al
 9b8:	0c 63                	or     al,0x63
 9ba:	6e                   	outs   dx,BYTE PTR ds:[esi]
 9bb:	74 00                	je     9bd <cmdPrintEnv-0x30ff643>
 9bd:	01 f1                	add    ecx,esi
 9bf:	3a 00                	cmp    al,BYTE PTR [eax]
 9c1:	00 00                	add    BYTE PTR [eax],al
 9c3:	02 91 6c 00 00 0a    	add    dl,BYTE PTR [ecx+0xa00006c]
 9c9:	ed                   	in     eax,dx
 9ca:	03 00                	add    eax,DWORD PTR [eax]
 9cc:	00 01                	add    BYTE PTR [ecx],al
 9ce:	f9                   	stc    
 9cf:	b4 0b                	mov    ah,0xb
 9d1:	10 03                	adc    BYTE PTR [ebx],al
 9d3:	3d 00 00 00 01       	cmp    eax,0x1000000
 9d8:	9c                   	pushf  
 9d9:	76 03                	jbe    9de <cmdPrintEnv-0x30ff622>
 9db:	00 00                	add    BYTE PTR [eax],al
 9dd:	0b 32                	or     esi,DWORD PTR [edx]
 9df:	02 00                	add    al,BYTE PTR [eax]
 9e1:	00 01                	add    BYTE PTR [ecx],al
 9e3:	f9                   	stc    
 9e4:	3a 00                	cmp    al,BYTE PTR [eax]
 9e6:	00 00                	add    BYTE PTR [eax],al
 9e8:	02 91 00 0b c3 01    	add    dl,BYTE PTR [ecx+0x1c30b00]
 9ee:	00 00                	add    BYTE PTR [eax],al
 9f0:	01 f9                	add    ecx,edi
 9f2:	ca 02 00             	retf   0x2
 9f5:	00 02                	add    BYTE PTR [edx],al
 9f7:	91                   	xchg   ecx,eax
 9f8:	04 0f                	add    al,0xf
 9fa:	ba 0b 10 03 26       	mov    edx,0x2603100b
 9ff:	00 00                	add    BYTE PTR [eax],al
 a01:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 a04:	6e                   	outs   dx,BYTE PTR ds:[esi]
 a05:	74 00                	je     a07 <cmdPrintEnv-0x30ff5f9>
 a07:	01 fb                	add    ebx,edi
 a09:	3a 00                	cmp    al,BYTE PTR [eax]
 a0b:	00 00                	add    BYTE PTR [eax],al
 a0d:	02 91 6c 00 00 12    	add    dl,BYTE PTR [ecx+0x1200006c]
 a13:	cd 03                	int    0x3
 a15:	00 00                	add    BYTE PTR [eax],al
 a17:	01 00                	add    DWORD PTR [eax],eax
 a19:	01 8c 00 00 00 f1 0b 	add    DWORD PTR [eax+eax*1+0xbf10000],ecx
 a20:	10 03                	adc    BYTE PTR [ebx],al
 a22:	8c 00                	mov    WORD PTR [eax],es
 a24:	00 00                	add    BYTE PTR [eax],al
 a26:	01 9c e1 03 00 00 13 	add    DWORD PTR [ecx+eiz*8+0x13000003],ebx
 a2d:	3c 04                	cmp    al,0x4
 a2f:	00 00                	add    BYTE PTR [eax],al
 a31:	01 00                	add    DWORD PTR [eax],eax
 a33:	01 cc                	add    esp,ecx
 a35:	00 00                	add    BYTE PTR [eax],al
 a37:	00 02                	add    BYTE PTR [edx],al
 a39:	91                   	xchg   ecx,eax
 a3a:	00 13                	add    BYTE PTR [ebx],dl
 a3c:	b3 03                	mov    bl,0x3
 a3e:	00 00                	add    BYTE PTR [eax],al
 a40:	01 00                	add    DWORD PTR [eax],eax
 a42:	01 cc                	add    esp,ecx
 a44:	00 00                	add    BYTE PTR [eax],al
 a46:	00 02                	add    BYTE PTR [edx],al
 a48:	91                   	xchg   ecx,eax
 a49:	04 0f                	add    al,0xf
 a4b:	f7                   	(bad)  
 a4c:	0b 10                	or     edx,DWORD PTR [eax]
 a4e:	03 7f 00             	add    edi,DWORD PTR [edi+0x0]
 a51:	00 00                	add    BYTE PTR [eax],al
 a53:	14 63                	adc    al,0x63
 a55:	6e                   	outs   dx,BYTE PTR ds:[esi]
 a56:	74 00                	je     a58 <cmdPrintEnv-0x30ff5a8>
 a58:	01 03                	add    DWORD PTR [ebx],eax
 a5a:	01 3a                	add    DWORD PTR [edx],edi
 a5c:	00 00                	add    BYTE PTR [eax],al
 a5e:	00 02                	add    BYTE PTR [edx],al
 a60:	91                   	xchg   ecx,eax
 a61:	6c                   	ins    BYTE PTR es:[edi],dx
 a62:	0f 13 0c 10          	movlps QWORD PTR [eax+edx*1],xmm1
 a66:	03 59 00             	add    ebx,DWORD PTR [ecx+0x0]
 a69:	00 00                	add    BYTE PTR [eax],al
 a6b:	14 69                	adc    al,0x69
 a6d:	64                   	fs
 a6e:	78 00                	js     a70 <cmdPrintEnv-0x30ff590>
 a70:	01 07                	add    DWORD PTR [edi],eax
 a72:	01 cc                	add    esp,ecx
 a74:	00 00                	add    BYTE PTR [eax],al
 a76:	00 02                	add    BYTE PTR [edx],al
 a78:	91                   	xchg   ecx,eax
 a79:	68 00 00 00 15       	push   0x15000000
 a7e:	43                   	inc    ebx
 a7f:	04 00                	add    al,0x0
 a81:	00 01                	add    BYTE PTR [ecx],al
 a83:	1f                   	pop    ds
 a84:	01 7d 0c             	add    DWORD PTR [ebp+0xc],edi
 a87:	10 03                	adc    BYTE PTR [ebx],al
 a89:	2e 00 00             	add    BYTE PTR cs:[eax],al
 a8c:	00 01                	add    BYTE PTR [ecx],al
 a8e:	9c                   	pushf  
 a8f:	07                   	pop    es
 a90:	04 00                	add    al,0x0
 a92:	00 13                	add    BYTE PTR [ebx],dl
 a94:	df 04 00             	fild   WORD PTR [eax+eax*1]
 a97:	00 01                	add    BYTE PTR [ecx],al
 a99:	1f                   	pop    ds
 a9a:	01 cc                	add    esp,ecx
 a9c:	00 00                	add    BYTE PTR [eax],al
 a9e:	00 02                	add    BYTE PTR [edx],al
 aa0:	91                   	xchg   ecx,eax
 aa1:	00 00                	add    BYTE PTR [eax],al
 aa3:	16                   	push   ss
 aa4:	37                   	aaa    
 aa5:	03 00                	add    eax,DWORD PTR [eax]
 aa7:	00 01                	add    BYTE PTR [ecx],al
 aa9:	24 01                	and    al,0x1
 aab:	ab                   	stos   DWORD PTR es:[edi],eax
 aac:	0c 10                	or     al,0x10
 aae:	03 23                	add    esp,DWORD PTR [ebx]
 ab0:	00 00                	add    BYTE PTR [eax],al
 ab2:	00 01                	add    BYTE PTR [ecx],al
 ab4:	9c                   	pushf  
 ab5:	12 1d 04 00 00 01    	adc    bl,BYTE PTR ds:0x1000004
 abb:	29 01                	sub    DWORD PTR [ecx],eax
 abd:	3a 00                	cmp    al,BYTE PTR [eax]
 abf:	00 00                	add    BYTE PTR [eax],al
 ac1:	ce                   	into   
 ac2:	0c 10                	or     al,0x10
 ac4:	03 26                	add    esp,DWORD PTR [esi]
 ac6:	00 00                	add    BYTE PTR [eax],al
 ac8:	00 01                	add    BYTE PTR [ecx],al
 aca:	9c                   	pushf  
 acb:	51                   	push   ecx
 acc:	04 00                	add    al,0x0
 ace:	00 13                	add    BYTE PTR [ebx],dl
 ad0:	df 04 00             	fild   WORD PTR [eax+eax*1]
 ad3:	00 01                	add    BYTE PTR [ecx],al
 ad5:	29 01                	sub    DWORD PTR [ecx],eax
 ad7:	cc                   	int3   
 ad8:	00 00                	add    BYTE PTR [eax],al
 ada:	00 02                	add    BYTE PTR [edx],al
 adc:	91                   	xchg   ecx,eax
 add:	00 17                	add    BYTE PTR [edi],dl
 adf:	ba 04 00 00 01       	mov    edx,0x1000004
 ae4:	2b 01                	sub    eax,DWORD PTR [ecx]
 ae6:	3a 00                	cmp    al,BYTE PTR [eax]
 ae8:	00 00                	add    BYTE PTR [eax],al
 aea:	18 00                	sbb    BYTE PTR [eax],al
 aec:	00 12                	add    BYTE PTR [edx],dl
 aee:	71 04                	jno    af4 <cmdPrintEnv-0x30ff50c>
 af0:	00 00                	add    BYTE PTR [eax],al
 af2:	01 32                	add    DWORD PTR [edx],esi
 af4:	01 3a                	add    DWORD PTR [edx],edi
 af6:	00 00                	add    BYTE PTR [eax],al
 af8:	00 f4                	add    ah,dh
 afa:	0c 10                	or     al,0x10
 afc:	03 6b 03             	add    ebp,DWORD PTR [ebx+0x3]
 aff:	00 00                	add    BYTE PTR [eax],al
 b01:	01 9c 22 05 00 00 13 	add    DWORD PTR [edx+eiz*1+0x13000005],ebx
 b08:	37                   	aaa    
 b09:	04 00                	add    al,0x0
 b0b:	00 01                	add    BYTE PTR [ecx],al
 b0d:	32 01                	xor    al,BYTE PTR [ecx]
 b0f:	3a 00                	cmp    al,BYTE PTR [eax]
 b11:	00 00                	add    BYTE PTR [eax],al
 b13:	02 91 00 13 54 04    	add    dl,BYTE PTR [ecx+0x4541300]
 b19:	00 00                	add    BYTE PTR [eax],al
 b1b:	01 32                	add    DWORD PTR [edx],esi
 b1d:	01 ca                	add    edx,ecx
 b1f:	02 00                	add    al,BYTE PTR [eax]
 b21:	00 02                	add    BYTE PTR [edx],al
 b23:	91                   	xchg   ecx,eax
 b24:	04 13                	add    al,0x13
 b26:	3e 03 00             	add    eax,DWORD PTR ds:[eax]
 b29:	00 01                	add    BYTE PTR [ecx],al
 b2b:	32 01                	xor    al,BYTE PTR [ecx]
 b2d:	ca 02 00             	retf   0x2
 b30:	00 02                	add    BYTE PTR [edx],al
 b32:	91                   	xchg   ecx,eax
 b33:	08 19                	or     BYTE PTR [ecx],bl
 b35:	96                   	xchg   esi,eax
 b36:	03 00                	add    eax,DWORD PTR [eax]
 b38:	00 01                	add    BYTE PTR [ecx],al
 b3a:	34 01                	xor    al,0x1
 b3c:	22 05 00 00 03 91    	and    al,BYTE PTR ds:0x91030000
 b42:	e4 7d                	in     al,0x7d
 b44:	19 68 04             	sbb    DWORD PTR [eax+0x4],ebp
 b47:	00 00                	add    BYTE PTR [eax],al
 b49:	01 35 01 48 00 00    	add    DWORD PTR ds:0x4801,esi
 b4f:	00 03                	add    BYTE PTR [ebx],al
 b51:	91                   	xchg   ecx,eax
 b52:	e3 7d                	jecxz  bd1 <cmdPrintEnv-0x30ff42f>
 b54:	19 71 03             	sbb    DWORD PTR [ecx+0x3],esi
 b57:	00 00                	add    BYTE PTR [eax],al
 b59:	01 36                	add    DWORD PTR [esi],esi
 b5b:	01 3a                	add    DWORD PTR [edx],edi
 b5d:	00 00                	add    BYTE PTR [eax],al
 b5f:	00 02                	add    BYTE PTR [edx],al
 b61:	91                   	xchg   ecx,eax
 b62:	6c                   	ins    BYTE PTR es:[edi],dx
 b63:	19 c3                	sbb    ebx,eax
 b65:	04 00                	add    al,0x0
 b67:	00 01                	add    BYTE PTR [ecx],al
 b69:	37                   	aaa    
 b6a:	01 3a                	add    DWORD PTR [edx],edi
 b6c:	00 00                	add    BYTE PTR [eax],al
 b6e:	00 02                	add    BYTE PTR [edx],al
 b70:	91                   	xchg   ecx,eax
 b71:	68 19 78 04 00       	push   0x47819
 b76:	00 01                	add    BYTE PTR [ecx],al
 b78:	38 01                	cmp    BYTE PTR [ecx],al
 b7a:	32 05 00 00 03 91    	xor    al,BYTE PTR ds:0x91030000
 b80:	cf                   	iret   
 b81:	7d 1a                	jge    b9d <cmdPrintEnv-0x30ff463>
 b83:	b9 03 00 00 01       	mov    ecx,0x1000003
 b88:	46                   	inc    esi
 b89:	01 8d 0d 10 03 1a    	add    DWORD PTR [ebp+0x1a03100d],ecx
 b8f:	e7 04                	out    0x4,eax
 b91:	00 00                	add    BYTE PTR [eax],al
 b93:	01 4e 01             	add    DWORD PTR [esi+0x1],ecx
 b96:	df 0d 10 03 1a 27    	fisttp WORD PTR ds:0x271a0310
 b9c:	03 00                	add    eax,DWORD PTR [eax]
 b9e:	00 01                	add    BYTE PTR [ecx],al
 ba0:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 ba1:	01 b1 0f 10 03 0f    	add    DWORD PTR [ecx+0xf03100f],esi
 ba7:	8d 0d 10 03 a8 02    	lea    ecx,ds:0x2a80310
 bad:	00 00                	add    BYTE PTR [eax],al
 baf:	14 69                	adc    al,0x69
 bb1:	00 01                	add    BYTE PTR [ecx],al
 bb3:	a9 01 3a 00 00       	test   eax,0x3a01
 bb8:	00 02                	add    BYTE PTR [edx],al
 bba:	91                   	xchg   ecx,eax
 bbb:	64 00 00             	add    BYTE PTR fs:[eax],al
 bbe:	10 25 00 00 00 32    	adc    BYTE PTR ds:0x32000000,ah
 bc4:	05 00 00 11 bd       	add    eax,0xbd110000
 bc9:	01 00                	add    DWORD PTR [eax],eax
 bcb:	00 ff                	add    bh,bh
 bcd:	00 10                	add    BYTE PTR [eax],dl
 bcf:	25 00 00 00 42       	and    eax,0x42000000
 bd4:	05 00 00 11 bd       	add    eax,0xbd110000
 bd9:	01 00                	add    DWORD PTR [eax],eax
 bdb:	00 13                	add    BYTE PTR [ebx],dl
 bdd:	00 10                	add    BYTE PTR [eax],dl
 bdf:	d4 00                	aam    0x0
 be1:	00 00                	add    BYTE PTR [eax],al
 be3:	52                   	push   edx
 be4:	05 00 00 11 bd       	add    eax,0xbd110000
 be9:	01 00                	add    DWORD PTR [eax],eax
 beb:	00 07                	add    BYTE PTR [edi],al
 bed:	00 0e                	add    BYTE PTR [esi],cl
 bef:	cd 02                	int    0x2
 bf1:	00 00                	add    BYTE PTR [eax],al
 bf3:	03 31                	add    esi,DWORD PTR [ecx]
 bf5:	42                   	inc    edx
 bf6:	05 00 00 05 03       	add    eax,0x3050000
 bfb:	c0 1d 10 03 1b bf 02 	rcr    BYTE PTR ds:0xbf1b0310,0x2
 c02:	00 00                	add    BYTE PTR [eax],al
 c04:	04 34                	add    al,0x34
 c06:	61                   	popa   
 c07:	00 00                	add    BYTE PTR [eax],al
 c09:	00 05 03 88 22 10    	add    BYTE PTR ds:0x10228803,al
 c0f:	03 1b                	add    ebx,DWORD PTR [ebx]
 c11:	a8 01                	test   al,0x1
 c13:	00 00                	add    BYTE PTR [eax],al
 c15:	04 35                	add    al,0x35
 c17:	61                   	popa   
 c18:	00 00                	add    BYTE PTR [eax],al
 c1a:	00 05 03 8c 22 10    	add    BYTE PTR ds:0x10228c03,al
 c20:	03 1b                	add    ebx,DWORD PTR [ebx]
 c22:	6a 00                	push   0x0
 c24:	00 00                	add    BYTE PTR [eax],al
 c26:	04 36                	add    al,0x36
 c28:	61                   	popa   
 c29:	00 00                	add    BYTE PTR [eax],al
 c2b:	00 05 03 84 22 10    	add    BYTE PTR ds:0x10228403,al
 c31:	03 1b                	add    ebx,DWORD PTR [ebx]
 c33:	d2 02                	rol    BYTE PTR [edx],cl
 c35:	00 00                	add    BYTE PTR [eax],al
 c37:	04 37                	add    al,0x37
 c39:	7a 00                	jp     c3b <cmdPrintEnv-0x30ff3c5>
 c3b:	00 00                	add    BYTE PTR [eax],al
 c3d:	05 03 a4 22 10       	add    eax,0x1022a403
 c42:	03 1b                	add    ebx,DWORD PTR [ebx]
 c44:	1d 02 00 00 05       	sbb    eax,0x5000002
 c49:	4c                   	dec    esp
 c4a:	ca 02 00             	retf   0x2
 c4d:	00 05 03 94 22 10    	add    BYTE PTR ds:0x10229403,al
 c53:	03 1c 1b             	add    ebx,DWORD PTR [ebx+ebx*1]
 c56:	3d 01 00 00 03       	cmp    eax,0x3000001
 c5b:	22 ca                	and    cl,dl
 c5d:	05 00 00 05 03       	add    eax,0x3050000
 c62:	90                   	nop
 c63:	22 10                	and    dl,BYTE PTR [eax]
 c65:	03 05 04 b8 05 00    	add    eax,DWORD PTR ds:0x5b804
 c6b:	00 1d db 05 00 00    	add    BYTE PTR ds:0x5db,bl
 c71:	1e                   	push   ds
 c72:	cc                   	int3   
 c73:	00 00                	add    BYTE PTR [eax],al
 c75:	00 00                	add    BYTE PTR [eax],al
 c77:	1b 09                	sbb    ecx,DWORD PTR [ecx]
 c79:	01 00                	add    DWORD PTR [eax],eax
 c7b:	00 03                	add    BYTE PTR [ebx],al
 c7d:	23 ec                	and    ebp,esp
 c7f:	05 00 00 05 03       	add    eax,0x3050000
 c84:	80 22 10             	and    BYTE PTR [edx],0x10
 c87:	03 05 04 d0 05 00    	add    eax,DWORD PTR ds:0x5d004
 c8d:	00 10                	add    BYTE PTR [eax],dl
 c8f:	25 00 00 00 03       	and    eax,0x3000000
 c94:	06                   	push   es
 c95:	00 00                	add    BYTE PTR [eax],al
 c97:	1f                   	pop    ds
 c98:	bd 01 00 00 ff       	mov    ebp,0xff000001
 c9d:	01 00                	add    DWORD PTR [eax],eax
 c9f:	1b b1 01 00 00 03    	sbb    esi,DWORD PTR [ecx+0x3000001]
 ca5:	29 f2                	sub    edx,esi
 ca7:	05 00 00 05 03       	add    eax,0x3050000
 cac:	80 20 10             	and    BYTE PTR [eax],0x10
 caf:	03 1b                	add    ebx,DWORD PTR [ebx]
 cb1:	fb                   	sti    
 cb2:	02 00                	add    al,BYTE PTR [eax]
 cb4:	00 03                	add    BYTE PTR [ebx],al
 cb6:	2a cc                	sub    cl,ah
 cb8:	00 00                	add    BYTE PTR [eax],al
 cba:	00 05 03 a0 22 10    	add    BYTE PTR ds:0x1022a003,al
 cc0:	03 1b                	add    ebx,DWORD PTR [ebx]
 cc2:	00 00                	add    BYTE PTR [eax],al
 cc4:	00 00                	add    BYTE PTR [eax],al
 cc6:	03 2b                	add    ebp,DWORD PTR [ebx]
 cc8:	ca 02 00             	retf   0x2
 ccb:	00 05 03 68 1f 10    	add    BYTE PTR ds:0x101f6803,al
 cd1:	03 10                	add    edx,DWORD PTR [eax]
 cd3:	25 00 00 00 46       	and    eax,0x46000000
 cd8:	06                   	push   es
 cd9:	00 00                	add    BYTE PTR [eax],al
 cdb:	11 bd 01 00 00 05    	adc    DWORD PTR [ebp+0x5000001],edi
 ce1:	00 1b                	add    BYTE PTR [ebx],bl
 ce3:	2d 01 00 00 03       	sub    eax,0x3000001
 ce8:	2c 36                	sub    al,0x36
 cea:	06                   	push   es
 ceb:	00 00                	add    BYTE PTR [eax],al
 ced:	05 03 60 1f 10       	add    eax,0x101f6003
 cf2:	03 1b                	add    ebx,DWORD PTR [ebx]
 cf4:	29 02                	sub    DWORD PTR [edx],eax
 cf6:	00 00                	add    BYTE PTR [eax],al
 cf8:	03 2d 61 00 00 00    	add    ebp,DWORD PTR ds:0x61
 cfe:	05 03 9c 22 10       	add    eax,0x10229c03
 d03:	03 1b                	add    ebx,DWORD PTR [ebx]
 d05:	97                   	xchg   edi,eax
 d06:	01 00                	add    DWORD PTR [eax],eax
 d08:	00 03                	add    BYTE PTR [ebx],al
 d0a:	2d 61 00 00 00       	sub    eax,0x61
 d0f:	05 03 98 22 10       	add    eax,0x10229803
 d14:	03 1b                	add    ebx,DWORD PTR [ebx]
 d16:	b4 02                	mov    ah,0x2
 d18:	00 00                	add    BYTE PTR [eax],al
 d1a:	03 2e                	add    ebp,DWORD PTR [esi]
 d1c:	8c 00                	mov    WORD PTR [eax],es
 d1e:	00 00                	add    BYTE PTR [eax],al
 d20:	05 03 a8 22 10       	add    eax,0x1022a803
 d25:	03 20                	add    esp,DWORD PTR [eax]
 d27:	63 77 64             	arpl   WORD PTR [edi+0x64],si
 d2a:	00 03                	add    BYTE PTR [ebx],al
 d2c:	2f                   	das    
 d2d:	22 05 00 00 05 03    	and    al,BYTE PTR ds:0x3050000
 d33:	80 1f 10             	sbb    BYTE PTR [edi],0x10
 d36:	03 10                	add    edx,DWORD PTR [eax]
 d38:	25 00 00 00 b2       	and    eax,0xb2000000
 d3d:	06                   	push   es
 d3e:	00 00                	add    BYTE PTR [eax],al
 d40:	1f                   	pop    ds
 d41:	bd 01 00 00 f3       	mov    ebp,0xf3000001
 d46:	01 11                	add    DWORD PTR [ecx],edx
 d48:	bd 01 00 00 7f       	mov    ebp,0x7f000001
 d4d:	00 1b                	add    BYTE PTR [ebx],bl
 d4f:	59                   	pop    ecx
 d50:	04 00                	add    al,0x0
 d52:	00 01                	add    BYTE PTR [ecx],al
 d54:	10 9b 06 00 00 05    	adc    BYTE PTR [ebx+0x5000006],bl
 d5a:	03 c0                	add    eax,eax
 d5c:	22 10                	and    dl,BYTE PTR [eax]
 d5e:	03 1b                	add    ebx,DWORD PTR [ebx]
 d60:	80 04 00 00          	add    BYTE PTR [eax+eax*1],0x0
 d64:	01 11                	add    DWORD PTR [ecx],edx
 d66:	3a 00                	cmp    al,BYTE PTR [eax]
 d68:	00 00                	add    BYTE PTR [eax],al
 d6a:	05 03 ac 22 10       	add    eax,0x1022ac03
 d6f:	03 1b                	add    ebx,DWORD PTR [ebx]
 d71:	43                   	inc    ebx
 d72:	03 00                	add    eax,DWORD PTR [eax]
 d74:	00 01                	add    BYTE PTR [ecx],al
 d76:	12 3a                	adc    bh,BYTE PTR [edx]
 d78:	00 00                	add    BYTE PTR [eax],al
 d7a:	00 05 03 b0 22 10    	add    BYTE PTR ds:0x1022b003,al
 d80:	03 00                	add    eax,DWORD PTR [eax]

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
  14:	f5                   	cmc    
  15:	05 00 00 00 00       	add    eax,0x0
  1a:	00 00                	add    BYTE PTR [eax],al
  1c:	00 00                	add    BYTE PTR [eax],al
  1e:	00 00                	add    BYTE PTR [eax],al
  20:	1c 00                	sbb    al,0x0
  22:	00 00                	add    BYTE PTR [eax],al
  24:	02 00                	add    al,BYTE PTR [eax]
  26:	9c                   	pushf  
  27:	06                   	push   es
  28:	00 00                	add    BYTE PTR [eax],al
  2a:	04 00                	add    al,0x0
  2c:	00 00                	add    BYTE PTR [eax],al
  2e:	00 00                	add    BYTE PTR [eax],al
  30:	f8                   	clc    
  31:	05 10 03 67 0a       	add    eax,0xa670310
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	92                   	xchg   edx,eax
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
 164:	bb 68 02 22 13       	mov    ebx,0x13220268
 169:	02 2e                	add    ch,BYTE PTR [esi]
 16b:	15 00 02 04 02       	adc    eax,0x2040200
 170:	03 79 02             	add    edi,DWORD PTR [ecx+0x2]
 173:	2c 01                	sub    al,0x1
 175:	00 02                	add    BYTE PTR [edx],al
 177:	04 01                	add    al,0x1
 179:	06                   	push   es
 17a:	4a                   	dec    edx
 17b:	06                   	push   es
 17c:	03 09                	add    ecx,DWORD PTR [ecx]
 17e:	9e                   	sahf   
 17f:	3f                   	aas    
 180:	67 08 2f             	or     BYTE PTR [bx],ch
 183:	02 24 13             	add    ah,BYTE PTR [ebx+edx*1]
 186:	d7                   	xlat   BYTE PTR ds:[ebx]
 187:	3f                   	aas    
 188:	92                   	xchg   edx,eax
 189:	08 bc ae 08 24 02 22 	or     BYTE PTR [esi+ebp*4+0x22022408],bh
 190:	13 02                	adc    eax,DWORD PTR [edx]
 192:	02 00                	add    al,BYTE PTR [eax]
 194:	01 01                	add    DWORD PTR [ecx],eax
 196:	70 02                	jo     19a <cmdPrintEnv-0x30ffe66>
 198:	00 00                	add    BYTE PTR [eax],al
 19a:	02 00                	add    al,BYTE PTR [eax]
 19c:	b6 00                	mov    dh,0x0
 19e:	00 00                	add    BYTE PTR [eax],al
 1a0:	01 01                	add    DWORD PTR [ecx],eax
 1a2:	fb                   	sti    
 1a3:	0e                   	push   cs
 1a4:	0d 00 01 01 01       	or     eax,0x1010100
 1a9:	01 00                	add    DWORD PTR [eax],eax
 1ab:	00 00                	add    BYTE PTR [eax],al
 1ad:	01 00                	add    DWORD PTR [eax],eax
 1af:	00 01                	add    BYTE PTR [ecx],al
 1b1:	73 72                	jae    225 <cmdPrintEnv-0x30ffddb>
 1b3:	63 00                	arpl   WORD PTR [eax],ax
 1b5:	2f                   	das    
 1b6:	68 6f 6d 65 2f       	push   0x2f656d6f
 1bb:	79 6f                	jns    22c <cmdPrintEnv-0x30ffdd4>
 1bd:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
 1c4:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 1c7:	73 73                	jae    23c <cmdPrintEnv-0x30ffdc4>
 1c9:	2f                   	das    
 1ca:	6c                   	ins    BYTE PTR es:[edi],dx
 1cb:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
 1d2:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
 1d8:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
 1de:	78 2d                	js     20d <cmdPrintEnv-0x30ffdf3>
 1e0:	67 6e                	outs   dx,BYTE PTR ds:[si]
 1e2:	75 2f                	jne    213 <cmdPrintEnv-0x30ffded>
 1e4:	35 2e 33 2e 30       	xor    eax,0x302e332e
 1e9:	2f                   	das    
 1ea:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 1f1:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 1f4:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 1f8:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 1fb:	2e                   	cs
 1fc:	2f                   	das    
 1fd:	6c                   	ins    BYTE PTR es:[edi],dx
 1fe:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 205:	4f                   	dec    edi
 206:	53                   	push   ebx
 207:	2f                   	das    
 208:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 20f:	00 00                	add    BYTE PTR [eax],al
 211:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 215:	6c                   	ins    BYTE PTR es:[edi],dx
 216:	6c                   	ins    BYTE PTR es:[edi],dx
 217:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 21a:	01 00                	add    DWORD PTR [eax],eax
 21c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 21f:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
 226:	63 
 227:	2e                   	cs
 228:	68 00 02 00 00       	push   0x200
 22d:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 231:	6c                   	ins    BYTE PTR es:[edi],dx
 232:	6c                   	ins    BYTE PTR es:[edi],dx
 233:	2e                   	cs
 234:	68 00 03 00 00       	push   0x300
 239:	6d                   	ins    DWORD PTR es:[edi],dx
 23a:	61                   	popa   
 23b:	6c                   	ins    BYTE PTR es:[edi],dx
 23c:	6c                   	ins    BYTE PTR es:[edi],dx
 23d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 23e:	63 2e                	arpl   WORD PTR [esi],bp
 240:	68 00 04 00 00       	push   0x400
 245:	6c                   	ins    BYTE PTR es:[edi],dx
 246:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 24d:	4f                   	dec    edi
 24e:	53                   	push   ebx
 24f:	2e                   	cs
 250:	68 00 04 00 00       	push   0x400
 255:	00 00                	add    BYTE PTR [eax],al
 257:	05 02 f8 05 10       	add    eax,0x1005f802
 25c:	03 03                	add    eax,DWORD PTR [ebx]
 25e:	18 01                	sbb    BYTE PTR [ecx],al
 260:	75 08                	jne    26a <cmdPrintEnv-0x30ffd96>
 262:	14 68                	adc    al,0x68
 264:	4c                   	dec    esp
 265:	08 21                	or     BYTE PTR [ecx],ah
 267:	08 21                	or     BYTE PTR [ecx],ah
 269:	08 13                	or     BYTE PTR [ebx],dl
 26b:	03 0b                	add    ecx,DWORD PTR [ebx]
 26d:	74 03                	je     272 <cmdPrintEnv-0x30ffd8e>
 26f:	78 2e                	js     29f <cmdPrintEnv-0x30ffd61>
 271:	02 30                	add    dh,BYTE PTR [eax]
 273:	1a 2c d8             	sbb    ch,BYTE PTR [eax+ebx*8]
 276:	69 75 d7 d7 4c 08 3e 	imul   esi,DWORD PTR [ebp-0x29],0x3e084cd7
 27d:	bc e6 ae 94 08       	mov    esp,0x894aee6
 282:	4b                   	dec    ebx
 283:	e5 93                	in     eax,0x93
 285:	00 02                	add    BYTE PTR [edx],al
 287:	04 02                	add    al,0x2
 289:	06                   	push   es
 28a:	e4 00                	in     al,0x0
 28c:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
 28f:	e4 00                	in     al,0x0
 291:	02 04 05 e4 06 af 00 	add    al,BYTE PTR [eax*1+0xaf06e4]
 298:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 29b:	06                   	push   es
 29c:	e4 06                	in     al,0x6
 29e:	e5 02                	in     eax,0x2
 2a0:	25 13 08 4b 67       	and    eax,0x674b0813
 2a5:	e3 34                	jecxz  2db <cmdPrintEnv-0x30ffd25>
 2a7:	00 02                	add    BYTE PTR [edx],al
 2a9:	04 02                	add    al,0x2
 2ab:	02 25 14 00 02 04    	add    ah,BYTE PTR ds:0x4020014
 2b1:	02 03                	add    al,BYTE PTR [ebx]
 2b3:	63 4a 00             	arpl   WORD PTR [edx+0x0],cx
 2b6:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 2b9:	06                   	push   es
 2ba:	4a                   	dec    edx
 2bb:	06                   	push   es
 2bc:	03 1f                	add    ebx,DWORD PTR [edi]
 2be:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 2c1:	4b                   	dec    ebx
 2c2:	08 4f 3d             	or     BYTE PTR [edi+0x3d],cl
 2c5:	5b                   	pop    ebx
 2c6:	6a 92                	push   0xffffff92
 2c8:	02 3b                	add    bh,BYTE PTR [ebx]
 2ca:	14 69                	adc    al,0x69
 2cc:	00 02                	add    BYTE PTR [edx],al
 2ce:	04 02                	add    al,0x2
 2d0:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 2d3:	00 02                	add    BYTE PTR [edx],al
 2d5:	04 01                	add    al,0x1
 2d7:	06                   	push   es
 2d8:	4a                   	dec    edx
 2d9:	06                   	push   es
 2da:	03 0b                	add    ecx,DWORD PTR [ebx]
 2dc:	66 59                	pop    cx
 2de:	32 69 75             	xor    ch,BYTE PTR [ecx+0x75]
 2e1:	75 75                	jne    358 <cmdPrintEnv-0x30ffca8>
 2e3:	75 75                	jne    35a <cmdPrintEnv-0x30ffca6>
 2e5:	78 a1                	js     288 <cmdPrintEnv-0x30ffd78>
 2e7:	08 ec                	or     ah,ch
 2e9:	00 02                	add    BYTE PTR [edx],al
 2eb:	04 01                	add    al,0x1
 2ed:	06                   	push   es
 2ee:	66 06                	pushw  es
 2f0:	af                   	scas   eax,DWORD PTR es:[edi]
 2f1:	68 75 08 4c 67       	push   0x674c0875
 2f6:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 2f9:	5a                   	pop    edx
 2fa:	00 02                	add    BYTE PTR [edx],al
 2fc:	04 01                	add    al,0x1
 2fe:	06                   	push   es
 2ff:	9e                   	sahf   
 300:	00 02                	add    BYTE PTR [edx],al
 302:	04 02                	add    al,0x2
 304:	66                   	data16
 305:	00 02                	add    BYTE PTR [edx],al
 307:	04 03                	add    al,0x3
 309:	66 06                	pushw  es
 30b:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 30c:	68 75 08 5a a0       	push   0xa05a0875
 311:	bc 68 a0 94 08       	mov    esp,0x894a068
 316:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 319:	94                   	xchg   esp,eax
 31a:	08 33                	or     BYTE PTR [ebx],dh
 31c:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 321:	16                   	push   ss
 322:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 325:	03 3a                	add    edi,DWORD PTR [edx]
 327:	d6                   	(bad)  
 328:	68 d8 08 e7 08       	push   0x8e708d8
 32d:	13 d7                	adc    edx,edi
 32f:	08 e5                	or     ch,ah
 331:	08 3e                	or     BYTE PTR [esi],bh
 333:	4b                   	dec    ebx
 334:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 337:	d9 d9                	(bad)  
 339:	d7                   	xlat   BYTE PTR ds:[ebx]
 33a:	d7                   	xlat   BYTE PTR ds:[ebx]
 33b:	3d 31 75 00 02       	cmp    eax,0x2007531
 340:	04 03                	add    al,0x3
 342:	92                   	xchg   edx,eax
 343:	00 02                	add    BYTE PTR [edx],al
 345:	04 03                	add    al,0x3
 347:	02 22                	add    ah,BYTE PTR [edx]
 349:	13 00                	adc    eax,DWORD PTR [eax]
 34b:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 34e:	02 30                	add    dh,BYTE PTR [eax]
 350:	0f 00 02             	sldt   WORD PTR [edx]
 353:	04 01                	add    al,0x1
 355:	06                   	push   es
 356:	4a                   	dec    edx
 357:	06                   	push   es
 358:	87 3d 5b 67 00 02    	xchg   DWORD PTR ds:0x200675b,edi
 35e:	04 03                	add    al,0x3
 360:	91                   	xchg   ecx,eax
 361:	00 02                	add    BYTE PTR [edx],al
 363:	04 03                	add    al,0x3
 365:	ff 00                	inc    DWORD PTR [eax]
 367:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 36a:	06                   	push   es
 36b:	4a                   	dec    edx
 36c:	06                   	push   es
 36d:	84 d7                	test   bh,dl
 36f:	3f                   	aas    
 370:	68 92 08 30 08       	push   0x8300892
 375:	f3 68 08 5a 08 4c    	repz push 0x4c085a08
 37b:	00 02                	add    BYTE PTR [edx],al
 37d:	04 02                	add    al,0x2
 37f:	03 75 74             	add    esi,DWORD PTR [ebp+0x74]
 382:	00 02                	add    BYTE PTR [edx],al
 384:	04 01                	add    al,0x1
 386:	06                   	push   es
 387:	4a                   	dec    edx
 388:	06                   	push   es
 389:	03 0f                	add    ecx,DWORD PTR [edi]
 38b:	66 59                	pop    cx
 38d:	03 0d 2e 67 02 25    	add    ecx,DWORD PTR ds:0x2502672e
 393:	13 3f                	adc    edi,DWORD PTR [edi]
 395:	67 08 91 3f 67       	or     BYTE PTR [bx+di+0x673f],dl
 39a:	59                   	pop    ecx
 39b:	59                   	pop    ecx
 39c:	08 30                	or     BYTE PTR [eax],dh
 39e:	40                   	inc    eax
 39f:	92                   	xchg   edx,eax
 3a0:	75 75                	jne    417 <cmdPrintEnv-0x30ffbe9>
 3a2:	77 9f                	ja     343 <cmdPrintEnv-0x30ffcbd>
 3a4:	75 08                	jne    3ae <cmdPrintEnv-0x30ffc52>
 3a6:	4b                   	dec    ebx
 3a7:	83 75 08 4b          	xor    DWORD PTR [ebp+0x8],0x4b
 3ab:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 3ae:	5b                   	pop    ebx
 3af:	5b                   	pop    ebx
 3b0:	9f                   	lahf   
 3b1:	75 75                	jne    428 <cmdPrintEnv-0x30ffbd8>
 3b3:	75 08                	jne    3bd <cmdPrintEnv-0x30ffc43>
 3b5:	83 08 4b             	or     DWORD PTR [eax],0x4b
 3b8:	5a                   	pop    edx
 3b9:	75 30                	jne    3eb <cmdPrintEnv-0x30ffc15>
 3bb:	08 56 b1             	or     BYTE PTR [esi-0x4f],dl
 3be:	ae                   	scas   al,BYTE PTR es:[edi]
 3bf:	93                   	xchg   ebx,eax
 3c0:	bc 02 2d 13 83       	mov    esp,0x83132d02
 3c5:	08 21                	or     BYTE PTR [ecx],ah
 3c7:	08 4c 5d e6          	or     BYTE PTR [ebp+ebx*2-0x1a],cl
 3cb:	cb                   	retf   
 3cc:	08 4c 02 2d          	or     BYTE PTR [edx+eax*1+0x2d],cl
 3d0:	13 83 e5 75 08 21    	adc    eax,DWORD PTR [ebx+0x210875e5]
 3d6:	08 4c 5d ae          	or     BYTE PTR [ebp+ebx*2-0x52],cl
 3da:	a0 f3 4d 5a e7       	mov    al,ds:0xe75a4df3
 3df:	ae                   	scas   al,BYTE PTR es:[edi]
 3e0:	4b                   	dec    ebx
 3e1:	d7                   	xlat   BYTE PTR ds:[ebx]
 3e2:	03 0c 90             	add    ecx,DWORD PTR [eax+edx*4]
 3e5:	ae                   	scas   al,BYTE PTR es:[edi]
 3e6:	f3 03 0c 20          	repz add ecx,DWORD PTR [eax+eiz*1]
 3ea:	03 78 f2             	add    edi,DWORD PTR [eax-0xe]
 3ed:	08 67 08             	or     BYTE PTR [edi+0x8],ah
 3f0:	22 76 5d             	and    dh,BYTE PTR [esi+0x5d]
 3f3:	67 08 21             	or     BYTE PTR [bx+di],ah
 3f6:	08 4b 03             	or     BYTE PTR [ebx+0x3],cl
 3f9:	9a 7f 08 20 03 e8 00 	call   0xe8:0x320087f
 400:	08 20                	or     BYTE PTR [eax],ah
 402:	08 13                	or     BYTE PTR [ebx],dl
 404:	59                   	pop    ecx
 405:	02 02                	add    al,BYTE PTR [edx]
 407:	00 01                	add    BYTE PTR [ecx],al
 409:	01                   	.byte 0x1

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
 27e:	69 6e 00 74 6d 5f 69 	imul   ebp,DWORD PTR [esi+0x0],0x695f6d74
 285:	73 64                	jae    2eb <cmdPrintEnv-0x30ffd15>
 287:	73 74                	jae    2fd <cmdPrintEnv-0x30ffd03>
 289:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 28c:	64                   	fs
 28d:	54                   	push   esp
 28e:	69 6d 65 00 63 6d 64 	imul   ebp,DWORD PTR [ebp+0x65],0x646d6300
 295:	53                   	push   ebx
 296:	65                   	gs
 297:	74 45                	je     2de <cmdPrintEnv-0x30ffd22>
 299:	6e                   	outs   dx,BYTE PTR ds:[esi]
 29a:	76 00                	jbe    29c <cmdPrintEnv-0x30ffd64>
 29c:	73 74                	jae    312 <cmdPrintEnv-0x30ffcee>
 29e:	61                   	popa   
 29f:	72 74                	jb     315 <cmdPrintEnv-0x30ffceb>
 2a1:	54                   	push   esp
 2a2:	69 6d 65 00 63 6d 64 	imul   ebp,DWORD PTR [ebp+0x65],0x646d6300
 2a9:	48                   	dec    eax
 2aa:	65                   	gs
 2ab:	6c                   	ins    BYTE PTR es:[edi],dx
 2ac:	70 00                	jo     2ae <cmdPrintEnv-0x30ffd52>
 2ae:	66 6f                	outs   dx,WORD PTR ds:[esi]
 2b0:	75 6e                	jne    320 <cmdPrintEnv-0x30ffce0>
 2b2:	64 00 74 69 6d       	add    BYTE PTR fs:[ecx+ebp*2+0x6d],dh
 2b7:	65                   	gs
 2b8:	54                   	push   esp
 2b9:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2ba:	45                   	inc    ebp
 2bb:	78 69                	js     326 <cmdPrintEnv-0x30ffcda>
 2bd:	74 00                	je     2bf <cmdPrintEnv-0x30ffd41>
 2bf:	68 65 61 70 42       	push   0x42706165
 2c4:	61                   	popa   
 2c5:	73 65                	jae    32c <cmdPrintEnv-0x30ffcd4>
 2c7:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 2ca:	74 68                	je     334 <cmdPrintEnv-0x30ffccc>
 2cc:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 2cf:	64                   	fs
 2d0:	73 00                	jae    2d2 <cmdPrintEnv-0x30ffd2e>
 2d2:	6c                   	ins    BYTE PTR es:[edi],dx
 2d3:	69 62 63 54 5a 00 72 	imul   esp,DWORD PTR [edx+0x63],0x72005a54
 2da:	65                   	gs
 2db:	74 56                	je     333 <cmdPrintEnv-0x30ffccd>
 2dd:	61                   	popa   
 2de:	6c                   	ins    BYTE PTR es:[edi],dx
 2df:	00 74 6d 5f          	add    BYTE PTR [ebp+ebp*2+0x5f],dh
 2e3:	73 65                	jae    34a <cmdPrintEnv-0x30ffcb6>
 2e5:	63 00                	arpl   WORD PTR [eax],ax
 2e7:	62 61 63             	bound  esp,QWORD PTR [ecx+0x63]
 2ea:	6b 67 72 6f          	imul   esp,DWORD PTR [edi+0x72],0x6f
 2ee:	75 6e                	jne    35e <cmdPrintEnv-0x30ffca2>
 2f0:	64 00 76 61          	add    BYTE PTR fs:[esi+0x61],dh
 2f4:	6c                   	ins    BYTE PTR es:[edi],dx
 2f5:	75 65                	jne    35c <cmdPrintEnv-0x30ffca4>
 2f7:	4c                   	dec    esp
 2f8:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2fa:	00 73 4b             	add    BYTE PTR [ebx+0x4b],dh
 2fd:	53                   	push   ebx
 2fe:	68 65 6c 6c 50       	push   0x506c6c65
 303:	72 6f                	jb     374 <cmdPrintEnv-0x30ffc8c>
 305:	67 72 61             	addr16 jb 369 <cmdPrintEnv-0x30ffc97>
 308:	6d                   	ins    DWORD PTR es:[edi],dx
 309:	4e                   	dec    esi
 30a:	61                   	popa   
 30b:	6d                   	ins    DWORD PTR es:[edi],dx
 30c:	65 00 63 6d          	add    BYTE PTR gs:[ebx+0x6d],ah
 310:	64                   	fs
 311:	45                   	inc    ebp
 312:	78 65                	js     379 <cmdPrintEnv-0x30ffc87>
 314:	63 70 00             	arpl   WORD PTR [eax+0x0],si
 317:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 31a:	6d                   	ins    DWORD PTR es:[edi],dx
 31b:	61                   	popa   
 31c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31d:	64                   	fs
 31e:	5f                   	pop    edi
 31f:	74 61                	je     382 <cmdPrintEnv-0x30ffc7e>
 321:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
 325:	74 00                	je     327 <cmdPrintEnv-0x30ffcd9>
 327:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 329:	6e                   	outs   dx,BYTE PTR ds:[esi]
 32a:	65                   	gs
 32b:	47                   	inc    edi
 32c:	65                   	gs
 32d:	74 74                	je     3a3 <cmdPrintEnv-0x30ffc5d>
 32f:	69 6e 67 4b 65 79 73 	imul   ebp,DWORD PTR [esi+0x67],0x7379654b
 336:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 339:	6f                   	outs   dx,DWORD PTR ds:[esi]
 33a:	6d                   	ins    DWORD PTR es:[edi],dx
 33b:	70 74                	jo     3b1 <cmdPrintEnv-0x30ffc4f>
 33d:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 340:	76 70                	jbe    3b2 <cmdPrintEnv-0x30ffc4e>
 342:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 345:	6d                   	ins    DWORD PTR es:[edi],dx
 346:	6d                   	ins    DWORD PTR es:[edi],dx
 347:	61                   	popa   
 348:	6e                   	outs   dx,BYTE PTR ds:[esi]
 349:	64                   	fs
 34a:	48                   	dec    eax
 34b:	69 73 74 6f 72 79 4d 	imul   esi,DWORD PTR [ebx+0x74],0x4d79726f
 352:	61                   	popa   
 353:	78 00                	js     355 <cmdPrintEnv-0x30ffcab>
 355:	74 65                	je     3bc <cmdPrintEnv-0x30ffc44>
 357:	6d                   	ins    DWORD PTR es:[edi],dx
 358:	70 00                	jo     35a <cmdPrintEnv-0x30ffca6>
 35a:	70 61                	jo     3bd <cmdPrintEnv-0x30ffc43>
 35c:	72 73                	jb     3d1 <cmdPrintEnv-0x30ffc2f>
 35e:	65                   	gs
 35f:	50                   	push   eax
 360:	61                   	popa   
 361:	72 61                	jb     3c4 <cmdPrintEnv-0x30ffc3c>
 363:	6d                   	ins    DWORD PTR es:[edi],dx
 364:	73 53                	jae    3b9 <cmdPrintEnv-0x30ffc47>
 366:	68 65 6c 6c 00       	push   0x6c6c65
 36b:	69 6e 70 75 74 00 6c 	imul   ebp,DWORD PTR [esi+0x70],0x6c007475
 372:	43                   	inc    ebx
 373:	75 72                	jne    3e7 <cmdPrintEnv-0x30ffc19>
 375:	72 4b                	jb     3c2 <cmdPrintEnv-0x30ffc3e>
 377:	65                   	gs
 378:	79 43                	jns    3bd <cmdPrintEnv-0x30ffc43>
 37a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 37b:	75 6e                	jne    3eb <cmdPrintEnv-0x30ffc15>
 37d:	74 00                	je     37f <cmdPrintEnv-0x30ffc81>
 37f:	70 61                	jo     3e2 <cmdPrintEnv-0x30ffc1e>
 381:	72 73                	jb     3f6 <cmdPrintEnv-0x30ffc0a>
 383:	65                   	gs
 384:	64                   	fs
 385:	43                   	inc    ebx
 386:	68 61 72 73 00       	push   0x737261
 38b:	65                   	gs
 38c:	78 65                	js     3f3 <cmdPrintEnv-0x30ffc0d>
 38e:	63 49 6e             	arpl   WORD PTR [ecx+0x6e],cx
 391:	74 65                	je     3f8 <cmdPrintEnv-0x30ffc08>
 393:	72 6e                	jb     403 <cmdPrintEnv-0x30ffbfd>
 395:	61                   	popa   
 396:	6c                   	ins    BYTE PTR es:[edi],dx
 397:	43                   	inc    ebx
 398:	6f                   	outs   dx,DWORD PTR ds:[esi]
 399:	6d                   	ins    DWORD PTR es:[edi],dx
 39a:	6d                   	ins    DWORD PTR es:[edi],dx
 39b:	61                   	popa   
 39c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 39d:	64 00 73 72          	add    BYTE PTR fs:[ebx+0x72],dh
 3a1:	63 2f                	arpl   WORD PTR [edi],bp
 3a3:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3a7:	6c                   	ins    BYTE PTR es:[edi],dx
 3a8:	6c                   	ins    BYTE PTR es:[edi],dx
 3a9:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 3ac:	64                   	fs
 3ad:	71 75                	jno    424 <cmdPrintEnv-0x30ffbdc>
 3af:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3b0:	74 65                	je     417 <cmdPrintEnv-0x30ffbe9>
 3b2:	00 76 61             	add    BYTE PTR [esi+0x61],dh
 3b5:	6c                   	ins    BYTE PTR es:[edi],dx
 3b6:	75 65                	jne    41d <cmdPrintEnv-0x30ffbe3>
 3b8:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3bb:	74 41                	je     3fe <cmdPrintEnv-0x30ffc02>
 3bd:	43                   	inc    ebx
 3be:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3bf:	6d                   	ins    DWORD PTR es:[edi],dx
 3c0:	6d                   	ins    DWORD PTR es:[edi],dx
 3c1:	61                   	popa   
 3c2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3c3:	64 00 75 69          	add    BYTE PTR fs:[ebp+0x69],dh
 3c7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3c8:	74 38                	je     402 <cmdPrintEnv-0x30ffbfe>
 3ca:	5f                   	pop    edi
 3cb:	74 00                	je     3cd <cmdPrintEnv-0x30ffc33>
 3cd:	67                   	addr16
 3ce:	65                   	gs
 3cf:	74 45                	je     416 <cmdPrintEnv-0x30ffbea>
 3d1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3d2:	76 56                	jbe    42a <cmdPrintEnv-0x30ffbd6>
 3d4:	61                   	popa   
 3d5:	72 69                	jb     440 <cmdPrintEnv-0x30ffbc0>
 3d7:	61                   	popa   
 3d8:	62 6c 65 56          	bound  ebp,QWORD PTR [ebp+eiz*2+0x56]
 3dc:	61                   	popa   
 3dd:	6c                   	ins    BYTE PTR es:[edi],dx
 3de:	75 65                	jne    445 <cmdPrintEnv-0x30ffbbb>
 3e0:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 3e3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3e4:	64                   	fs
 3e5:	43                   	inc    ebx
 3e6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3e7:	6d                   	ins    DWORD PTR es:[edi],dx
 3e8:	6d                   	ins    DWORD PTR es:[edi],dx
 3e9:	61                   	popa   
 3ea:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3eb:	64 00 66 72          	add    BYTE PTR fs:[esi+0x72],ah
 3ef:	65                   	gs
 3f0:	65                   	gs
 3f1:	41                   	inc    ecx
 3f2:	72 67                	jb     45b <cmdPrintEnv-0x30ffba5>
 3f4:	56                   	push   esi
 3f5:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 3f8:	65                   	gs
 3f9:	64                   	fs
 3fa:	44                   	inc    esp
 3fb:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3fc:	75 62                	jne    460 <cmdPrintEnv-0x30ffba0>
 3fe:	6c                   	ins    BYTE PTR es:[edi],dx
 3ff:	65                   	gs
 400:	51                   	push   ecx
 401:	75 6f                	jne    472 <cmdPrintEnv-0x30ffb8e>
 403:	74 65                	je     46a <cmdPrintEnv-0x30ffb96>
 405:	74 6f                	je     476 <cmdPrintEnv-0x30ffb8a>
 407:	45                   	inc    ebp
 408:	6e                   	outs   dx,BYTE PTR ds:[esi]
 409:	64                   	fs
 40a:	50                   	push   eax
 40b:	61                   	popa   
 40c:	72 61                	jb     46f <cmdPrintEnv-0x30ffb91>
 40e:	6d                   	ins    DWORD PTR es:[edi],dx
 40f:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 412:	72 61                	jb     475 <cmdPrintEnv-0x30ffb8b>
 414:	6d                   	ins    DWORD PTR es:[edi],dx
 415:	73 54                	jae    46b <cmdPrintEnv-0x30ffb95>
 417:	6f                   	outs   dx,DWORD PTR ds:[esi]
 418:	41                   	inc    ecx
 419:	72 67                	jb     482 <cmdPrintEnv-0x30ffb7e>
 41b:	76 00                	jbe    41d <cmdPrintEnv-0x30ffbe3>
 41d:	72 65                	jb     484 <cmdPrintEnv-0x30ffb7c>
 41f:	70 72                	jo     493 <cmdPrintEnv-0x30ffb6d>
 421:	69 6e 74 43 6f 6d 6d 	imul   ebp,DWORD PTR [esi+0x74],0x6d6d6f43
 428:	61                   	popa   
 429:	6e                   	outs   dx,BYTE PTR ds:[esi]
 42a:	64 00 62 73          	add    BYTE PTR fs:[edx+0x73],ah
 42e:	71 75                	jno    4a5 <cmdPrintEnv-0x30ffb5b>
 430:	6f                   	outs   dx,DWORD PTR ds:[esi]
 431:	74 65                	je     498 <cmdPrintEnv-0x30ffb68>
 433:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 436:	78 61                	js     499 <cmdPrintEnv-0x30ffb67>
 438:	72 67                	jb     4a1 <cmdPrintEnv-0x30ffb5f>
 43a:	63 00                	arpl   WORD PTR [eax],ax
 43c:	65                   	gs
 43d:	76 4e                	jbe    48d <cmdPrintEnv-0x30ffb73>
 43f:	61                   	popa   
 440:	6d                   	ins    DWORD PTR es:[edi],dx
 441:	65 00 73 61          	add    BYTE PTR gs:[ebx+0x61],dh
 445:	76 65                	jbe    4ac <cmdPrintEnv-0x30ffb54>
 447:	43                   	inc    ebx
 448:	6f                   	outs   dx,DWORD PTR ds:[esi]
 449:	6d                   	ins    DWORD PTR es:[edi],dx
 44a:	6d                   	ins    DWORD PTR es:[edi],dx
 44b:	61                   	popa   
 44c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 44d:	64 00 62 75          	add    BYTE PTR fs:[edx+0x75],ah
 451:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 458:	00 
 459:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 45c:	6d                   	ins    DWORD PTR es:[edi],dx
 45d:	61                   	popa   
 45e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 45f:	64                   	fs
 460:	48                   	dec    eax
 461:	69 73 74 6f 72 79 00 	imul   esi,DWORD PTR [ebx+0x74],0x79726f
 468:	6c                   	ins    BYTE PTR es:[edi],dx
 469:	43                   	inc    ebx
 46a:	75 72                	jne    4de <cmdPrintEnv-0x30ffb22>
 46c:	72 4b                	jb     4b9 <cmdPrintEnv-0x30ffb47>
 46e:	65                   	gs
 46f:	79 00                	jns    471 <cmdPrintEnv-0x30ffb8f>
 471:	6b 53 68 65          	imul   edx,DWORD PTR [ebx+0x68],0x65
 475:	6c                   	ins    BYTE PTR es:[edi],dx
 476:	6c                   	ins    BYTE PTR es:[edi],dx
 477:	00 61 6e             	add    BYTE PTR [ecx+0x6e],ah
 47a:	73 69                	jae    4e5 <cmdPrintEnv-0x30ffb1b>
 47c:	53                   	push   ebx
 47d:	65                   	gs
 47e:	71 00                	jno    480 <cmdPrintEnv-0x30ffb80>
 480:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 483:	6d                   	ins    DWORD PTR es:[edi],dx
 484:	61                   	popa   
 485:	6e                   	outs   dx,BYTE PTR ds:[esi]
 486:	64                   	fs
 487:	48                   	dec    eax
 488:	69 73 74 6f 72 79 50 	imul   esi,DWORD PTR [ebx+0x74],0x5079726f
 48f:	74 72                	je     503 <cmdPrintEnv-0x30ffafd>
 491:	00 70 70             	add    BYTE PTR [eax+0x70],dh
 494:	74 72                	je     508 <cmdPrintEnv-0x30ffaf8>
 496:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 499:	7a 65                	jp     500 <cmdPrintEnv-0x30ffb00>
 49b:	00 6e 61             	add    BYTE PTR [esi+0x61],ch
 49e:	72 67                	jb     507 <cmdPrintEnv-0x30ffaf9>
 4a0:	76 00                	jbe    4a2 <cmdPrintEnv-0x30ffb5e>
 4a2:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 4a5:	4c                   	dec    esp
 4a6:	69 6e 65 00 6c 52 65 	imul   ebp,DWORD PTR [esi+0x65],0x65526c00
 4ad:	74 56                	je     505 <cmdPrintEnv-0x30ffafb>
 4af:	61                   	popa   
 4b0:	6c                   	ins    BYTE PTR es:[edi],dx
 4b1:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 4b4:	70 79                	jo     52f <cmdPrintEnv-0x30ffad1>
 4b6:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 4b9:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 4bc:	73 65                	jae    523 <cmdPrintEnv-0x30ffadd>
 4be:	74 52                	je     512 <cmdPrintEnv-0x30ffaee>
 4c0:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4c1:	77 00                	ja     4c3 <cmdPrintEnv-0x30ffb3d>
 4c3:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 4c6:	6d                   	ins    DWORD PTR es:[edi],dx
 4c7:	61                   	popa   
 4c8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4c9:	64                   	fs
 4ca:	57                   	push   edi
 4cb:	61                   	popa   
 4cc:	73 46                	jae    514 <cmdPrintEnv-0x30ffaec>
 4ce:	72 6f                	jb     53f <cmdPrintEnv-0x30ffac1>
 4d0:	6d                   	ins    DWORD PTR es:[edi],dx
 4d1:	54                   	push   esp
 4d2:	68 69 73 42 75       	push   0x75427369
 4d7:	66                   	data16
 4d8:	66                   	data16
 4d9:	65                   	gs
 4da:	72 50                	jb     52c <cmdPrintEnv-0x30ffad4>
 4dc:	74 72                	je     550 <cmdPrintEnv-0x30ffab0>
 4de:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 4e1:	6d                   	ins    DWORD PTR es:[edi],dx
 4e2:	6d                   	ins    DWORD PTR es:[edi],dx
 4e3:	61                   	popa   
 4e4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4e5:	64 00 67 65          	add    BYTE PTR fs:[edi+0x65],ah
 4e9:	74 41                	je     52c <cmdPrintEnv-0x30ffad4>
 4eb:	4b                   	dec    ebx
 4ec:	65                   	gs
 4ed:	79 00                	jns    4ef <cmdPrintEnv-0x30ffb11>

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
