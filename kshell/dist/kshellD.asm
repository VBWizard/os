
Debug/cross-Linux/kshell:     file format elf32-i386


Disassembly of section .text:

03100000 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/kshell/kshell.c:24
uint32_t exitCode=0;

extern int kATADeviceInfoCount;

void execInternalCommand(char lCommand[256])
{
 3100000:	55                   	push   ebp
 3100001:	89 e5                	mov    ebp,esp
 3100003:	53                   	push   ebx
 3100004:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/kshell/kshell.c:25
    int i = findCommand(lCommand);
 3100007:	83 ec 0c             	sub    esp,0xc
 310000a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310000d:	e8 e3 01 00 00       	call   31001f5 <findCommand>
 3100012:	83 c4 10             	add    esp,0x10
 3100015:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:27

    if(i>0)
 3100018:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 310001c:	7e 74                	jle    3100092 <execInternalCommand+0x92>
/home/yogi/src/os/kshell/kshell.c:29
    {
        i--;
 310001e:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:31
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 3100022:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100025:	c1 e0 04             	shl    eax,0x4
 3100028:	05 a8 0f 10 03       	add    eax,0x3100fa8
 310002d:	8b 00                	mov    eax,DWORD PTR [eax]
 310002f:	a3 f4 12 10 03       	mov    ds:0x31012f4,eax
/home/yogi/src/os/kshell/kshell.c:32
        command_function_p = cmds[i].function;
 3100034:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100037:	c1 e0 04             	shl    eax,0x4
 310003a:	05 a8 0f 10 03       	add    eax,0x3100fa8
 310003f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100041:	a3 e0 12 10 03       	mov    ds:0x31012e0,eax
/home/yogi/src/os/kshell/kshell.c:33
        if (cmds[i].paramCount==0)
 3100046:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100049:	c1 e0 04             	shl    eax,0x4
 310004c:	05 ac 0f 10 03       	add    eax,0x3100fac
 3100051:	8b 00                	mov    eax,DWORD PTR [eax]
 3100053:	85 c0                	test   eax,eax
 3100055:	75 09                	jne    3100060 <execInternalCommand+0x60>
/home/yogi/src/os/kshell/kshell.c:34
            command_function();
 3100057:	a1 f4 12 10 03       	mov    eax,ds:0x31012f4
 310005c:	ff d0                	call   eax
/home/yogi/src/os/kshell/kshell.c:44
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
    }
}
 310005e:	eb 45                	jmp    31000a5 <execInternalCommand+0xa5>
/home/yogi/src/os/kshell/kshell.c:37
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  
 3100060:	8b 1d e0 12 10 03    	mov    ebx,DWORD PTR ds:0x31012e0
 3100066:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100069:	c1 e0 04             	shl    eax,0x4
 310006c:	05 a0 0f 10 03       	add    eax,0x3100fa0
 3100071:	8b 00                	mov    eax,DWORD PTR [eax]
 3100073:	83 ec 0c             	sub    esp,0xc
 3100076:	50                   	push   eax
 3100077:	e8 94 09 00 00       	call   3100a10 <kShell+0x2c1>
 310007c:	83 c4 10             	add    esp,0x10
 310007f:	8d 50 01             	lea    edx,[eax+0x1]
 3100082:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100085:	01 d0                	add    eax,edx
 3100087:	83 ec 0c             	sub    esp,0xc
 310008a:	50                   	push   eax
 310008b:	ff d3                	call   ebx
 310008d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:44
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
    }
}
 3100090:	eb 13                	jmp    31000a5 <execInternalCommand+0xa5>
/home/yogi/src/os/kshell/kshell.c:42
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  
        }
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
 3100092:	83 ec 08             	sub    esp,0x8
 3100095:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100098:	68 94 0a 10 03       	push   0x3100a94
 310009d:	e8 ce 08 00 00       	call   3100970 <kShell+0x221>
 31000a2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:44
    }
}
 31000a5:	90                   	nop
 31000a6:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31000a9:	c9                   	leave  
 31000aa:	c3                   	ret    

031000ab <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/kshell/kshell.c:47

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 31000ab:	55                   	push   ebp
 31000ac:	89 e5                	mov    ebp,esp
 31000ae:	53                   	push   ebx
 31000af:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/kshell/kshell.c:48
    int x=0,y=0;
 31000b2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31000b9:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:49
    int lRetVal=0,parsedChars=0;
 31000c0:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 31000c7:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:51
    
    memset(params,0, size);
 31000ce:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 31000d1:	83 ec 04             	sub    esp,0x4
 31000d4:	50                   	push   eax
 31000d5:	6a 00                	push   0x0
 31000d7:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31000da:	e8 11 09 00 00       	call   31009f0 <kShell+0x2a1>
 31000df:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:53
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31000e2:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 31000e9:	e9 c9 00 00 00       	jmp    31001b7 <parseParamsShell+0x10c>
/home/yogi/src/os/kshell/kshell.c:56
    {
        //print("c=%c\n", cmdLine[cnt]);
        if ( (cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',')
 31000ee:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31000f1:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 31000f4:	01 d0                	add    eax,edx
 31000f6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31000f9:	3c 20                	cmp    al,0x20
 31000fb:	74 1e                	je     310011b <parseParamsShell+0x70>
/home/yogi/src/os/kshell/kshell.c:56 (discriminator 1)
 31000fd:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100100:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100103:	01 d0                	add    eax,edx
 3100105:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100108:	3c 2d                	cmp    al,0x2d
 310010a:	74 0f                	je     310011b <parseParamsShell+0x70>
/home/yogi/src/os/kshell/kshell.c:56 (discriminator 2)
 310010c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310010f:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100112:	01 d0                	add    eax,edx
 3100114:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100117:	3c 2c                	cmp    al,0x2c
 3100119:	75 6f                	jne    310018a <parseParamsShell+0xdf>
/home/yogi/src/os/kshell/kshell.c:59
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 310011b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310011e:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100121:	01 d0                	add    eax,edx
 3100123:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100126:	3c 2d                	cmp    al,0x2d
 3100128:	74 0f                	je     3100139 <parseParamsShell+0x8e>
/home/yogi/src/os/kshell/kshell.c:59 (discriminator 1)
 310012a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310012d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100130:	01 d0                	add    eax,edx
 3100132:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100135:	3c 2f                	cmp    al,0x2f
 3100137:	75 25                	jne    310015e <parseParamsShell+0xb3>
/home/yogi/src/os/kshell/kshell.c:60
                params[y][x++]=cmdLine[cnt];
 3100139:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310013c:	c1 e0 09             	shl    eax,0x9
 310013f:	89 c2                	mov    edx,eax
 3100141:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100144:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3100147:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310014a:	8d 50 01             	lea    edx,[eax+0x1]
 310014d:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100150:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 3100153:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 3100156:	01 da                	add    edx,ebx
 3100158:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310015b:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/kshell/kshell.c:61
            params[y][x]='\0';
 310015e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100161:	c1 e0 09             	shl    eax,0x9
 3100164:	89 c2                	mov    edx,eax
 3100166:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100169:	01 c2                	add    edx,eax
 310016b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310016e:	01 d0                	add    eax,edx
 3100170:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:62
            if (cnt>0)
 3100173:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100177:	74 36                	je     31001af <parseParamsShell+0x104>
/home/yogi/src/os/kshell/kshell.c:63
                {x=0;y++;lRetVal++;}
 3100179:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100180:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100184:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/kshell/kshell.c:62
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 3100188:	eb 25                	jmp    31001af <parseParamsShell+0x104>
/home/yogi/src/os/kshell/kshell.c:68
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 310018a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310018d:	c1 e0 09             	shl    eax,0x9
 3100190:	89 c2                	mov    edx,eax
 3100192:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100195:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3100198:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310019b:	8d 50 01             	lea    edx,[eax+0x1]
 310019e:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31001a1:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31001a4:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 31001a7:	01 da                	add    edx,ebx
 31001a9:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31001ac:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/kshell/kshell.c:70 (discriminator 2)
        }
        parsedChars++;
 31001af:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/kshell/kshell.c:53 (discriminator 2)
    int x=0,y=0;
    int lRetVal=0,parsedChars=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31001b3:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/kshell/kshell.c:53 (discriminator 1)
 31001b7:	83 ec 0c             	sub    esp,0xc
 31001ba:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31001bd:	e8 4e 08 00 00       	call   3100a10 <kShell+0x2c1>
 31001c2:	83 c4 10             	add    esp,0x10
 31001c5:	3b 45 e4             	cmp    eax,DWORD PTR [ebp-0x1c]
 31001c8:	0f 87 20 ff ff ff    	ja     31000ee <parseParamsShell+0x43>
/home/yogi/src/os/kshell/kshell.c:72
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 31001ce:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31001d2:	74 19                	je     31001ed <parseParamsShell+0x142>
/home/yogi/src/os/kshell/kshell.c:74
    {
        lRetVal++;
 31001d4:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/kshell/kshell.c:75
        params[y][x]='\0';
 31001d8:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31001db:	c1 e0 09             	shl    eax,0x9
 31001de:	89 c2                	mov    edx,eax
 31001e0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31001e3:	01 c2                	add    edx,eax
 31001e5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001e8:	01 d0                	add    eax,edx
 31001ea:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:80
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 31001ed:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/kshell/kshell.c:81
}
 31001f0:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31001f3:	c9                   	leave  
 31001f4:	c3                   	ret    

031001f5 <findCommand>:
findCommand():
/home/yogi/src/os/kshell/kshell.c:84

int findCommand(char* command)
{
 31001f5:	55                   	push   ebp
 31001f6:	89 e5                	mov    ebp,esp
 31001f8:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:88
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 31001fb:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100202:	eb 4d                	jmp    3100251 <findCommand+0x5c>
/home/yogi/src/os/kshell/kshell.c:90
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 3100204:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100207:	c1 e0 04             	shl    eax,0x4
 310020a:	05 a0 0f 10 03       	add    eax,0x3100fa0
 310020f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100211:	83 ec 0c             	sub    esp,0xc
 3100214:	50                   	push   eax
 3100215:	e8 f6 07 00 00       	call   3100a10 <kShell+0x2c1>
 310021a:	83 c4 10             	add    esp,0x10
 310021d:	89 c2                	mov    edx,eax
 310021f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100222:	c1 e0 04             	shl    eax,0x4
 3100225:	05 a0 0f 10 03       	add    eax,0x3100fa0
 310022a:	8b 00                	mov    eax,DWORD PTR [eax]
 310022c:	83 ec 04             	sub    esp,0x4
 310022f:	52                   	push   edx
 3100230:	50                   	push   eax
 3100231:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100234:	e8 a7 07 00 00       	call   31009e0 <kShell+0x291>
 3100239:	83 c4 10             	add    esp,0x10
 310023c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:92
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 310023f:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100243:	75 08                	jne    310024d <findCommand+0x58>
/home/yogi/src/os/kshell/kshell.c:95
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 3100245:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100248:	83 c0 01             	add    eax,0x1
 310024b:	eb 0f                	jmp    310025c <findCommand+0x67>
/home/yogi/src/os/kshell/kshell.c:88 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 310024d:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:88 (discriminator 1)
 3100251:	83 7d f4 03          	cmp    DWORD PTR [ebp-0xc],0x3
 3100255:	76 ad                	jbe    3100204 <findCommand+0xf>
/home/yogi/src/os/kshell/kshell.c:99
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 3100257:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/kshell/kshell.c:100
}
 310025c:	c9                   	leave  
 310025d:	c3                   	ret    

0310025e <buildargv>:
buildargv():
/home/yogi/src/os/kshell/kshell.c:104

/*parts from http://*/
char **buildargv (const char *input)
{
 310025e:	55                   	push   ebp
 310025f:	89 e5                	mov    ebp,esp
 3100261:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/kshell/kshell.c:107
  char *arg;
  char *copybuf;
  int squote = 0;
 3100264:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/kshell/kshell.c:108
  int dquote = 0;
 310026b:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:109
  int bsquote = 0;
 3100272:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/kshell/kshell.c:110
  int argc = 0;
 3100279:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/kshell/kshell.c:111
  int maxargc = 0;
 3100280:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/kshell/kshell.c:112
  char **argv = NULL;
 3100287:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/kshell/kshell.c:116
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 310028e:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 3100292:	0f 84 33 02 00 00    	je     31004cb <buildargv+0x26d>
/home/yogi/src/os/kshell/kshell.c:119
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 3100298:	83 ec 0c             	sub    esp,0xc
 310029b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310029e:	e8 6d 07 00 00       	call   3100a10 <kShell+0x2c1>
 31002a3:	83 c4 10             	add    esp,0x10
 31002a6:	83 c0 01             	add    eax,0x1
 31002a9:	83 ec 0c             	sub    esp,0xc
 31002ac:	50                   	push   eax
 31002ad:	e8 ee 06 00 00       	call   31009a0 <kShell+0x251>
 31002b2:	83 c4 10             	add    esp,0x10
 31002b5:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:127
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 31002b8:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 31002bc:	74 0b                	je     31002c9 <buildargv+0x6b>
/home/yogi/src/os/kshell/kshell.c:127 (discriminator 1)
 31002be:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31002c1:	83 e8 01             	sub    eax,0x1
 31002c4:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 31002c7:	7f 3d                	jg     3100306 <buildargv+0xa8>
/home/yogi/src/os/kshell/kshell.c:130
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 31002c9:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 31002cd:	75 1c                	jne    31002eb <buildargv+0x8d>
/home/yogi/src/os/kshell/kshell.c:132
		{
		  maxargc = INITIAL_MAXARGC;
 31002cf:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/kshell/kshell.c:133
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 31002d6:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31002d9:	c1 e0 02             	shl    eax,0x2
 31002dc:	83 ec 0c             	sub    esp,0xc
 31002df:	50                   	push   eax
 31002e0:	e8 bb 06 00 00       	call   31009a0 <kShell+0x251>
 31002e5:	83 c4 10             	add    esp,0x10
 31002e8:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/kshell/kshell.c:135
		}
	      argv = nargv;
 31002eb:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 31002ee:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/kshell/kshell.c:136
	      argv[argc] = NULL;
 31002f1:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31002f4:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31002fb:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31002fe:	01 d0                	add    eax,edx
 3100300:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:139
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 3100306:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100309:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:140
	  while (*input != EOS)
 310030c:	e9 ec 00 00 00       	jmp    31003fd <buildargv+0x19f>
/home/yogi/src/os/kshell/kshell.c:142
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100311:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100314:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100317:	3c 20                	cmp    al,0x20
 3100319:	75 16                	jne    3100331 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:142 (discriminator 1)
 310031b:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 310031f:	75 10                	jne    3100331 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:142 (discriminator 2)
 3100321:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100325:	75 0a                	jne    3100331 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:142 (discriminator 3)
 3100327:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310032b:	0f 84 da 00 00 00    	je     310040b <buildargv+0x1ad>
/home/yogi/src/os/kshell/kshell.c:148
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100331:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100335:	74 1d                	je     3100354 <buildargv+0xf6>
/home/yogi/src/os/kshell/kshell.c:150
		    {
		      bsquote = 0;
 3100337:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/kshell/kshell.c:151
		      *arg++ = *input;
 310033e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100341:	8d 50 01             	lea    edx,[eax+0x1]
 3100344:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100347:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310034a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310034d:	88 10                	mov    BYTE PTR [eax],dl
 310034f:	e9 a5 00 00 00       	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:153
		    }
		  else if (*input == '\\')
 3100354:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100357:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310035a:	3c 5c                	cmp    al,0x5c
 310035c:	75 0c                	jne    310036a <buildargv+0x10c>
/home/yogi/src/os/kshell/kshell.c:155
		    {
		      bsquote = 1;
 310035e:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 3100365:	e9 8f 00 00 00       	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:157
		    }
		  else if (squote)
 310036a:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 310036e:	74 26                	je     3100396 <buildargv+0x138>
/home/yogi/src/os/kshell/kshell.c:159
		    {
		      if (*input == '\'')
 3100370:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100373:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100376:	3c 27                	cmp    al,0x27
 3100378:	75 09                	jne    3100383 <buildargv+0x125>
/home/yogi/src/os/kshell/kshell.c:161
			{
			  squote = 0;
 310037a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100381:	eb 76                	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:165
			}
		      else
			{
			  *arg++ = *input;
 3100383:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100386:	8d 50 01             	lea    edx,[eax+0x1]
 3100389:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310038c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310038f:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100392:	88 10                	mov    BYTE PTR [eax],dl
 3100394:	eb 63                	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:168
			}
		    }
		  else if (dquote)
 3100396:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 310039a:	74 26                	je     31003c2 <buildargv+0x164>
/home/yogi/src/os/kshell/kshell.c:170
		    {
		      if (*input == '"')
 310039c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310039f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003a2:	3c 22                	cmp    al,0x22
 31003a4:	75 09                	jne    31003af <buildargv+0x151>
/home/yogi/src/os/kshell/kshell.c:172
			{
			  dquote = 0;
 31003a6:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 31003ad:	eb 4a                	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:176
			}
		      else
			{
			  *arg++ = *input;
 31003af:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31003b2:	8d 50 01             	lea    edx,[eax+0x1]
 31003b5:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31003b8:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31003bb:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31003be:	88 10                	mov    BYTE PTR [eax],dl
 31003c0:	eb 37                	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:181
			}
		    }
		  else
		    {
		      if (*input == '\'')
 31003c2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003c5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003c8:	3c 27                	cmp    al,0x27
 31003ca:	75 09                	jne    31003d5 <buildargv+0x177>
/home/yogi/src/os/kshell/kshell.c:183
			{
			  squote = 1;
 31003cc:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 31003d3:	eb 24                	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:185
			}
		      else if (*input == '"')
 31003d5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003d8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003db:	3c 22                	cmp    al,0x22
 31003dd:	75 09                	jne    31003e8 <buildargv+0x18a>
/home/yogi/src/os/kshell/kshell.c:187
			{
			  dquote = 1;
 31003df:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 31003e6:	eb 11                	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:191
			}
		      else
			{
			  *arg++ = *input;
 31003e8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31003eb:	8d 50 01             	lea    edx,[eax+0x1]
 31003ee:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31003f1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31003f4:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31003f7:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/kshell/kshell.c:195
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 31003f9:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/kshell/kshell.c:140
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 31003fd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100400:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100403:	84 c0                	test   al,al
 3100405:	0f 85 06 ff ff ff    	jne    3100311 <buildargv+0xb3>
/home/yogi/src/os/kshell/kshell.c:198
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 310040b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310040e:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:200
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100411:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100414:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100417:	84 c0                	test   al,al
 3100419:	0f 84 9e 00 00 00    	je     31004bd <buildargv+0x25f>
/home/yogi/src/os/kshell/kshell.c:202
          {
            char* temp=malloc(strlen(copybuf)+1);
 310041f:	83 ec 0c             	sub    esp,0xc
 3100422:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100425:	e8 e6 05 00 00       	call   3100a10 <kShell+0x2c1>
 310042a:	83 c4 10             	add    esp,0x10
 310042d:	83 c0 01             	add    eax,0x1
 3100430:	83 ec 0c             	sub    esp,0xc
 3100433:	50                   	push   eax
 3100434:	e8 67 05 00 00       	call   31009a0 <kShell+0x251>
 3100439:	83 c4 10             	add    esp,0x10
 310043c:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/kshell/kshell.c:205
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 310043f:	83 ec 08             	sub    esp,0x8
 3100442:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100445:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100448:	e8 03 05 00 00       	call   3100950 <kShell+0x201>
 310044d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:206
            free(copybuf);
 3100450:	83 ec 0c             	sub    esp,0xc
 3100453:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100456:	e8 c5 05 00 00       	call   3100a20 <kShell+0x2d1>
 310045b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:207
            copybuf = (char *) malloc (strlen (input) + 1);
 310045e:	83 ec 0c             	sub    esp,0xc
 3100461:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100464:	e8 a7 05 00 00       	call   3100a10 <kShell+0x2c1>
 3100469:	83 c4 10             	add    esp,0x10
 310046c:	83 c0 01             	add    eax,0x1
 310046f:	83 ec 0c             	sub    esp,0xc
 3100472:	50                   	push   eax
 3100473:	e8 28 05 00 00       	call   31009a0 <kShell+0x251>
 3100478:	83 c4 10             	add    esp,0x10
 310047b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:208
            argv[argc] = temp;
 310047e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100481:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100488:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 310048b:	01 c2                	add    edx,eax
 310048d:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 3100490:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/kshell/kshell.c:210
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 3100492:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/kshell/kshell.c:211
            argv[argc] = NULL;
 3100496:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100499:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31004a0:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31004a3:	01 d0                	add    eax,edx
 31004a5:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:212
            input++;
 31004ab:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/kshell/kshell.c:213
            free(temp);
 31004af:	83 ec 0c             	sub    esp,0xc
 31004b2:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 31004b5:	e8 66 05 00 00       	call   3100a20 <kShell+0x2d1>
 31004ba:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:216
          }
	}
      while (*input != EOS);
 31004bd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31004c0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31004c3:	84 c0                	test   al,al
 31004c5:	0f 85 ed fd ff ff    	jne    31002b8 <buildargv+0x5a>
/home/yogi/src/os/kshell/kshell.c:219
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 31004cb:	83 ec 0c             	sub    esp,0xc
 31004ce:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31004d1:	e8 4a 05 00 00       	call   3100a20 <kShell+0x2d1>
 31004d6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:220
  free(nargv);
 31004d9:	83 ec 0c             	sub    esp,0xc
 31004dc:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 31004df:	e8 3c 05 00 00       	call   3100a20 <kShell+0x2d1>
 31004e4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:221
  return (argv);
 31004e7:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/kshell/kshell.c:222
}
 31004ea:	c9                   	leave  
 31004eb:	c3                   	ret    

031004ec <helpMe>:
helpMe():
/home/yogi/src/os/kshell/kshell.c:225

void helpMe()
{
 31004ec:	55                   	push   ebp
 31004ed:	89 e5                	mov    ebp,esp
 31004ef:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:226
    print("Help:\n");
 31004f2:	83 ec 0c             	sub    esp,0xc
 31004f5:	68 b4 0a 10 03       	push   0x3100ab4
 31004fa:	e8 71 04 00 00       	call   3100970 <kShell+0x221>
 31004ff:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:227
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100502:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100509:	eb 30                	jmp    310053b <helpMe+0x4f>
/home/yogi/src/os/kshell/kshell.c:228 (discriminator 3)
        print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 310050b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310050e:	c1 e0 04             	shl    eax,0x4
 3100511:	05 a4 0f 10 03       	add    eax,0x3100fa4
 3100516:	8b 10                	mov    edx,DWORD PTR [eax]
 3100518:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310051b:	c1 e0 04             	shl    eax,0x4
 310051e:	05 a0 0f 10 03       	add    eax,0x3100fa0
 3100523:	8b 00                	mov    eax,DWORD PTR [eax]
 3100525:	83 ec 04             	sub    esp,0x4
 3100528:	52                   	push   edx
 3100529:	50                   	push   eax
 310052a:	68 bb 0a 10 03       	push   0x3100abb
 310052f:	e8 3c 04 00 00       	call   3100970 <kShell+0x221>
 3100534:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:227 (discriminator 3)
}

void helpMe()
{
    print("Help:\n");
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100537:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:227 (discriminator 1)
 310053b:	83 7d f4 03          	cmp    DWORD PTR [ebp-0xc],0x3
 310053f:	76 ca                	jbe    310050b <helpMe+0x1f>
/home/yogi/src/os/kshell/kshell.c:229
        print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
}
 3100541:	90                   	nop
 3100542:	c9                   	leave  
 3100543:	c3                   	ret    

03100544 <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/kshell/kshell.c:232

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH])
{
 3100544:	55                   	push   ebp
 3100545:	89 e5                	mov    ebp,esp
 3100547:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:233
    char** pptr=malloc(sizeof(char*)*pcount);
 310054a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310054d:	c1 e0 02             	shl    eax,0x2
 3100550:	83 ec 0c             	sub    esp,0xc
 3100553:	50                   	push   eax
 3100554:	e8 47 04 00 00       	call   31009a0 <kShell+0x251>
 3100559:	83 c4 10             	add    esp,0x10
 310055c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:235
    
    for (int cnt=0;cnt<pcount;cnt++)
 310055f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100566:	eb 4d                	jmp    31005b5 <paramsToArgv+0x71>
/home/yogi/src/os/kshell/kshell.c:237 (discriminator 3)
    {
        *pptr=malloc(MAX_PARAM_WIDTH);
 3100568:	83 ec 0c             	sub    esp,0xc
 310056b:	68 00 02 00 00       	push   0x200
 3100570:	e8 2b 04 00 00       	call   31009a0 <kShell+0x251>
 3100575:	83 c4 10             	add    esp,0x10
 3100578:	89 c2                	mov    edx,eax
 310057a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310057d:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/kshell/kshell.c:238 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt][0],MAX_PARAM_WIDTH);
 310057f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100582:	c1 e0 09             	shl    eax,0x9
 3100585:	89 c2                	mov    edx,eax
 3100587:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310058a:	01 d0                	add    eax,edx
 310058c:	89 c1                	mov    ecx,eax
 310058e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100591:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100598:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310059b:	01 d0                	add    eax,edx
 310059d:	8b 00                	mov    eax,DWORD PTR [eax]
 310059f:	83 ec 04             	sub    esp,0x4
 31005a2:	68 00 02 00 00       	push   0x200
 31005a7:	51                   	push   ecx
 31005a8:	50                   	push   eax
 31005a9:	e8 e2 03 00 00       	call   3100990 <kShell+0x241>
 31005ae:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:235 (discriminator 3)

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH])
{
    char** pptr=malloc(sizeof(char*)*pcount);
    
    for (int cnt=0;cnt<pcount;cnt++)
 31005b1:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:235 (discriminator 1)
 31005b5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005b8:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 31005bb:	7c ab                	jl     3100568 <paramsToArgv+0x24>
/home/yogi/src/os/kshell/kshell.c:240
    {
        *pptr=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt][0],MAX_PARAM_WIDTH);
    }
}
 31005bd:	90                   	nop
 31005be:	c9                   	leave  
 31005bf:	c3                   	ret    

