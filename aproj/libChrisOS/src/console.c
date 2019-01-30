/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

#include "file.h"
#include "strings.h"
#include "console.h"

const char ansiEscSeq[3] =  {0x1b,0x5b,0};

VISIBLE void moveToXY(int x, int y)
{
    char cmd[10];
    char xstr[3], ystr[3];
    
    strcpyI(cmd,ansiEscSeq);
    itoaI(x,xstr);
    strcatI(cmd,xstr);
    strcatI(cmd,";");
    itoaI(y,ystr);
    strcatI(cmd,ystr);
    strcatI(cmd,"H");
    //writeI((void*)1, cmd, strlenI(cmd),1);
    printfI("%s",cmd);
}

VISIBLE void saveCursorPosition()
{
    char cmd[10];
    
    strcpyI(cmd,ansiEscSeq);
    strcatI(cmd,"s");
    //writeI((void*)1, cmd, strlenI(cmd),1);
    printfI("%s",cmd);
}

VISIBLE void restoreCursorPosition()
{
    char cmd[10];
    
    strcpyI(cmd,ansiEscSeq);
    strcatI(cmd,"u");
//    writeI((void*)1, cmd, strlenI(cmd),1);
    printfI("%s",cmd);
}
