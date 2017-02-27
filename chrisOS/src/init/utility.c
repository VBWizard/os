#include "utility.h"
#include <stdbool.h>
#include <stddef.h>
#include <stdarg.h>
#include <time.h>
#include "io.h"
#include "chrisos.h"
#include "printf.h"
#include "time.h"
#include "kbd.h"
#include "time_os.h"
#include "i386/gdt.h"
#include "../../../chrisOSKernel/include/tss.h"

extern time_t kSystemStartTime, kSystemCurrentTime;
extern int printk_valist(const char *format, va_list args);
extern uint32_t exceptionAX, exceptionBX, exceptionCX, exceptionDX, exceptionSI, exceptionDI, exceptionBP, exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4, 
            exceptionErrorCode,exceptionCS, exceptionEIP, exceptionSavedESP, exceptionDS, exceptionES, exceptionFS, exceptionGS, exceptionSS, exceptionFlags, exceptionTR;
extern uint32_t  *exceptionSavedStack;
extern uint32_t debugAX, debugBX, debugCX, debugDX, debugSI, debugDI, debugBP, debugCR0, debugCR3, debugCR4, 
            debugErrorCode,debugCS, debugEIP, debugSavedESP, debugDS, debugES, debugFS, debugGS, debugSS, debugFlags;
extern uint32_t  *debugSavedStack;
extern struct gdt_ptr kernelGDT;
extern sGDT* bootGdt;

//#include <string.h>

/* reverse:  reverse string s in place */
extern int strlen(char*);
 void reverse(char s[])
 {
     int i, j;
     char c;

     for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
         c = s[i];
         s[i] = s[j];
         s[j] = c;
     }
 }
 void itoa(int n, char s[])
 {
     int i, sign;

     if ((sign = n) < 0)  /* record sign */
         n = -n;          /* make n positive */
     i = 0;
     do {       /* generate digits in reverse order */
         s[i++] = n % 10 + '0';   /* get next digit */
     } while ((n /= 10) > 0);     /* delete it */
     if (sign < 0)
         s[i++] = '-';
     s[i] = '\0';
     reverse(s);
 }
void itox(unsigned int i, char *s)
{
    unsigned char n;

    s += 4;
    *s = '\0';

    for (n = 8; n != 0; --n) {
        *--s = "0123456789ABCDEF"[i & 0x0F];
        i >>= 4;
    }
}
// A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
int atoi(char *str)
{
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
        res = res*10 + str[i] - '0';
  
    // return result.
    return res;
}

int convert(int s)
{
  int c;
  char hex[] = {'A', 'B', 'C', 'D', 'E', 'F'};
  c = (s >= 0 && s < 9) ? s + '0' : hex[s - 10];
  return c;
}

void itoha(unsigned int n, char *buf)
{
  int i = 0, j =0;
  j=7;
  while(n != 0)
  {
    i = n % 16;
      buf[j--] = convert(i);
      n = (n - i) / 16;
  }
  buf[j] = '\0';
}

void identify_data_sizes(sizeof_t* sizes)
{
    sizes->shortSize = sizeof(short);
    sizes->intSize = sizeof(int);
    sizes->longSize = sizeof(long);
    sizes->longLongSize = sizeof(long long);
    sizes->longLongIntSize = sizeof(long long int);
}

void *memset(void *d1, int val, size_t len)
{
    uint8_t *d = d1;
    uint16_t*e = d1;
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
        *d++ = fVal;
    }
    else if (((len%2)==0))
    while (len-=2) {
        *d++ = eVal;
    }
    else
    while (len--) {
        *d++ = val;
    }
    return d1;
}

uint8_t bcdToDec(uint8_t val)
{
  return ( (val/16*10) + (val%16) );
}

uint8_t decToBcd(uint8_t val)
{
  return ( (val/10*16) + (val%10) );
}
void initSystemDate()
{
    struct tm tmbuf;

    outb(0x70, 0x00);
    tmbuf.tm_sec = bcdToDec(inb(0x71));
    outb(0x70, 0x02);
    tmbuf.tm_min = bcdToDec(inb(0x71));
    outb(0x70, 0x04);
    tmbuf.tm_hour = bcdToDec(inb(0x71));
    outb(0x70, 0x07);
    tmbuf.tm_mday = bcdToDec(inb(0x71));
    outb(0x70, 0x08);
    tmbuf.tm_mon = bcdToDec(inb(0x71));
    outb(0x70, 0x09);
    tmbuf.tm_year = bcdToDec(inb(0x71));
    tmbuf.tm_isdst = -1;
    tmbuf.tm_year += 2000;
    tmbuf.tm_year = tmbuf.tm_year - 1900;
    kSystemStartTime = mktime(&tmbuf);
    kSystemCurrentTime = kSystemStartTime;
//printf("System Date = %d/%d/%d %d:%d:%d\n", tmbuf.tm_mon, tmbuf.tm_mday, tmbuf.tm_year, tmbuf.tm_hour, tmbuf.tm_min, tmbuf.tm_sec, tmbuf.tm_hour, tmbuf.tm_min, tmbuf.tm_sec);
}
char * strtoupper(char* pointerToString)
{
    uint8_t start=0, length=strlen(pointerToString);
    char* myPtr=pointerToString;
    
        // Trim.Start:
        while (start<length)
        {
            if (myPtr[start]>='a' && myPtr[start]<='z')
                myPtr[start]-=32;
            start++;
        }

    return pointerToString;
}

