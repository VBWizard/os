#include "../include/chrisos.h"
#include <stddef.h>
#include <stdarg.h>
#include <time.h>
#include "printf.h"

void __attribute__((noinline))panic(const char *format, ...)
{
    va_list args;
    va_start( args, format );
    printk("\n>>>panic at instruction prior to address 0x%08X<<<\n", __builtin_return_address(0));
    printk("  >>>");
    printk_valist( format,args);
    panicLoop: 
    __asm__("cli\nhlt\n");
    goto panicLoop;
}

