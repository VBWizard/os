
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
 310000d:	e8 38 02 00 00       	call   310024a <findCommand>
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
 3100028:	05 08 11 10 03       	add    eax,0x3101108
 310002d:	8b 00                	mov    eax,DWORD PTR [eax]
 310002f:	a3 50 14 10 03       	mov    ds:0x3101450,eax
/home/yogi/src/os/kshell/kshell.c:36
        command_function_p = cmds[i].function;
 3100034:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100037:	c1 e0 04             	shl    eax,0x4
 310003a:	05 08 11 10 03       	add    eax,0x3101108
 310003f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100041:	a3 40 14 10 03       	mov    ds:0x3101440,eax
/home/yogi/src/os/kshell/kshell.c:37
        if (cmds[i].paramCount==0)
 3100046:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100049:	c1 e0 04             	shl    eax,0x4
 310004c:	05 0c 11 10 03       	add    eax,0x310110c
 3100051:	8b 00                	mov    eax,DWORD PTR [eax]
 3100053:	85 c0                	test   eax,eax
 3100055:	75 09                	jne    3100060 <execInternalCommand+0x60>
/home/yogi/src/os/kshell/kshell.c:38
            command_function();
 3100057:	a1 50 14 10 03       	mov    eax,ds:0x3101450
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
 3100060:	8b 1d 40 14 10 03    	mov    ebx,DWORD PTR ds:0x3101440
 3100066:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100069:	c1 e0 04             	shl    eax,0x4
 310006c:	05 00 11 10 03       	add    eax,0x3101100
 3100071:	8b 00                	mov    eax,DWORD PTR [eax]
 3100073:	83 ec 0c             	sub    esp,0xc
 3100076:	50                   	push   eax
 3100077:	e8 a4 0a 00 00       	call   3100b20 <kShell+0x2fb>
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
 3100098:	68 a4 0b 10 03       	push   0x3100ba4
 310009d:	e8 ce 09 00 00       	call   3100a70 <kShell+0x24b>
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
/home/yogi/src/os/kshell/kshell.c:54
    bool needDoubleQuotetoEndParam=0;
 31000ce:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/kshell/kshell.c:56
    
    memset(params,0, size);
 31000d2:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 31000d5:	83 ec 04             	sub    esp,0x4
 31000d8:	50                   	push   eax
 31000d9:	6a 00                	push   0x0
 31000db:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31000de:	e8 1d 0a 00 00       	call   3100b00 <kShell+0x2db>
 31000e3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:58
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31000e6:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 31000ed:	e9 1c 01 00 00       	jmp    310020e <parseParamsShell+0x163>
/home/yogi/src/os/kshell/kshell.c:60
    {
        if(cmdLine[cnt]=='"')
 31000f2:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31000f5:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31000f8:	01 d0                	add    eax,edx
 31000fa:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31000fd:	3c 22                	cmp    al,0x22
 31000ff:	75 3f                	jne    3100140 <parseParamsShell+0x95>
/home/yogi/src/os/kshell/kshell.c:62
        {
            if (!needDoubleQuotetoEndParam)
 3100101:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100105:	83 f0 01             	xor    eax,0x1
 3100108:	84 c0                	test   al,al
 310010a:	74 09                	je     3100115 <parseParamsShell+0x6a>
/home/yogi/src/os/kshell/kshell.c:64
            {
                needDoubleQuotetoEndParam=true;
 310010c:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
 3100110:	e9 f1 00 00 00       	jmp    3100206 <parseParamsShell+0x15b>
/home/yogi/src/os/kshell/kshell.c:68
            }
            else
            {
                params[y][x]='\0';
 3100115:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100118:	6b d0 32             	imul   edx,eax,0x32
 310011b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310011e:	01 c2                	add    edx,eax
 3100120:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100123:	01 d0                	add    eax,edx
 3100125:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:69
                {x=0;y++;lRetVal++;}
 3100128:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310012f:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100133:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/kshell/kshell.c:70
                needDoubleQuotetoEndParam=false;
 3100137:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
 310013b:	e9 c6 00 00 00       	jmp    3100206 <parseParamsShell+0x15b>
/home/yogi/src/os/kshell/kshell.c:73
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
 3100140:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100143:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100146:	01 d0                	add    eax,edx
 3100148:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310014b:	3c 20                	cmp    al,0x20
 310014d:	74 1e                	je     310016d <parseParamsShell+0xc2>
/home/yogi/src/os/kshell/kshell.c:73 (discriminator 2)
 310014f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100152:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100155:	01 d0                	add    eax,edx
 3100157:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310015a:	3c 2d                	cmp    al,0x2d
 310015c:	74 0f                	je     310016d <parseParamsShell+0xc2>
/home/yogi/src/os/kshell/kshell.c:73 (discriminator 4)
 310015e:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100161:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100164:	01 d0                	add    eax,edx
 3100166:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100169:	3c 2c                	cmp    al,0x2c
 310016b:	75 76                	jne    31001e3 <parseParamsShell+0x138>
/home/yogi/src/os/kshell/kshell.c:73 (discriminator 5)
 310016d:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100171:	83 f0 01             	xor    eax,0x1
 3100174:	84 c0                	test   al,al
 3100176:	74 6b                	je     31001e3 <parseParamsShell+0x138>
/home/yogi/src/os/kshell/kshell.c:76
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 3100178:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310017b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310017e:	01 d0                	add    eax,edx
 3100180:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100183:	3c 2d                	cmp    al,0x2d
 3100185:	74 0f                	je     3100196 <parseParamsShell+0xeb>
/home/yogi/src/os/kshell/kshell.c:76 (discriminator 1)
 3100187:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310018a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310018d:	01 d0                	add    eax,edx
 310018f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100192:	3c 2f                	cmp    al,0x2f
 3100194:	75 23                	jne    31001b9 <parseParamsShell+0x10e>
/home/yogi/src/os/kshell/kshell.c:77
                params[y][x++]=cmdLine[cnt];
 3100196:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100199:	6b d0 32             	imul   edx,eax,0x32
 310019c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310019f:	8d 0c 02             	lea    ecx,[edx+eax*1]
 31001a2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001a5:	8d 50 01             	lea    edx,[eax+0x1]
 31001a8:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31001ab:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31001ae:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 31001b1:	01 da                	add    edx,ebx
 31001b3:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31001b6:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/kshell/kshell.c:78
            params[y][x]='\0';
 31001b9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31001bc:	6b d0 32             	imul   edx,eax,0x32
 31001bf:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31001c2:	01 c2                	add    edx,eax
 31001c4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001c7:	01 d0                	add    eax,edx
 31001c9:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:79
            if (cnt>0)
 31001cc:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 31001d0:	74 34                	je     3100206 <parseParamsShell+0x15b>
/home/yogi/src/os/kshell/kshell.c:80
                {x=0;y++;lRetVal++;}
 31001d2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31001d9:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 31001dd:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/kshell/kshell.c:79
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 31001e1:	eb 23                	jmp    3100206 <parseParamsShell+0x15b>
/home/yogi/src/os/kshell/kshell.c:85
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 31001e3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31001e6:	6b d0 32             	imul   edx,eax,0x32
 31001e9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31001ec:	8d 0c 02             	lea    ecx,[edx+eax*1]
 31001ef:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001f2:	8d 50 01             	lea    edx,[eax+0x1]
 31001f5:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31001f8:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31001fb:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 31001fe:	01 da                	add    edx,ebx
 3100200:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100203:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/kshell/kshell.c:87 (discriminator 2)
        }
        parsedChars++;
 3100206:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/kshell/kshell.c:58 (discriminator 2)
    int lRetVal=0,parsedChars=0;
    bool needDoubleQuotetoEndParam=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 310020a:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/kshell/kshell.c:58 (discriminator 1)
 310020e:	83 ec 0c             	sub    esp,0xc
 3100211:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100214:	e8 07 09 00 00       	call   3100b20 <kShell+0x2fb>
 3100219:	83 c4 10             	add    esp,0x10
 310021c:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 310021f:	0f 87 cd fe ff ff    	ja     31000f2 <parseParamsShell+0x47>
/home/yogi/src/os/kshell/kshell.c:89
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 3100225:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100229:	74 17                	je     3100242 <parseParamsShell+0x197>
/home/yogi/src/os/kshell/kshell.c:91
    {
        lRetVal++;
 310022b:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/kshell/kshell.c:92
        params[y][x]='\0';
 310022f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100232:	6b d0 32             	imul   edx,eax,0x32
 3100235:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100238:	01 c2                	add    edx,eax
 310023a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310023d:	01 d0                	add    eax,edx
 310023f:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:97
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 3100242:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/kshell/kshell.c:98
}
 3100245:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100248:	c9                   	leave  
 3100249:	c3                   	ret    

0310024a <findCommand>:
findCommand():
/home/yogi/src/os/kshell/kshell.c:101

int findCommand(char* command)
{
 310024a:	55                   	push   ebp
 310024b:	89 e5                	mov    ebp,esp
 310024d:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:105
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3100250:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100257:	eb 4d                	jmp    31002a6 <findCommand+0x5c>
/home/yogi/src/os/kshell/kshell.c:107
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 3100259:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310025c:	c1 e0 04             	shl    eax,0x4
 310025f:	05 00 11 10 03       	add    eax,0x3101100
 3100264:	8b 00                	mov    eax,DWORD PTR [eax]
 3100266:	83 ec 0c             	sub    esp,0xc
 3100269:	50                   	push   eax
 310026a:	e8 b1 08 00 00       	call   3100b20 <kShell+0x2fb>
 310026f:	83 c4 10             	add    esp,0x10
 3100272:	89 c2                	mov    edx,eax
 3100274:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100277:	c1 e0 04             	shl    eax,0x4
 310027a:	05 00 11 10 03       	add    eax,0x3101100
 310027f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100281:	83 ec 04             	sub    esp,0x4
 3100284:	52                   	push   edx
 3100285:	50                   	push   eax
 3100286:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100289:	e8 62 08 00 00       	call   3100af0 <kShell+0x2cb>
 310028e:	83 c4 10             	add    esp,0x10
 3100291:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:109
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 3100294:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100298:	75 08                	jne    31002a2 <findCommand+0x58>
/home/yogi/src/os/kshell/kshell.c:112
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 310029a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310029d:	83 c0 01             	add    eax,0x1
 31002a0:	eb 0f                	jmp    31002b1 <findCommand+0x67>
/home/yogi/src/os/kshell/kshell.c:105 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 31002a2:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:105 (discriminator 1)
 31002a6:	83 7d f4 03          	cmp    DWORD PTR [ebp-0xc],0x3
 31002aa:	76 ad                	jbe    3100259 <findCommand+0xf>
/home/yogi/src/os/kshell/kshell.c:116
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 31002ac:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/kshell/kshell.c:117
}
 31002b1:	c9                   	leave  
 31002b2:	c3                   	ret    

031002b3 <buildargv>:
buildargv():
/home/yogi/src/os/kshell/kshell.c:121

/*parts from http://*/
char **buildargv (const char *input)
{
 31002b3:	55                   	push   ebp
 31002b4:	89 e5                	mov    ebp,esp
 31002b6:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/kshell/kshell.c:124
  char *arg;
  char *copybuf;
  int squote = 0;
 31002b9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/kshell/kshell.c:125
  int dquote = 0;
 31002c0:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:126
  int bsquote = 0;
 31002c7:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/kshell/kshell.c:127
  int argc = 0;
 31002ce:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/kshell/kshell.c:128
  int maxargc = 0;
 31002d5:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/kshell/kshell.c:129
  char **argv = NULL;
 31002dc:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/kshell/kshell.c:133
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 31002e3:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 31002e7:	0f 84 33 02 00 00    	je     3100520 <buildargv+0x26d>
/home/yogi/src/os/kshell/kshell.c:136
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 31002ed:	83 ec 0c             	sub    esp,0xc
 31002f0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31002f3:	e8 28 08 00 00       	call   3100b20 <kShell+0x2fb>
 31002f8:	83 c4 10             	add    esp,0x10
 31002fb:	83 c0 01             	add    eax,0x1
 31002fe:	83 ec 0c             	sub    esp,0xc
 3100301:	50                   	push   eax
 3100302:	e8 99 07 00 00       	call   3100aa0 <kShell+0x27b>
 3100307:	83 c4 10             	add    esp,0x10
 310030a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:144
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 310030d:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 3100311:	74 0b                	je     310031e <buildargv+0x6b>
/home/yogi/src/os/kshell/kshell.c:144 (discriminator 1)
 3100313:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100316:	83 e8 01             	sub    eax,0x1
 3100319:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 310031c:	7f 3d                	jg     310035b <buildargv+0xa8>
/home/yogi/src/os/kshell/kshell.c:147
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 310031e:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 3100322:	75 1c                	jne    3100340 <buildargv+0x8d>
/home/yogi/src/os/kshell/kshell.c:149
		{
		  maxargc = INITIAL_MAXARGC;
 3100324:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/kshell/kshell.c:150
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 310032b:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 310032e:	c1 e0 02             	shl    eax,0x2
 3100331:	83 ec 0c             	sub    esp,0xc
 3100334:	50                   	push   eax
 3100335:	e8 66 07 00 00       	call   3100aa0 <kShell+0x27b>
 310033a:	83 c4 10             	add    esp,0x10
 310033d:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/kshell/kshell.c:152
		}
	      argv = nargv;
 3100340:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 3100343:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/kshell/kshell.c:153
	      argv[argc] = NULL;
 3100346:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100349:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100350:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100353:	01 d0                	add    eax,edx
 3100355:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:156
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 310035b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310035e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:157
	  while (*input != EOS)
 3100361:	e9 ec 00 00 00       	jmp    3100452 <buildargv+0x19f>
/home/yogi/src/os/kshell/kshell.c:159
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100366:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100369:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310036c:	3c 20                	cmp    al,0x20
 310036e:	75 16                	jne    3100386 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:159 (discriminator 1)
 3100370:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100374:	75 10                	jne    3100386 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:159 (discriminator 2)
 3100376:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 310037a:	75 0a                	jne    3100386 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:159 (discriminator 3)
 310037c:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100380:	0f 84 da 00 00 00    	je     3100460 <buildargv+0x1ad>
/home/yogi/src/os/kshell/kshell.c:165
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100386:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310038a:	74 1d                	je     31003a9 <buildargv+0xf6>
/home/yogi/src/os/kshell/kshell.c:167
		    {
		      bsquote = 0;
 310038c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/kshell/kshell.c:168
		      *arg++ = *input;
 3100393:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100396:	8d 50 01             	lea    edx,[eax+0x1]
 3100399:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310039c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310039f:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31003a2:	88 10                	mov    BYTE PTR [eax],dl
 31003a4:	e9 a5 00 00 00       	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:170
		    }
		  else if (*input == '\\')
 31003a9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003ac:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003af:	3c 5c                	cmp    al,0x5c
 31003b1:	75 0c                	jne    31003bf <buildargv+0x10c>
/home/yogi/src/os/kshell/kshell.c:172
		    {
		      bsquote = 1;
 31003b3:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 31003ba:	e9 8f 00 00 00       	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:174
		    }
		  else if (squote)
 31003bf:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31003c3:	74 26                	je     31003eb <buildargv+0x138>
/home/yogi/src/os/kshell/kshell.c:176
		    {
		      if (*input == '\'')
 31003c5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003c8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003cb:	3c 27                	cmp    al,0x27
 31003cd:	75 09                	jne    31003d8 <buildargv+0x125>
/home/yogi/src/os/kshell/kshell.c:178
			{
			  squote = 0;
 31003cf:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 31003d6:	eb 76                	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:182
			}
		      else
			{
			  *arg++ = *input;
 31003d8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31003db:	8d 50 01             	lea    edx,[eax+0x1]
 31003de:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31003e1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31003e4:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31003e7:	88 10                	mov    BYTE PTR [eax],dl
 31003e9:	eb 63                	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:185
			}
		    }
		  else if (dquote)
 31003eb:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31003ef:	74 26                	je     3100417 <buildargv+0x164>
/home/yogi/src/os/kshell/kshell.c:187
		    {
		      if (*input == '"')
 31003f1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003f4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003f7:	3c 22                	cmp    al,0x22
 31003f9:	75 09                	jne    3100404 <buildargv+0x151>
/home/yogi/src/os/kshell/kshell.c:189
			{
			  dquote = 0;
 31003fb:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 3100402:	eb 4a                	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:193
			}
		      else
			{
			  *arg++ = *input;
 3100404:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100407:	8d 50 01             	lea    edx,[eax+0x1]
 310040a:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310040d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100410:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100413:	88 10                	mov    BYTE PTR [eax],dl
 3100415:	eb 37                	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:198
			}
		    }
		  else
		    {
		      if (*input == '\'')
 3100417:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310041a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310041d:	3c 27                	cmp    al,0x27
 310041f:	75 09                	jne    310042a <buildargv+0x177>
/home/yogi/src/os/kshell/kshell.c:200
			{
			  squote = 1;
 3100421:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 3100428:	eb 24                	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:202
			}
		      else if (*input == '"')
 310042a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310042d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100430:	3c 22                	cmp    al,0x22
 3100432:	75 09                	jne    310043d <buildargv+0x18a>
/home/yogi/src/os/kshell/kshell.c:204
			{
			  dquote = 1;
 3100434:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 310043b:	eb 11                	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:208
			}
		      else
			{
			  *arg++ = *input;
 310043d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100440:	8d 50 01             	lea    edx,[eax+0x1]
 3100443:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100446:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100449:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310044c:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/kshell/kshell.c:212
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 310044e:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/kshell/kshell.c:157
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 3100452:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100455:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100458:	84 c0                	test   al,al
 310045a:	0f 85 06 ff ff ff    	jne    3100366 <buildargv+0xb3>
/home/yogi/src/os/kshell/kshell.c:215
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 3100460:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100463:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:217
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100466:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100469:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310046c:	84 c0                	test   al,al
 310046e:	0f 84 9e 00 00 00    	je     3100512 <buildargv+0x25f>
/home/yogi/src/os/kshell/kshell.c:219
          {
            char* temp=malloc(strlen(copybuf)+1);
 3100474:	83 ec 0c             	sub    esp,0xc
 3100477:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310047a:	e8 a1 06 00 00       	call   3100b20 <kShell+0x2fb>
 310047f:	83 c4 10             	add    esp,0x10
 3100482:	83 c0 01             	add    eax,0x1
 3100485:	83 ec 0c             	sub    esp,0xc
 3100488:	50                   	push   eax
 3100489:	e8 12 06 00 00       	call   3100aa0 <kShell+0x27b>
 310048e:	83 c4 10             	add    esp,0x10
 3100491:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/kshell/kshell.c:222
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 3100494:	83 ec 08             	sub    esp,0x8
 3100497:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310049a:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 310049d:	e8 ae 05 00 00       	call   3100a50 <kShell+0x22b>
 31004a2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:223
            free(copybuf);
 31004a5:	83 ec 0c             	sub    esp,0xc
 31004a8:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31004ab:	e8 80 06 00 00       	call   3100b30 <kShell+0x30b>
 31004b0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:224
            copybuf = (char *) malloc (strlen (input) + 1);
 31004b3:	83 ec 0c             	sub    esp,0xc
 31004b6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31004b9:	e8 62 06 00 00       	call   3100b20 <kShell+0x2fb>
 31004be:	83 c4 10             	add    esp,0x10
 31004c1:	83 c0 01             	add    eax,0x1
 31004c4:	83 ec 0c             	sub    esp,0xc
 31004c7:	50                   	push   eax
 31004c8:	e8 d3 05 00 00       	call   3100aa0 <kShell+0x27b>
 31004cd:	83 c4 10             	add    esp,0x10
 31004d0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:225
            argv[argc] = temp;
 31004d3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31004d6:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31004dd:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31004e0:	01 c2                	add    edx,eax
 31004e2:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 31004e5:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/kshell/kshell.c:227
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 31004e7:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/kshell/kshell.c:228
            argv[argc] = NULL;
 31004eb:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31004ee:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31004f5:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31004f8:	01 d0                	add    eax,edx
 31004fa:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:229
            input++;
 3100500:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/kshell/kshell.c:230
            free(temp);
 3100504:	83 ec 0c             	sub    esp,0xc
 3100507:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 310050a:	e8 21 06 00 00       	call   3100b30 <kShell+0x30b>
 310050f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:233
          }
	}
      while (*input != EOS);
 3100512:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100515:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100518:	84 c0                	test   al,al
 310051a:	0f 85 ed fd ff ff    	jne    310030d <buildargv+0x5a>
/home/yogi/src/os/kshell/kshell.c:236
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 3100520:	83 ec 0c             	sub    esp,0xc
 3100523:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100526:	e8 05 06 00 00       	call   3100b30 <kShell+0x30b>
 310052b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:237
  free(nargv);
 310052e:	83 ec 0c             	sub    esp,0xc
 3100531:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100534:	e8 f7 05 00 00       	call   3100b30 <kShell+0x30b>
 3100539:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:238
  return (argv);
 310053c:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/kshell/kshell.c:239
}
 310053f:	c9                   	leave  
 3100540:	c3                   	ret    

03100541 <helpMe>:
helpMe():
/home/yogi/src/os/kshell/kshell.c:242

void helpMe()
{
 3100541:	55                   	push   ebp
 3100542:	89 e5                	mov    ebp,esp
 3100544:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:243
    print("Help:\n");
 3100547:	83 ec 0c             	sub    esp,0xc
 310054a:	68 c4 0b 10 03       	push   0x3100bc4
 310054f:	e8 1c 05 00 00       	call   3100a70 <kShell+0x24b>
 3100554:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:244
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100557:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310055e:	eb 30                	jmp    3100590 <helpMe+0x4f>
/home/yogi/src/os/kshell/kshell.c:245 (discriminator 3)
        print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100560:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100563:	c1 e0 04             	shl    eax,0x4
 3100566:	05 04 11 10 03       	add    eax,0x3101104
 310056b:	8b 10                	mov    edx,DWORD PTR [eax]
 310056d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100570:	c1 e0 04             	shl    eax,0x4
 3100573:	05 00 11 10 03       	add    eax,0x3101100
 3100578:	8b 00                	mov    eax,DWORD PTR [eax]
 310057a:	83 ec 04             	sub    esp,0x4
 310057d:	52                   	push   edx
 310057e:	50                   	push   eax
 310057f:	68 cb 0b 10 03       	push   0x3100bcb
 3100584:	e8 e7 04 00 00       	call   3100a70 <kShell+0x24b>
 3100589:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:244 (discriminator 3)
}

void helpMe()
{
    print("Help:\n");
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 310058c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:244 (discriminator 1)
 3100590:	83 7d f4 03          	cmp    DWORD PTR [ebp-0xc],0x3
 3100594:	76 ca                	jbe    3100560 <helpMe+0x1f>
/home/yogi/src/os/kshell/kshell.c:246
        print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
}
 3100596:	90                   	nop
 3100597:	c9                   	leave  
 3100598:	c3                   	ret    

03100599 <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/kshell/kshell.c:249

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH])
{
 3100599:	55                   	push   ebp
 310059a:	89 e5                	mov    ebp,esp
 310059c:	53                   	push   ebx
 310059d:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/kshell/kshell.c:250
    char** pptr=malloc(sizeof(char*)*pcount);
 31005a0:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31005a3:	c1 e0 02             	shl    eax,0x2
 31005a6:	83 ec 0c             	sub    esp,0xc
 31005a9:	50                   	push   eax
 31005aa:	e8 f1 04 00 00       	call   3100aa0 <kShell+0x27b>
 31005af:	83 c4 10             	add    esp,0x10
 31005b2:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:252
    
    for (int cnt=0;cnt<pcount;cnt++)
 31005b5:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31005bc:	eb 4e                	jmp    310060c <paramsToArgv+0x73>
/home/yogi/src/os/kshell/kshell.c:254 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 31005be:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005c1:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31005c8:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31005cb:	8d 1c 02             	lea    ebx,[edx+eax*1]
 31005ce:	83 ec 0c             	sub    esp,0xc
 31005d1:	6a 32                	push   0x32
 31005d3:	e8 c8 04 00 00       	call   3100aa0 <kShell+0x27b>
 31005d8:	83 c4 10             	add    esp,0x10
 31005db:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/kshell/kshell.c:255 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 31005dd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005e0:	6b d0 32             	imul   edx,eax,0x32
 31005e3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31005e6:	01 c2                	add    edx,eax
 31005e8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005eb:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 31005f2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31005f5:	01 c8                	add    eax,ecx
 31005f7:	8b 00                	mov    eax,DWORD PTR [eax]
 31005f9:	83 ec 04             	sub    esp,0x4
 31005fc:	6a 32                	push   0x32
 31005fe:	52                   	push   edx
 31005ff:	50                   	push   eax
 3100600:	e8 8b 04 00 00       	call   3100a90 <kShell+0x26b>
 3100605:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:252 (discriminator 3)

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH])
{
    char** pptr=malloc(sizeof(char*)*pcount);
    
    for (int cnt=0;cnt<pcount;cnt++)
 3100608:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:252 (discriminator 1)
 310060c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310060f:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100612:	7c aa                	jl     31005be <paramsToArgv+0x25>
/home/yogi/src/os/kshell/kshell.c:257
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
 3100614:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
/home/yogi/src/os/kshell/kshell.c:258
}
 3100617:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 310061a:	c9                   	leave  
 310061b:	c3                   	ret    

