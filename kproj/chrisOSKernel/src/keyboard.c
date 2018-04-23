#include <stdbool.h>
#include <stdint.h>
#include "printf.h"
#include "chrisos.h"
#include "memory.h"
#include "time_os.h"
#include "kbd.h"
#include "strings.h"
#include "charDev.h"

extern volatile char kTranslatedKeypress;
extern uint32_t kDebugLevel;
extern volatile char* kKbdBuffCurrTop;
extern volatile char* kKbdBuffCurrChar;

int gets(char* buffer, int len);

//file_operations_t fops;
//inode_t console_node={.i_dev=1,.i_mode=0};
//file_t console_file;

size_t readConsole (struct file * fptr, char *buffer, size_t size, uint64_t* whatever) 
{
    return gets(buffer,size);
}

size_t writeConsole(struct file * fptr, const char *buffer, size_t size, uint64_t *whatever)
{
    return printk(buffer);
}

void consoleWriteString(const char* buffer)
{
    size_t size=strlen(buffer);
    writeConsole(NULL,buffer,size,NULL);
}

void keyboardInit()
{
    //CLR 04/23/2018: Commented out because this references fs.h which we are modifying to make a VFS
    //console_file.f_inode=&console_node;
    //fops.read=readConsole;
    //fops.write=writeConsole;
    //console_file.fops=fops;
}


//Get a key from the keyboard buffer
//Curr moves when a key is put into the buffer
//Base moves when a key is taken from the buffer
uint8_t keyboardGetKeyFromBuffer()
{
    char lTemp=0;
    //If top > buffer address, there are new characters to be processed
    if (kKbdBuffCurrTop>(char*)KEYBOARD_BUFFER_ADDRESS)
    {
        //increment the current character pointer
        kKbdBuffCurrChar++;
        //get the character from the buffer
        lTemp=*kKbdBuffCurrChar;
        //If we've reached top, reset both char and top
        if (kKbdBuffCurrChar>=kKbdBuffCurrTop)
        {
            kKbdBuffCurrChar=(char*)KEYBOARD_BUFFER_ADDRESS;
            kKbdBuffCurrTop=(char*)KEYBOARD_BUFFER_ADDRESS;
        }
    }
    return lTemp;
}

char waitForKeyboardKey()
{
    printd(DEBUG_KEYBOARD_DRIVER,"buffer=%08X, char=%08X, top=%08X\t", KEYBOARD_BUFFER_ADDRESS, kKbdBuffCurrChar, kKbdBuffCurrTop);
    char lTemp=0;
    bool debugMsgPrinted=false;
    //CLR 02/19/2017 - Had to change the conditon because of modifications I made to how buffer & bufferbase are used.
    while (kKbdBuffCurrTop==(char*)KEYBOARD_BUFFER_ADDRESS)
    {
        if (!debugMsgPrinted)
        {
            debugMsgPrinted=true;
        }
        __asm__("sti\nhlt\n");
        waitTicks(1);
    }
    lTemp=keyboardGetKeyFromBuffer();
    printd(DEBUG_KEYBOARD_DRIVER,"got a key %u!\n", lTemp);
    return lTemp;
}

int gets(char* buffer, int len)
{
    volatile char inchar=0;
    int cnt=0;
    memset(buffer,0,len);
    while (1==1)
    {
        inchar=waitForKeyboardKey();
        if (inchar=='\b' && cnt>0)
        {
            buffer[cnt]=0;
            cnt--;
            puts("\b");
        }
        else if (inchar>0)
        {
            if (inchar==0x0a)
            {
                printk("%c",inchar);
                return cnt;
            }
            if (cnt<len-2)
            {
                printk("%c",inchar);
                buffer[cnt++]=inchar;
            }
        }
    }
}

char getc()
{
   int inchar=keyboardGetKeyFromBuffer();
   return inchar;
}
