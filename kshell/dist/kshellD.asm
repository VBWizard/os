
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
 3100028:	05 68 0f 10 03       	add    eax,0x3100f68
 310002d:	8b 00                	mov    eax,DWORD PTR [eax]
 310002f:	a3 b4 12 10 03       	mov    ds:0x31012b4,eax
/home/yogi/src/os/kshell/kshell.c:32
        command_function_p = cmds[i].function;
 3100034:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100037:	c1 e0 04             	shl    eax,0x4
 310003a:	05 68 0f 10 03       	add    eax,0x3100f68
 310003f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100041:	a3 a0 12 10 03       	mov    ds:0x31012a0,eax
/home/yogi/src/os/kshell/kshell.c:33
        if (cmds[i].paramCount==0)
 3100046:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100049:	c1 e0 04             	shl    eax,0x4
 310004c:	05 6c 0f 10 03       	add    eax,0x3100f6c
 3100051:	8b 00                	mov    eax,DWORD PTR [eax]
 3100053:	85 c0                	test   eax,eax
 3100055:	75 09                	jne    3100060 <execInternalCommand+0x60>
/home/yogi/src/os/kshell/kshell.c:34
            command_function();
 3100057:	a1 b4 12 10 03       	mov    eax,ds:0x31012b4
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
 3100060:	8b 1d a0 12 10 03    	mov    ebx,DWORD PTR ds:0x31012a0
 3100066:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100069:	c1 e0 04             	shl    eax,0x4
 310006c:	05 60 0f 10 03       	add    eax,0x3100f60
 3100071:	8b 00                	mov    eax,DWORD PTR [eax]
 3100073:	83 ec 0c             	sub    esp,0xc
 3100076:	50                   	push   eax
 3100077:	e8 14 09 00 00       	call   3100990 <kShell+0x2c9>
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
 3100098:	68 14 0a 10 03       	push   0x3100a14
 310009d:	e8 4e 08 00 00       	call   31008f0 <kShell+0x229>
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
 31000da:	e8 91 08 00 00       	call   3100970 <kShell+0x2a9>
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
 31001bd:	e8 ce 07 00 00       	call   3100990 <kShell+0x2c9>
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
 310020a:	05 60 0f 10 03       	add    eax,0x3100f60
 310020f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100211:	83 ec 0c             	sub    esp,0xc
 3100214:	50                   	push   eax
 3100215:	e8 76 07 00 00       	call   3100990 <kShell+0x2c9>
 310021a:	83 c4 10             	add    esp,0x10
 310021d:	89 c2                	mov    edx,eax
 310021f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100222:	c1 e0 04             	shl    eax,0x4
 3100225:	05 60 0f 10 03       	add    eax,0x3100f60
 310022a:	8b 00                	mov    eax,DWORD PTR [eax]
 310022c:	83 ec 04             	sub    esp,0x4
 310022f:	52                   	push   edx
 3100230:	50                   	push   eax
 3100231:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100234:	e8 27 07 00 00       	call   3100960 <kShell+0x299>
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
/home/yogi/src/os/kshell/kshell.c:106



/*parts from http://*/
char **buildargv (const char *input)
{
 310025e:	55                   	push   ebp
 310025f:	89 e5                	mov    ebp,esp
 3100261:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/kshell/kshell.c:109
  char *arg;
  char *copybuf;
  int squote = 0;
 3100264:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/kshell/kshell.c:110
  int dquote = 0;
 310026b:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:111
  int bsquote = 0;
 3100272:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/kshell/kshell.c:112
  int argc = 0;
 3100279:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/kshell/kshell.c:113
  int maxargc = 0;
 3100280:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/kshell/kshell.c:114
  char **argv = NULL;
 3100287:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/kshell/kshell.c:118
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 310028e:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 3100292:	0f 84 33 02 00 00    	je     31004cb <buildargv+0x26d>
/home/yogi/src/os/kshell/kshell.c:121
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 3100298:	83 ec 0c             	sub    esp,0xc
 310029b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310029e:	e8 ed 06 00 00       	call   3100990 <kShell+0x2c9>
 31002a3:	83 c4 10             	add    esp,0x10
 31002a6:	83 c0 01             	add    eax,0x1
 31002a9:	83 ec 0c             	sub    esp,0xc
 31002ac:	50                   	push   eax
 31002ad:	e8 6e 06 00 00       	call   3100920 <kShell+0x259>
 31002b2:	83 c4 10             	add    esp,0x10
 31002b5:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:129
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 31002b8:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 31002bc:	74 0b                	je     31002c9 <buildargv+0x6b>
/home/yogi/src/os/kshell/kshell.c:129 (discriminator 1)
 31002be:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31002c1:	83 e8 01             	sub    eax,0x1
 31002c4:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 31002c7:	7f 3d                	jg     3100306 <buildargv+0xa8>
/home/yogi/src/os/kshell/kshell.c:132
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 31002c9:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 31002cd:	75 1c                	jne    31002eb <buildargv+0x8d>
/home/yogi/src/os/kshell/kshell.c:134
		{
		  maxargc = INITIAL_MAXARGC;
 31002cf:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/kshell/kshell.c:135
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 31002d6:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31002d9:	c1 e0 02             	shl    eax,0x2
 31002dc:	83 ec 0c             	sub    esp,0xc
 31002df:	50                   	push   eax
 31002e0:	e8 3b 06 00 00       	call   3100920 <kShell+0x259>
 31002e5:	83 c4 10             	add    esp,0x10
 31002e8:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/kshell/kshell.c:137
		}
	      argv = nargv;
 31002eb:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 31002ee:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/kshell/kshell.c:138
	      argv[argc] = NULL;
 31002f1:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31002f4:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31002fb:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31002fe:	01 d0                	add    eax,edx
 3100300:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:141
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 3100306:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100309:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:142
	  while (*input != EOS)
 310030c:	e9 ec 00 00 00       	jmp    31003fd <buildargv+0x19f>
/home/yogi/src/os/kshell/kshell.c:144
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100311:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100314:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100317:	3c 20                	cmp    al,0x20
 3100319:	75 16                	jne    3100331 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:144 (discriminator 1)
 310031b:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 310031f:	75 10                	jne    3100331 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:144 (discriminator 2)
 3100321:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100325:	75 0a                	jne    3100331 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:144 (discriminator 3)
 3100327:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310032b:	0f 84 da 00 00 00    	je     310040b <buildargv+0x1ad>
/home/yogi/src/os/kshell/kshell.c:150
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100331:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100335:	74 1d                	je     3100354 <buildargv+0xf6>
/home/yogi/src/os/kshell/kshell.c:152
		    {
		      bsquote = 0;
 3100337:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/kshell/kshell.c:153
		      *arg++ = *input;
 310033e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100341:	8d 50 01             	lea    edx,[eax+0x1]
 3100344:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100347:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310034a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310034d:	88 10                	mov    BYTE PTR [eax],dl
 310034f:	e9 a5 00 00 00       	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:155
		    }
		  else if (*input == '\\')
 3100354:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100357:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310035a:	3c 5c                	cmp    al,0x5c
 310035c:	75 0c                	jne    310036a <buildargv+0x10c>
/home/yogi/src/os/kshell/kshell.c:157
		    {
		      bsquote = 1;
 310035e:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 3100365:	e9 8f 00 00 00       	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:159
		    }
		  else if (squote)
 310036a:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 310036e:	74 26                	je     3100396 <buildargv+0x138>
/home/yogi/src/os/kshell/kshell.c:161
		    {
		      if (*input == '\'')
 3100370:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100373:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100376:	3c 27                	cmp    al,0x27
 3100378:	75 09                	jne    3100383 <buildargv+0x125>
/home/yogi/src/os/kshell/kshell.c:163
			{
			  squote = 0;
 310037a:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100381:	eb 76                	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:167
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
/home/yogi/src/os/kshell/kshell.c:170
			}
		    }
		  else if (dquote)
 3100396:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 310039a:	74 26                	je     31003c2 <buildargv+0x164>
/home/yogi/src/os/kshell/kshell.c:172
		    {
		      if (*input == '"')
 310039c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310039f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003a2:	3c 22                	cmp    al,0x22
 31003a4:	75 09                	jne    31003af <buildargv+0x151>
/home/yogi/src/os/kshell/kshell.c:174
			{
			  dquote = 0;
 31003a6:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 31003ad:	eb 4a                	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:178
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
/home/yogi/src/os/kshell/kshell.c:183
			}
		    }
		  else
		    {
		      if (*input == '\'')
 31003c2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003c5:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003c8:	3c 27                	cmp    al,0x27
 31003ca:	75 09                	jne    31003d5 <buildargv+0x177>
/home/yogi/src/os/kshell/kshell.c:185
			{
			  squote = 1;
 31003cc:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 31003d3:	eb 24                	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:187
			}
		      else if (*input == '"')
 31003d5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003d8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003db:	3c 22                	cmp    al,0x22
 31003dd:	75 09                	jne    31003e8 <buildargv+0x18a>
/home/yogi/src/os/kshell/kshell.c:189
			{
			  dquote = 1;
 31003df:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 31003e6:	eb 11                	jmp    31003f9 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:193
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
/home/yogi/src/os/kshell/kshell.c:197
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 31003f9:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/kshell/kshell.c:142
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
/home/yogi/src/os/kshell/kshell.c:200
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 310040b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310040e:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:202
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100411:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100414:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100417:	84 c0                	test   al,al
 3100419:	0f 84 9e 00 00 00    	je     31004bd <buildargv+0x25f>
/home/yogi/src/os/kshell/kshell.c:204
          {
            char* temp=malloc(strlen(copybuf)+1);
 310041f:	83 ec 0c             	sub    esp,0xc
 3100422:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100425:	e8 66 05 00 00       	call   3100990 <kShell+0x2c9>
 310042a:	83 c4 10             	add    esp,0x10
 310042d:	83 c0 01             	add    eax,0x1
 3100430:	83 ec 0c             	sub    esp,0xc
 3100433:	50                   	push   eax
 3100434:	e8 e7 04 00 00       	call   3100920 <kShell+0x259>
 3100439:	83 c4 10             	add    esp,0x10
 310043c:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/kshell/kshell.c:207
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 310043f:	83 ec 08             	sub    esp,0x8
 3100442:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100445:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100448:	e8 83 04 00 00       	call   31008d0 <kShell+0x209>
 310044d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:208
            free(copybuf);
 3100450:	83 ec 0c             	sub    esp,0xc
 3100453:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100456:	e8 45 05 00 00       	call   31009a0 <kShell+0x2d9>
 310045b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:209
            copybuf = (char *) malloc (strlen (input) + 1);
 310045e:	83 ec 0c             	sub    esp,0xc
 3100461:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100464:	e8 27 05 00 00       	call   3100990 <kShell+0x2c9>
 3100469:	83 c4 10             	add    esp,0x10
 310046c:	83 c0 01             	add    eax,0x1
 310046f:	83 ec 0c             	sub    esp,0xc
 3100472:	50                   	push   eax
 3100473:	e8 a8 04 00 00       	call   3100920 <kShell+0x259>
 3100478:	83 c4 10             	add    esp,0x10
 310047b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:210
            argv[argc] = temp;
 310047e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100481:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100488:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 310048b:	01 c2                	add    edx,eax
 310048d:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 3100490:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/kshell/kshell.c:212
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 3100492:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/kshell/kshell.c:213
            argv[argc] = NULL;
 3100496:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100499:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31004a0:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31004a3:	01 d0                	add    eax,edx
 31004a5:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:214
            input++;
 31004ab:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/kshell/kshell.c:215
            free(temp);
 31004af:	83 ec 0c             	sub    esp,0xc
 31004b2:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 31004b5:	e8 e6 04 00 00       	call   31009a0 <kShell+0x2d9>
 31004ba:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:218
          }
	}
      while (*input != EOS);
 31004bd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31004c0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31004c3:	84 c0                	test   al,al
 31004c5:	0f 85 ed fd ff ff    	jne    31002b8 <buildargv+0x5a>
/home/yogi/src/os/kshell/kshell.c:221
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 31004cb:	83 ec 0c             	sub    esp,0xc
 31004ce:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31004d1:	e8 ca 04 00 00       	call   31009a0 <kShell+0x2d9>
 31004d6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:222
  free(nargv);
 31004d9:	83 ec 0c             	sub    esp,0xc
 31004dc:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 31004df:	e8 bc 04 00 00       	call   31009a0 <kShell+0x2d9>
 31004e4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:223
  return (argv);
 31004e7:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/kshell/kshell.c:224
}
 31004ea:	c9                   	leave  
 31004eb:	c3                   	ret    

031004ec <helpMe>:
helpMe():
/home/yogi/src/os/kshell/kshell.c:227

void helpMe()
{
 31004ec:	55                   	push   ebp
 31004ed:	89 e5                	mov    ebp,esp
 31004ef:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:228
    print("Help:\n");
 31004f2:	83 ec 0c             	sub    esp,0xc
 31004f5:	68 34 0a 10 03       	push   0x3100a34
 31004fa:	e8 f1 03 00 00       	call   31008f0 <kShell+0x229>
 31004ff:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:229
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100502:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100509:	eb 30                	jmp    310053b <helpMe+0x4f>
/home/yogi/src/os/kshell/kshell.c:230 (discriminator 3)
        print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 310050b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310050e:	c1 e0 04             	shl    eax,0x4
 3100511:	05 64 0f 10 03       	add    eax,0x3100f64
 3100516:	8b 10                	mov    edx,DWORD PTR [eax]
 3100518:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310051b:	c1 e0 04             	shl    eax,0x4
 310051e:	05 60 0f 10 03       	add    eax,0x3100f60
 3100523:	8b 00                	mov    eax,DWORD PTR [eax]
 3100525:	83 ec 04             	sub    esp,0x4
 3100528:	52                   	push   edx
 3100529:	50                   	push   eax
 310052a:	68 3b 0a 10 03       	push   0x3100a3b
 310052f:	e8 bc 03 00 00       	call   31008f0 <kShell+0x229>
 3100534:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:229 (discriminator 3)
}

void helpMe()
{
    print("Help:\n");
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100537:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:229 (discriminator 1)
 310053b:	83 7d f4 03          	cmp    DWORD PTR [ebp-0xc],0x3
 310053f:	76 ca                	jbe    310050b <helpMe+0x1f>
/home/yogi/src/os/kshell/kshell.c:231
        print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
}
 3100541:	90                   	nop
 3100542:	c9                   	leave  
 3100543:	c3                   	ret    

03100544 <execp>:
execp():
/home/yogi/src/os/kshell/kshell.c:234

void execp(char* cmdline)
{
 3100544:	55                   	push   ebp
 3100545:	89 e5                	mov    ebp,esp
 3100547:	53                   	push   ebx
 3100548:	81 ec 14 14 00 00    	sub    esp,0x1414
/home/yogi/src/os/kshell/kshell.c:236
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 310054e:	83 ec 04             	sub    esp,0x4
 3100551:	68 00 14 00 00       	push   0x1400
 3100556:	8d 85 f0 eb ff ff    	lea    eax,[ebp-0x1410]
 310055c:	50                   	push   eax
 310055d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100560:	e8 46 fb ff ff       	call   31000ab <parseParamsShell>
 3100565:	83 c4 10             	add    esp,0x10
 3100568:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:237
    uint32_t pid=0;
 310056b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:239

    print("Executing %s\n",params[0]);
 3100572:	83 ec 08             	sub    esp,0x8
 3100575:	8d 85 f0 eb ff ff    	lea    eax,[ebp-0x1410]
 310057b:	50                   	push   eax
 310057c:	68 44 0a 10 03       	push   0x3100a44
 3100581:	e8 6a 03 00 00       	call   31008f0 <kShell+0x229>
 3100586:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:240
    __asm__("push eax\n"
 3100589:	b8 59 00 00 00       	mov    eax,0x59
 310058e:	8d 9d f0 eb ff ff    	lea    ebx,[ebp-0x1410]
 3100594:	b9 00 00 00 00       	mov    ecx,0x0
 3100599:	ba 00 00 00 00       	mov    edx,0x0
 310059e:	50                   	push   eax
 310059f:	53                   	push   ebx
 31005a0:	51                   	push   ecx
 31005a1:	52                   	push   edx
 31005a2:	cd 80                	int    0x80
 31005a4:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:247
            "push ecx\n"
            "push edx\n"
            "int 0x80\n"
            :"=a" (pid)
            :"a" (0x59),"b" (params[0]),"c" (0),"d" (0));
    print("Waiting on pid=0x%08X\n",pid);
 31005a7:	83 ec 08             	sub    esp,0x8
 31005aa:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005ad:	68 52 0a 10 03       	push   0x3100a52
 31005b2:	e8 39 03 00 00       	call   31008f0 <kShell+0x229>
 31005b7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:248
    waitpid(pid);
 31005ba:	83 ec 0c             	sub    esp,0xc
 31005bd:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005c0:	e8 1b 03 00 00       	call   31008e0 <kShell+0x219>
 31005c5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:249
    print("pid=0x%08X returned\n",pid);
 31005c8:	83 ec 08             	sub    esp,0x8
 31005cb:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005ce:	68 69 0a 10 03       	push   0x3100a69
 31005d3:	e8 18 03 00 00       	call   31008f0 <kShell+0x229>
 31005d8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:252
    //exec(params[0],0,0);
    //strcpy(sExecutingProgram,params[0]+1);
}
 31005db:	90                   	nop
 31005dc:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31005df:	c9                   	leave  
 31005e0:	c3                   	ret    

031005e1 <kSleep>:
kSleep():
/home/yogi/src/os/kshell/kshell.c:255

void kSleep(char *cmdline)
{
 31005e1:	55                   	push   ebp
 31005e2:	89 e5                	mov    ebp,esp
 31005e4:	81 ec 18 14 00 00    	sub    esp,0x1418
/home/yogi/src/os/kshell/kshell.c:257
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 31005ea:	83 ec 04             	sub    esp,0x4
 31005ed:	68 00 14 00 00       	push   0x1400
 31005f2:	8d 85 f4 eb ff ff    	lea    eax,[ebp-0x140c]
 31005f8:	50                   	push   eax
 31005f9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31005fc:	e8 aa fa ff ff       	call   31000ab <parseParamsShell>
 3100601:	83 c4 10             	add    esp,0x10
 3100604:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:259

    if (params[0][0]==0)
 3100607:	0f b6 85 f4 eb ff ff 	movzx  eax,BYTE PTR [ebp-0x140c]
 310060e:	84 c0                	test   al,al
 3100610:	75 12                	jne    3100624 <kSleep+0x43>
/home/yogi/src/os/kshell/kshell.c:261
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 3100612:	83 ec 0c             	sub    esp,0xc
 3100615:	68 80 0a 10 03       	push   0x3100a80
 310061a:	e8 d1 02 00 00       	call   31008f0 <kShell+0x229>
 310061f:	83 c4 10             	add    esp,0x10
 3100622:	eb 49                	jmp    310066d <kSleep+0x8c>
/home/yogi/src/os/kshell/kshell.c:264
        return;
    }
    print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
 3100624:	83 ec 04             	sub    esp,0x4
 3100627:	6a 0a                	push   0xa
 3100629:	6a 00                	push   0x0
 310062b:	8d 85 f4 eb ff ff    	lea    eax,[ebp-0x140c]
 3100631:	50                   	push   eax
 3100632:	e8 09 03 00 00       	call   3100940 <kShell+0x279>
 3100637:	83 c4 10             	add    esp,0x10
 310063a:	83 ec 08             	sub    esp,0x8
 310063d:	50                   	push   eax
 310063e:	68 be 0a 10 03       	push   0x3100abe
 3100643:	e8 a8 02 00 00       	call   31008f0 <kShell+0x229>
 3100648:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:265
    sleep(strtoul(params[0],0,10));
 310064b:	83 ec 04             	sub    esp,0x4
 310064e:	6a 0a                	push   0xa
 3100650:	6a 00                	push   0x0
 3100652:	8d 85 f4 eb ff ff    	lea    eax,[ebp-0x140c]
 3100658:	50                   	push   eax
 3100659:	e8 e2 02 00 00       	call   3100940 <kShell+0x279>
 310065e:	83 c4 10             	add    esp,0x10
 3100661:	83 ec 0c             	sub    esp,0xc
 3100664:	50                   	push   eax
 3100665:	e8 c6 02 00 00       	call   3100930 <kShell+0x269>
 310066a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:266
}
 310066d:	c9                   	leave  
 310066e:	c3                   	ret    

