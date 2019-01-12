
Debug/GNU-Linux/kshell:     file format elf32-i386


Disassembly of section .text:

03100000 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/aproj/kshell/kshell.c:29
void execInternalCommand(char lCommand[256]);
int findCommand(char* command);
char **buildargv (const char *input);

void execInternalCommand(char lCommand[256])
{
 3100000:	55                   	push   ebp
 3100001:	89 e5                	mov    ebp,esp
 3100003:	53                   	push   ebx
 3100004:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/kshell.c:30
    int i = findCommand(lCommand);
 3100007:	83 ec 0c             	sub    esp,0xc
 310000a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310000d:	e8 42 02 00 00       	call   3100254 <findCommand>
 3100012:	83 c4 10             	add    esp,0x10
 3100015:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/kshell.c:32

    if(i>0)
 3100018:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 310001c:	7e 74                	jle    3100092 <execInternalCommand+0x92>
/home/yogi/src/os/aproj/kshell/kshell.c:34
    {
        i--;
 310001e:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:36
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 3100022:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100025:	c1 e0 04             	shl    eax,0x4
 3100028:	05 c8 14 10 03       	add    eax,0x31014c8
 310002d:	8b 00                	mov    eax,DWORD PTR [eax]
 310002f:	a3 30 12 11 03       	mov    ds:0x3111230,eax
/home/yogi/src/os/aproj/kshell/kshell.c:37
        command_function_p = cmds[i].function;
 3100034:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100037:	c1 e0 04             	shl    eax,0x4
 310003a:	05 c8 14 10 03       	add    eax,0x31014c8
 310003f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100041:	a3 20 12 11 03       	mov    ds:0x3111220,eax
/home/yogi/src/os/aproj/kshell/kshell.c:38
        if (cmds[i].paramCount==0)
 3100046:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100049:	c1 e0 04             	shl    eax,0x4
 310004c:	05 cc 14 10 03       	add    eax,0x31014cc
 3100051:	8b 00                	mov    eax,DWORD PTR [eax]
 3100053:	85 c0                	test   eax,eax
 3100055:	75 09                	jne    3100060 <execInternalCommand+0x60>
/home/yogi/src/os/aproj/kshell/kshell.c:39
            command_function();
 3100057:	a1 30 12 11 03       	mov    eax,ds:0x3111230
 310005c:	ff d0                	call   eax
/home/yogi/src/os/aproj/kshell/kshell.c:49
    }
    else
    {
        print("\tInvalid command '%s' ya dummy!\n",lCommand);
    }
}
 310005e:	eb 45                	jmp    31000a5 <execInternalCommand+0xa5>
/home/yogi/src/os/aproj/kshell/kshell.c:42
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
 3100060:	8b 1d 20 12 11 03    	mov    ebx,DWORD PTR ds:0x3111220
 3100066:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100069:	c1 e0 04             	shl    eax,0x4
 310006c:	05 c0 14 10 03       	add    eax,0x31014c0
 3100071:	8b 00                	mov    eax,DWORD PTR [eax]
 3100073:	83 ec 0c             	sub    esp,0xc
 3100076:	50                   	push   eax
 3100077:	e8 94 0d 00 00       	call   3100e10 <kShell+0x421>
 310007c:	83 c4 10             	add    esp,0x10
 310007f:	8d 50 01             	lea    edx,[eax+0x1]
 3100082:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100085:	01 d0                	add    eax,edx
 3100087:	83 ec 0c             	sub    esp,0xc
 310008a:	50                   	push   eax
 310008b:	ff d3                	call   ebx
 310008d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:49
    }
    else
    {
        print("\tInvalid command '%s' ya dummy!\n",lCommand);
    }
}
 3100090:	eb 13                	jmp    31000a5 <execInternalCommand+0xa5>
/home/yogi/src/os/aproj/kshell/kshell.c:47
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
        }
    }
    else
    {
        print("\tInvalid command '%s' ya dummy!\n",lCommand);
 3100092:	83 ec 08             	sub    esp,0x8
 3100095:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100098:	68 b0 0e 10 03       	push   0x3100eb0
 310009d:	e8 ae 0c 00 00       	call   3100d50 <kShell+0x361>
 31000a2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:49
    }
}
 31000a5:	90                   	nop
 31000a6:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31000a9:	c9                   	leave  
 31000aa:	c3                   	ret    

031000ab <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/aproj/kshell/kshell.c:52

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 31000ab:	55                   	push   ebp
 31000ac:	89 e5                	mov    ebp,esp
 31000ae:	53                   	push   ebx
 31000af:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/aproj/kshell/kshell.c:53
    int x=0,y=0;
 31000b2:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31000b9:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:54
    int lRetVal=0,parsedChars=0;
 31000c0:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 31000c7:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:55
    bool needDoubleQuotetoEndParam=0;
 31000ce:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:57
    
    memset(params,0, size);
 31000d2:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 31000d5:	83 ec 04             	sub    esp,0x4
 31000d8:	50                   	push   eax
 31000d9:	6a 00                	push   0x0
 31000db:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31000de:	e8 0d 0d 00 00       	call   3100df0 <kShell+0x401>
 31000e3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:59
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 31000e6:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
 31000ed:	e9 24 01 00 00       	jmp    3100216 <parseParamsShell+0x16b>
/home/yogi/src/os/aproj/kshell/kshell.c:61
    {
        if(cmdLine[cnt]=='"')
 31000f2:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31000f5:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31000f8:	01 d0                	add    eax,edx
 31000fa:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31000fd:	3c 22                	cmp    al,0x22
 31000ff:	75 41                	jne    3100142 <parseParamsShell+0x97>
/home/yogi/src/os/aproj/kshell/kshell.c:63
        {
            if (!needDoubleQuotetoEndParam)
 3100101:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100105:	83 f0 01             	xor    eax,0x1
 3100108:	84 c0                	test   al,al
 310010a:	74 09                	je     3100115 <parseParamsShell+0x6a>
/home/yogi/src/os/aproj/kshell/kshell.c:65
            {
                needDoubleQuotetoEndParam=true;
 310010c:	c6 45 e7 01          	mov    BYTE PTR [ebp-0x19],0x1
 3100110:	e9 f9 00 00 00       	jmp    310020e <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/kshell.c:69
            }
            else
            {
                params[y][x]='\0';
 3100115:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100118:	c1 e0 07             	shl    eax,0x7
 310011b:	89 c2                	mov    edx,eax
 310011d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100120:	01 c2                	add    edx,eax
 3100122:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100125:	01 d0                	add    eax,edx
 3100127:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:70
                {x=0;y++;lRetVal++;}
 310012a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100131:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 3100135:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:71
                needDoubleQuotetoEndParam=false;
 3100139:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
 310013d:	e9 cc 00 00 00       	jmp    310020e <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/kshell.c:74
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
 3100142:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100145:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100148:	01 d0                	add    eax,edx
 310014a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310014d:	3c 20                	cmp    al,0x20
 310014f:	74 1e                	je     310016f <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/kshell.c:74 (discriminator 2)
 3100151:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100154:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100157:	01 d0                	add    eax,edx
 3100159:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310015c:	3c 2d                	cmp    al,0x2d
 310015e:	74 0f                	je     310016f <parseParamsShell+0xc4>
/home/yogi/src/os/aproj/kshell/kshell.c:74 (discriminator 4)
 3100160:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100163:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100166:	01 d0                	add    eax,edx
 3100168:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310016b:	3c 2c                	cmp    al,0x2c
 310016d:	75 7a                	jne    31001e9 <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/kshell.c:74 (discriminator 5)
 310016f:	0f b6 45 e7          	movzx  eax,BYTE PTR [ebp-0x19]
 3100173:	83 f0 01             	xor    eax,0x1
 3100176:	84 c0                	test   al,al
 3100178:	74 6f                	je     31001e9 <parseParamsShell+0x13e>
/home/yogi/src/os/aproj/kshell/kshell.c:77
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 310017a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310017d:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100180:	01 d0                	add    eax,edx
 3100182:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100185:	3c 2d                	cmp    al,0x2d
 3100187:	74 0f                	je     3100198 <parseParamsShell+0xed>
/home/yogi/src/os/aproj/kshell/kshell.c:77 (discriminator 1)
 3100189:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310018c:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 310018f:	01 d0                	add    eax,edx
 3100191:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100194:	3c 2f                	cmp    al,0x2f
 3100196:	75 25                	jne    31001bd <parseParamsShell+0x112>
/home/yogi/src/os/aproj/kshell/kshell.c:78
                params[y][x++]=cmdLine[cnt];
 3100198:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310019b:	c1 e0 07             	shl    eax,0x7
 310019e:	89 c2                	mov    edx,eax
 31001a0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31001a3:	8d 0c 02             	lea    ecx,[edx+eax*1]
 31001a6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001a9:	8d 50 01             	lea    edx,[eax+0x1]
 31001ac:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31001af:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31001b2:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 31001b5:	01 da                	add    edx,ebx
 31001b7:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31001ba:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/kshell.c:79
            params[y][x]='\0';
 31001bd:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31001c0:	c1 e0 07             	shl    eax,0x7
 31001c3:	89 c2                	mov    edx,eax
 31001c5:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31001c8:	01 c2                	add    edx,eax
 31001ca:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001cd:	01 d0                	add    eax,edx
 31001cf:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:80
            if (cnt>0)
 31001d2:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 31001d6:	74 36                	je     310020e <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/kshell.c:81
                {x=0;y++;lRetVal++;}
 31001d8:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31001df:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 31001e3:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:80
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 31001e7:	eb 25                	jmp    310020e <parseParamsShell+0x163>
/home/yogi/src/os/aproj/kshell/kshell.c:86
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 31001e9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31001ec:	c1 e0 07             	shl    eax,0x7
 31001ef:	89 c2                	mov    edx,eax
 31001f1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31001f4:	8d 0c 02             	lea    ecx,[edx+eax*1]
 31001f7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001fa:	8d 50 01             	lea    edx,[eax+0x1]
 31001fd:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100200:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 3100203:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
 3100206:	01 da                	add    edx,ebx
 3100208:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310020b:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/aproj/kshell/kshell.c:88 (discriminator 2)
        }
        parsedChars++;
 310020e:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:59 (discriminator 2)
    int lRetVal=0,parsedChars=0;
    bool needDoubleQuotetoEndParam=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100212:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:59 (discriminator 1)
 3100216:	83 ec 0c             	sub    esp,0xc
 3100219:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310021c:	e8 ef 0b 00 00       	call   3100e10 <kShell+0x421>
 3100221:	83 c4 10             	add    esp,0x10
 3100224:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3100227:	0f 87 c5 fe ff ff    	ja     31000f2 <parseParamsShell+0x47>
/home/yogi/src/os/aproj/kshell/kshell.c:90
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 310022d:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100231:	74 19                	je     310024c <parseParamsShell+0x1a1>
/home/yogi/src/os/aproj/kshell/kshell.c:92
    {
        lRetVal++;
 3100233:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:93
        params[y][x]='\0';
 3100237:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310023a:	c1 e0 07             	shl    eax,0x7
 310023d:	89 c2                	mov    edx,eax
 310023f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100242:	01 c2                	add    edx,eax
 3100244:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100247:	01 d0                	add    eax,edx
 3100249:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:98
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 310024c:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/aproj/kshell/kshell.c:99
}
 310024f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100252:	c9                   	leave  
 3100253:	c3                   	ret    

03100254 <findCommand>:
findCommand():
/home/yogi/src/os/aproj/kshell/kshell.c:102

int findCommand(char* command)
{
 3100254:	55                   	push   ebp
 3100255:	89 e5                	mov    ebp,esp
 3100257:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/kshell.c:106
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 310025a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100261:	eb 4d                	jmp    31002b0 <findCommand+0x5c>
/home/yogi/src/os/aproj/kshell/kshell.c:108
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 3100263:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100266:	c1 e0 04             	shl    eax,0x4
 3100269:	05 c0 14 10 03       	add    eax,0x31014c0
 310026e:	8b 00                	mov    eax,DWORD PTR [eax]
 3100270:	83 ec 0c             	sub    esp,0xc
 3100273:	50                   	push   eax
 3100274:	e8 97 0b 00 00       	call   3100e10 <kShell+0x421>
 3100279:	83 c4 10             	add    esp,0x10
 310027c:	89 c2                	mov    edx,eax
 310027e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100281:	c1 e0 04             	shl    eax,0x4
 3100284:	05 c0 14 10 03       	add    eax,0x31014c0
 3100289:	8b 00                	mov    eax,DWORD PTR [eax]
 310028b:	83 ec 04             	sub    esp,0x4
 310028e:	52                   	push   edx
 310028f:	50                   	push   eax
 3100290:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100293:	e8 38 0b 00 00       	call   3100dd0 <kShell+0x3e1>
 3100298:	83 c4 10             	add    esp,0x10
 310029b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:110
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 310029e:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31002a2:	75 08                	jne    31002ac <findCommand+0x58>
/home/yogi/src/os/aproj/kshell/kshell.c:113
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 31002a4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31002a7:	83 c0 01             	add    eax,0x1
 31002aa:	eb 0f                	jmp    31002bb <findCommand+0x67>
/home/yogi/src/os/aproj/kshell/kshell.c:106 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 31002ac:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:106 (discriminator 1)
 31002b0:	83 7d f4 04          	cmp    DWORD PTR [ebp-0xc],0x4
 31002b4:	76 ad                	jbe    3100263 <findCommand+0xf>
/home/yogi/src/os/aproj/kshell/kshell.c:117
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 31002b6:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/aproj/kshell/kshell.c:118
}
 31002bb:	c9                   	leave  
 31002bc:	c3                   	ret    

031002bd <buildargv>:
buildargv():
/home/yogi/src/os/aproj/kshell/kshell.c:122

/*parts from http://*/
char **buildargv (const char *input)
{
 31002bd:	55                   	push   ebp
 31002be:	89 e5                	mov    ebp,esp
 31002c0:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/aproj/kshell/kshell.c:125
  char *arg;
  char *copybuf;
  int squote = 0;
 31002c3:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:126
  int dquote = 0;
 31002ca:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:127
  int bsquote = 0;
 31002d1:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:128
  int argc = 0;
 31002d8:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:129
  int maxargc = 0;
 31002df:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:130
  char **argv = NULL;
 31002e6:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:134
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 31002ed:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 31002f1:	0f 84 33 02 00 00    	je     310052a <buildargv+0x26d>
/home/yogi/src/os/aproj/kshell/kshell.c:137
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 31002f7:	83 ec 0c             	sub    esp,0xc
 31002fa:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31002fd:	e8 0e 0b 00 00       	call   3100e10 <kShell+0x421>
 3100302:	83 c4 10             	add    esp,0x10
 3100305:	83 c0 01             	add    eax,0x1
 3100308:	83 ec 0c             	sub    esp,0xc
 310030b:	50                   	push   eax
 310030c:	e8 7f 0a 00 00       	call   3100d90 <kShell+0x3a1>
 3100311:	83 c4 10             	add    esp,0x10
 3100314:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:145
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 3100317:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 310031b:	74 0b                	je     3100328 <buildargv+0x6b>
/home/yogi/src/os/aproj/kshell/kshell.c:145 (discriminator 1)
 310031d:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100320:	83 e8 01             	sub    eax,0x1
 3100323:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3100326:	7f 3d                	jg     3100365 <buildargv+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:148
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 3100328:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 310032c:	75 1c                	jne    310034a <buildargv+0x8d>
/home/yogi/src/os/aproj/kshell/kshell.c:150
		{
		  maxargc = INITIAL_MAXARGC;
 310032e:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/aproj/kshell/kshell.c:151
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 3100335:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100338:	c1 e0 02             	shl    eax,0x2
 310033b:	83 ec 0c             	sub    esp,0xc
 310033e:	50                   	push   eax
 310033f:	e8 4c 0a 00 00       	call   3100d90 <kShell+0x3a1>
 3100344:	83 c4 10             	add    esp,0x10
 3100347:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/aproj/kshell/kshell.c:153
		}
	      argv = nargv;
 310034a:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 310034d:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/kshell.c:154
	      argv[argc] = NULL;
 3100350:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100353:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 310035a:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 310035d:	01 d0                	add    eax,edx
 310035f:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:157
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 3100365:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100368:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/kshell.c:158
	  while (*input != EOS)
 310036b:	e9 ec 00 00 00       	jmp    310045c <buildargv+0x19f>
/home/yogi/src/os/aproj/kshell/kshell.c:160
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100370:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100373:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100376:	3c 20                	cmp    al,0x20
 3100378:	75 16                	jne    3100390 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/kshell.c:160 (discriminator 1)
 310037a:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 310037e:	75 10                	jne    3100390 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/kshell.c:160 (discriminator 2)
 3100380:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100384:	75 0a                	jne    3100390 <buildargv+0xd3>
/home/yogi/src/os/aproj/kshell/kshell.c:160 (discriminator 3)
 3100386:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310038a:	0f 84 da 00 00 00    	je     310046a <buildargv+0x1ad>
/home/yogi/src/os/aproj/kshell/kshell.c:166
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100390:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100394:	74 1d                	je     31003b3 <buildargv+0xf6>
/home/yogi/src/os/aproj/kshell/kshell.c:168
		    {
		      bsquote = 0;
 3100396:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:169
		      *arg++ = *input;
 310039d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31003a0:	8d 50 01             	lea    edx,[eax+0x1]
 31003a3:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31003a6:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31003a9:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31003ac:	88 10                	mov    BYTE PTR [eax],dl
 31003ae:	e9 a5 00 00 00       	jmp    3100458 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:171
		    }
		  else if (*input == '\\')
 31003b3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003b6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003b9:	3c 5c                	cmp    al,0x5c
 31003bb:	75 0c                	jne    31003c9 <buildargv+0x10c>
/home/yogi/src/os/aproj/kshell/kshell.c:173
		    {
		      bsquote = 1;
 31003bd:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 31003c4:	e9 8f 00 00 00       	jmp    3100458 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:175
		    }
		  else if (squote)
 31003c9:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31003cd:	74 26                	je     31003f5 <buildargv+0x138>
/home/yogi/src/os/aproj/kshell/kshell.c:177
		    {
		      if (*input == '\'')
 31003cf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003d2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31003d5:	3c 27                	cmp    al,0x27
 31003d7:	75 09                	jne    31003e2 <buildargv+0x125>
/home/yogi/src/os/aproj/kshell/kshell.c:179
			{
			  squote = 0;
 31003d9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 31003e0:	eb 76                	jmp    3100458 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:183
			}
		      else
			{
			  *arg++ = *input;
 31003e2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31003e5:	8d 50 01             	lea    edx,[eax+0x1]
 31003e8:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31003eb:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31003ee:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31003f1:	88 10                	mov    BYTE PTR [eax],dl
 31003f3:	eb 63                	jmp    3100458 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:186
			}
		    }
		  else if (dquote)
 31003f5:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31003f9:	74 26                	je     3100421 <buildargv+0x164>
/home/yogi/src/os/aproj/kshell/kshell.c:188
		    {
		      if (*input == '"')
 31003fb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31003fe:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100401:	3c 22                	cmp    al,0x22
 3100403:	75 09                	jne    310040e <buildargv+0x151>
/home/yogi/src/os/aproj/kshell/kshell.c:190
			{
			  dquote = 0;
 3100405:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 310040c:	eb 4a                	jmp    3100458 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:194
			}
		      else
			{
			  *arg++ = *input;
 310040e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100411:	8d 50 01             	lea    edx,[eax+0x1]
 3100414:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100417:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310041a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310041d:	88 10                	mov    BYTE PTR [eax],dl
 310041f:	eb 37                	jmp    3100458 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:199
			}
		    }
		  else
		    {
		      if (*input == '\'')
 3100421:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100424:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100427:	3c 27                	cmp    al,0x27
 3100429:	75 09                	jne    3100434 <buildargv+0x177>
/home/yogi/src/os/aproj/kshell/kshell.c:201
			{
			  squote = 1;
 310042b:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 3100432:	eb 24                	jmp    3100458 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:203
			}
		      else if (*input == '"')
 3100434:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100437:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310043a:	3c 22                	cmp    al,0x22
 310043c:	75 09                	jne    3100447 <buildargv+0x18a>
/home/yogi/src/os/aproj/kshell/kshell.c:205
			{
			  dquote = 1;
 310043e:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 3100445:	eb 11                	jmp    3100458 <buildargv+0x19b>
/home/yogi/src/os/aproj/kshell/kshell.c:209
			}
		      else
			{
			  *arg++ = *input;
 3100447:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310044a:	8d 50 01             	lea    edx,[eax+0x1]
 310044d:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100450:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100453:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100456:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/aproj/kshell/kshell.c:213
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 3100458:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:158
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 310045c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310045f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100462:	84 c0                	test   al,al
 3100464:	0f 85 06 ff ff ff    	jne    3100370 <buildargv+0xb3>
/home/yogi/src/os/aproj/kshell/kshell.c:216
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 310046a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310046d:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:218
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100470:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100473:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100476:	84 c0                	test   al,al
 3100478:	0f 84 9e 00 00 00    	je     310051c <buildargv+0x25f>
/home/yogi/src/os/aproj/kshell/kshell.c:220
          {
            char* temp=malloc(strlen(copybuf)+1);
 310047e:	83 ec 0c             	sub    esp,0xc
 3100481:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100484:	e8 87 09 00 00       	call   3100e10 <kShell+0x421>
 3100489:	83 c4 10             	add    esp,0x10
 310048c:	83 c0 01             	add    eax,0x1
 310048f:	83 ec 0c             	sub    esp,0xc
 3100492:	50                   	push   eax
 3100493:	e8 f8 08 00 00       	call   3100d90 <kShell+0x3a1>
 3100498:	83 c4 10             	add    esp,0x10
 310049b:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/aproj/kshell/kshell.c:223
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 310049e:	83 ec 08             	sub    esp,0x8
 31004a1:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31004a4:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 31004a7:	e8 84 08 00 00       	call   3100d30 <kShell+0x341>
 31004ac:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:224
            free(copybuf);
 31004af:	83 ec 0c             	sub    esp,0xc
 31004b2:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31004b5:	e8 66 09 00 00       	call   3100e20 <kShell+0x431>
 31004ba:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:225
            copybuf = (char *) malloc (strlen (input) + 1);
 31004bd:	83 ec 0c             	sub    esp,0xc
 31004c0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31004c3:	e8 48 09 00 00       	call   3100e10 <kShell+0x421>
 31004c8:	83 c4 10             	add    esp,0x10
 31004cb:	83 c0 01             	add    eax,0x1
 31004ce:	83 ec 0c             	sub    esp,0xc
 31004d1:	50                   	push   eax
 31004d2:	e8 b9 08 00 00       	call   3100d90 <kShell+0x3a1>
 31004d7:	83 c4 10             	add    esp,0x10
 31004da:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:226
            argv[argc] = temp;
 31004dd:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31004e0:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31004e7:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31004ea:	01 c2                	add    edx,eax
 31004ec:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 31004ef:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/aproj/kshell/kshell.c:228
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 31004f1:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:229
            argv[argc] = NULL;
 31004f5:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31004f8:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31004ff:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100502:	01 d0                	add    eax,edx
 3100504:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:230
            input++;
 310050a:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:231
            free(temp);
 310050e:	83 ec 0c             	sub    esp,0xc
 3100511:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100514:	e8 07 09 00 00       	call   3100e20 <kShell+0x431>
 3100519:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:234
          }
	}
      while (*input != EOS);
 310051c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310051f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100522:	84 c0                	test   al,al
 3100524:	0f 85 ed fd ff ff    	jne    3100317 <buildargv+0x5a>
/home/yogi/src/os/aproj/kshell/kshell.c:237
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 310052a:	83 ec 0c             	sub    esp,0xc
 310052d:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100530:	e8 eb 08 00 00       	call   3100e20 <kShell+0x431>
 3100535:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:238
  free(nargv);
 3100538:	83 ec 0c             	sub    esp,0xc
 310053b:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 310053e:	e8 dd 08 00 00       	call   3100e20 <kShell+0x431>
 3100543:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:239
  return (argv);
 3100546:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/aproj/kshell/kshell.c:240
}
 3100549:	c9                   	leave  
 310054a:	c3                   	ret    

0310054b <helpMe>:
helpMe():
/home/yogi/src/os/aproj/kshell/kshell.c:243

void helpMe(char *cmdline)
{
 310054b:	55                   	push   ebp
 310054c:	89 e5                	mov    ebp,esp
 310054e:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/kshell.c:246
    char* tok;
    
    tok=strtok(cmdline,delim);
 3100551:	83 ec 08             	sub    esp,0x8
 3100554:	68 10 15 10 03       	push   0x3101510
 3100559:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310055c:	e8 7f 08 00 00       	call   3100de0 <kShell+0x3f1>
 3100561:	83 c4 10             	add    esp,0x10
 3100564:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:253
    {
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
 3100567:	83 ec 08             	sub    esp,0x8
 310056a:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310056d:	68 d1 0e 10 03       	push   0x3100ed1
 3100572:	e8 d9 07 00 00       	call   3100d50 <kShell+0x361>
 3100577:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:254
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 310057a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100581:	e9 86 00 00 00       	jmp    310060c <helpMe+0xc1>
/home/yogi/src/os/aproj/kshell/kshell.c:255
        if (tok!=NULL)
 3100586:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 310058a:	74 50                	je     31005dc <helpMe+0x91>
/home/yogi/src/os/aproj/kshell/kshell.c:257
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
 310058c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310058f:	c1 e0 04             	shl    eax,0x4
 3100592:	05 c0 14 10 03       	add    eax,0x31014c0
 3100597:	8b 00                	mov    eax,DWORD PTR [eax]
 3100599:	83 ec 04             	sub    esp,0x4
 310059c:	6a 64                	push   0x64
 310059e:	50                   	push   eax
 310059f:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005a2:	e8 29 08 00 00       	call   3100dd0 <kShell+0x3e1>
 31005a7:	83 c4 10             	add    esp,0x10
 31005aa:	85 c0                	test   eax,eax
 31005ac:	75 5a                	jne    3100608 <helpMe+0xbd>
/home/yogi/src/os/aproj/kshell/kshell.c:258
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 31005ae:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005b1:	c1 e0 04             	shl    eax,0x4
 31005b4:	05 c4 14 10 03       	add    eax,0x31014c4
 31005b9:	8b 10                	mov    edx,DWORD PTR [eax]
 31005bb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005be:	c1 e0 04             	shl    eax,0x4
 31005c1:	05 c0 14 10 03       	add    eax,0x31014c0
 31005c6:	8b 00                	mov    eax,DWORD PTR [eax]
 31005c8:	83 ec 04             	sub    esp,0x4
 31005cb:	52                   	push   edx
 31005cc:	50                   	push   eax
 31005cd:	68 db 0e 10 03       	push   0x3100edb
 31005d2:	e8 79 07 00 00       	call   3100d50 <kShell+0x361>
 31005d7:	83 c4 10             	add    esp,0x10
 31005da:	eb 2c                	jmp    3100608 <helpMe+0xbd>
/home/yogi/src/os/aproj/kshell/kshell.c:261
        }
        else
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 31005dc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005df:	c1 e0 04             	shl    eax,0x4
 31005e2:	05 c4 14 10 03       	add    eax,0x31014c4
 31005e7:	8b 10                	mov    edx,DWORD PTR [eax]
 31005e9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31005ec:	c1 e0 04             	shl    eax,0x4
 31005ef:	05 c0 14 10 03       	add    eax,0x31014c0
 31005f4:	8b 00                	mov    eax,DWORD PTR [eax]
 31005f6:	83 ec 04             	sub    esp,0x4
 31005f9:	52                   	push   edx
 31005fa:	50                   	push   eax
 31005fb:	68 db 0e 10 03       	push   0x3100edb
 3100600:	e8 4b 07 00 00       	call   3100d50 <kShell+0x361>
 3100605:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:254 (discriminator 2)
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100608:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:254 (discriminator 1)
 310060c:	83 7d f4 04          	cmp    DWORD PTR [ebp-0xc],0x4
 3100610:	0f 86 70 ff ff ff    	jbe    3100586 <helpMe+0x3b>
/home/yogi/src/os/aproj/kshell/kshell.c:263
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
        else
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        
}
 3100616:	90                   	nop
 3100617:	c9                   	leave  
 3100618:	c3                   	ret    

03100619 <paramsToArgv>:
paramsToArgv():
/home/yogi/src/os/aproj/kshell/kshell.c:266

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH])
{
 3100619:	55                   	push   ebp
 310061a:	89 e5                	mov    ebp,esp
 310061c:	53                   	push   ebx
 310061d:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/aproj/kshell/kshell.c:267
    char** pptr=malloc(sizeof(char*)*pcount);
 3100620:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100623:	c1 e0 02             	shl    eax,0x2
 3100626:	83 ec 0c             	sub    esp,0xc
 3100629:	50                   	push   eax
 310062a:	e8 61 07 00 00       	call   3100d90 <kShell+0x3a1>
 310062f:	83 c4 10             	add    esp,0x10
 3100632:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:269
    
    for (int cnt=0;cnt<pcount;cnt++)
 3100635:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310063c:	eb 56                	jmp    3100694 <paramsToArgv+0x7b>
/home/yogi/src/os/aproj/kshell/kshell.c:271 (discriminator 3)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
 310063e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100641:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100648:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310064b:	8d 1c 02             	lea    ebx,[edx+eax*1]
 310064e:	83 ec 0c             	sub    esp,0xc
 3100651:	68 80 00 00 00       	push   0x80
 3100656:	e8 35 07 00 00       	call   3100d90 <kShell+0x3a1>
 310065b:	83 c4 10             	add    esp,0x10
 310065e:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/aproj/kshell/kshell.c:272 (discriminator 3)
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
 3100660:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100663:	c1 e0 07             	shl    eax,0x7
 3100666:	89 c2                	mov    edx,eax
 3100668:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 310066b:	01 c2                	add    edx,eax
 310066d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100670:	8d 0c 85 00 00 00 00 	lea    ecx,[eax*4+0x0]
 3100677:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310067a:	01 c8                	add    eax,ecx
 310067c:	8b 00                	mov    eax,DWORD PTR [eax]
 310067e:	83 ec 04             	sub    esp,0x4
 3100681:	68 80 00 00 00       	push   0x80
 3100686:	52                   	push   edx
 3100687:	50                   	push   eax
 3100688:	e8 f3 06 00 00       	call   3100d80 <kShell+0x391>
 310068d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:269 (discriminator 3)

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH])
{
    char** pptr=malloc(sizeof(char*)*pcount);
    
    for (int cnt=0;cnt<pcount;cnt++)
 3100690:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:269 (discriminator 1)
 3100694:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100697:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 310069a:	7c a2                	jl     310063e <paramsToArgv+0x25>
/home/yogi/src/os/aproj/kshell/kshell.c:274
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
 310069c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
/home/yogi/src/os/aproj/kshell/kshell.c:275
}
 310069f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31006a2:	c9                   	leave  
 31006a3:	c3                   	ret    