0310061c <freeArgV>:
freeArgV():
/home/yogi/src/os/kshell/kshell.c:261

void freeArgV(int pcount, char **params)
{
 310061c:	55                   	push   ebp
 310061d:	89 e5                	mov    ebp,esp
 310061f:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:262
    for (int cnt=0;cnt<pcount;cnt++)
 3100622:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100629:	eb 15                	jmp    3100640 <freeArgV+0x24>
/home/yogi/src/os/kshell/kshell.c:263 (discriminator 3)
        free(*params);
 310062b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310062e:	8b 00                	mov    eax,DWORD PTR [eax]
 3100630:	83 ec 0c             	sub    esp,0xc
 3100633:	50                   	push   eax
 3100634:	e8 f7 04 00 00       	call   3100b30 <kShell+0x30b>
 3100639:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:262 (discriminator 3)
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 310063c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:262 (discriminator 1)
 3100640:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100643:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100646:	7c e3                	jl     310062b <freeArgV+0xf>
/home/yogi/src/os/kshell/kshell.c:264
        free(*params);
    free(params);
 3100648:	83 ec 0c             	sub    esp,0xc
 310064b:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 310064e:	e8 dd 04 00 00       	call   3100b30 <kShell+0x30b>
 3100653:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:265
}
 3100656:	90                   	nop
 3100657:	c9                   	leave  
 3100658:	c3                   	ret    

03100659 <execp>:
execp():
/home/yogi/src/os/kshell/kshell.c:268

void execp(char* cmdline)
{
 3100659:	55                   	push   ebp
 310065a:	89 e5                	mov    ebp,esp
 310065c:	81 ec 18 02 00 00    	sub    esp,0x218
/home/yogi/src/os/kshell/kshell.c:269
    bool background=false;
 3100662:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/src/os/kshell/kshell.c:270
    int programParamNum=0;
 3100666:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:272
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 310066d:	83 ec 04             	sub    esp,0x4
 3100670:	68 f4 01 00 00       	push   0x1f4
 3100675:	8d 85 f0 fd ff ff    	lea    eax,[ebp-0x210]
 310067b:	50                   	push   eax
 310067c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310067f:	e8 27 fa ff ff       	call   31000ab <parseParamsShell>
 3100684:	83 c4 10             	add    esp,0x10
 3100687:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/kshell/kshell.c:273
    uint32_t pid=0;
 310068a:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:275

    char** prms=paramsToArgv(paramCount,&params[0][0]);
 3100691:	83 ec 08             	sub    esp,0x8
 3100694:	8d 85 f0 fd ff ff    	lea    eax,[ebp-0x210]
 310069a:	50                   	push   eax
 310069b:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310069e:	e8 f6 fe ff ff       	call   3100599 <paramsToArgv>
 31006a3:	83 c4 10             	add    esp,0x10
 31006a6:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/kshell/kshell.c:277
    
    if (strcmp(params[0],"/b")==0)
 31006a9:	83 ec 08             	sub    esp,0x8
 31006ac:	68 d4 0b 10 03       	push   0x3100bd4
 31006b1:	8d 85 f0 fd ff ff    	lea    eax,[ebp-0x210]
 31006b7:	50                   	push   eax
 31006b8:	e8 53 04 00 00       	call   3100b10 <kShell+0x2eb>
 31006bd:	83 c4 10             	add    esp,0x10
 31006c0:	85 c0                	test   eax,eax
 31006c2:	75 08                	jne    31006cc <execp+0x73>
/home/yogi/src/os/kshell/kshell.c:279
    {
        background=true;
 31006c4:	c6 45 f7 01          	mov    BYTE PTR [ebp-0x9],0x1
/home/yogi/src/os/kshell/kshell.c:280
        programParamNum++;
 31006c8:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/kshell/kshell.c:282
    }
    print ("Executing %s\n",params[programParamNum]);
 31006cc:	8d 95 f0 fd ff ff    	lea    edx,[ebp-0x210]
 31006d2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31006d5:	6b c0 32             	imul   eax,eax,0x32
 31006d8:	01 d0                	add    eax,edx
 31006da:	83 ec 08             	sub    esp,0x8
 31006dd:	50                   	push   eax
 31006de:	68 d7 0b 10 03       	push   0x3100bd7
 31006e3:	e8 88 03 00 00       	call   3100a70 <kShell+0x24b>
 31006e8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:283
    pid=exec(params[programParamNum],paramCount-programParamNum,prms);
 31006eb:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 31006ee:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
 31006f1:	8d 8d f0 fd ff ff    	lea    ecx,[ebp-0x210]
 31006f7:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
 31006fa:	6b d2 32             	imul   edx,edx,0x32
 31006fd:	01 ca                	add    edx,ecx
 31006ff:	83 ec 04             	sub    esp,0x4
 3100702:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100705:	50                   	push   eax
 3100706:	52                   	push   edx
 3100707:	e8 d4 03 00 00       	call   3100ae0 <kShell+0x2bb>
 310070c:	83 c4 10             	add    esp,0x10
 310070f:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/kshell/kshell.c:284
    if (pid>0)
 3100712:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100716:	74 1b                	je     3100733 <execp+0xda>
/home/yogi/src/os/kshell/kshell.c:286
    {
        if (!background)
 3100718:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 310071c:	83 f0 01             	xor    eax,0x1
 310071f:	84 c0                	test   al,al
 3100721:	74 2f                	je     3100752 <execp+0xf9>
/home/yogi/src/os/kshell/kshell.c:287
            waitpid(pid);
 3100723:	83 ec 0c             	sub    esp,0xc
 3100726:	ff 75 e8             	push   DWORD PTR [ebp-0x18]
 3100729:	e8 32 03 00 00       	call   3100a60 <kShell+0x23b>
 310072e:	83 c4 10             	add    esp,0x10
 3100731:	eb 1f                	jmp    3100752 <execp+0xf9>
/home/yogi/src/os/kshell/kshell.c:290
    }
    else
        print("Error executing %s\n",params[programParamNum]);
 3100733:	8d 95 f0 fd ff ff    	lea    edx,[ebp-0x210]
 3100739:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310073c:	6b c0 32             	imul   eax,eax,0x32
 310073f:	01 d0                	add    eax,edx
 3100741:	83 ec 08             	sub    esp,0x8
 3100744:	50                   	push   eax
 3100745:	68 e5 0b 10 03       	push   0x3100be5
 310074a:	e8 21 03 00 00       	call   3100a70 <kShell+0x24b>
 310074f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:291
    freeArgV(paramCount, (char**)prms);
 3100752:	83 ec 08             	sub    esp,0x8
 3100755:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
 3100758:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310075b:	e8 bc fe ff ff       	call   310061c <freeArgV>
 3100760:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:292
}
 3100763:	90                   	nop
 3100764:	c9                   	leave  
 3100765:	c3                   	ret    

03100766 <kSleep>:
kSleep():
/home/yogi/src/os/kshell/kshell.c:295

void kSleep(char *cmdline)
{
 3100766:	55                   	push   ebp
 3100767:	89 e5                	mov    ebp,esp
 3100769:	81 ec 08 02 00 00    	sub    esp,0x208
/home/yogi/src/os/kshell/kshell.c:297
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 310076f:	83 ec 04             	sub    esp,0x4
 3100772:	68 f4 01 00 00       	push   0x1f4
 3100777:	8d 85 00 fe ff ff    	lea    eax,[ebp-0x200]
 310077d:	50                   	push   eax
 310077e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100781:	e8 25 f9 ff ff       	call   31000ab <parseParamsShell>
 3100786:	83 c4 10             	add    esp,0x10
 3100789:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:299

    if (params[0][0]==0)
 310078c:	0f b6 85 00 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x200]
 3100793:	84 c0                	test   al,al
 3100795:	75 12                	jne    31007a9 <kSleep+0x43>
/home/yogi/src/os/kshell/kshell.c:301
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 3100797:	83 ec 0c             	sub    esp,0xc
 310079a:	68 fc 0b 10 03       	push   0x3100bfc
 310079f:	e8 cc 02 00 00       	call   3100a70 <kShell+0x24b>
 31007a4:	83 c4 10             	add    esp,0x10
 31007a7:	eb 22                	jmp    31007cb <kSleep+0x65>
/home/yogi/src/os/kshell/kshell.c:305
        return;
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 31007a9:	83 ec 04             	sub    esp,0x4
 31007ac:	6a 0a                	push   0xa
 31007ae:	6a 00                	push   0x0
 31007b0:	8d 85 00 fe ff ff    	lea    eax,[ebp-0x200]
 31007b6:	50                   	push   eax
 31007b7:	e8 04 03 00 00       	call   3100ac0 <kShell+0x29b>
 31007bc:	83 c4 10             	add    esp,0x10
 31007bf:	83 ec 0c             	sub    esp,0xc
 31007c2:	50                   	push   eax
 31007c3:	e8 e8 02 00 00       	call   3100ab0 <kShell+0x28b>
 31007c8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:306
}
 31007cb:	c9                   	leave  
 31007cc:	c3                   	ret    

031007cd <kExit>:
kExit():
/home/yogi/src/os/kshell/kshell.c:309

void kExit(char *cmdline)
{
 31007cd:	55                   	push   ebp
 31007ce:	89 e5                	mov    ebp,esp
 31007d0:	81 ec 08 02 00 00    	sub    esp,0x208
/home/yogi/src/os/kshell/kshell.c:312
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 31007d6:	83 ec 04             	sub    esp,0x4
 31007d9:	68 f4 01 00 00       	push   0x1f4
 31007de:	8d 85 04 fe ff ff    	lea    eax,[ebp-0x1fc]
 31007e4:	50                   	push   eax
 31007e5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31007e8:	e8 be f8 ff ff       	call   31000ab <parseParamsShell>
 31007ed:	83 c4 10             	add    esp,0x10
 31007f0:	85 c0                	test   eax,eax
 31007f2:	74 1d                	je     3100811 <kExit+0x44>
/home/yogi/src/os/kshell/kshell.c:314
    {
        exitCode = strtoul(params[0],0,10);
 31007f4:	83 ec 04             	sub    esp,0x4
 31007f7:	6a 0a                	push   0xa
 31007f9:	6a 00                	push   0x0
 31007fb:	8d 85 04 fe ff ff    	lea    eax,[ebp-0x1fc]
 3100801:	50                   	push   eax
 3100802:	e8 b9 02 00 00       	call   3100ac0 <kShell+0x29b>
 3100807:	83 c4 10             	add    esp,0x10
 310080a:	a3 24 12 10 03       	mov    ds:0x3101224,eax
 310080f:	eb 0a                	jmp    310081b <kExit+0x4e>
/home/yogi/src/os/kshell/kshell.c:317
    }
    else
        exitCode = 0;
 3100811:	c7 05 24 12 10 03 00 	mov    DWORD PTR ds:0x3101224,0x0
 3100818:	00 00 00 
/home/yogi/src/os/kshell/kshell.c:318
    timeToExit=true;
 310081b:	c6 05 20 12 10 03 01 	mov    BYTE PTR ds:0x3101220,0x1
/home/yogi/src/os/kshell/kshell.c:319
}
 3100822:	90                   	nop
 3100823:	c9                   	leave  
 3100824:	c3                   	ret    

03100825 <kShell>:
kShell():
/home/yogi/src/os/kshell/kshell.c:322

