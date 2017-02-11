#include <stdbool.h>
#include "kbd.h"
#include "bishell.h"
#include "strings.h"
#include "utility.h"
#include "memory.h"
#include "pci/pci.h"
#include "printf.h"
#include "io.h"
#include "init/ata_disk.h"
#include "ahci.h"
#include "filesystem.h"
#include "fat/fat_filelib.h"
#include "../include/elfloader.h"


extern uint64_t kE820MemoryBytes;
extern bool kInitDone;
extern int kATADeviceInfoCount;

extern void dumpRegs();
extern void doNonPagingJump();
extern void doPagingJump();

extern int kSelectedDiskNum; 
extern int kSelectedPartNum;
char selectedDir[100];
char sExecutingProgram[100];
char sbiShellProgramName[100] = "biShell";
struct mbr_t mbr;
HBA_PORT* port;
char programParams[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
char** lTemp;


int HIGH_CODE_SECTION findCommand(char* command)
{
    unsigned i;
    int ret;
    
    for(i = 0; i < NUMBER_OF_COMMANDS; i++)
    {
        ret = strncmp(command, cmds[i].name,strlen(cmds[i].name));
        //printk("findCommand compared %s and %s for %u, returned %u\n", command, cmds[i].name, strlen(cmds[i].name), ret);
        if(ret==0)
        {
            //printk("findCommand returning %u", i+1);
            return i+1;
        }
    }
    //printk("findCommand returning -1");
            return -1;
}

int HIGH_CODE_SECTION parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
    int x=0,y=0;
    int lRetVal=0,parsedChars=0;
    
    memset(params,0, size);
    //printk("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
    {
        //printk("c=%c\n", cmdLine[cnt]);
        if ( (cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',')
        {
            //printk("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //printk("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
    {
        lRetVal++;
        params[y][x]='\0';
    }
    //printk("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //printk("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
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
  //printk("buildargv: entering\n");
  
  if (input != NULL)
    {
      //printk("buildargv: command to parse (%u chars) is: '%s'\n",strlen (input) + 1,input);
      copybuf = (char *) mallocTemp (strlen (input) + 1);
      //printk("buildargv: copybuf=0x%08X\n",copybuf);
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
		  nargv = (char **) mallocTemp (maxargc * sizeof (char *));
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
                          //printk("Incremented input to %u, char=%u,value='%c'\n",input,*input,*input);
			}
		    }
		  input++;
		}
	    }
	  *arg = EOS;
          //printk("Found an EOS\n");
          if (copybuf[0]!='\0')
          {
            char* temp=mallocTemp(strlen(copybuf)+1);
            //printk("*malloc'd temp to 0x%08X for %u characters\n",temp,strlen(copybuf));
            //printk("Copied copybuf @ 0x%08X to temp @ 0x%08X\n",copybuf,temp);
            strcpy(temp,copybuf);
            copybuf = (char *) mallocTemp (strlen (input) + 1);
            argv[argc] = temp;
            //printk("set argv[%u] to 0x%08X\n",argc,temp);
            argc++;
            argv[argc] = NULL;
            input++;
          }
	}
      while (*input != EOS);
    }
  //printk("buildargv: exiting\n");
  return (argv);
}

void HIGH_CODE_SECTION QueryBDF(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    //printk("Params: 0=%u, 1=%u, 2=%u",strtoul(params[0],0,16),strtoul(params[1],0,16),strtoul(params[2],0,16));
    pciQueryBDF(strtoul(params[0],0,16),strtoul(params[1],0,16),strtoul(params[2],0,16));
}