031006a4 <freeArgV>:
freeArgV():
/home/yogi/src/os/aproj/kshell/kshell.c:278

void freeArgV(int pcount, char **params)
{
 31006a4:	55                   	push   ebp
 31006a5:	89 e5                	mov    ebp,esp
 31006a7:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/kshell.c:279
    for (int cnt=0;cnt<pcount;cnt++)
 31006aa:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31006b1:	eb 15                	jmp    31006c8 <freeArgV+0x24>
/home/yogi/src/os/aproj/kshell/kshell.c:280 (discriminator 3)
        free(*params);
 31006b3:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31006b6:	8b 00                	mov    eax,DWORD PTR [eax]
 31006b8:	83 ec 0c             	sub    esp,0xc
 31006bb:	50                   	push   eax
 31006bc:	e8 5f 07 00 00       	call   3100e20 <kShell+0x431>
 31006c1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:279 (discriminator 3)
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
 31006c4:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:279 (discriminator 1)
 31006c8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31006cb:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
 31006ce:	7c e3                	jl     31006b3 <freeArgV+0xf>
/home/yogi/src/os/aproj/kshell/kshell.c:281
        free(*params);
    free(params);
 31006d0:	83 ec 0c             	sub    esp,0xc
 31006d3:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 31006d6:	e8 45 07 00 00       	call   3100e20 <kShell+0x431>
 31006db:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:282
}
 31006de:	90                   	nop
 31006df:	c9                   	leave  
 31006e0:	c3                   	ret    

031006e1 <execp>:
execp():
/home/yogi/src/os/aproj/kshell/kshell.c:285

void execp(char* cmdline)
{
 31006e1:	55                   	push   ebp
 31006e2:	89 e5                	mov    ebp,esp
 31006e4:	81 ec 28 05 00 00    	sub    esp,0x528
/home/yogi/src/os/aproj/kshell/kshell.c:286
    bool background=false;
 31006ea:	c6 45 f7 00          	mov    BYTE PTR [ebp-0x9],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:287
    uint32_t pid=0;
 31006ee:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:289
    char* tok;
    char* pgm=NULL;
 31006f5:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:292

    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 31006fc:	83 ec 04             	sub    esp,0x4
 31006ff:	68 00 05 00 00       	push   0x500
 3100704:	8d 85 d8 fa ff ff    	lea    eax,[ebp-0x528]
 310070a:	50                   	push   eax
 310070b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310070e:	e8 98 f9 ff ff       	call   31000ab <parseParamsShell>
 3100713:	83 c4 10             	add    esp,0x10
 3100716:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/aproj/kshell/kshell.c:293
    int execParamCount=0;
 3100719:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:294
    int pcount=1;
 3100720:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:296
    
    if (paramCount==0)
 3100727:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 310072b:	0f 84 3c 01 00 00    	je     310086d <execp+0x18c>
/home/yogi/src/os/aproj/kshell/kshell.c:299
        return;
    
    tok=strtok(cmdline,delim);
 3100731:	83 ec 08             	sub    esp,0x8
 3100734:	68 10 15 10 03       	push   0x3101510
 3100739:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310073c:	e8 9f 06 00 00       	call   3100de0 <kShell+0x3f1>
 3100741:	83 c4 10             	add    esp,0x10
 3100744:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:300
    while (tok!=NULL)
 3100747:	eb 73                	jmp    31007bc <execp+0xdb>
/home/yogi/src/os/aproj/kshell/kshell.c:302
    {
        if (strncmp(tok,"b",2)==0)
 3100749:	83 ec 04             	sub    esp,0x4
 310074c:	6a 02                	push   0x2
 310074e:	68 e4 0e 10 03       	push   0x3100ee4
 3100753:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100756:	e8 75 06 00 00       	call   3100dd0 <kShell+0x3e1>
 310075b:	83 c4 10             	add    esp,0x10
 310075e:	85 c0                	test   eax,eax
 3100760:	75 0a                	jne    310076c <execp+0x8b>
/home/yogi/src/os/aproj/kshell/kshell.c:304
        {
            background=true;
 3100762:	c6 45 f7 01          	mov    BYTE PTR [ebp-0x9],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:305
            execParamCount++;
 3100766:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
 310076a:	eb 37                	jmp    31007a3 <execp+0xc2>
/home/yogi/src/os/aproj/kshell/kshell.c:307
        }
        else if (pgm==NULL)
 310076c:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100770:	75 31                	jne    31007a3 <execp+0xc2>
/home/yogi/src/os/aproj/kshell/kshell.c:309
        {
            pgm=malloc(strlen(tok)+1);  //NOTE: +1 is for the terminating \0
 3100772:	83 ec 0c             	sub    esp,0xc
 3100775:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100778:	e8 93 06 00 00       	call   3100e10 <kShell+0x421>
 310077d:	83 c4 10             	add    esp,0x10
 3100780:	83 c0 01             	add    eax,0x1
 3100783:	83 ec 0c             	sub    esp,0xc
 3100786:	50                   	push   eax
 3100787:	e8 04 06 00 00       	call   3100d90 <kShell+0x3a1>
 310078c:	83 c4 10             	add    esp,0x10
 310078f:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/kshell.c:310
            strcpy(pgm,tok);
 3100792:	83 ec 08             	sub    esp,0x8
 3100795:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100798:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310079b:	e8 90 05 00 00       	call   3100d30 <kShell+0x341>
 31007a0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:312
        }
        pcount++;
 31007a3:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:313
        tok=strtok(0,delim);
 31007a7:	83 ec 08             	sub    esp,0x8
 31007aa:	68 10 15 10 03       	push   0x3101510
 31007af:	6a 00                	push   0x0
 31007b1:	e8 2a 06 00 00       	call   3100de0 <kShell+0x3f1>
 31007b6:	83 c4 10             	add    esp,0x10
 31007b9:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:300
    
    if (paramCount==0)
        return;
    
    tok=strtok(cmdline,delim);
    while (tok!=NULL)
 31007bc:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31007c0:	75 87                	jne    3100749 <execp+0x68>
/home/yogi/src/os/aproj/kshell/kshell.c:316
        }
        pcount++;
        tok=strtok(0,delim);
    }
    
    char** prms=paramsToArgv(paramCount-execParamCount,&params[execParamCount][0]);
 31007c2:	8d 85 d8 fa ff ff    	lea    eax,[ebp-0x528]
 31007c8:	8b 55 e8             	mov    edx,DWORD PTR [ebp-0x18]
 31007cb:	c1 e2 07             	shl    edx,0x7
 31007ce:	01 c2                	add    edx,eax
 31007d0:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31007d3:	2b 45 e8             	sub    eax,DWORD PTR [ebp-0x18]
 31007d6:	83 ec 08             	sub    esp,0x8
 31007d9:	52                   	push   edx
 31007da:	50                   	push   eax
 31007db:	e8 39 fe ff ff       	call   3100619 <paramsToArgv>
 31007e0:	83 c4 10             	add    esp,0x10
 31007e3:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/aproj/kshell/kshell.c:318

    print ("Executing %s\n",pgm);
 31007e6:	83 ec 08             	sub    esp,0x8
 31007e9:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 31007ec:	68 e6 0e 10 03       	push   0x3100ee6
 31007f1:	e8 5a 05 00 00       	call   3100d50 <kShell+0x361>
 31007f6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:319
    pid=exec(pgm,paramCount-execParamCount,prms);
 31007f9:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 31007fc:	2b 45 e8             	sub    eax,DWORD PTR [ebp-0x18]
 31007ff:	83 ec 04             	sub    esp,0x4
 3100802:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 3100805:	50                   	push   eax
 3100806:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100809:	e8 b2 05 00 00       	call   3100dc0 <kShell+0x3d1>
 310080e:	83 c4 10             	add    esp,0x10
 3100811:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
/home/yogi/src/os/aproj/kshell/kshell.c:320
    if (pid>0)
 3100814:	83 7d e0 00          	cmp    DWORD PTR [ebp-0x20],0x0
 3100818:	74 1b                	je     3100835 <execp+0x154>
/home/yogi/src/os/aproj/kshell/kshell.c:322
    {
        if (!background)
 310081a:	0f b6 45 f7          	movzx  eax,BYTE PTR [ebp-0x9]
 310081e:	83 f0 01             	xor    eax,0x1
 3100821:	84 c0                	test   al,al
 3100823:	74 23                	je     3100848 <execp+0x167>
/home/yogi/src/os/aproj/kshell/kshell.c:325
        {
            //print("DEBUG1: waitpid = %08X\n",&waitpid);
            waitpid(pid);
 3100825:	83 ec 0c             	sub    esp,0xc
 3100828:	ff 75 e0             	push   DWORD PTR [ebp-0x20]
 310082b:	e8 10 05 00 00       	call   3100d40 <kShell+0x351>
 3100830:	83 c4 10             	add    esp,0x10
 3100833:	eb 13                	jmp    3100848 <execp+0x167>
/home/yogi/src/os/aproj/kshell/kshell.c:329
        }
    }
    else
        print("Error executing %s\n",pgm);
 3100835:	83 ec 08             	sub    esp,0x8
 3100838:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 310083b:	68 f4 0e 10 03       	push   0x3100ef4
 3100840:	e8 0b 05 00 00       	call   3100d50 <kShell+0x361>
 3100845:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:331 (discriminator 1)
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    freeArgV(paramCount-1, (char**)prms);       
 3100848:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 310084b:	83 e8 01             	sub    eax,0x1
 310084e:	83 ec 08             	sub    esp,0x8
 3100851:	ff 75 d8             	push   DWORD PTR [ebp-0x28]
 3100854:	50                   	push   eax
 3100855:	e8 4a fe ff ff       	call   31006a4 <freeArgV>
 310085a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:332 (discriminator 1)
    free(pgm);
 310085d:	83 ec 0c             	sub    esp,0xc
 3100860:	ff 75 ec             	push   DWORD PTR [ebp-0x14]
 3100863:	e8 b8 05 00 00       	call   3100e20 <kShell+0x431>
 3100868:	83 c4 10             	add    esp,0x10
 310086b:	eb 01                	jmp    310086e <execp+0x18d>
/home/yogi/src/os/aproj/kshell/kshell.c:297
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    int execParamCount=0;
    int pcount=1;
    
    if (paramCount==0)
        return;
 310086d:	90                   	nop
/home/yogi/src/os/aproj/kshell/kshell.c:333
    else
        print("Error executing %s\n",pgm);
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    freeArgV(paramCount-1, (char**)prms);       
    free(pgm);
}
 310086e:	c9                   	leave  
 310086f:	c3                   	ret    

03100870 <kSleep>:
kSleep():
/home/yogi/src/os/aproj/kshell/kshell.c:336

void kSleep(char *cmdline)
{
 3100870:	55                   	push   ebp
 3100871:	89 e5                	mov    ebp,esp
 3100873:	81 ec 18 05 00 00    	sub    esp,0x518
/home/yogi/src/os/aproj/kshell/kshell.c:338
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 3100879:	83 ec 04             	sub    esp,0x4
 310087c:	68 00 05 00 00       	push   0x500
 3100881:	8d 85 f4 fa ff ff    	lea    eax,[ebp-0x50c]
 3100887:	50                   	push   eax
 3100888:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310088b:	e8 1b f8 ff ff       	call   31000ab <parseParamsShell>
 3100890:	83 c4 10             	add    esp,0x10
 3100893:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/kshell.c:340

    if (params[0][0]==0)
 3100896:	0f b6 85 f4 fa ff ff 	movzx  eax,BYTE PTR [ebp-0x50c]
 310089d:	84 c0                	test   al,al
 310089f:	75 12                	jne    31008b3 <kSleep+0x43>
/home/yogi/src/os/aproj/kshell/kshell.c:342
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
 31008a1:	83 ec 0c             	sub    esp,0xc
 31008a4:	68 08 0f 10 03       	push   0x3100f08
 31008a9:	e8 a2 04 00 00       	call   3100d50 <kShell+0x361>
 31008ae:	83 c4 10             	add    esp,0x10
 31008b1:	eb 22                	jmp    31008d5 <kSleep+0x65>
/home/yogi/src/os/aproj/kshell/kshell.c:346
        return;
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
 31008b3:	83 ec 04             	sub    esp,0x4
 31008b6:	6a 0a                	push   0xa
 31008b8:	6a 00                	push   0x0
 31008ba:	8d 85 f4 fa ff ff    	lea    eax,[ebp-0x50c]
 31008c0:	50                   	push   eax
 31008c1:	e8 ea 04 00 00       	call   3100db0 <kShell+0x3c1>
 31008c6:	83 c4 10             	add    esp,0x10
 31008c9:	83 ec 0c             	sub    esp,0xc
 31008cc:	50                   	push   eax
 31008cd:	e8 ce 04 00 00       	call   3100da0 <kShell+0x3b1>
 31008d2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:347
}
 31008d5:	c9                   	leave  
 31008d6:	c3                   	ret    

031008d7 <kExit>:
kExit():
/home/yogi/src/os/aproj/kshell/kshell.c:350

void kExit(char *cmdline)
{
 31008d7:	55                   	push   ebp
 31008d8:	89 e5                	mov    ebp,esp
 31008da:	81 ec 08 05 00 00    	sub    esp,0x508
/home/yogi/src/os/aproj/kshell/kshell.c:353
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 31008e0:	83 ec 04             	sub    esp,0x4
 31008e3:	68 00 05 00 00       	push   0x500
 31008e8:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 31008ee:	50                   	push   eax
 31008ef:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31008f2:	e8 b4 f7 ff ff       	call   31000ab <parseParamsShell>
 31008f7:	83 c4 10             	add    esp,0x10
 31008fa:	85 c0                	test   eax,eax
 31008fc:	74 1d                	je     310091b <kExit+0x44>
/home/yogi/src/os/aproj/kshell/kshell.c:355
    {
        exitCode = strtoul(params[0],0,10);
 31008fe:	83 ec 04             	sub    esp,0x4
 3100901:	6a 0a                	push   0xa
 3100903:	6a 00                	push   0x0
 3100905:	8d 85 f8 fa ff ff    	lea    eax,[ebp-0x508]
 310090b:	50                   	push   eax
 310090c:	e8 9f 04 00 00       	call   3100db0 <kShell+0x3c1>
 3100911:	83 c4 10             	add    esp,0x10
 3100914:	a3 04 16 10 03       	mov    ds:0x3101604,eax
 3100919:	eb 0a                	jmp    3100925 <kExit+0x4e>
/home/yogi/src/os/aproj/kshell/kshell.c:358
    }
    else
        exitCode = 0;
 310091b:	c7 05 04 16 10 03 00 	mov    DWORD PTR ds:0x3101604,0x0
 3100922:	00 00 00 
/home/yogi/src/os/aproj/kshell/kshell.c:359
    timeToExit=true;
 3100925:	c6 05 00 16 10 03 01 	mov    BYTE PTR ds:0x3101600,0x1
/home/yogi/src/os/aproj/kshell/kshell.c:360
}
 310092c:	90                   	nop
 310092d:	c9                   	leave  
 310092e:	c3                   	ret    

0310092f <pwd>:
pwd():
/home/yogi/src/os/aproj/kshell/kshell.c:363

void pwd()
{
 310092f:	55                   	push   ebp
 3100930:	89 e5                	mov    ebp,esp
 3100932:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/aproj/kshell/kshell.c:364
    char* buf=malloc(512);
 3100935:	83 ec 0c             	sub    esp,0xc
 3100938:	68 00 02 00 00       	push   0x200
 310093d:	e8 4e 04 00 00       	call   3100d90 <kShell+0x3a1>
 3100942:	83 c4 10             	add    esp,0x10
 3100945:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/kshell.c:365
    print("%s\n",getcwd(buf,512));
 3100948:	83 ec 08             	sub    esp,0x8
 310094b:	68 00 02 00 00       	push   0x200
 3100950:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100953:	e8 a8 04 00 00       	call   3100e00 <kShell+0x411>
 3100958:	83 c4 10             	add    esp,0x10
 310095b:	83 ec 08             	sub    esp,0x8
 310095e:	50                   	push   eax
 310095f:	68 46 0f 10 03       	push   0x3100f46
 3100964:	e8 e7 03 00 00       	call   3100d50 <kShell+0x361>
 3100969:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:366
    free(buf);
 310096c:	83 ec 0c             	sub    esp,0xc
 310096f:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
 3100972:	e8 a9 04 00 00       	call   3100e20 <kShell+0x431>
 3100977:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:367
}
 310097a:	90                   	nop
 310097b:	c9                   	leave  
 310097c:	c3                   	ret    

0310097d <saveCommand>:
saveCommand():
/home/yogi/src/os/aproj/kshell/kshell.c:378
    
}
*/

void saveCommand(char* command)
{
 310097d:	55                   	push   ebp
 310097e:	89 e5                	mov    ebp,esp
 3100980:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/kshell.c:379
    strcpy(commandHistory[commandHistoryMax++],command);
 3100983:	a1 0c 16 10 03       	mov    eax,ds:0x310160c
 3100988:	8d 50 01             	lea    edx,[eax+0x1]
 310098b:	89 15 0c 16 10 03    	mov    DWORD PTR ds:0x310160c,edx
 3100991:	c1 e0 07             	shl    eax,0x7
 3100994:	05 20 16 10 03       	add    eax,0x3101620
 3100999:	83 ec 08             	sub    esp,0x8
 310099c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310099f:	50                   	push   eax
 31009a0:	e8 8b 03 00 00       	call   3100d30 <kShell+0x341>
 31009a5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:380
}
 31009a8:	90                   	nop
 31009a9:	c9                   	leave  
 31009aa:	c3                   	ret    

031009ab <prompt>:
prompt():
/home/yogi/src/os/aproj/kshell/kshell.c:383

void prompt()
{
 31009ab:	55                   	push   ebp
 31009ac:	89 e5                	mov    ebp,esp
 31009ae:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/kshell.c:384
    print("%s> ",sExecutingProgram);
 31009b1:	83 ec 08             	sub    esp,0x8
 31009b4:	68 20 10 11 03       	push   0x3111020
 31009b9:	68 4a 0f 10 03       	push   0x3100f4a
 31009be:	e8 8d 03 00 00       	call   3100d50 <kShell+0x361>
 31009c3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:385
}
 31009c6:	90                   	nop
 31009c7:	c9                   	leave  
 31009c8:	c3                   	ret    

031009c9 <reprintCommand>:
reprintCommand():
/home/yogi/src/os/aproj/kshell/kshell.c:388

int reprintCommand(char* command)
{
 31009c9:	55                   	push   ebp
 31009ca:	89 e5                	mov    ebp,esp
 31009cc:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/aproj/kshell/kshell.c:389
    resetRow();
 31009cf:	e8 8c 03 00 00       	call   3100d60 <kShell+0x371>
/home/yogi/src/os/aproj/kshell/kshell.c:390
    prompt();
 31009d4:	e8 d2 ff ff ff       	call   31009ab <prompt>
/home/yogi/src/os/aproj/kshell/kshell.c:391
    print("%s",command);
 31009d9:	83 ec 08             	sub    esp,0x8
 31009dc:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31009df:	68 4f 0f 10 03       	push   0x3100f4f
 31009e4:	e8 67 03 00 00       	call   3100d50 <kShell+0x361>
 31009e9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:393
 
}
 31009ec:	90                   	nop
 31009ed:	c9                   	leave  
 31009ee:	c3                   	ret    

031009ef <kShell>:
kShell():
/home/yogi/src/os/aproj/kshell/kshell.c:396

