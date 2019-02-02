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
volatile int kTermLock;
char *console;

void initTerm()
{
    terminfos = (terminfo_t*)kMalloc(sizeof(terminfo_t) * TERM_MAX_TERMINALS);
    termsRegistered = 0;
    pipeContents = kMalloc(PIPE_FILE_SIZE);
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

void processCharacter(ttydevice_t *device, terminfo_t* term, char charToPrint)
{
    char * screenBuffer = term->screenBuffer;

    if (term->cursorY >= term->height)
    {
        //Move up 1 line by copying from the 2nd line of the screen down, to the first line
        memcpy(screenBuffer, screenBuffer + (term->width * 2), term->width * term->height * 2);
        if (device->stdOutWritePipe == activeSTDOUT) //if the write pipe (used by the writing program) is STDOUT
        {
            memcpy(console, console + (term->width * 2), term->width * term->height * 2);
        }
        term->cursorY--;
    }
    screenBuffer[(term->cursorX + (term->cursorY*term->width)) * 2] = charToPrint;
    screenBuffer[((term->cursorX + (term->cursorY*term->width)) * 2) + 1] = 0x07;
    if (device->stdOutWritePipe == activeSTDOUT) //if the write pipe (used by the writing program) is STDOUT
    {
        console[(term->cursorX + (term->cursorY*term->width)) * 2] = charToPrint;
        console[((term->cursorX + (term->cursorY*term->width)) * 2) + 1] = 0x07;
    }
    if (++term->cursorX >= term->width)
    {
        term->cursorX = 0;
        term->cursorY += 1;
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

void updateTermBuffer(ttydevice_t *device, int bytesToUpdate)
{
    //NOTE: pipeContents contains the data to be written to the buffer
    terminfo_t* term = getTermInfo(device->termDeviceMajor, device->termDeviceMinor);
    bool sequenceFound = false;
    term->refresh = true;
    int lSavedX, lSavedY;
    
    if (term == NULL)
        panic("updateTermBuffer: Couldn't find the terminal to be updated (major=0x%04X, minor=0x%04X)\n", device->termDeviceMajor, device->termDeviceMinor);

    for (int cnt=0;cnt<bytesToUpdate;cnt++)
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
                for (int cnt=0;cnt<(term->cursorX%5==0?5:term->cursorX%5);cnt++)
                    processCharacter(device, term, ' ');
                    curr = 0;
                break;
            case 0x1b:                                                  //ANSI escape sequence
                if (pipeContents[cnt+1] == '[')
                {
                    char contentP2 = pipeContents[cnt+2];
                    char contentP3 = pipeContents[cnt+3];
                    char contentP4 = pipeContents[cnt+4];
                    char contentP5 = pipeContents[cnt+5];
                    char contentP6 = pipeContents[cnt+6];
                    char contentP7 = pipeContents[cnt+7];
                    char contentP8 = pipeContents[cnt+8];
                    
                    if ( (contentP2==';' || contentP3==';' ||contentP4==';')
                      && (contentP3=='H' || contentP4=='H' || contentP5=='H' || contentP6=='H' || contentP7=='H')
                            )
                    {
                        int lCursorX=-1, lCursorY=-1;
                        char num[3] = {0, 0, 0};
                        int numPtr = 0;
                        for (int idx=cnt+2;idx<cnt+8;cnt++)
                        {
                            if (lCursorX==-1)
                                if (pipeContents[idx]==';')
                                {
                                    lCursorX=0;
                                    idx++; //jump over the ;
                                }
                                else
                                {
                                    numPtr=0;
                                    while (pipeContents[idx+numPtr]!=';')
                                    {
                                        num[numPtr]=pipeContents[idx+numPtr];
                                        numPtr++;
                                    }
                                    num[numPtr]=0;
                                    lCursorX=atoi(num);
                                    idx+=numPtr;
                                    idx++; //jump over the ;
                                }
                            else if (lCursorY==-1)
                            {
                                if (pipeContents[idx]=='H')
                                    lCursorY=0;
                                else
                                {
                                    numPtr=0;
                                    while (pipeContents[idx+numPtr]!='H')
                                    {
                                        num[numPtr]=pipeContents[idx+numPtr];
                                        numPtr++;
                                    }
                                    num[numPtr]=0;
                                    lCursorY=atoi(num);
                                    idx+=numPtr;
                                }
                            }
                            else if (pipeContents[idx]!='H')
                                panic("updateTermBuffer: Error parsing ANSI CUP sequence\n");
                            else
                            {
                                cnt=idx;
                                break;
                            }
                        }
                        term->cursorX = lCursorX;
                        term->cursorY = lCursorY;
                        cursor_update(term);
                        sequenceFound = true;
                        curr=0;
                        break;
                    }
                    switch (contentP2)
                    {
                        case 's':
                            term->savedCursorX = term->cursorX;
                            term->savedCursorY = term->cursorY;
                            cnt+=2;
                            sequenceFound = true;
                            curr=0;
                            break;
                        case 'u':
                            term->cursorX = term->savedCursorX;
                            term->cursorY = term->savedCursorY;
                            cnt+=2;
                            sequenceFound = true;
                            curr=0;
                            break;
                        case 'K':
                            lSavedX = term->cursorX;
                            lSavedY = term->cursorY;
                            for (int cnt=term->cursorX;cnt<term->width;cnt++)
                                processCharacter(device, term, ' ');
                            term->cursorX = lSavedX;
                            term->cursorY = lSavedY;
                            cnt+=2;
                            sequenceFound = true;
                            curr=0;
                            break;
                    }
                    if (!sequenceFound)
                        switch (contentP3)
                        {
                            case 'J':
                                if (contentP2=='2')               //Clear screen
                                {
                                    clearScreen(term, term->screenBuffer);
                                    if (device->stdOutWritePipe == activeSTDOUT)
                                        clearScreen(term, console);
                                    cnt+=3;
                                    curr = 0;
                                }
                                break;
                            case 'D':
                                term->cursorX-=contentP2-48;
                                cnt+=3;
                                curr = 0;
                                break;
                            case 'C':
                                term->cursorX+=contentP2-48;
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
    if (device->stdOutWritePipe == activeSTDOUT)
        cursor_update(term);
}

void updateTerms()
{
    int pipeReadSize;
   for (int cnt=0;cnt<ttysRegistered;cnt++)
    {
        if (ttyDevices[cnt].termDeviceMajor == TERMINAL_CONSOLE_MAJOR_NUMBER)
        {
            if (kTermLock==0)
                while (__sync_lock_test_and_set(&kTermLock, 1));
        //while (__sync_lock_test_and_set(&kTermLock, 1));
            //CLR 1/28/2019: Basic monitor mode is 80x25, which is 4k bytes.  We'll process double that per call to updateTerms
	    //CLR 2/1/2019: Found out we can process 64k in less than a tick so we'll do that!
            pipeReadSize = piperead(pipeContents, 65535,1, ttyDevices[cnt].stdOutReadPipe);
            //pipeReadSize = fs_read(NULL, ttyDevices[cnt].piper, pipeContents, PIPE_FILE_SIZE, 1);
            if (pipeReadSize > 0)
            {
               printd(DEBUG_TERM,"Starting terminal update\n");
               updateTermBuffer(&ttyDevices[cnt], pipeReadSize);
               printd(DEBUG_TERM,"Done terminal update\n");
            }
            else
               printd(DEBUG_TERM,"No terminal update necessary\n");
           __sync_lock_release(&kTermLock);
        }
    }
}
