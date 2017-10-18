
Debug/cross-Linux/kshell:     file format elf32-i386


Disassembly of section .text:

03100000 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/aproj/kshell/kshell.c:27
void execInternalCommand(char lCommand[256]);
int findCommand(char* command);
char **buildargv (const char *input);

void execInternalCommand(char lCommand[256])
{
 3100000:	55                   	push   ebp
 3100001:	89 e5                	mov    ebp,esp
 3100003:	53                   	push   ebx
 3100004:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/kshell.c:28
    int i = findCommand(lCommand);
 3100007:	83 ec 0c             	sub    esp,0xc
 310000a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310000d:	e8 38 02 00 00       	call   310024a <findCommand>
 3100012:	83 c4 10             	add    esp,0x10
 3100015:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/kshell.c:30

    if(i>0)
 3100018:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 310001c:	7e 74                	jle    3100092 <execInternalCommand+0x92>
/home/yogi/src/os/aproj/kshell/kshell.c:32
    {
        i--;
 310001e:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:34
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 3100022:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100025:	c1 e0 04             	shl    eax,0x4
 3100028:	05 c8 12 10 03       	add    eax,0x31012c8
 310002d:	8b 00                	mov    eax,DWORD PTR [eax]
 310002f:	a3 30 16 10 03       	mov    ds:0x3101630,eax
/home/yogi/src/os/aproj/kshell/kshell.c:35
        command_function_p = cmds[i].function;
 3100034:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100037:	c1 e0 04             	shl    eax,0x4
 310003a:	05 c8 12 10 03       	add    eax,0x31012c8
 310003f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100041:	a3 20 16 10 03       	mov    ds:0x3101620,eax
/home/yogi/src/os/aproj/kshell/kshell.c:36
        if (cmds[i].paramCount==0)
 3100046:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100049:	c1 e0 04             	shl    eax,0x4
 310004c:	05 cc 12 10 03       	add    eax,0x31012cc
 3100051:	8b 00                	mov    eax,DWORD PTR [eax]
 3100053:	85 c0                	test   eax,eax
 3100055:	75 09                	jne    3100060 <execInternalCommand+0x60>
/home/yogi/src/os/aproj/kshell/kshell.c:37
            command_function();
 3100057:	a1 30 16 10 03       	mov    eax,ds:0x3101630
 310005c:	ff d0                	call   eax
/home/yogi/src/os/aproj/kshell/kshell.c:47
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
    }
}
 310005e:	eb 45                	jmp    31000a5 <execInternalCommand+0xa5>
/home/yogi/src/os/aproj/kshell/kshell.c:40
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
 3100060:	8b 1d 20 16 10 03    	mov    ebx,DWORD PTR ds:0x3101620
 3100066:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100069:	c1 e0 04             	shl    eax,0x4
 310006c:	05 c0 12 10 03       	add    eax,0x31012c0
 3100071:	8b 00                	mov    eax,DWORD PTR [eax]
 3100073:	83 ec 0c             	sub    esp,0xc
 3100076:	50                   	push   eax
 3100077:	e8 f4 0b 00 00       	call   3100c70 <kShell+0x311>
 310007c:	83 c4 10             	add    esp,0x10
 310007f:	8d 50 01             	lea    edx,[eax+0x1]
 3100082:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100085:	01 d0                	add    eax,edx
 3100087:	83 ec 0c             	sub    esp,0xc
 310008a:	50                   	push   eax
 310008b:	ff d3                	call   ebx
 310008d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:47
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
    }
}
 3100090:	eb 13                	jmp    31000a5 <execInternalCommand+0xa5>
/home/yogi/src/os/aproj/kshell/kshell.c:45
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
        }
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
 3100092:	83 ec 08             	sub    esp,0x8
 3100095:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100098:	68 10 0d 10 03       	push   0x3100d10
 310009d:	e8 0e 0b 00 00       	call   3100bb0 <kShell+0x251>
 31000a2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:47
    }
}
 31000a5:	90                   	nop
 31000a6:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31000a9:	c9                   	leave  
 31000aa:	c3                   	ret    

031000ab <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/aproj/kshell/kshell.c:50

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 31000ab:	55                   	push   ebp
 31000ac:	89 e5                	mov    ebp,esp
 31000ae:	53                   	push   ebx
 31000af:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/aproj/kshell/kshell.c:51
    int x=0,y=0;
 31000b2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31000b9:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:52
    int lRetVal=0,parsedChars=0;
 31000c0:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 31000c7:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:53
    bool needDoubleQuotetoEndParam=0;
 31000ce:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:55
    
    memset(params,0, size);
 31000d2:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 31000d5:	83 ec 04             	sub    esp,0x4
 31000d8:	50                   	push   eax
 31000d9:	6a 00                	push   0x0
 31000db:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31000de:	e8 6d 0b 00 00       	call   3100c50 <kShell+0x2f1>
 31000e3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:57
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31000e6:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 31000ed:	e9 1c 01 00 00       	jmp    310020e <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/kshell.c:59
    {
        if(cmdLine[cnt]=='"')
 31000f2:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31000f5:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31000f8:	01 d0                	add    eax,edx
 31000fa:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31000fd:	3c 22                	cmp    al,0x22
 31000ff:	75 3f                	jne    3100140 <parseParamsShell+0x95>
/home/yogi/src/os/aproj/kshell/kshell.c:61
        {
            if (!needDoubleQuotetoEndParam)
 3100101:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100105:	83 f0 01             	xor    eax,0x1
 3100108:	84 c0                	test   al,al
 310010a:	74 09                	je     3100115 <parseParamsShell+0x6a>
/home/yogi/src/os/aproj/kshell/kshell.c:63
            {
                needDoubleQuotetoEndParam=true;
 310010c:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
 3100110:	e9 f1 00 00 00       	jmp    3100206 <parseParamsShell+0x15b>
/home/yogi/src/os/aproj/kshell/kshell.c:67
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
/home/yogi/src/os/aproj/kshell/kshell.c:68
                {x=0;y++;lRetVal++;}
 3100128:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310012f:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100133:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:69
                needDoubleQuotetoEndParam=false;
 3100137:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
 310013b:	e9 c6 00 00 00       	jmp    3100206 <parseParamsShell+0x15b>
/home/yogi/src/os/aproj/kshell/kshell.c:72
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
 3100140:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100143:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100146:	01 d0                	add    eax,edx
 3100148:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310014b:	3c 20                	cmp    al,0x20
 310014d:	74 1e                	je     310016d <parseParamsShell+0xc2>
/home/yogi/src/os/aproj/kshell/kshell.c:72 (discriminator 2)
 310014f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100152:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100155:	01 d0                	add    eax,edx
 3100157:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310015a:	3c 2d                	cmp    al,0x2d
 310015c:	74 0f                	je     310016d <parseParamsShell+0xc2>
/home/yogi/src/os/aproj/kshell/kshell.c:72 (discriminator 4)
 310015e:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100161:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100164:	01 d0                	add    eax,edx
 3100166:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100169:	3c 2c                	cmp    al,0x2c
 310016b:	75 76                	jne    31001e3 <parseParamsShell+0x138>
/home/yogi/src/os/aproj/kshell/kshell.c:72 (discriminator 5)
 310016d:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100171:	83 f0 01             	xor    eax,0x1
 3100174:	84 c0                	test   al,al
 3100176:	74 6b                	je     31001e3 <parseParamsShell+0x138>
/home/yogi/src/os/aproj/kshell/kshell.c:75
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 3100178:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310017b:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310017e:	01 d0                	add    eax,edx
 3100180:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100183:	3c 2d                	cmp    al,0x2d
 3100185:	74 0f                	je     3100196 <parseParamsShell+0xeb>
/home/yogi/src/os/aproj/kshell/kshell.c:75 (discriminator 1)
 3100187:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310018a:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310018d:	01 d0                	add    eax,edx
 310018f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100192:	3c 2f                	cmp    al,0x2f
 3100194:	75 23                	jne    31001b9 <parseParamsShell+0x10e>
/home/yogi/src/os/aproj/kshell/kshell.c:76
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
/home/yogi/src/os/aproj/kshell/kshell.c:77
            params[y][x]='\0';
 31001b9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31001bc:	6b d0 32             	imul   edx,eax,0x32
 31001bf:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31001c2:	01 c2                	add    edx,eax
 31001c4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001c7:	01 d0                	add    eax,edx
 31001c9:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:78
            if (cnt>0)
 31001cc:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 31001d0:	74 34                	je     3100206 <parseParamsShell+0x15b>
/home/yogi/src/os/aproj/kshell/kshell.c:79
                {x=0;y++;lRetVal++;}
 31001d2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31001d9:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 31001dd:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:78
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 31001e1:	eb 23                	jmp    3100206 <parseParamsShell+0x15b>
/home/yogi/src/os/aproj/kshell/kshell.c:84
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
/home/yogi/src/os/aproj/kshell/kshell.c:86 (discriminator 2)
        }
        parsedChars++;
 3100206:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:57 (discriminator 2)
    int lRetVal=0,parsedChars=0;
    bool needDoubleQuotetoEndParam=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 310020a:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:57 (discriminator 1)
 310020e:	83 ec 0c             	sub    esp,0xc
 3100211:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100214:	e8 57 0a 00 00       	call   3100c70 <kShell+0x311>
 3100219:	83 c4 10             	add    esp,0x10
 310021c:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 310021f:	0f 87 cd fe ff ff    	ja     31000f2 <parseParamsShell+0x47>
/home/yogi/src/os/aproj/kshell/kshell.c:88
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 3100225:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100229:	74 17                	je     3100242 <parseParamsShell+0x197>
/home/yogi/src/os/aproj/kshell/kshell.c:90
    {
        lRetVal++;
 310022b:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:91
        params[y][x]='\0';
 310022f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100232:	6b d0 32             	imul   edx,eax,0x32
 3100235:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100238:	01 c2                	add    edx,eax
 310023a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310023d:	01 d0                	add    eax,edx
 310023f:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:96
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 3100242:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/aproj/kshell/kshell.c:97
}
 3100245:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100248:	c9                   	leave  
 3100249:	c3                   	ret    

0310024a <findCommand>:
findCommand():
/home/yogi/src/os/aproj/kshell/kshell.c:100

int findCommand(char* command)
{
 310024a:	55                   	push   ebp
 310024b:	89 e5                	mov    ebp,esp
 310024d:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/kshell.c:104
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3100250:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100257:	eb 4d                	jmp    31002a6 <findCommand+0x5c>
/home/yogi/src/os/aproj/kshell/kshell.c:106
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 3100259:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310025c:	c1 e0 04             	shl    eax,0x4
 310025f:	05 c0 12 10 03       	add    eax,0x31012c0
 3100264:	8b 00                	mov    eax,DWORD PTR [eax]
 3100266:	83 ec 0c             	sub    esp,0xc
 3100269:	50                   	push   eax
 310026a:	e8 01 0a 00 00       	call   3100c70 <kShell+0x311>
 310026f:	83 c4 10             	add    esp,0x10
 3100272:	89 c2                	mov    edx,eax
 3100274:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100277:	c1 e0 04             	shl    eax,0x4
 310027a:	05 c0 12 10 03       	add    eax,0x31012c0
 310027f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100281:	83 ec 04             	sub    esp,0x4
 3100284:	52                   	push   edx
 3100285:	50                   	push   eax
 3100286:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100289:	e8 a2 09 00 00       	call   3100c30 <kShell+0x2d1>
 310028e:	83 c4 10             	add    esp,0x10
 3100291:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:108
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 3100294:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100298:	75 08                	jne    31002a2 <findCommand+0x58>
/home/yogi/src/os/aproj/kshell/kshell.c:111
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 310029a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310029d:	83 c0 01             	add    eax,0x1
 31002a0:	eb 0f                	jmp    31002b1 <findCommand+0x67>
/home/yogi/src/os/aproj/kshell/kshell.c:104 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 31002a2:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:104 (discriminator 1)
 31002a6:	83 7d f4 04          	cmp    DWORD PTR [ebp-0xc],0x4
 31002aa:	76 ad                	jbe    3100259 <findCommand+0xf>
/home/yogi/src/os/aproj/kshell/kshell.c:115
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 31002ac:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/aproj/kshell/kshell.c:116
}
 31002b1:	c9                   	leave  
 31002b2:	c3                   	ret    

031002b3 <buildargv>:
buildargv():
/home/yogi/src/os/aproj/kshell/kshell.c:120

/*parts from http://*/
char **buildargv (const char *input)
{
 31002b3:	55                   	push   ebp
 31002b4:	89 e5                	mov    ebp,esp
 31002b6:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/kshell.c:123
  char *arg;
  char *copybuf;
  int squote = 0;
 31002b9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:124
  int dquote = 0;
 31002c0:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:125
  int bsquote = 0;
 31002c7:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:126
  int argc = 0;
 31002ce:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:127
  int maxargc = 0;
 31002d5:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:128
  char **argv = NULL;
 31002dc:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:132
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 31002e3:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 31002e7:	0f 84 33 02 00 00    	je     3100520 <buildargv+0x26d>
/home/yogi/src/os/aproj/kshell/kshell.c:135
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 31002ed:	83 ec 0c             	sub    esp,0xc
 31002f0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31002f3:	e8 78 09 00 00       	call   3100c70 <kShell+0x311>
 31002f8:	83 c4 10             	add    esp,0x10
 31002fb:	83 c0 01             	add    eax,0x1
 31002fe:	83 ec 0c             	sub    esp,0xc
 3100301:	50                   	push   eax
 3100302:	e8 d9 08 00 00       	call   3100be0 <kShell+0x281>
 3100307:	83 c4 10             	add    esp,0x10
 310030a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:143
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 310030d:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 3100311:	74 0b                	je     310031e <buildargv+0x6b>
/home/yogi/src/os/aproj/kshell/kshell.c:143 (discriminator 1)
 3100313:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100316:	83 e8 01             	sub    eax,0x1
 3100319:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 310031c:	7f 3d                	jg     310035b <buildargv+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:146
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 310031e:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 3100322:	75 1c                	jne    3100340 <buildargv+0x8d>
/home/yogi/src/os/aproj/kshell/kshell.c:148
		{
		  maxargc = INITIAL_MAXARGC;
 3100324:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/aproj/kshell/kshell.c:149
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 310032b:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 310032e:	c1 e0 02             	shl    eax,0x2
 3100331:	83 ec 0c             	sub    esp,0xc
 3100334:	50                   	push   eax
 3100335:	e8 a6 08 00 00       	call   3100be0 <kShell+0x281>
 310033a:	83 c4 10             	add    esp,0x10
 310033d:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/kshell.c:151
		}
	      argv = nargv;
 3100340:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 3100343:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/kshell.c:152
	      argv[argc] = NULL;
 3100346:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100349:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100350:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100353:	01 d0                	add    eax,edx
 3100355:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:155
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 310035b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310035e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/kshell.c:156
	  while (*input != EOS)
 3100361:	e9 ec 00 00 00       	jmp    3100452 <buildargv+0x19f>
/home/yogi/src/os/aproj/kshell/kshell.c:158
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100366:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100369:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310036c:	3c 20                	cmp    al,0x20
 310036e:	75 16                	jne    3100386 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/kshell.c:158 (discriminator 1)
 3100370:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100374:	75 10                	jne    3100386 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/kshell.c:158 (discriminator 2)
 3100376:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 310037a:	75 0a                	jne    3100386 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/kshell.c:158 (discriminator 3)
 310037c:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100380:	0f 84 da 00 00 00    	je     3100460 <buildargv+0x1ad>
/home/yogi/src/os/aproj/kshell/kshell.c:164
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100386:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310038a:	74 1d                	je     31003a9 <buildargv+0xf6>
/home/yogi/src/os/aproj/kshell/kshell.c:166
		    {
		      bsquote = 0;
 310038c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:167
		      *arg++ = *input;
 3100393:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100396:	8d 50 01             	lea    edx,[eax+0x1]
 3100399:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310039c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310039f:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31003a2:	88 10                	mov    BYTE PTR [eax],dl
 31003a4:	e9 a5 00 00 00       	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:169
		    }
		  else if (*input == '\\')
 31003a9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003ac:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003af:	3c 5c                	cmp    al,0x5c
 31003b1:	75 0c                	jne    31003bf <buildargv+0x10c>
/home/yogi/src/os/aproj/kshell/kshell.c:171
		    {
		      bsquote = 1;
 31003b3:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 31003ba:	e9 8f 00 00 00       	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:173
		    }
		  else if (squote)
 31003bf:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31003c3:	74 26                	je     31003eb <buildargv+0x138>
/home/yogi/src/os/aproj/kshell/kshell.c:175
		    {
		      if (*input == '\'')
 31003c5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003c8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003cb:	3c 27                	cmp    al,0x27
 31003cd:	75 09                	jne    31003d8 <buildargv+0x125>
/home/yogi/src/os/aproj/kshell/kshell.c:177
			{
			  squote = 0;
 31003cf:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 31003d6:	eb 76                	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:181
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
/home/yogi/src/os/aproj/kshell/kshell.c:184
			}
		    }
		  else if (dquote)
 31003eb:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31003ef:	74 26                	je     3100417 <buildargv+0x164>
/home/yogi/src/os/aproj/kshell/kshell.c:186
		    {
		      if (*input == '"')
 31003f1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003f4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003f7:	3c 22                	cmp    al,0x22
 31003f9:	75 09                	jne    3100404 <buildargv+0x151>
/home/yogi/src/os/aproj/kshell/kshell.c:188
			{
			  dquote = 0;
 31003fb:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 3100402:	eb 4a                	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:192
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
/home/yogi/src/os/aproj/kshell/kshell.c:197
			}
		    }
		  else
		    {
		      if (*input == '\'')
 3100417:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310041a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310041d:	3c 27                	cmp    al,0x27
 310041f:	75 09                	jne    310042a <buildargv+0x177>
/home/yogi/src/os/aproj/kshell/kshell.c:199
			{
			  squote = 1;
 3100421:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 3100428:	eb 24                	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:201
			}
		      else if (*input == '"')
 310042a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310042d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100430:	3c 22                	cmp    al,0x22
 3100432:	75 09                	jne    310043d <buildargv+0x18a>
/home/yogi/src/os/aproj/kshell/kshell.c:203
			{
			  dquote = 1;
 3100434:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 310043b:	eb 11                	jmp    310044e <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:207
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
/home/yogi/src/os/aproj/kshell/kshell.c:211
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 310044e:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:156
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
/home/yogi/src/os/aproj/kshell/kshell.c:214
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 3100460:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100463:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:216
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100466:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100469:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310046c:	84 c0                	test   al,al
 310046e:	0f 84 9e 00 00 00    	je     3100512 <buildargv+0x25f>
/home/yogi/src/os/aproj/kshell/kshell.c:218
          {
            char* temp=malloc(strlen(copybuf)+1);
 3100474:	83 ec 0c             	sub    esp,0xc
 3100477:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310047a:	e8 f1 07 00 00       	call   3100c70 <kShell+0x311>
 310047f:	83 c4 10             	add    esp,0x10
 3100482:	83 c0 01             	add    eax,0x1
 3100485:	83 ec 0c             	sub    esp,0xc
 3100488:	50                   	push   eax
 3100489:	e8 52 07 00 00       	call   3100be0 <kShell+0x281>
 310048e:	83 c4 10             	add    esp,0x10
 3100491:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/kshell.c:221
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 3100494:	83 ec 08             	sub    esp,0x8
 3100497:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310049a:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 310049d:	e8 ee 06 00 00       	call   3100b90 <kShell+0x231>
 31004a2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:222
            free(copybuf);
 31004a5:	83 ec 0c             	sub    esp,0xc
 31004a8:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31004ab:	e8 d0 07 00 00       	call   3100c80 <kShell+0x321>
 31004b0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:223
            copybuf = (char *) malloc (strlen (input) + 1);
 31004b3:	83 ec 0c             	sub    esp,0xc
 31004b6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31004b9:	e8 b2 07 00 00       	call   3100c70 <kShell+0x311>
 31004be:	83 c4 10             	add    esp,0x10
 31004c1:	83 c0 01             	add    eax,0x1
 31004c4:	83 ec 0c             	sub    esp,0xc
 31004c7:	50                   	push   eax
 31004c8:	e8 13 07 00 00       	call   3100be0 <kShell+0x281>
 31004cd:	83 c4 10             	add    esp,0x10
 31004d0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:224
            argv[argc] = temp;
 31004d3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31004d6:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31004dd:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31004e0:	01 c2                	add    edx,eax
 31004e2:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 31004e5:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/kshell.c:226
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 31004e7:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:227
            argv[argc] = NULL;
 31004eb:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31004ee:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31004f5:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31004f8:	01 d0                	add    eax,edx
 31004fa:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:228
            input++;
 3100500:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:229
            free(temp);
 3100504:	83 ec 0c             	sub    esp,0xc
 3100507:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 310050a:	e8 71 07 00 00       	call   3100c80 <kShell+0x321>
 310050f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:232
          }
	}
      while (*input != EOS);
 3100512:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100515:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100518:	84 c0                	test   al,al
 310051a:	0f 85 ed fd ff ff    	jne    310030d <buildargv+0x5a>
/home/yogi/src/os/aproj/kshell/kshell.c:235
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 3100520:	83 ec 0c             	sub    esp,0xc
 3100523:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100526:	e8 55 07 00 00       	call   3100c80 <kShell+0x321>
 310052b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:236
  free(nargv);
 310052e:	83 ec 0c             	sub    esp,0xc
 3100531:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100534:	e8 47 07 00 00       	call   3100c80 <kShell+0x321>
 3100539:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:237
  return (argv);
 310053c:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/kshell/kshell.c:238
}
 310053f:	c9                   	leave  
 3100540:	c3                   	ret    

03100541 <helpMe>:
helpMe():
/home/yogi/src/os/aproj/kshell/kshell.c:241

void helpMe(char *cmdline)
{
 3100541:	55                   	push   ebp
 3100542:	89 e5                	mov    ebp,esp
 3100544:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/kshell.c:244
    char* tok;
    
    tok=strtok(cmdline,delim);
 3100547:	83 ec 08             	sub    esp,0x8
 310054a:	68 10 13 10 03       	push   0x3101310
 310054f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100552:	e8 e9 06 00 00       	call   3100c40 <kShell+0x2e1>
 3100557:	83 c4 10             	add    esp,0x10
 310055a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:251
    {
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
 310055d:	83 ec 08             	sub    esp,0x8
 3100560:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100563:	68 30 0d 10 03       	push   0x3100d30
 3100568:	e8 43 06 00 00       	call   3100bb0 <kShell+0x251>
 310056d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:252
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100570:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100577:	e9 86 00 00 00       	jmp    3100602 <helpMe+0xc1>
/home/yogi/src/os/aproj/kshell/kshell.c:253
        if (tok!=NULL)
 310057c:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100580:	74 50                	je     31005d2 <helpMe+0x91>
/home/yogi/src/os/aproj/kshell/kshell.c:255
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
 3100582:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100585:	c1 e0 04             	shl    eax,0x4
 3100588:	05 c0 12 10 03       	add    eax,0x31012c0
 310058d:	8b 00                	mov    eax,DWORD PTR [eax]
 310058f:	83 ec 04             	sub    esp,0x4
 3100592:	6a 64                	push   0x64
 3100594:	50                   	push   eax
 3100595:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100598:	e8 93 06 00 00       	call   3100c30 <kShell+0x2d1>
 310059d:	83 c4 10             	add    esp,0x10
 31005a0:	85 c0                	test   eax,eax
 31005a2:	75 5a                	jne    31005fe <helpMe+0xbd>
/home/yogi/src/os/aproj/kshell/kshell.c:256
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 31005a4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005a7:	c1 e0 04             	shl    eax,0x4
 31005aa:	05 c4 12 10 03       	add    eax,0x31012c4
 31005af:	8b 10                	mov    edx,DWORD PTR [eax]
 31005b1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005b4:	c1 e0 04             	shl    eax,0x4
 31005b7:	05 c0 12 10 03       	add    eax,0x31012c0
 31005bc:	8b 00                	mov    eax,DWORD PTR [eax]
 31005be:	83 ec 04             	sub    esp,0x4
 31005c1:	52                   	push   edx
 31005c2:	50                   	push   eax
 31005c3:	68 3a 0d 10 03       	push   0x3100d3a
 31005c8:	e8 e3 05 00 00       	call   3100bb0 <kShell+0x251>
 31005cd:	83 c4 10             	add    esp,0x10
 31005d0:	eb 2c                	jmp    31005fe <helpMe+0xbd>
/home/yogi/src/os/aproj/kshell/kshell.c:259
        }
        else
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 31005d2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005d5:	c1 e0 04             	shl    eax,0x4
 31005d8:	05 c4 12 10 03       	add    eax,0x31012c4
 31005dd:	8b 10                	mov    edx,DWORD PTR [eax]
 31005df:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005e2:	c1 e0 04             	shl    eax,0x4
 31005e5:	05 c0 12 10 03       	add    eax,0x31012c0
 31005ea:	8b 00                	mov    eax,DWORD PTR [eax]
 31005ec:	83 ec 04             	sub    esp,0x4
 31005ef:	52                   	push   edx
 31005f0:	50                   	push   eax
 31005f1:	68 3a 0d 10 03       	push   0x3100d3a
 31005f6:	e8 b5 05 00 00       	call   3100bb0 <kShell+0x251>
 31005fb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:252 (discriminator 2)
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 31005fe:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:252 (discriminator 1)
 3100602:	83 7d f4 04          	cmp    DWORD PTR [ebp-0xc],0x4
 3100606:	0f 86 70 ff ff ff    	jbe    310057c <helpMe+0x3b>
/home/yogi/src/os/aproj/kshell/kshell.c:261
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
        else
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        
}
 310060c:	90                   	nop
 310060d:	c9                   	leave  
 310060e:	c3                   	ret    

0310060f <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/aproj/kshell/kshell.c:264

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH])
{
 310060f:	55                   	push   ebp
 3100610:	89 e5                	mov    ebp,esp
 3100612:	53                   	push   ebx
 3100613:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/kshell.c:265
    char** pptr=malloc(sizeof(char*)*pcount);
 3100616:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100619:	c1 e0 02             	shl    eax,0x2
 310061c:	83 ec 0c             	sub    esp,0xc
 310061f:	50                   	push   eax
 3100620:	e8 bb 05 00 00       	call   3100be0 <kShell+0x281>
 3100625:	83 c4 10             	add    esp,0x10
 3100628:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:267
    
    for (int cnt=0;cnt<pcount;cnt++)
 310062b:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100632:	eb 4e                	jmp    3100682 <paramsToArgv+0x73>
/home/yogi/src/os/aproj/kshell/kshell.c:269 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 3100634:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100637:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 310063e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100641:	8d 1c 02             	lea    ebx,[edx+eax*1]
 3100644:	83 ec 0c             	sub    esp,0xc
 3100647:	6a 32                	push   0x32
 3100649:	e8 92 05 00 00       	call   3100be0 <kShell+0x281>
 310064e:	83 c4 10             	add    esp,0x10
 3100651:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/aproj/kshell/kshell.c:270 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 3100653:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100656:	6b d0 32             	imul   edx,eax,0x32
 3100659:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310065c:	01 c2                	add    edx,eax
 310065e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100661:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 3100668:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310066b:	01 c8                	add    eax,ecx
 310066d:	8b 00                	mov    eax,DWORD PTR [eax]
 310066f:	83 ec 04             	sub    esp,0x4
 3100672:	6a 32                	push   0x32
 3100674:	52                   	push   edx
 3100675:	50                   	push   eax
 3100676:	e8 55 05 00 00       	call   3100bd0 <kShell+0x271>
 310067b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:267 (discriminator 3)

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH])
{
    char** pptr=malloc(sizeof(char*)*pcount);
    
    for (int cnt=0;cnt<pcount;cnt++)
 310067e:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:267 (discriminator 1)
 3100682:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100685:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 3100688:	7c aa                	jl     3100634 <paramsToArgv+0x25>
/home/yogi/src/os/aproj/kshell/kshell.c:272
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
 310068a:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
/home/yogi/src/os/aproj/kshell/kshell.c:273
}
 310068d:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100690:	c9                   	leave  
 3100691:	c3                   	ret    

