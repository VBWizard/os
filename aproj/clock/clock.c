/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on January 30, 2019, 3:22 PM
 */

#include <time.h>

#include "libChrisOS.h"
/*
 * 
 */
int main(int argc, char** argv) {

    while (1==1)
    {
        time_t theTime = time(&theTime);
        struct tm *timeinfo = localtime(&theTime);

        saveCursorPosition();
        moveToXY(70,0);
        printf("%02i:%02i:%02i",timeinfo->tm_hour, timeinfo->tm_min, timeinfo->tm_sec);
        restoreCursorPosition();
        sleep(1);
    }
    return 0;
}

