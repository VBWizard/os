/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on December 28, 2018, 5:48 PM
 */

#include "../../kproj/chrisOS/include/config.h"
#include <stdint.h>

/*
 * 
 */

extern void sysEnter_Vector();

#define GET_TICKS(t) {__asm__("mov $0x170,%%eax\ncall sysEnter_Vector\n":"=a" (t));}
#define SLEEP_SECONDS(s) {uint32_t ct; GET_TICKS(ct); s=(s*TICKS_PER_SECOND)+ct;__asm__("call sysEnter_Vector\n"::"a" (0x166), "b" (s), "c" (0), "d" (0));}

  // A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
int atoi(char *str)
{
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
    {
        res = res*10 + str[i] - '0';
    }
    // return result.
    return res;
}

int main(int argc, char** argv) {

    unsigned int sec;
    
    if (argc>1)
    {
        sec = atoi(argv[1]);
        SLEEP_SECONDS(sec);
        return (0);
    }
    return -1;
}

