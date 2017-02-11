#include <stdbool.h>
#include <stdint.h>
#include "printf.h"
#include "chrisos.h"
#include "memory.h"
#include "time_os.h"

extern volatile char kTranslatedKeypress;
extern uint32_t kDebugLevel;
extern volatile char* kKeyboardBuffer;
extern volatile char* kKeyboardBufferBase;

//Get a key from the keyboard buffer
//Curr moves when a key is put into the buffer
//Base moves when a key is taken from the buffer
uint8_t keyboardGetKeyFromBuffer()
{
    char lTemp=0;
    //printd(DEBUG_KEYBOARD,"\nkKeyboardBuffer=0x%08X, kKeyboardBufferBase=0x%08X, &kKeyboardBufferBase=0x%08X\n",kKeyboardBuffer, kKeyboardBufferBase,&kKeyboardBufferBase);
    if (kKeyboardBufferBase<=kKeyboardBuffer)
    {
        __asm__("cli\n");
        lTemp=*kKeyboardBufferBase++;
        __asm__("sti\n");
    }
    if (kKeyboardBufferBase>kKeyboardBuffer)
    {
        __asm__("cli\n");
        kKeyboardBufferBase=(char*)KEYBOARD_BUFFER_ADDRESS;
        kKeyboardBuffer=(char*)KEYBOARD_BUFFER_ADDRESS-1;
        __asm__("sti\n");
    }
    return lTemp;
}

char waitForKeyboardKey()
{
    printd(DEBUG_KEYBOARD,"gKbd-W, %04X\t", kKeyboardBuffer);
    char lTemp=0;
    printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);

    while (kKeyboardBuffer==(char*)KEYBOARD_BUFFER_ADDRESS)
    {
        printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
        __asm__("sti\n");
        waitTicks(1);
    }
    lTemp=keyboardGetKeyFromBuffer();
    printd(DEBUG_KEYBOARD,"got a key %u!\n", lTemp);
    return lTemp;
}

char getKeyboardKey()
{
        return keyboardGetKeyFromBuffer();
}
void gets(char* buffer, int len)
{
    volatile char inchar=0;
    int cnt=0;
    memset(buffer,0,len);
    while (1==1)
    {
        inchar=getKeyboardKey();
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
                return;
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
   int inchar=getKeyboardKey();
   
   while (inchar==0)
   {
       inchar=getKeyboardKey();
        inchar=getKeyboardKey();
   }
   return inchar;
}