int kShell(int argc, char** argv)
{
 31009ef:	55                   	push   ebp
 31009f0:	89 e5                	mov    ebp,esp
 31009f2:	81 ec 38 01 00 00    	sub    esp,0x138
/home/yogi/src/os/aproj/kshell/kshell.c:398
    char lCommand[256];
    uint8_t lCurrKey=0;
 31009f8:	c6 85 eb fe ff ff 00 	mov    BYTE PTR [ebp-0x115],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:399
    int lCurrKeyCount=0;
 31009ff:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:400
    int commandWasFromThisBufferPtr=0;
 3100a06:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:405
    char ansiSeq[20];

    //libc_init();
    
    ansiSeq[0]=0x1b;
 3100a0d:	c6 85 d7 fe ff ff 1b 	mov    BYTE PTR [ebp-0x129],0x1b
/home/yogi/src/os/aproj/kshell/kshell.c:406
    sKShellProgramName=malloc(1024);
 3100a14:	83 ec 0c             	sub    esp,0xc
 3100a17:	68 00 04 00 00       	push   0x400
 3100a1c:	e8 6f 03 00 00       	call   3100d90 <kShell+0x3a1>
 3100a21:	83 c4 10             	add    esp,0x10
 3100a24:	a3 34 12 11 03       	mov    ds:0x3111234,eax
/home/yogi/src/os/aproj/kshell/kshell.c:407
    strcpy(sKShellProgramName,"kShell");
 3100a29:	a1 34 12 11 03       	mov    eax,ds:0x3111234
 3100a2e:	83 ec 08             	sub    esp,0x8
 3100a31:	68 52 0f 10 03       	push   0x3100f52
 3100a36:	50                   	push   eax
 3100a37:	e8 f4 02 00 00       	call   3100d30 <kShell+0x341>
 3100a3c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:408
    strcpy(sExecutingProgram,sKShellProgramName);
 3100a3f:	a1 34 12 11 03       	mov    eax,ds:0x3111234
 3100a44:	83 ec 08             	sub    esp,0x8
 3100a47:	50                   	push   eax
 3100a48:	68 20 10 11 03       	push   0x3111020
 3100a4d:	e8 de 02 00 00       	call   3100d30 <kShell+0x341>
 3100a52:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:411
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 3100a55:	e9 93 02 00 00       	jmp    3100ced <kShell+0x2fe>
/home/yogi/src/os/aproj/kshell/kshell.c:414
    {
getACommand:
        commandHistoryPtr = commandHistoryMax;
 3100a5a:	a1 0c 16 10 03       	mov    eax,ds:0x310160c
 3100a5f:	a3 08 16 10 03       	mov    ds:0x3101608,eax
/home/yogi/src/os/aproj/kshell/kshell.c:415
        commandWasFromThisBufferPtr = -1;
 3100a64:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/kshell.c:416
        lCurrKey=0;
 3100a6b:	c6 85 eb fe ff ff 00 	mov    BYTE PTR [ebp-0x115],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:417
        lCurrKeyCount=0;
 3100a72:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:418
        memset(lCommand,0,256);
 3100a79:	83 ec 04             	sub    esp,0x4
 3100a7c:	68 00 01 00 00       	push   0x100
 3100a81:	6a 00                	push   0x0
 3100a83:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100a89:	50                   	push   eax
 3100a8a:	e8 61 03 00 00       	call   3100df0 <kShell+0x401>
 3100a8f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:419
        prompt();
 3100a92:	e8 14 ff ff ff       	call   31009ab <prompt>
/home/yogi/src/os/aproj/kshell/kshell.c:421
getAKey:
        lCurrKey=0;
 3100a97:	c6 85 eb fe ff ff 00 	mov    BYTE PTR [ebp-0x115],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:422
        while(lCurrKey==0)
 3100a9e:	eb 16                	jmp    3100ab6 <kShell+0xc7>
/home/yogi/src/os/aproj/kshell/kshell.c:424
        {
            gets(&lCurrKey,1,1);
 3100aa0:	83 ec 04             	sub    esp,0x4
 3100aa3:	6a 01                	push   0x1
 3100aa5:	6a 01                	push   0x1
 3100aa7:	8d 85 eb fe ff ff    	lea    eax,[ebp-0x115]
 3100aad:	50                   	push   eax
 3100aae:	e8 bd 02 00 00       	call   3100d70 <kShell+0x381>
 3100ab3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:422
        lCurrKeyCount=0;
        memset(lCommand,0,256);
        prompt();
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 3100ab6:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100abd:	84 c0                	test   al,al
 3100abf:	74 df                	je     3100aa0 <kShell+0xb1>
/home/yogi/src/os/aproj/kshell/kshell.c:427
        {
            gets(&lCurrKey,1,1);
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
 3100ac1:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100ac8:	3c c8                	cmp    al,0xc8
 3100aca:	75 76                	jne    3100b42 <kShell+0x153>
/home/yogi/src/os/aproj/kshell/kshell.c:429
        {
            if (commandHistoryPtr>=0)
 3100acc:	a1 08 16 10 03       	mov    eax,ds:0x3101608
 3100ad1:	85 c0                	test   eax,eax
 3100ad3:	78 c2                	js     3100a97 <kShell+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:432
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
 3100ad5:	a1 08 16 10 03       	mov    eax,ds:0x3101608
 3100ada:	83 e8 01             	sub    eax,0x1
 3100add:	85 c0                	test   eax,eax
 3100adf:	78 b6                	js     3100a97 <kShell+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:434
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
 3100ae1:	a1 08 16 10 03       	mov    eax,ds:0x3101608
 3100ae6:	83 e8 01             	sub    eax,0x1
 3100ae9:	a3 08 16 10 03       	mov    ds:0x3101608,eax
 3100aee:	a1 08 16 10 03       	mov    eax,ds:0x3101608
 3100af3:	c1 e0 07             	shl    eax,0x7
 3100af6:	05 20 16 10 03       	add    eax,0x3101620
 3100afb:	83 ec 08             	sub    esp,0x8
 3100afe:	50                   	push   eax
 3100aff:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100b05:	50                   	push   eax
 3100b06:	e8 25 02 00 00       	call   3100d30 <kShell+0x341>
 3100b0b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:435
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 3100b0e:	a1 08 16 10 03       	mov    eax,ds:0x3101608
 3100b13:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:436
                    reprintCommand(lCommand);
 3100b16:	83 ec 0c             	sub    esp,0xc
 3100b19:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100b1f:	50                   	push   eax
 3100b20:	e8 a4 fe ff ff       	call   31009c9 <reprintCommand>
 3100b25:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:437
                    lCurrKeyCount=strlen(lCommand);
 3100b28:	83 ec 0c             	sub    esp,0xc
 3100b2b:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100b31:	50                   	push   eax
 3100b32:	e8 d9 02 00 00       	call   3100e10 <kShell+0x421>
 3100b37:	83 c4 10             	add    esp,0x10
 3100b3a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/kshell.c:439
                }
                goto getAKey;
 3100b3d:	e9 55 ff ff ff       	jmp    3100a97 <kShell+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:444
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
 3100b42:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100b49:	3c d0                	cmp    al,0xd0
 3100b4b:	0f 85 99 00 00 00    	jne    3100bea <kShell+0x1fb>
/home/yogi/src/os/aproj/kshell/kshell.c:446
        {
            if (commandHistoryPtr>=0)
 3100b51:	a1 08 16 10 03       	mov    eax,ds:0x3101608
 3100b56:	85 c0                	test   eax,eax
 3100b58:	0f 88 39 ff ff ff    	js     3100a97 <kShell+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:449
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<=commandHistoryMax)
 3100b5e:	a1 08 16 10 03       	mov    eax,ds:0x3101608
 3100b63:	8d 50 01             	lea    edx,[eax+0x1]
 3100b66:	a1 0c 16 10 03       	mov    eax,ds:0x310160c
 3100b6b:	39 c2                	cmp    edx,eax
 3100b6d:	0f 8f 24 ff ff ff    	jg     3100a97 <kShell+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:451
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
 3100b73:	a1 08 16 10 03       	mov    eax,ds:0x3101608
 3100b78:	83 c0 01             	add    eax,0x1
 3100b7b:	a3 08 16 10 03       	mov    ds:0x3101608,eax
 3100b80:	a1 08 16 10 03       	mov    eax,ds:0x3101608
 3100b85:	c1 e0 07             	shl    eax,0x7
 3100b88:	05 20 16 10 03       	add    eax,0x3101620
 3100b8d:	83 ec 08             	sub    esp,0x8
 3100b90:	50                   	push   eax
 3100b91:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100b97:	50                   	push   eax
 3100b98:	e8 93 01 00 00       	call   3100d30 <kShell+0x341>
 3100b9d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:452
                    commandWasFromThisBufferPtr=commandHistoryPtr;
 3100ba0:	a1 08 16 10 03       	mov    eax,ds:0x3101608
 3100ba5:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/aproj/kshell/kshell.c:453
                    if (commandHistoryPtr>=commandHistoryMax)
 3100ba8:	8b 15 08 16 10 03    	mov    edx,DWORD PTR ds:0x3101608
 3100bae:	a1 0c 16 10 03       	mov    eax,ds:0x310160c
 3100bb3:	39 c2                	cmp    edx,eax
 3100bb5:	7c 07                	jl     3100bbe <kShell+0x1cf>
/home/yogi/src/os/aproj/kshell/kshell.c:454
                        commandWasFromThisBufferPtr=-1;
 3100bb7:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/kshell.c:455
                    reprintCommand(lCommand);
 3100bbe:	83 ec 0c             	sub    esp,0xc
 3100bc1:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100bc7:	50                   	push   eax
 3100bc8:	e8 fc fd ff ff       	call   31009c9 <reprintCommand>
 3100bcd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:456
                    lCurrKeyCount=strlen(lCommand);
 3100bd0:	83 ec 0c             	sub    esp,0xc
 3100bd3:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100bd9:	50                   	push   eax
 3100bda:	e8 31 02 00 00       	call   3100e10 <kShell+0x421>
 3100bdf:	83 c4 10             	add    esp,0x10
 3100be2:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/aproj/kshell/kshell.c:458
                }
                goto getAKey;
 3100be5:	e9 ad fe ff ff       	jmp    3100a97 <kShell+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:463
            }
            else
                goto getAKey;
        }   
        else if (lCurrKey==0xcb) //left
 3100bea:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100bf1:	3c cb                	cmp    al,0xcb
 3100bf3:	75 23                	jne    3100c18 <kShell+0x229>
/home/yogi/src/os/aproj/kshell/kshell.c:465
        {
            if (lCurrKeyCount>0)
 3100bf5:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100bf9:	0f 8e 98 fe ff ff    	jle    3100a97 <kShell+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:467
            {
                print("\033[1D");
 3100bff:	83 ec 0c             	sub    esp,0xc
 3100c02:	68 59 0f 10 03       	push   0x3100f59
 3100c07:	e8 44 01 00 00       	call   3100d50 <kShell+0x361>
 3100c0c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:468
                lCurrKeyCount--;
 3100c0f:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:471
            }
             
            goto getAKey;
 3100c13:	e9 7f fe ff ff       	jmp    3100a97 <kShell+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:473
        }
        else if (lCurrKey==0xcd) //right
 3100c18:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100c1f:	3c cd                	cmp    al,0xcd
 3100c21:	0f 84 70 fe ff ff    	je     3100a97 <kShell+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:476
        {
        }
        else if (lCurrKey=='\b') //backspace
 3100c27:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100c2e:	3c 08                	cmp    al,0x8
 3100c30:	75 1b                	jne    3100c4d <kShell+0x25e>
/home/yogi/src/os/aproj/kshell/kshell.c:478
        {
            lCurrKeyCount--;
 3100c32:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/aproj/kshell/kshell.c:479
            lCommand[lCurrKeyCount]='\0';
 3100c36:	8d 95 ec fe ff ff    	lea    edx,[ebp-0x114]
 3100c3c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c3f:	01 d0                	add    eax,edx
 3100c41:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/aproj/kshell/kshell.c:480
            if (lCurrKeyCount>0)
 3100c44:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100c48:	e9 4a fe ff ff       	jmp    3100a97 <kShell+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:492
                cursorMoveTo(cursorGetPosX()-1,lTemp);*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa) //Enter
 3100c4d:	0f b6 85 eb fe ff ff 	movzx  eax,BYTE PTR [ebp-0x115]
 3100c54:	3c 0a                	cmp    al,0xa
 3100c56:	75 21                	jne    3100c79 <kShell+0x28a>
/home/yogi/src/os/aproj/kshell/kshell.c:494
        {
            print("\n");
 3100c58:	83 ec 0c             	sub    esp,0xc
 3100c5b:	68 5e 0f 10 03       	push   0x3100f5e
 3100c60:	e8 eb 00 00 00       	call   3100d50 <kShell+0x361>
 3100c65:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:495
            goto doneGettingKeys;
 3100c68:	90                   	nop
/home/yogi/src/os/aproj/kshell/kshell.c:507
            commandWasFromThisBufferPtr=-1;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 3100c69:	0f b6 85 ec fe ff ff 	movzx  eax,BYTE PTR [ebp-0x114]
 3100c70:	84 c0                	test   al,al
 3100c72:	75 3a                	jne    3100cae <kShell+0x2bf>
 3100c74:	e9 e1 fd ff ff       	jmp    3100a5a <kShell+0x6b>
/home/yogi/src/os/aproj/kshell/kshell.c:499
            print("\n");
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3100c79:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100c7c:	8d 50 01             	lea    edx,[eax+0x1]
 3100c7f:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100c82:	0f b6 95 eb fe ff ff 	movzx  edx,BYTE PTR [ebp-0x115]
 3100c89:	88 94 05 ec fe ff ff 	mov    BYTE PTR [ebp+eax*1-0x114],dl
/home/yogi/src/os/aproj/kshell/kshell.c:500
            reprintCommand(lCommand);
 3100c90:	83 ec 0c             	sub    esp,0xc
 3100c93:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100c99:	50                   	push   eax
 3100c9a:	e8 2a fd ff ff       	call   31009c9 <reprintCommand>
 3100c9f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:502
            //Reset pointer to command buffer so that this possibly modified command gets written as a new one
            commandWasFromThisBufferPtr=-1;
 3100ca2:	c7 45 f0 ff ff ff ff 	mov    DWORD PTR [ebp-0x10],0xffffffff
/home/yogi/src/os/aproj/kshell/kshell.c:504
        }
        goto getAKey;
 3100ca9:	e9 e9 fd ff ff       	jmp    3100a97 <kShell+0xa8>
/home/yogi/src/os/aproj/kshell/kshell.c:509
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
            goto getACommand;
        if (commandWasFromThisBufferPtr == -1)
 3100cae:	83 7d f0 ff          	cmp    DWORD PTR [ebp-0x10],0xffffffff
 3100cb2:	75 12                	jne    3100cc6 <kShell+0x2d7>
/home/yogi/src/os/aproj/kshell/kshell.c:510
            saveCommand(lCommand);
 3100cb4:	83 ec 0c             	sub    esp,0xc
 3100cb7:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100cbd:	50                   	push   eax
 3100cbe:	e8 ba fc ff ff       	call   310097d <saveCommand>
 3100cc3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:511
        int i = findCommand(lCommand);
 3100cc6:	83 ec 0c             	sub    esp,0xc
 3100cc9:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100ccf:	50                   	push   eax
 3100cd0:	e8 7f f5 ff ff       	call   3100254 <findCommand>
 3100cd5:	83 c4 10             	add    esp,0x10
 3100cd8:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/aproj/kshell/kshell.c:512
        execInternalCommand(lCommand);
 3100cdb:	83 ec 0c             	sub    esp,0xc
 3100cde:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
 3100ce4:	50                   	push   eax
 3100ce5:	e8 16 f3 ff ff       	call   3100000 <execInternalCommand>
 3100cea:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:411
    sKShellProgramName=malloc(1024);
    strcpy(sKShellProgramName,"kShell");
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 3100ced:	0f b6 05 00 16 10 03 	movzx  eax,BYTE PTR ds:0x3101600
 3100cf4:	83 f0 01             	xor    eax,0x1
 3100cf7:	84 c0                	test   al,al
 3100cf9:	0f 85 5b fd ff ff    	jne    3100a5a <kShell+0x6b>
/home/yogi/src/os/aproj/kshell/kshell.c:514
        if (commandWasFromThisBufferPtr == -1)
            saveCommand(lCommand);
        int i = findCommand(lCommand);
        execInternalCommand(lCommand);
    }
    free(sKShellProgramName);
 3100cff:	a1 34 12 11 03       	mov    eax,ds:0x3111234
 3100d04:	83 ec 0c             	sub    esp,0xc
 3100d07:	50                   	push   eax
 3100d08:	e8 13 01 00 00       	call   3100e20 <kShell+0x431>
 3100d0d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/aproj/kshell/kshell.c:515
    return exitCode;
 3100d10:	a1 04 16 10 03       	mov    eax,ds:0x3101604
/home/yogi/src/os/aproj/kshell/kshell.c:516
}
 3100d15:	c9                   	leave  
 3100d16:	c3                   	ret    

Disassembly of section .plt:

03100d20 <.plt>:
 3100d20:	ff 35 ac 15 10 03    	push   DWORD PTR ds:0x31015ac
 3100d26:	ff 25 b0 15 10 03    	jmp    DWORD PTR ds:0x31015b0
 3100d2c:	00 00                	add    BYTE PTR [eax],al
 3100d2e:	00 00                	add    BYTE PTR [eax],al
 3100d30:	ff 25 b4 15 10 03    	jmp    DWORD PTR ds:0x31015b4
 3100d36:	68 00 00 00 00       	push   0x0
 3100d3b:	e9 e0 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100d40:	ff 25 b8 15 10 03    	jmp    DWORD PTR ds:0x31015b8
 3100d46:	68 08 00 00 00       	push   0x8
 3100d4b:	e9 d0 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100d50:	ff 25 bc 15 10 03    	jmp    DWORD PTR ds:0x31015bc
 3100d56:	68 10 00 00 00       	push   0x10
 3100d5b:	e9 c0 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100d60:	ff 25 c0 15 10 03    	jmp    DWORD PTR ds:0x31015c0
 3100d66:	68 18 00 00 00       	push   0x18
 3100d6b:	e9 b0 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100d70:	ff 25 c4 15 10 03    	jmp    DWORD PTR ds:0x31015c4
 3100d76:	68 20 00 00 00       	push   0x20
 3100d7b:	e9 a0 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100d80:	ff 25 c8 15 10 03    	jmp    DWORD PTR ds:0x31015c8
 3100d86:	68 28 00 00 00       	push   0x28
 3100d8b:	e9 90 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100d90:	ff 25 cc 15 10 03    	jmp    DWORD PTR ds:0x31015cc
 3100d96:	68 30 00 00 00       	push   0x30
 3100d9b:	e9 80 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100da0:	ff 25 d0 15 10 03    	jmp    DWORD PTR ds:0x31015d0
 3100da6:	68 38 00 00 00       	push   0x38
 3100dab:	e9 70 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100db0:	ff 25 d4 15 10 03    	jmp    DWORD PTR ds:0x31015d4
 3100db6:	68 40 00 00 00       	push   0x40
 3100dbb:	e9 60 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100dc0:	ff 25 d8 15 10 03    	jmp    DWORD PTR ds:0x31015d8
 3100dc6:	68 48 00 00 00       	push   0x48
 3100dcb:	e9 50 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100dd0:	ff 25 dc 15 10 03    	jmp    DWORD PTR ds:0x31015dc
 3100dd6:	68 50 00 00 00       	push   0x50
 3100ddb:	e9 40 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100de0:	ff 25 e0 15 10 03    	jmp    DWORD PTR ds:0x31015e0
 3100de6:	68 58 00 00 00       	push   0x58
 3100deb:	e9 30 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100df0:	ff 25 e4 15 10 03    	jmp    DWORD PTR ds:0x31015e4
 3100df6:	68 60 00 00 00       	push   0x60
 3100dfb:	e9 20 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100e00:	ff 25 e8 15 10 03    	jmp    DWORD PTR ds:0x31015e8
 3100e06:	68 68 00 00 00       	push   0x68
 3100e0b:	e9 10 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100e10:	ff 25 ec 15 10 03    	jmp    DWORD PTR ds:0x31015ec
 3100e16:	68 70 00 00 00       	push   0x70
 3100e1b:	e9 00 ff ff ff       	jmp    3100d20 <kShell+0x331>
 3100e20:	ff 25 f0 15 10 03    	jmp    DWORD PTR ds:0x31015f0
 3100e26:	68 78 00 00 00       	push   0x78
 3100e2b:	e9 f0 fe ff ff       	jmp    3100d20 <kShell+0x331>

Disassembly of section .rodata:

03100e30 <.rodata>:
 3100e30:	68 65 6c 70 00       	push   0x706c65
 3100e35:	47                   	inc    edi
 3100e36:	65                   	gs
 3100e37:	74 20                	je     3100e59 <kShell+0x46a>
 3100e39:	68 65 6c 70 20       	push   0x20706c65
 3100e3e:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3100e42:	73 20                	jae    3100e64 <kShell+0x475>
 3100e44:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 3100e4b:	74 69                	je     3100eb6 <kShell+0x4c7>
 3100e4d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100e4e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100e4f:	29 00                	sub    DWORD PTR [eax],eax
 3100e51:	65                   	gs
 3100e52:	78 65                	js     3100eb9 <kShell+0x4ca>
 3100e54:	63 00                	arpl   WORD PTR [eax],ax
 3100e56:	45                   	inc    ebp
 3100e57:	78 65                	js     3100ebe <kShell+0x4cf>
 3100e59:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3100e5c:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3100e60:	70 72                	jo     3100ed4 <kShell+0x4e5>
 3100e62:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100e63:	67 72 61             	addr16 jb 3100ec7 <kShell+0x4d8>
 3100e66:	6d                   	ins    DWORD PTR es:[edi],dx
 3100e67:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 3100e6a:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 3100e71:	20 
 3100e72:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3100e76:	6c                   	ins    BYTE PTR es:[edi],dx
 3100e77:	6c                   	ins    BYTE PTR es:[edi],dx
 3100e78:	00 70 77             	add    BYTE PTR [eax+0x77],dh
 3100e7b:	64 00 50 72          	add    BYTE PTR fs:[eax+0x72],dl
 3100e7f:	69 6e 74 20 77 6f 72 	imul   ebp,DWORD PTR [esi+0x74],0x726f7720
 3100e86:	6b 69 6e 67          	imul   ebp,DWORD PTR [ecx+0x6e],0x67
 3100e8a:	20 64 69 72          	and    BYTE PTR [ecx+ebp*2+0x72],ah
 3100e8e:	65 63 74 6f 72       	arpl   WORD PTR gs:[edi+ebp*2+0x72],si
 3100e93:	79 00                	jns    3100e95 <kShell+0x4a6>
 3100e95:	73 6c                	jae    3100f03 <kShell+0x514>
 3100e97:	65                   	gs
 3100e98:	65                   	gs
 3100e99:	70 00                	jo     3100e9b <kShell+0x4ac>
 3100e9b:	53                   	push   ebx
 3100e9c:	6c                   	ins    BYTE PTR es:[edi],dx
 3100e9d:	65                   	gs
 3100e9e:	65                   	gs
 3100e9f:	70 20                	jo     3100ec1 <kShell+0x4d2>
 3100ea1:	66 6f                	outs   dx,WORD PTR ds:[esi]
 3100ea3:	72 20                	jb     3100ec5 <kShell+0x4d6>
 3100ea5:	78 20                	js     3100ec7 <kShell+0x4d8>
 3100ea7:	73 65                	jae    3100f0e <kShell+0x51f>
 3100ea9:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100eac:	64                   	fs
 3100ead:	73 00                	jae    3100eaf <kShell+0x4c0>
 3100eaf:	00 09                	add    BYTE PTR [ecx],cl
 3100eb1:	49                   	dec    ecx
 3100eb2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100eb3:	76 61                	jbe    3100f16 <kShell+0x527>
 3100eb5:	6c                   	ins    BYTE PTR es:[edi],dx
 3100eb6:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 3100ebd:	61 
 3100ebe:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100ebf:	64 20 27             	and    BYTE PTR fs:[edi],ah
 3100ec2:	25 73 27 20 79       	and    eax,0x79202773
 3100ec7:	61                   	popa   
 3100ec8:	20 64 75 6d          	and    BYTE PTR [ebp+esi*2+0x6d],ah
 3100ecc:	6d                   	ins    DWORD PTR es:[edi],dx
 3100ecd:	79 21                	jns    3100ef0 <kShell+0x501>
 3100ecf:	0a 00                	or     al,BYTE PTR [eax]
 3100ed1:	48                   	dec    eax
 3100ed2:	65                   	gs
 3100ed3:	6c                   	ins    BYTE PTR es:[edi],dx
 3100ed4:	70 3a                	jo     3100f10 <kShell+0x521>
 3100ed6:	20 25 73 0a 00 09    	and    BYTE PTR ds:0x9000a73,ah
 3100edc:	25 73 3a 20 25       	and    eax,0x25203a73
 3100ee1:	73 0a                	jae    3100eed <kShell+0x4fe>
 3100ee3:	00 62 00             	add    BYTE PTR [edx+0x0],ah
 3100ee6:	45                   	inc    ebp
 3100ee7:	78 65                	js     3100f4e <kShell+0x55f>
 3100ee9:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3100eec:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3100ef3:	00 45 72             	add    BYTE PTR [ebp+0x72],al
 3100ef6:	72 6f                	jb     3100f67 <kShell+0x578>
 3100ef8:	72 20                	jb     3100f1a <kShell+0x52b>
 3100efa:	65                   	gs
 3100efb:	78 65                	js     3100f62 <kShell+0x573>
 3100efd:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3100f00:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3100f07:	00 52 65             	add    BYTE PTR [edx+0x65],dl
 3100f0a:	71 75                	jno    3100f81 <kShell+0x592>
 3100f0c:	69 72 65 73 20 31 20 	imul   esi,DWORD PTR [edx+0x65],0x20312073
 3100f13:	70 61                	jo     3100f76 <kShell+0x587>
 3100f15:	72 61                	jb     3100f78 <kShell+0x589>
 3100f17:	6d                   	ins    DWORD PTR es:[edi],dx
 3100f18:	65                   	gs
 3100f19:	74 65                	je     3100f80 <kShell+0x591>
 3100f1b:	72 20                	jb     3100f3d <kShell+0x54e>
 3100f1d:	77 68                	ja     3100f87 <kShell+0x598>
 3100f1f:	69 63 68 20 69 73 20 	imul   esp,DWORD PTR [ebx+0x68],0x20736920
 3100f26:	74 68                	je     3100f90 <kShell+0x5a1>
 3100f28:	65 20 6e 75          	and    BYTE PTR gs:[esi+0x75],ch
 3100f2c:	6d                   	ins    DWORD PTR es:[edi],dx
 3100f2d:	62 65 72             	bound  esp,QWORD PTR [ebp+0x72]
 3100f30:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
 3100f33:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
 3100f36:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],bp
 3100f39:	64                   	fs
 3100f3a:	73 20                	jae    3100f5c <kShell+0x56d>
 3100f3c:	74 6f                	je     3100fad <kShell+0x5be>
 3100f3e:	20 73 6c             	and    BYTE PTR [ebx+0x6c],dh
 3100f41:	65                   	gs
 3100f42:	65                   	gs
 3100f43:	70 0a                	jo     3100f4f <kShell+0x560>
 3100f45:	00 25 73 0a 00 25    	add    BYTE PTR ds:0x25000a73,ah
 3100f4b:	73 3e                	jae    3100f8b <kShell+0x59c>
 3100f4d:	20 00                	and    BYTE PTR [eax],al
 3100f4f:	25 73 00 6b 53       	and    eax,0x536b0073
 3100f54:	68 65 6c 6c 00       	push   0x6c6c65
 3100f59:	1b 5b 31             	sbb    ebx,DWORD PTR [ebx+0x31]
 3100f5c:	44                   	inc    esp
 3100f5d:	00 0a                	add    BYTE PTR [edx],cl
	...

