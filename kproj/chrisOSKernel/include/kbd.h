/* 
 * File:   kbd.h
 * Author: yogi
 *
 * Created on May 3, 2016, 1:38 PM
 */

#ifndef KBD_H
#define	KBD_H

#include <stdint.h>

#define MAKE_RIGHT      77   // make and break codes for the arrow keys
#define MAKE_LEFT       75   //
#define MAKE_UP         72   //
#define MAKE_DOWN       80   //
#define BREAK_RIGHT     205  //
#define BREAK_LEFT      203  //
#define BREAK_UP        200  //
#define BREAK_DOWN      208  //
#define KEY_SHIFT_DN    42
#define KEY_CTRL_DN     29
#define KEY_ALT_DN      56
#define KEY_CAPSLOCK_DN 58
#define KEY_SHIFT_UP    KEY_SHIFT_DN | 0x80
#define KEY_CTRL_UP     KEY_CTRL_DN | 0x80
#define KEY_ALT_UP      KEY_ALT_DN | 0x80
#define KEY_CAPSLOCK_UP KEY_CAPSLOCK_DN | 0x80

#define INDEX_UP        0    // indices into arrow key state table
#define INDEX_DOWN      1    //
#define INDEX_RIGHT     2    //
#define INDEX_LEFT      3    //
#define INDEX_SHIFT     4
#define INDEX_CTRL      5
#define INDEX_ALT       6
#define INDEX_CAPSLOCK  7

static const unsigned char keyboard_map[128] =
{
    0,  27, '1', '2', '3', '4', '5', '6', '7', '8',	/* 9 */
  '9', '0', '-', '=', '\b',	/* Backspace */
  '\t',			/* Tab */
  'q', 'w', 'e', 'r',	/* 19 */
  't', 'y', 'u', 'i', 'o', 'p', '[', ']', '\n',	/* Enter key 28*/
    0,			/* 29   - Control */
  'a', 's', 'd', 'f', 'g', 'h', 'j', 'k', 'l', ';',	/* 39 */
 '\'', '`',   0,		/* Left shift */
 '\\', 'z', 'x', 'c', 'v', 'b', 'n',			/* 49 */
  'm', ',', '.', '/',   0,				/* Right shift */
  '*',
    0,	/* Alt */
  ' ',	/* Space bar */
    0,	/* Caps lock */
    0,	/* 59 - F1 key ... > */
    0,   0,   0,   0,   0,   0,   0,   0,
    0,	/* < ... F10 */
    0,	/* 69 - Num lock*/
    0,	/* Scroll Lock */
    0,	/* Home key */
    0,	/* Up Arrow */
    0,	/* Page Up */
  '-',
    0,	/* Left Arrow */
    0,
    0,	/* Right Arrow */
  '+',
    0,	/* 79 - End key*/
    0,	/* Down Arrow */
    0,	/* Page Down */
    0,	/* Insert Key */
    0,	/* Delete Key */
    0,   0,   0,
    0,	/* F11 Key */
    0,	/* F12 Key */
    0,	/* All other keys are undefined */
};

#endif	/* KBD_H */

static const unsigned char keyboard_map_up[128] =
{
0,  0, '!', '@', '#', '$', '%', '^', '&', '*',   /* 9 */
  '(', ')', '_', '+', '\b', '\t',
  'Q', 'W', 'E', 'R',
  'T', 'Y', 'U', 'I', 'O', 'P', '{', '}', '\n',      /* Enter key */
    0,         /* 29   - Control */
  'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L', ':',   /* 39 */
'|', '~',   42,      /* Left shift */
'\\', 'Z', 'X', 'C', 'V', 'B', 'N',         /* 49 */
  'M', '<', '>', '?',   0,               /* Right shift */
  0,
    0,   /* Alt */
  ' ',   /* Space bar */
    58,   /* Caps lock */
    0,   /* 59 - F1 key ... > */
    0,   0,   0,   0,   0,   0,   0,   0,
    0,   /* < ... F10 */
    0,   /* 69 - Num lock*/
    0,   /* Scroll Lock */
    0,   /* Home key */
    0,   /* Up Arrow */
    0,   /* Page Up */
  '-',
    0,   /* Left Arrow */
    0,
    0,   /* Right Arrow */
  '+',
    0,   /* 79 - End key*/
    0,   /* Down Arrow */
    0,   /* Page Down */
    0,   /* Insert Key */
    0,   /* Delete Key */
    0,   0,   0,
    0,   /* F11 Key */
    0,   /* F12 Key */
    0,   /* All other keys are undefined */
};
uint8_t getKeyboardKey();
char waitForKeyboardKey();
int gets(char* buffer, int len);
char getc();