03100692 <freeArgV>:
freeArgV():
/home/yogi/src/os/aproj/kshell/kshell.c:276

void freeArgV(int pcount, char **params)
{
 3100692:	55                   	push   ebp
 3100693:	89 e5                	mov    ebp,esp
 3100695:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/kshell.c:277
    for (int cnt=0;cnt<pcount;cnt++)
 3100698:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310069f:	eb 15                	jmp    31006b6 <freeArgV+0x24>
/home/yogi/src/os/aproj/kshell/kshell.c:278 (discriminator 3)
        free(*params);
 31006a1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31006a4:	8b 00                	mov    eax,DWORD PTR [eax]
 31006a6:	83 ec 0c             	sub    esp,0xc
 31006a9:	50                   	push   eax
 31006aa:	e8 d1 05 00 00       	call   3100c80 <kShell+0x321>
 31006af:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:277 (discriminator 3)
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 31006b2:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:277 (discriminator 1)
 31006b6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31006b9:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 31006bc:	7c e3                	jl     31006a1 <freeArgV+0xf>
/home/yogi/src/os/aproj/kshell/kshell.c:279
        free(*params);
    free(params);
 31006be:	83 ec 0c             	sub    esp,0xc
 31006c1:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31006c4:	e8 b7 05 00 00       	call   3100c80 <kShell+0x321>
 31006c9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:280
}
 31006cc:	90                   	nop
 31006cd:	c9                   	leave  
 31006ce:	c3                   	ret    

031006cf <execp>:
execp():
/home/yogi/src/os/aproj/kshell/kshell.c:283

void execp(char* cmdline)
{
 31006cf:	55                   	push   ebp
 31006d0:	89 e5                	mov    ebp,esp
 31006d2:	81 ec 28 02 00 00    	sub    esp,0x228
/home/yogi/src/os/aproj/kshell/kshell.c:284
    bool background=false;
 31006d8:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:285
    uint32_t pid=0;
 31006dc:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:287
    char* tok;
    char* pgm=NULL;
 31006e3:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:290

    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 31006ea:	83 ec 04             	sub    esp,0x4
 31006ed:	68 f4 01 00 00       	push   0x1f4
 31006f2:	8d 85 e4 fd ff ff    	lea    eax,[ebp-0x21c]
 31006f8:	50                   	push   eax
 31006f9:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31006fc:	e8 aa f9 ff ff       	call   31000ab <parseParamsShell>
 3100701:	83 c4 10             	add    esp,0x10
 3100704:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/aproj/kshell/kshell.c:291
    int execParamCount=0;
 3100707:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:292
    int pcount=1;
 310070e:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:294
    
    tok=strtok(cmdline,delim);
 3100715:	83 ec 08             	sub    esp,0x8
 3100718:	68 10 13 10 03       	push   0x3101310
 310071d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100720:	e8 1b 05 00 00       	call   3100c40 <kShell+0x2e1>
 3100725:	83 c4 10             	add    esp,0x10
 3100728:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:295
    while (tok!=NULL)
 310072b:	eb 73                	jmp    31007a0 <execp+0xd1>
/home/yogi/src/os/aproj/kshell/kshell.c:297
    {
        if (strncmp(tok,"b",2)==0)
 310072d:	83 ec 04             	sub    esp,0x4
 3100730:	6a 02                	push   0x2
 3100732:	68 43 0d 10 03       	push   0x3100d43
 3100737:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310073a:	e8 f1 04 00 00       	call   3100c30 <kShell+0x2d1>
 310073f:	83 c4 10             	add    esp,0x10
 3100742:	85 c0                	test   eax,eax
 3100744:	75 0a                	jne    3100750 <execp+0x81>
/home/yogi/src/os/aproj/kshell/kshell.c:299
        {
            background=true;
 3100746:	c6 45 f7 01          	mov    BYTE PTR [ebp-0x9],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:300
            execParamCount++;
 310074a:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
 310074e:	eb 37                	jmp    3100787 <execp+0xb8>
/home/yogi/src/os/aproj/kshell/kshell.c:302
        }
        else if (pgm==NULL)
 3100750:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100754:	75 31                	jne    3100787 <execp+0xb8>
/home/yogi/src/os/aproj/kshell/kshell.c:304
        {
            pgm=malloc(strlen(tok)+1);  //NOTE: +1 is for the terminating \0
 3100756:	83 ec 0c             	sub    esp,0xc
 3100759:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310075c:	e8 0f 05 00 00       	call   3100c70 <kShell+0x311>
 3100761:	83 c4 10             	add    esp,0x10
 3100764:	83 c0 01             	add    eax,0x1
 3100767:	83 ec 0c             	sub    esp,0xc
 310076a:	50                   	push   eax
 310076b:	e8 70 04 00 00       	call   3100be0 <kShell+0x281>
 3100770:	83 c4 10             	add    esp,0x10
 3100773:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/kshell.c:305
            strcpy(pgm,tok);
 3100776:	83 ec 08             	sub    esp,0x8
 3100779:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310077c:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310077f:	e8 0c 04 00 00       	call   3100b90 <kShell+0x231>
 3100784:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:307
        }
        pcount++;
 3100787:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:308
        tok=strtok(0,delim);
 310078b:	83 ec 08             	sub    esp,0x8
 310078e:	68 10 13 10 03       	push   0x3101310
 3100793:	6a 00                	push   0x0
 3100795:	e8 a6 04 00 00       	call   3100c40 <kShell+0x2e1>
 310079a:	83 c4 10             	add    esp,0x10
 310079d:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:295
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    int execParamCount=0;
    int pcount=1;
    
    tok=strtok(cmdline,delim);
    while (tok!=NULL)
 31007a0:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31007a4:	75 87                	jne    310072d <execp+0x5e>
/home/yogi/src/os/aproj/kshell/kshell.c:311
        }
        pcount++;
        tok=strtok(0,delim);
    }
    
    char** prms=paramsToArgv(paramCount-execParamCount,&params[execParamCount][0]);
 31007a6:	8d 95 e4 fd ff ff    	lea    edx,[ebp-0x21c]
 31007ac:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
 31007af:	6b c0 32             	imul   eax,eax,0x32
 31007b2:	01 c2                	add    edx,eax
 31007b4:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31007b7:	2b 45 e8             	sub    eax,DWORD PTR [ebp-0x18]
 31007ba:	83 ec 08             	sub    esp,0x8
 31007bd:	52                   	push   edx
 31007be:	50                   	push   eax
 31007bf:	e8 4b fe ff ff       	call   310060f <paramsToArgv>
 31007c4:	83 c4 10             	add    esp,0x10
 31007c7:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/kshell.c:313

    print ("Executing %s\n",pgm);
 31007ca:	83 ec 08             	sub    esp,0x8
 31007cd:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 31007d0:	68 45 0d 10 03       	push   0x3100d45
 31007d5:	e8 d6 03 00 00       	call   3100bb0 <kShell+0x251>
 31007da:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:314
    pid=exec(pgm,paramCount-execParamCount,prms);
 31007dd:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31007e0:	2b 45 e8             	sub    eax,DWORD PTR [ebp-0x18]
 31007e3:	83 ec 04             	sub    esp,0x4
 31007e6:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 31007e9:	50                   	push   eax
 31007ea:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 31007ed:	e8 2e 04 00 00       	call   3100c20 <kShell+0x2c1>
 31007f2:	83 c4 10             	add    esp,0x10
 31007f5:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/kshell/kshell.c:315
    if (pid>0)
 31007f8:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 31007fc:	74 1b                	je     3100819 <execp+0x14a>
/home/yogi/src/os/aproj/kshell/kshell.c:317
    {
        if (!background)
 31007fe:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 3100802:	83 f0 01             	xor    eax,0x1
 3100805:	84 c0                	test   al,al
 3100807:	74 23                	je     310082c <execp+0x15d>
/home/yogi/src/os/aproj/kshell/kshell.c:320
        {
            //print("DEBUG1: waitpid = %08X\n",&waitpid);
            waitpid(pid);
 3100809:	83 ec 0c             	sub    esp,0xc
 310080c:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 310080f:	e8 8c 03 00 00       	call   3100ba0 <kShell+0x241>
 3100814:	83 c4 10             	add    esp,0x10
 3100817:	eb 13                	jmp    310082c <execp+0x15d>
/home/yogi/src/os/aproj/kshell/kshell.c:324
        }
    }
    else
        print("Error executing %s\n",pgm);
 3100819:	83 ec 08             	sub    esp,0x8
 310081c:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310081f:	68 53 0d 10 03       	push   0x3100d53
 3100824:	e8 87 03 00 00       	call   3100bb0 <kShell+0x251>
 3100829:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:326
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    freeArgV(paramCount-1, (char**)prms);       
 310082c:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 310082f:	83 e8 01             	sub    eax,0x1
 3100832:	83 ec 08             	sub    esp,0x8
 3100835:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 3100838:	50                   	push   eax
 3100839:	e8 54 fe ff ff       	call   3100692 <freeArgV>
 310083e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:327
    free(pgm);
 3100841:	83 ec 0c             	sub    esp,0xc
 3100844:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100847:	e8 34 04 00 00       	call   3100c80 <kShell+0x321>
 310084c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:328
}
 310084f:	90                   	nop
 3100850:	c9                   	leave  
 3100851:	c3                   	ret    

03100852 <kSleep>:
kSleep():
/home/yogi/src/os/aproj/kshell/kshell.c:331

void kSleep(char *cmdline)
{
 3100852:	55                   	push   ebp
 3100853:	89 e5                	mov    ebp,esp
 3100855:	81 ec 08 02 00 00    	sub    esp,0x208
/home/yogi/src/os/aproj/kshell/kshell.c:333
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 310085b:	83 ec 04             	sub    esp,0x4
 310085e:	68 f4 01 00 00       	push   0x1f4
 3100863:	8d 85 00 fe ff ff    	lea    eax,[ebp-0x200]
 3100869:	50                   	push   eax
 310086a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310086d:	e8 39 f8 ff ff       	call   31000ab <parseParamsShell>
 3100872:	83 c4 10             	add    esp,0x10
 3100875:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/kshell.c:335

    if (params[0][0]==0)
 3100878:	0f b6 85 00 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x200]
 310087f:	84 c0                	test   al,al
 3100881:	75 12                	jne    3100895 <kSleep+0x43>
/home/yogi/src/os/aproj/kshell/kshell.c:337
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 3100883:	83 ec 0c             	sub    esp,0xc
 3100886:	68 68 0d 10 03       	push   0x3100d68
 310088b:	e8 20 03 00 00       	call   3100bb0 <kShell+0x251>
 3100890:	83 c4 10             	add    esp,0x10
 3100893:	eb 22                	jmp    31008b7 <kSleep+0x65>
/home/yogi/src/os/aproj/kshell/kshell.c:341
        return;
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 3100895:	83 ec 04             	sub    esp,0x4
 3100898:	6a 0a                	push   0xa
 310089a:	6a 00                	push   0x0
 310089c:	8d 85 00 fe ff ff    	lea    eax,[ebp-0x200]
 31008a2:	50                   	push   eax
 31008a3:	e8 58 03 00 00       	call   3100c00 <kShell+0x2a1>
 31008a8:	83 c4 10             	add    esp,0x10
 31008ab:	83 ec 0c             	sub    esp,0xc
 31008ae:	50                   	push   eax
 31008af:	e8 3c 03 00 00       	call   3100bf0 <kShell+0x291>
 31008b4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:342
}
 31008b7:	c9                   	leave  
 31008b8:	c3                   	ret    

031008b9 <kExit>:
kExit():
/home/yogi/src/os/aproj/kshell/kshell.c:345

void kExit(char *cmdline)
{
 31008b9:	55                   	push   ebp
 31008ba:	89 e5                	mov    ebp,esp
 31008bc:	81 ec 08 02 00 00    	sub    esp,0x208
/home/yogi/src/os/aproj/kshell/kshell.c:348
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 31008c2:	83 ec 04             	sub    esp,0x4
 31008c5:	68 f4 01 00 00       	push   0x1f4
 31008ca:	8d 85 04 fe ff ff    	lea    eax,[ebp-0x1fc]
 31008d0:	50                   	push   eax
 31008d1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31008d4:	e8 d2 f7 ff ff       	call   31000ab <parseParamsShell>
 31008d9:	83 c4 10             	add    esp,0x10
 31008dc:	85 c0                	test   eax,eax
 31008de:	74 1d                	je     31008fd <kExit+0x44>
/home/yogi/src/os/aproj/kshell/kshell.c:350
    {
        exitCode = strtoul(params[0],0,10);
 31008e0:	83 ec 04             	sub    esp,0x4
 31008e3:	6a 0a                	push   0xa
 31008e5:	6a 00                	push   0x0
 31008e7:	8d 85 04 fe ff ff    	lea    eax,[ebp-0x1fc]
 31008ed:	50                   	push   eax
 31008ee:	e8 0d 03 00 00       	call   3100c00 <kShell+0x2a1>
 31008f3:	83 c4 10             	add    esp,0x10
 31008f6:	a3 04 14 10 03       	mov    ds:0x3101404,eax
 31008fb:	eb 0a                	jmp    3100907 <kExit+0x4e>
/home/yogi/src/os/aproj/kshell/kshell.c:353
    }
    else
        exitCode = 0;
 31008fd:	c7 05 04 14 10 03 00 	mov    DWORD PTR ds:0x3101404,0x0
 3100904:	00 00 00 
/home/yogi/src/os/aproj/kshell/kshell.c:354
    timeToExit=true;
 3100907:	c6 05 00 14 10 03 01 	mov    BYTE PTR ds:0x3101400,0x1
/home/yogi/src/os/aproj/kshell/kshell.c:355
}
 310090e:	90                   	nop
 310090f:	c9                   	leave  
 3100910:	c3                   	ret    

03100911 <pwd>:
pwd():
/home/yogi/src/os/aproj/kshell/kshell.c:358

void pwd()
{
 3100911:	55                   	push   ebp
 3100912:	89 e5                	mov    ebp,esp
 3100914:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/kshell.c:359
    char* buf=malloc(512);
 3100917:	83 ec 0c             	sub    esp,0xc
 310091a:	68 00 02 00 00       	push   0x200
 310091f:	e8 bc 02 00 00       	call   3100be0 <kShell+0x281>
 3100924:	83 c4 10             	add    esp,0x10
 3100927:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/kshell.c:360
    print("%s\n",getcwd(buf,512));
 310092a:	83 ec 08             	sub    esp,0x8
 310092d:	68 00 02 00 00       	push   0x200
 3100932:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100935:	e8 26 03 00 00       	call   3100c60 <kShell+0x301>
 310093a:	83 c4 10             	add    esp,0x10
 310093d:	83 ec 08             	sub    esp,0x8
 3100940:	50                   	push   eax
 3100941:	68 a6 0d 10 03       	push   0x3100da6
 3100946:	e8 65 02 00 00       	call   3100bb0 <kShell+0x251>
 310094b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:361
    free(buf);
 310094e:	83 ec 0c             	sub    esp,0xc
 3100951:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100954:	e8 27 03 00 00       	call   3100c80 <kShell+0x321>
 3100959:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:362
}
 310095c:	90                   	nop
 310095d:	c9                   	leave  
 310095e:	c3                   	ret    

0310095f <kShell>:
kShell():
/home/yogi/src/os/aproj/kshell/kshell.c:365

