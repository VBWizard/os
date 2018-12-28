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

#include <unistd.h>
#include "kshell.h"

bool timeToExit=false;
uint32_t exitCode=0;
char delim[6] = " \t\n-,";
char commandHistory[500][MAX_PARAM_WIDTH];
int commandHistoryPtr=0;
int commandHistoryMax=0;

void execInternalCommand(char lCommand[256]);
int findCommand(char* command);
char **buildargv (const char *input);

void execInternalCommand(char lCommand[256])
{
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
        print("\tInvalid command '%s' ya dummy!\n",lCommand);
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

void helpMe(char *cmdline)
{
    char* tok;
    
    tok=strtok(cmdline,delim);
/*    while (tok!=NULL)
    {
        print("\t%s",tok);
        tok=strtok(0,delim);
    }
*/    
    print("Help: %s\n",tok);
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
        if (tok!=NULL)
        {
            if (strncmp(tok,cmds[cnt].name,100)==0)
                print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        }
        else
            print("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
        
}

char** paramsToArgv(int pcount, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH])
{
    char** pptr=malloc(sizeof(char*)*pcount);
    
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

void execp(char* cmdline)
{
    bool background=false;
    uint32_t pid=0;
    char* tok;
    char* pgm=NULL;

    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    int execParamCount=0;
    int pcount=1;
    
    if (paramCount==0)
        return;
    
    tok=strtok(cmdline,delim);
    while (tok!=NULL)
    {
        if (strncmp(tok,"b",2)==0)
        {
            background=true;
            execParamCount++;
        }
        else if (pgm==NULL)
        {
            pgm=malloc(strlen(tok)+1);  //NOTE: +1 is for the terminating \0
            strcpy(pgm,tok);
        }
        pcount++;
        tok=strtok(0,delim);
    }
    
    char** prms=paramsToArgv(paramCount-execParamCount,&params[execParamCount][0]);

    print ("Executing %s\n",pgm);
    pid=exec(pgm,paramCount-execParamCount,prms);
    if (pid>0)
    {
        if (!background)
        {
            //print("DEBUG1: waitpid = %08X\n",&waitpid);
            waitpid(pid);
        }
    }
    else
        print("Error executing %s\n",pgm);
    //Its ok to free arguments now because they are copied by the kernel to pgm's memory
    freeArgV(paramCount-1, (char**)prms);       
    free(pgm);
}

void kSleep(char *cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);

    if (params[0][0]==0)
    {
        print("Requires 1 parameter which is the number of seconds to sleep\n");
        return;
    }
    //print("Sleeping for %u seconds\n",strtoul(params[0],0,10));
    sleep(strtoul(params[0],0,10));
}

void kExit(char *cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    if (parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT))
    {
        exitCode = strtoul(params[0],0,10);
    }
    else
        exitCode = 0;
    timeToExit=true;
}

void pwd()
{
    char* buf=malloc(512);
    print("%s\n",getcwd(buf,512));
    free(buf);
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
    print("%s> ",sExecutingProgram);
}

int reprintCommand(char* command)
{
    resetRow();
    prompt();
    print("%s",command);
 
}

int kShell(int argc, char** argv)
{
    char lCommand[256];
    uint8_t lCurrKey=0;
    int lCurrKeyCount=0;
    int commandWasFromThisBufferPtr=0;
    char ansiSeq[20];

    libc_init();
    
    ansiSeq[0]=0x1b;
    sKShellProgramName=malloc(1024);
    strcpy(sKShellProgramName,"kShell");
    strcpy(sExecutingProgram,sKShellProgramName);
    //puts("\nWelcome to kShell ... hang a while!\n");

    while (!timeToExit)
    {
getACommand:
        commandHistoryPtr = commandHistoryMax;
        commandWasFromThisBufferPtr = -1;
        lCurrKey=0;
        lCurrKeyCount=0;
        memset(lCommand,0,256);
        prompt();
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
        {
            gets(&lCurrKey,1,1);
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
                    reprintCommand(lCommand);
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
                if (commandHistoryPtr+1<=commandHistoryMax)
                {
                    strcpy(lCommand,commandHistory[++commandHistoryPtr]);
                    commandWasFromThisBufferPtr=commandHistoryPtr;
                    if (commandHistoryPtr>=commandHistoryMax)
                        commandWasFromThisBufferPtr=-1;
                    reprintCommand(lCommand);
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
                lCurrKeyCount--;
            }
             
            goto getAKey;
        }
        else if (lCurrKey==0xcd) //right
        {
        }
        else if (lCurrKey=='\b') //backspace
        {
            lCurrKeyCount--;
            lCommand[lCurrKeyCount]='\0';
            if (lCurrKeyCount>0)
            {
                //putc('\b');
                /*int lTemp=cursorGetPosY();

                cursorMoveTo(cursorGetPosX()-1,lTemp);
                putc('\t');
                cursorMoveTo(cursorGetPosX()-1,lTemp);*/
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa) //Enter
        {
            print("\n");
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
            reprintCommand(lCommand);
            //Reset pointer to command buffer so that this possibly modified command gets written as a new one
            commandWasFromThisBufferPtr=-1;
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
            goto getACommand;
        if (commandWasFromThisBufferPtr == -1)
            saveCommand(lCommand);
        int i = findCommand(lCommand);
        execInternalCommand(lCommand);
    }
    free(sKShellProgramName);
    return exitCode;
}
