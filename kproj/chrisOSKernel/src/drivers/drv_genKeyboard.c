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
#include "signals.h"
#include "filesystem/pipe.h"
#include "drivers/tty_driver.h"
#include "alloc.h"
#include "kutility.h"
#include "thesignals.h"
#include "io.h"

#define KEYB_DATA_PORT 0x60
#define KEYB_CTRL_PORT 0x61

unsigned volatile char kKeyChar=0;
unsigned volatile char kKeyStatus[11];
extern volatile char* kKbdBuffCurrTop;
extern uint32_t kDebugLevel;
extern volatile uint32_t exceptionErrorCode;
extern volatile uint16_t exceptionNumber;
extern volatile uint32_t exceptionCS;
extern volatile uint32_t exceptionEIP;
extern volatile uint32_t exceptionFlags;
extern volatile uint32_t exceptionCR2;
extern volatile uint32_t *exceptionSavedStack;
extern volatile uint32_t exceptionSavedESP;
extern volatile uint32_t* kTicksSinceStart;
extern void* kKeyboardHandlerRoutine;
extern struct idt_entry* idtTable;
extern void vector21();
extern ttydevice_t *tty1, *tty2, *tty3, *tty4, *tty5, *tty6, *tty7, *tty8;
extern pipe_t *activeSTDIN;
extern pipe_t *activeSTDOUT;
extern ttydevice_t *activeTTY;

uint32_t kbdTop=KEYBOARD_BUFFER_ADDRESS+KEYBOARD_BUFFER_SIZE;

