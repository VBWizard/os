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

const char ansiEscSeq[3] =  {0x1b,0x5b,0};

int main(int argc, char** argv) {

    struct tm *timeinfo = malloc(sizeof(struct tm));
    char *printBuffer=malloc(100);
    int ticksSinceLastUpdate=0;
    int refreshInterval=25;
    time_t theTime;
    
    while (1==1)
    {
        if (ticksSinceLastUpdate>TICKS_PER_SECOND)
        {
            theTime=time(&theTime);
            timeinfo=localtime(&theTime);
            ticksSinceLastUpdate=0;
            sprintf(printBuffer,"%ss%s70;0H%02i:%02i:%02i%su",
                    ansiEscSeq,
                    ansiEscSeq,
                    timeinfo->tm_hour, 
                    timeinfo->tm_min, 
                    timeinfo->tm_sec,
                    ansiEscSeq);
        }
        printf("%s",printBuffer);
/*        saveCursorPosition();
        moveToXY(70,0);
        printf("%02i:%02i:%02i",timeinfo->tm_hour, timeinfo->tm_min, timeinfo->tm_sec);*/
        //sleep(1);
        sleepTicks(refreshInterval);
        ticksSinceLastUpdate+=refreshInterval;
    }
    free(timeinfo);
    free(printBuffer);
    return 0;
}

