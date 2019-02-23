/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/* TTY driver.  Runs in the kernel.  Has a file associated with it
 * When a write syscall receives the file handle of the TTY driver, it calls the tty driver's write method and passes the data
 * to it so the TTY driver can add the data to its pipe
 * 
 * Later, the terminal driver will be called, and it will move the data from the pipe to a screen buffer, and then
 * if that tty is the active one (identified by the kernel), will write the buffer to the terminal
 *
 * Required components:  
 *  1) A write pipe.  Doesn't need a read pipe because it doesn't use one
 *    Each tty is simply a wrapper for a pipe.  If nothing is associated with the other end of the pipe then nothing happens
 *      A way to associate the TTY with a "screen"
 *          At startup of the TTY subsystem, a tty file is created for virtual terminals <CTRL><ALT>0 thru 9
 *          A program can be started with the tty of any of these virtual terminals
 *          The system startup process can choose to start gettys for any/all of the virtual terminals
 *              getty will wait for a user to login and then attach the tty to the shell executed at login
 *  */


#include "drivers/tty_driver.h"
#include "kmalloc.h"
#include "drivers/termdrv.h"

int initTTY()
{
    ttyDevices = (ttydevice_t*)kMalloc(sizeof(ttydevice_t)*TTY_MAX_DEVICES);
    ttysRegistered = 0;
}

ttydevice_t *registerTTY(int deviceMajor, int deviceMinor)
{
    ttydevice_t *device = &ttyDevices[ttysRegistered++];
    int stdOutPipes[2];
    int stdInPipes[2];
    int stdErrPipes[2];
    device->termDeviceMajor = deviceMajor;
    device->termDeviceMinor= deviceMinor;
    printd(DEBUG_TERMINAL,"Creating stdout pipes for tty%u\n",deviceMinor);
    fs_pipeI(NULL, stdOutPipes,PIPENOBLOCK); //n for no blocking
    device->stdOutReadPipe = (file_t*)stdOutPipes[0];
    device->stdOutWritePipe = (file_t*)stdOutPipes[1];
    printd(DEBUG_TERMINAL,"Creating stdin pipes for tty%u\n",deviceMinor);
    fs_pipeI(NULL, stdInPipes, 0); //we want this one to block!
    device->stdInReadPipe = (file_t*)stdInPipes[0];
    device->stdInWritePipe = (file_t*)stdInPipes[1];
    printd(DEBUG_TERMINAL,"Creating stderr pipes for tty%u\n",deviceMinor);
    fs_pipeI(NULL, stdErrPipes, 0); //we want this one to block!
    device->stdErrReadPipe = (file_t*)stdErrPipes[0];
    device->stdErrWritePipe = (file_t*)stdErrPipes[1];
    
    return device;
}

void unregisterTTY(int deviceMajor, int deviceMinor)
{
    for (int cnt=0;cnt<ttysRegistered;cnt++)
        if (ttyDevices[cnt].termDeviceMajor == deviceMajor &&
                ttyDevices[cnt].termDeviceMinor == deviceMinor)
        {
            fs_close(ttyDevices[cnt].stdOutReadPipe);
            ttyDevices[cnt].termDeviceMajor = 0;
            ttyDevices[cnt].termDeviceMinor = 0;
            return;
        }
}

int getTTYForPipe(int pipefd)
{
    for (int cnt=0;cnt<ttysRegistered;cnt++)
    {
        if (ttyDevices[cnt].termDeviceMajor == TERMINAL_CONSOLE_MAJOR_NUMBER)
        {
            if (ttyDevices[cnt].stdOutWritePipe==(file_t*)pipefd)
                return cnt;
        }
    }
    return 0xFF;
}    