Disassembly of section .eh_frame:

03100f60 <.eh_frame>:
 3100f60:	14 00                	adc    al,0x0
 3100f62:	00 00                	add    BYTE PTR [eax],al
 3100f64:	00 00                	add    BYTE PTR [eax],al
 3100f66:	00 00                	add    BYTE PTR [eax],al
 3100f68:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3100f6b:	00 01                	add    BYTE PTR [ecx],al
 3100f6d:	7c 08                	jl     3100f77 <kShell+0x588>
 3100f6f:	01 1b                	add    DWORD PTR [ebx],ebx
 3100f71:	0c 04                	or     al,0x4
 3100f73:	04 88                	add    al,0x88
 3100f75:	01 00                	add    DWORD PTR [eax],eax
 3100f77:	00 20                	add    BYTE PTR [eax],ah
 3100f79:	00 00                	add    BYTE PTR [eax],al
 3100f7b:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100f7e:	00 00                	add    BYTE PTR [eax],al
 3100f80:	80 f0 ff             	xor    al,0xff
 3100f83:	ff ab 00 00 00 00    	jmp    FWORD PTR [ebx+0x0]
 3100f89:	41                   	inc    ecx
 3100f8a:	0e                   	push   cs
 3100f8b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100f91:	44                   	inc    esp
 3100f92:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100f95:	a3 c5 c3 0c 04       	mov    ds:0x40cc3c5,eax
 3100f9a:	04 00                	add    al,0x0
 3100f9c:	20 00                	and    BYTE PTR [eax],al
 3100f9e:	00 00                	add    BYTE PTR [eax],al
 3100fa0:	40                   	inc    eax
 3100fa1:	00 00                	add    BYTE PTR [eax],al
 3100fa3:	00 07                	add    BYTE PTR [edi],al
 3100fa5:	f1                   	icebp  
 3100fa6:	ff                   	(bad)  
 3100fa7:	ff a9 01 00 00 00    	jmp    FWORD PTR [ecx+0x1]
 3100fad:	41                   	inc    ecx
 3100fae:	0e                   	push   cs
 3100faf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100fb5:	44                   	inc    esp
 3100fb6:	83 03 03             	add    DWORD PTR [ebx],0x3
 3100fb9:	a1 01 c5 c3 0c       	mov    eax,ds:0xcc3c501
 3100fbe:	04 04                	add    al,0x4
 3100fc0:	1c 00                	sbb    al,0x0
 3100fc2:	00 00                	add    BYTE PTR [eax],al
 3100fc4:	64 00 00             	add    BYTE PTR fs:[eax],al
 3100fc7:	00 8c f2 ff ff 69 00 	add    BYTE PTR [edx+esi*8+0x69ffff],cl
 3100fce:	00 00                	add    BYTE PTR [eax],al
 3100fd0:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100fd3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100fd9:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3100fdc:	0c 04                	or     al,0x4
 3100fde:	04 00                	add    al,0x0
 3100fe0:	1c 00                	sbb    al,0x0
 3100fe2:	00 00                	add    BYTE PTR [eax],al
 3100fe4:	84 00                	test   BYTE PTR [eax],al
 3100fe6:	00 00                	add    BYTE PTR [eax],al
 3100fe8:	d5 f2                	aad    0xf2
 3100fea:	ff                   	(bad)  
 3100feb:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 3100ff1:	41                   	inc    ecx
 3100ff2:	0e                   	push   cs
 3100ff3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100ff9:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 3100fff:	04 1c                	add    al,0x1c
 3101001:	00 00                	add    BYTE PTR [eax],al
 3101003:	00 a4 00 00 00 43 f5 	add    BYTE PTR [eax+eax*1-0xabd0000],ah
 310100a:	ff                   	(bad)  
 310100b:	ff ce                	dec    esi
 310100d:	00 00                	add    BYTE PTR [eax],al
 310100f:	00 00                	add    BYTE PTR [eax],al
 3101011:	41                   	inc    ecx
 3101012:	0e                   	push   cs
 3101013:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101019:	02 ca                	add    cl,dl
 310101b:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 310101e:	04 00                	add    al,0x0
 3101020:	20 00                	and    BYTE PTR [eax],al
 3101022:	00 00                	add    BYTE PTR [eax],al
 3101024:	c4 00                	les    eax,FWORD PTR [eax]
 3101026:	00 00                	add    BYTE PTR [eax],al
 3101028:	f1                   	icebp  
 3101029:	f5                   	cmc    
 310102a:	ff                   	(bad)  
 310102b:	ff 8b 00 00 00 00    	dec    DWORD PTR [ebx+0x0]
 3101031:	41                   	inc    ecx
 3101032:	0e                   	push   cs
 3101033:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3101039:	44                   	inc    esp
 310103a:	83 03 02             	add    DWORD PTR [ebx],0x2
 310103d:	83 c5 c3             	add    ebp,0xffffffc3
 3101040:	0c 04                	or     al,0x4
 3101042:	04 00                	add    al,0x0
 3101044:	1c 00                	sbb    al,0x0
 3101046:	00 00                	add    BYTE PTR [eax],al
 3101048:	e8 00 00 00 58       	call   5b10104d <libcTZ+0x57fefe15>
 310104d:	f6 ff                	idiv   bh
 310104f:	ff                   	(bad)  
 3101050:	3d 00 00 00 00       	cmp    eax,0x0
 3101055:	41                   	inc    ecx
 3101056:	0e                   	push   cs
 3101057:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310105d:	79 c5                	jns    3101024 <kShell+0x635>
 310105f:	0c 04                	or     al,0x4
 3101061:	04 00                	add    al,0x0
 3101063:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101066:	00 00                	add    BYTE PTR [eax],al
 3101068:	08 01                	or     BYTE PTR [ecx],al
 310106a:	00 00                	add    BYTE PTR [eax],al
 310106c:	75 f6                	jne    3101064 <kShell+0x675>
 310106e:	ff                   	(bad)  
 310106f:	ff 8f 01 00 00 00    	dec    DWORD PTR [edi+0x1]
 3101075:	41                   	inc    ecx
 3101076:	0e                   	push   cs
 3101077:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310107d:	03 8b 01 c5 0c 04    	add    ecx,DWORD PTR [ebx+0x40cc501]
 3101083:	04 1c                	add    al,0x1c
 3101085:	00 00                	add    BYTE PTR [eax],al
 3101087:	00 28                	add    BYTE PTR [eax],ch
 3101089:	01 00                	add    DWORD PTR [eax],eax
 310108b:	00 e4                	add    ah,ah
 310108d:	f7 ff                	idiv   edi
 310108f:	ff 67 00             	jmp    DWORD PTR [edi+0x0]
 3101092:	00 00                	add    BYTE PTR [eax],al
 3101094:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3101097:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310109d:	02 63 c5             	add    ah,BYTE PTR [ebx-0x3b]
 31010a0:	0c 04                	or     al,0x4
 31010a2:	04 00                	add    al,0x0
 31010a4:	1c 00                	sbb    al,0x0
 31010a6:	00 00                	add    BYTE PTR [eax],al
 31010a8:	48                   	dec    eax
 31010a9:	01 00                	add    DWORD PTR [eax],eax
 31010ab:	00 2b                	add    BYTE PTR [ebx],ch
 31010ad:	f8                   	clc    
 31010ae:	ff                   	(bad)  
 31010af:	ff 58 00             	call   FWORD PTR [eax+0x0]
 31010b2:	00 00                	add    BYTE PTR [eax],al
 31010b4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31010b7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31010bd:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 31010c1:	04 04                	add    al,0x4
 31010c3:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 31010c6:	00 00                	add    BYTE PTR [eax],al
 31010c8:	68 01 00 00 63       	push   0x63000001
 31010cd:	f8                   	clc    
 31010ce:	ff                   	(bad)  
 31010cf:	ff 4e 00             	dec    DWORD PTR [esi+0x0]
 31010d2:	00 00                	add    BYTE PTR [eax],al
 31010d4:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31010d7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31010dd:	02 4a c5             	add    cl,BYTE PTR [edx-0x3b]
 31010e0:	0c 04                	or     al,0x4
 31010e2:	04 00                	add    al,0x0
 31010e4:	1c 00                	sbb    al,0x0
 31010e6:	00 00                	add    BYTE PTR [eax],al
 31010e8:	88 01                	mov    BYTE PTR [ecx],al
 31010ea:	00 00                	add    BYTE PTR [eax],al
 31010ec:	91                   	xchg   ecx,eax
 31010ed:	f8                   	clc    
 31010ee:	ff                   	(bad)  
 31010ef:	ff 2e                	jmp    FWORD PTR [esi]
 31010f1:	00 00                	add    BYTE PTR [eax],al
 31010f3:	00 00                	add    BYTE PTR [eax],al
 31010f5:	41                   	inc    ecx
 31010f6:	0e                   	push   cs
 31010f7:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31010fd:	6a c5                	push   0xffffffc5
 31010ff:	0c 04                	or     al,0x4
 3101101:	04 00                	add    al,0x0
 3101103:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101106:	00 00                	add    BYTE PTR [eax],al
 3101108:	a8 01                	test   al,0x1
 310110a:	00 00                	add    BYTE PTR [eax],al
 310110c:	9f                   	lahf   
 310110d:	f8                   	clc    
 310110e:	ff                   	(bad)  
 310110f:	ff 1e                	call   FWORD PTR [esi]
 3101111:	00 00                	add    BYTE PTR [eax],al
 3101113:	00 00                	add    BYTE PTR [eax],al
 3101115:	41                   	inc    ecx
 3101116:	0e                   	push   cs
 3101117:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310111d:	5a                   	pop    edx
 310111e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101121:	04 00                	add    al,0x0
 3101123:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101126:	00 00                	add    BYTE PTR [eax],al
 3101128:	c8 01 00 00          	enter  0x1,0x0
 310112c:	9d                   	popf   
 310112d:	f8                   	clc    
 310112e:	ff                   	(bad)  
 310112f:	ff 26                	jmp    DWORD PTR [esi]
 3101131:	00 00                	add    BYTE PTR [eax],al
 3101133:	00 00                	add    BYTE PTR [eax],al
 3101135:	41                   	inc    ecx
 3101136:	0e                   	push   cs
 3101137:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310113d:	62                   	(bad)  
 310113e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101141:	04 00                	add    al,0x0
 3101143:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3101146:	00 00                	add    BYTE PTR [eax],al
 3101148:	e8 01 00 00 a3       	call   a610114e <libcTZ+0xa2feff16>
 310114d:	f8                   	clc    
 310114e:	ff                   	(bad)  
 310114f:	ff 28                	jmp    FWORD PTR [eax]
 3101151:	03 00                	add    eax,DWORD PTR [eax]
 3101153:	00 00                	add    BYTE PTR [eax],al
 3101155:	41                   	inc    ecx
 3101156:	0e                   	push   cs
 3101157:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310115d:	03 24 03             	add    esp,DWORD PTR [ebx+eax*1]
 3101160:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3101163:	04                   	.byte 0x4

Disassembly of section .interp:

03101164 <.interp>:
 3101164:	2f                   	das    
 3101165:	6c                   	ins    BYTE PTR es:[edi],dx
 3101166:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 310116d:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3101174:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03101178 <.dynsym>:
	...
 3101188:	09 00                	or     DWORD PTR [eax],eax
	...
 3101192:	00 00                	add    BYTE PTR [eax],al
 3101194:	12 00                	adc    al,BYTE PTR [eax]
 3101196:	00 00                	add    BYTE PTR [eax],al
 3101198:	10 00                	adc    BYTE PTR [eax],al
	...
 31011a2:	00 00                	add    BYTE PTR [eax],al
 31011a4:	12 00                	adc    al,BYTE PTR [eax]
 31011a6:	00 00                	add    BYTE PTR [eax],al
 31011a8:	18 00                	sbb    BYTE PTR [eax],al
	...
 31011b2:	00 00                	add    BYTE PTR [eax],al
 31011b4:	12 00                	adc    al,BYTE PTR [eax]
 31011b6:	00 00                	add    BYTE PTR [eax],al
 31011b8:	1e                   	push   ds
	...
 31011c1:	00 00                	add    BYTE PTR [eax],al
 31011c3:	00 12                	add    BYTE PTR [edx],dl
 31011c5:	00 00                	add    BYTE PTR [eax],al
 31011c7:	00 27                	add    BYTE PTR [edi],ah
	...
 31011d1:	00 00                	add    BYTE PTR [eax],al
 31011d3:	00 12                	add    BYTE PTR [edx],dl
 31011d5:	00 00                	add    BYTE PTR [eax],al
 31011d7:	00 2c 00             	add    BYTE PTR [eax+eax*1],ch
	...
 31011e2:	00 00                	add    BYTE PTR [eax],al
 31011e4:	12 00                	adc    al,BYTE PTR [eax]
 31011e6:	00 00                	add    BYTE PTR [eax],al
 31011e8:	33 00                	xor    eax,DWORD PTR [eax]
	...
 31011f2:	00 00                	add    BYTE PTR [eax],al
 31011f4:	12 00                	adc    al,BYTE PTR [eax]
 31011f6:	00 00                	add    BYTE PTR [eax],al
 31011f8:	3a 00                	cmp    al,BYTE PTR [eax]
	...
 3101202:	00 00                	add    BYTE PTR [eax],al
 3101204:	12 00                	adc    al,BYTE PTR [eax]
 3101206:	00 00                	add    BYTE PTR [eax],al
 3101208:	40                   	inc    eax
	...
 3101211:	00 00                	add    BYTE PTR [eax],al
 3101213:	00 12                	add    BYTE PTR [edx],dl
 3101215:	00 00                	add    BYTE PTR [eax],al
 3101217:	00 48 00             	add    BYTE PTR [eax+0x0],cl
	...
 3101222:	00 00                	add    BYTE PTR [eax],al
 3101224:	12 00                	adc    al,BYTE PTR [eax]
 3101226:	00 00                	add    BYTE PTR [eax],al
 3101228:	4d                   	dec    ebp
	...
 3101231:	00 00                	add    BYTE PTR [eax],al
 3101233:	00 12                	add    BYTE PTR [edx],dl
 3101235:	00 00                	add    BYTE PTR [eax],al
 3101237:	00 55 00             	add    BYTE PTR [ebp+0x0],dl
	...
 3101242:	00 00                	add    BYTE PTR [eax],al
 3101244:	12 00                	adc    al,BYTE PTR [eax]
 3101246:	00 00                	add    BYTE PTR [eax],al
 3101248:	5c                   	pop    esp
	...
 3101251:	00 00                	add    BYTE PTR [eax],al
 3101253:	00 12                	add    BYTE PTR [edx],dl
 3101255:	00 00                	add    BYTE PTR [eax],al
 3101257:	00 63 00             	add    BYTE PTR [ebx+0x0],ah
	...
 3101262:	00 00                	add    BYTE PTR [eax],al
 3101264:	12 00                	adc    al,BYTE PTR [eax]
 3101266:	00 00                	add    BYTE PTR [eax],al
 3101268:	6a 00                	push   0x0
	...
 3101272:	00 00                	add    BYTE PTR [eax],al
 3101274:	12 00                	adc    al,BYTE PTR [eax]
 3101276:	00 00                	add    BYTE PTR [eax],al
 3101278:	71 00                	jno    310127a <kShell+0x88b>
	...
 3101282:	00 00                	add    BYTE PTR [eax],al
 3101284:	12 00                	adc    al,BYTE PTR [eax]
	...

Disassembly of section .dynstr:

03101288 <.dynstr>:
 3101288:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 310128c:	63 2e                	arpl   WORD PTR [esi],bp
 310128e:	73 6f                	jae    31012ff <kShell+0x910>
 3101290:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3101293:	72 63                	jb     31012f8 <kShell+0x909>
 3101295:	70 79                	jo     3101310 <kShell+0x921>
 3101297:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 310129a:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 31012a1:	72 
 31012a2:	69 6e 74 00 72 65 73 	imul   ebp,DWORD PTR [esi+0x74],0x73657200
 31012a9:	65                   	gs
 31012aa:	74 52                	je     31012fe <kShell+0x90f>
 31012ac:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31012ad:	77 00                	ja     31012af <kShell+0x8c0>
 31012af:	67                   	addr16
 31012b0:	65                   	gs
 31012b1:	74 73                	je     3101326 <kShell+0x937>
 31012b3:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 31012b6:	6d                   	ins    DWORD PTR es:[edi],dx
 31012b7:	63 70 79             	arpl   WORD PTR [eax+0x79],si
 31012ba:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 31012bd:	6c                   	ins    BYTE PTR es:[edi],dx
 31012be:	6c                   	ins    BYTE PTR es:[edi],dx
 31012bf:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31012c0:	63 00                	arpl   WORD PTR [eax],ax
 31012c2:	73 6c                	jae    3101330 <kShell+0x941>
 31012c4:	65                   	gs
 31012c5:	65                   	gs
 31012c6:	70 00                	jo     31012c8 <kShell+0x8d9>
 31012c8:	73 74                	jae    310133e <kShell+0x94f>
 31012ca:	72 74                	jb     3101340 <kShell+0x951>
 31012cc:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31012cd:	75 6c                	jne    310133b <kShell+0x94c>
 31012cf:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 31012d2:	65 63 00             	arpl   WORD PTR gs:[eax],ax
 31012d5:	73 74                	jae    310134b <kShell+0x95c>
 31012d7:	72 6e                	jb     3101347 <kShell+0x958>
 31012d9:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 31012dc:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 31012df:	72 74                	jb     3101355 <kShell+0x966>
 31012e1:	6f                   	outs   dx,DWORD PTR ds:[esi]
 31012e2:	6b 00 6d             	imul   eax,DWORD PTR [eax],0x6d
 31012e5:	65                   	gs
 31012e6:	6d                   	ins    DWORD PTR es:[edi],dx
 31012e7:	73 65                	jae    310134e <kShell+0x95f>
 31012e9:	74 00                	je     31012eb <kShell+0x8fc>
 31012eb:	67                   	addr16
 31012ec:	65                   	gs
 31012ed:	74 63                	je     3101352 <kShell+0x963>
 31012ef:	77 64                	ja     3101355 <kShell+0x966>
 31012f1:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 31012f4:	72 6c                	jb     3101362 <kShell+0x973>
 31012f6:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 31012f8:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 31012fb:	65 65 00 2e          	gs add BYTE PTR gs:[esi],ch
 31012ff:	2e                   	cs
 3101300:	2f                   	das    
 3101301:	6c                   	ins    BYTE PTR es:[edi],dx
 3101302:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3101309:	4f                   	dec    edi
 310130a:	53                   	push   ebx
 310130b:	2f                   	das    
 310130c:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3101313:	62 
 3101314:	75 67                	jne    310137d <kShell+0x98e>
 3101316:	2f                   	das    
 3101317:	47                   	inc    edi
 3101318:	4e                   	dec    esi
 3101319:	55                   	push   ebp
 310131a:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 310131f:	78 00                	js     3101321 <kShell+0x932>

Disassembly of section .hash:

03101324 <.hash>:
 3101324:	03 00                	add    eax,DWORD PTR [eax]
 3101326:	00 00                	add    BYTE PTR [eax],al
 3101328:	11 00                	adc    DWORD PTR [eax],eax
 310132a:	00 00                	add    BYTE PTR [eax],al
 310132c:	0d 00 00 00 10       	or     eax,0x10000000
 3101331:	00 00                	add    BYTE PTR [eax],al
 3101333:	00 0e                	add    BYTE PTR [esi],cl
	...
 310133d:	00 00                	add    BYTE PTR [eax],al
 310133f:	00 01                	add    BYTE PTR [ecx],al
 3101341:	00 00                	add    BYTE PTR [eax],al
 3101343:	00 02                	add    BYTE PTR [edx],al
	...
 310134d:	00 00                	add    BYTE PTR [eax],al
 310134f:	00 05 00 00 00 03    	add    BYTE PTR ds:0x3000000,al
 3101355:	00 00                	add    BYTE PTR [eax],al
 3101357:	00 06                	add    BYTE PTR [esi],al
 3101359:	00 00                	add    BYTE PTR [eax],al
 310135b:	00 07                	add    BYTE PTR [edi],al
 310135d:	00 00                	add    BYTE PTR [eax],al
 310135f:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3101362:	00 00                	add    BYTE PTR [eax],al
 3101364:	09 00                	or     DWORD PTR [eax],eax
 3101366:	00 00                	add    BYTE PTR [eax],al
 3101368:	0a 00                	or     al,BYTE PTR [eax]
 310136a:	00 00                	add    BYTE PTR [eax],al
 310136c:	08 00                	or     BYTE PTR [eax],al
 310136e:	00 00                	add    BYTE PTR [eax],al
 3101370:	0b 00                	or     eax,DWORD PTR [eax]
 3101372:	00 00                	add    BYTE PTR [eax],al
 3101374:	0c 00                	or     al,0x0
 3101376:	00 00                	add    BYTE PTR [eax],al
 3101378:	0f 00 00             	sldt   WORD PTR [eax]
	...

Disassembly of section .eh_frame:

0310137c <.eh_frame>:
 310137c:	14 00                	adc    al,0x0
 310137e:	00 00                	add    BYTE PTR [eax],al
 3101380:	00 00                	add    BYTE PTR [eax],al
 3101382:	00 00                	add    BYTE PTR [eax],al
 3101384:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3101387:	00 01                	add    BYTE PTR [ecx],al
 3101389:	7c 08                	jl     3101393 <kShell+0x9a4>
 310138b:	01 1b                	add    DWORD PTR [ebx],ebx
 310138d:	0c 04                	or     al,0x4
 310138f:	04 88                	add    al,0x88
 3101391:	01 00                	add    DWORD PTR [eax],eax
 3101393:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3101396:	00 00                	add    BYTE PTR [eax],al
 3101398:	1c 00                	sbb    al,0x0
 310139a:	00 00                	add    BYTE PTR [eax],al
 310139c:	84 f9                	test   cl,bh
 310139e:	ff                   	(bad)  
 310139f:	ff 10                	call   DWORD PTR [eax]
 31013a1:	01 00                	add    DWORD PTR [eax],eax
 31013a3:	00 00                	add    BYTE PTR [eax],al
 31013a5:	0e                   	push   cs
 31013a6:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 31013a9:	0c 4a                	or     al,0x4a
 31013ab:	0f 0b                	ud2    
 31013ad:	74 04                	je     31013b3 <kShell+0x9c4>
 31013af:	78 00                	js     31013b1 <kShell+0x9c2>
 31013b1:	3f                   	aas    
 31013b2:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 31013b4:	2a 32                	sub    dh,BYTE PTR [edx]
 31013b6:	24 22                	and    al,0x22
 31013b8:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

