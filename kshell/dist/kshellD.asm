
Debug/cross-Linux/kshell:     file format elf32-i386


Disassembly of section .text:

03100000 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/kshell/kshell.c:28
int findCommand(char* command);
char **buildargv (const char *input);
void helpMe();

void execInternalCommand(char lCommand[256])
{
 3100000:	55                   	push   ebp
 3100001:	89 e5                	mov    ebp,esp
 3100003:	53                   	push   ebx
 3100004:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/kshell/kshell.c:29
    int i = findCommand(lCommand);
 3100007:	83 ec 0c             	sub    esp,0xc
 310000a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310000d:	e8 db 01 00 00       	call   31001ed <findCommand>
 3100012:	83 c4 10             	add    esp,0x10
 3100015:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:31

    if(i>0)
 3100018:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 310001c:	7e 74                	jle    3100092 <execInternalCommand+0x92>
/home/yogi/src/os/kshell/kshell.c:33
    {
        i--;
 310001e:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:35
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 3100022:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100025:	c1 e0 04             	shl    eax,0x4
 3100028:	05 a8 0f 10 03       	add    eax,0x3100fa8
 310002d:	8b 00                	mov    eax,DWORD PTR [eax]
 310002f:	a3 f0 12 10 03       	mov    ds:0x31012f0,eax
/home/yogi/src/os/kshell/kshell.c:36
        command_function_p = cmds[i].function;
 3100034:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100037:	c1 e0 04             	shl    eax,0x4
 310003a:	05 a8 0f 10 03       	add    eax,0x3100fa8
 310003f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100041:	a3 e0 12 10 03       	mov    ds:0x31012e0,eax
/home/yogi/src/os/kshell/kshell.c:37
        if (cmds[i].paramCount==0)
 3100046:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100049:	c1 e0 04             	shl    eax,0x4
 310004c:	05 ac 0f 10 03       	add    eax,0x3100fac
 3100051:	8b 00                	mov    eax,DWORD PTR [eax]
 3100053:	85 c0                	test   eax,eax
 3100055:	75 09                	jne    3100060 <execInternalCommand+0x60>
/home/yogi/src/os/kshell/kshell.c:38
            command_function();
 3100057:	a1 f0 12 10 03       	mov    eax,ds:0x31012f0
 310005c:	ff d0                	call   eax
/home/yogi/src/os/kshell/kshell.c:48
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
    }
}
 310005e:	eb 45                	jmp    31000a5 <execInternalCommand+0xa5>
/home/yogi/src/os/kshell/kshell.c:41
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
 3100077:	e8 84 09 00 00       	call   3100a00 <kShell+0x2c0>
 310007c:	83 c4 10             	add    esp,0x10
 310007f:	8d 50 01             	lea    edx,[eax+0x1]
 3100082:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100085:	01 d0                	add    eax,edx
 3100087:	83 ec 0c             	sub    esp,0xc
 310008a:	50                   	push   eax
 310008b:	ff d3                	call   ebx
 310008d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:48
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
    }
}
 3100090:	eb 13                	jmp    31000a5 <execInternalCommand+0xa5>
/home/yogi/src/os/kshell/kshell.c:46
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  
        }
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
 3100092:	83 ec 08             	sub    esp,0x8
 3100095:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100098:	68 84 0a 10 03       	push   0x3100a84
 310009d:	e8 be 08 00 00       	call   3100960 <kShell+0x220>
 31000a2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:48
    }
}
 31000a5:	90                   	nop
 31000a6:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31000a9:	c9                   	leave  
 31000aa:	c3                   	ret    

031000ab <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/kshell/kshell.c:51

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 31000ab:	55                   	push   ebp
 31000ac:	89 e5                	mov    ebp,esp
 31000ae:	53                   	push   ebx
 31000af:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/kshell/kshell.c:52
    int x=0,y=0;
 31000b2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31000b9:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:53
    int lRetVal=0,parsedChars=0;
 31000c0:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 31000c7:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:55
    
    memset(params,0, size);
 31000ce:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 31000d1:	83 ec 04             	sub    esp,0x4
 31000d4:	50                   	push   eax
 31000d5:	6a 00                	push   0x0
 31000d7:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31000da:	e8 01 09 00 00       	call   31009e0 <kShell+0x2a0>
 31000df:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:57
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31000e2:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 31000e9:	e9 c3 00 00 00       	jmp    31001b1 <parseParamsShell+0x106>
/home/yogi/src/os/kshell/kshell.c:60
    {
        //print("c=%c\n", cmdLine[cnt]);
        if ( (cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',')
 31000ee:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31000f1:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 31000f4:	01 d0                	add    eax,edx
 31000f6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31000f9:	3c 20                	cmp    al,0x20
 31000fb:	74 1e                	je     310011b <parseParamsShell+0x70>
/home/yogi/src/os/kshell/kshell.c:60 (discriminator 1)
 31000fd:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100100:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100103:	01 d0                	add    eax,edx
 3100105:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100108:	3c 2d                	cmp    al,0x2d
 310010a:	74 0f                	je     310011b <parseParamsShell+0x70>
/home/yogi/src/os/kshell/kshell.c:60 (discriminator 2)
 310010c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310010f:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100112:	01 d0                	add    eax,edx
 3100114:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100117:	3c 2c                	cmp    al,0x2c
 3100119:	75 6b                	jne    3100186 <parseParamsShell+0xdb>
/home/yogi/src/os/kshell/kshell.c:63
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 310011b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310011e:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100121:	01 d0                	add    eax,edx
 3100123:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100126:	3c 2d                	cmp    al,0x2d
 3100128:	74 0f                	je     3100139 <parseParamsShell+0x8e>
/home/yogi/src/os/kshell/kshell.c:63 (discriminator 1)
 310012a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310012d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100130:	01 d0                	add    eax,edx
 3100132:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100135:	3c 2f                	cmp    al,0x2f
 3100137:	75 23                	jne    310015c <parseParamsShell+0xb1>
/home/yogi/src/os/kshell/kshell.c:64
                params[y][x++]=cmdLine[cnt];
 3100139:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310013c:	6b d0 32             	imul   edx,eax,0x32
 310013f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100142:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3100145:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100148:	8d 50 01             	lea    edx,[eax+0x1]
 310014b:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310014e:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 3100151:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 3100154:	01 da                	add    edx,ebx
 3100156:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100159:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/kshell/kshell.c:65
            params[y][x]='\0';
 310015c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310015f:	6b d0 32             	imul   edx,eax,0x32
 3100162:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100165:	01 c2                	add    edx,eax
 3100167:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310016a:	01 d0                	add    eax,edx
 310016c:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:66
            if (cnt>0)
 310016f:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100173:	74 34                	je     31001a9 <parseParamsShell+0xfe>
/home/yogi/src/os/kshell/kshell.c:67
                {x=0;y++;lRetVal++;}
 3100175:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310017c:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100180:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/kshell/kshell.c:66
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 3100184:	eb 23                	jmp    31001a9 <parseParamsShell+0xfe>
/home/yogi/src/os/kshell/kshell.c:72
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 3100186:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100189:	6b d0 32             	imul   edx,eax,0x32
 310018c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310018f:	8d 0c 02             	lea    ecx,[edx+eax*1]
 3100192:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100195:	8d 50 01             	lea    edx,[eax+0x1]
 3100198:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310019b:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 310019e:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 31001a1:	01 da                	add    edx,ebx
 31001a3:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31001a6:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/kshell/kshell.c:74 (discriminator 2)
        }
        parsedChars++;
 31001a9:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/kshell/kshell.c:57 (discriminator 2)
    int x=0,y=0;
    int lRetVal=0,parsedChars=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31001ad:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/kshell/kshell.c:57 (discriminator 1)
 31001b1:	83 ec 0c             	sub    esp,0xc
 31001b4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31001b7:	e8 44 08 00 00       	call   3100a00 <kShell+0x2c0>
 31001bc:	83 c4 10             	add    esp,0x10
 31001bf:	3b 45 e4             	cmp    eax,DWORD PTR [ebp-0x1c]
 31001c2:	0f 87 26 ff ff ff    	ja     31000ee <parseParamsShell+0x43>
/home/yogi/src/os/kshell/kshell.c:76
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 31001c8:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31001cc:	74 17                	je     31001e5 <parseParamsShell+0x13a>
/home/yogi/src/os/kshell/kshell.c:78
    {
        lRetVal++;
 31001ce:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/kshell/kshell.c:79
        params[y][x]='\0';
 31001d2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31001d5:	6b d0 32             	imul   edx,eax,0x32
 31001d8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31001db:	01 c2                	add    edx,eax
 31001dd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001e0:	01 d0                	add    eax,edx
 31001e2:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:84
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 31001e5:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/kshell/kshell.c:85
}
 31001e8:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31001eb:	c9                   	leave  
 31001ec:	c3                   	ret    

031001ed <findCommand>:
findCommand():
/home/yogi/src/os/kshell/kshell.c:88

int findCommand(char* command)
{
 31001ed:	55                   	push   ebp
 31001ee:	89 e5                	mov    ebp,esp
 31001f0:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:92
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 31001f3:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31001fa:	eb 4d                	jmp    3100249 <findCommand+0x5c>
/home/yogi/src/os/kshell/kshell.c:94
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 31001fc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001ff:	c1 e0 04             	shl    eax,0x4
 3100202:	05 a0 0f 10 03       	add    eax,0x3100fa0
 3100207:	8b 00                	mov    eax,DWORD PTR [eax]
 3100209:	83 ec 0c             	sub    esp,0xc
 310020c:	50                   	push   eax
 310020d:	e8 ee 07 00 00       	call   3100a00 <kShell+0x2c0>
 3100212:	83 c4 10             	add    esp,0x10
 3100215:	89 c2                	mov    edx,eax
 3100217:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310021a:	c1 e0 04             	shl    eax,0x4
 310021d:	05 a0 0f 10 03       	add    eax,0x3100fa0
 3100222:	8b 00                	mov    eax,DWORD PTR [eax]
 3100224:	83 ec 04             	sub    esp,0x4
 3100227:	52                   	push   edx
 3100228:	50                   	push   eax
 3100229:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310022c:	e8 9f 07 00 00       	call   31009d0 <kShell+0x290>
 3100231:	83 c4 10             	add    esp,0x10
 3100234:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:96
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 3100237:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 310023b:	75 08                	jne    3100245 <findCommand+0x58>
/home/yogi/src/os/kshell/kshell.c:99
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 310023d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100240:	83 c0 01             	add    eax,0x1
 3100243:	eb 0f                	jmp    3100254 <findCommand+0x67>
/home/yogi/src/os/kshell/kshell.c:92 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3100245:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:92 (discriminator 1)
 3100249:	83 7d f4 03          	cmp    DWORD PTR [ebp-0xc],0x3
 310024d:	76 ad                	jbe    31001fc <findCommand+0xf>
/home/yogi/src/os/kshell/kshell.c:103
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 310024f:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/kshell/kshell.c:104
}
 3100254:	c9                   	leave  
 3100255:	c3                   	ret    

03100256 <buildargv>:
buildargv():
/home/yogi/src/os/kshell/kshell.c:108

/*parts from http://*/
char **buildargv (const char *input)
{
 3100256:	55                   	push   ebp
 3100257:	89 e5                	mov    ebp,esp
 3100259:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/kshell/kshell.c:111
  char *arg;
  char *copybuf;
  int squote = 0;
 310025c:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/kshell/kshell.c:112
  int dquote = 0;
 3100263:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:113
  int bsquote = 0;
 310026a:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/kshell/kshell.c:114
  int argc = 0;
 3100271:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/kshell/kshell.c:115
  int maxargc = 0;
 3100278:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/kshell/kshell.c:116
  char **argv = NULL;
 310027f:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/kshell/kshell.c:120
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 3100286:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 310028a:	0f 84 33 02 00 00    	je     31004c3 <buildargv+0x26d>
/home/yogi/src/os/kshell/kshell.c:123
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 3100290:	83 ec 0c             	sub    esp,0xc
 3100293:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100296:	e8 65 07 00 00       	call   3100a00 <kShell+0x2c0>
 310029b:	83 c4 10             	add    esp,0x10
 310029e:	83 c0 01             	add    eax,0x1
 31002a1:	83 ec 0c             	sub    esp,0xc
 31002a4:	50                   	push   eax
 31002a5:	e8 e6 06 00 00       	call   3100990 <kShell+0x250>
 31002aa:	83 c4 10             	add    esp,0x10
 31002ad:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:131
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 31002b0:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 31002b4:	74 0b                	je     31002c1 <buildargv+0x6b>
/home/yogi/src/os/kshell/kshell.c:131 (discriminator 1)
 31002b6:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31002b9:	83 e8 01             	sub    eax,0x1
 31002bc:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 31002bf:	7f 3d                	jg     31002fe <buildargv+0xa8>
/home/yogi/src/os/kshell/kshell.c:134
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 31002c1:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 31002c5:	75 1c                	jne    31002e3 <buildargv+0x8d>
/home/yogi/src/os/kshell/kshell.c:136
		{
		  maxargc = INITIAL_MAXARGC;
 31002c7:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/kshell/kshell.c:137
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 31002ce:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31002d1:	c1 e0 02             	shl    eax,0x2
 31002d4:	83 ec 0c             	sub    esp,0xc
 31002d7:	50                   	push   eax
 31002d8:	e8 b3 06 00 00       	call   3100990 <kShell+0x250>
 31002dd:	83 c4 10             	add    esp,0x10
 31002e0:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/kshell/kshell.c:139
		}
	      argv = nargv;
 31002e3:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 31002e6:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/kshell/kshell.c:140
	      argv[argc] = NULL;
 31002e9:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31002ec:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31002f3:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31002f6:	01 d0                	add    eax,edx
 31002f8:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:143
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 31002fe:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100301:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:144
	  while (*input != EOS)
 3100304:	e9 ec 00 00 00       	jmp    31003f5 <buildargv+0x19f>
/home/yogi/src/os/kshell/kshell.c:146
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100309:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310030c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310030f:	3c 20                	cmp    al,0x20
 3100311:	75 16                	jne    3100329 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:146 (discriminator 1)
 3100313:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100317:	75 10                	jne    3100329 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:146 (discriminator 2)
 3100319:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 310031d:	75 0a                	jne    3100329 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:146 (discriminator 3)
 310031f:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100323:	0f 84 da 00 00 00    	je     3100403 <buildargv+0x1ad>
/home/yogi/src/os/kshell/kshell.c:152
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100329:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310032d:	74 1d                	je     310034c <buildargv+0xf6>
/home/yogi/src/os/kshell/kshell.c:154
		    {
		      bsquote = 0;
 310032f:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/kshell/kshell.c:155
		      *arg++ = *input;
 3100336:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100339:	8d 50 01             	lea    edx,[eax+0x1]
 310033c:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310033f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100342:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100345:	88 10                	mov    BYTE PTR [eax],dl
 3100347:	e9 a5 00 00 00       	jmp    31003f1 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:157
		    }
		  else if (*input == '\\')
 310034c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310034f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100352:	3c 5c                	cmp    al,0x5c
 3100354:	75 0c                	jne    3100362 <buildargv+0x10c>
/home/yogi/src/os/kshell/kshell.c:159
		    {
		      bsquote = 1;
 3100356:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 310035d:	e9 8f 00 00 00       	jmp    31003f1 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:161
		    }
		  else if (squote)
 3100362:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100366:	74 26                	je     310038e <buildargv+0x138>
/home/yogi/src/os/kshell/kshell.c:163
		    {
		      if (*input == '\'')
 3100368:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310036b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310036e:	3c 27                	cmp    al,0x27
 3100370:	75 09                	jne    310037b <buildargv+0x125>
/home/yogi/src/os/kshell/kshell.c:165
			{
			  squote = 0;
 3100372:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100379:	eb 76                	jmp    31003f1 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:169
			}
		      else
			{
			  *arg++ = *input;
 310037b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310037e:	8d 50 01             	lea    edx,[eax+0x1]
 3100381:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100384:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100387:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310038a:	88 10                	mov    BYTE PTR [eax],dl
 310038c:	eb 63                	jmp    31003f1 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:172
			}
		    }
		  else if (dquote)
 310038e:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100392:	74 26                	je     31003ba <buildargv+0x164>
/home/yogi/src/os/kshell/kshell.c:174
		    {
		      if (*input == '"')
 3100394:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100397:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310039a:	3c 22                	cmp    al,0x22
 310039c:	75 09                	jne    31003a7 <buildargv+0x151>
/home/yogi/src/os/kshell/kshell.c:176
			{
			  dquote = 0;
 310039e:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 31003a5:	eb 4a                	jmp    31003f1 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:180
			}
		      else
			{
			  *arg++ = *input;
 31003a7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31003aa:	8d 50 01             	lea    edx,[eax+0x1]
 31003ad:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31003b0:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31003b3:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31003b6:	88 10                	mov    BYTE PTR [eax],dl
 31003b8:	eb 37                	jmp    31003f1 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:185
			}
		    }
		  else
		    {
		      if (*input == '\'')
 31003ba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003bd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003c0:	3c 27                	cmp    al,0x27
 31003c2:	75 09                	jne    31003cd <buildargv+0x177>
/home/yogi/src/os/kshell/kshell.c:187
			{
			  squote = 1;
 31003c4:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 31003cb:	eb 24                	jmp    31003f1 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:189
			}
		      else if (*input == '"')
 31003cd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003d0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003d3:	3c 22                	cmp    al,0x22
 31003d5:	75 09                	jne    31003e0 <buildargv+0x18a>
/home/yogi/src/os/kshell/kshell.c:191
			{
			  dquote = 1;
 31003d7:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 31003de:	eb 11                	jmp    31003f1 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:195
			}
		      else
			{
			  *arg++ = *input;
 31003e0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31003e3:	8d 50 01             	lea    edx,[eax+0x1]
 31003e6:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31003e9:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31003ec:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31003ef:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/kshell/kshell.c:199
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 31003f1:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/kshell/kshell.c:144
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 31003f5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003f8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003fb:	84 c0                	test   al,al
 31003fd:	0f 85 06 ff ff ff    	jne    3100309 <buildargv+0xb3>
/home/yogi/src/os/kshell/kshell.c:202
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 3100403:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100406:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:204
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100409:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310040c:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310040f:	84 c0                	test   al,al
 3100411:	0f 84 9e 00 00 00    	je     31004b5 <buildargv+0x25f>
/home/yogi/src/os/kshell/kshell.c:206
          {
            char* temp=malloc(strlen(copybuf)+1);
 3100417:	83 ec 0c             	sub    esp,0xc
 310041a:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310041d:	e8 de 05 00 00       	call   3100a00 <kShell+0x2c0>
 3100422:	83 c4 10             	add    esp,0x10
 3100425:	83 c0 01             	add    eax,0x1
 3100428:	83 ec 0c             	sub    esp,0xc
 310042b:	50                   	push   eax
 310042c:	e8 5f 05 00 00       	call   3100990 <kShell+0x250>
 3100431:	83 c4 10             	add    esp,0x10
 3100434:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/kshell/kshell.c:209
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 3100437:	83 ec 08             	sub    esp,0x8
 310043a:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310043d:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100440:	e8 fb 04 00 00       	call   3100940 <kShell+0x200>
 3100445:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:210
            free(copybuf);
 3100448:	83 ec 0c             	sub    esp,0xc
 310044b:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310044e:	e8 bd 05 00 00       	call   3100a10 <kShell+0x2d0>
 3100453:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:211
            copybuf = (char *) malloc (strlen (input) + 1);
 3100456:	83 ec 0c             	sub    esp,0xc
 3100459:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310045c:	e8 9f 05 00 00       	call   3100a00 <kShell+0x2c0>
 3100461:	83 c4 10             	add    esp,0x10
 3100464:	83 c0 01             	add    eax,0x1
 3100467:	83 ec 0c             	sub    esp,0xc
 310046a:	50                   	push   eax
 310046b:	e8 20 05 00 00       	call   3100990 <kShell+0x250>
 3100470:	83 c4 10             	add    esp,0x10
 3100473:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:212
            argv[argc] = temp;
 3100476:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100479:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100480:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100483:	01 c2                	add    edx,eax
 3100485:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 3100488:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/kshell/kshell.c:214
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 310048a:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/kshell/kshell.c:215
            argv[argc] = NULL;
 310048e:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100491:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100498:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 310049b:	01 d0                	add    eax,edx
 310049d:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:216
            input++;
 31004a3:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/kshell/kshell.c:217
            free(temp);
 31004a7:	83 ec 0c             	sub    esp,0xc
 31004aa:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 31004ad:	e8 5e 05 00 00       	call   3100a10 <kShell+0x2d0>
 31004b2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:220
          }
	}
      while (*input != EOS);
 31004b5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31004b8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31004bb:	84 c0                	test   al,al
 31004bd:	0f 85 ed fd ff ff    	jne    31002b0 <buildargv+0x5a>
/home/yogi/src/os/kshell/kshell.c:223
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 31004c3:	83 ec 0c             	sub    esp,0xc
 31004c6:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31004c9:	e8 42 05 00 00       	call   3100a10 <kShell+0x2d0>
 31004ce:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:224
  free(nargv);
 31004d1:	83 ec 0c             	sub    esp,0xc
 31004d4:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 31004d7:	e8 34 05 00 00       	call   3100a10 <kShell+0x2d0>
 31004dc:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:225
  return (argv);
 31004df:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/kshell/kshell.c:226
}
 31004e2:	c9                   	leave  
 31004e3:	c3                   	ret    

031004e4 <helpMe>:
helpMe():
/home/yogi/src/os/kshell/kshell.c:229

void helpMe()
{
 31004e4:	55                   	push   ebp
 31004e5:	89 e5                	mov    ebp,esp
 31004e7:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:230
    print("Help:\n");
 31004ea:	83 ec 0c             	sub    esp,0xc
 31004ed:	68 a4 0a 10 03       	push   0x3100aa4
 31004f2:	e8 69 04 00 00       	call   3100960 <kShell+0x220>
 31004f7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:231
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 31004fa:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100501:	eb 30                	jmp    3100533 <helpMe+0x4f>
/home/yogi/src/os/kshell/kshell.c:232 (discriminator 3)
        print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100503:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100506:	c1 e0 04             	shl    eax,0x4
 3100509:	05 a4 0f 10 03       	add    eax,0x3100fa4
 310050e:	8b 10                	mov    edx,DWORD PTR [eax]
 3100510:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100513:	c1 e0 04             	shl    eax,0x4
 3100516:	05 a0 0f 10 03       	add    eax,0x3100fa0
 310051b:	8b 00                	mov    eax,DWORD PTR [eax]
 310051d:	83 ec 04             	sub    esp,0x4
 3100520:	52                   	push   edx
 3100521:	50                   	push   eax
 3100522:	68 ab 0a 10 03       	push   0x3100aab
 3100527:	e8 34 04 00 00       	call   3100960 <kShell+0x220>
 310052c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:231 (discriminator 3)
}

void helpMe()
{
    print("Help:\n");
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 310052f:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:231 (discriminator 1)
 3100533:	83 7d f4 03          	cmp    DWORD PTR [ebp-0xc],0x3
 3100537:	76 ca                	jbe    3100503 <helpMe+0x1f>
/home/yogi/src/os/kshell/kshell.c:233
        print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
}
 3100539:	90                   	nop
 310053a:	c9                   	leave  
 310053b:	c3                   	ret    

0310053c <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/kshell/kshell.c:236

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH])
{
 310053c:	55                   	push   ebp
 310053d:	89 e5                	mov    ebp,esp
 310053f:	53                   	push   ebx
 3100540:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/kshell/kshell.c:237
    char** pptr=malloc(sizeof(char*)*pcount);
 3100543:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100546:	c1 e0 02             	shl    eax,0x2
 3100549:	83 ec 0c             	sub    esp,0xc
 310054c:	50                   	push   eax
 310054d:	e8 3e 04 00 00       	call   3100990 <kShell+0x250>
 3100552:	83 c4 10             	add    esp,0x10
 3100555:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:239
    
    for (int cnt=0;cnt<pcount;cnt++)
 3100558:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310055f:	eb 4e                	jmp    31005af <paramsToArgv+0x73>
/home/yogi/src/os/kshell/kshell.c:241 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 3100561:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100564:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 310056b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310056e:	8d 1c 02             	lea    ebx,[edx+eax*1]
 3100571:	83 ec 0c             	sub    esp,0xc
 3100574:	6a 32                	push   0x32
 3100576:	e8 15 04 00 00       	call   3100990 <kShell+0x250>
 310057b:	83 c4 10             	add    esp,0x10
 310057e:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/kshell/kshell.c:242 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 3100580:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100583:	6b d0 32             	imul   edx,eax,0x32
 3100586:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100589:	01 c2                	add    edx,eax
 310058b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310058e:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 3100595:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100598:	01 c8                	add    eax,ecx
 310059a:	8b 00                	mov    eax,DWORD PTR [eax]
 310059c:	83 ec 04             	sub    esp,0x4
 310059f:	6a 32                	push   0x32
 31005a1:	52                   	push   edx
 31005a2:	50                   	push   eax
 31005a3:	e8 d8 03 00 00       	call   3100980 <kShell+0x240>
 31005a8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:239 (discriminator 3)

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH])
{
    char** pptr=malloc(sizeof(char*)*pcount);
    
    for (int cnt=0;cnt<pcount;cnt++)
 31005ab:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:239 (discriminator 1)
 31005af:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005b2:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 31005b5:	7c aa                	jl     3100561 <paramsToArgv+0x25>
/home/yogi/src/os/kshell/kshell.c:244
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
 31005b7:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
/home/yogi/src/os/kshell/kshell.c:245
}
 31005ba:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31005bd:	c9                   	leave  
 31005be:	c3                   	ret    

