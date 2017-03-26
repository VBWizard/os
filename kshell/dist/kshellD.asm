
Debug/cross-Linux/kshell:     file format elf32-i386


Disassembly of section .text:

03100000 <main>:
main():
/home/yogi/src/os/kshell/kshell.c:19
#include "kshell.h"

/*
 * 
 */
int main(int argc, char** argv) {
 3100000:	55                   	push   ebp
 3100001:	89 e5                	mov    ebp,esp
/home/yogi/src/os/kshell/kshell.c:21

    return (0);
 3100003:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/kshell/kshell.c:22
}
 3100008:	5d                   	pop    ebp
 3100009:	c3                   	ret    

0310000a <parseParamsShell>:
parseParamsShell():
/home/yogi/src/os/kshell/kshell.c:29

extern int kATADeviceInfoCount;


int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
 310000a:	55                   	push   ebp
 310000b:	89 e5                	mov    ebp,esp
 310000d:	53                   	push   ebx
 310000e:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/kshell/kshell.c:30
    int x=0,y=0;
 3100011:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100018:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:31
    int lRetVal=0,parsedChars=0;
 310001f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 3100026:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:33
    
    memset(params,0, size);
 310002d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
 3100030:	83 ec 04             	sub    esp,0x4
 3100033:	50                   	push   eax
 3100034:	6a 00                	push   0x0
 3100036:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
 3100039:	e8 c2 07 00 00       	call   3100800 <kShell+0x253>
 310003e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:35
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100041:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
 3100048:	e9 c9 00 00 00       	jmp    3100116 <parseParamsShell+0x10c>
/home/yogi/src/os/kshell/kshell.c:38
    {
        //print("c=%c\n", cmdLine[cnt]);
        if ( (cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',')
 310004d:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100050:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100053:	01 d0                	add    eax,edx
 3100055:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100058:	3c 20                	cmp    al,0x20
 310005a:	74 1e                	je     310007a <parseParamsShell+0x70>
/home/yogi/src/os/kshell/kshell.c:38 (discriminator 1)
 310005c:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310005f:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100062:	01 d0                	add    eax,edx
 3100064:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100067:	3c 2d                	cmp    al,0x2d
 3100069:	74 0f                	je     310007a <parseParamsShell+0x70>
/home/yogi/src/os/kshell/kshell.c:38 (discriminator 2)
 310006b:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310006e:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100071:	01 d0                	add    eax,edx
 3100073:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100076:	3c 2c                	cmp    al,0x2c
 3100078:	75 6f                	jne    31000e9 <parseParamsShell+0xdf>
/home/yogi/src/os/kshell/kshell.c:41
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
 310007a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310007d:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 3100080:	01 d0                	add    eax,edx
 3100082:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100085:	3c 2d                	cmp    al,0x2d
 3100087:	74 0f                	je     3100098 <parseParamsShell+0x8e>
/home/yogi/src/os/kshell/kshell.c:41 (discriminator 1)
 3100089:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310008c:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
 310008f:	01 d0                	add    eax,edx
 3100091:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100094:	3c 2f                	cmp    al,0x2f
 3100096:	75 25                	jne    31000bd <parseParamsShell+0xb3>
/home/yogi/src/os/kshell/kshell.c:42
                params[y][x++]=cmdLine[cnt];
 3100098:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310009b:	c1 e0 09             	shl    eax,0x9
 310009e:	89 c2                	mov    edx,eax
 31000a0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31000a3:	8d 0c 02             	lea    ecx,[edx+eax*1]
 31000a6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31000a9:	8d 50 01             	lea    edx,[eax+0x1]
 31000ac:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31000af:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 31000b2:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 31000b5:	01 da                	add    edx,ebx
 31000b7:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31000ba:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/kshell/kshell.c:43
            params[y][x]='\0';
 31000bd:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31000c0:	c1 e0 09             	shl    eax,0x9
 31000c3:	89 c2                	mov    edx,eax
 31000c5:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31000c8:	01 c2                	add    edx,eax
 31000ca:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31000cd:	01 d0                	add    eax,edx
 31000cf:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:44
            if (cnt>0)
 31000d2:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 31000d6:	74 36                	je     310010e <parseParamsShell+0x104>
/home/yogi/src/os/kshell/kshell.c:45
                {x=0;y++;lRetVal++;}
 31000d8:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 31000df:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
 31000e3:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/kshell/kshell.c:44
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
 31000e7:	eb 25                	jmp    310010e <parseParamsShell+0x104>
/home/yogi/src/os/kshell/kshell.c:50
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
 31000e9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 31000ec:	c1 e0 09             	shl    eax,0x9
 31000ef:	89 c2                	mov    edx,eax
 31000f1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 31000f4:	8d 0c 02             	lea    ecx,[edx+eax*1]
 31000f7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31000fa:	8d 50 01             	lea    edx,[eax+0x1]
 31000fd:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100100:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
 3100103:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
 3100106:	01 da                	add    edx,ebx
 3100108:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310010b:	88 14 01             	mov    BYTE PTR [ecx+eax*1],dl
/home/yogi/src/os/kshell/kshell.c:52 (discriminator 2)
        }
        parsedChars++;
 310010e:	83 45 e8 01          	add    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/kshell/kshell.c:35 (discriminator 2)
    int x=0,y=0;
    int lRetVal=0,parsedChars=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
 3100112:	83 45 e4 01          	add    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/kshell/kshell.c:35 (discriminator 1)
 3100116:	83 ec 0c             	sub    esp,0xc
 3100119:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310011c:	e8 ff 06 00 00       	call   3100820 <kShell+0x273>
 3100121:	83 c4 10             	add    esp,0x10
 3100124:	3b 45 e4             	cmp    eax,DWORD PTR [ebp-0x1c]
 3100127:	0f 87 20 ff ff ff    	ja     310004d <parseParamsShell+0x43>
/home/yogi/src/os/kshell/kshell.c:54
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
 310012d:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100131:	74 19                	je     310014c <parseParamsShell+0x142>
/home/yogi/src/os/kshell/kshell.c:56
    {
        lRetVal++;
 3100133:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/kshell/kshell.c:57
        params[y][x]='\0';
 3100137:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310013a:	c1 e0 09             	shl    eax,0x9
 310013d:	89 c2                	mov    edx,eax
 310013f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
 3100142:	01 c2                	add    edx,eax
 3100144:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100147:	01 d0                	add    eax,edx
 3100149:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:62
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
 310014c:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
/home/yogi/src/os/kshell/kshell.c:63
}
 310014f:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 3100152:	c9                   	leave  
 3100153:	c3                   	ret    

03100154 <findCommand>:
findCommand():
/home/yogi/src/os/kshell/kshell.c:66

int findCommand(char* command)
{
 3100154:	55                   	push   ebp
 3100155:	89 e5                	mov    ebp,esp
 3100157:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:70
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 310015a:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100161:	eb 4d                	jmp    31001b0 <findCommand+0x5c>
/home/yogi/src/os/kshell/kshell.c:72
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
 3100163:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100166:	c1 e0 04             	shl    eax,0x4
 3100169:	05 80 0c 10 03       	add    eax,0x3100c80
 310016e:	8b 00                	mov    eax,DWORD PTR [eax]
 3100170:	83 ec 0c             	sub    esp,0xc
 3100173:	50                   	push   eax
 3100174:	e8 a7 06 00 00       	call   3100820 <kShell+0x273>
 3100179:	83 c4 10             	add    esp,0x10
 310017c:	89 c2                	mov    edx,eax
 310017e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100181:	c1 e0 04             	shl    eax,0x4
 3100184:	05 80 0c 10 03       	add    eax,0x3100c80
 3100189:	8b 00                	mov    eax,DWORD PTR [eax]
 310018b:	83 ec 04             	sub    esp,0x4
 310018e:	52                   	push   edx
 310018f:	50                   	push   eax
 3100190:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 3100193:	e8 58 06 00 00       	call   31007f0 <kShell+0x243>
 3100198:	83 c4 10             	add    esp,0x10
 310019b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:74
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
 310019e:	83 7d f0 00          	cmp    DWORD PTR [ebp-0x10],0x0
 31001a2:	75 08                	jne    31001ac <findCommand+0x58>
/home/yogi/src/os/kshell/kshell.c:77
        {
            //print("findCommand returning %u", i+1);
            return i+1;
 31001a4:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31001a7:	83 c0 01             	add    eax,0x1
 31001aa:	eb 0f                	jmp    31001bb <findCommand+0x67>
/home/yogi/src/os/kshell/kshell.c:70 (discriminator 2)
int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
 31001ac:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:70 (discriminator 1)
 31001b0:	83 7d f4 01          	cmp    DWORD PTR [ebp-0xc],0x1
 31001b4:	76 ad                	jbe    3100163 <findCommand+0xf>
/home/yogi/src/os/kshell/kshell.c:81
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
 31001b6:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/kshell/kshell.c:82
}
 31001bb:	c9                   	leave  
 31001bc:	c3                   	ret    

031001bd <buildargv>:
buildargv():
/home/yogi/src/os/kshell/kshell.c:88



/*parts from http://*/
char **buildargv (const char *input)
{
 31001bd:	55                   	push   ebp
 31001be:	89 e5                	mov    ebp,esp
 31001c0:	83 ec 38             	sub    esp,0x38
/home/yogi/src/os/kshell/kshell.c:91
  char *arg;
  char *copybuf;
  int squote = 0;
 31001c3:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/kshell/kshell.c:92
  int dquote = 0;
 31001ca:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:93
  int bsquote = 0;
 31001d1:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/kshell/kshell.c:94
  int argc = 0;
 31001d8:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
/home/yogi/src/os/kshell/kshell.c:95
  int maxargc = 0;
 31001df:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/kshell/kshell.c:96
  char **argv = NULL;
 31001e6:	c7 45 d8 00 00 00 00 	mov    DWORD PTR [ebp-0x28],0x0
/home/yogi/src/os/kshell/kshell.c:100
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
 31001ed:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
 31001f1:	0f 84 33 02 00 00    	je     310042a <buildargv+0x26d>
/home/yogi/src/os/kshell/kshell.c:103
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
 31001f7:	83 ec 0c             	sub    esp,0xc
 31001fa:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31001fd:	e8 1e 06 00 00       	call   3100820 <kShell+0x273>
 3100202:	83 c4 10             	add    esp,0x10
 3100205:	83 c0 01             	add    eax,0x1
 3100208:	83 ec 0c             	sub    esp,0xc
 310020b:	50                   	push   eax
 310020c:	e8 cf 05 00 00       	call   31007e0 <kShell+0x233>
 3100211:	83 c4 10             	add    esp,0x10
 3100214:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:111
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
 3100217:	83 7d dc 00          	cmp    DWORD PTR [ebp-0x24],0x0
 310021b:	74 0b                	je     3100228 <buildargv+0x6b>
/home/yogi/src/os/kshell/kshell.c:111 (discriminator 1)
 310021d:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100220:	83 e8 01             	sub    eax,0x1
 3100223:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
 3100226:	7f 3d                	jg     3100265 <buildargv+0xa8>
/home/yogi/src/os/kshell/kshell.c:114
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
 3100228:	83 7d d8 00          	cmp    DWORD PTR [ebp-0x28],0x0
 310022c:	75 1c                	jne    310024a <buildargv+0x8d>
/home/yogi/src/os/kshell/kshell.c:116
		{
		  maxargc = INITIAL_MAXARGC;
 310022e:	c7 45 dc 14 00 00 00 	mov    DWORD PTR [ebp-0x24],0x14
/home/yogi/src/os/kshell/kshell.c:117
		  nargv = (char **) malloc (maxargc * sizeof (char *));
 3100235:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
 3100238:	c1 e0 02             	shl    eax,0x2
 310023b:	83 ec 0c             	sub    esp,0xc
 310023e:	50                   	push   eax
 310023f:	e8 9c 05 00 00       	call   31007e0 <kShell+0x233>
 3100244:	83 c4 10             	add    esp,0x10
 3100247:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
/home/yogi/src/os/kshell/kshell.c:119
		}
	      argv = nargv;
 310024a:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
 310024d:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/kshell/kshell.c:120
	      argv[argc] = NULL;
 3100250:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 3100253:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 310025a:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 310025d:	01 d0                	add    eax,edx
 310025f:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:123
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
 3100265:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100268:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:124
	  while (*input != EOS)
 310026b:	e9 ec 00 00 00       	jmp    310035c <buildargv+0x19f>
/home/yogi/src/os/kshell/kshell.c:126
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
 3100270:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100273:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100276:	3c 20                	cmp    al,0x20
 3100278:	75 16                	jne    3100290 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:126 (discriminator 1)
 310027a:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 310027e:	75 10                	jne    3100290 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:126 (discriminator 2)
 3100280:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 3100284:	75 0a                	jne    3100290 <buildargv+0xd3>
/home/yogi/src/os/kshell/kshell.c:126 (discriminator 3)
 3100286:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310028a:	0f 84 da 00 00 00    	je     310036a <buildargv+0x1ad>
/home/yogi/src/os/kshell/kshell.c:132
		{
		  break;
		}
	      else
		{
		  if (bsquote)
 3100290:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 3100294:	74 1d                	je     31002b3 <buildargv+0xf6>
/home/yogi/src/os/kshell/kshell.c:134
		    {
		      bsquote = 0;
 3100296:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/kshell/kshell.c:135
		      *arg++ = *input;
 310029d:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31002a0:	8d 50 01             	lea    edx,[eax+0x1]
 31002a3:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31002a6:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31002a9:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31002ac:	88 10                	mov    BYTE PTR [eax],dl
 31002ae:	e9 a5 00 00 00       	jmp    3100358 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:137
		    }
		  else if (*input == '\\')
 31002b3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31002b6:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31002b9:	3c 5c                	cmp    al,0x5c
 31002bb:	75 0c                	jne    31002c9 <buildargv+0x10c>
/home/yogi/src/os/kshell/kshell.c:139
		    {
		      bsquote = 1;
 31002bd:	c7 45 e4 01 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x1
 31002c4:	e9 8f 00 00 00       	jmp    3100358 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:141
		    }
		  else if (squote)
 31002c9:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31002cd:	74 26                	je     31002f5 <buildargv+0x138>
/home/yogi/src/os/kshell/kshell.c:143
		    {
		      if (*input == '\'')
 31002cf:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31002d2:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 31002d5:	3c 27                	cmp    al,0x27
 31002d7:	75 09                	jne    31002e2 <buildargv+0x125>
/home/yogi/src/os/kshell/kshell.c:145
			{
			  squote = 0;
 31002d9:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
 31002e0:	eb 76                	jmp    3100358 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:149
			}
		      else
			{
			  *arg++ = *input;
 31002e2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31002e5:	8d 50 01             	lea    edx,[eax+0x1]
 31002e8:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 31002eb:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 31002ee:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 31002f1:	88 10                	mov    BYTE PTR [eax],dl
 31002f3:	eb 63                	jmp    3100358 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:152
			}
		    }
		  else if (dquote)
 31002f5:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
 31002f9:	74 26                	je     3100321 <buildargv+0x164>
/home/yogi/src/os/kshell/kshell.c:154
		    {
		      if (*input == '"')
 31002fb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 31002fe:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100301:	3c 22                	cmp    al,0x22
 3100303:	75 09                	jne    310030e <buildargv+0x151>
/home/yogi/src/os/kshell/kshell.c:156
			{
			  dquote = 0;
 3100305:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
 310030c:	eb 4a                	jmp    3100358 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:160
			}
		      else
			{
			  *arg++ = *input;
 310030e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 3100311:	8d 50 01             	lea    edx,[eax+0x1]
 3100314:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100317:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 310031a:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 310031d:	88 10                	mov    BYTE PTR [eax],dl
 310031f:	eb 37                	jmp    3100358 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:165
			}
		    }
		  else
		    {
		      if (*input == '\'')
 3100321:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100324:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100327:	3c 27                	cmp    al,0x27
 3100329:	75 09                	jne    3100334 <buildargv+0x177>
/home/yogi/src/os/kshell/kshell.c:167
			{
			  squote = 1;
 310032b:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
 3100332:	eb 24                	jmp    3100358 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:169
			}
		      else if (*input == '"')
 3100334:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100337:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 310033a:	3c 22                	cmp    al,0x22
 310033c:	75 09                	jne    3100347 <buildargv+0x18a>
/home/yogi/src/os/kshell/kshell.c:171
			{
			  dquote = 1;
 310033e:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
 3100345:	eb 11                	jmp    3100358 <buildargv+0x19b>
/home/yogi/src/os/kshell/kshell.c:175
			}
		      else
			{
			  *arg++ = *input;
 3100347:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310034a:	8d 50 01             	lea    edx,[eax+0x1]
 310034d:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100350:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 3100353:	0f b6 12             	movzx  edx,BYTE PTR [edx]
 3100356:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/kshell/kshell.c:179
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
 3100358:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/kshell/kshell.c:124
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
 310035c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310035f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100362:	84 c0                	test   al,al
 3100364:	0f 85 06 ff ff ff    	jne    3100270 <buildargv+0xb3>
/home/yogi/src/os/kshell/kshell.c:182
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
 310036a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310036d:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:184
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
 3100370:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100373:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100376:	84 c0                	test   al,al
 3100378:	0f 84 9e 00 00 00    	je     310041c <buildargv+0x25f>
/home/yogi/src/os/kshell/kshell.c:186
          {
            char* temp=malloc(strlen(copybuf)+1);
 310037e:	83 ec 0c             	sub    esp,0xc
 3100381:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100384:	e8 97 04 00 00       	call   3100820 <kShell+0x273>
 3100389:	83 c4 10             	add    esp,0x10
 310038c:	83 c0 01             	add    eax,0x1
 310038f:	83 ec 0c             	sub    esp,0xc
 3100392:	50                   	push   eax
 3100393:	e8 48 04 00 00       	call   31007e0 <kShell+0x233>
 3100398:	83 c4 10             	add    esp,0x10
 310039b:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
/home/yogi/src/os/kshell/kshell.c:189
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
 310039e:	83 ec 08             	sub    esp,0x8
 31003a1:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31003a4:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 31003a7:	e8 f4 03 00 00       	call   31007a0 <kShell+0x1f3>
 31003ac:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:190
            free(copybuf);
 31003af:	83 ec 0c             	sub    esp,0xc
 31003b2:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 31003b5:	e8 76 04 00 00       	call   3100830 <kShell+0x283>
 31003ba:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:191
            copybuf = (char *) malloc (strlen (input) + 1);
 31003bd:	83 ec 0c             	sub    esp,0xc
 31003c0:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31003c3:	e8 58 04 00 00       	call   3100820 <kShell+0x273>
 31003c8:	83 c4 10             	add    esp,0x10
 31003cb:	83 c0 01             	add    eax,0x1
 31003ce:	83 ec 0c             	sub    esp,0xc
 31003d1:	50                   	push   eax
 31003d2:	e8 09 04 00 00       	call   31007e0 <kShell+0x233>
 31003d7:	83 c4 10             	add    esp,0x10
 31003da:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/kshell/kshell.c:192
            argv[argc] = temp;
 31003dd:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31003e0:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31003e7:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 31003ea:	01 c2                	add    edx,eax
 31003ec:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
 31003ef:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/kshell/kshell.c:194
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
 31003f1:	83 45 e0 01          	add    DWORD PTR [ebp-0x20],0x1
/home/yogi/src/os/kshell/kshell.c:195
            argv[argc] = NULL;
 31003f5:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
 31003f8:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
 31003ff:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
 3100402:	01 d0                	add    eax,edx
 3100404:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/kshell/kshell.c:196
            input++;
 310040a:	83 45 08 01          	add    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/kshell/kshell.c:197
            free(temp);
 310040e:	83 ec 0c             	sub    esp,0xc
 3100411:	ff 75 d0             	push   DWORD PTR [ebp-0x30]
 3100414:	e8 17 04 00 00       	call   3100830 <kShell+0x283>
 3100419:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:200
          }
	}
      while (*input != EOS);
 310041c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 310041f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
 3100422:	84 c0                	test   al,al
 3100424:	0f 85 ed fd ff ff    	jne    3100217 <buildargv+0x5a>
/home/yogi/src/os/kshell/kshell.c:203
    }
  //print("buildargv: exiting\n");
  free(copybuf);
 310042a:	83 ec 0c             	sub    esp,0xc
 310042d:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
 3100430:	e8 fb 03 00 00       	call   3100830 <kShell+0x283>
 3100435:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:204
  free(nargv);
 3100438:	83 ec 0c             	sub    esp,0xc
 310043b:	ff 75 d4             	push   DWORD PTR [ebp-0x2c]
 310043e:	e8 ed 03 00 00       	call   3100830 <kShell+0x283>
 3100443:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:205
  return (argv);
 3100446:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
/home/yogi/src/os/kshell/kshell.c:206
}
 3100449:	c9                   	leave  
 310044a:	c3                   	ret    

0310044b <helpMe>:
helpMe():
/home/yogi/src/os/kshell/kshell.c:209

void helpMe()
{
 310044b:	55                   	push   ebp
 310044c:	89 e5                	mov    ebp,esp
 310044e:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/kshell/kshell.c:210
    print("Help:\n");
 3100451:	83 ec 0c             	sub    esp,0xc
 3100454:	68 78 08 10 03       	push   0x3100878
 3100459:	e8 52 03 00 00       	call   31007b0 <kShell+0x203>
 310045e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:211
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100461:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
 3100468:	eb 30                	jmp    310049a <helpMe+0x4f>
/home/yogi/src/os/kshell/kshell.c:212 (discriminator 3)
        print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
 310046a:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310046d:	c1 e0 04             	shl    eax,0x4
 3100470:	05 84 0c 10 03       	add    eax,0x3100c84
 3100475:	8b 10                	mov    edx,DWORD PTR [eax]
 3100477:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310047a:	c1 e0 04             	shl    eax,0x4
 310047d:	05 80 0c 10 03       	add    eax,0x3100c80
 3100482:	8b 00                	mov    eax,DWORD PTR [eax]
 3100484:	83 ec 04             	sub    esp,0x4
 3100487:	52                   	push   edx
 3100488:	50                   	push   eax
 3100489:	68 7f 08 10 03       	push   0x310087f
 310048e:	e8 1d 03 00 00       	call   31007b0 <kShell+0x203>
 3100493:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:211 (discriminator 3)
}

void helpMe()
{
    print("Help:\n");
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
 3100496:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:211 (discriminator 1)
 310049a:	83 7d f4 01          	cmp    DWORD PTR [ebp-0xc],0x1
 310049e:	76 ca                	jbe    310046a <helpMe+0x1f>
/home/yogi/src/os/kshell/kshell.c:213
        print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
}
 31004a0:	90                   	nop
 31004a1:	c9                   	leave  
 31004a2:	c3                   	ret    

031004a3 <execInternalCommand>:
execInternalCommand():
/home/yogi/src/os/kshell/kshell.c:238
    strcpy(sExecutingProgram,sbootShellProgramName);
}
*/

void execInternalCommand(char lCommand[256])
{
 31004a3:	55                   	push   ebp
 31004a4:	89 e5                	mov    ebp,esp
 31004a6:	53                   	push   ebx
 31004a7:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/kshell/kshell.c:239
    int i = findCommand(lCommand);
 31004aa:	83 ec 0c             	sub    esp,0xc
 31004ad:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 31004b0:	e8 9f fc ff ff       	call   3100154 <findCommand>
 31004b5:	83 c4 10             	add    esp,0x10
 31004b8:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:241

    if(i>0)
 31004bb:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31004bf:	7e 74                	jle    3100535 <execInternalCommand+0x92>
/home/yogi/src/os/kshell/kshell.c:243
    {
        i--;
 31004c1:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/kshell/kshell.c:245
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
 31004c5:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004c8:	c1 e0 04             	shl    eax,0x4
 31004cb:	05 88 0c 10 03       	add    eax,0x3100c88
 31004d0:	8b 00                	mov    eax,DWORD PTR [eax]
 31004d2:	a3 94 0f 10 03       	mov    ds:0x3100f94,eax
/home/yogi/src/os/kshell/kshell.c:246
        command_function_p = cmds[i].function;
 31004d7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004da:	c1 e0 04             	shl    eax,0x4
 31004dd:	05 88 0c 10 03       	add    eax,0x3100c88
 31004e2:	8b 00                	mov    eax,DWORD PTR [eax]
 31004e4:	a3 80 0f 10 03       	mov    ds:0x3100f80,eax
/home/yogi/src/os/kshell/kshell.c:247
        if (cmds[i].paramCount==0)
 31004e9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31004ec:	c1 e0 04             	shl    eax,0x4
 31004ef:	05 8c 0c 10 03       	add    eax,0x3100c8c
 31004f4:	8b 00                	mov    eax,DWORD PTR [eax]
 31004f6:	85 c0                	test   eax,eax
 31004f8:	75 09                	jne    3100503 <execInternalCommand+0x60>
/home/yogi/src/os/kshell/kshell.c:248
            command_function();
 31004fa:	a1 94 0f 10 03       	mov    eax,ds:0x3100f94
 31004ff:	ff d0                	call   eax
/home/yogi/src/os/kshell/kshell.c:258
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
    }
}
 3100501:	eb 45                	jmp    3100548 <execInternalCommand+0xa5>
/home/yogi/src/os/kshell/kshell.c:251
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  
 3100503:	8b 1d 80 0f 10 03    	mov    ebx,DWORD PTR ds:0x3100f80
 3100509:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 310050c:	c1 e0 04             	shl    eax,0x4
 310050f:	05 80 0c 10 03       	add    eax,0x3100c80
 3100514:	8b 00                	mov    eax,DWORD PTR [eax]
 3100516:	83 ec 0c             	sub    esp,0xc
 3100519:	50                   	push   eax
 310051a:	e8 01 03 00 00       	call   3100820 <kShell+0x273>
 310051f:	83 c4 10             	add    esp,0x10
 3100522:	8d 50 01             	lea    edx,[eax+0x1]
 3100525:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
 3100528:	01 d0                	add    eax,edx
 310052a:	83 ec 0c             	sub    esp,0xc
 310052d:	50                   	push   eax
 310052e:	ff d3                	call   ebx
 3100530:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:258
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
    }
}
 3100533:	eb 13                	jmp    3100548 <execInternalCommand+0xa5>