031013bc <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 31013bc:	01 1b                	add    DWORD PTR [ebx],ebx
 31013be:	03 3b                	add    edi,DWORD PTR [ebx]
 31013c0:	a0 fb ff ff 0f       	mov    al,ds:0xffffffb
 31013c5:	00 00                	add    BYTE PTR [eax],al
 31013c7:	00 44 ec ff          	add    BYTE PTR [esp+ebp*8-0x1],al
 31013cb:	ff                   	(bad)  
 31013cc:	bc fb ff ff ef       	mov    esp,0xeffffffb
 31013d1:	ec                   	in     al,dx
 31013d2:	ff                   	(bad)  
 31013d3:	ff e0                	jmp    eax
 31013d5:	fb                   	sti    
 31013d6:	ff                   	(bad)  
 31013d7:	ff 98 ee ff ff 04    	call   FWORD PTR [eax+0x4ffffee]
 31013dd:	fc                   	cld    
 31013de:	ff                   	(bad)  
 31013df:	ff 01                	inc    DWORD PTR [ecx]
 31013e1:	ef                   	out    dx,eax
 31013e2:	ff                   	(bad)  
 31013e3:	ff 24 fc             	jmp    DWORD PTR [esp+edi*8]
 31013e6:	ff                   	(bad)  
 31013e7:	ff 8f f1 ff ff 44    	dec    DWORD PTR [edi+0x44fffff1]
 31013ed:	fc                   	cld    
 31013ee:	ff                   	(bad)  
 31013ef:	ff 5d f2             	call   FWORD PTR [ebp-0xe]
 31013f2:	ff                   	(bad)  
 31013f3:	ff 64 fc ff          	jmp    DWORD PTR [esp+edi*8-0x1]
 31013f7:	ff e8                	jmp    <internal disassembler error>
 31013f9:	f2 ff                	repnz (bad) 
 31013fb:	ff 88 fc ff ff 25    	dec    DWORD PTR [eax+0x25fffffc]
 3101401:	f3 ff                	repz (bad) 
 3101403:	ff a8 fc ff ff b4    	jmp    FWORD PTR [eax-0x4b000004]
 3101409:	f4                   	hlt    
 310140a:	ff                   	(bad)  
 310140b:	ff c8                	dec    eax
 310140d:	fc                   	cld    
 310140e:	ff                   	(bad)  
 310140f:	ff 1b                	call   FWORD PTR [ebx]
 3101411:	f5                   	cmc    
 3101412:	ff                   	(bad)  
 3101413:	ff e8                	jmp    <internal disassembler error>
 3101415:	fc                   	cld    
 3101416:	ff                   	(bad)  
 3101417:	ff 73 f5             	push   DWORD PTR [ebx-0xb]
 310141a:	ff                   	(bad)  
 310141b:	ff 08                	dec    DWORD PTR [eax]
 310141d:	fd                   	std    
 310141e:	ff                   	(bad)  
 310141f:	ff c1                	inc    ecx
 3101421:	f5                   	cmc    
 3101422:	ff                   	(bad)  
 3101423:	ff 28                	jmp    FWORD PTR [eax]
 3101425:	fd                   	std    
 3101426:	ff                   	(bad)  
 3101427:	ff ef                	jmp    <internal disassembler error>
 3101429:	f5                   	cmc    
 310142a:	ff                   	(bad)  
 310142b:	ff 48 fd             	dec    DWORD PTR [eax-0x3]
 310142e:	ff                   	(bad)  
 310142f:	ff 0d f6 ff ff 68    	dec    DWORD PTR ds:0x68fffff6
 3101435:	fd                   	std    
 3101436:	ff                   	(bad)  
 3101437:	ff 33                	push   DWORD PTR [ebx]
 3101439:	f6 ff                	idiv   bh
 310143b:	ff                   	.byte 0xff
 310143c:	88 fd                	mov    ch,bh
 310143e:	ff                   	(bad)  
 310143f:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03101440 <.rel.dyn>:
 3101440:	b4 15                	mov    ah,0x15
 3101442:	10 03                	adc    BYTE PTR [ebx],al
 3101444:	07                   	pop    es
 3101445:	01 00                	add    DWORD PTR [eax],eax
 3101447:	00 b8 15 10 03 07    	add    BYTE PTR [eax+0x7031015],bh
 310144d:	02 00                	add    al,BYTE PTR [eax]
 310144f:	00 bc 15 10 03 07 03 	add    BYTE PTR [ebp+edx*1+0x3070310],bh
 3101456:	00 00                	add    BYTE PTR [eax],al
 3101458:	c0 15 10 03 07 04 00 	rcl    BYTE PTR ds:0x4070310,0x0
 310145f:	00 c4                	add    ah,al
 3101461:	15 10 03 07 05       	adc    eax,0x5070310
 3101466:	00 00                	add    BYTE PTR [eax],al
 3101468:	c8 15 10 03          	enter  0x1015,0x3
 310146c:	07                   	pop    es
 310146d:	06                   	push   es
 310146e:	00 00                	add    BYTE PTR [eax],al
 3101470:	cc                   	int3   
 3101471:	15 10 03 07 07       	adc    eax,0x7070310
 3101476:	00 00                	add    BYTE PTR [eax],al
 3101478:	d0 15 10 03 07 08    	rcl    BYTE PTR ds:0x8070310,1
 310147e:	00 00                	add    BYTE PTR [eax],al
 3101480:	d4 15                	aam    0x15
 3101482:	10 03                	adc    BYTE PTR [ebx],al
 3101484:	07                   	pop    es
 3101485:	09 00                	or     DWORD PTR [eax],eax
 3101487:	00 d8                	add    al,bl
 3101489:	15 10 03 07 0a       	adc    eax,0xa070310
 310148e:	00 00                	add    BYTE PTR [eax],al
 3101490:	dc 15 10 03 07 0b    	fcom   QWORD PTR ds:0xb070310
 3101496:	00 00                	add    BYTE PTR [eax],al
 3101498:	e0 15                	loopne 31014af <__GNU_EH_FRAME_HDR+0xf3>
 310149a:	10 03                	adc    BYTE PTR [ebx],al
 310149c:	07                   	pop    es
 310149d:	0c 00                	or     al,0x0
 310149f:	00 e4                	add    ah,ah
 31014a1:	15 10 03 07 0d       	adc    eax,0xd070310
 31014a6:	00 00                	add    BYTE PTR [eax],al
 31014a8:	e8 15 10 03 07       	call   a1324c2 <libcTZ+0x702128a>
 31014ad:	0e                   	push   cs
 31014ae:	00 00                	add    BYTE PTR [eax],al
 31014b0:	ec                   	in     al,dx
 31014b1:	15 10 03 07 0f       	adc    eax,0xf070310
 31014b6:	00 00                	add    BYTE PTR [eax],al
 31014b8:	f0 15 10 03 07 10    	lock adc eax,0x10070310
	...

Disassembly of section .data:

031014c0 <cmds>:
 31014c0:	30 0e                	xor    BYTE PTR [esi],cl
 31014c2:	10 03                	adc    BYTE PTR [ebx],al
 31014c4:	35 0e 10 03 4b       	xor    eax,0x4b03100e
 31014c9:	05 10 03 01 00       	add    eax,0x10310
 31014ce:	00 00                	add    BYTE PTR [eax],al
 31014d0:	51                   	push   ecx
 31014d1:	0e                   	push   cs
 31014d2:	10 03                	adc    BYTE PTR [ebx],al
 31014d4:	56                   	push   esi
 31014d5:	0e                   	push   cs
 31014d6:	10 03                	adc    BYTE PTR [ebx],al
 31014d8:	e1 06                	loope  31014e0 <cmds+0x20>
 31014da:	10 03                	adc    BYTE PTR [ebx],al
 31014dc:	01 00                	add    DWORD PTR [eax],eax
 31014de:	00 00                	add    BYTE PTR [eax],al
 31014e0:	68 0e 10 03 6d       	push   0x6d03100e
 31014e5:	0e                   	push   cs
 31014e6:	10 03                	adc    BYTE PTR [ebx],al
 31014e8:	d7                   	xlat   BYTE PTR ds:[ebx]
 31014e9:	08 10                	or     BYTE PTR [eax],dl
 31014eb:	03 01                	add    eax,DWORD PTR [ecx]
 31014ed:	00 00                	add    BYTE PTR [eax],al
 31014ef:	00 79 0e             	add    BYTE PTR [ecx+0xe],bh
 31014f2:	10 03                	adc    BYTE PTR [ebx],al
 31014f4:	7d 0e                	jge    3101504 <cmds+0x44>
 31014f6:	10 03                	adc    BYTE PTR [ebx],al
 31014f8:	2f                   	das    
 31014f9:	09 10                	or     DWORD PTR [eax],edx
 31014fb:	03 00                	add    eax,DWORD PTR [eax]
 31014fd:	00 00                	add    BYTE PTR [eax],al
 31014ff:	00 95 0e 10 03 9b    	add    BYTE PTR [ebp-0x64fceff2],dl
 3101505:	0e                   	push   cs
 3101506:	10 03                	adc    BYTE PTR [ebx],al
 3101508:	70 08                	jo     3101512 <delim+0x2>
 310150a:	10 03                	adc    BYTE PTR [ebx],al
 310150c:	01 00                	add    DWORD PTR [eax],eax
	...

03101510 <delim>:
 3101510:	20 09                	and    BYTE PTR [ecx],cl
 3101512:	0a                   	.byte 0xa
 3101513:	2d                   	.byte 0x2d
 3101514:	2c 00                	sub    al,0x0

Disassembly of section .dynamic:

03101518 <_DYNAMIC>:
 3101518:	01 00                	add    DWORD PTR [eax],eax
 310151a:	00 00                	add    BYTE PTR [eax],al
 310151c:	01 00                	add    DWORD PTR [eax],eax
 310151e:	00 00                	add    BYTE PTR [eax],al
 3101520:	0f 00 00             	sldt   WORD PTR [eax]
 3101523:	00 76 00             	add    BYTE PTR [esi+0x0],dh
 3101526:	00 00                	add    BYTE PTR [eax],al
 3101528:	04 00                	add    al,0x0
 310152a:	00 00                	add    BYTE PTR [eax],al
 310152c:	24 13                	and    al,0x13
 310152e:	10 03                	adc    BYTE PTR [ebx],al
 3101530:	05 00 00 00 88       	add    eax,0x88000000
 3101535:	12 10                	adc    dl,BYTE PTR [eax]
 3101537:	03 06                	add    eax,DWORD PTR [esi]
 3101539:	00 00                	add    BYTE PTR [eax],al
 310153b:	00 78 11             	add    BYTE PTR [eax+0x11],bh
 310153e:	10 03                	adc    BYTE PTR [ebx],al
 3101540:	0a 00                	or     al,BYTE PTR [eax]
 3101542:	00 00                	add    BYTE PTR [eax],al
 3101544:	99                   	cdq    
 3101545:	00 00                	add    BYTE PTR [eax],al
 3101547:	00 0b                	add    BYTE PTR [ebx],cl
 3101549:	00 00                	add    BYTE PTR [eax],al
 310154b:	00 10                	add    BYTE PTR [eax],dl
 310154d:	00 00                	add    BYTE PTR [eax],al
 310154f:	00 15 00 00 00 00    	add    BYTE PTR ds:0x0,dl
 3101555:	00 00                	add    BYTE PTR [eax],al
 3101557:	00 03                	add    BYTE PTR [ebx],al
 3101559:	00 00                	add    BYTE PTR [eax],al
 310155b:	00 a8 15 10 03 02    	add    BYTE PTR [eax+0x2031015],ch
 3101561:	00 00                	add    BYTE PTR [eax],al
 3101563:	00 80 00 00 00 14    	add    BYTE PTR [eax+0x14000000],al
 3101569:	00 00                	add    BYTE PTR [eax],al
 310156b:	00 11                	add    BYTE PTR [ecx],dl
 310156d:	00 00                	add    BYTE PTR [eax],al
 310156f:	00 17                	add    BYTE PTR [edi],dl
 3101571:	00 00                	add    BYTE PTR [eax],al
 3101573:	00 40 14             	add    BYTE PTR [eax+0x14],al
 3101576:	10 03                	adc    BYTE PTR [ebx],al
	...

Disassembly of section .got.plt:

031015a8 <_GLOBAL_OFFSET_TABLE_>:
 31015a8:	18 15 10 03 00 00    	sbb    BYTE PTR ds:0x310,dl
 31015ae:	00 00                	add    BYTE PTR [eax],al
 31015b0:	00 00                	add    BYTE PTR [eax],al
 31015b2:	00 00                	add    BYTE PTR [eax],al
 31015b4:	36                   	ss
 31015b5:	0d 10 03 46 0d       	or     eax,0xd460310
 31015ba:	10 03                	adc    BYTE PTR [ebx],al
 31015bc:	56                   	push   esi
 31015bd:	0d 10 03 66 0d       	or     eax,0xd660310
 31015c2:	10 03                	adc    BYTE PTR [ebx],al
 31015c4:	76 0d                	jbe    31015d3 <_GLOBAL_OFFSET_TABLE_+0x2b>
 31015c6:	10 03                	adc    BYTE PTR [ebx],al
 31015c8:	86 0d 10 03 96 0d    	xchg   BYTE PTR ds:0xd960310,cl
 31015ce:	10 03                	adc    BYTE PTR [ebx],al
 31015d0:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 31015d1:	0d 10 03 b6 0d       	or     eax,0xdb60310
 31015d6:	10 03                	adc    BYTE PTR [ebx],al
 31015d8:	c6                   	(bad)  
 31015d9:	0d 10 03 d6 0d       	or     eax,0xdd60310
 31015de:	10 03                	adc    BYTE PTR [ebx],al
 31015e0:	e6 0d                	out    0xd,al
 31015e2:	10 03                	adc    BYTE PTR [ebx],al
 31015e4:	f6                   	(bad)  
 31015e5:	0d 10 03 06 0e       	or     eax,0xe060310
 31015ea:	10 03                	adc    BYTE PTR [ebx],al
 31015ec:	16                   	push   ss
 31015ed:	0e                   	push   cs
 31015ee:	10 03                	adc    BYTE PTR [ebx],al
 31015f0:	26                   	es
 31015f1:	0e                   	push   cs
 31015f2:	10 03                	adc    BYTE PTR [ebx],al

Disassembly of section .bss:

03101600 <timeToExit>:
 3101600:	00 00                	add    BYTE PTR [eax],al
	...

03101604 <exitCode>:
 3101604:	00 00                	add    BYTE PTR [eax],al
	...

03101608 <commandHistoryPtr>:
 3101608:	00 00                	add    BYTE PTR [eax],al
	...

0310160c <commandHistoryMax>:
	...

03101620 <commandHistory>:
	...

03111020 <sExecutingProgram>:
	...

03111220 <command_function_p>:
 3111220:	00 00                	add    BYTE PTR [eax],al
	...

03111224 <heapEnd>:
 3111224:	00 00                	add    BYTE PTR [eax],al
	...

03111228 <heapBase>:
 3111228:	00 00                	add    BYTE PTR [eax],al
	...

0311122c <heapCurr>:
 311122c:	00 00                	add    BYTE PTR [eax],al
	...

03111230 <command_function>:
 3111230:	00 00                	add    BYTE PTR [eax],al
	...

03111234 <sKShellProgramName>:
 3111234:	00 00                	add    BYTE PTR [eax],al
	...

