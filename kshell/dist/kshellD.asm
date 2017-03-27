
Debug/cross-Linux/kshell:     file format elf32-i386


Disassembly of section .text:

03100000 <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/kshell/kshell.c:23

extern int kATADeviceInfoCount;


int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 3100000:	55                   	push   ebp
 3100001:	89 e5                	mov    ebp,esp
 3100003:	53                   	push   ebx
 3100004:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/kshell/kshell.c:24
    int x=0,y=0;
 3100007:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310000e:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:25
    int lRetVal=0,parsedChars=0;
 3100015:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 310001c:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:27
    
    memset(params,0, size);
 3100023:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100026:	83 ec 04             	sub    esp,0x4
 3100029:	50                   	push   eax
 310002a:	6a 00                	push   0x0
 310002c:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 310002f:	e8 8c 08 00 00       	call   31008c0 <kExit+0xec>
 3100034:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:29
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100037:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 310003e:	e9 c9 00 00 00       	jmp    310010c <parseParamsShell+0x10c>
/home/yogi/src/os/kshell/kshell.c:32
    {
        //print("c=%c\n", cmdLine[cnt]);
        if ( (cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',')
 3100043:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100046:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100049:	01 d0                	add    eax,edx
 310004b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310004e:	3c 20                	cmp    al,0x20
 3100050:	74 1e                	je     3100070 <parseParamsShell+0x70>
/home/yogi/src/os/kshell/kshell.c:32 (discriminator 1)
 3100052:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100055:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100058:	01 d0                	add    eax,edx
 310005a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310005d:	3c 2d                	cmp    al,0x2d
 310005f:	74 0f                	je     3100070 <parseParamsShell+0x70>
/home/yogi/src/os/kshell/kshell.c:32 (discriminator 2)
 3100061:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100064:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100067:	01 d0                	add    eax,edx
 3100069:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310006c:	3c 2c                	cmp    al,0x2c
 310006e:	75 6f                	jne    31000df <parseParamsShell+0xdf>
/home/yogi/src/os/kshell/kshell.c:35
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 3100070:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100073:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100076:	01 d0                	add    eax,edx
 3100078:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310007b:	3c 2d                	cmp    al,0x2d
 310007d:	74 0f                	je     310008e <parseParamsShell+0x8e>
/home/yogi/src/os/kshell/kshell.c:35 (discriminator 1)
 310007f:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100082:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100085:	01 d0                	add    eax,edx
 3100087:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310008a:	3c 2f                	cmp    al,0x2f
 310008c:	75 25                	jne    31000b3 <parseParamsShell+0xb3>
/home/yogi/src/os/kshell/kshell.c:36
                params[y][x++]=cmdLine[cnt];
 310008e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100091:	c1 e0 09             	shl    eax,0x9
 3100094:	89 c2                	mov    edx,eax
 3100096:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100099:	8d 0c 02             	lea    ecx,[edx+eax*1]
 310009c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310009f:	8d 50 01             	lea    edx,[eax+0x1]
 31000a2:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31000a5:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31000a8:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 31000ab:	01 da                	add    edx,ebx
 31000ad:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31000b0:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/kshell/kshell.c:37
            params[y][x]='\0';
 31000b3:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31000b6:	c1 e0 09             	shl    eax,0x9
 31000b9:	89 c2                	mov    edx,eax
 31000bb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31000be:	01 c2                	add    edx,eax
 31000c0:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31000c3:	01 d0                	add    eax,edx
 31000c5:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:38
            if (cnt>0)
 31000c8:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 31000cc:	74 36                	je     3100104 <parseParamsShell+0x104>
/home/yogi/src/os/kshell/kshell.c:39
                {x=0;y++;lRetVal++;}
 31000ce:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31000d5:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 31000d9:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/kshell/kshell.c:38
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 31000dd:	eb 25                	jmp    3100104 <parseParamsShell+0x104>
/home/yogi/src/os/kshell/kshell.c:44
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 31000df:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31000e2:	c1 e0 09             	shl    eax,0x9
 31000e5:	89 c2                	mov    edx,eax
 31000e7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31000ea:	8d 0c 02             	lea    ecx,[edx+eax*1]
 31000ed:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31000f0:	8d 50 01             	lea    edx,[eax+0x1]
 31000f3:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31000f6:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31000f9:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 31000fc:	01 da                	add    edx,ebx
 31000fe:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100101:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/kshell/kshell.c:46 (discriminator 2)
        }
        parsedChars++;
 3100104:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/kshell/kshell.c:29 (discriminator 2)
    int x=0,y=0;
    int lRetVal=0,parsedChars=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100108:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/kshell/kshell.c:29 (discriminator 1)
 310010c:	83 ec 0c             	sub    esp,0xc
 310010f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100112:	e8 c9 07 00 00       	call   31008e0 <kExit+0x10c>
 3100117:	83 c4 10             	add    esp,0x10
 310011a:	3b 45 e4             	cmp    eax,DWORD PTR [ebp-0x1c]
 310011d:	0f 87 20 ff ff ff    	ja     3100043 <parseParamsShell+0x43>
/home/yogi/src/os/kshell/kshell.c:48
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 3100123:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100127:	74 19                	je     3100142 <parseParamsShell+0x142>
/home/yogi/src/os/kshell/kshell.c:50
    {
        lRetVal++;
 3100129:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/kshell/kshell.c:51
        params[y][x]='\0';
 310012d:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100130:	c1 e0 09             	shl    eax,0x9
 3100133:	89 c2                	mov    edx,eax
 3100135:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100138:	01 c2                	add    edx,eax
 310013a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310013d:	01 d0                	add    eax,edx
 310013f:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:56
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 3100142:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/kshell/kshell.c:57
}
 3100145:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100148:	c9                   	leave  
 3100149:	c3                   	ret    

0310014a <findCommand>:
findCommand():
/home/yogi/src/os/kshell/kshell.c:60

int findCommand(char* command)
{
 310014a:	55                   	push   ebp
 310014b:	89 e5                	mov    ebp,esp
 310014d:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:64
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 3100150:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100157:	eb 4d                	jmp    31001a6 <findCommand+0x5c>
/home/yogi/src/os/kshell/kshell.c:66
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 3100159:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310015c:	c1 e0 04             	shl    eax,0x4
 310015f:	05 c0 0d 10 03       	add    eax,0x3100dc0
 3100164:	8b 00                	mov    eax,DWORD PTR [eax]
 3100166:	83 ec 0c             	sub    esp,0xc
 3100169:	50                   	push   eax
 310016a:	e8 71 07 00 00       	call   31008e0 <kExit+0x10c>
 310016f:	83 c4 10             	add    esp,0x10
 3100172:	89 c2                	mov    edx,eax
 3100174:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100177:	c1 e0 04             	shl    eax,0x4
 310017a:	05 c0 0d 10 03       	add    eax,0x3100dc0
 310017f:	8b 00                	mov    eax,DWORD PTR [eax]
 3100181:	83 ec 04             	sub    esp,0x4
 3100184:	52                   	push   edx
 3100185:	50                   	push   eax
 3100186:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100189:	e8 22 07 00 00       	call   31008b0 <kExit+0xdc>
 310018e:	83 c4 10             	add    esp,0x10
 3100191:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:68
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 3100194:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 3100198:	75 08                	jne    31001a2 <findCommand+0x58>
/home/yogi/src/os/kshell/kshell.c:71
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 310019a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310019d:	83 c0 01             	add    eax,0x1
 31001a0:	eb 0f                	jmp    31001b1 <findCommand+0x67>
/home/yogi/src/os/kshell/kshell.c:64 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 31001a2:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:64 (discriminator 1)
 31001a6:	83 7d f4 02          	cmp    DWORD PTR [ebp-0xc],0x2
 31001aa:	76 ad                	jbe    3100159 <findCommand+0xf>
/home/yogi/src/os/kshell/kshell.c:75
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 31001ac:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/kshell/kshell.c:76
}
 31001b1:	c9                   	leave  
 31001b2:	c3                   	ret    

031001b3 <buildargv>:
buildargv():
/home/yogi/src/os/kshell/kshell.c:82



/*parts from http://*/
char **buildargv (const char *input)
{
 31001b3:	55                   	push   ebp
 31001b4:	89 e5                	mov    ebp,esp
 31001b6:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/kshell/kshell.c:85
  char *arg;
  char *copybuf;
  int squote = 0;
 31001b9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/kshell/kshell.c:86
  int dquote = 0;
 31001c0:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:87
  int bsquote = 0;
 31001c7:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/kshell/kshell.c:88
  int argc = 0;
 31001ce:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/kshell/kshell.c:89
  int maxargc = 0;
 31001d5:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/kshell/kshell.c:90
  char **argv = NULL;
 31001dc:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/kshell/kshell.c:94
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 31001e3:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 31001e7:	0f 84 33 02 00 00    	je     3100420 <buildargv+0x26d>
/home/yogi/src/os/kshell/kshell.c:97
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 31001ed:	83 ec 0c             	sub    esp,0xc
 31001f0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31001f3:	e8 e8 06 00 00       	call   31008e0 <kExit+0x10c>
 31001f8:	83 c4 10             	add    esp,0x10
 31001fb:	83 c0 01             	add    eax,0x1
 31001fe:	83 ec 0c             	sub    esp,0xc
 3100201:	50                   	push   eax
 3100202:	e8 89 06 00 00       	call   3100890 <kExit+0xbc>
 3100207:	83 c4 10             	add    esp,0x10
 310020a:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:105
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 310020d:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 3100211:	74 0b                	je     310021e <buildargv+0x6b>
/home/yogi/src/os/kshell/kshell.c:105 (discriminator 1)
 3100213:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100216:	83 e8 01             	sub    eax,0x1
 3100219:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 310021c:	7f 3d                	jg     310025b <buildargv+0xa8>
/home/yogi/src/os/kshell/kshell.c:108
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 310021e:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 3100222:	75 1c                	jne    3100240 <buildargv+0x8d>
/home/yogi/src/os/kshell/kshell.c:110
		{
		  maxargc = INITIAL_MAXARGC;
 3100224:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/kshell/kshell.c:111
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 310022b:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 310022e:	c1 e0 02             	shl    eax,0x2
 3100231:	83 ec 0c             	sub    esp,0xc
 3100234:	50                   	push   eax
 3100235:	e8 56 06 00 00       	call   3100890 <kExit+0xbc>
 310023a:	83 c4 10             	add    esp,0x10
 310023d:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/kshell/kshell.c:113
		}
	      argv = nargv;
 3100240:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 3100243:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/kshell/kshell.c:114
	      argv[argc] = NULL;
 3100246:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100249:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 3100250:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100253:	01 d0                	add    eax,edx
 3100255:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:117
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 310025b:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310025e:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:118
	  while (*input != EOS)
 3100261:	e9 ec 00 00 00       	jmp    3100352 <buildargv+0x19f>
/home/yogi/src/os/kshell/kshell.c:120
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100266:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100269:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310026c:	3c 20                	cmp    al,0x20
 310026e:	75 16                	jne    3100286 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:120 (discriminator 1)
 3100270:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 3100274:	75 10                	jne    3100286 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:120 (discriminator 2)
 3100276:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 310027a:	75 0a                	jne    3100286 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:120 (discriminator 3)
 310027c:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100280:	0f 84 da 00 00 00    	je     3100360 <buildargv+0x1ad>
/home/yogi/src/os/kshell/kshell.c:126
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100286:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310028a:	74 1d                	je     31002a9 <buildargv+0xf6>
/home/yogi/src/os/kshell/kshell.c:128
		    {
		      bsquote = 0;
 310028c:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/kshell/kshell.c:129
		      *arg++ = *input;
 3100293:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100296:	8d 50 01             	lea    edx,[eax+0x1]
 3100299:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310029c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310029f:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31002a2:	88 10                	mov    BYTE PTR [eax],dl
 31002a4:	e9 a5 00 00 00       	jmp    310034e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:131
		    }
		  else if (*input == '\\')
 31002a9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31002ac:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31002af:	3c 5c                	cmp    al,0x5c
 31002b1:	75 0c                	jne    31002bf <buildargv+0x10c>
/home/yogi/src/os/kshell/kshell.c:133
		    {
		      bsquote = 1;
 31002b3:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 31002ba:	e9 8f 00 00 00       	jmp    310034e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:135
		    }
		  else if (squote)
 31002bf:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31002c3:	74 26                	je     31002eb <buildargv+0x138>
/home/yogi/src/os/kshell/kshell.c:137
		    {
		      if (*input == '\'')
 31002c5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31002c8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31002cb:	3c 27                	cmp    al,0x27
 31002cd:	75 09                	jne    31002d8 <buildargv+0x125>
/home/yogi/src/os/kshell/kshell.c:139
			{
			  squote = 0;
 31002cf:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 31002d6:	eb 76                	jmp    310034e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:143
			}
		      else
			{
			  *arg++ = *input;
 31002d8:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31002db:	8d 50 01             	lea    edx,[eax+0x1]
 31002de:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31002e1:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31002e4:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31002e7:	88 10                	mov    BYTE PTR [eax],dl
 31002e9:	eb 63                	jmp    310034e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:146
			}
		    }
		  else if (dquote)
 31002eb:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31002ef:	74 26                	je     3100317 <buildargv+0x164>
/home/yogi/src/os/kshell/kshell.c:148
		    {
		      if (*input == '"')
 31002f1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31002f4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31002f7:	3c 22                	cmp    al,0x22
 31002f9:	75 09                	jne    3100304 <buildargv+0x151>
/home/yogi/src/os/kshell/kshell.c:150
			{
			  dquote = 0;
 31002fb:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 3100302:	eb 4a                	jmp    310034e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:154
			}
		      else
			{
			  *arg++ = *input;
 3100304:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100307:	8d 50 01             	lea    edx,[eax+0x1]
 310030a:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 310030d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100310:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100313:	88 10                	mov    BYTE PTR [eax],dl
 3100315:	eb 37                	jmp    310034e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:159
			}
		    }
		  else
		    {
		      if (*input == '\'')
 3100317:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310031a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310031d:	3c 27                	cmp    al,0x27
 310031f:	75 09                	jne    310032a <buildargv+0x177>
/home/yogi/src/os/kshell/kshell.c:161
			{
			  squote = 1;
 3100321:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 3100328:	eb 24                	jmp    310034e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:163
			}
		      else if (*input == '"')
 310032a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310032d:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100330:	3c 22                	cmp    al,0x22
 3100332:	75 09                	jne    310033d <buildargv+0x18a>
/home/yogi/src/os/kshell/kshell.c:165
			{
			  dquote = 1;
 3100334:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 310033b:	eb 11                	jmp    310034e <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:169
			}
		      else
			{
			  *arg++ = *input;
 310033d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100340:	8d 50 01             	lea    edx,[eax+0x1]
 3100343:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100346:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100349:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310034c:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/kshell/kshell.c:173
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 310034e:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/kshell/kshell.c:118
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 3100352:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100355:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100358:	84 c0                	test   al,al
 310035a:	0f 85 06 ff ff ff    	jne    3100266 <buildargv+0xb3>
/home/yogi/src/os/kshell/kshell.c:176
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 3100360:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100363:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:178
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100366:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100369:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310036c:	84 c0                	test   al,al
 310036e:	0f 84 9e 00 00 00    	je     3100412 <buildargv+0x25f>
/home/yogi/src/os/kshell/kshell.c:180
          {
            char* temp=malloc(strlen(copybuf)+1);
 3100374:	83 ec 0c             	sub    esp,0xc
 3100377:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310037a:	e8 61 05 00 00       	call   31008e0 <kExit+0x10c>
 310037f:	83 c4 10             	add    esp,0x10
 3100382:	83 c0 01             	add    eax,0x1
 3100385:	83 ec 0c             	sub    esp,0xc
 3100388:	50                   	push   eax
 3100389:	e8 02 05 00 00       	call   3100890 <kExit+0xbc>
 310038e:	83 c4 10             	add    esp,0x10
 3100391:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/kshell/kshell.c:183
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 3100394:	83 ec 08             	sub    esp,0x8
 3100397:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 310039a:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 310039d:	e8 9e 04 00 00       	call   3100840 <kExit+0x6c>
 31003a2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:184
            free(copybuf);
 31003a5:	83 ec 0c             	sub    esp,0xc
 31003a8:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31003ab:	e8 40 05 00 00       	call   31008f0 <kExit+0x11c>
 31003b0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:185
            copybuf = (char *) malloc (strlen (input) + 1);
 31003b3:	83 ec 0c             	sub    esp,0xc
 31003b6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31003b9:	e8 22 05 00 00       	call   31008e0 <kExit+0x10c>
 31003be:	83 c4 10             	add    esp,0x10
 31003c1:	83 c0 01             	add    eax,0x1
 31003c4:	83 ec 0c             	sub    esp,0xc
 31003c7:	50                   	push   eax
 31003c8:	e8 c3 04 00 00       	call   3100890 <kExit+0xbc>
 31003cd:	83 c4 10             	add    esp,0x10
 31003d0:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:186
            argv[argc] = temp;
 31003d3:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31003d6:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31003dd:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31003e0:	01 c2                	add    edx,eax
 31003e2:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 31003e5:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/kshell/kshell.c:188
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 31003e7:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/kshell/kshell.c:189
            argv[argc] = NULL;
 31003eb:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31003ee:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31003f5:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31003f8:	01 d0                	add    eax,edx
 31003fa:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:190
            input++;
 3100400:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/kshell/kshell.c:191
            free(temp);
 3100404:	83 ec 0c             	sub    esp,0xc
 3100407:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 310040a:	e8 e1 04 00 00       	call   31008f0 <kExit+0x11c>
 310040f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:194
          }
	}
      while (*input != EOS);
 3100412:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100415:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100418:	84 c0                	test   al,al
 310041a:	0f 85 ed fd ff ff    	jne    310020d <buildargv+0x5a>
/home/yogi/src/os/kshell/kshell.c:197
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 3100420:	83 ec 0c             	sub    esp,0xc
 3100423:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100426:	e8 c5 04 00 00       	call   31008f0 <kExit+0x11c>
 310042b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:198
  free(nargv);
 310042e:	83 ec 0c             	sub    esp,0xc
 3100431:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 3100434:	e8 b7 04 00 00       	call   31008f0 <kExit+0x11c>
 3100439:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:199
  return (argv);
 310043c:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/kshell/kshell.c:200
}
 310043f:	c9                   	leave  
 3100440:	c3                   	ret    

03100441 <helpMe>:
helpMe():
/home/yogi/src/os/kshell/kshell.c:203

void helpMe()
{
 3100441:	55                   	push   ebp
 3100442:	89 e5                	mov    ebp,esp
 3100444:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:204
    print("Help:\n");
 3100447:	83 ec 0c             	sub    esp,0xc
 310044a:	68 49 09 10 03       	push   0x3100949
 310044f:	e8 0c 04 00 00       	call   3100860 <kExit+0x8c>
 3100454:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:205
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100457:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 310045e:	eb 30                	jmp    3100490 <helpMe+0x4f>
/home/yogi/src/os/kshell/kshell.c:206 (discriminator 3)
        print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 3100460:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100463:	c1 e0 04             	shl    eax,0x4
 3100466:	05 c4 0d 10 03       	add    eax,0x3100dc4
 310046b:	8b 10                	mov    edx,DWORD PTR [eax]
 310046d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100470:	c1 e0 04             	shl    eax,0x4
 3100473:	05 c0 0d 10 03       	add    eax,0x3100dc0
 3100478:	8b 00                	mov    eax,DWORD PTR [eax]
 310047a:	83 ec 04             	sub    esp,0x4
 310047d:	52                   	push   edx
 310047e:	50                   	push   eax
 310047f:	68 50 09 10 03       	push   0x3100950
 3100484:	e8 d7 03 00 00       	call   3100860 <kExit+0x8c>
 3100489:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:205 (discriminator 3)
}

void helpMe()
{
    print("Help:\n");
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 310048c:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:205 (discriminator 1)
 3100490:	83 7d f4 02          	cmp    DWORD PTR [ebp-0xc],0x2
 3100494:	76 ca                	jbe    3100460 <helpMe+0x1f>
/home/yogi/src/os/kshell/kshell.c:207
        print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
}
 3100496:	90                   	nop
 3100497:	c9                   	leave  
 3100498:	c3                   	ret    

03100499 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/kshell/kshell.c:232
    strcpy(sExecutingProgram,sbootShellProgramName);
}
*/

void execInternalCommand(char lCommand[256])
{
 3100499:	55                   	push   ebp
 310049a:	89 e5                	mov    ebp,esp
 310049c:	53                   	push   ebx
 310049d:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/kshell/kshell.c:233
    int i = findCommand(lCommand);
 31004a0:	83 ec 0c             	sub    esp,0xc
 31004a3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31004a6:	e8 9f fc ff ff       	call   310014a <findCommand>
 31004ab:	83 c4 10             	add    esp,0x10
 31004ae:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:235

    if(i>0)
 31004b1:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31004b5:	7e 74                	jle    310052b <execInternalCommand+0x92>
/home/yogi/src/os/kshell/kshell.c:237
    {
        i--;
 31004b7:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:239
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 31004bb:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004be:	c1 e0 04             	shl    eax,0x4
 31004c1:	05 c8 0d 10 03       	add    eax,0x3100dc8
 31004c6:	8b 00                	mov    eax,DWORD PTR [eax]
 31004c8:	a3 f4 10 10 03       	mov    ds:0x31010f4,eax
/home/yogi/src/os/kshell/kshell.c:240
        command_function_p = cmds[i].function;
 31004cd:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004d0:	c1 e0 04             	shl    eax,0x4
 31004d3:	05 c8 0d 10 03       	add    eax,0x3100dc8
 31004d8:	8b 00                	mov    eax,DWORD PTR [eax]
 31004da:	a3 e0 10 10 03       	mov    ds:0x31010e0,eax
/home/yogi/src/os/kshell/kshell.c:241
        if (cmds[i].paramCount==0)
 31004df:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004e2:	c1 e0 04             	shl    eax,0x4
 31004e5:	05 cc 0d 10 03       	add    eax,0x3100dcc
 31004ea:	8b 00                	mov    eax,DWORD PTR [eax]
 31004ec:	85 c0                	test   eax,eax
 31004ee:	75 09                	jne    31004f9 <execInternalCommand+0x60>
/home/yogi/src/os/kshell/kshell.c:242
            command_function();
 31004f0:	a1 f4 10 10 03       	mov    eax,ds:0x31010f4
 31004f5:	ff d0                	call   eax
/home/yogi/src/os/kshell/kshell.c:252
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
    }
}
 31004f7:	eb 45                	jmp    310053e <execInternalCommand+0xa5>
/home/yogi/src/os/kshell/kshell.c:245
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  
 31004f9:	8b 1d e0 10 10 03    	mov    ebx,DWORD PTR ds:0x31010e0
 31004ff:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100502:	c1 e0 04             	shl    eax,0x4
 3100505:	05 c0 0d 10 03       	add    eax,0x3100dc0
 310050a:	8b 00                	mov    eax,DWORD PTR [eax]
 310050c:	83 ec 0c             	sub    esp,0xc
 310050f:	50                   	push   eax
 3100510:	e8 cb 03 00 00       	call   31008e0 <kExit+0x10c>
 3100515:	83 c4 10             	add    esp,0x10
 3100518:	8d 50 01             	lea    edx,[eax+0x1]
 310051b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310051e:	01 d0                	add    eax,edx
 3100520:	83 ec 0c             	sub    esp,0xc
 3100523:	50                   	push   eax
 3100524:	ff d3                	call   ebx
 3100526:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:252
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
    }
}
 3100529:	eb 13                	jmp    310053e <execInternalCommand+0xa5>
