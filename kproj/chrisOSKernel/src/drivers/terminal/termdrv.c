/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/*
 * The console driver links system the standard output pipe (stdout) to the screen
 * By default a when a program is started, it inherits the stdout of the parent.
 * Process 0, the kernel, initializes the driver and since it runs on the system console (<CTRL><ALT><0>),
 * all processes it spawns inherit the system console.
 * That is unless a process redirects output to a file or a shell session is started on a different
 * system console (<CTRL><ALT><#>)
 * Obviously once we have a graphical program we'll be able to redirect output to console windows
 */

/* The console driver reads from the program's stdout pipe (the driver's stdin pipe, represented by /dev/tty*) and stores the content in memory.
 * That memory is a screen buffer.  When the device it is connected to has focus, it's memory becomes the active
 * screen buffer, and its contents are displayed. 
 */

#include "drivers/termdrv.h"
#include "strings.h"
#include "kmalloc.h"
#include "printf.h"
#include "drivers/tty_driver.h"
#include "filesystem/pipe.h"

extern file_t *activeSTDOUT;

char *pipeContents;
int pipeReadSize;
volatile int kTermLock;
char *console;

void initTerm()
{
    terminfos = (terminfo_t*)kMalloc(sizeof(terminfo_t) * TERM_MAX_TERMINALS);
    termsRegistered = 0;
    pipeContents = kMalloc(PIPE_FILE_SIZE);
    pipeReadSize = 0;
    kTermLock = 0;
    console = (char*)0xB8000;
}

terminfo_t* registerTerminal(int deviceMajor, int deviceMinor, int width, int height, char *description)
{
    if (deviceMajor != TERMINAL_CONSOLE_MAJOR_NUMBER)
        panic("termdrv: Device major number 0x%04X not implemented\n", deviceMajor);
    
    for (int cnt=0;cnt<termsRegistered; cnt++)
        if (terminfos[cnt].major == deviceMajor && 
                terminfos[cnt].minor == deviceMinor)
            panic("termdrv: Terminal device with major 0x%04X and minor 0x%04X already registered\n", deviceMajor, deviceMinor);
     
    //at this point it is ok to register the terminal device
    terminfos[termsRegistered].major = deviceMajor;
    terminfos[termsRegistered].minor = deviceMinor;
    terminfos[termsRegistered].height = height;
    terminfos[termsRegistered].width = width;
    terminfos[termsRegistered].screenBuffer = kMalloc(width * (height+1) * 2); //+1 is for extra row when newline takes you past bottom of screen
    memset(terminfos[termsRegistered].screenBuffer, 0, width * (height+1) * 2);
    terminfos[termsRegistered].cursorX = terminfos[termsRegistered].cursorY = 0;
    terminfos[termsRegistered].refresh = false;
    terminfos[termsRegistered].description=kMalloc(1024);
    strcpy(terminfos[termsRegistered].description, description);
    terminfos[termsRegistered].updateTerminal = &updateTerms;
    return &terminfos[termsRegistered++];
}

terminfo_t *getTermInfo(int deviceMajor, int deviceMinor)
{

    for (int cnt=0;cnt<termsRegistered; cnt++)
        if (terminfos[cnt].major == deviceMajor && 
                terminfos[cnt].minor == deviceMinor)
            return &terminfos[cnt];    
    return NULL;
}

int unregisterTerminal(terminfo_t* term)
{
    term->major = 0x0;
    term->minor = 0x0;
    memset(term->description, 0, 255);
}

void cursor_update(terminfo_t* term)
 {
    unsigned short position=(term->cursorY*80) + term->cursorX;
 
    // cursor LOW port to vga INDEX register
    outb(0x3D4, 0x0F);
    outb(0x3D5, (unsigned char)(position&0xFF));
    // cursor HIGH port to vga INDEX register
    outb(0x3D4, 0x0E);
    outb(0x3D5, (unsigned char )((position>>8)&0xFF));
    //Move the cursor in the bios data area
 }