03111238 <libcTZ>:
 3111238:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	ee                   	out    dx,al
   1:	07                   	pop    es
   2:	00 00                	add    BYTE PTR [eax],al
   4:	04 00                	add    al,0x0
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	e0 00                	loopne e <execInternalCommand-0x30ffff2>
   e:	00 00                	add    BYTE PTR [eax],al
  10:	0c e0                	or     al,0xe0
  12:	02 00                	add    al,BYTE PTR [eax]
  14:	00 26                	add    BYTE PTR [esi],ah
  16:	00 00                	add    BYTE PTR [eax],al
  18:	00 00                	add    BYTE PTR [eax],al
  1a:	00 10                	add    BYTE PTR [eax],dl
  1c:	03 17                	add    edx,DWORD PTR [edi]
  1e:	0d 00 00 00 00       	or     eax,0x0
  23:	00 00                	add    BYTE PTR [eax],al
  25:	02 01                	add    al,BYTE PTR [ecx]
  27:	08 5b 02             	or     BYTE PTR [ebx+0x2],bl
  2a:	00 00                	add    BYTE PTR [eax],al
  2c:	02 02                	add    al,BYTE PTR [edx]
  2e:	07                   	pop    es
  2f:	b7 02                	mov    bh,0x2
  31:	00 00                	add    BYTE PTR [eax],al
  33:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
  36:	73 02                	jae    3a <execInternalCommand-0x30fffc6>
  38:	00 00                	add    BYTE PTR [eax],al
  3a:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
  3d:	6e                   	outs   dx,BYTE PTR ds:[esi]
  3e:	02 00                	add    al,BYTE PTR [eax]
  40:	00 02                	add    BYTE PTR [edx],al
  42:	01 06                	add    DWORD PTR [esi],eax
  44:	5d                   	pop    ebp
  45:	02 00                	add    al,BYTE PTR [eax]
  47:	00 02                	add    BYTE PTR [edx],al
  49:	02 05 a4 01 00 00    	add    al,BYTE PTR ds:0x1a4
  4f:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  56:	02 08                	add    cl,BYTE PTR [eax]
  58:	05 c9 01 00 00       	add    eax,0x1c9
  5d:	02 08                	add    cl,BYTE PTR [eax]
  5f:	07                   	pop    es
  60:	69 02 00 00 02 04    	imul   eax,DWORD PTR [edx],0x4020000
  66:	05 ce 01 00 00       	add    eax,0x1ce
  6b:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
  6e:	a0 00 00 00 04       	mov    al,ds:0x4000000
  73:	04 05                	add    al,0x5
  75:	04 7a                	add    al,0x7a
  77:	00 00                	add    BYTE PTR [eax],al
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	01 06                	add    DWORD PTR [esi],eax
  7d:	64 02 00             	add    al,BYTE PTR fs:[eax]
  80:	00 06                	add    BYTE PTR [esi],al
  82:	85 01                	test   DWORD PTR [ecx],eax
  84:	00 00                	add    BYTE PTR [eax],al
  86:	02 2e                	add    ch,BYTE PTR [esi]
  88:	25 00 00 00 06       	and    eax,0x6000000
  8d:	80 02 00             	add    BYTE PTR [edx],0x0
  90:	00 02                	add    BYTE PTR [edx],al
  92:	34 33                	xor    al,0x33
  94:	00 00                	add    BYTE PTR [eax],al
  96:	00 02                	add    BYTE PTR [edx],al
  98:	01 02                	add    DWORD PTR [edx],eax
  9a:	da 02                	fiadd  DWORD PTR [edx]
  9c:	00 00                	add    BYTE PTR [eax],al
  9e:	06                   	push   es
  9f:	7e 01                	jle    a2 <execInternalCommand-0x30fff5e>
  a1:	00 00                	add    BYTE PTR [eax],al
  a3:	03 2a                	add    ebp,DWORD PTR [edx]
  a5:	64 00 00             	add    BYTE PTR fs:[eax],al
  a8:	00 05 04 af 00 00    	add    BYTE PTR ds:0xaf04,al
  ae:	00 07                	add    BYTE PTR [edi],al
  b0:	7a 00                	jp     b2 <execInternalCommand-0x30fff4e>
  b2:	00 00                	add    BYTE PTR [eax],al
  b4:	08 10                	or     BYTE PTR [eax],dl
  b6:	04 12                	add    al,0x12
  b8:	ed                   	in     eax,dx
  b9:	00 00                	add    BYTE PTR [eax],al
  bb:	00 09                	add    BYTE PTR [ecx],cl
  bd:	3c 02                	cmp    al,0x2
  bf:	00 00                	add    BYTE PTR [eax],al
  c1:	04 14                	add    al,0x14
  c3:	74 00                	je     c5 <execInternalCommand-0x30fff3b>
  c5:	00 00                	add    BYTE PTR [eax],al
  c7:	00 09                	add    BYTE PTR [ecx],cl
  c9:	78 00                	js     cb <execInternalCommand-0x30fff35>
  cb:	00 00                	add    BYTE PTR [eax],al
  cd:	04 15                	add    al,0x15
  cf:	74 00                	je     d1 <execInternalCommand-0x30fff2f>
  d1:	00 00                	add    BYTE PTR [eax],al
  d3:	04 09                	add    al,0x9
  d5:	9b                   	fwait
  d6:	01 00                	add    DWORD PTR [eax],eax
  d8:	00 04 16             	add    BYTE PTR [esi+edx*1],al
  db:	72 00                	jb     dd <execInternalCommand-0x30fff23>
  dd:	00 00                	add    BYTE PTR [eax],al
  df:	08 09                	or     BYTE PTR [ecx],cl
  e1:	b7 01                	mov    bh,0x1
  e3:	00 00                	add    BYTE PTR [eax],al
  e5:	04 17                	add    al,0x17
  e7:	4f                   	dec    edi
  e8:	00 00                	add    BYTE PTR [eax],al
  ea:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
  ed:	06                   	push   es
  ee:	b7 00                	mov    bh,0x0
  f0:	00 00                	add    BYTE PTR [eax],al
  f2:	04 18                	add    al,0x18
  f4:	b4 00                	mov    ah,0x0
  f6:	00 00                	add    BYTE PTR [eax],al
  f8:	0a 45 01             	or     al,BYTE PTR [ebp+0x1]
  fb:	00 00                	add    BYTE PTR [eax],al
  fd:	01 1c 00             	add    DWORD PTR [eax+eax*1],ebx
 100:	00 10                	add    BYTE PTR [eax],dl
 102:	03 ab 00 00 00 01    	add    ebp,DWORD PTR [ebx+0x1000000]
 108:	9c                   	pushf  
 109:	28 01                	sub    BYTE PTR [ecx],al
 10b:	00 00                	add    BYTE PTR [eax],al
 10d:	0b 50 01             	or     edx,DWORD PTR [eax+0x1]
 110:	00 00                	add    BYTE PTR [eax],al
 112:	01 1c 74             	add    DWORD PTR [esp+esi*2],ebx
 115:	00 00                	add    BYTE PTR [eax],al
 117:	00 02                	add    BYTE PTR [edx],al
 119:	91                   	xchg   ecx,eax
 11a:	00 0c 69             	add    BYTE PTR [ecx+ebp*2],cl
 11d:	00 01                	add    BYTE PTR [ecx],al
 11f:	1e                   	push   ds
 120:	4f                   	dec    edi
 121:	00 00                	add    BYTE PTR [eax],al
 123:	00 02                	add    BYTE PTR [edx],al
 125:	91                   	xchg   ecx,eax
 126:	6c                   	ins    BYTE PTR es:[edi],dx
 127:	00 0d 89 00 00 00    	add    BYTE PTR ds:0x89,cl
 12d:	01 33                	add    DWORD PTR [ebx],esi
 12f:	4f                   	dec    edi
 130:	00 00                	add    BYTE PTR [eax],al
 132:	00 ab 00 10 03 a9    	add    BYTE PTR [ebx-0x56fcf000],ch
 138:	01 00                	add    DWORD PTR [eax],eax
 13a:	00 01                	add    BYTE PTR [ecx],al
 13c:	9c                   	pushf  
 13d:	c6 01 00             	mov    BYTE PTR [ecx],0x0
 140:	00 0b                	add    BYTE PTR [ebx],cl
 142:	22 03                	and    al,BYTE PTR [ebx]
 144:	00 00                	add    BYTE PTR [eax],al
 146:	01 33                	add    DWORD PTR [ebx],esi
 148:	74 00                	je     14a <execInternalCommand-0x30ffeb6>
 14a:	00 00                	add    BYTE PTR [eax],al
 14c:	02 91 00 0b 35 02    	add    dl,BYTE PTR [ecx+0x2350b00]
 152:	00 00                	add    BYTE PTR [eax],al
 154:	01 33                	add    DWORD PTR [ebx],esi
 156:	d6                   	(bad)  
 157:	01 00                	add    DWORD PTR [eax],eax
 159:	00 02                	add    BYTE PTR [edx],al
 15b:	91                   	xchg   ecx,eax
 15c:	04 0b                	add    al,0xb
 15e:	0e                   	push   cs
 15f:	03 00                	add    eax,DWORD PTR [eax]
 161:	00 01                	add    BYTE PTR [ecx],al
 163:	33 4f 00             	xor    ecx,DWORD PTR [edi+0x0]
 166:	00 00                	add    BYTE PTR [eax],al
 168:	02 91 08 0c 78 00    	add    dl,BYTE PTR [ecx+0x780c08]
 16e:	01 35 4f 00 00 00    	add    DWORD PTR ds:0x4f,esi
 174:	02 91 6c 0c 79 00    	add    dl,BYTE PTR [ecx+0x790c6c]
 17a:	01 35 4f 00 00 00    	add    DWORD PTR ds:0x4f,esi
 180:	02 91 68 0e 17 00    	add    dl,BYTE PTR [ecx+0x170e68]
 186:	00 00                	add    BYTE PTR [eax],al
 188:	01 36                	add    DWORD PTR [esi],esi
 18a:	4f                   	dec    edi
 18b:	00 00                	add    BYTE PTR [eax],al
 18d:	00 02                	add    BYTE PTR [edx],al
 18f:	91                   	xchg   ecx,eax
 190:	64                   	fs
 191:	0e                   	push   cs
 192:	c7 00 00 00 01 36    	mov    DWORD PTR [eax],0x36010000
 198:	4f                   	dec    edi
 199:	00 00                	add    BYTE PTR [eax],al
 19b:	00 02                	add    BYTE PTR [edx],al
 19d:	91                   	xchg   ecx,eax
 19e:	60                   	pusha  
 19f:	0e                   	push   cs
 1a0:	41                   	inc    ecx
 1a1:	02 00                	add    al,BYTE PTR [eax]
 1a3:	00 01                	add    BYTE PTR [ecx],al
 1a5:	37                   	aaa    
 1a6:	97                   	xchg   edi,eax
 1a7:	00 00                	add    BYTE PTR [eax],al
 1a9:	00 02                	add    BYTE PTR [edx],al
 1ab:	91                   	xchg   ecx,eax
 1ac:	5f                   	pop    edi
 1ad:	0f e6                	(bad)  
 1af:	00 10                	add    BYTE PTR [eax],dl
 1b1:	03 47 01             	add    eax,DWORD PTR [edi+0x1]
 1b4:	00 00                	add    BYTE PTR [eax],al
 1b6:	0c 63                	or     al,0x63
 1b8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1b9:	74 00                	je     1bb <execInternalCommand-0x30ffe45>
 1bb:	01 3b                	add    DWORD PTR [ebx],edi
 1bd:	33 00                	xor    eax,DWORD PTR [eax]
 1bf:	00 00                	add    BYTE PTR [eax],al
 1c1:	02 91 58 00 00 10    	add    dl,BYTE PTR [ecx+0x10000058]
 1c7:	7a 00                	jp     1c9 <execInternalCommand-0x30ffe37>
 1c9:	00 00                	add    BYTE PTR [eax],al
 1cb:	d6                   	(bad)  
 1cc:	01 00                	add    DWORD PTR [eax],eax
 1ce:	00 11                	add    BYTE PTR [ecx],dl
 1d0:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 1d3:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
 1d6:	05 04 c6 01 00       	add    eax,0x1c604
 1db:	00 0d 2f 03 00 00    	add    BYTE PTR ds:0x32f,cl
 1e1:	01 65 4f             	add    DWORD PTR [ebp+0x4f],esp
 1e4:	00 00                	add    BYTE PTR [eax],al
 1e6:	00 54 02 10          	add    BYTE PTR [edx+eax*1+0x10],dl
 1ea:	03 69 00             	add    ebp,DWORD PTR [ecx+0x0]
 1ed:	00 00                	add    BYTE PTR [eax],al
 1ef:	01 9c 1e 02 00 00 0b 	add    DWORD PTR [esi+ebx*1+0xb000002],ebx
 1f6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1f7:	03 00                	add    eax,DWORD PTR [eax]
 1f9:	00 01                	add    BYTE PTR [ecx],al
 1fb:	65                   	gs
 1fc:	74 00                	je     1fe <execInternalCommand-0x30ffe02>
 1fe:	00 00                	add    BYTE PTR [eax],al
 200:	02 91 00 0c 69 00    	add    dl,BYTE PTR [ecx+0x690c00]
 206:	01 67 33             	add    DWORD PTR [edi+0x33],esp
 209:	00 00                	add    BYTE PTR [eax],al
 20b:	00 02                	add    BYTE PTR [edx],al
 20d:	91                   	xchg   ecx,eax
 20e:	6c                   	ins    BYTE PTR es:[edi],dx
 20f:	0c 72                	or     al,0x72
 211:	65                   	gs
 212:	74 00                	je     214 <execInternalCommand-0x30ffdec>
 214:	01 68 4f             	add    DWORD PTR [eax+0x4f],ebp
 217:	00 00                	add    BYTE PTR [eax],al
 219:	00 02                	add    BYTE PTR [edx],al
 21b:	91                   	xchg   ecx,eax
 21c:	68 00 0d 95 02       	push   0x2950d00
 221:	00 00                	add    BYTE PTR [eax],al
 223:	01 79 dc             	add    DWORD PTR [ecx-0x24],edi
 226:	02 00                	add    al,BYTE PTR [eax]
 228:	00 bd 02 10 03 8e    	add    BYTE PTR [ebp-0x71fceffe],bh
 22e:	02 00                	add    al,BYTE PTR [eax]
 230:	00 01                	add    BYTE PTR [ecx],al
 232:	9c                   	pushf  
 233:	dc 02                	fadd   QWORD PTR [edx]
 235:	00 00                	add    BYTE PTR [eax],al
 237:	0b 9a 00 00 00 01    	or     ebx,DWORD PTR [edx+0x1000000]
 23d:	79 a9                	jns    1e8 <execInternalCommand-0x30ffe18>
 23f:	00 00                	add    BYTE PTR [eax],al
 241:	00 02                	add    BYTE PTR [edx],al
 243:	91                   	xchg   ecx,eax
 244:	00 0c 61             	add    BYTE PTR [ecx+eiz*2],cl
 247:	72 67                	jb     2b0 <execInternalCommand-0x30ffd50>
 249:	00 01                	add    BYTE PTR [ecx],al
 24b:	7b 74                	jnp    2c1 <execInternalCommand-0x30ffd3f>
 24d:	00 00                	add    BYTE PTR [eax],al
 24f:	00 02                	add    BYTE PTR [edx],al
 251:	91                   	xchg   ecx,eax
 252:	6c                   	ins    BYTE PTR es:[edi],dx
 253:	0e                   	push   cs
 254:	3b 03                	cmp    eax,DWORD PTR [ebx]
 256:	00 00                	add    BYTE PTR [eax],al
 258:	01 7c 74 00          	add    DWORD PTR [esp+esi*2+0x0],edi
 25c:	00 00                	add    BYTE PTR [eax],al
 25e:	02 91 68 0e f4 01    	add    dl,BYTE PTR [ecx+0x1f40e68]
 264:	00 00                	add    BYTE PTR [eax],al
 266:	01 7d 4f             	add    DWORD PTR [ebp+0x4f],edi
 269:	00 00                	add    BYTE PTR [eax],al
 26b:	00 02                	add    BYTE PTR [edx],al
 26d:	91                   	xchg   ecx,eax
 26e:	64                   	fs
 26f:	0e                   	push   cs
 270:	77 01                	ja     273 <execInternalCommand-0x30ffd8d>
 272:	00 00                	add    BYTE PTR [eax],al
 274:	01 7e 4f             	add    DWORD PTR [esi+0x4f],edi
 277:	00 00                	add    BYTE PTR [eax],al
 279:	00 02                	add    BYTE PTR [edx],al
 27b:	91                   	xchg   ecx,eax
 27c:	60                   	pusha  
 27d:	0e                   	push   cs
 27e:	f3 01 00             	repz add DWORD PTR [eax],eax
 281:	00 01                	add    BYTE PTR [ecx],al
 283:	7f 4f                	jg     2d4 <execInternalCommand-0x30ffd2c>
 285:	00 00                	add    BYTE PTR [eax],al
 287:	00 02                	add    BYTE PTR [edx],al
 289:	91                   	xchg   ecx,eax
 28a:	5c                   	pop    esp
 28b:	0e                   	push   cs
 28c:	1e                   	push   ds
 28d:	02 00                	add    al,BYTE PTR [eax]
 28f:	00 01                	add    BYTE PTR [ecx],al
 291:	80 4f 00 00          	or     BYTE PTR [edi+0x0],0x0
 295:	00 02                	add    BYTE PTR [edx],al
 297:	91                   	xchg   ecx,eax
 298:	58                   	pop    eax
 299:	0e                   	push   cs
 29a:	1b 02                	sbb    eax,DWORD PTR [edx]
 29c:	00 00                	add    BYTE PTR [eax],al
 29e:	01 81 4f 00 00 00    	add    DWORD PTR [ecx+0x4f],eax
 2a4:	02 91 54 0e 9a 02    	add    dl,BYTE PTR [ecx+0x29a0e54]
 2aa:	00 00                	add    BYTE PTR [eax],al
 2ac:	01 82 dc 02 00 00    	add    DWORD PTR [edx+0x2dc],eax
 2b2:	02 91 50 0e 13 03    	add    dl,BYTE PTR [ecx+0x3130e50]
 2b8:	00 00                	add    BYTE PTR [eax],al
 2ba:	01 83 dc 02 00 00    	add    DWORD PTR [ebx+0x2dc],eax
 2c0:	02 91 4c 0f 7e 04    	add    dl,BYTE PTR [ecx+0x47e0f4c]
 2c6:	10 03                	adc    BYTE PTR [ebx],al
 2c8:	9e                   	sahf   
 2c9:	00 00                	add    BYTE PTR [eax],al
 2cb:	00 0e                	add    BYTE PTR [esi],cl
 2cd:	84 00                	test   BYTE PTR [eax],al
 2cf:	00 00                	add    BYTE PTR [eax],al
 2d1:	01 dc                	add    esp,ebx
 2d3:	74 00                	je     2d5 <execInternalCommand-0x30ffd2b>
 2d5:	00 00                	add    BYTE PTR [eax],al
 2d7:	02 91 48 00 00 05    	add    dl,BYTE PTR [ecx+0x5000048]
 2dd:	04 74                	add    al,0x74
 2df:	00 00                	add    BYTE PTR [eax],al
 2e1:	00 0a                	add    BYTE PTR [edx],cl
 2e3:	10 00                	adc    BYTE PTR [eax],al
 2e5:	00 00                	add    BYTE PTR [eax],al
 2e7:	01 f2                	add    edx,esi
 2e9:	4b                   	dec    ebx
 2ea:	05 10 03 ce 00       	add    eax,0xce0310
 2ef:	00 00                	add    BYTE PTR [eax],al
 2f1:	01 9c 2c 03 00 00 0b 	add    DWORD PTR [esp+ebp*1+0xb000003],ebx
 2f8:	d3 00                	rol    DWORD PTR [eax],cl
 2fa:	00 00                	add    BYTE PTR [eax],al
 2fc:	01 f2                	add    edx,esi
 2fe:	74 00                	je     300 <execInternalCommand-0x30ffd00>
 300:	00 00                	add    BYTE PTR [eax],al
 302:	02 91 00 0c 74 6f    	add    dl,BYTE PTR [ecx+0x6f740c00]
 308:	6b 00 01             	imul   eax,DWORD PTR [eax],0x1
 30b:	f4                   	hlt    
 30c:	74 00                	je     30e <execInternalCommand-0x30ffcf2>
 30e:	00 00                	add    BYTE PTR [eax],al
 310:	02 91 68 0f 7a 05    	add    dl,BYTE PTR [ecx+0x57a0f68]
 316:	10 03                	adc    BYTE PTR [ebx],al
 318:	9c                   	pushf  
 319:	00 00                	add    BYTE PTR [eax],al
 31b:	00 0c 63             	add    BYTE PTR [ebx+eiz*2],cl
 31e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31f:	74 00                	je     321 <execInternalCommand-0x30ffcdf>
 321:	01 fe                	add    esi,edi
 323:	33 00                	xor    eax,DWORD PTR [eax]
 325:	00 00                	add    BYTE PTR [eax],al
 327:	02 91 6c 00 00 12    	add    dl,BYTE PTR [ecx+0x1200006c]
 32d:	d7                   	xlat   BYTE PTR ds:[ebx]
 32e:	01 00                	add    DWORD PTR [eax],eax
 330:	00 01                	add    BYTE PTR [ecx],al
 332:	09 01                	or     DWORD PTR [ecx],eax
 334:	dc 02                	fadd   QWORD PTR [edx]
 336:	00 00                	add    BYTE PTR [eax],al
 338:	19 06                	sbb    DWORD PTR [esi],eax
 33a:	10 03                	adc    BYTE PTR [ebx],al
 33c:	8b 00                	mov    eax,DWORD PTR [eax]
 33e:	00 00                	add    BYTE PTR [eax],al
 340:	01 9c 8d 03 00 00 13 	add    DWORD PTR [ebp+ecx*4+0x13000003],ebx
 347:	c2 01 00             	ret    0x1
 34a:	00 01                	add    BYTE PTR [ecx],al
 34c:	09 01                	or     DWORD PTR [ecx],eax
 34e:	4f                   	dec    edi
 34f:	00 00                	add    BYTE PTR [eax],al
 351:	00 02                	add    BYTE PTR [edx],al
 353:	91                   	xchg   ecx,eax
 354:	00 13                	add    BYTE PTR [ebx],dl
 356:	35 02 00 00 01       	xor    eax,0x1000002
 35b:	09 01                	or     DWORD PTR [ecx],eax
 35d:	d6                   	(bad)  
 35e:	01 00                	add    DWORD PTR [eax],eax
 360:	00 02                	add    BYTE PTR [edx],al
 362:	91                   	xchg   ecx,eax
 363:	04 14                	add    al,0x14
 365:	db 00                	fild   DWORD PTR [eax]
 367:	00 00                	add    BYTE PTR [eax],al
 369:	01 0b                	add    DWORD PTR [ebx],ecx
 36b:	01 dc                	add    esp,ebx
 36d:	02 00                	add    al,BYTE PTR [eax]
 36f:	00 02                	add    BYTE PTR [edx],al
 371:	91                   	xchg   ecx,eax
 372:	68 0f 35 06 10       	push   0x1006350f
 377:	03 67 00             	add    esp,DWORD PTR [edi+0x0]
 37a:	00 00                	add    BYTE PTR [eax],al
 37c:	15 63 6e 74 00       	adc    eax,0x746e63
 381:	01 0d 01 4f 00 00    	add    DWORD PTR ds:0x4f01,ecx
 387:	00 02                	add    BYTE PTR [edx],al
 389:	91                   	xchg   ecx,eax
 38a:	6c                   	ins    BYTE PTR es:[edi],dx
 38b:	00 00                	add    BYTE PTR [eax],al
 38d:	16                   	push   ss
 38e:	ae                   	scas   al,BYTE PTR es:[edi]
 38f:	01 00                	add    DWORD PTR [eax],eax
 391:	00 01                	add    BYTE PTR [ecx],al
 393:	15 01 a4 06 10       	adc    eax,0x1006a401
 398:	03 3d 00 00 00 01    	add    edi,DWORD PTR ds:0x1000000
 39e:	9c                   	pushf  
 39f:	db 03                	fild   DWORD PTR [ebx]
 3a1:	00 00                	add    BYTE PTR [eax],al
 3a3:	13 c2                	adc    eax,edx
 3a5:	01 00                	add    DWORD PTR [eax],eax
 3a7:	00 01                	add    BYTE PTR [ecx],al
 3a9:	15 01 4f 00 00       	adc    eax,0x4f01
 3ae:	00 02                	add    BYTE PTR [edx],al
 3b0:	91                   	xchg   ecx,eax
 3b1:	00 13                	add    BYTE PTR [ebx],dl
 3b3:	35 02 00 00 01       	xor    eax,0x1000002
 3b8:	15 01 dc 02 00       	adc    eax,0x2dc01
 3bd:	00 02                	add    BYTE PTR [edx],al
 3bf:	91                   	xchg   ecx,eax
 3c0:	04 0f                	add    al,0xf
 3c2:	aa                   	stos   BYTE PTR es:[edi],al
 3c3:	06                   	push   es
 3c4:	10 03                	adc    BYTE PTR [ebx],al
 3c6:	26 00 00             	add    BYTE PTR es:[eax],al
 3c9:	00 15 63 6e 74 00    	add    BYTE PTR ds:0x746e63,dl
 3cf:	01 17                	add    DWORD PTR [edi],edx
 3d1:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 3d4:	00 00                	add    BYTE PTR [eax],al
 3d6:	02 91 6c 00 00 16    	add    dl,BYTE PTR [ecx+0x1600006c]
 3dc:	f1                   	icebp  
 3dd:	02 00                	add    al,BYTE PTR [eax]
 3df:	00 01                	add    BYTE PTR [ecx],al
 3e1:	1c 01                	sbb    al,0x1
 3e3:	e1 06                	loope  3eb <execInternalCommand-0x30ffc15>
 3e5:	10 03                	adc    BYTE PTR [ebx],al
 3e7:	8f 01                	pop    DWORD PTR [ecx]
 3e9:	00 00                	add    BYTE PTR [eax],al
 3eb:	01 9c 89 04 00 00 13 	add    DWORD PTR [ecx+ecx*4+0x13000004],ebx
 3f2:	d3 00                	rol    DWORD PTR [eax],cl
 3f4:	00 00                	add    BYTE PTR [eax],al
 3f6:	01 1c 01             	add    DWORD PTR [ecx+eax*1],ebx
 3f9:	74 00                	je     3fb <execInternalCommand-0x30ffc05>
 3fb:	00 00                	add    BYTE PTR [eax],al
 3fd:	02 91 00 14 07 02    	add    dl,BYTE PTR [ecx+0x2071400]
 403:	00 00                	add    BYTE PTR [eax],al
 405:	01 1e                	add    DWORD PTR [esi],ebx
 407:	01 97 00 00 00 02    	add    DWORD PTR [edi+0x2000000],edx
 40d:	91                   	xchg   ecx,eax
 40e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 40f:	15 70 69 64 00       	adc    eax,0x646970
 414:	01 1f                	add    DWORD PTR [edi],ebx
 416:	01 8c 00 00 00 02 91 	add    DWORD PTR [eax+eax*1-0x6efe0000],ecx
 41d:	58                   	pop    eax
 41e:	15 74 6f 6b 00       	adc    eax,0x6b6f74
 423:	01 20                	add    DWORD PTR [eax],esp
 425:	01 74 00 00          	add    DWORD PTR [eax+eax*1+0x0],esi
 429:	00 02                	add    BYTE PTR [edx],al
 42b:	91                   	xchg   ecx,eax
 42c:	68 15 70 67 6d       	push   0x6d677015
 431:	00 01                	add    BYTE PTR [ecx],al
 433:	21 01                	and    DWORD PTR [ecx],eax
 435:	74 00                	je     437 <execInternalCommand-0x30ffbc9>
 437:	00 00                	add    BYTE PTR [eax],al
 439:	02 91 64 14 35 02    	add    dl,BYTE PTR [ecx+0x2351464]
 43f:	00 00                	add    BYTE PTR [eax],al
 441:	01 23                	add    DWORD PTR [ebx],esp
 443:	01 89 04 00 00 03    	add    DWORD PTR [ecx+0x3000004],ecx
 449:	91                   	xchg   ecx,eax
 44a:	d0                   	(bad)  
 44b:	75 14                	jne    461 <execInternalCommand-0x30ffb9f>
 44d:	b7 01                	mov    bh,0x1
 44f:	00 00                	add    BYTE PTR [eax],al
 451:	01 24 01             	add    DWORD PTR [ecx+eax*1],esp
 454:	4f                   	dec    edi
 455:	00 00                	add    BYTE PTR [eax],al
 457:	00 02                	add    BYTE PTR [edx],al
 459:	91                   	xchg   ecx,eax
 45a:	54                   	push   esp
 45b:	14 36                	adc    al,0x36
 45d:	01 00                	add    DWORD PTR [eax],eax
 45f:	00 01                	add    BYTE PTR [ecx],al
 461:	25 01 4f 00 00       	and    eax,0x4f01
 466:	00 02                	add    BYTE PTR [edx],al
 468:	91                   	xchg   ecx,eax
 469:	60                   	pusha  
 46a:	14 c2                	adc    al,0xc2
 46c:	01 00                	add    DWORD PTR [eax],eax
 46e:	00 01                	add    BYTE PTR [ecx],al
 470:	26 01 4f 00          	add    DWORD PTR es:[edi+0x0],ecx
 474:	00 00                	add    BYTE PTR [eax],al
 476:	02 91 5c 14 09 03    	add    dl,BYTE PTR [ecx+0x309145c]
 47c:	00 00                	add    BYTE PTR [eax],al
 47e:	01 3c 01             	add    DWORD PTR [ecx+eax*1],edi
 481:	dc 02                	fadd   QWORD PTR [edx]
 483:	00 00                	add    BYTE PTR [eax],al
 485:	02 91 50 00 10 7a    	add    dl,BYTE PTR [ecx+0x7a100050]
 48b:	00 00                	add    BYTE PTR [eax],al
 48d:	00 9f 04 00 00 11    	add    BYTE PTR [edi+0x11000004],bl
 493:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 496:	00 09                	add    BYTE PTR [ecx],cl
 498:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 49b:	00 00                	add    BYTE PTR [eax],al
 49d:	7f 00                	jg     49f <execInternalCommand-0x30ffb61>
 49f:	16                   	push   ss
 4a0:	43                   	inc    ebx
 4a1:	03 00                	add    eax,DWORD PTR [eax]
 4a3:	00 01                	add    BYTE PTR [ecx],al
 4a5:	4f                   	dec    edi
 4a6:	01 70 08             	add    DWORD PTR [eax+0x8],esi
 4a9:	10 03                	adc    BYTE PTR [ebx],al
 4ab:	67 00 00             	add    BYTE PTR [bx+si],al
 4ae:	00 01                	add    BYTE PTR [ecx],al
 4b0:	9c                   	pushf  
 4b1:	e4 04                	in     al,0x4
 4b3:	00 00                	add    BYTE PTR [eax],al
 4b5:	13 d3                	adc    edx,ebx
 4b7:	00 00                	add    BYTE PTR [eax],al
 4b9:	00 01                	add    BYTE PTR [ecx],al
 4bb:	4f                   	dec    edi
 4bc:	01 74 00 00          	add    DWORD PTR [eax+eax*1+0x0],esi
 4c0:	00 02                	add    BYTE PTR [edx],al
 4c2:	91                   	xchg   ecx,eax
 4c3:	00 14 35 02 00 00 01 	add    BYTE PTR [esi*1+0x1000002],dl
 4ca:	51                   	push   ecx
 4cb:	01 89 04 00 00 03    	add    DWORD PTR [ecx+0x3000004],ecx
 4d1:	91                   	xchg   ecx,eax
 4d2:	ec                   	in     al,dx
 4d3:	75 14                	jne    4e9 <execInternalCommand-0x30ffb17>
 4d5:	b7 01                	mov    bh,0x1
 4d7:	00 00                	add    BYTE PTR [eax],al
 4d9:	01 52 01             	add    DWORD PTR [edx+0x1],edx
 4dc:	4f                   	dec    edi
 4dd:	00 00                	add    BYTE PTR [eax],al
 4df:	00 02                	add    BYTE PTR [edx],al
 4e1:	91                   	xchg   ecx,eax
 4e2:	6c                   	ins    BYTE PTR es:[edi],dx
 4e3:	00 16                	add    BYTE PTR [esi],dl
 4e5:	60                   	pusha  
 4e6:	00 00                	add    BYTE PTR [eax],al
 4e8:	00 01                	add    BYTE PTR [ecx],al
 4ea:	5d                   	pop    ebp
 4eb:	01 d7                	add    edi,edx
 4ed:	08 10                	or     BYTE PTR [eax],dl
 4ef:	03 58 00             	add    ebx,DWORD PTR [eax+0x0]
 4f2:	00 00                	add    BYTE PTR [eax],al
 4f4:	01 9c 1a 05 00 00 13 	add    DWORD PTR [edx+ebx*1+0x13000005],ebx
 4fb:	d3 00                	rol    DWORD PTR [eax],cl
 4fd:	00 00                	add    BYTE PTR [eax],al
 4ff:	01 5d 01             	add    DWORD PTR [ebp+0x1],ebx
 502:	74 00                	je     504 <execInternalCommand-0x30ffafc>
 504:	00 00                	add    BYTE PTR [eax],al
 506:	02 91 00 14 35 02    	add    dl,BYTE PTR [ecx+0x2351400]
 50c:	00 00                	add    BYTE PTR [eax],al
 50e:	01 5f 01             	add    DWORD PTR [edi+0x1],ebx
 511:	89 04 00             	mov    DWORD PTR [eax+eax*1],eax
 514:	00 03                	add    BYTE PTR [ebx],al
 516:	91                   	xchg   ecx,eax
 517:	f0 75 00             	lock jne 51a <execInternalCommand-0x30ffae6>
 51a:	17                   	pop    ss
 51b:	70 77                	jo     594 <execInternalCommand-0x30ffa6c>
 51d:	64 00 01             	add    BYTE PTR fs:[ecx],al
 520:	6a 01                	push   0x1
 522:	2f                   	das    
 523:	09 10                	or     DWORD PTR [eax],edx
 525:	03 4e 00             	add    ecx,DWORD PTR [esi+0x0]
 528:	00 00                	add    BYTE PTR [eax],al
 52a:	01 9c 40 05 00 00 15 	add    DWORD PTR [eax+eax*2+0x15000005],ebx
 531:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 534:	00 01                	add    BYTE PTR [ecx],al
 536:	6c                   	ins    BYTE PTR es:[edi],dx
 537:	01 74 00 00          	add    DWORD PTR [eax+eax*1+0x0],esi
 53b:	00 02                	add    BYTE PTR [edx],al
 53d:	91                   	xchg   ecx,eax
 53e:	6c                   	ins    BYTE PTR es:[edi],dx
 53f:	00 16                	add    BYTE PTR [esi],dl
 541:	89 02                	mov    DWORD PTR [edx],eax
 543:	00 00                	add    BYTE PTR [eax],al
 545:	01 79 01             	add    DWORD PTR [ecx+0x1],edi
 548:	7d 09                	jge    553 <execInternalCommand-0x30ffaad>
 54a:	10 03                	adc    BYTE PTR [ebx],al
 54c:	2e 00 00             	add    BYTE PTR cs:[eax],al
 54f:	00 01                	add    BYTE PTR [ecx],al
 551:	9c                   	pushf  
 552:	66 05 00 00          	add    ax,0x0
 556:	13 6f 03             	adc    ebp,DWORD PTR [edi+0x3]
 559:	00 00                	add    BYTE PTR [eax],al
 55b:	01 79 01             	add    DWORD PTR [ecx+0x1],edi
 55e:	74 00                	je     560 <execInternalCommand-0x30ffaa0>
 560:	00 00                	add    BYTE PTR [eax],al
 562:	02 91 00 00 18 1f    	add    dl,BYTE PTR [ecx+0x1f180000]
 568:	00 00                	add    BYTE PTR [eax],al
 56a:	00 01                	add    BYTE PTR [ecx],al
 56c:	7e 01                	jle    56f <execInternalCommand-0x30ffa91>
 56e:	ab                   	stos   DWORD PTR es:[edi],eax
 56f:	09 10                	or     DWORD PTR [eax],edx
 571:	03 1e                	add    ebx,DWORD PTR [esi]
 573:	00 00                	add    BYTE PTR [eax],al
 575:	00 01                	add    BYTE PTR [ecx],al
 577:	9c                   	pushf  
 578:	12 e4                	adc    ah,ah
 57a:	01 00                	add    DWORD PTR [eax],eax
 57c:	00 01                	add    BYTE PTR [ecx],al
 57e:	83 01 4f             	add    DWORD PTR [ecx],0x4f
 581:	00 00                	add    BYTE PTR [eax],al
 583:	00 c9                	add    cl,cl
 585:	09 10                	or     DWORD PTR [eax],edx
 587:	03 26                	add    esp,DWORD PTR [esi]
 589:	00 00                	add    BYTE PTR [eax],al
 58b:	00 01                	add    BYTE PTR [ecx],al
 58d:	9c                   	pushf  
 58e:	b0 05                	mov    al,0x5
 590:	00 00                	add    BYTE PTR [eax],al
 592:	13 6f 03             	adc    ebp,DWORD PTR [edi+0x3]
 595:	00 00                	add    BYTE PTR [eax],al
 597:	01 83 01 74 00 00    	add    DWORD PTR [ebx+0x7401],eax
 59d:	00 02                	add    BYTE PTR [edx],al
 59f:	91                   	xchg   ecx,eax
 5a0:	00 19                	add    BYTE PTR [ecx],bl
 5a2:	4a                   	dec    edx
 5a3:	03 00                	add    eax,DWORD PTR [eax]
 5a5:	00 01                	add    BYTE PTR [ecx],al
 5a7:	85 01                	test   DWORD PTR [ecx],eax
 5a9:	4f                   	dec    edi
 5aa:	00 00                	add    BYTE PTR [eax],al
 5ac:	00 1a                	add    BYTE PTR [edx],bl
 5ae:	00 00                	add    BYTE PTR [eax],al
 5b0:	12 77 03             	adc    dh,BYTE PTR [edi+0x3]
 5b3:	00 00                	add    BYTE PTR [eax],al
 5b5:	01 8b 01 4f 00 00    	add    DWORD PTR [ebx+0x4f01],ecx
 5bb:	00 ef                	add    bh,ch
 5bd:	09 10                	or     DWORD PTR [eax],edx
 5bf:	03 28                	add    ebp,DWORD PTR [eax]
 5c1:	03 00                	add    eax,DWORD PTR [eax]
 5c3:	00 01                	add    BYTE PTR [ecx],al
 5c5:	9c                   	pushf  
 5c6:	72 06                	jb     5ce <execInternalCommand-0x30ffa32>
 5c8:	00 00                	add    BYTE PTR [eax],al
 5ca:	13 1e                	adc    ebx,DWORD PTR [esi]
 5cc:	02 00                	add    al,BYTE PTR [eax]
 5ce:	00 01                	add    BYTE PTR [ecx],al
 5d0:	8b 01                	mov    eax,DWORD PTR [ecx]
 5d2:	4f                   	dec    edi
 5d3:	00 00                	add    BYTE PTR [eax],al
 5d5:	00 02                	add    BYTE PTR [edx],al
 5d7:	91                   	xchg   ecx,eax
 5d8:	00 13                	add    BYTE PTR [ebx],dl
 5da:	9a 02 00 00 01 8b 01 	call   0x18b:0x1000002
 5e1:	dc 02                	fadd   QWORD PTR [edx]
 5e3:	00 00                	add    BYTE PTR [eax],al
 5e5:	02 91 04 14 50 01    	add    dl,BYTE PTR [ecx+0x1501404]
 5eb:	00 00                	add    BYTE PTR [eax],al
 5ed:	01 8d 01 72 06 00    	add    DWORD PTR [ebp+0x67201],ecx
 5f3:	00 03                	add    BYTE PTR [ebx],al
 5f5:	91                   	xchg   ecx,eax
 5f6:	e4 7d                	in     al,0x7d
 5f8:	14 ca                	adc    al,0xca
 5fa:	02 00                	add    al,BYTE PTR [eax]
 5fc:	00 01                	add    BYTE PTR [ecx],al
 5fe:	8e 01                	mov    es,WORD PTR [ecx]
 600:	81 00 00 00 03 91    	add    DWORD PTR [eax],0x91030000
 606:	e3 7d                	jecxz  685 <execInternalCommand-0x30ff97b>
 608:	14 a9                	adc    al,0xa9
 60a:	00 00                	add    BYTE PTR [eax],al
 60c:	00 01                	add    BYTE PTR [ecx],al
 60e:	8f 01                	pop    DWORD PTR [ecx]
 610:	4f                   	dec    edi
 611:	00 00                	add    BYTE PTR [eax],al
 613:	00 02                	add    BYTE PTR [edx],al
 615:	91                   	xchg   ecx,eax
 616:	6c                   	ins    BYTE PTR es:[edi],dx
 617:	14 53                	adc    al,0x53
 619:	03 00                	add    eax,DWORD PTR [eax]
 61b:	00 01                	add    BYTE PTR [ecx],al
 61d:	90                   	nop
 61e:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 621:	00 00                	add    BYTE PTR [eax],al
 623:	02 91 68 14 e9 02    	add    dl,BYTE PTR [ecx+0x2e91468]
 629:	00 00                	add    BYTE PTR [eax],al
 62b:	01 91 01 82 06 00    	add    DWORD PTR [ecx+0x68201],edx
 631:	00 03                	add    BYTE PTR [ebx],al
 633:	91                   	xchg   ecx,eax
 634:	cf                   	iret   
 635:	7d 1b                	jge    652 <execInternalCommand-0x30ff9ae>
 637:	fb                   	sti    
 638:	01 00                	add    DWORD PTR [eax],eax
 63a:	00 01                	add    BYTE PTR [ecx],al
 63c:	9d                   	popf   
 63d:	01 5a 0a             	add    DWORD PTR [edx+0xa],ebx
 640:	10 03                	adc    BYTE PTR [ebx],al
 642:	1b 7e 03             	sbb    edi,DWORD PTR [esi+0x3]
 645:	00 00                	add    BYTE PTR [eax],al
 647:	01 a4 01 97 0a 10 03 	add    DWORD PTR [ecx+eax*1+0x3100a97],esp
 64e:	1b 00                	sbb    eax,DWORD PTR [eax]
 650:	00 00                	add    BYTE PTR [eax],al
 652:	00 01                	add    BYTE PTR [ecx],al
 654:	fa                   	cli    
 655:	01 69 0c             	add    DWORD PTR [ecx+0xc],ebp
 658:	10 03                	adc    BYTE PTR [ebx],al
 65a:	0f 5a 0a             	cvtps2pd xmm1,QWORD PTR [edx]
 65d:	10 03                	adc    BYTE PTR [ebx],al
 65f:	93                   	xchg   ebx,eax
 660:	02 00                	add    al,BYTE PTR [eax]
 662:	00 15 69 00 01 ff    	add    BYTE PTR ds:0xff010069,dl
 668:	01 4f 00             	add    DWORD PTR [edi+0x0],ecx
 66b:	00 00                	add    BYTE PTR [eax],al
 66d:	02 91 64 00 00 10    	add    dl,BYTE PTR [ecx+0x10000064]
 673:	7a 00                	jp     675 <execInternalCommand-0x30ff98b>
 675:	00 00                	add    BYTE PTR [eax],al
 677:	82                   	(bad)  
 678:	06                   	push   es
 679:	00 00                	add    BYTE PTR [eax],al
 67b:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 67e:	00 00                	add    BYTE PTR [eax],al
 680:	ff 00                	inc    DWORD PTR [eax]
 682:	10 7a 00             	adc    BYTE PTR [edx+0x0],bh
 685:	00 00                	add    BYTE PTR [eax],al
 687:	92                   	xchg   edx,eax
 688:	06                   	push   es
 689:	00 00                	add    BYTE PTR [eax],al
 68b:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 68e:	00 00                	add    BYTE PTR [eax],al
 690:	13 00                	adc    eax,DWORD PTR [eax]
 692:	1c 19                	sbb    al,0x19
 694:	03 00                	add    eax,DWORD PTR [eax]
 696:	00 05 33 8c 00 00    	add    BYTE PTR ds:0x8c33,al
 69c:	00 05 03 28 12 11    	add    BYTE PTR ds:0x11122803,al
 6a2:	03 1c 12             	add    ebx,DWORD PTR [edx+edx*1]
 6a5:	02 00                	add    al,BYTE PTR [eax]
 6a7:	00 05 34 8c 00 00    	add    BYTE PTR ds:0x8c34,al
 6ad:	00 05 03 2c 12 11    	add    BYTE PTR ds:0x11122c03,al
 6b3:	03 1c 58             	add    ebx,DWORD PTR [eax+ebx*2]
 6b6:	00 00                	add    BYTE PTR [eax],al
 6b8:	00 05 35 8c 00 00    	add    BYTE PTR ds:0x8c35,al
 6be:	00 05 03 24 12 11    	add    BYTE PTR ds:0x11122403,al
 6c4:	03 1c d3             	add    ebx,DWORD PTR [ebx+edx*8]
 6c7:	02 00                	add    al,BYTE PTR [eax]
 6c9:	00 06                	add    BYTE PTR [esi],al
 6cb:	37                   	aaa    
 6cc:	9e                   	sahf   
 6cd:	00 00                	add    BYTE PTR [eax],al
 6cf:	00 05 03 38 12 11    	add    BYTE PTR ds:0x11123803,al
 6d5:	03 10                	add    edx,DWORD PTR [eax]
 6d7:	7a 00                	jp     6d9 <execInternalCommand-0x30ff927>
 6d9:	00 00                	add    BYTE PTR [eax],al
 6db:	e7 06                	out    0x6,eax
 6dd:	00 00                	add    BYTE PTR [eax],al
 6df:	1d 6b 00 00 00       	sbb    eax,0x6b
 6e4:	ff 01                	inc    DWORD PTR [ecx]
 6e6:	00 1c 23             	add    BYTE PTR [ebx+eiz*1],bl
 6e9:	02 00                	add    al,BYTE PTR [eax]
 6eb:	00 04 20             	add    BYTE PTR [eax+eiz*1],al
 6ee:	d6                   	(bad)  
 6ef:	06                   	push   es
 6f0:	00 00                	add    BYTE PTR [eax],al
 6f2:	05 03 20 10 11       	add    eax,0x11102003
 6f7:	03 1c 59             	add    ebx,DWORD PTR [ecx+ebx*2]
 6fa:	01 00                	add    DWORD PTR [eax],eax
 6fc:	00 04 21             	add    BYTE PTR [ecx+eiz*1],al
 6ff:	74 00                	je     701 <execInternalCommand-0x30ff8ff>
 701:	00 00                	add    BYTE PTR [eax],al
 703:	05 03 34 12 11       	add    eax,0x11123403
 708:	03 10                	add    edx,DWORD PTR [eax]
 70a:	ed                   	in     eax,dx
 70b:	00 00                	add    BYTE PTR [eax],al
 70d:	00 19                	add    BYTE PTR [ecx],bl
 70f:	07                   	pop    es
 710:	00 00                	add    BYTE PTR [eax],al
 712:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 715:	00 00                	add    BYTE PTR [eax],al
 717:	04 00                	add    al,0x0
 719:	1c 2a                	sbb    al,0x2a
 71b:	03 00                	add    eax,DWORD PTR [eax]
 71d:	00 04 22             	add    BYTE PTR [edx+eiz*1],al
 720:	09 07                	or     DWORD PTR [edi],eax
 722:	00 00                	add    BYTE PTR [eax],al
 724:	05 03 c0 14 10       	add    eax,0x1014c003
 729:	03 1e                	add    ebx,DWORD PTR [esi]
 72b:	1c 93                	sbb    al,0x93
 72d:	01 00                	add    DWORD PTR [eax],eax
 72f:	00 04 29             	add    BYTE PTR [ecx+ebp*1],al
 732:	3c 07                	cmp    al,0x7
 734:	00 00                	add    BYTE PTR [eax],al
 736:	05 03 30 12 11       	add    eax,0x11123003
 73b:	03 05 04 2a 07 00    	add    eax,DWORD PTR ds:0x72a04
 741:	00 1f                	add    BYTE PTR [edi],bl
 743:	4d                   	dec    ebp
 744:	07                   	pop    es
 745:	00 00                	add    BYTE PTR [eax],al
 747:	20 74 00 00          	and    BYTE PTR [eax+eax*1+0x0],dh
 74b:	00 00                	add    BYTE PTR [eax],al
 74d:	1c 45                	sbb    al,0x45
 74f:	00 00                	add    BYTE PTR [eax],al
 751:	00 04 2a             	add    BYTE PTR [edx+ebp*1],al
 754:	5e                   	pop    esi
 755:	07                   	pop    es
 756:	00 00                	add    BYTE PTR [eax],al
 758:	05 03 20 12 11       	add    eax,0x11122003
 75d:	03 05 04 42 07 00    	add    eax,DWORD PTR ds:0x74204
 763:	00 1c 6c             	add    BYTE PTR [esp+ebp*2],bl
 766:	01 00                	add    DWORD PTR [eax],eax
 768:	00 01                	add    BYTE PTR [ecx],al
 76a:	11 97 00 00 00 05    	adc    DWORD PTR [edi+0x5000000],edx
 770:	03 00                	add    eax,DWORD PTR [eax]
 772:	16                   	push   ss
 773:	10 03                	adc    BYTE PTR [ebx],al
 775:	1c ae                	sbb    al,0xae
 777:	02 00                	add    al,BYTE PTR [eax]
 779:	00 01                	add    BYTE PTR [ecx],al
 77b:	12 8c 00 00 00 05 03 	adc    cl,BYTE PTR [eax+eax*1+0x3050000]
 782:	04 16                	add    al,0x16
 784:	10 03                	adc    BYTE PTR [ebx],al
 786:	10 7a 00             	adc    BYTE PTR [edx+0x0],bh
 789:	00 00                	add    BYTE PTR [eax],al
 78b:	96                   	xchg   esi,eax
 78c:	07                   	pop    es
 78d:	00 00                	add    BYTE PTR [eax],al
 78f:	11 6b 00             	adc    DWORD PTR [ebx+0x0],ebp
 792:	00 00                	add    BYTE PTR [eax],al
 794:	05 00 1c 8d 01       	add    eax,0x18d1c00
 799:	00 00                	add    BYTE PTR [eax],al
 79b:	01 13                	add    DWORD PTR [ebx],edx
 79d:	86 07                	xchg   BYTE PTR [edi],al
 79f:	00 00                	add    BYTE PTR [eax],al
 7a1:	05 03 10 15 10       	add    eax,0x10151003
 7a6:	03 10                	add    edx,DWORD PTR [eax]
 7a8:	7a 00                	jp     7aa <execInternalCommand-0x30ff856>
 7aa:	00 00                	add    BYTE PTR [eax],al
 7ac:	be 07 00 00 1d       	mov    esi,0x1d000007
 7b1:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 7b4:	00 f3                	add    bl,dh
 7b6:	01 11                	add    DWORD PTR [ecx],edx
 7b8:	6b 00 00             	imul   eax,DWORD PTR [eax],0x0
 7bb:	00 7f 00             	add    BYTE PTR [edi+0x0],bh
 7be:	1c 9f                	sbb    al,0x9f
 7c0:	02 00                	add    al,BYTE PTR [eax]
 7c2:	00 01                	add    BYTE PTR [ecx],al
 7c4:	14 a7                	adc    al,0xa7
 7c6:	07                   	pop    es
 7c7:	00 00                	add    BYTE PTR [eax],al
 7c9:	05 03 20 16 10       	add    eax,0x10162003
 7ce:	03 1c f7             	add    ebx,DWORD PTR [edi+esi*8]
 7d1:	02 00                	add    al,BYTE PTR [eax]
 7d3:	00 01                	add    BYTE PTR [ecx],al
 7d5:	15 4f 00 00 00       	adc    eax,0x4f
 7da:	05 03 08 16 10       	add    eax,0x10160803
 7df:	03 1c 66             	add    ebx,DWORD PTR [esi+eiz*2]
 7e2:	00 00                	add    BYTE PTR [eax],al
 7e4:	00 01                	add    BYTE PTR [ecx],al
 7e6:	16                   	push   ss
 7e7:	4f                   	dec    edi
 7e8:	00 00                	add    BYTE PTR [eax],al
 7ea:	00 05 03 0c 16 10    	add    BYTE PTR ds:0x10160c03,al
 7f0:	03 00                	add    eax,DWORD PTR [eax]

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
 162:	18 2e                	sbb    BYTE PTR [esi],ch
 164:	00 3f                	add    BYTE PTR [edi],bh
 166:	19 03                	sbb    DWORD PTR [ebx],eax
 168:	0e                   	push   cs
 169:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 16b:	3b 05 11 01 12 06    	cmp    eax,DWORD PTR ds:0x6120111
 171:	40                   	inc    eax
 172:	18 96 42 19 00 00    	sbb    BYTE PTR [esi+0x1942],dl
 178:	19 2e                	sbb    DWORD PTR [esi],ebp
 17a:	01 3f                	add    DWORD PTR [edi],edi
 17c:	19 03                	sbb    DWORD PTR [ebx],eax
 17e:	0e                   	push   cs
 17f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 181:	3b 05 49 13 3c 19    	cmp    eax,DWORD PTR ds:0x193c1349
 187:	00 00                	add    BYTE PTR [eax],al
 189:	1a 18                	sbb    bl,BYTE PTR [eax]
 18b:	00 00                	add    BYTE PTR [eax],al
 18d:	00 1b                	add    BYTE PTR [ebx],bl
 18f:	0a 00                	or     al,BYTE PTR [eax]
 191:	03 0e                	add    ecx,DWORD PTR [esi]
 193:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 195:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 19b:	1c 34                	sbb    al,0x34
 19d:	00 03                	add    BYTE PTR [ebx],al
 19f:	0e                   	push   cs
 1a0:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1a2:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1a4:	49                   	dec    ecx
 1a5:	13 3f                	adc    edi,DWORD PTR [edi]
 1a7:	19 02                	sbb    DWORD PTR [edx],eax
 1a9:	18 00                	sbb    BYTE PTR [eax],al
 1ab:	00 1d 21 00 49 13    	add    BYTE PTR ds:0x13490021,bl
 1b1:	2f                   	das    
 1b2:	05 00 00 1e 15       	add    eax,0x151e0000
 1b7:	00 27                	add    BYTE PTR [edi],ah
 1b9:	19 00                	sbb    DWORD PTR [eax],eax
 1bb:	00 1f                	add    BYTE PTR [edi],bl
 1bd:	15 01 27 19 01       	adc    eax,0x1192701
 1c2:	13 00                	adc    eax,DWORD PTR [eax]
 1c4:	00 20                	add    BYTE PTR [eax],ah
 1c6:	05 00 49 13 00       	add    eax,0x134900
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
  14:	17                   	pop    ss
  15:	0d 00 00 00 00       	or     eax,0x0
  1a:	00 00                	add    BYTE PTR [eax],al
  1c:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	c9                   	leave  
   1:	02 00                	add    al,BYTE PTR [eax]
   3:	00 02                	add    BYTE PTR [edx],al
   5:	00 bc 00 00 00 01 01 	add    BYTE PTR [eax+eax*1+0x1010000],bh
   c:	fb                   	sti    
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
  ce:	1c 01                	sbb    al,0x1
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
  f3:	4b                   	dec    ebx
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
 111:	25 13 08 4b 67       	and    eax,0x674b0813
 116:	e3 34                	jecxz  14c <execInternalCommand-0x30ffeb4>
 118:	00 02                	add    BYTE PTR [edx],al
 11a:	04 02                	add    al,0x2
 11c:	02 25 14 00 02 04    	add    ah,BYTE PTR ds:0x4020014
 122:	02 03                	add    al,BYTE PTR [ebx]
 124:	63 4a 00             	arpl   WORD PTR [edx+0x0],cx
 127:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 12a:	06                   	push   es
 12b:	4a                   	dec    edx
 12c:	06                   	push   es
 12d:	03 1f                	add    ebx,DWORD PTR [edi]
 12f:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 132:	4b                   	dec    ebx
 133:	08 4f 3d             	or     BYTE PTR [edi+0x3d],cl
 136:	5b                   	pop    ebx
 137:	6a 92                	push   0xffffff92
 139:	02 3b                	add    bh,BYTE PTR [ebx]
 13b:	14 69                	adc    al,0x69
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
 1db:	02 22                	add    ah,BYTE PTR [edx]
 1dd:	13 00                	adc    eax,DWORD PTR [eax]
 1df:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 1e2:	02 30                	add    dh,BYTE PTR [eax]
 1e4:	0f 00 02             	sldt   WORD PTR [edx]
 1e7:	04 01                	add    al,0x1
 1e9:	06                   	push   es
 1ea:	4a                   	dec    edx
 1eb:	06                   	push   es
 1ec:	87 3d 5b 67 00 02    	xchg   DWORD PTR ds:0x200675b,edi
 1f2:	04 03                	add    al,0x3
 1f4:	91                   	xchg   ecx,eax
 1f5:	00 02                	add    BYTE PTR [edx],al
 1f7:	04 03                	add    al,0x3
 1f9:	ff 00                	inc    DWORD PTR [eax]
 1fb:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 1fe:	06                   	push   es
 1ff:	4a                   	dec    edx
 200:	06                   	push   es
 201:	84 d7                	test   bh,dl
 203:	3f                   	aas    
 204:	91                   	xchg   ecx,eax
 205:	4b                   	dec    ebx
 206:	76 77                	jbe    27f <execInternalCommand-0x30ffd81>
 208:	08 bb 75 76 a1 08    	or     BYTE PTR [ebx+0x8a17675],bh
 20e:	59                   	pop    ecx
 20f:	30 08                	xor    BYTE PTR [eax],cl
 211:	84 4b 68             	test   BYTE PTR [ebx+0x68],cl
 214:	68 08 e5 08 14       	push   0x1408e508
 219:	4b                   	dec    ebx
 21a:	03 73 08             	add    esi,DWORD PTR [ebx+0x8]
 21d:	4a                   	dec    edx
 21e:	03 10                	add    edx,DWORD PTR [eax]
 220:	66                   	data16
 221:	02 24 14             	add    ah,BYTE PTR [esp+edx*1]
 224:	08 2f                	or     BYTE PTR [edi],ch
 226:	08 9f 68 af f6 00    	or     BYTE PTR [edi+0xf6af68],bl
 22c:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 22f:	08 30                	or     BYTE PTR [eax],dh
 231:	00 02                	add    BYTE PTR [edx],al
 233:	04 01                	add    al,0x1
 235:	08 4b 03             	or     BYTE PTR [ebx+0x3],cl
 238:	5d                   	pop    ebp
 239:	f2 03 24 20          	repnz add esp,DWORD PTR [eax+eiz*1]
 23d:	31 92 08 bc ae 08    	xor    DWORD PTR [edx+0x8aebc08],edx
 243:	24 02                	and    al,0x2
 245:	22 13                	and    dl,BYTE PTR [ebx]
 247:	31 93 08 ca 08 bd    	xor    DWORD PTR [ebx-0x42f735f8],edx
 24d:	9f                   	lahf   
 24e:	75 3f                	jne    28f <execInternalCommand-0x30ffd71>
 250:	67 08 2f             	or     BYTE PTR [bx],ch
 253:	02 24 13             	add    ah,BYTE PTR [ebx+edx*1]
 256:	d7                   	xlat   BYTE PTR ds:[ebx]
 257:	03 0b                	add    ecx,DWORD PTR [ebx]
 259:	3c 67                	cmp    al,0x67
 25b:	02 25 13 3f 67 08    	add    ah,BYTE PTR ds:0x8673f13
 261:	4b                   	dec    ebx
 262:	3f                   	aas    
 263:	67 59                	addr16 pop ecx
 265:	59                   	pop    ecx
 266:	08 30                	or     BYTE PTR [eax],dh
 268:	3f                   	aas    
 269:	92                   	xchg   edx,eax
 26a:	75 75                	jne    2e1 <execInternalCommand-0x30ffd1f>
 26c:	79 75                	jns    2e3 <execInternalCommand-0x30ffd1d>
 26e:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 271:	59                   	pop    ecx
 272:	08 5b 5b             	or     BYTE PTR [ebx+0x5b],bl
 275:	9f                   	lahf   
 276:	75 75                	jne    2ed <execInternalCommand-0x30ffd13>
 278:	75 08                	jne    282 <execInternalCommand-0x30ffd7e>
 27a:	83 5a 75 30          	sbb    DWORD PTR [edx+0x75],0x30
 27e:	08 56 b1             	or     BYTE PTR [esi-0x4f],dl
 281:	ae                   	scas   al,BYTE PTR es:[edi]
 282:	93                   	xchg   ebx,eax
 283:	bc 02 2d 13 83       	mov    esp,0x83132d02
 288:	08 21                	or     BYTE PTR [ecx],ah
 28a:	08 4c 5d e6          	or     BYTE PTR [ebp+ebx*2-0x1a],cl
 28e:	cb                   	retf   
 28f:	08 4c 02 2d          	or     BYTE PTR [edx+eax*1+0x2d],cl
 293:	13 83 e5 75 08 21    	adc    eax,DWORD PTR [ebx+0x210875e5]
 299:	08 4c 5d ae          	or     BYTE PTR [ebp+ebx*2-0x52],cl
 29d:	a0 f3 4d 5a e7       	mov    al,ds:0xe75a4df3
 2a2:	ae                   	scas   al,BYTE PTR es:[edi]
 2a3:	4b                   	dec    ebx
 2a4:	d7                   	xlat   BYTE PTR ds:[ebx]
 2a5:	03 0c 90             	add    ecx,DWORD PTR [eax+edx*4]
 2a8:	ae                   	scas   al,BYTE PTR es:[edi]
 2a9:	f3 03 0c 20          	repz add ecx,DWORD PTR [eax+eiz*1]
 2ad:	03 78 f2             	add    edi,DWORD PTR [eax-0xe]
 2b0:	08 67 08             	or     BYTE PTR [edi+0x8],ah
 2b3:	22 76 5d             	and    dh,BYTE PTR [esi+0x5d]
 2b6:	67 08 21             	or     BYTE PTR [bx+di],ah
 2b9:	08 4b 03             	or     BYTE PTR [ebx+0x3],cl
 2bc:	9b                   	fwait
 2bd:	7f 08                	jg     2c7 <execInternalCommand-0x30ffd39>
 2bf:	20 03                	and    BYTE PTR [ebx],al
 2c1:	e7 00                	out    0x0,eax
 2c3:	08 20                	or     BYTE PTR [eax],ah
 2c5:	08 13                	or     BYTE PTR [ebx],dl
 2c7:	59                   	pop    ecx
 2c8:	02 02                	add    al,BYTE PTR [edx]
 2ca:	00 01                	add    BYTE PTR [ecx],al
 2cc:	01                   	.byte 0x1

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
  1e:	00 70 72             	add    BYTE PTR [eax+0x72],dh
  21:	6f                   	outs   dx,DWORD PTR ds:[esi]
  22:	6d                   	ins    DWORD PTR es:[edi],dx
  23:	70 74                	jo     99 <execInternalCommand-0x30fff67>
  25:	00 2f                	add    BYTE PTR [edi],ch
  27:	68 6f 6d 65 2f       	push   0x2f656d6f
  2c:	79 6f                	jns    9d <execInternalCommand-0x30fff63>
  2e:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  35:	6f                   	outs   dx,DWORD PTR ds:[esi]
  36:	73 2f                	jae    67 <execInternalCommand-0x30fff99>
  38:	61                   	popa   
  39:	70 72                	jo     ad <execInternalCommand-0x30fff53>
  3b:	6f                   	outs   dx,DWORD PTR ds:[esi]
  3c:	6a 2f                	push   0x2f
  3e:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
  42:	6c                   	ins    BYTE PTR es:[edi],dx
  43:	6c                   	ins    BYTE PTR es:[edi],dx
  44:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
  47:	6d                   	ins    DWORD PTR es:[edi],dx
  48:	6d                   	ins    DWORD PTR es:[edi],dx
  49:	61                   	popa   
  4a:	6e                   	outs   dx,BYTE PTR ds:[esi]
  4b:	64                   	fs
  4c:	5f                   	pop    edi
  4d:	66                   	data16
  4e:	75 6e                	jne    be <execInternalCommand-0x30fff42>
  50:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
  54:	6e                   	outs   dx,BYTE PTR ds:[esi]
  55:	5f                   	pop    edi
  56:	70 00                	jo     58 <execInternalCommand-0x30fffa8>
  58:	68 65 61 70 45       	push   0x45706165
  5d:	6e                   	outs   dx,BYTE PTR ds:[esi]
  5e:	64 00 6b 45          	add    BYTE PTR fs:[ebx+0x45],ch
  62:	78 69                	js     cd <execInternalCommand-0x30fff33>
  64:	74 00                	je     66 <execInternalCommand-0x30fff9a>
  66:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  69:	6d                   	ins    DWORD PTR es:[edi],dx
  6a:	61                   	popa   
  6b:	6e                   	outs   dx,BYTE PTR ds:[esi]
  6c:	64                   	fs
  6d:	48                   	dec    eax
  6e:	69 73 74 6f 72 79 4d 	imul   esi,DWORD PTR [ebx+0x74],0x4d79726f
  75:	61                   	popa   
  76:	78 00                	js     78 <execInternalCommand-0x30fff88>
  78:	64                   	fs
  79:	65                   	gs
  7a:	73 63                	jae    df <execInternalCommand-0x30fff21>
  7c:	72 69                	jb     e7 <execInternalCommand-0x30fff19>
  7e:	70 74                	jo     f4 <execInternalCommand-0x30fff0c>
  80:	69 6f 6e 00 74 65 6d 	imul   ebp,DWORD PTR [edi+0x6e],0x6d657400
  87:	70 00                	jo     89 <execInternalCommand-0x30fff77>
  89:	70 61                	jo     ec <execInternalCommand-0x30fff14>
  8b:	72 73                	jb     100 <execInternalCommand-0x30fff00>
  8d:	65                   	gs
  8e:	50                   	push   eax
  8f:	61                   	popa   
  90:	72 61                	jb     f3 <execInternalCommand-0x30fff0d>
  92:	6d                   	ins    DWORD PTR es:[edi],dx
  93:	73 53                	jae    e8 <execInternalCommand-0x30fff18>
  95:	68 65 6c 6c 00       	push   0x6c6c65
  9a:	69 6e 70 75 74 00 73 	imul   ebp,DWORD PTR [esi+0x70],0x73007475
  a1:	69 7a 65 74 79 70 65 	imul   edi,DWORD PTR [edx+0x65],0x65707974
  a8:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
  ac:	72 72                	jb     120 <execInternalCommand-0x30ffee0>
  ae:	4b                   	dec    ebx
  af:	65                   	gs
  b0:	79 43                	jns    f5 <execInternalCommand-0x30fff0b>
  b2:	6f                   	outs   dx,DWORD PTR ds:[esi]
  b3:	75 6e                	jne    123 <execInternalCommand-0x30ffedd>
  b5:	74 00                	je     b7 <execInternalCommand-0x30fff49>
  b7:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
  ba:	6d                   	ins    DWORD PTR es:[edi],dx
  bb:	61                   	popa   
  bc:	6e                   	outs   dx,BYTE PTR ds:[esi]
  bd:	64                   	fs
  be:	5f                   	pop    edi
  bf:	74 61                	je     122 <execInternalCommand-0x30ffede>
  c1:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
  c5:	74 00                	je     c7 <execInternalCommand-0x30fff39>
  c7:	70 61                	jo     12a <execInternalCommand-0x30ffed6>
  c9:	72 73                	jb     13e <execInternalCommand-0x30ffec2>
  cb:	65                   	gs
  cc:	64                   	fs
  cd:	43                   	inc    ebx
  ce:	68 61 72 73 00       	push   0x737261
  d3:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
  d6:	6c                   	ins    BYTE PTR es:[edi],dx
  d7:	69 6e 65 00 70 70 74 	imul   ebp,DWORD PTR [esi+0x65],0x74707000
  de:	72 00                	jb     e0 <execInternalCommand-0x30fff20>
  e0:	47                   	inc    edi
  e1:	4e                   	dec    esi
  e2:	55                   	push   ebp
  e3:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  e6:	39 20                	cmp    DWORD PTR [eax],esp
  e8:	35 2e 33 2e 30       	xor    eax,0x302e332e
  ed:	20 2d 6d 61 73 6d    	and    BYTE PTR ds:0x6d73616d,ch
  f3:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  f8:	6c                   	ins    BYTE PTR es:[edi],dx
  f9:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  ff:	65                   	gs
 100:	3d 67 65 6e 65       	cmp    eax,0x656e6567
 105:	72 69                	jb     170 <execInternalCommand-0x30ffe90>
 107:	63 20                	arpl   WORD PTR [eax],sp
 109:	2d 6d 61 72 63       	sub    eax,0x6372616d
 10e:	68 3d 70 65 6e       	push   0x6e65703d
 113:	74 69                	je     17e <execInternalCommand-0x30ffe82>
 115:	75 6d                	jne    184 <execInternalCommand-0x30ffe7c>
 117:	70 72                	jo     18b <execInternalCommand-0x30ffe75>
 119:	6f                   	outs   dx,DWORD PTR ds:[esi]
 11a:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
 120:	74 64                	je     186 <execInternalCommand-0x30ffe7a>
 122:	3d 63 39 39 20       	cmp    eax,0x20393963
 127:	2d 66 66 72 65       	sub    eax,0x65726666
 12c:	65                   	gs
 12d:	73 74                	jae    1a3 <execInternalCommand-0x30ffe5d>
 12f:	61                   	popa   
 130:	6e                   	outs   dx,BYTE PTR ds:[esi]
 131:	64 69 6e 67 00 65 78 	imul   ebp,DWORD PTR fs:[esi+0x67],0x65786500
 138:	65 
 139:	63 50 61             	arpl   WORD PTR [eax+0x61],dx
 13c:	72 61                	jb     19f <execInternalCommand-0x30ffe61>
 13e:	6d                   	ins    DWORD PTR es:[edi],dx
 13f:	43                   	inc    ebx
 140:	6f                   	outs   dx,DWORD PTR ds:[esi]
 141:	75 6e                	jne    1b1 <execInternalCommand-0x30ffe4f>
 143:	74 00                	je     145 <execInternalCommand-0x30ffebb>
 145:	65                   	gs
 146:	78 65                	js     1ad <execInternalCommand-0x30ffe53>
 148:	63 49 6e             	arpl   WORD PTR [ecx+0x6e],cx
 14b:	74 65                	je     1b2 <execInternalCommand-0x30ffe4e>
 14d:	72 6e                	jb     1bd <execInternalCommand-0x30ffe43>
 14f:	61                   	popa   
 150:	6c                   	ins    BYTE PTR es:[edi],dx
 151:	43                   	inc    ebx
 152:	6f                   	outs   dx,DWORD PTR ds:[esi]
 153:	6d                   	ins    DWORD PTR es:[edi],dx
 154:	6d                   	ins    DWORD PTR es:[edi],dx
 155:	61                   	popa   
 156:	6e                   	outs   dx,BYTE PTR ds:[esi]
 157:	64 00 73 4b          	add    BYTE PTR fs:[ebx+0x4b],dh
 15b:	53                   	push   ebx
 15c:	68 65 6c 6c 50       	push   0x506c6c65
 161:	72 6f                	jb     1d2 <execInternalCommand-0x30ffe2e>
 163:	67 72 61             	addr16 jb 1c7 <execInternalCommand-0x30ffe39>
 166:	6d                   	ins    DWORD PTR es:[edi],dx
 167:	4e                   	dec    esi
 168:	61                   	popa   
 169:	6d                   	ins    DWORD PTR es:[edi],dx
 16a:	65 00 74 69 6d       	add    BYTE PTR gs:[ecx+ebp*2+0x6d],dh
 16f:	65                   	gs
 170:	54                   	push   esp
 171:	6f                   	outs   dx,DWORD PTR ds:[esi]
 172:	45                   	inc    ebp
 173:	78 69                	js     1de <execInternalCommand-0x30ffe22>
 175:	74 00                	je     177 <execInternalCommand-0x30ffe89>
 177:	64                   	fs
 178:	71 75                	jno    1ef <execInternalCommand-0x30ffe11>
 17a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 17b:	74 65                	je     1e2 <execInternalCommand-0x30ffe1e>
 17d:	00 74 69 6d          	add    BYTE PTR [ecx+ebp*2+0x6d],dh
 181:	65                   	gs
 182:	5f                   	pop    edi
 183:	74 00                	je     185 <execInternalCommand-0x30ffe7b>
 185:	75 69                	jne    1f0 <execInternalCommand-0x30ffe10>
 187:	6e                   	outs   dx,BYTE PTR ds:[esi]
 188:	74 38                	je     1c2 <execInternalCommand-0x30ffe3e>
 18a:	5f                   	pop    edi
 18b:	74 00                	je     18d <execInternalCommand-0x30ffe73>
 18d:	64                   	fs
 18e:	65                   	gs
 18f:	6c                   	ins    BYTE PTR es:[edi],dx
 190:	69 6d 00 63 6f 6d 6d 	imul   ebp,DWORD PTR [ebp+0x0],0x6d6d6f63
 197:	61                   	popa   
 198:	6e                   	outs   dx,BYTE PTR ds:[esi]
 199:	64                   	fs
 19a:	5f                   	pop    edi
 19b:	66                   	data16
 19c:	75 6e                	jne    20c <execInternalCommand-0x30ffdf4>
 19e:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 1a2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1a3:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
 1a6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1a7:	72 74                	jb     21d <execInternalCommand-0x30ffde3>
 1a9:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 1ac:	74 00                	je     1ae <execInternalCommand-0x30ffe52>
 1ae:	66                   	data16
 1af:	72 65                	jb     216 <execInternalCommand-0x30ffdea>
 1b1:	65                   	gs
 1b2:	41                   	inc    ecx
 1b3:	72 67                	jb     21c <execInternalCommand-0x30ffde4>
 1b5:	56                   	push   esi
 1b6:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 1b9:	72 61                	jb     21c <execInternalCommand-0x30ffde4>
 1bb:	6d                   	ins    DWORD PTR es:[edi],dx
 1bc:	43                   	inc    ebx
 1bd:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1be:	75 6e                	jne    22e <execInternalCommand-0x30ffdd2>
 1c0:	74 00                	je     1c2 <execInternalCommand-0x30ffe3e>
 1c2:	70 63                	jo     227 <execInternalCommand-0x30ffdd9>
 1c4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1c5:	75 6e                	jne    235 <execInternalCommand-0x30ffdcb>
 1c7:	74 00                	je     1c9 <execInternalCommand-0x30ffe37>
 1c9:	6c                   	ins    BYTE PTR es:[edi],dx
 1ca:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1cb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1cc:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 1d0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1d1:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
 1d5:	74 00                	je     1d7 <execInternalCommand-0x30ffe29>
 1d7:	70 61                	jo     23a <execInternalCommand-0x30ffdc6>
 1d9:	72 61                	jb     23c <execInternalCommand-0x30ffdc4>
 1db:	6d                   	ins    DWORD PTR es:[edi],dx
 1dc:	73 54                	jae    232 <execInternalCommand-0x30ffdce>
 1de:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1df:	41                   	inc    ecx
 1e0:	72 67                	jb     249 <execInternalCommand-0x30ffdb7>
 1e2:	76 00                	jbe    1e4 <execInternalCommand-0x30ffe1c>
 1e4:	72 65                	jb     24b <execInternalCommand-0x30ffdb5>
 1e6:	70 72                	jo     25a <execInternalCommand-0x30ffda6>
 1e8:	69 6e 74 43 6f 6d 6d 	imul   ebp,DWORD PTR [esi+0x74],0x6d6d6f43
 1ef:	61                   	popa   
 1f0:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1f1:	64 00 62 73          	add    BYTE PTR fs:[edx+0x73],ah
 1f5:	71 75                	jno    26c <execInternalCommand-0x30ffd94>
 1f7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1f8:	74 65                	je     25f <execInternalCommand-0x30ffda1>
 1fa:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 1fd:	74 41                	je     240 <execInternalCommand-0x30ffdc0>
 1ff:	43                   	inc    ebx
 200:	6f                   	outs   dx,DWORD PTR ds:[esi]
 201:	6d                   	ins    DWORD PTR es:[edi],dx
 202:	6d                   	ins    DWORD PTR es:[edi],dx
 203:	61                   	popa   
 204:	6e                   	outs   dx,BYTE PTR ds:[esi]
 205:	64 00 62 61          	add    BYTE PTR fs:[edx+0x61],ah
 209:	63 6b 67             	arpl   WORD PTR [ebx+0x67],bp
 20c:	72 6f                	jb     27d <execInternalCommand-0x30ffd83>
 20e:	75 6e                	jne    27e <execInternalCommand-0x30ffd82>
 210:	64 00 68 65          	add    BYTE PTR fs:[eax+0x65],ch
 214:	61                   	popa   
 215:	70 43                	jo     25a <execInternalCommand-0x30ffda6>
 217:	75 72                	jne    28b <execInternalCommand-0x30ffd75>
 219:	72 00                	jb     21b <execInternalCommand-0x30ffde5>
 21b:	6d                   	ins    DWORD PTR es:[edi],dx
 21c:	61                   	popa   
 21d:	78 61                	js     280 <execInternalCommand-0x30ffd80>
 21f:	72 67                	jb     288 <execInternalCommand-0x30ffd78>
 221:	63 00                	arpl   WORD PTR [eax],ax
 223:	73 45                	jae    26a <execInternalCommand-0x30ffd96>
 225:	78 65                	js     28c <execInternalCommand-0x30ffd74>
 227:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 22a:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
 231:	72 61                	jb     294 <execInternalCommand-0x30ffd6c>
 233:	6d                   	ins    DWORD PTR es:[edi],dx
 234:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 237:	72 61                	jb     29a <execInternalCommand-0x30ffd66>
 239:	6d                   	ins    DWORD PTR es:[edi],dx
 23a:	73 00                	jae    23c <execInternalCommand-0x30ffdc4>
 23c:	6e                   	outs   dx,BYTE PTR ds:[esi]
 23d:	61                   	popa   
 23e:	6d                   	ins    DWORD PTR es:[edi],dx
 23f:	65 00 6e 65          	add    BYTE PTR gs:[esi+0x65],ch
 243:	65                   	gs
 244:	64                   	fs
 245:	44                   	inc    esp
 246:	6f                   	outs   dx,DWORD PTR ds:[esi]
 247:	75 62                	jne    2ab <execInternalCommand-0x30ffd55>
 249:	6c                   	ins    BYTE PTR es:[edi],dx
 24a:	65                   	gs
 24b:	51                   	push   ecx
 24c:	75 6f                	jne    2bd <execInternalCommand-0x30ffd43>
 24e:	74 65                	je     2b5 <execInternalCommand-0x30ffd4b>
 250:	74 6f                	je     2c1 <execInternalCommand-0x30ffd3f>
 252:	45                   	inc    ebp
 253:	6e                   	outs   dx,BYTE PTR ds:[esi]
 254:	64                   	fs
 255:	50                   	push   eax
 256:	61                   	popa   
 257:	72 61                	jb     2ba <execInternalCommand-0x30ffd46>
 259:	6d                   	ins    DWORD PTR es:[edi],dx
 25a:	00 75 6e             	add    BYTE PTR [ebp+0x6e],dh
 25d:	73 69                	jae    2c8 <execInternalCommand-0x30ffd38>
 25f:	67 6e                	outs   dx,BYTE PTR ds:[si]
 261:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 266:	61                   	popa   
 267:	72 00                	jb     269 <execInternalCommand-0x30ffd97>
 269:	6c                   	ins    BYTE PTR es:[edi],dx
 26a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 26b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 26c:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
 270:	6e                   	outs   dx,BYTE PTR ds:[esi]
 271:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
 275:	73 69                	jae    2e0 <execInternalCommand-0x30ffd20>
 277:	67 6e                	outs   dx,BYTE PTR ds:[si]
 279:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 27e:	74 00                	je     280 <execInternalCommand-0x30ffd80>
 280:	75 69                	jne    2eb <execInternalCommand-0x30ffd15>
 282:	6e                   	outs   dx,BYTE PTR ds:[esi]
 283:	74 33                	je     2b8 <execInternalCommand-0x30ffd48>
 285:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 288:	00 73 61             	add    BYTE PTR [ebx+0x61],dh
 28b:	76 65                	jbe    2f2 <execInternalCommand-0x30ffd0e>
 28d:	43                   	inc    ebx
 28e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 28f:	6d                   	ins    DWORD PTR es:[edi],dx
 290:	6d                   	ins    DWORD PTR es:[edi],dx
 291:	61                   	popa   
 292:	6e                   	outs   dx,BYTE PTR ds:[esi]
 293:	64 00 62 75          	add    BYTE PTR fs:[edx+0x75],ah
 297:	69 6c 64 61 72 67 76 	imul   ebp,DWORD PTR [esp+eiz*2+0x61],0x766772
 29e:	00 
 29f:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 2a2:	6d                   	ins    DWORD PTR es:[edi],dx
 2a3:	61                   	popa   
 2a4:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2a5:	64                   	fs
 2a6:	48                   	dec    eax
 2a7:	69 73 74 6f 72 79 00 	imul   esi,DWORD PTR [ebx+0x74],0x79726f
 2ae:	65                   	gs
 2af:	78 69                	js     31a <execInternalCommand-0x30ffce6>
 2b1:	74 43                	je     2f6 <execInternalCommand-0x30ffd0a>
 2b3:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2b4:	64 65 00 73 68       	fs add BYTE PTR fs:gs:[ebx+0x68],dh
 2b9:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2ba:	72 74                	jb     330 <execInternalCommand-0x30ffcd0>
 2bc:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 2bf:	73 69                	jae    32a <execInternalCommand-0x30ffcd6>
 2c1:	67 6e                	outs   dx,BYTE PTR ds:[si]
 2c3:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 2c8:	74 00                	je     2ca <execInternalCommand-0x30ffd36>
 2ca:	6c                   	ins    BYTE PTR es:[edi],dx
 2cb:	43                   	inc    ebx
 2cc:	75 72                	jne    340 <execInternalCommand-0x30ffcc0>
 2ce:	72 4b                	jb     31b <execInternalCommand-0x30ffce5>
 2d0:	65                   	gs
 2d1:	79 00                	jns    2d3 <execInternalCommand-0x30ffd2d>
 2d3:	6c                   	ins    BYTE PTR es:[edi],dx
 2d4:	69 62 63 54 5a 00 5f 	imul   esp,DWORD PTR [edx+0x63],0x5f005a54
 2db:	42                   	inc    edx
 2dc:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2dd:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2de:	6c                   	ins    BYTE PTR es:[edi],dx
 2df:	00 6b 73             	add    BYTE PTR [ebx+0x73],ch
 2e2:	68 65 6c 6c 2e       	push   0x2e6c6c65
 2e7:	63 00                	arpl   WORD PTR [eax],ax
 2e9:	61                   	popa   
 2ea:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2eb:	73 69                	jae    356 <execInternalCommand-0x30ffcaa>
 2ed:	53                   	push   ebx
 2ee:	65                   	gs
 2ef:	71 00                	jno    2f1 <execInternalCommand-0x30ffd0f>
 2f1:	65                   	gs
 2f2:	78 65                	js     359 <execInternalCommand-0x30ffca7>
 2f4:	63 70 00             	arpl   WORD PTR [eax+0x0],si
 2f7:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 2fa:	6d                   	ins    DWORD PTR es:[edi],dx
 2fb:	61                   	popa   
 2fc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2fd:	64                   	fs
 2fe:	48                   	dec    eax
 2ff:	69 73 74 6f 72 79 50 	imul   esi,DWORD PTR [ebx+0x74],0x5079726f
 306:	74 72                	je     37a <execInternalCommand-0x30ffc86>
 308:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 30b:	6d                   	ins    DWORD PTR es:[edi],dx
 30c:	73 00                	jae    30e <execInternalCommand-0x30ffcf2>
 30e:	73 69                	jae    379 <execInternalCommand-0x30ffc87>
 310:	7a 65                	jp     377 <execInternalCommand-0x30ffc89>
 312:	00 6e 61             	add    BYTE PTR [esi+0x61],ch
 315:	72 67                	jb     37e <execInternalCommand-0x30ffc82>
 317:	76 00                	jbe    319 <execInternalCommand-0x30ffce7>
 319:	68 65 61 70 42       	push   0x42706165
 31e:	61                   	popa   
 31f:	73 65                	jae    386 <execInternalCommand-0x30ffc7a>
 321:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 324:	64                   	fs
 325:	4c                   	dec    esp
 326:	69 6e 65 00 63 6d 64 	imul   ebp,DWORD PTR [esi+0x65],0x646d6300
 32d:	73 00                	jae    32f <execInternalCommand-0x30ffcd1>
 32f:	66 69 6e 64 43 6f    	imul   bp,WORD PTR [esi+0x64],0x6f43
 335:	6d                   	ins    DWORD PTR es:[edi],dx
 336:	6d                   	ins    DWORD PTR es:[edi],dx
 337:	61                   	popa   
 338:	6e                   	outs   dx,BYTE PTR ds:[esi]
 339:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 33d:	70 79                	jo     3b8 <execInternalCommand-0x30ffc48>
 33f:	62 75 66             	bound  esi,QWORD PTR [ebp+0x66]
 342:	00 6b 53             	add    BYTE PTR [ebx+0x53],ch
 345:	6c                   	ins    BYTE PTR es:[edi],dx
 346:	65                   	gs
 347:	65                   	gs
 348:	70 00                	jo     34a <execInternalCommand-0x30ffcb6>
 34a:	72 65                	jb     3b1 <execInternalCommand-0x30ffc4f>
 34c:	73 65                	jae    3b3 <execInternalCommand-0x30ffc4d>
 34e:	74 52                	je     3a2 <execInternalCommand-0x30ffc5e>
 350:	6f                   	outs   dx,DWORD PTR ds:[esi]
 351:	77 00                	ja     353 <execInternalCommand-0x30ffcad>
 353:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 356:	6d                   	ins    DWORD PTR es:[edi],dx
 357:	61                   	popa   
 358:	6e                   	outs   dx,BYTE PTR ds:[esi]
 359:	64                   	fs
 35a:	57                   	push   edi
 35b:	61                   	popa   
 35c:	73 46                	jae    3a4 <execInternalCommand-0x30ffc5c>
 35e:	72 6f                	jb     3cf <execInternalCommand-0x30ffc31>
 360:	6d                   	ins    DWORD PTR es:[edi],dx
 361:	54                   	push   esp
 362:	68 69 73 42 75       	push   0x75427369
 367:	66                   	data16
 368:	66                   	data16
 369:	65                   	gs
 36a:	72 50                	jb     3bc <execInternalCommand-0x30ffc44>
 36c:	74 72                	je     3e0 <execInternalCommand-0x30ffc20>
 36e:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 371:	6d                   	ins    DWORD PTR es:[edi],dx
 372:	6d                   	ins    DWORD PTR es:[edi],dx
 373:	61                   	popa   
 374:	6e                   	outs   dx,BYTE PTR ds:[esi]
 375:	64 00 6b 53          	add    BYTE PTR fs:[ebx+0x53],ch
 379:	68 65 6c 6c 00       	push   0x6c6c65
 37e:	67                   	addr16
 37f:	65                   	gs
 380:	74 41                	je     3c3 <execInternalCommand-0x30ffc3d>
 382:	4b                   	dec    ebx
 383:	65                   	gs
 384:	79 00                	jns    386 <execInternalCommand-0x30ffc7a>

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