031005c0 <freeArgV>:
freeArgV():
/home/yogi/src/os/kshell/kshell.c:243

void freeArgV(int pcount, char **params)
{
 31005c0:	55                   	push   ebp
 31005c1:	89 e5                	mov    ebp,esp
 31005c3:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:244
    for (int cnt=0;cnt<pcount;cnt++)
 31005c6:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31005cd:	eb 15                	jmp    31005e4 <freeArgV+0x24>
/home/yogi/src/os/kshell/kshell.c:245 (discriminator 3)
        free(*params);
 31005cf:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31005d2:	8b 00                	mov    eax,DWORD PTR [eax]
 31005d4:	83 ec 0c             	sub    esp,0xc
 31005d7:	50                   	push   eax
 31005d8:	e8 43 04 00 00       	call   3100a20 <kShell+0x2d1>
 31005dd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:244 (discriminator 3)
    }
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 31005e0:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:244 (discriminator 1)
 31005e4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005e7:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 31005ea:	7c e3                	jl     31005cf <freeArgV+0xf>
/home/yogi/src/os/kshell/kshell.c:246
        free(*params);
    free(params);
 31005ec:	83 ec 0c             	sub    esp,0xc
 31005ef:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31005f2:	e8 29 04 00 00       	call   3100a20 <kShell+0x2d1>
 31005f7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:247
}
 31005fa:	90                   	nop
 31005fb:	c9                   	leave  
 31005fc:	c3                   	ret    

031005fd <execp>:
execp():
/home/yogi/src/os/kshell/kshell.c:250

void execp(char* cmdline)
{
 31005fd:	55                   	push   ebp
 31005fe:	89 e5                	mov    ebp,esp
 3100600:	53                   	push   ebx
 3100601:	81 ec 14 14 00 00    	sub    esp,0x1414
/home/yogi/src/os/kshell/kshell.c:252
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 3100607:	83 ec 04             	sub    esp,0x4
 310060a:	68 00 14 00 00       	push   0x1400
 310060f:	8d 85 ec eb ff ff    	lea    eax,[ebp-0x1414]
 3100615:	50                   	push   eax
 3100616:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100619:	e8 8d fa ff ff       	call   31000ab <parseParamsShell>
 310061e:	83 c4 10             	add    esp,0x10
 3100621:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:253
    uint32_t pid=0;
 3100624:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:255

    uint32_t prms=(uint32_t)paramsToArgv(paramCount-1,&params[1][MAX_PARAM_WIDTH]);
 310062b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310062e:	83 e8 01             	sub    eax,0x1
 3100631:	83 ec 08             	sub    esp,0x8
 3100634:	8d 95 ec eb ff ff    	lea    edx,[ebp-0x1414]
 310063a:	81 c2 00 04 00 00    	add    edx,0x400
 3100640:	52                   	push   edx
 3100641:	50                   	push   eax
 3100642:	e8 fd fe ff ff       	call   3100544 <paramsToArgv>
 3100647:	83 c4 10             	add    esp,0x10
 310064a:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/kshell/kshell.c:264
            "push ebx\n"
            "push ecx\n"
            "push edx\n"
            "int 0x80\n"
            :"=a" (pid)
            :"a" (0x59),"b" (params[0]),"c" (paramCount-1),"d" (prms));
 310064d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100650:	8d 48 ff             	lea    ecx,[eax-0x1]
/home/yogi/src/os/kshell/kshell.c:258
    uint32_t pid=0;

    uint32_t prms=(uint32_t)paramsToArgv(paramCount-1,&params[1][MAX_PARAM_WIDTH]);
    
    //print("Executing %s\n",params[0]);
    __asm__("push eax\n"
 3100653:	b8 59 00 00 00       	mov    eax,0x59
 3100658:	8d 9d ec eb ff ff    	lea    ebx,[ebp-0x1414]
 310065e:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 3100661:	50                   	push   eax
 3100662:	53                   	push   ebx
 3100663:	51                   	push   ecx
 3100664:	52                   	push   edx
 3100665:	cd 80                	int    0x80
 3100667:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:266
            "push edx\n"
            "int 0x80\n"
            :"=a" (pid)
            :"a" (0x59),"b" (params[0]),"c" (paramCount-1),"d" (prms));
    //print("Waiting on pid=0x%08X\n",pid);
    waitpid(pid);
 310066a:	83 ec 0c             	sub    esp,0xc
 310066d:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100670:	e8 eb 02 00 00       	call   3100960 <kShell+0x211>
 3100675:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:270
    //print("pid=0x%08X returned\n",pid);
    //exec(params[0],0,0);
    //strcpy(sExecutingProgram,params[0]+1);
    freeArgV(paramCount, (char**)prms);
 3100678:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 310067b:	83 ec 08             	sub    esp,0x8
 310067e:	50                   	push   eax
 310067f:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100682:	e8 39 ff ff ff       	call   31005c0 <freeArgV>
 3100687:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:271
}
 310068a:	90                   	nop
 310068b:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 310068e:	c9                   	leave  
 310068f:	c3                   	ret    

03100690 <kSleep>:
kSleep():
/home/yogi/src/os/kshell/kshell.c:274

void kSleep(char *cmdline)
{
 3100690:	55                   	push   ebp
 3100691:	89 e5                	mov    ebp,esp
 3100693:	81 ec 18 14 00 00    	sub    esp,0x1418
/home/yogi/src/os/kshell/kshell.c:276
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 3100699:	83 ec 04             	sub    esp,0x4
 310069c:	68 00 14 00 00       	push   0x1400
 31006a1:	8d 85 f4 eb ff ff    	lea    eax,[ebp-0x140c]
 31006a7:	50                   	push   eax
 31006a8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31006ab:	e8 fb f9 ff ff       	call   31000ab <parseParamsShell>
 31006b0:	83 c4 10             	add    esp,0x10
 31006b3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:278

    if (params[0][0]==0)
 31006b6:	0f b6 85 f4 eb ff ff 	movzx  eax,BYTE PTR [ebp-0x140c]
 31006bd:	84 c0                	test   al,al
 31006bf:	75 12                	jne    31006d3 <kSleep+0x43>
/home/yogi/src/os/kshell/kshell.c:280
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 31006c1:	83 ec 0c             	sub    esp,0xc
 31006c4:	68 c4 0a 10 03       	push   0x3100ac4
 31006c9:	e8 a2 02 00 00       	call   3100970 <kShell+0x221>
 31006ce:	83 c4 10             	add    esp,0x10
 31006d1:	eb 22                	jmp    31006f5 <kSleep+0x65>
/home/yogi/src/os/kshell/kshell.c:284
        return;
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 31006d3:	83 ec 04             	sub    esp,0x4
 31006d6:	6a 0a                	push   0xa
 31006d8:	6a 00                	push   0x0
 31006da:	8d 85 f4 eb ff ff    	lea    eax,[ebp-0x140c]
 31006e0:	50                   	push   eax
 31006e1:	e8 da 02 00 00       	call   31009c0 <kShell+0x271>
 31006e6:	83 c4 10             	add    esp,0x10
 31006e9:	83 ec 0c             	sub    esp,0xc
 31006ec:	50                   	push   eax
 31006ed:	e8 be 02 00 00       	call   31009b0 <kShell+0x261>
 31006f2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:285
}
 31006f5:	c9                   	leave  
 31006f6:	c3                   	ret    

031006f7 <kExit>:
kExit():
/home/yogi/src/os/kshell/kshell.c:288

void kExit(char *cmdline)
{
 31006f7:	55                   	push   ebp
 31006f8:	89 e5                	mov    ebp,esp
 31006fa:	81 ec 08 14 00 00    	sub    esp,0x1408
/home/yogi/src/os/kshell/kshell.c:291
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 3100700:	83 ec 04             	sub    esp,0x4
 3100703:	68 00 14 00 00       	push   0x1400
 3100708:	8d 85 f8 eb ff ff    	lea    eax,[ebp-0x1408]
 310070e:	50                   	push   eax
 310070f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100712:	e8 94 f9 ff ff       	call   31000ab <parseParamsShell>
 3100717:	83 c4 10             	add    esp,0x10
 310071a:	85 c0                	test   eax,eax
 310071c:	74 1d                	je     310073b <kExit+0x44>
/home/yogi/src/os/kshell/kshell.c:293
    {
        exitCode = strtoul(params[0],0,10);
 310071e:	83 ec 04             	sub    esp,0x4
 3100721:	6a 0a                	push   0xa
 3100723:	6a 00                	push   0x0
 3100725:	8d 85 f8 eb ff ff    	lea    eax,[ebp-0x1408]
 310072b:	50                   	push   eax
 310072c:	e8 8f 02 00 00       	call   31009c0 <kShell+0x271>
 3100731:	83 c4 10             	add    esp,0x10
 3100734:	a3 c4 10 10 03       	mov    ds:0x31010c4,eax
 3100739:	eb 0a                	jmp    3100745 <kExit+0x4e>
/home/yogi/src/os/kshell/kshell.c:296
    }
    else
        exitCode = 0;
 310073b:	c7 05 c4 10 10 03 00 	mov    DWORD PTR ds:0x31010c4,0x0
 3100742:	00 00 00 
/home/yogi/src/os/kshell/kshell.c:297
    timeToExit=true;
 3100745:	c6 05 c0 10 10 03 01 	mov    BYTE PTR ds:0x31010c0,0x1
/home/yogi/src/os/kshell/kshell.c:298
}
 310074c:	90                   	nop
 310074d:	c9                   	leave  
 310074e:	c3                   	ret    

0310074f <kShell>:
kShell():
/home/yogi/src/os/kshell/kshell.c:301

int kShell(int argc, char** argv)
{
 310074f:	55                   	push   ebp
 3100750:	89 e5                	mov    ebp,esp
 3100752:	81 ec f8 0a 00 00    	sub    esp,0xaf8
/home/yogi/src/os/kshell/kshell.c:303
    char lCommand[256];
    uint8_t lCurrKey=0;
 3100758:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:304
    int lCurrKeyCount=0;
 310075f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/kshell/kshell.c:306
    char commands[50][50];
    int commandsPtr=0;
 3100766:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:307
    int commandBuffPtr=0;
 310076d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/kshell/kshell.c:308
    int commandWasFromThisBufferPtr=0;
 3100774:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:311
    char ansiSeq[20];

    libc_init();
 310077b:	e8 50 02 00 00       	call   31009d0 <kShell+0x281>
/home/yogi/src/os/kshell/kshell.c:312
    ansiSeq[0]=0x1b;
 3100780:	c6 85 0b f5 ff ff 1b 	mov    BYTE PTR [ebp-0xaf5],0x1b
/home/yogi/src/os/kshell/kshell.c:313
    sKShellProgramName=malloc(1024);
 3100787:	83 ec 0c             	sub    esp,0xc
 310078a:	68 00 04 00 00       	push   0x400
 310078f:	e8 0c 02 00 00       	call   31009a0 <kShell+0x251>
 3100794:	83 c4 10             	add    esp,0x10
 3100797:	a3 00 13 10 03       	mov    ds:0x3101300,eax
/home/yogi/src/os/kshell/kshell.c:314
    strcpy(sKShellProgramName,"kShell");
 310079c:	a1 00 13 10 03       	mov    eax,ds:0x3101300
 31007a1:	83 ec 08             	sub    esp,0x8
 31007a4:	68 02 0b 10 03       	push   0x3100b02
 31007a9:	50                   	push   eax
 31007aa:	e8 a1 01 00 00       	call   3100950 <kShell+0x201>
 31007af:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:315
    strcpy(sExecutingProgram,sKShellProgramName);
 31007b2:	a1 00 13 10 03       	mov    eax,ds:0x3101300
 31007b7:	83 ec 08             	sub    esp,0x8
 31007ba:	50                   	push   eax
 31007bb:	68 e0 10 10 03       	push   0x31010e0
 31007c0:	e8 8b 01 00 00       	call   3100950 <kShell+0x201>
 31007c5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:318
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 31007c8:	e9 51 01 00 00       	jmp    310091e <kShell+0x1cf>
/home/yogi/src/os/kshell/kshell.c:321
    {
getACommand:
        lCurrKey=0;
 31007cd:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:322
        lCurrKeyCount=0;
 31007d4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/kshell/kshell.c:323
        memset(lCommand,0,256);
 31007db:	83 ec 04             	sub    esp,0x4
 31007de:	68 00 01 00 00       	push   0x100
 31007e3:	6a 00                	push   0x0
 31007e5:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 31007eb:	50                   	push   eax
 31007ec:	e8 ff 01 00 00       	call   31009f0 <kShell+0x2a1>
 31007f1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:324
        print("%s> ",sExecutingProgram);
 31007f4:	83 ec 08             	sub    esp,0x8
 31007f7:	68 e0 10 10 03       	push   0x31010e0
 31007fc:	68 09 0b 10 03       	push   0x3100b09
 3100801:	e8 6a 01 00 00       	call   3100970 <kShell+0x221>
 3100806:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:326
getAKey:
        lCurrKey=0;
 3100809:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:327
        while(lCurrKey==0)
 3100810:	eb 16                	jmp    3100828 <kShell+0xd9>
/home/yogi/src/os/kshell/kshell.c:329
        {
            gets(&lCurrKey,1,1);
 3100812:	83 ec 04             	sub    esp,0x4
 3100815:	6a 01                	push   0x1
 3100817:	6a 01                	push   0x1
 3100819:	8d 85 e3 fe ff ff    	lea    eax,[ebp-0x11d]
 310081f:	50                   	push   eax
 3100820:	e8 5b 01 00 00       	call   3100980 <kShell+0x231>
 3100825:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:327
        lCurrKeyCount=0;
        memset(lCommand,0,256);
        print("%s> ",sExecutingProgram);
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 3100828:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 310082f:	84 c0                	test   al,al
 3100831:	74 df                	je     3100812 <kShell+0xc3>
/home/yogi/src/os/kshell/kshell.c:332
        {
            gets(&lCurrKey,1,1);
        }
        //print("key='%08X'",lCurrKey);
        if((byte)lCurrKey==0xc8) //up
 3100833:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 310083a:	3c c8                	cmp    al,0xc8
 310083c:	75 08                	jne    3100846 <kShell+0xf7>
/home/yogi/src/os/kshell/kshell.c:334
        {
            if (commandBuffPtr>=0)
 310083e:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100842:	79 02                	jns    3100846 <kShell+0xf7>
/home/yogi/src/os/kshell/kshell.c:347
                lCurrKeyCount=strlen(lCommand);
                cursorMoveTo(4+lCurrKeyCount,lTemp);
                goto getAKey;*/
            }
            else
                goto getAKey;
 3100844:	eb c3                	jmp    3100809 <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:349
        }
        if (lCurrKey==0xD0)  //down
 3100846:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 310084d:	3c d0                	cmp    al,0xd0
 310084f:	75 0a                	jne    310085b <kShell+0x10c>
/home/yogi/src/os/kshell/kshell.c:351
        {
            if (commandBuffPtr<=commandsPtr)
 3100851:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100854:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 3100857:	7e 02                	jle    310085b <kShell+0x10c>
/home/yogi/src/os/kshell/kshell.c:364
                lCurrKeyCount=strlen(lCommand);
                cursorMoveTo(4+lCurrKeyCount,lTemp);
                goto getAKey;*/
            }
            else
                goto getAKey;
 3100859:	eb ae                	jmp    3100809 <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:367
            
        }   
        if (lCurrKey==0xcb) //left
 310085b:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100862:	3c cb                	cmp    al,0xcb
 3100864:	75 02                	jne    3100868 <kShell+0x119>
/home/yogi/src/os/kshell/kshell.c:376
            {
                cursorMoveTo(cursorGetPosX()-1,cursorGetPosY());
                lCurrKeyCount--;
            }
             */
            goto getAKey;
 3100866:	eb a1                	jmp    3100809 <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:378
        }
        if (lCurrKey=='\b')
 3100868:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 310086f:	3c 08                	cmp    al,0x8
 3100871:	75 15                	jne    3100888 <kShell+0x139>
/home/yogi/src/os/kshell/kshell.c:380
        {
            if (lCurrKeyCount>0)
 3100873:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100877:	7e 90                	jle    3100809 <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:382
            {
                putc('\b');
 3100879:	83 ec 0c             	sub    esp,0xc
 310087c:	6a 08                	push   0x8
 310087e:	e8 7d 01 00 00       	call   3100a00 <kShell+0x2b1>
 3100883:	83 c4 10             	add    esp,0x10
 3100886:	eb 81                	jmp    3100809 <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:394
                cursorMoveTo(cursorGetPosX()-1,lTemp);*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
 3100888:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 310088f:	3c 0a                	cmp    al,0xa
 3100891:	74 1c                	je     31008af <kShell+0x160>
/home/yogi/src/os/kshell/kshell.c:400
        {
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3100893:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100896:	8d 50 01             	lea    edx,[eax+0x1]
 3100899:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310089c:	0f b6 95 e3 fe ff ff 	movzx  edx,BYTE PTR [ebp-0x11d]
 31008a3:	88 94 05 e4 fe ff ff 	mov    BYTE PTR [ebp+eax*1-0x11c],dl
/home/yogi/src/os/kshell/kshell.c:402
        }
        goto getAKey;
 31008aa:	e9 5a ff ff ff       	jmp    3100809 <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:396
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
        {
            goto doneGettingKeys;
 31008af:	90                   	nop
/home/yogi/src/os/kshell/kshell.c:405
            lCommand[lCurrKeyCount++]=lCurrKey;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 31008b0:	0f b6 85 e4 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11c]
 31008b7:	84 c0                	test   al,al
 31008b9:	75 05                	jne    31008c0 <kShell+0x171>
/home/yogi/src/os/kshell/kshell.c:406
            goto getACommand;
 31008bb:	e9 0d ff ff ff       	jmp    31007cd <kShell+0x7e>
/home/yogi/src/os/kshell/kshell.c:407
        int i = findCommand(lCommand);
 31008c0:	83 ec 0c             	sub    esp,0xc
 31008c3:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 31008c9:	50                   	push   eax
 31008ca:	e8 26 f9 ff ff       	call   31001f5 <findCommand>
 31008cf:	83 c4 10             	add    esp,0x10
 31008d2:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/kshell/kshell.c:409

        execInternalCommand(lCommand);
 31008d5:	83 ec 0c             	sub    esp,0xc
 31008d8:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 31008de:	50                   	push   eax
 31008df:	e8 1c f7 ff ff       	call   3100000 <execInternalCommand>
 31008e4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:410
        if(i>0)
 31008e7:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 31008eb:	7e 31                	jle    310091e <kShell+0x1cf>
/home/yogi/src/os/kshell/kshell.c:412
        {
            i--;
 31008ed:	83 6d e4 01          	sub    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/kshell/kshell.c:421
//                for (int cnt=commandWasFromThisBufferPtr;cnt<=commandsPtr;cnt++)
//                    strcpy(commands[cnt],commands[cnt+1]);
//                commandWasFromThisBufferPtr=0;
//                commandsPtr--;
            }
            strcpy(commands[commandsPtr++],lCommand);
 31008f1:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31008f4:	8d 50 01             	lea    edx,[eax+0x1]
 31008f7:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 31008fa:	8d 95 1f f5 ff ff    	lea    edx,[ebp-0xae1]
 3100900:	6b c0 32             	imul   eax,eax,0x32
 3100903:	01 c2                	add    edx,eax
 3100905:	83 ec 08             	sub    esp,0x8
 3100908:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 310090e:	50                   	push   eax
 310090f:	52                   	push   edx
 3100910:	e8 3b 00 00 00       	call   3100950 <kShell+0x201>
 3100915:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:422
            commandBuffPtr=commandsPtr;
 3100918:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310091b:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/kshell/kshell.c:318
    sKShellProgramName=malloc(1024);
    strcpy(sKShellProgramName,"kShell");
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 310091e:	0f b6 05 c0 10 10 03 	movzx  eax,BYTE PTR ds:0x31010c0
 3100925:	83 f0 01             	xor    eax,0x1
 3100928:	84 c0                	test   al,al
 310092a:	0f 85 9d fe ff ff    	jne    31007cd <kShell+0x7e>
/home/yogi/src/os/kshell/kshell.c:425
            }
            strcpy(commands[commandsPtr++],lCommand);
            commandBuffPtr=commandsPtr;
        }
    }
    return exitCode;
 3100930:	a1 c4 10 10 03       	mov    eax,ds:0x31010c4
/home/yogi/src/os/kshell/kshell.c:426
}
 3100935:	c9                   	leave  
 3100936:	c3                   	ret    

Disassembly of section .plt:

03100940 <.plt>:
 3100940:	ff 35 74 10 10 03    	push   DWORD PTR ds:0x3101074
 3100946:	ff 25 78 10 10 03    	jmp    DWORD PTR ds:0x3101078
 310094c:	00 00                	add    BYTE PTR [eax],al
 310094e:	00 00                	add    BYTE PTR [eax],al
 3100950:	ff 25 7c 10 10 03    	jmp    DWORD PTR ds:0x310107c
 3100956:	68 00 00 00 00       	push   0x0
 310095b:	e9 e0 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 3100960:	ff 25 80 10 10 03    	jmp    DWORD PTR ds:0x3101080
 3100966:	68 08 00 00 00       	push   0x8
 310096b:	e9 d0 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 3100970:	ff 25 84 10 10 03    	jmp    DWORD PTR ds:0x3101084
 3100976:	68 10 00 00 00       	push   0x10
 310097b:	e9 c0 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 3100980:	ff 25 88 10 10 03    	jmp    DWORD PTR ds:0x3101088
 3100986:	68 18 00 00 00       	push   0x18
 310098b:	e9 b0 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 3100990:	ff 25 8c 10 10 03    	jmp    DWORD PTR ds:0x310108c
 3100996:	68 20 00 00 00       	push   0x20
 310099b:	e9 a0 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 31009a0:	ff 25 90 10 10 03    	jmp    DWORD PTR ds:0x3101090
 31009a6:	68 28 00 00 00       	push   0x28
 31009ab:	e9 90 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 31009b0:	ff 25 94 10 10 03    	jmp    DWORD PTR ds:0x3101094
 31009b6:	68 30 00 00 00       	push   0x30
 31009bb:	e9 80 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 31009c0:	ff 25 98 10 10 03    	jmp    DWORD PTR ds:0x3101098
 31009c6:	68 38 00 00 00       	push   0x38
 31009cb:	e9 70 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 31009d0:	ff 25 9c 10 10 03    	jmp    DWORD PTR ds:0x310109c
 31009d6:	68 40 00 00 00       	push   0x40
 31009db:	e9 60 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 31009e0:	ff 25 a0 10 10 03    	jmp    DWORD PTR ds:0x31010a0
 31009e6:	68 48 00 00 00       	push   0x48
 31009eb:	e9 50 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 31009f0:	ff 25 a4 10 10 03    	jmp    DWORD PTR ds:0x31010a4
 31009f6:	68 50 00 00 00       	push   0x50
 31009fb:	e9 40 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 3100a00:	ff 25 a8 10 10 03    	jmp    DWORD PTR ds:0x31010a8
 3100a06:	68 58 00 00 00       	push   0x58
 3100a0b:	e9 30 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 3100a10:	ff 25 ac 10 10 03    	jmp    DWORD PTR ds:0x31010ac
 3100a16:	68 60 00 00 00       	push   0x60
 3100a1b:	e9 20 ff ff ff       	jmp    3100940 <kShell+0x1f1>
 3100a20:	ff 25 b0 10 10 03    	jmp    DWORD PTR ds:0x31010b0
 3100a26:	68 68 00 00 00       	push   0x68
 3100a2b:	e9 10 ff ff ff       	jmp    3100940 <kShell+0x1f1>

Disassembly of section .rodata:

03100a30 <.rodata>:
 3100a30:	68 65 6c 70 00       	push   0x706c65
 3100a35:	47                   	inc    edi
 3100a36:	65                   	gs
 3100a37:	74 20                	je     3100a59 <kShell+0x30a>
 3100a39:	68 65 6c 70 20       	push   0x20706c65
 3100a3e:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3100a42:	73 20                	jae    3100a64 <kShell+0x315>
 3100a44:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3100a4b:	74 69                	je     3100ab6 <kShell+0x367>
 3100a4d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100a4e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100a4f:	29 00                	sub    DWORD PTR [eax],eax
 3100a51:	65                   	gs
 3100a52:	78 65                	js     3100ab9 <kShell+0x36a>
 3100a54:	63 00                	arpl   WORD PTR [eax],ax
 3100a56:	45                   	inc    ebp
 3100a57:	78 65                	js     3100abe <kShell+0x36f>
 3100a59:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3100a5c:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3100a60:	70 72                	jo     3100ad4 <kShell+0x385>
 3100a62:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100a63:	67 72 61             	addr16 jb 3100ac7 <kShell+0x378>
 3100a66:	6d                   	ins    DWORD PTR es:[edi],dx
 3100a67:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3100a6a:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 3100a71:	20 
 3100a72:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3100a76:	6c                   	ins    BYTE PTR es:[edi],dx
 3100a77:	6c                   	ins    BYTE PTR es:[edi],dx
 3100a78:	00 73 6c             	add    BYTE PTR [ebx+0x6c],dh
 3100a7b:	65                   	gs
 3100a7c:	65                   	gs
 3100a7d:	70 00                	jo     3100a7f <kShell+0x330>
 3100a7f:	53                   	push   ebx
 3100a80:	6c                   	ins    BYTE PTR es:[edi],dx
 3100a81:	65                   	gs
 3100a82:	65                   	gs
 3100a83:	70 20                	jo     3100aa5 <kShell+0x356>
 3100a85:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3100a87:	72 20                	jb     3100aa9 <kShell+0x35a>
 3100a89:	78 20                	js     3100aab <kShell+0x35c>
 3100a8b:	73 65                	jae    3100af2 <kShell+0x3a3>
 3100a8d:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100a90:	64                   	fs
 3100a91:	73 00                	jae    3100a93 <kShell+0x344>
 3100a93:	00 49 6e             	add    BYTE PTR [ecx+0x6e],cl
 3100a96:	76 61                	jbe    3100af9 <kShell+0x3aa>
 3100a98:	6c                   	ins    BYTE PTR es:[edi],dx
 3100a99:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 3100aa0:	61 
 3100aa1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100aa2:	64 20 27             	and    BYTE PTR fs:[edi],ah
 3100aa5:	25 73 27 20 79       	and    eax,0x79202773
 3100aaa:	61                   	popa   
 3100aab:	20 64 75 6d          	and    BYTE PTR [ebp+esi*2+0x6d],ah
 3100aaf:	6d                   	ins    DWORD PTR es:[edi],dx
 3100ab0:	79 21                	jns    3100ad3 <kShell+0x384>
 3100ab2:	0a 00                	or     al,BYTE PTR [eax]
 3100ab4:	48                   	dec    eax
 3100ab5:	65                   	gs
 3100ab6:	6c                   	ins    BYTE PTR es:[edi],dx
 3100ab7:	70 3a                	jo     3100af3 <kShell+0x3a4>
 3100ab9:	0a 00                	or     al,BYTE PTR [eax]
 3100abb:	09 25 73 3a 20 25    	or     DWORD PTR ds:0x25203a73,esp
 3100ac1:	73 0a                	jae    3100acd <kShell+0x37e>
 3100ac3:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 3100ac6:	71 75                	jno    3100b3d <kShell+0x3ee>
 3100ac8:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 3100acf:	70 61                	jo     3100b32 <kShell+0x3e3>
 3100ad1:	72 61                	jb     3100b34 <kShell+0x3e5>
 3100ad3:	6d                   	ins    DWORD PTR es:[edi],dx
 3100ad4:	65                   	gs
 3100ad5:	74 65                	je     3100b3c <kShell+0x3ed>
 3100ad7:	72 20                	jb     3100af9 <kShell+0x3aa>
 3100ad9:	77 68                	ja     3100b43 <kShell+0x3f4>
 3100adb:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 3100ae2:	74 68                	je     3100b4c <kShell+0x3fd>
 3100ae4:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 3100ae8:	6d                   	ins    DWORD PTR es:[edi],dx
 3100ae9:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 3100aec:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 3100aef:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 3100af2:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100af5:	64                   	fs
 3100af6:	73 20                	jae    3100b18 <kShell+0x3c9>
 3100af8:	74 6f                	je     3100b69 <kShell+0x41a>
 3100afa:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3100afd:	65                   	gs
 3100afe:	65                   	gs
 3100aff:	70 0a                	jo     3100b0b <kShell+0x3bc>
 3100b01:	00 6b 53             	add    BYTE PTR [ebx+0x53],ch
 3100b04:	68 65 6c 6c 00       	push   0x6c6c65
 3100b09:	25 73 3e 20 00       	and    eax,0x203e73

Disassembly of section .eh_frame:

03100b10 <.eh_frame>:
 3100b10:	14 00                	adc    al,0x0
 3100b12:	00 00                	add    BYTE PTR [eax],al
 3100b14:	00 00                	add    BYTE PTR [eax],al
 3100b16:	00 00                	add    BYTE PTR [eax],al
 3100b18:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3100b1b:	00 01                	add    BYTE PTR [ecx],al
 3100b1d:	7c 08                	jl     3100b27 <kShell+0x3d8>
 3100b1f:	01 1b                	add    DWORD PTR [ebx],ebx
 3100b21:	0c 04                	or     al,0x4
 3100b23:	04 88                	add    al,0x88
 3100b25:	01 00                	add    DWORD PTR [eax],eax
 3100b27:	00 20                	add    BYTE PTR [eax],ah
 3100b29:	00 00                	add    BYTE PTR [eax],al
 3100b2b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100b2e:	00 00                	add    BYTE PTR [eax],al
 3100b30:	d0                   	(bad)  
 3100b31:	f4                   	hlt    
 3100b32:	ff                   	(bad)  
 3100b33:	ff ab 00 00 00 00    	jmp    FWORD PTR [ebx+0x0]
 3100b39:	41                   	inc    ecx
 3100b3a:	0e                   	push   cs
 3100b3b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100b41:	44                   	inc    esp
 3100b42:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100b45:	a3 c5 c3 0c 04       	mov    ds:0x40cc3c5,eax
 3100b4a:	04 00                	add    al,0x0
 3100b4c:	20 00                	and    BYTE PTR [eax],al
 3100b4e:	00 00                	add    BYTE PTR [eax],al
 3100b50:	40                   	inc    eax
 3100b51:	00 00                	add    BYTE PTR [eax],al
 3100b53:	00 57 f5             	add    BYTE PTR [edi-0xb],dl
 3100b56:	ff                   	(bad)  
 3100b57:	ff 4a 01             	dec    DWORD PTR [edx+0x1]
 3100b5a:	00 00                	add    BYTE PTR [eax],al
 3100b5c:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100b5f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100b65:	44                   	inc    esp
 3100b66:	83 03 03             	add    DWORD PTR [ebx],0x3
 3100b69:	42                   	inc    edx
 3100b6a:	01 c5                	add    ebp,eax
 3100b6c:	c3                   	ret    
 3100b6d:	0c 04                	or     al,0x4
 3100b6f:	04 1c                	add    al,0x1c
 3100b71:	00 00                	add    BYTE PTR [eax],al
 3100b73:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
 3100b77:	00 7d f6             	add    BYTE PTR [ebp-0xa],bh
 3100b7a:	ff                   	(bad)  
 3100b7b:	ff 69 00             	jmp    FWORD PTR [ecx+0x0]
 3100b7e:	00 00                	add    BYTE PTR [eax],al
 3100b80:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100b83:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100b89:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3100b8c:	0c 04                	or     al,0x4
 3100b8e:	04 00                	add    al,0x0
 3100b90:	1c 00                	sbb    al,0x0
 3100b92:	00 00                	add    BYTE PTR [eax],al
 3100b94:	84 00                	test   BYTE PTR [eax],al
 3100b96:	00 00                	add    BYTE PTR [eax],al
 3100b98:	c6                   	(bad)  
 3100b99:	f6 ff                	idiv   bh
 3100b9b:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 3100ba1:	41                   	inc    ecx
 3100ba2:	0e                   	push   cs
 3100ba3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100ba9:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 3100baf:	04 1c                	add    al,0x1c
 3100bb1:	00 00                	add    BYTE PTR [eax],al
 3100bb3:	00 a4 00 00 00 34 f9 	add    BYTE PTR [eax+eax*1-0x6cc0000],ah
 3100bba:	ff                   	(bad)  
 3100bbb:	ff 58 00             	call   FWORD PTR [eax+0x0]
 3100bbe:	00 00                	add    BYTE PTR [eax],al
 3100bc0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100bc3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100bc9:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3100bcd:	04 04                	add    al,0x4
 3100bcf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100bd2:	00 00                	add    BYTE PTR [eax],al
 3100bd4:	c4 00                	les    eax,FWORD PTR [eax]
 3100bd6:	00 00                	add    BYTE PTR [eax],al
 3100bd8:	6c                   	ins    BYTE PTR es:[edi],dx
 3100bd9:	f9                   	stc    
 3100bda:	ff                   	(bad)  
 3100bdb:	ff                   	(bad)  
 3100bdc:	7c 00                	jl     3100bde <kShell+0x48f>
 3100bde:	00 00                	add    BYTE PTR [eax],al
 3100be0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100be3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100be9:	02 78 c5             	add    bh,BYTE PTR [eax-0x3b]
 3100bec:	0c 04                	or     al,0x4
 3100bee:	04 00                	add    al,0x0
 3100bf0:	1c 00                	sbb    al,0x0
 3100bf2:	00 00                	add    BYTE PTR [eax],al
 3100bf4:	e4 00                	in     al,0x0
 3100bf6:	00 00                	add    BYTE PTR [eax],al
 3100bf8:	c8 f9 ff ff          	enter  0xfff9,0xff
 3100bfc:	3d 00 00 00 00       	cmp    eax,0x0
 3100c01:	41                   	inc    ecx
 3100c02:	0e                   	push   cs
 3100c03:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c09:	79 c5                	jns    3100bd0 <kShell+0x481>
 3100c0b:	0c 04                	or     al,0x4
 3100c0d:	04 00                	add    al,0x0
 3100c0f:	00 20                	add    BYTE PTR [eax],ah
 3100c11:	00 00                	add    BYTE PTR [eax],al
 3100c13:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
 3100c16:	00 00                	add    BYTE PTR [eax],al
 3100c18:	e5 f9                	in     eax,0xf9
 3100c1a:	ff                   	(bad)  
 3100c1b:	ff 93 00 00 00 00    	call   DWORD PTR [ebx+0x0]
 3100c21:	41                   	inc    ecx
 3100c22:	0e                   	push   cs
 3100c23:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c29:	47                   	inc    edi
 3100c2a:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100c2d:	88 c5                	mov    ch,al
 3100c2f:	c3                   	ret    
 3100c30:	0c 04                	or     al,0x4
 3100c32:	04 00                	add    al,0x0
 3100c34:	1c 00                	sbb    al,0x0
 3100c36:	00 00                	add    BYTE PTR [eax],al
 3100c38:	28 01                	sub    BYTE PTR [ecx],al
 3100c3a:	00 00                	add    BYTE PTR [eax],al
 3100c3c:	54                   	push   esp
 3100c3d:	fa                   	cli    
 3100c3e:	ff                   	(bad)  
 3100c3f:	ff 67 00             	jmp    DWORD PTR [edi+0x0]
 3100c42:	00 00                	add    BYTE PTR [eax],al
 3100c44:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100c47:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c4d:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
 3100c50:	0c 04                	or     al,0x4
 3100c52:	04 00                	add    al,0x0
 3100c54:	1c 00                	sbb    al,0x0
 3100c56:	00 00                	add    BYTE PTR [eax],al
 3100c58:	48                   	dec    eax
 3100c59:	01 00                	add    DWORD PTR [eax],eax
 3100c5b:	00 9b fa ff ff 58    	add    BYTE PTR [ebx+0x58fffffa],bl
 3100c61:	00 00                	add    BYTE PTR [eax],al
 3100c63:	00 00                	add    BYTE PTR [eax],al
 3100c65:	41                   	inc    ecx
 3100c66:	0e                   	push   cs
 3100c67:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c6d:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3100c71:	04 04                	add    al,0x4
 3100c73:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100c76:	00 00                	add    BYTE PTR [eax],al
 3100c78:	68 01 00 00 d3       	push   0xd3000001
 3100c7d:	fa                   	cli    
 3100c7e:	ff                   	(bad)  
 3100c7f:	ff e8                	jmp    <internal disassembler error>
 3100c81:	01 00                	add    DWORD PTR [eax],eax
 3100c83:	00 00                	add    BYTE PTR [eax],al
 3100c85:	41                   	inc    ecx
 3100c86:	0e                   	push   cs
 3100c87:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c8d:	03 e4                	add    esp,esp
 3100c8f:	01 c5                	add    ebp,eax
 3100c91:	0c 04                	or     al,0x4
 3100c93:	04                   	.byte 0x4

Disassembly of section .interp:

03100c94 <.interp>:
 3100c94:	2f                   	das    
 3100c95:	6c                   	ins    BYTE PTR es:[edi],dx
 3100c96:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3100c9d:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3100ca4:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03100ca8 <.dynsym>:
	...
 3100cb8:	09 00                	or     DWORD PTR [eax],eax
	...
 3100cc2:	00 00                	add    BYTE PTR [eax],al
 3100cc4:	12 00                	adc    al,BYTE PTR [eax]
 3100cc6:	00 00                	add    BYTE PTR [eax],al
 3100cc8:	10 00                	adc    BYTE PTR [eax],al
	...
 3100cd2:	00 00                	add    BYTE PTR [eax],al
 3100cd4:	12 00                	adc    al,BYTE PTR [eax]
 3100cd6:	00 00                	add    BYTE PTR [eax],al
 3100cd8:	18 00                	sbb    BYTE PTR [eax],al
	...
 3100ce2:	00 00                	add    BYTE PTR [eax],al
 3100ce4:	12 00                	adc    al,BYTE PTR [eax]
 3100ce6:	00 00                	add    BYTE PTR [eax],al
 3100ce8:	1e                   	push   ds
	...
 3100cf1:	00 00                	add    BYTE PTR [eax],al
 3100cf3:	00 12                	add    BYTE PTR [edx],dl
 3100cf5:	00 00                	add    BYTE PTR [eax],al
 3100cf7:	00 23                	add    BYTE PTR [ebx],ah
	...
 3100d01:	00 00                	add    BYTE PTR [eax],al
 3100d03:	00 12                	add    BYTE PTR [edx],dl
 3100d05:	00 00                	add    BYTE PTR [eax],al
 3100d07:	00 2a                	add    BYTE PTR [edx],ch
	...
 3100d11:	00 00                	add    BYTE PTR [eax],al
 3100d13:	00 12                	add    BYTE PTR [edx],dl
 3100d15:	00 00                	add    BYTE PTR [eax],al
 3100d17:	00 31                	add    BYTE PTR [ecx],dh
	...
 3100d21:	00 00                	add    BYTE PTR [eax],al
 3100d23:	00 12                	add    BYTE PTR [edx],dl
 3100d25:	00 00                	add    BYTE PTR [eax],al
 3100d27:	00 37                	add    BYTE PTR [edi],dh
	...
 3100d31:	00 00                	add    BYTE PTR [eax],al
 3100d33:	00 12                	add    BYTE PTR [edx],dl
 3100d35:	00 00                	add    BYTE PTR [eax],al
 3100d37:	00 3f                	add    BYTE PTR [edi],bh
	...
 3100d41:	00 00                	add    BYTE PTR [eax],al
 3100d43:	00 12                	add    BYTE PTR [edx],dl
 3100d45:	00 00                	add    BYTE PTR [eax],al
 3100d47:	00 49 00             	add    BYTE PTR [ecx+0x0],cl
	...
 3100d52:	00 00                	add    BYTE PTR [eax],al
 3100d54:	12 00                	adc    al,BYTE PTR [eax]
 3100d56:	00 00                	add    BYTE PTR [eax],al
 3100d58:	51                   	push   ecx
	...
 3100d61:	00 00                	add    BYTE PTR [eax],al
 3100d63:	00 12                	add    BYTE PTR [edx],dl
 3100d65:	00 00                	add    BYTE PTR [eax],al
 3100d67:	00 58 00             	add    BYTE PTR [eax+0x0],bl
	...
 3100d72:	00 00                	add    BYTE PTR [eax],al
 3100d74:	12 00                	adc    al,BYTE PTR [eax]
 3100d76:	00 00                	add    BYTE PTR [eax],al
 3100d78:	5d                   	pop    ebp
	...
 3100d81:	00 00                	add    BYTE PTR [eax],al
 3100d83:	00 12                	add    BYTE PTR [edx],dl
 3100d85:	00 00                	add    BYTE PTR [eax],al
 3100d87:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
	...
 3100d93:	00 12                	add    BYTE PTR [edx],dl
 3100d95:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

03100d98 <.dynstr>:
 3100d98:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3100d9c:	63 2e                	arpl   WORD PTR [esi],bp
 3100d9e:	73 6f                	jae    3100e0f <kShell+0x6c0>
 3100da0:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3100da3:	72 63                	jb     3100e08 <kShell+0x6b9>
 3100da5:	70 79                	jo     3100e20 <kShell+0x6d1>
 3100da7:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 3100daa:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3100db1:	72 
 3100db2:	69 6e 74 00 67 65 74 	imul   ebp,DWORD PTR [esi+0x74],0x74656700
 3100db9:	73 00                	jae    3100dbb <kShell+0x66c>
 3100dbb:	6d                   	ins    DWORD PTR es:[edi],dx
 3100dbc:	65                   	gs
 3100dbd:	6d                   	ins    DWORD PTR es:[edi],dx
 3100dbe:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3100dc1:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 3100dc4:	6c                   	ins    BYTE PTR es:[edi],dx
 3100dc5:	6c                   	ins    BYTE PTR es:[edi],dx
 3100dc6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100dc7:	63 00                	arpl   WORD PTR [eax],ax
 3100dc9:	73 6c                	jae    3100e37 <kShell+0x6e8>
 3100dcb:	65                   	gs
 3100dcc:	65                   	gs
 3100dcd:	70 00                	jo     3100dcf <kShell+0x680>
 3100dcf:	73 74                	jae    3100e45 <kShell+0x6f6>
 3100dd1:	72 74                	jb     3100e47 <kShell+0x6f8>
 3100dd3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100dd4:	75 6c                	jne    3100e42 <kShell+0x6f3>
 3100dd6:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3100dda:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
 3100ddd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100dde:	69 74 00 73 74 72 6e 	imul   esi,DWORD PTR [eax+eax*1+0x73],0x636e7274
 3100de5:	63 
 3100de6:	6d                   	ins    DWORD PTR es:[edi],dx
 3100de7:	70 00                	jo     3100de9 <kShell+0x69a>
 3100de9:	6d                   	ins    DWORD PTR es:[edi],dx
 3100dea:	65                   	gs
 3100deb:	6d                   	ins    DWORD PTR es:[edi],dx
 3100dec:	73 65                	jae    3100e53 <kShell+0x704>
 3100dee:	74 00                	je     3100df0 <kShell+0x6a1>
 3100df0:	70 75                	jo     3100e67 <kShell+0x718>
 3100df2:	74 63                	je     3100e57 <kShell+0x708>
 3100df4:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3100df7:	72 6c                	jb     3100e65 <kShell+0x716>
 3100df9:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3100dfb:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 3100dfe:	65 65 00 2f          	gs add BYTE PTR gs:[edi],ch
 3100e02:	68 6f 6d 65 2f       	push   0x2f656d6f
 3100e07:	79 6f                	jns    3100e78 <kShell+0x729>
 3100e09:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 3100e10:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100e11:	73 2f                	jae    3100e42 <kShell+0x6f3>
 3100e13:	6c                   	ins    BYTE PTR es:[edi],dx
 3100e14:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3100e1b:	4f                   	dec    edi
 3100e1c:	53                   	push   ebx
 3100e1d:	2f                   	das    
 3100e1e:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3100e25:	62 
 3100e26:	75 67                	jne    3100e8f <kShell+0x740>
 3100e28:	2f                   	das    
 3100e29:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 3100e2c:	73 73                	jae    3100ea1 <kShell+0x752>
 3100e2e:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3100e33:	78 00                	js     3100e35 <kShell+0x6e6>