/home/yogi/src/os/kshell/kshell.c:256
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  
        }
    }
    else
    {
        print("Invalid command '%s' ya dummy!\n",lCommand);
 3100535:	83 ec 08             	sub    esp,0x8
 3100538:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310053b:	68 88 08 10 03       	push   0x3100888
 3100540:	e8 6b 02 00 00       	call   31007b0 <kShell+0x203>
 3100545:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:258
    }
}
 3100548:	90                   	nop
 3100549:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 310054c:	c9                   	leave  
 310054d:	c3                   	ret    

0310054e <execp>:
execp():
/home/yogi/src/os/kshell/kshell.c:261

void execp(char* cmdline)
{
 310054e:	55                   	push   ebp
 310054f:	89 e5                	mov    ebp,esp
 3100551:	53                   	push   ebx
 3100552:	81 ec 14 14 00 00    	sub    esp,0x1414
/home/yogi/src/os/kshell/kshell.c:263
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
 3100558:	83 ec 04             	sub    esp,0x4
 310055b:	68 00 14 00 00       	push   0x1400
 3100560:	8d 85 f4 eb ff ff    	lea    eax,[ebp-0x140c]
 3100566:	50                   	push   eax
 3100567:	ff 75 08             	push   DWORD PTR [ebp+0x8]
 310056a:	e8 9b fa ff ff       	call   310000a <parseParamsShell>
 310056f:	83 c4 10             	add    esp,0x10
 3100572:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/kshell/kshell.c:265

    print("Executing %s\n",params[0]);
 3100575:	83 ec 08             	sub    esp,0x8
 3100578:	8d 85 f4 eb ff ff    	lea    eax,[ebp-0x140c]
 310057e:	50                   	push   eax
 310057f:	68 a8 08 10 03       	push   0x31008a8
 3100584:	e8 27 02 00 00       	call   31007b0 <kShell+0x203>
 3100589:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:266
    __asm__("push eax\n"
 310058c:	b8 59 00 00 00       	mov    eax,0x59
 3100591:	8d 9d f4 eb ff ff    	lea    ebx,[ebp-0x140c]
 3100597:	b9 00 00 00 00       	mov    ecx,0x0
 310059c:	ba 00 00 00 00       	mov    edx,0x0
 31005a1:	50                   	push   eax
 31005a2:	53                   	push   ebx
 31005a3:	51                   	push   ecx
 31005a4:	52                   	push   edx
 31005a5:	cd 80                	int    0x80
/home/yogi/src/os/kshell/kshell.c:274
            "push edx\n"
            "int 0x80\n"
            ::"a" (0x59),"b" (params[0]),"c" (0),"d" (0));
    //exec(params[0],0,0);
    //strcpy(sExecutingProgram,params[0]+1);
}
 31005a7:	90                   	nop
 31005a8:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
 31005ab:	c9                   	leave  
 31005ac:	c3                   	ret    

031005ad <kShell>:
kShell():
/home/yogi/src/os/kshell/kshell.c:277

void kShell()
{
 31005ad:	55                   	push   ebp
 31005ae:	89 e5                	mov    ebp,esp
 31005b0:	81 ec f8 0a 00 00    	sub    esp,0xaf8
/home/yogi/src/os/kshell/kshell.c:279
    char lCommand[256];
    uint8_t lCurrKey=0;
 31005b6:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:280
    int lCurrKeyCount=0;
 31005bd:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/kshell/kshell.c:282
    char commands[50][50];
    int commandsPtr=0;
 31005c4:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
/home/yogi/src/os/kshell/kshell.c:283
    int commandBuffPtr=0;
 31005cb:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
/home/yogi/src/os/kshell/kshell.c:284
    int commandWasFromThisBufferPtr=0;
 31005d2:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/kshell/kshell.c:287
    char ansiSeq[20];

    ansiSeq[0]=0x1b;
 31005d9:	c6 85 0b f5 ff ff 1b 	mov    BYTE PTR [ebp-0xaf5],0x1b
/home/yogi/src/os/kshell/kshell.c:288
    sKShellProgramName=malloc(1024);
 31005e0:	83 ec 0c             	sub    esp,0xc
 31005e3:	68 00 04 00 00       	push   0x400
 31005e8:	e8 f3 01 00 00       	call   31007e0 <kShell+0x233>
 31005ed:	83 c4 10             	add    esp,0x10
 31005f0:	a3 a0 0f 10 03       	mov    ds:0x3100fa0,eax
/home/yogi/src/os/kshell/kshell.c:289
    strcpy(sKShellProgramName,"kShell");
 31005f5:	a1 a0 0f 10 03       	mov    eax,ds:0x3100fa0
 31005fa:	83 ec 08             	sub    esp,0x8
 31005fd:	68 b6 08 10 03       	push   0x31008b6
 3100602:	50                   	push   eax
 3100603:	e8 98 01 00 00       	call   31007a0 <kShell+0x1f3>
 3100608:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:290
    strcpy(sExecutingProgram,sKShellProgramName);
 310060b:	a1 a0 0f 10 03       	mov    eax,ds:0x3100fa0
 3100610:	83 ec 08             	sub    esp,0x8
 3100613:	50                   	push   eax
 3100614:	68 80 0d 10 03       	push   0x3100d80
 3100619:	e8 82 01 00 00       	call   31007a0 <kShell+0x1f3>
 310061e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:291
    puts("\nWelcome to kShell ... hang a while!\n");
 3100621:	83 ec 0c             	sub    esp,0xc
 3100624:	68 c0 08 10 03       	push   0x31008c0
 3100629:	e8 a2 01 00 00       	call   31007d0 <kShell+0x223>
 310062e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:296

    while (1==1)
    {
getACommand:
        lCurrKey=0;
 3100631:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:297
        lCurrKeyCount=0;
 3100638:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/kshell/kshell.c:298
        memset(lCommand,0,256);
 310063f:	83 ec 04             	sub    esp,0x4
 3100642:	68 00 01 00 00       	push   0x100
 3100647:	6a 00                	push   0x0
 3100649:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 310064f:	50                   	push   eax
 3100650:	e8 ab 01 00 00       	call   3100800 <kShell+0x253>
 3100655:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:299
        print("%s> ",sExecutingProgram);
 3100658:	83 ec 08             	sub    esp,0x8
 310065b:	68 80 0d 10 03       	push   0x3100d80
 3100660:	68 e6 08 10 03       	push   0x31008e6
 3100665:	e8 46 01 00 00       	call   31007b0 <kShell+0x203>
 310066a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:301
getAKey:
        lCurrKey=0;
 310066d:	c6 85 e3 fe ff ff 00 	mov    BYTE PTR [ebp-0x11d],0x0
/home/yogi/src/os/kshell/kshell.c:302
        while(lCurrKey==0)
 3100674:	eb 16                	jmp    310068c <kShell+0xdf>
/home/yogi/src/os/kshell/kshell.c:304
        {
            gets(&lCurrKey,1,1);
 3100676:	83 ec 04             	sub    esp,0x4
 3100679:	6a 01                	push   0x1
 310067b:	6a 01                	push   0x1
 310067d:	8d 85 e3 fe ff ff    	lea    eax,[ebp-0x11d]
 3100683:	50                   	push   eax
 3100684:	e8 37 01 00 00       	call   31007c0 <kShell+0x213>
 3100689:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:302
        lCurrKeyCount=0;
        memset(lCommand,0,256);
        print("%s> ",sExecutingProgram);
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
 310068c:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 3100693:	84 c0                	test   al,al
 3100695:	74 df                	je     3100676 <kShell+0xc9>
/home/yogi/src/os/kshell/kshell.c:307
        {
            gets(&lCurrKey,1,1);
        }
        //print("key='%08X'",lCurrKey);
        if((byte)lCurrKey==0xc8) //up
 3100697:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 310069e:	3c c8                	cmp    al,0xc8
 31006a0:	75 08                	jne    31006aa <kShell+0xfd>
/home/yogi/src/os/kshell/kshell.c:309
        {
            if (commandBuffPtr>=0)
 31006a2:	83 7d ec 00          	cmp    DWORD PTR [ebp-0x14],0x0
 31006a6:	79 02                	jns    31006aa <kShell+0xfd>
/home/yogi/src/os/kshell/kshell.c:322
                lCurrKeyCount=strlen(lCommand);
                cursorMoveTo(4+lCurrKeyCount,lTemp);
                goto getAKey;*/
            }
            else
                goto getAKey;
 31006a8:	eb c3                	jmp    310066d <kShell+0xc0>
/home/yogi/src/os/kshell/kshell.c:324
        }
        if (lCurrKey==0xD0)  //down
 31006aa:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31006b1:	3c d0                	cmp    al,0xd0
 31006b3:	75 0a                	jne    31006bf <kShell+0x112>
/home/yogi/src/os/kshell/kshell.c:326
        {
            if (commandBuffPtr<=commandsPtr)
 31006b5:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
 31006b8:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
 31006bb:	7e 02                	jle    31006bf <kShell+0x112>
/home/yogi/src/os/kshell/kshell.c:339
                lCurrKeyCount=strlen(lCommand);
                cursorMoveTo(4+lCurrKeyCount,lTemp);
                goto getAKey;*/
            }
            else
                goto getAKey;
 31006bd:	eb ae                	jmp    310066d <kShell+0xc0>
/home/yogi/src/os/kshell/kshell.c:342
            
        }   
        if (lCurrKey==0xcb) //left
 31006bf:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31006c6:	3c cb                	cmp    al,0xcb
 31006c8:	75 02                	jne    31006cc <kShell+0x11f>
/home/yogi/src/os/kshell/kshell.c:351
            {
                cursorMoveTo(cursorGetPosX()-1,cursorGetPosY());
                lCurrKeyCount--;
            }
             */
            goto getAKey;
 31006ca:	eb a1                	jmp    310066d <kShell+0xc0>
/home/yogi/src/os/kshell/kshell.c:353
        }
        if (lCurrKey=='\b')
 31006cc:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31006d3:	3c 08                	cmp    al,0x8
 31006d5:	75 15                	jne    31006ec <kShell+0x13f>
/home/yogi/src/os/kshell/kshell.c:355
        {
            if (lCurrKeyCount>0)
 31006d7:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
 31006db:	7e 90                	jle    310066d <kShell+0xc0>
/home/yogi/src/os/kshell/kshell.c:357
            {
                putc('\b');
 31006dd:	83 ec 0c             	sub    esp,0xc
 31006e0:	6a 08                	push   0x8
 31006e2:	e8 29 01 00 00       	call   3100810 <kShell+0x263>
 31006e7:	83 c4 10             	add    esp,0x10
 31006ea:	eb 81                	jmp    310066d <kShell+0xc0>
/home/yogi/src/os/kshell/kshell.c:369
                cursorMoveTo(cursorGetPosX()-1,lTemp);*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
 31006ec:	0f b6 85 e3 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11d]
 31006f3:	3c 0a                	cmp    al,0xa
 31006f5:	74 1c                	je     3100713 <kShell+0x166>
/home/yogi/src/os/kshell/kshell.c:375
        {
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
 31006f7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
 31006fa:	8d 50 01             	lea    edx,[eax+0x1]
 31006fd:	89 55 f4             	mov    DWORD PTR [ebp-0xc],edx
 3100700:	0f b6 95 e3 fe ff ff 	movzx  edx,BYTE PTR [ebp-0x11d]
 3100707:	88 94 05 e4 fe ff ff 	mov    BYTE PTR [ebp+eax*1-0x11c],dl
/home/yogi/src/os/kshell/kshell.c:377
        }
        goto getAKey;
 310070e:	e9 5a ff ff ff       	jmp    310066d <kShell+0xc0>
/home/yogi/src/os/kshell/kshell.c:371
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
        {
            goto doneGettingKeys;
 3100713:	90                   	nop
/home/yogi/src/os/kshell/kshell.c:380
            lCommand[lCurrKeyCount++]=lCurrKey;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
 3100714:	0f b6 85 e4 fe ff ff 	movzx  eax,BYTE PTR [ebp-0x11c]
 310071b:	84 c0                	test   al,al
 310071d:	75 05                	jne    3100724 <kShell+0x177>
/home/yogi/src/os/kshell/kshell.c:381
            goto getACommand;
 310071f:	e9 0d ff ff ff       	jmp    3100631 <kShell+0x84>
/home/yogi/src/os/kshell/kshell.c:382
        int i = findCommand(lCommand);
 3100724:	83 ec 0c             	sub    esp,0xc
 3100727:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 310072d:	50                   	push   eax
 310072e:	e8 21 fa ff ff       	call   3100154 <findCommand>
 3100733:	83 c4 10             	add    esp,0x10
 3100736:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
/home/yogi/src/os/kshell/kshell.c:384

        execInternalCommand(lCommand);
 3100739:	83 ec 0c             	sub    esp,0xc
 310073c:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 3100742:	50                   	push   eax
 3100743:	e8 5b fd ff ff       	call   31004a3 <execInternalCommand>
 3100748:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:385
        if(i>0)
 310074b:	83 7d e4 00          	cmp    DWORD PTR [ebp-0x1c],0x0
 310074f:	0f 8e dc fe ff ff    	jle    3100631 <kShell+0x84>
/home/yogi/src/os/kshell/kshell.c:387
        {
            i--;
 3100755:	83 6d e4 01          	sub    DWORD PTR [ebp-0x1c],0x1
/home/yogi/src/os/kshell/kshell.c:396
//                for (int cnt=commandWasFromThisBufferPtr;cnt<=commandsPtr;cnt++)
//                    strcpy(commands[cnt],commands[cnt+1]);
//                commandWasFromThisBufferPtr=0;
//                commandsPtr--;
            }
            strcpy(commands[commandsPtr++],lCommand);
 3100759:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 310075c:	8d 50 01             	lea    edx,[eax+0x1]
 310075f:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
 3100762:	8d 95 1f f5 ff ff    	lea    edx,[ebp-0xae1]
 3100768:	6b c0 32             	imul   eax,eax,0x32
 310076b:	01 c2                	add    edx,eax
 310076d:	83 ec 08             	sub    esp,0x8
 3100770:	8d 85 e4 fe ff ff    	lea    eax,[ebp-0x11c]
 3100776:	50                   	push   eax
 3100777:	52                   	push   edx
 3100778:	e8 23 00 00 00       	call   31007a0 <kShell+0x1f3>
 310077d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/kshell/kshell.c:397
            commandBuffPtr=commandsPtr;
 3100780:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
 3100783:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/kshell/kshell.c:399
        }
    }
 3100786:	e9 a6 fe ff ff       	jmp    3100631 <kShell+0x84>