void HIGH_CODE_SECTION dumpP(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    int lCount=0;
    uint32_t lAddress=0;
    char lCharType=' ', lCharSize=' ';
    int lTemp=0;
    char lTempS[MAX_PARAM_WIDTH];
    bool addrIsVirtual=false;
//    for (int cnt=0;cnt<paramCount;cnt++)
//        printk("Param # %u is %s\n", cnt, params[cnt]);
    
    memset(lTempS,0,MAX_PARAM_WIDTH);
    for (int cnt=0;cnt<=paramCount;cnt++)
    {
        //printk("Processing parameter %u, value='%s'\n",cnt,params[cnt]);
        if (params[cnt][0]=='v')
        {
            //printk("Address is virtual parameter found\n");
            addrIsVirtual=true;
        }
        else if (params[cnt][0]=='/')
        {
            lTemp=1;
            while (ISDIGIT(params[cnt][lTemp]))
            {
                lTempS[lTemp-1]=params[cnt][lTemp];
                lTemp++;
            }
            lCount=atoi(lTempS);
            lCharSize=params[cnt][lTemp++];
            lCharType=params[cnt][lTemp++];
        }
        else if (lAddress==0)
        {
            lAddress=strtoul(params[cnt],0,16);
        }
    }
//    if (addrIsVirtual)
//    {
//        printk("Converted 0x%08X to ",lAddress);
//        lAddress=__pa(lAddress);
//        printk("%0x%08X\n", lAddress);
//    }
    if (lCount>65535)
    {
        printk("Error: Count is too large (%u), max is 500, can't dump", lCount);
        return;
    }
    if (lCharSize!='b' && lCharSize!='h' && lCharSize!='w' && lCharSize!='d')
    {
        printk("Error: Character size (%c) must be in bhwd", lCharSize);
        return;
    }
    if (lCharType!='x' && lCharType!='c' && lCharType!='e')
    {
        printk("Error: Character type (%c) must be in xce", lCharType);
        return;
    }
/*    if ((lAddress>kE820MemoryBytes || lAddress+lCount>kE820MemoryBytes) && (!addrIsVirtual))
    {
        printk("Error: Requested address (0x%08X) or address+count (0x%08X) > memory size ()", lAddress, lAddress+lCount);
        return;
    }*/
    printk("dumpP: Dumping %u %c (%c) from 0x%08X%s\n", lCount, lCharSize , lCharType, lAddress, addrIsVirtual?"(v)":"");;
    uint8_t* mem=(uint8_t*)lAddress;
    uint16_t* memw=(uint16_t*)lAddress;
    uint32_t* memd=(uint32_t*)lAddress;
    uint32_t* memq=(uint32_t*)lAddress;
    int lineCount=0;
    int lEntriesPerLine;
    if (lCharSize=='b')
        lEntriesPerLine=15;
    if (lCharSize=='h')
        lEntriesPerLine=8;
    else if (lCharSize=='w')
        lEntriesPerLine=4;
    else
        lEntriesPerLine=3;
    lTemp=0; //column
    if (!addrIsVirtual)
    {
        //NOTE: Have to include SS here, as code below uses ebp references which implies SS
        SWITCH_TO_NON_KERNEL_DATA_AND_STACK
        __asm__("cli\n");
        doNonPagingJump();
        //printk("Switching to 0 based GDT entry for DS,ES,FS,GS,SS\n");
    }
    if (lCharSize=='b')
    {
        printk("%08X:\t", &mem[0]);
        for (int cnt=0;cnt<lCount;cnt++)
        {
            if (lTemp==16)
            {
                puts("\t");
                for (int cnt2=0;cnt2<16;cnt2++)
                {
                    if (ISALPHA(lTempS[cnt2]) || ISDIGIT(lTempS[cnt2]) || (lTempS[cnt2]>=32&&lTempS[cnt2]<=47) || (lTempS[cnt2]>=123&&lTempS[cnt2]<=126) || (lTempS[cnt2]>=91&&lTempS[cnt2]<=96))
                        printk("%c",lTempS[cnt2]);
                    else
                        puts(".");
                }
                puts("\n");
                if (++lineCount==SYS_VGA_HEIGHT-1)
                {
                    if (pauseDisplay(true))
                        break;
                    lineCount=0;
                }
                printk("%08X:\t", &mem[cnt]);
                lTemp=0;
            }
            printk("%02X ",mem[cnt]);
            lTempS[lTemp++]=mem[cnt];
        }
    }
    else
        printk("%08X:", &memw[0]);
        for (int cnt=0;cnt<lCount;cnt++)
        {
            if (lTemp==lEntriesPerLine)
            {
                puts("\n");
                if (++lineCount==SYS_VGA_HEIGHT-1)
                {
                    if (pauseDisplay(true))
                        break;
                    lineCount=0;
                }
                lTemp=0;
                if (lCharSize=='h')
                    printk("%08X:", &memw[cnt]);
                else if (lCharSize=='w')
                    printk("%08X:", &memd[cnt]);
                else
                    printk("%08X:", &memq[cnt]);
            }
            if (lCharSize=='h')
                printk("%04X ",memw[cnt]);
            else if (lCharSize=='w')
                printk("%08X ", memd[cnt]);
            lTemp++;
        }
    puts("\n");
    if (!addrIsVirtual)
    {
       __asm__("mov eax,cr0\n or eax,0x80000000\n mov cr0,eax\n");
       doPagingJump();
        SWITCH_TO_KERNEL_DATA_AND_STACK
        __asm__("sti\n");
    }
}

