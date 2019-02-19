
Debug/GNU-Linux/kshell:     file format elf32-i386


Disassembly of section .text:

03100000 <cmdClearScreen>:
cmdClearScreen():
/home/yogi/src/os/aproj/kshell/src/commands.c:13
#include <stdio.h>

#include "kshell.h"

void cmdClearScreen()
{
 3100000:	55                   	push   ebp
 3100001:	89 e5                	mov    ebp,esp
 3100003:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:14
    printf("\033[2J");
 3100006:	83 ec 0c             	sub    esp,0xc
 3100009:	68 d9 1d 10 03       	push   0x3101dd9
 310000e:	e8 5d 1a 00 00       	call   3101a70 <kShell+0x49a>
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
 3100028:	a1 cc 2e 10 03       	mov    eax,ds:0x3102ecc
 310002d:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100030:	c1 e2 02             	shl    edx,0x2
 3100033:	01 d0                	add    eax,edx
 3100035:	8b 00                	mov    eax,DWORD PTR [eax]
 3100037:	85 c0                	test   eax,eax
 3100039:	74 20                	je     310005b <cmdPrintEnv+0x42>
/home/yogi/src/os/aproj/kshell/src/commands.c:23
        {
            print("%s\n",environmentLoc[cnt]);
 310003b:	a1 cc 2e 10 03       	mov    eax,ds:0x3102ecc
 3100040:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100043:	c1 e2 02             	shl    edx,0x2
 3100046:	01 d0                	add    eax,edx
 3100048:	8b 00                	mov    eax,DWORD PTR [eax]
 310004a:	83 ec 08             	sub    esp,0x8
 310004d:	50                   	push   eax
 310004e:	68 de 1d 10 03       	push   0x3101dde
 3100053:	e8 08 1a 00 00       	call   3101a60 <kShell+0x48a>
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
 3100083:	e8 4e 0f 00 00       	call   3100fd6 <parseParamsShell>
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
 31000a4:	68 e2 1d 10 03       	push   0x3101de2
 31000a9:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000af:	50                   	push   eax
 31000b0:	e8 8b 1a 00 00       	call   3101b40 <kShell+0x56a>
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
 31000c4:	68 e4 1d 10 03       	push   0x3101de4
 31000c9:	e8 92 19 00 00       	call   3101a60 <kShell+0x48a>
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
 31000f0:	e8 5b 1b 00 00       	call   3101c50 <kShell+0x67a>
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
 3100111:	e8 9a 19 00 00       	call   3101ab0 <kShell+0x4da>
 3100116:	83 c4 10             	add    esp,0x10
 3100119:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:46
        varValue = malloc(valueLen);
 310011c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310011f:	83 ec 0c             	sub    esp,0xc
 3100122:	50                   	push   eax
 3100123:	e8 88 19 00 00       	call   3101ab0 <kShell+0x4da>
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
 310013f:	e8 2c 1a 00 00       	call   3101b70 <kShell+0x59a>
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
 310016b:	e8 00 1a 00 00       	call   3101b70 <kShell+0x59a>
 3100170:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:50
        strtrim(varName);
 3100173:	83 ec 0c             	sub    esp,0xc
 3100176:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100179:	e8 52 1a 00 00       	call   3101bd0 <kShell+0x5fa>
 310017e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:51
        strtrim(varValue);
 3100181:	83 ec 0c             	sub    esp,0xc
 3100184:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100187:	e8 44 1a 00 00       	call   3101bd0 <kShell+0x5fa>
 310018c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:52
        setenv(varName, varValue);
 310018f:	83 ec 08             	sub    esp,0x8
 3100192:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100195:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100198:	e8 e3 19 00 00       	call   3101b80 <kShell+0x5aa>
 310019d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:53
        free(varName);
 31001a0:	83 ec 0c             	sub    esp,0xc
 31001a3:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 31001a6:	e8 d5 1a 00 00       	call   3101c80 <kShell+0x6aa>
 31001ab:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:54
        free(varValue);
 31001ae:	83 ec 0c             	sub    esp,0xc
 31001b1:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 31001b4:	e8 c7 1a 00 00       	call   3101c80 <kShell+0x6aa>
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
 31001dd:	e8 7e 1a 00 00       	call   3101c60 <kShell+0x68a>
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
 3100200:	e8 4b 18 00 00       	call   3101a50 <kShell+0x47a>
 3100205:	83 c4 10             	add    esp,0x10
 3100208:	a3 1c 32 10 03       	mov    ds:0x310321c,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:71
            char ret[10];
            itoa(lastExecExitCode,ret);
 310020d:	a1 1c 32 10 03       	mov    eax,ds:0x310321c
 3100212:	89 c2                	mov    edx,eax
 3100214:	83 ec 08             	sub    esp,0x8
 3100217:	8d 45 ea             	lea    eax,[ebp-0x16]
 310021a:	50                   	push   eax
 310021b:	52                   	push   edx
 310021c:	e8 cf 18 00 00       	call   3101af0 <kShell+0x51a>
 3100221:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:72
            setenv("LASTEXIT",ret);
 3100224:	83 ec 08             	sub    esp,0x8
 3100227:	8d 45 ea             	lea    eax,[ebp-0x16]
 310022a:	50                   	push   eax
 310022b:	68 ff 1d 10 03       	push   0x3101dff
 3100230:	e8 4b 19 00 00       	call   3101b80 <kShell+0x5aa>
 3100235:	83 c4 10             	add    esp,0x10
 3100238:	eb 13                	jmp    310024d <kexec2+0x88>
/home/yogi/src/os/aproj/kshell/src/commands.c:76
        }
    }
    else
        print("Error executing %s\n",path);
 310023a:	83 ec 08             	sub    esp,0x8
 310023d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100240:	68 08 1e 10 03       	push   0x3101e08
 3100245:	e8 16 18 00 00       	call   3101a60 <kShell+0x48a>
 310024a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:78

}
 310024d:	90                   	nop
 310024e:	c9                   	leave  
 310024f:	c3                   	ret    

03100250 <resolvePathToExecutable>:
resolvePathToExecutable():
/home/yogi/src/os/aproj/kshell/src/commands.c:81

int resolvePathToExecutable(const char *inPath, char *outPath)
{
 3100250:	55                   	push   ebp
 3100251:	89 e5                	mov    ebp,esp
 3100253:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/commands.c:82
    char delim[2]=":";
 3100256:	66 c7 45 da 3a 00    	mov    WORD PTR [ebp-0x26],0x3a
/home/yogi/src/os/aproj/kshell/src/commands.c:84
    char *token;
    char *envPath=NULL;
 310025c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:85
    char *lInPath=NULL;
 3100263:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:86
    char *resPath=NULL;
 310026a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:87
    int retVal=-1;
 3100271:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [ebp-0x18],0xffffffff
/home/yogi/src/os/aproj/kshell/src/commands.c:93
    fstat_t fstat;
    
    //using the PATH variable, attempt to resolve the path to an executable when a path isn't given in the commandline
    
    //If there is a / character in the path, then don't attempt to resolve
    envPath=malloc(1024);
 3100278:	83 ec 0c             	sub    esp,0xc
 310027b:	68 00 04 00 00       	push   0x400
 3100280:	e8 2b 18 00 00       	call   3101ab0 <kShell+0x4da>
 3100285:	83 c4 10             	add    esp,0x10
 3100288:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:94
    getenv("PATH",envPath);
 310028b:	83 ec 08             	sub    esp,0x8
 310028e:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100291:	68 1c 1e 10 03       	push   0x3101e1c
 3100296:	e8 f5 17 00 00       	call   3101a90 <kShell+0x4ba>
 310029b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:96

    if (strstr(inPath, "/"))
 310029e:	83 ec 08             	sub    esp,0x8
 31002a1:	68 21 1e 10 03       	push   0x3101e21
 31002a6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31002a9:	e8 92 18 00 00       	call   3101b40 <kShell+0x56a>
 31002ae:	83 c4 10             	add    esp,0x10
 31002b1:	85 c0                	test   eax,eax
 31002b3:	74 3a                	je     31002ef <resolvePathToExecutable+0x9f>
/home/yogi/src/os/aproj/kshell/src/commands.c:98
    {
        if (*inPath!='/')
 31002b5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31002b8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31002bb:	3c 2f                	cmp    al,0x2f
 31002bd:	74 13                	je     31002d2 <resolvePathToExecutable+0x82>
/home/yogi/src/os/aproj/kshell/src/commands.c:100
        {
            strcpy(outPath,cwd);
 31002bf:	83 ec 08             	sub    esp,0x8
 31002c2:	68 e0 2e 10 03       	push   0x3102ee0
 31002c7:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31002ca:	e8 71 17 00 00       	call   3101a40 <kShell+0x46a>
 31002cf:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:102
        }
        strcat(outPath,inPath);
 31002d2:	83 ec 08             	sub    esp,0x8
 31002d5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31002d8:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31002db:	e8 30 18 00 00       	call   3101b10 <kShell+0x53a>
 31002e0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:103
        retVal=0;
 31002e3:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 31002ea:	e9 46 01 00 00       	jmp    3100435 <resolvePathToExecutable+0x1e5>
/home/yogi/src/os/aproj/kshell/src/commands.c:107
    }
    else
    {
        lInPath=malloc(1024);
 31002ef:	83 ec 0c             	sub    esp,0xc
 31002f2:	68 00 04 00 00       	push   0x400
 31002f7:	e8 b4 17 00 00       	call   3101ab0 <kShell+0x4da>
 31002fc:	83 c4 10             	add    esp,0x10
 31002ff:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:108
        strcpy(lInPath,inPath);
 3100302:	83 ec 08             	sub    esp,0x8
 3100305:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100308:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310030b:	e8 30 17 00 00       	call   3101a40 <kShell+0x46a>
 3100310:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:110

        resPath=malloc(1024);
 3100313:	83 ec 0c             	sub    esp,0xc
 3100316:	68 00 04 00 00       	push   0x400
 310031b:	e8 90 17 00 00       	call   3101ab0 <kShell+0x4da>
 3100320:	83 c4 10             	add    esp,0x10
 3100323:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:112

        token=strtok(envPath,delim);
 3100326:	83 ec 08             	sub    esp,0x8
 3100329:	8d 45 da             	lea    eax,[ebp-0x26]
 310032c:	50                   	push   eax
 310032d:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100330:	e8 5b 18 00 00       	call   3101b90 <kShell+0x5ba>
 3100335:	83 c4 10             	add    esp,0x10
 3100338:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:113
        while (token!=NULL)
 310033b:	eb 7e                	jmp    31003bb <resolvePathToExecutable+0x16b>
/home/yogi/src/os/aproj/kshell/src/commands.c:115
        {
            strcpy(resPath,token);
 310033d:	83 ec 08             	sub    esp,0x8
 3100340:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100343:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100346:	e8 f5 16 00 00       	call   3101a40 <kShell+0x46a>
 310034b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:116
            strcat(resPath,"/");
 310034e:	83 ec 08             	sub    esp,0x8
 3100351:	68 21 1e 10 03       	push   0x3101e21
 3100356:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100359:	e8 b2 17 00 00       	call   3101b10 <kShell+0x53a>
 310035e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:117
            strcat(resPath,inPath);
 3100361:	83 ec 08             	sub    esp,0x8
 3100364:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100367:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310036a:	e8 a1 17 00 00       	call   3101b10 <kShell+0x53a>
 310036f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:118
            int res=stat(resPath,&fstat);
 3100372:	83 ec 08             	sub    esp,0x8
 3100375:	8d 45 d0             	lea    eax,[ebp-0x30]
 3100378:	50                   	push   eax
 3100379:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310037c:	e8 7f 18 00 00       	call   3101c00 <kShell+0x62a>
 3100381:	83 c4 10             	add    esp,0x10
 3100384:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:119
            if (res==0)
 3100387:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 310038b:	75 1a                	jne    31003a7 <resolvePathToExecutable+0x157>
/home/yogi/src/os/aproj/kshell/src/commands.c:121
            {
                strcpy(outPath,resPath);
 310038d:	83 ec 08             	sub    esp,0x8
 3100390:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100393:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100396:	e8 a5 16 00 00       	call   3101a40 <kShell+0x46a>
 310039b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:122
                retVal=0;
 310039e:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:123
                break;
 31003a5:	eb 1e                	jmp    31003c5 <resolvePathToExecutable+0x175>
/home/yogi/src/os/aproj/kshell/src/commands.c:125
            }
            token=strtok(NULL,delim);
 31003a7:	83 ec 08             	sub    esp,0x8
 31003aa:	8d 45 da             	lea    eax,[ebp-0x26]
 31003ad:	50                   	push   eax
 31003ae:	6a 00                	push   0x0
 31003b0:	e8 db 17 00 00       	call   3101b90 <kShell+0x5ba>
 31003b5:	83 c4 10             	add    esp,0x10
 31003b8:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:113
        strcpy(lInPath,inPath);

        resPath=malloc(1024);

        token=strtok(envPath,delim);
        while (token!=NULL)
 31003bb:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31003bf:	0f 85 78 ff ff ff    	jne    310033d <resolvePathToExecutable+0xed>
/home/yogi/src/os/aproj/kshell/src/commands.c:128
                break;
            }
            token=strtok(NULL,delim);
        }

        if (retVal==-1)
 31003c5:	83 7d e8 ff          	cmp    DWORD PTR [ebp-0x18],0xffffffff
 31003c9:	75 6a                	jne    3100435 <resolvePathToExecutable+0x1e5>
/home/yogi/src/os/aproj/kshell/src/commands.c:130
        {
            strcpy(resPath,cwd);
 31003cb:	83 ec 08             	sub    esp,0x8
 31003ce:	68 e0 2e 10 03       	push   0x3102ee0
 31003d3:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 31003d6:	e8 65 16 00 00       	call   3101a40 <kShell+0x46a>
 31003db:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:131
            strcat(resPath,"/");
 31003de:	83 ec 08             	sub    esp,0x8
 31003e1:	68 21 1e 10 03       	push   0x3101e21
 31003e6:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 31003e9:	e8 22 17 00 00       	call   3101b10 <kShell+0x53a>
 31003ee:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:132
            strcat(resPath,inPath);
 31003f1:	83 ec 08             	sub    esp,0x8
 31003f4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31003f7:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 31003fa:	e8 11 17 00 00       	call   3101b10 <kShell+0x53a>
 31003ff:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:133
            int res=stat(resPath,&fstat);
 3100402:	83 ec 08             	sub    esp,0x8
 3100405:	8d 45 d0             	lea    eax,[ebp-0x30]
 3100408:	50                   	push   eax
 3100409:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310040c:	e8 ef 17 00 00       	call   3101c00 <kShell+0x62a>
 3100411:	83 c4 10             	add    esp,0x10
 3100414:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:134
            if (res==0)
 3100417:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 310041b:	75 18                	jne    3100435 <resolvePathToExecutable+0x1e5>
/home/yogi/src/os/aproj/kshell/src/commands.c:136
            {
                strcpy(outPath,resPath);
 310041d:	83 ec 08             	sub    esp,0x8
 3100420:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100423:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100426:	e8 15 16 00 00       	call   3101a40 <kShell+0x46a>
 310042b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:137
                retVal=0;
 310042e:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:142
            }
        }
    }
    
    if (lInPath)
 3100435:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100439:	74 0e                	je     3100449 <resolvePathToExecutable+0x1f9>
/home/yogi/src/os/aproj/kshell/src/commands.c:143
        free(lInPath);
 310043b:	83 ec 0c             	sub    esp,0xc
 310043e:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100441:	e8 3a 18 00 00       	call   3101c80 <kShell+0x6aa>
 3100446:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:144
    if (envPath)
 3100449:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310044d:	74 0e                	je     310045d <resolvePathToExecutable+0x20d>
/home/yogi/src/os/aproj/kshell/src/commands.c:145
        free(envPath);
 310044f:	83 ec 0c             	sub    esp,0xc
 3100452:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100455:	e8 26 18 00 00       	call   3101c80 <kShell+0x6aa>
 310045a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:146
    if (resPath)
 310045d:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100461:	74 0e                	je     3100471 <resolvePathToExecutable+0x221>
/home/yogi/src/os/aproj/kshell/src/commands.c:147
        free(resPath);
 3100463:	83 ec 0c             	sub    esp,0xc
 3100466:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100469:	e8 12 18 00 00       	call   3101c80 <kShell+0x6aa>
 310046e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:149
    
    return retVal;
 3100471:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
/home/yogi/src/os/aproj/kshell/src/commands.c:150
}
 3100474:	c9                   	leave  
 3100475:	c3                   	ret    

03100476 <kexec>:
kexec():
/home/yogi/src/os/aproj/kshell/src/commands.c:153

int kexec(char* cmdline, int stdinpipe, int stdoutpipe, int stderrpipe)
{
 3100476:	55                   	push   ebp
 3100477:	89 e5                	mov    ebp,esp
 3100479:	81 ec 78 06 00 00    	sub    esp,0x678
/home/yogi/src/os/aproj/kshell/src/commands.c:154
    bool background=false;
 310047f:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:155
    int forkPid=0;
 3100483:	c7 45 cc 00 00 00 00 	mov    DWORD PTR [ebp-0x34],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:157
    char* tok;
    char* pgm=NULL;
 310048a:	c7 45 c8 00 00 00 00 	mov    DWORD PTR [ebp-0x38],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:160
    char fileToExec[256];
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];  //strangely, if I remove this variable I get a SEGV at 0x009B:0x7000e0bf for 0x00000023
    char *stdinRedir=NULL, *stdoutRedir=NULL;
 3100491:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x0
 3100498:	c7 45 c0 00 00 00 00 	mov    DWORD PTR [ebp-0x40],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:161
    char *stdoutPipe=NULL;
 310049f:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:162
    char *stdinfile=NULL, *stdoutfile=NULL, *stderrfile=NULL;
 31004a6:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 31004ad:	c7 45 b8 00 00 00 00 	mov    DWORD PTR [ebp-0x48],0x0
 31004b4:	c7 45 b4 00 00 00 00 	mov    DWORD PTR [ebp-0x4c],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:163
    int argc = 0;
 31004bb:	c7 85 a8 f9 ff ff 00 	mov    DWORD PTR [ebp-0x658],0x0
 31004c2:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:165
    char **argv;
    int retVal=-1;
 31004c5:	c7 45 ec ff ff ff ff 	mov    DWORD PTR [ebp-0x14],0xffffffff
/home/yogi/src/os/aproj/kshell/src/commands.c:166
    char *temp=NULL;
 31004cc:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:167
    bool freeCmdline=false;
 31004d3:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:168
    int yourSTDIN=0, yourSTDOUT=0;
 31004d7:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 31004de:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:171
    
    //look for < and > redirects so that we can strip them from the command line and use them to redirect stdin/stdout
    stdinRedir=strstr(cmdline,"<");
 31004e5:	83 ec 08             	sub    esp,0x8
 31004e8:	68 23 1e 10 03       	push   0x3101e23
 31004ed:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31004f0:	e8 4b 16 00 00       	call   3101b40 <kShell+0x56a>
 31004f5:	83 c4 10             	add    esp,0x10
 31004f8:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:172
    stdoutPipe=strstr(cmdline,"|");
 31004fb:	83 ec 08             	sub    esp,0x8
 31004fe:	68 25 1e 10 03       	push   0x3101e25
 3100503:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100506:	e8 35 16 00 00       	call   3101b40 <kShell+0x56a>
 310050b:	83 c4 10             	add    esp,0x10
 310050e:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:174
    
    if (stdoutPipe)
 3100511:	83 7d bc 00          	cmp    DWORD PTR [ebp-0x44],0x0
 3100515:	74 2f                	je     3100546 <kexec+0xd0>
/home/yogi/src/os/aproj/kshell/src/commands.c:176
    {
        pipe(execPipes);
 3100517:	83 ec 0c             	sub    esp,0xc
 310051a:	68 30 32 10 03       	push   0x3103230
 310051f:	e8 dc 15 00 00       	call   3101b00 <kShell+0x52a>
 3100524:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:177
        cmdline=strreplace(cmdline,"|","");
 3100527:	83 ec 04             	sub    esp,0x4
 310052a:	68 27 1e 10 03       	push   0x3101e27
 310052f:	68 25 1e 10 03       	push   0x3101e25
 3100534:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100537:	e8 34 17 00 00       	call   3101c70 <kShell+0x69a>
 310053c:	83 c4 10             	add    esp,0x10
 310053f:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:178
        freeCmdline=true;
 3100542:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:181
    }
    
    if (stdinRedir)
 3100546:	83 7d c4 00          	cmp    DWORD PTR [ebp-0x3c],0x0
 310054a:	0f 84 a6 00 00 00    	je     31005f6 <kexec+0x180>
/home/yogi/src/os/aproj/kshell/src/commands.c:183
    {
        stdinfile = malloc(256);
 3100550:	83 ec 0c             	sub    esp,0xc
 3100553:	68 00 01 00 00       	push   0x100
 3100558:	e8 53 15 00 00       	call   3101ab0 <kShell+0x4da>
 310055d:	83 c4 10             	add    esp,0x10
 3100560:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:184
        char *start = strstr(stdinRedir," ")+1;
 3100563:	83 ec 08             	sub    esp,0x8
 3100566:	68 28 1e 10 03       	push   0x3101e28
 310056b:	ff 75 c4             	push   DWORD PTR [ebp-0x3c]
 310056e:	e8 cd 15 00 00       	call   3101b40 <kShell+0x56a>
 3100573:	83 c4 10             	add    esp,0x10
 3100576:	83 c0 01             	add    eax,0x1
 3100579:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:185
        if (!start)
 310057c:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 3100580:	75 06                	jne    3100588 <kexec+0x112>
/home/yogi/src/os/aproj/kshell/src/commands.c:186
            start=stdinRedir;
 3100582:	8b 45 c4             	mov    eax,DWORD PTR [ebp-0x3c]
 3100585:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:187
        char *end = strstr(start," ");
 3100588:	83 ec 08             	sub    esp,0x8
 310058b:	68 28 1e 10 03       	push   0x3101e28
 3100590:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 3100593:	e8 a8 15 00 00       	call   3101b40 <kShell+0x56a>
 3100598:	83 c4 10             	add    esp,0x10
 310059b:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:188
        if (!end)
 310059e:	83 7d d4 00          	cmp    DWORD PTR [ebp-0x2c],0x0
 31005a2:	75 16                	jne    31005ba <kexec+0x144>
/home/yogi/src/os/aproj/kshell/src/commands.c:189
            end = strstr(start,"\n");
 31005a4:	83 ec 08             	sub    esp,0x8
 31005a7:	68 2a 1e 10 03       	push   0x3101e2a
 31005ac:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31005af:	e8 8c 15 00 00       	call   3101b40 <kShell+0x56a>
 31005b4:	83 c4 10             	add    esp,0x10
 31005b7:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:190
        if (end)
 31005ba:	83 7d d4 00          	cmp    DWORD PTR [ebp-0x2c],0x0
 31005be:	74 1e                	je     31005de <kexec+0x168>
/home/yogi/src/os/aproj/kshell/src/commands.c:191
            strncpy(stdinfile,start,end-start);
 31005c0:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
 31005c3:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31005c6:	29 c2                	sub    edx,eax
 31005c8:	89 d0                	mov    eax,edx
 31005ca:	83 ec 04             	sub    esp,0x4
 31005cd:	50                   	push   eax
 31005ce:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31005d1:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005d4:	e8 97 15 00 00       	call   3101b70 <kShell+0x59a>
 31005d9:	83 c4 10             	add    esp,0x10
 31005dc:	eb 11                	jmp    31005ef <kexec+0x179>
/home/yogi/src/os/aproj/kshell/src/commands.c:193
        else
            strcpy(stdinfile, start);
 31005de:	83 ec 08             	sub    esp,0x8
 31005e1:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31005e4:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005e7:	e8 54 14 00 00       	call   3101a40 <kShell+0x46a>
 31005ec:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:194
        stdinRedir='\0';
 31005ef:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [ebp-0x3c],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:197
    }
    
    argv = cmdlineToArgv(cmdline, &argc);
 31005f6:	83 ec 08             	sub    esp,0x8
 31005f9:	8d 85 a8 f9 ff ff    	lea    eax,[ebp-0x658]
 31005ff:	50                   	push   eax
 3100600:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100603:	e8 c8 14 00 00       	call   3101ad0 <kShell+0x4fa>
 3100608:	83 c4 10             	add    esp,0x10
 310060b:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:199

    if (argc<1)
 310060e:	8b 85 a8 f9 ff ff    	mov    eax,DWORD PTR [ebp-0x658]
 3100614:	85 c0                	test   eax,eax
 3100616:	7f 17                	jg     310062f <kexec+0x1b9>
/home/yogi/src/os/aproj/kshell/src/commands.c:201
    {
        printf("kexec: Invalid command\n");
 3100618:	83 ec 0c             	sub    esp,0xc
 310061b:	68 2c 1e 10 03       	push   0x3101e2c
 3100620:	e8 4b 14 00 00       	call   3101a70 <kShell+0x49a>
 3100625:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:202
        retVal=-3;
 3100628:	c7 45 ec fd ff ff ff 	mov    DWORD PTR [ebp-0x14],0xfffffffd
/home/yogi/src/os/aproj/kshell/src/commands.c:205
    }

    if (retVal==-1)
 310062f:	83 7d ec ff          	cmp    DWORD PTR [ebp-0x14],0xffffffff
 3100633:	75 6e                	jne    31006a3 <kexec+0x22d>
/home/yogi/src/os/aproj/kshell/src/commands.c:207
    {
        temp=malloc(1024);
 3100635:	83 ec 0c             	sub    esp,0xc
 3100638:	68 00 04 00 00       	push   0x400
 310063d:	e8 6e 14 00 00       	call   3101ab0 <kShell+0x4da>
 3100642:	83 c4 10             	add    esp,0x10
 3100645:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:210
        fstat_t fstat;

        if (resolvePathToExecutable(argv[0], temp)==0)
 3100648:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 310064b:	8b 00                	mov    eax,DWORD PTR [eax]
 310064d:	83 ec 08             	sub    esp,0x8
 3100650:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100653:	50                   	push   eax
 3100654:	e8 f7 fb ff ff       	call   3100250 <resolvePathToExecutable>
 3100659:	83 c4 10             	add    esp,0x10
 310065c:	85 c0                	test   eax,eax
 310065e:	75 0a                	jne    310066a <kexec+0x1f4>
/home/yogi/src/os/aproj/kshell/src/commands.c:211
            argv[0]=temp;
 3100660:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 3100663:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
 3100666:	89 10                	mov    DWORD PTR [eax],edx
 3100668:	eb 39                	jmp    31006a3 <kexec+0x22d>
/home/yogi/src/os/aproj/kshell/src/commands.c:212
        else if (stat(argv[0],&fstat)) //stat returns 0 if successful
 310066a:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 310066d:	8b 00                	mov    eax,DWORD PTR [eax]
 310066f:	83 ec 08             	sub    esp,0x8
 3100672:	8d 95 a0 f9 ff ff    	lea    edx,[ebp-0x660]
 3100678:	52                   	push   edx
 3100679:	50                   	push   eax
 310067a:	e8 81 15 00 00       	call   3101c00 <kShell+0x62a>
 310067f:	83 c4 10             	add    esp,0x10
 3100682:	85 c0                	test   eax,eax
 3100684:	74 1d                	je     31006a3 <kexec+0x22d>
/home/yogi/src/os/aproj/kshell/src/commands.c:214
        {
            printf("invalid path or filename '%s'\n",argv[0]);
 3100686:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 3100689:	8b 00                	mov    eax,DWORD PTR [eax]
 310068b:	83 ec 08             	sub    esp,0x8
 310068e:	50                   	push   eax
 310068f:	68 44 1e 10 03       	push   0x3101e44
 3100694:	e8 d7 13 00 00       	call   3101a70 <kShell+0x49a>
 3100699:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:215
            retVal=-4;
 310069c:	c7 45 ec fc ff ff ff 	mov    DWORD PTR [ebp-0x14],0xfffffffc
/home/yogi/src/os/aproj/kshell/src/commands.c:220
        }
    }

    //Everything is resolved and verified, lets execute the command!
    if (retVal==-1)
 31006a3:	83 7d ec ff          	cmp    DWORD PTR [ebp-0x14],0xffffffff
 31006a7:	0f 85 0a 02 00 00    	jne    31008b7 <kexec+0x441>
/home/yogi/src/os/aproj/kshell/src/commands.c:222
    {
        strcpy(fileToExec,argv[0]);
 31006ad:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 31006b0:	8b 00                	mov    eax,DWORD PTR [eax]
 31006b2:	83 ec 08             	sub    esp,0x8
 31006b5:	50                   	push   eax
 31006b6:	8d 85 ac fe ff ff    	lea    eax,[ebp-0x154]
 31006bc:	50                   	push   eax
 31006bd:	e8 7e 13 00 00       	call   3101a40 <kShell+0x46a>
 31006c2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:224

        if (*argv[argc-1]=='&')
 31006c5:	8b 85 a8 f9 ff ff    	mov    eax,DWORD PTR [ebp-0x658]
 31006cb:	05 ff ff ff 3f       	add    eax,0x3fffffff
 31006d0:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31006d7:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 31006da:	01 d0                	add    eax,edx
 31006dc:	8b 00                	mov    eax,DWORD PTR [eax]
 31006de:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31006e1:	3c 26                	cmp    al,0x26
 31006e3:	75 04                	jne    31006e9 <kexec+0x273>
/home/yogi/src/os/aproj/kshell/src/commands.c:225
            background=true;
 31006e5:	c6 45 f7 01          	mov    BYTE PTR [ebp-0x9],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:227

        forkPid = fork();
 31006e9:	e8 b2 14 00 00       	call   3101ba0 <kShell+0x5ca>
 31006ee:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:229

        if (execPipes[STDOUT_FILE]!=0)
 31006f1:	a1 34 32 10 03       	mov    eax,ds:0x3103234
 31006f6:	85 c0                	test   eax,eax
 31006f8:	74 14                	je     310070e <kexec+0x298>
/home/yogi/src/os/aproj/kshell/src/commands.c:231
        {
            yourSTDOUT=execPipes[STDOUT_FILE];
 31006fa:	a1 34 32 10 03       	mov    eax,ds:0x3103234
 31006ff:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:232
            execPipes[STDOUT_FILE]=0;
 3100702:	c7 05 34 32 10 03 00 	mov    DWORD PTR ds:0x3103234,0x0
 3100709:	00 00 00 
 310070c:	eb 1b                	jmp    3100729 <kexec+0x2b3>
/home/yogi/src/os/aproj/kshell/src/commands.c:234
        }
        else if (execPipes[STDIN_FILE]!=0)
 310070e:	a1 30 32 10 03       	mov    eax,ds:0x3103230
 3100713:	85 c0                	test   eax,eax
 3100715:	74 12                	je     3100729 <kexec+0x2b3>
/home/yogi/src/os/aproj/kshell/src/commands.c:236
        {
            yourSTDIN=execPipes[STDIN_FILE];
 3100717:	a1 30 32 10 03       	mov    eax,ds:0x3103230
 310071c:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:237
            execPipes[STDIN_FILE]=0;
 310071f:	c7 05 30 32 10 03 00 	mov    DWORD PTR ds:0x3103230,0x0
 3100726:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:240
        }
        
        if (forkPid == 0)
 3100729:	83 7d cc 00          	cmp    DWORD PTR [ebp-0x34],0x0
 310072d:	0f 85 f7 00 00 00    	jne    310082a <kexec+0x3b4>
/home/yogi/src/os/aproj/kshell/src/commands.c:245
        {
            int retVal;

            //CLR 02/05/2019: Redirect standard input/output/err from/to a file (i.e. < and >)
            if (stdinfile!=NULL)
 3100733:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100737:	74 36                	je     310076f <kexec+0x2f9>
/home/yogi/src/os/aproj/kshell/src/commands.c:246
                if (freopen(stdinfile, "r",(void*)STDIN_FILE)==(void*)-1)
 3100739:	83 ec 04             	sub    esp,0x4
 310073c:	6a 00                	push   0x0
 310073e:	68 63 1e 10 03       	push   0x3101e63
 3100743:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100746:	e8 c5 14 00 00       	call   3101c10 <kShell+0x63a>
 310074b:	83 c4 10             	add    esp,0x10
 310074e:	83 f8 ff             	cmp    eax,0xffffffff
 3100751:	75 1c                	jne    310076f <kexec+0x2f9>
/home/yogi/src/os/aproj/kshell/src/commands.c:248
                {
                    printf("Redirect of input failed, cannot continue\n");
 3100753:	83 ec 0c             	sub    esp,0xc
 3100756:	68 68 1e 10 03       	push   0x3101e68
 310075b:	e8 10 13 00 00       	call   3101a70 <kShell+0x49a>
 3100760:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:249
                    retVal=-3;
 3100763:	c7 45 d0 fd ff ff ff 	mov    DWORD PTR [ebp-0x30],0xfffffffd
/home/yogi/src/os/aproj/kshell/src/commands.c:250
                    goto kexecReturn;
 310076a:	e9 48 01 00 00       	jmp    31008b7 <kexec+0x441>
/home/yogi/src/os/aproj/kshell/src/commands.c:252
                }
            if (stdoutfile!=NULL)
 310076f:	83 7d b8 00          	cmp    DWORD PTR [ebp-0x48],0x0
 3100773:	74 17                	je     310078c <kexec+0x316>
/home/yogi/src/os/aproj/kshell/src/commands.c:253
                freopen(stdoutfile,"w",(void*)STDOUT_FILE);
 3100775:	83 ec 04             	sub    esp,0x4
 3100778:	6a 01                	push   0x1
 310077a:	68 93 1e 10 03       	push   0x3101e93
 310077f:	ff 75 b8             	push   DWORD PTR [ebp-0x48]
 3100782:	e8 89 14 00 00       	call   3101c10 <kShell+0x63a>
 3100787:	83 c4 10             	add    esp,0x10
 310078a:	eb 30                	jmp    31007bc <kexec+0x346>
/home/yogi/src/os/aproj/kshell/src/commands.c:254
            else if (yourSTDOUT!=0)
 310078c:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 3100790:	74 13                	je     31007a5 <kexec+0x32f>
/home/yogi/src/os/aproj/kshell/src/commands.c:255
                setSTD(STDOUT_FILE, yourSTDOUT);
 3100792:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100795:	83 ec 08             	sub    esp,0x8
 3100798:	50                   	push   eax
 3100799:	6a 01                	push   0x1
 310079b:	e8 a0 14 00 00       	call   3101c40 <kShell+0x66a>
 31007a0:	83 c4 10             	add    esp,0x10
 31007a3:	eb 17                	jmp    31007bc <kexec+0x346>
/home/yogi/src/os/aproj/kshell/src/commands.c:256
            else if (yourSTDIN!=0)
 31007a5:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 31007a9:	74 11                	je     31007bc <kexec+0x346>
/home/yogi/src/os/aproj/kshell/src/commands.c:257
                setSTD(STDIN_FILE, yourSTDIN);
 31007ab:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31007ae:	83 ec 08             	sub    esp,0x8
 31007b1:	50                   	push   eax
 31007b2:	6a 00                	push   0x0
 31007b4:	e8 87 14 00 00       	call   3101c40 <kShell+0x66a>
 31007b9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:258
            if (stderrfile!=NULL)
 31007bc:	83 7d b4 00          	cmp    DWORD PTR [ebp-0x4c],0x0
 31007c0:	74 15                	je     31007d7 <kexec+0x361>
/home/yogi/src/os/aproj/kshell/src/commands.c:259
                freopen(stderrfile,"w",(void*)STDERR_FILE);
 31007c2:	83 ec 04             	sub    esp,0x4
 31007c5:	6a 02                	push   0x2
 31007c7:	68 93 1e 10 03       	push   0x3101e93
 31007cc:	ff 75 b4             	push   DWORD PTR [ebp-0x4c]
 31007cf:	e8 3c 14 00 00       	call   3101c10 <kShell+0x63a>
 31007d4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:260
            int childPid = exec(fileToExec, argc, argv);
 31007d7:	8b 85 a8 f9 ff ff    	mov    eax,DWORD PTR [ebp-0x658]
 31007dd:	83 ec 04             	sub    esp,0x4
 31007e0:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
 31007e3:	50                   	push   eax
 31007e4:	8d 85 ac fe ff ff    	lea    eax,[ebp-0x154]
 31007ea:	50                   	push   eax
 31007eb:	e8 40 13 00 00       	call   3101b30 <kShell+0x55a>
 31007f0:	83 c4 10             	add    esp,0x10
 31007f3:	89 45 ac             	mov    DWORD PTR [ebp-0x54],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:262

            if (childPid > 0)
 31007f6:	83 7d ac 00          	cmp    DWORD PTR [ebp-0x54],0x0
 31007fa:	7e 14                	jle    3100810 <kexec+0x39a>
/home/yogi/src/os/aproj/kshell/src/commands.c:264
            {
                retVal = waitpid(childPid);
 31007fc:	8b 45 ac             	mov    eax,DWORD PTR [ebp-0x54]
 31007ff:	83 ec 0c             	sub    esp,0xc
 3100802:	50                   	push   eax
 3100803:	e8 48 12 00 00       	call   3101a50 <kShell+0x47a>
 3100808:	83 c4 10             	add    esp,0x10
 310080b:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
 310080e:	eb 07                	jmp    3100817 <kexec+0x3a1>
/home/yogi/src/os/aproj/kshell/src/commands.c:267
            }
            else
                retVal = 0xBADBADBA;
 3100810:	c7 45 d0 ba ad db ba 	mov    DWORD PTR [ebp-0x30],0xbadbadba
/home/yogi/src/os/aproj/kshell/src/commands.c:268
            exit(retVal);
 3100817:	83 ec 0c             	sub    esp,0xc
 310081a:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 310081d:	e8 fe 13 00 00       	call   3101c20 <kShell+0x64a>
 3100822:	83 c4 10             	add    esp,0x10
 3100825:	e9 8d 00 00 00       	jmp    31008b7 <kexec+0x441>
/home/yogi/src/os/aproj/kshell/src/commands.c:270
        }
        else if (forkPid < 0)
 310082a:	83 7d cc 00          	cmp    DWORD PTR [ebp-0x34],0x0
 310082e:	79 15                	jns    3100845 <kexec+0x3cf>
/home/yogi/src/os/aproj/kshell/src/commands.c:271
            print("Fork error %u", forkPid);
 3100830:	83 ec 08             	sub    esp,0x8
 3100833:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 3100836:	68 95 1e 10 03       	push   0x3101e95
 310083b:	e8 20 12 00 00       	call   3101a60 <kShell+0x48a>
 3100840:	83 c4 10             	add    esp,0x10
 3100843:	eb 72                	jmp    31008b7 <kexec+0x441>
/home/yogi/src/os/aproj/kshell/src/commands.c:274
        else
        {
            if (!background)
 3100845:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 3100849:	83 f0 01             	xor    eax,0x1
 310084c:	84 c0                	test   al,al
 310084e:	74 36                	je     3100886 <kexec+0x410>
/home/yogi/src/os/aproj/kshell/src/commands.c:276
            {
                lastExecExitCode = waitpid(forkPid);
 3100850:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
 3100853:	83 ec 0c             	sub    esp,0xc
 3100856:	50                   	push   eax
 3100857:	e8 f4 11 00 00       	call   3101a50 <kShell+0x47a>
 310085c:	83 c4 10             	add    esp,0x10
 310085f:	a3 1c 32 10 03       	mov    ds:0x310321c,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:277
                if (lastExecExitCode == 0xBADBADBA)
 3100864:	a1 1c 32 10 03       	mov    eax,ds:0x310321c
 3100869:	3d ba ad db ba       	cmp    eax,0xbadbadba
 310086e:	75 16                	jne    3100886 <kexec+0x410>
/home/yogi/src/os/aproj/kshell/src/commands.c:278
                    print("exec: Cannot execute %s\n",argv[0]);
 3100870:	8b 45 b0             	mov    eax,DWORD PTR [ebp-0x50]
 3100873:	8b 00                	mov    eax,DWORD PTR [eax]
 3100875:	83 ec 08             	sub    esp,0x8
 3100878:	50                   	push   eax
 3100879:	68 a3 1e 10 03       	push   0x3101ea3
 310087e:	e8 dd 11 00 00       	call   3101a60 <kShell+0x48a>
 3100883:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:281
            }
            char ret[10];
            itoa(lastExecExitCode,ret);
 3100886:	a1 1c 32 10 03       	mov    eax,ds:0x310321c
 310088b:	89 c2                	mov    edx,eax
 310088d:	83 ec 08             	sub    esp,0x8
 3100890:	8d 85 96 f9 ff ff    	lea    eax,[ebp-0x66a]
 3100896:	50                   	push   eax
 3100897:	52                   	push   edx
 3100898:	e8 53 12 00 00       	call   3101af0 <kShell+0x51a>
 310089d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:282
            setenv("LASTEXIT",ret);    
 31008a0:	83 ec 08             	sub    esp,0x8
 31008a3:	8d 85 96 f9 ff ff    	lea    eax,[ebp-0x66a]
 31008a9:	50                   	push   eax
 31008aa:	68 ff 1d 10 03       	push   0x3101dff
 31008af:	e8 cc 12 00 00       	call   3101b80 <kShell+0x5aa>
 31008b4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:287
        }
    }
kexecReturn:
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    if (freeCmdline)
 31008b7:	80 7d e7 00          	cmp    BYTE PTR [ebp-0x19],0x0
 31008bb:	74 0e                	je     31008cb <kexec+0x455>
/home/yogi/src/os/aproj/kshell/src/commands.c:288
        free(cmdline);
 31008bd:	83 ec 0c             	sub    esp,0xc
 31008c0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31008c3:	e8 b8 13 00 00       	call   3101c80 <kShell+0x6aa>
 31008c8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:289
    free(argv);
 31008cb:	83 ec 0c             	sub    esp,0xc
 31008ce:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
 31008d1:	e8 aa 13 00 00       	call   3101c80 <kShell+0x6aa>
 31008d6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:290
    free(pgm);
 31008d9:	83 ec 0c             	sub    esp,0xc
 31008dc:	ff 75 c8             	push   DWORD PTR [ebp-0x38]
 31008df:	e8 9c 13 00 00       	call   3101c80 <kShell+0x6aa>
 31008e4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:291
    if (stdinfile)
 31008e7:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31008eb:	74 0e                	je     31008fb <kexec+0x485>
/home/yogi/src/os/aproj/kshell/src/commands.c:292
        free(stdinfile);
 31008ed:	83 ec 0c             	sub    esp,0xc
 31008f0:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31008f3:	e8 88 13 00 00       	call   3101c80 <kShell+0x6aa>
 31008f8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:293
    if (stdoutfile)
 31008fb:	83 7d b8 00          	cmp    DWORD PTR [ebp-0x48],0x0
 31008ff:	74 0e                	je     310090f <kexec+0x499>
/home/yogi/src/os/aproj/kshell/src/commands.c:294
        free(stdoutfile);
 3100901:	83 ec 0c             	sub    esp,0xc
 3100904:	ff 75 b8             	push   DWORD PTR [ebp-0x48]
 3100907:	e8 74 13 00 00       	call   3101c80 <kShell+0x6aa>
 310090c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:295
    if (stderrfile)
 310090f:	83 7d b4 00          	cmp    DWORD PTR [ebp-0x4c],0x0
 3100913:	74 0e                	je     3100923 <kexec+0x4ad>
/home/yogi/src/os/aproj/kshell/src/commands.c:296
        free(stderrfile);
 3100915:	83 ec 0c             	sub    esp,0xc
 3100918:	ff 75 b4             	push   DWORD PTR [ebp-0x4c]
 310091b:	e8 60 13 00 00       	call   3101c80 <kShell+0x6aa>
 3100920:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:297
    if (temp)
 3100923:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100927:	74 0e                	je     3100937 <kexec+0x4c1>
/home/yogi/src/os/aproj/kshell/src/commands.c:298
        free(temp);
 3100929:	83 ec 0c             	sub    esp,0xc
 310092c:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 310092f:	e8 4c 13 00 00       	call   3101c80 <kShell+0x6aa>
 3100934:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:300
    
}
 3100937:	90                   	nop
 3100938:	c9                   	leave  
 3100939:	c3                   	ret    

0310093a <cmdChangeDirectory>:
cmdChangeDirectory():
/home/yogi/src/os/aproj/kshell/src/commands.c:303

void cmdChangeDirectory(char *cmdline)
{
 310093a:	55                   	push   ebp
 310093b:	89 e5                	mov    ebp,esp
 310093d:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:305
    fstat_t fstat;
    char *lcmdline=malloc(1024);
 3100940:	83 ec 0c             	sub    esp,0xc
 3100943:	68 00 04 00 00       	push   0x400
 3100948:	e8 63 11 00 00       	call   3101ab0 <kShell+0x4da>
 310094d:	83 c4 10             	add    esp,0x10
 3100950:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:306
    bool error=false;
 3100953:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:308
    
    strtrim(cmdline);
 3100957:	83 ec 0c             	sub    esp,0xc
 310095a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310095d:	e8 6e 12 00 00       	call   3101bd0 <kShell+0x5fa>
 3100962:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:310
            
    if (*cmdline!='/')
 3100965:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100968:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310096b:	3c 2f                	cmp    al,0x2f
 310096d:	74 13                	je     3100982 <cmdChangeDirectory+0x48>
/home/yogi/src/os/aproj/kshell/src/commands.c:311
        strcpy(lcmdline,"/");
 310096f:	83 ec 08             	sub    esp,0x8
 3100972:	68 21 1e 10 03       	push   0x3101e21
 3100977:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310097a:	e8 c1 10 00 00       	call   3101a40 <kShell+0x46a>
 310097f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:312
    strcat(lcmdline,cmdline);
 3100982:	83 ec 08             	sub    esp,0x8
 3100985:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100988:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310098b:	e8 80 11 00 00       	call   3101b10 <kShell+0x53a>
 3100990:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:313
    if (strncmp(cmdline,"/",512)!=0)
 3100993:	83 ec 04             	sub    esp,0x4
 3100996:	68 00 02 00 00       	push   0x200
 310099b:	68 21 1e 10 03       	push   0x3101e21
 31009a0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31009a3:	e8 b8 11 00 00       	call   3101b60 <kShell+0x58a>
 31009a8:	83 c4 10             	add    esp,0x10
 31009ab:	85 c0                	test   eax,eax
 31009ad:	74 2d                	je     31009dc <cmdChangeDirectory+0xa2>
/home/yogi/src/os/aproj/kshell/src/commands.c:314
        if (stat(cmdline,&fstat)) 
 31009af:	83 ec 08             	sub    esp,0x8
 31009b2:	8d 45 e8             	lea    eax,[ebp-0x18]
 31009b5:	50                   	push   eax
 31009b6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31009b9:	e8 42 12 00 00       	call   3101c00 <kShell+0x62a>
 31009be:	83 c4 10             	add    esp,0x10
 31009c1:	85 c0                	test   eax,eax
 31009c3:	74 17                	je     31009dc <cmdChangeDirectory+0xa2>
/home/yogi/src/os/aproj/kshell/src/commands.c:316
        {
            printf("Invalid directory '%s'\n",lcmdline);
 31009c5:	83 ec 08             	sub    esp,0x8
 31009c8:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31009cb:	68 bc 1e 10 03       	push   0x3101ebc
 31009d0:	e8 9b 10 00 00       	call   3101a70 <kShell+0x49a>
 31009d5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:317
            error=true;
 31009d8:	c6 45 f7 01          	mov    BYTE PTR [ebp-0x9],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:319
        }
    if (!error)
 31009dc:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 31009e0:	83 f0 01             	xor    eax,0x1
 31009e3:	84 c0                	test   al,al
 31009e5:	74 23                	je     3100a0a <cmdChangeDirectory+0xd0>
/home/yogi/src/os/aproj/kshell/src/commands.c:321
    {
        setcwd(lcmdline, sizeof(lcmdline));
 31009e7:	83 ec 08             	sub    esp,0x8
 31009ea:	6a 04                	push   0x4
 31009ec:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31009ef:	e8 bc 11 00 00       	call   3101bb0 <kShell+0x5da>
 31009f4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:322
        setenv("CWD",lcmdline);
 31009f7:	83 ec 08             	sub    esp,0x8
 31009fa:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31009fd:	68 d4 1e 10 03       	push   0x3101ed4
 3100a02:	e8 79 11 00 00       	call   3101b80 <kShell+0x5aa>
 3100a07:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:325
    }
    
    free(lcmdline);
 3100a0a:	83 ec 0c             	sub    esp,0xc
 3100a0d:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100a10:	e8 6b 12 00 00       	call   3101c80 <kShell+0x6aa>
 3100a15:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:326
}
 3100a18:	90                   	nop
 3100a19:	c9                   	leave  
 3100a1a:	c3                   	ret    

03100a1b <cmdTime>:
cmdTime():
/home/yogi/src/os/aproj/kshell/src/commands.c:329

void cmdTime(char* cmdline)
{
 3100a1b:	55                   	push   ebp
 3100a1c:	89 e5                	mov    ebp,esp
 3100a1e:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:332
    uint32_t startTicks, endTicks;
    
    startTicks=getticks();
 3100a21:	e8 fa 10 00 00       	call   3101b20 <kShell+0x54a>
 3100a26:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:333
    execInternalCommand(cmdline);
 3100a29:	83 ec 0c             	sub    esp,0xc
 3100a2c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100a2f:	e8 ee 04 00 00       	call   3100f22 <execInternalCommand>
 3100a34:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:334
    endTicks=getticks();
 3100a37:	e8 e4 10 00 00       	call   3101b20 <kShell+0x54a>
 3100a3c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:335
    print("\n%u ticks\n",endTicks-startTicks);
 3100a3f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100a42:	2b 45 f4             	sub    eax,DWORD PTR [ebp-0xc]
 3100a45:	83 ec 08             	sub    esp,0x8
 3100a48:	50                   	push   eax
 3100a49:	68 d8 1e 10 03       	push   0x3101ed8
 3100a4e:	e8 0d 10 00 00       	call   3101a60 <kShell+0x48a>
 3100a53:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:337
    
}
 3100a56:	90                   	nop
 3100a57:	c9                   	leave  
 3100a58:	c3                   	ret    

03100a59 <cmdRepeat>:
cmdRepeat():
/home/yogi/src/os/aproj/kshell/src/commands.c:340

void cmdRepeat(char * cmdline)
{
 3100a59:	55                   	push   ebp
 3100a5a:	89 e5                	mov    ebp,esp
 3100a5c:	83 ec 28             	sub    esp,0x28
/home/yogi/src/os/aproj/kshell/src/commands.c:341
    int argc = 0;
 3100a5f:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:343
    char **argv;
    int count = 0;
 3100a66:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:344
    char *newCmdLine=cmdline;
 3100a6d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100a70:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:345
    argv = cmdlineToArgv(cmdline, &argc);
 3100a73:	83 ec 08             	sub    esp,0x8
 3100a76:	8d 45 e4             	lea    eax,[ebp-0x1c]
 3100a79:	50                   	push   eax
 3100a7a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100a7d:	e8 4e 10 00 00       	call   3101ad0 <kShell+0x4fa>
 3100a82:	83 c4 10             	add    esp,0x10
 3100a85:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:347
    
    count = atoi(argv[0]);
 3100a88:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 3100a8b:	8b 00                	mov    eax,DWORD PTR [eax]
 3100a8d:	83 ec 0c             	sub    esp,0xc
 3100a90:	50                   	push   eax
 3100a91:	e8 9a 11 00 00       	call   3101c30 <kShell+0x65a>
 3100a96:	83 c4 10             	add    esp,0x10
 3100a99:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:349

    if (count >= 100)
 3100a9c:	83 7d ec 63          	cmp    DWORD PTR [ebp-0x14],0x63
 3100aa0:	7e 06                	jle    3100aa8 <cmdRepeat+0x4f>
/home/yogi/src/os/aproj/kshell/src/commands.c:350
        newCmdLine+=3;
 3100aa2:	83 45 f4 03          	add    DWORD PTR [ebp-0xc],0x3
 3100aa6:	eb 10                	jmp    3100ab8 <cmdRepeat+0x5f>
/home/yogi/src/os/aproj/kshell/src/commands.c:351
    else if (count >= 10)
 3100aa8:	83 7d ec 09          	cmp    DWORD PTR [ebp-0x14],0x9
 3100aac:	7e 06                	jle    3100ab4 <cmdRepeat+0x5b>
/home/yogi/src/os/aproj/kshell/src/commands.c:352
        newCmdLine+=2;
 3100aae:	83 45 f4 02          	add    DWORD PTR [ebp-0xc],0x2
 3100ab2:	eb 04                	jmp    3100ab8 <cmdRepeat+0x5f>
/home/yogi/src/os/aproj/kshell/src/commands.c:354
    else 
        newCmdLine+=1;
 3100ab4:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:356
    
    for (int cnt=0;cnt<count;cnt++)
 3100ab8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 3100abf:	eb 51                	jmp    3100b12 <cmdRepeat+0xb9>
/home/yogi/src/os/aproj/kshell/src/commands.c:358
    {
        printf("\n*************** REPEAT EXECUTION #%u of %u ***************\n",cnt+1,count);
 3100ac1:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100ac4:	83 c0 01             	add    eax,0x1
 3100ac7:	83 ec 04             	sub    esp,0x4
 3100aca:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100acd:	50                   	push   eax
 3100ace:	68 e4 1e 10 03       	push   0x3101ee4
 3100ad3:	e8 98 0f 00 00       	call   3101a70 <kShell+0x49a>
 3100ad8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:359
        execInternalCommand(newCmdLine);
 3100adb:	83 ec 0c             	sub    esp,0xc
 3100ade:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100ae1:	e8 3c 04 00 00       	call   3100f22 <execInternalCommand>
 3100ae6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:360
        if (bSigIntReceived)
 3100ae9:	0f b6 05 c0 2e 10 03 	movzx  eax,BYTE PTR ds:0x3102ec0
 3100af0:	84 c0                	test   al,al
 3100af2:	74 1a                	je     3100b0e <cmdRepeat+0xb5>
/home/yogi/src/os/aproj/kshell/src/commands.c:362
        {
            if (processSignal(SIGINT)==SIGINT)
 3100af4:	83 ec 0c             	sub    esp,0xc
 3100af7:	6a 08                	push   0x8
 3100af9:	e8 b8 0a 00 00       	call   31015b6 <processSignal>
 3100afe:	83 c4 10             	add    esp,0x10
 3100b01:	83 f8 08             	cmp    eax,0x8
 3100b04:	75 16                	jne    3100b1c <cmdRepeat+0xc3>
/home/yogi/src/os/aproj/kshell/src/commands.c:363
                cnt=count;
 3100b06:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100b09:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:364
            break;
 3100b0c:	eb 0e                	jmp    3100b1c <cmdRepeat+0xc3>
/home/yogi/src/os/aproj/kshell/src/commands.c:356 (discriminator 2)
    else if (count >= 10)
        newCmdLine+=2;
    else 
        newCmdLine+=1;
    
    for (int cnt=0;cnt<count;cnt++)
 3100b0e:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:356 (discriminator 1)
 3100b12:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100b15:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 3100b18:	7c a7                	jl     3100ac1 <cmdRepeat+0x68>
/home/yogi/src/os/aproj/kshell/src/commands.c:368
                cnt=count;
            break;
        }
    }
    
}
 3100b1a:	eb 01                	jmp    3100b1d <cmdRepeat+0xc4>
/home/yogi/src/os/aproj/kshell/src/commands.c:364
        execInternalCommand(newCmdLine);
        if (bSigIntReceived)
        {
            if (processSignal(SIGINT)==SIGINT)
                cnt=count;
            break;
 3100b1c:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/commands.c:368 (discriminator 1)
        }
    }
    
}
 3100b1d:	90                   	nop
 3100b1e:	c9                   	leave  
 3100b1f:	c3                   	ret    

03100b20 <cmdExecp>:
cmdExecp():
/home/yogi/src/os/aproj/kshell/src/commands.c:371

void cmdExecp(char* cmdline)
{
 3100b20:	55                   	push   ebp
 3100b21:	89 e5                	mov    ebp,esp
 3100b23:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/commands.c:372
    kexec(cmdline, STDIN_FILE, STDOUT_FILE, STDERR_FILE);
 3100b26:	6a 02                	push   0x2
 3100b28:	6a 01                	push   0x1
 3100b2a:	6a 00                	push   0x0
 3100b2c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100b2f:	e8 42 f9 ff ff       	call   3100476 <kexec>
 3100b34:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:373
}
 3100b37:	90                   	nop
 3100b38:	c9                   	leave  
 3100b39:	c3                   	ret    

03100b3a <cmdExit>:
cmdExit():
/home/yogi/src/os/aproj/kshell/src/commands.c:376

void cmdExit(char *cmdline)
{
 3100b3a:	55                   	push   ebp
 3100b3b:	89 e5                	mov    ebp,esp
 3100b3d:	81 ec 08 05 00 00    	sub    esp,0x508
/home/yogi/src/os/aproj/kshell/src/commands.c:379
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 3100b43:	83 ec 04             	sub    esp,0x4
 3100b46:	68 00 05 00 00       	push   0x500
 3100b4b:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 3100b51:	50                   	push   eax
 3100b52:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100b55:	e8 7c 04 00 00       	call   3100fd6 <parseParamsShell>
 3100b5a:	83 c4 10             	add    esp,0x10
 3100b5d:	85 c0                	test   eax,eax
 3100b5f:	74 1d                	je     3100b7e <cmdExit+0x44>
/home/yogi/src/os/aproj/kshell/src/commands.c:381
    {
        exitCode = strtoul(params[0],0,10);
 3100b61:	83 ec 04             	sub    esp,0x4
 3100b64:	6a 0a                	push   0xa
 3100b66:	6a 00                	push   0x0
 3100b68:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 3100b6e:	50                   	push   eax
 3100b6f:	e8 6c 0f 00 00       	call   3101ae0 <kShell+0x50a>
 3100b74:	83 c4 10             	add    esp,0x10
 3100b77:	a3 20 32 10 03       	mov    ds:0x3103220,eax
 3100b7c:	eb 0a                	jmp    3100b88 <cmdExit+0x4e>
/home/yogi/src/os/aproj/kshell/src/commands.c:384
    }
    else
        exitCode = 0;
 3100b7e:	c7 05 20 32 10 03 00 	mov    DWORD PTR ds:0x3103220,0x0
 3100b85:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:385
    timeToExit=true;
 3100b88:	c6 05 2c 32 10 03 01 	mov    BYTE PTR ds:0x310322c,0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:386
}
 3100b8f:	90                   	nop
 3100b90:	c9                   	leave  
 3100b91:	c3                   	ret    

03100b92 <cmdHelp>:
cmdHelp():
/home/yogi/src/os/aproj/kshell/src/commands.c:389

void cmdHelp(char *cmdline)
{
 3100b92:	55                   	push   ebp
 3100b93:	89 e5                	mov    ebp,esp
 3100b95:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:392
    char* tok;
    
    tok=strtok(cmdline,delim);
 3100b98:	83 ec 08             	sub    esp,0x8
 3100b9b:	68 c4 2e 10 03       	push   0x3102ec4
 3100ba0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100ba3:	e8 e8 0f 00 00       	call   3101b90 <kShell+0x5ba>
 3100ba8:	83 c4 10             	add    esp,0x10
 3100bab:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:399
    {
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
 3100bae:	83 ec 08             	sub    esp,0x8
 3100bb1:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100bb4:	68 21 1f 10 03       	push   0x3101f21
 3100bb9:	e8 a2 0e 00 00       	call   3101a60 <kShell+0x48a>
 3100bbe:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:400
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100bc1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100bc8:	e9 86 00 00 00       	jmp    3100c53 <cmdHelp+0xc1>
/home/yogi/src/os/aproj/kshell/src/commands.c:401
        if (tok!=NULL)
 3100bcd:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100bd1:	74 50                	je     3100c23 <cmdHelp+0x91>
/home/yogi/src/os/aproj/kshell/src/commands.c:403
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
 3100bd3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100bd6:	c1 e0 04             	shl    eax,0x4
 3100bd9:	05 20 2c 10 03       	add    eax,0x3102c20
 3100bde:	8b 00                	mov    eax,DWORD PTR [eax]
 3100be0:	83 ec 04             	sub    esp,0x4
 3100be3:	6a 64                	push   0x64
 3100be5:	50                   	push   eax
 3100be6:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100be9:	e8 72 0f 00 00       	call   3101b60 <kShell+0x58a>
 3100bee:	83 c4 10             	add    esp,0x10
 3100bf1:	85 c0                	test   eax,eax
 3100bf3:	75 5a                	jne    3100c4f <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:404
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100bf5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100bf8:	c1 e0 04             	shl    eax,0x4
 3100bfb:	05 24 2c 10 03       	add    eax,0x3102c24
 3100c00:	8b 10                	mov    edx,DWORD PTR [eax]
 3100c02:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c05:	c1 e0 04             	shl    eax,0x4
 3100c08:	05 20 2c 10 03       	add    eax,0x3102c20
 3100c0d:	8b 00                	mov    eax,DWORD PTR [eax]
 3100c0f:	83 ec 04             	sub    esp,0x4
 3100c12:	52                   	push   edx
 3100c13:	50                   	push   eax
 3100c14:	68 2b 1f 10 03       	push   0x3101f2b
 3100c19:	e8 42 0e 00 00       	call   3101a60 <kShell+0x48a>
 3100c1e:	83 c4 10             	add    esp,0x10
 3100c21:	eb 2c                	jmp    3100c4f <cmdHelp+0xbd>
/home/yogi/src/os/aproj/kshell/src/commands.c:408
        }
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100c23:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c26:	c1 e0 04             	shl    eax,0x4
 3100c29:	05 24 2c 10 03       	add    eax,0x3102c24
 3100c2e:	8b 10                	mov    edx,DWORD PTR [eax]
 3100c30:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c33:	c1 e0 04             	shl    eax,0x4
 3100c36:	05 20 2c 10 03       	add    eax,0x3102c20
 3100c3b:	8b 00                	mov    eax,DWORD PTR [eax]
 3100c3d:	83 ec 04             	sub    esp,0x4
 3100c40:	52                   	push   edx
 3100c41:	50                   	push   eax
 3100c42:	68 2b 1f 10 03       	push   0x3101f2b
 3100c47:	e8 14 0e 00 00       	call   3101a60 <kShell+0x48a>
 3100c4c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:400 (discriminator 2)
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100c4f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:400 (discriminator 1)
 3100c53:	83 7d f4 0a          	cmp    DWORD PTR [ebp-0xc],0xa
 3100c57:	0f 86 70 ff ff ff    	jbe    3100bcd <cmdHelp+0x3b>
/home/yogi/src/os/aproj/kshell/src/commands.c:411
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
    
}
 3100c5d:	90                   	nop
 3100c5e:	c9                   	leave  
 3100c5f:	c3                   	ret    

03100c60 <cmdPwd>:
cmdPwd():
/home/yogi/src/os/aproj/kshell/src/commands.c:414

void cmdPwd()
{
 3100c60:	55                   	push   ebp
 3100c61:	89 e5                	mov    ebp,esp
 3100c63:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/commands.c:415
    char* buf=malloc(512);
 3100c66:	83 ec 0c             	sub    esp,0xc
 3100c69:	68 00 02 00 00       	push   0x200
 3100c6e:	e8 3d 0e 00 00       	call   3101ab0 <kShell+0x4da>
 3100c73:	83 c4 10             	add    esp,0x10
 3100c76:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:416
    print("%s\n",getcwd(buf,512));
 3100c79:	83 ec 08             	sub    esp,0x8
 3100c7c:	68 00 02 00 00       	push   0x200
 3100c81:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100c84:	e8 57 0f 00 00       	call   3101be0 <kShell+0x60a>
 3100c89:	83 c4 10             	add    esp,0x10
 3100c8c:	83 ec 08             	sub    esp,0x8
 3100c8f:	50                   	push   eax
 3100c90:	68 de 1d 10 03       	push   0x3101dde
 3100c95:	e8 c6 0d 00 00       	call   3101a60 <kShell+0x48a>
 3100c9a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:417
    free(buf);
 3100c9d:	83 ec 0c             	sub    esp,0xc
 3100ca0:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100ca3:	e8 d8 0f 00 00       	call   3101c80 <kShell+0x6aa>
 3100ca8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:418
}
 3100cab:	90                   	nop
 3100cac:	c9                   	leave  
 3100cad:	c3                   	ret    

03100cae <cmdSleep>:
cmdSleep():
/home/yogi/src/os/aproj/kshell/src/commands.c:421

void cmdSleep(char *cmdline)
{
 3100cae:	55                   	push   ebp
 3100caf:	89 e5                	mov    ebp,esp
 3100cb1:	53                   	push   ebx
 3100cb2:	81 ec 24 05 00 00    	sub    esp,0x524
 3100cb8:	89 e0                	mov    eax,esp
 3100cba:	89 c3                	mov    ebx,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:423
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 3100cbc:	83 ec 04             	sub    esp,0x4
 3100cbf:	68 00 05 00 00       	push   0x500
 3100cc4:	8d 85 e0 fa ff ff    	lea    eax,[ebp-0x520]
 3100cca:	50                   	push   eax
 3100ccb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100cce:	e8 03 03 00 00       	call   3100fd6 <parseParamsShell>
 3100cd3:	83 c4 10             	add    esp,0x10
 3100cd6:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:426

    //TODO: Remove this later ... leaving it here for a while to test mmap'd stack
    int size = 100000/4; //147400;
 3100cd9:	c7 45 e8 a8 61 00 00 	mov    DWORD PTR [ebp-0x18],0x61a8
/home/yogi/src/os/aproj/kshell/src/commands.c:427
    int test[size];
 3100ce0:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 3100ce3:	8d 50 ff             	lea    edx,[eax-0x1]
 3100ce6:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
 3100ce9:	c1 e0 02             	shl    eax,0x2
 3100cec:	8d 50 03             	lea    edx,[eax+0x3]
 3100cef:	b8 10 00 00 00       	mov    eax,0x10
 3100cf4:	83 e8 01             	sub    eax,0x1
 3100cf7:	01 d0                	add    eax,edx
 3100cf9:	b9 10 00 00 00       	mov    ecx,0x10
 3100cfe:	ba 00 00 00 00       	mov    edx,0x0
 3100d03:	f7 f1                	div    ecx
 3100d05:	6b c0 10             	imul   eax,eax,0x10
 3100d08:	29 c4                	sub    esp,eax
 3100d0a:	89 e0                	mov    eax,esp
 3100d0c:	83 c0 03             	add    eax,0x3
 3100d0f:	c1 e8 02             	shr    eax,0x2
 3100d12:	c1 e0 02             	shl    eax,0x2
 3100d15:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:429
    
    for (int cnt=0;cnt<size;cnt++)
 3100d18:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100d1f:	eb 10                	jmp    3100d31 <cmdSleep+0x83>
/home/yogi/src/os/aproj/kshell/src/commands.c:430 (discriminator 3)
        test[cnt]=cnt;
 3100d21:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100d24:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100d27:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 3100d2a:	89 0c 90             	mov    DWORD PTR [eax+edx*4],ecx
/home/yogi/src/os/aproj/kshell/src/commands.c:429 (discriminator 3)

    //TODO: Remove this later ... leaving it here for a while to test mmap'd stack
    int size = 100000/4; //147400;
    int test[size];
    
    for (int cnt=0;cnt<size;cnt++)
 3100d2d:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:429 (discriminator 1)
 3100d31:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100d34:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 3100d37:	7c e8                	jl     3100d21 <cmdSleep+0x73>
/home/yogi/src/os/aproj/kshell/src/commands.c:432
        test[cnt]=cnt;
    
    for (int cnt=0;cnt<size;cnt++)
 3100d39:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 3100d40:	eb 22                	jmp    3100d64 <cmdSleep+0xb6>
/home/yogi/src/os/aproj/kshell/src/commands.c:433
        if (test[cnt]!=cnt)
 3100d42:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100d45:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 3100d48:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
 3100d4b:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 3100d4e:	74 10                	je     3100d60 <cmdSleep+0xb2>
/home/yogi/src/os/aproj/kshell/src/commands.c:434
            printf("uh oh!");
 3100d50:	83 ec 0c             	sub    esp,0xc
 3100d53:	68 34 1f 10 03       	push   0x3101f34
 3100d58:	e8 13 0d 00 00       	call   3101a70 <kShell+0x49a>
 3100d5d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:432 (discriminator 2)
    int test[size];
    
    for (int cnt=0;cnt<size;cnt++)
        test[cnt]=cnt;
    
    for (int cnt=0;cnt<size;cnt++)
 3100d60:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:432 (discriminator 1)
 3100d64:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100d67:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 3100d6a:	7c d6                	jl     3100d42 <cmdSleep+0x94>
/home/yogi/src/os/aproj/kshell/src/commands.c:436
        if (test[cnt]!=cnt)
            printf("uh oh!");
    
    if (params[0][0]==0)
 3100d6c:	0f b6 85 e0 fa ff ff 	movzx  eax,BYTE PTR [ebp-0x520]
 3100d73:	84 c0                	test   al,al
 3100d75:	75 17                	jne    3100d8e <cmdSleep+0xe0>
/home/yogi/src/os/aproj/kshell/src/commands.c:438
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 3100d77:	83 ec 0c             	sub    esp,0xc
 3100d7a:	68 3c 1f 10 03       	push   0x3101f3c
 3100d7f:	e8 dc 0c 00 00       	call   3101a60 <kShell+0x48a>
 3100d84:	83 c4 10             	add    esp,0x10
 3100d87:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:439
        return;
 3100d8c:	eb 27                	jmp    3100db5 <cmdSleep+0x107>
/home/yogi/src/os/aproj/kshell/src/commands.c:442
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 3100d8e:	83 ec 04             	sub    esp,0x4
 3100d91:	6a 0a                	push   0xa
 3100d93:	6a 00                	push   0x0
 3100d95:	8d 85 e0 fa ff ff    	lea    eax,[ebp-0x520]
 3100d9b:	50                   	push   eax
 3100d9c:	e8 3f 0d 00 00       	call   3101ae0 <kShell+0x50a>
 3100da1:	83 c4 10             	add    esp,0x10
 3100da4:	83 ec 0c             	sub    esp,0xc
 3100da7:	50                   	push   eax
 3100da8:	e8 13 0d 00 00       	call   3101ac0 <kShell+0x4ea>
 3100dad:	83 c4 10             	add    esp,0x10
 3100db0:	b8 01 00 00 00       	mov    eax,0x1
 3100db5:	89 dc                	mov    esp,ebx
 3100db7:	83 f8 01             	cmp    eax,0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:443
}
 3100dba:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100dbd:	c9                   	leave  
 3100dbe:	c3                   	ret    
 3100dbf:	90                   	nop

03100dc0 <preprocessCmd>:
preprocessCmd():
/home/yogi/src/os/aproj/kshell/src/kshell.c:26
int findCommand(char* command);
char **buildargv (const char *input);


void preprocessCmd(char *command)
{
 3100dc0:	55                   	push   ebp
 3100dc1:	89 e5                	mov    ebp,esp
/home/yogi/src/os/aproj/kshell/src/kshell.c:28
    
}
 3100dc3:	90                   	nop
 3100dc4:	5d                   	pop    ebp
 3100dc5:	c3                   	ret    

03100dc6 <execCmds>:
execCmds():
/home/yogi/src/os/aproj/kshell/src/kshell.c:31

void execCmds(char **cmds)
{
 3100dc6:	55                   	push   ebp
 3100dc7:	89 e5                	mov    ebp,esp
 3100dc9:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:32
    char **lcmds = cmds;
 3100dcc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100dcf:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:34
    
    while (*lcmds)
 3100dd2:	eb 15                	jmp    3100de9 <execCmds+0x23>
/home/yogi/src/os/aproj/kshell/src/kshell.c:36
    {
        execInternalCommand(*lcmds);
 3100dd4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100dd7:	8b 00                	mov    eax,DWORD PTR [eax]
 3100dd9:	83 ec 0c             	sub    esp,0xc
 3100ddc:	50                   	push   eax
 3100ddd:	e8 40 01 00 00       	call   3100f22 <execInternalCommand>
 3100de2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:37
        lcmds++;
 3100de5:	83 45 f4 04          	add    DWORD PTR [ebp-0xc],0x4
/home/yogi/src/os/aproj/kshell/src/kshell.c:34

void execCmds(char **cmds)
{
    char **lcmds = cmds;
    
    while (*lcmds)
 3100de9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100dec:	8b 00                	mov    eax,DWORD PTR [eax]
 3100dee:	85 c0                	test   eax,eax
 3100df0:	75 e2                	jne    3100dd4 <execCmds+0xe>
/home/yogi/src/os/aproj/kshell/src/kshell.c:39
    {
        execInternalCommand(*lcmds);
        lcmds++;
    }
}
 3100df2:	90                   	nop
 3100df3:	c9                   	leave  
 3100df4:	c3                   	ret    

03100df5 <parseCmds>:
parseCmds():
/home/yogi/src/os/aproj/kshell/src/kshell.c:43

//Parse individual commandline (look for pipes)
char** parseCmds(char *command)
{
 3100df5:	55                   	push   ebp
 3100df6:	89 e5                	mov    ebp,esp
 3100df8:	53                   	push   ebx
 3100df9:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/aproj/kshell/src/kshell.c:44
    char delims[3] = ";";
 3100dfc:	66 c7 45 e5 3b 00    	mov    WORD PTR [ebp-0x1b],0x3b
 3100e02:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:46
    char **cmds;
    char *ltemp=command; //malloc(1024);
 3100e06:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100e09:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:47
    int lCommandPtr=0;
 3100e0c:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:49
    char *cmd;
    char cmdptr=0;
 3100e13:	c6 45 f3 00          	mov    BYTE PTR [ebp-0xd],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:50
    char *cmdbegin=command;
 3100e17:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100e1a:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:52

    memset(kCmdline,0,CMDLINE_BUFFER_SIZE);
 3100e1d:	a1 60 2d 11 03       	mov    eax,ds:0x3112d60
 3100e22:	83 ec 04             	sub    esp,0x4
 3100e25:	68 00 c8 00 00       	push   0xc800
 3100e2a:	6a 00                	push   0x0
 3100e2c:	50                   	push   eax
 3100e2d:	e8 8e 0d 00 00       	call   3101bc0 <kShell+0x5ea>
 3100e32:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:54

    ltemp=command;
 3100e35:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100e38:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:59
    
    //Find ; or | which both separate commands
    while (1==1)
    {
        if (*ltemp==';' || *ltemp=='|' || *ltemp==0)
 3100e3b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100e3e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100e41:	3c 3b                	cmp    al,0x3b
 3100e43:	74 18                	je     3100e5d <parseCmds+0x68>
/home/yogi/src/os/aproj/kshell/src/kshell.c:59 (discriminator 1)
 3100e45:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100e48:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100e4b:	3c 7c                	cmp    al,0x7c
 3100e4d:	74 0e                	je     3100e5d <parseCmds+0x68>
/home/yogi/src/os/aproj/kshell/src/kshell.c:59 (discriminator 2)
 3100e4f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100e52:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100e55:	84 c0                	test   al,al
 3100e57:	0f 85 b1 00 00 00    	jne    3100f0e <parseCmds+0x119>
/home/yogi/src/os/aproj/kshell/src/kshell.c:61
        {
            kCmdline[cmdptr]=kCmdline+(PARSE_CMD_COUNT*4) + (cmdptr*CMDLINE_MAX_SIZE);
 3100e5d:	a1 60 2d 11 03       	mov    eax,ds:0x3112d60
 3100e62:	0f be 55 f3          	movsx  edx,BYTE PTR [ebp-0xd]
 3100e66:	c1 e2 02             	shl    edx,0x2
 3100e69:	01 d0                	add    eax,edx
 3100e6b:	8b 15 60 2d 11 03    	mov    edx,DWORD PTR ds:0x3112d60
 3100e71:	0f be 4d f3          	movsx  ecx,BYTE PTR [ebp-0xd]
 3100e75:	c1 e1 0b             	shl    ecx,0xb
 3100e78:	81 c1 40 06 00 00    	add    ecx,0x640
 3100e7e:	01 ca                	add    edx,ecx
 3100e80:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/kshell/src/kshell.c:63
            
            if (*ltemp=='|')
 3100e82:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100e85:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100e88:	3c 7c                	cmp    al,0x7c
 3100e8a:	75 3b                	jne    3100ec7 <parseCmds+0xd2>
/home/yogi/src/os/aproj/kshell/src/kshell.c:64
                strncpy(kCmdline[cmdptr++],cmdbegin,(uint32_t)ltemp-(uint32_t)cmdbegin+1);
 3100e8c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100e8f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100e92:	29 c2                	sub    edx,eax
 3100e94:	89 d0                	mov    eax,edx
 3100e96:	8d 50 01             	lea    edx,[eax+0x1]
 3100e99:	8b 0d 60 2d 11 03    	mov    ecx,DWORD PTR ds:0x3112d60
 3100e9f:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
 3100ea3:	89 c3                	mov    ebx,eax
 3100ea5:	83 c3 01             	add    ebx,0x1
 3100ea8:	88 5d f3             	mov    BYTE PTR [ebp-0xd],bl
 3100eab:	0f be c0             	movsx  eax,al
 3100eae:	c1 e0 02             	shl    eax,0x2
 3100eb1:	01 c8                	add    eax,ecx
 3100eb3:	8b 00                	mov    eax,DWORD PTR [eax]
 3100eb5:	83 ec 04             	sub    esp,0x4
 3100eb8:	52                   	push   edx
 3100eb9:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100ebc:	50                   	push   eax
 3100ebd:	e8 ae 0c 00 00       	call   3101b70 <kShell+0x59a>
 3100ec2:	83 c4 10             	add    esp,0x10
 3100ec5:	eb 34                	jmp    3100efb <parseCmds+0x106>
/home/yogi/src/os/aproj/kshell/src/kshell.c:66
            else
                strncpy(kCmdline[cmdptr++],cmdbegin,(uint32_t)ltemp-(uint32_t)cmdbegin);
 3100ec7:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100eca:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100ecd:	29 c2                	sub    edx,eax
 3100ecf:	8b 0d 60 2d 11 03    	mov    ecx,DWORD PTR ds:0x3112d60
 3100ed5:	0f b6 45 f3          	movzx  eax,BYTE PTR [ebp-0xd]
 3100ed9:	89 c3                	mov    ebx,eax
 3100edb:	83 c3 01             	add    ebx,0x1
 3100ede:	88 5d f3             	mov    BYTE PTR [ebp-0xd],bl
 3100ee1:	0f be c0             	movsx  eax,al
 3100ee4:	c1 e0 02             	shl    eax,0x2
 3100ee7:	01 c8                	add    eax,ecx
 3100ee9:	8b 00                	mov    eax,DWORD PTR [eax]
 3100eeb:	83 ec 04             	sub    esp,0x4
 3100eee:	52                   	push   edx
 3100eef:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100ef2:	50                   	push   eax
 3100ef3:	e8 78 0c 00 00       	call   3101b70 <kShell+0x59a>
 3100ef8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:67
            if (*ltemp=='\0')
 3100efb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100efe:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100f01:	84 c0                	test   al,al
 3100f03:	74 12                	je     3100f17 <parseCmds+0x122>
/home/yogi/src/os/aproj/kshell/src/kshell.c:69
                break;
            cmdbegin=ltemp+1;
 3100f05:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100f08:	83 c0 01             	add    eax,0x1
 3100f0b:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:71
        }
        ltemp++;
 3100f0e:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:72
    }
 3100f12:	e9 24 ff ff ff       	jmp    3100e3b <parseCmds+0x46>
/home/yogi/src/os/aproj/kshell/src/kshell.c:68
            if (*ltemp=='|')
                strncpy(kCmdline[cmdptr++],cmdbegin,(uint32_t)ltemp-(uint32_t)cmdbegin+1);
            else
                strncpy(kCmdline[cmdptr++],cmdbegin,(uint32_t)ltemp-(uint32_t)cmdbegin);
            if (*ltemp=='\0')
                break;
 3100f17:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:74
            cmdbegin=ltemp+1;
        }
        ltemp++;
    }

    return kCmdline;
 3100f18:	a1 60 2d 11 03       	mov    eax,ds:0x3112d60
/home/yogi/src/os/aproj/kshell/src/kshell.c:75
}
 3100f1d:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100f20:	c9                   	leave  
 3100f21:	c3                   	ret    

03100f22 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:78

void execInternalCommand(char lCommand[256])
{
 3100f22:	55                   	push   ebp
 3100f23:	89 e5                	mov    ebp,esp
 3100f25:	53                   	push   ebx
 3100f26:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:79
    strtrim(lCommand);
 3100f29:	83 ec 0c             	sub    esp,0xc
 3100f2c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100f2f:	e8 9c 0c 00 00       	call   3101bd0 <kShell+0x5fa>
 3100f34:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:80
    int i = findCommand(lCommand);
 3100f37:	83 ec 0c             	sub    esp,0xc
 3100f3a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100f3d:	e8 3d 02 00 00       	call   310117f <findCommand>
 3100f42:	83 c4 10             	add    esp,0x10
 3100f45:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:82

    if(i>0)
 3100f48:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100f4c:	7e 74                	jle    3100fc2 <execInternalCommand+0xa0>
/home/yogi/src/os/aproj/kshell/src/kshell.c:84
    {
        i--;
 3100f4e:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:86
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 3100f52:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100f55:	c1 e0 04             	shl    eax,0x4
 3100f58:	05 e8 2c 10 03       	add    eax,0x3102ce8
 3100f5d:	8b 00                	mov    eax,DWORD PTR [eax]
 3100f5f:	a3 14 32 10 03       	mov    ds:0x3103214,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:87
        command_function_p = cmds[i].function;
 3100f64:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100f67:	c1 e0 04             	shl    eax,0x4
 3100f6a:	05 e8 2c 10 03       	add    eax,0x3102ce8
 3100f6f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100f71:	a3 00 32 10 03       	mov    ds:0x3103200,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:88
        if (cmds[i].paramCount==0)
 3100f76:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100f79:	c1 e0 04             	shl    eax,0x4
 3100f7c:	05 ec 2c 10 03       	add    eax,0x3102cec
 3100f81:	8b 00                	mov    eax,DWORD PTR [eax]
 3100f83:	85 c0                	test   eax,eax
 3100f85:	75 09                	jne    3100f90 <execInternalCommand+0x6e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:89
            command_function();
 3100f87:	a1 14 32 10 03       	mov    eax,ds:0x3103214
 3100f8c:	ff d0                	call   eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:100
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 3100f8e:	eb 40                	jmp    3100fd0 <execInternalCommand+0xae>
/home/yogi/src/os/aproj/kshell/src/kshell.c:92
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
 3100f90:	8b 1d 00 32 10 03    	mov    ebx,DWORD PTR ds:0x3103200
 3100f96:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100f99:	c1 e0 04             	shl    eax,0x4
 3100f9c:	05 e0 2c 10 03       	add    eax,0x3102ce0
 3100fa1:	8b 00                	mov    eax,DWORD PTR [eax]
 3100fa3:	83 ec 0c             	sub    esp,0xc
 3100fa6:	50                   	push   eax
 3100fa7:	e8 a4 0c 00 00       	call   3101c50 <kShell+0x67a>
 3100fac:	83 c4 10             	add    esp,0x10
 3100faf:	8d 50 01             	lea    edx,[eax+0x1]
 3100fb2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100fb5:	01 d0                	add    eax,edx
 3100fb7:	83 ec 0c             	sub    esp,0xc
 3100fba:	50                   	push   eax
 3100fbb:	ff d3                	call   ebx
 3100fbd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:100
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 3100fc0:	eb 0e                	jmp    3100fd0 <execInternalCommand+0xae>
/home/yogi/src/os/aproj/kshell/src/kshell.c:98
        }
    }
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
 3100fc2:	83 ec 0c             	sub    esp,0xc
 3100fc5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100fc8:	e8 53 fb ff ff       	call   3100b20 <cmdExecp>
 3100fcd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:100
    }
}
 3100fd0:	90                   	nop
 3100fd1:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100fd4:	c9                   	leave  
 3100fd5:	c3                   	ret    

03100fd6 <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:103

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 3100fd6:	55                   	push   ebp
 3100fd7:	89 e5                	mov    ebp,esp
 3100fd9:	53                   	push   ebx
 3100fda:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/aproj/kshell/src/kshell.c:104
    int x=0,y=0;
 3100fdd:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100fe4:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:105
    int lRetVal=0,parsedChars=0;
 3100feb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100ff2:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:106
    bool needDoubleQuotetoEndParam=0;
 3100ff9:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:108
    
    memset(params,0, size);
 3100ffd:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3101000:	83 ec 04             	sub    esp,0x4
 3101003:	50                   	push   eax
 3101004:	6a 00                	push   0x0
 3101006:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3101009:	e8 b2 0b 00 00       	call   3101bc0 <kShell+0x5ea>
 310100e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:110
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3101011:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 3101018:	e9 24 01 00 00       	jmp    3101141 <parseParamsShell+0x16b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:112
    {
        if(cmdLine[cnt]=='"')
 310101d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3101020:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3101023:	01 d0                	add    eax,edx
 3101025:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101028:	3c 22                	cmp    al,0x22
 310102a:	75 41                	jne    310106d <parseParamsShell+0x97>
/home/yogi/src/os/aproj/kshell/src/kshell.c:114
        {
            if (!needDoubleQuotetoEndParam)
 310102c:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3101030:	83 f0 01             	xor    eax,0x1
 3101033:	84 c0                	test   al,al
 3101035:	74 09                	je     3101040 <parseParamsShell+0x6a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:116
            {
                needDoubleQuotetoEndParam=true;
 3101037:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
 310103b:	e9 f9 00 00 00       	jmp    3101139 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:120
            }
            else
            {
                params[y][x]='\0';
 3101040:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3101043:	c1 e0 07             	shl    eax,0x7
 3101046:	89 c2                	mov    edx,eax
 3101048:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310104b:	01 c2                	add    edx,eax
 310104d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101050:	01 d0                	add    eax,edx
 3101052:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:121
                {x=0;y++;lRetVal++;}
 3101055:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310105c:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3101060:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:122
                needDoubleQuotetoEndParam=false;
 3101064:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
 3101068:	e9 cc 00 00 00       	jmp    3101139 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:125
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
 310106d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3101070:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3101073:	01 d0                	add    eax,edx
 3101075:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101078:	3c 20                	cmp    al,0x20
 310107a:	74 1e                	je     310109a <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:125 (discriminator 2)
 310107c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310107f:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3101082:	01 d0                	add    eax,edx
 3101084:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101087:	3c 2d                	cmp    al,0x2d
 3101089:	74 0f                	je     310109a <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:125 (discriminator 4)
 310108b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310108e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3101091:	01 d0                	add    eax,edx
 3101093:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101096:	3c 2c                	cmp    al,0x2c
 3101098:	75 7a                	jne    3101114 <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:125 (discriminator 5)
 310109a:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 310109e:	83 f0 01             	xor    eax,0x1
 31010a1:	84 c0                	test   al,al
 31010a3:	74 6f                	je     3101114 <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:128
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 31010a5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31010a8:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31010ab:	01 d0                	add    eax,edx
 31010ad:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31010b0:	3c 2d                	cmp    al,0x2d
 31010b2:	74 0f                	je     31010c3 <parseParamsShell+0xed>
/home/yogi/src/os/aproj/kshell/src/kshell.c:128 (discriminator 1)
 31010b4:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31010b7:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31010ba:	01 d0                	add    eax,edx
 31010bc:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31010bf:	3c 2f                	cmp    al,0x2f
 31010c1:	75 25                	jne    31010e8 <parseParamsShell+0x112>
/home/yogi/src/os/aproj/kshell/src/kshell.c:129
                params[y][x++]=cmdLine[cnt];
 31010c3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31010c6:	c1 e0 07             	shl    eax,0x7
 31010c9:	89 c2                	mov    edx,eax
 31010cb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31010ce:	8d 0c 02             	lea    ecx,[edx+eax*1]
 31010d1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31010d4:	8d 50 01             	lea    edx,[eax+0x1]
 31010d7:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31010da:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31010dd:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 31010e0:	01 da                	add    edx,ebx
 31010e2:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31010e5:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:130
            params[y][x]='\0';
 31010e8:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31010eb:	c1 e0 07             	shl    eax,0x7
 31010ee:	89 c2                	mov    edx,eax
 31010f0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31010f3:	01 c2                	add    edx,eax
 31010f5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31010f8:	01 d0                	add    eax,edx
 31010fa:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:131
            if (cnt>0)
 31010fd:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 3101101:	74 36                	je     3101139 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:132
                {x=0;y++;lRetVal++;}
 3101103:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310110a:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 310110e:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:131
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 3101112:	eb 25                	jmp    3101139 <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/src/kshell.c:137
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 3101114:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3101117:	c1 e0 07             	shl    eax,0x7
 310111a:	89 c2                	mov    edx,eax
 310111c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310111f:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3101122:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101125:	8d 50 01             	lea    edx,[eax+0x1]
 3101128:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310112b:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 310112e:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 3101131:	01 da                	add    edx,ebx
 3101133:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3101136:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:139 (discriminator 2)
        }
        parsedChars++;
 3101139:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:110 (discriminator 2)
    int lRetVal=0,parsedChars=0;
    bool needDoubleQuotetoEndParam=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 310113d:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:110 (discriminator 1)
 3101141:	83 ec 0c             	sub    esp,0xc
 3101144:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3101147:	e8 04 0b 00 00       	call   3101c50 <kShell+0x67a>
 310114c:	83 c4 10             	add    esp,0x10
 310114f:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3101152:	0f 87 c5 fe ff ff    	ja     310101d <parseParamsShell+0x47>
/home/yogi/src/os/aproj/kshell/src/kshell.c:141
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 3101158:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 310115c:	74 19                	je     3101177 <parseParamsShell+0x1a1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:143
    {
        lRetVal++;
 310115e:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:144
        params[y][x]='\0';
 3101162:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3101165:	c1 e0 07             	shl    eax,0x7
 3101168:	89 c2                	mov    edx,eax
 310116a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310116d:	01 c2                	add    edx,eax
 310116f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101172:	01 d0                	add    eax,edx
 3101174:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:149
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 3101177:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/aproj/kshell/src/kshell.c:150
}
 310117a:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 310117d:	c9                   	leave  
 310117e:	c3                   	ret    

0310117f <findCommand>:
findCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:153

int findCommand(char* command)
{
 310117f:	55                   	push   ebp
 3101180:	89 e5                	mov    ebp,esp
 3101182:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:157
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3101185:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310118c:	eb 4d                	jmp    31011db <findCommand+0x5c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:159
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 310118e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101191:	c1 e0 04             	shl    eax,0x4
 3101194:	05 e0 2c 10 03       	add    eax,0x3102ce0
 3101199:	8b 00                	mov    eax,DWORD PTR [eax]
 310119b:	83 ec 0c             	sub    esp,0xc
 310119e:	50                   	push   eax
 310119f:	e8 ac 0a 00 00       	call   3101c50 <kShell+0x67a>
 31011a4:	83 c4 10             	add    esp,0x10
 31011a7:	89 c2                	mov    edx,eax
 31011a9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31011ac:	c1 e0 04             	shl    eax,0x4
 31011af:	05 e0 2c 10 03       	add    eax,0x3102ce0
 31011b4:	8b 00                	mov    eax,DWORD PTR [eax]
 31011b6:	83 ec 04             	sub    esp,0x4
 31011b9:	52                   	push   edx
 31011ba:	50                   	push   eax
 31011bb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31011be:	e8 9d 09 00 00       	call   3101b60 <kShell+0x58a>
 31011c3:	83 c4 10             	add    esp,0x10
 31011c6:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:161
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 31011c9:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31011cd:	75 08                	jne    31011d7 <findCommand+0x58>
/home/yogi/src/os/aproj/kshell/src/kshell.c:164
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 31011cf:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31011d2:	83 c0 01             	add    eax,0x1
 31011d5:	eb 0f                	jmp    31011e6 <findCommand+0x67>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 31011d7:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 1)
 31011db:	83 7d f4 0a          	cmp    DWORD PTR [ebp-0xc],0xa
 31011df:	76 ad                	jbe    310118e <findCommand+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:168
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 31011e1:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:169
}
 31011e6:	c9                   	leave  
 31011e7:	c3                   	ret    

031011e8 <buildargv>:
buildargv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:173

/*parts from http://*/
char **buildargv (const char *input)
{
 31011e8:	55                   	push   ebp
 31011e9:	89 e5                	mov    ebp,esp
 31011eb:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:176
  char *arg;
  char *copybuf;
  int squote = 0;
 31011ee:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:177
  int dquote = 0;
 31011f5:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:178
  int bsquote = 0;
 31011fc:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:179
  int argc = 0;
 3101203:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:180
  int maxargc = 0;
 310120a:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:181
  char **argv = NULL;
 3101211:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:185
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 3101218:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 310121c:	0f 84 33 02 00 00    	je     3101455 <buildargv+0x26d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:188
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 3101222:	83 ec 0c             	sub    esp,0xc
 3101225:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3101228:	e8 23 0a 00 00       	call   3101c50 <kShell+0x67a>
 310122d:	83 c4 10             	add    esp,0x10
 3101230:	83 c0 01             	add    eax,0x1
 3101233:	83 ec 0c             	sub    esp,0xc
 3101236:	50                   	push   eax
 3101237:	e8 74 08 00 00       	call   3101ab0 <kShell+0x4da>
 310123c:	83 c4 10             	add    esp,0x10
 310123f:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:196
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 3101242:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 3101246:	74 0b                	je     3101253 <buildargv+0x6b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:196 (discriminator 1)
 3101248:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 310124b:	83 e8 01             	sub    eax,0x1
 310124e:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3101251:	7f 3d                	jg     3101290 <buildargv+0xa8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:199
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 3101253:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 3101257:	75 1c                	jne    3101275 <buildargv+0x8d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:201
		{
		  maxargc = INITIAL_MAXARGC;
 3101259:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:202
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 3101260:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3101263:	c1 e0 02             	shl    eax,0x2
 3101266:	83 ec 0c             	sub    esp,0xc
 3101269:	50                   	push   eax
 310126a:	e8 41 08 00 00       	call   3101ab0 <kShell+0x4da>
 310126f:	83 c4 10             	add    esp,0x10
 3101272:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:204
		}
	      argv = nargv;
 3101275:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 3101278:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:205
	      argv[argc] = NULL;
 310127b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310127e:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3101285:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3101288:	01 d0                	add    eax,edx
 310128a:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:208
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 3101290:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3101293:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:209
	  while (*input != EOS)
 3101296:	e9 ec 00 00 00       	jmp    3101387 <buildargv+0x19f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:211
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 310129b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310129e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31012a1:	3c 20                	cmp    al,0x20
 31012a3:	75 16                	jne    31012bb <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:211 (discriminator 1)
 31012a5:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31012a9:	75 10                	jne    31012bb <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:211 (discriminator 2)
 31012ab:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31012af:	75 0a                	jne    31012bb <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:211 (discriminator 3)
 31012b1:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 31012b5:	0f 84 da 00 00 00    	je     3101395 <buildargv+0x1ad>
/home/yogi/src/os/aproj/kshell/src/kshell.c:217
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 31012bb:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 31012bf:	74 1d                	je     31012de <buildargv+0xf6>
/home/yogi/src/os/aproj/kshell/src/kshell.c:219
		    {
		      bsquote = 0;
 31012c1:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:220
		      *arg++ = *input;
 31012c8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31012cb:	8d 50 01             	lea    edx,[eax+0x1]
 31012ce:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31012d1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31012d4:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31012d7:	88 10                	mov    BYTE PTR [eax],dl
 31012d9:	e9 a5 00 00 00       	jmp    3101383 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:222
		    }
		  else if (*input == '\\')
 31012de:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31012e1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31012e4:	3c 5c                	cmp    al,0x5c
 31012e6:	75 0c                	jne    31012f4 <buildargv+0x10c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:224
		    {
		      bsquote = 1;
 31012e8:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 31012ef:	e9 8f 00 00 00       	jmp    3101383 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:226
		    }
		  else if (squote)
 31012f4:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31012f8:	74 26                	je     3101320 <buildargv+0x138>
/home/yogi/src/os/aproj/kshell/src/kshell.c:228
		    {
		      if (*input == '\'')
 31012fa:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31012fd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101300:	3c 27                	cmp    al,0x27
 3101302:	75 09                	jne    310130d <buildargv+0x125>
/home/yogi/src/os/aproj/kshell/src/kshell.c:230
			{
			  squote = 0;
 3101304:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 310130b:	eb 76                	jmp    3101383 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:234
			}
		      else
			{
			  *arg++ = *input;
 310130d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101310:	8d 50 01             	lea    edx,[eax+0x1]
 3101313:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3101316:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3101319:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310131c:	88 10                	mov    BYTE PTR [eax],dl
 310131e:	eb 63                	jmp    3101383 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:237
			}
		    }
		  else if (dquote)
 3101320:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3101324:	74 26                	je     310134c <buildargv+0x164>
/home/yogi/src/os/aproj/kshell/src/kshell.c:239
		    {
		      if (*input == '"')
 3101326:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3101329:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310132c:	3c 22                	cmp    al,0x22
 310132e:	75 09                	jne    3101339 <buildargv+0x151>
/home/yogi/src/os/aproj/kshell/src/kshell.c:241
			{
			  dquote = 0;
 3101330:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 3101337:	eb 4a                	jmp    3101383 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:245
			}
		      else
			{
			  *arg++ = *input;
 3101339:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310133c:	8d 50 01             	lea    edx,[eax+0x1]
 310133f:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3101342:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3101345:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3101348:	88 10                	mov    BYTE PTR [eax],dl
 310134a:	eb 37                	jmp    3101383 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:250
			}
		    }
		  else
		    {
		      if (*input == '\'')
 310134c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310134f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101352:	3c 27                	cmp    al,0x27
 3101354:	75 09                	jne    310135f <buildargv+0x177>
/home/yogi/src/os/aproj/kshell/src/kshell.c:252
			{
			  squote = 1;
 3101356:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 310135d:	eb 24                	jmp    3101383 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:254
			}
		      else if (*input == '"')
 310135f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3101362:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101365:	3c 22                	cmp    al,0x22
 3101367:	75 09                	jne    3101372 <buildargv+0x18a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:256
			{
			  dquote = 1;
 3101369:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 3101370:	eb 11                	jmp    3101383 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:260
			}
		      else
			{
			  *arg++ = *input;
 3101372:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101375:	8d 50 01             	lea    edx,[eax+0x1]
 3101378:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310137b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310137e:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3101381:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:264
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 3101383:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:209
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 3101387:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310138a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310138d:	84 c0                	test   al,al
 310138f:	0f 85 06 ff ff ff    	jne    310129b <buildargv+0xb3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:267
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 3101395:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101398:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:269
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 310139b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310139e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31013a1:	84 c0                	test   al,al
 31013a3:	0f 84 9e 00 00 00    	je     3101447 <buildargv+0x25f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:271
          {
            char* temp=malloc(strlen(copybuf)+1);
 31013a9:	83 ec 0c             	sub    esp,0xc
 31013ac:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31013af:	e8 9c 08 00 00       	call   3101c50 <kShell+0x67a>
 31013b4:	83 c4 10             	add    esp,0x10
 31013b7:	83 c0 01             	add    eax,0x1
 31013ba:	83 ec 0c             	sub    esp,0xc
 31013bd:	50                   	push   eax
 31013be:	e8 ed 06 00 00       	call   3101ab0 <kShell+0x4da>
 31013c3:	83 c4 10             	add    esp,0x10
 31013c6:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:274
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 31013c9:	83 ec 08             	sub    esp,0x8
 31013cc:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31013cf:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 31013d2:	e8 69 06 00 00       	call   3101a40 <kShell+0x46a>
 31013d7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:275
            free(copybuf);
 31013da:	83 ec 0c             	sub    esp,0xc
 31013dd:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31013e0:	e8 9b 08 00 00       	call   3101c80 <kShell+0x6aa>
 31013e5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:276
            copybuf = (char *) malloc (strlen (input) + 1);
 31013e8:	83 ec 0c             	sub    esp,0xc
 31013eb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31013ee:	e8 5d 08 00 00       	call   3101c50 <kShell+0x67a>
 31013f3:	83 c4 10             	add    esp,0x10
 31013f6:	83 c0 01             	add    eax,0x1
 31013f9:	83 ec 0c             	sub    esp,0xc
 31013fc:	50                   	push   eax
 31013fd:	e8 ae 06 00 00       	call   3101ab0 <kShell+0x4da>
 3101402:	83 c4 10             	add    esp,0x10
 3101405:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:277
            argv[argc] = temp;
 3101408:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310140b:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3101412:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3101415:	01 c2                	add    edx,eax
 3101417:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 310141a:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:279
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 310141c:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:280
            argv[argc] = NULL;
 3101420:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3101423:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 310142a:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 310142d:	01 d0                	add    eax,edx
 310142f:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:281
            input++;
 3101435:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:282
            free(temp);
 3101439:	83 ec 0c             	sub    esp,0xc
 310143c:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 310143f:	e8 3c 08 00 00       	call   3101c80 <kShell+0x6aa>
 3101444:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:285
          }
	}
      while (*input != EOS);
 3101447:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310144a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310144d:	84 c0                	test   al,al
 310144f:	0f 85 ed fd ff ff    	jne    3101242 <buildargv+0x5a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:288
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 3101455:	83 ec 0c             	sub    esp,0xc
 3101458:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310145b:	e8 20 08 00 00       	call   3101c80 <kShell+0x6aa>
 3101460:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:289
  free(nargv);
 3101463:	83 ec 0c             	sub    esp,0xc
 3101466:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3101469:	e8 12 08 00 00       	call   3101c80 <kShell+0x6aa>
 310146e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:290
  return (argv);
 3101471:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/kshell/src/kshell.c:291
}
 3101474:	c9                   	leave  
 3101475:	c3                   	ret    

03101476 <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:294

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
 3101476:	55                   	push   ebp
 3101477:	89 e5                	mov    ebp,esp
 3101479:	53                   	push   ebx
 310147a:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:295
    for (int cnt=0;cnt<pcount;cnt++)
 310147d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3101484:	eb 56                	jmp    31014dc <paramsToArgv+0x66>
/home/yogi/src/os/aproj/kshell/src/kshell.c:297 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 3101486:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101489:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3101490:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3101493:	8d 1c 02             	lea    ebx,[edx+eax*1]
 3101496:	83 ec 0c             	sub    esp,0xc
 3101499:	68 80 00 00 00       	push   0x80
 310149e:	e8 0d 06 00 00       	call   3101ab0 <kShell+0x4da>
 31014a3:	83 c4 10             	add    esp,0x10
 31014a6:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:298 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 31014a8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31014ab:	c1 e0 07             	shl    eax,0x7
 31014ae:	89 c2                	mov    edx,eax
 31014b0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31014b3:	01 c2                	add    edx,eax
 31014b5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31014b8:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 31014bf:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 31014c2:	01 c8                	add    eax,ecx
 31014c4:	8b 00                	mov    eax,DWORD PTR [eax]
 31014c6:	83 ec 04             	sub    esp,0x4
 31014c9:	68 80 00 00 00       	push   0x80
 31014ce:	52                   	push   edx
 31014cf:	50                   	push   eax
 31014d0:	e8 cb 05 00 00       	call   3101aa0 <kShell+0x4ca>
 31014d5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:295 (discriminator 3)
  return (argv);
}

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
    for (int cnt=0;cnt<pcount;cnt++)
 31014d8:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:295 (discriminator 1)
 31014dc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31014df:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 31014e2:	7c a2                	jl     3101486 <paramsToArgv+0x10>
/home/yogi/src/os/aproj/kshell/src/kshell.c:300
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
 31014e4:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
/home/yogi/src/os/aproj/kshell/src/kshell.c:301
}
 31014e7:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31014ea:	c9                   	leave  
 31014eb:	c3                   	ret    

031014ec <freeArgV>:
freeArgV():
/home/yogi/src/os/aproj/kshell/src/kshell.c:304

void freeArgV(int pcount, char **params)
{
 31014ec:	55                   	push   ebp
 31014ed:	89 e5                	mov    ebp,esp
 31014ef:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/src/kshell.c:305
    for (int cnt=0;cnt<pcount;cnt++)
 31014f2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31014f9:	eb 15                	jmp    3101510 <freeArgV+0x24>
/home/yogi/src/os/aproj/kshell/src/kshell.c:306 (discriminator 3)
        free(*params);
 31014fb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31014fe:	8b 00                	mov    eax,DWORD PTR [eax]
 3101500:	83 ec 0c             	sub    esp,0xc
 3101503:	50                   	push   eax
 3101504:	e8 77 07 00 00       	call   3101c80 <kShell+0x6aa>
 3101509:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:305 (discriminator 3)
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 310150c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:305 (discriminator 1)
 3101510:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101513:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3101516:	7c e3                	jl     31014fb <freeArgV+0xf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:307
        free(*params);
    free(params);
 3101518:	83 ec 0c             	sub    esp,0xc
 310151b:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 310151e:	e8 5d 07 00 00       	call   3101c80 <kShell+0x6aa>
 3101523:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:308
}
 3101526:	90                   	nop
 3101527:	c9                   	leave  
 3101528:	c3                   	ret    

03101529 <saveCommand>:
saveCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:319
    
}
*/

void saveCommand(char* command)
{
 3101529:	55                   	push   ebp
 310152a:	89 e5                	mov    ebp,esp
 310152c:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:320
    strcpy(commandHistory[commandHistoryMax++],command);
 310152f:	a1 3c 32 10 03       	mov    eax,ds:0x310323c
 3101534:	8d 50 01             	lea    edx,[eax+0x1]
 3101537:	89 15 3c 32 10 03    	mov    DWORD PTR ds:0x310323c,edx
 310153d:	c1 e0 07             	shl    eax,0x7
 3101540:	05 40 32 10 03       	add    eax,0x3103240
 3101545:	83 ec 08             	sub    esp,0x8
 3101548:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310154b:	50                   	push   eax
 310154c:	e8 ef 04 00 00       	call   3101a40 <kShell+0x46a>
 3101551:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:321
}
 3101554:	90                   	nop
 3101555:	c9                   	leave  
 3101556:	c3                   	ret    

03101557 <prompt>:
prompt():
/home/yogi/src/os/aproj/kshell/src/kshell.c:324

void prompt()
{
 3101557:	55                   	push   ebp
 3101558:	89 e5                	mov    ebp,esp
 310155a:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:325
    print("%s %s> ",sExecutingProgram, cwd);
 310155d:	83 ec 04             	sub    esp,0x4
 3101560:	68 e0 2e 10 03       	push   0x3102ee0
 3101565:	68 00 30 10 03       	push   0x3103000
 310156a:	68 c5 20 10 03       	push   0x31020c5
 310156f:	e8 ec 04 00 00       	call   3101a60 <kShell+0x48a>
 3101574:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:326
}
 3101577:	90                   	nop
 3101578:	c9                   	leave  
 3101579:	c3                   	ret    

0310157a <reprintCommand>:
reprintCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:329

int reprintCommand(char* command)
{
 310157a:	55                   	push   ebp
 310157b:	89 e5                	mov    ebp,esp
 310157d:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/src/kshell.c:330
    resetRow();
 3101580:	e8 fb 04 00 00       	call   3101a80 <kShell+0x4aa>
/home/yogi/src/os/aproj/kshell/src/kshell.c:331
    prompt();
 3101585:	e8 cd ff ff ff       	call   3101557 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:332
    print("%s",command);
 310158a:	83 ec 08             	sub    esp,0x8
 310158d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3101590:	68 cd 20 10 03       	push   0x31020cd
 3101595:	e8 c6 04 00 00       	call   3101a60 <kShell+0x48a>
 310159a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:334
 
}
 310159d:	90                   	nop
 310159e:	c9                   	leave  
 310159f:	c3                   	ret    

031015a0 <handleSignals>:
handleSignals():
/home/yogi/src/os/aproj/kshell/src/kshell.c:337

int handleSignals(int signal)
{
 31015a0:	55                   	push   ebp
 31015a1:	89 e5                	mov    ebp,esp
/home/yogi/src/os/aproj/kshell/src/kshell.c:338
    switch (signal)
 31015a3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31015a6:	83 f8 08             	cmp    eax,0x8
 31015a9:	75 08                	jne    31015b3 <handleSignals+0x13>
/home/yogi/src/os/aproj/kshell/src/kshell.c:341
    {
        case SIGINT:
            bSigIntReceived = true;
 31015ab:	c6 05 c0 2e 10 03 01 	mov    BYTE PTR ds:0x3102ec0,0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:342
            break;
 31015b2:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:344
    }
}
 31015b3:	90                   	nop
 31015b4:	5d                   	pop    ebp
 31015b5:	c3                   	ret    

031015b6 <processSignal>:
processSignal():
/home/yogi/src/os/aproj/kshell/src/kshell.c:347

int processSignal(int signal)
{
 31015b6:	55                   	push   ebp
 31015b7:	89 e5                	mov    ebp,esp
/home/yogi/src/os/aproj/kshell/src/kshell.c:348
    switch (signal)
 31015b9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31015bc:	83 f8 08             	cmp    eax,0x8
 31015bf:	75 0e                	jne    31015cf <processSignal+0x19>
/home/yogi/src/os/aproj/kshell/src/kshell.c:352
    {
        case SIGINT:
            //printf("^C\n");
            bSigIntReceived = false;
 31015c1:	c6 05 c0 2e 10 03 00 	mov    BYTE PTR ds:0x3102ec0,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:353
            return SIGINT;
 31015c8:	b8 08 00 00 00       	mov    eax,0x8
 31015cd:	eb 05                	jmp    31015d4 <processSignal+0x1e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:356
            break;
    }
    return 0;
 31015cf:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:357
}
 31015d4:	5d                   	pop    ebp
 31015d5:	c3                   	ret    

031015d6 <kShell>:
kShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:360

int kShell(int argc, char** argv, char** envp)
{
 31015d6:	55                   	push   ebp
 31015d7:	89 e5                	mov    ebp,esp
 31015d9:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/src/kshell.c:361
    uint8_t lCurrKey=0;
 31015dc:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:362
    int lCurrKeyCount=0;
 31015e0:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:363
    int commandWasFromThisBufferPtr=0;
 31015e7:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:366
    char ansiSeq[20];

    execPipes[0]=0;
 31015ee:	c7 05 30 32 10 03 00 	mov    DWORD PTR ds:0x3103230,0x0
 31015f5:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/kshell.c:367
    execPipes[1]=0;
 31015f8:	c7 05 34 32 10 03 00 	mov    DWORD PTR ds:0x3103234,0x0
 31015ff:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/kshell.c:368
    kCmdline = malloc(CMDLINE_BUFFER_SIZE);  //Possibility of 25 chained commands
 3101602:	83 ec 0c             	sub    esp,0xc
 3101605:	68 00 c8 00 00       	push   0xc800
 310160a:	e8 a1 04 00 00       	call   3101ab0 <kShell+0x4da>
 310160f:	83 c4 10             	add    esp,0x10
 3101612:	a3 60 2d 11 03       	mov    ds:0x3112d60,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:369
    bSigIntReceived = false;
 3101617:	c6 05 c0 2e 10 03 00 	mov    BYTE PTR ds:0x3102ec0,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:370
    exitCode = 0;
 310161e:	c7 05 20 32 10 03 00 	mov    DWORD PTR ds:0x3103220,0x0
 3101625:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/kshell.c:371
    timeToExit = false;
 3101628:	c6 05 2c 32 10 03 00 	mov    BYTE PTR ds:0x310322c,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:372
    strcpy(delim," \t\n-,");
 310162f:	83 ec 08             	sub    esp,0x8
 3101632:	68 d0 20 10 03       	push   0x31020d0
 3101637:	68 c4 2e 10 03       	push   0x3102ec4
 310163c:	e8 ff 03 00 00       	call   3101a40 <kShell+0x46a>
 3101641:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:373
    environmentLoc = envp;
 3101644:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3101647:	a3 cc 2e 10 03       	mov    ds:0x3102ecc,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:374
    ansiSeq[0]=0x1b;
 310164c:	c6 45 d3 1b          	mov    BYTE PTR [ebp-0x2d],0x1b
/home/yogi/src/os/aproj/kshell/src/kshell.c:375
    sKShellProgramName=malloc(1024);
 3101650:	83 ec 0c             	sub    esp,0xc
 3101653:	68 00 04 00 00       	push   0x400
 3101658:	e8 53 04 00 00       	call   3101ab0 <kShell+0x4da>
 310165d:	83 c4 10             	add    esp,0x10
 3101660:	a3 24 32 10 03       	mov    ds:0x3103224,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:376
    strcpy(sKShellProgramName,"kShell");
 3101665:	a1 24 32 10 03       	mov    eax,ds:0x3103224
 310166a:	83 ec 08             	sub    esp,0x8
 310166d:	68 d6 20 10 03       	push   0x31020d6
 3101672:	50                   	push   eax
 3101673:	e8 c8 03 00 00       	call   3101a40 <kShell+0x46a>
 3101678:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:377
    strcpy(sExecutingProgram,sKShellProgramName);
 310167b:	a1 24 32 10 03       	mov    eax,ds:0x3103224
 3101680:	83 ec 08             	sub    esp,0x8
 3101683:	50                   	push   eax
 3101684:	68 00 30 10 03       	push   0x3103000
 3101689:	e8 b2 03 00 00       	call   3101a40 <kShell+0x46a>
 310168e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:380
    //puts("\nWelcome to kShell ... hang a while!\n");

    modifySignal(SIGINT, handleSignals, 0);
 3101691:	83 ec 04             	sub    esp,0x4
 3101694:	6a 00                	push   0x0
 3101696:	68 a0 15 10 03       	push   0x31015a0
 310169b:	6a 08                	push   0x8
 310169d:	e8 4e 05 00 00       	call   3101bf0 <kShell+0x61a>
 31016a2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:382
    
    while (!timeToExit)
 31016a5:	e9 3e 03 00 00       	jmp    31019e8 <kShell+0x412>
/home/yogi/src/os/aproj/kshell/src/kshell.c:385
    {
getACommand:
        commandHistoryPtr = commandHistoryMax;
 31016aa:	a1 3c 32 10 03       	mov    eax,ds:0x310323c
 31016af:	a3 38 32 10 03       	mov    ds:0x3103238,eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:386
        commandWasFromThisBufferPtr = -1;
 31016b4:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:387
        lCurrKey=0;
 31016bb:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:388
        lCurrKeyCount=0;
 31016bf:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:389
        memset(lCommand,0,256);
 31016c6:	83 ec 04             	sub    esp,0x4
 31016c9:	68 00 01 00 00       	push   0x100
 31016ce:	6a 00                	push   0x0
 31016d0:	68 60 2c 11 03       	push   0x3112c60
 31016d5:	e8 e6 04 00 00       	call   3101bc0 <kShell+0x5ea>
 31016da:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:390
        getenv("CWD",cwd);
 31016dd:	83 ec 08             	sub    esp,0x8
 31016e0:	68 e0 2e 10 03       	push   0x3102ee0
 31016e5:	68 dd 20 10 03       	push   0x31020dd
 31016ea:	e8 a1 03 00 00       	call   3101a90 <kShell+0x4ba>
 31016ef:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:391
        prompt();
 31016f2:	e8 60 fe ff ff       	call   3101557 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:393
getAKey:
        lCurrKey=0;
 31016f7:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:394
        while(lCurrKey==0)
 31016fb:	eb 64                	jmp    3101761 <kShell+0x18b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:397
        {
            //Reading from STDIN blocks until a key is available.  It will only return 0 when STDIN is redirected to a file
            int retVal=read(STDIN_FILE, &lCurrKey, 1, 1);
 31016fd:	6a 01                	push   0x1
 31016ff:	6a 01                	push   0x1
 3101701:	8d 45 e7             	lea    eax,[ebp-0x19]
 3101704:	50                   	push   eax
 3101705:	6a 00                	push   0x0
 3101707:	e8 44 04 00 00       	call   3101b50 <kShell+0x57a>
 310170c:	83 c4 10             	add    esp,0x10
 310170f:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:398
            if (retVal==0)
 3101712:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3101716:	75 09                	jne    3101721 <kShell+0x14b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:400
            {
                timeToExit=true;
 3101718:	c6 05 2c 32 10 03 01 	mov    BYTE PTR ds:0x310322c,0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:401
                break;
 310171f:	eb 48                	jmp    3101769 <kShell+0x193>
/home/yogi/src/os/aproj/kshell/src/kshell.c:404
            }
//            gets(&lCurrKey,1,1);
            if (bSigIntReceived)
 3101721:	0f b6 05 c0 2e 10 03 	movzx  eax,BYTE PTR ds:0x3102ec0
 3101728:	84 c0                	test   al,al
 310172a:	74 35                	je     3101761 <kShell+0x18b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:406
            {
                if (processSignal(SIGINT)==SIGINT)
 310172c:	83 ec 0c             	sub    esp,0xc
 310172f:	6a 08                	push   0x8
 3101731:	e8 80 fe ff ff       	call   31015b6 <processSignal>
 3101736:	83 c4 10             	add    esp,0x10
 3101739:	83 f8 08             	cmp    eax,0x8
 310173c:	75 23                	jne    3101761 <kShell+0x18b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:408
                {
                    lCommand[0] = 0x0;
 310173e:	c6 05 60 2c 11 03 00 	mov    BYTE PTR ds:0x3112c60,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:409
                    lCurrKeyCount = 0;
 3101745:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:410
                    printf("\n");
 310174c:	83 ec 0c             	sub    esp,0xc
 310174f:	68 e1 20 10 03       	push   0x31020e1
 3101754:	e8 17 03 00 00       	call   3101a70 <kShell+0x49a>
 3101759:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:411
                    prompt();
 310175c:	e8 f6 fd ff ff       	call   3101557 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:394
        memset(lCommand,0,256);
        getenv("CWD",cwd);
        prompt();
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 3101761:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3101765:	84 c0                	test   al,al
 3101767:	74 94                	je     31016fd <kShell+0x127>
/home/yogi/src/os/aproj/kshell/src/kshell.c:416
                    prompt();
                }
            }
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 3101769:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 310176d:	3c c8                	cmp    al,0xc8
 310176f:	0f 85 99 00 00 00    	jne    310180e <kShell+0x238>
/home/yogi/src/os/aproj/kshell/src/kshell.c:418
        {
            if (commandHistoryPtr>=0)
 3101775:	a1 38 32 10 03       	mov    eax,ds:0x3103238
 310177a:	85 c0                	test   eax,eax
 310177c:	0f 88 75 ff ff ff    	js     31016f7 <kShell+0x121>
/home/yogi/src/os/aproj/kshell/src/kshell.c:421
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
 3101782:	a1 38 32 10 03       	mov    eax,ds:0x3103238
 3101787:	83 e8 01             	sub    eax,0x1
 310178a:	85 c0                	test   eax,eax
 310178c:	0f 88 65 ff ff ff    	js     31016f7 <kShell+0x121>
/home/yogi/src/os/aproj/kshell/src/kshell.c:423
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
 3101792:	a1 38 32 10 03       	mov    eax,ds:0x3103238
 3101797:	83 e8 01             	sub    eax,0x1
 310179a:	a3 38 32 10 03       	mov    ds:0x3103238,eax
 310179f:	a1 38 32 10 03       	mov    eax,ds:0x3103238
 31017a4:	c1 e0 07             	shl    eax,0x7
 31017a7:	05 40 32 10 03       	add    eax,0x3103240
 31017ac:	83 ec 08             	sub    esp,0x8
 31017af:	50                   	push   eax
 31017b0:	68 60 2c 11 03       	push   0x3112c60
 31017b5:	e8 86 02 00 00       	call   3101a40 <kShell+0x46a>
 31017ba:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:424
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 31017bd:	a1 38 32 10 03       	mov    eax,ds:0x3103238
 31017c2:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:425
                    while (lCurrKeyCount>0)
 31017c5:	eb 14                	jmp    31017db <kShell+0x205>
/home/yogi/src/os/aproj/kshell/src/kshell.c:427
                    {
                        printf(KEY_BACKSPACE);
 31017c7:	83 ec 0c             	sub    esp,0xc
 31017ca:	68 e3 20 10 03       	push   0x31020e3
 31017cf:	e8 9c 02 00 00       	call   3101a70 <kShell+0x49a>
 31017d4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:428
                        lCurrKeyCount--;
 31017d7:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:425
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
 31017db:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31017df:	7f e6                	jg     31017c7 <kShell+0x1f1>
/home/yogi/src/os/aproj/kshell/src/kshell.c:430
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
 31017e1:	83 ec 08             	sub    esp,0x8
 31017e4:	68 60 2c 11 03       	push   0x3112c60
 31017e9:	68 cd 20 10 03       	push   0x31020cd
 31017ee:	e8 7d 02 00 00       	call   3101a70 <kShell+0x49a>
 31017f3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:431
                    lCurrKeyCount=strlen(lCommand);
 31017f6:	83 ec 0c             	sub    esp,0xc
 31017f9:	68 60 2c 11 03       	push   0x3112c60
 31017fe:	e8 4d 04 00 00       	call   3101c50 <kShell+0x67a>
 3101803:	83 c4 10             	add    esp,0x10
 3101806:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:433
                }
                goto getAKey;
 3101809:	e9 e9 fe ff ff       	jmp    31016f7 <kShell+0x121>
/home/yogi/src/os/aproj/kshell/src/kshell.c:438
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
 310180e:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3101812:	3c d0                	cmp    al,0xd0
 3101814:	0f 85 9e 00 00 00    	jne    31018b8 <kShell+0x2e2>
/home/yogi/src/os/aproj/kshell/src/kshell.c:440
        {
            if (commandHistoryPtr>=0)
 310181a:	a1 38 32 10 03       	mov    eax,ds:0x3103238
 310181f:	85 c0                	test   eax,eax
 3101821:	0f 88 d0 fe ff ff    	js     31016f7 <kShell+0x121>
/home/yogi/src/os/aproj/kshell/src/kshell.c:443
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
 3101827:	a1 38 32 10 03       	mov    eax,ds:0x3103238
 310182c:	8d 50 01             	lea    edx,[eax+0x1]
 310182f:	a1 3c 32 10 03       	mov    eax,ds:0x310323c
 3101834:	39 c2                	cmp    edx,eax
 3101836:	0f 8d bb fe ff ff    	jge    31016f7 <kShell+0x121>
/home/yogi/src/os/aproj/kshell/src/kshell.c:445
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
 310183c:	a1 38 32 10 03       	mov    eax,ds:0x3103238
 3101841:	83 c0 01             	add    eax,0x1
 3101844:	a3 38 32 10 03       	mov    ds:0x3103238,eax
 3101849:	a1 38 32 10 03       	mov    eax,ds:0x3103238
 310184e:	c1 e0 07             	shl    eax,0x7
 3101851:	05 40 32 10 03       	add    eax,0x3103240
 3101856:	83 ec 08             	sub    esp,0x8
 3101859:	50                   	push   eax
 310185a:	68 60 2c 11 03       	push   0x3112c60
 310185f:	e8 dc 01 00 00       	call   3101a40 <kShell+0x46a>
 3101864:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:446
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 3101867:	a1 38 32 10 03       	mov    eax,ds:0x3103238
 310186c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:447
                    while (lCurrKeyCount>0)
 310186f:	eb 14                	jmp    3101885 <kShell+0x2af>
/home/yogi/src/os/aproj/kshell/src/kshell.c:449
                    {
                        printf(KEY_BACKSPACE);
 3101871:	83 ec 0c             	sub    esp,0xc
 3101874:	68 e3 20 10 03       	push   0x31020e3
 3101879:	e8 f2 01 00 00       	call   3101a70 <kShell+0x49a>
 310187e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:450
                        lCurrKeyCount--;
 3101881:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:447
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
 3101885:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3101889:	7f e6                	jg     3101871 <kShell+0x29b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:452
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
 310188b:	83 ec 08             	sub    esp,0x8
 310188e:	68 60 2c 11 03       	push   0x3112c60
 3101893:	68 cd 20 10 03       	push   0x31020cd
 3101898:	e8 d3 01 00 00       	call   3101a70 <kShell+0x49a>
 310189d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:453
                    lCurrKeyCount=strlen(lCommand);
 31018a0:	83 ec 0c             	sub    esp,0xc
 31018a3:	68 60 2c 11 03       	push   0x3112c60
 31018a8:	e8 a3 03 00 00       	call   3101c50 <kShell+0x67a>
 31018ad:	83 c4 10             	add    esp,0x10
 31018b0:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:455
                }
                goto getAKey;
 31018b3:	e9 3f fe ff ff       	jmp    31016f7 <kShell+0x121>
/home/yogi/src/os/aproj/kshell/src/kshell.c:460
            }
            else
                goto getAKey;
        }   
        else if (lCurrKey==0xcb) //left
 31018b8:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 31018bc:	3c cb                	cmp    al,0xcb
 31018be:	75 1f                	jne    31018df <kShell+0x309>
/home/yogi/src/os/aproj/kshell/src/kshell.c:462
        {
            if (lCurrKeyCount>0)
 31018c0:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31018c4:	0f 8e 2d fe ff ff    	jle    31016f7 <kShell+0x121>
/home/yogi/src/os/aproj/kshell/src/kshell.c:464
            {
                print("\033[1D");
 31018ca:	83 ec 0c             	sub    esp,0xc
 31018cd:	68 ed 20 10 03       	push   0x31020ed
 31018d2:	e8 89 01 00 00       	call   3101a60 <kShell+0x48a>
 31018d7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:467
            }
             
            goto getAKey;
 31018da:	e9 18 fe ff ff       	jmp    31016f7 <kShell+0x121>
/home/yogi/src/os/aproj/kshell/src/kshell.c:469
        }
        else if (lCurrKey==0xcd) //right
 31018df:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 31018e3:	3c cd                	cmp    al,0xcd
 31018e5:	75 15                	jne    31018fc <kShell+0x326>
/home/yogi/src/os/aproj/kshell/src/kshell.c:471
        {
            print("\033[1C");
 31018e7:	83 ec 0c             	sub    esp,0xc
 31018ea:	68 f2 20 10 03       	push   0x31020f2
 31018ef:	e8 6c 01 00 00       	call   3101a60 <kShell+0x48a>
 31018f4:	83 c4 10             	add    esp,0x10
 31018f7:	e9 fb fd ff ff       	jmp    31016f7 <kShell+0x121>
/home/yogi/src/os/aproj/kshell/src/kshell.c:473
        }
        else if (lCurrKey=='\b') //backspace
 31018fc:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3101900:	3c 08                	cmp    al,0x8
 3101902:	75 32                	jne    3101936 <kShell+0x360>
/home/yogi/src/os/aproj/kshell/src/kshell.c:475
        {
            if (lCurrKeyCount-1 >= 0)
 3101904:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101907:	83 e8 01             	sub    eax,0x1
 310190a:	85 c0                	test   eax,eax
 310190c:	0f 88 e5 fd ff ff    	js     31016f7 <kShell+0x121>
/home/yogi/src/os/aproj/kshell/src/kshell.c:477
            {
                lCurrKeyCount--;
 3101912:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:478
                lCommand[lCurrKeyCount]='\0';
 3101916:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101919:	05 60 2c 11 03       	add    eax,0x3112c60
 310191e:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:479
                printf(KEY_BACKSPACE);
 3101921:	83 ec 0c             	sub    esp,0xc
 3101924:	68 e3 20 10 03       	push   0x31020e3
 3101929:	e8 42 01 00 00       	call   3101a70 <kShell+0x49a>
 310192e:	83 c4 10             	add    esp,0x10
 3101931:	e9 c1 fd ff ff       	jmp    31016f7 <kShell+0x121>
/home/yogi/src/os/aproj/kshell/src/kshell.c:482
            }
        }
        else if (lCurrKey==0xa) //Enter
 3101936:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 310193a:	3c 0a                	cmp    al,0xa
 310193c:	75 12                	jne    3101950 <kShell+0x37a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:484
        {
            print("\n");
 310193e:	83 ec 0c             	sub    esp,0xc
 3101941:	68 e1 20 10 03       	push   0x31020e1
 3101946:	e8 15 01 00 00       	call   3101a60 <kShell+0x48a>
 310194b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:485
            goto doneGettingKeys;
 310194e:	eb 48                	jmp    3101998 <kShell+0x3c2>
/home/yogi/src/os/aproj/kshell/src/kshell.c:487
        }
        else if (lCurrKey==0x0)
 3101950:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3101954:	84 c0                	test   al,al
 3101956:	75 09                	jne    3101961 <kShell+0x38b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:489
        {
            lCommand[0]=0x0;
 3101958:	c6 05 60 2c 11 03 00 	mov    BYTE PTR ds:0x3112c60,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:490
            goto doneGettingKeys;
 310195f:	eb 37                	jmp    3101998 <kShell+0x3c2>
/home/yogi/src/os/aproj/kshell/src/kshell.c:494
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3101961:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101964:	8d 50 01             	lea    edx,[eax+0x1]
 3101967:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310196a:	0f b6 55 e7          	movzx  edx,BYTE PTR [ebp-0x19]
 310196e:	88 90 60 2c 11 03    	mov    BYTE PTR [eax+0x3112c60],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:496
            //reprintCommand(lCommand);
            printf("%c",lCurrKey);
 3101974:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3101978:	0f b6 c0             	movzx  eax,al
 310197b:	83 ec 08             	sub    esp,0x8
 310197e:	50                   	push   eax
 310197f:	68 f7 20 10 03       	push   0x31020f7
 3101984:	e8 e7 00 00 00       	call   3101a70 <kShell+0x49a>
 3101989:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:498
            //Reset pointer to command buffer so that this possibly modified command gets written as a new one
            commandWasFromThisBufferPtr=-1;
 310198c:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:500
        }
        goto getAKey;
 3101993:	e9 5f fd ff ff       	jmp    31016f7 <kShell+0x121>
/home/yogi/src/os/aproj/kshell/src/kshell.c:503
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]!=0x0)
 3101998:	0f b6 05 60 2c 11 03 	movzx  eax,BYTE PTR ds:0x3112c60
 310199f:	84 c0                	test   al,al
 31019a1:	74 45                	je     31019e8 <kShell+0x412>
/home/yogi/src/os/aproj/kshell/src/kshell.c:505
        {
            if (commandWasFromThisBufferPtr == -1)
 31019a3:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
 31019a7:	75 10                	jne    31019b9 <kShell+0x3e3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:506
                saveCommand(lCommand);
 31019a9:	83 ec 0c             	sub    esp,0xc
 31019ac:	68 60 2c 11 03       	push   0x3112c60
 31019b1:	e8 73 fb ff ff       	call   3101529 <saveCommand>
 31019b6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:507
            int i = findCommand(lCommand);
 31019b9:	83 ec 0c             	sub    esp,0xc
 31019bc:	68 60 2c 11 03       	push   0x3112c60
 31019c1:	e8 b9 f7 ff ff       	call   310117f <findCommand>
 31019c6:	83 c4 10             	add    esp,0x10
 31019c9:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:508
            execCmds(parseCmds(lCommand));
 31019cc:	83 ec 0c             	sub    esp,0xc
 31019cf:	68 60 2c 11 03       	push   0x3112c60
 31019d4:	e8 1c f4 ff ff       	call   3100df5 <parseCmds>
 31019d9:	83 c4 10             	add    esp,0x10
 31019dc:	83 ec 0c             	sub    esp,0xc
 31019df:	50                   	push   eax
 31019e0:	e8 e1 f3 ff ff       	call   3100dc6 <execCmds>
 31019e5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:382
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    modifySignal(SIGINT, handleSignals, 0);
    
    while (!timeToExit)
 31019e8:	0f b6 05 2c 32 10 03 	movzx  eax,BYTE PTR ds:0x310322c
 31019ef:	83 f0 01             	xor    eax,0x1
 31019f2:	84 c0                	test   al,al
 31019f4:	0f 85 b0 fc ff ff    	jne    31016aa <kShell+0xd4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:511
                saveCommand(lCommand);
            int i = findCommand(lCommand);
            execCmds(parseCmds(lCommand));
        }
    }
    free(sKShellProgramName);
 31019fa:	a1 24 32 10 03       	mov    eax,ds:0x3103224
 31019ff:	83 ec 0c             	sub    esp,0xc
 3101a02:	50                   	push   eax
 3101a03:	e8 78 02 00 00       	call   3101c80 <kShell+0x6aa>
 3101a08:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:512
    if (kCmdline)
 3101a0b:	a1 60 2d 11 03       	mov    eax,ds:0x3112d60
 3101a10:	85 c0                	test   eax,eax
 3101a12:	74 11                	je     3101a25 <kShell+0x44f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:513
        free(kCmdline);
 3101a14:	a1 60 2d 11 03       	mov    eax,ds:0x3112d60
 3101a19:	83 ec 0c             	sub    esp,0xc
 3101a1c:	50                   	push   eax
 3101a1d:	e8 5e 02 00 00       	call   3101c80 <kShell+0x6aa>
 3101a22:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:514
    return exitCode;
 3101a25:	a1 20 32 10 03       	mov    eax,ds:0x3103220
/home/yogi/src/os/aproj/kshell/src/kshell.c:515
}
 3101a2a:	c9                   	leave  
 3101a2b:	c3                   	ret    

Disassembly of section .plt:

03101a30 <.plt>:
 3101a30:	ff 35 24 2e 10 03    	push   DWORD PTR ds:0x3102e24
 3101a36:	ff 25 28 2e 10 03    	jmp    DWORD PTR ds:0x3102e28
 3101a3c:	00 00                	add    BYTE PTR [eax],al
 3101a3e:	00 00                	add    BYTE PTR [eax],al
 3101a40:	ff 25 2c 2e 10 03    	jmp    DWORD PTR ds:0x3102e2c
 3101a46:	68 00 00 00 00       	push   0x0
 3101a4b:	e9 e0 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101a50:	ff 25 30 2e 10 03    	jmp    DWORD PTR ds:0x3102e30
 3101a56:	68 08 00 00 00       	push   0x8
 3101a5b:	e9 d0 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101a60:	ff 25 34 2e 10 03    	jmp    DWORD PTR ds:0x3102e34
 3101a66:	68 10 00 00 00       	push   0x10
 3101a6b:	e9 c0 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101a70:	ff 25 38 2e 10 03    	jmp    DWORD PTR ds:0x3102e38
 3101a76:	68 18 00 00 00       	push   0x18
 3101a7b:	e9 b0 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101a80:	ff 25 3c 2e 10 03    	jmp    DWORD PTR ds:0x3102e3c
 3101a86:	68 20 00 00 00       	push   0x20
 3101a8b:	e9 a0 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101a90:	ff 25 40 2e 10 03    	jmp    DWORD PTR ds:0x3102e40
 3101a96:	68 28 00 00 00       	push   0x28
 3101a9b:	e9 90 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101aa0:	ff 25 44 2e 10 03    	jmp    DWORD PTR ds:0x3102e44
 3101aa6:	68 30 00 00 00       	push   0x30
 3101aab:	e9 80 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101ab0:	ff 25 48 2e 10 03    	jmp    DWORD PTR ds:0x3102e48
 3101ab6:	68 38 00 00 00       	push   0x38
 3101abb:	e9 70 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101ac0:	ff 25 4c 2e 10 03    	jmp    DWORD PTR ds:0x3102e4c
 3101ac6:	68 40 00 00 00       	push   0x40
 3101acb:	e9 60 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101ad0:	ff 25 50 2e 10 03    	jmp    DWORD PTR ds:0x3102e50
 3101ad6:	68 48 00 00 00       	push   0x48
 3101adb:	e9 50 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101ae0:	ff 25 54 2e 10 03    	jmp    DWORD PTR ds:0x3102e54
 3101ae6:	68 50 00 00 00       	push   0x50
 3101aeb:	e9 40 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101af0:	ff 25 58 2e 10 03    	jmp    DWORD PTR ds:0x3102e58
 3101af6:	68 58 00 00 00       	push   0x58
 3101afb:	e9 30 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101b00:	ff 25 5c 2e 10 03    	jmp    DWORD PTR ds:0x3102e5c
 3101b06:	68 60 00 00 00       	push   0x60
 3101b0b:	e9 20 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101b10:	ff 25 60 2e 10 03    	jmp    DWORD PTR ds:0x3102e60
 3101b16:	68 68 00 00 00       	push   0x68
 3101b1b:	e9 10 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101b20:	ff 25 64 2e 10 03    	jmp    DWORD PTR ds:0x3102e64
 3101b26:	68 70 00 00 00       	push   0x70
 3101b2b:	e9 00 ff ff ff       	jmp    3101a30 <kShell+0x45a>
 3101b30:	ff 25 68 2e 10 03    	jmp    DWORD PTR ds:0x3102e68
 3101b36:	68 78 00 00 00       	push   0x78
 3101b3b:	e9 f0 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101b40:	ff 25 6c 2e 10 03    	jmp    DWORD PTR ds:0x3102e6c
 3101b46:	68 80 00 00 00       	push   0x80
 3101b4b:	e9 e0 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101b50:	ff 25 70 2e 10 03    	jmp    DWORD PTR ds:0x3102e70
 3101b56:	68 88 00 00 00       	push   0x88
 3101b5b:	e9 d0 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101b60:	ff 25 74 2e 10 03    	jmp    DWORD PTR ds:0x3102e74
 3101b66:	68 90 00 00 00       	push   0x90
 3101b6b:	e9 c0 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101b70:	ff 25 78 2e 10 03    	jmp    DWORD PTR ds:0x3102e78
 3101b76:	68 98 00 00 00       	push   0x98
 3101b7b:	e9 b0 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101b80:	ff 25 7c 2e 10 03    	jmp    DWORD PTR ds:0x3102e7c
 3101b86:	68 a0 00 00 00       	push   0xa0
 3101b8b:	e9 a0 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101b90:	ff 25 80 2e 10 03    	jmp    DWORD PTR ds:0x3102e80
 3101b96:	68 a8 00 00 00       	push   0xa8
 3101b9b:	e9 90 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101ba0:	ff 25 84 2e 10 03    	jmp    DWORD PTR ds:0x3102e84
 3101ba6:	68 b0 00 00 00       	push   0xb0
 3101bab:	e9 80 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101bb0:	ff 25 88 2e 10 03    	jmp    DWORD PTR ds:0x3102e88
 3101bb6:	68 b8 00 00 00       	push   0xb8
 3101bbb:	e9 70 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101bc0:	ff 25 8c 2e 10 03    	jmp    DWORD PTR ds:0x3102e8c
 3101bc6:	68 c0 00 00 00       	push   0xc0
 3101bcb:	e9 60 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101bd0:	ff 25 90 2e 10 03    	jmp    DWORD PTR ds:0x3102e90
 3101bd6:	68 c8 00 00 00       	push   0xc8
 3101bdb:	e9 50 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101be0:	ff 25 94 2e 10 03    	jmp    DWORD PTR ds:0x3102e94
 3101be6:	68 d0 00 00 00       	push   0xd0
 3101beb:	e9 40 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101bf0:	ff 25 98 2e 10 03    	jmp    DWORD PTR ds:0x3102e98
 3101bf6:	68 d8 00 00 00       	push   0xd8
 3101bfb:	e9 30 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101c00:	ff 25 9c 2e 10 03    	jmp    DWORD PTR ds:0x3102e9c
 3101c06:	68 e0 00 00 00       	push   0xe0
 3101c0b:	e9 20 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101c10:	ff 25 a0 2e 10 03    	jmp    DWORD PTR ds:0x3102ea0
 3101c16:	68 e8 00 00 00       	push   0xe8
 3101c1b:	e9 10 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101c20:	ff 25 a4 2e 10 03    	jmp    DWORD PTR ds:0x3102ea4
 3101c26:	68 f0 00 00 00       	push   0xf0
 3101c2b:	e9 00 fe ff ff       	jmp    3101a30 <kShell+0x45a>
 3101c30:	ff 25 a8 2e 10 03    	jmp    DWORD PTR ds:0x3102ea8
 3101c36:	68 f8 00 00 00       	push   0xf8
 3101c3b:	e9 f0 fd ff ff       	jmp    3101a30 <kShell+0x45a>
 3101c40:	ff 25 ac 2e 10 03    	jmp    DWORD PTR ds:0x3102eac
 3101c46:	68 00 01 00 00       	push   0x100
 3101c4b:	e9 e0 fd ff ff       	jmp    3101a30 <kShell+0x45a>
 3101c50:	ff 25 b0 2e 10 03    	jmp    DWORD PTR ds:0x3102eb0
 3101c56:	68 08 01 00 00       	push   0x108
 3101c5b:	e9 d0 fd ff ff       	jmp    3101a30 <kShell+0x45a>
 3101c60:	ff 25 b4 2e 10 03    	jmp    DWORD PTR ds:0x3102eb4
 3101c66:	68 10 01 00 00       	push   0x110
 3101c6b:	e9 c0 fd ff ff       	jmp    3101a30 <kShell+0x45a>
 3101c70:	ff 25 b8 2e 10 03    	jmp    DWORD PTR ds:0x3102eb8
 3101c76:	68 18 01 00 00       	push   0x118
 3101c7b:	e9 b0 fd ff ff       	jmp    3101a30 <kShell+0x45a>
 3101c80:	ff 25 bc 2e 10 03    	jmp    DWORD PTR ds:0x3102ebc
 3101c86:	68 20 01 00 00       	push   0x120
 3101c8b:	e9 a0 fd ff ff       	jmp    3101a30 <kShell+0x45a>

Disassembly of section .rodata:

03101c90 <.rodata>:
 3101c90:	63 64 00 43          	arpl   WORD PTR [eax+eax*1+0x43],sp
 3101c94:	68 61 6e 67 65       	push   0x65676e61
 3101c99:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 3101c9d:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3101ca2:	79 00                	jns    3101ca4 <kShell+0x6ce>
 3101ca4:	63 6c 65 61          	arpl   WORD PTR [ebp+eiz*2+0x61],bp
 3101ca8:	72 00                	jb     3101caa <kShell+0x6d4>
 3101caa:	43                   	inc    ebx
 3101cab:	6c                   	ins    BYTE PTR es:[edi],dx
 3101cac:	65                   	gs
 3101cad:	61                   	popa   
 3101cae:	72 20                	jb     3101cd0 <kShell+0x6fa>
 3101cb0:	74 68                	je     3101d1a <kShell+0x744>
 3101cb2:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 3101cb6:	72 65                	jb     3101d1d <kShell+0x747>
 3101cb8:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101cba:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 3101cbd:	76 00                	jbe    3101cbf <kShell+0x6e9>
 3101cbf:	50                   	push   eax
 3101cc0:	72 69                	jb     3101d2b <kShell+0x755>
 3101cc2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101cc3:	74 20                	je     3101ce5 <kShell+0x70f>
 3101cc5:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101cc7:	76 69                	jbe    3101d32 <kShell+0x75c>
 3101cc9:	72 6f                	jb     3101d3a <kShell+0x764>
 3101ccb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101ccc:	6d                   	ins    DWORD PTR es:[edi],dx
 3101ccd:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101ccf:	74 00                	je     3101cd1 <kShell+0x6fb>
 3101cd1:	65                   	gs
 3101cd2:	78 65                	js     3101d39 <kShell+0x763>
 3101cd4:	63 00                	arpl   WORD PTR [eax],ax
 3101cd6:	45                   	inc    ebp
 3101cd7:	78 65                	js     3101d3e <kShell+0x768>
 3101cd9:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101cdc:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3101ce0:	70 72                	jo     3101d54 <kShell+0x77e>
 3101ce2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101ce3:	67 72 61             	addr16 jb 3101d47 <kShell+0x771>
 3101ce6:	6d                   	ins    DWORD PTR es:[edi],dx
 3101ce7:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101cea:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 3101cf1:	20 
 3101cf2:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3101cf6:	6c                   	ins    BYTE PTR es:[edi],dx
 3101cf7:	6c                   	ins    BYTE PTR es:[edi],dx
 3101cf8:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3101cfb:	6c                   	ins    BYTE PTR es:[edi],dx
 3101cfc:	70 00                	jo     3101cfe <kShell+0x728>
 3101cfe:	47                   	inc    edi
 3101cff:	65                   	gs
 3101d00:	74 20                	je     3101d22 <kShell+0x74c>
 3101d02:	68 65 6c 70 20       	push   0x20706c65
 3101d07:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3101d0b:	73 20                	jae    3101d2d <kShell+0x757>
 3101d0d:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3101d14:	74 69                	je     3101d7f <kShell+0x7a9>
 3101d16:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101d17:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101d18:	29 00                	sub    DWORD PTR [eax],eax
 3101d1a:	70 77                	jo     3101d93 <kShell+0x7bd>
 3101d1c:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 3101d20:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3101d27:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3101d2b:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 3101d2f:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3101d34:	79 00                	jns    3101d36 <kShell+0x760>
 3101d36:	72 65                	jb     3101d9d <kShell+0x7c7>
 3101d38:	70 65                	jo     3101d9f <kShell+0x7c9>
 3101d3a:	61                   	popa   
 3101d3b:	74 00                	je     3101d3d <kShell+0x767>
 3101d3d:	52                   	push   edx
 3101d3e:	65                   	gs
 3101d3f:	70 65                	jo     3101da6 <kShell+0x7d0>
 3101d41:	61                   	popa   
 3101d42:	74 20                	je     3101d64 <kShell+0x78e>
 3101d44:	61                   	popa   
 3101d45:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 3101d48:	6d                   	ins    DWORD PTR es:[edi],dx
 3101d49:	6d                   	ins    DWORD PTR es:[edi],dx
 3101d4a:	61                   	popa   
 3101d4b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101d4c:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 3101d50:	74 69                	je     3101dbb <kShell+0x7e5>
 3101d52:	6d                   	ins    DWORD PTR es:[edi],dx
 3101d53:	65                   	gs
 3101d54:	73 00                	jae    3101d56 <kShell+0x780>
 3101d56:	73 65                	jae    3101dbd <kShell+0x7e7>
 3101d58:	74 00                	je     3101d5a <kShell+0x784>
 3101d5a:	53                   	push   ebx
 3101d5b:	65                   	gs
 3101d5c:	74 20                	je     3101d7e <kShell+0x7a8>
 3101d5e:	61                   	popa   
 3101d5f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101d60:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 3101d63:	76 69                	jbe    3101dce <kShell+0x7f8>
 3101d65:	72 6f                	jb     3101dd6 <kShell+0x800>
 3101d67:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101d68:	6d                   	ins    DWORD PTR es:[edi],dx
 3101d69:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101d6b:	74 20                	je     3101d8d <kShell+0x7b7>
 3101d6d:	76 61                	jbe    3101dd0 <kShell+0x7fa>
 3101d6f:	72 69                	jb     3101dda <kShell+0x804>
 3101d71:	61                   	popa   
 3101d72:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 3101d76:	73 6c                	jae    3101de4 <kShell+0x80e>
 3101d78:	65                   	gs
 3101d79:	65                   	gs
 3101d7a:	70 00                	jo     3101d7c <kShell+0x7a6>
 3101d7c:	53                   	push   ebx
 3101d7d:	6c                   	ins    BYTE PTR es:[edi],dx
 3101d7e:	65                   	gs
 3101d7f:	65                   	gs
 3101d80:	70 20                	jo     3101da2 <kShell+0x7cc>
 3101d82:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3101d84:	72 20                	jb     3101da6 <kShell+0x7d0>
 3101d86:	78 20                	js     3101da8 <kShell+0x7d2>
 3101d88:	73 65                	jae    3101def <kShell+0x819>
 3101d8a:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101d8d:	64                   	fs
 3101d8e:	73 00                	jae    3101d90 <kShell+0x7ba>
 3101d90:	74 69                	je     3101dfb <kShell+0x825>
 3101d92:	6d                   	ins    DWORD PTR es:[edi],dx
 3101d93:	65 00 00             	add    BYTE PTR gs:[eax],al
 3101d96:	00 00                	add    BYTE PTR [eax],al
 3101d98:	54                   	push   esp
 3101d99:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 3101da0:	72 6f                	jb     3101e11 <kShell+0x83b>
 3101da2:	67 72 61             	addr16 jb 3101e06 <kShell+0x830>
 3101da5:	6d                   	ins    DWORD PTR es:[edi],dx
 3101da6:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 3101da9:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 3101db0:	72 
 3101db1:	75 6e                	jne    3101e21 <kShell+0x84b>
 3101db3:	73 2e                	jae    3101de3 <kShell+0x80d>
 3101db5:	0a 09                	or     cl,BYTE PTR [ecx]
 3101db7:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 3101dba:	61                   	popa   
 3101dbb:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 3101dbf:	74 69                	je     3101e2a <kShell+0x854>
 3101dc1:	6d                   	ins    DWORD PTR es:[edi],dx
 3101dc2:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 3101dc6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101dc7:	67 72 61             	addr16 jb 3101e2b <kShell+0x855>
 3101dca:	6d                   	ins    DWORD PTR es:[edi],dx
 3101dcb:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 3101dce:	61                   	popa   
 3101dcf:	72 61                	jb     3101e32 <kShell+0x85c>
 3101dd1:	6d                   	ins    DWORD PTR es:[edi],dx
 3101dd2:	65                   	gs
 3101dd3:	74 65                	je     3101e3a <kShell+0x864>
 3101dd5:	72 73                	jb     3101e4a <kShell+0x874>
 3101dd7:	5d                   	pop    ebp
 3101dd8:	00 1b                	add    BYTE PTR [ebx],bl
 3101dda:	5b                   	pop    ebx
 3101ddb:	32 4a 00             	xor    cl,BYTE PTR [edx+0x0]
 3101dde:	25 73 0a 00 3d       	and    eax,0x3d000a73
 3101de3:	00 55 73             	add    BYTE PTR [ebp+0x73],dl
 3101de6:	61                   	popa   
 3101de7:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 3101deb:	73 65                	jae    3101e52 <kShell+0x87c>
 3101ded:	74 20                	je     3101e0f <kShell+0x839>
 3101def:	76 61                	jbe    3101e52 <kShell+0x87c>
 3101df1:	72 69                	jb     3101e5c <kShell+0x886>
 3101df3:	61                   	popa   
 3101df4:	62 6c 65 3d          	bound  ebp,QWORD PTR [ebp+eiz*2+0x3d]
 3101df8:	76 61                	jbe    3101e5b <kShell+0x885>
 3101dfa:	6c                   	ins    BYTE PTR es:[edi],dx
 3101dfb:	75 65                	jne    3101e62 <kShell+0x88c>
 3101dfd:	0a 00                	or     al,BYTE PTR [eax]
 3101dff:	4c                   	dec    esp
 3101e00:	41                   	inc    ecx
 3101e01:	53                   	push   ebx
 3101e02:	54                   	push   esp
 3101e03:	45                   	inc    ebp
 3101e04:	58                   	pop    eax
 3101e05:	49                   	dec    ecx
 3101e06:	54                   	push   esp
 3101e07:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 3101e0a:	72 6f                	jb     3101e7b <kShell+0x8a5>
 3101e0c:	72 20                	jb     3101e2e <kShell+0x858>
 3101e0e:	65                   	gs
 3101e0f:	78 65                	js     3101e76 <kShell+0x8a0>
 3101e11:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101e14:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3101e1b:	00 50 41             	add    BYTE PTR [eax+0x41],dl
 3101e1e:	54                   	push   esp
 3101e1f:	48                   	dec    eax
 3101e20:	00 2f                	add    BYTE PTR [edi],ch
 3101e22:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
 3101e25:	7c 00                	jl     3101e27 <kShell+0x851>
 3101e27:	00 20                	add    BYTE PTR [eax],ah
 3101e29:	00 0a                	add    BYTE PTR [edx],cl
 3101e2b:	00 6b 65             	add    BYTE PTR [ebx+0x65],ch
 3101e2e:	78 65                	js     3101e95 <kShell+0x8bf>
 3101e30:	63 3a                	arpl   WORD PTR [edx],di
 3101e32:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
 3101e35:	76 61                	jbe    3101e98 <kShell+0x8c2>
 3101e37:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e38:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 3101e3f:	61 
 3101e40:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101e41:	64 0a 00             	or     al,BYTE PTR fs:[eax]
 3101e44:	69 6e 76 61 6c 69 64 	imul   ebp,DWORD PTR [esi+0x76],0x64696c61
 3101e4b:	20 70 61             	and    BYTE PTR [eax+0x61],dh
 3101e4e:	74 68                	je     3101eb8 <kShell+0x8e2>
 3101e50:	20 6f 72             	and    BYTE PTR [edi+0x72],ch
 3101e53:	20 66 69             	and    BYTE PTR [esi+0x69],ah
 3101e56:	6c                   	ins    BYTE PTR es:[edi],dx
 3101e57:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101e59:	61                   	popa   
 3101e5a:	6d                   	ins    DWORD PTR es:[edi],dx
 3101e5b:	65 20 27             	and    BYTE PTR gs:[edi],ah
 3101e5e:	25 73 27 0a 00       	and    eax,0xa2773
 3101e63:	72 00                	jb     3101e65 <kShell+0x88f>
 3101e65:	00 00                	add    BYTE PTR [eax],al
 3101e67:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 3101e6a:	64 69 72 65 63 74 20 	imul   esi,DWORD PTR fs:[edx+0x65],0x6f207463
 3101e71:	6f 
 3101e72:	66                   	data16
 3101e73:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 3101e76:	70 75                	jo     3101eed <kShell+0x917>
 3101e78:	74 20                	je     3101e9a <kShell+0x8c4>
 3101e7a:	66 61                	popaw  
 3101e7c:	69 6c 65 64 2c 20 63 	imul   ebp,DWORD PTR [ebp+eiz*2+0x64],0x6163202c
 3101e83:	61 
 3101e84:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101e85:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101e86:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e87:	74 20                	je     3101ea9 <kShell+0x8d3>
 3101e89:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101e8c:	74 69                	je     3101ef7 <kShell+0x921>
 3101e8e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101e8f:	75 65                	jne    3101ef6 <kShell+0x920>
 3101e91:	0a 00                	or     al,BYTE PTR [eax]
 3101e93:	77 00                	ja     3101e95 <kShell+0x8bf>
 3101e95:	46                   	inc    esi
 3101e96:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101e97:	72 6b                	jb     3101f04 <kShell+0x92e>
 3101e99:	20 65 72             	and    BYTE PTR [ebp+0x72],ah
 3101e9c:	72 6f                	jb     3101f0d <kShell+0x937>
 3101e9e:	72 20                	jb     3101ec0 <kShell+0x8ea>
 3101ea0:	25 75 00 65 78       	and    eax,0x78650075
 3101ea5:	65 63 3a             	arpl   WORD PTR gs:[edx],di
 3101ea8:	20 43 61             	and    BYTE PTR [ebx+0x61],al
 3101eab:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101eac:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101ead:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101eae:	74 20                	je     3101ed0 <kShell+0x8fa>
 3101eb0:	65                   	gs
 3101eb1:	78 65                	js     3101f18 <kShell+0x942>
 3101eb3:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101eb6:	65 20 25 73 0a 00 49 	and    BYTE PTR gs:0x49000a73,ah
 3101ebd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101ebe:	76 61                	jbe    3101f21 <kShell+0x94b>
 3101ec0:	6c                   	ins    BYTE PTR es:[edi],dx
 3101ec1:	69 64 20 64 69 72 65 	imul   esp,DWORD PTR [eax+eiz*1+0x64],0x63657269
 3101ec8:	63 
 3101ec9:	74 6f                	je     3101f3a <kShell+0x964>
 3101ecb:	72 79                	jb     3101f46 <kShell+0x970>
 3101ecd:	20 27                	and    BYTE PTR [edi],ah
 3101ecf:	25 73 27 0a 00       	and    eax,0xa2773
 3101ed4:	43                   	inc    ebx
 3101ed5:	57                   	push   edi
 3101ed6:	44                   	inc    esp
 3101ed7:	00 0a                	add    BYTE PTR [edx],cl
 3101ed9:	25 75 20 74 69       	and    eax,0x69742075
 3101ede:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 3101ee1:	0a 00                	or     al,BYTE PTR [eax]
 3101ee3:	00 0a                	add    BYTE PTR [edx],cl
 3101ee5:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101ee7:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101ee9:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101eeb:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101eed:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101eef:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101ef1:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101ef3:	2a 20                	sub    ah,BYTE PTR [eax]
 3101ef5:	52                   	push   edx
 3101ef6:	45                   	inc    ebp
 3101ef7:	50                   	push   eax
 3101ef8:	45                   	inc    ebp
 3101ef9:	41                   	inc    ecx
 3101efa:	54                   	push   esp
 3101efb:	20 45 58             	and    BYTE PTR [ebp+0x58],al
 3101efe:	45                   	inc    ebp
 3101eff:	43                   	inc    ebx
 3101f00:	55                   	push   ebp
 3101f01:	54                   	push   esp
 3101f02:	49                   	dec    ecx
 3101f03:	4f                   	dec    edi
 3101f04:	4e                   	dec    esi
 3101f05:	20 23                	and    BYTE PTR [ebx],ah
 3101f07:	25 75 20 6f 66       	and    eax,0x666f2075
 3101f0c:	20 25 75 20 2a 2a    	and    BYTE PTR ds:0x2a2a2075,ah
 3101f12:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101f14:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101f16:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101f18:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101f1a:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101f1c:	2a 2a                	sub    ch,BYTE PTR [edx]
 3101f1e:	2a 0a                	sub    cl,BYTE PTR [edx]
 3101f20:	00 48 65             	add    BYTE PTR [eax+0x65],cl
 3101f23:	6c                   	ins    BYTE PTR es:[edi],dx
 3101f24:	70 3a                	jo     3101f60 <kShell+0x98a>
 3101f26:	20 25 73 0a 00 09    	and    BYTE PTR ds:0x9000a73,ah
 3101f2c:	25 73 3a 20 25       	and    eax,0x25203a73
 3101f31:	73 0a                	jae    3101f3d <kShell+0x967>
 3101f33:	00 75 68             	add    BYTE PTR [ebp+0x68],dh
 3101f36:	20 6f 68             	and    BYTE PTR [edi+0x68],ch
 3101f39:	21 00                	and    DWORD PTR [eax],eax
 3101f3b:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 3101f3e:	71 75                	jno    3101fb5 <kShell+0x9df>
 3101f40:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 3101f47:	70 61                	jo     3101faa <kShell+0x9d4>
 3101f49:	72 61                	jb     3101fac <kShell+0x9d6>
 3101f4b:	6d                   	ins    DWORD PTR es:[edi],dx
 3101f4c:	65                   	gs
 3101f4d:	74 65                	je     3101fb4 <kShell+0x9de>
 3101f4f:	72 20                	jb     3101f71 <kShell+0x99b>
 3101f51:	77 68                	ja     3101fbb <kShell+0x9e5>
 3101f53:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 3101f5a:	74 68                	je     3101fc4 <kShell+0x9ee>
 3101f5c:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 3101f60:	6d                   	ins    DWORD PTR es:[edi],dx
 3101f61:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 3101f64:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 3101f67:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 3101f6a:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3101f6d:	64                   	fs
 3101f6e:	73 20                	jae    3101f90 <kShell+0x9ba>
 3101f70:	74 6f                	je     3101fe1 <kShell+0xa0b>
 3101f72:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3101f75:	65                   	gs
 3101f76:	65                   	gs
 3101f77:	70 0a                	jo     3101f83 <kShell+0x9ad>
 3101f79:	00 00                	add    BYTE PTR [eax],al
 3101f7b:	00 63 64             	add    BYTE PTR [ebx+0x64],ah
 3101f7e:	00 43 68             	add    BYTE PTR [ebx+0x68],al
 3101f81:	61                   	popa   
 3101f82:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101f83:	67 65 20 64 69       	and    BYTE PTR gs:[si+0x69],ah
 3101f88:	72 65                	jb     3101fef <kShell+0xa19>
 3101f8a:	63 74 6f 72          	arpl   WORD PTR [edi+ebp*2+0x72],si
 3101f8e:	79 00                	jns    3101f90 <kShell+0x9ba>
 3101f90:	63 6c 65 61          	arpl   WORD PTR [ebp+eiz*2+0x61],bp
 3101f94:	72 00                	jb     3101f96 <kShell+0x9c0>
 3101f96:	43                   	inc    ebx
 3101f97:	6c                   	ins    BYTE PTR es:[edi],dx
 3101f98:	65                   	gs
 3101f99:	61                   	popa   
 3101f9a:	72 20                	jb     3101fbc <kShell+0x9e6>
 3101f9c:	74 68                	je     3102006 <kShell+0xa30>
 3101f9e:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 3101fa2:	72 65                	jb     3102009 <kShell+0xa33>
 3101fa4:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101fa6:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 3101fa9:	76 00                	jbe    3101fab <kShell+0x9d5>
 3101fab:	50                   	push   eax
 3101fac:	72 69                	jb     3102017 <kShell+0xa41>
 3101fae:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101faf:	74 20                	je     3101fd1 <kShell+0x9fb>
 3101fb1:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101fb3:	76 69                	jbe    310201e <kShell+0xa48>
 3101fb5:	72 6f                	jb     3102026 <kShell+0xa50>
 3101fb7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3101fb8:	6d                   	ins    DWORD PTR es:[edi],dx
 3101fb9:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3101fbb:	74 00                	je     3101fbd <kShell+0x9e7>
 3101fbd:	65                   	gs
 3101fbe:	78 65                	js     3102025 <kShell+0xa4f>
 3101fc0:	63 00                	arpl   WORD PTR [eax],ax
 3101fc2:	45                   	inc    ebp
 3101fc3:	78 65                	js     310202a <kShell+0xa54>
 3101fc5:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3101fc8:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3101fcc:	70 72                	jo     3102040 <kShell+0xa6a>
 3101fce:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3101fcf:	67 72 61             	addr16 jb 3102033 <kShell+0xa5d>
 3101fd2:	6d                   	ins    DWORD PTR es:[edi],dx
 3101fd3:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3101fd6:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 3101fdd:	20 
 3101fde:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3101fe2:	6c                   	ins    BYTE PTR es:[edi],dx
 3101fe3:	6c                   	ins    BYTE PTR es:[edi],dx
 3101fe4:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3101fe7:	6c                   	ins    BYTE PTR es:[edi],dx
 3101fe8:	70 00                	jo     3101fea <kShell+0xa14>
 3101fea:	47                   	inc    edi
 3101feb:	65                   	gs
 3101fec:	74 20                	je     310200e <kShell+0xa38>
 3101fee:	68 65 6c 70 20       	push   0x20706c65
 3101ff3:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3101ff7:	73 20                	jae    3102019 <kShell+0xa43>
 3101ff9:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3102000:	74 69                	je     310206b <kShell+0xa95>
 3102002:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3102003:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102004:	29 00                	sub    DWORD PTR [eax],eax
 3102006:	70 77                	jo     310207f <kShell+0xaa9>
 3102008:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 310200c:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3102013:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3102017:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 310201b:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3102020:	79 00                	jns    3102022 <kShell+0xa4c>
 3102022:	72 65                	jb     3102089 <kShell+0xab3>
 3102024:	70 65                	jo     310208b <kShell+0xab5>
 3102026:	61                   	popa   
 3102027:	74 00                	je     3102029 <kShell+0xa53>
 3102029:	52                   	push   edx
 310202a:	65                   	gs
 310202b:	70 65                	jo     3102092 <kShell+0xabc>
 310202d:	61                   	popa   
 310202e:	74 20                	je     3102050 <kShell+0xa7a>
 3102030:	61                   	popa   
 3102031:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 3102034:	6d                   	ins    DWORD PTR es:[edi],dx
 3102035:	6d                   	ins    DWORD PTR es:[edi],dx
 3102036:	61                   	popa   
 3102037:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102038:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 310203c:	74 69                	je     31020a7 <kShell+0xad1>
 310203e:	6d                   	ins    DWORD PTR es:[edi],dx
 310203f:	65                   	gs
 3102040:	73 00                	jae    3102042 <kShell+0xa6c>
 3102042:	73 65                	jae    31020a9 <kShell+0xad3>
 3102044:	74 00                	je     3102046 <kShell+0xa70>
 3102046:	53                   	push   ebx
 3102047:	65                   	gs
 3102048:	74 20                	je     310206a <kShell+0xa94>
 310204a:	61                   	popa   
 310204b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310204c:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 310204f:	76 69                	jbe    31020ba <kShell+0xae4>
 3102051:	72 6f                	jb     31020c2 <kShell+0xaec>
 3102053:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102054:	6d                   	ins    DWORD PTR es:[edi],dx
 3102055:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3102057:	74 20                	je     3102079 <kShell+0xaa3>
 3102059:	76 61                	jbe    31020bc <kShell+0xae6>
 310205b:	72 69                	jb     31020c6 <kShell+0xaf0>
 310205d:	61                   	popa   
 310205e:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 3102062:	73 6c                	jae    31020d0 <kShell+0xafa>
 3102064:	65                   	gs
 3102065:	65                   	gs
 3102066:	70 00                	jo     3102068 <kShell+0xa92>
 3102068:	53                   	push   ebx
 3102069:	6c                   	ins    BYTE PTR es:[edi],dx
 310206a:	65                   	gs
 310206b:	65                   	gs
 310206c:	70 20                	jo     310208e <kShell+0xab8>
 310206e:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3102070:	72 20                	jb     3102092 <kShell+0xabc>
 3102072:	78 20                	js     3102094 <kShell+0xabe>
 3102074:	73 65                	jae    31020db <kShell+0xb05>
 3102076:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3102079:	64                   	fs
 310207a:	73 00                	jae    310207c <kShell+0xaa6>
 310207c:	74 69                	je     31020e7 <kShell+0xb11>
 310207e:	6d                   	ins    DWORD PTR es:[edi],dx
 310207f:	65 00 00             	add    BYTE PTR gs:[eax],al
 3102082:	00 00                	add    BYTE PTR [eax],al
 3102084:	54                   	push   esp
 3102085:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 310208c:	72 6f                	jb     31020fd <kShell+0xb27>
 310208e:	67 72 61             	addr16 jb 31020f2 <kShell+0xb1c>
 3102091:	6d                   	ins    DWORD PTR es:[edi],dx
 3102092:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 3102095:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 310209c:	72 
 310209d:	75 6e                	jne    310210d <kShell+0xb37>
 310209f:	73 2e                	jae    31020cf <kShell+0xaf9>
 31020a1:	0a 09                	or     cl,BYTE PTR [ecx]
 31020a3:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 31020a6:	61                   	popa   
 31020a7:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 31020ab:	74 69                	je     3102116 <kShell+0xb40>
 31020ad:	6d                   	ins    DWORD PTR es:[edi],dx
 31020ae:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 31020b2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31020b3:	67 72 61             	addr16 jb 3102117 <kShell+0xb41>
 31020b6:	6d                   	ins    DWORD PTR es:[edi],dx
 31020b7:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 31020ba:	61                   	popa   
 31020bb:	72 61                	jb     310211e <kShell+0xb48>
 31020bd:	6d                   	ins    DWORD PTR es:[edi],dx
 31020be:	65                   	gs
 31020bf:	74 65                	je     3102126 <kShell+0xb50>
 31020c1:	72 73                	jb     3102136 <kShell+0xb60>
 31020c3:	5d                   	pop    ebp
 31020c4:	00 25 73 20 25 73    	add    BYTE PTR ds:0x73252073,ah
 31020ca:	3e 20 00             	and    BYTE PTR ds:[eax],al
 31020cd:	25 73 00 20 09       	and    eax,0x9200073
 31020d2:	0a 2d 2c 00 6b 53    	or     ch,BYTE PTR ds:0x536b002c
 31020d8:	68 65 6c 6c 00       	push   0x6c6c65
 31020dd:	43                   	inc    ebx
 31020de:	57                   	push   edi
 31020df:	44                   	inc    esp
 31020e0:	00 0a                	add    BYTE PTR [edx],cl
 31020e2:	00 1b                	add    BYTE PTR [ebx],bl
 31020e4:	5b                   	pop    ebx
 31020e5:	31 44 20 1b          	xor    DWORD PTR [eax+eiz*1+0x1b],eax
 31020e9:	5b                   	pop    ebx
 31020ea:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 31020ee:	5b                   	pop    ebx
 31020ef:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 31020f3:	5b                   	pop    ebx
 31020f4:	31 43 00             	xor    DWORD PTR [ebx+0x0],eax
 31020f7:	25                   	.byte 0x25
 31020f8:	63 00                	arpl   WORD PTR [eax],ax

Disassembly of section .eh_frame:

031020fc <.eh_frame>:
 31020fc:	14 00                	adc    al,0x0
 31020fe:	00 00                	add    BYTE PTR [eax],al
 3102100:	00 00                	add    BYTE PTR [eax],al
 3102102:	00 00                	add    BYTE PTR [eax],al
 3102104:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3102107:	00 01                	add    BYTE PTR [ecx],al
 3102109:	7c 08                	jl     3102113 <kShell+0xb3d>
 310210b:	01 1b                	add    DWORD PTR [ebx],ebx
 310210d:	0c 04                	or     al,0x4
 310210f:	04 88                	add    al,0x88
 3102111:	01 00                	add    DWORD PTR [eax],eax
 3102113:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102116:	00 00                	add    BYTE PTR [eax],al
 3102118:	1c 00                	sbb    al,0x0
 310211a:	00 00                	add    BYTE PTR [eax],al
 310211c:	e4 de                	in     al,0xde
 310211e:	ff                   	(bad)  
 310211f:	ff 19                	call   FWORD PTR [ecx]
 3102121:	00 00                	add    BYTE PTR [eax],al
 3102123:	00 00                	add    BYTE PTR [eax],al
 3102125:	41                   	inc    ecx
 3102126:	0e                   	push   cs
 3102127:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310212d:	55                   	push   ebp
 310212e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102131:	04 00                	add    al,0x0
 3102133:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102136:	00 00                	add    BYTE PTR [eax],al
 3102138:	3c 00                	cmp    al,0x0
 310213a:	00 00                	add    BYTE PTR [eax],al
 310213c:	dd de                	fstp   st(6)
 310213e:	ff                   	(bad)  
 310213f:	ff 4f 00             	dec    DWORD PTR [edi+0x0]
 3102142:	00 00                	add    BYTE PTR [eax],al
 3102144:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3102147:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310214d:	02 4b c5             	add    cl,BYTE PTR [ebx-0x3b]
 3102150:	0c 04                	or     al,0x4
 3102152:	04 00                	add    al,0x0
 3102154:	1c 00                	sbb    al,0x0
 3102156:	00 00                	add    BYTE PTR [eax],al
 3102158:	5c                   	pop    esp
 3102159:	00 00                	add    BYTE PTR [eax],al
 310215b:	00 0c df             	add    BYTE PTR [edi+ebx*8],cl
 310215e:	ff                   	(bad)  
 310215f:	ff 5d 01             	call   FWORD PTR [ebp+0x1]
 3102162:	00 00                	add    BYTE PTR [eax],al
 3102164:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3102167:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310216d:	03 59 01             	add    ebx,DWORD PTR [ecx+0x1]
 3102170:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102173:	04 1c                	add    al,0x1c
 3102175:	00 00                	add    BYTE PTR [eax],al
 3102177:	00 7c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bh
 310217b:	00 49 e0             	add    BYTE PTR [ecx-0x20],cl
 310217e:	ff                   	(bad)  
 310217f:	ff 8b 00 00 00 00    	dec    DWORD PTR [ebx+0x0]
 3102185:	41                   	inc    ecx
 3102186:	0e                   	push   cs
 3102187:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310218d:	02 87 c5 0c 04 04    	add    al,BYTE PTR [edi+0x4040cc5]
 3102193:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102196:	00 00                	add    BYTE PTR [eax],al
 3102198:	9c                   	pushf  
 3102199:	00 00                	add    BYTE PTR [eax],al
 310219b:	00 b4 e0 ff ff 26 02 	add    BYTE PTR [eax+eiz*8+0x226ffff],dh
 31021a2:	00 00                	add    BYTE PTR [eax],al
 31021a4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31021a7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31021ad:	03 22                	add    esp,DWORD PTR [edx]
 31021af:	02 c5                	add    al,ch
 31021b1:	0c 04                	or     al,0x4
 31021b3:	04 1c                	add    al,0x1c
 31021b5:	00 00                	add    BYTE PTR [eax],al
 31021b7:	00 bc 00 00 00 ba e2 	add    BYTE PTR [eax+eax*1-0x1d460000],bh
 31021be:	ff                   	(bad)  
 31021bf:	ff c4                	inc    esp
 31021c1:	04 00                	add    al,0x0
 31021c3:	00 00                	add    BYTE PTR [eax],al
 31021c5:	41                   	inc    ecx
 31021c6:	0e                   	push   cs
 31021c7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31021cd:	03 c0                	add    eax,eax
 31021cf:	04 c5                	add    al,0xc5
 31021d1:	0c 04                	or     al,0x4
 31021d3:	04 1c                	add    al,0x1c
 31021d5:	00 00                	add    BYTE PTR [eax],al
 31021d7:	00 dc                	add    ah,bl
 31021d9:	00 00                	add    BYTE PTR [eax],al
 31021db:	00 5e e7             	add    BYTE PTR [esi-0x19],bl
 31021de:	ff                   	(bad)  
 31021df:	ff e1                	jmp    ecx
 31021e1:	00 00                	add    BYTE PTR [eax],al
 31021e3:	00 00                	add    BYTE PTR [eax],al
 31021e5:	41                   	inc    ecx
 31021e6:	0e                   	push   cs
 31021e7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31021ed:	02 dd                	add    bl,ch
 31021ef:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31021f2:	04 00                	add    al,0x0
 31021f4:	1c 00                	sbb    al,0x0
 31021f6:	00 00                	add    BYTE PTR [eax],al
 31021f8:	fc                   	cld    
 31021f9:	00 00                	add    BYTE PTR [eax],al
 31021fb:	00 1f                	add    BYTE PTR [edi],bl
 31021fd:	e8 ff ff 3e 00       	call   34f2201 <kCmdline+0x3df4a1>
 3102202:	00 00                	add    BYTE PTR [eax],al
 3102204:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3102207:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310220d:	7a c5                	jp     31021d4 <kShell+0xbfe>
 310220f:	0c 04                	or     al,0x4
 3102211:	04 00                	add    al,0x0
 3102213:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102216:	00 00                	add    BYTE PTR [eax],al
 3102218:	1c 01                	sbb    al,0x1
 310221a:	00 00                	add    BYTE PTR [eax],al
 310221c:	3d e8 ff ff c7       	cmp    eax,0xc7ffffe8
 3102221:	00 00                	add    BYTE PTR [eax],al
 3102223:	00 00                	add    BYTE PTR [eax],al
 3102225:	41                   	inc    ecx
 3102226:	0e                   	push   cs
 3102227:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310222d:	02 c3                	add    al,bl
 310222f:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102232:	04 00                	add    al,0x0
 3102234:	1c 00                	sbb    al,0x0
 3102236:	00 00                	add    BYTE PTR [eax],al
 3102238:	3c 01                	cmp    al,0x1
 310223a:	00 00                	add    BYTE PTR [eax],al
 310223c:	e4 e8                	in     al,0xe8
 310223e:	ff                   	(bad)  
 310223f:	ff 1a                	call   FWORD PTR [edx]
 3102241:	00 00                	add    BYTE PTR [eax],al
 3102243:	00 00                	add    BYTE PTR [eax],al
 3102245:	41                   	inc    ecx
 3102246:	0e                   	push   cs
 3102247:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310224d:	56                   	push   esi
 310224e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102251:	04 00                	add    al,0x0
 3102253:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102256:	00 00                	add    BYTE PTR [eax],al
 3102258:	5c                   	pop    esp
 3102259:	01 00                	add    DWORD PTR [eax],eax
 310225b:	00 de                	add    dh,bl
 310225d:	e8 ff ff 58 00       	call   3692261 <kCmdline+0x57f501>
 3102262:	00 00                	add    BYTE PTR [eax],al
 3102264:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3102267:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310226d:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3102271:	04 04                	add    al,0x4
 3102273:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102276:	00 00                	add    BYTE PTR [eax],al
 3102278:	7c 01                	jl     310227b <kShell+0xca5>
 310227a:	00 00                	add    BYTE PTR [eax],al
 310227c:	16                   	push   ss
 310227d:	e9 ff ff ce 00       	jmp    3df2281 <kCmdline+0xcdf521>
 3102282:	00 00                	add    BYTE PTR [eax],al
 3102284:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3102287:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310228d:	02 ca                	add    cl,dl
 310228f:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102292:	04 00                	add    al,0x0
 3102294:	1c 00                	sbb    al,0x0
 3102296:	00 00                	add    BYTE PTR [eax],al
 3102298:	9c                   	pushf  
 3102299:	01 00                	add    DWORD PTR [eax],eax
 310229b:	00 c4                	add    ah,al
 310229d:	e9 ff ff 4e 00       	jmp    35f22a1 <kCmdline+0x4df541>
 31022a2:	00 00                	add    BYTE PTR [eax],al
 31022a4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31022a7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31022ad:	02 4a c5             	add    cl,BYTE PTR [edx-0x3b]
 31022b0:	0c 04                	or     al,0x4
 31022b2:	04 00                	add    al,0x0
 31022b4:	20 00                	and    BYTE PTR [eax],al
 31022b6:	00 00                	add    BYTE PTR [eax],al
 31022b8:	bc 01 00 00 f2       	mov    esp,0xf2000001
 31022bd:	e9 ff ff 11 01       	jmp    42222c1 <kCmdline+0x110f561>
 31022c2:	00 00                	add    BYTE PTR [eax],al
 31022c4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31022c7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31022cd:	47                   	inc    edi
 31022ce:	83 03 03             	add    DWORD PTR [ebx],0x3
 31022d1:	06                   	push   es
 31022d2:	01 c5                	add    ebp,eax
 31022d4:	c3                   	ret    
 31022d5:	0c 04                	or     al,0x4
 31022d7:	04 1c                	add    al,0x1c
 31022d9:	00 00                	add    BYTE PTR [eax],al
 31022db:	00 e0                	add    al,ah
 31022dd:	01 00                	add    DWORD PTR [eax],eax
 31022df:	00 e0                	add    al,ah
 31022e1:	ea ff ff 06 00 00 00 	jmp    0x0:0x6ffff
 31022e8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31022eb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31022f1:	42                   	inc    edx
 31022f2:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31022f5:	04 00                	add    al,0x0
 31022f7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31022fa:	00 00                	add    BYTE PTR [eax],al
 31022fc:	00 02                	add    BYTE PTR [edx],al
 31022fe:	00 00                	add    BYTE PTR [eax],al
 3102300:	c6                   	(bad)  
 3102301:	ea ff ff 2f 00 00 00 	jmp    0x0:0x2fffff
 3102308:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 310230b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102311:	6b c5 0c             	imul   eax,ebp,0xc
 3102314:	04 04                	add    al,0x4
 3102316:	00 00                	add    BYTE PTR [eax],al
 3102318:	20 00                	and    BYTE PTR [eax],al
 310231a:	00 00                	add    BYTE PTR [eax],al
 310231c:	20 02                	and    BYTE PTR [edx],al
 310231e:	00 00                	add    BYTE PTR [eax],al
 3102320:	d5 ea                	aad    0xea
 3102322:	ff                   	(bad)  
 3102323:	ff 2d 01 00 00 00    	jmp    FWORD PTR ds:0x1
 3102329:	41                   	inc    ecx
 310232a:	0e                   	push   cs
 310232b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102331:	44                   	inc    esp
 3102332:	83 03 03             	add    DWORD PTR [ebx],0x3
 3102335:	25 01 c5 c3 0c       	and    eax,0xcc3c501
 310233a:	04 04                	add    al,0x4
 310233c:	20 00                	and    BYTE PTR [eax],al
 310233e:	00 00                	add    BYTE PTR [eax],al
 3102340:	44                   	inc    esp
 3102341:	02 00                	add    al,BYTE PTR [eax]
 3102343:	00 de                	add    dh,bl
 3102345:	eb ff                	jmp    3102346 <kShell+0xd70>
 3102347:	ff b4 00 00 00 00 41 	push   DWORD PTR [eax+eax*1+0x41000000]
 310234e:	0e                   	push   cs
 310234f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102355:	44                   	inc    esp
 3102356:	83 03 02             	add    DWORD PTR [ebx],0x2
 3102359:	ac                   	lods   al,BYTE PTR ds:[esi]
 310235a:	c5 c3 0c             	(bad)  
 310235d:	04 04                	add    al,0x4
 310235f:	00 20                	add    BYTE PTR [eax],ah
 3102361:	00 00                	add    BYTE PTR [eax],al
 3102363:	00 68 02             	add    BYTE PTR [eax+0x2],ch
 3102366:	00 00                	add    BYTE PTR [eax],al
 3102368:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102369:	ec                   	in     al,dx
 310236a:	ff                   	(bad)  
 310236b:	ff a9 01 00 00 00    	jmp    FWORD PTR [ecx+0x1]
 3102371:	41                   	inc    ecx
 3102372:	0e                   	push   cs
 3102373:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102379:	44                   	inc    esp
 310237a:	83 03 03             	add    DWORD PTR [ebx],0x3
 310237d:	a1 01 c5 c3 0c       	mov    eax,ds:0xcc3c501
 3102382:	04 04                	add    al,0x4
 3102384:	1c 00                	sbb    al,0x0
 3102386:	00 00                	add    BYTE PTR [eax],al
 3102388:	8c 02                	mov    WORD PTR [edx],es
 310238a:	00 00                	add    BYTE PTR [eax],al
 310238c:	f3 ed                	repz in eax,dx
 310238e:	ff                   	(bad)  
 310238f:	ff 69 00             	jmp    FWORD PTR [ecx+0x0]
 3102392:	00 00                	add    BYTE PTR [eax],al
 3102394:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3102397:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310239d:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 31023a0:	0c 04                	or     al,0x4
 31023a2:	04 00                	add    al,0x0
 31023a4:	1c 00                	sbb    al,0x0
 31023a6:	00 00                	add    BYTE PTR [eax],al
 31023a8:	ac                   	lods   al,BYTE PTR ds:[esi]
 31023a9:	02 00                	add    al,BYTE PTR [eax]
 31023ab:	00 3c ee             	add    BYTE PTR [esi+ebp*8],bh
 31023ae:	ff                   	(bad)  
 31023af:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 31023b5:	41                   	inc    ecx
 31023b6:	0e                   	push   cs
 31023b7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31023bd:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 31023c3:	04 20                	add    al,0x20
 31023c5:	00 00                	add    BYTE PTR [eax],al
 31023c7:	00 cc                	add    ah,cl
 31023c9:	02 00                	add    al,BYTE PTR [eax]
 31023cb:	00 aa f0 ff ff 76    	add    BYTE PTR [edx+0x76fffff0],ch
 31023d1:	00 00                	add    BYTE PTR [eax],al
 31023d3:	00 00                	add    BYTE PTR [eax],al
 31023d5:	41                   	inc    ecx
 31023d6:	0e                   	push   cs
 31023d7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31023dd:	44                   	inc    esp
 31023de:	83 03 02             	add    DWORD PTR [ebx],0x2
 31023e1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31023e2:	c5 c3 0c             	(bad)  
 31023e5:	04 04                	add    al,0x4
 31023e7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31023ea:	00 00                	add    BYTE PTR [eax],al
 31023ec:	f0 02 00             	lock add al,BYTE PTR [eax]
 31023ef:	00 fc                	add    ah,bh
 31023f1:	f0 ff                	lock (bad) 
 31023f3:	ff                   	(bad)  
 31023f4:	3d 00 00 00 00       	cmp    eax,0x0
 31023f9:	41                   	inc    ecx
 31023fa:	0e                   	push   cs
 31023fb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102401:	79 c5                	jns    31023c8 <kShell+0xdf2>
 3102403:	0c 04                	or     al,0x4
 3102405:	04 00                	add    al,0x0
 3102407:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310240a:	00 00                	add    BYTE PTR [eax],al
 310240c:	10 03                	adc    BYTE PTR [ebx],al
 310240e:	00 00                	add    BYTE PTR [eax],al
 3102410:	19 f1                	sbb    ecx,esi
 3102412:	ff                   	(bad)  
 3102413:	ff 2e                	jmp    FWORD PTR [esi]
 3102415:	00 00                	add    BYTE PTR [eax],al
 3102417:	00 00                	add    BYTE PTR [eax],al
 3102419:	41                   	inc    ecx
 310241a:	0e                   	push   cs
 310241b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102421:	6a c5                	push   0xffffffc5
 3102423:	0c 04                	or     al,0x4
 3102425:	04 00                	add    al,0x0
 3102427:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310242a:	00 00                	add    BYTE PTR [eax],al
 310242c:	30 03                	xor    BYTE PTR [ebx],al
 310242e:	00 00                	add    BYTE PTR [eax],al
 3102430:	27                   	daa    
 3102431:	f1                   	icebp  
 3102432:	ff                   	(bad)  
 3102433:	ff 23                	jmp    DWORD PTR [ebx]
 3102435:	00 00                	add    BYTE PTR [eax],al
 3102437:	00 00                	add    BYTE PTR [eax],al
 3102439:	41                   	inc    ecx
 310243a:	0e                   	push   cs
 310243b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102441:	5f                   	pop    edi
 3102442:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102445:	04 00                	add    al,0x0
 3102447:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310244a:	00 00                	add    BYTE PTR [eax],al
 310244c:	50                   	push   eax
 310244d:	03 00                	add    eax,DWORD PTR [eax]
 310244f:	00 2a                	add    BYTE PTR [edx],ch
 3102451:	f1                   	icebp  
 3102452:	ff                   	(bad)  
 3102453:	ff 26                	jmp    DWORD PTR [esi]
 3102455:	00 00                	add    BYTE PTR [eax],al
 3102457:	00 00                	add    BYTE PTR [eax],al
 3102459:	41                   	inc    ecx
 310245a:	0e                   	push   cs
 310245b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102461:	62                   	(bad)  
 3102462:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102465:	04 00                	add    al,0x0
 3102467:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310246a:	00 00                	add    BYTE PTR [eax],al
 310246c:	70 03                	jo     3102471 <kShell+0xe9b>
 310246e:	00 00                	add    BYTE PTR [eax],al
 3102470:	30 f1                	xor    cl,dh
 3102472:	ff                   	(bad)  
 3102473:	ff 16                	call   DWORD PTR [esi]
 3102475:	00 00                	add    BYTE PTR [eax],al
 3102477:	00 00                	add    BYTE PTR [eax],al
 3102479:	41                   	inc    ecx
 310247a:	0e                   	push   cs
 310247b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102481:	52                   	push   edx
 3102482:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102485:	04 00                	add    al,0x0
 3102487:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 310248a:	00 00                	add    BYTE PTR [eax],al
 310248c:	90                   	nop
 310248d:	03 00                	add    eax,DWORD PTR [eax]
 310248f:	00 26                	add    BYTE PTR [esi],ah
 3102491:	f1                   	icebp  
 3102492:	ff                   	(bad)  
 3102493:	ff 20                	jmp    DWORD PTR [eax]
 3102495:	00 00                	add    BYTE PTR [eax],al
 3102497:	00 00                	add    BYTE PTR [eax],al
 3102499:	41                   	inc    ecx
 310249a:	0e                   	push   cs
 310249b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31024a1:	5c                   	pop    esp
 31024a2:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31024a5:	04 00                	add    al,0x0
 31024a7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31024aa:	00 00                	add    BYTE PTR [eax],al
 31024ac:	b0 03                	mov    al,0x3
 31024ae:	00 00                	add    BYTE PTR [eax],al
 31024b0:	26                   	es
 31024b1:	f1                   	icebp  
 31024b2:	ff                   	(bad)  
 31024b3:	ff 56 04             	call   DWORD PTR [esi+0x4]
 31024b6:	00 00                	add    BYTE PTR [eax],al
 31024b8:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31024bb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31024c1:	03 52 04             	add    edx,DWORD PTR [edx+0x4]
 31024c4:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 31024c7:	04                   	.byte 0x4

Disassembly of section .interp:

031024c8 <.interp>:
 31024c8:	2f                   	das    
 31024c9:	6c                   	ins    BYTE PTR es:[edi],dx
 31024ca:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 31024d1:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 31024d8:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

031024dc <.dynsym>:
	...
 31024ec:	09 00                	or     DWORD PTR [eax],eax
	...
 31024f6:	00 00                	add    BYTE PTR [eax],al
 31024f8:	12 00                	adc    al,BYTE PTR [eax]
 31024fa:	00 00                	add    BYTE PTR [eax],al
 31024fc:	10 00                	adc    BYTE PTR [eax],al
	...
 3102506:	00 00                	add    BYTE PTR [eax],al
 3102508:	12 00                	adc    al,BYTE PTR [eax]
 310250a:	00 00                	add    BYTE PTR [eax],al
 310250c:	18 00                	sbb    BYTE PTR [eax],al
	...
 3102516:	00 00                	add    BYTE PTR [eax],al
 3102518:	12 00                	adc    al,BYTE PTR [eax]
 310251a:	00 00                	add    BYTE PTR [eax],al
 310251c:	1e                   	push   ds
	...
 3102525:	00 00                	add    BYTE PTR [eax],al
 3102527:	00 12                	add    BYTE PTR [edx],dl
 3102529:	00 00                	add    BYTE PTR [eax],al
 310252b:	00 25 00 00 00 00    	add    BYTE PTR ds:0x0,ah
 3102531:	00 00                	add    BYTE PTR [eax],al
 3102533:	00 00                	add    BYTE PTR [eax],al
 3102535:	00 00                	add    BYTE PTR [eax],al
 3102537:	00 12                	add    BYTE PTR [edx],dl
 3102539:	00 00                	add    BYTE PTR [eax],al
 310253b:	00 2e                	add    BYTE PTR [esi],ch
	...
 3102545:	00 00                	add    BYTE PTR [eax],al
 3102547:	00 12                	add    BYTE PTR [edx],dl
 3102549:	00 00                	add    BYTE PTR [eax],al
 310254b:	00 35 00 00 00 00    	add    BYTE PTR ds:0x0,dh
 3102551:	00 00                	add    BYTE PTR [eax],al
 3102553:	00 00                	add    BYTE PTR [eax],al
 3102555:	00 00                	add    BYTE PTR [eax],al
 3102557:	00 12                	add    BYTE PTR [edx],dl
 3102559:	00 00                	add    BYTE PTR [eax],al
 310255b:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
	...
 3102566:	00 00                	add    BYTE PTR [eax],al
 3102568:	12 00                	adc    al,BYTE PTR [eax]
 310256a:	00 00                	add    BYTE PTR [eax],al
 310256c:	43                   	inc    ebx
	...
 3102575:	00 00                	add    BYTE PTR [eax],al
 3102577:	00 12                	add    BYTE PTR [edx],dl
 3102579:	00 00                	add    BYTE PTR [eax],al
 310257b:	00 49 00             	add    BYTE PTR [ecx+0x0],cl
	...
 3102586:	00 00                	add    BYTE PTR [eax],al
 3102588:	12 00                	adc    al,BYTE PTR [eax]
 310258a:	00 00                	add    BYTE PTR [eax],al
 310258c:	57                   	push   edi
	...
 3102595:	00 00                	add    BYTE PTR [eax],al
 3102597:	00 12                	add    BYTE PTR [edx],dl
 3102599:	00 00                	add    BYTE PTR [eax],al
 310259b:	00 5f 00             	add    BYTE PTR [edi+0x0],bl
	...
 31025a6:	00 00                	add    BYTE PTR [eax],al
 31025a8:	12 00                	adc    al,BYTE PTR [eax]
 31025aa:	00 00                	add    BYTE PTR [eax],al
 31025ac:	64 00 00             	add    BYTE PTR fs:[eax],al
	...
 31025b7:	00 12                	add    BYTE PTR [edx],dl
 31025b9:	00 00                	add    BYTE PTR [eax],al
 31025bb:	00 69 00             	add    BYTE PTR [ecx+0x0],ch
	...
 31025c6:	00 00                	add    BYTE PTR [eax],al
 31025c8:	12 00                	adc    al,BYTE PTR [eax]
 31025ca:	00 00                	add    BYTE PTR [eax],al
 31025cc:	70 00                	jo     31025ce <kShell+0xff8>
	...
 31025d6:	00 00                	add    BYTE PTR [eax],al
 31025d8:	12 00                	adc    al,BYTE PTR [eax]
 31025da:	00 00                	add    BYTE PTR [eax],al
 31025dc:	79 00                	jns    31025de <kShell+0x1008>
	...
 31025e6:	00 00                	add    BYTE PTR [eax],al
 31025e8:	12 00                	adc    al,BYTE PTR [eax]
 31025ea:	00 00                	add    BYTE PTR [eax],al
 31025ec:	7e 00                	jle    31025ee <kShell+0x1018>
	...
 31025f6:	00 00                	add    BYTE PTR [eax],al
 31025f8:	12 00                	adc    al,BYTE PTR [eax]
 31025fa:	00 00                	add    BYTE PTR [eax],al
 31025fc:	85 00                	test   DWORD PTR [eax],eax
	...
 3102606:	00 00                	add    BYTE PTR [eax],al
 3102608:	12 00                	adc    al,BYTE PTR [eax]
 310260a:	00 00                	add    BYTE PTR [eax],al
 310260c:	8a 00                	mov    al,BYTE PTR [eax]
	...
 3102616:	00 00                	add    BYTE PTR [eax],al
 3102618:	12 00                	adc    al,BYTE PTR [eax]
 310261a:	00 00                	add    BYTE PTR [eax],al
 310261c:	92                   	xchg   edx,eax
	...
 3102625:	00 00                	add    BYTE PTR [eax],al
 3102627:	00 12                	add    BYTE PTR [edx],dl
 3102629:	00 00                	add    BYTE PTR [eax],al
 310262b:	00 9a 00 00 00 00    	add    BYTE PTR [edx+0x0],bl
 3102631:	00 00                	add    BYTE PTR [eax],al
 3102633:	00 00                	add    BYTE PTR [eax],al
 3102635:	00 00                	add    BYTE PTR [eax],al
 3102637:	00 12                	add    BYTE PTR [edx],dl
 3102639:	00 00                	add    BYTE PTR [eax],al
 310263b:	00 a1 00 00 00 00    	add    BYTE PTR [ecx+0x0],ah
 3102641:	00 00                	add    BYTE PTR [eax],al
 3102643:	00 00                	add    BYTE PTR [eax],al
 3102645:	00 00                	add    BYTE PTR [eax],al
 3102647:	00 12                	add    BYTE PTR [edx],dl
 3102649:	00 00                	add    BYTE PTR [eax],al
 310264b:	00 a8 00 00 00 00    	add    BYTE PTR [eax+0x0],ch
 3102651:	00 00                	add    BYTE PTR [eax],al
 3102653:	00 00                	add    BYTE PTR [eax],al
 3102655:	00 00                	add    BYTE PTR [eax],al
 3102657:	00 12                	add    BYTE PTR [edx],dl
 3102659:	00 00                	add    BYTE PTR [eax],al
 310265b:	00 ad 00 00 00 00    	add    BYTE PTR [ebp+0x0],ch
 3102661:	00 00                	add    BYTE PTR [eax],al
 3102663:	00 00                	add    BYTE PTR [eax],al
 3102665:	00 00                	add    BYTE PTR [eax],al
 3102667:	00 12                	add    BYTE PTR [edx],dl
 3102669:	00 00                	add    BYTE PTR [eax],al
 310266b:	00 b4 00 00 00 00 00 	add    BYTE PTR [eax+eax*1+0x0],dh
 3102672:	00 00                	add    BYTE PTR [eax],al
 3102674:	00 00                	add    BYTE PTR [eax],al
 3102676:	00 00                	add    BYTE PTR [eax],al
 3102678:	12 00                	adc    al,BYTE PTR [eax]
 310267a:	00 00                	add    BYTE PTR [eax],al
 310267c:	bb 00 00 00 00       	mov    ebx,0x0
 3102681:	00 00                	add    BYTE PTR [eax],al
 3102683:	00 00                	add    BYTE PTR [eax],al
 3102685:	00 00                	add    BYTE PTR [eax],al
 3102687:	00 12                	add    BYTE PTR [edx],dl
 3102689:	00 00                	add    BYTE PTR [eax],al
 310268b:	00 c3                	add    bl,al
	...
 3102695:	00 00                	add    BYTE PTR [eax],al
 3102697:	00 12                	add    BYTE PTR [edx],dl
 3102699:	00 00                	add    BYTE PTR [eax],al
 310269b:	00 ca                	add    dl,cl
	...
 31026a5:	00 00                	add    BYTE PTR [eax],al
 31026a7:	00 12                	add    BYTE PTR [edx],dl
 31026a9:	00 00                	add    BYTE PTR [eax],al
 31026ab:	00 d7                	add    bh,dl
	...
 31026b5:	00 00                	add    BYTE PTR [eax],al
 31026b7:	00 12                	add    BYTE PTR [edx],dl
 31026b9:	00 00                	add    BYTE PTR [eax],al
 31026bb:	00 dc                	add    ah,bl
	...
 31026c5:	00 00                	add    BYTE PTR [eax],al
 31026c7:	00 12                	add    BYTE PTR [edx],dl
 31026c9:	00 00                	add    BYTE PTR [eax],al
 31026cb:	00 e4                	add    ah,ah
	...
 31026d5:	00 00                	add    BYTE PTR [eax],al
 31026d7:	00 12                	add    BYTE PTR [edx],dl
 31026d9:	00 00                	add    BYTE PTR [eax],al
 31026db:	00 e9                	add    cl,ch
	...
 31026e5:	00 00                	add    BYTE PTR [eax],al
 31026e7:	00 12                	add    BYTE PTR [edx],dl
 31026e9:	00 00                	add    BYTE PTR [eax],al
 31026eb:	00 ee                	add    dh,ch
	...
 31026f5:	00 00                	add    BYTE PTR [eax],al
 31026f7:	00 12                	add    BYTE PTR [edx],dl
 31026f9:	00 00                	add    BYTE PTR [eax],al
 31026fb:	00 f5                	add    ch,dh
	...
 3102705:	00 00                	add    BYTE PTR [eax],al
 3102707:	00 12                	add    BYTE PTR [edx],dl
 3102709:	00 00                	add    BYTE PTR [eax],al
 310270b:	00 fc                	add    ah,bh
	...
 3102715:	00 00                	add    BYTE PTR [eax],al
 3102717:	00 12                	add    BYTE PTR [edx],dl
 3102719:	00 00                	add    BYTE PTR [eax],al
 310271b:	00 02                	add    BYTE PTR [edx],al
 310271d:	01 00                	add    DWORD PTR [eax],eax
	...
 3102727:	00 12                	add    BYTE PTR [edx],dl
 3102729:	00 00                	add    BYTE PTR [eax],al
 310272b:	00 0d 01 00 00 00    	add    BYTE PTR ds:0x1,cl
 3102731:	00 00                	add    BYTE PTR [eax],al
 3102733:	00 00                	add    BYTE PTR [eax],al
 3102735:	00 00                	add    BYTE PTR [eax],al
 3102737:	00 12                	add    BYTE PTR [edx],dl
 3102739:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

0310273c <.dynstr>:
 310273c:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3102740:	63 2e                	arpl   WORD PTR [esi],bp
 3102742:	73 6f                	jae    31027b3 <kShell+0x11dd>
 3102744:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3102747:	72 63                	jb     31027ac <kShell+0x11d6>
 3102749:	70 79                	jo     31027c4 <kShell+0x11ee>
 310274b:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 310274e:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3102755:	72 
 3102756:	69 6e 74 00 70 72 69 	imul   ebp,DWORD PTR [esi+0x74],0x69727000
 310275d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310275e:	74 66                	je     31027c6 <kShell+0x11f0>
 3102760:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 3102763:	73 65                	jae    31027ca <kShell+0x11f4>
 3102765:	74 52                	je     31027b9 <kShell+0x11e3>
 3102767:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3102768:	77 00                	ja     310276a <kShell+0x1194>
 310276a:	67                   	addr16
 310276b:	65                   	gs
 310276c:	74 65                	je     31027d3 <kShell+0x11fd>
 310276e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310276f:	76 00                	jbe    3102771 <kShell+0x119b>
 3102771:	6d                   	ins    DWORD PTR es:[edi],dx
 3102772:	65                   	gs
 3102773:	6d                   	ins    DWORD PTR es:[edi],dx
 3102774:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3102777:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 310277a:	6c                   	ins    BYTE PTR es:[edi],dx
 310277b:	6c                   	ins    BYTE PTR es:[edi],dx
 310277c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310277d:	63 00                	arpl   WORD PTR [eax],ax
 310277f:	73 6c                	jae    31027ed <kShell+0x1217>
 3102781:	65                   	gs
 3102782:	65                   	gs
 3102783:	70 00                	jo     3102785 <kShell+0x11af>
 3102785:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 3102788:	6c                   	ins    BYTE PTR es:[edi],dx
 3102789:	69 6e 65 54 6f 41 72 	imul   ebp,DWORD PTR [esi+0x65],0x72416f54
 3102790:	67 76 00             	addr16 jbe 3102793 <kShell+0x11bd>
 3102793:	73 74                	jae    3102809 <kShell+0x1233>
 3102795:	72 74                	jb     310280b <kShell+0x1235>
 3102797:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3102798:	75 6c                	jne    3102806 <kShell+0x1230>
 310279a:	00 69 74             	add    BYTE PTR [ecx+0x74],ch
 310279d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310279e:	61                   	popa   
 310279f:	00 70 69             	add    BYTE PTR [eax+0x69],dh
 31027a2:	70 65                	jo     3102809 <kShell+0x1233>
 31027a4:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 31027a7:	72 63                	jb     310280c <kShell+0x1236>
 31027a9:	61                   	popa   
 31027aa:	74 00                	je     31027ac <kShell+0x11d6>
 31027ac:	67                   	addr16
 31027ad:	65                   	gs
 31027ae:	74 74                	je     3102824 <kShell+0x124e>
 31027b0:	69 63 6b 73 00 65 78 	imul   esp,DWORD PTR [ebx+0x6b],0x78650073
 31027b7:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 31027ba:	73 74                	jae    3102830 <kShell+0x125a>
 31027bc:	72 73                	jb     3102831 <kShell+0x125b>
 31027be:	74 72                	je     3102832 <kShell+0x125c>
 31027c0:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 31027c3:	61                   	popa   
 31027c4:	64 00 73 74          	add    BYTE PTR fs:[ebx+0x74],dh
 31027c8:	72 6e                	jb     3102838 <kShell+0x1262>
 31027ca:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 31027cd:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 31027d0:	72 6e                	jb     3102840 <kShell+0x126a>
 31027d2:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 31027d5:	00 73 65             	add    BYTE PTR [ebx+0x65],dh
 31027d8:	74 65                	je     310283f <kShell+0x1269>
 31027da:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31027db:	76 00                	jbe    31027dd <kShell+0x1207>
 31027dd:	73 74                	jae    3102853 <kShell+0x127d>
 31027df:	72 74                	jb     3102855 <kShell+0x127f>
 31027e1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31027e2:	6b 00 66             	imul   eax,DWORD PTR [eax],0x66
 31027e5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31027e6:	72 6b                	jb     3102853 <kShell+0x127d>
 31027e8:	00 73 65             	add    BYTE PTR [ebx+0x65],dh
 31027eb:	74 63                	je     3102850 <kShell+0x127a>
 31027ed:	77 64                	ja     3102853 <kShell+0x127d>
 31027ef:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 31027f2:	6d                   	ins    DWORD PTR es:[edi],dx
 31027f3:	73 65                	jae    310285a <kShell+0x1284>
 31027f5:	74 00                	je     31027f7 <kShell+0x1221>
 31027f7:	73 74                	jae    310286d <kShell+0x1297>
 31027f9:	72 74                	jb     310286f <kShell+0x1299>
 31027fb:	72 69                	jb     3102866 <kShell+0x1290>
 31027fd:	6d                   	ins    DWORD PTR es:[edi],dx
 31027fe:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3102801:	74 63                	je     3102866 <kShell+0x1290>
 3102803:	77 64                	ja     3102869 <kShell+0x1293>
 3102805:	00 6d 6f             	add    BYTE PTR [ebp+0x6f],ch
 3102808:	64 69 66 79 53 69 67 	imul   esp,DWORD PTR fs:[esi+0x79],0x6e676953
 310280f:	6e 
 3102810:	61                   	popa   
 3102811:	6c                   	ins    BYTE PTR es:[edi],dx
 3102812:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3102815:	61                   	popa   
 3102816:	74 00                	je     3102818 <kShell+0x1242>
 3102818:	66                   	data16
 3102819:	72 65                	jb     3102880 <kShell+0x12aa>
 310281b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310281c:	70 65                	jo     3102883 <kShell+0x12ad>
 310281e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310281f:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3102822:	69 74 00 61 74 6f 69 	imul   esi,DWORD PTR [eax+eax*1+0x61],0x696f74
 3102829:	00 
 310282a:	73 65                	jae    3102891 <kShell+0x12bb>
 310282c:	74 53                	je     3102881 <kShell+0x12ab>
 310282e:	54                   	push   esp
 310282f:	44                   	inc    esp
 3102830:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3102833:	72 6c                	jb     31028a1 <kShell+0x12cb>
 3102835:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3102837:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 310283a:	65 63 61 00          	arpl   WORD PTR gs:[ecx+0x0],sp
 310283e:	73 74                	jae    31028b4 <kShell+0x12de>
 3102840:	72 72                	jb     31028b4 <kShell+0x12de>
 3102842:	65                   	gs
 3102843:	70 6c                	jo     31028b1 <kShell+0x12db>
 3102845:	61                   	popa   
 3102846:	63 65 00             	arpl   WORD PTR [ebp+0x0],sp
 3102849:	66                   	data16
 310284a:	72 65                	jb     31028b1 <kShell+0x12db>
 310284c:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 310284f:	2e                   	cs
 3102850:	2f                   	das    
 3102851:	6c                   	ins    BYTE PTR es:[edi],dx
 3102852:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3102859:	4f                   	dec    edi
 310285a:	53                   	push   ebx
 310285b:	2f                   	das    
 310285c:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3102863:	62 
 3102864:	75 67                	jne    31028cd <kShell+0x12f7>
 3102866:	2f                   	das    
 3102867:	47                   	inc    edi
 3102868:	4e                   	dec    esi
 3102869:	55                   	push   ebp
 310286a:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 310286f:	78 00                	js     3102871 <kShell+0x129b>

Disassembly of section .hash:

03102874 <.hash>:
 3102874:	25 00 00 00 26       	and    eax,0x26000000
 3102879:	00 00                	add    BYTE PTR [eax],al
 310287b:	00 13                	add    BYTE PTR [ebx],dl
 310287d:	00 00                	add    BYTE PTR [eax],al
 310287f:	00 00                	add    BYTE PTR [eax],al
 3102881:	00 00                	add    BYTE PTR [eax],al
 3102883:	00 07                	add    BYTE PTR [edi],al
 3102885:	00 00                	add    BYTE PTR [eax],al
 3102887:	00 21                	add    BYTE PTR [ecx],ah
 3102889:	00 00                	add    BYTE PTR [eax],al
 310288b:	00 00                	add    BYTE PTR [eax],al
 310288d:	00 00                	add    BYTE PTR [eax],al
 310288f:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
	...
 310289a:	00 00                	add    BYTE PTR [eax],al
 310289c:	15 00 00 00 00       	adc    eax,0x0
 31028a1:	00 00                	add    BYTE PTR [eax],al
 31028a3:	00 00                	add    BYTE PTR [eax],al
 31028a5:	00 00                	add    BYTE PTR [eax],al
 31028a7:	00 1e                	add    BYTE PTR [esi],bl
 31028a9:	00 00                	add    BYTE PTR [eax],al
 31028ab:	00 00                	add    BYTE PTR [eax],al
 31028ad:	00 00                	add    BYTE PTR [eax],al
 31028af:	00 0d 00 00 00 16    	add    BYTE PTR ds:0x16000000,cl
 31028b5:	00 00                	add    BYTE PTR [eax],al
 31028b7:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 31028ba:	00 00                	add    BYTE PTR [eax],al
 31028bc:	00 00                	add    BYTE PTR [eax],al
 31028be:	00 00                	add    BYTE PTR [eax],al
 31028c0:	0b 00                	or     eax,DWORD PTR [eax]
 31028c2:	00 00                	add    BYTE PTR [eax],al
 31028c4:	1d 00 00 00 06       	sbb    eax,0x6000000
 31028c9:	00 00                	add    BYTE PTR [eax],al
 31028cb:	00 03                	add    BYTE PTR [ebx],al
 31028cd:	00 00                	add    BYTE PTR [eax],al
 31028cf:	00 12                	add    BYTE PTR [edx],dl
 31028d1:	00 00                	add    BYTE PTR [eax],al
 31028d3:	00 20                	add    BYTE PTR [eax],ah
 31028d5:	00 00                	add    BYTE PTR [eax],al
 31028d7:	00 08                	add    BYTE PTR [eax],cl
	...
 31028ed:	00 00                	add    BYTE PTR [eax],al
 31028ef:	00 22                	add    BYTE PTR [edx],ah
 31028f1:	00 00                	add    BYTE PTR [eax],al
 31028f3:	00 11                	add    BYTE PTR [ecx],dl
 31028f5:	00 00                	add    BYTE PTR [eax],al
 31028f7:	00 25 00 00 00 19    	add    BYTE PTR ds:0x19000000,ah
	...
 3102905:	00 00                	add    BYTE PTR [eax],al
 3102907:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
	...
 3102922:	00 00                	add    BYTE PTR [eax],al
 3102924:	02 00                	add    al,BYTE PTR [eax]
	...
 310293a:	00 00                	add    BYTE PTR [eax],al
 310293c:	05 00 00 00 00       	add    eax,0x0
	...
 3102949:	00 00                	add    BYTE PTR [eax],al
 310294b:	00 0a                	add    BYTE PTR [edx],cl
	...
 3102955:	00 00                	add    BYTE PTR [eax],al
 3102957:	00 01                	add    BYTE PTR [ecx],al
 3102959:	00 00                	add    BYTE PTR [eax],al
 310295b:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 310295e:	00 00                	add    BYTE PTR [eax],al
 3102960:	0e                   	push   cs
 3102961:	00 00                	add    BYTE PTR [eax],al
 3102963:	00 00                	add    BYTE PTR [eax],al
 3102965:	00 00                	add    BYTE PTR [eax],al
 3102967:	00 09                	add    BYTE PTR [ecx],cl
	...
 3102971:	00 00                	add    BYTE PTR [eax],al
 3102973:	00 17                	add    BYTE PTR [edi],dl
 3102975:	00 00                	add    BYTE PTR [eax],al
 3102977:	00 10                	add    BYTE PTR [eax],dl
	...
 3102985:	00 00                	add    BYTE PTR [eax],al
 3102987:	00 0f                	add    BYTE PTR [edi],cl
 3102989:	00 00                	add    BYTE PTR [eax],al
 310298b:	00 18                	add    BYTE PTR [eax],bl
 310298d:	00 00                	add    BYTE PTR [eax],al
 310298f:	00 1a                	add    BYTE PTR [edx],bl
 3102991:	00 00                	add    BYTE PTR [eax],al
 3102993:	00 1b                	add    BYTE PTR [ebx],bl
 3102995:	00 00                	add    BYTE PTR [eax],al
 3102997:	00 1f                	add    BYTE PTR [edi],bl
 3102999:	00 00                	add    BYTE PTR [eax],al
 310299b:	00 00                	add    BYTE PTR [eax],al
 310299d:	00 00                	add    BYTE PTR [eax],al
 310299f:	00 23                	add    BYTE PTR [ebx],ah
 31029a1:	00 00                	add    BYTE PTR [eax],al
 31029a3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
	...

Disassembly of section .eh_frame:

031029a8 <.eh_frame>:
 31029a8:	14 00                	adc    al,0x0
 31029aa:	00 00                	add    BYTE PTR [eax],al
 31029ac:	00 00                	add    BYTE PTR [eax],al
 31029ae:	00 00                	add    BYTE PTR [eax],al
 31029b0:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 31029b3:	00 01                	add    BYTE PTR [ecx],al
 31029b5:	7c 08                	jl     31029bf <kShell+0x13e9>
 31029b7:	01 1b                	add    DWORD PTR [ebx],ebx
 31029b9:	0c 04                	or     al,0x4
 31029bb:	04 88                	add    al,0x88
 31029bd:	01 00                	add    DWORD PTR [eax],eax
 31029bf:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 31029c2:	00 00                	add    BYTE PTR [eax],al
 31029c4:	1c 00                	sbb    al,0x0
 31029c6:	00 00                	add    BYTE PTR [eax],al
 31029c8:	68 f0 ff ff 60       	push   0x60fffff0
 31029cd:	02 00                	add    al,BYTE PTR [eax]
 31029cf:	00 00                	add    BYTE PTR [eax],al
 31029d1:	0e                   	push   cs
 31029d2:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 31029d5:	0c 4a                	or     al,0x4a
 31029d7:	0f 0b                	ud2    
 31029d9:	74 04                	je     31029df <kShell+0x1409>
 31029db:	78 00                	js     31029dd <kShell+0x1407>
 31029dd:	3f                   	aas    
 31029de:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 31029e0:	2a 32                	sub    dh,BYTE PTR [edx]
 31029e2:	24 22                	and    al,0x22
 31029e4:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

031029e8 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 31029e8:	01 1b                	add    DWORD PTR [ebx],ebx
 31029ea:	03 3b                	add    edi,DWORD PTR [ebx]
 31029ec:	10 f7                	adc    bh,dh
 31029ee:	ff                   	(bad)  
 31029ef:	ff 1d 00 00 00 18    	call   FWORD PTR ds:0x18000000
 31029f5:	d6                   	(bad)  
 31029f6:	ff                   	(bad)  
 31029f7:	ff 2c f7             	jmp    FWORD PTR [edi+esi*8]
 31029fa:	ff                   	(bad)  
 31029fb:	ff 31                	push   DWORD PTR [ecx]
 31029fd:	d6                   	(bad)  
 31029fe:	ff                   	(bad)  
 31029ff:	ff 4c f7 ff          	dec    DWORD PTR [edi+esi*8-0x1]
 3102a03:	ff 80 d6 ff ff 6c    	inc    DWORD PTR [eax+0x6cffffd6]
 3102a09:	f7 ff                	idiv   edi
 3102a0b:	ff dd                	call   <internal disassembler error>
 3102a0d:	d7                   	xlat   BYTE PTR ds:[ebx]
 3102a0e:	ff                   	(bad)  
 3102a0f:	ff 8c f7 ff ff 68 d8 	dec    DWORD PTR [edi+esi*8-0x27970001]
 3102a16:	ff                   	(bad)  
 3102a17:	ff ac f7 ff ff 8e da 	jmp    FWORD PTR [edi+esi*8-0x25710001]
 3102a1e:	ff                   	(bad)  
 3102a1f:	ff cc                	dec    esp
 3102a21:	f7 ff                	idiv   edi
 3102a23:	ff 52 df             	call   DWORD PTR [edx-0x21]
 3102a26:	ff                   	(bad)  
 3102a27:	ff ec                	jmp    <internal disassembler error>
 3102a29:	f7 ff                	idiv   edi
 3102a2b:	ff 33                	push   DWORD PTR [ebx]
 3102a2d:	e0 ff                	loopne 3102a2e <__GNU_EH_FRAME_HDR+0x46>
 3102a2f:	ff 0c f8             	dec    DWORD PTR [eax+edi*8]
 3102a32:	ff                   	(bad)  
 3102a33:	ff 71 e0             	push   DWORD PTR [ecx-0x20]
 3102a36:	ff                   	(bad)  
 3102a37:	ff 2c f8             	jmp    FWORD PTR [eax+edi*8]
 3102a3a:	ff                   	(bad)  
 3102a3b:	ff                   	(bad)  
 3102a3c:	38 e1                	cmp    cl,ah
 3102a3e:	ff                   	(bad)  
 3102a3f:	ff 4c f8 ff          	dec    DWORD PTR [eax+edi*8-0x1]
 3102a43:	ff 52 e1             	call   DWORD PTR [edx-0x1f]
 3102a46:	ff                   	(bad)  
 3102a47:	ff 6c f8 ff          	jmp    FWORD PTR [eax+edi*8-0x1]
 3102a4b:	ff aa e1 ff ff 8c    	jmp    FWORD PTR [edx-0x7300001f]
 3102a51:	f8                   	clc    
 3102a52:	ff                   	(bad)  
 3102a53:	ff                   	(bad)  
 3102a54:	78 e2                	js     3102a38 <__GNU_EH_FRAME_HDR+0x50>
 3102a56:	ff                   	(bad)  
 3102a57:	ff ac f8 ff ff c6 e2 	jmp    FWORD PTR [eax+edi*8-0x1d390001]
 3102a5e:	ff                   	(bad)  
 3102a5f:	ff cc                	dec    esp
 3102a61:	f8                   	clc    
 3102a62:	ff                   	(bad)  
 3102a63:	ff d8                	call   <internal disassembler error>
 3102a65:	e3 ff                	jecxz  3102a66 <__GNU_EH_FRAME_HDR+0x7e>
 3102a67:	ff f0                	push   eax
 3102a69:	f8                   	clc    
 3102a6a:	ff                   	(bad)  
 3102a6b:	ff de                	call   <internal disassembler error>
 3102a6d:	e3 ff                	jecxz  3102a6e <__GNU_EH_FRAME_HDR+0x86>
 3102a6f:	ff 10                	call   DWORD PTR [eax]
 3102a71:	f9                   	stc    
 3102a72:	ff                   	(bad)  
 3102a73:	ff 0d e4 ff ff 30    	dec    DWORD PTR ds:0x30ffffe4
 3102a79:	f9                   	stc    
 3102a7a:	ff                   	(bad)  
 3102a7b:	ff                   	(bad)  
 3102a7c:	3a e5                	cmp    ah,ch
 3102a7e:	ff                   	(bad)  
 3102a7f:	ff 54 f9 ff          	call   DWORD PTR [ecx+edi*8-0x1]
 3102a83:	ff ee                	jmp    <internal disassembler error>
 3102a85:	e5 ff                	in     eax,0xff
 3102a87:	ff                   	(bad)  
 3102a88:	78 f9                	js     3102a83 <__GNU_EH_FRAME_HDR+0x9b>
 3102a8a:	ff                   	(bad)  
 3102a8b:	ff 97 e7 ff ff 9c    	call   DWORD PTR [edi-0x63000019]
 3102a91:	f9                   	stc    
 3102a92:	ff                   	(bad)  
 3102a93:	ff 00                	inc    DWORD PTR [eax]
 3102a95:	e8 ff ff bc f9       	call   fccd2a99 <kCmdline+0xf9bbfd39>
 3102a9a:	ff                   	(bad)  
 3102a9b:	ff 8e ea ff ff dc    	dec    DWORD PTR [esi-0x23000016]
 3102aa1:	f9                   	stc    
 3102aa2:	ff                   	(bad)  
 3102aa3:	ff 04 eb             	inc    DWORD PTR [ebx+ebp*8]
 3102aa6:	ff                   	(bad)  
 3102aa7:	ff 00                	inc    DWORD PTR [eax]
 3102aa9:	fa                   	cli    
 3102aaa:	ff                   	(bad)  
 3102aab:	ff 41 eb             	inc    DWORD PTR [ecx-0x15]
 3102aae:	ff                   	(bad)  
 3102aaf:	ff 20                	jmp    DWORD PTR [eax]
 3102ab1:	fa                   	cli    
 3102ab2:	ff                   	(bad)  
 3102ab3:	ff 6f eb             	jmp    FWORD PTR [edi-0x15]
 3102ab6:	ff                   	(bad)  
 3102ab7:	ff 40 fa             	inc    DWORD PTR [eax-0x6]
 3102aba:	ff                   	(bad)  
 3102abb:	ff 92 eb ff ff 60    	call   DWORD PTR [edx+0x60ffffeb]
 3102ac1:	fa                   	cli    
 3102ac2:	ff                   	(bad)  
 3102ac3:	ff                   	(bad)  
 3102ac4:	b8 eb ff ff 80       	mov    eax,0x80ffffeb
 3102ac9:	fa                   	cli    
 3102aca:	ff                   	(bad)  
 3102acb:	ff ce                	dec    esi
 3102acd:	eb ff                	jmp    3102ace <__GNU_EH_FRAME_HDR+0xe6>
 3102acf:	ff a0 fa ff ff ee    	jmp    DWORD PTR [eax-0x11000006]
 3102ad5:	eb ff                	jmp    3102ad6 <__GNU_EH_FRAME_HDR+0xee>
 3102ad7:	ff c0                	inc    eax
 3102ad9:	fa                   	cli    
 3102ada:	ff                   	(bad)  
 3102adb:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03102adc <.rel.dyn>:
 3102adc:	2c 2e                	sub    al,0x2e
 3102ade:	10 03                	adc    BYTE PTR [ebx],al
 3102ae0:	07                   	pop    es
 3102ae1:	01 00                	add    DWORD PTR [eax],eax
 3102ae3:	00 30                	add    BYTE PTR [eax],dh
 3102ae5:	2e 10 03             	adc    BYTE PTR cs:[ebx],al
 3102ae8:	07                   	pop    es
 3102ae9:	02 00                	add    al,BYTE PTR [eax]
 3102aeb:	00 34 2e             	add    BYTE PTR [esi+ebp*1],dh
 3102aee:	10 03                	adc    BYTE PTR [ebx],al
 3102af0:	07                   	pop    es
 3102af1:	03 00                	add    eax,DWORD PTR [eax]
 3102af3:	00 38                	add    BYTE PTR [eax],bh
 3102af5:	2e 10 03             	adc    BYTE PTR cs:[ebx],al
 3102af8:	07                   	pop    es
 3102af9:	04 00                	add    al,0x0
 3102afb:	00 3c 2e             	add    BYTE PTR [esi+ebp*1],bh
 3102afe:	10 03                	adc    BYTE PTR [ebx],al
 3102b00:	07                   	pop    es
 3102b01:	05 00 00 40 2e       	add    eax,0x2e400000
 3102b06:	10 03                	adc    BYTE PTR [ebx],al
 3102b08:	07                   	pop    es
 3102b09:	06                   	push   es
 3102b0a:	00 00                	add    BYTE PTR [eax],al
 3102b0c:	44                   	inc    esp
 3102b0d:	2e 10 03             	adc    BYTE PTR cs:[ebx],al
 3102b10:	07                   	pop    es
 3102b11:	07                   	pop    es
 3102b12:	00 00                	add    BYTE PTR [eax],al
 3102b14:	48                   	dec    eax
 3102b15:	2e 10 03             	adc    BYTE PTR cs:[ebx],al
 3102b18:	07                   	pop    es
 3102b19:	08 00                	or     BYTE PTR [eax],al
 3102b1b:	00 4c 2e 10          	add    BYTE PTR [esi+ebp*1+0x10],cl
 3102b1f:	03 07                	add    eax,DWORD PTR [edi]
 3102b21:	09 00                	or     DWORD PTR [eax],eax
 3102b23:	00 50 2e             	add    BYTE PTR [eax+0x2e],dl
 3102b26:	10 03                	adc    BYTE PTR [ebx],al
 3102b28:	07                   	pop    es
 3102b29:	0a 00                	or     al,BYTE PTR [eax]
 3102b2b:	00 54 2e 10          	add    BYTE PTR [esi+ebp*1+0x10],dl
 3102b2f:	03 07                	add    eax,DWORD PTR [edi]
 3102b31:	0b 00                	or     eax,DWORD PTR [eax]
 3102b33:	00 58 2e             	add    BYTE PTR [eax+0x2e],bl
 3102b36:	10 03                	adc    BYTE PTR [ebx],al
 3102b38:	07                   	pop    es
 3102b39:	0c 00                	or     al,0x0
 3102b3b:	00 5c 2e 10          	add    BYTE PTR [esi+ebp*1+0x10],bl
 3102b3f:	03 07                	add    eax,DWORD PTR [edi]
 3102b41:	0d 00 00 60 2e       	or     eax,0x2e600000
 3102b46:	10 03                	adc    BYTE PTR [ebx],al
 3102b48:	07                   	pop    es
 3102b49:	0e                   	push   cs
 3102b4a:	00 00                	add    BYTE PTR [eax],al
 3102b4c:	64 2e 10 03          	fs adc BYTE PTR cs:fs:[ebx],al
 3102b50:	07                   	pop    es
 3102b51:	0f 00 00             	sldt   WORD PTR [eax]
 3102b54:	68 2e 10 03 07       	push   0x703102e
 3102b59:	10 00                	adc    BYTE PTR [eax],al
 3102b5b:	00 6c 2e 10          	add    BYTE PTR [esi+ebp*1+0x10],ch
 3102b5f:	03 07                	add    eax,DWORD PTR [edi]
 3102b61:	11 00                	adc    DWORD PTR [eax],eax
 3102b63:	00 70 2e             	add    BYTE PTR [eax+0x2e],dh
 3102b66:	10 03                	adc    BYTE PTR [ebx],al
 3102b68:	07                   	pop    es
 3102b69:	12 00                	adc    al,BYTE PTR [eax]
 3102b6b:	00 74 2e 10          	add    BYTE PTR [esi+ebp*1+0x10],dh
 3102b6f:	03 07                	add    eax,DWORD PTR [edi]
 3102b71:	13 00                	adc    eax,DWORD PTR [eax]
 3102b73:	00 78 2e             	add    BYTE PTR [eax+0x2e],bh
 3102b76:	10 03                	adc    BYTE PTR [ebx],al
 3102b78:	07                   	pop    es
 3102b79:	14 00                	adc    al,0x0
 3102b7b:	00 7c 2e 10          	add    BYTE PTR [esi+ebp*1+0x10],bh
 3102b7f:	03 07                	add    eax,DWORD PTR [edi]
 3102b81:	15 00 00 80 2e       	adc    eax,0x2e800000
 3102b86:	10 03                	adc    BYTE PTR [ebx],al
 3102b88:	07                   	pop    es
 3102b89:	16                   	push   ss
 3102b8a:	00 00                	add    BYTE PTR [eax],al
 3102b8c:	84 2e                	test   BYTE PTR [esi],ch
 3102b8e:	10 03                	adc    BYTE PTR [ebx],al
 3102b90:	07                   	pop    es
 3102b91:	17                   	pop    ss
 3102b92:	00 00                	add    BYTE PTR [eax],al
 3102b94:	88 2e                	mov    BYTE PTR [esi],ch
 3102b96:	10 03                	adc    BYTE PTR [ebx],al
 3102b98:	07                   	pop    es
 3102b99:	18 00                	sbb    BYTE PTR [eax],al
 3102b9b:	00 8c 2e 10 03 07 19 	add    BYTE PTR [esi+ebp*1+0x19070310],cl
 3102ba2:	00 00                	add    BYTE PTR [eax],al
 3102ba4:	90                   	nop
 3102ba5:	2e 10 03             	adc    BYTE PTR cs:[ebx],al
 3102ba8:	07                   	pop    es
 3102ba9:	1a 00                	sbb    al,BYTE PTR [eax]
 3102bab:	00 94 2e 10 03 07 1b 	add    BYTE PTR [esi+ebp*1+0x1b070310],dl
 3102bb2:	00 00                	add    BYTE PTR [eax],al
 3102bb4:	98                   	cwde   
 3102bb5:	2e 10 03             	adc    BYTE PTR cs:[ebx],al
 3102bb8:	07                   	pop    es
 3102bb9:	1c 00                	sbb    al,0x0
 3102bbb:	00 9c 2e 10 03 07 1d 	add    BYTE PTR [esi+ebp*1+0x1d070310],bl
 3102bc2:	00 00                	add    BYTE PTR [eax],al
 3102bc4:	a0 2e 10 03 07       	mov    al,ds:0x703102e
 3102bc9:	1e                   	push   ds
 3102bca:	00 00                	add    BYTE PTR [eax],al
 3102bcc:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 3102bcd:	2e 10 03             	adc    BYTE PTR cs:[ebx],al
 3102bd0:	07                   	pop    es
 3102bd1:	1f                   	pop    ds
 3102bd2:	00 00                	add    BYTE PTR [eax],al
 3102bd4:	a8 2e                	test   al,0x2e
 3102bd6:	10 03                	adc    BYTE PTR [ebx],al
 3102bd8:	07                   	pop    es
 3102bd9:	20 00                	and    BYTE PTR [eax],al
 3102bdb:	00 ac 2e 10 03 07 21 	add    BYTE PTR [esi+ebp*1+0x21070310],ch
 3102be2:	00 00                	add    BYTE PTR [eax],al
 3102be4:	b0 2e                	mov    al,0x2e
 3102be6:	10 03                	adc    BYTE PTR [ebx],al
 3102be8:	07                   	pop    es
 3102be9:	22 00                	and    al,BYTE PTR [eax]
 3102beb:	00 b4 2e 10 03 07 23 	add    BYTE PTR [esi+ebp*1+0x23070310],dh
 3102bf2:	00 00                	add    BYTE PTR [eax],al
 3102bf4:	b8 2e 10 03 07       	mov    eax,0x703102e
 3102bf9:	24 00                	and    al,0x0
 3102bfb:	00 bc 2e 10 03 07 25 	add    BYTE PTR [esi+ebp*1+0x25070310],bh
	...

Disassembly of section .data:

03102c20 <cmds>:
 3102c20:	90                   	nop
 3102c21:	1c 10                	sbb    al,0x10
 3102c23:	03 93 1c 10 03 3a    	add    edx,DWORD PTR [ebx+0x3a03101c]
 3102c29:	09 10                	or     DWORD PTR [eax],edx
 3102c2b:	03 01                	add    eax,DWORD PTR [ecx]
 3102c2d:	00 00                	add    BYTE PTR [eax],al
 3102c2f:	00 a4 1c 10 03 aa 1c 	add    BYTE PTR [esp+ebx*1+0x1caa0310],ah
 3102c36:	10 03                	adc    BYTE PTR [ebx],al
 3102c38:	00 00                	add    BYTE PTR [eax],al
 3102c3a:	10 03                	adc    BYTE PTR [ebx],al
 3102c3c:	00 00                	add    BYTE PTR [eax],al
 3102c3e:	00 00                	add    BYTE PTR [eax],al
 3102c40:	bb 1c 10 03 bf       	mov    ebx,0xbf03101c
 3102c45:	1c 10                	sbb    al,0x10
 3102c47:	03 19                	add    ebx,DWORD PTR [ecx]
 3102c49:	00 10                	add    BYTE PTR [eax],dl
 3102c4b:	03 00                	add    eax,DWORD PTR [eax]
 3102c4d:	00 00                	add    BYTE PTR [eax],al
 3102c4f:	00 d1                	add    cl,dl
 3102c51:	1c 10                	sbb    al,0x10
 3102c53:	03 d6                	add    edx,esi
 3102c55:	1c 10                	sbb    al,0x10
 3102c57:	03 20                	add    esp,DWORD PTR [eax]
 3102c59:	0b 10                	or     edx,DWORD PTR [eax]
 3102c5b:	03 01                	add    eax,DWORD PTR [ecx]
 3102c5d:	00 00                	add    BYTE PTR [eax],al
 3102c5f:	00 e8                	add    al,ch
 3102c61:	1c 10                	sbb    al,0x10
 3102c63:	03 ed                	add    ebp,ebp
 3102c65:	1c 10                	sbb    al,0x10
 3102c67:	03 3a                	add    edi,DWORD PTR [edx]
 3102c69:	0b 10                	or     edx,DWORD PTR [eax]
 3102c6b:	03 01                	add    eax,DWORD PTR [ecx]
 3102c6d:	00 00                	add    BYTE PTR [eax],al
 3102c6f:	00 f9                	add    cl,bh
 3102c71:	1c 10                	sbb    al,0x10
 3102c73:	03 fe                	add    edi,esi
 3102c75:	1c 10                	sbb    al,0x10
 3102c77:	03 92 0b 10 03 01    	add    edx,DWORD PTR [edx+0x103100b]
 3102c7d:	00 00                	add    BYTE PTR [eax],al
 3102c7f:	00 1a                	add    BYTE PTR [edx],bl
 3102c81:	1d 10 03 1e 1d       	sbb    eax,0x1d1e0310
 3102c86:	10 03                	adc    BYTE PTR [ebx],al
 3102c88:	60                   	pusha  
 3102c89:	0c 10                	or     al,0x10
 3102c8b:	03 00                	add    eax,DWORD PTR [eax]
 3102c8d:	00 00                	add    BYTE PTR [eax],al
 3102c8f:	00 36                	add    BYTE PTR [esi],dh
 3102c91:	1d 10 03 3d 1d       	sbb    eax,0x1d3d0310
 3102c96:	10 03                	adc    BYTE PTR [ebx],al
 3102c98:	59                   	pop    ecx
 3102c99:	0a 10                	or     dl,BYTE PTR [eax]
 3102c9b:	03 01                	add    eax,DWORD PTR [ecx]
 3102c9d:	00 00                	add    BYTE PTR [eax],al
 3102c9f:	00 56 1d             	add    BYTE PTR [esi+0x1d],dl
 3102ca2:	10 03                	adc    BYTE PTR [ebx],al
 3102ca4:	5a                   	pop    edx
 3102ca5:	1d 10 03 68 00       	sbb    eax,0x680310
 3102caa:	10 03                	adc    BYTE PTR [ebx],al
 3102cac:	01 00                	add    DWORD PTR [eax],eax
 3102cae:	00 00                	add    BYTE PTR [eax],al
 3102cb0:	76 1d                	jbe    3102ccf <cmds+0xaf>
 3102cb2:	10 03                	adc    BYTE PTR [ebx],al
 3102cb4:	7c 1d                	jl     3102cd3 <cmds+0xb3>
 3102cb6:	10 03                	adc    BYTE PTR [ebx],al
 3102cb8:	ae                   	scas   al,BYTE PTR es:[edi]
 3102cb9:	0c 10                	or     al,0x10
 3102cbb:	03 01                	add    eax,DWORD PTR [ecx]
 3102cbd:	00 00                	add    BYTE PTR [eax],al
 3102cbf:	00 90 1d 10 03 98    	add    BYTE PTR [eax-0x67fcefe3],dl
 3102cc5:	1d 10 03 1b 0a       	sbb    eax,0xa1b0310
 3102cca:	10 03                	adc    BYTE PTR [ebx],al
 3102ccc:	01 00                	add    DWORD PTR [eax],eax
	...

03102ce0 <cmds>:
 3102ce0:	7c 1f                	jl     3102d01 <cmds+0x21>
 3102ce2:	10 03                	adc    BYTE PTR [ebx],al
 3102ce4:	7f 1f                	jg     3102d05 <cmds+0x25>
 3102ce6:	10 03                	adc    BYTE PTR [ebx],al
 3102ce8:	3a 09                	cmp    cl,BYTE PTR [ecx]
 3102cea:	10 03                	adc    BYTE PTR [ebx],al
 3102cec:	01 00                	add    DWORD PTR [eax],eax
 3102cee:	00 00                	add    BYTE PTR [eax],al
 3102cf0:	90                   	nop
 3102cf1:	1f                   	pop    ds
 3102cf2:	10 03                	adc    BYTE PTR [ebx],al
 3102cf4:	96                   	xchg   esi,eax
 3102cf5:	1f                   	pop    ds
 3102cf6:	10 03                	adc    BYTE PTR [ebx],al
 3102cf8:	00 00                	add    BYTE PTR [eax],al
 3102cfa:	10 03                	adc    BYTE PTR [ebx],al
 3102cfc:	00 00                	add    BYTE PTR [eax],al
 3102cfe:	00 00                	add    BYTE PTR [eax],al
 3102d00:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
 3102d01:	1f                   	pop    ds
 3102d02:	10 03                	adc    BYTE PTR [ebx],al
 3102d04:	ab                   	stos   DWORD PTR es:[edi],eax
 3102d05:	1f                   	pop    ds
 3102d06:	10 03                	adc    BYTE PTR [ebx],al
 3102d08:	19 00                	sbb    DWORD PTR [eax],eax
 3102d0a:	10 03                	adc    BYTE PTR [ebx],al
 3102d0c:	00 00                	add    BYTE PTR [eax],al
 3102d0e:	00 00                	add    BYTE PTR [eax],al
 3102d10:	bd 1f 10 03 c2       	mov    ebp,0xc203101f
 3102d15:	1f                   	pop    ds
 3102d16:	10 03                	adc    BYTE PTR [ebx],al
 3102d18:	20 0b                	and    BYTE PTR [ebx],cl
 3102d1a:	10 03                	adc    BYTE PTR [ebx],al
 3102d1c:	01 00                	add    DWORD PTR [eax],eax
 3102d1e:	00 00                	add    BYTE PTR [eax],al
 3102d20:	d4 1f                	aam    0x1f
 3102d22:	10 03                	adc    BYTE PTR [ebx],al
 3102d24:	d9 1f                	fstp   DWORD PTR [edi]
 3102d26:	10 03                	adc    BYTE PTR [ebx],al
 3102d28:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3102d2a:	10 03                	adc    BYTE PTR [ebx],al
 3102d2c:	01 00                	add    DWORD PTR [eax],eax
 3102d2e:	00 00                	add    BYTE PTR [eax],al
 3102d30:	e5 1f                	in     eax,0x1f
 3102d32:	10 03                	adc    BYTE PTR [ebx],al
 3102d34:	ea 1f 10 03 92 0b 10 	jmp    0x100b:0x9203101f
 3102d3b:	03 01                	add    eax,DWORD PTR [ecx]
 3102d3d:	00 00                	add    BYTE PTR [eax],al
 3102d3f:	00 06                	add    BYTE PTR [esi],al
 3102d41:	20 10                	and    BYTE PTR [eax],dl
 3102d43:	03 0a                	add    ecx,DWORD PTR [edx]
 3102d45:	20 10                	and    BYTE PTR [eax],dl
 3102d47:	03 60 0c             	add    esp,DWORD PTR [eax+0xc]
 3102d4a:	10 03                	adc    BYTE PTR [ebx],al
 3102d4c:	00 00                	add    BYTE PTR [eax],al
 3102d4e:	00 00                	add    BYTE PTR [eax],al
 3102d50:	22 20                	and    ah,BYTE PTR [eax]
 3102d52:	10 03                	adc    BYTE PTR [ebx],al
 3102d54:	29 20                	sub    DWORD PTR [eax],esp
 3102d56:	10 03                	adc    BYTE PTR [ebx],al
 3102d58:	59                   	pop    ecx
 3102d59:	0a 10                	or     dl,BYTE PTR [eax]
 3102d5b:	03 01                	add    eax,DWORD PTR [ecx]
 3102d5d:	00 00                	add    BYTE PTR [eax],al
 3102d5f:	00 42 20             	add    BYTE PTR [edx+0x20],al
 3102d62:	10 03                	adc    BYTE PTR [ebx],al
 3102d64:	46                   	inc    esi
 3102d65:	20 10                	and    BYTE PTR [eax],dl
 3102d67:	03 68 00             	add    ebp,DWORD PTR [eax+0x0]
 3102d6a:	10 03                	adc    BYTE PTR [ebx],al
 3102d6c:	01 00                	add    DWORD PTR [eax],eax
 3102d6e:	00 00                	add    BYTE PTR [eax],al
 3102d70:	62 20                	bound  esp,QWORD PTR [eax]
 3102d72:	10 03                	adc    BYTE PTR [ebx],al
 3102d74:	68 20 10 03 ae       	push   0xae031020
 3102d79:	0c 10                	or     al,0x10
 3102d7b:	03 01                	add    eax,DWORD PTR [ecx]
 3102d7d:	00 00                	add    BYTE PTR [eax],al
 3102d7f:	00 7c 20 10          	add    BYTE PTR [eax+eiz*1+0x10],bh
 3102d83:	03 84 20 10 03 1b 0a 	add    eax,DWORD PTR [eax+eiz*1+0xa1b0310]
 3102d8a:	10 03                	adc    BYTE PTR [ebx],al
 3102d8c:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .dynamic:

03102d90 <_DYNAMIC>:
 3102d90:	01 00                	add    DWORD PTR [eax],eax
 3102d92:	00 00                	add    BYTE PTR [eax],al
 3102d94:	01 00                	add    DWORD PTR [eax],eax
 3102d96:	00 00                	add    BYTE PTR [eax],al
 3102d98:	0f 00 00             	sldt   WORD PTR [eax]
 3102d9b:	00 12                	add    BYTE PTR [edx],dl
 3102d9d:	01 00                	add    DWORD PTR [eax],eax
 3102d9f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3102da2:	00 00                	add    BYTE PTR [eax],al
 3102da4:	74 28                	je     3102dce <_DYNAMIC+0x3e>
 3102da6:	10 03                	adc    BYTE PTR [ebx],al
 3102da8:	05 00 00 00 3c       	add    eax,0x3c000000
 3102dad:	27                   	daa    
 3102dae:	10 03                	adc    BYTE PTR [ebx],al
 3102db0:	06                   	push   es
 3102db1:	00 00                	add    BYTE PTR [eax],al
 3102db3:	00 dc                	add    ah,bl
 3102db5:	24 10                	and    al,0x10
 3102db7:	03 0a                	add    ecx,DWORD PTR [edx]
 3102db9:	00 00                	add    BYTE PTR [eax],al
 3102dbb:	00 35 01 00 00 0b    	add    BYTE PTR ds:0xb000001,dh
 3102dc1:	00 00                	add    BYTE PTR [eax],al
 3102dc3:	00 10                	add    BYTE PTR [eax],dl
 3102dc5:	00 00                	add    BYTE PTR [eax],al
 3102dc7:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 3102dcd:	00 00                	add    BYTE PTR [eax],al
 3102dcf:	00 03                	add    BYTE PTR [ebx],al
 3102dd1:	00 00                	add    BYTE PTR [eax],al
 3102dd3:	00 20                	add    BYTE PTR [eax],ah
 3102dd5:	2e 10 03             	adc    BYTE PTR cs:[ebx],al
 3102dd8:	02 00                	add    al,BYTE PTR [eax]
 3102dda:	00 00                	add    BYTE PTR [eax],al
 3102ddc:	28 01                	sub    BYTE PTR [ecx],al
 3102dde:	00 00                	add    BYTE PTR [eax],al
 3102de0:	14 00                	adc    al,0x0
 3102de2:	00 00                	add    BYTE PTR [eax],al
 3102de4:	11 00                	adc    DWORD PTR [eax],eax
 3102de6:	00 00                	add    BYTE PTR [eax],al
 3102de8:	17                   	pop    ss
 3102de9:	00 00                	add    BYTE PTR [eax],al
 3102deb:	00 dc                	add    ah,bl
 3102ded:	2a 10                	sub    dl,BYTE PTR [eax]
 3102def:	03 00                	add    eax,DWORD PTR [eax]
	...

Disassembly of section .got.plt:

03102e20 <_GLOBAL_OFFSET_TABLE_>:
 3102e20:	90                   	nop
 3102e21:	2d 10 03 00 00       	sub    eax,0x310
 3102e26:	00 00                	add    BYTE PTR [eax],al
 3102e28:	00 00                	add    BYTE PTR [eax],al
 3102e2a:	00 00                	add    BYTE PTR [eax],al
 3102e2c:	46                   	inc    esi
 3102e2d:	1a 10                	sbb    dl,BYTE PTR [eax]
 3102e2f:	03 56 1a             	add    edx,DWORD PTR [esi+0x1a]
 3102e32:	10 03                	adc    BYTE PTR [ebx],al
 3102e34:	66                   	data16
 3102e35:	1a 10                	sbb    dl,BYTE PTR [eax]
 3102e37:	03 76 1a             	add    esi,DWORD PTR [esi+0x1a]
 3102e3a:	10 03                	adc    BYTE PTR [ebx],al
 3102e3c:	86 1a                	xchg   BYTE PTR [edx],bl
 3102e3e:	10 03                	adc    BYTE PTR [ebx],al
 3102e40:	96                   	xchg   esi,eax
 3102e41:	1a 10                	sbb    dl,BYTE PTR [eax]
 3102e43:	03 a6 1a 10 03 b6    	add    esp,DWORD PTR [esi-0x49fcefe6]
 3102e49:	1a 10                	sbb    dl,BYTE PTR [eax]
 3102e4b:	03 c6                	add    eax,esi
 3102e4d:	1a 10                	sbb    dl,BYTE PTR [eax]
 3102e4f:	03 d6                	add    edx,esi
 3102e51:	1a 10                	sbb    dl,BYTE PTR [eax]
 3102e53:	03 e6                	add    esp,esi
 3102e55:	1a 10                	sbb    dl,BYTE PTR [eax]
 3102e57:	03 f6                	add    esi,esi
 3102e59:	1a 10                	sbb    dl,BYTE PTR [eax]
 3102e5b:	03 06                	add    eax,DWORD PTR [esi]
 3102e5d:	1b 10                	sbb    edx,DWORD PTR [eax]
 3102e5f:	03 16                	add    edx,DWORD PTR [esi]
 3102e61:	1b 10                	sbb    edx,DWORD PTR [eax]
 3102e63:	03 26                	add    esp,DWORD PTR [esi]
 3102e65:	1b 10                	sbb    edx,DWORD PTR [eax]
 3102e67:	03 36                	add    esi,DWORD PTR [esi]
 3102e69:	1b 10                	sbb    edx,DWORD PTR [eax]
 3102e6b:	03 46 1b             	add    eax,DWORD PTR [esi+0x1b]
 3102e6e:	10 03                	adc    BYTE PTR [ebx],al
 3102e70:	56                   	push   esi
 3102e71:	1b 10                	sbb    edx,DWORD PTR [eax]
 3102e73:	03 66 1b             	add    esp,DWORD PTR [esi+0x1b]
 3102e76:	10 03                	adc    BYTE PTR [ebx],al
 3102e78:	76 1b                	jbe    3102e95 <_GLOBAL_OFFSET_TABLE_+0x75>
 3102e7a:	10 03                	adc    BYTE PTR [ebx],al
 3102e7c:	86 1b                	xchg   BYTE PTR [ebx],bl
 3102e7e:	10 03                	adc    BYTE PTR [ebx],al
 3102e80:	96                   	xchg   esi,eax
 3102e81:	1b 10                	sbb    edx,DWORD PTR [eax]
 3102e83:	03 a6 1b 10 03 b6    	add    esp,DWORD PTR [esi-0x49fcefe5]
 3102e89:	1b 10                	sbb    edx,DWORD PTR [eax]
 3102e8b:	03 c6                	add    eax,esi
 3102e8d:	1b 10                	sbb    edx,DWORD PTR [eax]
 3102e8f:	03 d6                	add    edx,esi
 3102e91:	1b 10                	sbb    edx,DWORD PTR [eax]
 3102e93:	03 e6                	add    esp,esi
 3102e95:	1b 10                	sbb    edx,DWORD PTR [eax]
 3102e97:	03 f6                	add    esi,esi
 3102e99:	1b 10                	sbb    edx,DWORD PTR [eax]
 3102e9b:	03 06                	add    eax,DWORD PTR [esi]
 3102e9d:	1c 10                	sbb    al,0x10
 3102e9f:	03 16                	add    edx,DWORD PTR [esi]
 3102ea1:	1c 10                	sbb    al,0x10
 3102ea3:	03 26                	add    esp,DWORD PTR [esi]
 3102ea5:	1c 10                	sbb    al,0x10
 3102ea7:	03 36                	add    esi,DWORD PTR [esi]
 3102ea9:	1c 10                	sbb    al,0x10
 3102eab:	03 46 1c             	add    eax,DWORD PTR [esi+0x1c]
 3102eae:	10 03                	adc    BYTE PTR [ebx],al
 3102eb0:	56                   	push   esi
 3102eb1:	1c 10                	sbb    al,0x10
 3102eb3:	03 66 1c             	add    esp,DWORD PTR [esi+0x1c]
 3102eb6:	10 03                	adc    BYTE PTR [ebx],al
 3102eb8:	76 1c                	jbe    3102ed6 <environmentLoc+0xa>
 3102eba:	10 03                	adc    BYTE PTR [ebx],al
 3102ebc:	86 1c 10             	xchg   BYTE PTR [eax+edx*1],bl
 3102ebf:	03                   	.byte 0x3

Disassembly of section .bss:

03102ec0 <bSigIntReceived>:
 3102ec0:	00 00                	add    BYTE PTR [eax],al
	...

03102ec4 <delim>:
	...

03102ecc <environmentLoc>:
	...

03102ee0 <cwd>:
	...

03102fe0 <filesToCloseCount>:
	...

03103000 <sExecutingProgram>:
	...

03103200 <command_function_p>:
 3103200:	00 00                	add    BYTE PTR [eax],al
	...

03103204 <filesToClose>:
 3103204:	00 00                	add    BYTE PTR [eax],al
	...

03103208 <heapEnd>:
 3103208:	00 00                	add    BYTE PTR [eax],al
	...

0310320c <heapBase>:
 310320c:	00 00                	add    BYTE PTR [eax],al
	...

03103210 <heapCurr>:
 3103210:	00 00                	add    BYTE PTR [eax],al
	...

03103214 <command_function>:
 3103214:	00 00                	add    BYTE PTR [eax],al
	...

03103218 <processEnvp>:
 3103218:	00 00                	add    BYTE PTR [eax],al
	...

0310321c <lastExecExitCode>:
 310321c:	00 00                	add    BYTE PTR [eax],al
	...

03103220 <exitCode>:
 3103220:	00 00                	add    BYTE PTR [eax],al
	...

03103224 <sKShellProgramName>:
 3103224:	00 00                	add    BYTE PTR [eax],al
	...

03103228 <libcTZ>:
 3103228:	00 00                	add    BYTE PTR [eax],al
	...

0310322c <timeToExit>:
 310322c:	00 00                	add    BYTE PTR [eax],al
	...

03103230 <execPipes>:
	...

03103238 <commandHistoryPtr>:
 3103238:	00 00                	add    BYTE PTR [eax],al
	...

0310323c <commandHistoryMax>:
 310323c:	00 00                	add    BYTE PTR [eax],al
	...

03103240 <commandHistory>:
	...

03112c40 <cpuid_extended_feature_bits>:
 3112c40:	00 00                	add    BYTE PTR [eax],al
	...

03112c44 <cpuid_procinfo>:
	...

03112c60 <lCommand>:
	...

03112d60 <kCmdline>:
 3112d60:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	d9 09                	(bad)  [ecx]
       2:	00 00                	add    BYTE PTR [eax],al
       4:	04 00                	add    al,0x0
       6:	00 00                	add    BYTE PTR [eax],al
       8:	00 00                	add    BYTE PTR [eax],al
       a:	04 01                	add    al,0x1
       c:	2e 01 00             	add    DWORD PTR cs:[eax],eax
       f:	00 0c a1             	add    BYTE PTR [ecx+eiz*4],cl
      12:	02 00                	add    al,BYTE PTR [eax]
      14:	00 fe                	add    dh,bh
      16:	02 00                	add    al,BYTE PTR [eax]
      18:	00 00                	add    BYTE PTR [eax],al
      1a:	00 10                	add    BYTE PTR [eax],dl
      1c:	03 bf 0d 00 00 00    	add    edi,DWORD PTR [edi+0xd]
      22:	00 00                	add    BYTE PTR [eax],al
      24:	00 02                	add    BYTE PTR [edx],al
      26:	01 06                	add    DWORD PTR [esi],eax
      28:	52                   	push   edx
      29:	03 00                	add    eax,DWORD PTR [eax]
      2b:	00 02                	add    BYTE PTR [edx],al
      2d:	02 05 70 03 00 00    	add    al,BYTE PTR ds:0x370
      33:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
      3a:	02 08                	add    cl,BYTE PTR [eax]
      3c:	05 05 01 00 00       	add    eax,0x105
      41:	02 01                	add    al,BYTE PTR [ecx]
      43:	08 50 03             	or     BYTE PTR [eax+0x3],dl
      46:	00 00                	add    BYTE PTR [eax],al
      48:	02 02                	add    al,BYTE PTR [edx]
      4a:	07                   	pop    es
      4b:	22 02                	and    al,BYTE PTR [edx]
      4d:	00 00                	add    BYTE PTR [eax],al
      4f:	04 9f                	add    al,0x9f
      51:	03 00                	add    eax,DWORD PTR [eax]
      53:	00 02                	add    BYTE PTR [edx],al
      55:	34 5a                	xor    al,0x5a
      57:	00 00                	add    BYTE PTR [eax],al
      59:	00 02                	add    BYTE PTR [edx],al
      5b:	04 07                	add    al,0x7
      5d:	95                   	xchg   ebp,eax
      5e:	00 00                	add    BYTE PTR [eax],al
      60:	00 02                	add    BYTE PTR [edx],al
      62:	08 07                	or     BYTE PTR [edi],al
      64:	8b 00                	mov    eax,DWORD PTR [eax]
      66:	00 00                	add    BYTE PTR [eax],al
      68:	04 47                	add    al,0x47
      6a:	00 00                	add    BYTE PTR [eax],al
      6c:	00 02                	add    BYTE PTR [edx],al
      6e:	56                   	push   esi
      6f:	5a                   	pop    edx
      70:	00 00                	add    BYTE PTR [eax],al
      72:	00 02                	add    BYTE PTR [edx],al
      74:	01 06                	add    DWORD PTR [esi],eax
      76:	59                   	pop    ecx
      77:	03 00                	add    eax,DWORD PTR [eax]
      79:	00 02                	add    BYTE PTR [edx],al
      7b:	04 05                	add    al,0x5
      7d:	0a 01                	or     al,BYTE PTR [ecx]
      7f:	00 00                	add    BYTE PTR [eax],al
      81:	05 04 87 00 00       	add    eax,0x8704
      86:	00 06                	add    BYTE PTR [esi],al
      88:	73 00                	jae    8a <cmdClearScreen-0x30fff76>
      8a:	00 00                	add    BYTE PTR [eax],al
      8c:	02 01                	add    al,BYTE PTR [ecx]
      8e:	02 37                	add    dh,BYTE PTR [edi]
      90:	03 00                	add    eax,DWORD PTR [eax]
      92:	00 02                	add    BYTE PTR [edx],al
      94:	04 07                	add    al,0x7
      96:	c5 02                	lds    eax,FWORD PTR [edx]
      98:	00 00                	add    BYTE PTR [eax],al
      9a:	07                   	pop    es
      9b:	83 02 00             	add    DWORD PTR [edx],0x0
      9e:	00 08                	add    BYTE PTR [eax],cl
      a0:	03 24 bf             	add    esp,DWORD PTR [edi+edi*4]
      a3:	00 00                	add    BYTE PTR [eax],al
      a5:	00 08                	add    BYTE PTR [eax],cl
      a7:	10 04 00             	adc    BYTE PTR [eax+eax*1],al
      aa:	00 03                	add    BYTE PTR [ebx],al
      ac:	26                   	es
      ad:	4f                   	dec    edi
      ae:	00 00                	add    BYTE PTR [eax],al
      b0:	00 00                	add    BYTE PTR [eax],al
      b2:	08 cd                	or     ch,cl
      b4:	01 00                	add    DWORD PTR [eax],eax
      b6:	00 03                	add    BYTE PTR [ebx],al
      b8:	27                   	daa    
      b9:	4f                   	dec    edi
      ba:	00 00                	add    BYTE PTR [eax],al
      bc:	00 04 00             	add    BYTE PTR [eax+eax*1],al
      bf:	04 2a                	add    al,0x2a
      c1:	00 00                	add    BYTE PTR [eax],al
      c3:	00 03                	add    BYTE PTR [ebx],al
      c5:	2b 9a 00 00 00 09    	sub    ebx,DWORD PTR [edx+0x9000000]
      cb:	04 0a                	add    al,0xa
      cd:	c1 03 00             	rol    DWORD PTR [ebx],0x0
      d0:	00 04 5a             	add    BYTE PTR [edx+ebx*2],al
      d3:	00 00                	add    BYTE PTR [eax],al
      d5:	00 07                	add    BYTE PTR [edi],al
      d7:	15 07 01 00 00       	adc    eax,0x107
      dc:	0b 08                	or     ecx,DWORD PTR [eax]
      de:	00 00                	add    BYTE PTR [eax],al
      e0:	00 01                	add    BYTE PTR [ecx],al
      e2:	0b 26                	or     esp,DWORD PTR [esi]
      e4:	03 00                	add    eax,DWORD PTR [eax]
      e6:	00 02                	add    BYTE PTR [edx],al
      e8:	0b 32                	or     esi,DWORD PTR [edx]
      ea:	00 00                	add    BYTE PTR [eax],al
      ec:	00 04 0b             	add    BYTE PTR [ebx+ecx*1],al
      ef:	07                   	pop    es
      f0:	02 00                	add    al,BYTE PTR [eax]
      f2:	00 08                	add    BYTE PTR [eax],cl
      f4:	0b 40 02             	or     eax,DWORD PTR [eax+0x2]
      f7:	00 00                	add    BYTE PTR [eax],al
      f9:	10 0b                	adc    BYTE PTR [ebx],cl
      fb:	a8 03                	test   al,0x3
      fd:	00 00                	add    BYTE PTR [eax],al
      ff:	20 0b                	and    BYTE PTR [ebx],cl
     101:	bf 02 00 00 40       	mov    edi,0x40000002
     106:	00 0c 10             	add    BYTE PTR [eax+edx*1],cl
     109:	04 1a                	add    al,0x1a
     10b:	40                   	inc    eax
     10c:	01 00                	add    DWORD PTR [eax],eax
     10e:	00 08                	add    BYTE PTR [eax],cl
     110:	17                   	pop    ss
     111:	02 00                	add    al,BYTE PTR [eax]
     113:	00 04 1c             	add    BYTE PTR [esp+ebx*1],al
     116:	40                   	inc    eax
     117:	01 00                	add    DWORD PTR [eax],eax
     119:	00 00                	add    BYTE PTR [eax],al
     11b:	08 95 02 00 00 04    	or     BYTE PTR [ebp+0x4000002],dl
     121:	1d 40 01 00 00       	sbb    eax,0x140
     126:	04 08                	add    al,0x8
     128:	59                   	pop    ecx
     129:	00 00                	add    BYTE PTR [eax],al
     12b:	00 04 1e             	add    BYTE PTR [esi+ebx*1],al
     12e:	ca 00 00             	retf   0x0
     131:	00 08                	add    BYTE PTR [eax],cl
     133:	08 f3                	or     bl,dh
     135:	03 00                	add    eax,DWORD PTR [eax]
     137:	00 04 1f             	add    BYTE PTR [edi+ebx*1],al
     13a:	33 00                	xor    eax,DWORD PTR [eax]
     13c:	00 00                	add    BYTE PTR [eax],al
     13e:	0c 00                	or     al,0x0
     140:	05 04 73 00 00       	add    eax,0x7304
     145:	00 04 ac             	add    BYTE PTR [esp+ebp*4],al
     148:	01 00                	add    DWORD PTR [eax],eax
     14a:	00 04 20             	add    BYTE PTR [eax+eiz*1],al
     14d:	07                   	pop    es
     14e:	01 00                	add    DWORD PTR [eax],eax
     150:	00 0d 90 03 00 00    	add    BYTE PTR ds:0x390,cl
     156:	01 0c 00             	add    DWORD PTR [eax+eax*1],ecx
     159:	00 10                	add    BYTE PTR [eax],dl
     15b:	03 19                	add    ebx,DWORD PTR [ecx]
     15d:	00 00                	add    BYTE PTR [eax],al
     15f:	00 01                	add    BYTE PTR [ecx],al
     161:	9c                   	pushf  
     162:	0e                   	push   cs
     163:	3d 04 00 00 01       	cmp    eax,0x1000004
     168:	11 19                	adc    DWORD PTR [ecx],ebx
     16a:	00 10                	add    BYTE PTR [eax],dl
     16c:	03 4f 00             	add    ecx,DWORD PTR [edi+0x0]
     16f:	00 00                	add    BYTE PTR [eax],al
     171:	01 9c 90 01 00 00 0f 	add    DWORD PTR [eax+edx*4+0xf000001],ebx
     178:	1f                   	pop    ds
     179:	00 10                	add    BYTE PTR [eax],dl
     17b:	03 46 00             	add    eax,DWORD PTR [esi+0x0]
     17e:	00 00                	add    BYTE PTR [eax],al
     180:	10 63 6e             	adc    BYTE PTR [ebx+0x6e],ah
     183:	74 00                	je     185 <cmdClearScreen-0x30ffe7b>
     185:	01 13                	add    DWORD PTR [ebx],edx
     187:	33 00                	xor    eax,DWORD PTR [eax]
     189:	00 00                	add    BYTE PTR [eax],al
     18b:	02 91 6c 00 00 11    	add    dl,BYTE PTR [ecx+0x1100006c]
     191:	fb                   	sti    
     192:	00 00                	add    BYTE PTR [eax],al
     194:	00 01                	add    BYTE PTR [ecx],al
     196:	1d 68 00 10 03       	sbb    eax,0x3100068
     19b:	5d                   	pop    ebp
     19c:	01 00                	add    DWORD PTR [eax],eax
     19e:	00 01                	add    BYTE PTR [ecx],al
     1a0:	9c                   	pushf  
     1a1:	13 02                	adc    eax,DWORD PTR [edx]
     1a3:	00 00                	add    BYTE PTR [eax],al
     1a5:	12 c5                	adc    al,ch
     1a7:	01 00                	add    DWORD PTR [eax],eax
     1a9:	00 01                	add    BYTE PTR [ecx],al
     1ab:	1d 40 01 00 00       	sbb    eax,0x140
     1b0:	02 91 00 13 ca 03    	add    dl,BYTE PTR [ecx+0x3ca1300]
     1b6:	00 00                	add    BYTE PTR [eax],al
     1b8:	01 1f                	add    DWORD PTR [edi],ebx
     1ba:	13 02                	adc    eax,DWORD PTR [edx]
     1bc:	00 00                	add    BYTE PTR [eax],al
     1be:	03 91 dc 75 13 23    	add    edx,DWORD PTR [ecx+0x231375dc]
     1c4:	04 00                	add    al,0x0
     1c6:	00 01                	add    BYTE PTR [ecx],al
     1c8:	20 40 01             	and    BYTE PTR [eax+0x1],al
     1cb:	00 00                	add    BYTE PTR [eax],al
     1cd:	02 91 60 13 9a 01    	add    dl,BYTE PTR [ecx+0x19a1360]
     1d3:	00 00                	add    BYTE PTR [eax],al
     1d5:	01 20                	add    DWORD PTR [eax],esp
     1d7:	40                   	inc    eax
     1d8:	01 00                	add    DWORD PTR [eax],eax
     1da:	00 02                	add    BYTE PTR [edx],al
     1dc:	91                   	xchg   ecx,eax
     1dd:	5c                   	pop    esp
     1de:	0f 93 00             	setae  BYTE PTR [eax]
     1e1:	10 03                	adc    BYTE PTR [ebx],al
     1e3:	29 01                	sub    DWORD PTR [ecx],eax
     1e5:	00 00                	add    BYTE PTR [eax],al
     1e7:	13 f0                	adc    esi,eax
     1e9:	02 00                	add    al,BYTE PTR [eax]
     1eb:	00 01                	add    BYTE PTR [ecx],al
     1ed:	24 33                	and    al,0x33
     1ef:	00 00                	add    BYTE PTR [eax],al
     1f1:	00 02                	add    BYTE PTR [edx],al
     1f3:	91                   	xchg   ecx,eax
     1f4:	6c                   	ins    BYTE PTR es:[edi],dx
     1f5:	13 49 04             	adc    ecx,DWORD PTR [ecx+0x4]
     1f8:	00 00                	add    BYTE PTR [eax],al
     1fa:	01 24 33             	add    DWORD PTR [ebx+esi*1],esp
     1fd:	00 00                	add    BYTE PTR [eax],al
     1ff:	00 02                	add    BYTE PTR [edx],al
     201:	91                   	xchg   ecx,eax
     202:	68 13 ed 03 00       	push   0x3ed13
     207:	00 01                	add    BYTE PTR [ecx],al
     209:	25 33 00 00 00       	and    eax,0x33
     20e:	02 91 64 00 00 14    	add    dl,BYTE PTR [ecx+0x14000064]
     214:	73 00                	jae    216 <cmdClearScreen-0x30ffdea>
     216:	00 00                	add    BYTE PTR [eax],al
     218:	29 02                	sub    DWORD PTR [edx],eax
     21a:	00 00                	add    BYTE PTR [eax],al
     21c:	15 93 00 00 00       	adc    eax,0x93
     221:	09 15 93 00 00 00    	or     DWORD PTR ds:0x93,edx
     227:	7f 00                	jg     229 <cmdClearScreen-0x30ffdd7>
     229:	16                   	push   ss
     22a:	e9 02 00 00 01       	jmp    1000231 <cmdClearScreen-0x20ffdcf>
     22f:	3c 33                	cmp    al,0x33
     231:	00 00                	add    BYTE PTR [eax],al
     233:	00 c5                	add    ch,al
     235:	01 10                	add    DWORD PTR [eax],edx
     237:	03 8b 00 00 00 01    	add    ecx,DWORD PTR [ebx+0x1000000]
     23d:	9c                   	pushf  
     23e:	a1 02 00 00 12       	mov    eax,ds:0x12000002
     243:	7d 00                	jge    245 <cmdClearScreen-0x30ffdbb>
     245:	00 00                	add    BYTE PTR [eax],al
     247:	01 3c 40             	add    DWORD PTR [eax+eax*2],edi
     24a:	01 00                	add    DWORD PTR [eax],eax
     24c:	00 02                	add    BYTE PTR [edx],al
     24e:	91                   	xchg   ecx,eax
     24f:	00 12                	add    BYTE PTR [edx],dl
     251:	48                   	dec    eax
     252:	06                   	push   es
     253:	00 00                	add    BYTE PTR [eax],al
     255:	01 3c 33             	add    DWORD PTR [ebx+esi*1],edi
     258:	00 00                	add    BYTE PTR [eax],al
     25a:	00 02                	add    BYTE PTR [edx],al
     25c:	91                   	xchg   ecx,eax
     25d:	04 12                	add    al,0x12
     25f:	03 05 00 00 01 3c    	add    eax,DWORD PTR ds:0x3c010000
     265:	a1 02 00 00 02       	mov    eax,ds:0x2000002
     26a:	91                   	xchg   ecx,eax
     26b:	08 12                	or     BYTE PTR [edx],dl
     26d:	52                   	push   edx
     26e:	04 00                	add    al,0x0
     270:	00 01                	add    BYTE PTR [ecx],al
     272:	3c 8c                	cmp    al,0x8c
     274:	00 00                	add    BYTE PTR [eax],al
     276:	00 02                	add    BYTE PTR [edx],al
     278:	91                   	xchg   ecx,eax
     279:	5c                   	pop    esp
     27a:	10 70 69             	adc    BYTE PTR [eax+0x69],dh
     27d:	64 00 01             	add    BYTE PTR fs:[ecx],al
     280:	3e 33 00             	xor    eax,DWORD PTR ds:[eax]
     283:	00 00                	add    BYTE PTR [eax],al
     285:	02 91 6c 0f f9 01    	add    dl,BYTE PTR [ecx+0x1f90f6c]
     28b:	10 03                	adc    BYTE PTR [ebx],al
     28d:	41                   	inc    ecx
     28e:	00 00                	add    BYTE PTR [eax],al
     290:	00 10                	add    BYTE PTR [eax],dl
     292:	72 65                	jb     2f9 <cmdClearScreen-0x30ffd07>
     294:	74 00                	je     296 <cmdClearScreen-0x30ffd6a>
     296:	01 46 a7             	add    DWORD PTR [esi-0x59],eax
     299:	02 00                	add    al,BYTE PTR [eax]
     29b:	00 02                	add    BYTE PTR [edx],al
     29d:	91                   	xchg   ecx,eax
     29e:	62 00                	bound  eax,QWORD PTR [eax]
     2a0:	00 05 04 40 01 00    	add    BYTE PTR ds:0x14004,al
     2a6:	00 14 73             	add    BYTE PTR [ebx+esi*2],dl
     2a9:	00 00                	add    BYTE PTR [eax],al
     2ab:	00 b7 02 00 00 15    	add    BYTE PTR [edi+0x15000002],dh
     2b1:	93                   	xchg   ebx,eax
     2b2:	00 00                	add    BYTE PTR [eax],al
     2b4:	00 09                	add    BYTE PTR [ecx],cl
     2b6:	00 16                	add    BYTE PTR [esi],dl
     2b8:	b1 00                	mov    cl,0x0
     2ba:	00 00                	add    BYTE PTR [eax],al
     2bc:	01 50 33             	add    DWORD PTR [eax+0x33],edx
     2bf:	00 00                	add    BYTE PTR [eax],al
     2c1:	00 50 02             	add    BYTE PTR [eax+0x2],dl
     2c4:	10 03                	adc    BYTE PTR [ebx],al
     2c6:	26 02 00             	add    al,BYTE PTR es:[eax]
     2c9:	00 01                	add    BYTE PTR [ecx],al
     2cb:	9c                   	pushf  
     2cc:	83 03 00             	add    DWORD PTR [ebx],0x0
     2cf:	00 12                	add    BYTE PTR [edx],dl
     2d1:	e7 00                	out    0x0,eax
     2d3:	00 00                	add    BYTE PTR [eax],al
     2d5:	01 50 81             	add    DWORD PTR [eax-0x7f],edx
     2d8:	00 00                	add    BYTE PTR [eax],al
     2da:	00 02                	add    BYTE PTR [edx],al
     2dc:	91                   	xchg   ecx,eax
     2dd:	00 12                	add    BYTE PTR [edx],dl
     2df:	e1 02                	loope  2e3 <cmdClearScreen-0x30ffd1d>
     2e1:	00 00                	add    BYTE PTR [eax],al
     2e3:	01 50 40             	add    DWORD PTR [eax+0x40],edx
     2e6:	01 00                	add    DWORD PTR [eax],eax
     2e8:	00 02                	add    BYTE PTR [edx],al
     2ea:	91                   	xchg   ecx,eax
     2eb:	04 13                	add    al,0x13
     2ed:	7a 03                	jp     2f2 <cmdClearScreen-0x30ffd0e>
     2ef:	00 00                	add    BYTE PTR [eax],al
     2f1:	01 52 83             	add    DWORD PTR [edx-0x7d],edx
     2f4:	03 00                	add    eax,DWORD PTR [eax]
     2f6:	00 02                	add    BYTE PTR [edx],al
     2f8:	91                   	xchg   ecx,eax
     2f9:	52                   	push   edx
     2fa:	13 e7                	adc    esp,edi
     2fc:	03 00                	add    eax,DWORD PTR [eax]
     2fe:	00 01                	add    BYTE PTR [ecx],al
     300:	53                   	push   ebx
     301:	40                   	inc    eax
     302:	01 00                	add    DWORD PTR [eax],eax
     304:	00 02                	add    BYTE PTR [edx],al
     306:	91                   	xchg   ecx,eax
     307:	6c                   	ins    BYTE PTR es:[edi],dx
     308:	13 fe                	adc    edi,esi
     30a:	03 00                	add    eax,DWORD PTR [eax]
     30c:	00 01                	add    BYTE PTR [ecx],al
     30e:	54                   	push   esp
     30f:	40                   	inc    eax
     310:	01 00                	add    DWORD PTR [eax],eax
     312:	00 02                	add    BYTE PTR [edx],al
     314:	91                   	xchg   ecx,eax
     315:	5c                   	pop    esp
     316:	13 2f                	adc    ebp,DWORD PTR [edi]
     318:	03 00                	add    eax,DWORD PTR [eax]
     31a:	00 01                	add    BYTE PTR [ecx],al
     31c:	55                   	push   ebp
     31d:	40                   	inc    eax
     31e:	01 00                	add    DWORD PTR [eax],eax
     320:	00 02                	add    BYTE PTR [edx],al
     322:	91                   	xchg   ecx,eax
     323:	68 13 00 00 00       	push   0x13
     328:	00 01                	add    BYTE PTR [ecx],al
     32a:	56                   	push   esi
     32b:	40                   	inc    eax
     32c:	01 00                	add    DWORD PTR [eax],eax
     32e:	00 02                	add    BYTE PTR [edx],al
     330:	91                   	xchg   ecx,eax
     331:	64 13 23             	adc    esp,DWORD PTR fs:[ebx]
     334:	00 00                	add    BYTE PTR [eax],al
     336:	00 01                	add    BYTE PTR [ecx],al
     338:	57                   	push   edi
     339:	33 00                	xor    eax,DWORD PTR [eax]
     33b:	00 00                	add    BYTE PTR [eax],al
     33d:	02 91 60 13 84 02    	add    dl,BYTE PTR [ecx+0x2841360]
     343:	00 00                	add    BYTE PTR [eax],al
     345:	01 58 bf             	add    DWORD PTR [eax-0x41],ebx
     348:	00 00                	add    BYTE PTR [eax],al
     34a:	00 02                	add    BYTE PTR [edx],al
     34c:	91                   	xchg   ecx,eax
     34d:	48                   	dec    eax
     34e:	17                   	pop    ss
     34f:	3d 03 10 03 7e       	cmp    eax,0x7e031003
     354:	00 00                	add    BYTE PTR [eax],al
     356:	00 6a 03             	add    BYTE PTR [edx+0x3],ch
     359:	00 00                	add    BYTE PTR [eax],al
     35b:	10 72 65             	adc    BYTE PTR [edx+0x65],dh
     35e:	73 00                	jae    360 <cmdClearScreen-0x30ffca0>
     360:	01 76 33             	add    DWORD PTR [esi+0x33],esi
     363:	00 00                	add    BYTE PTR [eax],al
     365:	00 02                	add    BYTE PTR [edx],al
     367:	91                   	xchg   ecx,eax
     368:	58                   	pop    eax
     369:	00 0f                	add    BYTE PTR [edi],cl
     36b:	cb                   	retf   
     36c:	03 10                	add    edx,DWORD PTR [eax]
     36e:	03 6a 00             	add    ebp,DWORD PTR [edx+0x0]
     371:	00 00                	add    BYTE PTR [eax],al
     373:	10 72 65             	adc    BYTE PTR [edx+0x65],dh
     376:	73 00                	jae    378 <cmdClearScreen-0x30ffc88>
     378:	01 85 33 00 00 00    	add    DWORD PTR [ebp+0x33],eax
     37e:	02 91 54 00 00 14    	add    dl,BYTE PTR [ecx+0x14000054]
     384:	73 00                	jae    386 <cmdClearScreen-0x30ffc7a>
     386:	00 00                	add    BYTE PTR [eax],al
     388:	93                   	xchg   ebx,eax
     389:	03 00                	add    eax,DWORD PTR [eax]
     38b:	00 15 93 00 00 00    	add    BYTE PTR ds:0x93,dl
     391:	01 00                	add    DWORD PTR [eax],eax
     393:	16                   	push   ss
     394:	1c 02                	sbb    al,0x2
     396:	00 00                	add    BYTE PTR [eax],al
     398:	01 98 33 00 00 00    	add    DWORD PTR [eax+0x33],ebx
     39e:	76 04                	jbe    3a4 <cmdClearScreen-0x30ffc5c>
     3a0:	10 03                	adc    BYTE PTR [ebx],al
     3a2:	c4 04 00             	les    eax,FWORD PTR [eax+eax*1]
     3a5:	00 01                	add    BYTE PTR [ecx],al
     3a7:	9c                   	pushf  
     3a8:	8e 05 00 00 12 c5    	mov    es,WORD PTR ds:0xc5120000
     3ae:	01 00                	add    DWORD PTR [eax],eax
     3b0:	00 01                	add    BYTE PTR [ecx],al
     3b2:	98                   	cwde   
     3b3:	40                   	inc    eax
     3b4:	01 00                	add    DWORD PTR [eax],eax
     3b6:	00 02                	add    BYTE PTR [edx],al
     3b8:	91                   	xchg   ecx,eax
     3b9:	00 12                	add    BYTE PTR [edx],dl
     3bb:	e1 01                	loope  3be <cmdClearScreen-0x30ffc42>
     3bd:	00 00                	add    BYTE PTR [eax],al
     3bf:	01 98 33 00 00 00    	add    DWORD PTR [eax+0x33],ebx
     3c5:	02 91 04 12 dc 03    	add    dl,BYTE PTR [ecx+0x3dc1204]
     3cb:	00 00                	add    BYTE PTR [eax],al
     3cd:	01 98 33 00 00 00    	add    DWORD PTR [eax+0x33],ebx
     3d3:	02 91 08 12 78 02    	add    dl,BYTE PTR [ecx+0x2781208]
     3d9:	00 00                	add    BYTE PTR [eax],al
     3db:	01 98 33 00 00 00    	add    DWORD PTR [eax+0x33],ebx
     3e1:	02 91 0c 13 52 04    	add    dl,BYTE PTR [ecx+0x452130c]
     3e7:	00 00                	add    BYTE PTR [eax],al
     3e9:	01 9a 8c 00 00 00    	add    DWORD PTR [edx+0x8c],ebx
     3ef:	02 91 6f 13 68 03    	add    dl,BYTE PTR [ecx+0x368136f]
     3f5:	00 00                	add    BYTE PTR [eax],al
     3f7:	01 9b 33 00 00 00    	add    DWORD PTR [ebx+0x33],ebx
     3fd:	02 91 44 18 74 6f    	add    dl,BYTE PTR [ecx+0x6f741844]
     403:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
     406:	9c                   	pushf  
     407:	40                   	inc    eax
     408:	01 00                	add    DWORD PTR [eax],eax
     40a:	00 10                	add    BYTE PTR [eax],dl
     40c:	70 67                	jo     475 <cmdClearScreen-0x30ffb8b>
     40e:	6d                   	ins    DWORD PTR es:[edi],dx
     40f:	00 01                	add    BYTE PTR [ecx],al
     411:	9d                   	popf   
     412:	40                   	inc    eax
     413:	01 00                	add    DWORD PTR [eax],eax
     415:	00 02                	add    BYTE PTR [edx],al
     417:	91                   	xchg   ecx,eax
     418:	40                   	inc    eax
     419:	13 84 01 00 00 01 9e 	adc    eax,DWORD PTR [ecx+eax*1-0x61ff0000]
     420:	8e 05 00 00 03 91    	mov    es,WORD PTR ds:0x91030000
     426:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
     427:	7d 13                	jge    43c <cmdClearScreen-0x30ffbc4>
     429:	ca 03 00             	retf   0x3
     42c:	00 01                	add    BYTE PTR [ecx],al
     42e:	9f                   	lahf   
     42f:	13 02                	adc    eax,DWORD PTR [edx]
     431:	00 00                	add    BYTE PTR [eax],al
     433:	03 91 a4 73 13 d1    	add    edx,DWORD PTR [ecx-0x2eec8c5c]
     439:	03 00                	add    eax,DWORD PTR [eax]
     43b:	00 01                	add    BYTE PTR [ecx],al
     43d:	a0 40 01 00 00       	mov    al,ds:0x140
     442:	03 91 bc 7f 13 62    	add    edx,DWORD PTR [ecx+0x62137fbc]
     448:	02 00                	add    al,BYTE PTR [eax]
     44a:	00 01                	add    BYTE PTR [ecx],al
     44c:	a0 40 01 00 00       	mov    al,ds:0x140
     451:	03 91 b8 7f 13 fc    	add    edx,DWORD PTR [ecx-0x3ec8048]
     457:	01 00                	add    DWORD PTR [eax],eax
     459:	00 01                	add    BYTE PTR [ecx],al
     45b:	a1 40 01 00 00       	mov    eax,ds:0x140
     460:	03 91 b4 7f 13 06    	add    edx,DWORD PTR [ecx+0x6137fb4]
     466:	04 00                	add    al,0x0
     468:	00 01                	add    BYTE PTR [ecx],al
     46a:	a2 40 01 00 00       	mov    ds:0x140,al
     46f:	02 91 68 13 35 02    	add    dl,BYTE PTR [ecx+0x2351368]
     475:	00 00                	add    BYTE PTR [eax],al
     477:	01 a2 40 01 00 00    	add    DWORD PTR [edx+0x140],esp
     47d:	03 91 b0 7f 13 3c    	add    edx,DWORD PTR [ecx+0x3c137fb0]
     483:	00 00                	add    BYTE PTR [eax],al
     485:	00 01                	add    BYTE PTR [ecx],al
     487:	a2 40 01 00 00       	mov    ds:0x140,al
     48c:	03 91 ac 7f 13 48    	add    edx,DWORD PTR [ecx+0x48137fac]
     492:	06                   	push   es
     493:	00 00                	add    BYTE PTR [eax],al
     495:	01 a3 33 00 00 00    	add    DWORD PTR [ebx+0x33],esp
     49b:	03 91 a0 73 13 03    	add    edx,DWORD PTR [ecx+0x31373a0]
     4a1:	05 00 00 01 a4       	add    eax,0xa4010000
     4a6:	a1 02 00 00 03       	mov    eax,ds:0x3000002
     4ab:	91                   	xchg   ecx,eax
     4ac:	a8 7f                	test   al,0x7f
     4ae:	13 23                	adc    esp,DWORD PTR [ebx]
     4b0:	00 00                	add    BYTE PTR [eax],al
     4b2:	00 01                	add    BYTE PTR [ecx],al
     4b4:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
     4b5:	33 00                	xor    eax,DWORD PTR [eax]
     4b7:	00 00                	add    BYTE PTR [eax],al
     4b9:	02 91 64 13 b5 05    	add    dl,BYTE PTR [ecx+0x5b51364]
     4bf:	00 00                	add    BYTE PTR [eax],al
     4c1:	01 a6 40 01 00 00    	add    DWORD PTR [esi+0x140],esp
     4c7:	02 91 60 13 db 00    	add    dl,BYTE PTR [ecx+0xdb1360]
     4cd:	00 00                	add    BYTE PTR [eax],al
     4cf:	01 a7 8c 00 00 00    	add    DWORD PTR [edi+0x8c],esp
     4d5:	02 91 5f 13 a7 00    	add    dl,BYTE PTR [ecx+0xa7135f]
     4db:	00 00                	add    BYTE PTR [eax],al
     4dd:	01 a8 33 00 00 00    	add    DWORD PTR [eax+0x33],ebp
     4e3:	02 91 58 13 8a 02    	add    dl,BYTE PTR [ecx+0x28a1358]
     4e9:	00 00                	add    BYTE PTR [eax],al
     4eb:	01 a8 33 00 00 00    	add    DWORD PTR [eax+0x33],ebp
     4f1:	02 91 54 19 62 00    	add    dl,BYTE PTR [ecx+0x621954]
     4f7:	00 00                	add    BYTE PTR [eax],al
     4f9:	01 1d 01 b7 08 10    	add    DWORD PTR ds:0x1008b701,ebx
     4ff:	03 17                	add    edx,DWORD PTR [edi]
     501:	50                   	push   eax
     502:	05 10 03 a6 00       	add    eax,0xa60310
     507:	00 00                	add    BYTE PTR [eax],al
     509:	2a 05 00 00 13 37    	sub    al,BYTE PTR ds:0x37130000
     50f:	04 00                	add    al,0x0
     511:	00 01                	add    BYTE PTR [ecx],al
     513:	b8 40 01 00 00       	mov    eax,0x140
     518:	02 91 50 10 65 6e    	add    dl,BYTE PTR [ecx+0x6e651050]
     51e:	64 00 01             	add    BYTE PTR fs:[ecx],al
     521:	bb 40 01 00 00       	mov    ebx,0x140
     526:	02 91 4c 00 17 35    	add    dl,BYTE PTR [ecx+0x3517004c]
     52c:	06                   	push   es
     52d:	10 03                	adc    BYTE PTR [ebx],al
     52f:	6e                   	outs   dx,BYTE PTR ds:[esi]
     530:	00 00                	add    BYTE PTR [eax],al
     532:	00 47 05             	add    BYTE PTR [edi+0x5],al
     535:	00 00                	add    BYTE PTR [eax],al
     537:	13 84 02 00 00 01 d0 	adc    eax,DWORD PTR [edx+eax*1-0x2fff0000]
     53e:	bf 00 00 00 03       	mov    edi,0x3000000
     543:	91                   	xchg   ecx,eax
     544:	98                   	cwde   
     545:	73 00                	jae    547 <cmdClearScreen-0x30ffab9>
     547:	17                   	pop    ss
     548:	33 07                	xor    eax,DWORD PTR [edi]
     54a:	10 03                	adc    BYTE PTR [ebx],al
     54c:	f2 00 00             	repnz add BYTE PTR [eax],al
     54f:	00 73 05             	add    BYTE PTR [ebx+0x5],dh
     552:	00 00                	add    BYTE PTR [eax],al
     554:	13 23                	adc    esp,DWORD PTR [ebx]
     556:	00 00                	add    BYTE PTR [eax],al
     558:	00 01                	add    BYTE PTR [ecx],al
     55a:	f2 33 00             	repnz xor eax,DWORD PTR [eax]
     55d:	00 00                	add    BYTE PTR [eax],al
     55f:	02 91 48 1a a3 01    	add    dl,BYTE PTR [ecx+0x1a31a48]
     565:	00 00                	add    BYTE PTR [eax],al
     567:	01 04 01             	add    DWORD PTR [ecx+eax*1],eax
     56a:	33 00                	xor    eax,DWORD PTR [eax]
     56c:	00 00                	add    BYTE PTR [eax],al
     56e:	03 91 a4 7f 00 0f    	add    edx,DWORD PTR [ecx+0xf007fa4]
     574:	45                   	inc    ebp
     575:	08 10                	or     BYTE PTR [eax],dl
     577:	03 72 00             	add    esi,DWORD PTR [edx+0x0]
     57a:	00 00                	add    BYTE PTR [eax],al
     57c:	1b 72 65             	sbb    esi,DWORD PTR [edx+0x65]
     57f:	74 00                	je     581 <cmdClearScreen-0x30ffa7f>
     581:	01 18                	add    DWORD PTR [eax],ebx
     583:	01 a7 02 00 00 03    	add    DWORD PTR [edi+0x3000002],esp
     589:	91                   	xchg   ecx,eax
     58a:	8e 73 00             	mov    ?,WORD PTR [ebx+0x0]
     58d:	00 14 73             	add    BYTE PTR [ebx+esi*2],dl
     590:	00 00                	add    BYTE PTR [eax],al
     592:	00 9e 05 00 00 15    	add    BYTE PTR [esi+0x15000005],bl
     598:	93                   	xchg   ebx,eax
     599:	00 00                	add    BYTE PTR [eax],al
     59b:	00 ff                	add    bh,bh
     59d:	00 1c 48             	add    BYTE PTR [eax+ecx*2],bl
     5a0:	02 00                	add    al,BYTE PTR [eax]
     5a2:	00 01                	add    BYTE PTR [ecx],al
     5a4:	2e 01 3a             	add    DWORD PTR cs:[edx],edi
     5a7:	09 10                	or     DWORD PTR [eax],edx
     5a9:	03 e1                	add    esp,ecx
     5ab:	00 00                	add    BYTE PTR [eax],al
     5ad:	00 01                	add    BYTE PTR [ecx],al
     5af:	9c                   	pushf  
     5b0:	f1                   	icebp  
     5b1:	05 00 00 1d c5       	add    eax,0xc51d0000
     5b6:	01 00                	add    DWORD PTR [eax],eax
     5b8:	00 01                	add    BYTE PTR [ecx],al
     5ba:	2e 01 40 01          	add    DWORD PTR cs:[eax+0x1],eax
     5be:	00 00                	add    BYTE PTR [eax],al
     5c0:	02 91 00 1a 84 02    	add    dl,BYTE PTR [ecx+0x2841a00]
     5c6:	00 00                	add    BYTE PTR [eax],al
     5c8:	01 30                	add    DWORD PTR [eax],esi
     5ca:	01 bf 00 00 00 02    	add    DWORD PTR [edi+0x2000000],edi
     5d0:	91                   	xchg   ecx,eax
     5d1:	60                   	pusha  
     5d2:	1a c4                	sbb    al,ah
     5d4:	01 00                	add    DWORD PTR [eax],eax
     5d6:	00 01                	add    BYTE PTR [ecx],al
     5d8:	31 01                	xor    DWORD PTR [ecx],eax
     5da:	40                   	inc    eax
     5db:	01 00                	add    DWORD PTR [eax],eax
     5dd:	00 02                	add    BYTE PTR [edx],al
     5df:	91                   	xchg   ecx,eax
     5e0:	68 1a f8 02 00       	push   0x2f81a
     5e5:	00 01                	add    BYTE PTR [ecx],al
     5e7:	32 01                	xor    al,BYTE PTR [ecx]
     5e9:	8c 00                	mov    WORD PTR [eax],es
     5eb:	00 00                	add    BYTE PTR [eax],al
     5ed:	02 91 6f 00 1c bc    	add    dl,BYTE PTR [ecx-0x43e3ff91]
     5f3:	01 00                	add    DWORD PTR [eax],eax
     5f5:	00 01                	add    BYTE PTR [ecx],al
     5f7:	48                   	dec    eax
     5f8:	01 1b                	add    DWORD PTR [ebx],ebx
     5fa:	0a 10                	or     dl,BYTE PTR [eax]
     5fc:	03 3e                	add    edi,DWORD PTR [esi]
     5fe:	00 00                	add    BYTE PTR [eax],al
     600:	00 01                	add    BYTE PTR [ecx],al
     602:	9c                   	pushf  
     603:	35 06 00 00 1d       	xor    eax,0x1d000006
     608:	c5 01                	lds    eax,FWORD PTR [ecx]
     60a:	00 00                	add    BYTE PTR [eax],al
     60c:	01 48 01             	add    DWORD PTR [eax+0x1],ecx
     60f:	40                   	inc    eax
     610:	01 00                	add    DWORD PTR [eax],eax
     612:	00 02                	add    BYTE PTR [edx],al
     614:	91                   	xchg   ecx,eax
     615:	00 1a                	add    BYTE PTR [edx],bl
     617:	18 00                	sbb    BYTE PTR [eax],al
     619:	00 00                	add    BYTE PTR [eax],al
     61b:	01 4a 01             	add    DWORD PTR [edx+0x1],ecx
     61e:	4f                   	dec    edi
     61f:	00 00                	add    BYTE PTR [eax],al
     621:	00 02                	add    BYTE PTR [edx],al
     623:	91                   	xchg   ecx,eax
     624:	6c                   	ins    BYTE PTR es:[edi],dx
     625:	1a 82 00 00 00 01    	sbb    al,BYTE PTR [edx+0x1000000]
     62b:	4a                   	dec    edx
     62c:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
     62f:	00 00                	add    BYTE PTR [eax],al
     631:	02 91 68 00 1c 5e    	add    dl,BYTE PTR [ecx+0x5e1c0068]
     637:	03 00                	add    eax,DWORD PTR [eax]
     639:	00 01                	add    BYTE PTR [ecx],al
     63b:	53                   	push   ebx
     63c:	01 59 0a             	add    DWORD PTR [ecx+0xa],ebx
     63f:	10 03                	adc    BYTE PTR [ebx],al
     641:	c7 00 00 00 01 9c    	mov    DWORD PTR [eax],0x9c010000
     647:	ac                   	lods   al,BYTE PTR ds:[esi]
     648:	06                   	push   es
     649:	00 00                	add    BYTE PTR [eax],al
     64b:	1d c5 01 00 00       	sbb    eax,0x1c5
     650:	01 53 01             	add    DWORD PTR [ebx+0x1],edx
     653:	40                   	inc    eax
     654:	01 00                	add    DWORD PTR [eax],eax
     656:	00 02                	add    BYTE PTR [edx],al
     658:	91                   	xchg   ecx,eax
     659:	00 1a                	add    BYTE PTR [edx],bl
     65b:	48                   	dec    eax
     65c:	06                   	push   es
     65d:	00 00                	add    BYTE PTR [eax],al
     65f:	01 55 01             	add    DWORD PTR [ebp+0x1],edx
     662:	33 00                	xor    eax,DWORD PTR [eax]
     664:	00 00                	add    BYTE PTR [eax],al
     666:	02 91 5c 1a 03 05    	add    dl,BYTE PTR [ecx+0x5031a5c]
     66c:	00 00                	add    BYTE PTR [eax],al
     66e:	01 56 01             	add    DWORD PTR [esi+0x1],edx
     671:	a1 02 00 00 02       	mov    eax,ds:0x2000002
     676:	91                   	xchg   ecx,eax
     677:	60                   	pusha  
     678:	1a 7b 06             	sbb    bh,BYTE PTR [ebx+0x6]
     67b:	00 00                	add    BYTE PTR [eax],al
     67d:	01 57 01             	add    DWORD PTR [edi+0x1],edx
     680:	33 00                	xor    eax,DWORD PTR [eax]
     682:	00 00                	add    BYTE PTR [eax],al
     684:	02 91 64 1a 18 04    	add    dl,BYTE PTR [ecx+0x4181a64]
     68a:	00 00                	add    BYTE PTR [eax],al
     68c:	01 58 01             	add    DWORD PTR [eax+0x1],ebx
     68f:	40                   	inc    eax
     690:	01 00                	add    DWORD PTR [eax],eax
     692:	00 02                	add    BYTE PTR [edx],al
     694:	91                   	xchg   ecx,eax
     695:	6c                   	ins    BYTE PTR es:[edi],dx
     696:	1e                   	push   ds
     697:	00 00                	add    BYTE PTR [eax],al
     699:	00 00                	add    BYTE PTR [eax],al
     69b:	1b 63 6e             	sbb    esp,DWORD PTR [ebx+0x6e]
     69e:	74 00                	je     6a0 <cmdClearScreen-0x30ff960>
     6a0:	01 64 01 33          	add    DWORD PTR [ecx+eax*1+0x33],esp
     6a4:	00 00                	add    BYTE PTR [eax],al
     6a6:	00 02                	add    BYTE PTR [edx],al
     6a8:	91                   	xchg   ecx,eax
     6a9:	68 00 00 1c 0e       	push   0xe1c0000
     6ae:	02 00                	add    al,BYTE PTR [eax]
     6b0:	00 01                	add    BYTE PTR [ecx],al
     6b2:	72 01                	jb     6b5 <cmdClearScreen-0x30ff94b>
     6b4:	20 0b                	and    BYTE PTR [ebx],cl
     6b6:	10 03                	adc    BYTE PTR [ebx],al
     6b8:	1a 00                	sbb    al,BYTE PTR [eax]
     6ba:	00 00                	add    BYTE PTR [eax],al
     6bc:	01 9c d2 06 00 00 1d 	add    DWORD PTR [edx+edx*8+0x1d000006],ebx
     6c3:	c5 01                	lds    eax,FWORD PTR [ecx]
     6c5:	00 00                	add    BYTE PTR [eax],al
     6c7:	01 72 01             	add    DWORD PTR [edx+0x1],esi
     6ca:	40                   	inc    eax
     6cb:	01 00                	add    DWORD PTR [eax],eax
     6cd:	00 02                	add    BYTE PTR [edx],al
     6cf:	91                   	xchg   ecx,eax
     6d0:	00 00                	add    BYTE PTR [eax],al
     6d2:	1c b0                	sbb    al,0xb0
     6d4:	03 00                	add    eax,DWORD PTR [eax]
     6d6:	00 01                	add    BYTE PTR [ecx],al
     6d8:	77 01                	ja     6db <cmdClearScreen-0x30ff925>
     6da:	3a 0b                	cmp    cl,BYTE PTR [ebx]
     6dc:	10 03                	adc    BYTE PTR [ebx],al
     6de:	58                   	pop    eax
     6df:	00 00                	add    BYTE PTR [eax],al
     6e1:	00 01                	add    BYTE PTR [ecx],al
     6e3:	9c                   	pushf  
     6e4:	08 07                	or     BYTE PTR [edi],al
     6e6:	00 00                	add    BYTE PTR [eax],al
     6e8:	1d c5 01 00 00       	sbb    eax,0x1c5
     6ed:	01 77 01             	add    DWORD PTR [edi+0x1],esi
     6f0:	40                   	inc    eax
     6f1:	01 00                	add    DWORD PTR [eax],eax
     6f3:	00 02                	add    BYTE PTR [edx],al
     6f5:	91                   	xchg   ecx,eax
     6f6:	00 1a                	add    BYTE PTR [edx],bl
     6f8:	ca 03 00             	retf   0x3
     6fb:	00 01                	add    BYTE PTR [ecx],al
     6fd:	79 01                	jns    700 <cmdClearScreen-0x30ff900>
     6ff:	13 02                	adc    eax,DWORD PTR [edx]
     701:	00 00                	add    BYTE PTR [eax],al
     703:	03 91 f0 75 00 1c    	add    edx,DWORD PTR [ecx+0x1c0075f0]
     709:	6e                   	outs   dx,BYTE PTR ds:[esi]
     70a:	00 00                	add    BYTE PTR [eax],al
     70c:	00 01                	add    BYTE PTR [ecx],al
     70e:	84 01                	test   BYTE PTR [ecx],al
     710:	92                   	xchg   edx,eax
     711:	0b 10                	or     edx,DWORD PTR [eax]
     713:	03 ce                	add    ecx,esi
     715:	00 00                	add    BYTE PTR [eax],al
     717:	00 01                	add    BYTE PTR [ecx],al
     719:	9c                   	pushf  
     71a:	56                   	push   esi
     71b:	07                   	pop    es
     71c:	00 00                	add    BYTE PTR [eax],al
     71e:	1d c5 01 00 00       	sbb    eax,0x1c5
     723:	01 84 01 40 01 00 00 	add    DWORD PTR [ecx+eax*1+0x140],eax
     72a:	02 91 00 1b 74 6f    	add    dl,BYTE PTR [ecx+0x6f741b00]
     730:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
     733:	86 01                	xchg   BYTE PTR [ecx],al
     735:	40                   	inc    eax
     736:	01 00                	add    DWORD PTR [eax],eax
     738:	00 02                	add    BYTE PTR [edx],al
     73a:	91                   	xchg   ecx,eax
     73b:	68 0f c1 0b 10       	push   0x100bc10f
     740:	03 9c 00 00 00 1b 63 	add    ebx,DWORD PTR [eax+eax*1+0x631b0000]
     747:	6e                   	outs   dx,BYTE PTR ds:[esi]
     748:	74 00                	je     74a <cmdClearScreen-0x30ff8b6>
     74a:	01 90 01 5a 00 00    	add    DWORD PTR [eax+0x5a01],edx
     750:	00 02                	add    BYTE PTR [edx],al
     752:	91                   	xchg   ecx,eax
     753:	6c                   	ins    BYTE PTR es:[edi],dx
     754:	00 00                	add    BYTE PTR [eax],al
     756:	1f                   	pop    ds
     757:	5b                   	pop    ebx
     758:	02 00                	add    al,BYTE PTR [eax]
     75a:	00 01                	add    BYTE PTR [ecx],al
     75c:	9d                   	popf   
     75d:	01 60 0c             	add    DWORD PTR [eax+0xc],esp
     760:	10 03                	adc    BYTE PTR [ebx],al
     762:	4e                   	dec    esi
     763:	00 00                	add    BYTE PTR [eax],al
     765:	00 01                	add    BYTE PTR [ecx],al
     767:	9c                   	pushf  
     768:	7c 07                	jl     771 <cmdClearScreen-0x30ff88f>
     76a:	00 00                	add    BYTE PTR [eax],al
     76c:	1b 62 75             	sbb    esp,DWORD PTR [edx+0x75]
     76f:	66                   	data16
     770:	00 01                	add    BYTE PTR [ecx],al
     772:	9f                   	lahf   
     773:	01 40 01             	add    DWORD PTR [eax+0x1],eax
     776:	00 00                	add    BYTE PTR [eax],al
     778:	02 91 6c 00 1c b8    	add    dl,BYTE PTR [ecx-0x47e3ff94]
     77e:	03 00                	add    eax,DWORD PTR [eax]
     780:	00 01                	add    BYTE PTR [ecx],al
     782:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
     783:	01 ae 0c 10 03 11    	add    DWORD PTR [esi+0x1103100c],ebp
     789:	01 00                	add    DWORD PTR [eax],eax
     78b:	00 01                	add    BYTE PTR [ecx],al
     78d:	9c                   	pushf  
     78e:	16                   	push   ss
     78f:	08 00                	or     BYTE PTR [eax],al
     791:	00 1d c5 01 00 00    	add    BYTE PTR ds:0x1c5,bl
     797:	01 a4 01 40 01 00 00 	add    DWORD PTR [ecx+eax*1+0x140],esp
     79e:	02 91 00 1a ca 03    	add    dl,BYTE PTR [ecx+0x3ca1a00]
     7a4:	00 00                	add    BYTE PTR [eax],al
     7a6:	01 a6 01 13 02 00    	add    DWORD PTR [esi+0x21301],esp
     7ac:	00 03                	add    BYTE PTR [ebx],al
     7ae:	91                   	xchg   ecx,eax
     7af:	d8 75 1a             	fdiv   DWORD PTR [ebp+0x1a]
     7b2:	f3 03 00             	repz add eax,DWORD PTR [eax]
     7b5:	00 01                	add    BYTE PTR [ecx],al
     7b7:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
     7b8:	01 33                	add    DWORD PTR [ebx],esi
     7ba:	00 00                	add    BYTE PTR [eax],al
     7bc:	00 02                	add    BYTE PTR [edx],al
     7be:	91                   	xchg   ecx,eax
     7bf:	64 1a 13             	sbb    dl,BYTE PTR fs:[ebx]
     7c2:	04 00                	add    al,0x0
     7c4:	00 01                	add    BYTE PTR [ecx],al
     7c6:	aa                   	stos   BYTE PTR es:[edi],al
     7c7:	01 33                	add    DWORD PTR [ebx],esi
     7c9:	00 00                	add    BYTE PTR [eax],al
     7cb:	00 02                	add    BYTE PTR [edx],al
     7cd:	91                   	xchg   ecx,eax
     7ce:	60                   	pusha  
     7cf:	1a a2 00 00 00 01    	sbb    ah,BYTE PTR [edx+0x1000000]
     7d5:	ab                   	stos   DWORD PTR es:[edi],eax
     7d6:	01 16                	add    DWORD PTR [esi],edx
     7d8:	08 00                	or     BYTE PTR [eax],al
     7da:	00 03                	add    BYTE PTR [ebx],al
     7dc:	91                   	xchg   ecx,eax
     7dd:	58                   	pop    eax
     7de:	06                   	push   es
     7df:	17                   	pop    ss
     7e0:	18 0d 10 03 21 00    	sbb    BYTE PTR ds:0x210310,cl
     7e6:	00 00                	add    BYTE PTR [eax],al
     7e8:	fc                   	cld    
     7e9:	07                   	pop    es
     7ea:	00 00                	add    BYTE PTR [eax],al
     7ec:	1b 63 6e             	sbb    esp,DWORD PTR [ebx+0x6e]
     7ef:	74 00                	je     7f1 <cmdClearScreen-0x30ff80f>
     7f1:	01 ad 01 33 00 00    	add    DWORD PTR [ebp+0x3301],ebp
     7f7:	00 02                	add    BYTE PTR [edx],al
     7f9:	91                   	xchg   ecx,eax
     7fa:	6c                   	ins    BYTE PTR es:[edi],dx
     7fb:	00 0f                	add    BYTE PTR [edi],cl
     7fd:	39 0d 10 03 33 00    	cmp    DWORD PTR ds:0x330310,ecx
     803:	00 00                	add    BYTE PTR [eax],al
     805:	1b 63 6e             	sbb    esp,DWORD PTR [ebx+0x6e]
     808:	74 00                	je     80a <cmdClearScreen-0x30ff7f6>
     80a:	01 b0 01 33 00 00    	add    DWORD PTR [eax+0x3301],esi
     810:	00 02                	add    BYTE PTR [edx],al
     812:	91                   	xchg   ecx,eax
     813:	68 00 00 14 33       	push   0x33140000
     818:	00 00                	add    BYTE PTR [eax],al
     81a:	00 29                	add    BYTE PTR [ecx],ch
     81c:	08 00                	or     BYTE PTR [eax],al
     81e:	00 20                	add    BYTE PTR [eax],ah
     820:	93                   	xchg   ebx,eax
     821:	00 00                	add    BYTE PTR [eax],al
     823:	00 03                	add    BYTE PTR [ebx],al
     825:	91                   	xchg   ecx,eax
     826:	5c                   	pop    esp
     827:	06                   	push   es
     828:	00 14 46             	add    BYTE PTR [esi+eax*2],dl
     82b:	01 00                	add    DWORD PTR [eax],eax
     82d:	00 39                	add    BYTE PTR [ecx],bh
     82f:	08 00                	or     BYTE PTR [eax],al
     831:	00 15 93 00 00 00    	add    BYTE PTR ds:0x93,dl
     837:	0a 00                	or     al,BYTE PTR [eax]
     839:	13 77 04             	adc    esi,DWORD PTR [edi+0x4]
     83c:	00 00                	add    BYTE PTR [eax],al
     83e:	04 3e                	add    al,0x3e
     840:	29 08                	sub    DWORD PTR [eax],ecx
     842:	00 00                	add    BYTE PTR [eax],al
     844:	05 03 20 2c 10       	add    eax,0x102c2003
     849:	03 21                	add    esp,DWORD PTR [ecx]
     84b:	13 01                	adc    eax,DWORD PTR [ecx]
     84d:	00 00                	add    BYTE PTR [eax],al
     84f:	05 34 4f 00 00       	add    eax,0x4f34
     854:	00 05 03 0c 32 10    	add    BYTE PTR ds:0x10320c03,al
     85a:	03 21                	add    esp,DWORD PTR [ecx]
     85c:	d8 01                	fadd   DWORD PTR [ecx]
     85e:	00 00                	add    BYTE PTR [eax],al
     860:	05 35 4f 00 00       	add    eax,0x4f35
     865:	00 05 03 10 32 10    	add    BYTE PTR ds:0x10321003,al
     86b:	03 21                	add    esp,DWORD PTR [ecx]
     86d:	10 00                	adc    BYTE PTR [eax],al
     86f:	00 00                	add    BYTE PTR [eax],al
     871:	05 36 4f 00 00       	add    eax,0x4f36
     876:	00 05 03 08 32 10    	add    BYTE PTR ds:0x10320803,al
     87c:	03 21                	add    esp,DWORD PTR [ecx]
     87e:	76 00                	jbe    880 <cmdClearScreen-0x30ff780>
     880:	00 00                	add    BYTE PTR [eax],al
     882:	05 37 7a 00 00       	add    eax,0x7a37
     887:	00 05 03 28 32 10    	add    BYTE PTR ds:0x10322803,al
     88d:	03 21                	add    esp,DWORD PTR [ecx]
     88f:	ee                   	out    dx,al
     890:	00 00                	add    BYTE PTR [eax],al
     892:	00 03                	add    BYTE PTR [ebx],al
     894:	2d 9f 08 00 00       	sub    eax,0x89f
     899:	05 03 04 32 10       	add    eax,0x10320403
     89e:	03 05 04 68 00 00    	add    eax,DWORD PTR ds:0x6804
     8a4:	00 21                	add    BYTE PTR [ecx],ah
     8a6:	1c 01                	sbb    al,0x1
     8a8:	00 00                	add    BYTE PTR [eax],al
     8aa:	03 2e                	add    ebp,DWORD PTR [esi]
     8ac:	4f                   	dec    edi
     8ad:	00 00                	add    BYTE PTR [eax],al
     8af:	00 05 03 e0 2f 10    	add    BYTE PTR ds:0x102fe003,al
     8b5:	03 21                	add    esp,DWORD PTR [ecx]
     8b7:	2b 04 00             	sub    eax,DWORD PTR [eax+eax*1]
     8ba:	00 06                	add    BYTE PTR [esi],al
     8bc:	54                   	push   esp
     8bd:	a1 02 00 00 05       	mov    eax,ds:0x5000002
     8c2:	03 18                	add    ebx,DWORD PTR [eax]
     8c4:	32 10                	xor    dl,BYTE PTR [eax]
     8c6:	03 22                	add    esp,DWORD PTR [edx]
     8c8:	21 51 00             	and    DWORD PTR [ecx+0x0],edx
     8cb:	00 00                	add    BYTE PTR [eax],al
     8cd:	04 2d                	add    al,0x2d
     8cf:	d9 08                	(bad)  [eax]
     8d1:	00 00                	add    BYTE PTR [eax],al
     8d3:	05 03 14 32 10       	add    eax,0x10321403
     8d8:	03 05 04 c7 08 00    	add    eax,DWORD PTR ds:0x8c704
     8de:	00 23                	add    BYTE PTR [ebx],ah
     8e0:	ea 08 00 00 24 40 01 	jmp    0x140:0x24000008
     8e7:	00 00                	add    BYTE PTR [eax],al
     8e9:	00 21                	add    BYTE PTR [ecx],ah
     8eb:	ce                   	into   
     8ec:	02 00                	add    al,BYTE PTR [eax]
     8ee:	00 04 2e             	add    BYTE PTR [esi+ebp*1],al
     8f1:	fb                   	sti    
     8f2:	08 00                	or     BYTE PTR [eax],al
     8f4:	00 05 03 00 32 10    	add    BYTE PTR ds:0x10320003,al
     8fa:	03 05 04 df 08 00    	add    eax,DWORD PTR ds:0x8df04
     900:	00 14 73             	add    BYTE PTR [ebx+esi*2],dl
     903:	00 00                	add    BYTE PTR [eax],al
     905:	00 12                	add    BYTE PTR [edx],dl
     907:	09 00                	or     DWORD PTR [eax],eax
     909:	00 25 93 00 00 00    	add    BYTE PTR ds:0x93,ah
     90f:	ff 01                	inc    DWORD PTR [ecx]
     911:	00 21                	add    BYTE PTR [ecx],ah
     913:	c9                   	leave  
     914:	00 00                	add    BYTE PTR [eax],al
     916:	00 04 34             	add    BYTE PTR [esp+esi*1],al
     919:	01 09                	add    DWORD PTR [ecx],ecx
     91b:	00 00                	add    BYTE PTR [eax],al
     91d:	05 03 00 30 10       	add    eax,0x10300003
     922:	03 21                	add    esp,DWORD PTR [ecx]
     924:	3d 03 00 00 04       	cmp    eax,0x4000003
     929:	35 40 01 00 00       	xor    eax,0x140
     92e:	05 03 24 32 10       	add    eax,0x10322403
     933:	03 21                	add    esp,DWORD PTR [ecx]
     935:	b0 02                	mov    al,0x2
     937:	00 00                	add    BYTE PTR [eax],al
     939:	04 36                	add    al,0x36
     93b:	a1 02 00 00 05       	mov    eax,ds:0x5000002
     940:	03 cc                	add    ecx,esp
     942:	2e 10 03             	adc    BYTE PTR cs:[ebx],al
     945:	14 73                	adc    al,0x73
     947:	00 00                	add    BYTE PTR [eax],al
     949:	00 55 09             	add    BYTE PTR [ebp+0x9],dl
     94c:	00 00                	add    BYTE PTR [eax],al
     94e:	15 93 00 00 00       	adc    eax,0x93
     953:	05 00 21 7a 03       	add    eax,0x37a2100
     958:	00 00                	add    BYTE PTR [eax],al
     95a:	04 37                	add    al,0x37
     95c:	45                   	inc    ebp
     95d:	09 00                	or     DWORD PTR [eax],eax
     95f:	00 05 03 c4 2e 10    	add    BYTE PTR ds:0x102ec403,al
     965:	03 21                	add    esp,DWORD PTR [ecx]
     967:	1d 03 00 00 04       	sbb    eax,0x4000003
     96c:	38 4f 00             	cmp    BYTE PTR [edi+0x0],cl
     96f:	00 00                	add    BYTE PTR [eax],al
     971:	05 03 20 32 10       	add    eax,0x10322003
     976:	03 21                	add    esp,DWORD PTR [ecx]
     978:	eb 01                	jmp    97b <cmdClearScreen-0x30ff685>
     97a:	00 00                	add    BYTE PTR [eax],al
     97c:	04 38                	add    al,0x38
     97e:	4f                   	dec    edi
     97f:	00 00                	add    BYTE PTR [eax],al
     981:	00 05 03 1c 32 10    	add    BYTE PTR ds:0x10321c03,al
     987:	03 21                	add    esp,DWORD PTR [ecx]
     989:	8f 01                	pop    DWORD PTR [ecx]
     98b:	00 00                	add    BYTE PTR [eax],al
     98d:	04 39                	add    al,0x39
     98f:	8c 00                	mov    WORD PTR [eax],es
     991:	00 00                	add    BYTE PTR [eax],al
     993:	05 03 2c 32 10       	add    eax,0x10322c03
     998:	03 26                	add    esp,DWORD PTR [esi]
     99a:	63 77 64             	arpl   WORD PTR [edi+0x64],si
     99d:	00 04 3a             	add    BYTE PTR [edx+edi*1],al
     9a0:	8e 05 00 00 05 03    	mov    es,WORD PTR ds:0x3050000
     9a6:	e0 2e                	loopne 9d6 <cmdClearScreen-0x30ff62a>
     9a8:	10 03                	adc    BYTE PTR [ebx],al
     9aa:	21 80 03 00 00 04    	and    DWORD PTR [eax+0x4000003],eax
     9b0:	3b 8c 00 00 00 05 03 	cmp    ecx,DWORD PTR [eax+eax*1+0x3050000]
     9b7:	c0 2e 10             	shr    BYTE PTR [esi],0x10
     9ba:	03 14 33             	add    edx,DWORD PTR [ebx+esi*1]
     9bd:	00 00                	add    BYTE PTR [eax],al
     9bf:	00 cb                	add    bl,cl
     9c1:	09 00                	or     DWORD PTR [eax],eax
     9c3:	00 15 93 00 00 00    	add    BYTE PTR ds:0x93,dl
     9c9:	01 00                	add    DWORD PTR [eax],eax
     9cb:	21 6e 02             	and    DWORD PTR [esi+0x2],ebp
     9ce:	00 00                	add    BYTE PTR [eax],al
     9d0:	04 3c                	add    al,0x3c
     9d2:	bb 09 00 00 05       	mov    ebx,0x5000009
     9d7:	03 30                	add    esi,DWORD PTR [eax]
     9d9:	32 10                	xor    dl,BYTE PTR [eax]
     9db:	03 00                	add    eax,DWORD PTR [eax]
     9dd:	89 09                	mov    DWORD PTR [ecx],ecx
     9df:	00 00                	add    BYTE PTR [eax],al
     9e1:	04 00                	add    al,0x0
     9e3:	15 02 00 00 04       	adc    eax,0x4000002
     9e8:	01 2e                	add    DWORD PTR [esi],ebp
     9ea:	01 00                	add    DWORD PTR [eax],eax
     9ec:	00 0c a1             	add    BYTE PTR [ecx+eiz*4],cl
     9ef:	04 00                	add    al,0x0
     9f1:	00 fe                	add    dh,bh
     9f3:	02 00                	add    al,BYTE PTR [eax]
     9f5:	00 c0                	add    al,al
     9f7:	0d 10 03 6c 0c       	or     eax,0xc6c0310
     9fc:	00 00                	add    BYTE PTR [eax],al
     9fe:	c8 02 00 00          	enter  0x2,0x0
     a02:	02 01                	add    al,BYTE PTR [ecx]
     a04:	06                   	push   es
     a05:	59                   	pop    ecx
     a06:	03 00                	add    eax,DWORD PTR [eax]
     a08:	00 02                	add    BYTE PTR [edx],al
     a0a:	01 06                	add    DWORD PTR [esi],eax
     a0c:	52                   	push   edx
     a0d:	03 00                	add    eax,DWORD PTR [eax]
     a0f:	00 02                	add    BYTE PTR [edx],al
     a11:	02 05 70 03 00 00    	add    al,BYTE PTR ds:0x370
     a17:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     a1e:	02 08                	add    cl,BYTE PTR [eax]
     a20:	05 05 01 00 00       	add    eax,0x105
     a25:	04 9f                	add    al,0x9f
     a27:	06                   	push   es
     a28:	00 00                	add    BYTE PTR [eax],al
     a2a:	02 2e                	add    ch,BYTE PTR [esi]
     a2c:	53                   	push   ebx
     a2d:	00 00                	add    BYTE PTR [eax],al
     a2f:	00 02                	add    BYTE PTR [edx],al
     a31:	01 08                	add    DWORD PTR [eax],ecx
     a33:	50                   	push   eax
     a34:	03 00                	add    eax,DWORD PTR [eax]
     a36:	00 02                	add    BYTE PTR [edx],al
     a38:	02 07                	add    al,BYTE PTR [edi]
     a3a:	22 02                	and    al,BYTE PTR [edx]
     a3c:	00 00                	add    BYTE PTR [eax],al
     a3e:	04 9f                	add    al,0x9f
     a40:	03 00                	add    eax,DWORD PTR [eax]
     a42:	00 02                	add    BYTE PTR [edx],al
     a44:	34 6c                	xor    al,0x6c
     a46:	00 00                	add    BYTE PTR [eax],al
     a48:	00 02                	add    BYTE PTR [edx],al
     a4a:	04 07                	add    al,0x7
     a4c:	95                   	xchg   ebp,eax
     a4d:	00 00                	add    BYTE PTR [eax],al
     a4f:	00 02                	add    BYTE PTR [edx],al
     a51:	08 07                	or     BYTE PTR [edi],al
     a53:	8b 00                	mov    eax,DWORD PTR [eax]
     a55:	00 00                	add    BYTE PTR [eax],al
     a57:	04 47                	add    al,0x47
     a59:	00 00                	add    BYTE PTR [eax],al
     a5b:	00 02                	add    BYTE PTR [edx],al
     a5d:	56                   	push   esi
     a5e:	6c                   	ins    BYTE PTR es:[edi],dx
     a5f:	00 00                	add    BYTE PTR [eax],al
     a61:	00 02                	add    BYTE PTR [edx],al
     a63:	04 05                	add    al,0x5
     a65:	0a 01                	or     al,BYTE PTR [ecx]
     a67:	00 00                	add    BYTE PTR [eax],al
     a69:	05 04 92 00 00       	add    eax,0x9204
     a6e:	00 06                	add    BYTE PTR [esi],al
     a70:	25 00 00 00 02       	and    eax,0x2000000
     a75:	01 02                	add    DWORD PTR [edx],eax
     a77:	37                   	aaa    
     a78:	03 00                	add    eax,DWORD PTR [eax]
     a7a:	00 02                	add    BYTE PTR [edx],al
     a7c:	04 07                	add    al,0x7
     a7e:	c5 02                	lds    eax,FWORD PTR [edx]
     a80:	00 00                	add    BYTE PTR [eax],al
     a82:	07                   	pop    es
     a83:	04 08                	add    al,0x8
     a85:	05 03 58 28 01       	add    eax,0x1285803
     a8a:	00 00                	add    BYTE PTR [eax],al
     a8c:	09 c2                	or     edx,eax
     a8e:	05 00 00 03 59       	add    eax,0x59030000
     a93:	48                   	dec    eax
     a94:	00 00                	add    BYTE PTR [eax],al
     a96:	00 01                	add    BYTE PTR [ecx],al
     a98:	04 04                	add    al,0x4
     a9a:	00 09                	add    BYTE PTR [ecx],cl
     a9c:	2d 06 00 00 03       	sub    eax,0x3000006
     aa1:	5a                   	pop    edx
     aa2:	48                   	dec    eax
     aa3:	00 00                	add    BYTE PTR [eax],al
     aa5:	00 01                	add    BYTE PTR [ecx],al
     aa7:	04 00                	add    al,0x0
     aa9:	00 09                	add    BYTE PTR [ecx],cl
     aab:	8e 04 00             	mov    es,WORD PTR [eax+eax*1]
     aae:	00 03                	add    BYTE PTR [ebx],al
     ab0:	5b                   	pop    ebx
     ab1:	48                   	dec    eax
     ab2:	00 00                	add    BYTE PTR [eax],al
     ab4:	00 01                	add    BYTE PTR [ecx],al
     ab6:	04 04                	add    al,0x4
     ab8:	01 09                	add    DWORD PTR [ecx],ecx
     aba:	c9                   	leave  
     abb:	02 00                	add    al,BYTE PTR [eax]
     abd:	00 03                	add    BYTE PTR [ebx],al
     abf:	5c                   	pop    esp
     ac0:	48                   	dec    eax
     ac1:	00 00                	add    BYTE PTR [eax],al
     ac3:	00 01                	add    BYTE PTR [ecx],al
     ac5:	02 02                	add    al,BYTE PTR [edx]
     ac7:	01 09                	add    DWORD PTR [ecx],ecx
     ac9:	70 06                	jo     ad1 <cmdClearScreen-0x30ff52f>
     acb:	00 00                	add    BYTE PTR [eax],al
     acd:	03 5d 48             	add    ebx,DWORD PTR [ebp+0x48]
     ad0:	00 00                	add    BYTE PTR [eax],al
     ad2:	00 01                	add    BYTE PTR [ecx],al
     ad4:	02 00                	add    al,BYTE PTR [eax]
     ad6:	01 09                	add    DWORD PTR [ecx],ecx
     ad8:	2c 06                	sub    al,0x6
     ada:	00 00                	add    BYTE PTR [eax],al
     adc:	03 5e 48             	add    ebx,DWORD PTR [esi+0x48]
     adf:	00 00                	add    BYTE PTR [eax],al
     ae1:	00 01                	add    BYTE PTR [ecx],al
     ae3:	04 04                	add    al,0x4
     ae5:	02 09                	add    cl,BYTE PTR [ecx]
     ae7:	8d 04 00             	lea    eax,[eax+eax*1]
     aea:	00 03                	add    BYTE PTR [ebx],al
     aec:	5f                   	pop    edi
     aed:	48                   	dec    eax
     aee:	00 00                	add    BYTE PTR [eax],al
     af0:	00 01                	add    BYTE PTR [ecx],al
     af2:	08 00                	or     BYTE PTR [eax],al
     af4:	03 09                	add    ecx,DWORD PTR [ecx]
     af6:	75 06                	jne    afe <cmdClearScreen-0x30ff502>
     af8:	00 00                	add    BYTE PTR [eax],al
     afa:	03 60 48             	add    esp,DWORD PTR [eax+0x48]
     afd:	00 00                	add    BYTE PTR [eax],al
     aff:	00 01                	add    BYTE PTR [ecx],al
     b01:	04 04                	add    al,0x4
     b03:	04 00                	add    al,0x0
     b05:	0a 08                	or     cl,BYTE PTR [eax]
     b07:	03 56 41             	add    edx,DWORD PTR [esi+0x41]
     b0a:	01 00                	add    DWORD PTR [eax],eax
     b0c:	00 0b                	add    BYTE PTR [ebx],cl
     b0e:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
     b0f:	00 00                	add    BYTE PTR [eax],al
     b11:	00 0c 72             	add    BYTE PTR [edx+esi*2],cl
     b14:	65 67 00 03          	add    BYTE PTR gs:[bp+di],al
     b18:	62 61 00             	bound  esp,QWORD PTR [ecx+0x0]
     b1b:	00 00                	add    BYTE PTR [eax],al
     b1d:	00 08                	add    BYTE PTR [eax],cl
     b1f:	04 03                	add    al,0x3
     b21:	db 77 01             	(bad)  [edi+0x1]
     b24:	00 00                	add    BYTE PTR [eax],al
     b26:	09 64 04 00          	or     DWORD PTR [esp+eax*1+0x0],esp
     b2a:	00 03                	add    BYTE PTR [ebx],al
     b2c:	dc 48 00             	fmul   QWORD PTR [eax+0x0]
     b2f:	00 00                	add    BYTE PTR [eax],al
     b31:	01 01                	add    DWORD PTR [ecx],eax
     b33:	07                   	pop    es
     b34:	00 09                	add    BYTE PTR [ecx],cl
     b36:	d7                   	xlat   BYTE PTR ds:[ebx]
     b37:	04 00                	add    al,0x0
     b39:	00 03                	add    BYTE PTR [ebx],al
     b3b:	dd 48 00             	fisttp QWORD PTR [eax+0x0]
     b3e:	00 00                	add    BYTE PTR [eax],al
     b40:	01 01                	add    DWORD PTR [ecx],eax
     b42:	06                   	push   es
     b43:	00 09                	add    BYTE PTR [ecx],cl
     b45:	f5                   	cmc    
     b46:	04 00                	add    al,0x0
     b48:	00 03                	add    BYTE PTR [ebx],al
     b4a:	de 61 00             	fisub  WORD PTR [ecx+0x0]
     b4d:	00 00                	add    BYTE PTR [eax],al
     b4f:	04 1e                	add    al,0x1e
     b51:	00 00                	add    BYTE PTR [eax],al
     b53:	00 0a                	add    BYTE PTR [edx],cl
     b55:	04 03                	add    al,0x3
     b57:	da 90 01 00 00 0b    	ficom  DWORD PTR [eax+0xb000001]
     b5d:	41                   	inc    ecx
     b5e:	01 00                	add    DWORD PTR [eax],eax
     b60:	00 0c 72             	add    BYTE PTR [edx+esi*2],cl
     b63:	65 67 00 03          	add    BYTE PTR gs:[bp+di],al
     b67:	e0 61                	loopne bca <cmdClearScreen-0x30ff436>
     b69:	00 00                	add    BYTE PTR [eax],al
     b6b:	00 00                	add    BYTE PTR [eax],al
     b6d:	0d c1 03 00 00       	or     eax,0x3c1
     b72:	04 6c                	add    al,0x6c
     b74:	00 00                	add    BYTE PTR [eax],al
     b76:	00 08                	add    BYTE PTR [eax],cl
     b78:	15 cb 01 00 00       	adc    eax,0x1cb
     b7d:	0e                   	push   cs
     b7e:	08 00                	or     BYTE PTR [eax],al
     b80:	00 00                	add    BYTE PTR [eax],al
     b82:	01 0e                	add    DWORD PTR [esi],ecx
     b84:	26 03 00             	add    eax,DWORD PTR es:[eax]
     b87:	00 02                	add    BYTE PTR [edx],al
     b89:	0e                   	push   cs
     b8a:	32 00                	xor    al,BYTE PTR [eax]
     b8c:	00 00                	add    BYTE PTR [eax],al
     b8e:	04 0e                	add    al,0xe
     b90:	07                   	pop    es
     b91:	02 00                	add    al,BYTE PTR [eax]
     b93:	00 08                	add    BYTE PTR [eax],cl
     b95:	0e                   	push   cs
     b96:	40                   	inc    eax
     b97:	02 00                	add    al,BYTE PTR [eax]
     b99:	00 10                	add    BYTE PTR [eax],dl
     b9b:	0e                   	push   cs
     b9c:	a8 03                	test   al,0x3
     b9e:	00 00                	add    BYTE PTR [eax],al
     ba0:	20 0e                	and    BYTE PTR [esi],cl
     ba2:	bf 02 00 00 40       	mov    edi,0x40000002
     ba7:	00 08                	add    BYTE PTR [eax],cl
     ba9:	10 04 19             	adc    BYTE PTR [ecx+ebx*1],al
     bac:	04 02                	add    al,0x2
     bae:	00 00                	add    BYTE PTR [eax],al
     bb0:	0f 17 02             	movhps QWORD PTR [edx],xmm0
     bb3:	00 00                	add    BYTE PTR [eax],al
     bb5:	04 1b                	add    al,0x1b
     bb7:	04 02                	add    al,0x2
     bb9:	00 00                	add    BYTE PTR [eax],al
     bbb:	00 0f                	add    BYTE PTR [edi],cl
     bbd:	95                   	xchg   ebp,eax
     bbe:	02 00                	add    al,BYTE PTR [eax]
     bc0:	00 04 1c             	add    BYTE PTR [esp+ebx*1],al
     bc3:	04 02                	add    al,0x2
     bc5:	00 00                	add    BYTE PTR [eax],al
     bc7:	04 0f                	add    al,0xf
     bc9:	59                   	pop    ecx
     bca:	00 00                	add    BYTE PTR [eax],al
     bcc:	00 04 1d a5 00 00 00 	add    BYTE PTR [ebx*1+0xa5],al
     bd3:	08 0f                	or     BYTE PTR [edi],cl
     bd5:	f3 03 00             	repz add eax,DWORD PTR [eax]
     bd8:	00 04 1e             	add    BYTE PTR [esi+ebx*1],al
     bdb:	3a 00                	cmp    al,BYTE PTR [eax]
     bdd:	00 00                	add    BYTE PTR [eax],al
     bdf:	0c 00                	or     al,0x0
     be1:	05 04 25 00 00       	add    eax,0x2504
     be6:	00 04 ac             	add    BYTE PTR [esp+ebp*4],al
     be9:	01 00                	add    DWORD PTR [eax],eax
     beb:	00 04 1f             	add    BYTE PTR [edi+ebx*1],al
     bee:	cb                   	retf   
     bef:	01 00                	add    DWORD PTR [eax],eax
     bf1:	00 10                	add    BYTE PTR [eax],dl
     bf3:	98                   	cwde   
     bf4:	05 00 00 01 19       	add    eax,0x19010000
     bf9:	c0 0d 10 03 06 00 00 	ror    BYTE PTR ds:0x60310,0x0
     c00:	00 01                	add    BYTE PTR [ecx],al
     c02:	9c                   	pushf  
     c03:	39 02                	cmp    DWORD PTR [edx],eax
     c05:	00 00                	add    BYTE PTR [eax],al
     c07:	11 10                	adc    DWORD PTR [eax],edx
     c09:	05 00 00 01 19       	add    eax,0x19010000
     c0e:	04 02                	add    al,0x2
     c10:	00 00                	add    BYTE PTR [eax],al
     c12:	02 91 00 00 12 66    	add    dl,BYTE PTR [ecx+0x66120000]
     c18:	05 00 00 01 1e       	add    eax,0x1e010000
     c1d:	c6                   	(bad)  
     c1e:	0d 10 03 2f 00       	or     eax,0x2f0310
     c23:	00 00                	add    BYTE PTR [eax],al
     c25:	01 9c 6b 02 00 00 11 	add    DWORD PTR [ebx+ebp*2+0x11000002],ebx
     c2c:	77 04                	ja     c32 <cmdClearScreen-0x30ff3ce>
     c2e:	00 00                	add    BYTE PTR [eax],al
     c30:	01 1e                	add    DWORD PTR [esi],ebx
     c32:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
     c35:	00 02                	add    BYTE PTR [edx],al
     c37:	91                   	xchg   ecx,eax
     c38:	00 13                	add    BYTE PTR [ebx],dl
     c3a:	76 04                	jbe    c40 <cmdClearScreen-0x30ff3c0>
     c3c:	00 00                	add    BYTE PTR [eax],al
     c3e:	01 20                	add    DWORD PTR [eax],esp
     c40:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
     c43:	00 02                	add    BYTE PTR [edx],al
     c45:	91                   	xchg   ecx,eax
     c46:	6c                   	ins    BYTE PTR es:[edi],dx
     c47:	00 05 04 04 02 00    	add    BYTE PTR ds:0x20404,al
     c4d:	00 14 18             	add    BYTE PTR [eax+ebx*1],dl
     c50:	05 00 00 01 2a       	add    eax,0x2a010000
     c55:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
     c58:	00 f5                	add    ch,dh
     c5a:	0d 10 03 2d 01       	or     eax,0x12d0310
     c5f:	00 00                	add    BYTE PTR [eax],al
     c61:	01 9c f5 02 00 00 11 	add    DWORD PTR [ebp+esi*8+0x11000002],ebx
     c68:	10 05 00 00 01 2a    	adc    BYTE PTR ds:0x2a010000,al
     c6e:	04 02                	add    al,0x2
     c70:	00 00                	add    BYTE PTR [eax],al
     c72:	02 91 00 13 4d 06    	add    dl,BYTE PTR [ecx+0x64d1300]
     c78:	00 00                	add    BYTE PTR [eax],al
     c7a:	01 2c f5 02 00 00 02 	add    DWORD PTR [esi*8+0x2000002],ebp
     c81:	91                   	xchg   ecx,eax
     c82:	5d                   	pop    ebp
     c83:	15 77 04 00 00       	adc    eax,0x477
     c88:	01 2d 6b 02 00 00    	add    DWORD PTR ds:0x26b,ebp
     c8e:	13 b4 05 00 00 01 2e 	adc    esi,DWORD PTR [ebp+eax*1+0x2e010000]
     c95:	04 02                	add    al,0x2
     c97:	00 00                	add    BYTE PTR [eax],al
     c99:	02 91 6c 13 ae 04    	add    dl,BYTE PTR [ecx+0x4ae136c]
     c9f:	00 00                	add    BYTE PTR [eax],al
     ca1:	01 2f                	add    DWORD PTR [edi],ebp
     ca3:	3a 00                	cmp    al,BYTE PTR [eax]
     ca5:	00 00                	add    BYTE PTR [eax],al
     ca7:	02 91 60 16 63 6d    	add    dl,BYTE PTR [ecx+0x6d631660]
     cad:	64 00 01             	add    BYTE PTR fs:[ecx],al
     cb0:	30 04 02             	xor    BYTE PTR [edx+eax*1],al
     cb3:	00 00                	add    BYTE PTR [eax],al
     cb5:	13 e2                	adc    esp,edx
     cb7:	04 00                	add    al,0x0
     cb9:	00 01                	add    BYTE PTR [ecx],al
     cbb:	31 25 00 00 00 02    	xor    DWORD PTR ds:0x2000000,esp
     cc1:	91                   	xchg   ecx,eax
     cc2:	6b 13 7c             	imul   edx,DWORD PTR [ebx],0x7c
     cc5:	04 00                	add    al,0x0
     cc7:	00 01                	add    BYTE PTR [ecx],al
     cc9:	32 04 02             	xor    al,BYTE PTR [edx+eax*1]
     ccc:	00 00                	add    BYTE PTR [eax],al
     cce:	02 91 64 00 17 25    	add    dl,BYTE PTR [ecx+0x25170064]
     cd4:	00 00                	add    BYTE PTR [eax],al
     cd6:	00 05 03 00 00 18    	add    BYTE PTR ds:0x18000003,al
     cdc:	9e                   	sahf   
     cdd:	00 00                	add    BYTE PTR [eax],al
     cdf:	00 02                	add    BYTE PTR [edx],al
     ce1:	00 12                	add    BYTE PTR [edx],dl
     ce3:	84 05 00 00 01 4d    	test   BYTE PTR ds:0x4d010000,al
     ce9:	22 0f                	and    cl,BYTE PTR [edi]
     ceb:	10 03                	adc    BYTE PTR [ebx],al
     ced:	b4 00                	mov    ah,0x0
     cef:	00 00                	add    BYTE PTR [eax],al
     cf1:	01 9c 35 03 00 00 11 	add    DWORD PTR [ebp+esi*1+0x11000003],ebx
     cf8:	8f 05 00 00 01 4d    	pop    DWORD PTR ds:0x4d010000
     cfe:	04 02                	add    al,0x2
     d00:	00 00                	add    BYTE PTR [eax],al
     d02:	02 91 00 19 69 00    	add    dl,BYTE PTR [ecx+0x691900]
     d08:	01 50 3a             	add    DWORD PTR [eax+0x3a],edx
     d0b:	00 00                	add    BYTE PTR [eax],al
     d0d:	00 02                	add    BYTE PTR [edx],al
     d0f:	91                   	xchg   ecx,eax
     d10:	6c                   	ins    BYTE PTR es:[edi],dx
     d11:	00 14 b6             	add    BYTE PTR [esi+esi*4],dl
     d14:	06                   	push   es
     d15:	00 00                	add    BYTE PTR [eax],al
     d17:	01 66 3a             	add    DWORD PTR [esi+0x3a],esp
     d1a:	00 00                	add    BYTE PTR [eax],al
     d1c:	00 d6                	add    dh,dl
     d1e:	0f 10 03             	movups xmm0,XMMWORD PTR [ebx]
     d21:	a9 01 00 00 01       	test   eax,0x1000001
     d26:	9c                   	pushf  
     d27:	d3 03                	rol    DWORD PTR [ebx],cl
     d29:	00 00                	add    BYTE PTR [eax],al
     d2b:	11 08                	adc    DWORD PTR [eax],ecx
     d2d:	05 00 00 01 66       	add    eax,0x66010000
     d32:	04 02                	add    al,0x2
     d34:	00 00                	add    BYTE PTR [eax],al
     d36:	02 91 00 11 ca 03    	add    dl,BYTE PTR [ecx+0x3ca1100]
     d3c:	00 00                	add    BYTE PTR [eax],al
     d3e:	01 66 e3             	add    DWORD PTR [esi-0x1d],esp
     d41:	03 00                	add    eax,DWORD PTR [eax]
     d43:	00 02                	add    BYTE PTR [edx],al
     d45:	91                   	xchg   ecx,eax
     d46:	04 11                	add    al,0x11
     d48:	13 04 00             	adc    eax,DWORD PTR [eax+eax*1]
     d4b:	00 01                	add    BYTE PTR [ecx],al
     d4d:	66                   	data16
     d4e:	3a 00                	cmp    al,BYTE PTR [eax]
     d50:	00 00                	add    BYTE PTR [eax],al
     d52:	02 91 08 19 78 00    	add    dl,BYTE PTR [ecx+0x781908]
     d58:	01 68 3a             	add    DWORD PTR [eax+0x3a],ebp
     d5b:	00 00                	add    BYTE PTR [eax],al
     d5d:	00 02                	add    BYTE PTR [edx],al
     d5f:	91                   	xchg   ecx,eax
     d60:	6c                   	ins    BYTE PTR es:[edi],dx
     d61:	19 79 00             	sbb    DWORD PTR [ecx+0x0],edi
     d64:	01 68 3a             	add    DWORD PTR [eax+0x3a],ebp
     d67:	00 00                	add    BYTE PTR [eax],al
     d69:	00 02                	add    BYTE PTR [edx],al
     d6b:	91                   	xchg   ecx,eax
     d6c:	68 13 c1 04 00       	push   0x4c113
     d71:	00 01                	add    BYTE PTR [ecx],al
     d73:	69 3a 00 00 00 02    	imul   edi,DWORD PTR [edx],0x2000000
     d79:	91                   	xchg   ecx,eax
     d7a:	64 13 95 04 00 00 01 	adc    edx,DWORD PTR fs:[ebp+0x1000004]
     d81:	69 3a 00 00 00 02    	imul   edi,DWORD PTR [edx],0x2000000
     d87:	91                   	xchg   ecx,eax
     d88:	60                   	pusha  
     d89:	13 35 05 00 00 01    	adc    esi,DWORD PTR ds:0x1000005
     d8f:	6a 97                	push   0xffffff97
     d91:	00 00                	add    BYTE PTR [eax],al
     d93:	00 02                	add    BYTE PTR [edx],al
     d95:	91                   	xchg   ecx,eax
     d96:	5f                   	pop    edi
     d97:	1a 11                	sbb    dl,BYTE PTR [ecx]
     d99:	10 10                	adc    BYTE PTR [eax],dl
     d9b:	03 47 01             	add    eax,DWORD PTR [edi+0x1]
     d9e:	00 00                	add    BYTE PTR [eax],al
     da0:	19 63 6e             	sbb    DWORD PTR [ebx+0x6e],esp
     da3:	74 00                	je     da5 <cmdClearScreen-0x30ff25b>
     da5:	01 6e 6c             	add    DWORD PTR [esi+0x6c],ebp
     da8:	00 00                	add    BYTE PTR [eax],al
     daa:	00 02                	add    BYTE PTR [edx],al
     dac:	91                   	xchg   ecx,eax
     dad:	58                   	pop    eax
     dae:	00 00                	add    BYTE PTR [eax],al
     db0:	17                   	pop    ss
     db1:	25 00 00 00 e3       	and    eax,0xe3000000
     db6:	03 00                	add    eax,DWORD PTR [eax]
     db8:	00 18                	add    BYTE PTR [eax],bl
     dba:	9e                   	sahf   
     dbb:	00 00                	add    BYTE PTR [eax],al
     dbd:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
     dc0:	05 04 d3 03 00       	add    eax,0x3d304
     dc5:	00 14 78             	add    BYTE PTR [eax+edi*2],dl
     dc8:	05 00 00 01 98       	add    eax,0x98010000
     dcd:	3a 00                	cmp    al,BYTE PTR [eax]
     dcf:	00 00                	add    BYTE PTR [eax],al
     dd1:	7f 11                	jg     de4 <cmdClearScreen-0x30ff21c>
     dd3:	10 03                	adc    BYTE PTR [ebx],al
     dd5:	69 00 00 00 01 9c    	imul   eax,DWORD PTR [eax],0x9c010000
     ddb:	2b 04 00             	sub    eax,DWORD PTR [eax+eax*1]
     dde:	00 11                	add    BYTE PTR [ecx],dl
     de0:	10 05 00 00 01 98    	adc    BYTE PTR ds:0x98010000,al
     de6:	04 02                	add    al,0x2
     de8:	00 00                	add    BYTE PTR [eax],al
     dea:	02 91 00 19 69 00    	add    dl,BYTE PTR [ecx+0x691900]
     df0:	01 9a 6c 00 00 00    	add    DWORD PTR [edx+0x6c],ebx
     df6:	02 91 6c 19 72 65    	add    dl,BYTE PTR [ecx+0x6572196c]
     dfc:	74 00                	je     dfe <cmdClearScreen-0x30ff202>
     dfe:	01 9b 3a 00 00 00    	add    DWORD PTR [ebx+0x3a],ebx
     e04:	02 91 68 00 14 fe    	add    dl,BYTE PTR [ecx-0x1ebff98]
     e0a:	04 00                	add    al,0x0
     e0c:	00 01                	add    BYTE PTR [ecx],al
     e0e:	ac                   	lods   al,BYTE PTR ds:[esi]
     e0f:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
     e12:	00 e8                	add    al,ch
     e14:	11 10                	adc    DWORD PTR [eax],edx
     e16:	03 8e 02 00 00 01    	add    ecx,DWORD PTR [esi+0x1000002]
     e1c:	9c                   	pushf  
     e1d:	ea 04 00 00 11 d9 05 	jmp    0x5d9:0x11000004
     e24:	00 00                	add    BYTE PTR [eax],al
     e26:	01 ac 8c 00 00 00 02 	add    DWORD PTR [esp+ecx*4+0x2000000],ebp
     e2d:	91                   	xchg   ecx,eax
     e2e:	00 19                	add    BYTE PTR [ecx],bl
     e30:	61                   	popa   
     e31:	72 67                	jb     e9a <cmdClearScreen-0x30ff166>
     e33:	00 01                	add    BYTE PTR [ecx],al
     e35:	ae                   	scas   al,BYTE PTR es:[edi]
     e36:	04 02                	add    al,0x2
     e38:	00 00                	add    BYTE PTR [eax],al
     e3a:	02 91 6c 13 ba 05    	add    dl,BYTE PTR [ecx+0x5ba136c]
     e40:	00 00                	add    BYTE PTR [eax],al
     e42:	01 af 04 02 00 00    	add    DWORD PTR [edi+0x204],ebp
     e48:	02 91 68 13 5f 05    	add    dl,BYTE PTR [ecx+0x55f1368]
     e4e:	00 00                	add    BYTE PTR [eax],al
     e50:	01 b0 3a 00 00 00    	add    DWORD PTR [eax+0x3a],esi
     e56:	02 91 64 13 ba 04    	add    dl,BYTE PTR [ecx+0x4ba1364]
     e5c:	00 00                	add    BYTE PTR [eax],al
     e5e:	01 b1 3a 00 00 00    	add    DWORD PTR [ecx+0x3a],esi
     e64:	02 91 60 13 5e 05    	add    dl,BYTE PTR [ecx+0x55e1360]
     e6a:	00 00                	add    BYTE PTR [eax],al
     e6c:	01 b2 3a 00 00 00    	add    DWORD PTR [edx+0x3a],esi
     e72:	02 91 5c 13 48 06    	add    dl,BYTE PTR [ecx+0x648135c]
     e78:	00 00                	add    BYTE PTR [eax],al
     e7a:	01 b3 3a 00 00 00    	add    DWORD PTR [ebx+0x3a],esi
     e80:	02 91 58 13 45 06    	add    dl,BYTE PTR [ecx+0x6451358]
     e86:	00 00                	add    BYTE PTR [eax],al
     e88:	01 b4 3a 00 00 00 02 	add    DWORD PTR [edx+edi*1+0x2000000],esi
     e8f:	91                   	xchg   ecx,eax
     e90:	54                   	push   esp
     e91:	13 03                	adc    eax,DWORD PTR [ebx]
     e93:	05 00 00 01 b5       	add    eax,0xb5010000
     e98:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
     e9b:	00 02                	add    BYTE PTR [edx],al
     e9d:	91                   	xchg   ecx,eax
     e9e:	50                   	push   eax
     e9f:	13 70 04             	adc    esi,DWORD PTR [eax+0x4]
     ea2:	00 00                	add    BYTE PTR [eax],al
     ea4:	01 b6 6b 02 00 00    	add    DWORD PTR [esi+0x26b],esi
     eaa:	02 91 4c 1a a9 13    	add    dl,BYTE PTR [ecx+0x13a91a4c]
     eb0:	10 03                	adc    BYTE PTR [ebx],al
     eb2:	9e                   	sahf   
     eb3:	00 00                	add    BYTE PTR [eax],al
     eb5:	00 1b                	add    BYTE PTR [ebx],bl
     eb7:	b5 05                	mov    ch,0x5
     eb9:	00 00                	add    BYTE PTR [eax],al
     ebb:	01 0f                	add    DWORD PTR [edi],ecx
     ebd:	01 04 02             	add    DWORD PTR [edx+eax*1],eax
     ec0:	00 00                	add    BYTE PTR [eax],al
     ec2:	02 91 48 00 00 1c    	add    dl,BYTE PTR [ecx+0x1c000048]
     ec8:	1f                   	pop    ds
     ec9:	06                   	push   es
     eca:	00 00                	add    BYTE PTR [eax],al
     ecc:	01 25 01 6b 02 00    	add    DWORD PTR ds:0x26b01,esp
     ed2:	00 76 14             	add    BYTE PTR [esi+0x14],dh
     ed5:	10 03                	adc    BYTE PTR [ebx],al
     ed7:	76 00                	jbe    ed9 <cmdClearScreen-0x30ff127>
     ed9:	00 00                	add    BYTE PTR [eax],al
     edb:	01 9c 4b 05 00 00 1d 	add    DWORD PTR [ebx+ecx*2+0x1d000005],ebx
     ee2:	7a 06                	jp     eea <cmdClearScreen-0x30ff116>
     ee4:	00 00                	add    BYTE PTR [eax],al
     ee6:	01 25 01 3a 00 00    	add    DWORD PTR ds:0x3a01,esp
     eec:	00 02                	add    BYTE PTR [edx],al
     eee:	91                   	xchg   ecx,eax
     eef:	00 1d ca 03 00 00    	add    BYTE PTR ds:0x3ca,bl
     ef5:	01 25 01 e3 03 00    	add    DWORD PTR ds:0x3e301,esp
     efb:	00 02                	add    BYTE PTR [edx],al
     efd:	91                   	xchg   ecx,eax
     efe:	04 1d                	add    al,0x1d
     f00:	22 05 00 00 01 25    	and    al,BYTE PTR ds:0x25010000
     f06:	01 6b 02             	add    DWORD PTR [ebx+0x2],ebp
     f09:	00 00                	add    BYTE PTR [eax],al
     f0b:	02 91 08 1a 7d 14    	add    dl,BYTE PTR [ecx+0x147d1a08]
     f11:	10 03                	adc    BYTE PTR [ebx],al
     f13:	67 00 00             	add    BYTE PTR [bx+si],al
     f16:	00 1e                	add    BYTE PTR [esi],bl
     f18:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     f1b:	00 01                	add    BYTE PTR [ecx],al
     f1d:	27                   	daa    
     f1e:	01 3a                	add    DWORD PTR [edx],edi
     f20:	00 00                	add    BYTE PTR [eax],al
     f22:	00 02                	add    BYTE PTR [edx],al
     f24:	91                   	xchg   ecx,eax
     f25:	6c                   	ins    BYTE PTR es:[edi],dx
     f26:	00 00                	add    BYTE PTR [eax],al
     f28:	1f                   	pop    ds
     f29:	02 06                	add    al,BYTE PTR [esi]
     f2b:	00 00                	add    BYTE PTR [eax],al
     f2d:	01 2f                	add    DWORD PTR [edi],ebp
     f2f:	01 ec                	add    esp,ebp
     f31:	14 10                	adc    al,0x10
     f33:	03 3d 00 00 00 01    	add    edi,DWORD PTR ds:0x1000000
     f39:	9c                   	pushf  
     f3a:	99                   	cdq    
     f3b:	05 00 00 1d 7a       	add    eax,0x7a1d0000
     f40:	06                   	push   es
     f41:	00 00                	add    BYTE PTR [eax],al
     f43:	01 2f                	add    DWORD PTR [edi],ebp
     f45:	01 3a                	add    DWORD PTR [edx],edi
     f47:	00 00                	add    BYTE PTR [eax],al
     f49:	00 02                	add    BYTE PTR [edx],al
     f4b:	91                   	xchg   ecx,eax
     f4c:	00 1d ca 03 00 00    	add    BYTE PTR ds:0x3ca,bl
     f52:	01 2f                	add    DWORD PTR [edi],ebp
     f54:	01 6b 02             	add    DWORD PTR [ebx+0x2],ebp
     f57:	00 00                	add    BYTE PTR [eax],al
     f59:	02 91 04 1a f2 14    	add    dl,BYTE PTR [ecx+0x14f21a04]
     f5f:	10 03                	adc    BYTE PTR [ebx],al
     f61:	26 00 00             	add    BYTE PTR es:[eax],al
     f64:	00 1e                	add    BYTE PTR [esi],bl
     f66:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     f69:	00 01                	add    BYTE PTR [ecx],al
     f6b:	31 01                	xor    DWORD PTR [ecx],eax
     f6d:	3a 00                	cmp    al,BYTE PTR [eax]
     f6f:	00 00                	add    BYTE PTR [eax],al
     f71:	02 91 6c 00 00 1f    	add    dl,BYTE PTR [ecx+0x1f00006c]
     f77:	13 06                	adc    eax,DWORD PTR [esi]
     f79:	00 00                	add    BYTE PTR [eax],al
     f7b:	01 3e                	add    DWORD PTR [esi],edi
     f7d:	01 29                	add    DWORD PTR [ecx],ebp
     f7f:	15 10 03 2e 00       	adc    eax,0x2e0310
     f84:	00 00                	add    BYTE PTR [eax],al
     f86:	01 9c bf 05 00 00 1d 	add    DWORD PTR [edi+edi*4+0x1d000005],ebx
     f8d:	10 05 00 00 01 3e    	adc    BYTE PTR ds:0x3e010000,al
     f93:	01 04 02             	add    DWORD PTR [edx+eax*1],eax
     f96:	00 00                	add    BYTE PTR [eax],al
     f98:	02 91 00 00 20 5d    	add    dl,BYTE PTR [ecx+0x5d200000]
     f9e:	04 00                	add    al,0x0
     fa0:	00 01                	add    BYTE PTR [ecx],al
     fa2:	43                   	inc    ebx
     fa3:	01 57 15             	add    DWORD PTR [edi+0x15],edx
     fa6:	10 03                	adc    BYTE PTR [ebx],al
     fa8:	23 00                	and    eax,DWORD PTR [eax]
     faa:	00 00                	add    BYTE PTR [eax],al
     fac:	01 9c 1c a7 06 00 00 	add    DWORD PTR [esp+ebx*1+0x6a7],ebx
     fb3:	01 48 01             	add    DWORD PTR [eax+0x1],ecx
     fb6:	3a 00                	cmp    al,BYTE PTR [eax]
     fb8:	00 00                	add    BYTE PTR [eax],al
     fba:	7a 15                	jp     fd1 <cmdClearScreen-0x30ff02f>
     fbc:	10 03                	adc    BYTE PTR [ebx],al
     fbe:	26 00 00             	add    BYTE PTR es:[eax],al
     fc1:	00 01                	add    BYTE PTR [ecx],al
     fc3:	9c                   	pushf  
     fc4:	fb                   	sti    
     fc5:	05 00 00 1d 10       	add    eax,0x101d0000
     fca:	05 00 00 01 48       	add    eax,0x48010000
     fcf:	01 04 02             	add    DWORD PTR [edx+eax*1],eax
     fd2:	00 00                	add    BYTE PTR [eax],al
     fd4:	02 91 00 00 21 27    	add    dl,BYTE PTR [ecx+0x27210000]
     fda:	05 00 00 01 50       	add    eax,0x50010000
     fdf:	01 3a                	add    DWORD PTR [edx],edi
     fe1:	00 00                	add    BYTE PTR [eax],al
     fe3:	00 a0 15 10 03 16    	add    BYTE PTR [eax+0x16031015],ah
     fe9:	00 00                	add    BYTE PTR [eax],al
     feb:	00 01                	add    BYTE PTR [ecx],al
     fed:	9c                   	pushf  
     fee:	25 06 00 00 1d       	and    eax,0x1d000006
     ff3:	fb                   	sti    
     ff4:	05 00 00 01 50       	add    eax,0x50010000
     ff9:	01 3a                	add    DWORD PTR [edx],edi
     ffb:	00 00                	add    BYTE PTR [eax],al
     ffd:	00 02                	add    BYTE PTR [edx],al
     fff:	91                   	xchg   ecx,eax
    1000:	00 00                	add    BYTE PTR [eax],al
    1002:	21 a6 05 00 00 01    	and    DWORD PTR [esi+0x1000005],esp
    1008:	5a                   	pop    edx
    1009:	01 3a                	add    DWORD PTR [edx],edi
    100b:	00 00                	add    BYTE PTR [eax],al
    100d:	00 b6 15 10 03 20    	add    BYTE PTR [esi+0x20031015],dh
    1013:	00 00                	add    BYTE PTR [eax],al
    1015:	00 01                	add    BYTE PTR [ecx],al
    1017:	9c                   	pushf  
    1018:	4f                   	dec    edi
    1019:	06                   	push   es
    101a:	00 00                	add    BYTE PTR [eax],al
    101c:	1d fb 05 00 00       	sbb    eax,0x5fb
    1021:	01 5a 01             	add    DWORD PTR [edx+0x1],ebx
    1024:	3a 00                	cmp    al,BYTE PTR [eax]
    1026:	00 00                	add    BYTE PTR [eax],al
    1028:	02 91 00 00 1c d6    	add    dl,BYTE PTR [ecx-0x29e40000]
    102e:	06                   	push   es
    102f:	00 00                	add    BYTE PTR [eax],al
    1031:	01 67 01             	add    DWORD PTR [edi+0x1],esp
    1034:	3a 00                	cmp    al,BYTE PTR [eax]
    1036:	00 00                	add    BYTE PTR [eax],al
    1038:	d6                   	(bad)  
    1039:	15 10 03 56 04       	adc    eax,0x4560310
    103e:	00 00                	add    BYTE PTR [eax],al
    1040:	01 9c 2b 07 00 00 1d 	add    DWORD PTR [ebx+ebp*1+0x1d000007],ebx
    1047:	48                   	dec    eax
    1048:	06                   	push   es
    1049:	00 00                	add    BYTE PTR [eax],al
    104b:	01 67 01             	add    DWORD PTR [edi+0x1],esp
    104e:	3a 00                	cmp    al,BYTE PTR [eax]
    1050:	00 00                	add    BYTE PTR [eax],al
    1052:	02 91 00 1d 03 05    	add    dl,BYTE PTR [ecx+0x5031d00]
    1058:	00 00                	add    BYTE PTR [eax],al
    105a:	01 67 01             	add    DWORD PTR [edi+0x1],esp
    105d:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
    1060:	00 02                	add    BYTE PTR [edx],al
    1062:	91                   	xchg   ecx,eax
    1063:	04 1d                	add    al,0x1d
    1065:	c9                   	leave  
    1066:	04 00                	add    al,0x0
    1068:	00 01                	add    BYTE PTR [ecx],al
    106a:	67 01 6b 02          	add    DWORD PTR [bp+di+0x2],ebp
    106e:	00 00                	add    BYTE PTR [eax],al
    1070:	02 91 08 1b ce 04    	add    dl,BYTE PTR [ecx+0x4ce1b08]
    1076:	00 00                	add    BYTE PTR [eax],al
    1078:	01 69 01             	add    DWORD PTR [ecx+0x1],ebp
    107b:	48                   	dec    eax
    107c:	00 00                	add    BYTE PTR [eax],al
    107e:	00 02                	add    BYTE PTR [edx],al
    1080:	91                   	xchg   ecx,eax
    1081:	5f                   	pop    edi
    1082:	1b 91 06 00 00 01    	sbb    edx,DWORD PTR [ecx+0x1000006]
    1088:	6a 01                	push   0x1
    108a:	3a 00                	cmp    al,BYTE PTR [eax]
    108c:	00 00                	add    BYTE PTR [eax],al
    108e:	02 91 6c 1b 54 06    	add    dl,BYTE PTR [ecx+0x6541b6c]
    1094:	00 00                	add    BYTE PTR [eax],al
    1096:	01 6b 01             	add    DWORD PTR [ebx+0x1],ebp
    1099:	3a 00                	cmp    al,BYTE PTR [eax]
    109b:	00 00                	add    BYTE PTR [eax],al
    109d:	02 91 68 1b 0b 06    	add    dl,BYTE PTR [ecx+0x60b1b68]
    10a3:	00 00                	add    BYTE PTR [eax],al
    10a5:	01 6c 01 2b          	add    DWORD PTR [ecx+eax*1+0x2b],ebp
    10a9:	07                   	pop    es
    10aa:	00 00                	add    BYTE PTR [eax],al
    10ac:	02 91 4b 22 e9 04    	add    dl,BYTE PTR [ecx+0x4e9224b]
    10b2:	00 00                	add    BYTE PTR [eax],al
    10b4:	01 80 01 aa 16 10    	add    DWORD PTR [eax+0x1016aa01],eax
    10ba:	03 22                	add    esp,DWORD PTR [edx]
    10bc:	85 04 00             	test   DWORD PTR [eax+eax*1],eax
    10bf:	00 01                	add    BYTE PTR [ecx],al
    10c1:	88 01                	mov    BYTE PTR [ecx],al
    10c3:	f7 16                	not    DWORD PTR [esi]
    10c5:	10 03                	adc    BYTE PTR [ebx],al
    10c7:	22 81 06 00 00 01    	and    al,BYTE PTR [ecx+0x1000006]
    10cd:	f6 01 98             	test   BYTE PTR [ecx],0x98
    10d0:	19 10                	sbb    DWORD PTR [eax],edx
    10d2:	03 23                	add    esp,DWORD PTR [ebx]
    10d4:	fd                   	std    
    10d5:	16                   	push   ss
    10d6:	10 03                	adc    BYTE PTR [ebx],al
    10d8:	64 00 00             	add    BYTE PTR fs:[eax],al
    10db:	00 13                	add    BYTE PTR [ebx],dl
    10dd:	07                   	pop    es
    10de:	00 00                	add    BYTE PTR [eax],al
    10e0:	1b 23                	sbb    esp,DWORD PTR [ebx]
    10e2:	00 00                	add    BYTE PTR [eax],al
    10e4:	00 01                	add    BYTE PTR [ecx],al
    10e6:	8d 01                	lea    eax,[ecx]
    10e8:	3a 00                	cmp    al,BYTE PTR [eax]
    10ea:	00 00                	add    BYTE PTR [eax],al
    10ec:	02 91 64 00 1a a3    	add    dl,BYTE PTR [ecx-0x5ce5ff9c]
    10f2:	19 10                	sbb    DWORD PTR [eax],edx
    10f4:	03 45 00             	add    eax,DWORD PTR [ebp+0x0]
    10f7:	00 00                	add    BYTE PTR [eax],al
    10f9:	1e                   	push   ds
    10fa:	69 00 01 fb 01 3a    	imul   eax,DWORD PTR [eax],0x3a01fb01
    1100:	00 00                	add    BYTE PTR [eax],al
    1102:	00 02                	add    BYTE PTR [edx],al
    1104:	91                   	xchg   ecx,eax
    1105:	60                   	pusha  
    1106:	00 00                	add    BYTE PTR [eax],al
    1108:	17                   	pop    ss
    1109:	25 00 00 00 3b       	and    eax,0x3b000000
    110e:	07                   	pop    es
    110f:	00 00                	add    BYTE PTR [eax],al
    1111:	18 9e 00 00 00 13    	sbb    BYTE PTR [esi+0x13000000],bl
    1117:	00 17                	add    BYTE PTR [edi],dl
    1119:	0a 02                	or     al,BYTE PTR [edx]
    111b:	00 00                	add    BYTE PTR [eax],al
    111d:	4b                   	dec    ebx
    111e:	07                   	pop    es
    111f:	00 00                	add    BYTE PTR [eax],al
    1121:	18 9e 00 00 00 0a    	sbb    BYTE PTR [esi+0xa000000],bl
    1127:	00 13                	add    BYTE PTR [ebx],dl
    1129:	77 04                	ja     112f <cmdClearScreen-0x30feed1>
    112b:	00 00                	add    BYTE PTR [eax],al
    112d:	04 3d                	add    al,0x3d
    112f:	3b 07                	cmp    eax,DWORD PTR [edi]
    1131:	00 00                	add    BYTE PTR [eax],al
    1133:	05 03 e0 2c 10       	add    eax,0x102ce003
    1138:	03 24 13             	add    esp,DWORD PTR [ebx+edx*1]
    113b:	01 00                	add    DWORD PTR [eax],eax
    113d:	00 05 34 61 00 00    	add    BYTE PTR ds:0x6134,al
    1143:	00 05 03 0c 32 10    	add    BYTE PTR ds:0x10320c03,al
    1149:	03 24 d8             	add    esp,DWORD PTR [eax+ebx*8]
    114c:	01 00                	add    DWORD PTR [eax],eax
    114e:	00 05 35 61 00 00    	add    BYTE PTR ds:0x6135,al
    1154:	00 05 03 10 32 10    	add    BYTE PTR ds:0x10321003,al
    115a:	03 24 10             	add    esp,DWORD PTR [eax+edx*1]
    115d:	00 00                	add    BYTE PTR [eax],al
    115f:	00 05 36 61 00 00    	add    BYTE PTR ds:0x6136,al
    1165:	00 05 03 08 32 10    	add    BYTE PTR ds:0x10320803,al
    116b:	03 24 76             	add    esp,DWORD PTR [esi+esi*2]
    116e:	00 00                	add    BYTE PTR [eax],al
    1170:	00 05 37 85 00 00    	add    BYTE PTR ds:0x8537,al
    1176:	00 05 03 28 32 10    	add    BYTE PTR ds:0x10322803,al
    117c:	03 24 ee             	add    esp,DWORD PTR [esi+ebp*8]
    117f:	00 00                	add    BYTE PTR [eax],al
    1181:	00 06                	add    BYTE PTR [esi],al
    1183:	2d b1 07 00 00       	sub    eax,0x7b1
    1188:	05 03 04 32 10       	add    eax,0x10320403
    118d:	03 05 04 7a 00 00    	add    eax,DWORD PTR ds:0x7a04
    1193:	00 24 1c             	add    BYTE PTR [esp+ebx*1],ah
    1196:	01 00                	add    DWORD PTR [eax],eax
    1198:	00 06                	add    BYTE PTR [esi],al
    119a:	2e                   	cs
    119b:	61                   	popa   
    119c:	00 00                	add    BYTE PTR [eax],al
    119e:	00 05 03 e0 2f 10    	add    BYTE PTR ds:0x102fe003,al
    11a4:	03 24 2b             	add    esp,DWORD PTR [ebx+ebp*1]
    11a7:	04 00                	add    al,0x0
    11a9:	00 07                	add    BYTE PTR [edi],al
    11ab:	54                   	push   esp
    11ac:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
    11af:	00 05 03 18 32 10    	add    BYTE PTR ds:0x10321803,al
    11b5:	03 24 4f             	add    esp,DWORD PTR [edi+ecx*2]
    11b8:	05 00 00 03 63       	add    eax,0x63030000
    11bd:	28 01                	sub    BYTE PTR [ecx],al
    11bf:	00 00                	add    BYTE PTR [eax],al
    11c1:	05 03 44 2c 11       	add    eax,0x112c4403
    11c6:	03 24 df             	add    esp,DWORD PTR [edi+ebx*8]
    11c9:	05 00 00 03 e1       	add    eax,0xe1030000
    11ce:	77 01                	ja     11d1 <cmdClearScreen-0x30fee2f>
    11d0:	00 00                	add    BYTE PTR [eax],al
    11d2:	05 03 40 2c 11       	add    eax,0x112c4003
    11d7:	03 25 24 51 00 00    	add    esp,DWORD PTR ds:0x5124
    11dd:	00 04 2c             	add    BYTE PTR [esp+ebp*1],al
    11e0:	0d 08 00 00 05       	or     eax,0x5000008
    11e5:	03 14 32             	add    edx,DWORD PTR [edx+esi*1]
    11e8:	10 03                	adc    BYTE PTR [ebx],al
    11ea:	05 04 fb 07 00       	add    eax,0x7fb04
    11ef:	00 26                	add    BYTE PTR [esi],ah
    11f1:	1e                   	push   ds
    11f2:	08 00                	or     BYTE PTR [eax],al
    11f4:	00 27                	add    BYTE PTR [edi],ah
    11f6:	04 02                	add    al,0x2
    11f8:	00 00                	add    BYTE PTR [eax],al
    11fa:	00 24 ce             	add    BYTE PTR [esi+ecx*8],ah
    11fd:	02 00                	add    al,BYTE PTR [eax]
    11ff:	00 04 2d 2f 08 00 00 	add    BYTE PTR [ebp*1+0x82f],al
    1206:	05 03 00 32 10       	add    eax,0x10320003
    120b:	03 05 04 13 08 00    	add    eax,DWORD PTR ds:0x81304
    1211:	00 17                	add    BYTE PTR [edi],dl
    1213:	25 00 00 00 46       	and    eax,0x46000000
    1218:	08 00                	or     BYTE PTR [eax],al
    121a:	00 28                	add    BYTE PTR [eax],ch
    121c:	9e                   	sahf   
    121d:	00 00                	add    BYTE PTR [eax],al
    121f:	00 ff                	add    bh,bh
    1221:	01 00                	add    DWORD PTR [eax],eax
    1223:	24 c9                	and    al,0xc9
    1225:	00 00                	add    BYTE PTR [eax],al
    1227:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
    122a:	35 08 00 00 05       	xor    eax,0x5000008
    122f:	03 00                	add    eax,DWORD PTR [eax]
    1231:	30 10                	xor    BYTE PTR [eax],dl
    1233:	03 24 3d 03 00 00 04 	add    esp,DWORD PTR [edi*1+0x4000003]
    123a:	34 04                	xor    al,0x4
    123c:	02 00                	add    al,BYTE PTR [eax]
    123e:	00 05 03 24 32 10    	add    BYTE PTR ds:0x10322403,al
    1244:	03 24 b0             	add    esp,DWORD PTR [eax+esi*4]
    1247:	02 00                	add    al,BYTE PTR [eax]
    1249:	00 04 35 6b 02 00 00 	add    BYTE PTR [esi*1+0x26b],al
    1250:	05 03 cc 2e 10       	add    eax,0x102ecc03
    1255:	03 17                	add    edx,DWORD PTR [edi]
    1257:	25 00 00 00 89       	and    eax,0x89000000
    125c:	08 00                	or     BYTE PTR [eax],al
    125e:	00 18                	add    BYTE PTR [eax],bl
    1260:	9e                   	sahf   
    1261:	00 00                	add    BYTE PTR [eax],al
    1263:	00 05 00 24 7a 03    	add    BYTE PTR ds:0x37a2400,al
    1269:	00 00                	add    BYTE PTR [eax],al
    126b:	04 36                	add    al,0x36
    126d:	79 08                	jns    1277 <cmdClearScreen-0x30fed89>
    126f:	00 00                	add    BYTE PTR [eax],al
    1271:	05 03 c4 2e 10       	add    eax,0x102ec403
    1276:	03 24 1d 03 00 00 04 	add    esp,DWORD PTR [ebx*1+0x4000003]
    127d:	37                   	aaa    
    127e:	61                   	popa   
    127f:	00 00                	add    BYTE PTR [eax],al
    1281:	00 05 03 20 32 10    	add    BYTE PTR ds:0x10322003,al
    1287:	03 24 eb             	add    esp,DWORD PTR [ebx+ebp*8]
    128a:	01 00                	add    DWORD PTR [eax],eax
    128c:	00 04 37             	add    BYTE PTR [edi+esi*1],al
    128f:	61                   	popa   
    1290:	00 00                	add    BYTE PTR [eax],al
    1292:	00 05 03 1c 32 10    	add    BYTE PTR ds:0x10321c03,al
    1298:	03 24 8f             	add    esp,DWORD PTR [edi+ecx*4]
    129b:	01 00                	add    DWORD PTR [eax],eax
    129d:	00 04 38             	add    BYTE PTR [eax+edi*1],al
    12a0:	97                   	xchg   edi,eax
    12a1:	00 00                	add    BYTE PTR [eax],al
    12a3:	00 05 03 2c 32 10    	add    BYTE PTR ds:0x10322c03,al
    12a9:	03 17                	add    edx,DWORD PTR [edi]
    12ab:	25 00 00 00 dd       	and    eax,0xdd000000
    12b0:	08 00                	or     BYTE PTR [eax],al
    12b2:	00 18                	add    BYTE PTR [eax],bl
    12b4:	9e                   	sahf   
    12b5:	00 00                	add    BYTE PTR [eax],al
    12b7:	00 ff                	add    bh,bh
    12b9:	00 29                	add    BYTE PTR [ecx],ch
    12bb:	63 77 64             	arpl   WORD PTR [edi+0x64],si
    12be:	00 04 39             	add    BYTE PTR [ecx+edi*1],al
    12c1:	cd 08                	int    0x8
    12c3:	00 00                	add    BYTE PTR [eax],al
    12c5:	05 03 e0 2e 10       	add    eax,0x102ee003
    12ca:	03 24 80             	add    esp,DWORD PTR [eax+eax*4]
    12cd:	03 00                	add    eax,DWORD PTR [eax]
    12cf:	00 04 3a             	add    BYTE PTR [edx+edi*1],al
    12d2:	97                   	xchg   edi,eax
    12d3:	00 00                	add    BYTE PTR [eax],al
    12d5:	00 05 03 c0 2e 10    	add    BYTE PTR ds:0x102ec003,al
    12db:	03 17                	add    edx,DWORD PTR [edi]
    12dd:	3a 00                	cmp    al,BYTE PTR [eax]
    12df:	00 00                	add    BYTE PTR [eax],al
    12e1:	0f 09                	wbinvd 
    12e3:	00 00                	add    BYTE PTR [eax],al
    12e5:	18 9e 00 00 00 01    	sbb    BYTE PTR [esi+0x1000000],bl
    12eb:	00 24 6e             	add    BYTE PTR [esi+ebp*2],ah
    12ee:	02 00                	add    al,BYTE PTR [eax]
    12f0:	00 04 3b             	add    BYTE PTR [ebx+edi*1],al
    12f3:	ff 08                	dec    DWORD PTR [eax]
    12f5:	00 00                	add    BYTE PTR [eax],al
    12f7:	05 03 30 32 10       	add    eax,0x10323003
    12fc:	03 17                	add    edx,DWORD PTR [edi]
    12fe:	25 00 00 00 37       	and    eax,0x37000000
    1303:	09 00                	or     DWORD PTR [eax],eax
    1305:	00 28                	add    BYTE PTR [eax],ch
    1307:	9e                   	sahf   
    1308:	00 00                	add    BYTE PTR [eax],al
    130a:	00 f3                	add    bl,dh
    130c:	01 18                	add    DWORD PTR [eax],ebx
    130e:	9e                   	sahf   
    130f:	00 00                	add    BYTE PTR [eax],al
    1311:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
    1314:	24 c7                	and    al,0xc7
    1316:	06                   	push   es
    1317:	00 00                	add    BYTE PTR [eax],al
    1319:	01 10                	add    DWORD PTR [eax],edx
    131b:	20 09                	and    BYTE PTR [ecx],cl
    131d:	00 00                	add    BYTE PTR [eax],al
    131f:	05 03 40 32 10       	add    eax,0x10324003
    1324:	03 24 c7             	add    esp,DWORD PTR [edi+eax*8]
    1327:	05 00 00 01 11       	add    eax,0x11010000
    132c:	3a 00                	cmp    al,BYTE PTR [eax]
    132e:	00 00                	add    BYTE PTR [eax],al
    1330:	05 03 38 32 10       	add    eax,0x10323803
    1335:	03 24 33             	add    esp,DWORD PTR [ebx+esi*1]
    1338:	06                   	push   es
    1339:	00 00                	add    BYTE PTR [eax],al
    133b:	01 12                	add    DWORD PTR [edx],edx
    133d:	3a 00                	cmp    al,BYTE PTR [eax]
    133f:	00 00                	add    BYTE PTR [eax],al
    1341:	05 03 3c 32 10       	add    eax,0x10323c03
    1346:	03 24 8f             	add    esp,DWORD PTR [edi+ecx*4]
    1349:	05 00 00 01 13       	add    eax,0x13010000
    134e:	cd 08                	int    0x8
    1350:	00 00                	add    BYTE PTR [eax],al
    1352:	05 03 60 2c 11       	add    eax,0x112c6003
    1357:	03 24 6f             	add    esp,DWORD PTR [edi+ebp*2]
    135a:	05 00 00 01 14       	add    eax,0x14010000
    135f:	6b 02 00             	imul   eax,DWORD PTR [edx],0x0
    1362:	00 05 03 60 2d 11    	add    BYTE PTR ds:0x112d6003,al
    1368:	03 00                	add    eax,DWORD PTR [eax]

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
  3b:	49                   	dec    ecx
  3c:	13 00                	adc    eax,DWORD PTR [eax]
  3e:	00 06                	add    BYTE PTR [esi],al
  40:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
  44:	00 00                	add    BYTE PTR [eax],al
  46:	07                   	pop    es
  47:	13 01                	adc    eax,DWORD PTR [ecx]
  49:	03 0e                	add    ecx,DWORD PTR [esi]
  4b:	0b 0b                	or     ecx,DWORD PTR [ebx]
  4d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  4f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  51:	01 13                	add    DWORD PTR [ebx],edx
  53:	00 00                	add    BYTE PTR [eax],al
  55:	08 0d 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,cl
  5b:	0b 3b                	or     edi,DWORD PTR [ebx]
  5d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  60:	38 0b                	cmp    BYTE PTR [ebx],cl
  62:	00 00                	add    BYTE PTR [eax],al
  64:	09 0f                	or     DWORD PTR [edi],ecx
  66:	00 0b                	add    BYTE PTR [ebx],cl
  68:	0b 00                	or     eax,DWORD PTR [eax]
  6a:	00 0a                	add    BYTE PTR [edx],cl
  6c:	04 01                	add    al,0x1
  6e:	03 0e                	add    ecx,DWORD PTR [esi]
  70:	0b 0b                	or     ecx,DWORD PTR [ebx]
  72:	49                   	dec    ecx
  73:	13 3a                	adc    edi,DWORD PTR [edx]
  75:	0b 3b                	or     edi,DWORD PTR [ebx]
  77:	0b 01                	or     eax,DWORD PTR [ecx]
  79:	13 00                	adc    eax,DWORD PTR [eax]
  7b:	00 0b                	add    BYTE PTR [ebx],cl
  7d:	28 00                	sub    BYTE PTR [eax],al
  7f:	03 0e                	add    ecx,DWORD PTR [esi]
  81:	1c 0b                	sbb    al,0xb
  83:	00 00                	add    BYTE PTR [eax],al
  85:	0c 13                	or     al,0x13
  87:	01 0b                	add    DWORD PTR [ebx],ecx
  89:	0b 3a                	or     edi,DWORD PTR [edx]
  8b:	0b 3b                	or     edi,DWORD PTR [ebx]
  8d:	0b 01                	or     eax,DWORD PTR [ecx]
  8f:	13 00                	adc    eax,DWORD PTR [eax]
  91:	00 0d 2e 00 3f 19    	add    BYTE PTR ds:0x193f002e,cl
  97:	03 0e                	add    ecx,DWORD PTR [esi]
  99:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  9b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  9d:	11 01                	adc    DWORD PTR [ecx],eax
  9f:	12 06                	adc    al,BYTE PTR [esi]
  a1:	40                   	inc    eax
  a2:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
  a8:	0e                   	push   cs
  a9:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  ac:	19 03                	sbb    DWORD PTR [ebx],eax
  ae:	0e                   	push   cs
  af:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  b1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  b3:	11 01                	adc    DWORD PTR [ecx],eax
  b5:	12 06                	adc    al,BYTE PTR [esi]
  b7:	40                   	inc    eax
  b8:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  be:	00 00                	add    BYTE PTR [eax],al
  c0:	0f 0b                	ud2    
  c2:	01 11                	add    DWORD PTR [ecx],edx
  c4:	01 12                	add    DWORD PTR [edx],edx
  c6:	06                   	push   es
  c7:	00 00                	add    BYTE PTR [eax],al
  c9:	10 34 00             	adc    BYTE PTR [eax+eax*1],dh
  cc:	03 08                	add    ecx,DWORD PTR [eax]
  ce:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  d0:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  d2:	49                   	dec    ecx
  d3:	13 02                	adc    eax,DWORD PTR [edx]
  d5:	18 00                	sbb    BYTE PTR [eax],al
  d7:	00 11                	add    BYTE PTR [ecx],dl
  d9:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  dc:	19 03                	sbb    DWORD PTR [ebx],eax
  de:	0e                   	push   cs
  df:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  e1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  e3:	27                   	daa    
  e4:	19 11                	sbb    DWORD PTR [ecx],edx
  e6:	01 12                	add    DWORD PTR [edx],edx
  e8:	06                   	push   es
  e9:	40                   	inc    eax
  ea:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  f0:	00 00                	add    BYTE PTR [eax],al
  f2:	12 05 00 03 0e 3a    	adc    al,BYTE PTR ds:0x3a0e0300
  f8:	0b 3b                	or     edi,DWORD PTR [ebx]
  fa:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  fd:	02 18                	add    bl,BYTE PTR [eax]
  ff:	00 00                	add    BYTE PTR [eax],al
 101:	13 34 00             	adc    esi,DWORD PTR [eax+eax*1]
 104:	03 0e                	add    ecx,DWORD PTR [esi]
 106:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 108:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 10a:	49                   	dec    ecx
 10b:	13 02                	adc    eax,DWORD PTR [edx]
 10d:	18 00                	sbb    BYTE PTR [eax],al
 10f:	00 14 01             	add    BYTE PTR [ecx+eax*1],dl
 112:	01 49 13             	add    DWORD PTR [ecx+0x13],ecx
 115:	01 13                	add    DWORD PTR [ebx],edx
 117:	00 00                	add    BYTE PTR [eax],al
 119:	15 21 00 49 13       	adc    eax,0x13490021
 11e:	2f                   	das    
 11f:	0b 00                	or     eax,DWORD PTR [eax]
 121:	00 16                	add    BYTE PTR [esi],dl
 123:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 126:	19 03                	sbb    DWORD PTR [ebx],eax
 128:	0e                   	push   cs
 129:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 12b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 12d:	27                   	daa    
 12e:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 131:	11 01                	adc    DWORD PTR [ecx],eax
 133:	12 06                	adc    al,BYTE PTR [esi]
 135:	40                   	inc    eax
 136:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 13c:	00 00                	add    BYTE PTR [eax],al
 13e:	17                   	pop    ss
 13f:	0b 01                	or     eax,DWORD PTR [ecx]
 141:	11 01                	adc    DWORD PTR [ecx],eax
 143:	12 06                	adc    al,BYTE PTR [esi]
 145:	01 13                	add    DWORD PTR [ebx],edx
 147:	00 00                	add    BYTE PTR [eax],al
 149:	18 34 00             	sbb    BYTE PTR [eax+eax*1],dh
 14c:	03 08                	add    ecx,DWORD PTR [eax]
 14e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 150:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 152:	49                   	dec    ecx
 153:	13 00                	adc    eax,DWORD PTR [eax]
 155:	00 19                	add    BYTE PTR [ecx],bl
 157:	0a 00                	or     al,BYTE PTR [eax]
 159:	03 0e                	add    ecx,DWORD PTR [esi]
 15b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 15d:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 163:	1a 34 00             	sbb    dh,BYTE PTR [eax+eax*1]
 166:	03 0e                	add    ecx,DWORD PTR [esi]
 168:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 16a:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 170:	00 00                	add    BYTE PTR [eax],al
 172:	1b 34 00             	sbb    esi,DWORD PTR [eax+eax*1]
 175:	03 08                	add    ecx,DWORD PTR [eax]
 177:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 179:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 17f:	00 00                	add    BYTE PTR [eax],al
 181:	1c 2e                	sbb    al,0x2e
 183:	01 3f                	add    DWORD PTR [edi],edi
 185:	19 03                	sbb    DWORD PTR [ebx],eax
 187:	0e                   	push   cs
 188:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 18a:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 190:	12 06                	adc    al,BYTE PTR [esi]
 192:	40                   	inc    eax
 193:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 199:	00 00                	add    BYTE PTR [eax],al
 19b:	1d 05 00 03 0e       	sbb    eax,0xe030005
 1a0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1a2:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 1a8:	00 00                	add    BYTE PTR [eax],al
 1aa:	1e                   	push   ds
 1ab:	0b 01                	or     eax,DWORD PTR [ecx]
 1ad:	55                   	push   ebp
 1ae:	17                   	pop    ss
 1af:	00 00                	add    BYTE PTR [eax],al
 1b1:	1f                   	pop    ds
 1b2:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 1b5:	19 03                	sbb    DWORD PTR [ebx],eax
 1b7:	0e                   	push   cs
 1b8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1ba:	3b 05 11 01 12 06    	cmp    eax,DWORD PTR ds:0x6120111
 1c0:	40                   	inc    eax
 1c1:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 1c7:	00 00                	add    BYTE PTR [eax],al
 1c9:	20 21                	and    BYTE PTR [ecx],ah
 1cb:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 1ce:	2f                   	das    
 1cf:	18 00                	sbb    BYTE PTR [eax],al
 1d1:	00 21                	add    BYTE PTR [ecx],ah
 1d3:	34 00                	xor    al,0x0
 1d5:	03 0e                	add    ecx,DWORD PTR [esi]
 1d7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1d9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1db:	49                   	dec    ecx
 1dc:	13 3f                	adc    edi,DWORD PTR [edi]
 1de:	19 02                	sbb    DWORD PTR [edx],eax
 1e0:	18 00                	sbb    BYTE PTR [eax],al
 1e2:	00 22                	add    BYTE PTR [edx],ah
 1e4:	15 00 27 19 00       	adc    eax,0x192700
 1e9:	00 23                	add    BYTE PTR [ebx],ah
 1eb:	15 01 27 19 01       	adc    eax,0x1192701
 1f0:	13 00                	adc    eax,DWORD PTR [eax]
 1f2:	00 24 05 00 49 13 00 	add    BYTE PTR [eax*1+0x134900],ah
 1f9:	00 25 21 00 49 13    	add    BYTE PTR ds:0x13490021,ah
 1ff:	2f                   	das    
 200:	05 00 00 26 34       	add    eax,0x34260000
 205:	00 03                	add    BYTE PTR [ebx],al
 207:	08 3a                	or     BYTE PTR [edx],bh
 209:	0b 3b                	or     edi,DWORD PTR [ebx]
 20b:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 20e:	3f                   	aas    
 20f:	19 02                	sbb    DWORD PTR [edx],eax
 211:	18 00                	sbb    BYTE PTR [eax],al
 213:	00 00                	add    BYTE PTR [eax],al
 215:	01 11                	add    DWORD PTR [ecx],edx
 217:	01 25 0e 13 0b 03    	add    DWORD PTR ds:0x30b130e,esp
 21d:	0e                   	push   cs
 21e:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 220:	11 01                	adc    DWORD PTR [ecx],eax
 222:	12 06                	adc    al,BYTE PTR [esi]
 224:	10 17                	adc    BYTE PTR [edi],dl
 226:	00 00                	add    BYTE PTR [eax],al
 228:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 22b:	0b 0b                	or     ecx,DWORD PTR [ebx]
 22d:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 230:	0e                   	push   cs
 231:	00 00                	add    BYTE PTR [eax],al
 233:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 236:	0b 0b                	or     ecx,DWORD PTR [ebx]
 238:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 23b:	08 00                	or     BYTE PTR [eax],al
 23d:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 240:	00 03                	add    BYTE PTR [ebx],al
 242:	0e                   	push   cs
 243:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 245:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 247:	49                   	dec    ecx
 248:	13 00                	adc    eax,DWORD PTR [eax]
 24a:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
 250:	49                   	dec    ecx
 251:	13 00                	adc    eax,DWORD PTR [eax]
 253:	00 06                	add    BYTE PTR [esi],al
 255:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
 259:	00 00                	add    BYTE PTR [eax],al
 25b:	07                   	pop    es
 25c:	0f 00 0b             	str    WORD PTR [ebx]
 25f:	0b 00                	or     eax,DWORD PTR [eax]
 261:	00 08                	add    BYTE PTR [eax],cl
 263:	13 01                	adc    eax,DWORD PTR [ecx]
 265:	0b 0b                	or     ecx,DWORD PTR [ebx]
 267:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 269:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 26b:	01 13                	add    DWORD PTR [ebx],edx
 26d:	00 00                	add    BYTE PTR [eax],al
 26f:	09 0d 00 03 0e 3a    	or     DWORD PTR ds:0x3a0e0300,ecx
 275:	0b 3b                	or     edi,DWORD PTR [ebx]
 277:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 27a:	0b 0b                	or     ecx,DWORD PTR [ebx]
 27c:	0d 0b 0c 0b 38       	or     eax,0x380b0c0b
 281:	0b 00                	or     eax,DWORD PTR [eax]
 283:	00 0a                	add    BYTE PTR [edx],cl
 285:	17                   	pop    ss
 286:	01 0b                	add    DWORD PTR [ebx],ecx
 288:	0b 3a                	or     edi,DWORD PTR [edx]
 28a:	0b 3b                	or     edi,DWORD PTR [ebx]
 28c:	0b 01                	or     eax,DWORD PTR [ecx]
 28e:	13 00                	adc    eax,DWORD PTR [eax]
 290:	00 0b                	add    BYTE PTR [ebx],cl
 292:	0d 00 49 13 00       	or     eax,0x134900
 297:	00 0c 0d 00 03 08 3a 	add    BYTE PTR [ecx*1+0x3a080300],cl
 29e:	0b 3b                	or     edi,DWORD PTR [ebx]
 2a0:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 2a3:	00 00                	add    BYTE PTR [eax],al
 2a5:	0d 04 01 03 0e       	or     eax,0xe030104
 2aa:	0b 0b                	or     ecx,DWORD PTR [ebx]
 2ac:	49                   	dec    ecx
 2ad:	13 3a                	adc    edi,DWORD PTR [edx]
 2af:	0b 3b                	or     edi,DWORD PTR [ebx]
 2b1:	0b 01                	or     eax,DWORD PTR [ecx]
 2b3:	13 00                	adc    eax,DWORD PTR [eax]
 2b5:	00 0e                	add    BYTE PTR [esi],cl
 2b7:	28 00                	sub    BYTE PTR [eax],al
 2b9:	03 0e                	add    ecx,DWORD PTR [esi]
 2bb:	1c 0b                	sbb    al,0xb
 2bd:	00 00                	add    BYTE PTR [eax],al
 2bf:	0f 0d 00             	prefetch BYTE PTR [eax]
 2c2:	03 0e                	add    ecx,DWORD PTR [esi]
 2c4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2c6:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2c8:	49                   	dec    ecx
 2c9:	13 38                	adc    edi,DWORD PTR [eax]
 2cb:	0b 00                	or     eax,DWORD PTR [eax]
 2cd:	00 10                	add    BYTE PTR [eax],dl
 2cf:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 2d2:	19 03                	sbb    DWORD PTR [ebx],eax
 2d4:	0e                   	push   cs
 2d5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2d7:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2d9:	27                   	daa    
 2da:	19 11                	sbb    DWORD PTR [ecx],edx
 2dc:	01 12                	add    DWORD PTR [edx],edx
 2de:	06                   	push   es
 2df:	40                   	inc    eax
 2e0:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 2e6:	00 00                	add    BYTE PTR [eax],al
 2e8:	11 05 00 03 0e 3a    	adc    DWORD PTR ds:0x3a0e0300,eax
 2ee:	0b 3b                	or     edi,DWORD PTR [ebx]
 2f0:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 2f3:	02 18                	add    bl,BYTE PTR [eax]
 2f5:	00 00                	add    BYTE PTR [eax],al
 2f7:	12 2e                	adc    ch,BYTE PTR [esi]
 2f9:	01 3f                	add    DWORD PTR [edi],edi
 2fb:	19 03                	sbb    DWORD PTR [ebx],eax
 2fd:	0e                   	push   cs
 2fe:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 300:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 302:	27                   	daa    
 303:	19 11                	sbb    DWORD PTR [ecx],edx
 305:	01 12                	add    DWORD PTR [edx],edx
 307:	06                   	push   es
 308:	40                   	inc    eax
 309:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 30f:	00 00                	add    BYTE PTR [eax],al
 311:	13 34 00             	adc    esi,DWORD PTR [eax+eax*1]
 314:	03 0e                	add    ecx,DWORD PTR [esi]
 316:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 318:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 31a:	49                   	dec    ecx
 31b:	13 02                	adc    eax,DWORD PTR [edx]
 31d:	18 00                	sbb    BYTE PTR [eax],al
 31f:	00 14 2e             	add    BYTE PTR [esi+ebp*1],dl
 322:	01 3f                	add    DWORD PTR [edi],edi
 324:	19 03                	sbb    DWORD PTR [ebx],eax
 326:	0e                   	push   cs
 327:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 329:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 32b:	27                   	daa    
 32c:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 32f:	11 01                	adc    DWORD PTR [ecx],eax
 331:	12 06                	adc    al,BYTE PTR [esi]
 333:	40                   	inc    eax
 334:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 33a:	00 00                	add    BYTE PTR [eax],al
 33c:	15 34 00 03 0e       	adc    eax,0xe030034
 341:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 343:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 345:	49                   	dec    ecx
 346:	13 00                	adc    eax,DWORD PTR [eax]
 348:	00 16                	add    BYTE PTR [esi],dl
 34a:	34 00                	xor    al,0x0
 34c:	03 08                	add    ecx,DWORD PTR [eax]
 34e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 350:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 352:	49                   	dec    ecx
 353:	13 00                	adc    eax,DWORD PTR [eax]
 355:	00 17                	add    BYTE PTR [edi],dl
 357:	01 01                	add    DWORD PTR [ecx],eax
 359:	49                   	dec    ecx
 35a:	13 01                	adc    eax,DWORD PTR [ecx]
 35c:	13 00                	adc    eax,DWORD PTR [eax]
 35e:	00 18                	add    BYTE PTR [eax],bl
 360:	21 00                	and    DWORD PTR [eax],eax
 362:	49                   	dec    ecx
 363:	13 2f                	adc    ebp,DWORD PTR [edi]
 365:	0b 00                	or     eax,DWORD PTR [eax]
 367:	00 19                	add    BYTE PTR [ecx],bl
 369:	34 00                	xor    al,0x0
 36b:	03 08                	add    ecx,DWORD PTR [eax]
 36d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 36f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 371:	49                   	dec    ecx
 372:	13 02                	adc    eax,DWORD PTR [edx]
 374:	18 00                	sbb    BYTE PTR [eax],al
 376:	00 1a                	add    BYTE PTR [edx],bl
 378:	0b 01                	or     eax,DWORD PTR [ecx]
 37a:	11 01                	adc    DWORD PTR [ecx],eax
 37c:	12 06                	adc    al,BYTE PTR [esi]
 37e:	00 00                	add    BYTE PTR [eax],al
 380:	1b 34 00             	sbb    esi,DWORD PTR [eax+eax*1]
 383:	03 0e                	add    ecx,DWORD PTR [esi]
 385:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 387:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 38d:	00 00                	add    BYTE PTR [eax],al
 38f:	1c 2e                	sbb    al,0x2e
 391:	01 3f                	add    DWORD PTR [edi],edi
 393:	19 03                	sbb    DWORD PTR [ebx],eax
 395:	0e                   	push   cs
 396:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 398:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 39e:	11 01                	adc    DWORD PTR [ecx],eax
 3a0:	12 06                	adc    al,BYTE PTR [esi]
 3a2:	40                   	inc    eax
 3a3:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 3a9:	00 00                	add    BYTE PTR [eax],al
 3ab:	1d 05 00 03 0e       	sbb    eax,0xe030005
 3b0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3b2:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 3b8:	00 00                	add    BYTE PTR [eax],al
 3ba:	1e                   	push   ds
 3bb:	34 00                	xor    al,0x0
 3bd:	03 08                	add    ecx,DWORD PTR [eax]
 3bf:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3c1:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 3c7:	00 00                	add    BYTE PTR [eax],al
 3c9:	1f                   	pop    ds
 3ca:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 3cd:	19 03                	sbb    DWORD PTR [ebx],eax
 3cf:	0e                   	push   cs
 3d0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3d2:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 3d8:	12 06                	adc    al,BYTE PTR [esi]
 3da:	40                   	inc    eax
 3db:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 3e1:	00 00                	add    BYTE PTR [eax],al
 3e3:	20 2e                	and    BYTE PTR [esi],ch
 3e5:	00 3f                	add    BYTE PTR [edi],bh
 3e7:	19 03                	sbb    DWORD PTR [ebx],eax
 3e9:	0e                   	push   cs
 3ea:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3ec:	3b 05 11 01 12 06    	cmp    eax,DWORD PTR ds:0x6120111
 3f2:	40                   	inc    eax
 3f3:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 3f9:	21 2e                	and    DWORD PTR [esi],ebp
 3fb:	01 3f                	add    DWORD PTR [edi],edi
 3fd:	19 03                	sbb    DWORD PTR [ebx],eax
 3ff:	0e                   	push   cs
 400:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 402:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 408:	11 01                	adc    DWORD PTR [ecx],eax
 40a:	12 06                	adc    al,BYTE PTR [esi]
 40c:	40                   	inc    eax
 40d:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 413:	00 00                	add    BYTE PTR [eax],al
 415:	22 0a                	and    cl,BYTE PTR [edx]
 417:	00 03                	add    BYTE PTR [ebx],al
 419:	0e                   	push   cs
 41a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 41c:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 422:	23 0b                	and    ecx,DWORD PTR [ebx]
 424:	01 11                	add    DWORD PTR [ecx],edx
 426:	01 12                	add    DWORD PTR [edx],edx
 428:	06                   	push   es
 429:	01 13                	add    DWORD PTR [ebx],edx
 42b:	00 00                	add    BYTE PTR [eax],al
 42d:	24 34                	and    al,0x34
 42f:	00 03                	add    BYTE PTR [ebx],al
 431:	0e                   	push   cs
 432:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 434:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 436:	49                   	dec    ecx
 437:	13 3f                	adc    edi,DWORD PTR [edi]
 439:	19 02                	sbb    DWORD PTR [edx],eax
 43b:	18 00                	sbb    BYTE PTR [eax],al
 43d:	00 25 15 00 27 19    	add    BYTE PTR ds:0x19270015,ah
 443:	00 00                	add    BYTE PTR [eax],al
 445:	26                   	es
 446:	15 01 27 19 01       	adc    eax,0x1192701
 44b:	13 00                	adc    eax,DWORD PTR [eax]
 44d:	00 27                	add    BYTE PTR [edi],ah
 44f:	05 00 49 13 00       	add    eax,0x134900
 454:	00 28                	add    BYTE PTR [eax],ch
 456:	21 00                	and    DWORD PTR [eax],eax
 458:	49                   	dec    ecx
 459:	13 2f                	adc    ebp,DWORD PTR [edi]
 45b:	05 00 00 29 34       	add    eax,0x34290000
 460:	00 03                	add    BYTE PTR [ebx],al
 462:	08 3a                	or     BYTE PTR [edx],bh
 464:	0b 3b                	or     edi,DWORD PTR [ebx]
 466:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 469:	3f                   	aas    
 46a:	19 02                	sbb    DWORD PTR [edx],eax
 46c:	18 00                	sbb    BYTE PTR [eax],al
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
  14:	bf 0d 00 00 00       	mov    edi,0xd
  19:	00 00                	add    BYTE PTR [eax],al
  1b:	00 00                	add    BYTE PTR [eax],al
  1d:	00 00                	add    BYTE PTR [eax],al
  1f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
  22:	00 00                	add    BYTE PTR [eax],al
  24:	02 00                	add    al,BYTE PTR [eax]
  26:	dd 09                	fisttp QWORD PTR [ecx]
  28:	00 00                	add    BYTE PTR [eax],al
  2a:	04 00                	add    al,0x0
  2c:	00 00                	add    BYTE PTR [eax],al
  2e:	00 00                	add    BYTE PTR [eax],al
  30:	c0 0d 10 03 6c 0c 00 	ror    BYTE PTR ds:0xc6c0310,0x0
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	b8 0a 00 00 1a       	mov    eax,0x1a00000a
   5:	0b 00                	or     eax,DWORD PTR [eax]
   7:	00 1c 0b             	add    BYTE PTR [ebx+ecx*1],bl
   a:	00 00                	add    BYTE PTR [eax],al
   c:	1d 0b 00 00 00       	sbb    eax,0xb
  11:	00 00                	add    BYTE PTR [eax],al
  13:	00 00                	add    BYTE PTR [eax],al
  15:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	c4 02                	les    eax,FWORD PTR [edx]
   2:	00 00                	add    BYTE PTR [eax],al
   4:	02 00                	add    al,BYTE PTR [eax]
   6:	ff 00                	inc    DWORD PTR [eax]
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
  71:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
  74:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  78:	65 00 69 6e          	add    BYTE PTR gs:[ecx+0x6e],ch
  7c:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  80:	65                   	gs
  81:	2f                   	das    
  82:	2e                   	cs
  83:	2e                   	cs
  84:	2f                   	das    
  85:	2e                   	cs
  86:	2e                   	cs
  87:	2f                   	das    
  88:	2e                   	cs
  89:	2e                   	cs
  8a:	2f                   	das    
  8b:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
  8f:	6a 2f                	push   0x2f
  91:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
  94:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
  9b:	6e                   	outs   dx,BYTE PTR ds:[esi]
  9c:	65                   	gs
  9d:	6c                   	ins    BYTE PTR es:[edi],dx
  9e:	2f                   	das    
  9f:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  a6:	00 00                	add    BYTE PTR [eax],al
  a8:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  ab:	6d                   	ins    DWORD PTR es:[edi],dx
  ac:	61                   	popa   
  ad:	6e                   	outs   dx,BYTE PTR ds:[esi]
  ae:	64                   	fs
  af:	73 2e                	jae    df <cmdClearScreen-0x30fff21>
  b1:	63 00                	arpl   WORD PTR [eax],ax
  b3:	01 00                	add    DWORD PTR [eax],eax
  b5:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  b8:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
  bf:	63 
  c0:	2e                   	cs
  c1:	68 00 02 00 00       	push   0x200
  c6:	66 69 6c 65 2e 68 00 	imul   bp,WORD PTR [ebp+eiz*2+0x2e],0x68
  cd:	03 00                	add    eax,DWORD PTR [eax]
  cf:	00 6b 73             	add    BYTE PTR [ebx+0x73],ch
  d2:	68 65 6c 6c 2e       	push   0x2e6c6c65
  d7:	68 00 04 00 00       	push   0x400
  dc:	6d                   	ins    DWORD PTR es:[edi],dx
  dd:	61                   	popa   
  de:	6c                   	ins    BYTE PTR es:[edi],dx
  df:	6c                   	ins    BYTE PTR es:[edi],dx
  e0:	6f                   	outs   dx,DWORD PTR ds:[esi]
  e1:	63 2e                	arpl   WORD PTR [esi],bp
  e3:	68 00 03 00 00       	push   0x300
  e8:	6c                   	ins    BYTE PTR es:[edi],dx
  e9:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  f0:	4f                   	dec    edi
  f1:	53                   	push   ebx
  f2:	2e                   	cs
  f3:	68 00 03 00 00       	push   0x300
  f8:	74 68                	je     162 <cmdClearScreen-0x30ffe9e>
  fa:	65                   	gs
  fb:	73 69                	jae    166 <cmdClearScreen-0x30ffe9a>
  fd:	67 6e                	outs   dx,BYTE PTR ds:[si]
  ff:	61                   	popa   
 100:	6c                   	ins    BYTE PTR es:[edi],dx
 101:	73 2e                	jae    131 <cmdClearScreen-0x30ffecf>
 103:	68 00 05 00 00       	push   0x500
 108:	00 00                	add    BYTE PTR [eax],al
 10a:	05 02 00 00 10       	add    eax,0x10000002
 10f:	03 03                	add    eax,DWORD PTR [ebx]
 111:	0c 01                	or     al,0x1
 113:	67 f3 3f             	addr16 repz aas 
 116:	67 92                	addr16 xchg edx,eax
 118:	08 30                	or     BYTE PTR [eax],dh
 11a:	00 02                	add    BYTE PTR [edx],al
 11c:	04 02                	add    al,0x2
 11e:	08 e0                	or     al,ah
 120:	00 02                	add    BYTE PTR [edx],al
 122:	04 01                	add    al,0x1
 124:	06                   	push   es
 125:	4a                   	dec    edx
 126:	06                   	push   es
 127:	6e                   	outs   dx,BYTE PTR ds:[esi]
 128:	3f                   	aas    
 129:	94                   	xchg   esp,eax
 12a:	02 22                	add    ah,BYTE PTR [edx]
 12c:	14 d7                	adc    al,0xd7
 12e:	08 91 68 f3 5a f3    	or     BYTE PTR [ecx-0xca50c98],dl
 134:	08 f3                	or     bl,dh
 136:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 139:	21 08                	and    DWORD PTR [eax],ecx
 13b:	83 ad 08 f3 d7 d7 08 	sub    DWORD PTR [ebp-0x28280cf8],0x8
 142:	13 d7                	adc    edx,edi
 144:	f5                   	cmc    
 145:	59                   	pop    ecx
 146:	31 bb 08 68 68 af    	xor    DWORD PTR [ebx-0x509797f8],edi
 14c:	08 3e                	or     BYTE PTR [esi],bh
 14e:	08 67 08             	or     BYTE PTR [edi+0x8],ah
 151:	5c                   	pop    esp
 152:	08 30                	or     BYTE PTR [eax],dh
 154:	3f                   	aas    
 155:	67 68 75 75 75 7a    	addr16 push 0x7a757575
 15b:	08 2f                	or     BYTE PTR [edi],ch
 15d:	08 30                	or     BYTE PTR [eax],dh
 15f:	08 68 a0             	or     BYTE PTR [eax-0x60],ch
 162:	08 30                	or     BYTE PTR [eax],dh
 164:	08 13                	or     BYTE PTR [ebx],dl
 166:	be 08 2f 08 14       	mov    esi,0x14082f08
 16b:	08 30                	or     BYTE PTR [eax],dh
 16d:	08 4b 30             	or     BYTE PTR [ebx+0x30],cl
 170:	08 13                	or     BYTE PTR [ebx],dl
 172:	08 2f                	or     BYTE PTR [edi],ch
 174:	08 13                	or     BYTE PTR [ebx],dl
 176:	08 4b 68             	or     BYTE PTR [ebx+0x68],cl
 179:	08 13                	or     BYTE PTR [ebx],dl
 17b:	75 30                	jne    1ad <cmdClearScreen-0x30ffe53>
 17d:	03 74 08 3c          	add    esi,DWORD PTR [eax+ecx*1+0x3c]
 181:	03 0f                	add    ecx,DWORD PTR [edi]
 183:	9e                   	sahf   
 184:	68 08 2f 08 2f       	push   0x2f082f08
 189:	08 13                	or     BYTE PTR [ebx],dl
 18b:	08 4b 68             	or     BYTE PTR [ebx+0x68],cl
 18e:	08 13                	or     BYTE PTR [ebx],dl
 190:	79 67                	jns    1f9 <cmdClearScreen-0x30ffe07>
 192:	d7                   	xlat   BYTE PTR ds:[ebx]
 193:	67 d7                	xlat   BYTE PTR ds:[bx]
 195:	67 d8 3d             	fdivr  DWORD PTR [di]
 198:	31 91 4b 76 77 d7    	xor    DWORD PTR [ecx-0x288889b5],edx
 19e:	75 08                	jne    1a8 <cmdClearScreen-0x30ffe58>
 1a0:	4b                   	dec    ebx
 1a1:	a0 75 75 4b d9       	mov    al,ds:0xd94b7575
 1a6:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 1a9:	5a                   	pop    edx
 1aa:	68 f3 08 9f 4d       	push   0x4d9f08f3
 1af:	a0 08 2f 08 83       	mov    al,ds:0x83082f08
 1b4:	67 67 08 59 67       	addr32 or BYTE PTR [bx+di+0x67],bl
 1b9:	08 59 67             	or     BYTE PTR [ecx+0x67],bl
 1bc:	08 ca                	or     dl,cl
 1be:	08 13                	or     BYTE PTR [ebx],dl
 1c0:	77 08                	ja     1ca <cmdClearScreen-0x30ffe36>
 1c2:	76 a0                	jbe    164 <cmdClearScreen-0x30ffe9c>
 1c4:	f3 77 68             	repz ja 22f <cmdClearScreen-0x30ffdd1>
 1c7:	08 31                	or     BYTE PTR [ecx],dh
 1c9:	08 75 9f             	or     BYTE PTR [ebp-0x61],dh
 1cc:	08 ae 08 59 79 a0    	or     BYTE PTR [esi-0x5f86a6f8],ch
 1d2:	08 76 08             	or     BYTE PTR [esi+0x8],dh
 1d5:	e5 4c                	in     eax,0x4c
 1d7:	84 92 83 bc 92 83    	test   BYTE PTR [edx-0x7c6d437d],dl
 1dd:	a1 a3 67 08 92       	mov    eax,ds:0x920867a3
 1e2:	f3 75 5a             	repz jne 23f <cmdClearScreen-0x30ffdc1>
 1e5:	67 08 67 67          	or     BYTE PTR [bx+0x67],ah
 1e9:	08 2f                	or     BYTE PTR [edi],ch
 1eb:	67 08 13             	or     BYTE PTR [bp+di],dl
 1ee:	67 08 4b 08          	or     BYTE PTR [bp+di+0x8],cl
 1f2:	d8 68 08             	fsubr  DWORD PTR [eax+0x8]
 1f5:	3f                   	aas    
 1f6:	75 08                	jne    200 <cmdClearScreen-0x30ffe00>
 1f8:	30 67 08             	xor    BYTE PTR [edi+0x8],ah
 1fb:	4d                   	dec    ebp
 1fc:	ae                   	scas   al,BYTE PTR es:[edi]
 1fd:	08 3d bb 08 5b 08    	or     BYTE PTR ds:0x85b08bb,bh
 203:	91                   	xchg   ecx,eax
 204:	08 6b 67             	or     BYTE PTR [ebx+0x67],ch
 207:	d7                   	xlat   BYTE PTR ds:[ebx]
 208:	d7                   	xlat   BYTE PTR ds:[ebx]
 209:	d7                   	xlat   BYTE PTR ds:[ebx]
 20a:	67 d7                	xlat   BYTE PTR ds:[bx]
 20c:	67 d7                	xlat   BYTE PTR ds:[bx]
 20e:	67 d7                	xlat   BYTE PTR ds:[bx]
 210:	67 d8 3f             	fdivr  DWORD PTR [bx]
 213:	68 08 2f 4c d8       	push   0xd84c2f08
 218:	9f                   	lahf   
 219:	08 2f                	or     BYTE PTR [edi],ch
 21b:	08 13                	or     BYTE PTR [ebx],dl
 21d:	08 ad 08 5a 08 2f    	or     BYTE PTR [ebp+0x2f085a08],ch
 223:	4c                   	dec    esp
 224:	ae                   	scas   al,BYTE PTR es:[edi]
 225:	f3 08 31             	repz or BYTE PTR [ecx],dh
 228:	d7                   	xlat   BYTE PTR ds:[ebx]
 229:	3f                   	aas    
 22a:	69 83 d7 83 08 68 3f 	imul   eax,DWORD PTR [ebx+0x680883d7],0x7576673f
 231:	67 76 75 
 234:	67 08 4c 08          	or     BYTE PTR [si+0x8],cl
 238:	3e                   	ds
 239:	67 67 67 68 4c 92 08 	addr32 addr32 addr16 push 0x9108924c
 240:	91 
 241:	d7                   	xlat   BYTE PTR ds:[ebx]
 242:	ae                   	scas   al,BYTE PTR es:[edi]
 243:	08 21                	or     BYTE PTR [ecx],ah
 245:	67 00 02             	add    BYTE PTR [bp+si],al
 248:	04 02                	add    al,0x2
 24a:	03 78 2e             	add    edi,DWORD PTR [eax+0x2e]
 24d:	00 02                	add    BYTE PTR [edx],al
 24f:	04 01                	add    al,0x1
 251:	06                   	push   es
 252:	4a                   	dec    edx
 253:	06                   	push   es
 254:	03 0c 82             	add    ecx,DWORD PTR [edx+eax*4]
 257:	2a 00                	sub    al,BYTE PTR [eax]
 259:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 25c:	24 3f                	and    al,0x3f
 25e:	67 08 13             	or     BYTE PTR [bp+di],dl
 261:	3f                   	aas    
 262:	93                   	xchg   ebx,eax
 263:	08 ca                	or     dl,cl
 265:	08 bd 9f 75 3f 69    	or     BYTE PTR [ebp+0x693f759f],bh
 26b:	08 5f 08             	or     BYTE PTR [edi+0x8],bl
 26e:	2f                   	das    
 26f:	bb 68 02 22 13       	mov    ebx,0x13220268
 274:	02 2e                	add    ch,BYTE PTR [esi]
 276:	16                   	push   ss
 277:	00 02                	add    BYTE PTR [edx],al
 279:	04 02                	add    al,0x2
 27b:	03 78 02             	add    edi,DWORD PTR [eax+0x2]
 27e:	2c 01                	sub    al,0x1
 280:	00 02                	add    BYTE PTR [edx],al
 282:	04 01                	add    al,0x1
 284:	06                   	push   es
 285:	4a                   	dec    edx
 286:	06                   	push   es
 287:	03 0b                	add    ecx,DWORD PTR [ebx]
 289:	9e                   	sahf   
 28a:	3f                   	aas    
 28b:	67 08 2f             	or     BYTE PTR [bx],ch
 28e:	02 24 13             	add    ah,BYTE PTR [ebx+edx*1]
 291:	d7                   	xlat   BYTE PTR ds:[ebx]
 292:	3f                   	aas    
 293:	9e                   	sahf   
 294:	4c                   	dec    esp
 295:	08 bd 75 02 38 14    	or     BYTE PTR [ebp+0x14380275],bh
 29b:	00 02                	add    BYTE PTR [edx],al
 29d:	04 03                	add    al,0x3
 29f:	91                   	xchg   ecx,eax
 2a0:	00 02                	add    BYTE PTR [edx],al
 2a2:	04 03                	add    al,0x3
 2a4:	b9 00 02 04 01       	mov    ecx,0x1040200
 2a9:	06                   	push   es
 2aa:	4a                   	dec    edx
 2ab:	06                   	push   es
 2ac:	85 91 d7 00 02 04    	test   DWORD PTR [ecx+0x40200d7],edx
 2b2:	02 f0                	add    dh,al
 2b4:	00 02                	add    BYTE PTR [edx],al
 2b6:	04 01                	add    al,0x1
 2b8:	06                   	push   es
 2b9:	4a                   	dec    edx
 2ba:	06                   	push   es
 2bb:	86 ae 08 4b 31 02    	xchg   BYTE PTR [esi+0x2314b08],ch
 2c1:	2c 13                	sub    al,0x13
 2c3:	02 05 00 01 01 1d    	add    al,BYTE PTR ds:0x1d010100
 2c9:	03 00                	add    eax,DWORD PTR [eax]
 2cb:	00 02                	add    BYTE PTR [edx],al
 2cd:	00 27                	add    BYTE PTR [edi],ah
 2cf:	01 00                	add    DWORD PTR [eax],eax
 2d1:	00 01                	add    BYTE PTR [ecx],al
 2d3:	01 fb                	add    ebx,edi
 2d5:	0e                   	push   cs
 2d6:	0d 00 01 01 01       	or     eax,0x1010100
 2db:	01 00                	add    DWORD PTR [eax],eax
 2dd:	00 00                	add    BYTE PTR [eax],al
 2df:	01 00                	add    DWORD PTR [eax],eax
 2e1:	00 01                	add    BYTE PTR [ecx],al
 2e3:	73 72                	jae    357 <cmdClearScreen-0x30ffca9>
 2e5:	63 00                	arpl   WORD PTR [eax],ax
 2e7:	2f                   	das    
 2e8:	68 6f 6d 65 2f       	push   0x2f656d6f
 2ed:	79 6f                	jns    35e <cmdClearScreen-0x30ffca2>
 2ef:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
 2f6:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 2f9:	73 73                	jae    36e <cmdClearScreen-0x30ffc92>
 2fb:	2f                   	das    
 2fc:	6c                   	ins    BYTE PTR es:[edi],dx
 2fd:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
 304:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
 30a:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
 310:	78 2d                	js     33f <cmdClearScreen-0x30ffcc1>
 312:	67 6e                	outs   dx,BYTE PTR ds:[si]
 314:	75 2f                	jne    345 <cmdClearScreen-0x30ffcbb>
 316:	35 2e 33 2e 30       	xor    eax,0x302e332e
 31b:	2f                   	das    
 31c:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 323:	00 2e                	add    BYTE PTR [esi],ch
 325:	2e                   	cs
 326:	2f                   	das    
 327:	2e                   	cs
 328:	2e                   	cs
 329:	2f                   	das    
 32a:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 32e:	6a 2f                	push   0x2f
 330:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 333:	69 73 4f 53 2f 69 6e 	imul   esi,DWORD PTR [ebx+0x4f],0x6e692f53
 33a:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 33e:	65                   	gs
 33f:	2f                   	das    
 340:	69 33 38 36 00 69    	imul   esi,DWORD PTR [ebx],0x69003638
 346:	6e                   	outs   dx,BYTE PTR ds:[esi]
 347:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 34b:	65 00 2e             	add    BYTE PTR gs:[esi],ch
 34e:	2e                   	cs
 34f:	2f                   	das    
 350:	6c                   	ins    BYTE PTR es:[edi],dx
 351:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 358:	4f                   	dec    edi
 359:	53                   	push   ebx
 35a:	2f                   	das    
 35b:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 362:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 365:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 369:	65                   	gs
 36a:	2f                   	das    
 36b:	2e                   	cs
 36c:	2e                   	cs
 36d:	2f                   	das    
 36e:	2e                   	cs
 36f:	2e                   	cs
 370:	2f                   	das    
 371:	2e                   	cs
 372:	2e                   	cs
 373:	2f                   	das    
 374:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 378:	6a 2f                	push   0x2f
 37a:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 37d:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
 384:	6e                   	outs   dx,BYTE PTR ds:[esi]
 385:	65                   	gs
 386:	6c                   	ins    BYTE PTR es:[edi],dx
 387:	2f                   	das    
 388:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 38f:	00 00                	add    BYTE PTR [eax],al
 391:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 395:	6c                   	ins    BYTE PTR es:[edi],dx
 396:	6c                   	ins    BYTE PTR es:[edi],dx
 397:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 39a:	01 00                	add    DWORD PTR [eax],eax
 39c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 39f:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
 3a6:	63 
 3a7:	2e                   	cs
 3a8:	68 00 02 00 00       	push   0x200
 3ad:	63 70 75             	arpl   WORD PTR [eax+0x75],si
 3b0:	2e                   	cs
 3b1:	68 00 03 00 00       	push   0x300
 3b6:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3ba:	6c                   	ins    BYTE PTR es:[edi],dx
 3bb:	6c                   	ins    BYTE PTR es:[edi],dx
 3bc:	2e                   	cs
 3bd:	68 00 04 00 00       	push   0x400
 3c2:	6d                   	ins    DWORD PTR es:[edi],dx
 3c3:	61                   	popa   
 3c4:	6c                   	ins    BYTE PTR es:[edi],dx
 3c5:	6c                   	ins    BYTE PTR es:[edi],dx
 3c6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3c7:	63 2e                	arpl   WORD PTR [esi],bp
 3c9:	68 00 05 00 00       	push   0x500
 3ce:	66 69 6c 65 2e 68 00 	imul   bp,WORD PTR [ebp+eiz*2+0x2e],0x68
 3d5:	05 00 00 6c 69       	add    eax,0x696c0000
 3da:	62 43 68             	bound  eax,QWORD PTR [ebx+0x68]
 3dd:	72 69                	jb     448 <cmdClearScreen-0x30ffbb8>
 3df:	73 4f                	jae    430 <cmdClearScreen-0x30ffbd0>
 3e1:	53                   	push   ebx
 3e2:	2e                   	cs
 3e3:	68 00 05 00 00       	push   0x500
 3e8:	74 68                	je     452 <cmdClearScreen-0x30ffbae>
 3ea:	65                   	gs
 3eb:	73 69                	jae    456 <cmdClearScreen-0x30ffbaa>
 3ed:	67 6e                	outs   dx,BYTE PTR ds:[si]
 3ef:	61                   	popa   
 3f0:	6c                   	ins    BYTE PTR es:[edi],dx
 3f1:	73 2e                	jae    421 <cmdClearScreen-0x30ffbdf>
 3f3:	68 00 06 00 00       	push   0x600
 3f8:	00 00                	add    BYTE PTR [eax],al
 3fa:	05 02 c0 0d 10       	add    eax,0x100dc002
 3ff:	03 03                	add    eax,DWORD PTR [ebx]
 401:	19 01                	sbb    DWORD PTR [ecx],eax
 403:	3e                   	ds
 404:	3f                   	aas    
 405:	67 68 30 08 13 47    	addr16 push 0x47130830
 40b:	95                   	xchg   ebp,eax
 40c:	40                   	inc    eax
 40d:	75 a0                	jne    3af <cmdClearScreen-0x30ffc51>
 40f:	67 76 4b             	addr16 jbe 45d <cmdClearScreen-0x30ffba3>
 412:	68 08 76 6b 00       	push   0x6b7608
 417:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 41a:	06                   	push   es
 41b:	9e                   	sahf   
 41c:	00 02                	add    BYTE PTR [edx],al
 41e:	04 02                	add    al,0x2
 420:	9e                   	sahf   
 421:	06                   	push   es
 422:	d8 02                	fadd   DWORD PTR [edx]
 424:	25 14 9f 02 3b       	and    eax,0x3b029f14
 429:	14 02                	adc    al,0x2
 42b:	34 13                	xor    al,0x13
 42d:	a0 92 4b 54 26       	mov    al,ds:0x26544b92
 432:	59                   	pop    ecx
 433:	5b                   	pop    ebx
 434:	75 d7                	jne    40d <cmdClearScreen-0x30ffbf3>
 436:	08 14 68             	or     BYTE PTR [eax+ebp*2],dl
 439:	4c                   	dec    esp
 43a:	08 21                	or     BYTE PTR [ecx],ah
 43c:	08 21                	or     BYTE PTR [ecx],ah
 43e:	08 13                	or     BYTE PTR [ebx],dl
 440:	03 0b                	add    ecx,DWORD PTR [ebx]
 442:	74 03                	je     447 <cmdClearScreen-0x30ffbb9>
 444:	78 2e                	js     474 <cmdClearScreen-0x30ffb8c>
 446:	02 30                	add    dh,BYTE PTR [eax]
 448:	1a 2c d8             	sbb    ch,BYTE PTR [eax+ebx*8]
 44b:	69 75 d7 d7 4c 08 3e 	imul   esi,DWORD PTR [ebp-0x29],0x3e084cd7
 452:	bc e6 ae 94 08       	mov    esp,0x894aee6
 457:	4b                   	dec    ebx
 458:	e5 93                	in     eax,0x93
 45a:	00 02                	add    BYTE PTR [edx],al
 45c:	04 02                	add    al,0x2
 45e:	06                   	push   es
 45f:	e4 00                	in     al,0x0
 461:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
 464:	e4 00                	in     al,0x0
 466:	02 04 05 e4 06 af 00 	add    al,BYTE PTR [eax*1+0xaf06e4]
 46d:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 470:	06                   	push   es
 471:	e4 06                	in     al,0x6
 473:	e5 02                	in     eax,0x2
 475:	25 13 08 4b 67       	and    eax,0x674b0813
 47a:	e3 34                	jecxz  4b0 <cmdClearScreen-0x30ffb50>
 47c:	00 02                	add    BYTE PTR [edx],al
 47e:	04 02                	add    al,0x2
 480:	02 25 14 00 02 04    	add    ah,BYTE PTR ds:0x4020014
 486:	02 03                	add    al,BYTE PTR [ebx]
 488:	63 4a 00             	arpl   WORD PTR [edx+0x0],cx
 48b:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 48e:	06                   	push   es
 48f:	4a                   	dec    edx
 490:	06                   	push   es
 491:	03 1f                	add    ebx,DWORD PTR [edi]
 493:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 496:	4b                   	dec    ebx
 497:	08 4f 3d             	or     BYTE PTR [edi+0x3d],cl
 49a:	5b                   	pop    ebx
 49b:	6a 92                	push   0xffffff92
 49d:	02 3b                	add    bh,BYTE PTR [ebx]
 49f:	14 69                	adc    al,0x69
 4a1:	00 02                	add    BYTE PTR [edx],al
 4a3:	04 02                	add    al,0x2
 4a5:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 4a8:	00 02                	add    BYTE PTR [edx],al
 4aa:	04 01                	add    al,0x1
 4ac:	06                   	push   es
 4ad:	4a                   	dec    edx
 4ae:	06                   	push   es
 4af:	03 0b                	add    ecx,DWORD PTR [ebx]
 4b1:	66 59                	pop    cx
 4b3:	32 69 75             	xor    ch,BYTE PTR [ecx+0x75]
 4b6:	75 75                	jne    52d <cmdClearScreen-0x30ffad3>
 4b8:	75 75                	jne    52f <cmdClearScreen-0x30ffad1>
 4ba:	78 a1                	js     45d <cmdClearScreen-0x30ffba3>
 4bc:	08 ec                	or     ah,ch
 4be:	00 02                	add    BYTE PTR [edx],al
 4c0:	04 01                	add    al,0x1
 4c2:	06                   	push   es
 4c3:	66 06                	pushw  es
 4c5:	af                   	scas   eax,DWORD PTR es:[edi]
 4c6:	68 75 08 4c 67       	push   0x674c0875
 4cb:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 4ce:	5a                   	pop    edx
 4cf:	00 02                	add    BYTE PTR [edx],al
 4d1:	04 01                	add    al,0x1
 4d3:	06                   	push   es
 4d4:	9e                   	sahf   
 4d5:	00 02                	add    BYTE PTR [edx],al
 4d7:	04 02                	add    al,0x2
 4d9:	66                   	data16
 4da:	00 02                	add    BYTE PTR [edx],al
 4dc:	04 03                	add    al,0x3
 4de:	66 06                	pushw  es
 4e0:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 4e1:	68 75 08 5a a0       	push   0xa05a0875
 4e6:	bc 68 a0 94 08       	mov    esp,0x894a068
 4eb:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 4ee:	94                   	xchg   esp,eax
 4ef:	08 33                	or     BYTE PTR [ebx],dh
 4f1:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 4f6:	16                   	push   ss
 4f7:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 4fa:	03 3a                	add    edi,DWORD PTR [edx]
 4fc:	d6                   	(bad)  
 4fd:	68 d8 08 e7 08       	push   0x8e708d8
 502:	13 d7                	adc    edx,edi
 504:	08 e5                	or     ch,ah
 506:	08 3e                	or     BYTE PTR [esi],bh
 508:	4b                   	dec    ebx
 509:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 50c:	d9 d9                	(bad)  
 50e:	d7                   	xlat   BYTE PTR ds:[ebx]
 50f:	d7                   	xlat   BYTE PTR ds:[ebx]
 510:	3d 31 75 00 02       	cmp    eax,0x2007531
 515:	04 03                	add    al,0x3
 517:	92                   	xchg   edx,eax
 518:	00 02                	add    BYTE PTR [edx],al
 51a:	04 03                	add    al,0x3
 51c:	02 22                	add    ah,BYTE PTR [edx]
 51e:	13 00                	adc    eax,DWORD PTR [eax]
 520:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 523:	02 30                	add    dh,BYTE PTR [eax]
 525:	0f 00 02             	sldt   WORD PTR [edx]
 528:	04 01                	add    al,0x1
 52a:	06                   	push   es
 52b:	4a                   	dec    edx
 52c:	06                   	push   es
 52d:	87 3d 5b 67 00 02    	xchg   DWORD PTR ds:0x200675b,edi
 533:	04 03                	add    al,0x3
 535:	91                   	xchg   ecx,eax
 536:	00 02                	add    BYTE PTR [edx],al
 538:	04 03                	add    al,0x3
 53a:	ff 00                	inc    DWORD PTR [eax]
 53c:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 53f:	06                   	push   es
 540:	4a                   	dec    edx
 541:	06                   	push   es
 542:	84 d7                	test   bh,dl
 544:	03 0b                	add    ecx,DWORD PTR [ebx]
 546:	3c 67                	cmp    al,0x67
 548:	02 25 13 3f 67 08    	add    ah,BYTE PTR ds:0x8673f13
 54e:	91                   	xchg   ecx,eax
 54f:	3f                   	aas    
 550:	67 59                	addr16 pop ecx
 552:	59                   	pop    ecx
 553:	08 30                	or     BYTE PTR [eax],dh
 555:	3f                   	aas    
 556:	3d 85 75 22 3f       	cmp    eax,0x3f227585
 55b:	3d 86 75 77 59       	cmp    eax,0x59777586
 560:	31 67 4b             	xor    DWORD PTR [edi+0x4b],esp
 563:	75 77                	jne    5dc <cmdClearScreen-0x30ffa24>
 565:	9f                   	lahf   
 566:	9f                   	lahf   
 567:	08 4b 75             	or     BYTE PTR [ebx+0x75],cl
 56a:	9f                   	lahf   
 56b:	75 08                	jne    575 <cmdClearScreen-0x30ffa8b>
 56d:	4b                   	dec    ebx
 56e:	83 4b 08 4b          	or     DWORD PTR [ebx+0x8],0x4b
 572:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 575:	5b                   	pop    ebx
 576:	08 3e                	or     BYTE PTR [esi],bh
 578:	5b                   	pop    ebx
 579:	9f                   	lahf   
 57a:	75 4b                	jne    5c7 <cmdClearScreen-0x30ffa39>
 57c:	75 08                	jne    586 <cmdClearScreen-0x30ffa7a>
 57e:	67 08 4b 5a          	or     BYTE PTR [bp+di+0x5a],cl
 582:	4b                   	dec    ebx
 583:	31 08                	xor    DWORD PTR [eax],ecx
 585:	4b                   	dec    ebx
 586:	68 75 31 ae 08       	push   0x8ae3175
 58b:	22 75 75             	and    dh,BYTE PTR [ebp+0x75]
 58e:	f3 03 6f 58          	repz add ebp,DWORD PTR [edi+0x58]
 592:	03 16                	add    edx,DWORD PTR [esi]
 594:	82                   	(bad)  
 595:	bc cb f4 02 2b       	mov    esp,0x2b02f4cb
 59a:	13 83 30 f3 47 6b    	adc    eax,DWORD PTR [ebx+0x6b47f330]
 5a0:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 5a3:	30 5d bc             	xor    BYTE PTR [ebp-0x44],bl
 5a6:	cb                   	retf   
 5a7:	08 4c 02 2b          	or     BYTE PTR [edx+eax*1+0x2b],cl
 5ab:	13 83 30 f3 47 6b    	adc    eax,DWORD PTR [ebx+0x6b47f330]
 5b1:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 5b4:	30 5d 84             	xor    BYTE PTR [ebp-0x7c],bl
 5b7:	a0 f5 5a 84 08       	mov    al,ds:0x8845af5
 5bc:	4c                   	dec    esp
 5bd:	84 d8                	test   al,bl
 5bf:	4b                   	dec    ebx
 5c0:	ad                   	lods   eax,DWORD PTR ds:[esi]
 5c1:	08 4d 84             	or     BYTE PTR [ebp-0x7c],cl
 5c4:	f3 30 84 75 32 08 30 	repz xor BYTE PTR [ebp+esi*2+0x8300832],al
 5cb:	08 
 5cc:	76 76                	jbe    644 <cmdClearScreen-0x30ff9bc>
 5ce:	5b                   	pop    ebx
 5cf:	ae                   	scas   al,BYTE PTR es:[edi]
 5d0:	67 f3 08 2f          	repz or BYTE PTR [bx],ch
 5d4:	03 82 7f 08 ac 03    	add    eax,DWORD PTR [edx+0x3ac087f]
 5da:	81 01 08 20 08 13    	add    DWORD PTR [ecx],0x13082008
 5e0:	91                   	xchg   ecx,eax
 5e1:	08 13                	or     BYTE PTR [ebx],dl
 5e3:	59                   	pop    ecx
 5e4:	02 02                	add    al,BYTE PTR [edx]
 5e6:	00 01                	add    BYTE PTR [ecx],al
 5e8:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	72 65                	jb     67 <cmdClearScreen-0x30fff99>
   2:	73 50                	jae    54 <cmdClearScreen-0x30fffac>
   4:	61                   	popa   
   5:	74 68                	je     6f <cmdClearScreen-0x30fff91>
   7:	00 53 49             	add    BYTE PTR [ebx+0x49],dl
   a:	47                   	inc    edi
   b:	48                   	dec    eax
   c:	41                   	inc    ecx
   d:	4c                   	dec    esp
   e:	54                   	push   esp
   f:	00 68 65             	add    BYTE PTR [eax+0x65],ch
  12:	61                   	popa   
  13:	70 45                	jo     5a <cmdClearScreen-0x30fffa6>
  15:	6e                   	outs   dx,BYTE PTR ds:[esi]
  16:	64 00 73 74          	add    BYTE PTR fs:[ebx+0x74],dh
  1a:	61                   	popa   
  1b:	72 74                	jb     91 <cmdClearScreen-0x30fff6f>
  1d:	54                   	push   esp
  1e:	69 63 6b 73 00 72 65 	imul   esp,DWORD PTR [ebx+0x6b],0x65720073
  25:	74 56                	je     7d <cmdClearScreen-0x30fff83>
  27:	61                   	popa   
  28:	6c                   	ins    BYTE PTR es:[edi],dx
  29:	00 66 73             	add    BYTE PTR [esi+0x73],ah
  2c:	74 61                	je     8f <cmdClearScreen-0x30fff71>
  2e:	74 5f                	je     8f <cmdClearScreen-0x30fff71>
  30:	74 00                	je     32 <cmdClearScreen-0x30fffce>
  32:	53                   	push   ebx
  33:	49                   	dec    ecx
  34:	47                   	inc    edi
  35:	55                   	push   ebp
  36:	53                   	push   ebx
  37:	4c                   	dec    esp
  38:	45                   	inc    ebp
  39:	45                   	inc    ebp
  3a:	50                   	push   eax
  3b:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  3e:	64                   	fs
  3f:	65                   	gs
  40:	72 72                	jb     b4 <cmdClearScreen-0x30fff4c>
  42:	66 69 6c 65 00 75 69 	imul   bp,WORD PTR [ebp+eiz*2+0x0],0x6975
  49:	6e                   	outs   dx,BYTE PTR ds:[esi]
  4a:	74 70                	je     bc <cmdClearScreen-0x30fff44>
  4c:	74 72                	je     c0 <cmdClearScreen-0x30fff40>
  4e:	5f                   	pop    edi
  4f:	74 00                	je     51 <cmdClearScreen-0x30fffaf>
  51:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  54:	6d                   	ins    DWORD PTR es:[edi],dx
  55:	61                   	popa   
  56:	6e                   	outs   dx,BYTE PTR ds:[esi]
  57:	64                   	fs
  58:	5f                   	pop    edi
  59:	66                   	data16
  5a:	75 6e                	jne    ca <cmdClearScreen-0x30fff36>
  5c:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
  60:	6e                   	outs   dx,BYTE PTR ds:[esi]
  61:	00 6b 65             	add    BYTE PTR [ebx+0x65],ch
  64:	78 65                	js     cb <cmdClearScreen-0x30fff35>
  66:	63 52 65             	arpl   WORD PTR [edx+0x65],dx
  69:	74 75                	je     e0 <cmdClearScreen-0x30fff20>
  6b:	72 6e                	jb     db <cmdClearScreen-0x30fff25>
  6d:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  70:	64                   	fs
  71:	48                   	dec    eax
  72:	65                   	gs
  73:	6c                   	ins    BYTE PTR es:[edi],dx
  74:	70 00                	jo     76 <cmdClearScreen-0x30fff8a>
  76:	6c                   	ins    BYTE PTR es:[edi],dx
  77:	69 62 63 54 5a 00 70 	imul   esp,DWORD PTR [edx+0x63],0x70005a54
  7e:	61                   	popa   
  7f:	74 68                	je     e9 <cmdClearScreen-0x30fff17>
  81:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
  84:	64                   	fs
  85:	54                   	push   esp
  86:	69 63 6b 73 00 6c 6f 	imul   esp,DWORD PTR [ebx+0x6b],0x6f6c0073
  8d:	6e                   	outs   dx,BYTE PTR ds:[esi]
  8e:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  92:	6e                   	outs   dx,BYTE PTR ds:[esi]
  93:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
  97:	73 69                	jae    102 <cmdClearScreen-0x30ffefe>
  99:	67 6e                	outs   dx,BYTE PTR ds:[si]
  9b:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  a0:	74 00                	je     a2 <cmdClearScreen-0x30fff5e>
  a2:	74 65                	je     109 <cmdClearScreen-0x30ffef7>
  a4:	73 74                	jae    11a <cmdClearScreen-0x30ffee6>
  a6:	00 79 6f             	add    BYTE PTR [ecx+0x6f],bh
  a9:	75 72                	jne    11d <cmdClearScreen-0x30ffee3>
  ab:	53                   	push   ebx
  ac:	54                   	push   esp
  ad:	44                   	inc    esp
  ae:	49                   	dec    ecx
  af:	4e                   	dec    esi
  b0:	00 72 65             	add    BYTE PTR [edx+0x65],dh
  b3:	73 6f                	jae    124 <cmdClearScreen-0x30ffedc>
  b5:	6c                   	ins    BYTE PTR es:[edi],dx
  b6:	76 65                	jbe    11d <cmdClearScreen-0x30ffee3>
  b8:	50                   	push   eax
  b9:	61                   	popa   
  ba:	74 68                	je     124 <cmdClearScreen-0x30ffedc>
  bc:	54                   	push   esp
  bd:	6f                   	outs   dx,DWORD PTR ds:[esi]
  be:	45                   	inc    ebp
  bf:	78 65                	js     126 <cmdClearScreen-0x30ffeda>
  c1:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
  c4:	61                   	popa   
  c5:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
  c9:	73 45                	jae    110 <cmdClearScreen-0x30ffef0>
  cb:	78 65                	js     132 <cmdClearScreen-0x30ffece>
  cd:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
  d0:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
  d7:	72 61                	jb     13a <cmdClearScreen-0x30ffec6>
  d9:	6d                   	ins    DWORD PTR es:[edi],dx
  da:	00 66 72             	add    BYTE PTR [esi+0x72],ah
  dd:	65                   	gs
  de:	65                   	gs
  df:	43                   	inc    ebx
  e0:	6d                   	ins    DWORD PTR es:[edi],dx
  e1:	64                   	fs
  e2:	6c                   	ins    BYTE PTR es:[edi],dx
  e3:	69 6e 65 00 69 6e 50 	imul   ebp,DWORD PTR [esi+0x65],0x506e6900
  ea:	61                   	popa   
  eb:	74 68                	je     155 <cmdClearScreen-0x30ffeab>
  ed:	00 66 69             	add    BYTE PTR [esi+0x69],ah
  f0:	6c                   	ins    BYTE PTR es:[edi],dx
  f1:	65                   	gs
  f2:	73 54                	jae    148 <cmdClearScreen-0x30ffeb8>
  f4:	6f                   	outs   dx,DWORD PTR ds:[esi]
  f5:	43                   	inc    ebx
  f6:	6c                   	ins    BYTE PTR es:[edi],dx
  f7:	6f                   	outs   dx,DWORD PTR ds:[esi]
  f8:	73 65                	jae    15f <cmdClearScreen-0x30ffea1>
  fa:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  fd:	64                   	fs
  fe:	53                   	push   ebx
  ff:	65                   	gs
 100:	74 45                	je     147 <cmdClearScreen-0x30ffeb9>
 102:	6e                   	outs   dx,BYTE PTR ds:[esi]
 103:	76 00                	jbe    105 <cmdClearScreen-0x30ffefb>
 105:	6c                   	ins    BYTE PTR es:[edi],dx
 106:	6f                   	outs   dx,DWORD PTR ds:[esi]
 107:	6e                   	outs   dx,BYTE PTR ds:[esi]
 108:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 10c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 10d:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 111:	74 00                	je     113 <cmdClearScreen-0x30ffeed>
 113:	68 65 61 70 42       	push   0x42706165
 118:	61                   	popa   
 119:	73 65                	jae    180 <cmdClearScreen-0x30ffe80>
 11b:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 11e:	6c                   	ins    BYTE PTR es:[edi],dx
 11f:	65                   	gs
 120:	73 54                	jae    176 <cmdClearScreen-0x30ffe8a>
 122:	6f                   	outs   dx,DWORD PTR ds:[esi]
 123:	43                   	inc    ebx
 124:	6c                   	ins    BYTE PTR es:[edi],dx
 125:	6f                   	outs   dx,DWORD PTR ds:[esi]
 126:	73 65                	jae    18d <cmdClearScreen-0x30ffe73>
 128:	43                   	inc    ebx
 129:	6f                   	outs   dx,DWORD PTR ds:[esi]
 12a:	75 6e                	jne    19a <cmdClearScreen-0x30ffe66>
 12c:	74 00                	je     12e <cmdClearScreen-0x30ffed2>
 12e:	47                   	inc    edi
 12f:	4e                   	dec    esi
 130:	55                   	push   ebp
 131:	20 43 39             	and    BYTE PTR [ebx+0x39],al
 134:	39 20                	cmp    DWORD PTR [eax],esp
 136:	35 2e 33 2e 30       	xor    eax,0x302e332e
 13b:	20 2d 6d 61 73 6d    	and    BYTE PTR ds:0x6d73616d,ch
 141:	3d 69 6e 74 65       	cmp    eax,0x65746e69
 146:	6c                   	ins    BYTE PTR es:[edi],dx
 147:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
 14d:	65                   	gs
 14e:	3d 67 65 6e 65       	cmp    eax,0x656e6567
 153:	72 69                	jb     1be <cmdClearScreen-0x30ffe42>
 155:	63 20                	arpl   WORD PTR [eax],sp
 157:	2d 6d 61 72 63       	sub    eax,0x6372616d
 15c:	68 3d 70 65 6e       	push   0x6e65703d
 161:	74 69                	je     1cc <cmdClearScreen-0x30ffe34>
 163:	75 6d                	jne    1d2 <cmdClearScreen-0x30ffe2e>
 165:	70 72                	jo     1d9 <cmdClearScreen-0x30ffe27>
 167:	6f                   	outs   dx,DWORD PTR ds:[esi]
 168:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
 16e:	74 64                	je     1d4 <cmdClearScreen-0x30ffe2c>
 170:	3d 63 39 39 20       	cmp    eax,0x20393963
 175:	2d 66 66 72 65       	sub    eax,0x65726666
 17a:	65                   	gs
 17b:	73 74                	jae    1f1 <cmdClearScreen-0x30ffe0f>
 17d:	61                   	popa   
 17e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 17f:	64 69 6e 67 00 66 69 	imul   ebp,DWORD PTR fs:[esi+0x67],0x6c696600
 186:	6c 
 187:	65                   	gs
 188:	54                   	push   esp
 189:	6f                   	outs   dx,DWORD PTR ds:[esi]
 18a:	45                   	inc    ebp
 18b:	78 65                	js     1f2 <cmdClearScreen-0x30ffe0e>
 18d:	63 00                	arpl   WORD PTR [eax],ax
 18f:	74 69                	je     1fa <cmdClearScreen-0x30ffe06>
 191:	6d                   	ins    DWORD PTR es:[edi],dx
 192:	65                   	gs
 193:	54                   	push   esp
 194:	6f                   	outs   dx,DWORD PTR ds:[esi]
 195:	45                   	inc    ebp
 196:	78 69                	js     201 <cmdClearScreen-0x30ffdff>
 198:	74 00                	je     19a <cmdClearScreen-0x30ffe66>
 19a:	76 61                	jbe    1fd <cmdClearScreen-0x30ffe03>
 19c:	72 56                	jb     1f4 <cmdClearScreen-0x30ffe0c>
 19e:	61                   	popa   
 19f:	6c                   	ins    BYTE PTR es:[edi],dx
 1a0:	75 65                	jne    207 <cmdClearScreen-0x30ffdf9>
 1a2:	00 63 68             	add    BYTE PTR [ebx+0x68],ah
 1a5:	69 6c 64 50 69 64 00 	imul   ebp,DWORD PTR [esp+eiz*2+0x50],0x63006469
 1ac:	63 
 1ad:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1ae:	6d                   	ins    DWORD PTR es:[edi],dx
 1af:	6d                   	ins    DWORD PTR es:[edi],dx
 1b0:	61                   	popa   
 1b1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1b2:	64                   	fs
 1b3:	5f                   	pop    edi
 1b4:	74 61                	je     217 <cmdClearScreen-0x30ffde9>
 1b6:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
 1ba:	74 00                	je     1bc <cmdClearScreen-0x30ffe44>
 1bc:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 1bf:	54                   	push   esp
 1c0:	69 6d 65 00 6c 63 6d 	imul   ebp,DWORD PTR [ebp+0x65],0x6d636c00
 1c7:	64                   	fs
 1c8:	6c                   	ins    BYTE PTR es:[edi],dx
 1c9:	69 6e 65 00 73 74 5f 	imul   ebp,DWORD PTR [esi+0x65],0x5f747300
 1d0:	6c                   	ins    BYTE PTR es:[edi],dx
 1d1:	61                   	popa   
 1d2:	73 74                	jae    248 <cmdClearScreen-0x30ffdb8>
 1d4:	6d                   	ins    DWORD PTR es:[edi],dx
 1d5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1d6:	64 00 68 65          	add    BYTE PTR fs:[eax+0x65],ch
 1da:	61                   	popa   
 1db:	70 43                	jo     220 <cmdClearScreen-0x30ffde0>
 1dd:	75 72                	jne    251 <cmdClearScreen-0x30ffdaf>
 1df:	72 00                	jb     1e1 <cmdClearScreen-0x30ffe1f>
 1e1:	73 74                	jae    257 <cmdClearScreen-0x30ffda9>
 1e3:	64 69 6e 70 69 70 65 	imul   ebp,DWORD PTR fs:[esi+0x70],0x657069
 1ea:	00 
 1eb:	6c                   	ins    BYTE PTR es:[edi],dx
 1ec:	61                   	popa   
 1ed:	73 74                	jae    263 <cmdClearScreen-0x30ffd9d>
 1ef:	45                   	inc    ebp
 1f0:	78 65                	js     257 <cmdClearScreen-0x30ffda9>
 1f2:	63 45 78             	arpl   WORD PTR [ebp+0x78],ax
 1f5:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x73006564
 1fc:	73 
 1fd:	74 64                	je     263 <cmdClearScreen-0x30ffd9d>
 1ff:	6f                   	outs   dx,DWORD PTR ds:[esi]
 200:	75 74                	jne    276 <cmdClearScreen-0x30ffd8a>
 202:	50                   	push   eax
 203:	69 70 65 00 53 49 47 	imul   esi,DWORD PTR [eax+0x65],0x47495300
 20a:	49                   	dec    ecx
 20b:	4e                   	dec    esi
 20c:	54                   	push   esp
 20d:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 210:	64                   	fs
 211:	45                   	inc    ebp
 212:	78 65                	js     279 <cmdClearScreen-0x30ffd87>
 214:	63 70 00             	arpl   WORD PTR [eax+0x0],si
 217:	6e                   	outs   dx,BYTE PTR ds:[esi]
 218:	61                   	popa   
 219:	6d                   	ins    DWORD PTR es:[edi],dx
 21a:	65 00 6b 65          	add    BYTE PTR gs:[ebx+0x65],ch
 21e:	78 65                	js     285 <cmdClearScreen-0x30ffd7b>
 220:	63 00                	arpl   WORD PTR [eax],ax
 222:	73 68                	jae    28c <cmdClearScreen-0x30ffd74>
 224:	6f                   	outs   dx,DWORD PTR ds:[esi]
 225:	72 74                	jb     29b <cmdClearScreen-0x30ffd65>
 227:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 22a:	73 69                	jae    295 <cmdClearScreen-0x30ffd6b>
 22c:	67 6e                	outs   dx,BYTE PTR ds:[si]
 22e:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 233:	74 00                	je     235 <cmdClearScreen-0x30ffdcb>
 235:	73 74                	jae    2ab <cmdClearScreen-0x30ffd55>
 237:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 239:	75 74                	jne    2af <cmdClearScreen-0x30ffd51>
 23b:	66 69 6c 65 00 53 49 	imul   bp,WORD PTR [ebp+eiz*2+0x0],0x4953
 242:	47                   	inc    edi
 243:	53                   	push   ebx
 244:	45                   	inc    ebp
 245:	47                   	inc    edi
 246:	56                   	push   esi
 247:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 24a:	64                   	fs
 24b:	43                   	inc    ebx
 24c:	68 61 6e 67 65       	push   0x65676e61
 251:	44                   	inc    esp
 252:	69 72 65 63 74 6f 72 	imul   esi,DWORD PTR [edx+0x65],0x726f7463
 259:	79 00                	jns    25b <cmdClearScreen-0x30ffda5>
 25b:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 25e:	50                   	push   eax
 25f:	77 64                	ja     2c5 <cmdClearScreen-0x30ffd3b>
 261:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 264:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 266:	75 74                	jne    2dc <cmdClearScreen-0x30ffd24>
 268:	52                   	push   edx
 269:	65 64 69 72 00 65 78 	gs imul esi,DWORD PTR fs:gs:[edx+0x0],0x63657865
 270:	65 63 
 272:	50                   	push   eax
 273:	69 70 65 73 00 73 74 	imul   esi,DWORD PTR [eax+0x65],0x74730073
 27a:	64                   	fs
 27b:	65                   	gs
 27c:	72 72                	jb     2f0 <cmdClearScreen-0x30ffd10>
 27e:	70 69                	jo     2e9 <cmdClearScreen-0x30ffd17>
 280:	70 65                	jo     2e7 <cmdClearScreen-0x30ffd19>
 282:	00 73 66             	add    BYTE PTR [ebx+0x66],dh
 285:	73 74                	jae    2fb <cmdClearScreen-0x30ffd05>
 287:	61                   	popa   
 288:	74 00                	je     28a <cmdClearScreen-0x30ffd76>
 28a:	79 6f                	jns    2fb <cmdClearScreen-0x30ffd05>
 28c:	75 72                	jne    300 <cmdClearScreen-0x30ffd00>
 28e:	53                   	push   ebx
 28f:	54                   	push   esp
 290:	44                   	inc    esp
 291:	4f                   	dec    edi
 292:	55                   	push   ebp
 293:	54                   	push   esp
 294:	00 64 65 73          	add    BYTE PTR [ebp+eiz*2+0x73],ah
 298:	63 72 69             	arpl   WORD PTR [edx+0x69],si
 29b:	70 74                	jo     311 <cmdClearScreen-0x30ffcef>
 29d:	69 6f 6e 00 73 72 63 	imul   ebp,DWORD PTR [edi+0x6e],0x63727300
 2a4:	2f                   	das    
 2a5:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 2a8:	6d                   	ins    DWORD PTR es:[edi],dx
 2a9:	61                   	popa   
 2aa:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2ab:	64                   	fs
 2ac:	73 2e                	jae    2dc <cmdClearScreen-0x30ffd24>
 2ae:	63 00                	arpl   WORD PTR [eax],ax
 2b0:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2b2:	76 69                	jbe    31d <cmdClearScreen-0x30ffce3>
 2b4:	72 6f                	jb     325 <cmdClearScreen-0x30ffcdb>
 2b6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2b7:	6d                   	ins    DWORD PTR es:[edi],dx
 2b8:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2ba:	74 4c                	je     308 <cmdClearScreen-0x30ffcf8>
 2bc:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2bd:	63 00                	arpl   WORD PTR [eax],ax
 2bf:	53                   	push   ebx
 2c0:	49                   	dec    ecx
 2c1:	47                   	inc    edi
 2c2:	49                   	dec    ecx
 2c3:	4f                   	dec    edi
 2c4:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 2c7:	7a 65                	jp     32e <cmdClearScreen-0x30ffcd2>
 2c9:	74 79                	je     344 <cmdClearScreen-0x30ffcbc>
 2cb:	70 65                	jo     332 <cmdClearScreen-0x30ffcce>
 2cd:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 2d0:	6d                   	ins    DWORD PTR es:[edi],dx
 2d1:	6d                   	ins    DWORD PTR es:[edi],dx
 2d2:	61                   	popa   
 2d3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2d4:	64                   	fs
 2d5:	5f                   	pop    edi
 2d6:	66                   	data16
 2d7:	75 6e                	jne    347 <cmdClearScreen-0x30ffcb9>
 2d9:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 2dd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2de:	5f                   	pop    edi
 2df:	70 00                	jo     2e1 <cmdClearScreen-0x30ffd1f>
 2e1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2e2:	75 74                	jne    358 <cmdClearScreen-0x30ffca8>
 2e4:	50                   	push   eax
 2e5:	61                   	popa   
 2e6:	74 68                	je     350 <cmdClearScreen-0x30ffcb0>
 2e8:	00 6b 65             	add    BYTE PTR [ebx+0x65],ch
 2eb:	78 65                	js     352 <cmdClearScreen-0x30ffcae>
 2ed:	63 32                	arpl   WORD PTR [edx],si
 2ef:	00 6e 61             	add    BYTE PTR [esi+0x61],ch
 2f2:	6d                   	ins    DWORD PTR es:[edi],dx
 2f3:	65                   	gs
 2f4:	4c                   	dec    esp
 2f5:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2f7:	00 65 72             	add    BYTE PTR [ebp+0x72],ah
 2fa:	72 6f                	jb     36b <cmdClearScreen-0x30ffc95>
 2fc:	72 00                	jb     2fe <cmdClearScreen-0x30ffd02>
 2fe:	2f                   	das    
 2ff:	68 6f 6d 65 2f       	push   0x2f656d6f
 304:	79 6f                	jns    375 <cmdClearScreen-0x30ffc8b>
 306:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 30d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 30e:	73 2f                	jae    33f <cmdClearScreen-0x30ffcc1>
 310:	61                   	popa   
 311:	70 72                	jo     385 <cmdClearScreen-0x30ffc7b>
 313:	6f                   	outs   dx,DWORD PTR ds:[esi]
 314:	6a 2f                	push   0x2f
 316:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 31a:	6c                   	ins    BYTE PTR es:[edi],dx
 31b:	6c                   	ins    BYTE PTR es:[edi],dx
 31c:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 31f:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x53006564
 326:	53 
 327:	49                   	dec    ecx
 328:	47                   	inc    edi
 329:	53                   	push   ebx
 32a:	4c                   	dec    esp
 32b:	45                   	inc    ebp
 32c:	45                   	inc    ebp
 32d:	50                   	push   eax
 32e:	00 6c 49 6e          	add    BYTE PTR [ecx+ecx*2+0x6e],ch
 332:	50                   	push   eax
 333:	61                   	popa   
 334:	74 68                	je     39e <cmdClearScreen-0x30ffc62>
 336:	00 5f 42             	add    BYTE PTR [edi+0x42],bl
 339:	6f                   	outs   dx,DWORD PTR ds:[esi]
 33a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 33b:	6c                   	ins    BYTE PTR es:[edi],dx
 33c:	00 73 4b             	add    BYTE PTR [ebx+0x4b],dh
 33f:	53                   	push   ebx
 340:	68 65 6c 6c 50       	push   0x506c6c65
 345:	72 6f                	jb     3b6 <cmdClearScreen-0x30ffc4a>
 347:	67 72 61             	addr16 jb 3ab <cmdClearScreen-0x30ffc55>
 34a:	6d                   	ins    DWORD PTR es:[edi],dx
 34b:	4e                   	dec    esi
 34c:	61                   	popa   
 34d:	6d                   	ins    DWORD PTR es:[edi],dx
 34e:	65 00 75 6e          	add    BYTE PTR gs:[ebp+0x6e],dh
 352:	73 69                	jae    3bd <cmdClearScreen-0x30ffc43>
 354:	67 6e                	outs   dx,BYTE PTR ds:[si]
 356:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 35b:	61                   	popa   
 35c:	72 00                	jb     35e <cmdClearScreen-0x30ffca2>
 35e:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 361:	52                   	push   edx
 362:	65                   	gs
 363:	70 65                	jo     3ca <cmdClearScreen-0x30ffc36>
 365:	61                   	popa   
 366:	74 00                	je     368 <cmdClearScreen-0x30ffc98>
 368:	66 6f                	outs   dx,WORD PTR ds:[esi]
 36a:	72 6b                	jb     3d7 <cmdClearScreen-0x30ffc29>
 36c:	50                   	push   eax
 36d:	69 64 00 73 68 6f 72 	imul   esp,DWORD PTR [eax+eax*1+0x73],0x74726f68
 374:	74 
 375:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 378:	74 00                	je     37a <cmdClearScreen-0x30ffc86>
 37a:	64                   	fs
 37b:	65                   	gs
 37c:	6c                   	ins    BYTE PTR es:[edi],dx
 37d:	69 6d 00 62 53 69 67 	imul   ebp,DWORD PTR [ebp+0x0],0x67695362
 384:	49                   	dec    ecx
 385:	6e                   	outs   dx,BYTE PTR ds:[esi]
 386:	74 52                	je     3da <cmdClearScreen-0x30ffc26>
 388:	65 63 65 69          	arpl   WORD PTR gs:[ebp+0x69],sp
 38c:	76 65                	jbe    3f3 <cmdClearScreen-0x30ffc0d>
 38e:	64 00 63 6d          	add    BYTE PTR fs:[ebx+0x6d],ah
 392:	64                   	fs
 393:	43                   	inc    ebx
 394:	6c                   	ins    BYTE PTR es:[edi],dx
 395:	65                   	gs
 396:	61                   	popa   
 397:	72 53                	jb     3ec <cmdClearScreen-0x30ffc14>
 399:	63 72 65             	arpl   WORD PTR [edx+0x65],si
 39c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 39e:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
 3a1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3a2:	74 33                	je     3d7 <cmdClearScreen-0x30ffc29>
 3a4:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 3a7:	00 53 49             	add    BYTE PTR [ebx+0x49],dl
 3aa:	47                   	inc    edi
 3ab:	53                   	push   ebx
 3ac:	54                   	push   esp
 3ad:	4f                   	dec    edi
 3ae:	50                   	push   eax
 3af:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 3b2:	64                   	fs
 3b3:	45                   	inc    ebp
 3b4:	78 69                	js     41f <cmdClearScreen-0x30ffbe1>
 3b6:	74 00                	je     3b8 <cmdClearScreen-0x30ffc48>
 3b8:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 3bb:	53                   	push   ebx
 3bc:	6c                   	ins    BYTE PTR es:[edi],dx
 3bd:	65                   	gs
 3be:	65                   	gs
 3bf:	70 00                	jo     3c1 <cmdClearScreen-0x30ffc3f>
 3c1:	65                   	gs
 3c2:	73 69                	jae    42d <cmdClearScreen-0x30ffbd3>
 3c4:	67 6e                	outs   dx,BYTE PTR ds:[si]
 3c6:	61                   	popa   
 3c7:	6c                   	ins    BYTE PTR es:[edi],dx
 3c8:	73 00                	jae    3ca <cmdClearScreen-0x30ffc36>
 3ca:	70 61                	jo     42d <cmdClearScreen-0x30ffbd3>
 3cc:	72 61                	jb     42f <cmdClearScreen-0x30ffbd1>
 3ce:	6d                   	ins    DWORD PTR es:[edi],dx
 3cf:	73 00                	jae    3d1 <cmdClearScreen-0x30ffc2f>
 3d1:	73 74                	jae    447 <cmdClearScreen-0x30ffbb9>
 3d3:	64 69 6e 52 65 64 69 	imul   ebp,DWORD PTR fs:[esi+0x52],0x72696465
 3da:	72 
 3db:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3de:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 3e0:	75 74                	jne    456 <cmdClearScreen-0x30ffbaa>
 3e2:	70 69                	jo     44d <cmdClearScreen-0x30ffbb3>
 3e4:	70 65                	jo     44b <cmdClearScreen-0x30ffbb5>
 3e6:	00 74 6f 6b          	add    BYTE PTR [edi+ebp*2+0x6b],dh
 3ea:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3ec:	00 66 6f             	add    BYTE PTR [esi+0x6f],ah
 3ef:	75 6e                	jne    45f <cmdClearScreen-0x30ffba1>
 3f1:	64 00 70 61          	add    BYTE PTR fs:[eax+0x61],dh
 3f5:	72 61                	jb     458 <cmdClearScreen-0x30ffba8>
 3f7:	6d                   	ins    DWORD PTR es:[edi],dx
 3f8:	43                   	inc    ebx
 3f9:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3fa:	75 6e                	jne    46a <cmdClearScreen-0x30ffb96>
 3fc:	74 00                	je     3fe <cmdClearScreen-0x30ffc02>
 3fe:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 400:	76 50                	jbe    452 <cmdClearScreen-0x30ffbae>
 402:	61                   	popa   
 403:	74 68                	je     46d <cmdClearScreen-0x30ffb93>
 405:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 408:	64 69 6e 66 69 6c 65 	imul   ebp,DWORD PTR fs:[esi+0x66],0x656c69
 40f:	00 
 410:	73 74                	jae    486 <cmdClearScreen-0x30ffb7a>
 412:	5f                   	pop    edi
 413:	73 69                	jae    47e <cmdClearScreen-0x30ffb82>
 415:	7a 65                	jp     47c <cmdClearScreen-0x30ffb84>
 417:	00 6e 65             	add    BYTE PTR [esi+0x65],ch
 41a:	77 43                	ja     45f <cmdClearScreen-0x30ffba1>
 41c:	6d                   	ins    DWORD PTR es:[edi],dx
 41d:	64                   	fs
 41e:	4c                   	dec    esp
 41f:	69 6e 65 00 76 61 72 	imul   ebp,DWORD PTR [esi+0x65],0x72617600
 426:	4e                   	dec    esi
 427:	61                   	popa   
 428:	6d                   	ins    DWORD PTR es:[edi],dx
 429:	65 00 70 72          	add    BYTE PTR gs:[eax+0x72],dh
 42d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 42e:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 431:	73 45                	jae    478 <cmdClearScreen-0x30ffb88>
 433:	6e                   	outs   dx,BYTE PTR ds:[esi]
 434:	76 70                	jbe    4a6 <cmdClearScreen-0x30ffb5a>
 436:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 439:	61                   	popa   
 43a:	72 74                	jb     4b0 <cmdClearScreen-0x30ffb50>
 43c:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 43f:	64                   	fs
 440:	50                   	push   eax
 441:	72 69                	jb     4ac <cmdClearScreen-0x30ffb54>
 443:	6e                   	outs   dx,BYTE PTR ds:[esi]
 444:	74 45                	je     48b <cmdClearScreen-0x30ffb75>
 446:	6e                   	outs   dx,BYTE PTR ds:[esi]
 447:	76 00                	jbe    449 <cmdClearScreen-0x30ffbb7>
 449:	76 61                	jbe    4ac <cmdClearScreen-0x30ffb54>
 44b:	6c                   	ins    BYTE PTR es:[edi],dx
 44c:	75 65                	jne    4b3 <cmdClearScreen-0x30ffb4d>
 44e:	4c                   	dec    esp
 44f:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 451:	00 62 61             	add    BYTE PTR [edx+0x61],ah
 454:	63 6b 67             	arpl   WORD PTR [ebx+0x67],bp
 457:	72 6f                	jb     4c8 <cmdClearScreen-0x30ffb38>
 459:	75 6e                	jne    4c9 <cmdClearScreen-0x30ffb37>
 45b:	64 00 70 72          	add    BYTE PTR fs:[eax+0x72],dh
 45f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 460:	6d                   	ins    DWORD PTR es:[edi],dx
 461:	70 74                	jo     4d7 <cmdClearScreen-0x30ffb29>
 463:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 466:	65                   	gs
 467:	66                   	data16
 468:	65                   	gs
 469:	74 63                	je     4ce <cmdClearScreen-0x30ffb32>
 46b:	68 77 74 31 00       	push   0x317477
 470:	6e                   	outs   dx,BYTE PTR ds:[esi]
 471:	61                   	popa   
 472:	72 67                	jb     4db <cmdClearScreen-0x30ffb25>
 474:	76 00                	jbe    476 <cmdClearScreen-0x30ffb8a>
 476:	6c                   	ins    BYTE PTR es:[edi],dx
 477:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 47a:	73 00                	jae    47c <cmdClearScreen-0x30ffb84>
 47c:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 47f:	62 65 67             	bound  esp,QWORD PTR [ebp+0x67]
 482:	69 6e 00 67 65 74 41 	imul   ebp,DWORD PTR [esi+0x0],0x41746567
 489:	4b                   	dec    ebx
 48a:	65                   	gs
 48b:	79 00                	jns    48d <cmdClearScreen-0x30ffb73>
 48d:	65                   	gs
 48e:	66 61                	popaw  
 490:	6d                   	ins    DWORD PTR es:[edi],dx
 491:	69 6c 79 00 70 61 72 	imul   ebp,DWORD PTR [ecx+edi*2+0x0],0x73726170
 498:	73 
 499:	65                   	gs
 49a:	64                   	fs
 49b:	43                   	inc    ebx
 49c:	68 61 72 73 00       	push   0x737261
 4a1:	73 72                	jae    515 <cmdClearScreen-0x30ffaeb>
 4a3:	63 2f                	arpl   WORD PTR [edi],bp
 4a5:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 4a9:	6c                   	ins    BYTE PTR es:[edi],dx
 4aa:	6c                   	ins    BYTE PTR es:[edi],dx
 4ab:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 4ae:	6c                   	ins    BYTE PTR es:[edi],dx
 4af:	43                   	inc    ebx
 4b0:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4b1:	6d                   	ins    DWORD PTR es:[edi],dx
 4b2:	6d                   	ins    DWORD PTR es:[edi],dx
 4b3:	61                   	popa   
 4b4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4b5:	64                   	fs
 4b6:	50                   	push   eax
 4b7:	74 72                	je     52b <cmdClearScreen-0x30ffad5>
 4b9:	00 64 71 75          	add    BYTE PTR [ecx+esi*2+0x75],ah
 4bd:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4be:	74 65                	je     525 <cmdClearScreen-0x30ffadb>
 4c0:	00 6c 52 65          	add    BYTE PTR [edx+edx*2+0x65],ch
 4c4:	74 56                	je     51c <cmdClearScreen-0x30ffae4>
 4c6:	61                   	popa   
 4c7:	6c                   	ins    BYTE PTR es:[edi],dx
 4c8:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 4cb:	76 70                	jbe    53d <cmdClearScreen-0x30ffac3>
 4cd:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
 4d1:	72 72                	jb     545 <cmdClearScreen-0x30ffabb>
 4d3:	4b                   	dec    ebx
 4d4:	65                   	gs
 4d5:	79 00                	jns    4d7 <cmdClearScreen-0x30ffb29>
 4d7:	61                   	popa   
 4d8:	76 78                	jbe    552 <cmdClearScreen-0x30ffaae>
 4da:	35 31 32 76 62       	xor    eax,0x62763231
 4df:	6d                   	ins    DWORD PTR es:[edi],dx
 4e0:	69 00 63 6d 64 70    	imul   eax,DWORD PTR [eax],0x70646d63
 4e6:	74 72                	je     55a <cmdClearScreen-0x30ffaa6>
 4e8:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 4eb:	74 41                	je     52e <cmdClearScreen-0x30ffad2>
 4ed:	43                   	inc    ebx
 4ee:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4ef:	6d                   	ins    DWORD PTR es:[edi],dx
 4f0:	6d                   	ins    DWORD PTR es:[edi],dx
 4f1:	61                   	popa   
 4f2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4f3:	64 00 72 65          	add    BYTE PTR fs:[edx+0x65],dh
 4f7:	73 65                	jae    55e <cmdClearScreen-0x30ffaa2>
 4f9:	72 76                	jb     571 <cmdClearScreen-0x30ffa8f>
 4fb:	65 64 00 62 75       	gs add BYTE PTR fs:gs:[edx+0x75],ah
 500:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 507:	00 
 508:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 50b:	4c                   	dec    esp
 50c:	69 6e 65 00 63 6f 6d 	imul   ebp,DWORD PTR [esi+0x65],0x6d6f6300
 513:	6d                   	ins    DWORD PTR es:[edi],dx
 514:	61                   	popa   
 515:	6e                   	outs   dx,BYTE PTR ds:[esi]
 516:	64 00 70 61          	add    BYTE PTR fs:[eax+0x61],dh
 51a:	72 73                	jb     58f <cmdClearScreen-0x30ffa71>
 51c:	65                   	gs
 51d:	43                   	inc    ebx
 51e:	6d                   	ins    DWORD PTR es:[edi],dx
 51f:	64                   	fs
 520:	73 00                	jae    522 <cmdClearScreen-0x30ffade>
 522:	70 70                	jo     594 <cmdClearScreen-0x30ffa6c>
 524:	74 72                	je     598 <cmdClearScreen-0x30ffa68>
 526:	00 68 61             	add    BYTE PTR [eax+0x61],ch
 529:	6e                   	outs   dx,BYTE PTR ds:[esi]
 52a:	64                   	fs
 52b:	6c                   	ins    BYTE PTR es:[edi],dx
 52c:	65                   	gs
 52d:	53                   	push   ebx
 52e:	69 67 6e 61 6c 73 00 	imul   esp,DWORD PTR [edi+0x6e],0x736c61
 535:	6e                   	outs   dx,BYTE PTR ds:[esi]
 536:	65                   	gs
 537:	65                   	gs
 538:	64                   	fs
 539:	44                   	inc    esp
 53a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 53b:	75 62                	jne    59f <cmdClearScreen-0x30ffa61>
 53d:	6c                   	ins    BYTE PTR es:[edi],dx
 53e:	65                   	gs
 53f:	51                   	push   ecx
 540:	75 6f                	jne    5b1 <cmdClearScreen-0x30ffa4f>
 542:	74 65                	je     5a9 <cmdClearScreen-0x30ffa57>
 544:	74 6f                	je     5b5 <cmdClearScreen-0x30ffa4b>
 546:	45                   	inc    ebp
 547:	6e                   	outs   dx,BYTE PTR ds:[esi]
 548:	64                   	fs
 549:	50                   	push   eax
 54a:	61                   	popa   
 54b:	72 61                	jb     5ae <cmdClearScreen-0x30ffa52>
 54d:	6d                   	ins    DWORD PTR es:[edi],dx
 54e:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
 551:	75 69                	jne    5bc <cmdClearScreen-0x30ffa44>
 553:	64                   	fs
 554:	5f                   	pop    edi
 555:	70 72                	jo     5c9 <cmdClearScreen-0x30ffa37>
 557:	6f                   	outs   dx,DWORD PTR ds:[esi]
 558:	63 69 6e             	arpl   WORD PTR [ecx+0x6e],bp
 55b:	66 6f                	outs   dx,WORD PTR ds:[esi]
 55d:	00 62 73             	add    BYTE PTR [edx+0x73],ah
 560:	71 75                	jno    5d7 <cmdClearScreen-0x30ffa29>
 562:	6f                   	outs   dx,DWORD PTR ds:[esi]
 563:	74 65                	je     5ca <cmdClearScreen-0x30ffa36>
 565:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 568:	65 63 43 6d          	arpl   WORD PTR gs:[ebx+0x6d],ax
 56c:	64                   	fs
 56d:	73 00                	jae    56f <cmdClearScreen-0x30ffa91>
 56f:	6b 43 6d 64          	imul   eax,DWORD PTR [ebx+0x6d],0x64
 573:	6c                   	ins    BYTE PTR es:[edi],dx
 574:	69 6e 65 00 66 69 6e 	imul   ebp,DWORD PTR [esi+0x65],0x6e696600
 57b:	64                   	fs
 57c:	43                   	inc    ebx
 57d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 57e:	6d                   	ins    DWORD PTR es:[edi],dx
 57f:	6d                   	ins    DWORD PTR es:[edi],dx
 580:	61                   	popa   
 581:	6e                   	outs   dx,BYTE PTR ds:[esi]
 582:	64 00 65 78          	add    BYTE PTR fs:[ebp+0x78],ah
 586:	65 63 49 6e          	arpl   WORD PTR gs:[ecx+0x6e],cx
 58a:	74 65                	je     5f1 <cmdClearScreen-0x30ffa0f>
 58c:	72 6e                	jb     5fc <cmdClearScreen-0x30ffa04>
 58e:	61                   	popa   
 58f:	6c                   	ins    BYTE PTR es:[edi],dx
 590:	43                   	inc    ebx
 591:	6f                   	outs   dx,DWORD PTR ds:[esi]
 592:	6d                   	ins    DWORD PTR es:[edi],dx
 593:	6d                   	ins    DWORD PTR es:[edi],dx
 594:	61                   	popa   
 595:	6e                   	outs   dx,BYTE PTR ds:[esi]
 596:	64 00 70 72          	add    BYTE PTR fs:[eax+0x72],dh
 59a:	65                   	gs
 59b:	70 72                	jo     60f <cmdClearScreen-0x30ff9f1>
 59d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 59e:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 5a1:	73 43                	jae    5e6 <cmdClearScreen-0x30ffa1a>
 5a3:	6d                   	ins    DWORD PTR es:[edi],dx
 5a4:	64 00 70 72          	add    BYTE PTR fs:[eax+0x72],dh
 5a8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5a9:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 5ac:	73 53                	jae    601 <cmdClearScreen-0x30ff9ff>
 5ae:	69 67 6e 61 6c 00 6c 	imul   esp,DWORD PTR [edi+0x6e],0x6c006c61
 5b5:	74 65                	je     61c <cmdClearScreen-0x30ff9e4>
 5b7:	6d                   	ins    DWORD PTR es:[edi],dx
 5b8:	70 00                	jo     5ba <cmdClearScreen-0x30ffa46>
 5ba:	63 6f 70             	arpl   WORD PTR [edi+0x70],bp
 5bd:	79 62                	jns    621 <cmdClearScreen-0x30ff9df>
 5bf:	75 66                	jne    627 <cmdClearScreen-0x30ff9d9>
 5c1:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 5c4:	65                   	gs
 5c5:	70 00                	jo     5c7 <cmdClearScreen-0x30ffa39>
 5c7:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 5ca:	6d                   	ins    DWORD PTR es:[edi],dx
 5cb:	61                   	popa   
 5cc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5cd:	64                   	fs
 5ce:	48                   	dec    eax
 5cf:	69 73 74 6f 72 79 50 	imul   esi,DWORD PTR [ebx+0x74],0x5079726f
 5d6:	74 72                	je     64a <cmdClearScreen-0x30ff9b6>
 5d8:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 5db:	70 75                	jo     652 <cmdClearScreen-0x30ff9ae>
 5dd:	74 00                	je     5df <cmdClearScreen-0x30ffa21>
 5df:	63 70 75             	arpl   WORD PTR [eax+0x75],si
 5e2:	69 64 5f 65 78 74 65 	imul   esp,DWORD PTR [edi+ebx*2+0x65],0x6e657478
 5e9:	6e 
 5ea:	64                   	fs
 5eb:	65                   	gs
 5ec:	64                   	fs
 5ed:	5f                   	pop    edi
 5ee:	66                   	data16
 5ef:	65                   	gs
 5f0:	61                   	popa   
 5f1:	74 75                	je     668 <cmdClearScreen-0x30ff998>
 5f3:	72 65                	jb     65a <cmdClearScreen-0x30ff9a6>
 5f5:	5f                   	pop    edi
 5f6:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
 5f9:	73 00                	jae    5fb <cmdClearScreen-0x30ffa05>
 5fb:	73 69                	jae    666 <cmdClearScreen-0x30ff99a>
 5fd:	67 6e                	outs   dx,BYTE PTR ds:[si]
 5ff:	61                   	popa   
 600:	6c                   	ins    BYTE PTR es:[edi],dx
 601:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 604:	65                   	gs
 605:	65                   	gs
 606:	41                   	inc    ecx
 607:	72 67                	jb     670 <cmdClearScreen-0x30ff990>
 609:	56                   	push   esi
 60a:	00 61 6e             	add    BYTE PTR [ecx+0x6e],ah
 60d:	73 69                	jae    678 <cmdClearScreen-0x30ff988>
 60f:	53                   	push   ebx
 610:	65                   	gs
 611:	71 00                	jno    613 <cmdClearScreen-0x30ff9ed>
 613:	73 61                	jae    676 <cmdClearScreen-0x30ff98a>
 615:	76 65                	jbe    67c <cmdClearScreen-0x30ff984>
 617:	43                   	inc    ebx
 618:	6f                   	outs   dx,DWORD PTR ds:[esi]
 619:	6d                   	ins    DWORD PTR es:[edi],dx
 61a:	6d                   	ins    DWORD PTR es:[edi],dx
 61b:	61                   	popa   
 61c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 61d:	64 00 70 61          	add    BYTE PTR fs:[eax+0x61],dh
 621:	72 61                	jb     684 <cmdClearScreen-0x30ff97c>
 623:	6d                   	ins    DWORD PTR es:[edi],dx
 624:	73 54                	jae    67a <cmdClearScreen-0x30ff986>
 626:	6f                   	outs   dx,DWORD PTR ds:[esi]
 627:	41                   	inc    ecx
 628:	72 67                	jb     691 <cmdClearScreen-0x30ff96f>
 62a:	76 00                	jbe    62c <cmdClearScreen-0x30ff9d4>
 62c:	65                   	gs
 62d:	6d                   	ins    DWORD PTR es:[edi],dx
 62e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 62f:	64                   	fs
 630:	65                   	gs
 631:	6c                   	ins    BYTE PTR es:[edi],dx
 632:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 635:	6d                   	ins    DWORD PTR es:[edi],dx
 636:	6d                   	ins    DWORD PTR es:[edi],dx
 637:	61                   	popa   
 638:	6e                   	outs   dx,BYTE PTR ds:[esi]
 639:	64                   	fs
 63a:	48                   	dec    eax
 63b:	69 73 74 6f 72 79 4d 	imul   esi,DWORD PTR [ebx+0x74],0x4d79726f
 642:	61                   	popa   
 643:	78 00                	js     645 <cmdClearScreen-0x30ff9bb>
 645:	6d                   	ins    DWORD PTR es:[edi],dx
 646:	61                   	popa   
 647:	78 61                	js     6aa <cmdClearScreen-0x30ff956>
 649:	72 67                	jb     6b2 <cmdClearScreen-0x30ff94e>
 64b:	63 00                	arpl   WORD PTR [eax],ax
 64d:	64                   	fs
 64e:	65                   	gs
 64f:	6c                   	ins    BYTE PTR es:[edi],dx
 650:	69 6d 73 00 63 6f 6d 	imul   ebp,DWORD PTR [ebp+0x73],0x6d6f6300
 657:	6d                   	ins    DWORD PTR es:[edi],dx
 658:	61                   	popa   
 659:	6e                   	outs   dx,BYTE PTR ds:[esi]
 65a:	64                   	fs
 65b:	57                   	push   edi
 65c:	61                   	popa   
 65d:	73 46                	jae    6a5 <cmdClearScreen-0x30ff95b>
 65f:	72 6f                	jb     6d0 <cmdClearScreen-0x30ff930>
 661:	6d                   	ins    DWORD PTR es:[edi],dx
 662:	54                   	push   esp
 663:	68 69 73 42 75       	push   0x75427369
 668:	66                   	data16
 669:	66                   	data16
 66a:	65                   	gs
 66b:	72 50                	jb     6bd <cmdClearScreen-0x30ff943>
 66d:	74 72                	je     6e1 <cmdClearScreen-0x30ff91f>
 66f:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 672:	64 31 00             	xor    DWORD PTR fs:[eax],eax
 675:	70 61                	jo     6d8 <cmdClearScreen-0x30ff928>
 677:	64 32 00             	xor    al,BYTE PTR fs:[eax]
 67a:	70 63                	jo     6df <cmdClearScreen-0x30ff921>
 67c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 67d:	75 6e                	jne    6ed <cmdClearScreen-0x30ff913>
 67f:	74 00                	je     681 <cmdClearScreen-0x30ff97f>
 681:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 683:	6e                   	outs   dx,BYTE PTR ds:[esi]
 684:	65                   	gs
 685:	47                   	inc    edi
 686:	65                   	gs
 687:	74 74                	je     6fd <cmdClearScreen-0x30ff903>
 689:	69 6e 67 4b 65 79 73 	imul   ebp,DWORD PTR [esi+0x67],0x7379654b
 690:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
 694:	72 72                	jb     708 <cmdClearScreen-0x30ff8f8>
 696:	4b                   	dec    ebx
 697:	65                   	gs
 698:	79 43                	jns    6dd <cmdClearScreen-0x30ff923>
 69a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 69b:	75 6e                	jne    70b <cmdClearScreen-0x30ff8f5>
 69d:	74 00                	je     69f <cmdClearScreen-0x30ff961>
 69f:	75 69                	jne    70a <cmdClearScreen-0x30ff8f6>
 6a1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6a2:	74 38                	je     6dc <cmdClearScreen-0x30ff924>
 6a4:	5f                   	pop    edi
 6a5:	74 00                	je     6a7 <cmdClearScreen-0x30ff959>
 6a7:	72 65                	jb     70e <cmdClearScreen-0x30ff8f2>
 6a9:	70 72                	jo     71d <cmdClearScreen-0x30ff8e3>
 6ab:	69 6e 74 43 6f 6d 6d 	imul   ebp,DWORD PTR [esi+0x74],0x6d6d6f43
 6b2:	61                   	popa   
 6b3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6b4:	64 00 70 61          	add    BYTE PTR fs:[eax+0x61],dh
 6b8:	72 73                	jb     72d <cmdClearScreen-0x30ff8d3>
 6ba:	65                   	gs
 6bb:	50                   	push   eax
 6bc:	61                   	popa   
 6bd:	72 61                	jb     720 <cmdClearScreen-0x30ff8e0>
 6bf:	6d                   	ins    DWORD PTR es:[edi],dx
 6c0:	73 53                	jae    715 <cmdClearScreen-0x30ff8eb>
 6c2:	68 65 6c 6c 00       	push   0x6c6c65
 6c7:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 6ca:	6d                   	ins    DWORD PTR es:[edi],dx
 6cb:	61                   	popa   
 6cc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 6cd:	64                   	fs
 6ce:	48                   	dec    eax
 6cf:	69 73 74 6f 72 79 00 	imul   esi,DWORD PTR [ebx+0x74],0x79726f
 6d6:	6b 53 68 65          	imul   edx,DWORD PTR [ebx+0x68],0x65
 6da:	6c                   	ins    BYTE PTR es:[edi],dx
 6db:	6c                   	ins    BYTE PTR es:[edi],dx
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