0310066f <kExit>:
kExit():
/home/yogi/src/os/kshell/kshell.c:269

void kExit(char *cmdline)
{
 310066f:	55                   	push   ebp
 3100670:	89 e5                	mov    ebp,esp
 3100672:	81 ec 08 14 00 00    	sub    esp,0x1408
/home/yogi/src/os/kshell/kshell.c:272
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 3100678:	83 ec 04             	sub    esp,0x4
 310067b:	68 00 14 00 00       	push   0x1400
 3100680:	8d 85 f8 eb ff ff    	lea    eax,[ebp-0x1408]
 3100686:	50                   	push   eax
 3100687:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310068a:	e8 1c fa ff ff       	call   31000ab <parseParamsShell>
 310068f:	83 c4 10             	add    esp,0x10
 3100692:	85 c0                	test   eax,eax
 3100694:	74 1d                	je     31006b3 <kExit+0x44>
/home/yogi/src/os/kshell/kshell.c:274
    {
        exitCode = strtoul(params[0],0,10);
 3100696:	83 ec 04             	sub    esp,0x4
 3100699:	6a 0a                	push   0xa
 310069b:	6a 00                	push   0x0
 310069d:	8d 85 f8 eb ff ff    	lea    eax,[ebp-0x1408]
 31006a3:	50                   	push   eax
 31006a4:	e8 97 02 00 00       	call   3100940 <kShell+0x279>
 31006a9:	83 c4 10             	add    esp,0x10
 31006ac:	a3 84 10 10 03       	mov    ds:0x3101084,eax
 31006b1:	eb 0a                	jmp    31006bd <kExit+0x4e>
/home/yogi/src/os/kshell/kshell.c:277
    }
    else
        exitCode = 0;
 31006b3:	c7 05 84 10 10 03 00 	mov    DWORD PTR ds:0x3101084,0x0
 31006ba:	00 00 00 
/home/yogi/src/os/kshell/kshell.c:278
    timeToExit=true;
 31006bd:	c6 05 80 10 10 03 01 	mov    BYTE PTR ds:0x3101080,0x1
/home/yogi/src/os/kshell/kshell.c:279
}
 31006c4:	90                   	nop
 31006c5:	c9                   	leave  
 31006c6:	c3                   	ret    

031006c7 <kShell>:
kShell():
/home/yogi/src/os/kshell/kshell.c:282

int kShell(int argc, char** argv)
{
 31006c7:	55                   	push   ebp
 31006c8:	89 e5                	mov    ebp,esp
 31006ca:	81 ec f8 0a 00 00    	sub    esp,0xaf8
/home/yogi/src/os/kshell/kshell.c:284
    char lCommand[256];
    uint8_t lCurrKey=0;
 31006d0:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:285
    int lCurrKeyCount=0;
 31006d7:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/kshell/kshell.c:287
    char commands[50][50];
    int commandsPtr=0;
 31006de:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:288
    int commandBuffPtr=0;
 31006e5:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/kshell/kshell.c:289
    int commandWasFromThisBufferPtr=0;
 31006ec:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:292
    char ansiSeq[20];

    libc_init();
 31006f3:	e8 58 02 00 00       	call   3100950 <kShell+0x289>
/home/yogi/src/os/kshell/kshell.c:293
    ansiSeq[0]=0x1b;
 31006f8:	c6 85 0b f5 ff ff 1b 	mov    BYTE PTR [ebp-0xaf5],0x1b
/home/yogi/src/os/kshell/kshell.c:294
    sKShellProgramName=malloc(1024);
 31006ff:	83 ec 0c             	sub    esp,0xc
 3100702:	68 00 04 00 00       	push   0x400
 3100707:	e8 14 02 00 00       	call   3100920 <kShell+0x259>
 310070c:	83 c4 10             	add    esp,0x10
 310070f:	a3 c0 12 10 03       	mov    ds:0x31012c0,eax
/home/yogi/src/os/kshell/kshell.c:295
    strcpy(sKShellProgramName,"kShell");
 3100714:	a1 c0 12 10 03       	mov    eax,ds:0x31012c0
 3100719:	83 ec 08             	sub    esp,0x8
 310071c:	68 d7 0a 10 03       	push   0x3100ad7
 3100721:	50                   	push   eax
 3100722:	e8 a9 01 00 00       	call   31008d0 <kShell+0x209>
 3100727:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:296
    strcpy(sExecutingProgram,sKShellProgramName);
 310072a:	a1 c0 12 10 03       	mov    eax,ds:0x31012c0
 310072f:	83 ec 08             	sub    esp,0x8
 3100732:	50                   	push   eax
 3100733:	68 a0 10 10 03       	push   0x31010a0
 3100738:	e8 93 01 00 00       	call   31008d0 <kShell+0x209>
 310073d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:297
    puts("\nWelcome to kShell ... hang a while!\n");
 3100740:	83 ec 0c             	sub    esp,0xc
 3100743:	68 e0 0a 10 03       	push   0x3100ae0
 3100748:	e8 c3 01 00 00       	call   3100910 <kShell+0x249>
 310074d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:299

    while (!timeToExit)
 3100750:	e9 51 01 00 00       	jmp    31008a6 <kShell+0x1df>
/home/yogi/src/os/kshell/kshell.c:302
    {
getACommand:
        lCurrKey=0;
 3100755:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:303
        lCurrKeyCount=0;
 310075c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/kshell/kshell.c:304
        memset(lCommand,0,256);
 3100763:	83 ec 04             	sub    esp,0x4
 3100766:	68 00 01 00 00       	push   0x100
 310076b:	6a 00                	push   0x0
 310076d:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 3100773:	50                   	push   eax
 3100774:	e8 f7 01 00 00       	call   3100970 <kShell+0x2a9>
 3100779:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:305
        print("%s> ",sExecutingProgram);
 310077c:	83 ec 08             	sub    esp,0x8
 310077f:	68 a0 10 10 03       	push   0x31010a0
 3100784:	68 06 0b 10 03       	push   0x3100b06
 3100789:	e8 62 01 00 00       	call   31008f0 <kShell+0x229>
 310078e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:307
getAKey:
        lCurrKey=0;
 3100791:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:308
        while(lCurrKey==0)
 3100798:	eb 16                	jmp    31007b0 <kShell+0xe9>
/home/yogi/src/os/kshell/kshell.c:310
        {
            gets(&lCurrKey,1,1);
 310079a:	83 ec 04             	sub    esp,0x4
 310079d:	6a 01                	push   0x1
 310079f:	6a 01                	push   0x1
 31007a1:	8d 85 e3 fe ff ff    	lea    eax,[ebp-0x11d]
 31007a7:	50                   	push   eax
 31007a8:	e8 53 01 00 00       	call   3100900 <kShell+0x239>
 31007ad:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:308
        lCurrKeyCount=0;
        memset(lCommand,0,256);
        print("%s> ",sExecutingProgram);
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 31007b0:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31007b7:	84 c0                	test   al,al
 31007b9:	74 df                	je     310079a <kShell+0xd3>
/home/yogi/src/os/kshell/kshell.c:313
        {
            gets(&lCurrKey,1,1);
        }
        //print("key='%08X'",lCurrKey);
        if((byte)lCurrKey==0xc8) //up
 31007bb:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31007c2:	3c c8                	cmp    al,0xc8
 31007c4:	75 08                	jne    31007ce <kShell+0x107>
/home/yogi/src/os/kshell/kshell.c:315
        {
            if (commandBuffPtr>=0)
 31007c6:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31007ca:	79 02                	jns    31007ce <kShell+0x107>
/home/yogi/src/os/kshell/kshell.c:328
                lCurrKeyCount=strlen(lCommand);
                cursorMoveTo(4+lCurrKeyCount,lTemp);
                goto getAKey;*/
            }
            else
                goto getAKey;
 31007cc:	eb c3                	jmp    3100791 <kShell+0xca>
/home/yogi/src/os/kshell/kshell.c:330
        }
        if (lCurrKey==0xD0)  //down
 31007ce:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31007d5:	3c d0                	cmp    al,0xd0
 31007d7:	75 0a                	jne    31007e3 <kShell+0x11c>
/home/yogi/src/os/kshell/kshell.c:332
        {
            if (commandBuffPtr<=commandsPtr)
 31007d9:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 31007dc:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 31007df:	7e 02                	jle    31007e3 <kShell+0x11c>
/home/yogi/src/os/kshell/kshell.c:345
                lCurrKeyCount=strlen(lCommand);
                cursorMoveTo(4+lCurrKeyCount,lTemp);
                goto getAKey;*/
            }
            else
                goto getAKey;
 31007e1:	eb ae                	jmp    3100791 <kShell+0xca>
/home/yogi/src/os/kshell/kshell.c:348
            
        }   
        if (lCurrKey==0xcb) //left
 31007e3:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31007ea:	3c cb                	cmp    al,0xcb
 31007ec:	75 02                	jne    31007f0 <kShell+0x129>
/home/yogi/src/os/kshell/kshell.c:357
            {
                cursorMoveTo(cursorGetPosX()-1,cursorGetPosY());
                lCurrKeyCount--;
            }
             */
            goto getAKey;
 31007ee:	eb a1                	jmp    3100791 <kShell+0xca>
/home/yogi/src/os/kshell/kshell.c:359
        }
        if (lCurrKey=='\b')
 31007f0:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31007f7:	3c 08                	cmp    al,0x8
 31007f9:	75 15                	jne    3100810 <kShell+0x149>
/home/yogi/src/os/kshell/kshell.c:361
        {
            if (lCurrKeyCount>0)
 31007fb:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31007ff:	7e 90                	jle    3100791 <kShell+0xca>
/home/yogi/src/os/kshell/kshell.c:363
            {
                putc('\b');
 3100801:	83 ec 0c             	sub    esp,0xc
 3100804:	6a 08                	push   0x8
 3100806:	e8 75 01 00 00       	call   3100980 <kShell+0x2b9>
 310080b:	83 c4 10             	add    esp,0x10
 310080e:	eb 81                	jmp    3100791 <kShell+0xca>
/home/yogi/src/os/kshell/kshell.c:375
                cursorMoveTo(cursorGetPosX()-1,lTemp);*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
 3100810:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100817:	3c 0a                	cmp    al,0xa
 3100819:	74 1c                	je     3100837 <kShell+0x170>
/home/yogi/src/os/kshell/kshell.c:381
        {
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 310081b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310081e:	8d 50 01             	lea    edx,[eax+0x1]
 3100821:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100824:	0f b6 95 e3 fe ff ff 	movzx  edx,BYTE PTR [ebp-0x11d]
 310082b:	88 94 05 e4 fe ff ff 	mov    BYTE PTR [ebp+eax*1-0x11c],dl
/home/yogi/src/os/kshell/kshell.c:383
        }
        goto getAKey;
 3100832:	e9 5a ff ff ff       	jmp    3100791 <kShell+0xca>
/home/yogi/src/os/kshell/kshell.c:377
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
        {
            goto doneGettingKeys;
 3100837:	90                   	nop
/home/yogi/src/os/kshell/kshell.c:386
            lCommand[lCurrKeyCount++]=lCurrKey;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 3100838:	0f b6 85 e4 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11c]
 310083f:	84 c0                	test   al,al
 3100841:	75 05                	jne    3100848 <kShell+0x181>
/home/yogi/src/os/kshell/kshell.c:387
            goto getACommand;
 3100843:	e9 0d ff ff ff       	jmp    3100755 <kShell+0x8e>
/home/yogi/src/os/kshell/kshell.c:388
        int i = findCommand(lCommand);
 3100848:	83 ec 0c             	sub    esp,0xc
 310084b:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 3100851:	50                   	push   eax
 3100852:	e8 9e f9 ff ff       	call   31001f5 <findCommand>
 3100857:	83 c4 10             	add    esp,0x10
 310085a:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/kshell/kshell.c:390

        execInternalCommand(lCommand);
 310085d:	83 ec 0c             	sub    esp,0xc
 3100860:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 3100866:	50                   	push   eax
 3100867:	e8 94 f7 ff ff       	call   3100000 <execInternalCommand>
 310086c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:391
        if(i>0)
 310086f:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100873:	7e 31                	jle    31008a6 <kShell+0x1df>
/home/yogi/src/os/kshell/kshell.c:393
        {
            i--;
 3100875:	83 6d e4 01          	sub    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/kshell/kshell.c:402
//                for (int cnt=commandWasFromThisBufferPtr;cnt<=commandsPtr;cnt++)
//                    strcpy(commands[cnt],commands[cnt+1]);
//                commandWasFromThisBufferPtr=0;
//                commandsPtr--;
            }
            strcpy(commands[commandsPtr++],lCommand);
 3100879:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310087c:	8d 50 01             	lea    edx,[eax+0x1]
 310087f:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 3100882:	8d 95 1f f5 ff ff    	lea    edx,[ebp-0xae1]
 3100888:	6b c0 32             	imul   eax,eax,0x32
 310088b:	01 c2                	add    edx,eax
 310088d:	83 ec 08             	sub    esp,0x8
 3100890:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 3100896:	50                   	push   eax
 3100897:	52                   	push   edx
 3100898:	e8 33 00 00 00       	call   31008d0 <kShell+0x209>
 310089d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:403
            commandBuffPtr=commandsPtr;
 31008a0:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31008a3:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/kshell/kshell.c:299
    sKShellProgramName=malloc(1024);
    strcpy(sKShellProgramName,"kShell");
    strcpy(sExecutingProgram,sKShellProgramName);
    puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 31008a6:	0f b6 05 80 10 10 03 	movzx  eax,BYTE PTR ds:0x3101080
 31008ad:	83 f0 01             	xor    eax,0x1
 31008b0:	84 c0                	test   al,al
 31008b2:	0f 85 9d fe ff ff    	jne    3100755 <kShell+0x8e>
/home/yogi/src/os/kshell/kshell.c:406
            }
            strcpy(commands[commandsPtr++],lCommand);
            commandBuffPtr=commandsPtr;
        }
    }
    return exitCode;
 31008b8:	a1 84 10 10 03       	mov    eax,ds:0x3101084
/home/yogi/src/os/kshell/kshell.c:407
}
 31008bd:	c9                   	leave  
 31008be:	c3                   	ret    