void printDumpedRegs()
{
    uint32_t esp = exceptionSavedESP;
    uint8_t* lCSIPPtr;

    
    lCSIPPtr=(uint8_t*)(exceptionEIP);
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", exceptionAX, exceptionBX, exceptionCX, exceptionDX,exceptionFlags);
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", exceptionBP, exceptionSI, exceptionDI, exceptionSavedESP);
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionFS, exceptionGS);
    printk("GDT=%08X\t TR=0x%08X\n",kernelGDT.base,exceptionTR);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
          printk("Bytes at CS:EIP: ");
/*          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
*/          printk("\n");
          printk ("Stack @ 0x%08x:0x%08X:\n",exceptionSS, esp);
          for (int cnt=0;cnt<10;cnt++)
          {
              printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
              esp+=4;
          }


}

void printDebugRegs()
{
    uint32_t esp = debugSavedESP;
    uint8_t* lCSIPPtr;

    lCSIPPtr=(uint8_t*)(debugEIP);
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", debugAX, debugBX, debugCX, debugDX,debugFlags);
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", debugBP, debugSI, debugDI, debugSavedESP);
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\n", debugCR0, debugCR3, debugCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", debugDS, debugES, debugFS, debugGS);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", debugCS, debugEIP, debugErrorCode);
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
          printk ("Stack @ 0x%08x:0x%08X:\n",debugSS, esp);
          for (int cnt=0;cnt<10;cnt++)
          {
              printk("\t0x%08X%: 0x%08X\n",esp, debugSavedStack[cnt]);
              esp+=4;
          }


}

/*from http://wiki.osdev.org/Reboot*/
/* keyboard interface IO port: data and control
   READ:   status port
   WRITE:  control register */
 
void reboot(bool waitFirst)
{
    uint8_t temp;
 
    if (waitFirst)
    {
        puts("Rebooting ... ");
        __asm__("sti\n");
        wait(3000);
    }
    __asm__ volatile ("cli"); /* disable all interrupts */
 
    /* Clear all keyboard buffers (output and command buffers) */
    do
    {
        temp = inb(KBRD_INTRFC); /* empty user data */
        if (check_flag(temp, KBRD_BIT_KDATA) != 0)
            inb(KBRD_IO); /* empty keyboard data */
    } while (check_flag(temp, KBRD_BIT_UDATA) != 0);
 
    outb(KBRD_INTRFC, KBRD_RESET); /* pulse CPU reset line */
loop:
    __asm__ volatile ("hlt"); /* if that didn't work, halt the CPU */
    goto loop; /* if a NMI is received, halt again */
}

