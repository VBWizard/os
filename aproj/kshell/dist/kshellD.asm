
Debug/GNU-Linux/kshell:     file format elf32-i386


Disassembly of section .text:

03100000 <cmdClearScreen>:
cmdClearScreen():
/home/yogi/src/os/aproj/kshell/src/commands.c:11


#include "kshell.h"

void cmdClearScreen()
{
 3100000:	f3 0f 1e fb          	endbr32 
 3100004:	55                   	push   ebp
 3100005:	89 e5                	mov    ebp,esp
 3100007:	53                   	push   ebx
 3100008:	83 ec 04             	sub    esp,0x4
 310000b:	e8 76 1f 00 00       	call   3101f86 <__x86.get_pc_thunk.ax>
 3100010:	05 18 3b 00 00       	add    eax,0x3b18
/home/yogi/src/os/aproj/kshell/src/commands.c:12
    printf("\033[2J");
 3100015:	83 ec 0c             	sub    esp,0xc
 3100018:	8d 90 79 eb ff ff    	lea    edx,[eax-0x1487]
 310001e:	52                   	push   edx
 310001f:	89 c3                	mov    ebx,eax
 3100021:	e8 6a 22 00 00       	call   3102290 <printf@plt>
 3100026:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:13
}
 3100029:	90                   	nop
 310002a:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 310002d:	c9                   	leave  
 310002e:	c3                   	ret    

0310002f <cmdPrintEnv>:
cmdPrintEnv():
/home/yogi/src/os/aproj/kshell/src/commands.c:16

void cmdPrintEnv()
{
 310002f:	f3 0f 1e fb          	endbr32 
 3100033:	55                   	push   ebp
 3100034:	89 e5                	mov    ebp,esp
 3100036:	53                   	push   ebx
 3100037:	83 ec 14             	sub    esp,0x14
 310003a:	e8 4b 1f 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 310003f:	81 c3 e9 3a 00 00    	add    ebx,0x3ae9
/home/yogi/src/os/aproj/kshell/src/commands.c:17
    for (int cnt=0;cnt<100;cnt++)
 3100045:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310004c:	eb 3f                	jmp    310008d <cmdPrintEnv+0x5e>
/home/yogi/src/os/aproj/kshell/src/commands.c:19
    {
        if (environmentLoc[cnt]!=0)
 310004e:	8d 83 c4 01 00 00    	lea    eax,[ebx+0x1c4]
 3100054:	8b 00                	mov    eax,DWORD PTR [eax]
 3100056:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100059:	c1 e2 02             	shl    edx,0x2
 310005c:	01 d0                	add    eax,edx
 310005e:	8b 00                	mov    eax,DWORD PTR [eax]
 3100060:	85 c0                	test   eax,eax
 3100062:	74 25                	je     3100089 <cmdPrintEnv+0x5a>
/home/yogi/src/os/aproj/kshell/src/commands.c:21
        {
            print("%s\n",environmentLoc[cnt]);
 3100064:	8d 83 c4 01 00 00    	lea    eax,[ebx+0x1c4]
 310006a:	8b 00                	mov    eax,DWORD PTR [eax]
 310006c:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 310006f:	c1 e2 02             	shl    edx,0x2
 3100072:	01 d0                	add    eax,edx
 3100074:	8b 00                	mov    eax,DWORD PTR [eax]
 3100076:	83 ec 08             	sub    esp,0x8
 3100079:	50                   	push   eax
 310007a:	8d 83 7e eb ff ff    	lea    eax,[ebx-0x1482]
 3100080:	50                   	push   eax
 3100081:	e8 fa 21 00 00       	call   3102280 <print@plt>
 3100086:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:17 (discriminator 2)
    for (int cnt=0;cnt<100;cnt++)
 3100089:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:17 (discriminator 1)
 310008d:	83 7d f4 63          	cmp    DWORD PTR [ebp-0xc],0x63
 3100091:	7e bb                	jle    310004e <cmdPrintEnv+0x1f>
/home/yogi/src/os/aproj/kshell/src/commands.c:25
        }
    }
   
}
 3100093:	90                   	nop
 3100094:	90                   	nop
 3100095:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100098:	c9                   	leave  
 3100099:	c3                   	ret    

0310009a <cmdSetEnv>:
cmdSetEnv():
/home/yogi/src/os/aproj/kshell/src/commands.c:28

void cmdSetEnv(char* cmdline)
{
 310009a:	f3 0f 1e fb          	endbr32 
 310009e:	55                   	push   ebp
 310009f:	89 e5                	mov    ebp,esp
 31000a1:	53                   	push   ebx
 31000a2:	81 ec 24 05 00 00    	sub    esp,0x524
 31000a8:	e8 dd 1e 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 31000ad:	81 c3 7b 3a 00 00    	add    ebx,0x3a7b
/home/yogi/src/os/aproj/kshell/src/commands.c:32
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    char *varName, *varValue;
    
    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 31000b3:	83 ec 04             	sub    esp,0x4
 31000b6:	68 00 05 00 00       	push   0x500
 31000bb:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000c1:	50                   	push   eax
 31000c2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31000c5:	e8 6e 11 00 00       	call   3101238 <parseParamsShell>
 31000ca:	83 c4 10             	add    esp,0x10
 31000cd:	85 c0                	test   eax,eax
 31000cf:	0f 84 2b 01 00 00    	je     3100200 <cmdSetEnv+0x166>
/home/yogi/src/os/aproj/kshell/src/commands.c:34
    {
        int nameLen=0, valueLen=0;
 31000d5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31000dc:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:35
        int found=(uintptr_t)strstr(params[0],"=");
 31000e3:	83 ec 08             	sub    esp,0x8
 31000e6:	8d 83 82 eb ff ff    	lea    eax,[ebx-0x147e]
 31000ec:	50                   	push   eax
 31000ed:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 31000f3:	50                   	push   eax
 31000f4:	e8 87 22 00 00       	call   3102380 <strstr@plt>
 31000f9:	83 c4 10             	add    esp,0x10
 31000fc:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:36
        if (found==0)
 31000ff:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100103:	75 17                	jne    310011c <cmdSetEnv+0x82>
/home/yogi/src/os/aproj/kshell/src/commands.c:38
        {
            print("Usage: set variable=value\n");
 3100105:	83 ec 0c             	sub    esp,0xc
 3100108:	8d 83 84 eb ff ff    	lea    eax,[ebx-0x147c]
 310010e:	50                   	push   eax
 310010f:	e8 6c 21 00 00       	call   3102280 <print@plt>
 3100114:	83 c4 10             	add    esp,0x10
 3100117:	e9 e9 00 00 00       	jmp    3100205 <cmdSetEnv+0x16b>
/home/yogi/src/os/aproj/kshell/src/commands.c:41
            return;
        }
        nameLen=found-(uintptr_t)params[0];
 310011c:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 310011f:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 3100125:	29 c2                	sub    edx,eax
 3100127:	89 d0                	mov    eax,edx
 3100129:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:42
        valueLen=strlen(params[0])-nameLen-1;
 310012c:	83 ec 0c             	sub    esp,0xc
 310012f:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 3100135:	50                   	push   eax
 3100136:	e8 85 23 00 00       	call   31024c0 <strlen@plt>
 310013b:	83 c4 10             	add    esp,0x10
 310013e:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100141:	29 d0                	sub    eax,edx
 3100143:	83 e8 01             	sub    eax,0x1
 3100146:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:43
        varName = malloc(nameLen+1);
 3100149:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310014c:	83 c0 01             	add    eax,0x1
 310014f:	83 ec 0c             	sub    esp,0xc
 3100152:	50                   	push   eax
 3100153:	e8 88 21 00 00       	call   31022e0 <malloc@plt>
 3100158:	83 c4 10             	add    esp,0x10
 310015b:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:44
        varValue = malloc(valueLen);
 310015e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100161:	83 ec 0c             	sub    esp,0xc
 3100164:	50                   	push   eax
 3100165:	e8 76 21 00 00       	call   31022e0 <malloc@plt>
 310016a:	83 c4 10             	add    esp,0x10
 310016d:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:45
        strncpy(varName,params[0],nameLen);
 3100170:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100173:	83 ec 04             	sub    esp,0x4
 3100176:	50                   	push   eax
 3100177:	8d 85 e4 fa ff ff    	lea    eax,[ebp-0x51c]
 310017d:	50                   	push   eax
 310017e:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100181:	e8 2a 22 00 00       	call   31023b0 <strncpy@plt>
 3100186:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:46
        varName[nameLen]=0;
 3100189:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 310018c:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 310018f:	01 d0                	add    eax,edx
 3100191:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:47
        strncpy(varValue,params[0]+nameLen+1,valueLen);
 3100194:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100197:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 310019a:	8d 4a 01             	lea    ecx,[edx+0x1]
 310019d:	8d 95 e4 fa ff ff    	lea    edx,[ebp-0x51c]
 31001a3:	01 ca                	add    edx,ecx
 31001a5:	83 ec 04             	sub    esp,0x4
 31001a8:	50                   	push   eax
 31001a9:	52                   	push   edx
 31001aa:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 31001ad:	e8 fe 21 00 00       	call   31023b0 <strncpy@plt>
 31001b2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:48
        strtrim(varName);
 31001b5:	83 ec 0c             	sub    esp,0xc
 31001b8:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 31001bb:	e8 60 22 00 00       	call   3102420 <strtrim@plt>
 31001c0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:49
        strtrim(varValue);
 31001c3:	83 ec 0c             	sub    esp,0xc
 31001c6:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 31001c9:	e8 52 22 00 00       	call   3102420 <strtrim@plt>
 31001ce:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:50
        setenv(varName, varValue);
 31001d1:	83 ec 08             	sub    esp,0x8
 31001d4:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 31001d7:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 31001da:	e8 f1 21 00 00       	call   31023d0 <setenv@plt>
 31001df:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:51
        free(varName);
 31001e2:	83 ec 0c             	sub    esp,0xc
 31001e5:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 31001e8:	e8 23 23 00 00       	call   3102510 <free@plt>
 31001ed:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:52
        free(varValue);
 31001f0:	83 ec 0c             	sub    esp,0xc
 31001f3:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 31001f6:	e8 15 23 00 00       	call   3102510 <free@plt>
 31001fb:	83 c4 10             	add    esp,0x10
 31001fe:	eb 05                	jmp    3100205 <cmdSetEnv+0x16b>
/home/yogi/src/os/aproj/kshell/src/commands.c:55
    }
    else
        cmdPrintEnv();
 3100200:	e8 2a fe ff ff       	call   310002f <cmdPrintEnv>
/home/yogi/src/os/aproj/kshell/src/commands.c:56
}
 3100205:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100208:	c9                   	leave  
 3100209:	c3                   	ret    

0310020a <kexec2>:
kexec2():
/home/yogi/src/os/aproj/kshell/src/commands.c:59

int kexec2(char* path, int argc, char** argv, bool background)
{
 310020a:	f3 0f 1e fb          	endbr32 
 310020e:	55                   	push   ebp
 310020f:	89 e5                	mov    ebp,esp
 3100211:	53                   	push   ebx
 3100212:	83 ec 24             	sub    esp,0x24
 3100215:	e8 70 1d 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 310021a:	81 c3 0e 39 00 00    	add    ebx,0x390e
 3100220:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
 3100223:	88 45 e4             	mov    BYTE PTR [ebp-0x1c],al
/home/yogi/src/os/aproj/kshell/src/commands.c:60
    int pid=execa(path,argc,argv);
 3100226:	83 ec 04             	sub    esp,0x4
 3100229:	ff 75 10             	push   DWORD PTR [ebp+0x10]
 310022c:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 310022f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100232:	e8 a9 22 00 00       	call   31024e0 <execa@plt>
 3100237:	83 c4 10             	add    esp,0x10
 310023a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:62

    if (pid>0)
 310023d:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100241:	7e 56                	jle    3100299 <kexec2+0x8f>
/home/yogi/src/os/aproj/kshell/src/commands.c:64
    {
        if (!background)
 3100243:	0f b6 45 e4          	movzx  eax,BYTE PTR [ebp-0x1c]
 3100247:	83 f0 01             	xor    eax,0x1
 310024a:	84 c0                	test   al,al
 310024c:	74 60                	je     31002ae <kexec2+0xa4>
/home/yogi/src/os/aproj/kshell/src/commands.c:67
        {
            //print("DEBUG1: waitpid = %08X\n",&waitpid);
            lastExecExitCode = waitpid(pid);
 310024e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100251:	83 ec 0c             	sub    esp,0xc
 3100254:	50                   	push   eax
 3100255:	e8 16 20 00 00       	call   3102270 <waitpid@plt>
 310025a:	83 c4 10             	add    esp,0x10
 310025d:	89 c2                	mov    edx,eax
 310025f:	8d 83 08 05 00 00    	lea    eax,[ebx+0x508]
 3100265:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/kshell/src/commands.c:69
            char ret[10];
            itoa(lastExecExitCode,ret);
 3100267:	8d 83 08 05 00 00    	lea    eax,[ebx+0x508]
 310026d:	8b 00                	mov    eax,DWORD PTR [eax]
 310026f:	89 c2                	mov    edx,eax
 3100271:	83 ec 08             	sub    esp,0x8
 3100274:	8d 45 ea             	lea    eax,[ebp-0x16]
 3100277:	50                   	push   eax
 3100278:	52                   	push   edx
 3100279:	e8 a2 20 00 00       	call   3102320 <itoa@plt>
 310027e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:70
            setenv("LASTEXIT",ret);
 3100281:	83 ec 08             	sub    esp,0x8
 3100284:	8d 45 ea             	lea    eax,[ebp-0x16]
 3100287:	50                   	push   eax
 3100288:	8d 83 9f eb ff ff    	lea    eax,[ebx-0x1461]
 310028e:	50                   	push   eax
 310028f:	e8 3c 21 00 00       	call   31023d0 <setenv@plt>
 3100294:	83 c4 10             	add    esp,0x10
 3100297:	eb 15                	jmp    31002ae <kexec2+0xa4>
/home/yogi/src/os/aproj/kshell/src/commands.c:74
        }
    }
    else
        print("Error executing %s\n",path);
 3100299:	83 ec 08             	sub    esp,0x8
 310029c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310029f:	8d 83 a8 eb ff ff    	lea    eax,[ebx-0x1458]
 31002a5:	50                   	push   eax
 31002a6:	e8 d5 1f 00 00       	call   3102280 <print@plt>
 31002ab:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:76

}
 31002ae:	90                   	nop
 31002af:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31002b2:	c9                   	leave  
 31002b3:	c3                   	ret    

031002b4 <kexec>:
kexec():
/home/yogi/src/os/aproj/kshell/src/commands.c:79

int kexec(char* cmdline, int stdinpipe, int stdoutpipe, int stderrpipe)
{
 31002b4:	f3 0f 1e fb          	endbr32 
 31002b8:	55                   	push   ebp
 31002b9:	89 e5                	mov    ebp,esp
 31002bb:	53                   	push   ebx
 31002bc:	81 ec 74 06 00 00    	sub    esp,0x674
 31002c2:	e8 c3 1c 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 31002c7:	81 c3 61 38 00 00    	add    ebx,0x3861
/home/yogi/src/os/aproj/kshell/src/commands.c:80
    bool background=false;
 31002cd:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:81
    int forkPid=0;
 31002d1:	c7 45 c0 00 00 00 00 	mov    DWORD PTR [ebp-0x40],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:83
    char* tok;
    char* pgm=NULL;
 31002d8:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [ebp-0x44],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:86
    char fileToExec[256];
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];  //strangely, if I remove this variable I get a SEGV at 0x009B:0x7000e0bf for 0x00000023
    char *stdinRedir=NULL, *stdoutRedir=NULL;
 31002df:	c7 45 b8 00 00 00 00 	mov    DWORD PTR [ebp-0x48],0x0
 31002e6:	c7 45 b4 00 00 00 00 	mov    DWORD PTR [ebp-0x4c],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:87
    char *stdoutPipe=NULL;
 31002ed:	c7 45 b0 00 00 00 00 	mov    DWORD PTR [ebp-0x50],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:88
    char *stdinfile=NULL, *stdoutfile=NULL, *stderrfile=NULL;
 31002f4:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 31002fb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100302:	c7 45 ac 00 00 00 00 	mov    DWORD PTR [ebp-0x54],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:89
    int argc = 0;
 3100309:	c7 85 9c f9 ff ff 00 	mov    DWORD PTR [ebp-0x664],0x0
 3100310:	00 00 00 
/home/yogi/src/os/aproj/kshell/src/commands.c:91
    char **argv;
    int retVal=-1;
 3100313:	c7 45 e8 ff ff ff ff 	mov    DWORD PTR [ebp-0x18],0xffffffff
/home/yogi/src/os/aproj/kshell/src/commands.c:92
    char *temp=NULL;
 310031a:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:93
    bool freeCmdline=false;
 3100321:	c6 45 ab 00          	mov    BYTE PTR [ebp-0x55],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:94
    int yourSTDIN=0, yourSTDOUT=0;
 3100325:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 310032c:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:95
    char *realCmdline=malloc(1024);
 3100333:	83 ec 0c             	sub    esp,0xc
 3100336:	68 00 04 00 00       	push   0x400
 310033b:	e8 a0 1f 00 00       	call   31022e0 <malloc@plt>
 3100340:	83 c4 10             	add    esp,0x10
 3100343:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:97
    
    stdoutPipe=strstr(cmdline,"|");
 3100346:	83 ec 08             	sub    esp,0x8
 3100349:	8d 83 bc eb ff ff    	lea    eax,[ebx-0x1444]
 310034f:	50                   	push   eax
 3100350:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100353:	e8 28 20 00 00       	call   3102380 <strstr@plt>
 3100358:	83 c4 10             	add    esp,0x10
 310035b:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:99
    
    if (stdoutPipe)
 310035e:	83 7d b0 00          	cmp    DWORD PTR [ebp-0x50],0x0
 3100362:	74 33                	je     3100397 <kexec+0xe3>
/home/yogi/src/os/aproj/kshell/src/commands.c:101
    {
        pipe(execPipes);
 3100364:	83 ec 0c             	sub    esp,0xc
 3100367:	8d 83 18 05 00 00    	lea    eax,[ebx+0x518]
 310036d:	50                   	push   eax
 310036e:	e8 cd 1f 00 00       	call   3102340 <pipe@plt>
 3100373:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:102
        realCmdline=strreplace(cmdline,"|","",realCmdline);
 3100376:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 3100379:	8d 83 be eb ff ff    	lea    eax,[ebx-0x1442]
 310037f:	50                   	push   eax
 3100380:	8d 83 bc eb ff ff    	lea    eax,[ebx-0x1444]
 3100386:	50                   	push   eax
 3100387:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310038a:	e8 61 21 00 00       	call   31024f0 <strreplace@plt>
 310038f:	83 c4 10             	add    esp,0x10
 3100392:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
 3100395:	eb 11                	jmp    31003a8 <kexec+0xf4>
/home/yogi/src/os/aproj/kshell/src/commands.c:105
    }
    else
        strcpy(realCmdline,cmdline);
 3100397:	83 ec 08             	sub    esp,0x8
 310039a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310039d:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31003a0:	e8 bb 1e 00 00       	call   3102260 <strcpy@plt>
 31003a5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:108
    
    //look for < and > redirects so that we can strip them from the command line and use them to redirect stdin/stdout
    stdinRedir=strstr(realCmdline,"<");
 31003a8:	83 ec 08             	sub    esp,0x8
 31003ab:	8d 83 bf eb ff ff    	lea    eax,[ebx-0x1441]
 31003b1:	50                   	push   eax
 31003b2:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31003b5:	e8 c6 1f 00 00       	call   3102380 <strstr@plt>
 31003ba:	83 c4 10             	add    esp,0x10
 31003bd:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:109
    stdoutRedir=strstr(realCmdline,">");
 31003c0:	83 ec 08             	sub    esp,0x8
 31003c3:	8d 83 c1 eb ff ff    	lea    eax,[ebx-0x143f]
 31003c9:	50                   	push   eax
 31003ca:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31003cd:	e8 ae 1f 00 00       	call   3102380 <strstr@plt>
 31003d2:	83 c4 10             	add    esp,0x10
 31003d5:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:111

    if (stdinRedir)
 31003d8:	83 7d b8 00          	cmp    DWORD PTR [ebp-0x48],0x0
 31003dc:	0f 84 a7 00 00 00    	je     3100489 <kexec+0x1d5>
/home/yogi/src/os/aproj/kshell/src/commands.c:113
    {
        stdinfile = malloc(256);
 31003e2:	83 ec 0c             	sub    esp,0xc
 31003e5:	68 00 01 00 00       	push   0x100
 31003ea:	e8 f1 1e 00 00       	call   31022e0 <malloc@plt>
 31003ef:	83 c4 10             	add    esp,0x10
 31003f2:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:114
        char *start = strstr(stdinRedir," ")+1;
 31003f5:	83 ec 08             	sub    esp,0x8
 31003f8:	8d 83 c3 eb ff ff    	lea    eax,[ebx-0x143d]
 31003fe:	50                   	push   eax
 31003ff:	ff 75 b8             	push   DWORD PTR [ebp-0x48]
 3100402:	e8 79 1f 00 00       	call   3102380 <strstr@plt>
 3100407:	83 c4 10             	add    esp,0x10
 310040a:	83 c0 01             	add    eax,0x1
 310040d:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:115
        if (!start)
 3100410:	83 7d d4 00          	cmp    DWORD PTR [ebp-0x2c],0x0
 3100414:	75 06                	jne    310041c <kexec+0x168>
/home/yogi/src/os/aproj/kshell/src/commands.c:116
            start=stdinRedir;
 3100416:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
 3100419:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:117
        char *end = strstr(start," ");
 310041c:	83 ec 08             	sub    esp,0x8
 310041f:	8d 83 c3 eb ff ff    	lea    eax,[ebx-0x143d]
 3100425:	50                   	push   eax
 3100426:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100429:	e8 52 1f 00 00       	call   3102380 <strstr@plt>
 310042e:	83 c4 10             	add    esp,0x10
 3100431:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:118
        if (!end)
 3100434:	83 7d d0 00          	cmp    DWORD PTR [ebp-0x30],0x0
 3100438:	75 18                	jne    3100452 <kexec+0x19e>
/home/yogi/src/os/aproj/kshell/src/commands.c:119
            end = strstr(start,"\n");
 310043a:	83 ec 08             	sub    esp,0x8
 310043d:	8d 83 c5 eb ff ff    	lea    eax,[ebx-0x143b]
 3100443:	50                   	push   eax
 3100444:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100447:	e8 34 1f 00 00       	call   3102380 <strstr@plt>
 310044c:	83 c4 10             	add    esp,0x10
 310044f:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:120
        if (end)
 3100452:	83 7d d0 00          	cmp    DWORD PTR [ebp-0x30],0x0
 3100456:	74 1a                	je     3100472 <kexec+0x1be>
/home/yogi/src/os/aproj/kshell/src/commands.c:121
            strncpy(stdinfile,start,end-start);
 3100458:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 310045b:	2b 45 d4             	sub    eax,DWORD PTR [ebp-0x2c]
 310045e:	83 ec 04             	sub    esp,0x4
 3100461:	50                   	push   eax
 3100462:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100465:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100468:	e8 43 1f 00 00       	call   31023b0 <strncpy@plt>
 310046d:	83 c4 10             	add    esp,0x10
 3100470:	eb 11                	jmp    3100483 <kexec+0x1cf>
/home/yogi/src/os/aproj/kshell/src/commands.c:123
        else
            strcpy(stdinfile, start);
 3100472:	83 ec 08             	sub    esp,0x8
 3100475:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100478:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310047b:	e8 e0 1d 00 00       	call   3102260 <strcpy@plt>
 3100480:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:126
        //Fixup the original command line
        
        *stdinRedir='\0';
 3100483:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
 3100486:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:129
    }
    
    if (stdoutRedir)
 3100489:	83 7d b4 00          	cmp    DWORD PTR [ebp-0x4c],0x0
 310048d:	0f 84 c3 00 00 00    	je     3100556 <kexec+0x2a2>
/home/yogi/src/os/aproj/kshell/src/commands.c:131
    {
        stdoutfile = malloc(256);
 3100493:	83 ec 0c             	sub    esp,0xc
 3100496:	68 00 01 00 00       	push   0x100
 310049b:	e8 40 1e 00 00       	call   31022e0 <malloc@plt>
 31004a0:	83 c4 10             	add    esp,0x10
 31004a3:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:132
        char *start = strstr(stdoutRedir," ")+1;
 31004a6:	83 ec 08             	sub    esp,0x8
 31004a9:	8d 83 c3 eb ff ff    	lea    eax,[ebx-0x143d]
 31004af:	50                   	push   eax
 31004b0:	ff 75 b4             	push   DWORD PTR [ebp-0x4c]
 31004b3:	e8 c8 1e 00 00       	call   3102380 <strstr@plt>
 31004b8:	83 c4 10             	add    esp,0x10
 31004bb:	83 c0 01             	add    eax,0x1
 31004be:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:133
        if (!start)
 31004c1:	83 7d cc 00          	cmp    DWORD PTR [ebp-0x34],0x0
 31004c5:	75 06                	jne    31004cd <kexec+0x219>
/home/yogi/src/os/aproj/kshell/src/commands.c:134
            start=stdoutRedir;
 31004c7:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 31004ca:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:135
        char *end = strstr(start," ");
 31004cd:	83 ec 08             	sub    esp,0x8
 31004d0:	8d 83 c3 eb ff ff    	lea    eax,[ebx-0x143d]
 31004d6:	50                   	push   eax
 31004d7:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 31004da:	e8 a1 1e 00 00       	call   3102380 <strstr@plt>
 31004df:	83 c4 10             	add    esp,0x10
 31004e2:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:136
        if (!end)
 31004e5:	83 7d c8 00          	cmp    DWORD PTR [ebp-0x38],0x0
 31004e9:	75 18                	jne    3100503 <kexec+0x24f>
/home/yogi/src/os/aproj/kshell/src/commands.c:137
            end = strstr(start,"\n");
 31004eb:	83 ec 08             	sub    esp,0x8
 31004ee:	8d 83 c5 eb ff ff    	lea    eax,[ebx-0x143b]
 31004f4:	50                   	push   eax
 31004f5:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 31004f8:	e8 83 1e 00 00       	call   3102380 <strstr@plt>
 31004fd:	83 c4 10             	add    esp,0x10
 3100500:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:138
        if (!end)
 3100503:	83 7d c8 00          	cmp    DWORD PTR [ebp-0x38],0x0
 3100507:	75 16                	jne    310051f <kexec+0x26b>
/home/yogi/src/os/aproj/kshell/src/commands.c:139
            end = start+strlen(start);
 3100509:	83 ec 0c             	sub    esp,0xc
 310050c:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 310050f:	e8 ac 1f 00 00       	call   31024c0 <strlen@plt>
 3100514:	83 c4 10             	add    esp,0x10
 3100517:	8b 55 cc             	mov    edx,DWORD PTR [ebp-0x34]
 310051a:	01 d0                	add    eax,edx
 310051c:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:140
        if (end)
 310051f:	83 7d c8 00          	cmp    DWORD PTR [ebp-0x38],0x0
 3100523:	74 1a                	je     310053f <kexec+0x28b>
/home/yogi/src/os/aproj/kshell/src/commands.c:141
            strncpy(stdoutfile,start,end-start);
 3100525:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 3100528:	2b 45 cc             	sub    eax,DWORD PTR [ebp-0x34]
 310052b:	83 ec 04             	sub    esp,0x4
 310052e:	50                   	push   eax
 310052f:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 3100532:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100535:	e8 76 1e 00 00       	call   31023b0 <strncpy@plt>
 310053a:	83 c4 10             	add    esp,0x10
 310053d:	eb 11                	jmp    3100550 <kexec+0x29c>
/home/yogi/src/os/aproj/kshell/src/commands.c:143
        else
            strcpy(stdoutfile, start);
 310053f:	83 ec 08             	sub    esp,0x8
 3100542:	ff 75 cc             	push   DWORD PTR [ebp-0x34]
 3100545:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100548:	e8 13 1d 00 00       	call   3102260 <strcpy@plt>
 310054d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:144
        *stdoutRedir='\0';
 3100550:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
 3100553:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:147
    }
    
    argv = cmdlineToArgv(realCmdline, &argc);
 3100556:	83 ec 08             	sub    esp,0x8
 3100559:	8d 85 9c f9 ff ff    	lea    eax,[ebp-0x664]
 310055f:	50                   	push   eax
 3100560:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 3100563:	e8 98 1d 00 00       	call   3102300 <cmdlineToArgv@plt>
 3100568:	83 c4 10             	add    esp,0x10
 310056b:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:149

    if (argc<1)
 310056e:	8b 85 9c f9 ff ff    	mov    eax,DWORD PTR [ebp-0x664]
 3100574:	85 c0                	test   eax,eax
 3100576:	7f 19                	jg     3100591 <kexec+0x2dd>
/home/yogi/src/os/aproj/kshell/src/commands.c:151
    {
        printf("kexec: Invalid command\n");
 3100578:	83 ec 0c             	sub    esp,0xc
 310057b:	8d 83 c7 eb ff ff    	lea    eax,[ebx-0x1439]
 3100581:	50                   	push   eax
 3100582:	e8 09 1d 00 00       	call   3102290 <printf@plt>
 3100587:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:152
        retVal=-3;
 310058a:	c7 45 e8 fd ff ff ff 	mov    DWORD PTR [ebp-0x18],0xfffffffd
/home/yogi/src/os/aproj/kshell/src/commands.c:155
    }

    if (retVal==-1)
 3100591:	83 7d e8 ff          	cmp    DWORD PTR [ebp-0x18],0xffffffff
 3100595:	75 7c                	jne    3100613 <kexec+0x35f>
/home/yogi/src/os/aproj/kshell/src/commands.c:157
    {
        temp=malloc(1024);
 3100597:	83 ec 0c             	sub    esp,0xc
 310059a:	68 00 04 00 00       	push   0x400
 310059f:	e8 3c 1d 00 00       	call   31022e0 <malloc@plt>
 31005a4:	83 c4 10             	add    esp,0x10
 31005a7:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:160
        fstat_t fstat;

        if (resolvePath(argv[0], temp,true)==0)
 31005aa:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 31005ad:	8b 00                	mov    eax,DWORD PTR [eax]
 31005af:	83 ec 04             	sub    esp,0x4
 31005b2:	6a 01                	push   0x1
 31005b4:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 31005b7:	50                   	push   eax
 31005b8:	e8 03 1d 00 00       	call   31022c0 <resolvePath@plt>
 31005bd:	83 c4 10             	add    esp,0x10
 31005c0:	85 c0                	test   eax,eax
 31005c2:	75 14                	jne    31005d8 <kexec+0x324>
/home/yogi/src/os/aproj/kshell/src/commands.c:161
            strcpy(argv[0],temp);
 31005c4:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 31005c7:	8b 00                	mov    eax,DWORD PTR [eax]
 31005c9:	83 ec 08             	sub    esp,0x8
 31005cc:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 31005cf:	50                   	push   eax
 31005d0:	e8 8b 1c 00 00       	call   3102260 <strcpy@plt>
 31005d5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:162
        if (stat(argv[0],&fstat)) //stat returns 0 if successful
 31005d8:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 31005db:	8b 00                	mov    eax,DWORD PTR [eax]
 31005dd:	83 ec 08             	sub    esp,0x8
 31005e0:	8d 95 94 f9 ff ff    	lea    edx,[ebp-0x66c]
 31005e6:	52                   	push   edx
 31005e7:	50                   	push   eax
 31005e8:	e8 83 1e 00 00       	call   3102470 <stat@plt>
 31005ed:	83 c4 10             	add    esp,0x10
 31005f0:	85 c0                	test   eax,eax
 31005f2:	74 1f                	je     3100613 <kexec+0x35f>
/home/yogi/src/os/aproj/kshell/src/commands.c:164
        {
            printf("invalid path or filename '%s'\n",argv[0]);
 31005f4:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 31005f7:	8b 00                	mov    eax,DWORD PTR [eax]
 31005f9:	83 ec 08             	sub    esp,0x8
 31005fc:	50                   	push   eax
 31005fd:	8d 83 e0 eb ff ff    	lea    eax,[ebx-0x1420]
 3100603:	50                   	push   eax
 3100604:	e8 87 1c 00 00       	call   3102290 <printf@plt>
 3100609:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:165
            retVal=-4;
 310060c:	c7 45 e8 fc ff ff ff 	mov    DWORD PTR [ebp-0x18],0xfffffffc
/home/yogi/src/os/aproj/kshell/src/commands.c:170
        }
    }

    //Everything is resolved and verified, lets execute the command!
    if (retVal==-1)
 3100613:	83 7d e8 ff          	cmp    DWORD PTR [ebp-0x18],0xffffffff
 3100617:	0f 85 c7 02 00 00    	jne    31008e4 <kexec+0x630>
/home/yogi/src/os/aproj/kshell/src/commands.c:172
    {
        strcpy(fileToExec,argv[0]);
 310061d:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 3100620:	8b 00                	mov    eax,DWORD PTR [eax]
 3100622:	83 ec 08             	sub    esp,0x8
 3100625:	50                   	push   eax
 3100626:	8d 85 a0 fe ff ff    	lea    eax,[ebp-0x160]
 310062c:	50                   	push   eax
 310062d:	e8 2e 1c 00 00       	call   3102260 <strcpy@plt>
 3100632:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:174

        if (*argv[argc-1]=='&')
 3100635:	8b 85 9c f9 ff ff    	mov    eax,DWORD PTR [ebp-0x664]
 310063b:	05 ff ff ff 3f       	add    eax,0x3fffffff
 3100640:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100647:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 310064a:	01 d0                	add    eax,edx
 310064c:	8b 00                	mov    eax,DWORD PTR [eax]
 310064e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100651:	3c 26                	cmp    al,0x26
 3100653:	75 04                	jne    3100659 <kexec+0x3a5>
/home/yogi/src/os/aproj/kshell/src/commands.c:175
            background=true;
 3100655:	c6 45 f7 01          	mov    BYTE PTR [ebp-0x9],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:177

        forkPid = fork();
 3100659:	e8 92 1d 00 00       	call   31023f0 <fork@plt>
 310065e:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:179

        if (execPipes[STDOUT_FILE]!=0)
 3100661:	8d 83 18 05 00 00    	lea    eax,[ebx+0x518]
 3100667:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 310066a:	85 c0                	test   eax,eax
 310066c:	74 40                	je     31006ae <kexec+0x3fa>
/home/yogi/src/os/aproj/kshell/src/commands.c:181
        {
            printd(DEBUG_LIBC,"kshell: Setting stdout for %s to 0x%08x\n",fileToExec,execPipes[STDOUT_FILE]);
 310066e:	8d 83 18 05 00 00    	lea    eax,[ebx+0x518]
 3100674:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 3100677:	50                   	push   eax
 3100678:	8d 85 a0 fe ff ff    	lea    eax,[ebp-0x160]
 310067e:	50                   	push   eax
 310067f:	8d 83 00 ec ff ff    	lea    eax,[ebx-0x1400]
 3100685:	50                   	push   eax
 3100686:	68 00 00 00 02       	push   0x2000000
 310068b:	e8 c0 1d 00 00       	call   3102450 <printd@plt>
 3100690:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:182
            yourSTDOUT=execPipes[STDOUT_FILE];
 3100693:	8d 83 18 05 00 00    	lea    eax,[ebx+0x518]
 3100699:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
 310069c:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:183
            execPipes[STDOUT_FILE]=0;
 310069f:	8d 83 18 05 00 00    	lea    eax,[ebx+0x518]
 31006a5:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
 31006ac:	eb 47                	jmp    31006f5 <kexec+0x441>
/home/yogi/src/os/aproj/kshell/src/commands.c:185
        }
        else if (execPipes[STDIN_FILE]!=0)
 31006ae:	8d 83 18 05 00 00    	lea    eax,[ebx+0x518]
 31006b4:	8b 00                	mov    eax,DWORD PTR [eax]
 31006b6:	85 c0                	test   eax,eax
 31006b8:	74 3b                	je     31006f5 <kexec+0x441>
/home/yogi/src/os/aproj/kshell/src/commands.c:187
        {
            printd(DEBUG_LIBC,"kshell: Setting stdin for %s to 0x%08x\n",fileToExec,execPipes[STDIN_FILE]);
 31006ba:	8d 83 18 05 00 00    	lea    eax,[ebx+0x518]
 31006c0:	8b 00                	mov    eax,DWORD PTR [eax]
 31006c2:	50                   	push   eax
 31006c3:	8d 85 a0 fe ff ff    	lea    eax,[ebp-0x160]
 31006c9:	50                   	push   eax
 31006ca:	8d 83 2c ec ff ff    	lea    eax,[ebx-0x13d4]
 31006d0:	50                   	push   eax
 31006d1:	68 00 00 00 02       	push   0x2000000
 31006d6:	e8 75 1d 00 00       	call   3102450 <printd@plt>
 31006db:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:188
            yourSTDIN=execPipes[STDIN_FILE];
 31006de:	8d 83 18 05 00 00    	lea    eax,[ebx+0x518]
 31006e4:	8b 00                	mov    eax,DWORD PTR [eax]
 31006e6:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:189
            execPipes[STDIN_FILE]=0;
 31006e9:	8d 83 18 05 00 00    	lea    eax,[ebx+0x518]
 31006ef:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:192
        }
        
        if (forkPid == 0)
 31006f5:	83 7d c0 00          	cmp    DWORD PTR [ebp-0x40],0x0
 31006f9:	0f 85 42 01 00 00    	jne    3100841 <kexec+0x58d>
/home/yogi/src/os/aproj/kshell/src/commands.c:197
        {
            int retVal;

            //CLR 02/05/2019: Redirect standard input/output/err from/to a file (i.e. < and >)
            if (stdinfile!=NULL)
 31006ff:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100703:	74 3a                	je     310073f <kexec+0x48b>
/home/yogi/src/os/aproj/kshell/src/commands.c:198
                if (freopen(stdinfile, "r",(void*)STDIN_FILE)==(void*)-1)
 3100705:	83 ec 04             	sub    esp,0x4
 3100708:	6a 00                	push   0x0
 310070a:	8d 83 54 ec ff ff    	lea    eax,[ebx-0x13ac]
 3100710:	50                   	push   eax
 3100711:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100714:	e8 67 1d 00 00       	call   3102480 <freopen@plt>
 3100719:	83 c4 10             	add    esp,0x10
 310071c:	83 f8 ff             	cmp    eax,0xffffffff
 310071f:	75 1e                	jne    310073f <kexec+0x48b>
/home/yogi/src/os/aproj/kshell/src/commands.c:200
                {
                    printf("Redirect of input failed, cannot continue\n");
 3100721:	83 ec 0c             	sub    esp,0xc
 3100724:	8d 83 58 ec ff ff    	lea    eax,[ebx-0x13a8]
 310072a:	50                   	push   eax
 310072b:	e8 60 1b 00 00       	call   3102290 <printf@plt>
 3100730:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:201
                    retVal=-3;
 3100733:	c7 45 c4 fd ff ff ff 	mov    DWORD PTR [ebp-0x3c],0xfffffffd
/home/yogi/src/os/aproj/kshell/src/commands.c:202
                    goto kexecReturn;
 310073a:	e9 a6 01 00 00       	jmp    31008e5 <kexec+0x631>
/home/yogi/src/os/aproj/kshell/src/commands.c:204
                }
            if (stdoutfile!=NULL)
 310073f:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100743:	74 5c                	je     31007a1 <kexec+0x4ed>
/home/yogi/src/os/aproj/kshell/src/commands.c:206
            {
                if (strcmp(stdoutfile,"1")==0)
 3100745:	83 ec 08             	sub    esp,0x8
 3100748:	8d 83 83 ec ff ff    	lea    eax,[ebx-0x137d]
 310074e:	50                   	push   eax
 310074f:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100752:	e8 d9 1c 00 00       	call   3102430 <strcmp@plt>
 3100757:	83 c4 10             	add    esp,0x10
 310075a:	85 c0                	test   eax,eax
 310075c:	74 73                	je     31007d1 <kexec+0x51d>
/home/yogi/src/os/aproj/kshell/src/commands.c:208
                {}//Don't do anything as 1 is STDOUT
                else if (strcmp(stdoutfile,"2")==0)
 310075e:	83 ec 08             	sub    esp,0x8
 3100761:	8d 83 85 ec ff ff    	lea    eax,[ebx-0x137b]
 3100767:	50                   	push   eax
 3100768:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310076b:	e8 c0 1c 00 00       	call   3102430 <strcmp@plt>
 3100770:	83 c4 10             	add    esp,0x10
 3100773:	85 c0                	test   eax,eax
 3100775:	75 11                	jne    3100788 <kexec+0x4d4>
/home/yogi/src/os/aproj/kshell/src/commands.c:209
                    setSTD(STDOUT_FILE, STDERR_FILE);
 3100777:	83 ec 08             	sub    esp,0x8
 310077a:	6a 02                	push   0x2
 310077c:	6a 01                	push   0x1
 310077e:	e8 2d 1d 00 00       	call   31024b0 <setSTD@plt>
 3100783:	83 c4 10             	add    esp,0x10
 3100786:	eb 49                	jmp    31007d1 <kexec+0x51d>
/home/yogi/src/os/aproj/kshell/src/commands.c:211
                else 
                    freopen(stdoutfile,"w",(void*)STDOUT_FILE);
 3100788:	83 ec 04             	sub    esp,0x4
 310078b:	6a 01                	push   0x1
 310078d:	8d 83 87 ec ff ff    	lea    eax,[ebx-0x1379]
 3100793:	50                   	push   eax
 3100794:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100797:	e8 e4 1c 00 00       	call   3102480 <freopen@plt>
 310079c:	83 c4 10             	add    esp,0x10
 310079f:	eb 30                	jmp    31007d1 <kexec+0x51d>
/home/yogi/src/os/aproj/kshell/src/commands.c:213
            }
            else if (yourSTDOUT!=0)
 31007a1:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 31007a5:	74 13                	je     31007ba <kexec+0x506>
/home/yogi/src/os/aproj/kshell/src/commands.c:214
                setSTD(STDOUT_FILE, yourSTDOUT);
 31007a7:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31007aa:	83 ec 08             	sub    esp,0x8
 31007ad:	50                   	push   eax
 31007ae:	6a 01                	push   0x1
 31007b0:	e8 fb 1c 00 00       	call   31024b0 <setSTD@plt>
 31007b5:	83 c4 10             	add    esp,0x10
 31007b8:	eb 17                	jmp    31007d1 <kexec+0x51d>
/home/yogi/src/os/aproj/kshell/src/commands.c:215
            else if (yourSTDIN!=0)
 31007ba:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 31007be:	74 11                	je     31007d1 <kexec+0x51d>
/home/yogi/src/os/aproj/kshell/src/commands.c:216
                setSTD(STDIN_FILE, yourSTDIN);
 31007c0:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31007c3:	83 ec 08             	sub    esp,0x8
 31007c6:	50                   	push   eax
 31007c7:	6a 00                	push   0x0
 31007c9:	e8 e2 1c 00 00       	call   31024b0 <setSTD@plt>
 31007ce:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:217
            if (stderrfile!=NULL)
 31007d1:	83 7d ac 00          	cmp    DWORD PTR [ebp-0x54],0x0
 31007d5:	74 17                	je     31007ee <kexec+0x53a>
/home/yogi/src/os/aproj/kshell/src/commands.c:218
                freopen(stderrfile,"w",(void*)STDERR_FILE);
 31007d7:	83 ec 04             	sub    esp,0x4
 31007da:	6a 02                	push   0x2
 31007dc:	8d 83 87 ec ff ff    	lea    eax,[ebx-0x1379]
 31007e2:	50                   	push   eax
 31007e3:	ff 75 ac             	push   DWORD PTR [ebp-0x54]
 31007e6:	e8 95 1c 00 00       	call   3102480 <freopen@plt>
 31007eb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:219
            int childPid = exec(fileToExec, argc, argv);
 31007ee:	8b 85 9c f9 ff ff    	mov    eax,DWORD PTR [ebp-0x664]
 31007f4:	83 ec 04             	sub    esp,0x4
 31007f7:	ff 75 a4             	push   DWORD PTR [ebp-0x5c]
 31007fa:	50                   	push   eax
 31007fb:	8d 85 a0 fe ff ff    	lea    eax,[ebp-0x160]
 3100801:	50                   	push   eax
 3100802:	e8 69 1b 00 00       	call   3102370 <exec@plt>
 3100807:	83 c4 10             	add    esp,0x10
 310080a:	89 45 a0             	mov    DWORD PTR [ebp-0x60],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:221

            if (childPid > 0)
 310080d:	83 7d a0 00          	cmp    DWORD PTR [ebp-0x60],0x0
 3100811:	7e 14                	jle    3100827 <kexec+0x573>
/home/yogi/src/os/aproj/kshell/src/commands.c:223
            {
                retVal = waitpid(childPid);
 3100813:	8b 45 a0             	mov    eax,DWORD PTR [ebp-0x60]
 3100816:	83 ec 0c             	sub    esp,0xc
 3100819:	50                   	push   eax
 310081a:	e8 51 1a 00 00       	call   3102270 <waitpid@plt>
 310081f:	83 c4 10             	add    esp,0x10
 3100822:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
 3100825:	eb 07                	jmp    310082e <kexec+0x57a>
/home/yogi/src/os/aproj/kshell/src/commands.c:226
            }
            else
                retVal = 0xBADBADBA;
 3100827:	c7 45 c4 ba ad db ba 	mov    DWORD PTR [ebp-0x3c],0xbadbadba
/home/yogi/src/os/aproj/kshell/src/commands.c:227
            exit(retVal);
 310082e:	83 ec 0c             	sub    esp,0xc
 3100831:	ff 75 c4             	push   DWORD PTR [ebp-0x3c]
 3100834:	e8 57 1c 00 00       	call   3102490 <exit@plt>
 3100839:	83 c4 10             	add    esp,0x10
 310083c:	e9 a4 00 00 00       	jmp    31008e5 <kexec+0x631>
/home/yogi/src/os/aproj/kshell/src/commands.c:229
        }
        else if (forkPid < 0)
 3100841:	83 7d c0 00          	cmp    DWORD PTR [ebp-0x40],0x0
 3100845:	79 1a                	jns    3100861 <kexec+0x5ad>
/home/yogi/src/os/aproj/kshell/src/commands.c:230
            print("Fork error %u", forkPid);
 3100847:	83 ec 08             	sub    esp,0x8
 310084a:	ff 75 c0             	push   DWORD PTR [ebp-0x40]
 310084d:	8d 83 89 ec ff ff    	lea    eax,[ebx-0x1377]
 3100853:	50                   	push   eax
 3100854:	e8 27 1a 00 00       	call   3102280 <print@plt>
 3100859:	83 c4 10             	add    esp,0x10
 310085c:	e9 84 00 00 00       	jmp    31008e5 <kexec+0x631>
/home/yogi/src/os/aproj/kshell/src/commands.c:233
        else
        {
            if (!background)
 3100861:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 3100865:	83 f0 01             	xor    eax,0x1
 3100868:	84 c0                	test   al,al
 310086a:	74 40                	je     31008ac <kexec+0x5f8>
/home/yogi/src/os/aproj/kshell/src/commands.c:235
            {
                lastExecExitCode = waitpid(forkPid);
 310086c:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
 310086f:	83 ec 0c             	sub    esp,0xc
 3100872:	50                   	push   eax
 3100873:	e8 f8 19 00 00       	call   3102270 <waitpid@plt>
 3100878:	83 c4 10             	add    esp,0x10
 310087b:	89 c2                	mov    edx,eax
 310087d:	8d 83 08 05 00 00    	lea    eax,[ebx+0x508]
 3100883:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/kshell/src/commands.c:236
                if (lastExecExitCode == 0xBADBADBA)
 3100885:	8d 83 08 05 00 00    	lea    eax,[ebx+0x508]
 310088b:	8b 00                	mov    eax,DWORD PTR [eax]
 310088d:	3d ba ad db ba       	cmp    eax,0xbadbadba
 3100892:	75 18                	jne    31008ac <kexec+0x5f8>
/home/yogi/src/os/aproj/kshell/src/commands.c:237
                    print("exec: Cannot execute %s\n",argv[0]);
 3100894:	8b 45 a4             	mov    eax,DWORD PTR [ebp-0x5c]
 3100897:	8b 00                	mov    eax,DWORD PTR [eax]
 3100899:	83 ec 08             	sub    esp,0x8
 310089c:	50                   	push   eax
 310089d:	8d 83 97 ec ff ff    	lea    eax,[ebx-0x1369]
 31008a3:	50                   	push   eax
 31008a4:	e8 d7 19 00 00       	call   3102280 <print@plt>
 31008a9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:240
            }
            char ret[10];
            itoa(lastExecExitCode,ret);
 31008ac:	8d 83 08 05 00 00    	lea    eax,[ebx+0x508]
 31008b2:	8b 00                	mov    eax,DWORD PTR [eax]
 31008b4:	89 c2                	mov    edx,eax
 31008b6:	83 ec 08             	sub    esp,0x8
 31008b9:	8d 85 8a f9 ff ff    	lea    eax,[ebp-0x676]
 31008bf:	50                   	push   eax
 31008c0:	52                   	push   edx
 31008c1:	e8 5a 1a 00 00       	call   3102320 <itoa@plt>
 31008c6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:241
            setenv("LASTEXIT",ret);    
 31008c9:	83 ec 08             	sub    esp,0x8
 31008cc:	8d 85 8a f9 ff ff    	lea    eax,[ebp-0x676]
 31008d2:	50                   	push   eax
 31008d3:	8d 83 9f eb ff ff    	lea    eax,[ebx-0x1461]
 31008d9:	50                   	push   eax
 31008da:	e8 f1 1a 00 00       	call   31023d0 <setenv@plt>
 31008df:	83 c4 10             	add    esp,0x10
 31008e2:	eb 01                	jmp    31008e5 <kexec+0x631>
/home/yogi/src/os/aproj/kshell/src/commands.c:244
        }
    }
kexecReturn:
 31008e4:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/commands.c:245
    free(argv);
 31008e5:	83 ec 0c             	sub    esp,0xc
 31008e8:	ff 75 a4             	push   DWORD PTR [ebp-0x5c]
 31008eb:	e8 20 1c 00 00       	call   3102510 <free@plt>
 31008f0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:246
    free(pgm);
 31008f3:	83 ec 0c             	sub    esp,0xc
 31008f6:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
 31008f9:	e8 12 1c 00 00       	call   3102510 <free@plt>
 31008fe:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:247
    if (stdinfile)
 3100901:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100905:	74 0e                	je     3100915 <kexec+0x661>
/home/yogi/src/os/aproj/kshell/src/commands.c:248
        free(stdinfile);
 3100907:	83 ec 0c             	sub    esp,0xc
 310090a:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310090d:	e8 fe 1b 00 00       	call   3102510 <free@plt>
 3100912:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:249
    if (stdoutfile)
 3100915:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100919:	74 0e                	je     3100929 <kexec+0x675>
/home/yogi/src/os/aproj/kshell/src/commands.c:250
        free(stdoutfile);
 310091b:	83 ec 0c             	sub    esp,0xc
 310091e:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100921:	e8 ea 1b 00 00       	call   3102510 <free@plt>
 3100926:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:251
    if (stderrfile)
 3100929:	83 7d ac 00          	cmp    DWORD PTR [ebp-0x54],0x0
 310092d:	74 0e                	je     310093d <kexec+0x689>
/home/yogi/src/os/aproj/kshell/src/commands.c:252
        free(stderrfile);
 310092f:	83 ec 0c             	sub    esp,0xc
 3100932:	ff 75 ac             	push   DWORD PTR [ebp-0x54]
 3100935:	e8 d6 1b 00 00       	call   3102510 <free@plt>
 310093a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:253
    if (temp)
 310093d:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100941:	74 0e                	je     3100951 <kexec+0x69d>
/home/yogi/src/os/aproj/kshell/src/commands.c:254
        free(temp);
 3100943:	83 ec 0c             	sub    esp,0xc
 3100946:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100949:	e8 c2 1b 00 00       	call   3102510 <free@plt>
 310094e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:255
    if (realCmdline)
 3100951:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 3100955:	74 0e                	je     3100965 <kexec+0x6b1>
/home/yogi/src/os/aproj/kshell/src/commands.c:256
        free(realCmdline);
 3100957:	83 ec 0c             	sub    esp,0xc
 310095a:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 310095d:	e8 ae 1b 00 00       	call   3102510 <free@plt>
 3100962:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:257
}
 3100965:	90                   	nop
 3100966:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100969:	c9                   	leave  
 310096a:	c3                   	ret    

0310096b <cmdChangeDirectory>:
cmdChangeDirectory():
/home/yogi/src/os/aproj/kshell/src/commands.c:260

void cmdChangeDirectory(char *cmdline)
{
 310096b:	f3 0f 1e fb          	endbr32 
 310096f:	55                   	push   ebp
 3100970:	89 e5                	mov    ebp,esp
 3100972:	53                   	push   ebx
 3100973:	83 ec 14             	sub    esp,0x14
 3100976:	e8 0f 16 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 310097b:	81 c3 ad 31 00 00    	add    ebx,0x31ad
/home/yogi/src/os/aproj/kshell/src/commands.c:262
    fstat_t fstat;
    char *lcmdline=malloc(1024);
 3100981:	83 ec 0c             	sub    esp,0xc
 3100984:	68 00 04 00 00       	push   0x400
 3100989:	e8 52 19 00 00       	call   31022e0 <malloc@plt>
 310098e:	83 c4 10             	add    esp,0x10
 3100991:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:263
    bool error=false;
 3100994:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:265
    
    strtrim(cmdline);
 3100998:	83 ec 0c             	sub    esp,0xc
 310099b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310099e:	e8 7d 1a 00 00       	call   3102420 <strtrim@plt>
 31009a3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:267
            
    if (*cmdline!='/')
 31009a6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31009a9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31009ac:	3c 2f                	cmp    al,0x2f
 31009ae:	74 15                	je     31009c5 <cmdChangeDirectory+0x5a>
/home/yogi/src/os/aproj/kshell/src/commands.c:268
        strcpy(lcmdline,"/");
 31009b0:	83 ec 08             	sub    esp,0x8
 31009b3:	8d 83 b0 ec ff ff    	lea    eax,[ebx-0x1350]
 31009b9:	50                   	push   eax
 31009ba:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31009bd:	e8 9e 18 00 00       	call   3102260 <strcpy@plt>
 31009c2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:269
    strcat(lcmdline,cmdline);
 31009c5:	83 ec 08             	sub    esp,0x8
 31009c8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31009cb:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31009ce:	e8 7d 19 00 00       	call   3102350 <strcat@plt>
 31009d3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:270
    if (strncmp(cmdline,"/",512)!=0)
 31009d6:	83 ec 04             	sub    esp,0x4
 31009d9:	68 00 02 00 00       	push   0x200
 31009de:	8d 83 b0 ec ff ff    	lea    eax,[ebx-0x1350]
 31009e4:	50                   	push   eax
 31009e5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31009e8:	e8 b3 19 00 00       	call   31023a0 <strncmp@plt>
 31009ed:	83 c4 10             	add    esp,0x10
 31009f0:	85 c0                	test   eax,eax
 31009f2:	74 2f                	je     3100a23 <cmdChangeDirectory+0xb8>
/home/yogi/src/os/aproj/kshell/src/commands.c:271
        if (stat(cmdline,&fstat)) 
 31009f4:	83 ec 08             	sub    esp,0x8
 31009f7:	8d 45 e8             	lea    eax,[ebp-0x18]
 31009fa:	50                   	push   eax
 31009fb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31009fe:	e8 6d 1a 00 00       	call   3102470 <stat@plt>
 3100a03:	83 c4 10             	add    esp,0x10
 3100a06:	85 c0                	test   eax,eax
 3100a08:	74 19                	je     3100a23 <cmdChangeDirectory+0xb8>
/home/yogi/src/os/aproj/kshell/src/commands.c:273
        {
            printf("Invalid directory '%s'\n",lcmdline);
 3100a0a:	83 ec 08             	sub    esp,0x8
 3100a0d:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100a10:	8d 83 b2 ec ff ff    	lea    eax,[ebx-0x134e]
 3100a16:	50                   	push   eax
 3100a17:	e8 74 18 00 00       	call   3102290 <printf@plt>
 3100a1c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:274
            error=true;
 3100a1f:	c6 45 f7 01          	mov    BYTE PTR [ebp-0x9],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:276
        }
    if (!error)
 3100a23:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 3100a27:	83 f0 01             	xor    eax,0x1
 3100a2a:	84 c0                	test   al,al
 3100a2c:	74 25                	je     3100a53 <cmdChangeDirectory+0xe8>
/home/yogi/src/os/aproj/kshell/src/commands.c:278
    {
        setcwd(lcmdline, sizeof(lcmdline));
 3100a2e:	83 ec 08             	sub    esp,0x8
 3100a31:	6a 04                	push   0x4
 3100a33:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100a36:	e8 c5 19 00 00       	call   3102400 <setcwd@plt>
 3100a3b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:279
        setenv("CWD",lcmdline);
 3100a3e:	83 ec 08             	sub    esp,0x8
 3100a41:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100a44:	8d 83 ca ec ff ff    	lea    eax,[ebx-0x1336]
 3100a4a:	50                   	push   eax
 3100a4b:	e8 80 19 00 00       	call   31023d0 <setenv@plt>
 3100a50:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:282
    }
    
    free(lcmdline);
 3100a53:	83 ec 0c             	sub    esp,0xc
 3100a56:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100a59:	e8 b2 1a 00 00       	call   3102510 <free@plt>
 3100a5e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:283
}
 3100a61:	90                   	nop
 3100a62:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100a65:	c9                   	leave  
 3100a66:	c3                   	ret    

03100a67 <cmdTime>:
cmdTime():
/home/yogi/src/os/aproj/kshell/src/commands.c:286

void cmdTime(char* cmdline)
{
 3100a67:	f3 0f 1e fb          	endbr32 
 3100a6b:	55                   	push   ebp
 3100a6c:	89 e5                	mov    ebp,esp
 3100a6e:	53                   	push   ebx
 3100a6f:	83 ec 14             	sub    esp,0x14
 3100a72:	e8 13 15 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3100a77:	81 c3 b1 30 00 00    	add    ebx,0x30b1
/home/yogi/src/os/aproj/kshell/src/commands.c:289
    uint32_t startTicks, endTicks;
    
    strtrim(cmdline);
 3100a7d:	83 ec 0c             	sub    esp,0xc
 3100a80:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100a83:	e8 98 19 00 00       	call   3102420 <strtrim@plt>
 3100a88:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:290
    if (strlen(cmdline)==0)
 3100a8b:	83 ec 0c             	sub    esp,0xc
 3100a8e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100a91:	e8 2a 1a 00 00       	call   31024c0 <strlen@plt>
 3100a96:	83 c4 10             	add    esp,0x10
 3100a99:	85 c0                	test   eax,eax
 3100a9b:	75 14                	jne    3100ab1 <cmdTime+0x4a>
/home/yogi/src/os/aproj/kshell/src/commands.c:292
    {
        printf("Error: The time command requires the name of an application to be executed, as input.\n");
 3100a9d:	83 ec 0c             	sub    esp,0xc
 3100aa0:	8d 83 d0 ec ff ff    	lea    eax,[ebx-0x1330]
 3100aa6:	50                   	push   eax
 3100aa7:	e8 e4 17 00 00       	call   3102290 <printf@plt>
 3100aac:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:293
        return;
 3100aaf:	eb 37                	jmp    3100ae8 <cmdTime+0x81>
/home/yogi/src/os/aproj/kshell/src/commands.c:295
    }
    startTicks=getticks();
 3100ab1:	e8 aa 18 00 00       	call   3102360 <getticks@plt>
 3100ab6:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:296
    execInternalCommand(cmdline);
 3100ab9:	83 ec 0c             	sub    esp,0xc
 3100abc:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100abf:	e8 8f 06 00 00       	call   3101153 <execInternalCommand>
 3100ac4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:297
    endTicks=getticks();
 3100ac7:	e8 94 18 00 00       	call   3102360 <getticks@plt>
 3100acc:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:298
    print("\n%u ticks\n",endTicks-startTicks);
 3100acf:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100ad2:	2b 45 f4             	sub    eax,DWORD PTR [ebp-0xc]
 3100ad5:	83 ec 08             	sub    esp,0x8
 3100ad8:	50                   	push   eax
 3100ad9:	8d 83 27 ed ff ff    	lea    eax,[ebx-0x12d9]
 3100adf:	50                   	push   eax
 3100ae0:	e8 9b 17 00 00       	call   3102280 <print@plt>
 3100ae5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:300
    
}
 3100ae8:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100aeb:	c9                   	leave  
 3100aec:	c3                   	ret    

03100aed <cmdRepeat>:
cmdRepeat():
/home/yogi/src/os/aproj/kshell/src/commands.c:303

void cmdRepeat(char * cmdline)
{
 3100aed:	f3 0f 1e fb          	endbr32 
 3100af1:	55                   	push   ebp
 3100af2:	89 e5                	mov    ebp,esp
 3100af4:	53                   	push   ebx
 3100af5:	83 ec 24             	sub    esp,0x24
 3100af8:	e8 8d 14 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3100afd:	81 c3 2b 30 00 00    	add    ebx,0x302b
/home/yogi/src/os/aproj/kshell/src/commands.c:304
    int argc = 0;
 3100b03:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:306
    char **argv;
    int count = 0;
 3100b0a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:307
    char *newCmdLine=cmdline;
 3100b11:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100b14:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:308
    argv = cmdlineToArgv(cmdline, &argc);
 3100b17:	83 ec 08             	sub    esp,0x8
 3100b1a:	8d 45 e4             	lea    eax,[ebp-0x1c]
 3100b1d:	50                   	push   eax
 3100b1e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100b21:	e8 da 17 00 00       	call   3102300 <cmdlineToArgv@plt>
 3100b26:	83 c4 10             	add    esp,0x10
 3100b29:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:310
    
    count = atoi(argv[0]);
 3100b2c:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 3100b2f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100b31:	83 ec 0c             	sub    esp,0xc
 3100b34:	50                   	push   eax
 3100b35:	e8 66 19 00 00       	call   31024a0 <atoi@plt>
 3100b3a:	83 c4 10             	add    esp,0x10
 3100b3d:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:312

    if (count >= 100)
 3100b40:	83 7d ec 63          	cmp    DWORD PTR [ebp-0x14],0x63
 3100b44:	7e 06                	jle    3100b4c <cmdRepeat+0x5f>
/home/yogi/src/os/aproj/kshell/src/commands.c:313
        newCmdLine+=3;
 3100b46:	83 45 f4 03          	add    DWORD PTR [ebp-0xc],0x3
 3100b4a:	eb 10                	jmp    3100b5c <cmdRepeat+0x6f>
/home/yogi/src/os/aproj/kshell/src/commands.c:314
    else if (count >= 10)
 3100b4c:	83 7d ec 09          	cmp    DWORD PTR [ebp-0x14],0x9
 3100b50:	7e 06                	jle    3100b58 <cmdRepeat+0x6b>
/home/yogi/src/os/aproj/kshell/src/commands.c:315
        newCmdLine+=2;
 3100b52:	83 45 f4 02          	add    DWORD PTR [ebp-0xc],0x2
 3100b56:	eb 04                	jmp    3100b5c <cmdRepeat+0x6f>
/home/yogi/src/os/aproj/kshell/src/commands.c:317
    else 
        newCmdLine+=1;
 3100b58:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:319
    
    for (int cnt=0;cnt<count;cnt++)
 3100b5c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 3100b63:	eb 55                	jmp    3100bba <cmdRepeat+0xcd>
/home/yogi/src/os/aproj/kshell/src/commands.c:321
    {
        printf("\n*************** REPEAT EXECUTION #%u of %u ***************\n",cnt+1,count);
 3100b65:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100b68:	83 c0 01             	add    eax,0x1
 3100b6b:	83 ec 04             	sub    esp,0x4
 3100b6e:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100b71:	50                   	push   eax
 3100b72:	8d 83 34 ed ff ff    	lea    eax,[ebx-0x12cc]
 3100b78:	50                   	push   eax
 3100b79:	e8 12 17 00 00       	call   3102290 <printf@plt>
 3100b7e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:322
        execInternalCommand(newCmdLine);
 3100b81:	83 ec 0c             	sub    esp,0xc
 3100b84:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100b87:	e8 c7 05 00 00       	call   3101153 <execInternalCommand>
 3100b8c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:323
        if (bSigIntReceived)
 3100b8f:	8d 83 b8 01 00 00    	lea    eax,[ebx+0x1b8]
 3100b95:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100b98:	84 c0                	test   al,al
 3100b9a:	74 1a                	je     3100bb6 <cmdRepeat+0xc9>
/home/yogi/src/os/aproj/kshell/src/commands.c:325
        {
            if (processSignal(SIGINT)==SIGINT)
 3100b9c:	83 ec 0c             	sub    esp,0xc
 3100b9f:	6a 08                	push   0x8
 3100ba1:	e8 25 0d 00 00       	call   31018cb <processSignal>
 3100ba6:	83 c4 10             	add    esp,0x10
 3100ba9:	83 f8 08             	cmp    eax,0x8
 3100bac:	75 16                	jne    3100bc4 <cmdRepeat+0xd7>
/home/yogi/src/os/aproj/kshell/src/commands.c:326
                cnt=count;
 3100bae:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100bb1:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:327
            break;
 3100bb4:	eb 0e                	jmp    3100bc4 <cmdRepeat+0xd7>
/home/yogi/src/os/aproj/kshell/src/commands.c:319 (discriminator 2)
    for (int cnt=0;cnt<count;cnt++)
 3100bb6:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:319 (discriminator 1)
 3100bba:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100bbd:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
 3100bc0:	7c a3                	jl     3100b65 <cmdRepeat+0x78>
/home/yogi/src/os/aproj/kshell/src/commands.c:331
        }
    }
    
}
 3100bc2:	eb 01                	jmp    3100bc5 <cmdRepeat+0xd8>
/home/yogi/src/os/aproj/kshell/src/commands.c:327
            break;
 3100bc4:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/commands.c:331
}
 3100bc5:	90                   	nop
 3100bc6:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100bc9:	c9                   	leave  
 3100bca:	c3                   	ret    

03100bcb <cmdExecp>:
cmdExecp():
/home/yogi/src/os/aproj/kshell/src/commands.c:334

void cmdExecp(char* cmdline)
{
 3100bcb:	f3 0f 1e fb          	endbr32 
 3100bcf:	55                   	push   ebp
 3100bd0:	89 e5                	mov    ebp,esp
 3100bd2:	83 ec 08             	sub    esp,0x8
 3100bd5:	e8 ac 13 00 00       	call   3101f86 <__x86.get_pc_thunk.ax>
 3100bda:	05 4e 2f 00 00       	add    eax,0x2f4e
/home/yogi/src/os/aproj/kshell/src/commands.c:335
    kexec(cmdline, STDIN_FILE, STDOUT_FILE, STDERR_FILE);
 3100bdf:	6a 02                	push   0x2
 3100be1:	6a 01                	push   0x1
 3100be3:	6a 00                	push   0x0
 3100be5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100be8:	e8 c7 f6 ff ff       	call   31002b4 <kexec>
 3100bed:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:336
}
 3100bf0:	90                   	nop
 3100bf1:	c9                   	leave  
 3100bf2:	c3                   	ret    

03100bf3 <cmdExit>:
cmdExit():
/home/yogi/src/os/aproj/kshell/src/commands.c:339

void cmdExit(char *cmdline)
{
 3100bf3:	f3 0f 1e fb          	endbr32 
 3100bf7:	55                   	push   ebp
 3100bf8:	89 e5                	mov    ebp,esp
 3100bfa:	53                   	push   ebx
 3100bfb:	81 ec 04 05 00 00    	sub    esp,0x504
 3100c01:	e8 84 13 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3100c06:	81 c3 22 2f 00 00    	add    ebx,0x2f22
/home/yogi/src/os/aproj/kshell/src/commands.c:342
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 3100c0c:	83 ec 04             	sub    esp,0x4
 3100c0f:	68 00 05 00 00       	push   0x500
 3100c14:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 3100c1a:	50                   	push   eax
 3100c1b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100c1e:	e8 15 06 00 00       	call   3101238 <parseParamsShell>
 3100c23:	83 c4 10             	add    esp,0x10
 3100c26:	85 c0                	test   eax,eax
 3100c28:	74 20                	je     3100c4a <cmdExit+0x57>
/home/yogi/src/os/aproj/kshell/src/commands.c:344
    {
        exitCode = strtoul(params[0],0,10);
 3100c2a:	83 ec 04             	sub    esp,0x4
 3100c2d:	6a 0a                	push   0xa
 3100c2f:	6a 00                	push   0x0
 3100c31:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 3100c37:	50                   	push   eax
 3100c38:	e8 d3 16 00 00       	call   3102310 <strtoul@plt>
 3100c3d:	83 c4 10             	add    esp,0x10
 3100c40:	8d 93 0c 05 00 00    	lea    edx,[ebx+0x50c]
 3100c46:	89 02                	mov    DWORD PTR [edx],eax
 3100c48:	eb 0c                	jmp    3100c56 <cmdExit+0x63>
/home/yogi/src/os/aproj/kshell/src/commands.c:347
    }
    else
        exitCode = 0;
 3100c4a:	8d 83 0c 05 00 00    	lea    eax,[ebx+0x50c]
 3100c50:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/commands.c:348
    timeToExit=true;
 3100c56:	8d 83 14 05 00 00    	lea    eax,[ebx+0x514]
 3100c5c:	c6 00 01             	mov    BYTE PTR [eax],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:349
}
 3100c5f:	90                   	nop
 3100c60:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100c63:	c9                   	leave  
 3100c64:	c3                   	ret    

03100c65 <cmdHelp>:
cmdHelp():
/home/yogi/src/os/aproj/kshell/src/commands.c:352

void cmdHelp(char *cmdline)
{
 3100c65:	f3 0f 1e fb          	endbr32 
 3100c69:	55                   	push   ebp
 3100c6a:	89 e5                	mov    ebp,esp
 3100c6c:	53                   	push   ebx
 3100c6d:	83 ec 14             	sub    esp,0x14
 3100c70:	e8 15 13 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3100c75:	81 c3 b3 2e 00 00    	add    ebx,0x2eb3
/home/yogi/src/os/aproj/kshell/src/commands.c:355
    char* tok;
    
    tok=strtok(cmdline,delim);
 3100c7b:	83 ec 08             	sub    esp,0x8
 3100c7e:	8d 83 bc 01 00 00    	lea    eax,[ebx+0x1bc]
 3100c84:	50                   	push   eax
 3100c85:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100c88:	e8 53 17 00 00       	call   31023e0 <strtok@plt>
 3100c8d:	83 c4 10             	add    esp,0x10
 3100c90:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:362
    {
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
 3100c93:	83 ec 08             	sub    esp,0x8
 3100c96:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100c99:	8d 83 71 ed ff ff    	lea    eax,[ebx-0x128f]
 3100c9f:	50                   	push   eax
 3100ca0:	e8 db 15 00 00       	call   3102280 <print@plt>
 3100ca5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:363
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100ca8:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100caf:	e9 99 00 00 00       	jmp    3100d4d <cmdHelp+0xe8>
/home/yogi/src/os/aproj/kshell/src/commands.c:364
        if (tok!=NULL)
 3100cb4:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100cb8:	74 5b                	je     3100d15 <cmdHelp+0xb0>
/home/yogi/src/os/aproj/kshell/src/commands.c:366
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
 3100cba:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100cbd:	8d 83 78 fe ff ff    	lea    eax,[ebx-0x188]
 3100cc3:	c1 e2 04             	shl    edx,0x4
 3100cc6:	01 d0                	add    eax,edx
 3100cc8:	8b 00                	mov    eax,DWORD PTR [eax]
 3100cca:	83 ec 04             	sub    esp,0x4
 3100ccd:	6a 64                	push   0x64
 3100ccf:	50                   	push   eax
 3100cd0:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100cd3:	e8 c8 16 00 00       	call   31023a0 <strncmp@plt>
 3100cd8:	83 c4 10             	add    esp,0x10
 3100cdb:	85 c0                	test   eax,eax
 3100cdd:	75 6a                	jne    3100d49 <cmdHelp+0xe4>
/home/yogi/src/os/aproj/kshell/src/commands.c:367
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100cdf:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100ce2:	8d 83 7c fe ff ff    	lea    eax,[ebx-0x184]
 3100ce8:	c1 e2 04             	shl    edx,0x4
 3100ceb:	01 d0                	add    eax,edx
 3100ced:	8b 10                	mov    edx,DWORD PTR [eax]
 3100cef:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 3100cf2:	8d 83 78 fe ff ff    	lea    eax,[ebx-0x188]
 3100cf8:	c1 e1 04             	shl    ecx,0x4
 3100cfb:	01 c8                	add    eax,ecx
 3100cfd:	8b 00                	mov    eax,DWORD PTR [eax]
 3100cff:	83 ec 04             	sub    esp,0x4
 3100d02:	52                   	push   edx
 3100d03:	50                   	push   eax
 3100d04:	8d 83 7b ed ff ff    	lea    eax,[ebx-0x1285]
 3100d0a:	50                   	push   eax
 3100d0b:	e8 70 15 00 00       	call   3102280 <print@plt>
 3100d10:	83 c4 10             	add    esp,0x10
 3100d13:	eb 34                	jmp    3100d49 <cmdHelp+0xe4>
/home/yogi/src/os/aproj/kshell/src/commands.c:371
        }
        else
        {
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100d15:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100d18:	8d 83 7c fe ff ff    	lea    eax,[ebx-0x184]
 3100d1e:	c1 e2 04             	shl    edx,0x4
 3100d21:	01 d0                	add    eax,edx
 3100d23:	8b 10                	mov    edx,DWORD PTR [eax]
 3100d25:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 3100d28:	8d 83 78 fe ff ff    	lea    eax,[ebx-0x188]
 3100d2e:	c1 e1 04             	shl    ecx,0x4
 3100d31:	01 c8                	add    eax,ecx
 3100d33:	8b 00                	mov    eax,DWORD PTR [eax]
 3100d35:	83 ec 04             	sub    esp,0x4
 3100d38:	52                   	push   edx
 3100d39:	50                   	push   eax
 3100d3a:	8d 83 7b ed ff ff    	lea    eax,[ebx-0x1285]
 3100d40:	50                   	push   eax
 3100d41:	e8 3a 15 00 00       	call   3102280 <print@plt>
 3100d46:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:363 (discriminator 2)
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100d49:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:363 (discriminator 1)
 3100d4d:	83 7d f4 0c          	cmp    DWORD PTR [ebp-0xc],0xc
 3100d51:	0f 86 5d ff ff ff    	jbe    3100cb4 <cmdHelp+0x4f>
/home/yogi/src/os/aproj/kshell/src/commands.c:374
        }
    
}
 3100d57:	90                   	nop
 3100d58:	90                   	nop
 3100d59:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100d5c:	c9                   	leave  
 3100d5d:	c3                   	ret    

03100d5e <cmdPwd>:
cmdPwd():
/home/yogi/src/os/aproj/kshell/src/commands.c:377

void cmdPwd()
{
 3100d5e:	f3 0f 1e fb          	endbr32 
 3100d62:	55                   	push   ebp
 3100d63:	89 e5                	mov    ebp,esp
 3100d65:	53                   	push   ebx
 3100d66:	83 ec 14             	sub    esp,0x14
 3100d69:	e8 1c 12 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3100d6e:	81 c3 ba 2d 00 00    	add    ebx,0x2dba
/home/yogi/src/os/aproj/kshell/src/commands.c:378
    char* buf=malloc(512);
 3100d74:	83 ec 0c             	sub    esp,0xc
 3100d77:	68 00 02 00 00       	push   0x200
 3100d7c:	e8 5f 15 00 00       	call   31022e0 <malloc@plt>
 3100d81:	83 c4 10             	add    esp,0x10
 3100d84:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:379
    print("%s\n",getcwd(buf,512));
 3100d87:	83 ec 08             	sub    esp,0x8
 3100d8a:	68 00 02 00 00       	push   0x200
 3100d8f:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100d92:	e8 a9 16 00 00       	call   3102440 <getcwd@plt>
 3100d97:	83 c4 10             	add    esp,0x10
 3100d9a:	83 ec 08             	sub    esp,0x8
 3100d9d:	50                   	push   eax
 3100d9e:	8d 83 7e eb ff ff    	lea    eax,[ebx-0x1482]
 3100da4:	50                   	push   eax
 3100da5:	e8 d6 14 00 00       	call   3102280 <print@plt>
 3100daa:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:380
    free(buf);
 3100dad:	83 ec 0c             	sub    esp,0xc
 3100db0:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100db3:	e8 58 17 00 00       	call   3102510 <free@plt>
 3100db8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:381
}
 3100dbb:	90                   	nop
 3100dbc:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100dbf:	c9                   	leave  
 3100dc0:	c3                   	ret    

03100dc1 <cmdSleep>:
cmdSleep():
/home/yogi/src/os/aproj/kshell/src/commands.c:384

void cmdSleep(char *cmdline)
{
 3100dc1:	f3 0f 1e fb          	endbr32 
 3100dc5:	55                   	push   ebp
 3100dc6:	89 e5                	mov    ebp,esp
 3100dc8:	56                   	push   esi
 3100dc9:	53                   	push   ebx
 3100dca:	81 ec 20 05 00 00    	sub    esp,0x520
 3100dd0:	e8 b5 11 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3100dd5:	81 c3 53 2d 00 00    	add    ebx,0x2d53
 3100ddb:	89 e0                	mov    eax,esp
 3100ddd:	89 c6                	mov    esi,eax
/home/yogi/src/os/aproj/kshell/src/commands.c:386
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 3100ddf:	83 ec 04             	sub    esp,0x4
 3100de2:	68 00 05 00 00       	push   0x500
 3100de7:	8d 85 e0 fa ff ff    	lea    eax,[ebp-0x520]
 3100ded:	50                   	push   eax
 3100dee:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100df1:	e8 42 04 00 00       	call   3101238 <parseParamsShell>
 3100df6:	83 c4 10             	add    esp,0x10
 3100df9:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:389

    //TODO: Remove this later ... leaving it here for a while to test mmap'd stack
    int size = 100000/4; //147400;
 3100dfc:	c7 45 e8 a8 61 00 00 	mov    DWORD PTR [ebp-0x18],0x61a8
/home/yogi/src/os/aproj/kshell/src/commands.c:390
    int test[size];
 3100e03:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 3100e06:	8d 50 ff             	lea    edx,[eax-0x1]
 3100e09:	89 55 e4             	mov    DWORD PTR [ebp-0x1c],edx
 3100e0c:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100e13:	b8 10 00 00 00       	mov    eax,0x10
 3100e18:	83 e8 01             	sub    eax,0x1
 3100e1b:	01 d0                	add    eax,edx
 3100e1d:	b9 10 00 00 00       	mov    ecx,0x10
 3100e22:	ba 00 00 00 00       	mov    edx,0x0
 3100e27:	f7 f1                	div    ecx
 3100e29:	6b c0 10             	imul   eax,eax,0x10
 3100e2c:	89 c2                	mov    edx,eax
 3100e2e:	81 e2 00 f0 ff ff    	and    edx,0xfffff000
 3100e34:	89 e1                	mov    ecx,esp
 3100e36:	29 d1                	sub    ecx,edx
 3100e38:	89 ca                	mov    edx,ecx
 3100e3a:	39 d4                	cmp    esp,edx
 3100e3c:	74 10                	je     3100e4e <cmdSleep+0x8d>
 3100e3e:	81 ec 00 10 00 00    	sub    esp,0x1000
 3100e44:	83 8c 24 fc 0f 00 00 	or     DWORD PTR [esp+0xffc],0x0
 3100e4b:	00 
 3100e4c:	eb ec                	jmp    3100e3a <cmdSleep+0x79>
 3100e4e:	89 c2                	mov    edx,eax
 3100e50:	81 e2 ff 0f 00 00    	and    edx,0xfff
 3100e56:	29 d4                	sub    esp,edx
 3100e58:	89 c2                	mov    edx,eax
 3100e5a:	81 e2 ff 0f 00 00    	and    edx,0xfff
 3100e60:	85 d2                	test   edx,edx
 3100e62:	74 0d                	je     3100e71 <cmdSleep+0xb0>
 3100e64:	25 ff 0f 00 00       	and    eax,0xfff
 3100e69:	83 e8 04             	sub    eax,0x4
 3100e6c:	01 e0                	add    eax,esp
 3100e6e:	83 08 00             	or     DWORD PTR [eax],0x0
 3100e71:	89 e0                	mov    eax,esp
 3100e73:	83 c0 03             	add    eax,0x3
 3100e76:	c1 e8 02             	shr    eax,0x2
 3100e79:	c1 e0 02             	shl    eax,0x2
 3100e7c:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:392
    
    for (int cnt=0;cnt<size;cnt++)
 3100e7f:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
 3100e86:	eb 10                	jmp    3100e98 <cmdSleep+0xd7>
/home/yogi/src/os/aproj/kshell/src/commands.c:393 (discriminator 3)
        test[cnt]=cnt;
 3100e88:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100e8b:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 3100e8e:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
 3100e91:	89 0c 90             	mov    DWORD PTR [eax+edx*4],ecx
/home/yogi/src/os/aproj/kshell/src/commands.c:392 (discriminator 3)
    for (int cnt=0;cnt<size;cnt++)
 3100e94:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:392 (discriminator 1)
 3100e98:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100e9b:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 3100e9e:	7c e8                	jl     3100e88 <cmdSleep+0xc7>
/home/yogi/src/os/aproj/kshell/src/commands.c:395
    
    for (int cnt=0;cnt<size;cnt++)
 3100ea0:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100ea7:	eb 24                	jmp    3100ecd <cmdSleep+0x10c>
/home/yogi/src/os/aproj/kshell/src/commands.c:396
        if (test[cnt]!=cnt)
 3100ea9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100eac:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3100eaf:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
 3100eb2:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
 3100eb5:	74 12                	je     3100ec9 <cmdSleep+0x108>
/home/yogi/src/os/aproj/kshell/src/commands.c:397
            printf("uh oh!");
 3100eb7:	83 ec 0c             	sub    esp,0xc
 3100eba:	8d 83 84 ed ff ff    	lea    eax,[ebx-0x127c]
 3100ec0:	50                   	push   eax
 3100ec1:	e8 ca 13 00 00       	call   3102290 <printf@plt>
 3100ec6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:395 (discriminator 2)
    for (int cnt=0;cnt<size;cnt++)
 3100ec9:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/commands.c:395 (discriminator 1)
 3100ecd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100ed0:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
 3100ed3:	7c d4                	jl     3100ea9 <cmdSleep+0xe8>
/home/yogi/src/os/aproj/kshell/src/commands.c:399
    
    if (params[0][0]==0)
 3100ed5:	0f b6 85 e0 fa ff ff 	movzx  eax,BYTE PTR [ebp-0x520]
 3100edc:	84 c0                	test   al,al
 3100ede:	75 16                	jne    3100ef6 <cmdSleep+0x135>
/home/yogi/src/os/aproj/kshell/src/commands.c:401
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 3100ee0:	83 ec 0c             	sub    esp,0xc
 3100ee3:	8d 83 8c ed ff ff    	lea    eax,[ebx-0x1274]
 3100ee9:	50                   	push   eax
 3100eea:	e8 91 13 00 00       	call   3102280 <print@plt>
 3100eef:	83 c4 10             	add    esp,0x10
 3100ef2:	89 f4                	mov    esp,esi
 3100ef4:	eb 24                	jmp    3100f1a <cmdSleep+0x159>
/home/yogi/src/os/aproj/kshell/src/commands.c:405
        return;
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 3100ef6:	83 ec 04             	sub    esp,0x4
 3100ef9:	6a 0a                	push   0xa
 3100efb:	6a 00                	push   0x0
 3100efd:	8d 85 e0 fa ff ff    	lea    eax,[ebp-0x520]
 3100f03:	50                   	push   eax
 3100f04:	e8 07 14 00 00       	call   3102310 <strtoul@plt>
 3100f09:	83 c4 10             	add    esp,0x10
 3100f0c:	83 ec 0c             	sub    esp,0xc
 3100f0f:	50                   	push   eax
 3100f10:	e8 db 13 00 00       	call   31022f0 <sleep@plt>
 3100f15:	83 c4 10             	add    esp,0x10
 3100f18:	89 f4                	mov    esp,esi
/home/yogi/src/os/aproj/kshell/src/commands.c:406
}
 3100f1a:	8d 65 f8             	lea    esp,[ebp-0x8]
 3100f1d:	5b                   	pop    ebx
 3100f1e:	5e                   	pop    esi
 3100f1f:	5d                   	pop    ebp
 3100f20:	c3                   	ret    

03100f21 <cmdTakeADump>:
cmdTakeADump():
/home/yogi/src/os/aproj/kshell/src/commands.c:409

void cmdTakeADump()
{
 3100f21:	f3 0f 1e fb          	endbr32 
 3100f25:	55                   	push   ebp
 3100f26:	89 e5                	mov    ebp,esp
 3100f28:	53                   	push   ebx
 3100f29:	83 ec 04             	sub    esp,0x4
 3100f2c:	e8 55 10 00 00       	call   3101f86 <__x86.get_pc_thunk.ax>
 3100f31:	05 f7 2b 00 00       	add    eax,0x2bf7
/home/yogi/src/os/aproj/kshell/src/commands.c:410
    takeADump();
 3100f36:	89 c3                	mov    ebx,eax
 3100f38:	e8 f3 13 00 00       	call   3102330 <takeADump@plt>
/home/yogi/src/os/aproj/kshell/src/commands.c:411
}
 3100f3d:	90                   	nop
 3100f3e:	83 c4 04             	add    esp,0x4
 3100f41:	5b                   	pop    ebx
 3100f42:	5d                   	pop    ebp
 3100f43:	c3                   	ret    

03100f44 <cmdRm>:
cmdRm():
/home/yogi/src/os/aproj/kshell/src/commands.c:414

void cmdRm(char *cmdline)
{
 3100f44:	f3 0f 1e fb          	endbr32 
 3100f48:	55                   	push   ebp
 3100f49:	89 e5                	mov    ebp,esp
 3100f4b:	53                   	push   ebx
 3100f4c:	83 ec 14             	sub    esp,0x14
 3100f4f:	e8 36 10 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3100f54:	81 c3 d4 2b 00 00    	add    ebx,0x2bd4
/home/yogi/src/os/aproj/kshell/src/commands.c:417
    char *temp;
    
    temp=malloc(1024);
 3100f5a:	83 ec 0c             	sub    esp,0xc
 3100f5d:	68 00 04 00 00       	push   0x400
 3100f62:	e8 79 13 00 00       	call   31022e0 <malloc@plt>
 3100f67:	83 c4 10             	add    esp,0x10
 3100f6a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/commands.c:419

    if (resolvePath(cmdline, temp,false)==0)
 3100f6d:	83 ec 04             	sub    esp,0x4
 3100f70:	6a 00                	push   0x0
 3100f72:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100f75:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100f78:	e8 43 13 00 00       	call   31022c0 <resolvePath@plt>
 3100f7d:	83 c4 10             	add    esp,0x10
 3100f80:	85 c0                	test   eax,eax
 3100f82:	75 10                	jne    3100f94 <cmdRm+0x50>
/home/yogi/src/os/aproj/kshell/src/commands.c:420
        unlink(temp);
 3100f84:	83 ec 0c             	sub    esp,0xc
 3100f87:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100f8a:	e8 31 14 00 00       	call   31023c0 <unlink@plt>
 3100f8f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:423
    else
        printf("rm: Invalid filename %s\n",cmdline);
 3100f92:	eb 15                	jmp    3100fa9 <cmdRm+0x65>
/home/yogi/src/os/aproj/kshell/src/commands.c:422
        printf("rm: Invalid filename %s\n",cmdline);
 3100f94:	83 ec 08             	sub    esp,0x8
 3100f97:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100f9a:	8d 83 ca ed ff ff    	lea    eax,[ebx-0x1236]
 3100fa0:	50                   	push   eax
 3100fa1:	e8 ea 12 00 00       	call   3102290 <printf@plt>
 3100fa6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/commands.c:423
 3100fa9:	90                   	nop
 3100faa:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100fad:	c9                   	leave  
 3100fae:	c3                   	ret    

03100faf <preprocessCmd>:
preprocessCmd():
/home/yogi/src/os/aproj/kshell/src/kshell.c:26
int findCommand(char* command);
char **buildargv (const char *input);
bool echoInput;

void preprocessCmd(char *command)
{
 3100faf:	f3 0f 1e fb          	endbr32 
 3100fb3:	55                   	push   ebp
 3100fb4:	89 e5                	mov    ebp,esp
 3100fb6:	e8 cb 0f 00 00       	call   3101f86 <__x86.get_pc_thunk.ax>
 3100fbb:	05 6d 2b 00 00       	add    eax,0x2b6d
/home/yogi/src/os/aproj/kshell/src/kshell.c:28
    
}
 3100fc0:	90                   	nop
 3100fc1:	5d                   	pop    ebp
 3100fc2:	c3                   	ret    

03100fc3 <execCmds>:
execCmds():
/home/yogi/src/os/aproj/kshell/src/kshell.c:31

void execCmds(char **cmds)
{
 3100fc3:	f3 0f 1e fb          	endbr32 
 3100fc7:	55                   	push   ebp
 3100fc8:	89 e5                	mov    ebp,esp
 3100fca:	83 ec 18             	sub    esp,0x18
 3100fcd:	e8 b4 0f 00 00       	call   3101f86 <__x86.get_pc_thunk.ax>
 3100fd2:	05 56 2b 00 00       	add    eax,0x2b56
/home/yogi/src/os/aproj/kshell/src/kshell.c:32
    char **lcmds = cmds;
 3100fd7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100fda:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:34
    
    while (*lcmds)
 3100fdd:	eb 15                	jmp    3100ff4 <execCmds+0x31>
/home/yogi/src/os/aproj/kshell/src/kshell.c:36
    {
        execInternalCommand(*lcmds);
 3100fdf:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100fe2:	8b 00                	mov    eax,DWORD PTR [eax]
 3100fe4:	83 ec 0c             	sub    esp,0xc
 3100fe7:	50                   	push   eax
 3100fe8:	e8 66 01 00 00       	call   3101153 <execInternalCommand>
 3100fed:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:37
        lcmds++;
 3100ff0:	83 45 f4 04          	add    DWORD PTR [ebp-0xc],0x4
/home/yogi/src/os/aproj/kshell/src/kshell.c:34
    while (*lcmds)
 3100ff4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100ff7:	8b 00                	mov    eax,DWORD PTR [eax]
 3100ff9:	85 c0                	test   eax,eax
 3100ffb:	75 e2                	jne    3100fdf <execCmds+0x1c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:39
    }
}
 3100ffd:	90                   	nop
 3100ffe:	90                   	nop
 3100fff:	c9                   	leave  
 3101000:	c3                   	ret    

03101001 <parseCmds>:
parseCmds():
/home/yogi/src/os/aproj/kshell/src/kshell.c:43

//Parse individual commandline (look for pipes)
char** parseCmds(char *command)
{
 3101001:	f3 0f 1e fb          	endbr32 
 3101005:	55                   	push   ebp
 3101006:	89 e5                	mov    ebp,esp
 3101008:	57                   	push   edi
 3101009:	56                   	push   esi
 310100a:	53                   	push   ebx
 310100b:	83 ec 2c             	sub    esp,0x2c
 310100e:	e8 77 0f 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3101013:	81 c3 15 2b 00 00    	add    ebx,0x2b15
/home/yogi/src/os/aproj/kshell/src/kshell.c:44
    char delims[3] = ";";
 3101019:	66 c7 45 d5 3b 00    	mov    WORD PTR [ebp-0x2b],0x3b
 310101f:	c6 45 d7 00          	mov    BYTE PTR [ebp-0x29],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:46
    char **cmds;
    char *ltemp=command; //malloc(1024);
 3101023:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3101026:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:47
    int lCommandPtr=0;
 3101029:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:49
    char *cmd;
    char cmdptr=0;
 3101030:	c6 45 e3 00          	mov    BYTE PTR [ebp-0x1d],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:50
    char *cmdbegin=command;
 3101034:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3101037:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:52

    memset(kCmdline,0,CMDLINE_BUFFER_SIZE);
 310103a:	8d 83 38 00 01 00    	lea    eax,[ebx+0x10038]
 3101040:	8b 00                	mov    eax,DWORD PTR [eax]
 3101042:	83 ec 04             	sub    esp,0x4
 3101045:	68 00 c8 00 00       	push   0xc800
 310104a:	6a 00                	push   0x0
 310104c:	50                   	push   eax
 310104d:	e8 be 13 00 00       	call   3102410 <memset@plt>
 3101052:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:54

    ltemp=command;
 3101055:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3101058:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:59
    
    //Find ; or | which both separate commands
    while (1==1)
    {
        if (*ltemp==';' || *ltemp=='|' || *ltemp==0)
 310105b:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 310105e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101061:	3c 3b                	cmp    al,0x3b
 3101063:	74 18                	je     310107d <parseCmds+0x7c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:59 (discriminator 1)
 3101065:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3101068:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310106b:	3c 7c                	cmp    al,0x7c
 310106d:	74 0e                	je     310107d <parseCmds+0x7c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:59 (discriminator 2)
 310106f:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3101072:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101075:	84 c0                	test   al,al
 3101077:	0f 85 bc 00 00 00    	jne    3101139 <parseCmds+0x138>
/home/yogi/src/os/aproj/kshell/src/kshell.c:61
        {
            kCmdline[cmdptr]=kCmdline+(PARSE_CMD_COUNT*4) + (cmdptr*CMDLINE_MAX_SIZE);
 310107d:	8d 83 38 00 01 00    	lea    eax,[ebx+0x10038]
 3101083:	8b 10                	mov    edx,DWORD PTR [eax]
 3101085:	0f be 45 e3          	movsx  eax,BYTE PTR [ebp-0x1d]
 3101089:	c1 e0 0b             	shl    eax,0xb
 310108c:	8d b0 40 06 00 00    	lea    esi,[eax+0x640]
 3101092:	8d 83 38 00 01 00    	lea    eax,[ebx+0x10038]
 3101098:	8b 00                	mov    eax,DWORD PTR [eax]
 310109a:	0f be 4d e3          	movsx  ecx,BYTE PTR [ebp-0x1d]
 310109e:	c1 e1 02             	shl    ecx,0x2
 31010a1:	01 c8                	add    eax,ecx
 31010a3:	01 f2                	add    edx,esi
 31010a5:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/kshell/src/kshell.c:63
            
            if (*ltemp=='|')
 31010a7:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 31010aa:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31010ad:	3c 7c                	cmp    al,0x7c
 31010af:	75 3d                	jne    31010ee <parseCmds+0xed>
/home/yogi/src/os/aproj/kshell/src/kshell.c:64
                strncpy(kCmdline[cmdptr++],cmdbegin,(uint32_t)ltemp-(uint32_t)cmdbegin+1);
 31010b1:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 31010b4:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31010b7:	29 c2                	sub    edx,eax
 31010b9:	89 d0                	mov    eax,edx
 31010bb:	8d 78 01             	lea    edi,[eax+0x1]
 31010be:	8d 83 38 00 01 00    	lea    eax,[ebx+0x10038]
 31010c4:	8b 08                	mov    ecx,DWORD PTR [eax]
 31010c6:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
 31010ca:	89 c6                	mov    esi,eax
 31010cc:	8d 56 01             	lea    edx,[esi+0x1]
 31010cf:	88 55 e3             	mov    BYTE PTR [ebp-0x1d],dl
 31010d2:	0f be c0             	movsx  eax,al
 31010d5:	c1 e0 02             	shl    eax,0x2
 31010d8:	01 c8                	add    eax,ecx
 31010da:	8b 00                	mov    eax,DWORD PTR [eax]
 31010dc:	83 ec 04             	sub    esp,0x4
 31010df:	57                   	push   edi
 31010e0:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 31010e3:	50                   	push   eax
 31010e4:	e8 c7 12 00 00       	call   31023b0 <strncpy@plt>
 31010e9:	83 c4 10             	add    esp,0x10
 31010ec:	eb 38                	jmp    3101126 <parseCmds+0x125>
/home/yogi/src/os/aproj/kshell/src/kshell.c:66
            else
                strncpy(kCmdline[cmdptr++],cmdbegin,(uint32_t)ltemp-(uint32_t)cmdbegin);
 31010ee:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 31010f1:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31010f4:	89 d7                	mov    edi,edx
 31010f6:	29 c7                	sub    edi,eax
 31010f8:	8d 83 38 00 01 00    	lea    eax,[ebx+0x10038]
 31010fe:	8b 08                	mov    ecx,DWORD PTR [eax]
 3101100:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
 3101104:	89 c6                	mov    esi,eax
 3101106:	8d 56 01             	lea    edx,[esi+0x1]
 3101109:	88 55 e3             	mov    BYTE PTR [ebp-0x1d],dl
 310110c:	0f be c0             	movsx  eax,al
 310110f:	c1 e0 02             	shl    eax,0x2
 3101112:	01 c8                	add    eax,ecx
 3101114:	8b 00                	mov    eax,DWORD PTR [eax]
 3101116:	83 ec 04             	sub    esp,0x4
 3101119:	57                   	push   edi
 310111a:	ff 75 dc             	push   DWORD PTR [ebp-0x24]
 310111d:	50                   	push   eax
 310111e:	e8 8d 12 00 00       	call   31023b0 <strncpy@plt>
 3101123:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:67
            if (*ltemp=='\0')
 3101126:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3101129:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310112c:	84 c0                	test   al,al
 310112e:	74 12                	je     3101142 <parseCmds+0x141>
/home/yogi/src/os/aproj/kshell/src/kshell.c:69
                break;
            cmdbegin=ltemp+1;
 3101130:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3101133:	83 c0 01             	add    eax,0x1
 3101136:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:71
        }
        ltemp++;
 3101139:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:59
        if (*ltemp==';' || *ltemp=='|' || *ltemp==0)
 310113d:	e9 19 ff ff ff       	jmp    310105b <parseCmds+0x5a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:68
                break;
 3101142:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:74
    }

    return kCmdline;
 3101143:	8d 83 38 00 01 00    	lea    eax,[ebx+0x10038]
 3101149:	8b 00                	mov    eax,DWORD PTR [eax]
/home/yogi/src/os/aproj/kshell/src/kshell.c:75
}
 310114b:	8d 65 f4             	lea    esp,[ebp-0xc]
 310114e:	5b                   	pop    ebx
 310114f:	5e                   	pop    esi
 3101150:	5f                   	pop    edi
 3101151:	5d                   	pop    ebp
 3101152:	c3                   	ret    

03101153 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:78

void execInternalCommand(char lCommand[256])
{
 3101153:	f3 0f 1e fb          	endbr32 
 3101157:	55                   	push   ebp
 3101158:	89 e5                	mov    ebp,esp
 310115a:	56                   	push   esi
 310115b:	53                   	push   ebx
 310115c:	83 ec 10             	sub    esp,0x10
 310115f:	e8 26 0e 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3101164:	81 c3 c4 29 00 00    	add    ebx,0x29c4
/home/yogi/src/os/aproj/kshell/src/kshell.c:79
    strtrim(lCommand);
 310116a:	83 ec 0c             	sub    esp,0xc
 310116d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3101170:	e8 ab 12 00 00       	call   3102420 <strtrim@plt>
 3101175:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:80
    int i = findCommand(lCommand);
 3101178:	83 ec 0c             	sub    esp,0xc
 310117b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310117e:	e8 72 02 00 00       	call   31013f5 <findCommand>
 3101183:	83 c4 10             	add    esp,0x10
 3101186:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:82

    if(i>0)
 3101189:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 310118d:	0f 8e 8f 00 00 00    	jle    3101222 <execInternalCommand+0xcf>
/home/yogi/src/os/aproj/kshell/src/kshell.c:84
    {
        i--;
 3101193:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:86
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 3101197:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 310119a:	8d 83 e0 00 00 00    	lea    eax,[ebx+0xe0]
 31011a0:	c1 e2 04             	shl    edx,0x4
 31011a3:	01 d0                	add    eax,edx
 31011a5:	8b 00                	mov    eax,DWORD PTR [eax]
 31011a7:	89 c2                	mov    edx,eax
 31011a9:	8d 83 00 05 00 00    	lea    eax,[ebx+0x500]
 31011af:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/kshell/src/kshell.c:87
        command_function_p = cmds[i].function;
 31011b1:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 31011b4:	8d 83 e0 00 00 00    	lea    eax,[ebx+0xe0]
 31011ba:	c1 e2 04             	shl    edx,0x4
 31011bd:	01 d0                	add    eax,edx
 31011bf:	8b 00                	mov    eax,DWORD PTR [eax]
 31011c1:	89 c2                	mov    edx,eax
 31011c3:	8d 83 f8 04 00 00    	lea    eax,[ebx+0x4f8]
 31011c9:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/kshell/src/kshell.c:88
        if (cmds[i].paramCount==0)
 31011cb:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 31011ce:	8d 83 e4 00 00 00    	lea    eax,[ebx+0xe4]
 31011d4:	c1 e2 04             	shl    edx,0x4
 31011d7:	01 d0                	add    eax,edx
 31011d9:	8b 00                	mov    eax,DWORD PTR [eax]
 31011db:	85 c0                	test   eax,eax
 31011dd:	75 0c                	jne    31011eb <execInternalCommand+0x98>
/home/yogi/src/os/aproj/kshell/src/kshell.c:89
            command_function();
 31011df:	8d 83 00 05 00 00    	lea    eax,[ebx+0x500]
 31011e5:	8b 00                	mov    eax,DWORD PTR [eax]
 31011e7:	ff d0                	call   eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:100
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}
 31011e9:	eb 45                	jmp    3101230 <execInternalCommand+0xdd>
/home/yogi/src/os/aproj/kshell/src/kshell.c:92
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
 31011eb:	8d 83 f8 04 00 00    	lea    eax,[ebx+0x4f8]
 31011f1:	8b 30                	mov    esi,DWORD PTR [eax]
 31011f3:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 31011f6:	8d 83 d8 00 00 00    	lea    eax,[ebx+0xd8]
 31011fc:	c1 e2 04             	shl    edx,0x4
 31011ff:	01 d0                	add    eax,edx
 3101201:	8b 00                	mov    eax,DWORD PTR [eax]
 3101203:	83 ec 0c             	sub    esp,0xc
 3101206:	50                   	push   eax
 3101207:	e8 b4 12 00 00       	call   31024c0 <strlen@plt>
 310120c:	83 c4 10             	add    esp,0x10
 310120f:	8d 50 01             	lea    edx,[eax+0x1]
 3101212:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3101215:	01 d0                	add    eax,edx
 3101217:	83 ec 0c             	sub    esp,0xc
 310121a:	50                   	push   eax
 310121b:	ff d6                	call   esi
 310121d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:100
}
 3101220:	eb 0e                	jmp    3101230 <execInternalCommand+0xdd>
/home/yogi/src/os/aproj/kshell/src/kshell.c:98
        cmdExecp(lCommand);
 3101222:	83 ec 0c             	sub    esp,0xc
 3101225:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3101228:	e8 9e f9 ff ff       	call   3100bcb <cmdExecp>
 310122d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:100
}
 3101230:	90                   	nop
 3101231:	8d 65 f8             	lea    esp,[ebp-0x8]
 3101234:	5b                   	pop    ebx
 3101235:	5e                   	pop    esi
 3101236:	5d                   	pop    ebp
 3101237:	c3                   	ret    

03101238 <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:103

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 3101238:	f3 0f 1e fb          	endbr32 
 310123c:	55                   	push   ebp
 310123d:	89 e5                	mov    ebp,esp
 310123f:	56                   	push   esi
 3101240:	53                   	push   ebx
 3101241:	83 ec 20             	sub    esp,0x20
 3101244:	e8 41 0d 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3101249:	81 c3 df 28 00 00    	add    ebx,0x28df
/home/yogi/src/os/aproj/kshell/src/kshell.c:104
    int x=0,y=0;
 310124f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3101256:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:105
    int lRetVal=0,parsedChars=0;
 310125d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3101264:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:106
    bool needDoubleQuotetoEndParam=0;
 310126b:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:108
    
    memset(params,0, size);
 310126f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3101272:	83 ec 04             	sub    esp,0x4
 3101275:	50                   	push   eax
 3101276:	6a 00                	push   0x0
 3101278:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 310127b:	e8 90 11 00 00       	call   3102410 <memset@plt>
 3101280:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:110
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3101283:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 310128a:	e9 26 01 00 00       	jmp    31013b5 <parseParamsShell+0x17d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:112
    {
        if(cmdLine[cnt]=='"')
 310128f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3101292:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3101295:	01 d0                	add    eax,edx
 3101297:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310129a:	3c 22                	cmp    al,0x22
 310129c:	75 41                	jne    31012df <parseParamsShell+0xa7>
/home/yogi/src/os/aproj/kshell/src/kshell.c:114
        {
            if (!needDoubleQuotetoEndParam)
 310129e:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 31012a2:	83 f0 01             	xor    eax,0x1
 31012a5:	84 c0                	test   al,al
 31012a7:	74 09                	je     31012b2 <parseParamsShell+0x7a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:116
            {
                needDoubleQuotetoEndParam=true;
 31012a9:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
 31012ad:	e9 fb 00 00 00       	jmp    31013ad <parseParamsShell+0x175>
/home/yogi/src/os/aproj/kshell/src/kshell.c:120
            }
            else
            {
                params[y][x]='\0';
 31012b2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31012b5:	c1 e0 07             	shl    eax,0x7
 31012b8:	89 c2                	mov    edx,eax
 31012ba:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31012bd:	01 c2                	add    edx,eax
 31012bf:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31012c2:	01 d0                	add    eax,edx
 31012c4:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:121
                {x=0;y++;lRetVal++;}
 31012c7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31012ce:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 31012d2:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:122
                needDoubleQuotetoEndParam=false;
 31012d6:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
 31012da:	e9 ce 00 00 00       	jmp    31013ad <parseParamsShell+0x175>
/home/yogi/src/os/aproj/kshell/src/kshell.c:125
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
 31012df:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31012e2:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31012e5:	01 d0                	add    eax,edx
 31012e7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31012ea:	3c 20                	cmp    al,0x20
 31012ec:	74 1e                	je     310130c <parseParamsShell+0xd4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:125 (discriminator 2)
 31012ee:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31012f1:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31012f4:	01 d0                	add    eax,edx
 31012f6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31012f9:	3c 2d                	cmp    al,0x2d
 31012fb:	74 0f                	je     310130c <parseParamsShell+0xd4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:125 (discriminator 4)
 31012fd:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3101300:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3101303:	01 d0                	add    eax,edx
 3101305:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101308:	3c 2c                	cmp    al,0x2c
 310130a:	75 7b                	jne    3101387 <parseParamsShell+0x14f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:125 (discriminator 5)
 310130c:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3101310:	83 f0 01             	xor    eax,0x1
 3101313:	84 c0                	test   al,al
 3101315:	74 70                	je     3101387 <parseParamsShell+0x14f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:128
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 3101317:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310131a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310131d:	01 d0                	add    eax,edx
 310131f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101322:	3c 2d                	cmp    al,0x2d
 3101324:	74 0f                	je     3101335 <parseParamsShell+0xfd>
/home/yogi/src/os/aproj/kshell/src/kshell.c:128 (discriminator 1)
 3101326:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3101329:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310132c:	01 d0                	add    eax,edx
 310132e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101331:	3c 2f                	cmp    al,0x2f
 3101333:	75 26                	jne    310135b <parseParamsShell+0x123>
/home/yogi/src/os/aproj/kshell/src/kshell.c:129
                params[y][x++]=cmdLine[cnt];
 3101335:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3101338:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310133b:	8d 34 02             	lea    esi,[edx+eax*1]
 310133e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3101341:	c1 e0 07             	shl    eax,0x7
 3101344:	89 c2                	mov    edx,eax
 3101346:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3101349:	8d 0c 02             	lea    ecx,[edx+eax*1]
 310134c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310134f:	8d 50 01             	lea    edx,[eax+0x1]
 3101352:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3101355:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 3101358:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:130
            params[y][x]='\0';
 310135b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310135e:	c1 e0 07             	shl    eax,0x7
 3101361:	89 c2                	mov    edx,eax
 3101363:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3101366:	01 c2                	add    edx,eax
 3101368:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310136b:	01 d0                	add    eax,edx
 310136d:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:131
            if (cnt>0)
 3101370:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 3101374:	74 37                	je     31013ad <parseParamsShell+0x175>
/home/yogi/src/os/aproj/kshell/src/kshell.c:132
                {x=0;y++;lRetVal++;}
 3101376:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310137d:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3101381:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:131
            if (cnt>0)
 3101385:	eb 26                	jmp    31013ad <parseParamsShell+0x175>
/home/yogi/src/os/aproj/kshell/src/kshell.c:137
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 3101387:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310138a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310138d:	8d 34 02             	lea    esi,[edx+eax*1]
 3101390:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3101393:	c1 e0 07             	shl    eax,0x7
 3101396:	89 c2                	mov    edx,eax
 3101398:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310139b:	8d 0c 02             	lea    ecx,[edx+eax*1]
 310139e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31013a1:	8d 50 01             	lea    edx,[eax+0x1]
 31013a4:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31013a7:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 31013aa:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:139 (discriminator 2)
        }
        parsedChars++;
 31013ad:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:110 (discriminator 2)
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31013b1:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:110 (discriminator 1)
 31013b5:	83 ec 0c             	sub    esp,0xc
 31013b8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31013bb:	e8 00 11 00 00       	call   31024c0 <strlen@plt>
 31013c0:	83 c4 10             	add    esp,0x10
 31013c3:	39 45 e0             	cmp    DWORD PTR [ebp-0x20],eax
 31013c6:	0f 82 c3 fe ff ff    	jb     310128f <parseParamsShell+0x57>
/home/yogi/src/os/aproj/kshell/src/kshell.c:141
    }
    if (parsedChars)
 31013cc:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31013d0:	74 19                	je     31013eb <parseParamsShell+0x1b3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:143
    {
        lRetVal++;
 31013d2:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:144
        params[y][x]='\0';
 31013d6:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31013d9:	c1 e0 07             	shl    eax,0x7
 31013dc:	89 c2                	mov    edx,eax
 31013de:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31013e1:	01 c2                	add    edx,eax
 31013e3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31013e6:	01 d0                	add    eax,edx
 31013e8:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:149
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 31013eb:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/aproj/kshell/src/kshell.c:150
}
 31013ee:	8d 65 f8             	lea    esp,[ebp-0x8]
 31013f1:	5b                   	pop    ebx
 31013f2:	5e                   	pop    esi
 31013f3:	5d                   	pop    ebp
 31013f4:	c3                   	ret    

031013f5 <findCommand>:
findCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:153

int findCommand(char* command)
{
 31013f5:	f3 0f 1e fb          	endbr32 
 31013f9:	55                   	push   ebp
 31013fa:	89 e5                	mov    ebp,esp
 31013fc:	53                   	push   ebx
 31013fd:	83 ec 14             	sub    esp,0x14
 3101400:	e8 85 0b 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3101405:	81 c3 23 27 00 00    	add    ebx,0x2723
/home/yogi/src/os/aproj/kshell/src/kshell.c:157
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 310140b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3101412:	eb 51                	jmp    3101465 <findCommand+0x70>
/home/yogi/src/os/aproj/kshell/src/kshell.c:159
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 3101414:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
 3101417:	8d 83 d8 00 00 00    	lea    eax,[ebx+0xd8]
 310141d:	c1 e2 04             	shl    edx,0x4
 3101420:	01 d0                	add    eax,edx
 3101422:	8b 00                	mov    eax,DWORD PTR [eax]
 3101424:	83 ec 0c             	sub    esp,0xc
 3101427:	50                   	push   eax
 3101428:	e8 93 10 00 00       	call   31024c0 <strlen@plt>
 310142d:	83 c4 10             	add    esp,0x10
 3101430:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 3101433:	8d 93 d8 00 00 00    	lea    edx,[ebx+0xd8]
 3101439:	c1 e1 04             	shl    ecx,0x4
 310143c:	01 ca                	add    edx,ecx
 310143e:	8b 12                	mov    edx,DWORD PTR [edx]
 3101440:	83 ec 04             	sub    esp,0x4
 3101443:	50                   	push   eax
 3101444:	52                   	push   edx
 3101445:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3101448:	e8 53 0f 00 00       	call   31023a0 <strncmp@plt>
 310144d:	83 c4 10             	add    esp,0x10
 3101450:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:161
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 3101453:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3101457:	75 08                	jne    3101461 <findCommand+0x6c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:164
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 3101459:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310145c:	83 c0 01             	add    eax,0x1
 310145f:	eb 0f                	jmp    3101470 <findCommand+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 2)
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3101461:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:157 (discriminator 1)
 3101465:	83 7d f4 0c          	cmp    DWORD PTR [ebp-0xc],0xc
 3101469:	76 a9                	jbe    3101414 <findCommand+0x1f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:168
        }
    }
    //print("findCommand returning -1");
            return -1;
 310146b:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:169
}
 3101470:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3101473:	c9                   	leave  
 3101474:	c3                   	ret    

03101475 <buildargv>:
buildargv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:173

/*parts from http://*/
char **buildargv (const char *input)
{
 3101475:	f3 0f 1e fb          	endbr32 
 3101479:	55                   	push   ebp
 310147a:	89 e5                	mov    ebp,esp
 310147c:	53                   	push   ebx
 310147d:	83 ec 34             	sub    esp,0x34
 3101480:	e8 05 0b 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3101485:	81 c3 a3 26 00 00    	add    ebx,0x26a3
/home/yogi/src/os/aproj/kshell/src/kshell.c:176
  char *arg;
  char *copybuf;
  int squote = 0;
 310148b:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:177
  int dquote = 0;
 3101492:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:178
  int bsquote = 0;
 3101499:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:179
  int argc = 0;
 31014a0:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:180
  int maxargc = 0;
 31014a7:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:181
  char **argv = NULL;
 31014ae:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:185
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 31014b5:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 31014b9:	0f 84 33 02 00 00    	je     31016f2 <buildargv+0x27d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:188
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 31014bf:	83 ec 0c             	sub    esp,0xc
 31014c2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31014c5:	e8 f6 0f 00 00       	call   31024c0 <strlen@plt>
 31014ca:	83 c4 10             	add    esp,0x10
 31014cd:	83 c0 01             	add    eax,0x1
 31014d0:	83 ec 0c             	sub    esp,0xc
 31014d3:	50                   	push   eax
 31014d4:	e8 07 0e 00 00       	call   31022e0 <malloc@plt>
 31014d9:	83 c4 10             	add    esp,0x10
 31014dc:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:196
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 31014df:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 31014e3:	74 0b                	je     31014f0 <buildargv+0x7b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:196 (discriminator 1)
 31014e5:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31014e8:	83 e8 01             	sub    eax,0x1
 31014eb:	39 45 e0             	cmp    DWORD PTR [ebp-0x20],eax
 31014ee:	7c 3d                	jl     310152d <buildargv+0xb8>
/home/yogi/src/os/aproj/kshell/src/kshell.c:199
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 31014f0:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 31014f4:	75 1c                	jne    3101512 <buildargv+0x9d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:201
		{
		  maxargc = INITIAL_MAXARGC;
 31014f6:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/aproj/kshell/src/kshell.c:202
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 31014fd:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3101500:	c1 e0 02             	shl    eax,0x2
 3101503:	83 ec 0c             	sub    esp,0xc
 3101506:	50                   	push   eax
 3101507:	e8 d4 0d 00 00       	call   31022e0 <malloc@plt>
 310150c:	83 c4 10             	add    esp,0x10
 310150f:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:204
		}
	      argv = nargv;
 3101512:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 3101515:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:205
	      argv[argc] = NULL;
 3101518:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310151b:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3101522:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3101525:	01 d0                	add    eax,edx
 3101527:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:208
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 310152d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3101530:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:209
	  while (*input != EOS)
 3101533:	e9 ec 00 00 00       	jmp    3101624 <buildargv+0x1af>
/home/yogi/src/os/aproj/kshell/src/kshell.c:211
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3101538:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310153b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310153e:	3c 20                	cmp    al,0x20
 3101540:	75 16                	jne    3101558 <buildargv+0xe3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:211 (discriminator 1)
 3101542:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3101546:	75 10                	jne    3101558 <buildargv+0xe3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:211 (discriminator 2)
 3101548:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 310154c:	75 0a                	jne    3101558 <buildargv+0xe3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:211 (discriminator 3)
 310154e:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3101552:	0f 84 da 00 00 00    	je     3101632 <buildargv+0x1bd>
/home/yogi/src/os/aproj/kshell/src/kshell.c:217
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3101558:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310155c:	74 1d                	je     310157b <buildargv+0x106>
/home/yogi/src/os/aproj/kshell/src/kshell.c:219
		    {
		      bsquote = 0;
 310155e:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:220
		      *arg++ = *input;
 3101565:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101568:	8d 50 01             	lea    edx,[eax+0x1]
 310156b:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310156e:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3101571:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3101574:	88 10                	mov    BYTE PTR [eax],dl
 3101576:	e9 a5 00 00 00       	jmp    3101620 <buildargv+0x1ab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:222
		    }
		  else if (*input == '\\')
 310157b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310157e:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101581:	3c 5c                	cmp    al,0x5c
 3101583:	75 0c                	jne    3101591 <buildargv+0x11c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:224
		    {
		      bsquote = 1;
 3101585:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 310158c:	e9 8f 00 00 00       	jmp    3101620 <buildargv+0x1ab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:226
		    }
		  else if (squote)
 3101591:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3101595:	74 26                	je     31015bd <buildargv+0x148>
/home/yogi/src/os/aproj/kshell/src/kshell.c:228
		    {
		      if (*input == '\'')
 3101597:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310159a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310159d:	3c 27                	cmp    al,0x27
 310159f:	75 09                	jne    31015aa <buildargv+0x135>
/home/yogi/src/os/aproj/kshell/src/kshell.c:230
			{
			  squote = 0;
 31015a1:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 31015a8:	eb 76                	jmp    3101620 <buildargv+0x1ab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:234
			}
		      else
			{
			  *arg++ = *input;
 31015aa:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31015ad:	8d 50 01             	lea    edx,[eax+0x1]
 31015b0:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31015b3:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31015b6:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31015b9:	88 10                	mov    BYTE PTR [eax],dl
 31015bb:	eb 63                	jmp    3101620 <buildargv+0x1ab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:237
			}
		    }
		  else if (dquote)
 31015bd:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31015c1:	74 26                	je     31015e9 <buildargv+0x174>
/home/yogi/src/os/aproj/kshell/src/kshell.c:239
		    {
		      if (*input == '"')
 31015c3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31015c6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31015c9:	3c 22                	cmp    al,0x22
 31015cb:	75 09                	jne    31015d6 <buildargv+0x161>
/home/yogi/src/os/aproj/kshell/src/kshell.c:241
			{
			  dquote = 0;
 31015cd:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 31015d4:	eb 4a                	jmp    3101620 <buildargv+0x1ab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:245
			}
		      else
			{
			  *arg++ = *input;
 31015d6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31015d9:	8d 50 01             	lea    edx,[eax+0x1]
 31015dc:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31015df:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31015e2:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31015e5:	88 10                	mov    BYTE PTR [eax],dl
 31015e7:	eb 37                	jmp    3101620 <buildargv+0x1ab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:250
			}
		    }
		  else
		    {
		      if (*input == '\'')
 31015e9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31015ec:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31015ef:	3c 27                	cmp    al,0x27
 31015f1:	75 09                	jne    31015fc <buildargv+0x187>
/home/yogi/src/os/aproj/kshell/src/kshell.c:252
			{
			  squote = 1;
 31015f3:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 31015fa:	eb 24                	jmp    3101620 <buildargv+0x1ab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:254
			}
		      else if (*input == '"')
 31015fc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31015ff:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101602:	3c 22                	cmp    al,0x22
 3101604:	75 09                	jne    310160f <buildargv+0x19a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:256
			{
			  dquote = 1;
 3101606:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 310160d:	eb 11                	jmp    3101620 <buildargv+0x1ab>
/home/yogi/src/os/aproj/kshell/src/kshell.c:260
			}
		      else
			{
			  *arg++ = *input;
 310160f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101612:	8d 50 01             	lea    edx,[eax+0x1]
 3101615:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3101618:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310161b:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310161e:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/kshell/src/kshell.c:264
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 3101620:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:209
	  while (*input != EOS)
 3101624:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3101627:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310162a:	84 c0                	test   al,al
 310162c:	0f 85 06 ff ff ff    	jne    3101538 <buildargv+0xc3>
/home/yogi/src/os/aproj/kshell/src/kshell.c:267
		}
	    }
	  *arg = EOS;
 3101632:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101635:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:269
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3101638:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310163b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310163e:	84 c0                	test   al,al
 3101640:	0f 84 9e 00 00 00    	je     31016e4 <buildargv+0x26f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:271
          {
            char* temp=malloc(strlen(copybuf)+1);
 3101646:	83 ec 0c             	sub    esp,0xc
 3101649:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310164c:	e8 6f 0e 00 00       	call   31024c0 <strlen@plt>
 3101651:	83 c4 10             	add    esp,0x10
 3101654:	83 c0 01             	add    eax,0x1
 3101657:	83 ec 0c             	sub    esp,0xc
 310165a:	50                   	push   eax
 310165b:	e8 80 0c 00 00       	call   31022e0 <malloc@plt>
 3101660:	83 c4 10             	add    esp,0x10
 3101663:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:274
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 3101666:	83 ec 08             	sub    esp,0x8
 3101669:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310166c:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 310166f:	e8 ec 0b 00 00       	call   3102260 <strcpy@plt>
 3101674:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:275
            free(copybuf);
 3101677:	83 ec 0c             	sub    esp,0xc
 310167a:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310167d:	e8 8e 0e 00 00       	call   3102510 <free@plt>
 3101682:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:276
            copybuf = (char *) malloc (strlen (input) + 1);
 3101685:	83 ec 0c             	sub    esp,0xc
 3101688:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310168b:	e8 30 0e 00 00       	call   31024c0 <strlen@plt>
 3101690:	83 c4 10             	add    esp,0x10
 3101693:	83 c0 01             	add    eax,0x1
 3101696:	83 ec 0c             	sub    esp,0xc
 3101699:	50                   	push   eax
 310169a:	e8 41 0c 00 00       	call   31022e0 <malloc@plt>
 310169f:	83 c4 10             	add    esp,0x10
 31016a2:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:277
            argv[argc] = temp;
 31016a5:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31016a8:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31016af:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31016b2:	01 c2                	add    edx,eax
 31016b4:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 31016b7:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:279
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 31016b9:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:280
            argv[argc] = NULL;
 31016bd:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31016c0:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31016c7:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31016ca:	01 d0                	add    eax,edx
 31016cc:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:281
            input++;
 31016d2:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:282
            free(temp);
 31016d6:	83 ec 0c             	sub    esp,0xc
 31016d9:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 31016dc:	e8 2f 0e 00 00       	call   3102510 <free@plt>
 31016e1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:285
          }
	}
      while (*input != EOS);
 31016e4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31016e7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31016ea:	84 c0                	test   al,al
 31016ec:	0f 85 ed fd ff ff    	jne    31014df <buildargv+0x6a>
/home/yogi/src/os/aproj/kshell/src/kshell.c:288
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 31016f2:	83 ec 0c             	sub    esp,0xc
 31016f5:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31016f8:	e8 13 0e 00 00       	call   3102510 <free@plt>
 31016fd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:289
  free(nargv);
 3101700:	83 ec 0c             	sub    esp,0xc
 3101703:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3101706:	e8 05 0e 00 00       	call   3102510 <free@plt>
 310170b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:290
  return (argv);
 310170e:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/kshell/src/kshell.c:291
}
 3101711:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3101714:	c9                   	leave  
 3101715:	c3                   	ret    

03101716 <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/aproj/kshell/src/kshell.c:294

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
 3101716:	f3 0f 1e fb          	endbr32 
 310171a:	55                   	push   ebp
 310171b:	89 e5                	mov    ebp,esp
 310171d:	56                   	push   esi
 310171e:	53                   	push   ebx
 310171f:	83 ec 10             	sub    esp,0x10
 3101722:	e8 63 08 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3101727:	81 c3 01 24 00 00    	add    ebx,0x2401
/home/yogi/src/os/aproj/kshell/src/kshell.c:295
    for (int cnt=0;cnt<pcount;cnt++)
 310172d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3101734:	eb 56                	jmp    310178c <paramsToArgv+0x76>
/home/yogi/src/os/aproj/kshell/src/kshell.c:297 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 3101736:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101739:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3101740:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3101743:	8d 34 02             	lea    esi,[edx+eax*1]
 3101746:	83 ec 0c             	sub    esp,0xc
 3101749:	68 80 00 00 00       	push   0x80
 310174e:	e8 8d 0b 00 00       	call   31022e0 <malloc@plt>
 3101753:	83 c4 10             	add    esp,0x10
 3101756:	89 06                	mov    DWORD PTR [esi],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:298 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 3101758:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310175b:	c1 e0 07             	shl    eax,0x7
 310175e:	89 c2                	mov    edx,eax
 3101760:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3101763:	01 c2                	add    edx,eax
 3101765:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101768:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 310176f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3101772:	01 c8                	add    eax,ecx
 3101774:	8b 00                	mov    eax,DWORD PTR [eax]
 3101776:	83 ec 04             	sub    esp,0x4
 3101779:	68 80 00 00 00       	push   0x80
 310177e:	52                   	push   edx
 310177f:	50                   	push   eax
 3101780:	e8 4b 0b 00 00       	call   31022d0 <memcpy@plt>
 3101785:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:295 (discriminator 3)
    for (int cnt=0;cnt<pcount;cnt++)
 3101788:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:295 (discriminator 1)
 310178c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310178f:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3101792:	7c a2                	jl     3101736 <paramsToArgv+0x20>
/home/yogi/src/os/aproj/kshell/src/kshell.c:300
    }
    return pptr;
 3101794:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
/home/yogi/src/os/aproj/kshell/src/kshell.c:301
}
 3101797:	8d 65 f8             	lea    esp,[ebp-0x8]
 310179a:	5b                   	pop    ebx
 310179b:	5e                   	pop    esi
 310179c:	5d                   	pop    ebp
 310179d:	c3                   	ret    

0310179e <freeArgV>:
freeArgV():
/home/yogi/src/os/aproj/kshell/src/kshell.c:304

void freeArgV(int pcount, char **params)
{
 310179e:	f3 0f 1e fb          	endbr32 
 31017a2:	55                   	push   ebp
 31017a3:	89 e5                	mov    ebp,esp
 31017a5:	53                   	push   ebx
 31017a6:	83 ec 14             	sub    esp,0x14
 31017a9:	e8 dc 07 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 31017ae:	81 c3 7a 23 00 00    	add    ebx,0x237a
/home/yogi/src/os/aproj/kshell/src/kshell.c:305
    for (int cnt=0;cnt<pcount;cnt++)
 31017b4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31017bb:	eb 15                	jmp    31017d2 <freeArgV+0x34>
/home/yogi/src/os/aproj/kshell/src/kshell.c:306 (discriminator 3)
        free(*params);
 31017bd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31017c0:	8b 00                	mov    eax,DWORD PTR [eax]
 31017c2:	83 ec 0c             	sub    esp,0xc
 31017c5:	50                   	push   eax
 31017c6:	e8 45 0d 00 00       	call   3102510 <free@plt>
 31017cb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:305 (discriminator 3)
    for (int cnt=0;cnt<pcount;cnt++)
 31017ce:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:305 (discriminator 1)
 31017d2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31017d5:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 31017d8:	7c e3                	jl     31017bd <freeArgV+0x1f>
/home/yogi/src/os/aproj/kshell/src/kshell.c:307
    free(params);
 31017da:	83 ec 0c             	sub    esp,0xc
 31017dd:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31017e0:	e8 2b 0d 00 00       	call   3102510 <free@plt>
 31017e5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:308
}
 31017e8:	90                   	nop
 31017e9:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31017ec:	c9                   	leave  
 31017ed:	c3                   	ret    

031017ee <saveCommand>:
saveCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:319
    
}
*/

void saveCommand(char* command)
{
 31017ee:	f3 0f 1e fb          	endbr32 
 31017f2:	55                   	push   ebp
 31017f3:	89 e5                	mov    ebp,esp
 31017f5:	53                   	push   ebx
 31017f6:	83 ec 04             	sub    esp,0x4
 31017f9:	e8 88 07 00 00       	call   3101f86 <__x86.get_pc_thunk.ax>
 31017fe:	05 2a 23 00 00       	add    eax,0x232a
/home/yogi/src/os/aproj/kshell/src/kshell.c:320
    strcpy(commandHistory[commandHistoryMax++],command);
 3101803:	8b 90 24 05 00 00    	mov    edx,DWORD PTR [eax+0x524]
 3101809:	8d 4a 01             	lea    ecx,[edx+0x1]
 310180c:	89 88 24 05 00 00    	mov    DWORD PTR [eax+0x524],ecx
 3101812:	89 d1                	mov    ecx,edx
 3101814:	c1 e1 07             	shl    ecx,0x7
 3101817:	8d 90 38 05 00 00    	lea    edx,[eax+0x538]
 310181d:	01 ca                	add    edx,ecx
 310181f:	83 ec 08             	sub    esp,0x8
 3101822:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3101825:	52                   	push   edx
 3101826:	89 c3                	mov    ebx,eax
 3101828:	e8 33 0a 00 00       	call   3102260 <strcpy@plt>
 310182d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:321
}
 3101830:	90                   	nop
 3101831:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3101834:	c9                   	leave  
 3101835:	c3                   	ret    

03101836 <prompt>:
prompt():
/home/yogi/src/os/aproj/kshell/src/kshell.c:324

void prompt()
{
 3101836:	f3 0f 1e fb          	endbr32 
 310183a:	55                   	push   ebp
 310183b:	89 e5                	mov    ebp,esp
 310183d:	53                   	push   ebx
 310183e:	83 ec 04             	sub    esp,0x4
 3101841:	e8 40 07 00 00       	call   3101f86 <__x86.get_pc_thunk.ax>
 3101846:	05 e2 22 00 00       	add    eax,0x22e2
/home/yogi/src/os/aproj/kshell/src/kshell.c:325
    print("%s$ ",cwd);
 310184b:	83 ec 08             	sub    esp,0x8
 310184e:	8d 90 d8 01 00 00    	lea    edx,[eax+0x1d8]
 3101854:	52                   	push   edx
 3101855:	8d 90 65 ef ff ff    	lea    edx,[eax-0x109b]
 310185b:	52                   	push   edx
 310185c:	89 c3                	mov    ebx,eax
 310185e:	e8 1d 0a 00 00       	call   3102280 <print@plt>
 3101863:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:326
}
 3101866:	90                   	nop
 3101867:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 310186a:	c9                   	leave  
 310186b:	c3                   	ret    

0310186c <reprintCommand>:
reprintCommand():
/home/yogi/src/os/aproj/kshell/src/kshell.c:329

int reprintCommand(char* command)
{
 310186c:	f3 0f 1e fb          	endbr32 
 3101870:	55                   	push   ebp
 3101871:	89 e5                	mov    ebp,esp
 3101873:	53                   	push   ebx
 3101874:	83 ec 04             	sub    esp,0x4
 3101877:	e8 0e 07 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 310187c:	81 c3 ac 22 00 00    	add    ebx,0x22ac
/home/yogi/src/os/aproj/kshell/src/kshell.c:330
    resetRow();
 3101882:	e8 19 0a 00 00       	call   31022a0 <resetRow@plt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:331
    prompt();
 3101887:	e8 aa ff ff ff       	call   3101836 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:332
    print("%s",command);
 310188c:	83 ec 08             	sub    esp,0x8
 310188f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3101892:	8d 83 6a ef ff ff    	lea    eax,[ebx-0x1096]
 3101898:	50                   	push   eax
 3101899:	e8 e2 09 00 00       	call   3102280 <print@plt>
 310189e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:334
 
}
 31018a1:	90                   	nop
 31018a2:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31018a5:	c9                   	leave  
 31018a6:	c3                   	ret    

031018a7 <handleSignals>:
handleSignals():
/home/yogi/src/os/aproj/kshell/src/kshell.c:337

int handleSignals(int signal)
{
 31018a7:	f3 0f 1e fb          	endbr32 
 31018ab:	55                   	push   ebp
 31018ac:	89 e5                	mov    ebp,esp
 31018ae:	e8 d3 06 00 00       	call   3101f86 <__x86.get_pc_thunk.ax>
 31018b3:	05 75 22 00 00       	add    eax,0x2275
/home/yogi/src/os/aproj/kshell/src/kshell.c:338
    switch (signal)
 31018b8:	83 7d 08 08          	cmp    DWORD PTR [ebp+0x8],0x8
 31018bc:	75 0a                	jne    31018c8 <handleSignals+0x21>
/home/yogi/src/os/aproj/kshell/src/kshell.c:341
    {
        case SIGINT:
            bSigIntReceived = true;
 31018be:	8d 80 b8 01 00 00    	lea    eax,[eax+0x1b8]
 31018c4:	c6 00 01             	mov    BYTE PTR [eax],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:342
            break;
 31018c7:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:344
    }
}
 31018c8:	90                   	nop
 31018c9:	5d                   	pop    ebp
 31018ca:	c3                   	ret    

031018cb <processSignal>:
processSignal():
/home/yogi/src/os/aproj/kshell/src/kshell.c:347

int processSignal(int signal)
{
 31018cb:	f3 0f 1e fb          	endbr32 
 31018cf:	55                   	push   ebp
 31018d0:	89 e5                	mov    ebp,esp
 31018d2:	e8 af 06 00 00       	call   3101f86 <__x86.get_pc_thunk.ax>
 31018d7:	05 51 22 00 00       	add    eax,0x2251
/home/yogi/src/os/aproj/kshell/src/kshell.c:348
    switch (signal)
 31018dc:	83 7d 08 08          	cmp    DWORD PTR [ebp+0x8],0x8
 31018e0:	75 10                	jne    31018f2 <processSignal+0x27>
/home/yogi/src/os/aproj/kshell/src/kshell.c:352
    {
        case SIGINT:
            //printf("^C\n");
            bSigIntReceived = false;
 31018e2:	8d 80 b8 01 00 00    	lea    eax,[eax+0x1b8]
 31018e8:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:353
            return SIGINT;
 31018eb:	b8 08 00 00 00       	mov    eax,0x8
 31018f0:	eb 05                	jmp    31018f7 <processSignal+0x2c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:356
            break;
    }
    return 0;
 31018f2:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:357
}
 31018f7:	5d                   	pop    ebp
 31018f8:	c3                   	ret    

031018f9 <kInit>:
kInit():
/home/yogi/src/os/aproj/kshell/src/kshell.c:360

void kInit(int **initFile)
{
 31018f9:	f3 0f 1e fb          	endbr32 
 31018fd:	55                   	push   ebp
 31018fe:	89 e5                	mov    ebp,esp
 3101900:	53                   	push   ebx
 3101901:	83 ec 14             	sub    esp,0x14
 3101904:	e8 81 06 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3101909:	81 c3 1f 22 00 00    	add    ebx,0x221f
/home/yogi/src/os/aproj/kshell/src/kshell.c:361
    execPipes[0]=0;
 310190f:	8d 83 18 05 00 00    	lea    eax,[ebx+0x518]
 3101915:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:362
    execPipes[1]=0;
 310191b:	8d 83 18 05 00 00    	lea    eax,[ebx+0x518]
 3101921:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:363
    kCmdline = malloc(CMDLINE_BUFFER_SIZE);  //Possibility of 25 chained commands
 3101928:	83 ec 0c             	sub    esp,0xc
 310192b:	68 00 c8 00 00       	push   0xc800
 3101930:	e8 ab 09 00 00       	call   31022e0 <malloc@plt>
 3101935:	83 c4 10             	add    esp,0x10
 3101938:	8d 93 38 00 01 00    	lea    edx,[ebx+0x10038]
 310193e:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:364
    bSigIntReceived = false;
 3101940:	8d 83 b8 01 00 00    	lea    eax,[ebx+0x1b8]
 3101946:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:365
    exitCode = 0;
 3101949:	8d 83 0c 05 00 00    	lea    eax,[ebx+0x50c]
 310194f:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:366
    timeToExit = false;
 3101955:	8d 83 14 05 00 00    	lea    eax,[ebx+0x514]
 310195b:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:367
    strcpy(delim," \t\n-,");
 310195e:	83 ec 08             	sub    esp,0x8
 3101961:	8d 83 6d ef ff ff    	lea    eax,[ebx-0x1093]
 3101967:	50                   	push   eax
 3101968:	8d 83 bc 01 00 00    	lea    eax,[ebx+0x1bc]
 310196e:	50                   	push   eax
 310196f:	e8 ec 08 00 00       	call   3102260 <strcpy@plt>
 3101974:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:368
    sKShellProgramName=malloc(1024);
 3101977:	83 ec 0c             	sub    esp,0xc
 310197a:	68 00 04 00 00       	push   0x400
 310197f:	e8 5c 09 00 00       	call   31022e0 <malloc@plt>
 3101984:	83 c4 10             	add    esp,0x10
 3101987:	8d 93 10 05 00 00    	lea    edx,[ebx+0x510]
 310198d:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:369
    strcpy(sKShellProgramName,"kShell");
 310198f:	8d 83 10 05 00 00    	lea    eax,[ebx+0x510]
 3101995:	8b 00                	mov    eax,DWORD PTR [eax]
 3101997:	83 ec 08             	sub    esp,0x8
 310199a:	8d 93 73 ef ff ff    	lea    edx,[ebx-0x108d]
 31019a0:	52                   	push   edx
 31019a1:	50                   	push   eax
 31019a2:	e8 b9 08 00 00       	call   3102260 <strcpy@plt>
 31019a7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:370
    strcpy(sExecutingProgram,sKShellProgramName);
 31019aa:	8d 83 10 05 00 00    	lea    eax,[ebx+0x510]
 31019b0:	8b 00                	mov    eax,DWORD PTR [eax]
 31019b2:	83 ec 08             	sub    esp,0x8
 31019b5:	50                   	push   eax
 31019b6:	8d 83 f8 02 00 00    	lea    eax,[ebx+0x2f8]
 31019bc:	50                   	push   eax
 31019bd:	e8 9e 08 00 00       	call   3102260 <strcpy@plt>
 31019c2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:372
    //puts("\nWelcome to kShell ... hang a while!\n");
    modifySignal(SIGINT, handleSignals, 0);
 31019c5:	83 ec 04             	sub    esp,0x4
 31019c8:	6a 00                	push   0x0
 31019ca:	8d 83 7f dd ff ff    	lea    eax,[ebx-0x2281]
 31019d0:	50                   	push   eax
 31019d1:	6a 08                	push   0x8
 31019d3:	e8 88 0a 00 00       	call   3102460 <modifySignal@plt>
 31019d8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:374
    fstat_t fstat;
    memset(&fstat,0,sizeof(fstat_t));
 31019db:	83 ec 04             	sub    esp,0x4
 31019de:	6a 08                	push   0x8
 31019e0:	6a 00                	push   0x0
 31019e2:	8d 45 f0             	lea    eax,[ebp-0x10]
 31019e5:	50                   	push   eax
 31019e6:	e8 25 0a 00 00       	call   3102410 <memset@plt>
 31019eb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:375
    stat("/.krc",&fstat);
 31019ee:	83 ec 08             	sub    esp,0x8
 31019f1:	8d 45 f0             	lea    eax,[ebp-0x10]
 31019f4:	50                   	push   eax
 31019f5:	8d 83 7a ef ff ff    	lea    eax,[ebx-0x1086]
 31019fb:	50                   	push   eax
 31019fc:	e8 6f 0a 00 00       	call   3102470 <stat@plt>
 3101a01:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:378
    if(fstat.st_size>0);
    {
        *initFile=open("/.krc","r");
 3101a04:	83 ec 08             	sub    esp,0x8
 3101a07:	8d 83 80 ef ff ff    	lea    eax,[ebx-0x1080]
 3101a0d:	50                   	push   eax
 3101a0e:	8d 83 7a ef ff ff    	lea    eax,[ebx-0x1086]
 3101a14:	50                   	push   eax
 3101a15:	e8 b6 0a 00 00       	call   31024d0 <open@plt>
 3101a1a:	83 c4 10             	add    esp,0x10
 3101a1d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3101a20:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:381
    }
    
}
 3101a22:	90                   	nop
 3101a23:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3101a26:	c9                   	leave  
 3101a27:	c3                   	ret    

03101a28 <kShell>:
kShell():
/home/yogi/src/os/aproj/kshell/src/kshell.c:384

int kShell(int argc, char** argv, char** envp)
{
 3101a28:	f3 0f 1e fb          	endbr32 
 3101a2c:	55                   	push   ebp
 3101a2d:	89 e5                	mov    ebp,esp
 3101a2f:	53                   	push   ebx
 3101a30:	83 ec 34             	sub    esp,0x34
 3101a33:	e8 52 05 00 00       	call   3101f8a <__x86.get_pc_thunk.bx>
 3101a38:	81 c3 f0 20 00 00    	add    ebx,0x20f0
/home/yogi/src/os/aproj/kshell/src/kshell.c:385
    uint8_t lCurrKey=0;
 3101a3e:	c6 45 e3 00          	mov    BYTE PTR [ebp-0x1d],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:386
    int lCurrKeyCount=0;
 3101a42:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:387
    int commandWasFromThisBufferPtr=0;
 3101a49:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:389
    char ansiSeq[20];
    int *inputFile=STDIN_FILE;
 3101a50:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:390
    int *initFile=NULL;
 3101a57:	c7 45 c8 00 00 00 00 	mov    DWORD PTR [ebp-0x38],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:392
    
    echoInput=true;
 3101a5e:	8d 83 3c 00 01 00    	lea    eax,[ebx+0x1003c]
 3101a64:	c6 00 01             	mov    BYTE PTR [eax],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:393
    if (argc>1)
 3101a67:	83 7d 08 01          	cmp    DWORD PTR [ebp+0x8],0x1
 3101a6b:	7e 52                	jle    3101abf <kShell+0x97>
/home/yogi/src/os/aproj/kshell/src/kshell.c:395
    {
        inputFile=open(argv[1],"r");
 3101a6d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3101a70:	83 c0 04             	add    eax,0x4
 3101a73:	8b 00                	mov    eax,DWORD PTR [eax]
 3101a75:	83 ec 08             	sub    esp,0x8
 3101a78:	8d 93 80 ef ff ff    	lea    edx,[ebx-0x1080]
 3101a7e:	52                   	push   edx
 3101a7f:	50                   	push   eax
 3101a80:	e8 4b 0a 00 00       	call   31024d0 <open@plt>
 3101a85:	83 c4 10             	add    esp,0x10
 3101a88:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:396
        if (!inputFile)
 3101a8b:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3101a8f:	75 25                	jne    3101ab6 <kShell+0x8e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:398
        {
            printf("Cannot open script file %s",argv[1]);
 3101a91:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3101a94:	83 c0 04             	add    eax,0x4
 3101a97:	8b 00                	mov    eax,DWORD PTR [eax]
 3101a99:	83 ec 08             	sub    esp,0x8
 3101a9c:	50                   	push   eax
 3101a9d:	8d 83 82 ef ff ff    	lea    eax,[ebx-0x107e]
 3101aa3:	50                   	push   eax
 3101aa4:	e8 e7 07 00 00       	call   3102290 <printf@plt>
 3101aa9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:399
            return -1;
 3101aac:	b8 ff ff ff ff       	mov    eax,0xffffffff
 3101ab1:	e9 cb 04 00 00       	jmp    3101f81 <kShell+0x559>
/home/yogi/src/os/aproj/kshell/src/kshell.c:401
        }
        echoInput=false;
 3101ab6:	8d 83 3c 00 01 00    	lea    eax,[ebx+0x1003c]
 3101abc:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:404
    }

    environmentLoc = envp;
 3101abf:	8d 83 c4 01 00 00    	lea    eax,[ebx+0x1c4]
 3101ac5:	8b 55 10             	mov    edx,DWORD PTR [ebp+0x10]
 3101ac8:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/aproj/kshell/src/kshell.c:405
    ansiSeq[0]=0x1b;
 3101aca:	c6 45 cf 1b          	mov    BYTE PTR [ebp-0x31],0x1b
/home/yogi/src/os/aproj/kshell/src/kshell.c:406
    kInit(&initFile);
 3101ace:	83 ec 0c             	sub    esp,0xc
 3101ad1:	8d 45 c8             	lea    eax,[ebp-0x38]
 3101ad4:	50                   	push   eax
 3101ad5:	e8 1f fe ff ff       	call   31018f9 <kInit>
 3101ada:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:408
    
    while (!timeToExit)
 3101add:	e9 3b 04 00 00       	jmp    3101f1d <kShell+0x4f5>
/home/yogi/src/os/aproj/kshell/src/kshell.c:410
    {
getACommand:
 3101ae2:	90                   	nop
 3101ae3:	f3 0f 1e fb          	endbr32 
/home/yogi/src/os/aproj/kshell/src/kshell.c:411
        commandHistoryPtr = commandHistoryMax;
 3101ae7:	8b 83 24 05 00 00    	mov    eax,DWORD PTR [ebx+0x524]
 3101aed:	89 83 20 05 00 00    	mov    DWORD PTR [ebx+0x520],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:412
        commandWasFromThisBufferPtr = -1;
 3101af3:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:413
        lCurrKey=0;
 3101afa:	c6 45 e3 00          	mov    BYTE PTR [ebp-0x1d],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:414
        lCurrKeyCount=0;
 3101afe:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:415
        memset(lCommand,0,256);
 3101b05:	83 ec 04             	sub    esp,0x4
 3101b08:	68 00 01 00 00       	push   0x100
 3101b0d:	6a 00                	push   0x0
 3101b0f:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101b15:	50                   	push   eax
 3101b16:	e8 f5 08 00 00       	call   3102410 <memset@plt>
 3101b1b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:416
        getenv("CWD",cwd);
 3101b1e:	83 ec 08             	sub    esp,0x8
 3101b21:	8d 83 d8 01 00 00    	lea    eax,[ebx+0x1d8]
 3101b27:	50                   	push   eax
 3101b28:	8d 83 9d ef ff ff    	lea    eax,[ebx-0x1063]
 3101b2e:	50                   	push   eax
 3101b2f:	e8 7c 07 00 00       	call   31022b0 <getenv@plt>
 3101b34:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:417
        if (!initFile)
 3101b37:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 3101b3a:	85 c0                	test   eax,eax
 3101b3c:	75 07                	jne    3101b45 <kShell+0x11d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:418
            prompt();
 3101b3e:	e8 f3 fc ff ff       	call   3101836 <prompt>
 3101b43:	eb 01                	jmp    3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:419
getAKey:
 3101b45:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:420
        lCurrKey=0;
 3101b46:	c6 45 e3 00          	mov    BYTE PTR [ebp-0x1d],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:421
        while(lCurrKey==0)
 3101b4a:	e9 ea 00 00 00       	jmp    3101c39 <kShell+0x211>
/home/yogi/src/os/aproj/kshell/src/kshell.c:423
        {
            int retVal=0;
 3101b4f:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:424
            if (initFile)
 3101b56:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 3101b59:	85 c0                	test   eax,eax
 3101b5b:	74 62                	je     3101bbf <kShell+0x197>
/home/yogi/src/os/aproj/kshell/src/kshell.c:426
            {
                echoInput=false;
 3101b5d:	8d 83 3c 00 01 00    	lea    eax,[ebx+0x1003c]
 3101b63:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:427
                retVal=read(initFile, &lCurrKey, 1, 1);
 3101b66:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 3101b69:	6a 01                	push   0x1
 3101b6b:	6a 01                	push   0x1
 3101b6d:	8d 55 e3             	lea    edx,[ebp-0x1d]
 3101b70:	52                   	push   edx
 3101b71:	50                   	push   eax
 3101b72:	e8 19 08 00 00       	call   3102390 <read@plt>
 3101b77:	83 c4 10             	add    esp,0x10
 3101b7a:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:428
                if (!retVal)
 3101b7d:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3101b81:	75 52                	jne    3101bd5 <kShell+0x1ad>
/home/yogi/src/os/aproj/kshell/src/kshell.c:430
                {
                    close(initFile);
 3101b83:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
 3101b86:	83 ec 0c             	sub    esp,0xc
 3101b89:	50                   	push   eax
 3101b8a:	e8 71 09 00 00       	call   3102500 <close@plt>
 3101b8f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:431
                    initFile=0;
 3101b92:	c7 45 c8 00 00 00 00 	mov    DWORD PTR [ebp-0x38],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:432
                    echoInput=true;
 3101b99:	8d 83 3c 00 01 00    	lea    eax,[ebx+0x1003c]
 3101b9f:	c6 00 01             	mov    BYTE PTR [eax],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:433
                    prompt();
 3101ba2:	e8 8f fc ff ff       	call   3101836 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:434
                    retVal=read(inputFile, &lCurrKey, 1, 1);
 3101ba7:	6a 01                	push   0x1
 3101ba9:	6a 01                	push   0x1
 3101bab:	8d 45 e3             	lea    eax,[ebp-0x1d]
 3101bae:	50                   	push   eax
 3101baf:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3101bb2:	e8 d9 07 00 00       	call   3102390 <read@plt>
 3101bb7:	83 c4 10             	add    esp,0x10
 3101bba:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
 3101bbd:	eb 16                	jmp    3101bd5 <kShell+0x1ad>
/home/yogi/src/os/aproj/kshell/src/kshell.c:439
                }
            }
            else
                //Reading from STDIN blocks until a key is available.  It will only return 0 when STDIN is redirected to a file
                retVal=read(inputFile, &lCurrKey, 1, 1);
 3101bbf:	6a 01                	push   0x1
 3101bc1:	6a 01                	push   0x1
 3101bc3:	8d 45 e3             	lea    eax,[ebp-0x1d]
 3101bc6:	50                   	push   eax
 3101bc7:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3101bca:	e8 c1 07 00 00       	call   3102390 <read@plt>
 3101bcf:	83 c4 10             	add    esp,0x10
 3101bd2:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:440
            if (retVal==0)
 3101bd5:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3101bd9:	75 0b                	jne    3101be6 <kShell+0x1be>
/home/yogi/src/os/aproj/kshell/src/kshell.c:442
            {
                timeToExit=true;
 3101bdb:	8d 83 14 05 00 00    	lea    eax,[ebx+0x514]
 3101be1:	c6 00 01             	mov    BYTE PTR [eax],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:443
                break;
 3101be4:	eb 5f                	jmp    3101c45 <kShell+0x21d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:445
            }
            if (bSigIntReceived)
 3101be6:	8d 83 b8 01 00 00    	lea    eax,[ebx+0x1b8]
 3101bec:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101bef:	84 c0                	test   al,al
 3101bf1:	74 46                	je     3101c39 <kShell+0x211>
/home/yogi/src/os/aproj/kshell/src/kshell.c:447
            {
                if (processSignal(SIGINT)==SIGINT)
 3101bf3:	83 ec 0c             	sub    esp,0xc
 3101bf6:	6a 08                	push   0x8
 3101bf8:	e8 ce fc ff ff       	call   31018cb <processSignal>
 3101bfd:	83 c4 10             	add    esp,0x10
 3101c00:	83 f8 08             	cmp    eax,0x8
 3101c03:	75 34                	jne    3101c39 <kShell+0x211>
/home/yogi/src/os/aproj/kshell/src/kshell.c:449
                {
                    lCommand[0] = 0x0;
 3101c05:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101c0b:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:450
                    lCurrKeyCount = 0;
 3101c0e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:451
                    if (echoInput)
 3101c15:	8d 83 3c 00 01 00    	lea    eax,[ebx+0x1003c]
 3101c1b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101c1e:	84 c0                	test   al,al
 3101c20:	74 17                	je     3101c39 <kShell+0x211>
/home/yogi/src/os/aproj/kshell/src/kshell.c:453
                    {
                        printf("\n");
 3101c22:	83 ec 0c             	sub    esp,0xc
 3101c25:	8d 83 a1 ef ff ff    	lea    eax,[ebx-0x105f]
 3101c2b:	50                   	push   eax
 3101c2c:	e8 5f 06 00 00       	call   3102290 <printf@plt>
 3101c31:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:454
                        prompt();
 3101c34:	e8 fd fb ff ff       	call   3101836 <prompt>
/home/yogi/src/os/aproj/kshell/src/kshell.c:421
        while(lCurrKey==0)
 3101c39:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
 3101c3d:	84 c0                	test   al,al
 3101c3f:	0f 84 0a ff ff ff    	je     3101b4f <kShell+0x127>
/home/yogi/src/os/aproj/kshell/src/kshell.c:460
                    }
                }
            }
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 3101c45:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
 3101c49:	3c c8                	cmp    al,0xc8
 3101c4b:	0f 85 ab 00 00 00    	jne    3101cfc <kShell+0x2d4>
/home/yogi/src/os/aproj/kshell/src/kshell.c:462
        {
            if (commandHistoryPtr>=0)
 3101c51:	8b 83 20 05 00 00    	mov    eax,DWORD PTR [ebx+0x520]
 3101c57:	85 c0                	test   eax,eax
 3101c59:	0f 88 e7 fe ff ff    	js     3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:465
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
 3101c5f:	8b 83 20 05 00 00    	mov    eax,DWORD PTR [ebx+0x520]
 3101c65:	85 c0                	test   eax,eax
 3101c67:	0f 8e d9 fe ff ff    	jle    3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:467
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
 3101c6d:	8b 83 20 05 00 00    	mov    eax,DWORD PTR [ebx+0x520]
 3101c73:	83 e8 01             	sub    eax,0x1
 3101c76:	89 83 20 05 00 00    	mov    DWORD PTR [ebx+0x520],eax
 3101c7c:	8b 83 20 05 00 00    	mov    eax,DWORD PTR [ebx+0x520]
 3101c82:	c1 e0 07             	shl    eax,0x7
 3101c85:	89 c2                	mov    edx,eax
 3101c87:	8d 83 38 05 00 00    	lea    eax,[ebx+0x538]
 3101c8d:	01 d0                	add    eax,edx
 3101c8f:	83 ec 08             	sub    esp,0x8
 3101c92:	50                   	push   eax
 3101c93:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101c99:	50                   	push   eax
 3101c9a:	e8 c1 05 00 00       	call   3102260 <strcpy@plt>
 3101c9f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:468
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 3101ca2:	8b 83 20 05 00 00    	mov    eax,DWORD PTR [ebx+0x520]
 3101ca8:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:469
                    while (lCurrKeyCount>0)
 3101cab:	eb 16                	jmp    3101cc3 <kShell+0x29b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:471
                    {
                        printf(KEY_BACKSPACE);
 3101cad:	83 ec 0c             	sub    esp,0xc
 3101cb0:	8d 83 a3 ef ff ff    	lea    eax,[ebx-0x105d]
 3101cb6:	50                   	push   eax
 3101cb7:	e8 d4 05 00 00       	call   3102290 <printf@plt>
 3101cbc:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:472
                        lCurrKeyCount--;
 3101cbf:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:469
                    while (lCurrKeyCount>0)
 3101cc3:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3101cc7:	7f e4                	jg     3101cad <kShell+0x285>
/home/yogi/src/os/aproj/kshell/src/kshell.c:474
                    }
                    printf("%s",lCommand);
 3101cc9:	83 ec 08             	sub    esp,0x8
 3101ccc:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101cd2:	50                   	push   eax
 3101cd3:	8d 83 6a ef ff ff    	lea    eax,[ebx-0x1096]
 3101cd9:	50                   	push   eax
 3101cda:	e8 b1 05 00 00       	call   3102290 <printf@plt>
 3101cdf:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:475
                    lCurrKeyCount=strlen(lCommand);
 3101ce2:	83 ec 0c             	sub    esp,0xc
 3101ce5:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101ceb:	50                   	push   eax
 3101cec:	e8 cf 07 00 00       	call   31024c0 <strlen@plt>
 3101cf1:	83 c4 10             	add    esp,0x10
 3101cf4:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:477
                }
                goto getAKey;
 3101cf7:	e9 4a fe ff ff       	jmp    3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:482
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
 3101cfc:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
 3101d00:	3c d0                	cmp    al,0xd0
 3101d02:	0f 85 b4 00 00 00    	jne    3101dbc <kShell+0x394>
/home/yogi/src/os/aproj/kshell/src/kshell.c:484
        {
            if (commandHistoryPtr>=0)
 3101d08:	8b 83 20 05 00 00    	mov    eax,DWORD PTR [ebx+0x520]
 3101d0e:	85 c0                	test   eax,eax
 3101d10:	0f 88 30 fe ff ff    	js     3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:487
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
 3101d16:	8b 83 20 05 00 00    	mov    eax,DWORD PTR [ebx+0x520]
 3101d1c:	8d 50 01             	lea    edx,[eax+0x1]
 3101d1f:	8b 83 24 05 00 00    	mov    eax,DWORD PTR [ebx+0x524]
 3101d25:	39 c2                	cmp    edx,eax
 3101d27:	0f 8d 19 fe ff ff    	jge    3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:489
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
 3101d2d:	8b 83 20 05 00 00    	mov    eax,DWORD PTR [ebx+0x520]
 3101d33:	83 c0 01             	add    eax,0x1
 3101d36:	89 83 20 05 00 00    	mov    DWORD PTR [ebx+0x520],eax
 3101d3c:	8b 83 20 05 00 00    	mov    eax,DWORD PTR [ebx+0x520]
 3101d42:	c1 e0 07             	shl    eax,0x7
 3101d45:	89 c2                	mov    edx,eax
 3101d47:	8d 83 38 05 00 00    	lea    eax,[ebx+0x538]
 3101d4d:	01 d0                	add    eax,edx
 3101d4f:	83 ec 08             	sub    esp,0x8
 3101d52:	50                   	push   eax
 3101d53:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101d59:	50                   	push   eax
 3101d5a:	e8 01 05 00 00       	call   3102260 <strcpy@plt>
 3101d5f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:490
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 3101d62:	8b 83 20 05 00 00    	mov    eax,DWORD PTR [ebx+0x520]
 3101d68:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:491
                    while (lCurrKeyCount>0)
 3101d6b:	eb 16                	jmp    3101d83 <kShell+0x35b>
/home/yogi/src/os/aproj/kshell/src/kshell.c:493
                    {
                        printf(KEY_BACKSPACE);
 3101d6d:	83 ec 0c             	sub    esp,0xc
 3101d70:	8d 83 a3 ef ff ff    	lea    eax,[ebx-0x105d]
 3101d76:	50                   	push   eax
 3101d77:	e8 14 05 00 00       	call   3102290 <printf@plt>
 3101d7c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:494
                        lCurrKeyCount--;
 3101d7f:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:491
                    while (lCurrKeyCount>0)
 3101d83:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3101d87:	7f e4                	jg     3101d6d <kShell+0x345>
/home/yogi/src/os/aproj/kshell/src/kshell.c:496
                    }
                    printf("%s",lCommand);
 3101d89:	83 ec 08             	sub    esp,0x8
 3101d8c:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101d92:	50                   	push   eax
 3101d93:	8d 83 6a ef ff ff    	lea    eax,[ebx-0x1096]
 3101d99:	50                   	push   eax
 3101d9a:	e8 f1 04 00 00       	call   3102290 <printf@plt>
 3101d9f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:497
                    lCurrKeyCount=strlen(lCommand);
 3101da2:	83 ec 0c             	sub    esp,0xc
 3101da5:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101dab:	50                   	push   eax
 3101dac:	e8 0f 07 00 00       	call   31024c0 <strlen@plt>
 3101db1:	83 c4 10             	add    esp,0x10
 3101db4:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:499
                }
                goto getAKey;
 3101db7:	e9 8a fd ff ff       	jmp    3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:504
            }
            else
                goto getAKey;
        }   
        else if (lCurrKey==0xcb) //left
 3101dbc:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
 3101dc0:	3c cb                	cmp    al,0xcb
 3101dc2:	75 21                	jne    3101de5 <kShell+0x3bd>
/home/yogi/src/os/aproj/kshell/src/kshell.c:506
        {
            if (lCurrKeyCount>0)
 3101dc4:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3101dc8:	0f 8e 78 fd ff ff    	jle    3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:508
            {
                print("\033[1D");
 3101dce:	83 ec 0c             	sub    esp,0xc
 3101dd1:	8d 83 ad ef ff ff    	lea    eax,[ebx-0x1053]
 3101dd7:	50                   	push   eax
 3101dd8:	e8 a3 04 00 00       	call   3102280 <print@plt>
 3101ddd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:511
            }
             
            goto getAKey;
 3101de0:	e9 61 fd ff ff       	jmp    3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:513
        }
        else if (lCurrKey==0xcd) //right
 3101de5:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
 3101de9:	3c cd                	cmp    al,0xcd
 3101deb:	75 17                	jne    3101e04 <kShell+0x3dc>
/home/yogi/src/os/aproj/kshell/src/kshell.c:515
        {
            print("\033[1C");
 3101ded:	83 ec 0c             	sub    esp,0xc
 3101df0:	8d 83 b2 ef ff ff    	lea    eax,[ebx-0x104e]
 3101df6:	50                   	push   eax
 3101df7:	e8 84 04 00 00       	call   3102280 <print@plt>
 3101dfc:	83 c4 10             	add    esp,0x10
 3101dff:	e9 42 fd ff ff       	jmp    3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:517
        }
        else if (lCurrKey=='\b') //backspace
 3101e04:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
 3101e08:	3c 08                	cmp    al,0x8
 3101e0a:	75 33                	jne    3101e3f <kShell+0x417>
/home/yogi/src/os/aproj/kshell/src/kshell.c:519
        {
            if (lCurrKeyCount-1 >= 0)
 3101e0c:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3101e10:	0f 8e 30 fd ff ff    	jle    3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:521
            {
                lCurrKeyCount--;
 3101e16:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/src/kshell.c:522
                lCommand[lCurrKeyCount]='\0';
 3101e1a:	8d 93 38 ff 00 00    	lea    edx,[ebx+0xff38]
 3101e20:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101e23:	01 d0                	add    eax,edx
 3101e25:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:523
                printf(KEY_BACKSPACE);
 3101e28:	83 ec 0c             	sub    esp,0xc
 3101e2b:	8d 83 a3 ef ff ff    	lea    eax,[ebx-0x105d]
 3101e31:	50                   	push   eax
 3101e32:	e8 59 04 00 00       	call   3102290 <printf@plt>
 3101e37:	83 c4 10             	add    esp,0x10
 3101e3a:	e9 07 fd ff ff       	jmp    3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:526
            }
        }
        else if (lCurrKey==0xa) //Enter
 3101e3f:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
 3101e43:	3c 0a                	cmp    al,0xa
 3101e45:	75 21                	jne    3101e68 <kShell+0x440>
/home/yogi/src/os/aproj/kshell/src/kshell.c:528
        {
            if (echoInput)
 3101e47:	8d 83 3c 00 01 00    	lea    eax,[ebx+0x1003c]
 3101e4d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101e50:	84 c0                	test   al,al
 3101e52:	74 70                	je     3101ec4 <kShell+0x49c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:529
                print("\n");
 3101e54:	83 ec 0c             	sub    esp,0xc
 3101e57:	8d 83 a1 ef ff ff    	lea    eax,[ebx-0x105f]
 3101e5d:	50                   	push   eax
 3101e5e:	e8 1d 04 00 00       	call   3102280 <print@plt>
 3101e63:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:530
            goto doneGettingKeys;
 3101e66:	eb 5c                	jmp    3101ec4 <kShell+0x49c>
/home/yogi/src/os/aproj/kshell/src/kshell.c:532
        }
        else if (lCurrKey==0x0)
 3101e68:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
 3101e6c:	84 c0                	test   al,al
 3101e6e:	75 0b                	jne    3101e7b <kShell+0x453>
/home/yogi/src/os/aproj/kshell/src/kshell.c:534
        {
            lCommand[0]=0x0;
 3101e70:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101e76:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/src/kshell.c:535
            goto doneGettingKeys;
 3101e79:	eb 4a                	jmp    3101ec5 <kShell+0x49d>
/home/yogi/src/os/aproj/kshell/src/kshell.c:539
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3101e7b:	0f b6 4d e3          	movzx  ecx,BYTE PTR [ebp-0x1d]
 3101e7f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3101e82:	8d 50 01             	lea    edx,[eax+0x1]
 3101e85:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3101e88:	8d 93 38 ff 00 00    	lea    edx,[ebx+0xff38]
 3101e8e:	88 0c 02             	mov    BYTE PTR [edx+eax*1],cl
/home/yogi/src/os/aproj/kshell/src/kshell.c:541
            //reprintCommand(lCommand);
            if (echoInput)
 3101e91:	8d 83 3c 00 01 00    	lea    eax,[ebx+0x1003c]
 3101e97:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101e9a:	84 c0                	test   al,al
 3101e9c:	74 1a                	je     3101eb8 <kShell+0x490>
/home/yogi/src/os/aproj/kshell/src/kshell.c:542
                printf("%c",lCurrKey);
 3101e9e:	0f b6 45 e3          	movzx  eax,BYTE PTR [ebp-0x1d]
 3101ea2:	0f b6 c0             	movzx  eax,al
 3101ea5:	83 ec 08             	sub    esp,0x8
 3101ea8:	50                   	push   eax
 3101ea9:	8d 83 b7 ef ff ff    	lea    eax,[ebx-0x1049]
 3101eaf:	50                   	push   eax
 3101eb0:	e8 db 03 00 00       	call   3102290 <printf@plt>
 3101eb5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:544
            //Reset pointer to command buffer so that this possibly modified command gets written as a new one
            commandWasFromThisBufferPtr=-1;
 3101eb8:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/src/kshell.c:546
        }
        goto getAKey;
 3101ebf:	e9 82 fc ff ff       	jmp    3101b46 <kShell+0x11e>
/home/yogi/src/os/aproj/kshell/src/kshell.c:530
            goto doneGettingKeys;
 3101ec4:	90                   	nop
/home/yogi/src/os/aproj/kshell/src/kshell.c:549
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]!=0x0)
 3101ec5:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101ecb:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101ece:	84 c0                	test   al,al
 3101ed0:	74 4b                	je     3101f1d <kShell+0x4f5>
/home/yogi/src/os/aproj/kshell/src/kshell.c:551
        {
            if (commandWasFromThisBufferPtr == -1)
 3101ed2:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
 3101ed6:	75 12                	jne    3101eea <kShell+0x4c2>
/home/yogi/src/os/aproj/kshell/src/kshell.c:552
                saveCommand(lCommand);
 3101ed8:	83 ec 0c             	sub    esp,0xc
 3101edb:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101ee1:	50                   	push   eax
 3101ee2:	e8 07 f9 ff ff       	call   31017ee <saveCommand>
 3101ee7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:553
            int i = findCommand(lCommand);
 3101eea:	83 ec 0c             	sub    esp,0xc
 3101eed:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101ef3:	50                   	push   eax
 3101ef4:	e8 fc f4 ff ff       	call   31013f5 <findCommand>
 3101ef9:	83 c4 10             	add    esp,0x10
 3101efc:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/src/kshell.c:554
            execCmds(parseCmds(lCommand));
 3101eff:	83 ec 0c             	sub    esp,0xc
 3101f02:	8d 83 38 ff 00 00    	lea    eax,[ebx+0xff38]
 3101f08:	50                   	push   eax
 3101f09:	e8 f3 f0 ff ff       	call   3101001 <parseCmds>
 3101f0e:	83 c4 10             	add    esp,0x10
 3101f11:	83 ec 0c             	sub    esp,0xc
 3101f14:	50                   	push   eax
 3101f15:	e8 a9 f0 ff ff       	call   3100fc3 <execCmds>
 3101f1a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:408
    while (!timeToExit)
 3101f1d:	8d 83 14 05 00 00    	lea    eax,[ebx+0x514]
 3101f23:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3101f26:	83 f0 01             	xor    eax,0x1
 3101f29:	84 c0                	test   al,al
 3101f2b:	0f 85 b1 fb ff ff    	jne    3101ae2 <kShell+0xba>
/home/yogi/src/os/aproj/kshell/src/kshell.c:557
        }
    }
    free(sKShellProgramName);
 3101f31:	8d 83 10 05 00 00    	lea    eax,[ebx+0x510]
 3101f37:	8b 00                	mov    eax,DWORD PTR [eax]
 3101f39:	83 ec 0c             	sub    esp,0xc
 3101f3c:	50                   	push   eax
 3101f3d:	e8 ce 05 00 00       	call   3102510 <free@plt>
 3101f42:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:558
    if (inputFile!=STDIN_FILE)
 3101f45:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3101f49:	74 0e                	je     3101f59 <kShell+0x531>
/home/yogi/src/os/aproj/kshell/src/kshell.c:559
        close(inputFile);
 3101f4b:	83 ec 0c             	sub    esp,0xc
 3101f4e:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3101f51:	e8 aa 05 00 00       	call   3102500 <close@plt>
 3101f56:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:560
    if (kCmdline)
 3101f59:	8d 83 38 00 01 00    	lea    eax,[ebx+0x10038]
 3101f5f:	8b 00                	mov    eax,DWORD PTR [eax]
 3101f61:	85 c0                	test   eax,eax
 3101f63:	74 14                	je     3101f79 <kShell+0x551>
/home/yogi/src/os/aproj/kshell/src/kshell.c:561
        free(kCmdline);
 3101f65:	8d 83 38 00 01 00    	lea    eax,[ebx+0x10038]
 3101f6b:	8b 00                	mov    eax,DWORD PTR [eax]
 3101f6d:	83 ec 0c             	sub    esp,0xc
 3101f70:	50                   	push   eax
 3101f71:	e8 9a 05 00 00       	call   3102510 <free@plt>
 3101f76:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/src/kshell.c:562
    return exitCode;
 3101f79:	8d 83 0c 05 00 00    	lea    eax,[ebx+0x50c]
 3101f7f:	8b 00                	mov    eax,DWORD PTR [eax]
/home/yogi/src/os/aproj/kshell/src/kshell.c:563 (discriminator 1)
}
 3101f81:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3101f84:	c9                   	leave  
 3101f85:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.ax:

03101f86 <__x86.get_pc_thunk.ax>:
__x86.get_pc_thunk.ax():
 3101f86:	8b 04 24             	mov    eax,DWORD PTR [esp]
 3101f89:	c3                   	ret    

Disassembly of section .text.__x86.get_pc_thunk.bx:

03101f8a <__x86.get_pc_thunk.bx>:
__x86.get_pc_thunk.bx():
 3101f8a:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 3101f8d:	c3                   	ret    

Disassembly of section .plt:

03101f90 <.plt>:
 3101f90:	ff b3 04 00 00 00    	push   DWORD PTR [ebx+0x4]
 3101f96:	ff a3 08 00 00 00    	jmp    DWORD PTR [ebx+0x8]
 3101f9c:	0f 1f 40 00          	nop    DWORD PTR [eax+0x0]
 3101fa0:	f3 0f 1e fb          	endbr32 
 3101fa4:	68 00 00 00 00       	push   0x0
 3101fa9:	e9 e2 ff ff ff       	jmp    3101f90 <.plt>
 3101fae:	66 90                	xchg   ax,ax
 3101fb0:	f3 0f 1e fb          	endbr32 
 3101fb4:	68 08 00 00 00       	push   0x8
 3101fb9:	e9 d2 ff ff ff       	jmp    3101f90 <.plt>
 3101fbe:	66 90                	xchg   ax,ax
 3101fc0:	f3 0f 1e fb          	endbr32 
 3101fc4:	68 10 00 00 00       	push   0x10
 3101fc9:	e9 c2 ff ff ff       	jmp    3101f90 <.plt>
 3101fce:	66 90                	xchg   ax,ax
 3101fd0:	f3 0f 1e fb          	endbr32 
 3101fd4:	68 18 00 00 00       	push   0x18
 3101fd9:	e9 b2 ff ff ff       	jmp    3101f90 <.plt>
 3101fde:	66 90                	xchg   ax,ax
 3101fe0:	f3 0f 1e fb          	endbr32 
 3101fe4:	68 20 00 00 00       	push   0x20
 3101fe9:	e9 a2 ff ff ff       	jmp    3101f90 <.plt>
 3101fee:	66 90                	xchg   ax,ax
 3101ff0:	f3 0f 1e fb          	endbr32 
 3101ff4:	68 28 00 00 00       	push   0x28
 3101ff9:	e9 92 ff ff ff       	jmp    3101f90 <.plt>
 3101ffe:	66 90                	xchg   ax,ax
 3102000:	f3 0f 1e fb          	endbr32 
 3102004:	68 30 00 00 00       	push   0x30
 3102009:	e9 82 ff ff ff       	jmp    3101f90 <.plt>
 310200e:	66 90                	xchg   ax,ax
 3102010:	f3 0f 1e fb          	endbr32 
 3102014:	68 38 00 00 00       	push   0x38
 3102019:	e9 72 ff ff ff       	jmp    3101f90 <.plt>
 310201e:	66 90                	xchg   ax,ax
 3102020:	f3 0f 1e fb          	endbr32 
 3102024:	68 40 00 00 00       	push   0x40
 3102029:	e9 62 ff ff ff       	jmp    3101f90 <.plt>
 310202e:	66 90                	xchg   ax,ax
 3102030:	f3 0f 1e fb          	endbr32 
 3102034:	68 48 00 00 00       	push   0x48
 3102039:	e9 52 ff ff ff       	jmp    3101f90 <.plt>
 310203e:	66 90                	xchg   ax,ax
 3102040:	f3 0f 1e fb          	endbr32 
 3102044:	68 50 00 00 00       	push   0x50
 3102049:	e9 42 ff ff ff       	jmp    3101f90 <.plt>
 310204e:	66 90                	xchg   ax,ax
 3102050:	f3 0f 1e fb          	endbr32 
 3102054:	68 58 00 00 00       	push   0x58
 3102059:	e9 32 ff ff ff       	jmp    3101f90 <.plt>
 310205e:	66 90                	xchg   ax,ax
 3102060:	f3 0f 1e fb          	endbr32 
 3102064:	68 60 00 00 00       	push   0x60
 3102069:	e9 22 ff ff ff       	jmp    3101f90 <.plt>
 310206e:	66 90                	xchg   ax,ax
 3102070:	f3 0f 1e fb          	endbr32 
 3102074:	68 68 00 00 00       	push   0x68
 3102079:	e9 12 ff ff ff       	jmp    3101f90 <.plt>
 310207e:	66 90                	xchg   ax,ax
 3102080:	f3 0f 1e fb          	endbr32 
 3102084:	68 70 00 00 00       	push   0x70
 3102089:	e9 02 ff ff ff       	jmp    3101f90 <.plt>
 310208e:	66 90                	xchg   ax,ax
 3102090:	f3 0f 1e fb          	endbr32 
 3102094:	68 78 00 00 00       	push   0x78
 3102099:	e9 f2 fe ff ff       	jmp    3101f90 <.plt>
 310209e:	66 90                	xchg   ax,ax
 31020a0:	f3 0f 1e fb          	endbr32 
 31020a4:	68 80 00 00 00       	push   0x80
 31020a9:	e9 e2 fe ff ff       	jmp    3101f90 <.plt>
 31020ae:	66 90                	xchg   ax,ax
 31020b0:	f3 0f 1e fb          	endbr32 
 31020b4:	68 88 00 00 00       	push   0x88
 31020b9:	e9 d2 fe ff ff       	jmp    3101f90 <.plt>
 31020be:	66 90                	xchg   ax,ax
 31020c0:	f3 0f 1e fb          	endbr32 
 31020c4:	68 90 00 00 00       	push   0x90
 31020c9:	e9 c2 fe ff ff       	jmp    3101f90 <.plt>
 31020ce:	66 90                	xchg   ax,ax
 31020d0:	f3 0f 1e fb          	endbr32 
 31020d4:	68 98 00 00 00       	push   0x98
 31020d9:	e9 b2 fe ff ff       	jmp    3101f90 <.plt>
 31020de:	66 90                	xchg   ax,ax
 31020e0:	f3 0f 1e fb          	endbr32 
 31020e4:	68 a0 00 00 00       	push   0xa0
 31020e9:	e9 a2 fe ff ff       	jmp    3101f90 <.plt>
 31020ee:	66 90                	xchg   ax,ax
 31020f0:	f3 0f 1e fb          	endbr32 
 31020f4:	68 a8 00 00 00       	push   0xa8
 31020f9:	e9 92 fe ff ff       	jmp    3101f90 <.plt>
 31020fe:	66 90                	xchg   ax,ax
 3102100:	f3 0f 1e fb          	endbr32 
 3102104:	68 b0 00 00 00       	push   0xb0
 3102109:	e9 82 fe ff ff       	jmp    3101f90 <.plt>
 310210e:	66 90                	xchg   ax,ax
 3102110:	f3 0f 1e fb          	endbr32 
 3102114:	68 b8 00 00 00       	push   0xb8
 3102119:	e9 72 fe ff ff       	jmp    3101f90 <.plt>
 310211e:	66 90                	xchg   ax,ax
 3102120:	f3 0f 1e fb          	endbr32 
 3102124:	68 c0 00 00 00       	push   0xc0
 3102129:	e9 62 fe ff ff       	jmp    3101f90 <.plt>
 310212e:	66 90                	xchg   ax,ax
 3102130:	f3 0f 1e fb          	endbr32 
 3102134:	68 c8 00 00 00       	push   0xc8
 3102139:	e9 52 fe ff ff       	jmp    3101f90 <.plt>
 310213e:	66 90                	xchg   ax,ax
 3102140:	f3 0f 1e fb          	endbr32 
 3102144:	68 d0 00 00 00       	push   0xd0
 3102149:	e9 42 fe ff ff       	jmp    3101f90 <.plt>
 310214e:	66 90                	xchg   ax,ax
 3102150:	f3 0f 1e fb          	endbr32 
 3102154:	68 d8 00 00 00       	push   0xd8
 3102159:	e9 32 fe ff ff       	jmp    3101f90 <.plt>
 310215e:	66 90                	xchg   ax,ax
 3102160:	f3 0f 1e fb          	endbr32 
 3102164:	68 e0 00 00 00       	push   0xe0
 3102169:	e9 22 fe ff ff       	jmp    3101f90 <.plt>
 310216e:	66 90                	xchg   ax,ax
 3102170:	f3 0f 1e fb          	endbr32 
 3102174:	68 e8 00 00 00       	push   0xe8
 3102179:	e9 12 fe ff ff       	jmp    3101f90 <.plt>
 310217e:	66 90                	xchg   ax,ax
 3102180:	f3 0f 1e fb          	endbr32 
 3102184:	68 f0 00 00 00       	push   0xf0
 3102189:	e9 02 fe ff ff       	jmp    3101f90 <.plt>
 310218e:	66 90                	xchg   ax,ax
 3102190:	f3 0f 1e fb          	endbr32 
 3102194:	68 f8 00 00 00       	push   0xf8
 3102199:	e9 f2 fd ff ff       	jmp    3101f90 <.plt>
 310219e:	66 90                	xchg   ax,ax
 31021a0:	f3 0f 1e fb          	endbr32 
 31021a4:	68 00 01 00 00       	push   0x100
 31021a9:	e9 e2 fd ff ff       	jmp    3101f90 <.plt>
 31021ae:	66 90                	xchg   ax,ax
 31021b0:	f3 0f 1e fb          	endbr32 
 31021b4:	68 08 01 00 00       	push   0x108
 31021b9:	e9 d2 fd ff ff       	jmp    3101f90 <.plt>
 31021be:	66 90                	xchg   ax,ax
 31021c0:	f3 0f 1e fb          	endbr32 
 31021c4:	68 10 01 00 00       	push   0x110
 31021c9:	e9 c2 fd ff ff       	jmp    3101f90 <.plt>
 31021ce:	66 90                	xchg   ax,ax
 31021d0:	f3 0f 1e fb          	endbr32 
 31021d4:	68 18 01 00 00       	push   0x118
 31021d9:	e9 b2 fd ff ff       	jmp    3101f90 <.plt>
 31021de:	66 90                	xchg   ax,ax
 31021e0:	f3 0f 1e fb          	endbr32 
 31021e4:	68 20 01 00 00       	push   0x120
 31021e9:	e9 a2 fd ff ff       	jmp    3101f90 <.plt>
 31021ee:	66 90                	xchg   ax,ax
 31021f0:	f3 0f 1e fb          	endbr32 
 31021f4:	68 28 01 00 00       	push   0x128
 31021f9:	e9 92 fd ff ff       	jmp    3101f90 <.plt>
 31021fe:	66 90                	xchg   ax,ax
 3102200:	f3 0f 1e fb          	endbr32 
 3102204:	68 30 01 00 00       	push   0x130
 3102209:	e9 82 fd ff ff       	jmp    3101f90 <.plt>
 310220e:	66 90                	xchg   ax,ax
 3102210:	f3 0f 1e fb          	endbr32 
 3102214:	68 38 01 00 00       	push   0x138
 3102219:	e9 72 fd ff ff       	jmp    3101f90 <.plt>
 310221e:	66 90                	xchg   ax,ax
 3102220:	f3 0f 1e fb          	endbr32 
 3102224:	68 40 01 00 00       	push   0x140
 3102229:	e9 62 fd ff ff       	jmp    3101f90 <.plt>
 310222e:	66 90                	xchg   ax,ax
 3102230:	f3 0f 1e fb          	endbr32 
 3102234:	68 48 01 00 00       	push   0x148
 3102239:	e9 52 fd ff ff       	jmp    3101f90 <.plt>
 310223e:	66 90                	xchg   ax,ax
 3102240:	f3 0f 1e fb          	endbr32 
 3102244:	68 50 01 00 00       	push   0x150
 3102249:	e9 42 fd ff ff       	jmp    3101f90 <.plt>
 310224e:	66 90                	xchg   ax,ax
 3102250:	f3 0f 1e fb          	endbr32 
 3102254:	68 58 01 00 00       	push   0x158
 3102259:	e9 32 fd ff ff       	jmp    3101f90 <.plt>
 310225e:	66 90                	xchg   ax,ax

Disassembly of section .plt.sec:

03102260 <strcpy@plt>:
 3102260:	f3 0f 1e fb          	endbr32 
 3102264:	ff a3 0c 00 00 00    	jmp    DWORD PTR [ebx+0xc]
 310226a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102270 <waitpid@plt>:
 3102270:	f3 0f 1e fb          	endbr32 
 3102274:	ff a3 10 00 00 00    	jmp    DWORD PTR [ebx+0x10]
 310227a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102280 <print@plt>:
 3102280:	f3 0f 1e fb          	endbr32 
 3102284:	ff a3 14 00 00 00    	jmp    DWORD PTR [ebx+0x14]
 310228a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102290 <printf@plt>:
 3102290:	f3 0f 1e fb          	endbr32 
 3102294:	ff a3 18 00 00 00    	jmp    DWORD PTR [ebx+0x18]
 310229a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031022a0 <resetRow@plt>:
 31022a0:	f3 0f 1e fb          	endbr32 
 31022a4:	ff a3 1c 00 00 00    	jmp    DWORD PTR [ebx+0x1c]
 31022aa:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031022b0 <getenv@plt>:
 31022b0:	f3 0f 1e fb          	endbr32 
 31022b4:	ff a3 20 00 00 00    	jmp    DWORD PTR [ebx+0x20]
 31022ba:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031022c0 <resolvePath@plt>:
 31022c0:	f3 0f 1e fb          	endbr32 
 31022c4:	ff a3 24 00 00 00    	jmp    DWORD PTR [ebx+0x24]
 31022ca:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031022d0 <memcpy@plt>:
 31022d0:	f3 0f 1e fb          	endbr32 
 31022d4:	ff a3 28 00 00 00    	jmp    DWORD PTR [ebx+0x28]
 31022da:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031022e0 <malloc@plt>:
 31022e0:	f3 0f 1e fb          	endbr32 
 31022e4:	ff a3 2c 00 00 00    	jmp    DWORD PTR [ebx+0x2c]
 31022ea:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031022f0 <sleep@plt>:
 31022f0:	f3 0f 1e fb          	endbr32 
 31022f4:	ff a3 30 00 00 00    	jmp    DWORD PTR [ebx+0x30]
 31022fa:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102300 <cmdlineToArgv@plt>:
 3102300:	f3 0f 1e fb          	endbr32 
 3102304:	ff a3 34 00 00 00    	jmp    DWORD PTR [ebx+0x34]
 310230a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102310 <strtoul@plt>:
 3102310:	f3 0f 1e fb          	endbr32 
 3102314:	ff a3 38 00 00 00    	jmp    DWORD PTR [ebx+0x38]
 310231a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102320 <itoa@plt>:
 3102320:	f3 0f 1e fb          	endbr32 
 3102324:	ff a3 3c 00 00 00    	jmp    DWORD PTR [ebx+0x3c]
 310232a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102330 <takeADump@plt>:
 3102330:	f3 0f 1e fb          	endbr32 
 3102334:	ff a3 40 00 00 00    	jmp    DWORD PTR [ebx+0x40]
 310233a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102340 <pipe@plt>:
 3102340:	f3 0f 1e fb          	endbr32 
 3102344:	ff a3 44 00 00 00    	jmp    DWORD PTR [ebx+0x44]
 310234a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102350 <strcat@plt>:
 3102350:	f3 0f 1e fb          	endbr32 
 3102354:	ff a3 48 00 00 00    	jmp    DWORD PTR [ebx+0x48]
 310235a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102360 <getticks@plt>:
 3102360:	f3 0f 1e fb          	endbr32 
 3102364:	ff a3 4c 00 00 00    	jmp    DWORD PTR [ebx+0x4c]
 310236a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102370 <exec@plt>:
 3102370:	f3 0f 1e fb          	endbr32 
 3102374:	ff a3 50 00 00 00    	jmp    DWORD PTR [ebx+0x50]
 310237a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102380 <strstr@plt>:
 3102380:	f3 0f 1e fb          	endbr32 
 3102384:	ff a3 54 00 00 00    	jmp    DWORD PTR [ebx+0x54]
 310238a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102390 <read@plt>:
 3102390:	f3 0f 1e fb          	endbr32 
 3102394:	ff a3 58 00 00 00    	jmp    DWORD PTR [ebx+0x58]
 310239a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031023a0 <strncmp@plt>:
 31023a0:	f3 0f 1e fb          	endbr32 
 31023a4:	ff a3 5c 00 00 00    	jmp    DWORD PTR [ebx+0x5c]
 31023aa:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031023b0 <strncpy@plt>:
 31023b0:	f3 0f 1e fb          	endbr32 
 31023b4:	ff a3 60 00 00 00    	jmp    DWORD PTR [ebx+0x60]
 31023ba:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031023c0 <unlink@plt>:
 31023c0:	f3 0f 1e fb          	endbr32 
 31023c4:	ff a3 64 00 00 00    	jmp    DWORD PTR [ebx+0x64]
 31023ca:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031023d0 <setenv@plt>:
 31023d0:	f3 0f 1e fb          	endbr32 
 31023d4:	ff a3 68 00 00 00    	jmp    DWORD PTR [ebx+0x68]
 31023da:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031023e0 <strtok@plt>:
 31023e0:	f3 0f 1e fb          	endbr32 
 31023e4:	ff a3 6c 00 00 00    	jmp    DWORD PTR [ebx+0x6c]
 31023ea:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031023f0 <fork@plt>:
 31023f0:	f3 0f 1e fb          	endbr32 
 31023f4:	ff a3 70 00 00 00    	jmp    DWORD PTR [ebx+0x70]
 31023fa:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102400 <setcwd@plt>:
 3102400:	f3 0f 1e fb          	endbr32 
 3102404:	ff a3 74 00 00 00    	jmp    DWORD PTR [ebx+0x74]
 310240a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102410 <memset@plt>:
 3102410:	f3 0f 1e fb          	endbr32 
 3102414:	ff a3 78 00 00 00    	jmp    DWORD PTR [ebx+0x78]
 310241a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102420 <strtrim@plt>:
 3102420:	f3 0f 1e fb          	endbr32 
 3102424:	ff a3 7c 00 00 00    	jmp    DWORD PTR [ebx+0x7c]
 310242a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102430 <strcmp@plt>:
 3102430:	f3 0f 1e fb          	endbr32 
 3102434:	ff a3 80 00 00 00    	jmp    DWORD PTR [ebx+0x80]
 310243a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102440 <getcwd@plt>:
 3102440:	f3 0f 1e fb          	endbr32 
 3102444:	ff a3 84 00 00 00    	jmp    DWORD PTR [ebx+0x84]
 310244a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102450 <printd@plt>:
 3102450:	f3 0f 1e fb          	endbr32 
 3102454:	ff a3 88 00 00 00    	jmp    DWORD PTR [ebx+0x88]
 310245a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102460 <modifySignal@plt>:
 3102460:	f3 0f 1e fb          	endbr32 
 3102464:	ff a3 8c 00 00 00    	jmp    DWORD PTR [ebx+0x8c]
 310246a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102470 <stat@plt>:
 3102470:	f3 0f 1e fb          	endbr32 
 3102474:	ff a3 90 00 00 00    	jmp    DWORD PTR [ebx+0x90]
 310247a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102480 <freopen@plt>:
 3102480:	f3 0f 1e fb          	endbr32 
 3102484:	ff a3 94 00 00 00    	jmp    DWORD PTR [ebx+0x94]
 310248a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102490 <exit@plt>:
 3102490:	f3 0f 1e fb          	endbr32 
 3102494:	ff a3 98 00 00 00    	jmp    DWORD PTR [ebx+0x98]
 310249a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031024a0 <atoi@plt>:
 31024a0:	f3 0f 1e fb          	endbr32 
 31024a4:	ff a3 9c 00 00 00    	jmp    DWORD PTR [ebx+0x9c]
 31024aa:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031024b0 <setSTD@plt>:
 31024b0:	f3 0f 1e fb          	endbr32 
 31024b4:	ff a3 a0 00 00 00    	jmp    DWORD PTR [ebx+0xa0]
 31024ba:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031024c0 <strlen@plt>:
 31024c0:	f3 0f 1e fb          	endbr32 
 31024c4:	ff a3 a4 00 00 00    	jmp    DWORD PTR [ebx+0xa4]
 31024ca:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031024d0 <open@plt>:
 31024d0:	f3 0f 1e fb          	endbr32 
 31024d4:	ff a3 a8 00 00 00    	jmp    DWORD PTR [ebx+0xa8]
 31024da:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031024e0 <execa@plt>:
 31024e0:	f3 0f 1e fb          	endbr32 
 31024e4:	ff a3 ac 00 00 00    	jmp    DWORD PTR [ebx+0xac]
 31024ea:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

031024f0 <strreplace@plt>:
 31024f0:	f3 0f 1e fb          	endbr32 
 31024f4:	ff a3 b0 00 00 00    	jmp    DWORD PTR [ebx+0xb0]
 31024fa:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102500 <close@plt>:
 3102500:	f3 0f 1e fb          	endbr32 
 3102504:	ff a3 b4 00 00 00    	jmp    DWORD PTR [ebx+0xb4]
 310250a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

03102510 <free@plt>:
 3102510:	f3 0f 1e fb          	endbr32 
 3102514:	ff a3 b8 00 00 00    	jmp    DWORD PTR [ebx+0xb8]
 310251a:	66 0f 1f 44 00 00    	nop    WORD PTR [eax+eax*1+0x0]

Disassembly of section .rodata:

03102520 <.rodata>:
 3102520:	63 64 00 43          	arpl   WORD PTR [eax+eax*1+0x43],sp
 3102524:	68 61 6e 67 65       	push   0x65676e61
 3102529:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 310252d:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3102532:	79 00                	jns    3102534 <free@plt+0x24>
 3102534:	63 6c 65 61          	arpl   WORD PTR [ebp+eiz*2+0x61],bp
 3102538:	72 00                	jb     310253a <free@plt+0x2a>
 310253a:	43                   	inc    ebx
 310253b:	6c                   	ins    BYTE PTR es:[edi],dx
 310253c:	65 61                	gs popa 
 310253e:	72 20                	jb     3102560 <free@plt+0x50>
 3102540:	74 68                	je     31025aa <free@plt+0x9a>
 3102542:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 3102546:	72 65                	jb     31025ad <free@plt+0x9d>
 3102548:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 310254a:	00 64 75 6d          	add    BYTE PTR [ebp+esi*2+0x6d],ah
 310254e:	70 00                	jo     3102550 <free@plt+0x40>
 3102550:	44                   	inc    esp
 3102551:	75 6d                	jne    31025c0 <free@plt+0xb0>
 3102553:	70 20                	jo     3102575 <free@plt+0x65>
 3102555:	6b 65 72 6e          	imul   esp,DWORD PTR [ebp+0x72],0x6e
 3102559:	65 6c                	gs ins BYTE PTR es:[edi],dx
 310255b:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 310255e:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3102560:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
 3102564:	6c                   	ins    BYTE PTR es:[edi],dx
 3102565:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3102566:	67 00 65 6e          	add    BYTE PTR [di+0x6e],ah
 310256a:	76 00                	jbe    310256c <free@plt+0x5c>
 310256c:	50                   	push   eax
 310256d:	72 69                	jb     31025d8 <free@plt+0xc8>
 310256f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102570:	74 20                	je     3102592 <free@plt+0x82>
 3102572:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3102574:	76 69                	jbe    31025df <free@plt+0xcf>
 3102576:	72 6f                	jb     31025e7 <free@plt+0xd7>
 3102578:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102579:	6d                   	ins    DWORD PTR es:[edi],dx
 310257a:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 310257c:	74 00                	je     310257e <free@plt+0x6e>
 310257e:	65 78 65             	gs js  31025e6 <free@plt+0xd6>
 3102581:	63 00                	arpl   WORD PTR [eax],ax
 3102583:	45                   	inc    ebp
 3102584:	78 65                	js     31025eb <free@plt+0xdb>
 3102586:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3102589:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 310258d:	70 72                	jo     3102601 <free@plt+0xf1>
 310258f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3102590:	67 72 61             	addr16 jb 31025f4 <free@plt+0xe4>
 3102593:	6d                   	ins    DWORD PTR es:[edi],dx
 3102594:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3102597:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 310259e:	20 
 310259f:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 31025a3:	6c                   	ins    BYTE PTR es:[edi],dx
 31025a4:	6c                   	ins    BYTE PTR es:[edi],dx
 31025a5:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 31025a8:	6c                   	ins    BYTE PTR es:[edi],dx
 31025a9:	70 00                	jo     31025ab <free@plt+0x9b>
 31025ab:	47                   	inc    edi
 31025ac:	65 74 20             	gs je  31025cf <free@plt+0xbf>
 31025af:	68 65 6c 70 20       	push   0x20706c65
 31025b4:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 31025b8:	73 20                	jae    31025da <free@plt+0xca>
 31025ba:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 31025c1:	74 69                	je     310262c <free@plt+0x11c>
 31025c3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31025c4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31025c5:	29 00                	sub    DWORD PTR [eax],eax
 31025c7:	70 77                	jo     3102640 <free@plt+0x130>
 31025c9:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 31025cd:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 31025d4:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 31025d8:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 31025dc:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 31025e1:	79 00                	jns    31025e3 <free@plt+0xd3>
 31025e3:	72 65                	jb     310264a <free@plt+0x13a>
 31025e5:	70 65                	jo     310264c <free@plt+0x13c>
 31025e7:	61                   	popa   
 31025e8:	74 00                	je     31025ea <free@plt+0xda>
 31025ea:	52                   	push   edx
 31025eb:	65 70 65             	gs jo  3102653 <free@plt+0x143>
 31025ee:	61                   	popa   
 31025ef:	74 20                	je     3102611 <free@plt+0x101>
 31025f1:	61                   	popa   
 31025f2:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 31025f5:	6d                   	ins    DWORD PTR es:[edi],dx
 31025f6:	6d                   	ins    DWORD PTR es:[edi],dx
 31025f7:	61                   	popa   
 31025f8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31025f9:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 31025fd:	74 69                	je     3102668 <free@plt+0x158>
 31025ff:	6d                   	ins    DWORD PTR es:[edi],dx
 3102600:	65 73 00             	gs jae 3102603 <free@plt+0xf3>
 3102603:	72 6d                	jb     3102672 <free@plt+0x162>
 3102605:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 3102608:	6d                   	ins    DWORD PTR es:[edi],dx
 3102609:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310260a:	76 65                	jbe    3102671 <free@plt+0x161>
 310260c:	20 61 20             	and    BYTE PTR [ecx+0x20],ah
 310260f:	66 69 6c 65 2f 64 69 	imul   bp,WORD PTR [ebp+eiz*2+0x2f],0x6964
 3102616:	72 65                	jb     310267d <free@plt+0x16d>
 3102618:	63 74 6f 72          	arpl   WORD PTR [edi+ebp*2+0x72],si
 310261c:	79 00                	jns    310261e <free@plt+0x10e>
 310261e:	73 65                	jae    3102685 <free@plt+0x175>
 3102620:	74 00                	je     3102622 <free@plt+0x112>
 3102622:	53                   	push   ebx
 3102623:	65 74 20             	gs je  3102646 <free@plt+0x136>
 3102626:	61                   	popa   
 3102627:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102628:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 310262b:	76 69                	jbe    3102696 <free@plt+0x186>
 310262d:	72 6f                	jb     310269e <free@plt+0x18e>
 310262f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102630:	6d                   	ins    DWORD PTR es:[edi],dx
 3102631:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3102633:	74 20                	je     3102655 <free@plt+0x145>
 3102635:	76 61                	jbe    3102698 <free@plt+0x188>
 3102637:	72 69                	jb     31026a2 <free@plt+0x192>
 3102639:	61                   	popa   
 310263a:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 310263e:	73 6c                	jae    31026ac <free@plt+0x19c>
 3102640:	65 65 70 00          	gs gs jo 3102644 <free@plt+0x134>
 3102644:	53                   	push   ebx
 3102645:	6c                   	ins    BYTE PTR es:[edi],dx
 3102646:	65 65 70 20          	gs gs jo 310266a <free@plt+0x15a>
 310264a:	66 6f                	outs   dx,WORD PTR ds:[esi]
 310264c:	72 20                	jb     310266e <free@plt+0x15e>
 310264e:	78 20                	js     3102670 <free@plt+0x160>
 3102650:	73 65                	jae    31026b7 <free@plt+0x1a7>
 3102652:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3102655:	64 73 00             	fs jae 3102658 <free@plt+0x148>
 3102658:	74 69                	je     31026c3 <free@plt+0x1b3>
 310265a:	6d                   	ins    DWORD PTR es:[edi],dx
 310265b:	65 00 00             	add    BYTE PTR gs:[eax],al
 310265e:	00 00                	add    BYTE PTR [eax],al
 3102660:	54                   	push   esp
 3102661:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 3102668:	72 6f                	jb     31026d9 <free@plt+0x1c9>
 310266a:	67 72 61             	addr16 jb 31026ce <free@plt+0x1be>
 310266d:	6d                   	ins    DWORD PTR es:[edi],dx
 310266e:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 3102671:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 3102678:	72 
 3102679:	75 6e                	jne    31026e9 <free@plt+0x1d9>
 310267b:	73 2e                	jae    31026ab <free@plt+0x19b>
 310267d:	0a 09                	or     cl,BYTE PTR [ecx]
 310267f:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 3102682:	61                   	popa   
 3102683:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 3102687:	74 69                	je     31026f2 <free@plt+0x1e2>
 3102689:	6d                   	ins    DWORD PTR es:[edi],dx
 310268a:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 310268e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310268f:	67 72 61             	addr16 jb 31026f3 <free@plt+0x1e3>
 3102692:	6d                   	ins    DWORD PTR es:[edi],dx
 3102693:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 3102696:	61                   	popa   
 3102697:	72 61                	jb     31026fa <free@plt+0x1ea>
 3102699:	6d                   	ins    DWORD PTR es:[edi],dx
 310269a:	65 74 65             	gs je  3102702 <free@plt+0x1f2>
 310269d:	72 73                	jb     3102712 <free@plt+0x202>
 310269f:	5d                   	pop    ebp
 31026a0:	00 1b                	add    BYTE PTR [ebx],bl
 31026a2:	5b                   	pop    ebx
 31026a3:	32 4a 00             	xor    cl,BYTE PTR [edx+0x0]
 31026a6:	25 73 0a 00 3d       	and    eax,0x3d000a73
 31026ab:	00 55 73             	add    BYTE PTR [ebp+0x73],dl
 31026ae:	61                   	popa   
 31026af:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 31026b3:	73 65                	jae    310271a <free@plt+0x20a>
 31026b5:	74 20                	je     31026d7 <free@plt+0x1c7>
 31026b7:	76 61                	jbe    310271a <free@plt+0x20a>
 31026b9:	72 69                	jb     3102724 <free@plt+0x214>
 31026bb:	61                   	popa   
 31026bc:	62 6c 65 3d          	bound  ebp,QWORD PTR [ebp+eiz*2+0x3d]
 31026c0:	76 61                	jbe    3102723 <free@plt+0x213>
 31026c2:	6c                   	ins    BYTE PTR es:[edi],dx
 31026c3:	75 65                	jne    310272a <free@plt+0x21a>
 31026c5:	0a 00                	or     al,BYTE PTR [eax]
 31026c7:	4c                   	dec    esp
 31026c8:	41                   	inc    ecx
 31026c9:	53                   	push   ebx
 31026ca:	54                   	push   esp
 31026cb:	45                   	inc    ebp
 31026cc:	58                   	pop    eax
 31026cd:	49                   	dec    ecx
 31026ce:	54                   	push   esp
 31026cf:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 31026d2:	72 6f                	jb     3102743 <free@plt+0x233>
 31026d4:	72 20                	jb     31026f6 <free@plt+0x1e6>
 31026d6:	65 78 65             	gs js  310273e <free@plt+0x22e>
 31026d9:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 31026dc:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 31026e3:	00 7c 00 00          	add    BYTE PTR [eax+eax*1+0x0],bh
 31026e7:	3c 00                	cmp    al,0x0
 31026e9:	3e 00 20             	add    BYTE PTR ds:[eax],ah
 31026ec:	00 0a                	add    BYTE PTR [edx],cl
 31026ee:	00 6b 65             	add    BYTE PTR [ebx+0x65],ch
 31026f1:	78 65                	js     3102758 <free@plt+0x248>
 31026f3:	63 3a                	arpl   WORD PTR [edx],di
 31026f5:	20 49 6e             	and    BYTE PTR [ecx+0x6e],cl
 31026f8:	76 61                	jbe    310275b <free@plt+0x24b>
 31026fa:	6c                   	ins    BYTE PTR es:[edi],dx
 31026fb:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 3102702:	61 
 3102703:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102704:	64 0a 00             	or     al,BYTE PTR fs:[eax]
 3102707:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 310270a:	76 61                	jbe    310276d <free@plt+0x25d>
 310270c:	6c                   	ins    BYTE PTR es:[edi],dx
 310270d:	69 64 20 70 61 74 68 	imul   esp,DWORD PTR [eax+eiz*1+0x70],0x20687461
 3102714:	20 
 3102715:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3102716:	72 20                	jb     3102738 <free@plt+0x228>
 3102718:	66 69 6c 65 6e 61 6d 	imul   bp,WORD PTR [ebp+eiz*2+0x6e],0x6d61
 310271f:	65 20 27             	and    BYTE PTR gs:[edi],ah
 3102722:	25 73 27 0a 00       	and    eax,0xa2773
 3102727:	00 6b 73             	add    BYTE PTR [ebx+0x73],ch
 310272a:	68 65 6c 6c 3a       	push   0x3a6c6c65
 310272f:	20 53 65             	and    BYTE PTR [ebx+0x65],dl
 3102732:	74 74                	je     31027a8 <free@plt+0x298>
 3102734:	69 6e 67 20 73 74 64 	imul   ebp,DWORD PTR [esi+0x67],0x64747320
 310273b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310273c:	75 74                	jne    31027b2 <free@plt+0x2a2>
 310273e:	20 66 6f             	and    BYTE PTR [esi+0x6f],ah
 3102741:	72 20                	jb     3102763 <free@plt+0x253>
 3102743:	25 73 20 74 6f       	and    eax,0x6f742073
 3102748:	20 30                	and    BYTE PTR [eax],dh
 310274a:	78 25                	js     3102771 <free@plt+0x261>
 310274c:	30 38                	xor    BYTE PTR [eax],bh
 310274e:	78 0a                	js     310275a <free@plt+0x24a>
 3102750:	00 00                	add    BYTE PTR [eax],al
 3102752:	00 00                	add    BYTE PTR [eax],al
 3102754:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3102758:	6c                   	ins    BYTE PTR es:[edi],dx
 3102759:	6c                   	ins    BYTE PTR es:[edi],dx
 310275a:	3a 20                	cmp    ah,BYTE PTR [eax]
 310275c:	53                   	push   ebx
 310275d:	65 74 74             	gs je  31027d4 <free@plt+0x2c4>
 3102760:	69 6e 67 20 73 74 64 	imul   ebp,DWORD PTR [esi+0x67],0x64747320
 3102767:	69 6e 20 66 6f 72 20 	imul   ebp,DWORD PTR [esi+0x20],0x20726f66
 310276e:	25 73 20 74 6f       	and    eax,0x6f742073
 3102773:	20 30                	and    BYTE PTR [eax],dh
 3102775:	78 25                	js     310279c <free@plt+0x28c>
 3102777:	30 38                	xor    BYTE PTR [eax],bh
 3102779:	78 0a                	js     3102785 <free@plt+0x275>
 310277b:	00 72 00             	add    BYTE PTR [edx+0x0],dh
 310277e:	00 00                	add    BYTE PTR [eax],al
 3102780:	52                   	push   edx
 3102781:	65 64 69 72 65 63 74 	gs imul esi,DWORD PTR fs:[edx+0x65],0x6f207463
 3102788:	20 6f 
 310278a:	66 20 69 6e          	data16 and BYTE PTR [ecx+0x6e],ch
 310278e:	70 75                	jo     3102805 <free@plt+0x2f5>
 3102790:	74 20                	je     31027b2 <free@plt+0x2a2>
 3102792:	66 61                	popaw  
 3102794:	69 6c 65 64 2c 20 63 	imul   ebp,DWORD PTR [ebp+eiz*2+0x64],0x6163202c
 310279b:	61 
 310279c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310279d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310279e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310279f:	74 20                	je     31027c1 <free@plt+0x2b1>
 31027a1:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 31027a4:	74 69                	je     310280f <free@plt+0x2ff>
 31027a6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31027a7:	75 65                	jne    310280e <free@plt+0x2fe>
 31027a9:	0a 00                	or     al,BYTE PTR [eax]
 31027ab:	31 00                	xor    DWORD PTR [eax],eax
 31027ad:	32 00                	xor    al,BYTE PTR [eax]
 31027af:	77 00                	ja     31027b1 <free@plt+0x2a1>
 31027b1:	46                   	inc    esi
 31027b2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31027b3:	72 6b                	jb     3102820 <free@plt+0x310>
 31027b5:	20 65 72             	and    BYTE PTR [ebp+0x72],ah
 31027b8:	72 6f                	jb     3102829 <free@plt+0x319>
 31027ba:	72 20                	jb     31027dc <free@plt+0x2cc>
 31027bc:	25 75 00 65 78       	and    eax,0x78650075
 31027c1:	65 63 3a             	arpl   WORD PTR gs:[edx],di
 31027c4:	20 43 61             	and    BYTE PTR [ebx+0x61],al
 31027c7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31027c8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31027c9:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31027ca:	74 20                	je     31027ec <free@plt+0x2dc>
 31027cc:	65 78 65             	gs js  3102834 <free@plt+0x324>
 31027cf:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 31027d2:	65 20 25 73 0a 00 2f 	and    BYTE PTR gs:0x2f000a73,ah
 31027d9:	00 49 6e             	add    BYTE PTR [ecx+0x6e],cl
 31027dc:	76 61                	jbe    310283f <free@plt+0x32f>
 31027de:	6c                   	ins    BYTE PTR es:[edi],dx
 31027df:	69 64 20 64 69 72 65 	imul   esp,DWORD PTR [eax+eiz*1+0x64],0x63657269
 31027e6:	63 
 31027e7:	74 6f                	je     3102858 <free@plt+0x348>
 31027e9:	72 79                	jb     3102864 <free@plt+0x354>
 31027eb:	20 27                	and    BYTE PTR [edi],ah
 31027ed:	25 73 27 0a 00       	and    eax,0xa2773
 31027f2:	43                   	inc    ebx
 31027f3:	57                   	push   edi
 31027f4:	44                   	inc    esp
 31027f5:	00 00                	add    BYTE PTR [eax],al
 31027f7:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 31027fa:	72 6f                	jb     310286b <free@plt+0x35b>
 31027fc:	72 3a                	jb     3102838 <free@plt+0x328>
 31027fe:	20 54 68 65          	and    BYTE PTR [eax+ebp*2+0x65],dl
 3102802:	20 74 69 6d          	and    BYTE PTR [ecx+ebp*2+0x6d],dh
 3102806:	65 20 63 6f          	and    BYTE PTR gs:[ebx+0x6f],ah
 310280a:	6d                   	ins    DWORD PTR es:[edi],dx
 310280b:	6d                   	ins    DWORD PTR es:[edi],dx
 310280c:	61                   	popa   
 310280d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310280e:	64 20 72 65          	and    BYTE PTR fs:[edx+0x65],dh
 3102812:	71 75                	jno    3102889 <free@plt+0x379>
 3102814:	69 72 65 73 20 74 68 	imul   esi,DWORD PTR [edx+0x65],0x68742073
 310281b:	65 20 6e 61          	and    BYTE PTR gs:[esi+0x61],ch
 310281f:	6d                   	ins    DWORD PTR es:[edi],dx
 3102820:	65 20 6f 66          	and    BYTE PTR gs:[edi+0x66],ch
 3102824:	20 61 6e             	and    BYTE PTR [ecx+0x6e],ah
 3102827:	20 61 70             	and    BYTE PTR [ecx+0x70],ah
 310282a:	70 6c                	jo     3102898 <free@plt+0x388>
 310282c:	69 63 61 74 69 6f 6e 	imul   esp,DWORD PTR [ebx+0x61],0x6e6f6974
 3102833:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
 3102837:	62 65 20             	bound  esp,QWORD PTR [ebp+0x20]
 310283a:	65 78 65             	gs js  31028a2 <free@plt+0x392>
 310283d:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3102840:	65 64 2c 20          	gs fs sub al,0x20
 3102844:	61                   	popa   
 3102845:	73 20                	jae    3102867 <free@plt+0x357>
 3102847:	69 6e 70 75 74 2e 0a 	imul   ebp,DWORD PTR [esi+0x70],0xa2e7475
 310284e:	00 0a                	add    BYTE PTR [edx],cl
 3102850:	25 75 20 74 69       	and    eax,0x69742075
 3102855:	63 6b 73             	arpl   WORD PTR [ebx+0x73],bp
 3102858:	0a 00                	or     al,BYTE PTR [eax]
 310285a:	00 00                	add    BYTE PTR [eax],al
 310285c:	0a 2a                	or     ch,BYTE PTR [edx]
 310285e:	2a 2a                	sub    ch,BYTE PTR [edx]
 3102860:	2a 2a                	sub    ch,BYTE PTR [edx]
 3102862:	2a 2a                	sub    ch,BYTE PTR [edx]
 3102864:	2a 2a                	sub    ch,BYTE PTR [edx]
 3102866:	2a 2a                	sub    ch,BYTE PTR [edx]
 3102868:	2a 2a                	sub    ch,BYTE PTR [edx]
 310286a:	2a 2a                	sub    ch,BYTE PTR [edx]
 310286c:	20 52 45             	and    BYTE PTR [edx+0x45],dl
 310286f:	50                   	push   eax
 3102870:	45                   	inc    ebp
 3102871:	41                   	inc    ecx
 3102872:	54                   	push   esp
 3102873:	20 45 58             	and    BYTE PTR [ebp+0x58],al
 3102876:	45                   	inc    ebp
 3102877:	43                   	inc    ebx
 3102878:	55                   	push   ebp
 3102879:	54                   	push   esp
 310287a:	49                   	dec    ecx
 310287b:	4f                   	dec    edi
 310287c:	4e                   	dec    esi
 310287d:	20 23                	and    BYTE PTR [ebx],ah
 310287f:	25 75 20 6f 66       	and    eax,0x666f2075
 3102884:	20 25 75 20 2a 2a    	and    BYTE PTR ds:0x2a2a2075,ah
 310288a:	2a 2a                	sub    ch,BYTE PTR [edx]
 310288c:	2a 2a                	sub    ch,BYTE PTR [edx]
 310288e:	2a 2a                	sub    ch,BYTE PTR [edx]
 3102890:	2a 2a                	sub    ch,BYTE PTR [edx]
 3102892:	2a 2a                	sub    ch,BYTE PTR [edx]
 3102894:	2a 2a                	sub    ch,BYTE PTR [edx]
 3102896:	2a 0a                	sub    cl,BYTE PTR [edx]
 3102898:	00 48 65             	add    BYTE PTR [eax+0x65],cl
 310289b:	6c                   	ins    BYTE PTR es:[edi],dx
 310289c:	70 3a                	jo     31028d8 <free@plt+0x3c8>
 310289e:	20 25 73 0a 00 09    	and    BYTE PTR ds:0x9000a73,ah
 31028a4:	25 73 3a 20 25       	and    eax,0x25203a73
 31028a9:	73 0a                	jae    31028b5 <free@plt+0x3a5>
 31028ab:	00 75 68             	add    BYTE PTR [ebp+0x68],dh
 31028ae:	20 6f 68             	and    BYTE PTR [edi+0x68],ch
 31028b1:	21 00                	and    DWORD PTR [eax],eax
 31028b3:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 31028b6:	71 75                	jno    310292d <free@plt+0x41d>
 31028b8:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 31028bf:	70 61                	jo     3102922 <free@plt+0x412>
 31028c1:	72 61                	jb     3102924 <free@plt+0x414>
 31028c3:	6d                   	ins    DWORD PTR es:[edi],dx
 31028c4:	65 74 65             	gs je  310292c <free@plt+0x41c>
 31028c7:	72 20                	jb     31028e9 <free@plt+0x3d9>
 31028c9:	77 68                	ja     3102933 <free@plt+0x423>
 31028cb:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 31028d2:	74 68                	je     310293c <free@plt+0x42c>
 31028d4:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 31028d8:	6d                   	ins    DWORD PTR es:[edi],dx
 31028d9:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 31028dc:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 31028df:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 31028e2:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 31028e5:	64 73 20             	fs jae 3102908 <free@plt+0x3f8>
 31028e8:	74 6f                	je     3102959 <free@plt+0x449>
 31028ea:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 31028ed:	65 65 70 0a          	gs gs jo 31028fb <free@plt+0x3eb>
 31028f1:	00 72 6d             	add    BYTE PTR [edx+0x6d],dh
 31028f4:	3a 20                	cmp    ah,BYTE PTR [eax]
 31028f6:	49                   	dec    ecx
 31028f7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31028f8:	76 61                	jbe    310295b <free@plt+0x44b>
 31028fa:	6c                   	ins    BYTE PTR es:[edi],dx
 31028fb:	69 64 20 66 69 6c 65 	imul   esp,DWORD PTR [eax+eiz*1+0x66],0x6e656c69
 3102902:	6e 
 3102903:	61                   	popa   
 3102904:	6d                   	ins    DWORD PTR es:[edi],dx
 3102905:	65 20 25 73 0a 00 00 	and    BYTE PTR gs:0xa73,ah
 310290c:	63 64 00 43          	arpl   WORD PTR [eax+eax*1+0x43],sp
 3102910:	68 61 6e 67 65       	push   0x65676e61
 3102915:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 3102919:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 310291e:	79 00                	jns    3102920 <free@plt+0x410>
 3102920:	63 6c 65 61          	arpl   WORD PTR [ebp+eiz*2+0x61],bp
 3102924:	72 00                	jb     3102926 <free@plt+0x416>
 3102926:	43                   	inc    ebx
 3102927:	6c                   	ins    BYTE PTR es:[edi],dx
 3102928:	65 61                	gs popa 
 310292a:	72 20                	jb     310294c <free@plt+0x43c>
 310292c:	74 68                	je     3102996 <free@plt+0x486>
 310292e:	65 20 73 63          	and    BYTE PTR gs:[ebx+0x63],dh
 3102932:	72 65                	jb     3102999 <free@plt+0x489>
 3102934:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3102936:	00 64 75 6d          	add    BYTE PTR [ebp+esi*2+0x6d],ah
 310293a:	70 00                	jo     310293c <free@plt+0x42c>
 310293c:	44                   	inc    esp
 310293d:	75 6d                	jne    31029ac <free@plt+0x49c>
 310293f:	70 20                	jo     3102961 <free@plt+0x451>
 3102941:	6b 65 72 6e          	imul   esp,DWORD PTR [ebp+0x72],0x6e
 3102945:	65 6c                	gs ins BYTE PTR es:[edi],dx
 3102947:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 310294a:	66 6f                	outs   dx,WORD PTR ds:[esi]
 310294c:	20 74 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],dh
 3102950:	6c                   	ins    BYTE PTR es:[edi],dx
 3102951:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3102952:	67 00 65 6e          	add    BYTE PTR [di+0x6e],ah
 3102956:	76 00                	jbe    3102958 <free@plt+0x448>
 3102958:	50                   	push   eax
 3102959:	72 69                	jb     31029c4 <free@plt+0x4b4>
 310295b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310295c:	74 20                	je     310297e <free@plt+0x46e>
 310295e:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3102960:	76 69                	jbe    31029cb <free@plt+0x4bb>
 3102962:	72 6f                	jb     31029d3 <free@plt+0x4c3>
 3102964:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102965:	6d                   	ins    DWORD PTR es:[edi],dx
 3102966:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3102968:	74 00                	je     310296a <free@plt+0x45a>
 310296a:	65 78 65             	gs js  31029d2 <free@plt+0x4c2>
 310296d:	63 00                	arpl   WORD PTR [eax],ax
 310296f:	45                   	inc    ebp
 3102970:	78 65                	js     31029d7 <free@plt+0x4c7>
 3102972:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3102975:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3102979:	70 72                	jo     31029ed <free@plt+0x4dd>
 310297b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310297c:	67 72 61             	addr16 jb 31029e0 <free@plt+0x4d0>
 310297f:	6d                   	ins    DWORD PTR es:[edi],dx
 3102980:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3102983:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 310298a:	20 
 310298b:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 310298f:	6c                   	ins    BYTE PTR es:[edi],dx
 3102990:	6c                   	ins    BYTE PTR es:[edi],dx
 3102991:	00 68 65             	add    BYTE PTR [eax+0x65],ch
 3102994:	6c                   	ins    BYTE PTR es:[edi],dx
 3102995:	70 00                	jo     3102997 <free@plt+0x487>
 3102997:	47                   	inc    edi
 3102998:	65 74 20             	gs je  31029bb <free@plt+0x4ab>
 310299b:	68 65 6c 70 20       	push   0x20706c65
 31029a0:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 31029a4:	73 20                	jae    31029c6 <free@plt+0x4b6>
 31029a6:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 31029ad:	74 69                	je     3102a18 <free@plt+0x508>
 31029af:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31029b0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31029b1:	29 00                	sub    DWORD PTR [eax],eax
 31029b3:	70 77                	jo     3102a2c <free@plt+0x51c>
 31029b5:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 31029b9:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 31029c0:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 31029c4:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 31029c8:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 31029cd:	79 00                	jns    31029cf <free@plt+0x4bf>
 31029cf:	72 65                	jb     3102a36 <free@plt+0x526>
 31029d1:	70 65                	jo     3102a38 <free@plt+0x528>
 31029d3:	61                   	popa   
 31029d4:	74 00                	je     31029d6 <free@plt+0x4c6>
 31029d6:	52                   	push   edx
 31029d7:	65 70 65             	gs jo  3102a3f <free@plt+0x52f>
 31029da:	61                   	popa   
 31029db:	74 20                	je     31029fd <free@plt+0x4ed>
 31029dd:	61                   	popa   
 31029de:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
 31029e1:	6d                   	ins    DWORD PTR es:[edi],dx
 31029e2:	6d                   	ins    DWORD PTR es:[edi],dx
 31029e3:	61                   	popa   
 31029e4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31029e5:	64 20 78 20          	and    BYTE PTR fs:[eax+0x20],bh
 31029e9:	74 69                	je     3102a54 <free@plt+0x544>
 31029eb:	6d                   	ins    DWORD PTR es:[edi],dx
 31029ec:	65 73 00             	gs jae 31029ef <free@plt+0x4df>
 31029ef:	72 6d                	jb     3102a5e <free@plt+0x54e>
 31029f1:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 31029f4:	6d                   	ins    DWORD PTR es:[edi],dx
 31029f5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31029f6:	76 65                	jbe    3102a5d <free@plt+0x54d>
 31029f8:	20 61 20             	and    BYTE PTR [ecx+0x20],ah
 31029fb:	66 69 6c 65 2f 64 69 	imul   bp,WORD PTR [ebp+eiz*2+0x2f],0x6964
 3102a02:	72 65                	jb     3102a69 <free@plt+0x559>
 3102a04:	63 74 6f 72          	arpl   WORD PTR [edi+ebp*2+0x72],si
 3102a08:	79 00                	jns    3102a0a <free@plt+0x4fa>
 3102a0a:	73 65                	jae    3102a71 <free@plt+0x561>
 3102a0c:	74 00                	je     3102a0e <free@plt+0x4fe>
 3102a0e:	53                   	push   ebx
 3102a0f:	65 74 20             	gs je  3102a32 <free@plt+0x522>
 3102a12:	61                   	popa   
 3102a13:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102a14:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
 3102a17:	76 69                	jbe    3102a82 <free@plt+0x572>
 3102a19:	72 6f                	jb     3102a8a <free@plt+0x57a>
 3102a1b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102a1c:	6d                   	ins    DWORD PTR es:[edi],dx
 3102a1d:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3102a1f:	74 20                	je     3102a41 <free@plt+0x531>
 3102a21:	76 61                	jbe    3102a84 <free@plt+0x574>
 3102a23:	72 69                	jb     3102a8e <free@plt+0x57e>
 3102a25:	61                   	popa   
 3102a26:	62 6c 65 00          	bound  ebp,QWORD PTR [ebp+eiz*2+0x0]
 3102a2a:	73 6c                	jae    3102a98 <free@plt+0x588>
 3102a2c:	65 65 70 00          	gs gs jo 3102a30 <free@plt+0x520>
 3102a30:	53                   	push   ebx
 3102a31:	6c                   	ins    BYTE PTR es:[edi],dx
 3102a32:	65 65 70 20          	gs gs jo 3102a56 <free@plt+0x546>
 3102a36:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3102a38:	72 20                	jb     3102a5a <free@plt+0x54a>
 3102a3a:	78 20                	js     3102a5c <free@plt+0x54c>
 3102a3c:	73 65                	jae    3102aa3 <free@plt+0x593>
 3102a3e:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3102a41:	64 73 00             	fs jae 3102a44 <free@plt+0x534>
 3102a44:	74 69                	je     3102aaf <free@plt+0x59f>
 3102a46:	6d                   	ins    DWORD PTR es:[edi],dx
 3102a47:	65 00 00             	add    BYTE PTR gs:[eax],al
 3102a4a:	00 00                	add    BYTE PTR [eax],al
 3102a4c:	54                   	push   esp
 3102a4d:	69 6d 65 20 61 20 70 	imul   ebp,DWORD PTR [ebp+0x65],0x70206120
 3102a54:	72 6f                	jb     3102ac5 <free@plt+0x5b5>
 3102a56:	67 72 61             	addr16 jb 3102aba <free@plt+0x5aa>
 3102a59:	6d                   	ins    DWORD PTR es:[edi],dx
 3102a5a:	20 77 68             	and    BYTE PTR [edi+0x68],dh
 3102a5d:	69 6c 65 20 69 74 20 	imul   ebp,DWORD PTR [ebp+eiz*2+0x20],0x72207469
 3102a64:	72 
 3102a65:	75 6e                	jne    3102ad5 <free@plt+0x5c5>
 3102a67:	73 2e                	jae    3102a97 <free@plt+0x587>
 3102a69:	0a 09                	or     cl,BYTE PTR [ecx]
 3102a6b:	09 55 73             	or     DWORD PTR [ebp+0x73],edx
 3102a6e:	61                   	popa   
 3102a6f:	67 65 3a 20          	cmp    ah,BYTE PTR gs:[bx+si]
 3102a73:	74 69                	je     3102ade <free@plt+0x5ce>
 3102a75:	6d                   	ins    DWORD PTR es:[edi],dx
 3102a76:	65 20 70 72          	and    BYTE PTR gs:[eax+0x72],dh
 3102a7a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3102a7b:	67 72 61             	addr16 jb 3102adf <free@plt+0x5cf>
 3102a7e:	6d                   	ins    DWORD PTR es:[edi],dx
 3102a7f:	20 5b 70             	and    BYTE PTR [ebx+0x70],bl
 3102a82:	61                   	popa   
 3102a83:	72 61                	jb     3102ae6 <free@plt+0x5d6>
 3102a85:	6d                   	ins    DWORD PTR es:[edi],dx
 3102a86:	65 74 65             	gs je  3102aee <free@plt+0x5de>
 3102a89:	72 73                	jb     3102afe <free@plt+0x5ee>
 3102a8b:	5d                   	pop    ebp
 3102a8c:	00 25 73 24 20 00    	add    BYTE PTR ds:0x202473,ah
 3102a92:	25 73 00 20 09       	and    eax,0x9200073
 3102a97:	0a 2d 2c 00 6b 53    	or     ch,BYTE PTR ds:0x536b002c
 3102a9d:	68 65 6c 6c 00       	push   0x6c6c65
 3102aa2:	2f                   	das    
 3102aa3:	2e 6b 72 63 00       	imul   esi,DWORD PTR cs:[edx+0x63],0x0
 3102aa8:	72 00                	jb     3102aaa <free@plt+0x59a>
 3102aaa:	43                   	inc    ebx
 3102aab:	61                   	popa   
 3102aac:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102aad:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102aae:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3102aaf:	74 20                	je     3102ad1 <free@plt+0x5c1>
 3102ab1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3102ab2:	70 65                	jo     3102b19 <free@plt+0x609>
 3102ab4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102ab5:	20 73 63             	and    BYTE PTR [ebx+0x63],dh
 3102ab8:	72 69                	jb     3102b23 <free@plt+0x613>
 3102aba:	70 74                	jo     3102b30 <free@plt+0x620>
 3102abc:	20 66 69             	and    BYTE PTR [esi+0x69],ah
 3102abf:	6c                   	ins    BYTE PTR es:[edi],dx
 3102ac0:	65 20 25 73 00 43 57 	and    BYTE PTR gs:0x57430073,ah
 3102ac7:	44                   	inc    esp
 3102ac8:	00 0a                	add    BYTE PTR [edx],cl
 3102aca:	00 1b                	add    BYTE PTR [ebx],bl
 3102acc:	5b                   	pop    ebx
 3102acd:	31 44 20 1b          	xor    DWORD PTR [eax+eiz*1+0x1b],eax
 3102ad1:	5b                   	pop    ebx
 3102ad2:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 3102ad6:	5b                   	pop    ebx
 3102ad7:	31 44 00 1b          	xor    DWORD PTR [eax+eax*1+0x1b],eax
 3102adb:	5b                   	pop    ebx
 3102adc:	31 43 00             	xor    DWORD PTR [ebx+0x0],eax
 3102adf:	25                   	.byte 0x25
 3102ae0:	63 00                	arpl   WORD PTR [eax],ax

Disassembly of section .eh_frame:

03102ae4 <.eh_frame>:
 3102ae4:	14 00                	adc    al,0x0
 3102ae6:	00 00                	add    BYTE PTR [eax],al
 3102ae8:	00 00                	add    BYTE PTR [eax],al
 3102aea:	00 00                	add    BYTE PTR [eax],al
 3102aec:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3102aef:	00 01                	add    BYTE PTR [ecx],al
 3102af1:	7c 08                	jl     3102afb <free@plt+0x5eb>
 3102af3:	01 1b                	add    DWORD PTR [ebx],ebx
 3102af5:	0c 04                	or     al,0x4
 3102af7:	04 88                	add    al,0x88
 3102af9:	01 00                	add    DWORD PTR [eax],eax
 3102afb:	00 20                	add    BYTE PTR [eax],ah
 3102afd:	00 00                	add    BYTE PTR [eax],al
 3102aff:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102b02:	00 00                	add    BYTE PTR [eax],al
 3102b04:	fc                   	cld    
 3102b05:	d4 ff                	aam    0xff
 3102b07:	ff 2f                	jmp    FWORD PTR [edi]
 3102b09:	00 00                	add    BYTE PTR [eax],al
 3102b0b:	00 00                	add    BYTE PTR [eax],al
 3102b0d:	45                   	inc    ebp
 3102b0e:	0e                   	push   cs
 3102b0f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102b15:	44                   	inc    esp
 3102b16:	83 03 63             	add    DWORD PTR [ebx],0x63
 3102b19:	c5 c3 0c             	(bad)
 3102b1c:	04 04                	add    al,0x4
 3102b1e:	00 00                	add    BYTE PTR [eax],al
 3102b20:	20 00                	and    BYTE PTR [eax],al
 3102b22:	00 00                	add    BYTE PTR [eax],al
 3102b24:	40                   	inc    eax
 3102b25:	00 00                	add    BYTE PTR [eax],al
 3102b27:	00 07                	add    BYTE PTR [edi],al
 3102b29:	d5 ff                	aad    0xff
 3102b2b:	ff 6b 00             	jmp    FWORD PTR [ebx+0x0]
 3102b2e:	00 00                	add    BYTE PTR [eax],al
 3102b30:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102b33:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102b39:	44                   	inc    esp
 3102b3a:	83 03 02             	add    DWORD PTR [ebx],0x2
 3102b3d:	5f                   	pop    edi
 3102b3e:	c5 c3 0c             	(bad)
 3102b41:	04 04                	add    al,0x4
 3102b43:	00 20                	add    BYTE PTR [eax],ah
 3102b45:	00 00                	add    BYTE PTR [eax],al
 3102b47:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
 3102b4b:	00 4e d5             	add    BYTE PTR [esi-0x2b],cl
 3102b4e:	ff                   	(bad)  
 3102b4f:	ff 70 01             	push   DWORD PTR [eax+0x1]
 3102b52:	00 00                	add    BYTE PTR [eax],al
 3102b54:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102b57:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102b5d:	47                   	inc    edi
 3102b5e:	83 03 03             	add    DWORD PTR [ebx],0x3
 3102b61:	61                   	popa   
 3102b62:	01 c5                	add    ebp,eax
 3102b64:	c3                   	ret    
 3102b65:	0c 04                	or     al,0x4
 3102b67:	04 20                	add    al,0x20
 3102b69:	00 00                	add    BYTE PTR [eax],al
 3102b6b:	00 88 00 00 00 9a    	add    BYTE PTR [eax-0x66000000],cl
 3102b71:	d6                   	(bad)  
 3102b72:	ff                   	(bad)  
 3102b73:	ff aa 00 00 00 00    	jmp    FWORD PTR [edx+0x0]
 3102b79:	45                   	inc    ebp
 3102b7a:	0e                   	push   cs
 3102b7b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102b81:	44                   	inc    esp
 3102b82:	83 03 02             	add    DWORD PTR [ebx],0x2
 3102b85:	9e                   	sahf   
 3102b86:	c5 c3 0c             	(bad)
 3102b89:	04 04                	add    al,0x4
 3102b8b:	00 20                	add    BYTE PTR [eax],ah
 3102b8d:	00 00                	add    BYTE PTR [eax],al
 3102b8f:	00 ac 00 00 00 20 d7 	add    BYTE PTR [eax+eax*1-0x28e00000],ch
 3102b96:	ff                   	(bad)  
 3102b97:	ff b7 06 00 00 00    	push   DWORD PTR [edi+0x6]
 3102b9d:	45                   	inc    ebp
 3102b9e:	0e                   	push   cs
 3102b9f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102ba5:	47                   	inc    edi
 3102ba6:	83 03 03             	add    DWORD PTR [ebx],0x3
 3102ba9:	a8 06                	test   al,0x6
 3102bab:	c5 c3 0c             	(bad)
 3102bae:	04 04                	add    al,0x4
 3102bb0:	20 00                	and    BYTE PTR [eax],al
 3102bb2:	00 00                	add    BYTE PTR [eax],al
 3102bb4:	d0 00                	rol    BYTE PTR [eax],1
 3102bb6:	00 00                	add    BYTE PTR [eax],al
 3102bb8:	b3 dd                	mov    bl,0xdd
 3102bba:	ff                   	(bad)  
 3102bbb:	ff                   	(bad)  
 3102bbc:	fc                   	cld    
 3102bbd:	00 00                	add    BYTE PTR [eax],al
 3102bbf:	00 00                	add    BYTE PTR [eax],al
 3102bc1:	45                   	inc    ebp
 3102bc2:	0e                   	push   cs
 3102bc3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102bc9:	44                   	inc    esp
 3102bca:	83 03 02             	add    DWORD PTR [ebx],0x2
 3102bcd:	f0 c5 c3 0c          	(bad)
 3102bd1:	04 04                	add    al,0x4
 3102bd3:	00 20                	add    BYTE PTR [eax],ah
 3102bd5:	00 00                	add    BYTE PTR [eax],al
 3102bd7:	00 f4                	add    ah,dh
 3102bd9:	00 00                	add    BYTE PTR [eax],al
 3102bdb:	00 8b de ff ff 86    	add    BYTE PTR [ebx-0x79000022],cl
 3102be1:	00 00                	add    BYTE PTR [eax],al
 3102be3:	00 00                	add    BYTE PTR [eax],al
 3102be5:	45                   	inc    ebp
 3102be6:	0e                   	push   cs
 3102be7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102bed:	44                   	inc    esp
 3102bee:	83 03 02             	add    DWORD PTR [ebx],0x2
 3102bf1:	7a c5                	jp     3102bb8 <free@plt+0x6a8>
 3102bf3:	c3                   	ret    
 3102bf4:	0c 04                	or     al,0x4
 3102bf6:	04 00                	add    al,0x0
 3102bf8:	20 00                	and    BYTE PTR [eax],al
 3102bfa:	00 00                	add    BYTE PTR [eax],al
 3102bfc:	18 01                	sbb    BYTE PTR [ecx],al
 3102bfe:	00 00                	add    BYTE PTR [eax],al
 3102c00:	ed                   	in     eax,dx
 3102c01:	de ff                	fdivp  st(7),st
 3102c03:	ff                   	(bad)  
 3102c04:	de 00                	fiadd  WORD PTR [eax]
 3102c06:	00 00                	add    BYTE PTR [eax],al
 3102c08:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102c0b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102c11:	44                   	inc    esp
 3102c12:	83 03 02             	add    DWORD PTR [ebx],0x2
 3102c15:	d2 c5                	rol    ch,cl
 3102c17:	c3                   	ret    
 3102c18:	0c 04                	or     al,0x4
 3102c1a:	04 00                	add    al,0x0
 3102c1c:	1c 00                	sbb    al,0x0
 3102c1e:	00 00                	add    BYTE PTR [eax],al
 3102c20:	3c 01                	cmp    al,0x1
 3102c22:	00 00                	add    BYTE PTR [eax],al
 3102c24:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
 3102c25:	df ff                	(bad)  
 3102c27:	ff 28                	jmp    FWORD PTR [eax]
 3102c29:	00 00                	add    BYTE PTR [eax],al
 3102c2b:	00 00                	add    BYTE PTR [eax],al
 3102c2d:	45                   	inc    ebp
 3102c2e:	0e                   	push   cs
 3102c2f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102c35:	60                   	pusha  
 3102c36:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102c39:	04 00                	add    al,0x0
 3102c3b:	00 20                	add    BYTE PTR [eax],ah
 3102c3d:	00 00                	add    BYTE PTR [eax],al
 3102c3f:	00 5c 01 00          	add    BYTE PTR [ecx+eax*1+0x0],bl
 3102c43:	00 af df ff ff 72    	add    BYTE PTR [edi+0x72ffffdf],ch
 3102c49:	00 00                	add    BYTE PTR [eax],al
 3102c4b:	00 00                	add    BYTE PTR [eax],al
 3102c4d:	45                   	inc    ebp
 3102c4e:	0e                   	push   cs
 3102c4f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102c55:	47                   	inc    edi
 3102c56:	83 03 02             	add    DWORD PTR [ebx],0x2
 3102c59:	63 c5                	arpl   bp,ax
 3102c5b:	c3                   	ret    
 3102c5c:	0c 04                	or     al,0x4
 3102c5e:	04 00                	add    al,0x0
 3102c60:	20 00                	and    BYTE PTR [eax],al
 3102c62:	00 00                	add    BYTE PTR [eax],al
 3102c64:	80 01 00             	add    BYTE PTR [ecx],0x0
 3102c67:	00 fd                	add    ch,bh
 3102c69:	df ff                	(bad)  
 3102c6b:	ff                   	(bad)  
 3102c6c:	f9                   	stc    
 3102c6d:	00 00                	add    BYTE PTR [eax],al
 3102c6f:	00 00                	add    BYTE PTR [eax],al
 3102c71:	45                   	inc    ebp
 3102c72:	0e                   	push   cs
 3102c73:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102c79:	44                   	inc    esp
 3102c7a:	83 03 02             	add    DWORD PTR [ebx],0x2
 3102c7d:	ed                   	in     eax,dx
 3102c7e:	c5 c3 0c             	(bad)
 3102c81:	04 04                	add    al,0x4
 3102c83:	00 20                	add    BYTE PTR [eax],ah
 3102c85:	00 00                	add    BYTE PTR [eax],al
 3102c87:	00 a4 01 00 00 d2 e0 	add    BYTE PTR [ecx+eax*1-0x1f2e0000],ah
 3102c8e:	ff                   	(bad)  
 3102c8f:	ff 63 00             	jmp    DWORD PTR [ebx+0x0]
 3102c92:	00 00                	add    BYTE PTR [eax],al
 3102c94:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102c97:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102c9d:	44                   	inc    esp
 3102c9e:	83 03 02             	add    DWORD PTR [ebx],0x2
 3102ca1:	57                   	push   edi
 3102ca2:	c5 c3 0c             	(bad)
 3102ca5:	04 04                	add    al,0x4
 3102ca7:	00 28                	add    BYTE PTR [eax],ch
 3102ca9:	00 00                	add    BYTE PTR [eax],al
 3102cab:	00 c8                	add    al,cl
 3102cad:	01 00                	add    DWORD PTR [eax],eax
 3102caf:	00 11                	add    BYTE PTR [ecx],dl
 3102cb1:	e1 ff                	loope  3102cb2 <free@plt+0x7a2>
 3102cb3:	ff 60 01             	jmp    DWORD PTR [eax+0x1]
 3102cb6:	00 00                	add    BYTE PTR [eax],al
 3102cb8:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102cbb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102cc1:	48                   	dec    eax
 3102cc2:	86 03                	xchg   BYTE PTR [ebx],al
 3102cc4:	83 04 03 4e          	add    DWORD PTR [ebx+eax*1],0x4e
 3102cc8:	01 c3                	add    ebx,eax
 3102cca:	41                   	inc    ecx
 3102ccb:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
 3102ccf:	04 04                	add    al,0x4
 3102cd1:	00 00                	add    BYTE PTR [eax],al
 3102cd3:	00 20                	add    BYTE PTR [eax],ah
 3102cd5:	00 00                	add    BYTE PTR [eax],al
 3102cd7:	00 f4                	add    ah,dh
 3102cd9:	01 00                	add    DWORD PTR [eax],eax
 3102cdb:	00 45 e2             	add    BYTE PTR [ebp-0x1e],al
 3102cde:	ff                   	(bad)  
 3102cdf:	ff 23                	jmp    DWORD PTR [ebx]
 3102ce1:	00 00                	add    BYTE PTR [eax],al
 3102ce3:	00 00                	add    BYTE PTR [eax],al
 3102ce5:	45                   	inc    ebp
 3102ce6:	0e                   	push   cs
 3102ce7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102ced:	44                   	inc    esp
 3102cee:	83 03 56             	add    DWORD PTR [ebx],0x56
 3102cf1:	c3                   	ret    
 3102cf2:	41                   	inc    ecx
 3102cf3:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102cf6:	04 00                	add    al,0x0
 3102cf8:	20 00                	and    BYTE PTR [eax],al
 3102cfa:	00 00                	add    BYTE PTR [eax],al
 3102cfc:	18 02                	sbb    BYTE PTR [edx],al
 3102cfe:	00 00                	add    BYTE PTR [eax],al
 3102d00:	44                   	inc    esp
 3102d01:	e2 ff                	loop   3102d02 <free@plt+0x7f2>
 3102d03:	ff 6b 00             	jmp    FWORD PTR [ebx+0x0]
 3102d06:	00 00                	add    BYTE PTR [eax],al
 3102d08:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102d0b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102d11:	44                   	inc    esp
 3102d12:	83 03 02             	add    DWORD PTR [ebx],0x2
 3102d15:	5f                   	pop    edi
 3102d16:	c5 c3 0c             	(bad)
 3102d19:	04 04                	add    al,0x4
 3102d1b:	00 10                	add    BYTE PTR [eax],dl
 3102d1d:	00 00                	add    BYTE PTR [eax],al
 3102d1f:	00 3c 02             	add    BYTE PTR [edx+eax*1],bh
 3102d22:	00 00                	add    BYTE PTR [eax],al
 3102d24:	62 f2 ff ff 04       	(bad)  {k7}{z}
 3102d29:	00 00                	add    BYTE PTR [eax],al
 3102d2b:	00 00                	add    BYTE PTR [eax],al
 3102d2d:	00 00                	add    BYTE PTR [eax],al
 3102d2f:	00 10                	add    BYTE PTR [eax],dl
 3102d31:	00 00                	add    BYTE PTR [eax],al
 3102d33:	00 50 02             	add    BYTE PTR [eax+0x2],dl
 3102d36:	00 00                	add    BYTE PTR [eax],al
 3102d38:	52                   	push   edx
 3102d39:	f2 ff                	repnz (bad) 
 3102d3b:	ff 04 00             	inc    DWORD PTR [eax+eax*1]
 3102d3e:	00 00                	add    BYTE PTR [eax],al
 3102d40:	00 00                	add    BYTE PTR [eax],al
 3102d42:	00 00                	add    BYTE PTR [eax],al
 3102d44:	1c 00                	sbb    al,0x0
 3102d46:	00 00                	add    BYTE PTR [eax],al
 3102d48:	64 02 00             	add    al,BYTE PTR fs:[eax]
 3102d4b:	00 63 e2             	add    BYTE PTR [ebx-0x1e],ah
 3102d4e:	ff                   	(bad)  
 3102d4f:	ff 14 00             	call   DWORD PTR [eax+eax*1]
 3102d52:	00 00                	add    BYTE PTR [eax],al
 3102d54:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102d57:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102d5d:	4c                   	dec    esp
 3102d5e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102d61:	04 00                	add    al,0x0
 3102d63:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102d66:	00 00                	add    BYTE PTR [eax],al
 3102d68:	84 02                	test   BYTE PTR [edx],al
 3102d6a:	00 00                	add    BYTE PTR [eax],al
 3102d6c:	57                   	push   edi
 3102d6d:	e2 ff                	loop   3102d6e <free@plt+0x85e>
 3102d6f:	ff                   	(bad)  
 3102d70:	3e 00 00             	add    BYTE PTR ds:[eax],al
 3102d73:	00 00                	add    BYTE PTR [eax],al
 3102d75:	45                   	inc    ebp
 3102d76:	0e                   	push   cs
 3102d77:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102d7d:	76 c5                	jbe    3102d44 <free@plt+0x834>
 3102d7f:	0c 04                	or     al,0x4
 3102d81:	04 00                	add    al,0x0
 3102d83:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
 3102d86:	00 00                	add    BYTE PTR [eax],al
 3102d88:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 3102d89:	02 00                	add    al,BYTE PTR [eax]
 3102d8b:	00 75 e2             	add    BYTE PTR [ebp-0x1e],dh
 3102d8e:	ff                   	(bad)  
 3102d8f:	ff 52 01             	call   DWORD PTR [edx+0x1]
 3102d92:	00 00                	add    BYTE PTR [eax],al
 3102d94:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102d97:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102d9d:	46                   	inc    esi
 3102d9e:	87 03                	xchg   DWORD PTR [ebx],eax
 3102da0:	86 04 83             	xchg   BYTE PTR [ebx+eax*4],al
 3102da3:	05 03 41 01 c3       	add    eax,0xc3014103
 3102da8:	41                   	inc    ecx
 3102da9:	c6 41 c7 41          	mov    BYTE PTR [ecx-0x39],0x41
 3102dad:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102db0:	04 00                	add    al,0x0
 3102db2:	00 00                	add    BYTE PTR [eax],al
 3102db4:	24 00                	and    al,0x0
 3102db6:	00 00                	add    BYTE PTR [eax],al
 3102db8:	d4 02                	aam    0x2
 3102dba:	00 00                	add    BYTE PTR [eax],al
 3102dbc:	97                   	xchg   edi,eax
 3102dbd:	e3 ff                	jecxz  3102dbe <free@plt+0x8ae>
 3102dbf:	ff e5                	jmp    ebp
 3102dc1:	00 00                	add    BYTE PTR [eax],al
 3102dc3:	00 00                	add    BYTE PTR [eax],al
 3102dc5:	45                   	inc    ebp
 3102dc6:	0e                   	push   cs
 3102dc7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102dcd:	45                   	inc    ebp
 3102dce:	86 03                	xchg   BYTE PTR [ebx],al
 3102dd0:	83 04 02 d6          	add    DWORD PTR [edx+eax*1],0xffffffd6
 3102dd4:	c3                   	ret    
 3102dd5:	41                   	inc    ecx
 3102dd6:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
 3102dda:	04 04                	add    al,0x4
 3102ddc:	28 00                	sub    BYTE PTR [eax],al
 3102dde:	00 00                	add    BYTE PTR [eax],al
 3102de0:	fc                   	cld    
 3102de1:	02 00                	add    al,BYTE PTR [eax]
 3102de3:	00 54 e4 ff          	add    BYTE PTR [esp+eiz*8-0x1],dl
 3102de7:	ff                   	(bad)  
 3102de8:	bd 01 00 00 00       	mov    ebp,0x1
 3102ded:	45                   	inc    ebp
 3102dee:	0e                   	push   cs
 3102def:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102df5:	45                   	inc    ebp
 3102df6:	86 03                	xchg   BYTE PTR [ebx],al
 3102df8:	83 04 03 ae          	add    DWORD PTR [ebx+eax*1],0xffffffae
 3102dfc:	01 c3                	add    ebx,eax
 3102dfe:	41                   	inc    ecx
 3102dff:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
 3102e03:	04 04                	add    al,0x4
 3102e05:	00 00                	add    BYTE PTR [eax],al
 3102e07:	00 20                	add    BYTE PTR [eax],ah
 3102e09:	00 00                	add    BYTE PTR [eax],al
 3102e0b:	00 28                	add    BYTE PTR [eax],ch
 3102e0d:	03 00                	add    eax,DWORD PTR [eax]
 3102e0f:	00 e5                	add    ch,ah
 3102e11:	e5 ff                	in     eax,0xff
 3102e13:	ff 80 00 00 00 00    	inc    DWORD PTR [eax+0x0]
 3102e19:	45                   	inc    ebp
 3102e1a:	0e                   	push   cs
 3102e1b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102e21:	44                   	inc    esp
 3102e22:	83 03 02             	add    DWORD PTR [ebx],0x2
 3102e25:	74 c5                	je     3102dec <free@plt+0x8dc>
 3102e27:	c3                   	ret    
 3102e28:	0c 04                	or     al,0x4
 3102e2a:	04 00                	add    al,0x0
 3102e2c:	20 00                	and    BYTE PTR [eax],al
 3102e2e:	00 00                	add    BYTE PTR [eax],al
 3102e30:	4c                   	dec    esp
 3102e31:	03 00                	add    eax,DWORD PTR [eax]
 3102e33:	00 41 e6             	add    BYTE PTR [ecx-0x1a],al
 3102e36:	ff                   	(bad)  
 3102e37:	ff a1 02 00 00 00    	jmp    DWORD PTR [ecx+0x2]
 3102e3d:	45                   	inc    ebp
 3102e3e:	0e                   	push   cs
 3102e3f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102e45:	44                   	inc    esp
 3102e46:	83 03 03             	add    DWORD PTR [ebx],0x3
 3102e49:	95                   	xchg   ebp,eax
 3102e4a:	02 c5                	add    al,ch
 3102e4c:	c3                   	ret    
 3102e4d:	0c 04                	or     al,0x4
 3102e4f:	04 24                	add    al,0x24
 3102e51:	00 00                	add    BYTE PTR [eax],al
 3102e53:	00 70 03             	add    BYTE PTR [eax+0x3],dh
 3102e56:	00 00                	add    BYTE PTR [eax],al
 3102e58:	be e8 ff ff 88       	mov    esi,0x88ffffe8
 3102e5d:	00 00                	add    BYTE PTR [eax],al
 3102e5f:	00 00                	add    BYTE PTR [eax],al
 3102e61:	45                   	inc    ebp
 3102e62:	0e                   	push   cs
 3102e63:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102e69:	45                   	inc    ebp
 3102e6a:	86 03                	xchg   BYTE PTR [ebx],al
 3102e6c:	83 04 02 79          	add    DWORD PTR [edx+eax*1],0x79
 3102e70:	c3                   	ret    
 3102e71:	41                   	inc    ecx
 3102e72:	c6 41 c5 0c          	mov    BYTE PTR [ecx-0x3b],0xc
 3102e76:	04 04                	add    al,0x4
 3102e78:	20 00                	and    BYTE PTR [eax],al
 3102e7a:	00 00                	add    BYTE PTR [eax],al
 3102e7c:	98                   	cwde   
 3102e7d:	03 00                	add    eax,DWORD PTR [eax]
 3102e7f:	00 1e                	add    BYTE PTR [esi],bl
 3102e81:	e9 ff ff 50 00       	jmp    3612e85 <echoInput+0x4ff321>
 3102e86:	00 00                	add    BYTE PTR [eax],al
 3102e88:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102e8b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102e91:	44                   	inc    esp
 3102e92:	83 03 02             	add    DWORD PTR [ebx],0x2
 3102e95:	44                   	inc    esp
 3102e96:	c5 c3 0c             	(bad)
 3102e99:	04 04                	add    al,0x4
 3102e9b:	00 20                	add    BYTE PTR [eax],ah
 3102e9d:	00 00                	add    BYTE PTR [eax],al
 3102e9f:	00 bc 03 00 00 4a e9 	add    BYTE PTR [ebx+eax*1-0x16b60000],bh
 3102ea6:	ff                   	(bad)  
 3102ea7:	ff 48 00             	dec    DWORD PTR [eax+0x0]
 3102eaa:	00 00                	add    BYTE PTR [eax],al
 3102eac:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102eaf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102eb5:	44                   	inc    esp
 3102eb6:	83 03 7c             	add    DWORD PTR [ebx],0x7c
 3102eb9:	c5 c3 0c             	(bad)
 3102ebc:	04 04                	add    al,0x4
 3102ebe:	00 00                	add    BYTE PTR [eax],al
 3102ec0:	20 00                	and    BYTE PTR [eax],al
 3102ec2:	00 00                	add    BYTE PTR [eax],al
 3102ec4:	e0 03                	loopne 3102ec9 <free@plt+0x9b9>
 3102ec6:	00 00                	add    BYTE PTR [eax],al
 3102ec8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3102ec9:	e9 ff ff 36 00       	jmp    3472ecd <echoInput+0x35f369>
 3102ece:	00 00                	add    BYTE PTR [eax],al
 3102ed0:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102ed3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102ed9:	44                   	inc    esp
 3102eda:	83 03 6a             	add    DWORD PTR [ebx],0x6a
 3102edd:	c5 c3 0c             	(bad)
 3102ee0:	04 04                	add    al,0x4
 3102ee2:	00 00                	add    BYTE PTR [eax],al
 3102ee4:	20 00                	and    BYTE PTR [eax],al
 3102ee6:	00 00                	add    BYTE PTR [eax],al
 3102ee8:	04 04                	add    al,0x4
 3102eea:	00 00                	add    BYTE PTR [eax],al
 3102eec:	80 e9 ff             	sub    cl,0xff
 3102eef:	ff                   	(bad)  
 3102ef0:	3b 00                	cmp    eax,DWORD PTR [eax]
 3102ef2:	00 00                	add    BYTE PTR [eax],al
 3102ef4:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102ef7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102efd:	44                   	inc    esp
 3102efe:	83 03 6f             	add    DWORD PTR [ebx],0x6f
 3102f01:	c5 c3 0c             	(bad)
 3102f04:	04 04                	add    al,0x4
 3102f06:	00 00                	add    BYTE PTR [eax],al
 3102f08:	1c 00                	sbb    al,0x0
 3102f0a:	00 00                	add    BYTE PTR [eax],al
 3102f0c:	28 04 00             	sub    BYTE PTR [eax+eax*1],al
 3102f0f:	00 97 e9 ff ff 24    	add    BYTE PTR [edi+0x24ffffe9],dl
 3102f15:	00 00                	add    BYTE PTR [eax],al
 3102f17:	00 00                	add    BYTE PTR [eax],al
 3102f19:	45                   	inc    ebp
 3102f1a:	0e                   	push   cs
 3102f1b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102f21:	5c                   	pop    esp
 3102f22:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3102f25:	04 00                	add    al,0x0
 3102f27:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3102f2a:	00 00                	add    BYTE PTR [eax],al
 3102f2c:	48                   	dec    eax
 3102f2d:	04 00                	add    al,0x0
 3102f2f:	00 9b e9 ff ff 2e    	add    BYTE PTR [ebx+0x2effffe9],bl
 3102f35:	00 00                	add    BYTE PTR [eax],al
 3102f37:	00 00                	add    BYTE PTR [eax],al
 3102f39:	45                   	inc    ebp
 3102f3a:	0e                   	push   cs
 3102f3b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102f41:	66 c5 0c 04          	lds    cx,DWORD PTR [esp+eax*1]
 3102f45:	04 00                	add    al,0x0
 3102f47:	00 20                	add    BYTE PTR [eax],ah
 3102f49:	00 00                	add    BYTE PTR [eax],al
 3102f4b:	00 68 04             	add    BYTE PTR [eax+0x4],ch
 3102f4e:	00 00                	add    BYTE PTR [eax],al
 3102f50:	a9 e9 ff ff 2f       	test   eax,0x2fffffe9
 3102f55:	01 00                	add    DWORD PTR [eax],eax
 3102f57:	00 00                	add    BYTE PTR [eax],al
 3102f59:	45                   	inc    ebp
 3102f5a:	0e                   	push   cs
 3102f5b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102f61:	44                   	inc    esp
 3102f62:	83 03 03             	add    DWORD PTR [ebx],0x3
 3102f65:	23 01                	and    eax,DWORD PTR [ecx]
 3102f67:	c5 c3 0c             	(bad)
 3102f6a:	04 04                	add    al,0x4
 3102f6c:	20 00                	and    BYTE PTR [eax],al
 3102f6e:	00 00                	add    BYTE PTR [eax],al
 3102f70:	8c 04 00             	mov    WORD PTR [eax+eax*1],es
 3102f73:	00 b4 ea ff ff 5e 05 	add    BYTE PTR [edx+ebp*8+0x55effff],dh
 3102f7a:	00 00                	add    BYTE PTR [eax],al
 3102f7c:	00 45 0e             	add    BYTE PTR [ebp+0xe],al
 3102f7f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3102f85:	44                   	inc    esp
 3102f86:	83 03 03             	add    DWORD PTR [ebx],0x3
 3102f89:	52                   	push   edx
 3102f8a:	05 c5 c3 0c 04       	add    eax,0x40cc3c5
 3102f8f:	04                   	.byte 0x4

Disassembly of section .interp:

03102f90 <.interp>:
 3102f90:	2f                   	das    
 3102f91:	6c                   	ins    BYTE PTR es:[edi],dx
 3102f92:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3102f99:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3102fa0:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03102fa4 <.dynsym>:
	...
 3102fb4:	2a 01                	sub    al,BYTE PTR [ecx]
	...
 3102fbe:	00 00                	add    BYTE PTR [eax],al
 3102fc0:	12 00                	adc    al,BYTE PTR [eax]
 3102fc2:	00 00                	add    BYTE PTR [eax],al
 3102fc4:	3b 01                	cmp    eax,DWORD PTR [ecx]
	...
 3102fce:	00 00                	add    BYTE PTR [eax],al
 3102fd0:	12 00                	adc    al,BYTE PTR [eax]
 3102fd2:	00 00                	add    BYTE PTR [eax],al
 3102fd4:	49                   	dec    ecx
	...
 3102fdd:	00 00                	add    BYTE PTR [eax],al
 3102fdf:	00 12                	add    BYTE PTR [edx],dl
 3102fe1:	00 00                	add    BYTE PTR [eax],al
 3102fe3:	00 7e 00             	add    BYTE PTR [esi+0x0],bh
	...
 3102fee:	00 00                	add    BYTE PTR [eax],al
 3102ff0:	12 00                	adc    al,BYTE PTR [eax]
 3102ff2:	00 00                	add    BYTE PTR [eax],al
 3102ff4:	b6 00                	mov    dh,0x0
	...
 3102ffe:	00 00                	add    BYTE PTR [eax],al
 3103000:	12 00                	adc    al,BYTE PTR [eax]
 3103002:	00 00                	add    BYTE PTR [eax],al
 3103004:	0e                   	push   cs
 3103005:	01 00                	add    DWORD PTR [eax],eax
	...
 310300f:	00 12                	add    BYTE PTR [edx],dl
 3103011:	00 00                	add    BYTE PTR [eax],al
 3103013:	00 85 00 00 00 00    	add    BYTE PTR [ebp+0x0],al
 3103019:	00 00                	add    BYTE PTR [eax],al
 310301b:	00 00                	add    BYTE PTR [eax],al
 310301d:	00 00                	add    BYTE PTR [eax],al
 310301f:	00 12                	add    BYTE PTR [edx],dl
 3103021:	00 00                	add    BYTE PTR [eax],al
 3103023:	00 57 00             	add    BYTE PTR [edi+0x0],dl
	...
 310302e:	00 00                	add    BYTE PTR [eax],al
 3103030:	12 00                	adc    al,BYTE PTR [eax]
 3103032:	00 00                	add    BYTE PTR [eax],al
 3103034:	27                   	daa    
	...
 310303d:	00 00                	add    BYTE PTR [eax],al
 310303f:	00 12                	add    BYTE PTR [edx],dl
 3103041:	00 00                	add    BYTE PTR [eax],al
 3103043:	00 96 00 00 00 00    	add    BYTE PTR [esi+0x0],dl
 3103049:	00 00                	add    BYTE PTR [eax],al
 310304b:	00 00                	add    BYTE PTR [eax],al
 310304d:	00 00                	add    BYTE PTR [eax],al
 310304f:	00 12                	add    BYTE PTR [edx],dl
 3103051:	00 00                	add    BYTE PTR [eax],al
 3103053:	00 3b                	add    BYTE PTR [ebx],bh
	...
 310305d:	00 00                	add    BYTE PTR [eax],al
 310305f:	00 12                	add    BYTE PTR [edx],dl
 3103061:	00 00                	add    BYTE PTR [eax],al
 3103063:	00 4f 00             	add    BYTE PTR [edi+0x0],cl
	...
 310306e:	00 00                	add    BYTE PTR [eax],al
 3103070:	12 00                	adc    al,BYTE PTR [eax]
 3103072:	00 00                	add    BYTE PTR [eax],al
 3103074:	fc                   	cld    
	...
 310307d:	00 00                	add    BYTE PTR [eax],al
 310307f:	00 12                	add    BYTE PTR [edx],dl
 3103081:	00 00                	add    BYTE PTR [eax],al
 3103083:	00 0e                	add    BYTE PTR [esi],cl
	...
 310308d:	00 00                	add    BYTE PTR [eax],al
 310308f:	00 12                	add    BYTE PTR [edx],dl
 3103091:	00 00                	add    BYTE PTR [eax],al
 3103093:	00 36                	add    BYTE PTR [esi],dh
	...
 310309d:	00 00                	add    BYTE PTR [eax],al
 310309f:	00 12                	add    BYTE PTR [edx],dl
 31030a1:	00 00                	add    BYTE PTR [eax],al
 31030a3:	00 a3 00 00 00 00    	add    BYTE PTR [ebx+0x0],ah
 31030a9:	00 00                	add    BYTE PTR [eax],al
 31030ab:	00 00                	add    BYTE PTR [eax],al
 31030ad:	00 00                	add    BYTE PTR [eax],al
 31030af:	00 12                	add    BYTE PTR [edx],dl
 31030b1:	00 00                	add    BYTE PTR [eax],al
 31030b3:	00 eb                	add    bl,ch
	...
 31030bd:	00 00                	add    BYTE PTR [eax],al
 31030bf:	00 12                	add    BYTE PTR [edx],dl
 31030c1:	00 00                	add    BYTE PTR [eax],al
 31030c3:	00 91 00 00 00 00    	add    BYTE PTR [ecx+0x0],dl
 31030c9:	00 00                	add    BYTE PTR [eax],al
 31030cb:	00 00                	add    BYTE PTR [eax],al
 31030cd:	00 00                	add    BYTE PTR [eax],al
 31030cf:	00 12                	add    BYTE PTR [edx],dl
 31030d1:	00 00                	add    BYTE PTR [eax],al
 31030d3:	00 1c 01             	add    BYTE PTR [ecx+eax*1],bl
	...
 31030de:	00 00                	add    BYTE PTR [eax],al
 31030e0:	12 00                	adc    al,BYTE PTR [eax]
 31030e2:	00 00                	add    BYTE PTR [eax],al
 31030e4:	b1 00                	mov    cl,0x0
	...
 31030ee:	00 00                	add    BYTE PTR [eax],al
 31030f0:	12 00                	adc    al,BYTE PTR [eax]
 31030f2:	00 00                	add    BYTE PTR [eax],al
 31030f4:	18 00                	sbb    BYTE PTR [eax],al
	...
 31030fe:	00 00                	add    BYTE PTR [eax],al
 3103100:	12 00                	adc    al,BYTE PTR [eax]
 3103102:	00 00                	add    BYTE PTR [eax],al
 3103104:	e3 00                	jecxz  3103106 <free@plt+0xbf6>
	...
 310310e:	00 00                	add    BYTE PTR [eax],al
 3103110:	12 00                	adc    al,BYTE PTR [eax]
 3103112:	00 00                	add    BYTE PTR [eax],al
 3103114:	15 01 00 00 00       	adc    eax,0x1
 3103119:	00 00                	add    BYTE PTR [eax],al
 310311b:	00 00                	add    BYTE PTR [eax],al
 310311d:	00 00                	add    BYTE PTR [eax],al
 310311f:	00 12                	add    BYTE PTR [edx],dl
 3103121:	00 00                	add    BYTE PTR [eax],al
 3103123:	00 9c 00 00 00 00 00 	add    BYTE PTR [eax+eax*1+0x0],bl
 310312a:	00 00                	add    BYTE PTR [eax],al
 310312c:	00 00                	add    BYTE PTR [eax],al
 310312e:	00 00                	add    BYTE PTR [eax],al
 3103130:	12 00                	adc    al,BYTE PTR [eax]
 3103132:	00 00                	add    BYTE PTR [eax],al
 3103134:	bf 00 00 00 00       	mov    edi,0x0
 3103139:	00 00                	add    BYTE PTR [eax],al
 310313b:	00 00                	add    BYTE PTR [eax],al
 310313d:	00 00                	add    BYTE PTR [eax],al
 310313f:	00 12                	add    BYTE PTR [edx],dl
 3103141:	00 00                	add    BYTE PTR [eax],al
 3103143:	00 09                	add    BYTE PTR [ecx],cl
	...
 310314d:	00 00                	add    BYTE PTR [eax],al
 310314f:	00 12                	add    BYTE PTR [edx],dl
 3103151:	00 00                	add    BYTE PTR [eax],al
 3103153:	00 20                	add    BYTE PTR [eax],ah
	...
 310315d:	00 00                	add    BYTE PTR [eax],al
 310315f:	00 12                	add    BYTE PTR [edx],dl
 3103161:	00 00                	add    BYTE PTR [eax],al
 3103163:	00 23                	add    BYTE PTR [ebx],ah
 3103165:	01 00                	add    DWORD PTR [eax],eax
	...
 310316f:	00 12                	add    BYTE PTR [edx],dl
 3103171:	00 00                	add    BYTE PTR [eax],al
 3103173:	00 2e                	add    BYTE PTR [esi],ch
	...
 310317d:	00 00                	add    BYTE PTR [eax],al
 310317f:	00 12                	add    BYTE PTR [edx],dl
 3103181:	00 00                	add    BYTE PTR [eax],al
 3103183:	00 5e 00             	add    BYTE PTR [esi+0x0],bl
	...
 310318e:	00 00                	add    BYTE PTR [eax],al
 3103190:	12 00                	adc    al,BYTE PTR [eax]
 3103192:	00 00                	add    BYTE PTR [eax],al
 3103194:	aa                   	stos   BYTE PTR es:[edi],al
	...
 310319d:	00 00                	add    BYTE PTR [eax],al
 310319f:	00 12                	add    BYTE PTR [edx],dl
 31031a1:	00 00                	add    BYTE PTR [eax],al
 31031a3:	00 77 00             	add    BYTE PTR [edi+0x0],dh
	...
 31031ae:	00 00                	add    BYTE PTR [eax],al
 31031b0:	12 00                	adc    al,BYTE PTR [eax]
 31031b2:	00 00                	add    BYTE PTR [eax],al
 31031b4:	01 01                	add    DWORD PTR [ecx],eax
	...
 31031be:	00 00                	add    BYTE PTR [eax],al
 31031c0:	12 00                	adc    al,BYTE PTR [eax]
 31031c2:	00 00                	add    BYTE PTR [eax],al
 31031c4:	31 01                	xor    DWORD PTR [ecx],eax
	...
 31031ce:	00 00                	add    BYTE PTR [eax],al
 31031d0:	12 00                	adc    al,BYTE PTR [eax]
 31031d2:	00 00                	add    BYTE PTR [eax],al
 31031d4:	f4                   	hlt    
	...
 31031dd:	00 00                	add    BYTE PTR [eax],al
 31031df:	00 12                	add    BYTE PTR [edx],dl
 31031e1:	00 00                	add    BYTE PTR [eax],al
 31031e3:	00 cd                	add    ch,cl
	...
 31031ed:	00 00                	add    BYTE PTR [eax],al
 31031ef:	00 12                	add    BYTE PTR [edx],dl
 31031f1:	00 00                	add    BYTE PTR [eax],al
 31031f3:	00 36                	add    BYTE PTR [esi],dh
 31031f5:	01 00                	add    DWORD PTR [eax],eax
	...
 31031ff:	00 12                	add    BYTE PTR [edx],dl
 3103201:	00 00                	add    BYTE PTR [eax],al
 3103203:	00 6a 00             	add    BYTE PTR [edx+0x0],ch
	...
 310320e:	00 00                	add    BYTE PTR [eax],al
 3103210:	12 00                	adc    al,BYTE PTR [eax]
 3103212:	00 00                	add    BYTE PTR [eax],al
 3103214:	c6 00 00             	mov    BYTE PTR [eax],0x0
	...
 310321f:	00 12                	add    BYTE PTR [edx],dl
 3103221:	00 00                	add    BYTE PTR [eax],al
 3103223:	00 f7                	add    bh,dh
	...
 310322d:	00 00                	add    BYTE PTR [eax],al
 310322f:	00 12                	add    BYTE PTR [edx],dl
 3103231:	00 00                	add    BYTE PTR [eax],al
 3103233:	00 71 00             	add    BYTE PTR [ecx+0x0],dh
	...
 310323e:	00 00                	add    BYTE PTR [eax],al
 3103240:	12 00                	adc    al,BYTE PTR [eax]
 3103242:	00 00                	add    BYTE PTR [eax],al
 3103244:	d2 00                	rol    BYTE PTR [eax],cl
	...
 310324e:	00 00                	add    BYTE PTR [eax],al
 3103250:	12 00                	adc    al,BYTE PTR [eax]
 3103252:	00 00                	add    BYTE PTR [eax],al
 3103254:	dd 00                	fld    QWORD PTR [eax]
	...
 310325e:	00 00                	add    BYTE PTR [eax],al
 3103260:	12 00                	adc    al,BYTE PTR [eax]
 3103262:	00 00                	add    BYTE PTR [eax],al
 3103264:	65 00 00             	add    BYTE PTR gs:[eax],al
	...
 310326f:	00 12                	add    BYTE PTR [edx],dl
 3103271:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

03103274 <.dynstr>:
 3103274:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3103278:	63 2e                	arpl   WORD PTR [esi],bp
 310327a:	73 6f                	jae    31032eb <free@plt+0xddb>
 310327c:	00 66 6f             	add    BYTE PTR [esi+0x6f],ah
 310327f:	72 6b                	jb     31032ec <free@plt+0xddc>
 3103281:	00 74 61 6b          	add    BYTE PTR [ecx+eiz*2+0x6b],dh
 3103285:	65 41                	gs inc ecx
 3103287:	44                   	inc    esp
 3103288:	75 6d                	jne    31032f7 <free@plt+0xde7>
 310328a:	70 00                	jo     310328c <free@plt+0xd7c>
 310328c:	73 74                	jae    3103302 <free@plt+0xdf2>
 310328e:	72 6e                	jb     31032fe <free@plt+0xdee>
 3103290:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 3103293:	00 73 65             	add    BYTE PTR [ebx+0x65],dh
 3103296:	74 63                	je     31032fb <free@plt+0xdeb>
 3103298:	77 64                	ja     31032fe <free@plt+0xdee>
 310329a:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 310329d:	6c                   	ins    BYTE PTR es:[edi],dx
 310329e:	6c                   	ins    BYTE PTR es:[edi],dx
 310329f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31032a0:	63 00                	arpl   WORD PTR [eax],ax
 31032a2:	73 74                	jae    3103318 <free@plt+0xe08>
 31032a4:	72 74                	jb     310331a <free@plt+0xe0a>
 31032a6:	72 69                	jb     3103311 <free@plt+0xe01>
 31032a8:	6d                   	ins    DWORD PTR es:[edi],dx
 31032a9:	00 70 69             	add    BYTE PTR [eax+0x69],dh
 31032ac:	70 65                	jo     3103313 <free@plt+0xe03>
 31032ae:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 31032b1:	64 6c                	fs ins BYTE PTR es:[edi],dx
 31032b3:	69 6e 65 54 6f 41 72 	imul   ebp,DWORD PTR [esi+0x65],0x72416f54
 31032ba:	67 76 00             	addr16 jbe 31032bd <free@plt+0xdad>
 31032bd:	70 72                	jo     3103331 <free@plt+0xe21>
 31032bf:	69 6e 74 00 73 74 72 	imul   ebp,DWORD PTR [esi+0x74],0x72747300
 31032c6:	74 6f                	je     3103337 <free@plt+0xe27>
 31032c8:	75 6c                	jne    3103336 <free@plt+0xe26>
 31032ca:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 31032cd:	6d                   	ins    DWORD PTR es:[edi],dx
 31032ce:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 31032d1:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 31032d4:	72 63                	jb     3103339 <free@plt+0xe29>
 31032d6:	6d                   	ins    DWORD PTR es:[edi],dx
 31032d7:	70 00                	jo     31032d9 <free@plt+0xdc9>
 31032d9:	66 72 65             	data16 jb 3103341 <free@plt+0xe31>
 31032dc:	65 00 73 65          	add    BYTE PTR gs:[ebx+0x65],dh
 31032e0:	74 53                	je     3103335 <free@plt+0xe25>
 31032e2:	54                   	push   esp
 31032e3:	44                   	inc    esp
 31032e4:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 31032e7:	65 63 61 00          	arpl   WORD PTR gs:[ecx+0x0],sp
 31032eb:	70 72                	jo     310335f <free@plt+0xe4f>
 31032ed:	69 6e 74 64 00 70 72 	imul   ebp,DWORD PTR [esi+0x74],0x72700064
 31032f4:	69 6e 74 66 00 72 65 	imul   ebp,DWORD PTR [esi+0x74],0x65720066
 31032fb:	73 6f                	jae    310336c <free@plt+0xe5c>
 31032fd:	6c                   	ins    BYTE PTR es:[edi],dx
 31032fe:	76 65                	jbe    3103365 <free@plt+0xe55>
 3103300:	50                   	push   eax
 3103301:	61                   	popa   
 3103302:	74 68                	je     310336c <free@plt+0xe5c>
 3103304:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3103307:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 310330a:	73 6c                	jae    3103378 <free@plt+0xe68>
 310330c:	65 65 70 00          	gs gs jo 3103310 <free@plt+0xe00>
 3103310:	73 65                	jae    3103377 <free@plt+0xe67>
 3103312:	74 65                	je     3103379 <free@plt+0xe69>
 3103314:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3103315:	76 00                	jbe    3103317 <free@plt+0xe07>
 3103317:	73 74                	jae    310338d <free@plt+0xe7d>
 3103319:	72 63                	jb     310337e <free@plt+0xe6e>
 310331b:	61                   	popa   
 310331c:	74 00                	je     310331e <free@plt+0xe0e>
 310331e:	67 65 74 63          	addr16 gs je 3103385 <free@plt+0xe75>
 3103322:	77 64                	ja     3103388 <free@plt+0xe78>
 3103324:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 3103327:	61                   	popa   
 3103328:	64 00 72 65          	add    BYTE PTR fs:[edx+0x65],dh
 310332c:	73 65                	jae    3103393 <free@plt+0xe83>
 310332e:	74 52                	je     3103382 <free@plt+0xe72>
 3103330:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3103331:	77 00                	ja     3103333 <free@plt+0xe23>
 3103333:	73 74                	jae    31033a9 <free@plt+0xe99>
 3103335:	72 74                	jb     31033ab <free@plt+0xe9b>
 3103337:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3103338:	6b 00 73             	imul   eax,DWORD PTR [eax],0x73
 310333b:	74 72                	je     31033af <free@plt+0xe9f>
 310333d:	6c                   	ins    BYTE PTR es:[edi],dx
 310333e:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3103340:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3103343:	69 74 00 73 74 72 72 	imul   esi,DWORD PTR [eax+eax*1+0x73],0x65727274
 310334a:	65 
 310334b:	70 6c                	jo     31033b9 <free@plt+0xea9>
 310334d:	61                   	popa   
 310334e:	63 65 00             	arpl   WORD PTR [ebp+0x0],sp
 3103351:	63 6c 6f 73          	arpl   WORD PTR [edi+ebp*2+0x73],bp
 3103355:	65 00 73 74          	add    BYTE PTR gs:[ebx+0x74],dh
 3103359:	72 6e                	jb     31033c9 <free@plt+0xeb9>
 310335b:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 310335e:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3103361:	74 74                	je     31033d7 <free@plt+0xec7>
 3103363:	69 63 6b 73 00 66 72 	imul   esp,DWORD PTR [ebx+0x6b],0x72660073
 310336a:	65 6f                	outs   dx,DWORD PTR gs:[esi]
 310336c:	70 65                	jo     31033d3 <free@plt+0xec3>
 310336e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310336f:	00 69 74             	add    BYTE PTR [ecx+0x74],ch
 3103372:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3103373:	61                   	popa   
 3103374:	00 6d 6f             	add    BYTE PTR [ebp+0x6f],ch
 3103377:	64 69 66 79 53 69 67 	imul   esp,DWORD PTR fs:[esi+0x79],0x6e676953
 310337e:	6e 
 310337f:	61                   	popa   
 3103380:	6c                   	ins    BYTE PTR es:[edi],dx
 3103381:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 3103384:	74 65                	je     31033eb <free@plt+0xedb>
 3103386:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3103387:	76 00                	jbe    3103389 <free@plt+0xe79>
 3103389:	75 6e                	jne    31033f9 <free@plt+0xee9>
 310338b:	6c                   	ins    BYTE PTR es:[edi],dx
 310338c:	69 6e 6b 00 73 74 72 	imul   ebp,DWORD PTR [esi+0x6b],0x72747300
 3103393:	73 74                	jae    3103409 <free@plt+0xef9>
 3103395:	72 00                	jb     3103397 <free@plt+0xe87>
 3103397:	6d                   	ins    DWORD PTR es:[edi],dx
 3103398:	65 6d                	gs ins DWORD PTR es:[edi],dx
 310339a:	73 65                	jae    3103401 <free@plt+0xef1>
 310339c:	74 00                	je     310339e <free@plt+0xe8e>
 310339e:	73 74                	jae    3103414 <free@plt+0xf04>
 31033a0:	72 63                	jb     3103405 <free@plt+0xef5>
 31033a2:	70 79                	jo     310341d <free@plt+0xf0d>
 31033a4:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 31033a7:	61                   	popa   
 31033a8:	74 00                	je     31033aa <free@plt+0xe9a>
 31033aa:	61                   	popa   
 31033ab:	74 6f                	je     310341c <free@plt+0xf0c>
 31033ad:	69 00 77 61 69 74    	imul   eax,DWORD PTR [eax],0x74696177
 31033b3:	70 69                	jo     310341e <free@plt+0xf0e>
 31033b5:	64 00 2e             	add    BYTE PTR fs:[esi],ch
 31033b8:	2e 2f                	cs das 
 31033ba:	6c                   	ins    BYTE PTR es:[edi],dx
 31033bb:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 31033c2:	4f                   	dec    edi
 31033c3:	53                   	push   ebx
 31033c4:	2f                   	das    
 31033c5:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 31033cc:	62 
 31033cd:	75 67                	jne    3103436 <free@plt+0xf26>
 31033cf:	2f                   	das    
 31033d0:	47                   	inc    edi
 31033d1:	4e                   	dec    esi
 31033d2:	55                   	push   ebp
 31033d3:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 31033d8:	78 00                	js     31033da <free@plt+0xeca>

Disassembly of section .gnu.hash:

031033dc <.gnu.hash>:
 31033dc:	01 00                	add    DWORD PTR [eax],eax
 31033de:	00 00                	add    BYTE PTR [eax],al
 31033e0:	01 00                	add    DWORD PTR [eax],eax
 31033e2:	00 00                	add    BYTE PTR [eax],al
 31033e4:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .note.gnu.property:

031033f4 <.note.gnu.property>:
 31033f4:	04 00                	add    al,0x0
 31033f6:	00 00                	add    BYTE PTR [eax],al
 31033f8:	0c 00                	or     al,0x0
 31033fa:	00 00                	add    BYTE PTR [eax],al
 31033fc:	05 00 00 00 47       	add    eax,0x47000000
 3103401:	4e                   	dec    esi
 3103402:	55                   	push   ebp
 3103403:	00 02                	add    BYTE PTR [edx],al
 3103405:	00 00                	add    BYTE PTR [eax],al
 3103407:	c0 04 00 00          	rol    BYTE PTR [eax+eax*1],0x0
 310340b:	00 03                	add    BYTE PTR [ebx],al
 310340d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .note.gnu.build-id:

03103410 <.note.gnu.build-id>:
 3103410:	04 00                	add    al,0x0
 3103412:	00 00                	add    BYTE PTR [eax],al
 3103414:	14 00                	adc    al,0x0
 3103416:	00 00                	add    BYTE PTR [eax],al
 3103418:	03 00                	add    eax,DWORD PTR [eax]
 310341a:	00 00                	add    BYTE PTR [eax],al
 310341c:	47                   	inc    edi
 310341d:	4e                   	dec    esi
 310341e:	55                   	push   ebp
 310341f:	00 d8                	add    al,bl
 3103421:	1e                   	push   ds
 3103422:	18 ec                	sbb    ah,ch
 3103424:	40                   	inc    eax
 3103425:	1b fe                	sbb    edi,esi
 3103427:	90                   	nop
 3103428:	b5 a2                	mov    ch,0xa2
 310342a:	d2 b8 4e 8a ca 50    	sar    BYTE PTR [eax+0x50ca8a4e],cl
 3103430:	38 e8                	cmp    al,ch
 3103432:	2c 1c                	sub    al,0x1c

Disassembly of section .eh_frame:

03103434 <.eh_frame>:
 3103434:	14 00                	adc    al,0x0
 3103436:	00 00                	add    BYTE PTR [eax],al
 3103438:	00 00                	add    BYTE PTR [eax],al
 310343a:	00 00                	add    BYTE PTR [eax],al
 310343c:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 310343f:	00 01                	add    BYTE PTR [ecx],al
 3103441:	7c 08                	jl     310344b <free@plt+0xf3b>
 3103443:	01 1b                	add    DWORD PTR [ebx],ebx
 3103445:	0c 04                	or     al,0x4
 3103447:	04 88                	add    al,0x88
 3103449:	01 00                	add    DWORD PTR [eax],eax
 310344b:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 310344e:	00 00                	add    BYTE PTR [eax],al
 3103450:	1c 00                	sbb    al,0x0
 3103452:	00 00                	add    BYTE PTR [eax],al
 3103454:	3c eb                	cmp    al,0xeb
 3103456:	ff                   	(bad)  
 3103457:	ff d0                	call   eax
 3103459:	02 00                	add    al,BYTE PTR [eax]
 310345b:	00 00                	add    BYTE PTR [eax],al
 310345d:	0e                   	push   cs
 310345e:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3103461:	0c 4a                	or     al,0x4a
 3103463:	0f 0b                	ud2    
 3103465:	74 04                	je     310346b <free@plt+0xf5b>
 3103467:	78 00                	js     3103469 <free@plt+0xf59>
 3103469:	3f                   	aas    
 310346a:	1a 39                	sbb    bh,BYTE PTR [ecx]
 310346c:	2a 32                	sub    dh,BYTE PTR [edx]
 310346e:	24 22                	and    al,0x22
 3103470:	00 00                	add    BYTE PTR [eax],al
 3103472:	00 00                	add    BYTE PTR [eax],al
 3103474:	14 00                	adc    al,0x0
 3103476:	00 00                	add    BYTE PTR [eax],al
 3103478:	00 00                	add    BYTE PTR [eax],al
 310347a:	00 00                	add    BYTE PTR [eax],al
 310347c:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 310347f:	00 01                	add    BYTE PTR [ecx],al
 3103481:	7c 08                	jl     310348b <free@plt+0xf7b>
 3103483:	01 1b                	add    DWORD PTR [ebx],ebx
 3103485:	0c 04                	or     al,0x4
 3103487:	04 88                	add    al,0x88
 3103489:	01 00                	add    DWORD PTR [eax],eax
 310348b:	00 10                	add    BYTE PTR [eax],dl
 310348d:	00 00                	add    BYTE PTR [eax],al
 310348f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3103492:	00 00                	add    BYTE PTR [eax],al
 3103494:	cc                   	int3   
 3103495:	ed                   	in     eax,dx
 3103496:	ff                   	(bad)  
 3103497:	ff c0                	inc    eax
 3103499:	02 00                	add    al,BYTE PTR [eax]
 310349b:	00 00                	add    BYTE PTR [eax],al
 310349d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

031034a0 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 31034a0:	01 1b                	add    DWORD PTR [ebx],ebx
 31034a2:	03 3b                	add    edi,DWORD PTR [ebx]
 31034a4:	40                   	inc    eax
 31034a5:	f6 ff                	idiv   bh
 31034a7:	ff 21                	jmp    DWORD PTR [ecx]
 31034a9:	00 00                	add    BYTE PTR [eax],al
 31034ab:	00 60 cb             	add    BYTE PTR [eax-0x35],ah
 31034ae:	ff                   	(bad)  
 31034af:	ff 5c f6 ff          	call   FWORD PTR [esi+esi*8-0x1]
 31034b3:	ff 8f cb ff ff 80    	dec    DWORD PTR [edi-0x7f000035]
 31034b9:	f6 ff                	idiv   bh
 31034bb:	ff                   	(bad)  
 31034bc:	fa                   	cli    
 31034bd:	cb                   	retf   
 31034be:	ff                   	(bad)  
 31034bf:	ff a4 f6 ff ff 6a cd 	jmp    DWORD PTR [esi+esi*8-0x32950001]
 31034c6:	ff                   	(bad)  
 31034c7:	ff c8                	dec    eax
 31034c9:	f6 ff                	idiv   bh
 31034cb:	ff 14 ce             	call   DWORD PTR [esi+ecx*8]
 31034ce:	ff                   	(bad)  
 31034cf:	ff                   	(bad)  
 31034d0:	ec                   	in     al,dx
 31034d1:	f6 ff                	idiv   bh
 31034d3:	ff cb                	dec    ebx
 31034d5:	d4 ff                	aam    0xff
 31034d7:	ff 10                	call   DWORD PTR [eax]
 31034d9:	f7 ff                	idiv   edi
 31034db:	ff c7                	inc    edi
 31034dd:	d5 ff                	aad    0xff
 31034df:	ff 34 f7             	push   DWORD PTR [edi+esi*8]
 31034e2:	ff                   	(bad)  
 31034e3:	ff 4d d6             	dec    DWORD PTR [ebp-0x2a]
 31034e6:	ff                   	(bad)  
 31034e7:	ff 58 f7             	call   FWORD PTR [eax-0x9]
 31034ea:	ff                   	(bad)  
 31034eb:	ff 2b                	jmp    FWORD PTR [ebx]
 31034ed:	d7                   	xlat   BYTE PTR ds:[ebx]
 31034ee:	ff                   	(bad)  
 31034ef:	ff                   	(bad)  
 31034f0:	7c f7                	jl     31034e9 <__GNU_EH_FRAME_HDR+0x49>
 31034f2:	ff                   	(bad)  
 31034f3:	ff 53 d7             	call   DWORD PTR [ebx-0x29]
 31034f6:	ff                   	(bad)  
 31034f7:	ff 9c f7 ff ff c5 d7 	call   FWORD PTR [edi+esi*8-0x283a0001]
 31034fe:	ff                   	(bad)  
 31034ff:	ff c0                	inc    eax
 3103501:	f7 ff                	idiv   edi
 3103503:	ff                   	(bad)  
 3103504:	be d8 ff ff e4       	mov    esi,0xe4ffffd8
 3103509:	f7 ff                	idiv   edi
 310350b:	ff 21                	jmp    DWORD PTR [ecx]
 310350d:	d9 ff                	fcos   
 310350f:	ff 08                	dec    DWORD PTR [eax]
 3103511:	f8                   	clc    
 3103512:	ff                   	(bad)  
 3103513:	ff 81 da ff ff 34    	inc    DWORD PTR [ecx+0x34ffffda]
 3103519:	f8                   	clc    
 310351a:	ff                   	(bad)  
 310351b:	ff a4 da ff ff 58 f8 	jmp    DWORD PTR [edx+ebx*8-0x7a70001]
 3103522:	ff                   	(bad)  
 3103523:	ff 0f                	dec    DWORD PTR [edi]
 3103525:	db ff                	(bad)  
 3103527:	ff a4 f8 ff ff 23 db 	jmp    DWORD PTR [eax+edi*8-0x24dc0001]
 310352e:	ff                   	(bad)  
 310352f:	ff c4                	inc    esp
 3103531:	f8                   	clc    
 3103532:	ff                   	(bad)  
 3103533:	ff 61 db             	jmp    DWORD PTR [ecx-0x25]
 3103536:	ff                   	(bad)  
 3103537:	ff e4                	jmp    esp
 3103539:	f8                   	clc    
 310353a:	ff                   	(bad)  
 310353b:	ff b3 dc ff ff 14    	push   DWORD PTR [ebx+0x14ffffdc]
 3103541:	f9                   	stc    
 3103542:	ff                   	(bad)  
 3103543:	ff 98 dd ff ff 3c    	call   FWORD PTR [eax+0x3cffffdd]
 3103549:	f9                   	stc    
 310354a:	ff                   	(bad)  
 310354b:	ff 55 df             	call   DWORD PTR [ebp-0x21]
 310354e:	ff                   	(bad)  
 310354f:	ff 68 f9             	jmp    FWORD PTR [eax-0x7]
 3103552:	ff                   	(bad)  
 3103553:	ff d5                	call   ebp
 3103555:	df ff                	(bad)  
 3103557:	ff 8c f9 ff ff 76 e2 	dec    DWORD PTR [ecx+edi*8-0x1d890001]
 310355e:	ff                   	(bad)  
 310355f:	ff b0 f9 ff ff fe    	push   DWORD PTR [eax-0x1000007]
 3103565:	e2 ff                	loop   3103566 <__GNU_EH_FRAME_HDR+0xc6>
 3103567:	ff                   	(bad)  
 3103568:	d8 f9                	fdivr  st,st(1)
 310356a:	ff                   	(bad)  
 310356b:	ff 4e e3             	dec    DWORD PTR [esi-0x1d]
 310356e:	ff                   	(bad)  
 310356f:	ff                   	(bad)  
 3103570:	fc                   	cld    
 3103571:	f9                   	stc    
 3103572:	ff                   	(bad)  
 3103573:	ff 96 e3 ff ff 20    	call   DWORD PTR [esi+0x20ffffe3]
 3103579:	fa                   	cli    
 310357a:	ff                   	(bad)  
 310357b:	ff cc                	dec    esp
 310357d:	e3 ff                	jecxz  310357e <__GNU_EH_FRAME_HDR+0xde>
 310357f:	ff 44 fa ff          	inc    DWORD PTR [edx+edi*8-0x1]
 3103583:	ff 07                	inc    DWORD PTR [edi]
 3103585:	e4 ff                	in     al,0xff
 3103587:	ff 68 fa             	jmp    FWORD PTR [eax-0x6]
 310358a:	ff                   	(bad)  
 310358b:	ff 2b                	jmp    FWORD PTR [ebx]
 310358d:	e4 ff                	in     al,0xff
 310358f:	ff 88 fa ff ff 59    	dec    DWORD PTR [eax+0x59fffffa]
 3103595:	e4 ff                	in     al,0xff
 3103597:	ff a8 fa ff ff 88    	jmp    FWORD PTR [eax-0x77000006]
 310359d:	e5 ff                	in     eax,0xff
 310359f:	ff cc                	dec    esp
 31035a1:	fa                   	cli    
 31035a2:	ff                   	(bad)  
 31035a3:	ff e6                	jmp    esi
 31035a5:	ea ff ff 7c f8 ff ff 	jmp    0xffff:0xf87cffff
 31035ac:	ea ea ff ff 90 f8 ff 	jmp    0xfff8:0x90ffffea
 31035b3:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

031035b4 <.rel.dyn>:
 31035b4:	a0 39 10 03 08       	mov    al,ds:0x8031039
 31035b9:	00 00                	add    BYTE PTR [eax],al
 31035bb:	00 a4 39 10 03 08 00 	add    BYTE PTR [ecx+edi*1+0x80310],ah
 31035c2:	00 00                	add    BYTE PTR [eax],al
 31035c4:	a8 39                	test   al,0x39
 31035c6:	10 03                	adc    BYTE PTR [ebx],al
 31035c8:	08 00                	or     BYTE PTR [eax],al
 31035ca:	00 00                	add    BYTE PTR [eax],al
 31035cc:	b0 39                	mov    al,0x39
 31035ce:	10 03                	adc    BYTE PTR [ebx],al
 31035d0:	08 00                	or     BYTE PTR [eax],al
 31035d2:	00 00                	add    BYTE PTR [eax],al
 31035d4:	b4 39                	mov    ah,0x39
 31035d6:	10 03                	adc    BYTE PTR [ebx],al
 31035d8:	08 00                	or     BYTE PTR [eax],al
 31035da:	00 00                	add    BYTE PTR [eax],al
 31035dc:	b8 39 10 03 08       	mov    eax,0x8031039
 31035e1:	00 00                	add    BYTE PTR [eax],al
 31035e3:	00 c0                	add    al,al
 31035e5:	39 10                	cmp    DWORD PTR [eax],edx
 31035e7:	03 08                	add    ecx,DWORD PTR [eax]
 31035e9:	00 00                	add    BYTE PTR [eax],al
 31035eb:	00 c4                	add    ah,al
 31035ed:	39 10                	cmp    DWORD PTR [eax],edx
 31035ef:	03 08                	add    ecx,DWORD PTR [eax]
 31035f1:	00 00                	add    BYTE PTR [eax],al
 31035f3:	00 c8                	add    al,cl
 31035f5:	39 10                	cmp    DWORD PTR [eax],edx
 31035f7:	03 08                	add    ecx,DWORD PTR [eax]
 31035f9:	00 00                	add    BYTE PTR [eax],al
 31035fb:	00 d0                	add    al,dl
 31035fd:	39 10                	cmp    DWORD PTR [eax],edx
 31035ff:	03 08                	add    ecx,DWORD PTR [eax]
 3103601:	00 00                	add    BYTE PTR [eax],al
 3103603:	00 d4                	add    ah,dl
 3103605:	39 10                	cmp    DWORD PTR [eax],edx
 3103607:	03 08                	add    ecx,DWORD PTR [eax]
 3103609:	00 00                	add    BYTE PTR [eax],al
 310360b:	00 d8                	add    al,bl
 310360d:	39 10                	cmp    DWORD PTR [eax],edx
 310360f:	03 08                	add    ecx,DWORD PTR [eax]
 3103611:	00 00                	add    BYTE PTR [eax],al
 3103613:	00 e0                	add    al,ah
 3103615:	39 10                	cmp    DWORD PTR [eax],edx
 3103617:	03 08                	add    ecx,DWORD PTR [eax]
 3103619:	00 00                	add    BYTE PTR [eax],al
 310361b:	00 e4                	add    ah,ah
 310361d:	39 10                	cmp    DWORD PTR [eax],edx
 310361f:	03 08                	add    ecx,DWORD PTR [eax]
 3103621:	00 00                	add    BYTE PTR [eax],al
 3103623:	00 e8                	add    al,ch
 3103625:	39 10                	cmp    DWORD PTR [eax],edx
 3103627:	03 08                	add    ecx,DWORD PTR [eax]
 3103629:	00 00                	add    BYTE PTR [eax],al
 310362b:	00 f0                	add    al,dh
 310362d:	39 10                	cmp    DWORD PTR [eax],edx
 310362f:	03 08                	add    ecx,DWORD PTR [eax]
 3103631:	00 00                	add    BYTE PTR [eax],al
 3103633:	00 f4                	add    ah,dh
 3103635:	39 10                	cmp    DWORD PTR [eax],edx
 3103637:	03 08                	add    ecx,DWORD PTR [eax]
 3103639:	00 00                	add    BYTE PTR [eax],al
 310363b:	00 f8                	add    al,bh
 310363d:	39 10                	cmp    DWORD PTR [eax],edx
 310363f:	03 08                	add    ecx,DWORD PTR [eax]
 3103641:	00 00                	add    BYTE PTR [eax],al
 3103643:	00 00                	add    BYTE PTR [eax],al
 3103645:	3a 10                	cmp    dl,BYTE PTR [eax]
 3103647:	03 08                	add    ecx,DWORD PTR [eax]
 3103649:	00 00                	add    BYTE PTR [eax],al
 310364b:	00 04 3a             	add    BYTE PTR [edx+edi*1],al
 310364e:	10 03                	adc    BYTE PTR [ebx],al
 3103650:	08 00                	or     BYTE PTR [eax],al
 3103652:	00 00                	add    BYTE PTR [eax],al
 3103654:	08 3a                	or     BYTE PTR [edx],bh
 3103656:	10 03                	adc    BYTE PTR [ebx],al
 3103658:	08 00                	or     BYTE PTR [eax],al
 310365a:	00 00                	add    BYTE PTR [eax],al
 310365c:	10 3a                	adc    BYTE PTR [edx],bh
 310365e:	10 03                	adc    BYTE PTR [ebx],al
 3103660:	08 00                	or     BYTE PTR [eax],al
 3103662:	00 00                	add    BYTE PTR [eax],al
 3103664:	14 3a                	adc    al,0x3a
 3103666:	10 03                	adc    BYTE PTR [ebx],al
 3103668:	08 00                	or     BYTE PTR [eax],al
 310366a:	00 00                	add    BYTE PTR [eax],al
 310366c:	18 3a                	sbb    BYTE PTR [edx],bh
 310366e:	10 03                	adc    BYTE PTR [ebx],al
 3103670:	08 00                	or     BYTE PTR [eax],al
 3103672:	00 00                	add    BYTE PTR [eax],al
 3103674:	20 3a                	and    BYTE PTR [edx],bh
 3103676:	10 03                	adc    BYTE PTR [ebx],al
 3103678:	08 00                	or     BYTE PTR [eax],al
 310367a:	00 00                	add    BYTE PTR [eax],al
 310367c:	24 3a                	and    al,0x3a
 310367e:	10 03                	adc    BYTE PTR [ebx],al
 3103680:	08 00                	or     BYTE PTR [eax],al
 3103682:	00 00                	add    BYTE PTR [eax],al
 3103684:	28 3a                	sub    BYTE PTR [edx],bh
 3103686:	10 03                	adc    BYTE PTR [ebx],al
 3103688:	08 00                	or     BYTE PTR [eax],al
 310368a:	00 00                	add    BYTE PTR [eax],al
 310368c:	30 3a                	xor    BYTE PTR [edx],bh
 310368e:	10 03                	adc    BYTE PTR [ebx],al
 3103690:	08 00                	or     BYTE PTR [eax],al
 3103692:	00 00                	add    BYTE PTR [eax],al
 3103694:	34 3a                	xor    al,0x3a
 3103696:	10 03                	adc    BYTE PTR [ebx],al
 3103698:	08 00                	or     BYTE PTR [eax],al
 310369a:	00 00                	add    BYTE PTR [eax],al
 310369c:	38 3a                	cmp    BYTE PTR [edx],bh
 310369e:	10 03                	adc    BYTE PTR [ebx],al
 31036a0:	08 00                	or     BYTE PTR [eax],al
 31036a2:	00 00                	add    BYTE PTR [eax],al
 31036a4:	40                   	inc    eax
 31036a5:	3a 10                	cmp    dl,BYTE PTR [eax]
 31036a7:	03 08                	add    ecx,DWORD PTR [eax]
 31036a9:	00 00                	add    BYTE PTR [eax],al
 31036ab:	00 44 3a 10          	add    BYTE PTR [edx+edi*1+0x10],al
 31036af:	03 08                	add    ecx,DWORD PTR [eax]
 31036b1:	00 00                	add    BYTE PTR [eax],al
 31036b3:	00 48 3a             	add    BYTE PTR [eax+0x3a],cl
 31036b6:	10 03                	adc    BYTE PTR [ebx],al
 31036b8:	08 00                	or     BYTE PTR [eax],al
 31036ba:	00 00                	add    BYTE PTR [eax],al
 31036bc:	50                   	push   eax
 31036bd:	3a 10                	cmp    dl,BYTE PTR [eax]
 31036bf:	03 08                	add    ecx,DWORD PTR [eax]
 31036c1:	00 00                	add    BYTE PTR [eax],al
 31036c3:	00 54 3a 10          	add    BYTE PTR [edx+edi*1+0x10],dl
 31036c7:	03 08                	add    ecx,DWORD PTR [eax]
 31036c9:	00 00                	add    BYTE PTR [eax],al
 31036cb:	00 58 3a             	add    BYTE PTR [eax+0x3a],bl
 31036ce:	10 03                	adc    BYTE PTR [ebx],al
 31036d0:	08 00                	or     BYTE PTR [eax],al
 31036d2:	00 00                	add    BYTE PTR [eax],al
 31036d4:	60                   	pusha  
 31036d5:	3a 10                	cmp    dl,BYTE PTR [eax]
 31036d7:	03 08                	add    ecx,DWORD PTR [eax]
 31036d9:	00 00                	add    BYTE PTR [eax],al
 31036db:	00 64 3a 10          	add    BYTE PTR [edx+edi*1+0x10],ah
 31036df:	03 08                	add    ecx,DWORD PTR [eax]
 31036e1:	00 00                	add    BYTE PTR [eax],al
 31036e3:	00 68 3a             	add    BYTE PTR [eax+0x3a],ch
 31036e6:	10 03                	adc    BYTE PTR [ebx],al
 31036e8:	08 00                	or     BYTE PTR [eax],al
 31036ea:	00 00                	add    BYTE PTR [eax],al
 31036ec:	00 3c 10             	add    BYTE PTR [eax+edx*1],bh
 31036ef:	03 08                	add    ecx,DWORD PTR [eax]
 31036f1:	00 00                	add    BYTE PTR [eax],al
 31036f3:	00 04 3c             	add    BYTE PTR [esp+edi*1],al
 31036f6:	10 03                	adc    BYTE PTR [ebx],al
 31036f8:	08 00                	or     BYTE PTR [eax],al
 31036fa:	00 00                	add    BYTE PTR [eax],al
 31036fc:	08 3c 10             	or     BYTE PTR [eax+edx*1],bh
 31036ff:	03 08                	add    ecx,DWORD PTR [eax]
 3103701:	00 00                	add    BYTE PTR [eax],al
 3103703:	00 10                	add    BYTE PTR [eax],dl
 3103705:	3c 10                	cmp    al,0x10
 3103707:	03 08                	add    ecx,DWORD PTR [eax]
 3103709:	00 00                	add    BYTE PTR [eax],al
 310370b:	00 14 3c             	add    BYTE PTR [esp+edi*1],dl
 310370e:	10 03                	adc    BYTE PTR [ebx],al
 3103710:	08 00                	or     BYTE PTR [eax],al
 3103712:	00 00                	add    BYTE PTR [eax],al
 3103714:	18 3c 10             	sbb    BYTE PTR [eax+edx*1],bh
 3103717:	03 08                	add    ecx,DWORD PTR [eax]
 3103719:	00 00                	add    BYTE PTR [eax],al
 310371b:	00 20                	add    BYTE PTR [eax],ah
 310371d:	3c 10                	cmp    al,0x10
 310371f:	03 08                	add    ecx,DWORD PTR [eax]
 3103721:	00 00                	add    BYTE PTR [eax],al
 3103723:	00 24 3c             	add    BYTE PTR [esp+edi*1],ah
 3103726:	10 03                	adc    BYTE PTR [ebx],al
 3103728:	08 00                	or     BYTE PTR [eax],al
 310372a:	00 00                	add    BYTE PTR [eax],al
 310372c:	28 3c 10             	sub    BYTE PTR [eax+edx*1],bh
 310372f:	03 08                	add    ecx,DWORD PTR [eax]
 3103731:	00 00                	add    BYTE PTR [eax],al
 3103733:	00 30                	add    BYTE PTR [eax],dh
 3103735:	3c 10                	cmp    al,0x10
 3103737:	03 08                	add    ecx,DWORD PTR [eax]
 3103739:	00 00                	add    BYTE PTR [eax],al
 310373b:	00 34 3c             	add    BYTE PTR [esp+edi*1],dh
 310373e:	10 03                	adc    BYTE PTR [ebx],al
 3103740:	08 00                	or     BYTE PTR [eax],al
 3103742:	00 00                	add    BYTE PTR [eax],al
 3103744:	38 3c 10             	cmp    BYTE PTR [eax+edx*1],bh
 3103747:	03 08                	add    ecx,DWORD PTR [eax]
 3103749:	00 00                	add    BYTE PTR [eax],al
 310374b:	00 40 3c             	add    BYTE PTR [eax+0x3c],al
 310374e:	10 03                	adc    BYTE PTR [ebx],al
 3103750:	08 00                	or     BYTE PTR [eax],al
 3103752:	00 00                	add    BYTE PTR [eax],al
 3103754:	44                   	inc    esp
 3103755:	3c 10                	cmp    al,0x10
 3103757:	03 08                	add    ecx,DWORD PTR [eax]
 3103759:	00 00                	add    BYTE PTR [eax],al
 310375b:	00 48 3c             	add    BYTE PTR [eax+0x3c],cl
 310375e:	10 03                	adc    BYTE PTR [ebx],al
 3103760:	08 00                	or     BYTE PTR [eax],al
 3103762:	00 00                	add    BYTE PTR [eax],al
 3103764:	50                   	push   eax
 3103765:	3c 10                	cmp    al,0x10
 3103767:	03 08                	add    ecx,DWORD PTR [eax]
 3103769:	00 00                	add    BYTE PTR [eax],al
 310376b:	00 54 3c 10          	add    BYTE PTR [esp+edi*1+0x10],dl
 310376f:	03 08                	add    ecx,DWORD PTR [eax]
 3103771:	00 00                	add    BYTE PTR [eax],al
 3103773:	00 58 3c             	add    BYTE PTR [eax+0x3c],bl
 3103776:	10 03                	adc    BYTE PTR [ebx],al
 3103778:	08 00                	or     BYTE PTR [eax],al
 310377a:	00 00                	add    BYTE PTR [eax],al
 310377c:	60                   	pusha  
 310377d:	3c 10                	cmp    al,0x10
 310377f:	03 08                	add    ecx,DWORD PTR [eax]
 3103781:	00 00                	add    BYTE PTR [eax],al
 3103783:	00 64 3c 10          	add    BYTE PTR [esp+edi*1+0x10],ah
 3103787:	03 08                	add    ecx,DWORD PTR [eax]
 3103789:	00 00                	add    BYTE PTR [eax],al
 310378b:	00 68 3c             	add    BYTE PTR [eax+0x3c],ch
 310378e:	10 03                	adc    BYTE PTR [ebx],al
 3103790:	08 00                	or     BYTE PTR [eax],al
 3103792:	00 00                	add    BYTE PTR [eax],al
 3103794:	70 3c                	jo     31037d2 <__GNU_EH_FRAME_HDR+0x332>
 3103796:	10 03                	adc    BYTE PTR [ebx],al
 3103798:	08 00                	or     BYTE PTR [eax],al
 310379a:	00 00                	add    BYTE PTR [eax],al
 310379c:	74 3c                	je     31037da <__GNU_EH_FRAME_HDR+0x33a>
 310379e:	10 03                	adc    BYTE PTR [ebx],al
 31037a0:	08 00                	or     BYTE PTR [eax],al
 31037a2:	00 00                	add    BYTE PTR [eax],al
 31037a4:	78 3c                	js     31037e2 <__GNU_EH_FRAME_HDR+0x342>
 31037a6:	10 03                	adc    BYTE PTR [ebx],al
 31037a8:	08 00                	or     BYTE PTR [eax],al
 31037aa:	00 00                	add    BYTE PTR [eax],al
 31037ac:	80 3c 10 03          	cmp    BYTE PTR [eax+edx*1],0x3
 31037b0:	08 00                	or     BYTE PTR [eax],al
 31037b2:	00 00                	add    BYTE PTR [eax],al
 31037b4:	84 3c 10             	test   BYTE PTR [eax+edx*1],bh
 31037b7:	03 08                	add    ecx,DWORD PTR [eax]
 31037b9:	00 00                	add    BYTE PTR [eax],al
 31037bb:	00 88 3c 10 03 08    	add    BYTE PTR [eax+0x803103c],cl
 31037c1:	00 00                	add    BYTE PTR [eax],al
 31037c3:	00 90 3c 10 03 08    	add    BYTE PTR [eax+0x803103c],dl
 31037c9:	00 00                	add    BYTE PTR [eax],al
 31037cb:	00 94 3c 10 03 08 00 	add    BYTE PTR [esp+edi*1+0x80310],dl
 31037d2:	00 00                	add    BYTE PTR [eax],al
 31037d4:	98                   	cwde   
 31037d5:	3c 10                	cmp    al,0x10
 31037d7:	03 08                	add    ecx,DWORD PTR [eax]
 31037d9:	00 00                	add    BYTE PTR [eax],al
 31037db:	00 a0 3c 10 03 08    	add    BYTE PTR [eax+0x803103c],ah
 31037e1:	00 00                	add    BYTE PTR [eax],al
 31037e3:	00 a4 3c 10 03 08 00 	add    BYTE PTR [esp+edi*1+0x80310],ah
 31037ea:	00 00                	add    BYTE PTR [eax],al
 31037ec:	a8 3c                	test   al,0x3c
 31037ee:	10 03                	adc    BYTE PTR [ebx],al
 31037f0:	08 00                	or     BYTE PTR [eax],al
 31037f2:	00 00                	add    BYTE PTR [eax],al
 31037f4:	b0 3c                	mov    al,0x3c
 31037f6:	10 03                	adc    BYTE PTR [ebx],al
 31037f8:	08 00                	or     BYTE PTR [eax],al
 31037fa:	00 00                	add    BYTE PTR [eax],al
 31037fc:	b4 3c                	mov    ah,0x3c
 31037fe:	10 03                	adc    BYTE PTR [ebx],al
 3103800:	08 00                	or     BYTE PTR [eax],al
 3103802:	00 00                	add    BYTE PTR [eax],al
 3103804:	b8 3c 10 03 08       	mov    eax,0x803103c
 3103809:	00 00                	add    BYTE PTR [eax],al
 310380b:	00 c0                	add    al,al
 310380d:	3c 10                	cmp    al,0x10
 310380f:	03 08                	add    ecx,DWORD PTR [eax]
 3103811:	00 00                	add    BYTE PTR [eax],al
 3103813:	00 c4                	add    ah,al
 3103815:	3c 10                	cmp    al,0x10
 3103817:	03 08                	add    ecx,DWORD PTR [eax]
 3103819:	00 00                	add    BYTE PTR [eax],al
 310381b:	00 c8                	add    al,cl
 310381d:	3c 10                	cmp    al,0x10
 310381f:	03 08                	add    ecx,DWORD PTR [eax]
 3103821:	00 00                	add    BYTE PTR [eax],al
 3103823:	00 34 3b             	add    BYTE PTR [ebx+edi*1],dh
 3103826:	10 03                	adc    BYTE PTR [ebx],al
 3103828:	07                   	pop    es
 3103829:	01 00                	add    DWORD PTR [eax],eax
 310382b:	00 38                	add    BYTE PTR [eax],bh
 310382d:	3b 10                	cmp    edx,DWORD PTR [eax]
 310382f:	03 07                	add    eax,DWORD PTR [edi]
 3103831:	02 00                	add    al,BYTE PTR [eax]
 3103833:	00 3c 3b             	add    BYTE PTR [ebx+edi*1],bh
 3103836:	10 03                	adc    BYTE PTR [ebx],al
 3103838:	07                   	pop    es
 3103839:	03 00                	add    eax,DWORD PTR [eax]
 310383b:	00 40 3b             	add    BYTE PTR [eax+0x3b],al
 310383e:	10 03                	adc    BYTE PTR [ebx],al
 3103840:	07                   	pop    es
 3103841:	04 00                	add    al,0x0
 3103843:	00 44 3b 10          	add    BYTE PTR [ebx+edi*1+0x10],al
 3103847:	03 07                	add    eax,DWORD PTR [edi]
 3103849:	05 00 00 48 3b       	add    eax,0x3b480000
 310384e:	10 03                	adc    BYTE PTR [ebx],al
 3103850:	07                   	pop    es
 3103851:	06                   	push   es
 3103852:	00 00                	add    BYTE PTR [eax],al
 3103854:	4c                   	dec    esp
 3103855:	3b 10                	cmp    edx,DWORD PTR [eax]
 3103857:	03 07                	add    eax,DWORD PTR [edi]
 3103859:	07                   	pop    es
 310385a:	00 00                	add    BYTE PTR [eax],al
 310385c:	50                   	push   eax
 310385d:	3b 10                	cmp    edx,DWORD PTR [eax]
 310385f:	03 07                	add    eax,DWORD PTR [edi]
 3103861:	08 00                	or     BYTE PTR [eax],al
 3103863:	00 54 3b 10          	add    BYTE PTR [ebx+edi*1+0x10],dl
 3103867:	03 07                	add    eax,DWORD PTR [edi]
 3103869:	09 00                	or     DWORD PTR [eax],eax
 310386b:	00 58 3b             	add    BYTE PTR [eax+0x3b],bl
 310386e:	10 03                	adc    BYTE PTR [ebx],al
 3103870:	07                   	pop    es
 3103871:	0a 00                	or     al,BYTE PTR [eax]
 3103873:	00 5c 3b 10          	add    BYTE PTR [ebx+edi*1+0x10],bl
 3103877:	03 07                	add    eax,DWORD PTR [edi]
 3103879:	0b 00                	or     eax,DWORD PTR [eax]
 310387b:	00 60 3b             	add    BYTE PTR [eax+0x3b],ah
 310387e:	10 03                	adc    BYTE PTR [ebx],al
 3103880:	07                   	pop    es
 3103881:	0c 00                	or     al,0x0
 3103883:	00 64 3b 10          	add    BYTE PTR [ebx+edi*1+0x10],ah
 3103887:	03 07                	add    eax,DWORD PTR [edi]
 3103889:	0d 00 00 68 3b       	or     eax,0x3b680000
 310388e:	10 03                	adc    BYTE PTR [ebx],al
 3103890:	07                   	pop    es
 3103891:	0e                   	push   cs
 3103892:	00 00                	add    BYTE PTR [eax],al
 3103894:	6c                   	ins    BYTE PTR es:[edi],dx
 3103895:	3b 10                	cmp    edx,DWORD PTR [eax]
 3103897:	03 07                	add    eax,DWORD PTR [edi]
 3103899:	0f 00 00             	sldt   WORD PTR [eax]
 310389c:	70 3b                	jo     31038d9 <__GNU_EH_FRAME_HDR+0x439>
 310389e:	10 03                	adc    BYTE PTR [ebx],al
 31038a0:	07                   	pop    es
 31038a1:	10 00                	adc    BYTE PTR [eax],al
 31038a3:	00 74 3b 10          	add    BYTE PTR [ebx+edi*1+0x10],dh
 31038a7:	03 07                	add    eax,DWORD PTR [edi]
 31038a9:	11 00                	adc    DWORD PTR [eax],eax
 31038ab:	00 78 3b             	add    BYTE PTR [eax+0x3b],bh
 31038ae:	10 03                	adc    BYTE PTR [ebx],al
 31038b0:	07                   	pop    es
 31038b1:	12 00                	adc    al,BYTE PTR [eax]
 31038b3:	00 7c 3b 10          	add    BYTE PTR [ebx+edi*1+0x10],bh
 31038b7:	03 07                	add    eax,DWORD PTR [edi]
 31038b9:	13 00                	adc    eax,DWORD PTR [eax]
 31038bb:	00 80 3b 10 03 07    	add    BYTE PTR [eax+0x703103b],al
 31038c1:	14 00                	adc    al,0x0
 31038c3:	00 84 3b 10 03 07 15 	add    BYTE PTR [ebx+edi*1+0x15070310],al
 31038ca:	00 00                	add    BYTE PTR [eax],al
 31038cc:	88 3b                	mov    BYTE PTR [ebx],bh
 31038ce:	10 03                	adc    BYTE PTR [ebx],al
 31038d0:	07                   	pop    es
 31038d1:	16                   	push   ss
 31038d2:	00 00                	add    BYTE PTR [eax],al
 31038d4:	8c 3b                	mov    WORD PTR [ebx],?
 31038d6:	10 03                	adc    BYTE PTR [ebx],al
 31038d8:	07                   	pop    es
 31038d9:	17                   	pop    ss
 31038da:	00 00                	add    BYTE PTR [eax],al
 31038dc:	90                   	nop
 31038dd:	3b 10                	cmp    edx,DWORD PTR [eax]
 31038df:	03 07                	add    eax,DWORD PTR [edi]
 31038e1:	18 00                	sbb    BYTE PTR [eax],al
 31038e3:	00 94 3b 10 03 07 19 	add    BYTE PTR [ebx+edi*1+0x19070310],dl
 31038ea:	00 00                	add    BYTE PTR [eax],al
 31038ec:	98                   	cwde   
 31038ed:	3b 10                	cmp    edx,DWORD PTR [eax]
 31038ef:	03 07                	add    eax,DWORD PTR [edi]
 31038f1:	1a 00                	sbb    al,BYTE PTR [eax]
 31038f3:	00 9c 3b 10 03 07 1b 	add    BYTE PTR [ebx+edi*1+0x1b070310],bl
 31038fa:	00 00                	add    BYTE PTR [eax],al
 31038fc:	a0 3b 10 03 07       	mov    al,ds:0x703103b
 3103901:	1c 00                	sbb    al,0x0
 3103903:	00 a4 3b 10 03 07 1d 	add    BYTE PTR [ebx+edi*1+0x1d070310],ah
 310390a:	00 00                	add    BYTE PTR [eax],al
 310390c:	a8 3b                	test   al,0x3b
 310390e:	10 03                	adc    BYTE PTR [ebx],al
 3103910:	07                   	pop    es
 3103911:	1e                   	push   ds
 3103912:	00 00                	add    BYTE PTR [eax],al
 3103914:	ac                   	lods   al,BYTE PTR ds:[esi]
 3103915:	3b 10                	cmp    edx,DWORD PTR [eax]
 3103917:	03 07                	add    eax,DWORD PTR [edi]
 3103919:	1f                   	pop    ds
 310391a:	00 00                	add    BYTE PTR [eax],al
 310391c:	b0 3b                	mov    al,0x3b
 310391e:	10 03                	adc    BYTE PTR [ebx],al
 3103920:	07                   	pop    es
 3103921:	20 00                	and    BYTE PTR [eax],al
 3103923:	00 b4 3b 10 03 07 21 	add    BYTE PTR [ebx+edi*1+0x21070310],dh
 310392a:	00 00                	add    BYTE PTR [eax],al
 310392c:	b8 3b 10 03 07       	mov    eax,0x703103b
 3103931:	22 00                	and    al,BYTE PTR [eax]
 3103933:	00 bc 3b 10 03 07 23 	add    BYTE PTR [ebx+edi*1+0x23070310],bh
 310393a:	00 00                	add    BYTE PTR [eax],al
 310393c:	c0 3b 10             	sar    BYTE PTR [ebx],0x10
 310393f:	03 07                	add    eax,DWORD PTR [edi]
 3103941:	24 00                	and    al,0x0
 3103943:	00 c4                	add    ah,al
 3103945:	3b 10                	cmp    edx,DWORD PTR [eax]
 3103947:	03 07                	add    eax,DWORD PTR [edi]
 3103949:	25 00 00 c8 3b       	and    eax,0x3bc80000
 310394e:	10 03                	adc    BYTE PTR [ebx],al
 3103950:	07                   	pop    es
 3103951:	26 00 00             	add    BYTE PTR es:[eax],al
 3103954:	cc                   	int3   
 3103955:	3b 10                	cmp    edx,DWORD PTR [eax]
 3103957:	03 07                	add    eax,DWORD PTR [edi]
 3103959:	27                   	daa    
 310395a:	00 00                	add    BYTE PTR [eax],al
 310395c:	d0 3b                	sar    BYTE PTR [ebx],1
 310395e:	10 03                	adc    BYTE PTR [ebx],al
 3103960:	07                   	pop    es
 3103961:	28 00                	sub    BYTE PTR [eax],al
 3103963:	00 d4                	add    ah,dl
 3103965:	3b 10                	cmp    edx,DWORD PTR [eax]
 3103967:	03 07                	add    eax,DWORD PTR [edi]
 3103969:	29 00                	sub    DWORD PTR [eax],eax
 310396b:	00 d8                	add    al,bl
 310396d:	3b 10                	cmp    edx,DWORD PTR [eax]
 310396f:	03 07                	add    eax,DWORD PTR [edi]
 3103971:	2a 00                	sub    al,BYTE PTR [eax]
 3103973:	00 dc                	add    ah,bl
 3103975:	3b 10                	cmp    edx,DWORD PTR [eax]
 3103977:	03 07                	add    eax,DWORD PTR [edi]
 3103979:	2b 00                	sub    eax,DWORD PTR [eax]
 310397b:	00 e0                	add    al,ah
 310397d:	3b 10                	cmp    edx,DWORD PTR [eax]
 310397f:	03 07                	add    eax,DWORD PTR [edi]
 3103981:	2c 00                	sub    al,0x0
	...

Disassembly of section .data.rel.local:

031039a0 <cmds>:
/home/yogi/src/os/aproj/kshell/include/kshell.h:64
    bool timeToExit;
    char cwd[256];
    bool bSigIntReceived;
    int execPipes[2];

static command_table_t cmds[] = { 
 31039a0:	20 25 10 03 23 25    	and    BYTE PTR ds:0x25230310,ah
 31039a6:	10 03                	adc    BYTE PTR [ebx],al
 31039a8:	6b 09 10             	imul   ecx,DWORD PTR [ecx],0x10
 31039ab:	03 01                	add    eax,DWORD PTR [ecx]
 31039ad:	00 00                	add    BYTE PTR [eax],al
 31039af:	00 34 25 10 03 3a 25 	add    BYTE PTR [eiz*1+0x253a0310],dh
 31039b6:	10 03                	adc    BYTE PTR [ebx],al
 31039b8:	00 00                	add    BYTE PTR [eax],al
 31039ba:	10 03                	adc    BYTE PTR [ebx],al
 31039bc:	00 00                	add    BYTE PTR [eax],al
 31039be:	00 00                	add    BYTE PTR [eax],al
 31039c0:	4b                   	dec    ebx
 31039c1:	25 10 03 50 25       	and    eax,0x25500310
 31039c6:	10 03                	adc    BYTE PTR [ebx],al
 31039c8:	21 0f                	and    DWORD PTR [edi],ecx
 31039ca:	10 03                	adc    BYTE PTR [ebx],al
 31039cc:	00 00                	add    BYTE PTR [eax],al
 31039ce:	00 00                	add    BYTE PTR [eax],al
 31039d0:	68 25 10 03 6c       	push   0x6c031025
 31039d5:	25 10 03 2f 00       	and    eax,0x2f0310
 31039da:	10 03                	adc    BYTE PTR [ebx],al
 31039dc:	00 00                	add    BYTE PTR [eax],al
 31039de:	00 00                	add    BYTE PTR [eax],al
 31039e0:	7e 25                	jle    3103a07 <cmds+0x67>
 31039e2:	10 03                	adc    BYTE PTR [ebx],al
 31039e4:	83 25 10 03 cb 0b 10 	and    DWORD PTR ds:0xbcb0310,0x10
 31039eb:	03 01                	add    eax,DWORD PTR [ecx]
 31039ed:	00 00                	add    BYTE PTR [eax],al
 31039ef:	00 95 25 10 03 9a    	add    BYTE PTR [ebp-0x65fcefdb],dl
 31039f5:	25 10 03 f3 0b       	and    eax,0xbf30310
 31039fa:	10 03                	adc    BYTE PTR [ebx],al
 31039fc:	01 00                	add    DWORD PTR [eax],eax
 31039fe:	00 00                	add    BYTE PTR [eax],al
 3103a00:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 3103a01:	25 10 03 ab 25       	and    eax,0x25ab0310
 3103a06:	10 03                	adc    BYTE PTR [ebx],al
 3103a08:	65 0c 10             	gs or  al,0x10
 3103a0b:	03 01                	add    eax,DWORD PTR [ecx]
 3103a0d:	00 00                	add    BYTE PTR [eax],al
 3103a0f:	00 c7                	add    bh,al
 3103a11:	25 10 03 cb 25       	and    eax,0x25cb0310
 3103a16:	10 03                	adc    BYTE PTR [ebx],al
 3103a18:	5e                   	pop    esi
 3103a19:	0d 10 03 00 00       	or     eax,0x310
 3103a1e:	00 00                	add    BYTE PTR [eax],al
 3103a20:	e3 25                	jecxz  3103a47 <cmds+0xa7>
 3103a22:	10 03                	adc    BYTE PTR [ebx],al
 3103a24:	ea 25 10 03 ed 0a 10 	jmp    0x100a:0xed031025
 3103a2b:	03 01                	add    eax,DWORD PTR [ecx]
 3103a2d:	00 00                	add    BYTE PTR [eax],al
 3103a2f:	00 03                	add    BYTE PTR [ebx],al
 3103a31:	26 10 03             	adc    BYTE PTR es:[ebx],al
 3103a34:	06                   	push   es
 3103a35:	26 10 03             	adc    BYTE PTR es:[ebx],al
 3103a38:	44                   	inc    esp
 3103a39:	0f 10 03             	movups xmm0,XMMWORD PTR [ebx]
 3103a3c:	01 00                	add    DWORD PTR [eax],eax
 3103a3e:	00 00                	add    BYTE PTR [eax],al
 3103a40:	1e                   	push   ds
 3103a41:	26 10 03             	adc    BYTE PTR es:[ebx],al
 3103a44:	22 26                	and    ah,BYTE PTR [esi]
 3103a46:	10 03                	adc    BYTE PTR [ebx],al
 3103a48:	9a 00 10 03 01 00 00 	call   0x0:0x1031000
 3103a4f:	00 3e                	add    BYTE PTR [esi],bh
 3103a51:	26 10 03             	adc    BYTE PTR es:[ebx],al
 3103a54:	44                   	inc    esp
 3103a55:	26 10 03             	adc    BYTE PTR es:[ebx],al
 3103a58:	c1 0d 10 03 01 00 00 	ror    DWORD PTR ds:0x10310,0x0
 3103a5f:	00 58 26             	add    BYTE PTR [eax+0x26],bl
 3103a62:	10 03                	adc    BYTE PTR [ebx],al
 3103a64:	60                   	pusha  
 3103a65:	26 10 03             	adc    BYTE PTR es:[ebx],al
 3103a68:	67 0a 10             	or     dl,BYTE PTR [bx+si]
 3103a6b:	03 01                	add    eax,DWORD PTR [ecx]
 3103a6d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynamic:

03103a70 <_DYNAMIC>:
 3103a70:	01 00                	add    DWORD PTR [eax],eax
 3103a72:	00 00                	add    BYTE PTR [eax],al
 3103a74:	01 00                	add    DWORD PTR [eax],eax
 3103a76:	00 00                	add    BYTE PTR [eax],al
 3103a78:	1d 00 00 00 43       	sbb    eax,0x43000000
 3103a7d:	01 00                	add    DWORD PTR [eax],eax
 3103a7f:	00 f5                	add    ch,dh
 3103a81:	fe                   	(bad)  
 3103a82:	ff 6f dc             	jmp    FWORD PTR [edi-0x24]
 3103a85:	33 10                	xor    edx,DWORD PTR [eax]
 3103a87:	03 05 00 00 00 74    	add    eax,DWORD PTR ds:0x74000000
 3103a8d:	32 10                	xor    dl,BYTE PTR [eax]
 3103a8f:	03 06                	add    eax,DWORD PTR [esi]
 3103a91:	00 00                	add    BYTE PTR [eax],al
 3103a93:	00 a4 2f 10 03 0a 00 	add    BYTE PTR [edi+ebp*1+0xa0310],ah
 3103a9a:	00 00                	add    BYTE PTR [eax],al
 3103a9c:	66 01 00             	add    WORD PTR [eax],ax
 3103a9f:	00 0b                	add    BYTE PTR [ebx],cl
 3103aa1:	00 00                	add    BYTE PTR [eax],al
 3103aa3:	00 10                	add    BYTE PTR [eax],dl
 3103aa5:	00 00                	add    BYTE PTR [eax],al
 3103aa7:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 3103aad:	00 00                	add    BYTE PTR [eax],al
 3103aaf:	00 03                	add    BYTE PTR [ebx],al
 3103ab1:	00 00                	add    BYTE PTR [eax],al
 3103ab3:	00 28                	add    BYTE PTR [eax],ch
 3103ab5:	3b 10                	cmp    edx,DWORD PTR [eax]
 3103ab7:	03 02                	add    eax,DWORD PTR [edx]
 3103ab9:	00 00                	add    BYTE PTR [eax],al
 3103abb:	00 d0                	add    al,dl
 3103abd:	03 00                	add    eax,DWORD PTR [eax]
 3103abf:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
 3103ac2:	00 00                	add    BYTE PTR [eax],al
 3103ac4:	11 00                	adc    DWORD PTR [eax],eax
 3103ac6:	00 00                	add    BYTE PTR [eax],al
 3103ac8:	17                   	pop    ss
 3103ac9:	00 00                	add    BYTE PTR [eax],al
 3103acb:	00 b4 35 10 03 11 00 	add    BYTE PTR [ebp+esi*1+0x110310],dh
 3103ad2:	00 00                	add    BYTE PTR [eax],al
 3103ad4:	b4 35                	mov    ah,0x35
 3103ad6:	10 03                	adc    BYTE PTR [ebx],al
 3103ad8:	12 00                	adc    al,BYTE PTR [eax]
 3103ada:	00 00                	add    BYTE PTR [eax],al
 3103adc:	70 02                	jo     3103ae0 <_DYNAMIC+0x70>
 3103ade:	00 00                	add    BYTE PTR [eax],al
 3103ae0:	13 00                	adc    eax,DWORD PTR [eax]
 3103ae2:	00 00                	add    BYTE PTR [eax],al
 3103ae4:	08 00                	or     BYTE PTR [eax],al
 3103ae6:	00 00                	add    BYTE PTR [eax],al
 3103ae8:	1e                   	push   ds
 3103ae9:	00 00                	add    BYTE PTR [eax],al
 3103aeb:	00 08                	add    BYTE PTR [eax],cl
 3103aed:	00 00                	add    BYTE PTR [eax],al
 3103aef:	00 fb                	add    bl,bh
 3103af1:	ff                   	(bad)  
 3103af2:	ff 6f 01             	jmp    FWORD PTR [edi+0x1]
 3103af5:	00 00                	add    BYTE PTR [eax],al
 3103af7:	08 fa                	or     dl,bh
 3103af9:	ff                   	(bad)  
 3103afa:	ff 6f 4e             	jmp    FWORD PTR [edi+0x4e]
	...

Disassembly of section .got.plt:

03103b28 <_GLOBAL_OFFSET_TABLE_>:
 3103b28:	70 3a                	jo     3103b64 <_GLOBAL_OFFSET_TABLE_+0x3c>
 3103b2a:	10 03                	adc    BYTE PTR [ebx],al
	...
 3103b34:	a0 1f 10 03 b0       	mov    al,ds:0xb003101f
 3103b39:	1f                   	pop    ds
 3103b3a:	10 03                	adc    BYTE PTR [ebx],al
 3103b3c:	c0 1f 10             	rcr    BYTE PTR [edi],0x10
 3103b3f:	03 d0                	add    edx,eax
 3103b41:	1f                   	pop    ds
 3103b42:	10 03                	adc    BYTE PTR [ebx],al
 3103b44:	e0 1f                	loopne 3103b65 <_GLOBAL_OFFSET_TABLE_+0x3d>
 3103b46:	10 03                	adc    BYTE PTR [ebx],al
 3103b48:	f0 1f                	lock pop ds
 3103b4a:	10 03                	adc    BYTE PTR [ebx],al
 3103b4c:	00 20                	add    BYTE PTR [eax],ah
 3103b4e:	10 03                	adc    BYTE PTR [ebx],al
 3103b50:	10 20                	adc    BYTE PTR [eax],ah
 3103b52:	10 03                	adc    BYTE PTR [ebx],al
 3103b54:	20 20                	and    BYTE PTR [eax],ah
 3103b56:	10 03                	adc    BYTE PTR [ebx],al
 3103b58:	30 20                	xor    BYTE PTR [eax],ah
 3103b5a:	10 03                	adc    BYTE PTR [ebx],al
 3103b5c:	40                   	inc    eax
 3103b5d:	20 10                	and    BYTE PTR [eax],dl
 3103b5f:	03 50 20             	add    edx,DWORD PTR [eax+0x20]
 3103b62:	10 03                	adc    BYTE PTR [ebx],al
 3103b64:	60                   	pusha  
 3103b65:	20 10                	and    BYTE PTR [eax],dl
 3103b67:	03 70 20             	add    esi,DWORD PTR [eax+0x20]
 3103b6a:	10 03                	adc    BYTE PTR [ebx],al
 3103b6c:	80 20 10             	and    BYTE PTR [eax],0x10
 3103b6f:	03 90 20 10 03 a0    	add    edx,DWORD PTR [eax-0x5ffcefe0]
 3103b75:	20 10                	and    BYTE PTR [eax],dl
 3103b77:	03 b0 20 10 03 c0    	add    esi,DWORD PTR [eax-0x3ffcefe0]
 3103b7d:	20 10                	and    BYTE PTR [eax],dl
 3103b7f:	03 d0                	add    edx,eax
 3103b81:	20 10                	and    BYTE PTR [eax],dl
 3103b83:	03 e0                	add    esp,eax
 3103b85:	20 10                	and    BYTE PTR [eax],dl
 3103b87:	03 f0                	add    esi,eax
 3103b89:	20 10                	and    BYTE PTR [eax],dl
 3103b8b:	03 00                	add    eax,DWORD PTR [eax]
 3103b8d:	21 10                	and    DWORD PTR [eax],edx
 3103b8f:	03 10                	add    edx,DWORD PTR [eax]
 3103b91:	21 10                	and    DWORD PTR [eax],edx
 3103b93:	03 20                	add    esp,DWORD PTR [eax]
 3103b95:	21 10                	and    DWORD PTR [eax],edx
 3103b97:	03 30                	add    esi,DWORD PTR [eax]
 3103b99:	21 10                	and    DWORD PTR [eax],edx
 3103b9b:	03 40 21             	add    eax,DWORD PTR [eax+0x21]
 3103b9e:	10 03                	adc    BYTE PTR [ebx],al
 3103ba0:	50                   	push   eax
 3103ba1:	21 10                	and    DWORD PTR [eax],edx
 3103ba3:	03 60 21             	add    esp,DWORD PTR [eax+0x21]
 3103ba6:	10 03                	adc    BYTE PTR [ebx],al
 3103ba8:	70 21                	jo     3103bcb <_GLOBAL_OFFSET_TABLE_+0xa3>
 3103baa:	10 03                	adc    BYTE PTR [ebx],al
 3103bac:	80 21 10             	and    BYTE PTR [ecx],0x10
 3103baf:	03 90 21 10 03 a0    	add    edx,DWORD PTR [eax-0x5ffcefdf]
 3103bb5:	21 10                	and    DWORD PTR [eax],edx
 3103bb7:	03 b0 21 10 03 c0    	add    esi,DWORD PTR [eax-0x3ffcefdf]
 3103bbd:	21 10                	and    DWORD PTR [eax],edx
 3103bbf:	03 d0                	add    edx,eax
 3103bc1:	21 10                	and    DWORD PTR [eax],edx
 3103bc3:	03 e0                	add    esp,eax
 3103bc5:	21 10                	and    DWORD PTR [eax],edx
 3103bc7:	03 f0                	add    esi,eax
 3103bc9:	21 10                	and    DWORD PTR [eax],edx
 3103bcb:	03 00                	add    eax,DWORD PTR [eax]
 3103bcd:	22 10                	and    dl,BYTE PTR [eax]
 3103bcf:	03 10                	add    edx,DWORD PTR [eax]
 3103bd1:	22 10                	and    dl,BYTE PTR [eax]
 3103bd3:	03 20                	add    esp,DWORD PTR [eax]
 3103bd5:	22 10                	and    dl,BYTE PTR [eax]
 3103bd7:	03 30                	add    esi,DWORD PTR [eax]
 3103bd9:	22 10                	and    dl,BYTE PTR [eax]
 3103bdb:	03 40 22             	add    eax,DWORD PTR [eax+0x22]
 3103bde:	10 03                	adc    BYTE PTR [ebx],al
 3103be0:	50                   	push   eax
 3103be1:	22 10                	and    dl,BYTE PTR [eax]
 3103be3:	03                   	.byte 0x3

Disassembly of section .data.rel:

03103c00 <cmds>:
 3103c00:	0c 29                	or     al,0x29
 3103c02:	10 03                	adc    BYTE PTR [ebx],al
 3103c04:	0f 29 10             	movaps XMMWORD PTR [eax],xmm2
 3103c07:	03 6b 09             	add    ebp,DWORD PTR [ebx+0x9]
 3103c0a:	10 03                	adc    BYTE PTR [ebx],al
 3103c0c:	01 00                	add    DWORD PTR [eax],eax
 3103c0e:	00 00                	add    BYTE PTR [eax],al
 3103c10:	20 29                	and    BYTE PTR [ecx],ch
 3103c12:	10 03                	adc    BYTE PTR [ebx],al
 3103c14:	26 29 10             	sub    DWORD PTR es:[eax],edx
 3103c17:	03 00                	add    eax,DWORD PTR [eax]
 3103c19:	00 10                	add    BYTE PTR [eax],dl
 3103c1b:	03 00                	add    eax,DWORD PTR [eax]
 3103c1d:	00 00                	add    BYTE PTR [eax],al
 3103c1f:	00 37                	add    BYTE PTR [edi],dh
 3103c21:	29 10                	sub    DWORD PTR [eax],edx
 3103c23:	03 3c 29             	add    edi,DWORD PTR [ecx+ebp*1]
 3103c26:	10 03                	adc    BYTE PTR [ebx],al
 3103c28:	21 0f                	and    DWORD PTR [edi],ecx
 3103c2a:	10 03                	adc    BYTE PTR [ebx],al
 3103c2c:	00 00                	add    BYTE PTR [eax],al
 3103c2e:	00 00                	add    BYTE PTR [eax],al
 3103c30:	54                   	push   esp
 3103c31:	29 10                	sub    DWORD PTR [eax],edx
 3103c33:	03 58 29             	add    ebx,DWORD PTR [eax+0x29]
 3103c36:	10 03                	adc    BYTE PTR [ebx],al
 3103c38:	2f                   	das    
 3103c39:	00 10                	add    BYTE PTR [eax],dl
 3103c3b:	03 00                	add    eax,DWORD PTR [eax]
 3103c3d:	00 00                	add    BYTE PTR [eax],al
 3103c3f:	00 6a 29             	add    BYTE PTR [edx+0x29],ch
 3103c42:	10 03                	adc    BYTE PTR [ebx],al
 3103c44:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3103c45:	29 10                	sub    DWORD PTR [eax],edx
 3103c47:	03 cb                	add    ecx,ebx
 3103c49:	0b 10                	or     edx,DWORD PTR [eax]
 3103c4b:	03 01                	add    eax,DWORD PTR [ecx]
 3103c4d:	00 00                	add    BYTE PTR [eax],al
 3103c4f:	00 81 29 10 03 86    	add    BYTE PTR [ecx-0x79fcefd7],al
 3103c55:	29 10                	sub    DWORD PTR [eax],edx
 3103c57:	03 f3                	add    esi,ebx
 3103c59:	0b 10                	or     edx,DWORD PTR [eax]
 3103c5b:	03 01                	add    eax,DWORD PTR [ecx]
 3103c5d:	00 00                	add    BYTE PTR [eax],al
 3103c5f:	00 92 29 10 03 97    	add    BYTE PTR [edx-0x68fcefd7],dl
 3103c65:	29 10                	sub    DWORD PTR [eax],edx
 3103c67:	03 65 0c             	add    esp,DWORD PTR [ebp+0xc]
 3103c6a:	10 03                	adc    BYTE PTR [ebx],al
 3103c6c:	01 00                	add    DWORD PTR [eax],eax
 3103c6e:	00 00                	add    BYTE PTR [eax],al
 3103c70:	b3 29                	mov    bl,0x29
 3103c72:	10 03                	adc    BYTE PTR [ebx],al
 3103c74:	b7 29                	mov    bh,0x29
 3103c76:	10 03                	adc    BYTE PTR [ebx],al
 3103c78:	5e                   	pop    esi
 3103c79:	0d 10 03 00 00       	or     eax,0x310
 3103c7e:	00 00                	add    BYTE PTR [eax],al
 3103c80:	cf                   	iret   
 3103c81:	29 10                	sub    DWORD PTR [eax],edx
 3103c83:	03 d6                	add    edx,esi
 3103c85:	29 10                	sub    DWORD PTR [eax],edx
 3103c87:	03 ed                	add    ebp,ebp
 3103c89:	0a 10                	or     dl,BYTE PTR [eax]
 3103c8b:	03 01                	add    eax,DWORD PTR [ecx]
 3103c8d:	00 00                	add    BYTE PTR [eax],al
 3103c8f:	00 ef                	add    bh,ch
 3103c91:	29 10                	sub    DWORD PTR [eax],edx
 3103c93:	03 f2                	add    esi,edx
 3103c95:	29 10                	sub    DWORD PTR [eax],edx
 3103c97:	03 44 0f 10          	add    eax,DWORD PTR [edi+ecx*1+0x10]
 3103c9b:	03 01                	add    eax,DWORD PTR [ecx]
 3103c9d:	00 00                	add    BYTE PTR [eax],al
 3103c9f:	00 0a                	add    BYTE PTR [edx],cl
 3103ca1:	2a 10                	sub    dl,BYTE PTR [eax]
 3103ca3:	03 0e                	add    ecx,DWORD PTR [esi]
 3103ca5:	2a 10                	sub    dl,BYTE PTR [eax]
 3103ca7:	03 9a 00 10 03 01    	add    ebx,DWORD PTR [edx+0x1031000]
 3103cad:	00 00                	add    BYTE PTR [eax],al
 3103caf:	00 2a                	add    BYTE PTR [edx],ch
 3103cb1:	2a 10                	sub    dl,BYTE PTR [eax]
 3103cb3:	03 30                	add    esi,DWORD PTR [eax]
 3103cb5:	2a 10                	sub    dl,BYTE PTR [eax]
 3103cb7:	03 c1                	add    eax,ecx
 3103cb9:	0d 10 03 01 00       	or     eax,0x10310
 3103cbe:	00 00                	add    BYTE PTR [eax],al
 3103cc0:	44                   	inc    esp
 3103cc1:	2a 10                	sub    dl,BYTE PTR [eax]
 3103cc3:	03 4c 2a 10          	add    ecx,DWORD PTR [edx+ebp*1+0x10]
 3103cc7:	03 67 0a             	add    esp,DWORD PTR [edi+0xa]
 3103cca:	10 03                	adc    BYTE PTR [ebx],al
 3103ccc:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
       0:	c5 09                	lds    ecx,FWORD PTR [ecx]
       2:	00 00                	add    BYTE PTR [eax],al
       4:	04 00                	add    al,0x0
       6:	00 00                	add    BYTE PTR [eax],al
       8:	00 00                	add    BYTE PTR [eax],al
       a:	04 01                	add    al,0x1
       c:	be 03 00 00 0c       	mov    esi,0xc000003
      11:	99                   	cdq    
      12:	00 00                	add    BYTE PTR [eax],al
      14:	00 32                	add    BYTE PTR [edx],dh
      16:	00 00                	add    BYTE PTR [eax],al
      18:	00 00                	add    BYTE PTR [eax],al
      1a:	00 10                	add    BYTE PTR [eax],dl
      1c:	03 af 0f 00 00 00    	add    ebp,DWORD PTR [edi+0xf]
      22:	00 00                	add    BYTE PTR [eax],al
      24:	00 02                	add    BYTE PTR [edx],al
      26:	01 08                	add    DWORD PTR [eax],ecx
      28:	2d 02 00 00 02       	sub    eax,0x2000002
      2d:	02 07                	add    al,BYTE PTR [edi]
      2f:	ad                   	lods   eax,DWORD PTR ds:[esi]
      30:	02 00                	add    al,BYTE PTR [eax]
      32:	00 02                	add    BYTE PTR [edx],al
      34:	04 07                	add    al,0x7
      36:	4d                   	dec    ebp
      37:	02 00                	add    al,BYTE PTR [eax]
      39:	00 02                	add    BYTE PTR [edx],al
      3b:	04 07                	add    al,0x7
      3d:	48                   	dec    eax
      3e:	02 00                	add    al,BYTE PTR [eax]
      40:	00 02                	add    BYTE PTR [edx],al
      42:	01 06                	add    DWORD PTR [esi],eax
      44:	2f                   	das    
      45:	02 00                	add    al,BYTE PTR [eax]
      47:	00 02                	add    BYTE PTR [edx],al
      49:	02 05 49 01 00 00    	add    al,BYTE PTR ds:0x149
      4f:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
      56:	02 08                	add    cl,BYTE PTR [eax]
      58:	05 75 01 00 00       	add    eax,0x175
      5d:	02 08                	add    cl,BYTE PTR [eax]
      5f:	07                   	pop    es
      60:	43                   	inc    ebx
      61:	02 00                	add    al,BYTE PTR [eax]
      63:	00 02                	add    BYTE PTR [edx],al
      65:	04 05                	add    al,0x5
      67:	7a 01                	jp     6a <cmdClearScreen-0x30fff96>
      69:	00 00                	add    BYTE PTR [eax],al
      6b:	04 4f                	add    al,0x4f
      6d:	00 00                	add    BYTE PTR [eax],al
      6f:	00 7b 00             	add    BYTE PTR [ebx+0x0],bh
      72:	00 00                	add    BYTE PTR [eax],al
      74:	05 33 00 00 00       	add    eax,0x33
      79:	01 00                	add    DWORD PTR [eax],eax
      7b:	06                   	push   es
      7c:	04 07                	add    al,0x7
      7e:	04 83                	add    al,0x83
      80:	00 00                	add    BYTE PTR [eax],al
      82:	00 02                	add    BYTE PTR [edx],al
      84:	01 06                	add    DWORD PTR [esi],eax
      86:	36 02 00             	add    al,BYTE PTR ss:[eax]
      89:	00 08                	add    BYTE PTR [eax],cl
      8b:	5a                   	pop    edx
      8c:	02 00                	add    al,BYTE PTR [eax]
      8e:	00 02                	add    BYTE PTR [edx],al
      90:	34 19                	xor    al,0x19
      92:	33 00                	xor    eax,DWORD PTR [eax]
      94:	00 00                	add    BYTE PTR [eax],al
      96:	08 03                	or     BYTE PTR [ebx],al
      98:	01 00                	add    DWORD PTR [eax],eax
      9a:	00 02                	add    BYTE PTR [edx],al
      9c:	56                   	push   esi
      9d:	1a 33                	sbb    dh,BYTE PTR [ebx]
      9f:	00 00                	add    BYTE PTR [eax],al
      a1:	00 09                	add    BYTE PTR [ecx],cl
      a3:	74 02                	je     a7 <cmdClearScreen-0x30fff59>
      a5:	00 00                	add    BYTE PTR [eax],al
      a7:	04 33                	add    al,0x33
      a9:	0c b4                	or     al,0xb4
      ab:	00 00                	add    BYTE PTR [eax],al
      ad:	00 05 03 2c 40 10    	add    BYTE PTR ds:0x10402c03,al
      b3:	03 07                	add    eax,DWORD PTR [edi]
      b5:	04 7d                	add    al,0x7d
      b7:	00 00                	add    BYTE PTR [eax],al
      b9:	00 0a                	add    BYTE PTR [edx],cl
      bb:	23 00                	and    eax,DWORD PTR [eax]
      bd:	00 00                	add    BYTE PTR [eax],al
      bf:	08 03                	or     BYTE PTR [ebx],al
      c1:	2c 0c                	sub    al,0xc
      c3:	e2 00                	loop   c5 <cmdClearScreen-0x30fff3b>
      c5:	00 00                	add    BYTE PTR [eax],al
      c7:	0b 16                	or     edx,DWORD PTR [esi]
      c9:	03 00                	add    eax,DWORD PTR [eax]
      cb:	00 03                	add    BYTE PTR [ebx],al
      cd:	2e 16                	cs push ss
      cf:	8a 00                	mov    al,BYTE PTR [eax]
      d1:	00 00                	add    BYTE PTR [eax],al
      d3:	00 0b                	add    BYTE PTR [ebx],cl
      d5:	22 02                	and    al,BYTE PTR [edx]
      d7:	00 00                	add    BYTE PTR [eax],al
      d9:	03 2f                	add    ebp,DWORD PTR [edi]
      db:	13 8a 00 00 00 04    	adc    ecx,DWORD PTR [edx+0x4000000]
      e1:	00 08                	add    BYTE PTR [eax],cl
      e3:	32 01                	xor    al,BYTE PTR [ecx]
      e5:	00 00                	add    BYTE PTR [eax],al
      e7:	03 33                	add    esi,DWORD PTR [ebx]
      e9:	1b ba 00 00 00 09    	sbb    edi,DWORD PTR [edx+0x9000000]
      ef:	09 03                	or     DWORD PTR [ebx],eax
      f1:	00 00                	add    BYTE PTR [eax],al
      f3:	03 35 10 00 01 00    	add    esi,DWORD PTR ds:0x10010
      f9:	00 05 03 24 40 10    	add    BYTE PTR ds:0x10402403,al
      ff:	03 07                	add    eax,DWORD PTR [edi]
     101:	04 96                	add    al,0x96
     103:	00 00                	add    BYTE PTR [eax],al
     105:	00 09                	add    BYTE PTR [ecx],cl
     107:	82 03 00             	add    BYTE PTR [ebx],0x0
     10a:	00 03                	add    BYTE PTR [ebx],al
     10c:	36 0e                	ss push cs
     10e:	8a 00                	mov    al,BYTE PTR [eax]
     110:	00 00                	add    BYTE PTR [eax],al
     112:	05 03 00 3e 10       	add    eax,0x103e0003
     117:	03 02                	add    eax,DWORD PTR [edx]
     119:	01 02                	add    DWORD PTR [edx],eax
     11b:	f6 02 00             	test   BYTE PTR [edx],0x0
     11e:	00 02                	add    BYTE PTR [edx],al
     120:	08 04 5e             	or     BYTE PTR [esi+ebx*2],al
     123:	01 00                	add    DWORD PTR [eax],eax
     125:	00 0c 89             	add    BYTE PTR [ecx+ecx*4],cl
     128:	00 00                	add    BYTE PTR [eax],al
     12a:	00 05 18 15 8a 00    	add    BYTE PTR ds:0x8a1518,al
     130:	00 00                	add    BYTE PTR [eax],al
     132:	0c 0d                	or     al,0xd
     134:	01 00                	add    DWORD PTR [eax],eax
     136:	00 05 19 15 8a 00    	add    BYTE PTR ds:0x8a1519,al
     13c:	00 00                	add    BYTE PTR [eax],al
     13e:	0d fa 00 00 00       	or     eax,0xfa
     143:	07                   	pop    es
     144:	04 33                	add    al,0x33
     146:	00 00                	add    BYTE PTR [eax],al
     148:	00 07                	add    BYTE PTR [edi],al
     14a:	15 12 7b 01 00       	adc    eax,0x17b12
     14f:	00 0e                	add    BYTE PTR [esi],cl
     151:	fc                   	cld    
     152:	02 00                	add    al,BYTE PTR [eax]
     154:	00 01                	add    BYTE PTR [ecx],al
     156:	0e                   	push   cs
     157:	c5 01                	lds    eax,FWORD PTR [ecx]
     159:	00 00                	add    BYTE PTR [eax],al
     15b:	02 0e                	add    cl,BYTE PTR [esi]
     15d:	a8 00                	test   al,0x0
     15f:	00 00                	add    BYTE PTR [eax],al
     161:	04 0e                	add    al,0xe
     163:	d7                   	xlat   BYTE PTR ds:[ebx]
     164:	00 00                	add    BYTE PTR [eax],al
     166:	00 08                	add    BYTE PTR [eax],cl
     168:	0e                   	push   cs
     169:	24 03                	and    al,0x3
     16b:	00 00                	add    BYTE PTR [eax],al
     16d:	10 0e                	adc    BYTE PTR [esi],cl
     16f:	91                   	xchg   ecx,eax
     170:	00 00                	add    BYTE PTR [eax],al
     172:	00 20                	add    BYTE PTR [eax],ah
     174:	0e                   	push   cs
     175:	df 02                	fild   WORD PTR [edx]
     177:	00 00                	add    BYTE PTR [eax],al
     179:	40                   	inc    eax
     17a:	00 0f                	add    BYTE PTR [edi],cl
     17c:	10 06                	adc    BYTE PTR [esi],al
     17e:	1a 09                	sbb    cl,BYTE PTR [ecx]
     180:	b9 01 00 00 0b       	mov    ecx,0xb000001
     185:	15 02 00 00 06       	adc    eax,0x6000002
     18a:	1c 0b                	sbb    al,0xb
     18c:	7d 00                	jge    18e <cmdClearScreen-0x30ffe72>
     18e:	00 00                	add    BYTE PTR [eax],al
     190:	00 0b                	add    BYTE PTR [ebx],cl
     192:	69 00 00 00 06 1d    	imul   eax,DWORD PTR [eax],0x1d060000
     198:	0b 7d 00             	or     edi,DWORD PTR [ebp+0x0]
     19b:	00 00                	add    BYTE PTR [eax],al
     19d:	04 0b                	add    al,0xb
     19f:	1d 01 00 00 06       	sbb    eax,0x6000001
     1a4:	1e                   	push   ds
     1a5:	0b 7b 00             	or     edi,DWORD PTR [ebx+0x0]
     1a8:	00 00                	add    BYTE PTR [eax],al
     1aa:	08 0b                	or     BYTE PTR [ebx],cl
     1ac:	53                   	push   ebx
     1ad:	01 00                	add    DWORD PTR [eax],eax
     1af:	00 06                	add    BYTE PTR [esi],al
     1b1:	1f                   	pop    ds
     1b2:	09 4f 00             	or     DWORD PTR [edi+0x0],ecx
     1b5:	00 00                	add    BYTE PTR [eax],al
     1b7:	0c 00                	or     al,0x0
     1b9:	08 54 04 00          	or     BYTE PTR [esp+eax*1+0x0],dl
     1bd:	00 06                	add    BYTE PTR [esi],al
     1bf:	20 03                	and    BYTE PTR [ebx],al
     1c1:	7b 01                	jnp    1c4 <cmdClearScreen-0x30ffe3c>
     1c3:	00 00                	add    BYTE PTR [eax],al
     1c5:	10 09                	adc    BYTE PTR [ecx],cl
     1c7:	15 01 00 00 06       	adc    eax,0x6000001
     1cc:	2f                   	das    
     1cd:	0c d8                	or     al,0xd8
     1cf:	01 00                	add    DWORD PTR [eax],eax
     1d1:	00 05 03 28 40 10    	add    BYTE PTR ds:0x10402803,al
     1d7:	03 07                	add    eax,DWORD PTR [edi]
     1d9:	04 c5                	add    al,0xc5
     1db:	01 00                	add    DWORD PTR [eax],eax
     1dd:	00 11                	add    BYTE PTR [ecx],dl
     1df:	e9 01 00 00 12       	jmp    120001e5 <echoInput+0xeeec681>
     1e4:	7d 00                	jge    1e6 <cmdClearScreen-0x30ffe1a>
     1e6:	00 00                	add    BYTE PTR [eax],al
     1e8:	00 09                	add    BYTE PTR [ecx],cl
     1ea:	95                   	xchg   ebp,eax
     1eb:	01 00                	add    DWORD PTR [eax],eax
     1ed:	00 06                	add    BYTE PTR [esi],al
     1ef:	30 0c fb             	xor    BYTE PTR [ebx+edi*8],cl
     1f2:	01 00                	add    DWORD PTR [eax],eax
     1f4:	00 05 03 20 40 10    	add    BYTE PTR ds:0x10402003,al
     1fa:	03 07                	add    eax,DWORD PTR [edi]
     1fc:	04 de                	add    al,0xde
     1fe:	01 00                	add    DWORD PTR [eax],eax
     200:	00 04 83             	add    BYTE PTR [ebx+eax*4],al
     203:	00 00                	add    BYTE PTR [eax],al
     205:	00 12                	add    BYTE PTR [edx],dl
     207:	02 00                	add    al,BYTE PTR [eax]
     209:	00 13                	add    BYTE PTR [ebx],dl
     20b:	33 00                	xor    eax,DWORD PTR [eax]
     20d:	00 00                	add    BYTE PTR [eax],al
     20f:	ff 01                	inc    DWORD PTR [ecx]
     211:	00 09                	add    BYTE PTR [ecx],cl
     213:	da 01                	fiadd  DWORD PTR [ecx]
     215:	00 00                	add    BYTE PTR [eax],al
     217:	06                   	push   es
     218:	36 0a 01             	or     al,BYTE PTR ss:[ecx]
     21b:	02 00                	add    al,BYTE PTR [eax]
     21d:	00 05 03 20 3e 10    	add    BYTE PTR ds:0x103e2003,al
     223:	03 09                	add    ecx,DWORD PTR [ecx]
     225:	b9 00 00 00 06       	mov    ecx,0x6000000
     22a:	37                   	aaa    
     22b:	0b 7d 00             	or     edi,DWORD PTR [ebp+0x0]
     22e:	00 00                	add    BYTE PTR [eax],al
     230:	05 03 38 40 10       	add    eax,0x10403803
     235:	03 09                	add    ecx,DWORD PTR [ecx]
     237:	00 00                	add    BYTE PTR [eax],al
     239:	00 00                	add    BYTE PTR [eax],al
     23b:	06                   	push   es
     23c:	38 0c b4             	cmp    BYTE PTR [esp+esi*4],cl
     23f:	00 00                	add    BYTE PTR [eax],al
     241:	00 05 03 ec 3c 10    	add    BYTE PTR ds:0x103cec03,al
     247:	03 04 83             	add    eax,DWORD PTR [ebx+eax*4]
     24a:	00 00                	add    BYTE PTR [eax],al
     24c:	00 58 02             	add    BYTE PTR [eax+0x2],bl
     24f:	00 00                	add    BYTE PTR [eax],al
     251:	05 33 00 00 00       	add    eax,0x33
     256:	05 00 09 ec 01       	add    eax,0x1ec0900
     25b:	00 00                	add    BYTE PTR [eax],al
     25d:	06                   	push   es
     25e:	39 0a                	cmp    DWORD PTR [edx],ecx
     260:	48                   	dec    eax
     261:	02 00                	add    al,BYTE PTR [eax]
     263:	00 05 03 e4 3c 10    	add    BYTE PTR ds:0x103ce403,al
     269:	03 09                	add    ecx,DWORD PTR [ecx]
     26b:	8b 02                	mov    eax,DWORD PTR [edx]
     26d:	00 00                	add    BYTE PTR [eax],al
     26f:	06                   	push   es
     270:	3a 0e                	cmp    cl,BYTE PTR [esi]
     272:	8a 00                	mov    al,BYTE PTR [eax]
     274:	00 00                	add    BYTE PTR [eax],al
     276:	05 03 34 40 10       	add    eax,0x10403403
     27b:	03 09                	add    ecx,DWORD PTR [ecx]
     27d:	63 02                	arpl   WORD PTR [edx],ax
     27f:	00 00                	add    BYTE PTR [eax],al
     281:	06                   	push   es
     282:	3a 18                	cmp    bl,BYTE PTR [eax]
     284:	8a 00                	mov    al,BYTE PTR [eax]
     286:	00 00                	add    BYTE PTR [eax],al
     288:	05 03 30 40 10       	add    eax,0x10403003
     28d:	03 09                	add    ecx,DWORD PTR [ecx]
     28f:	cc                   	int3   
     290:	00 00                	add    BYTE PTR [eax],al
     292:	00 06                	add    BYTE PTR [esi],al
     294:	3b 0a                	cmp    ecx,DWORD PTR [edx]
     296:	18 01                	sbb    BYTE PTR [ecx],al
     298:	00 00                	add    BYTE PTR [eax],al
     29a:	05 03 3c 40 10       	add    eax,0x10403c03
     29f:	03 04 83             	add    eax,DWORD PTR [ebx+eax*4]
     2a2:	00 00                	add    BYTE PTR [eax],al
     2a4:	00 b0 02 00 00 05    	add    BYTE PTR [eax+0x5000002],dh
     2aa:	33 00                	xor    eax,DWORD PTR [eax]
     2ac:	00 00                	add    BYTE PTR [eax],al
     2ae:	ff 00                	inc    DWORD PTR [eax]
     2b0:	14 63                	adc    al,0x63
     2b2:	77 64                	ja     318 <cmdClearScreen-0x30ffce8>
     2b4:	00 06                	add    BYTE PTR [esi],al
     2b6:	3c 0a                	cmp    al,0xa
     2b8:	a0 02 00 00 05       	mov    al,ds:0x5000002
     2bd:	03 00                	add    eax,DWORD PTR [eax]
     2bf:	3d 10 03 09 65       	cmp    eax,0x65090310
     2c4:	01 00                	add    DWORD PTR [eax],eax
     2c6:	00 06                	add    BYTE PTR [esi],al
     2c8:	3d 0a 18 01 00       	cmp    eax,0x1180a
     2cd:	00 05 03 e0 3c 10    	add    BYTE PTR ds:0x103ce003,al
     2d3:	03 09                	add    ecx,DWORD PTR [ecx]
     2d5:	83 01 00             	add    DWORD PTR [ecx],0x0
     2d8:	00 06                	add    BYTE PTR [esi],al
     2da:	3e 09 6b 00          	or     DWORD PTR ds:[ebx+0x0],ebp
     2de:	00 00                	add    BYTE PTR [eax],al
     2e0:	05 03 40 40 10       	add    eax,0x10404003
     2e5:	03 04 b9             	add    eax,DWORD PTR [ecx+edi*4]
     2e8:	01 00                	add    DWORD PTR [eax],eax
     2ea:	00 f6                	add    dh,dh
     2ec:	02 00                	add    al,BYTE PTR [eax]
     2ee:	00 05 33 00 00 00    	add    BYTE PTR ds:0x33,al
     2f4:	0c 00                	or     al,0x0
     2f6:	15 b2 04 00 00       	adc    eax,0x4b2
     2fb:	06                   	push   es
     2fc:	40                   	inc    eax
     2fd:	18 e6                	sbb    dh,ah
     2ff:	02 00                	add    al,BYTE PTR [eax]
     301:	00 05 03 a0 39 10    	add    BYTE PTR ds:0x1039a003,al
     307:	03 16                	add    edx,DWORD PTR [esi]
     309:	1e                   	push   ds
     30a:	03 00                	add    eax,DWORD PTR [eax]
     30c:	00 01                	add    BYTE PTR [ecx],al
     30e:	9d                   	popf   
     30f:	01 06                	add    DWORD PTR [esi],eax
     311:	44                   	inc    esp
     312:	0f 10 03             	movups xmm0,XMMWORD PTR [ebx]
     315:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
     318:	00 01                	add    BYTE PTR [ecx],al
     31a:	9c                   	pushf  
     31b:	40                   	inc    eax
     31c:	03 00                	add    eax,DWORD PTR [eax]
     31e:	00 17                	add    BYTE PTR [edi],dl
     320:	06                   	push   es
     321:	02 00                	add    al,BYTE PTR [eax]
     323:	00 01                	add    BYTE PTR [ecx],al
     325:	9d                   	popf   
     326:	01 12                	add    DWORD PTR [edx],edx
     328:	7d 00                	jge    32a <cmdClearScreen-0x30ffcd6>
     32a:	00 00                	add    BYTE PTR [eax],al
     32c:	02 91 00 18 39 06    	add    dl,BYTE PTR [ecx+0x6391800]
     332:	00 00                	add    BYTE PTR [eax],al
     334:	01 9f 01 0b 7d 00    	add    DWORD PTR [edi+0x7d0b01],ebx
     33a:	00 00                	add    BYTE PTR [eax],al
     33c:	02 91 6c 00 19 9f    	add    dl,BYTE PTR [ecx-0x60e6ff94]
     342:	03 00                	add    eax,DWORD PTR [eax]
     344:	00 01                	add    BYTE PTR [ecx],al
     346:	98                   	cwde   
     347:	01 06                	add    DWORD PTR [esi],eax
     349:	21 0f                	and    DWORD PTR [edi],ecx
     34b:	10 03                	adc    BYTE PTR [ebx],al
     34d:	23 00                	and    eax,DWORD PTR [eax]
     34f:	00 00                	add    BYTE PTR [eax],al
     351:	01 9c 16 a8 01 00 00 	add    DWORD PTR [esi+edx*1+0x1a8],ebx
     358:	01 7f 01             	add    DWORD PTR [edi+0x1],edi
     35b:	06                   	push   es
     35c:	c1 0d 10 03 60 01 00 	ror    DWORD PTR ds:0x1600310,0x0
     363:	00 01                	add    BYTE PTR [ecx],al
     365:	9c                   	pushf  
     366:	f5                   	cmc    
     367:	03 00                	add    eax,DWORD PTR [eax]
     369:	00 17                	add    BYTE PTR [edi],dl
     36b:	06                   	push   es
     36c:	02 00                	add    al,BYTE PTR [eax]
     36e:	00 01                	add    BYTE PTR [ecx],al
     370:	7f 01                	jg     373 <cmdClearScreen-0x30ffc8d>
     372:	15 7d 00 00 00       	adc    eax,0x7d
     377:	02 91 00 18 0e 02    	add    dl,BYTE PTR [ecx+0x20e1800]
     37d:	00 00                	add    BYTE PTR [eax],al
     37f:	01 81 01 0a f5 03    	add    DWORD PTR [ecx+0x3f50a01],eax
     385:	00 00                	add    BYTE PTR [eax],al
     387:	03 91 d8 75 18 53    	add    edx,DWORD PTR [ecx+0x531875d8]
     38d:	01 00                	add    DWORD PTR [eax],eax
     38f:	00 01                	add    BYTE PTR [ecx],al
     391:	82 01 09             	add    BYTE PTR [ecx],0x9
     394:	4f                   	dec    edi
     395:	00 00                	add    BYTE PTR [eax],al
     397:	00 02                	add    BYTE PTR [edx],al
     399:	91                   	xchg   ecx,eax
     39a:	64 18 19             	sbb    BYTE PTR fs:[ecx],bl
     39d:	03 00                	add    eax,DWORD PTR [eax]
     39f:	00 01                	add    BYTE PTR [ecx],al
     3a1:	85 01                	test   DWORD PTR [ecx],eax
     3a3:	09 4f 00             	or     DWORD PTR [edi+0x0],ecx
     3a6:	00 00                	add    BYTE PTR [eax],al
     3a8:	02 91 60 18 04 03    	add    dl,BYTE PTR [ecx+0x3041860]
     3ae:	00 00                	add    BYTE PTR [eax],al
     3b0:	01 86 01 09 0b 04    	add    DWORD PTR [esi+0x40b0901],eax
     3b6:	00 00                	add    BYTE PTR [eax],al
     3b8:	03 91 58 06 1a 7f    	add    edx,DWORD PTR [ecx+0x7f1a0658]
     3be:	0e                   	push   cs
     3bf:	10 03                	adc    BYTE PTR [ebx],al
     3c1:	21 00                	and    DWORD PTR [eax],eax
     3c3:	00 00                	add    BYTE PTR [eax],al
     3c5:	da 03                	fiadd  DWORD PTR [ebx]
     3c7:	00 00                	add    BYTE PTR [eax],al
     3c9:	1b 63 6e             	sbb    esp,DWORD PTR [ebx+0x6e]
     3cc:	74 00                	je     3ce <cmdClearScreen-0x30ffc32>
     3ce:	01 88 01 0e 4f 00    	add    DWORD PTR [eax+0x4f0e01],ecx
     3d4:	00 00                	add    BYTE PTR [eax],al
     3d6:	02 91 68 00 1c a0    	add    dl,BYTE PTR [ecx-0x5fe3ff98]
     3dc:	0e                   	push   cs
     3dd:	10 03                	adc    BYTE PTR [ebx],al
     3df:	35 00 00 00 1b       	xor    eax,0x1b000000
     3e4:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     3e7:	00 01                	add    BYTE PTR [ecx],al
     3e9:	8b 01                	mov    eax,DWORD PTR [ecx]
     3eb:	0e                   	push   cs
     3ec:	4f                   	dec    edi
     3ed:	00 00                	add    BYTE PTR [eax],al
     3ef:	00 02                	add    BYTE PTR [edx],al
     3f1:	91                   	xchg   ecx,eax
     3f2:	6c                   	ins    BYTE PTR es:[edi],dx
     3f3:	00 00                	add    BYTE PTR [eax],al
     3f5:	04 83                	add    al,0x83
     3f7:	00 00                	add    BYTE PTR [eax],al
     3f9:	00 0b                	add    BYTE PTR [ebx],cl
     3fb:	04 00                	add    al,0x0
     3fd:	00 05 33 00 00 00    	add    BYTE PTR ds:0x33,al
     403:	09 05 33 00 00 00    	or     DWORD PTR ds:0x33,eax
     409:	7f 00                	jg     40b <cmdClearScreen-0x30ffbf5>
     40b:	04 4f                	add    al,0x4f
     40d:	00 00                	add    BYTE PTR [eax],al
     40f:	00 1e                	add    BYTE PTR [esi],bl
     411:	04 00                	add    al,0x0
     413:	00 1d 33 00 00 00    	add    BYTE PTR ds:0x33,bl
     419:	03 91 5c 06 00 1e    	add    edx,DWORD PTR [ecx+0x1e00065c]
     41f:	b2 00                	mov    dl,0x0
     421:	00 00                	add    BYTE PTR [eax],al
     423:	01 78 01             	add    DWORD PTR [eax+0x1],edi
     426:	06                   	push   es
     427:	5e                   	pop    esi
     428:	0d 10 03 63 00       	or     eax,0x630310
     42d:	00 00                	add    BYTE PTR [eax],al
     42f:	01 9c 46 04 00 00 1b 	add    DWORD PTR [esi+eax*2+0x1b000004],ebx
     436:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
     439:	00 01                	add    BYTE PTR [ecx],al
     43b:	7a 01                	jp     43e <cmdClearScreen-0x30ffbc2>
     43d:	0b 7d 00             	or     edi,DWORD PTR [ebp+0x0]
     440:	00 00                	add    BYTE PTR [eax],al
     442:	02 91 6c 00 16 3b    	add    dl,BYTE PTR [ecx+0x3b16006c]
     448:	02 00                	add    al,BYTE PTR [eax]
     44a:	00 01                	add    BYTE PTR [ecx],al
     44c:	5f                   	pop    edi
     44d:	01 06                	add    DWORD PTR [esi],eax
     44f:	65 0c 10             	gs or  al,0x10
     452:	03 f9                	add    edi,ecx
     454:	00 00                	add    BYTE PTR [eax],al
     456:	00 01                	add    BYTE PTR [ecx],al
     458:	9c                   	pushf  
     459:	98                   	cwde   
     45a:	04 00                	add    al,0x0
     45c:	00 17                	add    BYTE PTR [edi],dl
     45e:	06                   	push   es
     45f:	02 00                	add    al,BYTE PTR [eax]
     461:	00 01                	add    BYTE PTR [ecx],al
     463:	5f                   	pop    edi
     464:	01 14 7d 00 00 00 02 	add    DWORD PTR [edi*2+0x2000000],edx
     46b:	91                   	xchg   ecx,eax
     46c:	00 1b                	add    BYTE PTR [ebx],bl
     46e:	74 6f                	je     4df <cmdClearScreen-0x30ffb21>
     470:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
     473:	61                   	popa   
     474:	01 0b                	add    DWORD PTR [ebx],ecx
     476:	7d 00                	jge    478 <cmdClearScreen-0x30ffb88>
     478:	00 00                	add    BYTE PTR [eax],al
     47a:	02 91 68 1c a8 0c    	add    dl,BYTE PTR [ecx+0xca81c68]
     480:	10 03                	adc    BYTE PTR [ebx],al
     482:	af                   	scas   eax,DWORD PTR es:[edi]
     483:	00 00                	add    BYTE PTR [eax],al
     485:	00 1b                	add    BYTE PTR [ebx],bl
     487:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
     48a:	00 01                	add    BYTE PTR [ecx],al
     48c:	6b 01 13             	imul   eax,DWORD PTR [ecx],0x13
     48f:	33 00                	xor    eax,DWORD PTR [eax]
     491:	00 00                	add    BYTE PTR [eax],al
     493:	02 91 6c 00 00 16    	add    dl,BYTE PTR [ecx+0x1600006c]
     499:	2a 00                	sub    al,BYTE PTR [eax]
     49b:	00 00                	add    BYTE PTR [eax],al
     49d:	01 52 01             	add    DWORD PTR [edx+0x1],edx
     4a0:	06                   	push   es
     4a1:	f3 0b 10             	repz or edx,DWORD PTR [eax]
     4a4:	03 72 00             	add    esi,DWORD PTR [edx+0x0]
     4a7:	00 00                	add    BYTE PTR [eax],al
     4a9:	01 9c d1 04 00 00 17 	add    DWORD PTR [ecx+edx*8+0x17000004],ebx
     4b0:	06                   	push   es
     4b1:	02 00                	add    al,BYTE PTR [eax]
     4b3:	00 01                	add    BYTE PTR [ecx],al
     4b5:	52                   	push   edx
     4b6:	01 14 7d 00 00 00 02 	add    DWORD PTR [edi*2+0x2000000],edx
     4bd:	91                   	xchg   ecx,eax
     4be:	00 18                	add    BYTE PTR [eax],bl
     4c0:	0e                   	push   cs
     4c1:	02 00                	add    al,BYTE PTR [eax]
     4c3:	00 01                	add    BYTE PTR [ecx],al
     4c5:	54                   	push   esp
     4c6:	01 0a                	add    DWORD PTR [edx],ecx
     4c8:	f5                   	cmc    
     4c9:	03 00                	add    eax,DWORD PTR [eax]
     4cb:	00 03                	add    BYTE PTR [ebx],al
     4cd:	91                   	xchg   ecx,eax
     4ce:	f0 75 00             	lock jne 4d1 <cmdClearScreen-0x30ffb2f>
     4d1:	16                   	push   ss
     4d2:	80 00 00             	add    BYTE PTR [eax],0x0
     4d5:	00 01                	add    BYTE PTR [ecx],al
     4d7:	4d                   	dec    ebp
     4d8:	01 06                	add    DWORD PTR [esi],eax
     4da:	cb                   	retf   
     4db:	0b 10                	or     edx,DWORD PTR [eax]
     4dd:	03 28                	add    ebp,DWORD PTR [eax]
     4df:	00 00                	add    BYTE PTR [eax],al
     4e1:	00 01                	add    BYTE PTR [ecx],al
     4e3:	9c                   	pushf  
     4e4:	f9                   	stc    
     4e5:	04 00                	add    al,0x0
     4e7:	00 17                	add    BYTE PTR [edi],dl
     4e9:	06                   	push   es
     4ea:	02 00                	add    al,BYTE PTR [eax]
     4ec:	00 01                	add    BYTE PTR [ecx],al
     4ee:	4d                   	dec    ebp
     4ef:	01 15 7d 00 00 00    	add    DWORD PTR ds:0x7d,edx
     4f5:	02 91 00 00 16 4c    	add    dl,BYTE PTR [ecx+0x4c160000]
     4fb:	03 00                	add    eax,DWORD PTR [eax]
     4fd:	00 01                	add    BYTE PTR [ecx],al
     4ff:	2e 01 06             	add    DWORD PTR cs:[esi],eax
     502:	ed                   	in     eax,dx
     503:	0a 10                	or     dl,BYTE PTR [eax]
     505:	03 de                	add    ebx,esi
     507:	00 00                	add    BYTE PTR [eax],al
     509:	00 01                	add    BYTE PTR [ecx],al
     50b:	9c                   	pushf  
     50c:	77 05                	ja     513 <cmdClearScreen-0x30ffaed>
     50e:	00 00                	add    BYTE PTR [eax],al
     510:	17                   	pop    ss
     511:	06                   	push   es
     512:	02 00                	add    al,BYTE PTR [eax]
     514:	00 01                	add    BYTE PTR [ecx],al
     516:	2e 01 17             	add    DWORD PTR cs:[edi],edx
     519:	7d 00                	jge    51b <cmdClearScreen-0x30ffae5>
     51b:	00 00                	add    BYTE PTR [eax],al
     51d:	02 91 00 18 6c 05    	add    dl,BYTE PTR [ecx+0x56c1800]
     523:	00 00                	add    BYTE PTR [eax],al
     525:	01 30                	add    DWORD PTR [eax],esi
     527:	01 09                	add    DWORD PTR [ecx],ecx
     529:	4f                   	dec    edi
     52a:	00 00                	add    BYTE PTR [eax],al
     52c:	00 02                	add    BYTE PTR [edx],al
     52e:	91                   	xchg   ecx,eax
     52f:	5c                   	pop    esp
     530:	18 a0 05 00 00 01    	sbb    BYTE PTR [eax+0x1000005],ah
     536:	31 01                	xor    DWORD PTR [ecx],eax
     538:	0c b4                	or     al,0xb4
     53a:	00 00                	add    BYTE PTR [eax],al
     53c:	00 02                	add    BYTE PTR [edx],al
     53e:	91                   	xchg   ecx,eax
     53f:	60                   	pusha  
     540:	18 2a                	sbb    BYTE PTR [edx],ch
     542:	05 00 00 01 32       	add    eax,0x32010000
     547:	01 09                	add    DWORD PTR [ecx],ecx
     549:	4f                   	dec    edi
     54a:	00 00                	add    BYTE PTR [eax],al
     54c:	00 02                	add    BYTE PTR [edx],al
     54e:	91                   	xchg   ecx,eax
     54f:	64 18 75 00          	sbb    BYTE PTR fs:[ebp+0x0],dh
     553:	00 00                	add    BYTE PTR [eax],al
     555:	01 33                	add    DWORD PTR [ebx],esi
     557:	01 0b                	add    DWORD PTR [ebx],ecx
     559:	7d 00                	jge    55b <cmdClearScreen-0x30ffaa5>
     55b:	00 00                	add    BYTE PTR [eax],al
     55d:	02 91 6c 1f 00 00    	add    dl,BYTE PTR [ecx+0x1f6c]
     563:	00 00                	add    BYTE PTR [eax],al
     565:	1b 63 6e             	sbb    esp,DWORD PTR [ebx+0x6e]
     568:	74 00                	je     56a <cmdClearScreen-0x30ffa96>
     56a:	01 3f                	add    DWORD PTR [edi],edi
     56c:	01 0e                	add    DWORD PTR [esi],ecx
     56e:	4f                   	dec    edi
     56f:	00 00                	add    BYTE PTR [eax],al
     571:	00 02                	add    BYTE PTR [edx],al
     573:	91                   	xchg   ecx,eax
     574:	68 00 00 16 ee       	push   0xee160000
     579:	02 00                	add    al,BYTE PTR [eax]
     57b:	00 01                	add    BYTE PTR [ecx],al
     57d:	1d 01 06 67 0a       	sbb    eax,0xa670601
     582:	10 03                	adc    BYTE PTR [ebx],al
     584:	86 00                	xchg   BYTE PTR [eax],al
     586:	00 00                	add    BYTE PTR [eax],al
     588:	01 9c bf 05 00 00 17 	add    DWORD PTR [edi+edi*4+0x17000005],ebx
     58f:	06                   	push   es
     590:	02 00                	add    al,BYTE PTR [eax]
     592:	00 01                	add    BYTE PTR [ecx],al
     594:	1d 01 14 7d 00       	sbb    eax,0x7d1401
     599:	00 00                	add    BYTE PTR [eax],al
     59b:	02 91 00 18 de 00    	add    dl,BYTE PTR [ecx+0xde1800]
     5a1:	00 00                	add    BYTE PTR [eax],al
     5a3:	01 1f                	add    DWORD PTR [edi],ebx
     5a5:	01 0e                	add    DWORD PTR [esi],ecx
     5a7:	8a 00                	mov    al,BYTE PTR [eax]
     5a9:	00 00                	add    BYTE PTR [eax],al
     5ab:	02 91 6c 18 e5 02    	add    dl,BYTE PTR [ecx+0x2e5186c]
     5b1:	00 00                	add    BYTE PTR [eax],al
     5b3:	01 1f                	add    DWORD PTR [edi],ebx
     5b5:	01 1a                	add    DWORD PTR [edx],ebx
     5b7:	8a 00                	mov    al,BYTE PTR [eax]
     5b9:	00 00                	add    BYTE PTR [eax],al
     5bb:	02 91 68 00 16 f2    	add    dl,BYTE PTR [ecx-0xde9ff98]
     5c1:	01 00                	add    DWORD PTR [eax],eax
     5c3:	00 01                	add    BYTE PTR [ecx],al
     5c5:	03 01                	add    eax,DWORD PTR [ecx]
     5c7:	06                   	push   es
     5c8:	6b 09 10             	imul   ecx,DWORD PTR [ecx],0x10
     5cb:	03 fc                	add    edi,esp
     5cd:	00 00                	add    BYTE PTR [eax],al
     5cf:	00 01                	add    BYTE PTR [ecx],al
     5d1:	9c                   	pushf  
     5d2:	17                   	pop    ss
     5d3:	06                   	push   es
     5d4:	00 00                	add    BYTE PTR [eax],al
     5d6:	17                   	pop    ss
     5d7:	06                   	push   es
     5d8:	02 00                	add    al,BYTE PTR [eax]
     5da:	00 01                	add    BYTE PTR [ecx],al
     5dc:	03 01                	add    eax,DWORD PTR [ecx]
     5de:	1f                   	pop    ds
     5df:	7d 00                	jge    5e1 <cmdClearScreen-0x30ffa1f>
     5e1:	00 00                	add    BYTE PTR [eax],al
     5e3:	02 91 00 18 24 00    	add    dl,BYTE PTR [ecx+0x241800]
     5e9:	00 00                	add    BYTE PTR [eax],al
     5eb:	01 05 01 0d e2 00    	add    DWORD PTR ds:0xe20d01,eax
     5f1:	00 00                	add    BYTE PTR [eax],al
     5f3:	02 91 60 18 05 02    	add    dl,BYTE PTR [ecx+0x2051860]
     5f9:	00 00                	add    BYTE PTR [eax],al
     5fb:	01 06                	add    DWORD PTR [esi],eax
     5fd:	01 0b                	add    DWORD PTR [ebx],ecx
     5ff:	7d 00                	jge    601 <cmdClearScreen-0x30ff9ff>
     601:	00 00                	add    BYTE PTR [eax],al
     603:	02 91 68 18 69 03    	add    dl,BYTE PTR [ecx+0x3691868]
     609:	00 00                	add    BYTE PTR [eax],al
     60b:	01 07                	add    DWORD PTR [edi],eax
     60d:	01 0a                	add    DWORD PTR [edx],ecx
     60f:	18 01                	sbb    BYTE PTR [ecx],al
     611:	00 00                	add    BYTE PTR [eax],al
     613:	02 91 6f 00 20 e9    	add    dl,BYTE PTR [ecx-0x16dfff91]
     619:	00 00                	add    BYTE PTR [eax],al
     61b:	00 01                	add    BYTE PTR [ecx],al
     61d:	4e                   	dec    esi
     61e:	05 4f 00 00 00       	add    eax,0x4f
     623:	b4 02                	mov    ah,0x2
     625:	10 03                	adc    BYTE PTR [ebx],al
     627:	b7 06                	mov    bh,0x6
     629:	00 00                	add    BYTE PTR [eax],al
     62b:	01 9c 6c 08 00 00 21 	add    DWORD PTR [esp+ebp*2+0x21000008],ebx
     632:	06                   	push   es
     633:	02 00                	add    al,BYTE PTR [eax]
     635:	00 01                	add    BYTE PTR [ecx],al
     637:	4e                   	dec    esi
     638:	11 7d 00             	adc    DWORD PTR [ebp+0x0],edi
     63b:	00 00                	add    BYTE PTR [eax],al
     63d:	02 91 00 21 6f 03    	add    dl,BYTE PTR [ecx+0x36f2100]
     643:	00 00                	add    BYTE PTR [eax],al
     645:	01 4e 1e             	add    DWORD PTR [esi+0x1e],ecx
     648:	4f                   	dec    edi
     649:	00 00                	add    BYTE PTR [eax],al
     64b:	00 02                	add    BYTE PTR [edx],al
     64d:	91                   	xchg   ecx,eax
     64e:	04 21                	add    al,0x21
     650:	ef                   	out    dx,eax
     651:	00 00                	add    BYTE PTR [eax],al
     653:	00 01                	add    BYTE PTR [ecx],al
     655:	4e                   	dec    esi
     656:	2d 4f 00 00 00       	sub    eax,0x4f
     65b:	02 91 08 21 ca 02    	add    dl,BYTE PTR [ecx+0x2ca2108]
     661:	00 00                	add    BYTE PTR [eax],al
     663:	01 4e 3d             	add    DWORD PTR [esi+0x3d],ecx
     666:	4f                   	dec    edi
     667:	00 00                	add    BYTE PTR [eax],al
     669:	00 02                	add    BYTE PTR [edx],al
     66b:	91                   	xchg   ecx,eax
     66c:	0c 15                	or     al,0x15
     66e:	ba 01 00 00 01       	mov    edx,0x1000001
     673:	50                   	push   eax
     674:	0a 18                	or     bl,BYTE PTR [eax]
     676:	01 00                	add    DWORD PTR [eax],eax
     678:	00 02                	add    BYTE PTR [edx],al
     67a:	91                   	xchg   ecx,eax
     67b:	6f                   	outs   dx,DWORD PTR ds:[esi]
     67c:	15 1a 02 00 00       	adc    eax,0x21a
     681:	01 51 09             	add    DWORD PTR [ecx+0x9],edx
     684:	4f                   	dec    edi
     685:	00 00                	add    BYTE PTR [eax],al
     687:	00 03                	add    BYTE PTR [ebx],al
     689:	91                   	xchg   ecx,eax
     68a:	b8 7f 22 74 6f       	mov    eax,0x6f74227f
     68f:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
     692:	52                   	push   edx
     693:	0b 7d 00             	or     edi,DWORD PTR [ebp+0x0]
     696:	00 00                	add    BYTE PTR [eax],al
     698:	23 70 67             	and    esi,DWORD PTR [eax+0x67]
     69b:	6d                   	ins    DWORD PTR es:[edi],dx
     69c:	00 01                	add    BYTE PTR [ecx],al
     69e:	53                   	push   ebx
     69f:	0b 7d 00             	or     edi,DWORD PTR [ebp+0x0]
     6a2:	00 00                	add    BYTE PTR [eax],al
     6a4:	03 91 b4 7f 15 94    	add    edx,DWORD PTR [ecx-0x6bea804c]
     6aa:	02 00                	add    al,BYTE PTR [eax]
     6ac:	00 01                	add    BYTE PTR [ecx],al
     6ae:	54                   	push   esp
     6af:	0a a0 02 00 00 03    	or     ah,BYTE PTR [eax+0x3000002]
     6b5:	91                   	xchg   ecx,eax
     6b6:	98                   	cwde   
     6b7:	7d 15                	jge    6ce <cmdClearScreen-0x30ff932>
     6b9:	0e                   	push   cs
     6ba:	02 00                	add    al,BYTE PTR [eax]
     6bc:	00 01                	add    BYTE PTR [ecx],al
     6be:	55                   	push   ebp
     6bf:	0a f5                	or     dh,ch
     6c1:	03 00                	add    eax,DWORD PTR [eax]
     6c3:	00 03                	add    BYTE PTR [ebx],al
     6c5:	91                   	xchg   ecx,eax
     6c6:	98                   	cwde   
     6c7:	73 15                	jae    6de <cmdClearScreen-0x30ff922>
     6c9:	0f 00 00             	sldt   WORD PTR [eax]
     6cc:	00 01                	add    BYTE PTR [ecx],al
     6ce:	56                   	push   esi
     6cf:	0b 7d 00             	or     edi,DWORD PTR [ebp+0x0]
     6d2:	00 00                	add    BYTE PTR [eax],al
     6d4:	03 91 b0 7f 15 ce    	add    edx,DWORD PTR [ecx-0x31ea8050]
     6da:	01 00                	add    DWORD PTR [eax],eax
     6dc:	00 01                	add    BYTE PTR [ecx],al
     6de:	56                   	push   esi
     6df:	1d 7d 00 00 00       	sbb    eax,0x7d
     6e4:	03 91 ac 7f 15 94    	add    edx,DWORD PTR [ecx-0x6bea8054]
     6ea:	03 00                	add    eax,DWORD PTR [eax]
     6ec:	00 01                	add    BYTE PTR [ecx],al
     6ee:	57                   	push   edi
     6ef:	0b 7d 00             	or     edi,DWORD PTR [ebp+0x0]
     6f2:	00 00                	add    BYTE PTR [eax],al
     6f4:	03 91 a8 7f 15 3d    	add    edx,DWORD PTR [ecx+0x3d157fa8]
     6fa:	03 00                	add    eax,DWORD PTR [eax]
     6fc:	00 01                	add    BYTE PTR [ecx],al
     6fe:	58                   	pop    eax
     6ff:	0b 7d 00             	or     edi,DWORD PTR [ebp+0x0]
     702:	00 00                	add    BYTE PTR [eax],al
     704:	02 91 68 15 80 02    	add    dl,BYTE PTR [ecx+0x2801568]
     70a:	00 00                	add    BYTE PTR [eax],al
     70c:	01 58 1c             	add    DWORD PTR [eax+0x1c],ebx
     70f:	7d 00                	jge    711 <cmdClearScreen-0x30ff8ef>
     711:	00 00                	add    BYTE PTR [eax],al
     713:	02 91 64 15 ac 03    	add    dl,BYTE PTR [ecx+0x3ac1564]
     719:	00 00                	add    BYTE PTR [eax],al
     71b:	01 58 2e             	add    DWORD PTR [eax+0x2e],ebx
     71e:	7d 00                	jge    720 <cmdClearScreen-0x30ff8e0>
     720:	00 00                	add    BYTE PTR [eax],al
     722:	03 91 a4 7f 15 6c    	add    edx,DWORD PTR [ecx+0x6c157fa4]
     728:	05 00 00 01 59       	add    eax,0x59010000
     72d:	09 4f 00             	or     DWORD PTR [edi+0x0],ecx
     730:	00 00                	add    BYTE PTR [eax],al
     732:	03 91 94 73 15 a0    	add    edx,DWORD PTR [ecx-0x5fea8c6c]
     738:	05 00 00 01 5a       	add    eax,0x5a010000
     73d:	0c b4                	or     al,0xb4
     73f:	00 00                	add    BYTE PTR [eax],al
     741:	00 03                	add    BYTE PTR [ebx],al
     743:	91                   	xchg   ecx,eax
     744:	9c                   	pushf  
     745:	7f 15                	jg     75c <cmdClearScreen-0x30ff8a4>
     747:	62 03                	bound  eax,QWORD PTR [ebx]
     749:	00 00                	add    BYTE PTR [eax],al
     74b:	01 5b 09             	add    DWORD PTR [ebx+0x9],ebx
     74e:	4f                   	dec    edi
     74f:	00 00                	add    BYTE PTR [eax],al
     751:	00 02                	add    BYTE PTR [edx],al
     753:	91                   	xchg   ecx,eax
     754:	60                   	pusha  
     755:	15 39 06 00 00       	adc    eax,0x639
     75a:	01 5c 0b 7d          	add    DWORD PTR [ebx+ecx*1+0x7d],ebx
     75e:	00 00                	add    BYTE PTR [eax],al
     760:	00 02                	add    BYTE PTR [edx],al
     762:	91                   	xchg   ecx,eax
     763:	5c                   	pop    esp
     764:	15 56 03 00 00       	adc    eax,0x356
     769:	01 5d 0a             	add    DWORD PTR [ebp+0xa],ebx
     76c:	18 01                	sbb    BYTE PTR [ecx],al
     76e:	00 00                	add    BYTE PTR [eax],al
     770:	03 91 a3 7f 15 c0    	add    edx,DWORD PTR [ecx-0x3fea805d]
     776:	02 00                	add    al,BYTE PTR [eax]
     778:	00 01                	add    BYTE PTR [ecx],al
     77a:	5e                   	pop    esi
     77b:	09 4f 00             	or     DWORD PTR [edi+0x0],ecx
     77e:	00 00                	add    BYTE PTR [eax],al
     780:	02 91 58 15 2c 03    	add    dl,BYTE PTR [ecx+0x32c1558]
     786:	00 00                	add    BYTE PTR [eax],al
     788:	01 5e 16             	add    DWORD PTR [esi+0x16],ebx
     78b:	4f                   	dec    edi
     78c:	00 00                	add    BYTE PTR [eax],al
     78e:	00 02                	add    BYTE PTR [edx],al
     790:	91                   	xchg   ecx,eax
     791:	54                   	push   esp
     792:	15 5d 00 00 00       	adc    eax,0x5d
     797:	01 5f 0b             	add    DWORD PTR [edi+0xb],ebx
     79a:	7d 00                	jge    79c <cmdClearScreen-0x30ff864>
     79c:	00 00                	add    BYTE PTR [eax],al
     79e:	02 91 50 24 26 01    	add    dl,BYTE PTR [ecx+0x1262450]
     7a4:	00 00                	add    BYTE PTR [eax],al
     7a6:	01 f4                	add    esp,esi
     7a8:	01 e5                	add    ebp,esp
     7aa:	08 10                	or     BYTE PTR [eax],dl
     7ac:	03 1a                	add    ebx,DWORD PTR [edx]
     7ae:	e2 03                	loop   7b3 <cmdClearScreen-0x30ff84d>
     7b0:	10 03                	adc    BYTE PTR [ebx],al
     7b2:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
     7b3:	00 00                	add    BYTE PTR [eax],al
     7b5:	00 d9                	add    cl,bl
     7b7:	07                   	pop    es
     7b8:	00 00                	add    BYTE PTR [eax],al
     7ba:	15 a7 02 00 00       	adc    eax,0x2a7
     7bf:	01 72 0f             	add    DWORD PTR [edx+0xf],esi
     7c2:	7d 00                	jge    7c4 <cmdClearScreen-0x30ff83c>
     7c4:	00 00                	add    BYTE PTR [eax],al
     7c6:	02 91 4c 23 65 6e    	add    dl,BYTE PTR [ecx+0x6e65234c]
     7cc:	64 00 01             	add    BYTE PTR fs:[ecx],al
     7cf:	75 0f                	jne    7e0 <cmdClearScreen-0x30ff820>
     7d1:	7d 00                	jge    7d3 <cmdClearScreen-0x30ff82d>
     7d3:	00 00                	add    BYTE PTR [eax],al
     7d5:	02 91 48 00 1a 93    	add    dl,BYTE PTR [ecx-0x6ce5ffb8]
     7db:	04 10                	add    al,0x10
     7dd:	03 c3                	add    eax,ebx
     7df:	00 00                	add    BYTE PTR [eax],al
     7e1:	00 05 08 00 00 15    	add    BYTE PTR ds:0x15000008,al
     7e7:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
     7e8:	02 00                	add    al,BYTE PTR [eax]
     7ea:	00 01                	add    BYTE PTR [ecx],al
     7ec:	84 0f                	test   BYTE PTR [edi],cl
     7ee:	7d 00                	jge    7f0 <cmdClearScreen-0x30ff810>
     7f0:	00 00                	add    BYTE PTR [eax],al
     7f2:	02 91 44 23 65 6e    	add    dl,BYTE PTR [ecx+0x6e652344]
     7f8:	64 00 01             	add    BYTE PTR fs:[ecx],al
     7fb:	87 0f                	xchg   DWORD PTR [edi],ecx
     7fd:	7d 00                	jge    7ff <cmdClearScreen-0x30ff801>
     7ff:	00 00                	add    BYTE PTR [eax],al
     801:	02 91 40 00 1a 97    	add    dl,BYTE PTR [ecx-0x68e5ffc0]
     807:	05 10 03 7c 00       	add    eax,0x7c0310
     80c:	00 00                	add    BYTE PTR [eax],al
     80e:	23 08                	and    ecx,DWORD PTR [eax]
     810:	00 00                	add    BYTE PTR [eax],al
     812:	15 24 00 00 00       	adc    eax,0x24
     817:	01 9e 11 e2 00 00    	add    DWORD PTR [esi+0xe211],ebx
     81d:	00 03                	add    BYTE PTR [ebx],al
     81f:	91                   	xchg   ecx,eax
     820:	8c 73 00             	mov    WORD PTR [ebx+0x0],?
     823:	1a ff                	sbb    bh,bh
     825:	06                   	push   es
     826:	10 03                	adc    BYTE PTR [ebx],al
     828:	3d 01 00 00 51       	cmp    eax,0x51000001
     82d:	08 00                	or     BYTE PTR [eax],al
     82f:	00 15 62 03 00 00    	add    BYTE PTR ds:0x362,dl
     835:	01 c2                	add    edx,eax
     837:	11 4f 00             	adc    DWORD PTR [edi+0x0],ecx
     83a:	00 00                	add    BYTE PTR [eax],al
     83c:	03 91 bc 7f 15 b1    	add    edx,DWORD PTR [ecx-0x4eea8044]
     842:	01 00                	add    DWORD PTR [eax],eax
     844:	00 01                	add    BYTE PTR [ecx],al
     846:	db 11                	fist   DWORD PTR [ecx]
     848:	4f                   	dec    edi
     849:	00 00                	add    BYTE PTR [eax],al
     84b:	00 03                	add    BYTE PTR [ebx],al
     84d:	91                   	xchg   ecx,eax
     84e:	98                   	cwde   
     84f:	7f 00                	jg     851 <cmdClearScreen-0x30ff7af>
     851:	1c 61                	sbb    al,0x61
     853:	08 10                	or     BYTE PTR [eax],dl
     855:	03 83 00 00 00 23    	add    eax,DWORD PTR [ebx+0x23000000]
     85b:	72 65                	jb     8c2 <cmdClearScreen-0x30ff73e>
     85d:	74 00                	je     85f <cmdClearScreen-0x30ff7a1>
     85f:	01 ef                	add    edi,ebp
     861:	12 6c 08 00          	adc    ch,BYTE PTR [eax+ecx*1+0x0]
     865:	00 03                	add    BYTE PTR [ebx],al
     867:	91                   	xchg   ecx,eax
     868:	82 73 00 00          	xor    BYTE PTR [ebx+0x0],0x0
     86c:	04 83                	add    al,0x83
     86e:	00 00                	add    BYTE PTR [eax],al
     870:	00 7c 08 00          	add    BYTE PTR [eax+ecx*1+0x0],bh
     874:	00 05 33 00 00 00    	add    BYTE PTR ds:0x33,al
     87a:	09 00                	or     DWORD PTR [eax],eax
     87c:	20 b7 03 00 00 01    	and    BYTE PTR [edi+0x1000003],dh
     882:	3a 05 4f 00 00 00    	cmp    al,BYTE PTR ds:0x4f
     888:	0a 02                	or     al,BYTE PTR [edx]
     88a:	10 03                	adc    BYTE PTR [ebx],al
     88c:	aa                   	stos   BYTE PTR es:[edi],al
     88d:	00 00                	add    BYTE PTR [eax],al
     88f:	00 01                	add    BYTE PTR [ecx],al
     891:	9c                   	pushf  
     892:	fb                   	sti    
     893:	08 00                	or     BYTE PTR [eax],al
     895:	00 21                	add    BYTE PTR [ecx],ah
     897:	47                   	inc    edi
     898:	03 00                	add    eax,DWORD PTR [eax]
     89a:	00 01                	add    BYTE PTR [ecx],al
     89c:	3a 12                	cmp    dl,BYTE PTR [edx]
     89e:	7d 00                	jge    8a0 <cmdClearScreen-0x30ff760>
     8a0:	00 00                	add    BYTE PTR [eax],al
     8a2:	02 91 00 21 6c 05    	add    dl,BYTE PTR [ecx+0x56c2100]
     8a8:	00 00                	add    BYTE PTR [eax],al
     8aa:	01 3a                	add    DWORD PTR [edx],edi
     8ac:	1c 4f                	sbb    al,0x4f
     8ae:	00 00                	add    BYTE PTR [eax],al
     8b0:	00 02                	add    BYTE PTR [edx],al
     8b2:	91                   	xchg   ecx,eax
     8b3:	04 21                	add    al,0x21
     8b5:	a0 05 00 00 01       	mov    al,ds:0x1000005
     8ba:	3a 29                	cmp    ch,BYTE PTR [ecx]
     8bc:	b4 00                	mov    ah,0x0
     8be:	00 00                	add    BYTE PTR [eax],al
     8c0:	02 91 08 21 ba 01    	add    dl,BYTE PTR [ecx+0x1ba2108]
     8c6:	00 00                	add    BYTE PTR [eax],al
     8c8:	01 3a                	add    DWORD PTR [edx],edi
     8ca:	34 18                	xor    al,0x18
     8cc:	01 00                	add    DWORD PTR [eax],eax
     8ce:	00 02                	add    BYTE PTR [edx],al
     8d0:	91                   	xchg   ecx,eax
     8d1:	5c                   	pop    esp
     8d2:	23 70 69             	and    esi,DWORD PTR [eax+0x69]
     8d5:	64 00 01             	add    BYTE PTR fs:[ecx],al
     8d8:	3c 09                	cmp    al,0x9
     8da:	4f                   	dec    edi
     8db:	00 00                	add    BYTE PTR [eax],al
     8dd:	00 02                	add    BYTE PTR [edx],al
     8df:	91                   	xchg   ecx,eax
     8e0:	6c                   	ins    BYTE PTR es:[edi],dx
     8e1:	1c 4e                	sbb    al,0x4e
     8e3:	02 10                	add    dl,BYTE PTR [eax]
     8e5:	03 4b 00             	add    ecx,DWORD PTR [ebx+0x0]
     8e8:	00 00                	add    BYTE PTR [eax],al
     8ea:	23 72 65             	and    esi,DWORD PTR [edx+0x65]
     8ed:	74 00                	je     8ef <cmdClearScreen-0x30ff711>
     8ef:	01 44 12 6c          	add    DWORD PTR [edx+edx*1+0x6c],eax
     8f3:	08 00                	or     BYTE PTR [eax],al
     8f5:	00 02                	add    BYTE PTR [edx],al
     8f7:	91                   	xchg   ecx,eax
     8f8:	62 00                	bound  eax,QWORD PTR [eax]
     8fa:	00 25 d5 02 00 00    	add    BYTE PTR ds:0x2d5,ah
     900:	01 1b                	add    DWORD PTR [ebx],ebx
     902:	06                   	push   es
     903:	9a 00 10 03 70 01 00 	call   0x1:0x70031000
     90a:	00 01                	add    BYTE PTR [ecx],al
     90c:	9c                   	pushf  
     90d:	86 09                	xchg   BYTE PTR [ecx],cl
     90f:	00 00                	add    BYTE PTR [eax],al
     911:	21 06                	and    DWORD PTR [esi],eax
     913:	02 00                	add    al,BYTE PTR [eax]
     915:	00 01                	add    BYTE PTR [ecx],al
     917:	1b 16                	sbb    edx,DWORD PTR [esi]
     919:	7d 00                	jge    91b <cmdClearScreen-0x30ff6e5>
     91b:	00 00                	add    BYTE PTR [eax],al
     91d:	02 91 00 15 0e 02    	add    dl,BYTE PTR [ecx+0x20e1500]
     923:	00 00                	add    BYTE PTR [eax],al
     925:	01 1d 0a f5 03 00    	add    DWORD PTR ds:0x3f50a,ebx
     92b:	00 03                	add    BYTE PTR [ebx],al
     92d:	91                   	xchg   ecx,eax
     92e:	dc 75 15             	fdiv   QWORD PTR [ebp+0x15]
     931:	8d 01                	lea    eax,[ecx]
     933:	00 00                	add    BYTE PTR [eax],al
     935:	01 1e                	add    DWORD PTR [esi],ebx
     937:	0b 7d 00             	or     edi,DWORD PTR [ebp+0x0]
     93a:	00 00                	add    BYTE PTR [eax],al
     93c:	02 91 60 15 1a 00    	add    dl,BYTE PTR [ecx+0x1a1560]
     942:	00 00                	add    BYTE PTR [eax],al
     944:	01 1e                	add    DWORD PTR [esi],ebx
     946:	15 7d 00 00 00       	adc    eax,0x7d
     94b:	02 91 5c 1c d5 00    	add    dl,BYTE PTR [ecx+0xd51c5c]
     951:	10 03                	adc    BYTE PTR [ebx],al
     953:	29 01                	sub    DWORD PTR [ecx],eax
     955:	00 00                	add    BYTE PTR [eax],al
     957:	15 9f 02 00 00       	adc    eax,0x29f
     95c:	01 22                	add    DWORD PTR [edx],esp
     95e:	0d 4f 00 00 00       	or     eax,0x4f
     963:	02 91 6c 15 79 03    	add    dl,BYTE PTR [ecx+0x379156c]
     969:	00 00                	add    BYTE PTR [eax],al
     96b:	01 22                	add    DWORD PTR [edx],esp
     96d:	18 4f 00             	sbb    BYTE PTR [edi+0x0],cl
     970:	00 00                	add    BYTE PTR [eax],al
     972:	02 91 68 15 37 03    	add    dl,BYTE PTR [ecx+0x3371568]
     978:	00 00                	add    BYTE PTR [eax],al
     97a:	01 23                	add    DWORD PTR [ebx],esp
     97c:	0d 4f 00 00 00       	or     eax,0x4f
     981:	02 91 64 00 00 26    	add    dl,BYTE PTR [ecx+0x26000064]
     987:	51                   	push   ecx
     988:	00 00                	add    BYTE PTR [eax],al
     98a:	00 01                	add    BYTE PTR [ecx],al
     98c:	0f 06                	clts   
     98e:	2f                   	das    
     98f:	00 10                	add    BYTE PTR [eax],dl
     991:	03 6b 00             	add    ebp,DWORD PTR [ebx+0x0]
     994:	00 00                	add    BYTE PTR [eax],al
     996:	01 9c b6 09 00 00 1c 	add    DWORD PTR [esi+esi*4+0x1c000009],ebx
     99d:	45                   	inc    ebp
     99e:	00 10                	add    BYTE PTR [eax],dl
     9a0:	03 4e 00             	add    ecx,DWORD PTR [esi+0x0]
     9a3:	00 00                	add    BYTE PTR [eax],al
     9a5:	23 63 6e             	and    esp,DWORD PTR [ebx+0x6e]
     9a8:	74 00                	je     9aa <cmdClearScreen-0x30ff656>
     9aa:	01 11                	add    DWORD PTR [ecx],edx
     9ac:	0e                   	push   cs
     9ad:	4f                   	dec    edi
     9ae:	00 00                	add    BYTE PTR [eax],al
     9b0:	00 02                	add    BYTE PTR [edx],al
     9b2:	91                   	xchg   ecx,eax
     9b3:	6c                   	ins    BYTE PTR es:[edi],dx
     9b4:	00 00                	add    BYTE PTR [eax],al
     9b6:	27                   	daa    
     9b7:	3a 01                	cmp    al,BYTE PTR [ecx]
     9b9:	00 00                	add    BYTE PTR [eax],al
     9bb:	01 0a                	add    DWORD PTR [edx],ecx
     9bd:	06                   	push   es
     9be:	00 00                	add    BYTE PTR [eax],al
     9c0:	10 03                	adc    BYTE PTR [ebx],al
     9c2:	2f                   	das    
     9c3:	00 00                	add    BYTE PTR [eax],al
     9c5:	00 01                	add    BYTE PTR [ecx],al
     9c7:	9c                   	pushf  
     9c8:	00 69 09             	add    BYTE PTR [ecx+0x9],ch
     9cb:	00 00                	add    BYTE PTR [eax],al
     9cd:	04 00                	add    al,0x0
     9cf:	65 02 00             	add    al,BYTE PTR gs:[eax]
     9d2:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
     9d5:	be 03 00 00 0c       	mov    esi,0xc000003
     9da:	f9                   	stc    
     9db:	05 00 00 32 00       	add    eax,0x320000
     9e0:	00 00                	add    BYTE PTR [eax],al
     9e2:	af                   	scas   eax,DWORD PTR es:[edi]
     9e3:	0f 10 03             	movups xmm0,XMMWORD PTR [ebx]
     9e6:	d7                   	xlat   BYTE PTR ds:[ebx]
     9e7:	0f 00 00             	sldt   WORD PTR [eax]
     9ea:	0c 05                	or     al,0x5
     9ec:	00 00                	add    BYTE PTR [eax],al
     9ee:	02 01                	add    al,BYTE PTR [ecx]
     9f0:	08 2d 02 00 00 02    	or     BYTE PTR ds:0x2000002,ch
     9f6:	02 07                	add    al,BYTE PTR [edi]
     9f8:	ad                   	lods   eax,DWORD PTR ds:[esi]
     9f9:	02 00                	add    al,BYTE PTR [eax]
     9fb:	00 02                	add    BYTE PTR [edx],al
     9fd:	04 07                	add    al,0x7
     9ff:	4d                   	dec    ebp
     a00:	02 00                	add    al,BYTE PTR [eax]
     a02:	00 02                	add    BYTE PTR [edx],al
     a04:	04 07                	add    al,0x7
     a06:	48                   	dec    eax
     a07:	02 00                	add    al,BYTE PTR [eax]
     a09:	00 02                	add    BYTE PTR [edx],al
     a0b:	01 06                	add    DWORD PTR [esi],eax
     a0d:	2f                   	das    
     a0e:	02 00                	add    al,BYTE PTR [eax]
     a10:	00 02                	add    BYTE PTR [edx],al
     a12:	02 05 49 01 00 00    	add    al,BYTE PTR ds:0x149
     a18:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
     a1f:	02 08                	add    cl,BYTE PTR [eax]
     a21:	05 75 01 00 00       	add    eax,0x175
     a26:	02 08                	add    cl,BYTE PTR [eax]
     a28:	07                   	pop    es
     a29:	43                   	inc    ebx
     a2a:	02 00                	add    al,BYTE PTR [eax]
     a2c:	00 02                	add    BYTE PTR [edx],al
     a2e:	04 05                	add    al,0x5
     a30:	7a 01                	jp     a33 <cmdClearScreen-0x30ff5cd>
     a32:	00 00                	add    BYTE PTR [eax],al
     a34:	04 4f                	add    al,0x4f
     a36:	00 00                	add    BYTE PTR [eax],al
     a38:	00 7b 00             	add    BYTE PTR [ebx+0x0],bh
     a3b:	00 00                	add    BYTE PTR [eax],al
     a3d:	05 33 00 00 00       	add    eax,0x33
     a42:	01 00                	add    DWORD PTR [eax],eax
     a44:	06                   	push   es
     a45:	04 07                	add    al,0x7
     a47:	04 83                	add    al,0x83
     a49:	00 00                	add    BYTE PTR [eax],al
     a4b:	00 02                	add    BYTE PTR [edx],al
     a4d:	01 06                	add    DWORD PTR [esi],eax
     a4f:	36 02 00             	add    al,BYTE PTR ss:[eax]
     a52:	00 08                	add    BYTE PTR [eax],cl
     a54:	83 00 00             	add    DWORD PTR [eax],0x0
     a57:	00 09                	add    BYTE PTR [ecx],cl
     a59:	00 05 00 00 02 2e    	add    BYTE PTR ds:0x2e020000,al
     a5f:	18 25 00 00 00 09    	sbb    BYTE PTR ds:0x9000000,ah
     a65:	5a                   	pop    edx
     a66:	02 00                	add    al,BYTE PTR [eax]
     a68:	00 02                	add    BYTE PTR [edx],al
     a6a:	34 19                	xor    al,0x19
     a6c:	33 00                	xor    eax,DWORD PTR [eax]
     a6e:	00 00                	add    BYTE PTR [eax],al
     a70:	09 03                	or     DWORD PTR [ebx],eax
     a72:	01 00                	add    DWORD PTR [eax],eax
     a74:	00 02                	add    BYTE PTR [edx],al
     a76:	56                   	push   esi
     a77:	1a 33                	sbb    dh,BYTE PTR [ebx]
     a79:	00 00                	add    BYTE PTR [eax],al
     a7b:	00 0a                	add    BYTE PTR [edx],cl
     a7d:	74 02                	je     a81 <cmdClearScreen-0x30ff57f>
     a7f:	00 00                	add    BYTE PTR [eax],al
     a81:	04 33                	add    al,0x33
     a83:	0c c5                	or     al,0xc5
     a85:	00 00                	add    BYTE PTR [eax],al
     a87:	00 05 03 2c 40 10    	add    BYTE PTR ds:0x10402c03,al
     a8d:	03 07                	add    eax,DWORD PTR [edi]
     a8f:	04 7d                	add    al,0x7d
     a91:	00 00                	add    BYTE PTR [eax],al
     a93:	00 0b                	add    BYTE PTR [ebx],cl
     a95:	23 00                	and    eax,DWORD PTR [eax]
     a97:	00 00                	add    BYTE PTR [eax],al
     a99:	08 03                	or     BYTE PTR [ebx],al
     a9b:	2c 0c                	sub    al,0xc
     a9d:	f3 00 00             	repz add BYTE PTR [eax],al
     aa0:	00 0c 16             	add    BYTE PTR [esi+edx*1],cl
     aa3:	03 00                	add    eax,DWORD PTR [eax]
     aa5:	00 03                	add    BYTE PTR [ebx],al
     aa7:	2e 16                	cs push ss
     aa9:	9b                   	fwait
     aaa:	00 00                	add    BYTE PTR [eax],al
     aac:	00 00                	add    BYTE PTR [eax],al
     aae:	0c 22                	or     al,0x22
     ab0:	02 00                	add    al,BYTE PTR [eax]
     ab2:	00 03                	add    BYTE PTR [ebx],al
     ab4:	2f                   	das    
     ab5:	13 9b 00 00 00 04    	adc    ebx,DWORD PTR [ebx+0x4000000]
     abb:	00 09                	add    BYTE PTR [ecx],cl
     abd:	32 01                	xor    al,BYTE PTR [ecx]
     abf:	00 00                	add    BYTE PTR [eax],al
     ac1:	03 33                	add    esi,DWORD PTR [ebx]
     ac3:	1b cb                	sbb    ecx,ebx
     ac5:	00 00                	add    BYTE PTR [eax],al
     ac7:	00 0a                	add    BYTE PTR [edx],cl
     ac9:	09 03                	or     DWORD PTR [ebx],eax
     acb:	00 00                	add    BYTE PTR [eax],al
     acd:	03 35 10 11 01 00    	add    esi,DWORD PTR ds:0x11110
     ad3:	00 05 03 24 40 10    	add    BYTE PTR ds:0x10402403,al
     ad9:	03 07                	add    eax,DWORD PTR [edi]
     adb:	04 a7                	add    al,0xa7
     add:	00 00                	add    BYTE PTR [eax],al
     adf:	00 0a                	add    BYTE PTR [edx],cl
     ae1:	82 03 00             	add    BYTE PTR [ebx],0x0
     ae4:	00 03                	add    BYTE PTR [ebx],al
     ae6:	36 0e                	ss push cs
     ae8:	9b                   	fwait
     ae9:	00 00                	add    BYTE PTR [eax],al
     aeb:	00 05 03 00 3e 10    	add    BYTE PTR ds:0x103e0003,al
     af1:	03 07                	add    eax,DWORD PTR [edi]
     af3:	04 8a                	add    al,0x8a
     af5:	00 00                	add    BYTE PTR [eax],al
     af7:	00 02                	add    BYTE PTR [edx],al
     af9:	01 02                	add    DWORD PTR [edx],eax
     afb:	f6 02 00             	test   BYTE PTR [edx],0x0
     afe:	00 02                	add    BYTE PTR [edx],al
     b00:	08 04 5e             	or     BYTE PTR [esi+ebx*2],al
     b03:	01 00                	add    DWORD PTR [eax],eax
     b05:	00 0d 89 00 00 00    	add    BYTE PTR ds:0x89,cl
     b0b:	05 18 15 9b 00       	add    eax,0x9b1518
     b10:	00 00                	add    BYTE PTR [eax],al
     b12:	0d 0d 01 00 00       	or     eax,0x10d
     b17:	05 19 15 9b 00       	add    eax,0x9b1519
     b1c:	00 00                	add    BYTE PTR [eax],al
     b1e:	0e                   	push   cs
     b1f:	fa                   	cli    
     b20:	00 00                	add    BYTE PTR [eax],al
     b22:	00 07                	add    BYTE PTR [edi],al
     b24:	04 33                	add    al,0x33
     b26:	00 00                	add    BYTE PTR [eax],al
     b28:	00 07                	add    BYTE PTR [edi],al
     b2a:	15 12 92 01 00       	adc    eax,0x19212
     b2f:	00 0f                	add    BYTE PTR [edi],cl
     b31:	fc                   	cld    
     b32:	02 00                	add    al,BYTE PTR [eax]
     b34:	00 01                	add    BYTE PTR [ecx],al
     b36:	0f c5                	pextrw eax,(bad),0xc5
     b38:	01 00                	add    DWORD PTR [eax],eax
     b3a:	00 02                	add    BYTE PTR [edx],al
     b3c:	0f a8                	push   gs
     b3e:	00 00                	add    BYTE PTR [eax],al
     b40:	00 04 0f             	add    BYTE PTR [edi+ecx*1],al
     b43:	d7                   	xlat   BYTE PTR ds:[ebx]
     b44:	00 00                	add    BYTE PTR [eax],al
     b46:	00 08                	add    BYTE PTR [eax],cl
     b48:	0f 24                	(bad)  
     b4a:	03 00                	add    eax,DWORD PTR [eax]
     b4c:	00 10                	add    BYTE PTR [eax],dl
     b4e:	0f 91 00             	setno  BYTE PTR [eax]
     b51:	00 00                	add    BYTE PTR [eax],al
     b53:	20 0f                	and    BYTE PTR [edi],cl
     b55:	df 02                	fild   WORD PTR [edx]
     b57:	00 00                	add    BYTE PTR [eax],al
     b59:	40                   	inc    eax
     b5a:	00 10                	add    BYTE PTR [eax],dl
     b5c:	10 06                	adc    BYTE PTR [esi],al
     b5e:	1a 09                	sbb    cl,BYTE PTR [ecx]
     b60:	d0 01                	rol    BYTE PTR [ecx],1
     b62:	00 00                	add    BYTE PTR [eax],al
     b64:	0c 15                	or     al,0x15
     b66:	02 00                	add    al,BYTE PTR [eax]
     b68:	00 06                	add    BYTE PTR [esi],al
     b6a:	1c 0b                	sbb    al,0xb
     b6c:	7d 00                	jge    b6e <cmdClearScreen-0x30ff492>
     b6e:	00 00                	add    BYTE PTR [eax],al
     b70:	00 0c 69             	add    BYTE PTR [ecx+ebp*2],cl
     b73:	00 00                	add    BYTE PTR [eax],al
     b75:	00 06                	add    BYTE PTR [esi],al
     b77:	1d 0b 7d 00 00       	sbb    eax,0x7d0b
     b7c:	00 04 0c             	add    BYTE PTR [esp+ecx*1],al
     b7f:	1d 01 00 00 06       	sbb    eax,0x6000001
     b84:	1e                   	push   ds
     b85:	0b 7b 00             	or     edi,DWORD PTR [ebx+0x0]
     b88:	00 00                	add    BYTE PTR [eax],al
     b8a:	08 0c 53             	or     BYTE PTR [ebx+edx*2],cl
     b8d:	01 00                	add    DWORD PTR [eax],eax
     b8f:	00 06                	add    BYTE PTR [esi],al
     b91:	1f                   	pop    ds
     b92:	09 4f 00             	or     DWORD PTR [edi+0x0],ecx
     b95:	00 00                	add    BYTE PTR [eax],al
     b97:	0c 00                	or     al,0x0
     b99:	09 54 04 00          	or     DWORD PTR [esp+eax*1+0x0],edx
     b9d:	00 06                	add    BYTE PTR [esi],al
     b9f:	20 03                	and    BYTE PTR [ebx],al
     ba1:	92                   	xchg   edx,eax
     ba2:	01 00                	add    DWORD PTR [eax],eax
     ba4:	00 11                	add    BYTE PTR [ecx],dl
     ba6:	0a 15 01 00 00 06    	or     dl,BYTE PTR ds:0x6000001
     bac:	2f                   	das    
     bad:	0c ef                	or     al,0xef
     baf:	01 00                	add    DWORD PTR [eax],eax
     bb1:	00 05 03 28 40 10    	add    BYTE PTR ds:0x10402803,al
     bb7:	03 07                	add    eax,DWORD PTR [edi]
     bb9:	04 dc                	add    al,0xdc
     bbb:	01 00                	add    DWORD PTR [eax],eax
     bbd:	00 12                	add    BYTE PTR [edx],dl
     bbf:	00 02                	add    BYTE PTR [edx],al
     bc1:	00 00                	add    BYTE PTR [eax],al
     bc3:	13 7d 00             	adc    edi,DWORD PTR [ebp+0x0]
     bc6:	00 00                	add    BYTE PTR [eax],al
     bc8:	00 0a                	add    BYTE PTR [edx],cl
     bca:	95                   	xchg   ebp,eax
     bcb:	01 00                	add    DWORD PTR [eax],eax
     bcd:	00 06                	add    BYTE PTR [esi],al
     bcf:	30 0c 12             	xor    BYTE PTR [edx+edx*1],cl
     bd2:	02 00                	add    al,BYTE PTR [eax]
     bd4:	00 05 03 20 40 10    	add    BYTE PTR ds:0x10402003,al
     bda:	03 07                	add    eax,DWORD PTR [edi]
     bdc:	04 f5                	add    al,0xf5
     bde:	01 00                	add    DWORD PTR [eax],eax
     be0:	00 04 83             	add    BYTE PTR [ebx+eax*4],al
     be3:	00 00                	add    BYTE PTR [eax],al
     be5:	00 29                	add    BYTE PTR [ecx],ch
     be7:	02 00                	add    al,BYTE PTR [eax]
     be9:	00 14 33             	add    BYTE PTR [ebx+esi*1],dl
     bec:	00 00                	add    BYTE PTR [eax],al
     bee:	00 ff                	add    bh,bh
     bf0:	01 00                	add    DWORD PTR [eax],eax
     bf2:	0a da                	or     bl,dl
     bf4:	01 00                	add    DWORD PTR [eax],eax
     bf6:	00 06                	add    BYTE PTR [esi],al
     bf8:	36 0a 18             	or     bl,BYTE PTR ss:[eax]
     bfb:	02 00                	add    al,BYTE PTR [eax]
     bfd:	00 05 03 20 3e 10    	add    BYTE PTR ds:0x103e2003,al
     c03:	03 0a                	add    ecx,DWORD PTR [edx]
     c05:	b9 00 00 00 06       	mov    ecx,0x6000000
     c0a:	37                   	aaa    
     c0b:	0b 7d 00             	or     edi,DWORD PTR [ebp+0x0]
     c0e:	00 00                	add    BYTE PTR [eax],al
     c10:	05 03 38 40 10       	add    eax,0x10403803
     c15:	03 0a                	add    ecx,DWORD PTR [edx]
     c17:	00 00                	add    BYTE PTR [eax],al
     c19:	00 00                	add    BYTE PTR [eax],al
     c1b:	06                   	push   es
     c1c:	38 0c c5 00 00 00 05 	cmp    BYTE PTR [eax*8+0x5000000],cl
     c23:	03 ec                	add    ebp,esp
     c25:	3c 10                	cmp    al,0x10
     c27:	03 04 83             	add    eax,DWORD PTR [ebx+eax*4]
     c2a:	00 00                	add    BYTE PTR [eax],al
     c2c:	00 6f 02             	add    BYTE PTR [edi+0x2],ch
     c2f:	00 00                	add    BYTE PTR [eax],al
     c31:	05 33 00 00 00       	add    eax,0x33
     c36:	05 00 0a ec 01       	add    eax,0x1ec0a00
     c3b:	00 00                	add    BYTE PTR [eax],al
     c3d:	06                   	push   es
     c3e:	39 0a                	cmp    DWORD PTR [edx],ecx
     c40:	5f                   	pop    edi
     c41:	02 00                	add    al,BYTE PTR [eax]
     c43:	00 05 03 e4 3c 10    	add    BYTE PTR ds:0x103ce403,al
     c49:	03 0a                	add    ecx,DWORD PTR [edx]
     c4b:	8b 02                	mov    eax,DWORD PTR [edx]
     c4d:	00 00                	add    BYTE PTR [eax],al
     c4f:	06                   	push   es
     c50:	3a 0e                	cmp    cl,BYTE PTR [esi]
     c52:	9b                   	fwait
     c53:	00 00                	add    BYTE PTR [eax],al
     c55:	00 05 03 34 40 10    	add    BYTE PTR ds:0x10403403,al
     c5b:	03 0a                	add    ecx,DWORD PTR [edx]
     c5d:	63 02                	arpl   WORD PTR [edx],ax
     c5f:	00 00                	add    BYTE PTR [eax],al
     c61:	06                   	push   es
     c62:	3a 18                	cmp    bl,BYTE PTR [eax]
     c64:	9b                   	fwait
     c65:	00 00                	add    BYTE PTR [eax],al
     c67:	00 05 03 30 40 10    	add    BYTE PTR ds:0x10403003,al
     c6d:	03 0a                	add    ecx,DWORD PTR [edx]
     c6f:	cc                   	int3   
     c70:	00 00                	add    BYTE PTR [eax],al
     c72:	00 06                	add    BYTE PTR [esi],al
     c74:	3b 0a                	cmp    ecx,DWORD PTR [edx]
     c76:	2f                   	das    
     c77:	01 00                	add    DWORD PTR [eax],eax
     c79:	00 05 03 3c 40 10    	add    BYTE PTR ds:0x10403c03,al
     c7f:	03 04 83             	add    eax,DWORD PTR [ebx+eax*4]
     c82:	00 00                	add    BYTE PTR [eax],al
     c84:	00 c7                	add    bh,al
     c86:	02 00                	add    al,BYTE PTR [eax]
     c88:	00 05 33 00 00 00    	add    BYTE PTR ds:0x33,al
     c8e:	ff 00                	inc    DWORD PTR [eax]
     c90:	15 63 77 64 00       	adc    eax,0x647763
     c95:	06                   	push   es
     c96:	3c 0a                	cmp    al,0xa
     c98:	b7 02                	mov    bh,0x2
     c9a:	00 00                	add    BYTE PTR [eax],al
     c9c:	05 03 00 3d 10       	add    eax,0x103d0003
     ca1:	03 0a                	add    ecx,DWORD PTR [edx]
     ca3:	65 01 00             	add    DWORD PTR gs:[eax],eax
     ca6:	00 06                	add    BYTE PTR [esi],al
     ca8:	3d 0a 2f 01 00       	cmp    eax,0x12f0a
     cad:	00 05 03 e0 3c 10    	add    BYTE PTR ds:0x103ce003,al
     cb3:	03 0a                	add    ecx,DWORD PTR [edx]
     cb5:	83 01 00             	add    DWORD PTR [ecx],0x0
     cb8:	00 06                	add    BYTE PTR [esi],al
     cba:	3e 09 6b 00          	or     DWORD PTR ds:[ebx+0x0],ebp
     cbe:	00 00                	add    BYTE PTR [eax],al
     cc0:	05 03 40 40 10       	add    eax,0x10404003
     cc5:	03 04 d0             	add    eax,DWORD PTR [eax+edx*8]
     cc8:	01 00                	add    DWORD PTR [eax],eax
     cca:	00 0d 03 00 00 05    	add    BYTE PTR ds:0x5000003,cl
     cd0:	33 00                	xor    eax,DWORD PTR [eax]
     cd2:	00 00                	add    BYTE PTR [eax],al
     cd4:	0c 00                	or     al,0x0
     cd6:	16                   	push   ss
     cd7:	b2 04                	mov    dl,0x4
     cd9:	00 00                	add    BYTE PTR [eax],al
     cdb:	06                   	push   es
     cdc:	40                   	inc    eax
     cdd:	18 fd                	sbb    ch,bh
     cdf:	02 00                	add    al,BYTE PTR [eax]
     ce1:	00 05 03 00 3c 10    	add    BYTE PTR ds:0x103c0003,al
     ce7:	03 04 83             	add    eax,DWORD PTR [ebx+eax*4]
     cea:	00 00                	add    BYTE PTR [eax],al
     cec:	00 36                	add    BYTE PTR [esi],dh
     cee:	03 00                	add    eax,DWORD PTR [eax]
     cf0:	00 14 33             	add    BYTE PTR [ebx+esi*1],dl
     cf3:	00 00                	add    BYTE PTR [eax],al
     cf5:	00 f3                	add    bl,dh
     cf7:	01 05 33 00 00 00    	add    DWORD PTR ds:0x33,eax
     cfd:	7f 00                	jg     cff <cmdClearScreen-0x30ff301>
     cff:	0a c9                	or     cl,cl
     d01:	05 00 00 01 10       	add    eax,0x10010000
     d06:	06                   	push   es
     d07:	1f                   	pop    ds
     d08:	03 00                	add    eax,DWORD PTR [eax]
     d0a:	00 05 03 60 40 10    	add    BYTE PTR ds:0x10406003,al
     d10:	03 0a                	add    ecx,DWORD PTR [edx]
     d12:	e0 05                	loopne d19 <cmdClearScreen-0x30ff2e7>
     d14:	00 00                	add    BYTE PTR [eax],al
     d16:	01 11                	add    DWORD PTR [ecx],edx
     d18:	05 4f 00 00 00       	add    eax,0x4f
     d1d:	05 03 48 40 10       	add    eax,0x10404803
     d22:	03 0a                	add    ecx,DWORD PTR [edx]
     d24:	88 04 00             	mov    BYTE PTR [eax+eax*1],al
     d27:	00 01                	add    BYTE PTR [ecx],al
     d29:	12 05 4f 00 00 00    	adc    al,BYTE PTR ds:0x4f
     d2f:	05 03 4c 40 10       	add    eax,0x10404c03
     d34:	03 0a                	add    ecx,DWORD PTR [edx]
     d36:	f0 04 00             	lock add al,0x0
     d39:	00 01                	add    BYTE PTR [ecx],al
     d3b:	13 06                	adc    eax,DWORD PTR [esi]
     d3d:	b7 02                	mov    bh,0x2
     d3f:	00 00                	add    BYTE PTR [eax],al
     d41:	05 03 60 3a 11       	add    eax,0x113a6003
     d46:	03 0a                	add    ecx,DWORD PTR [edx]
     d48:	19 06                	sbb    DWORD PTR [esi],eax
     d4a:	00 00                	add    BYTE PTR [eax],al
     d4c:	01 14 08             	add    DWORD PTR [eax+ecx*1],edx
     d4f:	c5 00                	lds    eax,FWORD PTR [eax]
     d51:	00 00                	add    BYTE PTR [eax],al
     d53:	05 03 60 3b 11       	add    eax,0x113b6003
     d58:	03 0a                	add    ecx,DWORD PTR [edx]
     d5a:	08 05 00 00 01 17    	or     BYTE PTR ds:0x17010000,al
     d60:	06                   	push   es
     d61:	2f                   	das    
     d62:	01 00                	add    DWORD PTR [eax],eax
     d64:	00 05 03 64 3b 11    	add    BYTE PTR ds:0x113b6403,al
     d6a:	03 17                	add    edx,DWORD PTR [edi]
     d6c:	12 06                	adc    al,BYTE PTR [esi]
     d6e:	00 00                	add    BYTE PTR [eax],al
     d70:	01 7f 01             	add    DWORD PTR [edi+0x1],edi
     d73:	05 4f 00 00 00       	add    eax,0x4f
     d78:	28 1a                	sub    BYTE PTR [edx],bl
     d7a:	10 03                	adc    BYTE PTR [ebx],al
     d7c:	5e                   	pop    esi
     d7d:	05 00 00 01 9c       	add    eax,0x9c010000
     d82:	ab                   	stos   DWORD PTR es:[edi],eax
     d83:	04 00                	add    al,0x0
     d85:	00 18                	add    BYTE PTR [eax],bl
     d87:	6c                   	ins    BYTE PTR es:[edi],dx
     d88:	05 00 00 01 7f       	add    eax,0x7f010000
     d8d:	01 10                	add    DWORD PTR [eax],edx
     d8f:	4f                   	dec    edi
     d90:	00 00                	add    BYTE PTR [eax],al
     d92:	00 02                	add    BYTE PTR [edx],al
     d94:	91                   	xchg   ecx,eax
     d95:	00 18                	add    BYTE PTR [eax],bl
     d97:	a0 05 00 00 01       	mov    al,ds:0x1000005
     d9c:	7f 01                	jg     d9f <cmdClearScreen-0x30ff261>
     d9e:	1d c5 00 00 00       	sbb    eax,0xc5
     da3:	02 91 04 18 83 04    	add    dl,BYTE PTR [ecx+0x4831804]
     da9:	00 00                	add    BYTE PTR [eax],al
     dab:	01 7f 01             	add    DWORD PTR [edi+0x1],edi
     dae:	2a c5                	sub    al,ch
     db0:	00 00                	add    BYTE PTR [eax],al
     db2:	00 02                	add    BYTE PTR [edx],al
     db4:	91                   	xchg   ecx,eax
     db5:	08 19                	or     BYTE PTR [ecx],bl
     db7:	30 05 00 00 01 81    	xor    BYTE PTR ds:0x81010000,al
     dbd:	01 0d 8f 00 00 00    	add    DWORD PTR ds:0x8f,ecx
     dc3:	02 91 5b 19 b7 04    	add    dl,BYTE PTR [ecx+0x4b7195b]
     dc9:	00 00                	add    BYTE PTR [eax],al
     dcb:	01 82 01 09 4f 00    	add    DWORD PTR [edx+0x4f0901],eax
     dd1:	00 00                	add    BYTE PTR [eax],al
     dd3:	02 91 6c 19 7a 06    	add    dl,BYTE PTR [ecx+0x67a196c]
     dd9:	00 00                	add    BYTE PTR [eax],al
     ddb:	01 83 01 09 4f 00    	add    DWORD PTR [ebx+0x4f0901],eax
     de1:	00 00                	add    BYTE PTR [eax],al
     de3:	02 91 68 19 d8 05    	add    dl,BYTE PTR [ecx+0x5d81968]
     de9:	00 00                	add    BYTE PTR [eax],al
     deb:	01 84 01 0a ab 04 00 	add    DWORD PTR [ecx+eax*1+0x4ab0a],eax
     df2:	00 02                	add    BYTE PTR [edx],al
     df4:	91                   	xchg   ecx,eax
     df5:	47                   	inc    edi
     df6:	19 bf 05 00 00 01    	sbb    DWORD PTR [edi+0x1000005],edi
     dfc:	85 01                	test   DWORD PTR [ecx],eax
     dfe:	0a bb 04 00 00 02    	or     bh,BYTE PTR [ebx+0x2000004]
     e04:	91                   	xchg   ecx,eax
     e05:	64 19 c5             	fs sbb ebp,eax
     e08:	04 00                	add    al,0x0
     e0a:	00 01                	add    BYTE PTR [ecx],al
     e0c:	86 01                	xchg   BYTE PTR [ecx],al
     e0e:	0a bb 04 00 00 02    	or     bh,BYTE PTR [ebx+0x2000004]
     e14:	91                   	xchg   ecx,eax
     e15:	40                   	inc    eax
     e16:	1a 5d 05             	sbb    bl,BYTE PTR [ebp+0x5]
     e19:	00 00                	add    BYTE PTR [eax],al
     e1b:	01 9a 01 01 e3 1a    	add    DWORD PTR [edx+0x1ae30101],ebx
     e21:	10 03                	adc    BYTE PTR [ebx],al
     e23:	1a 96 06 00 00 01    	sbb    dl,BYTE PTR [esi+0x1000006]
     e29:	a3 01 01 46 1b       	mov    ds:0x1b460101,eax
     e2e:	10 03                	adc    BYTE PTR [ebx],al
     e30:	1a 64 04 00          	sbb    ah,BYTE PTR [esp+eax*1+0x0]
     e34:	00 01                	add    BYTE PTR [ecx],al
     e36:	24 02                	and    al,0x2
     e38:	01 c5                	add    ebp,eax
     e3a:	1e                   	push   ds
     e3b:	10 03                	adc    BYTE PTR [ebx],al
     e3d:	1b 4f 1b             	sbb    ecx,DWORD PTR [edi+0x1b]
     e40:	10 03                	adc    BYTE PTR [ebx],al
     e42:	ea 00 00 00 92 04 00 	jmp    0x4:0x92000000
     e49:	00 19                	add    BYTE PTR [ecx],bl
     e4b:	62 03                	bound  eax,QWORD PTR [ebx]
     e4d:	00 00                	add    BYTE PTR [eax],al
     e4f:	01 a7 01 11 4f 00    	add    DWORD PTR [edi+0x4f1101],esp
     e55:	00 00                	add    BYTE PTR [eax],al
     e57:	02 91 60 00 1c d2    	add    dl,BYTE PTR [ecx-0x2de3ffa0]
     e5d:	1e                   	push   ds
     e5e:	10 03                	adc    BYTE PTR [ebx],al
     e60:	4b                   	dec    ebx
     e61:	00 00                	add    BYTE PTR [eax],al
     e63:	00 1d 69 00 01 29    	add    BYTE PTR ds:0x29010069,bl
     e69:	02 11                	add    dl,BYTE PTR [ecx]
     e6b:	4f                   	dec    edi
     e6c:	00 00                	add    BYTE PTR [eax],al
     e6e:	00 02                	add    BYTE PTR [edx],al
     e70:	91                   	xchg   ecx,eax
     e71:	5c                   	pop    esp
     e72:	00 00                	add    BYTE PTR [eax],al
     e74:	04 83                	add    al,0x83
     e76:	00 00                	add    BYTE PTR [eax],al
     e78:	00 bb 04 00 00 05    	add    BYTE PTR [ebx+0x5000004],bh
     e7e:	33 00                	xor    eax,DWORD PTR [eax]
     e80:	00 00                	add    BYTE PTR [eax],al
     e82:	13 00                	adc    eax,DWORD PTR [eax]
     e84:	07                   	pop    es
     e85:	04 4f                	add    al,0x4f
     e87:	00 00                	add    BYTE PTR [eax],al
     e89:	00 1e                	add    BYTE PTR [esi],bl
     e8b:	da 04 00             	fiadd  DWORD PTR [eax+eax*1]
     e8e:	00 01                	add    BYTE PTR [ecx],al
     e90:	67 01 06 f9 18       	add    DWORD PTR ds:0x18f9,eax
     e95:	10 03                	adc    BYTE PTR [ebx],al
     e97:	2f                   	das    
     e98:	01 00                	add    DWORD PTR [eax],eax
     e9a:	00 01                	add    BYTE PTR [ecx],al
     e9c:	9c                   	pushf  
     e9d:	f9                   	stc    
     e9e:	04 00                	add    al,0x0
     ea0:	00 18                	add    BYTE PTR [eax],bl
     ea2:	c5 04 00             	lds    eax,FWORD PTR [eax+eax*1]
     ea5:	00 01                	add    BYTE PTR [ecx],al
     ea7:	67 01 12             	add    DWORD PTR [bp+si],edx
     eaa:	f9                   	stc    
     eab:	04 00                	add    al,0x0
     ead:	00 02                	add    BYTE PTR [edx],al
     eaf:	91                   	xchg   ecx,eax
     eb0:	00 19                	add    BYTE PTR [ecx],bl
     eb2:	24 00                	and    al,0x0
     eb4:	00 00                	add    BYTE PTR [eax],al
     eb6:	01 75 01             	add    DWORD PTR [ebp+0x1],esi
     eb9:	0d f3 00 00 00       	or     eax,0xf3
     ebe:	02 91 68 00 07 04    	add    dl,BYTE PTR [ecx+0x4070068]
     ec4:	bb 04 00 00 1f       	mov    ebx,0x1f000004
     ec9:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
     eca:	05 00 00 01 5a       	add    eax,0x5a010000
     ecf:	01 05 4f 00 00 00    	add    DWORD PTR ds:0x4f,eax
     ed5:	cb                   	retf   
     ed6:	18 10                	sbb    BYTE PTR [eax],dl
     ed8:	03 2e                	add    ebp,DWORD PTR [esi]
     eda:	00 00                	add    BYTE PTR [eax],al
     edc:	00 01                	add    BYTE PTR [ecx],al
     ede:	9c                   	pushf  
     edf:	2b 05 00 00 18 f2    	sub    eax,DWORD PTR ds:0xf2180000
     ee5:	05 00 00 01 5a       	add    eax,0x5a010000
     eea:	01 17                	add    DWORD PTR [edi],edx
     eec:	4f                   	dec    edi
     eed:	00 00                	add    BYTE PTR [eax],al
     eef:	00 02                	add    BYTE PTR [edx],al
     ef1:	91                   	xchg   ecx,eax
     ef2:	00 00                	add    BYTE PTR [eax],al
     ef4:	1f                   	pop    ds
     ef5:	3e 06                	ds push es
     ef7:	00 00                	add    BYTE PTR [eax],al
     ef9:	01 50 01             	add    DWORD PTR [eax+0x1],edx
     efc:	05 4f 00 00 00       	add    eax,0x4f
     f01:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
     f02:	18 10                	sbb    BYTE PTR [eax],dl
     f04:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
     f07:	00 00                	add    BYTE PTR [eax],al
     f09:	01 9c 57 05 00 00 18 	add    DWORD PTR [edi+edx*2+0x18000005],ebx
     f10:	f2 05 00 00 01 50    	repnz add eax,0x50010000
     f16:	01 17                	add    DWORD PTR [edi],edx
     f18:	4f                   	dec    edi
     f19:	00 00                	add    BYTE PTR [eax],al
     f1b:	00 02                	add    BYTE PTR [edx],al
     f1d:	91                   	xchg   ecx,eax
     f1e:	00 00                	add    BYTE PTR [eax],al
     f20:	17                   	pop    ss
     f21:	46                   	inc    esi
     f22:	05 00 00 01 48       	add    eax,0x48010000
     f27:	01 05 4f 00 00 00    	add    DWORD PTR ds:0x4f,eax
     f2d:	6c                   	ins    BYTE PTR es:[edi],dx
     f2e:	18 10                	sbb    BYTE PTR [eax],dl
     f30:	03 3b                	add    edi,DWORD PTR [ebx]
     f32:	00 00                	add    BYTE PTR [eax],al
     f34:	00 01                	add    BYTE PTR [ecx],al
     f36:	9c                   	pushf  
     f37:	83 05 00 00 18 54 06 	add    DWORD PTR ds:0x54180000,0x6
     f3e:	00 00                	add    BYTE PTR [eax],al
     f40:	01 48 01             	add    DWORD PTR [eax+0x1],ecx
     f43:	1a 7d 00             	sbb    bh,BYTE PTR [ebp+0x0]
     f46:	00 00                	add    BYTE PTR [eax],al
     f48:	02 91 00 00 20 7c    	add    dl,BYTE PTR [ecx+0x7c200000]
     f4e:	04 00                	add    al,0x0
     f50:	00 01                	add    BYTE PTR [ecx],al
     f52:	43                   	inc    ebx
     f53:	01 06                	add    DWORD PTR [esi],eax
     f55:	36 18 10             	sbb    BYTE PTR ss:[eax],dl
     f58:	03 36                	add    esi,DWORD PTR [esi]
     f5a:	00 00                	add    BYTE PTR [eax],al
     f5c:	00 01                	add    BYTE PTR [ecx],al
     f5e:	9c                   	pushf  
     f5f:	1e                   	push   ds
     f60:	b3 05                	mov    bl,0x5
     f62:	00 00                	add    BYTE PTR [eax],al
     f64:	01 3e                	add    DWORD PTR [esi],edi
     f66:	01 06                	add    DWORD PTR [esi],eax
     f68:	ee                   	out    dx,al
     f69:	17                   	pop    ss
     f6a:	10 03                	adc    BYTE PTR [ebx],al
     f6c:	48                   	dec    eax
     f6d:	00 00                	add    BYTE PTR [eax],al
     f6f:	00 01                	add    BYTE PTR [ecx],al
     f71:	9c                   	pushf  
     f72:	be 05 00 00 18       	mov    esi,0x18000005
     f77:	54                   	push   esp
     f78:	06                   	push   es
     f79:	00 00                	add    BYTE PTR [eax],al
     f7b:	01 3e                	add    DWORD PTR [esi],edi
     f7d:	01 18                	add    DWORD PTR [eax],ebx
     f7f:	7d 00                	jge    f81 <cmdClearScreen-0x30ff07f>
     f81:	00 00                	add    BYTE PTR [eax],al
     f83:	02 91 00 00 1e 20    	add    dl,BYTE PTR [ecx+0x201e0000]
     f89:	05 00 00 01 2f       	add    eax,0x2f010000
     f8e:	01 06                	add    DWORD PTR [esi],eax
     f90:	9e                   	sahf   
     f91:	17                   	pop    ss
     f92:	10 03                	adc    BYTE PTR [ebx],al
     f94:	50                   	push   eax
     f95:	00 00                	add    BYTE PTR [eax],al
     f97:	00 01                	add    BYTE PTR [ecx],al
     f99:	9c                   	pushf  
     f9a:	10 06                	adc    BYTE PTR [esi],al
     f9c:	00 00                	add    BYTE PTR [eax],al
     f9e:	18 29                	sbb    BYTE PTR [ecx],ch
     fa0:	05 00 00 01 2f       	add    eax,0x2f010000
     fa5:	01 13                	add    DWORD PTR [ebx],edx
     fa7:	4f                   	dec    edi
     fa8:	00 00                	add    BYTE PTR [eax],al
     faa:	00 02                	add    BYTE PTR [edx],al
     fac:	91                   	xchg   ecx,eax
     fad:	00 18                	add    BYTE PTR [eax],bl
     faf:	0e                   	push   cs
     fb0:	02 00                	add    al,BYTE PTR [eax]
     fb2:	00 01                	add    BYTE PTR [ecx],al
     fb4:	2f                   	das    
     fb5:	01 22                	add    DWORD PTR [edx],esp
     fb7:	c5 00                	lds    eax,FWORD PTR [eax]
     fb9:	00 00                	add    BYTE PTR [eax],al
     fbb:	02 91 04 1c b4 17    	add    dl,BYTE PTR [ecx+0x17b41c04]
     fc1:	10 03                	adc    BYTE PTR [ebx],al
     fc3:	26 00 00             	add    BYTE PTR es:[eax],al
     fc6:	00 1d 63 6e 74 00    	add    BYTE PTR ds:0x746e63,bl
     fcc:	01 31                	add    DWORD PTR [ecx],esi
     fce:	01 0e                	add    DWORD PTR [esi],ecx
     fd0:	4f                   	dec    edi
     fd1:	00 00                	add    BYTE PTR [eax],al
     fd3:	00 02                	add    BYTE PTR [edx],al
     fd5:	91                   	xchg   ecx,eax
     fd6:	6c                   	ins    BYTE PTR es:[edi],dx
     fd7:	00 00                	add    BYTE PTR [eax],al
     fd9:	17                   	pop    ss
     fda:	39 05 00 00 01 25    	cmp    DWORD PTR ds:0x25010000,eax
     fe0:	01 08                	add    DWORD PTR [eax],ecx
     fe2:	c5 00                	lds    eax,FWORD PTR [eax]
     fe4:	00 00                	add    BYTE PTR [eax],al
     fe6:	16                   	push   ss
     fe7:	17                   	pop    ss
     fe8:	10 03                	adc    BYTE PTR [ebx],al
     fea:	88 00                	mov    BYTE PTR [eax],al
     fec:	00 00                	add    BYTE PTR [eax],al
     fee:	01 9c 76 06 00 00 18 	add    DWORD PTR [esi+esi*2+0x18000006],ebx
     ff5:	29 05 00 00 01 25    	sub    DWORD PTR ds:0x25010000,eax
     ffb:	01 19                	add    DWORD PTR [ecx],ebx
     ffd:	4f                   	dec    edi
     ffe:	00 00                	add    BYTE PTR [eax],al
    1000:	00 02                	add    BYTE PTR [edx],al
    1002:	91                   	xchg   ecx,eax
    1003:	00 18                	add    BYTE PTR [eax],bl
    1005:	0e                   	push   cs
    1006:	02 00                	add    al,BYTE PTR [eax]
    1008:	00 01                	add    BYTE PTR [ecx],al
    100a:	25 01 26 86 06       	and    eax,0x6862601
    100f:	00 00                	add    BYTE PTR [eax],al
    1011:	02 91 04 18 e0 04    	add    dl,BYTE PTR [ecx+0x4e01804]
    1017:	00 00                	add    BYTE PTR [eax],al
    1019:	01 25 01 57 c5 00    	add    DWORD PTR ds:0xc55701,esp
    101f:	00 00                	add    BYTE PTR [eax],al
    1021:	02 91 08 1c 2d 17    	add    dl,BYTE PTR [ecx+0x172d1c08]
    1027:	10 03                	adc    BYTE PTR [ebx],al
    1029:	67 00 00             	add    BYTE PTR [bx+si],al
    102c:	00 1d 63 6e 74 00    	add    BYTE PTR ds:0x746e63,bl
    1032:	01 27                	add    DWORD PTR [edi],esp
    1034:	01 0e                	add    DWORD PTR [esi],ecx
    1036:	4f                   	dec    edi
    1037:	00 00                	add    BYTE PTR [eax],al
    1039:	00 02                	add    BYTE PTR [edx],al
    103b:	91                   	xchg   ecx,eax
    103c:	6c                   	ins    BYTE PTR es:[edi],dx
    103d:	00 00                	add    BYTE PTR [eax],al
    103f:	04 83                	add    al,0x83
    1041:	00 00                	add    BYTE PTR [eax],al
    1043:	00 86 06 00 00 05    	add    BYTE PTR [esi+0x5000006],al
    1049:	33 00                	xor    eax,DWORD PTR [eax]
    104b:	00 00                	add    BYTE PTR [eax],al
    104d:	7f 00                	jg     104f <cmdClearScreen-0x30fefb1>
    104f:	07                   	pop    es
    1050:	04 76                	add    al,0x76
    1052:	06                   	push   es
    1053:	00 00                	add    BYTE PTR [eax],al
    1055:	21 9b 05 00 00 01    	and    DWORD PTR [ebx+0x1000005],ebx
    105b:	ac                   	lods   al,BYTE PTR ds:[esi]
    105c:	08 c5                	or     ch,al
    105e:	00 00                	add    BYTE PTR [eax],al
    1060:	00 75 14             	add    BYTE PTR [ebp+0x14],dh
    1063:	10 03                	adc    BYTE PTR [ebx],al
    1065:	a1 02 00 00 01       	mov    eax,ds:0x1000002
    106a:	9c                   	pushf  
    106b:	57                   	push   edi
    106c:	07                   	pop    es
    106d:	00 00                	add    BYTE PTR [eax],al
    106f:	22 ab 04 00 00 01    	and    ch,BYTE PTR [ebx+0x1000004]
    1075:	ac                   	lods   al,BYTE PTR ds:[esi]
    1076:	1f                   	pop    ds
    1077:	29 01                	sub    DWORD PTR [ecx],eax
    1079:	00 00                	add    BYTE PTR [eax],al
    107b:	02 91 00 23 61 72    	add    dl,BYTE PTR [ecx+0x72612300]
    1081:	67 00 01             	add    BYTE PTR [bx+di],al
    1084:	ae                   	scas   al,BYTE PTR es:[edi]
    1085:	09 7d 00             	or     DWORD PTR [ebp+0x0],edi
    1088:	00 00                	add    BYTE PTR [eax],al
    108a:	02 91 6c 16 68 06    	add    dl,BYTE PTR [ecx+0x668166c]
    1090:	00 00                	add    BYTE PTR [eax],al
    1092:	01 af 09 7d 00 00    	add    DWORD PTR [edi+0x7d09],ebp
    1098:	00 02                	add    BYTE PTR [edx],al
    109a:	91                   	xchg   ecx,eax
    109b:	68 16 56 05 00       	push   0x55616
    10a0:	00 01                	add    BYTE PTR [ecx],al
    10a2:	b0 07                	mov    al,0x7
    10a4:	4f                   	dec    edi
    10a5:	00 00                	add    BYTE PTR [eax],al
    10a7:	00 02                	add    BYTE PTR [edx],al
    10a9:	91                   	xchg   ecx,eax
    10aa:	64 16                	fs push ss
    10ac:	f9                   	stc    
    10ad:	04 00                	add    al,0x0
    10af:	00 01                	add    BYTE PTR [ecx],al
    10b1:	b1 07                	mov    cl,0x7
    10b3:	4f                   	dec    edi
    10b4:	00 00                	add    BYTE PTR [eax],al
    10b6:	00 02                	add    BYTE PTR [edx],al
    10b8:	91                   	xchg   ecx,eax
    10b9:	60                   	pusha  
    10ba:	16                   	push   ss
    10bb:	55                   	push   ebp
    10bc:	05 00 00 01 b2       	add    eax,0xb2010000
    10c1:	07                   	pop    es
    10c2:	4f                   	dec    edi
    10c3:	00 00                	add    BYTE PTR [eax],al
    10c5:	00 02                	add    BYTE PTR [edx],al
    10c7:	91                   	xchg   ecx,eax
    10c8:	5c                   	pop    esp
    10c9:	16                   	push   ss
    10ca:	6c                   	ins    BYTE PTR es:[edi],dx
    10cb:	05 00 00 01 b3       	add    eax,0xb3010000
    10d0:	07                   	pop    es
    10d1:	4f                   	dec    edi
    10d2:	00 00                	add    BYTE PTR [eax],al
    10d4:	00 02                	add    BYTE PTR [edx],al
    10d6:	91                   	xchg   ecx,eax
    10d7:	58                   	pop    eax
    10d8:	16                   	push   ss
    10d9:	69 05 00 00 01 b4 07 	imul   eax,DWORD PTR ds:0xb4010000,0x4f07
    10e0:	4f 00 00 
    10e3:	00 02                	add    BYTE PTR [edx],al
    10e5:	91                   	xchg   ecx,eax
    10e6:	54                   	push   esp
    10e7:	16                   	push   ss
    10e8:	a0 05 00 00 01       	mov    al,ds:0x1000005
    10ed:	b5 0a                	mov    ch,0xa
    10ef:	c5 00                	lds    eax,FWORD PTR [eax]
    10f1:	00 00                	add    BYTE PTR [eax],al
    10f3:	02 91 50 16 32 06    	add    dl,BYTE PTR [ecx+0x6321650]
    10f9:	00 00                	add    BYTE PTR [eax],al
    10fb:	01 b6 0a c5 00 00    	add    DWORD PTR [esi+0xc50a],esi
    1101:	00 02                	add    BYTE PTR [edx],al
    1103:	91                   	xchg   ecx,eax
    1104:	4c                   	dec    esp
    1105:	1c 46                	sbb    al,0x46
    1107:	16                   	push   ss
    1108:	10 03                	adc    BYTE PTR [ebx],al
    110a:	9e                   	sahf   
    110b:	00 00                	add    BYTE PTR [eax],al
    110d:	00 19                	add    BYTE PTR [ecx],bl
    110f:	39 06                	cmp    DWORD PTR [esi],eax
    1111:	00 00                	add    BYTE PTR [eax],al
    1113:	01 0f                	add    DWORD PTR [edi],ecx
    1115:	01 13                	add    DWORD PTR [ebx],edx
    1117:	7d 00                	jge    1119 <cmdClearScreen-0x30feee7>
    1119:	00 00                	add    BYTE PTR [eax],al
    111b:	02 91 48 00 00 21    	add    dl,BYTE PTR [ecx+0x21000048]
    1121:	5c                   	pop    esp
    1122:	06                   	push   es
    1123:	00 00                	add    BYTE PTR [eax],al
    1125:	01 98 05 4f 00 00    	add    DWORD PTR [eax+0x4f05],ebx
    112b:	00 f5                	add    ch,dh
    112d:	13 10                	adc    edx,DWORD PTR [eax]
    112f:	03 80 00 00 00 01    	add    eax,DWORD PTR [eax+0x1000000]
    1135:	9c                   	pushf  
    1136:	9d                   	popf   
    1137:	07                   	pop    es
    1138:	00 00                	add    BYTE PTR [eax],al
    113a:	22 54 06 00          	and    dl,BYTE PTR [esi+eax*1+0x0]
    113e:	00 01                	add    BYTE PTR [ecx],al
    1140:	98                   	cwde   
    1141:	17                   	pop    ss
    1142:	7d 00                	jge    1144 <cmdClearScreen-0x30feebc>
    1144:	00 00                	add    BYTE PTR [eax],al
    1146:	02 91 00 23 69 00    	add    dl,BYTE PTR [ecx+0x692300]
    114c:	01 9a 0e 33 00 00    	add    DWORD PTR [edx+0x330e],ebx
    1152:	00 02                	add    BYTE PTR [edx],al
    1154:	91                   	xchg   ecx,eax
    1155:	6c                   	ins    BYTE PTR es:[edi],dx
    1156:	23 72 65             	and    esi,DWORD PTR [edx+0x65]
    1159:	74 00                	je     115b <cmdClearScreen-0x30feea5>
    115b:	01 9b 09 4f 00 00    	add    DWORD PTR [ebx+0x4f09],ebx
    1161:	00 02                	add    BYTE PTR [edx],al
    1163:	91                   	xchg   ecx,eax
    1164:	68 00 21 9a 04       	push   0x49a2100
    1169:	00 00                	add    BYTE PTR [eax],al
    116b:	01 66 05             	add    DWORD PTR [esi+0x5],esp
    116e:	4f                   	dec    edi
    116f:	00 00                	add    BYTE PTR [eax],al
    1171:	00 38                	add    BYTE PTR [eax],bh
    1173:	12 10                	adc    dl,BYTE PTR [eax]
    1175:	03 bd 01 00 00 01    	add    edi,DWORD PTR [ebp+0x1000001]
    117b:	9c                   	pushf  
    117c:	45                   	inc    ebp
    117d:	08 00                	or     BYTE PTR [eax],al
    117f:	00 22                	add    BYTE PTR [edx],ah
    1181:	4c                   	dec    esp
    1182:	06                   	push   es
    1183:	00 00                	add    BYTE PTR [eax],al
    1185:	01 66 1c             	add    DWORD PTR [esi+0x1c],esp
    1188:	7d 00                	jge    118a <cmdClearScreen-0x30fee76>
    118a:	00 00                	add    BYTE PTR [eax],al
    118c:	02 91 00 22 0e 02    	add    dl,BYTE PTR [ecx+0x20e2200]
    1192:	00 00                	add    BYTE PTR [eax],al
    1194:	01 66 2a             	add    DWORD PTR [esi+0x2a],esp
    1197:	86 06                	xchg   BYTE PTR [esi],al
    1199:	00 00                	add    BYTE PTR [eax],al
    119b:	02 91 04 22 19 03    	add    dl,BYTE PTR [ecx+0x3192204]
    11a1:	00 00                	add    BYTE PTR [eax],al
    11a3:	01 66 58             	add    DWORD PTR [esi+0x58],esp
    11a6:	4f                   	dec    edi
    11a7:	00 00                	add    BYTE PTR [eax],al
    11a9:	00 02                	add    BYTE PTR [edx],al
    11ab:	91                   	xchg   ecx,eax
    11ac:	08 23                	or     BYTE PTR [ebx],ah
    11ae:	78 00                	js     11b0 <cmdClearScreen-0x30fee50>
    11b0:	01 68 09             	add    DWORD PTR [eax+0x9],ebp
    11b3:	4f                   	dec    edi
    11b4:	00 00                	add    BYTE PTR [eax],al
    11b6:	00 02                	add    BYTE PTR [edx],al
    11b8:	91                   	xchg   ecx,eax
    11b9:	6c                   	ins    BYTE PTR es:[edi],dx
    11ba:	23 79 00             	and    edi,DWORD PTR [ecx+0x0]
    11bd:	01 68 0d             	add    DWORD PTR [eax+0xd],ebp
    11c0:	4f                   	dec    edi
    11c1:	00 00                	add    BYTE PTR [eax],al
    11c3:	00 02                	add    BYTE PTR [edx],al
    11c5:	91                   	xchg   ecx,eax
    11c6:	68 16 74 04 00       	push   0x47416
    11cb:	00 01                	add    BYTE PTR [ecx],al
    11cd:	69 09 4f 00 00 00    	imul   ecx,DWORD PTR [ecx],0x4f
    11d3:	02 91 64 16 ce 04    	add    dl,BYTE PTR [ecx+0x4ce1664]
    11d9:	00 00                	add    BYTE PTR [eax],al
    11db:	01 69 13             	add    DWORD PTR [ecx+0x13],ebp
    11de:	4f                   	dec    edi
    11df:	00 00                	add    BYTE PTR [eax],al
    11e1:	00 02                	add    BYTE PTR [edx],al
    11e3:	91                   	xchg   ecx,eax
    11e4:	60                   	pusha  
    11e5:	16                   	push   ss
    11e6:	81 05 00 00 01 6a 0a 	add    DWORD PTR ds:0x6a010000,0x12f0a
    11ed:	2f 01 00 
    11f0:	00 02                	add    BYTE PTR [edx],al
    11f2:	91                   	xchg   ecx,eax
    11f3:	5f                   	pop    edi
    11f4:	1c 83                	sbb    al,0x83
    11f6:	12 10                	adc    dl,BYTE PTR [eax]
    11f8:	03 49 01             	add    ecx,DWORD PTR [ecx+0x1]
    11fb:	00 00                	add    BYTE PTR [eax],al
    11fd:	23 63 6e             	and    esp,DWORD PTR [ebx+0x6e]
    1200:	74 00                	je     1202 <cmdClearScreen-0x30fedfe>
    1202:	01 6e 13             	add    DWORD PTR [esi+0x13],ebp
    1205:	33 00                	xor    eax,DWORD PTR [eax]
    1207:	00 00                	add    BYTE PTR [eax],al
    1209:	02 91 58 00 00 24    	add    dl,BYTE PTR [ecx+0x24000058]
    120f:	e5 04                	in     eax,0x4
    1211:	00 00                	add    BYTE PTR [eax],al
    1213:	01 4d 06             	add    DWORD PTR [ebp+0x6],ecx
    1216:	53                   	push   ebx
    1217:	11 10                	adc    DWORD PTR [eax],edx
    1219:	03 e5                	add    esp,ebp
    121b:	00 00                	add    BYTE PTR [eax],al
    121d:	00 01                	add    BYTE PTR [ecx],al
    121f:	9c                   	pushf  
    1220:	78 08                	js     122a <cmdClearScreen-0x30fedd6>
    1222:	00 00                	add    BYTE PTR [eax],al
    1224:	22 f0                	and    dh,al
    1226:	04 00                	add    al,0x0
    1228:	00 01                	add    BYTE PTR [ecx],al
    122a:	4d                   	dec    ebp
    122b:	1f                   	pop    ds
    122c:	7d 00                	jge    122e <cmdClearScreen-0x30fedd2>
    122e:	00 00                	add    BYTE PTR [eax],al
    1230:	02 91 00 23 69 00    	add    dl,BYTE PTR [ecx+0x692300]
    1236:	01 50 09             	add    DWORD PTR [eax+0x9],edx
    1239:	4f                   	dec    edi
    123a:	00 00                	add    BYTE PTR [eax],al
    123c:	00 02                	add    BYTE PTR [edx],al
    123e:	91                   	xchg   ecx,eax
    123f:	6c                   	ins    BYTE PTR es:[edi],dx
    1240:	00 21                	add    BYTE PTR [ecx],ah
    1242:	70 06                	jo     124a <cmdClearScreen-0x30fedb6>
    1244:	00 00                	add    BYTE PTR [eax],al
    1246:	01 2a                	add    DWORD PTR [edx],ebp
    1248:	08 c5                	or     ch,al
    124a:	00 00                	add    BYTE PTR [eax],al
    124c:	00 01                	add    BYTE PTR [ecx],al
    124e:	10 10                	adc    BYTE PTR [eax],dl
    1250:	03 52 01             	add    edx,DWORD PTR [edx+0x1]
    1253:	00 00                	add    BYTE PTR [eax],al
    1255:	01 9c 05 09 00 00 22 	add    DWORD PTR [ebp+eax*1+0x22000009],ebx
    125c:	54                   	push   esp
    125d:	06                   	push   es
    125e:	00 00                	add    BYTE PTR [eax],al
    1260:	01 2a                	add    DWORD PTR [edx],ebp
    1262:	18 7d 00             	sbb    BYTE PTR [ebp+0x0],bh
    1265:	00 00                	add    BYTE PTR [eax],al
    1267:	02 91 00 16 7a 05    	add    dl,BYTE PTR [ecx+0x57a1600]
    126d:	00 00                	add    BYTE PTR [eax],al
    126f:	01 2c 0a             	add    DWORD PTR [edx+ecx*1],ebp
    1272:	05 09 00 00 02       	add    eax,0x2000009
    1277:	91                   	xchg   ecx,eax
    1278:	4d                   	dec    ebp
    1279:	25 b2 04 00 00       	and    eax,0x4b2
    127e:	01 2d 0c c5 00 00    	add    DWORD PTR ds:0xc50c,ebp
    1284:	00 16                	add    BYTE PTR [esi],dl
    1286:	38 06                	cmp    BYTE PTR [esi],al
    1288:	00 00                	add    BYTE PTR [eax],al
    128a:	01 2e                	add    DWORD PTR [esi],ebp
    128c:	0b 7d 00             	or     edi,DWORD PTR [ebp+0x0]
    128f:	00 00                	add    BYTE PTR [eax],al
    1291:	02 91 5c 16 06 06    	add    dl,BYTE PTR [ecx+0x606165c]
    1297:	00 00                	add    BYTE PTR [eax],al
    1299:	01 2f                	add    DWORD PTR [edi],ebp
    129b:	09 4f 00             	or     DWORD PTR [edi+0x0],ecx
    129e:	00 00                	add    BYTE PTR [eax],al
    12a0:	02 91 50 26 63 6d    	add    dl,BYTE PTR [ecx+0x6d632650]
    12a6:	64 00 01             	add    BYTE PTR fs:[ecx],al
    12a9:	30 0b                	xor    BYTE PTR [ebx],cl
    12ab:	7d 00                	jge    12ad <cmdClearScreen-0x30fed53>
    12ad:	00 00                	add    BYTE PTR [eax],al
    12af:	16                   	push   ss
    12b0:	2b 06                	sub    eax,DWORD PTR [esi]
    12b2:	00 00                	add    BYTE PTR [eax],al
    12b4:	01 31                	add    DWORD PTR [ecx],esi
    12b6:	0a 83 00 00 00 02    	or     al,BYTE PTR [ebx+0x2000000]
    12bc:	91                   	xchg   ecx,eax
    12bd:	5b                   	pop    ebx
    12be:	16                   	push   ss
    12bf:	22 06                	and    al,BYTE PTR [esi]
    12c1:	00 00                	add    BYTE PTR [eax],al
    12c3:	01 32                	add    DWORD PTR [edx],esi
    12c5:	0b 7d 00             	or     edi,DWORD PTR [ebp+0x0]
    12c8:	00 00                	add    BYTE PTR [eax],al
    12ca:	02 91 54 00 04 83    	add    dl,BYTE PTR [ecx-0x7cfbffac]
    12d0:	00 00                	add    BYTE PTR [eax],al
    12d2:	00 15 09 00 00 05    	add    BYTE PTR ds:0x5000009,dl
    12d8:	33 00                	xor    eax,DWORD PTR [eax]
    12da:	00 00                	add    BYTE PTR [eax],al
    12dc:	02 00                	add    al,BYTE PTR [eax]
    12de:	24 71                	and    al,0x71
    12e0:	05 00 00 01 1e       	add    eax,0x1e010000
    12e5:	06                   	push   es
    12e6:	c3                   	ret    
    12e7:	0f 10 03             	movups xmm0,XMMWORD PTR [ebx]
    12ea:	3e 00 00             	add    BYTE PTR ds:[eax],al
    12ed:	00 01                	add    BYTE PTR [ecx],al
    12ef:	9c                   	pushf  
    12f0:	4a                   	dec    edx
    12f1:	09 00                	or     DWORD PTR [eax],eax
    12f3:	00 22                	add    BYTE PTR [edx],ah
    12f5:	b2 04                	mov    dl,0x4
    12f7:	00 00                	add    BYTE PTR [eax],al
    12f9:	01 1e                	add    DWORD PTR [esi],ebx
    12fb:	16                   	push   ss
    12fc:	c5 00                	lds    eax,FWORD PTR [eax]
    12fe:	00 00                	add    BYTE PTR [eax],al
    1300:	02 91 00 16 b1 04    	add    dl,BYTE PTR [ecx+0x4b11600]
    1306:	00 00                	add    BYTE PTR [eax],al
    1308:	01 20                	add    DWORD PTR [eax],esp
    130a:	0c c5                	or     al,0xc5
    130c:	00 00                	add    BYTE PTR [eax],al
    130e:	00 02                	add    BYTE PTR [edx],al
    1310:	91                   	xchg   ecx,eax
    1311:	6c                   	ins    BYTE PTR es:[edi],dx
    1312:	00 27                	add    BYTE PTR [edi],ah
    1314:	12 05 00 00 01 19    	adc    al,BYTE PTR ds:0x19010000
    131a:	06                   	push   es
    131b:	af                   	scas   eax,DWORD PTR es:[edi]
    131c:	0f 10 03             	movups xmm0,XMMWORD PTR [ebx]
    131f:	14 00                	adc    al,0x0
    1321:	00 00                	add    BYTE PTR [eax],al
    1323:	01 9c 22 54 06 00 00 	add    DWORD PTR [edx+eiz*1+0x654],ebx
    132a:	01 19                	add    DWORD PTR [ecx],ebx
    132c:	1a 7d 00             	sbb    bh,BYTE PTR [ebp+0x0]
    132f:	00 00                	add    BYTE PTR [eax],al
    1331:	02                   	.byte 0x2
    1332:	91                   	xchg   ecx,eax
    1333:	00 00                	add    BYTE PTR [eax],al
	...

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
  28:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
  2b:	01 49 13             	add    DWORD PTR [ecx+0x13],ecx
  2e:	01 13                	add    DWORD PTR [ebx],edx
  30:	00 00                	add    BYTE PTR [eax],al
  32:	05 21 00 49 13       	add    eax,0x13490021
  37:	2f                   	das    
  38:	0b 00                	or     eax,DWORD PTR [eax]
  3a:	00 06                	add    BYTE PTR [esi],al
  3c:	0f 00 0b             	str    WORD PTR [ebx]
  3f:	0b 00                	or     eax,DWORD PTR [eax]
  41:	00 07                	add    BYTE PTR [edi],al
  43:	0f 00 0b             	str    WORD PTR [ebx]
  46:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  49:	00 00                	add    BYTE PTR [eax],al
  4b:	08 16                	or     BYTE PTR [esi],dl
  4d:	00 03                	add    BYTE PTR [ebx],al
  4f:	0e                   	push   cs
  50:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  52:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  54:	39 0b                	cmp    DWORD PTR [ebx],ecx
  56:	49                   	dec    ecx
  57:	13 00                	adc    eax,DWORD PTR [eax]
  59:	00 09                	add    BYTE PTR [ecx],cl
  5b:	34 00                	xor    al,0x0
  5d:	03 0e                	add    ecx,DWORD PTR [esi]
  5f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  61:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  63:	39 0b                	cmp    DWORD PTR [ebx],ecx
  65:	49                   	dec    ecx
  66:	13 3f                	adc    edi,DWORD PTR [edi]
  68:	19 02                	sbb    DWORD PTR [edx],eax
  6a:	18 00                	sbb    BYTE PTR [eax],al
  6c:	00 0a                	add    BYTE PTR [edx],cl
  6e:	13 01                	adc    eax,DWORD PTR [ecx]
  70:	03 0e                	add    ecx,DWORD PTR [esi]
  72:	0b 0b                	or     ecx,DWORD PTR [ebx]
  74:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  76:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  78:	39 0b                	cmp    DWORD PTR [ebx],ecx
  7a:	01 13                	add    DWORD PTR [ebx],edx
  7c:	00 00                	add    BYTE PTR [eax],al
  7e:	0b 0d 00 03 0e 3a    	or     ecx,DWORD PTR ds:0x3a0e0300
  84:	0b 3b                	or     edi,DWORD PTR [ebx]
  86:	0b 39                	or     edi,DWORD PTR [ecx]
  88:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  8b:	38 0b                	cmp    BYTE PTR [ebx],cl
  8d:	00 00                	add    BYTE PTR [eax],al
  8f:	0c 34                	or     al,0x34
  91:	00 03                	add    BYTE PTR [ebx],al
  93:	0e                   	push   cs
  94:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  96:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  98:	39 0b                	cmp    DWORD PTR [ebx],ecx
  9a:	49                   	dec    ecx
  9b:	13 3f                	adc    edi,DWORD PTR [edi]
  9d:	19 3c 19             	sbb    DWORD PTR [ecx+ebx*1],edi
  a0:	00 00                	add    BYTE PTR [eax],al
  a2:	0d 04 01 03 0e       	or     eax,0xe030104
  a7:	3e 0b 0b             	or     ecx,DWORD PTR ds:[ebx]
  aa:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  ad:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  af:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  b1:	39 0b                	cmp    DWORD PTR [ebx],ecx
  b3:	01 13                	add    DWORD PTR [ebx],edx
  b5:	00 00                	add    BYTE PTR [eax],al
  b7:	0e                   	push   cs
  b8:	28 00                	sub    BYTE PTR [eax],al
  ba:	03 0e                	add    ecx,DWORD PTR [esi]
  bc:	1c 0b                	sbb    al,0xb
  be:	00 00                	add    BYTE PTR [eax],al
  c0:	0f 13 01             	movlps QWORD PTR [ecx],xmm0
  c3:	0b 0b                	or     ecx,DWORD PTR [ebx]
  c5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  c7:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  c9:	39 0b                	cmp    DWORD PTR [ebx],ecx
  cb:	01 13                	add    DWORD PTR [ebx],edx
  cd:	00 00                	add    BYTE PTR [eax],al
  cf:	10 15 00 27 19 00    	adc    BYTE PTR ds:0x192700,dl
  d5:	00 11                	add    BYTE PTR [ecx],dl
  d7:	15 01 27 19 01       	adc    eax,0x1192701
  dc:	13 00                	adc    eax,DWORD PTR [eax]
  de:	00 12                	add    BYTE PTR [edx],dl
  e0:	05 00 49 13 00       	add    eax,0x134900
  e5:	00 13                	add    BYTE PTR [ebx],dl
  e7:	21 00                	and    DWORD PTR [eax],eax
  e9:	49                   	dec    ecx
  ea:	13 2f                	adc    ebp,DWORD PTR [edi]
  ec:	05 00 00 14 34       	add    eax,0x34140000
  f1:	00 03                	add    BYTE PTR [ebx],al
  f3:	08 3a                	or     BYTE PTR [edx],bh
  f5:	0b 3b                	or     edi,DWORD PTR [ebx]
  f7:	0b 39                	or     edi,DWORD PTR [ecx]
  f9:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  fc:	3f                   	aas    
  fd:	19 02                	sbb    DWORD PTR [edx],eax
  ff:	18 00                	sbb    BYTE PTR [eax],al
 101:	00 15 34 00 03 0e    	add    BYTE PTR ds:0xe030034,dl
 107:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 109:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 10b:	39 0b                	cmp    DWORD PTR [ebx],ecx
 10d:	49                   	dec    ecx
 10e:	13 02                	adc    eax,DWORD PTR [edx]
 110:	18 00                	sbb    BYTE PTR [eax],al
 112:	00 16                	add    BYTE PTR [esi],dl
 114:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 117:	19 03                	sbb    DWORD PTR [ebx],eax
 119:	0e                   	push   cs
 11a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 11c:	3b 05 39 0b 27 19    	cmp    eax,DWORD PTR ds:0x19270b39
 122:	11 01                	adc    DWORD PTR [ecx],eax
 124:	12 06                	adc    al,BYTE PTR [esi]
 126:	40                   	inc    eax
 127:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 12d:	00 00                	add    BYTE PTR [eax],al
 12f:	17                   	pop    ss
 130:	05 00 03 0e 3a       	add    eax,0x3a0e0300
 135:	0b 3b                	or     edi,DWORD PTR [ebx]
 137:	05 39 0b 49 13       	add    eax,0x13490b39
 13c:	02 18                	add    bl,BYTE PTR [eax]
 13e:	00 00                	add    BYTE PTR [eax],al
 140:	18 34 00             	sbb    BYTE PTR [eax+eax*1],dh
 143:	03 0e                	add    ecx,DWORD PTR [esi]
 145:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 147:	3b 05 39 0b 49 13    	cmp    eax,DWORD PTR ds:0x13490b39
 14d:	02 18                	add    bl,BYTE PTR [eax]
 14f:	00 00                	add    BYTE PTR [eax],al
 151:	19 2e                	sbb    DWORD PTR [esi],ebp
 153:	00 3f                	add    BYTE PTR [edi],bh
 155:	19 03                	sbb    DWORD PTR [ebx],eax
 157:	0e                   	push   cs
 158:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 15a:	3b 05 39 0b 11 01    	cmp    eax,DWORD PTR ds:0x1110b39
 160:	12 06                	adc    al,BYTE PTR [esi]
 162:	40                   	inc    eax
 163:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 169:	1a 0b                	sbb    cl,BYTE PTR [ebx]
 16b:	01 11                	add    DWORD PTR [ecx],edx
 16d:	01 12                	add    DWORD PTR [edx],edx
 16f:	06                   	push   es
 170:	01 13                	add    DWORD PTR [ebx],edx
 172:	00 00                	add    BYTE PTR [eax],al
 174:	1b 34 00             	sbb    esi,DWORD PTR [eax+eax*1]
 177:	03 08                	add    ecx,DWORD PTR [eax]
 179:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 17b:	3b 05 39 0b 49 13    	cmp    eax,DWORD PTR ds:0x13490b39
 181:	02 18                	add    bl,BYTE PTR [eax]
 183:	00 00                	add    BYTE PTR [eax],al
 185:	1c 0b                	sbb    al,0xb
 187:	01 11                	add    DWORD PTR [ecx],edx
 189:	01 12                	add    DWORD PTR [edx],edx
 18b:	06                   	push   es
 18c:	00 00                	add    BYTE PTR [eax],al
 18e:	1d 21 00 49 13       	sbb    eax,0x13490021
 193:	2f                   	das    
 194:	18 00                	sbb    BYTE PTR [eax],al
 196:	00 1e                	add    BYTE PTR [esi],bl
 198:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 19b:	19 03                	sbb    DWORD PTR [ebx],eax
 19d:	0e                   	push   cs
 19e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1a0:	3b 05 39 0b 11 01    	cmp    eax,DWORD PTR ds:0x1110b39
 1a6:	12 06                	adc    al,BYTE PTR [esi]
 1a8:	40                   	inc    eax
 1a9:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 1af:	00 00                	add    BYTE PTR [eax],al
 1b1:	1f                   	pop    ds
 1b2:	0b 01                	or     eax,DWORD PTR [ecx]
 1b4:	55                   	push   ebp
 1b5:	17                   	pop    ss
 1b6:	00 00                	add    BYTE PTR [eax],al
 1b8:	20 2e                	and    BYTE PTR [esi],ch
 1ba:	01 3f                	add    DWORD PTR [edi],edi
 1bc:	19 03                	sbb    DWORD PTR [ebx],eax
 1be:	0e                   	push   cs
 1bf:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1c1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1c3:	39 0b                	cmp    DWORD PTR [ebx],ecx
 1c5:	27                   	daa    
 1c6:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 1c9:	11 01                	adc    DWORD PTR [ecx],eax
 1cb:	12 06                	adc    al,BYTE PTR [esi]
 1cd:	40                   	inc    eax
 1ce:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 1d4:	00 00                	add    BYTE PTR [eax],al
 1d6:	21 05 00 03 0e 3a    	and    DWORD PTR ds:0x3a0e0300,eax
 1dc:	0b 3b                	or     edi,DWORD PTR [ebx]
 1de:	0b 39                	or     edi,DWORD PTR [ecx]
 1e0:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 1e3:	02 18                	add    bl,BYTE PTR [eax]
 1e5:	00 00                	add    BYTE PTR [eax],al
 1e7:	22 34 00             	and    dh,BYTE PTR [eax+eax*1]
 1ea:	03 08                	add    ecx,DWORD PTR [eax]
 1ec:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1ee:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1f0:	39 0b                	cmp    DWORD PTR [ebx],ecx
 1f2:	49                   	dec    ecx
 1f3:	13 00                	adc    eax,DWORD PTR [eax]
 1f5:	00 23                	add    BYTE PTR [ebx],ah
 1f7:	34 00                	xor    al,0x0
 1f9:	03 08                	add    ecx,DWORD PTR [eax]
 1fb:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1fd:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1ff:	39 0b                	cmp    DWORD PTR [ebx],ecx
 201:	49                   	dec    ecx
 202:	13 02                	adc    eax,DWORD PTR [edx]
 204:	18 00                	sbb    BYTE PTR [eax],al
 206:	00 24 0a             	add    BYTE PTR [edx+ecx*1],ah
 209:	00 03                	add    BYTE PTR [ebx],al
 20b:	0e                   	push   cs
 20c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 20e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 210:	39 0b                	cmp    DWORD PTR [ebx],ecx
 212:	11 01                	adc    DWORD PTR [ecx],eax
 214:	00 00                	add    BYTE PTR [eax],al
 216:	25 2e 01 3f 19       	and    eax,0x193f012e
 21b:	03 0e                	add    ecx,DWORD PTR [esi]
 21d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 21f:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 221:	39 0b                	cmp    DWORD PTR [ebx],ecx
 223:	27                   	daa    
 224:	19 11                	sbb    DWORD PTR [ecx],edx
 226:	01 12                	add    DWORD PTR [edx],edx
 228:	06                   	push   es
 229:	40                   	inc    eax
 22a:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 230:	00 00                	add    BYTE PTR [eax],al
 232:	26 2e 01 3f          	es add DWORD PTR cs:[edi],edi
 236:	19 03                	sbb    DWORD PTR [ebx],eax
 238:	0e                   	push   cs
 239:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 23b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 23d:	39 0b                	cmp    DWORD PTR [ebx],ecx
 23f:	11 01                	adc    DWORD PTR [ecx],eax
 241:	12 06                	adc    al,BYTE PTR [esi]
 243:	40                   	inc    eax
 244:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 24a:	00 00                	add    BYTE PTR [eax],al
 24c:	27                   	daa    
 24d:	2e 00 3f             	add    BYTE PTR cs:[edi],bh
 250:	19 03                	sbb    DWORD PTR [ebx],eax
 252:	0e                   	push   cs
 253:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 255:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 257:	39 0b                	cmp    DWORD PTR [ebx],ecx
 259:	11 01                	adc    DWORD PTR [ecx],eax
 25b:	12 06                	adc    al,BYTE PTR [esi]
 25d:	40                   	inc    eax
 25e:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 264:	00 01                	add    BYTE PTR [ecx],al
 266:	11 01                	adc    DWORD PTR [ecx],eax
 268:	25 0e 13 0b 03       	and    eax,0x30b130e
 26d:	0e                   	push   cs
 26e:	1b 0e                	sbb    ecx,DWORD PTR [esi]
 270:	11 01                	adc    DWORD PTR [ecx],eax
 272:	12 06                	adc    al,BYTE PTR [esi]
 274:	10 17                	adc    BYTE PTR [edi],dl
 276:	00 00                	add    BYTE PTR [eax],al
 278:	02 24 00             	add    ah,BYTE PTR [eax+eax*1]
 27b:	0b 0b                	or     ecx,DWORD PTR [ebx]
 27d:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 280:	0e                   	push   cs
 281:	00 00                	add    BYTE PTR [eax],al
 283:	03 24 00             	add    esp,DWORD PTR [eax+eax*1]
 286:	0b 0b                	or     ecx,DWORD PTR [ebx]
 288:	3e 0b 03             	or     eax,DWORD PTR ds:[ebx]
 28b:	08 00                	or     BYTE PTR [eax],al
 28d:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
 290:	01 49 13             	add    DWORD PTR [ecx+0x13],ecx
 293:	01 13                	add    DWORD PTR [ebx],edx
 295:	00 00                	add    BYTE PTR [eax],al
 297:	05 21 00 49 13       	add    eax,0x13490021
 29c:	2f                   	das    
 29d:	0b 00                	or     eax,DWORD PTR [eax]
 29f:	00 06                	add    BYTE PTR [esi],al
 2a1:	0f 00 0b             	str    WORD PTR [ebx]
 2a4:	0b 00                	or     eax,DWORD PTR [eax]
 2a6:	00 07                	add    BYTE PTR [edi],al
 2a8:	0f 00 0b             	str    WORD PTR [ebx]
 2ab:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 2ae:	00 00                	add    BYTE PTR [eax],al
 2b0:	08 26                	or     BYTE PTR [esi],ah
 2b2:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 2b5:	00 00                	add    BYTE PTR [eax],al
 2b7:	09 16                	or     DWORD PTR [esi],edx
 2b9:	00 03                	add    BYTE PTR [ebx],al
 2bb:	0e                   	push   cs
 2bc:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2be:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2c0:	39 0b                	cmp    DWORD PTR [ebx],ecx
 2c2:	49                   	dec    ecx
 2c3:	13 00                	adc    eax,DWORD PTR [eax]
 2c5:	00 0a                	add    BYTE PTR [edx],cl
 2c7:	34 00                	xor    al,0x0
 2c9:	03 0e                	add    ecx,DWORD PTR [esi]
 2cb:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2cd:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2cf:	39 0b                	cmp    DWORD PTR [ebx],ecx
 2d1:	49                   	dec    ecx
 2d2:	13 3f                	adc    edi,DWORD PTR [edi]
 2d4:	19 02                	sbb    DWORD PTR [edx],eax
 2d6:	18 00                	sbb    BYTE PTR [eax],al
 2d8:	00 0b                	add    BYTE PTR [ebx],cl
 2da:	13 01                	adc    eax,DWORD PTR [ecx]
 2dc:	03 0e                	add    ecx,DWORD PTR [esi]
 2de:	0b 0b                	or     ecx,DWORD PTR [ebx]
 2e0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2e2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2e4:	39 0b                	cmp    DWORD PTR [ebx],ecx
 2e6:	01 13                	add    DWORD PTR [ebx],edx
 2e8:	00 00                	add    BYTE PTR [eax],al
 2ea:	0c 0d                	or     al,0xd
 2ec:	00 03                	add    BYTE PTR [ebx],al
 2ee:	0e                   	push   cs
 2ef:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 2f1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 2f3:	39 0b                	cmp    DWORD PTR [ebx],ecx
 2f5:	49                   	dec    ecx
 2f6:	13 38                	adc    edi,DWORD PTR [eax]
 2f8:	0b 00                	or     eax,DWORD PTR [eax]
 2fa:	00 0d 34 00 03 0e    	add    BYTE PTR ds:0xe030034,cl
 300:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 302:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 304:	39 0b                	cmp    DWORD PTR [ebx],ecx
 306:	49                   	dec    ecx
 307:	13 3f                	adc    edi,DWORD PTR [edi]
 309:	19 3c 19             	sbb    DWORD PTR [ecx+ebx*1],edi
 30c:	00 00                	add    BYTE PTR [eax],al
 30e:	0e                   	push   cs
 30f:	04 01                	add    al,0x1
 311:	03 0e                	add    ecx,DWORD PTR [esi]
 313:	3e 0b 0b             	or     ecx,DWORD PTR ds:[ebx]
 316:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 319:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 31b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 31d:	39 0b                	cmp    DWORD PTR [ebx],ecx
 31f:	01 13                	add    DWORD PTR [ebx],edx
 321:	00 00                	add    BYTE PTR [eax],al
 323:	0f 28 00             	movaps xmm0,XMMWORD PTR [eax]
 326:	03 0e                	add    ecx,DWORD PTR [esi]
 328:	1c 0b                	sbb    al,0xb
 32a:	00 00                	add    BYTE PTR [eax],al
 32c:	10 13                	adc    BYTE PTR [ebx],dl
 32e:	01 0b                	add    DWORD PTR [ebx],ecx
 330:	0b 3a                	or     edi,DWORD PTR [edx]
 332:	0b 3b                	or     edi,DWORD PTR [ebx]
 334:	0b 39                	or     edi,DWORD PTR [ecx]
 336:	0b 01                	or     eax,DWORD PTR [ecx]
 338:	13 00                	adc    eax,DWORD PTR [eax]
 33a:	00 11                	add    BYTE PTR [ecx],dl
 33c:	15 00 27 19 00       	adc    eax,0x192700
 341:	00 12                	add    BYTE PTR [edx],dl
 343:	15 01 27 19 01       	adc    eax,0x1192701
 348:	13 00                	adc    eax,DWORD PTR [eax]
 34a:	00 13                	add    BYTE PTR [ebx],dl
 34c:	05 00 49 13 00       	add    eax,0x134900
 351:	00 14 21             	add    BYTE PTR [ecx+eiz*1],dl
 354:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 357:	2f                   	das    
 358:	05 00 00 15 34       	add    eax,0x34150000
 35d:	00 03                	add    BYTE PTR [ebx],al
 35f:	08 3a                	or     BYTE PTR [edx],bh
 361:	0b 3b                	or     edi,DWORD PTR [ebx]
 363:	0b 39                	or     edi,DWORD PTR [ecx]
 365:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 368:	3f                   	aas    
 369:	19 02                	sbb    DWORD PTR [edx],eax
 36b:	18 00                	sbb    BYTE PTR [eax],al
 36d:	00 16                	add    BYTE PTR [esi],dl
 36f:	34 00                	xor    al,0x0
 371:	03 0e                	add    ecx,DWORD PTR [esi]
 373:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 375:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 377:	39 0b                	cmp    DWORD PTR [ebx],ecx
 379:	49                   	dec    ecx
 37a:	13 02                	adc    eax,DWORD PTR [edx]
 37c:	18 00                	sbb    BYTE PTR [eax],al
 37e:	00 17                	add    BYTE PTR [edi],dl
 380:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 383:	19 03                	sbb    DWORD PTR [ebx],eax
 385:	0e                   	push   cs
 386:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 388:	3b 05 39 0b 27 19    	cmp    eax,DWORD PTR ds:0x19270b39
 38e:	49                   	dec    ecx
 38f:	13 11                	adc    edx,DWORD PTR [ecx]
 391:	01 12                	add    DWORD PTR [edx],edx
 393:	06                   	push   es
 394:	40                   	inc    eax
 395:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 39b:	00 00                	add    BYTE PTR [eax],al
 39d:	18 05 00 03 0e 3a    	sbb    BYTE PTR ds:0x3a0e0300,al
 3a3:	0b 3b                	or     edi,DWORD PTR [ebx]
 3a5:	05 39 0b 49 13       	add    eax,0x13490b39
 3aa:	02 18                	add    bl,BYTE PTR [eax]
 3ac:	00 00                	add    BYTE PTR [eax],al
 3ae:	19 34 00             	sbb    DWORD PTR [eax+eax*1],esi
 3b1:	03 0e                	add    ecx,DWORD PTR [esi]
 3b3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3b5:	3b 05 39 0b 49 13    	cmp    eax,DWORD PTR ds:0x13490b39
 3bb:	02 18                	add    bl,BYTE PTR [eax]
 3bd:	00 00                	add    BYTE PTR [eax],al
 3bf:	1a 0a                	sbb    cl,BYTE PTR [edx]
 3c1:	00 03                	add    BYTE PTR [ebx],al
 3c3:	0e                   	push   cs
 3c4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3c6:	3b 05 39 0b 11 01    	cmp    eax,DWORD PTR ds:0x1110b39
 3cc:	00 00                	add    BYTE PTR [eax],al
 3ce:	1b 0b                	sbb    ecx,DWORD PTR [ebx]
 3d0:	01 11                	add    DWORD PTR [ecx],edx
 3d2:	01 12                	add    DWORD PTR [edx],edx
 3d4:	06                   	push   es
 3d5:	01 13                	add    DWORD PTR [ebx],edx
 3d7:	00 00                	add    BYTE PTR [eax],al
 3d9:	1c 0b                	sbb    al,0xb
 3db:	01 11                	add    DWORD PTR [ecx],edx
 3dd:	01 12                	add    DWORD PTR [edx],edx
 3df:	06                   	push   es
 3e0:	00 00                	add    BYTE PTR [eax],al
 3e2:	1d 34 00 03 08       	sbb    eax,0x8030034
 3e7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3e9:	3b 05 39 0b 49 13    	cmp    eax,DWORD PTR ds:0x13490b39
 3ef:	02 18                	add    bl,BYTE PTR [eax]
 3f1:	00 00                	add    BYTE PTR [eax],al
 3f3:	1e                   	push   ds
 3f4:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 3f7:	19 03                	sbb    DWORD PTR [ebx],eax
 3f9:	0e                   	push   cs
 3fa:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 3fc:	3b 05 39 0b 27 19    	cmp    eax,DWORD PTR ds:0x19270b39
 402:	11 01                	adc    DWORD PTR [ecx],eax
 404:	12 06                	adc    al,BYTE PTR [esi]
 406:	40                   	inc    eax
 407:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 40d:	00 00                	add    BYTE PTR [eax],al
 40f:	1f                   	pop    ds
 410:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 413:	19 03                	sbb    DWORD PTR [ebx],eax
 415:	0e                   	push   cs
 416:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 418:	3b 05 39 0b 27 19    	cmp    eax,DWORD PTR ds:0x19270b39
 41e:	49                   	dec    ecx
 41f:	13 11                	adc    edx,DWORD PTR [ecx]
 421:	01 12                	add    DWORD PTR [edx],edx
 423:	06                   	push   es
 424:	40                   	inc    eax
 425:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
 42b:	00 00                	add    BYTE PTR [eax],al
 42d:	20 2e                	and    BYTE PTR [esi],ch
 42f:	00 3f                	add    BYTE PTR [edi],bh
 431:	19 03                	sbb    DWORD PTR [ebx],eax
 433:	0e                   	push   cs
 434:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 436:	3b 05 39 0b 11 01    	cmp    eax,DWORD PTR ds:0x1110b39
 43c:	12 06                	adc    al,BYTE PTR [esi]
 43e:	40                   	inc    eax
 43f:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 445:	21 2e                	and    DWORD PTR [esi],ebp
 447:	01 3f                	add    DWORD PTR [edi],edi
 449:	19 03                	sbb    DWORD PTR [ebx],eax
 44b:	0e                   	push   cs
 44c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 44e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 450:	39 0b                	cmp    DWORD PTR [ebx],ecx
 452:	27                   	daa    
 453:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
 456:	11 01                	adc    DWORD PTR [ecx],eax
 458:	12 06                	adc    al,BYTE PTR [esi]
 45a:	40                   	inc    eax
 45b:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 461:	00 00                	add    BYTE PTR [eax],al
 463:	22 05 00 03 0e 3a    	and    al,BYTE PTR ds:0x3a0e0300
 469:	0b 3b                	or     edi,DWORD PTR [ebx]
 46b:	0b 39                	or     edi,DWORD PTR [ecx]
 46d:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
 470:	02 18                	add    bl,BYTE PTR [eax]
 472:	00 00                	add    BYTE PTR [eax],al
 474:	23 34 00             	and    esi,DWORD PTR [eax+eax*1]
 477:	03 08                	add    ecx,DWORD PTR [eax]
 479:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 47b:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 47d:	39 0b                	cmp    DWORD PTR [ebx],ecx
 47f:	49                   	dec    ecx
 480:	13 02                	adc    eax,DWORD PTR [edx]
 482:	18 00                	sbb    BYTE PTR [eax],al
 484:	00 24 2e             	add    BYTE PTR [esi+ebp*1],ah
 487:	01 3f                	add    DWORD PTR [edi],edi
 489:	19 03                	sbb    DWORD PTR [ebx],eax
 48b:	0e                   	push   cs
 48c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 48e:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 490:	39 0b                	cmp    DWORD PTR [ebx],ecx
 492:	27                   	daa    
 493:	19 11                	sbb    DWORD PTR [ecx],edx
 495:	01 12                	add    DWORD PTR [edx],edx
 497:	06                   	push   es
 498:	40                   	inc    eax
 499:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 49f:	00 00                	add    BYTE PTR [eax],al
 4a1:	25 34 00 03 0e       	and    eax,0xe030034
 4a6:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 4a8:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 4aa:	39 0b                	cmp    DWORD PTR [ebx],ecx
 4ac:	49                   	dec    ecx
 4ad:	13 00                	adc    eax,DWORD PTR [eax]
 4af:	00 26                	add    BYTE PTR [esi],ah
 4b1:	34 00                	xor    al,0x0
 4b3:	03 08                	add    ecx,DWORD PTR [eax]
 4b5:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 4b7:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 4b9:	39 0b                	cmp    DWORD PTR [ebx],ecx
 4bb:	49                   	dec    ecx
 4bc:	13 00                	adc    eax,DWORD PTR [eax]
 4be:	00 27                	add    BYTE PTR [edi],ah
 4c0:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 4c3:	19 03                	sbb    DWORD PTR [ebx],eax
 4c5:	0e                   	push   cs
 4c6:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 4c8:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 4ca:	39 0b                	cmp    DWORD PTR [ebx],ecx
 4cc:	27                   	daa    
 4cd:	19 11                	sbb    DWORD PTR [ecx],edx
 4cf:	01 12                	add    DWORD PTR [edx],edx
 4d1:	06                   	push   es
 4d2:	40                   	inc    eax
 4d3:	18 97 42 19 00 00    	sbb    BYTE PTR [edi+0x1942],dl
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
  14:	af                   	scas   eax,DWORD PTR es:[edi]
  15:	0f 00 00             	sldt   WORD PTR [eax]
	...
  20:	1c 00                	sbb    al,0x0
  22:	00 00                	add    BYTE PTR [eax],al
  24:	02 00                	add    al,BYTE PTR [eax]
  26:	c9                   	leave  
  27:	09 00                	or     DWORD PTR [eax],eax
  29:	00 04 00             	add    BYTE PTR [eax+eax*1],al
  2c:	00 00                	add    BYTE PTR [eax],al
  2e:	00 00                	add    BYTE PTR [eax],al
  30:	af                   	scas   eax,DWORD PTR es:[edi]
  31:	0f 10 03             	movups xmm0,XMMWORD PTR [ebx]
  34:	d7                   	xlat   BYTE PTR ds:[ebx]
  35:	0f 00 00             	sldt   WORD PTR [eax]
	...

Disassembly of section .debug_ranges:

00000000 <.debug_ranges>:
   0:	5c                   	pop    esp
   1:	0b 00                	or     eax,DWORD PTR [eax]
   3:	00 c2                	add    dl,al
   5:	0b 00                	or     eax,DWORD PTR [eax]
   7:	00 c4                	add    ah,al
   9:	0b 00                	or     eax,DWORD PTR [eax]
   b:	00 c5                	add    ch,al
   d:	0b 00                	or     eax,DWORD PTR [eax]
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	08 05 00 00 03 00    	or     BYTE PTR ds:0x30000,al
   6:	e5 00                	in     eax,0x0
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
  20:	75 73                	jne    95 <cmdClearScreen-0x30fff6b>
  22:	72 2f                	jb     53 <cmdClearScreen-0x30fffad>
  24:	6c                   	ins    BYTE PTR es:[edi],dx
  25:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
  2c:	69 36 38 36 2d 6c    	imul   esi,DWORD PTR [esi],0x6c2d3638
  32:	69 6e 75 78 2d 67 6e 	imul   ebp,DWORD PTR [esi+0x75],0x6e672d78
  39:	75 2f                	jne    6a <cmdClearScreen-0x30fff96>
  3b:	39 2f                	cmp    DWORD PTR [edi],ebp
  3d:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  44:	00 2e                	add    BYTE PTR [esi],ch
  46:	2e 2f                	cs das 
  48:	6c                   	ins    BYTE PTR es:[edi],dx
  49:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  50:	4f                   	dec    edi
  51:	53                   	push   ebx
  52:	2f                   	das    
  53:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  5a:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
  5d:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  61:	65 2f                	gs das 
  63:	2e 2e 2f             	cs cs das 
  66:	2e 2e 2f             	cs cs das 
  69:	2e 2e 2f             	cs cs das 
  6c:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
  70:	6a 2f                	push   0x2f
  72:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
  75:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
  7c:	6e                   	outs   dx,BYTE PTR ds:[esi]
  7d:	65 6c                	gs ins BYTE PTR es:[edi],dx
  7f:	2f                   	das    
  80:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  87:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
  8a:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  8e:	65 00 00             	add    BYTE PTR gs:[eax],al
  91:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  94:	6d                   	ins    DWORD PTR es:[edi],dx
  95:	61                   	popa   
  96:	6e                   	outs   dx,BYTE PTR ds:[esi]
  97:	64 73 2e             	fs jae c8 <cmdClearScreen-0x30fff38>
  9a:	63 00                	arpl   WORD PTR [eax],ax
  9c:	01 00                	add    DWORD PTR [eax],eax
  9e:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  a1:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
  a8:	63 
  a9:	2e 68 00 02 00 00    	cs push 0x200
  af:	66 69 6c 65 2e 68 00 	imul   bp,WORD PTR [ebp+eiz*2+0x2e],0x68
  b6:	03 00                	add    eax,DWORD PTR [eax]
  b8:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
  bb:	6d                   	ins    DWORD PTR es:[edi],dx
  bc:	6d                   	ins    DWORD PTR es:[edi],dx
  bd:	6f                   	outs   dx,DWORD PTR ds:[esi]
  be:	6e                   	outs   dx,BYTE PTR ds:[esi]
  bf:	2e 68 00 03 00 00    	cs push 0x300
  c5:	73 69                	jae    130 <cmdClearScreen-0x30ffed0>
  c7:	67 6e                	outs   dx,BYTE PTR ds:[si]
  c9:	61                   	popa   
  ca:	6c                   	ins    BYTE PTR es:[edi],dx
  cb:	73 2e                	jae    fb <cmdClearScreen-0x30fff05>
  cd:	68 00 04 00 00       	push   0x400
  d2:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  d6:	6c                   	ins    BYTE PTR es:[edi],dx
  d7:	6c                   	ins    BYTE PTR es:[edi],dx
  d8:	2e 68 00 05 00 00    	cs push 0x500
  de:	74 68                	je     148 <cmdClearScreen-0x30ffeb8>
  e0:	65 73 69             	gs jae 14c <cmdClearScreen-0x30ffeb4>
  e3:	67 6e                	outs   dx,BYTE PTR ds:[si]
  e5:	61                   	popa   
  e6:	6c                   	ins    BYTE PTR es:[edi],dx
  e7:	73 2e                	jae    117 <cmdClearScreen-0x30ffee9>
  e9:	68 00 04 00 00       	push   0x400
  ee:	00 05 01 00 05 02    	add    BYTE PTR ds:0x2050001,al
  f4:	00 00                	add    BYTE PTR [eax],al
  f6:	10 03                	adc    BYTE PTR [ebx],al
  f8:	03 0a                	add    ecx,DWORD PTR [edx]
  fa:	01 05 05 08 4b 05    	add    DWORD PTR ds:0x54b0805,eax
 100:	01 08                	add    DWORD PTR [eax],ecx
 102:	3d 69 05 0e 08       	cmp    eax,0x80e0569
 107:	59                   	pop    ecx
 108:	05 05 74 05 1b       	add    eax,0x1b057405
 10d:	30 05 0c 08 20 05    	xor    BYTE PTR ds:0x520080c,al
 113:	28 4c 05 0d          	sub    BYTE PTR [ebp+eax*1+0xd],cl
 117:	f2 05 1f 00 02 04    	repnz add eax,0x402001f
 11d:	02 08                	add    cl,BYTE PTR [eax]
 11f:	46                   	inc    esi
 120:	05 05 00 02 04       	add    eax,0x4020005
 125:	01 4a 05             	add    DWORD PTR [edx+0x5],ecx
 128:	01 6e 77             	add    DWORD PTR [esi+0x77],ebp
 12b:	05 09 08 86 05       	add    eax,0x5860809
 130:	08 08                	or     BYTE PTR [eax],cl
 132:	90                   	nop
 133:	05 0d 84 05 18       	add    eax,0x1805840d
 138:	74 05                	je     13f <cmdClearScreen-0x30ffec1>
 13a:	1e                   	push   ds
 13b:	75 05                	jne    142 <cmdClearScreen-0x30ffebe>
 13d:	0d 08 82 05 0c       	or     eax,0xc058208
 142:	3d 05 0d 68 05       	cmp    eax,0x5680d05
 147:	16                   	push   ss
 148:	08 69 05             	or     BYTE PTR [ecx+0x5],ch
 14b:	17                   	pop    ss
 14c:	3c 05                	cmp    al,0x5
 14e:	16                   	push   ss
 14f:	66 05 10 4a          	add    ax,0x4a10
 153:	05 12 3d 05 23       	add    eax,0x23053d12
 158:	08 20                	or     BYTE PTR [eax],ah
 15a:	05 2b 58 05 11       	add    eax,0x1105582b
 15f:	3c 05                	cmp    al,0x5
 161:	21 3d 05 13 66 05    	and    DWORD PTR ds:0x5661305,edi
 167:	14 e5                	adc    al,0xe5
 169:	05 09 08 21 05       	add    eax,0x5210809
 16e:	10 08                	adc    BYTE PTR [eax],cl
 170:	83 05 19 82 05 09 3d 	add    DWORD PTR ds:0x9058219,0x3d
 177:	05 2b 3c 05 09       	add    eax,0x9053c2b
 17c:	66 08 75 d7          	data16 or BYTE PTR [ebp-0x29],dh
 180:	d7                   	xlat   BYTE PTR ds:[ebx]
 181:	08 13                	or     BYTE PTR [ebx],dl
 183:	d7                   	xlat   BYTE PTR ds:[ebx]
 184:	f5                   	cmc    
 185:	05 01 59 5b 05       	add    eax,0x55b5901
 18a:	0d 08 ad 05 08       	or     eax,0x805ad08
 18f:	08 68 05             	or     BYTE PTR [eax+0x5],ch
 192:	0d 68 05 0c 74       	or     eax,0x740c0568
 197:	05 20 4d 05 1e       	add    eax,0x1e054d20
 19c:	08 12                	or     BYTE PTR [edx],dl
 19e:	05 0d 84 08 91       	add    eax,0x9108840d
 1a3:	05 09 08 78 05       	add    eax,0x5780809
 1a8:	01 08                	add    DWORD PTR [eax],ecx
 1aa:	4c                   	dec    esp
 1ab:	69 05 0a 08 83 05 09 	imul   eax,DWORD PTR ds:0x583080a,0xb054b09
 1b2:	4b 05 0b 
 1b5:	76 77                	jbe    22e <cmdClearScreen-0x30ffdd2>
 1b7:	05 1d 74 05 0b       	add    eax,0xb05741d
 1bc:	75 75                	jne    233 <cmdClearScreen-0x30ffdcd>
 1be:	05 1c 74 05 2e       	add    eax,0x2e05741c
 1c3:	74 05                	je     1ca <cmdClearScreen-0x30ffe36>
 1c5:	09 75 a0             	or     DWORD PTR [ebp-0x60],esi
 1c8:	05 0b 75 05 0a       	add    eax,0xa05750b
 1cd:	75 05                	jne    1d4 <cmdClearScreen-0x30ffe2c>
 1cf:	09 4b 05             	or     DWORD PTR [ebx+0x5],ecx
 1d2:	16                   	push   ss
 1d3:	74 05                	je     1da <cmdClearScreen-0x30ffe26>
 1d5:	17                   	pop    ss
 1d6:	75 05                	jne    1dd <cmdClearScreen-0x30ffe23>
 1d8:	10 08                	adc    BYTE PTR [eax],cl
 1da:	30 05 08 08 76 05    	xor    BYTE PTR ds:0x5760808,al
 1e0:	09 68 05             	or     DWORD PTR [eax+0x5],ebp
 1e3:	15 08 21 05 09       	adc    eax,0x9052108
 1e8:	08 f5                	or     ch,dh
 1ea:	05 10 08 15 05       	add    eax,0x5150810
 1ef:	11 08                	adc    DWORD PTR [eax],ecx
 1f1:	75 05                	jne    1f8 <cmdClearScreen-0x30ffe08>
 1f3:	08 08                	or     BYTE PTR [eax],cl
 1f5:	76 05                	jbe    1fc <cmdClearScreen-0x30ffe04>
 1f7:	15 a0 05 17 08       	adc    eax,0x81705a0
 1fc:	2f                   	das    
 1fd:	05 0f 08 4a 05       	add    eax,0x54a080f
 202:	0c 67                	or     al,0x67
 204:	05 12 67 05 15       	add    eax,0x15056712
 209:	67 05 0c 08 75 05    	addr16 add eax,0x575080c
 20f:	13 67 05             	adc    esp,DWORD PTR [edi+0x5]
 212:	0c 08                	or     al,0x8
 214:	75 05                	jne    21b <cmdClearScreen-0x30ffde5>
 216:	28 67 05             	sub    BYTE PTR [edi+0x5],ah
 219:	0d 66 08 3e 05       	or     eax,0x53e0866
 21e:	14 08                	adc    al,0x8
 220:	15 05 08 69 05       	adc    eax,0x5690805
 225:	16                   	push   ss
 226:	a0 05 17 08 2f       	mov    al,ds:0x2f081705
 22b:	05 0f 08 4a 05       	add    eax,0x54a080f
 230:	0c 67                	or     al,0x67
 232:	05 12 67 05 15       	add    eax,0x15056712
 237:	67 05 0c 08 75 05    	addr16 add eax,0x575080c
 23d:	13 67 05             	adc    esp,DWORD PTR [edi+0x5]
 240:	0c 08                	or     al,0x8
 242:	75 05                	jne    249 <cmdClearScreen-0x30ffdb7>
 244:	19 67 05             	sbb    DWORD PTR [edi+0x5],esp
 247:	11 d6                	adc    esi,edx
 249:	05 0c 83 05 29       	add    eax,0x2905830c
 24e:	67 05 0d 66 08 3e    	addr16 add eax,0x3e08660d
 254:	05 15 08 13 05       	add    eax,0x5130815
 259:	0c 69                	or     al,0x69
 25b:	05 0d 08 76 05       	add    eax,0x576080d
 260:	08 66 05             	or     BYTE PTR [esi+0x5],ah
 263:	09 4c 05 0f          	or     DWORD PTR [ebp+eax*1+0xf],ecx
 267:	08 21                	or     BYTE PTR [ecx],ah
 269:	05 08 77 05 0e       	add    eax,0xe057708
 26e:	68 05 0d 08 31       	push   0x31080d05
 273:	05 0c 08 58 05       	add    eax,0x558080c
 278:	0d 4b 08 3d 05       	or     eax,0x53d084b
 27d:	0c 08                	or     al,0x8
 27f:	74 05                	je     286 <cmdClearScreen-0x30ffd7a>
 281:	0d 4c 05 13 08       	or     eax,0x813054c
 286:	75 05                	jne    28d <cmdClearScreen-0x30ffd73>
 288:	08 79 05             	or     BYTE PTR [ecx+0x5],bh
 28b:	09 a0 05 12 08 76    	or     DWORD PTR [eax+0x76081205],esp
 291:	05 0d 08 82 05       	add    eax,0x582080d
 296:	0c 3c                	or     al,0x3c
 298:	05 17 4b 05 13       	add    eax,0x13054b17
 29d:	4c                   	dec    esp
 29e:	05 16 84 05 0c       	add    eax,0xc058416
 2a3:	90                   	nop
 2a4:	05 0d 4c 05 17       	add    eax,0x17054c0d
 2a9:	02 25 13 05 23 bb    	add    ah,BYTE PTR ds:0xbb230513
 2af:	05 1b e6 05 11       	add    eax,0x1105e61b
 2b4:	82 05 0d 4c 05 16 02 	add    BYTE PTR ds:0x16054c0d,0x2
 2bb:	24 13                	and    al,0x13
 2bd:	05 22 ad 05 0c       	add    eax,0xc05ad22
 2c2:	bd 05 10 a3 05       	mov    ebp,0x5a31005
 2c7:	15 67 05 14 08       	adc    eax,0x8140567
 2cc:	66 05 15 5a          	add    ax,0x5a15
 2d0:	05 1b 08 21 05       	add    eax,0x521081b
 2d5:	15 75 05 10 5a       	adc    eax,0x5a100575
 2da:	05 15 68 05 14       	add    eax,0x14056815
 2df:	08 4a 05             	or     BYTE PTR [edx+0x5],cl
 2e2:	1a 4c 05 19          	sbb    cl,BYTE PTR [ebp+eax*1+0x19]
 2e6:	08 4a 05             	or     BYTE PTR [edx+0x5],cl
 2e9:	15 4b 08 14 08       	adc    eax,0x814084b
 2ee:	84 05 11 67 05 15    	test   BYTE PTR ds:0x15056711,al
 2f4:	08 2f                	or     BYTE PTR [edi],ch
 2f6:	05 11 67 05 10       	add    eax,0x10056711
 2fb:	08 13                	or     BYTE PTR [ebx],dl
 2fd:	05 11 67 05 1c       	add    eax,0x1c056711
 302:	08 67 05             	or     BYTE PTR [edi+0x5],ah
 305:	10 08                	adc    BYTE PTR [eax],cl
 307:	d8 05 1a 68 05 18    	fadd   DWORD PTR ds:0x1805681a
 30d:	08 3f                	or     BYTE PTR [edi],bh
 30f:	05 0d 75 05 11       	add    eax,0x1105750d
 314:	08 30                	or     BYTE PTR [eax],dh
 316:	05 0d 67 05 11       	add    eax,0x1105670d
 31b:	08 93 05 10 74 05    	or     BYTE PTR [ebx+0x5741005],dl
 321:	24 4c                	and    al,0x4c
 323:	05 22 08 12 05       	add    eax,0x5120822
 328:	26 83 05 14 82 05 15 	add    DWORD PTR es:0x15058214,0x75
 32f:	75 
 330:	05 0d 08 77 08       	add    eax,0x877080d
 335:	bb 05 01 08 a1       	mov    ebx,0xa1080105
 33a:	05 05 21 d7 05       	add    eax,0x5d72105
 33f:	08 d7                	or     bh,dl
 341:	05 09 67 05 08       	add    eax,0x8056709
 346:	d7                   	xlat   BYTE PTR ds:[ebx]
 347:	05 09 67 05 08       	add    eax,0x8056709
 34c:	d7                   	xlat   BYTE PTR ds:[ebx]
 34d:	05 09 67 05 08       	add    eax,0x8056709
 352:	d7                   	xlat   BYTE PTR ds:[ebx]
 353:	05 09 67 05 08       	add    eax,0x8056709
 358:	d7                   	xlat   BYTE PTR ds:[ebx]
 359:	05 09 67 05 01       	add    eax,0x1056709
 35e:	d7                   	xlat   BYTE PTR ds:[ebx]
 35f:	69 05 14 08 5a 05 0a 	imul   eax,DWORD PTR ds:0x55a0814,0x52f080a
 366:	08 2f 05 
 369:	05 4c 05 09 d8       	add    eax,0xd809054c
 36e:	05 08 66 05 09       	add    eax,0x9056608
 373:	4b                   	dec    ebx
 374:	05 05 08 4b 05       	add    eax,0x54b0805
 379:	09 08                	or     DWORD PTR [eax],ecx
 37b:	13 05 08 08 90 05    	adc    eax,DWORD PTR ds:0x5900808
 381:	0d 4b 05 0c 08       	or     eax,0x80c054b
 386:	20 05 0d 4c 05 12    	and    BYTE PTR ds:0x12054c0d,al
 38c:	08 4b 05             	or     BYTE PTR [ebx+0x5],cl
 38f:	09 4c 05 08          	or     DWORD PTR [ebp+eax*1+0x8],ecx
 393:	74 05                	je     39a <cmdClearScreen-0x30ffc66>
 395:	09 4c f3 05          	or     DWORD PTR [ebx+esi*8+0x5],ecx
 399:	05 08 4d 05 01       	add    eax,0x1054d08
 39e:	d7                   	xlat   BYTE PTR ds:[ebx]
 39f:	69 05 05 08 5b 05 09 	imul   eax,DWORD PTR ds:0x55b0805,0x805d709
 3a6:	d7 05 08 
 3a9:	d6                   	(bad)  
 3aa:	05 09 4c 08 21       	add    eax,0x21084c09
 3af:	05 10 30 05 0f       	add    eax,0xf053010
 3b4:	58                   	pop    eax
 3b5:	05 05 3d 05 0e       	add    eax,0xe053d05
 3ba:	d7                   	xlat   BYTE PTR ds:[ebx]
 3bb:	05 0d 58 05 05       	add    eax,0x505580d
 3c0:	3d 05 01 08 84       	cmp    eax,0x84080105
 3c5:	5b                   	pop    ebx
 3c6:	05 09 08 59 76       	add    eax,0x76590809
 3cb:	05 0b 75 05 0c       	add    eax,0xc05750b
 3d0:	67 05 0d 08 4c 05    	addr16 add eax,0x54c080d
 3d6:	08 08                	or     BYTE PTR [eax],cl
 3d8:	3e 05 13 67 05 0d    	ds add eax,0xd056713
 3de:	67 05 13 67 68 05    	addr16 add eax,0x5686713
 3e4:	0e                   	push   cs
 3e5:	4c                   	dec    esp
 3e6:	05 05 74 05 09       	add    eax,0x9057405
 3eb:	30 08                	xor    BYTE PTR [eax],cl
 3ed:	ad                   	lods   eax,DWORD PTR ds:[esi]
 3ee:	05 0d d7 05 0c       	add    eax,0xc05d70d
 3f3:	90                   	nop
 3f4:	05 11 4c 05 10       	add    eax,0x10054c11
 3f9:	c8 05 14 59          	enter  0x1405,0x59
 3fd:	05 0d 67 05 21       	add    eax,0x2105670d
 402:	00 02                	add    BYTE PTR [edx],al
 404:	04 02                	add    al,0x2
 406:	03 78 2e             	add    edi,DWORD PTR [eax+0x2e]
 409:	05 05 00 02 04       	add    eax,0x4020005
 40e:	01 4a 05             	add    DWORD PTR [edx+0x5],ecx
 411:	01 03                	add    DWORD PTR [ebx],eax
 413:	0c 82                	or     al,0x82
 415:	05 0d 2a 05 01       	add    eax,0x1052a0d
 41a:	24 69                	and    al,0x69
 41c:	05 05 08 3d 05       	add    eax,0x53d0805
 421:	01 08                	add    DWORD PTR [eax],ecx
 423:	13 3f                	adc    edi,DWORD PTR [edi]
 425:	05 09 08 85 05       	add    eax,0x5850809
 42a:	08 08                	or     BYTE PTR [eax],cl
 42c:	90                   	nop
 42d:	05 14 4c 05 12       	add    eax,0x12054c14
 432:	08 58 a1             	or     BYTE PTR [eax-0x5f],bl
 435:	05 0f bb 05 01       	add    eax,0x105bb0f
 43a:	91                   	xchg   ecx,eax
 43b:	69 05 09 08 5b 05 05 	imul   eax,DWORD PTR ds:0x55b0809,0x57b0805
 442:	08 7b 05 
 445:	13 08                	adc    ecx,DWORD PTR [eax]
 447:	4b                   	dec    ebx
 448:	05 05 74 05 0c       	add    eax,0xc057405
 44d:	59                   	pop    ecx
 44e:	05 26 68 05 11       	add    eax,0x11056826
 453:	f2 05 10 08 12 05    	repnz add eax,0x5120810
 459:	11 4b 05             	adc    DWORD PTR [ebx+0x5],ecx
 45c:	0d 02 36 16 05       	or     eax,0x5163602
 461:	45                   	inc    ebp
 462:	00 02                	add    BYTE PTR [edx],al
 464:	04 02                	add    al,0x2
 466:	03 78 02             	add    edi,DWORD PTR [eax+0x2]
 469:	34 01                	xor    al,0x1
 46b:	05 05 00 02 04       	add    eax,0x4020005
 470:	01 4a 05             	add    DWORD PTR [edx+0x5],ecx
 473:	01 03                	add    DWORD PTR [ebx],eax
 475:	0b 9e 77 05 0f 08    	or     ebx,DWORD PTR [esi+0x80f0577]
 47b:	59                   	pop    ecx
 47c:	05 05 08 2f 02       	add    eax,0x22f0805
 481:	26 13 05 01 d7 69 08 	adc    eax,DWORD PTR es:0x869d701
 488:	90                   	nop
 489:	05 14 4c 05 09       	add    eax,0x9054c14
 48e:	08 bd 05 05 75 05    	or     BYTE PTR [ebp+0x5750505],bh
 494:	09 3c 05 0e 02 79 14 	or     DWORD PTR [eax*1+0x1479020e],edi
 49b:	05 05 74 05 12       	add    eax,0x12057405
 4a0:	00 02                	add    BYTE PTR [edx],al
 4a2:	04 03                	add    al,0x3
 4a4:	2f                   	das    
 4a5:	05 20 00 02 04       	add    eax,0x4020020
 4aa:	03 b9 05 05 00 02    	add    edi,DWORD PTR [ecx+0x2000505]
 4b0:	04 01                	add    al,0x1
 4b2:	4a                   	dec    edx
 4b3:	05 0e 85 05 05       	add    eax,0x505850e
 4b8:	74 05                	je     4bf <cmdClearScreen-0x30ffb41>
 4ba:	11 2f                	adc    DWORD PTR [edi],ebp
 4bc:	05 0c 90 05 0d       	add    eax,0xd05900c
 4c1:	59                   	pop    ecx
 4c2:	05 20 00 02 04       	add    eax,0x4020020
 4c7:	02 08                	add    cl,BYTE PTR [eax]
 4c9:	1e                   	push   ds
 4ca:	05 05 00 02 04       	add    eax,0x4020005
 4cf:	01 4a 05             	add    DWORD PTR [edx+0x5],ecx
 4d2:	12 86 05 08 74 05    	adc    al,BYTE PTR [esi+0x5740805]
 4d8:	09 4c 05 0b          	or     DWORD PTR [ebp+eax*1+0xb],ecx
 4dc:	08 5c 05 05          	or     BYTE PTR [ebp+eax*1+0x5],bl
 4e0:	08 58 05             	or     BYTE PTR [eax+0x5],bl
 4e3:	01 d7                	add    edi,edx
 4e5:	77 05                	ja     4ec <cmdClearScreen-0x30ffb14>
 4e7:	05 08 4b 05 01       	add    eax,0x1054b08
 4ec:	75 77                	jne    565 <cmdClearScreen-0x30ffa9b>
 4ee:	05 0a 08 5b 05       	add    eax,0x55b080a
 4f3:	09 08                	or     DWORD PTR [eax],ecx
 4f5:	30 05 08 08 2e 05    	xor    BYTE PTR ds:0x52e0808,al
 4fb:	09 4b 05             	or     DWORD PTR [ebx+0x5],ecx
 4fe:	01 d9                	add    ecx,ebx
 500:	05 09 2d 05 01       	add    eax,0x1052d09
 505:	08 4b 02             	or     BYTE PTR [ebx+0x2],cl
 508:	06                   	push   es
 509:	00 01                	add    BYTE PTR [ecx],al
 50b:	01 c8                	add    eax,ecx
 50d:	06                   	push   es
 50e:	00 00                	add    BYTE PTR [eax],al
 510:	03 00                	add    eax,DWORD PTR [eax]
 512:	e3 00                	jecxz  514 <cmdClearScreen-0x30ffaec>
 514:	00 00                	add    BYTE PTR [eax],al
 516:	01 01                	add    DWORD PTR [ecx],eax
 518:	fb                   	sti    
 519:	0e                   	push   cs
 51a:	0d 00 01 01 01       	or     eax,0x1010100
 51f:	01 00                	add    DWORD PTR [eax],eax
 521:	00 00                	add    BYTE PTR [eax],al
 523:	01 00                	add    DWORD PTR [eax],eax
 525:	00 01                	add    BYTE PTR [ecx],al
 527:	73 72                	jae    59b <cmdClearScreen-0x30ffa65>
 529:	63 00                	arpl   WORD PTR [eax],ax
 52b:	2f                   	das    
 52c:	75 73                	jne    5a1 <cmdClearScreen-0x30ffa5f>
 52e:	72 2f                	jb     55f <cmdClearScreen-0x30ffaa1>
 530:	6c                   	ins    BYTE PTR es:[edi],dx
 531:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
 538:	69 36 38 36 2d 6c    	imul   esi,DWORD PTR [esi],0x6c2d3638
 53e:	69 6e 75 78 2d 67 6e 	imul   ebp,DWORD PTR [esi+0x75],0x6e672d78
 545:	75 2f                	jne    576 <cmdClearScreen-0x30ffa8a>
 547:	39 2f                	cmp    DWORD PTR [edi],ebp
 549:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 550:	00 2e                	add    BYTE PTR [esi],ch
 552:	2e 2f                	cs das 
 554:	6c                   	ins    BYTE PTR es:[edi],dx
 555:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 55c:	4f                   	dec    edi
 55d:	53                   	push   ebx
 55e:	2f                   	das    
 55f:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 566:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 569:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 56d:	65 2f                	gs das 
 56f:	2e 2e 2f             	cs cs das 
 572:	2e 2e 2f             	cs cs das 
 575:	2e 2e 2f             	cs cs das 
 578:	6b 70 72 6f          	imul   esi,DWORD PTR [eax+0x72],0x6f
 57c:	6a 2f                	push   0x2f
 57e:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 581:	69 73 4f 53 4b 65 72 	imul   esi,DWORD PTR [ebx+0x4f],0x72654b53
 588:	6e                   	outs   dx,BYTE PTR ds:[esi]
 589:	65 6c                	gs ins BYTE PTR es:[edi],dx
 58b:	2f                   	das    
 58c:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
 593:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
 596:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
 59a:	65 00 00             	add    BYTE PTR gs:[eax],al
 59d:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 5a1:	6c                   	ins    BYTE PTR es:[edi],dx
 5a2:	6c                   	ins    BYTE PTR es:[edi],dx
 5a3:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 5a6:	01 00                	add    DWORD PTR [eax],eax
 5a8:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 5ab:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
 5b2:	63 
 5b3:	2e 68 00 02 00 00    	cs push 0x200
 5b9:	66 69 6c 65 2e 68 00 	imul   bp,WORD PTR [ebp+eiz*2+0x2e],0x68
 5c0:	03 00                	add    eax,DWORD PTR [eax]
 5c2:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 5c5:	6d                   	ins    DWORD PTR es:[edi],dx
 5c6:	6d                   	ins    DWORD PTR es:[edi],dx
 5c7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5c8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5c9:	2e 68 00 03 00 00    	cs push 0x300
 5cf:	73 69                	jae    63a <cmdClearScreen-0x30ff9c6>
 5d1:	67 6e                	outs   dx,BYTE PTR ds:[si]
 5d3:	61                   	popa   
 5d4:	6c                   	ins    BYTE PTR es:[edi],dx
 5d5:	73 2e                	jae    605 <cmdClearScreen-0x30ff9fb>
 5d7:	68 00 04 00 00       	push   0x400
 5dc:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 5e0:	6c                   	ins    BYTE PTR es:[edi],dx
 5e1:	6c                   	ins    BYTE PTR es:[edi],dx
 5e2:	2e 68 00 05 00 00    	cs push 0x500
 5e8:	74 68                	je     652 <cmdClearScreen-0x30ff9ae>
 5ea:	65 73 69             	gs jae 656 <cmdClearScreen-0x30ff9aa>
 5ed:	67 6e                	outs   dx,BYTE PTR ds:[si]
 5ef:	61                   	popa   
 5f0:	6c                   	ins    BYTE PTR es:[edi],dx
 5f1:	73 2e                	jae    621 <cmdClearScreen-0x30ff9df>
 5f3:	68 00 04 00 00       	push   0x400
 5f8:	00 05 01 00 05 02    	add    BYTE PTR ds:0x2050001,al
 5fe:	af                   	scas   eax,DWORD PTR es:[edi]
 5ff:	0f 10 03             	movups xmm0,XMMWORD PTR [ebx]
 602:	03 19                	add    ebx,DWORD PTR [ecx]
 604:	01 08                	add    DWORD PTR [eax],ecx
 606:	14 3f                	adc    al,0x3f
 608:	05 0c 08 3d 05       	add    eax,0x53d080c
 60d:	0b 68 05             	or     ebp,DWORD PTR [eax+0x5]
 610:	09 30                	or     DWORD PTR [eax],esi
 612:	05 0e 08 13 05       	add    eax,0x513080e
 617:	0c 47                	or     al,0x47
 619:	05 0b 58 05 01       	add    eax,0x105580b
 61e:	4f                   	dec    edi
 61f:	4e                   	dec    esi
 620:	05 0a 08 75 05       	add    eax,0x575080a
 625:	0b a0 05 09 67 05    	or     esp,DWORD PTR [eax+0x5670905]
 62b:	0a 76 05             	or     dh,BYTE PTR [esi+0x5]
 62e:	0b 4b 05             	or     ecx,DWORD PTR [ebx+0x5]
 631:	05 68 05 0a 08       	add    eax,0x80a0568
 636:	a0 05 0d 6b 05       	mov    al,ds:0x56b0d05
 63b:	0c 66                	or     al,0x66
 63d:	05 1c 00 02 04       	add    eax,0x402001c
 642:	01 4a 05             	add    DWORD PTR [edx+0x5],ecx
 645:	19 00                	sbb    DWORD PTR [eax],eax
 647:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 64a:	66 05 2b 00          	add    ax,0x2b
 64e:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
 651:	4a                   	dec    edx
 652:	05 28 00 02 04       	add    eax,0x4020028
 657:	02 66 05             	add    ah,BYTE PTR [esi+0x5]
 65a:	3b 84 05 15 08 4a 05 	cmp    eax,DWORD PTR [ebp+eax*1+0x54a0815]
 661:	3b 08                	cmp    ecx,DWORD PTR [eax]
 663:	12 05 1d 2e 05 11    	adc    al,BYTE PTR ds:0x11052e1d
 669:	30 05 10 66 05 35    	xor    BYTE PTR ds:0x35056610,al
 66f:	4b                   	dec    ebx
 670:	05 45 3c 05 44       	add    eax,0x44053c45
 675:	3c 05                	cmp    al,0x5
 677:	11 4a 05             	adc    DWORD PTR [edx+0x5],ecx
 67a:	21 3c 05 28 82 05 21 	and    DWORD PTR [eax*1+0x21058228],edi
 681:	e4 05                	in     al,0x5
 683:	11 58 05             	adc    DWORD PTR [eax+0x5],ebx
 686:	35 08 3e 05 45       	xor    eax,0x45053e08
 68b:	3c 05                	cmp    al,0x5
 68d:	11 3c 05 21 4a 05 28 	adc    DWORD PTR [eax*1+0x28054a21],edi
 694:	82 05 21 e4 05 11 58 	add    BYTE PTR ds:0x1105e421,0x58
 69b:	08 21                	or     BYTE PTR [ecx],ah
 69d:	05 10 66 05 15       	add    eax,0x15056610
 6a2:	4c                   	dec    esp
 6a3:	05 0e 92 05 0c       	add    eax,0xc05920e
 6a8:	03 74 4a 05          	add    esi,DWORD PTR [edx+ecx*2+0x5]
 6ac:	11 03                	adc    DWORD PTR [ebx],eax
 6ae:	09 58 05             	or     DWORD PTR [eax+0x5],ebx
 6b1:	0c 26                	or     al,0x26
 6b3:	05 01 83 85 05       	add    eax,0x5858301
 6b8:	05 08 67 05 0d       	add    eax,0xd056708
 6bd:	d7                   	xlat   BYTE PTR ds:[ebx]
 6be:	05 07 08 14 05       	add    eax,0x5140807
 6c3:	0a a0 05 23 4c 05    	or     ah,BYTE PTR [eax+0x54c2305]
 6c9:	1a 08                	sbb    cl,BYTE PTR [eax]
 6cb:	20 05 25 83 05 1c    	and    BYTE PTR ds:0x1c058325,al
 6d1:	08 20                	or     BYTE PTR [eax],ah
 6d3:	05 14 83 05 0c       	add    eax,0xc058314
 6d8:	f2 05 0d 4b 05 01    	repnz add eax,0x1054b0d
 6de:	03 0b                	add    ecx,DWORD PTR [ebx]
 6e0:	9e                   	sahf   
 6e1:	05 0d 03 78 2e       	add    eax,0x2e78030d
 6e6:	05 38 82 05 2a       	add    eax,0x2a058238
 6eb:	f2 05 29 ba 05 0d    	repnz add eax,0xd05ba29
 6f1:	3c 05                	cmp    al,0x5
 6f3:	01 de                	add    esi,ebx
 6f5:	05 09 2c 05 01       	add    eax,0x1052c09
 6fa:	d8 05 05 85 05 09    	fadd   DWORD PTR ds:0x9058505
 700:	08 67 05             	or     BYTE PTR [edi+0x5],ah
 703:	0d 74 05 09 75       	or     eax,0x75090574
 708:	05 13 74 05 0a       	add    eax,0xa057413
 70d:	75 05                	jne    714 <cmdClearScreen-0x30ff8ec>
 70f:	05 4c 05 13 08       	add    eax,0x813054c
 714:	3e 05 05 74 05 13    	ds add eax,0x13057405
 71a:	5a                   	pop    edx
 71b:	05 0b ac 05 11       	add    eax,0x1105ac0b
 720:	4c                   	dec    esp
 721:	05 10 74 05 2a       	add    eax,0x2a057410
 726:	4c                   	dec    esp
 727:	05 17 94 05 1d       	add    eax,0x1d059417
 72c:	c8 05 13 83          	enter  0x1305,0x83
 730:	05 17 74 05 21       	add    eax,0x21057417
 735:	4a                   	dec    edx
 736:	05 2a 4b 05 1c       	add    eax,0x1c054b2a
 73b:	93                   	xchg   ebx,eax
 73c:	05 11 ac 05 31       	add    eax,0x3105ac11
 741:	00 02                	add    BYTE PTR [edx],al
 743:	04 02                	add    al,0x2
 745:	4a                   	dec    edx
 746:	05 27 00 02 04       	add    eax,0x4020027
 74b:	02 ac 05 47 00 02 04 	add    ch,BYTE PTR [ebp+eax*1+0x4020047]
 752:	04 4a                	add    al,0x4a
 754:	05 3d 00 02 04       	add    eax,0x402003d
 759:	04 ac                	add    al,0xac
 75b:	05 56 00 02 04       	add    eax,0x4020056
 760:	05 4a 05 53 00       	add    eax,0x53054a
 765:	02 04 05 74 05 18 4d 	add    al,BYTE PTR [eax*1+0x4d180574]
 76c:	05 10 ac 05 2d       	add    eax,0x2d05ac10
 771:	00 02                	add    BYTE PTR [edx],al
 773:	04 01                	add    al,0x1
 775:	4a                   	dec    edx
 776:	05 23 00 02 04       	add    eax,0x4020023
 77b:	01 ac 05 27 4b 05 17 	add    DWORD PTR [ebp+eax*1+0x17054b27],ebp
 782:	90                   	nop
 783:	05 1c d6 05 27       	add    eax,0x2705d61c
 788:	90                   	nop
 789:	05 1f 3c 05 13       	add    eax,0x13053c1f
 78e:	3d 05 19 c8 05       	cmp    eax,0x5c81905
 793:	10 83 05 13 67 05    	adc    BYTE PTR [ebx+0x5671305],al
 799:	17                   	pop    ss
 79a:	74 05                	je     7a1 <cmdClearScreen-0x30ff85f>
 79c:	21 4a 05             	and    DWORD PTR [edx+0x5],ecx
 79f:	10 49 05             	adc    BYTE PTR [ecx+0x5],cl
 7a2:	23 34 05 13 90 05 18 	and    esi,DWORD PTR [eax*1+0x18059013]
 7a9:	d6                   	(bad)  
 7aa:	05 23 90 05 1b       	add    eax,0x1b059023
 7af:	3c 05                	cmp    al,0x5
 7b1:	14 00                	adc    al,0x0
 7b3:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
 7b6:	3e 05 30 00 02 04    	ds add eax,0x4020030
 7bc:	02 03                	add    al,BYTE PTR [ebx]
 7be:	63 4a 05             	arpl   WORD PTR [edx+0x5],cx
 7c1:	1d 00 02 04 01       	sbb    eax,0x1040200
 7c6:	4a                   	dec    edx
 7c7:	05 05 00 02 04       	add    eax,0x4020005
 7cc:	01 d6                	add    esi,edx
 7ce:	05 08 03 1f 90       	add    eax,0x901f0308
 7d3:	05 10 68 05 0f       	add    eax,0xf056810
 7d8:	4b                   	dec    ebx
 7d9:	05 15 c8 05 0c       	add    eax,0xc05c815
 7de:	87 05 01 3d 77 05    	xchg   DWORD PTR ds:0x5773d01,eax
 7e4:	0b 08                	or     ecx,DWORD PTR [eax]
 7e6:	5c                   	pop    esp
 7e7:	05 05 74 05 3b       	add    eax,0x3b057405
 7ec:	30 05 0f f2 05 27    	xor    BYTE PTR ds:0x2705f20f,al
 7f2:	ba 05 0f f2 05       	mov    edx,0x5f20f05
 7f7:	0b 08                	or     ecx,DWORD PTR [eax]
 7f9:	30 05 15 69 05 29    	xor    BYTE PTR ds:0x29056915,al
 7ff:	00 02                	add    BYTE PTR [edx],al
 801:	04 02                	add    al,0x2
 803:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 806:	05 05 00 02 04       	add    eax,0x4020005
 80b:	01 4a 05             	add    DWORD PTR [edx+0x5],ecx
 80e:	14 03                	adc    al,0x3
 810:	0b 66 05             	or     esp,DWORD PTR [esi+0x5]
 813:	01 59 5c             	add    DWORD PTR [ecx+0x5c],ebx
 816:	05 07 08 5b 75       	add    eax,0x755b0807
 81b:	75 75                	jne    892 <cmdClearScreen-0x30ff76e>
 81d:	75 05                	jne    824 <cmdClearScreen-0x30ff7dc>
 81f:	0a 75 05             	or     dh,BYTE PTR [ebp+0x5]
 822:	06                   	push   es
 823:	78 05                	js     82a <cmdClearScreen-0x30ff7d6>
 825:	22 a1 05 1a d6 05    	and    ah,BYTE PTR [ecx+0x5d61a05]
 82b:	07                   	pop    es
 82c:	08 28                	or     BYTE PTR [eax],ch
 82e:	05 2c 00 02 04       	add    eax,0x402002c
 833:	01 66 05             	add    DWORD PTR [esi+0x5],esp
 836:	17                   	pop    ss
 837:	00 02                	add    BYTE PTR [edx],al
 839:	04 01                	add    al,0x1
 83b:	66 05 0b 5b          	add    ax,0x5b0b
 83f:	05 0d 68 05 17       	add    eax,0x1705680d
 844:	75 05                	jne    84b <cmdClearScreen-0x30ff7b5>
 846:	0d 08 4c 05 0c       	or     eax,0xc054c08
 84b:	67 05 13 e4 05 08    	addr16 add eax,0x805e413
 851:	69 05 0a 67 05 0d 5a 	imul   eax,DWORD PTR ds:0xd05670a,0x660b055a
 858:	05 0b 66 
 85b:	05 1a 00 02 04       	add    eax,0x402001a
 860:	01 4a 05             	add    DWORD PTR [edx+0x5],ecx
 863:	25 00 02 04 02       	and    eax,0x2040200
 868:	66 05 30 00          	add    ax,0x30
 86c:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 86f:	66 05 08 a4          	add    ax,0xa408
 873:	05 11 68 05 0d       	add    eax,0xd056811
 878:	75 05                	jne    87f <cmdClearScreen-0x30ff781>
 87a:	12 90 05 10 66 05    	adc    dl,BYTE PTR [eax+0x5661005]
 880:	0e                   	push   cs
 881:	76 05                	jbe    888 <cmdClearScreen-0x30ff778>
 883:	0d 66 05 11 4c       	or     eax,0x4c110566
 888:	05 0d bc 68 05       	add    eax,0x568bc0d
 88d:	0c 66                	or     al,0x66
 88f:	05 0d 4c 05 0a       	add    eax,0xa054c0d
 894:	94                   	xchg   esp,eax
 895:	05 0f 90 05 0d       	add    eax,0xd05900f
 89a:	66 4d                	dec    bp
 89c:	68 05 0c 66 05       	push   0x5660c05
 8a1:	0d 4c 05 0a 94       	or     eax,0x940a054c
 8a6:	05 0f 90 05 0d       	add    eax,0xd05900f
 8ab:	66 4f                	dec    di
 8ad:	05 0c 66 05 0d       	add    eax,0xd05660c
 8b2:	4c                   	dec    esp
 8b3:	05 12 92 05 11       	add    eax,0x11059212
 8b8:	66 05 0d 4c          	add    ax,0x4c0d
 8bc:	05 0a 94 05 0f       	add    eax,0xf05940a
 8c1:	90                   	nop
 8c2:	05 0d 66 05 0a       	add    eax,0xa05660d
 8c7:	32 05 0b 03 49 4a    	xor    al,BYTE PTR ds:0x4a49030b
 8cd:	05 0a 66 05 09       	add    eax,0x905660a
 8d2:	03 3a                	add    edi,DWORD PTR [edx]
 8d4:	82 05 16 68 05 0e 66 	add    BYTE PTR ds:0xe056816,0x66
 8db:	05 1f 84 05 18       	add    eax,0x1805841f
 8e0:	d6                   	(bad)  
 8e1:	05 0d 08 23 08       	add    eax,0x823080d
 8e6:	13 05 28 d7 05 20    	adc    eax,DWORD PTR ds:0x2005d728
 8ec:	d6                   	(bad)  
 8ed:	05 11 08 21 05       	add    eax,0x5210811
 8f2:	18 e4                	sbb    ah,ah
 8f4:	05 11 5a 4b 05       	add    eax,0x54b5a11
 8f9:	18 e4                	sbb    ah,ah
 8fb:	05 12 67 05 0d       	add    eax,0xd056712
 900:	4b                   	dec    ebx
 901:	05 0e d9 05 07       	add    eax,0x705d90e
 906:	66 05 03 85          	add    ax,0x8503
 90a:	d7                   	xlat   BYTE PTR ds:[ebx]
 90b:	05 0a d7 05 01       	add    eax,0x105d70a
 910:	3d 5b 05 0e 08       	cmp    eax,0x80e055b
 915:	67 05 05 74 05 0d    	addr16 add eax,0xd057405
 91b:	00 02                	add    BYTE PTR [edx],al
 91d:	04 03                	add    al,0x3
 91f:	30 05 13 00 02 04    	xor    BYTE PTR ds:0x4020013,al
 925:	03 f2                	add    esi,edx
 927:	05 12 00 02 04       	add    eax,0x4020012
 92c:	03 f2                	add    esi,edx
 92e:	05 21 00 02 04       	add    eax,0x4020021
 933:	03 2f                	add    ebp,DWORD PTR [edi]
 935:	05 1a 00 02 04       	add    eax,0x402001a
 93a:	03 82 05 14 00 02    	add    eax,DWORD PTR [edx+0x2001405]
 940:	04 03                	add    al,0x3
 942:	58                   	pop    eax
 943:	05 09 00 02 04       	add    eax,0x4020009
 948:	03 e4                	add    esp,esp
 94a:	05 22 00 02 04       	add    eax,0x4020022
 94f:	03 08                	add    ecx,DWORD PTR [eax]
 951:	39 05 05 00 02 04    	cmp    DWORD PTR ds:0x4020005,eax
 957:	01 4a 05             	add    DWORD PTR [edx+0x5],ecx
 95a:	0c 87                	or     al,0x87
 95c:	05 01 3d 77 05       	add    eax,0x5773d01
 961:	0e                   	push   cs
 962:	08 59 05             	or     BYTE PTR [ecx+0x5],bl
 965:	05 74 05 09 00       	add    eax,0x90574
 96a:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 96d:	2f                   	das    
 96e:	05 22 00 02 04       	add    eax,0x4020022
 973:	03 ff                	add    edi,edi
 975:	05 05 00 02 04       	add    eax,0x4020005
 97a:	01 4a 84             	add    DWORD PTR [edx-0x7c],ecx
 97d:	05 01 d7 03 0b       	add    eax,0xb03d701
 982:	66 05 2c 08          	add    ax,0x82c
 986:	4b                   	dec    ebx
 987:	05 1a e4 05 05       	add    eax,0x505e41a
 98c:	c8 05 01 08          	enter  0x105,0x8
 990:	13 69 05             	adc    ebp,DWORD PTR [ecx+0x5]
 993:	05 08 4b 05 01       	add    eax,0x1054b08
 998:	08 9f 69 05 05 08    	or     BYTE PTR [edi+0x8050569],bl
 99e:	59                   	pop    ecx
 99f:	59                   	pop    ecx
 9a0:	59                   	pop    ecx
 9a1:	05 01 08 4c 69       	add    eax,0x694c0801
 9a6:	05 05 08 13 05       	add    eax,0x5130805
 9ab:	1d 69 05 0d 91       	sbb    eax,0x910d0569
 9b0:	05 01 22 3f 05       	add    eax,0x53f2201
 9b5:	05 08 13 05 1d       	add    eax,0x1d051308
 9ba:	6a 05                	push   0x5
 9bc:	14 91                	adc    al,0x91
 9be:	05 0c 77 05 01       	add    eax,0x105770c
 9c3:	59                   	pop    ecx
 9c4:	31 05 11 08 59 bb    	xor    DWORD PTR ds:0xbb590811,eax
 9ca:	05 10 c9 05 0e       	add    eax,0xe05c910
 9cf:	f2 05 15 83 05 0e    	repnz add eax,0xe058315
 9d5:	91                   	xchg   ecx,eax
 9d6:	05 10 bb 05 05       	add    eax,0x505bb10
 9db:	91                   	xchg   ecx,eax
 9dc:	05 18 08 83 05       	add    eax,0x5830818
 9e1:	17                   	pop    ss
 9e2:	f2 05 05 83 08 9f    	repnz add eax,0x9f088305
 9e8:	08 a0 08 5a 08 2f    	or     BYTE PTR [eax+0x2f085a08],ah
 9ee:	05 13 08 5b 05       	add    eax,0x55b0813
 9f3:	12 08                	adc    cl,BYTE PTR [eax]
 9f5:	82 05 01 5b 69 05 0d 	add    BYTE PTR ds:0x5695b01,0xd
 9fc:	08 59 05             	or     BYTE PTR [ecx+0x5],bl
 9ff:	09 4b 75             	or     DWORD PTR [ebx+0x75],ecx
 a02:	05 0a 76 75 05       	add    eax,0x575760a
 a07:	0e                   	push   cs
 a08:	76 05                	jbe    a0f <cmdClearScreen-0x30ff5f1>
 a0a:	08 91 05 1c 68 05    	or     BYTE PTR [ecx+0x5681c05],dl
 a10:	13 66 05             	adc    esp,DWORD PTR [esi+0x5]
 a13:	0c 08                	or     al,0x8
 a15:	75 05                	jne    a1c <cmdClearScreen-0x30ff5e4>
 a17:	35 68 05 0d 66       	xor    eax,0x660d0568
 a1c:	05 14 08 4b 05       	add    eax,0x54b0814
 a21:	12 a0 05 14 93 05    	adc    ah,BYTE PTR [eax+0x5931405]
 a27:	0f ad 05 05 4b 05 0b 	shrd   DWORD PTR ds:0xb054b05,eax,cl
 a2e:	e6 05                	out    0x5,al
 a30:	01 5a 05             	add    DWORD PTR [edx+0x5],ebx
 a33:	1b 59 05             	sbb    ebx,DWORD PTR [ecx+0x5]
 a36:	25 bb 05 11 75       	and    eax,0x751105bb
 a3b:	05 16 4b 05 09       	add    eax,0x9054b16
 a40:	75 08                	jne    a4a <cmdClearScreen-0x30ff5b6>
 a42:	83 05 0d 08 83 05 0c 	add    DWORD PTR ds:0x583080d,0xc
 a49:	3c 05                	cmp    al,0x5
 a4b:	0d 4b 05 01 75       	or     eax,0x7501054b
 a50:	05 11 21 05 0e       	add    eax,0xe052111
 a55:	4b                   	dec    ebx
 a56:	05 11 5a 75 05       	add    eax,0x5755a11
 a5b:	10 3c 05 1a 4c 05 18 	adc    BYTE PTR [eax*1+0x18054c1a],bh
 a62:	91                   	xchg   ecx,eax
 a63:	05 14 08 67 05       	add    eax,0x5670814
 a68:	15 68 05 1d e5       	adc    eax,0xe51d0568
 a6d:	05 1e 75 05 15       	add    eax,0x1505751e
 a72:	91                   	xchg   ecx,eax
 a73:	05 1c 59 05 18       	add    eax,0x1805591c
 a78:	08 79 05             	or     BYTE PTR [ecx+0x5],bh
 a7b:	10 08                	adc    BYTE PTR [eax],cl
 a7d:	59                   	pop    ecx
 a7e:	05 1b 68 05 11       	add    eax,0x1105681b
 a83:	91                   	xchg   ecx,eax
 a84:	30 05 10 90 05 15    	xor    BYTE PTR ds:0x15059010,al
 a8a:	4c                   	dec    esp
 a8b:	05 14 c8 05 21       	add    eax,0x2105c814
 a90:	5a                   	pop    edx
 a91:	05 23 91 05 19       	add    eax,0x19059123
 a96:	75 05                	jne    a9d <cmdClearScreen-0x30ff563>
 a98:	18 90 05 19 4c 08    	sbb    BYTE PTR [eax+0x84c1905],dl
 a9e:	21 05 17 03 5f 58    	and    DWORD PTR ds:0x585f0317,eax
 aa4:	05 0e 4a 05 24       	add    eax,0x24054a0e
 aa9:	03 27                	add    esp,DWORD PTR [edi]
 aab:	82 05 0b 4a 05 22 84 	add    BYTE PTR ds:0x22054a0b,0x84
 ab2:	05 10 66 05 28       	add    eax,0x28056610
 ab7:	85 05 14 66 05 34    	test   DWORD PTR ds:0x34056614,eax
 abd:	84 05 15 90 05 34    	test   BYTE PTR ds:0x34059015,al
 ac3:	66 05 33 66          	add    ax,0x6633
 ac7:	05 15 c8 05 30       	add    eax,0x3005c815
 acc:	08 2f                	or     BYTE PTR [edi],ch
 ace:	05 1b 91 05 19       	add    eax,0x1905911b
 ad3:	30 05 26 08 21 05    	xor    BYTE PTR ds:0x5210826,al
 ad9:	1b 47 05             	sbb    eax,DWORD PTR [edi+0x5]
 adc:	15 6b 05 23 08       	adc    eax,0x823056b
 ae1:	83 05 22 08 20 05 11 	add    DWORD PTR ds:0x5200822,0x11
 ae8:	3e 05 1a 5d 05 11    	ds add eax,0x11055d1a
 aee:	4a                   	dec    edx
 aef:	05 22 84 05 10       	add    eax,0x10058422
 af4:	66 05 26 85          	add    ax,0x8526
 af8:	05 28 90 05 14       	add    eax,0x14059028
 afd:	66 05 34 84          	add    ax,0x8434
 b01:	05 15 90 05 34       	add    eax,0x34059015
 b06:	66 05 33 66          	add    ax,0x6633
 b0a:	05 15 c8 05 30       	add    eax,0x3005c815
 b0f:	08 2f                	or     BYTE PTR [edi],ch
 b11:	05 1b 91 05 19       	add    eax,0x1905911b
 b16:	30 05 26 08 21 05    	xor    BYTE PTR ds:0x5210826,al
 b1c:	1b 47 05             	sbb    eax,DWORD PTR [edi+0x5]
 b1f:	15 6b 05 23 08       	adc    eax,0x823056b
 b24:	83 05 22 08 20 05 11 	add    DWORD PTR ds:0x5200822,0x11
 b2b:	3e 05 1a 5d 05 11    	ds add eax,0x11055d1a
 b31:	4a                   	dec    edx
 b32:	05 10 4c 05 11       	add    eax,0x11054c10
 b37:	a0 05 0d 08 23       	mov    al,ds:0x23080d05
 b3c:	05 1a 5a 05 11       	add    eax,0x11055a1a
 b41:	4a                   	dec    edx
 b42:	05 0d 4c 05 1a       	add    eax,0x1a054c0d
 b47:	08 68 05             	or     BYTE PTR [eax+0x5],ch
 b4a:	11 4a 05             	adc    DWORD PTR [edx+0x5],ecx
 b4d:	10 4c 05 1e          	adc    BYTE PTR [ebp+eax*1+0x1e],cl
 b51:	a0 05 28 4b 05       	mov    al,ds:0x54b2805
 b56:	11 d7                	adc    edi,edx
 b58:	05 1a 08 69 05       	add    eax,0x569081a
 b5d:	11 4a 4c             	adc    DWORD PTR [edx+0x4c],ecx
 b60:	05 10 90 05 11       	add    eax,0x11059010
 b65:	4b                   	dec    ebx
 b66:	05 0d 08 21 05       	add    eax,0x521080d
 b6b:	1a 30                	sbb    dh,BYTE PTR [eax]
 b6d:	05 11 4a 05 18       	add    eax,0x18054a11
 b72:	4c                   	dec    esp
 b73:	05 0d 91 05 26       	add    eax,0x2605910d
 b78:	32 05 23 4a 05 26    	xor    al,BYTE PTR ds:0x26054a23
 b7e:	90                   	nop
 b7f:	05 11 92 05 10       	add    eax,0x10059211
 b84:	90                   	nop
 b85:	05 11 4b 05 28       	add    eax,0x28054b11
 b8a:	08 92 05 09 76 05    	or     BYTE PTR [edx+0x5760905],dl
 b90:	0d 03 70 58 05       	or     eax,0x5587003
 b95:	15 03 13 20 05       	adc    eax,0x5201303
 b9a:	0c 90                	or     al,0x90
 b9c:	05 10 4c 05 11       	add    eax,0x11054c10
 ba1:	67 05 15 08 21 05    	addr16 add eax,0x5210815
 ba7:	0d 08 4b 05 0c       	or     eax,0xc054b08
 bac:	03 ee                	add    ebp,esi
 bae:	7e 08                	jle    bb8 <cmdClearScreen-0x30ff448>
 bb0:	c8 05 0b ba          	enter  0xb05,0xba
 bb4:	05 05 03 95 01       	add    eax,0x1950305
 bb9:	82 05 08 08 3d 05 09 	add    BYTE PTR ds:0x53d0808,0x9
 bc0:	67 d7                	xlat   BYTE PTR ds:[bx]
 bc2:	05 08 82 05 09       	add    eax,0x9058208
 bc7:	4b                   	dec    ebx
 bc8:	05 0c 08 3d 05       	add    eax,0x53d080c
 bcd:	01 00                	add    DWORD PTR [eax],eax
 bcf:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 bd2:	83 02 05             	add    DWORD PTR [edx],0x5
 bd5:	00 01                	add    BYTE PTR [ecx],al
 bd7:	01                   	.byte 0x1

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
  53:	64 50                	fs push eax
  55:	72 69                	jb     c0 <cmdClearScreen-0x30fff40>
  57:	6e                   	outs   dx,BYTE PTR ds:[esi]
  58:	74 45                	je     9f <cmdClearScreen-0x30fff61>
  5a:	6e                   	outs   dx,BYTE PTR ds:[esi]
  5b:	76 00                	jbe    5d <cmdClearScreen-0x30fffa3>
  5d:	72 65                	jb     c4 <cmdClearScreen-0x30fff3c>
  5f:	61                   	popa   
  60:	6c                   	ins    BYTE PTR es:[edi],dx
  61:	43                   	inc    ebx
  62:	6d                   	ins    DWORD PTR es:[edi],dx
  63:	64 6c                	fs ins BYTE PTR es:[edi],dx
  65:	69 6e 65 00 64 65 73 	imul   ebp,DWORD PTR [esi+0x65],0x73656400
  6c:	63 72 69             	arpl   WORD PTR [edx+0x69],si
  6f:	70 74                	jo     e5 <cmdClearScreen-0x30fff1b>
  71:	69 6f 6e 00 6e 65 77 	imul   ebp,DWORD PTR [edi+0x6e],0x77656e00
  78:	43                   	inc    ebx
  79:	6d                   	ins    DWORD PTR es:[edi],dx
  7a:	64 4c                	fs dec esp
  7c:	69 6e 65 00 63 6d 64 	imul   ebp,DWORD PTR [esi+0x65],0x646d6300
  83:	45                   	inc    ebp
  84:	78 65                	js     eb <cmdClearScreen-0x30fff15>
  86:	63 70 00             	arpl   WORD PTR [eax+0x0],si
  89:	4e                   	dec    esi
  8a:	4f                   	dec    edi
  8b:	5f                   	pop    edi
  8c:	50                   	push   eax
  8d:	52                   	push   edx
  8e:	45                   	inc    ebp
  8f:	56                   	push   esi
  90:	00 53 49             	add    BYTE PTR [ebx+0x49],dl
  93:	47                   	inc    edi
  94:	53                   	push   ebx
  95:	54                   	push   esp
  96:	4f                   	dec    edi
  97:	50                   	push   eax
  98:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
  9b:	63 2f                	arpl   WORD PTR [edi],bp
  9d:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  a0:	6d                   	ins    DWORD PTR es:[edi],dx
  a1:	61                   	popa   
  a2:	6e                   	outs   dx,BYTE PTR ds:[esi]
  a3:	64 73 2e             	fs jae d4 <cmdClearScreen-0x30fff2c>
  a6:	63 00                	arpl   WORD PTR [eax],ax
  a8:	53                   	push   ebx
  a9:	49                   	dec    ecx
  aa:	47                   	inc    edi
  ab:	55                   	push   ebp
  ac:	53                   	push   ebx
  ad:	4c                   	dec    esp
  ae:	45                   	inc    ebp
  af:	45                   	inc    ebp
  b0:	50                   	push   eax
  b1:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
  b4:	64 50                	fs push eax
  b6:	77 64                	ja     11c <cmdClearScreen-0x30ffee4>
  b8:	00 73 4b             	add    BYTE PTR [ebx+0x4b],dh
  bb:	53                   	push   ebx
  bc:	68 65 6c 6c 50       	push   0x506c6c65
  c1:	72 6f                	jb     132 <cmdClearScreen-0x30ffece>
  c3:	67 72 61             	addr16 jb 127 <cmdClearScreen-0x30ffed9>
  c6:	6d                   	ins    DWORD PTR es:[edi],dx
  c7:	4e                   	dec    esi
  c8:	61                   	popa   
  c9:	6d                   	ins    DWORD PTR es:[edi],dx
  ca:	65 00 74 69 6d       	add    BYTE PTR gs:[ecx+ebp*2+0x6d],dh
  cf:	65 54                	gs push esp
  d1:	6f                   	outs   dx,DWORD PTR ds:[esi]
  d2:	45                   	inc    ebp
  d3:	78 69                	js     13e <cmdClearScreen-0x30ffec2>
  d5:	74 00                	je     d7 <cmdClearScreen-0x30fff29>
  d7:	53                   	push   ebx
  d8:	49                   	dec    ecx
  d9:	47                   	inc    edi
  da:	49                   	dec    ecx
  db:	4e                   	dec    esi
  dc:	54                   	push   esp
  dd:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  e0:	61                   	popa   
  e1:	72 74                	jb     157 <cmdClearScreen-0x30ffea9>
  e3:	54                   	push   esp
  e4:	69 63 6b 73 00 6b 65 	imul   esp,DWORD PTR [ebx+0x6b],0x656b0073
  eb:	78 65                	js     152 <cmdClearScreen-0x30ffeae>
  ed:	63 00                	arpl   WORD PTR [eax],ax
  ef:	73 74                	jae    165 <cmdClearScreen-0x30ffe9b>
  f1:	64 6f                	outs   dx,DWORD PTR fs:[esi]
  f3:	75 74                	jne    169 <cmdClearScreen-0x30ffe97>
  f5:	70 69                	jo     160 <cmdClearScreen-0x30ffea0>
  f7:	70 65                	jo     15e <cmdClearScreen-0x30ffea2>
  f9:	00 65 73             	add    BYTE PTR [ebp+0x73],ah
  fc:	69 67 6e 61 6c 73 00 	imul   esp,DWORD PTR [edi+0x6e],0x736c61
 103:	75 69                	jne    16e <cmdClearScreen-0x30ffe92>
 105:	6e                   	outs   dx,BYTE PTR ds:[esi]
 106:	74 70                	je     178 <cmdClearScreen-0x30ffe88>
 108:	74 72                	je     17c <cmdClearScreen-0x30ffe84>
 10a:	5f                   	pop    edi
 10b:	74 00                	je     10d <cmdClearScreen-0x30ffef3>
 10d:	4e                   	dec    esi
 10e:	4f                   	dec    edi
 10f:	5f                   	pop    edi
 110:	4e                   	dec    esi
 111:	45                   	inc    ebp
 112:	58                   	pop    eax
 113:	54                   	push   esp
 114:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 117:	6d                   	ins    DWORD PTR es:[edi],dx
 118:	6d                   	ins    DWORD PTR es:[edi],dx
 119:	61                   	popa   
 11a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 11b:	64 5f                	fs pop edi
 11d:	66 75 6e             	data16 jne 18e <cmdClearScreen-0x30ffe72>
 120:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 124:	6e                   	outs   dx,BYTE PTR ds:[esi]
 125:	00 6b 65             	add    BYTE PTR [ebx+0x65],ch
 128:	78 65                	js     18f <cmdClearScreen-0x30ffe71>
 12a:	63 52 65             	arpl   WORD PTR [edx+0x65],dx
 12d:	74 75                	je     1a4 <cmdClearScreen-0x30ffe5c>
 12f:	72 6e                	jb     19f <cmdClearScreen-0x30ffe61>
 131:	00 66 73             	add    BYTE PTR [esi+0x73],ah
 134:	74 61                	je     197 <cmdClearScreen-0x30ffe69>
 136:	74 5f                	je     197 <cmdClearScreen-0x30ffe69>
 138:	74 00                	je     13a <cmdClearScreen-0x30ffec6>
 13a:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 13d:	43                   	inc    ebx
 13e:	6c                   	ins    BYTE PTR es:[edi],dx
 13f:	65 61                	gs popa 
 141:	72 53                	jb     196 <cmdClearScreen-0x30ffe6a>
 143:	63 72 65             	arpl   WORD PTR [edx+0x65],si
 146:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 148:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
 14b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 14c:	72 74                	jb     1c2 <cmdClearScreen-0x30ffe3e>
 14e:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 151:	74 00                	je     153 <cmdClearScreen-0x30ffead>
 153:	70 61                	jo     1b6 <cmdClearScreen-0x30ffe4a>
 155:	72 61                	jb     1b8 <cmdClearScreen-0x30ffe48>
 157:	6d                   	ins    DWORD PTR es:[edi],dx
 158:	43                   	inc    ebx
 159:	6f                   	outs   dx,DWORD PTR ds:[esi]
 15a:	75 6e                	jne    1ca <cmdClearScreen-0x30ffe36>
 15c:	74 00                	je     15e <cmdClearScreen-0x30ffea2>
 15e:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 160:	75 62                	jne    1c4 <cmdClearScreen-0x30ffe3c>
 162:	6c                   	ins    BYTE PTR es:[edi],dx
 163:	65 00 62 53          	add    BYTE PTR gs:[edx+0x53],ah
 167:	69 67 49 6e 74 52 65 	imul   esp,DWORD PTR [edi+0x49],0x6552746e
 16e:	63 65 69             	arpl   WORD PTR [ebp+0x69],sp
 171:	76 65                	jbe    1d8 <cmdClearScreen-0x30ffe28>
 173:	64 00 6c 6f 6e       	add    BYTE PTR fs:[edi+ebp*2+0x6e],ch
 178:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 17c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 17d:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 181:	74 00                	je     183 <cmdClearScreen-0x30ffe7d>
 183:	65 78 65             	gs js  1eb <cmdClearScreen-0x30ffe15>
 186:	63 50 69             	arpl   WORD PTR [eax+0x69],dx
 189:	70 65                	jo     1f0 <cmdClearScreen-0x30ffe10>
 18b:	73 00                	jae    18d <cmdClearScreen-0x30ffe73>
 18d:	76 61                	jbe    1f0 <cmdClearScreen-0x30ffe10>
 18f:	72 4e                	jb     1df <cmdClearScreen-0x30ffe21>
 191:	61                   	popa   
 192:	6d                   	ins    DWORD PTR es:[edi],dx
 193:	65 00 63 6f          	add    BYTE PTR gs:[ebx+0x6f],ah
 197:	6d                   	ins    DWORD PTR es:[edi],dx
 198:	6d                   	ins    DWORD PTR es:[edi],dx
 199:	61                   	popa   
 19a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 19b:	64 5f                	fs pop edi
 19d:	66 75 6e             	data16 jne 20e <cmdClearScreen-0x30ffdf2>
 1a0:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 1a4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1a5:	5f                   	pop    edi
 1a6:	70 00                	jo     1a8 <cmdClearScreen-0x30ffe58>
 1a8:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 1ab:	53                   	push   ebx
 1ac:	6c                   	ins    BYTE PTR es:[edi],dx
 1ad:	65 65 70 00          	gs gs jo 1b1 <cmdClearScreen-0x30ffe4f>
 1b1:	63 68 69             	arpl   WORD PTR [eax+0x69],bp
 1b4:	6c                   	ins    BYTE PTR es:[edi],dx
 1b5:	64 50                	fs push eax
 1b7:	69 64 00 62 61 63 6b 	imul   esp,DWORD PTR [eax+eax*1+0x62],0x676b6361
 1be:	67 
 1bf:	72 6f                	jb     230 <cmdClearScreen-0x30ffdd0>
 1c1:	75 6e                	jne    231 <cmdClearScreen-0x30ffdcf>
 1c3:	64 00 53 49          	add    BYTE PTR fs:[ebx+0x49],dl
 1c7:	47                   	inc    edi
 1c8:	53                   	push   ebx
 1c9:	4c                   	dec    esp
 1ca:	45                   	inc    ebp
 1cb:	45                   	inc    ebp
 1cc:	50                   	push   eax
 1cd:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 1d0:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 1d2:	75 74                	jne    248 <cmdClearScreen-0x30ffdb8>
 1d4:	52                   	push   edx
 1d5:	65 64 69 72 00 73 45 	gs imul esi,DWORD PTR fs:[edx+0x0],0x65784573
 1dc:	78 65 
 1de:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 1e1:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
 1e8:	72 61                	jb     24b <cmdClearScreen-0x30ffdb5>
 1ea:	6d                   	ins    DWORD PTR es:[edi],dx
 1eb:	00 64 65 6c          	add    BYTE PTR [ebp+eiz*2+0x6c],ah
 1ef:	69 6d 00 63 6d 64 43 	imul   ebp,DWORD PTR [ebp+0x0],0x43646d63
 1f6:	68 61 6e 67 65       	push   0x65676e61
 1fb:	44                   	inc    esp
 1fc:	69 72 65 63 74 6f 72 	imul   esi,DWORD PTR [edx+0x65],0x726f7463
 203:	79 00                	jns    205 <cmdClearScreen-0x30ffdfb>
 205:	6c                   	ins    BYTE PTR es:[edi],dx
 206:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 209:	6c                   	ins    BYTE PTR es:[edi],dx
 20a:	69 6e 65 00 70 61 72 	imul   ebp,DWORD PTR [esi+0x65],0x72617000
 211:	61                   	popa   
 212:	6d                   	ins    DWORD PTR es:[edi],dx
 213:	73 00                	jae    215 <cmdClearScreen-0x30ffdeb>
 215:	6e                   	outs   dx,BYTE PTR ds:[esi]
 216:	61                   	popa   
 217:	6d                   	ins    DWORD PTR es:[edi],dx
 218:	65 00 66 6f          	add    BYTE PTR gs:[esi+0x6f],ah
 21c:	72 6b                	jb     289 <cmdClearScreen-0x30ffd77>
 21e:	50                   	push   eax
 21f:	69 64 00 73 74 5f 6c 	imul   esp,DWORD PTR [eax+eax*1+0x73],0x616c5f74
 226:	61 
 227:	73 74                	jae    29d <cmdClearScreen-0x30ffd63>
 229:	6d                   	ins    DWORD PTR es:[edi],dx
 22a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 22b:	64 00 75 6e          	add    BYTE PTR fs:[ebp+0x6e],dh
 22f:	73 69                	jae    29a <cmdClearScreen-0x30ffd66>
 231:	67 6e                	outs   dx,BYTE PTR ds:[si]
 233:	65 64 20 63 68       	gs and BYTE PTR fs:[ebx+0x68],ah
 238:	61                   	popa   
 239:	72 00                	jb     23b <cmdClearScreen-0x30ffdc5>
 23b:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 23e:	48                   	dec    eax
 23f:	65 6c                	gs ins BYTE PTR es:[edi],dx
 241:	70 00                	jo     243 <cmdClearScreen-0x30ffdbd>
 243:	6c                   	ins    BYTE PTR es:[edi],dx
 244:	6f                   	outs   dx,DWORD PTR ds:[esi]
 245:	6e                   	outs   dx,BYTE PTR ds:[esi]
 246:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 24a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 24b:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 24f:	73 69                	jae    2ba <cmdClearScreen-0x30ffd46>
 251:	67 6e                	outs   dx,BYTE PTR ds:[si]
 253:	65 64 20 69 6e       	gs and BYTE PTR fs:[ecx+0x6e],ch
 258:	74 00                	je     25a <cmdClearScreen-0x30ffda6>
 25a:	75 69                	jne    2c5 <cmdClearScreen-0x30ffd3b>
 25c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 25d:	74 33                	je     292 <cmdClearScreen-0x30ffd6e>
 25f:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 262:	00 6c 61 73          	add    BYTE PTR [ecx+eiz*2+0x73],ch
 266:	74 45                	je     2ad <cmdClearScreen-0x30ffd53>
 268:	78 65                	js     2cf <cmdClearScreen-0x30ffd31>
 26a:	63 45 78             	arpl   WORD PTR [ebp+0x78],ax
 26d:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x70006564
 274:	70 
 275:	72 6f                	jb     2e6 <cmdClearScreen-0x30ffd1a>
 277:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 27a:	73 45                	jae    2c1 <cmdClearScreen-0x30ffd3f>
 27c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 27d:	76 70                	jbe    2ef <cmdClearScreen-0x30ffd11>
 27f:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 282:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 284:	75 74                	jne    2fa <cmdClearScreen-0x30ffd06>
 286:	66 69 6c 65 00 65 78 	imul   bp,WORD PTR [ebp+eiz*2+0x0],0x7865
 28d:	69 74 43 6f 64 65 00 	imul   esi,DWORD PTR [ebx+eax*2+0x6f],0x66006564
 294:	66 
 295:	69 6c 65 54 6f 45 78 	imul   ebp,DWORD PTR [ebp+eiz*2+0x54],0x6578456f
 29c:	65 
 29d:	63 00                	arpl   WORD PTR [eax],ax
 29f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2a0:	61                   	popa   
 2a1:	6d                   	ins    DWORD PTR es:[edi],dx
 2a2:	65 4c                	gs dec esp
 2a4:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2a6:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 2a9:	61                   	popa   
 2aa:	72 74                	jb     320 <cmdClearScreen-0x30ffce0>
 2ac:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
 2af:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2b0:	72 74                	jb     326 <cmdClearScreen-0x30ffcda>
 2b2:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 2b5:	73 69                	jae    320 <cmdClearScreen-0x30ffce0>
 2b7:	67 6e                	outs   dx,BYTE PTR ds:[si]
 2b9:	65 64 20 69 6e       	gs and BYTE PTR fs:[ecx+0x6e],ch
 2be:	74 00                	je     2c0 <cmdClearScreen-0x30ffd40>
 2c0:	79 6f                	jns    331 <cmdClearScreen-0x30ffccf>
 2c2:	75 72                	jne    336 <cmdClearScreen-0x30ffcca>
 2c4:	53                   	push   ebx
 2c5:	54                   	push   esp
 2c6:	44                   	inc    esp
 2c7:	49                   	dec    ecx
 2c8:	4e                   	dec    esi
 2c9:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 2cc:	64 65 72 72          	fs gs jb 342 <cmdClearScreen-0x30ffcbe>
 2d0:	70 69                	jo     33b <cmdClearScreen-0x30ffcc5>
 2d2:	70 65                	jo     339 <cmdClearScreen-0x30ffcc7>
 2d4:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 2d7:	64 53                	fs push ebx
 2d9:	65 74 45             	gs je  321 <cmdClearScreen-0x30ffcdf>
 2dc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2dd:	76 00                	jbe    2df <cmdClearScreen-0x30ffd21>
 2df:	53                   	push   ebx
 2e0:	49                   	dec    ecx
 2e1:	47                   	inc    edi
 2e2:	49                   	dec    ecx
 2e3:	4f                   	dec    edi
 2e4:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 2e7:	64 54                	fs push esp
 2e9:	69 63 6b 73 00 63 6d 	imul   esp,DWORD PTR [ebx+0x6b],0x6d630073
 2f0:	64 54                	fs push esp
 2f2:	69 6d 65 00 5f 42 6f 	imul   ebp,DWORD PTR [ebp+0x65],0x6f425f00
 2f9:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2fa:	6c                   	ins    BYTE PTR es:[edi],dx
 2fb:	00 53 49             	add    BYTE PTR [ebx+0x49],dl
 2fe:	47                   	inc    edi
 2ff:	48                   	dec    eax
 300:	41                   	inc    ecx
 301:	4c                   	dec    esp
 302:	54                   	push   esp
 303:	00 74 65 73          	add    BYTE PTR [ebp+eiz*2+0x73],dh
 307:	74 00                	je     309 <cmdClearScreen-0x30ffcf7>
 309:	66 69 6c 65 73 54 6f 	imul   bp,WORD PTR [ebp+eiz*2+0x73],0x6f54
 310:	43                   	inc    ebx
 311:	6c                   	ins    BYTE PTR es:[edi],dx
 312:	6f                   	outs   dx,DWORD PTR ds:[esi]
 313:	73 65                	jae    37a <cmdClearScreen-0x30ffc86>
 315:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 318:	5f                   	pop    edi
 319:	73 69                	jae    384 <cmdClearScreen-0x30ffc7c>
 31b:	7a 65                	jp     382 <cmdClearScreen-0x30ffc7e>
 31d:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 320:	64 52                	fs push edx
 322:	6d                   	ins    DWORD PTR es:[edi],dx
 323:	00 53 49             	add    BYTE PTR [ebx+0x49],dl
 326:	47                   	inc    edi
 327:	53                   	push   ebx
 328:	45                   	inc    ebp
 329:	47                   	inc    edi
 32a:	56                   	push   esi
 32b:	00 79 6f             	add    BYTE PTR [ecx+0x6f],bh
 32e:	75 72                	jne    3a2 <cmdClearScreen-0x30ffc5e>
 330:	53                   	push   ebx
 331:	54                   	push   esp
 332:	44                   	inc    esp
 333:	4f                   	dec    edi
 334:	55                   	push   ebp
 335:	54                   	push   esp
 336:	00 66 6f             	add    BYTE PTR [esi+0x6f],ah
 339:	75 6e                	jne    3a9 <cmdClearScreen-0x30ffc57>
 33b:	64 00 73 74          	add    BYTE PTR fs:[ebx+0x74],dh
 33f:	64 69 6e 66 69 6c 65 	imul   ebp,DWORD PTR fs:[esi+0x66],0x656c69
 346:	00 
 347:	70 61                	jo     3aa <cmdClearScreen-0x30ffc56>
 349:	74 68                	je     3b3 <cmdClearScreen-0x30ffc4d>
 34b:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 34e:	64 52                	fs push edx
 350:	65 70 65             	gs jo  3b8 <cmdClearScreen-0x30ffc48>
 353:	61                   	popa   
 354:	74 00                	je     356 <cmdClearScreen-0x30ffcaa>
 356:	66 72 65             	data16 jb 3be <cmdClearScreen-0x30ffc42>
 359:	65 43                	gs inc ebx
 35b:	6d                   	ins    DWORD PTR es:[edi],dx
 35c:	64 6c                	fs ins BYTE PTR es:[edi],dx
 35e:	69 6e 65 00 72 65 74 	imul   ebp,DWORD PTR [esi+0x65],0x74657200
 365:	56                   	push   esi
 366:	61                   	popa   
 367:	6c                   	ins    BYTE PTR es:[edi],dx
 368:	00 65 72             	add    BYTE PTR [ebp+0x72],ah
 36b:	72 6f                	jb     3dc <cmdClearScreen-0x30ffc24>
 36d:	72 00                	jb     36f <cmdClearScreen-0x30ffc91>
 36f:	73 74                	jae    3e5 <cmdClearScreen-0x30ffc1b>
 371:	64 69 6e 70 69 70 65 	imul   ebp,DWORD PTR fs:[esi+0x70],0x657069
 378:	00 
 379:	76 61                	jbe    3dc <cmdClearScreen-0x30ffc24>
 37b:	6c                   	ins    BYTE PTR es:[edi],dx
 37c:	75 65                	jne    3e3 <cmdClearScreen-0x30ffc1d>
 37e:	4c                   	dec    esp
 37f:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 381:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 384:	6c                   	ins    BYTE PTR es:[edi],dx
 385:	65 73 54             	gs jae 3dc <cmdClearScreen-0x30ffc24>
 388:	6f                   	outs   dx,DWORD PTR ds:[esi]
 389:	43                   	inc    ebx
 38a:	6c                   	ins    BYTE PTR es:[edi],dx
 38b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 38c:	73 65                	jae    3f3 <cmdClearScreen-0x30ffc0d>
 38e:	43                   	inc    ebx
 38f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 390:	75 6e                	jne    400 <cmdClearScreen-0x30ffc00>
 392:	74 00                	je     394 <cmdClearScreen-0x30ffc6c>
 394:	73 74                	jae    40a <cmdClearScreen-0x30ffbf6>
 396:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 398:	75 74                	jne    40e <cmdClearScreen-0x30ffbf2>
 39a:	50                   	push   eax
 39b:	69 70 65 00 63 6d 64 	imul   esi,DWORD PTR [eax+0x65],0x646d6300
 3a2:	54                   	push   esp
 3a3:	61                   	popa   
 3a4:	6b 65 41 44          	imul   esp,DWORD PTR [ebp+0x41],0x44
 3a8:	75 6d                	jne    417 <cmdClearScreen-0x30ffbe9>
 3aa:	70 00                	jo     3ac <cmdClearScreen-0x30ffc54>
 3ac:	73 74                	jae    422 <cmdClearScreen-0x30ffbde>
 3ae:	64 65 72 72          	fs gs jb 424 <cmdClearScreen-0x30ffbdc>
 3b2:	66 69 6c 65 00 6b 65 	imul   bp,WORD PTR [ebp+eiz*2+0x0],0x656b
 3b9:	78 65                	js     420 <cmdClearScreen-0x30ffbe0>
 3bb:	63 32                	arpl   WORD PTR [edx],si
 3bd:	00 47 4e             	add    BYTE PTR [edi+0x4e],al
 3c0:	55                   	push   ebp
 3c1:	20 43 39             	and    BYTE PTR [ebx+0x39],al
 3c4:	39 20                	cmp    DWORD PTR [eax],esp
 3c6:	39 2e                	cmp    DWORD PTR [esi],ebp
 3c8:	33 2e                	xor    ebp,DWORD PTR [esi]
 3ca:	30 20                	xor    BYTE PTR [eax],ah
 3cc:	2d 6d 61 73 6d       	sub    eax,0x6d73616d
 3d1:	3d 69 6e 74 65       	cmp    eax,0x65746e69
 3d6:	6c                   	ins    BYTE PTR es:[edi],dx
 3d7:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
 3dd:	65 3d 67 65 6e 65    	gs cmp eax,0x656e6567
 3e3:	72 69                	jb     44e <cmdClearScreen-0x30ffbb2>
 3e5:	63 20                	arpl   WORD PTR [eax],sp
 3e7:	2d 6d 61 72 63       	sub    eax,0x6372616d
 3ec:	68 3d 69 36 38       	push   0x3836693d
 3f1:	36 20 2d 67 20 2d 73 	and    BYTE PTR ss:0x732d2067,ch
 3f8:	74 64                	je     45e <cmdClearScreen-0x30ffba2>
 3fa:	3d 63 39 39 20       	cmp    eax,0x20393963
 3ff:	2d 66 66 72 65       	sub    eax,0x65726666
 404:	65 73 74             	gs jae 47b <cmdClearScreen-0x30ffb85>
 407:	61                   	popa   
 408:	6e                   	outs   dx,BYTE PTR ds:[esi]
 409:	64 69 6e 67 20 2d 66 	imul   ebp,DWORD PTR fs:[esi+0x67],0x61662d20
 410:	61 
 411:	73 79                	jae    48c <cmdClearScreen-0x30ffb74>
 413:	6e                   	outs   dx,BYTE PTR ds:[esi]
 414:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
 417:	6f                   	outs   dx,DWORD PTR ds:[esi]
 418:	6e                   	outs   dx,BYTE PTR ds:[esi]
 419:	6f                   	outs   dx,DWORD PTR ds:[esi]
 41a:	75 73                	jne    48f <cmdClearScreen-0x30ffb71>
 41c:	2d 75 6e 77 69       	sub    eax,0x69776e75
 421:	6e                   	outs   dx,BYTE PTR ds:[esi]
 422:	64 2d 74 61 62 6c    	fs sub eax,0x6c626174
 428:	65 73 20             	gs jae 44b <cmdClearScreen-0x30ffbb5>
 42b:	2d 66 73 74 61       	sub    eax,0x61747366
 430:	63 6b 2d             	arpl   WORD PTR [ebx+0x2d],bp
 433:	63 6c 61 73          	arpl   WORD PTR [ecx+eiz*2+0x73],bp
 437:	68 2d 70 72 6f       	push   0x6f72702d
 43c:	74 65                	je     4a3 <cmdClearScreen-0x30ffb5d>
 43e:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 442:	6e                   	outs   dx,BYTE PTR ds:[esi]
 443:	20 2d 66 63 66 2d    	and    BYTE PTR ds:0x2d666366,ch
 449:	70 72                	jo     4bd <cmdClearScreen-0x30ffb43>
 44b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 44c:	74 65                	je     4b3 <cmdClearScreen-0x30ffb4d>
 44e:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 452:	6e                   	outs   dx,BYTE PTR ds:[esi]
 453:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 456:	6d                   	ins    DWORD PTR es:[edi],dx
 457:	6d                   	ins    DWORD PTR es:[edi],dx
 458:	61                   	popa   
 459:	6e                   	outs   dx,BYTE PTR ds:[esi]
 45a:	64 5f                	fs pop edi
 45c:	74 61                	je     4bf <cmdClearScreen-0x30ffb41>
 45e:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
 462:	74 00                	je     464 <cmdClearScreen-0x30ffb9c>
 464:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 466:	6e                   	outs   dx,BYTE PTR ds:[esi]
 467:	65 47                	gs inc edi
 469:	65 74 74             	gs je  4e0 <cmdClearScreen-0x30ffb20>
 46c:	69 6e 67 4b 65 79 73 	imul   ebp,DWORD PTR [esi+0x67],0x7379654b
 473:	00 6c 52 65          	add    BYTE PTR [edx+edx*2+0x65],ch
 477:	74 56                	je     4cf <cmdClearScreen-0x30ffb31>
 479:	61                   	popa   
 47a:	6c                   	ins    BYTE PTR es:[edi],dx
 47b:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 47e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 47f:	6d                   	ins    DWORD PTR es:[edi],dx
 480:	70 74                	jo     4f6 <cmdClearScreen-0x30ffb0a>
 482:	00 65 6e             	add    BYTE PTR [ebp+0x6e],ah
 485:	76 70                	jbe    4f7 <cmdClearScreen-0x30ffb09>
 487:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 48a:	6d                   	ins    DWORD PTR es:[edi],dx
 48b:	6d                   	ins    DWORD PTR es:[edi],dx
 48c:	61                   	popa   
 48d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 48e:	64 48                	fs dec eax
 490:	69 73 74 6f 72 79 4d 	imul   esi,DWORD PTR [ebx+0x74],0x4d79726f
 497:	61                   	popa   
 498:	78 00                	js     49a <cmdClearScreen-0x30ffb66>
 49a:	70 61                	jo     4fd <cmdClearScreen-0x30ffb03>
 49c:	72 73                	jb     511 <cmdClearScreen-0x30ffaef>
 49e:	65 50                	gs push eax
 4a0:	61                   	popa   
 4a1:	72 61                	jb     504 <cmdClearScreen-0x30ffafc>
 4a3:	6d                   	ins    DWORD PTR es:[edi],dx
 4a4:	73 53                	jae    4f9 <cmdClearScreen-0x30ffb07>
 4a6:	68 65 6c 6c 00       	push   0x6c6c65
 4ab:	69 6e 70 75 74 00 6c 	imul   ebp,DWORD PTR [esi+0x70],0x6c007475
 4b2:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 4b5:	73 00                	jae    4b7 <cmdClearScreen-0x30ffb49>
 4b7:	6c                   	ins    BYTE PTR es:[edi],dx
 4b8:	43                   	inc    ebx
 4b9:	75 72                	jne    52d <cmdClearScreen-0x30ffad3>
 4bb:	72 4b                	jb     508 <cmdClearScreen-0x30ffaf8>
 4bd:	65 79 43             	gs jns 503 <cmdClearScreen-0x30ffafd>
 4c0:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4c1:	75 6e                	jne    531 <cmdClearScreen-0x30ffacf>
 4c3:	74 00                	je     4c5 <cmdClearScreen-0x30ffb3b>
 4c5:	69 6e 69 74 46 69 6c 	imul   ebp,DWORD PTR [esi+0x69],0x6c694674
 4cc:	65 00 70 61          	add    BYTE PTR gs:[eax+0x61],dh
 4d0:	72 73                	jb     545 <cmdClearScreen-0x30ffabb>
 4d2:	65 64 43             	gs fs inc ebx
 4d5:	68 61 72 73 00       	push   0x737261
 4da:	6b 49 6e 69          	imul   ecx,DWORD PTR [ecx+0x6e],0x69
 4de:	74 00                	je     4e0 <cmdClearScreen-0x30ffb20>
 4e0:	70 70                	jo     552 <cmdClearScreen-0x30ffaae>
 4e2:	74 72                	je     556 <cmdClearScreen-0x30ffaaa>
 4e4:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 4e7:	65 63 49 6e          	arpl   WORD PTR gs:[ecx+0x6e],cx
 4eb:	74 65                	je     552 <cmdClearScreen-0x30ffaae>
 4ed:	72 6e                	jb     55d <cmdClearScreen-0x30ffaa3>
 4ef:	61                   	popa   
 4f0:	6c                   	ins    BYTE PTR es:[edi],dx
 4f1:	43                   	inc    ebx
 4f2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4f3:	6d                   	ins    DWORD PTR es:[edi],dx
 4f4:	6d                   	ins    DWORD PTR es:[edi],dx
 4f5:	61                   	popa   
 4f6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 4f7:	64 00 64 71 75       	add    BYTE PTR fs:[ecx+esi*2+0x75],ah
 4fc:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4fd:	74 65                	je     564 <cmdClearScreen-0x30ffa9c>
 4ff:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
 502:	6e                   	outs   dx,BYTE PTR ds:[esi]
 503:	74 38                	je     53d <cmdClearScreen-0x30ffac3>
 505:	5f                   	pop    edi
 506:	74 00                	je     508 <cmdClearScreen-0x30ffaf8>
 508:	65 63 68 6f          	arpl   WORD PTR gs:[eax+0x6f],bp
 50c:	49                   	dec    ecx
 50d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 50e:	70 75                	jo     585 <cmdClearScreen-0x30ffa7b>
 510:	74 00                	je     512 <cmdClearScreen-0x30ffaee>
 512:	70 72                	jo     586 <cmdClearScreen-0x30ffa7a>
 514:	65 70 72             	gs jo  589 <cmdClearScreen-0x30ffa77>
 517:	6f                   	outs   dx,DWORD PTR ds:[esi]
 518:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 51b:	73 43                	jae    560 <cmdClearScreen-0x30ffaa0>
 51d:	6d                   	ins    DWORD PTR es:[edi],dx
 51e:	64 00 66 72          	add    BYTE PTR fs:[esi+0x72],ah
 522:	65 65 41             	gs gs inc ecx
 525:	72 67                	jb     58e <cmdClearScreen-0x30ffa72>
 527:	56                   	push   esi
 528:	00 70 63             	add    BYTE PTR [eax+0x63],dh
 52b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 52c:	75 6e                	jne    59c <cmdClearScreen-0x30ffa64>
 52e:	74 00                	je     530 <cmdClearScreen-0x30ffad0>
 530:	6c                   	ins    BYTE PTR es:[edi],dx
 531:	43                   	inc    ebx
 532:	75 72                	jne    5a6 <cmdClearScreen-0x30ffa5a>
 534:	72 4b                	jb     581 <cmdClearScreen-0x30ffa7f>
 536:	65 79 00             	gs jns 539 <cmdClearScreen-0x30ffac7>
 539:	70 61                	jo     59c <cmdClearScreen-0x30ffa64>
 53b:	72 61                	jb     59e <cmdClearScreen-0x30ffa62>
 53d:	6d                   	ins    DWORD PTR es:[edi],dx
 53e:	73 54                	jae    594 <cmdClearScreen-0x30ffa6c>
 540:	6f                   	outs   dx,DWORD PTR ds:[esi]
 541:	41                   	inc    ecx
 542:	72 67                	jb     5ab <cmdClearScreen-0x30ffa55>
 544:	76 00                	jbe    546 <cmdClearScreen-0x30ffaba>
 546:	72 65                	jb     5ad <cmdClearScreen-0x30ffa53>
 548:	70 72                	jo     5bc <cmdClearScreen-0x30ffa44>
 54a:	69 6e 74 43 6f 6d 6d 	imul   ebp,DWORD PTR [esi+0x74],0x6d6d6f43
 551:	61                   	popa   
 552:	6e                   	outs   dx,BYTE PTR ds:[esi]
 553:	64 00 62 73          	add    BYTE PTR fs:[edx+0x73],ah
 557:	71 75                	jno    5ce <cmdClearScreen-0x30ffa32>
 559:	6f                   	outs   dx,DWORD PTR ds:[esi]
 55a:	74 65                	je     5c1 <cmdClearScreen-0x30ffa3f>
 55c:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 55f:	74 41                	je     5a2 <cmdClearScreen-0x30ffa5e>
 561:	43                   	inc    ebx
 562:	6f                   	outs   dx,DWORD PTR ds:[esi]
 563:	6d                   	ins    DWORD PTR es:[edi],dx
 564:	6d                   	ins    DWORD PTR es:[edi],dx
 565:	61                   	popa   
 566:	6e                   	outs   dx,BYTE PTR ds:[esi]
 567:	64 00 6d 61          	add    BYTE PTR fs:[ebp+0x61],ch
 56b:	78 61                	js     5ce <cmdClearScreen-0x30ffa32>
 56d:	72 67                	jb     5d6 <cmdClearScreen-0x30ffa2a>
 56f:	63 00                	arpl   WORD PTR [eax],ax
 571:	65 78 65             	gs js  5d9 <cmdClearScreen-0x30ffa27>
 574:	63 43 6d             	arpl   WORD PTR [ebx+0x6d],ax
 577:	64 73 00             	fs jae 57a <cmdClearScreen-0x30ffa86>
 57a:	64 65 6c             	fs gs ins BYTE PTR es:[edi],dx
 57d:	69 6d 73 00 6e 65 65 	imul   ebp,DWORD PTR [ebp+0x73],0x65656e00
 584:	64 44                	fs inc esp
 586:	6f                   	outs   dx,DWORD PTR ds:[esi]
 587:	75 62                	jne    5eb <cmdClearScreen-0x30ffa15>
 589:	6c                   	ins    BYTE PTR es:[edi],dx
 58a:	65 51                	gs push ecx
 58c:	75 6f                	jne    5fd <cmdClearScreen-0x30ffa03>
 58e:	74 65                	je     5f5 <cmdClearScreen-0x30ffa0b>
 590:	74 6f                	je     601 <cmdClearScreen-0x30ff9ff>
 592:	45                   	inc    ebp
 593:	6e                   	outs   dx,BYTE PTR ds:[esi]
 594:	64 50                	fs push eax
 596:	61                   	popa   
 597:	72 61                	jb     5fa <cmdClearScreen-0x30ffa06>
 599:	6d                   	ins    DWORD PTR es:[edi],dx
 59a:	00 62 75             	add    BYTE PTR [edx+0x75],ah
 59d:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 5a4:	00 
 5a5:	70 72                	jo     619 <cmdClearScreen-0x30ff9e7>
 5a7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5a8:	63 65 73             	arpl   WORD PTR [ebp+0x73],sp
 5ab:	73 53                	jae    600 <cmdClearScreen-0x30ffa00>
 5ad:	69 67 6e 61 6c 00 73 	imul   esp,DWORD PTR [edi+0x6e],0x73006c61
 5b4:	61                   	popa   
 5b5:	76 65                	jbe    61c <cmdClearScreen-0x30ff9e4>
 5b7:	43                   	inc    ebx
 5b8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 5b9:	6d                   	ins    DWORD PTR es:[edi],dx
 5ba:	6d                   	ins    DWORD PTR es:[edi],dx
 5bb:	61                   	popa   
 5bc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5bd:	64 00 69 6e          	add    BYTE PTR fs:[ecx+0x6e],ch
 5c1:	70 75                	jo     638 <cmdClearScreen-0x30ff9c8>
 5c3:	74 46                	je     60b <cmdClearScreen-0x30ff9f5>
 5c5:	69 6c 65 00 63 6f 6d 	imul   ebp,DWORD PTR [ebp+eiz*2+0x0],0x6d6d6f63
 5cc:	6d 
 5cd:	61                   	popa   
 5ce:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5cf:	64 48                	fs dec eax
 5d1:	69 73 74 6f 72 79 00 	imul   esi,DWORD PTR [ebx+0x74],0x79726f
 5d8:	61                   	popa   
 5d9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5da:	73 69                	jae    645 <cmdClearScreen-0x30ff9bb>
 5dc:	53                   	push   ebx
 5dd:	65 71 00             	gs jno 5e0 <cmdClearScreen-0x30ffa20>
 5e0:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 5e3:	6d                   	ins    DWORD PTR es:[edi],dx
 5e4:	61                   	popa   
 5e5:	6e                   	outs   dx,BYTE PTR ds:[esi]
 5e6:	64 48                	fs dec eax
 5e8:	69 73 74 6f 72 79 50 	imul   esi,DWORD PTR [ebx+0x74],0x5079726f
 5ef:	74 72                	je     663 <cmdClearScreen-0x30ff99d>
 5f1:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 5f4:	67 6e                	outs   dx,BYTE PTR ds:[si]
 5f6:	61                   	popa   
 5f7:	6c                   	ins    BYTE PTR es:[edi],dx
 5f8:	00 73 72             	add    BYTE PTR [ebx+0x72],dh
 5fb:	63 2f                	arpl   WORD PTR [edi],bp
 5fd:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 601:	6c                   	ins    BYTE PTR es:[edi],dx
 602:	6c                   	ins    BYTE PTR es:[edi],dx
 603:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 606:	6c                   	ins    BYTE PTR es:[edi],dx
 607:	43                   	inc    ebx
 608:	6f                   	outs   dx,DWORD PTR ds:[esi]
 609:	6d                   	ins    DWORD PTR es:[edi],dx
 60a:	6d                   	ins    DWORD PTR es:[edi],dx
 60b:	61                   	popa   
 60c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 60d:	64 50                	fs push eax
 60f:	74 72                	je     683 <cmdClearScreen-0x30ff97d>
 611:	00 6b 53             	add    BYTE PTR [ebx+0x53],ch
 614:	68 65 6c 6c 00       	push   0x6c6c65
 619:	6b 43 6d 64          	imul   eax,DWORD PTR [ebx+0x6d],0x64
 61d:	6c                   	ins    BYTE PTR es:[edi],dx
 61e:	69 6e 65 00 63 6d 64 	imul   ebp,DWORD PTR [esi+0x65],0x646d6300
 625:	62 65 67             	bound  esp,QWORD PTR [ebp+0x67]
 628:	69 6e 00 63 6d 64 70 	imul   ebp,DWORD PTR [esi+0x0],0x70646d63
 62f:	74 72                	je     6a3 <cmdClearScreen-0x30ff95d>
 631:	00 6e 61             	add    BYTE PTR [esi+0x61],ch
 634:	72 67                	jb     69d <cmdClearScreen-0x30ff963>
 636:	76 00                	jbe    638 <cmdClearScreen-0x30ff9c8>
 638:	6c                   	ins    BYTE PTR es:[edi],dx
 639:	74 65                	je     6a0 <cmdClearScreen-0x30ff960>
 63b:	6d                   	ins    DWORD PTR es:[edi],dx
 63c:	70 00                	jo     63e <cmdClearScreen-0x30ff9c2>
 63e:	68 61 6e 64 6c       	push   0x6c646e61
 643:	65 53                	gs push ebx
 645:	69 67 6e 61 6c 73 00 	imul   esp,DWORD PTR [edi+0x6e],0x736c61
 64c:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 64f:	4c                   	dec    esp
 650:	69 6e 65 00 63 6f 6d 	imul   ebp,DWORD PTR [esi+0x65],0x6d6f6300
 657:	6d                   	ins    DWORD PTR es:[edi],dx
 658:	61                   	popa   
 659:	6e                   	outs   dx,BYTE PTR ds:[esi]
 65a:	64 00 66 69          	add    BYTE PTR fs:[esi+0x69],ah
 65e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 65f:	64 43                	fs inc ebx
 661:	6f                   	outs   dx,DWORD PTR ds:[esi]
 662:	6d                   	ins    DWORD PTR es:[edi],dx
 663:	6d                   	ins    DWORD PTR es:[edi],dx
 664:	61                   	popa   
 665:	6e                   	outs   dx,BYTE PTR ds:[esi]
 666:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 66a:	70 79                	jo     6e5 <cmdClearScreen-0x30ff91b>
 66c:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 66f:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 672:	72 73                	jb     6e7 <cmdClearScreen-0x30ff919>
 674:	65 43                	gs inc ebx
 676:	6d                   	ins    DWORD PTR es:[edi],dx
 677:	64 73 00             	fs jae 67a <cmdClearScreen-0x30ff986>
 67a:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 67d:	6d                   	ins    DWORD PTR es:[edi],dx
 67e:	61                   	popa   
 67f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 680:	64 57                	fs push edi
 682:	61                   	popa   
 683:	73 46                	jae    6cb <cmdClearScreen-0x30ff935>
 685:	72 6f                	jb     6f6 <cmdClearScreen-0x30ff90a>
 687:	6d                   	ins    DWORD PTR es:[edi],dx
 688:	54                   	push   esp
 689:	68 69 73 42 75       	push   0x75427369
 68e:	66 66 65 72 50       	data16 data16 gs jb 6e3 <cmdClearScreen-0x30ff91d>
 693:	74 72                	je     707 <cmdClearScreen-0x30ff8f9>
 695:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 698:	74 41                	je     6db <cmdClearScreen-0x30ff925>
 69a:	4b                   	dec    ebx
 69b:	65 79 00             	gs jns 69e <cmdClearScreen-0x30ff962>

Disassembly of section .comment:

00000000 <.comment>:
   0:	47                   	inc    edi
   1:	43                   	inc    ebx
   2:	43                   	inc    ebx
   3:	3a 20                	cmp    ah,BYTE PTR [eax]
   5:	28 55 62             	sub    BYTE PTR [ebp+0x62],dl
   8:	75 6e                	jne    78 <cmdClearScreen-0x30fff88>
   a:	74 75                	je     81 <cmdClearScreen-0x30fff7f>
   c:	20 39                	and    BYTE PTR [ecx],bh
   e:	2e 33 2e             	xor    ebp,DWORD PTR cs:[esi]
  11:	30 2d 31 30 75 62    	xor    BYTE PTR ds:0x62753031,ch
  17:	75 6e                	jne    87 <cmdClearScreen-0x30fff79>
  19:	74 75                	je     90 <cmdClearScreen-0x30fff70>
  1b:	32 29                	xor    ch,BYTE PTR [ecx]
  1d:	20 39                	and    BYTE PTR [ecx],bh
  1f:	2e 33 2e             	xor    ebp,DWORD PTR cs:[esi]
  22:	30 00                	xor    BYTE PTR [eax],al
