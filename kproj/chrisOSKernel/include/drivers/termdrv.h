/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   terminal.h
 * Author: yogi
 *
 * Created on January 19, 2019, 5:32 AM
 */

#ifndef TERMDRV_H
#define TERMDRV_H

#ifdef __cplusplus
extern "C" {
#endif

#include <stdbool.h>

#define TERM_MAX_TERMINALS 100
#define TERMINAL_CONSOLE_MAJOR_NUMBER 0x1234

    typedef struct sTermInfo
    {
        int major, minor;
        int width, height;
        int cursorX, cursorY;
        char *description;
        char *screenBuffer;
        bool refresh;
        void (*updateTerminal)(void);
        int savedCursorX, savedCursorY;
    } __attribute__((packed)) terminfo_t;
    
    terminfo_t *terminfos;
    int termsRegistered;
    
    terminfo_t* registerTerminal(int deviceMajor, int deviceMinor, int width, int height, char *description);
    void updateTerms();
    
#include "tty_driver.h"

    
    
    
#ifdef __cplusplus
}
#endif

#endif /* TERMDRV_H */