void HIGH_CODE_SECTION dumpV(char* cmdline)
{
    strcat(cmdline," v");
    dumpP(cmdline);
}

void HIGH_CODE_SECTION helpMe()
{
    printk("Help:\n");
    for (unsigned cnt=0;cnt<sizeof(cmds)/sizeof(command_table_t);cnt++)
        printk("\t%s: %s\n", cmds[cnt].name, cmds[cnt].description);
}

void HIGH_CODE_SECTION inPortB(char* cmdline)
{
     char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
   parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
   
   uint8_t inVal=inb(strtoul(params[0],0,16));
   printk("0x%02X\n",inVal);
}

void HIGH_CODE_SECTION inPortW(char* cmdline)
{
     char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
   parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
   
   uint8_t inVal=inw(strtoul(params[0],0,16));
   printk("0x%04X\n",inVal);
}

void HIGH_CODE_SECTION inPortD(char* cmdline)
{
     char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
   parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
   
   uint8_t inVal=inl(strtoul(params[0],0,16));
   printk("0x%08X\n",inVal);
}

void HIGH_CODE_SECTION outPortB(char* cmdline)
{
     char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
   parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
   
   outb(strtoul(params[0],0,16),strtoul(params[1],0,16));
}

void HIGH_CODE_SECTION outPortW(char* cmdline)
{
     char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
   parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
   
   outw(strtoul(params[0],0,16),strtoul(params[1],0,16));
}

void HIGH_CODE_SECTION outPortD(char* cmdline)
{
     char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
   parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
   
   outl(strtoul(params[0],0,16),strtoul(params[1],0,16));
}

void HIGH_CODE_SECTION writeBytes(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);

    uint8_t* bytes=(uint8_t*)strtoul(params[0],0,16);
    bytes[0]=strtoul(params[1],0,16);
}

void HIGH_CODE_SECTION writeWords(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);

    uint16_t* words=(uint16_t*)strtoul(params[0],0,16);
    words[0]=strtoul(params[1],0,16);
}

void HIGH_CODE_SECTION writeDWords(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);

    uint32_t* dwords=(uint32_t*)strtoul(params[0],0,16);
    dwords[0]=strtoul(params[1],0,16);
}

void HIGH_CODE_SECTION showMapping(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);

    uintptr_t lAddress=strtoul(params[0],0,16);
    printk("\tPD address=0x%08X, \n\tPD value=0x%08X, \n\tPT address=0x%08X, \n\tPT value=0x%08X\n\tPhysical Address=0x%08X\n",kPagingGet4kPDEntryAddress(lAddress),kPagingGet4kPDEntryValue(lAddress),kPagingGet4kPTEntryAddress(lAddress),kPagingGet4kPTEntryValue(lAddress),(kPagingGet4kPTEntryValue(lAddress) & 0xFFFFF000) | (lAddress & 0x00000FFF));
}

