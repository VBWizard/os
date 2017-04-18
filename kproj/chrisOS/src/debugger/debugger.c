///Debugger module
///Activated by the key combination CTRL+SHIFT+D
#include <stdbool.h>
#include "chrisos.h"
#include "i386/cpu.h"
#include "debugger.h"
#include "charDev.h"
#include "utility.h"
#include "debugger.h"
#include "kbd.h"

bool kDebuggerActive = false,kKbdHandlerActivateDebugger;
bool kStopDebugging = false;
uint8_t savedTermHeight=0;
extern uint8_t kTerminalHeight;
extern uint32_t exceptionCS;
extern uint32_t debugReturnFlags;

void activateDebugger()
{
    kDebuggerActive=!kDebuggerActive;
    if (kDebuggerActive)
    {
        //Activate the debugger
        savedTermHeight=kTerminalHeight;
        kTerminalHeight=20;
        cursorMoveTo(70,0);
        printk("D");
        for (int cnt=21;cnt<savedTermHeight;cnt++)
            terminal_clear_line(cnt);
        cursorMoveTo(0,21);
        printk("-------------------------------- DEBUG --------------------------------");
        //cursorRestorePosition();
        kStopDebugging=false;
    }
    else    //Deactivate the debugger
    {
        kTerminalHeight=savedTermHeight;
        cursorSavePosition();
        cursorMoveTo(70,0);
        printk(" ");
        cursorRestorePosition();
    }
}

void debugStep()
{
    char kbd;
    //cursorSavePosition();
    cursorMoveTo(0,22);
    printDebugRegs();
    //cursorRestorePosition();
    kbd=waitForKeyboardKey();
    printk("Debugger got key\n");
    if (kbd=='s')
    {
        kStopDebugging=1;
        printk("Debugging will be stopped\n");
    }
    return;
}