031005bf <freeArgV>:
freeArgV():
/home/yogi/src/os/kshell/kshell.c:248

void freeArgV(int pcount, char **params)
{
 31005bf:	55                   	push   ebp
 31005c0:	89 e5                	mov    ebp,esp
 31005c2:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:249
    for (int cnt=0;cnt<pcount;cnt++)
 31005c5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31005cc:	eb 15                	jmp    31005e3 <freeArgV+0x24>
/home/yogi/src/os/kshell/kshell.c:250 (discriminator 3)
        free(*params);
 31005ce:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31005d1:	8b 00                	mov    eax,DWORD PTR [eax]
 31005d3:	83 ec 0c             	sub    esp,0xc
 31005d6:	50                   	push   eax
 31005d7:	e8 34 04 00 00       	call   3100a10 <kShell+0x2d0>
 31005dc:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:249 (discriminator 3)
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 31005df:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:249 (discriminator 1)
 31005e3:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005e6:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 31005e9:	7c e3                	jl     31005ce <freeArgV+0xf>
/home/yogi/src/os/kshell/kshell.c:251
        free(*params);
    free(params);
 31005eb:	83 ec 0c             	sub    esp,0xc
 31005ee:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31005f1:	e8 1a 04 00 00       	call   3100a10 <kShell+0x2d0>
 31005f6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:252
}
 31005f9:	90                   	nop
 31005fa:	c9                   	leave  
 31005fb:	c3                   	ret    

031005fc <execp>:
execp():
/home/yogi/src/os/kshell/kshell.c:255

void execp(char* cmdline)
{
 31005fc:	55                   	push   ebp
 31005fd:	89 e5                	mov    ebp,esp
 31005ff:	53                   	push   ebx
 3100600:	81 ec 04 02 00 00    	sub    esp,0x204
/home/yogi/src/os/kshell/kshell.c:257
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 3100606:	83 ec 04             	sub    esp,0x4
 3100609:	68 f4 01 00 00       	push   0x1f4
 310060e:	8d 85 f8 fd ff ff    	lea    eax,[ebp-0x208]
 3100614:	50                   	push   eax
 3100615:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100618:	e8 8e fa ff ff       	call   31000ab <parseParamsShell>
 310061d:	83 c4 10             	add    esp,0x10
 3100620:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:258
    uint32_t pid=0;
 3100623:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:260

    char** prms=(uint32_t)paramsToArgv(paramCount,&params[0][0]);
 310062a:	83 ec 08             	sub    esp,0x8
 310062d:	8d 85 f8 fd ff ff    	lea    eax,[ebp-0x208]
 3100633:	50                   	push   eax
 3100634:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100637:	e8 00 ff ff ff       	call   310053c <paramsToArgv>
 310063c:	83 c4 10             	add    esp,0x10
 310063f:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/kshell/kshell.c:263
    
    //print("Executing %s\n",params[0]);
    __asm__("push eax\n"
 3100642:	b8 59 00 00 00       	mov    eax,0x59
 3100647:	8d 9d f8 fd ff ff    	lea    ebx,[ebp-0x208]
 310064d:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
 3100650:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
 3100653:	50                   	push   eax
 3100654:	53                   	push   ebx
 3100655:	51                   	push   ecx
 3100656:	52                   	push   edx
 3100657:	cd 80                	int    0x80
 3100659:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:271
            "push edx\n"
            "int 0x80\n"
            :"=a" (pid)
            :"a" (0x59),"b" (params[0]),"c" (paramCount),"d" (prms));
    //print("Waiting on pid=0x%08X\n",pid);
    waitpid(pid);
 310065c:	83 ec 0c             	sub    esp,0xc
 310065f:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100662:	e8 e9 02 00 00       	call   3100950 <kShell+0x210>
 3100667:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:275
    //print("pid=0x%08X returned\n",pid);
    //exec(params[0],0,0);
    //strcpy(sExecutingProgram,params[0]+1);
    freeArgV(paramCount, (char**)prms);
 310066a:	83 ec 08             	sub    esp,0x8
 310066d:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100670:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100673:	e8 47 ff ff ff       	call   31005bf <freeArgV>
 3100678:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:276
}
 310067b:	90                   	nop
 310067c:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 310067f:	c9                   	leave  
 3100680:	c3                   	ret    

03100681 <kSleep>:
kSleep():
/home/yogi/src/os/kshell/kshell.c:279

void kSleep(char *cmdline)
{
 3100681:	55                   	push   ebp
 3100682:	89 e5                	mov    ebp,esp
 3100684:	81 ec 08 02 00 00    	sub    esp,0x208
/home/yogi/src/os/kshell/kshell.c:281
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 310068a:	83 ec 04             	sub    esp,0x4
 310068d:	68 f4 01 00 00       	push   0x1f4
 3100692:	8d 85 00 fe ff ff    	lea    eax,[ebp-0x200]
 3100698:	50                   	push   eax
 3100699:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310069c:	e8 0a fa ff ff       	call   31000ab <parseParamsShell>
 31006a1:	83 c4 10             	add    esp,0x10
 31006a4:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:283

    if (params[0][0]==0)
 31006a7:	0f b6 85 00 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x200]
 31006ae:	84 c0                	test   al,al
 31006b0:	75 12                	jne    31006c4 <kSleep+0x43>
/home/yogi/src/os/kshell/kshell.c:285
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 31006b2:	83 ec 0c             	sub    esp,0xc
 31006b5:	68 b4 0a 10 03       	push   0x3100ab4
 31006ba:	e8 a1 02 00 00       	call   3100960 <kShell+0x220>
 31006bf:	83 c4 10             	add    esp,0x10
 31006c2:	eb 22                	jmp    31006e6 <kSleep+0x65>
/home/yogi/src/os/kshell/kshell.c:289
        return;
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 31006c4:	83 ec 04             	sub    esp,0x4
 31006c7:	6a 0a                	push   0xa
 31006c9:	6a 00                	push   0x0
 31006cb:	8d 85 00 fe ff ff    	lea    eax,[ebp-0x200]
 31006d1:	50                   	push   eax
 31006d2:	e8 d9 02 00 00       	call   31009b0 <kShell+0x270>
 31006d7:	83 c4 10             	add    esp,0x10
 31006da:	83 ec 0c             	sub    esp,0xc
 31006dd:	50                   	push   eax
 31006de:	e8 bd 02 00 00       	call   31009a0 <kShell+0x260>
 31006e3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:290
}
 31006e6:	c9                   	leave  
 31006e7:	c3                   	ret    

031006e8 <kExit>:
kExit():
/home/yogi/src/os/kshell/kshell.c:293

void kExit(char *cmdline)
{
 31006e8:	55                   	push   ebp
 31006e9:	89 e5                	mov    ebp,esp
 31006eb:	81 ec 08 02 00 00    	sub    esp,0x208
/home/yogi/src/os/kshell/kshell.c:296
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 31006f1:	83 ec 04             	sub    esp,0x4
 31006f4:	68 f4 01 00 00       	push   0x1f4
 31006f9:	8d 85 04 fe ff ff    	lea    eax,[ebp-0x1fc]
 31006ff:	50                   	push   eax
 3100700:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100703:	e8 a3 f9 ff ff       	call   31000ab <parseParamsShell>
 3100708:	83 c4 10             	add    esp,0x10
 310070b:	85 c0                	test   eax,eax
 310070d:	74 1d                	je     310072c <kExit+0x44>
/home/yogi/src/os/kshell/kshell.c:298
    {
        exitCode = strtoul(params[0],0,10);
 310070f:	83 ec 04             	sub    esp,0x4
 3100712:	6a 0a                	push   0xa
 3100714:	6a 00                	push   0x0
 3100716:	8d 85 04 fe ff ff    	lea    eax,[ebp-0x1fc]
 310071c:	50                   	push   eax
 310071d:	e8 8e 02 00 00       	call   31009b0 <kShell+0x270>
 3100722:	83 c4 10             	add    esp,0x10
 3100725:	a3 c4 10 10 03       	mov    ds:0x31010c4,eax
 310072a:	eb 0a                	jmp    3100736 <kExit+0x4e>
/home/yogi/src/os/kshell/kshell.c:301
    }
    else
        exitCode = 0;
 310072c:	c7 05 c4 10 10 03 00 	mov    DWORD PTR ds:0x31010c4,0x0
 3100733:	00 00 00 
/home/yogi/src/os/kshell/kshell.c:302
    timeToExit=true;
 3100736:	c6 05 c0 10 10 03 01 	mov    BYTE PTR ds:0x31010c0,0x1
/home/yogi/src/os/kshell/kshell.c:303
}
 310073d:	90                   	nop
 310073e:	c9                   	leave  
 310073f:	c3                   	ret    

03100740 <kShell>:
kShell():
/home/yogi/src/os/kshell/kshell.c:306

int kShell(int argc, char** argv)
{
 3100740:	55                   	push   ebp
 3100741:	89 e5                	mov    ebp,esp
 3100743:	81 ec f8 0a 00 00    	sub    esp,0xaf8
/home/yogi/src/os/kshell/kshell.c:308
    char lCommand[256];
    uint8_t lCurrKey=0;
 3100749:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:309
    int lCurrKeyCount=0;
 3100750:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/kshell/kshell.c:311
    char commands[50][50];
    int commandsPtr=0;
 3100757:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:312
    int commandBuffPtr=0;
 310075e:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/kshell/kshell.c:313
    int commandWasFromThisBufferPtr=0;
 3100765:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:316
    char ansiSeq[20];

    libc_init();
 310076c:	e8 4f 02 00 00       	call   31009c0 <kShell+0x280>
/home/yogi/src/os/kshell/kshell.c:317
    ansiSeq[0]=0x1b;
 3100771:	c6 85 0b f5 ff ff 1b 	mov    BYTE PTR [ebp-0xaf5],0x1b
/home/yogi/src/os/kshell/kshell.c:318
    sKShellProgramName=malloc(1024);
 3100778:	83 ec 0c             	sub    esp,0xc
 310077b:	68 00 04 00 00       	push   0x400
 3100780:	e8 0b 02 00 00       	call   3100990 <kShell+0x250>
 3100785:	83 c4 10             	add    esp,0x10
 3100788:	a3 f4 12 10 03       	mov    ds:0x31012f4,eax
/home/yogi/src/os/kshell/kshell.c:319
    strcpy(sKShellProgramName,"kShell");
 310078d:	a1 f4 12 10 03       	mov    eax,ds:0x31012f4
 3100792:	83 ec 08             	sub    esp,0x8
 3100795:	68 f2 0a 10 03       	push   0x3100af2
 310079a:	50                   	push   eax
 310079b:	e8 a0 01 00 00       	call   3100940 <kShell+0x200>
 31007a0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:320
    strcpy(sExecutingProgram,sKShellProgramName);
 31007a3:	a1 f4 12 10 03       	mov    eax,ds:0x31012f4
 31007a8:	83 ec 08             	sub    esp,0x8
 31007ab:	50                   	push   eax
 31007ac:	68 e0 10 10 03       	push   0x31010e0
 31007b1:	e8 8a 01 00 00       	call   3100940 <kShell+0x200>
 31007b6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:323
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 31007b9:	e9 51 01 00 00       	jmp    310090f <kShell+0x1cf>
/home/yogi/src/os/kshell/kshell.c:326
    {
getACommand:
        lCurrKey=0;
 31007be:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:327
        lCurrKeyCount=0;
 31007c5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/kshell/kshell.c:328
        memset(lCommand,0,256);
 31007cc:	83 ec 04             	sub    esp,0x4
 31007cf:	68 00 01 00 00       	push   0x100
 31007d4:	6a 00                	push   0x0
 31007d6:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 31007dc:	50                   	push   eax
 31007dd:	e8 fe 01 00 00       	call   31009e0 <kShell+0x2a0>
 31007e2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:329
        print("%s> ",sExecutingProgram);
 31007e5:	83 ec 08             	sub    esp,0x8
 31007e8:	68 e0 10 10 03       	push   0x31010e0
 31007ed:	68 f9 0a 10 03       	push   0x3100af9
 31007f2:	e8 69 01 00 00       	call   3100960 <kShell+0x220>
 31007f7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:331
getAKey:
        lCurrKey=0;
 31007fa:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:332
        while(lCurrKey==0)
 3100801:	eb 16                	jmp    3100819 <kShell+0xd9>
/home/yogi/src/os/kshell/kshell.c:334
        {
            gets(&lCurrKey,1,1);
 3100803:	83 ec 04             	sub    esp,0x4
 3100806:	6a 01                	push   0x1
 3100808:	6a 01                	push   0x1
 310080a:	8d 85 e3 fe ff ff    	lea    eax,[ebp-0x11d]
 3100810:	50                   	push   eax
 3100811:	e8 5a 01 00 00       	call   3100970 <kShell+0x230>
 3100816:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:332
        lCurrKeyCount=0;
        memset(lCommand,0,256);
        print("%s> ",sExecutingProgram);
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 3100819:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100820:	84 c0                	test   al,al
 3100822:	74 df                	je     3100803 <kShell+0xc3>
/home/yogi/src/os/kshell/kshell.c:337
        {
            gets(&lCurrKey,1,1);
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 3100824:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 310082b:	3c c8                	cmp    al,0xc8
 310082d:	75 08                	jne    3100837 <kShell+0xf7>
/home/yogi/src/os/kshell/kshell.c:339
        {
            if (commandBuffPtr>=0)
 310082f:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100833:	79 02                	jns    3100837 <kShell+0xf7>
/home/yogi/src/os/kshell/kshell.c:352
                lCurrKeyCount=strlen(lCommand);
                cursorMoveTo(4+lCurrKeyCount,lTemp);
                goto getAKey;*/
            }
            else
                goto getAKey;
 3100835:	eb c3                	jmp    31007fa <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:354
        }
        if (lCurrKey==0xD0)  //down
 3100837:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 310083e:	3c d0                	cmp    al,0xd0
 3100840:	75 0a                	jne    310084c <kShell+0x10c>
/home/yogi/src/os/kshell/kshell.c:356
        {
            if (commandBuffPtr<=commandsPtr)
 3100842:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100845:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 3100848:	7e 02                	jle    310084c <kShell+0x10c>
/home/yogi/src/os/kshell/kshell.c:369
                lCurrKeyCount=strlen(lCommand);
                cursorMoveTo(4+lCurrKeyCount,lTemp);
                goto getAKey;*/
            }
            else
                goto getAKey;
 310084a:	eb ae                	jmp    31007fa <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:372
            
        }   
        if (lCurrKey==0xcb) //left
 310084c:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100853:	3c cb                	cmp    al,0xcb
 3100855:	75 02                	jne    3100859 <kShell+0x119>
/home/yogi/src/os/kshell/kshell.c:381
            {
                cursorMoveTo(cursorGetPosX()-1,cursorGetPosY());
                lCurrKeyCount--;
            }
             */
            goto getAKey;
 3100857:	eb a1                	jmp    31007fa <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:383
        }
        if (lCurrKey=='\b')
 3100859:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100860:	3c 08                	cmp    al,0x8
 3100862:	75 15                	jne    3100879 <kShell+0x139>
/home/yogi/src/os/kshell/kshell.c:385
        {
            if (lCurrKeyCount>0)
 3100864:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100868:	7e 90                	jle    31007fa <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:387
            {
                putc('\b');
 310086a:	83 ec 0c             	sub    esp,0xc
 310086d:	6a 08                	push   0x8
 310086f:	e8 7c 01 00 00       	call   31009f0 <kShell+0x2b0>
 3100874:	83 c4 10             	add    esp,0x10
 3100877:	eb 81                	jmp    31007fa <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:399
                cursorMoveTo(cursorGetPosX()-1,lTemp);*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
 3100879:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100880:	3c 0a                	cmp    al,0xa
 3100882:	74 1c                	je     31008a0 <kShell+0x160>
/home/yogi/src/os/kshell/kshell.c:405
        {
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3100884:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100887:	8d 50 01             	lea    edx,[eax+0x1]
 310088a:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310088d:	0f b6 95 e3 fe ff ff 	movzx  edx,BYTE PTR [ebp-0x11d]
 3100894:	88 94 05 e4 fe ff ff 	mov    BYTE PTR [ebp+eax*1-0x11c],dl
/home/yogi/src/os/kshell/kshell.c:407
        }
        goto getAKey;
 310089b:	e9 5a ff ff ff       	jmp    31007fa <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:401
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
        {
            goto doneGettingKeys;
 31008a0:	90                   	nop
/home/yogi/src/os/kshell/kshell.c:410
            lCommand[lCurrKeyCount++]=lCurrKey;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 31008a1:	0f b6 85 e4 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11c]
 31008a8:	84 c0                	test   al,al
 31008aa:	75 05                	jne    31008b1 <kShell+0x171>
/home/yogi/src/os/kshell/kshell.c:411
            goto getACommand;
 31008ac:	e9 0d ff ff ff       	jmp    31007be <kShell+0x7e>
/home/yogi/src/os/kshell/kshell.c:412
        int i = findCommand(lCommand);
 31008b1:	83 ec 0c             	sub    esp,0xc
 31008b4:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 31008ba:	50                   	push   eax
 31008bb:	e8 2d f9 ff ff       	call   31001ed <findCommand>
 31008c0:	83 c4 10             	add    esp,0x10
 31008c3:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/kshell/kshell.c:414

        execInternalCommand(lCommand);
 31008c6:	83 ec 0c             	sub    esp,0xc
 31008c9:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 31008cf:	50                   	push   eax
 31008d0:	e8 2b f7 ff ff       	call   3100000 <execInternalCommand>
 31008d5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:415
        if(i>0)
 31008d8:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 31008dc:	7e 31                	jle    310090f <kShell+0x1cf>
/home/yogi/src/os/kshell/kshell.c:417
        {
            i--;
 31008de:	83 6d e4 01          	sub    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/kshell/kshell.c:426
//                for (int cnt=commandWasFromThisBufferPtr;cnt<=commandsPtr;cnt++)
//                    strcpy(commands[cnt],commands[cnt+1]);
//                commandWasFromThisBufferPtr=0;
//                commandsPtr--;
            }
            strcpy(commands[commandsPtr++],lCommand);
 31008e2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31008e5:	8d 50 01             	lea    edx,[eax+0x1]
 31008e8:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 31008eb:	8d 95 1f f5 ff ff    	lea    edx,[ebp-0xae1]
 31008f1:	6b c0 32             	imul   eax,eax,0x32
 31008f4:	01 c2                	add    edx,eax
 31008f6:	83 ec 08             	sub    esp,0x8
 31008f9:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 31008ff:	50                   	push   eax
 3100900:	52                   	push   edx
 3100901:	e8 3a 00 00 00       	call   3100940 <kShell+0x200>
 3100906:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:427
            commandBuffPtr=commandsPtr;
 3100909:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310090c:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/kshell/kshell.c:323
    sKShellProgramName=malloc(1024);
    strcpy(sKShellProgramName,"kShell");
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 310090f:	0f b6 05 c0 10 10 03 	movzx  eax,BYTE PTR ds:0x31010c0
 3100916:	83 f0 01             	xor    eax,0x1
 3100919:	84 c0                	test   al,al
 310091b:	0f 85 9d fe ff ff    	jne    31007be <kShell+0x7e>
/home/yogi/src/os/kshell/kshell.c:430
            }
            strcpy(commands[commandsPtr++],lCommand);
            commandBuffPtr=commandsPtr;
        }
    }
    return exitCode;
 3100921:	a1 c4 10 10 03       	mov    eax,ds:0x31010c4