void HIGH_CODE_SECTION selectHDNum (char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int lTemp=0;
    parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);

    lTemp =strtol(params[0],0,10);
 
    if (lTemp<0 || lTemp>kATADeviceInfoCount)
        printk("Error, selected disk number (%u) is not valid.  It must be >=0 and <= %u\n",lTemp,kATADeviceInfoCount);
    else
        kSelectedDiskNum=lTemp;
    parseMBR(&kATADeviceInfo[kSelectedDiskNum],&mbr);
    printk("Disk %u selected\n",kSelectedDiskNum);
}

void HIGH_CODE_SECTION listParts(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    int driveNo=-1;

    if (paramCount>0)
        driveNo=strtol(params[0],0,10);
    else
        driveNo=kSelectedDiskNum;
    if (driveNo<0 || driveNo>kATADeviceInfoCount)
    {
        printk("Error, selected disk number (%u) is not valid.  It must be >=0 and <= %u\n",driveNo,kATADeviceInfoCount);
        return;
    }
    printk("Partitions for disk # %u\n",driveNo);
    port=(HBA_PORT*)kATADeviceInfo[driveNo].ioPort;
    if (kATADeviceInfo[driveNo].ATADeviceType != ATA_DEVICE_TYPE_SATA_HD)
    {
        printk("Invalid device type.  Only SATA disks can be listed at the moment\n");
        return;
    }
    parseMBR(&kATADeviceInfo[driveNo],&mbr);
    printMBR(&mbr);
}

void HIGH_CODE_SECTION selectPart(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int lTemp=-1;
    if (kSelectedDiskNum==-1)
    {
        printk("You must select a disk with 'disk' before selecting a partition");
    }
    parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);

    lTemp =strtol(params[0],0,10);
    //printk("parameter 1=%u\n",lTemp);
    if (lTemp<0 || lTemp>mbr.partCount)
    {
        printk("Error, selected partition number (%u) is not valid.  It must be >=1 and <=%u\n",lTemp,mbr.partCount);
        return;
    }
    if (mbr.parts[lTemp].partTotalSectors==0)
    {
        printk("Error, selected partition (number %u) is not a valid partition as its total sector count is 0.",lTemp);
        printMBR(&mbr);   
        return;
    }
    kSelectedPartNum = lTemp;
    ahciSetCurrentPart(mbr.parts[lTemp]);
    //printk("Partition %u selected\n",kSelectedPartNum);
    attach("");
}

void HIGH_CODE_SECTION attach(char* cmdline)
{
     char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);

    if (kSelectedDiskNum < 0 || kSelectedPartNum < 0)
    {
        printk("Must first select a disk (%u) and a partition (%u) using 'selectpart'",kSelectedDiskNum,kSelectedPartNum);
    }
    strcpy(selectedDir,"/");
    ahciSetCurrentDisk((HBA_PORT*)kATADeviceInfo[kSelectedDiskNum].ioPort);
    int lRetVal=fl_attach_media((fn_diskio_read)ahciBlockingRead28, (fn_diskio_write)ahciBlockingWrite28);
    if (lRetVal!=0)
    {
        printk("Error attaching to disk %u, partition %u.  Error number %u",kSelectedDiskNum,kSelectedPartNum,lRetVal);
        return;
    }
    printk("Attached to disk %u, partition %u.\n",kSelectedDiskNum,kSelectedPartNum);
    
    //fl_listdirectory(selectedDir);
}

void HIGH_CODE_SECTION listDir(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    
    //printk("Kernel Debug: Listing of directory %s + %s\n",params[0],params[1]);
    
    fl_listdirectory(params[0]);
}

void HIGH_CODE_SECTION execProgram(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);

    
    strcpy(sExecutingProgram,params[0]+1);
    //printk("execProgram: param count = %u\n",paramCount);

    lTemp=buildargv(cmdline);
//    printk("executed buildargv\n");

//    printk("listing parameters:\n");
//    for (int cnt=0;cnt<paramCount;cnt++)
//        printk("%u = '%s'\n",cnt,lTemp[cnt]);
   
    exec (params[0],paramCount,lTemp);
    strcpy(sExecutingProgram,sbiShellProgramName);
}