Disassembly of section .hash:

03100e38 <.hash>:
 3100e38:	03 00                	add    eax,DWORD PTR [eax]
 3100e3a:	00 00                	add    BYTE PTR [eax],al
 3100e3c:	0f 00 00             	sldt   WORD PTR [eax]
 3100e3f:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 3100e42:	00 00                	add    BYTE PTR [eax],al
 3100e44:	0e                   	push   cs
 3100e45:	00 00                	add    BYTE PTR [eax],al
 3100e47:	00 0a                	add    BYTE PTR [edx],cl
	...
 3100e51:	00 00                	add    BYTE PTR [eax],al
 3100e53:	00 01                	add    BYTE PTR [ecx],al
 3100e55:	00 00                	add    BYTE PTR [eax],al
 3100e57:	00 02                	add    BYTE PTR [edx],al
 3100e59:	00 00                	add    BYTE PTR [eax],al
 3100e5b:	00 00                	add    BYTE PTR [eax],al
 3100e5d:	00 00                	add    BYTE PTR [eax],al
 3100e5f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3100e62:	00 00                	add    BYTE PTR [eax],al
 3100e64:	03 00                	add    eax,DWORD PTR [eax]
 3100e66:	00 00                	add    BYTE PTR [eax],al
 3100e68:	05 00 00 00 06       	add    eax,0x6000000
 3100e6d:	00 00                	add    BYTE PTR [eax],al
 3100e6f:	00 07                	add    BYTE PTR [edi],al
 3100e71:	00 00                	add    BYTE PTR [eax],al
 3100e73:	00 08                	add    BYTE PTR [eax],cl
 3100e75:	00 00                	add    BYTE PTR [eax],al
 3100e77:	00 09                	add    BYTE PTR [ecx],cl
 3100e79:	00 00                	add    BYTE PTR [eax],al
 3100e7b:	00 0b                	add    BYTE PTR [ebx],cl
 3100e7d:	00 00                	add    BYTE PTR [eax],al
 3100e7f:	00 00                	add    BYTE PTR [eax],al
 3100e81:	00 00                	add    BYTE PTR [eax],al
 3100e83:	00                   	.byte 0x0
 3100e84:	0d                   	.byte 0xd
 3100e85:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03100e88 <.eh_frame>:
 3100e88:	14 00                	adc    al,0x0
 3100e8a:	00 00                	add    BYTE PTR [eax],al
 3100e8c:	00 00                	add    BYTE PTR [eax],al
 3100e8e:	00 00                	add    BYTE PTR [eax],al
 3100e90:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3100e93:	00 01                	add    BYTE PTR [ecx],al
 3100e95:	7c 08                	jl     3100e9f <kShell+0x750>
 3100e97:	01 1b                	add    DWORD PTR [ebx],ebx
 3100e99:	0c 04                	or     al,0x4
 3100e9b:	04 88                	add    al,0x88
 3100e9d:	01 00                	add    DWORD PTR [eax],eax
 3100e9f:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3100ea2:	00 00                	add    BYTE PTR [eax],al
 3100ea4:	1c 00                	sbb    al,0x0
 3100ea6:	00 00                	add    BYTE PTR [eax],al
 3100ea8:	98                   	cwde   
 3100ea9:	fa                   	cli    
 3100eaa:	ff                   	(bad)  
 3100eab:	ff f0                	push   eax
 3100ead:	00 00                	add    BYTE PTR [eax],al
 3100eaf:	00 00                	add    BYTE PTR [eax],al
 3100eb1:	0e                   	push   cs
 3100eb2:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3100eb5:	0c 4a                	or     al,0x4a
 3100eb7:	0f 0b                	ud2    
 3100eb9:	74 04                	je     3100ebf <kShell+0x770>
 3100ebb:	78 00                	js     3100ebd <kShell+0x76e>
 3100ebd:	3f                   	aas    
 3100ebe:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3100ec0:	2a 32                	sub    dh,BYTE PTR [edx]
 3100ec2:	24 22                	and    al,0x22
 3100ec4:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03100ec8 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3100ec8:	01 1b                	add    DWORD PTR [ebx],ebx
 3100eca:	03 3b                	add    edi,DWORD PTR [ebx]
 3100ecc:	44                   	inc    esp
 3100ecd:	fc                   	cld    
 3100ece:	ff                   	(bad)  
 3100ecf:	ff 0b                	dec    DWORD PTR [ebx]
 3100ed1:	00 00                	add    BYTE PTR [eax],al
 3100ed3:	00 38                	add    BYTE PTR [eax],bh
 3100ed5:	f1                   	icebp  
 3100ed6:	ff                   	(bad)  
 3100ed7:	ff 60 fc             	jmp    DWORD PTR [eax-0x4]
 3100eda:	ff                   	(bad)  
 3100edb:	ff e3                	jmp    ebx
 3100edd:	f1                   	icebp  
 3100ede:	ff                   	(bad)  
 3100edf:	ff 84 fc ff ff 2d f3 	inc    DWORD PTR [esp+edi*8-0xcd20001]
 3100ee6:	ff                   	(bad)  
 3100ee7:	ff a8 fc ff ff 96    	jmp    FWORD PTR [eax-0x69000004]
 3100eed:	f3 ff                	repz (bad) 
 3100eef:	ff c8                	dec    eax
 3100ef1:	fc                   	cld    
 3100ef2:	ff                   	(bad)  
 3100ef3:	ff 24 f6             	jmp    DWORD PTR [esi+esi*8]
 3100ef6:	ff                   	(bad)  
 3100ef7:	ff e8                	jmp    <internal disassembler error>
 3100ef9:	fc                   	cld    
 3100efa:	ff                   	(bad)  
 3100efb:	ff                   	(bad)  
 3100efc:	7c f6                	jl     3100ef4 <__GNU_EH_FRAME_HDR+0x2c>
 3100efe:	ff                   	(bad)  
 3100eff:	ff 08                	dec    DWORD PTR [eax]
 3100f01:	fd                   	std    
 3100f02:	ff                   	(bad)  
 3100f03:	ff                   	(bad)  
 3100f04:	f8                   	clc    
 3100f05:	f6 ff                	idiv   bh
 3100f07:	ff 28                	jmp    FWORD PTR [eax]
 3100f09:	fd                   	std    
 3100f0a:	ff                   	(bad)  
 3100f0b:	ff 35 f7 ff ff 48    	push   DWORD PTR ds:0x48fffff7
 3100f11:	fd                   	std    
 3100f12:	ff                   	(bad)  
 3100f13:	ff c8                	dec    eax
 3100f15:	f7 ff                	idiv   edi
 3100f17:	ff 6c fd ff          	jmp    FWORD PTR [ebp+edi*8-0x1]
 3100f1b:	ff 2f                	jmp    FWORD PTR [edi]
 3100f1d:	f8                   	clc    
 3100f1e:	ff                   	(bad)  
 3100f1f:	ff 8c fd ff ff 87 f8 	dec    DWORD PTR [ebp+edi*8-0x7780001]
 3100f26:	ff                   	(bad)  
 3100f27:	ff                   	.byte 0xff
 3100f28:	ac                   	lods   al,BYTE PTR ds:[esi]
 3100f29:	fd                   	std    
 3100f2a:	ff                   	(bad)  
 3100f2b:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03100f2c <.rel.dyn>:
 3100f2c:	7c 10                	jl     3100f3e <__GNU_EH_FRAME_HDR+0x76>
 3100f2e:	10 03                	adc    BYTE PTR [ebx],al
 3100f30:	07                   	pop    es
 3100f31:	01 00                	add    DWORD PTR [eax],eax
 3100f33:	00 80 10 10 03 07    	add    BYTE PTR [eax+0x7031010],al
 3100f39:	02 00                	add    al,BYTE PTR [eax]
 3100f3b:	00 84 10 10 03 07 03 	add    BYTE PTR [eax+edx*1+0x3070310],al
 3100f42:	00 00                	add    BYTE PTR [eax],al
 3100f44:	88 10                	mov    BYTE PTR [eax],dl
 3100f46:	10 03                	adc    BYTE PTR [ebx],al
 3100f48:	07                   	pop    es
 3100f49:	04 00                	add    al,0x0
 3100f4b:	00 8c 10 10 03 07 05 	add    BYTE PTR [eax+edx*1+0x5070310],cl
 3100f52:	00 00                	add    BYTE PTR [eax],al
 3100f54:	90                   	nop
 3100f55:	10 10                	adc    BYTE PTR [eax],dl
 3100f57:	03 07                	add    eax,DWORD PTR [edi]
 3100f59:	06                   	push   es
 3100f5a:	00 00                	add    BYTE PTR [eax],al
 3100f5c:	94                   	xchg   esp,eax
 3100f5d:	10 10                	adc    BYTE PTR [eax],dl
 3100f5f:	03 07                	add    eax,DWORD PTR [edi]
 3100f61:	07                   	pop    es
 3100f62:	00 00                	add    BYTE PTR [eax],al
 3100f64:	98                   	cwde   
 3100f65:	10 10                	adc    BYTE PTR [eax],dl
 3100f67:	03 07                	add    eax,DWORD PTR [edi]
 3100f69:	08 00                	or     BYTE PTR [eax],al
 3100f6b:	00 9c 10 10 03 07 09 	add    BYTE PTR [eax+edx*1+0x9070310],bl
 3100f72:	00 00                	add    BYTE PTR [eax],al
 3100f74:	a0 10 10 03 07       	mov    al,ds:0x7031010
 3100f79:	0a 00                	or     al,BYTE PTR [eax]
 3100f7b:	00 a4 10 10 03 07 0b 	add    BYTE PTR [eax+edx*1+0xb070310],ah
 3100f82:	00 00                	add    BYTE PTR [eax],al
 3100f84:	a8 10                	test   al,0x10
 3100f86:	10 03                	adc    BYTE PTR [ebx],al
 3100f88:	07                   	pop    es
 3100f89:	0c 00                	or     al,0x0
 3100f8b:	00 ac 10 10 03 07 0d 	add    BYTE PTR [eax+edx*1+0xd070310],ch
 3100f92:	00 00                	add    BYTE PTR [eax],al
 3100f94:	b0 10                	mov    al,0x10
 3100f96:	10 03                	adc    BYTE PTR [ebx],al
 3100f98:	07                   	pop    es
 3100f99:	0e                   	push   cs
	...

Disassembly of section .data:

03100fa0 <cmds>:
 3100fa0:	30 0a                	xor    BYTE PTR [edx],cl
 3100fa2:	10 03                	adc    BYTE PTR [ebx],al
 3100fa4:	35 0a 10 03 ec       	xor    eax,0xec03100a
 3100fa9:	04 10                	add    al,0x10
 3100fab:	03 00                	add    eax,DWORD PTR [eax]
 3100fad:	00 00                	add    BYTE PTR [eax],al
 3100faf:	00 51 0a             	add    BYTE PTR [ecx+0xa],dl
 3100fb2:	10 03                	adc    BYTE PTR [ebx],al
 3100fb4:	56                   	push   esi
 3100fb5:	0a 10                	or     dl,BYTE PTR [eax]
 3100fb7:	03 fd                	add    edi,ebp
 3100fb9:	05 10 03 01 00       	add    eax,0x10310
 3100fbe:	00 00                	add    BYTE PTR [eax],al
 3100fc0:	68 0a 10 03 6d       	push   0x6d03100a
 3100fc5:	0a 10                	or     dl,BYTE PTR [eax]
 3100fc7:	03 f7                	add    esi,edi
 3100fc9:	06                   	push   es
 3100fca:	10 03                	adc    BYTE PTR [ebx],al
 3100fcc:	01 00                	add    DWORD PTR [eax],eax
 3100fce:	00 00                	add    BYTE PTR [eax],al
 3100fd0:	79 0a                	jns    3100fdc <cmds+0x3c>
 3100fd2:	10 03                	adc    BYTE PTR [ebx],al
 3100fd4:	7f 0a                	jg     3100fe0 <_DYNAMIC>
 3100fd6:	10 03                	adc    BYTE PTR [ebx],al
 3100fd8:	90                   	nop
 3100fd9:	06                   	push   es
 3100fda:	10 03                	adc    BYTE PTR [ebx],al
 3100fdc:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .dynamic:

03100fe0 <_DYNAMIC>:
 3100fe0:	01 00                	add    DWORD PTR [eax],eax
 3100fe2:	00 00                	add    BYTE PTR [eax],al
 3100fe4:	01 00                	add    DWORD PTR [eax],eax
 3100fe6:	00 00                	add    BYTE PTR [eax],al
 3100fe8:	0f 00 00             	sldt   WORD PTR [eax]
 3100feb:	00 69 00             	add    BYTE PTR [ecx+0x0],ch
 3100fee:	00 00                	add    BYTE PTR [eax],al
 3100ff0:	04 00                	add    al,0x0
 3100ff2:	00 00                	add    BYTE PTR [eax],al
 3100ff4:	38 0e                	cmp    BYTE PTR [esi],cl
 3100ff6:	10 03                	adc    BYTE PTR [ebx],al
 3100ff8:	05 00 00 00 98       	add    eax,0x98000000
 3100ffd:	0d 10 03 06 00       	or     eax,0x60310
 3101002:	00 00                	add    BYTE PTR [eax],al
 3101004:	a8 0c                	test   al,0xc
 3101006:	10 03                	adc    BYTE PTR [ebx],al
 3101008:	0a 00                	or     al,BYTE PTR [eax]
 310100a:	00 00                	add    BYTE PTR [eax],al
 310100c:	9d                   	popf   
 310100d:	00 00                	add    BYTE PTR [eax],al
 310100f:	00 0b                	add    BYTE PTR [ebx],cl
 3101011:	00 00                	add    BYTE PTR [eax],al
 3101013:	00 10                	add    BYTE PTR [eax],dl
 3101015:	00 00                	add    BYTE PTR [eax],al
 3101017:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 310101d:	00 00                	add    BYTE PTR [eax],al
 310101f:	00 03                	add    BYTE PTR [ebx],al
 3101021:	00 00                	add    BYTE PTR [eax],al
 3101023:	00 70 10             	add    BYTE PTR [eax+0x10],dh
 3101026:	10 03                	adc    BYTE PTR [ebx],al
 3101028:	02 00                	add    al,BYTE PTR [eax]
 310102a:	00 00                	add    BYTE PTR [eax],al
 310102c:	70 00                	jo     310102e <_DYNAMIC+0x4e>
 310102e:	00 00                	add    BYTE PTR [eax],al
 3101030:	14 00                	adc    al,0x0
 3101032:	00 00                	add    BYTE PTR [eax],al
 3101034:	11 00                	adc    DWORD PTR [eax],eax
 3101036:	00 00                	add    BYTE PTR [eax],al
 3101038:	17                   	pop    ss
 3101039:	00 00                	add    BYTE PTR [eax],al
 310103b:	00 2c 0f             	add    BYTE PTR [edi+ecx*1],ch
 310103e:	10 03                	adc    BYTE PTR [ebx],al
	...

Disassembly of section .got.plt:

03101070 <_GLOBAL_OFFSET_TABLE_>:
 3101070:	e0 0f                	loopne 3101081 <_GLOBAL_OFFSET_TABLE_+0x11>
 3101072:	10 03                	adc    BYTE PTR [ebx],al
	...
 310107c:	56                   	push   esi
 310107d:	09 10                	or     DWORD PTR [eax],edx
 310107f:	03 66 09             	add    esp,DWORD PTR [esi+0x9]
 3101082:	10 03                	adc    BYTE PTR [ebx],al
 3101084:	76 09                	jbe    310108f <_GLOBAL_OFFSET_TABLE_+0x1f>
 3101086:	10 03                	adc    BYTE PTR [ebx],al
 3101088:	86 09                	xchg   BYTE PTR [ecx],cl
 310108a:	10 03                	adc    BYTE PTR [ebx],al
 310108c:	96                   	xchg   esi,eax
 310108d:	09 10                	or     DWORD PTR [eax],edx
 310108f:	03 a6 09 10 03 b6    	add    esp,DWORD PTR [esi-0x49fceff7]
 3101095:	09 10                	or     DWORD PTR [eax],edx
 3101097:	03 c6                	add    eax,esi
 3101099:	09 10                	or     DWORD PTR [eax],edx
 310109b:	03 d6                	add    edx,esi
 310109d:	09 10                	or     DWORD PTR [eax],edx
 310109f:	03 e6                	add    esp,esi
 31010a1:	09 10                	or     DWORD PTR [eax],edx
 31010a3:	03 f6                	add    esi,esi
 31010a5:	09 10                	or     DWORD PTR [eax],edx
 31010a7:	03 06                	add    eax,DWORD PTR [esi]
 31010a9:	0a 10                	or     dl,BYTE PTR [eax]
 31010ab:	03 16                	add    edx,DWORD PTR [esi]
 31010ad:	0a 10                	or     dl,BYTE PTR [eax]
 31010af:	03 26                	add    esp,DWORD PTR [esi]
 31010b1:	0a 10                	or     dl,BYTE PTR [eax]
 31010b3:	03                   	.byte 0x3

Disassembly of section .bss:

031010c0 <timeToExit>:
 31010c0:	00 00                	add    BYTE PTR [eax],al
	...

031010c4 <exitCode>:
	...

031010e0 <sExecutingProgram>:
	...

031012e0 <command_function_p>:
 31012e0:	00 00                	add    BYTE PTR [eax],al
	...

031012e4 <cpuid_extended_feature_bits>:
 31012e4:	00 00                	add    BYTE PTR [eax],al
	...

031012e8 <heapEnd>:
 31012e8:	00 00                	add    BYTE PTR [eax],al
	...

031012ec <heapBase>:
 31012ec:	00 00                	add    BYTE PTR [eax],al
	...

031012f0 <heapCurr>:
 31012f0:	00 00                	add    BYTE PTR [eax],al
	...

031012f4 <command_function>:
 31012f4:	00 00                	add    BYTE PTR [eax],al
	...

031012f8 <cpuid_procinfo>:
	...

