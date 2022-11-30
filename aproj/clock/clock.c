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
    int refreshInterval=TICKS_PER_SECOND / 5;
    time_t theTime;
    char tz[50];
    char tzPos[50];
    int itz = 0;

    while (1==1)
    {
        memset(tz,0,10);
        memset(tzPos,0,10);
        getenv("tz",tz);
        bool bNegative = strstr(tz,"-");
        if (bNegative)
            strreplace(tz, "-","",tzPos);
        itz = atoi(tzPos);
        if (bNegative)
            itz *= -1;
        setTZ(itz);
        if (ticksSinceLastUpdate>=TICKS_PER_SECOND)
        {
            theTime=time(&theTime);
            timeinfo=localtime(&theTime);
            ticksSinceLastUpdate=0;
            sprintf(printBuffer,"%ss%s70;0H%02i:%02i:%02i%su", //Move to 70x,0y
                    ansiEscSeq,
                    ansiEscSeq,
                    timeinfo->tm_hour, 
                    timeinfo->tm_min, 
                    timeinfo->tm_sec,
                    ansiEscSeq);
        }
        printf("%s",printBuffer);
        sleepTicks(refreshInterval);
        ticksSinceLastUpdate+=refreshInterval;
    }
    free(timeinfo);
    free(printBuffer);
    return 0;
}

