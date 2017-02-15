#include "i386/bits/types.h"
#include "io.h"
#include <time.h>
#include "printf.h"
#include "kbd.h"
#include "chrisos.h"
#include "i386/irqHandlers.h"
#include "i386/kPaging.h"
#include "utility.h"

extern volatile uint32_t* kTicksSinceStart;
extern uint32_t exceptionErrorCode;
extern uint16_t exceptionNumber;
extern uint32_t exceptionCS;
extern uint32_t exceptionEIP;
extern uint32_t exceptionFlags;
extern uint32_t exceptionCR2;
extern uint32_t *exceptionSavedStack;
extern uint32_t exceptionSavedESP;
extern uint32_t irq14SavedESP;
extern bool kDebugStartsNow;
extern volatile  uint32_t kPagingExceptionsSinceStart;
extern volatile  uint32_t kExceptionsSinceStart;
extern void kPagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly);
extern uint32_t kDebugLevel;
extern int kTicksPerSecond;
extern time_t kSystemCurrentTime;
extern uint32_t exceptionAX, exceptionBX, exceptionCX, exceptionDX, exceptionSI, exceptionDI, exceptionBP, exceptionCR0, exceptionCR3, exceptionCR4;
extern bool kPagingInitDone;

#define KEYB_DATA_PORT 0x60
#define KEYB_CTRL_PORT 0x61

unsigned volatile char kKeyChar=0;
uint32_t tds=0;
unsigned volatile char kKeyStatus[11];
extern struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf);
extern void kpagingUpdatePresentFlagA(uint32_t address, bool present);

void irq0_handler()
{
#ifndef DEBUG_NONE
static char currTime[50];
static struct tm theDateTime;
#endif
        *kTicksSinceStart=*kTicksSinceStart+1;
        if (*kTicksSinceStart % kTicksPerSecond == 0)
            kSystemCurrentTime++;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_EXPANDED_TICK) == DEBUG_EXPANDED_TICK)
        {
            cursorSavePosition();
            gmtime_r((time_t*)&kSystemCurrentTime,&theDateTime);
            strftime((char*)&currTime, 50, "%m/%d/%Y %H:%M:%S", &theDateTime);
            cursorMoveTo(0,24);
            printk("The time is currently %s", &currTime);
            cursorMoveTo(65,24);
            printk("ticks=%d", *kTicksSinceStart);
            cursorRestorePosition();
        }
#endif
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_TICK) == DEBUG_TICK)
        {
            cursorSavePosition();
            cursorMoveTo(55,SYS_VGA_HEIGHT-1);
            //printf("0x%04X:0x%08X 0x%08X",exceptionCS, exceptionEIP, exceptionFlags);
            //kTermMoveTo(65,0);
            printk("%u",*kTicksSinceStart);
            printk("-%c-%04X:%08X",(exceptionFlags & 0x200)==0x200?'I':'i',exceptionCS, exceptionEIP);
            //gmtime_r((time_t*)&kSystemCurrentTime,&theDateTime);
            //strftime((char*)&currTime, 50, "%H:%M:%S", &theDateTime);
            //kTermMoveTo(65,0);
            //printf("%s",currTime);
            cursorRestorePosition();
        }
#endif
}

