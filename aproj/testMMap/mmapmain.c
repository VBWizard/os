/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* 
 * File:   main.c
 * Author: yogi
 *
 * Created on April 15, 2017, 8:17 AM
 */

#include "libChrisOS.h"

/*
 * 
 */
int main(int argc, char** argv) {

    char fileName[50] = "/kshell";
    for (int cnt=0;cnt<4;cnt++)
    {
        print("Iteration %u ...\n",cnt);
        int pid = execa(&fileName, NULL, NULL);
        sleep(1);
/*        if (pid)
        {
            waitpid(pid);
            print("done!\n");
        }
*/    }
    return (0);
}

