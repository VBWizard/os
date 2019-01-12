/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
#include "libChrisOS.h"
#include <stdbool.h>

bool check_digit (char c) {
    if ((c>='0') && (c<='9')) return 1;
    return 0;
}

VISIBLE bool strisnum(char* str)
{
    int cnt=0;
    
    while (*str+cnt)
        if (!check_digit(*str+cnt))
            return false;
    return true;
    
}