/home/yogi/src/os/kshell/kshell.c:250
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  
        }
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
 310052b:	83 ec 08             	sub    esp,0x8
 310052e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100531:	68 5c 09 10 03       	push   0x310095c
 3100536:	e8 25 03 00 00       	call   3100860 <kExit+0x8c>
 310053b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:252
    }
}
 310053e:	90                   	nop
 310053f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100542:	c9                   	leave  
 3100543:	c3                   	ret    

03100544 <execp>:
execp():
/home/yogi/src/os/kshell/kshell.c:255

void execp(char* cmdline)
{
 3100544:	55                   	push   ebp
 3100545:	89 e5                	mov    ebp,esp
 3100547:	53                   	push   ebx
 3100548:	81 ec 14 14 00 00    	sub    esp,0x1414
/home/yogi/src/os/kshell/kshell.c:257
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 310054e:	83 ec 04             	sub    esp,0x4
 3100551:	68 00 14 00 00       	push   0x1400
 3100556:	8d 85 f0 eb ff ff    	lea    eax,[ebp-0x1410]
 310055c:	50                   	push   eax
 310055d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100560:	e8 9b fa ff ff       	call   3100000 <parseParamsShell>
 3100565:	83 c4 10             	add    esp,0x10
 3100568:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:258
    uint32_t pid=0;
 310056b:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:260

    print("Executing %s\n",params[0]);
 3100572:	83 ec 08             	sub    esp,0x8
 3100575:	8d 85 f0 eb ff ff    	lea    eax,[ebp-0x1410]
 310057b:	50                   	push   eax
 310057c:	68 7c 09 10 03       	push   0x310097c
 3100581:	e8 da 02 00 00       	call   3100860 <kExit+0x8c>
 3100586:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:261
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
/home/yogi/src/os/kshell/kshell.c:268
            "push ecx\n"
            "push edx\n"
            "int 0x80\n"
            :"=a" (pid)
            :"a" (0x59),"b" (params[0]),"c" (0),"d" (0));
    print("Waiting on pid=0x%08X\n",pid);
 31005a7:	83 ec 08             	sub    esp,0x8
 31005aa:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005ad:	68 8a 09 10 03       	push   0x310098a
 31005b2:	e8 a9 02 00 00       	call   3100860 <kExit+0x8c>
 31005b7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:269
    waitpid(pid);
 31005ba:	83 ec 0c             	sub    esp,0xc
 31005bd:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005c0:	e8 8b 02 00 00       	call   3100850 <kExit+0x7c>
 31005c5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:270
    print("pid=0x%08X returned\n",pid);
 31005c8:	83 ec 08             	sub    esp,0x8
 31005cb:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31005ce:	68 a1 09 10 03       	push   0x31009a1
 31005d3:	e8 88 02 00 00       	call   3100860 <kExit+0x8c>
 31005d8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:273
    //exec(params[0],0,0);
    //strcpy(sExecutingProgram,params[0]+1);
}
 31005db:	90                   	nop
 31005dc:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31005df:	c9                   	leave  
 31005e0:	c3                   	ret    

031005e1 <kShell>:
kShell():
/home/yogi/src/os/kshell/kshell.c:276

int kShell(int argc, char** argv)
{
 31005e1:	55                   	push   ebp
 31005e2:	89 e5                	mov    ebp,esp
 31005e4:	81 ec f8 0a 00 00    	sub    esp,0xaf8
/home/yogi/src/os/kshell/kshell.c:278
    char lCommand[256];
    uint8_t lCurrKey=0;
 31005ea:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:279
    int lCurrKeyCount=0;
 31005f1:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/kshell/kshell.c:281
    char commands[50][50];
    int commandsPtr=0;
 31005f8:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:282
    int commandBuffPtr=0;
 31005ff:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/kshell/kshell.c:283
    int commandWasFromThisBufferPtr=0;
 3100606:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:286
    char ansiSeq[20];

    ansiSeq[0]=0x1b;
 310060d:	c6 85 0b f5 ff ff 1b 	mov    BYTE PTR [ebp-0xaf5],0x1b
/home/yogi/src/os/kshell/kshell.c:287
    sKShellProgramName=malloc(1024);
 3100614:	83 ec 0c             	sub    esp,0xc
 3100617:	68 00 04 00 00       	push   0x400
 310061c:	e8 6f 02 00 00       	call   3100890 <kExit+0xbc>
 3100621:	83 c4 10             	add    esp,0x10
 3100624:	a3 00 11 10 03       	mov    ds:0x3101100,eax
/home/yogi/src/os/kshell/kshell.c:288
    strcpy(sKShellProgramName,"kShell");
 3100629:	a1 00 11 10 03       	mov    eax,ds:0x3101100
 310062e:	83 ec 08             	sub    esp,0x8
 3100631:	68 b6 09 10 03       	push   0x31009b6
 3100636:	50                   	push   eax
 3100637:	e8 04 02 00 00       	call   3100840 <kExit+0x6c>
 310063c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:289
    strcpy(sExecutingProgram,sKShellProgramName);
 310063f:	a1 00 11 10 03       	mov    eax,ds:0x3101100
 3100644:	83 ec 08             	sub    esp,0x8
 3100647:	50                   	push   eax
 3100648:	68 e0 0e 10 03       	push   0x3100ee0
 310064d:	e8 ee 01 00 00       	call   3100840 <kExit+0x6c>
 3100652:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:290
    puts("\nWelcome to kShell ... hang a while!\n");
 3100655:	83 ec 0c             	sub    esp,0xc
 3100658:	68 c0 09 10 03       	push   0x31009c0
 310065d:	e8 1e 02 00 00       	call   3100880 <kExit+0xac>
 3100662:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:292

    while (!timeToExit)
 3100665:	e9 51 01 00 00       	jmp    31007bb <kShell+0x1da>
/home/yogi/src/os/kshell/kshell.c:295
    {
getACommand:
        lCurrKey=0;
 310066a:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:296
        lCurrKeyCount=0;
 3100671:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/kshell/kshell.c:297
        memset(lCommand,0,256);
 3100678:	83 ec 04             	sub    esp,0x4
 310067b:	68 00 01 00 00       	push   0x100
 3100680:	6a 00                	push   0x0
 3100682:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 3100688:	50                   	push   eax
 3100689:	e8 32 02 00 00       	call   31008c0 <kExit+0xec>
 310068e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:298
        print("%s> ",sExecutingProgram);
 3100691:	83 ec 08             	sub    esp,0x8
 3100694:	68 e0 0e 10 03       	push   0x3100ee0
 3100699:	68 e6 09 10 03       	push   0x31009e6
 310069e:	e8 bd 01 00 00       	call   3100860 <kExit+0x8c>
 31006a3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:300
getAKey:
        lCurrKey=0;
 31006a6:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:301
        while(lCurrKey==0)
 31006ad:	eb 16                	jmp    31006c5 <kShell+0xe4>
/home/yogi/src/os/kshell/kshell.c:303
        {
            gets(&lCurrKey,1,1);
 31006af:	83 ec 04             	sub    esp,0x4
 31006b2:	6a 01                	push   0x1
 31006b4:	6a 01                	push   0x1
 31006b6:	8d 85 e3 fe ff ff    	lea    eax,[ebp-0x11d]
 31006bc:	50                   	push   eax
 31006bd:	e8 ae 01 00 00       	call   3100870 <kExit+0x9c>
 31006c2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:301
        lCurrKeyCount=0;
        memset(lCommand,0,256);
        print("%s> ",sExecutingProgram);
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 31006c5:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31006cc:	84 c0                	test   al,al
 31006ce:	74 df                	je     31006af <kShell+0xce>
/home/yogi/src/os/kshell/kshell.c:306
        {
            gets(&lCurrKey,1,1);
        }
        //print("key='%08X'",lCurrKey);
        if((byte)lCurrKey==0xc8) //up
 31006d0:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31006d7:	3c c8                	cmp    al,0xc8
 31006d9:	75 08                	jne    31006e3 <kShell+0x102>
/home/yogi/src/os/kshell/kshell.c:308
        {
            if (commandBuffPtr>=0)
 31006db:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31006df:	79 02                	jns    31006e3 <kShell+0x102>
/home/yogi/src/os/kshell/kshell.c:321
                lCurrKeyCount=strlen(lCommand);
                cursorMoveTo(4+lCurrKeyCount,lTemp);
                goto getAKey;*/
            }
            else
                goto getAKey;
 31006e1:	eb c3                	jmp    31006a6 <kShell+0xc5>
/home/yogi/src/os/kshell/kshell.c:323
        }
        if (lCurrKey==0xD0)  //down
 31006e3:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31006ea:	3c d0                	cmp    al,0xd0
 31006ec:	75 0a                	jne    31006f8 <kShell+0x117>
/home/yogi/src/os/kshell/kshell.c:325
        {
            if (commandBuffPtr<=commandsPtr)
 31006ee:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 31006f1:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 31006f4:	7e 02                	jle    31006f8 <kShell+0x117>
/home/yogi/src/os/kshell/kshell.c:338
                lCurrKeyCount=strlen(lCommand);
                cursorMoveTo(4+lCurrKeyCount,lTemp);
                goto getAKey;*/
            }
            else
                goto getAKey;
 31006f6:	eb ae                	jmp    31006a6 <kShell+0xc5>
/home/yogi/src/os/kshell/kshell.c:341
            
        }   
        if (lCurrKey==0xcb) //left
 31006f8:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31006ff:	3c cb                	cmp    al,0xcb
 3100701:	75 02                	jne    3100705 <kShell+0x124>
/home/yogi/src/os/kshell/kshell.c:350
            {
                cursorMoveTo(cursorGetPosX()-1,cursorGetPosY());
                lCurrKeyCount--;
            }
             */
            goto getAKey;
 3100703:	eb a1                	jmp    31006a6 <kShell+0xc5>
/home/yogi/src/os/kshell/kshell.c:352
        }
        if (lCurrKey=='\b')
 3100705:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 310070c:	3c 08                	cmp    al,0x8
 310070e:	75 15                	jne    3100725 <kShell+0x144>
/home/yogi/src/os/kshell/kshell.c:354
        {
            if (lCurrKeyCount>0)
 3100710:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 3100714:	7e 90                	jle    31006a6 <kShell+0xc5>
/home/yogi/src/os/kshell/kshell.c:356
            {
                putc('\b');
 3100716:	83 ec 0c             	sub    esp,0xc
 3100719:	6a 08                	push   0x8
 310071b:	e8 b0 01 00 00       	call   31008d0 <kExit+0xfc>
 3100720:	83 c4 10             	add    esp,0x10
 3100723:	eb 81                	jmp    31006a6 <kShell+0xc5>
/home/yogi/src/os/kshell/kshell.c:368
                cursorMoveTo(cursorGetPosX()-1,lTemp);*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
 3100725:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 310072c:	3c 0a                	cmp    al,0xa
 310072e:	74 1c                	je     310074c <kShell+0x16b>
/home/yogi/src/os/kshell/kshell.c:374
        {
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 3100730:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100733:	8d 50 01             	lea    edx,[eax+0x1]
 3100736:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100739:	0f b6 95 e3 fe ff ff 	movzx  edx,BYTE PTR [ebp-0x11d]
 3100740:	88 94 05 e4 fe ff ff 	mov    BYTE PTR [ebp+eax*1-0x11c],dl
/home/yogi/src/os/kshell/kshell.c:376
        }
        goto getAKey;
 3100747:	e9 5a ff ff ff       	jmp    31006a6 <kShell+0xc5>
/home/yogi/src/os/kshell/kshell.c:370
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
        {
            goto doneGettingKeys;
 310074c:	90                   	nop
/home/yogi/src/os/kshell/kshell.c:379
            lCommand[lCurrKeyCount++]=lCurrKey;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 310074d:	0f b6 85 e4 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11c]
 3100754:	84 c0                	test   al,al
 3100756:	75 05                	jne    310075d <kShell+0x17c>
/home/yogi/src/os/kshell/kshell.c:380
            goto getACommand;
 3100758:	e9 0d ff ff ff       	jmp    310066a <kShell+0x89>
/home/yogi/src/os/kshell/kshell.c:381
        int i = findCommand(lCommand);
 310075d:	83 ec 0c             	sub    esp,0xc
 3100760:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 3100766:	50                   	push   eax
 3100767:	e8 de f9 ff ff       	call   310014a <findCommand>
 310076c:	83 c4 10             	add    esp,0x10
 310076f:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/kshell/kshell.c:383

        execInternalCommand(lCommand);
 3100772:	83 ec 0c             	sub    esp,0xc
 3100775:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 310077b:	50                   	push   eax
 310077c:	e8 18 fd ff ff       	call   3100499 <execInternalCommand>
 3100781:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:384
        if(i>0)
 3100784:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100788:	7e 31                	jle    31007bb <kShell+0x1da>
/home/yogi/src/os/kshell/kshell.c:386
        {
            i--;
 310078a:	83 6d e4 01          	sub    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/kshell/kshell.c:395
//                for (int cnt=commandWasFromThisBufferPtr;cnt<=commandsPtr;cnt++)
//                    strcpy(commands[cnt],commands[cnt+1]);
//                commandWasFromThisBufferPtr=0;
//                commandsPtr--;
            }
            strcpy(commands[commandsPtr++],lCommand);
 310078e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100791:	8d 50 01             	lea    edx,[eax+0x1]
 3100794:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 3100797:	8d 95 1f f5 ff ff    	lea    edx,[ebp-0xae1]
 310079d:	6b c0 32             	imul   eax,eax,0x32
 31007a0:	01 c2                	add    edx,eax
 31007a2:	83 ec 08             	sub    esp,0x8
 31007a5:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 31007ab:	50                   	push   eax
 31007ac:	52                   	push   edx
 31007ad:	e8 8e 00 00 00       	call   3100840 <kExit+0x6c>
 31007b2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:396
            commandBuffPtr=commandsPtr;
 31007b5:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31007b8:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/kshell/kshell.c:292
    sKShellProgramName=malloc(1024);
    strcpy(sKShellProgramName,"kShell");
    strcpy(sExecutingProgram,sKShellProgramName);
    puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
 31007bb:	0f b6 05 c0 0e 10 03 	movzx  eax,BYTE PTR ds:0x3100ec0
 31007c2:	83 f0 01             	xor    eax,0x1
 31007c5:	84 c0                	test   al,al
 31007c7:	0f 85 9d fe ff ff    	jne    310066a <kShell+0x89>
/home/yogi/src/os/kshell/kshell.c:399
            }
            strcpy(commands[commandsPtr++],lCommand);
            commandBuffPtr=commandsPtr;
        }
    }
    return exitCode;
 31007cd:	a1 c4 0e 10 03       	mov    eax,ds:0x3100ec4
/home/yogi/src/os/kshell/kshell.c:400
}
 31007d2:	c9                   	leave  
 31007d3:	c3                   	ret    

031007d4 <kExit>:
kExit():
/home/yogi/src/os/kshell/kshell.c:403

void kExit(char *cmdline)
{
 31007d4:	55                   	push   ebp
 31007d5:	89 e5                	mov    ebp,esp
 31007d7:	81 ec 08 14 00 00    	sub    esp,0x1408
/home/yogi/src/os/kshell/kshell.c:406
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
 31007dd:	83 ec 04             	sub    esp,0x4
 31007e0:	68 00 14 00 00       	push   0x1400
 31007e5:	8d 85 f8 eb ff ff    	lea    eax,[ebp-0x1408]
 31007eb:	50                   	push   eax
 31007ec:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31007ef:	e8 0c f8 ff ff       	call   3100000 <parseParamsShell>
 31007f4:	83 c4 10             	add    esp,0x10
 31007f7:	85 c0                	test   eax,eax
 31007f9:	74 1d                	je     3100818 <kExit+0x44>
/home/yogi/src/os/kshell/kshell.c:408
    {
        exitCode = strtoul(params[0],0,10);
 31007fb:	83 ec 04             	sub    esp,0x4
 31007fe:	6a 0a                	push   0xa
 3100800:	6a 00                	push   0x0
 3100802:	8d 85 f8 eb ff ff    	lea    eax,[ebp-0x1408]
 3100808:	50                   	push   eax
 3100809:	e8 92 00 00 00       	call   31008a0 <kExit+0xcc>
 310080e:	83 c4 10             	add    esp,0x10
 3100811:	a3 c4 0e 10 03       	mov    ds:0x3100ec4,eax
 3100816:	eb 0a                	jmp    3100822 <kExit+0x4e>
/home/yogi/src/os/kshell/kshell.c:411
    }
    else
        exitCode = 0;
 3100818:	c7 05 c4 0e 10 03 00 	mov    DWORD PTR ds:0x3100ec4,0x0
 310081f:	00 00 00 
/home/yogi/src/os/kshell/kshell.c:412
    timeToExit=true;
 3100822:	c6 05 c0 0e 10 03 01 	mov    BYTE PTR ds:0x3100ec0,0x1
/home/yogi/src/os/kshell/kshell.c:413
}
 3100829:	90                   	nop
 310082a:	c9                   	leave  
 310082b:	c3                   	ret    