Disassembly of section .plt:

031008c0 <.plt>:
 31008c0:	ff 35 34 10 10 03    	push   DWORD PTR ds:0x3101034
 31008c6:	ff 25 38 10 10 03    	jmp    DWORD PTR ds:0x3101038
 31008cc:	00 00                	add    BYTE PTR [eax],al
 31008ce:	00 00                	add    BYTE PTR [eax],al
 31008d0:	ff 25 3c 10 10 03    	jmp    DWORD PTR ds:0x310103c
 31008d6:	68 00 00 00 00       	push   0x0
 31008db:	e9 e0 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 31008e0:	ff 25 40 10 10 03    	jmp    DWORD PTR ds:0x3101040
 31008e6:	68 08 00 00 00       	push   0x8
 31008eb:	e9 d0 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 31008f0:	ff 25 44 10 10 03    	jmp    DWORD PTR ds:0x3101044
 31008f6:	68 10 00 00 00       	push   0x10
 31008fb:	e9 c0 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 3100900:	ff 25 48 10 10 03    	jmp    DWORD PTR ds:0x3101048
 3100906:	68 18 00 00 00       	push   0x18
 310090b:	e9 b0 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 3100910:	ff 25 4c 10 10 03    	jmp    DWORD PTR ds:0x310104c
 3100916:	68 20 00 00 00       	push   0x20
 310091b:	e9 a0 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 3100920:	ff 25 50 10 10 03    	jmp    DWORD PTR ds:0x3101050
 3100926:	68 28 00 00 00       	push   0x28
 310092b:	e9 90 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 3100930:	ff 25 54 10 10 03    	jmp    DWORD PTR ds:0x3101054
 3100936:	68 30 00 00 00       	push   0x30
 310093b:	e9 80 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 3100940:	ff 25 58 10 10 03    	jmp    DWORD PTR ds:0x3101058
 3100946:	68 38 00 00 00       	push   0x38
 310094b:	e9 70 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 3100950:	ff 25 5c 10 10 03    	jmp    DWORD PTR ds:0x310105c
 3100956:	68 40 00 00 00       	push   0x40
 310095b:	e9 60 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 3100960:	ff 25 60 10 10 03    	jmp    DWORD PTR ds:0x3101060
 3100966:	68 48 00 00 00       	push   0x48
 310096b:	e9 50 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 3100970:	ff 25 64 10 10 03    	jmp    DWORD PTR ds:0x3101064
 3100976:	68 50 00 00 00       	push   0x50
 310097b:	e9 40 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 3100980:	ff 25 68 10 10 03    	jmp    DWORD PTR ds:0x3101068
 3100986:	68 58 00 00 00       	push   0x58
 310098b:	e9 30 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 3100990:	ff 25 6c 10 10 03    	jmp    DWORD PTR ds:0x310106c
 3100996:	68 60 00 00 00       	push   0x60
 310099b:	e9 20 ff ff ff       	jmp    31008c0 <kShell+0x1f9>
 31009a0:	ff 25 70 10 10 03    	jmp    DWORD PTR ds:0x3101070
 31009a6:	68 68 00 00 00       	push   0x68
 31009ab:	e9 10 ff ff ff       	jmp    31008c0 <kShell+0x1f9>

Disassembly of section .rodata:

031009b0 <.rodata>:
 31009b0:	68 65 6c 70 00       	push   0x706c65
 31009b5:	47                   	inc    edi
 31009b6:	65                   	gs
 31009b7:	74 20                	je     31009d9 <kShell+0x312>
 31009b9:	68 65 6c 70 20       	push   0x20706c65
 31009be:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 31009c2:	73 20                	jae    31009e4 <kShell+0x31d>
 31009c4:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 31009cb:	74 69                	je     3100a36 <kShell+0x36f>
 31009cd:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31009ce:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31009cf:	29 00                	sub    DWORD PTR [eax],eax
 31009d1:	65                   	gs
 31009d2:	78 65                	js     3100a39 <kShell+0x372>
 31009d4:	63 00                	arpl   WORD PTR [eax],ax
 31009d6:	45                   	inc    ebp
 31009d7:	78 65                	js     3100a3e <kShell+0x377>
 31009d9:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 31009dc:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 31009e0:	70 72                	jo     3100a54 <kShell+0x38d>
 31009e2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31009e3:	67 72 61             	addr16 jb 3100a47 <kShell+0x380>
 31009e6:	6d                   	ins    DWORD PTR es:[edi],dx
 31009e7:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 31009ea:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 31009f1:	20 
 31009f2:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 31009f6:	6c                   	ins    BYTE PTR es:[edi],dx
 31009f7:	6c                   	ins    BYTE PTR es:[edi],dx
 31009f8:	00 73 6c             	add    BYTE PTR [ebx+0x6c],dh
 31009fb:	65                   	gs
 31009fc:	65                   	gs
 31009fd:	70 00                	jo     31009ff <kShell+0x338>
 31009ff:	53                   	push   ebx
 3100a00:	6c                   	ins    BYTE PTR es:[edi],dx
 3100a01:	65                   	gs
 3100a02:	65                   	gs
 3100a03:	70 20                	jo     3100a25 <kShell+0x35e>
 3100a05:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3100a07:	72 20                	jb     3100a29 <kShell+0x362>
 3100a09:	78 20                	js     3100a2b <kShell+0x364>
 3100a0b:	73 65                	jae    3100a72 <kShell+0x3ab>
 3100a0d:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100a10:	64                   	fs
 3100a11:	73 00                	jae    3100a13 <kShell+0x34c>
 3100a13:	00 49 6e             	add    BYTE PTR [ecx+0x6e],cl
 3100a16:	76 61                	jbe    3100a79 <kShell+0x3b2>
 3100a18:	6c                   	ins    BYTE PTR es:[edi],dx
 3100a19:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 3100a20:	61 
 3100a21:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100a22:	64 20 27             	and    BYTE PTR fs:[edi],ah
 3100a25:	25 73 27 20 79       	and    eax,0x79202773
 3100a2a:	61                   	popa   
 3100a2b:	20 64 75 6d          	and    BYTE PTR [ebp+esi*2+0x6d],ah
 3100a2f:	6d                   	ins    DWORD PTR es:[edi],dx
 3100a30:	79 21                	jns    3100a53 <kShell+0x38c>
 3100a32:	0a 00                	or     al,BYTE PTR [eax]
 3100a34:	48                   	dec    eax
 3100a35:	65                   	gs
 3100a36:	6c                   	ins    BYTE PTR es:[edi],dx
 3100a37:	70 3a                	jo     3100a73 <kShell+0x3ac>
 3100a39:	0a 00                	or     al,BYTE PTR [eax]
 3100a3b:	09 25 73 3a 20 25    	or     DWORD PTR ds:0x25203a73,esp
 3100a41:	73 0a                	jae    3100a4d <kShell+0x386>
 3100a43:	00 45 78             	add    BYTE PTR [ebp+0x78],al
 3100a46:	65 63 75 74          	arpl   WORD PTR gs:[ebp+0x74],si
 3100a4a:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3100a51:	00 57 61             	add    BYTE PTR [edi+0x61],dl
 3100a54:	69 74 69 6e 67 20 6f 	imul   esi,DWORD PTR [ecx+ebp*2+0x6e],0x6e6f2067
 3100a5b:	6e 
 3100a5c:	20 70 69             	and    BYTE PTR [eax+0x69],dh
 3100a5f:	64                   	fs
 3100a60:	3d 30 78 25 30       	cmp    eax,0x30257830
 3100a65:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
 3100a68:	00 70 69             	add    BYTE PTR [eax+0x69],dh
 3100a6b:	64                   	fs
 3100a6c:	3d 30 78 25 30       	cmp    eax,0x30257830
 3100a71:	38 58 20             	cmp    BYTE PTR [eax+0x20],bl
 3100a74:	72 65                	jb     3100adb <kShell+0x414>
 3100a76:	74 75                	je     3100aed <kShell+0x426>
 3100a78:	72 6e                	jb     3100ae8 <kShell+0x421>
 3100a7a:	65 64 0a 00          	gs or  al,BYTE PTR fs:gs:[eax]
 3100a7e:	00 00                	add    BYTE PTR [eax],al
 3100a80:	52                   	push   edx
 3100a81:	65                   	gs
 3100a82:	71 75                	jno    3100af9 <kShell+0x432>
 3100a84:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 3100a8b:	70 61                	jo     3100aee <kShell+0x427>
 3100a8d:	72 61                	jb     3100af0 <kShell+0x429>
 3100a8f:	6d                   	ins    DWORD PTR es:[edi],dx
 3100a90:	65                   	gs
 3100a91:	74 65                	je     3100af8 <kShell+0x431>
 3100a93:	72 20                	jb     3100ab5 <kShell+0x3ee>
 3100a95:	77 68                	ja     3100aff <kShell+0x438>
 3100a97:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 3100a9e:	74 68                	je     3100b08 <kShell+0x441>
 3100aa0:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 3100aa4:	6d                   	ins    DWORD PTR es:[edi],dx
 3100aa5:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 3100aa8:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 3100aab:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 3100aae:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100ab1:	64                   	fs
 3100ab2:	73 20                	jae    3100ad4 <kShell+0x40d>
 3100ab4:	74 6f                	je     3100b25 <kShell+0x45e>
 3100ab6:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3100ab9:	65                   	gs
 3100aba:	65                   	gs
 3100abb:	70 0a                	jo     3100ac7 <kShell+0x400>
 3100abd:	00 53 6c             	add    BYTE PTR [ebx+0x6c],dl
 3100ac0:	65                   	gs
 3100ac1:	65                   	gs
 3100ac2:	70 69                	jo     3100b2d <kShell+0x466>
 3100ac4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100ac5:	67 20 66 6f          	and    BYTE PTR [bp+0x6f],ah
 3100ac9:	72 20                	jb     3100aeb <kShell+0x424>
 3100acb:	25 75 20 73 65       	and    eax,0x65732075
 3100ad0:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100ad3:	64                   	fs
 3100ad4:	73 0a                	jae    3100ae0 <kShell+0x419>
 3100ad6:	00 6b 53             	add    BYTE PTR [ebx+0x53],ch
 3100ad9:	68 65 6c 6c 00       	push   0x6c6c65
 3100ade:	00 00                	add    BYTE PTR [eax],al
 3100ae0:	0a 57 65             	or     dl,BYTE PTR [edi+0x65]
 3100ae3:	6c                   	ins    BYTE PTR es:[edi],dx
 3100ae4:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 3100ae7:	65 20 74 6f 20       	and    BYTE PTR gs:[edi+ebp*2+0x20],dh
 3100aec:	6b 53 68 65          	imul   edx,DWORD PTR [ebx+0x68],0x65
 3100af0:	6c                   	ins    BYTE PTR es:[edi],dx
 3100af1:	6c                   	ins    BYTE PTR es:[edi],dx
 3100af2:	20 2e                	and    BYTE PTR [esi],ch
 3100af4:	2e 2e 20 68 61       	cs and BYTE PTR cs:[eax+0x61],ch
 3100af9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100afa:	67 20 61 20          	and    BYTE PTR [bx+di+0x20],ah
 3100afe:	77 68                	ja     3100b68 <kShell+0x4a1>
 3100b00:	69 6c 65 21 0a 00 25 	imul   ebp,DWORD PTR [ebp+eiz*2+0x21],0x7325000a
 3100b07:	73 
 3100b08:	3e 20 00             	and    BYTE PTR ds:[eax],al

Disassembly of section .eh_frame:

03100b0c <.eh_frame>:
 3100b0c:	14 00                	adc    al,0x0
 3100b0e:	00 00                	add    BYTE PTR [eax],al
 3100b10:	00 00                	add    BYTE PTR [eax],al
 3100b12:	00 00                	add    BYTE PTR [eax],al
 3100b14:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3100b17:	00 01                	add    BYTE PTR [ecx],al
 3100b19:	7c 08                	jl     3100b23 <kShell+0x45c>
 3100b1b:	01 1b                	add    DWORD PTR [ebx],ebx
 3100b1d:	0c 04                	or     al,0x4
 3100b1f:	04 88                	add    al,0x88
 3100b21:	01 00                	add    DWORD PTR [eax],eax
 3100b23:	00 20                	add    BYTE PTR [eax],ah
 3100b25:	00 00                	add    BYTE PTR [eax],al
 3100b27:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100b2a:	00 00                	add    BYTE PTR [eax],al
 3100b2c:	d4 f4                	aam    0xf4
 3100b2e:	ff                   	(bad)  
 3100b2f:	ff ab 00 00 00 00    	jmp    FWORD PTR [ebx+0x0]
 3100b35:	41                   	inc    ecx
 3100b36:	0e                   	push   cs
 3100b37:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100b3d:	44                   	inc    esp
 3100b3e:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100b41:	a3 c5 c3 0c 04       	mov    ds:0x40cc3c5,eax
 3100b46:	04 00                	add    al,0x0
 3100b48:	20 00                	and    BYTE PTR [eax],al
 3100b4a:	00 00                	add    BYTE PTR [eax],al
 3100b4c:	40                   	inc    eax
 3100b4d:	00 00                	add    BYTE PTR [eax],al
 3100b4f:	00 5b f5             	add    BYTE PTR [ebx-0xb],bl
 3100b52:	ff                   	(bad)  
 3100b53:	ff 4a 01             	dec    DWORD PTR [edx+0x1]
 3100b56:	00 00                	add    BYTE PTR [eax],al
 3100b58:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100b5b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100b61:	44                   	inc    esp
 3100b62:	83 03 03             	add    DWORD PTR [ebx],0x3
 3100b65:	42                   	inc    edx
 3100b66:	01 c5                	add    ebp,eax
 3100b68:	c3                   	ret    
 3100b69:	0c 04                	or     al,0x4
 3100b6b:	04 1c                	add    al,0x1c
 3100b6d:	00 00                	add    BYTE PTR [eax],al
 3100b6f:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
 3100b73:	00 81 f6 ff ff 69    	add    BYTE PTR [ecx+0x69fffff6],al
 3100b79:	00 00                	add    BYTE PTR [eax],al
 3100b7b:	00 00                	add    BYTE PTR [eax],al
 3100b7d:	41                   	inc    ecx
 3100b7e:	0e                   	push   cs
 3100b7f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100b85:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3100b88:	0c 04                	or     al,0x4
 3100b8a:	04 00                	add    al,0x0
 3100b8c:	1c 00                	sbb    al,0x0
 3100b8e:	00 00                	add    BYTE PTR [eax],al
 3100b90:	84 00                	test   BYTE PTR [eax],al
 3100b92:	00 00                	add    BYTE PTR [eax],al
 3100b94:	ca f6 ff             	retf   0xfff6
 3100b97:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 3100b9d:	41                   	inc    ecx
 3100b9e:	0e                   	push   cs
 3100b9f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100ba5:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 3100bab:	04 1c                	add    al,0x1c
 3100bad:	00 00                	add    BYTE PTR [eax],al
 3100baf:	00 a4 00 00 00 38 f9 	add    BYTE PTR [eax+eax*1-0x6c80000],ah
 3100bb6:	ff                   	(bad)  
 3100bb7:	ff 58 00             	call   FWORD PTR [eax+0x0]
 3100bba:	00 00                	add    BYTE PTR [eax],al
 3100bbc:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100bbf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100bc5:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3100bc9:	04 04                	add    al,0x4
 3100bcb:	00 20                	add    BYTE PTR [eax],ah
 3100bcd:	00 00                	add    BYTE PTR [eax],al
 3100bcf:	00 c4                	add    ah,al
 3100bd1:	00 00                	add    BYTE PTR [eax],al
 3100bd3:	00 70 f9             	add    BYTE PTR [eax-0x7],dh
 3100bd6:	ff                   	(bad)  
 3100bd7:	ff 9d 00 00 00 00    	call   FWORD PTR [ebp+0x0]
 3100bdd:	41                   	inc    ecx
 3100bde:	0e                   	push   cs
 3100bdf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100be5:	47                   	inc    edi
 3100be6:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100be9:	92                   	xchg   edx,eax
 3100bea:	c5 c3 0c             	(bad)  
 3100bed:	04 04                	add    al,0x4
 3100bef:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100bf2:	00 00                	add    BYTE PTR [eax],al
 3100bf4:	e8 00 00 00 e9       	call   ec100bf9 <sKShellProgramName+0xe8fff939>
 3100bf9:	f9                   	stc    
 3100bfa:	ff                   	(bad)  
 3100bfb:	ff 8e 00 00 00 00    	dec    DWORD PTR [esi+0x0]
 3100c01:	41                   	inc    ecx
 3100c02:	0e                   	push   cs
 3100c03:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c09:	02 8a c5 0c 04 04    	add    cl,BYTE PTR [edx+0x4040cc5]
 3100c0f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100c12:	00 00                	add    BYTE PTR [eax],al
 3100c14:	08 01                	or     BYTE PTR [ecx],al
 3100c16:	00 00                	add    BYTE PTR [eax],al
 3100c18:	57                   	push   edi
 3100c19:	fa                   	cli    
 3100c1a:	ff                   	(bad)  
 3100c1b:	ff 58 00             	call   FWORD PTR [eax+0x0]
 3100c1e:	00 00                	add    BYTE PTR [eax],al
 3100c20:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100c23:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c29:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3100c2d:	04 04                	add    al,0x4
 3100c2f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100c32:	00 00                	add    BYTE PTR [eax],al
 3100c34:	28 01                	sub    BYTE PTR [ecx],al
 3100c36:	00 00                	add    BYTE PTR [eax],al
 3100c38:	8f                   	(bad)  
 3100c39:	fa                   	cli    
 3100c3a:	ff                   	(bad)  
 3100c3b:	ff                   	(bad)  
 3100c3c:	f8                   	clc    
 3100c3d:	01 00                	add    DWORD PTR [eax],eax
 3100c3f:	00 00                	add    BYTE PTR [eax],al
 3100c41:	41                   	inc    ecx
 3100c42:	0e                   	push   cs
 3100c43:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c49:	03 f4                	add    esi,esp
 3100c4b:	01 c5                	add    ebp,eax
 3100c4d:	0c 04                	or     al,0x4
 3100c4f:	04                   	.byte 0x4

