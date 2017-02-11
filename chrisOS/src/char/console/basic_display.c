#include <stddef.h>
#include <stdint.h>
#include "strings.h"
#include <stdbool.h>
#include "memory.h"
#include "io.h"
#include "chrisos.h"
#include "kbd.h"
#include "charDev.h"

#define TEXTMODE_MEMORY_START 0xB8000

static const size_t /*__attribute__ ((section ("kernelData#")))*/ VGA_WIDTH = SYS_VGA_WIDTH;
static const size_t /*__attribute__ ((section ("kernelData#")))*/ VGA_HEIGHT = SYS_VGA_HEIGHT;
KERNEL_DATA_SECTION size_t terminal_row;
KERNEL_DATA_SECTION size_t terminal_column;
KERNEL_DATA_SECTION uint8_t terminal_color;
KERNEL_DATA_SECTION uint16_t* terminal_buffer;
KERNEL_DATA_SECTION uint8_t savedPosX[10];
KERNEL_DATA_SECTION uint8_t savedPosY[10];
KERNEL_DATA_SECTION int8_t savedPosPointer=0;
KERNEL_DATA_SECTION uint8_t kTerminalHeight;

void update_cursor()
 {
    unsigned short position=(terminal_row*VGA_WIDTH) + terminal_column;
 
    // cursor LOW port to vga INDEX register
    outb(0x3D4, 0x0F);
    outb(0x3D5, (unsigned char)(position&0xFF));
    // cursor HIGH port to vga INDEX register
    outb(0x3D4, 0x0E);
    outb(0x3D5, (unsigned char )((position>>8)&0xFF));
    //Move the cursor in the bios data area
 }

uint8_t make_color(enum vga_color fg, enum vga_color bg) {
        return fg | bg << 4;
}

uint16_t make_vgaentry(char c, uint8_t color) {
        uint16_t c16 = c;
        uint16_t color16 = color;
        return c16 | color16 << 8;
}


void terminal_setcolor(uint8_t color) {
        terminal_color = color;
}

void terminal_putentryat(char c, uint8_t color, size_t x, size_t y) {
    const size_t index = y * VGA_WIDTH + x;
        terminal_buffer[index] = make_vgaentry(c, color);
}

void cursorSavePosition()
{
    if (savedPosPointer < 10)
    {
        savedPosX[++savedPosPointer] = terminal_column;
        savedPosY[savedPosPointer] = terminal_row;
    }
}

void cursorRestorePosition()
{
    if (savedPosPointer > 0)
    {
        terminal_column = savedPosX[savedPosPointer];
        terminal_row = savedPosY[savedPosPointer--];
        update_cursor();
    }
}

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
                }
        }
    terminal_column=0;
    terminal_row=0;
    update_cursor();
}

void terminal_clear_line(unsigned lineNo)
{
    if (lineNo>SYS_VGA_HEIGHT-1)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
    }
}

void terminal_copyline(unsigned dstLine, unsigned srcLine)
{
    unsigned rowBytes = VGA_WIDTH*2;
    uintptr_t dest=(uintptr_t)TEXTMODE_MEMORY_START+(dstLine*rowBytes);
    uintptr_t src=(uintptr_t)TEXTMODE_MEMORY_START+(srcLine*rowBytes);
    
    memcpy((void*)dest,(void*)src,rowBytes);
}

void terminal_putchar(char c) {
    if (c=='\n')
    {
            terminal_column = 0;
            terminal_row += 1;
    }
    else if (c=='\b')
    {
        if (terminal_column > 1)
            terminal_column--;
        else
        {
            terminal_row--;
            terminal_column=VGA_WIDTH;
        }
        terminal_putentryat(' ', terminal_color, terminal_column, terminal_row);
        
    }
    else if (c=='\t')
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
        
        while (terminal_column < goTo)
            terminal_putchar(' ');;
    
    //6 - cnt=0 to (5-1) 4
    //8 - cnt= to (5-3) 2
    }
    //We're going to ignore carriage return since most systems don't use it.  Unfortunately the FAT library we are using does
    else if (c=='\r')
        return;

        else
        {
                terminal_putentryat(c, terminal_color, terminal_column, terminal_row);
                if (++terminal_column == VGA_WIDTH) {
                        terminal_column = 0;
                        terminal_row++;
                }
        }
    if (terminal_row == kTerminalHeight)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
            terminal_copyline(row, row+1);
        //memcpy((void *)TEXTMODE_MEMORY_START, (void *)TEXTMODE_MEMORY_START+160, 160*25);
        terminal_row--;
    }
    update_cursor();
}

void cursorUpdateBiosCursor()
{
    uint8_t* bda=(uint8_t*)0x450;
    *bda=(uint8_t)(terminal_column & 0xFF);
    bda++;
    *bda=(uint8_t)((terminal_row+3) & 0xFF);
}

void cursorMoveTo(uint8_t x, uint8_t y)
{
    terminal_row = y;
    terminal_column = x;
    update_cursor();
}

void cursorMoveToX(uint8_t x)
{
    terminal_column = x;
}

void cursorMoveToY(uint8_t y)
{
    terminal_row = y;
}

uint8_t cursorGetPosX()
{
    return terminal_column;
}
int cursorGetMaxX()
{
    return VGA_WIDTH;
}

int cursorGetMaxY()
{
    return kTerminalHeight;
}

void displayGetMaxXY(int* maxX, int* maxY)
{
    *maxX=VGA_WIDTH;
    *maxY=kTerminalHeight;
    return;
}

uint8_t cursorGetPosY()
{
    return terminal_row;
}

void kTermPrint(const char* data) {
        size_t datalen = strlen(data);
        for (size_t i = 0; i < datalen; i++)
                terminal_putchar(data[i]);
}


void kTermInit() {
    kTerminalHeight=SYS_VGA_HEIGHT;
    terminal_row = 0;
    terminal_column = 0;
    terminal_color = make_color(COLOR_LIGHT_BROWN, COLOR_BLACK);
    terminal_buffer = (uint16_t*) TEXTMODE_MEMORY_START;
    //terminal_clear();
}

void puts(char* in)
{
    while (*in>'\0')
    {
        terminal_putchar(*in++);
    }
}

void putc(char c)
{
    terminal_putchar(c);
}