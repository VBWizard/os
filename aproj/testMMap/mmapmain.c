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

int doChild(int childNum)
{
        for (int sharedCounter=4;sharedCounter>=0;sharedCounter--)
        {
            //print("Child %u counting: Count = %u\n",childNum, sharedCounter);
            if (sharedCounter > 0)
                sleep(1);
        }
        printf("\tChild %u returning %u\n",childNum,childNum);
        return childNum;
}

int main(int argc, char** argv) {

    int pid=0, pid2=0, pidsToSpawn;
    if (argc == 1)
        pidsToSpawn = 5;
    else
        pidsToSpawn = atoi(argv[1]);
        
    int pids[pidsToSpawn];
    int rets[pidsToSpawn];
    int pidsP = 0;
    int childNo = 0;
    int pidCount = 0;
    for (int cnt=0;cnt<pidsToSpawn;cnt++)
    {
         pid=fork();
        childNo+=1;
        if (pid==0)
        {
            int cn = doChild(childNo);
            //print("Child %u quitting\n",cn);
            return cn;
        }
        else
            pids[pidsP++]=pid;
        //print("Started PID %u\n",pid);
    }
    printf("%u children spawned\n",pidsToSpawn);
    printf("Waiting for all children to quit\n");
    while (pidCount<pidsToSpawn)
    {
        int thePid = pids[pidCount];
        //print("Waiting for child %u (0x%04X)\n",pidCount+1, thePid);
        rets[pidCount]=waitpid(thePid);
        if (rets[pidCount]-1!=pidCount)
            printf("Wrong return value for child #%u, value=%u (pid=0x%08x)\n",pidCount,rets[pidCount],pids[pidCount]);
        pidCount++;
    }
    printf("All children ended\n");
    return 0;
/*    pid=fork();
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
    print("waiting for child 2 (PID=0x%04X\n", pid2);
    uint32_t pid1Return = waitpid(pid2);
    print("PID 2 returned %u\n",pid1Return);
    print("waiting for child 1 (PID=0x%04X)\n", pid);
    uint32_t pid0Return = waitpid(pid);
    print("PID 1 returned %u\n",pid0Return);
    return (0);
*/
}