void kbd_handler_generic()
{
    unsigned char lKeyControlVal=0;
    unsigned char rawKey=0;
    unsigned char translatedKeypress=0;
    uintptr_t cr3;
    
    SAVE_CURRENT_CR3(cr3);
    LOAD_KERNEL_CR3;
    rawKey = inb(KEYB_DATA_PORT);
    kKeyChar = rawKey;//& 0x80;
    //printd(DEBUG_KEYBOARD,"got a key: %c (0x%04X)\n",kKeyChar,kKeyChar);
    switch(rawKey)
    {
    case KEY_LEFT_SHIFT_DN:
    case KEY_RIGHT_SHIFT_DN:
        kKeyStatus[INDEX_SHIFT]=1;
        //printd(DEBUG_KEYBOARD,"Shift down\n");
        goto timeToReturn;
    case KEY_LEFT_SHIFT_UP:
    case KEY_RIGHT_SHIFT_UP:
        kKeyStatus[INDEX_SHIFT]=0;
        //printd(DEBUG_KEYBOARD,"Shift up\n");
        goto timeToReturn;
    case KEY_CTRL_DN:
                cursorSavePosition();
                cursorMoveTo(74,0);
                printk("%c",'c');
                cursorRestorePosition();
        kKeyStatus[INDEX_CTRL]=1;
        //printd(DEBUG_KEYBOARD,"Ctrl down\n");
        goto timeToReturn;
    case KEY_CTRL_UP:
                cursorSavePosition();
                cursorMoveTo(74,0);
                printk("%c",' ');
                cursorRestorePosition();
        kKeyStatus[INDEX_CTRL]=0;
        //printd(DEBUG_KEYBOARD,"Ctrl up\n");
        goto timeToReturn;
    case KEY_ALT_DN:
        kKeyStatus[INDEX_ALT]=1;
        //printd(DEBUG_KEYBOARD,"Alt down\n");
        goto timeToReturn;
    case KEY_ALT_UP:
        kKeyStatus[INDEX_ALT]=0;
        //printd(DEBUG_KEYBOARD,"Alt up\n");
        goto timeToReturn;
    case KEY_CAPSLOCK_UP:
        kKeyStatus[INDEX_CAPSLOCK]=!kKeyStatus[INDEX_CAPSLOCK];
        //printd(DEBUG_KEYBOARD,"Capslock\n");
        goto timeToReturn;
//        case MAKE_RIGHT: kKeyStatus[INDEX_RIGHT]=0;break;
//        case MAKE_LEFT: kKeyStatus[INDEX_LEFT]=0;break;
//        case MAKE_UP: kKeyStatus[INDEX_UP]=0;break;
//        case MAKE_DOWN: kKeyStatus[INDEX_DOWN]=0;break;
    }
    //changed from if rawkey & 0x80, so that keydown triggers the key being input
    if (rawKey==BREAK_RIGHT || rawKey==BREAK_LEFT || rawKey==BREAK_UP || rawKey==BREAK_DOWN)
        if (tty1->stdInWritePipe)
        {
            pipewrite(&rawKey, 1, 1, tty1->stdInWritePipe);
            printd(DEBUG_KEYBOARD, "kbd_handler_generic: Raw key '%u' delivered to stdin pipe 0x%08X\n",rawKey, tty1->stdInWritePipe);
	    //NOTE: We are passing data but no process.  sigaction2 knows to not expect a process for SIGIO
            sys_sigaction2(SIGIO, NULL, (uintptr_t)activeSTDIN, NULL);
        }
        else
            panic("kbd_handler_generic: STDIN pipe is null! (1)\n");
            
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

        if (kKeyStatus[INDEX_ALT])
        {
            switch (translatedKeypress)
            {
                case '1':
                    activeTTY=tty1;
                    switchTerm(1);
                    goto timeToReturn;      //Don't want to process the "c" that triggered the SIGINT
                    break;
                case '2':
                    activeTTY=tty2;
                    switchTerm(2);
                    goto timeToReturn;      //Don't want to process the "c" that triggered the SIGINT
                    break;
                case '3':
                    activeTTY=tty3;
                    switchTerm(3);
                    goto timeToReturn;      //Don't want to process the "c" that triggered the SIGINT
                    break;
                case '4':
                    activeTTY=tty4;
                    switchTerm(4);
                    goto timeToReturn;      //Don't want to process the "c" that triggered the SIGINT
                    break;
                case '5':
                    activeTTY=tty5;
                    switchTerm(5);
                    goto timeToReturn;      //Don't want to process the "c" that triggered the SIGINT
                    break;
                case '6':
                    activeTTY=tty6;
                    switchTerm(6);
                    goto timeToReturn;      //Don't want to process the "c" that triggered the SIGINT
                    break;
                case '7':
                    activeTTY=tty7;
                    switchTerm(7);
                    goto timeToReturn;      //Don't want to process the "c" that triggered the SIGINT
                    break;
                case '8':
                    activeTTY=tty8;
                    switchTerm(8);
                    goto timeToReturn;      //Don't want to process the "c" that triggered the SIGINT
                    break;
                     
            }
        }

        if (kKeyStatus[INDEX_CTRL])
        {
            //printk("^");
            if (translatedKeypress=='c') //CLR 12/30/2018: ^C pressed
            {
                //TODO: sigint broken till I can figure out how to pass the process struct for the correct struct
                if (activeTTY->stdInWritePipe)
                    pipewrite("^C\n", 2, 1, activeTTY->stdInWritePipe);
                sys_sigaction2(SIGINT, NULL, 0, activeTTY->stdInReadPipe->owner);
                goto timeToReturn;      //Don't want to process the "c" that triggered the SIGINT
            }
        }

        
        //01/09/2019 Don't know why next two lines of code exists but remove them in a while if not needed
        //if (translatedKeypress==124)
        //    translatedKeypress=34;
        //CLR 01/24/2019: Added stdin check because we don't care how full the keyboard buffer is if we're going to write the results to the STDIN pipe
        if (activeTTY->stdInWritePipe)
        {
            //CLR 01/10/2017: Increment the buffer pointer first
            pipewrite(&translatedKeypress, 1, 1, activeTTY->stdInWritePipe);
            printd(DEBUG_KEYBOARD, "kbd_handler_generic: Translated key '%c' delivered to stdin pipe 0x%08X (CR3=0x%08X)\n",translatedKeypress, activeTTY->stdInWritePipe, CURRENT_CR3);
	    //NOTE: We are passing data but no process.  sigaction2 knows to not expect a process for SIGIO
            sys_sigaction2(SIGIO, NULL, (uintptr_t)activeTTY->stdInReadPipe, NULL);
        }
        else
            panic("kbd_handler_generic: STDIN pipe is null! (2)\n");
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
            {   /*
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

timeToReturn:
    lKeyControlVal = inb(KEYB_CTRL_PORT);
    lKeyControlVal |= 0x82;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    lKeyControlVal &= 0x7f;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    LOAD_CR3(cr3);
    return;
}


void kbd_handler_generic_init()
{
    kKeyboardHandlerRoutine=&kbd_handler_generic;
    idt_set_gate (&idtTable[0x21], 0x08, (int)&vector21, ACS_INT); //Keyboard IRQ

}