int kShell(int argc, char** argv)
{
 310095f:	55                   	push   ebp
 3100960:	89 e5                	mov    ebp,esp
 3100962:	81 ec f8 0a 00 00    	sub    esp,0xaf8
/home/yogi/src/os/aproj/kshell/kshell.c:367
    char lCommand[256];
    uint8_t lCurrKey=0;
 3100968:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:368
    int lCurrKeyCount=0;
 310096f:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:370
    char commands[50][50];
    int commandsPtr=0;
 3100976:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:371
    int commandBuffPtr=0;
 310097d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:372
    int commandWasFromThisBufferPtr=0;
 3100984:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:375
    char ansiSeq[20];

    libc_init();
 310098b:	e8 80 02 00 00       	call   3100c10 <kShell+0x2b1>
/home/yogi/src/os/aproj/kshell/kshell.c:376
    ansiSeq[0]=0x1b;
 3100990:	c6 85 0b f5 ff ff 1b 	mov    BYTE PTR [ebp-0xaf5],0x1b
/home/yogi/src/os/aproj/kshell/kshell.c:377
    sKShellProgramName=malloc(1024);
 3100997:	83 ec 0c             	sub    esp,0xc
 310099a:	68 00 04 00 00       	push   0x400
 310099f:	e8 3c 02 00 00       	call   3100be0 <kShell+0x281>
 31009a4:	83 c4 10             	add    esp,0x10
 31009a7:	a3 34 16 10 03       	mov    ds:0x3101634,eax
/home/yogi/src/os/aproj/kshell/kshell.c:378
    strcpy(sKShellProgramName,"kShell");
 31009ac:	a1 34 16 10 03       	mov    eax,ds:0x3101634
 31009b1:	83 ec 08             	sub    esp,0x8
 31009b4:	68 aa 0d 10 03       	push   0x3100daa
 31009b9:	50                   	push   eax
 31009ba:	e8 d1 01 00 00       	call   3100b90 <kShell+0x231>
 31009bf:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:379
    strcpy(sExecutingProgram,sKShellProgramName);
 31009c2:	a1 34 16 10 03       	mov    eax,ds:0x3101634
 31009c7:	83 ec 08             	sub    esp,0x8
 31009ca:	50                   	push   eax
 31009cb:	68 20 14 10 03       	push   0x3101420
 31009d0:	e8 bb 01 00 00       	call   3100b90 <kShell+0x231>
 31009d5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:382
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 31009d8:	e9 78 01 00 00       	jmp    3100b55 <kShell+0x1f6>
/home/yogi/src/os/aproj/kshell/kshell.c:385
    {
getACommand:
        lCurrKey=0;
 31009dd:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:386
        lCurrKeyCount=0;
 31009e4:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:387
        memset(lCommand,0,256);
 31009eb:	83 ec 04             	sub    esp,0x4
 31009ee:	68 00 01 00 00       	push   0x100
 31009f3:	6a 00                	push   0x0
 31009f5:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 31009fb:	50                   	push   eax
 31009fc:	e8 4f 02 00 00       	call   3100c50 <kShell+0x2f1>
 3100a01:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:388
        print("%s> ",sExecutingProgram);
 3100a04:	83 ec 08             	sub    esp,0x8
 3100a07:	68 20 14 10 03       	push   0x3101420
 3100a0c:	68 b1 0d 10 03       	push   0x3100db1
 3100a11:	e8 9a 01 00 00       	call   3100bb0 <kShell+0x251>
 3100a16:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:390
getAKey:
        lCurrKey=0;
 3100a19:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:391
        while(lCurrKey==0)
 3100a20:	eb 16                	jmp    3100a38 <kShell+0xd9>
/home/yogi/src/os/aproj/kshell/kshell.c:393
        {
            gets(&lCurrKey,1,1);
 3100a22:	83 ec 04             	sub    esp,0x4
 3100a25:	6a 01                	push   0x1
 3100a27:	6a 01                	push   0x1
 3100a29:	8d 85 e3 fe ff ff    	lea    eax,[ebp-0x11d]
 3100a2f:	50                   	push   eax
 3100a30:	e8 8b 01 00 00       	call   3100bc0 <kShell+0x261>
 3100a35:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:391
        lCurrKeyCount=0;
        memset(lCommand,0,256);
        print("%s> ",sExecutingProgram);
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 3100a38:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100a3f:	84 c0                	test   al,al
 3100a41:	74 df                	je     3100a22 <kShell+0xc3>
/home/yogi/src/os/aproj/kshell/kshell.c:396
        {
            gets(&lCurrKey,1,1);
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 3100a43:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100a4a:	3c c8                	cmp    al,0xc8
 3100a4c:	75 06                	jne    3100a54 <kShell+0xf5>
/home/yogi/src/os/aproj/kshell/kshell.c:398
        {
            if (commandBuffPtr>=0)
 3100a4e:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100a52:	eb c5                	jmp    3100a19 <kShell+0xba>
/home/yogi/src/os/aproj/kshell/kshell.c:413
                goto getAKey;*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
 3100a54:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100a5b:	3c d0                	cmp    al,0xd0
 3100a5d:	75 08                	jne    3100a67 <kShell+0x108>
/home/yogi/src/os/aproj/kshell/kshell.c:415
        {
            if (commandBuffPtr<=commandsPtr)
 3100a5f:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 3100a62:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 3100a65:	eb b2                	jmp    3100a19 <kShell+0xba>
/home/yogi/src/os/aproj/kshell/kshell.c:431
            }
            else
                goto getAKey;
            
        }   
        else if (lCurrKey==0xcb) //left
 3100a67:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100a6e:	3c cb                	cmp    al,0xcb
 3100a70:	75 1c                	jne    3100a8e <kShell+0x12f>
/home/yogi/src/os/aproj/kshell/kshell.c:433
        {
            if (lCurrKeyCount>0)
 3100a72:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100a76:	7e a1                	jle    3100a19 <kShell+0xba>
/home/yogi/src/os/aproj/kshell/kshell.c:435
            {
                print("\033[1D");
 3100a78:	83 ec 0c             	sub    esp,0xc
 3100a7b:	68 b6 0d 10 03       	push   0x3100db6
 3100a80:	e8 2b 01 00 00       	call   3100bb0 <kShell+0x251>
 3100a85:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:436
                lCurrKeyCount--;
 3100a88:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:439
            }
             
            goto getAKey;
 3100a8c:	eb 8b                	jmp    3100a19 <kShell+0xba>
/home/yogi/src/os/aproj/kshell/kshell.c:441
        }
        else if (lCurrKey==0xcd) //right
 3100a8e:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100a95:	3c cd                	cmp    al,0xcd
 3100a97:	74 80                	je     3100a19 <kShell+0xba>
/home/yogi/src/os/aproj/kshell/kshell.c:444
        {
        }
        else if (lCurrKey=='\b') //backspace
 3100a99:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100aa0:	3c 08                	cmp    al,0x8
 3100aa2:	75 1b                	jne    3100abf <kShell+0x160>
/home/yogi/src/os/aproj/kshell/kshell.c:446
        {
            lCurrKeyCount--;
 3100aa4:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:447
            lCommand[lCurrKeyCount]='\0';
 3100aa8:	8d 95 e4 fe ff ff    	lea    edx,[ebp-0x11c]
 3100aae:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100ab1:	01 d0                	add    eax,edx
 3100ab3:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:448
            if (lCurrKeyCount>0)
 3100ab6:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100aba:	e9 5a ff ff ff       	jmp    3100a19 <kShell+0xba>
/home/yogi/src/os/aproj/kshell/kshell.c:460
                cursorMoveTo(cursorGetPosX()-1,lTemp);*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa) //Enter
 3100abf:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100ac6:	3c 0a                	cmp    al,0xa
 3100ac8:	74 1c                	je     3100ae6 <kShell+0x187>
/home/yogi/src/os/aproj/kshell/kshell.c:466
        {
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3100aca:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100acd:	8d 50 01             	lea    edx,[eax+0x1]
 3100ad0:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100ad3:	0f b6 95 e3 fe ff ff 	movzx  edx,BYTE PTR [ebp-0x11d]
 3100ada:	88 94 05 e4 fe ff ff 	mov    BYTE PTR [ebp+eax*1-0x11c],dl
/home/yogi/src/os/aproj/kshell/kshell.c:468
        }
        goto getAKey;
 3100ae1:	e9 33 ff ff ff       	jmp    3100a19 <kShell+0xba>
/home/yogi/src/os/aproj/kshell/kshell.c:462
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa) //Enter
        {
            goto doneGettingKeys;
 3100ae6:	90                   	nop
/home/yogi/src/os/aproj/kshell/kshell.c:471
            lCommand[lCurrKeyCount++]=lCurrKey;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 3100ae7:	0f b6 85 e4 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11c]
 3100aee:	84 c0                	test   al,al
 3100af0:	75 05                	jne    3100af7 <kShell+0x198>
/home/yogi/src/os/aproj/kshell/kshell.c:472
            goto getACommand;
 3100af2:	e9 e6 fe ff ff       	jmp    31009dd <kShell+0x7e>
/home/yogi/src/os/aproj/kshell/kshell.c:473
        int i = findCommand(lCommand);
 3100af7:	83 ec 0c             	sub    esp,0xc
 3100afa:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 3100b00:	50                   	push   eax
 3100b01:	e8 44 f7 ff ff       	call   310024a <findCommand>
 3100b06:	83 c4 10             	add    esp,0x10
 3100b09:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/aproj/kshell/kshell.c:475

        execInternalCommand(lCommand);
 3100b0c:	83 ec 0c             	sub    esp,0xc
 3100b0f:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 3100b15:	50                   	push   eax
 3100b16:	e8 e5 f4 ff ff       	call   3100000 <execInternalCommand>
 3100b1b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:476
        if(i>0)
 3100b1e:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100b22:	7e 31                	jle    3100b55 <kShell+0x1f6>
/home/yogi/src/os/aproj/kshell/kshell.c:478
        {
            i--;
 3100b24:	83 6d e4 01          	sub    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:487
//                for (int cnt=commandWasFromThisBufferPtr;cnt<=commandsPtr;cnt++)
//                    strcpy(commands[cnt],commands[cnt+1]);
//                commandWasFromThisBufferPtr=0;
//                commandsPtr--;
            }
            strcpy(commands[commandsPtr++],lCommand);
 3100b28:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100b2b:	8d 50 01             	lea    edx,[eax+0x1]
 3100b2e:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 3100b31:	8d 95 1f f5 ff ff    	lea    edx,[ebp-0xae1]
 3100b37:	6b c0 32             	imul   eax,eax,0x32
 3100b3a:	01 c2                	add    edx,eax
 3100b3c:	83 ec 08             	sub    esp,0x8
 3100b3f:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 3100b45:	50                   	push   eax
 3100b46:	52                   	push   edx
 3100b47:	e8 44 00 00 00       	call   3100b90 <kShell+0x231>
 3100b4c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:488
            commandBuffPtr=commandsPtr;
 3100b4f:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100b52:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/kshell.c:382
    sKShellProgramName=malloc(1024);
    strcpy(sKShellProgramName,"kShell");
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 3100b55:	0f b6 05 00 14 10 03 	movzx  eax,BYTE PTR ds:0x3101400
 3100b5c:	83 f0 01             	xor    eax,0x1
 3100b5f:	84 c0                	test   al,al
 3100b61:	0f 85 76 fe ff ff    	jne    31009dd <kShell+0x7e>
/home/yogi/src/os/aproj/kshell/kshell.c:491
            }
            strcpy(commands[commandsPtr++],lCommand);
            commandBuffPtr=commandsPtr;
        }
    }
    free(sKShellProgramName);
 3100b67:	a1 34 16 10 03       	mov    eax,ds:0x3101634
 3100b6c:	83 ec 0c             	sub    esp,0xc
 3100b6f:	50                   	push   eax
 3100b70:	e8 0b 01 00 00       	call   3100c80 <kShell+0x321>
 3100b75:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:492
    return exitCode;
 3100b78:	a1 04 14 10 03       	mov    eax,ds:0x3101404
/home/yogi/src/os/aproj/kshell/kshell.c:493
}
 3100b7d:	c9                   	leave  
 3100b7e:	c3                   	ret    

Disassembly of section .plt:

03100b80 <.plt>:
 3100b80:	ff 35 ac 13 10 03    	push   DWORD PTR ds:0x31013ac
 3100b86:	ff 25 b0 13 10 03    	jmp    DWORD PTR ds:0x31013b0
 3100b8c:	00 00                	add    BYTE PTR [eax],al
 3100b8e:	00 00                	add    BYTE PTR [eax],al
 3100b90:	ff 25 b4 13 10 03    	jmp    DWORD PTR ds:0x31013b4
 3100b96:	68 00 00 00 00       	push   0x0
 3100b9b:	e9 e0 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100ba0:	ff 25 b8 13 10 03    	jmp    DWORD PTR ds:0x31013b8
 3100ba6:	68 08 00 00 00       	push   0x8
 3100bab:	e9 d0 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100bb0:	ff 25 bc 13 10 03    	jmp    DWORD PTR ds:0x31013bc
 3100bb6:	68 10 00 00 00       	push   0x10
 3100bbb:	e9 c0 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100bc0:	ff 25 c0 13 10 03    	jmp    DWORD PTR ds:0x31013c0
 3100bc6:	68 18 00 00 00       	push   0x18
 3100bcb:	e9 b0 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100bd0:	ff 25 c4 13 10 03    	jmp    DWORD PTR ds:0x31013c4
 3100bd6:	68 20 00 00 00       	push   0x20
 3100bdb:	e9 a0 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100be0:	ff 25 c8 13 10 03    	jmp    DWORD PTR ds:0x31013c8
 3100be6:	68 28 00 00 00       	push   0x28
 3100beb:	e9 90 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100bf0:	ff 25 cc 13 10 03    	jmp    DWORD PTR ds:0x31013cc
 3100bf6:	68 30 00 00 00       	push   0x30
 3100bfb:	e9 80 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100c00:	ff 25 d0 13 10 03    	jmp    DWORD PTR ds:0x31013d0
 3100c06:	68 38 00 00 00       	push   0x38
 3100c0b:	e9 70 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100c10:	ff 25 d4 13 10 03    	jmp    DWORD PTR ds:0x31013d4
 3100c16:	68 40 00 00 00       	push   0x40
 3100c1b:	e9 60 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100c20:	ff 25 d8 13 10 03    	jmp    DWORD PTR ds:0x31013d8
 3100c26:	68 48 00 00 00       	push   0x48
 3100c2b:	e9 50 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100c30:	ff 25 dc 13 10 03    	jmp    DWORD PTR ds:0x31013dc
 3100c36:	68 50 00 00 00       	push   0x50
 3100c3b:	e9 40 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100c40:	ff 25 e0 13 10 03    	jmp    DWORD PTR ds:0x31013e0
 3100c46:	68 58 00 00 00       	push   0x58
 3100c4b:	e9 30 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100c50:	ff 25 e4 13 10 03    	jmp    DWORD PTR ds:0x31013e4
 3100c56:	68 60 00 00 00       	push   0x60
 3100c5b:	e9 20 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100c60:	ff 25 e8 13 10 03    	jmp    DWORD PTR ds:0x31013e8
 3100c66:	68 68 00 00 00       	push   0x68
 3100c6b:	e9 10 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100c70:	ff 25 ec 13 10 03    	jmp    DWORD PTR ds:0x31013ec
 3100c76:	68 70 00 00 00       	push   0x70
 3100c7b:	e9 00 ff ff ff       	jmp    3100b80 <kShell+0x221>
 3100c80:	ff 25 f0 13 10 03    	jmp    DWORD PTR ds:0x31013f0
 3100c86:	68 78 00 00 00       	push   0x78
 3100c8b:	e9 f0 fe ff ff       	jmp    3100b80 <kShell+0x221>

Disassembly of section .rodata:

03100c90 <.rodata>:
 3100c90:	68 65 6c 70 00       	push   0x706c65
 3100c95:	47                   	inc    edi
 3100c96:	65                   	gs
 3100c97:	74 20                	je     3100cb9 <kShell+0x35a>
 3100c99:	68 65 6c 70 20       	push   0x20706c65
 3100c9e:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3100ca2:	73 20                	jae    3100cc4 <kShell+0x365>
 3100ca4:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3100cab:	74 69                	je     3100d16 <kShell+0x3b7>
 3100cad:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100cae:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100caf:	29 00                	sub    DWORD PTR [eax],eax
 3100cb1:	65                   	gs
 3100cb2:	78 65                	js     3100d19 <kShell+0x3ba>
 3100cb4:	63 00                	arpl   WORD PTR [eax],ax
 3100cb6:	45                   	inc    ebp
 3100cb7:	78 65                	js     3100d1e <kShell+0x3bf>
 3100cb9:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3100cbc:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3100cc0:	70 72                	jo     3100d34 <kShell+0x3d5>
 3100cc2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100cc3:	67 72 61             	addr16 jb 3100d27 <kShell+0x3c8>
 3100cc6:	6d                   	ins    DWORD PTR es:[edi],dx
 3100cc7:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3100cca:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 3100cd1:	20 
 3100cd2:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3100cd6:	6c                   	ins    BYTE PTR es:[edi],dx
 3100cd7:	6c                   	ins    BYTE PTR es:[edi],dx
 3100cd8:	00 70 77             	add    BYTE PTR [eax+0x77],dh
 3100cdb:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 3100cdf:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3100ce6:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3100cea:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 3100cee:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3100cf3:	79 00                	jns    3100cf5 <kShell+0x396>
 3100cf5:	73 6c                	jae    3100d63 <kShell+0x404>
 3100cf7:	65                   	gs
 3100cf8:	65                   	gs
 3100cf9:	70 00                	jo     3100cfb <kShell+0x39c>
 3100cfb:	53                   	push   ebx
 3100cfc:	6c                   	ins    BYTE PTR es:[edi],dx
 3100cfd:	65                   	gs
 3100cfe:	65                   	gs
 3100cff:	70 20                	jo     3100d21 <kShell+0x3c2>
 3100d01:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3100d03:	72 20                	jb     3100d25 <kShell+0x3c6>
 3100d05:	78 20                	js     3100d27 <kShell+0x3c8>
 3100d07:	73 65                	jae    3100d6e <kShell+0x40f>
 3100d09:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100d0c:	64                   	fs
 3100d0d:	73 00                	jae    3100d0f <kShell+0x3b0>
 3100d0f:	00 49 6e             	add    BYTE PTR [ecx+0x6e],cl
 3100d12:	76 61                	jbe    3100d75 <kShell+0x416>
 3100d14:	6c                   	ins    BYTE PTR es:[edi],dx
 3100d15:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 3100d1c:	61 
 3100d1d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100d1e:	64 20 27             	and    BYTE PTR fs:[edi],ah
 3100d21:	25 73 27 20 79       	and    eax,0x79202773
 3100d26:	61                   	popa   
 3100d27:	20 64 75 6d          	and    BYTE PTR [ebp+esi*2+0x6d],ah
 3100d2b:	6d                   	ins    DWORD PTR es:[edi],dx
 3100d2c:	79 21                	jns    3100d4f <kShell+0x3f0>
 3100d2e:	0a 00                	or     al,BYTE PTR [eax]
 3100d30:	48                   	dec    eax
 3100d31:	65                   	gs
 3100d32:	6c                   	ins    BYTE PTR es:[edi],dx
 3100d33:	70 3a                	jo     3100d6f <kShell+0x410>
 3100d35:	20 25 73 0a 00 09    	and    BYTE PTR ds:0x9000a73,ah
 3100d3b:	25 73 3a 20 25       	and    eax,0x25203a73
 3100d40:	73 0a                	jae    3100d4c <kShell+0x3ed>
 3100d42:	00 62 00             	add    BYTE PTR [edx+0x0],ah
 3100d45:	45                   	inc    ebp
 3100d46:	78 65                	js     3100dad <kShell+0x44e>
 3100d48:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3100d4b:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3100d52:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 3100d55:	72 6f                	jb     3100dc6 <kShell+0x467>
 3100d57:	72 20                	jb     3100d79 <kShell+0x41a>
 3100d59:	65                   	gs
 3100d5a:	78 65                	js     3100dc1 <kShell+0x462>
 3100d5c:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3100d5f:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3100d66:	00 00                	add    BYTE PTR [eax],al
 3100d68:	52                   	push   edx
 3100d69:	65                   	gs
 3100d6a:	71 75                	jno    3100de1 <kShell+0x482>
 3100d6c:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 3100d73:	70 61                	jo     3100dd6 <kShell+0x477>
 3100d75:	72 61                	jb     3100dd8 <kShell+0x479>
 3100d77:	6d                   	ins    DWORD PTR es:[edi],dx
 3100d78:	65                   	gs
 3100d79:	74 65                	je     3100de0 <kShell+0x481>
 3100d7b:	72 20                	jb     3100d9d <kShell+0x43e>
 3100d7d:	77 68                	ja     3100de7 <kShell+0x488>
 3100d7f:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 3100d86:	74 68                	je     3100df0 <kShell+0x491>
 3100d88:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 3100d8c:	6d                   	ins    DWORD PTR es:[edi],dx
 3100d8d:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 3100d90:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 3100d93:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 3100d96:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100d99:	64                   	fs
 3100d9a:	73 20                	jae    3100dbc <kShell+0x45d>
 3100d9c:	74 6f                	je     3100e0d <kShell+0x4ae>
 3100d9e:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3100da1:	65                   	gs
 3100da2:	65                   	gs
 3100da3:	70 0a                	jo     3100daf <kShell+0x450>
 3100da5:	00 25 73 0a 00 6b    	add    BYTE PTR ds:0x6b000a73,ah
 3100dab:	53                   	push   ebx
 3100dac:	68 65 6c 6c 00       	push   0x6c6c65
 3100db1:	25 73 3e 20 00       	and    eax,0x203e73
 3100db6:	1b 5b 31             	sbb    ebx,DWORD PTR [ebx+0x31]
 3100db9:	44                   	inc    esp
	...

Disassembly of section .eh_frame:

03100dbc <.eh_frame>:
 3100dbc:	14 00                	adc    al,0x0
 3100dbe:	00 00                	add    BYTE PTR [eax],al
 3100dc0:	00 00                	add    BYTE PTR [eax],al
 3100dc2:	00 00                	add    BYTE PTR [eax],al
 3100dc4:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3100dc7:	00 01                	add    BYTE PTR [ecx],al
 3100dc9:	7c 08                	jl     3100dd3 <kShell+0x474>
 3100dcb:	01 1b                	add    DWORD PTR [ebx],ebx
 3100dcd:	0c 04                	or     al,0x4
 3100dcf:	04 88                	add    al,0x88
 3100dd1:	01 00                	add    DWORD PTR [eax],eax
 3100dd3:	00 20                	add    BYTE PTR [eax],ah
 3100dd5:	00 00                	add    BYTE PTR [eax],al
 3100dd7:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100dda:	00 00                	add    BYTE PTR [eax],al
 3100ddc:	24 f2                	and    al,0xf2
 3100dde:	ff                   	(bad)  
 3100ddf:	ff ab 00 00 00 00    	jmp    FWORD PTR [ebx+0x0]
 3100de5:	41                   	inc    ecx
 3100de6:	0e                   	push   cs
 3100de7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100ded:	44                   	inc    esp
 3100dee:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100df1:	a3 c5 c3 0c 04       	mov    ds:0x40cc3c5,eax
 3100df6:	04 00                	add    al,0x0
 3100df8:	20 00                	and    BYTE PTR [eax],al
 3100dfa:	00 00                	add    BYTE PTR [eax],al
 3100dfc:	40                   	inc    eax
 3100dfd:	00 00                	add    BYTE PTR [eax],al
 3100dff:	00 ab f2 ff ff 9f    	add    BYTE PTR [ebx-0x6000000e],ch
 3100e05:	01 00                	add    DWORD PTR [eax],eax
 3100e07:	00 00                	add    BYTE PTR [eax],al
 3100e09:	41                   	inc    ecx
 3100e0a:	0e                   	push   cs
 3100e0b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100e11:	44                   	inc    esp
 3100e12:	83 03 03             	add    DWORD PTR [ebx],0x3
 3100e15:	97                   	xchg   edi,eax
 3100e16:	01 c5                	add    ebp,eax
 3100e18:	c3                   	ret    
 3100e19:	0c 04                	or     al,0x4
 3100e1b:	04 1c                	add    al,0x1c
 3100e1d:	00 00                	add    BYTE PTR [eax],al
 3100e1f:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
 3100e23:	00 26                	add    BYTE PTR [esi],ah
 3100e25:	f4                   	hlt    
 3100e26:	ff                   	(bad)  
 3100e27:	ff 69 00             	jmp    FWORD PTR [ecx+0x0]
 3100e2a:	00 00                	add    BYTE PTR [eax],al
 3100e2c:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100e2f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100e35:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3100e38:	0c 04                	or     al,0x4
 3100e3a:	04 00                	add    al,0x0
 3100e3c:	1c 00                	sbb    al,0x0
 3100e3e:	00 00                	add    BYTE PTR [eax],al
 3100e40:	84 00                	test   BYTE PTR [eax],al
 3100e42:	00 00                	add    BYTE PTR [eax],al
 3100e44:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100e45:	f4                   	hlt    
 3100e46:	ff                   	(bad)  
 3100e47:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 3100e4d:	41                   	inc    ecx
 3100e4e:	0e                   	push   cs
 3100e4f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100e55:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 3100e5b:	04 1c                	add    al,0x1c
 3100e5d:	00 00                	add    BYTE PTR [eax],al
 3100e5f:	00 a4 00 00 00 dd f6 	add    BYTE PTR [eax+eax*1-0x9230000],ah
 3100e66:	ff                   	(bad)  
 3100e67:	ff ce                	dec    esi
 3100e69:	00 00                	add    BYTE PTR [eax],al
 3100e6b:	00 00                	add    BYTE PTR [eax],al
 3100e6d:	41                   	inc    ecx
 3100e6e:	0e                   	push   cs
 3100e6f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100e75:	02 ca                	add    cl,dl
 3100e77:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3100e7a:	04 00                	add    al,0x0
 3100e7c:	20 00                	and    BYTE PTR [eax],al
 3100e7e:	00 00                	add    BYTE PTR [eax],al
 3100e80:	c4 00                	les    eax,FWORD PTR [eax]
 3100e82:	00 00                	add    BYTE PTR [eax],al
 3100e84:	8b f7                	mov    esi,edi
 3100e86:	ff                   	(bad)  
 3100e87:	ff 83 00 00 00 00    	inc    DWORD PTR [ebx+0x0]
 3100e8d:	41                   	inc    ecx
 3100e8e:	0e                   	push   cs
 3100e8f:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100e95:	44                   	inc    esp
 3100e96:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100e99:	7b c5                	jnp    3100e60 <kShell+0x501>
 3100e9b:	c3                   	ret    
 3100e9c:	0c 04                	or     al,0x4
 3100e9e:	04 00                	add    al,0x0
 3100ea0:	1c 00                	sbb    al,0x0
 3100ea2:	00 00                	add    BYTE PTR [eax],al
 3100ea4:	e8 00 00 00 ea       	call   ed100ea9 <libcTZ+0xe9fff871>
 3100ea9:	f7 ff                	idiv   edi
 3100eab:	ff                   	(bad)  
 3100eac:	3d 00 00 00 00       	cmp    eax,0x0
 3100eb1:	41                   	inc    ecx
 3100eb2:	0e                   	push   cs
 3100eb3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100eb9:	79 c5                	jns    3100e80 <kShell+0x521>
 3100ebb:	0c 04                	or     al,0x4
 3100ebd:	04 00                	add    al,0x0
 3100ebf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100ec2:	00 00                	add    BYTE PTR [eax],al
 3100ec4:	08 01                	or     BYTE PTR [ecx],al
 3100ec6:	00 00                	add    BYTE PTR [eax],al
 3100ec8:	07                   	pop    es
 3100ec9:	f8                   	clc    
 3100eca:	ff                   	(bad)  
 3100ecb:	ff 83 01 00 00 00    	inc    DWORD PTR [ebx+0x1]
 3100ed1:	41                   	inc    ecx
 3100ed2:	0e                   	push   cs
 3100ed3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100ed9:	03 7f 01             	add    edi,DWORD PTR [edi+0x1]
 3100edc:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3100edf:	04 1c                	add    al,0x1c
 3100ee1:	00 00                	add    BYTE PTR [eax],al
 3100ee3:	00 28                	add    BYTE PTR [eax],ch
 3100ee5:	01 00                	add    DWORD PTR [eax],eax
 3100ee7:	00 6a f9             	add    BYTE PTR [edx-0x7],ch
 3100eea:	ff                   	(bad)  
 3100eeb:	ff 67 00             	jmp    DWORD PTR [edi+0x0]
 3100eee:	00 00                	add    BYTE PTR [eax],al
 3100ef0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100ef3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100ef9:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
 3100efc:	0c 04                	or     al,0x4
 3100efe:	04 00                	add    al,0x0
 3100f00:	1c 00                	sbb    al,0x0
 3100f02:	00 00                	add    BYTE PTR [eax],al
 3100f04:	48                   	dec    eax
 3100f05:	01 00                	add    DWORD PTR [eax],eax
 3100f07:	00 b1 f9 ff ff 58    	add    BYTE PTR [ecx+0x58fffff9],dh
 3100f0d:	00 00                	add    BYTE PTR [eax],al
 3100f0f:	00 00                	add    BYTE PTR [eax],al
 3100f11:	41                   	inc    ecx
 3100f12:	0e                   	push   cs
 3100f13:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100f19:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3100f1d:	04 04                	add    al,0x4
 3100f1f:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100f22:	00 00                	add    BYTE PTR [eax],al
 3100f24:	68 01 00 00 e9       	push   0xe9000001
 3100f29:	f9                   	stc    
 3100f2a:	ff                   	(bad)  
 3100f2b:	ff 4e 00             	dec    DWORD PTR [esi+0x0]
 3100f2e:	00 00                	add    BYTE PTR [eax],al
 3100f30:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100f33:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100f39:	02 4a c5             	add    cl,BYTE PTR [edx-0x3b]
 3100f3c:	0c 04                	or     al,0x4
 3100f3e:	04 00                	add    al,0x0
 3100f40:	1c 00                	sbb    al,0x0
 3100f42:	00 00                	add    BYTE PTR [eax],al
 3100f44:	88 01                	mov    BYTE PTR [ecx],al
 3100f46:	00 00                	add    BYTE PTR [eax],al
 3100f48:	17                   	pop    ss
 3100f49:	fa                   	cli    
 3100f4a:	ff                   	(bad)  
 3100f4b:	ff 20                	jmp    DWORD PTR [eax]
 3100f4d:	02 00                	add    al,BYTE PTR [eax]
 3100f4f:	00 00                	add    BYTE PTR [eax],al
 3100f51:	41                   	inc    ecx
 3100f52:	0e                   	push   cs
 3100f53:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100f59:	03 1c 02             	add    ebx,DWORD PTR [edx+eax*1]
 3100f5c:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3100f5f:	04                   	.byte 0x4