int kShell(int argc, char** argv)
{
 3100825:	55                   	push   ebp
 3100826:	89 e5                	mov    ebp,esp
 3100828:	81 ec f8 0a 00 00    	sub    esp,0xaf8
/home/yogi/src/os/kshell/kshell.c:324
    char lCommand[256];
    uint8_t lCurrKey=0;
 310082e:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:325
    int lCurrKeyCount=0;
 3100835:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/kshell/kshell.c:327
    char commands[50][50];
    int commandsPtr=0;
 310083c:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:328
    int commandBuffPtr=0;
 3100843:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/kshell/kshell.c:329
    int commandWasFromThisBufferPtr=0;
 310084a:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:332
    char ansiSeq[20];

    libc_init();
 3100851:	e8 7a 02 00 00       	call   3100ad0 <kShell+0x2ab>
/home/yogi/src/os/kshell/kshell.c:333
    ansiSeq[0]=0x1b;
 3100856:	c6 85 0b f5 ff ff 1b 	mov    BYTE PTR [ebp-0xaf5],0x1b
/home/yogi/src/os/kshell/kshell.c:334
    sKShellProgramName=malloc(1024);
 310085d:	83 ec 0c             	sub    esp,0xc
 3100860:	68 00 04 00 00       	push   0x400
 3100865:	e8 36 02 00 00       	call   3100aa0 <kShell+0x27b>
 310086a:	83 c4 10             	add    esp,0x10
 310086d:	a3 54 14 10 03       	mov    ds:0x3101454,eax
/home/yogi/src/os/kshell/kshell.c:335
    strcpy(sKShellProgramName,"kShell");
 3100872:	a1 54 14 10 03       	mov    eax,ds:0x3101454
 3100877:	83 ec 08             	sub    esp,0x8
 310087a:	68 3a 0c 10 03       	push   0x3100c3a
 310087f:	50                   	push   eax
 3100880:	e8 cb 01 00 00       	call   3100a50 <kShell+0x22b>
 3100885:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:336
    strcpy(sExecutingProgram,sKShellProgramName);
 3100888:	a1 54 14 10 03       	mov    eax,ds:0x3101454
 310088d:	83 ec 08             	sub    esp,0x8
 3100890:	50                   	push   eax
 3100891:	68 40 12 10 03       	push   0x3101240
 3100896:	e8 b5 01 00 00       	call   3100a50 <kShell+0x22b>
 310089b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:339
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 310089e:	e9 78 01 00 00       	jmp    3100a1b <kShell+0x1f6>
/home/yogi/src/os/kshell/kshell.c:342
    {
getACommand:
        lCurrKey=0;
 31008a3:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:343
        lCurrKeyCount=0;
 31008aa:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/kshell/kshell.c:344
        memset(lCommand,0,256);
 31008b1:	83 ec 04             	sub    esp,0x4
 31008b4:	68 00 01 00 00       	push   0x100
 31008b9:	6a 00                	push   0x0
 31008bb:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 31008c1:	50                   	push   eax
 31008c2:	e8 39 02 00 00       	call   3100b00 <kShell+0x2db>
 31008c7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:345
        print("%s> ",sExecutingProgram);
 31008ca:	83 ec 08             	sub    esp,0x8
 31008cd:	68 40 12 10 03       	push   0x3101240
 31008d2:	68 41 0c 10 03       	push   0x3100c41
 31008d7:	e8 94 01 00 00       	call   3100a70 <kShell+0x24b>
 31008dc:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:347
getAKey:
        lCurrKey=0;
 31008df:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:348
        while(lCurrKey==0)
 31008e6:	eb 16                	jmp    31008fe <kShell+0xd9>
/home/yogi/src/os/kshell/kshell.c:350
        {
            gets(&lCurrKey,1,1);
 31008e8:	83 ec 04             	sub    esp,0x4
 31008eb:	6a 01                	push   0x1
 31008ed:	6a 01                	push   0x1
 31008ef:	8d 85 e3 fe ff ff    	lea    eax,[ebp-0x11d]
 31008f5:	50                   	push   eax
 31008f6:	e8 85 01 00 00       	call   3100a80 <kShell+0x25b>
 31008fb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:348
        lCurrKeyCount=0;
        memset(lCommand,0,256);
        print("%s> ",sExecutingProgram);
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 31008fe:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100905:	84 c0                	test   al,al
 3100907:	74 df                	je     31008e8 <kShell+0xc3>
/home/yogi/src/os/kshell/kshell.c:353
        {
            gets(&lCurrKey,1,1);
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 3100909:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100910:	3c c8                	cmp    al,0xc8
 3100912:	75 06                	jne    310091a <kShell+0xf5>
/home/yogi/src/os/kshell/kshell.c:355
        {
            if (commandBuffPtr>=0)
 3100914:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100918:	eb c5                	jmp    31008df <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:370
                goto getAKey;*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
 310091a:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100921:	3c d0                	cmp    al,0xd0
 3100923:	75 08                	jne    310092d <kShell+0x108>
/home/yogi/src/os/kshell/kshell.c:372
        {
            if (commandBuffPtr<=commandsPtr)
 3100925:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100928:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 310092b:	eb b2                	jmp    31008df <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:388
            }
            else
                goto getAKey;
            
        }   
        else if (lCurrKey==0xcb) //left
 310092d:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100934:	3c cb                	cmp    al,0xcb
 3100936:	75 1c                	jne    3100954 <kShell+0x12f>
/home/yogi/src/os/kshell/kshell.c:390
        {
            if (lCurrKeyCount>0)
 3100938:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 310093c:	7e a1                	jle    31008df <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:392
            {
                print("\033[1D");
 310093e:	83 ec 0c             	sub    esp,0xc
 3100941:	68 46 0c 10 03       	push   0x3100c46
 3100946:	e8 25 01 00 00       	call   3100a70 <kShell+0x24b>
 310094b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:393
                lCurrKeyCount--;
 310094e:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:396
            }
             
            goto getAKey;
 3100952:	eb 8b                	jmp    31008df <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:398
        }
        else if (lCurrKey==0xcd)
 3100954:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 310095b:	3c cd                	cmp    al,0xcd
 310095d:	74 80                	je     31008df <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:401
        {
        }
        else if (lCurrKey=='\b')
 310095f:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100966:	3c 08                	cmp    al,0x8
 3100968:	75 1b                	jne    3100985 <kShell+0x160>
/home/yogi/src/os/kshell/kshell.c:403
        {
            lCurrKeyCount--;
 310096a:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:404
            lCommand[lCurrKeyCount]='\0';
 310096e:	8d 95 e4 fe ff ff    	lea    edx,[ebp-0x11c]
 3100974:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100977:	01 d0                	add    eax,edx
 3100979:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:405
            if (lCurrKeyCount>0)
 310097c:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100980:	e9 5a ff ff ff       	jmp    31008df <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:417
                cursorMoveTo(cursorGetPosX()-1,lTemp);*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
 3100985:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 310098c:	3c 0a                	cmp    al,0xa
 310098e:	74 1c                	je     31009ac <kShell+0x187>
/home/yogi/src/os/kshell/kshell.c:423
        {
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3100990:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100993:	8d 50 01             	lea    edx,[eax+0x1]
 3100996:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100999:	0f b6 95 e3 fe ff ff 	movzx  edx,BYTE PTR [ebp-0x11d]
 31009a0:	88 94 05 e4 fe ff ff 	mov    BYTE PTR [ebp+eax*1-0x11c],dl
/home/yogi/src/os/kshell/kshell.c:425
        }
        goto getAKey;
 31009a7:	e9 33 ff ff ff       	jmp    31008df <kShell+0xba>
/home/yogi/src/os/kshell/kshell.c:419
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
        {
            goto doneGettingKeys;
 31009ac:	90                   	nop
/home/yogi/src/os/kshell/kshell.c:428
            lCommand[lCurrKeyCount++]=lCurrKey;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 31009ad:	0f b6 85 e4 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11c]
 31009b4:	84 c0                	test   al,al
 31009b6:	75 05                	jne    31009bd <kShell+0x198>
/home/yogi/src/os/kshell/kshell.c:429
            goto getACommand;
 31009b8:	e9 e6 fe ff ff       	jmp    31008a3 <kShell+0x7e>
/home/yogi/src/os/kshell/kshell.c:430
        int i = findCommand(lCommand);
 31009bd:	83 ec 0c             	sub    esp,0xc
 31009c0:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 31009c6:	50                   	push   eax
 31009c7:	e8 7e f8 ff ff       	call   310024a <findCommand>
 31009cc:	83 c4 10             	add    esp,0x10
 31009cf:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/kshell/kshell.c:432

        execInternalCommand(lCommand);
 31009d2:	83 ec 0c             	sub    esp,0xc
 31009d5:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 31009db:	50                   	push   eax
 31009dc:	e8 1f f6 ff ff       	call   3100000 <execInternalCommand>
 31009e1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:433
        if(i>0)
 31009e4:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 31009e8:	7e 31                	jle    3100a1b <kShell+0x1f6>
/home/yogi/src/os/kshell/kshell.c:435
        {
            i--;
 31009ea:	83 6d e4 01          	sub    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/kshell/kshell.c:444
//                for (int cnt=commandWasFromThisBufferPtr;cnt<=commandsPtr;cnt++)
//                    strcpy(commands[cnt],commands[cnt+1]);
//                commandWasFromThisBufferPtr=0;
//                commandsPtr--;
            }
            strcpy(commands[commandsPtr++],lCommand);
 31009ee:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31009f1:	8d 50 01             	lea    edx,[eax+0x1]
 31009f4:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 31009f7:	8d 95 1f f5 ff ff    	lea    edx,[ebp-0xae1]
 31009fd:	6b c0 32             	imul   eax,eax,0x32
 3100a00:	01 c2                	add    edx,eax
 3100a02:	83 ec 08             	sub    esp,0x8
 3100a05:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 3100a0b:	50                   	push   eax
 3100a0c:	52                   	push   edx
 3100a0d:	e8 3e 00 00 00       	call   3100a50 <kShell+0x22b>
 3100a12:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:445
            commandBuffPtr=commandsPtr;
 3100a15:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100a18:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/kshell/kshell.c:339
    sKShellProgramName=malloc(1024);
    strcpy(sKShellProgramName,"kShell");
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 3100a1b:	0f b6 05 20 12 10 03 	movzx  eax,BYTE PTR ds:0x3101220
 3100a22:	83 f0 01             	xor    eax,0x1
 3100a25:	84 c0                	test   al,al
 3100a27:	0f 85 76 fe ff ff    	jne    31008a3 <kShell+0x7e>
/home/yogi/src/os/kshell/kshell.c:448
            }
            strcpy(commands[commandsPtr++],lCommand);
            commandBuffPtr=commandsPtr;
        }
    }
    return exitCode;
 3100a2d:	a1 24 12 10 03       	mov    eax,ds:0x3101224
/home/yogi/src/os/kshell/kshell.c:449
}
 3100a32:	c9                   	leave  
 3100a33:	c3                   	ret    

Disassembly of section .plt:

03100a40 <.plt>:
 3100a40:	ff 35 d4 11 10 03    	push   DWORD PTR ds:0x31011d4
 3100a46:	ff 25 d8 11 10 03    	jmp    DWORD PTR ds:0x31011d8
 3100a4c:	00 00                	add    BYTE PTR [eax],al
 3100a4e:	00 00                	add    BYTE PTR [eax],al
 3100a50:	ff 25 dc 11 10 03    	jmp    DWORD PTR ds:0x31011dc
 3100a56:	68 00 00 00 00       	push   0x0
 3100a5b:	e9 e0 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100a60:	ff 25 e0 11 10 03    	jmp    DWORD PTR ds:0x31011e0
 3100a66:	68 08 00 00 00       	push   0x8
 3100a6b:	e9 d0 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100a70:	ff 25 e4 11 10 03    	jmp    DWORD PTR ds:0x31011e4
 3100a76:	68 10 00 00 00       	push   0x10
 3100a7b:	e9 c0 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100a80:	ff 25 e8 11 10 03    	jmp    DWORD PTR ds:0x31011e8
 3100a86:	68 18 00 00 00       	push   0x18
 3100a8b:	e9 b0 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100a90:	ff 25 ec 11 10 03    	jmp    DWORD PTR ds:0x31011ec
 3100a96:	68 20 00 00 00       	push   0x20
 3100a9b:	e9 a0 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100aa0:	ff 25 f0 11 10 03    	jmp    DWORD PTR ds:0x31011f0
 3100aa6:	68 28 00 00 00       	push   0x28
 3100aab:	e9 90 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100ab0:	ff 25 f4 11 10 03    	jmp    DWORD PTR ds:0x31011f4
 3100ab6:	68 30 00 00 00       	push   0x30
 3100abb:	e9 80 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100ac0:	ff 25 f8 11 10 03    	jmp    DWORD PTR ds:0x31011f8
 3100ac6:	68 38 00 00 00       	push   0x38
 3100acb:	e9 70 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100ad0:	ff 25 fc 11 10 03    	jmp    DWORD PTR ds:0x31011fc
 3100ad6:	68 40 00 00 00       	push   0x40
 3100adb:	e9 60 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100ae0:	ff 25 00 12 10 03    	jmp    DWORD PTR ds:0x3101200
 3100ae6:	68 48 00 00 00       	push   0x48
 3100aeb:	e9 50 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100af0:	ff 25 04 12 10 03    	jmp    DWORD PTR ds:0x3101204
 3100af6:	68 50 00 00 00       	push   0x50
 3100afb:	e9 40 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100b00:	ff 25 08 12 10 03    	jmp    DWORD PTR ds:0x3101208
 3100b06:	68 58 00 00 00       	push   0x58
 3100b0b:	e9 30 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100b10:	ff 25 0c 12 10 03    	jmp    DWORD PTR ds:0x310120c
 3100b16:	68 60 00 00 00       	push   0x60
 3100b1b:	e9 20 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100b20:	ff 25 10 12 10 03    	jmp    DWORD PTR ds:0x3101210
 3100b26:	68 68 00 00 00       	push   0x68
 3100b2b:	e9 10 ff ff ff       	jmp    3100a40 <kShell+0x21b>
 3100b30:	ff 25 14 12 10 03    	jmp    DWORD PTR ds:0x3101214
 3100b36:	68 70 00 00 00       	push   0x70
 3100b3b:	e9 00 ff ff ff       	jmp    3100a40 <kShell+0x21b>

Disassembly of section .rodata:

03100b40 <.rodata>:
 3100b40:	68 65 6c 70 00       	push   0x706c65
 3100b45:	47                   	inc    edi
 3100b46:	65                   	gs
 3100b47:	74 20                	je     3100b69 <kShell+0x344>
 3100b49:	68 65 6c 70 20       	push   0x20706c65
 3100b4e:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3100b52:	73 20                	jae    3100b74 <kShell+0x34f>
 3100b54:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3100b5b:	74 69                	je     3100bc6 <kShell+0x3a1>
 3100b5d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100b5e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100b5f:	29 00                	sub    DWORD PTR [eax],eax
 3100b61:	65                   	gs
 3100b62:	78 65                	js     3100bc9 <kShell+0x3a4>
 3100b64:	63 00                	arpl   WORD PTR [eax],ax
 3100b66:	45                   	inc    ebp
 3100b67:	78 65                	js     3100bce <kShell+0x3a9>
 3100b69:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3100b6c:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3100b70:	70 72                	jo     3100be4 <kShell+0x3bf>
 3100b72:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100b73:	67 72 61             	addr16 jb 3100bd7 <kShell+0x3b2>
 3100b76:	6d                   	ins    DWORD PTR es:[edi],dx
 3100b77:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3100b7a:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 3100b81:	20 
 3100b82:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3100b86:	6c                   	ins    BYTE PTR es:[edi],dx
 3100b87:	6c                   	ins    BYTE PTR es:[edi],dx
 3100b88:	00 73 6c             	add    BYTE PTR [ebx+0x6c],dh
 3100b8b:	65                   	gs
 3100b8c:	65                   	gs
 3100b8d:	70 00                	jo     3100b8f <kShell+0x36a>
 3100b8f:	53                   	push   ebx
 3100b90:	6c                   	ins    BYTE PTR es:[edi],dx
 3100b91:	65                   	gs
 3100b92:	65                   	gs
 3100b93:	70 20                	jo     3100bb5 <kShell+0x390>
 3100b95:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3100b97:	72 20                	jb     3100bb9 <kShell+0x394>
 3100b99:	78 20                	js     3100bbb <kShell+0x396>
 3100b9b:	73 65                	jae    3100c02 <kShell+0x3dd>
 3100b9d:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100ba0:	64                   	fs
 3100ba1:	73 00                	jae    3100ba3 <kShell+0x37e>
 3100ba3:	00 49 6e             	add    BYTE PTR [ecx+0x6e],cl
 3100ba6:	76 61                	jbe    3100c09 <kShell+0x3e4>
 3100ba8:	6c                   	ins    BYTE PTR es:[edi],dx
 3100ba9:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 3100bb0:	61 
 3100bb1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100bb2:	64 20 27             	and    BYTE PTR fs:[edi],ah
 3100bb5:	25 73 27 20 79       	and    eax,0x79202773
 3100bba:	61                   	popa   
 3100bbb:	20 64 75 6d          	and    BYTE PTR [ebp+esi*2+0x6d],ah
 3100bbf:	6d                   	ins    DWORD PTR es:[edi],dx
 3100bc0:	79 21                	jns    3100be3 <kShell+0x3be>
 3100bc2:	0a 00                	or     al,BYTE PTR [eax]
 3100bc4:	48                   	dec    eax
 3100bc5:	65                   	gs
 3100bc6:	6c                   	ins    BYTE PTR es:[edi],dx
 3100bc7:	70 3a                	jo     3100c03 <kShell+0x3de>
 3100bc9:	0a 00                	or     al,BYTE PTR [eax]
 3100bcb:	09 25 73 3a 20 25    	or     DWORD PTR ds:0x25203a73,esp
 3100bd1:	73 0a                	jae    3100bdd <kShell+0x3b8>
 3100bd3:	00 2f                	add    BYTE PTR [edi],ch
 3100bd5:	62 00                	bound  eax,QWORD PTR [eax]
 3100bd7:	45                   	inc    ebp
 3100bd8:	78 65                	js     3100c3f <kShell+0x41a>
 3100bda:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3100bdd:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3100be4:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 3100be7:	72 6f                	jb     3100c58 <kShell+0x433>
 3100be9:	72 20                	jb     3100c0b <kShell+0x3e6>
 3100beb:	65                   	gs
 3100bec:	78 65                	js     3100c53 <kShell+0x42e>
 3100bee:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3100bf1:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3100bf8:	00 00                	add    BYTE PTR [eax],al
 3100bfa:	00 00                	add    BYTE PTR [eax],al
 3100bfc:	52                   	push   edx
 3100bfd:	65                   	gs
 3100bfe:	71 75                	jno    3100c75 <kShell+0x450>
 3100c00:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 3100c07:	70 61                	jo     3100c6a <kShell+0x445>
 3100c09:	72 61                	jb     3100c6c <kShell+0x447>
 3100c0b:	6d                   	ins    DWORD PTR es:[edi],dx
 3100c0c:	65                   	gs
 3100c0d:	74 65                	je     3100c74 <kShell+0x44f>
 3100c0f:	72 20                	jb     3100c31 <kShell+0x40c>
 3100c11:	77 68                	ja     3100c7b <kShell+0x456>
 3100c13:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 3100c1a:	74 68                	je     3100c84 <kShell+0x45f>
 3100c1c:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 3100c20:	6d                   	ins    DWORD PTR es:[edi],dx
 3100c21:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 3100c24:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 3100c27:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 3100c2a:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100c2d:	64                   	fs
 3100c2e:	73 20                	jae    3100c50 <kShell+0x42b>
 3100c30:	74 6f                	je     3100ca1 <kShell+0x47c>
 3100c32:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3100c35:	65                   	gs
 3100c36:	65                   	gs
 3100c37:	70 0a                	jo     3100c43 <kShell+0x41e>
 3100c39:	00 6b 53             	add    BYTE PTR [ebx+0x53],ch
 3100c3c:	68 65 6c 6c 00       	push   0x6c6c65
 3100c41:	25 73 3e 20 00       	and    eax,0x203e73
 3100c46:	1b 5b 31             	sbb    ebx,DWORD PTR [ebx+0x31]
 3100c49:	44                   	inc    esp
	...

Disassembly of section .eh_frame:

03100c4c <.eh_frame>:
 3100c4c:	14 00                	adc    al,0x0
 3100c4e:	00 00                	add    BYTE PTR [eax],al
 3100c50:	00 00                	add    BYTE PTR [eax],al
 3100c52:	00 00                	add    BYTE PTR [eax],al
 3100c54:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3100c57:	00 01                	add    BYTE PTR [ecx],al
 3100c59:	7c 08                	jl     3100c63 <kShell+0x43e>
 3100c5b:	01 1b                	add    DWORD PTR [ebx],ebx
 3100c5d:	0c 04                	or     al,0x4
 3100c5f:	04 88                	add    al,0x88
 3100c61:	01 00                	add    DWORD PTR [eax],eax
 3100c63:	00 20                	add    BYTE PTR [eax],ah
 3100c65:	00 00                	add    BYTE PTR [eax],al
 3100c67:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100c6a:	00 00                	add    BYTE PTR [eax],al
 3100c6c:	94                   	xchg   esp,eax
 3100c6d:	f3 ff                	repz (bad) 
 3100c6f:	ff ab 00 00 00 00    	jmp    FWORD PTR [ebx+0x0]
 3100c75:	41                   	inc    ecx
 3100c76:	0e                   	push   cs
 3100c77:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100c7d:	44                   	inc    esp
 3100c7e:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100c81:	a3 c5 c3 0c 04       	mov    ds:0x40cc3c5,eax
 3100c86:	04 00                	add    al,0x0
 3100c88:	20 00                	and    BYTE PTR [eax],al
 3100c8a:	00 00                	add    BYTE PTR [eax],al
 3100c8c:	40                   	inc    eax
 3100c8d:	00 00                	add    BYTE PTR [eax],al
 3100c8f:	00 1b                	add    BYTE PTR [ebx],bl
 3100c91:	f4                   	hlt    
 3100c92:	ff                   	(bad)  
 3100c93:	ff 9f 01 00 00 00    	call   FWORD PTR [edi+0x1]
 3100c99:	41                   	inc    ecx
 3100c9a:	0e                   	push   cs
 3100c9b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100ca1:	44                   	inc    esp
 3100ca2:	83 03 03             	add    DWORD PTR [ebx],0x3
 3100ca5:	97                   	xchg   edi,eax
 3100ca6:	01 c5                	add    ebp,eax
 3100ca8:	c3                   	ret    
 3100ca9:	0c 04                	or     al,0x4
 3100cab:	04 1c                	add    al,0x1c
 3100cad:	00 00                	add    BYTE PTR [eax],al
 3100caf:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
 3100cb3:	00 96 f5 ff ff 69    	add    BYTE PTR [esi+0x69fffff5],dl
 3100cb9:	00 00                	add    BYTE PTR [eax],al
 3100cbb:	00 00                	add    BYTE PTR [eax],al
 3100cbd:	41                   	inc    ecx
 3100cbe:	0e                   	push   cs
 3100cbf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100cc5:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3100cc8:	0c 04                	or     al,0x4
 3100cca:	04 00                	add    al,0x0
 3100ccc:	1c 00                	sbb    al,0x0
 3100cce:	00 00                	add    BYTE PTR [eax],al
 3100cd0:	84 00                	test   BYTE PTR [eax],al
 3100cd2:	00 00                	add    BYTE PTR [eax],al
 3100cd4:	df f5                	fcomip st,st(5)
 3100cd6:	ff                   	(bad)  
 3100cd7:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 3100cdd:	41                   	inc    ecx
 3100cde:	0e                   	push   cs
 3100cdf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100ce5:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 3100ceb:	04 1c                	add    al,0x1c
 3100ced:	00 00                	add    BYTE PTR [eax],al
 3100cef:	00 a4 00 00 00 4d f8 	add    BYTE PTR [eax+eax*1-0x7b30000],ah
 3100cf6:	ff                   	(bad)  
 3100cf7:	ff 58 00             	call   FWORD PTR [eax+0x0]
 3100cfa:	00 00                	add    BYTE PTR [eax],al
 3100cfc:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100cff:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100d05:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3100d09:	04 04                	add    al,0x4
 3100d0b:	00 20                	add    BYTE PTR [eax],ah
 3100d0d:	00 00                	add    BYTE PTR [eax],al
 3100d0f:	00 c4                	add    ah,al
 3100d11:	00 00                	add    BYTE PTR [eax],al
 3100d13:	00 85 f8 ff ff 83    	add    BYTE PTR [ebp-0x7c000008],al
 3100d19:	00 00                	add    BYTE PTR [eax],al
 3100d1b:	00 00                	add    BYTE PTR [eax],al
 3100d1d:	41                   	inc    ecx
 3100d1e:	0e                   	push   cs
 3100d1f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100d25:	44                   	inc    esp
 3100d26:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100d29:	7b c5                	jnp    3100cf0 <kShell+0x4cb>
 3100d2b:	c3                   	ret    
 3100d2c:	0c 04                	or     al,0x4
 3100d2e:	04 00                	add    al,0x0
 3100d30:	1c 00                	sbb    al,0x0
 3100d32:	00 00                	add    BYTE PTR [eax],al
 3100d34:	e8 00 00 00 e4       	call   e7100d39 <libcTZ+0xe3fff8e1>
 3100d39:	f8                   	clc    
 3100d3a:	ff                   	(bad)  
 3100d3b:	ff                   	(bad)  
 3100d3c:	3d 00 00 00 00       	cmp    eax,0x0
 3100d41:	41                   	inc    ecx
 3100d42:	0e                   	push   cs
 3100d43:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100d49:	79 c5                	jns    3100d10 <kShell+0x4eb>
 3100d4b:	0c 04                	or     al,0x4
 3100d4d:	04 00                	add    al,0x0
 3100d4f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100d52:	00 00                	add    BYTE PTR [eax],al
 3100d54:	08 01                	or     BYTE PTR [ecx],al
 3100d56:	00 00                	add    BYTE PTR [eax],al
 3100d58:	01 f9                	add    ecx,edi
 3100d5a:	ff                   	(bad)  
 3100d5b:	ff 0d 01 00 00 00    	dec    DWORD PTR ds:0x1
 3100d61:	41                   	inc    ecx
 3100d62:	0e                   	push   cs
 3100d63:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100d69:	03 09                	add    ecx,DWORD PTR [ecx]
 3100d6b:	01 c5                	add    ebp,eax
 3100d6d:	0c 04                	or     al,0x4
 3100d6f:	04 1c                	add    al,0x1c
 3100d71:	00 00                	add    BYTE PTR [eax],al
 3100d73:	00 28                	add    BYTE PTR [eax],ch
 3100d75:	01 00                	add    DWORD PTR [eax],eax
 3100d77:	00 ee                	add    dh,ch
 3100d79:	f9                   	stc    
 3100d7a:	ff                   	(bad)  
 3100d7b:	ff 67 00             	jmp    DWORD PTR [edi+0x0]
 3100d7e:	00 00                	add    BYTE PTR [eax],al
 3100d80:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100d83:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100d89:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
 3100d8c:	0c 04                	or     al,0x4
 3100d8e:	04 00                	add    al,0x0
 3100d90:	1c 00                	sbb    al,0x0
 3100d92:	00 00                	add    BYTE PTR [eax],al
 3100d94:	48                   	dec    eax
 3100d95:	01 00                	add    DWORD PTR [eax],eax
 3100d97:	00 35 fa ff ff 58    	add    BYTE PTR ds:0x58fffffa,dh
 3100d9d:	00 00                	add    BYTE PTR [eax],al
 3100d9f:	00 00                	add    BYTE PTR [eax],al
 3100da1:	41                   	inc    ecx
 3100da2:	0e                   	push   cs
 3100da3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100da9:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3100dad:	04 04                	add    al,0x4
 3100daf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100db2:	00 00                	add    BYTE PTR [eax],al
 3100db4:	68 01 00 00 6d       	push   0x6d000001
 3100db9:	fa                   	cli    
 3100dba:	ff                   	(bad)  
 3100dbb:	ff 0f                	dec    DWORD PTR [edi]
 3100dbd:	02 00                	add    al,BYTE PTR [eax]
 3100dbf:	00 00                	add    BYTE PTR [eax],al
 3100dc1:	41                   	inc    ecx
 3100dc2:	0e                   	push   cs
 3100dc3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100dc9:	03 0b                	add    ecx,DWORD PTR [ebx]
 3100dcb:	02 c5                	add    al,ch
 3100dcd:	0c 04                	or     al,0x4
 3100dcf:	04                   	.byte 0x4

Disassembly of section .interp:

03100dd0 <.interp>:
 3100dd0:	2f                   	das    
 3100dd1:	6c                   	ins    BYTE PTR es:[edi],dx
 3100dd2:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3100dd9:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3100de0:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03100de4 <.dynsym>:
	...
 3100df4:	09 00                	or     DWORD PTR [eax],eax
	...
 3100dfe:	00 00                	add    BYTE PTR [eax],al
 3100e00:	12 00                	adc    al,BYTE PTR [eax]
 3100e02:	00 00                	add    BYTE PTR [eax],al
 3100e04:	10 00                	adc    BYTE PTR [eax],al
	...
 3100e0e:	00 00                	add    BYTE PTR [eax],al
 3100e10:	12 00                	adc    al,BYTE PTR [eax]
 3100e12:	00 00                	add    BYTE PTR [eax],al
 3100e14:	18 00                	sbb    BYTE PTR [eax],al
	...
 3100e1e:	00 00                	add    BYTE PTR [eax],al
 3100e20:	12 00                	adc    al,BYTE PTR [eax]
 3100e22:	00 00                	add    BYTE PTR [eax],al
 3100e24:	1e                   	push   ds
	...
 3100e2d:	00 00                	add    BYTE PTR [eax],al
 3100e2f:	00 12                	add    BYTE PTR [edx],dl
 3100e31:	00 00                	add    BYTE PTR [eax],al
 3100e33:	00 23                	add    BYTE PTR [ebx],ah
	...
 3100e3d:	00 00                	add    BYTE PTR [eax],al
 3100e3f:	00 12                	add    BYTE PTR [edx],dl
 3100e41:	00 00                	add    BYTE PTR [eax],al
 3100e43:	00 2a                	add    BYTE PTR [edx],ch
	...
 3100e4d:	00 00                	add    BYTE PTR [eax],al
 3100e4f:	00 12                	add    BYTE PTR [edx],dl
 3100e51:	00 00                	add    BYTE PTR [eax],al
 3100e53:	00 31                	add    BYTE PTR [ecx],dh
	...
 3100e5d:	00 00                	add    BYTE PTR [eax],al
 3100e5f:	00 12                	add    BYTE PTR [edx],dl
 3100e61:	00 00                	add    BYTE PTR [eax],al
 3100e63:	00 37                	add    BYTE PTR [edi],dh
	...
 3100e6d:	00 00                	add    BYTE PTR [eax],al
 3100e6f:	00 12                	add    BYTE PTR [edx],dl
 3100e71:	00 00                	add    BYTE PTR [eax],al
 3100e73:	00 3f                	add    BYTE PTR [edi],bh
	...
 3100e7d:	00 00                	add    BYTE PTR [eax],al
 3100e7f:	00 12                	add    BYTE PTR [edx],dl
 3100e81:	00 00                	add    BYTE PTR [eax],al
 3100e83:	00 49 00             	add    BYTE PTR [ecx+0x0],cl
	...
 3100e8e:	00 00                	add    BYTE PTR [eax],al
 3100e90:	12 00                	adc    al,BYTE PTR [eax]
 3100e92:	00 00                	add    BYTE PTR [eax],al
 3100e94:	4e                   	dec    esi
	...
 3100e9d:	00 00                	add    BYTE PTR [eax],al
 3100e9f:	00 12                	add    BYTE PTR [edx],dl
 3100ea1:	00 00                	add    BYTE PTR [eax],al
 3100ea3:	00 56 00             	add    BYTE PTR [esi+0x0],dl
	...
 3100eae:	00 00                	add    BYTE PTR [eax],al
 3100eb0:	12 00                	adc    al,BYTE PTR [eax]
 3100eb2:	00 00                	add    BYTE PTR [eax],al
 3100eb4:	5d                   	pop    ebp
	...
 3100ebd:	00 00                	add    BYTE PTR [eax],al
 3100ebf:	00 12                	add    BYTE PTR [edx],dl
 3100ec1:	00 00                	add    BYTE PTR [eax],al
 3100ec3:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
	...
 3100ecf:	00 12                	add    BYTE PTR [edx],dl
 3100ed1:	00 00                	add    BYTE PTR [eax],al
 3100ed3:	00 6b 00             	add    BYTE PTR [ebx+0x0],ch
	...
 3100ede:	00 00                	add    BYTE PTR [eax],al
 3100ee0:	12 00                	adc    al,BYTE PTR [eax]
	...

Disassembly of section .dynstr:

03100ee4 <.dynstr>:
 3100ee4:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3100ee8:	63 2e                	arpl   WORD PTR [esi],bp
 3100eea:	73 6f                	jae    3100f5b <kShell+0x736>
 3100eec:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3100eef:	72 63                	jb     3100f54 <kShell+0x72f>
 3100ef1:	70 79                	jo     3100f6c <kShell+0x747>
 3100ef3:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 3100ef6:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3100efd:	72 
 3100efe:	69 6e 74 00 67 65 74 	imul   ebp,DWORD PTR [esi+0x74],0x74656700
 3100f05:	73 00                	jae    3100f07 <kShell+0x6e2>
 3100f07:	6d                   	ins    DWORD PTR es:[edi],dx
 3100f08:	65                   	gs
 3100f09:	6d                   	ins    DWORD PTR es:[edi],dx
 3100f0a:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 3100f0d:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 3100f10:	6c                   	ins    BYTE PTR es:[edi],dx
 3100f11:	6c                   	ins    BYTE PTR es:[edi],dx
 3100f12:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100f13:	63 00                	arpl   WORD PTR [eax],ax
 3100f15:	73 6c                	jae    3100f83 <kShell+0x75e>
 3100f17:	65                   	gs
 3100f18:	65                   	gs
 3100f19:	70 00                	jo     3100f1b <kShell+0x6f6>
 3100f1b:	73 74                	jae    3100f91 <kShell+0x76c>
 3100f1d:	72 74                	jb     3100f93 <kShell+0x76e>
 3100f1f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100f20:	75 6c                	jne    3100f8e <kShell+0x769>
 3100f22:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3100f26:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
 3100f29:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100f2a:	69 74 00 65 78 65 63 	imul   esi,DWORD PTR [eax+eax*1+0x65],0x636578
 3100f31:	00 
 3100f32:	73 74                	jae    3100fa8 <kShell+0x783>
 3100f34:	72 6e                	jb     3100fa4 <kShell+0x77f>
 3100f36:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 3100f39:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 3100f3c:	6d                   	ins    DWORD PTR es:[edi],dx
 3100f3d:	73 65                	jae    3100fa4 <kShell+0x77f>
 3100f3f:	74 00                	je     3100f41 <kShell+0x71c>
 3100f41:	73 74                	jae    3100fb7 <kShell+0x792>
 3100f43:	72 63                	jb     3100fa8 <kShell+0x783>
 3100f45:	6d                   	ins    DWORD PTR es:[edi],dx
 3100f46:	70 00                	jo     3100f48 <kShell+0x723>
 3100f48:	73 74                	jae    3100fbe <kShell+0x799>
 3100f4a:	72 6c                	jb     3100fb8 <kShell+0x793>
 3100f4c:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3100f4e:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 3100f51:	65 65 00 2f          	gs add BYTE PTR gs:[edi],ch
 3100f55:	68 6f 6d 65 2f       	push   0x2f656d6f
 3100f5a:	79 6f                	jns    3100fcb <kShell+0x7a6>
 3100f5c:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 3100f63:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100f64:	73 2f                	jae    3100f95 <kShell+0x770>
 3100f66:	6c                   	ins    BYTE PTR es:[edi],dx
 3100f67:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3100f6e:	4f                   	dec    edi
 3100f6f:	53                   	push   ebx
 3100f70:	2f                   	das    
 3100f71:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3100f78:	62 
 3100f79:	75 67                	jne    3100fe2 <kShell+0x7bd>
 3100f7b:	2f                   	das    
 3100f7c:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 3100f7f:	73 73                	jae    3100ff4 <kShell+0x7cf>
 3100f81:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3100f86:	78 00                	js     3100f88 <kShell+0x763>

Disassembly of section .hash:

03100f88 <.hash>:
 3100f88:	03 00                	add    eax,DWORD PTR [eax]
 3100f8a:	00 00                	add    BYTE PTR [eax],al
 3100f8c:	10 00                	adc    BYTE PTR [eax],al
 3100f8e:	00 00                	add    BYTE PTR [eax],al
 3100f90:	0c 00                	or     al,0x0
 3100f92:	00 00                	add    BYTE PTR [eax],al
 3100f94:	0f 00 00             	sldt   WORD PTR [eax]
 3100f97:	00 0d 00 00 00 00    	add    BYTE PTR ds:0x0,cl
 3100f9d:	00 00                	add    BYTE PTR [eax],al
 3100f9f:	00 00                	add    BYTE PTR [eax],al
 3100fa1:	00 00                	add    BYTE PTR [eax],al
 3100fa3:	00 01                	add    BYTE PTR [ecx],al
 3100fa5:	00 00                	add    BYTE PTR [eax],al
 3100fa7:	00 02                	add    BYTE PTR [edx],al
 3100fa9:	00 00                	add    BYTE PTR [eax],al
 3100fab:	00 00                	add    BYTE PTR [eax],al
 3100fad:	00 00                	add    BYTE PTR [eax],al
 3100faf:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3100fb2:	00 00                	add    BYTE PTR [eax],al
 3100fb4:	03 00                	add    eax,DWORD PTR [eax]
 3100fb6:	00 00                	add    BYTE PTR [eax],al
 3100fb8:	05 00 00 00 06       	add    eax,0x6000000
 3100fbd:	00 00                	add    BYTE PTR [eax],al
 3100fbf:	00 07                	add    BYTE PTR [edi],al
 3100fc1:	00 00                	add    BYTE PTR [eax],al
 3100fc3:	00 00                	add    BYTE PTR [eax],al
 3100fc5:	00 00                	add    BYTE PTR [eax],al
 3100fc7:	00 08                	add    BYTE PTR [eax],cl
 3100fc9:	00 00                	add    BYTE PTR [eax],al
 3100fcb:	00 09                	add    BYTE PTR [ecx],cl
 3100fcd:	00 00                	add    BYTE PTR [eax],al
 3100fcf:	00 0b                	add    BYTE PTR [ebx],cl
 3100fd1:	00 00                	add    BYTE PTR [eax],al
 3100fd3:	00 0a                	add    BYTE PTR [edx],cl
 3100fd5:	00 00                	add    BYTE PTR [eax],al
 3100fd7:	00 0e                	add    BYTE PTR [esi],cl
 3100fd9:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03100fdc <.eh_frame>:
 3100fdc:	14 00                	adc    al,0x0
 3100fde:	00 00                	add    BYTE PTR [eax],al
 3100fe0:	00 00                	add    BYTE PTR [eax],al
 3100fe2:	00 00                	add    BYTE PTR [eax],al
 3100fe4:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3100fe7:	00 01                	add    BYTE PTR [ecx],al
 3100fe9:	7c 08                	jl     3100ff3 <kShell+0x7ce>
 3100feb:	01 1b                	add    DWORD PTR [ebx],ebx
 3100fed:	0c 04                	or     al,0x4
 3100fef:	04 88                	add    al,0x88
 3100ff1:	01 00                	add    DWORD PTR [eax],eax
 3100ff3:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3100ff6:	00 00                	add    BYTE PTR [eax],al
 3100ff8:	1c 00                	sbb    al,0x0
 3100ffa:	00 00                	add    BYTE PTR [eax],al
 3100ffc:	44                   	inc    esp
 3100ffd:	fa                   	cli    
 3100ffe:	ff                   	(bad)  
 3100fff:	ff 00                	inc    DWORD PTR [eax]
 3101001:	01 00                	add    DWORD PTR [eax],eax
 3101003:	00 00                	add    BYTE PTR [eax],al
 3101005:	0e                   	push   cs
 3101006:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3101009:	0c 4a                	or     al,0x4a
 310100b:	0f 0b                	ud2    
 310100d:	74 04                	je     3101013 <kShell+0x7ee>
 310100f:	78 00                	js     3101011 <kShell+0x7ec>
 3101011:	3f                   	aas    
 3101012:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3101014:	2a 32                	sub    dh,BYTE PTR [edx]
 3101016:	24 22                	and    al,0x22
 3101018:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

0310101c <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 310101c:	01 1b                	add    DWORD PTR [ebx],ebx
 310101e:	03 3b                	add    edi,DWORD PTR [ebx]
 3101020:	2c fc                	sub    al,0xfc
 3101022:	ff                   	(bad)  
 3101023:	ff 0b                	dec    DWORD PTR [ebx]
 3101025:	00 00                	add    BYTE PTR [eax],al
 3101027:	00 e4                	add    ah,ah
 3101029:	ef                   	out    dx,eax
 310102a:	ff                   	(bad)  
 310102b:	ff 48 fc             	dec    DWORD PTR [eax-0x4]
 310102e:	ff                   	(bad)  
 310102f:	ff 8f f0 ff ff 6c    	dec    DWORD PTR [edi+0x6cfffff0]
 3101035:	fc                   	cld    
 3101036:	ff                   	(bad)  
 3101037:	ff 2e                	jmp    FWORD PTR [esi]
 3101039:	f2 ff                	repnz (bad) 
 310103b:	ff 90 fc ff ff 97    	call   DWORD PTR [eax-0x68000004]
 3101041:	f2 ff                	repnz (bad) 
 3101043:	ff b0 fc ff ff 25    	push   DWORD PTR [eax+0x25fffffc]
 3101049:	f5                   	cmc    
 310104a:	ff                   	(bad)  
 310104b:	ff d0                	call   eax
 310104d:	fc                   	cld    
 310104e:	ff                   	(bad)  
 310104f:	ff                   	(bad)  
 3101050:	7d f5                	jge    3101047 <__GNU_EH_FRAME_HDR+0x2b>
 3101052:	ff                   	(bad)  
 3101053:	ff f0                	push   eax
 3101055:	fc                   	cld    
 3101056:	ff                   	(bad)  
 3101057:	ff 00                	inc    DWORD PTR [eax]
 3101059:	f6 ff                	idiv   bh
 310105b:	ff 14 fd ff ff 3d f6 	call   DWORD PTR [edi*8-0x9c20001]
 3101062:	ff                   	(bad)  
 3101063:	ff 34 fd ff ff 4a f7 	push   DWORD PTR [edi*8-0x8b50001]
 310106a:	ff                   	(bad)  
 310106b:	ff 54 fd ff          	call   DWORD PTR [ebp+edi*8-0x1]
 310106f:	ff b1 f7 ff ff 74    	push   DWORD PTR [ecx+0x74fffff7]
 3101075:	fd                   	std    
 3101076:	ff                   	(bad)  
 3101077:	ff 09                	dec    DWORD PTR [ecx]
 3101079:	f8                   	clc    
 310107a:	ff                   	(bad)  
 310107b:	ff                   	.byte 0xff
 310107c:	94                   	xchg   esp,eax
 310107d:	fd                   	std    
 310107e:	ff                   	(bad)  
 310107f:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03101080 <.rel.dyn>:
 3101080:	dc 11                	fcom   QWORD PTR [ecx]
 3101082:	10 03                	adc    BYTE PTR [ebx],al
 3101084:	07                   	pop    es
 3101085:	01 00                	add    DWORD PTR [eax],eax
 3101087:	00 e0                	add    al,ah
 3101089:	11 10                	adc    DWORD PTR [eax],edx
 310108b:	03 07                	add    eax,DWORD PTR [edi]
 310108d:	02 00                	add    al,BYTE PTR [eax]
 310108f:	00 e4                	add    ah,ah
 3101091:	11 10                	adc    DWORD PTR [eax],edx
 3101093:	03 07                	add    eax,DWORD PTR [edi]
 3101095:	03 00                	add    eax,DWORD PTR [eax]
 3101097:	00 e8                	add    al,ch
 3101099:	11 10                	adc    DWORD PTR [eax],edx
 310109b:	03 07                	add    eax,DWORD PTR [edi]
 310109d:	04 00                	add    al,0x0
 310109f:	00 ec                	add    ah,ch
 31010a1:	11 10                	adc    DWORD PTR [eax],edx
 31010a3:	03 07                	add    eax,DWORD PTR [edi]
 31010a5:	05 00 00 f0 11       	add    eax,0x11f00000
 31010aa:	10 03                	adc    BYTE PTR [ebx],al
 31010ac:	07                   	pop    es
 31010ad:	06                   	push   es
 31010ae:	00 00                	add    BYTE PTR [eax],al
 31010b0:	f4                   	hlt    
 31010b1:	11 10                	adc    DWORD PTR [eax],edx
 31010b3:	03 07                	add    eax,DWORD PTR [edi]
 31010b5:	07                   	pop    es
 31010b6:	00 00                	add    BYTE PTR [eax],al
 31010b8:	f8                   	clc    
 31010b9:	11 10                	adc    DWORD PTR [eax],edx
 31010bb:	03 07                	add    eax,DWORD PTR [edi]
 31010bd:	08 00                	or     BYTE PTR [eax],al
 31010bf:	00 fc                	add    ah,bh
 31010c1:	11 10                	adc    DWORD PTR [eax],edx
 31010c3:	03 07                	add    eax,DWORD PTR [edi]
 31010c5:	09 00                	or     DWORD PTR [eax],eax
 31010c7:	00 00                	add    BYTE PTR [eax],al
 31010c9:	12 10                	adc    dl,BYTE PTR [eax]
 31010cb:	03 07                	add    eax,DWORD PTR [edi]
 31010cd:	0a 00                	or     al,BYTE PTR [eax]
 31010cf:	00 04 12             	add    BYTE PTR [edx+edx*1],al
 31010d2:	10 03                	adc    BYTE PTR [ebx],al
 31010d4:	07                   	pop    es
 31010d5:	0b 00                	or     eax,DWORD PTR [eax]
 31010d7:	00 08                	add    BYTE PTR [eax],cl
 31010d9:	12 10                	adc    dl,BYTE PTR [eax]
 31010db:	03 07                	add    eax,DWORD PTR [edi]
 31010dd:	0c 00                	or     al,0x0
 31010df:	00 0c 12             	add    BYTE PTR [edx+edx*1],cl
 31010e2:	10 03                	adc    BYTE PTR [ebx],al
 31010e4:	07                   	pop    es
 31010e5:	0d 00 00 10 12       	or     eax,0x12100000
 31010ea:	10 03                	adc    BYTE PTR [ebx],al
 31010ec:	07                   	pop    es
 31010ed:	0e                   	push   cs
 31010ee:	00 00                	add    BYTE PTR [eax],al
 31010f0:	14 12                	adc    al,0x12
 31010f2:	10 03                	adc    BYTE PTR [ebx],al
 31010f4:	07                   	pop    es
 31010f5:	0f 00 00             	sldt   WORD PTR [eax]

Disassembly of section .data:

03101100 <cmds>:
 3101100:	40                   	inc    eax
 3101101:	0b 10                	or     edx,DWORD PTR [eax]
 3101103:	03 45 0b             	add    eax,DWORD PTR [ebp+0xb]
 3101106:	10 03                	adc    BYTE PTR [ebx],al
 3101108:	41                   	inc    ecx
 3101109:	05 10 03 00 00       	add    eax,0x310
 310110e:	00 00                	add    BYTE PTR [eax],al
 3101110:	61                   	popa   
 3101111:	0b 10                	or     edx,DWORD PTR [eax]
 3101113:	03 66 0b             	add    esp,DWORD PTR [esi+0xb]
 3101116:	10 03                	adc    BYTE PTR [ebx],al
 3101118:	59                   	pop    ecx
 3101119:	06                   	push   es
 310111a:	10 03                	adc    BYTE PTR [ebx],al
 310111c:	01 00                	add    DWORD PTR [eax],eax
 310111e:	00 00                	add    BYTE PTR [eax],al
 3101120:	78 0b                	js     310112d <cmds+0x2d>
 3101122:	10 03                	adc    BYTE PTR [ebx],al
 3101124:	7d 0b                	jge    3101131 <cmds+0x31>
 3101126:	10 03                	adc    BYTE PTR [ebx],al
 3101128:	cd 07                	int    0x7
 310112a:	10 03                	adc    BYTE PTR [ebx],al
 310112c:	01 00                	add    DWORD PTR [eax],eax
 310112e:	00 00                	add    BYTE PTR [eax],al
 3101130:	89 0b                	mov    DWORD PTR [ebx],ecx
 3101132:	10 03                	adc    BYTE PTR [ebx],al
 3101134:	8f                   	(bad)  
 3101135:	0b 10                	or     edx,DWORD PTR [eax]
 3101137:	03 66 07             	add    esp,DWORD PTR [esi+0x7]
 310113a:	10 03                	adc    BYTE PTR [ebx],al
 310113c:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .dynamic:

03101140 <_DYNAMIC>:
 3101140:	01 00                	add    DWORD PTR [eax],eax
 3101142:	00 00                	add    BYTE PTR [eax],al
 3101144:	01 00                	add    DWORD PTR [eax],eax
 3101146:	00 00                	add    BYTE PTR [eax],al
 3101148:	0f 00 00             	sldt   WORD PTR [eax]
 310114b:	00 70 00             	add    BYTE PTR [eax+0x0],dh
 310114e:	00 00                	add    BYTE PTR [eax],al
 3101150:	04 00                	add    al,0x0
 3101152:	00 00                	add    BYTE PTR [eax],al
 3101154:	88 0f                	mov    BYTE PTR [edi],cl
 3101156:	10 03                	adc    BYTE PTR [ebx],al
 3101158:	05 00 00 00 e4       	add    eax,0xe4000000
 310115d:	0e                   	push   cs
 310115e:	10 03                	adc    BYTE PTR [ebx],al
 3101160:	06                   	push   es
 3101161:	00 00                	add    BYTE PTR [eax],al
 3101163:	00 e4                	add    ah,ah
 3101165:	0d 10 03 0a 00       	or     eax,0xa0310
 310116a:	00 00                	add    BYTE PTR [eax],al
 310116c:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 310116d:	00 00                	add    BYTE PTR [eax],al
 310116f:	00 0b                	add    BYTE PTR [ebx],cl
 3101171:	00 00                	add    BYTE PTR [eax],al
 3101173:	00 10                	add    BYTE PTR [eax],dl
 3101175:	00 00                	add    BYTE PTR [eax],al
 3101177:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 310117d:	00 00                	add    BYTE PTR [eax],al
 310117f:	00 03                	add    BYTE PTR [ebx],al
 3101181:	00 00                	add    BYTE PTR [eax],al
 3101183:	00 d0                	add    al,dl
 3101185:	11 10                	adc    DWORD PTR [eax],edx
 3101187:	03 02                	add    eax,DWORD PTR [edx]
 3101189:	00 00                	add    BYTE PTR [eax],al
 310118b:	00 78 00             	add    BYTE PTR [eax+0x0],bh
 310118e:	00 00                	add    BYTE PTR [eax],al
 3101190:	14 00                	adc    al,0x0
 3101192:	00 00                	add    BYTE PTR [eax],al
 3101194:	11 00                	adc    DWORD PTR [eax],eax
 3101196:	00 00                	add    BYTE PTR [eax],al
 3101198:	17                   	pop    ss
 3101199:	00 00                	add    BYTE PTR [eax],al
 310119b:	00 80 10 10 03 00    	add    BYTE PTR [eax+0x31010],al
	...

Disassembly of section .got.plt:

031011d0 <_GLOBAL_OFFSET_TABLE_>:
 31011d0:	40                   	inc    eax
 31011d1:	11 10                	adc    DWORD PTR [eax],edx
 31011d3:	03 00                	add    eax,DWORD PTR [eax]
 31011d5:	00 00                	add    BYTE PTR [eax],al
 31011d7:	00 00                	add    BYTE PTR [eax],al
 31011d9:	00 00                	add    BYTE PTR [eax],al
 31011db:	00 56 0a             	add    BYTE PTR [esi+0xa],dl
 31011de:	10 03                	adc    BYTE PTR [ebx],al
 31011e0:	66                   	data16
 31011e1:	0a 10                	or     dl,BYTE PTR [eax]
 31011e3:	03 76 0a             	add    esi,DWORD PTR [esi+0xa]
 31011e6:	10 03                	adc    BYTE PTR [ebx],al
 31011e8:	86 0a                	xchg   BYTE PTR [edx],cl
 31011ea:	10 03                	adc    BYTE PTR [ebx],al
 31011ec:	96                   	xchg   esi,eax
 31011ed:	0a 10                	or     dl,BYTE PTR [eax]
 31011ef:	03 a6 0a 10 03 b6    	add    esp,DWORD PTR [esi-0x49fceff6]
 31011f5:	0a 10                	or     dl,BYTE PTR [eax]
 31011f7:	03 c6                	add    eax,esi
 31011f9:	0a 10                	or     dl,BYTE PTR [eax]
 31011fb:	03 d6                	add    edx,esi
 31011fd:	0a 10                	or     dl,BYTE PTR [eax]
 31011ff:	03 e6                	add    esp,esi
 3101201:	0a 10                	or     dl,BYTE PTR [eax]
 3101203:	03 f6                	add    esi,esi
 3101205:	0a 10                	or     dl,BYTE PTR [eax]
 3101207:	03 06                	add    eax,DWORD PTR [esi]
 3101209:	0b 10                	or     edx,DWORD PTR [eax]
 310120b:	03 16                	add    edx,DWORD PTR [esi]
 310120d:	0b 10                	or     edx,DWORD PTR [eax]
 310120f:	03 26                	add    esp,DWORD PTR [esi]
 3101211:	0b 10                	or     edx,DWORD PTR [eax]
 3101213:	03 36                	add    esi,DWORD PTR [esi]
 3101215:	0b 10                	or     edx,DWORD PTR [eax]
 3101217:	03                   	.byte 0x3

Disassembly of section .bss:

03101220 <timeToExit>:
 3101220:	00 00                	add    BYTE PTR [eax],al
	...

03101224 <exitCode>:
	...

03101240 <sExecutingProgram>:
	...

03101440 <command_function_p>:
 3101440:	00 00                	add    BYTE PTR [eax],al
	...

03101444 <heapEnd>:
 3101444:	00 00                	add    BYTE PTR [eax],al
	...

03101448 <heapBase>:
 3101448:	00 00                	add    BYTE PTR [eax],al
	...

0310144c <heapCurr>:
 310144c:	00 00                	add    BYTE PTR [eax],al
	...

03101450 <command_function>:
 3101450:	00 00                	add    BYTE PTR [eax],al
	...

03101454 <sKShellProgramName>:
 3101454:	00 00                	add    BYTE PTR [eax],al
	...

03101458 <libcTZ>:
 3101458:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	e3 06                	jecxz  8 <execInternalCommand-0x30ffff8>
   2:	00 00                	add    BYTE PTR [eax],al
   4:	04 00                	add    al,0x0
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	9f                   	lahf   
   d:	00 00                	add    BYTE PTR [eax],al
   f:	00 0c 86             	add    BYTE PTR [esi+eax*4],cl
  12:	02 00                	add    al,BYTE PTR [eax]
  14:	00 11                	add    BYTE PTR [ecx],dl
  16:	03 00                	add    eax,DWORD PTR [eax]
  18:	00 00                	add    BYTE PTR [eax],al
  1a:	00 10                	add    BYTE PTR [eax],dl
  1c:	03 34 0a             	add    esi,DWORD PTR [edx+ecx*1]
  1f:	00 00                	add    BYTE PTR [eax],al
  21:	00 00                	add    BYTE PTR [eax],al
  23:	00 00                	add    BYTE PTR [eax],al
  25:	02 01                	add    al,BYTE PTR [ecx]
  27:	08 0d 02 00 00 02    	or     BYTE PTR ds:0x2000002,cl
  2d:	02 07                	add    al,BYTE PTR [edi]
  2f:	4e                   	dec    esi
  30:	02 00                	add    al,BYTE PTR [eax]
  32:	00 02                	add    BYTE PTR [edx],al
  34:	04 07                	add    al,0x7
  36:	25 02 00 00 02       	and    eax,0x2000002
  3b:	04 07                	add    al,0x7
  3d:	20 02                	and    BYTE PTR [edx],al
  3f:	00 00                	add    BYTE PTR [eax],al
  41:	02 01                	add    al,BYTE PTR [ecx]
  43:	06                   	push   es
  44:	0f 02 00             	lar    eax,WORD PTR [eax]
  47:	00 02                	add    BYTE PTR [edx],al
  49:	02 05 3e 00 00 00    	add    al,BYTE PTR ds:0x3e
  4f:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  56:	02 08                	add    cl,BYTE PTR [eax]
  58:	05 72 01 00 00       	add    eax,0x172
  5d:	02 08                	add    cl,BYTE PTR [eax]
  5f:	07                   	pop    es
  60:	1b 02                	sbb    eax,DWORD PTR [edx]
  62:	00 00                	add    BYTE PTR [eax],al
  64:	02 04 05 77 01 00 00 	add    al,BYTE PTR [eax*1+0x177]
  6b:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
  6e:	5f                   	pop    edi
  6f:	00 00                	add    BYTE PTR [eax],al
  71:	00 04 04             	add    BYTE PTR [esp+eax*1],al
  74:	05 04 7a 00 00       	add    eax,0x7a04
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	01 06                	add    DWORD PTR [esi],eax
  7d:	16                   	push   ss
  7e:	02 00                	add    al,BYTE PTR [eax]
  80:	00 06                	add    BYTE PTR [esi],al
  82:	35 01 00 00 02       	xor    eax,0x2000001
  87:	2e                   	cs
  88:	25 00 00 00 06       	and    eax,0x6000000
  8d:	32 02                	xor    al,BYTE PTR [edx]
  8f:	00 00                	add    BYTE PTR [eax],al
  91:	02 34 33             	add    dh,BYTE PTR [ebx+esi*1]
  94:	00 00                	add    BYTE PTR [eax],al
  96:	00 02                	add    BYTE PTR [edx],al
  98:	01 02                	add    DWORD PTR [edx],eax
  9a:	80 02 00             	add    BYTE PTR [edx],0x0
  9d:	00 06                	add    BYTE PTR [esi],al
  9f:	2e 01 00             	add    DWORD PTR cs:[eax],eax
  a2:	00 03                	add    BYTE PTR [ebx],al
  a4:	2a 64 00 00          	sub    ah,BYTE PTR [eax+eax*1+0x0]
  a8:	00 05 04 af 00 00    	add    BYTE PTR ds:0xaf04,al
  ae:	00 07                	add    BYTE PTR [edi],al
  b0:	7a 00                	jp     b2 <execInternalCommand-0x30fff4e>
  b2:	00 00                	add    BYTE PTR [eax],al
  b4:	08 10                	or     BYTE PTR [eax],dl
  b6:	04 12                	add    al,0x12
  b8:	ed                   	in     eax,dx
  b9:	00 00                	add    BYTE PTR [eax],al
  bb:	00 09                	add    BYTE PTR [ecx],cl
  bd:	de 01                	fiadd  WORD PTR [ecx]
  bf:	00 00                	add    BYTE PTR [eax],al
  c1:	04 14                	add    al,0x14
  c3:	74 00                	je     c5 <execInternalCommand-0x30fff3b>
  c5:	00 00                	add    BYTE PTR [eax],al
  c7:	00 09                	add    BYTE PTR [ecx],cl
  c9:	2d 00 00 00 04       	sub    eax,0x4000000
  ce:	15 74 00 00 00       	adc    eax,0x74
  d3:	04 09                	add    al,0x9
  d5:	4e                   	dec    esi
  d6:	01 00                	add    DWORD PTR [eax],eax
  d8:	00 04 16             	add    BYTE PTR [esi+edx*1],al
  db:	72 00                	jb     dd <execInternalCommand-0x30fff23>
  dd:	00 00                	add    BYTE PTR [eax],al
  df:	08 09                	or     BYTE PTR [ecx],cl
  e1:	60                   	pusha  
  e2:	01 00                	add    DWORD PTR [eax],eax
  e4:	00 04 17             	add    BYTE PTR [edi+edx*1],al
  e7:	4f                   	dec    edi
  e8:	00 00                	add    BYTE PTR [eax],al
  ea:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
  ed:	06                   	push   es
  ee:	76 00                	jbe    f0 <execInternalCommand-0x30fff10>
  f0:	00 00                	add    BYTE PTR [eax],al
  f2:	04 18                	add    al,0x18
  f4:	b4 00                	mov    ah,0x0
  f6:	00 00                	add    BYTE PTR [eax],al
  f8:	0a f5                	or     dh,ch
  fa:	00 00                	add    BYTE PTR [eax],al
  fc:	00 01                	add    BYTE PTR [ecx],al
  fe:	1b 00                	sbb    eax,DWORD PTR [eax]
 100:	00 10                	add    BYTE PTR [eax],dl
 102:	03 ab 00 00 00 01    	add    ebp,DWORD PTR [ebx+0x1000000]
 108:	9c                   	pushf  
 109:	28 01                	sub    BYTE PTR [ecx],al
 10b:	00 00                	add    BYTE PTR [eax],al
 10d:	0b 00                	or     eax,DWORD PTR [eax]
 10f:	01 00                	add    DWORD PTR [eax],eax
 111:	00 01                	add    BYTE PTR [ecx],al
 113:	1b 74 00 00          	sbb    esi,DWORD PTR [eax+eax*1+0x0]
 117:	00 02                	add    BYTE PTR [edx],al
 119:	91                   	xchg   ecx,eax
 11a:	00 0c 69             	add    BYTE PTR [ecx+ebp*2],cl
 11d:	00 01                	add    BYTE PTR [ecx],al
 11f:	1d 4f 00 00 00       	sbb    eax,0x4f
 124:	02 91 6c 00 0d 48    	add    dl,BYTE PTR [ecx+0x480d006c]
 12a:	00 00                	add    BYTE PTR [eax],al
 12c:	00 01                	add    BYTE PTR [ecx],al
 12e:	32 4f 00             	xor    cl,BYTE PTR [edi+0x0]
 131:	00 00                	add    BYTE PTR [eax],al
 133:	ab                   	stos   DWORD PTR es:[edi],eax
 134:	00 10                	add    BYTE PTR [eax],dl
 136:	03 9f 01 00 00 01    	add    ebx,DWORD PTR [edi+0x1000001]
 13c:	9c                   	pushf  
 13d:	c6 01 00             	mov    BYTE PTR [ecx],0x0
 140:	00 0b                	add    BYTE PTR [ebx],cl
 142:	b6 02                	mov    dh,0x2
 144:	00 00                	add    BYTE PTR [eax],al
 146:	01 32                	add    DWORD PTR [edx],esi
 148:	74 00                	je     14a <execInternalCommand-0x30ffeb6>
 14a:	00 00                	add    BYTE PTR [eax],al
 14c:	02 91 00 0b d7 01    	add    dl,BYTE PTR [ecx+0x1d70b00]
 152:	00 00                	add    BYTE PTR [eax],al
 154:	01 32                	add    DWORD PTR [edx],esi
 156:	d6                   	(bad)  
 157:	01 00                	add    DWORD PTR [eax],eax
 159:	00 02                	add    BYTE PTR [edx],al
 15b:	91                   	xchg   ecx,eax
 15c:	04 0b                	add    al,0xb
 15e:	a2 02 00 00 01       	mov    ds:0x1000002,al
 163:	32 4f 00             	xor    cl,BYTE PTR [edi+0x0]
 166:	00 00                	add    BYTE PTR [eax],al
 168:	02 91 08 0c 78 00    	add    dl,BYTE PTR [ecx+0x780c08]
 16e:	01 34 4f             	add    DWORD PTR [edi+ecx*2],esi
 171:	00 00                	add    BYTE PTR [eax],al
 173:	00 02                	add    BYTE PTR [edx],al
 175:	91                   	xchg   ecx,eax
 176:	6c                   	ins    BYTE PTR es:[edi],dx
 177:	0c 79                	or     al,0x79
 179:	00 01                	add    BYTE PTR [ecx],al
 17b:	34 4f                	xor    al,0x4f
 17d:	00 00                	add    BYTE PTR [eax],al
 17f:	00 02                	add    BYTE PTR [edx],al
 181:	91                   	xchg   ecx,eax
 182:	68 0e 17 00 00       	push   0x170e
 187:	00 01                	add    BYTE PTR [ecx],al
 189:	35 4f 00 00 00       	xor    eax,0x4f
 18e:	02 91 64 0e 86 00    	add    dl,BYTE PTR [ecx+0x860e64]
 194:	00 00                	add    BYTE PTR [eax],al
 196:	01 35 4f 00 00 00    	add    DWORD PTR ds:0x4f,esi
 19c:	02 91 60 0e e3 01    	add    dl,BYTE PTR [ecx+0x1e30e60]
 1a2:	00 00                	add    BYTE PTR [eax],al
 1a4:	01 36                	add    DWORD PTR [esi],esi
 1a6:	97                   	xchg   edi,eax
 1a7:	00 00                	add    BYTE PTR [eax],al
 1a9:	00 02                	add    BYTE PTR [edx],al
 1ab:	91                   	xchg   ecx,eax
 1ac:	5f                   	pop    edi
 1ad:	0f e6                	(bad)  
 1af:	00 10                	add    BYTE PTR [eax],dl
 1b1:	03 3f                	add    edi,DWORD PTR [edi]
 1b3:	01 00                	add    DWORD PTR [eax],eax
 1b5:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 1b8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1b9:	74 00                	je     1bb <execInternalCommand-0x30ffe45>
 1bb:	01 3a                	add    DWORD PTR [edx],edi
 1bd:	33 00                	xor    eax,DWORD PTR [eax]
 1bf:	00 00                	add    BYTE PTR [eax],al
 1c1:	02 91 58 00 00 10    	add    dl,BYTE PTR [ecx+0x10000058]
 1c7:	7a 00                	jp     1c9 <execInternalCommand-0x30ffe37>
 1c9:	00 00                	add    BYTE PTR [eax],al
 1cb:	d6                   	(bad)  
 1cc:	01 00                	add    DWORD PTR [eax],eax
 1ce:	00 11                	add    BYTE PTR [ecx],dl
 1d0:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 1d3:	00 31                	add    BYTE PTR [ecx],dh
 1d5:	00 05 04 c6 01 00    	add    BYTE PTR ds:0x1c604,al
 1db:	00 0d c3 02 00 00    	add    BYTE PTR ds:0x2c3,cl
 1e1:	01 64 4f 00          	add    DWORD PTR [edi+ecx*2+0x0],esp
 1e5:	00 00                	add    BYTE PTR [eax],al
 1e7:	4a                   	dec    edx
 1e8:	02 10                	add    dl,BYTE PTR [eax]
 1ea:	03 69 00             	add    ebp,DWORD PTR [ecx+0x0]
 1ed:	00 00                	add    BYTE PTR [eax],al
 1ef:	01 9c 1e 02 00 00 0b 	add    DWORD PTR [esi+ebx*1+0xb000002],ebx
 1f6:	2a 03                	sub    al,BYTE PTR [ebx]
 1f8:	00 00                	add    BYTE PTR [eax],al
 1fa:	01 64 74 00          	add    DWORD PTR [esp+esi*2+0x0],esp
 1fe:	00 00                	add    BYTE PTR [eax],al
 200:	02 91 00 0c 69 00    	add    dl,BYTE PTR [ecx+0x690c00]
 206:	01 66 33             	add    DWORD PTR [esi+0x33],esp
 209:	00 00                	add    BYTE PTR [eax],al
 20b:	00 02                	add    BYTE PTR [edx],al
 20d:	91                   	xchg   ecx,eax
 20e:	6c                   	ins    BYTE PTR es:[edi],dx
 20f:	0c 72                	or     al,0x72
 211:	65                   	gs
 212:	74 00                	je     214 <execInternalCommand-0x30ffdec>
 214:	01 67 4f             	add    DWORD PTR [edi+0x4f],esp
 217:	00 00                	add    BYTE PTR [eax],al
 219:	00 02                	add    BYTE PTR [edx],al
 21b:	91                   	xchg   ecx,eax
 21c:	68 00 0d 3b 02       	push   0x23b0d00
 221:	00 00                	add    BYTE PTR [eax],al
 223:	01 78 dc             	add    DWORD PTR [eax-0x24],edi
 226:	02 00                	add    al,BYTE PTR [eax]
 228:	00 b3 02 10 03 8e    	add    BYTE PTR [ebx-0x71fceffe],dh
 22e:	02 00                	add    al,BYTE PTR [eax]
 230:	00 01                	add    BYTE PTR [ecx],al
 232:	9c                   	pushf  
 233:	dc 02                	fadd   QWORD PTR [edx]
 235:	00 00                	add    BYTE PTR [eax],al
 237:	0b 59 00             	or     ebx,DWORD PTR [ecx+0x0]
 23a:	00 00                	add    BYTE PTR [eax],al
 23c:	01 78 a9             	add    DWORD PTR [eax-0x57],edi
 23f:	00 00                	add    BYTE PTR [eax],al
 241:	00 02                	add    BYTE PTR [edx],al
 243:	91                   	xchg   ecx,eax
 244:	00 0c 61             	add    BYTE PTR [ecx+eiz*2],cl
 247:	72 67                	jb     2b0 <execInternalCommand-0x30ffd50>
 249:	00 01                	add    BYTE PTR [ecx],al
 24b:	7a 74                	jp     2c1 <execInternalCommand-0x30ffd3f>
 24d:	00 00                	add    BYTE PTR [eax],al
 24f:	00 02                	add    BYTE PTR [edx],al
 251:	91                   	xchg   ecx,eax
 252:	6c                   	ins    BYTE PTR es:[edi],dx
 253:	0e                   	push   cs
 254:	cf                   	iret   
 255:	02 00                	add    al,BYTE PTR [eax]
 257:	00 01                	add    BYTE PTR [ecx],al
 259:	7b 74                	jnp    2cf <execInternalCommand-0x30ffd31>
 25b:	00 00                	add    BYTE PTR [eax],al
 25d:	00 02                	add    BYTE PTR [edx],al
 25f:	91                   	xchg   ecx,eax
 260:	68 0e a1 01 00       	push   0x1a10e
 265:	00 01                	add    BYTE PTR [ecx],al
 267:	7c 4f                	jl     2b8 <execInternalCommand-0x30ffd48>
 269:	00 00                	add    BYTE PTR [eax],al
 26b:	00 02                	add    BYTE PTR [edx],al
 26d:	91                   	xchg   ecx,eax
 26e:	64                   	fs
 26f:	0e                   	push   cs
 270:	27                   	daa    
 271:	01 00                	add    DWORD PTR [eax],eax
 273:	00 01                	add    BYTE PTR [ecx],al
 275:	7d 4f                	jge    2c6 <execInternalCommand-0x30ffd3a>
 277:	00 00                	add    BYTE PTR [eax],al
 279:	00 02                	add    BYTE PTR [edx],al
 27b:	91                   	xchg   ecx,eax
 27c:	60                   	pusha  
 27d:	0e                   	push   cs
 27e:	a0 01 00 00 01       	mov    al,ds:0x1000001
 283:	7e 4f                	jle    2d4 <execInternalCommand-0x30ffd2c>
 285:	00 00                	add    BYTE PTR [eax],al
 287:	00 02                	add    BYTE PTR [edx],al
 289:	91                   	xchg   ecx,eax
 28a:	5c                   	pop    esp
 28b:	0e                   	push   cs
 28c:	c0 01 00             	rol    BYTE PTR [ecx],0x0
 28f:	00 01                	add    BYTE PTR [ecx],al
 291:	7f 4f                	jg     2e2 <execInternalCommand-0x30ffd1e>
 293:	00 00                	add    BYTE PTR [eax],al
 295:	00 02                	add    BYTE PTR [edx],al
 297:	91                   	xchg   ecx,eax
 298:	58                   	pop    eax
 299:	0e                   	push   cs
 29a:	bd 01 00 00 01       	mov    ebp,0x1000001
 29f:	80 4f 00 00          	or     BYTE PTR [edi+0x0],0x0
 2a3:	00 02                	add    BYTE PTR [edx],al
 2a5:	91                   	xchg   ecx,eax
 2a6:	54                   	push   esp
 2a7:	0e                   	push   cs
 2a8:	40                   	inc    eax
 2a9:	02 00                	add    al,BYTE PTR [eax]
 2ab:	00 01                	add    BYTE PTR [ecx],al
 2ad:	81 dc 02 00 00 02    	sbb    esp,0x2000002
 2b3:	91                   	xchg   ecx,eax
 2b4:	50                   	push   eax
 2b5:	0e                   	push   cs
 2b6:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
 2b7:	02 00                	add    al,BYTE PTR [eax]
 2b9:	00 01                	add    BYTE PTR [ecx],al
 2bb:	82                   	(bad)  
 2bc:	dc 02                	fadd   QWORD PTR [edx]
 2be:	00 00                	add    BYTE PTR [eax],al
 2c0:	02 91 4c 0f 74 04    	add    dl,BYTE PTR [ecx+0x4740f4c]
 2c6:	10 03                	adc    BYTE PTR [ebx],al
 2c8:	9e                   	sahf   
 2c9:	00 00                	add    BYTE PTR [eax],al
 2cb:	00 0e                	add    BYTE PTR [esi],cl
 2cd:	39 00                	cmp    DWORD PTR [eax],eax
 2cf:	00 00                	add    BYTE PTR [eax],al
 2d1:	01 db                	add    ebx,ebx
 2d3:	74 00                	je     2d5 <execInternalCommand-0x30ffd2b>
 2d5:	00 00                	add    BYTE PTR [eax],al
 2d7:	02 91 48 00 00 05    	add    dl,BYTE PTR [ecx+0x5000048]
 2dd:	04 74                	add    al,0x74
 2df:	00 00                	add    BYTE PTR [eax],al
 2e1:	00 12                	add    BYTE PTR [edx],dl
 2e3:	10 00                	adc    BYTE PTR [eax],al
 2e5:	00 00                	add    BYTE PTR [eax],al
 2e7:	01 f1                	add    ecx,esi
 2e9:	41                   	inc    ecx
 2ea:	05 10 03 58 00       	add    eax,0x580310
 2ef:	00 00                	add    BYTE PTR [eax],al
 2f1:	01 9c 10 03 00 00 0f 	add    DWORD PTR [eax+edx*1+0xf000003],ebx
 2f8:	57                   	push   edi
 2f9:	05 10 03 3f 00       	add    eax,0x3f0310
 2fe:	00 00                	add    BYTE PTR [eax],al
 300:	0c 63                	or     al,0x63
 302:	6e                   	outs   dx,BYTE PTR ds:[esi]
 303:	74 00                	je     305 <execInternalCommand-0x30ffcfb>
 305:	01 f4                	add    esp,esi
 307:	33 00                	xor    eax,DWORD PTR [eax]
 309:	00 00                	add    BYTE PTR [eax],al
 30b:	02 91 6c 00 00 0d    	add    dl,BYTE PTR [ecx+0xd00006c]
 311:	80 01 00             	add    BYTE PTR [ecx],0x0
 314:	00 01                	add    BYTE PTR [ecx],al
 316:	f8                   	clc    
 317:	dc 02                	fadd   QWORD PTR [edx]
 319:	00 00                	add    BYTE PTR [eax],al
 31b:	99                   	cdq    
 31c:	05 10 03 83 00       	add    eax,0x830310
 321:	00 00                	add    BYTE PTR [eax],al
 323:	01 9c 6c 03 00 00 0b 	add    DWORD PTR [esp+ebp*2+0xb000003],ebx
 32a:	6b 01 00             	imul   eax,DWORD PTR [ecx],0x0
 32d:	00 01                	add    BYTE PTR [ecx],al
 32f:	f8                   	clc    
 330:	4f                   	dec    edi
 331:	00 00                	add    BYTE PTR [eax],al
 333:	00 02                	add    BYTE PTR [edx],al
 335:	91                   	xchg   ecx,eax
 336:	00 0b                	add    BYTE PTR [ebx],cl
 338:	d7                   	xlat   BYTE PTR ds:[ebx]
 339:	01 00                	add    DWORD PTR [eax],eax
 33b:	00 01                	add    BYTE PTR [ecx],al
 33d:	f8                   	clc    
 33e:	d6                   	(bad)  
 33f:	01 00                	add    DWORD PTR [eax],eax
 341:	00 02                	add    BYTE PTR [edx],al
 343:	91                   	xchg   ecx,eax
 344:	04 0e                	add    al,0xe
 346:	9a 00 00 00 01 fa dc 	call   0xdcfa:0x1000000
 34d:	02 00                	add    al,BYTE PTR [eax]
 34f:	00 02                	add    BYTE PTR [edx],al
 351:	91                   	xchg   ecx,eax
 352:	68 0f b5 05 10       	push   0x1005b50f
 357:	03 5f 00             	add    ebx,DWORD PTR [edi+0x0]
 35a:	00 00                	add    BYTE PTR [eax],al
 35c:	0c 63                	or     al,0x63
 35e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 35f:	74 00                	je     361 <execInternalCommand-0x30ffc9f>
 361:	01 fc                	add    esp,edi
 363:	4f                   	dec    edi
 364:	00 00                	add    BYTE PTR [eax],al
 366:	00 02                	add    BYTE PTR [edx],al
 368:	91                   	xchg   ecx,eax
 369:	6c                   	ins    BYTE PTR es:[edi],dx
 36a:	00 00                	add    BYTE PTR [eax],al
 36c:	13 57 01             	adc    edx,DWORD PTR [edi+0x1]
 36f:	00 00                	add    BYTE PTR [eax],al
 371:	01 04 01             	add    DWORD PTR [ecx+eax*1],eax
 374:	1c 06                	sbb    al,0x6
 376:	10 03                	adc    BYTE PTR [ebx],al
 378:	3d 00 00 00 01       	cmp    eax,0x1000000
 37d:	9c                   	pushf  
 37e:	ba 03 00 00 14       	mov    edx,0x14000003
 383:	6b 01 00             	imul   eax,DWORD PTR [ecx],0x0
 386:	00 01                	add    BYTE PTR [ecx],al
 388:	04 01                	add    al,0x1
 38a:	4f                   	dec    edi
 38b:	00 00                	add    BYTE PTR [eax],al
 38d:	00 02                	add    BYTE PTR [edx],al
 38f:	91                   	xchg   ecx,eax
 390:	00 14 d7             	add    BYTE PTR [edi+edx*8],dl
 393:	01 00                	add    DWORD PTR [eax],eax
 395:	00 01                	add    BYTE PTR [ecx],al
 397:	04 01                	add    al,0x1
 399:	dc 02                	fadd   QWORD PTR [edx]
 39b:	00 00                	add    BYTE PTR [eax],al
 39d:	02 91 04 0f 22 06    	add    dl,BYTE PTR [ecx+0x6220f04]
 3a3:	10 03                	adc    BYTE PTR [ebx],al
 3a5:	26 00 00             	add    BYTE PTR es:[eax],al
 3a8:	00 15 63 6e 74 00    	add    BYTE PTR ds:0x746e63,dl
 3ae:	01 06                	add    DWORD PTR [esi],eax
 3b0:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 3b3:	00 00                	add    BYTE PTR [eax],al
 3b5:	02 91 6c 00 00 13    	add    dl,BYTE PTR [ecx+0x1300006c]
 3bb:	97                   	xchg   edi,eax
 3bc:	02 00                	add    al,BYTE PTR [eax]
 3be:	00 01                	add    BYTE PTR [ecx],al
 3c0:	0b 01                	or     eax,DWORD PTR [ecx]
 3c2:	59                   	pop    ecx
 3c3:	06                   	push   es
 3c4:	10 03                	adc    BYTE PTR [ebx],al
 3c6:	0d 01 00 00 01       	or     eax,0x1000001
 3cb:	9c                   	pushf  
 3cc:	3b 04 00             	cmp    eax,DWORD PTR [eax+eax*1]
 3cf:	00 14 92             	add    BYTE PTR [edx+edx*4],dl
 3d2:	00 00                	add    BYTE PTR [eax],al
 3d4:	00 01                	add    BYTE PTR [ecx],al
 3d6:	0b 01                	or     eax,DWORD PTR [ecx]
 3d8:	74 00                	je     3da <execInternalCommand-0x30ffc26>
 3da:	00 00                	add    BYTE PTR [eax],al
 3dc:	02 91 00 16 de 02    	add    dl,BYTE PTR [ecx+0x2de1600]
 3e2:	00 00                	add    BYTE PTR [eax],al
 3e4:	01 0d 01 97 00 00    	add    DWORD PTR ds:0x9701,ecx
 3ea:	00 02                	add    BYTE PTR [edx],al
 3ec:	91                   	xchg   ecx,eax
 3ed:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3ee:	16                   	push   ss
 3ef:	fd                   	std    
 3f0:	01 00                	add    DWORD PTR [eax],eax
 3f2:	00 01                	add    BYTE PTR [ecx],al
 3f4:	0e                   	push   cs
 3f5:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 3f8:	00 00                	add    BYTE PTR [eax],al
 3fa:	02 91 68 16 d7 01    	add    dl,BYTE PTR [ecx+0x1d71668]
 400:	00 00                	add    BYTE PTR [eax],al
 402:	01 0f                	add    DWORD PTR [edi],ecx
 404:	01 3b                	add    DWORD PTR [ebx],edi
 406:	04 00                	add    al,0x0
 408:	00 03                	add    BYTE PTR [ebx],al
 40a:	91                   	xchg   ecx,eax
 40b:	e8 7b 16 60 01       	call   1601a8b <execInternalCommand-0x1afe575>
 410:	00 00                	add    BYTE PTR [eax],al
 412:	01 10                	add    DWORD PTR [eax],edx
 414:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 417:	00 00                	add    BYTE PTR [eax],al
 419:	02 91 64 15 70 69    	add    dl,BYTE PTR [ecx+0x69701564]
 41f:	64 00 01             	add    BYTE PTR fs:[ecx],al
 422:	11 01                	adc    DWORD PTR [ecx],eax
 424:	8c 00                	mov    WORD PTR [eax],es
 426:	00 00                	add    BYTE PTR [eax],al
 428:	02 91 60 16 9d 02    	add    dl,BYTE PTR [ecx+0x29d1660]
 42e:	00 00                	add    BYTE PTR [eax],al
 430:	01 13                	add    DWORD PTR [ebx],edx
 432:	01 dc                	add    esp,ebx
 434:	02 00                	add    al,BYTE PTR [eax]
 436:	00 02                	add    BYTE PTR [edx],al
 438:	91                   	xchg   ecx,eax
 439:	5c                   	pop    esp
 43a:	00 10                	add    BYTE PTR [eax],dl
 43c:	7a 00                	jp     43e <execInternalCommand-0x30ffbc2>
 43e:	00 00                	add    BYTE PTR [eax],al
 440:	51                   	push   ecx
 441:	04 00                	add    al,0x0
 443:	00 11                	add    BYTE PTR [ecx],dl
 445:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 448:	00 09                	add    BYTE PTR [ecx],cl
 44a:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 44d:	00 00                	add    BYTE PTR [eax],al
 44f:	31 00                	xor    DWORD PTR [eax],eax
 451:	13 d7                	adc    edx,edi
 453:	02 00                	add    al,BYTE PTR [eax]
 455:	00 01                	add    BYTE PTR [ecx],al
 457:	26 01 66 07          	add    DWORD PTR es:[esi+0x7],esp
 45b:	10 03                	adc    BYTE PTR [ebx],al
 45d:	67 00 00             	add    BYTE PTR [bx+si],al
 460:	00 01                	add    BYTE PTR [ecx],al
 462:	9c                   	pushf  
 463:	96                   	xchg   esi,eax
 464:	04 00                	add    al,0x0
 466:	00 14 92             	add    BYTE PTR [edx+edx*4],dl
 469:	00 00                	add    BYTE PTR [eax],al
 46b:	00 01                	add    BYTE PTR [ecx],al
 46d:	26 01 74 00 00       	add    DWORD PTR es:[eax+eax*1+0x0],esi
 472:	00 02                	add    BYTE PTR [edx],al
 474:	91                   	xchg   ecx,eax
 475:	00 16                	add    BYTE PTR [esi],dl
 477:	d7                   	xlat   BYTE PTR ds:[ebx]
 478:	01 00                	add    DWORD PTR [eax],eax
 47a:	00 01                	add    BYTE PTR [ecx],al
 47c:	28 01                	sub    BYTE PTR [ecx],al
 47e:	3b 04 00             	cmp    eax,DWORD PTR [eax+eax*1]
 481:	00 03                	add    BYTE PTR [ebx],al
 483:	91                   	xchg   ecx,eax
 484:	f8                   	clc    
 485:	7b 16                	jnp    49d <execInternalCommand-0x30ffb63>
 487:	60                   	pusha  
 488:	01 00                	add    DWORD PTR [eax],eax
 48a:	00 01                	add    BYTE PTR [ecx],al
 48c:	29 01                	sub    DWORD PTR [ecx],eax
 48e:	4f                   	dec    edi
 48f:	00 00                	add    BYTE PTR [eax],al
 491:	00 02                	add    BYTE PTR [edx],al
 493:	91                   	xchg   ecx,eax
 494:	6c                   	ins    BYTE PTR es:[edi],dx
 495:	00 13                	add    BYTE PTR [ebx],dl
 497:	27                   	daa    
 498:	00 00                	add    BYTE PTR [eax],al
 49a:	00 01                	add    BYTE PTR [ecx],al
 49c:	34 01                	xor    al,0x1
 49e:	cd 07                	int    0x7
 4a0:	10 03                	adc    BYTE PTR [ebx],al
 4a2:	58                   	pop    eax
 4a3:	00 00                	add    BYTE PTR [eax],al
 4a5:	00 01                	add    BYTE PTR [ecx],al
 4a7:	9c                   	pushf  
 4a8:	cc                   	int3   
 4a9:	04 00                	add    al,0x0
 4ab:	00 14 92             	add    BYTE PTR [edx+edx*4],dl
 4ae:	00 00                	add    BYTE PTR [eax],al
 4b0:	00 01                	add    BYTE PTR [ecx],al
 4b2:	34 01                	xor    al,0x1
 4b4:	74 00                	je     4b6 <execInternalCommand-0x30ffb4a>
 4b6:	00 00                	add    BYTE PTR [eax],al
 4b8:	02 91 00 16 d7 01    	add    dl,BYTE PTR [ecx+0x1d71600]
 4be:	00 00                	add    BYTE PTR [eax],al
 4c0:	01 36                	add    DWORD PTR [esi],esi
 4c2:	01 3b                	add    DWORD PTR [ebx],edi
 4c4:	04 00                	add    al,0x0
 4c6:	00 03                	add    BYTE PTR [ebx],al
 4c8:	91                   	xchg   ecx,eax
 4c9:	fc                   	cld    
 4ca:	7b 00                	jnp    4cc <execInternalCommand-0x30ffb34>
 4cc:	17                   	pop    ss
 4cd:	32 03                	xor    al,BYTE PTR [ebx]
 4cf:	00 00                	add    BYTE PTR [eax],al
 4d1:	01 41 01             	add    DWORD PTR [ecx+0x1],eax
 4d4:	4f                   	dec    edi
 4d5:	00 00                	add    BYTE PTR [eax],al
 4d7:	00 25 08 10 03 0f    	add    BYTE PTR ds:0xf031008,ah
 4dd:	02 00                	add    al,BYTE PTR [eax]
 4df:	00 01                	add    BYTE PTR [ecx],al
 4e1:	9c                   	pushf  
 4e2:	bc 05 00 00 14       	mov    esp,0x14000005
 4e7:	c0 01 00             	rol    BYTE PTR [ecx],0x0
 4ea:	00 01                	add    BYTE PTR [ecx],al
 4ec:	41                   	inc    ecx
 4ed:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 4f0:	00 00                	add    BYTE PTR [eax],al
 4f2:	02 91 00 14 40 02    	add    dl,BYTE PTR [ecx+0x2401400]
 4f8:	00 00                	add    BYTE PTR [eax],al
 4fa:	01 41 01             	add    DWORD PTR [ecx+0x1],eax
 4fd:	dc 02                	fadd   QWORD PTR [edx]
 4ff:	00 00                	add    BYTE PTR [eax],al
 501:	02 91 04 16 00 01    	add    dl,BYTE PTR [ecx+0x1001604]
 507:	00 00                	add    BYTE PTR [eax],al
 509:	01 43 01             	add    DWORD PTR [ebx+0x1],eax
 50c:	bc 05 00 00 03       	mov    esp,0x3000005
 511:	91                   	xchg   ecx,eax
 512:	dc 7d 16             	fdivr  QWORD PTR [ebp+0x16]
 515:	61                   	popa   
 516:	02 00                	add    al,BYTE PTR [eax]
 518:	00 01                	add    BYTE PTR [ecx],al
 51a:	44                   	inc    esp
 51b:	01 81 00 00 00 03    	add    DWORD PTR [ecx+0x3000000],eax
 521:	91                   	xchg   ecx,eax
 522:	db 7d 16             	fstp   TBYTE PTR [ebp+0x16]
 525:	68 00 00 00 01       	push   0x1000000
 52a:	45                   	inc    ebp
 52b:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 52e:	00 00                	add    BYTE PTR [eax],al
 530:	02 91 6c 16 3d 01    	add    dl,BYTE PTR [ecx+0x13d166c]
 536:	00 00                	add    BYTE PTR [eax],al
 538:	01 46 01             	add    DWORD PTR [esi+0x1],eax
 53b:	cc                   	int3   
 53c:	05 00 00 03 91       	add    eax,0x91030000
 541:	97                   	xchg   edi,eax
 542:	6a 16                	push   0x16
 544:	e9 02 00 00 01       	jmp    100054b <execInternalCommand-0x20ffab5>
 549:	47                   	inc    edi
 54a:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 54d:	00 00                	add    BYTE PTR [eax],al
 54f:	02 91 68 16 71 02    	add    dl,BYTE PTR [ecx+0x2711668]
 555:	00 00                	add    BYTE PTR [eax],al
 557:	01 48 01             	add    DWORD PTR [eax+0x1],ecx
 55a:	4f                   	dec    edi
 55b:	00 00                	add    BYTE PTR [eax],al
 55d:	00 02                	add    BYTE PTR [edx],al
 55f:	91                   	xchg   ecx,eax
 560:	64                   	fs
 561:	16                   	push   ss
 562:	f5                   	cmc    
 563:	02 00                	add    al,BYTE PTR [eax]
 565:	00 01                	add    BYTE PTR [ecx],al
 567:	49                   	dec    ecx
 568:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 56b:	00 00                	add    BYTE PTR [eax],al
 56d:	02 91 60 16 8f 02    	add    dl,BYTE PTR [ecx+0x28f1660]
 573:	00 00                	add    BYTE PTR [eax],al
 575:	01 4a 01             	add    DWORD PTR [edx+0x1],ecx
 578:	e2 05                	loop   57f <execInternalCommand-0x30ffa81>
 57a:	00 00                	add    BYTE PTR [eax],al
 57c:	03 91 83 6a 18 a8    	add    edx,DWORD PTR [ecx-0x57e7957d]
 582:	01 00                	add    DWORD PTR [eax],eax
 584:	00 01                	add    BYTE PTR [ecx],al
 586:	55                   	push   ebp
 587:	01 a3 08 10 03 18    	add    DWORD PTR [ebx+0x18031008],esp
 58d:	39 03                	cmp    DWORD PTR [ebx],eax
 58f:	00 00                	add    BYTE PTR [eax],al
 591:	01 5a 01             	add    DWORD PTR [edx+0x1],ebx
 594:	df 08                	fisttp WORD PTR [eax]
 596:	10 03                	adc    BYTE PTR [ebx],al
 598:	18 00                	sbb    BYTE PTR [eax],al
 59a:	00 00                	add    BYTE PTR [eax],al
 59c:	00 01                	add    BYTE PTR [ecx],al
 59e:	ab                   	stos   DWORD PTR es:[edi],eax
 59f:	01 ad 09 10 03 0f    	add    DWORD PTR [ebp+0xf031009],ebp
 5a5:	a3 08 10 03 78       	mov    ds:0x78031008,eax
 5aa:	01 00                	add    DWORD PTR [eax],eax
 5ac:	00 15 69 00 01 ae    	add    BYTE PTR ds:0xae010069,dl
 5b2:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 5b5:	00 00                	add    BYTE PTR [eax],al
 5b7:	02 91 5c 00 00 10    	add    dl,BYTE PTR [ecx+0x1000005c]
 5bd:	7a 00                	jp     5bf <execInternalCommand-0x30ffa41>
 5bf:	00 00                	add    BYTE PTR [eax],al
 5c1:	cc                   	int3   
 5c2:	05 00 00 11 6b       	add    eax,0x6b110000
 5c7:	00 00                	add    BYTE PTR [eax],al
 5c9:	00 ff                	add    bh,bh
 5cb:	00 10                	add    BYTE PTR [eax],dl
 5cd:	7a 00                	jp     5cf <execInternalCommand-0x30ffa31>
 5cf:	00 00                	add    BYTE PTR [eax],al
 5d1:	e2 05                	loop   5d8 <execInternalCommand-0x30ffa28>
 5d3:	00 00                	add    BYTE PTR [eax],al
 5d5:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 5d8:	00 00                	add    BYTE PTR [eax],al
 5da:	31 11                	xor    DWORD PTR [ecx],edx
 5dc:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 5df:	00 31                	add    BYTE PTR [ecx],dh
 5e1:	00 10                	add    BYTE PTR [eax],dl
 5e3:	7a 00                	jp     5e5 <execInternalCommand-0x30ffa1b>
 5e5:	00 00                	add    BYTE PTR [eax],al
 5e7:	f2 05 00 00 11 6b    	repnz add eax,0x6b110000
 5ed:	00 00                	add    BYTE PTR [eax],al
 5ef:	00 13                	add    BYTE PTR [ebx],dl
 5f1:	00 19                	add    BYTE PTR [ecx],bl
 5f3:	ad                   	lods   eax,DWORD PTR ds:[esi]
 5f4:	02 00                	add    al,BYTE PTR [eax]
 5f6:	00 05 32 8c 00 00    	add    BYTE PTR ds:0x8c32,al
 5fc:	00 05 03 48 14 10    	add    BYTE PTR ds:0x10144803,al
 602:	03 19                	add    ebx,DWORD PTR [ecx]
 604:	b4 01                	mov    ah,0x1
 606:	00 00                	add    BYTE PTR [eax],al
 608:	05 33 8c 00 00       	add    eax,0x8c33
 60d:	00 05 03 4c 14 10    	add    BYTE PTR ds:0x10144c03,al
 613:	03 19                	add    ebx,DWORD PTR [ecx]
 615:	1f                   	pop    ds
 616:	00 00                	add    BYTE PTR [eax],al
 618:	00 05 34 8c 00 00    	add    BYTE PTR ds:0x8c34,al
 61e:	00 05 03 44 14 10    	add    BYTE PTR ds:0x10144403,al
 624:	03 19                	add    ebx,DWORD PTR [ecx]
 626:	6a 02                	push   0x2
 628:	00 00                	add    BYTE PTR [eax],al
 62a:	06                   	push   es
 62b:	35 9e 00 00 00       	xor    eax,0x9e
 630:	05 03 58 14 10       	add    eax,0x10145803
 635:	03 10                	add    edx,DWORD PTR [eax]
 637:	7a 00                	jp     639 <execInternalCommand-0x30ff9c7>
 639:	00 00                	add    BYTE PTR [eax],al
 63b:	47                   	inc    edi
 63c:	06                   	push   es
 63d:	00 00                	add    BYTE PTR [eax],al
 63f:	1a 6b 00             	sbb    ch,BYTE PTR [ebx+0x0]
 642:	00 00                	add    BYTE PTR [eax],al
 644:	ff 01                	inc    DWORD PTR [ecx]
 646:	00 19                	add    BYTE PTR [ecx],bl
 648:	c5 01                	lds    eax,FWORD PTR [ecx]
 64a:	00 00                	add    BYTE PTR [eax],al
 64c:	04 1f                	add    al,0x1f
 64e:	36                   	ss
 64f:	06                   	push   es
 650:	00 00                	add    BYTE PTR [eax],al
 652:	05 03 40 12 10       	add    eax,0x10124003
 657:	03 19                	add    ebx,DWORD PTR [ecx]
 659:	09 01                	or     DWORD PTR [ecx],eax
 65b:	00 00                	add    BYTE PTR [eax],al
 65d:	04 20                	add    al,0x20
 65f:	74 00                	je     661 <execInternalCommand-0x30ff99f>
 661:	00 00                	add    BYTE PTR [eax],al
 663:	05 03 54 14 10       	add    eax,0x10145403
 668:	03 10                	add    edx,DWORD PTR [eax]
 66a:	ed                   	in     eax,dx
 66b:	00 00                	add    BYTE PTR [eax],al
 66d:	00 79 06             	add    BYTE PTR [ecx+0x6],bh
 670:	00 00                	add    BYTE PTR [eax],al
 672:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 675:	00 00                	add    BYTE PTR [eax],al
 677:	03 00                	add    eax,DWORD PTR [eax]
 679:	19 be 02 00 00 04    	sbb    DWORD PTR [esi+0x4000002],edi
 67f:	21 69 06             	and    DWORD PTR [ecx+0x6],ebp
 682:	00 00                	add    BYTE PTR [eax],al
 684:	05 03 00 11 10       	add    eax,0x10110003
 689:	03 1b                	add    ebx,DWORD PTR [ebx]
 68b:	19 46 01             	sbb    DWORD PTR [esi+0x1],eax
 68e:	00 00                	add    BYTE PTR [eax],al
 690:	04 27                	add    al,0x27
 692:	9c                   	pushf  
 693:	06                   	push   es
 694:	00 00                	add    BYTE PTR [eax],al
 696:	05 03 50 14 10       	add    eax,0x10145003
 69b:	03 05 04 8a 06 00    	add    eax,DWORD PTR ds:0x68a04
 6a1:	00 1c ad 06 00 00 1d 	add    BYTE PTR [ebp*4+0x1d000006],bl
 6a8:	74 00                	je     6aa <execInternalCommand-0x30ff956>
 6aa:	00 00                	add    BYTE PTR [eax],al
 6ac:	00 19                	add    BYTE PTR [ecx],bl
 6ae:	8d 01                	lea    eax,[ecx]
 6b0:	00 00                	add    BYTE PTR [eax],al
 6b2:	04 28                	add    al,0x28
 6b4:	be 06 00 00 05       	mov    esi,0x5000006
 6b9:	03 40 14             	add    eax,DWORD PTR [eax+0x14]
 6bc:	10 03                	adc    BYTE PTR [ebx],al
 6be:	05 04 a2 06 00       	add    eax,0x6a204
 6c3:	00 19                	add    BYTE PTR [ecx],bl
 6c5:	1c 01                	sbb    al,0x1
 6c7:	00 00                	add    BYTE PTR [eax],al
 6c9:	01 12                	add    DWORD PTR [edx],edx
 6cb:	97                   	xchg   edi,eax
 6cc:	00 00                	add    BYTE PTR [eax],al
 6ce:	00 05 03 20 12 10    	add    BYTE PTR ds:0x10122003,al
 6d4:	03 19                	add    ebx,DWORD PTR [ecx]
 6d6:	45                   	inc    ebp
 6d7:	02 00                	add    al,BYTE PTR [eax]
 6d9:	00 01                	add    BYTE PTR [ecx],al
 6db:	13 8c 00 00 00 05 03 	adc    ecx,DWORD PTR [eax+eax*1+0x3050000]
 6e2:	24 12                	and    al,0x12
 6e4:	10 03                	adc    BYTE PTR [ebx],al
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
  ff:	13 2e                	adc    ebp,DWORD PTR [esi]
 101:	01 3f                	add    DWORD PTR [edi],edi
 103:	19 03                	sbb    DWORD PTR [ebx],eax
 105:	0e                   	push   cs
 106:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 108:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 10e:	12 06                	adc    al,BYTE PTR [esi]
 110:	40                   	inc    eax
 111:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 117:	00 00                	add    BYTE PTR [eax],al
 119:	14 05                	adc    al,0x5
 11b:	00 03                	add    BYTE PTR [ebx],al
 11d:	0e                   	push   cs
 11e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 120:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 126:	00 00                	add    BYTE PTR [eax],al
 128:	15 34 00 03 08       	adc    eax,0x8030034
 12d:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 12f:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 135:	00 00                	add    BYTE PTR [eax],al
 137:	16                   	push   ss
 138:	34 00                	xor    al,0x0
 13a:	03 0e                	add    ecx,DWORD PTR [esi]
 13c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 13e:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
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
  14:	34 0a                	xor    al,0xa
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	82                   	(bad)  
   1:	02 00                	add    al,BYTE PTR [eax]
   3:	00 02                	add    BYTE PTR [edx],al
   5:	00 cb                	add    bl,cl
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
  6a:	6c                   	ins    BYTE PTR es:[edi],dx
  6b:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  72:	4f                   	dec    edi
  73:	53                   	push   ebx
  74:	2f                   	das    
  75:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  7c:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
  7f:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  83:	65 00 00             	add    BYTE PTR gs:[eax],al
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
  a2:	74 69                	je     10d <execInternalCommand-0x30ffef3>
  a4:	6d                   	ins    DWORD PTR es:[edi],dx
  a5:	65                   	gs
  a6:	2e                   	cs
  a7:	68 00 02 00 00       	push   0x200
  ac:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  b0:	6c                   	ins    BYTE PTR es:[edi],dx
  b1:	6c                   	ins    BYTE PTR es:[edi],dx
  b2:	2e                   	cs
  b3:	68 00 03 00 00       	push   0x300
  b8:	6d                   	ins    DWORD PTR es:[edi],dx
  b9:	61                   	popa   
  ba:	6c                   	ins    BYTE PTR es:[edi],dx
  bb:	6c                   	ins    BYTE PTR es:[edi],dx
  bc:	6f                   	outs   dx,DWORD PTR ds:[esi]
  bd:	63 2e                	arpl   WORD PTR [esi],bp
  bf:	68 00 02 00 00       	push   0x200
  c4:	6c                   	ins    BYTE PTR es:[edi],dx
  c5:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  cc:	4f                   	dec    edi
  cd:	53                   	push   ebx
  ce:	2e                   	cs
  cf:	68 00 02 00 00       	push   0x200
  d4:	00 00                	add    BYTE PTR [eax],al
  d6:	05 02 00 00 10       	add    eax,0x10000002
  db:	03 03                	add    eax,DWORD PTR [ebx]
  dd:	1b 01                	sbb    eax,DWORD PTR [ecx]
  df:	75 08                	jne    e9 <execInternalCommand-0x30fff17>
  e1:	14 68                	adc    al,0x68
  e3:	4c                   	dec    esp
  e4:	08 21                	or     BYTE PTR [ecx],ah
  e6:	08 21                	or     BYTE PTR [ecx],ah
  e8:	08 13                	or     BYTE PTR [ebx],dl
  ea:	03 0a                	add    ecx,DWORD PTR [edx]
  ec:	74 03                	je     f1 <execInternalCommand-0x30fff0f>
  ee:	79 2e                	jns    11e <execInternalCommand-0x30ffee2>
  f0:	02 30                	add    dh,BYTE PTR [eax]
  f2:	19 2c 08             	sbb    DWORD PTR [eax+ecx*1],ebp
  f5:	30 69 75             	xor    BYTE PTR [ecx+0x75],ch
  f8:	d7                   	xlat   BYTE PTR ds:[ebx]
  f9:	d7                   	xlat   BYTE PTR ds:[ebx]
  fa:	4c                   	dec    esp
  fb:	08 3e                	or     BYTE PTR [esi],bh
  fd:	bc e6 ae 94 08       	mov    esp,0x894aee6
 102:	2f                   	das    
 103:	e5 93                	in     eax,0x93
 105:	00 02                	add    BYTE PTR [edx],al
 107:	04 02                	add    al,0x2
 109:	06                   	push   es
 10a:	e4 00                	in     al,0x0
 10c:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
 10f:	e4 00                	in     al,0x0
 111:	02 04 05 e4 06 af 00 	add    al,BYTE PTR [eax*1+0xaf06e4]
 118:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 11b:	06                   	push   es
 11c:	e4 06                	in     al,0x6
 11e:	e5 02                	in     eax,0x2
 120:	23 13                	and    edx,DWORD PTR [ebx]
 122:	08 2f                	or     BYTE PTR [edi],ch
 124:	67 e3 34             	jcxz   15b <execInternalCommand-0x30ffea5>
 127:	00 02                	add    BYTE PTR [edx],al
 129:	04 02                	add    al,0x2
 12b:	02 23                	add    ah,BYTE PTR [ebx]
 12d:	14 00                	adc    al,0x0
 12f:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
 132:	03 63 4a             	add    esp,DWORD PTR [ebx+0x4a]
 135:	00 02                	add    BYTE PTR [edx],al
 137:	04 01                	add    al,0x1
 139:	06                   	push   es
 13a:	4a                   	dec    edx
 13b:	06                   	push   es
 13c:	03 1f                	add    ebx,DWORD PTR [edi]
 13e:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 141:	4b                   	dec    ebx
 142:	08 33                	or     BYTE PTR [ebx],dh
 144:	3d 5b 6a 92 02       	cmp    eax,0x2926a5b
 149:	3b 14 69             	cmp    edx,DWORD PTR [ecx+ebp*2]
 14c:	00 02                	add    BYTE PTR [edx],al
 14e:	04 02                	add    al,0x2
 150:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 153:	00 02                	add    BYTE PTR [edx],al
 155:	04 01                	add    al,0x1
 157:	06                   	push   es
 158:	4a                   	dec    edx
 159:	06                   	push   es
 15a:	03 0b                	add    ecx,DWORD PTR [ebx]
 15c:	66 59                	pop    cx
 15e:	32 69 75             	xor    ch,BYTE PTR [ecx+0x75]
 161:	75 75                	jne    1d8 <execInternalCommand-0x30ffe28>
 163:	75 75                	jne    1da <execInternalCommand-0x30ffe26>
 165:	78 a1                	js     108 <execInternalCommand-0x30ffef8>
 167:	08 ec                	or     ah,ch
 169:	00 02                	add    BYTE PTR [edx],al
 16b:	04 01                	add    al,0x1
 16d:	06                   	push   es
 16e:	66 06                	pushw  es
 170:	af                   	scas   eax,DWORD PTR es:[edi]
 171:	68 75 08 4c 67       	push   0x674c0875
 176:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 179:	5a                   	pop    edx
 17a:	00 02                	add    BYTE PTR [edx],al
 17c:	04 01                	add    al,0x1
 17e:	06                   	push   es
 17f:	9e                   	sahf   
 180:	00 02                	add    BYTE PTR [edx],al
 182:	04 02                	add    al,0x2
 184:	66                   	data16
 185:	00 02                	add    BYTE PTR [edx],al
 187:	04 03                	add    al,0x3
 189:	66 06                	pushw  es
 18b:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 18c:	68 75 08 5a a0       	push   0xa05a0875
 191:	bc 68 a0 94 08       	mov    esp,0x894a068
 196:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 199:	94                   	xchg   esp,eax
 19a:	08 33                	or     BYTE PTR [ebx],dh
 19c:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 1a1:	16                   	push   ss
 1a2:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 1a5:	03 3a                	add    edi,DWORD PTR [edx]
 1a7:	d6                   	(bad)  
 1a8:	68 d8 08 e7 08       	push   0x8e708d8
 1ad:	13 d7                	adc    edx,edi
 1af:	08 e5                	or     ch,ah
 1b1:	08 3e                	or     BYTE PTR [esi],bh
 1b3:	4b                   	dec    ebx
 1b4:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 1b7:	d9 d9                	(bad)  
 1b9:	d7                   	xlat   BYTE PTR ds:[ebx]
 1ba:	d7                   	xlat   BYTE PTR ds:[ebx]
 1bb:	3d 31 67 f3 00       	cmp    eax,0xf36731
 1c0:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 1c3:	91                   	xchg   ecx,eax
 1c4:	00 02                	add    BYTE PTR [edx],al
 1c6:	04 03                	add    al,0x3
 1c8:	02 2c 11             	add    ch,BYTE PTR [ecx+edx*1]
 1cb:	00 02                	add    BYTE PTR [edx],al
 1cd:	04 01                	add    al,0x1
 1cf:	06                   	push   es
 1d0:	4a                   	dec    edx
 1d1:	06                   	push   es
 1d2:	68 3f 75 08 4c       	push   0x4c08753f
 1d7:	00 02                	add    BYTE PTR [edx],al
 1d9:	04 03                	add    al,0x3
 1db:	92                   	xchg   edx,eax
 1dc:	00 02                	add    BYTE PTR [edx],al
 1de:	04 03                	add    al,0x3
 1e0:	08 d7                	or     bh,dl
 1e2:	00 02                	add    BYTE PTR [edx],al
 1e4:	04 03                	add    al,0x3
 1e6:	02 2b                	add    ch,BYTE PTR [ebx]
 1e8:	0f 00 02             	sldt   WORD PTR [edx]
 1eb:	04 01                	add    al,0x1
 1ed:	06                   	push   es
 1ee:	4a                   	dec    edx
 1ef:	06                   	push   es
 1f0:	87 3d 5b 67 00 02    	xchg   DWORD PTR ds:0x200675b,edi
 1f6:	04 03                	add    al,0x3
 1f8:	91                   	xchg   ecx,eax
 1f9:	00 02                	add    BYTE PTR [edx],al
 1fb:	04 03                	add    al,0x3
 1fd:	ff 00                	inc    DWORD PTR [eax]
 1ff:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 202:	06                   	push   es
 203:	4a                   	dec    edx
 204:	06                   	push   es
 205:	84 d7                	test   bh,dl
 207:	3f                   	aas    
 208:	91                   	xchg   ecx,eax
 209:	4b                   	dec    ebx
 20a:	76 08                	jbe    214 <execInternalCommand-0x30ffdec>
 20c:	bb 76 08 76 08       	mov    ebx,0x8760876
 211:	a0 4b 4c 08 d7       	mov    al,ds:0xd7084c4b
 216:	02 27                	add    ah,BYTE PTR [edi]
 218:	13 68 ad             	adc    ebp,DWORD PTR [eax-0x53]
 21b:	f5                   	cmc    
 21c:	08 d7                	or     bh,dl
 21e:	08 13                	or     BYTE PTR [ebx],dl
 220:	3f                   	aas    
 221:	92                   	xchg   edx,eax
 222:	08 bc ae 08 24 02 22 	or     BYTE PTR [esi+ebp*4+0x22022408],bh
 229:	13 31                	adc    esi,DWORD PTR [ecx]
 22b:	93                   	xchg   ebx,eax
 22c:	08 ca                	or     dl,cl
 22e:	08 bd 9f 75 3f 92    	or     BYTE PTR [ebp-0x6dc08a61],bh
 234:	75 76                	jne    2ac <execInternalCommand-0x30ffd54>
 236:	75 75                	jne    2ad <execInternalCommand-0x30ffd53>
 238:	77 59                	ja     293 <execInternalCommand-0x30ffd6d>
 23a:	75 08                	jne    244 <execInternalCommand-0x30ffdbc>
 23c:	4b                   	dec    ebx
 23d:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 240:	5b                   	pop    ebx
 241:	5b                   	pop    ebx
 242:	75 75                	jne    2b9 <execInternalCommand-0x30ffd47>
 244:	08 83 08 4c 75 30    	or     BYTE PTR [ebx+0x30754c08],al
 24a:	08 56 b1             	or     BYTE PTR [esi-0x4f],dl
 24d:	ae                   	scas   al,BYTE PTR es:[edi]
 24e:	03 0f                	add    ecx,DWORD PTR [edi]
 250:	66                   	data16
 251:	ae                   	scas   al,BYTE PTR es:[edi]
 252:	03 10                	add    edx,DWORD PTR [eax]
 254:	82                   	(bad)  
 255:	ae                   	scas   al,BYTE PTR es:[edi]
 256:	68 f3 4d 30 af       	push   0xaf304df3
 25b:	ae                   	scas   al,BYTE PTR es:[edi]
 25c:	4b                   	dec    ebx
 25d:	d7                   	xlat   BYTE PTR ds:[ebx]
 25e:	03 0c 90             	add    ecx,DWORD PTR [eax+edx*4]
 261:	b2 08                	mov    dl,0x8
 263:	68 03 7a 58 03       	push   0x3587a03
 268:	09 20                	or     DWORD PTR [eax],esp
 26a:	ad                   	lods   eax,DWORD PTR ds:[esi]
 26b:	59                   	pop    ecx
 26c:	08 4c 08 21          	or     BYTE PTR [eax+ecx*1+0x21],cl
 270:	68 03 09 4a 02       	push   0x24a0903
 275:	27                   	daa    
 276:	13 03                	adc    eax,DWORD PTR [ebx]
 278:	96                   	xchg   esi,eax
 279:	7f 66                	jg     2e1 <execInternalCommand-0x30ffd1f>
 27b:	03 ed                	add    ebp,ebp
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
 127:	64                   	fs
 128:	71 75                	jno    19f <execInternalCommand-0x30ffe61>
 12a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 12b:	74 65                	je     192 <execInternalCommand-0x30ffe6e>
 12d:	00 74 69 6d          	add    BYTE PTR [ecx+ebp*2+0x6d],dh
 131:	65                   	gs
 132:	5f                   	pop    edi
 133:	74 00                	je     135 <execInternalCommand-0x30ffecb>
 135:	75 69                	jne    1a0 <execInternalCommand-0x30ffe60>
 137:	6e                   	outs   dx,BYTE PTR ds:[esi]
 138:	74 38                	je     172 <execInternalCommand-0x30ffe8e>
 13a:	5f                   	pop    edi
 13b:	74 00                	je     13d <execInternalCommand-0x30ffec3>
 13d:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 140:	6d                   	ins    DWORD PTR es:[edi],dx
 141:	61                   	popa   
 142:	6e                   	outs   dx,BYTE PTR ds:[esi]
 143:	64                   	fs
 144:	73 00                	jae    146 <execInternalCommand-0x30ffeba>
 146:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 149:	6d                   	ins    DWORD PTR es:[edi],dx
 14a:	61                   	popa   
 14b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 14c:	64                   	fs
 14d:	5f                   	pop    edi
 14e:	66                   	data16
 14f:	75 6e                	jne    1bf <execInternalCommand-0x30ffe41>
 151:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 155:	6e                   	outs   dx,BYTE PTR ds:[esi]
 156:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 159:	65                   	gs
 15a:	65                   	gs
 15b:	41                   	inc    ecx
 15c:	72 67                	jb     1c5 <execInternalCommand-0x30ffe3b>
 15e:	56                   	push   esi
 15f:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 162:	72 61                	jb     1c5 <execInternalCommand-0x30ffe3b>
 164:	6d                   	ins    DWORD PTR es:[edi],dx
 165:	43                   	inc    ebx
 166:	6f                   	outs   dx,DWORD PTR ds:[esi]
 167:	75 6e                	jne    1d7 <execInternalCommand-0x30ffe29>
 169:	74 00                	je     16b <execInternalCommand-0x30ffe95>
 16b:	70 63                	jo     1d0 <execInternalCommand-0x30ffe30>
 16d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 16e:	75 6e                	jne    1de <execInternalCommand-0x30ffe22>
 170:	74 00                	je     172 <execInternalCommand-0x30ffe8e>
 172:	6c                   	ins    BYTE PTR es:[edi],dx
 173:	6f                   	outs   dx,DWORD PTR ds:[esi]
 174:	6e                   	outs   dx,BYTE PTR ds:[esi]
 175:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 179:	6e                   	outs   dx,BYTE PTR ds:[esi]
 17a:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 17e:	74 00                	je     180 <execInternalCommand-0x30ffe80>
 180:	70 61                	jo     1e3 <execInternalCommand-0x30ffe1d>
 182:	72 61                	jb     1e5 <execInternalCommand-0x30ffe1b>
 184:	6d                   	ins    DWORD PTR es:[edi],dx
 185:	73 54                	jae    1db <execInternalCommand-0x30ffe25>
 187:	6f                   	outs   dx,DWORD PTR ds:[esi]
 188:	41                   	inc    ecx
 189:	72 67                	jb     1f2 <execInternalCommand-0x30ffe0e>
 18b:	76 00                	jbe    18d <execInternalCommand-0x30ffe73>
 18d:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 190:	6d                   	ins    DWORD PTR es:[edi],dx
 191:	61                   	popa   
 192:	6e                   	outs   dx,BYTE PTR ds:[esi]
 193:	64                   	fs
 194:	5f                   	pop    edi
 195:	66                   	data16
 196:	75 6e                	jne    206 <execInternalCommand-0x30ffdfa>
 198:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 19c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 19d:	5f                   	pop    edi
 19e:	70 00                	jo     1a0 <execInternalCommand-0x30ffe60>
 1a0:	62 73 71             	bound  esi,QWORD PTR [ebx+0x71]
 1a3:	75 6f                	jne    214 <execInternalCommand-0x30ffdec>
 1a5:	74 65                	je     20c <execInternalCommand-0x30ffdf4>
 1a7:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 1aa:	74 41                	je     1ed <execInternalCommand-0x30ffe13>
 1ac:	43                   	inc    ebx
 1ad:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1ae:	6d                   	ins    DWORD PTR es:[edi],dx
 1af:	6d                   	ins    DWORD PTR es:[edi],dx
 1b0:	61                   	popa   
 1b1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1b2:	64 00 68 65          	add    BYTE PTR fs:[eax+0x65],ch
 1b6:	61                   	popa   
 1b7:	70 43                	jo     1fc <execInternalCommand-0x30ffe04>
 1b9:	75 72                	jne    22d <execInternalCommand-0x30ffdd3>
 1bb:	72 00                	jb     1bd <execInternalCommand-0x30ffe43>
 1bd:	6d                   	ins    DWORD PTR es:[edi],dx
 1be:	61                   	popa   
 1bf:	78 61                	js     222 <execInternalCommand-0x30ffdde>
 1c1:	72 67                	jb     22a <execInternalCommand-0x30ffdd6>
 1c3:	63 00                	arpl   WORD PTR [eax],ax
 1c5:	73 45                	jae    20c <execInternalCommand-0x30ffdf4>
 1c7:	78 65                	js     22e <execInternalCommand-0x30ffdd2>
 1c9:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 1cc:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
 1d3:	72 61                	jb     236 <execInternalCommand-0x30ffdca>
 1d5:	6d                   	ins    DWORD PTR es:[edi],dx
 1d6:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 1d9:	72 61                	jb     23c <execInternalCommand-0x30ffdc4>
 1db:	6d                   	ins    DWORD PTR es:[edi],dx
 1dc:	73 00                	jae    1de <execInternalCommand-0x30ffe22>
 1de:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1df:	61                   	popa   
 1e0:	6d                   	ins    DWORD PTR es:[edi],dx
 1e1:	65 00 6e 65          	add    BYTE PTR gs:[esi+0x65],ch
 1e5:	65                   	gs
 1e6:	64                   	fs
 1e7:	44                   	inc    esp
 1e8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1e9:	75 62                	jne    24d <execInternalCommand-0x30ffdb3>
 1eb:	6c                   	ins    BYTE PTR es:[edi],dx
 1ec:	65                   	gs
 1ed:	51                   	push   ecx
 1ee:	75 6f                	jne    25f <execInternalCommand-0x30ffda1>
 1f0:	74 65                	je     257 <execInternalCommand-0x30ffda9>
 1f2:	74 6f                	je     263 <execInternalCommand-0x30ffd9d>
 1f4:	45                   	inc    ebp
 1f5:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1f6:	64                   	fs
 1f7:	50                   	push   eax
 1f8:	61                   	popa   
 1f9:	72 61                	jb     25c <execInternalCommand-0x30ffda4>
 1fb:	6d                   	ins    DWORD PTR es:[edi],dx
 1fc:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 1ff:	6f                   	outs   dx,DWORD PTR ds:[esi]
 200:	67 72 61             	addr16 jb 264 <execInternalCommand-0x30ffd9c>
 203:	6d                   	ins    DWORD PTR es:[edi],dx
 204:	50                   	push   eax
 205:	61                   	popa   
 206:	72 61                	jb     269 <execInternalCommand-0x30ffd97>
 208:	6d                   	ins    DWORD PTR es:[edi],dx
 209:	4e                   	dec    esi
 20a:	75 6d                	jne    279 <execInternalCommand-0x30ffd87>
 20c:	00 75 6e             	add    BYTE PTR [ebp+0x6e],dh
 20f:	73 69                	jae    27a <execInternalCommand-0x30ffd86>
 211:	67 6e                	outs   dx,BYTE PTR ds:[si]
 213:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 218:	61                   	popa   
 219:	72 00                	jb     21b <execInternalCommand-0x30ffde5>
 21b:	6c                   	ins    BYTE PTR es:[edi],dx
 21c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 21d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 21e:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 222:	6e                   	outs   dx,BYTE PTR ds:[esi]
 223:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 227:	73 69                	jae    292 <execInternalCommand-0x30ffd6e>
 229:	67 6e                	outs   dx,BYTE PTR ds:[si]
 22b:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 230:	74 00                	je     232 <execInternalCommand-0x30ffdce>
 232:	75 69                	jne    29d <execInternalCommand-0x30ffd63>
 234:	6e                   	outs   dx,BYTE PTR ds:[esi]
 235:	74 33                	je     26a <execInternalCommand-0x30ffd96>
 237:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 23a:	00 62 75             	add    BYTE PTR [edx+0x75],ah
 23d:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 244:	00 
 245:	65                   	gs
 246:	78 69                	js     2b1 <execInternalCommand-0x30ffd4f>
 248:	74 43                	je     28d <execInternalCommand-0x30ffd73>
 24a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 24b:	64 65 00 73 68       	fs add BYTE PTR fs:gs:[ebx+0x68],dh
 250:	6f                   	outs   dx,DWORD PTR ds:[esi]
 251:	72 74                	jb     2c7 <execInternalCommand-0x30ffd39>
 253:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 256:	73 69                	jae    2c1 <execInternalCommand-0x30ffd3f>
 258:	67 6e                	outs   dx,BYTE PTR ds:[si]
 25a:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 25f:	74 00                	je     261 <execInternalCommand-0x30ffd9f>
 261:	6c                   	ins    BYTE PTR es:[edi],dx
 262:	43                   	inc    ebx
 263:	75 72                	jne    2d7 <execInternalCommand-0x30ffd29>
 265:	72 4b                	jb     2b2 <execInternalCommand-0x30ffd4e>
 267:	65                   	gs
 268:	79 00                	jns    26a <execInternalCommand-0x30ffd96>
 26a:	6c                   	ins    BYTE PTR es:[edi],dx
 26b:	69 62 63 54 5a 00 63 	imul   esp,DWORD PTR [edx+0x63],0x63005a54
 272:	6f                   	outs   dx,DWORD PTR ds:[esi]
 273:	6d                   	ins    DWORD PTR es:[edi],dx
 274:	6d                   	ins    DWORD PTR es:[edi],dx
 275:	61                   	popa   
 276:	6e                   	outs   dx,BYTE PTR ds:[esi]
 277:	64                   	fs
 278:	42                   	inc    edx
 279:	75 66                	jne    2e1 <execInternalCommand-0x30ffd1f>
 27b:	66 50                	push   ax
 27d:	74 72                	je     2f1 <execInternalCommand-0x30ffd0f>
 27f:	00 5f 42             	add    BYTE PTR [edi+0x42],bl
 282:	6f                   	outs   dx,DWORD PTR ds:[esi]
 283:	6f                   	outs   dx,DWORD PTR ds:[esi]
 284:	6c                   	ins    BYTE PTR es:[edi],dx
 285:	00 6b 73             	add    BYTE PTR [ebx+0x73],ch
 288:	68 65 6c 6c 2e       	push   0x2e6c6c65
 28d:	63 00                	arpl   WORD PTR [eax],ax
 28f:	61                   	popa   
 290:	6e                   	outs   dx,BYTE PTR ds:[esi]
 291:	73 69                	jae    2fc <execInternalCommand-0x30ffd04>
 293:	53                   	push   ebx
 294:	65                   	gs
 295:	71 00                	jno    297 <execInternalCommand-0x30ffd69>
 297:	65                   	gs
 298:	78 65                	js     2ff <execInternalCommand-0x30ffd01>
 29a:	63 70 00             	arpl   WORD PTR [eax+0x0],si
 29d:	70 72                	jo     311 <execInternalCommand-0x30ffcef>
 29f:	6d                   	ins    DWORD PTR es:[edi],dx
 2a0:	73 00                	jae    2a2 <execInternalCommand-0x30ffd5e>
 2a2:	73 69                	jae    30d <execInternalCommand-0x30ffcf3>
 2a4:	7a 65                	jp     30b <execInternalCommand-0x30ffcf5>
 2a6:	00 6e 61             	add    BYTE PTR [esi+0x61],ch
 2a9:	72 67                	jb     312 <execInternalCommand-0x30ffcee>
 2ab:	76 00                	jbe    2ad <execInternalCommand-0x30ffd53>
 2ad:	68 65 61 70 42       	push   0x42706165
 2b2:	61                   	popa   
 2b3:	73 65                	jae    31a <execInternalCommand-0x30ffce6>
 2b5:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 2b8:	64                   	fs
 2b9:	4c                   	dec    esp
 2ba:	69 6e 65 00 63 6d 64 	imul   ebp,DWORD PTR [esi+0x65],0x646d6300
 2c1:	73 00                	jae    2c3 <execInternalCommand-0x30ffd3d>
 2c3:	66 69 6e 64 43 6f    	imul   bp,WORD PTR [esi+0x64],0x6f43
 2c9:	6d                   	ins    DWORD PTR es:[edi],dx
 2ca:	6d                   	ins    DWORD PTR es:[edi],dx
 2cb:	61                   	popa   
 2cc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2cd:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 2d1:	70 79                	jo     34c <execInternalCommand-0x30ffcb4>
 2d3:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 2d6:	00 6b 53             	add    BYTE PTR [ebx+0x53],ch
 2d9:	6c                   	ins    BYTE PTR es:[edi],dx
 2da:	65                   	gs
 2db:	65                   	gs
 2dc:	70 00                	jo     2de <execInternalCommand-0x30ffd22>
 2de:	62 61 63             	bound  esp,QWORD PTR [ecx+0x63]
 2e1:	6b 67 72 6f          	imul   esp,DWORD PTR [edi+0x72],0x6f
 2e5:	75 6e                	jne    355 <execInternalCommand-0x30ffcab>
 2e7:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 2eb:	6d                   	ins    DWORD PTR es:[edi],dx
 2ec:	6d                   	ins    DWORD PTR es:[edi],dx
 2ed:	61                   	popa   
 2ee:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2ef:	64                   	fs
 2f0:	73 50                	jae    342 <execInternalCommand-0x30ffcbe>
 2f2:	74 72                	je     366 <execInternalCommand-0x30ffc9a>
 2f4:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 2f7:	6d                   	ins    DWORD PTR es:[edi],dx
 2f8:	6d                   	ins    DWORD PTR es:[edi],dx
 2f9:	61                   	popa   
 2fa:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2fb:	64                   	fs
 2fc:	57                   	push   edi
 2fd:	61                   	popa   
 2fe:	73 46                	jae    346 <execInternalCommand-0x30ffcba>
 300:	72 6f                	jb     371 <execInternalCommand-0x30ffc8f>
 302:	6d                   	ins    DWORD PTR es:[edi],dx
 303:	54                   	push   esp
 304:	68 69 73 42 75       	push   0x75427369
 309:	66                   	data16
 30a:	66                   	data16
 30b:	65                   	gs
 30c:	72 50                	jb     35e <execInternalCommand-0x30ffca2>
 30e:	74 72                	je     382 <execInternalCommand-0x30ffc7e>
 310:	00 2f                	add    BYTE PTR [edi],ch
 312:	68 6f 6d 65 2f       	push   0x2f656d6f
 317:	79 6f                	jns    388 <execInternalCommand-0x30ffc78>
 319:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 320:	6f                   	outs   dx,DWORD PTR ds:[esi]
 321:	73 2f                	jae    352 <execInternalCommand-0x30ffcae>
 323:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 327:	6c                   	ins    BYTE PTR es:[edi],dx
 328:	6c                   	ins    BYTE PTR es:[edi],dx
 329:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 32c:	6d                   	ins    DWORD PTR es:[edi],dx
 32d:	6d                   	ins    DWORD PTR es:[edi],dx
 32e:	61                   	popa   
 32f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 330:	64 00 6b 53          	add    BYTE PTR fs:[ebx+0x53],ch
 334:	68 65 6c 6c 00       	push   0x6c6c65
 339:	67                   	addr16
 33a:	65                   	gs
 33b:	74 41                	je     37e <execInternalCommand-0x30ffc82>
 33d:	4b                   	dec    ebx
 33e:	65                   	gs
 33f:	79 00                	jns    341 <execInternalCommand-0x30ffcbf>

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
