/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "chrisos.h"

volatile char* kKeyboardBufferBase = (char*)KEYBOARD_BUFFER_ADDRESS;
int test=0;

char hi[25]="test";
void initLib()
{
    test+=1;
    return;
}

