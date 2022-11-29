#include "../include/chrisos.h"
#include <stddef.h>
#include <stdarg.h>
#include <time.h>
#include "printf.h"
#include "utility.h"
extern void SaveExceptionRegisters(void);

void __attribute__((noinline))panic(const char *format, ...)
{
    va_list args;
    va_start( args, format );
    uint32_t savedDS;

    //printDumpedRegs();
    printk("\n>>>panic at instruction prior to address 0x%08X<<<\n", __builtin_return_address(0));
    printk("  >>>");
    printk( format,args);
    printd(DEBUG_EXCEPTIONS,"\n>>>panic at instruction prior to address 0x%08X<<<\n", __builtin_return_address(0));
    printd(DEBUG_EXCEPTIONS, "  >>> ");
    printd(DEBUG_EXCEPTIONS, format, args);
    panicLoop: 
    __asm__("cli\nhlt\n");
    goto panicLoop;
}

void __attribute__((noinline))assertPanic(char *message, char *file, int line)
{
    printk("\n>>>Assert: line %i, file %s (%s)",line, file, message);
    printk("  >>>");
    assertPanicLoop: 
    __asm__("cli\nhlt\n");
    goto assertPanicLoop;
}