Disassembly of section .interp:

03100f60 <.interp>:
 3100f60:	2f                   	das    
 3100f61:	6c                   	ins    BYTE PTR es:[edi],dx
 3100f62:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3100f69:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3100f70:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03100f74 <.dynsym>:
	...
 3100f84:	09 00                	or     DWORD PTR [eax],eax
	...
 3100f8e:	00 00                	add    BYTE PTR [eax],al
 3100f90:	12 00                	adc    al,BYTE PTR [eax]
 3100f92:	00 00                	add    BYTE PTR [eax],al
 3100f94:	10 00                	adc    BYTE PTR [eax],al
	...
 3100f9e:	00 00                	add    BYTE PTR [eax],al
 3100fa0:	12 00                	adc    al,BYTE PTR [eax]
 3100fa2:	00 00                	add    BYTE PTR [eax],al
 3100fa4:	18 00                	sbb    BYTE PTR [eax],al
	...
 3100fae:	00 00                	add    BYTE PTR [eax],al
 3100fb0:	12 00                	adc    al,BYTE PTR [eax]
 3100fb2:	00 00                	add    BYTE PTR [eax],al
 3100fb4:	1e                   	push   ds
	...
 3100fbd:	00 00                	add    BYTE PTR [eax],al
 3100fbf:	00 12                	add    BYTE PTR [edx],dl
 3100fc1:	00 00                	add    BYTE PTR [eax],al
 3100fc3:	00 23                	add    BYTE PTR [ebx],ah
	...
 3100fcd:	00 00                	add    BYTE PTR [eax],al
 3100fcf:	00 12                	add    BYTE PTR [edx],dl
 3100fd1:	00 00                	add    BYTE PTR [eax],al
 3100fd3:	00 2a                	add    BYTE PTR [edx],ch
	...
 3100fdd:	00 00                	add    BYTE PTR [eax],al
 3100fdf:	00 12                	add    BYTE PTR [edx],dl
 3100fe1:	00 00                	add    BYTE PTR [eax],al
 3100fe3:	00 31                	add    BYTE PTR [ecx],dh
	...
 3100fed:	00 00                	add    BYTE PTR [eax],al
 3100fef:	00 12                	add    BYTE PTR [edx],dl
 3100ff1:	00 00                	add    BYTE PTR [eax],al
 3100ff3:	00 37                	add    BYTE PTR [edi],dh
	...
 3100ffd:	00 00                	add    BYTE PTR [eax],al
 3100fff:	00 12                	add    BYTE PTR [edx],dl
 3101001:	00 00                	add    BYTE PTR [eax],al
 3101003:	00 3f                	add    BYTE PTR [edi],bh
	...
 310100d:	00 00                	add    BYTE PTR [eax],al
 310100f:	00 12                	add    BYTE PTR [edx],dl
 3101011:	00 00                	add    BYTE PTR [eax],al
 3101013:	00 49 00             	add    BYTE PTR [ecx+0x0],cl
	...
 310101e:	00 00                	add    BYTE PTR [eax],al
 3101020:	12 00                	adc    al,BYTE PTR [eax]
 3101022:	00 00                	add    BYTE PTR [eax],al
 3101024:	4e                   	dec    esi
	...
 310102d:	00 00                	add    BYTE PTR [eax],al
 310102f:	00 12                	add    BYTE PTR [edx],dl
 3101031:	00 00                	add    BYTE PTR [eax],al
 3101033:	00 56 00             	add    BYTE PTR [esi+0x0],dl
	...
 310103e:	00 00                	add    BYTE PTR [eax],al
 3101040:	12 00                	adc    al,BYTE PTR [eax]
 3101042:	00 00                	add    BYTE PTR [eax],al
 3101044:	5d                   	pop    ebp
	...
 310104d:	00 00                	add    BYTE PTR [eax],al
 310104f:	00 12                	add    BYTE PTR [edx],dl
 3101051:	00 00                	add    BYTE PTR [eax],al
 3101053:	00 64 00 00          	add    BYTE PTR [eax+eax*1+0x0],ah
	...
 310105f:	00 12                	add    BYTE PTR [edx],dl
 3101061:	00 00                	add    BYTE PTR [eax],al
 3101063:	00 6b 00             	add    BYTE PTR [ebx+0x0],ch
	...
 310106e:	00 00                	add    BYTE PTR [eax],al
 3101070:	12 00                	adc    al,BYTE PTR [eax]
 3101072:	00 00                	add    BYTE PTR [eax],al
 3101074:	72 00                	jb     3101076 <kShell+0x717>
	...
 310107e:	00 00                	add    BYTE PTR [eax],al
 3101080:	12 00                	adc    al,BYTE PTR [eax]
	...

Disassembly of section .dynstr:

03101084 <.dynstr>:
 3101084:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3101088:	63 2e                	arpl   WORD PTR [esi],bp
 310108a:	73 6f                	jae    31010fb <kShell+0x79c>
 310108c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 310108f:	72 63                	jb     31010f4 <kShell+0x795>
 3101091:	70 79                	jo     310110c <kShell+0x7ad>
 3101093:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 3101096:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 310109d:	72 
 310109e:	69 6e 74 00 67 65 74 	imul   ebp,DWORD PTR [esi+0x74],0x74656700
 31010a5:	73 00                	jae    31010a7 <kShell+0x748>
 31010a7:	6d                   	ins    DWORD PTR es:[edi],dx
 31010a8:	65                   	gs
 31010a9:	6d                   	ins    DWORD PTR es:[edi],dx
 31010aa:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 31010ad:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 31010b0:	6c                   	ins    BYTE PTR es:[edi],dx
 31010b1:	6c                   	ins    BYTE PTR es:[edi],dx
 31010b2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31010b3:	63 00                	arpl   WORD PTR [eax],ax
 31010b5:	73 6c                	jae    3101123 <kShell+0x7c4>
 31010b7:	65                   	gs
 31010b8:	65                   	gs
 31010b9:	70 00                	jo     31010bb <kShell+0x75c>
 31010bb:	73 74                	jae    3101131 <kShell+0x7d2>
 31010bd:	72 74                	jb     3101133 <kShell+0x7d4>
 31010bf:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31010c0:	75 6c                	jne    310112e <kShell+0x7cf>
 31010c2:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 31010c6:	63 5f 69             	arpl   WORD PTR [edi+0x69],bx
 31010c9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31010ca:	69 74 00 65 78 65 63 	imul   esi,DWORD PTR [eax+eax*1+0x65],0x636578
 31010d1:	00 
 31010d2:	73 74                	jae    3101148 <kShell+0x7e9>
 31010d4:	72 6e                	jb     3101144 <kShell+0x7e5>
 31010d6:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 31010d9:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 31010dc:	72 74                	jb     3101152 <kShell+0x7f3>
 31010de:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31010df:	6b 00 6d             	imul   eax,DWORD PTR [eax],0x6d
 31010e2:	65                   	gs
 31010e3:	6d                   	ins    DWORD PTR es:[edi],dx
 31010e4:	73 65                	jae    310114b <kShell+0x7ec>
 31010e6:	74 00                	je     31010e8 <kShell+0x789>
 31010e8:	67                   	addr16
 31010e9:	65                   	gs
 31010ea:	74 63                	je     310114f <kShell+0x7f0>
 31010ec:	77 64                	ja     3101152 <kShell+0x7f3>
 31010ee:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 31010f1:	72 6c                	jb     310115f <kShell+0x800>
 31010f3:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31010f5:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 31010f8:	65 65 00 2e          	gs add BYTE PTR gs:[esi],ch
 31010fc:	2e                   	cs
 31010fd:	2f                   	das    
 31010fe:	6c                   	ins    BYTE PTR es:[edi],dx
 31010ff:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3101106:	4f                   	dec    edi
 3101107:	53                   	push   ebx
 3101108:	2f                   	das    
 3101109:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3101110:	62 
 3101111:	75 67                	jne    310117a <kShell+0x81b>
 3101113:	2f                   	das    
 3101114:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 3101117:	73 73                	jae    310118c <kShell+0x82d>
 3101119:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 310111e:	78 00                	js     3101120 <kShell+0x7c1>

Disassembly of section .hash:

03101120 <.hash>:
 3101120:	03 00                	add    eax,DWORD PTR [eax]
 3101122:	00 00                	add    BYTE PTR [eax],al
 3101124:	11 00                	adc    DWORD PTR [eax],eax
 3101126:	00 00                	add    BYTE PTR [eax],al
 3101128:	0d 00 00 00 10       	or     eax,0x10000000
 310112d:	00 00                	add    BYTE PTR [eax],al
 310112f:	00 0e                	add    BYTE PTR [esi],cl
	...
 3101139:	00 00                	add    BYTE PTR [eax],al
 310113b:	00 01                	add    BYTE PTR [ecx],al
 310113d:	00 00                	add    BYTE PTR [eax],al
 310113f:	00 02                	add    BYTE PTR [edx],al
 3101141:	00 00                	add    BYTE PTR [eax],al
 3101143:	00 00                	add    BYTE PTR [eax],al
 3101145:	00 00                	add    BYTE PTR [eax],al
 3101147:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 310114a:	00 00                	add    BYTE PTR [eax],al
 310114c:	03 00                	add    eax,DWORD PTR [eax]
 310114e:	00 00                	add    BYTE PTR [eax],al
 3101150:	05 00 00 00 06       	add    eax,0x6000000
 3101155:	00 00                	add    BYTE PTR [eax],al
 3101157:	00 07                	add    BYTE PTR [edi],al
 3101159:	00 00                	add    BYTE PTR [eax],al
 310115b:	00 00                	add    BYTE PTR [eax],al
 310115d:	00 00                	add    BYTE PTR [eax],al
 310115f:	00 08                	add    BYTE PTR [eax],cl
 3101161:	00 00                	add    BYTE PTR [eax],al
 3101163:	00 0a                	add    BYTE PTR [edx],cl
 3101165:	00 00                	add    BYTE PTR [eax],al
 3101167:	00 09                	add    BYTE PTR [ecx],cl
 3101169:	00 00                	add    BYTE PTR [eax],al
 310116b:	00 0b                	add    BYTE PTR [ebx],cl
 310116d:	00 00                	add    BYTE PTR [eax],al
 310116f:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 3101172:	00 00                	add    BYTE PTR [eax],al
 3101174:	0f 00 00             	sldt   WORD PTR [eax]
	...

Disassembly of section .eh_frame:

03101178 <.eh_frame>:
 3101178:	14 00                	adc    al,0x0
 310117a:	00 00                	add    BYTE PTR [eax],al
 310117c:	00 00                	add    BYTE PTR [eax],al
 310117e:	00 00                	add    BYTE PTR [eax],al
 3101180:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3101183:	00 01                	add    BYTE PTR [ecx],al
 3101185:	7c 08                	jl     310118f <kShell+0x830>
 3101187:	01 1b                	add    DWORD PTR [ebx],ebx
 3101189:	0c 04                	or     al,0x4
 310118b:	04 88                	add    al,0x88
 310118d:	01 00                	add    DWORD PTR [eax],eax
 310118f:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3101192:	00 00                	add    BYTE PTR [eax],al
 3101194:	1c 00                	sbb    al,0x0
 3101196:	00 00                	add    BYTE PTR [eax],al
 3101198:	e8 f9 ff ff 10       	call   14101196 <libcTZ+0x10fffb5e>
 310119d:	01 00                	add    DWORD PTR [eax],eax
 310119f:	00 00                	add    BYTE PTR [eax],al
 31011a1:	0e                   	push   cs
 31011a2:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 31011a5:	0c 4a                	or     al,0x4a
 31011a7:	0f 0b                	ud2    
 31011a9:	74 04                	je     31011af <kShell+0x850>
 31011ab:	78 00                	js     31011ad <kShell+0x84e>
 31011ad:	3f                   	aas    
 31011ae:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 31011b0:	2a 32                	sub    dh,BYTE PTR [edx]
 31011b2:	24 22                	and    al,0x22
 31011b4:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

031011b8 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 31011b8:	01 1b                	add    DWORD PTR [ebx],ebx
 31011ba:	03 3b                	add    edi,DWORD PTR [ebx]
 31011bc:	00 fc                	add    ah,bh
 31011be:	ff                   	(bad)  
 31011bf:	ff 0c 00             	dec    DWORD PTR [eax+eax*1]
 31011c2:	00 00                	add    BYTE PTR [eax],al
 31011c4:	48                   	dec    eax
 31011c5:	ee                   	out    dx,al
 31011c6:	ff                   	(bad)  
 31011c7:	ff 1c fc             	call   FWORD PTR [esp+edi*8]
 31011ca:	ff                   	(bad)  
 31011cb:	ff f3                	push   ebx
 31011cd:	ee                   	out    dx,al
 31011ce:	ff                   	(bad)  
 31011cf:	ff 40 fc             	inc    DWORD PTR [eax-0x4]
 31011d2:	ff                   	(bad)  
 31011d3:	ff 92 f0 ff ff 64    	call   DWORD PTR [edx+0x64fffff0]
 31011d9:	fc                   	cld    
 31011da:	ff                   	(bad)  
 31011db:	ff                   	(bad)  
 31011dc:	fb                   	sti    
 31011dd:	f0 ff                	lock (bad) 
 31011df:	ff 84 fc ff ff 89 f3 	inc    DWORD PTR [esp+edi*8-0xc760001]
 31011e6:	ff                   	(bad)  
 31011e7:	ff a4 fc ff ff 57 f4 	jmp    DWORD PTR [esp+edi*8-0xba80001]
 31011ee:	ff                   	(bad)  
 31011ef:	ff c4                	inc    esp
 31011f1:	fc                   	cld    
 31011f2:	ff                   	(bad)  
 31011f3:	ff da                	call   <internal disassembler error>
 31011f5:	f4                   	hlt    
 31011f6:	ff                   	(bad)  
 31011f7:	ff e8                	jmp    <internal disassembler error>
 31011f9:	fc                   	cld    
 31011fa:	ff                   	(bad)  
 31011fb:	ff 17                	call   DWORD PTR [edi]
 31011fd:	f5                   	cmc    
 31011fe:	ff                   	(bad)  
 31011ff:	ff 08                	dec    DWORD PTR [eax]
 3101201:	fd                   	std    
 3101202:	ff                   	(bad)  
 3101203:	ff 9a f6 ff ff 28    	call   FWORD PTR [edx+0x28fffff6]
 3101209:	fd                   	std    
 310120a:	ff                   	(bad)  
 310120b:	ff 01                	inc    DWORD PTR [ecx]
 310120d:	f7 ff                	idiv   edi
 310120f:	ff 48 fd             	dec    DWORD PTR [eax-0x3]
 3101212:	ff                   	(bad)  
 3101213:	ff 59 f7             	call   FWORD PTR [ecx-0x9]
 3101216:	ff                   	(bad)  
 3101217:	ff 68 fd             	jmp    FWORD PTR [eax-0x3]
 310121a:	ff                   	(bad)  
 310121b:	ff a7 f7 ff ff 88    	jmp    DWORD PTR [edi-0x77000009]
 3101221:	fd                   	std    
 3101222:	ff                   	(bad)  
 3101223:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03101224 <.rel.dyn>:
 3101224:	b4 13                	mov    ah,0x13
 3101226:	10 03                	adc    BYTE PTR [ebx],al
 3101228:	07                   	pop    es
 3101229:	01 00                	add    DWORD PTR [eax],eax
 310122b:	00 b8 13 10 03 07    	add    BYTE PTR [eax+0x7031013],bh
 3101231:	02 00                	add    al,BYTE PTR [eax]
 3101233:	00 bc 13 10 03 07 03 	add    BYTE PTR [ebx+edx*1+0x3070310],bh
 310123a:	00 00                	add    BYTE PTR [eax],al
 310123c:	c0 13 10             	rcl    BYTE PTR [ebx],0x10
 310123f:	03 07                	add    eax,DWORD PTR [edi]
 3101241:	04 00                	add    al,0x0
 3101243:	00 c4                	add    ah,al
 3101245:	13 10                	adc    edx,DWORD PTR [eax]
 3101247:	03 07                	add    eax,DWORD PTR [edi]
 3101249:	05 00 00 c8 13       	add    eax,0x13c80000
 310124e:	10 03                	adc    BYTE PTR [ebx],al
 3101250:	07                   	pop    es
 3101251:	06                   	push   es
 3101252:	00 00                	add    BYTE PTR [eax],al
 3101254:	cc                   	int3   
 3101255:	13 10                	adc    edx,DWORD PTR [eax]
 3101257:	03 07                	add    eax,DWORD PTR [edi]
 3101259:	07                   	pop    es
 310125a:	00 00                	add    BYTE PTR [eax],al
 310125c:	d0 13                	rcl    BYTE PTR [ebx],1
 310125e:	10 03                	adc    BYTE PTR [ebx],al
 3101260:	07                   	pop    es
 3101261:	08 00                	or     BYTE PTR [eax],al
 3101263:	00 d4                	add    ah,dl
 3101265:	13 10                	adc    edx,DWORD PTR [eax]
 3101267:	03 07                	add    eax,DWORD PTR [edi]
 3101269:	09 00                	or     DWORD PTR [eax],eax
 310126b:	00 d8                	add    al,bl
 310126d:	13 10                	adc    edx,DWORD PTR [eax]
 310126f:	03 07                	add    eax,DWORD PTR [edi]
 3101271:	0a 00                	or     al,BYTE PTR [eax]
 3101273:	00 dc                	add    ah,bl
 3101275:	13 10                	adc    edx,DWORD PTR [eax]
 3101277:	03 07                	add    eax,DWORD PTR [edi]
 3101279:	0b 00                	or     eax,DWORD PTR [eax]
 310127b:	00 e0                	add    al,ah
 310127d:	13 10                	adc    edx,DWORD PTR [eax]
 310127f:	03 07                	add    eax,DWORD PTR [edi]
 3101281:	0c 00                	or     al,0x0
 3101283:	00 e4                	add    ah,ah
 3101285:	13 10                	adc    edx,DWORD PTR [eax]
 3101287:	03 07                	add    eax,DWORD PTR [edi]
 3101289:	0d 00 00 e8 13       	or     eax,0x13e80000
 310128e:	10 03                	adc    BYTE PTR [ebx],al
 3101290:	07                   	pop    es
 3101291:	0e                   	push   cs
 3101292:	00 00                	add    BYTE PTR [eax],al
 3101294:	ec                   	in     al,dx
 3101295:	13 10                	adc    edx,DWORD PTR [eax]
 3101297:	03 07                	add    eax,DWORD PTR [edi]
 3101299:	0f 00 00             	sldt   WORD PTR [eax]
 310129c:	f0 13 10             	lock adc edx,DWORD PTR [eax]
 310129f:	03 07                	add    eax,DWORD PTR [edi]
 31012a1:	10 00                	adc    BYTE PTR [eax],al
	...

Disassembly of section .data:

031012c0 <cmds>:
 31012c0:	90                   	nop
 31012c1:	0c 10                	or     al,0x10
 31012c3:	03 95 0c 10 03 41    	add    edx,DWORD PTR [ebp+0x4103100c]
 31012c9:	05 10 03 01 00       	add    eax,0x10310
 31012ce:	00 00                	add    BYTE PTR [eax],al
 31012d0:	b1 0c                	mov    cl,0xc
 31012d2:	10 03                	adc    BYTE PTR [ebx],al
 31012d4:	b6 0c                	mov    dh,0xc
 31012d6:	10 03                	adc    BYTE PTR [ebx],al
 31012d8:	cf                   	iret   
 31012d9:	06                   	push   es
 31012da:	10 03                	adc    BYTE PTR [ebx],al
 31012dc:	01 00                	add    DWORD PTR [eax],eax
 31012de:	00 00                	add    BYTE PTR [eax],al
 31012e0:	c8 0c 10 03          	enter  0x100c,0x3
 31012e4:	cd 0c                	int    0xc
 31012e6:	10 03                	adc    BYTE PTR [ebx],al
 31012e8:	b9 08 10 03 01       	mov    ecx,0x1031008
 31012ed:	00 00                	add    BYTE PTR [eax],al
 31012ef:	00 d9                	add    cl,bl
 31012f1:	0c 10                	or     al,0x10
 31012f3:	03 dd                	add    ebx,ebp
 31012f5:	0c 10                	or     al,0x10
 31012f7:	03 11                	add    edx,DWORD PTR [ecx]
 31012f9:	09 10                	or     DWORD PTR [eax],edx
 31012fb:	03 00                	add    eax,DWORD PTR [eax]
 31012fd:	00 00                	add    BYTE PTR [eax],al
 31012ff:	00 f5                	add    ch,dh
 3101301:	0c 10                	or     al,0x10
 3101303:	03 fb                	add    edi,ebx
 3101305:	0c 10                	or     al,0x10
 3101307:	03 52 08             	add    edx,DWORD PTR [edx+0x8]
 310130a:	10 03                	adc    BYTE PTR [ebx],al
 310130c:	01 00                	add    DWORD PTR [eax],eax
	...

