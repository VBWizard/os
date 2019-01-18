#include "utility.h"
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
#include "strings.h"
#include "charDev.h"
#include "i386/kPaging.h"

extern int kTimeZone;
extern time_t kSystemStartTime, kSystemCurrentTime;
extern int printk_valist(const char *format, va_list args);
extern uint32_t exceptionAX, exceptionBX, exceptionCX, exceptionDX, exceptionSI, exceptionDI, exceptionBP, exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4, 
            exceptionErrorCode,exceptionCS, exceptionEIP, exceptionSavedESP, exceptionSavedEBP, exceptionDS, exceptionES, exceptionFS, exceptionGS, exceptionSS, exceptionFlags, exceptionTR;
extern uint32_t  *exceptionSavedStack;
extern uint32_t debugAX, debugBX, debugCX, debugDX, debugSI, debugDI, debugBP, debugCR0, debugCR3, debugCR4, 
            debugErrorCode,debugCS, debugEIP, debugSavedESP, debugDS, debugES, debugFS, debugGS, debugSS, debugFlags;
extern uint32_t  *debugSavedStack;
extern struct gdt_ptr kernelGDT;
extern sGDT* bootGdt;
extern void doNonPagingJump();
extern void doPagingJump();

//#include <string.h>

/* reverse:  reverse string s in place */
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
    uint16_t eVal=(val << 8) | val; //CLR 04/17/2017: Removed "(val << 16) |"
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
        *f++ = fVal;        //CLR 03/11/2017: Changed pointer from d to f
    }
    else if (((len%2)==0))
    while (len-=2) {
        *e++ = eVal;        //CLR 03/11/2017: Changed pointer from d to e
    }
    else
    while (len--) {
        *d++ = (uint8_t)val;
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
    tmbuf.tm_mon-=1;
    outb(0x70, 0x09);
    tmbuf.tm_year = bcdToDec(inb(0x71));
    tmbuf.tm_isdst = -1;
    tmbuf.tm_year += 2000;
    tmbuf.tm_year = tmbuf.tm_year - 1900;
    tmbuf.__tm_gmtoff = -5;
    kTimeZone = -5;
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

#define LOAD_ZERO_BASED_DS     __asm__("mov eax,0x90\nmov ds,eax":::"eax");
#define LOAD_KERNEL_BASED_DS __asm__("mov eax,0x10\nmov ds,eax":::"eax");

//Called by exception 0xd & 0xe (possibly more)
void printPagingExceptionRegs(task_t *task, uint32_t cr2, uint32_t errorCode, bool toLog)
{
    tss_t* tss = task->tss;
    uint32_t *espP = (uint32_t*)tss->ESP;
    
    char content[5000];
    memset(content, 0, 5000);
    char *contentP=content;
    volatile unsigned short *lCSIPPtr=(volatile unsigned short *)tss->CS;
LOAD_ZERO_BASED_DS    
    sprintf(content, "EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", tss->EAX, tss->EBX, tss->ECX, tss->EDX,tss->EFLAGS);
    contentP=content+strlen(content);
    sprintf(contentP, "EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", tss->EBP, tss->ESI, tss->EDI, tss->ESP);
    contentP=content+strlen(content);
    sprintf(contentP, "CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", 0, cr2, task->tss->CR3, 0);
    contentP=content+strlen(content);
    sprintf(contentP, " DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", tss->DS, tss->ES, tss->FS, tss->GS);
    contentP=content+strlen(content);
    sprintf(contentP, "GDT=%08X\t TR=0x%08X\tTRL=0x%08X\n",kernelGDT.base,task->taskNum, tss->LINK);
    contentP=content+strlen(content);
    sprintf(contentP, "CS:EIP = %04X:%08X, error code=%08X\n", tss->CS, tss->EIP, errorCode);
//          printk("Bytes at CS:EIP: ");
//          for (int cnt=0;cnt<19;cnt++)
//              printk("%02X ", lCSIPPtr[cnt]);
//          printk("\n");
    contentP=content+strlen(content);
    sprintf(contentP, "Stack (ss:ebp) @ 0x%08x:0x%08X:\n",tss->SS, espP);
    uint32_t hardStop = ((uint32_t)espP & 0xFFFFF000) + 0x1000;
    for (int cnt=0;cnt<20;cnt++)
    {
        if ((uint32_t)espP >= hardStop)
            break;
printd(DEBUG_EXCEPTIONS, "espP (0x%08X) and hardStop (0x%08X)\n", espP, hardStop);
        sprintf(contentP, "\t0x%08X: 0x%08X\n",espP, *espP);
        espP++;
        contentP=content+strlen(content);
    }
    if (toLog)
        printd(DEBUG_EXCEPTIONS, "%s", content);
    else
        printk("%s", content);
LOAD_KERNEL_BASED_DS
}

//Called by exception 0xd & 0xe (possibly more)
void printDumpedRegs()
{
    uint32_t esp = exceptionSavedESP;
    volatile unsigned short *lCSIPPtr=(volatile unsigned short *)exceptionCS;
LOAD_ZERO_BASED_DS    
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", exceptionAX, exceptionBX, exceptionCX, exceptionDX,exceptionFlags);
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", exceptionBP, exceptionSI, exceptionDI, exceptionSavedESP);
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionFS, exceptionGS);
    printk("GDT=%08X\t TR=0x%08X\n",kernelGDT.base,exceptionTR);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
//          printk("Bytes at CS:EIP: ");
//          for (int cnt=0;cnt<19;cnt++)
//              printk("%02X ", lCSIPPtr[cnt]);
//          printk("\n");
          printk ("Stack (ss:ebp) @ 0x%08x:0x%08X:\n",exceptionSS, esp);
          for (int cnt=0;cnt<20;cnt++)
          {
              printk("\t0x%08X: 0x%08X\n",esp, exceptionSavedStack[cnt]);
              esp+=4;
          }
LOAD_KERNEL_BASED_DS
}