Disassembly of section .plt:

03100790 <.plt>:
 3100790:	ff 35 34 0d 10 03    	push   DWORD PTR ds:0x3100d34
 3100796:	ff 25 38 0d 10 03    	jmp    DWORD PTR ds:0x3100d38
 310079c:	00 00                	add    BYTE PTR [eax],al
 310079e:	00 00                	add    BYTE PTR [eax],al
 31007a0:	ff 25 3c 0d 10 03    	jmp    DWORD PTR ds:0x3100d3c
 31007a6:	68 00 00 00 00       	push   0x0
 31007ab:	e9 e0 ff ff ff       	jmp    3100790 <kShell+0x1e3>
 31007b0:	ff 25 40 0d 10 03    	jmp    DWORD PTR ds:0x3100d40
 31007b6:	68 08 00 00 00       	push   0x8
 31007bb:	e9 d0 ff ff ff       	jmp    3100790 <kShell+0x1e3>
 31007c0:	ff 25 44 0d 10 03    	jmp    DWORD PTR ds:0x3100d44
 31007c6:	68 10 00 00 00       	push   0x10
 31007cb:	e9 c0 ff ff ff       	jmp    3100790 <kShell+0x1e3>
 31007d0:	ff 25 48 0d 10 03    	jmp    DWORD PTR ds:0x3100d48
 31007d6:	68 18 00 00 00       	push   0x18
 31007db:	e9 b0 ff ff ff       	jmp    3100790 <kShell+0x1e3>
 31007e0:	ff 25 4c 0d 10 03    	jmp    DWORD PTR ds:0x3100d4c
 31007e6:	68 20 00 00 00       	push   0x20
 31007eb:	e9 a0 ff ff ff       	jmp    3100790 <kShell+0x1e3>
 31007f0:	ff 25 50 0d 10 03    	jmp    DWORD PTR ds:0x3100d50
 31007f6:	68 28 00 00 00       	push   0x28
 31007fb:	e9 90 ff ff ff       	jmp    3100790 <kShell+0x1e3>
 3100800:	ff 25 54 0d 10 03    	jmp    DWORD PTR ds:0x3100d54
 3100806:	68 30 00 00 00       	push   0x30
 310080b:	e9 80 ff ff ff       	jmp    3100790 <kShell+0x1e3>
 3100810:	ff 25 58 0d 10 03    	jmp    DWORD PTR ds:0x3100d58
 3100816:	68 38 00 00 00       	push   0x38
 310081b:	e9 70 ff ff ff       	jmp    3100790 <kShell+0x1e3>
 3100820:	ff 25 5c 0d 10 03    	jmp    DWORD PTR ds:0x3100d5c
 3100826:	68 40 00 00 00       	push   0x40
 310082b:	e9 60 ff ff ff       	jmp    3100790 <kShell+0x1e3>
 3100830:	ff 25 60 0d 10 03    	jmp    DWORD PTR ds:0x3100d60
 3100836:	68 48 00 00 00       	push   0x48
 310083b:	e9 50 ff ff ff       	jmp    3100790 <kShell+0x1e3>

Disassembly of section .rodata:

03100840 <.rodata>:
 3100840:	68 65 6c 70 00       	push   0x706c65
 3100845:	47                   	inc    edi
 3100846:	65                   	gs
 3100847:	74 20                	je     3100869 <kShell+0x2bc>
 3100849:	68 65 6c 70 20       	push   0x20706c65
 310084e:	28 74 68 69          	sub    BYTE PTR [eax+ebp*2+0x69],dh
 3100852:	73 20                	jae    3100874 <kShell+0x2c7>
 3100854:	69 6e 66 6f 72 6d 61 	imul   ebp,DWORD PTR [esi+0x66],0x616d726f
 310085b:	74 69                	je     31008c6 <kShell+0x319>
 310085d:	6f                   	outs   dx,DWORD PTR ds:[esi]
 310085e:	6e                   	outs   dx,BYTE PTR ds:[esi]
 310085f:	29 00                	sub    DWORD PTR [eax],eax
 3100861:	65                   	gs
 3100862:	78 65                	js     31008c9 <kShell+0x31c>
 3100864:	63 00                	arpl   WORD PTR [eax],ax
 3100866:	45                   	inc    ebp
 3100867:	78 65                	js     31008ce <kShell+0x321>
 3100869:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 310086c:	65 20 61 20          	and    BYTE PTR gs:[ecx+0x20],ah
 3100870:	70 72                	jo     31008e4 <kShell+0x337>
 3100872:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100873:	67 72 61             	addr16 jb 31008d7 <kShell+0x32a>
 3100876:	6d                   	ins    DWORD PTR es:[edi],dx
 3100877:	00 48 65             	add    BYTE PTR [eax+0x65],cl
 310087a:	6c                   	ins    BYTE PTR es:[edi],dx
 310087b:	70 3a                	jo     31008b7 <kShell+0x30a>
 310087d:	0a 00                	or     al,BYTE PTR [eax]
 310087f:	09 25 73 3a 20 25    	or     DWORD PTR ds:0x25203a73,esp
 3100885:	73 0a                	jae    3100891 <kShell+0x2e4>
 3100887:	00 49 6e             	add    BYTE PTR [ecx+0x6e],cl
 310088a:	76 61                	jbe    31008ed <kShell+0x340>
 310088c:	6c                   	ins    BYTE PTR es:[edi],dx
 310088d:	69 64 20 63 6f 6d 6d 	imul   esp,DWORD PTR [eax+eiz*1+0x63],0x616d6d6f
 3100894:	61 
 3100895:	6e                   	outs   dx,BYTE PTR ds:[esi]
 3100896:	64 20 27             	and    BYTE PTR fs:[edi],ah
 3100899:	25 73 27 20 79       	and    eax,0x79202773
 310089e:	61                   	popa   
 310089f:	20 64 75 6d          	and    BYTE PTR [ebp+esi*2+0x6d],ah
 31008a3:	6d                   	ins    DWORD PTR es:[edi],dx
 31008a4:	79 21                	jns    31008c7 <kShell+0x31a>
 31008a6:	0a 00                	or     al,BYTE PTR [eax]
 31008a8:	45                   	inc    ebp
 31008a9:	78 65                	js     3100910 <kShell+0x363>
 31008ab:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
 31008ae:	69 6e 67 20 25 73 0a 	imul   ebp,DWORD PTR [esi+0x67],0xa732520
 31008b5:	00 6b 53             	add    BYTE PTR [ebx+0x53],ch
 31008b8:	68 65 6c 6c 00       	push   0x6c6c65
 31008bd:	00 00                	add    BYTE PTR [eax],al
 31008bf:	00 0a                	add    BYTE PTR [edx],cl
 31008c1:	57                   	push   edi
 31008c2:	65                   	gs
 31008c3:	6c                   	ins    BYTE PTR es:[edi],dx
 31008c4:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 31008c7:	65 20 74 6f 20       	and    BYTE PTR gs:[edi+ebp*2+0x20],dh
 31008cc:	6b 53 68 65          	imul   edx,DWORD PTR [ebx+0x68],0x65
 31008d0:	6c                   	ins    BYTE PTR es:[edi],dx
 31008d1:	6c                   	ins    BYTE PTR es:[edi],dx
 31008d2:	20 2e                	and    BYTE PTR [esi],ch
 31008d4:	2e 2e 20 68 61       	cs and BYTE PTR cs:[eax+0x61],ch
 31008d9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31008da:	67 20 61 20          	and    BYTE PTR [bx+di+0x20],ah
 31008de:	77 68                	ja     3100948 <kShell+0x39b>
 31008e0:	69 6c 65 21 0a 00 25 	imul   ebp,DWORD PTR [ebp+eiz*2+0x21],0x7325000a
 31008e7:	73 
 31008e8:	3e 20 00             	and    BYTE PTR ds:[eax],al

Disassembly of section .eh_frame:

031008ec <.eh_frame>:
 31008ec:	14 00                	adc    al,0x0
 31008ee:	00 00                	add    BYTE PTR [eax],al
 31008f0:	00 00                	add    BYTE PTR [eax],al
 31008f2:	00 00                	add    BYTE PTR [eax],al
 31008f4:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 31008f7:	00 01                	add    BYTE PTR [ecx],al
 31008f9:	7c 08                	jl     3100903 <kShell+0x356>
 31008fb:	01 1b                	add    DWORD PTR [ebx],ebx
 31008fd:	0c 04                	or     al,0x4
 31008ff:	04 88                	add    al,0x88
 3100901:	01 00                	add    DWORD PTR [eax],eax
 3100903:	00 1c 00             	add    BYTE PTR [eax+eax*1],bl
 3100906:	00 00                	add    BYTE PTR [eax],al
 3100908:	1c 00                	sbb    al,0x0
 310090a:	00 00                	add    BYTE PTR [eax],al
 310090c:	f4                   	hlt    
 310090d:	f6 ff                	idiv   bh
 310090f:	ff 0a                	dec    DWORD PTR [edx]
 3100911:	00 00                	add    BYTE PTR [eax],al
 3100913:	00 00                	add    BYTE PTR [eax],al
 3100915:	41                   	inc    ecx
 3100916:	0e                   	push   cs
 3100917:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310091d:	46                   	inc    esi
 310091e:	c5 0c 04             	lds    ecx,FWORD PTR [esp+eax*1]
 3100921:	04 00                	add    al,0x0
 3100923:	00 20                	add    BYTE PTR [eax],ah
 3100925:	00 00                	add    BYTE PTR [eax],al
 3100927:	00 3c 00             	add    BYTE PTR [eax+eax*1],bh
 310092a:	00 00                	add    BYTE PTR [eax],al
 310092c:	de f6                	fdivrp st(6),st
 310092e:	ff                   	(bad)  
 310092f:	ff 4a 01             	dec    DWORD PTR [edx+0x1]
 3100932:	00 00                	add    BYTE PTR [eax],al
 3100934:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 3100937:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 310093d:	44                   	inc    esp
 310093e:	83 03 03             	add    DWORD PTR [ebx],0x3
 3100941:	42                   	inc    edx
 3100942:	01 c5                	add    ebp,eax
 3100944:	c3                   	ret    
 3100945:	0c 04                	or     al,0x4
 3100947:	04 1c                	add    al,0x1c
 3100949:	00 00                	add    BYTE PTR [eax],al
 310094b:	00 60 00             	add    BYTE PTR [eax+0x0],ah
 310094e:	00 00                	add    BYTE PTR [eax],al
 3100950:	04 f8                	add    al,0xf8
 3100952:	ff                   	(bad)  
 3100953:	ff 69 00             	jmp    FWORD PTR [ecx+0x0]
 3100956:	00 00                	add    BYTE PTR [eax],al
 3100958:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 310095b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100961:	02 65 c5             	add    ah,BYTE PTR [ebp-0x3b]
 3100964:	0c 04                	or     al,0x4
 3100966:	04 00                	add    al,0x0
 3100968:	1c 00                	sbb    al,0x0
 310096a:	00 00                	add    BYTE PTR [eax],al
 310096c:	80 00 00             	add    BYTE PTR [eax],0x0
 310096f:	00 4d f8             	add    BYTE PTR [ebp-0x8],cl
 3100972:	ff                   	(bad)  
 3100973:	ff 8e 02 00 00 00    	dec    DWORD PTR [esi+0x2]
 3100979:	41                   	inc    ecx
 310097a:	0e                   	push   cs
 310097b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100981:	03 8a 02 c5 0c 04    	add    ecx,DWORD PTR [edx+0x40cc502]
 3100987:	04 1c                	add    al,0x1c
 3100989:	00 00                	add    BYTE PTR [eax],al
 310098b:	00 a0 00 00 00 bb    	add    BYTE PTR [eax-0x45000000],ah
 3100991:	fa                   	cli    
 3100992:	ff                   	(bad)  
 3100993:	ff 58 00             	call   FWORD PTR [eax+0x0]
 3100996:	00 00                	add    BYTE PTR [eax],al
 3100998:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 310099b:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31009a1:	02 54 c5 0c          	add    dl,BYTE PTR [ebp+eax*8+0xc]
 31009a5:	04 04                	add    al,0x4
 31009a7:	00 20                	add    BYTE PTR [eax],ah
 31009a9:	00 00                	add    BYTE PTR [eax],al
 31009ab:	00 c0                	add    al,al
 31009ad:	00 00                	add    BYTE PTR [eax],al
 31009af:	00 f3                	add    bl,dh
 31009b1:	fa                   	cli    
 31009b2:	ff                   	(bad)  
 31009b3:	ff ab 00 00 00 00    	jmp    FWORD PTR [ebx+0x0]
 31009b9:	41                   	inc    ecx
 31009ba:	0e                   	push   cs
 31009bb:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31009c1:	44                   	inc    esp
 31009c2:	83 03 02             	add    DWORD PTR [ebx],0x2
 31009c5:	a3 c5 c3 0c 04       	mov    ds:0x40cc3c5,eax
 31009ca:	04 00                	add    al,0x0
 31009cc:	20 00                	and    BYTE PTR [eax],al
 31009ce:	00 00                	add    BYTE PTR [eax],al
 31009d0:	e4 00                	in     al,0x0
 31009d2:	00 00                	add    BYTE PTR [eax],al
 31009d4:	7a fb                	jp     31009d1 <kShell+0x424>
 31009d6:	ff                   	(bad)  
 31009d7:	ff 5f 00             	call   FWORD PTR [edi+0x0]
 31009da:	00 00                	add    BYTE PTR [eax],al
 31009dc:	00 41 0e             	add    BYTE PTR [ecx+0xe],al
 31009df:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 31009e5:	47                   	inc    edi
 31009e6:	83 03 02             	add    DWORD PTR [ebx],0x2
 31009e9:	54                   	push   esp
 31009ea:	c5 c3 0c             	(bad)  
 31009ed:	04 04                	add    al,0x4
 31009ef:	00 18                	add    BYTE PTR [eax],bl
 31009f1:	00 00                	add    BYTE PTR [eax],al
 31009f3:	00 08                	add    BYTE PTR [eax],cl
 31009f5:	01 00                	add    DWORD PTR [eax],eax
 31009f7:	00 b5 fb ff ff de    	add    BYTE PTR [ebp-0x21000005],dh
 31009fd:	01 00                	add    DWORD PTR [eax],eax
 31009ff:	00 00                	add    BYTE PTR [eax],al
 3100a01:	41                   	inc    ecx
 3100a02:	0e                   	push   cs
 3100a03:	08 85 02 42 0d 05    	or     BYTE PTR [ebp+0x50d4202],al
 3100a09:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .interp:

03100a0c <.interp>:
 3100a0c:	2f                   	das    
 3100a0d:	6c                   	ins    BYTE PTR es:[edi],dx
 3100a0e:	69 62 2f 6c 64 2d 6c 	imul   esp,DWORD PTR [edx+0x2f],0x6c2d646c
 3100a15:	69 6e 75 78 2e 73 6f 	imul   ebp,DWORD PTR [esi+0x75],0x6f732e78
 3100a1c:	2e 32 00             	xor    al,BYTE PTR cs:[eax]

Disassembly of section .dynsym:

03100a20 <.dynsym>:
	...
 3100a30:	09 00                	or     DWORD PTR [eax],eax
	...
 3100a3a:	00 00                	add    BYTE PTR [eax],al
 3100a3c:	12 00                	adc    al,BYTE PTR [eax]
 3100a3e:	00 00                	add    BYTE PTR [eax],al
 3100a40:	10 00                	adc    BYTE PTR [eax],al
	...
 3100a4a:	00 00                	add    BYTE PTR [eax],al
 3100a4c:	12 00                	adc    al,BYTE PTR [eax]
 3100a4e:	00 00                	add    BYTE PTR [eax],al
 3100a50:	16                   	push   ss
	...
 3100a59:	00 00                	add    BYTE PTR [eax],al
 3100a5b:	00 12                	add    BYTE PTR [edx],dl
 3100a5d:	00 00                	add    BYTE PTR [eax],al
 3100a5f:	00 1b                	add    BYTE PTR [ebx],bl
	...
 3100a69:	00 00                	add    BYTE PTR [eax],al
 3100a6b:	00 12                	add    BYTE PTR [edx],dl
 3100a6d:	00 00                	add    BYTE PTR [eax],al
 3100a6f:	00 20                	add    BYTE PTR [eax],ah
	...
 3100a79:	00 00                	add    BYTE PTR [eax],al
 3100a7b:	00 12                	add    BYTE PTR [edx],dl
 3100a7d:	00 00                	add    BYTE PTR [eax],al
 3100a7f:	00 27                	add    BYTE PTR [edi],ah
	...
 3100a89:	00 00                	add    BYTE PTR [eax],al
 3100a8b:	00 12                	add    BYTE PTR [edx],dl
 3100a8d:	00 00                	add    BYTE PTR [eax],al
 3100a8f:	00 2f                	add    BYTE PTR [edi],ch
	...
 3100a99:	00 00                	add    BYTE PTR [eax],al
 3100a9b:	00 12                	add    BYTE PTR [edx],dl
 3100a9d:	00 00                	add    BYTE PTR [eax],al
 3100a9f:	00 36                	add    BYTE PTR [esi],dh
	...
 3100aa9:	00 00                	add    BYTE PTR [eax],al
 3100aab:	00 12                	add    BYTE PTR [edx],dl
 3100aad:	00 00                	add    BYTE PTR [eax],al
 3100aaf:	00 3b                	add    BYTE PTR [ebx],bh
	...
 3100ab9:	00 00                	add    BYTE PTR [eax],al
 3100abb:	00 12                	add    BYTE PTR [edx],dl
 3100abd:	00 00                	add    BYTE PTR [eax],al
 3100abf:	00 42 00             	add    BYTE PTR [edx+0x0],al
	...
 3100aca:	00 00                	add    BYTE PTR [eax],al
 3100acc:	12 00                	adc    al,BYTE PTR [eax]
	...