03101310 <delim>:
 3101310:	20 09                	and    BYTE PTR [ecx],cl
 3101312:	0a                   	.byte 0xa
 3101313:	2d                   	.byte 0x2d
 3101314:	2c 00                	sub    al,0x0

Disassembly of section .dynamic:

03101318 <_DYNAMIC>:
 3101318:	01 00                	add    DWORD PTR [eax],eax
 310131a:	00 00                	add    BYTE PTR [eax],al
 310131c:	01 00                	add    DWORD PTR [eax],eax
 310131e:	00 00                	add    BYTE PTR [eax],al
 3101320:	0f 00 00             	sldt   WORD PTR [eax]
 3101323:	00 77 00             	add    BYTE PTR [edi+0x0],dh
 3101326:	00 00                	add    BYTE PTR [eax],al
 3101328:	04 00                	add    al,0x0
 310132a:	00 00                	add    BYTE PTR [eax],al
 310132c:	20 11                	and    BYTE PTR [ecx],dl
 310132e:	10 03                	adc    BYTE PTR [ebx],al
 3101330:	05 00 00 00 84       	add    eax,0x84000000
 3101335:	10 10                	adc    BYTE PTR [eax],dl
 3101337:	03 06                	add    eax,DWORD PTR [esi]
 3101339:	00 00                	add    BYTE PTR [eax],al
 310133b:	00 74 0f 10          	add    BYTE PTR [edi+ecx*1+0x10],dh
 310133f:	03 0a                	add    ecx,DWORD PTR [edx]
 3101341:	00 00                	add    BYTE PTR [eax],al
 3101343:	00 9c 00 00 00 0b 00 	add    BYTE PTR [eax+eax*1+0xb0000],bl
 310134a:	00 00                	add    BYTE PTR [eax],al
 310134c:	10 00                	adc    BYTE PTR [eax],al
 310134e:	00 00                	add    BYTE PTR [eax],al
 3101350:	15 00 00 00 00       	adc    eax,0x0
 3101355:	00 00                	add    BYTE PTR [eax],al
 3101357:	00 03                	add    BYTE PTR [ebx],al
 3101359:	00 00                	add    BYTE PTR [eax],al
 310135b:	00 a8 13 10 03 02    	add    BYTE PTR [eax+0x2031013],ch
 3101361:	00 00                	add    BYTE PTR [eax],al
 3101363:	00 80 00 00 00 14    	add    BYTE PTR [eax+0x14000000],al
 3101369:	00 00                	add    BYTE PTR [eax],al
 310136b:	00 11                	add    BYTE PTR [ecx],dl
 310136d:	00 00                	add    BYTE PTR [eax],al
 310136f:	00 17                	add    BYTE PTR [edi],dl
 3101371:	00 00                	add    BYTE PTR [eax],al
 3101373:	00 24 12             	add    BYTE PTR [edx+edx*1],ah
 3101376:	10 03                	adc    BYTE PTR [ebx],al
	...

Disassembly of section .got.plt:

031013a8 <_GLOBAL_OFFSET_TABLE_>:
 31013a8:	18 13                	sbb    BYTE PTR [ebx],dl
 31013aa:	10 03                	adc    BYTE PTR [ebx],al
	...
 31013b4:	96                   	xchg   esi,eax
 31013b5:	0b 10                	or     edx,DWORD PTR [eax]
 31013b7:	03 a6 0b 10 03 b6    	add    esp,DWORD PTR [esi-0x49fceff5]
 31013bd:	0b 10                	or     edx,DWORD PTR [eax]
 31013bf:	03 c6                	add    eax,esi
 31013c1:	0b 10                	or     edx,DWORD PTR [eax]
 31013c3:	03 d6                	add    edx,esi
 31013c5:	0b 10                	or     edx,DWORD PTR [eax]
 31013c7:	03 e6                	add    esp,esi
 31013c9:	0b 10                	or     edx,DWORD PTR [eax]
 31013cb:	03 f6                	add    esi,esi
 31013cd:	0b 10                	or     edx,DWORD PTR [eax]
 31013cf:	03 06                	add    eax,DWORD PTR [esi]
 31013d1:	0c 10                	or     al,0x10
 31013d3:	03 16                	add    edx,DWORD PTR [esi]
 31013d5:	0c 10                	or     al,0x10
 31013d7:	03 26                	add    esp,DWORD PTR [esi]
 31013d9:	0c 10                	or     al,0x10
 31013db:	03 36                	add    esi,DWORD PTR [esi]
 31013dd:	0c 10                	or     al,0x10
 31013df:	03 46 0c             	add    eax,DWORD PTR [esi+0xc]
 31013e2:	10 03                	adc    BYTE PTR [ebx],al
 31013e4:	56                   	push   esi
 31013e5:	0c 10                	or     al,0x10
 31013e7:	03 66 0c             	add    esp,DWORD PTR [esi+0xc]
 31013ea:	10 03                	adc    BYTE PTR [ebx],al
 31013ec:	76 0c                	jbe    31013fa <_GLOBAL_OFFSET_TABLE_+0x52>
 31013ee:	10 03                	adc    BYTE PTR [ebx],al
 31013f0:	86 0c 10             	xchg   BYTE PTR [eax+edx*1],cl
 31013f3:	03                   	.byte 0x3

Disassembly of section .bss:

03101400 <timeToExit>:
 3101400:	00 00                	add    BYTE PTR [eax],al
	...

03101404 <exitCode>:
	...

03101420 <sExecutingProgram>:
	...

03101620 <command_function_p>:
 3101620:	00 00                	add    BYTE PTR [eax],al
	...

03101624 <heapEnd>:
 3101624:	00 00                	add    BYTE PTR [eax],al
	...

03101628 <heapBase>:
 3101628:	00 00                	add    BYTE PTR [eax],al
	...

0310162c <heapCurr>:
 310162c:	00 00                	add    BYTE PTR [eax],al
	...

03101630 <command_function>:
 3101630:	00 00                	add    BYTE PTR [eax],al
	...

03101634 <sKShellProgramName>:
 3101634:	00 00                	add    BYTE PTR [eax],al
	...