void dumpKernelAddresses()
{
printk("Kernel Variable List:\n");
printk("\tKERNEL_OBJECT_BASE_ADDRESS=0x%08x\n",KERNEL_OBJECT_BASE_ADDRESS);
printk("\tE820_TABLE_ADDRESS=0x%08x (0x%08X)\n",E820_TABLE_ADDRESS);
printk("\tMP_CONFIG_TABLE_ADDRESS=0x%08x\n",MP_CONFIG_TABLE_ADDRESS);
printk("\tKEYBOARD_BUFFER_ADDRESS=0x%08x\n",KEYBOARD_BUFFER_ADDRESS);
printk("\tIDT_TABLE_ADDRESS=0x%08x\n",IDT_TABLE_ADDRESS);
printk("\tINIT_GDT_TABLE_ADDRESS=0x%08x\n",INIT_GDT_TABLE_ADDRESS);
printk("\tTASK_TABLE_ADDRESS=0x%08x\n",TASK_TABLE_ADDRESS);
printk("\tTSS_TABLE_ADDRESS=0x%08x\n",TSS_TABLE_ADDRESS);
printk("\tATA_MBR_ARRAY_ADDRESS=0x%08x\n",ATA_MBR_ARRAY_ADDRESS);
printk("\tPCI_DEVICE_LIST_ADDRESS=0x%08x\n",PCI_DEVICE_LIST_ADDRESS);
printk("\tPCI_BRIDGE_LIST_ADDRESS=0x%08x\n",PCI_BRIDGE_LIST_ADDRESS);
printk("\tPCI_FUNCTION_LIST_ADDRESS=0x%08x\n",PCI_FUNCTION_LIST_ADDRESS);
printk("\tGDT_PMODE_16BIT_TABLE_ADDRESS=0x%08x\n",GDT_PMODE_16BIT_TABLE_ADDRESS);
printk("\tKERNEL_PAGE_DIR_ADDRESS=0x%08x\n",KERNEL_PAGE_DIR_ADDRESS);
printk("\tKERNEL_PAGE_TABLE_BASE_ADDRESS=0x%08x\n",KERNEL_PAGE_TABLE_BASE_ADDRESS);
printk("\tSAVED_STACK_FOR_EXCEPTIONS_ADDRESS=0x%08x\n",SAVED_STACK_FOR_EXCEPTIONS_ADDRESS);
printk("\tSAVED_STACK_FOR_DEBUGGING_ADDRESS=0x%08x\n",SAVED_STACK_FOR_DEBUGGING_ADDRESS);
printk("\tCPU_APIC_REGISTER_REMAP_BASE_ADDRESS=0x%08x\n",CPU_APIC_REGISTER_REMAP_BASE_ADDRESS);
printk("\tCPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS=0x%08x\n",CPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS);
printk("\tKERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS=0x%08x\n",KERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS);
printk("\tAHCI_ABAR_REMAPPED_ADDRESS=0x%08x\n",AHCI_ABAR_REMAPPED_ADDRESS);
printk("\tAHCI_PORT_BASE_REMAP_ADDRESS=0x%08x\n",AHCI_PORT_BASE_REMAP_ADDRESS);
printk("\tAHCI_DISK_BUFFER_ADDRESS=0x%08x\n",AHCI_DISK_BUFFER_ADDRESS);
printk("\tATA_DEVICE_INFO_ADDRESS=0x%08x\n",ATA_DEVICE_INFO_ADDRESS);
printk("\tAHCI_CAPS_ADDRESS=0x%08x\n",AHCI_CAPS_ADDRESS);
printk("\tTSS_AVAILABLE_ADDRESS=0x%08x\n",TASK_AVAILABLE_ADDRESS);
printk("\tGDT_AVAILABLE_ADDRESS=0x%08x\n",GDT_AVAILABLE_ADDRESS);
printk("\tEXEC_FILE_LOAD_INFO=0x%08x\n",EXEC_FILE_LOAD_INFO);
printk("\tAHCI_ABAR_ADDRESS=0x%08x\n",AHCI_ABAR_ADDRESS);
printk("\tEND_OF_KERNEL_OBJECTS_ADDRESS=0x%08x\n",END_OF_KERNEL_OBJECTS_ADDRESS);
}

bool pauseDisplay(bool offerToQuit)
{
    if (offerToQuit)
        printk("Press q to quit, any other key to continue ...");
    else
        printk("Press a key to continue ... ");
    char lPressedKey=waitForKeyboardKey();
    cursorMoveToX(0);
    printk("                                           ");
    cursorMoveToX(0);
    if (lPressedKey=='q' && offerToQuit)
        return true;
    return false;
}

int memPtr=0xe00000;
uintptr_t* mallocTemp(int size)
{
    uintptr_t lRetVal = memPtr;
    memPtr+=size;
    return (uintptr_t*)lRetVal;
}

void dumpGDTTable()
{
    sGDT* theGDT=bootGdt;
    
    printk("Listing GDT Table\n");
    printk("Entry\tBase\t\t\tlimit\t\tAccess\tFlags\n");
    for (int cnt=0;cnt<(int)(kernelGDT.limit/sizeof(sGDT));cnt++)
    {
        if ((theGDT->access & 0x80)!=0 || cnt==0)
        {
            printk("0x%02X\t\t"     /*GDT#*/
                    "0x%08X\t"  /*base*/
                    "0x%08X\t"  /*limit*/
                    "0x%02X\t\t" /*Access*/
                    "0x%01X\n" ,  /*Flags*/
                    cnt,
                    theGDT->base_high<<24 | theGDT->base_middle<<16 | theGDT->base_low,
                    theGDT->limit_low | (theGDT->flags_and_limit & 0x0F)<<16,
                    (uint8_t)theGDT->access,
                    (uint8_t)((theGDT->flags_and_limit&0xF0)>>4));
        }
        theGDT++;
    }
}

void displayTSS(int tssAddress)
{
    tss_t* tss=(tss_t*)tssAddress;
    printk("TSS Entry at 0x%08X:\n",tssAddress);
    printk("\tEAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", tss->EAX, tss->EBX, tss->ECX, tss->EDX,tss->EFLAGS);
    printk("\tEBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\tCR3=%08X\n", tss->EBP, tss->ESI, tss->EDI, tss->ESP,tss->CR3);
    printk("\t DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\tLDT=%08X\n", tss->DS, tss->ES, tss->FS, tss->GS,tss->LDTR);
    printk("\t SS=%08X\tSS0=%08X\tESP0=%08X\tLINK=%08X\tIOP=%08X\n",tss->SS,tss->SS0,tss->ESP0,tss->LINK,tss->IOPB);
    printk("\tCS:EIP = %04X:%08X\n", tss->CS, tss->EIP);
}