Disassembly of section .interp:

03100c50 <.interp>:
 3100c50:	2f                   	das    
 3100c51:	6c                   	ins    BYTE PTR es:[edi],dx
 3100c52:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3100c59:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3100c60:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03100c64 <.dynsym>:
	...
 3100c74:	09 00                	or     DWORD PTR [eax],eax
	...
 3100c7e:	00 00                	add    BYTE PTR [eax],al
 3100c80:	12 00                	adc    al,BYTE PTR [eax]
 3100c82:	00 00                	add    BYTE PTR [eax],al
 3100c84:	10 00                	adc    BYTE PTR [eax],al
	...
 3100c8e:	00 00                	add    BYTE PTR [eax],al
 3100c90:	12 00                	adc    al,BYTE PTR [eax]
 3100c92:	00 00                	add    BYTE PTR [eax],al
 3100c94:	18 00                	sbb    BYTE PTR [eax],al
	...
 3100c9e:	00 00                	add    BYTE PTR [eax],al
 3100ca0:	12 00                	adc    al,BYTE PTR [eax]
 3100ca2:	00 00                	add    BYTE PTR [eax],al
 3100ca4:	1e                   	push   ds
	...
 3100cad:	00 00                	add    BYTE PTR [eax],al
 3100caf:	00 12                	add    BYTE PTR [edx],dl
 3100cb1:	00 00                	add    BYTE PTR [eax],al
 3100cb3:	00 23                	add    BYTE PTR [ebx],ah
	...
 3100cbd:	00 00                	add    BYTE PTR [eax],al
 3100cbf:	00 12                	add    BYTE PTR [edx],dl
 3100cc1:	00 00                	add    BYTE PTR [eax],al
 3100cc3:	00 28                	add    BYTE PTR [eax],ch
	...
 3100ccd:	00 00                	add    BYTE PTR [eax],al
 3100ccf:	00 12                	add    BYTE PTR [edx],dl
 3100cd1:	00 00                	add    BYTE PTR [eax],al
 3100cd3:	00 2f                	add    BYTE PTR [edi],ch
	...
 3100cdd:	00 00                	add    BYTE PTR [eax],al
 3100cdf:	00 12                	add    BYTE PTR [edx],dl
 3100ce1:	00 00                	add    BYTE PTR [eax],al
 3100ce3:	00 35 00 00 00 00    	add    BYTE PTR ds:0x0,dh
 3100ce9:	00 00                	add    BYTE PTR [eax],al
 3100ceb:	00 00                	add    BYTE PTR [eax],al
 3100ced:	00 00                	add    BYTE PTR [eax],al
 3100cef:	00 12                	add    BYTE PTR [edx],dl
 3100cf1:	00 00                	add    BYTE PTR [eax],al
 3100cf3:	00 3d 00 00 00 00    	add    BYTE PTR ds:0x0,bh
 3100cf9:	00 00                	add    BYTE PTR [eax],al
 3100cfb:	00 00                	add    BYTE PTR [eax],al
 3100cfd:	00 00                	add    BYTE PTR [eax],al
 3100cff:	00 12                	add    BYTE PTR [edx],dl
 3100d01:	00 00                	add    BYTE PTR [eax],al
 3100d03:	00 47 00             	add    BYTE PTR [edi+0x0],al
	...
 3100d0e:	00 00                	add    BYTE PTR [eax],al
 3100d10:	12 00                	adc    al,BYTE PTR [eax]
 3100d12:	00 00                	add    BYTE PTR [eax],al
 3100d14:	4f                   	dec    edi
	...
 3100d1d:	00 00                	add    BYTE PTR [eax],al
 3100d1f:	00 12                	add    BYTE PTR [edx],dl
 3100d21:	00 00                	add    BYTE PTR [eax],al
 3100d23:	00 56 00             	add    BYTE PTR [esi+0x0],dl
	...
 3100d2e:	00 00                	add    BYTE PTR [eax],al
 3100d30:	12 00                	adc    al,BYTE PTR [eax]
 3100d32:	00 00                	add    BYTE PTR [eax],al
 3100d34:	5b                   	pop    ebx
	...
 3100d3d:	00 00                	add    BYTE PTR [eax],al
 3100d3f:	00 12                	add    BYTE PTR [edx],dl
 3100d41:	00 00                	add    BYTE PTR [eax],al
 3100d43:	00 62 00             	add    BYTE PTR [edx+0x0],ah
	...
 3100d4e:	00 00                	add    BYTE PTR [eax],al
 3100d50:	12 00                	adc    al,BYTE PTR [eax]
	...

Disassembly of section .dynstr:

03100d54 <.dynstr>:
 3100d54:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3100d58:	63 2e                	arpl   WORD PTR [esi],bp
 3100d5a:	73 6f                	jae    3100dcb <kShell+0x704>
 3100d5c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3100d5f:	72 63                	jb     3100dc4 <kShell+0x6fd>
 3100d61:	70 79                	jo     3100ddc <kShell+0x715>
 3100d63:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 3100d66:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3100d6d:	72 
 3100d6e:	69 6e 74 00 67 65 74 	imul   ebp,DWORD PTR [esi+0x74],0x74656700
 3100d75:	73 00                	jae    3100d77 <kShell+0x6b0>
 3100d77:	70 75                	jo     3100dee <kShell+0x727>
 3100d79:	74 73                	je     3100dee <kShell+0x727>
 3100d7b:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 3100d7e:	6c                   	ins    BYTE PTR es:[edi],dx
 3100d7f:	6c                   	ins    BYTE PTR es:[edi],dx
 3100d80:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100d81:	63 00                	arpl   WORD PTR [eax],ax
 3100d83:	73 6c                	jae    3100df1 <kShell+0x72a>
 3100d85:	65                   	gs
 3100d86:	65                   	gs
 3100d87:	70 00                	jo     3100d89 <kShell+0x6c2>
 3100d89:	73 74                	jae    3100dff <kShell+0x738>
 3100d8b:	72 74                	jb     3100e01 <kShell+0x73a>
 3100d8d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100d8e:	75 6c                	jne    3100dfc <kShell+0x735>
 3100d90:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3100d94:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
 3100d97:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100d98:	69 74 00 73 74 72 6e 	imul   esi,DWORD PTR [eax+eax*1+0x73],0x636e7274
 3100d9f:	63 
 3100da0:	6d                   	ins    DWORD PTR es:[edi],dx
 3100da1:	70 00                	jo     3100da3 <kShell+0x6dc>
 3100da3:	6d                   	ins    DWORD PTR es:[edi],dx
 3100da4:	65                   	gs
 3100da5:	6d                   	ins    DWORD PTR es:[edi],dx
 3100da6:	73 65                	jae    3100e0d <kShell+0x746>
 3100da8:	74 00                	je     3100daa <kShell+0x6e3>
 3100daa:	70 75                	jo     3100e21 <kShell+0x75a>
 3100dac:	74 63                	je     3100e11 <kShell+0x74a>
 3100dae:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3100db1:	72 6c                	jb     3100e1f <kShell+0x758>
 3100db3:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3100db5:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 3100db8:	65 65 00 2f          	gs add BYTE PTR gs:[edi],ch
 3100dbc:	68 6f 6d 65 2f       	push   0x2f656d6f
 3100dc1:	79 6f                	jns    3100e32 <kShell+0x76b>
 3100dc3:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 3100dca:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100dcb:	73 2f                	jae    3100dfc <kShell+0x735>
 3100dcd:	6c                   	ins    BYTE PTR es:[edi],dx
 3100dce:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3100dd5:	4f                   	dec    edi
 3100dd6:	53                   	push   ebx
 3100dd7:	2f                   	das    
 3100dd8:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3100ddf:	62 
 3100de0:	75 67                	jne    3100e49 <kShell+0x782>
 3100de2:	2f                   	das    
 3100de3:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 3100de6:	73 73                	jae    3100e5b <kShell+0x794>
 3100de8:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3100ded:	78 00                	js     3100def <kShell+0x728>

Disassembly of section .hash:

03100df0 <.hash>:
 3100df0:	03 00                	add    eax,DWORD PTR [eax]
 3100df2:	00 00                	add    BYTE PTR [eax],al
 3100df4:	0f 00 00             	sldt   WORD PTR [eax]
 3100df7:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 3100dfa:	00 00                	add    BYTE PTR [eax],al
 3100dfc:	0e                   	push   cs
 3100dfd:	00 00                	add    BYTE PTR [eax],al
 3100dff:	00 0a                	add    BYTE PTR [edx],cl
	...
 3100e09:	00 00                	add    BYTE PTR [eax],al
 3100e0b:	00 01                	add    BYTE PTR [ecx],al
 3100e0d:	00 00                	add    BYTE PTR [eax],al
 3100e0f:	00 02                	add    BYTE PTR [edx],al
	...
 3100e19:	00 00                	add    BYTE PTR [eax],al
 3100e1b:	00 03                	add    BYTE PTR [ebx],al
 3100e1d:	00 00                	add    BYTE PTR [eax],al
 3100e1f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3100e22:	00 00                	add    BYTE PTR [eax],al
 3100e24:	06                   	push   es
 3100e25:	00 00                	add    BYTE PTR [eax],al
 3100e27:	00 07                	add    BYTE PTR [edi],al
 3100e29:	00 00                	add    BYTE PTR [eax],al
 3100e2b:	00 08                	add    BYTE PTR [eax],cl
 3100e2d:	00 00                	add    BYTE PTR [eax],al
 3100e2f:	00 09                	add    BYTE PTR [ecx],cl
 3100e31:	00 00                	add    BYTE PTR [eax],al
 3100e33:	00 0b                	add    BYTE PTR [ebx],cl
 3100e35:	00 00                	add    BYTE PTR [eax],al
 3100e37:	00 05 00 00 00 0d    	add    BYTE PTR ds:0xd000000,al
 3100e3d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03100e40 <.eh_frame>:
 3100e40:	14 00                	adc    al,0x0
 3100e42:	00 00                	add    BYTE PTR [eax],al
 3100e44:	00 00                	add    BYTE PTR [eax],al
 3100e46:	00 00                	add    BYTE PTR [eax],al
 3100e48:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3100e4b:	00 01                	add    BYTE PTR [ecx],al
 3100e4d:	7c 08                	jl     3100e57 <kShell+0x790>
 3100e4f:	01 1b                	add    DWORD PTR [ebx],ebx
 3100e51:	0c 04                	or     al,0x4
 3100e53:	04 88                	add    al,0x88
 3100e55:	01 00                	add    DWORD PTR [eax],eax
 3100e57:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3100e5a:	00 00                	add    BYTE PTR [eax],al
 3100e5c:	1c 00                	sbb    al,0x0
 3100e5e:	00 00                	add    BYTE PTR [eax],al
 3100e60:	60                   	pusha  
 3100e61:	fa                   	cli    
 3100e62:	ff                   	(bad)  
 3100e63:	ff f0                	push   eax
 3100e65:	00 00                	add    BYTE PTR [eax],al
 3100e67:	00 00                	add    BYTE PTR [eax],al
 3100e69:	0e                   	push   cs
 3100e6a:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3100e6d:	0c 4a                	or     al,0x4a
 3100e6f:	0f 0b                	ud2    
 3100e71:	74 04                	je     3100e77 <kShell+0x7b0>
 3100e73:	78 00                	js     3100e75 <kShell+0x7ae>
 3100e75:	3f                   	aas    
 3100e76:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3100e78:	2a 32                	sub    dh,BYTE PTR [edx]
 3100e7a:	24 22                	and    al,0x22
 3100e7c:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03100e80 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3100e80:	01 1b                	add    DWORD PTR [ebx],ebx
 3100e82:	03 3b                	add    edi,DWORD PTR [ebx]
 3100e84:	88 fc                	mov    ah,bh
 3100e86:	ff                   	(bad)  
 3100e87:	ff 09                	dec    DWORD PTR [ecx]
 3100e89:	00 00                	add    BYTE PTR [eax],al
 3100e8b:	00 80 f1 ff ff a4    	add    BYTE PTR [eax-0x5b00000f],al
 3100e91:	fc                   	cld    
 3100e92:	ff                   	(bad)  
 3100e93:	ff 2b                	jmp    FWORD PTR [ebx]
 3100e95:	f2 ff                	repnz (bad) 
 3100e97:	ff c8                	dec    eax
 3100e99:	fc                   	cld    
 3100e9a:	ff                   	(bad)  
 3100e9b:	ff 75 f3             	push   DWORD PTR [ebp-0xd]
 3100e9e:	ff                   	(bad)  
 3100e9f:	ff ec                	jmp    <internal disassembler error>
 3100ea1:	fc                   	cld    
 3100ea2:	ff                   	(bad)  
 3100ea3:	ff de                	call   <internal disassembler error>
 3100ea5:	f3 ff                	repz (bad) 
 3100ea7:	ff 0c fd ff ff 6c f6 	dec    DWORD PTR [edi*8-0x9930001]
 3100eae:	ff                   	(bad)  
 3100eaf:	ff 2c fd ff ff c4 f6 	jmp    FWORD PTR [edi*8-0x93b0001]
 3100eb6:	ff                   	(bad)  
 3100eb7:	ff 4c fd ff          	dec    DWORD PTR [ebp+edi*8-0x1]
 3100ebb:	ff 61 f7             	jmp    DWORD PTR [ecx-0x9]
 3100ebe:	ff                   	(bad)  
 3100ebf:	ff 70 fd             	push   DWORD PTR [eax-0x3]
 3100ec2:	ff                   	(bad)  
 3100ec3:	ff ef                	jmp    <internal disassembler error>
 3100ec5:	f7 ff                	idiv   edi
 3100ec7:	ff 90 fd ff ff 47    	call   DWORD PTR [eax+0x47fffffd]
 3100ecd:	f8                   	clc    
 3100ece:	ff                   	(bad)  
 3100ecf:	ff                   	.byte 0xff
 3100ed0:	b0 fd                	mov    al,0xfd
 3100ed2:	ff                   	(bad)  
 3100ed3:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03100ed4 <.rel.dyn>:
 3100ed4:	3c 10                	cmp    al,0x10
 3100ed6:	10 03                	adc    BYTE PTR [ebx],al
 3100ed8:	07                   	pop    es
 3100ed9:	01 00                	add    DWORD PTR [eax],eax
 3100edb:	00 40 10             	add    BYTE PTR [eax+0x10],al
 3100ede:	10 03                	adc    BYTE PTR [ebx],al
 3100ee0:	07                   	pop    es
 3100ee1:	02 00                	add    al,BYTE PTR [eax]
 3100ee3:	00 44 10 10          	add    BYTE PTR [eax+edx*1+0x10],al
 3100ee7:	03 07                	add    eax,DWORD PTR [edi]
 3100ee9:	03 00                	add    eax,DWORD PTR [eax]
 3100eeb:	00 48 10             	add    BYTE PTR [eax+0x10],cl
 3100eee:	10 03                	adc    BYTE PTR [ebx],al
 3100ef0:	07                   	pop    es
 3100ef1:	04 00                	add    al,0x0
 3100ef3:	00 4c 10 10          	add    BYTE PTR [eax+edx*1+0x10],cl
 3100ef7:	03 07                	add    eax,DWORD PTR [edi]
 3100ef9:	05 00 00 50 10       	add    eax,0x10500000
 3100efe:	10 03                	adc    BYTE PTR [ebx],al
 3100f00:	07                   	pop    es
 3100f01:	06                   	push   es
 3100f02:	00 00                	add    BYTE PTR [eax],al
 3100f04:	54                   	push   esp
 3100f05:	10 10                	adc    BYTE PTR [eax],dl
 3100f07:	03 07                	add    eax,DWORD PTR [edi]
 3100f09:	07                   	pop    es
 3100f0a:	00 00                	add    BYTE PTR [eax],al
 3100f0c:	58                   	pop    eax
 3100f0d:	10 10                	adc    BYTE PTR [eax],dl
 3100f0f:	03 07                	add    eax,DWORD PTR [edi]
 3100f11:	08 00                	or     BYTE PTR [eax],al
 3100f13:	00 5c 10 10          	add    BYTE PTR [eax+edx*1+0x10],bl
 3100f17:	03 07                	add    eax,DWORD PTR [edi]
 3100f19:	09 00                	or     DWORD PTR [eax],eax
 3100f1b:	00 60 10             	add    BYTE PTR [eax+0x10],ah
 3100f1e:	10 03                	adc    BYTE PTR [ebx],al
 3100f20:	07                   	pop    es
 3100f21:	0a 00                	or     al,BYTE PTR [eax]
 3100f23:	00 64 10 10          	add    BYTE PTR [eax+edx*1+0x10],ah
 3100f27:	03 07                	add    eax,DWORD PTR [edi]
 3100f29:	0b 00                	or     eax,DWORD PTR [eax]
 3100f2b:	00 68 10             	add    BYTE PTR [eax+0x10],ch
 3100f2e:	10 03                	adc    BYTE PTR [ebx],al
 3100f30:	07                   	pop    es
 3100f31:	0c 00                	or     al,0x0
 3100f33:	00 6c 10 10          	add    BYTE PTR [eax+edx*1+0x10],ch
 3100f37:	03 07                	add    eax,DWORD PTR [edi]
 3100f39:	0d 00 00 70 10       	or     eax,0x10700000
 3100f3e:	10 03                	adc    BYTE PTR [ebx],al
 3100f40:	07                   	pop    es
 3100f41:	0e                   	push   cs
	...