/home/yogi/src/os/kshell/kshell.c:431
}
 3100926:	c9                   	leave  
 3100927:	c3                   	ret    

Disassembly of section .plt:

03100930 <.plt>:
 3100930:	ff 35 74 10 10 03    	push   DWORD PTR ds:0x3101074
 3100936:	ff 25 78 10 10 03    	jmp    DWORD PTR ds:0x3101078
 310093c:	00 00                	add    BYTE PTR [eax],al
 310093e:	00 00                	add    BYTE PTR [eax],al
 3100940:	ff 25 7c 10 10 03    	jmp    DWORD PTR ds:0x310107c
 3100946:	68 00 00 00 00       	push   0x0
 310094b:	e9 e0 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 3100950:	ff 25 80 10 10 03    	jmp    DWORD PTR ds:0x3101080
 3100956:	68 08 00 00 00       	push   0x8
 310095b:	e9 d0 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 3100960:	ff 25 84 10 10 03    	jmp    DWORD PTR ds:0x3101084
 3100966:	68 10 00 00 00       	push   0x10
 310096b:	e9 c0 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 3100970:	ff 25 88 10 10 03    	jmp    DWORD PTR ds:0x3101088
 3100976:	68 18 00 00 00       	push   0x18
 310097b:	e9 b0 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 3100980:	ff 25 8c 10 10 03    	jmp    DWORD PTR ds:0x310108c
 3100986:	68 20 00 00 00       	push   0x20
 310098b:	e9 a0 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 3100990:	ff 25 90 10 10 03    	jmp    DWORD PTR ds:0x3101090
 3100996:	68 28 00 00 00       	push   0x28
 310099b:	e9 90 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 31009a0:	ff 25 94 10 10 03    	jmp    DWORD PTR ds:0x3101094
 31009a6:	68 30 00 00 00       	push   0x30
 31009ab:	e9 80 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 31009b0:	ff 25 98 10 10 03    	jmp    DWORD PTR ds:0x3101098
 31009b6:	68 38 00 00 00       	push   0x38
 31009bb:	e9 70 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 31009c0:	ff 25 9c 10 10 03    	jmp    DWORD PTR ds:0x310109c
 31009c6:	68 40 00 00 00       	push   0x40
 31009cb:	e9 60 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 31009d0:	ff 25 a0 10 10 03    	jmp    DWORD PTR ds:0x31010a0
 31009d6:	68 48 00 00 00       	push   0x48
 31009db:	e9 50 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 31009e0:	ff 25 a4 10 10 03    	jmp    DWORD PTR ds:0x31010a4
 31009e6:	68 50 00 00 00       	push   0x50
 31009eb:	e9 40 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 31009f0:	ff 25 a8 10 10 03    	jmp    DWORD PTR ds:0x31010a8
 31009f6:	68 58 00 00 00       	push   0x58
 31009fb:	e9 30 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 3100a00:	ff 25 ac 10 10 03    	jmp    DWORD PTR ds:0x31010ac
 3100a06:	68 60 00 00 00       	push   0x60
 3100a0b:	e9 20 ff ff ff       	jmp    3100930 <kShell+0x1f0>
 3100a10:	ff 25 b0 10 10 03    	jmp    DWORD PTR ds:0x31010b0
 3100a16:	68 68 00 00 00       	push   0x68
 3100a1b:	e9 10 ff ff ff       	jmp    3100930 <kShell+0x1f0>

Disassembly of section .rodata:

03100a20 <.rodata>:
 3100a20:	68 65 6c 70 00       	push   0x706c65
 3100a25:	47                   	inc    edi
 3100a26:	65                   	gs
 3100a27:	74 20                	je     3100a49 <kShell+0x309>
 3100a29:	68 65 6c 70 20       	push   0x20706c65
 3100a2e:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3100a32:	73 20                	jae    3100a54 <kShell+0x314>
 3100a34:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3100a3b:	74 69                	je     3100aa6 <kShell+0x366>
 3100a3d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100a3e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100a3f:	29 00                	sub    DWORD PTR [eax],eax
 3100a41:	65                   	gs
 3100a42:	78 65                	js     3100aa9 <kShell+0x369>
 3100a44:	63 00                	arpl   WORD PTR [eax],ax
 3100a46:	45                   	inc    ebp
 3100a47:	78 65                	js     3100aae <kShell+0x36e>
 3100a49:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3100a4c:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3100a50:	70 72                	jo     3100ac4 <kShell+0x384>
 3100a52:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100a53:	67 72 61             	addr16 jb 3100ab7 <kShell+0x377>
 3100a56:	6d                   	ins    DWORD PTR es:[edi],dx
 3100a57:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3100a5a:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 3100a61:	20 
 3100a62:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3100a66:	6c                   	ins    BYTE PTR es:[edi],dx
 3100a67:	6c                   	ins    BYTE PTR es:[edi],dx
 3100a68:	00 73 6c             	add    BYTE PTR [ebx+0x6c],dh
 3100a6b:	65                   	gs
 3100a6c:	65                   	gs
 3100a6d:	70 00                	jo     3100a6f <kShell+0x32f>
 3100a6f:	53                   	push   ebx
 3100a70:	6c                   	ins    BYTE PTR es:[edi],dx
 3100a71:	65                   	gs
 3100a72:	65                   	gs
 3100a73:	70 20                	jo     3100a95 <kShell+0x355>
 3100a75:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3100a77:	72 20                	jb     3100a99 <kShell+0x359>
 3100a79:	78 20                	js     3100a9b <kShell+0x35b>
 3100a7b:	73 65                	jae    3100ae2 <kShell+0x3a2>
 3100a7d:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100a80:	64                   	fs
 3100a81:	73 00                	jae    3100a83 <kShell+0x343>
 3100a83:	00 49 6e             	add    BYTE PTR [ecx+0x6e],cl
 3100a86:	76 61                	jbe    3100ae9 <kShell+0x3a9>
 3100a88:	6c                   	ins    BYTE PTR es:[edi],dx
 3100a89:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 3100a90:	61 
 3100a91:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100a92:	64 20 27             	and    BYTE PTR fs:[edi],ah
 3100a95:	25 73 27 20 79       	and    eax,0x79202773
 3100a9a:	61                   	popa   
 3100a9b:	20 64 75 6d          	and    BYTE PTR [ebp+esi*2+0x6d],ah
 3100a9f:	6d                   	ins    DWORD PTR es:[edi],dx
 3100aa0:	79 21                	jns    3100ac3 <kShell+0x383>
 3100aa2:	0a 00                	or     al,BYTE PTR [eax]
 3100aa4:	48                   	dec    eax
 3100aa5:	65                   	gs
 3100aa6:	6c                   	ins    BYTE PTR es:[edi],dx
 3100aa7:	70 3a                	jo     3100ae3 <kShell+0x3a3>
 3100aa9:	0a 00                	or     al,BYTE PTR [eax]
 3100aab:	09 25 73 3a 20 25    	or     DWORD PTR ds:0x25203a73,esp
 3100ab1:	73 0a                	jae    3100abd <kShell+0x37d>
 3100ab3:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 3100ab6:	71 75                	jno    3100b2d <kShell+0x3ed>
 3100ab8:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 3100abf:	70 61                	jo     3100b22 <kShell+0x3e2>
 3100ac1:	72 61                	jb     3100b24 <kShell+0x3e4>
 3100ac3:	6d                   	ins    DWORD PTR es:[edi],dx
 3100ac4:	65                   	gs
 3100ac5:	74 65                	je     3100b2c <kShell+0x3ec>
 3100ac7:	72 20                	jb     3100ae9 <kShell+0x3a9>
 3100ac9:	77 68                	ja     3100b33 <kShell+0x3f3>
 3100acb:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 3100ad2:	74 68                	je     3100b3c <kShell+0x3fc>
 3100ad4:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 3100ad8:	6d                   	ins    DWORD PTR es:[edi],dx
 3100ad9:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 3100adc:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 3100adf:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 3100ae2:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100ae5:	64                   	fs
 3100ae6:	73 20                	jae    3100b08 <kShell+0x3c8>
 3100ae8:	74 6f                	je     3100b59 <kShell+0x419>
 3100aea:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3100aed:	65                   	gs
 3100aee:	65                   	gs
 3100aef:	70 0a                	jo     3100afb <kShell+0x3bb>
 3100af1:	00 6b 53             	add    BYTE PTR [ebx+0x53],ch
 3100af4:	68 65 6c 6c 00       	push   0x6c6c65
 3100af9:	25 73 3e 20 00       	and    eax,0x203e73

Disassembly of section .eh_frame:

03100b00 <.eh_frame>:
 3100b00:	14 00                	adc    al,0x0
 3100b02:	00 00                	add    BYTE PTR [eax],al
 3100b04:	00 00                	add    BYTE PTR [eax],al
 3100b06:	00 00                	add    BYTE PTR [eax],al
 3100b08:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3100b0b:	00 01                	add    BYTE PTR [ecx],al
 3100b0d:	7c 08                	jl     3100b17 <kShell+0x3d7>
 3100b0f:	01 1b                	add    DWORD PTR [ebx],ebx
 3100b11:	0c 04                	or     al,0x4
 3100b13:	04 88                	add    al,0x88
 3100b15:	01 00                	add    DWORD PTR [eax],eax
 3100b17:	00 20                	add    BYTE PTR [eax],ah
 3100b19:	00 00                	add    BYTE PTR [eax],al
 3100b1b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100b1e:	00 00                	add    BYTE PTR [eax],al
 3100b20:	e0 f4                	loopne 3100b16 <kShell+0x3d6>
 3100b22:	ff                   	(bad)  
 3100b23:	ff ab 00 00 00 00    	jmp    FWORD PTR [ebx+0x0]
 3100b29:	41                   	inc    ecx
 3100b2a:	0e                   	push   cs
 3100b2b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100b31:	44                   	inc    esp
 3100b32:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100b35:	a3 c5 c3 0c 04       	mov    ds:0x40cc3c5,eax
 3100b3a:	04 00                	add    al,0x0
 3100b3c:	20 00                	and    BYTE PTR [eax],al
 3100b3e:	00 00                	add    BYTE PTR [eax],al
 3100b40:	40                   	inc    eax
 3100b41:	00 00                	add    BYTE PTR [eax],al
 3100b43:	00 67 f5             	add    BYTE PTR [edi-0xb],ah
 3100b46:	ff                   	(bad)  
 3100b47:	ff 42 01             	inc    DWORD PTR [edx+0x1]
 3100b4a:	00 00                	add    BYTE PTR [eax],al
 3100b4c:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100b4f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100b55:	44                   	inc    esp
 3100b56:	83 03 03             	add    DWORD PTR [ebx],0x3
 3100b59:	3a 01                	cmp    al,BYTE PTR [ecx]
 3100b5b:	c5 c3 0c             	(bad)  
 3100b5e:	04 04                	add    al,0x4
 3100b60:	1c 00                	sbb    al,0x0
 3100b62:	00 00                	add    BYTE PTR [eax],al
 3100b64:	64 00 00             	add    BYTE PTR fs:[eax],al
 3100b67:	00 85 f6 ff ff 69    	add    BYTE PTR [ebp+0x69fffff6],al
 3100b6d:	00 00                	add    BYTE PTR [eax],al
 3100b6f:	00 00                	add    BYTE PTR [eax],al
 3100b71:	41                   	inc    ecx
 3100b72:	0e                   	push   cs
 3100b73:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100b79:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3100b7c:	0c 04                	or     al,0x4
 3100b7e:	04 00                	add    al,0x0
 3100b80:	1c 00                	sbb    al,0x0
 3100b82:	00 00                	add    BYTE PTR [eax],al
 3100b84:	84 00                	test   BYTE PTR [eax],al
 3100b86:	00 00                	add    BYTE PTR [eax],al
 3100b88:	ce                   	into   
 3100b89:	f6 ff                	idiv   bh
 3100b8b:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 3100b91:	41                   	inc    ecx
 3100b92:	0e                   	push   cs
 3100b93:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100b99:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 3100b9f:	04 1c                	add    al,0x1c
 3100ba1:	00 00                	add    BYTE PTR [eax],al
 3100ba3:	00 a4 00 00 00 3c f9 	add    BYTE PTR [eax+eax*1-0x6c40000],ah
 3100baa:	ff                   	(bad)  
 3100bab:	ff 58 00             	call   FWORD PTR [eax+0x0]
 3100bae:	00 00                	add    BYTE PTR [eax],al
 3100bb0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100bb3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100bb9:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3100bbd:	04 04                	add    al,0x4
 3100bbf:	00 20                	add    BYTE PTR [eax],ah
 3100bc1:	00 00                	add    BYTE PTR [eax],al
 3100bc3:	00 c4                	add    ah,al
 3100bc5:	00 00                	add    BYTE PTR [eax],al
 3100bc7:	00 74 f9 ff          	add    BYTE PTR [ecx+edi*8-0x1],dh
 3100bcb:	ff 83 00 00 00 00    	inc    DWORD PTR [ebx+0x0]
 3100bd1:	41                   	inc    ecx
 3100bd2:	0e                   	push   cs
 3100bd3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100bd9:	44                   	inc    esp
 3100bda:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100bdd:	7b c5                	jnp    3100ba4 <kShell+0x464>
 3100bdf:	c3                   	ret    
 3100be0:	0c 04                	or     al,0x4
 3100be2:	04 00                	add    al,0x0
 3100be4:	1c 00                	sbb    al,0x0
 3100be6:	00 00                	add    BYTE PTR [eax],al
 3100be8:	e8 00 00 00 d3       	call   d6100bed <sKShellProgramName+0xd2fff8f9>
 3100bed:	f9                   	stc    
 3100bee:	ff                   	(bad)  
 3100bef:	ff                   	(bad)  
 3100bf0:	3d 00 00 00 00       	cmp    eax,0x0
 3100bf5:	41                   	inc    ecx
 3100bf6:	0e                   	push   cs
 3100bf7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100bfd:	79 c5                	jns    3100bc4 <kShell+0x484>
 3100bff:	0c 04                	or     al,0x4
 3100c01:	04 00                	add    al,0x0
 3100c03:	00 20                	add    BYTE PTR [eax],ah
 3100c05:	00 00                	add    BYTE PTR [eax],al
 3100c07:	00 08                	add    BYTE PTR [eax],cl
 3100c09:	01 00                	add    DWORD PTR [eax],eax
 3100c0b:	00 f0                	add    al,dh
 3100c0d:	f9                   	stc    
 3100c0e:	ff                   	(bad)  
 3100c0f:	ff 85 00 00 00 00    	inc    DWORD PTR [ebp+0x0]
 3100c15:	41                   	inc    ecx
 3100c16:	0e                   	push   cs
 3100c17:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c1d:	47                   	inc    edi
 3100c1e:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100c21:	7a c5                	jp     3100be8 <kShell+0x4a8>
 3100c23:	c3                   	ret    
 3100c24:	0c 04                	or     al,0x4
 3100c26:	04 00                	add    al,0x0
 3100c28:	1c 00                	sbb    al,0x0
 3100c2a:	00 00                	add    BYTE PTR [eax],al
 3100c2c:	2c 01                	sub    al,0x1
 3100c2e:	00 00                	add    BYTE PTR [eax],al
 3100c30:	51                   	push   ecx
 3100c31:	fa                   	cli    
 3100c32:	ff                   	(bad)  
 3100c33:	ff 67 00             	jmp    DWORD PTR [edi+0x0]
 3100c36:	00 00                	add    BYTE PTR [eax],al
 3100c38:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100c3b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c41:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
 3100c44:	0c 04                	or     al,0x4
 3100c46:	04 00                	add    al,0x0
 3100c48:	1c 00                	sbb    al,0x0
 3100c4a:	00 00                	add    BYTE PTR [eax],al
 3100c4c:	4c                   	dec    esp
 3100c4d:	01 00                	add    DWORD PTR [eax],eax
 3100c4f:	00 98 fa ff ff 58    	add    BYTE PTR [eax+0x58fffffa],bl
 3100c55:	00 00                	add    BYTE PTR [eax],al
 3100c57:	00 00                	add    BYTE PTR [eax],al
 3100c59:	41                   	inc    ecx
 3100c5a:	0e                   	push   cs
 3100c5b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c61:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3100c65:	04 04                	add    al,0x4
 3100c67:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100c6a:	00 00                	add    BYTE PTR [eax],al
 3100c6c:	6c                   	ins    BYTE PTR es:[edi],dx
 3100c6d:	01 00                	add    DWORD PTR [eax],eax
 3100c6f:	00 d0                	add    al,dl
 3100c71:	fa                   	cli    
 3100c72:	ff                   	(bad)  
 3100c73:	ff e8                	jmp    <internal disassembler error>
 3100c75:	01 00                	add    DWORD PTR [eax],eax
 3100c77:	00 00                	add    BYTE PTR [eax],al
 3100c79:	41                   	inc    ecx
 3100c7a:	0e                   	push   cs
 3100c7b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c81:	03 e4                	add    esp,esp
 3100c83:	01 c5                	add    ebp,eax
 3100c85:	0c 04                	or     al,0x4
 3100c87:	04                   	.byte 0x4