03101300 <sKShellProgramName>:
 3101300:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	9a 07 00 00 04 00 00 	call   0x0:0x4000007
   7:	00 00                	add    BYTE PTR [eax],al
   9:	00 04 01             	add    BYTE PTR [ecx+eax*1],al
   c:	9f                   	lahf   
   d:	00 00                	add    BYTE PTR [eax],al
   f:	00 0c 85 02 00 00 2c 	add    BYTE PTR [eax*4+0x2c000002],cl
  16:	01 00                	add    DWORD PTR [eax],eax
  18:	00 00                	add    BYTE PTR [eax],al
  1a:	00 10                	add    BYTE PTR [eax],dl
  1c:	03 37                	add    esi,DWORD PTR [edi]
  1e:	09 00                	or     DWORD PTR [eax],eax
  20:	00 00                	add    BYTE PTR [eax],al
  22:	00 00                	add    BYTE PTR [eax],al
  24:	00 02                	add    BYTE PTR [edx],al
  26:	01 08                	add    DWORD PTR [eax],ecx
  28:	04 02                	add    al,0x2
  2a:	00 00                	add    BYTE PTR [eax],al
  2c:	02 02                	add    al,BYTE PTR [edx]
  2e:	07                   	pop    es
  2f:	4d                   	dec    ebp
  30:	02 00                	add    al,BYTE PTR [eax]
  32:	00 02                	add    BYTE PTR [edx],al
  34:	04 07                	add    al,0x7
  36:	1c 02                	sbb    al,0x2
  38:	00 00                	add    BYTE PTR [eax],al
  3a:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
  3d:	17                   	pop    ss
  3e:	02 00                	add    al,BYTE PTR [eax]
  40:	00 02                	add    BYTE PTR [edx],al
  42:	01 06                	add    DWORD PTR [esi],eax
  44:	06                   	push   es
  45:	02 00                	add    al,BYTE PTR [eax]
  47:	00 02                	add    BYTE PTR [edx],al
  49:	02 05 3e 00 00 00    	add    al,BYTE PTR ds:0x3e
  4f:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  56:	02 08                	add    cl,BYTE PTR [eax]
  58:	05 89 01 00 00       	add    eax,0x189
  5d:	02 08                	add    cl,BYTE PTR [eax]
  5f:	07                   	pop    es
  60:	12 02                	adc    al,BYTE PTR [edx]
  62:	00 00                	add    BYTE PTR [eax],al
  64:	02 04 05 8e 01 00 00 	add    al,BYTE PTR [eax*1+0x18e]
  6b:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
  6e:	5f                   	pop    edi
  6f:	00 00                	add    BYTE PTR [eax],al
  71:	00 04 04             	add    BYTE PTR [esp+eax*1],al
  74:	05 04 7a 00 00       	add    eax,0x7a04
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	01 06                	add    DWORD PTR [esi],eax
  7d:	0d 02 00 00 06       	or     eax,0x6000002
  82:	45                   	inc    ebp
  83:	01 00                	add    DWORD PTR [eax],eax
  85:	00 02                	add    BYTE PTR [edx],al
  87:	2e                   	cs
  88:	25 00 00 00 06       	and    eax,0x6000000
  8d:	31 02                	xor    DWORD PTR [edx],eax
  8f:	00 00                	add    BYTE PTR [eax],al
  91:	02 34 33             	add    dh,BYTE PTR [ebx+esi*1]
  94:	00 00                	add    BYTE PTR [eax],al
  96:	00 02                	add    BYTE PTR [edx],al
  98:	01 02                	add    DWORD PTR [edx],eax
  9a:	7f 02                	jg     9e <execInternalCommand-0x30fff62>
  9c:	00 00                	add    BYTE PTR [eax],al
  9e:	07                   	pop    es
  9f:	05 03 58 1f 01       	add    eax,0x11f5803
  a4:	00 00                	add    BYTE PTR [eax],al
  a6:	08 4b 03             	or     BYTE PTR [ebx+0x3],cl
  a9:	00 00                	add    BYTE PTR [eax],al
  ab:	03 59 81             	add    ebx,DWORD PTR [ecx-0x7f]
  ae:	00 00                	add    BYTE PTR [eax],al
  b0:	00 01                	add    BYTE PTR [ecx],al
  b2:	04 04                	add    al,0x4
  b4:	00 08                	add    BYTE PTR [eax],cl
  b6:	6a 02                	push   0x2
  b8:	00 00                	add    BYTE PTR [eax],al
  ba:	03 5a 81             	add    ebx,DWORD PTR [edx-0x7f]
  bd:	00 00                	add    BYTE PTR [eax],al
  bf:	00 01                	add    BYTE PTR [ecx],al
  c1:	04 00                	add    al,0x0
  c3:	00 08                	add    BYTE PTR [eax],cl
  c5:	2a 02                	sub    al,BYTE PTR [edx]
  c7:	00 00                	add    BYTE PTR [eax],al
  c9:	03 5b 81             	add    ebx,DWORD PTR [ebx-0x7f]
  cc:	00 00                	add    BYTE PTR [eax],al
  ce:	00 01                	add    BYTE PTR [ecx],al
  d0:	04 04                	add    al,0x4
  d2:	01 08                	add    DWORD PTR [eax],ecx
  d4:	63 00                	arpl   WORD PTR [eax],ax
  d6:	00 00                	add    BYTE PTR [eax],al
  d8:	03 5c 81 00          	add    ebx,DWORD PTR [ecx+eax*4+0x0]
  dc:	00 00                	add    BYTE PTR [eax],al
  de:	01 02                	add    DWORD PTR [edx],eax
  e0:	02 01                	add    al,BYTE PTR [ecx]
  e2:	08 bf 01 00 00 03    	or     BYTE PTR [edi+0x3000001],bh
  e8:	5d                   	pop    ebp
  e9:	81 00 00 00 01 02    	add    DWORD PTR [eax],0x2010000
  ef:	00 01                	add    BYTE PTR [ecx],al
  f1:	08 69 02             	or     BYTE PTR [ecx+0x2],ch
  f4:	00 00                	add    BYTE PTR [eax],al
  f6:	03 5e 81             	add    ebx,DWORD PTR [esi-0x7f]
  f9:	00 00                	add    BYTE PTR [eax],al
  fb:	00 01                	add    BYTE PTR [ecx],al
  fd:	04 04                	add    al,0x4
  ff:	02 08                	add    cl,BYTE PTR [eax]
 101:	29 02                	sub    DWORD PTR [edx],eax
 103:	00 00                	add    BYTE PTR [eax],al
 105:	03 5f 81             	add    ebx,DWORD PTR [edi-0x7f]
 108:	00 00                	add    BYTE PTR [eax],al
 10a:	00 01                	add    BYTE PTR [ecx],al
 10c:	08 00                	or     BYTE PTR [eax],al
 10e:	03 08                	add    ecx,DWORD PTR [eax]
 110:	c4 01                	les    eax,FWORD PTR [ecx]
 112:	00 00                	add    BYTE PTR [eax],al
 114:	03 60 81             	add    esp,DWORD PTR [eax-0x7f]
 117:	00 00                	add    BYTE PTR [eax],al
 119:	00 01                	add    BYTE PTR [ecx],al
 11b:	04 04                	add    al,0x4
 11d:	04 00                	add    al,0x0
 11f:	09 08                	or     DWORD PTR [eax],ecx
 121:	03 56 38             	add    edx,DWORD PTR [esi+0x38]
 124:	01 00                	add    DWORD PTR [eax],eax
 126:	00 0a                	add    BYTE PTR [edx],cl
 128:	9e                   	sahf   
 129:	00 00                	add    BYTE PTR [eax],al
 12b:	00 0b                	add    BYTE PTR [ebx],cl
 12d:	72 65                	jb     194 <execInternalCommand-0x30ffe6c>
 12f:	67 00 03             	add    BYTE PTR [bp+di],al
 132:	62 8c 00 00 00 00 07 	bound  ecx,QWORD PTR [eax+eax*1+0x7000000]
 139:	04 03                	add    al,0x3
 13b:	db 6e 01             	fld    TBYTE PTR [esi+0x1]
 13e:	00 00                	add    BYTE PTR [eax],al
 140:	08 e4                	or     ah,ah
 142:	02 00                	add    al,BYTE PTR [eax]
 144:	00 03                	add    BYTE PTR [ebx],al
 146:	dc 81 00 00 00 01    	fadd   QWORD PTR [ecx+0x1000000]
 14c:	01 07                	add    DWORD PTR [edi],eax
 14e:	00 08                	add    BYTE PTR [eax],cl
 150:	9c                   	pushf  
 151:	02 00                	add    al,BYTE PTR [eax]
 153:	00 03                	add    BYTE PTR [ebx],al
 155:	dd 81 00 00 00 01    	fld    QWORD PTR [ecx+0x1000000]
 15b:	01 06                	add    DWORD PTR [esi],eax
 15d:	00 08                	add    BYTE PTR [eax],cl
 15f:	26 03 00             	add    eax,DWORD PTR es:[eax]
 162:	00 03                	add    BYTE PTR [ebx],al
 164:	de 8c 00 00 00 04 1e 	fimul  WORD PTR [eax+eax*1+0x1e040000]
 16b:	00 00                	add    BYTE PTR [eax],al
 16d:	00 09                	add    BYTE PTR [ecx],cl
 16f:	04 03                	add    al,0x3
 171:	da 87 01 00 00 0a    	fiadd  DWORD PTR [edi+0xa000001]
 177:	38 01                	cmp    BYTE PTR [ecx],al
 179:	00 00                	add    BYTE PTR [eax],al
 17b:	0b 72 65             	or     esi,DWORD PTR [edx+0x65]
 17e:	67 00 03             	add    BYTE PTR [bp+di],al
 181:	e0 8c                	loopne 10f <execInternalCommand-0x30ffef1>
 183:	00 00                	add    BYTE PTR [eax],al
 185:	00 00                	add    BYTE PTR [eax],al
 187:	07                   	pop    es
 188:	10 04 12             	adc    BYTE PTR [edx+edx*1],al
 18b:	c0 01 00             	rol    BYTE PTR [ecx],0x0
 18e:	00 0c ff             	add    BYTE PTR [edi+edi*8],cl
 191:	01 00                	add    DWORD PTR [eax],eax
 193:	00 04 14             	add    BYTE PTR [esp+edx*1],al
 196:	74 00                	je     198 <execInternalCommand-0x30ffe68>
 198:	00 00                	add    BYTE PTR [eax],al
 19a:	00 0c 2d 00 00 00 04 	add    BYTE PTR [ebp*1+0x4000000],cl
 1a1:	15 74 00 00 00       	adc    eax,0x74
 1a6:	04 0c                	add    al,0xc
 1a8:	65 01 00             	add    DWORD PTR gs:[eax],eax
 1ab:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 1ae:	72 00                	jb     1b0 <execInternalCommand-0x30ffe50>
 1b0:	00 00                	add    BYTE PTR [eax],al
 1b2:	08 0c 77             	or     BYTE PTR [edi+esi*2],cl
 1b5:	01 00                	add    DWORD PTR [eax],eax
 1b7:	00 04 17             	add    BYTE PTR [edi+edx*1],al
 1ba:	4f                   	dec    edi
 1bb:	00 00                	add    BYTE PTR [eax],al
 1bd:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 1c0:	06                   	push   es
 1c1:	76 00                	jbe    1c3 <execInternalCommand-0x30ffe3d>
 1c3:	00 00                	add    BYTE PTR [eax],al
 1c5:	04 18                	add    al,0x18
 1c7:	87 01                	xchg   DWORD PTR [ecx],eax
 1c9:	00 00                	add    BYTE PTR [eax],al
 1cb:	0d f5 00 00 00       	or     eax,0xf5
 1d0:	01 17                	add    DWORD PTR [edi],edx
 1d2:	00 00                	add    BYTE PTR [eax],al
 1d4:	10 03                	adc    BYTE PTR [ebx],al
 1d6:	ab                   	stos   DWORD PTR es:[edi],eax
 1d7:	00 00                	add    BYTE PTR [eax],al
 1d9:	00 01                	add    BYTE PTR [ecx],al
 1db:	9c                   	pushf  
 1dc:	08 02                	or     BYTE PTR [edx],al
 1de:	00 00                	add    BYTE PTR [eax],al
 1e0:	0e                   	push   cs
 1e1:	00 01                	add    BYTE PTR [ecx],al
 1e3:	00 00                	add    BYTE PTR [eax],al
 1e5:	01 17                	add    DWORD PTR [edi],edx
 1e7:	74 00                	je     1e9 <execInternalCommand-0x30ffe17>
 1e9:	00 00                	add    BYTE PTR [eax],al
 1eb:	02 91 00 0f 69 00    	add    dl,BYTE PTR [ecx+0x690f00]
 1f1:	01 19                	add    DWORD PTR [ecx],ebx
 1f3:	4f                   	dec    edi
 1f4:	00 00                	add    BYTE PTR [eax],al
 1f6:	00 02                	add    BYTE PTR [edx],al
 1f8:	91                   	xchg   ecx,eax
 1f9:	6c                   	ins    BYTE PTR es:[edi],dx
 1fa:	10 f0                	adc    al,dh
 1fc:	02 00                	add    al,BYTE PTR [eax]
 1fe:	00 01                	add    BYTE PTR [ecx],al
 200:	19 4f 00             	sbb    DWORD PTR [edi+0x0],ecx
 203:	00 00                	add    BYTE PTR [eax],al
 205:	11 00                	adc    DWORD PTR [eax],eax
 207:	00 12                	add    BYTE PTR [edx],dl
 209:	48                   	dec    eax
 20a:	00 00                	add    BYTE PTR [eax],al
 20c:	00 01                	add    BYTE PTR [ecx],al
 20e:	2e                   	cs
 20f:	4f                   	dec    edi
 210:	00 00                	add    BYTE PTR [eax],al
 212:	00 ab 00 10 03 4a    	add    BYTE PTR [ebx+0x4a031000],ch
 218:	01 00                	add    DWORD PTR [eax],eax
 21a:	00 01                	add    BYTE PTR [ecx],al
 21c:	9c                   	pushf  
 21d:	98                   	cwde   
 21e:	02 00                	add    al,BYTE PTR [eax]
 220:	00 0e                	add    BYTE PTR [esi],cl
 222:	dc 02                	fadd   QWORD PTR [edx]
 224:	00 00                	add    BYTE PTR [eax],al
 226:	01 2e                	add    DWORD PTR [esi],ebp
 228:	74 00                	je     22a <execInternalCommand-0x30ffdd6>
 22a:	00 00                	add    BYTE PTR [eax],al
 22c:	02 91 00 0e f8 01    	add    dl,BYTE PTR [ecx+0x1f80e00]
 232:	00 00                	add    BYTE PTR [eax],al
 234:	01 2e                	add    DWORD PTR [esi],ebp
 236:	a9 02 00 00 02       	test   eax,0x2000002
 23b:	91                   	xchg   ecx,eax
 23c:	04 0e                	add    al,0xe
 23e:	ac                   	lods   al,BYTE PTR ds:[esi]
 23f:	02 00                	add    al,BYTE PTR [eax]
 241:	00 01                	add    BYTE PTR [ecx],al
 243:	2e                   	cs
 244:	4f                   	dec    edi
 245:	00 00                	add    BYTE PTR [eax],al
 247:	00 02                	add    BYTE PTR [edx],al
 249:	91                   	xchg   ecx,eax
 24a:	08 0f                	or     BYTE PTR [edi],cl
 24c:	78 00                	js     24e <execInternalCommand-0x30ffdb2>
 24e:	01 30                	add    DWORD PTR [eax],esi
 250:	4f                   	dec    edi
 251:	00 00                	add    BYTE PTR [eax],al
 253:	00 02                	add    BYTE PTR [edx],al
 255:	91                   	xchg   ecx,eax
 256:	6c                   	ins    BYTE PTR es:[edi],dx
 257:	0f 79 00             	vmwrite eax,DWORD PTR [eax]
 25a:	01 30                	add    DWORD PTR [eax],esi
 25c:	4f                   	dec    edi
 25d:	00 00                	add    BYTE PTR [eax],al
 25f:	00 02                	add    BYTE PTR [edx],al
 261:	91                   	xchg   ecx,eax
 262:	68 13 17 00 00       	push   0x1713
 267:	00 01                	add    BYTE PTR [ecx],al
 269:	31 4f 00             	xor    DWORD PTR [edi+0x0],ecx
 26c:	00 00                	add    BYTE PTR [eax],al
 26e:	02 91 64 13 86 00    	add    dl,BYTE PTR [ecx+0x861364]
 274:	00 00                	add    BYTE PTR [eax],al
 276:	01 31                	add    DWORD PTR [ecx],esi
 278:	4f                   	dec    edi
 279:	00 00                	add    BYTE PTR [eax],al
 27b:	00 02                	add    BYTE PTR [edx],al
 27d:	91                   	xchg   ecx,eax
 27e:	60                   	pusha  
 27f:	14 e2                	adc    al,0xe2
 281:	00 10                	add    BYTE PTR [eax],dl
 283:	03 ec                	add    ebp,esp
 285:	00 00                	add    BYTE PTR [eax],al
 287:	00 0f                	add    BYTE PTR [edi],cl
 289:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 28c:	00 01                	add    BYTE PTR [ecx],al
 28e:	35 33 00 00 00       	xor    eax,0x33
 293:	02 91 5c 00 00 15    	add    dl,BYTE PTR [ecx+0x1500005c]
 299:	7a 00                	jp     29b <execInternalCommand-0x30ffd65>
 29b:	00 00                	add    BYTE PTR [eax],al
 29d:	a9 02 00 00 16       	test   eax,0x16000002
 2a2:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 2a5:	00 ff                	add    bh,bh
 2a7:	01 00                	add    DWORD PTR [eax],eax
 2a9:	05 04 98 02 00       	add    eax,0x29804
 2ae:	00 12                	add    BYTE PTR [edx],dl
 2b0:	f0 02 00             	lock add al,BYTE PTR [eax]
 2b3:	00 01                	add    BYTE PTR [ecx],al
 2b5:	53                   	push   ebx
 2b6:	4f                   	dec    edi
 2b7:	00 00                	add    BYTE PTR [eax],al
 2b9:	00 f5                	add    ch,dh
 2bb:	01 10                	add    DWORD PTR [eax],edx
 2bd:	03 69 00             	add    ebp,DWORD PTR [ecx+0x0]
 2c0:	00 00                	add    BYTE PTR [eax],al
 2c2:	01 9c f1 02 00 00 0e 	add    DWORD PTR [ecx+esi*8+0xe000002],ebx
 2c9:	50                   	push   eax
 2ca:	03 00                	add    eax,DWORD PTR [eax]
 2cc:	00 01                	add    BYTE PTR [ecx],al
 2ce:	53                   	push   ebx
 2cf:	74 00                	je     2d1 <execInternalCommand-0x30ffd2f>
 2d1:	00 00                	add    BYTE PTR [eax],al
 2d3:	02 91 00 0f 69 00    	add    dl,BYTE PTR [ecx+0x690f00]
 2d9:	01 55 33             	add    DWORD PTR [ebp+0x33],edx
 2dc:	00 00                	add    BYTE PTR [eax],al
 2de:	00 02                	add    BYTE PTR [edx],al
 2e0:	91                   	xchg   ecx,eax
 2e1:	6c                   	ins    BYTE PTR es:[edi],dx
 2e2:	0f 72                	(bad)  
 2e4:	65                   	gs
 2e5:	74 00                	je     2e7 <execInternalCommand-0x30ffd19>
 2e7:	01 56 4f             	add    DWORD PTR [esi+0x4f],edx
 2ea:	00 00                	add    BYTE PTR [eax],al
 2ec:	00 02                	add    BYTE PTR [edx],al
 2ee:	91                   	xchg   ecx,eax
 2ef:	68 00 12 3a 02       	push   0x23a1200
 2f4:	00 00                	add    BYTE PTR [eax],al
 2f6:	01 67 af             	add    DWORD PTR [edi-0x51],esp
 2f9:	03 00                	add    eax,DWORD PTR [eax]
 2fb:	00 5e 02             	add    BYTE PTR [esi+0x2],bl
 2fe:	10 03                	adc    BYTE PTR [ebx],al
 300:	8e 02                	mov    es,WORD PTR [edx]
 302:	00 00                	add    BYTE PTR [eax],al
 304:	01 9c af 03 00 00 0e 	add    DWORD PTR [edi+ebp*4+0xe000003],ebx
 30b:	59                   	pop    ecx
 30c:	00 00                	add    BYTE PTR [eax],al
 30e:	00 01                	add    BYTE PTR [ecx],al
 310:	67 b5 03             	addr16 mov ch,0x3
 313:	00 00                	add    BYTE PTR [eax],al
 315:	02 91 00 0f 61 72    	add    dl,BYTE PTR [ecx+0x72610f00]
 31b:	67 00 01             	add    BYTE PTR [bx+di],al
 31e:	69 74 00 00 00 02 91 	imul   esi,DWORD PTR [eax+eax*1+0x0],0x6c910200
 325:	6c 
 326:	13 fc                	adc    edi,esp
 328:	02 00                	add    al,BYTE PTR [eax]
 32a:	00 01                	add    BYTE PTR [ecx],al
 32c:	6a 74                	push   0x74
 32e:	00 00                	add    BYTE PTR [eax],al
 330:	00 02                	add    BYTE PTR [edx],al
 332:	91                   	xchg   ecx,eax
 333:	68 13 a5 01 00       	push   0x1a513
 338:	00 01                	add    BYTE PTR [ecx],al
 33a:	6b 4f 00 00          	imul   ecx,DWORD PTR [edi+0x0],0x0
 33e:	00 02                	add    BYTE PTR [edx],al
 340:	91                   	xchg   ecx,eax
 341:	64 13 56 01          	adc    edx,DWORD PTR fs:[esi+0x1]
 345:	00 00                	add    BYTE PTR [eax],al
 347:	01 6c 4f 00          	add    DWORD PTR [edi+ecx*2+0x0],ebp
 34b:	00 00                	add    BYTE PTR [eax],al
 34d:	02 91 60 13 a4 01    	add    dl,BYTE PTR [ecx+0x1a41360]
 353:	00 00                	add    BYTE PTR [eax],al
 355:	01 6d 4f             	add    DWORD PTR [ebp+0x4f],ebp
 358:	00 00                	add    BYTE PTR [eax],al
 35a:	00 02                	add    BYTE PTR [edx],al
 35c:	91                   	xchg   ecx,eax
 35d:	5c                   	pop    esp
 35e:	13 e1                	adc    esp,ecx
 360:	01 00                	add    DWORD PTR [eax],eax
 362:	00 01                	add    BYTE PTR [ecx],al
 364:	6e                   	outs   dx,BYTE PTR ds:[esi]
 365:	4f                   	dec    edi
 366:	00 00                	add    BYTE PTR [eax],al
 368:	00 02                	add    BYTE PTR [edx],al
 36a:	91                   	xchg   ecx,eax
 36b:	58                   	pop    eax
 36c:	13 de                	adc    ebx,esi
 36e:	01 00                	add    DWORD PTR [eax],eax
 370:	00 01                	add    BYTE PTR [ecx],al
 372:	6f                   	outs   dx,DWORD PTR ds:[esi]
 373:	4f                   	dec    edi
 374:	00 00                	add    BYTE PTR [eax],al
 376:	00 02                	add    BYTE PTR [edx],al
 378:	91                   	xchg   ecx,eax
 379:	54                   	push   esp
 37a:	13 3f                	adc    edi,DWORD PTR [edi]
 37c:	02 00                	add    al,BYTE PTR [eax]
 37e:	00 01                	add    BYTE PTR [ecx],al
 380:	70 af                	jo     331 <execInternalCommand-0x30ffccf>
 382:	03 00                	add    eax,DWORD PTR [eax]
 384:	00 02                	add    BYTE PTR [edx],al
 386:	91                   	xchg   ecx,eax
 387:	50                   	push   eax
 388:	13 b1 02 00 00 01    	adc    esi,DWORD PTR [ecx+0x1000002]
 38e:	71 af                	jno    33f <execInternalCommand-0x30ffcc1>
 390:	03 00                	add    eax,DWORD PTR [eax]
 392:	00 02                	add    BYTE PTR [edx],al
 394:	91                   	xchg   ecx,eax
 395:	4c                   	dec    esp
 396:	14 1f                	adc    al,0x1f
 398:	04 10                	add    al,0x10
 39a:	03 9e 00 00 00 13    	add    ebx,DWORD PTR [esi+0x13000000]
 3a0:	39 00                	cmp    DWORD PTR [eax],eax
 3a2:	00 00                	add    BYTE PTR [eax],al
 3a4:	01 ca                	add    edx,ecx
 3a6:	74 00                	je     3a8 <execInternalCommand-0x30ffc58>
 3a8:	00 00                	add    BYTE PTR [eax],al
 3aa:	02 91 48 00 00 05    	add    dl,BYTE PTR [ecx+0x5000048]
 3b0:	04 74                	add    al,0x74
 3b2:	00 00                	add    BYTE PTR [eax],al
 3b4:	00 05 04 bb 03 00    	add    BYTE PTR ds:0x3bb04,al
 3ba:	00 17                	add    BYTE PTR [edi],dl
 3bc:	7a 00                	jp     3be <execInternalCommand-0x30ffc42>
 3be:	00 00                	add    BYTE PTR [eax],al
 3c0:	18 10                	sbb    BYTE PTR [eax],dl
 3c2:	00 00                	add    BYTE PTR [eax],al
 3c4:	00 01                	add    BYTE PTR [ecx],al
 3c6:	e0 ec                	loopne 3b4 <execInternalCommand-0x30ffc4c>
 3c8:	04 10                	add    al,0x10
 3ca:	03 58 00             	add    ebx,DWORD PTR [eax+0x0]
 3cd:	00 00                	add    BYTE PTR [eax],al
 3cf:	01 9c ee 03 00 00 14 	add    DWORD PTR [esi+ebp*8+0x14000003],ebx
 3d6:	02 05 10 03 3f 00    	add    al,BYTE PTR ds:0x3f0310
 3dc:	00 00                	add    BYTE PTR [eax],al
 3de:	0f 63 6e 74          	packsswb mm5,QWORD PTR [esi+0x74]
 3e2:	00 01                	add    BYTE PTR [ecx],al
 3e4:	e3 33                	jecxz  419 <execInternalCommand-0x30ffbe7>
 3e6:	00 00                	add    BYTE PTR [eax],al
 3e8:	00 02                	add    BYTE PTR [edx],al
 3ea:	91                   	xchg   ecx,eax
 3eb:	6c                   	ins    BYTE PTR es:[edi],dx
 3ec:	00 00                	add    BYTE PTR [eax],al
 3ee:	12 97 01 00 00 01    	adc    dl,BYTE PTR [edi+0x1000001]
 3f4:	e7 af                	out    0xaf,eax
 3f6:	03 00                	add    eax,DWORD PTR [eax]
 3f8:	00 44 05 10          	add    BYTE PTR [ebp+eax*1+0x10],al
 3fc:	03 7c 00 00          	add    edi,DWORD PTR [eax+eax*1+0x0]
 400:	00 01                	add    BYTE PTR [ecx],al
 402:	9c                   	pushf  
 403:	4a                   	dec    edx
 404:	04 00                	add    al,0x0
 406:	00 0e                	add    BYTE PTR [esi],cl
 408:	82                   	(bad)  
 409:	01 00                	add    DWORD PTR [eax],eax
 40b:	00 01                	add    BYTE PTR [ecx],al
 40d:	e7 4f                	out    0x4f,eax
 40f:	00 00                	add    BYTE PTR [eax],al
 411:	00 02                	add    BYTE PTR [edx],al
 413:	91                   	xchg   ecx,eax
 414:	00 0e                	add    BYTE PTR [esi],cl
 416:	f8                   	clc    
 417:	01 00                	add    DWORD PTR [eax],eax
 419:	00 01                	add    BYTE PTR [ecx],al
 41b:	e7 a9                	out    0xa9,eax
 41d:	02 00                	add    al,BYTE PTR [eax]
 41f:	00 02                	add    BYTE PTR [edx],al
 421:	91                   	xchg   ecx,eax
 422:	04 13                	add    al,0x13
 424:	9a 00 00 00 01 e9 af 	call   0xafe9:0x1000000
 42b:	03 00                	add    eax,DWORD PTR [eax]
 42d:	00 02                	add    BYTE PTR [edx],al
 42f:	91                   	xchg   ecx,eax
 430:	68 14 5f 05 10       	push   0x10055f14
 435:	03 5e 00             	add    ebx,DWORD PTR [esi+0x0]
 438:	00 00                	add    BYTE PTR [eax],al
 43a:	0f 63 6e 74          	packsswb mm5,QWORD PTR [esi+0x74]
 43e:	00 01                	add    BYTE PTR [ecx],al
 440:	eb 4f                	jmp    491 <execInternalCommand-0x30ffb6f>
 442:	00 00                	add    BYTE PTR [eax],al
 444:	00 02                	add    BYTE PTR [edx],al
 446:	91                   	xchg   ecx,eax
 447:	6c                   	ins    BYTE PTR es:[edi],dx
 448:	00 00                	add    BYTE PTR [eax],al
 44a:	0d 6e 01 00 00       	or     eax,0x16e
 44f:	01 f2                	add    edx,esi
 451:	c0 05 10 03 3d 00 00 	rol    BYTE PTR ds:0x3d0310,0x0
 458:	00 01                	add    BYTE PTR [ecx],al
 45a:	9c                   	pushf  
 45b:	94                   	xchg   esp,eax
 45c:	04 00                	add    al,0x0
 45e:	00 0e                	add    BYTE PTR [esi],cl
 460:	82                   	(bad)  
 461:	01 00                	add    DWORD PTR [eax],eax
 463:	00 01                	add    BYTE PTR [ecx],al
 465:	f2 4f                	repnz dec edi
 467:	00 00                	add    BYTE PTR [eax],al
 469:	00 02                	add    BYTE PTR [edx],al
 46b:	91                   	xchg   ecx,eax
 46c:	00 0e                	add    BYTE PTR [esi],cl
 46e:	f8                   	clc    
 46f:	01 00                	add    DWORD PTR [eax],eax
 471:	00 01                	add    BYTE PTR [ecx],al
 473:	f2 af                	repnz scas eax,DWORD PTR es:[edi]
 475:	03 00                	add    eax,DWORD PTR [eax]
 477:	00 02                	add    BYTE PTR [edx],al
 479:	91                   	xchg   ecx,eax
 47a:	04 14                	add    al,0x14
 47c:	c6 05 10 03 26 00 00 	mov    BYTE PTR ds:0x260310,0x0
 483:	00 0f                	add    BYTE PTR [edi],cl
 485:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 488:	00 01                	add    BYTE PTR [ecx],al
 48a:	f4                   	hlt    
 48b:	4f                   	dec    edi
 48c:	00 00                	add    BYTE PTR [eax],al
 48e:	00 02                	add    BYTE PTR [edx],al
 490:	91                   	xchg   ecx,eax
 491:	6c                   	ins    BYTE PTR es:[edi],dx
 492:	00 00                	add    BYTE PTR [eax],al
 494:	0d 96 02 00 00       	or     eax,0x296
 499:	01 f9                	add    ecx,edi
 49b:	fd                   	std    
 49c:	05 10 03 93 00       	add    eax,0x930310
 4a1:	00 00                	add    BYTE PTR [eax],al
 4a3:	01 9c f1 04 00 00 0e 	add    DWORD PTR [ecx+esi*8+0xe000004],ebx
 4aa:	92                   	xchg   edx,eax
 4ab:	00 00                	add    BYTE PTR [eax],al
 4ad:	00 01                	add    BYTE PTR [ecx],al
 4af:	f9                   	stc    
 4b0:	74 00                	je     4b2 <execInternalCommand-0x30ffb4e>
 4b2:	00 00                	add    BYTE PTR [eax],al
 4b4:	02 91 00 13 f8 01    	add    dl,BYTE PTR [ecx+0x1f81300]
 4ba:	00 00                	add    BYTE PTR [eax],al
 4bc:	01 fb                	add    ebx,edi
 4be:	f1                   	icebp  
 4bf:	04 00                	add    al,0x0
 4c1:	00 03                	add    BYTE PTR [ebx],al
 4c3:	91                   	xchg   ecx,eax
 4c4:	e4 57                	in     al,0x57
 4c6:	13 77 01             	adc    esi,DWORD PTR [edi+0x1]
 4c9:	00 00                	add    BYTE PTR [eax],al
 4cb:	01 fc                	add    esp,edi
 4cd:	4f                   	dec    edi
 4ce:	00 00                	add    BYTE PTR [eax],al
 4d0:	00 02                	add    BYTE PTR [edx],al
 4d2:	91                   	xchg   ecx,eax
 4d3:	6c                   	ins    BYTE PTR es:[edi],dx
 4d4:	0f 70 69 64 00       	pshufw mm5,QWORD PTR [ecx+0x64],0x0
 4d9:	01 fd                	add    ebp,edi
 4db:	8c 00                	mov    WORD PTR [eax],es
 4dd:	00 00                	add    BYTE PTR [eax],al
 4df:	02 91 68 13 a7 02    	add    dl,BYTE PTR [ecx+0x2a71368]
 4e5:	00 00                	add    BYTE PTR [eax],al
 4e7:	01 ff                	add    edi,edi
 4e9:	8c 00                	mov    WORD PTR [eax],es
 4eb:	00 00                	add    BYTE PTR [eax],al
 4ed:	02 91 64 00 15 7a    	add    dl,BYTE PTR [ecx+0x7a150064]
 4f3:	00 00                	add    BYTE PTR [eax],al
 4f5:	00 08                	add    BYTE PTR [eax],cl
 4f7:	05 00 00 19 6b       	add    eax,0x6b190000
 4fc:	00 00                	add    BYTE PTR [eax],al
 4fe:	00 09                	add    BYTE PTR [ecx],cl
 500:	16                   	push   ss
 501:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 504:	00 ff                	add    bh,bh
 506:	01 00                	add    DWORD PTR [eax],eax
 508:	1a 04 03             	sbb    al,BYTE PTR [ebx+eax*1]
 50b:	00 00                	add    BYTE PTR [eax],al
 50d:	01 11                	add    DWORD PTR [ecx],edx
 50f:	01 90 06 10 03 67    	add    DWORD PTR [eax+0x67031006],edx
 515:	00 00                	add    BYTE PTR [eax],al
 517:	00 01                	add    BYTE PTR [ecx],al
 519:	9c                   	pushf  
 51a:	4d                   	dec    ebp
 51b:	05 00 00 1b 92       	add    eax,0x921b0000
 520:	00 00                	add    BYTE PTR [eax],al
 522:	00 01                	add    BYTE PTR [ecx],al
 524:	11 01                	adc    DWORD PTR [ecx],eax
 526:	74 00                	je     528 <execInternalCommand-0x30ffad8>
 528:	00 00                	add    BYTE PTR [eax],al
 52a:	02 91 00 1c f8 01    	add    dl,BYTE PTR [ecx+0x1f81c00]
 530:	00 00                	add    BYTE PTR [eax],al
 532:	01 13                	add    DWORD PTR [ebx],edx
 534:	01 f1                	add    ecx,esi
 536:	04 00                	add    al,0x0
 538:	00 03                	add    BYTE PTR [ebx],al
 53a:	91                   	xchg   ecx,eax
 53b:	ec                   	in     al,dx
 53c:	57                   	push   edi
 53d:	1c 77                	sbb    al,0x77
 53f:	01 00                	add    DWORD PTR [eax],eax
 541:	00 01                	add    BYTE PTR [ecx],al
 543:	14 01                	adc    al,0x1
 545:	4f                   	dec    edi
 546:	00 00                	add    BYTE PTR [eax],al
 548:	00 02                	add    BYTE PTR [edx],al
 54a:	91                   	xchg   ecx,eax
 54b:	6c                   	ins    BYTE PTR es:[edi],dx
 54c:	00 1a                	add    BYTE PTR [edx],bl
 54e:	27                   	daa    
 54f:	00 00                	add    BYTE PTR [eax],al
 551:	00 01                	add    BYTE PTR [ecx],al
 553:	1f                   	pop    ds
 554:	01 f7                	add    edi,esi
 556:	06                   	push   es
 557:	10 03                	adc    BYTE PTR [ebx],al
 559:	58                   	pop    eax
 55a:	00 00                	add    BYTE PTR [eax],al
 55c:	00 01                	add    BYTE PTR [ecx],al
 55e:	9c                   	pushf  
 55f:	83 05 00 00 1b 92 00 	add    DWORD PTR ds:0x921b0000,0x0
 566:	00 00                	add    BYTE PTR [eax],al
 568:	01 1f                	add    DWORD PTR [edi],ebx
 56a:	01 74 00 00          	add    DWORD PTR [eax+eax*1+0x0],esi
 56e:	00 02                	add    BYTE PTR [edx],al
 570:	91                   	xchg   ecx,eax
 571:	00 1c f8             	add    BYTE PTR [eax+edi*8],bl
 574:	01 00                	add    DWORD PTR [eax],eax
 576:	00 01                	add    BYTE PTR [ecx],al
 578:	21 01                	and    DWORD PTR [ecx],eax
 57a:	f1                   	icebp  
 57b:	04 00                	add    al,0x0
 57d:	00 03                	add    BYTE PTR [ebx],al
 57f:	91                   	xchg   ecx,eax
 580:	f0 57                	lock push edi
 582:	00 1d 58 03 00 00    	add    BYTE PTR ds:0x358,bl
 588:	01 2c 01             	add    DWORD PTR [ecx+eax*1],ebp
 58b:	4f                   	dec    edi
 58c:	00 00                	add    BYTE PTR [eax],al
 58e:	00 4f 07             	add    BYTE PTR [edi+0x7],cl
 591:	10 03                	adc    BYTE PTR [ebx],al
 593:	e8 01 00 00 01       	call   1000599 <execInternalCommand-0x20ffa67>
 598:	9c                   	pushf  
 599:	73 06                	jae    5a1 <execInternalCommand-0x30ffa5f>
 59b:	00 00                	add    BYTE PTR [eax],al
 59d:	1b e1                	sbb    esp,ecx
 59f:	01 00                	add    DWORD PTR [eax],eax
 5a1:	00 01                	add    BYTE PTR [ecx],al
 5a3:	2c 01                	sub    al,0x1
 5a5:	4f                   	dec    edi
 5a6:	00 00                	add    BYTE PTR [eax],al
 5a8:	00 02                	add    BYTE PTR [edx],al
 5aa:	91                   	xchg   ecx,eax
 5ab:	00 1b                	add    BYTE PTR [ebx],bl
 5ad:	3f                   	aas    
 5ae:	02 00                	add    al,BYTE PTR [eax]
 5b0:	00 01                	add    BYTE PTR [ecx],al
 5b2:	2c 01                	sub    al,0x1
 5b4:	af                   	scas   eax,DWORD PTR es:[edi]
 5b5:	03 00                	add    eax,DWORD PTR [eax]
 5b7:	00 02                	add    BYTE PTR [edx],al
 5b9:	91                   	xchg   ecx,eax
 5ba:	04 1c                	add    al,0x1c
 5bc:	00 01                	add    BYTE PTR [ecx],al
 5be:	00 00                	add    BYTE PTR [eax],al
 5c0:	01 2e                	add    DWORD PTR [esi],ebp
 5c2:	01 73 06             	add    DWORD PTR [ebx+0x6],esi
 5c5:	00 00                	add    BYTE PTR [eax],al
 5c7:	03 91 dc 7d 1c 60    	add    edx,DWORD PTR [ecx+0x601c7ddc]
 5cd:	02 00                	add    al,BYTE PTR [eax]
 5cf:	00 01                	add    BYTE PTR [ecx],al
 5d1:	2f                   	das    
 5d2:	01 81 00 00 00 03    	add    DWORD PTR [ecx+0x3000000],eax
 5d8:	91                   	xchg   ecx,eax
 5d9:	db 7d 1c             	fstp   TBYTE PTR [ebp+0x1c]
 5dc:	68 00 00 00 01       	push   0x1000000
 5e1:	30 01                	xor    BYTE PTR [ecx],al
 5e3:	4f                   	dec    edi
 5e4:	00 00                	add    BYTE PTR [eax],al
 5e6:	00 02                	add    BYTE PTR [edx],al
 5e8:	91                   	xchg   ecx,eax
 5e9:	6c                   	ins    BYTE PTR es:[edi],dx
 5ea:	1c 4d                	sbb    al,0x4d
 5ec:	01 00                	add    DWORD PTR [eax],eax
 5ee:	00 01                	add    BYTE PTR [ecx],al
 5f0:	31 01                	xor    DWORD PTR [ecx],eax
 5f2:	83 06 00             	add    DWORD PTR [esi],0x0
 5f5:	00 03                	add    BYTE PTR [ebx],al
 5f7:	91                   	xchg   ecx,eax
 5f8:	97                   	xchg   edi,eax
 5f9:	6a 1c                	push   0x1c
 5fb:	1a 03                	sbb    al,BYTE PTR [ebx]
 5fd:	00 00                	add    BYTE PTR [eax],al
 5ff:	01 32                	add    DWORD PTR [edx],esi
 601:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 604:	00 00                	add    BYTE PTR [eax],al
 606:	02 91 68 1c 70 02    	add    dl,BYTE PTR [ecx+0x2701c68]
 60c:	00 00                	add    BYTE PTR [eax],al
 60e:	01 33                	add    DWORD PTR [ebx],esi
 610:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 613:	00 00                	add    BYTE PTR [eax],al
 615:	02 91 64 1c 2f 03    	add    dl,BYTE PTR [ecx+0x32f1c64]
 61b:	00 00                	add    BYTE PTR [eax],al
 61d:	01 34 01             	add    DWORD PTR [ecx+eax*1],esi
 620:	4f                   	dec    edi
 621:	00 00                	add    BYTE PTR [eax],al
 623:	00 02                	add    BYTE PTR [edx],al
 625:	91                   	xchg   ecx,eax
 626:	60                   	pusha  
 627:	1c 8e                	sbb    al,0x8e
 629:	02 00                	add    al,BYTE PTR [eax]
 62b:	00 01                	add    BYTE PTR [ecx],al
 62d:	35 01 99 06 00       	xor    eax,0x69901
 632:	00 03                	add    BYTE PTR [ebx],al
 634:	91                   	xchg   ecx,eax
 635:	83 6a 1e c9          	sub    DWORD PTR [edx+0x1e],0xffffffc9
 639:	01 00                	add    DWORD PTR [eax],eax
 63b:	00 01                	add    BYTE PTR [ecx],al
 63d:	40                   	inc    eax
 63e:	01 cd                	add    ebp,ecx
 640:	07                   	pop    es
 641:	10 03                	adc    BYTE PTR [ebx],al
 643:	1e                   	push   ds
 644:	5f                   	pop    edi
 645:	03 00                	add    eax,DWORD PTR [eax]
 647:	00 01                	add    BYTE PTR [ecx],al
 649:	45                   	inc    ebp
 64a:	01 09                	add    DWORD PTR [ecx],ecx
 64c:	08 10                	or     BYTE PTR [eax],dl
 64e:	03 1e                	add    ebx,DWORD PTR [esi]
 650:	00 00                	add    BYTE PTR [eax],al
 652:	00 00                	add    BYTE PTR [eax],al
 654:	01 94 01 b0 08 10 03 	add    DWORD PTR [ecx+eax*1+0x31008b0],edx
 65b:	14 cd                	adc    al,0xcd
 65d:	07                   	pop    es
 65e:	10 03                	adc    BYTE PTR [ebx],al
 660:	51                   	push   ecx
 661:	01 00                	add    DWORD PTR [eax],eax
 663:	00 1f                	add    BYTE PTR [edi],bl
 665:	69 00 01 97 01 4f    	imul   eax,DWORD PTR [eax],0x4f019701
 66b:	00 00                	add    BYTE PTR [eax],al
 66d:	00 02                	add    BYTE PTR [edx],al
 66f:	91                   	xchg   ecx,eax
 670:	5c                   	pop    esp
 671:	00 00                	add    BYTE PTR [eax],al
 673:	15 7a 00 00 00       	adc    eax,0x7a
 678:	83 06 00             	add    DWORD PTR [esi],0x0
 67b:	00 19                	add    BYTE PTR [ecx],bl
 67d:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 680:	00 ff                	add    bh,bh
 682:	00 15 7a 00 00 00    	add    BYTE PTR ds:0x7a,dl
 688:	99                   	cdq    
 689:	06                   	push   es
 68a:	00 00                	add    BYTE PTR [eax],al
 68c:	19 6b 00             	sbb    DWORD PTR [ebx+0x0],ebp
 68f:	00 00                	add    BYTE PTR [eax],al
 691:	31 19                	xor    DWORD PTR [ecx],ebx
 693:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 696:	00 31                	add    BYTE PTR [ecx],dh
 698:	00 15 7a 00 00 00    	add    BYTE PTR ds:0x7a,dl
 69e:	a9 06 00 00 19       	test   eax,0x19000006
 6a3:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 6a6:	00 13                	add    BYTE PTR [ebx],dl
 6a8:	00 20                	add    BYTE PTR [eax],ah
 6aa:	b7 02                	mov    bh,0x2
 6ac:	00 00                	add    BYTE PTR [eax],al
 6ae:	05 32 8c 00 00       	add    eax,0x8c32
 6b3:	00 05 03 ec 12 10    	add    BYTE PTR ds:0x1012ec03,al
 6b9:	03 20                	add    esp,DWORD PTR [eax]
 6bb:	d5 01                	aad    0x1
 6bd:	00 00                	add    BYTE PTR [eax],al
 6bf:	05 33 8c 00 00       	add    eax,0x8c33
 6c4:	00 05 03 f0 12 10    	add    BYTE PTR ds:0x1012f003,al
 6ca:	03 20                	add    esp,DWORD PTR [eax]
 6cc:	1f                   	pop    ds
 6cd:	00 00                	add    BYTE PTR [eax],al
 6cf:	00 05 34 8c 00 00    	add    BYTE PTR ds:0x8c34,al
 6d5:	00 05 03 e8 12 10    	add    BYTE PTR ds:0x1012e803,al
 6db:	03 20                	add    esp,DWORD PTR [eax]
 6dd:	0b 03                	or     eax,DWORD PTR [ebx]
 6df:	00 00                	add    BYTE PTR [eax],al
 6e1:	03 63 1f             	add    esp,DWORD PTR [ebx+0x1f]
 6e4:	01 00                	add    DWORD PTR [eax],eax
 6e6:	00 05 03 f8 12 10    	add    BYTE PTR ds:0x1012f803,al
 6ec:	03 20                	add    esp,DWORD PTR [eax]
 6ee:	c0 02 00             	rol    BYTE PTR [edx],0x0
 6f1:	00 03                	add    BYTE PTR [ebx],al
 6f3:	e1 6e                	loope  763 <execInternalCommand-0x30ff89d>
 6f5:	01 00                	add    DWORD PTR [eax],eax
 6f7:	00 05 03 e4 12 10    	add    BYTE PTR ds:0x1012e403,al
 6fd:	03 20                	add    esp,DWORD PTR [eax]
 6ff:	e6 01                	out    0x1,al
 701:	00 00                	add    BYTE PTR [eax],al
 703:	04 1f                	add    al,0x1f
 705:	98                   	cwde   
 706:	02 00                	add    al,BYTE PTR [eax]
 708:	00 05 03 e0 10 10    	add    BYTE PTR ds:0x1010e003,al
 70e:	03 20                	add    esp,DWORD PTR [eax]
 710:	09 01                	or     DWORD PTR [ecx],eax
 712:	00 00                	add    BYTE PTR [eax],al
 714:	04 20                	add    al,0x20
 716:	74 00                	je     718 <execInternalCommand-0x30ff8e8>
 718:	00 00                	add    BYTE PTR [eax],al
 71a:	05 03 00 13 10       	add    eax,0x10130003
 71f:	03 15 c0 01 00 00    	add    edx,DWORD PTR ds:0x1c0
 725:	30 07                	xor    BYTE PTR [edi],al
 727:	00 00                	add    BYTE PTR [eax],al
 729:	19 6b 00             	sbb    DWORD PTR [ebx+0x0],ebp
 72c:	00 00                	add    BYTE PTR [eax],al
 72e:	03 00                	add    eax,DWORD PTR [eax]
 730:	20 27                	and    BYTE PTR [edi],ah
 732:	01 00                	add    DWORD PTR [eax],eax
 734:	00 04 21             	add    BYTE PTR [ecx+eiz*1],al
 737:	20 07                	and    BYTE PTR [edi],al
 739:	00 00                	add    BYTE PTR [eax],al
 73b:	05 03 a0 0f 10       	add    eax,0x100fa003
 740:	03 21                	add    esp,DWORD PTR [ecx]
 742:	20 5d 01             	and    BYTE PTR [ebp+0x1],bl
 745:	00 00                	add    BYTE PTR [eax],al
 747:	04 27                	add    al,0x27
 749:	53                   	push   ebx
 74a:	07                   	pop    es
 74b:	00 00                	add    BYTE PTR [eax],al
 74d:	05 03 f4 12 10       	add    eax,0x1012f403
 752:	03 05 04 41 07 00    	add    eax,DWORD PTR ds:0x74104
 758:	00 22                	add    BYTE PTR [edx],ah
 75a:	64                   	fs
 75b:	07                   	pop    es
 75c:	00 00                	add    BYTE PTR [eax],al
 75e:	23 74 00 00          	and    esi,DWORD PTR [eax+eax*1+0x0]
 762:	00 00                	add    BYTE PTR [eax],al
 764:	20 ac 01 00 00 04 28 	and    BYTE PTR [ecx+eax*1+0x28040000],ch
 76b:	75 07                	jne    774 <execInternalCommand-0x30ff88c>
 76d:	00 00                	add    BYTE PTR [eax],al
 76f:	05 03 e0 12 10       	add    eax,0x1012e003
 774:	03 05 04 59 07 00    	add    eax,DWORD PTR ds:0x75904
 77a:	00 20                	add    BYTE PTR [eax],ah
 77c:	1c 01                	sbb    al,0x1
 77e:	00 00                	add    BYTE PTR [eax],al
 780:	01 12                	add    DWORD PTR [edx],edx
 782:	97                   	xchg   edi,eax
 783:	00 00                	add    BYTE PTR [eax],al
 785:	00 05 03 c0 10 10    	add    BYTE PTR ds:0x1010c003,al
 78b:	03 20                	add    esp,DWORD PTR [eax]
 78d:	44                   	inc    esp
 78e:	02 00                	add    al,BYTE PTR [eax]
 790:	00 01                	add    BYTE PTR [ecx],al
 792:	13 8c 00 00 00 05 03 	adc    ecx,DWORD PTR [eax+eax*1+0x3050000]
 799:	c4 10                	les    edx,FWORD PTR [eax]
 79b:	10 03                	adc    BYTE PTR [ebx],al
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
  28:	00 04 0f             	add    BYTE PTR [edi+ecx*1],al
  2b:	00 0b                	add    BYTE PTR [ebx],cl
  2d:	0b 00                	or     eax,DWORD PTR [eax]
  2f:	00 05 0f 00 0b 0b    	add    BYTE PTR ds:0xb0b000f,al
  35:	49                   	dec    ecx
  36:	13 00                	adc    eax,DWORD PTR [eax]
  38:	00 06                	add    BYTE PTR [esi],al
  3a:	16                   	push   ss
  3b:	00 03                	add    BYTE PTR [ebx],al
  3d:	0e                   	push   cs
  3e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  40:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  42:	49                   	dec    ecx
  43:	13 00                	adc    eax,DWORD PTR [eax]
  45:	00 07                	add    BYTE PTR [edi],al
  47:	13 01                	adc    eax,DWORD PTR [ecx]
  49:	0b 0b                	or     ecx,DWORD PTR [ebx]
  4b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  4d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  4f:	01 13                	add    DWORD PTR [ebx],edx
  51:	00 00                	add    BYTE PTR [eax],al
  53:	08 0d 00 03 0e 3a    	or     BYTE PTR ds:0x3a0e0300,cl
  59:	0b 3b                	or     edi,DWORD PTR [ebx]
  5b:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  5e:	0b 0b                	or     ecx,DWORD PTR [ebx]
  60:	0d 0b 0c 0b 38       	or     eax,0x380b0c0b
  65:	0b 00                	or     eax,DWORD PTR [eax]
  67:	00 09                	add    BYTE PTR [ecx],cl
  69:	17                   	pop    ss
  6a:	01 0b                	add    DWORD PTR [ebx],ecx
  6c:	0b 3a                	or     edi,DWORD PTR [edx]
  6e:	0b 3b                	or     edi,DWORD PTR [ebx]
  70:	0b 01                	or     eax,DWORD PTR [ecx]
  72:	13 00                	adc    eax,DWORD PTR [eax]
  74:	00 0a                	add    BYTE PTR [edx],cl
  76:	0d 00 49 13 00       	or     eax,0x134900
  7b:	00 0b                	add    BYTE PTR [ebx],cl
  7d:	0d 00 03 08 3a       	or     eax,0x3a080300
  82:	0b 3b                	or     edi,DWORD PTR [ebx]
  84:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  87:	00 00                	add    BYTE PTR [eax],al
  89:	0c 0d                	or     al,0xd
  8b:	00 03                	add    BYTE PTR [ebx],al
  8d:	0e                   	push   cs
  8e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  90:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  92:	49                   	dec    ecx
  93:	13 38                	adc    edi,DWORD PTR [eax]
  95:	0b 00                	or     eax,DWORD PTR [eax]
  97:	00 0d 2e 01 3f 19    	add    BYTE PTR ds:0x193f012e,cl
  9d:	03 0e                	add    ecx,DWORD PTR [esi]
  9f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  a1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  a3:	27                   	daa    
  a4:	19 11                	sbb    DWORD PTR [ecx],edx
  a6:	01 12                	add    DWORD PTR [edx],edx
  a8:	06                   	push   es
  a9:	40                   	inc    eax
  aa:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  b0:	00 00                	add    BYTE PTR [eax],al
  b2:	0e                   	push   cs
  b3:	05 00 03 0e 3a       	add    eax,0x3a0e0300
  b8:	0b 3b                	or     edi,DWORD PTR [ebx]
  ba:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  bd:	02 18                	add    bl,BYTE PTR [eax]
  bf:	00 00                	add    BYTE PTR [eax],al
  c1:	0f 34                	sysenter 
  c3:	00 03                	add    BYTE PTR [ebx],al
  c5:	08 3a                	or     BYTE PTR [edx],bh
  c7:	0b 3b                	or     edi,DWORD PTR [ebx]
  c9:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  cc:	02 18                	add    bl,BYTE PTR [eax]
  ce:	00 00                	add    BYTE PTR [eax],al
  d0:	10 2e                	adc    BYTE PTR [esi],ch
  d2:	01 3f                	add    DWORD PTR [edi],edi
  d4:	19 03                	sbb    DWORD PTR [ebx],eax
  d6:	0e                   	push   cs
  d7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  d9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  db:	49                   	dec    ecx
  dc:	13 3c 19             	adc    edi,DWORD PTR [ecx+ebx*1]
  df:	00 00                	add    BYTE PTR [eax],al
  e1:	11 18                	adc    DWORD PTR [eax],ebx
  e3:	00 00                	add    BYTE PTR [eax],al
  e5:	00 12                	add    BYTE PTR [edx],dl
  e7:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  ea:	19 03                	sbb    DWORD PTR [ebx],eax
  ec:	0e                   	push   cs
  ed:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  ef:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  f1:	27                   	daa    
  f2:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
  f5:	11 01                	adc    DWORD PTR [ecx],eax
  f7:	12 06                	adc    al,BYTE PTR [esi]
  f9:	40                   	inc    eax
  fa:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 100:	00 00                	add    BYTE PTR [eax],al
 102:	13 34 00             	adc    esi,DWORD PTR [eax+eax*1]
 105:	03 0e                	add    ecx,DWORD PTR [esi]
 107:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 109:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 10b:	49                   	dec    ecx
 10c:	13 02                	adc    eax,DWORD PTR [edx]
 10e:	18 00                	sbb    BYTE PTR [eax],al
 110:	00 14 0b             	add    BYTE PTR [ebx+ecx*1],dl
 113:	01 11                	add    DWORD PTR [ecx],edx
 115:	01 12                	add    DWORD PTR [edx],edx
 117:	06                   	push   es
 118:	00 00                	add    BYTE PTR [eax],al
 11a:	15 01 01 49 13       	adc    eax,0x13490101
 11f:	01 13                	add    DWORD PTR [ebx],edx
 121:	00 00                	add    BYTE PTR [eax],al
 123:	16                   	push   ss
 124:	21 00                	and    DWORD PTR [eax],eax
 126:	49                   	dec    ecx
 127:	13 2f                	adc    ebp,DWORD PTR [edi]
 129:	05 00 00 17 26       	add    eax,0x26170000
 12e:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 131:	00 00                	add    BYTE PTR [eax],al
 133:	18 2e                	sbb    BYTE PTR [esi],ch
 135:	01 3f                	add    DWORD PTR [edi],edi
 137:	19 03                	sbb    DWORD PTR [ebx],eax
 139:	0e                   	push   cs
 13a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 13c:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 13e:	11 01                	adc    DWORD PTR [ecx],eax
 140:	12 06                	adc    al,BYTE PTR [esi]
 142:	40                   	inc    eax
 143:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 149:	00 00                	add    BYTE PTR [eax],al
 14b:	19 21                	sbb    DWORD PTR [ecx],esp
 14d:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 150:	2f                   	das    
 151:	0b 00                	or     eax,DWORD PTR [eax]
 153:	00 1a                	add    BYTE PTR [edx],bl
 155:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 158:	19 03                	sbb    DWORD PTR [ebx],eax
 15a:	0e                   	push   cs
 15b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 15d:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 163:	12 06                	adc    al,BYTE PTR [esi]
 165:	40                   	inc    eax
 166:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 16c:	00 00                	add    BYTE PTR [eax],al
 16e:	1b 05 00 03 0e 3a    	sbb    eax,DWORD PTR ds:0x3a0e0300
 174:	0b 3b                	or     edi,DWORD PTR [ebx]
 176:	05 49 13 02 18       	add    eax,0x18021349
 17b:	00 00                	add    BYTE PTR [eax],al
 17d:	1c 34                	sbb    al,0x34
 17f:	00 03                	add    BYTE PTR [ebx],al
 181:	0e                   	push   cs
 182:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 184:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 18a:	00 00                	add    BYTE PTR [eax],al
 18c:	1d 2e 01 3f 19       	sbb    eax,0x193f012e
 191:	03 0e                	add    ecx,DWORD PTR [esi]
 193:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 195:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 19b:	11 01                	adc    DWORD PTR [ecx],eax
 19d:	12 06                	adc    al,BYTE PTR [esi]
 19f:	40                   	inc    eax
 1a0:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 1a6:	00 00                	add    BYTE PTR [eax],al
 1a8:	1e                   	push   ds
 1a9:	0a 00                	or     al,BYTE PTR [eax]
 1ab:	03 0e                	add    ecx,DWORD PTR [esi]
 1ad:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1af:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 1b5:	1f                   	pop    ds
 1b6:	34 00                	xor    al,0x0
 1b8:	03 08                	add    ecx,DWORD PTR [eax]
 1ba:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1bc:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 1c2:	00 00                	add    BYTE PTR [eax],al
 1c4:	20 34 00             	and    BYTE PTR [eax+eax*1],dh
 1c7:	03 0e                	add    ecx,DWORD PTR [esi]
 1c9:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1cb:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1cd:	49                   	dec    ecx
 1ce:	13 3f                	adc    edi,DWORD PTR [edi]
 1d0:	19 02                	sbb    DWORD PTR [edx],eax
 1d2:	18 00                	sbb    BYTE PTR [eax],al
 1d4:	00 21                	add    BYTE PTR [ecx],ah
 1d6:	15 00 27 19 00       	adc    eax,0x192700
 1db:	00 22                	add    BYTE PTR [edx],ah
 1dd:	15 01 27 19 01       	adc    eax,0x1192701
 1e2:	13 00                	adc    eax,DWORD PTR [eax]
 1e4:	00 23                	add    BYTE PTR [ebx],ah
 1e6:	05 00 49 13 00       	add    eax,0x134900
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
  14:	37                   	aaa    
  15:	09 00                	or     DWORD PTR [eax],eax
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	82                   	(bad)  
   1:	02 00                	add    al,BYTE PTR [eax]
   3:	00 02                	add    BYTE PTR [edx],al
   5:	00 e1                	add    cl,ah
   7:	00 00                	add    BYTE PTR [eax],al
   9:	00 01                	add    BYTE PTR [ecx],al
   b:	01 fb                	add    ebx,edi
   d:	0e                   	push   cs
   e:	0d 00 01 01 01       	or     eax,0x1010100
  13:	01 00                	add    DWORD PTR [eax],eax
  15:	00 00                	add    BYTE PTR [eax],al
  17:	01 00                	add    DWORD PTR [eax],eax
  19:	00 01                	add    BYTE PTR [ecx],al
  1b:	2f                   	das    
  1c:	68 6f 6d 65 2f       	push   0x2f656d6f
  21:	79 6f                	jns    92 <execInternalCommand-0x30fff6e>
  23:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
  2a:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
  2d:	73 73                	jae    a2 <execInternalCommand-0x30fff5e>
  2f:	2f                   	das    
  30:	6c                   	ins    BYTE PTR es:[edi],dx
  31:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
  38:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
  3e:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
  44:	78 2d                	js     73 <execInternalCommand-0x30fff8d>
  46:	67 6e                	outs   dx,BYTE PTR ds:[si]
  48:	75 2f                	jne    79 <execInternalCommand-0x30fff87>
  4a:	35 2e 33 2e 30       	xor    eax,0x302e332e
  4f:	2f                   	das    
  50:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  57:	00 2f                	add    BYTE PTR [edi],ch
  59:	68 6f 6d 65 2f       	push   0x2f656d6f
  5e:	79 6f                	jns    cf <execInternalCommand-0x30fff31>
  60:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  67:	6f                   	outs   dx,DWORD PTR ds:[esi]
  68:	73 2f                	jae    99 <execInternalCommand-0x30fff67>
  6a:	63 68 72             	arpl   WORD PTR [eax+0x72],bp
  6d:	69 73 4f 53 2f 69 6e 	imul   esi,DWORD PTR [ebx+0x4f],0x6e692f53
  74:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  78:	65                   	gs
  79:	2f                   	das    
  7a:	69 33 38 36 00 69    	imul   esi,DWORD PTR [ebx],0x69003638
  80:	6e                   	outs   dx,BYTE PTR ds:[esi]
  81:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  85:	65 00 2f             	add    BYTE PTR gs:[edi],ch
  88:	68 6f 6d 65 2f       	push   0x2f656d6f
  8d:	79 6f                	jns    fe <execInternalCommand-0x30fff02>
  8f:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  96:	6f                   	outs   dx,DWORD PTR ds:[esi]
  97:	73 2f                	jae    c8 <execInternalCommand-0x30fff38>
  99:	6c                   	ins    BYTE PTR es:[edi],dx
  9a:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  a1:	4f                   	dec    edi
  a2:	53                   	push   ebx
  a3:	2f                   	das    
  a4:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  ab:	00 00                	add    BYTE PTR [eax],al
  ad:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  b1:	6c                   	ins    BYTE PTR es:[edi],dx
  b2:	6c                   	ins    BYTE PTR es:[edi],dx
  b3:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
  b6:	00 00                	add    BYTE PTR [eax],al
  b8:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  bb:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
  c2:	63 
  c3:	2e                   	cs
  c4:	68 00 01 00 00       	push   0x100
  c9:	63 70 75             	arpl   WORD PTR [eax+0x75],si
  cc:	2e                   	cs
  cd:	68 00 02 00 00       	push   0x200
  d2:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  d6:	6c                   	ins    BYTE PTR es:[edi],dx
  d7:	6c                   	ins    BYTE PTR es:[edi],dx
  d8:	2e                   	cs
  d9:	68 00 03 00 00       	push   0x300
  de:	6d                   	ins    DWORD PTR es:[edi],dx
  df:	61                   	popa   
  e0:	6c                   	ins    BYTE PTR es:[edi],dx
  e1:	6c                   	ins    BYTE PTR es:[edi],dx
  e2:	6f                   	outs   dx,DWORD PTR ds:[esi]
  e3:	63 2e                	arpl   WORD PTR [esi],bp
  e5:	68 00 04 00 00       	push   0x400
  ea:	00 00                	add    BYTE PTR [eax],al
  ec:	05 02 00 00 10       	add    eax,0x10000002
  f1:	03 03                	add    eax,DWORD PTR [ebx]
  f3:	17                   	pop    ss
  f4:	01 75 08             	add    DWORD PTR [ebp+0x8],esi
  f7:	14 68                	adc    al,0x68
  f9:	4c                   	dec    esp
  fa:	08 21                	or     BYTE PTR [ecx],ah
  fc:	08 21                	or     BYTE PTR [ecx],ah
  fe:	08 13                	or     BYTE PTR [ebx],dl
 100:	03 0a                	add    ecx,DWORD PTR [edx]
 102:	74 03                	je     107 <execInternalCommand-0x30ffef9>
 104:	79 2e                	jns    134 <execInternalCommand-0x30ffecc>
 106:	02 30                	add    dh,BYTE PTR [eax]
 108:	19 2c 08             	sbb    DWORD PTR [eax+ecx*1],ebp
 10b:	30 69 75             	xor    BYTE PTR [ecx+0x75],ch
 10e:	d7                   	xlat   BYTE PTR ds:[ebx]
 10f:	d8 08                	fmul   DWORD PTR [eax]
 111:	3e                   	ds
 112:	bd 00 02 04 01       	mov    ebp,0x1040200
 117:	06                   	push   es
 118:	e4 00                	in     al,0x0
 11a:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
 11d:	e4 06                	in     al,0x6
 11f:	e7 00                	out    0x0,eax
 121:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 124:	06                   	push   es
 125:	e4 06                	in     al,0x6
 127:	e5 02                	in     eax,0x2
 129:	25 13 08 4b 67       	and    eax,0x674b0813
 12e:	e3 34                	jecxz  164 <execInternalCommand-0x30ffe9c>
 130:	00 02                	add    BYTE PTR [edx],al
 132:	04 02                	add    al,0x2
 134:	02 25 14 00 02 04    	add    ah,BYTE PTR ds:0x4020014
 13a:	02 03                	add    al,BYTE PTR [ebx]
 13c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 13d:	4a                   	dec    edx
 13e:	00 02                	add    BYTE PTR [edx],al
 140:	04 01                	add    al,0x1
 142:	06                   	push   es
 143:	4a                   	dec    edx
 144:	06                   	push   es
 145:	03 13                	add    edx,DWORD PTR [ebx]
 147:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 14a:	4b                   	dec    ebx
 14b:	08 4f 3d             	or     BYTE PTR [edi+0x3d],cl
 14e:	5b                   	pop    ebx
 14f:	6a 92                	push   0xffffff92
 151:	02 3b                	add    bh,BYTE PTR [ebx]
 153:	14 69                	adc    al,0x69
 155:	00 02                	add    BYTE PTR [edx],al
 157:	04 02                	add    al,0x2
 159:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 15c:	00 02                	add    BYTE PTR [edx],al
 15e:	04 01                	add    al,0x1
 160:	06                   	push   es
 161:	4a                   	dec    edx
 162:	06                   	push   es
 163:	03 0b                	add    ecx,DWORD PTR [ebx]
 165:	66 59                	pop    cx
 167:	32 69 75             	xor    ch,BYTE PTR [ecx+0x75]
 16a:	75 75                	jne    1e1 <execInternalCommand-0x30ffe1f>
 16c:	75 75                	jne    1e3 <execInternalCommand-0x30ffe1d>
 16e:	78 a1                	js     111 <execInternalCommand-0x30ffeef>
 170:	08 ec                	or     ah,ch
 172:	00 02                	add    BYTE PTR [edx],al
 174:	04 01                	add    al,0x1
 176:	06                   	push   es
 177:	66 06                	pushw  es
 179:	af                   	scas   eax,DWORD PTR es:[edi]
 17a:	68 75 08 4c 67       	push   0x674c0875
 17f:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 182:	5a                   	pop    edx
 183:	00 02                	add    BYTE PTR [edx],al
 185:	04 01                	add    al,0x1
 187:	06                   	push   es
 188:	9e                   	sahf   
 189:	00 02                	add    BYTE PTR [edx],al
 18b:	04 02                	add    al,0x2
 18d:	66                   	data16
 18e:	00 02                	add    BYTE PTR [edx],al
 190:	04 03                	add    al,0x3
 192:	66 06                	pushw  es
 194:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 195:	68 75 08 5a a0       	push   0xa05a0875
 19a:	bc 68 a0 94 08       	mov    esp,0x894a068
 19f:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 1a2:	94                   	xchg   esp,eax
 1a3:	08 33                	or     BYTE PTR [ebx],dh
 1a5:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 1aa:	16                   	push   ss
 1ab:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 1ae:	03 3a                	add    edi,DWORD PTR [edx]
 1b0:	d6                   	(bad)  
 1b1:	68 d8 08 e7 08       	push   0x8e708d8
 1b6:	13 d7                	adc    edx,edi
 1b8:	08 e5                	or     ch,ah
 1ba:	08 3e                	or     BYTE PTR [esi],bh
 1bc:	4b                   	dec    ebx
 1bd:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 1c0:	d9 d9                	(bad)  
 1c2:	d7                   	xlat   BYTE PTR ds:[ebx]
 1c3:	d7                   	xlat   BYTE PTR ds:[ebx]
 1c4:	3d 31 67 f3 00       	cmp    eax,0xf36731
 1c9:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 1cc:	91                   	xchg   ecx,eax
 1cd:	00 02                	add    BYTE PTR [edx],al
 1cf:	04 03                	add    al,0x3
 1d1:	02 2c 11             	add    ch,BYTE PTR [ecx+edx*1]
 1d4:	00 02                	add    BYTE PTR [edx],al
 1d6:	04 01                	add    al,0x1
 1d8:	06                   	push   es
 1d9:	4a                   	dec    edx
 1da:	06                   	push   es
 1db:	68 3f 67 08 4c       	push   0x4c08673f
 1e0:	00 02                	add    BYTE PTR [edx],al
 1e2:	04 03                	add    al,0x3
 1e4:	92                   	xchg   edx,eax
 1e5:	00 02                	add    BYTE PTR [edx],al
 1e7:	04 03                	add    al,0x3
 1e9:	08 67 00             	or     BYTE PTR [edi+0x0],ah
 1ec:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 1ef:	02 32                	add    dh,BYTE PTR [edx]
 1f1:	0f 00 02             	sldt   WORD PTR [edx]
 1f4:	04 01                	add    al,0x1
 1f6:	06                   	push   es
 1f7:	4a                   	dec    edx
 1f8:	06                   	push   es
 1f9:	87 3f                	xchg   DWORD PTR [edi],edi
 1fb:	67 00 02             	add    BYTE PTR [bp+si],al
 1fe:	04 03                	add    al,0x3
 200:	91                   	xchg   ecx,eax
 201:	00 02                	add    BYTE PTR [edx],al
 203:	04 03                	add    al,0x3
 205:	ff 00                	inc    DWORD PTR [eax]
 207:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 20a:	06                   	push   es
 20b:	4a                   	dec    edx
 20c:	06                   	push   es
 20d:	84 d7                	test   bh,dl
 20f:	3f                   	aas    
 210:	a0 08 bb 76 03       	mov    al,ds:0x376bb08
 215:	09 02                	or     DWORD PTR [edx],eax
 217:	22 01                	and    al,BYTE PTR [ecx]
 219:	03 7a 66             	add    edi,DWORD PTR [edx+0x66]
 21c:	08 6e da             	or     BYTE PTR [esi-0x26],ch
 21f:	08 21                	or     BYTE PTR [ecx],ah
 221:	69 92 08 bc ae 08 24 	imul   edx,DWORD PTR [edx+0x8aebc08],0x13220224
 228:	02 22 13 
 22b:	31 93 08 ca 08 bd    	xor    DWORD PTR [ebx-0x42f735f8],edx
 231:	9f                   	lahf   
 232:	75 3f                	jne    273 <execInternalCommand-0x30ffd8d>
 234:	92                   	xchg   edx,eax
 235:	75 76                	jne    2ad <execInternalCommand-0x30ffd53>
 237:	75 75                	jne    2ae <execInternalCommand-0x30ffd52>
 239:	77 59                	ja     294 <execInternalCommand-0x30ffd6c>
 23b:	75 08                	jne    245 <execInternalCommand-0x30ffdbb>
 23d:	4b                   	dec    ebx
 23e:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 241:	5b                   	pop    ebx
 242:	5b                   	pop    ebx
 243:	75 75                	jne    2ba <execInternalCommand-0x30ffd46>
 245:	08 83 08 4c 75 30    	or     BYTE PTR [ebx+0x30754c08],al
 24b:	08 56 b1             	or     BYTE PTR [esi-0x4f],dl
 24e:	ae                   	scas   al,BYTE PTR es:[edi]
 24f:	03 0d 66 30 ae 03    	add    ecx,DWORD PTR ds:0x3ae3066
 255:	0d 82 31 03 09       	or     eax,0x9033182
 25a:	ac                   	lods   al,BYTE PTR ds:[esi]
 25b:	30 ae 68 03 0c e4    	xor    BYTE PTR [esi-0x1bf3fc98],ch
 261:	b2 08                	mov    dl,0x8
 263:	68 03 7a 58 03       	push   0x3587a03
 268:	09 20                	or     DWORD PTR [eax],esp
 26a:	ad                   	lods   eax,DWORD PTR ds:[esi]
 26b:	59                   	pop    ecx
 26c:	08 4c 08 21          	or     BYTE PTR [eax+ecx*1+0x21],cl
 270:	68 03 09 4a 02       	push   0x24a0903
 275:	27                   	daa    
 276:	13 03                	adc    eax,DWORD PTR [ebx]
 278:	98                   	cwde   
 279:	7f 66                	jg     2e1 <execInternalCommand-0x30ffd1f>
 27b:	03 eb                	add    ebp,ebx
 27d:	00 08                	add    BYTE PTR [eax],cl
 27f:	20 59 02             	and    BYTE PTR [ecx+0x2],bl
 282:	02 00                	add    al,BYTE PTR [eax]
 284:	01 01                	add    DWORD PTR [ecx],eax

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	64 6f                	outs   dx,DWORD PTR fs:[esi]
   2:	6e                   	outs   dx,BYTE PTR ds:[esi]
   3:	65                   	gs
   4:	47                   	inc    edi
   5:	65                   	gs
   6:	74 74                	je     7c <execInternalCommand-0x30fff84>
   8:	69 6e 67 4b 65 79 73 	imul   ebp,DWORD PTR [esi+0x67],0x7379654b
   f:	00 68 65             	add    BYTE PTR [eax+0x65],ch
  12:	6c                   	ins    BYTE PTR es:[edi],dx
  13:	70 4d                	jo     62 <execInternalCommand-0x30fff9e>
  15:	65 00 6c 52 65       	add    BYTE PTR gs:[edx+edx*2+0x65],ch
  1a:	74 56                	je     72 <execInternalCommand-0x30fff8e>
  1c:	61                   	popa   
  1d:	6c                   	ins    BYTE PTR es:[edi],dx
  1e:	00 68 65             	add    BYTE PTR [eax+0x65],ch
  21:	61                   	popa   
  22:	70 45                	jo     69 <execInternalCommand-0x30fff97>
  24:	6e                   	outs   dx,BYTE PTR ds:[esi]
  25:	64 00 6b 45          	add    BYTE PTR fs:[ebx+0x45],ch
  29:	78 69                	js     94 <execInternalCommand-0x30fff6c>
  2b:	74 00                	je     2d <execInternalCommand-0x30fffd3>
  2d:	64                   	fs
  2e:	65                   	gs
  2f:	73 63                	jae    94 <execInternalCommand-0x30fff6c>
  31:	72 69                	jb     9c <execInternalCommand-0x30fff64>
  33:	70 74                	jo     a9 <execInternalCommand-0x30fff57>
  35:	69 6f 6e 00 74 65 6d 	imul   ebp,DWORD PTR [edi+0x6e],0x6d657400
  3c:	70 00                	jo     3e <execInternalCommand-0x30fffc2>
  3e:	73 68                	jae    a8 <execInternalCommand-0x30fff58>
  40:	6f                   	outs   dx,DWORD PTR ds:[esi]
  41:	72 74                	jb     b7 <execInternalCommand-0x30fff49>
  43:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
  46:	74 00                	je     48 <execInternalCommand-0x30fffb8>
  48:	70 61                	jo     ab <execInternalCommand-0x30fff55>
  4a:	72 73                	jb     bf <execInternalCommand-0x30fff41>
  4c:	65                   	gs
  4d:	50                   	push   eax
  4e:	61                   	popa   
  4f:	72 61                	jb     b2 <execInternalCommand-0x30fff4e>
  51:	6d                   	ins    DWORD PTR es:[edi],dx
  52:	73 53                	jae    a7 <execInternalCommand-0x30fff59>
  54:	68 65 6c 6c 00       	push   0x6c6c65
  59:	69 6e 70 75 74 00 73 	imul   ebp,DWORD PTR [esi+0x70],0x73007475
  60:	69 7a 65 74 79 70 65 	imul   edi,DWORD PTR [edx+0x65],0x65707974
  67:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
  6b:	72 72                	jb     df <execInternalCommand-0x30fff21>
  6d:	4b                   	dec    ebx
  6e:	65                   	gs
  6f:	79 43                	jns    b4 <execInternalCommand-0x30fff4c>
  71:	6f                   	outs   dx,DWORD PTR ds:[esi]
  72:	75 6e                	jne    e2 <execInternalCommand-0x30fff1e>
  74:	74 00                	je     76 <execInternalCommand-0x30fff8a>
  76:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  79:	6d                   	ins    DWORD PTR es:[edi],dx
  7a:	61                   	popa   
  7b:	6e                   	outs   dx,BYTE PTR ds:[esi]
  7c:	64                   	fs
  7d:	5f                   	pop    edi
  7e:	74 61                	je     e1 <execInternalCommand-0x30fff1f>
  80:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
  84:	74 00                	je     86 <execInternalCommand-0x30fff7a>
  86:	70 61                	jo     e9 <execInternalCommand-0x30fff17>
  88:	72 73                	jb     fd <execInternalCommand-0x30fff03>
  8a:	65                   	gs
  8b:	64                   	fs
  8c:	43                   	inc    ebx
  8d:	68 61 72 73 00       	push   0x737261
  92:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
  95:	6c                   	ins    BYTE PTR es:[edi],dx
  96:	69 6e 65 00 70 70 74 	imul   ebp,DWORD PTR [esi+0x65],0x74707000
  9d:	72 00                	jb     9f <execInternalCommand-0x30fff61>
  9f:	47                   	inc    edi
  a0:	4e                   	dec    esi
  a1:	55                   	push   ebp
  a2:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  a5:	39 20                	cmp    DWORD PTR [eax],esp
  a7:	35 2e 33 2e 30       	xor    eax,0x302e332e
  ac:	20 2d 6d 61 73 6d    	and    BYTE PTR ds:0x6d73616d,ch
  b2:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  b7:	6c                   	ins    BYTE PTR es:[edi],dx
  b8:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  be:	65                   	gs
  bf:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  c4:	72 69                	jb     12f <execInternalCommand-0x30ffed1>
  c6:	63 20                	arpl   WORD PTR [eax],sp
  c8:	2d 6d 61 72 63       	sub    eax,0x6372616d
  cd:	68 3d 70 65 6e       	push   0x6e65703d
  d2:	74 69                	je     13d <execInternalCommand-0x30ffec3>
  d4:	75 6d                	jne    143 <execInternalCommand-0x30ffebd>
  d6:	70 72                	jo     14a <execInternalCommand-0x30ffeb6>
  d8:	6f                   	outs   dx,DWORD PTR ds:[esi]
  d9:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  df:	74 64                	je     145 <execInternalCommand-0x30ffebb>
  e1:	3d 63 39 39 20       	cmp    eax,0x20393963
  e6:	2d 66 66 72 65       	sub    eax,0x65726666
  eb:	65                   	gs
  ec:	73 74                	jae    162 <execInternalCommand-0x30ffe9e>
  ee:	61                   	popa   
  ef:	6e                   	outs   dx,BYTE PTR ds:[esi]
  f0:	64 69 6e 67 00 65 78 	imul   ebp,DWORD PTR fs:[esi+0x67],0x65786500
  f7:	65 
  f8:	63 49 6e             	arpl   WORD PTR [ecx+0x6e],cx
  fb:	74 65                	je     162 <execInternalCommand-0x30ffe9e>
  fd:	72 6e                	jb     16d <execInternalCommand-0x30ffe93>
  ff:	61                   	popa   
 100:	6c                   	ins    BYTE PTR es:[edi],dx
 101:	43                   	inc    ebx
 102:	6f                   	outs   dx,DWORD PTR ds:[esi]
 103:	6d                   	ins    DWORD PTR es:[edi],dx
 104:	6d                   	ins    DWORD PTR es:[edi],dx
 105:	61                   	popa   
 106:	6e                   	outs   dx,BYTE PTR ds:[esi]
 107:	64 00 73 4b          	add    BYTE PTR fs:[ebx+0x4b],dh
 10b:	53                   	push   ebx
 10c:	68 65 6c 6c 50       	push   0x506c6c65
 111:	72 6f                	jb     182 <execInternalCommand-0x30ffe7e>
 113:	67 72 61             	addr16 jb 177 <execInternalCommand-0x30ffe89>
 116:	6d                   	ins    DWORD PTR es:[edi],dx
 117:	4e                   	dec    esi
 118:	61                   	popa   
 119:	6d                   	ins    DWORD PTR es:[edi],dx
 11a:	65 00 74 69 6d       	add    BYTE PTR gs:[ecx+ebp*2+0x6d],dh
 11f:	65                   	gs
 120:	54                   	push   esp
 121:	6f                   	outs   dx,DWORD PTR ds:[esi]
 122:	45                   	inc    ebp
 123:	78 69                	js     18e <execInternalCommand-0x30ffe72>
 125:	74 00                	je     127 <execInternalCommand-0x30ffed9>
 127:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 12a:	73 00                	jae    12c <execInternalCommand-0x30ffed4>
 12c:	2f                   	das    
 12d:	68 6f 6d 65 2f       	push   0x2f656d6f
 132:	79 6f                	jns    1a3 <execInternalCommand-0x30ffe5d>
 134:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 13b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 13c:	73 2f                	jae    16d <execInternalCommand-0x30ffe93>
 13e:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 142:	6c                   	ins    BYTE PTR es:[edi],dx
 143:	6c                   	ins    BYTE PTR es:[edi],dx
 144:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
 147:	6e                   	outs   dx,BYTE PTR ds:[esi]
 148:	74 38                	je     182 <execInternalCommand-0x30ffe7e>
 14a:	5f                   	pop    edi
 14b:	74 00                	je     14d <execInternalCommand-0x30ffeb3>
 14d:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 150:	6d                   	ins    DWORD PTR es:[edi],dx
 151:	61                   	popa   
 152:	6e                   	outs   dx,BYTE PTR ds:[esi]
 153:	64                   	fs
 154:	73 00                	jae    156 <execInternalCommand-0x30ffeaa>
 156:	64                   	fs
 157:	71 75                	jno    1ce <execInternalCommand-0x30ffe32>
 159:	6f                   	outs   dx,DWORD PTR ds:[esi]
 15a:	74 65                	je     1c1 <execInternalCommand-0x30ffe3f>
 15c:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 15f:	6d                   	ins    DWORD PTR es:[edi],dx
 160:	6d                   	ins    DWORD PTR es:[edi],dx
 161:	61                   	popa   
 162:	6e                   	outs   dx,BYTE PTR ds:[esi]
 163:	64                   	fs
 164:	5f                   	pop    edi
 165:	66                   	data16
 166:	75 6e                	jne    1d6 <execInternalCommand-0x30ffe2a>
 168:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 16c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 16d:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 170:	65                   	gs
 171:	65                   	gs
 172:	41                   	inc    ecx
 173:	72 67                	jb     1dc <execInternalCommand-0x30ffe24>
 175:	56                   	push   esi
 176:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 179:	72 61                	jb     1dc <execInternalCommand-0x30ffe24>
 17b:	6d                   	ins    DWORD PTR es:[edi],dx
 17c:	43                   	inc    ebx
 17d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 17e:	75 6e                	jne    1ee <execInternalCommand-0x30ffe12>
 180:	74 00                	je     182 <execInternalCommand-0x30ffe7e>
 182:	70 63                	jo     1e7 <execInternalCommand-0x30ffe19>
 184:	6f                   	outs   dx,DWORD PTR ds:[esi]
 185:	75 6e                	jne    1f5 <execInternalCommand-0x30ffe0b>
 187:	74 00                	je     189 <execInternalCommand-0x30ffe77>
 189:	6c                   	ins    BYTE PTR es:[edi],dx
 18a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 18b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 18c:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 190:	6e                   	outs   dx,BYTE PTR ds:[esi]
 191:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 195:	74 00                	je     197 <execInternalCommand-0x30ffe69>
 197:	70 61                	jo     1fa <execInternalCommand-0x30ffe06>
 199:	72 61                	jb     1fc <execInternalCommand-0x30ffe04>
 19b:	6d                   	ins    DWORD PTR es:[edi],dx
 19c:	73 54                	jae    1f2 <execInternalCommand-0x30ffe0e>
 19e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 19f:	41                   	inc    ecx
 1a0:	72 67                	jb     209 <execInternalCommand-0x30ffdf7>
 1a2:	76 00                	jbe    1a4 <execInternalCommand-0x30ffe5c>
 1a4:	62 73 71             	bound  esi,QWORD PTR [ebx+0x71]
 1a7:	75 6f                	jne    218 <execInternalCommand-0x30ffde8>
 1a9:	74 65                	je     210 <execInternalCommand-0x30ffdf0>
 1ab:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 1ae:	6d                   	ins    DWORD PTR es:[edi],dx
 1af:	6d                   	ins    DWORD PTR es:[edi],dx
 1b0:	61                   	popa   
 1b1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1b2:	64                   	fs
 1b3:	5f                   	pop    edi
 1b4:	66                   	data16
 1b5:	75 6e                	jne    225 <execInternalCommand-0x30ffddb>
 1b7:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 1bb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1bc:	5f                   	pop    edi
 1bd:	70 00                	jo     1bf <execInternalCommand-0x30ffe41>
 1bf:	70 61                	jo     222 <execInternalCommand-0x30ffdde>
 1c1:	64 31 00             	xor    DWORD PTR fs:[eax],eax
 1c4:	70 61                	jo     227 <execInternalCommand-0x30ffdd9>
 1c6:	64 32 00             	xor    al,BYTE PTR fs:[eax]
 1c9:	67                   	addr16
 1ca:	65                   	gs
 1cb:	74 41                	je     20e <execInternalCommand-0x30ffdf2>
 1cd:	43                   	inc    ebx
 1ce:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1cf:	6d                   	ins    DWORD PTR es:[edi],dx
 1d0:	6d                   	ins    DWORD PTR es:[edi],dx
 1d1:	61                   	popa   
 1d2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1d3:	64 00 68 65          	add    BYTE PTR fs:[eax+0x65],ch
 1d7:	61                   	popa   
 1d8:	70 43                	jo     21d <execInternalCommand-0x30ffde3>
 1da:	75 72                	jne    24e <execInternalCommand-0x30ffdb2>
 1dc:	72 00                	jb     1de <execInternalCommand-0x30ffe22>
 1de:	6d                   	ins    DWORD PTR es:[edi],dx
 1df:	61                   	popa   
 1e0:	78 61                	js     243 <execInternalCommand-0x30ffdbd>
 1e2:	72 67                	jb     24b <execInternalCommand-0x30ffdb5>
 1e4:	63 00                	arpl   WORD PTR [eax],ax
 1e6:	73 45                	jae    22d <execInternalCommand-0x30ffdd3>
 1e8:	78 65                	js     24f <execInternalCommand-0x30ffdb1>
 1ea:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 1ed:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
 1f4:	72 61                	jb     257 <execInternalCommand-0x30ffda9>
 1f6:	6d                   	ins    DWORD PTR es:[edi],dx
 1f7:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 1fa:	72 61                	jb     25d <execInternalCommand-0x30ffda3>
 1fc:	6d                   	ins    DWORD PTR es:[edi],dx
 1fd:	73 00                	jae    1ff <execInternalCommand-0x30ffe01>
 1ff:	6e                   	outs   dx,BYTE PTR ds:[esi]
 200:	61                   	popa   
 201:	6d                   	ins    DWORD PTR es:[edi],dx
 202:	65 00 75 6e          	add    BYTE PTR gs:[ebp+0x6e],dh
 206:	73 69                	jae    271 <execInternalCommand-0x30ffd8f>
 208:	67 6e                	outs   dx,BYTE PTR ds:[si]
 20a:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 20f:	61                   	popa   
 210:	72 00                	jb     212 <execInternalCommand-0x30ffdee>
 212:	6c                   	ins    BYTE PTR es:[edi],dx
 213:	6f                   	outs   dx,DWORD PTR ds:[esi]
 214:	6e                   	outs   dx,BYTE PTR ds:[esi]
 215:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 219:	6e                   	outs   dx,BYTE PTR ds:[esi]
 21a:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 21e:	73 69                	jae    289 <execInternalCommand-0x30ffd77>
 220:	67 6e                	outs   dx,BYTE PTR ds:[si]
 222:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 227:	74 00                	je     229 <execInternalCommand-0x30ffdd7>
 229:	65                   	gs
 22a:	66 61                	popaw  
 22c:	6d                   	ins    DWORD PTR es:[edi],dx
 22d:	69 6c 79 00 75 69 6e 	imul   ebp,DWORD PTR [ecx+edi*2+0x0],0x746e6975
 234:	74 
 235:	33 32                	xor    esi,DWORD PTR [edx]
 237:	5f                   	pop    edi
 238:	74 00                	je     23a <execInternalCommand-0x30ffdc6>
 23a:	62 75 69             	bound  esi,QWORD PTR [ebp+0x69]
 23d:	6c                   	ins    BYTE PTR es:[edi],dx
 23e:	64                   	fs
 23f:	61                   	popa   
 240:	72 67                	jb     2a9 <execInternalCommand-0x30ffd57>
 242:	76 00                	jbe    244 <execInternalCommand-0x30ffdbc>
 244:	65                   	gs
 245:	78 69                	js     2b0 <execInternalCommand-0x30ffd50>
 247:	74 43                	je     28c <execInternalCommand-0x30ffd74>
 249:	6f                   	outs   dx,DWORD PTR ds:[esi]
 24a:	64 65 00 73 68       	fs add BYTE PTR fs:gs:[ebx+0x68],dh
 24f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 250:	72 74                	jb     2c6 <execInternalCommand-0x30ffd3a>
 252:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 255:	73 69                	jae    2c0 <execInternalCommand-0x30ffd40>
 257:	67 6e                	outs   dx,BYTE PTR ds:[si]
 259:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 25e:	74 00                	je     260 <execInternalCommand-0x30ffda0>
 260:	6c                   	ins    BYTE PTR es:[edi],dx
 261:	43                   	inc    ebx
 262:	75 72                	jne    2d6 <execInternalCommand-0x30ffd2a>
 264:	72 4b                	jb     2b1 <execInternalCommand-0x30ffd4f>
 266:	65                   	gs
 267:	79 00                	jns    269 <execInternalCommand-0x30ffd97>
 269:	65                   	gs
 26a:	6d                   	ins    DWORD PTR es:[edi],dx
 26b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 26c:	64                   	fs
 26d:	65                   	gs
 26e:	6c                   	ins    BYTE PTR es:[edi],dx
 26f:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 272:	6d                   	ins    DWORD PTR es:[edi],dx
 273:	6d                   	ins    DWORD PTR es:[edi],dx
 274:	61                   	popa   
 275:	6e                   	outs   dx,BYTE PTR ds:[esi]
 276:	64                   	fs
 277:	42                   	inc    edx
 278:	75 66                	jne    2e0 <execInternalCommand-0x30ffd20>
 27a:	66 50                	push   ax
 27c:	74 72                	je     2f0 <execInternalCommand-0x30ffd10>
 27e:	00 5f 42             	add    BYTE PTR [edi+0x42],bl
 281:	6f                   	outs   dx,DWORD PTR ds:[esi]
 282:	6f                   	outs   dx,DWORD PTR ds:[esi]
 283:	6c                   	ins    BYTE PTR es:[edi],dx
 284:	00 6b 73             	add    BYTE PTR [ebx+0x73],ch
 287:	68 65 6c 6c 2e       	push   0x2e6c6c65
 28c:	63 00                	arpl   WORD PTR [eax],ax
 28e:	61                   	popa   
 28f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 290:	73 69                	jae    2fb <execInternalCommand-0x30ffd05>
 292:	53                   	push   ebx
 293:	65                   	gs
 294:	71 00                	jno    296 <execInternalCommand-0x30ffd6a>
 296:	65                   	gs
 297:	78 65                	js     2fe <execInternalCommand-0x30ffd02>
 299:	63 70 00             	arpl   WORD PTR [eax+0x0],si
 29c:	61                   	popa   
 29d:	76 78                	jbe    317 <execInternalCommand-0x30ffce9>
 29f:	35 31 32 76 62       	xor    eax,0x62763231
 2a4:	6d                   	ins    DWORD PTR es:[edi],dx
 2a5:	69 00 70 72 6d 73    	imul   eax,DWORD PTR [eax],0x736d7270
 2ab:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
 2ae:	7a 65                	jp     315 <execInternalCommand-0x30ffceb>
 2b0:	00 6e 61             	add    BYTE PTR [esi+0x61],ch
 2b3:	72 67                	jb     31c <execInternalCommand-0x30ffce4>
 2b5:	76 00                	jbe    2b7 <execInternalCommand-0x30ffd49>
 2b7:	68 65 61 70 42       	push   0x42706165
 2bc:	61                   	popa   
 2bd:	73 65                	jae    324 <execInternalCommand-0x30ffcdc>
 2bf:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
 2c2:	75 69                	jne    32d <execInternalCommand-0x30ffcd3>
 2c4:	64                   	fs
 2c5:	5f                   	pop    edi
 2c6:	65                   	gs
 2c7:	78 74                	js     33d <execInternalCommand-0x30ffcc3>
 2c9:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2cb:	64                   	fs
 2cc:	65                   	gs
 2cd:	64                   	fs
 2ce:	5f                   	pop    edi
 2cf:	66                   	data16
 2d0:	65                   	gs
 2d1:	61                   	popa   
 2d2:	74 75                	je     349 <execInternalCommand-0x30ffcb7>
 2d4:	72 65                	jb     33b <execInternalCommand-0x30ffcc5>
 2d6:	5f                   	pop    edi
 2d7:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
 2da:	73 00                	jae    2dc <execInternalCommand-0x30ffd24>
 2dc:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 2df:	4c                   	dec    esp
 2e0:	69 6e 65 00 70 72 65 	imul   ebp,DWORD PTR [esi+0x65],0x65727000
 2e7:	66                   	data16
 2e8:	65                   	gs
 2e9:	74 63                	je     34e <execInternalCommand-0x30ffcb2>
 2eb:	68 77 74 31 00       	push   0x317477
 2f0:	66 69 6e 64 43 6f    	imul   bp,WORD PTR [esi+0x64],0x6f43
 2f6:	6d                   	ins    DWORD PTR es:[edi],dx
 2f7:	6d                   	ins    DWORD PTR es:[edi],dx
 2f8:	61                   	popa   
 2f9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2fa:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 2fe:	70 79                	jo     379 <execInternalCommand-0x30ffc87>
 300:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 303:	00 6b 53             	add    BYTE PTR [ebx+0x53],ch
 306:	6c                   	ins    BYTE PTR es:[edi],dx
 307:	65                   	gs
 308:	65                   	gs
 309:	70 00                	jo     30b <execInternalCommand-0x30ffcf5>
 30b:	63 70 75             	arpl   WORD PTR [eax+0x75],si
 30e:	69 64 5f 70 72 6f 63 	imul   esp,DWORD PTR [edi+ebx*2+0x70],0x69636f72
 315:	69 
 316:	6e                   	outs   dx,BYTE PTR ds:[esi]
 317:	66 6f                	outs   dx,WORD PTR ds:[esi]
 319:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 31c:	6d                   	ins    DWORD PTR es:[edi],dx
 31d:	6d                   	ins    DWORD PTR es:[edi],dx
 31e:	61                   	popa   
 31f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 320:	64                   	fs
 321:	73 50                	jae    373 <execInternalCommand-0x30ffc8d>
 323:	74 72                	je     397 <execInternalCommand-0x30ffc69>
 325:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 328:	73 65                	jae    38f <execInternalCommand-0x30ffc71>
 32a:	72 76                	jb     3a2 <execInternalCommand-0x30ffc5e>
 32c:	65 64 00 63 6f       	gs add BYTE PTR fs:gs:[ebx+0x6f],ah
 331:	6d                   	ins    DWORD PTR es:[edi],dx
 332:	6d                   	ins    DWORD PTR es:[edi],dx
 333:	61                   	popa   
 334:	6e                   	outs   dx,BYTE PTR ds:[esi]
 335:	64                   	fs
 336:	57                   	push   edi
 337:	61                   	popa   
 338:	73 46                	jae    380 <execInternalCommand-0x30ffc80>
 33a:	72 6f                	jb     3ab <execInternalCommand-0x30ffc55>
 33c:	6d                   	ins    DWORD PTR es:[edi],dx
 33d:	54                   	push   esp
 33e:	68 69 73 42 75       	push   0x75427369
 343:	66                   	data16
 344:	66                   	data16
 345:	65                   	gs
 346:	72 50                	jb     398 <execInternalCommand-0x30ffc68>
 348:	74 72                	je     3bc <execInternalCommand-0x30ffc44>
 34a:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 34d:	65                   	gs
 34e:	70 00                	jo     350 <execInternalCommand-0x30ffcb0>
 350:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 353:	6d                   	ins    DWORD PTR es:[edi],dx
 354:	61                   	popa   
 355:	6e                   	outs   dx,BYTE PTR ds:[esi]
 356:	64 00 6b 53          	add    BYTE PTR fs:[ebx+0x53],ch
 35a:	68 65 6c 6c 00       	push   0x6c6c65
 35f:	67                   	addr16
 360:	65                   	gs
 361:	74 41                	je     3a4 <execInternalCommand-0x30ffc5c>
 363:	4b                   	dec    ebx
 364:	65                   	gs
 365:	79 00                	jns    367 <execInternalCommand-0x30ffc99>

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