Disassembly of section .data:

03100f60 <cmds>:
 3100f60:	b0 09                	mov    al,0x9
 3100f62:	10 03                	adc    BYTE PTR [ebx],al
 3100f64:	b5 09                	mov    ch,0x9
 3100f66:	10 03                	adc    BYTE PTR [ebx],al
 3100f68:	ec                   	in     al,dx
 3100f69:	04 10                	add    al,0x10
 3100f6b:	03 00                	add    eax,DWORD PTR [eax]
 3100f6d:	00 00                	add    BYTE PTR [eax],al
 3100f6f:	00 d1                	add    cl,dl
 3100f71:	09 10                	or     DWORD PTR [eax],edx
 3100f73:	03 d6                	add    edx,esi
 3100f75:	09 10                	or     DWORD PTR [eax],edx
 3100f77:	03 44 05 10          	add    eax,DWORD PTR [ebp+eax*1+0x10]
 3100f7b:	03 01                	add    eax,DWORD PTR [ecx]
 3100f7d:	00 00                	add    BYTE PTR [eax],al
 3100f7f:	00 e8                	add    al,ch
 3100f81:	09 10                	or     DWORD PTR [eax],edx
 3100f83:	03 ed                	add    ebp,ebp
 3100f85:	09 10                	or     DWORD PTR [eax],edx
 3100f87:	03 6f 06             	add    ebp,DWORD PTR [edi+0x6]
 3100f8a:	10 03                	adc    BYTE PTR [ebx],al
 3100f8c:	01 00                	add    DWORD PTR [eax],eax
 3100f8e:	00 00                	add    BYTE PTR [eax],al
 3100f90:	f9                   	stc    
 3100f91:	09 10                	or     DWORD PTR [eax],edx
 3100f93:	03 ff                	add    edi,edi
 3100f95:	09 10                	or     DWORD PTR [eax],edx
 3100f97:	03 e1                	add    esp,ecx
 3100f99:	05 10 03 01 00       	add    eax,0x10310
	...

Disassembly of section .dynamic:

03100fa0 <_DYNAMIC>:
 3100fa0:	01 00                	add    DWORD PTR [eax],eax
 3100fa2:	00 00                	add    BYTE PTR [eax],al
 3100fa4:	01 00                	add    DWORD PTR [eax],eax
 3100fa6:	00 00                	add    BYTE PTR [eax],al
 3100fa8:	0f 00 00             	sldt   WORD PTR [eax]
 3100fab:	00 67 00             	add    BYTE PTR [edi+0x0],ah
 3100fae:	00 00                	add    BYTE PTR [eax],al
 3100fb0:	04 00                	add    al,0x0
 3100fb2:	00 00                	add    BYTE PTR [eax],al
 3100fb4:	f0 0d 10 03 05 00    	lock or eax,0x50310
 3100fba:	00 00                	add    BYTE PTR [eax],al
 3100fbc:	54                   	push   esp
 3100fbd:	0d 10 03 06 00       	or     eax,0x60310
 3100fc2:	00 00                	add    BYTE PTR [eax],al
 3100fc4:	64                   	fs
 3100fc5:	0c 10                	or     al,0x10
 3100fc7:	03 0a                	add    ecx,DWORD PTR [edx]
 3100fc9:	00 00                	add    BYTE PTR [eax],al
 3100fcb:	00 9b 00 00 00 0b    	add    BYTE PTR [ebx+0xb000000],bl
 3100fd1:	00 00                	add    BYTE PTR [eax],al
 3100fd3:	00 10                	add    BYTE PTR [eax],dl
 3100fd5:	00 00                	add    BYTE PTR [eax],al
 3100fd7:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 3100fdd:	00 00                	add    BYTE PTR [eax],al
 3100fdf:	00 03                	add    BYTE PTR [ebx],al
 3100fe1:	00 00                	add    BYTE PTR [eax],al
 3100fe3:	00 30                	add    BYTE PTR [eax],dh
 3100fe5:	10 10                	adc    BYTE PTR [eax],dl
 3100fe7:	03 02                	add    eax,DWORD PTR [edx]
 3100fe9:	00 00                	add    BYTE PTR [eax],al
 3100feb:	00 70 00             	add    BYTE PTR [eax+0x0],dh
 3100fee:	00 00                	add    BYTE PTR [eax],al
 3100ff0:	14 00                	adc    al,0x0
 3100ff2:	00 00                	add    BYTE PTR [eax],al
 3100ff4:	11 00                	adc    DWORD PTR [eax],eax
 3100ff6:	00 00                	add    BYTE PTR [eax],al
 3100ff8:	17                   	pop    ss
 3100ff9:	00 00                	add    BYTE PTR [eax],al
 3100ffb:	00 d4                	add    ah,dl
 3100ffd:	0e                   	push   cs
 3100ffe:	10 03                	adc    BYTE PTR [ebx],al
	...

Disassembly of section .got.plt:

03101030 <_GLOBAL_OFFSET_TABLE_>:
 3101030:	a0 0f 10 03 00       	mov    al,ds:0x3100f
 3101035:	00 00                	add    BYTE PTR [eax],al
 3101037:	00 00                	add    BYTE PTR [eax],al
 3101039:	00 00                	add    BYTE PTR [eax],al
 310103b:	00 d6                	add    dh,dl
 310103d:	08 10                	or     BYTE PTR [eax],dl
 310103f:	03 e6                	add    esp,esi
 3101041:	08 10                	or     BYTE PTR [eax],dl
 3101043:	03 f6                	add    esi,esi
 3101045:	08 10                	or     BYTE PTR [eax],dl
 3101047:	03 06                	add    eax,DWORD PTR [esi]
 3101049:	09 10                	or     DWORD PTR [eax],edx
 310104b:	03 16                	add    edx,DWORD PTR [esi]
 310104d:	09 10                	or     DWORD PTR [eax],edx
 310104f:	03 26                	add    esp,DWORD PTR [esi]
 3101051:	09 10                	or     DWORD PTR [eax],edx
 3101053:	03 36                	add    esi,DWORD PTR [esi]
 3101055:	09 10                	or     DWORD PTR [eax],edx
 3101057:	03 46 09             	add    eax,DWORD PTR [esi+0x9]
 310105a:	10 03                	adc    BYTE PTR [ebx],al
 310105c:	56                   	push   esi
 310105d:	09 10                	or     DWORD PTR [eax],edx
 310105f:	03 66 09             	add    esp,DWORD PTR [esi+0x9]
 3101062:	10 03                	adc    BYTE PTR [ebx],al
 3101064:	76 09                	jbe    310106f <_GLOBAL_OFFSET_TABLE_+0x3f>
 3101066:	10 03                	adc    BYTE PTR [ebx],al
 3101068:	86 09                	xchg   BYTE PTR [ecx],cl
 310106a:	10 03                	adc    BYTE PTR [ebx],al
 310106c:	96                   	xchg   esi,eax
 310106d:	09 10                	or     DWORD PTR [eax],edx
 310106f:	03                   	.byte 0x3
 3101070:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 3101071:	09 10                	or     DWORD PTR [eax],edx
 3101073:	03                   	.byte 0x3

Disassembly of section .bss:

03101080 <timeToExit>:
 3101080:	00 00                	add    BYTE PTR [eax],al
	...

03101084 <exitCode>:
	...

031010a0 <sExecutingProgram>:
	...

031012a0 <command_function_p>:
 31012a0:	00 00                	add    BYTE PTR [eax],al
	...

031012a4 <cpuid_extended_feature_bits>:
 31012a4:	00 00                	add    BYTE PTR [eax],al
	...

031012a8 <heapEnd>:
 31012a8:	00 00                	add    BYTE PTR [eax],al
	...

031012ac <heapBase>:
 31012ac:	00 00                	add    BYTE PTR [eax],al
	...

031012b0 <heapCurr>:
 31012b0:	00 00                	add    BYTE PTR [eax],al
	...

031012b4 <command_function>:
 31012b4:	00 00                	add    BYTE PTR [eax],al
	...

031012b8 <cpuid_procinfo>:
	...