Disassembly of section .interp:

03100c88 <.interp>:
 3100c88:	2f                   	das    
 3100c89:	6c                   	ins    BYTE PTR es:[edi],dx
 3100c8a:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3100c91:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3100c98:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03100c9c <.dynsym>:
	...
 3100cac:	09 00                	or     DWORD PTR [eax],eax
	...
 3100cb6:	00 00                	add    BYTE PTR [eax],al
 3100cb8:	12 00                	adc    al,BYTE PTR [eax]
 3100cba:	00 00                	add    BYTE PTR [eax],al
 3100cbc:	10 00                	adc    BYTE PTR [eax],al
	...
 3100cc6:	00 00                	add    BYTE PTR [eax],al
 3100cc8:	12 00                	adc    al,BYTE PTR [eax]
 3100cca:	00 00                	add    BYTE PTR [eax],al
 3100ccc:	18 00                	sbb    BYTE PTR [eax],al
	...
 3100cd6:	00 00                	add    BYTE PTR [eax],al
 3100cd8:	12 00                	adc    al,BYTE PTR [eax]
 3100cda:	00 00                	add    BYTE PTR [eax],al
 3100cdc:	1e                   	push   ds
	...
 3100ce5:	00 00                	add    BYTE PTR [eax],al
 3100ce7:	00 12                	add    BYTE PTR [edx],dl
 3100ce9:	00 00                	add    BYTE PTR [eax],al
 3100ceb:	00 23                	add    BYTE PTR [ebx],ah
	...
 3100cf5:	00 00                	add    BYTE PTR [eax],al
 3100cf7:	00 12                	add    BYTE PTR [edx],dl
 3100cf9:	00 00                	add    BYTE PTR [eax],al
 3100cfb:	00 2a                	add    BYTE PTR [edx],ch
	...
 3100d05:	00 00                	add    BYTE PTR [eax],al
 3100d07:	00 12                	add    BYTE PTR [edx],dl
 3100d09:	00 00                	add    BYTE PTR [eax],al
 3100d0b:	00 31                	add    BYTE PTR [ecx],dh
	...
 3100d15:	00 00                	add    BYTE PTR [eax],al
 3100d17:	00 12                	add    BYTE PTR [edx],dl
 3100d19:	00 00                	add    BYTE PTR [eax],al
 3100d1b:	00 37                	add    BYTE PTR [edi],dh
	...
 3100d25:	00 00                	add    BYTE PTR [eax],al
 3100d27:	00 12                	add    BYTE PTR [edx],dl
 3100d29:	00 00                	add    BYTE PTR [eax],al
 3100d2b:	00 3f                	add    BYTE PTR [edi],bh
	...
 3100d35:	00 00                	add    BYTE PTR [eax],al
 3100d37:	00 12                	add    BYTE PTR [edx],dl
 3100d39:	00 00                	add    BYTE PTR [eax],al
 3100d3b:	00 49 00             	add    BYTE PTR [ecx+0x0],cl
	...
 3100d46:	00 00                	add    BYTE PTR [eax],al
 3100d48:	12 00                	adc    al,BYTE PTR [eax]
 3100d4a:	00 00                	add    BYTE PTR [eax],al
 3100d4c:	51                   	push   ecx
	...
 3100d55:	00 00                	add    BYTE PTR [eax],al
 3100d57:	00 12                	add    BYTE PTR [edx],dl
 3100d59:	00 00                	add    BYTE PTR [eax],al
 3100d5b:	00 58 00             	add    BYTE PTR [eax+0x0],bl
	...
 3100d66:	00 00                	add    BYTE PTR [eax],al
 3100d68:	12 00                	adc    al,BYTE PTR [eax]
 3100d6a:	00 00                	add    BYTE PTR [eax],al
 3100d6c:	5d                   	pop    ebp
	...
 3100d75:	00 00                	add    BYTE PTR [eax],al
 3100d77:	00 12                	add    BYTE PTR [edx],dl
 3100d79:	00 00                	add    BYTE PTR [eax],al
 3100d7b:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
	...
 3100d87:	00 12                	add    BYTE PTR [edx],dl
 3100d89:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .dynstr:

03100d8c <.dynstr>:
 3100d8c:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3100d90:	63 2e                	arpl   WORD PTR [esi],bp
 3100d92:	73 6f                	jae    3100e03 <kShell+0x6c3>
 3100d94:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3100d97:	72 63                	jb     3100dfc <kShell+0x6bc>
 3100d99:	70 79                	jo     3100e14 <kShell+0x6d4>
 3100d9b:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 3100d9e:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3100da5:	72 
 3100da6:	69 6e 74 00 67 65 74 	imul   ebp,DWORD PTR [esi+0x74],0x74656700
 3100dad:	73 00                	jae    3100daf <kShell+0x66f>
 3100daf:	6d                   	ins    DWORD PTR es:[edi],dx
 3100db0:	65                   	gs
 3100db1:	6d                   	ins    DWORD PTR es:[edi],dx
 3100db2:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3100db5:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 3100db8:	6c                   	ins    BYTE PTR es:[edi],dx
 3100db9:	6c                   	ins    BYTE PTR es:[edi],dx
 3100dba:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100dbb:	63 00                	arpl   WORD PTR [eax],ax
 3100dbd:	73 6c                	jae    3100e2b <kShell+0x6eb>
 3100dbf:	65                   	gs
 3100dc0:	65                   	gs
 3100dc1:	70 00                	jo     3100dc3 <kShell+0x683>
 3100dc3:	73 74                	jae    3100e39 <kShell+0x6f9>
 3100dc5:	72 74                	jb     3100e3b <kShell+0x6fb>
 3100dc7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100dc8:	75 6c                	jne    3100e36 <kShell+0x6f6>
 3100dca:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3100dce:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
 3100dd1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100dd2:	69 74 00 73 74 72 6e 	imul   esi,DWORD PTR [eax+eax*1+0x73],0x636e7274
 3100dd9:	63 
 3100dda:	6d                   	ins    DWORD PTR es:[edi],dx
 3100ddb:	70 00                	jo     3100ddd <kShell+0x69d>
 3100ddd:	6d                   	ins    DWORD PTR es:[edi],dx
 3100dde:	65                   	gs
 3100ddf:	6d                   	ins    DWORD PTR es:[edi],dx
 3100de0:	73 65                	jae    3100e47 <kShell+0x707>
 3100de2:	74 00                	je     3100de4 <kShell+0x6a4>
 3100de4:	70 75                	jo     3100e5b <kShell+0x71b>
 3100de6:	74 63                	je     3100e4b <kShell+0x70b>
 3100de8:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3100deb:	72 6c                	jb     3100e59 <kShell+0x719>
 3100ded:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3100def:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 3100df2:	65 65 00 2f          	gs add BYTE PTR gs:[edi],ch
 3100df6:	68 6f 6d 65 2f       	push   0x2f656d6f
 3100dfb:	79 6f                	jns    3100e6c <kShell+0x72c>
 3100dfd:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 3100e04:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100e05:	73 2f                	jae    3100e36 <kShell+0x6f6>
 3100e07:	6c                   	ins    BYTE PTR es:[edi],dx
 3100e08:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3100e0f:	4f                   	dec    edi
 3100e10:	53                   	push   ebx
 3100e11:	2f                   	das    
 3100e12:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3100e19:	62 
 3100e1a:	75 67                	jne    3100e83 <kShell+0x743>
 3100e1c:	2f                   	das    
 3100e1d:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 3100e20:	73 73                	jae    3100e95 <kShell+0x755>
 3100e22:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3100e27:	78 00                	js     3100e29 <kShell+0x6e9>

Disassembly of section .hash:

03100e2c <.hash>:
 3100e2c:	03 00                	add    eax,DWORD PTR [eax]
 3100e2e:	00 00                	add    BYTE PTR [eax],al
 3100e30:	0f 00 00             	sldt   WORD PTR [eax]
 3100e33:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 3100e36:	00 00                	add    BYTE PTR [eax],al
 3100e38:	0e                   	push   cs
 3100e39:	00 00                	add    BYTE PTR [eax],al
 3100e3b:	00 0a                	add    BYTE PTR [edx],cl
	...
 3100e45:	00 00                	add    BYTE PTR [eax],al
 3100e47:	00 01                	add    BYTE PTR [ecx],al
 3100e49:	00 00                	add    BYTE PTR [eax],al
 3100e4b:	00 02                	add    BYTE PTR [edx],al
 3100e4d:	00 00                	add    BYTE PTR [eax],al
 3100e4f:	00 00                	add    BYTE PTR [eax],al
 3100e51:	00 00                	add    BYTE PTR [eax],al
 3100e53:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3100e56:	00 00                	add    BYTE PTR [eax],al
 3100e58:	03 00                	add    eax,DWORD PTR [eax]
 3100e5a:	00 00                	add    BYTE PTR [eax],al
 3100e5c:	05 00 00 00 06       	add    eax,0x6000000
 3100e61:	00 00                	add    BYTE PTR [eax],al
 3100e63:	00 07                	add    BYTE PTR [edi],al
 3100e65:	00 00                	add    BYTE PTR [eax],al
 3100e67:	00 08                	add    BYTE PTR [eax],cl
 3100e69:	00 00                	add    BYTE PTR [eax],al
 3100e6b:	00 09                	add    BYTE PTR [ecx],cl
 3100e6d:	00 00                	add    BYTE PTR [eax],al
 3100e6f:	00 0b                	add    BYTE PTR [ebx],cl
 3100e71:	00 00                	add    BYTE PTR [eax],al
 3100e73:	00 00                	add    BYTE PTR [eax],al
 3100e75:	00 00                	add    BYTE PTR [eax],al
 3100e77:	00                   	.byte 0x0
 3100e78:	0d                   	.byte 0xd
 3100e79:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03100e7c <.eh_frame>:
 3100e7c:	14 00                	adc    al,0x0
 3100e7e:	00 00                	add    BYTE PTR [eax],al
 3100e80:	00 00                	add    BYTE PTR [eax],al
 3100e82:	00 00                	add    BYTE PTR [eax],al
 3100e84:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3100e87:	00 01                	add    BYTE PTR [ecx],al
 3100e89:	7c 08                	jl     3100e93 <kShell+0x753>
 3100e8b:	01 1b                	add    DWORD PTR [ebx],ebx
 3100e8d:	0c 04                	or     al,0x4
 3100e8f:	04 88                	add    al,0x88
 3100e91:	01 00                	add    DWORD PTR [eax],eax
 3100e93:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3100e96:	00 00                	add    BYTE PTR [eax],al
 3100e98:	1c 00                	sbb    al,0x0
 3100e9a:	00 00                	add    BYTE PTR [eax],al
 3100e9c:	94                   	xchg   esp,eax
 3100e9d:	fa                   	cli    
 3100e9e:	ff                   	(bad)  
 3100e9f:	ff f0                	push   eax
 3100ea1:	00 00                	add    BYTE PTR [eax],al
 3100ea3:	00 00                	add    BYTE PTR [eax],al
 3100ea5:	0e                   	push   cs
 3100ea6:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3100ea9:	0c 4a                	or     al,0x4a
 3100eab:	0f 0b                	ud2    
 3100ead:	74 04                	je     3100eb3 <kShell+0x773>
 3100eaf:	78 00                	js     3100eb1 <kShell+0x771>
 3100eb1:	3f                   	aas    
 3100eb2:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3100eb4:	2a 32                	sub    dh,BYTE PTR [edx]
 3100eb6:	24 22                	and    al,0x22
 3100eb8:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03100ebc <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3100ebc:	01 1b                	add    DWORD PTR [ebx],ebx
 3100ebe:	03 3b                	add    edi,DWORD PTR [ebx]
 3100ec0:	40                   	inc    eax
 3100ec1:	fc                   	cld    
 3100ec2:	ff                   	(bad)  
 3100ec3:	ff 0b                	dec    DWORD PTR [ebx]
 3100ec5:	00 00                	add    BYTE PTR [eax],al
 3100ec7:	00 44 f1 ff          	add    BYTE PTR [ecx+esi*8-0x1],al
 3100ecb:	ff 5c fc ff          	call   FWORD PTR [esp+edi*8-0x1]
 3100ecf:	ff ef                	jmp    <internal disassembler error>
 3100ed1:	f1                   	icebp  
 3100ed2:	ff                   	(bad)  
 3100ed3:	ff 80 fc ff ff 31    	inc    DWORD PTR [eax+0x31fffffc]
 3100ed9:	f3 ff                	repz (bad) 
 3100edb:	ff a4 fc ff ff 9a f3 	jmp    DWORD PTR [esp+edi*8-0xc650001]
 3100ee2:	ff                   	(bad)  
 3100ee3:	ff c4                	inc    esp
 3100ee5:	fc                   	cld    
 3100ee6:	ff                   	(bad)  
 3100ee7:	ff 28                	jmp    FWORD PTR [eax]
 3100ee9:	f6 ff                	idiv   bh
 3100eeb:	ff e4                	jmp    esp
 3100eed:	fc                   	cld    
 3100eee:	ff                   	(bad)  
 3100eef:	ff 80 f6 ff ff 04    	inc    DWORD PTR [eax+0x4fffff6]
 3100ef5:	fd                   	std    
 3100ef6:	ff                   	(bad)  
 3100ef7:	ff 03                	inc    DWORD PTR [ebx]
 3100ef9:	f7 ff                	idiv   edi
 3100efb:	ff 28                	jmp    FWORD PTR [eax]
 3100efd:	fd                   	std    
 3100efe:	ff                   	(bad)  
 3100eff:	ff 40 f7             	inc    DWORD PTR [eax-0x9]
 3100f02:	ff                   	(bad)  
 3100f03:	ff 48 fd             	dec    DWORD PTR [eax-0x3]
 3100f06:	ff                   	(bad)  
 3100f07:	ff c5                	inc    ebp
 3100f09:	f7 ff                	idiv   edi
 3100f0b:	ff 6c fd ff          	jmp    FWORD PTR [ebp+edi*8-0x1]
 3100f0f:	ff 2c f8             	jmp    FWORD PTR [eax+edi*8]
 3100f12:	ff                   	(bad)  
 3100f13:	ff 8c fd ff ff 84 f8 	dec    DWORD PTR [ebp+edi*8-0x77b0001]
 3100f1a:	ff                   	(bad)  
 3100f1b:	ff                   	.byte 0xff
 3100f1c:	ac                   	lods   al,BYTE PTR ds:[esi]
 3100f1d:	fd                   	std    
 3100f1e:	ff                   	(bad)  
 3100f1f:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03100f20 <.rel.dyn>:
 3100f20:	7c 10                	jl     3100f32 <__GNU_EH_FRAME_HDR+0x76>
 3100f22:	10 03                	adc    BYTE PTR [ebx],al
 3100f24:	07                   	pop    es
 3100f25:	01 00                	add    DWORD PTR [eax],eax
 3100f27:	00 80 10 10 03 07    	add    BYTE PTR [eax+0x7031010],al
 3100f2d:	02 00                	add    al,BYTE PTR [eax]
 3100f2f:	00 84 10 10 03 07 03 	add    BYTE PTR [eax+edx*1+0x3070310],al
 3100f36:	00 00                	add    BYTE PTR [eax],al
 3100f38:	88 10                	mov    BYTE PTR [eax],dl
 3100f3a:	10 03                	adc    BYTE PTR [ebx],al
 3100f3c:	07                   	pop    es
 3100f3d:	04 00                	add    al,0x0
 3100f3f:	00 8c 10 10 03 07 05 	add    BYTE PTR [eax+edx*1+0x5070310],cl
 3100f46:	00 00                	add    BYTE PTR [eax],al
 3100f48:	90                   	nop
 3100f49:	10 10                	adc    BYTE PTR [eax],dl
 3100f4b:	03 07                	add    eax,DWORD PTR [edi]
 3100f4d:	06                   	push   es
 3100f4e:	00 00                	add    BYTE PTR [eax],al
 3100f50:	94                   	xchg   esp,eax
 3100f51:	10 10                	adc    BYTE PTR [eax],dl
 3100f53:	03 07                	add    eax,DWORD PTR [edi]
 3100f55:	07                   	pop    es
 3100f56:	00 00                	add    BYTE PTR [eax],al
 3100f58:	98                   	cwde   
 3100f59:	10 10                	adc    BYTE PTR [eax],dl
 3100f5b:	03 07                	add    eax,DWORD PTR [edi]
 3100f5d:	08 00                	or     BYTE PTR [eax],al
 3100f5f:	00 9c 10 10 03 07 09 	add    BYTE PTR [eax+edx*1+0x9070310],bl
 3100f66:	00 00                	add    BYTE PTR [eax],al
 3100f68:	a0 10 10 03 07       	mov    al,ds:0x7031010
 3100f6d:	0a 00                	or     al,BYTE PTR [eax]
 3100f6f:	00 a4 10 10 03 07 0b 	add    BYTE PTR [eax+edx*1+0xb070310],ah
 3100f76:	00 00                	add    BYTE PTR [eax],al
 3100f78:	a8 10                	test   al,0x10
 3100f7a:	10 03                	adc    BYTE PTR [ebx],al
 3100f7c:	07                   	pop    es
 3100f7d:	0c 00                	or     al,0x0
 3100f7f:	00 ac 10 10 03 07 0d 	add    BYTE PTR [eax+edx*1+0xd070310],ch
 3100f86:	00 00                	add    BYTE PTR [eax],al
 3100f88:	b0 10                	mov    al,0x10
 3100f8a:	10 03                	adc    BYTE PTR [ebx],al
 3100f8c:	07                   	pop    es
 3100f8d:	0e                   	push   cs
	...

Disassembly of section .data:

03100fa0 <cmds>:
 3100fa0:	20 0a                	and    BYTE PTR [edx],cl
 3100fa2:	10 03                	adc    BYTE PTR [ebx],al
 3100fa4:	25 0a 10 03 e4       	and    eax,0xe403100a
 3100fa9:	04 10                	add    al,0x10
 3100fab:	03 00                	add    eax,DWORD PTR [eax]
 3100fad:	00 00                	add    BYTE PTR [eax],al
 3100faf:	00 41 0a             	add    BYTE PTR [ecx+0xa],al
 3100fb2:	10 03                	adc    BYTE PTR [ebx],al
 3100fb4:	46                   	inc    esi
 3100fb5:	0a 10                	or     dl,BYTE PTR [eax]
 3100fb7:	03 fc                	add    edi,esp
 3100fb9:	05 10 03 01 00       	add    eax,0x10310
 3100fbe:	00 00                	add    BYTE PTR [eax],al
 3100fc0:	58                   	pop    eax
 3100fc1:	0a 10                	or     dl,BYTE PTR [eax]
 3100fc3:	03 5d 0a             	add    ebx,DWORD PTR [ebp+0xa]
 3100fc6:	10 03                	adc    BYTE PTR [ebx],al
 3100fc8:	e8 06 10 03 01       	call   4131fd3 <sKShellProgramName+0x1030cdf>
 3100fcd:	00 00                	add    BYTE PTR [eax],al
 3100fcf:	00 69 0a             	add    BYTE PTR [ecx+0xa],ch
 3100fd2:	10 03                	adc    BYTE PTR [ebx],al
 3100fd4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100fd5:	0a 10                	or     dl,BYTE PTR [eax]
 3100fd7:	03 81 06 10 03 01    	add    eax,DWORD PTR [ecx+0x1031006]
 3100fdd:	00 00                	add    BYTE PTR [eax],al
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
 3100ff4:	2c 0e                	sub    al,0xe
 3100ff6:	10 03                	adc    BYTE PTR [ebx],al
 3100ff8:	05 00 00 00 8c       	add    eax,0x8c000000
 3100ffd:	0d 10 03 06 00       	or     eax,0x60310
 3101002:	00 00                	add    BYTE PTR [eax],al
 3101004:	9c                   	pushf  
 3101005:	0c 10                	or     al,0x10
 3101007:	03 0a                	add    ecx,DWORD PTR [edx]
 3101009:	00 00                	add    BYTE PTR [eax],al
 310100b:	00 9d 00 00 00 0b    	add    BYTE PTR [ebp+0xb000000],bl
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
 310103b:	00 20                	add    BYTE PTR [eax],ah
 310103d:	0f 10 03             	movups xmm0,XMMWORD PTR [ebx]
	...

Disassembly of section .got.plt:

03101070 <_GLOBAL_OFFSET_TABLE_>:
 3101070:	e0 0f                	loopne 3101081 <_GLOBAL_OFFSET_TABLE_+0x11>
 3101072:	10 03                	adc    BYTE PTR [ebx],al
	...
 310107c:	46                   	inc    esi
 310107d:	09 10                	or     DWORD PTR [eax],edx
 310107f:	03 56 09             	add    edx,DWORD PTR [esi+0x9]
 3101082:	10 03                	adc    BYTE PTR [ebx],al
 3101084:	66 09 10             	or     WORD PTR [eax],dx
 3101087:	03 76 09             	add    esi,DWORD PTR [esi+0x9]
 310108a:	10 03                	adc    BYTE PTR [ebx],al
 310108c:	86 09                	xchg   BYTE PTR [ecx],cl
 310108e:	10 03                	adc    BYTE PTR [ebx],al
 3101090:	96                   	xchg   esi,eax
 3101091:	09 10                	or     DWORD PTR [eax],edx
 3101093:	03 a6 09 10 03 b6    	add    esp,DWORD PTR [esi-0x49fceff7]
 3101099:	09 10                	or     DWORD PTR [eax],edx
 310109b:	03 c6                	add    eax,esi
 310109d:	09 10                	or     DWORD PTR [eax],edx
 310109f:	03 d6                	add    edx,esi
 31010a1:	09 10                	or     DWORD PTR [eax],edx
 31010a3:	03 e6                	add    esp,esi
 31010a5:	09 10                	or     DWORD PTR [eax],edx
 31010a7:	03 f6                	add    esi,esi
 31010a9:	09 10                	or     DWORD PTR [eax],edx
 31010ab:	03 06                	add    eax,DWORD PTR [esi]
 31010ad:	0a 10                	or     dl,BYTE PTR [eax]
 31010af:	03 16                	add    edx,DWORD PTR [esi]
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

031012e4 <heapEnd>:
 31012e4:	00 00                	add    BYTE PTR [eax],al
	...

031012e8 <heapBase>:
 31012e8:	00 00                	add    BYTE PTR [eax],al
	...

031012ec <heapCurr>:
 31012ec:	00 00                	add    BYTE PTR [eax],al
	...

031012f0 <command_function>:
 31012f0:	00 00                	add    BYTE PTR [eax],al
	...