Disassembly of section .plt:

03100830 <.plt>:
 3100830:	ff 35 84 0e 10 03    	push   DWORD PTR ds:0x3100e84
 3100836:	ff 25 88 0e 10 03    	jmp    DWORD PTR ds:0x3100e88
 310083c:	00 00                	add    BYTE PTR [eax],al
 310083e:	00 00                	add    BYTE PTR [eax],al
 3100840:	ff 25 8c 0e 10 03    	jmp    DWORD PTR ds:0x3100e8c
 3100846:	68 00 00 00 00       	push   0x0
 310084b:	e9 e0 ff ff ff       	jmp    3100830 <kExit+0x5c>
 3100850:	ff 25 90 0e 10 03    	jmp    DWORD PTR ds:0x3100e90
 3100856:	68 08 00 00 00       	push   0x8
 310085b:	e9 d0 ff ff ff       	jmp    3100830 <kExit+0x5c>
 3100860:	ff 25 94 0e 10 03    	jmp    DWORD PTR ds:0x3100e94
 3100866:	68 10 00 00 00       	push   0x10
 310086b:	e9 c0 ff ff ff       	jmp    3100830 <kExit+0x5c>
 3100870:	ff 25 98 0e 10 03    	jmp    DWORD PTR ds:0x3100e98
 3100876:	68 18 00 00 00       	push   0x18
 310087b:	e9 b0 ff ff ff       	jmp    3100830 <kExit+0x5c>
 3100880:	ff 25 9c 0e 10 03    	jmp    DWORD PTR ds:0x3100e9c
 3100886:	68 20 00 00 00       	push   0x20
 310088b:	e9 a0 ff ff ff       	jmp    3100830 <kExit+0x5c>
 3100890:	ff 25 a0 0e 10 03    	jmp    DWORD PTR ds:0x3100ea0
 3100896:	68 28 00 00 00       	push   0x28
 310089b:	e9 90 ff ff ff       	jmp    3100830 <kExit+0x5c>
 31008a0:	ff 25 a4 0e 10 03    	jmp    DWORD PTR ds:0x3100ea4
 31008a6:	68 30 00 00 00       	push   0x30
 31008ab:	e9 80 ff ff ff       	jmp    3100830 <kExit+0x5c>
 31008b0:	ff 25 a8 0e 10 03    	jmp    DWORD PTR ds:0x3100ea8
 31008b6:	68 38 00 00 00       	push   0x38
 31008bb:	e9 70 ff ff ff       	jmp    3100830 <kExit+0x5c>
 31008c0:	ff 25 ac 0e 10 03    	jmp    DWORD PTR ds:0x3100eac
 31008c6:	68 40 00 00 00       	push   0x40
 31008cb:	e9 60 ff ff ff       	jmp    3100830 <kExit+0x5c>
 31008d0:	ff 25 b0 0e 10 03    	jmp    DWORD PTR ds:0x3100eb0
 31008d6:	68 48 00 00 00       	push   0x48
 31008db:	e9 50 ff ff ff       	jmp    3100830 <kExit+0x5c>
 31008e0:	ff 25 b4 0e 10 03    	jmp    DWORD PTR ds:0x3100eb4
 31008e6:	68 50 00 00 00       	push   0x50
 31008eb:	e9 40 ff ff ff       	jmp    3100830 <kExit+0x5c>
 31008f0:	ff 25 b8 0e 10 03    	jmp    DWORD PTR ds:0x3100eb8
 31008f6:	68 58 00 00 00       	push   0x58
 31008fb:	e9 30 ff ff ff       	jmp    3100830 <kExit+0x5c>

Disassembly of section .rodata:

03100900 <.rodata>:
 3100900:	68 65 6c 70 00       	push   0x706c65
 3100905:	47                   	inc    edi
 3100906:	65                   	gs
 3100907:	74 20                	je     3100929 <kExit+0x155>
 3100909:	68 65 6c 70 20       	push   0x20706c65
 310090e:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3100912:	73 20                	jae    3100934 <kExit+0x160>
 3100914:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 310091b:	74 69                	je     3100986 <kExit+0x1b2>
 310091d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310091e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310091f:	29 00                	sub    DWORD PTR [eax],eax
 3100921:	65                   	gs
 3100922:	78 65                	js     3100989 <kExit+0x1b5>
 3100924:	63 00                	arpl   WORD PTR [eax],ax
 3100926:	45                   	inc    ebp
 3100927:	78 65                	js     310098e <kExit+0x1ba>
 3100929:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 310092c:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3100930:	70 72                	jo     31009a4 <kExit+0x1d0>
 3100932:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100933:	67 72 61             	addr16 jb 3100997 <kExit+0x1c3>
 3100936:	6d                   	ins    DWORD PTR es:[edi],dx
 3100937:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
 310093a:	69 74 00 45 78 69 74 	imul   esi,DWORD PTR [eax+eax*1+0x45],0x20746978
 3100941:	20 
 3100942:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 3100946:	6c                   	ins    BYTE PTR es:[edi],dx
 3100947:	6c                   	ins    BYTE PTR es:[edi],dx
 3100948:	00 48 65             	add    BYTE PTR [eax+0x65],cl
 310094b:	6c                   	ins    BYTE PTR es:[edi],dx
 310094c:	70 3a                	jo     3100988 <kExit+0x1b4>
 310094e:	0a 00                	or     al,BYTE PTR [eax]
 3100950:	09 25 73 3a 20 25    	or     DWORD PTR ds:0x25203a73,esp
 3100956:	73 0a                	jae    3100962 <kExit+0x18e>
 3100958:	00 00                	add    BYTE PTR [eax],al
 310095a:	00 00                	add    BYTE PTR [eax],al
 310095c:	49                   	dec    ecx
 310095d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310095e:	76 61                	jbe    31009c1 <kExit+0x1ed>
 3100960:	6c                   	ins    BYTE PTR es:[edi],dx
 3100961:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 3100968:	61 
 3100969:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310096a:	64 20 27             	and    BYTE PTR fs:[edi],ah
 310096d:	25 73 27 20 79       	and    eax,0x79202773
 3100972:	61                   	popa   
 3100973:	20 64 75 6d          	and    BYTE PTR [ebp+esi*2+0x6d],ah
 3100977:	6d                   	ins    DWORD PTR es:[edi],dx
 3100978:	79 21                	jns    310099b <kExit+0x1c7>
 310097a:	0a 00                	or     al,BYTE PTR [eax]
 310097c:	45                   	inc    ebp
 310097d:	78 65                	js     31009e4 <kExit+0x210>
 310097f:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 3100982:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 3100989:	00 57 61             	add    BYTE PTR [edi+0x61],dl
 310098c:	69 74 69 6e 67 20 6f 	imul   esi,DWORD PTR [ecx+ebp*2+0x6e],0x6e6f2067
 3100993:	6e 
 3100994:	20 70 69             	and    BYTE PTR [eax+0x69],dh
 3100997:	64                   	fs
 3100998:	3d 30 78 25 30       	cmp    eax,0x30257830
 310099d:	38 58 0a             	cmp    BYTE PTR [eax+0xa],bl
 31009a0:	00 70 69             	add    BYTE PTR [eax+0x69],dh
 31009a3:	64                   	fs
 31009a4:	3d 30 78 25 30       	cmp    eax,0x30257830
 31009a9:	38 58 20             	cmp    BYTE PTR [eax+0x20],bl
 31009ac:	72 65                	jb     3100a13 <kExit+0x23f>
 31009ae:	74 75                	je     3100a25 <kExit+0x251>
 31009b0:	72 6e                	jb     3100a20 <kExit+0x24c>
 31009b2:	65 64 0a 00          	gs or  al,BYTE PTR fs:gs:[eax]
 31009b6:	6b 53 68 65          	imul   edx,DWORD PTR [ebx+0x68],0x65
 31009ba:	6c                   	ins    BYTE PTR es:[edi],dx
 31009bb:	6c                   	ins    BYTE PTR es:[edi],dx
 31009bc:	00 00                	add    BYTE PTR [eax],al
 31009be:	00 00                	add    BYTE PTR [eax],al
 31009c0:	0a 57 65             	or     dl,BYTE PTR [edi+0x65]
 31009c3:	6c                   	ins    BYTE PTR es:[edi],dx
 31009c4:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 31009c7:	65 20 74 6f 20       	and    BYTE PTR gs:[edi+ebp*2+0x20],dh
 31009cc:	6b 53 68 65          	imul   edx,DWORD PTR [ebx+0x68],0x65
 31009d0:	6c                   	ins    BYTE PTR es:[edi],dx
 31009d1:	6c                   	ins    BYTE PTR es:[edi],dx
 31009d2:	20 2e                	and    BYTE PTR [esi],ch
 31009d4:	2e 2e 20 68 61       	cs and BYTE PTR cs:[eax+0x61],ch
 31009d9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31009da:	67 20 61 20          	and    BYTE PTR [bx+di+0x20],ah
 31009de:	77 68                	ja     3100a48 <kExit+0x274>
 31009e0:	69 6c 65 21 0a 00 25 	imul   ebp,DWORD PTR [ebp+eiz*2+0x21],0x7325000a
 31009e7:	73 
 31009e8:	3e 20 00             	and    BYTE PTR ds:[eax],al

Disassembly of section .eh_frame:

031009ec <.eh_frame>:
 31009ec:	14 00                	adc    al,0x0
 31009ee:	00 00                	add    BYTE PTR [eax],al
 31009f0:	00 00                	add    BYTE PTR [eax],al
 31009f2:	00 00                	add    BYTE PTR [eax],al
 31009f4:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 31009f7:	00 01                	add    BYTE PTR [ecx],al
 31009f9:	7c 08                	jl     3100a03 <kExit+0x22f>
 31009fb:	01 1b                	add    DWORD PTR [ebx],ebx
 31009fd:	0c 04                	or     al,0x4
 31009ff:	04 88                	add    al,0x88
 3100a01:	01 00                	add    DWORD PTR [eax],eax
 3100a03:	00 20                	add    BYTE PTR [eax],ah
 3100a05:	00 00                	add    BYTE PTR [eax],al
 3100a07:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100a0a:	00 00                	add    BYTE PTR [eax],al
 3100a0c:	f4                   	hlt    
 3100a0d:	f5                   	cmc    
 3100a0e:	ff                   	(bad)  
 3100a0f:	ff 4a 01             	dec    DWORD PTR [edx+0x1]
 3100a12:	00 00                	add    BYTE PTR [eax],al
 3100a14:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100a17:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100a1d:	44                   	inc    esp
 3100a1e:	83 03 03             	add    DWORD PTR [ebx],0x3
 3100a21:	42                   	inc    edx
 3100a22:	01 c5                	add    ebp,eax
 3100a24:	c3                   	ret    
 3100a25:	0c 04                	or     al,0x4
 3100a27:	04 1c                	add    al,0x1c
 3100a29:	00 00                	add    BYTE PTR [eax],al
 3100a2b:	00 40 00             	add    BYTE PTR [eax+0x0],al
 3100a2e:	00 00                	add    BYTE PTR [eax],al
 3100a30:	1a f7                	sbb    dh,bh
 3100a32:	ff                   	(bad)  
 3100a33:	ff 69 00             	jmp    FWORD PTR [ecx+0x0]
 3100a36:	00 00                	add    BYTE PTR [eax],al
 3100a38:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100a3b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100a41:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3100a44:	0c 04                	or     al,0x4
 3100a46:	04 00                	add    al,0x0
 3100a48:	1c 00                	sbb    al,0x0
 3100a4a:	00 00                	add    BYTE PTR [eax],al
 3100a4c:	60                   	pusha  
 3100a4d:	00 00                	add    BYTE PTR [eax],al
 3100a4f:	00 63 f7             	add    BYTE PTR [ebx-0x9],ah
 3100a52:	ff                   	(bad)  
 3100a53:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 3100a59:	41                   	inc    ecx
 3100a5a:	0e                   	push   cs
 3100a5b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100a61:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 3100a67:	04 1c                	add    al,0x1c
 3100a69:	00 00                	add    BYTE PTR [eax],al
 3100a6b:	00 80 00 00 00 d1    	add    BYTE PTR [eax-0x2f000000],al
 3100a71:	f9                   	stc    
 3100a72:	ff                   	(bad)  
 3100a73:	ff 58 00             	call   FWORD PTR [eax+0x0]
 3100a76:	00 00                	add    BYTE PTR [eax],al
 3100a78:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100a7b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100a81:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3100a85:	04 04                	add    al,0x4
 3100a87:	00 20                	add    BYTE PTR [eax],ah
 3100a89:	00 00                	add    BYTE PTR [eax],al
 3100a8b:	00 a0 00 00 00 09    	add    BYTE PTR [eax+0x9000000],ah
 3100a91:	fa                   	cli    
 3100a92:	ff                   	(bad)  
 3100a93:	ff ab 00 00 00 00    	jmp    FWORD PTR [ebx+0x0]
 3100a99:	41                   	inc    ecx
 3100a9a:	0e                   	push   cs
 3100a9b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100aa1:	44                   	inc    esp
 3100aa2:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100aa5:	a3 c5 c3 0c 04       	mov    ds:0x40cc3c5,eax
 3100aaa:	04 00                	add    al,0x0
 3100aac:	20 00                	and    BYTE PTR [eax],al
 3100aae:	00 00                	add    BYTE PTR [eax],al
 3100ab0:	c4 00                	les    eax,FWORD PTR [eax]
 3100ab2:	00 00                	add    BYTE PTR [eax],al
 3100ab4:	90                   	nop
 3100ab5:	fa                   	cli    
 3100ab6:	ff                   	(bad)  
 3100ab7:	ff 9d 00 00 00 00    	call   FWORD PTR [ebp+0x0]
 3100abd:	41                   	inc    ecx
 3100abe:	0e                   	push   cs
 3100abf:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100ac5:	47                   	inc    edi
 3100ac6:	83 03 02             	add    DWORD PTR [ebx],0x2
 3100ac9:	92                   	xchg   edx,eax
 3100aca:	c5 c3 0c             	(bad)  
 3100acd:	04 04                	add    al,0x4
 3100acf:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100ad2:	00 00                	add    BYTE PTR [eax],al
 3100ad4:	e8 00 00 00 09       	call   c100ad9 <sKShellProgramName+0x8fff9d9>
 3100ad9:	fb                   	sti    
 3100ada:	ff                   	(bad)  
 3100adb:	ff f3                	push   ebx
 3100add:	01 00                	add    DWORD PTR [eax],eax
 3100adf:	00 00                	add    BYTE PTR [eax],al
 3100ae1:	41                   	inc    ecx
 3100ae2:	0e                   	push   cs
 3100ae3:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100ae9:	03 ef                	add    ebp,edi
 3100aeb:	01 c5                	add    ebp,eax
 3100aed:	0c 04                	or     al,0x4
 3100aef:	04 1c                	add    al,0x1c
 3100af1:	00 00                	add    BYTE PTR [eax],al
 3100af3:	00 08                	add    BYTE PTR [eax],cl
 3100af5:	01 00                	add    DWORD PTR [eax],eax
 3100af7:	00 dc                	add    ah,bl
 3100af9:	fc                   	cld    
 3100afa:	ff                   	(bad)  
 3100afb:	ff 58 00             	call   FWORD PTR [eax+0x0]
 3100afe:	00 00                	add    BYTE PTR [eax],al
 3100b00:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100b03:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100b09:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 3100b0d:	04 04                	add    al,0x4
	...

Disassembly of section .interp:

03100b10 <.interp>:
 3100b10:	2f                   	das    
 3100b11:	6c                   	ins    BYTE PTR es:[edi],dx
 3100b12:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3100b19:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3100b20:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03100b24 <.dynsym>:
	...
 3100b34:	09 00                	or     DWORD PTR [eax],eax
	...
 3100b3e:	00 00                	add    BYTE PTR [eax],al
 3100b40:	12 00                	adc    al,BYTE PTR [eax]
 3100b42:	00 00                	add    BYTE PTR [eax],al
 3100b44:	10 00                	adc    BYTE PTR [eax],al
	...
 3100b4e:	00 00                	add    BYTE PTR [eax],al
 3100b50:	12 00                	adc    al,BYTE PTR [eax]
 3100b52:	00 00                	add    BYTE PTR [eax],al
 3100b54:	18 00                	sbb    BYTE PTR [eax],al
	...
 3100b5e:	00 00                	add    BYTE PTR [eax],al
 3100b60:	12 00                	adc    al,BYTE PTR [eax]
 3100b62:	00 00                	add    BYTE PTR [eax],al
 3100b64:	1e                   	push   ds
	...
 3100b6d:	00 00                	add    BYTE PTR [eax],al
 3100b6f:	00 12                	add    BYTE PTR [edx],dl
 3100b71:	00 00                	add    BYTE PTR [eax],al
 3100b73:	00 23                	add    BYTE PTR [ebx],ah
	...
 3100b7d:	00 00                	add    BYTE PTR [eax],al
 3100b7f:	00 12                	add    BYTE PTR [edx],dl
 3100b81:	00 00                	add    BYTE PTR [eax],al
 3100b83:	00 28                	add    BYTE PTR [eax],ch
	...
 3100b8d:	00 00                	add    BYTE PTR [eax],al
 3100b8f:	00 12                	add    BYTE PTR [edx],dl
 3100b91:	00 00                	add    BYTE PTR [eax],al
 3100b93:	00 2f                	add    BYTE PTR [edi],ch
	...
 3100b9d:	00 00                	add    BYTE PTR [eax],al
 3100b9f:	00 12                	add    BYTE PTR [edx],dl
 3100ba1:	00 00                	add    BYTE PTR [eax],al
 3100ba3:	00 37                	add    BYTE PTR [edi],dh
	...
 3100bad:	00 00                	add    BYTE PTR [eax],al
 3100baf:	00 12                	add    BYTE PTR [edx],dl
 3100bb1:	00 00                	add    BYTE PTR [eax],al
 3100bb3:	00 3f                	add    BYTE PTR [edi],bh
	...
 3100bbd:	00 00                	add    BYTE PTR [eax],al
 3100bbf:	00 12                	add    BYTE PTR [edx],dl
 3100bc1:	00 00                	add    BYTE PTR [eax],al
 3100bc3:	00 46 00             	add    BYTE PTR [esi+0x0],al
	...
 3100bce:	00 00                	add    BYTE PTR [eax],al
 3100bd0:	12 00                	adc    al,BYTE PTR [eax]
 3100bd2:	00 00                	add    BYTE PTR [eax],al
 3100bd4:	4b                   	dec    ebx
	...
 3100bdd:	00 00                	add    BYTE PTR [eax],al
 3100bdf:	00 12                	add    BYTE PTR [edx],dl
 3100be1:	00 00                	add    BYTE PTR [eax],al
 3100be3:	00 52 00             	add    BYTE PTR [edx+0x0],dl
	...
 3100bee:	00 00                	add    BYTE PTR [eax],al
 3100bf0:	12 00                	adc    al,BYTE PTR [eax]
	...

Disassembly of section .dynstr:

03100bf4 <.dynstr>:
 3100bf4:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3100bf8:	63 2e                	arpl   WORD PTR [esi],bp
 3100bfa:	73 6f                	jae    3100c6b <kExit+0x497>
 3100bfc:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3100bff:	72 63                	jb     3100c64 <kExit+0x490>
 3100c01:	70 79                	jo     3100c7c <kExit+0x4a8>
 3100c03:	00 77 61             	add    BYTE PTR [edi+0x61],dh
 3100c06:	69 74 70 69 64 00 70 	imul   esi,DWORD PTR [eax+esi*2+0x69],0x72700064
 3100c0d:	72 
 3100c0e:	69 6e 74 00 67 65 74 	imul   ebp,DWORD PTR [esi+0x74],0x74656700
 3100c15:	73 00                	jae    3100c17 <kExit+0x443>
 3100c17:	70 75                	jo     3100c8e <kExit+0x4ba>
 3100c19:	74 73                	je     3100c8e <kExit+0x4ba>
 3100c1b:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 3100c1e:	6c                   	ins    BYTE PTR es:[edi],dx
 3100c1f:	6c                   	ins    BYTE PTR es:[edi],dx
 3100c20:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100c21:	63 00                	arpl   WORD PTR [eax],ax
 3100c23:	73 74                	jae    3100c99 <kExit+0x4c5>
 3100c25:	72 74                	jb     3100c9b <kExit+0x4c7>
 3100c27:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100c28:	75 6c                	jne    3100c96 <kExit+0x4c2>
 3100c2a:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3100c2d:	72 6e                	jb     3100c9d <kExit+0x4c9>
 3100c2f:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 3100c32:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 3100c35:	6d                   	ins    DWORD PTR es:[edi],dx
 3100c36:	73 65                	jae    3100c9d <kExit+0x4c9>
 3100c38:	74 00                	je     3100c3a <kExit+0x466>
 3100c3a:	70 75                	jo     3100cb1 <kExit+0x4dd>
 3100c3c:	74 63                	je     3100ca1 <kExit+0x4cd>
 3100c3e:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3100c41:	72 6c                	jb     3100caf <kExit+0x4db>
 3100c43:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3100c45:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 3100c48:	65 65 00 2f          	gs add BYTE PTR gs:[edi],ch
 3100c4c:	68 6f 6d 65 2f       	push   0x2f656d6f
 3100c51:	79 6f                	jns    3100cc2 <kExit+0x4ee>
 3100c53:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 3100c5a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100c5b:	73 2f                	jae    3100c8c <kExit+0x4b8>
 3100c5d:	6c                   	ins    BYTE PTR es:[edi],dx
 3100c5e:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3100c65:	4f                   	dec    edi
 3100c66:	53                   	push   ebx
 3100c67:	2f                   	das    
 3100c68:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3100c6f:	62 
 3100c70:	75 67                	jne    3100cd9 <kExit+0x505>
 3100c72:	2f                   	das    
 3100c73:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 3100c76:	73 73                	jae    3100ceb <kExit+0x517>
 3100c78:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3100c7d:	78 00                	js     3100c7f <kExit+0x4ab>

Disassembly of section .hash:

03100c80 <.hash>:
 3100c80:	03 00                	add    eax,DWORD PTR [eax]
 3100c82:	00 00                	add    BYTE PTR [eax],al
 3100c84:	0d 00 00 00 0a       	or     eax,0xa000000
 3100c89:	00 00                	add    BYTE PTR [eax],al
 3100c8b:	00 0c 00             	add    BYTE PTR [eax+eax*1],cl
 3100c8e:	00 00                	add    BYTE PTR [eax],al
 3100c90:	08 00                	or     BYTE PTR [eax],al
	...
 3100c9a:	00 00                	add    BYTE PTR [eax],al
 3100c9c:	01 00                	add    DWORD PTR [eax],eax
 3100c9e:	00 00                	add    BYTE PTR [eax],al
 3100ca0:	02 00                	add    al,BYTE PTR [eax]
	...
 3100caa:	00 00                	add    BYTE PTR [eax],al
 3100cac:	03 00                	add    eax,DWORD PTR [eax]
 3100cae:	00 00                	add    BYTE PTR [eax],al
 3100cb0:	06                   	push   es
 3100cb1:	00 00                	add    BYTE PTR [eax],al
 3100cb3:	00 07                	add    BYTE PTR [edi],al
 3100cb5:	00 00                	add    BYTE PTR [eax],al
 3100cb7:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3100cba:	00 00                	add    BYTE PTR [eax],al
 3100cbc:	09 00                	or     DWORD PTR [eax],eax
 3100cbe:	00 00                	add    BYTE PTR [eax],al
 3100cc0:	05 00 00 00 0b       	add    eax,0xb000000
 3100cc5:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame:

03100cc8 <.eh_frame>:
 3100cc8:	14 00                	adc    al,0x0
 3100cca:	00 00                	add    BYTE PTR [eax],al
 3100ccc:	00 00                	add    BYTE PTR [eax],al
 3100cce:	00 00                	add    BYTE PTR [eax],al
 3100cd0:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3100cd3:	00 01                	add    BYTE PTR [ecx],al
 3100cd5:	7c 08                	jl     3100cdf <kExit+0x50b>
 3100cd7:	01 1b                	add    DWORD PTR [ebx],ebx
 3100cd9:	0c 04                	or     al,0x4
 3100cdb:	04 88                	add    al,0x88
 3100cdd:	01 00                	add    DWORD PTR [eax],eax
 3100cdf:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3100ce2:	00 00                	add    BYTE PTR [eax],al
 3100ce4:	1c 00                	sbb    al,0x0
 3100ce6:	00 00                	add    BYTE PTR [eax],al
 3100ce8:	48                   	dec    eax
 3100ce9:	fb                   	sti    
 3100cea:	ff                   	(bad)  
 3100ceb:	ff d0                	call   eax
 3100ced:	00 00                	add    BYTE PTR [eax],al
 3100cef:	00 00                	add    BYTE PTR [eax],al
 3100cf1:	0e                   	push   cs
 3100cf2:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3100cf5:	0c 4a                	or     al,0x4a
 3100cf7:	0f 0b                	ud2    
 3100cf9:	74 04                	je     3100cff <kExit+0x52b>
 3100cfb:	78 00                	js     3100cfd <kExit+0x529>
 3100cfd:	3f                   	aas    
 3100cfe:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3100d00:	2a 32                	sub    dh,BYTE PTR [edx]
 3100d02:	24 22                	and    al,0x22
 3100d04:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03100d08 <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3100d08:	01 1b                	add    DWORD PTR [ebx],ebx
 3100d0a:	03 3b                	add    edi,DWORD PTR [ebx]
 3100d0c:	e0 fc                	loopne 3100d0a <__GNU_EH_FRAME_HDR+0x2>
 3100d0e:	ff                   	(bad)  
 3100d0f:	ff 08                	dec    DWORD PTR [eax]
 3100d11:	00 00                	add    BYTE PTR [eax],al
 3100d13:	00 f8                	add    al,bh
 3100d15:	f2 ff                	repnz (bad) 
 3100d17:	ff                   	(bad)  
 3100d18:	fc                   	cld    
 3100d19:	fc                   	cld    
 3100d1a:	ff                   	(bad)  
 3100d1b:	ff 42 f4             	inc    DWORD PTR [edx-0xc]
 3100d1e:	ff                   	(bad)  
 3100d1f:	ff 20                	jmp    DWORD PTR [eax]
 3100d21:	fd                   	std    
 3100d22:	ff                   	(bad)  
 3100d23:	ff ab f4 ff ff 40    	jmp    FWORD PTR [ebx+0x40fffff4]
 3100d29:	fd                   	std    
 3100d2a:	ff                   	(bad)  
 3100d2b:	ff                   	(bad)  
 3100d2c:	39 f7                	cmp    edi,esi
 3100d2e:	ff                   	(bad)  
 3100d2f:	ff 60 fd             	jmp    DWORD PTR [eax-0x3]
 3100d32:	ff                   	(bad)  
 3100d33:	ff 91 f7 ff ff 80    	call   DWORD PTR [ecx-0x7f000009]
 3100d39:	fd                   	std    
 3100d3a:	ff                   	(bad)  
 3100d3b:	ff                   	(bad)  
 3100d3c:	3c f8                	cmp    al,0xf8
 3100d3e:	ff                   	(bad)  
 3100d3f:	ff a4 fd ff ff d9 f8 	jmp    DWORD PTR [ebp+edi*8-0x7260001]
 3100d46:	ff                   	(bad)  
 3100d47:	ff c8                	dec    eax
 3100d49:	fd                   	std    
 3100d4a:	ff                   	(bad)  
 3100d4b:	ff cc                	dec    esp
 3100d4d:	fa                   	cli    
 3100d4e:	ff                   	(bad)  
 3100d4f:	ff e8                	jmp    <internal disassembler error>
 3100d51:	fd                   	std    
 3100d52:	ff                   	(bad)  
 3100d53:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03100d54 <.rel.dyn>:
 3100d54:	8c 0e                	mov    WORD PTR [esi],cs
 3100d56:	10 03                	adc    BYTE PTR [ebx],al
 3100d58:	07                   	pop    es
 3100d59:	01 00                	add    DWORD PTR [eax],eax
 3100d5b:	00 90 0e 10 03 07    	add    BYTE PTR [eax+0x703100e],dl
 3100d61:	02 00                	add    al,BYTE PTR [eax]
 3100d63:	00 94 0e 10 03 07 03 	add    BYTE PTR [esi+ecx*1+0x3070310],dl
 3100d6a:	00 00                	add    BYTE PTR [eax],al
 3100d6c:	98                   	cwde   
 3100d6d:	0e                   	push   cs
 3100d6e:	10 03                	adc    BYTE PTR [ebx],al
 3100d70:	07                   	pop    es
 3100d71:	04 00                	add    al,0x0
 3100d73:	00 9c 0e 10 03 07 05 	add    BYTE PTR [esi+ecx*1+0x5070310],bl
 3100d7a:	00 00                	add    BYTE PTR [eax],al
 3100d7c:	a0 0e 10 03 07       	mov    al,ds:0x703100e
 3100d81:	06                   	push   es
 3100d82:	00 00                	add    BYTE PTR [eax],al
 3100d84:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 3100d85:	0e                   	push   cs
 3100d86:	10 03                	adc    BYTE PTR [ebx],al
 3100d88:	07                   	pop    es
 3100d89:	07                   	pop    es
 3100d8a:	00 00                	add    BYTE PTR [eax],al
 3100d8c:	a8 0e                	test   al,0xe
 3100d8e:	10 03                	adc    BYTE PTR [ebx],al
 3100d90:	07                   	pop    es
 3100d91:	08 00                	or     BYTE PTR [eax],al
 3100d93:	00 ac 0e 10 03 07 09 	add    BYTE PTR [esi+ecx*1+0x9070310],ch
 3100d9a:	00 00                	add    BYTE PTR [eax],al
 3100d9c:	b0 0e                	mov    al,0xe
 3100d9e:	10 03                	adc    BYTE PTR [ebx],al
 3100da0:	07                   	pop    es
 3100da1:	0a 00                	or     al,BYTE PTR [eax]
 3100da3:	00 b4 0e 10 03 07 0b 	add    BYTE PTR [esi+ecx*1+0xb070310],dh
 3100daa:	00 00                	add    BYTE PTR [eax],al
 3100dac:	b8 0e 10 03 07       	mov    eax,0x703100e
 3100db1:	0c 00                	or     al,0x0
	...

Disassembly of section .data:

03100dc0 <cmds>:
 3100dc0:	00 09                	add    BYTE PTR [ecx],cl
 3100dc2:	10 03                	adc    BYTE PTR [ebx],al
 3100dc4:	05 09 10 03 41       	add    eax,0x41031009
 3100dc9:	04 10                	add    al,0x10
 3100dcb:	03 00                	add    eax,DWORD PTR [eax]
 3100dcd:	00 00                	add    BYTE PTR [eax],al
 3100dcf:	00 21                	add    BYTE PTR [ecx],ah
 3100dd1:	09 10                	or     DWORD PTR [eax],edx
 3100dd3:	03 26                	add    esp,DWORD PTR [esi]
 3100dd5:	09 10                	or     DWORD PTR [eax],edx
 3100dd7:	03 44 05 10          	add    eax,DWORD PTR [ebp+eax*1+0x10]
 3100ddb:	03 01                	add    eax,DWORD PTR [ecx]
 3100ddd:	00 00                	add    BYTE PTR [eax],al
 3100ddf:	00 38                	add    BYTE PTR [eax],bh
 3100de1:	09 10                	or     DWORD PTR [eax],edx
 3100de3:	03 3d 09 10 03 d4    	add    edi,DWORD PTR ds:0xd4031009
 3100de9:	07                   	pop    es
 3100dea:	10 03                	adc    BYTE PTR [ebx],al
 3100dec:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .dynamic:

03100df0 <_DYNAMIC>:
 3100df0:	01 00                	add    DWORD PTR [eax],eax
 3100df2:	00 00                	add    BYTE PTR [eax],al
 3100df4:	01 00                	add    DWORD PTR [eax],eax
 3100df6:	00 00                	add    BYTE PTR [eax],al
 3100df8:	0f 00 00             	sldt   WORD PTR [eax]
 3100dfb:	00 57 00             	add    BYTE PTR [edi+0x0],dl
 3100dfe:	00 00                	add    BYTE PTR [eax],al
 3100e00:	04 00                	add    al,0x0
 3100e02:	00 00                	add    BYTE PTR [eax],al
 3100e04:	80 0c 10 03          	or     BYTE PTR [eax+edx*1],0x3
 3100e08:	05 00 00 00 f4       	add    eax,0xf4000000
 3100e0d:	0b 10                	or     edx,DWORD PTR [eax]
 3100e0f:	03 06                	add    eax,DWORD PTR [esi]
 3100e11:	00 00                	add    BYTE PTR [eax],al
 3100e13:	00 24 0b             	add    BYTE PTR [ebx+ecx*1],ah
 3100e16:	10 03                	adc    BYTE PTR [ebx],al
 3100e18:	0a 00                	or     al,BYTE PTR [eax]
 3100e1a:	00 00                	add    BYTE PTR [eax],al
 3100e1c:	8b 00                	mov    eax,DWORD PTR [eax]
 3100e1e:	00 00                	add    BYTE PTR [eax],al
 3100e20:	0b 00                	or     eax,DWORD PTR [eax]
 3100e22:	00 00                	add    BYTE PTR [eax],al
 3100e24:	10 00                	adc    BYTE PTR [eax],al
 3100e26:	00 00                	add    BYTE PTR [eax],al
 3100e28:	15 00 00 00 00       	adc    eax,0x0
 3100e2d:	00 00                	add    BYTE PTR [eax],al
 3100e2f:	00 03                	add    BYTE PTR [ebx],al
 3100e31:	00 00                	add    BYTE PTR [eax],al
 3100e33:	00 80 0e 10 03 02    	add    BYTE PTR [eax+0x203100e],al
 3100e39:	00 00                	add    BYTE PTR [eax],al
 3100e3b:	00 60 00             	add    BYTE PTR [eax+0x0],ah
 3100e3e:	00 00                	add    BYTE PTR [eax],al
 3100e40:	14 00                	adc    al,0x0
 3100e42:	00 00                	add    BYTE PTR [eax],al
 3100e44:	11 00                	adc    DWORD PTR [eax],eax
 3100e46:	00 00                	add    BYTE PTR [eax],al
 3100e48:	17                   	pop    ss
 3100e49:	00 00                	add    BYTE PTR [eax],al
 3100e4b:	00 54 0d 10          	add    BYTE PTR [ebp+ecx*1+0x10],dl
 3100e4f:	03 00                	add    eax,DWORD PTR [eax]
	...

Disassembly of section .got.plt:

03100e80 <_GLOBAL_OFFSET_TABLE_>:
 3100e80:	f0 0d 10 03 00 00    	lock or eax,0x310
 3100e86:	00 00                	add    BYTE PTR [eax],al
 3100e88:	00 00                	add    BYTE PTR [eax],al
 3100e8a:	00 00                	add    BYTE PTR [eax],al
 3100e8c:	46                   	inc    esi
 3100e8d:	08 10                	or     BYTE PTR [eax],dl
 3100e8f:	03 56 08             	add    edx,DWORD PTR [esi+0x8]
 3100e92:	10 03                	adc    BYTE PTR [ebx],al
 3100e94:	66                   	data16
 3100e95:	08 10                	or     BYTE PTR [eax],dl
 3100e97:	03 76 08             	add    esi,DWORD PTR [esi+0x8]
 3100e9a:	10 03                	adc    BYTE PTR [ebx],al
 3100e9c:	86 08                	xchg   BYTE PTR [eax],cl
 3100e9e:	10 03                	adc    BYTE PTR [ebx],al
 3100ea0:	96                   	xchg   esi,eax
 3100ea1:	08 10                	or     BYTE PTR [eax],dl
 3100ea3:	03 a6 08 10 03 b6    	add    esp,DWORD PTR [esi-0x49fceff8]
 3100ea9:	08 10                	or     BYTE PTR [eax],dl
 3100eab:	03 c6                	add    eax,esi
 3100ead:	08 10                	or     BYTE PTR [eax],dl
 3100eaf:	03 d6                	add    edx,esi
 3100eb1:	08 10                	or     BYTE PTR [eax],dl
 3100eb3:	03 e6                	add    esp,esi
 3100eb5:	08 10                	or     BYTE PTR [eax],dl
 3100eb7:	03 f6                	add    esi,esi
 3100eb9:	08 10                	or     BYTE PTR [eax],dl
 3100ebb:	03                   	.byte 0x3

Disassembly of section .bss:

03100ec0 <timeToExit>:
 3100ec0:	00 00                	add    BYTE PTR [eax],al
	...

03100ec4 <exitCode>:
	...

03100ee0 <sExecutingProgram>:
	...

031010e0 <command_function_p>:
 31010e0:	00 00                	add    BYTE PTR [eax],al
	...

031010e4 <cpuid_extended_feature_bits>:
 31010e4:	00 00                	add    BYTE PTR [eax],al
	...

031010e8 <heapEnd>:
 31010e8:	00 00                	add    BYTE PTR [eax],al
	...

031010ec <heapBase>:
 31010ec:	00 00                	add    BYTE PTR [eax],al
	...

031010f0 <heapCurr>:
 31010f0:	00 00                	add    BYTE PTR [eax],al
	...

031010f4 <command_function>:
 31010f4:	00 00                	add    BYTE PTR [eax],al
	...

031010f8 <cpuid_procinfo>:
	...

