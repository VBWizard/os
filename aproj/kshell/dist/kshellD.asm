
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
 3100009:	68 05 16 10 03       	push   0x3101605
 310000e:	e8 0d 13 00 00       	call   3101320 <kShell+0x424>
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
 3100028:	a1 2c 24 10 03       	mov    eax,ds:0x310242c
 310002d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100030:	c1 e2 02             	shl    edx,0x2
 3100033:	01 d0                	add    eax,edx
 3100035:	8b 00                	mov    eax,DWORD PTR [eax]
 3100037:	85 c0                	test   eax,eax
 3100039:	74 20                	je     310005b <cmdPrintEnv+0x42>
/home/yogi/src/os/aproj/kshell/src/commands.c:21
        {
            print("%s\n",environmentLoc[cnt]);
 310003b:	a1 2c 24 10 03       	mov    eax,ds:0x310242c
 3100040:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100043:	c1 e2 02             	shl    edx,0x2
 3100046:	01 d0                	add    eax,edx
 3100048:	8b 00                	mov    eax,DWORD PTR [eax]
 310004a:	83 ec 08             	sub    esp,0x8
 310004d:	50                   	push   eax
 310004e:	68 0a 16 10 03       	push   0x310160a
 3100053:	e8 b8 12 00 00       	call   3101310 <kShell+0x414>
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
 3100083:	e8 e8 07 00 00       	call   3100870 <parseParamsShell>
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
 31000a4:	68 0e 16 10 03       	push   0x310160e
 31000a9:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000af:	50                   	push   eax
 31000b0:	e8 1b 13 00 00       	call   31013d0 <kShell+0x4d4>
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
 31000c4:	68 10 16 10 03       	push   0x3101610
 31000c9:	e8 42 12 00 00       	call   3101310 <kShell+0x414>
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
 31000f0:	e8 ab 13 00 00       	call   31014a0 <kShell+0x5a4>
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
 3100111:	e8 4a 12 00 00       	call   3101360 <kShell+0x464>
 3100116:	83 c4 10             	add    esp,0x10
 3100119:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:44
        varValue = malloc(valueLen);
 310011c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310011f:	83 ec 0c             	sub    esp,0xc
 3100122:	50                   	push   eax
 3100123:	e8 38 12 00 00       	call   3101360 <kShell+0x464>
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
 310013f:	e8 bc 12 00 00       	call   3101400 <kShell+0x504>
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
 310016b:	e8 90 12 00 00       	call   3101400 <kShell+0x504>
 3100170:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:48
        strtrim(varName);
 3100173:	83 ec 0c             	sub    esp,0xc
 3100176:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100179:	e8 d2 12 00 00       	call   3101450 <kShell+0x554>
 310017e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:49
        strtrim(varValue);
 3100181:	83 ec 0c             	sub    esp,0xc
 3100184:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100187:	e8 c4 12 00 00       	call   3101450 <kShell+0x554>
 310018c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:50
        setenv(varName, varValue);
 310018f:	83 ec 08             	sub    esp,0x8
 3100192:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100195:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100198:	e8 73 12 00 00       	call   3101410 <kShell+0x514>
 310019d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:51
        free(varName);
 31001a0:	83 ec 0c             	sub    esp,0xc
 31001a3:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 31001a6:	e8 15 13 00 00       	call   31014c0 <kShell+0x5c4>
 31001ab:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:52
        free(varValue);
 31001ae:	83 ec 0c             	sub    esp,0xc
 31001b1:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 31001b4:	e8 07 13 00 00       	call   31014c0 <kShell+0x5c4>
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
 31001dd:	e8 ce 12 00 00       	call   31014b0 <kShell+0x5b4>
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
 3100200:	e8 fb 10 00 00       	call   3101300 <kShell+0x404>
 3100205:	83 c4 10             	add    esp,0x10
 3100208:	a3 64 27 10 03       	mov    ds:0x3102764,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:69
            char ret[10];
            itoa(lastExecExitCode,ret);
 310020d:	a1 64 27 10 03       	mov    eax,ds:0x3102764
 3100212:	89 c2                	mov    edx,eax
 3100214:	83 ec 08             	sub    esp,0x8
 3100217:	8d 45 ea             	lea    eax,[ebp-0x16]
 310021a:	50                   	push   eax
 310021b:	52                   	push   edx
 310021c:	e8 7f 11 00 00       	call   31013a0 <kShell+0x4a4>
 3100221:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:70
            setenv("LASTEXIT",ret);
 3100224:	83 ec 08             	sub    esp,0x8
 3100227:	8d 45 ea             	lea    eax,[ebp-0x16]
 310022a:	50                   	push   eax
 310022b:	68 2b 16 10 03       	push   0x310162b
 3100230:	e8 db 11 00 00       	call   3101410 <kShell+0x514>
 3100235:	83 c4 10             	add    esp,0x10
 3100238:	eb 13                	jmp    310024d <kexec2+0x88>
/home/yogi/src/os/aproj/kshell/src/commands.c:74
        }
    }
    else
        print("Error executing %s\n",path);
 310023a:	83 ec 08             	sub    esp,0x8
 310023d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100240:	68 34 16 10 03       	push   0x3101634
 3100245:	e8 c6 10 00 00       	call   3101310 <kShell+0x414>
 310024a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:76

}
 310024d:	90                   	nop
 310024e:	c9                   	leave  
 310024f:	c3                   	ret    

03100250 <kexec>:
kexec():
/home/yogi/src/os/aproj/kshell/src/commands.c:79

int kexec(char* cmdline)
{
 3100250:	55                   	push   ebp
 3100251:	89 e5                	mov    ebp,esp
 3100253:	81 ec 48 05 00 00    	sub    esp,0x548
/home/yogi/src/os/aproj/kshell/src/commands.c:80
    bool background=false;
 3100259:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:81
    int forkPid=0;
 310025d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:83
    char* tok;
    char* pgm=NULL;
 3100264:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:86

    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 310026b:	83 ec 04             	sub    esp,0x4
 310026e:	68 00 05 00 00       	push   0x500
 3100273:	8d 85 d4 fa ff ff    	lea    eax,[ebp-0x52c]
 3100279:	50                   	push   eax
 310027a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310027d:	e8 ee 05 00 00       	call   3100870 <parseParamsShell>
 3100282:	83 c4 10             	add    esp,0x10
 3100285:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:87
    int execParamCount=0;
 3100288:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:88
    int pcount=1;
 310028f:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:90
    
    if (paramCount==0)
 3100296:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310029a:	75 0a                	jne    31002a6 <kexec+0x56>
/home/yogi/src/os/aproj/kshell/src/commands.c:91
        return -3;
 310029c:	b8 fd ff ff ff       	mov    eax,0xfffffffd
 31002a1:	e9 73 01 00 00       	jmp    3100419 <kexec+0x1c9>
/home/yogi/src/os/aproj/kshell/src/commands.c:93

    int argc = 0;
 31002a6:	c7 85 d0 fa ff ff 00 	mov    DWORD PTR [ebp-0x530],0x0
 31002ad:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:96
    char **argv;
    
    argv = cmdlineToArgv(cmdline, &argc);
 31002b0:	83 ec 08             	sub    esp,0x8
 31002b3:	8d 85 d0 fa ff ff    	lea    eax,[ebp-0x530]
 31002b9:	50                   	push   eax
 31002ba:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31002bd:	e8 be 10 00 00       	call   3101380 <kShell+0x484>
 31002c2:	83 c4 10             	add    esp,0x10
 31002c5:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:98

    if (argc<1)
 31002c8:	8b 85 d0 fa ff ff    	mov    eax,DWORD PTR [ebp-0x530]
 31002ce:	85 c0                	test   eax,eax
 31002d0:	7f 1a                	jg     31002ec <kexec+0x9c>
/home/yogi/src/os/aproj/kshell/src/commands.c:100
    {
        printf("kexec: Invalid command\n");
 31002d2:	83 ec 0c             	sub    esp,0xc
 31002d5:	68 48 16 10 03       	push   0x3101648
 31002da:	e8 41 10 00 00       	call   3101320 <kShell+0x424>
 31002df:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:101
        return -5;
 31002e2:	b8 fb ff ff ff       	mov    eax,0xfffffffb
 31002e7:	e9 2d 01 00 00       	jmp    3100419 <kexec+0x1c9>
/home/yogi/src/os/aproj/kshell/src/commands.c:104
    }
    
    if (*argv[argc-1]=='&')
 31002ec:	8b 85 d0 fa ff ff    	mov    eax,DWORD PTR [ebp-0x530]
 31002f2:	05 ff ff ff 3f       	add    eax,0x3fffffff
 31002f7:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31002fe:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100301:	01 d0                	add    eax,edx
 3100303:	8b 00                	mov    eax,DWORD PTR [eax]
 3100305:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100308:	3c 26                	cmp    al,0x26
 310030a:	75 04                	jne    3100310 <kexec+0xc0>
/home/yogi/src/os/aproj/kshell/src/commands.c:105
        background=true;
 310030c:	c6 45 f7 01          	mov    BYTE PTR [ebp-0x9],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:107
    
    forkPid = fork();
 3100310:	e8 1b 11 00 00       	call   3101430 <kShell+0x534>
 3100315:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:109
    
    if (forkPid == 0)
 3100318:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 310031c:	75 52                	jne    3100370 <kexec+0x120>
/home/yogi/src/os/aproj/kshell/src/commands.c:112
    {
        int retVal;
        int childPid = exec(argv[0], argc, argv);
 310031e:	8b 95 d0 fa ff ff    	mov    edx,DWORD PTR [ebp-0x530]
 3100324:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100327:	8b 00                	mov    eax,DWORD PTR [eax]
 3100329:	83 ec 04             	sub    esp,0x4
 310032c:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 310032f:	52                   	push   edx
 3100330:	50                   	push   eax
 3100331:	e8 8a 10 00 00       	call   31013c0 <kShell+0x4c4>
 3100336:	83 c4 10             	add    esp,0x10
 3100339:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:114
        
        if (childPid > 0)
 310033c:	83 7d d4 00          	cmp    DWORD PTR [ebp-0x2c],0x0
 3100340:	7e 14                	jle    3100356 <kexec+0x106>
/home/yogi/src/os/aproj/kshell/src/commands.c:116
        {
            retVal = waitpid(childPid);
 3100342:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 3100345:	83 ec 0c             	sub    esp,0xc
 3100348:	50                   	push   eax
 3100349:	e8 b2 0f 00 00       	call   3101300 <kShell+0x404>
 310034e:	83 c4 10             	add    esp,0x10
 3100351:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
 3100354:	eb 07                	jmp    310035d <kexec+0x10d>
/home/yogi/src/os/aproj/kshell/src/commands.c:119
        }
        else
            retVal = 0xBADBADBA;
 3100356:	c7 45 f0 ba ad db ba 	mov    DWORD PTR [ebp-0x10],0xbadbadba
/home/yogi/src/os/aproj/kshell/src/commands.c:120
        exit(retVal);
 310035d:	83 ec 0c             	sub    esp,0xc
 3100360:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100363:	e8 18 11 00 00       	call   3101480 <kShell+0x584>
 3100368:	83 c4 10             	add    esp,0x10
 310036b:	e9 8d 00 00 00       	jmp    31003fd <kexec+0x1ad>
/home/yogi/src/os/aproj/kshell/src/commands.c:122
    }
    else if (forkPid < 0)
 3100370:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100374:	79 15                	jns    310038b <kexec+0x13b>
/home/yogi/src/os/aproj/kshell/src/commands.c:123
        print("Fork error %u", forkPid);
 3100376:	83 ec 08             	sub    esp,0x8
 3100379:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310037c:	68 60 16 10 03       	push   0x3101660
 3100381:	e8 8a 0f 00 00       	call   3101310 <kShell+0x414>
 3100386:	83 c4 10             	add    esp,0x10
 3100389:	eb 72                	jmp    31003fd <kexec+0x1ad>
/home/yogi/src/os/aproj/kshell/src/commands.c:126
    else
    {
        if (!background)
 310038b:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 310038f:	83 f0 01             	xor    eax,0x1
 3100392:	84 c0                	test   al,al
 3100394:	74 36                	je     31003cc <kexec+0x17c>
/home/yogi/src/os/aproj/kshell/src/commands.c:128
        {
            lastExecExitCode = waitpid(forkPid);
 3100396:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100399:	83 ec 0c             	sub    esp,0xc
 310039c:	50                   	push   eax
 310039d:	e8 5e 0f 00 00       	call   3101300 <kShell+0x404>
 31003a2:	83 c4 10             	add    esp,0x10
 31003a5:	a3 64 27 10 03       	mov    ds:0x3102764,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:129
            if (lastExecExitCode == 0xBADBADBA)
 31003aa:	a1 64 27 10 03       	mov    eax,ds:0x3102764
 31003af:	3d ba ad db ba       	cmp    eax,0xbadbadba
 31003b4:	75 16                	jne    31003cc <kexec+0x17c>
/home/yogi/src/os/aproj/kshell/src/commands.c:130
                print("exec: Cannot execute %s\n",argv[0]);
 31003b6:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31003b9:	8b 00                	mov    eax,DWORD PTR [eax]
 31003bb:	83 ec 08             	sub    esp,0x8
 31003be:	50                   	push   eax
 31003bf:	68 6e 16 10 03       	push   0x310166e
 31003c4:	e8 47 0f 00 00       	call   3101310 <kShell+0x414>
 31003c9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:133
        }
        char ret[10];
        itoa(lastExecExitCode,ret);
 31003cc:	a1 64 27 10 03       	mov    eax,ds:0x3102764
 31003d1:	89 c2                	mov    edx,eax
 31003d3:	83 ec 08             	sub    esp,0x8
 31003d6:	8d 85 c6 fa ff ff    	lea    eax,[ebp-0x53a]
 31003dc:	50                   	push   eax
 31003dd:	52                   	push   edx
 31003de:	e8 bd 0f 00 00       	call   31013a0 <kShell+0x4a4>
 31003e3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:134
        setenv("LASTEXIT",ret);    
 31003e6:	83 ec 08             	sub    esp,0x8
 31003e9:	8d 85 c6 fa ff ff    	lea    eax,[ebp-0x53a]
 31003ef:	50                   	push   eax
 31003f0:	68 2b 16 10 03       	push   0x310162b
 31003f5:	e8 16 10 00 00       	call   3101410 <kShell+0x514>
 31003fa:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:137 (discriminator 1)
    }
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    free(argv);
 31003fd:	83 ec 0c             	sub    esp,0xc
 3100400:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 3100403:	e8 b8 10 00 00       	call   31014c0 <kShell+0x5c4>
 3100408:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:138 (discriminator 1)
    free(pgm);
 310040b:	83 ec 0c             	sub    esp,0xc
 310040e:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100411:	e8 aa 10 00 00       	call   31014c0 <kShell+0x5c4>
 3100416:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:140
    
}
 3100419:	c9                   	leave  
 310041a:	c3                   	ret    

0310041b <cmdTime>:
cmdTime():
/home/yogi/src/os/aproj/kshell/src/commands.c:143

void cmdTime(char* cmdline)
{
 310041b:	55                   	push   ebp
 310041c:	89 e5                	mov    ebp,esp
 310041e:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:146
    uint32_t startTicks, endTicks;
    
    startTicks=getticks();
 3100421:	e8 8a 0f 00 00       	call   31013b0 <kShell+0x4b4>
 3100426:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:147
    execInternalCommand(cmdline);
 3100429:	83 ec 0c             	sub    esp,0xc
 310042c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310042f:	e8 88 03 00 00       	call   31007bc <execInternalCommand>
 3100434:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:148
    endTicks=getticks();
 3100437:	e8 74 0f 00 00       	call   31013b0 <kShell+0x4b4>
 310043c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:149
    print("\n%u ticks\n",endTicks-startTicks);
 310043f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100442:	2b 45 f4             	sub    eax,DWORD PTR [ebp-0xc]
 3100445:	83 ec 08             	sub    esp,0x8
 3100448:	50                   	push   eax
 3100449:	68 87 16 10 03       	push   0x3101687
 310044e:	e8 bd 0e 00 00       	call   3101310 <kShell+0x414>
 3100453:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:151
    
}
 3100456:	90                   	nop
 3100457:	c9                   	leave  
 3100458:	c3                   	ret    

03100459 <cmdRepeat>:
cmdRepeat():
/home/yogi/src/os/aproj/kshell/src/commands.c:154

void cmdRepeat(char * cmdline)
{
 3100459:	55                   	push   ebp
 310045a:	89 e5                	mov    ebp,esp
 310045c:	83 ec 28             	sub    esp,0x28
/home/yogi/src/os/aproj/kshell/src/commands.c:155
    int argc = 0;
 310045f:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:157
    char **argv;
    int count = 0;
 3100466:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:158
    char *newCmdLine=cmdline;
 310046d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100470:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:159
    argv = cmdlineToArgv(cmdline, &argc);
 3100473:	83 ec 08             	sub    esp,0x8
 3100476:	8d 45 e4             	lea    eax,[ebp-0x1c]
 3100479:	50                   	push   eax
 310047a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310047d:	e8 fe 0e 00 00       	call   3101380 <kShell+0x484>
 3100482:	83 c4 10             	add    esp,0x10
 3100485:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:161
    
    count = atoi(argv[0]);
 3100488:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 310048b:	8b 00                	mov    eax,DWORD PTR [eax]
 310048d:	83 ec 0c             	sub    esp,0xc
 3100490:	50                   	push   eax
 3100491:	e8 fa 0f 00 00       	call   3101490 <kShell+0x594>
 3100496:	83 c4 10             	add    esp,0x10
 3100499:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:163

    if (count >= 100)
 310049c:	83 7d ec 63          	cmp    DWORD PTR [ebp-0x14],0x63
 31004a0:	7e 06                	jle    31004a8 <cmdRepeat+0x4f>
/home/yogi/src/os/aproj/kshell/src/commands.c:164
        newCmdLine+=3;
 31004a2:	83 45 f4 03          	add    DWORD PTR [ebp-0xc],0x3
 31004a6:	eb 10                	jmp    31004b8 <cmdRepeat+0x5f>
/home/yogi/src/os/aproj/kshell/src/commands.c:165
    else if (count >= 10)
 31004a8:	83 7d ec 09          	cmp    DWORD PTR [ebp-0x14],0x9
 31004ac:	7e 06                	jle    31004b4 <cmdRepeat+0x5b>
/home/yogi/src/os/aproj/kshell/src/commands.c:166
        newCmdLine+=2;
 31004ae:	83 45 f4 02          	add    DWORD PTR [ebp-0xc],0x2
 31004b2:	eb 04                	jmp    31004b8 <cmdRepeat+0x5f>
/home/yogi/src/os/aproj/kshell/src/commands.c:168
    else 
        newCmdLine+=1;
 31004b4:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:170
    
    for (int cnt=0;cnt<count;cnt++)
 31004b8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 31004bf:	eb 51                	jmp    3100512 <cmdRepeat+0xb9>
/home/yogi/src/os/aproj/kshell/src/commands.c:172
    {
        printf("\n*************** REPEAT EXECUTION #%u of %u ***************\n",cnt+1,count);
 31004c1:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31004c4:	83 c0 01             	add    eax,0x1
 31004c7:	83 ec 04             	sub    esp,0x4
 31004ca:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 31004cd:	50                   	push   eax
 31004ce:	68 94 16 10 03       	push   0x3101694
 31004d3:	e8 48 0e 00 00       	call   3101320 <kShell+0x424>
 31004d8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:173
        execInternalCommand(newCmdLine);
 31004db:	83 ec 0c             	sub    esp,0xc
 31004de:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 31004e1:	e8 d6 02 00 00       	call   31007bc <execInternalCommand>
 31004e6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:174
        if (bSigIntReceived)
 31004e9:	0f b6 05 20 24 10 03 	movzx  eax,BYTE PTR ds:0x3102420
 31004f0:	84 c0                	test   al,al
 31004f2:	74 1a                	je     310050e <cmdRepeat+0xb5>
/home/yogi/src/os/aproj/kshell/src/commands.c:176
        {
            if (processSignal(SIGINT)==SIGINT)
 31004f4:	83 ec 0c             	sub    esp,0xc
 31004f7:	6a 08                	push   0x8
 31004f9:	e8 de 09 00 00       	call   3100edc <processSignal>
 31004fe:	83 c4 10             	add    esp,0x10
 3100501:	83 f8 08             	cmp    eax,0x8
 3100504:	75 16                	jne    310051c <cmdRepeat+0xc3>
/home/yogi/src/os/aproj/kshell/src/commands.c:177
                cnt=count;
 3100506:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100509:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:178
            break;
 310050c:	eb 0e                	jmp    310051c <cmdRepeat+0xc3>
/home/yogi/src/os/aproj/kshell/src/commands.c:170 (discriminator 2)
    else if (count >= 10)
        newCmdLine+=2;
    else 
        newCmdLine+=1;
    
    for (int cnt=0;cnt<count;cnt++)
 310050e:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:170 (discriminator 1)
 3100512:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100515:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 3100518:	7c a7                	jl     31004c1 <cmdRepeat+0x68>
/home/yogi/src/os/aproj/kshell/src/commands.c:182
                cnt=count;
            break;
        }
    }
    
}
 310051a:	eb 01                	jmp    310051d <cmdRepeat+0xc4>
/home/yogi/src/os/aproj/kshell/src/commands.c:178
        execInternalCommand(newCmdLine);
        if (bSigIntReceived)
        {
            if (processSignal(SIGINT)==SIGINT)
                cnt=count;
            break;
 310051c:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/commands.c:182 (discriminator 1)
        }
    }
    
}
 310051d:	90                   	nop
 310051e:	c9                   	leave  
 310051f:	c3                   	ret    

03100520 <cmdExecp>:
cmdExecp():
/home/yogi/src/os/aproj/kshell/src/commands.c:185

void cmdExecp(char* cmdline)
{
 3100520:	55                   	push   ebp
 3100521:	89 e5                	mov    ebp,esp
 3100523:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:186
    kexec(cmdline);
 3100526:	83 ec 0c             	sub    esp,0xc
 3100529:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310052c:	e8 1f fd ff ff       	call   3100250 <kexec>
 3100531:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:187
}
 3100534:	90                   	nop
 3100535:	c9                   	leave  
 3100536:	c3                   	ret    

03100537 <cmdExit>:
cmdExit():
/home/yogi/src/os/aproj/kshell/src/commands.c:190

void cmdExit(char *cmdline)
{
 3100537:	55                   	push   ebp
 3100538:	89 e5                	mov    ebp,esp
 310053a:	81 ec 08 05 00 00    	sub    esp,0x508
/home/yogi/src/os/aproj/kshell/src/commands.c:193
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 3100540:	83 ec 04             	sub    esp,0x4
 3100543:	68 00 05 00 00       	push   0x500
 3100548:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 310054e:	50                   	push   eax
 310054f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100552:	e8 19 03 00 00       	call   3100870 <parseParamsShell>
 3100557:	83 c4 10             	add    esp,0x10
 310055a:	85 c0                	test   eax,eax
 310055c:	74 1d                	je     310057b <cmdExit+0x44>
/home/yogi/src/os/aproj/kshell/src/commands.c:195
    {
        exitCode = strtoul(params[0],0,10);
 310055e:	83 ec 04             	sub    esp,0x4
 3100561:	6a 0a                	push   0xa
 3100563:	6a 00                	push   0x0
 3100565:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 310056b:	50                   	push   eax
 310056c:	e8 1f 0e 00 00       	call   3101390 <kShell+0x494>
 3100571:	83 c4 10             	add    esp,0x10
 3100574:	a3 68 27 10 03       	mov    ds:0x3102768,eax
 3100579:	eb 0a                	jmp    3100585 <cmdExit+0x4e>
/home/yogi/src/os/aproj/kshell/src/commands.c:198
    }
    else
        exitCode = 0;
 310057b:	c7 05 68 27 10 03 00 	mov    DWORD PTR ds:0x3102768,0x0
 3100582:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:199
    timeToExit=true;
 3100585:	c6 05 74 27 10 03 01 	mov    BYTE PTR ds:0x3102774,0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:200
}
 310058c:	90                   	nop
 310058d:	c9                   	leave  
 310058e:	c3                   	ret    

0310058f <cmdHelp>:
cmdHelp():
/home/yogi/src/os/aproj/kshell/src/commands.c:203

void cmdHelp(char *cmdline)
{
 310058f:	55                   	push   ebp
 3100590:	89 e5                	mov    ebp,esp
 3100592:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:206
    char* tok;
    
    tok=strtok(cmdline,delim);
 3100595:	83 ec 08             	sub    esp,0x8
 3100598:	68 24 24 10 03       	push   0x3102424
 310059d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31005a0:	e8 7b 0e 00 00       	call   3101420 <kShell+0x524>
 31005a5:	83 c4 10             	add    esp,0x10
 31005a8:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:213
    {
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
 31005ab:	83 ec 08             	sub    esp,0x8
 31005ae:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005b1:	68 d1 16 10 03       	push   0x31016d1
 31005b6:	e8 55 0d 00 00       	call   3101310 <kShell+0x414>
 31005bb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:214
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 31005be:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31005c5:	e9 86 00 00 00       	jmp    3100650 <cmdHelp+0xc1>
/home/yogi/src/os/aproj/kshell/src/commands.c:215
        if (tok!=NULL)
 31005ca:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31005ce:	74 50                	je     3100620 <cmdHelp+0x91>
/home/yogi/src/os/aproj/kshell/src/commands.c:217
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
 31005d0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005d3:	c1 e0 04             	shl    eax,0x4
 31005d6:	05 c0 21 10 03       	add    eax,0x31021c0
 31005db:	8b 00                	mov    eax,DWORD PTR [eax]
 31005dd:	83 ec 04             	sub    esp,0x4
 31005e0:	6a 64                	push   0x64
 31005e2:	50                   	push   eax
 31005e3:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005e6:	e8 05 0e 00 00       	call   31013f0 <kShell+0x4f4>
 31005eb:	83 c4 10             	add    esp,0x10
 31005ee:	85 c0                	test   eax,eax
 31005f0:	75 5a                	jne    310064c <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:218
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 31005f2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005f5:	c1 e0 04             	shl    eax,0x4
 31005f8:	05 c4 21 10 03       	add    eax,0x31021c4
 31005fd:	8b 10                	mov    edx,DWORD PTR [eax]
 31005ff:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100602:	c1 e0 04             	shl    eax,0x4
 3100605:	05 c0 21 10 03       	add    eax,0x31021c0
 310060a:	8b 00                	mov    eax,DWORD PTR [eax]
 310060c:	83 ec 04             	sub    esp,0x4
 310060f:	52                   	push   edx
 3100610:	50                   	push   eax
 3100611:	68 db 16 10 03       	push   0x31016db
 3100616:	e8 f5 0c 00 00       	call   3101310 <kShell+0x414>
 310061b:	83 c4 10             	add    esp,0x10
 310061e:	eb 2c                	jmp    310064c <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:222
        }
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100620:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100623:	c1 e0 04             	shl    eax,0x4
 3100626:	05 c4 21 10 03       	add    eax,0x31021c4
 310062b:	8b 10                	mov    edx,DWORD PTR [eax]
 310062d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100630:	c1 e0 04             	shl    eax,0x4
 3100633:	05 c0 21 10 03       	add    eax,0x31021c0
 3100638:	8b 00                	mov    eax,DWORD PTR [eax]
 310063a:	83 ec 04             	sub    esp,0x4
 310063d:	52                   	push   edx
 310063e:	50                   	push   eax
 310063f:	68 db 16 10 03       	push   0x31016db
 3100644:	e8 c7 0c 00 00       	call   3101310 <kShell+0x414>
 3100649:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:214 (discriminator 2)
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 310064c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:214 (discriminator 1)
 3100650:	83 7d f4 09          	cmp    DWORD PTR [ebp-0xc],0x9
 3100654:	0f 86 70 ff ff ff    	jbe    31005ca <cmdHelp+0x3b>
/home/yogi/src/os/aproj/kshell/src/commands.c:225
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
    
}
 310065a:	90                   	nop
 310065b:	c9                   	leave  
 310065c:	c3                   	ret    

0310065d <cmdPwd>:
cmdPwd():
/home/yogi/src/os/aproj/kshell/src/commands.c:228

void cmdPwd()
{
 310065d:	55                   	push   ebp
 310065e:	89 e5                	mov    ebp,esp
 3100660:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:229
    char* buf=malloc(512);
 3100663:	83 ec 0c             	sub    esp,0xc
 3100666:	68 00 02 00 00       	push   0x200
 310066b:	e8 f0 0c 00 00       	call   3101360 <kShell+0x464>
 3100670:	83 c4 10             	add    esp,0x10
 3100673:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:230
    print("%s\n",getcwd(buf,512));
 3100676:	83 ec 08             	sub    esp,0x8
 3100679:	68 00 02 00 00       	push   0x200
 310067e:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100681:	e8 da 0d 00 00       	call   3101460 <kShell+0x564>
 3100686:	83 c4 10             	add    esp,0x10
 3100689:	83 ec 08             	sub    esp,0x8
 310068c:	50                   	push   eax
 310068d:	68 0a 16 10 03       	push   0x310160a
 3100692:	e8 79 0c 00 00       	call   3101310 <kShell+0x414>
 3100697:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:231
    free(buf);
 310069a:	83 ec 0c             	sub    esp,0xc
 310069d:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 31006a0:	e8 1b 0e 00 00       	call   31014c0 <kShell+0x5c4>
 31006a5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:232
}
 31006a8:	90                   	nop
 31006a9:	c9                   	leave  
 31006aa:	c3                   	ret    

031006ab <cmdSleep>:
cmdSleep():
/home/yogi/src/os/aproj/kshell/src/commands.c:235

void cmdSleep(char *cmdline)
{
 31006ab:	55                   	push   ebp
 31006ac:	89 e5                	mov    ebp,esp
 31006ae:	53                   	push   ebx
 31006af:	81 ec 24 05 00 00    	sub    esp,0x524
 31006b5:	89 e0                	mov    eax,esp
 31006b7:	89 c3                	mov    ebx,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:237
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 31006b9:	83 ec 04             	sub    esp,0x4
 31006bc:	68 00 05 00 00       	push   0x500
 31006c1:	8d 85 e0 fa ff ff    	lea    eax,[ebp-0x520]
 31006c7:	50                   	push   eax
 31006c8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31006cb:	e8 a0 01 00 00       	call   3100870 <parseParamsShell>
 31006d0:	83 c4 10             	add    esp,0x10
 31006d3:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:240

    //TODO: Remove this later ... leaving it here for a while to test mmap'd stack
    int size = 100000/4; //147400;
 31006d6:	c7 45 e8 a8 61 00 00 	mov    DWORD PTR [ebp-0x18],0x61a8
/home/yogi/src/os/aproj/kshell/src/commands.c:241
    int test[size];
 31006dd:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 31006e0:	8d 50 ff             	lea    edx,[eax-0x1]
 31006e3:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
 31006e6:	c1 e0 02             	shl    eax,0x2
 31006e9:	8d 50 03             	lea    edx,[eax+0x3]
 31006ec:	b8 10 00 00 00       	mov    eax,0x10
 31006f1:	83 e8 01             	sub    eax,0x1
 31006f4:	01 d0                	add    eax,edx
 31006f6:	b9 10 00 00 00       	mov    ecx,0x10
 31006fb:	ba 00 00 00 00       	mov    edx,0x0
 3100700:	f7 f1                	div    ecx
 3100702:	6b c0 10             	imul   eax,eax,0x10
 3100705:	29 c4                	sub    esp,eax
 3100707:	89 e0                	mov    eax,esp
 3100709:	83 c0 03             	add    eax,0x3
 310070c:	c1 e8 02             	shr    eax,0x2
 310070f:	c1 e0 02             	shl    eax,0x2
 3100712:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:243
    
    for (int cnt=0;cnt<size;cnt++)
 3100715:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310071c:	eb 10                	jmp    310072e <cmdSleep+0x83>
/home/yogi/src/os/aproj/kshell/src/commands.c:244 (discriminator 3)
        test[cnt]=cnt;
 310071e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100721:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100724:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 3100727:	89 0c 90             	mov    DWORD PTR [eax+edx*4],ecx
/home/yogi/src/os/aproj/kshell/src/commands.c:243 (discriminator 3)

    //TODO: Remove this later ... leaving it here for a while to test mmap'd stack
    int size = 100000/4; //147400;
    int test[size];
    
    for (int cnt=0;cnt<size;cnt++)
 310072a:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:243 (discriminator 1)
 310072e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100731:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 3100734:	7c e8                	jl     310071e <cmdSleep+0x73>
/home/yogi/src/os/aproj/kshell/src/commands.c:246
        test[cnt]=cnt;
    
    for (int cnt=0;cnt<size;cnt++)
 3100736:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 310073d:	eb 22                	jmp    3100761 <cmdSleep+0xb6>
/home/yogi/src/os/aproj/kshell/src/commands.c:247
        if (test[cnt]!=cnt)
 310073f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100742:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 3100745:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
 3100748:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 310074b:	74 10                	je     310075d <cmdSleep+0xb2>
/home/yogi/src/os/aproj/kshell/src/commands.c:248
            printf("uh oh!");
 310074d:	83 ec 0c             	sub    esp,0xc
 3100750:	68 e4 16 10 03       	push   0x31016e4
 3100755:	e8 c6 0b 00 00       	call   3101320 <kShell+0x424>
 310075a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:246 (discriminator 2)
    int test[size];
    
    for (int cnt=0;cnt<size;cnt++)
        test[cnt]=cnt;
    
    for (int cnt=0;cnt<size;cnt++)
 310075d:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:246 (discriminator 1)
 3100761:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100764:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 3100767:	7c d6                	jl     310073f <cmdSleep+0x94>
/home/yogi/src/os/aproj/kshell/src/commands.c:250
        if (test[cnt]!=cnt)
            printf("uh oh!");
    
    if (params[0][0]==0)
 3100769:	0f b6 85 e0 fa ff ff 	movzx  eax,BYTE PTR [ebp-0x520]
 3100770:	84 c0                	test   al,al
 3100772:	75 17                	jne    310078b <cmdSleep+0xe0>
/home/yogi/src/os/aproj/kshell/src/commands.c:252
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 3100774:	83 ec 0c             	sub    esp,0xc
 3100777:	68 ec 16 10 03       	push   0x31016ec
 310077c:	e8 8f 0b 00 00       	call   3101310 <kShell+0x414>
 3100781:	83 c4 10             	add    esp,0x10
 3100784:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:253
        return;
 3100789:	eb 27                	jmp    31007b2 <cmdSleep+0x107>
/home/yogi/src/os/aproj/kshell/src/commands.c:256
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 310078b:	83 ec 04             	sub    esp,0x4
 310078e:	6a 0a                	push   0xa
 3100790:	6a 00                	push   0x0
 3100792:	8d 85 e0 fa ff ff    	lea    eax,[ebp-0x520]
 3100798:	50                   	push   eax
 3100799:	e8 f2 0b 00 00       	call   3101390 <kShell+0x494>
 310079e:	83 c4 10             	add    esp,0x10
 31007a1:	83 ec 0c             	sub    esp,0xc
 31007a4:	50                   	push   eax
 31007a5:	e8 c6 0b 00 00       	call   3101370 <kShell+0x474>
 31007aa:	83 c4 10             	add    esp,0x10
 31007ad:	b8 01 00 00 00       	mov    eax,0x1
 31007b2:	89 dc                	mov    esp,ebx
 31007b4:	83 f8 01             	cmp    eax,0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:257
}
 31007b7:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31007ba:	c9                   	leave  
 31007bb:	c3                   	ret    

031007bc <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:25

int findCommand(char* command);
char **buildargv (const char *input);

void execInternalCommand(char lCommand[256])
{
 31007bc:	55                   	push   ebp
 31007bd:	89 e5                	mov    ebp,esp
 31007bf:	53                   	push   ebx
 31007c0:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:26
    strtrim(lCommand);
 31007c3:	83 ec 0c             	sub    esp,0xc
 31007c6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31007c9:	e8 82 0c 00 00       	call   3101450 <kShell+0x554>
 31007ce:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:27
    int i = findCommand(lCommand);
 31007d1:	83 ec 0c             	sub    esp,0xc
 31007d4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31007d7:	e8 3d 02 00 00       	call   3100a19 <findCommand>
 31007dc:	83 c4 10             	add    esp,0x10
 31007df:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:29

    if(i>0)
 31007e2:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31007e6:	7e 74                	jle    310085c <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:31
    {
        i--;
 31007e8:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:33
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 31007ec:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31007ef:	c1 e0 04             	shl    eax,0x4
 31007f2:	05 68 22 10 03       	add    eax,0x3102268
 31007f7:	8b 00                	mov    eax,DWORD PTR [eax]
 31007f9:	a3 54 27 10 03       	mov    ds:0x3102754,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:34
        command_function_p = cmds[i].function;
 31007fe:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100801:	c1 e0 04             	shl    eax,0x4
 3100804:	05 68 22 10 03       	add    eax,0x3102268
 3100809:	8b 00                	mov    eax,DWORD PTR [eax]
 310080b:	a3 40 27 10 03       	mov    ds:0x3102740,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:35
        if (cmds[i].paramCount==0)
 3100810:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100813:	c1 e0 04             	shl    eax,0x4
 3100816:	05 6c 22 10 03       	add    eax,0x310226c
 310081b:	8b 00                	mov    eax,DWORD PTR [eax]
 310081d:	85 c0                	test   eax,eax
 310081f:	75 09                	jne    310082a <execInternalCommand+0x6e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:36
            command_function();
 3100821:	a1 54 27 10 03       	mov    eax,ds:0x3102754
 3100826:	ff d0                	call   eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:47
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 3100828:	eb 40                	jmp    310086a <execInternalCommand+0xae>
/home/yogi/src/os/aproj/kshell/src/kshell.c:39
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
 310082a:	8b 1d 40 27 10 03    	mov    ebx,DWORD PTR ds:0x3102740
 3100830:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100833:	c1 e0 04             	shl    eax,0x4
 3100836:	05 60 22 10 03       	add    eax,0x3102260
 310083b:	8b 00                	mov    eax,DWORD PTR [eax]
 310083d:	83 ec 0c             	sub    esp,0xc
 3100840:	50                   	push   eax
 3100841:	e8 5a 0c 00 00       	call   31014a0 <kShell+0x5a4>
 3100846:	83 c4 10             	add    esp,0x10
 3100849:	8d 50 01             	lea    edx,[eax+0x1]
 310084c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310084f:	01 d0                	add    eax,edx
 3100851:	83 ec 0c             	sub    esp,0xc
 3100854:	50                   	push   eax
 3100855:	ff d3                	call   ebx
 3100857:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:47
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 310085a:	eb 0e                	jmp    310086a <execInternalCommand+0xae>
/home/yogi/src/os/aproj/kshell/src/kshell.c:45
        }
    }
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
 310085c:	83 ec 0c             	sub    esp,0xc
 310085f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100862:	e8 b9 fc ff ff       	call   3100520 <cmdExecp>
 3100867:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:47
    }
}
 310086a:	90                   	nop
 310086b:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 310086e:	c9                   	leave  
 310086f:	c3                   	ret    

03100870 <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:50

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 3100870:	55                   	push   ebp
 3100871:	89 e5                	mov    ebp,esp
 3100873:	53                   	push   ebx
 3100874:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/aproj/kshell/src/kshell.c:51
    int x=0,y=0;
 3100877:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310087e:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:52
    int lRetVal=0,parsedChars=0;
 3100885:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 310088c:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:53
    bool needDoubleQuotetoEndParam=0;
 3100893:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:55
    
    memset(params,0, size);
 3100897:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 310089a:	83 ec 04             	sub    esp,0x4
 310089d:	50                   	push   eax
 310089e:	6a 00                	push   0x0
 31008a0:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31008a3:	e8 98 0b 00 00       	call   3101440 <kShell+0x544>
 31008a8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:57
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31008ab:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 31008b2:	e9 24 01 00 00       	jmp    31009db <parseParamsShell+0x16b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:59
    {
        if(cmdLine[cnt]=='"')
 31008b7:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31008ba:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31008bd:	01 d0                	add    eax,edx
 31008bf:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31008c2:	3c 22                	cmp    al,0x22
 31008c4:	75 41                	jne    3100907 <parseParamsShell+0x97>
/home/yogi/src/os/aproj/kshell/src/kshell.c:61
        {
            if (!needDoubleQuotetoEndParam)
 31008c6:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 31008ca:	83 f0 01             	xor    eax,0x1
 31008cd:	84 c0                	test   al,al
 31008cf:	74 09                	je     31008da <parseParamsShell+0x6a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:63
            {
                needDoubleQuotetoEndParam=true;
 31008d1:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
 31008d5:	e9 f9 00 00 00       	jmp    31009d3 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:67
            }
            else
            {
                params[y][x]='\0';
 31008da:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31008dd:	c1 e0 07             	shl    eax,0x7
 31008e0:	89 c2                	mov    edx,eax
 31008e2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31008e5:	01 c2                	add    edx,eax
 31008e7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31008ea:	01 d0                	add    eax,edx
 31008ec:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:68
                {x=0;y++;lRetVal++;}
 31008ef:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31008f6:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 31008fa:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:69
                needDoubleQuotetoEndParam=false;
 31008fe:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
 3100902:	e9 cc 00 00 00       	jmp    31009d3 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:72
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
 3100907:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310090a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310090d:	01 d0                	add    eax,edx
 310090f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100912:	3c 20                	cmp    al,0x20
 3100914:	74 1e                	je     3100934 <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:72 (discriminator 2)
 3100916:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100919:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310091c:	01 d0                	add    eax,edx
 310091e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100921:	3c 2d                	cmp    al,0x2d
 3100923:	74 0f                	je     3100934 <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:72 (discriminator 4)
 3100925:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100928:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310092b:	01 d0                	add    eax,edx
 310092d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100930:	3c 2c                	cmp    al,0x2c
 3100932:	75 7a                	jne    31009ae <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:72 (discriminator 5)
 3100934:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100938:	83 f0 01             	xor    eax,0x1
 310093b:	84 c0                	test   al,al
 310093d:	74 6f                	je     31009ae <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:75
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 310093f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100942:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100945:	01 d0                	add    eax,edx
 3100947:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310094a:	3c 2d                	cmp    al,0x2d
 310094c:	74 0f                	je     310095d <parseParamsShell+0xed>
/home/yogi/src/os/aproj/kshell/src/kshell.c:75 (discriminator 1)
 310094e:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100951:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100954:	01 d0                	add    eax,edx
 3100956:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100959:	3c 2f                	cmp    al,0x2f
 310095b:	75 25                	jne    3100982 <parseParamsShell+0x112>
/home/yogi/src/os/aproj/kshell/src/kshell.c:76
                params[y][x++]=cmdLine[cnt];
 310095d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100960:	c1 e0 07             	shl    eax,0x7
 3100963:	89 c2                	mov    edx,eax
 3100965:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100968:	8d 0c 02             	lea    ecx,[edx+eax*1]
 310096b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310096e:	8d 50 01             	lea    edx,[eax+0x1]
 3100971:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100974:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 3100977:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 310097a:	01 da                	add    edx,ebx
 310097c:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310097f:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:77
            params[y][x]='\0';
 3100982:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100985:	c1 e0 07             	shl    eax,0x7
 3100988:	89 c2                	mov    edx,eax
 310098a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310098d:	01 c2                	add    edx,eax
 310098f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100992:	01 d0                	add    eax,edx
 3100994:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:78
            if (cnt>0)
 3100997:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 310099b:	74 36                	je     31009d3 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:79
                {x=0;y++;lRetVal++;}
 310099d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31009a4:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 31009a8:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:78
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 31009ac:	eb 25                	jmp    31009d3 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:84
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 31009ae:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31009b1:	c1 e0 07             	shl    eax,0x7
 31009b4:	89 c2                	mov    edx,eax
 31009b6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31009b9:	8d 0c 02             	lea    ecx,[edx+eax*1]
 31009bc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31009bf:	8d 50 01             	lea    edx,[eax+0x1]
 31009c2:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31009c5:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31009c8:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 31009cb:	01 da                	add    edx,ebx
 31009cd:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31009d0:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:86 (discriminator 2)
        }
        parsedChars++;
 31009d3:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:57 (discriminator 2)
    int lRetVal=0,parsedChars=0;
    bool needDoubleQuotetoEndParam=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31009d7:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:57 (discriminator 1)
 31009db:	83 ec 0c             	sub    esp,0xc
 31009de:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31009e1:	e8 ba 0a 00 00       	call   31014a0 <kShell+0x5a4>
 31009e6:	83 c4 10             	add    esp,0x10
 31009e9:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 31009ec:	0f 87 c5 fe ff ff    	ja     31008b7 <parseParamsShell+0x47>
/home/yogi/src/os/aproj/kshell/src/kshell.c:88
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 31009f2:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31009f6:	74 19                	je     3100a11 <parseParamsShell+0x1a1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:90
    {
        lRetVal++;
 31009f8:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:91
        params[y][x]='\0';
 31009fc:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31009ff:	c1 e0 07             	shl    eax,0x7
 3100a02:	89 c2                	mov    edx,eax
 3100a04:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100a07:	01 c2                	add    edx,eax
 3100a09:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a0c:	01 d0                	add    eax,edx
 3100a0e:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:96
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 3100a11:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/aproj/kshell/src/kshell.c:97
}
 3100a14:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100a17:	c9                   	leave  
 3100a18:	c3                   	ret    

03100a19 <findCommand>:
findCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:100

int findCommand(char* command)
{
 3100a19:	55                   	push   ebp
 3100a1a:	89 e5                	mov    ebp,esp
 3100a1c:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:104
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3100a1f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100a26:	eb 4d                	jmp    3100a75 <findCommand+0x5c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:106
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 3100a28:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a2b:	c1 e0 04             	shl    eax,0x4
 3100a2e:	05 60 22 10 03       	add    eax,0x3102260
 3100a33:	8b 00                	mov    eax,DWORD PTR [eax]
 3100a35:	83 ec 0c             	sub    esp,0xc
 3100a38:	50                   	push   eax
 3100a39:	e8 62 0a 00 00       	call   31014a0 <kShell+0x5a4>
 3100a3e:	83 c4 10             	add    esp,0x10
 3100a41:	89 c2                	mov    edx,eax
 3100a43:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a46:	c1 e0 04             	shl    eax,0x4
 3100a49:	05 60 22 10 03       	add    eax,0x3102260
 3100a4e:	8b 00                	mov    eax,DWORD PTR [eax]
 3100a50:	83 ec 04             	sub    esp,0x4
 3100a53:	52                   	push   edx
 3100a54:	50                   	push   eax
 3100a55:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100a58:	e8 93 09 00 00       	call   31013f0 <kShell+0x4f4>
 3100a5d:	83 c4 10             	add    esp,0x10
 3100a60:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:108
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 3100a63:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100a67:	75 08                	jne    3100a71 <findCommand+0x58>
/home/yogi/src/os/aproj/kshell/src/kshell.c:111
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 3100a69:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100a6c:	83 c0 01             	add    eax,0x1
 3100a6f:	eb 0f                	jmp    3100a80 <findCommand+0x67>
/home/yogi/src/os/aproj/kshell/src/kshell.c:104 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3100a71:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:104 (discriminator 1)
 3100a75:	83 7d f4 09          	cmp    DWORD PTR [ebp-0xc],0x9
 3100a79:	76 ad                	jbe    3100a28 <findCommand+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:115
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 3100a7b:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:116
}
 3100a80:	c9                   	leave  
 3100a81:	c3                   	ret    

03100a82 <buildargv>:
buildargv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:120

/*parts from http://*/
char **buildargv (const char *input)
{
 3100a82:	55                   	push   ebp
 3100a83:	89 e5                	mov    ebp,esp
 3100a85:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:123
  char *arg;
  char *copybuf;
  int squote = 0;
 3100a88:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:124
  int dquote = 0;
 3100a8f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:125
  int bsquote = 0;
 3100a96:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:126
  int argc = 0;
 3100a9d:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:127
  int maxargc = 0;
 3100aa4:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:128
  char **argv = NULL;
 3100aab:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:132
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 3100ab2:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 3100ab6:	0f 84 33 02 00 00    	je     3100cef <buildargv+0x26d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:135
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 3100abc:	83 ec 0c             	sub    esp,0xc
 3100abf:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100ac2:	e8 d9 09 00 00       	call   31014a0 <kShell+0x5a4>
 3100ac7:	83 c4 10             	add    esp,0x10
 3100aca:	83 c0 01             	add    eax,0x1
 3100acd:	83 ec 0c             	sub    esp,0xc
 3100ad0:	50                   	push   eax
 3100ad1:	e8 8a 08 00 00       	call   3101360 <kShell+0x464>
 3100ad6:	83 c4 10             	add    esp,0x10
 3100ad9:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:143
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 3100adc:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 3100ae0:	74 0b                	je     3100aed <buildargv+0x6b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:143 (discriminator 1)
 3100ae2:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100ae5:	83 e8 01             	sub    eax,0x1
 3100ae8:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3100aeb:	7f 3d                	jg     3100b2a <buildargv+0xa8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:146
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 3100aed:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 3100af1:	75 1c                	jne    3100b0f <buildargv+0x8d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:148
		{
		  maxargc = INITIAL_MAXARGC;
 3100af3:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:149
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 3100afa:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100afd:	c1 e0 02             	shl    eax,0x2
 3100b00:	83 ec 0c             	sub    esp,0xc
 3100b03:	50                   	push   eax
 3100b04:	e8 57 08 00 00       	call   3101360 <kShell+0x464>
 3100b09:	83 c4 10             	add    esp,0x10
 3100b0c:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:151
		}
	      argv = nargv;
 3100b0f:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 3100b12:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:152
	      argv[argc] = NULL;
 3100b15:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100b18:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100b1f:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100b22:	01 d0                	add    eax,edx
 3100b24:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:155
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 3100b2a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100b2d:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:156
	  while (*input != EOS)
 3100b30:	e9 ec 00 00 00       	jmp    3100c21 <buildargv+0x19f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:158
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100b35:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b38:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100b3b:	3c 20                	cmp    al,0x20
 3100b3d:	75 16                	jne    3100b55 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:158 (discriminator 1)
 3100b3f:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100b43:	75 10                	jne    3100b55 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:158 (discriminator 2)
 3100b45:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100b49:	75 0a                	jne    3100b55 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:158 (discriminator 3)
 3100b4b:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100b4f:	0f 84 da 00 00 00    	je     3100c2f <buildargv+0x1ad>
/home/yogi/src/os/aproj/kshell/src/kshell.c:164
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100b55:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100b59:	74 1d                	je     3100b78 <buildargv+0xf6>
/home/yogi/src/os/aproj/kshell/src/kshell.c:166
		    {
		      bsquote = 0;
 3100b5b:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:167
		      *arg++ = *input;
 3100b62:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100b65:	8d 50 01             	lea    edx,[eax+0x1]
 3100b68:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100b6b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100b6e:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100b71:	88 10                	mov    BYTE PTR [eax],dl
 3100b73:	e9 a5 00 00 00       	jmp    3100c1d <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:169
		    }
		  else if (*input == '\\')
 3100b78:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b7b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100b7e:	3c 5c                	cmp    al,0x5c
 3100b80:	75 0c                	jne    3100b8e <buildargv+0x10c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:171
		    {
		      bsquote = 1;
 3100b82:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 3100b89:	e9 8f 00 00 00       	jmp    3100c1d <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:173
		    }
		  else if (squote)
 3100b8e:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100b92:	74 26                	je     3100bba <buildargv+0x138>
/home/yogi/src/os/aproj/kshell/src/kshell.c:175
		    {
		      if (*input == '\'')
 3100b94:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b97:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100b9a:	3c 27                	cmp    al,0x27
 3100b9c:	75 09                	jne    3100ba7 <buildargv+0x125>
/home/yogi/src/os/aproj/kshell/src/kshell.c:177
			{
			  squote = 0;
 3100b9e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100ba5:	eb 76                	jmp    3100c1d <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:181
			}
		      else
			{
			  *arg++ = *input;
 3100ba7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100baa:	8d 50 01             	lea    edx,[eax+0x1]
 3100bad:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100bb0:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100bb3:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100bb6:	88 10                	mov    BYTE PTR [eax],dl
 3100bb8:	eb 63                	jmp    3100c1d <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:184
			}
		    }
		  else if (dquote)
 3100bba:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100bbe:	74 26                	je     3100be6 <buildargv+0x164>
/home/yogi/src/os/aproj/kshell/src/kshell.c:186
		    {
		      if (*input == '"')
 3100bc0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100bc3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100bc6:	3c 22                	cmp    al,0x22
 3100bc8:	75 09                	jne    3100bd3 <buildargv+0x151>
/home/yogi/src/os/aproj/kshell/src/kshell.c:188
			{
			  dquote = 0;
 3100bca:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 3100bd1:	eb 4a                	jmp    3100c1d <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:192
			}
		      else
			{
			  *arg++ = *input;
 3100bd3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100bd6:	8d 50 01             	lea    edx,[eax+0x1]
 3100bd9:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100bdc:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100bdf:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100be2:	88 10                	mov    BYTE PTR [eax],dl
 3100be4:	eb 37                	jmp    3100c1d <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:197
			}
		    }
		  else
		    {
		      if (*input == '\'')
 3100be6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100be9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100bec:	3c 27                	cmp    al,0x27
 3100bee:	75 09                	jne    3100bf9 <buildargv+0x177>
/home/yogi/src/os/aproj/kshell/src/kshell.c:199
			{
			  squote = 1;
 3100bf0:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 3100bf7:	eb 24                	jmp    3100c1d <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:201
			}
		      else if (*input == '"')
 3100bf9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100bfc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100bff:	3c 22                	cmp    al,0x22
 3100c01:	75 09                	jne    3100c0c <buildargv+0x18a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:203
			{
			  dquote = 1;
 3100c03:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 3100c0a:	eb 11                	jmp    3100c1d <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:207
			}
		      else
			{
			  *arg++ = *input;
 3100c0c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c0f:	8d 50 01             	lea    edx,[eax+0x1]
 3100c12:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100c15:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100c18:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100c1b:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:211
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 3100c1d:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:156
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 3100c21:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100c24:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100c27:	84 c0                	test   al,al
 3100c29:	0f 85 06 ff ff ff    	jne    3100b35 <buildargv+0xb3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:214
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 3100c2f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c32:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:216
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100c35:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100c38:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100c3b:	84 c0                	test   al,al
 3100c3d:	0f 84 9e 00 00 00    	je     3100ce1 <buildargv+0x25f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:218
          {
            char* temp=malloc(strlen(copybuf)+1);
 3100c43:	83 ec 0c             	sub    esp,0xc
 3100c46:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100c49:	e8 52 08 00 00       	call   31014a0 <kShell+0x5a4>
 3100c4e:	83 c4 10             	add    esp,0x10
 3100c51:	83 c0 01             	add    eax,0x1
 3100c54:	83 ec 0c             	sub    esp,0xc
 3100c57:	50                   	push   eax
 3100c58:	e8 03 07 00 00       	call   3101360 <kShell+0x464>
 3100c5d:	83 c4 10             	add    esp,0x10
 3100c60:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:221
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 3100c63:	83 ec 08             	sub    esp,0x8
 3100c66:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100c69:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100c6c:	e8 7f 06 00 00       	call   31012f0 <kShell+0x3f4>
 3100c71:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:222
            free(copybuf);
 3100c74:	83 ec 0c             	sub    esp,0xc
 3100c77:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100c7a:	e8 41 08 00 00       	call   31014c0 <kShell+0x5c4>
 3100c7f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:223
            copybuf = (char *) malloc (strlen (input) + 1);
 3100c82:	83 ec 0c             	sub    esp,0xc
 3100c85:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100c88:	e8 13 08 00 00       	call   31014a0 <kShell+0x5a4>
 3100c8d:	83 c4 10             	add    esp,0x10
 3100c90:	83 c0 01             	add    eax,0x1
 3100c93:	83 ec 0c             	sub    esp,0xc
 3100c96:	50                   	push   eax
 3100c97:	e8 c4 06 00 00       	call   3101360 <kShell+0x464>
 3100c9c:	83 c4 10             	add    esp,0x10
 3100c9f:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:224
            argv[argc] = temp;
 3100ca2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100ca5:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100cac:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100caf:	01 c2                	add    edx,eax
 3100cb1:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 3100cb4:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:226
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 3100cb6:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:227
            argv[argc] = NULL;
 3100cba:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100cbd:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100cc4:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100cc7:	01 d0                	add    eax,edx
 3100cc9:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:228
            input++;
 3100ccf:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:229
            free(temp);
 3100cd3:	83 ec 0c             	sub    esp,0xc
 3100cd6:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100cd9:	e8 e2 07 00 00       	call   31014c0 <kShell+0x5c4>
 3100cde:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:232
          }
	}
      while (*input != EOS);
 3100ce1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100ce4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100ce7:	84 c0                	test   al,al
 3100ce9:	0f 85 ed fd ff ff    	jne    3100adc <buildargv+0x5a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:235
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 3100cef:	83 ec 0c             	sub    esp,0xc
 3100cf2:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100cf5:	e8 c6 07 00 00       	call   31014c0 <kShell+0x5c4>
 3100cfa:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:236
  free(nargv);
 3100cfd:	83 ec 0c             	sub    esp,0xc
 3100d00:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100d03:	e8 b8 07 00 00       	call   31014c0 <kShell+0x5c4>
 3100d08:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:237
  return (argv);
 3100d0b:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/kshell/src/kshell.c:238
}
 3100d0e:	c9                   	leave  
 3100d0f:	c3                   	ret    

03100d10 <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:241

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
 3100d10:	55                   	push   ebp
 3100d11:	89 e5                	mov    ebp,esp
 3100d13:	53                   	push   ebx
 3100d14:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:242
    for (int cnt=0;cnt<pcount;cnt++)
 3100d17:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100d1e:	eb 56                	jmp    3100d76 <paramsToArgv+0x66>
/home/yogi/src/os/aproj/kshell/src/kshell.c:244 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 3100d20:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d23:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100d2a:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100d2d:	8d 1c 02             	lea    ebx,[edx+eax*1]
 3100d30:	83 ec 0c             	sub    esp,0xc
 3100d33:	68 80 00 00 00       	push   0x80
 3100d38:	e8 23 06 00 00       	call   3101360 <kShell+0x464>
 3100d3d:	83 c4 10             	add    esp,0x10
 3100d40:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:245 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 3100d42:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d45:	c1 e0 07             	shl    eax,0x7
 3100d48:	89 c2                	mov    edx,eax
 3100d4a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100d4d:	01 c2                	add    edx,eax
 3100d4f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d52:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 3100d59:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100d5c:	01 c8                	add    eax,ecx
 3100d5e:	8b 00                	mov    eax,DWORD PTR [eax]
 3100d60:	83 ec 04             	sub    esp,0x4
 3100d63:	68 80 00 00 00       	push   0x80
 3100d68:	52                   	push   edx
 3100d69:	50                   	push   eax
 3100d6a:	e8 e1 05 00 00       	call   3101350 <kShell+0x454>
 3100d6f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:242 (discriminator 3)
  return (argv);
}

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
    for (int cnt=0;cnt<pcount;cnt++)
 3100d72:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:242 (discriminator 1)
 3100d76:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d79:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100d7c:	7c a2                	jl     3100d20 <paramsToArgv+0x10>
/home/yogi/src/os/aproj/kshell/src/kshell.c:247
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
 3100d7e:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
/home/yogi/src/os/aproj/kshell/src/kshell.c:248
}
 3100d81:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100d84:	c9                   	leave  
 3100d85:	c3                   	ret    

03100d86 <freeArgV>:
freeArgV():
/home/yogi/src/os/aproj/kshell/src/kshell.c:251

void freeArgV(int pcount, char **params)
{
 3100d86:	55                   	push   ebp
 3100d87:	89 e5                	mov    ebp,esp
 3100d89:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:252
    for (int cnt=0;cnt<pcount;cnt++)
 3100d8c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100d93:	eb 15                	jmp    3100daa <freeArgV+0x24>
/home/yogi/src/os/aproj/kshell/src/kshell.c:253 (discriminator 3)
        free(*params);
 3100d95:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100d98:	8b 00                	mov    eax,DWORD PTR [eax]
 3100d9a:	83 ec 0c             	sub    esp,0xc
 3100d9d:	50                   	push   eax
 3100d9e:	e8 1d 07 00 00       	call   31014c0 <kShell+0x5c4>
 3100da3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:252 (discriminator 3)
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 3100da6:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:252 (discriminator 1)
 3100daa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100dad:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100db0:	7c e3                	jl     3100d95 <freeArgV+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:254
        free(*params);
    free(params);
 3100db2:	83 ec 0c             	sub    esp,0xc
 3100db5:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100db8:	e8 03 07 00 00       	call   31014c0 <kShell+0x5c4>
 3100dbd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:255
}
 3100dc0:	90                   	nop
 3100dc1:	c9                   	leave  
 3100dc2:	c3                   	ret    

03100dc3 <getEnvVariableValue>:
getEnvVariableValue():
/home/yogi/src/os/aproj/kshell/src/kshell.c:258

bool getEnvVariableValue(char* evName, char* value)
{
 3100dc3:	55                   	push   ebp
 3100dc4:	89 e5                	mov    ebp,esp
 3100dc6:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:260
    
    for (int cnt=0;cnt<50;cnt++)
 3100dc9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100dd0:	eb 70                	jmp    3100e42 <getEnvVariableValue+0x7f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:262
    {
        if (environmentLoc[cnt]!=0)
 3100dd2:	a1 2c 24 10 03       	mov    eax,ds:0x310242c
 3100dd7:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100dda:	c1 e2 02             	shl    edx,0x2
 3100ddd:	01 d0                	add    eax,edx
 3100ddf:	8b 00                	mov    eax,DWORD PTR [eax]
 3100de1:	85 c0                	test   eax,eax
 3100de3:	74 59                	je     3100e3e <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:264
        {
            char* idx = strstr((char*)environmentLoc[cnt],evName);
 3100de5:	a1 2c 24 10 03       	mov    eax,ds:0x310242c
 3100dea:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100ded:	c1 e2 02             	shl    edx,0x2
 3100df0:	01 d0                	add    eax,edx
 3100df2:	8b 00                	mov    eax,DWORD PTR [eax]
 3100df4:	83 ec 08             	sub    esp,0x8
 3100df7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100dfa:	50                   	push   eax
 3100dfb:	e8 d0 05 00 00       	call   31013d0 <kShell+0x4d4>
 3100e00:	83 c4 10             	add    esp,0x10
 3100e03:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:265
            if (idx>0)
 3100e06:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100e0a:	74 32                	je     3100e3e <getEnvVariableValue+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:267
            {
                idx = strstr(idx,"=");
 3100e0c:	83 ec 08             	sub    esp,0x8
 3100e0f:	68 61 18 10 03       	push   0x3101861
 3100e14:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100e17:	e8 b4 05 00 00       	call   31013d0 <kShell+0x4d4>
 3100e1c:	83 c4 10             	add    esp,0x10
 3100e1f:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:269
                //++ because we don't want to include the = sign
                strcpy(value, ++idx);
 3100e22:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100e26:	83 ec 08             	sub    esp,0x8
 3100e29:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100e2c:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100e2f:	e8 bc 04 00 00       	call   31012f0 <kShell+0x3f4>
 3100e34:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:271
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
 3100e37:	b8 01 00 00 00       	mov    eax,0x1
 3100e3c:	eb 0f                	jmp    3100e4d <getEnvVariableValue+0x8a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:260 (discriminator 2)
}

bool getEnvVariableValue(char* evName, char* value)
{
    
    for (int cnt=0;cnt<50;cnt++)
 3100e3e:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:260 (discriminator 1)
 3100e42:	83 7d f4 31          	cmp    DWORD PTR [ebp-0xc],0x31
 3100e46:	7e 8a                	jle    3100dd2 <getEnvVariableValue+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:275
                //print("getEnvVariableValue: value for '%s'='%s'\n",evName, value);
                return true;
            }
        }
    } 
    return false;
 3100e48:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:276
}
 3100e4d:	c9                   	leave  
 3100e4e:	c3                   	ret    

03100e4f <saveCommand>:
saveCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:289
    
}
*/

void saveCommand(char* command)
{
 3100e4f:	55                   	push   ebp
 3100e50:	89 e5                	mov    ebp,esp
 3100e52:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:290
    strcpy(commandHistory[commandHistoryMax++],command);
 3100e55:	a1 7c 27 10 03       	mov    eax,ds:0x310277c
 3100e5a:	8d 50 01             	lea    edx,[eax+0x1]
 3100e5d:	89 15 7c 27 10 03    	mov    DWORD PTR ds:0x310277c,edx
 3100e63:	c1 e0 07             	shl    eax,0x7
 3100e66:	05 80 27 10 03       	add    eax,0x3102780
 3100e6b:	83 ec 08             	sub    esp,0x8
 3100e6e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100e71:	50                   	push   eax
 3100e72:	e8 79 04 00 00       	call   31012f0 <kShell+0x3f4>
 3100e77:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:291
}
 3100e7a:	90                   	nop
 3100e7b:	c9                   	leave  
 3100e7c:	c3                   	ret    

03100e7d <prompt>:
prompt():
/home/yogi/src/os/aproj/kshell/src/kshell.c:294

void prompt()
{
 3100e7d:	55                   	push   ebp
 3100e7e:	89 e5                	mov    ebp,esp
 3100e80:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:295
    print("%s %s> ",sExecutingProgram, cwd);
 3100e83:	83 ec 04             	sub    esp,0x4
 3100e86:	68 40 24 10 03       	push   0x3102440
 3100e8b:	68 40 25 10 03       	push   0x3102540
 3100e90:	68 63 18 10 03       	push   0x3101863
 3100e95:	e8 76 04 00 00       	call   3101310 <kShell+0x414>
 3100e9a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:296
}
 3100e9d:	90                   	nop
 3100e9e:	c9                   	leave  
 3100e9f:	c3                   	ret    

03100ea0 <reprintCommand>:
reprintCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:299

int reprintCommand(char* command)
{
 3100ea0:	55                   	push   ebp
 3100ea1:	89 e5                	mov    ebp,esp
 3100ea3:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:300
    resetRow();
 3100ea6:	e8 85 04 00 00       	call   3101330 <kShell+0x434>
/home/yogi/src/os/aproj/kshell/src/kshell.c:301
    prompt();
 3100eab:	e8 cd ff ff ff       	call   3100e7d <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:302
    print("%s",command);
 3100eb0:	83 ec 08             	sub    esp,0x8
 3100eb3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100eb6:	68 6b 18 10 03       	push   0x310186b
 3100ebb:	e8 50 04 00 00       	call   3101310 <kShell+0x414>
 3100ec0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:304
 
}
 3100ec3:	90                   	nop
 3100ec4:	c9                   	leave  
 3100ec5:	c3                   	ret    

03100ec6 <handleSignals>:
handleSignals():
/home/yogi/src/os/aproj/kshell/src/kshell.c:307

int handleSignals(int signal)
{
 3100ec6:	55                   	push   ebp
 3100ec7:	89 e5                	mov    ebp,esp
/home/yogi/src/os/aproj/kshell/src/kshell.c:308
    switch (signal)
 3100ec9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100ecc:	83 f8 08             	cmp    eax,0x8
 3100ecf:	75 08                	jne    3100ed9 <handleSignals+0x13>
/home/yogi/src/os/aproj/kshell/src/kshell.c:311
    {
        case SIGINT:
            bSigIntReceived = true;
 3100ed1:	c6 05 20 24 10 03 01 	mov    BYTE PTR ds:0x3102420,0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:312
            break;
 3100ed8:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:314
    }
}
 3100ed9:	90                   	nop
 3100eda:	5d                   	pop    ebp
 3100edb:	c3                   	ret    

03100edc <processSignal>:
processSignal():
/home/yogi/src/os/aproj/kshell/src/kshell.c:317

int processSignal(int signal)
{
 3100edc:	55                   	push   ebp
 3100edd:	89 e5                	mov    ebp,esp
/home/yogi/src/os/aproj/kshell/src/kshell.c:318
    switch (signal)
 3100edf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100ee2:	83 f8 08             	cmp    eax,0x8
 3100ee5:	75 0e                	jne    3100ef5 <processSignal+0x19>
/home/yogi/src/os/aproj/kshell/src/kshell.c:322
    {
        case SIGINT:
            //printf("^C\n");
            bSigIntReceived = false;
 3100ee7:	c6 05 20 24 10 03 00 	mov    BYTE PTR ds:0x3102420,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:323
            return SIGINT;
 3100eee:	b8 08 00 00 00       	mov    eax,0x8
 3100ef3:	eb 05                	jmp    3100efa <processSignal+0x1e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:326
            break;
    }
    return 0;
 3100ef5:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:327
}
 3100efa:	5d                   	pop    ebp
 3100efb:	c3                   	ret    

03100efc <kShell>:
kShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:330

int kShell(int argc, char** argv, char** envp)
{
 3100efc:	55                   	push   ebp
 3100efd:	89 e5                	mov    ebp,esp
 3100eff:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:331
    uint8_t lCurrKey=0;
 3100f02:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:332
    int lCurrKeyCount=0;
 3100f06:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:333
    int commandWasFromThisBufferPtr=0;
 3100f0d:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:336
    char ansiSeq[20];

    bSigIntReceived = false;
 3100f14:	c6 05 20 24 10 03 00 	mov    BYTE PTR ds:0x3102420,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:337
    exitCode = 0;
 3100f1b:	c7 05 68 27 10 03 00 	mov    DWORD PTR ds:0x3102768,0x0
 3100f22:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/kshell.c:338
    timeToExit = false;
 3100f25:	c6 05 74 27 10 03 00 	mov    BYTE PTR ds:0x3102774,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:339
    strcpy(delim," \t\n-,");
 3100f2c:	83 ec 08             	sub    esp,0x8
 3100f2f:	68 6e 18 10 03       	push   0x310186e
 3100f34:	68 24 24 10 03       	push   0x3102424
 3100f39:	e8 b2 03 00 00       	call   31012f0 <kShell+0x3f4>
 3100f3e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:340
    environmentLoc = envp;
 3100f41:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100f44:	a3 2c 24 10 03       	mov    ds:0x310242c,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:341
    ansiSeq[0]=0x1b;
 3100f49:	c6 45 d7 1b          	mov    BYTE PTR [ebp-0x29],0x1b
/home/yogi/src/os/aproj/kshell/src/kshell.c:342
    sKShellProgramName=malloc(1024);
 3100f4d:	83 ec 0c             	sub    esp,0xc
 3100f50:	68 00 04 00 00       	push   0x400
 3100f55:	e8 06 04 00 00       	call   3101360 <kShell+0x464>
 3100f5a:	83 c4 10             	add    esp,0x10
 3100f5d:	a3 6c 27 10 03       	mov    ds:0x310276c,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:343
    strcpy(sKShellProgramName,"kShell");
 3100f62:	a1 6c 27 10 03       	mov    eax,ds:0x310276c
 3100f67:	83 ec 08             	sub    esp,0x8
 3100f6a:	68 74 18 10 03       	push   0x3101874
 3100f6f:	50                   	push   eax
 3100f70:	e8 7b 03 00 00       	call   31012f0 <kShell+0x3f4>
 3100f75:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:344
    strcpy(sExecutingProgram,sKShellProgramName);
 3100f78:	a1 6c 27 10 03       	mov    eax,ds:0x310276c
 3100f7d:	83 ec 08             	sub    esp,0x8
 3100f80:	50                   	push   eax
 3100f81:	68 40 25 10 03       	push   0x3102540
 3100f86:	e8 65 03 00 00       	call   31012f0 <kShell+0x3f4>
 3100f8b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:347
    //puts("\nWelcome to kShell ... hang a while!\n");

    modifySignal(SIGINT, handleSignals, 0);
 3100f8e:	83 ec 04             	sub    esp,0x4
 3100f91:	6a 00                	push   0x0
 3100f93:	68 c6 0e 10 03       	push   0x3100ec6
 3100f98:	6a 08                	push   0x8
 3100f9a:	e8 d1 04 00 00       	call   3101470 <kShell+0x574>
 3100f9f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:349
    
    while (!timeToExit)
 3100fa2:	e9 0f 03 00 00       	jmp    31012b6 <kShell+0x3ba>
/home/yogi/src/os/aproj/kshell/src/kshell.c:352
    {
getACommand:
        commandHistoryPtr = commandHistoryMax;
 3100fa7:	a1 7c 27 10 03       	mov    eax,ds:0x310277c
 3100fac:	a3 78 27 10 03       	mov    ds:0x3102778,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:353
        commandWasFromThisBufferPtr = -1;
 3100fb1:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:354
        lCurrKey=0;
 3100fb8:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:355
        lCurrKeyCount=0;
 3100fbc:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:356
        memset(lCommand,0,256);
 3100fc3:	83 ec 04             	sub    esp,0x4
 3100fc6:	68 00 01 00 00       	push   0x100
 3100fcb:	6a 00                	push   0x0
 3100fcd:	68 80 21 11 03       	push   0x3112180
 3100fd2:	e8 69 04 00 00       	call   3101440 <kShell+0x544>
 3100fd7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:357
        getenv("CWD",cwd);
 3100fda:	83 ec 08             	sub    esp,0x8
 3100fdd:	68 40 24 10 03       	push   0x3102440
 3100fe2:	68 7b 18 10 03       	push   0x310187b
 3100fe7:	e8 54 03 00 00       	call   3101340 <kShell+0x444>
 3100fec:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:358
        prompt();
 3100fef:	e8 89 fe ff ff       	call   3100e7d <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:360
getAKey:
        lCurrKey=0;
 3100ff4:	c6 45 eb 00          	mov    BYTE PTR [ebp-0x15],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:361
        while(lCurrKey==0)
 3100ff8:	eb 52                	jmp    310104c <kShell+0x150>
/home/yogi/src/os/aproj/kshell/src/kshell.c:363
        {
            read(STDIN, &lCurrKey, 1, 1); //Reading from STDIN blocks until a key is available
 3100ffa:	6a 01                	push   0x1
 3100ffc:	6a 01                	push   0x1
 3100ffe:	8d 45 eb             	lea    eax,[ebp-0x15]
 3101001:	50                   	push   eax
 3101002:	6a 00                	push   0x0
 3101004:	e8 d7 03 00 00       	call   31013e0 <kShell+0x4e4>
 3101009:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:365
//            gets(&lCurrKey,1,1);
            if (bSigIntReceived)
 310100c:	0f b6 05 20 24 10 03 	movzx  eax,BYTE PTR ds:0x3102420
 3101013:	84 c0                	test   al,al
 3101015:	74 35                	je     310104c <kShell+0x150>
/home/yogi/src/os/aproj/kshell/src/kshell.c:367
            {
                if (processSignal(SIGINT)==SIGINT)
 3101017:	83 ec 0c             	sub    esp,0xc
 310101a:	6a 08                	push   0x8
 310101c:	e8 bb fe ff ff       	call   3100edc <processSignal>
 3101021:	83 c4 10             	add    esp,0x10
 3101024:	83 f8 08             	cmp    eax,0x8
 3101027:	75 23                	jne    310104c <kShell+0x150>
/home/yogi/src/os/aproj/kshell/src/kshell.c:369
                {
                    lCommand[0] = 0x0;
 3101029:	c6 05 80 21 11 03 00 	mov    BYTE PTR ds:0x3112180,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:370
                    lCurrKeyCount = 0;
 3101030:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:371
                    printf("\n");
 3101037:	83 ec 0c             	sub    esp,0xc
 310103a:	68 7f 18 10 03       	push   0x310187f
 310103f:	e8 dc 02 00 00       	call   3101320 <kShell+0x424>
 3101044:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:372
                    prompt();
 3101047:	e8 31 fe ff ff       	call   3100e7d <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:361
        memset(lCommand,0,256);
        getenv("CWD",cwd);
        prompt();
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 310104c:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 3101050:	84 c0                	test   al,al
 3101052:	74 a6                	je     3100ffa <kShell+0xfe>
/home/yogi/src/os/aproj/kshell/src/kshell.c:377
                    prompt();
                }
            }
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 3101054:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 3101058:	3c c8                	cmp    al,0xc8
 310105a:	0f 85 95 00 00 00    	jne    31010f5 <kShell+0x1f9>
/home/yogi/src/os/aproj/kshell/src/kshell.c:379
        {
            if (commandHistoryPtr>=0)
 3101060:	a1 78 27 10 03       	mov    eax,ds:0x3102778
 3101065:	85 c0                	test   eax,eax
 3101067:	78 8b                	js     3100ff4 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:382
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
 3101069:	a1 78 27 10 03       	mov    eax,ds:0x3102778
 310106e:	83 e8 01             	sub    eax,0x1
 3101071:	85 c0                	test   eax,eax
 3101073:	0f 88 7b ff ff ff    	js     3100ff4 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:384
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
 3101079:	a1 78 27 10 03       	mov    eax,ds:0x3102778
 310107e:	83 e8 01             	sub    eax,0x1
 3101081:	a3 78 27 10 03       	mov    ds:0x3102778,eax
 3101086:	a1 78 27 10 03       	mov    eax,ds:0x3102778
 310108b:	c1 e0 07             	shl    eax,0x7
 310108e:	05 80 27 10 03       	add    eax,0x3102780
 3101093:	83 ec 08             	sub    esp,0x8
 3101096:	50                   	push   eax
 3101097:	68 80 21 11 03       	push   0x3112180
 310109c:	e8 4f 02 00 00       	call   31012f0 <kShell+0x3f4>
 31010a1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:385
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 31010a4:	a1 78 27 10 03       	mov    eax,ds:0x3102778
 31010a9:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:386
                    while (lCurrKeyCount>0)
 31010ac:	eb 14                	jmp    31010c2 <kShell+0x1c6>
/home/yogi/src/os/aproj/kshell/src/kshell.c:388
                    {
                        printf(KEY_BACKSPACE);
 31010ae:	83 ec 0c             	sub    esp,0xc
 31010b1:	68 81 18 10 03       	push   0x3101881
 31010b6:	e8 65 02 00 00       	call   3101320 <kShell+0x424>
 31010bb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:389
                        lCurrKeyCount--;
 31010be:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:386
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
 31010c2:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31010c6:	7f e6                	jg     31010ae <kShell+0x1b2>
/home/yogi/src/os/aproj/kshell/src/kshell.c:391
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
 31010c8:	83 ec 08             	sub    esp,0x8
 31010cb:	68 80 21 11 03       	push   0x3112180
 31010d0:	68 6b 18 10 03       	push   0x310186b
 31010d5:	e8 46 02 00 00       	call   3101320 <kShell+0x424>
 31010da:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:392
                    lCurrKeyCount=strlen(lCommand);
 31010dd:	83 ec 0c             	sub    esp,0xc
 31010e0:	68 80 21 11 03       	push   0x3112180
 31010e5:	e8 b6 03 00 00       	call   31014a0 <kShell+0x5a4>
 31010ea:	83 c4 10             	add    esp,0x10
 31010ed:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:394
                }
                goto getAKey;
 31010f0:	e9 ff fe ff ff       	jmp    3100ff4 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:399
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
 31010f5:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31010f9:	3c d0                	cmp    al,0xd0
 31010fb:	0f 85 9e 00 00 00    	jne    310119f <kShell+0x2a3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:401
        {
            if (commandHistoryPtr>=0)
 3101101:	a1 78 27 10 03       	mov    eax,ds:0x3102778
 3101106:	85 c0                	test   eax,eax
 3101108:	0f 88 e6 fe ff ff    	js     3100ff4 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:404
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
 310110e:	a1 78 27 10 03       	mov    eax,ds:0x3102778
 3101113:	8d 50 01             	lea    edx,[eax+0x1]
 3101116:	a1 7c 27 10 03       	mov    eax,ds:0x310277c
 310111b:	39 c2                	cmp    edx,eax
 310111d:	0f 8d d1 fe ff ff    	jge    3100ff4 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:406
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
 3101123:	a1 78 27 10 03       	mov    eax,ds:0x3102778
 3101128:	83 c0 01             	add    eax,0x1
 310112b:	a3 78 27 10 03       	mov    ds:0x3102778,eax
 3101130:	a1 78 27 10 03       	mov    eax,ds:0x3102778
 3101135:	c1 e0 07             	shl    eax,0x7
 3101138:	05 80 27 10 03       	add    eax,0x3102780
 310113d:	83 ec 08             	sub    esp,0x8
 3101140:	50                   	push   eax
 3101141:	68 80 21 11 03       	push   0x3112180
 3101146:	e8 a5 01 00 00       	call   31012f0 <kShell+0x3f4>
 310114b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:407
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 310114e:	a1 78 27 10 03       	mov    eax,ds:0x3102778
 3101153:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:408
                    while (lCurrKeyCount>0)
 3101156:	eb 14                	jmp    310116c <kShell+0x270>
/home/yogi/src/os/aproj/kshell/src/kshell.c:410
                    {
                        printf(KEY_BACKSPACE);
 3101158:	83 ec 0c             	sub    esp,0xc
 310115b:	68 81 18 10 03       	push   0x3101881
 3101160:	e8 bb 01 00 00       	call   3101320 <kShell+0x424>
 3101165:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:411
                        lCurrKeyCount--;
 3101168:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:408
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
 310116c:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3101170:	7f e6                	jg     3101158 <kShell+0x25c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:413
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
 3101172:	83 ec 08             	sub    esp,0x8
 3101175:	68 80 21 11 03       	push   0x3112180
 310117a:	68 6b 18 10 03       	push   0x310186b
 310117f:	e8 9c 01 00 00       	call   3101320 <kShell+0x424>
 3101184:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:414
                    lCurrKeyCount=strlen(lCommand);
 3101187:	83 ec 0c             	sub    esp,0xc
 310118a:	68 80 21 11 03       	push   0x3112180
 310118f:	e8 0c 03 00 00       	call   31014a0 <kShell+0x5a4>
 3101194:	83 c4 10             	add    esp,0x10
 3101197:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:416
                }
                goto getAKey;
 310119a:	e9 55 fe ff ff       	jmp    3100ff4 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:421
            }
            else
                goto getAKey;
        }   
        else if (lCurrKey==0xcb) //left
 310119f:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31011a3:	3c cb                	cmp    al,0xcb
 31011a5:	75 1f                	jne    31011c6 <kShell+0x2ca>
/home/yogi/src/os/aproj/kshell/src/kshell.c:423
        {
            if (lCurrKeyCount>0)
 31011a7:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31011ab:	0f 8e 43 fe ff ff    	jle    3100ff4 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:425
            {
                print("\033[1D");
 31011b1:	83 ec 0c             	sub    esp,0xc
 31011b4:	68 8b 18 10 03       	push   0x310188b
 31011b9:	e8 52 01 00 00       	call   3101310 <kShell+0x414>
 31011be:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:428
            }
             
            goto getAKey;
 31011c1:	e9 2e fe ff ff       	jmp    3100ff4 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:430
        }
        else if (lCurrKey==0xcd) //right
 31011c6:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31011ca:	3c cd                	cmp    al,0xcd
 31011cc:	75 15                	jne    31011e3 <kShell+0x2e7>
/home/yogi/src/os/aproj/kshell/src/kshell.c:432
        {
            print("\033[1C");
 31011ce:	83 ec 0c             	sub    esp,0xc
 31011d1:	68 90 18 10 03       	push   0x3101890
 31011d6:	e8 35 01 00 00       	call   3101310 <kShell+0x414>
 31011db:	83 c4 10             	add    esp,0x10
 31011de:	e9 11 fe ff ff       	jmp    3100ff4 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:434
        }
        else if (lCurrKey=='\b') //backspace
 31011e3:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 31011e7:	3c 08                	cmp    al,0x8
 31011e9:	75 32                	jne    310121d <kShell+0x321>
/home/yogi/src/os/aproj/kshell/src/kshell.c:436
        {
            if (lCurrKeyCount-1 >= 0)
 31011eb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31011ee:	83 e8 01             	sub    eax,0x1
 31011f1:	85 c0                	test   eax,eax
 31011f3:	0f 88 fb fd ff ff    	js     3100ff4 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:438
            {
                lCurrKeyCount--;
 31011f9:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:439
                lCommand[lCurrKeyCount]='\0';
 31011fd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101200:	05 80 21 11 03       	add    eax,0x3112180
 3101205:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:440
                printf(KEY_BACKSPACE);
 3101208:	83 ec 0c             	sub    esp,0xc
 310120b:	68 81 18 10 03       	push   0x3101881
 3101210:	e8 0b 01 00 00       	call   3101320 <kShell+0x424>
 3101215:	83 c4 10             	add    esp,0x10
 3101218:	e9 d7 fd ff ff       	jmp    3100ff4 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:443
            }
        }
        else if (lCurrKey==0xa) //Enter
 310121d:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 3101221:	3c 0a                	cmp    al,0xa
 3101223:	75 21                	jne    3101246 <kShell+0x34a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:445
        {
            print("\n");
 3101225:	83 ec 0c             	sub    esp,0xc
 3101228:	68 7f 18 10 03       	push   0x310187f
 310122d:	e8 de 00 00 00       	call   3101310 <kShell+0x414>
 3101232:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:446
            goto doneGettingKeys;
 3101235:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:459
            commandWasFromThisBufferPtr=-1;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 3101236:	0f b6 05 80 21 11 03 	movzx  eax,BYTE PTR ds:0x3112180
 310123d:	84 c0                	test   al,al
 310123f:	75 3c                	jne    310127d <kShell+0x381>
 3101241:	e9 61 fd ff ff       	jmp    3100fa7 <kShell+0xab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:450
            print("\n");
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3101246:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101249:	8d 50 01             	lea    edx,[eax+0x1]
 310124c:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310124f:	0f b6 55 eb          	movzx  edx,BYTE PTR [ebp-0x15]
 3101253:	88 90 80 21 11 03    	mov    BYTE PTR [eax+0x3112180],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:452
            //reprintCommand(lCommand);
            printf("%c",lCurrKey);
 3101259:	0f b6 45 eb          	movzx  eax,BYTE PTR [ebp-0x15]
 310125d:	0f b6 c0             	movzx  eax,al
 3101260:	83 ec 08             	sub    esp,0x8
 3101263:	50                   	push   eax
 3101264:	68 95 18 10 03       	push   0x3101895
 3101269:	e8 b2 00 00 00       	call   3101320 <kShell+0x424>
 310126e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:454
            //Reset pointer to command buffer so that this possibly modified command gets written as a new one
            commandWasFromThisBufferPtr=-1;
 3101271:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:456
        }
        goto getAKey;
 3101278:	e9 77 fd ff ff       	jmp    3100ff4 <kShell+0xf8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:461
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
            goto getACommand;
        if (commandWasFromThisBufferPtr == -1)
 310127d:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
 3101281:	75 10                	jne    3101293 <kShell+0x397>
/home/yogi/src/os/aproj/kshell/src/kshell.c:462
            saveCommand(lCommand);
 3101283:	83 ec 0c             	sub    esp,0xc
 3101286:	68 80 21 11 03       	push   0x3112180
 310128b:	e8 bf fb ff ff       	call   3100e4f <saveCommand>
 3101290:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:463
        int i = findCommand(lCommand);
 3101293:	83 ec 0c             	sub    esp,0xc
 3101296:	68 80 21 11 03       	push   0x3112180
 310129b:	e8 79 f7 ff ff       	call   3100a19 <findCommand>
 31012a0:	83 c4 10             	add    esp,0x10
 31012a3:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:464
        execInternalCommand(lCommand);
 31012a6:	83 ec 0c             	sub    esp,0xc
 31012a9:	68 80 21 11 03       	push   0x3112180
 31012ae:	e8 09 f5 ff ff       	call   31007bc <execInternalCommand>
 31012b3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:349
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    modifySignal(SIGINT, handleSignals, 0);
    
    while (!timeToExit)
 31012b6:	0f b6 05 74 27 10 03 	movzx  eax,BYTE PTR ds:0x3102774
 31012bd:	83 f0 01             	xor    eax,0x1
 31012c0:	84 c0                	test   al,al
 31012c2:	0f 85 df fc ff ff    	jne    3100fa7 <kShell+0xab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:466
        if (commandWasFromThisBufferPtr == -1)
            saveCommand(lCommand);
        int i = findCommand(lCommand);
        execInternalCommand(lCommand);
    }
    free(sKShellProgramName);
 31012c8:	a1 6c 27 10 03       	mov    eax,ds:0x310276c
 31012cd:	83 ec 0c             	sub    esp,0xc
 31012d0:	50                   	push   eax
 31012d1:	e8 ea 01 00 00       	call   31014c0 <kShell+0x5c4>
 31012d6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:467
    return exitCode;
 31012d9:	a1 68 27 10 03       	mov    eax,ds:0x3102768
/home/yogi/src/os/aproj/kshell/src/kshell.c:468
}
 31012de:	c9                   	leave  
 31012df:	c3                   	ret    

Disassembly of section .plt:

031012e0 <.plt>:
 31012e0:	ff 35 94 23 10 03    	push   DWORD PTR ds:0x3102394
 31012e6:	ff 25 98 23 10 03    	jmp    DWORD PTR ds:0x3102398
 31012ec:	00 00                	add    BYTE PTR [eax],al
 31012ee:	00 00                	add    BYTE PTR [eax],al
 31012f0:	ff 25 9c 23 10 03    	jmp    DWORD PTR ds:0x310239c
 31012f6:	68 00 00 00 00       	push   0x0
 31012fb:	e9 e0 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101300:	ff 25 a0 23 10 03    	jmp    DWORD PTR ds:0x31023a0
 3101306:	68 08 00 00 00       	push   0x8
 310130b:	e9 d0 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101310:	ff 25 a4 23 10 03    	jmp    DWORD PTR ds:0x31023a4
 3101316:	68 10 00 00 00       	push   0x10
 310131b:	e9 c0 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101320:	ff 25 a8 23 10 03    	jmp    DWORD PTR ds:0x31023a8
 3101326:	68 18 00 00 00       	push   0x18
 310132b:	e9 b0 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101330:	ff 25 ac 23 10 03    	jmp    DWORD PTR ds:0x31023ac
 3101336:	68 20 00 00 00       	push   0x20
 310133b:	e9 a0 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101340:	ff 25 b0 23 10 03    	jmp    DWORD PTR ds:0x31023b0
 3101346:	68 28 00 00 00       	push   0x28
 310134b:	e9 90 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101350:	ff 25 b4 23 10 03    	jmp    DWORD PTR ds:0x31023b4
 3101356:	68 30 00 00 00       	push   0x30
 310135b:	e9 80 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101360:	ff 25 b8 23 10 03    	jmp    DWORD PTR ds:0x31023b8
 3101366:	68 38 00 00 00       	push   0x38
 310136b:	e9 70 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101370:	ff 25 bc 23 10 03    	jmp    DWORD PTR ds:0x31023bc
 3101376:	68 40 00 00 00       	push   0x40
 310137b:	e9 60 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101380:	ff 25 c0 23 10 03    	jmp    DWORD PTR ds:0x31023c0
 3101386:	68 48 00 00 00       	push   0x48
 310138b:	e9 50 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101390:	ff 25 c4 23 10 03    	jmp    DWORD PTR ds:0x31023c4
 3101396:	68 50 00 00 00       	push   0x50
 310139b:	e9 40 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 31013a0:	ff 25 c8 23 10 03    	jmp    DWORD PTR ds:0x31023c8
 31013a6:	68 58 00 00 00       	push   0x58
 31013ab:	e9 30 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 31013b0:	ff 25 cc 23 10 03    	jmp    DWORD PTR ds:0x31023cc
 31013b6:	68 60 00 00 00       	push   0x60
 31013bb:	e9 20 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 31013c0:	ff 25 d0 23 10 03    	jmp    DWORD PTR ds:0x31023d0
 31013c6:	68 68 00 00 00       	push   0x68
 31013cb:	e9 10 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 31013d0:	ff 25 d4 23 10 03    	jmp    DWORD PTR ds:0x31023d4
 31013d6:	68 70 00 00 00       	push   0x70
 31013db:	e9 00 ff ff ff       	jmp    31012e0 <kShell+0x3e4>
 31013e0:	ff 25 d8 23 10 03    	jmp    DWORD PTR ds:0x31023d8
 31013e6:	68 78 00 00 00       	push   0x78
 31013eb:	e9 f0 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 31013f0:	ff 25 dc 23 10 03    	jmp    DWORD PTR ds:0x31023dc
 31013f6:	68 80 00 00 00       	push   0x80
 31013fb:	e9 e0 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101400:	ff 25 e0 23 10 03    	jmp    DWORD PTR ds:0x31023e0
 3101406:	68 88 00 00 00       	push   0x88
 310140b:	e9 d0 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101410:	ff 25 e4 23 10 03    	jmp    DWORD PTR ds:0x31023e4
 3101416:	68 90 00 00 00       	push   0x90
 310141b:	e9 c0 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101420:	ff 25 e8 23 10 03    	jmp    DWORD PTR ds:0x31023e8
 3101426:	68 98 00 00 00       	push   0x98
 310142b:	e9 b0 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101430:	ff 25 ec 23 10 03    	jmp    DWORD PTR ds:0x31023ec
 3101436:	68 a0 00 00 00       	push   0xa0
 310143b:	e9 a0 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101440:	ff 25 f0 23 10 03    	jmp    DWORD PTR ds:0x31023f0
 3101446:	68 a8 00 00 00       	push   0xa8
 310144b:	e9 90 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101450:	ff 25 f4 23 10 03    	jmp    DWORD PTR ds:0x31023f4
 3101456:	68 b0 00 00 00       	push   0xb0
 310145b:	e9 80 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101460:	ff 25 f8 23 10 03    	jmp    DWORD PTR ds:0x31023f8
 3101466:	68 b8 00 00 00       	push   0xb8
 310146b:	e9 70 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101470:	ff 25 fc 23 10 03    	jmp    DWORD PTR ds:0x31023fc
 3101476:	68 c0 00 00 00       	push   0xc0
 310147b:	e9 60 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101480:	ff 25 00 24 10 03    	jmp    DWORD PTR ds:0x3102400
 3101486:	68 c8 00 00 00       	push   0xc8
 310148b:	e9 50 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 3101490:	ff 25 04 24 10 03    	jmp    DWORD PTR ds:0x3102404
 3101496:	68 d0 00 00 00       	push   0xd0
 310149b:	e9 40 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 31014a0:	ff 25 08 24 10 03    	jmp    DWORD PTR ds:0x3102408
 31014a6:	68 d8 00 00 00       	push   0xd8
 31014ab:	e9 30 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 31014b0:	ff 25 0c 24 10 03    	jmp    DWORD PTR ds:0x310240c
 31014b6:	68 e0 00 00 00       	push   0xe0
 31014bb:	e9 20 fe ff ff       	jmp    31012e0 <kShell+0x3e4>
 31014c0:	ff 25 10 24 10 03    	jmp    DWORD PTR ds:0x3102410
 31014c6:	68 e8 00 00 00       	push   0xe8
 31014cb:	e9 10 fe ff ff       	jmp    31012e0 <kShell+0x3e4>

Disassembly of section .rodata:

031014d0 <.rodata>:
 31014d0:	63 6c 65 61          	arpl   WORD PTR [ebp+eiz*2+0x61],bp
 31014d4:	72 00                	jb     31014d6 <kShell+0x5da>
 31014d6:	43                   	inc    ebx
 31014d7:	6c                   	ins    BYTE PTR es:[edi],dx
 31014d8:	65                   	gs
 31014d9:	61                   	popa   
 31014da:	72 20                	jb     31014fc <kShell+0x600>
 31014dc:	74 68                	je     3101546 <kShell+0x64a>
 31014de:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 31014e2:	72 65                	jb     3101549 <kShell+0x64d>
 31014e4:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31014e6:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 31014e9:	76 00                	jbe    31014eb <kShell+0x5ef>
 31014eb:	50                   	push   eax
 31014ec:	72 69                	jb     3101557 <kShell+0x65b>
 31014ee:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31014ef:	74 20                	je     3101511 <kShell+0x615>
 31014f1:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31014f3:	76 69                	jbe    310155e <kShell+0x662>
 31014f5:	72 6f                	jb     3101566 <kShell+0x66a>
 31014f7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31014f8:	6d                   	ins    DWORD PTR es:[edi],dx
 31014f9:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31014fb:	74 00                	je     31014fd <kShell+0x601>
 31014fd:	65                   	gs
 31014fe:	78 65                	js     3101565 <kShell+0x669>
 3101500:	63 00                	arpl   WORD PTR [eax],ax
 3101502:	45                   	inc    ebp
 3101503:	78 65                	js     310156a <kShell+0x66e>
 3101505:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101508:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 310150c:	70 72                	jo     3101580 <kShell+0x684>
 310150e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310150f:	67 72 61             	addr16 jb 3101573 <kShell+0x677>
 3101512:	6d                   	ins    DWORD PTR es:[edi],dx
 3101513:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101516:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 310151d:	20 
 310151e:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3101522:	6c                   	ins    BYTE PTR es:[edi],dx
 3101523:	6c                   	ins    BYTE PTR es:[edi],dx
 3101524:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3101527:	6c                   	ins    BYTE PTR es:[edi],dx
 3101528:	70 00                	jo     310152a <kShell+0x62e>
 310152a:	47                   	inc    edi
 310152b:	65                   	gs
 310152c:	74 20                	je     310154e <kShell+0x652>
 310152e:	68 65 6c 70 20       	push   0x20706c65
 3101533:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3101537:	73 20                	jae    3101559 <kShell+0x65d>
 3101539:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3101540:	74 69                	je     31015ab <kShell+0x6af>
 3101542:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101543:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101544:	29 00                	sub    DWORD PTR [eax],eax
 3101546:	70 77                	jo     31015bf <kShell+0x6c3>
 3101548:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 310154c:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3101553:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3101557:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 310155b:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3101560:	79 00                	jns    3101562 <kShell+0x666>
 3101562:	72 65                	jb     31015c9 <kShell+0x6cd>
 3101564:	70 65                	jo     31015cb <kShell+0x6cf>
 3101566:	61                   	popa   
 3101567:	74 00                	je     3101569 <kShell+0x66d>
 3101569:	52                   	push   edx
 310156a:	65                   	gs
 310156b:	70 65                	jo     31015d2 <kShell+0x6d6>
 310156d:	61                   	popa   
 310156e:	74 20                	je     3101590 <kShell+0x694>
 3101570:	61                   	popa   
 3101571:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 3101574:	6d                   	ins    DWORD PTR es:[edi],dx
 3101575:	6d                   	ins    DWORD PTR es:[edi],dx
 3101576:	61                   	popa   
 3101577:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101578:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 310157c:	74 69                	je     31015e7 <kShell+0x6eb>
 310157e:	6d                   	ins    DWORD PTR es:[edi],dx
 310157f:	65                   	gs
 3101580:	73 00                	jae    3101582 <kShell+0x686>
 3101582:	73 65                	jae    31015e9 <kShell+0x6ed>
 3101584:	74 00                	je     3101586 <kShell+0x68a>
 3101586:	53                   	push   ebx
 3101587:	65                   	gs
 3101588:	74 20                	je     31015aa <kShell+0x6ae>
 310158a:	61                   	popa   
 310158b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310158c:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 310158f:	76 69                	jbe    31015fa <kShell+0x6fe>
 3101591:	72 6f                	jb     3101602 <kShell+0x706>
 3101593:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101594:	6d                   	ins    DWORD PTR es:[edi],dx
 3101595:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101597:	74 20                	je     31015b9 <kShell+0x6bd>
 3101599:	76 61                	jbe    31015fc <kShell+0x700>
 310159b:	72 69                	jb     3101606 <kShell+0x70a>
 310159d:	61                   	popa   
 310159e:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 31015a2:	73 6c                	jae    3101610 <kShell+0x714>
 31015a4:	65                   	gs
 31015a5:	65                   	gs
 31015a6:	70 00                	jo     31015a8 <kShell+0x6ac>
 31015a8:	53                   	push   ebx
 31015a9:	6c                   	ins    BYTE PTR es:[edi],dx
 31015aa:	65                   	gs
 31015ab:	65                   	gs
 31015ac:	70 20                	jo     31015ce <kShell+0x6d2>
 31015ae:	66 6f                	outs   dx,WORD PTR ds:[esi]
 31015b0:	72 20                	jb     31015d2 <kShell+0x6d6>
 31015b2:	78 20                	js     31015d4 <kShell+0x6d8>
 31015b4:	73 65                	jae    310161b <kShell+0x71f>
 31015b6:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 31015b9:	64                   	fs
 31015ba:	73 00                	jae    31015bc <kShell+0x6c0>
 31015bc:	74 69                	je     3101627 <kShell+0x72b>
 31015be:	6d                   	ins    DWORD PTR es:[edi],dx
 31015bf:	65 00 00             	add    BYTE PTR gs:[eax],al
 31015c2:	00 00                	add    BYTE PTR [eax],al
 31015c4:	54                   	push   esp
 31015c5:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 31015cc:	72 6f                	jb     310163d <kShell+0x741>
 31015ce:	67 72 61             	addr16 jb 3101632 <kShell+0x736>
 31015d1:	6d                   	ins    DWORD PTR es:[edi],dx
 31015d2:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 31015d5:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 31015dc:	72 
 31015dd:	75 6e                	jne    310164d <kShell+0x751>
 31015df:	73 2e                	jae    310160f <kShell+0x713>
 31015e1:	0a 09                	or     cl,BYTE PTR [ecx]
 31015e3:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 31015e6:	61                   	popa   
 31015e7:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 31015eb:	74 69                	je     3101656 <kShell+0x75a>
 31015ed:	6d                   	ins    DWORD PTR es:[edi],dx
 31015ee:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 31015f2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31015f3:	67 72 61             	addr16 jb 3101657 <kShell+0x75b>
 31015f6:	6d                   	ins    DWORD PTR es:[edi],dx
 31015f7:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 31015fa:	61                   	popa   
 31015fb:	72 61                	jb     310165e <kShell+0x762>
 31015fd:	6d                   	ins    DWORD PTR es:[edi],dx
 31015fe:	65                   	gs
 31015ff:	74 65                	je     3101666 <kShell+0x76a>
 3101601:	72 73                	jb     3101676 <kShell+0x77a>
 3101603:	5d                   	pop    ebp
 3101604:	00 1b                	add    BYTE PTR [ebx],bl
 3101606:	5b                   	pop    ebx
 3101607:	32 4a 00             	xor    cl,BYTE PTR [edx+0x0]
 310160a:	25 73 0a 00 3d       	and    eax,0x3d000a73
 310160f:	00 55 73             	add    BYTE PTR [ebp+0x73],dl
 3101612:	61                   	popa   
 3101613:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 3101617:	73 65                	jae    310167e <kShell+0x782>
 3101619:	74 20                	je     310163b <kShell+0x73f>
 310161b:	76 61                	jbe    310167e <kShell+0x782>
 310161d:	72 69                	jb     3101688 <kShell+0x78c>
 310161f:	61                   	popa   
 3101620:	62 6c 65 3d          	bound  ebp,QWORD PTR [ebp+eiz*2+0x3d]
 3101624:	76 61                	jbe    3101687 <kShell+0x78b>
 3101626:	6c                   	ins    BYTE PTR es:[edi],dx
 3101627:	75 65                	jne    310168e <kShell+0x792>
 3101629:	0a 00                	or     al,BYTE PTR [eax]
 310162b:	4c                   	dec    esp
 310162c:	41                   	inc    ecx
 310162d:	53                   	push   ebx
 310162e:	54                   	push   esp
 310162f:	45                   	inc    ebp
 3101630:	58                   	pop    eax
 3101631:	49                   	dec    ecx
 3101632:	54                   	push   esp
 3101633:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 3101636:	72 6f                	jb     31016a7 <kShell+0x7ab>
 3101638:	72 20                	jb     310165a <kShell+0x75e>
 310163a:	65                   	gs
 310163b:	78 65                	js     31016a2 <kShell+0x7a6>
 310163d:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101640:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3101647:	00 6b 65             	add    BYTE PTR [ebx+0x65],ch
 310164a:	78 65                	js     31016b1 <kShell+0x7b5>
 310164c:	63 3a                	arpl   WORD PTR [edx],di
 310164e:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
 3101651:	76 61                	jbe    31016b4 <kShell+0x7b8>
 3101653:	6c                   	ins    BYTE PTR es:[edi],dx
 3101654:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 310165b:	61 
 310165c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310165d:	64 0a 00             	or     al,BYTE PTR fs:[eax]
 3101660:	46                   	inc    esi
 3101661:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101662:	72 6b                	jb     31016cf <kShell+0x7d3>
 3101664:	20 65 72             	and    BYTE PTR [ebp+0x72],ah
 3101667:	72 6f                	jb     31016d8 <kShell+0x7dc>
 3101669:	72 20                	jb     310168b <kShell+0x78f>
 310166b:	25 75 00 65 78       	and    eax,0x78650075
 3101670:	65 63 3a             	arpl   WORD PTR gs:[edx],di
 3101673:	20 43 61             	and    BYTE PTR [ebx+0x61],al
 3101676:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101677:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101678:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101679:	74 20                	je     310169b <kShell+0x79f>
 310167b:	65                   	gs
 310167c:	78 65                	js     31016e3 <kShell+0x7e7>
 310167e:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101681:	65 20 25 73 0a 00 0a 	and    BYTE PTR gs:0xa000a73,ah
 3101688:	25 75 20 74 69       	and    eax,0x69742075
 310168d:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 3101690:	0a 00                	or     al,BYTE PTR [eax]
 3101692:	00 00                	add    BYTE PTR [eax],al
 3101694:	0a 2a                	or     ch,BYTE PTR [edx]
 3101696:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101698:	2a 2a                	sub    ch,BYTE PTR [edx]
 310169a:	2a 2a                	sub    ch,BYTE PTR [edx]
 310169c:	2a 2a                	sub    ch,BYTE PTR [edx]
 310169e:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016a0:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016a2:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016a4:	20 52 45             	and    BYTE PTR [edx+0x45],dl
 31016a7:	50                   	push   eax
 31016a8:	45                   	inc    ebp
 31016a9:	41                   	inc    ecx
 31016aa:	54                   	push   esp
 31016ab:	20 45 58             	and    BYTE PTR [ebp+0x58],al
 31016ae:	45                   	inc    ebp
 31016af:	43                   	inc    ebx
 31016b0:	55                   	push   ebp
 31016b1:	54                   	push   esp
 31016b2:	49                   	dec    ecx
 31016b3:	4f                   	dec    edi
 31016b4:	4e                   	dec    esi
 31016b5:	20 23                	and    BYTE PTR [ebx],ah
 31016b7:	25 75 20 6f 66       	and    eax,0x666f2075
 31016bc:	20 25 75 20 2a 2a    	and    BYTE PTR ds:0x2a2a2075,ah
 31016c2:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016c4:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016c6:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016c8:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016ca:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016cc:	2a 2a                	sub    ch,BYTE PTR [edx]
 31016ce:	2a 0a                	sub    cl,BYTE PTR [edx]
 31016d0:	00 48 65             	add    BYTE PTR [eax+0x65],cl
 31016d3:	6c                   	ins    BYTE PTR es:[edi],dx
 31016d4:	70 3a                	jo     3101710 <kShell+0x814>
 31016d6:	20 25 73 0a 00 09    	and    BYTE PTR ds:0x9000a73,ah
 31016dc:	25 73 3a 20 25       	and    eax,0x25203a73
 31016e1:	73 0a                	jae    31016ed <kShell+0x7f1>
 31016e3:	00 75 68             	add    BYTE PTR [ebp+0x68],dh
 31016e6:	20 6f 68             	and    BYTE PTR [edi+0x68],ch
 31016e9:	21 00                	and    DWORD PTR [eax],eax
 31016eb:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 31016ee:	71 75                	jno    3101765 <kShell+0x869>
 31016f0:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 31016f7:	70 61                	jo     310175a <kShell+0x85e>
 31016f9:	72 61                	jb     310175c <kShell+0x860>
 31016fb:	6d                   	ins    DWORD PTR es:[edi],dx
 31016fc:	65                   	gs
 31016fd:	74 65                	je     3101764 <kShell+0x868>
 31016ff:	72 20                	jb     3101721 <kShell+0x825>
 3101701:	77 68                	ja     310176b <kShell+0x86f>
 3101703:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 310170a:	74 68                	je     3101774 <kShell+0x878>
 310170c:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 3101710:	6d                   	ins    DWORD PTR es:[edi],dx
 3101711:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 3101714:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 3101717:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 310171a:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 310171d:	64                   	fs
 310171e:	73 20                	jae    3101740 <kShell+0x844>
 3101720:	74 6f                	je     3101791 <kShell+0x895>
 3101722:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3101725:	65                   	gs
 3101726:	65                   	gs
 3101727:	70 0a                	jo     3101733 <kShell+0x837>
 3101729:	00 00                	add    BYTE PTR [eax],al
 310172b:	00 63 6c             	add    BYTE PTR [ebx+0x6c],ah
 310172e:	65                   	gs
 310172f:	61                   	popa   
 3101730:	72 00                	jb     3101732 <kShell+0x836>
 3101732:	43                   	inc    ebx
 3101733:	6c                   	ins    BYTE PTR es:[edi],dx
 3101734:	65                   	gs
 3101735:	61                   	popa   
 3101736:	72 20                	jb     3101758 <kShell+0x85c>
 3101738:	74 68                	je     31017a2 <kShell+0x8a6>
 310173a:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 310173e:	72 65                	jb     31017a5 <kShell+0x8a9>
 3101740:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101742:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 3101745:	76 00                	jbe    3101747 <kShell+0x84b>
 3101747:	50                   	push   eax
 3101748:	72 69                	jb     31017b3 <kShell+0x8b7>
 310174a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310174b:	74 20                	je     310176d <kShell+0x871>
 310174d:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 310174f:	76 69                	jbe    31017ba <kShell+0x8be>
 3101751:	72 6f                	jb     31017c2 <kShell+0x8c6>
 3101753:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101754:	6d                   	ins    DWORD PTR es:[edi],dx
 3101755:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101757:	74 00                	je     3101759 <kShell+0x85d>
 3101759:	65                   	gs
 310175a:	78 65                	js     31017c1 <kShell+0x8c5>
 310175c:	63 00                	arpl   WORD PTR [eax],ax
 310175e:	45                   	inc    ebp
 310175f:	78 65                	js     31017c6 <kShell+0x8ca>
 3101761:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101764:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3101768:	70 72                	jo     31017dc <kShell+0x8e0>
 310176a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310176b:	67 72 61             	addr16 jb 31017cf <kShell+0x8d3>
 310176e:	6d                   	ins    DWORD PTR es:[edi],dx
 310176f:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101772:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 3101779:	20 
 310177a:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 310177e:	6c                   	ins    BYTE PTR es:[edi],dx
 310177f:	6c                   	ins    BYTE PTR es:[edi],dx
 3101780:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3101783:	6c                   	ins    BYTE PTR es:[edi],dx
 3101784:	70 00                	jo     3101786 <kShell+0x88a>
 3101786:	47                   	inc    edi
 3101787:	65                   	gs
 3101788:	74 20                	je     31017aa <kShell+0x8ae>
 310178a:	68 65 6c 70 20       	push   0x20706c65
 310178f:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3101793:	73 20                	jae    31017b5 <kShell+0x8b9>
 3101795:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 310179c:	74 69                	je     3101807 <kShell+0x90b>
 310179e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310179f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31017a0:	29 00                	sub    DWORD PTR [eax],eax
 31017a2:	70 77                	jo     310181b <kShell+0x91f>
 31017a4:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 31017a8:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 31017af:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 31017b3:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 31017b7:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 31017bc:	79 00                	jns    31017be <kShell+0x8c2>
 31017be:	72 65                	jb     3101825 <kShell+0x929>
 31017c0:	70 65                	jo     3101827 <kShell+0x92b>
 31017c2:	61                   	popa   
 31017c3:	74 00                	je     31017c5 <kShell+0x8c9>
 31017c5:	52                   	push   edx
 31017c6:	65                   	gs
 31017c7:	70 65                	jo     310182e <kShell+0x932>
 31017c9:	61                   	popa   
 31017ca:	74 20                	je     31017ec <kShell+0x8f0>
 31017cc:	61                   	popa   
 31017cd:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 31017d0:	6d                   	ins    DWORD PTR es:[edi],dx
 31017d1:	6d                   	ins    DWORD PTR es:[edi],dx
 31017d2:	61                   	popa   
 31017d3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31017d4:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 31017d8:	74 69                	je     3101843 <kShell+0x947>
 31017da:	6d                   	ins    DWORD PTR es:[edi],dx
 31017db:	65                   	gs
 31017dc:	73 00                	jae    31017de <kShell+0x8e2>
 31017de:	73 65                	jae    3101845 <kShell+0x949>
 31017e0:	74 00                	je     31017e2 <kShell+0x8e6>
 31017e2:	53                   	push   ebx
 31017e3:	65                   	gs
 31017e4:	74 20                	je     3101806 <kShell+0x90a>
 31017e6:	61                   	popa   
 31017e7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31017e8:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 31017eb:	76 69                	jbe    3101856 <kShell+0x95a>
 31017ed:	72 6f                	jb     310185e <kShell+0x962>
 31017ef:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31017f0:	6d                   	ins    DWORD PTR es:[edi],dx
 31017f1:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31017f3:	74 20                	je     3101815 <kShell+0x919>
 31017f5:	76 61                	jbe    3101858 <kShell+0x95c>
 31017f7:	72 69                	jb     3101862 <kShell+0x966>
 31017f9:	61                   	popa   
 31017fa:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 31017fe:	73 6c                	jae    310186c <kShell+0x970>
 3101800:	65                   	gs
 3101801:	65                   	gs
 3101802:	70 00                	jo     3101804 <kShell+0x908>
 3101804:	53                   	push   ebx
 3101805:	6c                   	ins    BYTE PTR es:[edi],dx
 3101806:	65                   	gs
 3101807:	65                   	gs
 3101808:	70 20                	jo     310182a <kShell+0x92e>
 310180a:	66 6f                	outs   dx,WORD PTR ds:[esi]
 310180c:	72 20                	jb     310182e <kShell+0x932>
 310180e:	78 20                	js     3101830 <kShell+0x934>
 3101810:	73 65                	jae    3101877 <kShell+0x97b>
 3101812:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101815:	64                   	fs
 3101816:	73 00                	jae    3101818 <kShell+0x91c>
 3101818:	74 69                	je     3101883 <kShell+0x987>
 310181a:	6d                   	ins    DWORD PTR es:[edi],dx
 310181b:	65 00 00             	add    BYTE PTR gs:[eax],al
 310181e:	00 00                	add    BYTE PTR [eax],al
 3101820:	54                   	push   esp
 3101821:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 3101828:	72 6f                	jb     3101899 <kShell+0x99d>
 310182a:	67 72 61             	addr16 jb 310188e <kShell+0x992>
 310182d:	6d                   	ins    DWORD PTR es:[edi],dx
 310182e:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 3101831:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 3101838:	72 
 3101839:	75 6e                	jne    31018a9 <kShell+0x9ad>
 310183b:	73 2e                	jae    310186b <kShell+0x96f>
 310183d:	0a 09                	or     cl,BYTE PTR [ecx]
 310183f:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 3101842:	61                   	popa   
 3101843:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 3101847:	74 69                	je     31018b2 <kShell+0x9b6>
 3101849:	6d                   	ins    DWORD PTR es:[edi],dx
 310184a:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 310184e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310184f:	67 72 61             	addr16 jb 31018b3 <kShell+0x9b7>
 3101852:	6d                   	ins    DWORD PTR es:[edi],dx
 3101853:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 3101856:	61                   	popa   
 3101857:	72 61                	jb     31018ba <kShell+0x9be>
 3101859:	6d                   	ins    DWORD PTR es:[edi],dx
 310185a:	65                   	gs
 310185b:	74 65                	je     31018c2 <kShell+0x9c6>
 310185d:	72 73                	jb     31018d2 <kShell+0x9d6>
 310185f:	5d                   	pop    ebp
 3101860:	00 3d 00 25 73 20    	add    BYTE PTR ds:0x20732500,bh
 3101866:	25 73 3e 20 00       	and    eax,0x203e73
 310186b:	25 73 00 20 09       	and    eax,0x9200073
 3101870:	0a 2d 2c 00 6b 53    	or     ch,BYTE PTR ds:0x536b002c
 3101876:	68 65 6c 6c 00       	push   0x6c6c65
 310187b:	43                   	inc    ebx
 310187c:	57                   	push   edi
 310187d:	44                   	inc    esp
 310187e:	00 0a                	add    BYTE PTR [edx],cl
 3101880:	00 1b                	add    BYTE PTR [ebx],bl
 3101882:	5b                   	pop    ebx
 3101883:	31 44 20 1b          	xor    DWORD PTR [eax+eiz*1+0x1b],eax
 3101887:	5b                   	pop    ebx
 3101888:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 310188c:	5b                   	pop    ebx
 310188d:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 3101891:	5b                   	pop    ebx
 3101892:	31 43 00             	xor    DWORD PTR [ebx+0x0],eax
 3101895:	25                   	.byte 0x25
 3101896:	63 00                	arpl   WORD PTR [eax],ax

Disassembly of section .eh_frame:

03101898 <.eh_frame>:
 3101898:	14 00                	adc    al,0x0
 310189a:	00 00                	add    BYTE PTR [eax],al
 310189c:	00 00                	add    BYTE PTR [eax],al
 310189e:	00 00                	add    BYTE PTR [eax],al
 31018a0:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 31018a3:	00 01                	add    BYTE PTR [ecx],al
 31018a5:	7c 08                	jl     31018af <kShell+0x9b3>
 31018a7:	01 1b                	add    DWORD PTR [ebx],ebx
 31018a9:	0c 04                	or     al,0x4
 31018ab:	04 88                	add    al,0x88
 31018ad:	01 00                	add    DWORD PTR [eax],eax
 31018af:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31018b2:	00 00                	add    BYTE PTR [eax],al
 31018b4:	1c 00                	sbb    al,0x0
 31018b6:	00 00                	add    BYTE PTR [eax],al
 31018b8:	48                   	dec    eax
 31018b9:	e7 ff                	out    0xff,eax
 31018bb:	ff 19                	call   FWORD PTR [ecx]
 31018bd:	00 00                	add    BYTE PTR [eax],al
 31018bf:	00 00                	add    BYTE PTR [eax],al
 31018c1:	41                   	inc    ecx
 31018c2:	0e                   	push   cs
 31018c3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31018c9:	55                   	push   ebp
 31018ca:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31018cd:	04 00                	add    al,0x0
 31018cf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31018d2:	00 00                	add    BYTE PTR [eax],al
 31018d4:	3c 00                	cmp    al,0x0
 31018d6:	00 00                	add    BYTE PTR [eax],al
 31018d8:	41                   	inc    ecx
 31018d9:	e7 ff                	out    0xff,eax
 31018db:	ff 4f 00             	dec    DWORD PTR [edi+0x0]
 31018de:	00 00                	add    BYTE PTR [eax],al
 31018e0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31018e3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31018e9:	02 4b c5             	add    cl,BYTE PTR [ebx-0x3b]
 31018ec:	0c 04                	or     al,0x4
 31018ee:	04 00                	add    al,0x0
 31018f0:	1c 00                	sbb    al,0x0
 31018f2:	00 00                	add    BYTE PTR [eax],al
 31018f4:	5c                   	pop    esp
 31018f5:	00 00                	add    BYTE PTR [eax],al
 31018f7:	00 70 e7             	add    BYTE PTR [eax-0x19],dh
 31018fa:	ff                   	(bad)  
 31018fb:	ff 5d 01             	call   FWORD PTR [ebp+0x1]
 31018fe:	00 00                	add    BYTE PTR [eax],al
 3101900:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101903:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101909:	03 59 01             	add    ebx,DWORD PTR [ecx+0x1]
 310190c:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 310190f:	04 1c                	add    al,0x1c
 3101911:	00 00                	add    BYTE PTR [eax],al
 3101913:	00 7c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bh
 3101917:	00 ad e8 ff ff 8b    	add    BYTE PTR [ebp-0x74000018],ch
 310191d:	00 00                	add    BYTE PTR [eax],al
 310191f:	00 00                	add    BYTE PTR [eax],al
 3101921:	41                   	inc    ecx
 3101922:	0e                   	push   cs
 3101923:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101929:	02 87 c5 0c 04 04    	add    al,BYTE PTR [edi+0x4040cc5]
 310192f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101932:	00 00                	add    BYTE PTR [eax],al
 3101934:	9c                   	pushf  
 3101935:	00 00                	add    BYTE PTR [eax],al
 3101937:	00 18                	add    BYTE PTR [eax],bl
 3101939:	e9 ff ff cb 01       	jmp    4dc193d <lCommand+0x1caf7bd>
 310193e:	00 00                	add    BYTE PTR [eax],al
 3101940:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101943:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101949:	03 c7                	add    eax,edi
 310194b:	01 c5                	add    ebp,eax
 310194d:	0c 04                	or     al,0x4
 310194f:	04 1c                	add    al,0x1c
 3101951:	00 00                	add    BYTE PTR [eax],al
 3101953:	00 bc 00 00 00 c3 ea 	add    BYTE PTR [eax+eax*1-0x153d0000],bh
 310195a:	ff                   	(bad)  
 310195b:	ff                   	(bad)  
 310195c:	3e 00 00             	add    BYTE PTR ds:[eax],al
 310195f:	00 00                	add    BYTE PTR [eax],al
 3101961:	41                   	inc    ecx
 3101962:	0e                   	push   cs
 3101963:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101969:	7a c5                	jp     3101930 <kShell+0xa34>
 310196b:	0c 04                	or     al,0x4
 310196d:	04 00                	add    al,0x0
 310196f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101972:	00 00                	add    BYTE PTR [eax],al
 3101974:	dc 00                	fadd   QWORD PTR [eax]
 3101976:	00 00                	add    BYTE PTR [eax],al
 3101978:	e1 ea                	loope  3101964 <kShell+0xa68>
 310197a:	ff                   	(bad)  
 310197b:	ff c7                	inc    edi
 310197d:	00 00                	add    BYTE PTR [eax],al
 310197f:	00 00                	add    BYTE PTR [eax],al
 3101981:	41                   	inc    ecx
 3101982:	0e                   	push   cs
 3101983:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101989:	02 c3                	add    al,bl
 310198b:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 310198e:	04 00                	add    al,0x0
 3101990:	1c 00                	sbb    al,0x0
 3101992:	00 00                	add    BYTE PTR [eax],al
 3101994:	fc                   	cld    
 3101995:	00 00                	add    BYTE PTR [eax],al
 3101997:	00 88 eb ff ff 17    	add    BYTE PTR [eax+0x17ffffeb],cl
 310199d:	00 00                	add    BYTE PTR [eax],al
 310199f:	00 00                	add    BYTE PTR [eax],al
 31019a1:	41                   	inc    ecx
 31019a2:	0e                   	push   cs
 31019a3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31019a9:	53                   	push   ebx
 31019aa:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31019ad:	04 00                	add    al,0x0
 31019af:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31019b2:	00 00                	add    BYTE PTR [eax],al
 31019b4:	1c 01                	sbb    al,0x1
 31019b6:	00 00                	add    BYTE PTR [eax],al
 31019b8:	7f eb                	jg     31019a5 <kShell+0xaa9>
 31019ba:	ff                   	(bad)  
 31019bb:	ff 58 00             	call   FWORD PTR [eax+0x0]
 31019be:	00 00                	add    BYTE PTR [eax],al
 31019c0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31019c3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31019c9:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 31019cd:	04 04                	add    al,0x4
 31019cf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31019d2:	00 00                	add    BYTE PTR [eax],al
 31019d4:	3c 01                	cmp    al,0x1
 31019d6:	00 00                	add    BYTE PTR [eax],al
 31019d8:	b7 eb                	mov    bh,0xeb
 31019da:	ff                   	(bad)  
 31019db:	ff ce                	dec    esi
 31019dd:	00 00                	add    BYTE PTR [eax],al
 31019df:	00 00                	add    BYTE PTR [eax],al
 31019e1:	41                   	inc    ecx
 31019e2:	0e                   	push   cs
 31019e3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31019e9:	02 ca                	add    cl,dl
 31019eb:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31019ee:	04 00                	add    al,0x0
 31019f0:	1c 00                	sbb    al,0x0
 31019f2:	00 00                	add    BYTE PTR [eax],al
 31019f4:	5c                   	pop    esp
 31019f5:	01 00                	add    DWORD PTR [eax],eax
 31019f7:	00 65 ec             	add    BYTE PTR [ebp-0x14],ah
 31019fa:	ff                   	(bad)  
 31019fb:	ff 4e 00             	dec    DWORD PTR [esi+0x0]
 31019fe:	00 00                	add    BYTE PTR [eax],al
 3101a00:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101a03:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a09:	02 4a c5             	add    cl,BYTE PTR [edx-0x3b]
 3101a0c:	0c 04                	or     al,0x4
 3101a0e:	04 00                	add    al,0x0
 3101a10:	20 00                	and    BYTE PTR [eax],al
 3101a12:	00 00                	add    BYTE PTR [eax],al
 3101a14:	7c 01                	jl     3101a17 <kShell+0xb1b>
 3101a16:	00 00                	add    BYTE PTR [eax],al
 3101a18:	93                   	xchg   ebx,eax
 3101a19:	ec                   	in     al,dx
 3101a1a:	ff                   	(bad)  
 3101a1b:	ff 11                	call   DWORD PTR [ecx]
 3101a1d:	01 00                	add    DWORD PTR [eax],eax
 3101a1f:	00 00                	add    BYTE PTR [eax],al
 3101a21:	41                   	inc    ecx
 3101a22:	0e                   	push   cs
 3101a23:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a29:	47                   	inc    edi
 3101a2a:	83 03 03             	add    DWORD PTR [ebx],0x3
 3101a2d:	06                   	push   es
 3101a2e:	01 c5                	add    ebp,eax
 3101a30:	c3                   	ret    
 3101a31:	0c 04                	or     al,0x4
 3101a33:	04 20                	add    al,0x20
 3101a35:	00 00                	add    BYTE PTR [eax],al
 3101a37:	00 a0 01 00 00 80    	add    BYTE PTR [eax-0x7fffffff],ah
 3101a3d:	ed                   	in     eax,dx
 3101a3e:	ff                   	(bad)  
 3101a3f:	ff b4 00 00 00 00 41 	push   DWORD PTR [eax+eax*1+0x41000000]
 3101a46:	0e                   	push   cs
 3101a47:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a4d:	44                   	inc    esp
 3101a4e:	83 03 02             	add    DWORD PTR [ebx],0x2
 3101a51:	ac                   	lods   al,BYTE PTR ds:[esi]
 3101a52:	c5 c3 0c             	(bad)  
 3101a55:	04 04                	add    al,0x4
 3101a57:	00 20                	add    BYTE PTR [eax],ah
 3101a59:	00 00                	add    BYTE PTR [eax],al
 3101a5b:	00 c4                	add    ah,al
 3101a5d:	01 00                	add    DWORD PTR [eax],eax
 3101a5f:	00 10                	add    BYTE PTR [eax],dl
 3101a61:	ee                   	out    dx,al
 3101a62:	ff                   	(bad)  
 3101a63:	ff a9 01 00 00 00    	jmp    FWORD PTR [ecx+0x1]
 3101a69:	41                   	inc    ecx
 3101a6a:	0e                   	push   cs
 3101a6b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a71:	44                   	inc    esp
 3101a72:	83 03 03             	add    DWORD PTR [ebx],0x3
 3101a75:	a1 01 c5 c3 0c       	mov    eax,ds:0xcc3c501
 3101a7a:	04 04                	add    al,0x4
 3101a7c:	1c 00                	sbb    al,0x0
 3101a7e:	00 00                	add    BYTE PTR [eax],al
 3101a80:	e8 01 00 00 95       	call   98101a86 <lCommand+0x94fef906>
 3101a85:	ef                   	out    dx,eax
 3101a86:	ff                   	(bad)  
 3101a87:	ff 69 00             	jmp    FWORD PTR [ecx+0x0]
 3101a8a:	00 00                	add    BYTE PTR [eax],al
 3101a8c:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101a8f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101a95:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3101a98:	0c 04                	or     al,0x4
 3101a9a:	04 00                	add    al,0x0
 3101a9c:	1c 00                	sbb    al,0x0
 3101a9e:	00 00                	add    BYTE PTR [eax],al
 3101aa0:	08 02                	or     BYTE PTR [edx],al
 3101aa2:	00 00                	add    BYTE PTR [eax],al
 3101aa4:	de ef                	fsubp  st(7),st
 3101aa6:	ff                   	(bad)  
 3101aa7:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 3101aad:	41                   	inc    ecx
 3101aae:	0e                   	push   cs
 3101aaf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101ab5:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 3101abb:	04 20                	add    al,0x20
 3101abd:	00 00                	add    BYTE PTR [eax],al
 3101abf:	00 28                	add    BYTE PTR [eax],ch
 3101ac1:	02 00                	add    al,BYTE PTR [eax]
 3101ac3:	00 4c f2 ff          	add    BYTE PTR [edx+esi*8-0x1],cl
 3101ac7:	ff 76 00             	push   DWORD PTR [esi+0x0]
 3101aca:	00 00                	add    BYTE PTR [eax],al
 3101acc:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101acf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101ad5:	44                   	inc    esp
 3101ad6:	83 03 02             	add    DWORD PTR [ebx],0x2
 3101ad9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101ada:	c5 c3 0c             	(bad)  
 3101add:	04 04                	add    al,0x4
 3101adf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101ae2:	00 00                	add    BYTE PTR [eax],al
 3101ae4:	4c                   	dec    esp
 3101ae5:	02 00                	add    al,BYTE PTR [eax]
 3101ae7:	00 9e f2 ff ff 3d    	add    BYTE PTR [esi+0x3dfffff2],bl
 3101aed:	00 00                	add    BYTE PTR [eax],al
 3101aef:	00 00                	add    BYTE PTR [eax],al
 3101af1:	41                   	inc    ecx
 3101af2:	0e                   	push   cs
 3101af3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101af9:	79 c5                	jns    3101ac0 <kShell+0xbc4>
 3101afb:	0c 04                	or     al,0x4
 3101afd:	04 00                	add    al,0x0
 3101aff:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b02:	00 00                	add    BYTE PTR [eax],al
 3101b04:	6c                   	ins    BYTE PTR es:[edi],dx
 3101b05:	02 00                	add    al,BYTE PTR [eax]
 3101b07:	00 bb f2 ff ff 8c    	add    BYTE PTR [ebx-0x7300000e],bh
 3101b0d:	00 00                	add    BYTE PTR [eax],al
 3101b0f:	00 00                	add    BYTE PTR [eax],al
 3101b11:	41                   	inc    ecx
 3101b12:	0e                   	push   cs
 3101b13:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b19:	02 88 c5 0c 04 04    	add    cl,BYTE PTR [eax+0x4040cc5]
 3101b1f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b22:	00 00                	add    BYTE PTR [eax],al
 3101b24:	8c 02                	mov    WORD PTR [edx],es
 3101b26:	00 00                	add    BYTE PTR [eax],al
 3101b28:	27                   	daa    
 3101b29:	f3 ff                	repz (bad) 
 3101b2b:	ff 2e                	jmp    FWORD PTR [esi]
 3101b2d:	00 00                	add    BYTE PTR [eax],al
 3101b2f:	00 00                	add    BYTE PTR [eax],al
 3101b31:	41                   	inc    ecx
 3101b32:	0e                   	push   cs
 3101b33:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b39:	6a c5                	push   0xffffffc5
 3101b3b:	0c 04                	or     al,0x4
 3101b3d:	04 00                	add    al,0x0
 3101b3f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b42:	00 00                	add    BYTE PTR [eax],al
 3101b44:	ac                   	lods   al,BYTE PTR ds:[esi]
 3101b45:	02 00                	add    al,BYTE PTR [eax]
 3101b47:	00 35 f3 ff ff 23    	add    BYTE PTR ds:0x23fffff3,dh
 3101b4d:	00 00                	add    BYTE PTR [eax],al
 3101b4f:	00 00                	add    BYTE PTR [eax],al
 3101b51:	41                   	inc    ecx
 3101b52:	0e                   	push   cs
 3101b53:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b59:	5f                   	pop    edi
 3101b5a:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101b5d:	04 00                	add    al,0x0
 3101b5f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b62:	00 00                	add    BYTE PTR [eax],al
 3101b64:	cc                   	int3   
 3101b65:	02 00                	add    al,BYTE PTR [eax]
 3101b67:	00 38                	add    BYTE PTR [eax],bh
 3101b69:	f3 ff                	repz (bad) 
 3101b6b:	ff 26                	jmp    DWORD PTR [esi]
 3101b6d:	00 00                	add    BYTE PTR [eax],al
 3101b6f:	00 00                	add    BYTE PTR [eax],al
 3101b71:	41                   	inc    ecx
 3101b72:	0e                   	push   cs
 3101b73:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b79:	62                   	(bad)  
 3101b7a:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101b7d:	04 00                	add    al,0x0
 3101b7f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101b82:	00 00                	add    BYTE PTR [eax],al
 3101b84:	ec                   	in     al,dx
 3101b85:	02 00                	add    al,BYTE PTR [eax]
 3101b87:	00 3e                	add    BYTE PTR [esi],bh
 3101b89:	f3 ff                	repz (bad) 
 3101b8b:	ff 16                	call   DWORD PTR [esi]
 3101b8d:	00 00                	add    BYTE PTR [eax],al
 3101b8f:	00 00                	add    BYTE PTR [eax],al
 3101b91:	41                   	inc    ecx
 3101b92:	0e                   	push   cs
 3101b93:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101b99:	52                   	push   edx
 3101b9a:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101b9d:	04 00                	add    al,0x0
 3101b9f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101ba2:	00 00                	add    BYTE PTR [eax],al
 3101ba4:	0c 03                	or     al,0x3
 3101ba6:	00 00                	add    BYTE PTR [eax],al
 3101ba8:	34 f3                	xor    al,0xf3
 3101baa:	ff                   	(bad)  
 3101bab:	ff 20                	jmp    DWORD PTR [eax]
 3101bad:	00 00                	add    BYTE PTR [eax],al
 3101baf:	00 00                	add    BYTE PTR [eax],al
 3101bb1:	41                   	inc    ecx
 3101bb2:	0e                   	push   cs
 3101bb3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101bb9:	5c                   	pop    esp
 3101bba:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101bbd:	04 00                	add    al,0x0
 3101bbf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101bc2:	00 00                	add    BYTE PTR [eax],al
 3101bc4:	2c 03                	sub    al,0x3
 3101bc6:	00 00                	add    BYTE PTR [eax],al
 3101bc8:	34 f3                	xor    al,0xf3
 3101bca:	ff                   	(bad)  
 3101bcb:	ff e4                	jmp    esp
 3101bcd:	03 00                	add    eax,DWORD PTR [eax]
 3101bcf:	00 00                	add    BYTE PTR [eax],al
 3101bd1:	41                   	inc    ecx
 3101bd2:	0e                   	push   cs
 3101bd3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101bd9:	03 e0                	add    esp,eax
 3101bdb:	03 c5                	add    eax,ebp
 3101bdd:	0c 04                	or     al,0x4
 3101bdf:	04                   	.byte 0x4

Disassembly of section .interp:

03101be0 <.interp>:
 3101be0:	2f                   	das    
 3101be1:	6c                   	ins    BYTE PTR es:[edi],dx
 3101be2:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3101be9:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3101bf0:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03101bf4 <.dynsym>:
	...
 3101c04:	09 00                	or     DWORD PTR [eax],eax
	...
 3101c0e:	00 00                	add    BYTE PTR [eax],al
 3101c10:	12 00                	adc    al,BYTE PTR [eax]
 3101c12:	00 00                	add    BYTE PTR [eax],al
 3101c14:	10 00                	adc    BYTE PTR [eax],al
	...
 3101c1e:	00 00                	add    BYTE PTR [eax],al
 3101c20:	12 00                	adc    al,BYTE PTR [eax]
 3101c22:	00 00                	add    BYTE PTR [eax],al
 3101c24:	18 00                	sbb    BYTE PTR [eax],al
	...
 3101c2e:	00 00                	add    BYTE PTR [eax],al
 3101c30:	12 00                	adc    al,BYTE PTR [eax]
 3101c32:	00 00                	add    BYTE PTR [eax],al
 3101c34:	1e                   	push   ds
	...
 3101c3d:	00 00                	add    BYTE PTR [eax],al
 3101c3f:	00 12                	add    BYTE PTR [edx],dl
 3101c41:	00 00                	add    BYTE PTR [eax],al
 3101c43:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
 3101c49:	00 00                	add    BYTE PTR [eax],al
 3101c4b:	00 00                	add    BYTE PTR [eax],al
 3101c4d:	00 00                	add    BYTE PTR [eax],al
 3101c4f:	00 12                	add    BYTE PTR [edx],dl
 3101c51:	00 00                	add    BYTE PTR [eax],al
 3101c53:	00 2e                	add    BYTE PTR [esi],ch
	...
 3101c5d:	00 00                	add    BYTE PTR [eax],al
 3101c5f:	00 12                	add    BYTE PTR [edx],dl
 3101c61:	00 00                	add    BYTE PTR [eax],al
 3101c63:	00 35 00 00 00 00    	add    BYTE PTR ds:0x0,dh
 3101c69:	00 00                	add    BYTE PTR [eax],al
 3101c6b:	00 00                	add    BYTE PTR [eax],al
 3101c6d:	00 00                	add    BYTE PTR [eax],al
 3101c6f:	00 12                	add    BYTE PTR [edx],dl
 3101c71:	00 00                	add    BYTE PTR [eax],al
 3101c73:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
	...
 3101c7e:	00 00                	add    BYTE PTR [eax],al
 3101c80:	12 00                	adc    al,BYTE PTR [eax]
 3101c82:	00 00                	add    BYTE PTR [eax],al
 3101c84:	43                   	inc    ebx
	...
 3101c8d:	00 00                	add    BYTE PTR [eax],al
 3101c8f:	00 12                	add    BYTE PTR [edx],dl
 3101c91:	00 00                	add    BYTE PTR [eax],al
 3101c93:	00 49 00             	add    BYTE PTR [ecx+0x0],cl
	...
 3101c9e:	00 00                	add    BYTE PTR [eax],al
 3101ca0:	12 00                	adc    al,BYTE PTR [eax]
 3101ca2:	00 00                	add    BYTE PTR [eax],al
 3101ca4:	57                   	push   edi
	...
 3101cad:	00 00                	add    BYTE PTR [eax],al
 3101caf:	00 12                	add    BYTE PTR [edx],dl
 3101cb1:	00 00                	add    BYTE PTR [eax],al
 3101cb3:	00 5f 00             	add    BYTE PTR [edi+0x0],bl
	...
 3101cbe:	00 00                	add    BYTE PTR [eax],al
 3101cc0:	12 00                	adc    al,BYTE PTR [eax]
 3101cc2:	00 00                	add    BYTE PTR [eax],al
 3101cc4:	64 00 00             	add    BYTE PTR fs:[eax],al
	...
 3101ccf:	00 12                	add    BYTE PTR [edx],dl
 3101cd1:	00 00                	add    BYTE PTR [eax],al
 3101cd3:	00 6d 00             	add    BYTE PTR [ebp+0x0],ch
	...
 3101cde:	00 00                	add    BYTE PTR [eax],al
 3101ce0:	12 00                	adc    al,BYTE PTR [eax]
 3101ce2:	00 00                	add    BYTE PTR [eax],al
 3101ce4:	72 00                	jb     3101ce6 <kShell+0xdea>
	...
 3101cee:	00 00                	add    BYTE PTR [eax],al
 3101cf0:	12 00                	adc    al,BYTE PTR [eax]
 3101cf2:	00 00                	add    BYTE PTR [eax],al
 3101cf4:	79 00                	jns    3101cf6 <kShell+0xdfa>
	...
 3101cfe:	00 00                	add    BYTE PTR [eax],al
 3101d00:	12 00                	adc    al,BYTE PTR [eax]
 3101d02:	00 00                	add    BYTE PTR [eax],al
 3101d04:	7e 00                	jle    3101d06 <kShell+0xe0a>
	...
 3101d0e:	00 00                	add    BYTE PTR [eax],al
 3101d10:	12 00                	adc    al,BYTE PTR [eax]
 3101d12:	00 00                	add    BYTE PTR [eax],al
 3101d14:	86 00                	xchg   BYTE PTR [eax],al
	...
 3101d1e:	00 00                	add    BYTE PTR [eax],al
 3101d20:	12 00                	adc    al,BYTE PTR [eax]
 3101d22:	00 00                	add    BYTE PTR [eax],al
 3101d24:	8e 00                	mov    es,WORD PTR [eax]
	...
 3101d2e:	00 00                	add    BYTE PTR [eax],al
 3101d30:	12 00                	adc    al,BYTE PTR [eax]
 3101d32:	00 00                	add    BYTE PTR [eax],al
 3101d34:	95                   	xchg   ebp,eax
	...
 3101d3d:	00 00                	add    BYTE PTR [eax],al
 3101d3f:	00 12                	add    BYTE PTR [edx],dl
 3101d41:	00 00                	add    BYTE PTR [eax],al
 3101d43:	00 9c 00 00 00 00 00 	add    BYTE PTR [eax+eax*1+0x0],bl
 3101d4a:	00 00                	add    BYTE PTR [eax],al
 3101d4c:	00 00                	add    BYTE PTR [eax],al
 3101d4e:	00 00                	add    BYTE PTR [eax],al
 3101d50:	12 00                	adc    al,BYTE PTR [eax]
 3101d52:	00 00                	add    BYTE PTR [eax],al
 3101d54:	a1 00 00 00 00       	mov    eax,ds:0x0
 3101d59:	00 00                	add    BYTE PTR [eax],al
 3101d5b:	00 00                	add    BYTE PTR [eax],al
 3101d5d:	00 00                	add    BYTE PTR [eax],al
 3101d5f:	00 12                	add    BYTE PTR [edx],dl
 3101d61:	00 00                	add    BYTE PTR [eax],al
 3101d63:	00 a8 00 00 00 00    	add    BYTE PTR [eax+0x0],ch
 3101d69:	00 00                	add    BYTE PTR [eax],al
 3101d6b:	00 00                	add    BYTE PTR [eax],al
 3101d6d:	00 00                	add    BYTE PTR [eax],al
 3101d6f:	00 12                	add    BYTE PTR [edx],dl
 3101d71:	00 00                	add    BYTE PTR [eax],al
 3101d73:	00 b0 00 00 00 00    	add    BYTE PTR [eax+0x0],dh
 3101d79:	00 00                	add    BYTE PTR [eax],al
 3101d7b:	00 00                	add    BYTE PTR [eax],al
 3101d7d:	00 00                	add    BYTE PTR [eax],al
 3101d7f:	00 12                	add    BYTE PTR [edx],dl
 3101d81:	00 00                	add    BYTE PTR [eax],al
 3101d83:	00 b7 00 00 00 00    	add    BYTE PTR [edi+0x0],dh
 3101d89:	00 00                	add    BYTE PTR [eax],al
 3101d8b:	00 00                	add    BYTE PTR [eax],al
 3101d8d:	00 00                	add    BYTE PTR [eax],al
 3101d8f:	00 12                	add    BYTE PTR [edx],dl
 3101d91:	00 00                	add    BYTE PTR [eax],al
 3101d93:	00 c4                	add    ah,al
	...
 3101d9d:	00 00                	add    BYTE PTR [eax],al
 3101d9f:	00 12                	add    BYTE PTR [edx],dl
 3101da1:	00 00                	add    BYTE PTR [eax],al
 3101da3:	00 c9                	add    cl,cl
	...
 3101dad:	00 00                	add    BYTE PTR [eax],al
 3101daf:	00 12                	add    BYTE PTR [edx],dl
 3101db1:	00 00                	add    BYTE PTR [eax],al
 3101db3:	00 ce                	add    dh,cl
	...
 3101dbd:	00 00                	add    BYTE PTR [eax],al
 3101dbf:	00 12                	add    BYTE PTR [edx],dl
 3101dc1:	00 00                	add    BYTE PTR [eax],al
 3101dc3:	00 d5                	add    ch,dl
	...
 3101dcd:	00 00                	add    BYTE PTR [eax],al
 3101dcf:	00 12                	add    BYTE PTR [edx],dl
 3101dd1:	00 00                	add    BYTE PTR [eax],al
 3101dd3:	00 db                	add    bl,bl
	...
 3101ddd:	00 00                	add    BYTE PTR [eax],al
 3101ddf:	00 12                	add    BYTE PTR [edx],dl
 3101de1:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

03101de4 <.dynstr>:
 3101de4:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3101de8:	63 2e                	arpl   WORD PTR [esi],bp
 3101dea:	73 6f                	jae    3101e5b <kShell+0xf5f>
 3101dec:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101def:	72 63                	jb     3101e54 <kShell+0xf58>
 3101df1:	70 79                	jo     3101e6c <kShell+0xf70>
 3101df3:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 3101df6:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3101dfd:	72 
 3101dfe:	69 6e 74 00 70 72 69 	imul   ebp,DWORD PTR [esi+0x74],0x69727000
 3101e05:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101e06:	74 66                	je     3101e6e <kShell+0xf72>
 3101e08:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 3101e0b:	73 65                	jae    3101e72 <kShell+0xf76>
 3101e0d:	74 52                	je     3101e61 <kShell+0xf65>
 3101e0f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e10:	77 00                	ja     3101e12 <kShell+0xf16>
 3101e12:	67                   	addr16
 3101e13:	65                   	gs
 3101e14:	74 65                	je     3101e7b <kShell+0xf7f>
 3101e16:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101e17:	76 00                	jbe    3101e19 <kShell+0xf1d>
 3101e19:	6d                   	ins    DWORD PTR es:[edi],dx
 3101e1a:	65                   	gs
 3101e1b:	6d                   	ins    DWORD PTR es:[edi],dx
 3101e1c:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3101e1f:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 3101e22:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e23:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e24:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e25:	63 00                	arpl   WORD PTR [eax],ax
 3101e27:	73 6c                	jae    3101e95 <kShell+0xf99>
 3101e29:	65                   	gs
 3101e2a:	65                   	gs
 3101e2b:	70 00                	jo     3101e2d <kShell+0xf31>
 3101e2d:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 3101e30:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e31:	69 6e 65 54 6f 41 72 	imul   ebp,DWORD PTR [esi+0x65],0x72416f54
 3101e38:	67 76 00             	addr16 jbe 3101e3b <kShell+0xf3f>
 3101e3b:	73 74                	jae    3101eb1 <kShell+0xfb5>
 3101e3d:	72 74                	jb     3101eb3 <kShell+0xfb7>
 3101e3f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e40:	75 6c                	jne    3101eae <kShell+0xfb2>
 3101e42:	00 69 74             	add    BYTE PTR [ecx+0x74],ch
 3101e45:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e46:	61                   	popa   
 3101e47:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3101e4a:	74 74                	je     3101ec0 <kShell+0xfc4>
 3101e4c:	69 63 6b 73 00 65 78 	imul   esp,DWORD PTR [ebx+0x6b],0x78650073
 3101e53:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 3101e56:	73 74                	jae    3101ecc <kShell+0xfd0>
 3101e58:	72 73                	jb     3101ecd <kShell+0xfd1>
 3101e5a:	74 72                	je     3101ece <kShell+0xfd2>
 3101e5c:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 3101e5f:	61                   	popa   
 3101e60:	64 00 73 74          	add    BYTE PTR fs:[ebx+0x74],dh
 3101e64:	72 6e                	jb     3101ed4 <kShell+0xfd8>
 3101e66:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 3101e69:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101e6c:	72 6e                	jb     3101edc <kShell+0xfe0>
 3101e6e:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3101e71:	00 73 65             	add    BYTE PTR [ebx+0x65],dh
 3101e74:	74 65                	je     3101edb <kShell+0xfdf>
 3101e76:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101e77:	76 00                	jbe    3101e79 <kShell+0xf7d>
 3101e79:	73 74                	jae    3101eef <kShell+0xff3>
 3101e7b:	72 74                	jb     3101ef1 <kShell+0xff5>
 3101e7d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e7e:	6b 00 66             	imul   eax,DWORD PTR [eax],0x66
 3101e81:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e82:	72 6b                	jb     3101eef <kShell+0xff3>
 3101e84:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 3101e87:	6d                   	ins    DWORD PTR es:[edi],dx
 3101e88:	73 65                	jae    3101eef <kShell+0xff3>
 3101e8a:	74 00                	je     3101e8c <kShell+0xf90>
 3101e8c:	73 74                	jae    3101f02 <kShell+0x1006>
 3101e8e:	72 74                	jb     3101f04 <kShell+0x1008>
 3101e90:	72 69                	jb     3101efb <kShell+0xfff>
 3101e92:	6d                   	ins    DWORD PTR es:[edi],dx
 3101e93:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3101e96:	74 63                	je     3101efb <kShell+0xfff>
 3101e98:	77 64                	ja     3101efe <kShell+0x1002>
 3101e9a:	00 6d 6f             	add    BYTE PTR [ebp+0x6f],ch
 3101e9d:	64 69 66 79 53 69 67 	imul   esp,DWORD PTR fs:[esi+0x79],0x6e676953
 3101ea4:	6e 
 3101ea5:	61                   	popa   
 3101ea6:	6c                   	ins    BYTE PTR es:[edi],dx
 3101ea7:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101eaa:	69 74 00 61 74 6f 69 	imul   esi,DWORD PTR [eax+eax*1+0x61],0x696f74
 3101eb1:	00 
 3101eb2:	73 74                	jae    3101f28 <kShell+0x102c>
 3101eb4:	72 6c                	jb     3101f22 <kShell+0x1026>
 3101eb6:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101eb8:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101ebb:	65 63 61 00          	arpl   WORD PTR gs:[ecx+0x0],sp
 3101ebf:	66                   	data16
 3101ec0:	72 65                	jb     3101f27 <kShell+0x102b>
 3101ec2:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 3101ec5:	2e                   	cs
 3101ec6:	2f                   	das    
 3101ec7:	6c                   	ins    BYTE PTR es:[edi],dx
 3101ec8:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3101ecf:	4f                   	dec    edi
 3101ed0:	53                   	push   ebx
 3101ed1:	2f                   	das    
 3101ed2:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3101ed9:	62 
 3101eda:	75 67                	jne    3101f43 <kShell+0x1047>
 3101edc:	2f                   	das    
 3101edd:	47                   	inc    edi
 3101ede:	4e                   	dec    esi
 3101edf:	55                   	push   ebp
 3101ee0:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3101ee5:	78 00                	js     3101ee7 <kShell+0xfeb>

Disassembly of section .hash:

03101ee8 <.hash>:
 3101ee8:	11 00                	adc    DWORD PTR [eax],eax
 3101eea:	00 00                	add    BYTE PTR [eax],al
 3101eec:	1f                   	pop    ds
 3101eed:	00 00                	add    BYTE PTR [eax],al
 3101eef:	00 0f                	add    BYTE PTR [edi],cl
 3101ef1:	00 00                	add    BYTE PTR [eax],al
 3101ef3:	00 00                	add    BYTE PTR [eax],al
 3101ef5:	00 00                	add    BYTE PTR [eax],al
 3101ef7:	00 15 00 00 00 0b    	add    BYTE PTR ds:0xb000000,dl
 3101efd:	00 00                	add    BYTE PTR [eax],al
 3101eff:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101f02:	00 00                	add    BYTE PTR [eax],al
 3101f04:	00 00                	add    BYTE PTR [eax],al
 3101f06:	00 00                	add    BYTE PTR [eax],al
 3101f08:	12 00                	adc    al,BYTE PTR [eax]
 3101f0a:	00 00                	add    BYTE PTR [eax],al
 3101f0c:	10 00                	adc    BYTE PTR [eax],al
 3101f0e:	00 00                	add    BYTE PTR [eax],al
 3101f10:	07                   	pop    es
 3101f11:	00 00                	add    BYTE PTR [eax],al
 3101f13:	00 00                	add    BYTE PTR [eax],al
 3101f15:	00 00                	add    BYTE PTR [eax],al
 3101f17:	00 17                	add    BYTE PTR [edi],dl
 3101f19:	00 00                	add    BYTE PTR [eax],al
 3101f1b:	00 19                	add    BYTE PTR [ecx],bl
 3101f1d:	00 00                	add    BYTE PTR [eax],al
 3101f1f:	00 1e                	add    BYTE PTR [esi],bl
 3101f21:	00 00                	add    BYTE PTR [eax],al
 3101f23:	00 1b                	add    BYTE PTR [ebx],bl
 3101f25:	00 00                	add    BYTE PTR [eax],al
 3101f27:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 3101f2a:	00 00                	add    BYTE PTR [eax],al
 3101f2c:	05 00 00 00 14       	add    eax,0x14000000
	...
 3101f4d:	00 00                	add    BYTE PTR [eax],al
 3101f4f:	00 06                	add    BYTE PTR [esi],al
 3101f51:	00 00                	add    BYTE PTR [eax],al
 3101f53:	00 04 00             	add    BYTE PTR [eax+eax*1],al
	...
 3101f66:	00 00                	add    BYTE PTR [eax],al
 3101f68:	09 00                	or     DWORD PTR [eax],eax
 3101f6a:	00 00                	add    BYTE PTR [eax],al
 3101f6c:	0d 00 00 00 0e       	or     eax,0xe000000
 3101f71:	00 00                	add    BYTE PTR [eax],al
 3101f73:	00 03                	add    BYTE PTR [ebx],al
 3101f75:	00 00                	add    BYTE PTR [eax],al
 3101f77:	00 00                	add    BYTE PTR [eax],al
 3101f79:	00 00                	add    BYTE PTR [eax],al
 3101f7b:	00 0a                	add    BYTE PTR [edx],cl
 3101f7d:	00 00                	add    BYTE PTR [eax],al
 3101f7f:	00 02                	add    BYTE PTR [edx],al
	...
 3101f89:	00 00                	add    BYTE PTR [eax],al
 3101f8b:	00 13                	add    BYTE PTR [ebx],dl
 3101f8d:	00 00                	add    BYTE PTR [eax],al
 3101f8f:	00 08                	add    BYTE PTR [eax],cl
 3101f91:	00 00                	add    BYTE PTR [eax],al
 3101f93:	00 16                	add    BYTE PTR [esi],dl
 3101f95:	00 00                	add    BYTE PTR [eax],al
 3101f97:	00 11                	add    BYTE PTR [ecx],dl
 3101f99:	00 00                	add    BYTE PTR [eax],al
 3101f9b:	00 18                	add    BYTE PTR [eax],bl
 3101f9d:	00 00                	add    BYTE PTR [eax],al
 3101f9f:	00 1a                	add    BYTE PTR [edx],bl
 3101fa1:	00 00                	add    BYTE PTR [eax],al
 3101fa3:	00 00                	add    BYTE PTR [eax],al
 3101fa5:	00 00                	add    BYTE PTR [eax],al
 3101fa7:	00 01                	add    BYTE PTR [ecx],al
 3101fa9:	00 00                	add    BYTE PTR [eax],al
 3101fab:	00                   	.byte 0x0
 3101fac:	1d                   	.byte 0x1d
 3101fad:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03101fb0 <.eh_frame>:
 3101fb0:	14 00                	adc    al,0x0
 3101fb2:	00 00                	add    BYTE PTR [eax],al
 3101fb4:	00 00                	add    BYTE PTR [eax],al
 3101fb6:	00 00                	add    BYTE PTR [eax],al
 3101fb8:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3101fbb:	00 01                	add    BYTE PTR [ecx],al
 3101fbd:	7c 08                	jl     3101fc7 <kShell+0x10cb>
 3101fbf:	01 1b                	add    DWORD PTR [ebx],ebx
 3101fc1:	0c 04                	or     al,0x4
 3101fc3:	04 88                	add    al,0x88
 3101fc5:	01 00                	add    DWORD PTR [eax],eax
 3101fc7:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3101fca:	00 00                	add    BYTE PTR [eax],al
 3101fcc:	1c 00                	sbb    al,0x0
 3101fce:	00 00                	add    BYTE PTR [eax],al
 3101fd0:	10 f3                	adc    bl,dh
 3101fd2:	ff                   	(bad)  
 3101fd3:	ff f0                	push   eax
 3101fd5:	01 00                	add    DWORD PTR [eax],eax
 3101fd7:	00 00                	add    BYTE PTR [eax],al
 3101fd9:	0e                   	push   cs
 3101fda:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3101fdd:	0c 4a                	or     al,0x4a
 3101fdf:	0f 0b                	ud2    
 3101fe1:	74 04                	je     3101fe7 <kShell+0x10eb>
 3101fe3:	78 00                	js     3101fe5 <kShell+0x10e9>
 3101fe5:	3f                   	aas    
 3101fe6:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3101fe8:	2a 32                	sub    dh,BYTE PTR [edx]
 3101fea:	24 22                	and    al,0x22
 3101fec:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03101ff0 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3101ff0:	01 1b                	add    DWORD PTR [ebx],ebx
 3101ff2:	03 3b                	add    edi,DWORD PTR [ebx]
 3101ff4:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 3101ff5:	f8                   	clc    
 3101ff6:	ff                   	(bad)  
 3101ff7:	ff 19                	call   FWORD PTR [ecx]
 3101ff9:	00 00                	add    BYTE PTR [eax],al
 3101ffb:	00 10                	add    BYTE PTR [eax],dl
 3101ffd:	e0 ff                	loopne 3101ffe <__GNU_EH_FRAME_HDR+0xe>
 3101fff:	ff c0                	inc    eax
 3102001:	f8                   	clc    
 3102002:	ff                   	(bad)  
 3102003:	ff 29                	jmp    FWORD PTR [ecx]
 3102005:	e0 ff                	loopne 3102006 <__GNU_EH_FRAME_HDR+0x16>
 3102007:	ff e0                	jmp    eax
 3102009:	f8                   	clc    
 310200a:	ff                   	(bad)  
 310200b:	ff                   	(bad)  
 310200c:	78 e0                	js     3101fee <kShell+0x10f2>
 310200e:	ff                   	(bad)  
 310200f:	ff 00                	inc    DWORD PTR [eax]
 3102011:	f9                   	stc    
 3102012:	ff                   	(bad)  
 3102013:	ff d5                	call   ebp
 3102015:	e1 ff                	loope  3102016 <__GNU_EH_FRAME_HDR+0x26>
 3102017:	ff 20                	jmp    DWORD PTR [eax]
 3102019:	f9                   	stc    
 310201a:	ff                   	(bad)  
 310201b:	ff 60 e2             	jmp    DWORD PTR [eax-0x1e]
 310201e:	ff                   	(bad)  
 310201f:	ff 40 f9             	inc    DWORD PTR [eax-0x7]
 3102022:	ff                   	(bad)  
 3102023:	ff 2b                	jmp    FWORD PTR [ebx]
 3102025:	e4 ff                	in     al,0xff
 3102027:	ff 60 f9             	jmp    DWORD PTR [eax-0x7]
 310202a:	ff                   	(bad)  
 310202b:	ff 69 e4             	jmp    FWORD PTR [ecx-0x1c]
 310202e:	ff                   	(bad)  
 310202f:	ff 80 f9 ff ff 30    	inc    DWORD PTR [eax+0x30fffff9]
 3102035:	e5 ff                	in     eax,0xff
 3102037:	ff a0 f9 ff ff 47    	jmp    DWORD PTR [eax+0x47fffff9]
 310203d:	e5 ff                	in     eax,0xff
 310203f:	ff c0                	inc    eax
 3102041:	f9                   	stc    
 3102042:	ff                   	(bad)  
 3102043:	ff 9f e5 ff ff e0    	call   FWORD PTR [edi-0x1f00001b]
 3102049:	f9                   	stc    
 310204a:	ff                   	(bad)  
 310204b:	ff 6d e6             	jmp    FWORD PTR [ebp-0x1a]
 310204e:	ff                   	(bad)  
 310204f:	ff 00                	inc    DWORD PTR [eax]
 3102051:	fa                   	cli    
 3102052:	ff                   	(bad)  
 3102053:	ff                   	(bad)  
 3102054:	bb e6 ff ff 20       	mov    ebx,0x20ffffe6
 3102059:	fa                   	cli    
 310205a:	ff                   	(bad)  
 310205b:	ff cc                	dec    esp
 310205d:	e7 ff                	out    0xff,eax
 310205f:	ff 44 fa ff          	inc    DWORD PTR [edx+edi*8-0x1]
 3102063:	ff 80 e8 ff ff 68    	inc    DWORD PTR [eax+0x68ffffe8]
 3102069:	fa                   	cli    
 310206a:	ff                   	(bad)  
 310206b:	ff 29                	jmp    FWORD PTR [ecx]
 310206d:	ea ff ff 8c fa ff ff 	jmp    0xffff:0xfa8cffff
 3102074:	92                   	xchg   edx,eax
 3102075:	ea ff ff ac fa ff ff 	jmp    0xffff:0xfaacffff
 310207c:	20 ed                	and    ch,ch
 310207e:	ff                   	(bad)  
 310207f:	ff cc                	dec    esp
 3102081:	fa                   	cli    
 3102082:	ff                   	(bad)  
 3102083:	ff 96 ed ff ff f0    	call   DWORD PTR [esi-0xf000013]
 3102089:	fa                   	cli    
 310208a:	ff                   	(bad)  
 310208b:	ff d3                	call   ebx
 310208d:	ed                   	in     eax,dx
 310208e:	ff                   	(bad)  
 310208f:	ff 10                	call   DWORD PTR [eax]
 3102091:	fb                   	sti    
 3102092:	ff                   	(bad)  
 3102093:	ff 5f ee             	call   FWORD PTR [edi-0x12]
 3102096:	ff                   	(bad)  
 3102097:	ff 30                	push   DWORD PTR [eax]
 3102099:	fb                   	sti    
 310209a:	ff                   	(bad)  
 310209b:	ff 8d ee ff ff 50    	dec    DWORD PTR [ebp+0x50ffffee]
 31020a1:	fb                   	sti    
 31020a2:	ff                   	(bad)  
 31020a3:	ff b0 ee ff ff 70    	push   DWORD PTR [eax+0x70ffffee]
 31020a9:	fb                   	sti    
 31020aa:	ff                   	(bad)  
 31020ab:	ff d6                	call   esi
 31020ad:	ee                   	out    dx,al
 31020ae:	ff                   	(bad)  
 31020af:	ff 90 fb ff ff ec    	call   DWORD PTR [eax-0x13000005]
 31020b5:	ee                   	out    dx,al
 31020b6:	ff                   	(bad)  
 31020b7:	ff b0 fb ff ff 0c    	push   DWORD PTR [eax+0xcfffffb]
 31020bd:	ef                   	out    dx,eax
 31020be:	ff                   	(bad)  
 31020bf:	ff d0                	call   eax
 31020c1:	fb                   	sti    
 31020c2:	ff                   	(bad)  
 31020c3:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

031020c4 <.rel.dyn>:
 31020c4:	9c                   	pushf  
 31020c5:	23 10                	and    edx,DWORD PTR [eax]
 31020c7:	03 07                	add    eax,DWORD PTR [edi]
 31020c9:	01 00                	add    DWORD PTR [eax],eax
 31020cb:	00 a0 23 10 03 07    	add    BYTE PTR [eax+0x7031023],ah
 31020d1:	02 00                	add    al,BYTE PTR [eax]
 31020d3:	00 a4 23 10 03 07 03 	add    BYTE PTR [ebx+eiz*1+0x3070310],ah
 31020da:	00 00                	add    BYTE PTR [eax],al
 31020dc:	a8 23                	test   al,0x23
 31020de:	10 03                	adc    BYTE PTR [ebx],al
 31020e0:	07                   	pop    es
 31020e1:	04 00                	add    al,0x0
 31020e3:	00 ac 23 10 03 07 05 	add    BYTE PTR [ebx+eiz*1+0x5070310],ch
 31020ea:	00 00                	add    BYTE PTR [eax],al
 31020ec:	b0 23                	mov    al,0x23
 31020ee:	10 03                	adc    BYTE PTR [ebx],al
 31020f0:	07                   	pop    es
 31020f1:	06                   	push   es
 31020f2:	00 00                	add    BYTE PTR [eax],al
 31020f4:	b4 23                	mov    ah,0x23
 31020f6:	10 03                	adc    BYTE PTR [ebx],al
 31020f8:	07                   	pop    es
 31020f9:	07                   	pop    es
 31020fa:	00 00                	add    BYTE PTR [eax],al
 31020fc:	b8 23 10 03 07       	mov    eax,0x7031023
 3102101:	08 00                	or     BYTE PTR [eax],al
 3102103:	00 bc 23 10 03 07 09 	add    BYTE PTR [ebx+eiz*1+0x9070310],bh
 310210a:	00 00                	add    BYTE PTR [eax],al
 310210c:	c0 23 10             	shl    BYTE PTR [ebx],0x10
 310210f:	03 07                	add    eax,DWORD PTR [edi]
 3102111:	0a 00                	or     al,BYTE PTR [eax]
 3102113:	00 c4                	add    ah,al
 3102115:	23 10                	and    edx,DWORD PTR [eax]
 3102117:	03 07                	add    eax,DWORD PTR [edi]
 3102119:	0b 00                	or     eax,DWORD PTR [eax]
 310211b:	00 c8                	add    al,cl
 310211d:	23 10                	and    edx,DWORD PTR [eax]
 310211f:	03 07                	add    eax,DWORD PTR [edi]
 3102121:	0c 00                	or     al,0x0
 3102123:	00 cc                	add    ah,cl
 3102125:	23 10                	and    edx,DWORD PTR [eax]
 3102127:	03 07                	add    eax,DWORD PTR [edi]
 3102129:	0d 00 00 d0 23       	or     eax,0x23d00000
 310212e:	10 03                	adc    BYTE PTR [ebx],al
 3102130:	07                   	pop    es
 3102131:	0e                   	push   cs
 3102132:	00 00                	add    BYTE PTR [eax],al
 3102134:	d4 23                	aam    0x23
 3102136:	10 03                	adc    BYTE PTR [ebx],al
 3102138:	07                   	pop    es
 3102139:	0f 00 00             	sldt   WORD PTR [eax]
 310213c:	d8 23                	fsub   DWORD PTR [ebx]
 310213e:	10 03                	adc    BYTE PTR [ebx],al
 3102140:	07                   	pop    es
 3102141:	10 00                	adc    BYTE PTR [eax],al
 3102143:	00 dc                	add    ah,bl
 3102145:	23 10                	and    edx,DWORD PTR [eax]
 3102147:	03 07                	add    eax,DWORD PTR [edi]
 3102149:	11 00                	adc    DWORD PTR [eax],eax
 310214b:	00 e0                	add    al,ah
 310214d:	23 10                	and    edx,DWORD PTR [eax]
 310214f:	03 07                	add    eax,DWORD PTR [edi]
 3102151:	12 00                	adc    al,BYTE PTR [eax]
 3102153:	00 e4                	add    ah,ah
 3102155:	23 10                	and    edx,DWORD PTR [eax]
 3102157:	03 07                	add    eax,DWORD PTR [edi]
 3102159:	13 00                	adc    eax,DWORD PTR [eax]
 310215b:	00 e8                	add    al,ch
 310215d:	23 10                	and    edx,DWORD PTR [eax]
 310215f:	03 07                	add    eax,DWORD PTR [edi]
 3102161:	14 00                	adc    al,0x0
 3102163:	00 ec                	add    ah,ch
 3102165:	23 10                	and    edx,DWORD PTR [eax]
 3102167:	03 07                	add    eax,DWORD PTR [edi]
 3102169:	15 00 00 f0 23       	adc    eax,0x23f00000
 310216e:	10 03                	adc    BYTE PTR [ebx],al
 3102170:	07                   	pop    es
 3102171:	16                   	push   ss
 3102172:	00 00                	add    BYTE PTR [eax],al
 3102174:	f4                   	hlt    
 3102175:	23 10                	and    edx,DWORD PTR [eax]
 3102177:	03 07                	add    eax,DWORD PTR [edi]
 3102179:	17                   	pop    ss
 310217a:	00 00                	add    BYTE PTR [eax],al
 310217c:	f8                   	clc    
 310217d:	23 10                	and    edx,DWORD PTR [eax]
 310217f:	03 07                	add    eax,DWORD PTR [edi]
 3102181:	18 00                	sbb    BYTE PTR [eax],al
 3102183:	00 fc                	add    ah,bh
 3102185:	23 10                	and    edx,DWORD PTR [eax]
 3102187:	03 07                	add    eax,DWORD PTR [edi]
 3102189:	19 00                	sbb    DWORD PTR [eax],eax
 310218b:	00 00                	add    BYTE PTR [eax],al
 310218d:	24 10                	and    al,0x10
 310218f:	03 07                	add    eax,DWORD PTR [edi]
 3102191:	1a 00                	sbb    al,BYTE PTR [eax]
 3102193:	00 04 24             	add    BYTE PTR [esp],al
 3102196:	10 03                	adc    BYTE PTR [ebx],al
 3102198:	07                   	pop    es
 3102199:	1b 00                	sbb    eax,DWORD PTR [eax]
 310219b:	00 08                	add    BYTE PTR [eax],cl
 310219d:	24 10                	and    al,0x10
 310219f:	03 07                	add    eax,DWORD PTR [edi]
 31021a1:	1c 00                	sbb    al,0x0
 31021a3:	00 0c 24             	add    BYTE PTR [esp],cl
 31021a6:	10 03                	adc    BYTE PTR [ebx],al
 31021a8:	07                   	pop    es
 31021a9:	1d 00 00 10 24       	sbb    eax,0x24100000
 31021ae:	10 03                	adc    BYTE PTR [ebx],al
 31021b0:	07                   	pop    es
 31021b1:	1e                   	push   ds
	...

Disassembly of section .data:

031021c0 <cmds>:
 31021c0:	d0 14 10             	rcl    BYTE PTR [eax+edx*1],1
 31021c3:	03 d6                	add    edx,esi
 31021c5:	14 10                	adc    al,0x10
 31021c7:	03 00                	add    eax,DWORD PTR [eax]
 31021c9:	00 10                	add    BYTE PTR [eax],dl
 31021cb:	03 00                	add    eax,DWORD PTR [eax]
 31021cd:	00 00                	add    BYTE PTR [eax],al
 31021cf:	00 e7                	add    bh,ah
 31021d1:	14 10                	adc    al,0x10
 31021d3:	03 eb                	add    ebp,ebx
 31021d5:	14 10                	adc    al,0x10
 31021d7:	03 19                	add    ebx,DWORD PTR [ecx]
 31021d9:	00 10                	add    BYTE PTR [eax],dl
 31021db:	03 00                	add    eax,DWORD PTR [eax]
 31021dd:	00 00                	add    BYTE PTR [eax],al
 31021df:	00 fd                	add    ch,bh
 31021e1:	14 10                	adc    al,0x10
 31021e3:	03 02                	add    eax,DWORD PTR [edx]
 31021e5:	15 10 03 20 05       	adc    eax,0x5200310
 31021ea:	10 03                	adc    BYTE PTR [ebx],al
 31021ec:	01 00                	add    DWORD PTR [eax],eax
 31021ee:	00 00                	add    BYTE PTR [eax],al
 31021f0:	14 15                	adc    al,0x15
 31021f2:	10 03                	adc    BYTE PTR [ebx],al
 31021f4:	19 15 10 03 37 05    	sbb    DWORD PTR ds:0x5370310,edx
 31021fa:	10 03                	adc    BYTE PTR [ebx],al
 31021fc:	01 00                	add    DWORD PTR [eax],eax
 31021fe:	00 00                	add    BYTE PTR [eax],al
 3102200:	25 15 10 03 2a       	and    eax,0x2a031015
 3102205:	15 10 03 8f 05       	adc    eax,0x58f0310
 310220a:	10 03                	adc    BYTE PTR [ebx],al
 310220c:	01 00                	add    DWORD PTR [eax],eax
 310220e:	00 00                	add    BYTE PTR [eax],al
 3102210:	46                   	inc    esi
 3102211:	15 10 03 4a 15       	adc    eax,0x154a0310
 3102216:	10 03                	adc    BYTE PTR [ebx],al
 3102218:	5d                   	pop    ebp
 3102219:	06                   	push   es
 310221a:	10 03                	adc    BYTE PTR [ebx],al
 310221c:	00 00                	add    BYTE PTR [eax],al
 310221e:	00 00                	add    BYTE PTR [eax],al
 3102220:	62 15 10 03 69 15    	bound  edx,QWORD PTR ds:0x15690310
 3102226:	10 03                	adc    BYTE PTR [ebx],al
 3102228:	59                   	pop    ecx
 3102229:	04 10                	add    al,0x10
 310222b:	03 01                	add    eax,DWORD PTR [ecx]
 310222d:	00 00                	add    BYTE PTR [eax],al
 310222f:	00 82 15 10 03 86    	add    BYTE PTR [edx-0x79fcefeb],al
 3102235:	15 10 03 68 00       	adc    eax,0x680310
 310223a:	10 03                	adc    BYTE PTR [ebx],al
 310223c:	01 00                	add    DWORD PTR [eax],eax
 310223e:	00 00                	add    BYTE PTR [eax],al
 3102240:	a2 15 10 03 a8       	mov    ds:0xa8031015,al
 3102245:	15 10 03 ab 06       	adc    eax,0x6ab0310
 310224a:	10 03                	adc    BYTE PTR [ebx],al
 310224c:	01 00                	add    DWORD PTR [eax],eax
 310224e:	00 00                	add    BYTE PTR [eax],al
 3102250:	bc 15 10 03 c4       	mov    esp,0xc4031015
 3102255:	15 10 03 1b 04       	adc    eax,0x41b0310
 310225a:	10 03                	adc    BYTE PTR [ebx],al
 310225c:	01 00                	add    DWORD PTR [eax],eax
	...

03102260 <cmds>:
 3102260:	2c 17                	sub    al,0x17
 3102262:	10 03                	adc    BYTE PTR [ebx],al
 3102264:	32 17                	xor    dl,BYTE PTR [edi]
 3102266:	10 03                	adc    BYTE PTR [ebx],al
 3102268:	00 00                	add    BYTE PTR [eax],al
 310226a:	10 03                	adc    BYTE PTR [ebx],al
 310226c:	00 00                	add    BYTE PTR [eax],al
 310226e:	00 00                	add    BYTE PTR [eax],al
 3102270:	43                   	inc    ebx
 3102271:	17                   	pop    ss
 3102272:	10 03                	adc    BYTE PTR [ebx],al
 3102274:	47                   	inc    edi
 3102275:	17                   	pop    ss
 3102276:	10 03                	adc    BYTE PTR [ebx],al
 3102278:	19 00                	sbb    DWORD PTR [eax],eax
 310227a:	10 03                	adc    BYTE PTR [ebx],al
 310227c:	00 00                	add    BYTE PTR [eax],al
 310227e:	00 00                	add    BYTE PTR [eax],al
 3102280:	59                   	pop    ecx
 3102281:	17                   	pop    ss
 3102282:	10 03                	adc    BYTE PTR [ebx],al
 3102284:	5e                   	pop    esi
 3102285:	17                   	pop    ss
 3102286:	10 03                	adc    BYTE PTR [ebx],al
 3102288:	20 05 10 03 01 00    	and    BYTE PTR ds:0x10310,al
 310228e:	00 00                	add    BYTE PTR [eax],al
 3102290:	70 17                	jo     31022a9 <cmds+0x49>
 3102292:	10 03                	adc    BYTE PTR [ebx],al
 3102294:	75 17                	jne    31022ad <cmds+0x4d>
 3102296:	10 03                	adc    BYTE PTR [ebx],al
 3102298:	37                   	aaa    
 3102299:	05 10 03 01 00       	add    eax,0x10310
 310229e:	00 00                	add    BYTE PTR [eax],al
 31022a0:	81 17 10 03 86 17    	adc    DWORD PTR [edi],0x17860310
 31022a6:	10 03                	adc    BYTE PTR [ebx],al
 31022a8:	8f 05 10 03 01 00    	pop    DWORD PTR ds:0x10310
 31022ae:	00 00                	add    BYTE PTR [eax],al
 31022b0:	a2 17 10 03 a6       	mov    ds:0xa6031017,al
 31022b5:	17                   	pop    ss
 31022b6:	10 03                	adc    BYTE PTR [ebx],al
 31022b8:	5d                   	pop    ebp
 31022b9:	06                   	push   es
 31022ba:	10 03                	adc    BYTE PTR [ebx],al
 31022bc:	00 00                	add    BYTE PTR [eax],al
 31022be:	00 00                	add    BYTE PTR [eax],al
 31022c0:	be 17 10 03 c5       	mov    esi,0xc5031017
 31022c5:	17                   	pop    ss
 31022c6:	10 03                	adc    BYTE PTR [ebx],al
 31022c8:	59                   	pop    ecx
 31022c9:	04 10                	add    al,0x10
 31022cb:	03 01                	add    eax,DWORD PTR [ecx]
 31022cd:	00 00                	add    BYTE PTR [eax],al
 31022cf:	00 de                	add    dh,bl
 31022d1:	17                   	pop    ss
 31022d2:	10 03                	adc    BYTE PTR [ebx],al
 31022d4:	e2 17                	loop   31022ed <cmds+0x8d>
 31022d6:	10 03                	adc    BYTE PTR [ebx],al
 31022d8:	68 00 10 03 01       	push   0x1031000
 31022dd:	00 00                	add    BYTE PTR [eax],al
 31022df:	00 fe                	add    dh,bh
 31022e1:	17                   	pop    ss
 31022e2:	10 03                	adc    BYTE PTR [ebx],al
 31022e4:	04 18                	add    al,0x18
 31022e6:	10 03                	adc    BYTE PTR [ebx],al
 31022e8:	ab                   	stos   DWORD PTR es:[edi],eax
 31022e9:	06                   	push   es
 31022ea:	10 03                	adc    BYTE PTR [ebx],al
 31022ec:	01 00                	add    DWORD PTR [eax],eax
 31022ee:	00 00                	add    BYTE PTR [eax],al
 31022f0:	18 18                	sbb    BYTE PTR [eax],bl
 31022f2:	10 03                	adc    BYTE PTR [ebx],al
 31022f4:	20 18                	and    BYTE PTR [eax],bl
 31022f6:	10 03                	adc    BYTE PTR [ebx],al
 31022f8:	1b 04 10             	sbb    eax,DWORD PTR [eax+edx*1]
 31022fb:	03 01                	add    eax,DWORD PTR [ecx]
 31022fd:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynamic:

03102300 <_DYNAMIC>:
 3102300:	01 00                	add    DWORD PTR [eax],eax
 3102302:	00 00                	add    BYTE PTR [eax],al
 3102304:	01 00                	add    DWORD PTR [eax],eax
 3102306:	00 00                	add    BYTE PTR [eax],al
 3102308:	0f 00 00             	sldt   WORD PTR [eax]
 310230b:	00 e0                	add    al,ah
 310230d:	00 00                	add    BYTE PTR [eax],al
 310230f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3102312:	00 00                	add    BYTE PTR [eax],al
 3102314:	e8 1e 10 03 05       	call   8133337 <lCommand+0x50211b7>
 3102319:	00 00                	add    BYTE PTR [eax],al
 310231b:	00 e4                	add    ah,ah
 310231d:	1d 10 03 06 00       	sbb    eax,0x60310
 3102322:	00 00                	add    BYTE PTR [eax],al
 3102324:	f4                   	hlt    
 3102325:	1b 10                	sbb    edx,DWORD PTR [eax]
 3102327:	03 0a                	add    ecx,DWORD PTR [edx]
 3102329:	00 00                	add    BYTE PTR [eax],al
 310232b:	00 03                	add    BYTE PTR [ebx],al
 310232d:	01 00                	add    DWORD PTR [eax],eax
 310232f:	00 0b                	add    BYTE PTR [ebx],cl
 3102331:	00 00                	add    BYTE PTR [eax],al
 3102333:	00 10                	add    BYTE PTR [eax],dl
 3102335:	00 00                	add    BYTE PTR [eax],al
 3102337:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 310233d:	00 00                	add    BYTE PTR [eax],al
 310233f:	00 03                	add    BYTE PTR [ebx],al
 3102341:	00 00                	add    BYTE PTR [eax],al
 3102343:	00 90 23 10 03 02    	add    BYTE PTR [eax+0x2031023],dl
 3102349:	00 00                	add    BYTE PTR [eax],al
 310234b:	00 f0                	add    al,dh
 310234d:	00 00                	add    BYTE PTR [eax],al
 310234f:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
 3102352:	00 00                	add    BYTE PTR [eax],al
 3102354:	11 00                	adc    DWORD PTR [eax],eax
 3102356:	00 00                	add    BYTE PTR [eax],al
 3102358:	17                   	pop    ss
 3102359:	00 00                	add    BYTE PTR [eax],al
 310235b:	00 c4                	add    ah,al
 310235d:	20 10                	and    BYTE PTR [eax],dl
 310235f:	03 00                	add    eax,DWORD PTR [eax]
	...

Disassembly of section .got.plt:

03102390 <_GLOBAL_OFFSET_TABLE_>:
 3102390:	00 23                	add    BYTE PTR [ebx],ah
 3102392:	10 03                	adc    BYTE PTR [ebx],al
	...
 310239c:	f6 12                	not    BYTE PTR [edx]
 310239e:	10 03                	adc    BYTE PTR [ebx],al
 31023a0:	06                   	push   es
 31023a1:	13 10                	adc    edx,DWORD PTR [eax]
 31023a3:	03 16                	add    edx,DWORD PTR [esi]
 31023a5:	13 10                	adc    edx,DWORD PTR [eax]
 31023a7:	03 26                	add    esp,DWORD PTR [esi]
 31023a9:	13 10                	adc    edx,DWORD PTR [eax]
 31023ab:	03 36                	add    esi,DWORD PTR [esi]
 31023ad:	13 10                	adc    edx,DWORD PTR [eax]
 31023af:	03 46 13             	add    eax,DWORD PTR [esi+0x13]
 31023b2:	10 03                	adc    BYTE PTR [ebx],al
 31023b4:	56                   	push   esi
 31023b5:	13 10                	adc    edx,DWORD PTR [eax]
 31023b7:	03 66 13             	add    esp,DWORD PTR [esi+0x13]
 31023ba:	10 03                	adc    BYTE PTR [ebx],al
 31023bc:	76 13                	jbe    31023d1 <_GLOBAL_OFFSET_TABLE_+0x41>
 31023be:	10 03                	adc    BYTE PTR [ebx],al
 31023c0:	86 13                	xchg   BYTE PTR [ebx],dl
 31023c2:	10 03                	adc    BYTE PTR [ebx],al
 31023c4:	96                   	xchg   esi,eax
 31023c5:	13 10                	adc    edx,DWORD PTR [eax]
 31023c7:	03 a6 13 10 03 b6    	add    esp,DWORD PTR [esi-0x49fcefed]
 31023cd:	13 10                	adc    edx,DWORD PTR [eax]
 31023cf:	03 c6                	add    eax,esi
 31023d1:	13 10                	adc    edx,DWORD PTR [eax]
 31023d3:	03 d6                	add    edx,esi
 31023d5:	13 10                	adc    edx,DWORD PTR [eax]
 31023d7:	03 e6                	add    esp,esi
 31023d9:	13 10                	adc    edx,DWORD PTR [eax]
 31023db:	03 f6                	add    esi,esi
 31023dd:	13 10                	adc    edx,DWORD PTR [eax]
 31023df:	03 06                	add    eax,DWORD PTR [esi]
 31023e1:	14 10                	adc    al,0x10
 31023e3:	03 16                	add    edx,DWORD PTR [esi]
 31023e5:	14 10                	adc    al,0x10
 31023e7:	03 26                	add    esp,DWORD PTR [esi]
 31023e9:	14 10                	adc    al,0x10
 31023eb:	03 36                	add    esi,DWORD PTR [esi]
 31023ed:	14 10                	adc    al,0x10
 31023ef:	03 46 14             	add    eax,DWORD PTR [esi+0x14]
 31023f2:	10 03                	adc    BYTE PTR [ebx],al
 31023f4:	56                   	push   esi
 31023f5:	14 10                	adc    al,0x10
 31023f7:	03 66 14             	add    esp,DWORD PTR [esi+0x14]
 31023fa:	10 03                	adc    BYTE PTR [ebx],al
 31023fc:	76 14                	jbe    3102412 <_GLOBAL_OFFSET_TABLE_+0x82>
 31023fe:	10 03                	adc    BYTE PTR [ebx],al
 3102400:	86 14 10             	xchg   BYTE PTR [eax+edx*1],dl
 3102403:	03 96 14 10 03 a6    	add    edx,DWORD PTR [esi-0x59fcefec]
 3102409:	14 10                	adc    al,0x10
 310240b:	03 b6 14 10 03 c6    	add    esi,DWORD PTR [esi-0x39fcefec]
 3102411:	14 10                	adc    al,0x10
 3102413:	03                   	.byte 0x3

Disassembly of section .bss:

03102420 <bSigIntReceived>:
 3102420:	00 00                	add    BYTE PTR [eax],al
	...

03102424 <delim>:
	...

0310242c <environmentLoc>:
	...

03102440 <cwd>:
	...

03102540 <sExecutingProgram>:
	...

03102740 <command_function_p>:
 3102740:	00 00                	add    BYTE PTR [eax],al
	...

03102744 <cpuid_extended_feature_bits>:
 3102744:	00 00                	add    BYTE PTR [eax],al
	...

03102748 <heapEnd>:
 3102748:	00 00                	add    BYTE PTR [eax],al
	...

0310274c <heapBase>:
 310274c:	00 00                	add    BYTE PTR [eax],al
	...

03102750 <heapCurr>:
 3102750:	00 00                	add    BYTE PTR [eax],al
	...

03102754 <command_function>:
 3102754:	00 00                	add    BYTE PTR [eax],al
	...

03102758 <cpuid_procinfo>:
	...

03102760 <processEnvp>:
 3102760:	00 00                	add    BYTE PTR [eax],al
	...

03102764 <lastExecExitCode>:
 3102764:	00 00                	add    BYTE PTR [eax],al
	...

03102768 <exitCode>:
 3102768:	00 00                	add    BYTE PTR [eax],al
	...

0310276c <sKShellProgramName>:
 310276c:	00 00                	add    BYTE PTR [eax],al
	...

03102770 <libcTZ>:
 3102770:	00 00                	add    BYTE PTR [eax],al
	...

03102774 <timeToExit>:
 3102774:	00 00                	add    BYTE PTR [eax],al
	...

03102778 <commandHistoryPtr>:
 3102778:	00 00                	add    BYTE PTR [eax],al
	...

0310277c <commandHistoryMax>:
 310277c:	00 00                	add    BYTE PTR [eax],al
	...

03102780 <commandHistory>:
	...

03112180 <lCommand>:
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	19 08                	sbb    DWORD PTR [eax],ecx
       2:	00 00                	add    BYTE PTR [eax],al
       4:	04 00                	add    al,0x0
       6:	00 00                	add    BYTE PTR [eax],al
       8:	00 00                	add    BYTE PTR [eax],al
       a:	04 01                	add    al,0x1
       c:	a1 00 00 00 0c       	mov    eax,ds:0xc000000
      11:	f7 00 00 00 37 00    	test   DWORD PTR [eax],0x370000
      17:	00 00                	add    BYTE PTR [eax],al
      19:	00 00                	add    BYTE PTR [eax],al
      1b:	10 03                	adc    BYTE PTR [ebx],al
      1d:	bc 07 00 00 00       	mov    esp,0x7
      22:	00 00                	add    BYTE PTR [eax],al
      24:	00 02                	add    BYTE PTR [edx],al
      26:	01 06                	add    DWORD PTR [esi],eax
      28:	49                   	dec    ecx
      29:	02 00                	add    al,BYTE PTR [eax]
      2b:	00 02                	add    BYTE PTR [edx],al
      2d:	01 06                	add    DWORD PTR [esi],eax
      2f:	42                   	inc    edx
      30:	02 00                	add    al,BYTE PTR [eax]
      32:	00 02                	add    BYTE PTR [edx],al
      34:	02 05 17 01 00 00    	add    al,BYTE PTR ds:0x117
      3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
      41:	02 08                	add    cl,BYTE PTR [eax]
      43:	05 a6 01 00 00       	add    eax,0x1a6
      48:	04 42                	add    al,0x42
      4a:	01 00                	add    DWORD PTR [eax],eax
      4c:	00 02                	add    BYTE PTR [edx],al
      4e:	2e                   	cs
      4f:	53                   	push   ebx
      50:	00 00                	add    BYTE PTR [eax],al
      52:	00 02                	add    BYTE PTR [edx],al
      54:	01 08                	add    DWORD PTR [eax],ecx
      56:	40                   	inc    eax
      57:	02 00                	add    al,BYTE PTR [eax]
      59:	00 02                	add    BYTE PTR [edx],al
      5b:	02 07                	add    al,BYTE PTR [edi]
      5d:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
      5e:	02 00                	add    al,BYTE PTR [eax]
      60:	00 04 75 02 00 00 02 	add    BYTE PTR [esi*2+0x2000002],al
      67:	34 6c                	xor    al,0x6c
      69:	00 00                	add    BYTE PTR [eax],al
      6b:	00 02                	add    BYTE PTR [edx],al
      6d:	04 07                	add    al,0x7
      6f:	60                   	pusha  
      70:	02 00                	add    al,BYTE PTR [eax]
      72:	00 02                	add    BYTE PTR [edx],al
      74:	08 07                	or     BYTE PTR [edi],al
      76:	56                   	push   esi
      77:	02 00                	add    al,BYTE PTR [eax]
      79:	00 04 53             	add    BYTE PTR [ebx+edx*2],al
      7c:	01 00                	add    DWORD PTR [eax],eax
      7e:	00 02                	add    BYTE PTR [edx],al
      80:	56                   	push   esi
      81:	6c                   	ins    BYTE PTR es:[edi],dx
      82:	00 00                	add    BYTE PTR [eax],al
      84:	00 02                	add    BYTE PTR [edx],al
      86:	04 05                	add    al,0x5
      88:	ab                   	stos   DWORD PTR es:[edi],eax
      89:	01 00                	add    DWORD PTR [eax],eax
      8b:	00 02                	add    BYTE PTR [edx],al
      8d:	01 02                	add    DWORD PTR [edx],eax
      8f:	df 02                	fild   WORD PTR [edx]
      91:	00 00                	add    BYTE PTR [eax],al
      93:	05 04 02 04 07       	add    eax,0x7040204
      98:	7f 00                	jg     9a <cmdClearScreen-0x30fff66>
      9a:	00 00                	add    BYTE PTR [eax],al
      9c:	06                   	push   es
      9d:	05 03 58 1d 01       	add    eax,0x11d5803
      a2:	00 00                	add    BYTE PTR [eax],al
      a4:	07                   	pop    es
      a5:	88 03                	mov    BYTE PTR [ebx],al
      a7:	00 00                	add    BYTE PTR [eax],al
      a9:	03 59 48             	add    ebx,DWORD PTR [ecx+0x48]
      ac:	00 00                	add    BYTE PTR [eax],al
      ae:	00 01                	add    BYTE PTR [ecx],al
      b0:	04 04                	add    al,0x4
      b2:	00 07                	add    BYTE PTR [edi],al
      b4:	c1 02 00             	rol    DWORD PTR [edx],0x0
      b7:	00 03                	add    BYTE PTR [ebx],al
      b9:	5a                   	pop    edx
      ba:	48                   	dec    eax
      bb:	00 00                	add    BYTE PTR [eax],al
      bd:	00 01                	add    BYTE PTR [ecx],al
      bf:	04 00                	add    al,0x0
      c1:	00 07                	add    BYTE PTR [edi],al
      c3:	6e                   	outs   dx,BYTE PTR ds:[esi]
      c4:	02 00                	add    al,BYTE PTR [eax]
      c6:	00 03                	add    BYTE PTR [ebx],al
      c8:	5b                   	pop    ebx
      c9:	48                   	dec    eax
      ca:	00 00                	add    BYTE PTR [eax],al
      cc:	00 01                	add    BYTE PTR [ecx],al
      ce:	04 04                	add    al,0x4
      d0:	01 07                	add    DWORD PTR [edi],eax
      d2:	83 00 00             	add    DWORD PTR [eax],0x0
      d5:	00 03                	add    BYTE PTR [ebx],al
      d7:	5c                   	pop    esp
      d8:	48                   	dec    eax
      d9:	00 00                	add    BYTE PTR [eax],al
      db:	00 01                	add    BYTE PTR [ecx],al
      dd:	02 02                	add    al,BYTE PTR [edx]
      df:	01 07                	add    DWORD PTR [edi],eax
      e1:	cf                   	iret   
      e2:	01 00                	add    DWORD PTR [eax],eax
      e4:	00 03                	add    BYTE PTR [ebx],al
      e6:	5d                   	pop    ebp
      e7:	48                   	dec    eax
      e8:	00 00                	add    BYTE PTR [eax],al
      ea:	00 01                	add    BYTE PTR [ecx],al
      ec:	02 00                	add    al,BYTE PTR [eax]
      ee:	01 07                	add    DWORD PTR [edi],eax
      f0:	c0 02 00             	rol    BYTE PTR [edx],0x0
      f3:	00 03                	add    BYTE PTR [ebx],al
      f5:	5e                   	pop    esi
      f6:	48                   	dec    eax
      f7:	00 00                	add    BYTE PTR [eax],al
      f9:	00 01                	add    BYTE PTR [ecx],al
      fb:	04 04                	add    al,0x4
      fd:	02 07                	add    al,BYTE PTR [edi]
      ff:	6d                   	ins    DWORD PTR es:[edi],dx
     100:	02 00                	add    al,BYTE PTR [eax]
     102:	00 03                	add    BYTE PTR [ebx],al
     104:	5f                   	pop    edi
     105:	48                   	dec    eax
     106:	00 00                	add    BYTE PTR [eax],al
     108:	00 01                	add    BYTE PTR [ecx],al
     10a:	08 00                	or     BYTE PTR [eax],al
     10c:	03 07                	add    eax,DWORD PTR [edi]
     10e:	d4 01                	aam    0x1
     110:	00 00                	add    BYTE PTR [eax],al
     112:	03 60 48             	add    esp,DWORD PTR [eax+0x48]
     115:	00 00                	add    BYTE PTR [eax],al
     117:	00 01                	add    BYTE PTR [ecx],al
     119:	04 04                	add    al,0x4
     11b:	04 00                	add    al,0x0
     11d:	08 08                	or     BYTE PTR [eax],cl
     11f:	03 56 36             	add    edx,DWORD PTR [esi+0x36]
     122:	01 00                	add    DWORD PTR [eax],eax
     124:	00 09                	add    BYTE PTR [ecx],cl
     126:	9c                   	pushf  
     127:	00 00                	add    BYTE PTR [eax],al
     129:	00 0a                	add    BYTE PTR [edx],cl
     12b:	72 65                	jb     192 <cmdClearScreen-0x30ffe6e>
     12d:	67 00 03             	add    BYTE PTR [bp+di],al
     130:	62 61 00             	bound  esp,QWORD PTR [ecx+0x0]
     133:	00 00                	add    BYTE PTR [eax],al
     135:	00 06                	add    BYTE PTR [esi],al
     137:	04 03                	add    al,0x3
     139:	db 6c 01 00          	fld    TBYTE PTR [ecx+eax*1+0x0]
     13d:	00 07                	add    BYTE PTR [edi],al
     13f:	2f                   	das    
     140:	03 00                	add    eax,DWORD PTR [eax]
     142:	00 03                	add    BYTE PTR [ebx],al
     144:	dc 48 00             	fmul   QWORD PTR [eax+0x0]
     147:	00 00                	add    BYTE PTR [eax],al
     149:	01 01                	add    DWORD PTR [ecx],eax
     14b:	07                   	pop    es
     14c:	00 07                	add    BYTE PTR [edi],al
     14e:	42                   	inc    edx
     14f:	03 00                	add    eax,DWORD PTR [eax]
     151:	00 03                	add    BYTE PTR [ebx],al
     153:	dd 48 00             	fisttp QWORD PTR [eax+0x0]
     156:	00 00                	add    BYTE PTR [eax],al
     158:	01 01                	add    DWORD PTR [ecx],eax
     15a:	06                   	push   es
     15b:	00 07                	add    BYTE PTR [edi],al
     15d:	65 03 00             	add    eax,DWORD PTR gs:[eax]
     160:	00 03                	add    BYTE PTR [ebx],al
     162:	de 61 00             	fisub  WORD PTR [ecx+0x0]
     165:	00 00                	add    BYTE PTR [eax],al
     167:	04 1e                	add    al,0x1e
     169:	00 00                	add    BYTE PTR [eax],al
     16b:	00 08                	add    BYTE PTR [eax],cl
     16d:	04 03                	add    al,0x3
     16f:	da 85 01 00 00 09    	fiadd  DWORD PTR [ebp+0x9000001]
     175:	36 01 00             	add    DWORD PTR ss:[eax],eax
     178:	00 0a                	add    BYTE PTR [edx],cl
     17a:	72 65                	jb     1e1 <cmdClearScreen-0x30ffe1f>
     17c:	67 00 03             	add    BYTE PTR [bp+di],al
     17f:	e0 61                	loopne 1e2 <cmdClearScreen-0x30ffe1e>
     181:	00 00                	add    BYTE PTR [eax],al
     183:	00 00                	add    BYTE PTR [eax],al
     185:	0b 4a 01             	or     ecx,DWORD PTR [edx+0x1]
     188:	00 00                	add    BYTE PTR [eax],al
     18a:	04 6c                	add    al,0x6c
     18c:	00 00                	add    BYTE PTR [eax],al
     18e:	00 07                	add    BYTE PTR [edi],al
     190:	15 c0 01 00 00       	adc    eax,0x1c0
     195:	0c e5                	or     al,0xe5
     197:	02 00                	add    al,BYTE PTR [eax]
     199:	00 01                	add    BYTE PTR [ecx],al
     19b:	0c ed                	or     al,0xed
     19d:	01 00                	add    DWORD PTR [eax],eax
     19f:	00 02                	add    BYTE PTR [edx],al
     1a1:	0c 06                	or     al,0x6
     1a3:	01 00                	add    DWORD PTR [eax],eax
     1a5:	00 04 0c             	add    BYTE PTR [esp+ecx*1],al
     1a8:	6e                   	outs   dx,BYTE PTR ds:[esi]
     1a9:	03 00                	add    eax,DWORD PTR [eax]
     1ab:	00 08                	add    BYTE PTR [eax],cl
     1ad:	0c f2                	or     al,0xf2
     1af:	02 00                	add    al,BYTE PTR [eax]
     1b1:	00 10                	add    BYTE PTR [eax],dl
     1b3:	0c 91                	or     al,0x91
     1b5:	00 00                	add    BYTE PTR [eax],al
     1b7:	00 20                	add    BYTE PTR [eax],ah
     1b9:	0c d1                	or     al,0xd1
     1bb:	02 00                	add    al,BYTE PTR [eax]
     1bd:	00 40 00             	add    BYTE PTR [eax+0x0],al
     1c0:	06                   	push   es
     1c1:	10 04 14             	adc    BYTE PTR [esp+edx*1],al
     1c4:	f9                   	stc    
     1c5:	01 00                	add    DWORD PTR [eax],eax
     1c7:	00 0d 33 02 00 00    	add    BYTE PTR ds:0x233,cl
     1cd:	04 16                	add    al,0x16
     1cf:	f9                   	stc    
     1d0:	01 00                	add    DWORD PTR [eax],eax
     1d2:	00 00                	add    BYTE PTR [eax],al
     1d4:	0d 73 00 00 00       	or     eax,0x73
     1d9:	04 17                	add    al,0x17
     1db:	f9                   	stc    
     1dc:	01 00                	add    DWORD PTR [eax],eax
     1de:	00 04 0d 65 01 00 00 	add    BYTE PTR [ecx*1+0x165],al
     1e5:	04 18                	add    al,0x18
     1e7:	93                   	xchg   ebx,eax
     1e8:	00 00                	add    BYTE PTR [eax],al
     1ea:	00 08                	add    BYTE PTR [eax],cl
     1ec:	0d 84 01 00 00       	or     eax,0x184
     1f1:	04 19                	add    al,0x19
     1f3:	3a 00                	cmp    al,BYTE PTR [eax]
     1f5:	00 00                	add    BYTE PTR [eax],al
     1f7:	0c 00                	or     al,0x0
     1f9:	0e                   	push   cs
     1fa:	04 25                	add    al,0x25
     1fc:	00 00                	add    BYTE PTR [eax],al
     1fe:	00 04 94             	add    BYTE PTR [esp+edx*4],al
     201:	03 00                	add    eax,DWORD PTR [eax]
     203:	00 04 1a             	add    BYTE PTR [edx+ebx*1],al
     206:	c0 01 00             	rol    BYTE PTR [ecx],0x0
     209:	00 0f                	add    BYTE PTR [edi],cl
     20b:	75 01                	jne    20e <cmdClearScreen-0x30ffdf2>
     20d:	00 00                	add    BYTE PTR [eax],al
     20f:	01 0a                	add    DWORD PTR [edx],ecx
     211:	00 00                	add    BYTE PTR [eax],al
     213:	10 03                	adc    BYTE PTR [ebx],al
     215:	19 00                	sbb    DWORD PTR [eax],eax
     217:	00 00                	add    BYTE PTR [eax],al
     219:	01 9c 10 5f 00 00 00 	add    DWORD PTR [eax+edx*1+0x5f],ebx
     220:	01 0f                	add    DWORD PTR [edi],ecx
     222:	19 00                	sbb    DWORD PTR [eax],eax
     224:	10 03                	adc    BYTE PTR [ebx],al
     226:	4f                   	dec    edi
     227:	00 00                	add    BYTE PTR [eax],al
     229:	00 01                	add    BYTE PTR [ecx],al
     22b:	9c                   	pushf  
     22c:	49                   	dec    ecx
     22d:	02 00                	add    al,BYTE PTR [eax]
     22f:	00 11                	add    BYTE PTR [ecx],dl
     231:	1f                   	pop    ds
     232:	00 10                	add    BYTE PTR [eax],dl
     234:	03 46 00             	add    eax,DWORD PTR [esi+0x0]
     237:	00 00                	add    BYTE PTR [eax],al
     239:	12 63 6e             	adc    ah,BYTE PTR [ebx+0x6e]
     23c:	74 00                	je     23e <cmdClearScreen-0x30ffdc2>
     23e:	01 11                	add    DWORD PTR [ecx],edx
     240:	3a 00                	cmp    al,BYTE PTR [eax]
     242:	00 00                	add    BYTE PTR [eax],al
     244:	02 91 6c 00 00 13    	add    dl,BYTE PTR [ecx+0x1300006c]
     24a:	c7 02 00 00 01 1b    	mov    DWORD PTR [edx],0x1b010000
     250:	68 00 10 03 5d       	push   0x5d031000
     255:	01 00                	add    DWORD PTR [eax],eax
     257:	00 01                	add    BYTE PTR [ecx],al
     259:	9c                   	pushf  
     25a:	cc                   	int3   
     25b:	02 00                	add    al,BYTE PTR [eax]
     25d:	00 14 99             	add    BYTE PTR [ecx+ebx*4],dl
     260:	00 00                	add    BYTE PTR [eax],al
     262:	00 01                	add    BYTE PTR [ecx],al
     264:	1b f9                	sbb    edi,ecx
     266:	01 00                	add    DWORD PTR [eax],eax
     268:	00 02                	add    BYTE PTR [edx],al
     26a:	91                   	xchg   ecx,eax
     26b:	00 15 2c 02 00 00    	add    BYTE PTR ds:0x22c,dl
     271:	01 1d cc 02 00 00    	add    DWORD PTR ds:0x2cc,ebx
     277:	03 91 dc 75 15 b4    	add    edx,DWORD PTR [ecx-0x4bea8a24]
     27d:	01 00                	add    DWORD PTR [eax],eax
     27f:	00 01                	add    BYTE PTR [ecx],al
     281:	1e                   	push   ds
     282:	f9                   	stc    
     283:	01 00                	add    DWORD PTR [eax],eax
     285:	00 02                	add    BYTE PTR [edx],al
     287:	91                   	xchg   ecx,eax
     288:	60                   	pusha  
     289:	15 0f 00 00 00       	adc    eax,0xf
     28e:	01 1e                	add    DWORD PTR [esi],ebx
     290:	f9                   	stc    
     291:	01 00                	add    DWORD PTR [eax],eax
     293:	00 02                	add    BYTE PTR [edx],al
     295:	91                   	xchg   ecx,eax
     296:	5c                   	pop    esp
     297:	11 93 00 10 03 29    	adc    DWORD PTR [ebx+0x29031000],edx
     29d:	01 00                	add    DWORD PTR [eax],eax
     29f:	00 15 27 00 00 00    	add    BYTE PTR ds:0x27,dl
     2a5:	01 22                	add    DWORD PTR [edx],esp
     2a7:	3a 00                	cmp    al,BYTE PTR [eax]
     2a9:	00 00                	add    BYTE PTR [eax],al
     2ab:	02 91 6c 15 4d 03    	add    dl,BYTE PTR [ecx+0x34d156c]
     2b1:	00 00                	add    BYTE PTR [eax],al
     2b3:	01 22                	add    DWORD PTR [edx],esp
     2b5:	3a 00                	cmp    al,BYTE PTR [eax]
     2b7:	00 00                	add    BYTE PTR [eax],al
     2b9:	02 91 68 15 ff 02    	add    dl,BYTE PTR [ecx+0x2ff1568]
     2bf:	00 00                	add    BYTE PTR [eax],al
     2c1:	01 23                	add    DWORD PTR [ebx],esp
     2c3:	3a 00                	cmp    al,BYTE PTR [eax]
     2c5:	00 00                	add    BYTE PTR [eax],al
     2c7:	02 91 64 00 00 16    	add    dl,BYTE PTR [ecx+0x16000064]
     2cd:	25 00 00 00 e2       	and    eax,0xe2000000
     2d2:	02 00                	add    al,BYTE PTR [eax]
     2d4:	00 17                	add    BYTE PTR [edi],dl
     2d6:	95                   	xchg   ebp,eax
     2d7:	00 00                	add    BYTE PTR [eax],al
     2d9:	00 09                	add    BYTE PTR [ecx],cl
     2db:	17                   	pop    ss
     2dc:	95                   	xchg   ebp,eax
     2dd:	00 00                	add    BYTE PTR [eax],al
     2df:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
     2e2:	18 8d 03 00 00 01    	sbb    BYTE PTR [ebp+0x1000003],cl
     2e8:	3a 3a                	cmp    bh,BYTE PTR [edx]
     2ea:	00 00                	add    BYTE PTR [eax],al
     2ec:	00 c5                	add    ch,al
     2ee:	01 10                	add    DWORD PTR [eax],edx
     2f0:	03 8b 00 00 00 01    	add    ecx,DWORD PTR [ebx+0x1000000]
     2f6:	9c                   	pushf  
     2f7:	5a                   	pop    edx
     2f8:	03 00                	add    eax,DWORD PTR [eax]
     2fa:	00 14 0e             	add    BYTE PTR [esi+ecx*1],dl
     2fd:	03 00                	add    eax,DWORD PTR [eax]
     2ff:	00 01                	add    BYTE PTR [ecx],al
     301:	3a f9                	cmp    bh,cl
     303:	01 00                	add    DWORD PTR [eax],eax
     305:	00 02                	add    BYTE PTR [edx],al
     307:	91                   	xchg   ecx,eax
     308:	00 14 8f             	add    BYTE PTR [edi+ecx*4],dl
     30b:	04 00                	add    al,0x0
     30d:	00 01                	add    BYTE PTR [ecx],al
     30f:	3a 3a                	cmp    bh,BYTE PTR [edx]
     311:	00 00                	add    BYTE PTR [eax],al
     313:	00 02                	add    BYTE PTR [edx],al
     315:	91                   	xchg   ecx,eax
     316:	04 14                	add    al,0x14
     318:	d4 04                	aam    0x4
     31a:	00 00                	add    BYTE PTR [eax],al
     31c:	01 3a                	add    DWORD PTR [edx],edi
     31e:	5a                   	pop    edx
     31f:	03 00                	add    eax,DWORD PTR [eax]
     321:	00 02                	add    BYTE PTR [edx],al
     323:	91                   	xchg   ecx,eax
     324:	08 14 e2             	or     BYTE PTR [edx+eiz*8],dl
     327:	01 00                	add    DWORD PTR [eax],eax
     329:	00 01                	add    BYTE PTR [ecx],al
     32b:	3a 8c 00 00 00 02 91 	cmp    cl,BYTE PTR [eax+eax*1-0x6efe0000]
     332:	5c                   	pop    esp
     333:	12 70 69             	adc    dh,BYTE PTR [eax+0x69]
     336:	64 00 01             	add    BYTE PTR fs:[ecx],al
     339:	3c 3a                	cmp    al,0x3a
     33b:	00 00                	add    BYTE PTR [eax],al
     33d:	00 02                	add    BYTE PTR [edx],al
     33f:	91                   	xchg   ecx,eax
     340:	6c                   	ins    BYTE PTR es:[edi],dx
     341:	11 f9                	adc    ecx,edi
     343:	01 10                	add    DWORD PTR [eax],edx
     345:	03 41 00             	add    eax,DWORD PTR [ecx+0x0]
     348:	00 00                	add    BYTE PTR [eax],al
     34a:	12 72 65             	adc    dh,BYTE PTR [edx+0x65]
     34d:	74 00                	je     34f <cmdClearScreen-0x30ffcb1>
     34f:	01 44 60 03          	add    DWORD PTR [eax+eiz*2+0x3],eax
     353:	00 00                	add    BYTE PTR [eax],al
     355:	02 91 62 00 00 0e    	add    dl,BYTE PTR [ecx+0xe000062]
     35b:	04 f9                	add    al,0xf9
     35d:	01 00                	add    DWORD PTR [eax],eax
     35f:	00 16                	add    BYTE PTR [esi],dl
     361:	25 00 00 00 70       	and    eax,0x70000000
     366:	03 00                	add    eax,DWORD PTR [eax]
     368:	00 17                	add    BYTE PTR [edi],dl
     36a:	95                   	xchg   ebp,eax
     36b:	00 00                	add    BYTE PTR [eax],al
     36d:	00 09                	add    BYTE PTR [ecx],cl
     36f:	00 18                	add    BYTE PTR [eax],bl
     371:	3c 01                	cmp    al,0x1
     373:	00 00                	add    BYTE PTR [eax],al
     375:	01 4e 3a             	add    DWORD PTR [esi+0x3a],ecx
     378:	00 00                	add    BYTE PTR [eax],al
     37a:	00 50 02             	add    BYTE PTR [eax+0x2],dl
     37d:	10 03                	adc    BYTE PTR [ebx],al
     37f:	cb                   	retf   
     380:	01 00                	add    DWORD PTR [eax],eax
     382:	00 01                	add    BYTE PTR [ecx],al
     384:	9c                   	pushf  
     385:	66                   	data16
     386:	04 00                	add    al,0x0
     388:	00 14 99             	add    BYTE PTR [ecx+ebx*4],dl
     38b:	00 00                	add    BYTE PTR [eax],al
     38d:	00 01                	add    BYTE PTR [ecx],al
     38f:	4e                   	dec    esi
     390:	f9                   	stc    
     391:	01 00                	add    DWORD PTR [eax],eax
     393:	00 02                	add    BYTE PTR [edx],al
     395:	91                   	xchg   ecx,eax
     396:	00 15 e2 01 00 00    	add    BYTE PTR ds:0x1e2,dl
     39c:	01 50 8c             	add    DWORD PTR [eax-0x74],edx
     39f:	00 00                	add    BYTE PTR [eax],al
     3a1:	00 02                	add    BYTE PTR [edx],al
     3a3:	91                   	xchg   ecx,eax
     3a4:	6f                   	outs   dx,DWORD PTR ds:[esi]
     3a5:	15 38 02 00 00       	adc    eax,0x238
     3aa:	01 51 3a             	add    DWORD PTR [ecx+0x3a],edx
     3ad:	00 00                	add    BYTE PTR [eax],al
     3af:	00 02                	add    BYTE PTR [edx],al
     3b1:	91                   	xchg   ecx,eax
     3b2:	64 19 74 6f 6b       	sbb    DWORD PTR fs:[edi+ebp*2+0x6b],esi
     3b7:	00 01                	add    BYTE PTR [ecx],al
     3b9:	52                   	push   edx
     3ba:	f9                   	stc    
     3bb:	01 00                	add    DWORD PTR [eax],eax
     3bd:	00 12                	add    BYTE PTR [edx],dl
     3bf:	70 67                	jo     428 <cmdClearScreen-0x30ffbd8>
     3c1:	6d                   	ins    DWORD PTR es:[edi],dx
     3c2:	00 01                	add    BYTE PTR [ecx],al
     3c4:	53                   	push   ebx
     3c5:	f9                   	stc    
     3c6:	01 00                	add    DWORD PTR [eax],eax
     3c8:	00 02                	add    BYTE PTR [edx],al
     3ca:	91                   	xchg   ecx,eax
     3cb:	60                   	pusha  
     3cc:	15 2c 02 00 00       	adc    eax,0x22c
     3d1:	01 55 cc             	add    DWORD PTR [ebp-0x34],edx
     3d4:	02 00                	add    al,BYTE PTR [eax]
     3d6:	00 03                	add    BYTE PTR [ebx],al
     3d8:	91                   	xchg   ecx,eax
     3d9:	cc                   	int3   
     3da:	75 15                	jne    3f1 <cmdClearScreen-0x30ffc0f>
     3dc:	84 01                	test   BYTE PTR [ecx],al
     3de:	00 00                	add    BYTE PTR [eax],al
     3e0:	01 56 3a             	add    DWORD PTR [esi+0x3a],edx
     3e3:	00 00                	add    BYTE PTR [eax],al
     3e5:	00 02                	add    BYTE PTR [edx],al
     3e7:	91                   	xchg   ecx,eax
     3e8:	5c                   	pop    esp
     3e9:	15 18 00 00 00       	adc    eax,0x18
     3ee:	01 57 3a             	add    DWORD PTR [edi+0x3a],edx
     3f1:	00 00                	add    BYTE PTR [eax],al
     3f3:	00 02                	add    BYTE PTR [edx],al
     3f5:	91                   	xchg   ecx,eax
     3f6:	58                   	pop    eax
     3f7:	15 8f 01 00 00       	adc    eax,0x18f
     3fc:	01 58 3a             	add    DWORD PTR [eax+0x3a],ebx
     3ff:	00 00                	add    BYTE PTR [eax],al
     401:	00 02                	add    BYTE PTR [edx],al
     403:	91                   	xchg   ecx,eax
     404:	54                   	push   esp
     405:	15 8f 04 00 00       	adc    eax,0x48f
     40a:	01 5d 3a             	add    DWORD PTR [ebp+0x3a],ebx
     40d:	00 00                	add    BYTE PTR [eax],al
     40f:	00 03                	add    BYTE PTR [ebx],al
     411:	91                   	xchg   ecx,eax
     412:	c8 75 15 d4          	enter  0x1575,0xd4
     416:	04 00                	add    al,0x0
     418:	00 01                	add    BYTE PTR [ecx],al
     41a:	5e                   	pop    esi
     41b:	5a                   	pop    edx
     41c:	03 00                	add    eax,DWORD PTR [eax]
     41e:	00 02                	add    BYTE PTR [edx],al
     420:	91                   	xchg   ecx,eax
     421:	50                   	push   eax
     422:	1a 1e                	sbb    bl,BYTE PTR [esi]
     424:	03 10                	add    edx,DWORD PTR [eax]
     426:	03 4d 00             	add    ecx,DWORD PTR [ebp+0x0]
     429:	00 00                	add    BYTE PTR [eax],al
     42b:	4c                   	dec    esp
     42c:	04 00                	add    al,0x0
     42e:	00 15 6e 01 00 00    	add    BYTE PTR ds:0x16e,dl
     434:	01 6f 3a             	add    DWORD PTR [edi+0x3a],ebp
     437:	00 00                	add    BYTE PTR [eax],al
     439:	00 02                	add    BYTE PTR [edx],al
     43b:	91                   	xchg   ecx,eax
     43c:	68 15 d9 01 00       	push   0x1d915
     441:	00 01                	add    BYTE PTR [ecx],al
     443:	70 3a                	jo     47f <cmdClearScreen-0x30ffb81>
     445:	00 00                	add    BYTE PTR [eax],al
     447:	00 02                	add    BYTE PTR [edx],al
     449:	91                   	xchg   ecx,eax
     44a:	4c                   	dec    esp
     44b:	00 11                	add    BYTE PTR [ecx],dl
     44d:	8b 03                	mov    eax,DWORD PTR [ebx]
     44f:	10 03                	adc    BYTE PTR [ebx],al
     451:	72 00                	jb     453 <cmdClearScreen-0x30ffbad>
     453:	00 00                	add    BYTE PTR [eax],al
     455:	12 72 65             	adc    dh,BYTE PTR [edx+0x65]
     458:	74 00                	je     45a <cmdClearScreen-0x30ffba6>
     45a:	01 84 60 03 00 00 03 	add    DWORD PTR [eax+eiz*2+0x3000003],eax
     461:	91                   	xchg   ecx,eax
     462:	be 75 00 00 13       	mov    esi,0x13000075
     467:	d7                   	xlat   BYTE PTR ds:[ebx]
     468:	02 00                	add    al,BYTE PTR [eax]
     46a:	00 01                	add    BYTE PTR [ecx],al
     46c:	8e 1b                	mov    ds,WORD PTR [ebx]
     46e:	04 10                	add    al,0x10
     470:	03 3e                	add    edi,DWORD PTR [esi]
     472:	00 00                	add    BYTE PTR [eax],al
     474:	00 01                	add    BYTE PTR [ecx],al
     476:	9c                   	pushf  
     477:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
     478:	04 00                	add    al,0x0
     47a:	00 14 99             	add    BYTE PTR [ecx+ebx*4],dl
     47d:	00 00                	add    BYTE PTR [eax],al
     47f:	00 01                	add    BYTE PTR [ecx],al
     481:	8e f9                	mov    ?,ecx
     483:	01 00                	add    DWORD PTR [eax],eax
     485:	00 02                	add    BYTE PTR [edx],al
     487:	91                   	xchg   ecx,eax
     488:	00 15 31 01 00 00    	add    BYTE PTR ds:0x131,dl
     48e:	01 90 61 00 00 00    	add    DWORD PTR [eax+0x61],edx
     494:	02 91 6c 15 b7 02    	add    dl,BYTE PTR [ecx+0x2b7156c]
     49a:	00 00                	add    BYTE PTR [eax],al
     49c:	01 90 61 00 00 00    	add    DWORD PTR [eax+0x61],edx
     4a2:	02 91 68 00 13 22    	add    dl,BYTE PTR [ecx+0x22130068]
     4a8:	02 00                	add    al,BYTE PTR [eax]
     4aa:	00 01                	add    BYTE PTR [ecx],al
     4ac:	99                   	cdq    
     4ad:	59                   	pop    ecx
     4ae:	04 10                	add    al,0x10
     4b0:	03 c7                	add    eax,edi
     4b2:	00 00                	add    BYTE PTR [eax],al
     4b4:	00 01                	add    BYTE PTR [ecx],al
     4b6:	9c                   	pushf  
     4b7:	16                   	push   ss
     4b8:	05 00 00 14 99       	add    eax,0x99140000
     4bd:	00 00                	add    BYTE PTR [eax],al
     4bf:	00 01                	add    BYTE PTR [ecx],al
     4c1:	99                   	cdq    
     4c2:	f9                   	stc    
     4c3:	01 00                	add    DWORD PTR [eax],eax
     4c5:	00 02                	add    BYTE PTR [edx],al
     4c7:	91                   	xchg   ecx,eax
     4c8:	00 15 8f 04 00 00    	add    BYTE PTR ds:0x48f,dl
     4ce:	01 9b 3a 00 00 00    	add    DWORD PTR [ebx+0x3a],ebx
     4d4:	02 91 5c 15 d4 04    	add    dl,BYTE PTR [ecx+0x4d4155c]
     4da:	00 00                	add    BYTE PTR [eax],al
     4dc:	01 9c 5a 03 00 00 02 	add    DWORD PTR [edx+ebx*2+0x2000003],ebx
     4e3:	91                   	xchg   ecx,eax
     4e4:	60                   	pusha  
     4e5:	15 90 01 00 00       	adc    eax,0x190
     4ea:	01 9d 3a 00 00 00    	add    DWORD PTR [ebp+0x3a],ebx
     4f0:	02 91 64 15 17 02    	add    dl,BYTE PTR [ecx+0x2171564]
     4f6:	00 00                	add    BYTE PTR [eax],al
     4f8:	01 9e f9 01 00 00    	add    DWORD PTR [esi+0x1f9],ebx
     4fe:	02 91 6c 1b 00 00    	add    dl,BYTE PTR [ecx+0x1b6c]
     504:	00 00                	add    BYTE PTR [eax],al
     506:	12 63 6e             	adc    ah,BYTE PTR [ebx+0x6e]
     509:	74 00                	je     50b <cmdClearScreen-0x30ffaf5>
     50b:	01 aa 3a 00 00 00    	add    DWORD PTR [edx+0x3a],ebp
     511:	02 91 68 00 00 13    	add    dl,BYTE PTR [ecx+0x13000068]
     517:	88 00                	mov    BYTE PTR [eax],al
     519:	00 00                	add    BYTE PTR [eax],al
     51b:	01 b8 20 05 10 03    	add    DWORD PTR [eax+0x3100520],edi
     521:	17                   	pop    ss
     522:	00 00                	add    BYTE PTR [eax],al
     524:	00 01                	add    BYTE PTR [ecx],al
     526:	9c                   	pushf  
     527:	3a 05 00 00 14 99    	cmp    al,BYTE PTR ds:0x99140000
     52d:	00 00                	add    BYTE PTR [eax],al
     52f:	00 01                	add    BYTE PTR [ecx],al
     531:	b8 f9 01 00 00       	mov    eax,0x1f9
     536:	02 91 00 00 13 2f    	add    dl,BYTE PTR [ecx+0x2f130000]
     53c:	00 00                	add    BYTE PTR [eax],al
     53e:	00 01                	add    BYTE PTR [ecx],al
     540:	bd 37 05 10 03       	mov    ebp,0x3100537
     545:	58                   	pop    eax
     546:	00 00                	add    BYTE PTR [eax],al
     548:	00 01                	add    BYTE PTR [ecx],al
     54a:	9c                   	pushf  
     54b:	6d                   	ins    DWORD PTR es:[edi],dx
     54c:	05 00 00 14 99       	add    eax,0x99140000
     551:	00 00                	add    BYTE PTR [eax],al
     553:	00 01                	add    BYTE PTR [ecx],al
     555:	bd f9 01 00 00       	mov    ebp,0x1f9
     55a:	02 91 00 15 2c 02    	add    dl,BYTE PTR [ecx+0x22c1500]
     560:	00 00                	add    BYTE PTR [eax],al
     562:	01 bf cc 02 00 00    	add    DWORD PTR [edi+0x2cc],edi
     568:	03 91 f0 75 00 13    	add    edx,DWORD PTR [ecx+0x130075f0]
     56e:	4e                   	dec    esi
     56f:	02 00                	add    al,BYTE PTR [eax]
     571:	00 01                	add    BYTE PTR [ecx],al
     573:	ca 8f 05             	retf   0x58f
     576:	10 03                	adc    BYTE PTR [ebx],al
     578:	ce                   	into   
     579:	00 00                	add    BYTE PTR [eax],al
     57b:	00 01                	add    BYTE PTR [ecx],al
     57d:	9c                   	pushf  
     57e:	b7 05                	mov    bh,0x5
     580:	00 00                	add    BYTE PTR [eax],al
     582:	14 99                	adc    al,0x99
     584:	00 00                	add    BYTE PTR [eax],al
     586:	00 01                	add    BYTE PTR [ecx],al
     588:	ca f9 01             	retf   0x1f9
     58b:	00 00                	add    BYTE PTR [eax],al
     58d:	02 91 00 12 74 6f    	add    dl,BYTE PTR [ecx+0x6f741200]
     593:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
     596:	cc                   	int3   
     597:	f9                   	stc    
     598:	01 00                	add    DWORD PTR [eax],eax
     59a:	00 02                	add    BYTE PTR [edx],al
     59c:	91                   	xchg   ecx,eax
     59d:	68 11 be 05 10       	push   0x1005be11
     5a2:	03 9c 00 00 00 12 63 	add    ebx,DWORD PTR [eax+eax*1+0x63120000]
     5a9:	6e                   	outs   dx,BYTE PTR ds:[esi]
     5aa:	74 00                	je     5ac <cmdClearScreen-0x30ffa54>
     5ac:	01 d6                	add    esi,edx
     5ae:	6c                   	ins    BYTE PTR es:[edi],dx
     5af:	00 00                	add    BYTE PTR [eax],al
     5b1:	00 02                	add    BYTE PTR [edx],al
     5b3:	91                   	xchg   ecx,eax
     5b4:	6c                   	ins    BYTE PTR es:[edi],dx
     5b5:	00 00                	add    BYTE PTR [eax],al
     5b7:	10 10                	adc    BYTE PTR [eax],dl
     5b9:	01 00                	add    DWORD PTR [eax],eax
     5bb:	00 01                	add    BYTE PTR [ecx],al
     5bd:	e3 5d                	jecxz  61c <cmdClearScreen-0x30ff9e4>
     5bf:	06                   	push   es
     5c0:	10 03                	adc    BYTE PTR [ebx],al
     5c2:	4e                   	dec    esi
     5c3:	00 00                	add    BYTE PTR [eax],al
     5c5:	00 01                	add    BYTE PTR [ecx],al
     5c7:	9c                   	pushf  
     5c8:	db 05 00 00 12 62    	fild   DWORD PTR ds:0x62120000
     5ce:	75 66                	jne    636 <cmdClearScreen-0x30ff9ca>
     5d0:	00 01                	add    BYTE PTR [ecx],al
     5d2:	e5 f9                	in     eax,0xf9
     5d4:	01 00                	add    DWORD PTR [eax],eax
     5d6:	00 02                	add    BYTE PTR [edx],al
     5d8:	91                   	xchg   ecx,eax
     5d9:	6c                   	ins    BYTE PTR es:[edi],dx
     5da:	00 13                	add    BYTE PTR [ebx],dl
     5dc:	56                   	push   esi
     5dd:	00 00                	add    BYTE PTR [eax],al
     5df:	00 01                	add    BYTE PTR [ecx],al
     5e1:	ea ab 06 10 03 11 01 	jmp    0x111:0x31006ab
     5e8:	00 00                	add    BYTE PTR [eax],al
     5ea:	01 9c 6d 06 00 00 14 	add    DWORD PTR [ebp+ebp*2+0x14000006],ebx
     5f1:	99                   	cdq    
     5f2:	00 00                	add    BYTE PTR [eax],al
     5f4:	00 01                	add    BYTE PTR [ecx],al
     5f6:	ea f9 01 00 00 02 91 	jmp    0x9102:0x1f9
     5fd:	00 15 2c 02 00 00    	add    BYTE PTR ds:0x22c,dl
     603:	01 ec                	add    esp,ebp
     605:	cc                   	int3   
     606:	02 00                	add    al,BYTE PTR [eax]
     608:	00 03                	add    BYTE PTR [ebx],al
     60a:	91                   	xchg   ecx,eax
     60b:	d8 75 15             	fdiv   DWORD PTR [ebp+0x15]
     60e:	84 01                	test   BYTE PTR [ecx],al
     610:	00 00                	add    BYTE PTR [eax],al
     612:	01 ed                	add    ebp,ebp
     614:	3a 00                	cmp    al,BYTE PTR [eax]
     616:	00 00                	add    BYTE PTR [eax],al
     618:	02 91 64 15 fa 02    	add    dl,BYTE PTR [ecx+0x2fa1564]
     61e:	00 00                	add    BYTE PTR [eax],al
     620:	01 f0                	add    eax,esi
     622:	3a 00                	cmp    al,BYTE PTR [eax]
     624:	00 00                	add    BYTE PTR [eax],al
     626:	02 91 60 15 ed 02    	add    dl,BYTE PTR [ecx+0x2ed1560]
     62c:	00 00                	add    BYTE PTR [eax],al
     62e:	01 f1                	add    ecx,esi
     630:	6d                   	ins    DWORD PTR es:[edi],dx
     631:	06                   	push   es
     632:	00 00                	add    BYTE PTR [eax],al
     634:	03 91 58 06 1a 15    	add    edx,DWORD PTR [ecx+0x151a0658]
     63a:	07                   	pop    es
     63b:	10 03                	adc    BYTE PTR [ebx],al
     63d:	21 00                	and    DWORD PTR [eax],eax
     63f:	00 00                	add    BYTE PTR [eax],al
     641:	54                   	push   esp
     642:	06                   	push   es
     643:	00 00                	add    BYTE PTR [eax],al
     645:	12 63 6e             	adc    ah,BYTE PTR [ebx+0x6e]
     648:	74 00                	je     64a <cmdClearScreen-0x30ff9b6>
     64a:	01 f3                	add    ebx,esi
     64c:	3a 00                	cmp    al,BYTE PTR [eax]
     64e:	00 00                	add    BYTE PTR [eax],al
     650:	02 91 6c 00 11 36    	add    dl,BYTE PTR [ecx+0x3611006c]
     656:	07                   	pop    es
     657:	10 03                	adc    BYTE PTR [ebx],al
     659:	33 00                	xor    eax,DWORD PTR [eax]
     65b:	00 00                	add    BYTE PTR [eax],al
     65d:	12 63 6e             	adc    ah,BYTE PTR [ebx+0x6e]
     660:	74 00                	je     662 <cmdClearScreen-0x30ff99e>
     662:	01 f6                	add    esi,esi
     664:	3a 00                	cmp    al,BYTE PTR [eax]
     666:	00 00                	add    BYTE PTR [eax],al
     668:	02 91 68 00 00 16    	add    dl,BYTE PTR [ecx+0x16000068]
     66e:	3a 00                	cmp    al,BYTE PTR [eax]
     670:	00 00                	add    BYTE PTR [eax],al
     672:	80 06 00             	add    BYTE PTR [esi],0x0
     675:	00 1c 95 00 00 00 03 	add    BYTE PTR [edx*4+0x3000000],bl
     67c:	91                   	xchg   ecx,eax
     67d:	5c                   	pop    esp
     67e:	06                   	push   es
     67f:	00 16                	add    BYTE PTR [esi],dl
     681:	ff 01                	inc    DWORD PTR [ecx]
     683:	00 00                	add    BYTE PTR [eax],al
     685:	90                   	nop
     686:	06                   	push   es
     687:	00 00                	add    BYTE PTR [eax],al
     689:	17                   	pop    ss
     68a:	95                   	xchg   ebp,eax
     68b:	00 00                	add    BYTE PTR [eax],al
     68d:	00 09                	add    BYTE PTR [ecx],cl
     68f:	00 15 2c 01 00 00    	add    BYTE PTR ds:0x12c,dl
     695:	04 38                	add    al,0x38
     697:	80 06 00             	add    BYTE PTR [esi],0x0
     69a:	00 05 03 c0 21 10    	add    BYTE PTR ds:0x1021c003,al
     6a0:	03 1d 05 03 00 00    	add    ebx,DWORD PTR ds:0x305
     6a6:	05 34 61 00 00       	add    eax,0x6134
     6ab:	00 05 03 4c 27 10    	add    BYTE PTR ds:0x10274c03,al
     6b1:	03 1d f6 01 00 00    	add    ebx,DWORD PTR ds:0x1f6
     6b7:	05 35 61 00 00       	add    eax,0x6135
     6bc:	00 05 03 50 27 10    	add    BYTE PTR ds:0x10275003,al
     6c2:	03 1d 6b 00 00 00    	add    ebx,DWORD PTR ds:0x6b
     6c8:	05 36 61 00 00       	add    eax,0x6136
     6cd:	00 05 03 48 27 10    	add    BYTE PTR ds:0x10274803,al
     6d3:	03 1d 3b 03 00 00    	add    ebx,DWORD PTR ds:0x33b
     6d9:	05 37 85 00 00       	add    eax,0x8537
     6de:	00 05 03 70 27 10    	add    BYTE PTR ds:0x10277003,al
     6e4:	03 1d 8f 02 00 00    	add    ebx,DWORD PTR ds:0x28f
     6ea:	06                   	push   es
     6eb:	50                   	push   eax
     6ec:	5a                   	pop    edx
     6ed:	03 00                	add    eax,DWORD PTR [eax]
     6ef:	00 05 03 60 27 10    	add    BYTE PTR ds:0x10276003,al
     6f5:	03 1d 56 03 00 00    	add    ebx,DWORD PTR ds:0x356
     6fb:	03 63 1d             	add    esp,DWORD PTR [ebx+0x1d]
     6fe:	01 00                	add    DWORD PTR [eax],eax
     700:	00 05 03 58 27 10    	add    BYTE PTR ds:0x10275803,al
     706:	03 1d 13 03 00 00    	add    ebx,DWORD PTR ds:0x313
     70c:	03 e1                	add    esp,ecx
     70e:	6c                   	ins    BYTE PTR es:[edi],dx
     70f:	01 00                	add    DWORD PTR [eax],eax
     711:	00 05 03 44 27 10    	add    BYTE PTR ds:0x10274403,al
     717:	03 1e                	add    ebx,DWORD PTR [esi]
     719:	1d 5d 01 00 00       	sbb    eax,0x15d
     71e:	04 26                	add    al,0x26
     720:	2a 07                	sub    al,BYTE PTR [edi]
     722:	00 00                	add    BYTE PTR [eax],al
     724:	05 03 54 27 10       	add    eax,0x10275403
     729:	03 0e                	add    ecx,DWORD PTR [esi]
     72b:	04 18                	add    al,0x18
     72d:	07                   	pop    es
     72e:	00 00                	add    BYTE PTR [eax],al
     730:	1f                   	pop    ds
     731:	3b 07                	cmp    eax,DWORD PTR [edi]
     733:	00 00                	add    BYTE PTR [eax],al
     735:	20 f9                	and    cl,bh
     737:	01 00                	add    DWORD PTR [eax],eax
     739:	00 00                	add    BYTE PTR [eax],al
     73b:	1d bc 01 00 00       	sbb    eax,0x1bc
     740:	04 27                	add    al,0x27
     742:	4c                   	dec    esp
     743:	07                   	pop    es
     744:	00 00                	add    BYTE PTR [eax],al
     746:	05 03 40 27 10       	add    eax,0x10274003
     74b:	03 0e                	add    ecx,DWORD PTR [esi]
     74d:	04 30                	add    al,0x30
     74f:	07                   	pop    es
     750:	00 00                	add    BYTE PTR [eax],al
     752:	16                   	push   ss
     753:	25 00 00 00 63       	and    eax,0x63000000
     758:	07                   	pop    es
     759:	00 00                	add    BYTE PTR [eax],al
     75b:	21 95 00 00 00 ff    	and    DWORD PTR [ebp-0x1000000],edx
     761:	01 00                	add    DWORD PTR [eax],eax
     763:	1d ff 01 00 00       	sbb    eax,0x1ff
     768:	04 2f                	add    al,0x2f
     76a:	52                   	push   edx
     76b:	07                   	pop    es
     76c:	00 00                	add    BYTE PTR [eax],al
     76e:	05 03 40 25 10       	add    eax,0x10254003
     773:	03 1d 75 03 00 00    	add    ebx,DWORD PTR ds:0x375
     779:	04 30                	add    al,0x30
     77b:	f9                   	stc    
     77c:	01 00                	add    DWORD PTR [eax],eax
     77e:	00 05 03 6c 27 10    	add    BYTE PTR ds:0x10276c03,al
     784:	03 1d 00 00 00 00    	add    ebx,DWORD PTR ds:0x0
     78a:	04 31                	add    al,0x31
     78c:	5a                   	pop    edx
     78d:	03 00                	add    eax,DWORD PTR [eax]
     78f:	00 05 03 2c 24 10    	add    BYTE PTR ds:0x10242c03,al
     795:	03 16                	add    edx,DWORD PTR [esi]
     797:	25 00 00 00 a6       	and    eax,0xa6000000
     79c:	07                   	pop    es
     79d:	00 00                	add    BYTE PTR [eax],al
     79f:	17                   	pop    ss
     7a0:	95                   	xchg   ebp,eax
     7a1:	00 00                	add    BYTE PTR [eax],al
     7a3:	00 05 00 1d 11 02    	add    BYTE PTR ds:0x2111d00,al
     7a9:	00 00                	add    BYTE PTR [eax],al
     7ab:	04 32                	add    al,0x32
     7ad:	96                   	xchg   esi,eax
     7ae:	07                   	pop    es
     7af:	00 00                	add    BYTE PTR [eax],al
     7b1:	05 03 24 24 10       	add    eax,0x10242403
     7b6:	03 1d 9b 02 00 00    	add    ebx,DWORD PTR ds:0x29b
     7bc:	04 33                	add    al,0x33
     7be:	61                   	popa   
     7bf:	00 00                	add    BYTE PTR [eax],al
     7c1:	00 05 03 68 27 10    	add    BYTE PTR ds:0x10276803,al
     7c7:	03 1d 7e 02 00 00    	add    ebx,DWORD PTR ds:0x27e
     7cd:	04 33                	add    al,0x33
     7cf:	61                   	popa   
     7d0:	00 00                	add    BYTE PTR [eax],al
     7d2:	00 05 03 64 27 10    	add    BYTE PTR ds:0x10276403,al
     7d8:	03 1d 21 01 00 00    	add    ebx,DWORD PTR ds:0x121
     7de:	04 34                	add    al,0x34
     7e0:	8c 00                	mov    WORD PTR [eax],es
     7e2:	00 00                	add    BYTE PTR [eax],al
     7e4:	05 03 74 27 10       	add    eax,0x10277403
     7e9:	03 16                	add    edx,DWORD PTR [esi]
     7eb:	25 00 00 00 fa       	and    eax,0xfa000000
     7f0:	07                   	pop    es
     7f1:	00 00                	add    BYTE PTR [eax],al
     7f3:	17                   	pop    ss
     7f4:	95                   	xchg   ebp,eax
     7f5:	00 00                	add    BYTE PTR [eax],al
     7f7:	00 ff                	add    bh,bh
     7f9:	00 22                	add    BYTE PTR [edx],ah
     7fb:	63 77 64             	arpl   WORD PTR [edi+0x64],si
     7fe:	00 04 35 ea 07 00 00 	add    BYTE PTR [esi*1+0x7ea],al
     805:	05 03 40 24 10       	add    eax,0x10244003
     80a:	03 1d 96 01 00 00    	add    ebx,DWORD PTR ds:0x196
     810:	04 36                	add    al,0x36
     812:	8c 00                	mov    WORD PTR [eax],es
     814:	00 00                	add    BYTE PTR [eax],al
     816:	05 03 20 24 10       	add    eax,0x10242003
     81b:	03 00                	add    eax,DWORD PTR [eax]
     81d:	8c 08                	mov    WORD PTR [eax],cs
     81f:	00 00                	add    BYTE PTR [eax],al
     821:	04 00                	add    al,0x0
     823:	c9                   	leave  
     824:	01 00                	add    DWORD PTR [eax],eax
     826:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     829:	a1 00 00 00 0c       	mov    eax,ds:0xc000000
     82e:	01 05 00 00 37 00    	add    DWORD PTR ds:0x370000,eax
     834:	00 00                	add    BYTE PTR [eax],al
     836:	bc 07 10 03 24       	mov    esp,0x24031007
     83b:	0b 00                	or     eax,DWORD PTR [eax]
     83d:	00 47 02             	add    BYTE PTR [edi+0x2],al
     840:	00 00                	add    BYTE PTR [eax],al
     842:	02 01                	add    al,BYTE PTR [ecx]
     844:	06                   	push   es
     845:	49                   	dec    ecx
     846:	02 00                	add    al,BYTE PTR [eax]
     848:	00 02                	add    BYTE PTR [edx],al
     84a:	01 06                	add    DWORD PTR [esi],eax
     84c:	42                   	inc    edx
     84d:	02 00                	add    al,BYTE PTR [eax]
     84f:	00 02                	add    BYTE PTR [edx],al
     851:	02 05 17 01 00 00    	add    al,BYTE PTR ds:0x117
     857:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     85e:	02 08                	add    cl,BYTE PTR [eax]
     860:	05 a6 01 00 00       	add    eax,0x1a6
     865:	04 42                	add    al,0x42
     867:	01 00                	add    DWORD PTR [eax],eax
     869:	00 02                	add    BYTE PTR [edx],al
     86b:	2e                   	cs
     86c:	53                   	push   ebx
     86d:	00 00                	add    BYTE PTR [eax],al
     86f:	00 02                	add    BYTE PTR [edx],al
     871:	01 08                	add    DWORD PTR [eax],ecx
     873:	40                   	inc    eax
     874:	02 00                	add    al,BYTE PTR [eax]
     876:	00 02                	add    BYTE PTR [edx],al
     878:	02 07                	add    al,BYTE PTR [edi]
     87a:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
     87b:	02 00                	add    al,BYTE PTR [eax]
     87d:	00 04 75 02 00 00 02 	add    BYTE PTR [esi*2+0x2000002],al
     884:	34 6c                	xor    al,0x6c
     886:	00 00                	add    BYTE PTR [eax],al
     888:	00 02                	add    BYTE PTR [edx],al
     88a:	04 07                	add    al,0x7
     88c:	60                   	pusha  
     88d:	02 00                	add    al,BYTE PTR [eax]
     88f:	00 02                	add    BYTE PTR [edx],al
     891:	08 07                	or     BYTE PTR [edi],al
     893:	56                   	push   esi
     894:	02 00                	add    al,BYTE PTR [eax]
     896:	00 02                	add    BYTE PTR [edx],al
     898:	04 05                	add    al,0x5
     89a:	ab                   	stos   DWORD PTR es:[edi],eax
     89b:	01 00                	add    DWORD PTR [eax],eax
     89d:	00 05 04 87 00 00    	add    BYTE PTR ds:0x8704,al
     8a3:	00 06                	add    BYTE PTR [esi],al
     8a5:	25 00 00 00 02       	and    eax,0x2000000
     8aa:	01 02                	add    DWORD PTR [edx],eax
     8ac:	df 02                	fild   WORD PTR [edx]
     8ae:	00 00                	add    BYTE PTR [eax],al
     8b0:	07                   	pop    es
     8b1:	04 02                	add    al,0x2
     8b3:	04 07                	add    al,0x7
     8b5:	7f 00                	jg     8b7 <cmdClearScreen-0x30ff749>
     8b7:	00 00                	add    BYTE PTR [eax],al
     8b9:	08 05 03 58 1d 01    	or     BYTE PTR ds:0x11d5803,al
     8bf:	00 00                	add    BYTE PTR [eax],al
     8c1:	09 88 03 00 00 03    	or     DWORD PTR [eax+0x3000003],ecx
     8c7:	59                   	pop    ecx
     8c8:	48                   	dec    eax
     8c9:	00 00                	add    BYTE PTR [eax],al
     8cb:	00 01                	add    BYTE PTR [ecx],al
     8cd:	04 04                	add    al,0x4
     8cf:	00 09                	add    BYTE PTR [ecx],cl
     8d1:	c1 02 00             	rol    DWORD PTR [edx],0x0
     8d4:	00 03                	add    BYTE PTR [ebx],al
     8d6:	5a                   	pop    edx
     8d7:	48                   	dec    eax
     8d8:	00 00                	add    BYTE PTR [eax],al
     8da:	00 01                	add    BYTE PTR [ecx],al
     8dc:	04 00                	add    al,0x0
     8de:	00 09                	add    BYTE PTR [ecx],cl
     8e0:	6e                   	outs   dx,BYTE PTR ds:[esi]
     8e1:	02 00                	add    al,BYTE PTR [eax]
     8e3:	00 03                	add    BYTE PTR [ebx],al
     8e5:	5b                   	pop    ebx
     8e6:	48                   	dec    eax
     8e7:	00 00                	add    BYTE PTR [eax],al
     8e9:	00 01                	add    BYTE PTR [ecx],al
     8eb:	04 04                	add    al,0x4
     8ed:	01 09                	add    DWORD PTR [ecx],ecx
     8ef:	83 00 00             	add    DWORD PTR [eax],0x0
     8f2:	00 03                	add    BYTE PTR [ebx],al
     8f4:	5c                   	pop    esp
     8f5:	48                   	dec    eax
     8f6:	00 00                	add    BYTE PTR [eax],al
     8f8:	00 01                	add    BYTE PTR [ecx],al
     8fa:	02 02                	add    al,BYTE PTR [edx]
     8fc:	01 09                	add    DWORD PTR [ecx],ecx
     8fe:	cf                   	iret   
     8ff:	01 00                	add    DWORD PTR [eax],eax
     901:	00 03                	add    BYTE PTR [ebx],al
     903:	5d                   	pop    ebp
     904:	48                   	dec    eax
     905:	00 00                	add    BYTE PTR [eax],al
     907:	00 01                	add    BYTE PTR [ecx],al
     909:	02 00                	add    al,BYTE PTR [eax]
     90b:	01 09                	add    DWORD PTR [ecx],ecx
     90d:	c0 02 00             	rol    BYTE PTR [edx],0x0
     910:	00 03                	add    BYTE PTR [ebx],al
     912:	5e                   	pop    esi
     913:	48                   	dec    eax
     914:	00 00                	add    BYTE PTR [eax],al
     916:	00 01                	add    BYTE PTR [ecx],al
     918:	04 04                	add    al,0x4
     91a:	02 09                	add    cl,BYTE PTR [ecx]
     91c:	6d                   	ins    DWORD PTR es:[edi],dx
     91d:	02 00                	add    al,BYTE PTR [eax]
     91f:	00 03                	add    BYTE PTR [ebx],al
     921:	5f                   	pop    edi
     922:	48                   	dec    eax
     923:	00 00                	add    BYTE PTR [eax],al
     925:	00 01                	add    BYTE PTR [ecx],al
     927:	08 00                	or     BYTE PTR [eax],al
     929:	03 09                	add    ecx,DWORD PTR [ecx]
     92b:	d4 01                	aam    0x1
     92d:	00 00                	add    BYTE PTR [eax],al
     92f:	03 60 48             	add    esp,DWORD PTR [eax+0x48]
     932:	00 00                	add    BYTE PTR [eax],al
     934:	00 01                	add    BYTE PTR [ecx],al
     936:	04 04                	add    al,0x4
     938:	04 00                	add    al,0x0
     93a:	0a 08                	or     cl,BYTE PTR [eax]
     93c:	03 56 36             	add    edx,DWORD PTR [esi+0x36]
     93f:	01 00                	add    DWORD PTR [eax],eax
     941:	00 0b                	add    BYTE PTR [ebx],cl
     943:	9c                   	pushf  
     944:	00 00                	add    BYTE PTR [eax],al
     946:	00 0c 72             	add    BYTE PTR [edx+esi*2],cl
     949:	65 67 00 03          	add    BYTE PTR gs:[bp+di],al
     94d:	62 61 00             	bound  esp,QWORD PTR [ecx+0x0]
     950:	00 00                	add    BYTE PTR [eax],al
     952:	00 08                	add    BYTE PTR [eax],cl
     954:	04 03                	add    al,0x3
     956:	db 6c 01 00          	fld    TBYTE PTR [ecx+eax*1+0x0]
     95a:	00 09                	add    BYTE PTR [ecx],cl
     95c:	2f                   	das    
     95d:	03 00                	add    eax,DWORD PTR [eax]
     95f:	00 03                	add    BYTE PTR [ebx],al
     961:	dc 48 00             	fmul   QWORD PTR [eax+0x0]
     964:	00 00                	add    BYTE PTR [eax],al
     966:	01 01                	add    DWORD PTR [ecx],eax
     968:	07                   	pop    es
     969:	00 09                	add    BYTE PTR [ecx],cl
     96b:	42                   	inc    edx
     96c:	03 00                	add    eax,DWORD PTR [eax]
     96e:	00 03                	add    BYTE PTR [ebx],al
     970:	dd 48 00             	fisttp QWORD PTR [eax+0x0]
     973:	00 00                	add    BYTE PTR [eax],al
     975:	01 01                	add    DWORD PTR [ecx],eax
     977:	06                   	push   es
     978:	00 09                	add    BYTE PTR [ecx],cl
     97a:	65 03 00             	add    eax,DWORD PTR gs:[eax]
     97d:	00 03                	add    BYTE PTR [ebx],al
     97f:	de 61 00             	fisub  WORD PTR [ecx+0x0]
     982:	00 00                	add    BYTE PTR [eax],al
     984:	04 1e                	add    al,0x1e
     986:	00 00                	add    BYTE PTR [eax],al
     988:	00 0a                	add    BYTE PTR [edx],cl
     98a:	04 03                	add    al,0x3
     98c:	da 85 01 00 00 0b    	fiadd  DWORD PTR [ebp+0xb000001]
     992:	36 01 00             	add    DWORD PTR ss:[eax],eax
     995:	00 0c 72             	add    BYTE PTR [edx+esi*2],cl
     998:	65 67 00 03          	add    BYTE PTR gs:[bp+di],al
     99c:	e0 61                	loopne 9ff <cmdClearScreen-0x30ff601>
     99e:	00 00                	add    BYTE PTR [eax],al
     9a0:	00 00                	add    BYTE PTR [eax],al
     9a2:	0d 4a 01 00 00       	or     eax,0x14a
     9a7:	04 6c                	add    al,0x6c
     9a9:	00 00                	add    BYTE PTR [eax],al
     9ab:	00 07                	add    BYTE PTR [edi],al
     9ad:	15 c0 01 00 00       	adc    eax,0x1c0
     9b2:	0e                   	push   cs
     9b3:	e5 02                	in     eax,0x2
     9b5:	00 00                	add    BYTE PTR [eax],al
     9b7:	01 0e                	add    DWORD PTR [esi],ecx
     9b9:	ed                   	in     eax,dx
     9ba:	01 00                	add    DWORD PTR [eax],eax
     9bc:	00 02                	add    BYTE PTR [edx],al
     9be:	0e                   	push   cs
     9bf:	06                   	push   es
     9c0:	01 00                	add    DWORD PTR [eax],eax
     9c2:	00 04 0e             	add    BYTE PTR [esi+ecx*1],al
     9c5:	6e                   	outs   dx,BYTE PTR ds:[esi]
     9c6:	03 00                	add    eax,DWORD PTR [eax]
     9c8:	00 08                	add    BYTE PTR [eax],cl
     9ca:	0e                   	push   cs
     9cb:	f2 02 00             	repnz add al,BYTE PTR [eax]
     9ce:	00 10                	add    BYTE PTR [eax],dl
     9d0:	0e                   	push   cs
     9d1:	91                   	xchg   ecx,eax
     9d2:	00 00                	add    BYTE PTR [eax],al
     9d4:	00 20                	add    BYTE PTR [eax],ah
     9d6:	0e                   	push   cs
     9d7:	d1 02                	rol    DWORD PTR [edx],1
     9d9:	00 00                	add    BYTE PTR [eax],al
     9db:	40                   	inc    eax
     9dc:	00 08                	add    BYTE PTR [eax],cl
     9de:	10 04 14             	adc    BYTE PTR [esp+edx*1],al
     9e1:	f9                   	stc    
     9e2:	01 00                	add    DWORD PTR [eax],eax
     9e4:	00 0f                	add    BYTE PTR [edi],cl
     9e6:	33 02                	xor    eax,DWORD PTR [edx]
     9e8:	00 00                	add    BYTE PTR [eax],al
     9ea:	04 16                	add    al,0x16
     9ec:	f9                   	stc    
     9ed:	01 00                	add    DWORD PTR [eax],eax
     9ef:	00 00                	add    BYTE PTR [eax],al
     9f1:	0f 73                	(bad)  
     9f3:	00 00                	add    BYTE PTR [eax],al
     9f5:	00 04 17             	add    BYTE PTR [edi+edx*1],al
     9f8:	f9                   	stc    
     9f9:	01 00                	add    DWORD PTR [eax],eax
     9fb:	00 04 0f             	add    BYTE PTR [edi+ecx*1],al
     9fe:	65 01 00             	add    DWORD PTR gs:[eax],eax
     a01:	00 04 18             	add    BYTE PTR [eax+ebx*1],al
     a04:	93                   	xchg   ebx,eax
     a05:	00 00                	add    BYTE PTR [eax],al
     a07:	00 08                	add    BYTE PTR [eax],cl
     a09:	0f 84 01 00 00 04    	je     4000a10 <lCommand+0xeee890>
     a0f:	19 3a                	sbb    DWORD PTR [edx],edi
     a11:	00 00                	add    BYTE PTR [eax],al
     a13:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
     a16:	05 04 25 00 00       	add    eax,0x2504
     a1b:	00 04 94             	add    BYTE PTR [esp+edx*4],al
     a1e:	03 00                	add    eax,DWORD PTR [eax]
     a20:	00 04 1a             	add    BYTE PTR [edx+ebx*1],al
     a23:	c0 01 00             	rol    BYTE PTR [ecx],0x0
     a26:	00 10                	add    BYTE PTR [eax],dl
     a28:	15 04 00 00 01       	adc    eax,0x1000004
     a2d:	18 bc 07 10 03 b4 00 	sbb    BYTE PTR [edi+eax*1+0xb40310],bh
     a34:	00 00                	add    BYTE PTR [eax],al
     a36:	01 9c 3a 02 00 00 11 	add    DWORD PTR [edx+edi*1+0x11000002],ebx
     a3d:	20 04 00             	and    BYTE PTR [eax+eax*1],al
     a40:	00 01                	add    BYTE PTR [ecx],al
     a42:	18 f9                	sbb    cl,bh
     a44:	01 00                	add    DWORD PTR [eax],eax
     a46:	00 02                	add    BYTE PTR [edx],al
     a48:	91                   	xchg   ecx,eax
     a49:	00 12                	add    BYTE PTR [edx],dl
     a4b:	69 00 01 1b 3a 00    	imul   eax,DWORD PTR [eax],0x3a1b01
     a51:	00 00                	add    BYTE PTR [eax],al
     a53:	02 91 6c 00 13 df    	add    dl,BYTE PTR [ecx-0x20ecff94]
     a59:	03 00                	add    eax,DWORD PTR [eax]
     a5b:	00 01                	add    BYTE PTR [ecx],al
     a5d:	31 3a                	xor    DWORD PTR [edx],edi
     a5f:	00 00                	add    BYTE PTR [eax],al
     a61:	00 70 08             	add    BYTE PTR [eax+0x8],dh
     a64:	10 03                	adc    BYTE PTR [ebx],al
     a66:	a9 01 00 00 01       	test   eax,0x1000001
     a6b:	9c                   	pushf  
     a6c:	d8 02                	fadd   DWORD PTR [edx]
     a6e:	00 00                	add    BYTE PTR [eax],al
     a70:	11 31                	adc    DWORD PTR [ecx],esi
     a72:	05 00 00 01 31       	add    eax,0x31010000
     a77:	f9                   	stc    
     a78:	01 00                	add    DWORD PTR [eax],eax
     a7a:	00 02                	add    BYTE PTR [edx],al
     a7c:	91                   	xchg   ecx,eax
     a7d:	00 11                	add    BYTE PTR [ecx],dl
     a7f:	2c 02                	sub    al,0x2
     a81:	00 00                	add    BYTE PTR [eax],al
     a83:	01 31                	add    DWORD PTR [ecx],esi
     a85:	e8 02 00 00 02       	call   2000a8c <cmdClearScreen-0x10ff574>
     a8a:	91                   	xchg   ecx,eax
     a8b:	04 11                	add    al,0x11
     a8d:	fa                   	cli    
     a8e:	02 00                	add    al,BYTE PTR [eax]
     a90:	00 01                	add    BYTE PTR [ecx],al
     a92:	31 3a                	xor    DWORD PTR [edx],edi
     a94:	00 00                	add    BYTE PTR [eax],al
     a96:	00 02                	add    BYTE PTR [edx],al
     a98:	91                   	xchg   ecx,eax
     a99:	08 12                	or     BYTE PTR [edx],dl
     a9b:	78 00                	js     a9d <cmdClearScreen-0x30ff563>
     a9d:	01 33                	add    DWORD PTR [ebx],esi
     a9f:	3a 00                	cmp    al,BYTE PTR [eax]
     aa1:	00 00                	add    BYTE PTR [eax],al
     aa3:	02 91 6c 12 79 00    	add    dl,BYTE PTR [ecx+0x79126c]
     aa9:	01 33                	add    DWORD PTR [ebx],esi
     aab:	3a 00                	cmp    al,BYTE PTR [eax]
     aad:	00 00                	add    BYTE PTR [eax],al
     aaf:	02 91 68 14 b4 03    	add    dl,BYTE PTR [ecx+0x3b41468]
     ab5:	00 00                	add    BYTE PTR [eax],al
     ab7:	01 34 3a             	add    DWORD PTR [edx+edi*1],esi
     aba:	00 00                	add    BYTE PTR [eax],al
     abc:	00 02                	add    BYTE PTR [edx],al
     abe:	91                   	xchg   ecx,eax
     abf:	64                   	fs
     ac0:	14 04                	adc    al,0x4
     ac2:	04 00                	add    al,0x0
     ac4:	00 01                	add    BYTE PTR [ecx],al
     ac6:	34 3a                	xor    al,0x3a
     ac8:	00 00                	add    BYTE PTR [eax],al
     aca:	00 02                	add    BYTE PTR [edx],al
     acc:	91                   	xchg   ecx,eax
     acd:	60                   	pusha  
     ace:	14 a2                	adc    al,0xa2
     ad0:	04 00                	add    al,0x0
     ad2:	00 01                	add    BYTE PTR [ecx],al
     ad4:	35 8c 00 00 00       	xor    eax,0x8c
     ad9:	02 91 5f 15 ab 08    	add    dl,BYTE PTR [ecx+0x8ab155f]
     adf:	10 03                	adc    BYTE PTR [ebx],al
     ae1:	47                   	inc    edi
     ae2:	01 00                	add    DWORD PTR [eax],eax
     ae4:	00 12                	add    BYTE PTR [edx],dl
     ae6:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     ae9:	00 01                	add    BYTE PTR [ecx],al
     aeb:	39 6c 00 00          	cmp    DWORD PTR [eax+eax*1+0x0],ebp
     aef:	00 02                	add    BYTE PTR [edx],al
     af1:	91                   	xchg   ecx,eax
     af2:	58                   	pop    eax
     af3:	00 00                	add    BYTE PTR [eax],al
     af5:	16                   	push   ss
     af6:	25 00 00 00 e8       	and    eax,0xe8000000
     afb:	02 00                	add    al,BYTE PTR [eax]
     afd:	00 17                	add    BYTE PTR [edi],dl
     aff:	95                   	xchg   ebp,eax
     b00:	00 00                	add    BYTE PTR [eax],al
     b02:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
     b05:	05 04 d8 02 00       	add    eax,0x2d804
     b0a:	00 13                	add    BYTE PTR [ebx],dl
     b0c:	41                   	inc    ecx
     b0d:	05 00 00 01 63       	add    eax,0x63010000
     b12:	3a 00                	cmp    al,BYTE PTR [eax]
     b14:	00 00                	add    BYTE PTR [eax],al
     b16:	19 0a                	sbb    DWORD PTR [edx],ecx
     b18:	10 03                	adc    BYTE PTR [ebx],al
     b1a:	69 00 00 00 01 9c    	imul   eax,DWORD PTR [eax],0x9c010000
     b20:	30 03                	xor    BYTE PTR [ebx],al
     b22:	00 00                	add    BYTE PTR [eax],al
     b24:	11 39                	adc    DWORD PTR [ecx],edi
     b26:	05 00 00 01 63       	add    eax,0x63010000
     b2b:	f9                   	stc    
     b2c:	01 00                	add    DWORD PTR [eax],eax
     b2e:	00 02                	add    BYTE PTR [edx],al
     b30:	91                   	xchg   ecx,eax
     b31:	00 12                	add    BYTE PTR [edx],dl
     b33:	69 00 01 65 6c 00    	imul   eax,DWORD PTR [eax],0x6c6501
     b39:	00 00                	add    BYTE PTR [eax],al
     b3b:	02 91 6c 12 72 65    	add    dl,BYTE PTR [ecx+0x6572126c]
     b41:	74 00                	je     b43 <cmdClearScreen-0x30ff4bd>
     b43:	01 66 3a             	add    DWORD PTR [esi+0x3a],esp
     b46:	00 00                	add    BYTE PTR [eax],al
     b48:	00 02                	add    BYTE PTR [edx],al
     b4a:	91                   	xchg   ecx,eax
     b4b:	68 00 13 cf 04       	push   0x4cf1300
     b50:	00 00                	add    BYTE PTR [eax],al
     b52:	01 77 ee             	add    DWORD PTR [edi-0x12],esi
     b55:	03 00                	add    eax,DWORD PTR [eax]
     b57:	00 82 0a 10 03 8e    	add    BYTE PTR [edx-0x71fceff6],al
     b5d:	02 00                	add    al,BYTE PTR [eax]
     b5f:	00 01                	add    BYTE PTR [ecx],al
     b61:	9c                   	pushf  
     b62:	ee                   	out    dx,al
     b63:	03 00                	add    eax,DWORD PTR [eax]
     b65:	00 11                	add    BYTE PTR [ecx],dl
     b67:	f0 03 00             	lock add eax,DWORD PTR [eax]
     b6a:	00 01                	add    BYTE PTR [ecx],al
     b6c:	77 81                	ja     aef <cmdClearScreen-0x30ff511>
     b6e:	00 00                	add    BYTE PTR [eax],al
     b70:	00 02                	add    BYTE PTR [edx],al
     b72:	91                   	xchg   ecx,eax
     b73:	00 12                	add    BYTE PTR [edx],dl
     b75:	61                   	popa   
     b76:	72 67                	jb     bdf <cmdClearScreen-0x30ff421>
     b78:	00 01                	add    BYTE PTR [ecx],al
     b7a:	79 f9                	jns    b75 <cmdClearScreen-0x30ff48b>
     b7c:	01 00                	add    DWORD PTR [eax],eax
     b7e:	00 02                	add    BYTE PTR [edx],al
     b80:	91                   	xchg   ecx,eax
     b81:	6c                   	ins    BYTE PTR es:[edi],dx
     b82:	14 4d                	adc    al,0x4d
     b84:	05 00 00 01 7a       	add    eax,0x7a010000
     b89:	f9                   	stc    
     b8a:	01 00                	add    DWORD PTR [eax],eax
     b8c:	00 02                	add    BYTE PTR [edx],al
     b8e:	91                   	xchg   ecx,eax
     b8f:	68 14 6a 04 00       	push   0x46a14
     b94:	00 01                	add    BYTE PTR [ecx],al
     b96:	7b 3a                	jnp    bd2 <cmdClearScreen-0x30ff42e>
     b98:	00 00                	add    BYTE PTR [eax],al
     b9a:	00 02                	add    BYTE PTR [edx],al
     b9c:	91                   	xchg   ecx,eax
     b9d:	64                   	fs
     b9e:	14 43                	adc    al,0x43
     ba0:	04 00                	add    al,0x0
     ba2:	00 01                	add    BYTE PTR [ecx],al
     ba4:	7c 3a                	jl     be0 <cmdClearScreen-0x30ff420>
     ba6:	00 00                	add    BYTE PTR [eax],al
     ba8:	00 02                	add    BYTE PTR [edx],al
     baa:	91                   	xchg   ecx,eax
     bab:	60                   	pusha  
     bac:	14 69                	adc    al,0x69
     bae:	04 00                	add    al,0x0
     bb0:	00 01                	add    BYTE PTR [ecx],al
     bb2:	7d 3a                	jge    bee <cmdClearScreen-0x30ff412>
     bb4:	00 00                	add    BYTE PTR [eax],al
     bb6:	00 02                	add    BYTE PTR [edx],al
     bb8:	91                   	xchg   ecx,eax
     bb9:	5c                   	pop    esp
     bba:	14 8f                	adc    al,0x8f
     bbc:	04 00                	add    al,0x0
     bbe:	00 01                	add    BYTE PTR [ecx],al
     bc0:	7e 3a                	jle    bfc <cmdClearScreen-0x30ff404>
     bc2:	00 00                	add    BYTE PTR [eax],al
     bc4:	00 02                	add    BYTE PTR [edx],al
     bc6:	91                   	xchg   ecx,eax
     bc7:	58                   	pop    eax
     bc8:	14 8c                	adc    al,0x8c
     bca:	04 00                	add    al,0x0
     bcc:	00 01                	add    BYTE PTR [ecx],al
     bce:	7f 3a                	jg     c0a <cmdClearScreen-0x30ff3f6>
     bd0:	00 00                	add    BYTE PTR [eax],al
     bd2:	00 02                	add    BYTE PTR [edx],al
     bd4:	91                   	xchg   ecx,eax
     bd5:	54                   	push   esp
     bd6:	14 d4                	adc    al,0xd4
     bd8:	04 00                	add    al,0x0
     bda:	00 01                	add    BYTE PTR [ecx],al
     bdc:	80 ee 03             	sub    dh,0x3
     bdf:	00 00                	add    BYTE PTR [eax],al
     be1:	02 91 50 14 1d 05    	add    dl,BYTE PTR [ecx+0x51d1450]
     be7:	00 00                	add    BYTE PTR [eax],al
     be9:	01 81 ee 03 00 00    	add    DWORD PTR [ecx+0x3ee],eax
     bef:	02 91 4c 15 43 0c    	add    dl,BYTE PTR [ecx+0xc43154c]
     bf5:	10 03                	adc    BYTE PTR [ebx],al
     bf7:	9e                   	sahf   
     bf8:	00 00                	add    BYTE PTR [eax],al
     bfa:	00 14 da             	add    BYTE PTR [edx+ebx*8],dl
     bfd:	03 00                	add    eax,DWORD PTR [eax]
     bff:	00 01                	add    BYTE PTR [ecx],al
     c01:	da f9                	(bad)  
     c03:	01 00                	add    DWORD PTR [eax],eax
     c05:	00 02                	add    BYTE PTR [edx],al
     c07:	91                   	xchg   ecx,eax
     c08:	48                   	dec    eax
     c09:	00 00                	add    BYTE PTR [eax],al
     c0b:	05 04 f9 01 00       	add    eax,0x1f904
     c10:	00 13                	add    BYTE PTR [ebx],dl
     c12:	5c                   	pop    esp
     c13:	04 00                	add    al,0x0
     c15:	00 01                	add    BYTE PTR [ecx],al
     c17:	f0 ee                	lock out dx,al
     c19:	03 00                	add    eax,DWORD PTR [eax]
     c1b:	00 10                	add    BYTE PTR [eax],dl
     c1d:	0d 10 03 76 00       	or     eax,0x760310
     c22:	00 00                	add    BYTE PTR [eax],al
     c24:	01 9c 50 04 00 00 11 	add    DWORD PTR [eax+edx*2+0x11000004],ebx
     c2b:	8f 01                	pop    DWORD PTR [ecx]
     c2d:	00 00                	add    BYTE PTR [eax],al
     c2f:	01 f0                	add    eax,esi
     c31:	3a 00                	cmp    al,BYTE PTR [eax]
     c33:	00 00                	add    BYTE PTR [eax],al
     c35:	02 91 00 11 2c 02    	add    dl,BYTE PTR [ecx+0x22c1100]
     c3b:	00 00                	add    BYTE PTR [eax],al
     c3d:	01 f0                	add    eax,esi
     c3f:	e8 02 00 00 02       	call   2000c46 <cmdClearScreen-0x10ff3ba>
     c44:	91                   	xchg   ecx,eax
     c45:	04 11                	add    al,0x11
     c47:	10 04 00             	adc    BYTE PTR [eax+eax*1],al
     c4a:	00 01                	add    BYTE PTR [ecx],al
     c4c:	f0 ee                	lock out dx,al
     c4e:	03 00                	add    eax,DWORD PTR [eax]
     c50:	00 02                	add    BYTE PTR [edx],al
     c52:	91                   	xchg   ecx,eax
     c53:	08 15 17 0d 10 03    	or     BYTE PTR ds:0x3100d17,dl
     c59:	67 00 00             	add    BYTE PTR [bx+si],al
     c5c:	00 12                	add    BYTE PTR [edx],dl
     c5e:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     c61:	00 01                	add    BYTE PTR [ecx],al
     c63:	f2 3a 00             	repnz cmp al,BYTE PTR [eax]
     c66:	00 00                	add    BYTE PTR [eax],al
     c68:	02 91 6c 00 00 10    	add    dl,BYTE PTR [ecx+0x1000006c]
     c6e:	4a                   	dec    edx
     c6f:	04 00                	add    al,0x0
     c71:	00 01                	add    BYTE PTR [ecx],al
     c73:	fa                   	cli    
     c74:	86 0d 10 03 3d 00    	xchg   BYTE PTR ds:0x3d0310,cl
     c7a:	00 00                	add    BYTE PTR [eax],al
     c7c:	01 9c 9a 04 00 00 11 	add    DWORD PTR [edx+ebx*4+0x11000004],ebx
     c83:	8f 01                	pop    DWORD PTR [ecx]
     c85:	00 00                	add    BYTE PTR [eax],al
     c87:	01 fa                	add    edx,edi
     c89:	3a 00                	cmp    al,BYTE PTR [eax]
     c8b:	00 00                	add    BYTE PTR [eax],al
     c8d:	02 91 00 11 2c 02    	add    dl,BYTE PTR [ecx+0x22c1100]
     c93:	00 00                	add    BYTE PTR [eax],al
     c95:	01 fa                	add    edx,edi
     c97:	ee                   	out    dx,al
     c98:	03 00                	add    eax,DWORD PTR [eax]
     c9a:	00 02                	add    BYTE PTR [edx],al
     c9c:	91                   	xchg   ecx,eax
     c9d:	04 15                	add    al,0x15
     c9f:	8c 0d 10 03 26 00    	mov    WORD PTR ds:0x260310,cs
     ca5:	00 00                	add    BYTE PTR [eax],al
     ca7:	12 63 6e             	adc    ah,BYTE PTR [ebx+0x6e]
     caa:	74 00                	je     cac <cmdClearScreen-0x30ff354>
     cac:	01 fc                	add    esp,edi
     cae:	3a 00                	cmp    al,BYTE PTR [eax]
     cb0:	00 00                	add    BYTE PTR [eax],al
     cb2:	02 91 6c 00 00 18    	add    dl,BYTE PTR [ecx+0x1800006c]
     cb8:	2f                   	das    
     cb9:	04 00                	add    al,0x0
     cbb:	00 01                	add    BYTE PTR [ecx],al
     cbd:	01 01                	add    DWORD PTR [ecx],eax
     cbf:	8c 00                	mov    WORD PTR [eax],es
     cc1:	00 00                	add    BYTE PTR [eax],al
     cc3:	c3                   	ret    
     cc4:	0d 10 03 8c 00       	or     eax,0x8c0310
     cc9:	00 00                	add    BYTE PTR [eax],al
     ccb:	01 9c 05 05 00 00 19 	add    DWORD PTR [ebp+eax*1+0x19000005],ebx
     cd2:	bc 04 00 00 01       	mov    esp,0x1000004
     cd7:	01 01                	add    DWORD PTR [ecx],eax
     cd9:	f9                   	stc    
     cda:	01 00                	add    DWORD PTR [eax],eax
     cdc:	00 02                	add    BYTE PTR [edx],al
     cde:	91                   	xchg   ecx,eax
     cdf:	00 19                	add    BYTE PTR [ecx],bl
     ce1:	29 04 00             	sub    DWORD PTR [eax+eax*1],eax
     ce4:	00 01                	add    BYTE PTR [ecx],al
     ce6:	01 01                	add    DWORD PTR [ecx],eax
     ce8:	f9                   	stc    
     ce9:	01 00                	add    DWORD PTR [eax],eax
     ceb:	00 02                	add    BYTE PTR [edx],al
     ced:	91                   	xchg   ecx,eax
     cee:	04 15                	add    al,0x15
     cf0:	c9                   	leave  
     cf1:	0d 10 03 7f 00       	or     eax,0x7f0310
     cf6:	00 00                	add    BYTE PTR [eax],al
     cf8:	1a 63 6e             	sbb    ah,BYTE PTR [ebx+0x6e]
     cfb:	74 00                	je     cfd <cmdClearScreen-0x30ff303>
     cfd:	01 04 01             	add    DWORD PTR [ecx+eax*1],eax
     d00:	3a 00                	cmp    al,BYTE PTR [eax]
     d02:	00 00                	add    BYTE PTR [eax],al
     d04:	02 91 6c 15 e5 0d    	add    dl,BYTE PTR [ecx+0xde5156c]
     d0a:	10 03                	adc    BYTE PTR [ebx],al
     d0c:	59                   	pop    ecx
     d0d:	00 00                	add    BYTE PTR [eax],al
     d0f:	00 1a                	add    BYTE PTR [edx],bl
     d11:	69 64 78 00 01 08 01 	imul   esp,DWORD PTR [eax+edi*2+0x0],0xf9010801
     d18:	f9 
     d19:	01 00                	add    DWORD PTR [eax],eax
     d1b:	00 02                	add    BYTE PTR [edx],al
     d1d:	91                   	xchg   ecx,eax
     d1e:	68 00 00 00 1b       	push   0x1b000000
     d23:	c3                   	ret    
     d24:	04 00                	add    al,0x0
     d26:	00 01                	add    BYTE PTR [ecx],al
     d28:	20 01                	and    BYTE PTR [ecx],al
     d2a:	4f                   	dec    edi
     d2b:	0e                   	push   cs
     d2c:	10 03                	adc    BYTE PTR [ebx],al
     d2e:	2e 00 00             	add    BYTE PTR cs:[eax],al
     d31:	00 01                	add    BYTE PTR [ecx],al
     d33:	9c                   	pushf  
     d34:	2b 05 00 00 19 39    	sub    eax,DWORD PTR ds:0x39190000
     d3a:	05 00 00 01 20       	add    eax,0x20010000
     d3f:	01 f9                	add    ecx,edi
     d41:	01 00                	add    DWORD PTR [eax],eax
     d43:	00 02                	add    BYTE PTR [edx],al
     d45:	91                   	xchg   ecx,eax
     d46:	00 00                	add    BYTE PTR [eax],al
     d48:	1c bc                	sbb    al,0xbc
     d4a:	03 00                	add    eax,DWORD PTR [eax]
     d4c:	00 01                	add    BYTE PTR [ecx],al
     d4e:	25 01 7d 0e 10       	and    eax,0x100e7d01
     d53:	03 23                	add    esp,DWORD PTR [ebx]
     d55:	00 00                	add    BYTE PTR [eax],al
     d57:	00 01                	add    BYTE PTR [ecx],al
     d59:	9c                   	pushf  
     d5a:	18 71 04             	sbb    BYTE PTR [ecx+0x4],dh
     d5d:	00 00                	add    BYTE PTR [eax],al
     d5f:	01 2a                	add    DWORD PTR [edx],ebp
     d61:	01 3a                	add    DWORD PTR [edx],edi
     d63:	00 00                	add    BYTE PTR [eax],al
     d65:	00 a0 0e 10 03 26    	add    BYTE PTR [eax+0x2603100e],ah
     d6b:	00 00                	add    BYTE PTR [eax],al
     d6d:	00 01                	add    BYTE PTR [ecx],al
     d6f:	9c                   	pushf  
     d70:	75 05                	jne    d77 <cmdClearScreen-0x30ff289>
     d72:	00 00                	add    BYTE PTR [eax],al
     d74:	19 39                	sbb    DWORD PTR [ecx],edi
     d76:	05 00 00 01 2a       	add    eax,0x2a010000
     d7b:	01 f9                	add    ecx,edi
     d7d:	01 00                	add    DWORD PTR [eax],eax
     d7f:	00 02                	add    BYTE PTR [edx],al
     d81:	91                   	xchg   ecx,eax
     d82:	00 1d 55 05 00 00    	add    BYTE PTR ds:0x555,bl
     d88:	01 2c 01             	add    DWORD PTR [ecx+eax*1],ebp
     d8b:	3a 00                	cmp    al,BYTE PTR [eax]
     d8d:	00 00                	add    BYTE PTR [eax],al
     d8f:	1e                   	push   ds
     d90:	00 00                	add    BYTE PTR [eax],al
     d92:	1f                   	pop    ds
     d93:	23 05 00 00 01 32    	and    eax,DWORD PTR ds:0x32010000
     d99:	01 3a                	add    DWORD PTR [edx],edi
     d9b:	00 00                	add    BYTE PTR [eax],al
     d9d:	00 c6                	add    dh,al
     d9f:	0e                   	push   cs
     da0:	10 03                	adc    BYTE PTR [ebx],al
     da2:	16                   	push   ss
     da3:	00 00                	add    BYTE PTR [eax],al
     da5:	00 01                	add    BYTE PTR [ecx],al
     da7:	9c                   	pushf  
     da8:	9f                   	lahf   
     da9:	05 00 00 19 fa       	add    eax,0xfa190000
     dae:	04 00                	add    al,0x0
     db0:	00 01                	add    BYTE PTR [ecx],al
     db2:	32 01                	xor    al,BYTE PTR [ecx]
     db4:	3a 00                	cmp    al,BYTE PTR [eax]
     db6:	00 00                	add    BYTE PTR [eax],al
     db8:	02 91 00 00 1f 94    	add    dl,BYTE PTR [ecx-0x6be10000]
     dbe:	04 00                	add    al,0x0
     dc0:	00 01                	add    BYTE PTR [ecx],al
     dc2:	3c 01                	cmp    al,0x1
     dc4:	3a 00                	cmp    al,BYTE PTR [eax]
     dc6:	00 00                	add    BYTE PTR [eax],al
     dc8:	dc 0e                	fmul   QWORD PTR [esi]
     dca:	10 03                	adc    BYTE PTR [ebx],al
     dcc:	20 00                	and    BYTE PTR [eax],al
     dce:	00 00                	add    BYTE PTR [eax],al
     dd0:	01 9c c9 05 00 00 19 	add    DWORD PTR [ecx+ecx*8+0x19000005],ebx
     dd7:	fa                   	cli    
     dd8:	04 00                	add    al,0x0
     dda:	00 01                	add    BYTE PTR [ecx],al
     ddc:	3c 01                	cmp    al,0x1
     dde:	3a 00                	cmp    al,BYTE PTR [eax]
     de0:	00 00                	add    BYTE PTR [eax],al
     de2:	02 91 00 00 18 0e    	add    dl,BYTE PTR [ecx+0xe180000]
     de8:	05 00 00 01 49       	add    eax,0x49010000
     ded:	01 3a                	add    DWORD PTR [edx],edi
     def:	00 00                	add    BYTE PTR [eax],al
     df1:	00 fc                	add    ah,bh
     df3:	0e                   	push   cs
     df4:	10 03                	adc    BYTE PTR [ebx],al
     df6:	e4 03                	in     al,0x3
     df8:	00 00                	add    BYTE PTR [eax],al
     dfa:	01 9c 88 06 00 00 19 	add    DWORD PTR [eax+ecx*4+0x19000006],ebx
     e01:	8f 04 00             	pop    DWORD PTR [eax+eax*1]
     e04:	00 01                	add    BYTE PTR [ecx],al
     e06:	49                   	dec    ecx
     e07:	01 3a                	add    DWORD PTR [edx],edi
     e09:	00 00                	add    BYTE PTR [eax],al
     e0b:	00 02                	add    BYTE PTR [edx],al
     e0d:	91                   	xchg   ecx,eax
     e0e:	00 19                	add    BYTE PTR [ecx],bl
     e10:	d4 04                	aam    0x4
     e12:	00 00                	add    BYTE PTR [eax],al
     e14:	01 49 01             	add    DWORD PTR [ecx+0x1],ecx
     e17:	ee                   	out    dx,al
     e18:	03 00                	add    eax,DWORD PTR [eax]
     e1a:	00 02                	add    BYTE PTR [edx],al
     e1c:	91                   	xchg   ecx,eax
     e1d:	04 19                	add    al,0x19
     e1f:	c3                   	ret    
     e20:	03 00                	add    eax,DWORD PTR [eax]
     e22:	00 01                	add    BYTE PTR [ecx],al
     e24:	49                   	dec    ecx
     e25:	01 ee                	add    esi,ebp
     e27:	03 00                	add    eax,DWORD PTR [eax]
     e29:	00 02                	add    BYTE PTR [edx],al
     e2b:	91                   	xchg   ecx,eax
     e2c:	08 20                	or     BYTE PTR [eax],ah
     e2e:	53                   	push   ebx
     e2f:	04 00                	add    al,0x0
     e31:	00 01                	add    BYTE PTR [ecx],al
     e33:	4b                   	dec    ebx
     e34:	01 48 00             	add    DWORD PTR [eax+0x0],ecx
     e37:	00 00                	add    BYTE PTR [eax],al
     e39:	02 91 63 20 f6 03    	add    dl,BYTE PTR [ecx+0x3f62063]
     e3f:	00 00                	add    BYTE PTR [eax],al
     e41:	01 4c 01 3a          	add    DWORD PTR [ecx+eax*1+0x3a],ecx
     e45:	00 00                	add    BYTE PTR [eax],al
     e47:	00 02                	add    BYTE PTR [edx],al
     e49:	91                   	xchg   ecx,eax
     e4a:	6c                   	ins    BYTE PTR es:[edi],dx
     e4b:	20 5e 05             	and    BYTE PTR [esi+0x5],bl
     e4e:	00 00                	add    BYTE PTR [eax],al
     e50:	01 4d 01             	add    DWORD PTR [ebp+0x1],ecx
     e53:	3a 00                	cmp    al,BYTE PTR [eax]
     e55:	00 00                	add    BYTE PTR [eax],al
     e57:	02 91 68 20 15 05    	add    dl,BYTE PTR [ecx+0x5152068]
     e5d:	00 00                	add    BYTE PTR [eax],al
     e5f:	01 4e 01             	add    DWORD PTR [esi+0x1],ecx
     e62:	88 06                	mov    BYTE PTR [esi],al
     e64:	00 00                	add    BYTE PTR [eax],al
     e66:	02 91 4f 21 80 04    	add    dl,BYTE PTR [ecx+0x480214f]
     e6c:	00 00                	add    BYTE PTR [eax],al
     e6e:	01 5f 01             	add    DWORD PTR [edi+0x1],ebx
     e71:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
     e72:	0f 10 03             	movups xmm0,XMMWORD PTR [ebx]
     e75:	21 7a 05             	and    DWORD PTR [edx+0x5],edi
     e78:	00 00                	add    BYTE PTR [eax],al
     e7a:	01 67 01             	add    DWORD PTR [edi+0x1],esp
     e7d:	f4                   	hlt    
     e7e:	0f 10 03             	movups xmm0,XMMWORD PTR [ebx]
     e81:	21 a4 03 00 00 01 ca 	and    DWORD PTR [ebx+eax*1-0x35ff0000],esp
     e88:	01 36                	add    DWORD PTR [esi],esi
     e8a:	12 10                	adc    dl,BYTE PTR [eax]
     e8c:	03 15 a7 0f 10 03    	add    edx,DWORD PTR ds:0x3100fa7
     e92:	0f 03 00             	lsl    eax,WORD PTR [eax]
     e95:	00 1a                	add    BYTE PTR [edx],bl
     e97:	69 00 01 cf 01 3a    	imul   eax,DWORD PTR [eax],0x3a01cf01
     e9d:	00 00                	add    BYTE PTR [eax],al
     e9f:	00 02                	add    BYTE PTR [edx],al
     ea1:	91                   	xchg   ecx,eax
     ea2:	64 00 00             	add    BYTE PTR fs:[eax],al
     ea5:	16                   	push   ss
     ea6:	25 00 00 00 98       	and    eax,0x98000000
     eab:	06                   	push   es
     eac:	00 00                	add    BYTE PTR [eax],al
     eae:	17                   	pop    ss
     eaf:	95                   	xchg   ebp,eax
     eb0:	00 00                	add    BYTE PTR [eax],al
     eb2:	00 13                	add    BYTE PTR [ebx],dl
     eb4:	00 16                	add    BYTE PTR [esi],dl
     eb6:	ff 01                	inc    DWORD PTR [ecx]
     eb8:	00 00                	add    BYTE PTR [eax],al
     eba:	a8 06                	test   al,0x6
     ebc:	00 00                	add    BYTE PTR [eax],al
     ebe:	17                   	pop    ss
     ebf:	95                   	xchg   ebp,eax
     ec0:	00 00                	add    BYTE PTR [eax],al
     ec2:	00 09                	add    BYTE PTR [ecx],cl
     ec4:	00 14 2c             	add    BYTE PTR [esp+ebp*1],dl
     ec7:	01 00                	add    DWORD PTR [eax],eax
     ec9:	00 04 38             	add    BYTE PTR [eax+edi*1],al
     ecc:	98                   	cwde   
     ecd:	06                   	push   es
     ece:	00 00                	add    BYTE PTR [eax],al
     ed0:	05 03 60 22 10       	add    eax,0x10226003
     ed5:	03 22                	add    esp,DWORD PTR [edx]
     ed7:	05 03 00 00 05       	add    eax,0x5000003
     edc:	34 61                	xor    al,0x61
     ede:	00 00                	add    BYTE PTR [eax],al
     ee0:	00 05 03 4c 27 10    	add    BYTE PTR ds:0x10274c03,al
     ee6:	03 22                	add    esp,DWORD PTR [edx]
     ee8:	f6 01 00             	test   BYTE PTR [ecx],0x0
     eeb:	00 05 35 61 00 00    	add    BYTE PTR ds:0x6135,al
     ef1:	00 05 03 50 27 10    	add    BYTE PTR ds:0x10275003,al
     ef7:	03 22                	add    esp,DWORD PTR [edx]
     ef9:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
     efc:	00 05 36 61 00 00    	add    BYTE PTR ds:0x6136,al
     f02:	00 05 03 48 27 10    	add    BYTE PTR ds:0x10274803,al
     f08:	03 22                	add    esp,DWORD PTR [edx]
     f0a:	3b 03                	cmp    eax,DWORD PTR [ebx]
     f0c:	00 00                	add    BYTE PTR [eax],al
     f0e:	05 37 7a 00 00       	add    eax,0x7a37
     f13:	00 05 03 70 27 10    	add    BYTE PTR ds:0x10277003,al
     f19:	03 22                	add    esp,DWORD PTR [edx]
     f1b:	8f 02                	pop    DWORD PTR [edx]
     f1d:	00 00                	add    BYTE PTR [eax],al
     f1f:	06                   	push   es
     f20:	50                   	push   eax
     f21:	ee                   	out    dx,al
     f22:	03 00                	add    eax,DWORD PTR [eax]
     f24:	00 05 03 60 27 10    	add    BYTE PTR ds:0x10276003,al
     f2a:	03 22                	add    esp,DWORD PTR [edx]
     f2c:	56                   	push   esi
     f2d:	03 00                	add    eax,DWORD PTR [eax]
     f2f:	00 03                	add    BYTE PTR [ebx],al
     f31:	63 1d 01 00 00 05    	arpl   WORD PTR ds:0x5000001,bx
     f37:	03 58 27             	add    ebx,DWORD PTR [eax+0x27]
     f3a:	10 03                	adc    BYTE PTR [ebx],al
     f3c:	22 13                	and    dl,BYTE PTR [ebx]
     f3e:	03 00                	add    eax,DWORD PTR [eax]
     f40:	00 03                	add    BYTE PTR [ebx],al
     f42:	e1 6c                	loope  fb0 <cmdClearScreen-0x30ff050>
     f44:	01 00                	add    DWORD PTR [eax],eax
     f46:	00 05 03 44 27 10    	add    BYTE PTR ds:0x10274403,al
     f4c:	03 23                	add    esp,DWORD PTR [ebx]
     f4e:	22 5d 01             	and    bl,BYTE PTR [ebp+0x1]
     f51:	00 00                	add    BYTE PTR [eax],al
     f53:	04 26                	add    al,0x26
     f55:	42                   	inc    edx
     f56:	07                   	pop    es
     f57:	00 00                	add    BYTE PTR [eax],al
     f59:	05 03 54 27 10       	add    eax,0x10275403
     f5e:	03 05 04 30 07 00    	add    eax,DWORD PTR ds:0x73004
     f64:	00 24 53             	add    BYTE PTR [ebx+edx*2],ah
     f67:	07                   	pop    es
     f68:	00 00                	add    BYTE PTR [eax],al
     f6a:	25 f9 01 00 00       	and    eax,0x1f9
     f6f:	00 22                	add    BYTE PTR [edx],ah
     f71:	bc 01 00 00 04       	mov    esp,0x4000001
     f76:	27                   	daa    
     f77:	64                   	fs
     f78:	07                   	pop    es
     f79:	00 00                	add    BYTE PTR [eax],al
     f7b:	05 03 40 27 10       	add    eax,0x10274003
     f80:	03 05 04 48 07 00    	add    eax,DWORD PTR ds:0x74804
     f86:	00 16                	add    BYTE PTR [esi],dl
     f88:	25 00 00 00 7b       	and    eax,0x7b000000
     f8d:	07                   	pop    es
     f8e:	00 00                	add    BYTE PTR [eax],al
     f90:	26                   	es
     f91:	95                   	xchg   ebp,eax
     f92:	00 00                	add    BYTE PTR [eax],al
     f94:	00 ff                	add    bh,bh
     f96:	01 00                	add    DWORD PTR [eax],eax
     f98:	22 ff                	and    bh,bh
     f9a:	01 00                	add    DWORD PTR [eax],eax
     f9c:	00 04 2f             	add    BYTE PTR [edi+ebp*1],al
     f9f:	6a 07                	push   0x7
     fa1:	00 00                	add    BYTE PTR [eax],al
     fa3:	05 03 40 25 10       	add    eax,0x10254003
     fa8:	03 22                	add    esp,DWORD PTR [edx]
     faa:	75 03                	jne    faf <cmdClearScreen-0x30ff051>
     fac:	00 00                	add    BYTE PTR [eax],al
     fae:	04 30                	add    al,0x30
     fb0:	f9                   	stc    
     fb1:	01 00                	add    DWORD PTR [eax],eax
     fb3:	00 05 03 6c 27 10    	add    BYTE PTR ds:0x10276c03,al
     fb9:	03 22                	add    esp,DWORD PTR [edx]
     fbb:	00 00                	add    BYTE PTR [eax],al
     fbd:	00 00                	add    BYTE PTR [eax],al
     fbf:	04 31                	add    al,0x31
     fc1:	ee                   	out    dx,al
     fc2:	03 00                	add    eax,DWORD PTR [eax]
     fc4:	00 05 03 2c 24 10    	add    BYTE PTR ds:0x10242c03,al
     fca:	03 16                	add    edx,DWORD PTR [esi]
     fcc:	25 00 00 00 be       	and    eax,0xbe000000
     fd1:	07                   	pop    es
     fd2:	00 00                	add    BYTE PTR [eax],al
     fd4:	17                   	pop    ss
     fd5:	95                   	xchg   ebp,eax
     fd6:	00 00                	add    BYTE PTR [eax],al
     fd8:	00 05 00 22 11 02    	add    BYTE PTR ds:0x2112200,al
     fde:	00 00                	add    BYTE PTR [eax],al
     fe0:	04 32                	add    al,0x32
     fe2:	ae                   	scas   al,BYTE PTR es:[edi]
     fe3:	07                   	pop    es
     fe4:	00 00                	add    BYTE PTR [eax],al
     fe6:	05 03 24 24 10       	add    eax,0x10242403
     feb:	03 22                	add    esp,DWORD PTR [edx]
     fed:	9b                   	fwait
     fee:	02 00                	add    al,BYTE PTR [eax]
     ff0:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
     ff3:	61                   	popa   
     ff4:	00 00                	add    BYTE PTR [eax],al
     ff6:	00 05 03 68 27 10    	add    BYTE PTR ds:0x10276803,al
     ffc:	03 22                	add    esp,DWORD PTR [edx]
     ffe:	7e 02                	jle    1002 <cmdClearScreen-0x30feffe>
    1000:	00 00                	add    BYTE PTR [eax],al
    1002:	04 33                	add    al,0x33
    1004:	61                   	popa   
    1005:	00 00                	add    BYTE PTR [eax],al
    1007:	00 05 03 64 27 10    	add    BYTE PTR ds:0x10276403,al
    100d:	03 22                	add    esp,DWORD PTR [edx]
    100f:	21 01                	and    DWORD PTR [ecx],eax
    1011:	00 00                	add    BYTE PTR [eax],al
    1013:	04 34                	add    al,0x34
    1015:	8c 00                	mov    WORD PTR [eax],es
    1017:	00 00                	add    BYTE PTR [eax],al
    1019:	05 03 74 27 10       	add    eax,0x10277403
    101e:	03 16                	add    edx,DWORD PTR [esi]
    1020:	25 00 00 00 12       	and    eax,0x12000000
    1025:	08 00                	or     BYTE PTR [eax],al
    1027:	00 17                	add    BYTE PTR [edi],dl
    1029:	95                   	xchg   ebp,eax
    102a:	00 00                	add    BYTE PTR [eax],al
    102c:	00 ff                	add    bh,bh
    102e:	00 27                	add    BYTE PTR [edi],ah
    1030:	63 77 64             	arpl   WORD PTR [edi+0x64],si
    1033:	00 04 35 02 08 00 00 	add    BYTE PTR [esi*1+0x802],al
    103a:	05 03 40 24 10       	add    eax,0x10244003
    103f:	03 22                	add    esp,DWORD PTR [edx]
    1041:	96                   	xchg   esi,eax
    1042:	01 00                	add    DWORD PTR [eax],eax
    1044:	00 04 36             	add    BYTE PTR [esi+esi*1],al
    1047:	8c 00                	mov    WORD PTR [eax],es
    1049:	00 00                	add    BYTE PTR [eax],al
    104b:	05 03 20 24 10       	add    eax,0x10242003
    1050:	03 16                	add    edx,DWORD PTR [esi]
    1052:	25 00 00 00 4b       	and    eax,0x4b000000
    1057:	08 00                	or     BYTE PTR [eax],al
    1059:	00 26                	add    BYTE PTR [esi],ah
    105b:	95                   	xchg   ebp,eax
    105c:	00 00                	add    BYTE PTR [eax],al
    105e:	00 f3                	add    bl,dh
    1060:	01 17                	add    DWORD PTR [edi],edx
    1062:	95                   	xchg   ebp,eax
    1063:	00 00                	add    BYTE PTR [eax],al
    1065:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
    1068:	22 d9                	and    bl,cl
    106a:	04 00                	add    al,0x0
    106c:	00 01                	add    BYTE PTR [ecx],al
    106e:	10 34 08             	adc    BYTE PTR [eax+ecx*1],dh
    1071:	00 00                	add    BYTE PTR [eax],al
    1073:	05 03 80 27 10       	add    eax,0x10278003
    1078:	03 22                	add    esp,DWORD PTR [edx]
    107a:	e8 04 00 00 01       	call   1001083 <cmdClearScreen-0x20fef7d>
    107f:	11 3a                	adc    DWORD PTR [edx],edi
    1081:	00 00                	add    BYTE PTR [eax],al
    1083:	00 05 03 78 27 10    	add    BYTE PTR ds:0x10277803,al
    1089:	03 22                	add    esp,DWORD PTR [edx]
    108b:	c8 03 00 00          	enter  0x3,0x0
    108f:	01 12                	add    DWORD PTR [edx],edx
    1091:	3a 00                	cmp    al,BYTE PTR [eax]
    1093:	00 00                	add    BYTE PTR [eax],al
    1095:	05 03 7c 27 10       	add    eax,0x10277c03
    109a:	03 22                	add    esp,DWORD PTR [edx]
    109c:	20 04 00             	and    BYTE PTR [eax+eax*1],al
    109f:	00 01                	add    BYTE PTR [ecx],al
    10a1:	13 02                	adc    eax,DWORD PTR [edx]
    10a3:	08 00                	or     BYTE PTR [eax],al
    10a5:	00 05 03 80 21 11    	add    BYTE PTR ds:0x11218003,al
    10ab:	03 00                	add    eax,DWORD PTR [eax]

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
  35:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
  3b:	00 00                	add    BYTE PTR [eax],al
  3d:	06                   	push   es
  3e:	13 01                	adc    eax,DWORD PTR [ecx]
  40:	0b 0b                	or     ecx,DWORD PTR [ebx]
  42:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  44:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  46:	01 13                	add    DWORD PTR [ebx],edx
  48:	00 00                	add    BYTE PTR [eax],al
  4a:	07                   	pop    es
  4b:	0d 00 03 0e 3a       	or     eax,0x3a0e0300
  50:	0b 3b                	or     edi,DWORD PTR [ebx]
  52:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  55:	0b 0b                	or     ecx,DWORD PTR [ebx]
  57:	0d 0b 0c 0b 38       	or     eax,0x380b0c0b
  5c:	0b 00                	or     eax,DWORD PTR [eax]
  5e:	00 08                	add    BYTE PTR [eax],cl
  60:	17                   	pop    ss
  61:	01 0b                	add    DWORD PTR [ebx],ecx
  63:	0b 3a                	or     edi,DWORD PTR [edx]
  65:	0b 3b                	or     edi,DWORD PTR [ebx]
  67:	0b 01                	or     eax,DWORD PTR [ecx]
  69:	13 00                	adc    eax,DWORD PTR [eax]
  6b:	00 09                	add    BYTE PTR [ecx],cl
  6d:	0d 00 49 13 00       	or     eax,0x134900
  72:	00 0a                	add    BYTE PTR [edx],cl
  74:	0d 00 03 08 3a       	or     eax,0x3a080300
  79:	0b 3b                	or     edi,DWORD PTR [ebx]
  7b:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  7e:	00 00                	add    BYTE PTR [eax],al
  80:	0b 04 01             	or     eax,DWORD PTR [ecx+eax*1]
  83:	03 0e                	add    ecx,DWORD PTR [esi]
  85:	0b 0b                	or     ecx,DWORD PTR [ebx]
  87:	49                   	dec    ecx
  88:	13 3a                	adc    edi,DWORD PTR [edx]
  8a:	0b 3b                	or     edi,DWORD PTR [ebx]
  8c:	0b 01                	or     eax,DWORD PTR [ecx]
  8e:	13 00                	adc    eax,DWORD PTR [eax]
  90:	00 0c 28             	add    BYTE PTR [eax+ebp*1],cl
  93:	00 03                	add    BYTE PTR [ebx],al
  95:	0e                   	push   cs
  96:	1c 0b                	sbb    al,0xb
  98:	00 00                	add    BYTE PTR [eax],al
  9a:	0d 0d 00 03 0e       	or     eax,0xe03000d
  9f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  a1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  a3:	49                   	dec    ecx
  a4:	13 38                	adc    edi,DWORD PTR [eax]
  a6:	0b 00                	or     eax,DWORD PTR [eax]
  a8:	00 0e                	add    BYTE PTR [esi],cl
  aa:	0f 00 0b             	str    WORD PTR [ebx]
  ad:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  b0:	00 00                	add    BYTE PTR [eax],al
  b2:	0f 2e 00             	ucomiss xmm0,DWORD PTR [eax]
  b5:	3f                   	aas    
  b6:	19 03                	sbb    DWORD PTR [ebx],eax
  b8:	0e                   	push   cs
  b9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  bb:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  bd:	11 01                	adc    DWORD PTR [ecx],eax
  bf:	12 06                	adc    al,BYTE PTR [esi]
  c1:	40                   	inc    eax
  c2:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
  c8:	10 2e                	adc    BYTE PTR [esi],ch
  ca:	01 3f                	add    DWORD PTR [edi],edi
  cc:	19 03                	sbb    DWORD PTR [ebx],eax
  ce:	0e                   	push   cs
  cf:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  d1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  d3:	11 01                	adc    DWORD PTR [ecx],eax
  d5:	12 06                	adc    al,BYTE PTR [esi]
  d7:	40                   	inc    eax
  d8:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  de:	00 00                	add    BYTE PTR [eax],al
  e0:	11 0b                	adc    DWORD PTR [ebx],ecx
  e2:	01 11                	add    DWORD PTR [ecx],edx
  e4:	01 12                	add    DWORD PTR [edx],edx
  e6:	06                   	push   es
  e7:	00 00                	add    BYTE PTR [eax],al
  e9:	12 34 00             	adc    dh,BYTE PTR [eax+eax*1]
  ec:	03 08                	add    ecx,DWORD PTR [eax]
  ee:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  f0:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  f2:	49                   	dec    ecx
  f3:	13 02                	adc    eax,DWORD PTR [edx]
  f5:	18 00                	sbb    BYTE PTR [eax],al
  f7:	00 13                	add    BYTE PTR [ebx],dl
  f9:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  fc:	19 03                	sbb    DWORD PTR [ebx],eax
  fe:	0e                   	push   cs
  ff:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 101:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 103:	27                   	daa    
 104:	19 11                	sbb    DWORD PTR [ecx],edx
 106:	01 12                	add    DWORD PTR [edx],edx
 108:	06                   	push   es
 109:	40                   	inc    eax
 10a:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 110:	00 00                	add    BYTE PTR [eax],al
 112:	14 05                	adc    al,0x5
 114:	00 03                	add    BYTE PTR [ebx],al
 116:	0e                   	push   cs
 117:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 119:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 11b:	49                   	dec    ecx
 11c:	13 02                	adc    eax,DWORD PTR [edx]
 11e:	18 00                	sbb    BYTE PTR [eax],al
 120:	00 15 34 00 03 0e    	add    BYTE PTR ds:0xe030034,dl
 126:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 128:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 12a:	49                   	dec    ecx
 12b:	13 02                	adc    eax,DWORD PTR [edx]
 12d:	18 00                	sbb    BYTE PTR [eax],al
 12f:	00 16                	add    BYTE PTR [esi],dl
 131:	01 01                	add    DWORD PTR [ecx],eax
 133:	49                   	dec    ecx
 134:	13 01                	adc    eax,DWORD PTR [ecx]
 136:	13 00                	adc    eax,DWORD PTR [eax]
 138:	00 17                	add    BYTE PTR [edi],dl
 13a:	21 00                	and    DWORD PTR [eax],eax
 13c:	49                   	dec    ecx
 13d:	13 2f                	adc    ebp,DWORD PTR [edi]
 13f:	0b 00                	or     eax,DWORD PTR [eax]
 141:	00 18                	add    BYTE PTR [eax],bl
 143:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 146:	19 03                	sbb    DWORD PTR [ebx],eax
 148:	0e                   	push   cs
 149:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 14b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 14d:	27                   	daa    
 14e:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 151:	11 01                	adc    DWORD PTR [ecx],eax
 153:	12 06                	adc    al,BYTE PTR [esi]
 155:	40                   	inc    eax
 156:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 15c:	00 00                	add    BYTE PTR [eax],al
 15e:	19 34 00             	sbb    DWORD PTR [eax+eax*1],esi
 161:	03 08                	add    ecx,DWORD PTR [eax]
 163:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 165:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 167:	49                   	dec    ecx
 168:	13 00                	adc    eax,DWORD PTR [eax]
 16a:	00 1a                	add    BYTE PTR [edx],bl
 16c:	0b 01                	or     eax,DWORD PTR [ecx]
 16e:	11 01                	adc    DWORD PTR [ecx],eax
 170:	12 06                	adc    al,BYTE PTR [esi]
 172:	01 13                	add    DWORD PTR [ebx],edx
 174:	00 00                	add    BYTE PTR [eax],al
 176:	1b 0b                	sbb    ecx,DWORD PTR [ebx]
 178:	01 55 17             	add    DWORD PTR [ebp+0x17],edx
 17b:	00 00                	add    BYTE PTR [eax],al
 17d:	1c 21                	sbb    al,0x21
 17f:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 182:	2f                   	das    
 183:	18 00                	sbb    BYTE PTR [eax],al
 185:	00 1d 34 00 03 0e    	add    BYTE PTR ds:0xe030034,bl
 18b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 18d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 18f:	49                   	dec    ecx
 190:	13 3f                	adc    edi,DWORD PTR [edi]
 192:	19 02                	sbb    DWORD PTR [edx],eax
 194:	18 00                	sbb    BYTE PTR [eax],al
 196:	00 1e                	add    BYTE PTR [esi],bl
 198:	15 00 27 19 00       	adc    eax,0x192700
 19d:	00 1f                	add    BYTE PTR [edi],bl
 19f:	15 01 27 19 01       	adc    eax,0x1192701
 1a4:	13 00                	adc    eax,DWORD PTR [eax]
 1a6:	00 20                	add    BYTE PTR [eax],ah
 1a8:	05 00 49 13 00       	add    eax,0x134900
 1ad:	00 21                	add    BYTE PTR [ecx],ah
 1af:	21 00                	and    DWORD PTR [eax],eax
 1b1:	49                   	dec    ecx
 1b2:	13 2f                	adc    ebp,DWORD PTR [edi]
 1b4:	05 00 00 22 34       	add    eax,0x34220000
 1b9:	00 03                	add    BYTE PTR [ebx],al
 1bb:	08 3a                	or     BYTE PTR [edx],bh
 1bd:	0b 3b                	or     edi,DWORD PTR [ebx]
 1bf:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 1c2:	3f                   	aas    
 1c3:	19 02                	sbb    DWORD PTR [edx],eax
 1c5:	18 00                	sbb    BYTE PTR [eax],al
 1c7:	00 00                	add    BYTE PTR [eax],al
 1c9:	01 11                	add    DWORD PTR [ecx],edx
 1cb:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 1d1:	0e                   	push   cs
 1d2:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 1d4:	11 01                	adc    DWORD PTR [ecx],eax
 1d6:	12 06                	adc    al,BYTE PTR [esi]
 1d8:	10 17                	adc    BYTE PTR [edi],dl
 1da:	00 00                	add    BYTE PTR [eax],al
 1dc:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 1df:	0b 0b                	or     ecx,DWORD PTR [ebx]
 1e1:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 1e4:	0e                   	push   cs
 1e5:	00 00                	add    BYTE PTR [eax],al
 1e7:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 1ea:	0b 0b                	or     ecx,DWORD PTR [ebx]
 1ec:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 1ef:	08 00                	or     BYTE PTR [eax],al
 1f1:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 1f4:	00 03                	add    BYTE PTR [ebx],al
 1f6:	0e                   	push   cs
 1f7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1f9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1fb:	49                   	dec    ecx
 1fc:	13 00                	adc    eax,DWORD PTR [eax]
 1fe:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 204:	49                   	dec    ecx
 205:	13 00                	adc    eax,DWORD PTR [eax]
 207:	00 06                	add    BYTE PTR [esi],al
 209:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 20d:	00 00                	add    BYTE PTR [eax],al
 20f:	07                   	pop    es
 210:	0f 00 0b             	str    WORD PTR [ebx]
 213:	0b 00                	or     eax,DWORD PTR [eax]
 215:	00 08                	add    BYTE PTR [eax],cl
 217:	13 01                	adc    eax,DWORD PTR [ecx]
 219:	0b 0b                	or     ecx,DWORD PTR [ebx]
 21b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 21d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 21f:	01 13                	add    DWORD PTR [ebx],edx
 221:	00 00                	add    BYTE PTR [eax],al
 223:	09 0d 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,ecx
 229:	0b 3b                	or     edi,DWORD PTR [ebx]
 22b:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 22e:	0b 0b                	or     ecx,DWORD PTR [ebx]
 230:	0d 0b 0c 0b 38       	or     eax,0x380b0c0b
 235:	0b 00                	or     eax,DWORD PTR [eax]
 237:	00 0a                	add    BYTE PTR [edx],cl
 239:	17                   	pop    ss
 23a:	01 0b                	add    DWORD PTR [ebx],ecx
 23c:	0b 3a                	or     edi,DWORD PTR [edx]
 23e:	0b 3b                	or     edi,DWORD PTR [ebx]
 240:	0b 01                	or     eax,DWORD PTR [ecx]
 242:	13 00                	adc    eax,DWORD PTR [eax]
 244:	00 0b                	add    BYTE PTR [ebx],cl
 246:	0d 00 49 13 00       	or     eax,0x134900
 24b:	00 0c 0d 00 03 08 3a 	add    BYTE PTR [ecx*1+0x3a080300],cl
 252:	0b 3b                	or     edi,DWORD PTR [ebx]
 254:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 257:	00 00                	add    BYTE PTR [eax],al
 259:	0d 04 01 03 0e       	or     eax,0xe030104
 25e:	0b 0b                	or     ecx,DWORD PTR [ebx]
 260:	49                   	dec    ecx
 261:	13 3a                	adc    edi,DWORD PTR [edx]
 263:	0b 3b                	or     edi,DWORD PTR [ebx]
 265:	0b 01                	or     eax,DWORD PTR [ecx]
 267:	13 00                	adc    eax,DWORD PTR [eax]
 269:	00 0e                	add    BYTE PTR [esi],cl
 26b:	28 00                	sub    BYTE PTR [eax],al
 26d:	03 0e                	add    ecx,DWORD PTR [esi]
 26f:	1c 0b                	sbb    al,0xb
 271:	00 00                	add    BYTE PTR [eax],al
 273:	0f 0d 00             	prefetch BYTE PTR [eax]
 276:	03 0e                	add    ecx,DWORD PTR [esi]
 278:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 27a:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 27c:	49                   	dec    ecx
 27d:	13 38                	adc    edi,DWORD PTR [eax]
 27f:	0b 00                	or     eax,DWORD PTR [eax]
 281:	00 10                	add    BYTE PTR [eax],dl
 283:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 286:	19 03                	sbb    DWORD PTR [ebx],eax
 288:	0e                   	push   cs
 289:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 28b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 28d:	27                   	daa    
 28e:	19 11                	sbb    DWORD PTR [ecx],edx
 290:	01 12                	add    DWORD PTR [edx],edx
 292:	06                   	push   es
 293:	40                   	inc    eax
 294:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 29a:	00 00                	add    BYTE PTR [eax],al
 29c:	11 05 00 03 0e 3a    	adc    DWORD PTR ds:0x3a0e0300,eax
 2a2:	0b 3b                	or     edi,DWORD PTR [ebx]
 2a4:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 2a7:	02 18                	add    bl,BYTE PTR [eax]
 2a9:	00 00                	add    BYTE PTR [eax],al
 2ab:	12 34 00             	adc    dh,BYTE PTR [eax+eax*1]
 2ae:	03 08                	add    ecx,DWORD PTR [eax]
 2b0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2b2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2b4:	49                   	dec    ecx
 2b5:	13 02                	adc    eax,DWORD PTR [edx]
 2b7:	18 00                	sbb    BYTE PTR [eax],al
 2b9:	00 13                	add    BYTE PTR [ebx],dl
 2bb:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 2be:	19 03                	sbb    DWORD PTR [ebx],eax
 2c0:	0e                   	push   cs
 2c1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2c3:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2c5:	27                   	daa    
 2c6:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 2c9:	11 01                	adc    DWORD PTR [ecx],eax
 2cb:	12 06                	adc    al,BYTE PTR [esi]
 2cd:	40                   	inc    eax
 2ce:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 2d4:	00 00                	add    BYTE PTR [eax],al
 2d6:	14 34                	adc    al,0x34
 2d8:	00 03                	add    BYTE PTR [ebx],al
 2da:	0e                   	push   cs
 2db:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2dd:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2df:	49                   	dec    ecx
 2e0:	13 02                	adc    eax,DWORD PTR [edx]
 2e2:	18 00                	sbb    BYTE PTR [eax],al
 2e4:	00 15 0b 01 11 01    	add    BYTE PTR ds:0x111010b,dl
 2ea:	12 06                	adc    al,BYTE PTR [esi]
 2ec:	00 00                	add    BYTE PTR [eax],al
 2ee:	16                   	push   ss
 2ef:	01 01                	add    DWORD PTR [ecx],eax
 2f1:	49                   	dec    ecx
 2f2:	13 01                	adc    eax,DWORD PTR [ecx]
 2f4:	13 00                	adc    eax,DWORD PTR [eax]
 2f6:	00 17                	add    BYTE PTR [edi],dl
 2f8:	21 00                	and    DWORD PTR [eax],eax
 2fa:	49                   	dec    ecx
 2fb:	13 2f                	adc    ebp,DWORD PTR [edi]
 2fd:	0b 00                	or     eax,DWORD PTR [eax]
 2ff:	00 18                	add    BYTE PTR [eax],bl
 301:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 304:	19 03                	sbb    DWORD PTR [ebx],eax
 306:	0e                   	push   cs
 307:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 309:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 30f:	11 01                	adc    DWORD PTR [ecx],eax
 311:	12 06                	adc    al,BYTE PTR [esi]
 313:	40                   	inc    eax
 314:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 31a:	00 00                	add    BYTE PTR [eax],al
 31c:	19 05 00 03 0e 3a    	sbb    DWORD PTR ds:0x3a0e0300,eax
 322:	0b 3b                	or     edi,DWORD PTR [ebx]
 324:	05 49 13 02 18       	add    eax,0x18021349
 329:	00 00                	add    BYTE PTR [eax],al
 32b:	1a 34 00             	sbb    dh,BYTE PTR [eax+eax*1]
 32e:	03 08                	add    ecx,DWORD PTR [eax]
 330:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 332:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 338:	00 00                	add    BYTE PTR [eax],al
 33a:	1b 2e                	sbb    ebp,DWORD PTR [esi]
 33c:	01 3f                	add    DWORD PTR [edi],edi
 33e:	19 03                	sbb    DWORD PTR [ebx],eax
 340:	0e                   	push   cs
 341:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 343:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 349:	12 06                	adc    al,BYTE PTR [esi]
 34b:	40                   	inc    eax
 34c:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 352:	00 00                	add    BYTE PTR [eax],al
 354:	1c 2e                	sbb    al,0x2e
 356:	00 3f                	add    BYTE PTR [edi],bh
 358:	19 03                	sbb    DWORD PTR [ebx],eax
 35a:	0e                   	push   cs
 35b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 35d:	3b 05 11 01 12 06    	cmp    eax,DWORD PTR ds:0x6120111
 363:	40                   	inc    eax
 364:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 36a:	1d 2e 01 3f 19       	sbb    eax,0x193f012e
 36f:	03 0e                	add    ecx,DWORD PTR [esi]
 371:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 373:	3b 05 49 13 3c 19    	cmp    eax,DWORD PTR ds:0x193c1349
 379:	00 00                	add    BYTE PTR [eax],al
 37b:	1e                   	push   ds
 37c:	18 00                	sbb    BYTE PTR [eax],al
 37e:	00 00                	add    BYTE PTR [eax],al
 380:	1f                   	pop    ds
 381:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 384:	19 03                	sbb    DWORD PTR [ebx],eax
 386:	0e                   	push   cs
 387:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 389:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 38f:	11 01                	adc    DWORD PTR [ecx],eax
 391:	12 06                	adc    al,BYTE PTR [esi]
 393:	40                   	inc    eax
 394:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 39a:	00 00                	add    BYTE PTR [eax],al
 39c:	20 34 00             	and    BYTE PTR [eax+eax*1],dh
 39f:	03 0e                	add    ecx,DWORD PTR [esi]
 3a1:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3a3:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 3a9:	00 00                	add    BYTE PTR [eax],al
 3ab:	21 0a                	and    DWORD PTR [edx],ecx
 3ad:	00 03                	add    BYTE PTR [ebx],al
 3af:	0e                   	push   cs
 3b0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3b2:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 3b8:	22 34 00             	and    dh,BYTE PTR [eax+eax*1]
 3bb:	03 0e                	add    ecx,DWORD PTR [esi]
 3bd:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3bf:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 3c1:	49                   	dec    ecx
 3c2:	13 3f                	adc    edi,DWORD PTR [edi]
 3c4:	19 02                	sbb    DWORD PTR [edx],eax
 3c6:	18 00                	sbb    BYTE PTR [eax],al
 3c8:	00 23                	add    BYTE PTR [ebx],ah
 3ca:	15 00 27 19 00       	adc    eax,0x192700
 3cf:	00 24 15 01 27 19 01 	add    BYTE PTR [edx*1+0x1192701],ah
 3d6:	13 00                	adc    eax,DWORD PTR [eax]
 3d8:	00 25 05 00 49 13    	add    BYTE PTR ds:0x13490005,ah
 3de:	00 00                	add    BYTE PTR [eax],al
 3e0:	26 21 00             	and    DWORD PTR es:[eax],eax
 3e3:	49                   	dec    ecx
 3e4:	13 2f                	adc    ebp,DWORD PTR [edi]
 3e6:	05 00 00 27 34       	add    eax,0x34270000
 3eb:	00 03                	add    BYTE PTR [ebx],al
 3ed:	08 3a                	or     BYTE PTR [edx],bh
 3ef:	0b 3b                	or     edi,DWORD PTR [ebx]
 3f1:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 3f4:	3f                   	aas    
 3f5:	19 02                	sbb    DWORD PTR [edx],eax
 3f7:	18 00                	sbb    BYTE PTR [eax],al
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
  14:	bc 07 00 00 00       	mov    esp,0x7
  19:	00 00                	add    BYTE PTR [eax],al
  1b:	00 00                	add    BYTE PTR [eax],al
  1d:	00 00                	add    BYTE PTR [eax],al
  1f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  22:	00 00                	add    BYTE PTR [eax],al
  24:	02 00                	add    al,BYTE PTR [eax]
  26:	1d 08 00 00 04       	sbb    eax,0x4000008
  2b:	00 00                	add    BYTE PTR [eax],al
  2d:	00 00                	add    BYTE PTR [eax],al
  2f:	00 bc 07 10 03 24 0b 	add    BYTE PTR [edi+eax*1+0xb240310],bh
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	b8 04 00 00 1a       	mov    eax,0x1a000004
   5:	05 00 00 1c 05       	add    eax,0x51c0000
   a:	00 00                	add    BYTE PTR [eax],al
   c:	1d 05 00 00 00       	sbb    eax,0x5
  11:	00 00                	add    BYTE PTR [eax],al
  13:	00 00                	add    BYTE PTR [eax],al
  15:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	43                   	inc    ebx
   1:	02 00                	add    al,BYTE PTR [eax]
   3:	00 02                	add    BYTE PTR [edx],al
   5:	00 1f                	add    BYTE PTR [edi],bl
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
  5f:	2e                   	cs
  60:	2e                   	cs
  61:	2f                   	das    
  62:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
  66:	6a 2f                	push   0x2f
  68:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
  6b:	69 73 4f 53 2f 69 6e 	imul   esi,DWORD PTR [ebx+0x4f],0x6e692f53
  72:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  76:	65                   	gs
  77:	2f                   	das    
  78:	69 33 38 36 00 69    	imul   esi,DWORD PTR [ebx],0x69003638
  7e:	6e                   	outs   dx,BYTE PTR ds:[esi]
  7f:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  83:	65 00 2e             	add    BYTE PTR gs:[esi],ch
  86:	2e                   	cs
  87:	2f                   	das    
  88:	6c                   	ins    BYTE PTR es:[edi],dx
  89:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  90:	4f                   	dec    edi
  91:	53                   	push   ebx
  92:	2f                   	das    
  93:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  9a:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
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
  e7:	63 70 75             	arpl   WORD PTR [eax+0x75],si
  ea:	2e                   	cs
  eb:	68 00 03 00 00       	push   0x300
  f0:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  f4:	6c                   	ins    BYTE PTR es:[edi],dx
  f5:	6c                   	ins    BYTE PTR es:[edi],dx
  f6:	2e                   	cs
  f7:	68 00 04 00 00       	push   0x400
  fc:	6d                   	ins    DWORD PTR es:[edi],dx
  fd:	61                   	popa   
  fe:	6c                   	ins    BYTE PTR es:[edi],dx
  ff:	6c                   	ins    BYTE PTR es:[edi],dx
 100:	6f                   	outs   dx,DWORD PTR ds:[esi]
 101:	63 2e                	arpl   WORD PTR [esi],bp
 103:	68 00 05 00 00       	push   0x500
 108:	6c                   	ins    BYTE PTR es:[edi],dx
 109:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 110:	4f                   	dec    edi
 111:	53                   	push   ebx
 112:	2e                   	cs
 113:	68 00 05 00 00       	push   0x500
 118:	74 68                	je     182 <cmdClearScreen-0x30ffe7e>
 11a:	65                   	gs
 11b:	73 69                	jae    186 <cmdClearScreen-0x30ffe7a>
 11d:	67 6e                	outs   dx,BYTE PTR ds:[si]
 11f:	61                   	popa   
 120:	6c                   	ins    BYTE PTR es:[edi],dx
 121:	73 2e                	jae    151 <cmdClearScreen-0x30ffeaf>
 123:	68 00 06 00 00       	push   0x600
 128:	00 00                	add    BYTE PTR [eax],al
 12a:	05 02 00 00 10       	add    eax,0x10000002
 12f:	03 03                	add    eax,DWORD PTR [ebx]
 131:	0a 01                	or     al,BYTE PTR [ecx]
 133:	67 f3 3f             	addr16 repz aas 
 136:	67 92                	addr16 xchg edx,eax
 138:	08 30                	or     BYTE PTR [eax],dh
 13a:	00 02                	add    BYTE PTR [edx],al
 13c:	04 02                	add    al,0x2
 13e:	08 e0                	or     al,ah
 140:	00 02                	add    BYTE PTR [edx],al
 142:	04 01                	add    al,0x1
 144:	06                   	push   es
 145:	4a                   	dec    edx
 146:	06                   	push   es
 147:	6e                   	outs   dx,BYTE PTR ds:[esi]
 148:	3f                   	aas    
 149:	94                   	xchg   esp,eax
 14a:	02 22                	add    ah,BYTE PTR [edx]
 14c:	14 d7                	adc    al,0xd7
 14e:	08 91 68 f3 5a f3    	or     BYTE PTR [ecx-0xca50c98],dl
 154:	08 f3                	or     bl,dh
 156:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 159:	21 08                	and    DWORD PTR [eax],ecx
 15b:	83 ad 08 f3 d7 d7 08 	sub    DWORD PTR [ebp-0x28280cf8],0x8
 162:	13 d7                	adc    edx,edi
 164:	f5                   	cmc    
 165:	59                   	pop    ecx
 166:	31 bb 08 68 68 af    	xor    DWORD PTR [ebx-0x509797f8],edi
 16c:	08 3e                	or     BYTE PTR [esi],bh
 16e:	08 67 08             	or     BYTE PTR [edi+0x8],ah
 171:	5c                   	pop    esp
 172:	08 30                	or     BYTE PTR [eax],dh
 174:	3f                   	aas    
 175:	91                   	xchg   ecx,eax
 176:	4b                   	dec    ebx
 177:	76 77                	jbe    1f0 <cmdClearScreen-0x30ffe10>
 179:	08 bb 75 76 67 a0    	or     BYTE PTR [ebx-0x5f98898b],bh
 17f:	a1 08 76 a0 f3       	mov    eax,ds:0xf3a07608
 184:	a1 08 e5 4c 84       	mov    eax,ds:0x844ce508
 189:	69 08 ca 68 08 3f    	imul   ecx,DWORD PTR [eax],0x3f0868ca
 18f:	75 08                	jne    199 <cmdClearScreen-0x30ffe67>
 191:	30 67 08             	xor    BYTE PTR [edi+0x8],ah
 194:	4d                   	dec    ebp
 195:	ae                   	scas   al,BYTE PTR es:[edi]
 196:	08 3d bb 08 5b 08    	or     BYTE PTR ds:0x85b08bb,bh
 19c:	91                   	xchg   ecx,eax
 19d:	00 02                	add    BYTE PTR [edx],al
 19f:	04 01                	add    al,0x1
 1a1:	08 69 00             	or     BYTE PTR [ecx+0x0],ch
 1a4:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 1a7:	d7                   	xlat   BYTE PTR ds:[ebx]
 1a8:	d8 31                	fdiv   DWORD PTR [ecx]
 1aa:	69 83 d7 83 08 68 3f 	imul   eax,DWORD PTR [ebx+0x680883d7],0x7576673f
 1b1:	67 76 75 
 1b4:	67 08 4c 08          	or     BYTE PTR [si+0x8],cl
 1b8:	3e                   	ds
 1b9:	67 67 67 68 4c 92 08 	addr32 addr32 addr16 push 0x9108924c
 1c0:	91 
 1c1:	d7                   	xlat   BYTE PTR ds:[ebx]
 1c2:	ae                   	scas   al,BYTE PTR es:[edi]
 1c3:	08 21                	or     BYTE PTR [ecx],ah
 1c5:	67 00 02             	add    BYTE PTR [bp+si],al
 1c8:	04 02                	add    al,0x2
 1ca:	03 78 2e             	add    edi,DWORD PTR [eax+0x2e]
 1cd:	00 02                	add    BYTE PTR [edx],al
 1cf:	04 01                	add    al,0x1
 1d1:	06                   	push   es
 1d2:	4a                   	dec    edx
 1d3:	06                   	push   es
 1d4:	03 0c 82             	add    ecx,DWORD PTR [edx+eax*4]
 1d7:	2a 00                	sub    al,BYTE PTR [eax]
 1d9:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 1dc:	24 3f                	and    al,0x3f
 1de:	67 d7                	xlat   BYTE PTR ds:[bx]
 1e0:	3f                   	aas    
 1e1:	93                   	xchg   ebx,eax
 1e2:	08 ca                	or     dl,cl
 1e4:	08 bd 9f 75 3f 69    	or     BYTE PTR [ebp+0x693f759f],bh
 1ea:	08 5f 08             	or     BYTE PTR [edi+0x8],bl
 1ed:	2f                   	das    
 1ee:	bb 68 02 22 13       	mov    ebx,0x13220268
 1f3:	02 2e                	add    ch,BYTE PTR [esi]
 1f5:	16                   	push   ss
 1f6:	00 02                	add    BYTE PTR [edx],al
 1f8:	04 02                	add    al,0x2
 1fa:	03 78 02             	add    edi,DWORD PTR [eax+0x2]
 1fd:	2c 01                	sub    al,0x1
 1ff:	00 02                	add    BYTE PTR [edx],al
 201:	04 01                	add    al,0x1
 203:	06                   	push   es
 204:	4a                   	dec    edx
 205:	06                   	push   es
 206:	03 0b                	add    ecx,DWORD PTR [ebx]
 208:	9e                   	sahf   
 209:	3f                   	aas    
 20a:	67 08 2f             	or     BYTE PTR [bx],ch
 20d:	02 24 13             	add    ah,BYTE PTR [ebx+edx*1]
 210:	d7                   	xlat   BYTE PTR ds:[ebx]
 211:	3f                   	aas    
 212:	9e                   	sahf   
 213:	4c                   	dec    esp
 214:	08 bd 75 02 38 14    	or     BYTE PTR [ebp+0x14380275],bh
 21a:	00 02                	add    BYTE PTR [edx],al
 21c:	04 03                	add    al,0x3
 21e:	91                   	xchg   ecx,eax
 21f:	00 02                	add    BYTE PTR [edx],al
 221:	04 03                	add    al,0x3
 223:	b9 00 02 04 01       	mov    ecx,0x1040200
 228:	06                   	push   es
 229:	4a                   	dec    edx
 22a:	06                   	push   es
 22b:	85 91 d7 00 02 04    	test   DWORD PTR [ecx+0x40200d7],edx
 231:	02 f0                	add    dh,al
 233:	00 02                	add    BYTE PTR [edx],al
 235:	04 01                	add    al,0x1
 237:	06                   	push   es
 238:	4a                   	dec    edx
 239:	06                   	push   es
 23a:	86 ae 08 4b 31 02    	xchg   BYTE PTR [esi+0x2314b08],ch
 240:	2c 13                	sub    al,0x13
 242:	02 05 00 01 01 f6    	add    al,BYTE PTR ds:0xf6010100
 248:	02 00                	add    al,BYTE PTR [eax]
 24a:	00 02                	add    BYTE PTR [edx],al
 24c:	00 1d 01 00 00 01    	add    BYTE PTR ds:0x1000001,bl
 252:	01 fb                	add    ebx,edi
 254:	0e                   	push   cs
 255:	0d 00 01 01 01       	or     eax,0x1010100
 25a:	01 00                	add    DWORD PTR [eax],eax
 25c:	00 00                	add    BYTE PTR [eax],al
 25e:	01 00                	add    DWORD PTR [eax],eax
 260:	00 01                	add    BYTE PTR [ecx],al
 262:	73 72                	jae    2d6 <cmdClearScreen-0x30ffd2a>
 264:	63 00                	arpl   WORD PTR [eax],ax
 266:	2f                   	das    
 267:	68 6f 6d 65 2f       	push   0x2f656d6f
 26c:	79 6f                	jns    2dd <cmdClearScreen-0x30ffd23>
 26e:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
 275:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 278:	73 73                	jae    2ed <cmdClearScreen-0x30ffd13>
 27a:	2f                   	das    
 27b:	6c                   	ins    BYTE PTR es:[edi],dx
 27c:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
 283:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
 289:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
 28f:	78 2d                	js     2be <cmdClearScreen-0x30ffd42>
 291:	67 6e                	outs   dx,BYTE PTR ds:[si]
 293:	75 2f                	jne    2c4 <cmdClearScreen-0x30ffd3c>
 295:	35 2e 33 2e 30       	xor    eax,0x302e332e
 29a:	2f                   	das    
 29b:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 2a2:	00 2e                	add    BYTE PTR [esi],ch
 2a4:	2e                   	cs
 2a5:	2f                   	das    
 2a6:	2e                   	cs
 2a7:	2e                   	cs
 2a8:	2f                   	das    
 2a9:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 2ad:	6a 2f                	push   0x2f
 2af:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 2b2:	69 73 4f 53 2f 69 6e 	imul   esi,DWORD PTR [ebx+0x4f],0x6e692f53
 2b9:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 2bd:	65                   	gs
 2be:	2f                   	das    
 2bf:	69 33 38 36 00 69    	imul   esi,DWORD PTR [ebx],0x69003638
 2c5:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2c6:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 2ca:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 2cd:	2e                   	cs
 2ce:	2f                   	das    
 2cf:	6c                   	ins    BYTE PTR es:[edi],dx
 2d0:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 2d7:	4f                   	dec    edi
 2d8:	53                   	push   ebx
 2d9:	2f                   	das    
 2da:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 2e1:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 2e4:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 2e8:	65                   	gs
 2e9:	2f                   	das    
 2ea:	2e                   	cs
 2eb:	2e                   	cs
 2ec:	2f                   	das    
 2ed:	2e                   	cs
 2ee:	2e                   	cs
 2ef:	2f                   	das    
 2f0:	2e                   	cs
 2f1:	2e                   	cs
 2f2:	2f                   	das    
 2f3:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 2f7:	6a 2f                	push   0x2f
 2f9:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 2fc:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
 303:	6e                   	outs   dx,BYTE PTR ds:[esi]
 304:	65                   	gs
 305:	6c                   	ins    BYTE PTR es:[edi],dx
 306:	2f                   	das    
 307:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 30e:	00 00                	add    BYTE PTR [eax],al
 310:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 314:	6c                   	ins    BYTE PTR es:[edi],dx
 315:	6c                   	ins    BYTE PTR es:[edi],dx
 316:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 319:	01 00                	add    DWORD PTR [eax],eax
 31b:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 31e:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
 325:	63 
 326:	2e                   	cs
 327:	68 00 02 00 00       	push   0x200
 32c:	63 70 75             	arpl   WORD PTR [eax+0x75],si
 32f:	2e                   	cs
 330:	68 00 03 00 00       	push   0x300
 335:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 339:	6c                   	ins    BYTE PTR es:[edi],dx
 33a:	6c                   	ins    BYTE PTR es:[edi],dx
 33b:	2e                   	cs
 33c:	68 00 04 00 00       	push   0x400
 341:	6d                   	ins    DWORD PTR es:[edi],dx
 342:	61                   	popa   
 343:	6c                   	ins    BYTE PTR es:[edi],dx
 344:	6c                   	ins    BYTE PTR es:[edi],dx
 345:	6f                   	outs   dx,DWORD PTR ds:[esi]
 346:	63 2e                	arpl   WORD PTR [esi],bp
 348:	68 00 05 00 00       	push   0x500
 34d:	6c                   	ins    BYTE PTR es:[edi],dx
 34e:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 355:	4f                   	dec    edi
 356:	53                   	push   ebx
 357:	2e                   	cs
 358:	68 00 05 00 00       	push   0x500
 35d:	74 68                	je     3c7 <cmdClearScreen-0x30ffc39>
 35f:	65                   	gs
 360:	73 69                	jae    3cb <cmdClearScreen-0x30ffc35>
 362:	67 6e                	outs   dx,BYTE PTR ds:[si]
 364:	61                   	popa   
 365:	6c                   	ins    BYTE PTR es:[edi],dx
 366:	73 2e                	jae    396 <cmdClearScreen-0x30ffc6a>
 368:	68 00 06 00 00       	push   0x600
 36d:	00 00                	add    BYTE PTR [eax],al
 36f:	05 02 bc 07 10       	add    eax,0x1007bc02
 374:	03 03                	add    eax,DWORD PTR [ebx]
 376:	18 01                	sbb    BYTE PTR [ecx],al
 378:	75 d7                	jne    351 <cmdClearScreen-0x30ffcaf>
 37a:	08 14 68             	or     BYTE PTR [eax+ebp*2],dl
 37d:	4c                   	dec    esp
 37e:	08 21                	or     BYTE PTR [ecx],ah
 380:	08 21                	or     BYTE PTR [ecx],ah
 382:	08 13                	or     BYTE PTR [ebx],dl
 384:	03 0b                	add    ecx,DWORD PTR [ebx]
 386:	74 03                	je     38b <cmdClearScreen-0x30ffc75>
 388:	78 2e                	js     3b8 <cmdClearScreen-0x30ffc48>
 38a:	02 30                	add    dh,BYTE PTR [eax]
 38c:	1a 2c d8             	sbb    ch,BYTE PTR [eax+ebx*8]
 38f:	69 75 d7 d7 4c 08 3e 	imul   esi,DWORD PTR [ebp-0x29],0x3e084cd7
 396:	bc e6 ae 94 08       	mov    esp,0x894aee6
 39b:	4b                   	dec    ebx
 39c:	e5 93                	in     eax,0x93
 39e:	00 02                	add    BYTE PTR [edx],al
 3a0:	04 02                	add    al,0x2
 3a2:	06                   	push   es
 3a3:	e4 00                	in     al,0x0
 3a5:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
 3a8:	e4 00                	in     al,0x0
 3aa:	02 04 05 e4 06 af 00 	add    al,BYTE PTR [eax*1+0xaf06e4]
 3b1:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 3b4:	06                   	push   es
 3b5:	e4 06                	in     al,0x6
 3b7:	e5 02                	in     eax,0x2
 3b9:	25 13 08 4b 67       	and    eax,0x674b0813
 3be:	e3 34                	jecxz  3f4 <cmdClearScreen-0x30ffc0c>
 3c0:	00 02                	add    BYTE PTR [edx],al
 3c2:	04 02                	add    al,0x2
 3c4:	02 25 14 00 02 04    	add    ah,BYTE PTR ds:0x4020014
 3ca:	02 03                	add    al,BYTE PTR [ebx]
 3cc:	63 4a 00             	arpl   WORD PTR [edx+0x0],cx
 3cf:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 3d2:	06                   	push   es
 3d3:	4a                   	dec    edx
 3d4:	06                   	push   es
 3d5:	03 1f                	add    ebx,DWORD PTR [edi]
 3d7:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 3da:	4b                   	dec    ebx
 3db:	08 4f 3d             	or     BYTE PTR [edi+0x3d],cl
 3de:	5b                   	pop    ebx
 3df:	6a 92                	push   0xffffff92
 3e1:	02 3b                	add    bh,BYTE PTR [ebx]
 3e3:	14 69                	adc    al,0x69
 3e5:	00 02                	add    BYTE PTR [edx],al
 3e7:	04 02                	add    al,0x2
 3e9:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 3ec:	00 02                	add    BYTE PTR [edx],al
 3ee:	04 01                	add    al,0x1
 3f0:	06                   	push   es
 3f1:	4a                   	dec    edx
 3f2:	06                   	push   es
 3f3:	03 0b                	add    ecx,DWORD PTR [ebx]
 3f5:	66 59                	pop    cx
 3f7:	32 69 75             	xor    ch,BYTE PTR [ecx+0x75]
 3fa:	75 75                	jne    471 <cmdClearScreen-0x30ffb8f>
 3fc:	75 75                	jne    473 <cmdClearScreen-0x30ffb8d>
 3fe:	78 a1                	js     3a1 <cmdClearScreen-0x30ffc5f>
 400:	08 ec                	or     ah,ch
 402:	00 02                	add    BYTE PTR [edx],al
 404:	04 01                	add    al,0x1
 406:	06                   	push   es
 407:	66 06                	pushw  es
 409:	af                   	scas   eax,DWORD PTR es:[edi]
 40a:	68 75 08 4c 67       	push   0x674c0875
 40f:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 412:	5a                   	pop    edx
 413:	00 02                	add    BYTE PTR [edx],al
 415:	04 01                	add    al,0x1
 417:	06                   	push   es
 418:	9e                   	sahf   
 419:	00 02                	add    BYTE PTR [edx],al
 41b:	04 02                	add    al,0x2
 41d:	66                   	data16
 41e:	00 02                	add    BYTE PTR [edx],al
 420:	04 03                	add    al,0x3
 422:	66 06                	pushw  es
 424:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 425:	68 75 08 5a a0       	push   0xa05a0875
 42a:	bc 68 a0 94 08       	mov    esp,0x894a068
 42f:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 432:	94                   	xchg   esp,eax
 433:	08 33                	or     BYTE PTR [ebx],dh
 435:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 43a:	16                   	push   ss
 43b:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 43e:	03 3a                	add    edi,DWORD PTR [edx]
 440:	d6                   	(bad)  
 441:	68 d8 08 e7 08       	push   0x8e708d8
 446:	13 d7                	adc    edx,edi
 448:	08 e5                	or     ch,ah
 44a:	08 3e                	or     BYTE PTR [esi],bh
 44c:	4b                   	dec    ebx
 44d:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 450:	d9 d9                	(bad)  
 452:	d7                   	xlat   BYTE PTR ds:[ebx]
 453:	d7                   	xlat   BYTE PTR ds:[ebx]
 454:	3d 31 75 00 02       	cmp    eax,0x2007531
 459:	04 03                	add    al,0x3
 45b:	92                   	xchg   edx,eax
 45c:	00 02                	add    BYTE PTR [edx],al
 45e:	04 03                	add    al,0x3
 460:	02 22                	add    ah,BYTE PTR [edx]
 462:	13 00                	adc    eax,DWORD PTR [eax]
 464:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 467:	02 30                	add    dh,BYTE PTR [eax]
 469:	0f 00 02             	sldt   WORD PTR [edx]
 46c:	04 01                	add    al,0x1
 46e:	06                   	push   es
 46f:	4a                   	dec    edx
 470:	06                   	push   es
 471:	87 3d 5b 67 00 02    	xchg   DWORD PTR ds:0x200675b,edi
 477:	04 03                	add    al,0x3
 479:	91                   	xchg   ecx,eax
 47a:	00 02                	add    BYTE PTR [edx],al
 47c:	04 03                	add    al,0x3
 47e:	ff 00                	inc    DWORD PTR [eax]
 480:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 483:	06                   	push   es
 484:	4a                   	dec    edx
 485:	06                   	push   es
 486:	84 d7                	test   bh,dl
 488:	3f                   	aas    
 489:	68 92 08 30 08       	push   0x8300892
 48e:	f3 68 08 5a 08 4c    	repz push 0x4c085a08
 494:	00 02                	add    BYTE PTR [edx],al
 496:	04 02                	add    al,0x2
 498:	03 75 74             	add    esi,DWORD PTR [ebp+0x74]
 49b:	00 02                	add    BYTE PTR [edx],al
 49d:	04 01                	add    al,0x1
 49f:	06                   	push   es
 4a0:	4a                   	dec    edx
 4a1:	06                   	push   es
 4a2:	03 0f                	add    ecx,DWORD PTR [edi]
 4a4:	66 59                	pop    cx
 4a6:	03 0d 2e 67 02 25    	add    ecx,DWORD PTR ds:0x2502672e
 4ac:	13 3f                	adc    edi,DWORD PTR [edi]
 4ae:	67 08 91 3f 67       	or     BYTE PTR [bx+di+0x673f],dl
 4b3:	59                   	pop    ecx
 4b4:	59                   	pop    ecx
 4b5:	08 30                	or     BYTE PTR [eax],dh
 4b7:	3f                   	aas    
 4b8:	3d 85 75 22 3f       	cmp    eax,0x3f227585
 4bd:	3d 86 75 77 59       	cmp    eax,0x59777586
 4c2:	31 67 4b             	xor    DWORD PTR [edi+0x4b],esp
 4c5:	75 77                	jne    53e <cmdClearScreen-0x30ffac2>
 4c7:	75 9f                	jne    468 <cmdClearScreen-0x30ffb98>
 4c9:	75 08                	jne    4d3 <cmdClearScreen-0x30ffb2d>
 4cb:	4b                   	dec    ebx
 4cc:	83 4b 08 4b          	or     DWORD PTR [ebx+0x8],0x4b
 4d0:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 4d3:	5b                   	pop    ebx
 4d4:	08 3e                	or     BYTE PTR [esi],bh
 4d6:	5b                   	pop    ebx
 4d7:	9f                   	lahf   
 4d8:	75 4b                	jne    525 <cmdClearScreen-0x30ffadb>
 4da:	75 08                	jne    4e4 <cmdClearScreen-0x30ffb1c>
 4dc:	67 08 4b 5a          	or     BYTE PTR [bp+di+0x5a],cl
 4e0:	4b                   	dec    ebx
 4e1:	30 08                	xor    BYTE PTR [eax],cl
 4e3:	22 ae 08 22 75 75    	and    ch,BYTE PTR [esi+0x75752208]
 4e9:	f3 03 75 58          	repz add esi,DWORD PTR [ebp+0x58]
 4ed:	03 10                	add    edx,DWORD PTR [eax]
 4ef:	82                   	(bad)  
 4f0:	bc 93 f4 02 2b       	mov    esp,0x2b02f493
 4f5:	13 83 30 f3 47 6b    	adc    eax,DWORD PTR [ebx+0x6b47f330]
 4fb:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 4fe:	30 5d bc             	xor    BYTE PTR [ebp-0x44],bl
 501:	cb                   	retf   
 502:	08 4c 02 2b          	or     BYTE PTR [edx+eax*1+0x2b],cl
 506:	13 83 30 f3 47 6b    	adc    eax,DWORD PTR [ebx+0x6b47f330]
 50c:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 50f:	30 5d 84             	xor    BYTE PTR [ebp-0x7c],bl
 512:	a0 f5 5a 84 08       	mov    al,ds:0x8845af5
 517:	4c                   	dec    esp
 518:	84 d8                	test   al,bl
 51a:	4b                   	dec    ebx
 51b:	ad                   	lods   eax,DWORD PTR ds:[esi]
 51c:	08 4d 84             	or     BYTE PTR [ebp-0x7c],cl
 51f:	f3 03 0d 20 03 77 f2 	repz add ecx,DWORD PTR ds:0xf2770320
 526:	08 30                	or     BYTE PTR [eax],dh
 528:	08 76 76             	or     BYTE PTR [esi+0x76],dh
 52b:	5d                   	pop    ebp
 52c:	67 f3 08 2f          	repz or BYTE PTR [bx],ch
 530:	03 8d 7f f2 03 f5    	add    ecx,DWORD PTR [ebp-0xafc0d81]
 536:	00 08                	add    BYTE PTR [eax],cl
 538:	20 08                	and    BYTE PTR [eax],cl
 53a:	13 59 02             	adc    ebx,DWORD PTR [ecx+0x2]
 53d:	02 00                	add    al,BYTE PTR [eax]
 53f:	01 01                	add    DWORD PTR [ecx],eax

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
  55:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  58:	64                   	fs
  59:	53                   	push   ebx
  5a:	6c                   	ins    BYTE PTR es:[edi],dx
  5b:	65                   	gs
  5c:	65                   	gs
  5d:	70 00                	jo     5f <cmdClearScreen-0x30fffa1>
  5f:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
  62:	50                   	push   eax
  63:	72 69                	jb     ce <cmdClearScreen-0x30fff32>
  65:	6e                   	outs   dx,BYTE PTR ds:[esi]
  66:	74 45                	je     ad <cmdClearScreen-0x30fff53>
  68:	6e                   	outs   dx,BYTE PTR ds:[esi]
  69:	76 00                	jbe    6b <cmdClearScreen-0x30fff95>
  6b:	68 65 61 70 45       	push   0x45706165
  70:	6e                   	outs   dx,BYTE PTR ds:[esi]
  71:	64 00 64 65 73       	add    BYTE PTR fs:[ebp+eiz*2+0x73],ah
  76:	63 72 69             	arpl   WORD PTR [edx+0x69],si
  79:	70 74                	jo     ef <cmdClearScreen-0x30fff11>
  7b:	69 6f 6e 00 73 69 7a 	imul   ebp,DWORD PTR [edi+0x6e],0x7a697300
  82:	65                   	gs
  83:	74 79                	je     fe <cmdClearScreen-0x30fff02>
  85:	70 65                	jo     ec <cmdClearScreen-0x30fff14>
  87:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  8a:	64                   	fs
  8b:	45                   	inc    ebp
  8c:	78 65                	js     f3 <cmdClearScreen-0x30fff0d>
  8e:	63 70 00             	arpl   WORD PTR [eax+0x0],si
  91:	53                   	push   ebx
  92:	49                   	dec    ecx
  93:	47                   	inc    edi
  94:	53                   	push   ebx
  95:	54                   	push   esp
  96:	4f                   	dec    edi
  97:	50                   	push   eax
  98:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  9b:	64                   	fs
  9c:	6c                   	ins    BYTE PTR es:[edi],dx
  9d:	69 6e 65 00 47 4e 55 	imul   ebp,DWORD PTR [esi+0x65],0x554e4700
  a4:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  a7:	39 20                	cmp    DWORD PTR [eax],esp
  a9:	35 2e 33 2e 30       	xor    eax,0x302e332e
  ae:	20 2d 6d 61 73 6d    	and    BYTE PTR ds:0x6d73616d,ch
  b4:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  b9:	6c                   	ins    BYTE PTR es:[edi],dx
  ba:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  c0:	65                   	gs
  c1:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  c6:	72 69                	jb     131 <cmdClearScreen-0x30ffecf>
  c8:	63 20                	arpl   WORD PTR [eax],sp
  ca:	2d 6d 61 72 63       	sub    eax,0x6372616d
  cf:	68 3d 70 65 6e       	push   0x6e65703d
  d4:	74 69                	je     13f <cmdClearScreen-0x30ffec1>
  d6:	75 6d                	jne    145 <cmdClearScreen-0x30ffebb>
  d8:	70 72                	jo     14c <cmdClearScreen-0x30ffeb4>
  da:	6f                   	outs   dx,DWORD PTR ds:[esi]
  db:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  e1:	74 64                	je     147 <cmdClearScreen-0x30ffeb9>
  e3:	3d 63 39 39 20       	cmp    eax,0x20393963
  e8:	2d 66 66 72 65       	sub    eax,0x65726666
  ed:	65                   	gs
  ee:	73 74                	jae    164 <cmdClearScreen-0x30ffe9c>
  f0:	61                   	popa   
  f1:	6e                   	outs   dx,BYTE PTR ds:[esi]
  f2:	64 69 6e 67 00 73 72 	imul   ebp,DWORD PTR fs:[esi+0x67],0x63727300
  f9:	63 
  fa:	2f                   	das    
  fb:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  fe:	6d                   	ins    DWORD PTR es:[edi],dx
  ff:	61                   	popa   
 100:	6e                   	outs   dx,BYTE PTR ds:[esi]
 101:	64                   	fs
 102:	73 2e                	jae    132 <cmdClearScreen-0x30ffece>
 104:	63 00                	arpl   WORD PTR [eax],ax
 106:	53                   	push   ebx
 107:	49                   	dec    ecx
 108:	47                   	inc    edi
 109:	55                   	push   ebp
 10a:	53                   	push   ebx
 10b:	4c                   	dec    esp
 10c:	45                   	inc    ebp
 10d:	45                   	inc    ebp
 10e:	50                   	push   eax
 10f:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 112:	64                   	fs
 113:	50                   	push   eax
 114:	77 64                	ja     17a <cmdClearScreen-0x30ffe86>
 116:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
 119:	6f                   	outs   dx,DWORD PTR ds:[esi]
 11a:	72 74                	jb     190 <cmdClearScreen-0x30ffe70>
 11c:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 11f:	74 00                	je     121 <cmdClearScreen-0x30ffedf>
 121:	74 69                	je     18c <cmdClearScreen-0x30ffe74>
 123:	6d                   	ins    DWORD PTR es:[edi],dx
 124:	65                   	gs
 125:	54                   	push   esp
 126:	6f                   	outs   dx,DWORD PTR ds:[esi]
 127:	45                   	inc    ebp
 128:	78 69                	js     193 <cmdClearScreen-0x30ffe6d>
 12a:	74 00                	je     12c <cmdClearScreen-0x30ffed4>
 12c:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 12f:	73 00                	jae    131 <cmdClearScreen-0x30ffecf>
 131:	73 74                	jae    1a7 <cmdClearScreen-0x30ffe59>
 133:	61                   	popa   
 134:	72 74                	jb     1aa <cmdClearScreen-0x30ffe56>
 136:	54                   	push   esp
 137:	69 63 6b 73 00 6b 65 	imul   esp,DWORD PTR [ebx+0x6b],0x656b0073
 13e:	78 65                	js     1a5 <cmdClearScreen-0x30ffe5b>
 140:	63 00                	arpl   WORD PTR [eax],ax
 142:	75 69                	jne    1ad <cmdClearScreen-0x30ffe53>
 144:	6e                   	outs   dx,BYTE PTR ds:[esi]
 145:	74 38                	je     17f <cmdClearScreen-0x30ffe81>
 147:	5f                   	pop    edi
 148:	74 00                	je     14a <cmdClearScreen-0x30ffeb6>
 14a:	65                   	gs
 14b:	73 69                	jae    1b6 <cmdClearScreen-0x30ffe4a>
 14d:	67 6e                	outs   dx,BYTE PTR ds:[si]
 14f:	61                   	popa   
 150:	6c                   	ins    BYTE PTR es:[edi],dx
 151:	73 00                	jae    153 <cmdClearScreen-0x30ffead>
 153:	75 69                	jne    1be <cmdClearScreen-0x30ffe42>
 155:	6e                   	outs   dx,BYTE PTR ds:[esi]
 156:	74 70                	je     1c8 <cmdClearScreen-0x30ffe38>
 158:	74 72                	je     1cc <cmdClearScreen-0x30ffe34>
 15a:	5f                   	pop    edi
 15b:	74 00                	je     15d <cmdClearScreen-0x30ffea3>
 15d:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 160:	6d                   	ins    DWORD PTR es:[edi],dx
 161:	61                   	popa   
 162:	6e                   	outs   dx,BYTE PTR ds:[esi]
 163:	64                   	fs
 164:	5f                   	pop    edi
 165:	66                   	data16
 166:	75 6e                	jne    1d6 <cmdClearScreen-0x30ffe2a>
 168:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 16c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 16d:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 170:	74 56                	je     1c8 <cmdClearScreen-0x30ffe38>
 172:	61                   	popa   
 173:	6c                   	ins    BYTE PTR es:[edi],dx
 174:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 177:	64                   	fs
 178:	43                   	inc    ebx
 179:	6c                   	ins    BYTE PTR es:[edi],dx
 17a:	65                   	gs
 17b:	61                   	popa   
 17c:	72 53                	jb     1d1 <cmdClearScreen-0x30ffe2f>
 17e:	63 72 65             	arpl   WORD PTR [edx+0x65],si
 181:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 183:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 186:	72 61                	jb     1e9 <cmdClearScreen-0x30ffe17>
 188:	6d                   	ins    DWORD PTR es:[edi],dx
 189:	43                   	inc    ebx
 18a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 18b:	75 6e                	jne    1fb <cmdClearScreen-0x30ffe05>
 18d:	74 00                	je     18f <cmdClearScreen-0x30ffe71>
 18f:	70 63                	jo     1f4 <cmdClearScreen-0x30ffe0c>
 191:	6f                   	outs   dx,DWORD PTR ds:[esi]
 192:	75 6e                	jne    202 <cmdClearScreen-0x30ffdfe>
 194:	74 00                	je     196 <cmdClearScreen-0x30ffe6a>
 196:	62 53 69             	bound  edx,QWORD PTR [ebx+0x69]
 199:	67 49                	addr16 dec ecx
 19b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 19c:	74 52                	je     1f0 <cmdClearScreen-0x30ffe10>
 19e:	65 63 65 69          	arpl   WORD PTR gs:[ebp+0x69],sp
 1a2:	76 65                	jbe    209 <cmdClearScreen-0x30ffdf7>
 1a4:	64 00 6c 6f 6e       	add    BYTE PTR fs:[edi+ebp*2+0x6e],ch
 1a9:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 1ad:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1ae:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 1b2:	74 00                	je     1b4 <cmdClearScreen-0x30ffe4c>
 1b4:	76 61                	jbe    217 <cmdClearScreen-0x30ffde9>
 1b6:	72 4e                	jb     206 <cmdClearScreen-0x30ffdfa>
 1b8:	61                   	popa   
 1b9:	6d                   	ins    DWORD PTR es:[edi],dx
 1ba:	65 00 63 6f          	add    BYTE PTR gs:[ebx+0x6f],ah
 1be:	6d                   	ins    DWORD PTR es:[edi],dx
 1bf:	6d                   	ins    DWORD PTR es:[edi],dx
 1c0:	61                   	popa   
 1c1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1c2:	64                   	fs
 1c3:	5f                   	pop    edi
 1c4:	66                   	data16
 1c5:	75 6e                	jne    235 <cmdClearScreen-0x30ffdcb>
 1c7:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 1cb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1cc:	5f                   	pop    edi
 1cd:	70 00                	jo     1cf <cmdClearScreen-0x30ffe31>
 1cf:	70 61                	jo     232 <cmdClearScreen-0x30ffdce>
 1d1:	64 31 00             	xor    DWORD PTR fs:[eax],eax
 1d4:	70 61                	jo     237 <cmdClearScreen-0x30ffdc9>
 1d6:	64 32 00             	xor    al,BYTE PTR fs:[eax]
 1d9:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
 1dc:	6c                   	ins    BYTE PTR es:[edi],dx
 1dd:	64                   	fs
 1de:	50                   	push   eax
 1df:	69 64 00 62 61 63 6b 	imul   esp,DWORD PTR [eax+eax*1+0x62],0x676b6361
 1e6:	67 
 1e7:	72 6f                	jb     258 <cmdClearScreen-0x30ffda8>
 1e9:	75 6e                	jne    259 <cmdClearScreen-0x30ffda7>
 1eb:	64 00 53 49          	add    BYTE PTR fs:[ebx+0x49],dl
 1ef:	47                   	inc    edi
 1f0:	53                   	push   ebx
 1f1:	4c                   	dec    esp
 1f2:	45                   	inc    ebp
 1f3:	45                   	inc    ebp
 1f4:	50                   	push   eax
 1f5:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 1f8:	61                   	popa   
 1f9:	70 43                	jo     23e <cmdClearScreen-0x30ffdc2>
 1fb:	75 72                	jne    26f <cmdClearScreen-0x30ffd91>
 1fd:	72 00                	jb     1ff <cmdClearScreen-0x30ffe01>
 1ff:	73 45                	jae    246 <cmdClearScreen-0x30ffdba>
 201:	78 65                	js     268 <cmdClearScreen-0x30ffd98>
 203:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 206:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
 20d:	72 61                	jb     270 <cmdClearScreen-0x30ffd90>
 20f:	6d                   	ins    DWORD PTR es:[edi],dx
 210:	00 64 65 6c          	add    BYTE PTR [ebp+eiz*2+0x6c],ah
 214:	69 6d 00 6e 65 77 43 	imul   ebp,DWORD PTR [ebp+0x0],0x4377656e
 21b:	6d                   	ins    DWORD PTR es:[edi],dx
 21c:	64                   	fs
 21d:	4c                   	dec    esp
 21e:	69 6e 65 00 63 6d 64 	imul   ebp,DWORD PTR [esi+0x65],0x646d6300
 225:	52                   	push   edx
 226:	65                   	gs
 227:	70 65                	jo     28e <cmdClearScreen-0x30ffd72>
 229:	61                   	popa   
 22a:	74 00                	je     22c <cmdClearScreen-0x30ffdd4>
 22c:	70 61                	jo     28f <cmdClearScreen-0x30ffd71>
 22e:	72 61                	jb     291 <cmdClearScreen-0x30ffd6f>
 230:	6d                   	ins    DWORD PTR es:[edi],dx
 231:	73 00                	jae    233 <cmdClearScreen-0x30ffdcd>
 233:	6e                   	outs   dx,BYTE PTR ds:[esi]
 234:	61                   	popa   
 235:	6d                   	ins    DWORD PTR es:[edi],dx
 236:	65 00 66 6f          	add    BYTE PTR gs:[esi+0x6f],ah
 23a:	72 6b                	jb     2a7 <cmdClearScreen-0x30ffd59>
 23c:	50                   	push   eax
 23d:	69 64 00 75 6e 73 69 	imul   esp,DWORD PTR [eax+eax*1+0x75],0x6769736e
 244:	67 
 245:	6e                   	outs   dx,BYTE PTR ds:[esi]
 246:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 24b:	61                   	popa   
 24c:	72 00                	jb     24e <cmdClearScreen-0x30ffdb2>
 24e:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 251:	48                   	dec    eax
 252:	65                   	gs
 253:	6c                   	ins    BYTE PTR es:[edi],dx
 254:	70 00                	jo     256 <cmdClearScreen-0x30ffdaa>
 256:	6c                   	ins    BYTE PTR es:[edi],dx
 257:	6f                   	outs   dx,DWORD PTR ds:[esi]
 258:	6e                   	outs   dx,BYTE PTR ds:[esi]
 259:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 25d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 25e:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 262:	73 69                	jae    2cd <cmdClearScreen-0x30ffd33>
 264:	67 6e                	outs   dx,BYTE PTR ds:[si]
 266:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 26b:	74 00                	je     26d <cmdClearScreen-0x30ffd93>
 26d:	65                   	gs
 26e:	66 61                	popaw  
 270:	6d                   	ins    DWORD PTR es:[edi],dx
 271:	69 6c 79 00 75 69 6e 	imul   ebp,DWORD PTR [ecx+edi*2+0x0],0x746e6975
 278:	74 
 279:	33 32                	xor    esi,DWORD PTR [edx]
 27b:	5f                   	pop    edi
 27c:	74 00                	je     27e <cmdClearScreen-0x30ffd82>
 27e:	6c                   	ins    BYTE PTR es:[edi],dx
 27f:	61                   	popa   
 280:	73 74                	jae    2f6 <cmdClearScreen-0x30ffd0a>
 282:	45                   	inc    ebp
 283:	78 65                	js     2ea <cmdClearScreen-0x30ffd16>
 285:	63 45 78             	arpl   WORD PTR [ebp+0x78],ax
 288:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x70006564
 28f:	70 
 290:	72 6f                	jb     301 <cmdClearScreen-0x30ffcff>
 292:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 295:	73 45                	jae    2dc <cmdClearScreen-0x30ffd24>
 297:	6e                   	outs   dx,BYTE PTR ds:[esi]
 298:	76 70                	jbe    30a <cmdClearScreen-0x30ffcf6>
 29a:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 29d:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x73006564
 2a4:	73 
 2a5:	68 6f 72 74 20       	push   0x2074726f
 2aa:	75 6e                	jne    31a <cmdClearScreen-0x30ffce6>
 2ac:	73 69                	jae    317 <cmdClearScreen-0x30ffce9>
 2ae:	67 6e                	outs   dx,BYTE PTR ds:[si]
 2b0:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 2b5:	74 00                	je     2b7 <cmdClearScreen-0x30ffd49>
 2b7:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2b9:	64                   	fs
 2ba:	54                   	push   esp
 2bb:	69 63 6b 73 00 65 6d 	imul   esp,DWORD PTR [ebx+0x6b],0x6d650073
 2c2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2c3:	64                   	fs
 2c4:	65                   	gs
 2c5:	6c                   	ins    BYTE PTR es:[edi],dx
 2c6:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 2c9:	64                   	fs
 2ca:	53                   	push   ebx
 2cb:	65                   	gs
 2cc:	74 45                	je     313 <cmdClearScreen-0x30ffced>
 2ce:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2cf:	76 00                	jbe    2d1 <cmdClearScreen-0x30ffd2f>
 2d1:	53                   	push   ebx
 2d2:	49                   	dec    ecx
 2d3:	47                   	inc    edi
 2d4:	49                   	dec    ecx
 2d5:	4f                   	dec    edi
 2d6:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 2d9:	64                   	fs
 2da:	54                   	push   esp
 2db:	69 6d 65 00 5f 42 6f 	imul   ebp,DWORD PTR [ebp+0x65],0x6f425f00
 2e2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2e3:	6c                   	ins    BYTE PTR es:[edi],dx
 2e4:	00 53 49             	add    BYTE PTR [ebx+0x49],dl
 2e7:	47                   	inc    edi
 2e8:	48                   	dec    eax
 2e9:	41                   	inc    ecx
 2ea:	4c                   	dec    esp
 2eb:	54                   	push   esp
 2ec:	00 74 65 73          	add    BYTE PTR [ebp+eiz*2+0x73],dh
 2f0:	74 00                	je     2f2 <cmdClearScreen-0x30ffd0e>
 2f2:	53                   	push   ebx
 2f3:	49                   	dec    ecx
 2f4:	47                   	inc    edi
 2f5:	53                   	push   ebx
 2f6:	45                   	inc    ebp
 2f7:	47                   	inc    edi
 2f8:	56                   	push   esi
 2f9:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 2fc:	7a 65                	jp     363 <cmdClearScreen-0x30ffc9d>
 2fe:	00 66 6f             	add    BYTE PTR [esi+0x6f],ah
 301:	75 6e                	jne    371 <cmdClearScreen-0x30ffc8f>
 303:	64 00 68 65          	add    BYTE PTR fs:[eax+0x65],ch
 307:	61                   	popa   
 308:	70 42                	jo     34c <cmdClearScreen-0x30ffcb4>
 30a:	61                   	popa   
 30b:	73 65                	jae    372 <cmdClearScreen-0x30ffc8e>
 30d:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 310:	74 68                	je     37a <cmdClearScreen-0x30ffc86>
 312:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
 315:	75 69                	jne    380 <cmdClearScreen-0x30ffc80>
 317:	64                   	fs
 318:	5f                   	pop    edi
 319:	65                   	gs
 31a:	78 74                	js     390 <cmdClearScreen-0x30ffc70>
 31c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31e:	64                   	fs
 31f:	65                   	gs
 320:	64                   	fs
 321:	5f                   	pop    edi
 322:	66                   	data16
 323:	65                   	gs
 324:	61                   	popa   
 325:	74 75                	je     39c <cmdClearScreen-0x30ffc64>
 327:	72 65                	jb     38e <cmdClearScreen-0x30ffc72>
 329:	5f                   	pop    edi
 32a:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
 32d:	73 00                	jae    32f <cmdClearScreen-0x30ffcd1>
 32f:	70 72                	jo     3a3 <cmdClearScreen-0x30ffc5d>
 331:	65                   	gs
 332:	66                   	data16
 333:	65                   	gs
 334:	74 63                	je     399 <cmdClearScreen-0x30ffc67>
 336:	68 77 74 31 00       	push   0x317477
 33b:	6c                   	ins    BYTE PTR es:[edi],dx
 33c:	69 62 63 54 5a 00 61 	imul   esp,DWORD PTR [edx+0x63],0x61005a54
 343:	76 78                	jbe    3bd <cmdClearScreen-0x30ffc43>
 345:	35 31 32 76 62       	xor    eax,0x62763231
 34a:	6d                   	ins    DWORD PTR es:[edi],dx
 34b:	69 00 76 61 6c 75    	imul   eax,DWORD PTR [eax],0x756c6176
 351:	65                   	gs
 352:	4c                   	dec    esp
 353:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 355:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
 358:	75 69                	jne    3c3 <cmdClearScreen-0x30ffc3d>
 35a:	64                   	fs
 35b:	5f                   	pop    edi
 35c:	70 72                	jo     3d0 <cmdClearScreen-0x30ffc30>
 35e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 35f:	63 69 6e             	arpl   WORD PTR [ecx+0x6e],bp
 362:	66 6f                	outs   dx,WORD PTR ds:[esi]
 364:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 367:	73 65                	jae    3ce <cmdClearScreen-0x30ffc32>
 369:	72 76                	jb     3e1 <cmdClearScreen-0x30ffc1f>
 36b:	65 64 00 53 49       	gs add BYTE PTR fs:gs:[ebx+0x49],dl
 370:	47                   	inc    edi
 371:	49                   	dec    ecx
 372:	4e                   	dec    esi
 373:	54                   	push   esp
 374:	00 73 4b             	add    BYTE PTR [ebx+0x4b],dh
 377:	53                   	push   ebx
 378:	68 65 6c 6c 50       	push   0x506c6c65
 37d:	72 6f                	jb     3ee <cmdClearScreen-0x30ffc12>
 37f:	67 72 61             	addr16 jb 3e3 <cmdClearScreen-0x30ffc1d>
 382:	6d                   	ins    DWORD PTR es:[edi],dx
 383:	4e                   	dec    esi
 384:	61                   	popa   
 385:	6d                   	ins    DWORD PTR es:[edi],dx
 386:	65 00 73 74          	add    BYTE PTR gs:[ebx+0x74],dh
 38a:	65                   	gs
 38b:	70 00                	jo     38d <cmdClearScreen-0x30ffc73>
 38d:	6b 65 78 65          	imul   esp,DWORD PTR [ebp+0x78],0x65
 391:	63 32                	arpl   WORD PTR [edx],si
 393:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 396:	6d                   	ins    DWORD PTR es:[edi],dx
 397:	6d                   	ins    DWORD PTR es:[edi],dx
 398:	61                   	popa   
 399:	6e                   	outs   dx,BYTE PTR ds:[esi]
 39a:	64                   	fs
 39b:	5f                   	pop    edi
 39c:	74 61                	je     3ff <cmdClearScreen-0x30ffc01>
 39e:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
 3a2:	74 00                	je     3a4 <cmdClearScreen-0x30ffc5c>
 3a4:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 3a6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3a7:	65                   	gs
 3a8:	47                   	inc    edi
 3a9:	65                   	gs
 3aa:	74 74                	je     420 <cmdClearScreen-0x30ffbe0>
 3ac:	69 6e 67 4b 65 79 73 	imul   ebp,DWORD PTR [esi+0x67],0x7379654b
 3b3:	00 6c 52 65          	add    BYTE PTR [edx+edx*2+0x65],ch
 3b7:	74 56                	je     40f <cmdClearScreen-0x30ffbf1>
 3b9:	61                   	popa   
 3ba:	6c                   	ins    BYTE PTR es:[edi],dx
 3bb:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 3be:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3bf:	6d                   	ins    DWORD PTR es:[edi],dx
 3c0:	70 74                	jo     436 <cmdClearScreen-0x30ffbca>
 3c2:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 3c5:	76 70                	jbe    437 <cmdClearScreen-0x30ffbc9>
 3c7:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 3ca:	6d                   	ins    DWORD PTR es:[edi],dx
 3cb:	6d                   	ins    DWORD PTR es:[edi],dx
 3cc:	61                   	popa   
 3cd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3ce:	64                   	fs
 3cf:	48                   	dec    eax
 3d0:	69 73 74 6f 72 79 4d 	imul   esi,DWORD PTR [ebx+0x74],0x4d79726f
 3d7:	61                   	popa   
 3d8:	78 00                	js     3da <cmdClearScreen-0x30ffc26>
 3da:	74 65                	je     441 <cmdClearScreen-0x30ffbbf>
 3dc:	6d                   	ins    DWORD PTR es:[edi],dx
 3dd:	70 00                	jo     3df <cmdClearScreen-0x30ffc21>
 3df:	70 61                	jo     442 <cmdClearScreen-0x30ffbbe>
 3e1:	72 73                	jb     456 <cmdClearScreen-0x30ffbaa>
 3e3:	65                   	gs
 3e4:	50                   	push   eax
 3e5:	61                   	popa   
 3e6:	72 61                	jb     449 <cmdClearScreen-0x30ffbb7>
 3e8:	6d                   	ins    DWORD PTR es:[edi],dx
 3e9:	73 53                	jae    43e <cmdClearScreen-0x30ffbc2>
 3eb:	68 65 6c 6c 00       	push   0x6c6c65
 3f0:	69 6e 70 75 74 00 6c 	imul   ebp,DWORD PTR [esi+0x70],0x6c007475
 3f7:	43                   	inc    ebx
 3f8:	75 72                	jne    46c <cmdClearScreen-0x30ffb94>
 3fa:	72 4b                	jb     447 <cmdClearScreen-0x30ffbb9>
 3fc:	65                   	gs
 3fd:	79 43                	jns    442 <cmdClearScreen-0x30ffbbe>
 3ff:	6f                   	outs   dx,DWORD PTR ds:[esi]
 400:	75 6e                	jne    470 <cmdClearScreen-0x30ffb90>
 402:	74 00                	je     404 <cmdClearScreen-0x30ffbfc>
 404:	70 61                	jo     467 <cmdClearScreen-0x30ffb99>
 406:	72 73                	jb     47b <cmdClearScreen-0x30ffb85>
 408:	65                   	gs
 409:	64                   	fs
 40a:	43                   	inc    ebx
 40b:	68 61 72 73 00       	push   0x737261
 410:	70 70                	jo     482 <cmdClearScreen-0x30ffb7e>
 412:	74 72                	je     486 <cmdClearScreen-0x30ffb7a>
 414:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 417:	65 63 49 6e          	arpl   WORD PTR gs:[ecx+0x6e],cx
 41b:	74 65                	je     482 <cmdClearScreen-0x30ffb7e>
 41d:	72 6e                	jb     48d <cmdClearScreen-0x30ffb73>
 41f:	61                   	popa   
 420:	6c                   	ins    BYTE PTR es:[edi],dx
 421:	43                   	inc    ebx
 422:	6f                   	outs   dx,DWORD PTR ds:[esi]
 423:	6d                   	ins    DWORD PTR es:[edi],dx
 424:	6d                   	ins    DWORD PTR es:[edi],dx
 425:	61                   	popa   
 426:	6e                   	outs   dx,BYTE PTR ds:[esi]
 427:	64 00 76 61          	add    BYTE PTR fs:[esi+0x61],dh
 42b:	6c                   	ins    BYTE PTR es:[edi],dx
 42c:	75 65                	jne    493 <cmdClearScreen-0x30ffb6d>
 42e:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 431:	74 45                	je     478 <cmdClearScreen-0x30ffb88>
 433:	6e                   	outs   dx,BYTE PTR ds:[esi]
 434:	76 56                	jbe    48c <cmdClearScreen-0x30ffb74>
 436:	61                   	popa   
 437:	72 69                	jb     4a2 <cmdClearScreen-0x30ffb5e>
 439:	61                   	popa   
 43a:	62 6c 65 56          	bound  ebp,QWORD PTR [ebp+eiz*2+0x56]
 43e:	61                   	popa   
 43f:	6c                   	ins    BYTE PTR es:[edi],dx
 440:	75 65                	jne    4a7 <cmdClearScreen-0x30ffb59>
 442:	00 64 71 75          	add    BYTE PTR [ecx+esi*2+0x75],ah
 446:	6f                   	outs   dx,DWORD PTR ds:[esi]
 447:	74 65                	je     4ae <cmdClearScreen-0x30ffb52>
 449:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 44c:	65                   	gs
 44d:	65                   	gs
 44e:	41                   	inc    ecx
 44f:	72 67                	jb     4b8 <cmdClearScreen-0x30ffb48>
 451:	56                   	push   esi
 452:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
 456:	72 72                	jb     4ca <cmdClearScreen-0x30ffb36>
 458:	4b                   	dec    ebx
 459:	65                   	gs
 45a:	79 00                	jns    45c <cmdClearScreen-0x30ffba4>
 45c:	70 61                	jo     4bf <cmdClearScreen-0x30ffb41>
 45e:	72 61                	jb     4c1 <cmdClearScreen-0x30ffb3f>
 460:	6d                   	ins    DWORD PTR es:[edi],dx
 461:	73 54                	jae    4b7 <cmdClearScreen-0x30ffb49>
 463:	6f                   	outs   dx,DWORD PTR ds:[esi]
 464:	41                   	inc    ecx
 465:	72 67                	jb     4ce <cmdClearScreen-0x30ffb32>
 467:	76 00                	jbe    469 <cmdClearScreen-0x30ffb97>
 469:	62 73 71             	bound  esi,QWORD PTR [ebx+0x71]
 46c:	75 6f                	jne    4dd <cmdClearScreen-0x30ffb23>
 46e:	74 65                	je     4d5 <cmdClearScreen-0x30ffb2b>
 470:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 473:	70 72                	jo     4e7 <cmdClearScreen-0x30ffb19>
 475:	69 6e 74 43 6f 6d 6d 	imul   ebp,DWORD PTR [esi+0x74],0x6d6d6f43
 47c:	61                   	popa   
 47d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 47e:	64 00 67 65          	add    BYTE PTR fs:[edi+0x65],ah
 482:	74 41                	je     4c5 <cmdClearScreen-0x30ffb3b>
 484:	43                   	inc    ebx
 485:	6f                   	outs   dx,DWORD PTR ds:[esi]
 486:	6d                   	ins    DWORD PTR es:[edi],dx
 487:	6d                   	ins    DWORD PTR es:[edi],dx
 488:	61                   	popa   
 489:	6e                   	outs   dx,BYTE PTR ds:[esi]
 48a:	64 00 6d 61          	add    BYTE PTR fs:[ebp+0x61],ch
 48e:	78 61                	js     4f1 <cmdClearScreen-0x30ffb0f>
 490:	72 67                	jb     4f9 <cmdClearScreen-0x30ffb07>
 492:	63 00                	arpl   WORD PTR [eax],ax
 494:	70 72                	jo     508 <cmdClearScreen-0x30ffaf8>
 496:	6f                   	outs   dx,DWORD PTR ds:[esi]
 497:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 49a:	73 53                	jae    4ef <cmdClearScreen-0x30ffb11>
 49c:	69 67 6e 61 6c 00 6e 	imul   esp,DWORD PTR [edi+0x6e],0x6e006c61
 4a3:	65                   	gs
 4a4:	65                   	gs
 4a5:	64                   	fs
 4a6:	44                   	inc    esp
 4a7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4a8:	75 62                	jne    50c <cmdClearScreen-0x30ffaf4>
 4aa:	6c                   	ins    BYTE PTR es:[edi],dx
 4ab:	65                   	gs
 4ac:	51                   	push   ecx
 4ad:	75 6f                	jne    51e <cmdClearScreen-0x30ffae2>
 4af:	74 65                	je     516 <cmdClearScreen-0x30ffaea>
 4b1:	74 6f                	je     522 <cmdClearScreen-0x30ffade>
 4b3:	45                   	inc    ebp
 4b4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4b5:	64                   	fs
 4b6:	50                   	push   eax
 4b7:	61                   	popa   
 4b8:	72 61                	jb     51b <cmdClearScreen-0x30ffae5>
 4ba:	6d                   	ins    DWORD PTR es:[edi],dx
 4bb:	00 65 76             	add    BYTE PTR [ebp+0x76],ah
 4be:	4e                   	dec    esi
 4bf:	61                   	popa   
 4c0:	6d                   	ins    DWORD PTR es:[edi],dx
 4c1:	65 00 73 61          	add    BYTE PTR gs:[ebx+0x61],dh
 4c5:	76 65                	jbe    52c <cmdClearScreen-0x30ffad4>
 4c7:	43                   	inc    ebx
 4c8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4c9:	6d                   	ins    DWORD PTR es:[edi],dx
 4ca:	6d                   	ins    DWORD PTR es:[edi],dx
 4cb:	61                   	popa   
 4cc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4cd:	64 00 62 75          	add    BYTE PTR fs:[edx+0x75],ah
 4d1:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 4d8:	00 
 4d9:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 4dc:	6d                   	ins    DWORD PTR es:[edi],dx
 4dd:	61                   	popa   
 4de:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4df:	64                   	fs
 4e0:	48                   	dec    eax
 4e1:	69 73 74 6f 72 79 00 	imul   esi,DWORD PTR [ebx+0x74],0x79726f
 4e8:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 4eb:	6d                   	ins    DWORD PTR es:[edi],dx
 4ec:	61                   	popa   
 4ed:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4ee:	64                   	fs
 4ef:	48                   	dec    eax
 4f0:	69 73 74 6f 72 79 50 	imul   esi,DWORD PTR [ebx+0x74],0x5079726f
 4f7:	74 72                	je     56b <cmdClearScreen-0x30ffa95>
 4f9:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 4fc:	67 6e                	outs   dx,BYTE PTR ds:[si]
 4fe:	61                   	popa   
 4ff:	6c                   	ins    BYTE PTR es:[edi],dx
 500:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 503:	63 2f                	arpl   WORD PTR [edi],bp
 505:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 509:	6c                   	ins    BYTE PTR es:[edi],dx
 50a:	6c                   	ins    BYTE PTR es:[edi],dx
 50b:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 50e:	6b 53 68 65          	imul   edx,DWORD PTR [ebx+0x68],0x65
 512:	6c                   	ins    BYTE PTR es:[edi],dx
 513:	6c                   	ins    BYTE PTR es:[edi],dx
 514:	00 61 6e             	add    BYTE PTR [ecx+0x6e],ah
 517:	73 69                	jae    582 <cmdClearScreen-0x30ffa7e>
 519:	53                   	push   ebx
 51a:	65                   	gs
 51b:	71 00                	jno    51d <cmdClearScreen-0x30ffae3>
 51d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 51e:	61                   	popa   
 51f:	72 67                	jb     588 <cmdClearScreen-0x30ffa78>
 521:	76 00                	jbe    523 <cmdClearScreen-0x30ffadd>
 523:	68 61 6e 64 6c       	push   0x6c646e61
 528:	65                   	gs
 529:	53                   	push   ebx
 52a:	69 67 6e 61 6c 73 00 	imul   esp,DWORD PTR [edi+0x6e],0x736c61
 531:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 534:	4c                   	dec    esp
 535:	69 6e 65 00 63 6f 6d 	imul   ebp,DWORD PTR [esi+0x65],0x6d6f6300
 53c:	6d                   	ins    DWORD PTR es:[edi],dx
 53d:	61                   	popa   
 53e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 53f:	64 00 66 69          	add    BYTE PTR fs:[esi+0x69],ah
 543:	6e                   	outs   dx,BYTE PTR ds:[esi]
 544:	64                   	fs
 545:	43                   	inc    ebx
 546:	6f                   	outs   dx,DWORD PTR ds:[esi]
 547:	6d                   	ins    DWORD PTR es:[edi],dx
 548:	6d                   	ins    DWORD PTR es:[edi],dx
 549:	61                   	popa   
 54a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 54b:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 54f:	70 79                	jo     5ca <cmdClearScreen-0x30ffa36>
 551:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 554:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 557:	73 65                	jae    5be <cmdClearScreen-0x30ffa42>
 559:	74 52                	je     5ad <cmdClearScreen-0x30ffa53>
 55b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 55c:	77 00                	ja     55e <cmdClearScreen-0x30ffaa2>
 55e:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 561:	6d                   	ins    DWORD PTR es:[edi],dx
 562:	61                   	popa   
 563:	6e                   	outs   dx,BYTE PTR ds:[esi]
 564:	64                   	fs
 565:	57                   	push   edi
 566:	61                   	popa   
 567:	73 46                	jae    5af <cmdClearScreen-0x30ffa51>
 569:	72 6f                	jb     5da <cmdClearScreen-0x30ffa26>
 56b:	6d                   	ins    DWORD PTR es:[edi],dx
 56c:	54                   	push   esp
 56d:	68 69 73 42 75       	push   0x75427369
 572:	66                   	data16
 573:	66                   	data16
 574:	65                   	gs
 575:	72 50                	jb     5c7 <cmdClearScreen-0x30ffa39>
 577:	74 72                	je     5eb <cmdClearScreen-0x30ffa15>
 579:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 57c:	74 41                	je     5bf <cmdClearScreen-0x30ffa41>
 57e:	4b                   	dec    ebx
 57f:	65                   	gs
 580:	79 00                	jns    582 <cmdClearScreen-0x30ffa7e>

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
