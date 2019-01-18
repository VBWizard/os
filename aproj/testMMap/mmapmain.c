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

int sharedCounter = 10;

int main(int argc, char** argv) {

    int pid=0, pid2=0;
    
    pid=fork();
    if (pid==0)
    {
        //child executes here
        for (int sharedCounter=9;sharedCounter>=0;sharedCounter--)
        {
            print("Child 1 counting: Count = %u\n",sharedCounter);
            sleep(1);
        }
        return 1;
    }
    //parent executes here

    pid2=fork();
    if (pid2==0)
    {
        //child executes here
        for (int sharedCounter=12;sharedCounter>=0;sharedCounter--)
        {
            print("Child 2 counting: Count = %u\n",sharedCounter);
            sleep(1);
        }
        return 2;
    }
    
/*    for (int sharedCounter=1;sharedCounter<=10;sharedCounter++)
    {
        print("Parent: Count = %u\n",sharedCounter);
        sleep(1);
    }
 * */
    print("waiting for child 2 (PID=0x%04X\n", pid2);
    uint32_t pid1Return = waitpid(pid2);
    print("PID 2 returned %u\n",pid1Return);
    print("waiting for child 1 (PID=0x%04X)\n", pid);
    uint32_t pid0Return = waitpid(pid);
    print("PID 1 returned %u\n",pid0Return);
    return (0);
}