void __attribute__((inline))processCharacter(ttydevice_t *device, terminfo_t* term, char charToPrint)
{
    if (charToPrint==0x9)
    {
        int a = 0;
        a += 1;
        a -= 1;
    }
    term->screenBuffer[(term->cursorX + (term->cursorY*term->width)) * 2] = charToPrint;
    term->screenBuffer[((term->cursorX + (term->cursorY*term->width)) * 2) - 1] = 0x07;
    if (device->pipew == activeSTDOUT) //if the write pipe (used by the writing program) is STDOUT
    {
        console[(term->cursorX + (term->cursorY*term->width)) * 2] = charToPrint;
        console[((term->cursorX + (term->cursorY*term->width)) * 2) - 1] = 0x07;
    }
    if (++term->cursorX >= term->width)
    {
        term->cursorX = 0;
        term->cursorY += 1;
    }
    if (term->cursorY >= term->height)
    {
        //Move up 1 line by copying from the 2nd line of the screen down, to the first line
        memcpy(term->screenBuffer, term->screenBuffer + (term->width * 2), term->width * term->height * 2);
        if (device->pipew == activeSTDOUT) //if the write pipe (used by the writing program) is STDOUT
        {
            memcpy(console, console + (term->width * 2), term->width * term->height * 2);
        }
        term->cursorY--;
    }
}

void clearScreen(terminfo_t* term, char* buffer)
{
    int height = term->height;
    int width = term->width;
    
    for (int cnt=0; cnt<(height*width)*2;cnt+=2)
    {
        buffer[cnt] = ' ';
        buffer[cnt+1] = 0x7;
    }
    term->cursorX = 0;
    term->cursorY = 0;
}

void updateTermBuffer(ttydevice_t *device)
{
    //NOTE: pipeContents contains the data to be written to the buffer
    terminfo_t* term = getTermInfo(device->termDeviceMajor, device->termDeviceMinor);

    term->refresh = true;
    
    if (term == NULL)
        panic("updateTermBuffer: Couldn't find the terminal to be updated (major=0x%04X, minor=0x%04X)\n", device->termDeviceMajor, device->termDeviceMinor);

    for (int cnt=0;cnt<pipeReadSize;cnt++)
    {
        char curr = pipeContents[cnt];
        switch (curr)
        {
            case '\n':
                term->cursorY += 1;
                term->cursorX = 0;
                curr = 0;
                break;
            case '\t':
                for (int cnt=0;cnt<5;cnt++)
                    processCharacter(device, term, ' ');
                    curr = 0;
                break;
            case 0x1b:                                                  //ANSI escape sequence
                if (pipeContents[cnt+1] == '[')
                {
                    switch (pipeContents[cnt+3])
                    {
                        case 'J':
                            if (pipeContents[cnt+2]=='2')               //Clear screen
                            {
                                clearScreen(term, term->screenBuffer);
                                if (device->pipew == activeSTDOUT)
                                    clearScreen(term, console);
                                cnt+=3;
                                curr = 0;
                            }
                            break;
                        case 'D':
                            term->cursorX-=pipeContents[cnt+2]-48;
                            cnt+=3;
                            curr = 0;
                            break;
                        case 'C':
                            term->cursorX+=pipeContents[cnt+2]-48;
                            cnt+=3;
                            curr = 0;
                            break;
                        default:
                            break;
                    }
                }
        }
        if (curr != 0)
        {
            processCharacter(device, term, curr);
        }
    }
    if (device->pipew == activeSTDOUT)
        cursor_update(term);
}

void updateTerms()
{
    for (int cnt=0;cnt<ttysRegistered;cnt++)
    {
        if (ttyDevices[cnt].termDeviceMajor == TERMINAL_CONSOLE_MAJOR_NUMBER)
        {
            if (kTermLock==0)
                while (__sync_lock_test_and_set(&kTermLock, 1));
        //while (__sync_lock_test_and_set(&kTermLock, 1));
            pipeReadSize = piperead(pipeContents, PIPE_FILE_SIZE,1, ttyDevices[cnt].piper);
            //pipeReadSize = fs_read(NULL, ttyDevices[cnt].piper, pipeContents, PIPE_FILE_SIZE, 1);
            if (pipeReadSize > 0)
            {
                updateTermBuffer(&ttyDevices[cnt]);
            }
           __sync_lock_release(&kTermLock);    
        }
    }
}