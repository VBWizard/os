/* 
 * File:   charDev.h
 * Author: yogi
 *
 * Created on April 27, 2016, 3:45 PM
 */

#ifndef CHARDEV_H
#define	CHARDEV_H
#include <stdint.h>
#include <stddef.h>
#include "chrisos.h"

/* Hardware text mode color constants. */
enum vga_color {
        COLOR_BLACK = 0,
        COLOR_BLUE = 1,
        COLOR_GREEN = 2,
        COLOR_CYAN = 3,
        COLOR_RED = 4,
        COLOR_MAGENTA = 5,
        COLOR_BROWN = 6,
        COLOR_LIGHT_GREY = 7,
        COLOR_DARK_GREY = 8,
        COLOR_LIGHT_BLUE = 9,
        COLOR_LIGHT_GREEN = 10,
        COLOR_LIGHT_CYAN = 11,
        COLOR_LIGHT_RED = 12,
        COLOR_LIGHT_MAGENTA = 13,
        COLOR_LIGHT_BROWN = 14,
        COLOR_WHITE = 15,
};

void kTermInit();
void kTermPrint();
int printf1(const char *format, ...);
int sprintf1(char *out, const char *format, ...);
void terminal_putchar(char c);
void terminal_clear();
void terminal_clear_line(unsigned lineNo);
void cursorSavePosition();
void cursorRestorePosition();
void cursorMoveTo(uint8_t x, uint8_t y);
void cursorMoveToX(uint8_t X);
void cursorMoveToY(uint8_t y);
uint8_t cursorGetPosX();
uint8_t cursorGetPosY();
int cursorGetMaxX();
int cursorGetMaxY();
void puts(char* in);
void putc(char c);
#endif	/* CHARDEV_H */