Disassembly of section .dynstr:

03100ad0 <.dynstr>:
 3100ad0:	00 6c 69 62          	add    BYTE PTR [ecx+ebp*2+0x62],ch
 3100ad4:	63 2e                	arpl   WORD PTR [esi],bp
 3100ad6:	73 6f                	jae    3100b47 <kShell+0x59a>
 3100ad8:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3100adb:	72 63                	jb     3100b40 <kShell+0x593>
 3100add:	70 79                	jo     3100b58 <kShell+0x5ab>
 3100adf:	00 70 72             	add    BYTE PTR [eax+0x72],dh
 3100ae2:	69 6e 74 00 67 65 74 	imul   ebp,DWORD PTR [esi+0x74],0x74656700
 3100ae9:	73 00                	jae    3100aeb <kShell+0x53e>
 3100aeb:	70 75                	jo     3100b62 <kShell+0x5b5>
 3100aed:	74 73                	je     3100b62 <kShell+0x5b5>
 3100aef:	00 6d 61             	add    BYTE PTR [ebp+0x61],ch
 3100af2:	6c                   	ins    BYTE PTR es:[edi],dx
 3100af3:	6c                   	ins    BYTE PTR es:[edi],dx
 3100af4:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100af5:	63 00                	arpl   WORD PTR [eax],ax
 3100af7:	73 74                	jae    3100b6d <kShell+0x5c0>
 3100af9:	72 6e                	jb     3100b69 <kShell+0x5bc>
 3100afb:	63 6d 70             	arpl   WORD PTR [ebp+0x70],bp
 3100afe:	00 6d 65             	add    BYTE PTR [ebp+0x65],ch
 3100b01:	6d                   	ins    DWORD PTR es:[edi],dx
 3100b02:	73 65                	jae    3100b69 <kShell+0x5bc>
 3100b04:	74 00                	je     3100b06 <kShell+0x559>
 3100b06:	70 75                	jo     3100b7d <kShell+0x5d0>
 3100b08:	74 63                	je     3100b6d <kShell+0x5c0>
 3100b0a:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 3100b0d:	72 6c                	jb     3100b7b <kShell+0x5ce>
 3100b0f:	65 6e                	outs   dx,BYTE PTR gs:[esi]
 3100b11:	00 66 72             	add    BYTE PTR [esi+0x72],ah
 3100b14:	65 65 00 2f          	gs add BYTE PTR gs:[edi],ch
 3100b18:	68 6f 6d 65 2f       	push   0x2f656d6f
 3100b1d:	79 6f                	jns    3100b8e <kShell+0x5e1>
 3100b1f:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 3100b26:	6f                   	outs   dx,DWORD PTR ds:[esi]
 3100b27:	73 2f                	jae    3100b58 <kShell+0x5ab>
 3100b29:	6c                   	ins    BYTE PTR es:[edi],dx
 3100b2a:	69 62 43 68 72 69 73 	imul   esp,DWORD PTR [edx+0x43],0x73697268
 3100b31:	4f                   	dec    edi
 3100b32:	53                   	push   ebx
 3100b33:	2f                   	das    
 3100b34:	64 69 73 74 2f 44 65 	imul   esi,DWORD PTR fs:[ebx+0x74],0x6265442f
 3100b3b:	62 
 3100b3c:	75 67                	jne    3100ba5 <kShell+0x5f8>
 3100b3e:	2f                   	das    
 3100b3f:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
 3100b42:	73 73                	jae    3100bb7 <kShell+0x60a>
 3100b44:	2d 4c 69 6e 75       	sub    eax,0x756e694c
 3100b49:	78 00                	js     3100b4b <kShell+0x59e>

Disassembly of section .hash:

03100b4c <.hash>:
 3100b4c:	03 00                	add    eax,DWORD PTR [eax]
 3100b4e:	00 00                	add    BYTE PTR [eax],al
 3100b50:	0b 00                	or     eax,DWORD PTR [eax]
 3100b52:	00 00                	add    BYTE PTR [eax],al
 3100b54:	08 00                	or     BYTE PTR [eax],al
 3100b56:	00 00                	add    BYTE PTR [eax],al
 3100b58:	0a 00                	or     al,BYTE PTR [eax]
 3100b5a:	00 00                	add    BYTE PTR [eax],al
 3100b5c:	06                   	push   es
	...
 3100b65:	00 00                	add    BYTE PTR [eax],al
 3100b67:	00 01                	add    BYTE PTR [ecx],al
	...
 3100b71:	00 00                	add    BYTE PTR [eax],al
 3100b73:	00 02                	add    BYTE PTR [edx],al
 3100b75:	00 00                	add    BYTE PTR [eax],al
 3100b77:	00 05 00 00 00 03    	add    BYTE PTR ds:0x3000000,al
 3100b7d:	00 00                	add    BYTE PTR [eax],al
 3100b7f:	00 07                	add    BYTE PTR [edi],al
 3100b81:	00 00                	add    BYTE PTR [eax],al
 3100b83:	00 04 00             	add    BYTE PTR [eax+eax*1],al
 3100b86:	00 00                	add    BYTE PTR [eax],al
 3100b88:	09 00                	or     DWORD PTR [eax],eax
	...

Disassembly of section .eh_frame:

03100b8c <.eh_frame>:
 3100b8c:	14 00                	adc    al,0x0
 3100b8e:	00 00                	add    BYTE PTR [eax],al
 3100b90:	00 00                	add    BYTE PTR [eax],al
 3100b92:	00 00                	add    BYTE PTR [eax],al
 3100b94:	01 7a 52             	add    DWORD PTR [edx+0x52],edi
 3100b97:	00 01                	add    BYTE PTR [ecx],al
 3100b99:	7c 08                	jl     3100ba3 <kShell+0x5f6>
 3100b9b:	01 1b                	add    DWORD PTR [ebx],ebx
 3100b9d:	0c 04                	or     al,0x4
 3100b9f:	04 88                	add    al,0x88
 3100ba1:	01 00                	add    DWORD PTR [eax],eax
 3100ba3:	00 24 00             	add    BYTE PTR [eax+eax*1],ah
 3100ba6:	00 00                	add    BYTE PTR [eax],al
 3100ba8:	1c 00                	sbb    al,0x0
 3100baa:	00 00                	add    BYTE PTR [eax],al
 3100bac:	e4 fb                	in     al,0xfb
 3100bae:	ff                   	(bad)  
 3100baf:	ff b0 00 00 00 00    	push   DWORD PTR [eax+0x0]
 3100bb5:	0e                   	push   cs
 3100bb6:	08 46 0e             	or     BYTE PTR [esi+0xe],al
 3100bb9:	0c 4a                	or     al,0x4a
 3100bbb:	0f 0b                	ud2    
 3100bbd:	74 04                	je     3100bc3 <kShell+0x616>
 3100bbf:	78 00                	js     3100bc1 <kShell+0x614>
 3100bc1:	3f                   	aas    
 3100bc2:	1a 3b                	sbb    bh,BYTE PTR [ebx]
 3100bc4:	2a 32                	sub    dh,BYTE PTR [edx]
 3100bc6:	24 22                	and    al,0x22
 3100bc8:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .eh_frame_hdr:

03100bcc <__GNU_EH_FRAME_HDR>:
__GNU_EH_FRAME_HDR():
 3100bcc:	01 1b                	add    DWORD PTR [ebx],ebx
 3100bce:	03 3b                	add    edi,DWORD PTR [ebx]
 3100bd0:	1c fd                	sbb    al,0xfd
 3100bd2:	ff                   	(bad)  
 3100bd3:	ff 08                	dec    DWORD PTR [eax]
 3100bd5:	00 00                	add    BYTE PTR [eax],al
 3100bd7:	00 34 f4             	add    BYTE PTR [esp+esi*8],dh
 3100bda:	ff                   	(bad)  
 3100bdb:	ff                   	(bad)  
 3100bdc:	38 fd                	cmp    ch,bh
 3100bde:	ff                   	(bad)  
 3100bdf:	ff                   	(bad)  
 3100be0:	3e                   	ds
 3100be1:	f4                   	hlt    
 3100be2:	ff                   	(bad)  
 3100be3:	ff 58 fd             	call   FWORD PTR [eax-0x3]
 3100be6:	ff                   	(bad)  
 3100be7:	ff 88 f5 ff ff 7c    	dec    DWORD PTR [eax+0x7cfffff5]
 3100bed:	fd                   	std    
 3100bee:	ff                   	(bad)  
 3100bef:	ff f1                	push   ecx
 3100bf1:	f5                   	cmc    
 3100bf2:	ff                   	(bad)  
 3100bf3:	ff 9c fd ff ff 7f f8 	call   FWORD PTR [ebp+edi*8-0x7800001]
 3100bfa:	ff                   	(bad)  
 3100bfb:	ff                   	(bad)  
 3100bfc:	bc fd ff ff d7       	mov    esp,0xd7fffffd
 3100c01:	f8                   	clc    
 3100c02:	ff                   	(bad)  
 3100c03:	ff dc                	call   <internal disassembler error>
 3100c05:	fd                   	std    
 3100c06:	ff                   	(bad)  
 3100c07:	ff 82 f9 ff ff 00    	inc    DWORD PTR [edx+0xfffff9]
 3100c0d:	fe                   	(bad)  
 3100c0e:	ff                   	(bad)  
 3100c0f:	ff e1                	jmp    ecx
 3100c11:	f9                   	stc    
 3100c12:	ff                   	(bad)  
 3100c13:	ff 24 fe             	jmp    DWORD PTR [esi+edi*8]
 3100c16:	ff                   	(bad)  
 3100c17:	ff                   	.byte 0xff

Disassembly of section .rel.dyn:

03100c18 <.rel.dyn>:
 3100c18:	3c 0d                	cmp    al,0xd
 3100c1a:	10 03                	adc    BYTE PTR [ebx],al
 3100c1c:	07                   	pop    es
 3100c1d:	01 00                	add    DWORD PTR [eax],eax
 3100c1f:	00 40 0d             	add    BYTE PTR [eax+0xd],al
 3100c22:	10 03                	adc    BYTE PTR [ebx],al
 3100c24:	07                   	pop    es
 3100c25:	02 00                	add    al,BYTE PTR [eax]
 3100c27:	00 44 0d 10          	add    BYTE PTR [ebp+ecx*1+0x10],al
 3100c2b:	03 07                	add    eax,DWORD PTR [edi]
 3100c2d:	03 00                	add    eax,DWORD PTR [eax]
 3100c2f:	00 48 0d             	add    BYTE PTR [eax+0xd],cl
 3100c32:	10 03                	adc    BYTE PTR [ebx],al
 3100c34:	07                   	pop    es
 3100c35:	04 00                	add    al,0x0
 3100c37:	00 4c 0d 10          	add    BYTE PTR [ebp+ecx*1+0x10],cl
 3100c3b:	03 07                	add    eax,DWORD PTR [edi]
 3100c3d:	05 00 00 50 0d       	add    eax,0xd500000
 3100c42:	10 03                	adc    BYTE PTR [ebx],al
 3100c44:	07                   	pop    es
 3100c45:	06                   	push   es
 3100c46:	00 00                	add    BYTE PTR [eax],al
 3100c48:	54                   	push   esp
 3100c49:	0d 10 03 07 07       	or     eax,0x7070310
 3100c4e:	00 00                	add    BYTE PTR [eax],al
 3100c50:	58                   	pop    eax
 3100c51:	0d 10 03 07 08       	or     eax,0x8070310
 3100c56:	00 00                	add    BYTE PTR [eax],al
 3100c58:	5c                   	pop    esp
 3100c59:	0d 10 03 07 09       	or     eax,0x9070310
 3100c5e:	00 00                	add    BYTE PTR [eax],al
 3100c60:	60                   	pusha  
 3100c61:	0d 10 03 07 0a       	or     eax,0xa070310
	...

Disassembly of section .data:

03100c80 <cmds>:
 3100c80:	40                   	inc    eax
 3100c81:	08 10                	or     BYTE PTR [eax],dl
 3100c83:	03 45 08             	add    eax,DWORD PTR [ebp+0x8]
 3100c86:	10 03                	adc    BYTE PTR [ebx],al
 3100c88:	4b                   	dec    ebx
 3100c89:	04 10                	add    al,0x10
 3100c8b:	03 00                	add    eax,DWORD PTR [eax]
 3100c8d:	00 00                	add    BYTE PTR [eax],al
 3100c8f:	00 61 08             	add    BYTE PTR [ecx+0x8],ah
 3100c92:	10 03                	adc    BYTE PTR [ebx],al
 3100c94:	66                   	data16
 3100c95:	08 10                	or     BYTE PTR [eax],dl
 3100c97:	03 4e 05             	add    ecx,DWORD PTR [esi+0x5]
 3100c9a:	10 03                	adc    BYTE PTR [ebx],al
 3100c9c:	01 00                	add    DWORD PTR [eax],eax
	...

Disassembly of section .dynamic:

03100ca0 <_DYNAMIC>:
 3100ca0:	01 00                	add    DWORD PTR [eax],eax
 3100ca2:	00 00                	add    BYTE PTR [eax],al
 3100ca4:	01 00                	add    DWORD PTR [eax],eax
 3100ca6:	00 00                	add    BYTE PTR [eax],al
 3100ca8:	0f 00 00             	sldt   WORD PTR [eax]
 3100cab:	00 47 00             	add    BYTE PTR [edi+0x0],al
 3100cae:	00 00                	add    BYTE PTR [eax],al
 3100cb0:	04 00                	add    al,0x0
 3100cb2:	00 00                	add    BYTE PTR [eax],al
 3100cb4:	4c                   	dec    esp
 3100cb5:	0b 10                	or     edx,DWORD PTR [eax]
 3100cb7:	03 05 00 00 00 d0    	add    eax,DWORD PTR ds:0xd0000000
 3100cbd:	0a 10                	or     dl,BYTE PTR [eax]
 3100cbf:	03 06                	add    eax,DWORD PTR [esi]
 3100cc1:	00 00                	add    BYTE PTR [eax],al
 3100cc3:	00 20                	add    BYTE PTR [eax],ah
 3100cc5:	0a 10                	or     dl,BYTE PTR [eax]
 3100cc7:	03 0a                	add    ecx,DWORD PTR [edx]
 3100cc9:	00 00                	add    BYTE PTR [eax],al
 3100ccb:	00 7b 00             	add    BYTE PTR [ebx+0x0],bh
 3100cce:	00 00                	add    BYTE PTR [eax],al
 3100cd0:	0b 00                	or     eax,DWORD PTR [eax]
 3100cd2:	00 00                	add    BYTE PTR [eax],al
 3100cd4:	10 00                	adc    BYTE PTR [eax],al
 3100cd6:	00 00                	add    BYTE PTR [eax],al
 3100cd8:	15 00 00 00 00       	adc    eax,0x0
 3100cdd:	00 00                	add    BYTE PTR [eax],al
 3100cdf:	00 03                	add    BYTE PTR [ebx],al
 3100ce1:	00 00                	add    BYTE PTR [eax],al
 3100ce3:	00 30                	add    BYTE PTR [eax],dh
 3100ce5:	0d 10 03 02 00       	or     eax,0x20310
 3100cea:	00 00                	add    BYTE PTR [eax],al
 3100cec:	50                   	push   eax
 3100ced:	00 00                	add    BYTE PTR [eax],al
 3100cef:	00 14 00             	add    BYTE PTR [eax+eax*1],dl
 3100cf2:	00 00                	add    BYTE PTR [eax],al
 3100cf4:	11 00                	adc    DWORD PTR [eax],eax
 3100cf6:	00 00                	add    BYTE PTR [eax],al
 3100cf8:	17                   	pop    ss
 3100cf9:	00 00                	add    BYTE PTR [eax],al
 3100cfb:	00 18                	add    BYTE PTR [eax],bl
 3100cfd:	0c 10                	or     al,0x10
 3100cff:	03 00                	add    eax,DWORD PTR [eax]
	...

Disassembly of section .got.plt:

03100d30 <_GLOBAL_OFFSET_TABLE_>:
 3100d30:	a0 0c 10 03 00       	mov    al,ds:0x3100c
 3100d35:	00 00                	add    BYTE PTR [eax],al
 3100d37:	00 00                	add    BYTE PTR [eax],al
 3100d39:	00 00                	add    BYTE PTR [eax],al
 3100d3b:	00 a6 07 10 03 b6    	add    BYTE PTR [esi-0x49fceff9],ah
 3100d41:	07                   	pop    es
 3100d42:	10 03                	adc    BYTE PTR [ebx],al
 3100d44:	c6 07 10             	mov    BYTE PTR [edi],0x10
 3100d47:	03 d6                	add    edx,esi
 3100d49:	07                   	pop    es
 3100d4a:	10 03                	adc    BYTE PTR [ebx],al
 3100d4c:	e6 07                	out    0x7,al
 3100d4e:	10 03                	adc    BYTE PTR [ebx],al
 3100d50:	f6 07 10             	test   BYTE PTR [edi],0x10
 3100d53:	03 06                	add    eax,DWORD PTR [esi]
 3100d55:	08 10                	or     BYTE PTR [eax],dl
 3100d57:	03 16                	add    edx,DWORD PTR [esi]
 3100d59:	08 10                	or     BYTE PTR [eax],dl
 3100d5b:	03 26                	add    esp,DWORD PTR [esi]
 3100d5d:	08 10                	or     BYTE PTR [eax],dl
 3100d5f:	03 36                	add    esi,DWORD PTR [esi]
 3100d61:	08 10                	or     BYTE PTR [eax],dl
 3100d63:	03                   	.byte 0x3

Disassembly of section .bss:

03100d80 <sExecutingProgram>:
	...

03100f80 <command_function_p>:
 3100f80:	00 00                	add    BYTE PTR [eax],al
	...

03100f84 <cpuid_extended_feature_bits>:
 3100f84:	00 00                	add    BYTE PTR [eax],al
	...

03100f88 <heapEnd>:
 3100f88:	00 00                	add    BYTE PTR [eax],al
	...

03100f8c <heapBase>:
 3100f8c:	00 00                	add    BYTE PTR [eax],al
	...

03100f90 <heapCurr>:
 3100f90:	00 00                	add    BYTE PTR [eax],al
	...

03100f94 <command_function>:
 3100f94:	00 00                	add    BYTE PTR [eax],al
	...

03100f98 <cpuid_procinfo>:
	...

03100fa0 <sKShellProgramName>:
 3100fa0:	00 00                	add    BYTE PTR [eax],al
	...

Disassembly of section .debug_info:

00000000 <.debug_info>:
   0:	46                   	inc    esi
   1:	06                   	push   es
   2:	00 00                	add    BYTE PTR [eax],al
   4:	04 00                	add    al,0x0
   6:	00 00                	add    BYTE PTR [eax],al
   8:	00 00                	add    BYTE PTR [eax],al
   a:	04 01                	add    al,0x1
   c:	83 00 00             	add    DWORD PTR [eax],0x0
   f:	00 0c 09             	add    BYTE PTR [ecx+ecx*1],cl
  12:	02 00                	add    al,BYTE PTR [eax]
  14:	00 c7                	add    bh,al
  16:	01 00                	add    DWORD PTR [eax],eax
  18:	00 00                	add    BYTE PTR [eax],al
  1a:	00 10                	add    BYTE PTR [eax],dl
  1c:	03 8b 07 00 00 00    	add    ecx,DWORD PTR [ebx+0x7]
  22:	00 00                	add    BYTE PTR [eax],al
  24:	00 02                	add    BYTE PTR [edx],al
  26:	01 06                	add    DWORD PTR [esi],eax
  28:	50                   	push   eax
  29:	02 00                	add    al,BYTE PTR [eax]
  2b:	00 02                	add    BYTE PTR [edx],al
  2d:	01 06                	add    DWORD PTR [esi],eax
  2f:	49                   	dec    ecx
  30:	02 00                	add    al,BYTE PTR [eax]
  32:	00 02                	add    BYTE PTR [edx],al
  34:	02 05 62 02 00 00    	add    al,BYTE PTR ds:0x262
  3a:	03 04 05 69 6e 74 00 	add    eax,DWORD PTR [eax*1+0x746e69]
  41:	02 08                	add    cl,BYTE PTR [eax]
  43:	05 58 00 00 00       	add    eax,0x58
  48:	04 f7                	add    al,0xf7
  4a:	02 00                	add    al,BYTE PTR [eax]
  4c:	00 02                	add    BYTE PTR [edx],al
  4e:	2e                   	cs
  4f:	53                   	push   ebx
  50:	00 00                	add    BYTE PTR [eax],al
  52:	00 02                	add    BYTE PTR [edx],al
  54:	01 08                	add    DWORD PTR [eax],ecx
  56:	47                   	inc    edi
  57:	02 00                	add    al,BYTE PTR [eax]
  59:	00 02                	add    BYTE PTR [edx],al
  5b:	02 07                	add    al,BYTE PTR [edi]
  5d:	60                   	pusha  
  5e:	01 00                	add    DWORD PTR [eax],eax
  60:	00 04 78             	add    BYTE PTR [eax+edi*2],al
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
  84:	2e 02 00             	add    al,BYTE PTR cs:[eax]
  87:	00 02                	add    BYTE PTR [edx],al
  89:	04 07                	add    al,0x7
  8b:	34 00                	xor    al,0x0
  8d:	00 00                	add    BYTE PTR [eax],al
  8f:	05 05 03 58 10       	add    eax,0x10580305
  94:	01 00                	add    DWORD PTR [eax],eax
  96:	00 06                	add    BYTE PTR [esi],al
  98:	5d                   	pop    ebp
  99:	02 00                	add    al,BYTE PTR [eax]
  9b:	00 03                	add    BYTE PTR [ebx],al
  9d:	59                   	pop    ecx
  9e:	48                   	dec    eax
  9f:	00 00                	add    BYTE PTR [eax],al
  a1:	00 01                	add    BYTE PTR [ecx],al
  a3:	04 04                	add    al,0x4
  a5:	00 06                	add    BYTE PTR [esi],al
  a7:	91                   	xchg   ecx,eax
  a8:	02 00                	add    al,BYTE PTR [eax]
  aa:	00 03                	add    BYTE PTR [ebx],al
  ac:	5a                   	pop    edx
  ad:	48                   	dec    eax
  ae:	00 00                	add    BYTE PTR [eax],al
  b0:	00 01                	add    BYTE PTR [ecx],al
  b2:	04 00                	add    al,0x0
  b4:	00 06                	add    BYTE PTR [esi],al
  b6:	70 00                	jo     b8 <main-0x30fff48>
  b8:	00 00                	add    BYTE PTR [eax],al
  ba:	03 5b 48             	add    ebx,DWORD PTR [ebx+0x48]
  bd:	00 00                	add    BYTE PTR [eax],al
  bf:	00 01                	add    BYTE PTR [ecx],al
  c1:	04 04                	add    al,0x4
  c3:	01 06                	add    DWORD PTR [esi],eax
  c5:	a7                   	cmps   DWORD PTR ds:[esi],DWORD PTR es:[edi]
  c6:	01 00                	add    DWORD PTR [eax],eax
  c8:	00 03                	add    BYTE PTR [ebx],al
  ca:	5c                   	pop    esp
  cb:	48                   	dec    eax
  cc:	00 00                	add    BYTE PTR [eax],al
  ce:	00 01                	add    BYTE PTR [ecx],al
  d0:	02 02                	add    al,BYTE PTR [edx]
  d2:	01 06                	add    DWORD PTR [esi],eax
  d4:	cf                   	iret   
  d5:	02 00                	add    al,BYTE PTR [eax]
  d7:	00 03                	add    BYTE PTR [ebx],al
  d9:	5d                   	pop    ebp
  da:	48                   	dec    eax
  db:	00 00                	add    BYTE PTR [eax],al
  dd:	00 01                	add    BYTE PTR [ecx],al
  df:	02 00                	add    al,BYTE PTR [eax]
  e1:	01 06                	add    DWORD PTR [esi],eax
  e3:	90                   	nop
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
 101:	d4 02                	aam    0x2
 103:	00 00                	add    BYTE PTR [eax],al
 105:	03 60 48             	add    esp,DWORD PTR [eax+0x48]
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
 11e:	72 65                	jb     185 <main-0x30ffe7b>
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
 150:	1d 01 00 00 03       	sbb    eax,0x3000001
 155:	de 61 00             	fisub  WORD PTR [ecx+0x0]
 158:	00 00                	add    BYTE PTR [eax],al
 15a:	04 1e                	add    al,0x1e
 15c:	00 00                	add    BYTE PTR [eax],al
 15e:	00 07                	add    BYTE PTR [edi],al
 160:	04 03                	add    al,0x3
 162:	da 78 01             	fidivr DWORD PTR [eax+0x1]
 165:	00 00                	add    BYTE PTR [eax],al
 167:	08 29                	or     BYTE PTR [ecx],ch
 169:	01 00                	add    DWORD PTR [eax],eax
 16b:	00 09                	add    BYTE PTR [ecx],cl
 16d:	72 65                	jb     1d4 <main-0x30ffe2c>
 16f:	67 00 03             	add    BYTE PTR [bp+di],al
 172:	e0 61                	loopne 1d5 <main-0x30ffe2b>
 174:	00 00                	add    BYTE PTR [eax],al
 176:	00 00                	add    BYTE PTR [eax],al
 178:	0a 04 05 10 04 12 b3 	or     al,BYTE PTR [eax*1-0x4cedfbf0]
 17f:	01 00                	add    DWORD PTR [eax],eax
 181:	00 0b                	add    BYTE PTR [ebx],cl
 183:	56                   	push   esi
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
 1a1:	78 01                	js     1a4 <main-0x30ffe5c>
 1a3:	00 00                	add    BYTE PTR [eax],al
 1a5:	08 0b                	or     BYTE PTR [ebx],cl
 1a7:	98                   	cwde   
 1a8:	01 00                	add    DWORD PTR [eax],eax
 1aa:	00 04 17             	add    BYTE PTR [edi+edx*1],al
 1ad:	3a 00                	cmp    al,BYTE PTR [eax]
 1af:	00 00                	add    BYTE PTR [eax],al
 1b1:	0c 00                	or     al,0x0
 1b3:	0c 04                	or     al,0x4
 1b5:	25 00 00 00 04       	and    eax,0x4000000
 1ba:	0d 01 00 00 04       	or     eax,0x4000001
 1bf:	18 7a 01             	sbb    BYTE PTR [edx+0x1],bh
 1c2:	00 00                	add    BYTE PTR [eax],al
 1c4:	0d 10 03 00 00       	or     eax,0x310
 1c9:	01 13                	add    DWORD PTR [ebx],edx
 1cb:	3a 00                	cmp    al,BYTE PTR [eax]
 1cd:	00 00                	add    BYTE PTR [eax],al
 1cf:	00 00                	add    BYTE PTR [eax],al
 1d1:	10 03                	adc    BYTE PTR [ebx],al
 1d3:	0a 00                	or     al,BYTE PTR [eax]
 1d5:	00 00                	add    BYTE PTR [eax],al
 1d7:	01 9c fa 01 00 00 0e 	add    DWORD PTR [edx+edi*8+0xe000001],ebx
 1de:	a2 02 00 00 01       	mov    ds:0x1000002,al
 1e3:	13 3a                	adc    edi,DWORD PTR [edx]
 1e5:	00 00                	add    BYTE PTR [eax],al
 1e7:	00 02                	add    BYTE PTR [edx],al
 1e9:	91                   	xchg   ecx,eax
 1ea:	00 0e                	add    BYTE PTR [esi],cl
 1ec:	30 01                	xor    BYTE PTR [ecx],al
 1ee:	00 00                	add    BYTE PTR [eax],al
 1f0:	01 13                	add    DWORD PTR [ebx],edx
 1f2:	fa                   	cli    
 1f3:	01 00                	add    DWORD PTR [eax],eax
 1f5:	00 02                	add    BYTE PTR [edx],al
 1f7:	91                   	xchg   ecx,eax
 1f8:	04 00                	add    al,0x0
 1fa:	0c 04                	or     al,0x4
 1fc:	b3 01                	mov    bl,0x1
 1fe:	00 00                	add    BYTE PTR [eax],al
 200:	0f ff                	(bad)  
 202:	02 00                	add    al,BYTE PTR [eax]
 204:	00 01                	add    BYTE PTR [ecx],al
 206:	1c 3a                	sbb    al,0x3a
 208:	00 00                	add    BYTE PTR [eax],al
 20a:	00 0a                	add    BYTE PTR [edx],cl
 20c:	00 10                	add    BYTE PTR [eax],dl
 20e:	03 4a 01             	add    ecx,DWORD PTR [edx+0x1]
 211:	00 00                	add    BYTE PTR [eax],al
 213:	01 9c 90 02 00 00 0e 	add    DWORD PTR [eax+edx*4+0xe000002],ebx
 21a:	3e 01 00             	add    DWORD PTR ds:[eax],eax
 21d:	00 01                	add    BYTE PTR [ecx],al
 21f:	1c b3                	sbb    al,0xb3
 221:	01 00                	add    DWORD PTR [eax],eax
 223:	00 02                	add    BYTE PTR [edx],al
 225:	91                   	xchg   ecx,eax
 226:	00 0e                	add    BYTE PTR [esi],cl
 228:	89 02                	mov    DWORD PTR [edx],eax
 22a:	00 00                	add    BYTE PTR [eax],al
 22c:	01 1c a8             	add    DWORD PTR [eax+ebp*4],ebx
 22f:	02 00                	add    al,BYTE PTR [eax]
 231:	00 02                	add    BYTE PTR [edx],al
 233:	91                   	xchg   ecx,eax
 234:	04 0e                	add    al,0xe
 236:	5b                   	pop    ebx
 237:	01 00                	add    DWORD PTR [eax],eax
 239:	00 01                	add    BYTE PTR [ecx],al
 23b:	1c 3a                	sbb    al,0x3a
 23d:	00 00                	add    BYTE PTR [eax],al
 23f:	00 02                	add    BYTE PTR [edx],al
 241:	91                   	xchg   ecx,eax
 242:	08 10                	or     BYTE PTR [eax],dl
 244:	78 00                	js     246 <main-0x30ffdba>
 246:	01 1e                	add    DWORD PTR [esi],ebx
 248:	3a 00                	cmp    al,BYTE PTR [eax]
 24a:	00 00                	add    BYTE PTR [eax],al
 24c:	02 91 6c 10 79 00    	add    dl,BYTE PTR [ecx+0x79106c]
 252:	01 1e                	add    DWORD PTR [esi],ebx
 254:	3a 00                	cmp    al,BYTE PTR [eax]
 256:	00 00                	add    BYTE PTR [eax],al
 258:	02 91 68 11 e0 00    	add    dl,BYTE PTR [ecx+0xe01168]
 25e:	00 00                	add    BYTE PTR [eax],al
 260:	01 1f                	add    DWORD PTR [edi],ebx
 262:	3a 00                	cmp    al,BYTE PTR [eax]
 264:	00 00                	add    BYTE PTR [eax],al
 266:	02 91 64 11 77 00    	add    dl,BYTE PTR [ecx+0x771164]
 26c:	00 00                	add    BYTE PTR [eax],al
 26e:	01 1f                	add    DWORD PTR [edi],ebx
 270:	3a 00                	cmp    al,BYTE PTR [eax]
 272:	00 00                	add    BYTE PTR [eax],al
 274:	02 91 60 12 41 00    	add    dl,BYTE PTR [ecx+0x411260]
 27a:	10 03                	adc    BYTE PTR [ebx],al
 27c:	ec                   	in     al,dx
 27d:	00 00                	add    BYTE PTR [eax],al
 27f:	00 10                	add    BYTE PTR [eax],dl
 281:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 284:	00 01                	add    BYTE PTR [ecx],al
 286:	23 6c 00 00          	and    ebp,DWORD PTR [eax+eax*1+0x0]
 28a:	00 02                	add    BYTE PTR [edx],al
 28c:	91                   	xchg   ecx,eax
 28d:	5c                   	pop    esp
 28e:	00 00                	add    BYTE PTR [eax],al
 290:	13 25 00 00 00 a1    	adc    esp,DWORD PTR ds:0xa1000000
 296:	02 00                	add    al,BYTE PTR [eax]
 298:	00 14 a1             	add    BYTE PTR [ecx+eiz*4],dl
 29b:	02 00                	add    al,BYTE PTR [eax]
 29d:	00 ff                	add    bh,bh
 29f:	01 00                	add    DWORD PTR [eax],eax
 2a1:	02 04 07             	add    al,BYTE PTR [edi+eax*1]
 2a4:	a3 01 00 00 0c       	mov    ds:0xc000001,eax
 2a9:	04 90                	add    al,0x90
 2ab:	02 00                	add    al,BYTE PTR [eax]
 2ad:	00 0f                	add    BYTE PTR [edi],cl
 2af:	e0 01                	loopne 2b2 <main-0x30ffd4e>
 2b1:	00 00                	add    BYTE PTR [eax],al
 2b3:	01 41 3a             	add    DWORD PTR [ecx+0x3a],eax
 2b6:	00 00                	add    BYTE PTR [eax],al
 2b8:	00 54 01 10          	add    BYTE PTR [ecx+eax*1+0x10],dl
 2bc:	03 69 00             	add    ebp,DWORD PTR [ecx+0x0]
 2bf:	00 00                	add    BYTE PTR [eax],al
 2c1:	01 9c f0 02 00 00 0e 	add    DWORD PTR [eax+esi*8+0xe000002],ebx
 2c8:	46                   	inc    esi
 2c9:	01 00                	add    DWORD PTR [eax],eax
 2cb:	00 01                	add    BYTE PTR [ecx],al
 2cd:	41                   	inc    ecx
 2ce:	b3 01                	mov    bl,0x1
 2d0:	00 00                	add    BYTE PTR [eax],al
 2d2:	02 91 00 10 69 00    	add    dl,BYTE PTR [ecx+0x691000]
 2d8:	01 43 6c             	add    DWORD PTR [ebx+0x6c],eax
 2db:	00 00                	add    BYTE PTR [eax],al
 2dd:	00 02                	add    BYTE PTR [edx],al
 2df:	91                   	xchg   ecx,eax
 2e0:	6c                   	ins    BYTE PTR es:[edi],dx
 2e1:	10 72 65             	adc    BYTE PTR [edx+0x65],dh
 2e4:	74 00                	je     2e6 <main-0x30ffd1a>
 2e6:	01 44 3a 00          	add    DWORD PTR [edx+edi*1+0x0],eax
 2ea:	00 00                	add    BYTE PTR [eax],al
 2ec:	02 91 68 00 0f 2b    	add    dl,BYTE PTR [ecx+0x2b0f0068]
 2f2:	01 00                	add    DWORD PTR [eax],eax
 2f4:	00 01                	add    BYTE PTR [ecx],al
 2f6:	57                   	push   edi
 2f7:	fa                   	cli    
 2f8:	01 00                	add    DWORD PTR [eax],eax
 2fa:	00 bd 01 10 03 8e    	add    BYTE PTR [ebp-0x71fcefff],bh
 300:	02 00                	add    al,BYTE PTR [eax]
 302:	00 01                	add    BYTE PTR [ecx],al
 304:	9c                   	pushf  
 305:	ae                   	scas   al,BYTE PTR es:[edi]
 306:	03 00                	add    eax,DWORD PTR [eax]
 308:	00 0e                	add    BYTE PTR [esi],cl
 30a:	72 02                	jb     30e <main-0x30ffcf2>
 30c:	00 00                	add    BYTE PTR [eax],al
 30e:	01 57 ae             	add    DWORD PTR [edi-0x52],edx
 311:	03 00                	add    eax,DWORD PTR [eax]
 313:	00 02                	add    BYTE PTR [edx],al
 315:	91                   	xchg   ecx,eax
 316:	00 10                	add    BYTE PTR [eax],dl
 318:	61                   	popa   
 319:	72 67                	jb     382 <main-0x30ffc7e>
 31b:	00 01                	add    BYTE PTR [ecx],al
 31d:	59                   	pop    ecx
 31e:	b3 01                	mov    bl,0x1
 320:	00 00                	add    BYTE PTR [eax],al
 322:	02 91 6c 11 55 02    	add    dl,BYTE PTR [ecx+0x255116c]
 328:	00 00                	add    BYTE PTR [eax],al
 32a:	01 5a b3             	add    DWORD PTR [edx-0x4d],ebx
 32d:	01 00                	add    DWORD PTR [eax],eax
 32f:	00 02                	add    BYTE PTR [edx],al
 331:	91                   	xchg   ecx,eax
 332:	68 11 c0 01 00       	push   0x1c011
 337:	00 01                	add    BYTE PTR [ecx],al
 339:	5b                   	pop    ebx
 33a:	3a 00                	cmp    al,BYTE PTR [eax]
 33c:	00 00                	add    BYTE PTR [eax],al
 33e:	02 91 64 11 d9 00    	add    dl,BYTE PTR [ecx+0xd91164]
 344:	00 00                	add    BYTE PTR [eax],al
 346:	01 5c 3a 00          	add    DWORD PTR [edx+edi*1+0x0],ebx
 34a:	00 00                	add    BYTE PTR [eax],al
 34c:	02 91 60 11 bf 01    	add    dl,BYTE PTR [ecx+0x1bf1160]
 352:	00 00                	add    BYTE PTR [eax],al
 354:	01 5d 3a             	add    DWORD PTR [ebp+0x3a],ebx
 357:	00 00                	add    BYTE PTR [eax],al
 359:	00 02                	add    BYTE PTR [edx],al
 35b:	91                   	xchg   ecx,eax
 35c:	5c                   	pop    esp
 35d:	11 a2 02 00 00 01    	adc    DWORD PTR [edx+0x1000002],esp
 363:	5e                   	pop    esi
 364:	3a 00                	cmp    al,BYTE PTR [eax]
 366:	00 00                	add    BYTE PTR [eax],al
 368:	02 91 58 11 9f 02    	add    dl,BYTE PTR [ecx+0x29f1158]
 36e:	00 00                	add    BYTE PTR [eax],al
 370:	01 5f 3a             	add    DWORD PTR [edi+0x3a],ebx
 373:	00 00                	add    BYTE PTR [eax],al
 375:	00 02                	add    BYTE PTR [edx],al
 377:	91                   	xchg   ecx,eax
 378:	54                   	push   esp
 379:	11 30                	adc    DWORD PTR [eax],esi
 37b:	01 00                	add    DWORD PTR [eax],eax
 37d:	00 01                	add    BYTE PTR [ecx],al
 37f:	60                   	pusha  
 380:	fa                   	cli    
 381:	01 00                	add    DWORD PTR [eax],eax
 383:	00 02                	add    BYTE PTR [edx],al
 385:	91                   	xchg   ecx,eax
 386:	50                   	push   eax
 387:	11 29                	adc    DWORD PTR [ecx],ebp
 389:	00 00                	add    BYTE PTR [eax],al
 38b:	00 01                	add    BYTE PTR [ecx],al
 38d:	61                   	popa   
 38e:	fa                   	cli    
 38f:	01 00                	add    DWORD PTR [eax],eax
 391:	00 02                	add    BYTE PTR [edx],al
 393:	91                   	xchg   ecx,eax
 394:	4c                   	dec    esp
 395:	12 7e 03             	adc    bh,BYTE PTR [esi+0x3]
 398:	10 03                	adc    BYTE PTR [ebx],al
 39a:	9e                   	sahf   
 39b:	00 00                	add    BYTE PTR [eax],al
 39d:	00 11                	add    BYTE PTR [ecx],dl
 39f:	26 01 00             	add    DWORD PTR es:[eax],eax
 3a2:	00 01                	add    BYTE PTR [ecx],al
 3a4:	ba b3 01 00 00       	mov    edx,0x1b3
 3a9:	02 91 48 00 00 0c    	add    dl,BYTE PTR [ecx+0xc000048]
 3af:	04 b4                	add    al,0xb4
 3b1:	03 00                	add    eax,DWORD PTR [eax]
 3b3:	00 15 25 00 00 00    	add    BYTE PTR ds:0x25,dl
 3b9:	16                   	push   ss
 3ba:	73 01                	jae    3bd <main-0x30ffc43>
 3bc:	00 00                	add    BYTE PTR [eax],al
 3be:	01 d0                	add    eax,edx
 3c0:	4b                   	dec    ebx
 3c1:	04 10                	add    al,0x10
 3c3:	03 58 00             	add    ebx,DWORD PTR [eax+0x0]
 3c6:	00 00                	add    BYTE PTR [eax],al
 3c8:	01 9c e7 03 00 00 12 	add    DWORD PTR [edi+eiz*8+0x12000003],ebx
 3cf:	61                   	popa   
 3d0:	04 10                	add    al,0x10
 3d2:	03 3f                	add    edi,DWORD PTR [edi]
 3d4:	00 00                	add    BYTE PTR [eax],al
 3d6:	00 10                	add    BYTE PTR [eax],dl
 3d8:	63 6e 74             	arpl   WORD PTR [esi+0x74],bp
 3db:	00 01                	add    BYTE PTR [ecx],al
 3dd:	d3 6c 00 00          	shr    DWORD PTR [eax+eax*1+0x0],cl
 3e1:	00 02                	add    BYTE PTR [edx],al
 3e3:	91                   	xchg   ecx,eax
 3e4:	6c                   	ins    BYTE PTR es:[edi],dx
 3e5:	00 00                	add    BYTE PTR [eax],al
 3e7:	17                   	pop    ss
 3e8:	ec                   	in     al,dx
 3e9:	01 00                	add    DWORD PTR [eax],eax
 3eb:	00 01                	add    BYTE PTR [ecx],al
 3ed:	ed                   	in     eax,dx
 3ee:	a3 04 10 03 ab       	mov    ds:0xab031004,eax
 3f3:	00 00                	add    BYTE PTR [eax],al
 3f5:	00 01                	add    BYTE PTR [ecx],al
 3f7:	9c                   	pushf  
 3f8:	17                   	pop    ss
 3f9:	04 00                	add    al,0x0
 3fb:	00 0e                	add    BYTE PTR [esi],cl
 3fd:	f7 01 00 00 01 ed    	test   DWORD PTR [ecx],0xed010000
 403:	b3 01                	mov    bl,0x1
 405:	00 00                	add    BYTE PTR [eax],al
 407:	02 91 00 10 69 00    	add    dl,BYTE PTR [ecx+0x691000]
 40d:	01 ef                	add    edi,ebp
 40f:	3a 00                	cmp    al,BYTE PTR [eax]
 411:	00 00                	add    BYTE PTR [eax],al
 413:	02 91 6c 00 18 6c    	add    dl,BYTE PTR [ecx+0x6c18006c]
 419:	02 00                	add    al,BYTE PTR [eax]
 41b:	00 01                	add    BYTE PTR [ecx],al
 41d:	04 01                	add    al,0x1
 41f:	4e                   	dec    esi
 420:	05 10 03 5f 00       	add    eax,0x5f0310
 425:	00 00                	add    BYTE PTR [eax],al
 427:	01 9c 5c 04 00 00 19 	add    DWORD PTR [esp+ebx*2+0x19000004],ebx
 42e:	97                   	xchg   edi,eax
 42f:	02 00                	add    al,BYTE PTR [eax]
 431:	00 01                	add    BYTE PTR [ecx],al
 433:	04 01                	add    al,0x1
 435:	b3 01                	mov    bl,0x1
 437:	00 00                	add    BYTE PTR [eax],al
 439:	02 91 00 1a 89 02    	add    dl,BYTE PTR [ecx+0x2891a00]
 43f:	00 00                	add    BYTE PTR [eax],al
 441:	01 06                	add    DWORD PTR [esi],eax
 443:	01 5c 04 00          	add    DWORD PTR [esp+eax*1+0x0],ebx
 447:	00 03                	add    BYTE PTR [ebx],al
 449:	91                   	xchg   ecx,eax
 44a:	ec                   	in     al,dx
 44b:	57                   	push   edi
 44c:	1a 98 01 00 00 01    	sbb    bl,BYTE PTR [eax+0x1000001]
 452:	07                   	pop    es
 453:	01 3a                	add    DWORD PTR [edx],edi
 455:	00 00                	add    BYTE PTR [eax],al
 457:	00 02                	add    BYTE PTR [edx],al
 459:	91                   	xchg   ecx,eax
 45a:	6c                   	ins    BYTE PTR es:[edi],dx
 45b:	00 13                	add    BYTE PTR [ebx],dl
 45d:	25 00 00 00 73       	and    eax,0x73000000
 462:	04 00                	add    al,0x0
 464:	00 1b                	add    BYTE PTR [ebx],bl
 466:	a1 02 00 00 09       	mov    eax,ds:0x9000002
 46b:	14 a1                	adc    al,0xa1
 46d:	02 00                	add    al,BYTE PTR [eax]
 46f:	00 ff                	add    bh,bh
 471:	01 00                	add    DWORD PTR [eax],eax
 473:	1c 1d                	sbb    al,0x1d
 475:	03 00                	add    eax,DWORD PTR [eax]
 477:	00 01                	add    BYTE PTR [ecx],al
 479:	14 01                	adc    al,0x1
 47b:	ad                   	lods   eax,DWORD PTR ds:[esi]
 47c:	05 10 03 de 01       	add    eax,0x1de0310
 481:	00 00                	add    BYTE PTR [eax],al
 483:	01 9c 41 05 00 00 1a 	add    DWORD PTR [ecx+eax*2+0x1a000005],ebx
 48a:	f7 01 00 00 01 16    	test   DWORD PTR [ecx],0x16010000
 490:	01 41 05             	add    DWORD PTR [ecx+0x5],eax
 493:	00 00                	add    BYTE PTR [eax],al
 495:	03 91 dc 7d 1a e8    	add    edx,DWORD PTR [ecx-0x17e58224]
 49b:	00 00                	add    BYTE PTR [eax],al
 49d:	00 01                	add    BYTE PTR [ecx],al
 49f:	17                   	pop    ss
 4a0:	01 48 00             	add    DWORD PTR [eax+0x0],ecx
 4a3:	00 00                	add    BYTE PTR [eax],al
 4a5:	03 91 db 7d 1a e9    	add    edx,DWORD PTR [ecx-0x16e58225]
 4ab:	02 00                	add    al,BYTE PTR [eax]
 4ad:	00 01                	add    BYTE PTR [ecx],al
 4af:	18 01                	sbb    BYTE PTR [ecx],al
 4b1:	3a 00                	cmp    al,BYTE PTR [eax]
 4b3:	00 00                	add    BYTE PTR [eax],al
 4b5:	02 91 6c 1a 00 02    	add    dl,BYTE PTR [ecx+0x2001a6c]
 4bb:	00 00                	add    BYTE PTR [eax],al
 4bd:	01 19                	add    DWORD PTR [ecx],ebx
 4bf:	01 51 05             	add    DWORD PTR [ecx+0x5],edx
 4c2:	00 00                	add    BYTE PTR [eax],al
 4c4:	03 91 97 6a 1a a7    	add    edx,DWORD PTR [ecx-0x58e59569]
 4ca:	02 00                	add    al,BYTE PTR [eax]
 4cc:	00 01                	add    BYTE PTR [ecx],al
 4ce:	1a 01                	sbb    al,BYTE PTR [ecx]
 4d0:	3a 00                	cmp    al,BYTE PTR [eax]
 4d2:	00 00                	add    BYTE PTR [eax],al
 4d4:	02 91 68 1a 7a 01    	add    dl,BYTE PTR [ecx+0x17a1a68]
 4da:	00 00                	add    BYTE PTR [eax],al
 4dc:	01 1b                	add    DWORD PTR [ebx],ebx
 4de:	01 3a                	add    DWORD PTR [edx],edi
 4e0:	00 00                	add    BYTE PTR [eax],al
 4e2:	00 02                	add    BYTE PTR [edx],al
 4e4:	91                   	xchg   ecx,eax
 4e5:	64 1a b3 02 00 00 01 	sbb    dh,BYTE PTR fs:[ebx+0x1000002]
 4ec:	1c 01                	sbb    al,0x1
 4ee:	3a 00                	cmp    al,BYTE PTR [eax]
 4f0:	00 00                	add    BYTE PTR [eax],al
 4f2:	02 91 60 1a 81 02    	add    dl,BYTE PTR [ecx+0x2811a60]
 4f8:	00 00                	add    BYTE PTR [eax],al
 4fa:	01 1d 01 67 05 00    	add    DWORD PTR ds:0x56701,ebx
 500:	00 03                	add    BYTE PTR [ebx],al
 502:	91                   	xchg   ecx,eax
 503:	83 6a 1d 01          	sub    DWORD PTR [edx+0x1d],0x1
 507:	01 00                	add    DWORD PTR [eax],eax
 509:	00 01                	add    BYTE PTR [ecx],al
 50b:	27                   	daa    
 50c:	01 31                	add    DWORD PTR [ecx],esi
 50e:	06                   	push   es
 50f:	10 03                	adc    BYTE PTR [ebx],al
 511:	1d 4e 01 00 00       	sbb    eax,0x14e
 516:	01 2c 01             	add    DWORD PTR [ecx+eax*1],ebp
 519:	6d                   	ins    DWORD PTR es:[edi],dx
 51a:	06                   	push   es
 51b:	10 03                	adc    BYTE PTR [ebx],al
 51d:	1d d9 02 00 00       	sbb    eax,0x2d9
 522:	01 7b 01             	add    DWORD PTR [ebx+0x1],edi
 525:	14 07                	adc    al,0x7
 527:	10 03                	adc    BYTE PTR [ebx],al
 529:	12 31                	adc    dh,BYTE PTR [ecx]
 52b:	06                   	push   es
 52c:	10 03                	adc    BYTE PTR [ebx],al
 52e:	55                   	push   ebp
 52f:	01 00                	add    DWORD PTR [eax],eax
 531:	00 1e                	add    BYTE PTR [esi],bl
 533:	69 00 01 7e 01 3a    	imul   eax,DWORD PTR [eax],0x3a017e01
 539:	00 00                	add    BYTE PTR [eax],al
 53b:	00 02                	add    BYTE PTR [edx],al
 53d:	91                   	xchg   ecx,eax
 53e:	5c                   	pop    esp
 53f:	00 00                	add    BYTE PTR [eax],al
 541:	13 25 00 00 00 51    	adc    esp,DWORD PTR ds:0x51000000
 547:	05 00 00 1b a1       	add    eax,0xa11b0000
 54c:	02 00                	add    al,BYTE PTR [eax]
 54e:	00 ff                	add    bh,bh
 550:	00 13                	add    BYTE PTR [ebx],dl
 552:	25 00 00 00 67       	and    eax,0x67000000
 557:	05 00 00 1b a1       	add    eax,0xa11b0000
 55c:	02 00                	add    al,BYTE PTR [eax]
 55e:	00 31                	add    BYTE PTR [ecx],dh
 560:	1b a1 02 00 00 31    	sbb    esp,DWORD PTR [ecx+0x31000002]
 566:	00 13                	add    BYTE PTR [ebx],dl
 568:	25 00 00 00 77       	and    eax,0x77000000
 56d:	05 00 00 1b a1       	add    eax,0xa11b0000
 572:	02 00                	add    al,BYTE PTR [eax]
 574:	00 13                	add    BYTE PTR [ebx],dl
 576:	00 1f                	add    BYTE PTR [edi],bl
 578:	66                   	data16
 579:	00 00                	add    BYTE PTR [eax],al
 57b:	00 05 32 61 00 00    	add    BYTE PTR ds:0x6132,al
 581:	00 05 03 8c 0f 10    	add    BYTE PTR ds:0x100f8c03,al
 587:	03 1f                	add    ebx,DWORD PTR [edi]
 589:	35 01 00 00 05       	xor    eax,0x5000001
 58e:	33 61 00             	xor    esp,DWORD PTR [ecx+0x0]
 591:	00 00                	add    BYTE PTR [eax],al
 593:	05 03 90 0f 10       	add    eax,0x100f9003
 598:	03 1f                	add    ebx,DWORD PTR [edi]
 59a:	15 03 00 00 05       	adc    eax,0x5000003
 59f:	34 61                	xor    al,0x61
 5a1:	00 00                	add    BYTE PTR [eax],al
 5a3:	00 05 03 88 0f 10    	add    BYTE PTR ds:0x100f8803,al
 5a9:	03 1f                	add    ebx,DWORD PTR [edi]
 5ab:	89 01                	mov    DWORD PTR [ecx],eax
 5ad:	00 00                	add    BYTE PTR [eax],al
 5af:	03 63 10             	add    esp,DWORD PTR [ebx+0x10]
 5b2:	01 00                	add    DWORD PTR [eax],eax
 5b4:	00 05 03 98 0f 10    	add    BYTE PTR ds:0x100f9803,al
 5ba:	03 1f                	add    ebx,DWORD PTR [edi]
 5bc:	12 02                	adc    al,BYTE PTR [edx]
 5be:	00 00                	add    BYTE PTR [eax],al
 5c0:	03 e1                	add    esp,ecx
 5c2:	5f                   	pop    edi
 5c3:	01 00                	add    DWORD PTR [eax],eax
 5c5:	00 05 03 84 0f 10    	add    BYTE PTR ds:0x100f8403,al
 5cb:	03 1f                	add    ebx,DWORD PTR [edi]
 5cd:	46                   	inc    esi
 5ce:	00 00                	add    BYTE PTR [eax],al
 5d0:	00 04 1d 90 02 00 00 	add    BYTE PTR [ebx*1+0x290],al
 5d7:	05 03 80 0d 10       	add    eax,0x100d8003
 5dc:	03 1f                	add    ebx,DWORD PTR [edi]
 5de:	34 02                	xor    al,0x2
 5e0:	00 00                	add    BYTE PTR [eax],al
 5e2:	04 1e                	add    al,0x1e
 5e4:	b3 01                	mov    bl,0x1
 5e6:	00 00                	add    BYTE PTR [eax],al
 5e8:	05 03 a0 0f 10       	add    eax,0x100fa003
 5ed:	03 13                	add    edx,DWORD PTR [ebx]
 5ef:	b9 01 00 00 fe       	mov    ecx,0xfe000001
 5f4:	05 00 00 1b a1       	add    eax,0xa11b0000
 5f9:	02 00                	add    al,BYTE PTR [eax]
 5fb:	00 01                	add    BYTE PTR [ecx],al
 5fd:	00 1f                	add    BYTE PTR [edi],bl
 5ff:	fc                   	cld    
 600:	00 00                	add    BYTE PTR [eax],al
 602:	00 04 1f             	add    BYTE PTR [edi+ebx*1],al
 605:	ee                   	out    dx,al
 606:	05 00 00 05 03       	add    eax,0x3050000
 60b:	80 0c 10 03          	or     BYTE PTR [eax+edx*1],0x3
 60f:	20 1f                	and    BYTE PTR [edi],bl
 611:	0c 00                	or     al,0x0
 613:	00 00                	add    BYTE PTR [eax],al
 615:	04 23                	add    al,0x23
 617:	21 06                	and    DWORD PTR [esi],eax
 619:	00 00                	add    BYTE PTR [eax],al
 61b:	05 03 94 0f 10       	add    eax,0x100f9403
 620:	03 0c 04             	add    ecx,DWORD PTR [esp+eax*1]
 623:	0f 06                	clts   
 625:	00 00                	add    BYTE PTR [eax],al
 627:	21 32                	and    DWORD PTR [edx],esi
 629:	06                   	push   es
 62a:	00 00                	add    BYTE PTR [eax],al
 62c:	22 b3 01 00 00 00    	and    dh,BYTE PTR [ebx+0x1]
 632:	1f                   	pop    ds
 633:	ac                   	lods   al,BYTE PTR ds:[esi]
 634:	01 00                	add    DWORD PTR [eax],eax
 636:	00 04 24             	add    BYTE PTR [esp],al
 639:	43                   	inc    ebx
 63a:	06                   	push   es
 63b:	00 00                	add    BYTE PTR [eax],al
 63d:	05 03 80 0f 10       	add    eax,0x100f8003
 642:	03 0c 04             	add    ecx,DWORD PTR [esp+eax*1]
 645:	27                   	daa    
 646:	06                   	push   es
 647:	00 00                	add    BYTE PTR [eax],al
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
  ac:	18 97 42 19 01 13    	sbb    BYTE PTR [edi+0x13011942],dl
  b2:	00 00                	add    BYTE PTR [eax],al
  b4:	0e                   	push   cs
  b5:	05 00 03 0e 3a       	add    eax,0x3a0e0300
  ba:	0b 3b                	or     edi,DWORD PTR [ebx]
  bc:	0b 49 13             	or     ecx,DWORD PTR [ecx+0x13]
  bf:	02 18                	add    bl,BYTE PTR [eax]
  c1:	00 00                	add    BYTE PTR [eax],al
  c3:	0f 2e 01             	ucomiss xmm0,DWORD PTR [ecx]
  c6:	3f                   	aas    
  c7:	19 03                	sbb    DWORD PTR [ebx],eax
  c9:	0e                   	push   cs
  ca:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  cc:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  ce:	27                   	daa    
  cf:	19 49 13             	sbb    DWORD PTR [ecx+0x13],ecx
  d2:	11 01                	adc    DWORD PTR [ecx],eax
  d4:	12 06                	adc    al,BYTE PTR [esi]
  d6:	40                   	inc    eax
  d7:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
  dd:	00 00                	add    BYTE PTR [eax],al
  df:	10 34 00             	adc    BYTE PTR [eax+eax*1],dh
  e2:	03 08                	add    ecx,DWORD PTR [eax]
  e4:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  e6:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  e8:	49                   	dec    ecx
  e9:	13 02                	adc    eax,DWORD PTR [edx]
  eb:	18 00                	sbb    BYTE PTR [eax],al
  ed:	00 11                	add    BYTE PTR [ecx],dl
  ef:	34 00                	xor    al,0x0
  f1:	03 0e                	add    ecx,DWORD PTR [esi]
  f3:	3a 0b                	cmp    cl,BYTE PTR [ebx]
  f5:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
  f7:	49                   	dec    ecx
  f8:	13 02                	adc    eax,DWORD PTR [edx]
  fa:	18 00                	sbb    BYTE PTR [eax],al
  fc:	00 12                	add    BYTE PTR [edx],dl
  fe:	0b 01                	or     eax,DWORD PTR [ecx]
 100:	11 01                	adc    DWORD PTR [ecx],eax
 102:	12 06                	adc    al,BYTE PTR [esi]
 104:	00 00                	add    BYTE PTR [eax],al
 106:	13 01                	adc    eax,DWORD PTR [ecx]
 108:	01 49 13             	add    DWORD PTR [ecx+0x13],ecx
 10b:	01 13                	add    DWORD PTR [ebx],edx
 10d:	00 00                	add    BYTE PTR [eax],al
 10f:	14 21                	adc    al,0x21
 111:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 114:	2f                   	das    
 115:	05 00 00 15 26       	add    eax,0x26150000
 11a:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 11d:	00 00                	add    BYTE PTR [eax],al
 11f:	16                   	push   ss
 120:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 123:	19 03                	sbb    DWORD PTR [ebx],eax
 125:	0e                   	push   cs
 126:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 128:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 12a:	11 01                	adc    DWORD PTR [ecx],eax
 12c:	12 06                	adc    al,BYTE PTR [esi]
 12e:	40                   	inc    eax
 12f:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 135:	00 00                	add    BYTE PTR [eax],al
 137:	17                   	pop    ss
 138:	2e 01 3f             	add    DWORD PTR cs:[edi],edi
 13b:	19 03                	sbb    DWORD PTR [ebx],eax
 13d:	0e                   	push   cs
 13e:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 140:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 142:	27                   	daa    
 143:	19 11                	sbb    DWORD PTR [ecx],edx
 145:	01 12                	add    DWORD PTR [edx],edx
 147:	06                   	push   es
 148:	40                   	inc    eax
 149:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 14f:	00 00                	add    BYTE PTR [eax],al
 151:	18 2e                	sbb    BYTE PTR [esi],ch
 153:	01 3f                	add    DWORD PTR [edi],edi
 155:	19 03                	sbb    DWORD PTR [ebx],eax
 157:	0e                   	push   cs
 158:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 15a:	3b 05 27 19 11 01    	cmp    eax,DWORD PTR ds:0x1111927
 160:	12 06                	adc    al,BYTE PTR [esi]
 162:	40                   	inc    eax
 163:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 169:	00 00                	add    BYTE PTR [eax],al
 16b:	19 05 00 03 0e 3a    	sbb    DWORD PTR ds:0x3a0e0300,eax
 171:	0b 3b                	or     edi,DWORD PTR [ebx]
 173:	05 49 13 02 18       	add    eax,0x18021349
 178:	00 00                	add    BYTE PTR [eax],al
 17a:	1a 34 00             	sbb    dh,BYTE PTR [eax+eax*1]
 17d:	03 0e                	add    ecx,DWORD PTR [esi]
 17f:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 181:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 187:	00 00                	add    BYTE PTR [eax],al
 189:	1b 21                	sbb    esp,DWORD PTR [ecx]
 18b:	00 49 13             	add    BYTE PTR [ecx+0x13],cl
 18e:	2f                   	das    
 18f:	0b 00                	or     eax,DWORD PTR [eax]
 191:	00 1c 2e             	add    BYTE PTR [esi+ebp*1],bl
 194:	01 3f                	add    DWORD PTR [edi],edi
 196:	19 03                	sbb    DWORD PTR [ebx],eax
 198:	0e                   	push   cs
 199:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 19b:	3b 05 11 01 12 06    	cmp    eax,DWORD PTR ds:0x6120111
 1a1:	40                   	inc    eax
 1a2:	18 96 42 19 01 13    	sbb    BYTE PTR [esi+0x13011942],dl
 1a8:	00 00                	add    BYTE PTR [eax],al
 1aa:	1d 0a 00 03 0e       	sbb    eax,0xe03000a
 1af:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1b1:	3b 05 11 01 00 00    	cmp    eax,DWORD PTR ds:0x111
 1b7:	1e                   	push   ds
 1b8:	34 00                	xor    al,0x0
 1ba:	03 08                	add    ecx,DWORD PTR [eax]
 1bc:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1be:	3b 05 49 13 02 18    	cmp    eax,DWORD PTR ds:0x18021349
 1c4:	00 00                	add    BYTE PTR [eax],al
 1c6:	1f                   	pop    ds
 1c7:	34 00                	xor    al,0x0
 1c9:	03 0e                	add    ecx,DWORD PTR [esi]
 1cb:	3a 0b                	cmp    cl,BYTE PTR [ebx]
 1cd:	3b 0b                	cmp    ecx,DWORD PTR [ebx]
 1cf:	49                   	dec    ecx
 1d0:	13 3f                	adc    edi,DWORD PTR [edi]
 1d2:	19 02                	sbb    DWORD PTR [edx],eax
 1d4:	18 00                	sbb    BYTE PTR [eax],al
 1d6:	00 20                	add    BYTE PTR [eax],ah
 1d8:	15 00 27 19 00       	adc    eax,0x192700
 1dd:	00 21                	add    BYTE PTR [ecx],ah
 1df:	15 01 27 19 01       	adc    eax,0x1192701
 1e4:	13 00                	adc    eax,DWORD PTR [eax]
 1e6:	00 22                	add    BYTE PTR [edx],ah
 1e8:	05 00 49 13 00       	add    eax,0x134900
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
  14:	8b 07                	mov    eax,DWORD PTR [edi]
	...

