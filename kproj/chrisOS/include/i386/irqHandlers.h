/* 
 * File:   newfile.h
 * Author: yogi
 *
 * Created on May 9, 2016, 7:45 PM
 */

#ifndef NEWFILE_H
#define	NEWFILE_H
#include "chrisos.h"
#include "debugger.h"

void irq0_handler();
void kbd_handler();
void defaultISRHandler();
void pagingExceptionHandler();
extern volatile char* kKeyboardBufferBasePtr;   //reuse original BIOS keyboard buffer!
#endif	/* NEWFILE_H */

