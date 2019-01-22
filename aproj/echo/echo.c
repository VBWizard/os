/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   echo.c
 * Author: yogi
 *
 * Created on January 19, 2019, 3:56 PM
 */

#include "libChrisOS.h"

/*
 * 
 */
int main(int argc, char** argv, char** envp) {
    char* outString = malloc(4092);
    
    for (int cnt=1;cnt<argc;cnt++)
    {
        if (strlen(argv[cnt]) > 0)
        {
            strcat(outString,argv[cnt]);
            strcat(outString," ");
        }
        
    }
    strtrim(outString);
    printf("%s\n", outString);
    return 0;
}