//Called by exception 0xd & 0xe (possibly more)
void logDumpedRegs()
{
    uint32_t esp = exceptionSavedESP;
    volatile unsigned short *lCSIPPtr=(volatile unsigned short *)exceptionCS;
LOAD_ZERO_BASED_DS    
    printd(DEBUG_EXCEPTIONS,"EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", exceptionAX, exceptionBX, exceptionCX, exceptionDX,exceptionFlags);
    printd(DEBUG_EXCEPTIONS,"EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", exceptionBP, exceptionSI, exceptionDI, exceptionSavedESP);
    printd(DEBUG_EXCEPTIONS,"CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
    printd(DEBUG_EXCEPTIONS," DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionFS, exceptionGS);
    printd(DEBUG_EXCEPTIONS,"GDT=%08X\t TR=0x%08X\n",kernelGDT.base,exceptionTR);
    printd(DEBUG_EXCEPTIONS,"CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
//          printd(DEBUG_EXCEPTIONS,"Bytes at CS:EIP: ");
//          for (int cnt=0;cnt<19;cnt++)
//              printd(DEBUG_EXCEPTIONS,"%02X ", lCSIPPtr[cnt]);
//          printd(DEBUG_EXCEPTIONS,"\n");
          printd (DEBUG_EXCEPTIONS,"Stack @ 0x%08x:0x%08X:\n",exceptionSS, esp);
          for (int cnt=0;cnt<40;cnt++)
          {
              printd(DEBUG_EXCEPTIONS,"\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
              esp+=4;
          }
LOAD_KERNEL_BASED_DS
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
printk("\tKERNEL_PAGE_DIR_ADDRESS=0x%08x\n",KERNEL_CR3);
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
void* mallocTemp(int size)
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

void dumpIDTTable()
{
    struct idt_entry* idtTable=(struct idt_entry*)IDT_TABLE_ADDRESS;
    
    printk("Listing the IDT Table\n");
    printk("Entry\tSel\tBase\t\t\tFlags\n");
    for (int cnt=0;cnt<255;cnt++)
    {
        if (idtTable->sel>0)
        {
            printk ("0x%02X\t0x%04X\t0x%08X\t0x%02X\n",
                    cnt,
                    idtTable->sel,
                    idtTable->base_hi<<16|idtTable->base_lo,idtTable->flags);
        }
        idtTable++;
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

void HIGH_CODE_SECTION dumpP(char* cmdline)
{
    char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH];
    int paramCount=parseParamsShell(cmdline, params, MAX_PARAM_WIDTH*MAX_PARAM_COUNT);
    int lCount=0;
    uint32_t lAddress=0;
    char lCharType=' ', lCharSize=' ';
    int lTemp=0;
    char lTempS[MAX_PARAM_WIDTH];
    bool addrIsVirtual=false;
    uint32_t cr3=0;
    
//    for (int cnt=0;cnt<paramCount;cnt++)
//        printk("Param # %u is %s\n", cnt, params[cnt]);
    
    memset(lTempS,0,MAX_PARAM_WIDTH);
    for (int cnt=0;cnt<=paramCount;cnt++)
    {
        //printk("Processing parameter %u, value='%s'\n",cnt,params[cnt]);
        if (params[cnt][0]=='v')
        {
            //printk("Address is virtual parameter found\n");
            addrIsVirtual=true;
        }
        else if (params[cnt][0]=='/')
        {
            lTemp=1;
            while (ISDIGIT(params[cnt][lTemp]))
            {
                lTempS[lTemp-1]=params[cnt][lTemp];
                lTemp++;
            }
            lCount=atoi(lTempS);
            lCharSize=params[cnt][lTemp++];
            lCharType=params[cnt][lTemp++];
        }
        else if (lAddress==0)
        {
            lAddress=strtoul(params[cnt],0,16);
        }
        else if (params[cnt][0]!=0)
        {
            cr3=strtoul(params[cnt],0,16);
            printk("Using CR3=0x%08X",cr3);
        }
    }
//    if (addrIsVirtual)
//    {
//        printk("Converted 0x%08X to ",lAddress);
//        lAddress=__pa(lAddress);
//        printk("%0x%08X\n", lAddress);
//    }
    if (lCount>65535)
    {
        printk("\nError: Count is too large (%u), max is 500, can't dump", lCount);
        return;
    }
    if (lCharSize!='b' && lCharSize!='h' && lCharSize!='w' && lCharSize!='d')
    {
        printk("\nError: Character size (%c) must be in bhwd", lCharSize);
        return;
    }
    if (lCharType!='x' && lCharType!='c' && lCharType!='e')
    {
        printk("\nError: Character type (%c) must be in xce", lCharType);
        return;
    }
/*    if ((lAddress>kE820MemoryBytes || lAddress+lCount>kE820MemoryBytes) && (!addrIsVirtual))
    {
        printk("Error: Requested address (0x%08X) or address+count (0x%08X) > memory size ()", lAddress, lAddress+lCount);
        return;
    }*/
    
    if (cr3!=0)
    {
        lAddress=(kPagingGet4kPTEntryValueCR3(cr3,lAddress) & 0xFFFFF000) | (lAddress & 0x00000FFF) ;
        printk(", physical address is 0x%08X\n");
    }
    else
        printk("\n");
    
    printk("dump");
    if (addrIsVirtual)
        printk("V");
    else
        printk("P");
    printk(": Dumping %u %c (%c) from 0x%08X\n", lCount, lCharSize , lCharType, lAddress);
    __asm__("mov eax,0x90\nmov ds,eax\n":::"eax");
    uint8_t* mem=(uint8_t*)lAddress;
    uint16_t* memw=(uint16_t*)lAddress;
    uint32_t* memd=(uint32_t*)lAddress;
    uint32_t* memq=(uint32_t*)lAddress;
    int lineCount=0;
    int lEntriesPerLine;
    if (lCharSize=='b')
        lEntriesPerLine=15;
    if (lCharSize=='h')
        lEntriesPerLine=8;
    else if (lCharSize=='w')
        lEntriesPerLine=4;
    else
        lEntriesPerLine=3;
    lTemp=0; //column
    if (!addrIsVirtual)
    {
        SWITCH_TO_NON_KERNEL_DATA_AND_STACK
        __asm__("cli\n");
        doNonPagingJump();
    }
    if (lCharSize=='b')
    {
        printk("%08X:\t", &mem[0]);
        for (int cnt=0;cnt<lCount;cnt++)
        {
            //After every 16 bytes, print the character values, a newline, and the start address of the next 16 bytes
            if (lTemp==16)
            {
                puts(" ");
                for (int cnt2=0;cnt2<16;cnt2++)
                {
                    if (ISALPHA(lTempS[cnt2]) || ISDIGIT(lTempS[cnt2]) || (lTempS[cnt2]>=32&&lTempS[cnt2]<=47) || (lTempS[cnt2]>=123&&lTempS[cnt2]<=126) || (lTempS[cnt2]>=91&&lTempS[cnt2]<=96) || (lTempS[cnt2]>=58&&lTempS[cnt2]<=64) )
                        printk("%c",lTempS[cnt2]);
                    else
                        puts(".");
                }
                puts("\n");
                if (++lineCount==SYS_VGA_HEIGHT-1)
                {
                    if (pauseDisplay(true))
                        break;
                    lineCount=0;
                }
                printk("%08X:\t", &mem[cnt]);
                lTemp=0;
            }
            printk("%02X ",mem[cnt]);
            lTempS[lTemp++]=mem[cnt];
            if (lTemp%4==0)
                printk(" ");
        }
    }
    else
        printk("%08X:", &memw[0]);
        for (int cnt=0;cnt<lCount;cnt++)
        {
            if (lTemp==lEntriesPerLine)
            {
                puts("\n");
                if (++lineCount==SYS_VGA_HEIGHT-1)
                {
                    if (pauseDisplay(true))
                        break;
                    lineCount=0;
                }
                lTemp=0;
                if (lCharSize=='h')
                    printk("%08X:", &memw[cnt]);
                else if (lCharSize=='w')
                    printk("%08X:", &memd[cnt]);
                else
                    printk("%08X:", &memq[cnt]);
            }
            if (lCharSize=='h')
                printk("%04X ",memw[cnt]);
            else if (lCharSize=='w')
                printk("%08X ", memd[cnt]);
            lTemp++;
        }
    puts("\n");
    if (!addrIsVirtual)
    {
        __asm__("push eax\nmov eax,cr0\n or eax,0x80000000\n mov cr0,eax\nljmp 0x20:pEnableJmp\npEnableJmp:pop eax\n");
       doPagingJump();
        SWITCH_TO_KERNEL_DATA_AND_STACK
        __asm__("sti\n");
    }
    __asm__("mov eax,0x18\nmov ds,eax\n":::"eax");
}

int HIGH_CODE_SECTION parseParamsShell(char* cmdLine, char params[MAX_PARAM_COUNT][MAX_PARAM_WIDTH], int size)
    {
    int x=0,y=0;
    int lRetVal=0,parsedChars=0;
    
    memset(params,0, size);
    //printk("commandLine=%s\n",cmdLine);
    for (unsigned cnt=0;cnt<strlen(cmdLine);cnt++)
    {
        //printk("c=%c\n", cmdLine[cnt]);
        if ( (cmdLine[cnt]==' ' || cmdLine[cnt]=='-') || cmdLine[cnt]==',')
        {
            //printk("Found a delimiter (%c), incrementing y to %u, setting x to 0\n",cmdLine[cnt],y+1);
            if (cmdLine[cnt]=='-' || cmdLine[cnt]=='/')
                params[y][x++]=cmdLine[cnt];
            params[y][x]='\0';
            if (cnt>0)
                {x=0;y++;lRetVal++;}
        }
        else
        {
            //printk("Found a character to put at position %u,%u\n",y,x);
            params[y][x++]=cmdLine[cnt];
        }
        parsedChars++;
    }
    if (parsedChars)
    {
        lRetVal++;
        params[y][x]='\0';
    }
    //printk("Returning %u parameters:\n", lRetVal);
    //for (int cnt=0;cnt<lRetVal;cnt++)
        //printk("\tParameter %u: '%s'\n", cnt, params[cnt]);
    return lRetVal;
}