void kbd_handler()
{
    unsigned char lKeyControlVal=0;
    unsigned char rawKey=0;
    unsigned char translatedKeypress=0;
    static char currTime[50];
    static struct tm theDateTime;
   
    rawKey = inb(KEYB_DATA_PORT);
    kKeyChar = rawKey;//& 0x80;

    __asm__("cli\n");
    
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
               if (kKeyboardBuffer<(char*)KEYBOARD_BUFFER_ADDRESS+KEYBOARD_BUFFER_SIZE && !kKeyStatus[INDEX_ALT])
               //CLR 01/10/2017: Increment the buffer pointer first
               {    
                   kKeyboardBuffer++;
                   *kKeyboardBuffer=rawKey;
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
            if (kKeyboardBuffer<(char*)KEYBOARD_BUFFER_ADDRESS+KEYBOARD_BUFFER_SIZE && !kKeyStatus[INDEX_ALT])
            {
                //CLR 01/10/2017: Increment the buffer pointer first
                {   kKeyboardBuffer++;
                    *kKeyboardBuffer=translatedKeypress;
                }
#ifndef DEBUG_NONE
                 if ((kDebugLevel & DEBUG_KEYBOARD) == DEBUG_KEYBOARD)
                    printk("kbd_handler: %c-(%08X)\n",translatedKeypress, kKeyboardBuffer);
#endif
                cursorSavePosition();
                cursorMoveTo(78,0);
                printk("%c",'k');
                cursorRestorePosition();
            }
            else
            {
#ifndef DEBUG_NONE
                if ((kDebugLevel & DEBUG_KEYBOARD) == DEBUG_KEYBOARD)
                      printk("noRoomForKey: %c\n",kKeyboardBuffer);
#endif
                cursorSavePosition();
                cursorMoveTo(78,0);
                printk("%c",'K');
                cursorRestorePosition();
            }
                 //Debug
                 if (kKeyStatus[INDEX_ALT] && translatedKeypress==0x6A)
                 {
                     __asm("int 0x3");
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
                {
                    cursorSavePosition();
                    gmtime_r((time_t*)&kSystemCurrentTime,&theDateTime);
                    strftime((char*)&currTime, 50, "%m/%d/%Y %H:%M:%S", &theDateTime);
                    cursorMoveTo(0,SYS_VGA_HEIGHT-1);
                    printk("The time is currently %s", &currTime);
                    cursorMoveTo(65,SYS_VGA_HEIGHT-1);
                    printk("ticks=%d", *kTicksSinceStart);
                    cursorRestorePosition();
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

void pagingExceptionHandler()
{
    uint32_t lPDEValue=0;
    uint32_t lPTEValue=0;
    uint32_t lPDEAddress=0, lPTEAddress=0;
    uint32_t lOldDebugLevel=0;

    if (exceptionNumber==0x0e)
        //Get the address of the page table entry for the exception
        lPTEAddress=kPagingGet4kPTEntryAddress(exceptionCR2);

#ifndef DEBUG_NONE
    if (!kPagingInitDone)
    {
        lOldDebugLevel=kDebugLevel;
        kDebugLevel&=!DEBUG_EXCEPTIONS;
    }
    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
    {
        lPDEValue=kPagingGet4kPDEntryValue(exceptionCR2);
        lPTEValue=kPagingGet4kPTEntryValue(exceptionCR2);
        lPDEAddress=kPagingGet4kPDEntryAddress(exceptionCR2);
        if (exceptionNumber==0x0e)
          printk("\nPaging handler called for virtual address 0x%02X\n",exceptionCR2);
          printk("PDE@0x%08X=0x%08X, PTE@0x%08X=0x%08X\n", lPDEAddress, lPDEValue, lPTEAddress, lPTEValue);
          printDumpedRegs();
          printk("handler called %u times since system start\n",kPagingExceptionsSinceStart+1);
    }
#endif
    if (lOldDebugLevel)
        kDebugLevel=lOldDebugLevel;
    if ((exceptionCR2&0xFFFFF000)==0xC0000000 && (!kPagingInitDone))
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printk("\n\tpagingExceptionHandler: Updating 0x%08X to read/write for WP test ...\n\t",exceptionCR2);
#endif
        kPagingSetPageReadOnlyFlag((uintptr_t*)lPTEAddress, false);
    }
    
    kPagingExceptionsSinceStart++;
#ifndef DEBUG_NONE
//    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
//    {
//        waitForKeyboardKey();
//    }
#endif
    __asm__("push eax\n mov eax,0\nmov cr2,eax\npop eax\n  #reset CR2 after paging exception handled");
    if ((!kPagingInitDone) && exceptionCR2==0xC0000000)
    {
        exceptionCR2=0;
        return;
    }
    __asm__("sti\n");
    pagingExceptionStop: __asm__("hlt\n"); goto pagingExceptionStop;
    __asm__("cli");
    __asm__("hlt");
}

void defaultISRHandler()
{
    //terminal_clear();
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
    {
        printk("Exception handler called for exception # 0x%02x\n\n", exceptionNumber);
        printDumpedRegs();
        printd(DEBUG_EXCEPTIONS,"handler called %u times since system start\n",kPagingExceptionsSinceStart+1);
    }
#endif
#ifndef DEBUG_NONE
//    if ((kDebugLevel & DEBUG_EXCEPTIONS) == DEBUG_EXCEPTIONS)
//    {
//        waitForKeyboardKey();
//    }
#endif

//    __asm__("mov eax,%0\nmov ebx,%1\n"::"r" (exceptionAX), "r" (exceptionEIP));
//    return;
    
defaultHandlerLoop:
    goto defaultHandlerLoop;
}

void doubleFaultHandler()
{
    uint32_t esp = (uint32_t)exceptionSavedESP;
        terminal_clear();
        printk("Double Fault for exception %02X, CS:EIP = %04X:%08x, error = %08X\n", exceptionNumber, exceptionCS, exceptionEIP, exceptionCR2);
        printk ("Stack:\n");
        for (int cnt=0;cnt<10;cnt++)
        {
            printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
            esp+=4;
        }
    __asm__("cli");
    __asm__("hlt");
}