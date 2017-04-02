/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   time.c
 * Author: yogi
 *
 * Created on April 1, 2017, 9:08 AM
 */

#include "../libChrisOS/include/libChrisOS.h"

/*
 * 
 */
int main(int argc, char** argv) {

    print("Param count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
        print("Param %u=%s\n",cnt,argv[cnt]);

    char* execpgm=malloc(512);
    strcpy(execpgm,argv[1]);

    
    
//    free (execpgm);
    return (0);
}