Disassembly of section .debug_line:

00000000 <.debug_line>:
   0:	2e 02 00             	add    al,BYTE PTR cs:[eax]
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
  21:	79 6f                	jns    92 <main-0x30fff6e>
  23:	67 69 2f 6f 70 74 2f 	imul   ebp,DWORD PTR [bx],0x2f74706f
  2a:	63 72 6f             	arpl   WORD PTR [edx+0x6f],si
  2d:	73 73                	jae    a2 <main-0x30fff5e>
  2f:	2f                   	das    
  30:	6c                   	ins    BYTE PTR es:[edi],dx
  31:	69 62 2f 67 63 63 2f 	imul   esp,DWORD PTR [edx+0x2f],0x2f636367
  38:	69 36 38 36 2d 70    	imul   esi,DWORD PTR [esi],0x702d3638
  3e:	63 2d 6c 69 6e 75    	arpl   WORD PTR ds:0x756e696c,bp
  44:	78 2d                	js     73 <main-0x30fff8d>
  46:	67 6e                	outs   dx,BYTE PTR ds:[si]
  48:	75 2f                	jne    79 <main-0x30fff87>
  4a:	35 2e 33 2e 30       	xor    eax,0x302e332e
  4f:	2f                   	das    
  50:	69 6e 63 6c 75 64 65 	imul   ebp,DWORD PTR [esi+0x63],0x6564756c
  57:	00 2f                	add    BYTE PTR [edi],ch
  59:	68 6f 6d 65 2f       	push   0x2f656d6f
  5e:	79 6f                	jns    cf <main-0x30fff31>
  60:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  67:	6f                   	outs   dx,DWORD PTR ds:[esi]
  68:	73 2f                	jae    99 <main-0x30fff67>
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
  8d:	79 6f                	jns    fe <main-0x30fff02>
  8f:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
  96:	6f                   	outs   dx,DWORD PTR ds:[esi]
  97:	73 2f                	jae    c8 <main-0x30fff38>
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
  f3:	12 01                	adc    al,BYTE PTR [ecx]
  f5:	3e                   	ds
  f6:	59                   	pop    ecx
  f7:	35 75 d7 d8 08       	xor    eax,0x8d8d775
  fc:	3e                   	ds
  fd:	bd 00 02 04 01       	mov    ebp,0x1040200
 102:	06                   	push   es
 103:	e4 00                	in     al,0x0
 105:	02 04 02             	add    al,BYTE PTR [edx+eax*1]
 108:	e4 06                	in     al,0x6
 10a:	e7 00                	out    0x0,eax
 10c:	02 04 01             	add    al,BYTE PTR [ecx+eax*1]
 10f:	06                   	push   es
 110:	e4 06                	in     al,0x6
 112:	e5 02                	in     eax,0x2
 114:	25 13 08 4b 67       	and    eax,0x674b0813
 119:	e3 34                	jecxz  14f <main-0x30ffeb1>
 11b:	00 02                	add    BYTE PTR [edx],al
 11d:	04 02                	add    al,0x2
 11f:	02 25 14 00 02 04    	add    ah,BYTE PTR ds:0x4020014
 125:	02 03                	add    al,BYTE PTR [ebx]
 127:	6f                   	outs   dx,DWORD PTR ds:[esi]
 128:	4a                   	dec    edx
 129:	00 02                	add    BYTE PTR [edx],al
 12b:	04 01                	add    al,0x1
 12d:	06                   	push   es
 12e:	4a                   	dec    edx
 12f:	06                   	push   es
 130:	03 13                	add    edx,DWORD PTR [ebx]
 132:	08 66 68             	or     BYTE PTR [esi+0x68],ah
 135:	4b                   	dec    ebx
 136:	08 4f 3d             	or     BYTE PTR [edi+0x3d],cl
 139:	5b                   	pop    ebx
 13a:	6a 92                	push   0xffffff92
 13c:	02 3b                	add    bh,BYTE PTR [ebx]
 13e:	14 69                	adc    al,0x69
 140:	00 02                	add    BYTE PTR [edx],al
 142:	04 02                	add    al,0x2
 144:	03 79 82             	add    edi,DWORD PTR [ecx-0x7e]
 147:	00 02                	add    BYTE PTR [edx],al
 149:	04 01                	add    al,0x1
 14b:	06                   	push   es
 14c:	4a                   	dec    edx
 14d:	06                   	push   es
 14e:	03 0b                	add    ecx,DWORD PTR [ebx]
 150:	66 59                	pop    cx
 152:	34 69                	xor    al,0x69
 154:	75 75                	jne    1cb <main-0x30ffe35>
 156:	75 75                	jne    1cd <main-0x30ffe33>
 158:	75 78                	jne    1d2 <main-0x30ffe2e>
 15a:	a1 08 ec 00 02       	mov    eax,ds:0x200ec08
 15f:	04 01                	add    al,0x1
 161:	06                   	push   es
 162:	66 06                	pushw  es
 164:	af                   	scas   eax,DWORD PTR es:[edi]
 165:	68 75 08 4c 67       	push   0x674c0875
 16a:	08 4d 67             	or     BYTE PTR [ebp+0x67],cl
 16d:	5a                   	pop    edx
 16e:	00 02                	add    BYTE PTR [edx],al
 170:	04 01                	add    al,0x1
 172:	06                   	push   es
 173:	9e                   	sahf   
 174:	00 02                	add    BYTE PTR [edx],al
 176:	04 02                	add    al,0x2
 178:	66                   	data16
 179:	00 02                	add    BYTE PTR [edx],al
 17b:	04 03                	add    al,0x3
 17d:	66 06                	pushw  es
 17f:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 180:	68 75 08 5a a0       	push   0xa05a0875
 185:	bc 68 a0 94 08       	mov    esp,0x894a068
 18a:	31 68 a0             	xor    DWORD PTR [eax-0x60],ebp
 18d:	94                   	xchg   esp,eax
 18e:	08 33                	or     BYTE PTR [ebx],dh
 190:	a0 92 a0 94 08       	mov    al,ds:0x894a092
 195:	16                   	push   ss
 196:	03 49 4a             	add    ecx,DWORD PTR [ecx+0x4a]
 199:	03 3a                	add    edi,DWORD PTR [edx]
 19b:	d6                   	(bad)  
 19c:	68 d8 08 e7 08       	push   0x8e708d8
 1a1:	13 d7                	adc    edx,edi
 1a3:	08 e5                	or     ch,ah
 1a5:	08 3e                	or     BYTE PTR [esi],bh
 1a7:	4b                   	dec    ebx
 1a8:	08 4b 4b             	or     BYTE PTR [ebx+0x4b],cl
 1ab:	d9 d9                	(bad)  
 1ad:	d7                   	xlat   BYTE PTR ds:[ebx]
 1ae:	d7                   	xlat   BYTE PTR ds:[ebx]
 1af:	3d 31 67 f3 00       	cmp    eax,0xf36731
 1b4:	02 04 03             	add    al,BYTE PTR [ebx+eax*1]
 1b7:	91                   	xchg   ecx,eax
 1b8:	00 02                	add    BYTE PTR [edx],al
 1ba:	04 03                	add    al,0x3
 1bc:	02 2c 11             	add    ch,BYTE PTR [ecx+edx*1]
 1bf:	00 02                	add    BYTE PTR [edx],al
 1c1:	04 01                	add    al,0x1
 1c3:	06                   	push   es
 1c4:	4a                   	dec    edx
 1c5:	06                   	push   es
 1c6:	68 03 19 3c 75       	push   0x753c1903
 1cb:	08 14 68             	or     BYTE PTR [eax+ebp*2],dl
 1ce:	4c                   	dec    esp
 1cf:	08 21                	or     BYTE PTR [ecx],ah
 1d1:	08 21                	or     BYTE PTR [ecx],ah
 1d3:	08 13                	or     BYTE PTR [ebx],dl
 1d5:	03 0a                	add    ecx,DWORD PTR [edx]
 1d7:	74 03                	je     1dc <main-0x30ffe24>
 1d9:	79 2e                	jns    209 <main-0x30ffdf7>
 1db:	02 30                	add    dh,BYTE PTR [eax]
 1dd:	19 2c 08             	sbb    DWORD PTR [eax+ecx*1],ebp
 1e0:	30 69 a0             	xor    BYTE PTR [ecx-0x60],ch
 1e3:	08 bc 08 67 08 a6 69 	or     BYTE PTR [eax+ecx*1+0x69a60867],bh
 1ea:	92                   	xchg   edx,eax
 1eb:	75 76                	jne    263 <main-0x30ffd9d>
 1ed:	75 75                	jne    264 <main-0x30ffd9c>
 1ef:	77 75                	ja     266 <main-0x30ffd9a>
 1f1:	08 4b 08             	or     BYTE PTR [ebx+0x8],cl
 1f4:	59                   	pop    ecx
 1f5:	08 59 f7             	or     BYTE PTR [ecx-0x9],bl
 1f8:	75 75                	jne    26f <main-0x30ffd91>
 1fa:	08 83 08 4c 75 30    	or     BYTE PTR [ebx+0x30754c08],al
 200:	08 56 b1             	or     BYTE PTR [esi-0x4f],dl
 203:	ae                   	scas   al,BYTE PTR es:[edi]
 204:	03 0d 66 30 ae 03    	add    ecx,DWORD PTR ds:0x3ae3066
 20a:	0d 82 31 03 09       	or     eax,0x9033182
 20f:	ac                   	lods   al,BYTE PTR ds:[esi]
 210:	30 ae 68 03 0c e4    	xor    BYTE PTR [esi-0x1bf3fc98],ch
 216:	b2 08                	mov    dl,0x8
 218:	68 03 7a 58 03       	push   0x3587a03
 21d:	09 20                	or     DWORD PTR [eax],esp
 21f:	ad                   	lods   eax,DWORD PTR ds:[esi]
 220:	59                   	pop    ecx
 221:	08 4c 08 21          	or     BYTE PTR [eax+ecx*1+0x21],cl
 225:	a0 03 09 4a 02       	mov    al,ds:0x24a0903
 22a:	27                   	daa    
 22b:	13 68 02             	adc    ebp,DWORD PTR [eax+0x2]
 22e:	05                   	.byte 0x5
 22f:	00 01                	add    BYTE PTR [ecx],al
 231:	01                   	.byte 0x1

