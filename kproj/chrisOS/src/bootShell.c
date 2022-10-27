#include <stdbool.h>
#include "kbd.h"
#include "bootShell.h"
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
#include "i386/kPaging.h"
#include "charDev.h"


extern uint64_t kE820MemoryBytes;
extern bool kInitDone;
extern int kATADeviceInfoCount;

extern void dumpRegs();
extern void doNonPagingJump();
extern void doPagingJump();
extern int exec(char* fileName,int argc,char** argv);

extern int kSelectedDiskNum; 
extern int kSelectedPartNum;
char selectedDir[100];
char sExecutingProgram[100];
char sbootShellProgramName[100] = "bs";
struct mbr_t mbr;
HBA_PORT* port;
char programParams[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
char** lTemp;
extern char kBootCmd[];


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

void HIGH_CODE_SECTION displayGDTTable()
{
    dumpGDTTable();
}

void HIGH_CODE_SECTION displayIDTTable()
{
    dumpIDTTable();
}

void HIGH_CODE_SECTION displayTSSEntry(char *cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    if (params[0][0]==0)
    {
        printk("Requires 1 parameter which is the address of the TSS record\n");
        return;
    }
    displayTSS(strtoul(params[0],0,16));
    
}

void HIGH_CODE_SECTION QueryBDF(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];

    parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    //printk("Params: 0=%u, 1=%u, 2=%u",strtoul(params[0],0,16),strtoul(params[1],0,16),strtoul(params[2],0,16));
    pciQueryBDF(strtoul(params[0],0,16),strtoul(params[1],0,16),strtoul(params[2],0,16));
}

void HIGH_CODE_SECTION dumpV(char* cmdline)
{
    char newCmdLine[MAX_PARAM_WIDTH];
    strcpy(newCmdLine,cmdline);
    strcat(newCmdLine," v");
    dumpP(newCmdLine);
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
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);

    uintptr_t CR3;
    uintptr_t lAddress;
    printk("Param count = %u\n",paramCount);
    if (paramCount==2)
    {
        CR3=strtoul(params[0],0,16);
        lAddress=strtoul(params[1],0,16);
        printk("\tMapping based on CR3=0x%08X\n\tPD address=0x%08X, \n\tPD value=0x%08X, \n\tPT address=0x%08X, \n\tPT value=0x%08X\n\tPhysical Address=0x%08X\n",
                CR3,
                kPagingGet4kPDEntryAddressCR3(CR3,lAddress),
                kPagingGet4kPDEntryValueCR3(CR3,lAddress),
                kPagingGet4kPTEntryAddressCR3(CR3,lAddress),
                kPagingGet4kPTEntryValueCR3(CR3,lAddress),
                (kPagingGet4kPTEntryValueCR3(CR3,lAddress) & 0xFFFFF000) | (lAddress & 0x00000FFF));
    }
    else
    {
        lAddress=strtoul(params[0],0,16);
        printk("\tMapping based on current CR3\n\tPD address=0x%08X, \n\tPD value=0x%08X, \n\tPT address=0x%08X, \n\tPT value=0x%08X\n\tPhysical Address=0x%08X\n",kPagingGet4kPDEntryAddress(lAddress),kPagingGet4kPDEntryValue(lAddress),kPagingGet4kPTEntryAddress(lAddress),kPagingGet4kPTEntryValue(lAddress),(kPagingGet4kPTEntryValue(lAddress) & 0xFFFFF000) | (lAddress & 0x00000FFF));
    }
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
    printd(DEBUG_HARDDRIVE,"Parsing MBR for disk %u\n",kSelectedDiskNum);
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
    /*int paramCount=*/parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);

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
    /*int paramCount=*/parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    
    //printk("Kernel Debug: Listing of directory %s + %s\n",params[0],params[1]);
    
    fl_listdirectory(params[0]);
}

void HIGH_CODE_SECTION execCommand(char* cmdline)
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
   
    if (exec (params[0],paramCount,lTemp) < 0)
      printd(DEBUG_ELF_LOADER,"Load failed\n");
    strcpy(sExecutingProgram,sbootShellProgramName);
}

void HIGH_CODE_SECTION execInternalCommand(char lCommand[256])
{
    int foundCommand = findCommand(lCommand);

    if(foundCommand>0)
    {
        foundCommand--;
        //printk("Executing command # %u (%s)\n", i, cmds[i].name);
        command_function = cmds[foundCommand].function;
        command_function_p = cmds[foundCommand].function;
        if (cmds[foundCommand].paramCount==0)
            command_function();
        else
        {
            command_function_p(&lCommand[strlen(cmds[foundCommand].name)+1]);  
            printd(DEBUG_ELF_LOADER,"DONE!\n");
        }
    }
    else
    {
        printk("Invalid command '%s' ya dummy!\n",lCommand);
    }
}

void HIGH_CODE_SECTION bootShell()
{
    char lCommand[256];
    uint8_t lCurrKey=0;
    int lCurrKeyCount=0;
    char commands[50][50];
    int commandsPtr=0;
    int commandBuffPtr=0;
    int commandWasFromThisBufferPtr=0;
    strcpy(sExecutingProgram,sbootShellProgramName);
    puts("\nWelcome to bs ... hang a while!\n");
    if (kBootCmd[0]==0x0)
    {
        /*******************************************************/
        //CLR 02/23/2017 - Temporary code to execute commands on boot
//        char lcmd1[40]="disk 4";
//        execInternalCommand(lcmd1);
//        char lcmd2[40]="part 0";
//        execInternalCommand(lcmd2);
//        char lcmd3[40]="exec /kernel";
//        execInternalCommand(lcmd3);
        /*******************************************************/
    }    
    
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
            lCurrKey=waitForKeyboardKey();
        }
        //printk("key='%08X'",lCurrKey);
        if((byte)lCurrKey==0xc8) //up
        {
            if (commandBuffPtr>=0)
            {
                int lTemp=cursorGetPosY();
                strcpy(lCommand,commands[--commandBuffPtr]);
                commandWasFromThisBufferPtr=commandBuffPtr;
                cursorMoveTo(4,lTemp);
                printk("%s                     ",lCommand);
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
                lCurrKeyCount--;
            }
            goto getAKey;
        }
        if (lCurrKey=='\b')
        {
            if (lCurrKeyCount>0)
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
            goto doneGettingKeys;
        }
        else
        {
            lCommand[lCurrKeyCount++]=lCurrKey;
            putc(lCurrKey);
        }
        goto getAKey;
//        gets(lCommand,50);
doneGettingKeys:
        if (lCommand[0]==0x0)
            goto getACommand;
        int foundCommandBufferCommand = findCommand(lCommand);

        execInternalCommand(lCommand);
        if(foundCommandBufferCommand>0)
        {
            foundCommandBufferCommand--;
            //printk("Executing command # %u (%s)\n", i, cmds[i].name);
            if (commandWasFromThisBufferPtr)
            {
//                for (int cnt=commandWasFromThisBufferPtr;cnt<=commandsPtr;cnt++)
//                    strcpy(commands[cnt],commands[cnt+1]);
//                commandWasFromThisBufferPtr=0;
//                commandsPtr--;
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