031012c0 <sKShellProgramName>:
 31012c0:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	e4 06                	in     al,0x6
   2:	00 00                	add    BYTE PTR [eax],al
   4:	04 00                	add    al,0x0
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	9a 00 00 00 0c 63 02 	call   0x263:0xc000000
  13:	00 00                	add    BYTE PTR [eax],al
  15:	27                   	daa    
  16:	01 00                	add    DWORD PTR [eax],eax
  18:	00 00                	add    BYTE PTR [eax],al
  1a:	00 10                	add    BYTE PTR [eax],dl
  1c:	03 bf 08 00 00 00    	add    edi,DWORD PTR [edi+0x8]
  22:	00 00                	add    BYTE PTR [eax],al
  24:	00 02                	add    BYTE PTR [edx],al
  26:	01 08                	add    DWORD PTR [eax],ecx
  28:	e2 01                	loop   2b <execInternalCommand-0x30fffd5>
  2a:	00 00                	add    BYTE PTR [eax],al
  2c:	02 02                	add    al,BYTE PTR [edx]
  2e:	07                   	pop    es
  2f:	2b 02                	sub    eax,DWORD PTR [edx]
  31:	00 00                	add    BYTE PTR [eax],al
  33:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
  36:	fa                   	cli    
  37:	01 00                	add    DWORD PTR [eax],eax
  39:	00 02                	add    BYTE PTR [edx],al
  3b:	04 07                	add    al,0x7
  3d:	f5                   	cmc    
  3e:	01 00                	add    DWORD PTR [eax],eax
  40:	00 02                	add    BYTE PTR [edx],al
  42:	01 06                	add    DWORD PTR [esi],eax
  44:	e4 01                	in     al,0x1
  46:	00 00                	add    BYTE PTR [eax],al
  48:	02 02                	add    al,BYTE PTR [edx]
  4a:	05 3e 00 00 00       	add    eax,0x3e
  4f:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  56:	02 08                	add    cl,BYTE PTR [eax]
  58:	05 74 01 00 00       	add    eax,0x174
  5d:	02 08                	add    cl,BYTE PTR [eax]
  5f:	07                   	pop    es
  60:	f0 01 00             	lock add DWORD PTR [eax],eax
  63:	00 02                	add    BYTE PTR [edx],al
  65:	04 05                	add    al,0x5
  67:	79 01                	jns    6a <execInternalCommand-0x30fff96>
  69:	00 00                	add    BYTE PTR [eax],al
  6b:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
  6e:	5f                   	pop    edi
  6f:	00 00                	add    BYTE PTR [eax],al
  71:	00 04 04             	add    BYTE PTR [esp+eax*1],al
  74:	05 04 7a 00 00       	add    eax,0x7a04
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	01 06                	add    DWORD PTR [esi],eax
  7d:	eb 01                	jmp    80 <execInternalCommand-0x30fff80>
  7f:	00 00                	add    BYTE PTR [eax],al
  81:	06                   	push   es
  82:	40                   	inc    eax
  83:	01 00                	add    DWORD PTR [eax],eax
  85:	00 02                	add    BYTE PTR [edx],al
  87:	2e                   	cs
  88:	25 00 00 00 06       	and    eax,0x6000000
  8d:	0f 02 00             	lar    eax,WORD PTR [eax]
  90:	00 02                	add    BYTE PTR [edx],al
  92:	34 33                	xor    al,0x33
  94:	00 00                	add    BYTE PTR [eax],al
  96:	00 02                	add    BYTE PTR [edx],al
  98:	01 02                	add    DWORD PTR [edx],eax
  9a:	5d                   	pop    ebp
  9b:	02 00                	add    al,BYTE PTR [eax]
  9d:	00 07                	add    BYTE PTR [edi],al
  9f:	05 03 58 1f 01       	add    eax,0x11f5803
  a4:	00 00                	add    BYTE PTR [eax],al
  a6:	08 24 03             	or     BYTE PTR [ebx+eax*1],ah
  a9:	00 00                	add    BYTE PTR [eax],al
  ab:	03 59 81             	add    ebx,DWORD PTR [ecx-0x7f]
  ae:	00 00                	add    BYTE PTR [eax],al
  b0:	00 01                	add    BYTE PTR [ecx],al
  b2:	04 04                	add    al,0x4
  b4:	00 08                	add    BYTE PTR [eax],cl
  b6:	48                   	dec    eax
  b7:	02 00                	add    al,BYTE PTR [eax]
  b9:	00 03                	add    BYTE PTR [ebx],al
  bb:	5a                   	pop    edx
  bc:	81 00 00 00 01 04    	add    DWORD PTR [eax],0x4010000
  c2:	00 00                	add    BYTE PTR [eax],al
  c4:	08 08                	or     BYTE PTR [eax],cl
  c6:	02 00                	add    al,BYTE PTR [eax]
  c8:	00 03                	add    BYTE PTR [ebx],al
  ca:	5b                   	pop    ebx
  cb:	81 00 00 00 01 04    	add    DWORD PTR [eax],0x4010000
  d1:	04 01                	add    al,0x1
  d3:	08 63 00             	or     BYTE PTR [ebx+0x0],ah
  d6:	00 00                	add    BYTE PTR [eax],al
  d8:	03 5c 81 00          	add    ebx,DWORD PTR [ecx+eax*4+0x0]
  dc:	00 00                	add    BYTE PTR [eax],al
  de:	01 02                	add    DWORD PTR [edx],eax
  e0:	02 01                	add    al,BYTE PTR [ecx]
  e2:	08 9d 01 00 00 03    	or     BYTE PTR [ebp+0x3000001],bl
  e8:	5d                   	pop    ebp
  e9:	81 00 00 00 01 02    	add    DWORD PTR [eax],0x2010000
  ef:	00 01                	add    BYTE PTR [ecx],al
  f1:	08 47 02             	or     BYTE PTR [edi+0x2],al
  f4:	00 00                	add    BYTE PTR [eax],al
  f6:	03 5e 81             	add    ebx,DWORD PTR [esi-0x7f]
  f9:	00 00                	add    BYTE PTR [eax],al
  fb:	00 01                	add    BYTE PTR [ecx],al
  fd:	04 04                	add    al,0x4
  ff:	02 08                	add    cl,BYTE PTR [eax]
 101:	07                   	pop    es
 102:	02 00                	add    al,BYTE PTR [eax]
 104:	00 03                	add    BYTE PTR [ebx],al
 106:	5f                   	pop    edi
 107:	81 00 00 00 01 08    	add    DWORD PTR [eax],0x8010000
 10d:	00 03                	add    BYTE PTR [ebx],al
 10f:	08 a2 01 00 00 03    	or     BYTE PTR [edx+0x3000001],ah
 115:	60                   	pusha  
 116:	81 00 00 00 01 04    	add    DWORD PTR [eax],0x4010000
 11c:	04 04                	add    al,0x4
 11e:	00 09                	add    BYTE PTR [ecx],cl
 120:	08 03                	or     BYTE PTR [ebx],al
 122:	56                   	push   esi
 123:	38 01                	cmp    BYTE PTR [ecx],al
 125:	00 00                	add    BYTE PTR [eax],al
 127:	0a 9e 00 00 00 0b    	or     bl,BYTE PTR [esi+0xb000000]
 12d:	72 65                	jb     194 <execInternalCommand-0x30ffe6c>
 12f:	67 00 03             	add    BYTE PTR [bp+di],al
 132:	62 8c 00 00 00 00 07 	bound  ecx,QWORD PTR [eax+eax*1+0x7000000]
 139:	04 03                	add    al,0x3
 13b:	db 6e 01             	fld    TBYTE PTR [esi+0x1]
 13e:	00 00                	add    BYTE PTR [eax],al
 140:	08 bd 02 00 00 03    	or     BYTE PTR [ebp+0x3000002],bh
 146:	dc 81 00 00 00 01    	fadd   QWORD PTR [ecx+0x1000000]
 14c:	01 07                	add    DWORD PTR [edi],eax
 14e:	00 08                	add    BYTE PTR [eax],cl
 150:	7a 02                	jp     154 <execInternalCommand-0x30ffeac>
 152:	00 00                	add    BYTE PTR [eax],al
 154:	03 dd                	add    ebx,ebp
 156:	81 00 00 00 01 01    	add    DWORD PTR [eax],0x1010000
 15c:	06                   	push   es
 15d:	00 08                	add    BYTE PTR [eax],cl
 15f:	ff 02                	inc    DWORD PTR [edx]
 161:	00 00                	add    BYTE PTR [eax],al
 163:	03 de                	add    ebx,esi
 165:	8c 00                	mov    WORD PTR [eax],es
 167:	00 00                	add    BYTE PTR [eax],al
 169:	04 1e                	add    al,0x1e
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
 18e:	00 0c dd 01 00 00 04 	add    BYTE PTR [ebx*8+0x4000001],cl
 195:	14 74                	adc    al,0x74
 197:	00 00                	add    BYTE PTR [eax],al
 199:	00 00                	add    BYTE PTR [eax],al
 19b:	0c 2d                	or     al,0x2d
 19d:	00 00                	add    BYTE PTR [eax],al
 19f:	00 04 15 74 00 00 00 	add    BYTE PTR [edx*1+0x74],al
 1a6:	04 0c                	add    al,0xc
 1a8:	60                   	pusha  
 1a9:	01 00                	add    DWORD PTR [eax],eax
 1ab:	00 04 16             	add    BYTE PTR [esi+edx*1],al
 1ae:	72 00                	jb     1b0 <execInternalCommand-0x30ffe50>
 1b0:	00 00                	add    BYTE PTR [eax],al
 1b2:	08 0c 69             	or     BYTE PTR [ecx+ebp*2],cl
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
 1cb:	0d f0 00 00 00       	or     eax,0xf0
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
 1e1:	fb                   	sti    
 1e2:	00 00                	add    BYTE PTR [eax],al
 1e4:	00 01                	add    BYTE PTR [ecx],al
 1e6:	17                   	pop    ss
 1e7:	74 00                	je     1e9 <execInternalCommand-0x30ffe17>
 1e9:	00 00                	add    BYTE PTR [eax],al
 1eb:	02 91 00 0f 69 00    	add    dl,BYTE PTR [ecx+0x690f00]
 1f1:	01 19                	add    DWORD PTR [ecx],ebx
 1f3:	4f                   	dec    edi
 1f4:	00 00                	add    BYTE PTR [eax],al
 1f6:	00 02                	add    BYTE PTR [edx],al
 1f8:	91                   	xchg   ecx,eax
 1f9:	6c                   	ins    BYTE PTR es:[edi],dx
 1fa:	10 c9                	adc    cl,cl
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
 222:	b5 02                	mov    ch,0x2
 224:	00 00                	add    BYTE PTR [eax],al
 226:	01 2e                	add    DWORD PTR [esi],ebp
 228:	74 00                	je     22a <execInternalCommand-0x30ffdd6>
 22a:	00 00                	add    BYTE PTR [eax],al
 22c:	02 91 00 0e d6 01    	add    dl,BYTE PTR [ecx+0x1d60e00]
 232:	00 00                	add    BYTE PTR [eax],al
 234:	01 2e                	add    DWORD PTR [esi],ebp
 236:	a9 02 00 00 02       	test   eax,0x2000002
 23b:	91                   	xchg   ecx,eax
 23c:	04 0e                	add    al,0xe
 23e:	85 02                	test   DWORD PTR [edx],eax
 240:	00 00                	add    BYTE PTR [eax],al
 242:	01 2e                	add    DWORD PTR [esi],ebp
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
 2b0:	c9                   	leave  
 2b1:	02 00                	add    al,BYTE PTR [eax]
 2b3:	00 01                	add    BYTE PTR [ecx],al
 2b5:	53                   	push   ebx
 2b6:	4f                   	dec    edi
 2b7:	00 00                	add    BYTE PTR [eax],al
 2b9:	00 f5                	add    ch,dh
 2bb:	01 10                	add    DWORD PTR [eax],edx
 2bd:	03 69 00             	add    ebp,DWORD PTR [ecx+0x0]
 2c0:	00 00                	add    BYTE PTR [eax],al
 2c2:	01 9c f1 02 00 00 0e 	add    DWORD PTR [ecx+esi*8+0xe000002],ebx
 2c9:	29 03                	sub    DWORD PTR [ebx],eax
 2cb:	00 00                	add    BYTE PTR [eax],al
 2cd:	01 53 74             	add    DWORD PTR [ebx+0x74],edx
 2d0:	00 00                	add    BYTE PTR [eax],al
 2d2:	00 02                	add    BYTE PTR [edx],al
 2d4:	91                   	xchg   ecx,eax
 2d5:	00 0f                	add    BYTE PTR [edi],cl
 2d7:	69 00 01 55 33 00    	imul   eax,DWORD PTR [eax],0x335501
 2dd:	00 00                	add    BYTE PTR [eax],al
 2df:	02 91 6c 0f 72 65    	add    dl,BYTE PTR [ecx+0x65720f6c]
 2e5:	74 00                	je     2e7 <execInternalCommand-0x30ffd19>
 2e7:	01 56 4f             	add    DWORD PTR [esi+0x4f],edx
 2ea:	00 00                	add    BYTE PTR [eax],al
 2ec:	00 02                	add    BYTE PTR [edx],al
 2ee:	91                   	xchg   ecx,eax
 2ef:	68 00 12 18 02       	push   0x2181200
 2f4:	00 00                	add    BYTE PTR [eax],al
 2f6:	01 69 af             	add    DWORD PTR [ecx-0x51],ebp
 2f9:	03 00                	add    eax,DWORD PTR [eax]
 2fb:	00 5e 02             	add    BYTE PTR [esi+0x2],bl
 2fe:	10 03                	adc    BYTE PTR [ebx],al
 300:	8e 02                	mov    es,WORD PTR [edx]
 302:	00 00                	add    BYTE PTR [eax],al
 304:	01 9c af 03 00 00 0e 	add    DWORD PTR [edi+ebp*4+0xe000003],ebx
 30b:	59                   	pop    ecx
 30c:	00 00                	add    BYTE PTR [eax],al
 30e:	00 01                	add    BYTE PTR [ecx],al
 310:	69 b5 03 00 00 02 91 	imul   esi,DWORD PTR [ebp+0x2000003],0x610f0091
 317:	00 0f 61 
 31a:	72 67                	jb     383 <execInternalCommand-0x30ffc7d>
 31c:	00 01                	add    BYTE PTR [ecx],al
 31e:	6b 74 00 00 00       	imul   esi,DWORD PTR [eax+eax*1+0x0],0x0
 323:	02 91 6c 13 d5 02    	add    dl,BYTE PTR [ecx+0x2d5136c]
 329:	00 00                	add    BYTE PTR [eax],al
 32b:	01 6c 74 00          	add    DWORD PTR [esp+esi*2+0x0],ebp
 32f:	00 00                	add    BYTE PTR [eax],al
 331:	02 91 68 13 83 01    	add    dl,BYTE PTR [ecx+0x1831368]
 337:	00 00                	add    BYTE PTR [eax],al
 339:	01 6d 4f             	add    DWORD PTR [ebp+0x4f],ebp
 33c:	00 00                	add    BYTE PTR [eax],al
 33e:	00 02                	add    BYTE PTR [edx],al
 340:	91                   	xchg   ecx,eax
 341:	64 13 51 01          	adc    edx,DWORD PTR fs:[ecx+0x1]
 345:	00 00                	add    BYTE PTR [eax],al
 347:	01 6e 4f             	add    DWORD PTR [esi+0x4f],ebp
 34a:	00 00                	add    BYTE PTR [eax],al
 34c:	00 02                	add    BYTE PTR [edx],al
 34e:	91                   	xchg   ecx,eax
 34f:	60                   	pusha  
 350:	13 82 01 00 00 01    	adc    eax,DWORD PTR [edx+0x1000001]
 356:	6f                   	outs   dx,DWORD PTR ds:[esi]
 357:	4f                   	dec    edi
 358:	00 00                	add    BYTE PTR [eax],al
 35a:	00 02                	add    BYTE PTR [edx],al
 35c:	91                   	xchg   ecx,eax
 35d:	5c                   	pop    esp
 35e:	13 bf 01 00 00 01    	adc    edi,DWORD PTR [edi+0x1000001]
 364:	70 4f                	jo     3b5 <execInternalCommand-0x30ffc4b>
 366:	00 00                	add    BYTE PTR [eax],al
 368:	00 02                	add    BYTE PTR [edx],al
 36a:	91                   	xchg   ecx,eax
 36b:	58                   	pop    eax
 36c:	13 bc 01 00 00 01 71 	adc    edi,DWORD PTR [ecx+eax*1+0x71010000]
 373:	4f                   	dec    edi
 374:	00 00                	add    BYTE PTR [eax],al
 376:	00 02                	add    BYTE PTR [edx],al
 378:	91                   	xchg   ecx,eax
 379:	54                   	push   esp
 37a:	13 1d 02 00 00 01    	adc    ebx,DWORD PTR ds:0x1000002
 380:	72 af                	jb     331 <execInternalCommand-0x30ffccf>
 382:	03 00                	add    eax,DWORD PTR [eax]
 384:	00 02                	add    BYTE PTR [edx],al
 386:	91                   	xchg   ecx,eax
 387:	50                   	push   eax
 388:	13 8a 02 00 00 01    	adc    ecx,DWORD PTR [edx+0x1000002]
 38e:	73 af                	jae    33f <execInternalCommand-0x30ffcc1>
 390:	03 00                	add    eax,DWORD PTR [eax]
 392:	00 02                	add    BYTE PTR [edx],al
 394:	91                   	xchg   ecx,eax
 395:	4c                   	dec    esp
 396:	14 1f                	adc    al,0x1f
 398:	04 10                	add    al,0x10
 39a:	03 9e 00 00 00 13    	add    ebx,DWORD PTR [esi+0x13000000]
 3a0:	39 00                	cmp    DWORD PTR [eax],eax
 3a2:	00 00                	add    BYTE PTR [eax],al
 3a4:	01 cc                	add    esp,ecx
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
 3c6:	e2 ec                	loop   3b4 <execInternalCommand-0x30ffc4c>
 3c8:	04 10                	add    al,0x10
 3ca:	03 58 00             	add    ebx,DWORD PTR [eax+0x0]
 3cd:	00 00                	add    BYTE PTR [eax],al
 3cf:	01 9c ee 03 00 00 14 	add    DWORD PTR [esi+ebp*8+0x14000003],ebx
 3d6:	02 05 10 03 3f 00    	add    al,BYTE PTR ds:0x3f0310
 3dc:	00 00                	add    BYTE PTR [eax],al
 3de:	0f 63 6e 74          	packsswb mm5,QWORD PTR [esi+0x74]
 3e2:	00 01                	add    BYTE PTR [ecx],al
 3e4:	e5 33                	in     eax,0x33
 3e6:	00 00                	add    BYTE PTR [eax],al
 3e8:	00 02                	add    BYTE PTR [edx],al
 3ea:	91                   	xchg   ecx,eax
 3eb:	6c                   	ins    BYTE PTR es:[edi],dx
 3ec:	00 00                	add    BYTE PTR [eax],al
 3ee:	0d 74 02 00 00       	or     eax,0x274
 3f3:	01 e9                	add    ecx,ebp
 3f5:	44                   	inc    esp
 3f6:	05 10 03 9d 00       	add    eax,0x9d0310
 3fb:	00 00                	add    BYTE PTR [eax],al
 3fd:	01 9c 3d 04 00 00 0e 	add    DWORD PTR [ebp+edi*1+0xe000004],ebx
 404:	92                   	xchg   edx,eax
 405:	00 00                	add    BYTE PTR [eax],al
 407:	00 01                	add    BYTE PTR [ecx],al
 409:	e9 74 00 00 00       	jmp    482 <execInternalCommand-0x30ffb7e>
 40e:	02 91 00 13 d6 01    	add    dl,BYTE PTR [ecx+0x1d61300]
 414:	00 00                	add    BYTE PTR [eax],al
 416:	01 eb                	add    ebx,ebp
 418:	3d 04 00 00 03       	cmp    eax,0x3000004
 41d:	91                   	xchg   ecx,eax
 41e:	e8 57 13 69 01       	call   169177a <execInternalCommand-0x1a6e886>
 423:	00 00                	add    BYTE PTR [eax],al
 425:	01 ec                	add    esp,ebp
 427:	4f                   	dec    edi
 428:	00 00                	add    BYTE PTR [eax],al
 42a:	00 02                	add    BYTE PTR [edx],al
 42c:	91                   	xchg   ecx,eax
 42d:	6c                   	ins    BYTE PTR es:[edi],dx
 42e:	0f 70 69 64 00       	pshufw mm5,QWORD PTR [ecx+0x64],0x0
 433:	01 ed                	add    ebp,ebp
 435:	8c 00                	mov    WORD PTR [eax],es
 437:	00 00                	add    BYTE PTR [eax],al
 439:	02 91 68 00 15 7a    	add    dl,BYTE PTR [ecx+0x7a150068]
 43f:	00 00                	add    BYTE PTR [eax],al
 441:	00 54 04 00          	add    BYTE PTR [esp+eax*1+0x0],dl
 445:	00 19                	add    BYTE PTR [ecx],bl
 447:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 44a:	00 09                	add    BYTE PTR [ecx],cl
 44c:	16                   	push   ss
 44d:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 450:	00 ff                	add    bh,bh
 452:	01 00                	add    DWORD PTR [eax],eax
 454:	0d dd 02 00 00       	or     eax,0x2dd
 459:	01 fe                	add    esi,edi
 45b:	e1 05                	loope  462 <execInternalCommand-0x30ffb9e>
 45d:	10 03                	adc    BYTE PTR [ebx],al
 45f:	8e 00                	mov    es,WORD PTR [eax]
 461:	00 00                	add    BYTE PTR [eax],al
 463:	01 9c 97 04 00 00 0e 	add    DWORD PTR [edi+edx*4+0xe000004],ebx
 46a:	92                   	xchg   edx,eax
 46b:	00 00                	add    BYTE PTR [eax],al
 46d:	00 01                	add    BYTE PTR [ecx],al
 46f:	fe                   	(bad)  
 470:	74 00                	je     472 <execInternalCommand-0x30ffb8e>
 472:	00 00                	add    BYTE PTR [eax],al
 474:	02 91 00 1a d6 01    	add    dl,BYTE PTR [ecx+0x1d61a00]
 47a:	00 00                	add    BYTE PTR [eax],al
 47c:	01 00                	add    DWORD PTR [eax],eax
 47e:	01 3d 04 00 00 03    	add    DWORD PTR ds:0x3000004,edi
 484:	91                   	xchg   ecx,eax
 485:	ec                   	in     al,dx
 486:	57                   	push   edi
 487:	1a 69 01             	sbb    ch,BYTE PTR [ecx+0x1]
 48a:	00 00                	add    BYTE PTR [eax],al
 48c:	01 01                	add    DWORD PTR [ecx],eax
 48e:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 491:	00 00                	add    BYTE PTR [eax],al
 493:	02 91 6c 00 1b 27    	add    dl,BYTE PTR [ecx+0x271b006c]
 499:	00 00                	add    BYTE PTR [eax],al
 49b:	00 01                	add    BYTE PTR [ecx],al
 49d:	0c 01                	or     al,0x1
 49f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 4a0:	06                   	push   es
 4a1:	10 03                	adc    BYTE PTR [ebx],al
 4a3:	58                   	pop    eax
 4a4:	00 00                	add    BYTE PTR [eax],al
 4a6:	00 01                	add    BYTE PTR [ecx],al
 4a8:	9c                   	pushf  
 4a9:	cd 04                	int    0x4
 4ab:	00 00                	add    BYTE PTR [eax],al
 4ad:	1c 92                	sbb    al,0x92
 4af:	00 00                	add    BYTE PTR [eax],al
 4b1:	00 01                	add    BYTE PTR [ecx],al
 4b3:	0c 01                	or     al,0x1
 4b5:	74 00                	je     4b7 <execInternalCommand-0x30ffb49>
 4b7:	00 00                	add    BYTE PTR [eax],al
 4b9:	02 91 00 1a d6 01    	add    dl,BYTE PTR [ecx+0x1d61a00]
 4bf:	00 00                	add    BYTE PTR [eax],al
 4c1:	01 0e                	add    DWORD PTR [esi],ecx
 4c3:	01 3d 04 00 00 03    	add    DWORD PTR ds:0x3000004,edi
 4c9:	91                   	xchg   ecx,eax
 4ca:	f0 57                	lock push edi
 4cc:	00 1d 31 03 00 00    	add    BYTE PTR ds:0x331,bl
 4d2:	01 19                	add    DWORD PTR [ecx],ebx
 4d4:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 4d7:	00 00                	add    BYTE PTR [eax],al
 4d9:	c7 06 10 03 f8 01    	mov    DWORD PTR [esi],0x1f80310
 4df:	00 00                	add    BYTE PTR [eax],al
 4e1:	01 9c bd 05 00 00 1c 	add    DWORD PTR [ebp+edi*4+0x1c000005],ebx
 4e8:	bf 01 00 00 01       	mov    edi,0x1000001
 4ed:	19 01                	sbb    DWORD PTR [ecx],eax
 4ef:	4f                   	dec    edi
 4f0:	00 00                	add    BYTE PTR [eax],al
 4f2:	00 02                	add    BYTE PTR [edx],al
 4f4:	91                   	xchg   ecx,eax
 4f5:	00 1c 1d 02 00 00 01 	add    BYTE PTR [ebx*1+0x1000002],bl
 4fc:	19 01                	sbb    DWORD PTR [ecx],eax
 4fe:	af                   	scas   eax,DWORD PTR es:[edi]
 4ff:	03 00                	add    eax,DWORD PTR [eax]
 501:	00 02                	add    BYTE PTR [edx],al
 503:	91                   	xchg   ecx,eax
 504:	04 1a                	add    al,0x1a
 506:	fb                   	sti    
 507:	00 00                	add    BYTE PTR [eax],al
 509:	00 01                	add    BYTE PTR [ecx],al
 50b:	1b 01                	sbb    eax,DWORD PTR [ecx]
 50d:	bd 05 00 00 03       	mov    ebp,0x3000005
 512:	91                   	xchg   ecx,eax
 513:	dc 7d 1a             	fdivr  QWORD PTR [ebp+0x1a]
 516:	3e 02 00             	add    al,BYTE PTR ds:[eax]
 519:	00 01                	add    BYTE PTR [ecx],al
 51b:	1c 01                	sbb    al,0x1
 51d:	81 00 00 00 03 91    	add    DWORD PTR [eax],0x91030000
 523:	db 7d 1a             	fstp   TBYTE PTR [ebp+0x1a]
 526:	68 00 00 00 01       	push   0x1000000
 52b:	1d 01 4f 00 00       	sbb    eax,0x4f01
 530:	00 02                	add    BYTE PTR [edx],al
 532:	91                   	xchg   ecx,eax
 533:	6c                   	ins    BYTE PTR es:[edi],dx
 534:	1a 48 01             	sbb    cl,BYTE PTR [eax+0x1]
 537:	00 00                	add    BYTE PTR [eax],al
 539:	01 1e                	add    DWORD PTR [esi],ebx
 53b:	01 cd                	add    ebp,ecx
 53d:	05 00 00 03 91       	add    eax,0x91030000
 542:	97                   	xchg   edi,eax
 543:	6a 1a                	push   0x1a
 545:	f3 02 00             	repz add al,BYTE PTR [eax]
 548:	00 01                	add    BYTE PTR [ecx],al
 54a:	1f                   	pop    ds
 54b:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 54e:	00 00                	add    BYTE PTR [eax],al
 550:	02 91 68 1a 4e 02    	add    dl,BYTE PTR [ecx+0x24e1a68]
 556:	00 00                	add    BYTE PTR [eax],al
 558:	01 20                	add    DWORD PTR [eax],esp
 55a:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 55d:	00 00                	add    BYTE PTR [eax],al
 55f:	02 91 64 1a 08 03    	add    dl,BYTE PTR [ecx+0x3081a64]
 565:	00 00                	add    BYTE PTR [eax],al
 567:	01 21                	add    DWORD PTR [ecx],esp
 569:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 56c:	00 00                	add    BYTE PTR [eax],al
 56e:	02 91 60 1a 6c 02    	add    dl,BYTE PTR [ecx+0x26c1a60]
 574:	00 00                	add    BYTE PTR [eax],al
 576:	01 22                	add    DWORD PTR [edx],esp
 578:	01 e3                	add    ebx,esp
 57a:	05 00 00 03 91       	add    eax,0x91030000
 57f:	83 6a 1e a7          	sub    DWORD PTR [edx+0x1e],0xffffffa7
 583:	01 00                	add    DWORD PTR [eax],eax
 585:	00 01                	add    BYTE PTR [ecx],al
 587:	2d 01 55 07 10       	sub    eax,0x10075501
 58c:	03 1e                	add    ebx,DWORD PTR [esi]
 58e:	38 03                	cmp    BYTE PTR [ebx],al
 590:	00 00                	add    BYTE PTR [eax],al
 592:	01 32                	add    DWORD PTR [edx],esi
 594:	01 91 07 10 03 1e    	add    DWORD PTR [ecx+0x1e031007],edx
 59a:	00 00                	add    BYTE PTR [eax],al
 59c:	00 00                	add    BYTE PTR [eax],al
 59e:	01 81 01 38 08 10    	add    DWORD PTR [ecx+0x10083801],eax
 5a4:	03 14 55 07 10 03 51 	add    edx,DWORD PTR [edx*2+0x51031007]
 5ab:	01 00                	add    DWORD PTR [eax],eax
 5ad:	00 1f                	add    BYTE PTR [edi],bl
 5af:	69 00 01 84 01 4f    	imul   eax,DWORD PTR [eax],0x4f018401
 5b5:	00 00                	add    BYTE PTR [eax],al
 5b7:	00 02                	add    BYTE PTR [edx],al
 5b9:	91                   	xchg   ecx,eax
 5ba:	5c                   	pop    esp
 5bb:	00 00                	add    BYTE PTR [eax],al
 5bd:	15 7a 00 00 00       	adc    eax,0x7a
 5c2:	cd 05                	int    0x5
 5c4:	00 00                	add    BYTE PTR [eax],al
 5c6:	19 6b 00             	sbb    DWORD PTR [ebx+0x0],ebp
 5c9:	00 00                	add    BYTE PTR [eax],al
 5cb:	ff 00                	inc    DWORD PTR [eax]
 5cd:	15 7a 00 00 00       	adc    eax,0x7a
 5d2:	e3 05                	jecxz  5d9 <execInternalCommand-0x30ffa27>
 5d4:	00 00                	add    BYTE PTR [eax],al
 5d6:	19 6b 00             	sbb    DWORD PTR [ebx+0x0],ebp
 5d9:	00 00                	add    BYTE PTR [eax],al
 5db:	31 19                	xor    DWORD PTR [ecx],ebx
 5dd:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 5e0:	00 31                	add    BYTE PTR [ecx],dh
 5e2:	00 15 7a 00 00 00    	add    BYTE PTR ds:0x7a,dl
 5e8:	f3 05 00 00 19 6b    	repz add eax,0x6b190000
 5ee:	00 00                	add    BYTE PTR [eax],al
 5f0:	00 13                	add    BYTE PTR [ebx],dl
 5f2:	00 20                	add    BYTE PTR [eax],ah
 5f4:	90                   	nop
 5f5:	02 00                	add    al,BYTE PTR [eax]
 5f7:	00 05 32 8c 00 00    	add    BYTE PTR ds:0x8c32,al
 5fd:	00 05 03 ac 12 10    	add    BYTE PTR ds:0x1012ac03,al
 603:	03 20                	add    esp,DWORD PTR [eax]
 605:	b3 01                	mov    bl,0x1
 607:	00 00                	add    BYTE PTR [eax],al
 609:	05 33 8c 00 00       	add    eax,0x8c33
 60e:	00 05 03 b0 12 10    	add    BYTE PTR ds:0x1012b003,al
 614:	03 20                	add    esp,DWORD PTR [eax]
 616:	1f                   	pop    ds
 617:	00 00                	add    BYTE PTR [eax],al
 619:	00 05 34 8c 00 00    	add    BYTE PTR ds:0x8c34,al
 61f:	00 05 03 a8 12 10    	add    BYTE PTR ds:0x1012a803,al
 625:	03 20                	add    esp,DWORD PTR [eax]
 627:	e4 02                	in     al,0x2
 629:	00 00                	add    BYTE PTR [eax],al
 62b:	03 63 1f             	add    esp,DWORD PTR [ebx+0x1f]
 62e:	01 00                	add    DWORD PTR [eax],eax
 630:	00 05 03 b8 12 10    	add    BYTE PTR ds:0x1012b803,al
 636:	03 20                	add    esp,DWORD PTR [eax]
 638:	99                   	cdq    
 639:	02 00                	add    al,BYTE PTR [eax]
 63b:	00 03                	add    BYTE PTR [ebx],al
 63d:	e1 6e                	loope  6ad <execInternalCommand-0x30ff953>
 63f:	01 00                	add    DWORD PTR [eax],eax
 641:	00 05 03 a4 12 10    	add    BYTE PTR ds:0x1012a403,al
 647:	03 20                	add    esp,DWORD PTR [eax]
 649:	c4 01                	les    eax,FWORD PTR [ecx]
 64b:	00 00                	add    BYTE PTR [eax],al
 64d:	04 1f                	add    al,0x1f
 64f:	98                   	cwde   
 650:	02 00                	add    al,BYTE PTR [eax]
 652:	00 05 03 a0 10 10    	add    BYTE PTR ds:0x1010a003,al
 658:	03 20                	add    esp,DWORD PTR [eax]
 65a:	04 01                	add    al,0x1
 65c:	00 00                	add    BYTE PTR [eax],al
 65e:	04 20                	add    al,0x20
 660:	74 00                	je     662 <execInternalCommand-0x30ff99e>
 662:	00 00                	add    BYTE PTR [eax],al
 664:	05 03 c0 12 10       	add    eax,0x1012c003
 669:	03 15 c0 01 00 00    	add    edx,DWORD PTR ds:0x1c0
 66f:	7a 06                	jp     677 <execInternalCommand-0x30ff989>
 671:	00 00                	add    BYTE PTR [eax],al
 673:	19 6b 00             	sbb    DWORD PTR [ebx+0x0],ebp
 676:	00 00                	add    BYTE PTR [eax],al
 678:	03 00                	add    eax,DWORD PTR [eax]
 67a:	20 22                	and    BYTE PTR [edx],ah
 67c:	01 00                	add    DWORD PTR [eax],eax
 67e:	00 04 21             	add    BYTE PTR [ecx+eiz*1],al
 681:	6a 06                	push   0x6
 683:	00 00                	add    BYTE PTR [eax],al
 685:	05 03 60 0f 10       	add    eax,0x100f6003
 68a:	03 21                	add    esp,DWORD PTR [ecx]
 68c:	20 58 01             	and    BYTE PTR [eax+0x1],bl
 68f:	00 00                	add    BYTE PTR [eax],al
 691:	04 27                	add    al,0x27
 693:	9d                   	popf   
 694:	06                   	push   es
 695:	00 00                	add    BYTE PTR [eax],al
 697:	05 03 b4 12 10       	add    eax,0x1012b403
 69c:	03 05 04 8b 06 00    	add    eax,DWORD PTR ds:0x68b04
 6a2:	00 22                	add    BYTE PTR [edx],ah
 6a4:	ae                   	scas   al,BYTE PTR es:[edi]
 6a5:	06                   	push   es
 6a6:	00 00                	add    BYTE PTR [eax],al
 6a8:	23 74 00 00          	and    esi,DWORD PTR [eax+eax*1+0x0]
 6ac:	00 00                	add    BYTE PTR [eax],al
 6ae:	20 8a 01 00 00 04    	and    BYTE PTR [edx+0x4000001],cl
 6b4:	28 bf 06 00 00 05    	sub    BYTE PTR [edi+0x5000006],bh
 6ba:	03 a0 12 10 03 05    	add    esp,DWORD PTR [eax+0x5031012]
 6c0:	04 a3                	add    al,0xa3
 6c2:	06                   	push   es
 6c3:	00 00                	add    BYTE PTR [eax],al
 6c5:	20 17                	and    BYTE PTR [edi],dl
 6c7:	01 00                	add    DWORD PTR [eax],eax
 6c9:	00 01                	add    BYTE PTR [ecx],al
 6cb:	12 97 00 00 00 05    	adc    dl,BYTE PTR [edi+0x5000000]
 6d1:	03 80 10 10 03 20    	add    eax,DWORD PTR [eax+0x20031010]
 6d7:	22 02                	and    al,BYTE PTR [edx]
 6d9:	00 00                	add    BYTE PTR [eax],al
 6db:	01 13                	add    DWORD PTR [ebx],edx
 6dd:	8c 00                	mov    WORD PTR [eax],es
 6df:	00 00                	add    BYTE PTR [eax],al
 6e1:	05 03 84 10 10       	add    eax,0x10108403
 6e6:	03 00                	add    eax,DWORD PTR [eax]

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
 155:	34 00                	xor    al,0x0
 157:	03 0e                	add    ecx,DWORD PTR [esi]
 159:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 15b:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 161:	00 00                	add    BYTE PTR [eax],al
 163:	1b 2e                	sbb    ebp,DWORD PTR [esi]
 165:	01 3f                	add    DWORD PTR [edi],edi
 167:	19 03                	sbb    DWORD PTR [ebx],eax
 169:	0e                   	push   cs
 16a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 16c:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 172:	12 06                	adc    al,BYTE PTR [esi]
 174:	40                   	inc    eax
 175:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 17b:	00 00                	add    BYTE PTR [eax],al
 17d:	1c 05                	sbb    al,0x5
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
  14:	bf 08 00 00 00       	mov    edi,0x8
  19:	00 00                	add    BYTE PTR [eax],al
  1b:	00 00                	add    BYTE PTR [eax],al
  1d:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	4f                   	dec    edi
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
 167:	34 69                	xor    al,0x69
 169:	75 75                	jne    1e0 <execInternalCommand-0x30ffe20>
 16b:	75 75                	jne    1e2 <execInternalCommand-0x30ffe1e>
 16d:	75 78                	jne    1e7 <execInternalCommand-0x30ffe19>
 16f:	a1 08 ec 00 02       	mov    eax,ds:0x200ec08
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
 1db:	68 3f a0 08 bb       	push   0xbb08a03f
 1e0:	76 08                	jbe    1ea <execInternalCommand-0x30ffe16>
 1e2:	67 08 cf             	addr16 or bh,cl
 1e5:	08 2f                	or     BYTE PTR [edi],ch
 1e7:	d7                   	xlat   BYTE PTR ds:[ebx]
 1e8:	08 31                	or     BYTE PTR [ecx],dh
 1ea:	69 92 08 bc ae 08 23 	imul   edx,DWORD PTR [edx+0x8aebc08],0x13270223
 1f1:	02 27 13 
 1f4:	02 22                	add    ah,BYTE PTR [edx]
 1f6:	13 31                	adc    esi,DWORD PTR [ecx]
 1f8:	93                   	xchg   ebx,eax
 1f9:	08 ca                	or     dl,cl
 1fb:	08 bd 9f 75 3f 92    	or     BYTE PTR [ebp-0x6dc08a61],bh
 201:	75 76                	jne    279 <execInternalCommand-0x30ffd87>
 203:	75 75                	jne    27a <execInternalCommand-0x30ffd86>
 205:	77 59                	ja     260 <execInternalCommand-0x30ffda0>
 207:	75 08                	jne    211 <execInternalCommand-0x30ffdef>
 209:	4b                   	dec    ebx
 20a:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 20d:	59                   	pop    ecx
 20e:	f4                   	hlt    
 20f:	5b                   	pop    ebx
 210:	75 75                	jne    287 <execInternalCommand-0x30ffd79>
 212:	08 83 08 4c 75 30    	or     BYTE PTR [ebx+0x30754c08],al
 218:	08 56 b1             	or     BYTE PTR [esi-0x4f],dl
 21b:	ae                   	scas   al,BYTE PTR es:[edi]
 21c:	03 0d 66 30 ae 03    	add    ecx,DWORD PTR ds:0x3ae3066
 222:	0d 82 31 03 09       	or     eax,0x9033182
 227:	ac                   	lods   al,BYTE PTR ds:[esi]
 228:	30 ae 68 03 0c e4    	xor    BYTE PTR [esi-0x1bf3fc98],ch
 22e:	b2 08                	mov    dl,0x8
 230:	68 03 7a 58 03       	push   0x3587a03
 235:	09 20                	or     DWORD PTR [eax],esp
 237:	ad                   	lods   eax,DWORD PTR ds:[esi]
 238:	59                   	pop    ecx
 239:	08 4c 08 21          	or     BYTE PTR [eax+ecx*1+0x21],cl
 23d:	68 03 09 4a 02       	push   0x24a0903
 242:	27                   	daa    
 243:	13 03                	adc    eax,DWORD PTR [ebx]
 245:	98                   	cwde   
 246:	7f 66                	jg     2ae <execInternalCommand-0x30ffd52>
 248:	03 eb                	add    ebp,ebx
 24a:	00 08                	add    BYTE PTR [eax],cl
 24c:	20 59 02             	and    BYTE PTR [ecx+0x2],bl
 24f:	02 00                	add    al,BYTE PTR [eax]
 251:	01 01                	add    DWORD PTR [ecx],eax

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
  96:	69 6e 65 00 47 4e 55 	imul   ebp,DWORD PTR [esi+0x65],0x554e4700
  9d:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  a0:	39 20                	cmp    DWORD PTR [eax],esp
  a2:	35 2e 33 2e 30       	xor    eax,0x302e332e
  a7:	20 2d 6d 61 73 6d    	and    BYTE PTR ds:0x6d73616d,ch
  ad:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  b2:	6c                   	ins    BYTE PTR es:[edi],dx
  b3:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  b9:	65                   	gs
  ba:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  bf:	72 69                	jb     12a <execInternalCommand-0x30ffed6>
  c1:	63 20                	arpl   WORD PTR [eax],sp
  c3:	2d 6d 61 72 63       	sub    eax,0x6372616d
  c8:	68 3d 70 65 6e       	push   0x6e65703d
  cd:	74 69                	je     138 <execInternalCommand-0x30ffec8>
  cf:	75 6d                	jne    13e <execInternalCommand-0x30ffec2>
  d1:	70 72                	jo     145 <execInternalCommand-0x30ffebb>
  d3:	6f                   	outs   dx,DWORD PTR ds:[esi]
  d4:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  da:	74 64                	je     140 <execInternalCommand-0x30ffec0>
  dc:	3d 63 39 39 20       	cmp    eax,0x20393963
  e1:	2d 66 66 72 65       	sub    eax,0x65726666
  e6:	65                   	gs
  e7:	73 74                	jae    15d <execInternalCommand-0x30ffea3>
  e9:	61                   	popa   
  ea:	6e                   	outs   dx,BYTE PTR ds:[esi]
  eb:	64 69 6e 67 00 65 78 	imul   ebp,DWORD PTR fs:[esi+0x67],0x65786500
  f2:	65 
  f3:	63 49 6e             	arpl   WORD PTR [ecx+0x6e],cx
  f6:	74 65                	je     15d <execInternalCommand-0x30ffea3>
  f8:	72 6e                	jb     168 <execInternalCommand-0x30ffe98>
  fa:	61                   	popa   
  fb:	6c                   	ins    BYTE PTR es:[edi],dx
  fc:	43                   	inc    ebx
  fd:	6f                   	outs   dx,DWORD PTR ds:[esi]
  fe:	6d                   	ins    DWORD PTR es:[edi],dx
  ff:	6d                   	ins    DWORD PTR es:[edi],dx
 100:	61                   	popa   
 101:	6e                   	outs   dx,BYTE PTR ds:[esi]
 102:	64 00 73 4b          	add    BYTE PTR fs:[ebx+0x4b],dh
 106:	53                   	push   ebx
 107:	68 65 6c 6c 50       	push   0x506c6c65
 10c:	72 6f                	jb     17d <execInternalCommand-0x30ffe83>
 10e:	67 72 61             	addr16 jb 172 <execInternalCommand-0x30ffe8e>
 111:	6d                   	ins    DWORD PTR es:[edi],dx
 112:	4e                   	dec    esi
 113:	61                   	popa   
 114:	6d                   	ins    DWORD PTR es:[edi],dx
 115:	65 00 74 69 6d       	add    BYTE PTR gs:[ecx+ebp*2+0x6d],dh
 11a:	65                   	gs
 11b:	54                   	push   esp
 11c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 11d:	45                   	inc    ebp
 11e:	78 69                	js     189 <execInternalCommand-0x30ffe77>
 120:	74 00                	je     122 <execInternalCommand-0x30ffede>
 122:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 125:	73 00                	jae    127 <execInternalCommand-0x30ffed9>
 127:	2f                   	das    
 128:	68 6f 6d 65 2f       	push   0x2f656d6f
 12d:	79 6f                	jns    19e <execInternalCommand-0x30ffe62>
 12f:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 136:	6f                   	outs   dx,DWORD PTR ds:[esi]
 137:	73 2f                	jae    168 <execInternalCommand-0x30ffe98>
 139:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 13d:	6c                   	ins    BYTE PTR es:[edi],dx
 13e:	6c                   	ins    BYTE PTR es:[edi],dx
 13f:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
 142:	6e                   	outs   dx,BYTE PTR ds:[esi]
 143:	74 38                	je     17d <execInternalCommand-0x30ffe83>
 145:	5f                   	pop    edi
 146:	74 00                	je     148 <execInternalCommand-0x30ffeb8>
 148:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 14b:	6d                   	ins    DWORD PTR es:[edi],dx
 14c:	61                   	popa   
 14d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 14e:	64                   	fs
 14f:	73 00                	jae    151 <execInternalCommand-0x30ffeaf>
 151:	64                   	fs
 152:	71 75                	jno    1c9 <execInternalCommand-0x30ffe37>
 154:	6f                   	outs   dx,DWORD PTR ds:[esi]
 155:	74 65                	je     1bc <execInternalCommand-0x30ffe44>
 157:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 15a:	6d                   	ins    DWORD PTR es:[edi],dx
 15b:	6d                   	ins    DWORD PTR es:[edi],dx
 15c:	61                   	popa   
 15d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 15e:	64                   	fs
 15f:	5f                   	pop    edi
 160:	66                   	data16
 161:	75 6e                	jne    1d1 <execInternalCommand-0x30ffe2f>
 163:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 167:	6e                   	outs   dx,BYTE PTR ds:[esi]
 168:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 16b:	72 61                	jb     1ce <execInternalCommand-0x30ffe32>
 16d:	6d                   	ins    DWORD PTR es:[edi],dx
 16e:	43                   	inc    ebx
 16f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 170:	75 6e                	jne    1e0 <execInternalCommand-0x30ffe20>
 172:	74 00                	je     174 <execInternalCommand-0x30ffe8c>
 174:	6c                   	ins    BYTE PTR es:[edi],dx
 175:	6f                   	outs   dx,DWORD PTR ds:[esi]
 176:	6e                   	outs   dx,BYTE PTR ds:[esi]
 177:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 17b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 17c:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 180:	74 00                	je     182 <execInternalCommand-0x30ffe7e>
 182:	62 73 71             	bound  esi,QWORD PTR [ebx+0x71]
 185:	75 6f                	jne    1f6 <execInternalCommand-0x30ffe0a>
 187:	74 65                	je     1ee <execInternalCommand-0x30ffe12>
 189:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 18c:	6d                   	ins    DWORD PTR es:[edi],dx
 18d:	6d                   	ins    DWORD PTR es:[edi],dx
 18e:	61                   	popa   
 18f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 190:	64                   	fs
 191:	5f                   	pop    edi
 192:	66                   	data16
 193:	75 6e                	jne    203 <execInternalCommand-0x30ffdfd>
 195:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 199:	6e                   	outs   dx,BYTE PTR ds:[esi]
 19a:	5f                   	pop    edi
 19b:	70 00                	jo     19d <execInternalCommand-0x30ffe63>
 19d:	70 61                	jo     200 <execInternalCommand-0x30ffe00>
 19f:	64 31 00             	xor    DWORD PTR fs:[eax],eax
 1a2:	70 61                	jo     205 <execInternalCommand-0x30ffdfb>
 1a4:	64 32 00             	xor    al,BYTE PTR fs:[eax]
 1a7:	67                   	addr16
 1a8:	65                   	gs
 1a9:	74 41                	je     1ec <execInternalCommand-0x30ffe14>
 1ab:	43                   	inc    ebx
 1ac:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1ad:	6d                   	ins    DWORD PTR es:[edi],dx
 1ae:	6d                   	ins    DWORD PTR es:[edi],dx
 1af:	61                   	popa   
 1b0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1b1:	64 00 68 65          	add    BYTE PTR fs:[eax+0x65],ch
 1b5:	61                   	popa   
 1b6:	70 43                	jo     1fb <execInternalCommand-0x30ffe05>
 1b8:	75 72                	jne    22c <execInternalCommand-0x30ffdd4>
 1ba:	72 00                	jb     1bc <execInternalCommand-0x30ffe44>
 1bc:	6d                   	ins    DWORD PTR es:[edi],dx
 1bd:	61                   	popa   
 1be:	78 61                	js     221 <execInternalCommand-0x30ffddf>
 1c0:	72 67                	jb     229 <execInternalCommand-0x30ffdd7>
 1c2:	63 00                	arpl   WORD PTR [eax],ax
 1c4:	73 45                	jae    20b <execInternalCommand-0x30ffdf5>
 1c6:	78 65                	js     22d <execInternalCommand-0x30ffdd3>
 1c8:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 1cb:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
 1d2:	72 61                	jb     235 <execInternalCommand-0x30ffdcb>
 1d4:	6d                   	ins    DWORD PTR es:[edi],dx
 1d5:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 1d8:	72 61                	jb     23b <execInternalCommand-0x30ffdc5>
 1da:	6d                   	ins    DWORD PTR es:[edi],dx
 1db:	73 00                	jae    1dd <execInternalCommand-0x30ffe23>
 1dd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1de:	61                   	popa   
 1df:	6d                   	ins    DWORD PTR es:[edi],dx
 1e0:	65 00 75 6e          	add    BYTE PTR gs:[ebp+0x6e],dh
 1e4:	73 69                	jae    24f <execInternalCommand-0x30ffdb1>
 1e6:	67 6e                	outs   dx,BYTE PTR ds:[si]
 1e8:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 1ed:	61                   	popa   
 1ee:	72 00                	jb     1f0 <execInternalCommand-0x30ffe10>
 1f0:	6c                   	ins    BYTE PTR es:[edi],dx
 1f1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1f2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1f3:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 1f7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1f8:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 1fc:	73 69                	jae    267 <execInternalCommand-0x30ffd99>
 1fe:	67 6e                	outs   dx,BYTE PTR ds:[si]
 200:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 205:	74 00                	je     207 <execInternalCommand-0x30ffdf9>
 207:	65                   	gs
 208:	66 61                	popaw  
 20a:	6d                   	ins    DWORD PTR es:[edi],dx
 20b:	69 6c 79 00 75 69 6e 	imul   ebp,DWORD PTR [ecx+edi*2+0x0],0x746e6975
 212:	74 
 213:	33 32                	xor    esi,DWORD PTR [edx]
 215:	5f                   	pop    edi
 216:	74 00                	je     218 <execInternalCommand-0x30ffde8>
 218:	62 75 69             	bound  esi,QWORD PTR [ebp+0x69]
 21b:	6c                   	ins    BYTE PTR es:[edi],dx
 21c:	64                   	fs
 21d:	61                   	popa   
 21e:	72 67                	jb     287 <execInternalCommand-0x30ffd79>
 220:	76 00                	jbe    222 <execInternalCommand-0x30ffdde>
 222:	65                   	gs
 223:	78 69                	js     28e <execInternalCommand-0x30ffd72>
 225:	74 43                	je     26a <execInternalCommand-0x30ffd96>
 227:	6f                   	outs   dx,DWORD PTR ds:[esi]
 228:	64 65 00 73 68       	fs add BYTE PTR fs:gs:[ebx+0x68],dh
 22d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 22e:	72 74                	jb     2a4 <execInternalCommand-0x30ffd5c>
 230:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 233:	73 69                	jae    29e <execInternalCommand-0x30ffd62>
 235:	67 6e                	outs   dx,BYTE PTR ds:[si]
 237:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 23c:	74 00                	je     23e <execInternalCommand-0x30ffdc2>
 23e:	6c                   	ins    BYTE PTR es:[edi],dx
 23f:	43                   	inc    ebx
 240:	75 72                	jne    2b4 <execInternalCommand-0x30ffd4c>
 242:	72 4b                	jb     28f <execInternalCommand-0x30ffd71>
 244:	65                   	gs
 245:	79 00                	jns    247 <execInternalCommand-0x30ffdb9>
 247:	65                   	gs
 248:	6d                   	ins    DWORD PTR es:[edi],dx
 249:	6f                   	outs   dx,DWORD PTR ds:[esi]
 24a:	64                   	fs
 24b:	65                   	gs
 24c:	6c                   	ins    BYTE PTR es:[edi],dx
 24d:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 250:	6d                   	ins    DWORD PTR es:[edi],dx
 251:	6d                   	ins    DWORD PTR es:[edi],dx
 252:	61                   	popa   
 253:	6e                   	outs   dx,BYTE PTR ds:[esi]
 254:	64                   	fs
 255:	42                   	inc    edx
 256:	75 66                	jne    2be <execInternalCommand-0x30ffd42>
 258:	66 50                	push   ax
 25a:	74 72                	je     2ce <execInternalCommand-0x30ffd32>
 25c:	00 5f 42             	add    BYTE PTR [edi+0x42],bl
 25f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 260:	6f                   	outs   dx,DWORD PTR ds:[esi]
 261:	6c                   	ins    BYTE PTR es:[edi],dx
 262:	00 6b 73             	add    BYTE PTR [ebx+0x73],ch
 265:	68 65 6c 6c 2e       	push   0x2e6c6c65
 26a:	63 00                	arpl   WORD PTR [eax],ax
 26c:	61                   	popa   
 26d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 26e:	73 69                	jae    2d9 <execInternalCommand-0x30ffd27>
 270:	53                   	push   ebx
 271:	65                   	gs
 272:	71 00                	jno    274 <execInternalCommand-0x30ffd8c>
 274:	65                   	gs
 275:	78 65                	js     2dc <execInternalCommand-0x30ffd24>
 277:	63 70 00             	arpl   WORD PTR [eax+0x0],si
 27a:	61                   	popa   
 27b:	76 78                	jbe    2f5 <execInternalCommand-0x30ffd0b>
 27d:	35 31 32 76 62       	xor    eax,0x62763231
 282:	6d                   	ins    DWORD PTR es:[edi],dx
 283:	69 00 73 69 7a 65    	imul   eax,DWORD PTR [eax],0x657a6973
 289:	00 6e 61             	add    BYTE PTR [esi+0x61],ch
 28c:	72 67                	jb     2f5 <execInternalCommand-0x30ffd0b>
 28e:	76 00                	jbe    290 <execInternalCommand-0x30ffd70>
 290:	68 65 61 70 42       	push   0x42706165
 295:	61                   	popa   
 296:	73 65                	jae    2fd <execInternalCommand-0x30ffd03>
 298:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
 29b:	75 69                	jne    306 <execInternalCommand-0x30ffcfa>
 29d:	64                   	fs
 29e:	5f                   	pop    edi
 29f:	65                   	gs
 2a0:	78 74                	js     316 <execInternalCommand-0x30ffcea>
 2a2:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 2a4:	64                   	fs
 2a5:	65                   	gs
 2a6:	64                   	fs
 2a7:	5f                   	pop    edi
 2a8:	66                   	data16
 2a9:	65                   	gs
 2aa:	61                   	popa   
 2ab:	74 75                	je     322 <execInternalCommand-0x30ffcde>
 2ad:	72 65                	jb     314 <execInternalCommand-0x30ffcec>
 2af:	5f                   	pop    edi
 2b0:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
 2b3:	73 00                	jae    2b5 <execInternalCommand-0x30ffd4b>
 2b5:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 2b8:	4c                   	dec    esp
 2b9:	69 6e 65 00 70 72 65 	imul   ebp,DWORD PTR [esi+0x65],0x65727000
 2c0:	66                   	data16
 2c1:	65                   	gs
 2c2:	74 63                	je     327 <execInternalCommand-0x30ffcd9>
 2c4:	68 77 74 31 00       	push   0x317477
 2c9:	66 69 6e 64 43 6f    	imul   bp,WORD PTR [esi+0x64],0x6f43
 2cf:	6d                   	ins    DWORD PTR es:[edi],dx
 2d0:	6d                   	ins    DWORD PTR es:[edi],dx
 2d1:	61                   	popa   
 2d2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2d3:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 2d7:	70 79                	jo     352 <execInternalCommand-0x30ffcae>
 2d9:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 2dc:	00 6b 53             	add    BYTE PTR [ebx+0x53],ch
 2df:	6c                   	ins    BYTE PTR es:[edi],dx
 2e0:	65                   	gs
 2e1:	65                   	gs
 2e2:	70 00                	jo     2e4 <execInternalCommand-0x30ffd1c>
 2e4:	63 70 75             	arpl   WORD PTR [eax+0x75],si
 2e7:	69 64 5f 70 72 6f 63 	imul   esp,DWORD PTR [edi+ebx*2+0x70],0x69636f72
 2ee:	69 
 2ef:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2f0:	66 6f                	outs   dx,WORD PTR ds:[esi]
 2f2:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 2f5:	6d                   	ins    DWORD PTR es:[edi],dx
 2f6:	6d                   	ins    DWORD PTR es:[edi],dx
 2f7:	61                   	popa   
 2f8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2f9:	64                   	fs
 2fa:	73 50                	jae    34c <execInternalCommand-0x30ffcb4>
 2fc:	74 72                	je     370 <execInternalCommand-0x30ffc90>
 2fe:	00 72 65             	add    BYTE PTR [edx+0x65],dh
 301:	73 65                	jae    368 <execInternalCommand-0x30ffc98>
 303:	72 76                	jb     37b <execInternalCommand-0x30ffc85>
 305:	65 64 00 63 6f       	gs add BYTE PTR fs:gs:[ebx+0x6f],ah
 30a:	6d                   	ins    DWORD PTR es:[edi],dx
 30b:	6d                   	ins    DWORD PTR es:[edi],dx
 30c:	61                   	popa   
 30d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 30e:	64                   	fs
 30f:	57                   	push   edi
 310:	61                   	popa   
 311:	73 46                	jae    359 <execInternalCommand-0x30ffca7>
 313:	72 6f                	jb     384 <execInternalCommand-0x30ffc7c>
 315:	6d                   	ins    DWORD PTR es:[edi],dx
 316:	54                   	push   esp
 317:	68 69 73 42 75       	push   0x75427369
 31c:	66                   	data16
 31d:	66                   	data16
 31e:	65                   	gs
 31f:	72 50                	jb     371 <execInternalCommand-0x30ffc8f>
 321:	74 72                	je     395 <execInternalCommand-0x30ffc6b>
 323:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 326:	65                   	gs
 327:	70 00                	jo     329 <execInternalCommand-0x30ffcd7>
 329:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 32c:	6d                   	ins    DWORD PTR es:[edi],dx
 32d:	61                   	popa   
 32e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 32f:	64 00 6b 53          	add    BYTE PTR fs:[ebx+0x53],ch
 333:	68 65 6c 6c 00       	push   0x6c6c65
 338:	67                   	addr16
 339:	65                   	gs
 33a:	74 41                	je     37d <execInternalCommand-0x30ffc83>
 33c:	4b                   	dec    ebx
 33d:	65                   	gs
 33e:	79 00                	jns    340 <execInternalCommand-0x30ffcc0>

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