Disassembly of section .debug_str:

00000000 <.debug_str>:
   0:	64                   	fs
   1:	65                   	gs
   2:	73 63                	jae    67 <main-0x30fff99>
   4:	72 69                	jb     6f <main-0x30fff91>
   6:	70 74                	jo     7c <main-0x30fff84>
   8:	69 6f 6e 00 63 6f 6d 	imul   ebp,DWORD PTR [edi+0x6e],0x6d6f6300
   f:	6d                   	ins    DWORD PTR es:[edi],dx
  10:	61                   	popa   
  11:	6e                   	outs   dx,BYTE PTR ds:[esi]
  12:	64                   	fs
  13:	5f                   	pop    edi
  14:	66                   	data16
  15:	75 6e                	jne    85 <main-0x30fff7b>
  17:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
  1b:	6e                   	outs   dx,BYTE PTR ds:[esi]
  1c:	00 70 72             	add    BYTE PTR [eax+0x72],dh
  1f:	65                   	gs
  20:	66                   	data16
  21:	65                   	gs
  22:	74 63                	je     87 <main-0x30fff79>
  24:	68 77 74 31 00       	push   0x317477
  29:	6e                   	outs   dx,BYTE PTR ds:[esi]
  2a:	61                   	popa   
  2b:	72 67                	jb     94 <main-0x30fff6c>
  2d:	76 00                	jbe    2f <main-0x30fffd1>
  2f:	6c                   	ins    BYTE PTR es:[edi],dx
  30:	6f                   	outs   dx,DWORD PTR ds:[esi]
  31:	6e                   	outs   dx,BYTE PTR ds:[esi]
  32:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  36:	6e                   	outs   dx,BYTE PTR ds:[esi]
  37:	67 20 75 6e          	and    BYTE PTR [di+0x6e],dh
  3b:	73 69                	jae    a6 <main-0x30fff5a>
  3d:	67 6e                	outs   dx,BYTE PTR ds:[si]
  3f:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
  44:	74 00                	je     46 <main-0x30fffba>
  46:	73 45                	jae    8d <main-0x30fff73>
  48:	78 65                	js     af <main-0x30fff51>
  4a:	63 75 74             	arpl   WORD PTR [ebp+0x74],si
  4d:	69 6e 67 50 72 6f 67 	imul   ebp,DWORD PTR [esi+0x67],0x676f7250
  54:	72 61                	jb     b7 <main-0x30fff49>
  56:	6d                   	ins    DWORD PTR es:[edi],dx
  57:	00 6c 6f 6e          	add    BYTE PTR [edi+ebp*2+0x6e],ch
  5b:	67 20 6c 6f          	and    BYTE PTR [si+0x6f],ch
  5f:	6e                   	outs   dx,BYTE PTR ds:[esi]
  60:	67 20 69 6e          	and    BYTE PTR [bx+di+0x6e],ch
  64:	74 00                	je     66 <main-0x30fff9a>
  66:	68 65 61 70 42       	push   0x42706165
  6b:	61                   	popa   
  6c:	73 65                	jae    d3 <main-0x30fff2d>
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
  a8:	72 69                	jb     113 <main-0x30ffeed>
  aa:	63 20                	arpl   WORD PTR [eax],sp
  ac:	2d 6d 61 72 63       	sub    eax,0x6372616d
  b1:	68 3d 70 65 6e       	push   0x6e65703d
  b6:	74 69                	je     121 <main-0x30ffedf>
  b8:	75 6d                	jne    127 <main-0x30ffed9>
  ba:	70 72                	jo     12e <main-0x30ffed2>
  bc:	6f                   	outs   dx,DWORD PTR ds:[esi]
  bd:	20 2d 67 20 2d 73    	and    BYTE PTR ds:0x732d2067,ch
  c3:	74 64                	je     129 <main-0x30ffed7>
  c5:	3d 63 39 39 20       	cmp    eax,0x20393963
  ca:	2d 66 66 72 65       	sub    eax,0x65726666
  cf:	65                   	gs
  d0:	73 74                	jae    146 <main-0x30ffeba>
  d2:	61                   	popa   
  d3:	6e                   	outs   dx,BYTE PTR ds:[esi]
  d4:	64 69 6e 67 00 64 71 	imul   ebp,DWORD PTR fs:[esi+0x67],0x75716400
  db:	75 
  dc:	6f                   	outs   dx,DWORD PTR ds:[esi]
  dd:	74 65                	je     144 <main-0x30ffebc>
  df:	00 6c 52 65          	add    BYTE PTR [edx+edx*2+0x65],ch
  e3:	74 56                	je     13b <main-0x30ffec5>
  e5:	61                   	popa   
  e6:	6c                   	ins    BYTE PTR es:[edi],dx
  e7:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
  eb:	72 72                	jb     15f <main-0x30ffea1>
  ed:	4b                   	dec    ebx
  ee:	65                   	gs
  ef:	79 00                	jns    f1 <main-0x30fff0f>
  f1:	61                   	popa   
  f2:	76 78                	jbe    16c <main-0x30ffe94>
  f4:	35 31 32 76 62       	xor    eax,0x62763231
  f9:	6d                   	ins    DWORD PTR es:[edi],dx
  fa:	69 00 63 6d 64 73    	imul   eax,DWORD PTR [eax],0x73646d63
 100:	00 67 65             	add    BYTE PTR [edi+0x65],ah
 103:	74 41                	je     146 <main-0x30ffeba>
 105:	43                   	inc    ebx
 106:	6f                   	outs   dx,DWORD PTR ds:[esi]
 107:	6d                   	ins    DWORD PTR es:[edi],dx
 108:	6d                   	ins    DWORD PTR es:[edi],dx
 109:	61                   	popa   
 10a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 10b:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 10f:	6d                   	ins    DWORD PTR es:[edi],dx
 110:	6d                   	ins    DWORD PTR es:[edi],dx
 111:	61                   	popa   
 112:	6e                   	outs   dx,BYTE PTR ds:[esi]
 113:	64                   	fs
 114:	5f                   	pop    edi
 115:	74 61                	je     178 <main-0x30ffe88>
 117:	62 6c 65 5f          	bound  ebp,QWORD PTR [ebp+eiz*2+0x5f]
 11b:	74 00                	je     11d <main-0x30ffee3>
 11d:	72 65                	jb     184 <main-0x30ffe7c>
 11f:	73 65                	jae    186 <main-0x30ffe7a>
 121:	72 76                	jb     199 <main-0x30ffe67>
 123:	65 64 00 74 65 6d    	gs add BYTE PTR fs:gs:[ebp+eiz*2+0x6d],dh
 129:	70 00                	jo     12b <main-0x30ffed5>
 12b:	62 75 69             	bound  esi,QWORD PTR [ebp+0x69]
 12e:	6c                   	ins    BYTE PTR es:[edi],dx
 12f:	64                   	fs
 130:	61                   	popa   
 131:	72 67                	jb     19a <main-0x30ffe66>
 133:	76 00                	jbe    135 <main-0x30ffecb>
 135:	68 65 61 70 43       	push   0x43706165
 13a:	75 72                	jne    1ae <main-0x30ffe52>
 13c:	72 00                	jb     13e <main-0x30ffec2>
 13e:	63 6d 64             	arpl   WORD PTR [ebp+0x64],bp
 141:	4c                   	dec    esp
 142:	69 6e 65 00 63 6f 6d 	imul   ebp,DWORD PTR [esi+0x65],0x6d6f6300
 149:	6d                   	ins    DWORD PTR es:[edi],dx
 14a:	61                   	popa   
 14b:	6e                   	outs   dx,BYTE PTR ds:[esi]
 14c:	64 00 67 65          	add    BYTE PTR fs:[edi+0x65],ah
 150:	74 41                	je     193 <main-0x30ffe6d>
 152:	4b                   	dec    ebx
 153:	65                   	gs
 154:	79 00                	jns    156 <main-0x30ffeaa>
 156:	6e                   	outs   dx,BYTE PTR ds:[esi]
 157:	61                   	popa   
 158:	6d                   	ins    DWORD PTR es:[edi],dx
 159:	65 00 73 69          	add    BYTE PTR gs:[ebx+0x69],dh
 15d:	7a 65                	jp     1c4 <main-0x30ffe3c>
 15f:	00 73 68             	add    BYTE PTR [ebx+0x68],dh
 162:	6f                   	outs   dx,DWORD PTR ds:[esi]
 163:	72 74                	jb     1d9 <main-0x30ffe27>
 165:	20 75 6e             	and    BYTE PTR [ebp+0x6e],dh
 168:	73 69                	jae    1d3 <main-0x30ffe2d>
 16a:	67 6e                	outs   dx,BYTE PTR ds:[si]
 16c:	65 64 20 69 6e       	gs and BYTE PTR fs:gs:[ecx+0x6e],ch
 171:	74 00                	je     173 <main-0x30ffe8d>
 173:	68 65 6c 70 4d       	push   0x4d706c65
 178:	65 00 63 6f          	add    BYTE PTR gs:[ebx+0x6f],ah
 17c:	6d                   	ins    DWORD PTR es:[edi],dx
 17d:	6d                   	ins    DWORD PTR es:[edi],dx
 17e:	61                   	popa   
 17f:	6e                   	outs   dx,BYTE PTR ds:[esi]
 180:	64                   	fs
 181:	42                   	inc    edx
 182:	75 66                	jne    1ea <main-0x30ffe16>
 184:	66 50                	push   ax
 186:	74 72                	je     1fa <main-0x30ffe06>
 188:	00 63 70             	add    BYTE PTR [ebx+0x70],ah
 18b:	75 69                	jne    1f6 <main-0x30ffe0a>
 18d:	64                   	fs
 18e:	5f                   	pop    edi
 18f:	70 72                	jo     203 <main-0x30ffdfd>
 191:	6f                   	outs   dx,DWORD PTR ds:[esi]
 192:	63 69 6e             	arpl   WORD PTR [ecx+0x6e],bp
 195:	66 6f                	outs   dx,WORD PTR ds:[esi]
 197:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 19a:	72 61                	jb     1fd <main-0x30ffe03>
 19c:	6d                   	ins    DWORD PTR es:[edi],dx
 19d:	43                   	inc    ebx
 19e:	6f                   	outs   dx,DWORD PTR ds:[esi]
 19f:	75 6e                	jne    20f <main-0x30ffdf1>
 1a1:	74 00                	je     1a3 <main-0x30ffe5d>
 1a3:	73 69                	jae    20e <main-0x30ffdf2>
 1a5:	7a 65                	jp     20c <main-0x30ffdf4>
 1a7:	74 79                	je     222 <main-0x30ffdde>
 1a9:	70 65                	jo     210 <main-0x30ffdf0>
 1ab:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 1ae:	6d                   	ins    DWORD PTR es:[edi],dx
 1af:	6d                   	ins    DWORD PTR es:[edi],dx
 1b0:	61                   	popa   
 1b1:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1b2:	64                   	fs
 1b3:	5f                   	pop    edi
 1b4:	66                   	data16
 1b5:	75 6e                	jne    225 <main-0x30ffddb>
 1b7:	63 74 69 6f          	arpl   WORD PTR [ecx+ebp*2+0x6f],si
 1bb:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1bc:	5f                   	pop    edi
 1bd:	70 00                	jo     1bf <main-0x30ffe41>
 1bf:	62 73 71             	bound  esi,QWORD PTR [ebx+0x71]
 1c2:	75 6f                	jne    233 <main-0x30ffdcd>
 1c4:	74 65                	je     22b <main-0x30ffdd5>
 1c6:	00 2f                	add    BYTE PTR [edi],ch
 1c8:	68 6f 6d 65 2f       	push   0x2f656d6f
 1cd:	79 6f                	jns    23e <main-0x30ffdc2>
 1cf:	67 69 2f 73 72 63 2f 	imul   ebp,DWORD PTR [bx],0x2f637273
 1d6:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1d7:	73 2f                	jae    208 <main-0x30ffdf8>
 1d9:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 1dd:	6c                   	ins    BYTE PTR es:[edi],dx
 1de:	6c                   	ins    BYTE PTR es:[edi],dx
 1df:	00 66 69             	add    BYTE PTR [esi+0x69],ah
 1e2:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1e3:	64                   	fs
 1e4:	43                   	inc    ebx
 1e5:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1e6:	6d                   	ins    DWORD PTR es:[edi],dx
 1e7:	6d                   	ins    DWORD PTR es:[edi],dx
 1e8:	61                   	popa   
 1e9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1ea:	64 00 65 78          	add    BYTE PTR fs:[ebp+0x78],ah
 1ee:	65 63 49 6e          	arpl   WORD PTR gs:[ecx+0x6e],cx
 1f2:	74 65                	je     259 <main-0x30ffda7>
 1f4:	72 6e                	jb     264 <main-0x30ffd9c>
 1f6:	61                   	popa   
 1f7:	6c                   	ins    BYTE PTR es:[edi],dx
 1f8:	43                   	inc    ebx
 1f9:	6f                   	outs   dx,DWORD PTR ds:[esi]
 1fa:	6d                   	ins    DWORD PTR es:[edi],dx
 1fb:	6d                   	ins    DWORD PTR es:[edi],dx
 1fc:	61                   	popa   
 1fd:	6e                   	outs   dx,BYTE PTR ds:[esi]
 1fe:	64 00 63 6f          	add    BYTE PTR fs:[ebx+0x6f],ah
 202:	6d                   	ins    DWORD PTR es:[edi],dx
 203:	6d                   	ins    DWORD PTR es:[edi],dx
 204:	61                   	popa   
 205:	6e                   	outs   dx,BYTE PTR ds:[esi]
 206:	64                   	fs
 207:	73 00                	jae    209 <main-0x30ffdf7>
 209:	6b 73 68 65          	imul   esi,DWORD PTR [ebx+0x68],0x65
 20d:	6c                   	ins    BYTE PTR es:[edi],dx
 20e:	6c                   	ins    BYTE PTR es:[edi],dx
 20f:	2e 63 00             	arpl   WORD PTR cs:[eax],ax
 212:	63 70 75             	arpl   WORD PTR [eax+0x75],si
 215:	69 64 5f 65 78 74 65 	imul   esp,DWORD PTR [edi+ebx*2+0x65],0x6e657478
 21c:	6e 
 21d:	64                   	fs
 21e:	65                   	gs
 21f:	64                   	fs
 220:	5f                   	pop    edi
 221:	66                   	data16
 222:	65                   	gs
 223:	61                   	popa   
 224:	74 75                	je     29b <main-0x30ffd65>
 226:	72 65                	jb     28d <main-0x30ffd73>
 228:	5f                   	pop    edi
 229:	62 69 74             	bound  ebp,QWORD PTR [ecx+0x74]
 22c:	73 00                	jae    22e <main-0x30ffdd2>
 22e:	5f                   	pop    edi
 22f:	42                   	inc    edx
 230:	6f                   	outs   dx,DWORD PTR ds:[esi]
 231:	6f                   	outs   dx,DWORD PTR ds:[esi]
 232:	6c                   	ins    BYTE PTR es:[edi],dx
 233:	00 73 4b             	add    BYTE PTR [ebx+0x4b],dh
 236:	53                   	push   ebx
 237:	68 65 6c 6c 50       	push   0x506c6c65
 23c:	72 6f                	jb     2ad <main-0x30ffd53>
 23e:	67 72 61             	addr16 jb 2a2 <main-0x30ffd5e>
 241:	6d                   	ins    DWORD PTR es:[edi],dx
 242:	4e                   	dec    esi
 243:	61                   	popa   
 244:	6d                   	ins    DWORD PTR es:[edi],dx
 245:	65 00 75 6e          	add    BYTE PTR gs:[ebp+0x6e],dh
 249:	73 69                	jae    2b4 <main-0x30ffd4c>
 24b:	67 6e                	outs   dx,BYTE PTR ds:[si]
 24d:	65 64 20 63 68       	gs and BYTE PTR fs:gs:[ebx+0x68],ah
 252:	61                   	popa   
 253:	72 00                	jb     255 <main-0x30ffdab>
 255:	63 6f 70             	arpl   WORD PTR [edi+0x70],bp
 258:	79 62                	jns    2bc <main-0x30ffd44>
 25a:	75 66                	jne    2c2 <main-0x30ffd3e>
 25c:	00 73 74             	add    BYTE PTR [ebx+0x74],dh
 25f:	65                   	gs
 260:	70 00                	jo     262 <main-0x30ffd9e>
 262:	73 68                	jae    2cc <main-0x30ffd34>
 264:	6f                   	outs   dx,DWORD PTR ds:[esi]
 265:	72 74                	jb     2db <main-0x30ffd25>
 267:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
 26a:	74 00                	je     26c <main-0x30ffd94>
 26c:	65                   	gs
 26d:	78 65                	js     2d4 <main-0x30ffd2c>
 26f:	63 70 00             	arpl   WORD PTR [eax+0x0],si
 272:	69 6e 70 75 74 00 75 	imul   ebp,DWORD PTR [esi+0x70],0x75007475
 279:	69 6e 74 33 32 5f 74 	imul   ebp,DWORD PTR [esi+0x74],0x745f3233
 280:	00 61 6e             	add    BYTE PTR [ecx+0x6e],ah
 283:	73 69                	jae    2ee <main-0x30ffd12>
 285:	53                   	push   ebx
 286:	65                   	gs
 287:	71 00                	jno    289 <main-0x30ffd77>
 289:	70 61                	jo     2ec <main-0x30ffd14>
 28b:	72 61                	jb     2ee <main-0x30ffd12>
 28d:	6d                   	ins    DWORD PTR es:[edi],dx
 28e:	73 00                	jae    290 <main-0x30ffd70>
 290:	65                   	gs
 291:	6d                   	ins    DWORD PTR es:[edi],dx
 292:	6f                   	outs   dx,DWORD PTR ds:[esi]
 293:	64                   	fs
 294:	65                   	gs
 295:	6c                   	ins    BYTE PTR es:[edi],dx
 296:	00 63 6d             	add    BYTE PTR [ebx+0x6d],ah
 299:	64                   	fs
 29a:	6c                   	ins    BYTE PTR es:[edi],dx
 29b:	69 6e 65 00 6d 61 78 	imul   ebp,DWORD PTR [esi+0x65],0x78616d00
 2a2:	61                   	popa   
 2a3:	72 67                	jb     30c <main-0x30ffcf4>
 2a5:	63 00                	arpl   WORD PTR [eax],ax
 2a7:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],bp
 2aa:	6d                   	ins    DWORD PTR es:[edi],dx
 2ab:	61                   	popa   
 2ac:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2ad:	64                   	fs
 2ae:	73 50                	jae    300 <main-0x30ffd00>
 2b0:	74 72                	je     324 <main-0x30ffcdc>
 2b2:	00 63 6f             	add    BYTE PTR [ebx+0x6f],ah
 2b5:	6d                   	ins    DWORD PTR es:[edi],dx
 2b6:	6d                   	ins    DWORD PTR es:[edi],dx
 2b7:	61                   	popa   
 2b8:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2b9:	64                   	fs
 2ba:	57                   	push   edi
 2bb:	61                   	popa   
 2bc:	73 46                	jae    304 <main-0x30ffcfc>
 2be:	72 6f                	jb     32f <main-0x30ffcd1>
 2c0:	6d                   	ins    DWORD PTR es:[edi],dx
 2c1:	54                   	push   esp
 2c2:	68 69 73 42 75       	push   0x75427369
 2c7:	66                   	data16
 2c8:	66                   	data16
 2c9:	65                   	gs
 2ca:	72 50                	jb     31c <main-0x30ffce4>
 2cc:	74 72                	je     340 <main-0x30ffcc0>
 2ce:	00 70 61             	add    BYTE PTR [eax+0x61],dh
 2d1:	64 31 00             	xor    DWORD PTR fs:[eax],eax
 2d4:	70 61                	jo     337 <main-0x30ffcc9>
 2d6:	64 32 00             	xor    al,BYTE PTR fs:[eax]
 2d9:	64 6f                	outs   dx,DWORD PTR fs:[esi]
 2db:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2dc:	65                   	gs
 2dd:	47                   	inc    edi
 2de:	65                   	gs
 2df:	74 74                	je     355 <main-0x30ffcab>
 2e1:	69 6e 67 4b 65 79 73 	imul   ebp,DWORD PTR [esi+0x67],0x7379654b
 2e8:	00 6c 43 75          	add    BYTE PTR [ebx+eax*2+0x75],ch
 2ec:	72 72                	jb     360 <main-0x30ffca0>
 2ee:	4b                   	dec    ebx
 2ef:	65                   	gs
 2f0:	79 43                	jns    335 <main-0x30ffccb>
 2f2:	6f                   	outs   dx,DWORD PTR ds:[esi]
 2f3:	75 6e                	jne    363 <main-0x30ffc9d>
 2f5:	74 00                	je     2f7 <main-0x30ffd09>
 2f7:	75 69                	jne    362 <main-0x30ffc9e>
 2f9:	6e                   	outs   dx,BYTE PTR ds:[esi]
 2fa:	74 38                	je     334 <main-0x30ffccc>
 2fc:	5f                   	pop    edi
 2fd:	74 00                	je     2ff <main-0x30ffd01>
 2ff:	70 61                	jo     362 <main-0x30ffc9e>
 301:	72 73                	jb     376 <main-0x30ffc8a>
 303:	65                   	gs
 304:	50                   	push   eax
 305:	61                   	popa   
 306:	72 61                	jb     369 <main-0x30ffc97>
 308:	6d                   	ins    DWORD PTR es:[edi],dx
 309:	73 53                	jae    35e <main-0x30ffca2>
 30b:	68 65 6c 6c 00       	push   0x6c6c65
 310:	6d                   	ins    DWORD PTR es:[edi],dx
 311:	61                   	popa   
 312:	69 6e 00 68 65 61 70 	imul   ebp,DWORD PTR [esi+0x0],0x70616568
 319:	45                   	inc    ebp
 31a:	6e                   	outs   dx,BYTE PTR ds:[esi]
 31b:	64 00 6b 53          	add    BYTE PTR fs:[ebx+0x53],ch
 31f:	68 65 6c 6c 00       	push   0x6c6c65

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