03101100 <sKShellProgramName>:
 3101100:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	97                   	xchg   edi,eax
   1:	06                   	push   es
   2:	00 00                	add    BYTE PTR [eax],al
   4:	04 00                	add    al,0x0
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	83 00 00             	add    DWORD PTR [eax],0x0
   f:	00 0c 1a             	add    BYTE PTR [edx+ebx*1],cl
  12:	02 00                	add    al,BYTE PTR [eax]
  14:	00 d8                	add    al,bl
  16:	01 00                	add    DWORD PTR [eax],eax
  18:	00 00                	add    BYTE PTR [eax],al
  1a:	00 10                	add    BYTE PTR [eax],dl
  1c:	03 2c 08             	add    ebp,DWORD PTR [eax+ecx*1]
  1f:	00 00                	add    BYTE PTR [eax],al
  21:	00 00                	add    BYTE PTR [eax],al
  23:	00 00                	add    BYTE PTR [eax],al
  25:	02 01                	add    al,BYTE PTR [ecx]
  27:	06                   	push   es
  28:	61                   	popa   
  29:	02 00                	add    al,BYTE PTR [eax]
  2b:	00 02                	add    BYTE PTR [edx],al
  2d:	01 06                	add    DWORD PTR [esi],eax
  2f:	5a                   	pop    edx
  30:	02 00                	add    al,BYTE PTR [eax]
  32:	00 02                	add    BYTE PTR [edx],al
  34:	02 05 73 02 00 00    	add    al,BYTE PTR ds:0x273
  3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  41:	02 08                	add    cl,BYTE PTR [eax]
  43:	05 58 00 00 00       	add    eax,0x58
  48:	04 11                	add    al,0x11
  4a:	03 00                	add    eax,DWORD PTR [eax]
  4c:	00 02                	add    BYTE PTR [edx],al
  4e:	2e                   	cs
  4f:	53                   	push   ebx
  50:	00 00                	add    BYTE PTR [eax],al
  52:	00 02                	add    BYTE PTR [edx],al
  54:	01 08                	add    DWORD PTR [eax],ecx
  56:	58                   	pop    eax
  57:	02 00                	add    al,BYTE PTR [eax]
  59:	00 02                	add    BYTE PTR [edx],al
  5b:	02 07                	add    al,BYTE PTR [edi]
  5d:	6b 01 00             	imul   eax,DWORD PTR [ecx],0x0
  60:	00 04 92             	add    BYTE PTR [edx+edx*4],al
  63:	02 00                	add    al,BYTE PTR [eax]
  65:	00 02                	add    BYTE PTR [edx],al
  67:	34 6c                	xor    al,0x6c
  69:	00 00                	add    BYTE PTR [eax],al
  6b:	00 02                	add    BYTE PTR [edx],al
  6d:	04 07                	add    al,0x7
  6f:	39 00                	cmp    DWORD PTR [eax],eax
  71:	00 00                	add    BYTE PTR [eax],al
  73:	02 08                	add    cl,BYTE PTR [eax]
  75:	07                   	pop    es
  76:	2f                   	das    
  77:	00 00                	add    BYTE PTR [eax],al
  79:	00 02                	add    BYTE PTR [edx],al
  7b:	04 05                	add    al,0x5
  7d:	5d                   	pop    ebp
  7e:	00 00                	add    BYTE PTR [eax],al
  80:	00 02                	add    BYTE PTR [edx],al
  82:	01 02                	add    DWORD PTR [edx],eax
  84:	3f                   	aas    
  85:	02 00                	add    al,BYTE PTR [eax]
  87:	00 02                	add    BYTE PTR [edx],al
  89:	04 07                	add    al,0x7
  8b:	34 00                	xor    al,0x0
  8d:	00 00                	add    BYTE PTR [eax],al
  8f:	05 05 03 58 10       	add    eax,0x10580305
  94:	01 00                	add    DWORD PTR [eax],eax
  96:	00 06                	add    BYTE PTR [esi],al
  98:	6e                   	outs   dx,BYTE PTR ds:[esi]
  99:	02 00                	add    al,BYTE PTR [eax]
  9b:	00 03                	add    BYTE PTR [ebx],al
  9d:	59                   	pop    ecx
  9e:	48                   	dec    eax
  9f:	00 00                	add    BYTE PTR [eax],al
  a1:	00 01                	add    BYTE PTR [ecx],al
  a3:	04 04                	add    al,0x4
  a5:	00 06                	add    BYTE PTR [esi],al
  a7:	ab                   	stos   DWORD PTR es:[edi],eax
  a8:	02 00                	add    al,BYTE PTR [eax]
  aa:	00 03                	add    BYTE PTR [ebx],al
  ac:	5a                   	pop    edx
  ad:	48                   	dec    eax
  ae:	00 00                	add    BYTE PTR [eax],al
  b0:	00 01                	add    BYTE PTR [ecx],al
  b2:	04 00                	add    al,0x0
  b4:	00 06                	add    BYTE PTR [esi],al
  b6:	70 00                	jo     b8 <parseParamsShell-0x30fff48>
  b8:	00 00                	add    BYTE PTR [eax],al
  ba:	03 5b 48             	add    ebx,DWORD PTR [ebx+0x48]
  bd:	00 00                	add    BYTE PTR [eax],al
  bf:	00 01                	add    BYTE PTR [ecx],al
  c1:	04 04                	add    al,0x4
  c3:	01 06                	add    DWORD PTR [esi],eax
  c5:	b8 01 00 00 03       	mov    eax,0x3000001
  ca:	5c                   	pop    esp
  cb:	48                   	dec    eax
  cc:	00 00                	add    BYTE PTR [eax],al
  ce:	00 01                	add    BYTE PTR [ecx],al
  d0:	02 02                	add    al,BYTE PTR [edx]
  d2:	01 06                	add    DWORD PTR [esi],eax
  d4:	e9 02 00 00 03       	jmp    30000db <parseParamsShell-0xfff25>
  d9:	5d                   	pop    ebp
  da:	48                   	dec    eax
  db:	00 00                	add    BYTE PTR [eax],al
  dd:	00 01                	add    BYTE PTR [ecx],al
  df:	02 00                	add    al,BYTE PTR [eax]
  e1:	01 06                	add    DWORD PTR [esi],eax
  e3:	aa                   	stos   BYTE PTR es:[edi],al
  e4:	02 00                	add    al,BYTE PTR [eax]
  e6:	00 03                	add    BYTE PTR [ebx],al
  e8:	5e                   	pop    esi
  e9:	48                   	dec    eax
  ea:	00 00                	add    BYTE PTR [eax],al
  ec:	00 01                	add    BYTE PTR [ecx],al
  ee:	04 04                	add    al,0x4
  f0:	02 06                	add    al,BYTE PTR [esi]
  f2:	6f                   	outs   dx,DWORD PTR ds:[esi]
  f3:	00 00                	add    BYTE PTR [eax],al
  f5:	00 03                	add    BYTE PTR [ebx],al
  f7:	5f                   	pop    edi
  f8:	48                   	dec    eax
  f9:	00 00                	add    BYTE PTR [eax],al
  fb:	00 01                	add    BYTE PTR [ecx],al
  fd:	08 00                	or     BYTE PTR [eax],al
  ff:	03 06                	add    eax,DWORD PTR [esi]
 101:	ee                   	out    dx,al
 102:	02 00                	add    al,BYTE PTR [eax]
 104:	00 03                	add    BYTE PTR [ebx],al
 106:	60                   	pusha  
 107:	48                   	dec    eax
 108:	00 00                	add    BYTE PTR [eax],al
 10a:	00 01                	add    BYTE PTR [ecx],al
 10c:	04 04                	add    al,0x4
 10e:	04 00                	add    al,0x0
 110:	07                   	pop    es
 111:	08 03                	or     BYTE PTR [ebx],al
 113:	56                   	push   esi
 114:	29 01                	sub    DWORD PTR [ecx],eax
 116:	00 00                	add    BYTE PTR [eax],al
 118:	08 8f 00 00 00 09    	or     BYTE PTR [edi+0x9000000],cl
 11e:	72 65                	jb     185 <parseParamsShell-0x30ffe7b>
 120:	67 00 03             	add    BYTE PTR [bp+di],al
 123:	62 61 00             	bound  esp,QWORD PTR [ecx+0x0]
 126:	00 00                	add    BYTE PTR [eax],al
 128:	00 05 04 03 db 5f    	add    BYTE PTR ds:0x5fdb0304,al
 12e:	01 00                	add    DWORD PTR [eax],eax
 130:	00 06                	add    BYTE PTR [esi],al
 132:	1d 00 00 00 03       	sbb    eax,0x3000000
 137:	dc 48 00             	fmul   QWORD PTR [eax+0x0]
 13a:	00 00                	add    BYTE PTR [eax],al
 13c:	01 01                	add    DWORD PTR [ecx],eax
 13e:	07                   	pop    es
 13f:	00 06                	add    BYTE PTR [esi],al
 141:	f1                   	icebp  
 142:	00 00                	add    BYTE PTR [eax],al
 144:	00 03                	add    BYTE PTR [ebx],al
 146:	dd 48 00             	fisttp QWORD PTR [eax+0x0]
 149:	00 00                	add    BYTE PTR [eax],al
 14b:	01 01                	add    DWORD PTR [ecx],eax
 14d:	06                   	push   es
 14e:	00 06                	add    BYTE PTR [esi],al
 150:	28 01                	sub    BYTE PTR [ecx],al
 152:	00 00                	add    BYTE PTR [eax],al
 154:	03 de                	add    ebx,esi
 156:	61                   	popa   
 157:	00 00                	add    BYTE PTR [eax],al
 159:	00 04 1e             	add    BYTE PTR [esi+ebx*1],al
 15c:	00 00                	add    BYTE PTR [eax],al
 15e:	00 07                	add    BYTE PTR [edi],al
 160:	04 03                	add    al,0x3
 162:	da 78 01             	fidivr DWORD PTR [eax+0x1]
 165:	00 00                	add    BYTE PTR [eax],al
 167:	08 29                	or     BYTE PTR [ecx],ch
 169:	01 00                	add    DWORD PTR [eax],eax
 16b:	00 09                	add    BYTE PTR [ecx],cl
 16d:	72 65                	jb     1d4 <parseParamsShell-0x30ffe2c>
 16f:	67 00 03             	add    BYTE PTR [bp+di],al
 172:	e0 61                	loopne 1d5 <parseParamsShell-0x30ffe2b>
 174:	00 00                	add    BYTE PTR [eax],al
 176:	00 00                	add    BYTE PTR [eax],al
 178:	0a 04 05 10 04 12 b3 	or     al,BYTE PTR [eax*1-0x4cedfbf0]
 17f:	01 00                	add    DWORD PTR [eax],eax
 181:	00 0b                	add    BYTE PTR [ebx],cl
 183:	61                   	popa   
 184:	01 00                	add    DWORD PTR [eax],eax
 186:	00 04 14             	add    BYTE PTR [esp+edx*1],al
 189:	b3 01                	mov    bl,0x1
 18b:	00 00                	add    BYTE PTR [eax],al
 18d:	00 0b                	add    BYTE PTR [ebx],cl
 18f:	00 00                	add    BYTE PTR [eax],al
 191:	00 00                	add    BYTE PTR [eax],al
 193:	04 15                	add    al,0x15
 195:	b3 01                	mov    bl,0x1
 197:	00 00                	add    BYTE PTR [eax],al
 199:	04 0b                	add    al,0xb
 19b:	14 00                	adc    al,0x0
 19d:	00 00                	add    BYTE PTR [eax],al
 19f:	04 16                	add    al,0x16
 1a1:	78 01                	js     1a4 <parseParamsShell-0x30ffe5c>
 1a3:	00 00                	add    BYTE PTR [eax],al
 1a5:	08 0b                	or     BYTE PTR [ebx],cl
 1a7:	a9 01 00 00 04       	test   eax,0x4000001
 1ac:	17                   	pop    ss
 1ad:	3a 00                	cmp    al,BYTE PTR [eax]
 1af:	00 00                	add    BYTE PTR [eax],al
 1b1:	0c 00                	or     al,0x0
 1b3:	0c 04                	or     al,0x4
 1b5:	25 00 00 00 04       	and    eax,0x4000000
 1ba:	18 01                	sbb    BYTE PTR [ecx],al
 1bc:	00 00                	add    BYTE PTR [eax],al
 1be:	04 18                	add    al,0x18
 1c0:	7a 01                	jp     1c3 <parseParamsShell-0x30ffe3d>
 1c2:	00 00                	add    BYTE PTR [eax],al
 1c4:	0d 19 03 00 00       	or     eax,0x319
 1c9:	01 16                	add    DWORD PTR [esi],edx
 1cb:	3a 00                	cmp    al,BYTE PTR [eax]
 1cd:	00 00                	add    BYTE PTR [eax],al
 1cf:	00 00                	add    BYTE PTR [eax],al
 1d1:	10 03                	adc    BYTE PTR [ebx],al
 1d3:	4a                   	dec    edx
 1d4:	01 00                	add    DWORD PTR [eax],eax
 1d6:	00 01                	add    BYTE PTR [ecx],al
 1d8:	9c                   	pushf  
 1d9:	54                   	push   esp
 1da:	02 00                	add    al,BYTE PTR [eax]
 1dc:	00 0e                	add    BYTE PTR [esi],cl
 1de:	49                   	dec    ecx
 1df:	01 00                	add    DWORD PTR [eax],eax
 1e1:	00 01                	add    BYTE PTR [ecx],al
 1e3:	16                   	push   ss
 1e4:	b3 01                	mov    bl,0x1
 1e6:	00 00                	add    BYTE PTR [eax],al
 1e8:	02 91 00 0e a3 02    	add    dl,BYTE PTR [ecx+0x2a30e00]
 1ee:	00 00                	add    BYTE PTR [eax],al
 1f0:	01 16                	add    DWORD PTR [esi],edx
 1f2:	6c                   	ins    BYTE PTR es:[edi],dx
 1f3:	02 00                	add    al,BYTE PTR [eax]
 1f5:	00 02                	add    BYTE PTR [edx],al
 1f7:	91                   	xchg   ecx,eax
 1f8:	04 0e                	add    al,0xe
 1fa:	66 01 00             	add    WORD PTR [eax],ax
 1fd:	00 01                	add    BYTE PTR [ecx],al
 1ff:	16                   	push   ss
 200:	3a 00                	cmp    al,BYTE PTR [eax]
 202:	00 00                	add    BYTE PTR [eax],al
 204:	02 91 08 0f 78 00    	add    dl,BYTE PTR [ecx+0x780f08]
 20a:	01 18                	add    DWORD PTR [eax],ebx
 20c:	3a 00                	cmp    al,BYTE PTR [eax]
 20e:	00 00                	add    BYTE PTR [eax],al
 210:	02 91 6c 0f 79 00    	add    dl,BYTE PTR [ecx+0x790f6c]
 216:	01 18                	add    DWORD PTR [eax],ebx
 218:	3a 00                	cmp    al,BYTE PTR [eax]
 21a:	00 00                	add    BYTE PTR [eax],al
 21c:	02 91 68 10 e0 00    	add    dl,BYTE PTR [ecx+0xe01068]
 222:	00 00                	add    BYTE PTR [eax],al
 224:	01 19                	add    DWORD PTR [ecx],ebx
 226:	3a 00                	cmp    al,BYTE PTR [eax]
 228:	00 00                	add    BYTE PTR [eax],al
 22a:	02 91 64 10 77 00    	add    dl,BYTE PTR [ecx+0x771064]
 230:	00 00                	add    BYTE PTR [eax],al
 232:	01 19                	add    DWORD PTR [ecx],ebx
 234:	3a 00                	cmp    al,BYTE PTR [eax]
 236:	00 00                	add    BYTE PTR [eax],al
 238:	02 91 60 11 37 00    	add    dl,BYTE PTR [ecx+0x371160]
 23e:	10 03                	adc    BYTE PTR [ebx],al
 240:	ec                   	in     al,dx
 241:	00 00                	add    BYTE PTR [eax],al
 243:	00 0f                	add    BYTE PTR [edi],cl
 245:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 248:	00 01                	add    BYTE PTR [ecx],al
 24a:	1d 6c 00 00 00       	sbb    eax,0x6c
 24f:	02 91 5c 00 00 12    	add    dl,BYTE PTR [ecx+0x1200005c]
 255:	25 00 00 00 65       	and    eax,0x65000000
 25a:	02 00                	add    al,BYTE PTR [eax]
 25c:	00 13                	add    BYTE PTR [ebx],dl
 25e:	65 02 00             	add    al,BYTE PTR gs:[eax]
 261:	00 ff                	add    bh,bh
 263:	01 00                	add    DWORD PTR [eax],eax
 265:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
 268:	b4 01                	mov    ah,0x1
 26a:	00 00                	add    BYTE PTR [eax],al
 26c:	0c 04                	or     al,0x4
 26e:	54                   	push   esp
 26f:	02 00                	add    al,BYTE PTR [eax]
 271:	00 0d f1 01 00 00    	add    BYTE PTR ds:0x1f1,cl
 277:	01 3b                	add    DWORD PTR [ebx],edi
 279:	3a 00                	cmp    al,BYTE PTR [eax]
 27b:	00 00                	add    BYTE PTR [eax],al
 27d:	4a                   	dec    edx
 27e:	01 10                	add    DWORD PTR [eax],edx
 280:	03 69 00             	add    ebp,DWORD PTR [ecx+0x0]
 283:	00 00                	add    BYTE PTR [eax],al
 285:	01 9c b4 02 00 00 0e 	add    DWORD PTR [esp+esi*4+0xe000002],ebx
 28c:	51                   	push   ecx
 28d:	01 00                	add    DWORD PTR [eax],eax
 28f:	00 01                	add    BYTE PTR [ecx],al
 291:	3b b3 01 00 00 02    	cmp    esi,DWORD PTR [ebx+0x2000001]
 297:	91                   	xchg   ecx,eax
 298:	00 0f                	add    BYTE PTR [edi],cl
 29a:	69 00 01 3d 6c 00    	imul   eax,DWORD PTR [eax],0x6c3d01
 2a0:	00 00                	add    BYTE PTR [eax],al
 2a2:	02 91 6c 0f 72 65    	add    dl,BYTE PTR [ecx+0x65720f6c]
 2a8:	74 00                	je     2aa <parseParamsShell-0x30ffd56>
 2aa:	01 3e                	add    DWORD PTR [esi],edi
 2ac:	3a 00                	cmp    al,BYTE PTR [eax]
 2ae:	00 00                	add    BYTE PTR [eax],al
 2b0:	02 91 68 00 0d 36    	add    dl,BYTE PTR [ecx+0x360d0068]
 2b6:	01 00                	add    DWORD PTR [eax],eax
 2b8:	00 01                	add    BYTE PTR [ecx],al
 2ba:	51                   	push   ecx
 2bb:	72 03                	jb     2c0 <parseParamsShell-0x30ffd40>
 2bd:	00 00                	add    BYTE PTR [eax],al
 2bf:	b3 01                	mov    bl,0x1
 2c1:	10 03                	adc    BYTE PTR [ebx],al
 2c3:	8e 02                	mov    es,WORD PTR [edx]
 2c5:	00 00                	add    BYTE PTR [eax],al
 2c7:	01 9c 72 03 00 00 0e 	add    DWORD PTR [edx+esi*2+0xe000003],ebx
 2ce:	83 02 00             	add    DWORD PTR [edx],0x0
 2d1:	00 01                	add    BYTE PTR [ecx],al
 2d3:	51                   	push   ecx
 2d4:	78 03                	js     2d9 <parseParamsShell-0x30ffd27>
 2d6:	00 00                	add    BYTE PTR [eax],al
 2d8:	02 91 00 0f 61 72    	add    dl,BYTE PTR [ecx+0x72610f00]
 2de:	67 00 01             	add    BYTE PTR [bx+di],al
 2e1:	53                   	push   ebx
 2e2:	b3 01                	mov    bl,0x1
 2e4:	00 00                	add    BYTE PTR [eax],al
 2e6:	02 91 6c 10 66 02    	add    dl,BYTE PTR [ecx+0x266106c]
 2ec:	00 00                	add    BYTE PTR [eax],al
 2ee:	01 54 b3 01          	add    DWORD PTR [ebx+esi*4+0x1],edx
 2f2:	00 00                	add    BYTE PTR [eax],al
 2f4:	02 91 68 10 d1 01    	add    dl,BYTE PTR [ecx+0x1d11068]
 2fa:	00 00                	add    BYTE PTR [eax],al
 2fc:	01 55 3a             	add    DWORD PTR [ebp+0x3a],edx
 2ff:	00 00                	add    BYTE PTR [eax],al
 301:	00 02                	add    BYTE PTR [edx],al
 303:	91                   	xchg   ecx,eax
 304:	64                   	fs
 305:	10 d9                	adc    cl,bl
 307:	00 00                	add    BYTE PTR [eax],al
 309:	00 01                	add    BYTE PTR [ecx],al
 30b:	56                   	push   esi
 30c:	3a 00                	cmp    al,BYTE PTR [eax]
 30e:	00 00                	add    BYTE PTR [eax],al
 310:	02 91 60 10 d0 01    	add    dl,BYTE PTR [ecx+0x1d01060]
 316:	00 00                	add    BYTE PTR [eax],al
 318:	01 57 3a             	add    DWORD PTR [edi+0x3a],edx
 31b:	00 00                	add    BYTE PTR [eax],al
 31d:	00 02                	add    BYTE PTR [edx],al
 31f:	91                   	xchg   ecx,eax
 320:	5c                   	pop    esp
 321:	10 bc 02 00 00 01 58 	adc    BYTE PTR [edx+eax*1+0x58010000],bh
 328:	3a 00                	cmp    al,BYTE PTR [eax]
 32a:	00 00                	add    BYTE PTR [eax],al
 32c:	02 91 58 10 b9 02    	add    dl,BYTE PTR [ecx+0x2b91058]
 332:	00 00                	add    BYTE PTR [eax],al
 334:	01 59 3a             	add    DWORD PTR [ecx+0x3a],ebx
 337:	00 00                	add    BYTE PTR [eax],al
 339:	00 02                	add    BYTE PTR [edx],al
 33b:	91                   	xchg   ecx,eax
 33c:	54                   	push   esp
 33d:	10 3b                	adc    BYTE PTR [ebx],bh
 33f:	01 00                	add    DWORD PTR [eax],eax
 341:	00 01                	add    BYTE PTR [ecx],al
 343:	5a                   	pop    edx
 344:	72 03                	jb     349 <parseParamsShell-0x30ffcb7>
 346:	00 00                	add    BYTE PTR [eax],al
 348:	02 91 50 10 29 00    	add    dl,BYTE PTR [ecx+0x291050]
 34e:	00 00                	add    BYTE PTR [eax],al
 350:	01 5b 72             	add    DWORD PTR [ebx+0x72],ebx
 353:	03 00                	add    eax,DWORD PTR [eax]
 355:	00 02                	add    BYTE PTR [edx],al
 357:	91                   	xchg   ecx,eax
 358:	4c                   	dec    esp
 359:	11 74 03 10          	adc    DWORD PTR [ebx+eax*1+0x10],esi
 35d:	03 9e 00 00 00 10    	add    ebx,DWORD PTR [esi+0x10000000]
 363:	31 01                	xor    DWORD PTR [ecx],eax
 365:	00 00                	add    BYTE PTR [eax],al
 367:	01 b4 b3 01 00 00 02 	add    DWORD PTR [ebx+esi*4+0x2000001],esi
 36e:	91                   	xchg   ecx,eax
 36f:	48                   	dec    eax
 370:	00 00                	add    BYTE PTR [eax],al
 372:	0c 04                	or     al,0x4
 374:	b3 01                	mov    bl,0x1
 376:	00 00                	add    BYTE PTR [eax],al
 378:	0c 04                	or     al,0x4
 37a:	7e 03                	jle    37f <parseParamsShell-0x30ffc81>
 37c:	00 00                	add    BYTE PTR [eax],al
 37e:	14 25                	adc    al,0x25
 380:	00 00                	add    BYTE PTR [eax],al
 382:	00 15 7e 01 00 00    	add    BYTE PTR ds:0x17e,dl
 388:	01 ca                	add    edx,ecx
 38a:	41                   	inc    ecx
 38b:	04 10                	add    al,0x10
 38d:	03 58 00             	add    ebx,DWORD PTR [eax+0x0]
 390:	00 00                	add    BYTE PTR [eax],al
 392:	01 9c b1 03 00 00 11 	add    DWORD PTR [ecx+esi*4+0x11000003],ebx
 399:	57                   	push   edi
 39a:	04 10                	add    al,0x10
 39c:	03 3f                	add    edi,DWORD PTR [edi]
 39e:	00 00                	add    BYTE PTR [eax],al
 3a0:	00 0f                	add    BYTE PTR [edi],cl
 3a2:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 3a5:	00 01                	add    BYTE PTR [ecx],al
 3a7:	cd 6c                	int    0x6c
 3a9:	00 00                	add    BYTE PTR [eax],al
 3ab:	00 02                	add    BYTE PTR [edx],al
 3ad:	91                   	xchg   ecx,eax
 3ae:	6c                   	ins    BYTE PTR es:[edi],dx
 3af:	00 00                	add    BYTE PTR [eax],al
 3b1:	16                   	push   ss
 3b2:	fd                   	std    
 3b3:	01 00                	add    DWORD PTR [eax],eax
 3b5:	00 01                	add    BYTE PTR [ecx],al
 3b7:	e7 99                	out    0x99,eax
 3b9:	04 10                	add    al,0x10
 3bb:	03 ab 00 00 00 01    	add    ebp,DWORD PTR [ebx+0x1000000]
 3c1:	9c                   	pushf  
 3c2:	e1 03                	loope  3c7 <parseParamsShell-0x30ffc39>
 3c4:	00 00                	add    BYTE PTR [eax],al
 3c6:	0e                   	push   cs
 3c7:	08 02                	or     BYTE PTR [edx],al
 3c9:	00 00                	add    BYTE PTR [eax],al
 3cb:	01 e7                	add    edi,esp
 3cd:	b3 01                	mov    bl,0x1
 3cf:	00 00                	add    BYTE PTR [eax],al
 3d1:	02 91 00 0f 69 00    	add    dl,BYTE PTR [ecx+0x690f00]
 3d7:	01 e9                	add    ecx,ebp
 3d9:	3a 00                	cmp    al,BYTE PTR [eax]
 3db:	00 00                	add    BYTE PTR [eax],al
 3dd:	02 91 6c 00 16 7d    	add    dl,BYTE PTR [ecx+0x7d16006c]
 3e3:	02 00                	add    al,BYTE PTR [eax]
 3e5:	00 01                	add    BYTE PTR [ecx],al
 3e7:	fe 44 05 10          	inc    BYTE PTR [ebp+eax*1+0x10]
 3eb:	03 9d 00 00 00 01    	add    ebx,DWORD PTR [ebp+0x1000000]
 3f1:	9c                   	pushf  
 3f2:	33 04 00             	xor    eax,DWORD PTR [eax+eax*1]
 3f5:	00 0e                	add    BYTE PTR [esi],cl
 3f7:	b1 02                	mov    cl,0x2
 3f9:	00 00                	add    BYTE PTR [eax],al
 3fb:	01 fe                	add    esi,edi
 3fd:	b3 01                	mov    bl,0x1
 3ff:	00 00                	add    BYTE PTR [eax],al
 401:	02 91 00 17 a3 02    	add    dl,BYTE PTR [ecx+0x2a31700]
 407:	00 00                	add    BYTE PTR [eax],al
 409:	01 00                	add    DWORD PTR [eax],eax
 40b:	01 33                	add    DWORD PTR [ebx],esi
 40d:	04 00                	add    al,0x0
 40f:	00 03                	add    BYTE PTR [ebx],al
 411:	91                   	xchg   ecx,eax
 412:	e8 57 17 a9 01       	call   1a91b6e <parseParamsShell-0x166e492>
 417:	00 00                	add    BYTE PTR [eax],al
 419:	01 01                	add    DWORD PTR [ecx],eax
 41b:	01 3a                	add    DWORD PTR [edx],edi
 41d:	00 00                	add    BYTE PTR [eax],al
 41f:	00 02                	add    BYTE PTR [edx],al
 421:	91                   	xchg   ecx,eax
 422:	6c                   	ins    BYTE PTR es:[edi],dx
 423:	18 70 69             	sbb    BYTE PTR [eax+0x69],dh
 426:	64 00 01             	add    BYTE PTR fs:[ecx],al
 429:	02 01                	add    al,BYTE PTR [ecx]
 42b:	61                   	popa   
 42c:	00 00                	add    BYTE PTR [eax],al
 42e:	00 02                	add    BYTE PTR [edx],al
 430:	91                   	xchg   ecx,eax
 431:	68 00 12 25 00       	push   0x251200
 436:	00 00                	add    BYTE PTR [eax],al
 438:	4a                   	dec    edx
 439:	04 00                	add    al,0x0
 43b:	00 19                	add    BYTE PTR [ecx],bl
 43d:	65 02 00             	add    al,BYTE PTR gs:[eax]
 440:	00 09                	add    BYTE PTR [ecx],cl
 442:	13 65 02             	adc    esp,DWORD PTR [ebp+0x2]
 445:	00 00                	add    BYTE PTR [eax],al
 447:	ff 01                	inc    DWORD PTR [ecx]
 449:	00 1a                	add    BYTE PTR [edx],bl
 44b:	32 03                	xor    al,BYTE PTR [ebx]
 44d:	00 00                	add    BYTE PTR [eax],al
 44f:	01 13                	add    DWORD PTR [ebx],edx
 451:	01 3a                	add    DWORD PTR [edx],edi
 453:	00 00                	add    BYTE PTR [eax],al
 455:	00 e1                	add    cl,ah
 457:	05 10 03 f3 01       	add    eax,0x1f30310
 45c:	00 00                	add    BYTE PTR [eax],al
 45e:	01 9c 3a 05 00 00 1b 	add    DWORD PTR [edx+edi*1+0x1b000005],ebx
 465:	bc 02 00 00 01       	mov    esp,0x1000002
 46a:	13 01                	adc    eax,DWORD PTR [ecx]
 46c:	3a 00                	cmp    al,BYTE PTR [eax]
 46e:	00 00                	add    BYTE PTR [eax],al
 470:	02 91 00 1b 3b 01    	add    dl,BYTE PTR [ecx+0x13b1b00]
 476:	00 00                	add    BYTE PTR [eax],al
 478:	01 13                	add    DWORD PTR [ebx],edx
 47a:	01 72 03             	add    DWORD PTR [edx+0x3],esi
 47d:	00 00                	add    BYTE PTR [eax],al
 47f:	02 91 04 17 08 02    	add    dl,BYTE PTR [ecx+0x2081704]
 485:	00 00                	add    BYTE PTR [eax],al
 487:	01 15 01 3a 05 00    	add    DWORD PTR ds:0x53a01,edx
 48d:	00 03                	add    BYTE PTR [ebx],al
 48f:	91                   	xchg   ecx,eax
 490:	dc 7d 17             	fdivr  QWORD PTR [ebp+0x17]
 493:	e8 00 00 00 01       	call   1000498 <parseParamsShell-0x20ffb68>
 498:	16                   	push   ss
 499:	01 48 00             	add    DWORD PTR [eax+0x0],ecx
 49c:	00 00                	add    BYTE PTR [eax],al
 49e:	03 91 db 7d 17 03    	add    edx,DWORD PTR [ecx+0x3177ddb]
 4a4:	03 00                	add    eax,DWORD PTR [eax]
 4a6:	00 01                	add    BYTE PTR [ecx],al
 4a8:	17                   	pop    ss
 4a9:	01 3a                	add    DWORD PTR [edx],edi
 4ab:	00 00                	add    BYTE PTR [eax],al
 4ad:	00 02                	add    BYTE PTR [edx],al
 4af:	91                   	xchg   ecx,eax
 4b0:	6c                   	ins    BYTE PTR es:[edi],dx
 4b1:	17                   	pop    ss
 4b2:	11 02                	adc    DWORD PTR [edx],eax
 4b4:	00 00                	add    BYTE PTR [eax],al
 4b6:	01 18                	add    DWORD PTR [eax],ebx
 4b8:	01 4a 05             	add    DWORD PTR [edx+0x5],ecx
 4bb:	00 00                	add    BYTE PTR [eax],al
 4bd:	03 91 97 6a 17 c1    	add    edx,DWORD PTR [ecx-0x3ee89569]
 4c3:	02 00                	add    al,BYTE PTR [eax]
 4c5:	00 01                	add    BYTE PTR [ecx],al
 4c7:	19 01                	sbb    DWORD PTR [ecx],eax
 4c9:	3a 00                	cmp    al,BYTE PTR [eax]
 4cb:	00 00                	add    BYTE PTR [eax],al
 4cd:	02 91 68 17 8b 01    	add    dl,BYTE PTR [ecx+0x18b1768]
 4d3:	00 00                	add    BYTE PTR [eax],al
 4d5:	01 1a                	add    DWORD PTR [edx],ebx
 4d7:	01 3a                	add    DWORD PTR [edx],edi
 4d9:	00 00                	add    BYTE PTR [eax],al
 4db:	00 02                	add    BYTE PTR [edx],al
 4dd:	91                   	xchg   ecx,eax
 4de:	64                   	fs
 4df:	17                   	pop    ss
 4e0:	cd 02                	int    0x2
 4e2:	00 00                	add    BYTE PTR [eax],al
 4e4:	01 1b                	add    DWORD PTR [ebx],ebx
 4e6:	01 3a                	add    DWORD PTR [edx],edi
 4e8:	00 00                	add    BYTE PTR [eax],al
 4ea:	00 02                	add    BYTE PTR [edx],al
 4ec:	91                   	xchg   ecx,eax
 4ed:	60                   	pusha  
 4ee:	17                   	pop    ss
 4ef:	9b                   	fwait
 4f0:	02 00                	add    al,BYTE PTR [eax]
 4f2:	00 01                	add    BYTE PTR [ecx],al
 4f4:	1c 01                	sbb    al,0x1
 4f6:	60                   	pusha  
 4f7:	05 00 00 03 91       	add    eax,0x91030000
 4fc:	83 6a 1c 0c          	sub    DWORD PTR [edx+0x1c],0xc
 500:	01 00                	add    DWORD PTR [eax],eax
 502:	00 01                	add    BYTE PTR [ecx],al
 504:	26 01 6a 06          	add    DWORD PTR es:[edx+0x6],ebp
 508:	10 03                	adc    BYTE PTR [ebx],al
 50a:	1c 59                	sbb    al,0x59
 50c:	01 00                	add    DWORD PTR [eax],eax
 50e:	00 01                	add    BYTE PTR [ecx],al
 510:	2b 01                	sub    eax,DWORD PTR [ecx]
 512:	a6                   	cmps   BYTE PTR ds:[esi],BYTE PTR es:[edi]
 513:	06                   	push   es
 514:	10 03                	adc    BYTE PTR [ebx],al
 516:	1c f3                	sbb    al,0xf3
 518:	02 00                	add    al,BYTE PTR [eax]
 51a:	00 01                	add    BYTE PTR [ecx],al
 51c:	7a 01                	jp     51f <parseParamsShell-0x30ffae1>
 51e:	4d                   	dec    ebp
 51f:	07                   	pop    es
 520:	10 03                	adc    BYTE PTR [ebx],al
 522:	11 6a 06             	adc    DWORD PTR [edx+0x6],ebp
 525:	10 03                	adc    BYTE PTR [ebx],al
 527:	51                   	push   ecx
 528:	01 00                	add    DWORD PTR [eax],eax
 52a:	00 18                	add    BYTE PTR [eax],bl
 52c:	69 00 01 7d 01 3a    	imul   eax,DWORD PTR [eax],0x3a017d01
 532:	00 00                	add    BYTE PTR [eax],al
 534:	00 02                	add    BYTE PTR [edx],al
 536:	91                   	xchg   ecx,eax
 537:	5c                   	pop    esp
 538:	00 00                	add    BYTE PTR [eax],al
 53a:	12 25 00 00 00 4a    	adc    ah,BYTE PTR ds:0x4a000000
 540:	05 00 00 19 65       	add    eax,0x65190000
 545:	02 00                	add    al,BYTE PTR [eax]
 547:	00 ff                	add    bh,bh
 549:	00 12                	add    BYTE PTR [edx],dl
 54b:	25 00 00 00 60       	and    eax,0x60000000
 550:	05 00 00 19 65       	add    eax,0x65190000
 555:	02 00                	add    al,BYTE PTR [eax]
 557:	00 31                	add    BYTE PTR [ecx],dh
 559:	19 65 02             	sbb    DWORD PTR [ebp+0x2],esp
 55c:	00 00                	add    BYTE PTR [eax],al
 55e:	31 00                	xor    DWORD PTR [eax],eax
 560:	12 25 00 00 00 70    	adc    ah,BYTE PTR ds:0x70000000
 566:	05 00 00 19 65       	add    eax,0x65190000
 56b:	02 00                	add    al,BYTE PTR [eax]
 56d:	00 13                	add    BYTE PTR [ebx],dl
 56f:	00 1d 85 01 00 00    	add    BYTE PTR ds:0x185,bl
 575:	01 92 01 d4 07 10    	add    DWORD PTR [edx+0x1007d401],edx
 57b:	03 58 00             	add    ebx,DWORD PTR [eax+0x0]
 57e:	00 00                	add    BYTE PTR [eax],al
 580:	01 9c a6 05 00 00 1b 	add    DWORD PTR [esi+eiz*4+0x1b000005],ebx
 587:	b1 02                	mov    cl,0x2
 589:	00 00                	add    BYTE PTR [eax],al
 58b:	01 92 01 b3 01 00    	add    DWORD PTR [edx+0x1b301],edx
 591:	00 02                	add    BYTE PTR [edx],al
 593:	91                   	xchg   ecx,eax
 594:	00 17                	add    BYTE PTR [edi],dl
 596:	a3 02 00 00 01       	mov    ds:0x1000002,eax
 59b:	94                   	xchg   esp,eax
 59c:	01 33                	add    DWORD PTR [ebx],esi
 59e:	04 00                	add    al,0x0
 5a0:	00 03                	add    BYTE PTR [ebx],al
 5a2:	91                   	xchg   ecx,eax
 5a3:	f0 57                	lock push edi
 5a5:	00 1e                	add    BYTE PTR [esi],bl
 5a7:	66                   	data16
 5a8:	00 00                	add    BYTE PTR [eax],al
 5aa:	00 05 32 61 00 00    	add    BYTE PTR ds:0x6132,al
 5b0:	00 05 03 ec 10 10    	add    BYTE PTR ds:0x1010ec03,al
 5b6:	03 1e                	add    ebx,DWORD PTR [esi]
 5b8:	40                   	inc    eax
 5b9:	01 00                	add    DWORD PTR [eax],eax
 5bb:	00 05 33 61 00 00    	add    BYTE PTR ds:0x6133,al
 5c1:	00 05 03 f0 10 10    	add    BYTE PTR ds:0x1010f003,al
 5c7:	03 1e                	add    ebx,DWORD PTR [esi]
 5c9:	2a 03                	sub    al,BYTE PTR [ebx]
 5cb:	00 00                	add    BYTE PTR [eax],al
 5cd:	05 34 61 00 00       	add    eax,0x6134
 5d2:	00 05 03 e8 10 10    	add    BYTE PTR ds:0x1010e803,al
 5d8:	03 1e                	add    ebx,DWORD PTR [esi]
 5da:	9a 01 00 00 03 63 10 	call   0x1063:0x3000001
 5e1:	01 00                	add    DWORD PTR [eax],eax
 5e3:	00 05 03 f8 10 10    	add    BYTE PTR ds:0x1010f803,al
 5e9:	03 1e                	add    ebx,DWORD PTR [esi]
 5eb:	23 02                	and    eax,DWORD PTR [edx]
 5ed:	00 00                	add    BYTE PTR [eax],al
 5ef:	03 e1                	add    esp,ecx
 5f1:	5f                   	pop    edi
 5f2:	01 00                	add    DWORD PTR [eax],eax
 5f4:	00 05 03 e4 10 10    	add    BYTE PTR ds:0x1010e403,al
 5fa:	03 1e                	add    ebx,DWORD PTR [esi]
 5fc:	46                   	inc    esi
 5fd:	00 00                	add    BYTE PTR [eax],al
 5ff:	00 04 1d 54 02 00 00 	add    BYTE PTR [ebx*1+0x254],al
 606:	05 03 e0 0e 10       	add    eax,0x100ee003
 60b:	03 1e                	add    ebx,DWORD PTR [esi]
 60d:	45                   	inc    ebp
 60e:	02 00                	add    al,BYTE PTR [eax]
 610:	00 04 1e             	add    BYTE PTR [esi+ebx*1],al
 613:	b3 01                	mov    bl,0x1
 615:	00 00                	add    BYTE PTR [eax],al
 617:	05 03 00 11 10       	add    eax,0x10110003
 61c:	03 12                	add    edx,DWORD PTR [edx]
 61e:	b9 01 00 00 2d       	mov    ecx,0x2d000001
 623:	06                   	push   es
 624:	00 00                	add    BYTE PTR [eax],al
 626:	19 65 02             	sbb    DWORD PTR [ebp+0x2],esp
 629:	00 00                	add    BYTE PTR [eax],al
 62b:	02 00                	add    al,BYTE PTR [eax]
 62d:	1e                   	push   ds
 62e:	fc                   	cld    
 62f:	00 00                	add    BYTE PTR [eax],al
 631:	00 04 1f             	add    BYTE PTR [edi+ebx*1],al
 634:	1d 06 00 00 05       	sbb    eax,0x5000006
 639:	03 c0                	add    eax,eax
 63b:	0d 10 03 1f 1e       	or     eax,0x1e1f0310
 640:	0c 00                	or     al,0x0
 642:	00 00                	add    BYTE PTR [eax],al
 644:	04 24                	add    al,0x24
 646:	50                   	push   eax
 647:	06                   	push   es
 648:	00 00                	add    BYTE PTR [eax],al
 64a:	05 03 f4 10 10       	add    eax,0x1010f403
 64f:	03 0c 04             	add    ecx,DWORD PTR [esp+eax*1]
 652:	3e                   	ds
 653:	06                   	push   es
 654:	00 00                	add    BYTE PTR [eax],al
 656:	20 61 06             	and    BYTE PTR [ecx+0x6],ah
 659:	00 00                	add    BYTE PTR [eax],al
 65b:	21 b3 01 00 00 00    	and    DWORD PTR [ebx+0x1],esi
 661:	1e                   	push   ds
 662:	bd 01 00 00 04       	mov    ebp,0x4000001
 667:	25 72 06 00 00       	and    eax,0x672
 66c:	05 03 e0 10 10       	add    eax,0x1010e003
 671:	03 0c 04             	add    ecx,DWORD PTR [esp+eax*1]
 674:	56                   	push   esi
 675:	06                   	push   es
 676:	00 00                	add    BYTE PTR [eax],al
 678:	1e                   	push   ds
 679:	01 01                	add    DWORD PTR [ecx],eax
 67b:	00 00                	add    BYTE PTR [eax],al
 67d:	01 10                	add    DWORD PTR [eax],edx
 67f:	81 00 00 00 05 03    	add    DWORD PTR [eax],0x3050000
 685:	c0 0e 10             	ror    BYTE PTR [esi],0x10
 688:	03 1e                	add    ebx,DWORD PTR [esi]
 68a:	89 02                	mov    DWORD PTR [edx],eax
 68c:	00 00                	add    BYTE PTR [eax],al
 68e:	01 11                	add    DWORD PTR [ecx],edx
 690:	61                   	popa   
 691:	00 00                	add    BYTE PTR [eax],al
 693:	00 05 03 c4 0e 10    	add    BYTE PTR ds:0x100ec403,al
 699:	03 00                	add    eax,DWORD PTR [eax]

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
  35:	00 05 13 01 0b 0b    	add    BYTE PTR ds:0xb0b0113,al
  3b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  3d:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  3f:	01 13                	add    DWORD PTR [ebx],edx
  41:	00 00                	add    BYTE PTR [eax],al
  43:	06                   	push   es
  44:	0d 00 03 0e 3a       	or     eax,0x3a0e0300
  49:	0b 3b                	or     edi,DWORD PTR [ebx]
  4b:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  4e:	0b 0b                	or     ecx,DWORD PTR [ebx]
  50:	0d 0b 0c 0b 38       	or     eax,0x380b0c0b
  55:	0b 00                	or     eax,DWORD PTR [eax]
  57:	00 07                	add    BYTE PTR [edi],al
  59:	17                   	pop    ss
  5a:	01 0b                	add    DWORD PTR [ebx],ecx
  5c:	0b 3a                	or     edi,DWORD PTR [edx]
  5e:	0b 3b                	or     edi,DWORD PTR [ebx]
  60:	0b 01                	or     eax,DWORD PTR [ecx]
  62:	13 00                	adc    eax,DWORD PTR [eax]
  64:	00 08                	add    BYTE PTR [eax],cl
  66:	0d 00 49 13 00       	or     eax,0x134900
  6b:	00 09                	add    BYTE PTR [ecx],cl
  6d:	0d 00 03 08 3a       	or     eax,0x3a080300
  72:	0b 3b                	or     edi,DWORD PTR [ebx]
  74:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  77:	00 00                	add    BYTE PTR [eax],al
  79:	0a 0f                	or     cl,BYTE PTR [edi]
  7b:	00 0b                	add    BYTE PTR [ebx],cl
  7d:	0b 00                	or     eax,DWORD PTR [eax]
  7f:	00 0b                	add    BYTE PTR [ebx],cl
  81:	0d 00 03 0e 3a       	or     eax,0x3a0e0300
  86:	0b 3b                	or     edi,DWORD PTR [ebx]
  88:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  8b:	38 0b                	cmp    BYTE PTR [ebx],cl
  8d:	00 00                	add    BYTE PTR [eax],al
  8f:	0c 0f                	or     al,0xf
  91:	00 0b                	add    BYTE PTR [ebx],cl
  93:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  96:	00 00                	add    BYTE PTR [eax],al
  98:	0d 2e 01 3f 19       	or     eax,0x193f012e
  9d:	03 0e                	add    ecx,DWORD PTR [esi]
  9f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  a1:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  a3:	27                   	daa    
  a4:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
  a7:	11 01                	adc    DWORD PTR [ecx],eax
  a9:	12 06                	adc    al,BYTE PTR [esi]
  ab:	40                   	inc    eax
  ac:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  b2:	00 00                	add    BYTE PTR [eax],al
  b4:	0e                   	push   cs
  b5:	05 00 03 0e 3a       	add    eax,0x3a0e0300
  ba:	0b 3b                	or     edi,DWORD PTR [ebx]
  bc:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  bf:	02 18                	add    bl,BYTE PTR [eax]
  c1:	00 00                	add    BYTE PTR [eax],al
  c3:	0f 34                	sysenter 
  c5:	00 03                	add    BYTE PTR [ebx],al
  c7:	08 3a                	or     BYTE PTR [edx],bh
  c9:	0b 3b                	or     edi,DWORD PTR [ebx]
  cb:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  ce:	02 18                	add    bl,BYTE PTR [eax]
  d0:	00 00                	add    BYTE PTR [eax],al
  d2:	10 34 00             	adc    BYTE PTR [eax+eax*1],dh
  d5:	03 0e                	add    ecx,DWORD PTR [esi]
  d7:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  d9:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  db:	49                   	dec    ecx
  dc:	13 02                	adc    eax,DWORD PTR [edx]
  de:	18 00                	sbb    BYTE PTR [eax],al
  e0:	00 11                	add    BYTE PTR [ecx],dl
  e2:	0b 01                	or     eax,DWORD PTR [ecx]
  e4:	11 01                	adc    DWORD PTR [ecx],eax
  e6:	12 06                	adc    al,BYTE PTR [esi]
  e8:	00 00                	add    BYTE PTR [eax],al
  ea:	12 01                	adc    al,BYTE PTR [ecx]
  ec:	01 49 13             	add    DWORD PTR [ecx+0x13],ecx
  ef:	01 13                	add    DWORD PTR [ebx],edx
  f1:	00 00                	add    BYTE PTR [eax],al
  f3:	13 21                	adc    esp,DWORD PTR [ecx]
  f5:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
  f8:	2f                   	das    
  f9:	05 00 00 14 26       	add    eax,0x26140000
  fe:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 101:	00 00                	add    BYTE PTR [eax],al
 103:	15 2e 01 3f 19       	adc    eax,0x193f012e
 108:	03 0e                	add    ecx,DWORD PTR [esi]
 10a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 10c:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 10e:	11 01                	adc    DWORD PTR [ecx],eax
 110:	12 06                	adc    al,BYTE PTR [esi]
 112:	40                   	inc    eax
 113:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 119:	00 00                	add    BYTE PTR [eax],al
 11b:	16                   	push   ss
 11c:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 11f:	19 03                	sbb    DWORD PTR [ebx],eax
 121:	0e                   	push   cs
 122:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 124:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 126:	27                   	daa    
 127:	19 11                	sbb    DWORD PTR [ecx],edx
 129:	01 12                	add    DWORD PTR [edx],edx
 12b:	06                   	push   es
 12c:	40                   	inc    eax
 12d:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 133:	00 00                	add    BYTE PTR [eax],al
 135:	17                   	pop    ss
 136:	34 00                	xor    al,0x0
 138:	03 0e                	add    ecx,DWORD PTR [esi]
 13a:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 13c:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 142:	00 00                	add    BYTE PTR [eax],al
 144:	18 34 00             	sbb    BYTE PTR [eax+eax*1],dh
 147:	03 08                	add    ecx,DWORD PTR [eax]
 149:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 14b:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 151:	00 00                	add    BYTE PTR [eax],al
 153:	19 21                	sbb    DWORD PTR [ecx],esp
 155:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 158:	2f                   	das    
 159:	0b 00                	or     eax,DWORD PTR [eax]
 15b:	00 1a                	add    BYTE PTR [edx],bl
 15d:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 160:	19 03                	sbb    DWORD PTR [ebx],eax
 162:	0e                   	push   cs
 163:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 165:	3b 05 27 19 49 13    	cmp    eax,DWORD PTR ds:0x13491927
 16b:	11 01                	adc    DWORD PTR [ecx],eax
 16d:	12 06                	adc    al,BYTE PTR [esi]
 16f:	40                   	inc    eax
 170:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 176:	00 00                	add    BYTE PTR [eax],al
 178:	1b 05 00 03 0e 3a    	sbb    eax,DWORD PTR ds:0x3a0e0300
 17e:	0b 3b                	or     edi,DWORD PTR [ebx]
 180:	05 49 13 02 18       	add    eax,0x18021349
 185:	00 00                	add    BYTE PTR [eax],al
 187:	1c 0a                	sbb    al,0xa
 189:	00 03                	add    BYTE PTR [ebx],al
 18b:	0e                   	push   cs
 18c:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 18e:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 194:	1d 2e 01 3f 19       	sbb    eax,0x193f012e
 199:	03 0e                	add    ecx,DWORD PTR [esi]
 19b:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 19d:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 1a3:	12 06                	adc    al,BYTE PTR [esi]
 1a5:	40                   	inc    eax
 1a6:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 1ac:	00 00                	add    BYTE PTR [eax],al
 1ae:	1e                   	push   ds
 1af:	34 00                	xor    al,0x0
 1b1:	03 0e                	add    ecx,DWORD PTR [esi]
 1b3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1b5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1b7:	49                   	dec    ecx
 1b8:	13 3f                	adc    edi,DWORD PTR [edi]
 1ba:	19 02                	sbb    DWORD PTR [edx],eax
 1bc:	18 00                	sbb    BYTE PTR [eax],al
 1be:	00 1f                	add    BYTE PTR [edi],bl
 1c0:	15 00 27 19 00       	adc    eax,0x192700
 1c5:	00 20                	add    BYTE PTR [eax],ah
 1c7:	15 01 27 19 01       	adc    eax,0x1192701
 1cc:	13 00                	adc    eax,DWORD PTR [eax]
 1ce:	00 21                	add    BYTE PTR [ecx],ah
 1d0:	05 00 49 13 00       	add    eax,0x134900
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
  14:	2c 08                	sub    al,0x8
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	43                   	inc    ebx
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
  21:	79 6f                	jns    92 <parseParamsShell-0x30fff6e>
  23:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
  2a:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
  2d:	73 73                	jae    a2 <parseParamsShell-0x30fff5e>
  2f:	2f                   	das    
  30:	6c                   	ins    BYTE PTR es:[edi],dx
  31:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
  38:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
  3e:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
  44:	78 2d                	js     73 <parseParamsShell-0x30fff8d>
  46:	67 6e                	outs   dx,BYTE PTR ds:[si]
  48:	75 2f                	jne    79 <parseParamsShell-0x30fff87>
  4a:	35 2e 33 2e 30       	xor    eax,0x302e332e
  4f:	2f                   	das    
  50:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  57:	00 2f                	add    BYTE PTR [edi],ch
  59:	68 6f 6d 65 2f       	push   0x2f656d6f
  5e:	79 6f                	jns    cf <parseParamsShell-0x30fff31>
  60:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  67:	6f                   	outs   dx,DWORD PTR ds:[esi]
  68:	73 2f                	jae    99 <parseParamsShell-0x30fff67>
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
  8d:	79 6f                	jns    fe <parseParamsShell-0x30fff02>
  8f:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  96:	6f                   	outs   dx,DWORD PTR ds:[esi]
  97:	73 2f                	jae    c8 <parseParamsShell-0x30fff38>
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
  f3:	16                   	push   ss
  f4:	01 75 d7             	add    DWORD PTR [ebp-0x29],esi
  f7:	d8 08                	fmul   DWORD PTR [eax]
  f9:	3e                   	ds
  fa:	bd 00 02 04 01       	mov    ebp,0x1040200
  ff:	06                   	push   es
 100:	e4 00                	in     al,0x0
 102:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
 105:	e4 06                	in     al,0x6
 107:	e7 00                	out    0x0,eax
 109:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 10c:	06                   	push   es
 10d:	e4 06                	in     al,0x6
 10f:	e5 02                	in     eax,0x2
 111:	25 13 08 4b 67       	and    eax,0x674b0813
 116:	e3 34                	jecxz  14c <parseParamsShell-0x30ffeb4>
 118:	00 02                	add    BYTE PTR [edx],al
 11a:	04 02                	add    al,0x2
 11c:	02 25 14 00 02 04    	add    ah,BYTE PTR ds:0x4020014
 122:	02 03                	add    al,BYTE PTR [ebx]
 124:	6f                   	outs   dx,DWORD PTR ds:[esi]
 125:	4a                   	dec    edx
 126:	00 02                	add    BYTE PTR [edx],al
 128:	04 01                	add    al,0x1
 12a:	06                   	push   es
 12b:	4a                   	dec    edx
 12c:	06                   	push   es
 12d:	03 13                	add    edx,DWORD PTR [ebx]
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
 14f:	34 69                	xor    al,0x69
 151:	75 75                	jne    1c8 <parseParamsShell-0x30ffe38>
 153:	75 75                	jne    1ca <parseParamsShell-0x30ffe36>
 155:	75 78                	jne    1cf <parseParamsShell-0x30ffe31>
 157:	a1 08 ec 00 02       	mov    eax,ds:0x200ec08
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
 1ac:	3d 31 67 f3 00       	cmp    eax,0xf36731
 1b1:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 1b4:	91                   	xchg   ecx,eax
 1b5:	00 02                	add    BYTE PTR [edx],al
 1b7:	04 03                	add    al,0x3
 1b9:	02 2c 11             	add    ch,BYTE PTR [ecx+edx*1]
 1bc:	00 02                	add    BYTE PTR [edx],al
 1be:	04 01                	add    al,0x1
 1c0:	06                   	push   es
 1c1:	4a                   	dec    edx
 1c2:	06                   	push   es
 1c3:	68 03 19 3c 75       	push   0x753c1903
 1c8:	08 14 68             	or     BYTE PTR [eax+ebp*2],dl
 1cb:	4c                   	dec    esp
 1cc:	08 21                	or     BYTE PTR [ecx],ah
 1ce:	08 21                	or     BYTE PTR [ecx],ah
 1d0:	08 13                	or     BYTE PTR [ebx],dl
 1d2:	03 0a                	add    ecx,DWORD PTR [edx]
 1d4:	74 03                	je     1d9 <parseParamsShell-0x30ffe27>
 1d6:	79 2e                	jns    206 <parseParamsShell-0x30ffdfa>
 1d8:	02 30                	add    dh,BYTE PTR [eax]
 1da:	19 2c 08             	sbb    DWORD PTR [eax+ecx*1],ebp
 1dd:	30 69 a0             	xor    BYTE PTR [ecx-0x60],ch
 1e0:	08 bb 76 08 67 08    	or     BYTE PTR [ebx+0x8670876],bh
 1e6:	cf                   	iret   
 1e7:	08 2f                	or     BYTE PTR [edi],ch
 1e9:	d7                   	xlat   BYTE PTR ds:[ebx]
 1ea:	08 31                	or     BYTE PTR [ecx],dh
 1ec:	69 92 75 76 75 75 77 	imul   edx,DWORD PTR [edx+0x75757675],0x4b087577
 1f3:	75 08 4b 
 1f6:	08 59 08             	or     BYTE PTR [ecx+0x8],bl
 1f9:	59                   	pop    ecx
 1fa:	f4                   	hlt    
 1fb:	5b                   	pop    ebx
 1fc:	75 75                	jne    273 <parseParamsShell-0x30ffd8d>
 1fe:	08 83 08 4c 75 30    	or     BYTE PTR [ebx+0x30754c08],al
 204:	08 56 b1             	or     BYTE PTR [esi-0x4f],dl
 207:	ae                   	scas   al,BYTE PTR es:[edi]
 208:	03 0d 66 30 ae 03    	add    ecx,DWORD PTR ds:0x3ae3066
 20e:	0d 82 31 03 09       	or     eax,0x9033182
 213:	ac                   	lods   al,BYTE PTR ds:[esi]
 214:	30 ae 68 03 0c e4    	xor    BYTE PTR [esi-0x1bf3fc98],ch
 21a:	b2 08                	mov    dl,0x8
 21c:	68 03 7a 58 03       	push   0x3587a03
 221:	09 20                	or     DWORD PTR [eax],esp
 223:	ad                   	lods   eax,DWORD PTR ds:[esi]
 224:	59                   	pop    ecx
 225:	08 4c 08 21          	or     BYTE PTR [eax+ecx*1+0x21],cl
 229:	68 03 09 4a 02       	push   0x24a0903
 22e:	27                   	daa    
 22f:	13 03                	adc    eax,DWORD PTR [ebx]
 231:	98                   	cwde   
 232:	7f 66                	jg     29a <parseParamsShell-0x30ffd66>
 234:	03 eb                	add    ebp,ebx
 236:	00 08                	add    BYTE PTR [eax],cl
 238:	20 59 31             	and    BYTE PTR [ecx+0x31],bl
 23b:	93                   	xchg   ebx,eax
 23c:	08 ca                	or     dl,cl
 23e:	08 bd 9f 75 02 03    	or     BYTE PTR [ebp+0x302759f],bh
 244:	00 01                	add    BYTE PTR [ecx],al
 246:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	64                   	fs
   1:	65                   	gs
   2:	73 63                	jae    67 <parseParamsShell-0x30fff99>
   4:	72 69                	jb     6f <parseParamsShell-0x30fff91>
   6:	70 74                	jo     7c <parseParamsShell-0x30fff84>
   8:	69 6f 6e 00 63 6f 6d 	imul   ebp,DWORD PTR [edi+0x6e],0x6d6f6300
   f:	6d                   	ins    DWORD PTR es:[edi],dx
  10:	61                   	popa   
  11:	6e                   	outs   dx,BYTE PTR ds:[esi]
  12:	64                   	fs
  13:	5f                   	pop    edi
  14:	66                   	data16
  15:	75 6e                	jne    85 <parseParamsShell-0x30fff7b>
  17:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
  1b:	6e                   	outs   dx,BYTE PTR ds:[esi]
  1c:	00 70 72             	add    BYTE PTR [eax+0x72],dh
  1f:	65                   	gs
  20:	66                   	data16
  21:	65                   	gs
  22:	74 63                	je     87 <parseParamsShell-0x30fff79>
  24:	68 77 74 31 00       	push   0x317477
  29:	6e                   	outs   dx,BYTE PTR ds:[esi]
  2a:	61                   	popa   
  2b:	72 67                	jb     94 <parseParamsShell-0x30fff6c>
  2d:	76 00                	jbe    2f <parseParamsShell-0x30fffd1>
  2f:	6c                   	ins    BYTE PTR es:[edi],dx
  30:	6f                   	outs   dx,DWORD PTR ds:[esi]
  31:	6e                   	outs   dx,BYTE PTR ds:[esi]
  32:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  36:	6e                   	outs   dx,BYTE PTR ds:[esi]
  37:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
  3b:	73 69                	jae    a6 <parseParamsShell-0x30fff5a>
  3d:	67 6e                	outs   dx,BYTE PTR ds:[si]
  3f:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  44:	74 00                	je     46 <parseParamsShell-0x30fffba>
  46:	73 45                	jae    8d <parseParamsShell-0x30fff73>
  48:	78 65                	js     af <parseParamsShell-0x30fff51>
  4a:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
  4d:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
  54:	72 61                	jb     b7 <parseParamsShell-0x30fff49>
  56:	6d                   	ins    DWORD PTR es:[edi],dx
  57:	00 6c 6f 6e          	add    BYTE PTR [edi+ebp*2+0x6e],ch
  5b:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  5f:	6e                   	outs   dx,BYTE PTR ds:[esi]
  60:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
  64:	74 00                	je     66 <parseParamsShell-0x30fff9a>
  66:	68 65 61 70 42       	push   0x42706165
  6b:	61                   	popa   
  6c:	73 65                	jae    d3 <parseParamsShell-0x30fff2d>
  6e:	00 65 66             	add    BYTE PTR [ebp+0x66],ah
  71:	61                   	popa   
  72:	6d                   	ins    DWORD PTR es:[edi],dx
  73:	69 6c 79 00 70 61 72 	imul   ebp,DWORD PTR [ecx+edi*2+0x0],0x73726170
  7a:	73 
  7b:	65                   	gs
  7c:	64                   	fs
  7d:	43                   	inc    ebx
  7e:	68 61 72 73 00       	push   0x737261
  83:	47                   	inc    edi
  84:	4e                   	dec    esi
  85:	55                   	push   ebp
  86:	20 43 39             	and    BYTE PTR [ebx+0x39],al
  89:	39 20                	cmp    DWORD PTR [eax],esp
  8b:	35 2e 33 2e 30       	xor    eax,0x302e332e
  90:	20 2d 6d 61 73 6d    	and    BYTE PTR ds:0x6d73616d,ch
  96:	3d 69 6e 74 65       	cmp    eax,0x65746e69
  9b:	6c                   	ins    BYTE PTR es:[edi],dx
  9c:	20 2d 6d 74 75 6e    	and    BYTE PTR ds:0x6e75746d,ch
  a2:	65                   	gs
  a3:	3d 67 65 6e 65       	cmp    eax,0x656e6567
  a8:	72 69                	jb     113 <parseParamsShell-0x30ffeed>
  aa:	63 20                	arpl   WORD PTR [eax],sp
  ac:	2d 6d 61 72 63       	sub    eax,0x6372616d
  b1:	68 3d 70 65 6e       	push   0x6e65703d
  b6:	74 69                	je     121 <parseParamsShell-0x30ffedf>
  b8:	75 6d                	jne    127 <parseParamsShell-0x30ffed9>
  ba:	70 72                	jo     12e <parseParamsShell-0x30ffed2>
  bc:	6f                   	outs   dx,DWORD PTR ds:[esi]
  bd:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  c3:	74 64                	je     129 <parseParamsShell-0x30ffed7>
  c5:	3d 63 39 39 20       	cmp    eax,0x20393963
  ca:	2d 66 66 72 65       	sub    eax,0x65726666
  cf:	65                   	gs
  d0:	73 74                	jae    146 <parseParamsShell-0x30ffeba>
  d2:	61                   	popa   
  d3:	6e                   	outs   dx,BYTE PTR ds:[esi]
  d4:	64 69 6e 67 00 64 71 	imul   ebp,DWORD PTR fs:[esi+0x67],0x75716400
  db:	75 
  dc:	6f                   	outs   dx,DWORD PTR ds:[esi]
  dd:	74 65                	je     144 <parseParamsShell-0x30ffebc>
  df:	00 6c 52 65          	add    BYTE PTR [edx+edx*2+0x65],ch
  e3:	74 56                	je     13b <parseParamsShell-0x30ffec5>
  e5:	61                   	popa   
  e6:	6c                   	ins    BYTE PTR es:[edi],dx
  e7:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
  eb:	72 72                	jb     15f <parseParamsShell-0x30ffea1>
  ed:	4b                   	dec    ebx
  ee:	65                   	gs
  ef:	79 00                	jns    f1 <parseParamsShell-0x30fff0f>
  f1:	61                   	popa   
  f2:	76 78                	jbe    16c <parseParamsShell-0x30ffe94>
  f4:	35 31 32 76 62       	xor    eax,0x62763231
  f9:	6d                   	ins    DWORD PTR es:[edi],dx
  fa:	69 00 63 6d 64 73    	imul   eax,DWORD PTR [eax],0x73646d63
 100:	00 74 69 6d          	add    BYTE PTR [ecx+ebp*2+0x6d],dh
 104:	65                   	gs
 105:	54                   	push   esp
 106:	6f                   	outs   dx,DWORD PTR ds:[esi]
 107:	45                   	inc    ebp
 108:	78 69                	js     173 <parseParamsShell-0x30ffe8d>
 10a:	74 00                	je     10c <parseParamsShell-0x30ffef4>
 10c:	67                   	addr16
 10d:	65                   	gs
 10e:	74 41                	je     151 <parseParamsShell-0x30ffeaf>
 110:	43                   	inc    ebx
 111:	6f                   	outs   dx,DWORD PTR ds:[esi]
 112:	6d                   	ins    DWORD PTR es:[edi],dx
 113:	6d                   	ins    DWORD PTR es:[edi],dx
 114:	61                   	popa   
 115:	6e                   	outs   dx,BYTE PTR ds:[esi]
 116:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 11a:	6d                   	ins    DWORD PTR es:[edi],dx
 11b:	6d                   	ins    DWORD PTR es:[edi],dx
 11c:	61                   	popa   
 11d:	6e                   	outs   dx,BYTE PTR ds:[esi]
 11e:	64                   	fs
 11f:	5f                   	pop    edi
 120:	74 61                	je     183 <parseParamsShell-0x30ffe7d>
 122:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
 126:	74 00                	je     128 <parseParamsShell-0x30ffed8>
 128:	72 65                	jb     18f <parseParamsShell-0x30ffe71>
 12a:	73 65                	jae    191 <parseParamsShell-0x30ffe6f>
 12c:	72 76                	jb     1a4 <parseParamsShell-0x30ffe5c>
 12e:	65 64 00 74 65 6d    	gs add BYTE PTR fs:gs:[ebp+eiz*2+0x6d],dh
 134:	70 00                	jo     136 <parseParamsShell-0x30ffeca>
 136:	62 75 69             	bound  esi,QWORD PTR [ebp+0x69]
 139:	6c                   	ins    BYTE PTR es:[edi],dx
 13a:	64                   	fs
 13b:	61                   	popa   
 13c:	72 67                	jb     1a5 <parseParamsShell-0x30ffe5b>
 13e:	76 00                	jbe    140 <parseParamsShell-0x30ffec0>
 140:	68 65 61 70 43       	push   0x43706165
 145:	75 72                	jne    1b9 <parseParamsShell-0x30ffe47>
 147:	72 00                	jb     149 <parseParamsShell-0x30ffeb7>
 149:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 14c:	4c                   	dec    esp
 14d:	69 6e 65 00 63 6f 6d 	imul   ebp,DWORD PTR [esi+0x65],0x6d6f6300
 154:	6d                   	ins    DWORD PTR es:[edi],dx
 155:	61                   	popa   
 156:	6e                   	outs   dx,BYTE PTR ds:[esi]
 157:	64 00 67 65          	add    BYTE PTR fs:[edi+0x65],ah
 15b:	74 41                	je     19e <parseParamsShell-0x30ffe62>
 15d:	4b                   	dec    ebx
 15e:	65                   	gs
 15f:	79 00                	jns    161 <parseParamsShell-0x30ffe9f>
 161:	6e                   	outs   dx,BYTE PTR ds:[esi]
 162:	61                   	popa   
 163:	6d                   	ins    DWORD PTR es:[edi],dx
 164:	65 00 73 69          	add    BYTE PTR gs:[ebx+0x69],dh
 168:	7a 65                	jp     1cf <parseParamsShell-0x30ffe31>
 16a:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
 16d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 16e:	72 74                	jb     1e4 <parseParamsShell-0x30ffe1c>
 170:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 173:	73 69                	jae    1de <parseParamsShell-0x30ffe22>
 175:	67 6e                	outs   dx,BYTE PTR ds:[si]
 177:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 17c:	74 00                	je     17e <parseParamsShell-0x30ffe82>
 17e:	68 65 6c 70 4d       	push   0x4d706c65
 183:	65 00 6b 45          	add    BYTE PTR gs:[ebx+0x45],ch
 187:	78 69                	js     1f2 <parseParamsShell-0x30ffe0e>
 189:	74 00                	je     18b <parseParamsShell-0x30ffe75>
 18b:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 18e:	6d                   	ins    DWORD PTR es:[edi],dx
 18f:	61                   	popa   
 190:	6e                   	outs   dx,BYTE PTR ds:[esi]
 191:	64                   	fs
 192:	42                   	inc    edx
 193:	75 66                	jne    1fb <parseParamsShell-0x30ffe05>
 195:	66 50                	push   ax
 197:	74 72                	je     20b <parseParamsShell-0x30ffdf5>
 199:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
 19c:	75 69                	jne    207 <parseParamsShell-0x30ffdf9>
 19e:	64                   	fs
 19f:	5f                   	pop    edi
 1a0:	70 72                	jo     214 <parseParamsShell-0x30ffdec>
 1a2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1a3:	63 69 6e             	arpl   WORD PTR [ecx+0x6e],bp
 1a6:	66 6f                	outs   dx,WORD PTR ds:[esi]
 1a8:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 1ab:	72 61                	jb     20e <parseParamsShell-0x30ffdf2>
 1ad:	6d                   	ins    DWORD PTR es:[edi],dx
 1ae:	43                   	inc    ebx
 1af:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1b0:	75 6e                	jne    220 <parseParamsShell-0x30ffde0>
 1b2:	74 00                	je     1b4 <parseParamsShell-0x30ffe4c>
 1b4:	73 69                	jae    21f <parseParamsShell-0x30ffde1>
 1b6:	7a 65                	jp     21d <parseParamsShell-0x30ffde3>
 1b8:	74 79                	je     233 <parseParamsShell-0x30ffdcd>
 1ba:	70 65                	jo     221 <parseParamsShell-0x30ffddf>
 1bc:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 1bf:	6d                   	ins    DWORD PTR es:[edi],dx
 1c0:	6d                   	ins    DWORD PTR es:[edi],dx
 1c1:	61                   	popa   
 1c2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1c3:	64                   	fs
 1c4:	5f                   	pop    edi
 1c5:	66                   	data16
 1c6:	75 6e                	jne    236 <parseParamsShell-0x30ffdca>
 1c8:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 1cc:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1cd:	5f                   	pop    edi
 1ce:	70 00                	jo     1d0 <parseParamsShell-0x30ffe30>
 1d0:	62 73 71             	bound  esi,QWORD PTR [ebx+0x71]
 1d3:	75 6f                	jne    244 <parseParamsShell-0x30ffdbc>
 1d5:	74 65                	je     23c <parseParamsShell-0x30ffdc4>
 1d7:	00 2f                	add    BYTE PTR [edi],ch
 1d9:	68 6f 6d 65 2f       	push   0x2f656d6f
 1de:	79 6f                	jns    24f <parseParamsShell-0x30ffdb1>
 1e0:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 1e7:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1e8:	73 2f                	jae    219 <parseParamsShell-0x30ffde7>
 1ea:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 1ee:	6c                   	ins    BYTE PTR es:[edi],dx
 1ef:	6c                   	ins    BYTE PTR es:[edi],dx
 1f0:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 1f3:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1f4:	64                   	fs
 1f5:	43                   	inc    ebx
 1f6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1f7:	6d                   	ins    DWORD PTR es:[edi],dx
 1f8:	6d                   	ins    DWORD PTR es:[edi],dx
 1f9:	61                   	popa   
 1fa:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1fb:	64 00 65 78          	add    BYTE PTR fs:[ebp+0x78],ah
 1ff:	65 63 49 6e          	arpl   WORD PTR gs:[ecx+0x6e],cx
 203:	74 65                	je     26a <parseParamsShell-0x30ffd96>
 205:	72 6e                	jb     275 <parseParamsShell-0x30ffd8b>
 207:	61                   	popa   
 208:	6c                   	ins    BYTE PTR es:[edi],dx
 209:	43                   	inc    ebx
 20a:	6f                   	outs   dx,DWORD PTR ds:[esi]
 20b:	6d                   	ins    DWORD PTR es:[edi],dx
 20c:	6d                   	ins    DWORD PTR es:[edi],dx
 20d:	61                   	popa   
 20e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 20f:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 213:	6d                   	ins    DWORD PTR es:[edi],dx
 214:	6d                   	ins    DWORD PTR es:[edi],dx
 215:	61                   	popa   
 216:	6e                   	outs   dx,BYTE PTR ds:[esi]
 217:	64                   	fs
 218:	73 00                	jae    21a <parseParamsShell-0x30ffde6>
 21a:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 21e:	6c                   	ins    BYTE PTR es:[edi],dx
 21f:	6c                   	ins    BYTE PTR es:[edi],dx
 220:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 223:	63 70 75             	arpl   WORD PTR [eax+0x75],si
 226:	69 64 5f 65 78 74 65 	imul   esp,DWORD PTR [edi+ebx*2+0x65],0x6e657478
 22d:	6e 
 22e:	64                   	fs
 22f:	65                   	gs
 230:	64                   	fs
 231:	5f                   	pop    edi
 232:	66                   	data16
 233:	65                   	gs
 234:	61                   	popa   
 235:	74 75                	je     2ac <parseParamsShell-0x30ffd54>
 237:	72 65                	jb     29e <parseParamsShell-0x30ffd62>
 239:	5f                   	pop    edi
 23a:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
 23d:	73 00                	jae    23f <parseParamsShell-0x30ffdc1>
 23f:	5f                   	pop    edi
 240:	42                   	inc    edx
 241:	6f                   	outs   dx,DWORD PTR ds:[esi]
 242:	6f                   	outs   dx,DWORD PTR ds:[esi]
 243:	6c                   	ins    BYTE PTR es:[edi],dx
 244:	00 73 4b             	add    BYTE PTR [ebx+0x4b],dh
 247:	53                   	push   ebx
 248:	68 65 6c 6c 50       	push   0x506c6c65
 24d:	72 6f                	jb     2be <parseParamsShell-0x30ffd42>
 24f:	67 72 61             	addr16 jb 2b3 <parseParamsShell-0x30ffd4d>
 252:	6d                   	ins    DWORD PTR es:[edi],dx
 253:	4e                   	dec    esi
 254:	61                   	popa   
 255:	6d                   	ins    DWORD PTR es:[edi],dx
 256:	65 00 75 6e          	add    BYTE PTR gs:[ebp+0x6e],dh
 25a:	73 69                	jae    2c5 <parseParamsShell-0x30ffd3b>
 25c:	67 6e                	outs   dx,BYTE PTR ds:[si]
 25e:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 263:	61                   	popa   
 264:	72 00                	jb     266 <parseParamsShell-0x30ffd9a>
 266:	63 6f 70             	arpl   WORD PTR [edi+0x70],bp
 269:	79 62                	jns    2cd <parseParamsShell-0x30ffd33>
 26b:	75 66                	jne    2d3 <parseParamsShell-0x30ffd2d>
 26d:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 270:	65                   	gs
 271:	70 00                	jo     273 <parseParamsShell-0x30ffd8d>
 273:	73 68                	jae    2dd <parseParamsShell-0x30ffd23>
 275:	6f                   	outs   dx,DWORD PTR ds:[esi]
 276:	72 74                	jb     2ec <parseParamsShell-0x30ffd14>
 278:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 27b:	74 00                	je     27d <parseParamsShell-0x30ffd83>
 27d:	65                   	gs
 27e:	78 65                	js     2e5 <parseParamsShell-0x30ffd1b>
 280:	63 70 00             	arpl   WORD PTR [eax+0x0],si
 283:	69 6e 70 75 74 00 65 	imul   ebp,DWORD PTR [esi+0x70],0x65007475
 28a:	78 69                	js     2f5 <parseParamsShell-0x30ffd0b>
 28c:	74 43                	je     2d1 <parseParamsShell-0x30ffd2f>
 28e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 28f:	64 65 00 75 69       	fs add BYTE PTR fs:gs:[ebp+0x69],dh
 294:	6e                   	outs   dx,BYTE PTR ds:[esi]
 295:	74 33                	je     2ca <parseParamsShell-0x30ffd36>
 297:	32 5f 74             	xor    bl,BYTE PTR [edi+0x74]
 29a:	00 61 6e             	add    BYTE PTR [ecx+0x6e],ah
 29d:	73 69                	jae    308 <parseParamsShell-0x30ffcf8>
 29f:	53                   	push   ebx
 2a0:	65                   	gs
 2a1:	71 00                	jno    2a3 <parseParamsShell-0x30ffd5d>
 2a3:	70 61                	jo     306 <parseParamsShell-0x30ffcfa>
 2a5:	72 61                	jb     308 <parseParamsShell-0x30ffcf8>
 2a7:	6d                   	ins    DWORD PTR es:[edi],dx
 2a8:	73 00                	jae    2aa <parseParamsShell-0x30ffd56>
 2aa:	65                   	gs
 2ab:	6d                   	ins    DWORD PTR es:[edi],dx
 2ac:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2ad:	64                   	fs
 2ae:	65                   	gs
 2af:	6c                   	ins    BYTE PTR es:[edi],dx
 2b0:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 2b3:	64                   	fs
 2b4:	6c                   	ins    BYTE PTR es:[edi],dx
 2b5:	69 6e 65 00 6d 61 78 	imul   ebp,DWORD PTR [esi+0x65],0x78616d00
 2bc:	61                   	popa   
 2bd:	72 67                	jb     326 <parseParamsShell-0x30ffcda>
 2bf:	63 00                	arpl   WORD PTR [eax],ax
 2c1:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 2c4:	6d                   	ins    DWORD PTR es:[edi],dx
 2c5:	61                   	popa   
 2c6:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2c7:	64                   	fs
 2c8:	73 50                	jae    31a <parseParamsShell-0x30ffce6>
 2ca:	74 72                	je     33e <parseParamsShell-0x30ffcc2>
 2cc:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 2cf:	6d                   	ins    DWORD PTR es:[edi],dx
 2d0:	6d                   	ins    DWORD PTR es:[edi],dx
 2d1:	61                   	popa   
 2d2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2d3:	64                   	fs
 2d4:	57                   	push   edi
 2d5:	61                   	popa   
 2d6:	73 46                	jae    31e <parseParamsShell-0x30ffce2>
 2d8:	72 6f                	jb     349 <parseParamsShell-0x30ffcb7>
 2da:	6d                   	ins    DWORD PTR es:[edi],dx
 2db:	54                   	push   esp
 2dc:	68 69 73 42 75       	push   0x75427369
 2e1:	66                   	data16
 2e2:	66                   	data16
 2e3:	65                   	gs
 2e4:	72 50                	jb     336 <parseParamsShell-0x30ffcca>
 2e6:	74 72                	je     35a <parseParamsShell-0x30ffca6>
 2e8:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 2eb:	64 31 00             	xor    DWORD PTR fs:[eax],eax
 2ee:	70 61                	jo     351 <parseParamsShell-0x30ffcaf>
 2f0:	64 32 00             	xor    al,BYTE PTR fs:[eax]
 2f3:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 2f5:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2f6:	65                   	gs
 2f7:	47                   	inc    edi
 2f8:	65                   	gs
 2f9:	74 74                	je     36f <parseParamsShell-0x30ffc91>
 2fb:	69 6e 67 4b 65 79 73 	imul   ebp,DWORD PTR [esi+0x67],0x7379654b
 302:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
 306:	72 72                	jb     37a <parseParamsShell-0x30ffc86>
 308:	4b                   	dec    ebx
 309:	65                   	gs
 30a:	79 43                	jns    34f <parseParamsShell-0x30ffcb1>
 30c:	6f                   	outs   dx,DWORD PTR ds:[esi]
 30d:	75 6e                	jne    37d <parseParamsShell-0x30ffc83>
 30f:	74 00                	je     311 <parseParamsShell-0x30ffcef>
 311:	75 69                	jne    37c <parseParamsShell-0x30ffc84>
 313:	6e                   	outs   dx,BYTE PTR ds:[esi]
 314:	74 38                	je     34e <parseParamsShell-0x30ffcb2>
 316:	5f                   	pop    edi
 317:	74 00                	je     319 <parseParamsShell-0x30ffce7>
 319:	70 61                	jo     37c <parseParamsShell-0x30ffc84>
 31b:	72 73                	jb     390 <parseParamsShell-0x30ffc70>
 31d:	65                   	gs
 31e:	50                   	push   eax
 31f:	61                   	popa   
 320:	72 61                	jb     383 <parseParamsShell-0x30ffc7d>
 322:	6d                   	ins    DWORD PTR es:[edi],dx
 323:	73 53                	jae    378 <parseParamsShell-0x30ffc88>
 325:	68 65 6c 6c 00       	push   0x6c6c65
 32a:	68 65 61 70 45       	push   0x45706165
 32f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 330:	64 00 6b 53          	add    BYTE PTR fs:[ebx+0x53],ch
 334:	68 65 6c 6c 00       	push   0x6c6c65

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
