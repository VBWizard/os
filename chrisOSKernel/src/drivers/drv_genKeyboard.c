/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "kernel.h"
#include "../../../chrisOS/include/chrisos.h"
#include "printf.h"
#include "drv_genKeyboard.h"
#include "i386/irqHandlers.h"
#include "charDev.h"
#include "kbd.h"

#define KEYB_DATA_PORT 0x60
#define KEYB_CTRL_PORT 0x61

unsigned volatile char kKeyChar=0;
unsigned volatile char kKeyStatus[11];
extern volatile char* kKbdBuffCurrTop;
extern volatile uint32_t kDebugLevel;
extern volatile uint32_t exceptionErrorCode;
extern volatile uint16_t exceptionNumber;
extern volatile uint32_t exceptionCS;
extern volatile uint32_t exceptionEIP;
extern volatile uint32_t exceptionFlags;
extern volatile uint32_t exceptionCR2;
extern volatile uint32_t *exceptionSavedStack;
extern volatile uint32_t exceptionSavedESP;
extern volatile uint32_t* kTicksSinceStart;
extern void* keyboardHandlerRoutine;
extern struct idt_entry* idtTable;
extern void vector21();
uint32_t kbdTop=KEYBOARD_BUFFER_ADDRESS+KEYBOARD_BUFFER_SIZE;

void kbd_handler_generic()
{
    unsigned char lKeyControlVal=0;
    unsigned char rawKey=0;
    unsigned char translatedKeypress=0;
   
    rawKey = inb(KEYB_DATA_PORT);
    kKeyChar = rawKey;//& 0x80;

    switch(rawKey)  
    {
        case KEY_SHIFT_DN: kKeyStatus[INDEX_SHIFT]=1;break;
        case KEY_SHIFT_UP: kKeyStatus[INDEX_SHIFT]=0;break;
        case KEY_CTRL_DN: kKeyStatus[INDEX_CTRL]=1;break;
        case KEY_CTRL_UP: kKeyStatus[INDEX_CTRL]=0;break;
        case KEY_ALT_DN: kKeyStatus[INDEX_ALT]=1;break;
        case KEY_ALT_UP: kKeyStatus[INDEX_ALT]=0;break;
        case KEY_CAPSLOCK_UP: kKeyStatus[INDEX_CAPSLOCK]=!kKeyStatus[INDEX_CAPSLOCK];break;
//        case MAKE_RIGHT: kKeyStatus[INDEX_RIGHT]=0;break;
//        case MAKE_LEFT: kKeyStatus[INDEX_LEFT]=0;break;
//        case MAKE_UP: kKeyStatus[INDEX_UP]=0;break;
//        case MAKE_DOWN: kKeyStatus[INDEX_DOWN]=0;break;
       default:
//printk("%02X",rawKey);
           //changed from if rawkey & 0x80, so that keydown triggers the key being input
           if (rawKey==BREAK_RIGHT || rawKey==BREAK_LEFT || rawKey==BREAK_UP || rawKey==BREAK_DOWN)
               if (kKbdBuffCurrTop<(char*)KEYBOARD_BUFFER_ADDRESS+KEYBOARD_BUFFER_SIZE && !kKeyStatus[INDEX_ALT])
               //CLR 01/10/2017: Increment the buffer pointer first
               {    
                   kKbdBuffCurrTop++;
                   *kKbdBuffCurrTop=rawKey;
               }
           if (!(rawKey & 0x80))
           {
                //rawKey &= 0x7f;
               //printk("%02X",rawKey); 48=up, 50=down
                 if (kKeyStatus[INDEX_SHIFT] || kKeyStatus[INDEX_CAPSLOCK])
                 {
                     translatedKeypress=keyboard_map_up[rawKey];
                 }
                 else
                     translatedKeypress=keyboard_map[rawKey];
#ifndef DEBUG_NONE
//                 if ((kDebugLevel & DEBUG_KEYBOARD) == DEBUG_KEYBOARD)
//                 {
//                      printf("%u, %u, %c\n",kKeyChar, rawKey, translatedKeypress);
//                 }
#endif
                if (kKeyStatus[INDEX_CTRL])
                {
                    printk("^");
                    translatedKeypress-=32;
                }
                 
                 if (translatedKeypress==124)
                     translatedKeypress=34;
            if (kKbdBuffCurrTop<(char*)KEYBOARD_BUFFER_ADDRESS+KEYBOARD_BUFFER_SIZE && !kKeyStatus[INDEX_ALT])
            {
                //CLR 01/10/2017: Increment the buffer pointer first
                {   
                    kKbdBuffCurrTop++;
                    *kKbdBuffCurrTop=translatedKeypress;
                }
#ifndef DEBUG_NONE
                 if ((kDebugLevel & DEBUG_KEYBOARD) == DEBUG_KEYBOARD)
                 {
                    printk("kbd_handler: %c-(%08X)\n",translatedKeypress, kKbdBuffCurrTop);
                    cursorSavePosition();
                    cursorMoveTo(78,0);
                    printk("%c",'k');
                    cursorRestorePosition();
                 }
#endif
            }
            else
            {
#ifndef DEBUG_NONE
                if ((kDebugLevel & DEBUG_KEYBOARD) == DEBUG_KEYBOARD)
                {
                    printk("noRoomForKey: %c\n",kKbdBuffCurrTop);
                    cursorSavePosition();
                    cursorMoveTo(78,0);
                    printk("%c",'K');
                    cursorRestorePosition();
                }
#endif
            }
                 //Debug
                 if (kKeyStatus[INDEX_ALT] && translatedKeypress==0x6A)
                 {
                     //__asm("int 0x3");
                     //kKbdHandlerActivateDebugger=true;
                 }
            if (kKeyStatus[INDEX_ALT] && kKeyStatus[INDEX_CTRL] && translatedKeypress==0xE0)
            {
                translatedKeypress=0;
                reboot(false);
            }
            if (kKeyStatus[INDEX_ALT])
            {
                if (translatedKeypress=='c')
                {
                    printk("%u",*kTicksSinceStart);
                    printk("-%c-%04X:%08X",(exceptionFlags & 0x200)==0x200?'I':'i',exceptionCS, exceptionEIP);
                }
                if (translatedKeypress=='b')
                {/*
                    cursorSavePosition();
                    gmtime_r((time_t*)&kSystemCurrentTime,&theDateTime);
                    strftime((char*)&currTime, 50, "%m/%d/%Y %H:%M:%S", &theDateTime);
                    cursorMoveTo(0,SYS_VGA_HEIGHT-1);
                    printk("The time is currently %s", &currTime);
                    cursorMoveTo(65,SYS_VGA_HEIGHT-1);
                    printk("ticks=%d", *kTicksSinceStart);
                    cursorRestorePosition();*/
                }
                if (translatedKeypress=='d')
                {
                    printDumpedRegs();
                }
                if (translatedKeypress=='e')
                {
                    dumpKernelAddresses();
                }
            }
        }
        break;
    }
        
    lKeyControlVal = inb(KEYB_CTRL_PORT);
    lKeyControlVal |= 0x82;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    lKeyControlVal &= 0x7f;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    return;
}


void kbd_handler_generic_init()
{
    keyboardHandlerRoutine=&kbd_handler_generic;
    idt_set_gate (&idtTable[0x21], 0x08, (int)&vector21, ACS_INT); //Keyboard IRQ
    
}