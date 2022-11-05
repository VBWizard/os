/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on March 23, 2017, 7:34 PM
 */

#include "kshell.h"

char commandHistory[500][MAX_PARAM_WIDTH];
int commandHistoryPtr=0;
int commandHistoryMax=0;
char lCommand[256];
char **kCmdline;
int findCommand(char* command);
char **buildargv (const char *input);
bool echoInput;

void preprocessCmd(char *command)
{
    
}

void execCmds(char **cmds)
{
    char **lcmds = cmds;
    
    while (*lcmds)
    {
        execInternalCommand(*lcmds);
        lcmds++;
    }
}

//Parse individual commandline (look for pipes)
char** parseCmds(char *command)
{
    char delims[3] = ";";
    char **cmds;
    char *ltemp=command; //malloc(1024);
    int lCommandPtr=0;
    char *cmd;
    char cmdptr=0;
    char *cmdbegin=command;

    memset(kCmdline,0,CMDLINE_BUFFER_SIZE);

    ltemp=command;
    
    //Find ; or | which both separate commands
    while (1==1)
    {
        if (*ltemp==';' || *ltemp=='|' || *ltemp==0)
        {
            kCmdline[cmdptr]=kCmdline+(PARSE_CMD_COUNT*4) + (cmdptr*CMDLINE_MAX_SIZE);
            
            if (*ltemp=='|')
                strncpy(kCmdline[cmdptr++],cmdbegin,(uint32_t)ltemp-(uint32_t)cmdbegin+1);
            else
                strncpy(kCmdline[cmdptr++],cmdbegin,(uint32_t)ltemp-(uint32_t)cmdbegin);
            if (*ltemp=='\0')
                break;
            cmdbegin=ltemp+1;
        }
        ltemp++;
    }

    return kCmdline;
}

void execInternalCommand(char lCommand[256])
{
    strtrim(lCommand);
    int i = findCommand(lCommand);

    if(i>0)
    {
        i--;
        //print("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[i].function;
        command_function_p = cmds[i].function;
        if (cmds[i].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[i].name)+1]);  //NOTE: Remove & and "[strlen(cmds[i].name)+1]" to add command to the parameters
        }
    }
    else
    {
        //print("\tInvalid command '%s' ya dummy!\n",lCommand);
        cmdExecp(lCommand);
    }
}

int parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
    int x=0,y=0;
    int lRetVal=0,parsedChars=0;
    bool needDoubleQuotetoEndParam=0;
    
    memset(params,0, size);
    //print("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
    {
        if(cmdLine[cnt]=='"')
        {
            if (!needDoubleQuotetoEndParam)
            {
                needDoubleQuotetoEndParam=true;
            }
            else
            {
                params[y][x]='\0';
                {x=0;y++;lRetVal++;}
                needDoubleQuotetoEndParam=false;
            }
        }
        else if ( ((cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',') && !needDoubleQuotetoEndParam)
        {
            //print("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //print("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
    {
        lRetVal++;
        params[y][x]='\0';
    }
    //print("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //print("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
}

int findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
        //print("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
        {
            //print("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //print("findCommand returning -1");
            return -1;
}

/*parts from http://*/
char **buildargv (const char *input)
{
  char *arg;
  char *copybuf;
  int squote = 0;
  int dquote = 0;
  int bsquote = 0;
  int argc = 0;
  int maxargc = 0;
  char **argv = NULL;
  char **nargv;
  //print("buildargv: entering\n");
  
  if (input != NULL)
    {
      //print("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) malloc (strlen (input) + 1);
      //print("buildargv: copybuf=0x%08X\n",copybuf);
      /* Is a do{}while to always execute the loop once.  Always return an
	 argv, even for null strings.  See NOTES above, test case below. */
      do
	{
	  /* Pick off argv[argc] */

	  if ((maxargc == 0) || (argc >= (maxargc - 1)))
	    {
	      /* argv needs initialization, or expansion */
	      if (argv == NULL)
		{
		  maxargc = INITIAL_MAXARGC;
		  nargv = (char **) malloc (maxargc * sizeof (char *));
		}
	      argv = nargv;
	      argv[argc] = NULL;
	    }
	  /* Begin scanning arg */
	  arg = copybuf;
	  while (*input != EOS)
	    {
	      if ((*input)==' ' && !squote && !dquote && !bsquote)
		{
		  break;
		}
	      else
		{
		  if (bsquote)
		    {
		      bsquote = 0;
		      *arg++ = *input;
		    }
		  else if (*input == '\\')
		    {
		      bsquote = 1;
		    }
		  else if (squote)
		    {
		      if (*input == '\'')
			{
			  squote = 0;
			}
		      else
			{
			  *arg++ = *input;
			}
		    }
		  else if (dquote)
		    {
		      if (*input == '"')
			{
			  dquote = 0;
			}
		      else
			{
			  *arg++ = *input;
			}
		    }
		  else
		    {
		      if (*input == '\'')
			{
			  squote = 1;
			}
		      else if (*input == '"')
			{
			  dquote = 1;
			}
		      else
			{
			  *arg++ = *input;
                          //print("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
          //print("Found an EOS\n");
          if (copybuf[0]!='\0')
          {
            char* temp=malloc(strlen(copybuf)+1);
            //print("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //print("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
            free(copybuf);
            copybuf = (char *) malloc (strlen (input) + 1);
            argv[argc] = temp;
            //print("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
            argv[argc] = NULL;
            input++;
            free(temp);
          }
	}
      while (*input != EOS);
    }
  //print("buildargv: exiting\n");
  free(copybuf);
  free(nargv);
  return (argv);
}

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], char** pptr)
{
    for (int cnt=0;cnt<pcount;cnt++)
    {
        pptr[cnt]=malloc(MAX_PARAM_WIDTH);
        memcpy(pptr[cnt],&params[cnt],MAX_PARAM_WIDTH);
    }
    return pptr;
}

void freeArgV(int pcount, char **params)
{
    for (int cnt=0;cnt<pcount;cnt++)
        free(*params);
    free(params);
}

/*void getDate()
{
    struct tm theDate;
    
    
}
*/

void saveCommand(char* command)
{
    strcpy(commandHistory[commandHistoryMax++],command);
}

void prompt()
{
    print("%s$ ",cwd);
}

int reprintCommand(char* command)
{
    resetRow();
    prompt();
    print("%s",command);
 
}

int handleSignals(int signal)
{
    switch (signal)
    {
        case SIGINT:
            bSigIntReceived = true;
            break;
    }
}

int processSignal(int signal)
{
    switch (signal)
    {
        case SIGINT:
            //printf("^C\n");
            bSigIntReceived = false;
            return SIGINT;
            break;
    }
    return 0;
}

void kInit(int **initFile)
{
    execPipes[0]=0;
    execPipes[1]=0;
    kCmdline = malloc(CMDLINE_BUFFER_SIZE);  //Possibility of 25 chained commands
    bSigIntReceived = false;
    exitCode = 0;
    timeToExit = false;
    strcpy(delim," \t\n-,");
    sKShellProgramName=malloc(1024);
    strcpy(sKShellProgramName,"kShell");
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");
    modifySignal(SIGINT, handleSignals, 0);
    fstat_t fstat;
    memset(&fstat,0,sizeof(fstat_t));
//    int retVal = stat("/.krc",&fstat);
//    if(retVal != -1 && fstat.st_size>0);
//    {
//        *initFile=open("/.krc","r");
//    }
    
}

int kShell(int argc, char** argv, char** envp)
{
    uint8_t lCurrKey=0;
    int lCurrKeyCount=0;
    int commandWasFromThisBufferPtr=0;
    char ansiSeq[20];
    int *inputFile=STDIN_FILE;
    int *initFile=NULL;
    
    echoInput=true;
    if (argc>1)
    {
        inputFile=open(argv[1],"r");
        if (!inputFile)
        {
            printf("Cannot open script file %s",argv[1]);
            return -1;
        }
        echoInput=false;
    }

    environmentLoc = envp;
    ansiSeq[0]=0x1b;
    kInit(&initFile);
    
    while (!timeToExit)
    {
getACommand:
        commandHistoryPtr = commandHistoryMax;
        commandWasFromThisBufferPtr = -1;
        lCurrKey=0;
        lCurrKeyCount=0;
        memset(lCommand,0,256);
        getenv("CWD",cwd);
        if (!initFile)
            prompt();
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
        {
            int retVal=0;
            if (initFile)
            {
                echoInput=false;
                retVal=read(initFile, &lCurrKey, 1, 1);
                if (!retVal)
                {
                    close(initFile);
                    initFile=0;
                    echoInput=true;
                    prompt();
                    retVal=read(inputFile, &lCurrKey, 1, 1);
                }
            }
            else
                //Reading from STDIN blocks until a key is available.  It will only return 0 when STDIN is redirected to a file
                retVal=read(inputFile, &lCurrKey, 1, 1);
            if (retVal==0)
            {
                timeToExit=true;
                break;
            }
            if (bSigIntReceived)
            {
                if (processSignal(SIGINT)==SIGINT)
                {
                    lCommand[0] = 0x0;
                    lCurrKeyCount = 0;
                    if (echoInput)
                    {
                        printf("\n");
                        prompt();
                    }
                }
            }
        }
        //print("key='%08X'",lCurrKey);
        if((unsigned short)lCurrKey==0xc8) //up
        {
            if (commandHistoryPtr>=0)
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr-1>=0)
                {
                    strcpy(lCommand,commandHistory[--commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
                    lCurrKeyCount=strlen(lCommand);
                }
                goto getAKey;
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xD0)  //down
        {
            if (commandHistoryPtr>=0)
            {
                //int lTemp=cursorGetPosY();
                if (commandHistoryPtr+1<commandHistoryMax)
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    while (lCurrKeyCount>0)
                    {
                        printf(KEY_BACKSPACE);
                        lCurrKeyCount--;
                    }
                    printf("%s",lCommand);
                    lCurrKeyCount=strlen(lCommand);
                }
                goto getAKey;
            }
            else
                goto getAKey;
        }   
        else if (lCurrKey==0xcb) //left
        {
            if (lCurrKeyCount>0)
            {
                print("\033[1D");
            }
             
            goto getAKey;
        }
        else if (lCurrKey==0xcd) //right
        {
            print("\033[1C");
        }
        else if (lCurrKey=='\b') //backspace
        {
            if (lCurrKeyCount-1 >= 0)
            {
                lCurrKeyCount--;
                lCommand[lCurrKeyCount]='\0';
                printf(KEY_BACKSPACE);
            }
        }
        else if (lCurrKey==0xa) //Enter
        {
            if (echoInput)
                print("\n");
            goto doneGettingKeys;
        }
        else if (lCurrKey==0x0)
        {
            lCommand[0]=0x0;
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
            //reprintCommand(lCommand);
            if (echoInput)
                printf("%c",lCurrKey);
            //Reset pointer to command buffer so that this possibly modified command gets written as a new one
            commandWasFromThisBufferPtr=-1;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]!=0x0)
        {
            if (commandWasFromThisBufferPtr == -1)
                saveCommand(lCommand);
            int i = findCommand(lCommand);
            execCmds(parseCmds(lCommand));
        }
    }
    free(sKShellProgramName);
    if (inputFile!=STDIN_FILE)
        close(inputFile);
    if (kCmdline)
        free(kCmdline);
    return exitCode;
}