void HIGH_CODE_SECTION biShell()
{
    char lCommand[256];
    unsigned lCurrKey=0;
    int lCurrKeyCount=0;
    char commands[50][50];
    int commandsPtr=0;
    int commandBuffPtr=0;
    int commandWasFromThisBufferPtr=0;
    bool stopCountingKeys=false;
    strcpy(sExecutingProgram,sbiShellProgramName);
    puts("\nWelcome to biShell ... hang a while!\n");
    while (1==1)
    {
getACommand:
        lCurrKey=0;
        lCurrKeyCount=0;
        memset(lCommand,0,256);
        printk("%s> ",sExecutingProgram);
getAKey:
        lCurrKey=0;
        while(lCurrKey==0)
        {
            __asm__("sti\nhlt\n");
            lCurrKey=getKeyboardKey();
        }
        //printk("key='%08X'",lCurrKey);
        if(lCurrKey==0xc8) //up
        {
            if (commandBuffPtr>=0)
            {
                int lTemp=cursorGetPosY();
                strcpy(lCommand,commands[--commandBuffPtr]);
                commandWasFromThisBufferPtr=commandBuffPtr;
                cursorMoveTo(4,lTemp);
                printk("%s                                                                                ",lCommand);
                lCurrKeyCount=strlen(lCommand);
                cursorMoveTo(4+lCurrKeyCount,lTemp);
                goto getAKey;
            }
            else
                goto getAKey;
        }
        if (lCurrKey==0xD0)  //down
        {
            if (commandBuffPtr<=commandsPtr)
            {
                int lTemp=cursorGetPosY();
                strcpy(lCommand,commands[++commandBuffPtr]);
                commandWasFromThisBufferPtr=commandBuffPtr;
                cursorMoveTo(4,lTemp);
                printk("%s                                                                                ",lCommand);
                lCurrKeyCount=strlen(lCommand);
                cursorMoveTo(4+lCurrKeyCount,lTemp);
                goto getAKey;
            }
            else
                goto getAKey;
            
        }   
        if (lCurrKey==0xcb) //left
        {
            if (cursorGetPosX()>4)
            {
                cursorMoveTo(cursorGetPosX()-1,cursorGetPosY());
                stopCountingKeys=true;
            }
            goto getAKey;
        }
        if (lCurrKey=='\b')
        {
            if (lCurrKeyCount>=0)
            {
                int lTemp=cursorGetPosY();

                lCommand[lCurrKeyCount]=' ';
                lCurrKeyCount--;
                cursorMoveTo(cursorGetPosX()-1,lTemp);
                putc(' ');
                cursorMoveTo(cursorGetPosX()-1,lTemp);
            }
            else
                goto getAKey;
        }
        else if (lCurrKey==0xa)
        {
            putc(lCurrKey);
            lCommand[lCurrKeyCount++]='\0';
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
            if (stopCountingKeys)
                    lCurrKeyCount--;
            putc(lCurrKey);
        }
        stopCountingKeys=false;
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
            goto getACommand;
        int i = findCommand(lCommand);

        if(i>0)
        {
            i--;
            //printk("Executing command # %u (%s)\n", i, cmds[i].name);
            command_function = cmds[i].function;
            command_function_p = cmds[i].function;
            if (cmds[i].paramCount==0)
                command_function();
            else
            {
                command_function_p(&lCommand[strlen(cmds[i].name)+1]);  
            }
            if (commandWasFromThisBufferPtr)
            {
                for (int cnt=commandWasFromThisBufferPtr;cnt<=commandsPtr;cnt++)
                    strcpy(commands[cnt],commands[cnt+1]);
                commandWasFromThisBufferPtr=0;
                commandsPtr--;
            }
            strcpy(commands[commandsPtr++],lCommand);
            commandBuffPtr=commandsPtr;
        }
        else
        {
            printk("Invalid command '%s' ya dummy!\n",lCommand);
        }
    }
}

