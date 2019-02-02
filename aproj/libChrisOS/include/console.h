/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   console.h
 * Author: yogi
 *
 * Created on January 30, 2019, 4:28 PM
 */

#ifndef CONSOLE_H
#define CONSOLE_H

#ifdef __cplusplus
extern "C" {
#endif

void moveToXY(int x, int y);
void saveCursorPosition();
void restoreCursorPosition();



#ifdef __cplusplus
}
#endif

#endif /* CONSOLE_H */

