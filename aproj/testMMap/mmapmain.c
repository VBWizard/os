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

    int pid=0;
    
    pid=fork();
    if (pid==0)
    {
        //child executes here
        for (int cnt=0;cnt<10;cnt++)
        {
            print("Child: Count = %u\n",cnt);
            sleep(1);
        }
        return 1;
    }
    //parent executes here

    for (int cnt=0;cnt<10;cnt++)
    {
        print("Parent: Count = %u\n",cnt);
        sleep(1);
    }
    return (0);
}