03101638 <libcTZ>:
 3101638:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	78 07                	js     9 <execInternalCommand-0x30ffff7>
   2:	00 00                	add    BYTE PTR [eax],al
   4:	04 00                	add    al,0x0
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	b4 00                	mov    ah,0x0
   e:	00 00                	add    BYTE PTR [eax],al
  10:	0c b5                	or     al,0xb5
  12:	02 00                	add    al,BYTE PTR [eax]
  14:	00 1f                	add    BYTE PTR [edi],bl
  16:	00 00                	add    BYTE PTR [eax],al
  18:	00 00                	add    BYTE PTR [eax],al
  1a:	00 10                	add    BYTE PTR [eax],dl
  1c:	03 7f 0b             	add    edi,DWORD PTR [edi+0xb]
  1f:	00 00                	add    BYTE PTR [eax],al
  21:	00 00                	add    BYTE PTR [eax],al
  23:	00 00                	add    BYTE PTR [eax],al
  25:	02 01                	add    al,BYTE PTR [ecx]
  27:	08 3c 02             	or     BYTE PTR [edx+eax*1],bh
  2a:	00 00                	add    BYTE PTR [eax],al
  2c:	02 02                	add    al,BYTE PTR [edx]
  2e:	07                   	pop    es
  2f:	7d 02                	jge    33 <execInternalCommand-0x30fffcd>
  31:	00 00                	add    BYTE PTR [eax],al
  33:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
  36:	54                   	push   esp
  37:	02 00                	add    al,BYTE PTR [eax]
  39:	00 02                	add    BYTE PTR [edx],al
  3b:	04 07                	add    al,0x7
  3d:	4f                   	dec    edi
  3e:	02 00                	add    al,BYTE PTR [eax]
  40:	00 02                	add    BYTE PTR [edx],al
  42:	01 06                	add    DWORD PTR [esi],eax
  44:	3e 02 00             	add    al,BYTE PTR ds:[eax]
  47:	00 02                	add    BYTE PTR [edx],al
  49:	02 05 7b 01 00 00    	add    al,BYTE PTR ds:0x17b
  4f:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  56:	02 08                	add    cl,BYTE PTR [eax]
  58:	05 a0 01 00 00       	add    eax,0x1a0
  5d:	02 08                	add    cl,BYTE PTR [eax]
  5f:	07                   	pop    es
  60:	4a                   	dec    edx
  61:	02 00                	add    al,BYTE PTR [eax]
  63:	00 02                	add    BYTE PTR [edx],al
  65:	04 05                	add    al,0x5
  67:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
  68:	01 00                	add    DWORD PTR [eax],eax
  6a:	00 02                	add    BYTE PTR [edx],al
  6c:	04 07                	add    al,0x7
  6e:	74 00                	je     70 <execInternalCommand-0x30fff90>
  70:	00 00                	add    BYTE PTR [eax],al
  72:	04 04                	add    al,0x4
  74:	05 04 7a 00 00       	add    eax,0x7a04
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	01 06                	add    DWORD PTR [esi],eax
  7d:	45                   	inc    ebp
  7e:	02 00                	add    al,BYTE PTR [eax]
  80:	00 06                	add    BYTE PTR [esi],al
  82:	59                   	pop    ecx
  83:	01 00                	add    DWORD PTR [eax],eax
  85:	00 02                	add    BYTE PTR [edx],al
  87:	2e                   	cs
  88:	25 00 00 00 06       	and    eax,0x6000000
  8d:	61                   	popa   
  8e:	02 00                	add    al,BYTE PTR [eax]
  90:	00 02                	add    BYTE PTR [edx],al
  92:	34 33                	xor    al,0x33
  94:	00 00                	add    BYTE PTR [eax],al
  96:	00 02                	add    BYTE PTR [edx],al
  98:	01 02                	add    DWORD PTR [edx],eax
  9a:	af                   	scas   eax,DWORD PTR es:[edi]
  9b:	02 00                	add    al,BYTE PTR [eax]
  9d:	00 06                	add    BYTE PTR [esi],al
  9f:	52                   	push   edx
  a0:	01 00                	add    DWORD PTR [eax],eax
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
  bd:	1d 02 00 00 04       	sbb    eax,0x4000002
  c2:	14 74                	adc    al,0x74
  c4:	00 00                	add    BYTE PTR [eax],al
  c6:	00 00                	add    BYTE PTR [eax],al
  c8:	09 4c 00 00          	or     DWORD PTR [eax+eax*1+0x0],ecx
  cc:	00 04 15 74 00 00 00 	add    BYTE PTR [edx*1+0x74],al
  d3:	04 09                	add    al,0x9
  d5:	72 01                	jb     d8 <execInternalCommand-0x30fff28>
  d7:	00 00                	add    BYTE PTR [eax],al
  d9:	04 16                	add    al,0x16
  db:	72 00                	jb     dd <execInternalCommand-0x30fff23>
  dd:	00 00                	add    BYTE PTR [eax],al
  df:	08 09                	or     BYTE PTR [ecx],cl
  e1:	8e 01                	mov    es,WORD PTR [ecx]
  e3:	00 00                	add    BYTE PTR [eax],al
  e5:	04 17                	add    al,0x17
  e7:	4f                   	dec    edi
  e8:	00 00                	add    BYTE PTR [eax],al
  ea:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
  ed:	06                   	push   es
  ee:	8b 00                	mov    eax,DWORD PTR [eax]
  f0:	00 00                	add    BYTE PTR [eax],al
  f2:	04 18                	add    al,0x18
  f4:	b4 00                	mov    ah,0x0
  f6:	00 00                	add    BYTE PTR [eax],al
  f8:	0a 19                	or     bl,BYTE PTR [ecx]
  fa:	01 00                	add    DWORD PTR [eax],eax
  fc:	00 01                	add    BYTE PTR [ecx],al
  fe:	1a 00                	sbb    al,BYTE PTR [eax]
 100:	00 10                	add    BYTE PTR [eax],dl
 102:	03 ab 00 00 00 01    	add    ebp,DWORD PTR [ebx+0x1000000]
 108:	9c                   	pushf  
 109:	28 01                	sub    BYTE PTR [ecx],al
 10b:	00 00                	add    BYTE PTR [eax],al
 10d:	0b 24 01             	or     esp,DWORD PTR [ecx+eax*1]
 110:	00 00                	add    BYTE PTR [eax],al
 112:	01 1a                	add    DWORD PTR [edx],ebx
 114:	74 00                	je     116 <execInternalCommand-0x30ffeea>
 116:	00 00                	add    BYTE PTR [eax],al
 118:	02 91 00 0c 69 00    	add    dl,BYTE PTR [ecx+0x690c00]
 11e:	01 1c 4f             	add    DWORD PTR [edi+ecx*2],ebx
 121:	00 00                	add    BYTE PTR [eax],al
 123:	00 02                	add    BYTE PTR [edx],al
 125:	91                   	xchg   ecx,eax
 126:	6c                   	ins    BYTE PTR es:[edi],dx
 127:	00 0d 5d 00 00 00    	add    BYTE PTR ds:0x5d,cl
 12d:	01 31                	add    DWORD PTR [ecx],esi
 12f:	4f                   	dec    edi
 130:	00 00                	add    BYTE PTR [eax],al
 132:	00 ab 00 10 03 9f    	add    BYTE PTR [ebx-0x60fcf000],ch
 138:	01 00                	add    DWORD PTR [eax],eax
 13a:	00 01                	add    BYTE PTR [ecx],al
 13c:	9c                   	pushf  
 13d:	c6 01 00             	mov    BYTE PTR [ecx],0x0
 140:	00 0b                	add    BYTE PTR [ebx],cl
 142:	e5 02                	in     eax,0x2
 144:	00 00                	add    BYTE PTR [eax],al
 146:	01 31                	add    DWORD PTR [ecx],esi
 148:	74 00                	je     14a <execInternalCommand-0x30ffeb6>
 14a:	00 00                	add    BYTE PTR [eax],al
 14c:	02 91 00 0b 16 02    	add    dl,BYTE PTR [ecx+0x2160b00]
 152:	00 00                	add    BYTE PTR [eax],al
 154:	01 31                	add    DWORD PTR [ecx],esi
 156:	d6                   	(bad)  
 157:	01 00                	add    DWORD PTR [eax],eax
 159:	00 02                	add    BYTE PTR [edx],al
 15b:	91                   	xchg   ecx,eax
 15c:	04 0b                	add    al,0xb
 15e:	d1 02                	rol    DWORD PTR [edx],1
 160:	00 00                	add    BYTE PTR [eax],al
 162:	01 31                	add    DWORD PTR [ecx],esi
 164:	4f                   	dec    edi
 165:	00 00                	add    BYTE PTR [eax],al
 167:	00 02                	add    BYTE PTR [edx],al
 169:	91                   	xchg   ecx,eax
 16a:	08 0c 78             	or     BYTE PTR [eax+edi*2],cl
 16d:	00 01                	add    BYTE PTR [ecx],al
 16f:	33 4f 00             	xor    ecx,DWORD PTR [edi+0x0]
 172:	00 00                	add    BYTE PTR [eax],al
 174:	02 91 6c 0c 79 00    	add    dl,BYTE PTR [ecx+0x790c6c]
 17a:	01 33                	add    DWORD PTR [ebx],esi
 17c:	4f                   	dec    edi
 17d:	00 00                	add    BYTE PTR [eax],al
 17f:	00 02                	add    BYTE PTR [edx],al
 181:	91                   	xchg   ecx,eax
 182:	68 0e 17 00 00       	push   0x170e
 187:	00 01                	add    BYTE PTR [ecx],al
 189:	34 4f                	xor    al,0x4f
 18b:	00 00                	add    BYTE PTR [eax],al
 18d:	00 02                	add    BYTE PTR [edx],al
 18f:	91                   	xchg   ecx,eax
 190:	64                   	fs
 191:	0e                   	push   cs
 192:	9b                   	fwait
 193:	00 00                	add    BYTE PTR [eax],al
 195:	00 01                	add    BYTE PTR [ecx],al
 197:	34 4f                	xor    al,0x4f
 199:	00 00                	add    BYTE PTR [eax],al
 19b:	00 02                	add    BYTE PTR [edx],al
 19d:	91                   	xchg   ecx,eax
 19e:	60                   	pusha  
 19f:	0e                   	push   cs
 1a0:	22 02                	and    al,BYTE PTR [edx]
 1a2:	00 00                	add    BYTE PTR [eax],al
 1a4:	01 35 97 00 00 00    	add    DWORD PTR ds:0x97,esi
 1aa:	02 91 5f 0f e6 00    	add    dl,BYTE PTR [ecx+0xe60f5f]
 1b0:	10 03                	adc    BYTE PTR [ebx],al
 1b2:	3f                   	aas    
 1b3:	01 00                	add    DWORD PTR [eax],eax
 1b5:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 1b8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1b9:	74 00                	je     1bb <execInternalCommand-0x30ffe45>
 1bb:	01 39                	add    DWORD PTR [ecx],edi
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
 1db:	00 0d f2 02 00 00    	add    BYTE PTR ds:0x2f2,cl
 1e1:	01 63 4f             	add    DWORD PTR [ebx+0x4f],esp
 1e4:	00 00                	add    BYTE PTR [eax],al
 1e6:	00 4a 02             	add    BYTE PTR [edx+0x2],cl
 1e9:	10 03                	adc    BYTE PTR [ebx],al
 1eb:	69 00 00 00 01 9c    	imul   eax,DWORD PTR [eax],0x9c010000
 1f1:	1e                   	push   ds
 1f2:	02 00                	add    al,BYTE PTR [eax]
 1f4:	00 0b                	add    BYTE PTR [ebx],cl
 1f6:	35 03 00 00 01       	xor    eax,0x1000003
 1fb:	63 74 00 00          	arpl   WORD PTR [eax+eax*1+0x0],si
 1ff:	00 02                	add    BYTE PTR [edx],al
 201:	91                   	xchg   ecx,eax
 202:	00 0c 69             	add    BYTE PTR [ecx+ebp*2],cl
 205:	00 01                	add    BYTE PTR [ecx],al
 207:	65 33 00             	xor    eax,DWORD PTR gs:[eax]
 20a:	00 00                	add    BYTE PTR [eax],al
 20c:	02 91 6c 0c 72 65    	add    dl,BYTE PTR [ecx+0x65720c6c]
 212:	74 00                	je     214 <execInternalCommand-0x30ffdec>
 214:	01 66 4f             	add    DWORD PTR [esi+0x4f],esp
 217:	00 00                	add    BYTE PTR [eax],al
 219:	00 02                	add    BYTE PTR [edx],al
 21b:	91                   	xchg   ecx,eax
 21c:	68 00 0d 6a 02       	push   0x26a0d00
 221:	00 00                	add    BYTE PTR [eax],al
 223:	01 77 dc             	add    DWORD PTR [edi-0x24],esi
 226:	02 00                	add    al,BYTE PTR [eax]
 228:	00 b3 02 10 03 8e    	add    BYTE PTR [ebx-0x71fceffe],dh
 22e:	02 00                	add    al,BYTE PTR [eax]
 230:	00 01                	add    BYTE PTR [ecx],al
 232:	9c                   	pushf  
 233:	dc 02                	fadd   QWORD PTR [edx]
 235:	00 00                	add    BYTE PTR [eax],al
 237:	0b 6e 00             	or     ebp,DWORD PTR [esi+0x0]
 23a:	00 00                	add    BYTE PTR [eax],al
 23c:	01 77 a9             	add    DWORD PTR [edi-0x57],esi
 23f:	00 00                	add    BYTE PTR [eax],al
 241:	00 02                	add    BYTE PTR [edx],al
 243:	91                   	xchg   ecx,eax
 244:	00 0c 61             	add    BYTE PTR [ecx+eiz*2],cl
 247:	72 67                	jb     2b0 <execInternalCommand-0x30ffd50>
 249:	00 01                	add    BYTE PTR [ecx],al
 24b:	79 74                	jns    2c1 <execInternalCommand-0x30ffd3f>
 24d:	00 00                	add    BYTE PTR [eax],al
 24f:	00 02                	add    BYTE PTR [edx],al
 251:	91                   	xchg   ecx,eax
 252:	6c                   	ins    BYTE PTR es:[edi],dx
 253:	0e                   	push   cs
 254:	fe 02                	inc    BYTE PTR [edx]
 256:	00 00                	add    BYTE PTR [eax],al
 258:	01 7a 74             	add    DWORD PTR [edx+0x74],edi
 25b:	00 00                	add    BYTE PTR [eax],al
 25d:	00 02                	add    BYTE PTR [edx],al
 25f:	91                   	xchg   ecx,eax
 260:	68 0e cf 01 00       	push   0x1cf0e
 265:	00 01                	add    BYTE PTR [ecx],al
 267:	7b 4f                	jnp    2b8 <execInternalCommand-0x30ffd48>
 269:	00 00                	add    BYTE PTR [eax],al
 26b:	00 02                	add    BYTE PTR [edx],al
 26d:	91                   	xchg   ecx,eax
 26e:	64                   	fs
 26f:	0e                   	push   cs
 270:	4b                   	dec    ebx
 271:	01 00                	add    DWORD PTR [eax],eax
 273:	00 01                	add    BYTE PTR [ecx],al
 275:	7c 4f                	jl     2c6 <execInternalCommand-0x30ffd3a>
 277:	00 00                	add    BYTE PTR [eax],al
 279:	00 02                	add    BYTE PTR [edx],al
 27b:	91                   	xchg   ecx,eax
 27c:	60                   	pusha  
 27d:	0e                   	push   cs
 27e:	ce                   	into   
 27f:	01 00                	add    DWORD PTR [eax],eax
 281:	00 01                	add    BYTE PTR [ecx],al
 283:	7d 4f                	jge    2d4 <execInternalCommand-0x30ffd2c>
 285:	00 00                	add    BYTE PTR [eax],al
 287:	00 02                	add    BYTE PTR [edx],al
 289:	91                   	xchg   ecx,eax
 28a:	5c                   	pop    esp
 28b:	0e                   	push   cs
 28c:	f9                   	stc    
 28d:	01 00                	add    DWORD PTR [eax],eax
 28f:	00 01                	add    BYTE PTR [ecx],al
 291:	7e 4f                	jle    2e2 <execInternalCommand-0x30ffd1e>
 293:	00 00                	add    BYTE PTR [eax],al
 295:	00 02                	add    BYTE PTR [edx],al
 297:	91                   	xchg   ecx,eax
 298:	58                   	pop    eax
 299:	0e                   	push   cs
 29a:	f6 01 00             	test   BYTE PTR [ecx],0x0
 29d:	00 01                	add    BYTE PTR [ecx],al
 29f:	7f 4f                	jg     2f0 <execInternalCommand-0x30ffd10>
 2a1:	00 00                	add    BYTE PTR [eax],al
 2a3:	00 02                	add    BYTE PTR [edx],al
 2a5:	91                   	xchg   ecx,eax
 2a6:	54                   	push   esp
 2a7:	0e                   	push   cs
 2a8:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2a9:	02 00                	add    al,BYTE PTR [eax]
 2ab:	00 01                	add    BYTE PTR [ecx],al
 2ad:	80 dc 02             	sbb    ah,0x2
 2b0:	00 00                	add    BYTE PTR [eax],al
 2b2:	02 91 50 0e d6 02    	add    dl,BYTE PTR [ecx+0x2d60e50]
 2b8:	00 00                	add    BYTE PTR [eax],al
 2ba:	01 81 dc 02 00 00    	add    DWORD PTR [ecx+0x2dc],eax
 2c0:	02 91 4c 0f 74 04    	add    dl,BYTE PTR [ecx+0x4740f4c]
 2c6:	10 03                	adc    BYTE PTR [ebx],al
 2c8:	9e                   	sahf   
 2c9:	00 00                	add    BYTE PTR [eax],al
 2cb:	00 0e                	add    BYTE PTR [esi],cl
 2cd:	58                   	pop    eax
 2ce:	00 00                	add    BYTE PTR [eax],al
 2d0:	00 01                	add    BYTE PTR [ecx],al
 2d2:	da 74 00 00          	fidiv  DWORD PTR [eax+eax*1+0x0]
 2d6:	00 02                	add    BYTE PTR [edx],al
 2d8:	91                   	xchg   ecx,eax
 2d9:	48                   	dec    eax
 2da:	00 00                	add    BYTE PTR [eax],al
 2dc:	05 04 74 00 00       	add    eax,0x7404
 2e1:	00 0a                	add    BYTE PTR [edx],cl
 2e3:	10 00                	adc    BYTE PTR [eax],al
 2e5:	00 00                	add    BYTE PTR [eax],al
 2e7:	01 f0                	add    eax,esi
 2e9:	41                   	inc    ecx
 2ea:	05 10 03 ce 00       	add    eax,0xce0310
 2ef:	00 00                	add    BYTE PTR [eax],al
 2f1:	01 9c 2c 03 00 00 0b 	add    DWORD PTR [esp+ebp*1+0xb000003],ebx
 2f8:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
 2f9:	00 00                	add    BYTE PTR [eax],al
 2fb:	00 01                	add    BYTE PTR [ecx],al
 2fd:	f0 74 00             	lock je 300 <execInternalCommand-0x30ffd00>
 300:	00 00                	add    BYTE PTR [eax],al
 302:	02 91 00 0c 74 6f    	add    dl,BYTE PTR [ecx+0x6f740c00]
 308:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
 30b:	f2 74 00             	repnz je 30e <execInternalCommand-0x30ffcf2>
 30e:	00 00                	add    BYTE PTR [eax],al
 310:	02 91 68 0f 70 05    	add    dl,BYTE PTR [ecx+0x5700f68]
 316:	10 03                	adc    BYTE PTR [ebx],al
 318:	9c                   	pushf  
 319:	00 00                	add    BYTE PTR [eax],al
 31b:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 31e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31f:	74 00                	je     321 <execInternalCommand-0x30ffcdf>
 321:	01 fc                	add    esp,edi
 323:	33 00                	xor    eax,DWORD PTR [eax]
 325:	00 00                	add    BYTE PTR [eax],al
 327:	02 91 6c 00 00 12    	add    dl,BYTE PTR [ecx+0x1200006c]
 32d:	ae                   	scas   al,BYTE PTR es:[edi]
 32e:	01 00                	add    DWORD PTR [eax],eax
 330:	00 01                	add    BYTE PTR [ecx],al
 332:	07                   	pop    es
 333:	01 dc                	add    esp,ebx
 335:	02 00                	add    al,BYTE PTR [eax]
 337:	00 0f                	add    BYTE PTR [edi],cl
 339:	06                   	push   es
 33a:	10 03                	adc    BYTE PTR [ebx],al
 33c:	83 00 00             	add    DWORD PTR [eax],0x0
 33f:	00 01                	add    BYTE PTR [ecx],al
 341:	9c                   	pushf  
 342:	8d 03                	lea    eax,[ebx]
 344:	00 00                	add    BYTE PTR [eax],al
 346:	13 99 01 00 00 01    	adc    ebx,DWORD PTR [ecx+0x1000001]
 34c:	07                   	pop    es
 34d:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 350:	00 00                	add    BYTE PTR [eax],al
 352:	02 91 00 13 16 02    	add    dl,BYTE PTR [ecx+0x2161300]
 358:	00 00                	add    BYTE PTR [eax],al
 35a:	01 07                	add    DWORD PTR [edi],eax
 35c:	01 d6                	add    esi,edx
 35e:	01 00                	add    DWORD PTR [eax],eax
 360:	00 02                	add    BYTE PTR [edx],al
 362:	91                   	xchg   ecx,eax
 363:	04 14                	add    al,0x14
 365:	af                   	scas   eax,DWORD PTR es:[edi]
 366:	00 00                	add    BYTE PTR [eax],al
 368:	00 01                	add    BYTE PTR [ecx],al
 36a:	09 01                	or     DWORD PTR [ecx],eax
 36c:	dc 02                	fadd   QWORD PTR [edx]
 36e:	00 00                	add    BYTE PTR [eax],al
 370:	02 91 68 0f 2b 06    	add    dl,BYTE PTR [ecx+0x62b0f68]
 376:	10 03                	adc    BYTE PTR [ebx],al
 378:	5f                   	pop    edi
 379:	00 00                	add    BYTE PTR [eax],al
 37b:	00 15 63 6e 74 00    	add    BYTE PTR ds:0x746e63,dl
 381:	01 0b                	add    DWORD PTR [ebx],ecx
 383:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 386:	00 00                	add    BYTE PTR [eax],al
 388:	02 91 6c 00 00 16    	add    dl,BYTE PTR [ecx+0x1600006c]
 38e:	85 01                	test   DWORD PTR [ecx],eax
 390:	00 00                	add    BYTE PTR [eax],al
 392:	01 13                	add    DWORD PTR [ebx],edx
 394:	01 92 06 10 03 3d    	add    DWORD PTR [edx+0x3d031006],edx
 39a:	00 00                	add    BYTE PTR [eax],al
 39c:	00 01                	add    BYTE PTR [ecx],al
 39e:	9c                   	pushf  
 39f:	db 03                	fild   DWORD PTR [ebx]
 3a1:	00 00                	add    BYTE PTR [eax],al
 3a3:	13 99 01 00 00 01    	adc    ebx,DWORD PTR [ecx+0x1000001]
 3a9:	13 01                	adc    eax,DWORD PTR [ecx]
 3ab:	4f                   	dec    edi
 3ac:	00 00                	add    BYTE PTR [eax],al
 3ae:	00 02                	add    BYTE PTR [edx],al
 3b0:	91                   	xchg   ecx,eax
 3b1:	00 13                	add    BYTE PTR [ebx],dl
 3b3:	16                   	push   ss
 3b4:	02 00                	add    al,BYTE PTR [eax]
 3b6:	00 01                	add    BYTE PTR [ecx],al
 3b8:	13 01                	adc    eax,DWORD PTR [ecx]
 3ba:	dc 02                	fadd   QWORD PTR [edx]
 3bc:	00 00                	add    BYTE PTR [eax],al
 3be:	02 91 04 0f 98 06    	add    dl,BYTE PTR [ecx+0x6980f04]
 3c4:	10 03                	adc    BYTE PTR [ebx],al
 3c6:	26 00 00             	add    BYTE PTR es:[eax],al
 3c9:	00 15 63 6e 74 00    	add    BYTE PTR ds:0x746e63,dl
 3cf:	01 15 01 4f 00 00    	add    DWORD PTR ds:0x4f01,edx
 3d5:	00 02                	add    BYTE PTR [edx],al
 3d7:	91                   	xchg   ecx,eax
 3d8:	6c                   	ins    BYTE PTR es:[edi],dx
 3d9:	00 00                	add    BYTE PTR [eax],al
 3db:	16                   	push   ss
 3dc:	c6 02 00             	mov    BYTE PTR [edx],0x0
 3df:	00 01                	add    BYTE PTR [ecx],al
 3e1:	1a 01                	sbb    al,BYTE PTR [ecx]
 3e3:	cf                   	iret   
 3e4:	06                   	push   es
 3e5:	10 03                	adc    BYTE PTR [ebx],al
 3e7:	83 01 00             	add    DWORD PTR [ecx],0x0
 3ea:	00 01                	add    BYTE PTR [ecx],al
 3ec:	9c                   	pushf  
 3ed:	89 04 00             	mov    DWORD PTR [eax+eax*1],eax
 3f0:	00 13                	add    BYTE PTR [ebx],dl
 3f2:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
 3f3:	00 00                	add    BYTE PTR [eax],al
 3f5:	00 01                	add    BYTE PTR [ecx],al
 3f7:	1a 01                	sbb    al,BYTE PTR [ecx]
 3f9:	74 00                	je     3fb <execInternalCommand-0x30ffc05>
 3fb:	00 00                	add    BYTE PTR [eax],al
 3fd:	02 91 00 14 e2 01    	add    dl,BYTE PTR [ecx+0x1e21400]
 403:	00 00                	add    BYTE PTR [eax],al
 405:	01 1c 01             	add    DWORD PTR [ecx+eax*1],ebx
 408:	97                   	xchg   edi,eax
 409:	00 00                	add    BYTE PTR [eax],al
 40b:	00 02                	add    BYTE PTR [edx],al
 40d:	91                   	xchg   ecx,eax
 40e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 40f:	15 70 69 64 00       	adc    eax,0x646970
 414:	01 1d 01 8c 00 00    	add    DWORD PTR ds:0x8c01,ebx
 41a:	00 02                	add    BYTE PTR [edx],al
 41c:	91                   	xchg   ecx,eax
 41d:	58                   	pop    eax
 41e:	15 74 6f 6b 00       	adc    eax,0x6b6f74
 423:	01 1e                	add    DWORD PTR [esi],ebx
 425:	01 74 00 00          	add    DWORD PTR [eax+eax*1+0x0],esi
 429:	00 02                	add    BYTE PTR [edx],al
 42b:	91                   	xchg   ecx,eax
 42c:	68 15 70 67 6d       	push   0x6d677015
 431:	00 01                	add    BYTE PTR [ecx],al
 433:	1f                   	pop    ds
 434:	01 74 00 00          	add    DWORD PTR [eax+eax*1+0x0],esi
 438:	00 02                	add    BYTE PTR [edx],al
 43a:	91                   	xchg   ecx,eax
 43b:	64                   	fs
 43c:	14 16                	adc    al,0x16
 43e:	02 00                	add    al,BYTE PTR [eax]
 440:	00 01                	add    BYTE PTR [ecx],al
 442:	21 01                	and    DWORD PTR [ecx],eax
 444:	89 04 00             	mov    DWORD PTR [eax+eax*1],eax
 447:	00 03                	add    BYTE PTR [ebx],al
 449:	91                   	xchg   ecx,eax
 44a:	dc 7b 14             	fdivr  QWORD PTR [ebx+0x14]
 44d:	8e 01                	mov    es,WORD PTR [ecx]
 44f:	00 00                	add    BYTE PTR [eax],al
 451:	01 22                	add    DWORD PTR [edx],esp
 453:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 456:	00 00                	add    BYTE PTR [eax],al
 458:	02 91 54 14 0a 01    	add    dl,BYTE PTR [ecx+0x10a1454]
 45e:	00 00                	add    BYTE PTR [eax],al
 460:	01 23                	add    DWORD PTR [ebx],esp
 462:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 465:	00 00                	add    BYTE PTR [eax],al
 467:	02 91 60 14 99 01    	add    dl,BYTE PTR [ecx+0x1991460]
 46d:	00 00                	add    BYTE PTR [eax],al
 46f:	01 24 01             	add    DWORD PTR [ecx+eax*1],esp
 472:	4f                   	dec    edi
 473:	00 00                	add    BYTE PTR [eax],al
 475:	00 02                	add    BYTE PTR [edx],al
 477:	91                   	xchg   ecx,eax
 478:	5c                   	pop    esp
 479:	14 cc                	adc    al,0xcc
 47b:	02 00                	add    al,BYTE PTR [eax]
 47d:	00 01                	add    BYTE PTR [ecx],al
 47f:	37                   	aaa    
 480:	01 dc                	add    esp,ebx
 482:	02 00                	add    al,BYTE PTR [eax]
 484:	00 02                	add    BYTE PTR [edx],al
 486:	91                   	xchg   ecx,eax
 487:	50                   	push   eax
 488:	00 10                	add    BYTE PTR [eax],dl
 48a:	7a 00                	jp     48c <execInternalCommand-0x30ffb74>
 48c:	00 00                	add    BYTE PTR [eax],al
 48e:	9f                   	lahf   
 48f:	04 00                	add    al,0x0
 491:	00 11                	add    BYTE PTR [ecx],dl
 493:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 496:	00 09                	add    BYTE PTR [ecx],cl
 498:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 49b:	00 00                	add    BYTE PTR [eax],al
 49d:	31 00                	xor    DWORD PTR [eax],eax
 49f:	16                   	push   ss
 4a0:	06                   	push   es
 4a1:	03 00                	add    eax,DWORD PTR [eax]
 4a3:	00 01                	add    BYTE PTR [ecx],al
 4a5:	4a                   	dec    edx
 4a6:	01 52 08             	add    DWORD PTR [edx+0x8],edx
 4a9:	10 03                	adc    BYTE PTR [ebx],al
 4ab:	67 00 00             	add    BYTE PTR [bx+si],al
 4ae:	00 01                	add    BYTE PTR [ecx],al
 4b0:	9c                   	pushf  
 4b1:	e4 04                	in     al,0x4
 4b3:	00 00                	add    BYTE PTR [eax],al
 4b5:	13 a7 00 00 00 01    	adc    esp,DWORD PTR [edi+0x1000000]
 4bb:	4a                   	dec    edx
 4bc:	01 74 00 00          	add    DWORD PTR [eax+eax*1+0x0],esi
 4c0:	00 02                	add    BYTE PTR [edx],al
 4c2:	91                   	xchg   ecx,eax
 4c3:	00 14 16             	add    BYTE PTR [esi+edx*1],dl
 4c6:	02 00                	add    al,BYTE PTR [eax]
 4c8:	00 01                	add    BYTE PTR [ecx],al
 4ca:	4c                   	dec    esp
 4cb:	01 89 04 00 00 03    	add    DWORD PTR [ecx+0x3000004],ecx
 4d1:	91                   	xchg   ecx,eax
 4d2:	f8                   	clc    
 4d3:	7b 14                	jnp    4e9 <execInternalCommand-0x30ffb17>
 4d5:	8e 01                	mov    es,WORD PTR [ecx]
 4d7:	00 00                	add    BYTE PTR [eax],al
 4d9:	01 4d 01             	add    DWORD PTR [ebp+0x1],ecx
 4dc:	4f                   	dec    edi
 4dd:	00 00                	add    BYTE PTR [eax],al
 4df:	00 02                	add    BYTE PTR [edx],al
 4e1:	91                   	xchg   ecx,eax
 4e2:	6c                   	ins    BYTE PTR es:[edi],dx
 4e3:	00 16                	add    BYTE PTR [esi],dl
 4e5:	46                   	inc    esi
 4e6:	00 00                	add    BYTE PTR [eax],al
 4e8:	00 01                	add    BYTE PTR [ecx],al
 4ea:	58                   	pop    eax
 4eb:	01 b9 08 10 03 58    	add    DWORD PTR [ecx+0x58031008],edi
 4f1:	00 00                	add    BYTE PTR [eax],al
 4f3:	00 01                	add    BYTE PTR [ecx],al
 4f5:	9c                   	pushf  
 4f6:	1a 05 00 00 13 a7    	sbb    al,BYTE PTR ds:0xa7130000
 4fc:	00 00                	add    BYTE PTR [eax],al
 4fe:	00 01                	add    BYTE PTR [ecx],al
 500:	58                   	pop    eax
 501:	01 74 00 00          	add    DWORD PTR [eax+eax*1+0x0],esi
 505:	00 02                	add    BYTE PTR [edx],al
 507:	91                   	xchg   ecx,eax
 508:	00 14 16             	add    BYTE PTR [esi+edx*1],dl
 50b:	02 00                	add    al,BYTE PTR [eax]
 50d:	00 01                	add    BYTE PTR [ecx],al
 50f:	5a                   	pop    edx
 510:	01 89 04 00 00 03    	add    DWORD PTR [ecx+0x3000004],ecx
 516:	91                   	xchg   ecx,eax
 517:	fc                   	cld    
 518:	7b 00                	jnp    51a <execInternalCommand-0x30ffae6>
 51a:	17                   	pop    ss
 51b:	70 77                	jo     594 <execInternalCommand-0x30ffa6c>
 51d:	64 00 01             	add    BYTE PTR fs:[ecx],al
 520:	65 01 11             	add    DWORD PTR gs:[ecx],edx
 523:	09 10                	or     DWORD PTR [eax],edx
 525:	03 4e 00             	add    ecx,DWORD PTR [esi+0x0]
 528:	00 00                	add    BYTE PTR [eax],al
 52a:	01 9c 40 05 00 00 15 	add    DWORD PTR [eax+eax*2+0x15000005],ebx
 531:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 534:	00 01                	add    BYTE PTR [ecx],al
 536:	67 01 74 00          	add    DWORD PTR [si+0x0],esi
 53a:	00 00                	add    BYTE PTR [eax],al
 53c:	02 91 6c 00 12 3d    	add    dl,BYTE PTR [ecx+0x3d12006c]
 542:	03 00                	add    eax,DWORD PTR [eax]
 544:	00 01                	add    BYTE PTR [ecx],al
 546:	6c                   	ins    BYTE PTR es:[edi],dx
 547:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 54a:	00 00                	add    BYTE PTR [eax],al
 54c:	5f                   	pop    edi
 54d:	09 10                	or     DWORD PTR [eax],edx
 54f:	03 20                	add    esp,DWORD PTR [eax]
 551:	02 00                	add    al,BYTE PTR [eax]
 553:	00 01                	add    BYTE PTR [ecx],al
 555:	9c                   	pushf  
 556:	30 06                	xor    BYTE PTR [esi],al
 558:	00 00                	add    BYTE PTR [eax],al
 55a:	13 f9                	adc    edi,ecx
 55c:	01 00                	add    DWORD PTR [eax],eax
 55e:	00 01                	add    BYTE PTR [ecx],al
 560:	6c                   	ins    BYTE PTR es:[edi],dx
 561:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 564:	00 00                	add    BYTE PTR [eax],al
 566:	02 91 00 13 6f 02    	add    dl,BYTE PTR [ecx+0x26f1300]
 56c:	00 00                	add    BYTE PTR [eax],al
 56e:	01 6c 01 dc          	add    DWORD PTR [ecx+eax*1-0x24],ebp
 572:	02 00                	add    al,BYTE PTR [eax]
 574:	00 02                	add    BYTE PTR [edx],al
 576:	91                   	xchg   ecx,eax
 577:	04 14                	add    al,0x14
 579:	24 01                	and    al,0x1
 57b:	00 00                	add    BYTE PTR [eax],al
 57d:	01 6e 01             	add    DWORD PTR [esi+0x1],ebp
 580:	30 06                	xor    BYTE PTR [esi],al
 582:	00 00                	add    BYTE PTR [eax],al
 584:	03 91 dc 7d 14 90    	add    edx,DWORD PTR [ecx-0x6feb8224]
 58a:	02 00                	add    al,BYTE PTR [eax]
 58c:	00 01                	add    BYTE PTR [ecx],al
 58e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 58f:	01 81 00 00 00 03    	add    DWORD PTR [ecx+0x3000000],eax
 595:	91                   	xchg   ecx,eax
 596:	db 7d 14             	fstp   TBYTE PTR [ebp+0x14]
 599:	7d 00                	jge    59b <execInternalCommand-0x30ffa65>
 59b:	00 00                	add    BYTE PTR [eax],al
 59d:	01 70 01             	add    DWORD PTR [eax+0x1],esi
 5a0:	4f                   	dec    edi
 5a1:	00 00                	add    BYTE PTR [eax],al
 5a3:	00 02                	add    BYTE PTR [edx],al
 5a5:	91                   	xchg   ecx,eax
 5a6:	6c                   	ins    BYTE PTR es:[edi],dx
 5a7:	14 61                	adc    al,0x61
 5a9:	01 00                	add    DWORD PTR [eax],eax
 5ab:	00 01                	add    BYTE PTR [ecx],al
 5ad:	71 01                	jno    5b0 <execInternalCommand-0x30ffa50>
 5af:	40                   	inc    eax
 5b0:	06                   	push   es
 5b1:	00 00                	add    BYTE PTR [eax],al
 5b3:	03 91 97 6a 14 0d    	add    edx,DWORD PTR [ecx+0xd146a97]
 5b9:	03 00                	add    eax,DWORD PTR [eax]
 5bb:	00 01                	add    BYTE PTR [ecx],al
 5bd:	72 01                	jb     5c0 <execInternalCommand-0x30ffa40>
 5bf:	4f                   	dec    edi
 5c0:	00 00                	add    BYTE PTR [eax],al
 5c2:	00 02                	add    BYTE PTR [edx],al
 5c4:	91                   	xchg   ecx,eax
 5c5:	68 14 a0 02 00       	push   0x2a014
 5ca:	00 01                	add    BYTE PTR [ecx],al
 5cc:	73 01                	jae    5cf <execInternalCommand-0x30ffa31>
 5ce:	4f                   	dec    edi
 5cf:	00 00                	add    BYTE PTR [eax],al
 5d1:	00 02                	add    BYTE PTR [edx],al
 5d3:	91                   	xchg   ecx,eax
 5d4:	64                   	fs
 5d5:	14 19                	adc    al,0x19
 5d7:	03 00                	add    eax,DWORD PTR [eax]
 5d9:	00 01                	add    BYTE PTR [ecx],al
 5db:	74 01                	je     5de <execInternalCommand-0x30ffa22>
 5dd:	4f                   	dec    edi
 5de:	00 00                	add    BYTE PTR [eax],al
 5e0:	00 02                	add    BYTE PTR [edx],al
 5e2:	91                   	xchg   ecx,eax
 5e3:	60                   	pusha  
 5e4:	14 be                	adc    al,0xbe
 5e6:	02 00                	add    al,BYTE PTR [eax]
 5e8:	00 01                	add    BYTE PTR [ecx],al
 5ea:	75 01                	jne    5ed <execInternalCommand-0x30ffa13>
 5ec:	56                   	push   esi
 5ed:	06                   	push   es
 5ee:	00 00                	add    BYTE PTR [eax],al
 5f0:	03 91 83 6a 18 d6    	add    edx,DWORD PTR [ecx-0x29e7957d]
 5f6:	01 00                	add    DWORD PTR [eax],eax
 5f8:	00 01                	add    BYTE PTR [ecx],al
 5fa:	80 01 dd             	add    BYTE PTR [ecx],0xdd
 5fd:	09 10                	or     DWORD PTR [eax],edx
 5ff:	03 18                	add    ebx,DWORD PTR [eax]
 601:	44                   	inc    esp
 602:	03 00                	add    eax,DWORD PTR [eax]
 604:	00 01                	add    BYTE PTR [ecx],al
 606:	85 01                	test   DWORD PTR [ecx],eax
 608:	19 0a                	sbb    DWORD PTR [edx],ecx
 60a:	10 03                	adc    BYTE PTR [ebx],al
 60c:	18 00                	sbb    BYTE PTR [eax],al
 60e:	00 00                	add    BYTE PTR [eax],al
 610:	00 01                	add    BYTE PTR [ecx],al
 612:	d6                   	(bad)  
 613:	01 e7                	add    edi,esp
 615:	0a 10                	or     dl,BYTE PTR [eax]
 617:	03 0f                	add    ecx,DWORD PTR [edi]
 619:	dd 09                	fisttp QWORD PTR [ecx]
 61b:	10 03                	adc    BYTE PTR [ebx],al
 61d:	78 01                	js     620 <execInternalCommand-0x30ff9e0>
 61f:	00 00                	add    BYTE PTR [eax],al
 621:	15 69 00 01 d9       	adc    eax,0xd9010069
 626:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 629:	00 00                	add    BYTE PTR [eax],al
 62b:	02 91 5c 00 00 10    	add    dl,BYTE PTR [ecx+0x1000005c]
 631:	7a 00                	jp     633 <execInternalCommand-0x30ff9cd>
 633:	00 00                	add    BYTE PTR [eax],al
 635:	40                   	inc    eax
 636:	06                   	push   es
 637:	00 00                	add    BYTE PTR [eax],al
 639:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 63c:	00 00                	add    BYTE PTR [eax],al
 63e:	ff 00                	inc    DWORD PTR [eax]
 640:	10 7a 00             	adc    BYTE PTR [edx+0x0],bh
 643:	00 00                	add    BYTE PTR [eax],al
 645:	56                   	push   esi
 646:	06                   	push   es
 647:	00 00                	add    BYTE PTR [eax],al
 649:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 64c:	00 00                	add    BYTE PTR [eax],al
 64e:	31 11                	xor    DWORD PTR [ecx],edx
 650:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 653:	00 31                	add    BYTE PTR [ecx],dh
 655:	00 10                	add    BYTE PTR [eax],dl
 657:	7a 00                	jp     659 <execInternalCommand-0x30ff9a7>
 659:	00 00                	add    BYTE PTR [eax],al
 65b:	66 06                	pushw  es
 65d:	00 00                	add    BYTE PTR [eax],al
 65f:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 662:	00 00                	add    BYTE PTR [eax],al
 664:	13 00                	adc    eax,DWORD PTR [eax]
 666:	19 dc                	sbb    esp,ebx
 668:	02 00                	add    al,BYTE PTR [eax]
 66a:	00 05 33 8c 00 00    	add    BYTE PTR ds:0x8c33,al
 670:	00 05 03 28 16 10    	add    BYTE PTR ds:0x10162803,al
 676:	03 19                	add    ebx,DWORD PTR [ecx]
 678:	ed                   	in     eax,dx
 679:	01 00                	add    DWORD PTR [eax],eax
 67b:	00 05 34 8c 00 00    	add    BYTE PTR ds:0x8c34,al
 681:	00 05 03 2c 16 10    	add    BYTE PTR ds:0x10162c03,al
 687:	03 19                	add    ebx,DWORD PTR [ecx]
 689:	3e 00 00             	add    BYTE PTR ds:[eax],al
 68c:	00 05 35 8c 00 00    	add    BYTE PTR ds:0x8c35,al
 692:	00 05 03 24 16 10    	add    BYTE PTR ds:0x10162403,al
 698:	03 19                	add    ebx,DWORD PTR [ecx]
 69a:	99                   	cdq    
 69b:	02 00                	add    al,BYTE PTR [eax]
 69d:	00 06                	add    BYTE PTR [esi],al
 69f:	36                   	ss
 6a0:	9e                   	sahf   
 6a1:	00 00                	add    BYTE PTR [eax],al
 6a3:	00 05 03 38 16 10    	add    BYTE PTR ds:0x10163803,al
 6a9:	03 10                	add    edx,DWORD PTR [eax]
 6ab:	7a 00                	jp     6ad <execInternalCommand-0x30ff953>
 6ad:	00 00                	add    BYTE PTR [eax],al
 6af:	bb 06 00 00 1a       	mov    ebx,0x1a000006
 6b4:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 6b7:	00 ff                	add    bh,bh
 6b9:	01 00                	add    DWORD PTR [eax],eax
 6bb:	19 fe                	sbb    esi,edi
 6bd:	01 00                	add    DWORD PTR [eax],eax
 6bf:	00 04 20             	add    BYTE PTR [eax+eiz*1],al
 6c2:	aa                   	stos   BYTE PTR es:[edi],al
 6c3:	06                   	push   es
 6c4:	00 00                	add    BYTE PTR [eax],al
 6c6:	05 03 20 14 10       	add    eax,0x10142003
 6cb:	03 19                	add    ebx,DWORD PTR [ecx]
 6cd:	2d 01 00 00 04       	sub    eax,0x4000001
 6d2:	21 74 00 00          	and    DWORD PTR [eax+eax*1+0x0],esi
 6d6:	00 05 03 34 16 10    	add    BYTE PTR ds:0x10163403,al
 6dc:	03 10                	add    edx,DWORD PTR [eax]
 6de:	ed                   	in     eax,dx
 6df:	00 00                	add    BYTE PTR [eax],al
 6e1:	00 ed                	add    ch,ch
 6e3:	06                   	push   es
 6e4:	00 00                	add    BYTE PTR [eax],al
 6e6:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 6e9:	00 00                	add    BYTE PTR [eax],al
 6eb:	04 00                	add    al,0x0
 6ed:	19 ed                	sbb    ebp,ebp
 6ef:	02 00                	add    al,BYTE PTR [eax]
 6f1:	00 04 22             	add    BYTE PTR [edx+eiz*1],al
 6f4:	dd 06                	fld    QWORD PTR [esi]
 6f6:	00 00                	add    BYTE PTR [eax],al
 6f8:	05 03 c0 12 10       	add    eax,0x1012c003
 6fd:	03 1b                	add    ebx,DWORD PTR [ebx]
 6ff:	19 6a 01             	sbb    DWORD PTR [edx+0x1],ebp
 702:	00 00                	add    BYTE PTR [eax],al
 704:	04 29                	add    al,0x29
 706:	10 07                	adc    BYTE PTR [edi],al
 708:	00 00                	add    BYTE PTR [eax],al
 70a:	05 03 30 16 10       	add    eax,0x10163003
 70f:	03 05 04 fe 06 00    	add    eax,DWORD PTR ds:0x6fe04
 715:	00 1c 21             	add    BYTE PTR [ecx+eiz*1],bl
 718:	07                   	pop    es
 719:	00 00                	add    BYTE PTR [eax],al
 71b:	1d 74 00 00 00       	sbb    eax,0x74
 720:	00 19                	add    BYTE PTR [ecx],bl
 722:	bb 01 00 00 04       	mov    ebx,0x4000001
 727:	2a 32                	sub    dh,BYTE PTR [edx]
 729:	07                   	pop    es
 72a:	00 00                	add    BYTE PTR [eax],al
 72c:	05 03 20 16 10       	add    eax,0x10162003
 731:	03 05 04 16 07 00    	add    eax,DWORD PTR ds:0x71604
 737:	00 19                	add    BYTE PTR [ecx],bl
 739:	40                   	inc    eax
 73a:	01 00                	add    DWORD PTR [eax],eax
 73c:	00 01                	add    BYTE PTR [ecx],al
 73e:	12 97 00 00 00 05    	adc    dl,BYTE PTR [edi+0x5000000]
 744:	03 00                	add    eax,DWORD PTR [eax]
 746:	14 10                	adc    al,0x10
 748:	03 19                	add    ebx,DWORD PTR [ecx]
 74a:	74 02                	je     74e <execInternalCommand-0x30ff8b2>
 74c:	00 00                	add    BYTE PTR [eax],al
 74e:	01 13                	add    DWORD PTR [ebx],edx
 750:	8c 00                	mov    WORD PTR [eax],es
 752:	00 00                	add    BYTE PTR [eax],al
 754:	05 03 04 14 10       	add    eax,0x10140403
 759:	03 10                	add    edx,DWORD PTR [eax]
 75b:	7a 00                	jp     75d <execInternalCommand-0x30ff8a3>
 75d:	00 00                	add    BYTE PTR [eax],al
 75f:	6a 07                	push   0x7
 761:	00 00                	add    BYTE PTR [eax],al
 763:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 766:	00 00                	add    BYTE PTR [eax],al
 768:	05 00 19 10 02       	add    eax,0x2101900
 76d:	00 00                	add    BYTE PTR [eax],al
 76f:	01 14 5a             	add    DWORD PTR [edx+ebx*2],edx
 772:	07                   	pop    es
 773:	00 00                	add    BYTE PTR [eax],al
 775:	05 03 10 13 10       	add    eax,0x10131003
 77a:	03 00                	add    eax,DWORD PTR [eax]

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
  f0:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
  f6:	11 01                	adc    DWORD PTR [ecx],eax
  f8:	12 06                	adc    al,BYTE PTR [esi]
  fa:	40                   	inc    eax
  fb:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 101:	00 00                	add    BYTE PTR [eax],al
 103:	13 05 00 03 0e 3a    	adc    eax,DWORD PTR ds:0x3a0e0300
 109:	0b 3b                	or     edi,DWORD PTR [ebx]
 10b:	05 49 13 02 18       	add    eax,0x18021349
 110:	00 00                	add    BYTE PTR [eax],al
 112:	14 34                	adc    al,0x34
 114:	00 03                	add    BYTE PTR [ebx],al
 116:	0e                   	push   cs
 117:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 119:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 11f:	00 00                	add    BYTE PTR [eax],al
 121:	15 34 00 03 08       	adc    eax,0x8030034
 126:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 128:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 12e:	00 00                	add    BYTE PTR [eax],al
 130:	16                   	push   ss
 131:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 134:	19 03                	sbb    DWORD PTR [ebx],eax
 136:	0e                   	push   cs
 137:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 139:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 13f:	12 06                	adc    al,BYTE PTR [esi]
 141:	40                   	inc    eax
 142:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 148:	00 00                	add    BYTE PTR [eax],al
 14a:	17                   	pop    ss
 14b:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 14e:	19 03                	sbb    DWORD PTR [ebx],eax
 150:	08 3a                	or     BYTE PTR [edx],bh
 152:	0b 3b                	or     edi,DWORD PTR [ebx]
 154:	05 11 01 12 06       	add    eax,0x6120111
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
  14:	7f 0b                	jg     21 <execInternalCommand-0x30fffdf>
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	9a 02 00 00 02 00 bc 	call   0xbc00:0x2000002
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
  57:	00 2e                	add    BYTE PTR [esi],ch
  59:	2e                   	cs
  5a:	2f                   	das    
  5b:	6c                   	ins    BYTE PTR es:[edi],dx
  5c:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  63:	4f                   	dec    edi
  64:	53                   	push   ebx
  65:	2f                   	das    
  66:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  6d:	00 69 6e             	add    BYTE PTR [ecx+0x6e],ch
  70:	63 6c 75 64          	arpl   WORD PTR [ebp+esi*2+0x64],bp
  74:	65 00 00             	add    BYTE PTR gs:[eax],al
  77:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  7b:	6c                   	ins    BYTE PTR es:[edi],dx
  7c:	6c                   	ins    BYTE PTR es:[edi],dx
  7d:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
  80:	00 00                	add    BYTE PTR [eax],al
  82:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
  85:	64 69 6e 74 2d 67 63 	imul   ebp,DWORD PTR fs:[esi+0x74],0x6363672d
  8c:	63 
  8d:	2e                   	cs
  8e:	68 00 01 00 00       	push   0x100
  93:	74 69                	je     fe <execInternalCommand-0x30fff02>
  95:	6d                   	ins    DWORD PTR es:[edi],dx
  96:	65                   	gs
  97:	2e                   	cs
  98:	68 00 02 00 00       	push   0x200
  9d:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  a1:	6c                   	ins    BYTE PTR es:[edi],dx
  a2:	6c                   	ins    BYTE PTR es:[edi],dx
  a3:	2e                   	cs
  a4:	68 00 03 00 00       	push   0x300
  a9:	6d                   	ins    DWORD PTR es:[edi],dx
  aa:	61                   	popa   
  ab:	6c                   	ins    BYTE PTR es:[edi],dx
  ac:	6c                   	ins    BYTE PTR es:[edi],dx
  ad:	6f                   	outs   dx,DWORD PTR ds:[esi]
  ae:	63 2e                	arpl   WORD PTR [esi],bp
  b0:	68 00 02 00 00       	push   0x200
  b5:	6c                   	ins    BYTE PTR es:[edi],dx
  b6:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
  bd:	4f                   	dec    edi
  be:	53                   	push   ebx
  bf:	2e                   	cs
  c0:	68 00 02 00 00       	push   0x200
  c5:	00 00                	add    BYTE PTR [eax],al
  c7:	05 02 00 00 10       	add    eax,0x10000002
  cc:	03 03                	add    eax,DWORD PTR [ebx]
  ce:	1a 01                	sbb    al,BYTE PTR [ecx]
  d0:	75 08                	jne    da <execInternalCommand-0x30fff26>
  d2:	14 68                	adc    al,0x68
  d4:	4c                   	dec    esp
  d5:	08 21                	or     BYTE PTR [ecx],ah
  d7:	08 21                	or     BYTE PTR [ecx],ah
  d9:	08 13                	or     BYTE PTR [ebx],dl
  db:	03 0a                	add    ecx,DWORD PTR [edx]
  dd:	74 03                	je     e2 <execInternalCommand-0x30fff1e>
  df:	79 2e                	jns    10f <execInternalCommand-0x30ffef1>
  e1:	02 30                	add    dh,BYTE PTR [eax]
  e3:	19 2c 08             	sbb    DWORD PTR [eax+ecx*1],ebp
  e6:	30 69 75             	xor    BYTE PTR [ecx+0x75],ch
  e9:	d7                   	xlat   BYTE PTR ds:[ebx]
  ea:	d7                   	xlat   BYTE PTR ds:[ebx]
  eb:	4c                   	dec    esp
  ec:	08 3e                	or     BYTE PTR [esi],bh
  ee:	bc e6 ae 94 08       	mov    esp,0x894aee6
  f3:	2f                   	das    
  f4:	e5 93                	in     eax,0x93
  f6:	00 02                	add    BYTE PTR [edx],al
  f8:	04 02                	add    al,0x2
  fa:	06                   	push   es
  fb:	e4 00                	in     al,0x0
  fd:	02 04 04             	add    al,BYTE PTR [esp+eax*1]
 100:	e4 00                	in     al,0x0
 102:	02 04 05 e4 06 af 00 	add    al,BYTE PTR [eax*1+0xaf06e4]
 109:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 10c:	06                   	push   es
 10d:	e4 06                	in     al,0x6
 10f:	e5 02                	in     eax,0x2
 111:	23 13                	and    edx,DWORD PTR [ebx]
 113:	08 2f                	or     BYTE PTR [edi],ch
 115:	67 e3 34             	jcxz   14c <execInternalCommand-0x30ffeb4>
 118:	00 02                	add    BYTE PTR [edx],al
 11a:	04 02                	add    al,0x2
 11c:	02 23                	add    ah,BYTE PTR [ebx]
 11e:	14 00                	adc    al,0x0
 120:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
 123:	03 63 4a             	add    esp,DWORD PTR [ebx+0x4a]
 126:	00 02                	add    BYTE PTR [edx],al
 128:	04 01                	add    al,0x1
 12a:	06                   	push   es
 12b:	4a                   	dec    edx
 12c:	06                   	push   es
 12d:	03 1f                	add    ebx,DWORD PTR [edi]
 12f:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 132:	4b                   	dec    ebx
 133:	08 33                	or     BYTE PTR [ebx],dh
 135:	3d 5b 6a 92 02       	cmp    eax,0x2926a5b
 13a:	3b 14 69             	cmp    edx,DWORD PTR [ecx+ebp*2]
 13d:	00 02                	add    BYTE PTR [edx],al
 13f:	04 02                	add    al,0x2
 141:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 144:	00 02                	add    BYTE PTR [edx],al
 146:	04 01                	add    al,0x1
 148:	06                   	push   es
 149:	4a                   	dec    edx
 14a:	06                   	push   es
 14b:	03 0b                	add    ecx,DWORD PTR [ebx]
 14d:	66 59                	pop    cx
 14f:	32 69 75             	xor    ch,BYTE PTR [ecx+0x75]
 152:	75 75                	jne    1c9 <execInternalCommand-0x30ffe37>
 154:	75 75                	jne    1cb <execInternalCommand-0x30ffe35>
 156:	78 a1                	js     f9 <execInternalCommand-0x30fff07>
 158:	08 ec                	or     ah,ch
 15a:	00 02                	add    BYTE PTR [edx],al
 15c:	04 01                	add    al,0x1
 15e:	06                   	push   es
 15f:	66 06                	pushw  es
 161:	af                   	scas   eax,DWORD PTR es:[edi]
 162:	68 75 08 4c 67       	push   0x674c0875
 167:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 16a:	5a                   	pop    edx
 16b:	00 02                	add    BYTE PTR [edx],al
 16d:	04 01                	add    al,0x1
 16f:	06                   	push   es
 170:	9e                   	sahf   
 171:	00 02                	add    BYTE PTR [edx],al
 173:	04 02                	add    al,0x2
 175:	66                   	data16
 176:	00 02                	add    BYTE PTR [edx],al
 178:	04 03                	add    al,0x3
 17a:	66 06                	pushw  es
 17c:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 17d:	68 75 08 5a a0       	push   0xa05a0875
 182:	bc 68 a0 94 08       	mov    esp,0x894a068
 187:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 18a:	94                   	xchg   esp,eax
 18b:	08 33                	or     BYTE PTR [ebx],dh
 18d:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 192:	16                   	push   ss
 193:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 196:	03 3a                	add    edi,DWORD PTR [edx]
 198:	d6                   	(bad)  
 199:	68 d8 08 e7 08       	push   0x8e708d8
 19e:	13 d7                	adc    edx,edi
 1a0:	08 e5                	or     ch,ah
 1a2:	08 3e                	or     BYTE PTR [esi],bh
 1a4:	4b                   	dec    ebx
 1a5:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 1a8:	d9 d9                	(bad)  
 1aa:	d7                   	xlat   BYTE PTR ds:[ebx]
 1ab:	d7                   	xlat   BYTE PTR ds:[ebx]
 1ac:	3d 31 69 08 5f       	cmp    eax,0x5f086931
 1b1:	08 2f                	or     BYTE PTR [edi],ch
 1b3:	bb 68 02 22 13       	mov    ebx,0x13220268
 1b8:	02 2e                	add    ch,BYTE PTR [esi]
 1ba:	15 00 02 04 02       	adc    eax,0x2040200
 1bf:	03 79 02             	add    edi,DWORD PTR [ecx+0x2]
 1c2:	2c 01                	sub    al,0x1
 1c4:	00 02                	add    BYTE PTR [edx],al
 1c6:	04 01                	add    al,0x1
 1c8:	06                   	push   es
 1c9:	4a                   	dec    edx
 1ca:	06                   	push   es
 1cb:	03 09                	add    ecx,DWORD PTR [ecx]
 1cd:	9e                   	sahf   
 1ce:	3f                   	aas    
 1cf:	75 08                	jne    1d9 <execInternalCommand-0x30ffe27>
 1d1:	4c                   	dec    esp
 1d2:	00 02                	add    BYTE PTR [edx],al
 1d4:	04 03                	add    al,0x3
 1d6:	92                   	xchg   edx,eax
 1d7:	00 02                	add    BYTE PTR [edx],al
 1d9:	04 03                	add    al,0x3
 1db:	08 d7                	or     bh,dl
 1dd:	00 02                	add    BYTE PTR [edx],al
 1df:	04 03                	add    al,0x3
 1e1:	02 2b                	add    ch,BYTE PTR [ebx]
 1e3:	0f 00 02             	sldt   WORD PTR [edx]
 1e6:	04 01                	add    al,0x1
 1e8:	06                   	push   es
 1e9:	4a                   	dec    edx
 1ea:	06                   	push   es
 1eb:	87 3d 5b 67 00 02    	xchg   DWORD PTR ds:0x200675b,edi
 1f1:	04 03                	add    al,0x3
 1f3:	91                   	xchg   ecx,eax
 1f4:	00 02                	add    BYTE PTR [edx],al
 1f6:	04 03                	add    al,0x3
 1f8:	ff 00                	inc    DWORD PTR [eax]
 1fa:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 1fd:	06                   	push   es
 1fe:	4a                   	dec    edx
 1ff:	06                   	push   es
 200:	84 d7                	test   bh,dl
 202:	3f                   	aas    
 203:	91                   	xchg   ecx,eax
 204:	4b                   	dec    ebx
 205:	76 77                	jbe    27e <execInternalCommand-0x30ffd82>
 207:	08 bb 75 76 08 59    	or     BYTE PTR [ebx+0x59087675],bh
 20d:	30 08                	xor    BYTE PTR [eax],cl
 20f:	84 4b 68             	test   BYTE PTR [ebx+0x68],cl
 212:	68 08 e5 08 14       	push   0x1408e508
 217:	4b                   	dec    ebx
 218:	03 73 08             	add    esi,DWORD PTR [ebx+0x8]
 21b:	4a                   	dec    edx
 21c:	03 10                	add    edx,DWORD PTR [eax]
 21e:	66                   	data16
 21f:	02 24 14             	add    ah,BYTE PTR [esp+edx*1]
 222:	08 2f                	or     BYTE PTR [edi],ch
 224:	08 9f 68 af f6 08    	or     BYTE PTR [edi+0x8f6af68],bl
 22a:	30 08                	xor    BYTE PTR [eax],cl
 22c:	4b                   	dec    ebx
 22d:	d7                   	xlat   BYTE PTR ds:[ebx]
 22e:	3f                   	aas    
 22f:	92                   	xchg   edx,eax
 230:	08 bc ae 08 24 02 22 	or     BYTE PTR [esi+ebp*4+0x22022408],bh
 237:	13 31                	adc    esi,DWORD PTR [ecx]
 239:	93                   	xchg   ebx,eax
 23a:	08 ca                	or     dl,cl
 23c:	08 bd 9f 75 3f 67    	or     BYTE PTR [ebp+0x673f759f],bh
 242:	08 2f                	or     BYTE PTR [edi],ch
 244:	02 24 13             	add    ah,BYTE PTR [ebx+edx*1]
 247:	d7                   	xlat   BYTE PTR ds:[ebx]
 248:	3f                   	aas    
 249:	92                   	xchg   edx,eax
 24a:	75 76                	jne    2c2 <execInternalCommand-0x30ffd3e>
 24c:	75 75                	jne    2c3 <execInternalCommand-0x30ffd3d>
 24e:	77 59                	ja     2a9 <execInternalCommand-0x30ffd57>
 250:	75 08                	jne    25a <execInternalCommand-0x30ffda6>
 252:	4b                   	dec    ebx
 253:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 256:	5b                   	pop    ebx
 257:	5b                   	pop    ebx
 258:	75 75                	jne    2cf <execInternalCommand-0x30ffd31>
 25a:	08 83 08 4c 75 30    	or     BYTE PTR [ebx+0x30754c08],al
 260:	08 56 b1             	or     BYTE PTR [esi-0x4f],dl
 263:	ae                   	scas   al,BYTE PTR es:[edi]
 264:	03 0f                	add    ecx,DWORD PTR [edi]
 266:	66                   	data16
 267:	ae                   	scas   al,BYTE PTR es:[edi]
 268:	03 10                	add    edx,DWORD PTR [eax]
 26a:	82                   	(bad)  
 26b:	ae                   	scas   al,BYTE PTR es:[edi]
 26c:	68 f3 4d 30 af       	push   0xaf304df3
 271:	ae                   	scas   al,BYTE PTR es:[edi]
 272:	4b                   	dec    ebx
 273:	d7                   	xlat   BYTE PTR ds:[ebx]
 274:	03 0c 90             	add    ecx,DWORD PTR [eax+edx*4]
 277:	b2 08                	mov    dl,0x8
 279:	68 03 7a 58 03       	push   0x3587a03
 27e:	09 20                	or     DWORD PTR [eax],esp
 280:	ad                   	lods   eax,DWORD PTR ds:[esi]
 281:	59                   	pop    ecx
 282:	08 4c 08 21          	or     BYTE PTR [eax+ecx*1+0x21],cl
 286:	68 03 09 4a 02       	push   0x24a0903
 28b:	27                   	daa    
 28c:	13 03                	adc    eax,DWORD PTR [ebx]
 28e:	96                   	xchg   esi,eax
 28f:	7f 66                	jg     2f7 <execInternalCommand-0x30ffd09>
 291:	03 ed                	add    ebp,ebp
 293:	00 08                	add    BYTE PTR [eax],cl
 295:	20 08                	and    BYTE PTR [eax],cl
 297:	13 59 02             	adc    ebx,DWORD PTR [ecx+0x2]
 29a:	02 00                	add    al,BYTE PTR [eax]
 29c:	01 01                	add    DWORD PTR [ecx],eax

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
  1e:	00 2f                	add    BYTE PTR [edi],ch
  20:	68 6f 6d 65 2f       	push   0x2f656d6f
  25:	79 6f                	jns    96 <execInternalCommand-0x30fff6a>
  27:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  2e:	6f                   	outs   dx,DWORD PTR ds:[esi]
  2f:	73 2f                	jae    60 <execInternalCommand-0x30fffa0>
  31:	61                   	popa   
  32:	70 72                	jo     a6 <execInternalCommand-0x30fff5a>
  34:	6f                   	outs   dx,DWORD PTR ds:[esi]
  35:	6a 2f                	push   0x2f
  37:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  3b:	6c                   	ins    BYTE PTR es:[edi],dx
  3c:	6c                   	ins    BYTE PTR es:[edi],dx
  3d:	00 68 65             	add    BYTE PTR [eax+0x65],ch
  40:	61                   	popa   
  41:	70 45                	jo     88 <execInternalCommand-0x30fff78>
  43:	6e                   	outs   dx,BYTE PTR ds:[esi]
  44:	64 00 6b 45          	add    BYTE PTR fs:[ebx+0x45],ch
  48:	78 69                	js     b3 <execInternalCommand-0x30fff4d>
  4a:	74 00                	je     4c <execInternalCommand-0x30fffb4>
  4c:	64                   	fs
  4d:	65                   	gs
  4e:	73 63                	jae    b3 <execInternalCommand-0x30fff4d>
  50:	72 69                	jb     bb <execInternalCommand-0x30fff45>
  52:	70 74                	jo     c8 <execInternalCommand-0x30fff38>
  54:	69 6f 6e 00 74 65 6d 	imul   ebp,DWORD PTR [edi+0x6e],0x6d657400
  5b:	70 00                	jo     5d <execInternalCommand-0x30fffa3>
  5d:	70 61                	jo     c0 <execInternalCommand-0x30fff40>
  5f:	72 73                	jb     d4 <execInternalCommand-0x30fff2c>
  61:	65                   	gs
  62:	50                   	push   eax
  63:	61                   	popa   
  64:	72 61                	jb     c7 <execInternalCommand-0x30fff39>
  66:	6d                   	ins    DWORD PTR es:[edi],dx
  67:	73 53                	jae    bc <execInternalCommand-0x30fff44>
  69:	68 65 6c 6c 00       	push   0x6c6c65
  6e:	69 6e 70 75 74 00 73 	imul   ebp,DWORD PTR [esi+0x70],0x73007475
  75:	69 7a 65 74 79 70 65 	imul   edi,DWORD PTR [edx+0x65],0x65707974
  7c:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
  80:	72 72                	jb     f4 <execInternalCommand-0x30fff0c>
  82:	4b                   	dec    ebx
  83:	65                   	gs
  84:	79 43                	jns    c9 <execInternalCommand-0x30fff37>
  86:	6f                   	outs   dx,DWORD PTR ds:[esi]
  87:	75 6e                	jne    f7 <execInternalCommand-0x30fff09>
  89:	74 00                	je     8b <execInternalCommand-0x30fff75>
  8b:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  8e:	6d                   	ins    DWORD PTR es:[edi],dx
  8f:	61                   	popa   
  90:	6e                   	outs   dx,BYTE PTR ds:[esi]
  91:	64                   	fs
  92:	5f                   	pop    edi
  93:	74 61                	je     f6 <execInternalCommand-0x30fff0a>
  95:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
  99:	74 00                	je     9b <execInternalCommand-0x30fff65>
  9b:	70 61                	jo     fe <execInternalCommand-0x30fff02>
  9d:	72 73                	jb     112 <execInternalCommand-0x30ffeee>
  9f:	65                   	gs
  a0:	64                   	fs
  a1:	43                   	inc    ebx
  a2:	68 61 72 73 00       	push   0x737261
  a7:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
  aa:	6c                   	ins    BYTE PTR es:[edi],dx
  ab:	69 6e 65 00 70 70 74 	imul   ebp,DWORD PTR [esi+0x65],0x74707000
  b2:	72 00                	jb     b4 <execInternalCommand-0x30fff4c>
  b4:	47                   	inc    edi
  b5:	4e                   	dec    esi
  b6:	55                   	push   ebp
  b7:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  ba:	39 20                	cmp    DWORD PTR [eax],esp
  bc:	35 2e 33 2e 30       	xor    eax,0x302e332e
  c1:	20 2d 6d 61 73 6d    	and    BYTE PTR ds:0x6d73616d,ch
  c7:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  cc:	6c                   	ins    BYTE PTR es:[edi],dx
  cd:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  d3:	65                   	gs
  d4:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  d9:	72 69                	jb     144 <execInternalCommand-0x30ffebc>
  db:	63 20                	arpl   WORD PTR [eax],sp
  dd:	2d 6d 61 72 63       	sub    eax,0x6372616d
  e2:	68 3d 70 65 6e       	push   0x6e65703d
  e7:	74 69                	je     152 <execInternalCommand-0x30ffeae>
  e9:	75 6d                	jne    158 <execInternalCommand-0x30ffea8>
  eb:	70 72                	jo     15f <execInternalCommand-0x30ffea1>
  ed:	6f                   	outs   dx,DWORD PTR ds:[esi]
  ee:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  f4:	74 64                	je     15a <execInternalCommand-0x30ffea6>
  f6:	3d 63 39 39 20       	cmp    eax,0x20393963
  fb:	2d 66 66 72 65       	sub    eax,0x65726666
 100:	65                   	gs
 101:	73 74                	jae    177 <execInternalCommand-0x30ffe89>
 103:	61                   	popa   
 104:	6e                   	outs   dx,BYTE PTR ds:[esi]
 105:	64 69 6e 67 00 65 78 	imul   ebp,DWORD PTR fs:[esi+0x67],0x65786500
 10c:	65 
 10d:	63 50 61             	arpl   WORD PTR [eax+0x61],dx
 110:	72 61                	jb     173 <execInternalCommand-0x30ffe8d>
 112:	6d                   	ins    DWORD PTR es:[edi],dx
 113:	43                   	inc    ebx
 114:	6f                   	outs   dx,DWORD PTR ds:[esi]
 115:	75 6e                	jne    185 <execInternalCommand-0x30ffe7b>
 117:	74 00                	je     119 <execInternalCommand-0x30ffee7>
 119:	65                   	gs
 11a:	78 65                	js     181 <execInternalCommand-0x30ffe7f>
 11c:	63 49 6e             	arpl   WORD PTR [ecx+0x6e],cx
 11f:	74 65                	je     186 <execInternalCommand-0x30ffe7a>
 121:	72 6e                	jb     191 <execInternalCommand-0x30ffe6f>
 123:	61                   	popa   
 124:	6c                   	ins    BYTE PTR es:[edi],dx
 125:	43                   	inc    ebx
 126:	6f                   	outs   dx,DWORD PTR ds:[esi]
 127:	6d                   	ins    DWORD PTR es:[edi],dx
 128:	6d                   	ins    DWORD PTR es:[edi],dx
 129:	61                   	popa   
 12a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 12b:	64 00 73 4b          	add    BYTE PTR fs:[ebx+0x4b],dh
 12f:	53                   	push   ebx
 130:	68 65 6c 6c 50       	push   0x506c6c65
 135:	72 6f                	jb     1a6 <execInternalCommand-0x30ffe5a>
 137:	67 72 61             	addr16 jb 19b <execInternalCommand-0x30ffe65>
 13a:	6d                   	ins    DWORD PTR es:[edi],dx
 13b:	4e                   	dec    esi
 13c:	61                   	popa   
 13d:	6d                   	ins    DWORD PTR es:[edi],dx
 13e:	65 00 74 69 6d       	add    BYTE PTR gs:[ecx+ebp*2+0x6d],dh
 143:	65                   	gs
 144:	54                   	push   esp
 145:	6f                   	outs   dx,DWORD PTR ds:[esi]
 146:	45                   	inc    ebp
 147:	78 69                	js     1b2 <execInternalCommand-0x30ffe4e>
 149:	74 00                	je     14b <execInternalCommand-0x30ffeb5>
 14b:	64                   	fs
 14c:	71 75                	jno    1c3 <execInternalCommand-0x30ffe3d>
 14e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 14f:	74 65                	je     1b6 <execInternalCommand-0x30ffe4a>
 151:	00 74 69 6d          	add    BYTE PTR [ecx+ebp*2+0x6d],dh
 155:	65                   	gs
 156:	5f                   	pop    edi
 157:	74 00                	je     159 <execInternalCommand-0x30ffea7>
 159:	75 69                	jne    1c4 <execInternalCommand-0x30ffe3c>
 15b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 15c:	74 38                	je     196 <execInternalCommand-0x30ffe6a>
 15e:	5f                   	pop    edi
 15f:	74 00                	je     161 <execInternalCommand-0x30ffe9f>
 161:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 164:	6d                   	ins    DWORD PTR es:[edi],dx
 165:	61                   	popa   
 166:	6e                   	outs   dx,BYTE PTR ds:[esi]
 167:	64                   	fs
 168:	73 00                	jae    16a <execInternalCommand-0x30ffe96>
 16a:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 16d:	6d                   	ins    DWORD PTR es:[edi],dx
 16e:	61                   	popa   
 16f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 170:	64                   	fs
 171:	5f                   	pop    edi
 172:	66                   	data16
 173:	75 6e                	jne    1e3 <execInternalCommand-0x30ffe1d>
 175:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 179:	6e                   	outs   dx,BYTE PTR ds:[esi]
 17a:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
 17d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 17e:	72 74                	jb     1f4 <execInternalCommand-0x30ffe0c>
 180:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 183:	74 00                	je     185 <execInternalCommand-0x30ffe7b>
 185:	66                   	data16
 186:	72 65                	jb     1ed <execInternalCommand-0x30ffe13>
 188:	65                   	gs
 189:	41                   	inc    ecx
 18a:	72 67                	jb     1f3 <execInternalCommand-0x30ffe0d>
 18c:	56                   	push   esi
 18d:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 190:	72 61                	jb     1f3 <execInternalCommand-0x30ffe0d>
 192:	6d                   	ins    DWORD PTR es:[edi],dx
 193:	43                   	inc    ebx
 194:	6f                   	outs   dx,DWORD PTR ds:[esi]
 195:	75 6e                	jne    205 <execInternalCommand-0x30ffdfb>
 197:	74 00                	je     199 <execInternalCommand-0x30ffe67>
 199:	70 63                	jo     1fe <execInternalCommand-0x30ffe02>
 19b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 19c:	75 6e                	jne    20c <execInternalCommand-0x30ffdf4>
 19e:	74 00                	je     1a0 <execInternalCommand-0x30ffe60>
 1a0:	6c                   	ins    BYTE PTR es:[edi],dx
 1a1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1a2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1a3:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 1a7:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1a8:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 1ac:	74 00                	je     1ae <execInternalCommand-0x30ffe52>
 1ae:	70 61                	jo     211 <execInternalCommand-0x30ffdef>
 1b0:	72 61                	jb     213 <execInternalCommand-0x30ffded>
 1b2:	6d                   	ins    DWORD PTR es:[edi],dx
 1b3:	73 54                	jae    209 <execInternalCommand-0x30ffdf7>
 1b5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1b6:	41                   	inc    ecx
 1b7:	72 67                	jb     220 <execInternalCommand-0x30ffde0>
 1b9:	76 00                	jbe    1bb <execInternalCommand-0x30ffe45>
 1bb:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 1be:	6d                   	ins    DWORD PTR es:[edi],dx
 1bf:	61                   	popa   
 1c0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1c1:	64                   	fs
 1c2:	5f                   	pop    edi
 1c3:	66                   	data16
 1c4:	75 6e                	jne    234 <execInternalCommand-0x30ffdcc>
 1c6:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 1ca:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1cb:	5f                   	pop    edi
 1cc:	70 00                	jo     1ce <execInternalCommand-0x30ffe32>
 1ce:	62 73 71             	bound  esi,QWORD PTR [ebx+0x71]
 1d1:	75 6f                	jne    242 <execInternalCommand-0x30ffdbe>
 1d3:	74 65                	je     23a <execInternalCommand-0x30ffdc6>
 1d5:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 1d8:	74 41                	je     21b <execInternalCommand-0x30ffde5>
 1da:	43                   	inc    ebx
 1db:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1dc:	6d                   	ins    DWORD PTR es:[edi],dx
 1dd:	6d                   	ins    DWORD PTR es:[edi],dx
 1de:	61                   	popa   
 1df:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1e0:	64 00 62 61          	add    BYTE PTR fs:[edx+0x61],ah
 1e4:	63 6b 67             	arpl   WORD PTR [ebx+0x67],bp
 1e7:	72 6f                	jb     258 <execInternalCommand-0x30ffda8>
 1e9:	75 6e                	jne    259 <execInternalCommand-0x30ffda7>
 1eb:	64 00 68 65          	add    BYTE PTR fs:[eax+0x65],ch
 1ef:	61                   	popa   
 1f0:	70 43                	jo     235 <execInternalCommand-0x30ffdcb>
 1f2:	75 72                	jne    266 <execInternalCommand-0x30ffd9a>
 1f4:	72 00                	jb     1f6 <execInternalCommand-0x30ffe0a>
 1f6:	6d                   	ins    DWORD PTR es:[edi],dx
 1f7:	61                   	popa   
 1f8:	78 61                	js     25b <execInternalCommand-0x30ffda5>
 1fa:	72 67                	jb     263 <execInternalCommand-0x30ffd9d>
 1fc:	63 00                	arpl   WORD PTR [eax],ax
 1fe:	73 45                	jae    245 <execInternalCommand-0x30ffdbb>
 200:	78 65                	js     267 <execInternalCommand-0x30ffd99>
 202:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 205:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
 20c:	72 61                	jb     26f <execInternalCommand-0x30ffd91>
 20e:	6d                   	ins    DWORD PTR es:[edi],dx
 20f:	00 64 65 6c          	add    BYTE PTR [ebp+eiz*2+0x6c],ah
 213:	69 6d 00 70 61 72 61 	imul   ebp,DWORD PTR [ebp+0x0],0x61726170
 21a:	6d                   	ins    DWORD PTR es:[edi],dx
 21b:	73 00                	jae    21d <execInternalCommand-0x30ffde3>
 21d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 21e:	61                   	popa   
 21f:	6d                   	ins    DWORD PTR es:[edi],dx
 220:	65 00 6e 65          	add    BYTE PTR gs:[esi+0x65],ch
 224:	65                   	gs
 225:	64                   	fs
 226:	44                   	inc    esp
 227:	6f                   	outs   dx,DWORD PTR ds:[esi]
 228:	75 62                	jne    28c <execInternalCommand-0x30ffd74>
 22a:	6c                   	ins    BYTE PTR es:[edi],dx
 22b:	65                   	gs
 22c:	51                   	push   ecx
 22d:	75 6f                	jne    29e <execInternalCommand-0x30ffd62>
 22f:	74 65                	je     296 <execInternalCommand-0x30ffd6a>
 231:	74 6f                	je     2a2 <execInternalCommand-0x30ffd5e>
 233:	45                   	inc    ebp
 234:	6e                   	outs   dx,BYTE PTR ds:[esi]
 235:	64                   	fs
 236:	50                   	push   eax
 237:	61                   	popa   
 238:	72 61                	jb     29b <execInternalCommand-0x30ffd65>
 23a:	6d                   	ins    DWORD PTR es:[edi],dx
 23b:	00 75 6e             	add    BYTE PTR [ebp+0x6e],dh
 23e:	73 69                	jae    2a9 <execInternalCommand-0x30ffd57>
 240:	67 6e                	outs   dx,BYTE PTR ds:[si]
 242:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 247:	61                   	popa   
 248:	72 00                	jb     24a <execInternalCommand-0x30ffdb6>
 24a:	6c                   	ins    BYTE PTR es:[edi],dx
 24b:	6f                   	outs   dx,DWORD PTR ds:[esi]
 24c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 24d:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 251:	6e                   	outs   dx,BYTE PTR ds:[esi]
 252:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 256:	73 69                	jae    2c1 <execInternalCommand-0x30ffd3f>
 258:	67 6e                	outs   dx,BYTE PTR ds:[si]
 25a:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 25f:	74 00                	je     261 <execInternalCommand-0x30ffd9f>
 261:	75 69                	jne    2cc <execInternalCommand-0x30ffd34>
 263:	6e                   	outs   dx,BYTE PTR ds:[esi]
 264:	74 33                	je     299 <execInternalCommand-0x30ffd67>
 266:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 269:	00 62 75             	add    BYTE PTR [edx+0x75],ah
 26c:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 273:	00 
 274:	65                   	gs
 275:	78 69                	js     2e0 <execInternalCommand-0x30ffd20>
 277:	74 43                	je     2bc <execInternalCommand-0x30ffd44>
 279:	6f                   	outs   dx,DWORD PTR ds:[esi]
 27a:	64 65 00 73 68       	fs add BYTE PTR fs:gs:[ebx+0x68],dh
 27f:	6f                   	outs   dx,DWORD PTR ds:[esi]
 280:	72 74                	jb     2f6 <execInternalCommand-0x30ffd0a>
 282:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 285:	73 69                	jae    2f0 <execInternalCommand-0x30ffd10>
 287:	67 6e                	outs   dx,BYTE PTR ds:[si]
 289:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 28e:	74 00                	je     290 <execInternalCommand-0x30ffd70>
 290:	6c                   	ins    BYTE PTR es:[edi],dx
 291:	43                   	inc    ebx
 292:	75 72                	jne    306 <execInternalCommand-0x30ffcfa>
 294:	72 4b                	jb     2e1 <execInternalCommand-0x30ffd1f>
 296:	65                   	gs
 297:	79 00                	jns    299 <execInternalCommand-0x30ffd67>
 299:	6c                   	ins    BYTE PTR es:[edi],dx
 29a:	69 62 63 54 5a 00 63 	imul   esp,DWORD PTR [edx+0x63],0x63005a54
 2a1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2a2:	6d                   	ins    DWORD PTR es:[edi],dx
 2a3:	6d                   	ins    DWORD PTR es:[edi],dx
 2a4:	61                   	popa   
 2a5:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2a6:	64                   	fs
 2a7:	42                   	inc    edx
 2a8:	75 66                	jne    310 <execInternalCommand-0x30ffcf0>
 2aa:	66 50                	push   ax
 2ac:	74 72                	je     320 <execInternalCommand-0x30ffce0>
 2ae:	00 5f 42             	add    BYTE PTR [edi+0x42],bl
 2b1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2b2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2b3:	6c                   	ins    BYTE PTR es:[edi],dx
 2b4:	00 6b 73             	add    BYTE PTR [ebx+0x73],ch
 2b7:	68 65 6c 6c 2e       	push   0x2e6c6c65
 2bc:	63 00                	arpl   WORD PTR [eax],ax
 2be:	61                   	popa   
 2bf:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2c0:	73 69                	jae    32b <execInternalCommand-0x30ffcd5>
 2c2:	53                   	push   ebx
 2c3:	65                   	gs
 2c4:	71 00                	jno    2c6 <execInternalCommand-0x30ffd3a>
 2c6:	65                   	gs
 2c7:	78 65                	js     32e <execInternalCommand-0x30ffcd2>
 2c9:	63 70 00             	arpl   WORD PTR [eax+0x0],si
 2cc:	70 72                	jo     340 <execInternalCommand-0x30ffcc0>
 2ce:	6d                   	ins    DWORD PTR es:[edi],dx
 2cf:	73 00                	jae    2d1 <execInternalCommand-0x30ffd2f>
 2d1:	73 69                	jae    33c <execInternalCommand-0x30ffcc4>
 2d3:	7a 65                	jp     33a <execInternalCommand-0x30ffcc6>
 2d5:	00 6e 61             	add    BYTE PTR [esi+0x61],ch
 2d8:	72 67                	jb     341 <execInternalCommand-0x30ffcbf>
 2da:	76 00                	jbe    2dc <execInternalCommand-0x30ffd24>
 2dc:	68 65 61 70 42       	push   0x42706165
 2e1:	61                   	popa   
 2e2:	73 65                	jae    349 <execInternalCommand-0x30ffcb7>
 2e4:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 2e7:	64                   	fs
 2e8:	4c                   	dec    esp
 2e9:	69 6e 65 00 63 6d 64 	imul   ebp,DWORD PTR [esi+0x65],0x646d6300
 2f0:	73 00                	jae    2f2 <execInternalCommand-0x30ffd0e>
 2f2:	66 69 6e 64 43 6f    	imul   bp,WORD PTR [esi+0x64],0x6f43
 2f8:	6d                   	ins    DWORD PTR es:[edi],dx
 2f9:	6d                   	ins    DWORD PTR es:[edi],dx
 2fa:	61                   	popa   
 2fb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2fc:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 300:	70 79                	jo     37b <execInternalCommand-0x30ffc85>
 302:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 305:	00 6b 53             	add    BYTE PTR [ebx+0x53],ch
 308:	6c                   	ins    BYTE PTR es:[edi],dx
 309:	65                   	gs
 30a:	65                   	gs
 30b:	70 00                	jo     30d <execInternalCommand-0x30ffcf3>
 30d:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 310:	6d                   	ins    DWORD PTR es:[edi],dx
 311:	61                   	popa   
 312:	6e                   	outs   dx,BYTE PTR ds:[esi]
 313:	64                   	fs
 314:	73 50                	jae    366 <execInternalCommand-0x30ffc9a>
 316:	74 72                	je     38a <execInternalCommand-0x30ffc76>
 318:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 31b:	6d                   	ins    DWORD PTR es:[edi],dx
 31c:	6d                   	ins    DWORD PTR es:[edi],dx
 31d:	61                   	popa   
 31e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31f:	64                   	fs
 320:	57                   	push   edi
 321:	61                   	popa   
 322:	73 46                	jae    36a <execInternalCommand-0x30ffc96>
 324:	72 6f                	jb     395 <execInternalCommand-0x30ffc6b>
 326:	6d                   	ins    DWORD PTR es:[edi],dx
 327:	54                   	push   esp
 328:	68 69 73 42 75       	push   0x75427369
 32d:	66                   	data16
 32e:	66                   	data16
 32f:	65                   	gs
 330:	72 50                	jb     382 <execInternalCommand-0x30ffc7e>
 332:	74 72                	je     3a6 <execInternalCommand-0x30ffc5a>
 334:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 337:	6d                   	ins    DWORD PTR es:[edi],dx
 338:	6d                   	ins    DWORD PTR es:[edi],dx
 339:	61                   	popa   
 33a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 33b:	64 00 6b 53          	add    BYTE PTR fs:[ebx+0x53],ch
 33f:	68 65 6c 6c 00       	push   0x6c6c65
 344:	67                   	addr16
 345:	65                   	gs
 346:	74 41                	je     389 <execInternalCommand-0x30ffc77>
 348:	4b                   	dec    ebx
 349:	65                   	gs
 34a:	79 00                	jns    34c <execInternalCommand-0x30ffcb4>

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
