/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on May 15, 2016, 5:45 PM
 */

#include "../chrisOS/include/utility.h"
#include "../chrisOS/include/charDev.h"
#include "../chrisOS/include/kernelObjects.h"

extern uint16_t* terminal_buffer;
extern uint16_t* savedPosPointer;
/*
 * MyHelloWorld
 */

volatile  uint32_t* kTicksSinceStart;
char test[25]="myHelloWorld 1 loaded!\n";
uint32_t test2=0;
int dddd(int argc, char** argv) {
    uint32_t savedESP;
    test2=&savedPosPointer;
    terminal_setcolor(make_color(COLOR_LIGHT_BROWN,COLOR_BLUE));
    //terminal_clear();
    printk("Param count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
    }

    printk(&test);
    printk("Inside/before testFunction, system ticks=%u\n", *kTicksSinceStart);
    uint32_t ticks=*kTicksSinceStart;
    __asm__("sti\n");
    {__asm__("hlt\n");}
    printk("Inside/after testFunction, system ticks=%u\n", *kTicksSinceStart);
    return 0;
}