031012f4 <sKShellProgramName>:
 31012f4:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	95                   	xchg   ebp,eax
   1:	06                   	push   es
   2:	00 00                	add    BYTE PTR [eax],al
   4:	04 00                	add    al,0x0
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	9f                   	lahf   
   d:	00 00                	add    BYTE PTR [eax],al
   f:	00 0c 4e             	add    BYTE PTR [esi+ecx*2],cl
  12:	02 00                	add    al,BYTE PTR [eax]
  14:	00 ce                	add    dh,cl
  16:	02 00                	add    al,BYTE PTR [eax]
  18:	00 00                	add    BYTE PTR [eax],al
  1a:	00 10                	add    BYTE PTR [eax],dl
  1c:	03 28                	add    ebp,DWORD PTR [eax]
  1e:	09 00                	or     DWORD PTR [eax],eax
  20:	00 00                	add    BYTE PTR [eax],al
  22:	00 00                	add    BYTE PTR [eax],al
  24:	00 02                	add    BYTE PTR [edx],al
  26:	01 08                	add    DWORD PTR [eax],ecx
  28:	dc 01                	fadd   QWORD PTR [ecx]
  2a:	00 00                	add    BYTE PTR [eax],al
  2c:	02 02                	add    al,BYTE PTR [edx]
  2e:	07                   	pop    es
  2f:	1d 02 00 00 02       	sbb    eax,0x2000002
  34:	04 07                	add    al,0x7
  36:	f4                   	hlt    
  37:	01 00                	add    DWORD PTR [eax],eax
  39:	00 02                	add    BYTE PTR [edx],al
  3b:	04 07                	add    al,0x7
  3d:	ef                   	out    dx,eax
  3e:	01 00                	add    DWORD PTR [eax],eax
  40:	00 02                	add    BYTE PTR [edx],al
  42:	01 06                	add    DWORD PTR [esi],eax
  44:	de 01                	fiadd  WORD PTR [ecx]
  46:	00 00                	add    BYTE PTR [eax],al
  48:	02 02                	add    al,BYTE PTR [edx]
  4a:	05 3e 00 00 00       	add    eax,0x3e
  4f:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  56:	02 08                	add    cl,BYTE PTR [eax]
  58:	05 6b 01 00 00       	add    eax,0x16b
  5d:	02 08                	add    cl,BYTE PTR [eax]
  5f:	07                   	pop    es
  60:	ea 01 00 00 02 04 05 	jmp    0x504:0x2000001
  67:	70 01                	jo     6a <execInternalCommand-0x30fff96>
  69:	00 00                	add    BYTE PTR [eax],al
  6b:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
  6e:	5f                   	pop    edi
  6f:	00 00                	add    BYTE PTR [eax],al
  71:	00 04 04             	add    BYTE PTR [esp+eax*1],al
  74:	05 04 7a 00 00       	add    eax,0x7a04
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	01 06                	add    DWORD PTR [esi],eax
  7d:	e5 01                	in     eax,0x1
  7f:	00 00                	add    BYTE PTR [eax],al
  81:	06                   	push   es
  82:	2e 01 00             	add    DWORD PTR cs:[eax],eax
  85:	00 02                	add    BYTE PTR [edx],al
  87:	2e                   	cs
  88:	25 00 00 00 06       	and    eax,0x6000000
  8d:	01 02                	add    DWORD PTR [edx],eax
  8f:	00 00                	add    BYTE PTR [eax],al
  91:	02 34 33             	add    dh,BYTE PTR [ebx+esi*1]
  94:	00 00                	add    BYTE PTR [eax],al
  96:	00 02                	add    BYTE PTR [edx],al
  98:	01 02                	add    DWORD PTR [edx],eax
  9a:	48                   	dec    eax
  9b:	02 00                	add    al,BYTE PTR [eax]
  9d:	00 05 04 a4 00 00    	add    BYTE PTR ds:0xa404,al
  a3:	00 07                	add    BYTE PTR [edi],al
  a5:	7a 00                	jp     a7 <execInternalCommand-0x30fff59>
  a7:	00 00                	add    BYTE PTR [eax],al
  a9:	08 10                	or     BYTE PTR [eax],dl
  ab:	03 12                	add    edx,DWORD PTR [edx]
  ad:	e2 00                	loop   af <execInternalCommand-0x30fff51>
  af:	00 00                	add    BYTE PTR [eax],al
  b1:	09 d7                	or     edi,edx
  b3:	01 00                	add    DWORD PTR [eax],eax
  b5:	00 03                	add    BYTE PTR [ebx],al
  b7:	14 74                	adc    al,0x74
  b9:	00 00                	add    BYTE PTR [eax],al
  bb:	00 00                	add    BYTE PTR [eax],al
  bd:	09 2d 00 00 00 03    	or     DWORD PTR ds:0x3000000,ebp
  c3:	15 74 00 00 00       	adc    eax,0x74
  c8:	04 09                	add    al,0x9
  ca:	47                   	inc    edi
  cb:	01 00                	add    DWORD PTR [eax],eax
  cd:	00 03                	add    BYTE PTR [ebx],al
  cf:	16                   	push   ss
  d0:	72 00                	jb     d2 <execInternalCommand-0x30fff2e>
  d2:	00 00                	add    BYTE PTR [eax],al
  d4:	08 09                	or     BYTE PTR [ecx],cl
  d6:	59                   	pop    ecx
  d7:	01 00                	add    DWORD PTR [eax],eax
  d9:	00 03                	add    BYTE PTR [ebx],al
  db:	17                   	pop    ss
  dc:	4f                   	dec    edi
  dd:	00 00                	add    BYTE PTR [eax],al
  df:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
  e2:	06                   	push   es
  e3:	76 00                	jbe    e5 <execInternalCommand-0x30fff1b>
  e5:	00 00                	add    BYTE PTR [eax],al
  e7:	03 18                	add    ebx,DWORD PTR [eax]
  e9:	a9 00 00 00 0a       	test   eax,0xa000000
  ee:	f5                   	cmc    
  ef:	00 00                	add    BYTE PTR [eax],al
  f1:	00 01                	add    BYTE PTR [ecx],al
  f3:	1b 00                	sbb    eax,DWORD PTR [eax]
  f5:	00 10                	add    BYTE PTR [eax],dl
  f7:	03 ab 00 00 00 01    	add    ebp,DWORD PTR [ebx+0x1000000]
  fd:	9c                   	pushf  
  fe:	1d 01 00 00 0b       	sbb    eax,0xb000001
 103:	00 01                	add    BYTE PTR [ecx],al
 105:	00 00                	add    BYTE PTR [eax],al
 107:	01 1b                	add    DWORD PTR [ebx],ebx
 109:	74 00                	je     10b <execInternalCommand-0x30ffef5>
 10b:	00 00                	add    BYTE PTR [eax],al
 10d:	02 91 00 0c 69 00    	add    dl,BYTE PTR [ecx+0x690c00]
 113:	01 1d 4f 00 00 00    	add    DWORD PTR ds:0x4f,ebx
 119:	02 91 6c 00 0d 48    	add    dl,BYTE PTR [ecx+0x480d006c]
 11f:	00 00                	add    BYTE PTR [eax],al
 121:	00 01                	add    BYTE PTR [ecx],al
 123:	32 4f 00             	xor    cl,BYTE PTR [edi+0x0]
 126:	00 00                	add    BYTE PTR [eax],al
 128:	ab                   	stos   DWORD PTR es:[edi],eax
 129:	00 10                	add    BYTE PTR [eax],dl
 12b:	03 42 01             	add    eax,DWORD PTR [edx+0x1]
 12e:	00 00                	add    BYTE PTR [eax],al
 130:	01 9c ad 01 00 00 0b 	add    DWORD PTR [ebp+ebp*4+0xb000001],ebx
 137:	7e 02                	jle    13b <execInternalCommand-0x30ffec5>
 139:	00 00                	add    BYTE PTR [eax],al
 13b:	01 32                	add    DWORD PTR [edx],esi
 13d:	74 00                	je     13f <execInternalCommand-0x30ffec1>
 13f:	00 00                	add    BYTE PTR [eax],al
 141:	02 91 00 0b d0 01    	add    dl,BYTE PTR [ecx+0x1d00b00]
 147:	00 00                	add    BYTE PTR [eax],al
 149:	01 32                	add    DWORD PTR [edx],esi
 14b:	bd 01 00 00 02       	mov    ebp,0x2000001
 150:	91                   	xchg   ecx,eax
 151:	04 0b                	add    al,0xb
 153:	6a 02                	push   0x2
 155:	00 00                	add    BYTE PTR [eax],al
 157:	01 32                	add    DWORD PTR [edx],esi
 159:	4f                   	dec    edi
 15a:	00 00                	add    BYTE PTR [eax],al
 15c:	00 02                	add    BYTE PTR [edx],al
 15e:	91                   	xchg   ecx,eax
 15f:	08 0c 78             	or     BYTE PTR [eax+edi*2],cl
 162:	00 01                	add    BYTE PTR [ecx],al
 164:	34 4f                	xor    al,0x4f
 166:	00 00                	add    BYTE PTR [eax],al
 168:	00 02                	add    BYTE PTR [edx],al
 16a:	91                   	xchg   ecx,eax
 16b:	6c                   	ins    BYTE PTR es:[edi],dx
 16c:	0c 79                	or     al,0x79
 16e:	00 01                	add    BYTE PTR [ecx],al
 170:	34 4f                	xor    al,0x4f
 172:	00 00                	add    BYTE PTR [eax],al
 174:	00 02                	add    BYTE PTR [edx],al
 176:	91                   	xchg   ecx,eax
 177:	68 0e 17 00 00       	push   0x170e
 17c:	00 01                	add    BYTE PTR [ecx],al
 17e:	35 4f 00 00 00       	xor    eax,0x4f
 183:	02 91 64 0e 86 00    	add    dl,BYTE PTR [ecx+0x860e64]
 189:	00 00                	add    BYTE PTR [eax],al
 18b:	01 35 4f 00 00 00    	add    DWORD PTR ds:0x4f,esi
 191:	02 91 60 0f e2 00    	add    dl,BYTE PTR [ecx+0xe20f60]
 197:	10 03                	adc    BYTE PTR [ebx],al
 199:	e6 00                	out    0x0,al
 19b:	00 00                	add    BYTE PTR [eax],al
 19d:	0c 63                	or     al,0x63
 19f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1a0:	74 00                	je     1a2 <execInternalCommand-0x30ffe5e>
 1a2:	01 39                	add    DWORD PTR [ecx],edi
 1a4:	33 00                	xor    eax,DWORD PTR [eax]
 1a6:	00 00                	add    BYTE PTR [eax],al
 1a8:	02 91 5c 00 00 10    	add    dl,BYTE PTR [ecx+0x1000005c]
 1ae:	7a 00                	jp     1b0 <execInternalCommand-0x30ffe50>
 1b0:	00 00                	add    BYTE PTR [eax],al
 1b2:	bd 01 00 00 11       	mov    ebp,0x11000001
 1b7:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 1ba:	00 31                	add    BYTE PTR [ecx],dh
 1bc:	00 05 04 ad 01 00    	add    BYTE PTR ds:0x1ad04,al
 1c2:	00 0d 8b 02 00 00    	add    BYTE PTR ds:0x28b,cl
 1c8:	01 57 4f             	add    DWORD PTR [edi+0x4f],edx
 1cb:	00 00                	add    BYTE PTR [eax],al
 1cd:	00 ed                	add    ch,ch
 1cf:	01 10                	add    DWORD PTR [eax],edx
 1d1:	03 69 00             	add    ebp,DWORD PTR [ecx+0x0]
 1d4:	00 00                	add    BYTE PTR [eax],al
 1d6:	01 9c 05 02 00 00 0b 	add    DWORD PTR [ebp+eax*1+0xb000002],ebx
 1dd:	e7 02                	out    0x2,eax
 1df:	00 00                	add    BYTE PTR [eax],al
 1e1:	01 57 74             	add    DWORD PTR [edi+0x74],edx
 1e4:	00 00                	add    BYTE PTR [eax],al
 1e6:	00 02                	add    BYTE PTR [edx],al
 1e8:	91                   	xchg   ecx,eax
 1e9:	00 0c 69             	add    BYTE PTR [ecx+ebp*2],cl
 1ec:	00 01                	add    BYTE PTR [ecx],al
 1ee:	59                   	pop    ecx
 1ef:	33 00                	xor    eax,DWORD PTR [eax]
 1f1:	00 00                	add    BYTE PTR [eax],al
 1f3:	02 91 6c 0c 72 65    	add    dl,BYTE PTR [ecx+0x65720c6c]
 1f9:	74 00                	je     1fb <execInternalCommand-0x30ffe05>
 1fb:	01 5a 4f             	add    DWORD PTR [edx+0x4f],ebx
 1fe:	00 00                	add    BYTE PTR [eax],al
 200:	00 02                	add    BYTE PTR [edx],al
 202:	91                   	xchg   ecx,eax
 203:	68 00 0d 0a 02       	push   0x20a0d00
 208:	00 00                	add    BYTE PTR [eax],al
 20a:	01 6b c3             	add    DWORD PTR [ebx-0x3d],ebp
 20d:	02 00                	add    al,BYTE PTR [eax]
 20f:	00 56 02             	add    BYTE PTR [esi+0x2],dl
 212:	10 03                	adc    BYTE PTR [ebx],al
 214:	8e 02                	mov    es,WORD PTR [edx]
 216:	00 00                	add    BYTE PTR [eax],al
 218:	01 9c c3 02 00 00 0b 	add    DWORD PTR [ebx+eax*8+0xb000002],ebx
 21f:	59                   	pop    ecx
 220:	00 00                	add    BYTE PTR [eax],al
 222:	00 01                	add    BYTE PTR [ecx],al
 224:	6b 9e 00 00 00 02 91 	imul   ebx,DWORD PTR [esi+0x2000000],0xffffff91
 22b:	00 0c 61             	add    BYTE PTR [ecx+eiz*2],cl
 22e:	72 67                	jb     297 <execInternalCommand-0x30ffd69>
 230:	00 01                	add    BYTE PTR [ecx],al
 232:	6d                   	ins    DWORD PTR es:[edi],dx
 233:	74 00                	je     235 <execInternalCommand-0x30ffdcb>
 235:	00 00                	add    BYTE PTR [eax],al
 237:	02 91 6c 0e 97 02    	add    dl,BYTE PTR [ecx+0x2970e6c]
 23d:	00 00                	add    BYTE PTR [eax],al
 23f:	01 6e 74             	add    DWORD PTR [esi+0x74],ebp
 242:	00 00                	add    BYTE PTR [eax],al
 244:	00 02                	add    BYTE PTR [edx],al
 246:	91                   	xchg   ecx,eax
 247:	68 0e 9a 01 00       	push   0x19a0e
 24c:	00 01                	add    BYTE PTR [ecx],al
 24e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 24f:	4f                   	dec    edi
 250:	00 00                	add    BYTE PTR [eax],al
 252:	00 02                	add    BYTE PTR [edx],al
 254:	91                   	xchg   ecx,eax
 255:	64                   	fs
 256:	0e                   	push   cs
 257:	27                   	daa    
 258:	01 00                	add    DWORD PTR [eax],eax
 25a:	00 01                	add    BYTE PTR [ecx],al
 25c:	70 4f                	jo     2ad <execInternalCommand-0x30ffd53>
 25e:	00 00                	add    BYTE PTR [eax],al
 260:	00 02                	add    BYTE PTR [edx],al
 262:	91                   	xchg   ecx,eax
 263:	60                   	pusha  
 264:	0e                   	push   cs
 265:	99                   	cdq    
 266:	01 00                	add    DWORD PTR [eax],eax
 268:	00 01                	add    BYTE PTR [ecx],al
 26a:	71 4f                	jno    2bb <execInternalCommand-0x30ffd45>
 26c:	00 00                	add    BYTE PTR [eax],al
 26e:	00 02                	add    BYTE PTR [edx],al
 270:	91                   	xchg   ecx,eax
 271:	5c                   	pop    esp
 272:	0e                   	push   cs
 273:	b9 01 00 00 01       	mov    ecx,0x1000001
 278:	72 4f                	jb     2c9 <execInternalCommand-0x30ffd37>
 27a:	00 00                	add    BYTE PTR [eax],al
 27c:	00 02                	add    BYTE PTR [edx],al
 27e:	91                   	xchg   ecx,eax
 27f:	58                   	pop    eax
 280:	0e                   	push   cs
 281:	b6 01                	mov    dh,0x1
 283:	00 00                	add    BYTE PTR [eax],al
 285:	01 73 4f             	add    DWORD PTR [ebx+0x4f],esi
 288:	00 00                	add    BYTE PTR [eax],al
 28a:	00 02                	add    BYTE PTR [edx],al
 28c:	91                   	xchg   ecx,eax
 28d:	54                   	push   esp
 28e:	0e                   	push   cs
 28f:	0f 02 00             	lar    eax,WORD PTR [eax]
 292:	00 01                	add    BYTE PTR [ecx],al
 294:	74 c3                	je     259 <execInternalCommand-0x30ffda7>
 296:	02 00                	add    al,BYTE PTR [eax]
 298:	00 02                	add    BYTE PTR [edx],al
 29a:	91                   	xchg   ecx,eax
 29b:	50                   	push   eax
 29c:	0e                   	push   cs
 29d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 29e:	02 00                	add    al,BYTE PTR [eax]
 2a0:	00 01                	add    BYTE PTR [ecx],al
 2a2:	75 c3                	jne    267 <execInternalCommand-0x30ffd99>
 2a4:	02 00                	add    al,BYTE PTR [eax]
 2a6:	00 02                	add    BYTE PTR [edx],al
 2a8:	91                   	xchg   ecx,eax
 2a9:	4c                   	dec    esp
 2aa:	0f 17 04 10          	movhps QWORD PTR [eax+edx*1],xmm0
 2ae:	03 9e 00 00 00 0e    	add    ebx,DWORD PTR [esi+0xe000000]
 2b4:	39 00                	cmp    DWORD PTR [eax],eax
 2b6:	00 00                	add    BYTE PTR [eax],al
 2b8:	01 ce                	add    esi,ecx
 2ba:	74 00                	je     2bc <execInternalCommand-0x30ffd44>
 2bc:	00 00                	add    BYTE PTR [eax],al
 2be:	02 91 48 00 00 05    	add    dl,BYTE PTR [ecx+0x5000048]
 2c4:	04 74                	add    al,0x74
 2c6:	00 00                	add    BYTE PTR [eax],al
 2c8:	00 12                	add    BYTE PTR [edx],dl
 2ca:	10 00                	adc    BYTE PTR [eax],al
 2cc:	00 00                	add    BYTE PTR [eax],al
 2ce:	01 e4                	add    esp,esp
 2d0:	e4 04                	in     al,0x4
 2d2:	10 03                	adc    BYTE PTR [ebx],al
 2d4:	58                   	pop    eax
 2d5:	00 00                	add    BYTE PTR [eax],al
 2d7:	00 01                	add    BYTE PTR [ecx],al
 2d9:	9c                   	pushf  
 2da:	f7 02 00 00 0f fa    	test   DWORD PTR [edx],0xfa0f0000
 2e0:	04 10                	add    al,0x10
 2e2:	03 3f                	add    edi,DWORD PTR [edi]
 2e4:	00 00                	add    BYTE PTR [eax],al
 2e6:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 2e9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2ea:	74 00                	je     2ec <execInternalCommand-0x30ffd14>
 2ec:	01 e7                	add    edi,esp
 2ee:	33 00                	xor    eax,DWORD PTR [eax]
 2f0:	00 00                	add    BYTE PTR [eax],al
 2f2:	02 91 6c 00 00 0d    	add    dl,BYTE PTR [ecx+0xd00006c]
 2f8:	79 01                	jns    2fb <execInternalCommand-0x30ffd05>
 2fa:	00 00                	add    BYTE PTR [eax],al
 2fc:	01 eb                	add    ebx,ebp
 2fe:	c3                   	ret    
 2ff:	02 00                	add    al,BYTE PTR [eax]
 301:	00 3c 05 10 03 83 00 	add    BYTE PTR [eax*1+0x830310],bh
 308:	00 00                	add    BYTE PTR [eax],al
 30a:	01 9c 53 03 00 00 0b 	add    DWORD PTR [ebx+edx*2+0xb000003],ebx
 311:	64 01 00             	add    DWORD PTR fs:[eax],eax
 314:	00 01                	add    BYTE PTR [ecx],al
 316:	eb 4f                	jmp    367 <execInternalCommand-0x30ffc99>
 318:	00 00                	add    BYTE PTR [eax],al
 31a:	00 02                	add    BYTE PTR [edx],al
 31c:	91                   	xchg   ecx,eax
 31d:	00 0b                	add    BYTE PTR [ebx],cl
 31f:	d0 01                	rol    BYTE PTR [ecx],1
 321:	00 00                	add    BYTE PTR [eax],al
 323:	01 eb                	add    ebx,ebp
 325:	bd 01 00 00 02       	mov    ebp,0x2000001
 32a:	91                   	xchg   ecx,eax
 32b:	04 0e                	add    al,0xe
 32d:	9a 00 00 00 01 ed c3 	call   0xc3ed:0x1000000
 334:	02 00                	add    al,BYTE PTR [eax]
 336:	00 02                	add    BYTE PTR [edx],al
 338:	91                   	xchg   ecx,eax
 339:	68 0f 58 05 10       	push   0x1005580f
 33e:	03 5f 00             	add    ebx,DWORD PTR [edi+0x0]
 341:	00 00                	add    BYTE PTR [eax],al
 343:	0c 63                	or     al,0x63
 345:	6e                   	outs   dx,BYTE PTR ds:[esi]
 346:	74 00                	je     348 <execInternalCommand-0x30ffcb8>
 348:	01 ef                	add    edi,ebp
 34a:	4f                   	dec    edi
 34b:	00 00                	add    BYTE PTR [eax],al
 34d:	00 02                	add    BYTE PTR [edx],al
 34f:	91                   	xchg   ecx,eax
 350:	6c                   	ins    BYTE PTR es:[edi],dx
 351:	00 00                	add    BYTE PTR [eax],al
 353:	0a 50 01             	or     dl,BYTE PTR [eax+0x1]
 356:	00 00                	add    BYTE PTR [eax],al
 358:	01 f7                	add    edi,esi
 35a:	bf 05 10 03 3d       	mov    edi,0x3d031005
 35f:	00 00                	add    BYTE PTR [eax],al
 361:	00 01                	add    BYTE PTR [ecx],al
 363:	9c                   	pushf  
 364:	9d                   	popf   
 365:	03 00                	add    eax,DWORD PTR [eax]
 367:	00 0b                	add    BYTE PTR [ebx],cl
 369:	64 01 00             	add    DWORD PTR fs:[eax],eax
 36c:	00 01                	add    BYTE PTR [ecx],al
 36e:	f7                   	(bad)  
 36f:	4f                   	dec    edi
 370:	00 00                	add    BYTE PTR [eax],al
 372:	00 02                	add    BYTE PTR [edx],al
 374:	91                   	xchg   ecx,eax
 375:	00 0b                	add    BYTE PTR [ebx],cl
 377:	d0 01                	rol    BYTE PTR [ecx],1
 379:	00 00                	add    BYTE PTR [eax],al
 37b:	01 f7                	add    edi,esi
 37d:	c3                   	ret    
 37e:	02 00                	add    al,BYTE PTR [eax]
 380:	00 02                	add    BYTE PTR [edx],al
 382:	91                   	xchg   ecx,eax
 383:	04 0f                	add    al,0xf
 385:	c5 05 10 03 26 00    	lds    eax,FWORD PTR ds:0x260310
 38b:	00 00                	add    BYTE PTR [eax],al
 38d:	0c 63                	or     al,0x63
 38f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 390:	74 00                	je     392 <execInternalCommand-0x30ffc6e>
 392:	01 f9                	add    ecx,edi
 394:	4f                   	dec    edi
 395:	00 00                	add    BYTE PTR [eax],al
 397:	00 02                	add    BYTE PTR [edx],al
 399:	91                   	xchg   ecx,eax
 39a:	6c                   	ins    BYTE PTR es:[edi],dx
 39b:	00 00                	add    BYTE PTR [eax],al
 39d:	0a 5f 02             	or     bl,BYTE PTR [edi+0x2]
 3a0:	00 00                	add    BYTE PTR [eax],al
 3a2:	01 fe                	add    esi,edi
 3a4:	fc                   	cld    
 3a5:	05 10 03 85 00       	add    eax,0x850310
 3aa:	00 00                	add    BYTE PTR [eax],al
 3ac:	01 9c fe 03 00 00 0b 	add    DWORD PTR [esi+edi*8+0xb000003],ebx
 3b3:	92                   	xchg   edx,eax
 3b4:	00 00                	add    BYTE PTR [eax],al
 3b6:	00 01                	add    BYTE PTR [ecx],al
 3b8:	fe                   	(bad)  
 3b9:	74 00                	je     3bb <execInternalCommand-0x30ffc45>
 3bb:	00 00                	add    BYTE PTR [eax],al
 3bd:	02 91 00 13 d0 01    	add    dl,BYTE PTR [ecx+0x1d01300]
 3c3:	00 00                	add    BYTE PTR [eax],al
 3c5:	01 00                	add    DWORD PTR [eax],eax
 3c7:	01 fe                	add    esi,edi
 3c9:	03 00                	add    eax,DWORD PTR [eax]
 3cb:	00 03                	add    BYTE PTR [ebx],al
 3cd:	91                   	xchg   ecx,eax
 3ce:	f0 7b 13             	lock jnp 3e4 <execInternalCommand-0x30ffc1c>
 3d1:	59                   	pop    ecx
 3d2:	01 00                	add    DWORD PTR [eax],eax
 3d4:	00 01                	add    BYTE PTR [ecx],al
 3d6:	01 01                	add    DWORD PTR [ecx],eax
 3d8:	4f                   	dec    edi
 3d9:	00 00                	add    BYTE PTR [eax],al
 3db:	00 02                	add    BYTE PTR [edx],al
 3dd:	91                   	xchg   ecx,eax
 3de:	6c                   	ins    BYTE PTR es:[edi],dx
 3df:	14 70                	adc    al,0x70
 3e1:	69 64 00 01 02 01 8c 	imul   esp,DWORD PTR [eax+eax*1+0x1],0x8c0102
 3e8:	00 
 3e9:	00 00                	add    BYTE PTR [eax],al
 3eb:	02 91 68 13 65 02    	add    dl,BYTE PTR [ecx+0x2651368]
 3f1:	00 00                	add    BYTE PTR [eax],al
 3f3:	01 04 01             	add    DWORD PTR [ecx+eax*1],eax
 3f6:	c3                   	ret    
 3f7:	02 00                	add    al,BYTE PTR [eax]
 3f9:	00 02                	add    BYTE PTR [edx],al
 3fb:	91                   	xchg   ecx,eax
 3fc:	64 00 10             	add    BYTE PTR fs:[eax],dl
 3ff:	7a 00                	jp     401 <execInternalCommand-0x30ffbff>
 401:	00 00                	add    BYTE PTR [eax],al
 403:	14 04                	adc    al,0x4
 405:	00 00                	add    BYTE PTR [eax],al
 407:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 40a:	00 00                	add    BYTE PTR [eax],al
 40c:	09 11                	or     DWORD PTR [ecx],edx
 40e:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 411:	00 31                	add    BYTE PTR [ecx],dh
 413:	00 15 9f 02 00 00    	add    BYTE PTR ds:0x29f,dl
 419:	01 16                	add    DWORD PTR [esi],edx
 41b:	01 81 06 10 03 67    	add    DWORD PTR [ecx+0x67031006],eax
 421:	00 00                	add    BYTE PTR [eax],al
 423:	00 01                	add    BYTE PTR [ecx],al
 425:	9c                   	pushf  
 426:	59                   	pop    ecx
 427:	04 00                	add    al,0x0
 429:	00 16                	add    BYTE PTR [esi],dl
 42b:	92                   	xchg   edx,eax
 42c:	00 00                	add    BYTE PTR [eax],al
 42e:	00 01                	add    BYTE PTR [ecx],al
 430:	16                   	push   ss
 431:	01 74 00 00          	add    DWORD PTR [eax+eax*1+0x0],esi
 435:	00 02                	add    BYTE PTR [edx],al
 437:	91                   	xchg   ecx,eax
 438:	00 13                	add    BYTE PTR [ebx],dl
 43a:	d0 01                	rol    BYTE PTR [ecx],1
 43c:	00 00                	add    BYTE PTR [eax],al
 43e:	01 18                	add    DWORD PTR [eax],ebx
 440:	01 fe                	add    esi,edi
 442:	03 00                	add    eax,DWORD PTR [eax]
 444:	00 03                	add    BYTE PTR [ebx],al
 446:	91                   	xchg   ecx,eax
 447:	f8                   	clc    
 448:	7b 13                	jnp    45d <execInternalCommand-0x30ffba3>
 44a:	59                   	pop    ecx
 44b:	01 00                	add    DWORD PTR [eax],eax
 44d:	00 01                	add    BYTE PTR [ecx],al
 44f:	19 01                	sbb    DWORD PTR [ecx],eax
 451:	4f                   	dec    edi
 452:	00 00                	add    BYTE PTR [eax],al
 454:	00 02                	add    BYTE PTR [edx],al
 456:	91                   	xchg   ecx,eax
 457:	6c                   	ins    BYTE PTR es:[edi],dx
 458:	00 15 27 00 00 00    	add    BYTE PTR ds:0x27,dl
 45e:	01 24 01             	add    DWORD PTR [ecx+eax*1],esp
 461:	e8 06 10 03 58       	call   5803146c <sKShellProgramName+0x54f30178>
 466:	00 00                	add    BYTE PTR [eax],al
 468:	00 01                	add    BYTE PTR [ecx],al
 46a:	9c                   	pushf  
 46b:	8f 04 00             	pop    DWORD PTR [eax+eax*1]
 46e:	00 16                	add    BYTE PTR [esi],dl
 470:	92                   	xchg   edx,eax
 471:	00 00                	add    BYTE PTR [eax],al
 473:	00 01                	add    BYTE PTR [ecx],al
 475:	24 01                	and    al,0x1
 477:	74 00                	je     479 <execInternalCommand-0x30ffb87>
 479:	00 00                	add    BYTE PTR [eax],al
 47b:	02 91 00 13 d0 01    	add    dl,BYTE PTR [ecx+0x1d01300]
 481:	00 00                	add    BYTE PTR [eax],al
 483:	01 26                	add    DWORD PTR [esi],esp
 485:	01 fe                	add    esi,edi
 487:	03 00                	add    eax,DWORD PTR [eax]
 489:	00 03                	add    BYTE PTR [ebx],al
 48b:	91                   	xchg   ecx,eax
 48c:	fc                   	cld    
 48d:	7b 00                	jnp    48f <execInternalCommand-0x30ffb71>
 48f:	17                   	pop    ss
 490:	ef                   	out    dx,eax
 491:	02 00                	add    al,BYTE PTR [eax]
 493:	00 01                	add    BYTE PTR [ecx],al
 495:	31 01                	xor    DWORD PTR [ecx],eax
 497:	4f                   	dec    edi
 498:	00 00                	add    BYTE PTR [eax],al
 49a:	00 40 07             	add    BYTE PTR [eax+0x7],al
 49d:	10 03                	adc    BYTE PTR [ebx],al
 49f:	e8 01 00 00 01       	call   10004a5 <execInternalCommand-0x20ffb5b>
 4a4:	9c                   	pushf  
 4a5:	7f 05                	jg     4ac <execInternalCommand-0x30ffb54>
 4a7:	00 00                	add    BYTE PTR [eax],al
 4a9:	16                   	push   ss
 4aa:	b9 01 00 00 01       	mov    ecx,0x1000001
 4af:	31 01                	xor    DWORD PTR [ecx],eax
 4b1:	4f                   	dec    edi
 4b2:	00 00                	add    BYTE PTR [eax],al
 4b4:	00 02                	add    BYTE PTR [edx],al
 4b6:	91                   	xchg   ecx,eax
 4b7:	00 16                	add    BYTE PTR [esi],dl
 4b9:	0f 02 00             	lar    eax,WORD PTR [eax]
 4bc:	00 01                	add    BYTE PTR [ecx],al
 4be:	31 01                	xor    DWORD PTR [ecx],eax
 4c0:	c3                   	ret    
 4c1:	02 00                	add    al,BYTE PTR [eax]
 4c3:	00 02                	add    BYTE PTR [edx],al
 4c5:	91                   	xchg   ecx,eax
 4c6:	04 13                	add    al,0x13
 4c8:	00 01                	add    BYTE PTR [ecx],al
 4ca:	00 00                	add    BYTE PTR [eax],al
 4cc:	01 33                	add    DWORD PTR [ebx],esi
 4ce:	01 7f 05             	add    DWORD PTR [edi+0x5],edi
 4d1:	00 00                	add    BYTE PTR [eax],al
 4d3:	03 91 dc 7d 13 30    	add    edx,DWORD PTR [ecx+0x30137ddc]
 4d9:	02 00                	add    al,BYTE PTR [eax]
 4db:	00 01                	add    BYTE PTR [ecx],al
 4dd:	34 01                	xor    al,0x1
 4df:	81 00 00 00 03 91    	add    DWORD PTR [eax],0x91030000
 4e5:	db 7d 13             	fstp   TBYTE PTR [ebp+0x13]
 4e8:	68 00 00 00 01       	push   0x1000000
 4ed:	35 01 4f 00 00       	xor    eax,0x4f01
 4f2:	00 02                	add    BYTE PTR [edx],al
 4f4:	91                   	xchg   ecx,eax
 4f5:	6c                   	ins    BYTE PTR es:[edi],dx
 4f6:	13 36                	adc    esi,DWORD PTR [esi]
 4f8:	01 00                	add    DWORD PTR [eax],eax
 4fa:	00 01                	add    BYTE PTR [ecx],al
 4fc:	36 01 8f 05 00 00 03 	add    DWORD PTR ss:[edi+0x3000005],ecx
 503:	91                   	xchg   ecx,eax
 504:	97                   	xchg   edi,eax
 505:	6a 13                	push   0x13
 507:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 508:	02 00                	add    al,BYTE PTR [eax]
 50a:	00 01                	add    BYTE PTR [ecx],al
 50c:	37                   	aaa    
 50d:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 510:	00 00                	add    BYTE PTR [eax],al
 512:	02 91 68 13 39 02    	add    dl,BYTE PTR [ecx+0x2391368]
 518:	00 00                	add    BYTE PTR [eax],al
 51a:	01 38                	add    DWORD PTR [eax],edi
 51c:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 51f:	00 00                	add    BYTE PTR [eax],al
 521:	02 91 64 13 b2 02    	add    dl,BYTE PTR [ecx+0x2b21364]
 527:	00 00                	add    BYTE PTR [eax],al
 529:	01 39                	add    DWORD PTR [ecx],edi
 52b:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 52e:	00 00                	add    BYTE PTR [eax],al
 530:	02 91 60 13 57 02    	add    dl,BYTE PTR [ecx+0x2571360]
 536:	00 00                	add    BYTE PTR [eax],al
 538:	01 3a                	add    DWORD PTR [edx],edi
 53a:	01 a5 05 00 00 03    	add    DWORD PTR [ebp+0x3000005],esp
 540:	91                   	xchg   ecx,eax
 541:	83 6a 18 a1          	sub    DWORD PTR [edx+0x18],0xffffffa1
 545:	01 00                	add    DWORD PTR [eax],eax
 547:	00 01                	add    BYTE PTR [ecx],al
 549:	45                   	inc    ebp
 54a:	01 be 07 10 03 18    	add    DWORD PTR [esi+0x18031007],edi
 550:	f6 02 00             	test   BYTE PTR [edx],0x0
 553:	00 01                	add    BYTE PTR [ecx],al
 555:	4a                   	dec    edx
 556:	01 fa                	add    edx,edi
 558:	07                   	pop    es
 559:	10 03                	adc    BYTE PTR [ebx],al
 55b:	18 00                	sbb    BYTE PTR [eax],al
 55d:	00 00                	add    BYTE PTR [eax],al
 55f:	00 01                	add    BYTE PTR [ecx],al
 561:	99                   	cdq    
 562:	01 a1 08 10 03 0f    	add    DWORD PTR [ecx+0xf031008],esp
 568:	be 07 10 03 51       	mov    esi,0x51031007
 56d:	01 00                	add    DWORD PTR [eax],eax
 56f:	00 14 69             	add    BYTE PTR [ecx+ebp*2],dl
 572:	00 01                	add    BYTE PTR [ecx],al
 574:	9c                   	pushf  
 575:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 578:	00 00                	add    BYTE PTR [eax],al
 57a:	02 91 5c 00 00 10    	add    dl,BYTE PTR [ecx+0x1000005c]
 580:	7a 00                	jp     582 <execInternalCommand-0x30ffa7e>
 582:	00 00                	add    BYTE PTR [eax],al
 584:	8f 05 00 00 11 6b    	pop    DWORD PTR ds:0x6b110000
 58a:	00 00                	add    BYTE PTR [eax],al
 58c:	00 ff                	add    bh,bh
 58e:	00 10                	add    BYTE PTR [eax],dl
 590:	7a 00                	jp     592 <execInternalCommand-0x30ffa6e>
 592:	00 00                	add    BYTE PTR [eax],al
 594:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
 595:	05 00 00 11 6b       	add    eax,0x6b110000
 59a:	00 00                	add    BYTE PTR [eax],al
 59c:	00 31                	add    BYTE PTR [ecx],dh
 59e:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 5a1:	00 00                	add    BYTE PTR [eax],al
 5a3:	31 00                	xor    DWORD PTR [eax],eax
 5a5:	10 7a 00             	adc    BYTE PTR [edx+0x0],bh
 5a8:	00 00                	add    BYTE PTR [eax],al
 5aa:	b5 05                	mov    ch,0x5
 5ac:	00 00                	add    BYTE PTR [eax],al
 5ae:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 5b1:	00 00                	add    BYTE PTR [eax],al
 5b3:	13 00                	adc    eax,DWORD PTR [eax]
 5b5:	19 75 02             	sbb    DWORD PTR [ebp+0x2],esi
 5b8:	00 00                	add    BYTE PTR [eax],al
 5ba:	04 32                	add    al,0x32
 5bc:	8c 00                	mov    WORD PTR [eax],es
 5be:	00 00                	add    BYTE PTR [eax],al
 5c0:	05 03 e8 12 10       	add    eax,0x1012e803
 5c5:	03 19                	add    ebx,DWORD PTR [ecx]
 5c7:	ad                   	lods   eax,DWORD PTR ds:[esi]
 5c8:	01 00                	add    DWORD PTR [eax],eax
 5ca:	00 04 33             	add    BYTE PTR [ebx+esi*1],al
 5cd:	8c 00                	mov    WORD PTR [eax],es
 5cf:	00 00                	add    BYTE PTR [eax],al
 5d1:	05 03 ec 12 10       	add    eax,0x1012ec03
 5d6:	03 19                	add    ebx,DWORD PTR [ecx]
 5d8:	1f                   	pop    ds
 5d9:	00 00                	add    BYTE PTR [eax],al
 5db:	00 04 34             	add    BYTE PTR [esp+esi*1],al
 5de:	8c 00                	mov    WORD PTR [eax],es
 5e0:	00 00                	add    BYTE PTR [eax],al
 5e2:	05 03 e4 12 10       	add    eax,0x1012e403
 5e7:	03 10                	add    edx,DWORD PTR [eax]
 5e9:	7a 00                	jp     5eb <execInternalCommand-0x30ffa15>
 5eb:	00 00                	add    BYTE PTR [eax],al
 5ed:	f9                   	stc    
 5ee:	05 00 00 1a 6b       	add    eax,0x6b1a0000
 5f3:	00 00                	add    BYTE PTR [eax],al
 5f5:	00 ff                	add    bh,bh
 5f7:	01 00                	add    DWORD PTR [eax],eax
 5f9:	19 be 01 00 00 03    	sbb    DWORD PTR [esi+0x3000001],edi
 5ff:	1f                   	pop    ds
 600:	e8 05 00 00 05       	call   500060a <sKShellProgramName+0x1eff316>
 605:	03 e0                	add    esp,eax
 607:	10 10                	adc    BYTE PTR [eax],dl
 609:	03 19                	add    ebx,DWORD PTR [ecx]
 60b:	09 01                	or     DWORD PTR [ecx],eax
 60d:	00 00                	add    BYTE PTR [eax],al
 60f:	03 20                	add    esp,DWORD PTR [eax]
 611:	74 00                	je     613 <execInternalCommand-0x30ff9ed>
 613:	00 00                	add    BYTE PTR [eax],al
 615:	05 03 f4 12 10       	add    eax,0x1012f403
 61a:	03 10                	add    edx,DWORD PTR [eax]
 61c:	e2 00                	loop   61e <execInternalCommand-0x30ff9e2>
 61e:	00 00                	add    BYTE PTR [eax],al
 620:	2b 06                	sub    eax,DWORD PTR [esi]
 622:	00 00                	add    BYTE PTR [eax],al
 624:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 627:	00 00                	add    BYTE PTR [eax],al
 629:	03 00                	add    eax,DWORD PTR [eax]
 62b:	19 86 02 00 00 03    	sbb    DWORD PTR [esi+0x3000002],eax
 631:	21 1b                	and    DWORD PTR [ebx],ebx
 633:	06                   	push   es
 634:	00 00                	add    BYTE PTR [eax],al
 636:	05 03 a0 0f 10       	add    eax,0x100fa003
 63b:	03 1b                	add    ebx,DWORD PTR [ebx]
 63d:	19 3f                	sbb    DWORD PTR [edi],edi
 63f:	01 00                	add    DWORD PTR [eax],eax
 641:	00 03                	add    BYTE PTR [ebx],al
 643:	27                   	daa    
 644:	4e                   	dec    esi
 645:	06                   	push   es
 646:	00 00                	add    BYTE PTR [eax],al
 648:	05 03 f0 12 10       	add    eax,0x1012f003
 64d:	03 05 04 3c 06 00    	add    eax,DWORD PTR ds:0x63c04
 653:	00 1c 5f             	add    BYTE PTR [edi+ebx*2],bl
 656:	06                   	push   es
 657:	00 00                	add    BYTE PTR [eax],al
 659:	1d 74 00 00 00       	sbb    eax,0x74
 65e:	00 19                	add    BYTE PTR [ecx],bl
 660:	86 01                	xchg   BYTE PTR [ecx],al
 662:	00 00                	add    BYTE PTR [eax],al
 664:	03 28                	add    ebp,DWORD PTR [eax]
 666:	70 06                	jo     66e <execInternalCommand-0x30ff992>
 668:	00 00                	add    BYTE PTR [eax],al
 66a:	05 03 e0 12 10       	add    eax,0x1012e003
 66f:	03 05 04 54 06 00    	add    eax,DWORD PTR ds:0x65404
 675:	00 19                	add    BYTE PTR [ecx],bl
 677:	1c 01                	sbb    al,0x1
 679:	00 00                	add    BYTE PTR [eax],al
 67b:	01 12                	add    DWORD PTR [edx],edx
 67d:	97                   	xchg   edi,eax
 67e:	00 00                	add    BYTE PTR [eax],al
 680:	00 05 03 c0 10 10    	add    BYTE PTR ds:0x1010c003,al
 686:	03 19                	add    ebx,DWORD PTR [ecx]
 688:	14 02                	adc    al,0x2
 68a:	00 00                	add    BYTE PTR [eax],al
 68c:	01 13                	add    DWORD PTR [ebx],edx
 68e:	8c 00                	mov    WORD PTR [eax],es
 690:	00 00                	add    BYTE PTR [eax],al
 692:	05 03 c4 10 10       	add    eax,0x1010c403
 697:	03 00                	add    eax,DWORD PTR [eax]

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
  47:	26 00 49 13          	add    BYTE PTR es:[ecx+0x13],cl
  4b:	00 00                	add    BYTE PTR [eax],al
  4d:	08 13                	or     BYTE PTR [ebx],dl
  4f:	01 0b                	add    DWORD PTR [ebx],ecx
  51:	0b 3a                	or     edi,DWORD PTR [edx]
  53:	0b 3b                	or     edi,DWORD PTR [ebx]
  55:	0b 01                	or     eax,DWORD PTR [ecx]
  57:	13 00                	adc    eax,DWORD PTR [eax]
  59:	00 09                	add    BYTE PTR [ecx],cl
  5b:	0d 00 03 0e 3a       	or     eax,0x3a0e0300
  60:	0b 3b                	or     edi,DWORD PTR [ebx]
  62:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  65:	38 0b                	cmp    BYTE PTR [ebx],cl
  67:	00 00                	add    BYTE PTR [eax],al
  69:	0a 2e                	or     ch,BYTE PTR [esi]
  6b:	01 3f                	add    DWORD PTR [edi],edi
  6d:	19 03                	sbb    DWORD PTR [ebx],eax
  6f:	0e                   	push   cs
  70:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  72:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  74:	27                   	daa    
  75:	19 11                	sbb    DWORD PTR [ecx],edx
  77:	01 12                	add    DWORD PTR [edx],edx
  79:	06                   	push   es
  7a:	40                   	inc    eax
  7b:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  81:	00 00                	add    BYTE PTR [eax],al
  83:	0b 05 00 03 0e 3a    	or     eax,DWORD PTR ds:0x3a0e0300
  89:	0b 3b                	or     edi,DWORD PTR [ebx]
  8b:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  8e:	02 18                	add    bl,BYTE PTR [eax]
  90:	00 00                	add    BYTE PTR [eax],al
  92:	0c 34                	or     al,0x34
  94:	00 03                	add    BYTE PTR [ebx],al
  96:	08 3a                	or     BYTE PTR [edx],bh
  98:	0b 3b                	or     edi,DWORD PTR [ebx]
  9a:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  9d:	02 18                	add    bl,BYTE PTR [eax]
  9f:	00 00                	add    BYTE PTR [eax],al
  a1:	0d 2e 01 3f 19       	or     eax,0x193f012e
  a6:	03 0e                	add    ecx,DWORD PTR [esi]
  a8:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  aa:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  ac:	27                   	daa    
  ad:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
  b0:	11 01                	adc    DWORD PTR [ecx],eax
  b2:	12 06                	adc    al,BYTE PTR [esi]
  b4:	40                   	inc    eax
  b5:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  bb:	00 00                	add    BYTE PTR [eax],al
  bd:	0e                   	push   cs
  be:	34 00                	xor    al,0x0
  c0:	03 0e                	add    ecx,DWORD PTR [esi]
  c2:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  c4:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  c6:	49                   	dec    ecx
  c7:	13 02                	adc    eax,DWORD PTR [edx]
  c9:	18 00                	sbb    BYTE PTR [eax],al
  cb:	00 0f                	add    BYTE PTR [edi],cl
  cd:	0b 01                	or     eax,DWORD PTR [ecx]
  cf:	11 01                	adc    DWORD PTR [ecx],eax
  d1:	12 06                	adc    al,BYTE PTR [esi]
  d3:	00 00                	add    BYTE PTR [eax],al
  d5:	10 01                	adc    BYTE PTR [ecx],al
  d7:	01 49 13             	add    DWORD PTR [ecx+0x13],ecx
  da:	01 13                	add    DWORD PTR [ebx],edx
  dc:	00 00                	add    BYTE PTR [eax],al
  de:	11 21                	adc    DWORD PTR [ecx],esp
  e0:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
  e3:	2f                   	das    
  e4:	0b 00                	or     eax,DWORD PTR [eax]
  e6:	00 12                	add    BYTE PTR [edx],dl
  e8:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
  eb:	19 03                	sbb    DWORD PTR [ebx],eax
  ed:	0e                   	push   cs
  ee:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  f0:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  f2:	11 01                	adc    DWORD PTR [ecx],eax
  f4:	12 06                	adc    al,BYTE PTR [esi]
  f6:	40                   	inc    eax
  f7:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  fd:	00 00                	add    BYTE PTR [eax],al
  ff:	13 34 00             	adc    esi,DWORD PTR [eax+eax*1]
 102:	03 0e                	add    ecx,DWORD PTR [esi]
 104:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 106:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 10c:	00 00                	add    BYTE PTR [eax],al
 10e:	14 34                	adc    al,0x34
 110:	00 03                	add    BYTE PTR [ebx],al
 112:	08 3a                	or     BYTE PTR [edx],bh
 114:	0b 3b                	or     edi,DWORD PTR [ebx]
 116:	05 49 13 02 18       	add    eax,0x18021349
 11b:	00 00                	add    BYTE PTR [eax],al
 11d:	15 2e 01 3f 19       	adc    eax,0x193f012e
 122:	03 0e                	add    ecx,DWORD PTR [esi]
 124:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 126:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 12c:	12 06                	adc    al,BYTE PTR [esi]
 12e:	40                   	inc    eax
 12f:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 135:	00 00                	add    BYTE PTR [eax],al
 137:	16                   	push   ss
 138:	05 00 03 0e 3a       	add    eax,0x3a0e0300
 13d:	0b 3b                	or     edi,DWORD PTR [ebx]
 13f:	05 49 13 02 18       	add    eax,0x18021349
 144:	00 00                	add    BYTE PTR [eax],al
 146:	17                   	pop    ss
 147:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 14a:	19 03                	sbb    DWORD PTR [ebx],eax
 14c:	0e                   	push   cs
 14d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 14f:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 155:	11 01                	adc    DWORD PTR [ecx],eax
 157:	12 06                	adc    al,BYTE PTR [esi]
 159:	40                   	inc    eax
 15a:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 160:	00 00                	add    BYTE PTR [eax],al
 162:	18 0a                	sbb    BYTE PTR [edx],cl
 164:	00 03                	add    BYTE PTR [ebx],al
 166:	0e                   	push   cs
 167:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 169:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 16f:	19 34 00             	sbb    DWORD PTR [eax+eax*1],esi
 172:	03 0e                	add    ecx,DWORD PTR [esi]
 174:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 176:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 178:	49                   	dec    ecx
 179:	13 3f                	adc    edi,DWORD PTR [edi]
 17b:	19 02                	sbb    DWORD PTR [edx],eax
 17d:	18 00                	sbb    BYTE PTR [eax],al
 17f:	00 1a                	add    BYTE PTR [edx],bl
 181:	21 00                	and    DWORD PTR [eax],eax
 183:	49                   	dec    ecx
 184:	13 2f                	adc    ebp,DWORD PTR [edi]
 186:	05 00 00 1b 15       	add    eax,0x151b0000
 18b:	00 27                	add    BYTE PTR [edi],ah
 18d:	19 00                	sbb    DWORD PTR [eax],eax
 18f:	00 1c 15 01 27 19 01 	add    BYTE PTR [edx*1+0x1192701],bl
 196:	13 00                	adc    eax,DWORD PTR [eax]
 198:	00 1d 05 00 49 13    	add    BYTE PTR ds:0x13490005,bl
 19e:	00 00                	add    BYTE PTR [eax],al
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
  14:	28 09                	sub    BYTE PTR [ecx],cl
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	4d                   	dec    ebp
   1:	02 00                	add    al,BYTE PTR [eax]
   3:	00 02                	add    BYTE PTR [edx],al
   5:	00 b1 00 00 00 01    	add    BYTE PTR [ecx+0x1000000],dh
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
  57:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
  5a:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  5e:	65 00 2f             	add    BYTE PTR gs:[edi],ch
  61:	68 6f 6d 65 2f       	push   0x2f656d6f
  66:	79 6f                	jns    d7 <execInternalCommand-0x30fff29>
  68:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  6f:	6f                   	outs   dx,DWORD PTR ds:[esi]
  70:	73 2f                	jae    a1 <execInternalCommand-0x30fff5f>
  72:	6c                   	ins    BYTE PTR es:[edi],dx
  73:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  7a:	4f                   	dec    edi
  7b:	53                   	push   ebx
  7c:	2f                   	das    
  7d:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  84:	00 00                	add    BYTE PTR [eax],al
  86:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  8a:	6c                   	ins    BYTE PTR es:[edi],dx
  8b:	6c                   	ins    BYTE PTR es:[edi],dx
  8c:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
  8f:	00 00                	add    BYTE PTR [eax],al
  91:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  94:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
  9b:	63 
  9c:	2e                   	cs
  9d:	68 00 01 00 00       	push   0x100
  a2:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  a6:	6c                   	ins    BYTE PTR es:[edi],dx
  a7:	6c                   	ins    BYTE PTR es:[edi],dx
  a8:	2e                   	cs
  a9:	68 00 02 00 00       	push   0x200
  ae:	6d                   	ins    DWORD PTR es:[edi],dx
  af:	61                   	popa   
  b0:	6c                   	ins    BYTE PTR es:[edi],dx
  b1:	6c                   	ins    BYTE PTR es:[edi],dx
  b2:	6f                   	outs   dx,DWORD PTR ds:[esi]
  b3:	63 2e                	arpl   WORD PTR [esi],bp
  b5:	68 00 03 00 00       	push   0x300
  ba:	00 00                	add    BYTE PTR [eax],al
  bc:	05 02 00 00 10       	add    eax,0x10000002
  c1:	03 03                	add    eax,DWORD PTR [ebx]
  c3:	1b 01                	sbb    eax,DWORD PTR [ecx]
  c5:	75 08                	jne    cf <execInternalCommand-0x30fff31>
  c7:	14 68                	adc    al,0x68
  c9:	4c                   	dec    esp
  ca:	08 21                	or     BYTE PTR [ecx],ah
  cc:	08 21                	or     BYTE PTR [ecx],ah
  ce:	08 13                	or     BYTE PTR [ebx],dl
  d0:	03 0a                	add    ecx,DWORD PTR [edx]
  d2:	74 03                	je     d7 <execInternalCommand-0x30fff29>
  d4:	79 2e                	jns    104 <execInternalCommand-0x30ffefc>
  d6:	02 30                	add    dh,BYTE PTR [eax]
  d8:	19 2c 08             	sbb    DWORD PTR [eax+ecx*1],ebp
  db:	30 69 75             	xor    BYTE PTR [ecx+0x75],ch
  de:	d7                   	xlat   BYTE PTR ds:[ebx]
  df:	d8 08                	fmul   DWORD PTR [eax]
  e1:	3e                   	ds
  e2:	bd 00 02 04 01       	mov    ebp,0x1040200
  e7:	06                   	push   es
  e8:	e4 00                	in     al,0x0
  ea:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
  ed:	e4 06                	in     al,0x6
  ef:	e7 00                	out    0x0,eax
  f1:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
  f4:	06                   	push   es
  f5:	e4 06                	in     al,0x6
  f7:	e5 02                	in     eax,0x2
  f9:	23 13                	and    edx,DWORD PTR [ebx]
  fb:	08 2f                	or     BYTE PTR [edi],ch
  fd:	67 e3 34             	jcxz   134 <execInternalCommand-0x30ffecc>
 100:	00 02                	add    BYTE PTR [edx],al
 102:	04 02                	add    al,0x2
 104:	02 23                	add    ah,BYTE PTR [ebx]
 106:	14 00                	adc    al,0x0
 108:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
 10b:	03 6f 4a             	add    ebp,DWORD PTR [edi+0x4a]
 10e:	00 02                	add    BYTE PTR [edx],al
 110:	04 01                	add    al,0x1
 112:	06                   	push   es
 113:	4a                   	dec    edx
 114:	06                   	push   es
 115:	03 13                	add    edx,DWORD PTR [ebx]
 117:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 11a:	4b                   	dec    ebx
 11b:	08 33                	or     BYTE PTR [ebx],dh
 11d:	3d 5b 6a 92 02       	cmp    eax,0x2926a5b
 122:	3b 14 69             	cmp    edx,DWORD PTR [ecx+ebp*2]
 125:	00 02                	add    BYTE PTR [edx],al
 127:	04 02                	add    al,0x2
 129:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 12c:	00 02                	add    BYTE PTR [edx],al
 12e:	04 01                	add    al,0x1
 130:	06                   	push   es
 131:	4a                   	dec    edx
 132:	06                   	push   es
 133:	03 0b                	add    ecx,DWORD PTR [ebx]
 135:	66 59                	pop    cx
 137:	32 69 75             	xor    ch,BYTE PTR [ecx+0x75]
 13a:	75 75                	jne    1b1 <execInternalCommand-0x30ffe4f>
 13c:	75 75                	jne    1b3 <execInternalCommand-0x30ffe4d>
 13e:	78 a1                	js     e1 <execInternalCommand-0x30fff1f>
 140:	08 ec                	or     ah,ch
 142:	00 02                	add    BYTE PTR [edx],al
 144:	04 01                	add    al,0x1
 146:	06                   	push   es
 147:	66 06                	pushw  es
 149:	af                   	scas   eax,DWORD PTR es:[edi]
 14a:	68 75 08 4c 67       	push   0x674c0875
 14f:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 152:	5a                   	pop    edx
 153:	00 02                	add    BYTE PTR [edx],al
 155:	04 01                	add    al,0x1
 157:	06                   	push   es
 158:	9e                   	sahf   
 159:	00 02                	add    BYTE PTR [edx],al
 15b:	04 02                	add    al,0x2
 15d:	66                   	data16
 15e:	00 02                	add    BYTE PTR [edx],al
 160:	04 03                	add    al,0x3
 162:	66 06                	pushw  es
 164:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 165:	68 75 08 5a a0       	push   0xa05a0875
 16a:	bc 68 a0 94 08       	mov    esp,0x894a068
 16f:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 172:	94                   	xchg   esp,eax
 173:	08 33                	or     BYTE PTR [ebx],dh
 175:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 17a:	16                   	push   ss
 17b:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 17e:	03 3a                	add    edi,DWORD PTR [edx]
 180:	d6                   	(bad)  
 181:	68 d8 08 e7 08       	push   0x8e708d8
 186:	13 d7                	adc    edx,edi
 188:	08 e5                	or     ch,ah
 18a:	08 3e                	or     BYTE PTR [esi],bh
 18c:	4b                   	dec    ebx
 18d:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 190:	d9 d9                	(bad)  
 192:	d7                   	xlat   BYTE PTR ds:[ebx]
 193:	d7                   	xlat   BYTE PTR ds:[ebx]
 194:	3d 31 67 f3 00       	cmp    eax,0xf36731
 199:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 19c:	91                   	xchg   ecx,eax
 19d:	00 02                	add    BYTE PTR [edx],al
 19f:	04 03                	add    al,0x3
 1a1:	02 2c 11             	add    ch,BYTE PTR [ecx+edx*1]
 1a4:	00 02                	add    BYTE PTR [edx],al
 1a6:	04 01                	add    al,0x1
 1a8:	06                   	push   es
 1a9:	4a                   	dec    edx
 1aa:	06                   	push   es
 1ab:	68 3f 75 08 4c       	push   0x4c08753f
 1b0:	00 02                	add    BYTE PTR [edx],al
 1b2:	04 03                	add    al,0x3
 1b4:	92                   	xchg   edx,eax
 1b5:	00 02                	add    BYTE PTR [edx],al
 1b7:	04 03                	add    al,0x3
 1b9:	08 d7                	or     bh,dl
 1bb:	00 02                	add    BYTE PTR [edx],al
 1bd:	04 03                	add    al,0x3
 1bf:	02 2b                	add    ch,BYTE PTR [ebx]
 1c1:	0f 00 02             	sldt   WORD PTR [edx]
 1c4:	04 01                	add    al,0x1
 1c6:	06                   	push   es
 1c7:	4a                   	dec    edx
 1c8:	06                   	push   es
 1c9:	87 3d 5b 67 00 02    	xchg   DWORD PTR ds:0x200675b,edi
 1cf:	04 03                	add    al,0x3
 1d1:	91                   	xchg   ecx,eax
 1d2:	00 02                	add    BYTE PTR [edx],al
 1d4:	04 03                	add    al,0x3
 1d6:	ff 00                	inc    DWORD PTR [eax]
 1d8:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 1db:	06                   	push   es
 1dc:	4a                   	dec    edx
 1dd:	06                   	push   es
 1de:	84 d7                	test   bh,dl
 1e0:	3f                   	aas    
 1e1:	a0 08 bb 76 08       	mov    al,ds:0x876bb08
 1e6:	77 08                	ja     1f0 <execInternalCommand-0x30ffe10>
 1e8:	98                   	cwde   
 1e9:	da 08                	fimul  DWORD PTR [eax]
 1eb:	13 69 92             	adc    ebp,DWORD PTR [ecx-0x6e]
 1ee:	08 bc ae 08 24 02 22 	or     BYTE PTR [esi+ebp*4+0x22022408],bh
 1f5:	13 31                	adc    esi,DWORD PTR [ecx]
 1f7:	93                   	xchg   ebx,eax
 1f8:	08 ca                	or     dl,cl
 1fa:	08 bd 9f 75 3f 92    	or     BYTE PTR [ebp-0x6dc08a61],bh
 200:	75 76                	jne    278 <execInternalCommand-0x30ffd88>
 202:	75 75                	jne    279 <execInternalCommand-0x30ffd87>
 204:	77 59                	ja     25f <execInternalCommand-0x30ffda1>
 206:	75 08                	jne    210 <execInternalCommand-0x30ffdf0>
 208:	4b                   	dec    ebx
 209:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 20c:	5b                   	pop    ebx
 20d:	5b                   	pop    ebx
 20e:	75 75                	jne    285 <execInternalCommand-0x30ffd7b>
 210:	08 83 08 4c 75 30    	or     BYTE PTR [ebx+0x30754c08],al
 216:	08 56 b1             	or     BYTE PTR [esi-0x4f],dl
 219:	ae                   	scas   al,BYTE PTR es:[edi]
 21a:	03 0d 66 30 ae 03    	add    ecx,DWORD PTR ds:0x3ae3066
 220:	0d 82 31 03 09       	or     eax,0x9033182
 225:	ac                   	lods   al,BYTE PTR ds:[esi]
 226:	30 ae 68 03 0c e4    	xor    BYTE PTR [esi-0x1bf3fc98],ch
 22c:	b2 08                	mov    dl,0x8
 22e:	68 03 7a 58 03       	push   0x3587a03
 233:	09 20                	or     DWORD PTR [eax],esp
 235:	ad                   	lods   eax,DWORD PTR ds:[esi]
 236:	59                   	pop    ecx
 237:	08 4c 08 21          	or     BYTE PTR [eax+ecx*1+0x21],cl
 23b:	68 03 09 4a 02       	push   0x24a0903
 240:	27                   	daa    
 241:	13 03                	adc    eax,DWORD PTR [ebx]
 243:	98                   	cwde   
 244:	7f 66                	jg     2ac <execInternalCommand-0x30ffd54>
 246:	03 eb                	add    ebp,ebx
 248:	00 08                	add    BYTE PTR [eax],cl
 24a:	20 59 02             	and    BYTE PTR [ecx+0x2],bl
 24d:	02 00                	add    al,BYTE PTR [eax]
 24f:	01 01                	add    DWORD PTR [ecx],eax

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
 127:	64                   	fs
 128:	71 75                	jno    19f <execInternalCommand-0x30ffe61>
 12a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 12b:	74 65                	je     192 <execInternalCommand-0x30ffe6e>
 12d:	00 75 69             	add    BYTE PTR [ebp+0x69],dh
 130:	6e                   	outs   dx,BYTE PTR ds:[esi]
 131:	74 38                	je     16b <execInternalCommand-0x30ffe95>
 133:	5f                   	pop    edi
 134:	74 00                	je     136 <execInternalCommand-0x30ffeca>
 136:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 139:	6d                   	ins    DWORD PTR es:[edi],dx
 13a:	61                   	popa   
 13b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 13c:	64                   	fs
 13d:	73 00                	jae    13f <execInternalCommand-0x30ffec1>
 13f:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 142:	6d                   	ins    DWORD PTR es:[edi],dx
 143:	61                   	popa   
 144:	6e                   	outs   dx,BYTE PTR ds:[esi]
 145:	64                   	fs
 146:	5f                   	pop    edi
 147:	66                   	data16
 148:	75 6e                	jne    1b8 <execInternalCommand-0x30ffe48>
 14a:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 14e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 14f:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 152:	65                   	gs
 153:	65                   	gs
 154:	41                   	inc    ecx
 155:	72 67                	jb     1be <execInternalCommand-0x30ffe42>
 157:	56                   	push   esi
 158:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 15b:	72 61                	jb     1be <execInternalCommand-0x30ffe42>
 15d:	6d                   	ins    DWORD PTR es:[edi],dx
 15e:	43                   	inc    ebx
 15f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 160:	75 6e                	jne    1d0 <execInternalCommand-0x30ffe30>
 162:	74 00                	je     164 <execInternalCommand-0x30ffe9c>
 164:	70 63                	jo     1c9 <execInternalCommand-0x30ffe37>
 166:	6f                   	outs   dx,DWORD PTR ds:[esi]
 167:	75 6e                	jne    1d7 <execInternalCommand-0x30ffe29>
 169:	74 00                	je     16b <execInternalCommand-0x30ffe95>
 16b:	6c                   	ins    BYTE PTR es:[edi],dx
 16c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 16d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 16e:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 172:	6e                   	outs   dx,BYTE PTR ds:[esi]
 173:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 177:	74 00                	je     179 <execInternalCommand-0x30ffe87>
 179:	70 61                	jo     1dc <execInternalCommand-0x30ffe24>
 17b:	72 61                	jb     1de <execInternalCommand-0x30ffe22>
 17d:	6d                   	ins    DWORD PTR es:[edi],dx
 17e:	73 54                	jae    1d4 <execInternalCommand-0x30ffe2c>
 180:	6f                   	outs   dx,DWORD PTR ds:[esi]
 181:	41                   	inc    ecx
 182:	72 67                	jb     1eb <execInternalCommand-0x30ffe15>
 184:	76 00                	jbe    186 <execInternalCommand-0x30ffe7a>
 186:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 189:	6d                   	ins    DWORD PTR es:[edi],dx
 18a:	61                   	popa   
 18b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 18c:	64                   	fs
 18d:	5f                   	pop    edi
 18e:	66                   	data16
 18f:	75 6e                	jne    1ff <execInternalCommand-0x30ffe01>
 191:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 195:	6e                   	outs   dx,BYTE PTR ds:[esi]
 196:	5f                   	pop    edi
 197:	70 00                	jo     199 <execInternalCommand-0x30ffe67>
 199:	62 73 71             	bound  esi,QWORD PTR [ebx+0x71]
 19c:	75 6f                	jne    20d <execInternalCommand-0x30ffdf3>
 19e:	74 65                	je     205 <execInternalCommand-0x30ffdfb>
 1a0:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 1a3:	74 41                	je     1e6 <execInternalCommand-0x30ffe1a>
 1a5:	43                   	inc    ebx
 1a6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1a7:	6d                   	ins    DWORD PTR es:[edi],dx
 1a8:	6d                   	ins    DWORD PTR es:[edi],dx
 1a9:	61                   	popa   
 1aa:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1ab:	64 00 68 65          	add    BYTE PTR fs:[eax+0x65],ch
 1af:	61                   	popa   
 1b0:	70 43                	jo     1f5 <execInternalCommand-0x30ffe0b>
 1b2:	75 72                	jne    226 <execInternalCommand-0x30ffdda>
 1b4:	72 00                	jb     1b6 <execInternalCommand-0x30ffe4a>
 1b6:	6d                   	ins    DWORD PTR es:[edi],dx
 1b7:	61                   	popa   
 1b8:	78 61                	js     21b <execInternalCommand-0x30ffde5>
 1ba:	72 67                	jb     223 <execInternalCommand-0x30ffddd>
 1bc:	63 00                	arpl   WORD PTR [eax],ax
 1be:	73 45                	jae    205 <execInternalCommand-0x30ffdfb>
 1c0:	78 65                	js     227 <execInternalCommand-0x30ffdd9>
 1c2:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 1c5:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
 1cc:	72 61                	jb     22f <execInternalCommand-0x30ffdd1>
 1ce:	6d                   	ins    DWORD PTR es:[edi],dx
 1cf:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 1d2:	72 61                	jb     235 <execInternalCommand-0x30ffdcb>
 1d4:	6d                   	ins    DWORD PTR es:[edi],dx
 1d5:	73 00                	jae    1d7 <execInternalCommand-0x30ffe29>
 1d7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1d8:	61                   	popa   
 1d9:	6d                   	ins    DWORD PTR es:[edi],dx
 1da:	65 00 75 6e          	add    BYTE PTR gs:[ebp+0x6e],dh
 1de:	73 69                	jae    249 <execInternalCommand-0x30ffdb7>
 1e0:	67 6e                	outs   dx,BYTE PTR ds:[si]
 1e2:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 1e7:	61                   	popa   
 1e8:	72 00                	jb     1ea <execInternalCommand-0x30ffe16>
 1ea:	6c                   	ins    BYTE PTR es:[edi],dx
 1eb:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1ec:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1ed:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 1f1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1f2:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 1f6:	73 69                	jae    261 <execInternalCommand-0x30ffd9f>
 1f8:	67 6e                	outs   dx,BYTE PTR ds:[si]
 1fa:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 1ff:	74 00                	je     201 <execInternalCommand-0x30ffdff>
 201:	75 69                	jne    26c <execInternalCommand-0x30ffd94>
 203:	6e                   	outs   dx,BYTE PTR ds:[esi]
 204:	74 33                	je     239 <execInternalCommand-0x30ffdc7>
 206:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 209:	00 62 75             	add    BYTE PTR [edx+0x75],ah
 20c:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 213:	00 
 214:	65                   	gs
 215:	78 69                	js     280 <execInternalCommand-0x30ffd80>
 217:	74 43                	je     25c <execInternalCommand-0x30ffda4>
 219:	6f                   	outs   dx,DWORD PTR ds:[esi]
 21a:	64 65 00 73 68       	fs add BYTE PTR fs:gs:[ebx+0x68],dh
 21f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 220:	72 74                	jb     296 <execInternalCommand-0x30ffd6a>
 222:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 225:	73 69                	jae    290 <execInternalCommand-0x30ffd70>
 227:	67 6e                	outs   dx,BYTE PTR ds:[si]
 229:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 22e:	74 00                	je     230 <execInternalCommand-0x30ffdd0>
 230:	6c                   	ins    BYTE PTR es:[edi],dx
 231:	43                   	inc    ebx
 232:	75 72                	jne    2a6 <execInternalCommand-0x30ffd5a>
 234:	72 4b                	jb     281 <execInternalCommand-0x30ffd7f>
 236:	65                   	gs
 237:	79 00                	jns    239 <execInternalCommand-0x30ffdc7>
 239:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 23c:	6d                   	ins    DWORD PTR es:[edi],dx
 23d:	61                   	popa   
 23e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 23f:	64                   	fs
 240:	42                   	inc    edx
 241:	75 66                	jne    2a9 <execInternalCommand-0x30ffd57>
 243:	66 50                	push   ax
 245:	74 72                	je     2b9 <execInternalCommand-0x30ffd47>
 247:	00 5f 42             	add    BYTE PTR [edi+0x42],bl
 24a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 24b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 24c:	6c                   	ins    BYTE PTR es:[edi],dx
 24d:	00 6b 73             	add    BYTE PTR [ebx+0x73],ch
 250:	68 65 6c 6c 2e       	push   0x2e6c6c65
 255:	63 00                	arpl   WORD PTR [eax],ax
 257:	61                   	popa   
 258:	6e                   	outs   dx,BYTE PTR ds:[esi]
 259:	73 69                	jae    2c4 <execInternalCommand-0x30ffd3c>
 25b:	53                   	push   ebx
 25c:	65                   	gs
 25d:	71 00                	jno    25f <execInternalCommand-0x30ffda1>
 25f:	65                   	gs
 260:	78 65                	js     2c7 <execInternalCommand-0x30ffd39>
 262:	63 70 00             	arpl   WORD PTR [eax+0x0],si
 265:	70 72                	jo     2d9 <execInternalCommand-0x30ffd27>
 267:	6d                   	ins    DWORD PTR es:[edi],dx
 268:	73 00                	jae    26a <execInternalCommand-0x30ffd96>
 26a:	73 69                	jae    2d5 <execInternalCommand-0x30ffd2b>
 26c:	7a 65                	jp     2d3 <execInternalCommand-0x30ffd2d>
 26e:	00 6e 61             	add    BYTE PTR [esi+0x61],ch
 271:	72 67                	jb     2da <execInternalCommand-0x30ffd26>
 273:	76 00                	jbe    275 <execInternalCommand-0x30ffd8b>
 275:	68 65 61 70 42       	push   0x42706165
 27a:	61                   	popa   
 27b:	73 65                	jae    2e2 <execInternalCommand-0x30ffd1e>
 27d:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 280:	64                   	fs
 281:	4c                   	dec    esp
 282:	69 6e 65 00 63 6d 64 	imul   ebp,DWORD PTR [esi+0x65],0x646d6300
 289:	73 00                	jae    28b <execInternalCommand-0x30ffd75>
 28b:	66 69 6e 64 43 6f    	imul   bp,WORD PTR [esi+0x64],0x6f43
 291:	6d                   	ins    DWORD PTR es:[edi],dx
 292:	6d                   	ins    DWORD PTR es:[edi],dx
 293:	61                   	popa   
 294:	6e                   	outs   dx,BYTE PTR ds:[esi]
 295:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 299:	70 79                	jo     314 <execInternalCommand-0x30ffcec>
 29b:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 29e:	00 6b 53             	add    BYTE PTR [ebx+0x53],ch
 2a1:	6c                   	ins    BYTE PTR es:[edi],dx
 2a2:	65                   	gs
 2a3:	65                   	gs
 2a4:	70 00                	jo     2a6 <execInternalCommand-0x30ffd5a>
 2a6:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 2a9:	6d                   	ins    DWORD PTR es:[edi],dx
 2aa:	61                   	popa   
 2ab:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2ac:	64                   	fs
 2ad:	73 50                	jae    2ff <execInternalCommand-0x30ffd01>
 2af:	74 72                	je     323 <execInternalCommand-0x30ffcdd>
 2b1:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 2b4:	6d                   	ins    DWORD PTR es:[edi],dx
 2b5:	6d                   	ins    DWORD PTR es:[edi],dx
 2b6:	61                   	popa   
 2b7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2b8:	64                   	fs
 2b9:	57                   	push   edi
 2ba:	61                   	popa   
 2bb:	73 46                	jae    303 <execInternalCommand-0x30ffcfd>
 2bd:	72 6f                	jb     32e <execInternalCommand-0x30ffcd2>
 2bf:	6d                   	ins    DWORD PTR es:[edi],dx
 2c0:	54                   	push   esp
 2c1:	68 69 73 42 75       	push   0x75427369
 2c6:	66                   	data16
 2c7:	66                   	data16
 2c8:	65                   	gs
 2c9:	72 50                	jb     31b <execInternalCommand-0x30ffce5>
 2cb:	74 72                	je     33f <execInternalCommand-0x30ffcc1>
 2cd:	00 2f                	add    BYTE PTR [edi],ch
 2cf:	68 6f 6d 65 2f       	push   0x2f656d6f
 2d4:	79 6f                	jns    345 <execInternalCommand-0x30ffcbb>
 2d6:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 2dd:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2de:	73 2f                	jae    30f <execInternalCommand-0x30ffcf1>
 2e0:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 2e4:	6c                   	ins    BYTE PTR es:[edi],dx
 2e5:	6c                   	ins    BYTE PTR es:[edi],dx
 2e6:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 2e9:	6d                   	ins    DWORD PTR es:[edi],dx
 2ea:	6d                   	ins    DWORD PTR es:[edi],dx
 2eb:	61                   	popa   
 2ec:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2ed:	64 00 6b 53          	add    BYTE PTR fs:[ebx+0x53],ch
 2f1:	68 65 6c 6c 00       	push   0x6c6c65
 2f6:	67                   	addr16
 2f7:	65                   	gs
 2f8:	74 41                	je     33b <execInternalCommand-0x30ffcc5>
 2fa:	4b                   	dec    ebx
 2fb:	65                   	gs
 2fc:	79 00                	jns    2fe <execInternalCommand-0x30ffd02>

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
