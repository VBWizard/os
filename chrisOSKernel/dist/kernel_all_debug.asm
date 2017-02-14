
Debug/cross-Linux/kernel:     file format elf32-i386


Disassembly of section .text:

01000000 <dumpregs>:
kernelLoadAddress():
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:22

.globl dumpregs
.type dumpregs, @function
dumpregs:
.code32
        mov exceptionAX, eax
 1000000:	a3 b0 01 12 00       	mov    ds:0x1201b0,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:23
        mov exceptionBX, ebx
 1000005:	89 1d b4 01 12 00    	mov    DWORD PTR ds:0x1201b4,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:24
        mov exceptionCX, ecx
 100000b:	89 0d b8 01 12 00    	mov    DWORD PTR ds:0x1201b8,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:25
        mov exceptionDX, edx
 1000011:	89 15 bc 01 12 00    	mov    DWORD PTR ds:0x1201bc,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:26
        mov exceptionSI, esi
 1000017:	89 35 c0 01 12 00    	mov    DWORD PTR ds:0x1201c0,esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:27
        mov exceptionDI, edi
 100001d:	89 3d c4 01 12 00    	mov    DWORD PTR ds:0x1201c4,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:28
        mov exceptionBP, eax
 1000023:	a3 c8 01 12 00       	mov    ds:0x1201c8,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:29
        mov eax, cr0
 1000028:	0f 20 c0             	mov    eax,cr0
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:30
        mov exceptionCR0, eax
 100002b:	a3 cc 01 12 00       	mov    ds:0x1201cc,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:31
        mov eax, cr3
 1000030:	0f 20 d8             	mov    eax,cr3
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:32
        mov exceptionCR3, eax
 1000033:	a3 d0 01 12 00       	mov    ds:0x1201d0,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:33
        mov eax, cr4
 1000038:	0f 20 e0             	mov    eax,cr4
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:34
        mov exceptionCR4, eax
 100003b:	a3 d4 01 12 00       	mov    ds:0x1201d4,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:35
        mov eax, exceptionAX
 1000040:	a1 b0 01 12 00       	mov    eax,ds:0x1201b0
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:36
        ret 
 1000045:	c3                   	ret    

01000046 <storeGDT>:
storeGDT():
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:42

.global storeGDT
.type storeGDT, @function
storeGDT:
.code32
    mov eax,[esp+4]
 1000046:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:43
    sgdt [eax]
 100004a:	0f 01 00             	sgdtd  [eax]
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:44
    ret
 100004d:	c3                   	ret    
 100004e:	66 90                	xchg   ax,ax

01000050 <update_cursor>:
update_cursor():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:26
KERNEL_DATA_SECTION int8_t savedPosPointer=0;
KERNEL_DATA_SECTION uint8_t kTerminalHeight;

void update_cursor()
 {
    unsigned short position=(terminal_row*VGA_WIDTH) + terminal_column;
 1000050:	8b 0d 00 00 12 00    	mov    ecx,DWORD PTR ds:0x120000
 1000056:	8d 0c 89             	lea    ecx,[ecx+ecx*4]
 1000059:	c1 e1 04             	shl    ecx,0x4
 100005c:	66 03 0d 04 00 12 00 	add    cx,WORD PTR ds:0x120004
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1000063:	ba d4 03 00 00       	mov    edx,0x3d4
 1000068:	b8 0f 00 00 00       	mov    eax,0xf
 100006d:	ee                   	out    dx,al
 100006e:	ba d5 03 00 00       	mov    edx,0x3d5
 1000073:	89 c8                	mov    eax,ecx
 1000075:	ee                   	out    dx,al
 1000076:	ba d4 03 00 00       	mov    edx,0x3d4
 100007b:	b8 0e 00 00 00       	mov    eax,0xe
 1000080:	ee                   	out    dx,al
 1000081:	89 c8                	mov    eax,ecx
 1000083:	66 c1 e8 08          	shr    ax,0x8
 1000087:	ba d5 03 00 00       	mov    edx,0x3d5
 100008c:	ee                   	out    dx,al
 100008d:	c3                   	ret    

0100008e <make_color>:
make_color():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:38
    outb(0x3D5, (unsigned char )((position>>8)&0xFF));
    //Move the cursor in the bios data area
 }

uint8_t make_color(enum vga_color fg, enum vga_color bg) {
        return fg | bg << 4;
 100008e:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 1000093:	c1 e0 04             	shl    eax,0x4
 1000096:	0a 44 24 04          	or     al,BYTE PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:39
}
 100009a:	c3                   	ret    

0100009b <make_vgaentry>:
make_vgaentry():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:44

uint16_t make_vgaentry(char c, uint8_t color) {
        uint16_t c16 = c;
        uint16_t color16 = color;
        return c16 | color16 << 8;
 100009b:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 10000a0:	c1 e0 08             	shl    eax,0x8
 10000a3:	66 0f be 54 24 04    	movsx  dx,BYTE PTR [esp+0x4]
 10000a9:	09 d0                	or     eax,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:45
}
 10000ab:	c3                   	ret    

010000ac <terminal_setcolor>:
terminal_setcolor():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:49


void terminal_setcolor(uint8_t color) {
        terminal_color = color;
 10000ac:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 10000b0:	a2 08 00 12 00       	mov    ds:0x120008,al
 10000b5:	c3                   	ret    

010000b6 <terminal_putentryat>:
terminal_putentryat():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:52
}

void terminal_putentryat(char c, uint8_t color, size_t x, size_t y) {
 10000b6:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:54
    const size_t index = y * VGA_WIDTH + x;
        terminal_buffer[index] = make_vgaentry(c, color);
 10000ba:	8d 04 80             	lea    eax,[eax+eax*4]
 10000bd:	c1 e0 04             	shl    eax,0x4
 10000c0:	03 44 24 0c          	add    eax,DWORD PTR [esp+0xc]
 10000c4:	0f b6 54 24 08       	movzx  edx,BYTE PTR [esp+0x8]
 10000c9:	c1 e2 08             	shl    edx,0x8
 10000cc:	66 0f be 4c 24 04    	movsx  cx,BYTE PTR [esp+0x4]
 10000d2:	09 ca                	or     edx,ecx
 10000d4:	8b 0d 0c 00 12 00    	mov    ecx,DWORD PTR ds:0x12000c
 10000da:	66 89 14 41          	mov    WORD PTR [ecx+eax*2],dx
 10000de:	c3                   	ret    

010000df <cursorSavePosition>:
cursorSavePosition():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:59
}

void cursorSavePosition()
{
    if (savedPosPointer < 10)
 10000df:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
 10000e6:	3c 09                	cmp    al,0x9
 10000e8:	7f 23                	jg     100010d <cursorSavePosition+0x2e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:61
    {
        savedPosX[++savedPosPointer] = terminal_column;
 10000ea:	83 c0 01             	add    eax,0x1
 10000ed:	a2 26 00 12 00       	mov    ds:0x120026,al
 10000f2:	0f be c0             	movsx  eax,al
 10000f5:	8b 15 04 00 12 00    	mov    edx,DWORD PTR ds:0x120004
 10000fb:	88 90 10 00 12 00    	mov    BYTE PTR [eax+0x120010],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:62
        savedPosY[savedPosPointer] = terminal_row;
 1000101:	8b 15 00 00 12 00    	mov    edx,DWORD PTR ds:0x120000
 1000107:	88 90 1c 00 12 00    	mov    BYTE PTR [eax+0x12001c],dl
 100010d:	f3 c3                	repz ret 

0100010f <cursorRestorePosition>:
cursorRestorePosition():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:68
    }
}

void cursorRestorePosition()
{
    if (savedPosPointer > 0)
 100010f:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
 1000116:	84 c0                	test   al,al
 1000118:	7e 29                	jle    1000143 <cursorRestorePosition+0x34>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:70
    {
        terminal_column = savedPosX[savedPosPointer];
 100011a:	0f be d0             	movsx  edx,al
 100011d:	0f b6 8a 10 00 12 00 	movzx  ecx,BYTE PTR [edx+0x120010]
 1000124:	89 0d 04 00 12 00    	mov    DWORD PTR ds:0x120004,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:71
        terminal_row = savedPosY[savedPosPointer--];
 100012a:	83 e8 01             	sub    eax,0x1
 100012d:	a2 26 00 12 00       	mov    ds:0x120026,al
 1000132:	0f b6 82 1c 00 12 00 	movzx  eax,BYTE PTR [edx+0x12001c]
 1000139:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:72
        update_cursor();
 100013e:	e8 0d ff ff ff       	call   1000050 <update_cursor>
 1000143:	f3 c3                	repz ret 

01000145 <terminal_clear>:
terminal_clear():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:77
    }
}

void terminal_clear()
{
 1000145:	56                   	push   esi
 1000146:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:79
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
 1000147:	ba 00 00 00 00       	mov    edx,0x0
 100014c:	be 00 00 00 00       	mov    esi,0x0
 1000151:	80 3d 27 00 12 00 00 	cmp    BYTE PTR ds:0x120027,0x0
 1000158:	75 30                	jne    100018a <terminal_clear+0x45>
 100015a:	eb 36                	jmp    1000192 <terminal_clear+0x4d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:82 (discriminator 3)
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
 100015c:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
 1000163:	c1 e0 08             	shl    eax,0x8
 1000166:	83 c8 20             	or     eax,0x20
 1000169:	8b 0d 0c 00 12 00    	mov    ecx,DWORD PTR ds:0x12000c
 100016f:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
 1000173:	83 c2 02             	add    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:80 (discriminator 3)

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
                for (size_t x = 0; x < VGA_WIDTH; x++) {
 1000176:	39 d3                	cmp    ebx,edx
 1000178:	75 e2                	jne    100015c <terminal_clear+0x17>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:79 (discriminator 2)
}

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
 100017a:	83 c6 01             	add    esi,0x1
 100017d:	89 da                	mov    edx,ebx
 100017f:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
 1000186:	39 f0                	cmp    eax,esi
 1000188:	76 08                	jbe    1000192 <terminal_clear+0x4d>
 100018a:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
 1000190:	eb ca                	jmp    100015c <terminal_clear+0x17>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:85
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
                }
        }
    terminal_column=0;
 1000192:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
 1000199:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:86
    terminal_row=0;
 100019c:	c7 05 00 00 12 00 00 	mov    DWORD PTR ds:0x120000,0x0
 10001a3:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:87
    update_cursor();
 10001a6:	e8 a5 fe ff ff       	call   1000050 <update_cursor>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:88
}
 10001ab:	5b                   	pop    ebx
 10001ac:	5e                   	pop    esi
 10001ad:	c3                   	ret    

010001ae <terminal_clear_line>:
terminal_clear_line():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:91

void terminal_clear_line(unsigned lineNo)
{
 10001ae:	53                   	push   ebx
 10001af:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:92
    if (lineNo>SYS_VGA_HEIGHT-1)
 10001b3:	83 f8 31             	cmp    eax,0x31
 10001b6:	77 2a                	ja     10001e2 <terminal_clear_line+0x34>
 10001b8:	8d 14 80             	lea    edx,[eax+eax*4]
 10001bb:	c1 e2 05             	shl    edx,0x5
 10001be:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:97 (discriminator 3)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
 10001c4:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
 10001cb:	c1 e0 08             	shl    eax,0x8
 10001ce:	83 c8 20             	or     eax,0x20
 10001d1:	8b 0d 0c 00 12 00    	mov    ecx,DWORD PTR ds:0x12000c
 10001d7:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
 10001db:	83 c2 02             	add    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:94 (discriminator 3)

void terminal_clear_line(unsigned lineNo)
{
    if (lineNo>SYS_VGA_HEIGHT-1)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
 10001de:	39 da                	cmp    edx,ebx
 10001e0:	75 e2                	jne    10001c4 <terminal_clear_line+0x16>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:99
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
    }
}
 10001e2:	5b                   	pop    ebx
 10001e3:	c3                   	ret    

010001e4 <terminal_copyline>:
terminal_copyline():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:102

void terminal_copyline(unsigned dstLine, unsigned srcLine)
{
 10001e4:	83 ec 10             	sub    esp,0x10
 10001e7:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
 10001eb:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:107
    unsigned rowBytes = VGA_WIDTH*2;
    uintptr_t dest=(uintptr_t)TEXTMODE_MEMORY_START+(dstLine*rowBytes);
    uintptr_t src=(uintptr_t)TEXTMODE_MEMORY_START+(srcLine*rowBytes);
    
    memcpy((void*)dest,(void*)src,rowBytes);
 10001ef:	68 a0 00 00 00       	push   0xa0
 10001f4:	8d 04 80             	lea    eax,[eax+eax*4]
 10001f7:	c1 e0 05             	shl    eax,0x5
 10001fa:	05 00 80 0b 00       	add    eax,0xb8000
 10001ff:	50                   	push   eax
 1000200:	8d 04 92             	lea    eax,[edx+edx*4]
 1000203:	c1 e0 05             	shl    eax,0x5
 1000206:	05 00 80 0b 00       	add    eax,0xb8000
 100020b:	50                   	push   eax
 100020c:	e8 f7 1d 00 00       	call   1002008 <memcpy>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:108
}
 1000211:	83 c4 1c             	add    esp,0x1c
 1000214:	c3                   	ret    

01000215 <terminal_putchar>:
terminal_putchar():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:110

void terminal_putchar(char c) {
 1000215:	53                   	push   ebx
 1000216:	83 ec 08             	sub    esp,0x8
 1000219:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:111
    if (c=='\n')
 100021d:	3c 0a                	cmp    al,0xa
 100021f:	75 16                	jne    1000237 <terminal_putchar+0x22>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:113
    {
            terminal_column = 0;
 1000221:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
 1000228:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:114
            terminal_row += 1;
 100022b:	83 05 00 00 12 00 01 	add    DWORD PTR ds:0x120000,0x1
 1000232:	e9 d8 00 00 00       	jmp    100030f <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:116
    }
    else if (c=='\b')
 1000237:	3c 08                	cmp    al,0x8
 1000239:	75 48                	jne    1000283 <terminal_putchar+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:118
    {
        if (terminal_column > 1)
 100023b:	a1 04 00 12 00       	mov    eax,ds:0x120004
 1000240:	83 f8 01             	cmp    eax,0x1
 1000243:	76 0a                	jbe    100024f <terminal_putchar+0x3a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:119
            terminal_column--;
 1000245:	83 e8 01             	sub    eax,0x1
 1000248:	a3 04 00 12 00       	mov    ds:0x120004,eax
 100024d:	eb 11                	jmp    1000260 <terminal_putchar+0x4b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:122
        else
        {
            terminal_row--;
 100024f:	83 2d 00 00 12 00 01 	sub    DWORD PTR ds:0x120000,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:123
            terminal_column=VGA_WIDTH;
 1000256:	c7 05 04 00 12 00 50 	mov    DWORD PTR ds:0x120004,0x50
 100025d:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:125
        }
        terminal_putentryat(' ', terminal_color, terminal_column, terminal_row);
 1000260:	ff 35 00 00 12 00    	push   DWORD PTR ds:0x120000
 1000266:	ff 35 04 00 12 00    	push   DWORD PTR ds:0x120004
 100026c:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
 1000273:	50                   	push   eax
 1000274:	6a 20                	push   0x20
 1000276:	e8 3b fe ff ff       	call   10000b6 <terminal_putentryat>
 100027b:	83 c4 10             	add    esp,0x10
 100027e:	e9 8c 00 00 00       	jmp    100030f <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:128
        
    }
    else if (c=='\t')
 1000283:	3c 09                	cmp    al,0x9
 1000285:	75 3b                	jne    10002c2 <terminal_putchar+0xad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:130
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
 1000287:	8b 0d 04 00 12 00    	mov    ecx,DWORD PTR ds:0x120004
 100028d:	ba cd cc cc cc       	mov    edx,0xcccccccd
 1000292:	89 c8                	mov    eax,ecx
 1000294:	f7 e2                	mul    edx
 1000296:	c1 ea 02             	shr    edx,0x2
 1000299:	8d 5c 92 05          	lea    ebx,[edx+edx*4+0x5]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:132
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
 100029d:	39 d9                	cmp    ecx,ebx
 100029f:	b8 05 00 00 00       	mov    eax,0x5
 10002a4:	0f 44 d8             	cmove  ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:134
        
        while (terminal_column < goTo)
 10002a7:	39 d9                	cmp    ecx,ebx
 10002a9:	73 64                	jae    100030f <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:135
            terminal_putchar(' ');;
 10002ab:	83 ec 0c             	sub    esp,0xc
 10002ae:	6a 20                	push   0x20
 10002b0:	e8 60 ff ff ff       	call   1000215 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:134
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
        
        while (terminal_column < goTo)
 10002b5:	83 c4 10             	add    esp,0x10
 10002b8:	3b 1d 04 00 12 00    	cmp    ebx,DWORD PTR ds:0x120004
 10002be:	77 eb                	ja     10002ab <terminal_putchar+0x96>
 10002c0:	eb 4d                	jmp    100030f <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:141
    
    //6 - cnt=0 to (5-1) 4
    //8 - cnt= to (5-3) 2
    }
    //We're going to ignore carriage return since most systems don't use it.  Unfortunately the FAT library we are using does
    else if (c=='\r')
 10002c2:	3c 0d                	cmp    al,0xd
 10002c4:	0f 84 86 00 00 00    	je     1000350 <terminal_putchar+0x13b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:146
        return;

        else
        {
                terminal_putentryat(c, terminal_color, terminal_column, terminal_row);
 10002ca:	ff 35 00 00 12 00    	push   DWORD PTR ds:0x120000
 10002d0:	ff 35 04 00 12 00    	push   DWORD PTR ds:0x120004
 10002d6:	0f b6 15 08 00 12 00 	movzx  edx,BYTE PTR ds:0x120008
 10002dd:	52                   	push   edx
 10002de:	0f be c0             	movsx  eax,al
 10002e1:	50                   	push   eax
 10002e2:	e8 cf fd ff ff       	call   10000b6 <terminal_putentryat>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:147
                if (++terminal_column == VGA_WIDTH) {
 10002e7:	a1 04 00 12 00       	mov    eax,ds:0x120004
 10002ec:	83 c0 01             	add    eax,0x1
 10002ef:	83 c4 10             	add    esp,0x10
 10002f2:	83 f8 50             	cmp    eax,0x50
 10002f5:	74 07                	je     10002fe <terminal_putchar+0xe9>
 10002f7:	a3 04 00 12 00       	mov    ds:0x120004,eax
 10002fc:	eb 11                	jmp    100030f <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:148
                        terminal_column = 0;
 10002fe:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
 1000305:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:149
                        terminal_row++;
 1000308:	83 05 00 00 12 00 01 	add    DWORD PTR ds:0x120000,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:152
                }
        }
    if (terminal_row == kTerminalHeight)
 100030f:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
 1000316:	3b 05 00 00 12 00    	cmp    eax,DWORD PTR ds:0x120000
 100031c:	75 2d                	jne    100034b <terminal_putchar+0x136>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:154 (discriminator 1)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
 100031e:	85 c0                	test   eax,eax
 1000320:	74 22                	je     1000344 <terminal_putchar+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:154
 1000322:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:155 (discriminator 3)
            terminal_copyline(row, row+1);
 1000327:	8d 58 01             	lea    ebx,[eax+0x1]
 100032a:	83 ec 08             	sub    esp,0x8
 100032d:	53                   	push   ebx
 100032e:	50                   	push   eax
 100032f:	e8 b0 fe ff ff       	call   10001e4 <terminal_copyline>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:154 (discriminator 3)
                        terminal_row++;
                }
        }
    if (terminal_row == kTerminalHeight)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
 1000334:	89 d8                	mov    eax,ebx
 1000336:	0f b6 15 27 00 12 00 	movzx  edx,BYTE PTR ds:0x120027
 100033d:	83 c4 10             	add    esp,0x10
 1000340:	39 da                	cmp    edx,ebx
 1000342:	77 e3                	ja     1000327 <terminal_putchar+0x112>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:157
            terminal_copyline(row, row+1);
        //memcpy((void *)TEXTMODE_MEMORY_START, (void *)TEXTMODE_MEMORY_START+160, 160*25);
        terminal_row--;
 1000344:	83 2d 00 00 12 00 01 	sub    DWORD PTR ds:0x120000,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:159
    }
    update_cursor();
 100034b:	e8 00 fd ff ff       	call   1000050 <update_cursor>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:160
}
 1000350:	83 c4 08             	add    esp,0x8
 1000353:	5b                   	pop    ebx
 1000354:	c3                   	ret    

01000355 <cursorUpdateBiosCursor>:
cursorUpdateBiosCursor():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:165

void cursorUpdateBiosCursor()
{
    uint8_t* bda=(uint8_t*)0x450;
    *bda=(uint8_t)(terminal_column & 0xFF);
 1000355:	a1 04 00 12 00       	mov    eax,ds:0x120004
 100035a:	a2 50 04 00 00       	mov    ds:0x450,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:167
    bda++;
    *bda=(uint8_t)((terminal_row+3) & 0xFF);
 100035f:	0f b6 05 00 00 12 00 	movzx  eax,BYTE PTR ds:0x120000
 1000366:	83 c0 03             	add    eax,0x3
 1000369:	a2 51 04 00 00       	mov    ds:0x451,al
 100036e:	c3                   	ret    

0100036f <cursorMoveTo>:
cursorMoveTo():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:172
}

void cursorMoveTo(uint8_t x, uint8_t y)
{
    terminal_row = y;
 100036f:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 1000374:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:173
    terminal_column = x;
 1000379:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 100037e:	a3 04 00 12 00       	mov    ds:0x120004,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:174
    update_cursor();
 1000383:	e8 c8 fc ff ff       	call   1000050 <update_cursor>
 1000388:	f3 c3                	repz ret 

0100038a <cursorMoveToX>:
cursorMoveToX():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:179
}

void cursorMoveToX(uint8_t x)
{
    terminal_column = x;
 100038a:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 100038f:	a3 04 00 12 00       	mov    ds:0x120004,eax
 1000394:	c3                   	ret    

01000395 <cursorMoveToY>:
cursorMoveToY():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:184
}

void cursorMoveToY(uint8_t y)
{
    terminal_row = y;
 1000395:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 100039a:	a3 00 00 12 00       	mov    ds:0x120000,eax
 100039f:	c3                   	ret    

010003a0 <cursorGetPosX>:
cursorGetPosX():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:190
}

uint8_t cursorGetPosX()
{
    return terminal_column;
}
 10003a0:	0f b6 05 04 00 12 00 	movzx  eax,BYTE PTR ds:0x120004
 10003a7:	c3                   	ret    

010003a8 <cursorGetMaxX>:
cursorGetMaxX():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:194
int cursorGetMaxX()
{
    return VGA_WIDTH;
}
 10003a8:	b8 50 00 00 00       	mov    eax,0x50
 10003ad:	c3                   	ret    

010003ae <cursorGetMaxY>:
cursorGetMaxY():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:198

int cursorGetMaxY()
{
    return kTerminalHeight;
 10003ae:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:199
}
 10003b5:	c3                   	ret    

010003b6 <displayGetMaxXY>:
displayGetMaxXY():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:203

void displayGetMaxXY(int* maxX, int* maxY)
{
    *maxX=VGA_WIDTH;
 10003b6:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 10003ba:	c7 00 50 00 00 00    	mov    DWORD PTR [eax],0x50
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:204
    *maxY=kTerminalHeight;
 10003c0:	0f b6 15 27 00 12 00 	movzx  edx,BYTE PTR ds:0x120027
 10003c7:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10003cb:	89 10                	mov    DWORD PTR [eax],edx
 10003cd:	c3                   	ret    

010003ce <cursorGetPosY>:
cursorGetPosY():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:211
}

uint8_t cursorGetPosY()
{
    return terminal_row;
}
 10003ce:	0f b6 05 00 00 12 00 	movzx  eax,BYTE PTR ds:0x120000
 10003d5:	c3                   	ret    

010003d6 <kTermPrint>:
kTermPrint():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:213

void kTermPrint(const char* data) {
 10003d6:	56                   	push   esi
 10003d7:	53                   	push   ebx
 10003d8:	83 ec 10             	sub    esp,0x10
 10003db:	8b 74 24 1c          	mov    esi,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:214
        size_t datalen = strlen(data);
 10003df:	56                   	push   esi
 10003e0:	e8 3f 22 00 00       	call   1002624 <strlen>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:215
        for (size_t i = 0; i < datalen; i++)
 10003e5:	83 c4 10             	add    esp,0x10
 10003e8:	85 c0                	test   eax,eax
 10003ea:	74 1a                	je     1000406 <kTermPrint+0x30>
 10003ec:	89 f3                	mov    ebx,esi
 10003ee:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:216 (discriminator 3)
                terminal_putchar(data[i]);
 10003f0:	83 ec 0c             	sub    esp,0xc
 10003f3:	0f be 13             	movsx  edx,BYTE PTR [ebx]
 10003f6:	52                   	push   edx
 10003f7:	e8 19 fe ff ff       	call   1000215 <terminal_putchar>
 10003fc:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:215 (discriminator 3)
    return terminal_row;
}

void kTermPrint(const char* data) {
        size_t datalen = strlen(data);
        for (size_t i = 0; i < datalen; i++)
 10003ff:	83 c4 10             	add    esp,0x10
 1000402:	39 f3                	cmp    ebx,esi
 1000404:	75 ea                	jne    10003f0 <kTermPrint+0x1a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:217
                terminal_putchar(data[i]);
}
 1000406:	83 c4 04             	add    esp,0x4
 1000409:	5b                   	pop    ebx
 100040a:	5e                   	pop    esi
 100040b:	c3                   	ret    

0100040c <kTermInit>:
kTermInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:221


void kTermInit() {
    kTerminalHeight=SYS_VGA_HEIGHT;
 100040c:	c6 05 27 00 12 00 32 	mov    BYTE PTR ds:0x120027,0x32
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:222
    terminal_row = 0;
 1000413:	c7 05 00 00 12 00 00 	mov    DWORD PTR ds:0x120000,0x0
 100041a:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:223
    terminal_column = 0;
 100041d:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
 1000424:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:224
    terminal_color = make_color(COLOR_LIGHT_BROWN, COLOR_BLACK);
 1000427:	c6 05 08 00 12 00 0e 	mov    BYTE PTR ds:0x120008,0xe
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:225
    terminal_buffer = (uint16_t*) TEXTMODE_MEMORY_START;
 100042e:	c7 05 0c 00 12 00 00 	mov    DWORD PTR ds:0x12000c,0xb8000
 1000435:	80 0b 00 
 1000438:	c3                   	ret    

01000439 <puts>:
puts():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:230
    //terminal_clear();
}

void puts(char* in)
{
 1000439:	53                   	push   ebx
 100043a:	83 ec 08             	sub    esp,0x8
 100043d:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:231
    while (*in>'\0')
 1000441:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1000444:	84 c0                	test   al,al
 1000446:	7e 19                	jle    1000461 <puts+0x28>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:233
    {
        terminal_putchar(*in++);
 1000448:	83 c3 01             	add    ebx,0x1
 100044b:	83 ec 0c             	sub    esp,0xc
 100044e:	0f be c0             	movsx  eax,al
 1000451:	50                   	push   eax
 1000452:	e8 be fd ff ff       	call   1000215 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:231
    //terminal_clear();
}

void puts(char* in)
{
    while (*in>'\0')
 1000457:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 100045a:	83 c4 10             	add    esp,0x10
 100045d:	84 c0                	test   al,al
 100045f:	7f e7                	jg     1000448 <puts+0xf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:235
    {
        terminal_putchar(*in++);
    }
}
 1000461:	83 c4 08             	add    esp,0x8
 1000464:	5b                   	pop    ebx
 1000465:	c3                   	ret    

01000466 <putc>:
putc():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:238

void putc(char c)
{
 1000466:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:239
    terminal_putchar(c);
 1000469:	0f be 44 24 1c       	movsx  eax,BYTE PTR [esp+0x1c]
 100046e:	50                   	push   eax
 100046f:	e8 a1 fd ff ff       	call   1000215 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:240
 1000474:	83 c4 1c             	add    esp,0x1c
 1000477:	c3                   	ret    

01000478 <keyboardGetKeyFromBuffer>:
keyboardGetKeyFromBuffer():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:20
//Base moves when a key is taken from the buffer
uint8_t keyboardGetKeyFromBuffer()
{
    char lTemp=0;
    //printd(DEBUG_KEYBOARD,"\nkKeyboardBuffer=0x%08X, kKeyboardBufferBase=0x%08X, &kKeyboardBufferBase=0x%08X\n",kKeyboardBuffer, kKeyboardBufferBase,&kKeyboardBufferBase);
    if (kKeyboardBufferBase<=kKeyboardBuffer)
 1000478:	a1 24 04 12 00       	mov    eax,ds:0x120424
 100047d:	8b 15 e0 03 12 00    	mov    edx,DWORD PTR ds:0x1203e0
 1000483:	39 d0                	cmp    eax,edx
 1000485:	77 14                	ja     100049b <keyboardGetKeyFromBuffer+0x23>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:22
    {
        __asm__("cli\n");
 1000487:	fa                   	cli    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:23
        lTemp=*kKeyboardBufferBase++;
 1000488:	8d 48 01             	lea    ecx,[eax+0x1]
 100048b:	89 0d 24 04 12 00    	mov    DWORD PTR ds:0x120424,ecx
 1000491:	0f b6 00             	movzx  eax,BYTE PTR [eax]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:24
        __asm__("sti\n");
 1000494:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:26
    }
    if (kKeyboardBufferBase>kKeyboardBuffer)
 1000495:	39 ca                	cmp    edx,ecx
 1000497:	73 1d                	jae    10004b6 <keyboardGetKeyFromBuffer+0x3e>
 1000499:	eb 05                	jmp    10004a0 <keyboardGetKeyFromBuffer+0x28>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:18
//Get a key from the keyboard buffer
//Curr moves when a key is put into the buffer
//Base moves when a key is taken from the buffer
uint8_t keyboardGetKeyFromBuffer()
{
    char lTemp=0;
 100049b:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:28
        lTemp=*kKeyboardBufferBase++;
        __asm__("sti\n");
    }
    if (kKeyboardBufferBase>kKeyboardBuffer)
    {
        __asm__("cli\n");
 10004a0:	fa                   	cli    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:29
        kKeyboardBufferBase=(char*)KEYBOARD_BUFFER_ADDRESS;
 10004a1:	c7 05 24 04 12 00 b0 	mov    DWORD PTR ds:0x120424,0x1524b0
 10004a8:	24 15 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:30
        kKeyboardBuffer=(char*)KEYBOARD_BUFFER_ADDRESS-1;
 10004ab:	c7 05 e0 03 12 00 af 	mov    DWORD PTR ds:0x1203e0,0x1524af
 10004b2:	24 15 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:31
        __asm__("sti\n");
 10004b5:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:34
    }
    return lTemp;
}
 10004b6:	f3 c3                	repz ret 

010004b8 <waitForKeyboardKey>:
waitForKeyboardKey():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:37

char waitForKeyboardKey()
{
 10004b8:	53                   	push   ebx
 10004b9:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:38
    printd(DEBUG_KEYBOARD,"gKbd-W, %04X\t", kKeyboardBuffer);
 10004bc:	ff 35 e0 03 12 00    	push   DWORD PTR ds:0x1203e0
 10004c2:	68 5c 73 00 01       	push   0x100735c
 10004c7:	6a 10                	push   0x10
 10004c9:	e8 c1 20 00 00       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:40
    char lTemp=0;
    printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
 10004ce:	83 c4 0c             	add    esp,0xc
 10004d1:	ff 35 e0 03 12 00    	push   DWORD PTR ds:0x1203e0
 10004d7:	68 6a 73 00 01       	push   0x100736a
 10004dc:	6a 10                	push   0x10
 10004de:	e8 ac 20 00 00       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:42

    while (kKeyboardBuffer==(char*)KEYBOARD_BUFFER_ADDRESS)
 10004e3:	83 c4 10             	add    esp,0x10
 10004e6:	81 3d e0 03 12 00 b0 	cmp    DWORD PTR ds:0x1203e0,0x1524b0
 10004ed:	24 15 00 
 10004f0:	75 30                	jne    1000522 <waitForKeyboardKey+0x6a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:44
    {
        printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
 10004f2:	83 ec 04             	sub    esp,0x4
 10004f5:	68 b0 24 15 00       	push   0x1524b0
 10004fa:	68 6a 73 00 01       	push   0x100736a
 10004ff:	6a 10                	push   0x10
 1000501:	e8 89 20 00 00       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:45
        __asm__("sti\n");
 1000506:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:46
        waitTicks(1);
 1000507:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 100050e:	e8 fa 29 00 00       	call   1002f0d <waitTicks>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:42
{
    printd(DEBUG_KEYBOARD,"gKbd-W, %04X\t", kKeyboardBuffer);
    char lTemp=0;
    printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);

    while (kKeyboardBuffer==(char*)KEYBOARD_BUFFER_ADDRESS)
 1000513:	83 c4 10             	add    esp,0x10
 1000516:	81 3d e0 03 12 00 b0 	cmp    DWORD PTR ds:0x1203e0,0x1524b0
 100051d:	24 15 00 
 1000520:	74 d0                	je     10004f2 <waitForKeyboardKey+0x3a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:48
    {
        printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
        __asm__("sti\n");
        waitTicks(1);
    }
    lTemp=keyboardGetKeyFromBuffer();
 1000522:	e8 51 ff ff ff       	call   1000478 <keyboardGetKeyFromBuffer>
 1000527:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:49
    printd(DEBUG_KEYBOARD,"got a key %u!\n", lTemp);
 1000529:	83 ec 04             	sub    esp,0x4
 100052c:	0f be c0             	movsx  eax,al
 100052f:	50                   	push   eax
 1000530:	68 80 73 00 01       	push   0x1007380
 1000535:	6a 10                	push   0x10
 1000537:	e8 53 20 00 00       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:51
    return lTemp;
}
 100053c:	89 d8                	mov    eax,ebx
 100053e:	83 c4 18             	add    esp,0x18
 1000541:	5b                   	pop    ebx
 1000542:	c3                   	ret    

01000543 <getKeyboardKey>:
getKeyboardKey():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:55

char getKeyboardKey()
{
        return keyboardGetKeyFromBuffer();
 1000543:	e8 30 ff ff ff       	call   1000478 <keyboardGetKeyFromBuffer>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:56
}
 1000548:	f3 c3                	repz ret 

0100054a <gets>:
gets():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:58
void gets(char* buffer, int len)
{
 100054a:	57                   	push   edi
 100054b:	56                   	push   esi
 100054c:	53                   	push   ebx
 100054d:	83 ec 14             	sub    esp,0x14
 1000550:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
 1000554:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:59
    volatile char inchar=0;
 1000558:	c6 44 24 13 00       	mov    BYTE PTR [esp+0x13],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:61
    int cnt=0;
    memset(buffer,0,len);
 100055d:	56                   	push   esi
 100055e:	6a 00                	push   0x0
 1000560:	57                   	push   edi
 1000561:	e8 7d 13 00 00       	call   10018e3 <memset>
 1000566:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:60
        return keyboardGetKeyFromBuffer();
}
void gets(char* buffer, int len)
{
    volatile char inchar=0;
    int cnt=0;
 1000569:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:78
            if (inchar==0x0a)
            {
                printk("%c",inchar);
                return;
            }
            if (cnt<len-2)
 100056e:	83 ee 02             	sub    esi,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:64
    volatile char inchar=0;
    int cnt=0;
    memset(buffer,0,len);
    while (1==1)
    {
        inchar=getKeyboardKey();
 1000571:	e8 cd ff ff ff       	call   1000543 <getKeyboardKey>
 1000576:	88 44 24 0f          	mov    BYTE PTR [esp+0xf],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:65
        if (inchar=='\b' && cnt>0)
 100057a:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 100057f:	85 db                	test   ebx,ebx
 1000581:	7e 1d                	jle    10005a0 <gets+0x56>
 1000583:	3c 08                	cmp    al,0x8
 1000585:	75 19                	jne    10005a0 <gets+0x56>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:67
        {
            buffer[cnt]=0;
 1000587:	c6 04 1f 00          	mov    BYTE PTR [edi+ebx*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:68
            cnt--;
 100058b:	83 eb 01             	sub    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:69
            puts("\b");
 100058e:	83 ec 0c             	sub    esp,0xc
 1000591:	68 8f 73 00 01       	push   0x100738f
 1000596:	e8 9e fe ff ff       	call   1000439 <puts>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:66
    memset(buffer,0,len);
    while (1==1)
    {
        inchar=getKeyboardKey();
        if (inchar=='\b' && cnt>0)
        {
 100059b:	83 c4 10             	add    esp,0x10
 100059e:	eb d1                	jmp    1000571 <gets+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:71
            buffer[cnt]=0;
            cnt--;
            puts("\b");
        }
        else if (inchar>0)
 10005a0:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 10005a5:	84 c0                	test   al,al
 10005a7:	7e c8                	jle    1000571 <gets+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:73
        {
            if (inchar==0x0a)
 10005a9:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 10005ae:	3c 0a                	cmp    al,0xa
 10005b0:	75 1b                	jne    10005cd <gets+0x83>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:75
            {
                printk("%c",inchar);
 10005b2:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 10005b7:	83 ec 08             	sub    esp,0x8
 10005ba:	0f be c0             	movsx  eax,al
 10005bd:	50                   	push   eax
 10005be:	68 91 73 00 01       	push   0x1007391
 10005c3:	e8 af 1f 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:76
                return;
 10005c8:	83 c4 10             	add    esp,0x10
 10005cb:	eb 2d                	jmp    10005fa <gets+0xb0>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:78
            }
            if (cnt<len-2)
 10005cd:	39 f3                	cmp    ebx,esi
 10005cf:	7d a0                	jge    1000571 <gets+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:80
            {
                printk("%c",inchar);
 10005d1:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 10005d6:	83 ec 08             	sub    esp,0x8
 10005d9:	0f be c0             	movsx  eax,al
 10005dc:	50                   	push   eax
 10005dd:	68 91 73 00 01       	push   0x1007391
 10005e2:	e8 90 1f 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:81
                buffer[cnt++]=inchar;
 10005e7:	0f b6 44 24 1f       	movzx  eax,BYTE PTR [esp+0x1f]
 10005ec:	88 04 1f             	mov    BYTE PTR [edi+ebx*1],al
 10005ef:	83 c4 10             	add    esp,0x10
 10005f2:	8d 5b 01             	lea    ebx,[ebx+0x1]
 10005f5:	e9 77 ff ff ff       	jmp    1000571 <gets+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:85
            }
        }
    }
}
 10005fa:	83 c4 10             	add    esp,0x10
 10005fd:	5b                   	pop    ebx
 10005fe:	5e                   	pop    esi
 10005ff:	5f                   	pop    edi
 1000600:	c3                   	ret    

01000601 <getc>:
getc():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:89

char getc()
{
   int inchar=getKeyboardKey();
 1000601:	e8 3d ff ff ff       	call   1000543 <getKeyboardKey>
 1000606:	0f be c0             	movsx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:91
   
   while (inchar==0)
 1000609:	85 c0                	test   eax,eax
 100060b:	75 11                	jne    100061e <getc+0x1d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:93
   {
       inchar=getKeyboardKey();
 100060d:	e8 31 ff ff ff       	call   1000543 <getKeyboardKey>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:94
        inchar=getKeyboardKey();
 1000612:	e8 2c ff ff ff       	call   1000543 <getKeyboardKey>
 1000617:	0f be c0             	movsx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:91

char getc()
{
   int inchar=getKeyboardKey();
   
   while (inchar==0)
 100061a:	85 c0                	test   eax,eax
 100061c:	74 ef                	je     100060d <getc+0xc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:97
   {
       inchar=getKeyboardKey();
        inchar=getKeyboardKey();
   }
   return inchar;
}
 100061e:	f3 c3                	repz ret 

01000620 <bitsSet>:
bitsSet():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:5
#include <stdint.h>
#include <stdbool.h>

bool bitsSet(volatile uint32_t* array, uint32_t bit)
{
 1000620:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:7
    int lRetVal=0;
    __asm__ volatile ("bts [%[array]],%[bit]\nmov eax,0\nsetc al\n" : [array] "+m" (*array), "=a" (lRetVal) : [bit] "r" (bit));
 1000624:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1000628:	0f ab 02             	bts    DWORD PTR [edx],eax
 100062b:	b8 00 00 00 00       	mov    eax,0x0
 1000630:	0f 92 c0             	setb   al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:8
    return lRetVal;
 1000633:	85 c0                	test   eax,eax
 1000635:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:9
}
 1000638:	c3                   	ret    

01000639 <bitsReset>:
bitsReset():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:11
bool bitsReset(volatile uint32_t* array, uint32_t bit)
{
 1000639:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:13
    int lRetVal=0;
    __asm__ volatile ("btr [%[array]],%[bit]\nmov eax,0\nsetc al\n" : [array] "+m" (*array), "=a" (lRetVal) : [bit] "r" (bit));
 100063d:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1000641:	0f b3 02             	btr    DWORD PTR [edx],eax
 1000644:	b8 00 00 00 00       	mov    eax,0x0
 1000649:	0f 92 c0             	setb   al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:14
    return lRetVal;
 100064c:	85 c0                	test   eax,eax
 100064e:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:15
}
 1000651:	c3                   	ret    

01000652 <bitsTest>:
bitsTest():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:17
bool bitsTest(volatile uint32_t* array, uint32_t bit)
{
 1000652:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:19
    int lRetVal=0;
    __asm__ volatile ("bt [%[array]],%[bit]\nmov eax,0\nsetc al\n" :[array] "+m" (*array), "=a" (lRetVal) : [bit] "r" (bit));
 1000656:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100065a:	0f a3 02             	bt     DWORD PTR [edx],eax
 100065d:	b8 00 00 00 00       	mov    eax,0x0
 1000662:	0f 92 c0             	setb   al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:20
    return lRetVal;
 1000665:	85 c0                	test   eax,eax
 1000667:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:21
}
 100066a:	c3                   	ret    

0100066b <bitsScanF>:
bitsScanF():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:24

int bitsScanF(volatile uint32_t* array)
{
 100066b:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:27
    int lRetVal=0;
    bool lErr=false;
    __asm__ volatile ("bsf %[ret],[%[array]]\nsetz cl\n" : [ret] "=b" (lRetVal), [lErr] "=c" (lErr) : [array] "m" (*array));
 100066c:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1000670:	0f bc 18             	bsf    ebx,DWORD PTR [eax]
 1000673:	0f 94 c1             	sete   cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:28
    if (lErr==false)
 1000676:	84 c9                	test   cl,cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:29
        return lRetVal;
 1000678:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100067d:	0f 44 c3             	cmove  eax,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:32
    else
        return -1;
 1000680:	5b                   	pop    ebx
 1000681:	c3                   	ret    
 1000682:	66 90                	xchg   ax,ax

01000684 <ataWaitForDRQ>:
ataWaitForDRQ():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:22
float ticks=0;
struct ataDeviceInfo_t* atablockingReadDev;

//Returns non-zero value IF TIMEOUT
uint8_t __attribute__((noinline)) ataWaitForDRQ(struct ataDeviceInfo_t* devInfo, bool toBeSet, int forHowManyMS)
{
 1000684:	57                   	push   edi
 1000685:	56                   	push   esi
 1000686:	53                   	push   ebx
 1000687:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
 100068b:	0f b6 5c 24 14       	movzx  ebx,BYTE PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:23
    int ticks = forHowManyMS*kTicksPerMS;
 1000690:	8b 4c 24 18          	mov    ecx,DWORD PTR [esp+0x18]
 1000694:	0f af 0d 84 02 12 00 	imul   ecx,DWORD PTR ds:0x120284
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:25
    uint8_t inValue=0;
    while (ticks > 0)
 100069b:	85 c9                	test   ecx,ecx
 100069d:	7e 26                	jle    10006c5 <ataWaitForDRQ+0x41>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:30
    {
        STI
        //waitTicks(1);
        __asm__("sti\nhlt\n");
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
 100069f:	0f b7 87 69 02 00 00 	movzx  eax,WORD PTR [edi+0x269]
 10006a6:	8d 50 07             	lea    edx,[eax+0x7]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:27
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
    while (ticks > 0)
    {
        STI
 10006a9:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:29
        //waitTicks(1);
        __asm__("sti\nhlt\n");
 10006aa:	fb                   	sti    
 10006ab:	f4                   	hlt    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10006ac:	ec                   	in     al,dx
 10006ad:	89 c6                	mov    esi,eax
ataWaitForDRQ():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:31
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (toBeSet && (inValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ)
 10006af:	84 db                	test   bl,bl
 10006b1:	74 06                	je     10006b9 <ataWaitForDRQ+0x35>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:31 (discriminator 1)
 10006b3:	a8 08                	test   al,0x8
 10006b5:	74 07                	je     10006be <ataWaitForDRQ+0x3a>
 10006b7:	eb 31                	jmp    10006ea <ataWaitForDRQ+0x66>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:33 (discriminator 1)
                return 0;
        else if ((!toBeSet && (inValue & ATA_STATUS_DRQ) != ATA_STATUS_DRQ))
 10006b9:	83 e0 08             	and    eax,0x8
 10006bc:	74 31                	je     10006ef <ataWaitForDRQ+0x6b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:25
//Returns non-zero value IF TIMEOUT
uint8_t __attribute__((noinline)) ataWaitForDRQ(struct ataDeviceInfo_t* devInfo, bool toBeSet, int forHowManyMS)
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
    while (ticks > 0)
 10006be:	83 e9 01             	sub    ecx,0x1
 10006c1:	75 e6                	jne    10006a9 <ataWaitForDRQ+0x25>
 10006c3:	eb 05                	jmp    10006ca <ataWaitForDRQ+0x46>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:24

//Returns non-zero value IF TIMEOUT
uint8_t __attribute__((noinline)) ataWaitForDRQ(struct ataDeviceInfo_t* devInfo, bool toBeSet, int forHowManyMS)
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
 10006c5:	be 00 00 00 00       	mov    esi,0x0
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10006ca:	8b 87 69 02 00 00    	mov    eax,DWORD PTR [edi+0x269]
 10006d0:	8d 50 01             	lea    edx,[eax+0x1]
 10006d3:	ec                   	in     al,dx
ataWaitForDRQ():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:37
                return 0;
        else if ((!toBeSet && (inValue & ATA_STATUS_DRQ) != ATA_STATUS_DRQ))
                return 0;
        ticks--;
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
 10006d4:	0f b6 d0             	movzx  edx,al
 10006d7:	89 15 68 3a 01 01    	mov    DWORD PTR ds:0x1013a68,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:38
    if ((hdError & 0x4)==0x4)
 10006dd:	83 e0 04             	and    eax,0x4
 10006e0:	b8 00 00 00 00       	mov    eax,0x0
 10006e5:	0f 44 c6             	cmove  eax,esi
 10006e8:	eb 05                	jmp    10006ef <ataWaitForDRQ+0x6b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:32
        STI
        //waitTicks(1);
        __asm__("sti\nhlt\n");
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (toBeSet && (inValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ)
                return 0;
 10006ea:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:41
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
    if ((hdError & 0x4)==0x4)
        return 0;
    return inValue;
}
 10006ef:	5b                   	pop    ebx
 10006f0:	5e                   	pop    esi
 10006f1:	5f                   	pop    edi
 10006f2:	c3                   	ret    

010006f3 <ataWaitForIdle>:
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:44

uint8_t ataWaitForIdle(struct ataDeviceInfo_t* devInfo)
{
 10006f3:	53                   	push   ebx
 10006f4:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:48
    ticks = 0;
    uint8_t lValue=0;
    //printk("aaWaitForIdle: ticks(%u@0x%08X)=ATA_STANDARD_WAIT_MS(%d)*kTicksPerMS((%d@0x%08X))\n", ticks, &ticks, (ATA_STANDARD_WAIT_MS), kTicksPerMS, &kTicksPerMS);
    lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
 10006f7:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 10006fb:	8b 98 69 02 00 00    	mov    ebx,DWORD PTR [eax+0x269]
 1000701:	8d 53 07             	lea    edx,[ebx+0x7]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000704:	ec                   	in     al,dx
 1000705:	89 c1                	mov    ecx,eax
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:51
    if ((lValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ && ticks)
        inw(devInfo->ioPort+ATA_PORT_DATA);
    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 1000707:	c7 05 5c 3a 01 01 00 	mov    DWORD PTR ds:0x1013a5c,0x3f800000
 100070e:	00 80 3f 
 1000711:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1000716:	8d 04 80             	lea    eax,[eax+eax*4]
 1000719:	01 c0                	add    eax,eax
 100071b:	89 04 24             	mov    DWORD PTR [esp],eax
 100071e:	db 04 24             	fild   DWORD PTR [esp]
 1000721:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
 1000725:	d9 44 24 04          	fld    DWORD PTR [esp+0x4]
 1000729:	d9 ee                	fldz   
 100072b:	d9 c9                	fxch   st(1)
 100072d:	db e9                	fucomi st,st(1)
 100072f:	dd d9                	fstp   st(1)
 1000731:	72 5a                	jb     100078d <ataWaitForIdle+0x9a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:53
    {
        __asm__("sti\nhlt\n");
 1000733:	fb                   	sti    
 1000734:	f4                   	hlt    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000735:	ec                   	in     al,dx
 1000736:	89 c1                	mov    ecx,eax
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:56
        lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
 1000738:	25 88 00 00 00       	and    eax,0x88
 100073d:	74 60                	je     100079f <ataWaitForIdle+0xac>
 100073f:	d9 e8                	fld1   
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:58
                    return 0;
        ticks++;
 1000741:	d9 e8                	fld1   
 1000743:	eb 1c                	jmp    1000761 <ataWaitForIdle+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:53
    lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
    if ((lValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ && ticks)
        inw(devInfo->ioPort+ATA_PORT_DATA);
    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
    {
        __asm__("sti\nhlt\n");
 1000745:	fb                   	sti    
 1000746:	f4                   	hlt    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000747:	ec                   	in     al,dx
 1000748:	89 c1                	mov    ecx,eax
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:56
        lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
 100074a:	25 88 00 00 00       	and    eax,0x88
 100074f:	75 0c                	jne    100075d <ataWaitForIdle+0x6a>
 1000751:	dd d8                	fstp   st(0)
 1000753:	dd d8                	fstp   st(0)
 1000755:	d9 1d 5c 3a 01 01    	fstp   DWORD PTR ds:0x1013a5c
 100075b:	eb 44                	jmp    10007a1 <ataWaitForIdle+0xae>
 100075d:	d9 ca                	fxch   st(2)
 100075f:	d9 c9                	fxch   st(1)
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:58
                    return 0;
        ticks++;
 1000761:	dc c1                	fadd   st(1),st
 1000763:	d9 c9                	fxch   st(1)
 1000765:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
 1000769:	d9 44 24 04          	fld    DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:51
    uint8_t lValue=0;
    //printk("aaWaitForIdle: ticks(%u@0x%08X)=ATA_STANDARD_WAIT_MS(%d)*kTicksPerMS((%d@0x%08X))\n", ticks, &ticks, (ATA_STANDARD_WAIT_MS), kTicksPerMS, &kTicksPerMS);
    lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
    if ((lValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ && ticks)
        inw(devInfo->ioPort+ATA_PORT_DATA);
    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 100076d:	d9 c1                	fld    st(1)
 100076f:	d8 c1                	fadd   st,st(1)
 1000771:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
 1000775:	d9 44 24 04          	fld    DWORD PTR [esp+0x4]
 1000779:	d9 cb                	fxch   st(3)
 100077b:	db e9                	fucomi st,st(1)
 100077d:	dd d9                	fstp   st(1)
 100077f:	73 c4                	jae    1000745 <ataWaitForIdle+0x52>
 1000781:	dd d8                	fstp   st(0)
 1000783:	dd d8                	fstp   st(0)
 1000785:	d9 1d 5c 3a 01 01    	fstp   DWORD PTR ds:0x1013a5c
 100078b:	eb 02                	jmp    100078f <ataWaitForIdle+0x9c>
 100078d:	dd d8                	fstp   st(0)
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 100078f:	8d 53 01             	lea    edx,[ebx+0x1]
 1000792:	ec                   	in     al,dx
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:60
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
                    return 0;
        ticks++;
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
 1000793:	0f b6 c0             	movzx  eax,al
 1000796:	a3 68 3a 01 01       	mov    ds:0x1013a68,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:61
    return lValue;
 100079b:	89 c8                	mov    eax,ecx
 100079d:	eb 02                	jmp    10007a1 <ataWaitForIdle+0xae>
 100079f:	dd d8                	fstp   st(0)
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:62
}
 10007a1:	83 c4 08             	add    esp,0x8
 10007a4:	5b                   	pop    ebx
 10007a5:	c3                   	ret    

010007a6 <ataControllerIsReady>:
ataControllerIsReady():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:66


uint8_t ataControllerIsReady(struct ataDeviceInfo_t* devInfo)
{
 10007a6:	55                   	push   ebp
 10007a7:	57                   	push   edi
 10007a8:	56                   	push   esi
 10007a9:	53                   	push   ebx
 10007aa:	83 ec 0c             	sub    esp,0xc
 10007ad:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:69
    int ticks = 0;
    
    int lStatus=0;
 10007b1:	bd 00 00 00 00       	mov    ebp,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:67
}


uint8_t ataControllerIsReady(struct ataDeviceInfo_t* devInfo)
{
    int ticks = 0;
 10007b6:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:72
    
    int lStatus=0;
    uint8_t err=0;

    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 10007bb:	eb 2a                	jmp    10007e7 <ataControllerIsReady+0x41>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10007bd:	0f b7 87 69 02 00 00 	movzx  eax,WORD PTR [edi+0x269]
 10007c4:	8d 50 07             	lea    edx,[eax+0x7]
 10007c7:	ec                   	in     al,dx
 10007c8:	89 c3                	mov    ebx,eax
ataControllerIsReady():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:75
    {
        lStatus=inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
 10007ca:	83 ec 0c             	sub    esp,0xc
 10007cd:	6a 01                	push   0x1
 10007cf:	e8 4c 27 00 00       	call   1002f20 <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:76
        ticks++;
 10007d4:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:77
	lStatus &= (ATA_STATUS_BUSY | ATA_STATUS_READY| ATA_STATUS_SEEK);
 10007d7:	89 dd                	mov    ebp,ebx
 10007d9:	81 e5 d0 00 00 00    	and    ebp,0xd0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:78
        if (lStatus & ATA_STATUS_READY )
 10007df:	83 c4 10             	add    esp,0x10
 10007e2:	f6 c3 40             	test   bl,0x40
 10007e5:	75 71                	jne    1000858 <ataControllerIsReady+0xb2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:72
    int ticks = 0;
    
    int lStatus=0;
    uint8_t err=0;

    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 10007e7:	a1 84 02 12 00       	mov    eax,ds:0x120284
 10007ec:	8d 04 80             	lea    eax,[eax+eax*4]
 10007ef:	01 c0                	add    eax,eax
 10007f1:	39 c6                	cmp    esi,eax
 10007f3:	7e c8                	jle    10007bd <ataControllerIsReady+0x17>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:82
	lStatus &= (ATA_STATUS_BUSY | ATA_STATUS_READY| ATA_STATUS_SEEK);
        if (lStatus & ATA_STATUS_READY )
                return true;
    }

    if (lStatus==ATA_STATUS_ERROR || lStatus==ATA_STATUS_BUSY)
 10007f5:	81 fd 80 00 00 00    	cmp    ebp,0x80
 10007fb:	75 41                	jne    100083e <ataControllerIsReady+0x98>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10007fd:	ba f1 01 00 00       	mov    edx,0x1f1
 1000802:	ec                   	in     al,dx
 1000803:	89 c3                	mov    ebx,eax
ataControllerIsReady():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:86
    {
         err=inb(0x1f1);
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000805:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 100080c:	74 4a                	je     1000858 <ataControllerIsReady+0xb2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:87
            printd(DEBUG_HARDDRIVE,"ataControllerIsReady: DRQ wait failed, lStatus=%02X, err=%02X\n",lStatus,err);
 100080e:	0f b6 c0             	movzx  eax,al
 1000811:	50                   	push   eax
 1000812:	68 80 00 00 00       	push   0x80
 1000817:	68 e4 77 00 01       	push   0x10077e4
 100081c:	6a 08                	push   0x8
 100081e:	e8 6c 1d 00 00       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:90
#endif
    }
    if ( (lStatus & ATA_STATUS_READY)==0 && err==4)
 1000823:	83 c4 10             	add    esp,0x10
 1000826:	f7 c5 40 00 00 00    	test   ebp,0x40
 100082c:	75 10                	jne    100083e <ataControllerIsReady+0x98>
 100082e:	80 fb 04             	cmp    bl,0x4
 1000831:	0f 94 c0             	sete   al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:91
        lStatus=ATA_STATUS_READY;
 1000834:	84 c0                	test   al,al
 1000836:	b8 40 00 00 00       	mov    eax,0x40
 100083b:	0f 45 e8             	cmovne ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:93
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 100083e:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000845:	74 11                	je     1000858 <ataControllerIsReady+0xb2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:94
            printk("ataControllerIsReady: returning %02X\n",lStatus);
 1000847:	83 ec 08             	sub    esp,0x8
 100084a:	55                   	push   ebp
 100084b:	68 24 78 00 01       	push   0x1007824
 1000850:	e8 22 1d 00 00       	call   1002577 <printk>
 1000855:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:97
#endif
    return true;
}
 1000858:	b8 01 00 00 00       	mov    eax,0x1
 100085d:	83 c4 0c             	add    esp,0xc
 1000860:	5b                   	pop    ebx
 1000861:	5e                   	pop    esi
 1000862:	5f                   	pop    edi
 1000863:	5d                   	pop    ebp
 1000864:	c3                   	ret    

01000865 <ataSelectDrive>:
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:115
		return true;
	return 1;
}

bool ataSelectDrive(struct ataDeviceInfo_t* devInfo, uint8_t head)
{
 1000865:	57                   	push   edi
 1000866:	56                   	push   esi
 1000867:	53                   	push   ebx
 1000868:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 100086c:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:116
    ataWaitForIdle(devInfo);
 1000870:	56                   	push   esi
 1000871:	e8 7d fe ff ff       	call   10006f3 <ataWaitForIdle>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:117
    outb(devInfo->ioPort+ATA_DRIVE_SELECT, devInfo->driveHeadPortDesignation | (head& 0xF) ); 
 1000876:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 100087c:	89 d8                	mov    eax,ebx
 100087e:	83 e0 0f             	and    eax,0xf
 1000881:	0a 86 6e 02 00 00    	or     al,BYTE PTR [esi+0x26e]
 1000887:	8d 51 06             	lea    edx,[ecx+0x6]
 100088a:	ee                   	out    dx,al
ataStatusIsOk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:101
    return true;
}

static bool ataStatusIsOk(struct ataDeviceInfo_t* devInfo)
{
	unsigned char status = inb(devInfo->ioPort+ATA_PORT_STATUS);
 100088b:	8d 51 07             	lea    edx,[ecx+0x7]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100088e:	ec                   	in     al,dx
ataStatusIsOk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:103

	if (status & ATA_STATUS_BUSY)
 100088f:	83 c4 04             	add    esp,0x4
 1000892:	84 c0                	test   al,al
 1000894:	0f 88 92 00 00 00    	js     100092c <ataSelectDrive+0xc7>
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:136
        unsigned lDrive=inb(devInfo->ioPort+ATA_DRIVE_SELECT);
            printk("ataSelectDrive: Drive selected: %s (%u, 0x%02X), err=0x%02X\n", (lDrive & (1<<4)) == 1<<4?"Slave":"Master", devInfo->driveNo, lDrive, inb(devInfo->ioPort+ATA_PORT_ERROR));
    }
#endif
        
    return 0;
 100089a:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:128
            printk("ataSelectDrive: Failed to select drive %u, bus %u, status=0x%02X is not ok\n", devInfo->driveNo, devInfo->bus, inb(devInfo->ioPort+ATA_PORT_STATUS));
#endif
            return inb(devInfo->ioPort+ATA_PORT_STATUS);
    }
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 100089f:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 10008a6:	0f 84 8e 00 00 00    	je     100093a <ataSelectDrive+0xd5>
 10008ac:	eb 2f                	jmp    10008dd <ataSelectDrive+0x78>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10008ae:	ec                   	in     al,dx
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:123
    //printk("Sending 0x%02X", drive==master?ATA_DRIVE_MASTER:ATA_DRIVE_SLAVE | (head& 0xF));
    if (!ataStatusIsOk(devInfo))
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("ataSelectDrive: Failed to select drive %u, bus %u, status=0x%02X is not ok\n", devInfo->driveNo, devInfo->bus, inb(devInfo->ioPort+ATA_PORT_STATUS));
 10008af:	0f b6 c0             	movzx  eax,al
 10008b2:	50                   	push   eax
 10008b3:	ff b6 61 02 00 00    	push   DWORD PTR [esi+0x261]
 10008b9:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 10008bf:	68 4c 78 00 01       	push   0x100784c
 10008c4:	e8 ae 1c 00 00       	call   1002577 <printk>
 10008c9:	83 c4 10             	add    esp,0x10
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10008cc:	8b 86 69 02 00 00    	mov    eax,DWORD PTR [esi+0x269]
 10008d2:	8d 50 07             	lea    edx,[eax+0x7]
 10008d5:	ec                   	in     al,dx
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:125
#endif
            return inb(devInfo->ioPort+ATA_PORT_STATUS);
 10008d6:	84 c0                	test   al,al
 10008d8:	0f 95 c0             	setne  al
 10008db:	eb 5d                	jmp    100093a <ataSelectDrive+0xd5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:130
    }
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
    {
        wait(10);
 10008dd:	83 ec 0c             	sub    esp,0xc
 10008e0:	6a 0a                	push   0xa
 10008e2:	e8 39 26 00 00       	call   1002f20 <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:131
        unsigned lDrive=inb(devInfo->ioPort+ATA_DRIVE_SELECT);
 10008e7:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10008ed:	8d 51 06             	lea    edx,[ecx+0x6]
 10008f0:	ec                   	in     al,dx
 10008f1:	89 c3                	mov    ebx,eax
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:131
 10008f3:	0f b6 f8             	movzx  edi,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10008f6:	8d 51 01             	lea    edx,[ecx+0x1]
 10008f9:	ec                   	in     al,dx
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:132
            printk("ataSelectDrive: Drive selected: %s (%u, 0x%02X), err=0x%02X\n", (lDrive & (1<<4)) == 1<<4?"Slave":"Master", devInfo->driveNo, lDrive, inb(devInfo->ioPort+ATA_PORT_ERROR));
 10008fa:	0f b6 c8             	movzx  ecx,al
 10008fd:	83 e3 10             	and    ebx,0x10
 1000900:	ba 9a 73 00 01       	mov    edx,0x100739a
 1000905:	b8 94 73 00 01       	mov    eax,0x1007394
 100090a:	0f 44 c2             	cmove  eax,edx
 100090d:	89 0c 24             	mov    DWORD PTR [esp],ecx
 1000910:	57                   	push   edi
 1000911:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000917:	50                   	push   eax
 1000918:	68 98 78 00 01       	push   0x1007898
 100091d:	e8 55 1c 00 00       	call   1002577 <printk>
 1000922:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:136
    }
#endif
        
    return 0;
 1000925:	b8 00 00 00 00       	mov    eax,0x0
 100092a:	eb 0e                	jmp    100093a <ataSelectDrive+0xd5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:122
    outb(devInfo->ioPort+ATA_DRIVE_SELECT, devInfo->driveHeadPortDesignation | (head& 0xF) ); 
    //printk("Sending 0x%02X", drive==master?ATA_DRIVE_MASTER:ATA_DRIVE_SLAVE | (head& 0xF));
    if (!ataStatusIsOk(devInfo))
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 100092c:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000933:	74 97                	je     10008cc <ataSelectDrive+0x67>
 1000935:	e9 74 ff ff ff       	jmp    10008ae <ataSelectDrive+0x49>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:137
            printk("ataSelectDrive: Drive selected: %s (%u, 0x%02X), err=0x%02X\n", (lDrive & (1<<4)) == 1<<4?"Slave":"Master", devInfo->driveNo, lDrive, inb(devInfo->ioPort+ATA_PORT_ERROR));
    }
#endif
        
    return 0;
}
 100093a:	5b                   	pop    ebx
 100093b:	5e                   	pop    esi
 100093c:	5f                   	pop    edi
 100093d:	c3                   	ret    

0100093e <ataInit>:
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:180
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("ataResetController: controller is ready\n");
#endif
}
int ataInit(struct ataDeviceInfo_t* devInfo)
{
 100093e:	57                   	push   edi
 100093f:	56                   	push   esi
 1000940:	53                   	push   ebx
 1000941:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1000945:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 100094c:	8d 50 07             	lea    edx,[eax+0x7]
 100094f:	b8 04 00 00 00       	mov    eax,0x4
 1000954:	ee                   	out    dx,al
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:163
}
*/
static void ataResetController(struct ataDeviceInfo_t* devInfo)
{
        outb(devInfo->ioPort+ATA_PORT_COMMAND, 4);
        waitTicks(kTicksPerSecond/10);
 1000955:	83 ec 0c             	sub    esp,0xc
 1000958:	8b 0d 80 02 12 00    	mov    ecx,DWORD PTR ds:0x120280
 100095e:	ba 67 66 66 66       	mov    edx,0x66666667
 1000963:	89 c8                	mov    eax,ecx
 1000965:	f7 ea                	imul   edx
 1000967:	c1 fa 02             	sar    edx,0x2
 100096a:	c1 f9 1f             	sar    ecx,0x1f
 100096d:	29 ca                	sub    edx,ecx
 100096f:	52                   	push   edx
 1000970:	e8 98 25 00 00       	call   1002f0d <waitTicks>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
 1000975:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 100097c:	8d 90 f6 03 00 00    	lea    edx,[eax+0x3f6]
 1000982:	b8 04 00 00 00       	mov    eax,0x4
 1000987:	ee                   	out    dx,al
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:165
        outb(devInfo->ioPort+ATA_PORT_CONTROL, 1<<2);
        wait(10);
 1000988:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
 100098f:	e8 8c 25 00 00       	call   1002f20 <wait>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
 1000994:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 100099b:	8d 90 f6 03 00 00    	lea    edx,[eax+0x3f6]
 10009a1:	b8 00 00 00 00       	mov    eax,0x0
 10009a6:	ee                   	out    dx,al
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:167
        outb(devInfo->ioPort+ATA_PORT_CONTROL, 0);
        if (!ataControllerIsReady(devInfo))
 10009a7:	89 34 24             	mov    DWORD PTR [esp],esi
 10009aa:	e8 f7 fd ff ff       	call   10007a6 <ataControllerIsReady>
 10009af:	83 c4 10             	add    esp,0x10
 10009b2:	84 c0                	test   al,al
 10009b4:	75 19                	jne    10009cf <ataInit+0x91>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:169
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10009b6:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 10009bd:	74 10                	je     10009cf <ataInit+0x91>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:170
            printk("HD-controller still busy\n");
 10009bf:	83 ec 0c             	sub    esp,0xc
 10009c2:	68 b3 73 00 01       	push   0x10073b3
 10009c7:	e8 ab 1b 00 00       	call   1002577 <printk>
 10009cc:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
#endif
        if ((hdError = inb(devInfo->ioPort+ATA_PORT_ERROR)) != 0 && (hdError = inb(devInfo->ioPort+ATA_PORT_ERROR)) != 4)
 10009cf:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 10009d6:	8d 50 01             	lea    edx,[eax+0x1]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10009d9:	ec                   	in     al,dx
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
 10009da:	84 c0                	test   al,al
 10009dc:	75 0c                	jne    10009ea <ataInit+0xac>
 10009de:	c7 05 68 3a 01 01 00 	mov    DWORD PTR ds:0x1013a68,0x0
 10009e5:	00 00 00 
 10009e8:	eb 34                	jmp    1000a1e <ataInit+0xe0>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10009ea:	ec                   	in     al,dx
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
 10009eb:	0f b6 c0             	movzx  eax,al
 10009ee:	a3 68 3a 01 01       	mov    ds:0x1013a68,eax
 10009f3:	83 f8 04             	cmp    eax,0x4
 10009f6:	74 26                	je     1000a1e <ataInit+0xe0>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:173
            printk("Controller reset failed on %s bus: %02x\n",devInfo->bus==0?"Primary":"Secondary", hdError);
 10009f8:	83 be 61 02 00 00 00 	cmp    DWORD PTR [esi+0x261],0x0
 10009ff:	b9 a9 73 00 01       	mov    ecx,0x10073a9
 1000a04:	ba a1 73 00 01       	mov    edx,0x10073a1
 1000a09:	0f 45 d1             	cmovne edx,ecx
 1000a0c:	83 ec 04             	sub    esp,0x4
 1000a0f:	50                   	push   eax
 1000a10:	52                   	push   edx
 1000a11:	68 d8 78 00 01       	push   0x10078d8
 1000a16:	e8 5c 1b 00 00       	call   1002577 <printk>
 1000a1b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:175
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000a1e:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000a25:	74 10                	je     1000a37 <ataInit+0xf9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:176
            printk("ataResetController: controller is ready\n");
 1000a27:	83 ec 0c             	sub    esp,0xc
 1000a2a:	68 04 79 00 01       	push   0x1007904
 1000a2f:	e8 43 1b 00 00       	call   1002577 <printk>
 1000a34:	83 c4 10             	add    esp,0x10
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:183
}
int ataInit(struct ataDeviceInfo_t* devInfo)
{
    ataResetController(devInfo);
    int cStatus=0, ticks=0;
    ataSelectDrive(devInfo,0);
 1000a37:	83 ec 08             	sub    esp,0x8
 1000a3a:	6a 00                	push   0x0
 1000a3c:	56                   	push   esi
 1000a3d:	e8 23 fe ff ff       	call   1000865 <ataSelectDrive>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:184
    outb(devInfo->ioPort+ATA_PORT_SECTORCOUNT, 0x55);
 1000a42:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1000a48:	8d 51 02             	lea    edx,[ecx+0x2]
 1000a4b:	b8 55 00 00 00       	mov    eax,0x55
 1000a50:	ee                   	out    dx,al
 1000a51:	8d 51 03             	lea    edx,[ecx+0x3]
 1000a54:	b8 aa ff ff ff       	mov    eax,0xffffffaa
 1000a59:	ee                   	out    dx,al
 1000a5a:	8d 51 04             	lea    edx,[ecx+0x4]
 1000a5d:	b8 55 00 00 00       	mov    eax,0x55
 1000a62:	ee                   	out    dx,al
 1000a63:	8d 51 05             	lea    edx,[ecx+0x5]
 1000a66:	b8 aa ff ff ff       	mov    eax,0xffffffaa
 1000a6b:	ee                   	out    dx,al
 1000a6c:	8d 51 07             	lea    edx,[ecx+0x7]
 1000a6f:	b8 ec ff ff ff       	mov    eax,0xffffffec
 1000a74:	ee                   	out    dx,al
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:189
    outb(devInfo->ioPort+ATA_PORT_SECTOR_NUMBER, 0xAA);
    outb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW,0x55);
    outb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH,0xAA);
    outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
    wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
 1000a75:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1000a7a:	8d 04 80             	lea    eax,[eax+eax*4]
 1000a7d:	01 c0                	add    eax,eax
 1000a7f:	89 04 24             	mov    DWORD PTR [esp],eax
 1000a82:	e8 99 24 00 00       	call   1002f20 <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:190
    cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
 1000a87:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1000a8d:	8d 51 07             	lea    edx,[ecx+0x7]
 1000a90:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:190
 1000a91:	0f b6 d8             	movzx  ebx,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:191
    if (cStatus==0)
 1000a94:	83 c4 10             	add    esp,0x10
 1000a97:	85 db                	test   ebx,ebx
 1000a99:	75 34                	jne    1000acf <ataInit+0x191>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
        return false;
 1000a9b:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:194
    wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
    cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
    if (cStatus==0)
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000aa0:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000aa7:	0f 84 4d 01 00 00    	je     1000bfa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:195
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
 1000aad:	83 ec 04             	sub    esp,0x4
 1000ab0:	6a 00                	push   0x0
 1000ab2:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000ab8:	68 cd 73 00 01       	push   0x10073cd
 1000abd:	e8 b5 1a 00 00       	call   1002577 <printk>
 1000ac2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
#endif
        return false;
 1000ac5:	b8 00 00 00 00       	mov    eax,0x0
 1000aca:	e9 2b 01 00 00       	jmp    1000bfa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:199
    }
    if ((cStatus & 1) == 1)
 1000acf:	a8 01                	test   al,0x1
 1000ad1:	0f 84 80 00 00 00    	je     1000b57 <ataInit+0x219>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000ad7:	8d 51 01             	lea    edx,[ecx+0x1]
 1000ada:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:201
    {
        int err = inb(devInfo->ioPort+ATA_PORT_ERROR);
 1000adb:	0f b6 f8             	movzx  edi,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:203
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000ade:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000ae5:	74 15                	je     1000afc <ataInit+0x1be>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:204
            printk("drive %02X, cStatus=%02X, errreg=%02X\n",devInfo->driveNo, cStatus,err);
 1000ae7:	57                   	push   edi
 1000ae8:	53                   	push   ebx
 1000ae9:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000aef:	68 30 79 00 01       	push   0x1007930
 1000af4:	e8 7e 1a 00 00       	call   1002577 <printk>
 1000af9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:207
#endif
        if (err!=4)
            return false;
 1000afc:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:206
        int err = inb(devInfo->ioPort+ATA_PORT_ERROR);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("drive %02X, cStatus=%02X, errreg=%02X\n",devInfo->driveNo, cStatus,err);
#endif
        if (err!=4)
 1000b01:	83 ff 04             	cmp    edi,0x4
 1000b04:	0f 85 f0 00 00 00    	jne    1000bfa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:208
            return false;
        useCDROMIdentify = true;
 1000b0a:	c6 05 6c 3a 01 01 01 	mov    BYTE PTR ds:0x1013a6c,0x1
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000b11:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000b18:	8d 50 07             	lea    edx,[eax+0x7]
 1000b1b:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:209
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
 1000b1c:	0f b6 d8             	movzx  ebx,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:210
        if (cStatus==0)
 1000b1f:	85 db                	test   ebx,ebx
 1000b21:	75 34                	jne    1000b57 <ataInit+0x219>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:216
        {
#ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
                printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
            return false;
 1000b23:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:213
        useCDROMIdentify = true;
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (cStatus==0)
        {
#ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000b28:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000b2f:	0f 84 c5 00 00 00    	je     1000bfa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:214
                printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
 1000b35:	83 ec 04             	sub    esp,0x4
 1000b38:	6a 00                	push   0x0
 1000b3a:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000b40:	68 cd 73 00 01       	push   0x10073cd
 1000b45:	e8 2d 1a 00 00       	call   1002577 <printk>
 1000b4a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:216
#endif
            return false;
 1000b4d:	b8 00 00 00 00       	mov    eax,0x0
 1000b52:	e9 a3 00 00 00       	jmp    1000bfa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:219
        }
    }
    ticks=ATA_STANDARD_WAIT_MS*kTicksPerMS;
 1000b57:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1000b5c:	8d 04 80             	lea    eax,[eax+eax*4]
 1000b5f:	01 c0                	add    eax,eax
 1000b61:	89 c7                	mov    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:220
    while ((cStatus & ATA_STATUS_BUSY) == ATA_STATUS_BUSY && (ticks>0))
 1000b63:	c1 eb 07             	shr    ebx,0x7
 1000b66:	84 db                	test   bl,bl
 1000b68:	74 29                	je     1000b93 <ataInit+0x255>
 1000b6a:	85 c0                	test   eax,eax
 1000b6c:	7e 25                	jle    1000b93 <ataInit+0x255>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000b6e:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000b75:	8d 50 07             	lea    edx,[eax+0x7]
 1000b78:	ec                   	in     al,dx
 1000b79:	89 c3                	mov    ebx,eax
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:223
    {
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
 1000b7b:	83 ec 0c             	sub    esp,0xc
 1000b7e:	6a 01                	push   0x1
 1000b80:	e8 9b 23 00 00       	call   1002f20 <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:224
        ticks--;
 1000b85:	83 ef 01             	sub    edi,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:220
#endif
            return false;
        }
    }
    ticks=ATA_STANDARD_WAIT_MS*kTicksPerMS;
    while ((cStatus & ATA_STATUS_BUSY) == ATA_STATUS_BUSY && (ticks>0))
 1000b88:	83 c4 10             	add    esp,0x10
 1000b8b:	84 db                	test   bl,bl
 1000b8d:	79 04                	jns    1000b93 <ataInit+0x255>
 1000b8f:	85 ff                	test   edi,edi
 1000b91:	7f db                	jg     1000b6e <ataInit+0x230>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:226
    {
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
        ticks--;
    }
    if (!ataControllerIsReady(devInfo))
 1000b93:	83 ec 0c             	sub    esp,0xc
 1000b96:	56                   	push   esi
 1000b97:	e8 0a fc ff ff       	call   10007a6 <ataControllerIsReady>
 1000b9c:	89 c2                	mov    edx,eax
 1000b9e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:227
        return false;
 1000ba1:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:226
    {
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
        ticks--;
    }
    if (!ataControllerIsReady(devInfo))
 1000ba6:	84 d2                	test   dl,dl
 1000ba8:	74 50                	je     1000bfa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:228
        return false;
    if (inb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW)!=0x55 || inb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH)!=0xaa)
 1000baa:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
 1000bb0:	8d 59 04             	lea    ebx,[ecx+0x4]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000bb3:	89 da                	mov    edx,ebx
 1000bb5:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:228
 1000bb6:	3c 55                	cmp    al,0x55
 1000bb8:	75 08                	jne    1000bc2 <ataInit+0x284>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39 (discriminator 1)
 1000bba:	8d 51 05             	lea    edx,[ecx+0x5]
 1000bbd:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:228 (discriminator 1)
 1000bbe:	3c aa                	cmp    al,0xaa
 1000bc0:	74 33                	je     1000bf5 <ataInit+0x2b7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:231
    {
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000bc2:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000bc9:	74 21                	je     1000bec <ataInit+0x2ae>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000bcb:	8d 51 05             	lea    edx,[ecx+0x5]
 1000bce:	ec                   	in     al,dx
 1000bcf:	89 c1                	mov    ecx,eax
 1000bd1:	89 da                	mov    edx,ebx
 1000bd3:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:232
        printk("Cylinder port non-zero (%X,%X), device is non-ATA\n",inb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW), inb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH));
 1000bd4:	83 ec 04             	sub    esp,0x4
 1000bd7:	0f b6 c9             	movzx  ecx,cl
 1000bda:	51                   	push   ecx
 1000bdb:	0f b6 c0             	movzx  eax,al
 1000bde:	50                   	push   eax
 1000bdf:	68 58 79 00 01       	push   0x1007958
 1000be4:	e8 8e 19 00 00       	call   1002577 <printk>
 1000be9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
        return false;
 1000bec:	0f b6 05 6c 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a6c
 1000bf3:	eb 05                	jmp    1000bfa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:239
        if (useCDROMIdentify)
            return true;
        else
            return false;
    }
    return true;
 1000bf5:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:240
}
 1000bfa:	5b                   	pop    ebx
 1000bfb:	5e                   	pop    esi
 1000bfc:	5f                   	pop    edi
 1000bfd:	c3                   	ret    

01000bfe <ataGetModelFromIdentify>:
ataGetModelFromIdentify():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:243

void ataGetModelFromIdentify(struct ataDeviceInfo_t* devInfo)
{
 1000bfe:	56                   	push   esi
 1000bff:	53                   	push   ebx
 1000c00:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:244
    uint16_t* ident=devInfo->ATAIdentifyData+27;
 1000c04:	8d 46 36             	lea    eax,[esi+0x36]
 1000c07:	8d 96 01 02 00 00    	lea    edx,[esi+0x201]
 1000c0d:	8d 5e 5e             	lea    ebx,[esi+0x5e]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:247 (discriminator 3)
    for (int cnt=0;cnt<40;cnt+=2)
    {
        devInfo->ATADeviceModel[cnt]=(*ident >> 8) & 0xFF;
 1000c10:	0f b7 08             	movzx  ecx,WORD PTR [eax]
 1000c13:	66 c1 e9 08          	shr    cx,0x8
 1000c17:	88 4a ff             	mov    BYTE PTR [edx-0x1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:248 (discriminator 3)
        devInfo->ATADeviceModel[cnt+1]=(*ident++) & 0xFF;
 1000c1a:	83 c0 02             	add    eax,0x2
 1000c1d:	0f b7 48 fe          	movzx  ecx,WORD PTR [eax-0x2]
 1000c21:	88 0a                	mov    BYTE PTR [edx],cl
 1000c23:	83 c2 02             	add    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:245 (discriminator 3)
}

void ataGetModelFromIdentify(struct ataDeviceInfo_t* devInfo)
{
    uint16_t* ident=devInfo->ATAIdentifyData+27;
    for (int cnt=0;cnt<40;cnt+=2)
 1000c26:	39 d8                	cmp    eax,ebx
 1000c28:	75 e6                	jne    1000c10 <ataGetModelFromIdentify+0x12>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:250
    {
        devInfo->ATADeviceModel[cnt]=(*ident >> 8) & 0xFF;
        devInfo->ATADeviceModel[cnt+1]=(*ident++) & 0xFF;
    }
    devInfo->ATADeviceModel[79]='\0';
 1000c2a:	c6 86 4f 02 00 00 00 	mov    BYTE PTR [esi+0x24f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:251
}
 1000c31:	5b                   	pop    ebx
 1000c32:	5e                   	pop    esi
 1000c33:	c3                   	ret    

01000c34 <ataIdentify>:
ataIdentify():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:254

int ataIdentify(struct ataDeviceInfo_t* devInfo)
{
 1000c34:	56                   	push   esi
 1000c35:	53                   	push   ebx
 1000c36:	83 ec 04             	sub    esp,0x4
 1000c39:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:256
    //For ATA devices, read the identity data.  For SATA, we've already read it into ATAIdentityData
    if (devInfo->queryATAData)
 1000c3d:	80 be 50 02 00 00 00 	cmp    BYTE PTR [esi+0x250],0x0
 1000c44:	74 5c                	je     1000ca2 <ataIdentify+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:258
    {
        if (useCDROMIdentify)
 1000c46:	80 3d 6c 3a 01 01 00 	cmp    BYTE PTR ds:0x1013a6c,0x0
 1000c4d:	74 12                	je     1000c61 <ataIdentify+0x2d>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1000c4f:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000c56:	8d 50 07             	lea    edx,[eax+0x7]
 1000c59:	b8 a1 ff ff ff       	mov    eax,0xffffffa1
 1000c5e:	ee                   	out    dx,al
 1000c5f:	eb 10                	jmp    1000c71 <ataIdentify+0x3d>
 1000c61:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000c68:	8d 50 07             	lea    edx,[eax+0x7]
 1000c6b:	b8 ec ff ff ff       	mov    eax,0xffffffec
 1000c70:	ee                   	out    dx,al
ataIdentify():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:262
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_CDROM_COMMAND);
        else
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
        wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
 1000c71:	83 ec 0c             	sub    esp,0xc
 1000c74:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1000c79:	8d 04 80             	lea    eax,[eax+eax*4]
 1000c7c:	01 c0                	add    eax,eax
 1000c7e:	50                   	push   eax
 1000c7f:	e8 9c 22 00 00       	call   1002f20 <wait>
 1000c84:	0f b7 96 69 02 00 00 	movzx  edx,WORD PTR [esi+0x269]
 1000c8b:	89 f1                	mov    ecx,esi
 1000c8d:	8d 9e 00 02 00 00    	lea    ebx,[esi+0x200]
 1000c93:	83 c4 10             	add    esp,0x10
inw():
/home/yogi/src/os/chrisOSKernel/include/io.h:46 (discriminator 3)
}

static __inline unsigned short inw(unsigned short __port)
{
	unsigned short __val;
	__asm__ volatile ("inw %0, %1" : "=a" (__val) : "dN" (__port));
 1000c96:	66 ed                	in     ax,dx
ataIdentify():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:265 (discriminator 3)
        for (int readCount=0;readCount<=255;readCount++)
        {
            devInfo->ATAIdentifyData[readCount]=inw(devInfo->ioPort+ATA_PORT_DATA);
 1000c98:	66 89 01             	mov    WORD PTR [ecx],ax
 1000c9b:	83 c1 02             	add    ecx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:263 (discriminator 3)
        if (useCDROMIdentify)
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_CDROM_COMMAND);
        else
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
        wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
        for (int readCount=0;readCount<=255;readCount++)
 1000c9e:	39 d9                	cmp    ecx,ebx
 1000ca0:	75 f4                	jne    1000c96 <ataIdentify+0x62>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:268
        {
            devInfo->ATAIdentifyData[readCount]=inw(devInfo->ioPort+ATA_PORT_DATA);
        }
    }
    ataGetModelFromIdentify(devInfo);
 1000ca2:	83 ec 0c             	sub    esp,0xc
 1000ca5:	56                   	push   esi
 1000ca6:	e8 53 ff ff ff       	call   1000bfe <ataGetModelFromIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:269
    devInfo->totalSectorCount = devInfo->ATAIdentifyData[60] | (devInfo->ATAIdentifyData[61]<<16);
 1000cab:	0f b7 46 7a          	movzx  eax,WORD PTR [esi+0x7a]
 1000caf:	c1 e0 10             	shl    eax,0x10
 1000cb2:	0f b7 56 78          	movzx  edx,WORD PTR [esi+0x78]
 1000cb6:	09 d0                	or     eax,edx
 1000cb8:	89 86 56 02 00 00    	mov    DWORD PTR [esi+0x256],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:270
    devInfo->sectorSize = (devInfo->ATAIdentifyData[106] & 1<<12)==1<<12
 1000cbe:	83 c4 10             	add    esp,0x10
 1000cc1:	b8 00 02 00 00       	mov    eax,0x200
 1000cc6:	f6 86 d5 00 00 00 10 	test   BYTE PTR [esi+0xd5],0x10
 1000ccd:	74 12                	je     1000ce1 <ataIdentify+0xad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:270 (discriminator 1)
 1000ccf:	0f b7 46 24          	movzx  eax,WORD PTR [esi+0x24]
 1000cd3:	c1 e0 10             	shl    eax,0x10
 1000cd6:	89 c2                	mov    edx,eax
 1000cd8:	0f b7 86 ea 00 00 00 	movzx  eax,WORD PTR [esi+0xea]
 1000cdf:	09 d0                	or     eax,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:270 (discriminator 4)
 1000ce1:	89 86 5a 02 00 00    	mov    DWORD PTR [esi+0x25a],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:273 (discriminator 4)
            ?devInfo->ATAIdentifyData[117] | (devInfo->ATAIdentifyData[18]<<16)
            :512;
    devInfo->dmaSupported=devInfo->ATAIdentifyData[49]>>8 & 0x1;
 1000ce7:	0f b7 46 62          	movzx  eax,WORD PTR [esi+0x62]
 1000ceb:	89 c2                	mov    edx,eax
 1000ced:	66 c1 ea 08          	shr    dx,0x8
 1000cf1:	83 e2 01             	and    edx,0x1
 1000cf4:	88 96 60 02 00 00    	mov    BYTE PTR [esi+0x260],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:274 (discriminator 4)
    devInfo->lbaSupported=devInfo->ATAIdentifyData[49]>>9 & 0x1;
 1000cfa:	66 c1 e8 09          	shr    ax,0x9
 1000cfe:	83 e0 01             	and    eax,0x1
 1000d01:	88 86 5e 02 00 00    	mov    BYTE PTR [esi+0x25e],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:275 (discriminator 4)
    devInfo->lba48Supported=devInfo->ATAIdentifyData[83]>>10 & 0x1;
 1000d07:	0f b7 86 a6 00 00 00 	movzx  eax,WORD PTR [esi+0xa6]
 1000d0e:	66 c1 e8 0a          	shr    ax,0xa
 1000d12:	83 e0 01             	and    eax,0x1
 1000d15:	88 86 5f 02 00 00    	mov    BYTE PTR [esi+0x25f],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:278 (discriminator 4)
    
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000d1b:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000d22:	74 1d                	je     1000d41 <ataIdentify+0x10d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:279
        printk("drive %d, model=%s\n",devInfo->driveNo, devInfo->ATADeviceModel);
 1000d24:	83 ec 04             	sub    esp,0x4
 1000d27:	8d 86 00 02 00 00    	lea    eax,[esi+0x200]
 1000d2d:	50                   	push   eax
 1000d2e:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000d34:	68 ea 73 00 01       	push   0x10073ea
 1000d39:	e8 39 18 00 00       	call   1002577 <printk>
 1000d3e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:282
#endif
    return 1;
}
 1000d41:	b8 01 00 00 00       	mov    eax,0x1
 1000d46:	83 c4 04             	add    esp,0x4
 1000d49:	5b                   	pop    ebx
 1000d4a:	5e                   	pop    esi
 1000d4b:	c3                   	ret    

01000d4c <ataScanForHarddrives>:
ataScanForHarddrives():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:285

int ataScanForHarddrives()
{
 1000d4c:	53                   	push   ebx
 1000d4d:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:286
    kATADeviceInfo[0].bus=ATAPrimary;
 1000d50:	8b 1d c0 02 12 00    	mov    ebx,DWORD PTR ds:0x1202c0
 1000d56:	c7 83 61 02 00 00 00 	mov    DWORD PTR [ebx+0x261],0x0
 1000d5d:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:287
    kATADeviceInfo[0].driveNo=0;
 1000d60:	c7 83 65 02 00 00 00 	mov    DWORD PTR [ebx+0x265],0x0
 1000d67:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:288
    kATADeviceInfo[0].ioPort=0x1F0;
 1000d6a:	c7 83 69 02 00 00 f0 	mov    DWORD PTR [ebx+0x269],0x1f0
 1000d71:	01 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:289
    kATADeviceInfo[0].irqNum=0x14;
 1000d74:	c6 83 6d 02 00 00 14 	mov    BYTE PTR [ebx+0x26d],0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:290
    kATADeviceInfo[0].driveHeadPortDesignation=0xA0;
 1000d7b:	c6 83 6e 02 00 00 a0 	mov    BYTE PTR [ebx+0x26e],0xa0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:291
    kATADeviceInfo[0].queryATAData=true;
 1000d82:	c6 83 50 02 00 00 01 	mov    BYTE PTR [ebx+0x250],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:292
    kATADeviceInfo[0].ATADeviceAvailable=ataInit(&kATADeviceInfo[0]);
 1000d89:	53                   	push   ebx
 1000d8a:	e8 af fb ff ff       	call   100093e <ataInit>
 1000d8f:	88 83 51 02 00 00    	mov    BYTE PTR [ebx+0x251],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:293
    if (kATADeviceInfo[0].ATADeviceAvailable)
 1000d95:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000d9a:	83 c4 10             	add    esp,0x10
 1000d9d:	80 b8 51 02 00 00 00 	cmp    BYTE PTR [eax+0x251],0x0
 1000da4:	74 35                	je     1000ddb <ataScanForHarddrives+0x8f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:295
    {
        ataIdentify(&kATADeviceInfo[0]);
 1000da6:	83 ec 0c             	sub    esp,0xc
 1000da9:	50                   	push   eax
 1000daa:	e8 85 fe ff ff       	call   1000c34 <ataIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:296
        if (useCDROMIdentify)
 1000daf:	83 c4 10             	add    esp,0x10
 1000db2:	80 3d 6c 3a 01 01 00 	cmp    BYTE PTR ds:0x1013a6c,0x0
 1000db9:	74 11                	je     1000dcc <ataScanForHarddrives+0x80>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:297
            kATADeviceInfo[0].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000dbb:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000dc0:	c7 80 52 02 00 00 01 	mov    DWORD PTR [eax+0x252],0x1
 1000dc7:	00 00 00 
 1000dca:	eb 0f                	jmp    1000ddb <ataScanForHarddrives+0x8f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:299
        else
            kATADeviceInfo[0].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000dcc:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000dd1:	c7 80 52 02 00 00 00 	mov    DWORD PTR [eax+0x252],0x0
 1000dd8:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:301
    }
    useCDROMIdentify=false;
 1000ddb:	c6 05 6c 3a 01 01 00 	mov    BYTE PTR ds:0x1013a6c,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:303

    kATADeviceInfo[1].bus=ATAPrimary;
 1000de2:	8b 1d c0 02 12 00    	mov    ebx,DWORD PTR ds:0x1202c0
 1000de8:	c7 83 d4 04 00 00 00 	mov    DWORD PTR [ebx+0x4d4],0x0
 1000def:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:304
    kATADeviceInfo[1].driveNo=1;
 1000df2:	c7 83 d8 04 00 00 01 	mov    DWORD PTR [ebx+0x4d8],0x1
 1000df9:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:305
    kATADeviceInfo[1].ioPort=0x1F0;
 1000dfc:	c7 83 dc 04 00 00 f0 	mov    DWORD PTR [ebx+0x4dc],0x1f0
 1000e03:	01 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:306
    kATADeviceInfo[1].irqNum=0x14;
 1000e06:	c6 83 e0 04 00 00 14 	mov    BYTE PTR [ebx+0x4e0],0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:307
    kATADeviceInfo[1].driveHeadPortDesignation=0xB0;
 1000e0d:	c6 83 e1 04 00 00 b0 	mov    BYTE PTR [ebx+0x4e1],0xb0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:308
    kATADeviceInfo[1].queryATAData=true;
 1000e14:	c6 83 c3 04 00 00 01 	mov    BYTE PTR [ebx+0x4c3],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:309
    kATADeviceInfo[1].ATADeviceAvailable=ataInit(&kATADeviceInfo[1]);
 1000e1b:	83 ec 0c             	sub    esp,0xc
 1000e1e:	8d 83 73 02 00 00    	lea    eax,[ebx+0x273]
 1000e24:	50                   	push   eax
 1000e25:	e8 14 fb ff ff       	call   100093e <ataInit>
 1000e2a:	88 83 c4 04 00 00    	mov    BYTE PTR [ebx+0x4c4],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:310
    if (kATADeviceInfo[1].ATADeviceAvailable)
 1000e30:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000e35:	83 c4 10             	add    esp,0x10
 1000e38:	80 b8 c4 04 00 00 00 	cmp    BYTE PTR [eax+0x4c4],0x0
 1000e3f:	74 3a                	je     1000e7b <ataScanForHarddrives+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:312
    {
        ataIdentify(&kATADeviceInfo[1]);
 1000e41:	83 ec 0c             	sub    esp,0xc
 1000e44:	05 73 02 00 00       	add    eax,0x273
 1000e49:	50                   	push   eax
 1000e4a:	e8 e5 fd ff ff       	call   1000c34 <ataIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:313
        if (useCDROMIdentify)
 1000e4f:	83 c4 10             	add    esp,0x10
 1000e52:	80 3d 6c 3a 01 01 00 	cmp    BYTE PTR ds:0x1013a6c,0x0
 1000e59:	74 11                	je     1000e6c <ataScanForHarddrives+0x120>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:314
            kATADeviceInfo[1].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000e5b:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000e60:	c7 80 c5 04 00 00 01 	mov    DWORD PTR [eax+0x4c5],0x1
 1000e67:	00 00 00 
 1000e6a:	eb 0f                	jmp    1000e7b <ataScanForHarddrives+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:316
        else
            kATADeviceInfo[1].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000e6c:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000e71:	c7 80 c5 04 00 00 00 	mov    DWORD PTR [eax+0x4c5],0x0
 1000e78:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:318
    }
    kATADeviceInfo[2].bus=ATASecondary;
 1000e7b:	8b 1d c0 02 12 00    	mov    ebx,DWORD PTR ds:0x1202c0
 1000e81:	c7 83 47 07 00 00 01 	mov    DWORD PTR [ebx+0x747],0x1
 1000e88:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:319
    kATADeviceInfo[2].driveNo=2;
 1000e8b:	c7 83 4b 07 00 00 02 	mov    DWORD PTR [ebx+0x74b],0x2
 1000e92:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:320
    kATADeviceInfo[2].ioPort=0x170;
 1000e95:	c7 83 4f 07 00 00 70 	mov    DWORD PTR [ebx+0x74f],0x170
 1000e9c:	01 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:321
    kATADeviceInfo[2].irqNum=0x15;
 1000e9f:	c6 83 53 07 00 00 15 	mov    BYTE PTR [ebx+0x753],0x15
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:322
    kATADeviceInfo[2].driveHeadPortDesignation=0xA0;
 1000ea6:	c6 83 54 07 00 00 a0 	mov    BYTE PTR [ebx+0x754],0xa0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:323
    kATADeviceInfo[2].queryATAData=false;
 1000ead:	c6 83 36 07 00 00 00 	mov    BYTE PTR [ebx+0x736],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:324
    kATADeviceInfo[2].ATADeviceAvailable=ataInit(&kATADeviceInfo[2]);
 1000eb4:	83 ec 0c             	sub    esp,0xc
 1000eb7:	8d 83 e6 04 00 00    	lea    eax,[ebx+0x4e6]
 1000ebd:	50                   	push   eax
 1000ebe:	e8 7b fa ff ff       	call   100093e <ataInit>
 1000ec3:	88 83 37 07 00 00    	mov    BYTE PTR [ebx+0x737],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:325
    if (kATADeviceInfo[2].ATADeviceAvailable)
 1000ec9:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000ece:	83 c4 10             	add    esp,0x10
 1000ed1:	80 b8 37 07 00 00 00 	cmp    BYTE PTR [eax+0x737],0x0
 1000ed8:	74 3a                	je     1000f14 <ataScanForHarddrives+0x1c8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:327
    {
        ataIdentify(&kATADeviceInfo[2]);
 1000eda:	83 ec 0c             	sub    esp,0xc
 1000edd:	05 e6 04 00 00       	add    eax,0x4e6
 1000ee2:	50                   	push   eax
 1000ee3:	e8 4c fd ff ff       	call   1000c34 <ataIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:328
        if (useCDROMIdentify)
 1000ee8:	83 c4 10             	add    esp,0x10
 1000eeb:	80 3d 6c 3a 01 01 00 	cmp    BYTE PTR ds:0x1013a6c,0x0
 1000ef2:	74 11                	je     1000f05 <ataScanForHarddrives+0x1b9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:329
            kATADeviceInfo[2].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000ef4:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000ef9:	c7 80 38 07 00 00 01 	mov    DWORD PTR [eax+0x738],0x1
 1000f00:	00 00 00 
 1000f03:	eb 0f                	jmp    1000f14 <ataScanForHarddrives+0x1c8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:331
        else
            kATADeviceInfo[2].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000f05:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000f0a:	c7 80 38 07 00 00 00 	mov    DWORD PTR [eax+0x738],0x0
 1000f11:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:334
    }

    kATADeviceInfo[3].bus=ATASecondary;
 1000f14:	8b 1d c0 02 12 00    	mov    ebx,DWORD PTR ds:0x1202c0
 1000f1a:	c7 83 ba 09 00 00 01 	mov    DWORD PTR [ebx+0x9ba],0x1
 1000f21:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:335
    kATADeviceInfo[3].driveNo=3;
 1000f24:	c7 83 be 09 00 00 03 	mov    DWORD PTR [ebx+0x9be],0x3
 1000f2b:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:336
    kATADeviceInfo[3].ioPort=0x170;
 1000f2e:	c7 83 c2 09 00 00 70 	mov    DWORD PTR [ebx+0x9c2],0x170
 1000f35:	01 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:337
    kATADeviceInfo[3].irqNum=0x15;
 1000f38:	c6 83 c6 09 00 00 15 	mov    BYTE PTR [ebx+0x9c6],0x15
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:338
    kATADeviceInfo[3].driveHeadPortDesignation=0xB0;
 1000f3f:	c6 83 c7 09 00 00 b0 	mov    BYTE PTR [ebx+0x9c7],0xb0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:339
    kATADeviceInfo[3].queryATAData=true;
 1000f46:	c6 83 a9 09 00 00 01 	mov    BYTE PTR [ebx+0x9a9],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:340
    kATADeviceInfo[3].ATADeviceAvailable=ataInit(&kATADeviceInfo[3]);
 1000f4d:	83 ec 0c             	sub    esp,0xc
 1000f50:	8d 83 59 07 00 00    	lea    eax,[ebx+0x759]
 1000f56:	50                   	push   eax
 1000f57:	e8 e2 f9 ff ff       	call   100093e <ataInit>
 1000f5c:	88 83 aa 09 00 00    	mov    BYTE PTR [ebx+0x9aa],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:341
    if (kATADeviceInfo[3].ATADeviceAvailable)
 1000f62:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000f67:	83 c4 10             	add    esp,0x10
 1000f6a:	80 b8 aa 09 00 00 00 	cmp    BYTE PTR [eax+0x9aa],0x0
 1000f71:	74 3a                	je     1000fad <ataScanForHarddrives+0x261>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:343
    {
        ataIdentify(&kATADeviceInfo[3]);
 1000f73:	83 ec 0c             	sub    esp,0xc
 1000f76:	05 59 07 00 00       	add    eax,0x759
 1000f7b:	50                   	push   eax
 1000f7c:	e8 b3 fc ff ff       	call   1000c34 <ataIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:344
        if (useCDROMIdentify)
 1000f81:	83 c4 10             	add    esp,0x10
 1000f84:	80 3d 6c 3a 01 01 00 	cmp    BYTE PTR ds:0x1013a6c,0x0
 1000f8b:	74 11                	je     1000f9e <ataScanForHarddrives+0x252>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:345
            kATADeviceInfo[3].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000f8d:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000f92:	c7 80 ab 09 00 00 01 	mov    DWORD PTR [eax+0x9ab],0x1
 1000f99:	00 00 00 
 1000f9c:	eb 0f                	jmp    1000fad <ataScanForHarddrives+0x261>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:347
        else
            kATADeviceInfo[3].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000f9e:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000fa3:	c7 80 ab 09 00 00 00 	mov    DWORD PTR [eax+0x9ab],0x0
 1000faa:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:351
    }

#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000fad:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000fb4:	74 22                	je     1000fd8 <ataScanForHarddrives+0x28c>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:352
        printk("INIT: Disk1=%s  Disk2=%s\n", kATADeviceInfo[0].ATADeviceModel, kATADeviceInfo[1].ATADeviceModel);
 1000fb6:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000fbb:	83 ec 04             	sub    esp,0x4
 1000fbe:	8d 90 73 04 00 00    	lea    edx,[eax+0x473]
 1000fc4:	52                   	push   edx
 1000fc5:	05 00 02 00 00       	add    eax,0x200
 1000fca:	50                   	push   eax
 1000fcb:	68 fe 73 00 01       	push   0x10073fe
 1000fd0:	e8 a2 15 00 00       	call   1002577 <printk>
 1000fd5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:355
#endif
            return 0;
}
 1000fd8:	b8 00 00 00 00       	mov    eax,0x0
 1000fdd:	83 c4 08             	add    esp,0x8
 1000fe0:	5b                   	pop    ebx
 1000fe1:	c3                   	ret    

01000fe2 <ataBlockingRead28>:
ataBlockingRead28():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:365
        return -1;
    return ataBlockingRead28(sector, buffer, sector_count);
}

int ataBlockingRead28(uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
 1000fe2:	55                   	push   ebp
 1000fe3:	57                   	push   edi
 1000fe4:	56                   	push   esi
 1000fe5:	53                   	push   ebx
 1000fe6:	83 ec 1c             	sub    esp,0x1c
 1000fe9:	8b 74 24 34          	mov    esi,DWORD PTR [esp+0x34]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:370
    //For now if the FAT library calls this, we assume we've already read the same partition most recently
    int lResult=0;
    uint8_t* bufp=buffer;
    uint32_t lSectorsLeft=sector_count;
    uint32_t lSector=sector+partOffset; //this represents the start of the partition
 1000fed:	a1 64 3a 01 01       	mov    eax,ds:0x1013a64
 1000ff2:	03 44 24 30          	add    eax,DWORD PTR [esp+0x30]
 1000ff6:	89 c5                	mov    ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:373

#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000ff8:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000fff:	74 18                	je     1001019 <ataBlockingRead28+0x37>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:375
        {
            printk("ataBlockingRead28: sec: 0x%08X, buf 0x%08X, cnt 0x%08X\n", lSector, bufp, sector_count);
 1001001:	ff 74 24 38          	push   DWORD PTR [esp+0x38]
 1001005:	56                   	push   esi
 1001006:	50                   	push   eax
 1001007:	68 8c 79 00 01       	push   0x100798c
 100100c:	e8 66 15 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:376
            waitForKeyboardKey();
 1001011:	e8 a2 f4 ff ff       	call   10004b8 <waitForKeyboardKey>
 1001016:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:379
        }
#endif
    lResult=ataWaitForIdle(atablockingReadDev);
 1001019:	83 ec 0c             	sub    esp,0xc
 100101c:	ff 35 20 90 00 01    	push   DWORD PTR ds:0x1009020
 1001022:	e8 cc f6 ff ff       	call   10006f3 <ataWaitForIdle>
 1001027:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:380
    if (lResult)
 100102a:	83 c4 10             	add    esp,0x10
 100102d:	85 c0                	test   eax,eax
 100102f:	74 11                	je     1001042 <ataBlockingRead28+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:381
        panic("ataBlockingRead28: Timeout waiting for DRQ and BSY to be clear (0x%02X)", lResult);
 1001031:	83 ec 08             	sub    esp,0x8
 1001034:	50                   	push   eax
 1001035:	68 c4 79 00 01       	push   0x10079c4
 100103a:	e8 b1 10 00 00       	call   10020f0 <panic>
 100103f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:386
        //Select the drive we want
        //NOTE: Drive selected prior to calling this function
        //ataSelectDrive(drive,0);
        //Magic bit (6) to set LBA mode and top 4 bits of LBA28 sector # go in bottom 4
    outb(atablockingReadDev->ioPort+ATA_DRIVE_SELECT, inb(atablockingReadDev->ioPort+ATA_DRIVE_SELECT) | (1 << 6) | ((lSector >> 24) & 0x0F));
 1001042:	8b 1d 20 90 00 01    	mov    ebx,DWORD PTR ds:0x1009020
 1001048:	8b 8b 69 02 00 00    	mov    ecx,DWORD PTR [ebx+0x269]
 100104e:	8d 51 06             	lea    edx,[ecx+0x6]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1001051:	ec                   	in     al,dx
 1001052:	89 c7                	mov    edi,eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001054:	89 e8                	mov    eax,ebp
 1001056:	c1 e8 18             	shr    eax,0x18
 1001059:	83 e0 0f             	and    eax,0xf
 100105c:	83 c8 40             	or     eax,0x40
 100105f:	09 f8                	or     eax,edi
 1001061:	ee                   	out    dx,al
 1001062:	8d 51 02             	lea    edx,[ecx+0x2]
 1001065:	0f b6 44 24 38       	movzx  eax,BYTE PTR [esp+0x38]
 100106a:	ee                   	out    dx,al
 100106b:	8d 51 03             	lea    edx,[ecx+0x3]
 100106e:	89 e8                	mov    eax,ebp
 1001070:	ee                   	out    dx,al
 1001071:	89 e8                	mov    eax,ebp
 1001073:	c1 e8 08             	shr    eax,0x8
 1001076:	8d 51 04             	lea    edx,[ecx+0x4]
 1001079:	ee                   	out    dx,al
 100107a:	89 e8                	mov    eax,ebp
 100107c:	c1 e8 10             	shr    eax,0x10
 100107f:	8d 51 05             	lea    edx,[ecx+0x5]
 1001082:	ee                   	out    dx,al
 1001083:	8d 51 07             	lea    edx,[ecx+0x7]
 1001086:	b8 20 00 00 00       	mov    eax,0x20
 100108b:	ee                   	out    dx,al
ataBlockingRead28():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:396
    //Send the LBA sector number in the next 3 fields + high bit in the 
    outb(atablockingReadDev->ioPort+ATA_PORT_SECTOR_NUMBER, (lSector) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_CYLINDER_LOW, (lSector >> 8) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_CYLINDER_HIGH, (lSector >> 16) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_COMMAND, ATA_COMMAND_READ_SECTOR);
    lResult=ataWaitForDRQ(atablockingReadDev, true, ATA_STANDARD_WAIT_MS*kTicksPerMS);
 100108c:	83 ec 04             	sub    esp,0x4
 100108f:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1001094:	8d 04 80             	lea    eax,[eax+eax*4]
 1001097:	01 c0                	add    eax,eax
 1001099:	50                   	push   eax
 100109a:	6a 01                	push   0x1
 100109c:	53                   	push   ebx
 100109d:	e8 e2 f5 ff ff       	call   1000684 <ataWaitForDRQ>
 10010a2:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:397
    if (lResult)
 10010a5:	83 c4 10             	add    esp,0x10
 10010a8:	85 c0                	test   eax,eax
 10010aa:	74 17                	je     10010c3 <ataBlockingRead28+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:398
        panic("ataBlockingRead28: Timeout waiting for DRQ to be set Stts=0x%02X, Err=0x%02X", lResult, hdError);
 10010ac:	83 ec 04             	sub    esp,0x4
 10010af:	ff 35 68 3a 01 01    	push   DWORD PTR ds:0x1013a68
 10010b5:	50                   	push   eax
 10010b6:	68 0c 7a 00 01       	push   0x1007a0c
 10010bb:	e8 30 10 00 00       	call   10020f0 <panic>
 10010c0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:399
    while (lSectorsLeft)
 10010c3:	83 7c 24 38 00       	cmp    DWORD PTR [esp+0x38],0x0
 10010c8:	0f 84 e7 00 00 00    	je     10011b5 <ataBlockingRead28+0x1d3>
 10010ce:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
 10010d2:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:401
    {
        insw(atablockingReadDev->ioPort+ATA_PORT_DATA, bufp, 256);
 10010d6:	a1 20 90 00 01       	mov    eax,ds:0x1009020
insw():
/home/yogi/src/os/chrisOSKernel/include/io.h:87
		      : "d" (__port));
}

static __inline void insw(unsigned short __port, void *__buf, unsigned long __n)
{
	__asm__ volatile ("cld; rep; insw"
 10010db:	8b 90 69 02 00 00    	mov    edx,DWORD PTR [eax+0x269]
 10010e1:	89 f7                	mov    edi,esi
 10010e3:	b9 00 01 00 00       	mov    ecx,0x100
 10010e8:	fc                   	cld    
 10010e9:	f3 66 6d             	rep ins WORD PTR es:[edi],dx
ataBlockingRead28():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:403
        #ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10010ec:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 10010f3:	74 40                	je     1001135 <ataBlockingRead28+0x153>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:405
            {
                printk("ataBlockingRead28: Debugging: ");
 10010f5:	83 ec 0c             	sub    esp,0xc
 10010f8:	68 5c 7a 00 01       	push   0x1007a5c
 10010fd:	e8 75 14 00 00       	call   1002577 <printk>
 1001102:	89 f3                	mov    ebx,esi
 1001104:	8d 7e 14             	lea    edi,[esi+0x14]
 1001107:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:407 (discriminator 3)
                for (int cnt2=0;cnt2<20;cnt2++)
                    printk("%02X ", bufp[cnt2]);
 100110a:	83 ec 08             	sub    esp,0x8
 100110d:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001110:	50                   	push   eax
 1001111:	68 18 74 00 01       	push   0x1007418
 1001116:	e8 5c 14 00 00       	call   1002577 <printk>
 100111b:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:406 (discriminator 3)
        insw(atablockingReadDev->ioPort+ATA_PORT_DATA, bufp, 256);
        #ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            {
                printk("ataBlockingRead28: Debugging: ");
                for (int cnt2=0;cnt2<20;cnt2++)
 100111e:	83 c4 10             	add    esp,0x10
 1001121:	39 df                	cmp    edi,ebx
 1001123:	75 e5                	jne    100110a <ataBlockingRead28+0x128>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:408
                    printk("%02X ", bufp[cnt2]);
                printk("\n");
 1001125:	83 ec 0c             	sub    esp,0xc
 1001128:	68 3f 77 00 01       	push   0x100773f
 100112d:	e8 45 14 00 00       	call   1002577 <printk>
 1001132:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:411
            }
        #endif
        if (--lSectorsLeft>0) //zero based vs 1 based
 1001135:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
 100113a:	74 79                	je     10011b5 <ataBlockingRead28+0x1d3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:413
        {
            wait(50);
 100113c:	83 ec 0c             	sub    esp,0xc
 100113f:	6a 32                	push   0x32
 1001141:	e8 da 1d 00 00       	call   1002f20 <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:414
            lResult=ataWaitForDRQ(atablockingReadDev, true, ATA_STANDARD_WAIT_MS*kTicksPerMS);
 1001146:	83 c4 0c             	add    esp,0xc
 1001149:	a1 84 02 12 00       	mov    eax,ds:0x120284
 100114e:	8d 04 80             	lea    eax,[eax+eax*4]
 1001151:	01 c0                	add    eax,eax
 1001153:	50                   	push   eax
 1001154:	6a 01                	push   0x1
 1001156:	ff 35 20 90 00 01    	push   DWORD PTR ds:0x1009020
 100115c:	e8 23 f5 ff ff       	call   1000684 <ataWaitForDRQ>
 1001161:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:415
            bufp+=512;
 1001164:	81 c6 00 02 00 00    	add    esi,0x200
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:416
            lSector++;
 100116a:	83 c5 01             	add    ebp,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:417
            if (lResult)
 100116d:	83 c4 10             	add    esp,0x10
 1001170:	85 c0                	test   eax,eax
 1001172:	74 17                	je     100118b <ataBlockingRead28+0x1a9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:418
                panic("ataBlockingRead28: Timeout in read loop, waiting for DRQ to be set Stts=0x%02X, Err=0x%02X", lResult, hdError);
 1001174:	83 ec 04             	sub    esp,0x4
 1001177:	ff 35 68 3a 01 01    	push   DWORD PTR ds:0x1013a68
 100117d:	50                   	push   eax
 100117e:	68 7c 7a 00 01       	push   0x1007a7c
 1001183:	e8 68 0f 00 00       	call   10020f0 <panic>
 1001188:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:420
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 100118b:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1001192:	0f 84 3e ff ff ff    	je     10010d6 <ataBlockingRead28+0xf4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:422
        {
            printk("ataBlockingRead28: sec=0x%08X, buf=0x%08X, rep=0x%08X    \n", lSector, bufp, lSectorsLeft);
 1001198:	ff 74 24 0c          	push   DWORD PTR [esp+0xc]
 100119c:	56                   	push   esi
 100119d:	55                   	push   ebp
 100119e:	68 d8 7a 00 01       	push   0x1007ad8
 10011a3:	e8 cf 13 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:423
            waitForKeyboardKey();
 10011a8:	e8 0b f3 ff ff       	call   10004b8 <waitForKeyboardKey>
 10011ad:	83 c4 10             	add    esp,0x10
 10011b0:	e9 21 ff ff ff       	jmp    10010d6 <ataBlockingRead28+0xf4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:428
        }
#endif
        }
    }
    return 512*sector_count;
 10011b5:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
 10011b9:	c1 e0 09             	shl    eax,0x9
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:429
}
 10011bc:	83 c4 1c             	add    esp,0x1c
 10011bf:	5b                   	pop    ebx
 10011c0:	5e                   	pop    esi
 10011c1:	5f                   	pop    edi
 10011c2:	5d                   	pop    ebp
 10011c3:	c3                   	ret    

010011c4 <ataReadDisk>:
ataReadDisk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:357
        printk("INIT: Disk1=%s  Disk2=%s\n", kATADeviceInfo[0].ATADeviceModel, kATADeviceInfo[1].ATADeviceModel);
#endif
            return 0;
}
int ataReadDisk(struct ataDeviceInfo_t* devInfo, uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
 10011c4:	83 ec 0c             	sub    esp,0xc
 10011c7:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:358
    atablockingReadDev = devInfo;
 10011cb:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 10011cf:	89 15 20 90 00 01    	mov    DWORD PTR ds:0x1009020,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:359
    if (sector_count==0)    //this function can be called with a sector_count of 0 in order to set partOffset
 10011d5:	85 c0                	test   eax,eax
 10011d7:	74 16                	je     10011ef <ataReadDisk+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:361
        return -1;
    return ataBlockingRead28(sector, buffer, sector_count);
 10011d9:	83 ec 04             	sub    esp,0x4
 10011dc:	50                   	push   eax
 10011dd:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 10011e1:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 10011e5:	e8 f8 fd ff ff       	call   1000fe2 <ataBlockingRead28>
 10011ea:	83 c4 10             	add    esp,0x10
 10011ed:	eb 05                	jmp    10011f4 <ataReadDisk+0x30>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:360
}
int ataReadDisk(struct ataDeviceInfo_t* devInfo, uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
    atablockingReadDev = devInfo;
    if (sector_count==0)    //this function can be called with a sector_count of 0 in order to set partOffset
        return -1;
 10011ef:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:362
    return ataBlockingRead28(sector, buffer, sector_count);
}
 10011f4:	83 c4 0c             	add    esp,0xc
 10011f7:	c3                   	ret    

010011f8 <ataBlockingWrite28>:
ataBlockingWrite28():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:468
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("ataBlockingWrite28: Finished sending data\n");
#endif
    return 512;
*/}
 10011f8:	f3 c3                	repz ret 
 10011fa:	66 90                	xchg   ax,ax

010011fc <kPagingGet4kPDEntryValue>:
kPagingGet4kPDEntryValue():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:19
extern uint32_t*  kKernelPageDir;
extern uint64_t kE820MemoryBytes;
extern uint32_t kDebugLevel;

uint32_t kPagingGet4kPDEntryValue(uint32_t address)
{
 10011fc:	53                   	push   ebx
 10011fd:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:21
    address&=0xFFFFF000;
    uintptr_t* lTemp=(uint32_t*)((KERNEL_PAGE_DIR_ADDRESS + (((address & 0xFFC00000) >> 22) << 2)));
 1001200:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1001204:	c1 eb 16             	shr    ebx,0x16
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:23
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001207:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100120e:	74 17                	je     1001227 <kPagingGet4kPDEntryValue+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:24
            printk("pagingGet4kPDEntryValue: dirAddressPtr=0x%08x\n", *lTemp);
 1001210:	83 ec 08             	sub    esp,0x8
 1001213:	ff 34 9d 00 90 4a 00 	push   DWORD PTR [ebx*4+0x4a9000]
 100121a:	68 14 7b 00 01       	push   0x1007b14
 100121f:	e8 53 13 00 00       	call   1002577 <printk>
 1001224:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:26
#endif
    return (uint32_t)*lTemp;
 1001227:	8b 04 9d 00 90 4a 00 	mov    eax,DWORD PTR [ebx*4+0x4a9000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:27
}
 100122e:	83 c4 08             	add    esp,0x8
 1001231:	5b                   	pop    ebx
 1001232:	c3                   	ret    

01001233 <kPagingGet4kPDEntryAddress>:
kPagingGet4kPDEntryAddress():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:30

uint32_t kPagingGet4kPDEntryAddress(uint32_t address)
{
 1001233:	53                   	push   ebx
 1001234:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:32
    address&=0xFFFFF000;
    uintptr_t lTemp=((KERNEL_PAGE_DIR_ADDRESS  | (((address & 0xFFC00000) >> 22) << 2)));
 1001237:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 100123b:	c1 eb 16             	shr    ebx,0x16
 100123e:	c1 e3 02             	shl    ebx,0x2
 1001241:	81 cb 00 90 4a 00    	or     ebx,0x4a9000
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:34
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001247:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100124e:	74 11                	je     1001261 <kPagingGet4kPDEntryAddress+0x2e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:35
            printk("dirEntryAddress=0x%08x\n", lTemp);
 1001250:	83 ec 08             	sub    esp,0x8
 1001253:	53                   	push   ebx
 1001254:	68 1e 74 00 01       	push   0x100741e
 1001259:	e8 19 13 00 00       	call   1002577 <printk>
 100125e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:38
#endif
    return (uint32_t)lTemp & 0xFFFFFFFF;
}
 1001261:	89 d8                	mov    eax,ebx
 1001263:	83 c4 08             	add    esp,0x8
 1001266:	5b                   	pop    ebx
 1001267:	c3                   	ret    

01001268 <kPagingGet4kPTEntryAddress>:
kPagingGet4kPTEntryAddress():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:41

uint32_t kPagingGet4kPTEntryAddress(uint32_t address)
{
 1001268:	53                   	push   ebx
 1001269:	83 ec 14             	sub    esp,0x14
 100126c:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:43
    address&=0xFFFFF000;
    uintptr_t pDirPtr=kPagingGet4kPDEntryValue(address) & 0xFFFFF000;
 1001270:	89 d8                	mov    eax,ebx
 1001272:	25 00 f0 ff ff       	and    eax,0xfffff000
 1001277:	50                   	push   eax
 1001278:	e8 7f ff ff ff       	call   10011fc <kPagingGet4kPDEntryValue>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:44
    return ((address & 0x3FF000) >> 12) << 2 | pDirPtr;
 100127d:	81 e3 00 f0 3f 00    	and    ebx,0x3ff000
 1001283:	c1 eb 0a             	shr    ebx,0xa
 1001286:	25 00 f0 ff ff       	and    eax,0xfffff000
 100128b:	09 d8                	or     eax,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:45
}
 100128d:	83 c4 18             	add    esp,0x18
 1001290:	5b                   	pop    ebx
 1001291:	c3                   	ret    

01001292 <kPagingGet4kPTEntryValue>:
kPagingGet4kPTEntryValue():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:48

uint32_t kPagingGet4kPTEntryValue(uint32_t address)
{
 1001292:	53                   	push   ebx
 1001293:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:50
    address&=0xFFFFF000;
    uint32_t* pTablePtr=(uint32_t*)kPagingGet4kPTEntryAddress(address);
 1001296:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 100129a:	25 00 f0 ff ff       	and    eax,0xfffff000
 100129f:	50                   	push   eax
 10012a0:	e8 c3 ff ff ff       	call   1001268 <kPagingGet4kPTEntryAddress>
 10012a5:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:52
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10012a7:	83 c4 10             	add    esp,0x10
 10012aa:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10012b1:	74 11                	je     10012c4 <kPagingGet4kPTEntryValue+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:53
             printk("pagingGet4kPTEntryValue: pageEntryAddress=0x%08X\n", pTablePtr);
 10012b3:	83 ec 08             	sub    esp,0x8
 10012b6:	50                   	push   eax
 10012b7:	68 44 7b 00 01       	push   0x1007b44
 10012bc:	e8 b6 12 00 00       	call   1002577 <printk>
 10012c1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:56
             //printf("pageEntryValue=0x%08X\n", *pTablePtr);
#endif
    return *pTablePtr;
 10012c4:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:57
}
 10012c6:	83 c4 08             	add    esp,0x8
 10012c9:	5b                   	pop    ebx
 10012ca:	c3                   	ret    

010012cb <kPagingSetPageReadOnlyFlag>:
kPagingSetPageReadOnlyFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:60

void kPagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly)
{
 10012cb:	56                   	push   esi
 10012cc:	53                   	push   ebx
 10012cd:	83 ec 04             	sub    esp,0x4
 10012d0:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10012d4:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:62
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10012d8:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10012df:	74 13                	je     10012f4 <kPagingSetPageReadOnlyFlag+0x29>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:63
            printk("pagingMakePageReadOnly: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 10012e1:	83 ec 04             	sub    esp,0x4
 10012e4:	ff 33                	push   DWORD PTR [ebx]
 10012e6:	53                   	push   ebx
 10012e7:	68 78 7b 00 01       	push   0x1007b78
 10012ec:	e8 86 12 00 00       	call   1002577 <printk>
 10012f1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:65
#endif
         if (readOnly)
 10012f4:	89 f0                	mov    eax,esi
 10012f6:	84 c0                	test   al,al
 10012f8:	74 05                	je     10012ff <kPagingSetPageReadOnlyFlag+0x34>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:66
            *ptEntry&=0xFFFFFFFD;
 10012fa:	83 23 fd             	and    DWORD PTR [ebx],0xfffffffd
 10012fd:	eb 03                	jmp    1001302 <kPagingSetPageReadOnlyFlag+0x37>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:68
         else
            *ptEntry|=2; 
 10012ff:	83 0b 02             	or     DWORD PTR [ebx],0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:69
    RELOAD_CR3
 1001302:	0f 20 d8             	mov    eax,cr3
 1001305:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:71
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001308:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100130f:	74 12                	je     1001323 <kPagingSetPageReadOnlyFlag+0x58>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:72
            printk("0x%08X\n", *ptEntry);
 1001311:	83 ec 08             	sub    esp,0x8
 1001314:	ff 33                	push   DWORD PTR [ebx]
 1001316:	68 66 77 00 01       	push   0x1007766
 100131b:	e8 57 12 00 00       	call   1002577 <printk>
 1001320:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:74
#endif
}
 1001323:	83 c4 04             	add    esp,0x4
 1001326:	5b                   	pop    ebx
 1001327:	5e                   	pop    esi
 1001328:	c3                   	ret    

01001329 <kPagingUpdatePTEPresentFlag>:
kPagingUpdatePTEPresentFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:77

void kPagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present)
{
 1001329:	56                   	push   esi
 100132a:	53                   	push   ebx
 100132b:	83 ec 04             	sub    esp,0x4
 100132e:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1001332:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:78
         printd(DEBUG_PAGING,"pagingUpdatePTEPresentFlag: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 1001336:	ff 33                	push   DWORD PTR [ebx]
 1001338:	53                   	push   ebx
 1001339:	68 b0 7b 00 01       	push   0x1007bb0
 100133e:	6a 40                	push   0x40
 1001340:	e8 4a 12 00 00       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:79
         if (present)
 1001345:	83 c4 10             	add    esp,0x10
 1001348:	89 f0                	mov    eax,esi
 100134a:	84 c0                	test   al,al
 100134c:	74 05                	je     1001353 <kPagingUpdatePTEPresentFlag+0x2a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:80
             *ptEntry=*ptEntry | 1;
 100134e:	83 0b 01             	or     DWORD PTR [ebx],0x1
 1001351:	eb 03                	jmp    1001356 <kPagingUpdatePTEPresentFlag+0x2d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:82
         else
             *ptEntry&=0xFFFFFFFE;
 1001353:	83 23 fe             	and    DWORD PTR [ebx],0xfffffffe
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:83
         __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
 1001356:	0f 20 d8             	mov    eax,cr3
 1001359:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:84
         printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 100135c:	83 ec 04             	sub    esp,0x4
 100135f:	ff 33                	push   DWORD PTR [ebx]
 1001361:	68 66 77 00 01       	push   0x1007766
 1001366:	6a 40                	push   0x40
 1001368:	e8 22 12 00 00       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:85
}
 100136d:	83 c4 14             	add    esp,0x14
 1001370:	5b                   	pop    ebx
 1001371:	5e                   	pop    esi
 1001372:	c3                   	ret    

01001373 <kSetVirtualRangeRO>:
kSetVirtualRangeRO():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:88

void kSetVirtualRangeRO(uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 1001373:	55                   	push   ebp
 1001374:	57                   	push   edi
 1001375:	56                   	push   esi
 1001376:	53                   	push   ebx
 1001377:	83 ec 1c             	sub    esp,0x1c
 100137a:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
 100137e:	8b 6c 24 34          	mov    ebp,DWORD PTR [esp+0x34]
 1001382:	8b 74 24 38          	mov    esi,DWORD PTR [esp+0x38]
 1001386:	89 f7                	mov    edi,esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:91
    uintptr_t* startPTE;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001388:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100138f:	74 12                	je     10013a3 <kSetVirtualRangeRO+0x30>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:92
           printk("kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
 1001391:	83 ec 04             	sub    esp,0x4
 1001394:	55                   	push   ebp
 1001395:	53                   	push   ebx
 1001396:	68 ec 7b 00 01       	push   0x1007bec
 100139b:	e8 d7 11 00 00       	call   1002577 <printk>
 10013a0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:94 (discriminator 1)
#endif
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 10013a3:	83 c5 01             	add    ebp,0x1
 10013a6:	39 eb                	cmp    ebx,ebp
 10013a8:	77 5b                	ja     1001405 <kSetVirtualRangeRO+0x92>
 10013aa:	89 f0                	mov    eax,esi
 10013ac:	84 c0                	test   al,al
 10013ae:	b8 39 74 00 01       	mov    eax,0x1007439
 10013b3:	ba 36 74 00 01       	mov    edx,0x1007436
 10013b8:	0f 45 c2             	cmovne eax,edx
 10013bb:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:101
        startPTE=(uintptr_t*)kPagingGet4kPTEntryAddress(cnt);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printk("0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
#endif
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 10013bf:	89 f8                	mov    eax,edi
 10013c1:	0f b6 f8             	movzx  edi,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:96
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
           printk("kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
#endif
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
    {
        startPTE=(uintptr_t*)kPagingGet4kPTEntryAddress(cnt);
 10013c4:	83 ec 0c             	sub    esp,0xc
 10013c7:	53                   	push   ebx
 10013c8:	e8 9b fe ff ff       	call   1001268 <kPagingGet4kPTEntryAddress>
 10013cd:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:98
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10013cf:	83 c4 10             	add    esp,0x10
 10013d2:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10013d9:	74 13                	je     10013ee <kSetVirtualRangeRO+0x7b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:99 (discriminator 4)
            printk("0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
 10013db:	ff 74 24 0c          	push   DWORD PTR [esp+0xc]
 10013df:	50                   	push   eax
 10013e0:	53                   	push   ebx
 10013e1:	68 3c 74 00 01       	push   0x100743c
 10013e6:	e8 8c 11 00 00       	call   1002577 <printk>
 10013eb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:101 (discriminator 2)
#endif
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 10013ee:	83 ec 08             	sub    esp,0x8
 10013f1:	57                   	push   edi
 10013f2:	56                   	push   esi
 10013f3:	e8 d3 fe ff ff       	call   10012cb <kPagingSetPageReadOnlyFlag>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:94 (discriminator 2)
    uintptr_t* startPTE;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
           printk("kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
#endif
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 10013f8:	81 c3 00 10 00 00    	add    ebx,0x1000
 10013fe:	83 c4 10             	add    esp,0x10
 1001401:	39 eb                	cmp    ebx,ebp
 1001403:	76 bf                	jbe    10013c4 <kSetVirtualRangeRO+0x51>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:105
#endif
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
            
    }
        //for cnt=0;cnt<=8192;cnt+=4096
}
 1001405:	83 c4 1c             	add    esp,0x1c
 1001408:	5b                   	pop    ebx
 1001409:	5e                   	pop    esi
 100140a:	5f                   	pop    edi
 100140b:	5d                   	pop    ebp
 100140c:	c3                   	ret    

0100140d <kpagingUpdatePresentFlagA>:
kpagingUpdatePresentFlagA():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:109

//Absolute version, page passed is already virtual
void kpagingUpdatePresentFlagA(uint32_t address, bool present)
{
 100140d:	56                   	push   esi
 100140e:	53                   	push   ebx
 100140f:	83 ec 04             	sub    esp,0x4
 1001412:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 1001416:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:111
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 100141a:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001421:	74 21                	je     1001444 <kpagingUpdatePresentFlagA+0x37>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:112
            printk("kpagingUpdatePresentFlagA: Make 0x%08X %s\n", address, present?"present":"not present");
 1001423:	84 db                	test   bl,bl
 1001425:	ba 54 74 00 01       	mov    edx,0x1007454
 100142a:	b8 58 74 00 01       	mov    eax,0x1007458
 100142f:	0f 44 c2             	cmove  eax,edx
 1001432:	83 ec 04             	sub    esp,0x4
 1001435:	50                   	push   eax
 1001436:	56                   	push   esi
 1001437:	68 1c 7c 00 01       	push   0x1007c1c
 100143c:	e8 36 11 00 00       	call   1002577 <printk>
 1001441:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:114
#endif
        uintptr_t* pagePTE= (uintptr_t*)kPagingGet4kPTEntryAddress(address&0xFFFFF000);
 1001444:	83 ec 0c             	sub    esp,0xc
 1001447:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 100144d:	56                   	push   esi
 100144e:	e8 15 fe ff ff       	call   1001268 <kPagingGet4kPTEntryAddress>
 1001453:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:116
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001455:	83 c4 10             	add    esp,0x10
 1001458:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100145f:	74 11                	je     1001472 <kpagingUpdatePresentFlagA+0x65>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:117
            printk("kpagingUpdatePresentFlagA: updating entry 0x%08X\n", pagePTE);
 1001461:	83 ec 08             	sub    esp,0x8
 1001464:	50                   	push   eax
 1001465:	68 48 7c 00 01       	push   0x1007c48
 100146a:	e8 08 11 00 00       	call   1002577 <printk>
 100146f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:119
#endif
        kPagingUpdatePTEPresentFlag(pagePTE, present);
 1001472:	83 ec 08             	sub    esp,0x8
 1001475:	0f b6 db             	movzx  ebx,bl
 1001478:	53                   	push   ebx
 1001479:	56                   	push   esi
 100147a:	e8 aa fe ff ff       	call   1001329 <kPagingUpdatePTEPresentFlag>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:120
}
 100147f:	83 c4 14             	add    esp,0x14
 1001482:	5b                   	pop    ebx
 1001483:	5e                   	pop    esi
 1001484:	c3                   	ret    

01001485 <kpagingUpdatePresentFlagV>:
kpagingUpdatePresentFlagV():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:123

void kpagingUpdatePresentFlagV(uint32_t address, bool present)
{
 1001485:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:125
    address+=KERNEL_PAGED_BASE_ADDRESS; 
    kpagingUpdatePresentFlagA(address, present);
 1001488:	0f b6 44 24 1c       	movzx  eax,BYTE PTR [esp+0x1c]
 100148d:	50                   	push   eax
 100148e:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1001492:	2d 00 00 00 40       	sub    eax,0x40000000
 1001497:	50                   	push   eax
 1001498:	e8 70 ff ff ff       	call   100140d <kpagingUpdatePresentFlagA>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:126
}
 100149d:	83 c4 1c             	add    esp,0x1c
 10014a0:	c3                   	ret    

010014a1 <kMapPage>:
kMapPage():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:129

void kMapPage(uintptr_t mapTo, uintptr_t mapFrom, uint8_t flags)
{
 10014a1:	57                   	push   edi
 10014a2:	56                   	push   esi
 10014a3:	53                   	push   ebx
 10014a4:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
 10014a8:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:134
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)kKernelPageDir;
    ptrVal=ptr[(mapTo>>22)];
 10014ac:	89 cb                	mov    ebx,ecx
 10014ae:	c1 eb 16             	shr    ebx,0x16
 10014b1:	a1 a4 02 12 00       	mov    eax,ds:0x1202a4
 10014b6:	8d 1c 98             	lea    ebx,[eax+ebx*4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:135
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
 10014b9:	83 3b 00             	cmp    DWORD PTR [ebx],0x0
 10014bc:	75 6a                	jne    1001528 <kMapPage+0x87>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:135 (discriminator 1)
 10014be:	bf 00 00 00 00       	mov    edi,0x0
 10014c3:	3b 3d 4c 00 12 00    	cmp    edi,DWORD PTR ds:0x12004c
 10014c9:	72 08                	jb     10014d3 <kMapPage+0x32>
 10014cb:	3b 0d 48 00 12 00    	cmp    ecx,DWORD PTR ds:0x120048
 10014d1:	73 41                	jae    1001514 <kMapPage+0x73>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:138
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
 10014d3:	c7 03 63 00 00 20    	mov    DWORD PTR [ebx],0x20000063
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:139
        ptrT[(mapTo&0x003FFFFF/4096)]=mapFrom | flags;
 10014d9:	89 c8                	mov    eax,ecx
 10014db:	25 ff 03 00 00       	and    eax,0x3ff
 10014e0:	8d 34 85 00 00 00 20 	lea    esi,[eax*4+0x20000000]
 10014e7:	0f b6 d2             	movzx  edx,dl
 10014ea:	0b 54 24 14          	or     edx,DWORD PTR [esp+0x14]
 10014ee:	89 14 85 00 00 00 20 	mov    DWORD PTR [eax*4+0x20000000],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:141
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10014f5:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10014fc:	74 64                	je     1001562 <kMapPage+0xc1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:142
            printk("kMapPage: Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)],ptrT[(mapTo&0x003FFFFF/4096)]);
 10014fe:	83 ec 0c             	sub    esp,0xc
 1001501:	52                   	push   edx
 1001502:	56                   	push   esi
 1001503:	53                   	push   ebx
 1001504:	51                   	push   ecx
 1001505:	68 7c 7c 00 01       	push   0x1007c7c
 100150a:	e8 68 10 00 00       	call   1002577 <printk>
 100150f:	83 c4 20             	add    esp,0x20
 1001512:	eb 4e                	jmp    1001562 <kMapPage+0xc1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:150
    else
    {
        //ptrVal right now points to the pdir entry
        ptr=(uint32_t*)kKernelPageDir;
        if (ptr[(mapTo>>22)]==0)
            ptr[mapTo>>22]=(KERNEL_PAGE_TABLE_BASE_ADDRESS + ((mapTo&0x003FFFFF)/4096)) | 0x63;
 1001514:	89 c8                	mov    eax,ecx
 1001516:	25 ff ff 3f 00       	and    eax,0x3fffff
 100151b:	c1 e8 0c             	shr    eax,0xc
 100151e:	05 00 b0 4b 00       	add    eax,0x4bb000
 1001523:	83 c8 63             	or     eax,0x63
 1001526:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:156
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=mapFrom | flags;
 1001528:	8b 33                	mov    esi,DWORD PTR [ebx]
 100152a:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 1001530:	89 c8                	mov    eax,ecx
 1001532:	c1 e8 0a             	shr    eax,0xa
 1001535:	25 fc 0f 00 00       	and    eax,0xffc
 100153a:	01 f0                	add    eax,esi
 100153c:	0f b6 d2             	movzx  edx,dl
 100153f:	0b 54 24 14          	or     edx,DWORD PTR [esp+0x14]
 1001543:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:160
//                printk("ptrT=%X(%X)\n",&ptrT[ptrVal],ptrT[ptrVal]);
//                STOPHERE2
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001545:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100154c:	74 14                	je     1001562 <kMapPage+0xc1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:161
            printk("2) Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal],ptrT[ptrVal]);
 100154e:	83 ec 0c             	sub    esp,0xc
 1001551:	52                   	push   edx
 1001552:	50                   	push   eax
 1001553:	53                   	push   ebx
 1001554:	51                   	push   ecx
 1001555:	68 bc 7c 00 01       	push   0x1007cbc
 100155a:	e8 18 10 00 00       	call   1002577 <printk>
 100155f:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:165
#endif
    }
//    if (ptrT[(src&0x003FFFFF/1000)]==0)
}
 1001562:	5b                   	pop    ebx
 1001563:	5e                   	pop    esi
 1001564:	5f                   	pop    edi
 1001565:	c3                   	ret    

01001566 <kIsPageMapped>:
kIsPageMapped():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:168

bool kIsPageMapped(uintptr_t Address)
{
 1001566:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:169
    if (!kPagingGet4kPTEntryValue(Address))
 1001569:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100156d:	e8 20 fd ff ff       	call   1001292 <kPagingGet4kPTEntryValue>
 1001572:	85 c0                	test   eax,eax
 1001574:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:172
        return false;
    return true;
}
 1001577:	83 c4 1c             	add    esp,0x1c
 100157a:	c3                   	ret    

0100157b <kUnMapPage>:
kUnMapPage():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:175

void kUnMapPage(uintptr_t mapTo, uint8_t newFlags)
{
 100157b:	57                   	push   edi
 100157c:	56                   	push   esi
 100157d:	53                   	push   ebx
 100157e:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
 1001582:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:180
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)kKernelPageDir;
    ptrVal=ptr[(mapTo>>22)];
 1001586:	89 cb                	mov    ebx,ecx
 1001588:	c1 eb 16             	shr    ebx,0x16
 100158b:	a1 a4 02 12 00       	mov    eax,ds:0x1202a4
 1001590:	8d 1c 98             	lea    ebx,[eax+ebx*4]
 1001593:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:181
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
 1001595:	85 c0                	test   eax,eax
 1001597:	75 4e                	jne    10015e7 <kUnMapPage+0x6c>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:181 (discriminator 1)
 1001599:	bf 00 00 00 00       	mov    edi,0x0
 100159e:	3b 3d 4c 00 12 00    	cmp    edi,DWORD PTR ds:0x12004c
 10015a4:	72 08                	jb     10015ae <kUnMapPage+0x33>
 10015a6:	3b 0d 48 00 12 00    	cmp    ecx,DWORD PTR ds:0x120048
 10015ac:	73 39                	jae    10015e7 <kUnMapPage+0x6c>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:184
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
 10015ae:	c7 03 63 00 00 20    	mov    DWORD PTR [ebx],0x20000063
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:185
        ptrT[(mapTo&0x003FFFFF/4096)]=0 | newFlags;
 10015b4:	89 c8                	mov    eax,ecx
 10015b6:	25 ff 03 00 00       	and    eax,0x3ff
 10015bb:	8d 34 85 00 00 00 20 	lea    esi,[eax*4+0x20000000]
 10015c2:	0f b6 d2             	movzx  edx,dl
 10015c5:	89 14 85 00 00 00 20 	mov    DWORD PTR [eax*4+0x20000000],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:187
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10015cc:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10015d3:	74 43                	je     1001618 <kUnMapPage+0x9d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:188
            printk("kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)]);
 10015d5:	56                   	push   esi
 10015d6:	53                   	push   ebx
 10015d7:	51                   	push   ecx
 10015d8:	68 f8 7c 00 01       	push   0x1007cf8
 10015dd:	e8 95 0f 00 00       	call   1002577 <printk>
 10015e2:	83 c4 10             	add    esp,0x10
 10015e5:	eb 31                	jmp    1001618 <kUnMapPage+0x9d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:200
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=0 | newFlags;
 10015e7:	25 00 f0 ff ff       	and    eax,0xfffff000
 10015ec:	89 c6                	mov    esi,eax
 10015ee:	89 c8                	mov    eax,ecx
 10015f0:	c1 e8 0a             	shr    eax,0xa
 10015f3:	25 fc 0f 00 00       	and    eax,0xffc
 10015f8:	01 f0                	add    eax,esi
 10015fa:	0f b6 d2             	movzx  edx,dl
 10015fd:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:204
//                printk("ptrT=%X(%X)\n",&ptrT[ptrVal],ptrT[ptrVal]);
//                STOPHERE2
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10015ff:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001606:	74 10                	je     1001618 <kUnMapPage+0x9d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:205
            printk("2) Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal]);
 1001608:	50                   	push   eax
 1001609:	53                   	push   ebx
 100160a:	51                   	push   ecx
 100160b:	68 30 7d 00 01       	push   0x1007d30
 1001610:	e8 62 0f 00 00       	call   1002577 <printk>
 1001615:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:209
#endif
    }
//    if (ptrT[(src&0x003FFFFF/1000)]==0)
}
 1001618:	5b                   	pop    ebx
 1001619:	5e                   	pop    esi
 100161a:	5f                   	pop    edi
 100161b:	c3                   	ret    

0100161c <kSetPhysicalRangeRO>:
kSetPhysicalRangeRO():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:212

void kSetPhysicalRangeRO(uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 100161c:	55                   	push   ebp
 100161d:	57                   	push   edi
 100161e:	56                   	push   esi
 100161f:	53                   	push   ebx
 1001620:	83 ec 0c             	sub    esp,0xc
 1001623:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 1001627:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
 100162b:	8b 5c 24 28          	mov    ebx,DWORD PTR [esp+0x28]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:214
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 100162f:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001636:	74 22                	je     100165a <kSetPhysicalRangeRO+0x3e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:215
            printk("kMakePhysicalRangeRO: Make 0x%08X(0x%08X)-0x%08X(0x%08X) r/o\n", startAddy, startAddy&0xFffff000, endAddy, endAddy&0xFFFFF000);
 1001638:	83 ec 0c             	sub    esp,0xc
 100163b:	89 f0                	mov    eax,esi
 100163d:	25 00 f0 ff ff       	and    eax,0xfffff000
 1001642:	50                   	push   eax
 1001643:	56                   	push   esi
 1001644:	89 e8                	mov    eax,ebp
 1001646:	25 00 f0 ff ff       	and    eax,0xfffff000
 100164b:	50                   	push   eax
 100164c:	55                   	push   ebp
 100164d:	68 60 7d 00 01       	push   0x1007d60
 1001652:	e8 20 0f 00 00       	call   1002577 <printk>
 1001657:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:217
#endif
    kSetVirtualRangeRO((startAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, (endAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, readOnly);
 100165a:	83 ec 04             	sub    esp,0x4
 100165d:	0f b6 fb             	movzx  edi,bl
 1001660:	57                   	push   edi
 1001661:	81 ee 00 00 00 40    	sub    esi,0x40000000
 1001667:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 100166d:	56                   	push   esi
 100166e:	8d 9d 00 00 00 c0    	lea    ebx,[ebp-0x40000000]
 1001674:	81 e3 00 f0 ff ff    	and    ebx,0xfffff000
 100167a:	53                   	push   ebx
 100167b:	e8 f3 fc ff ff       	call   1001373 <kSetVirtualRangeRO>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:218
}
 1001680:	83 c4 1c             	add    esp,0x1c
 1001683:	5b                   	pop    ebx
 1001684:	5e                   	pop    esi
 1001685:	5f                   	pop    edi
 1001686:	5d                   	pop    ebp
 1001687:	c3                   	ret    

01001688 <mmKernelSetPageInUseFlag>:
mmKernelSetPageInUseFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:221

void mmKernelSetPageInUseFlag(uintptr_t address, bool inUse)
{
 1001688:	56                   	push   esi
 1001689:	53                   	push   ebx
 100168a:	83 ec 04             	sub    esp,0x4
 100168d:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1001691:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:224
    uintptr_t* ptEntry;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001695:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100169c:	74 22                	je     10016c0 <mmKernelSetPageInUseFlag+0x38>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:225
           printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 100169e:	89 f0                	mov    eax,esi
 10016a0:	84 c0                	test   al,al
 10016a2:	ba 60 74 00 01       	mov    edx,0x1007460
 10016a7:	b8 64 74 00 01       	mov    eax,0x1007464
 10016ac:	0f 44 c2             	cmove  eax,edx
 10016af:	50                   	push   eax
 10016b0:	53                   	push   ebx
 10016b1:	68 a0 7d 00 01       	push   0x1007da0
 10016b6:	6a 40                	push   0x40
 10016b8:	e8 d2 0e 00 00       	call   100258f <printd>
 10016bd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:227
#endif
        ptEntry=(uintptr_t*)kPagingGet4kPTEntryAddress(address);
 10016c0:	83 ec 0c             	sub    esp,0xc
 10016c3:	53                   	push   ebx
 10016c4:	e8 9f fb ff ff       	call   1001268 <kPagingGet4kPTEntryAddress>
 10016c9:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:228
        printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 10016cb:	ff 30                	push   DWORD PTR [eax]
 10016cd:	50                   	push   eax
 10016ce:	68 e4 7d 00 01       	push   0x1007de4
 10016d3:	6a 40                	push   0x40
 10016d5:	e8 b5 0e 00 00       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:229
        if (inUse)
 10016da:	83 c4 20             	add    esp,0x20
 10016dd:	89 f0                	mov    eax,esi
 10016df:	84 c0                	test   al,al
 10016e1:	74 08                	je     10016eb <mmKernelSetPageInUseFlag+0x63>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:230
            *ptEntry|=PAGING_IN_USE_FLAG_MASK;
 10016e3:	81 0b 00 08 00 00    	or     DWORD PTR [ebx],0x800
 10016e9:	eb 06                	jmp    10016f1 <mmKernelSetPageInUseFlag+0x69>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:232
        else
            *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
 10016eb:	81 23 ff f7 ff ff    	and    DWORD PTR [ebx],0xfffff7ff
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:233
}
 10016f1:	83 c4 04             	add    esp,0x4
 10016f4:	5b                   	pop    ebx
 10016f5:	5e                   	pop    esi
 10016f6:	c3                   	ret    

010016f7 <mmKernelSetPageRangeInUseFlag>:
mmKernelSetPageRangeInUseFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:236

void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
 10016f7:	55                   	push   ebp
 10016f8:	57                   	push   edi
 10016f9:	56                   	push   esi
 10016fa:	53                   	push   ebx
 10016fb:	83 ec 0c             	sub    esp,0xc
 10016fe:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
 1001702:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
 1001706:	8b 6c 24 28          	mov    ebp,DWORD PTR [esp+0x28]
 100170a:	0f b6 44 24 2c       	movzx  eax,BYTE PTR [esp+0x2c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:237
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 100170f:	39 fb                	cmp    ebx,edi
 1001711:	73 16                	jae    1001729 <mmKernelSetPageRangeInUseFlag+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:238 (discriminator 3)
        mmKernelSetPageInUseFlag(cnt,inUse);
 1001713:	0f b6 f0             	movzx  esi,al
 1001716:	83 ec 08             	sub    esp,0x8
 1001719:	56                   	push   esi
 100171a:	53                   	push   ebx
 100171b:	e8 68 ff ff ff       	call   1001688 <mmKernelSetPageInUseFlag>
 1001720:	01 eb                	add    ebx,ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:237 (discriminator 3)
            *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
}

void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 1001722:	83 c4 10             	add    esp,0x10
 1001725:	39 fb                	cmp    ebx,edi
 1001727:	72 ed                	jb     1001716 <mmKernelSetPageRangeInUseFlag+0x1f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:239
        mmKernelSetPageInUseFlag(cnt,inUse);
}
 1001729:	83 c4 0c             	add    esp,0xc
 100172c:	5b                   	pop    ebx
 100172d:	5e                   	pop    esi
 100172e:	5f                   	pop    edi
 100172f:	5d                   	pop    ebp
 1001730:	c3                   	ret    

01001731 <mmUnusePageRange>:
mmUnusePageRange():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:242

void mmUnusePageRange()
{
 1001731:	f3 c3                	repz ret 
 1001733:	90                   	nop

01001734 <reverse>:
reverse():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:29
//#include <string.h>

/* reverse:  reverse string s in place */
extern int strlen(char*);
 void reverse(char s[])
 {
 1001734:	56                   	push   esi
 1001735:	53                   	push   ebx
 1001736:	83 ec 10             	sub    esp,0x10
 1001739:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:33
     int i, j;
     char c;

     for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
 100173d:	53                   	push   ebx
 100173e:	e8 e1 0e 00 00       	call   1002624 <strlen>
 1001743:	83 e8 01             	sub    eax,0x1
 1001746:	83 c4 10             	add    esp,0x10
 1001749:	85 c0                	test   eax,eax
 100174b:	7e 1f                	jle    100176c <reverse+0x38>
 100174d:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:34 (discriminator 3)
         c = s[i];
 1001752:	0f b6 34 13          	movzx  esi,BYTE PTR [ebx+edx*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:35 (discriminator 3)
         s[i] = s[j];
 1001756:	0f b6 0c 03          	movzx  ecx,BYTE PTR [ebx+eax*1]
 100175a:	88 0c 13             	mov    BYTE PTR [ebx+edx*1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:36 (discriminator 3)
         s[j] = c;
 100175d:	89 f1                	mov    ecx,esi
 100175f:	88 0c 03             	mov    BYTE PTR [ebx+eax*1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:33 (discriminator 3)
 void reverse(char s[])
 {
     int i, j;
     char c;

     for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
 1001762:	83 c2 01             	add    edx,0x1
 1001765:	83 e8 01             	sub    eax,0x1
 1001768:	39 c2                	cmp    edx,eax
 100176a:	7c e6                	jl     1001752 <reverse+0x1e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:38
         c = s[i];
         s[i] = s[j];
         s[j] = c;
     }
 }
 100176c:	83 c4 04             	add    esp,0x4
 100176f:	5b                   	pop    ebx
 1001770:	5e                   	pop    esi
 1001771:	c3                   	ret    

01001772 <itoa>:
itoa():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:40
 void itoa(int n, char s[])
 {
 1001772:	55                   	push   ebp
 1001773:	57                   	push   edi
 1001774:	56                   	push   esi
 1001775:	53                   	push   ebx
 1001776:	83 ec 1c             	sub    esp,0x1c
 1001779:	8b 7c 24 34          	mov    edi,DWORD PTR [esp+0x34]
 100177d:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
 1001781:	c1 f8 1f             	sar    eax,0x1f
 1001784:	89 c1                	mov    ecx,eax
 1001786:	33 4c 24 30          	xor    ecx,DWORD PTR [esp+0x30]
 100178a:	29 c1                	sub    ecx,eax
 100178c:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:47

     if ((sign = n) < 0)  /* record sign */
         n = -n;          /* make n positive */
     i = 0;
     do {       /* generate digits in reverse order */
         s[i++] = n % 10 + '0';   /* get next digit */
 1001791:	bd 67 66 66 66       	mov    ebp,0x66666667
 1001796:	eb 02                	jmp    100179a <itoa+0x28>
 1001798:	89 de                	mov    esi,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:47 (discriminator 1)
 100179a:	8d 5e 01             	lea    ebx,[esi+0x1]
 100179d:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
 10017a1:	89 c8                	mov    eax,ecx
 10017a3:	f7 ed                	imul   ebp
 10017a5:	c1 fa 02             	sar    edx,0x2
 10017a8:	89 c8                	mov    eax,ecx
 10017aa:	c1 f8 1f             	sar    eax,0x1f
 10017ad:	29 c2                	sub    edx,eax
 10017af:	8d 04 92             	lea    eax,[edx+edx*4]
 10017b2:	01 c0                	add    eax,eax
 10017b4:	29 c1                	sub    ecx,eax
 10017b6:	83 c1 30             	add    ecx,0x30
 10017b9:	88 4c 1f ff          	mov    BYTE PTR [edi+ebx*1-0x1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:48 (discriminator 1)
     } while ((n /= 10) > 0);     /* delete it */
 10017bd:	89 d1                	mov    ecx,edx
 10017bf:	85 d2                	test   edx,edx
 10017c1:	7f d5                	jg     1001798 <itoa+0x26>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:49
     if (sign < 0)
 10017c3:	83 7c 24 30 00       	cmp    DWORD PTR [esp+0x30],0x0
 10017c8:	79 0b                	jns    10017d5 <itoa+0x63>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:50
         s[i++] = '-';
 10017ca:	8d 5e 02             	lea    ebx,[esi+0x2]
 10017cd:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10017d1:	c6 04 07 2d          	mov    BYTE PTR [edi+eax*1],0x2d
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:51
     s[i] = '\0';
 10017d5:	c6 04 1f 00          	mov    BYTE PTR [edi+ebx*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:52
     reverse(s);
 10017d9:	83 ec 0c             	sub    esp,0xc
 10017dc:	57                   	push   edi
 10017dd:	e8 52 ff ff ff       	call   1001734 <reverse>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:53
 }
 10017e2:	83 c4 2c             	add    esp,0x2c
 10017e5:	5b                   	pop    ebx
 10017e6:	5e                   	pop    esi
 10017e7:	5f                   	pop    edi
 10017e8:	5d                   	pop    ebp
 10017e9:	c3                   	ret    

010017ea <itox>:
itox():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:55
void itox(unsigned int i, char *s)
{
 10017ea:	53                   	push   ebx
 10017eb:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 10017ef:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:58
    unsigned char n;

    s += 4;
 10017f3:	8d 43 04             	lea    eax,[ebx+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:59
    *s = '\0';
 10017f6:	c6 43 04 00          	mov    BYTE PTR [ebx+0x4],0x0
 10017fa:	83 eb 04             	sub    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:62 (discriminator 3)

    for (n = 8; n != 0; --n) {
        *--s = "0123456789ABCDEF"[i & 0x0F];
 10017fd:	83 e8 01             	sub    eax,0x1
 1001800:	89 d1                	mov    ecx,edx
 1001802:	83 e1 0f             	and    ecx,0xf
 1001805:	0f b6 89 6b 74 00 01 	movzx  ecx,BYTE PTR [ecx+0x100746b]
 100180c:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:63 (discriminator 3)
        i >>= 4;
 100180e:	c1 ea 04             	shr    edx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:61 (discriminator 3)
    unsigned char n;

    s += 4;
    *s = '\0';

    for (n = 8; n != 0; --n) {
 1001811:	39 c3                	cmp    ebx,eax
 1001813:	75 e8                	jne    10017fd <itox+0x13>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:65
        *--s = "0123456789ABCDEF"[i & 0x0F];
        i >>= 4;
    }
}
 1001815:	5b                   	pop    ebx
 1001816:	c3                   	ret    

01001817 <atoi>:
atoi():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:68
// A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
int atoi(char *str)
{
 1001817:	8b 4c 24 04          	mov    ecx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:73
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
 100181b:	0f b6 11             	movzx  edx,BYTE PTR [ecx]
 100181e:	84 d2                	test   dl,dl
 1001820:	74 1f                	je     1001841 <atoi+0x2a>
 1001822:	83 c1 01             	add    ecx,0x1
 1001825:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:74 (discriminator 3)
        res = res*10 + str[i] - '0';
 100182a:	8d 04 80             	lea    eax,[eax+eax*4]
 100182d:	0f be d2             	movsx  edx,dl
 1001830:	8d 44 42 d0          	lea    eax,[edx+eax*2-0x30]
 1001834:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:73 (discriminator 3)
{
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
 1001837:	0f b6 51 ff          	movzx  edx,BYTE PTR [ecx-0x1]
 100183b:	84 d2                	test   dl,dl
 100183d:	75 eb                	jne    100182a <atoi+0x13>
 100183f:	f3 c3                	repz ret 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:69
    }
}
// A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
int atoi(char *str)
{
    int res = 0; // Initialize result
 1001841:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:78
    for (int i = 0; str[i] != '\0'; ++i)
        res = res*10 + str[i] - '0';
  
    // return result.
    return res;
}
 1001846:	c3                   	ret    

01001847 <convert>:
convert():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:81

int convert(int s)
{
 1001847:	83 ec 10             	sub    esp,0x10
 100184a:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:83
  int c;
  char hex[] = {'A', 'B', 'C', 'D', 'E', 'F'};
 100184e:	c6 44 24 0a 41       	mov    BYTE PTR [esp+0xa],0x41
 1001853:	c6 44 24 0b 42       	mov    BYTE PTR [esp+0xb],0x42
 1001858:	c6 44 24 0c 43       	mov    BYTE PTR [esp+0xc],0x43
 100185d:	c6 44 24 0d 44       	mov    BYTE PTR [esp+0xd],0x44
 1001862:	c6 44 24 0e 45       	mov    BYTE PTR [esp+0xe],0x45
 1001867:	c6 44 24 0f 46       	mov    BYTE PTR [esp+0xf],0x46
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:84
  c = (s >= 0 && s < 9) ? s + '0' : hex[s - 10];
 100186c:	83 f8 08             	cmp    eax,0x8
 100186f:	77 05                	ja     1001876 <convert+0x2f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:84 (discriminator 1)
 1001871:	83 c0 30             	add    eax,0x30
 1001874:	eb 04                	jmp    100187a <convert+0x33>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:84 (discriminator 2)
 1001876:	0f be 04 04          	movsx  eax,BYTE PTR [esp+eax*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:86 (discriminator 4)
  return c;
}
 100187a:	83 c4 10             	add    esp,0x10
 100187d:	c3                   	ret    

0100187e <itoha>:
itoha():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:89

void itoha(unsigned int n, char *buf)
{
 100187e:	55                   	push   ebp
 100187f:	57                   	push   edi
 1001880:	56                   	push   esi
 1001881:	53                   	push   ebx
 1001882:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 1001886:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:92
  int i = 0, j =0;
  j=7;
  while(n != 0)
 100188a:	85 db                	test   ebx,ebx
 100188c:	74 25                	je     10018b3 <itoha+0x35>
 100188e:	be 07 00 00 00       	mov    esi,0x7
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:94
  {
    i = n % 16;
 1001893:	89 dd                	mov    ebp,ebx
 1001895:	83 e5 0f             	and    ebp,0xf
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:95
      buf[j--] = convert(i);
 1001898:	83 ee 01             	sub    esi,0x1
 100189b:	55                   	push   ebp
 100189c:	e8 a6 ff ff ff       	call   1001847 <convert>
 10018a1:	83 c4 04             	add    esp,0x4
 10018a4:	88 44 37 01          	mov    BYTE PTR [edi+esi*1+0x1],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:96
      n = (n - i) / 16;
 10018a8:	29 eb                	sub    ebx,ebp
 10018aa:	c1 eb 04             	shr    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:92

void itoha(unsigned int n, char *buf)
{
  int i = 0, j =0;
  j=7;
  while(n != 0)
 10018ad:	85 db                	test   ebx,ebx
 10018af:	75 e2                	jne    1001893 <itoha+0x15>
 10018b1:	eb 05                	jmp    10018b8 <itoha+0x3a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:91
}

void itoha(unsigned int n, char *buf)
{
  int i = 0, j =0;
  j=7;
 10018b3:	be 07 00 00 00       	mov    esi,0x7
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:98
  {
    i = n % 16;
      buf[j--] = convert(i);
      n = (n - i) / 16;
  }
  buf[j] = '\0';
 10018b8:	c6 04 37 00          	mov    BYTE PTR [edi+esi*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:99
}
 10018bc:	5b                   	pop    ebx
 10018bd:	5e                   	pop    esi
 10018be:	5f                   	pop    edi
 10018bf:	5d                   	pop    ebp
 10018c0:	c3                   	ret    

010018c1 <identify_data_sizes>:
identify_data_sizes():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:102

void identify_data_sizes(sizeof_t* sizes)
{
 10018c1:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:103
    sizes->shortSize = sizeof(short);
 10018c5:	66 c7 00 02 00       	mov    WORD PTR [eax],0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:104
    sizes->intSize = sizeof(int);
 10018ca:	66 c7 40 02 04 00    	mov    WORD PTR [eax+0x2],0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:105
    sizes->longSize = sizeof(long);
 10018d0:	66 c7 40 04 04 00    	mov    WORD PTR [eax+0x4],0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:106
    sizes->longLongSize = sizeof(long long);
 10018d6:	66 c7 40 06 08 00    	mov    WORD PTR [eax+0x6],0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:107
    sizes->longLongIntSize = sizeof(long long int);
 10018dc:	66 c7 40 08 08 00    	mov    WORD PTR [eax+0x8],0x8
 10018e2:	c3                   	ret    

010018e3 <memset>:
memset():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:111
}

void *memset(void *d1, int val, size_t len)
{
 10018e3:	56                   	push   esi
 10018e4:	53                   	push   ebx
 10018e5:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10018e9:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 10018ed:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:114
    uint8_t *d = d1;
    uint16_t*e = d1;
    uint16_t eVal=(val << 16) | (val << 8) | val;
 10018f1:	89 f1                	mov    ecx,esi
 10018f3:	c1 e1 08             	shl    ecx,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:118
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
 10018f6:	f6 c2 03             	test   dl,0x3
 10018f9:	75 16                	jne    1001911 <memset+0x2e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:119
    while (len-=4) {
 10018fb:	83 ea 04             	sub    edx,0x4
 10018fe:	74 43                	je     1001943 <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:120
        *d++ = fVal;
 1001900:	89 f3                	mov    ebx,esi
 1001902:	89 c1                	mov    ecx,eax
 1001904:	83 c1 01             	add    ecx,0x1
 1001907:	88 59 ff             	mov    BYTE PTR [ecx-0x1],bl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:119
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
 100190a:	83 ea 04             	sub    edx,0x4
 100190d:	75 f5                	jne    1001904 <memset+0x21>
 100190f:	eb 32                	jmp    1001943 <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:122
        *d++ = fVal;
    }
    else if (((len%2)==0))
 1001911:	f6 c2 01             	test   dl,0x1
 1001914:	74 0b                	je     1001921 <memset+0x3e>
 1001916:	8d 1c 10             	lea    ebx,[eax+edx*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:127
    while (len-=2) {
        *d++ = eVal;
    }
    else
    while (len--) {
 1001919:	89 c1                	mov    ecx,eax
 100191b:	85 d2                	test   edx,edx
 100191d:	75 18                	jne    1001937 <memset+0x54>
 100191f:	eb 22                	jmp    1001943 <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:123
    if ((len%4)==0)
    while (len-=4) {
        *d++ = fVal;
    }
    else if (((len%2)==0))
    while (len-=2) {
 1001921:	83 ea 02             	sub    edx,0x2
 1001924:	74 1d                	je     1001943 <memset+0x60>
 1001926:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:124
        *d++ = eVal;
 1001928:	09 f1                	or     ecx,esi
 100192a:	83 c3 01             	add    ebx,0x1
 100192d:	88 4b ff             	mov    BYTE PTR [ebx-0x1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:123
    if ((len%4)==0)
    while (len-=4) {
        *d++ = fVal;
    }
    else if (((len%2)==0))
    while (len-=2) {
 1001930:	83 ea 02             	sub    edx,0x2
 1001933:	75 f5                	jne    100192a <memset+0x47>
 1001935:	eb 0c                	jmp    1001943 <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:128
        *d++ = eVal;
    }
    else
    while (len--) {
        *d++ = val;
 1001937:	83 c1 01             	add    ecx,0x1
 100193a:	89 f2                	mov    edx,esi
 100193c:	88 51 ff             	mov    BYTE PTR [ecx-0x1],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:127
    else if (((len%2)==0))
    while (len-=2) {
        *d++ = eVal;
    }
    else
    while (len--) {
 100193f:	39 cb                	cmp    ebx,ecx
 1001941:	75 f4                	jne    1001937 <memset+0x54>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:131
        *d++ = val;
    }
    return d1;
}
 1001943:	5b                   	pop    ebx
 1001944:	5e                   	pop    esi
 1001945:	c3                   	ret    

01001946 <bcdToDec>:
bcdToDec():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:134

uint8_t bcdToDec(uint8_t val)
{
 1001946:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:135
  return ( (val/16*10) + (val%16) );
 100194a:	89 c2                	mov    edx,eax
 100194c:	c0 ea 04             	shr    dl,0x4
 100194f:	8d 14 92             	lea    edx,[edx+edx*4]
 1001952:	83 e0 0f             	and    eax,0xf
 1001955:	8d 04 50             	lea    eax,[eax+edx*2]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:136
}
 1001958:	c3                   	ret    

01001959 <decToBcd>:
decToBcd():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:139

uint8_t decToBcd(uint8_t val)
{
 1001959:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:140
  return ( (val/10*16) + (val%10) );
 100195d:	0f b6 c8             	movzx  ecx,al
 1001960:	8d 14 89             	lea    edx,[ecx+ecx*4]
 1001963:	8d 14 d1             	lea    edx,[ecx+edx*8]
 1001966:	8d 14 92             	lea    edx,[edx+edx*4]
 1001969:	66 c1 ea 0b          	shr    dx,0xb
 100196d:	89 d1                	mov    ecx,edx
 100196f:	c1 e1 04             	shl    ecx,0x4
 1001972:	8d 14 92             	lea    edx,[edx+edx*4]
 1001975:	01 d2                	add    edx,edx
 1001977:	29 d0                	sub    eax,edx
 1001979:	01 c8                	add    eax,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:141
}
 100197b:	c3                   	ret    

0100197c <initSystemDate>:
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:143
void initSystemDate()
{
 100197c:	83 ec 3c             	sub    esp,0x3c
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 100197f:	b8 00 00 00 00       	mov    eax,0x0
 1001984:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1001986:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:147
    struct tm tmbuf;

    outb(0x70, 0x00);
    tmbuf.tm_sec = bcdToDec(inb(0x71));
 1001988:	0f b6 c0             	movzx  eax,al
 100198b:	50                   	push   eax
 100198c:	e8 b5 ff ff ff       	call   1001946 <bcdToDec>
 1001991:	0f b6 c0             	movzx  eax,al
 1001994:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001998:	b8 02 00 00 00       	mov    eax,0x2
 100199d:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100199f:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:149
    outb(0x70, 0x02);
    tmbuf.tm_min = bcdToDec(inb(0x71));
 10019a1:	0f b6 c0             	movzx  eax,al
 10019a4:	89 04 24             	mov    DWORD PTR [esp],eax
 10019a7:	e8 9a ff ff ff       	call   1001946 <bcdToDec>
 10019ac:	0f b6 c0             	movzx  eax,al
 10019af:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10019b3:	b8 04 00 00 00       	mov    eax,0x4
 10019b8:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019ba:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:151
    outb(0x70, 0x04);
    tmbuf.tm_hour = bcdToDec(inb(0x71));
 10019bc:	0f b6 c0             	movzx  eax,al
 10019bf:	89 04 24             	mov    DWORD PTR [esp],eax
 10019c2:	e8 7f ff ff ff       	call   1001946 <bcdToDec>
 10019c7:	0f b6 c0             	movzx  eax,al
 10019ca:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10019ce:	b8 07 00 00 00       	mov    eax,0x7
 10019d3:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019d5:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:153
    outb(0x70, 0x07);
    tmbuf.tm_mday = bcdToDec(inb(0x71));
 10019d7:	0f b6 c0             	movzx  eax,al
 10019da:	89 04 24             	mov    DWORD PTR [esp],eax
 10019dd:	e8 64 ff ff ff       	call   1001946 <bcdToDec>
 10019e2:	0f b6 c0             	movzx  eax,al
 10019e5:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10019e9:	b8 08 00 00 00       	mov    eax,0x8
 10019ee:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019f0:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:155
    outb(0x70, 0x08);
    tmbuf.tm_mon = bcdToDec(inb(0x71));
 10019f2:	0f b6 c0             	movzx  eax,al
 10019f5:	89 04 24             	mov    DWORD PTR [esp],eax
 10019f8:	e8 49 ff ff ff       	call   1001946 <bcdToDec>
 10019fd:	0f b6 c0             	movzx  eax,al
 1001a00:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001a04:	b8 09 00 00 00       	mov    eax,0x9
 1001a09:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1001a0b:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:157
    outb(0x70, 0x09);
    tmbuf.tm_year = bcdToDec(inb(0x71));
 1001a0d:	0f b6 c0             	movzx  eax,al
 1001a10:	89 04 24             	mov    DWORD PTR [esp],eax
 1001a13:	e8 2e ff ff ff       	call   1001946 <bcdToDec>
 1001a18:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:158
    tmbuf.tm_isdst = -1;
 1001a1b:	c7 44 24 30 ff ff ff 	mov    DWORD PTR [esp+0x30],0xffffffff
 1001a22:	ff 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:160
    tmbuf.tm_year += 2000;
    tmbuf.tm_year = tmbuf.tm_year - 1900;
 1001a23:	0f b6 c0             	movzx  eax,al
 1001a26:	83 c0 64             	add    eax,0x64
 1001a29:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:161
    kSystemStartTime = mktime(&tmbuf);
 1001a2d:	8d 44 24 10          	lea    eax,[esp+0x10]
 1001a31:	50                   	push   eax
 1001a32:	e8 ab 0f 00 00       	call   10029e2 <mktime>
 1001a37:	a3 88 02 12 00       	mov    ds:0x120288,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:162
    kSystemCurrentTime = kSystemStartTime;
 1001a3c:	a3 8c 02 12 00       	mov    ds:0x12028c,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:164
//printf("System Date = %d/%d/%d %d:%d:%d\n", tmbuf.tm_mon, tmbuf.tm_mday, tmbuf.tm_year, tmbuf.tm_hour, tmbuf.tm_min, tmbuf.tm_sec, tmbuf.tm_hour, tmbuf.tm_min, tmbuf.tm_sec);
}
 1001a41:	83 c4 4c             	add    esp,0x4c
 1001a44:	c3                   	ret    

01001a45 <strtoupper>:
strtoupper():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:166
char * strtoupper(char* pointerToString)
{
 1001a45:	56                   	push   esi
 1001a46:	53                   	push   ebx
 1001a47:	83 ec 10             	sub    esp,0x10
 1001a4a:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:167
    uint8_t start=0, length=strlen(pointerToString);
 1001a4e:	53                   	push   ebx
 1001a4f:	e8 d0 0b 00 00       	call   1002624 <strlen>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:171
    char* myPtr=pointerToString;
    
        // Trim.Start:
        while (start<length)
 1001a54:	83 c4 10             	add    esp,0x10
 1001a57:	84 c0                	test   al,al
 1001a59:	74 23                	je     1001a7e <strtoupper+0x39>
 1001a5b:	89 da                	mov    edx,ebx
 1001a5d:	83 e8 01             	sub    eax,0x1
 1001a60:	0f b6 c0             	movzx  eax,al
 1001a63:	8d 74 03 01          	lea    esi,[ebx+eax*1+0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:173
        {
            if (myPtr[start]>='a' && myPtr[start]<='z')
 1001a67:	0f b6 02             	movzx  eax,BYTE PTR [edx]
 1001a6a:	8d 48 9f             	lea    ecx,[eax-0x61]
 1001a6d:	80 f9 19             	cmp    cl,0x19
 1001a70:	77 05                	ja     1001a77 <strtoupper+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:174
                myPtr[start]-=32;
 1001a72:	83 e8 20             	sub    eax,0x20
 1001a75:	88 02                	mov    BYTE PTR [edx],al
 1001a77:	83 c2 01             	add    edx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:171
{
    uint8_t start=0, length=strlen(pointerToString);
    char* myPtr=pointerToString;
    
        // Trim.Start:
        while (start<length)
 1001a7a:	39 f2                	cmp    edx,esi
 1001a7c:	75 e9                	jne    1001a67 <strtoupper+0x22>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:179
                myPtr[start]-=32;
            start++;
        }

    return pointerToString;
}
 1001a7e:	89 d8                	mov    eax,ebx
 1001a80:	83 c4 04             	add    esp,0x4
 1001a83:	5b                   	pop    ebx
 1001a84:	5e                   	pop    esi
 1001a85:	c3                   	ret    

01001a86 <printDumpedRegs>:
printDumpedRegs():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:182

void printDumpedRegs()
{
 1001a86:	57                   	push   edi
 1001a87:	56                   	push   esi
 1001a88:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:183
    uint32_t esp = exceptionSavedESP;
 1001a89:	8b 35 ec 01 12 00    	mov    esi,DWORD PTR ds:0x1201ec
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:187
    uint8_t* lCSIPPtr;

    
    lCSIPPtr=(uint8_t*)(exceptionEIP);
 1001a8f:	8b 1d f8 01 12 00    	mov    ebx,DWORD PTR ds:0x1201f8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:188
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", exceptionAX, exceptionBX, exceptionCX, exceptionDX,exceptionFlags);
 1001a95:	83 ec 08             	sub    esp,0x8
 1001a98:	ff 35 f0 01 12 00    	push   DWORD PTR ds:0x1201f0
 1001a9e:	ff 35 bc 01 12 00    	push   DWORD PTR ds:0x1201bc
 1001aa4:	ff 35 b8 01 12 00    	push   DWORD PTR ds:0x1201b8
 1001aaa:	ff 35 b4 01 12 00    	push   DWORD PTR ds:0x1201b4
 1001ab0:	ff 35 b0 01 12 00    	push   DWORD PTR ds:0x1201b0
 1001ab6:	68 24 7e 00 01       	push   0x1007e24
 1001abb:	e8 b7 0a 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:189
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", exceptionBP, exceptionSI, exceptionDI, exceptionSavedESP);
 1001ac0:	83 c4 14             	add    esp,0x14
 1001ac3:	ff 35 ec 01 12 00    	push   DWORD PTR ds:0x1201ec
 1001ac9:	ff 35 c4 01 12 00    	push   DWORD PTR ds:0x1201c4
 1001acf:	ff 35 c0 01 12 00    	push   DWORD PTR ds:0x1201c0
 1001ad5:	ff 35 c8 01 12 00    	push   DWORD PTR ds:0x1201c8
 1001adb:	68 54 7e 00 01       	push   0x1007e54
 1001ae0:	e8 92 0a 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:190
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
 1001ae5:	83 c4 14             	add    esp,0x14
 1001ae8:	ff 35 d4 01 12 00    	push   DWORD PTR ds:0x1201d4
 1001aee:	ff 35 d0 01 12 00    	push   DWORD PTR ds:0x1201d0
 1001af4:	ff 35 00 02 12 00    	push   DWORD PTR ds:0x120200
 1001afa:	ff 35 cc 01 12 00    	push   DWORD PTR ds:0x1201cc
 1001b00:	68 7c 7e 00 01       	push   0x1007e7c
 1001b05:	e8 6d 0a 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:191
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionGS, exceptionFS);
 1001b0a:	83 c4 14             	add    esp,0x14
 1001b0d:	ff 35 e0 01 12 00    	push   DWORD PTR ds:0x1201e0
 1001b13:	ff 35 e4 01 12 00    	push   DWORD PTR ds:0x1201e4
 1001b19:	ff 35 dc 01 12 00    	push   DWORD PTR ds:0x1201dc
 1001b1f:	ff 35 d8 01 12 00    	push   DWORD PTR ds:0x1201d8
 1001b25:	68 a4 7e 00 01       	push   0x1007ea4
 1001b2a:	e8 48 0a 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:192
    printk("GDT=%08X\n",kernelGDT.base);
 1001b2f:	83 c4 18             	add    esp,0x18
 1001b32:	ff 35 4e 04 12 00    	push   DWORD PTR ds:0x12044e
 1001b38:	68 7c 74 00 01       	push   0x100747c
 1001b3d:	e8 35 0a 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:193
    printk("CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
 1001b42:	ff 35 f4 01 12 00    	push   DWORD PTR ds:0x1201f4
 1001b48:	ff 35 f8 01 12 00    	push   DWORD PTR ds:0x1201f8
 1001b4e:	ff 35 fc 01 12 00    	push   DWORD PTR ds:0x1201fc
 1001b54:	68 cc 7e 00 01       	push   0x1007ecc
 1001b59:	e8 19 0a 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:194
          printk("Bytes at CS:EIP: ");
 1001b5e:	83 c4 14             	add    esp,0x14
 1001b61:	68 86 74 00 01       	push   0x1007486
 1001b66:	e8 0c 0a 00 00       	call   1002577 <printk>
 1001b6b:	8d 7b 13             	lea    edi,[ebx+0x13]
 1001b6e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:196 (discriminator 3)
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
 1001b71:	83 ec 08             	sub    esp,0x8
 1001b74:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001b77:	50                   	push   eax
 1001b78:	68 18 74 00 01       	push   0x1007418
 1001b7d:	e8 f5 09 00 00       	call   1002577 <printk>
 1001b82:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:195 (discriminator 3)
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionGS, exceptionFS);
    printk("GDT=%08X\n",kernelGDT.base);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
 1001b85:	83 c4 10             	add    esp,0x10
 1001b88:	39 df                	cmp    edi,ebx
 1001b8a:	75 e5                	jne    1001b71 <printDumpedRegs+0xeb>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:197
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
 1001b8c:	83 ec 0c             	sub    esp,0xc
 1001b8f:	68 3f 77 00 01       	push   0x100773f
 1001b94:	e8 de 09 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:198
          printk ("Stack @ 0x%08x:0x%08X:\n",exceptionSS, esp);
 1001b99:	83 c4 0c             	add    esp,0xc
 1001b9c:	56                   	push   esi
 1001b9d:	ff 35 e8 01 12 00    	push   DWORD PTR ds:0x1201e8
 1001ba3:	68 98 74 00 01       	push   0x1007498
 1001ba8:	e8 ca 09 00 00       	call   1002577 <printk>
 1001bad:	83 c4 10             	add    esp,0x10
 1001bb0:	bb 00 00 00 00       	mov    ebx,0x0
 1001bb5:	8d 04 33             	lea    eax,[ebx+esi*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:201 (discriminator 3)
          for (int cnt=0;cnt<10;cnt++)
          {
              printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
 1001bb8:	83 ec 04             	sub    esp,0x4
 1001bbb:	8b 15 a8 01 12 00    	mov    edx,DWORD PTR ds:0x1201a8
 1001bc1:	ff 34 1a             	push   DWORD PTR [edx+ebx*1]
 1001bc4:	50                   	push   eax
 1001bc5:	68 b0 74 00 01       	push   0x10074b0
 1001bca:	e8 a8 09 00 00       	call   1002577 <printk>
 1001bcf:	83 c3 04             	add    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:199 (discriminator 3)
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
          printk ("Stack @ 0x%08x:0x%08X:\n",exceptionSS, esp);
          for (int cnt=0;cnt<10;cnt++)
 1001bd2:	83 c4 10             	add    esp,0x10
 1001bd5:	83 fb 28             	cmp    ebx,0x28
 1001bd8:	75 db                	jne    1001bb5 <printDumpedRegs+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:206
              printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
              esp+=4;
          }


}
 1001bda:	5b                   	pop    ebx
 1001bdb:	5e                   	pop    esi
 1001bdc:	5f                   	pop    edi
 1001bdd:	c3                   	ret    

01001bde <printDebugRegs>:
printDebugRegs():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:209

void printDebugRegs()
{
 1001bde:	57                   	push   edi
 1001bdf:	56                   	push   esi
 1001be0:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:210
    uint32_t esp = debugSavedESP;
 1001be1:	8b 35 40 02 12 00    	mov    esi,DWORD PTR ds:0x120240
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:213
    uint8_t* lCSIPPtr;

    lCSIPPtr=(uint8_t*)(debugEIP);
 1001be7:	8b 1d 50 02 12 00    	mov    ebx,DWORD PTR ds:0x120250
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:214
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", debugAX, debugBX, debugCX, debugDX,debugFlags);
 1001bed:	83 ec 08             	sub    esp,0x8
 1001bf0:	ff 35 44 02 12 00    	push   DWORD PTR ds:0x120244
 1001bf6:	ff 35 10 02 12 00    	push   DWORD PTR ds:0x120210
 1001bfc:	ff 35 0c 02 12 00    	push   DWORD PTR ds:0x12020c
 1001c02:	ff 35 08 02 12 00    	push   DWORD PTR ds:0x120208
 1001c08:	ff 35 04 02 12 00    	push   DWORD PTR ds:0x120204
 1001c0e:	68 24 7e 00 01       	push   0x1007e24
 1001c13:	e8 5f 09 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:215
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", debugBP, debugSI, debugDI, debugSavedESP);
 1001c18:	83 c4 14             	add    esp,0x14
 1001c1b:	ff 35 40 02 12 00    	push   DWORD PTR ds:0x120240
 1001c21:	ff 35 18 02 12 00    	push   DWORD PTR ds:0x120218
 1001c27:	ff 35 14 02 12 00    	push   DWORD PTR ds:0x120214
 1001c2d:	ff 35 1c 02 12 00    	push   DWORD PTR ds:0x12021c
 1001c33:	68 54 7e 00 01       	push   0x1007e54
 1001c38:	e8 3a 09 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:216
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\n", debugCR0, debugCR3, debugCR4);
 1001c3d:	83 c4 20             	add    esp,0x20
 1001c40:	ff 35 28 02 12 00    	push   DWORD PTR ds:0x120228
 1001c46:	ff 35 24 02 12 00    	push   DWORD PTR ds:0x120224
 1001c4c:	ff 35 20 02 12 00    	push   DWORD PTR ds:0x120220
 1001c52:	68 c2 74 00 01       	push   0x10074c2
 1001c57:	e8 1b 09 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:217
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", debugDS, debugES, debugGS, debugFS);
 1001c5c:	83 c4 04             	add    esp,0x4
 1001c5f:	ff 35 34 02 12 00    	push   DWORD PTR ds:0x120234
 1001c65:	ff 35 38 02 12 00    	push   DWORD PTR ds:0x120238
 1001c6b:	ff 35 30 02 12 00    	push   DWORD PTR ds:0x120230
 1001c71:	ff 35 2c 02 12 00    	push   DWORD PTR ds:0x12022c
 1001c77:	68 a4 7e 00 01       	push   0x1007ea4
 1001c7c:	e8 f6 08 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:218
    printk("CS:EIP = %04X:%08X, error code=%08X\n", debugCS, debugEIP, debugErrorCode);
 1001c81:	83 c4 20             	add    esp,0x20
 1001c84:	ff 35 48 02 12 00    	push   DWORD PTR ds:0x120248
 1001c8a:	ff 35 50 02 12 00    	push   DWORD PTR ds:0x120250
 1001c90:	ff 35 4c 02 12 00    	push   DWORD PTR ds:0x12024c
 1001c96:	68 cc 7e 00 01       	push   0x1007ecc
 1001c9b:	e8 d7 08 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:219
          printk("Bytes at CS:EIP: ");
 1001ca0:	c7 04 24 86 74 00 01 	mov    DWORD PTR [esp],0x1007486
 1001ca7:	e8 cb 08 00 00       	call   1002577 <printk>
 1001cac:	8d 7b 13             	lea    edi,[ebx+0x13]
 1001caf:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:221 (discriminator 3)
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
 1001cb2:	83 ec 08             	sub    esp,0x8
 1001cb5:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001cb8:	50                   	push   eax
 1001cb9:	68 18 74 00 01       	push   0x1007418
 1001cbe:	e8 b4 08 00 00       	call   1002577 <printk>
 1001cc3:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:220 (discriminator 3)
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", debugBP, debugSI, debugDI, debugSavedESP);
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\n", debugCR0, debugCR3, debugCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", debugDS, debugES, debugGS, debugFS);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", debugCS, debugEIP, debugErrorCode);
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
 1001cc6:	83 c4 10             	add    esp,0x10
 1001cc9:	39 df                	cmp    edi,ebx
 1001ccb:	75 e5                	jne    1001cb2 <printDebugRegs+0xd4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:222
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
 1001ccd:	83 ec 0c             	sub    esp,0xc
 1001cd0:	68 3f 77 00 01       	push   0x100773f
 1001cd5:	e8 9d 08 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:223
          printk ("Stack @ 0x%08x:0x%08X:\n",debugSS, esp);
 1001cda:	83 c4 0c             	add    esp,0xc
 1001cdd:	56                   	push   esi
 1001cde:	ff 35 3c 02 12 00    	push   DWORD PTR ds:0x12023c
 1001ce4:	68 98 74 00 01       	push   0x1007498
 1001ce9:	e8 89 08 00 00       	call   1002577 <printk>
 1001cee:	83 c4 10             	add    esp,0x10
 1001cf1:	bb 00 00 00 00       	mov    ebx,0x0
 1001cf6:	8d 04 33             	lea    eax,[ebx+esi*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:226 (discriminator 3)
          for (int cnt=0;cnt<10;cnt++)
          {
              printk("\t0x%08X%: 0x%08X\n",esp, debugSavedStack[cnt]);
 1001cf9:	83 ec 04             	sub    esp,0x4
 1001cfc:	8b 15 ac 01 12 00    	mov    edx,DWORD PTR ds:0x1201ac
 1001d02:	ff 34 1a             	push   DWORD PTR [edx+ebx*1]
 1001d05:	50                   	push   eax
 1001d06:	68 b0 74 00 01       	push   0x10074b0
 1001d0b:	e8 67 08 00 00       	call   1002577 <printk>
 1001d10:	83 c3 04             	add    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:224 (discriminator 3)
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
          printk ("Stack @ 0x%08x:0x%08X:\n",debugSS, esp);
          for (int cnt=0;cnt<10;cnt++)
 1001d13:	83 c4 10             	add    esp,0x10
 1001d16:	83 fb 28             	cmp    ebx,0x28
 1001d19:	75 db                	jne    1001cf6 <printDebugRegs+0x118>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:231
              printk("\t0x%08X%: 0x%08X\n",esp, debugSavedStack[cnt]);
              esp+=4;
          }


}
 1001d1b:	5b                   	pop    ebx
 1001d1c:	5e                   	pop    esi
 1001d1d:	5f                   	pop    edi
 1001d1e:	c3                   	ret    

01001d1f <reboot>:
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:239
/* keyboard interface IO port: data and control
   READ:   status port
   WRITE:  control register */
 
void reboot(bool waitFirst)
{
 1001d1f:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:242
    uint8_t temp;
 
    if (waitFirst)
 1001d22:	80 7c 24 10 00       	cmp    BYTE PTR [esp+0x10],0x0
 1001d27:	74 1d                	je     1001d46 <reboot+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:244
    {
        puts("Rebooting ... ");
 1001d29:	83 ec 0c             	sub    esp,0xc
 1001d2c:	68 de 74 00 01       	push   0x10074de
 1001d31:	e8 03 e7 ff ff       	call   1000439 <puts>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:245
        __asm__("sti\n");
 1001d36:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:246
        wait(3000);
 1001d37:	c7 04 24 b8 0b 00 00 	mov    DWORD PTR [esp],0xbb8
 1001d3e:	e8 dd 11 00 00       	call   1002f20 <wait>
 1001d43:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:248
    }
    __asm__ volatile ("cli"); /* disable all interrupts */
 1001d46:	fa                   	cli    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1001d47:	e4 64                	in     al,0x64
 1001d49:	89 c2                	mov    edx,eax
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:254
 
    /* Clear all keyboard buffers (output and command buffers) */
    do
    {
        temp = inb(KBRD_INTRFC); /* empty user data */
        if (check_flag(temp, KBRD_BIT_KDATA) != 0)
 1001d4b:	a8 01                	test   al,0x1
 1001d4d:	74 02                	je     1001d51 <reboot+0x32>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1001d4f:	e4 60                	in     al,0x60
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:256
            inb(KBRD_IO); /* empty keyboard data */
    } while (check_flag(temp, KBRD_BIT_UDATA) != 0);
 1001d51:	f6 c2 02             	test   dl,0x2
 1001d54:	75 f1                	jne    1001d47 <reboot+0x28>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001d56:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 1001d5b:	e6 64                	out    0x64,al
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:260 (discriminator 1)
 
    outb(KBRD_INTRFC, KBRD_RESET); /* pulse CPU reset line */
loop:
    __asm__ volatile ("hlt"); /* if that didn't work, halt the CPU */
 1001d5d:	f4                   	hlt    
 1001d5e:	eb fd                	jmp    1001d5d <reboot+0x3e>

01001d60 <dumpKernelAddresses>:
dumpKernelAddresses():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:265
    goto loop; /* if a NMI is received, halt again */
}

void dumpKernelAddresses()
{
 1001d60:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:266
printk("Kernel Variable List:\n");
 1001d63:	68 ed 74 00 01       	push   0x10074ed
 1001d68:	e8 0a 08 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:267
printk("\tKERNEL_OBJECT_BASE_ADDRESS=0x%08x\n",KERNEL_OBJECT_BASE_ADDRESS);
 1001d6d:	83 c4 08             	add    esp,0x8
 1001d70:	68 00 00 15 00       	push   0x150000
 1001d75:	68 f4 7e 00 01       	push   0x1007ef4
 1001d7a:	e8 f8 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:268
printk("\tE820_TABLE_ADDRESS=0x%08x (0x%08X)\n",E820_TABLE_ADDRESS);
 1001d7f:	83 c4 08             	add    esp,0x8
 1001d82:	68 00 00 15 00       	push   0x150000
 1001d87:	68 18 7f 00 01       	push   0x1007f18
 1001d8c:	e8 e6 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:269
printk("\tMP_CONFIG_TABLE_ADDRESS=0x%08x\n",MP_CONFIG_TABLE_ADDRESS);
 1001d91:	83 c4 08             	add    esp,0x8
 1001d94:	68 b0 04 15 00       	push   0x1504b0
 1001d99:	68 40 7f 00 01       	push   0x1007f40
 1001d9e:	e8 d4 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:270
printk("\tKEYBOARD_BUFFER_ADDRESS=0x%08x\n",KEYBOARD_BUFFER_ADDRESS);
 1001da3:	83 c4 08             	add    esp,0x8
 1001da6:	68 b0 24 15 00       	push   0x1524b0
 1001dab:	68 64 7f 00 01       	push   0x1007f64
 1001db0:	e8 c2 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:271
printk("\tIDT_TABLE_ADDRESS=0x%08x\n",IDT_TABLE_ADDRESS);
 1001db5:	83 c4 08             	add    esp,0x8
 1001db8:	68 00 30 15 00       	push   0x153000
 1001dbd:	68 04 75 00 01       	push   0x1007504
 1001dc2:	e8 b0 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:272
printk("\tINIT_GDT_TABLE_ADDRESS=0x%08x\n",INIT_GDT_TABLE_ADDRESS);
 1001dc7:	83 c4 08             	add    esp,0x8
 1001dca:	68 00 40 15 00       	push   0x154000
 1001dcf:	68 88 7f 00 01       	push   0x1007f88
 1001dd4:	e8 9e 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:273
printk("\tTASK_TABLE_ADDRESS=0x%08x\n",TASK_TABLE_ADDRESS);
 1001dd9:	83 c4 08             	add    esp,0x8
 1001ddc:	68 00 50 15 00       	push   0x155000
 1001de1:	68 1f 75 00 01       	push   0x100751f
 1001de6:	e8 8c 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:274
printk("\tTSS_TABLE_ADDRESS=0x%08x\n",TSS_TABLE_ADDRESS);
 1001deb:	83 c4 08             	add    esp,0x8
 1001dee:	68 00 60 2e 00       	push   0x2e6000
 1001df3:	68 3b 75 00 01       	push   0x100753b
 1001df8:	e8 7a 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:275
printk("\tATA_MBR_ARRAY_ADDRESS=0x%08x\n",ATA_MBR_ARRAY_ADDRESS);
 1001dfd:	83 c4 08             	add    esp,0x8
 1001e00:	68 00 60 48 00       	push   0x486000
 1001e05:	68 a8 7f 00 01       	push   0x1007fa8
 1001e0a:	e8 68 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:276
printk("\tPCI_DEVICE_LIST_ADDRESS=0x%08x\n",PCI_DEVICE_LIST_ADDRESS);
 1001e0f:	83 c4 08             	add    esp,0x8
 1001e12:	68 00 70 48 00       	push   0x487000
 1001e17:	68 c8 7f 00 01       	push   0x1007fc8
 1001e1c:	e8 56 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:277
printk("\tPCI_BRIDGE_LIST_ADDRESS=0x%08x\n",PCI_BRIDGE_LIST_ADDRESS);
 1001e21:	83 c4 08             	add    esp,0x8
 1001e24:	68 00 70 49 00       	push   0x497000
 1001e29:	68 ec 7f 00 01       	push   0x1007fec
 1001e2e:	e8 44 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:278
printk("\tPCI_FUNCTION_LIST_ADDRESS=0x%08x\n",PCI_FUNCTION_LIST_ADDRESS);
 1001e33:	83 c4 08             	add    esp,0x8
 1001e36:	68 00 70 4a 00       	push   0x4a7000
 1001e3b:	68 10 80 00 01       	push   0x1008010
 1001e40:	e8 32 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:279
printk("\tGDT_PMODE_16BIT_TABLE_ADDRESS=0x%08x\n",GDT_PMODE_16BIT_TABLE_ADDRESS);
 1001e45:	83 c4 08             	add    esp,0x8
 1001e48:	68 00 80 4a 00       	push   0x4a8000
 1001e4d:	68 34 80 00 01       	push   0x1008034
 1001e52:	e8 20 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:280
printk("\tKERNEL_PAGE_DIR_ADDRESS=0x%08x\n",KERNEL_PAGE_DIR_ADDRESS);
 1001e57:	83 c4 08             	add    esp,0x8
 1001e5a:	68 00 90 4a 00       	push   0x4a9000
 1001e5f:	68 5c 80 00 01       	push   0x100805c
 1001e64:	e8 0e 07 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:281
printk("\tKERNEL_PAGE_TABLE_BASE_ADDRESS=0x%08x\n",KERNEL_PAGE_TABLE_BASE_ADDRESS);
 1001e69:	83 c4 08             	add    esp,0x8
 1001e6c:	68 00 b0 4b 00       	push   0x4bb000
 1001e71:	68 80 80 00 01       	push   0x1008080
 1001e76:	e8 fc 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:282
printk("\tSAVED_STACK_FOR_EXCEPTIONS_ADDRESS=0x%08x\n",SAVED_STACK_FOR_EXCEPTIONS_ADDRESS);
 1001e7b:	83 c4 08             	add    esp,0x8
 1001e7e:	68 00 c0 8b 00       	push   0x8bc000
 1001e83:	68 a8 80 00 01       	push   0x10080a8
 1001e88:	e8 ea 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:283
printk("\tSAVED_STACK_FOR_DEBUGGING_ADDRESS=0x%08x\n",SAVED_STACK_FOR_DEBUGGING_ADDRESS);
 1001e8d:	83 c4 08             	add    esp,0x8
 1001e90:	68 00 e0 8b 00       	push   0x8be000
 1001e95:	68 d4 80 00 01       	push   0x10080d4
 1001e9a:	e8 d8 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:284
printk("\tCPU_APIC_REGISTER_REMAP_BASE_ADDRESS=0x%08x\n",CPU_APIC_REGISTER_REMAP_BASE_ADDRESS);
 1001e9f:	83 c4 08             	add    esp,0x8
 1001ea2:	68 00 00 8c 00       	push   0x8c0000
 1001ea7:	68 00 81 00 01       	push   0x1008100
 1001eac:	e8 c6 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:285
printk("\tCPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS=0x%08x\n",CPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS);
 1001eb1:	83 c4 08             	add    esp,0x8
 1001eb4:	68 00 10 8c 00       	push   0x8c1000
 1001eb9:	68 30 81 00 01       	push   0x1008130
 1001ebe:	e8 b4 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:286
printk("\tKERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS=0x%08x\n",KERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS);
 1001ec3:	83 c4 08             	add    esp,0x8
 1001ec6:	68 04 10 8c 00       	push   0x8c1004
 1001ecb:	68 60 81 00 01       	push   0x1008160
 1001ed0:	e8 a2 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:287
printk("\tAHCI_ABAR_REMAPPED_ADDRESS=0x%08x\n",AHCI_ABAR_REMAPPED_ADDRESS);
 1001ed5:	83 c4 08             	add    esp,0x8
 1001ed8:	68 00 20 8c 00       	push   0x8c2000
 1001edd:	68 94 81 00 01       	push   0x1008194
 1001ee2:	e8 90 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:288
printk("\tAHCI_PORT_BASE_REMAP_ADDRESS=0x%08x\n",AHCI_PORT_BASE_REMAP_ADDRESS);
 1001ee7:	83 c4 08             	add    esp,0x8
 1001eea:	68 00 20 90 00       	push   0x902000
 1001eef:	68 b8 81 00 01       	push   0x10081b8
 1001ef4:	e8 7e 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:289
printk("\tAHCI_DISK_BUFFER_ADDRESS=0x%08x\n",AHCI_DISK_BUFFER_ADDRESS);
 1001ef9:	83 c4 08             	add    esp,0x8
 1001efc:	68 00 20 a4 00       	push   0xa42000
 1001f01:	68 e0 81 00 01       	push   0x10081e0
 1001f06:	e8 6c 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:290
printk("\tATA_DEVICE_INFO_ADDRESS=0x%08x\n",ATA_DEVICE_INFO_ADDRESS);
 1001f0b:	83 c4 08             	add    esp,0x8
 1001f0e:	68 00 20 b8 00       	push   0xb82000
 1001f13:	68 04 82 00 01       	push   0x1008204
 1001f18:	e8 5a 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:291
printk("\tAHCI_CAPS_ADDRESS=0x%08x\n",AHCI_CAPS_ADDRESS);
 1001f1d:	83 c4 08             	add    esp,0x8
 1001f20:	68 20 6e b8 00       	push   0xb86e20
 1001f25:	68 56 75 00 01       	push   0x1007556
 1001f2a:	e8 48 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:292
printk("\tTSS_AVAILABLE_ADDRESS=0x%08x\n",TASK_AVAILABLE_ADDRESS);
 1001f2f:	83 c4 08             	add    esp,0x8
 1001f32:	68 40 bc b8 00       	push   0xb8bc40
 1001f37:	68 28 82 00 01       	push   0x1008228
 1001f3c:	e8 36 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:293
printk("\tGDT_AVAILABLE_ADDRESS=0x%08x\n",GDT_AVAILABLE_ADDRESS);
 1001f41:	83 c4 08             	add    esp,0x8
 1001f44:	68 40 c4 b8 00       	push   0xb8c440
 1001f49:	68 48 82 00 01       	push   0x1008248
 1001f4e:	e8 24 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:294
printk("\tEXEC_FILE_LOAD_INFO=0x%08x\n",EXEC_FILE_LOAD_INFO);
 1001f53:	83 c4 08             	add    esp,0x8
 1001f56:	68 40 cc b8 00       	push   0xb8cc40
 1001f5b:	68 71 75 00 01       	push   0x1007571
 1001f60:	e8 12 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:295
printk("\tAHCI_ABAR_ADDRESS=0x%08x\n",AHCI_ABAR_ADDRESS);
 1001f65:	83 c4 08             	add    esp,0x8
 1001f68:	68 e0 52 ba 00       	push   0xba52e0
 1001f6d:	68 8e 75 00 01       	push   0x100758e
 1001f72:	e8 00 06 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:296
printk("\tEND_OF_KERNEL_OBJECTS_ADDRESS=0x%08x\n",END_OF_KERNEL_OBJECTS_ADDRESS);
 1001f77:	83 c4 08             	add    esp,0x8
 1001f7a:	68 e0 52 ca 00       	push   0xca52e0
 1001f7f:	68 68 82 00 01       	push   0x1008268
 1001f84:	e8 ee 05 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:297
}
 1001f89:	83 c4 1c             	add    esp,0x1c
 1001f8c:	c3                   	ret    

01001f8d <pauseDisplay>:
pauseDisplay():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:300

bool pauseDisplay(bool offerToQuit)
{
 1001f8d:	56                   	push   esi
 1001f8e:	53                   	push   ebx
 1001f8f:	83 ec 04             	sub    esp,0x4
 1001f92:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:301
    if (offerToQuit)
 1001f96:	84 db                	test   bl,bl
 1001f98:	74 12                	je     1001fac <pauseDisplay+0x1f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:302
        printk("Press q to quit, any other key to continue ...");
 1001f9a:	83 ec 0c             	sub    esp,0xc
 1001f9d:	68 90 82 00 01       	push   0x1008290
 1001fa2:	e8 d0 05 00 00       	call   1002577 <printk>
 1001fa7:	83 c4 10             	add    esp,0x10
 1001faa:	eb 10                	jmp    1001fbc <pauseDisplay+0x2f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:304
    else
        printk("Press a key to continue ... ");
 1001fac:	83 ec 0c             	sub    esp,0xc
 1001faf:	68 a9 75 00 01       	push   0x10075a9
 1001fb4:	e8 be 05 00 00       	call   1002577 <printk>
 1001fb9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:305
    char lPressedKey=waitForKeyboardKey();
 1001fbc:	e8 f7 e4 ff ff       	call   10004b8 <waitForKeyboardKey>
 1001fc1:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:306
    cursorMoveToX(0);
 1001fc3:	83 ec 0c             	sub    esp,0xc
 1001fc6:	6a 00                	push   0x0
 1001fc8:	e8 bd e3 ff ff       	call   100038a <cursorMoveToX>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:307
    printk("                                           ");
 1001fcd:	c7 04 24 c0 82 00 01 	mov    DWORD PTR [esp],0x10082c0
 1001fd4:	e8 9e 05 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:308
    cursorMoveToX(0);
 1001fd9:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
 1001fe0:	e8 a5 e3 ff ff       	call   100038a <cursorMoveToX>
 1001fe5:	89 f0                	mov    eax,esi
 1001fe7:	3c 71                	cmp    al,0x71
 1001fe9:	0f 94 c0             	sete   al
 1001fec:	21 d8                	and    eax,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:312
    if (lPressedKey=='q' && offerToQuit)
        return true;
    return false;
}
 1001fee:	83 c4 14             	add    esp,0x14
 1001ff1:	5b                   	pop    ebx
 1001ff2:	5e                   	pop    esi
 1001ff3:	c3                   	ret    

01001ff4 <mallocTemp>:
mallocTemp():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:317

int memPtr=0xe00000;
uintptr_t* mallocTemp(int size)
{
    uintptr_t lRetVal = memPtr;
 1001ff4:	a1 00 40 00 01       	mov    eax,ds:0x1004000
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:318
    memPtr+=size;
 1001ff9:	89 c2                	mov    edx,eax
 1001ffb:	03 54 24 04          	add    edx,DWORD PTR [esp+0x4]
 1001fff:	89 15 00 40 00 01    	mov    DWORD PTR ds:0x1004000,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:320
    return (uintptr_t*)lRetVal;
 1002005:	c3                   	ret    
 1002006:	66 90                	xchg   ax,ax

01002008 <memcpy>:
memcpy():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:12
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
void * memcpy(void *dest, const void *src, size_t n)
{
 1002008:	57                   	push   edi
 1002009:	56                   	push   esi
 100200a:	53                   	push   ebx
 100200b:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 100200f:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 1002013:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:17
    bool dw,dd;
    
    dd=n%4==0;
    dw=n%2==0;
    if (dd)
 1002017:	89 d1                	mov    ecx,edx
 1002019:	83 e1 03             	and    ecx,0x3
 100201c:	75 4d                	jne    100206b <memcpy+0x63>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:19
    {
        n /=4;
 100201e:	c1 ea 02             	shr    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:23
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
 1002021:	39 c3                	cmp    ebx,eax
 1002023:	72 0e                	jb     1002033 <memcpy+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 1002025:	b9 00 00 00 00       	mov    ecx,0x0
 100202a:	85 d2                	test   edx,edx
 100202c:	75 2e                	jne    100205c <memcpy+0x54>
 100202e:	e9 b6 00 00 00       	jmp    10020e9 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:24
        n /=4;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
 1002033:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
 100203a:	01 fb                	add    ebx,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:25
                t += n;
 100203c:	01 c7                	add    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:26
                while ( (n)-- > 0)
 100203e:	85 d2                	test   edx,edx
 1002040:	0f 84 a3 00 00 00    	je     10020e9 <memcpy+0xe1>
 1002046:	f7 da                	neg    edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:27
                        *--t = *--f;
 1002048:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
 100204c:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
 1002050:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:26
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
 1002053:	39 d1                	cmp    ecx,edx
 1002055:	75 f1                	jne    1002048 <memcpy+0x40>
 1002057:	e9 8d 00 00 00       	jmp    10020e9 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:30
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
 100205c:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
 100205f:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
 1002062:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 1002065:	39 ca                	cmp    edx,ecx
 1002067:	75 f3                	jne    100205c <memcpy+0x54>
 1002069:	eb 7e                	jmp    10020e9 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:33
                        *t++ = *f++;
        return dest;
    }
    else if (dw)
 100206b:	89 d1                	mov    ecx,edx
 100206d:	83 e1 01             	and    ecx,0x1
 1002070:	75 42                	jne    10020b4 <memcpy+0xac>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:35
    {
        n /=2;
 1002072:	d1 ea                	shr    edx,1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:39
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
 1002074:	39 c3                	cmp    ebx,eax
 1002076:	72 0b                	jb     1002083 <memcpy+0x7b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 1002078:	b9 00 00 00 00       	mov    ecx,0x0
 100207d:	85 d2                	test   edx,edx
 100207f:	75 24                	jne    10020a5 <memcpy+0x9d>
 1002081:	eb 66                	jmp    10020e9 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:40
        n /=2;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
 1002083:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
 100208a:	01 fb                	add    ebx,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:41
                t += n;
 100208c:	01 c7                	add    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:42
                while ( (n)-- > 0)
 100208e:	85 d2                	test   edx,edx
 1002090:	74 57                	je     10020e9 <memcpy+0xe1>
 1002092:	f7 da                	neg    edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:43
                        *--t = *--f;
 1002094:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
 1002098:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
 100209c:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:42
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
 100209f:	39 ca                	cmp    edx,ecx
 10020a1:	75 f1                	jne    1002094 <memcpy+0x8c>
 10020a3:	eb 44                	jmp    10020e9 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:46
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
 10020a5:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
 10020a8:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
 10020ab:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 10020ae:	39 ca                	cmp    edx,ecx
 10020b0:	75 f3                	jne    10020a5 <memcpy+0x9d>
 10020b2:	eb 35                	jmp    10020e9 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:54
    else
    {
        const char *f = src;
        char *t = dest;

        if (f < t) {
 10020b4:	39 c3                	cmp    ebx,eax
 10020b6:	72 0b                	jb     10020c3 <memcpy+0xbb>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
 10020b8:	be 00 00 00 00       	mov    esi,0x0
 10020bd:	85 d2                	test   edx,edx
 10020bf:	75 1a                	jne    10020db <memcpy+0xd3>
 10020c1:	eb 26                	jmp    10020e9 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
 10020c3:	8d 4a ff             	lea    ecx,[edx-0x1]
 10020c6:	85 d2                	test   edx,edx
 10020c8:	74 1f                	je     10020e9 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:58
                        *--t = *--f;
 10020ca:	0f b6 14 0b          	movzx  edx,BYTE PTR [ebx+ecx*1]
 10020ce:	88 14 08             	mov    BYTE PTR [eax+ecx*1],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
 10020d1:	83 e9 01             	sub    ecx,0x1
 10020d4:	83 f9 ff             	cmp    ecx,0xffffffff
 10020d7:	75 f1                	jne    10020ca <memcpy+0xc2>
 10020d9:	eb 0e                	jmp    10020e9 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:61
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
 10020db:	0f b6 0c 33          	movzx  ecx,BYTE PTR [ebx+esi*1]
 10020df:	88 0c 30             	mov    BYTE PTR [eax+esi*1],cl
 10020e2:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
 10020e5:	39 f2                	cmp    edx,esi
 10020e7:	75 f2                	jne    10020db <memcpy+0xd3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:64
                        *t++ = *f++;
        return dest;
    }
 10020e9:	5b                   	pop    ebx
 10020ea:	5e                   	pop    esi
 10020eb:	5f                   	pop    edi
 10020ec:	c3                   	ret    
 10020ed:	66 90                	xchg   ax,ax
 10020ef:	90                   	nop

010020f0 <panic>:
panic():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:8
#include <stdarg.h>
#include <time.h>
#include "printf.h"

void __attribute__((noinline))panic(const char *format, ...)
{
 10020f0:	53                   	push   ebx
 10020f1:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:10
    va_list args;
    va_start( args, format );
 10020f4:	8d 5c 24 14          	lea    ebx,[esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:11
    printk("\n>>>panic at instruction prior to address 0x%08X<<<\n", __builtin_return_address(0));
 10020f8:	83 ec 08             	sub    esp,0x8
 10020fb:	ff 74 24 14          	push   DWORD PTR [esp+0x14]
 10020ff:	68 ec 82 00 01       	push   0x10082ec
 1002104:	e8 6e 04 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:12
    printk("  >>>");
 1002109:	c7 04 24 c6 75 00 01 	mov    DWORD PTR [esp],0x10075c6
 1002110:	e8 62 04 00 00       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:13
    printk_valist( format,args);
 1002115:	83 c4 08             	add    esp,0x8
 1002118:	53                   	push   ebx
 1002119:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100211d:	e8 3c 04 00 00       	call   100255e <printk_valist>
 1002122:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:15 (discriminator 1)
    panicLoop: 
    __asm__("cli\nhlt\n");
 1002125:	fa                   	cli    
 1002126:	f4                   	hlt    
 1002127:	eb fc                	jmp    1002125 <panic+0x35>
 1002129:	66 90                	xchg   ax,ax
 100212b:	90                   	nop

0100212c <printchar>:
printchar():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:43
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
	
	if (str) {
 100212c:	85 c0                	test   eax,eax
 100212e:	74 08                	je     1002138 <printchar+0xc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:44
		**str = c;
 1002130:	8b 08                	mov    ecx,DWORD PTR [eax]
 1002132:	88 11                	mov    BYTE PTR [ecx],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:45
		++(*str);
 1002134:	83 00 01             	add    DWORD PTR [eax],0x1
 1002137:	c3                   	ret    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:41
//extern bool pauseDisplay(bool offerToQuit);
extern uint32_t kDebugLevel;
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
 1002138:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:47
	
	if (str) {
		**str = c;
		++(*str);
	}
	else terminal_putchar((unsigned char)c);
 100213b:	0f b6 d2             	movzx  edx,dl
 100213e:	52                   	push   edx
 100213f:	e8 d1 e0 ff ff       	call   1000215 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:48
}
 1002144:	83 c4 1c             	add    esp,0x1c
 1002147:	c3                   	ret    

01002148 <prints>:
prints():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:54

#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
 1002148:	55                   	push   ebp
 1002149:	57                   	push   edi
 100214a:	56                   	push   esi
 100214b:	53                   	push   ebx
 100214c:	83 ec 1c             	sub    esp,0x1c
 100214f:	89 c7                	mov    edi,eax
 1002151:	89 d6                	mov    esi,edx
 1002153:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
 1002157:	8b 54 24 30          	mov    edx,DWORD PTR [esp+0x30]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:57
	register int pc = 0, padchar = ' ';

	if (width > 0) {
 100215b:	85 c9                	test   ecx,ecx
 100215d:	0f 8e cb 00 00 00    	jle    100222e <prints+0xe6>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60 (discriminator 1)
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
 1002163:	80 3e 00             	cmp    BYTE PTR [esi],0x0
 1002166:	74 1b                	je     1002183 <prints+0x3b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60
 1002168:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60 (discriminator 3)
 100216d:	83 c0 01             	add    eax,0x1
 1002170:	80 3c 06 00          	cmp    BYTE PTR [esi+eax*1],0x0
 1002174:	75 f7                	jne    100216d <prints+0x25>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:61
		if (len >= width) width = 0;
 1002176:	bb 00 00 00 00       	mov    ebx,0x0
 100217b:	39 44 24 0c          	cmp    DWORD PTR [esp+0xc],eax
 100217f:	7e 0f                	jle    1002190 <prints+0x48>
 1002181:	eb 05                	jmp    1002188 <prints+0x40>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60
	register int pc = 0, padchar = ' ';

	if (width > 0) {
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
 1002183:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:62
		if (len >= width) width = 0;
		else width -= len;
 1002188:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 100218c:	29 c1                	sub    ecx,eax
 100218e:	89 cb                	mov    ebx,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:63
		if (pad & PAD_ZERO) padchar = '0';
 1002190:	89 d0                	mov    eax,edx
 1002192:	83 e0 02             	and    eax,0x2
 1002195:	83 f8 01             	cmp    eax,0x1
 1002198:	19 ed                	sbb    ebp,ebp
 100219a:	83 e5 f0             	and    ebp,0xfffffff0
 100219d:	83 c5 30             	add    ebp,0x30
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:65
	}
	if (!(pad & PAD_RIGHT)) {
 10021a0:	f6 c2 01             	test   dl,0x1
 10021a3:	75 1a                	jne    10021bf <prints+0x77>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66 (discriminator 1)
		for ( ; width > 0; --width) {
 10021a5:	85 db                	test   ebx,ebx
 10021a7:	7e 67                	jle    1002210 <prints+0xc8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66
 10021a9:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:67 (discriminator 2)
			printchar (out, padchar);
 10021ad:	89 ea                	mov    edx,ebp
 10021af:	89 f8                	mov    eax,edi
 10021b1:	e8 76 ff ff ff       	call   100212c <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66 (discriminator 2)
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
 10021b6:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
 10021bb:	75 f0                	jne    10021ad <prints+0x65>
 10021bd:	eb 66                	jmp    1002225 <prints+0xdd>
 10021bf:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 1)
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 10021c3:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 10021c6:	84 d2                	test   dl,dl
 10021c8:	74 1e                	je     10021e8 <prints+0xa0>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 10021ca:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 10021cf:	29 de                	sub    esi,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:72 (discriminator 2)
		printchar (out, *string);
 10021d1:	0f be d2             	movsx  edx,dl
 10021d4:	89 f8                	mov    eax,edi
 10021d6:	e8 51 ff ff ff       	call   100212c <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:73 (discriminator 2)
		++pc;
 10021db:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 10021de:	0f b6 14 1e          	movzx  edx,BYTE PTR [esi+ebx*1]
 10021e2:	84 d2                	test   dl,dl
 10021e4:	75 eb                	jne    10021d1 <prints+0x89>
 10021e6:	eb 05                	jmp    10021ed <prints+0xa5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 10021e8:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:75 (discriminator 1)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
 10021ed:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10021f1:	85 c0                	test   eax,eax
 10021f3:	7e 45                	jle    100223a <prints+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:75
 10021f5:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:76 (discriminator 2)
		printchar (out, padchar);
 10021f7:	89 ea                	mov    edx,ebp
 10021f9:	89 f8                	mov    eax,edi
 10021fb:	e8 2c ff ff ff       	call   100212c <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:75 (discriminator 2)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
 1002200:	83 ee 01             	sub    esi,0x1
 1002203:	75 f2                	jne    10021f7 <prints+0xaf>
 1002205:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1002209:	8d 04 03             	lea    eax,[ebx+eax*1]
 100220c:	89 c3                	mov    ebx,eax
 100220e:	eb 2a                	jmp    100223a <prints+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
 1002210:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
 1002214:	bb 00 00 00 00       	mov    ebx,0x0
 1002219:	eb 0a                	jmp    1002225 <prints+0xdd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 100221b:	bd 20 00 00 00       	mov    ebp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
 1002220:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 1002225:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 1002228:	84 d2                	test   dl,dl
 100222a:	75 a3                	jne    10021cf <prints+0x87>
 100222c:	eb 0c                	jmp    100223a <prints+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
 100222e:	f6 c2 01             	test   dl,0x1
 1002231:	74 e8                	je     100221b <prints+0xd3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 1002233:	bd 20 00 00 00       	mov    ebp,0x20
 1002238:	eb 89                	jmp    10021c3 <prints+0x7b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:81
		printchar (out, padchar);
		++pc;
	}

	return pc;
}
 100223a:	89 d8                	mov    eax,ebx
 100223c:	83 c4 1c             	add    esp,0x1c
 100223f:	5b                   	pop    ebx
 1002240:	5e                   	pop    esi
 1002241:	5f                   	pop    edi
 1002242:	5d                   	pop    ebp
 1002243:	c3                   	ret    

01002244 <printi>:
printi():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:87

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
 1002244:	55                   	push   ebp
 1002245:	57                   	push   edi
 1002246:	56                   	push   esi
 1002247:	53                   	push   ebx
 1002248:	83 ec 2c             	sub    esp,0x2c
 100224b:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:93
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;

	if (i == 0) {
 100224f:	85 d2                	test   edx,edx
 1002251:	75 2a                	jne    100227d <printi+0x39>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:94
		print_buf[0] = '0';
 1002253:	c6 44 24 14 30       	mov    BYTE PTR [esp+0x14],0x30
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:95
		print_buf[1] = '\0';
 1002258:	c6 44 24 15 00       	mov    BYTE PTR [esp+0x15],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:96
		return prints (out, print_buf, width, pad);
 100225d:	83 ec 0c             	sub    esp,0xc
 1002260:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 1002264:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
 1002268:	8d 54 24 24          	lea    edx,[esp+0x24]
 100226c:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002270:	e8 d3 fe ff ff       	call   1002148 <prints>
 1002275:	83 c4 10             	add    esp,0x10
 1002278:	e9 f1 00 00 00       	jmp    100236e <printi+0x12a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:99
	}

	if (sg && b == 10 && i < 0) {
 100227d:	83 7c 24 40 00       	cmp    DWORD PTR [esp+0x40],0x0
 1002282:	0f 95 c3             	setne  bl
 1002285:	83 f9 0a             	cmp    ecx,0xa
 1002288:	0f 94 c0             	sete   al
 100228b:	84 c3                	test   bl,al
 100228d:	0f 84 c1 00 00 00    	je     1002354 <printi+0x110>
 1002293:	89 d0                	mov    eax,edx
 1002295:	c1 e8 1f             	shr    eax,0x1f
 1002298:	84 c0                	test   al,al
 100229a:	0f 84 b4 00 00 00    	je     1002354 <printi+0x110>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
 10022a0:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
 10022a5:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:107
	*s = '\0';

	while (u) {
 10022a9:	89 d3                	mov    ebx,edx
 10022ab:	f7 db                	neg    ebx
 10022ad:	74 54                	je     1002303 <printi+0xbf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:100
		print_buf[1] = '\0';
		return prints (out, print_buf, width, pad);
	}

	if (sg && b == 10 && i < 0) {
		neg = 1;
 10022af:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
 10022b6:	00 
 10022b7:	eb 08                	jmp    10022c1 <printi+0x7d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 10022b9:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 10022c0:	00 
 10022c1:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
 10022c5:	89 cf                	mov    edi,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
 10022c7:	8b 44 24 4c          	mov    eax,DWORD PTR [esp+0x4c]
 10022cb:	8d 68 c6             	lea    ebp,[eax-0x3a]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
 10022ce:	89 d8                	mov    eax,ebx
 10022d0:	ba 00 00 00 00       	mov    edx,0x0
 10022d5:	f7 f1                	div    ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
 10022d7:	8d 04 2a             	lea    eax,[edx+ebp*1]
 10022da:	83 fa 0a             	cmp    edx,0xa
 10022dd:	0f 4c c2             	cmovl  eax,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:111
		*--s = t + '0';
 10022e0:	83 ee 01             	sub    esi,0x1
 10022e3:	83 c0 30             	add    eax,0x30
 10022e6:	88 06                	mov    BYTE PTR [esi],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:112
		u /= b;
 10022e8:	89 d8                	mov    eax,ebx
 10022ea:	ba 00 00 00 00       	mov    edx,0x0
 10022ef:	f7 f7                	div    edi
 10022f1:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:107
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
 10022f3:	85 c0                	test   eax,eax
 10022f5:	75 d7                	jne    10022ce <printi+0x8a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 10022f7:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:115
			t += letbase - '0' - 10;
		*--s = t + '0';
		u /= b;
	}

	if (neg) {
 10022fc:	83 7c 24 0c 00       	cmp    DWORD PTR [esp+0xc],0x0
 1002301:	74 34                	je     1002337 <printi+0xf3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:116
		if( width && (pad & PAD_ZERO) ) {
 1002303:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
 1002308:	74 21                	je     100232b <printi+0xe7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:116 (discriminator 1)
 100230a:	f6 44 24 48 02       	test   BYTE PTR [esp+0x48],0x2
 100230f:	74 1a                	je     100232b <printi+0xe7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:117
			printchar (out, '-');
 1002311:	ba 2d 00 00 00       	mov    edx,0x2d
 1002316:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100231a:	e8 0d fe ff ff       	call   100212c <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:119
			++pc;
			--width;
 100231f:	83 6c 24 44 01       	sub    DWORD PTR [esp+0x44],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:118
	}

	if (neg) {
		if( width && (pad & PAD_ZERO) ) {
			printchar (out, '-');
			++pc;
 1002324:	bb 01 00 00 00       	mov    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:119
			--width;
 1002329:	eb 0c                	jmp    1002337 <printi+0xf3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:122
		}
		else {
			*--s = '-';
 100232b:	c6 46 ff 2d          	mov    BYTE PTR [esi-0x1],0x2d
 100232f:	8d 76 ff             	lea    esi,[esi-0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 1002332:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:126
		else {
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
 1002337:	83 ec 0c             	sub    esp,0xc
 100233a:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 100233e:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
 1002342:	89 f2                	mov    edx,esi
 1002344:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002348:	e8 fb fd ff ff       	call   1002148 <prints>
 100234d:	01 d8                	add    eax,ebx
 100234f:	83 c4 10             	add    esp,0x10
 1002352:	eb 1a                	jmp    100236e <printi+0x12a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:91
static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;
 1002354:	89 d3                	mov    ebx,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
 1002356:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:107

	while (u) {
 100235b:	85 d2                	test   edx,edx
 100235d:	0f 85 56 ff ff ff    	jne    10022b9 <printi+0x75>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 1002363:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
 1002368:	8d 74 24 1f          	lea    esi,[esp+0x1f]
 100236c:	eb c9                	jmp    1002337 <printi+0xf3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:127
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
}
 100236e:	83 c4 2c             	add    esp,0x2c
 1002371:	5b                   	pop    ebx
 1002372:	5e                   	pop    esi
 1002373:	5f                   	pop    edi
 1002374:	5d                   	pop    ebp
 1002375:	c3                   	ret    

01002376 <print>:
print():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:130

static int print(char **out, const char *format, va_list args )
{
 1002376:	55                   	push   ebp
 1002377:	57                   	push   edi
 1002378:	56                   	push   esi
 1002379:	53                   	push   ebx
 100237a:	83 ec 2c             	sub    esp,0x2c
 100237d:	89 c7                	mov    edi,eax
 100237f:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:135
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
 1002383:	0f b6 02             	movzx  eax,BYTE PTR [edx]
 1002386:	84 c0                	test   al,al
 1002388:	0f 84 b8 01 00 00    	je     1002546 <print+0x1d0>
 100238e:	89 d5                	mov    ebp,edx
 1002390:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:136
		if (*format == '%') {
 1002395:	3c 25                	cmp    al,0x25
 1002397:	0f 85 88 01 00 00    	jne    1002525 <print+0x1af>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:137
			++format;
 100239d:	8d 5d 01             	lea    ebx,[ebp+0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:139
			width = pad = 0;
			if (*format == '\0') break;
 10023a0:	0f b6 55 01          	movzx  edx,BYTE PTR [ebp+0x1]
 10023a4:	84 d2                	test   dl,dl
 10023a6:	0f 84 9f 01 00 00    	je     100254b <print+0x1d5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:140
			if (*format == '%') goto out;
 10023ac:	80 fa 25             	cmp    dl,0x25
 10023af:	0f 84 6e 01 00 00    	je     1002523 <print+0x1ad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:138
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
			width = pad = 0;
 10023b5:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:141
			if (*format == '\0') break;
			if (*format == '%') goto out;
			if (*format == '-') {
 10023ba:	80 fa 2d             	cmp    dl,0x2d
 10023bd:	75 08                	jne    10023c7 <print+0x51>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:142
				++format;
 10023bf:	8d 5d 02             	lea    ebx,[ebp+0x2]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:143
				pad = PAD_RIGHT;
 10023c2:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:145
			}
			while (*format == '0') {
 10023c7:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
 10023ca:	75 0b                	jne    10023d7 <print+0x61>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:146
				++format;
 10023cc:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:147
				pad |= PAD_ZERO;
 10023cf:	83 c8 02             	or     eax,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:145
			if (*format == '%') goto out;
			if (*format == '-') {
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0') {
 10023d2:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
 10023d5:	74 f5                	je     10023cc <print+0x56>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149 (discriminator 1)
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
 10023d7:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
 10023da:	8d 4a d0             	lea    ecx,[edx-0x30]
 10023dd:	80 f9 09             	cmp    cl,0x9
 10023e0:	77 22                	ja     1002404 <print+0x8e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149
 10023e2:	b9 00 00 00 00       	mov    ecx,0x0
 10023e7:	89 c5                	mov    ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:150 (discriminator 2)
				width *= 10;
 10023e9:	8d 04 89             	lea    eax,[ecx+ecx*4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:151 (discriminator 2)
				width += *format - '0';
 10023ec:	0f be d2             	movsx  edx,dl
 10023ef:	8d 4c 42 d0          	lea    ecx,[edx+eax*2-0x30]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149 (discriminator 2)
			}
			while (*format == '0') {
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
 10023f3:	83 c3 01             	add    ebx,0x1
 10023f6:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
 10023f9:	8d 42 d0             	lea    eax,[edx-0x30]
 10023fc:	3c 09                	cmp    al,0x9
 10023fe:	76 e9                	jbe    10023e9 <print+0x73>
 1002400:	89 e8                	mov    eax,ebp
 1002402:	eb 05                	jmp    1002409 <print+0x93>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149
 1002404:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:153
				width *= 10;
				width += *format - '0';
			}
			if( *format == 's' ) {
 1002409:	80 fa 73             	cmp    dl,0x73
 100240c:	75 2c                	jne    100243a <print+0xc4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:154
				register char *s = (char *)va_arg( args, int );
 100240e:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 1002412:	8d 6a 04             	lea    ebp,[edx+0x4]
 1002415:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 1002419:	8b 12                	mov    edx,DWORD PTR [edx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:155
				pc += prints (out, s?s:"(null)", width, pad);
 100241b:	85 d2                	test   edx,edx
 100241d:	bd cc 75 00 01       	mov    ebp,0x10075cc
 1002422:	0f 44 d5             	cmove  edx,ebp
 1002425:	83 ec 0c             	sub    esp,0xc
 1002428:	50                   	push   eax
 1002429:	89 f8                	mov    eax,edi
 100242b:	e8 18 fd ff ff       	call   1002148 <prints>
 1002430:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:156
				continue;
 1002432:	83 c4 10             	add    esp,0x10
 1002435:	e9 fb 00 00 00       	jmp    1002535 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:158
			}
			if( *format == 'd' ) {
 100243a:	80 fa 64             	cmp    dl,0x64
 100243d:	75 29                	jne    1002468 <print+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:159
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
 100243f:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 1002443:	8d 6a 04             	lea    ebp,[edx+0x4]
 1002446:	6a 61                	push   0x61
 1002448:	50                   	push   eax
 1002449:	51                   	push   ecx
 100244a:	6a 01                	push   0x1
 100244c:	b9 0a 00 00 00       	mov    ecx,0xa
 1002451:	8b 12                	mov    edx,DWORD PTR [edx]
 1002453:	89 f8                	mov    eax,edi
 1002455:	e8 ea fd ff ff       	call   1002244 <printi>
 100245a:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:160
				continue;
 100245c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:159
				register char *s = (char *)va_arg( args, int );
				pc += prints (out, s?s:"(null)", width, pad);
				continue;
			}
			if( *format == 'd' ) {
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
 100245f:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:160
				continue;
 1002463:	e9 cd 00 00 00       	jmp    1002535 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:162
			}
			if( *format == 'x' ) {
 1002468:	80 fa 78             	cmp    dl,0x78
 100246b:	75 2b                	jne    1002498 <print+0x122>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:163
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
 100246d:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 1002471:	89 ea                	mov    edx,ebp
 1002473:	83 c5 04             	add    ebp,0x4
 1002476:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 100247a:	6a 61                	push   0x61
 100247c:	50                   	push   eax
 100247d:	51                   	push   ecx
 100247e:	6a 00                	push   0x0
 1002480:	b9 10 00 00 00       	mov    ecx,0x10
 1002485:	8b 12                	mov    edx,DWORD PTR [edx]
 1002487:	89 f8                	mov    eax,edi
 1002489:	e8 b6 fd ff ff       	call   1002244 <printi>
 100248e:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:164
				continue;
 1002490:	83 c4 10             	add    esp,0x10
 1002493:	e9 9d 00 00 00       	jmp    1002535 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:166
			}
			if( *format == 'X' ) {
 1002498:	80 fa 58             	cmp    dl,0x58
 100249b:	75 26                	jne    10024c3 <print+0x14d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:167
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
 100249d:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 10024a1:	8d 6a 04             	lea    ebp,[edx+0x4]
 10024a4:	6a 41                	push   0x41
 10024a6:	50                   	push   eax
 10024a7:	51                   	push   ecx
 10024a8:	6a 00                	push   0x0
 10024aa:	b9 10 00 00 00       	mov    ecx,0x10
 10024af:	8b 12                	mov    edx,DWORD PTR [edx]
 10024b1:	89 f8                	mov    eax,edi
 10024b3:	e8 8c fd ff ff       	call   1002244 <printi>
 10024b8:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:168
				continue;
 10024ba:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:167
			if( *format == 'x' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
				continue;
			}
			if( *format == 'X' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
 10024bd:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:168
				continue;
 10024c1:	eb 72                	jmp    1002535 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:170
			}
			if( *format == 'u' ) {
 10024c3:	80 fa 75             	cmp    dl,0x75
 10024c6:	75 28                	jne    10024f0 <print+0x17a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:171
				pc += printi (out, va_arg( args, int ), 10, 0, width, pad, 'a');
 10024c8:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 10024cc:	89 ea                	mov    edx,ebp
 10024ce:	83 c5 04             	add    ebp,0x4
 10024d1:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 10024d5:	6a 61                	push   0x61
 10024d7:	50                   	push   eax
 10024d8:	51                   	push   ecx
 10024d9:	6a 00                	push   0x0
 10024db:	b9 0a 00 00 00       	mov    ecx,0xa
 10024e0:	8b 12                	mov    edx,DWORD PTR [edx]
 10024e2:	89 f8                	mov    eax,edi
 10024e4:	e8 5b fd ff ff       	call   1002244 <printi>
 10024e9:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:172
				continue;
 10024eb:	83 c4 10             	add    esp,0x10
 10024ee:	eb 45                	jmp    1002535 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:174
			}
			if( *format == 'c' ) {
 10024f0:	80 fa 63             	cmp    dl,0x63
 10024f3:	75 40                	jne    1002535 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:176
				/* char are converted to int then pushed on the stack */
				scr[0] = (char)va_arg( args, int );
 10024f5:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 10024f9:	89 ea                	mov    edx,ebp
 10024fb:	83 c5 04             	add    ebp,0x4
 10024fe:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 1002502:	8b 12                	mov    edx,DWORD PTR [edx]
 1002504:	88 54 24 1e          	mov    BYTE PTR [esp+0x1e],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:177
				scr[1] = '\0';
 1002508:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:178
				pc += prints (out, scr, width, pad);
 100250d:	83 ec 0c             	sub    esp,0xc
 1002510:	50                   	push   eax
 1002511:	8d 54 24 2e          	lea    edx,[esp+0x2e]
 1002515:	89 f8                	mov    eax,edi
 1002517:	e8 2c fc ff ff       	call   1002148 <prints>
 100251c:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:179
				continue;
 100251e:	83 c4 10             	add    esp,0x10
 1002521:	eb 12                	jmp    1002535 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:137
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
 1002523:	89 dd                	mov    ebp,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:184
				continue;
			}
		}
		else {
		out:
			printchar (out, *format);
 1002525:	0f be 55 00          	movsx  edx,BYTE PTR [ebp+0x0]
 1002529:	89 f8                	mov    eax,edi
 100252b:	e8 fc fb ff ff       	call   100212c <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:185
			++pc;
 1002530:	83 c6 01             	add    esi,0x1
 1002533:	89 eb                	mov    ebx,ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:135
{
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
 1002535:	8d 6b 01             	lea    ebp,[ebx+0x1]
 1002538:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
 100253c:	84 c0                	test   al,al
 100253e:	0f 85 51 fe ff ff    	jne    1002395 <print+0x1f>
 1002544:	eb 05                	jmp    100254b <print+0x1d5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:132
}

static int print(char **out, const char *format, va_list args )
{
	register int width, pad;
	register int pc = 0;
 1002546:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:188
		out:
			printchar (out, *format);
			++pc;
		}
	}
	if (out) **out = '\0';
 100254b:	85 ff                	test   edi,edi
 100254d:	74 05                	je     1002554 <print+0x1de>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:188 (discriminator 1)
 100254f:	8b 07                	mov    eax,DWORD PTR [edi]
 1002551:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:191
	va_end( args );
	return pc;
}
 1002554:	89 f0                	mov    eax,esi
 1002556:	83 c4 2c             	add    esp,0x2c
 1002559:	5b                   	pop    ebx
 100255a:	5e                   	pop    esi
 100255b:	5f                   	pop    edi
 100255c:	5d                   	pop    ebp
 100255d:	c3                   	ret    

0100255e <printk_valist>:
printk_valist():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:194

int printk_valist(const char *format, va_list args)
{
 100255e:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:195
    return print(0, format, args);
 1002561:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
 1002565:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 1002569:	b8 00 00 00 00       	mov    eax,0x0
 100256e:	e8 03 fe ff ff       	call   1002376 <print>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:196
}
 1002573:	83 c4 0c             	add    esp,0xc
 1002576:	c3                   	ret    

01002577 <printk>:
printk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:199

int printk(const char *format, ...)
{
 1002577:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:201
        va_list args;
        va_start( args, format );
 100257a:	8d 44 24 14          	lea    eax,[esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:202
        return printk_valist(format, args);
 100257e:	83 ec 08             	sub    esp,0x8
 1002581:	50                   	push   eax
 1002582:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1002586:	e8 d3 ff ff ff       	call   100255e <printk_valist>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:203
}
 100258b:	83 c4 1c             	add    esp,0x1c
 100258e:	c3                   	ret    

0100258f <printd>:
printd():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:209

#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
 100258f:	83 ec 0c             	sub    esp,0xc
 1002592:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:210
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
 1002596:	89 d1                	mov    ecx,edx
 1002598:	23 0d 38 03 12 00    	and    ecx,DWORD PTR ds:0x120338
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:222
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
    }
    return 0;
 100259e:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:210
#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
 10025a3:	39 ca                	cmp    edx,ecx
 10025a5:	75 14                	jne    10025bb <printd+0x2c>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:214
    {
        va_list args;

        va_start( args, format );
 10025a7:	8d 44 24 18          	lea    eax,[esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:220
//        if (++printDLineCount==SYS_VGA_HEIGHT-1)
//        {
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
 10025ab:	83 ec 08             	sub    esp,0x8
 10025ae:	50                   	push   eax
 10025af:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 10025b3:	e8 a6 ff ff ff       	call   100255e <printk_valist>
 10025b8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:223 (discriminator 1)
    }
    return 0;
}
 10025bb:	83 c4 0c             	add    esp,0xc
 10025be:	c3                   	ret    

010025bf <sprintf>:
sprintf():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:227
#endif

int sprintf(char *out, const char *format, ...)
{
 10025bf:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:231
        va_list args;
        
        va_start( args, format );
        return print( &out, format, args );
 10025c2:	8d 4c 24 18          	lea    ecx,[esp+0x18]
 10025c6:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
 10025ca:	8d 44 24 10          	lea    eax,[esp+0x10]
 10025ce:	e8 a3 fd ff ff       	call   1002376 <print>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:232
}
 10025d3:	83 c4 0c             	add    esp,0xc
 10025d6:	c3                   	ret    
 10025d7:	90                   	nop

010025d8 <strcpy>:
strcpy():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:5
#include "strings.h"

char *
strcpy(char *s1, const char *s2)
{
 10025d8:	53                   	push   ebx
 10025d9:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10025dd:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:6
    char *s = s1;
 10025e1:	89 c2                	mov    edx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:7 (discriminator 1)
    while ((*s++ = *s2++) != 0)
 10025e3:	83 c2 01             	add    edx,0x1
 10025e6:	83 c1 01             	add    ecx,0x1
 10025e9:	0f b6 59 ff          	movzx  ebx,BYTE PTR [ecx-0x1]
 10025ed:	88 5a ff             	mov    BYTE PTR [edx-0x1],bl
 10025f0:	84 db                	test   bl,bl
 10025f2:	75 ef                	jne    10025e3 <strcpy+0xb>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:10
	;
    return (s1);
}
 10025f4:	5b                   	pop    ebx
 10025f5:	c3                   	ret    

010025f6 <strcpyc>:
strcpyc():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:14

char *
strcpyc(char *s1, const char *s2, unsigned count)
{
 10025f6:	56                   	push   esi
 10025f7:	53                   	push   ebx
 10025f8:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10025fc:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16
    char *s = s1;
    while ((*s++ = *s2++) != 0 && count-->0)
 1002600:	ba 00 00 00 00       	mov    edx,0x0
 1002605:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 1002609:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16 (discriminator 2)
 100260c:	0f b6 0c 16          	movzx  ecx,BYTE PTR [esi+edx*1]
 1002610:	88 0c 10             	mov    BYTE PTR [eax+edx*1],cl
 1002613:	84 c9                	test   cl,cl
 1002615:	74 07                	je     100261e <strcpyc+0x28>
 1002617:	83 c2 01             	add    edx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16 (discriminator 1)
 100261a:	39 d3                	cmp    ebx,edx
 100261c:	75 ee                	jne    100260c <strcpyc+0x16>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:19
	;
    return (s1);
}
 100261e:	5b                   	pop    ebx
 100261f:	5e                   	pop    esi
 1002620:	c3                   	ret    
 1002621:	66 90                	xchg   ax,ax
 1002623:	90                   	nop

01002624 <strlen>:
strlen():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:3
#include <stddef.h>

size_t strlen(const char* str) {
 1002624:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:5
          size_t ret = 0;
        while ( str[ret] != 0 )
 1002628:	80 3a 00             	cmp    BYTE PTR [edx],0x0
 100262b:	74 10                	je     100263d <strlen+0x19>
 100262d:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:6
                ret++;
 1002632:	83 c0 01             	add    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:5
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
 1002635:	80 3c 02 00          	cmp    BYTE PTR [edx+eax*1],0x0
 1002639:	75 f7                	jne    1002632 <strlen+0xe>
 100263b:	f3 c3                	repz ret 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:4
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
 100263d:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:8
        while ( str[ret] != 0 )
                ret++;
        return ret;
}
 1002642:	c3                   	ret    
 1002643:	90                   	nop

01002644 <strncmp>:
strncmp():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:13
 *   array pointed to by `s2'.  [4.11.4.4]
 */
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
 1002644:	57                   	push   edi
 1002645:	56                   	push   esi
 1002646:	53                   	push   ebx
 1002647:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 100264b:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
 100264f:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:14
    for ( ; n > 0; s1++, s2++, --n)
 1002653:	85 db                	test   ebx,ebx
 1002655:	74 41                	je     1002698 <strncmp+0x54>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:15
	if (*s1 != *s2)
 1002657:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 100265a:	0f b6 0f             	movzx  ecx,BYTE PTR [edi]
 100265d:	38 ca                	cmp    dl,cl
 100265f:	75 1c                	jne    100267d <strncmp+0x39>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:17
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
 1002661:	84 d2                	test   dl,dl
 1002663:	74 3a                	je     100269f <strncmp+0x5b>
 1002665:	83 eb 01             	sub    ebx,0x1
 1002668:	b8 00 00 00 00       	mov    eax,0x0
 100266d:	eb 1e                	jmp    100268d <strncmp+0x49>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:15
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
	if (*s1 != *s2)
 100266f:	0f b6 54 06 01       	movzx  edx,BYTE PTR [esi+eax*1+0x1]
 1002674:	0f b6 4c 07 01       	movzx  ecx,BYTE PTR [edi+eax*1+0x1]
 1002679:	38 ca                	cmp    dl,cl
 100267b:	74 09                	je     1002686 <strncmp+0x42>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:16
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
 100267d:	38 ca                	cmp    dl,cl
 100267f:	19 c0                	sbb    eax,eax
 1002681:	83 c8 01             	or     eax,0x1
 1002684:	eb 25                	jmp    10026ab <strncmp+0x67>
 1002686:	83 c0 01             	add    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:17
	else if (*s1 == '\0')
 1002689:	84 d2                	test   dl,dl
 100268b:	74 19                	je     10026a6 <strncmp+0x62>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:14
 */
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
 100268d:	39 d8                	cmp    eax,ebx
 100268f:	75 de                	jne    100266f <strncmp+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:19
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
    return 0;
 1002691:	b8 00 00 00 00       	mov    eax,0x0
 1002696:	eb 13                	jmp    10026ab <strncmp+0x67>
 1002698:	b8 00 00 00 00       	mov    eax,0x0
 100269d:	eb 0c                	jmp    10026ab <strncmp+0x67>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:18
{
    for ( ; n > 0; s1++, s2++, --n)
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
 100269f:	b8 00 00 00 00       	mov    eax,0x0
 10026a4:	eb 05                	jmp    10026ab <strncmp+0x67>
 10026a6:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:20
    return 0;
}
 10026ab:	5b                   	pop    ebx
 10026ac:	5e                   	pop    esi
 10026ad:	5f                   	pop    edi
 10026ae:	c3                   	ret    
 10026af:	90                   	nop

010026b0 <strncpy>:
strncpy():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:14
 *   The `strncpy' function returns the value of `s1'.  [4.11.2.4]
 */
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
 10026b0:	56                   	push   esi
 10026b1:	53                   	push   ebx
 10026b2:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
 10026b6:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10026ba:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
 10026be:	85 c9                	test   ecx,ecx
 10026c0:	74 33                	je     10026f5 <strncpy+0x45>
 10026c2:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 10026c5:	84 c0                	test   al,al
 10026c7:	74 26                	je     10026ef <strncpy+0x3f>
 10026c9:	89 f2                	mov    edx,esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:17
	*s++ = *s2++;
 10026cb:	83 c2 01             	add    edx,0x1
 10026ce:	83 c3 01             	add    ebx,0x1
 10026d1:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
 10026d4:	83 e9 01             	sub    ecx,0x1
 10026d7:	74 1c                	je     10026f5 <strncpy+0x45>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16 (discriminator 1)
 10026d9:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 10026dc:	84 c0                	test   al,al
 10026de:	75 eb                	jne    10026cb <strncpy+0x1b>
 10026e0:	eb 0f                	jmp    10026f1 <strncpy+0x41>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:21
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
	*s++ = '\0';
 10026e2:	83 c2 01             	add    edx,0x1
 10026e5:	c6 42 ff 00          	mov    BYTE PTR [edx-0x1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:20
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
 10026e9:	39 d1                	cmp    ecx,edx
 10026eb:	75 f5                	jne    10026e2 <strncpy+0x32>
 10026ed:	eb 06                	jmp    10026f5 <strncpy+0x45>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:15
 */
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
 10026ef:	89 f2                	mov    edx,esi
 10026f1:	01 d1                	add    ecx,edx
 10026f3:	eb ed                	jmp    10026e2 <strncpy+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:25
    while (n > 0) {
	*s++ = '\0';
	--n;
    }
    return s1;
}
 10026f5:	89 f0                	mov    eax,esi
 10026f7:	5b                   	pop    ebx
 10026f8:	5e                   	pop    esi
 10026f9:	c3                   	ret    
 10026fa:	66 90                	xchg   ax,ax

010026fc <strleft>:
strleft():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strparts.c:2
char* strleft(char* val, int cnt)
{
 10026fc:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strparts.c:3
    val[cnt]='\0';
 1002700:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 1002704:	c6 04 10 00          	mov    BYTE PTR [eax+edx*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strparts.c:5
    return val;
}
 1002708:	c3                   	ret    
 1002709:	66 90                	xchg   ax,ax
 100270b:	90                   	nop

0100270c <time>:
time():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:84
};

extern time_t kSystemCurrentTime;
time_t time(time_t* arg)
{
    *arg = kSystemCurrentTime;
 100270c:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1002710:	8b 15 8c 02 12 00    	mov    edx,DWORD PTR ds:0x12028c
 1002716:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:86
    return kSystemCurrentTime;
}
 1002718:	a1 8c 02 12 00       	mov    eax,ds:0x12028c
 100271d:	c3                   	ret    

0100271e <gmtime_r>:
gmtime_r():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:88

struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
 100271e:	55                   	push   ebp
 100271f:	57                   	push   edi
 1002720:	56                   	push   esi
 1002721:	53                   	push   ebx
 1002722:	83 ec 08             	sub    esp,0x8
 1002725:	8b 74 24 20          	mov    esi,DWORD PTR [esp+0x20]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:93
  time_t time = *timer;
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;

  dayclock = (unsigned long) time % SECS_DAY;
 1002729:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 100272d:	8b 18                	mov    ebx,DWORD PTR [eax]
 100272f:	ba 07 45 2e c2       	mov    edx,0xc22e4507
 1002734:	89 d8                	mov    eax,ebx
 1002736:	f7 e2                	mul    edx
 1002738:	89 d1                	mov    ecx,edx
 100273a:	c1 e9 10             	shr    ecx,0x10
 100273d:	69 c9 80 51 01 00    	imul   ecx,ecx,0x15180
 1002743:	29 cb                	sub    ebx,ecx
 1002745:	89 d9                	mov    ecx,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:94
  dayno = (unsigned long) time / SECS_DAY;
 1002747:	89 d3                	mov    ebx,edx
 1002749:	c1 eb 10             	shr    ebx,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:96

  tmbuf->tm_sec = dayclock % 60;
 100274c:	bd 89 88 88 88       	mov    ebp,0x88888889
 1002751:	89 c8                	mov    eax,ecx
 1002753:	f7 e5                	mul    ebp
 1002755:	c1 ea 05             	shr    edx,0x5
 1002758:	6b d2 3c             	imul   edx,edx,0x3c
 100275b:	89 c8                	mov    eax,ecx
 100275d:	29 d0                	sub    eax,edx
 100275f:	89 06                	mov    DWORD PTR [esi],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:97
  tmbuf->tm_min = (dayclock % 3600) / 60;
 1002761:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
 1002766:	89 c8                	mov    eax,ecx
 1002768:	f7 e2                	mul    edx
 100276a:	89 d7                	mov    edi,edx
 100276c:	c1 ef 0b             	shr    edi,0xb
 100276f:	69 c7 10 0e 00 00    	imul   eax,edi,0xe10
 1002775:	29 c1                	sub    ecx,eax
 1002777:	89 c8                	mov    eax,ecx
 1002779:	f7 e5                	mul    ebp
 100277b:	89 d1                	mov    ecx,edx
 100277d:	c1 e9 05             	shr    ecx,0x5
 1002780:	89 4e 04             	mov    DWORD PTR [esi+0x4],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:98
  tmbuf->tm_hour = dayclock / 3600;
 1002783:	89 7e 08             	mov    DWORD PTR [esi+0x8],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:99
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
 1002786:	8d 4b 04             	lea    ecx,[ebx+0x4]
 1002789:	ba 25 49 92 24       	mov    edx,0x24924925
 100278e:	89 c8                	mov    eax,ecx
 1002790:	f7 e2                	mul    edx
 1002792:	89 c8                	mov    eax,ecx
 1002794:	29 d0                	sub    eax,edx
 1002796:	d1 e8                	shr    eax,1
 1002798:	01 c2                	add    edx,eax
 100279a:	c1 ea 02             	shr    edx,0x2
 100279d:	8d 04 d5 00 00 00 00 	lea    eax,[edx*8+0x0]
 10027a4:	29 d0                	sub    eax,edx
 10027a6:	29 c1                	sub    ecx,eax
 10027a8:	89 4e 18             	mov    DWORD PTR [esi+0x18],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:91
}

struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
  time_t time = *timer;
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;
 10027ab:	b9 b2 07 00 00       	mov    ecx,0x7b2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 10027b0:	bd 1f 85 eb 51       	mov    ebp,0x51eb851f
 10027b5:	eb 53                	jmp    100280a <gmtime_r+0xec>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 1)
    dayno -= YEARSIZE(year);
 10027b7:	89 c8                	mov    eax,ecx
 10027b9:	f7 ed                	imul   ebp
 10027bb:	c1 fa 05             	sar    edx,0x5
 10027be:	89 c8                	mov    eax,ecx
 10027c0:	c1 f8 1f             	sar    eax,0x1f
 10027c3:	29 c2                	sub    edx,eax
 10027c5:	6b d2 64             	imul   edx,edx,0x64
 10027c8:	39 d1                	cmp    ecx,edx
 10027ca:	75 26                	jne    10027f2 <gmtime_r+0xd4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 4)
 10027cc:	89 c8                	mov    eax,ecx
 10027ce:	f7 ed                	imul   ebp
 10027d0:	c1 fa 07             	sar    edx,0x7
 10027d3:	89 c8                	mov    eax,ecx
 10027d5:	c1 f8 1f             	sar    eax,0x1f
 10027d8:	29 c2                	sub    edx,eax
 10027da:	69 c2 90 01 00 00    	imul   eax,edx,0x190
 10027e0:	89 cf                	mov    edi,ecx
 10027e2:	29 c7                	sub    edi,eax
 10027e4:	83 ff 01             	cmp    edi,0x1
 10027e7:	19 c0                	sbb    eax,eax
 10027e9:	f7 d0                	not    eax
 10027eb:	05 6e 01 00 00       	add    eax,0x16e
 10027f0:	eb 13                	jmp    1002805 <gmtime_r+0xe7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101
 10027f2:	b8 6e 01 00 00       	mov    eax,0x16e
 10027f7:	eb 0c                	jmp    1002805 <gmtime_r+0xe7>
 10027f9:	b8 6d 01 00 00       	mov    eax,0x16d
 10027fe:	eb 05                	jmp    1002805 <gmtime_r+0xe7>
 1002800:	b8 6e 01 00 00       	mov    eax,0x16e
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 8)
 1002805:	29 c3                	sub    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:102 (discriminator 8)
    year++;
 1002807:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 100280a:	89 cf                	mov    edi,ecx
 100280c:	83 e7 03             	and    edi,0x3
 100280f:	0f 85 d5 00 00 00    	jne    10028ea <gmtime_r+0x1cc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100 (discriminator 1)
 1002815:	89 c8                	mov    eax,ecx
 1002817:	f7 ed                	imul   ebp
 1002819:	c1 fa 05             	sar    edx,0x5
 100281c:	89 c8                	mov    eax,ecx
 100281e:	c1 f8 1f             	sar    eax,0x1f
 1002821:	29 c2                	sub    edx,eax
 1002823:	6b d2 64             	imul   edx,edx,0x64
 1002826:	39 d1                	cmp    ecx,edx
 1002828:	0f 85 0a 01 00 00    	jne    1002938 <gmtime_r+0x21a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100 (discriminator 4)
 100282e:	89 c8                	mov    eax,ecx
 1002830:	f7 ed                	imul   ebp
 1002832:	c1 fa 07             	sar    edx,0x7
 1002835:	89 c8                	mov    eax,ecx
 1002837:	c1 f8 1f             	sar    eax,0x1f
 100283a:	29 c2                	sub    edx,eax
 100283c:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002842:	39 d1                	cmp    ecx,edx
 1002844:	0f 84 03 01 00 00    	je     100294d <gmtime_r+0x22f>
 100284a:	e9 b0 00 00 00       	jmp    10028ff <gmtime_r+0x1e1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:104
    dayno -= YEARSIZE(year);
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
 100284f:	8d 81 94 f8 ff ff    	lea    eax,[ecx-0x76c]
 1002855:	89 46 14             	mov    DWORD PTR [esi+0x14],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:105
  tmbuf->tm_yday = dayno;
 1002858:	89 5e 1c             	mov    DWORD PTR [esi+0x1c],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:106
  tmbuf->tm_mon = 0;
 100285b:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
 1002862:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
 1002867:	89 c8                	mov    eax,ecx
 1002869:	f7 ea                	imul   edx
 100286b:	89 d5                	mov    ebp,edx
 100286d:	c1 fd 05             	sar    ebp,0x5
 1002870:	89 c8                	mov    eax,ecx
 1002872:	c1 f8 1f             	sar    eax,0x1f
 1002875:	29 c5                	sub    ebp,eax
 1002877:	6b ed 64             	imul   ebp,ebp,0x64
 100287a:	89 cf                	mov    edi,ecx
 100287c:	29 ef                	sub    edi,ebp
 100287e:	89 fd                	mov    ebp,edi
 1002880:	c1 fa 07             	sar    edx,0x7
 1002883:	29 c2                	sub    edx,eax
 1002885:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 100288b:	29 d1                	sub    ecx,edx
 100288d:	89 0c 24             	mov    DWORD PTR [esp],ecx
 1002890:	8b 7c 24 04          	mov    edi,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 1002894:	eb 40                	jmp    10028d6 <gmtime_r+0x1b8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 1)
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
 1002896:	85 ed                	test   ebp,ebp
 1002898:	75 0d                	jne    10028a7 <gmtime_r+0x189>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 4)
 100289a:	83 3c 24 00          	cmp    DWORD PTR [esp],0x0
 100289e:	74 0e                	je     10028ae <gmtime_r+0x190>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 6)
 10028a0:	ba 00 00 00 00       	mov    edx,0x0
 10028a5:	eb 1a                	jmp    10028c1 <gmtime_r+0x1a3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108
 10028a7:	ba 01 00 00 00       	mov    edx,0x1
 10028ac:	eb 13                	jmp    10028c1 <gmtime_r+0x1a3>
 10028ae:	ba 01 00 00 00       	mov    edx,0x1
 10028b3:	eb 0c                	jmp    10028c1 <gmtime_r+0x1a3>
 10028b5:	ba 01 00 00 00       	mov    edx,0x1
 10028ba:	eb 05                	jmp    10028c1 <gmtime_r+0x1a3>
 10028bc:	ba 01 00 00 00       	mov    edx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 8)
 10028c1:	8d 0c 12             	lea    ecx,[edx+edx*1]
 10028c4:	01 ca                	add    edx,ecx
 10028c6:	8d 14 90             	lea    edx,[eax+edx*4]
 10028c9:	2b 1c 95 00 50 00 01 	sub    ebx,DWORD PTR [edx*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:109 (discriminator 8)
    tmbuf->tm_mon++;
 10028d0:	83 c0 01             	add    eax,0x1
 10028d3:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 10028d6:	85 ff                	test   edi,edi
 10028d8:	75 4c                	jne    1002926 <gmtime_r+0x208>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107 (discriminator 1)
 10028da:	85 ed                	test   ebp,ebp
 10028dc:	0f 85 92 00 00 00    	jne    1002974 <gmtime_r+0x256>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107 (discriminator 4)
 10028e2:	83 3c 24 00          	cmp    DWORD PTR [esp],0x0
 10028e6:	74 7a                	je     1002962 <gmtime_r+0x244>
 10028e8:	eb 2a                	jmp    1002914 <gmtime_r+0x1f6>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 10028ea:	81 fb 6c 01 00 00    	cmp    ebx,0x16c
 10028f0:	0f 87 03 ff ff ff    	ja     10027f9 <gmtime_r+0xdb>
 10028f6:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 10028fa:	e9 50 ff ff ff       	jmp    100284f <gmtime_r+0x131>
 10028ff:	81 fb 6c 01 00 00    	cmp    ebx,0x16c
 1002905:	0f 87 ac fe ff ff    	ja     10027b7 <gmtime_r+0x99>
 100290b:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 100290f:	e9 3b ff ff ff       	jmp    100284f <gmtime_r+0x131>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 1002914:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 1002917:	3b 1c 85 00 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005000]
 100291e:	0f 83 72 ff ff ff    	jae    1002896 <gmtime_r+0x178>
 1002924:	eb 5e                	jmp    1002984 <gmtime_r+0x266>
 1002926:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 1002929:	3b 1c 85 00 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005000]
 1002930:	0f 83 6a ff ff ff    	jae    10028a0 <gmtime_r+0x182>
 1002936:	eb 4c                	jmp    1002984 <gmtime_r+0x266>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 1002938:	81 fb 6d 01 00 00    	cmp    ebx,0x16d
 100293e:	0f 87 bc fe ff ff    	ja     1002800 <gmtime_r+0xe2>
 1002944:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 1002948:	e9 02 ff ff ff       	jmp    100284f <gmtime_r+0x131>
 100294d:	81 fb 6d 01 00 00    	cmp    ebx,0x16d
 1002953:	0f 87 73 fe ff ff    	ja     10027cc <gmtime_r+0xae>
 1002959:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 100295d:	e9 ed fe ff ff       	jmp    100284f <gmtime_r+0x131>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 1002962:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 1002965:	3b 1c 85 30 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005030]
 100296c:	0f 83 43 ff ff ff    	jae    10028b5 <gmtime_r+0x197>
 1002972:	eb 10                	jmp    1002984 <gmtime_r+0x266>
 1002974:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 1002977:	3b 1c 85 30 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005030]
 100297e:	0f 83 38 ff ff ff    	jae    10028bc <gmtime_r+0x19e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:111
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
    tmbuf->tm_mon++;
  }
  tmbuf->tm_mday = dayno + 1;
 1002984:	83 c3 01             	add    ebx,0x1
 1002987:	89 5e 0c             	mov    DWORD PTR [esi+0xc],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:112
  tmbuf->tm_isdst = 0;
 100298a:	c7 46 20 00 00 00 00 	mov    DWORD PTR [esi+0x20],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:114
  return tmbuf;
}
 1002991:	89 f0                	mov    eax,esi
 1002993:	83 c4 08             	add    esp,0x8
 1002996:	5b                   	pop    ebx
 1002997:	5e                   	pop    esi
 1002998:	5f                   	pop    edi
 1002999:	5d                   	pop    ebp
 100299a:	c3                   	ret    

0100299b <localtime>:
localtime():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:116

struct tm *localtime(const time_t *timer) {
 100299b:	83 ec 30             	sub    esp,0x30
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:120
  time_t t;
  struct tm tmbuf;
  
  t = *timer - kTimeZone;
 100299e:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
 10029a2:	8b 00                	mov    eax,DWORD PTR [eax]
 10029a4:	2b 05 90 02 12 00    	sub    eax,DWORD PTR ds:0x120290
 10029aa:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:121
  return gmtime_r(&t, &tmbuf);
 10029ae:	54                   	push   esp
 10029af:	8d 44 24 30          	lea    eax,[esp+0x30]
 10029b3:	50                   	push   eax
 10029b4:	e8 65 fd ff ff       	call   100271e <gmtime_r>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:122
}
 10029b9:	83 c4 38             	add    esp,0x38
 10029bc:	c3                   	ret    

010029bd <localtime_r>:
localtime_r():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:124

struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
 10029bd:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:127
  time_t t;

  t = *timer - kTimeZone;
 10029c0:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
 10029c4:	8b 00                	mov    eax,DWORD PTR [eax]
 10029c6:	2b 05 90 02 12 00    	sub    eax,DWORD PTR ds:0x120290
 10029cc:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:128
  return gmtime_r(&t, tmbuf);
 10029d0:	ff 74 24 18          	push   DWORD PTR [esp+0x18]
 10029d4:	8d 44 24 10          	lea    eax,[esp+0x10]
 10029d8:	50                   	push   eax
 10029d9:	e8 40 fd ff ff       	call   100271e <gmtime_r>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:129
}
 10029de:	83 c4 18             	add    esp,0x18
 10029e1:	c3                   	ret    

010029e2 <mktime>:
mktime():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:131

time_t mktime(struct tm *tmbuf) {
 10029e2:	55                   	push   ebp
 10029e3:	57                   	push   edi
 10029e4:	56                   	push   esi
 10029e5:	53                   	push   ebx
 10029e6:	83 ec 20             	sub    esp,0x20
 10029e9:	8b 5c 24 34          	mov    ebx,DWORD PTR [esp+0x34]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:139
  int yday, month;
  /*unsigned*/ long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
 10029ed:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 10029ef:	ba 89 88 88 88       	mov    edx,0x88888889
 10029f4:	89 c8                	mov    eax,ecx
 10029f6:	f7 ea                	imul   edx
 10029f8:	8d 04 0a             	lea    eax,[edx+ecx*1]
 10029fb:	c1 f8 05             	sar    eax,0x5
 10029fe:	89 ca                	mov    edx,ecx
 1002a00:	c1 fa 1f             	sar    edx,0x1f
 1002a03:	29 d0                	sub    eax,edx
 1002a05:	89 c2                	mov    edx,eax
 1002a07:	03 53 04             	add    edx,DWORD PTR [ebx+0x4]
 1002a0a:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:140
  tmbuf->tm_sec %= 60;
 1002a0d:	6b c0 3c             	imul   eax,eax,0x3c
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:141
  if (tmbuf->tm_sec < 0) {
 1002a10:	29 c1                	sub    ecx,eax
 1002a12:	78 04                	js     1002a18 <mktime+0x36>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:140
  /*unsigned*/ long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
  tmbuf->tm_sec %= 60;
 1002a14:	89 0b                	mov    DWORD PTR [ebx],ecx
 1002a16:	eb 0b                	jmp    1002a23 <mktime+0x41>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:142
  if (tmbuf->tm_sec < 0) {
    tmbuf->tm_sec += 60;
 1002a18:	83 c1 3c             	add    ecx,0x3c
 1002a1b:	89 0b                	mov    DWORD PTR [ebx],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:143
    tmbuf->tm_min--;
 1002a1d:	83 ea 01             	sub    edx,0x1
 1002a20:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:145
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
 1002a23:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
 1002a26:	ba 89 88 88 88       	mov    edx,0x88888889
 1002a2b:	89 c8                	mov    eax,ecx
 1002a2d:	f7 ea                	imul   edx
 1002a2f:	8d 04 0a             	lea    eax,[edx+ecx*1]
 1002a32:	c1 f8 05             	sar    eax,0x5
 1002a35:	89 ca                	mov    edx,ecx
 1002a37:	c1 fa 1f             	sar    edx,0x1f
 1002a3a:	29 d0                	sub    eax,edx
 1002a3c:	89 c2                	mov    edx,eax
 1002a3e:	03 53 08             	add    edx,DWORD PTR [ebx+0x8]
 1002a41:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:146
  tmbuf->tm_min = tmbuf->tm_min % 60;
 1002a44:	6b c0 3c             	imul   eax,eax,0x3c
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:147
  if (tmbuf->tm_min < 0) {
 1002a47:	29 c1                	sub    ecx,eax
 1002a49:	78 05                	js     1002a50 <mktime+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:146
  if (tmbuf->tm_sec < 0) {
    tmbuf->tm_sec += 60;
    tmbuf->tm_min--;
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
  tmbuf->tm_min = tmbuf->tm_min % 60;
 1002a4b:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
 1002a4e:	eb 0c                	jmp    1002a5c <mktime+0x7a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:148
  if (tmbuf->tm_min < 0) {
    tmbuf->tm_min += 60;
 1002a50:	83 c1 3c             	add    ecx,0x3c
 1002a53:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:149
    tmbuf->tm_hour--;
 1002a56:	83 ea 01             	sub    edx,0x1
 1002a59:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:151
  }
  day = tmbuf->tm_hour / 24;
 1002a5c:	8b 73 08             	mov    esi,DWORD PTR [ebx+0x8]
 1002a5f:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
 1002a64:	89 f0                	mov    eax,esi
 1002a66:	f7 ea                	imul   edx
 1002a68:	c1 fa 02             	sar    edx,0x2
 1002a6b:	89 f0                	mov    eax,esi
 1002a6d:	c1 f8 1f             	sar    eax,0x1f
 1002a70:	89 d1                	mov    ecx,edx
 1002a72:	29 c1                	sub    ecx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:152
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
 1002a74:	8d 04 49             	lea    eax,[ecx+ecx*2]
 1002a77:	c1 e0 03             	shl    eax,0x3
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:153
  if (tmbuf->tm_hour < 0) {
 1002a7a:	29 c6                	sub    esi,eax
 1002a7c:	78 05                	js     1002a83 <mktime+0xa1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:152
  if (tmbuf->tm_min < 0) {
    tmbuf->tm_min += 60;
    tmbuf->tm_hour--;
  }
  day = tmbuf->tm_hour / 24;
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
 1002a7e:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
 1002a81:	eb 09                	jmp    1002a8c <mktime+0xaa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:154
  if (tmbuf->tm_hour < 0) {
    tmbuf->tm_hour += 24;
 1002a83:	83 c6 18             	add    esi,0x18
 1002a86:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:155
    day--;
 1002a89:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:157
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
 1002a8c:	8b 73 10             	mov    esi,DWORD PTR [ebx+0x10]
 1002a8f:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
 1002a94:	89 f0                	mov    eax,esi
 1002a96:	f7 ea                	imul   edx
 1002a98:	d1 fa                	sar    edx,1
 1002a9a:	89 f0                	mov    eax,esi
 1002a9c:	c1 f8 1f             	sar    eax,0x1f
 1002a9f:	29 c2                	sub    edx,eax
 1002aa1:	89 d0                	mov    eax,edx
 1002aa3:	03 43 14             	add    eax,DWORD PTR [ebx+0x14]
 1002aa6:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:158
  tmbuf->tm_mon %= 12;
 1002aa9:	8d 14 52             	lea    edx,[edx+edx*2]
 1002aac:	c1 e2 02             	shl    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:159
  if (tmbuf->tm_mon < 0) {
 1002aaf:	29 d6                	sub    esi,edx
 1002ab1:	78 05                	js     1002ab8 <mktime+0xd6>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:158
  if (tmbuf->tm_hour < 0) {
    tmbuf->tm_hour += 24;
    day--;
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
  tmbuf->tm_mon %= 12;
 1002ab3:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
 1002ab6:	eb 0c                	jmp    1002ac4 <mktime+0xe2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:160
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
 1002ab8:	83 c6 0c             	add    esi,0xc
 1002abb:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:161
    tmbuf->tm_year--;
 1002abe:	83 e8 01             	sub    eax,0x1
 1002ac1:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:163
  }
  day += (tmbuf->tm_mday - 1);
 1002ac4:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
 1002ac7:	8d 6c 01 ff          	lea    ebp,[ecx+eax*1-0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:164
  while (day < 0) {
 1002acb:	85 ed                	test   ebp,ebp
 1002acd:	0f 89 f1 00 00 00    	jns    1002bc4 <mktime+0x1e2>
 1002ad3:	8b 73 10             	mov    esi,DWORD PTR [ebx+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169
    if(--tmbuf->tm_mon < 0) {
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002ad6:	bf 1f 85 eb 51       	mov    edi,0x51eb851f
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:165
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
    if(--tmbuf->tm_mon < 0) {
 1002adb:	83 ee 01             	sub    esi,0x1
 1002ade:	79 09                	jns    1002ae9 <mktime+0x107>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:166
      tmbuf->tm_year--;
 1002ae0:	83 6b 14 01          	sub    DWORD PTR [ebx+0x14],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:167
      tmbuf->tm_mon = 11;
 1002ae4:	be 0b 00 00 00       	mov    esi,0xb
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002ae9:	8b 4b 14             	mov    ecx,DWORD PTR [ebx+0x14]
 1002aec:	b8 00 00 00 00       	mov    eax,0x0
 1002af1:	f6 c1 03             	test   cl,0x3
 1002af4:	75 3c                	jne    1002b32 <mktime+0x150>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 1)
 1002af6:	81 c1 6c 07 00 00    	add    ecx,0x76c
 1002afc:	89 c8                	mov    eax,ecx
 1002afe:	f7 ef                	imul   edi
 1002b00:	c1 fa 05             	sar    edx,0x5
 1002b03:	89 c8                	mov    eax,ecx
 1002b05:	c1 f8 1f             	sar    eax,0x1f
 1002b08:	29 c2                	sub    edx,eax
 1002b0a:	6b d2 64             	imul   edx,edx,0x64
 1002b0d:	b8 01 00 00 00       	mov    eax,0x1
 1002b12:	39 d1                	cmp    ecx,edx
 1002b14:	75 1c                	jne    1002b32 <mktime+0x150>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 4)
 1002b16:	89 c8                	mov    eax,ecx
 1002b18:	f7 ef                	imul   edi
 1002b1a:	c1 fa 07             	sar    edx,0x7
 1002b1d:	89 c8                	mov    eax,ecx
 1002b1f:	c1 f8 1f             	sar    eax,0x1f
 1002b22:	29 c2                	sub    edx,eax
 1002b24:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002b2a:	39 d1                	cmp    ecx,edx
 1002b2c:	0f 94 c0             	sete   al
 1002b2f:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 8)
 1002b32:	8d 14 00             	lea    edx,[eax+eax*1]
 1002b35:	01 d0                	add    eax,edx
 1002b37:	8d 04 86             	lea    eax,[esi+eax*4]
 1002b3a:	03 2c 85 00 50 00 01 	add    ebp,DWORD PTR [eax*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:164 (discriminator 8)
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
 1002b41:	85 ed                	test   ebp,ebp
 1002b43:	78 96                	js     1002adb <mktime+0xf9>
 1002b45:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
 1002b48:	eb 7a                	jmp    1002bc4 <mktime+0x1e2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 1)
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002b4a:	8d be 6c 07 00 00    	lea    edi,[esi+0x76c]
 1002b50:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002b55:	f7 ef                	imul   edi
 1002b57:	c1 fa 05             	sar    edx,0x5
 1002b5a:	89 f8                	mov    eax,edi
 1002b5c:	c1 f8 1f             	sar    eax,0x1f
 1002b5f:	29 c2                	sub    edx,eax
 1002b61:	6b d2 64             	imul   edx,edx,0x64
 1002b64:	39 d7                	cmp    edi,edx
 1002b66:	75 27                	jne    1002b8f <mktime+0x1ad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 4)
 1002b68:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002b6d:	f7 ef                	imul   edi
 1002b6f:	c1 fa 07             	sar    edx,0x7
 1002b72:	89 f8                	mov    eax,edi
 1002b74:	c1 f8 1f             	sar    eax,0x1f
 1002b77:	29 c2                	sub    edx,eax
 1002b79:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002b7f:	b8 01 00 00 00       	mov    eax,0x1
 1002b84:	39 d7                	cmp    edi,edx
 1002b86:	74 13                	je     1002b9b <mktime+0x1b9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 6)
 1002b88:	b8 00 00 00 00       	mov    eax,0x0
 1002b8d:	eb 0c                	jmp    1002b9b <mktime+0x1b9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172
 1002b8f:	b8 01 00 00 00       	mov    eax,0x1
 1002b94:	eb 05                	jmp    1002b9b <mktime+0x1b9>
 1002b96:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 8)
 1002b9b:	8d 14 00             	lea    edx,[eax+eax*1]
 1002b9e:	01 d0                	add    eax,edx
 1002ba0:	8d 04 81             	lea    eax,[ecx+eax*4]
 1002ba3:	2b 2c 85 00 50 00 01 	sub    ebp,DWORD PTR [eax*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:173 (discriminator 8)
    if (++(tmbuf->tm_mon) == 12) {
 1002baa:	83 c1 01             	add    ecx,0x1
 1002bad:	83 f9 0c             	cmp    ecx,0xc
 1002bb0:	74 05                	je     1002bb7 <mktime+0x1d5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:173
 1002bb2:	89 4b 10             	mov    DWORD PTR [ebx+0x10],ecx
 1002bb5:	eb 0d                	jmp    1002bc4 <mktime+0x1e2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:174
      tmbuf->tm_mon = 0;
 1002bb7:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:175
      tmbuf->tm_year++;
 1002bbe:	83 c6 01             	add    esi,0x1
 1002bc1:	89 73 14             	mov    DWORD PTR [ebx+0x14],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002bc4:	8b 73 14             	mov    esi,DWORD PTR [ebx+0x14]
 1002bc7:	f7 c6 03 00 00 00    	test   esi,0x3
 1002bcd:	0f 85 ad 02 00 00    	jne    1002e80 <mktime+0x49e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171 (discriminator 1)
 1002bd3:	8d 8e 6c 07 00 00    	lea    ecx,[esi+0x76c]
 1002bd9:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002bde:	f7 e9                	imul   ecx
 1002be0:	c1 fa 05             	sar    edx,0x5
 1002be3:	89 c8                	mov    eax,ecx
 1002be5:	c1 f8 1f             	sar    eax,0x1f
 1002be8:	29 c2                	sub    edx,eax
 1002bea:	6b d2 64             	imul   edx,edx,0x64
 1002bed:	39 d1                	cmp    ecx,edx
 1002bef:	0f 85 b5 02 00 00    	jne    1002eaa <mktime+0x4c8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171 (discriminator 4)
 1002bf5:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002bfa:	f7 e9                	imul   ecx
 1002bfc:	c1 fa 07             	sar    edx,0x7
 1002bff:	89 c8                	mov    eax,ecx
 1002c01:	c1 f8 1f             	sar    eax,0x1f
 1002c04:	29 c2                	sub    edx,eax
 1002c06:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002c0c:	39 d1                	cmp    ecx,edx
 1002c0e:	0f 84 b6 02 00 00    	je     1002eca <mktime+0x4e8>
 1002c14:	e9 7c 02 00 00       	jmp    1002e95 <mktime+0x4b3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:178
    if (++(tmbuf->tm_mon) == 12) {
      tmbuf->tm_mon = 0;
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
 1002c19:	8d 45 01             	lea    eax,[ebp+0x1]
 1002c1c:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:180
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
 1002c1f:	83 fe 45             	cmp    esi,0x45
 1002c22:	0f 8e 51 02 00 00    	jle    1002e79 <mktime+0x497>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:190
  // Assume that when day becomes negative, there will certainly
  // be overflow on seconds.
  // The check for overflow needs not to be done for leapyears
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;
 1002c28:	8d 86 6c 07 00 00    	lea    eax,[esi+0x76c]
 1002c2e:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:192

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
 1002c32:	8d 46 ba             	lea    eax,[esi-0x46]
 1002c35:	89 c7                	mov    edi,eax
 1002c37:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:183
  tmbuf->tm_mday = day + 1;
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
  seconds = 0;
  day = 0;                      // Means days since day 0 now
  overflow = 0;
 1002c3b:	3d 7c c6 59 00       	cmp    eax,0x59c67c
 1002c40:	0f 9f c0             	setg   al
 1002c43:	0f b6 c0             	movzx  eax,al
 1002c46:	89 c2                	mov    edx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:193
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
  day = (tm_year - year) * 365;
 1002c48:	89 f8                	mov    eax,edi
 1002c4a:	69 ff 6d 01 00 00    	imul   edi,edi,0x16d
 1002c50:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:194
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
 1002c54:	8d 7e bd             	lea    edi,[esi-0x43]
 1002c57:	85 c0                	test   eax,eax
 1002c59:	0f 49 f8             	cmovns edi,eax
 1002c5c:	c1 ff 02             	sar    edi,0x2
 1002c5f:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
 1002c64:	2b 44 24 04          	sub    eax,DWORD PTR [esp+0x4]
 1002c68:	8d 77 01             	lea    esi,[edi+0x1]
 1002c6b:	89 14 24             	mov    DWORD PTR [esp],edx
 1002c6e:	83 ca 02             	or     edx,0x2
 1002c71:	39 f0                	cmp    eax,esi
 1002c73:	89 d6                	mov    esi,edx
 1002c75:	0f 4d 34 24          	cmovge esi,DWORD PTR [esp]
 1002c79:	89 34 24             	mov    DWORD PTR [esp],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:195
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
 1002c7c:	b8 00 00 00 00       	mov    eax,0x0
 1002c81:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 1002c85:	89 d6                	mov    esi,edx
 1002c87:	83 e6 03             	and    esi,0x3
 1002c8a:	89 74 24 1c          	mov    DWORD PTR [esp+0x1c],esi
 1002c8e:	74 19                	je     1002ca9 <mktime+0x2c7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:195 (discriminator 1)
 1002c90:	89 d6                	mov    esi,edx
 1002c92:	c1 fa 1f             	sar    edx,0x1f
 1002c95:	c1 ea 1e             	shr    edx,0x1e
 1002c98:	8d 04 16             	lea    eax,[esi+edx*1]
 1002c9b:	83 e0 03             	and    eax,0x3
 1002c9e:	29 d0                	sub    eax,edx
 1002ca0:	83 f8 01             	cmp    eax,0x1
 1002ca3:	0f 9e c0             	setle  al
 1002ca6:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:195 (discriminator 6)
 1002ca9:	01 c7                	add    edi,eax
 1002cab:	03 7c 24 04          	add    edi,DWORD PTR [esp+0x4]
 1002caf:	89 7c 24 10          	mov    DWORD PTR [esp+0x10],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:196 (discriminator 6)
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
 1002cb3:	bf 1f 85 eb 51       	mov    edi,0x51eb851f
 1002cb8:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1002cbc:	f7 ef                	imul   edi
 1002cbe:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
 1002cc2:	89 d0                	mov    eax,edx
 1002cc4:	c1 f8 05             	sar    eax,0x5
 1002cc7:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 1002ccb:	89 d6                	mov    esi,edx
 1002ccd:	c1 fe 1f             	sar    esi,0x1f
 1002cd0:	89 74 24 18          	mov    DWORD PTR [esp+0x18],esi
 1002cd4:	29 f0                	sub    eax,esi
 1002cd6:	6b c0 64             	imul   eax,eax,0x64
 1002cd9:	29 c2                	sub    edx,eax
 1002cdb:	89 d0                	mov    eax,edx
 1002cdd:	0f 95 44 24 04       	setne  BYTE PTR [esp+0x4]
 1002ce2:	0f b6 54 24 04       	movzx  edx,BYTE PTR [esp+0x4]
 1002ce7:	83 f8 45             	cmp    eax,0x45
 1002cea:	0f 9e c0             	setle  al
 1002ced:	0f b6 c0             	movzx  eax,al
 1002cf0:	89 c6                	mov    esi,eax
 1002cf2:	21 d6                	and    esi,edx
 1002cf4:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1002cf8:	f7 ef                	imul   edi
 1002cfa:	89 d7                	mov    edi,edx
 1002cfc:	c1 ff 05             	sar    edi,0x5
 1002cff:	89 f8                	mov    eax,edi
 1002d01:	8b 7c 24 0c          	mov    edi,DWORD PTR [esp+0xc]
 1002d05:	c1 ff 1f             	sar    edi,0x1f
 1002d08:	89 7c 24 0c          	mov    DWORD PTR [esp+0xc],edi
 1002d0c:	29 f8                	sub    eax,edi
 1002d0e:	01 c6                	add    esi,eax
 1002d10:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
 1002d14:	29 f7                	sub    edi,esi
 1002d16:	89 fe                	mov    esi,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:197 (discriminator 6)
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);
 1002d18:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
 1002d1c:	c1 f8 07             	sar    eax,0x7
 1002d1f:	89 c7                	mov    edi,eax
 1002d21:	2b 7c 24 18          	sub    edi,DWORD PTR [esp+0x18]
 1002d25:	69 c7 90 01 00 00    	imul   eax,edi,0x190
 1002d2b:	8b 7c 24 08          	mov    edi,DWORD PTR [esp+0x8]
 1002d2f:	29 c7                	sub    edi,eax
 1002d31:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
 1002d35:	81 ff 71 01 00 00    	cmp    edi,0x171
 1002d3b:	0f 9e 44 24 10       	setle  BYTE PTR [esp+0x10]
 1002d40:	85 ff                	test   edi,edi
 1002d42:	0f 95 c0             	setne  al
 1002d45:	0f b6 c0             	movzx  eax,al
 1002d48:	23 44 24 10          	and    eax,DWORD PTR [esp+0x10]
 1002d4c:	c1 fa 07             	sar    edx,0x7
 1002d4f:	2b 54 24 0c          	sub    edx,DWORD PTR [esp+0xc]
 1002d53:	01 c2                	add    edx,eax
 1002d55:	8d 04 32             	lea    eax,[edx+esi*1]
 1002d58:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:200 (discriminator 6)

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
 1002d5c:	85 c9                	test   ecx,ecx
 1002d5e:	7e 46                	jle    1002da6 <mktime+0x3c4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:200
 1002d60:	be 00 00 00 00       	mov    esi,0x0
 1002d65:	bf 00 00 00 00       	mov    edi,0x0
 1002d6a:	89 6c 24 10          	mov    DWORD PTR [esp+0x10],ebp
 1002d6e:	8b 6c 24 1c          	mov    ebp,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:201
    yday += _ytab[LEAPYEAR(tm_year)][month];
 1002d72:	b8 00 00 00 00       	mov    eax,0x0
 1002d77:	85 ed                	test   ebp,ebp
 1002d79:	75 0f                	jne    1002d8a <mktime+0x3a8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:201 (discriminator 4)
 1002d7b:	83 7c 24 08 00       	cmp    DWORD PTR [esp+0x8],0x0
 1002d80:	0f 94 c0             	sete   al
 1002d83:	0a 44 24 04          	or     al,BYTE PTR [esp+0x4]
 1002d87:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:201 (discriminator 8)
 1002d8a:	8d 14 00             	lea    edx,[eax+eax*1]
 1002d8d:	01 d0                	add    eax,edx
 1002d8f:	8d 04 86             	lea    eax,[esi+eax*4]
 1002d92:	03 3c 85 00 50 00 01 	add    edi,DWORD PTR [eax*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:202 (discriminator 8)
    month++;
 1002d99:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:200 (discriminator 8)
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
 1002d9c:	39 ce                	cmp    esi,ecx
 1002d9e:	75 d2                	jne    1002d72 <mktime+0x390>
 1002da0:	8b 6c 24 10          	mov    ebp,DWORD PTR [esp+0x10]
 1002da4:	eb 05                	jmp    1002dab <mktime+0x3c9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:199
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
 1002da6:	bf 00 00 00 00       	mov    edi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:204
  while (month < tmbuf->tm_mon) {
    yday += _ytab[LEAPYEAR(tm_year)][month];
    month++;
  }
  yday += (tmbuf->tm_mday - 1);
 1002dab:	01 ef                	add    edi,ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:205
  if (day + yday < 0) overflow|=4;
 1002dad:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
 1002db1:	01 fe                	add    esi,edi
 1002db3:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
 1002db6:	89 c8                	mov    eax,ecx
 1002db8:	83 c8 04             	or     eax,0x4
 1002dbb:	85 f6                	test   esi,esi
 1002dbd:	0f 49 c1             	cmovns eax,ecx
 1002dc0:	89 c5                	mov    ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:208
  day += yday;

  tmbuf->tm_yday = yday;
 1002dc2:	89 7b 1c             	mov    DWORD PTR [ebx+0x1c],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:209
  tmbuf->tm_wday = (day + 4) % 7;               // Day 0 was thursday (4)
 1002dc5:	8d 4e 04             	lea    ecx,[esi+0x4]
 1002dc8:	ba 93 24 49 92       	mov    edx,0x92492493
 1002dcd:	89 c8                	mov    eax,ecx
 1002dcf:	f7 ea                	imul   edx
 1002dd1:	01 ca                	add    edx,ecx
 1002dd3:	c1 fa 02             	sar    edx,0x2
 1002dd6:	89 c8                	mov    eax,ecx
 1002dd8:	c1 f8 1f             	sar    eax,0x1f
 1002ddb:	29 c2                	sub    edx,eax
 1002ddd:	8d 04 d5 00 00 00 00 	lea    eax,[edx*8+0x0]
 1002de4:	29 d0                	sub    eax,edx
 1002de6:	29 c1                	sub    ecx,eax
 1002de8:	89 4b 18             	mov    DWORD PTR [ebx+0x18],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:211

  seconds = ((tmbuf->tm_hour * 60L) + tmbuf->tm_min) * 60L + tmbuf->tm_sec;
 1002deb:	6b 4b 08 3c          	imul   ecx,DWORD PTR [ebx+0x8],0x3c
 1002def:	03 4b 04             	add    ecx,DWORD PTR [ebx+0x4]
 1002df2:	6b c9 3c             	imul   ecx,ecx,0x3c
 1002df5:	03 0b                	add    ecx,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:213

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
 1002df7:	bf ff ff ff 7f       	mov    edi,0x7fffffff
 1002dfc:	29 cf                	sub    edi,ecx
 1002dfe:	ba 07 45 2e c2       	mov    edx,0xc22e4507
 1002e03:	89 f8                	mov    eax,edi
 1002e05:	f7 ea                	imul   edx
 1002e07:	01 fa                	add    edx,edi
 1002e09:	c1 fa 10             	sar    edx,0x10
 1002e0c:	c1 ff 1f             	sar    edi,0x1f
 1002e0f:	29 fa                	sub    edx,edi
 1002e11:	89 e8                	mov    eax,ebp
 1002e13:	83 c8 08             	or     eax,0x8
 1002e16:	39 d6                	cmp    esi,edx
 1002e18:	0f 4e c5             	cmovle eax,ebp
 1002e1b:	89 04 24             	mov    DWORD PTR [esp],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:214
  seconds += day * SECS_DAY;
 1002e1e:	69 f6 80 51 01 00    	imul   esi,esi,0x15180
 1002e24:	01 f1                	add    ecx,esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:217

  // Now adjust according to timezone and daylight saving time
  if (((kTimeZone > 0) && (TIME_MAX - kTimeZone < seconds)) || 
 1002e26:	a1 90 02 12 00       	mov    eax,ds:0x120290
 1002e2b:	85 c0                	test   eax,eax
 1002e2d:	7e 0b                	jle    1002e3a <mktime+0x458>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:217 (discriminator 1)
 1002e2f:	ba ff ff ff 7f       	mov    edx,0x7fffffff
 1002e34:	29 c2                	sub    edx,eax
 1002e36:	39 d1                	cmp    ecx,edx
 1002e38:	7f 0c                	jg     1002e46 <mktime+0x464>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:217 (discriminator 3)
 1002e3a:	85 c0                	test   eax,eax
 1002e3c:	79 0c                	jns    1002e4a <mktime+0x468>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:218
      ((kTimeZone < 0) && (seconds < -kTimeZone))) {
 1002e3e:	89 c2                	mov    edx,eax
 1002e40:	f7 da                	neg    edx
 1002e42:	39 d1                	cmp    ecx,edx
 1002e44:	7d 04                	jge    1002e4a <mktime+0x468>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:219
          overflow|=16;
 1002e46:	83 0c 24 10          	or     DWORD PTR [esp],0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:221
  }
  seconds += kTimeZone;
 1002e4a:	01 c1                	add    ecx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:224

  if (tmbuf->tm_isdst) {
    dst = _dstbias;
 1002e4c:	83 7b 20 00          	cmp    DWORD PTR [ebx+0x20],0x0
 1002e50:	ba 00 00 00 00       	mov    edx,0x0
 1002e55:	0f 45 15 2c 04 12 00 	cmovne edx,DWORD PTR ds:0x12042c
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:229
  } else {
    dst = 0;
  }

  if (dst > seconds) overflow|=32;        // dst is always non-negative
 1002e5c:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 1002e5f:	89 d8                	mov    eax,ebx
 1002e61:	83 c8 20             	or     eax,0x20
 1002e64:	39 ca                	cmp    edx,ecx
 1002e66:	0f 4e c3             	cmovle eax,ebx
 1002e69:	89 c7                	mov    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:232
  seconds -= dst;

  if (overflow) return (time_t) overflow-2;
 1002e6b:	89 f8                	mov    eax,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:235

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
 1002e6d:	29 d1                	sub    ecx,edx
 1002e6f:	83 e8 02             	sub    eax,0x2
 1002e72:	85 ff                	test   edi,edi
 1002e74:	0f 44 c1             	cmove  eax,ecx
 1002e77:	eb 62                	jmp    1002edb <mktime+0x4f9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:180
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
 1002e79:	b8 19 fc ff ff       	mov    eax,0xfffffc19
 1002e7e:	eb 5b                	jmp    1002edb <mktime+0x4f9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002e80:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e83:	3b 2c 8d 00 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005000]
 1002e8a:	0f 8d f8 fc ff ff    	jge    1002b88 <mktime+0x1a6>
 1002e90:	e9 84 fd ff ff       	jmp    1002c19 <mktime+0x237>
 1002e95:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e98:	3b 2c 8d 00 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005000]
 1002e9f:	0f 8d a5 fc ff ff    	jge    1002b4a <mktime+0x168>
 1002ea5:	e9 6f fd ff ff       	jmp    1002c19 <mktime+0x237>
 1002eaa:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002ead:	3b 2c 8d 30 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005030]
 1002eb4:	0f 8d dc fc ff ff    	jge    1002b96 <mktime+0x1b4>
 1002eba:	e9 5a fd ff ff       	jmp    1002c19 <mktime+0x237>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002ebf:	8d be 6c 07 00 00    	lea    edi,[esi+0x76c]
 1002ec5:	e9 9e fc ff ff       	jmp    1002b68 <mktime+0x186>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002eca:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002ecd:	3b 2c 8d 30 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005030]
 1002ed4:	7d e9                	jge    1002ebf <mktime+0x4dd>
 1002ed6:	e9 3e fd ff ff       	jmp    1002c19 <mktime+0x237>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:236

  if (overflow) return (time_t) overflow-2;

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
}
 1002edb:	83 c4 20             	add    esp,0x20
 1002ede:	5b                   	pop    ebx
 1002edf:	5e                   	pop    esi
 1002ee0:	5f                   	pop    edi
 1002ee1:	5d                   	pop    ebp
 1002ee2:	c3                   	ret    

01002ee3 <_strdate>:
_strdate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:241

#if !defined(KERNEL) && !defined(OS_LIB)


char *_strdate(char *s) {
 1002ee3:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:244
  time_t now;

  time(&now);
 1002ee6:	8d 44 24 0c          	lea    eax,[esp+0xc]
 1002eea:	50                   	push   eax
 1002eeb:	e8 1c f8 ff ff       	call   100270c <time>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:248
  //fix me!
  //  strftime(s, 9, "%D", localtime(&now));
  return s;
}
 1002ef0:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002ef4:	83 c4 14             	add    esp,0x14
 1002ef7:	c3                   	ret    

01002ef8 <_strtime>:
_strtime():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:250

char *_strtime(char *s) {
 1002ef8:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:253
  time_t now;

  time(&now);
 1002efb:	8d 44 24 0c          	lea    eax,[esp+0xc]
 1002eff:	50                   	push   eax
 1002f00:	e8 07 f8 ff ff       	call   100270c <time>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:257
  //fix me
  //  strftime(s, 9, "%T", localtime(&now));
  return s;
}
 1002f05:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002f09:	83 c4 14             	add    esp,0x14
 1002f0c:	c3                   	ret    

01002f0d <waitTicks>:
waitTicks():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:260

void __attribute__((noinline))waitTicks(int TicksToWait)
{
 1002f0d:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:262
    //printf("ttw=%u",ttw);
    if (TicksToWait==0)
 1002f11:	85 c0                	test   eax,eax
 1002f13:	74 09                	je     1002f1e <waitTicks+0x11>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:267 (discriminator 1)
        return;
    //printd(DEBUG_TIMER,"ttw=%08X", TicksToWait);
    do
    {
        __asm("sti\nhlt\n");
 1002f15:	fb                   	sti    
 1002f16:	f4                   	hlt    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:268 (discriminator 1)
        TicksToWait--;
 1002f17:	83 e8 01             	sub    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:269 (discriminator 1)
    } while (TicksToWait>0);
 1002f1a:	85 c0                	test   eax,eax
 1002f1c:	7f f7                	jg     1002f15 <waitTicks+0x8>
 1002f1e:	f3 c3                	repz ret 

01002f20 <wait>:
wait():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:274
    return;
}

void /*__attribute__((noinline))*/wait(int msToWait)
{
 1002f20:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:277
    //printk("msToWait=%u, ticksperms=%u, ticksToWait=%u",msToWait, kTicksPerMS, msToWait*kTicksPerMS);
    //STOPHERE2
    waitTicks(msToWait/kTicksPerMS);
 1002f24:	99                   	cdq    
 1002f25:	f7 3d 84 02 12 00    	idiv   DWORD PTR ds:0x120284
 1002f2b:	50                   	push   eax
 1002f2c:	e8 dc ff ff ff       	call   1002f0d <waitTicks>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:278
}
 1002f31:	83 c4 04             	add    esp,0x4
 1002f34:	c3                   	ret    

01002f35 <wait3>:
wait3():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:281

void wait3(double msToWait)
{
 1002f35:	56                   	push   esi
 1002f36:	53                   	push   ebx
 1002f37:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:282
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);
 1002f3a:	8b 0d 60 02 12 00    	mov    ecx,DWORD PTR ds:0x120260
 1002f40:	8b 19                	mov    ebx,DWORD PTR [ecx]
 1002f42:	8b 35 80 02 12 00    	mov    esi,DWORD PTR ds:0x120280
 1002f48:	dd 44 24 30          	fld    QWORD PTR [esp+0x30]
 1002f4c:	b8 e8 03 00 00       	mov    eax,0x3e8
 1002f51:	ba 00 00 00 00       	mov    edx,0x0
 1002f56:	f7 f6                	div    esi
 1002f58:	89 04 24             	mov    DWORD PTR [esp],eax
 1002f5b:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f62:	00 
 1002f63:	df 2c 24             	fild   QWORD PTR [esp]
 1002f66:	de f9                	fdivp  st(1),st
 1002f68:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1002f6b:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f72:	00 
 1002f73:	df 2c 24             	fild   QWORD PTR [esp]
 1002f76:	de c1                	faddp  st(1),st
 1002f78:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002f7c:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002f80:	dd 5c 24 18          	fstp   QWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:284

while (endTicks > (double)*kTicksSinceStart)
 1002f84:	8b 01                	mov    eax,DWORD PTR [ecx]
 1002f86:	dd 44 24 18          	fld    QWORD PTR [esp+0x18]
 1002f8a:	89 04 24             	mov    DWORD PTR [esp],eax
 1002f8d:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f94:	00 
 1002f95:	df 2c 24             	fild   QWORD PTR [esp]
 1002f98:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002f9c:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002fa0:	d9 c9                	fxch   st(1)
 1002fa2:	df e9                	fucomip st,st(1)
 1002fa4:	dd d8                	fstp   st(0)
 1002fa6:	76 26                	jbe    1002fce <wait3+0x99>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:285
    {__asm__("sti\n hlt\n");}
 1002fa8:	fb                   	sti    
 1002fa9:	f4                   	hlt    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:284

void wait3(double msToWait)
{
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);

while (endTicks > (double)*kTicksSinceStart)
 1002faa:	8b 01                	mov    eax,DWORD PTR [ecx]
 1002fac:	dd 44 24 18          	fld    QWORD PTR [esp+0x18]
 1002fb0:	89 04 24             	mov    DWORD PTR [esp],eax
 1002fb3:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002fba:	00 
 1002fbb:	df 2c 24             	fild   QWORD PTR [esp]
 1002fbe:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002fc2:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002fc6:	d9 c9                	fxch   st(1)
 1002fc8:	df e9                	fucomip st,st(1)
 1002fca:	dd d8                	fstp   st(0)
 1002fcc:	77 da                	ja     1002fa8 <wait3+0x73>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:287
    {__asm__("sti\n hlt\n");}
    
}
 1002fce:	83 c4 24             	add    esp,0x24
 1002fd1:	5b                   	pop    ebx
 1002fd2:	5e                   	pop    esi
 1002fd3:	c3                   	ret    

01002fd4 <wait2>:
wait2():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:290

void wait2(unsigned msToWait)
{
 1002fd4:	57                   	push   edi
 1002fd5:	56                   	push   esi
 1002fd6:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:291
    uint64_t startTicks = *kTicksSinceStart;             //25
 1002fd7:	8b 1d 60 02 12 00    	mov    ebx,DWORD PTR ds:0x120260
 1002fdd:	8b 0b                	mov    ecx,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:292
    unsigned msPerTick = 1000 / kTicksPerSecond;         //18
 1002fdf:	8b 3d 80 02 12 00    	mov    edi,DWORD PTR ds:0x120280
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:294
    uint64_t totalTicksToWait = msToWait/msPerTick;     //4321/18
    uint64_t endTicks = startTicks + totalTicksToWait;
 1002fe5:	b8 e8 03 00 00       	mov    eax,0x3e8
 1002fea:	ba 00 00 00 00       	mov    edx,0x0
 1002fef:	f7 f7                	div    edi
 1002ff1:	89 c6                	mov    esi,eax
 1002ff3:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 1002ff7:	ba 00 00 00 00       	mov    edx,0x0
 1002ffc:	f7 f6                	div    esi
 1002ffe:	89 c6                	mov    esi,eax
 1003000:	bf 00 00 00 00       	mov    edi,0x0
 1003005:	89 c8                	mov    eax,ecx
 1003007:	ba 00 00 00 00       	mov    edx,0x0
 100300c:	01 f0                	add    eax,esi
 100300e:	11 fa                	adc    edx,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:296

    if (endTicks < *kTicksSinceStart)
 1003010:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 1003012:	83 fa 00             	cmp    edx,0x0
 1003015:	77 04                	ja     100301b <wait2+0x47>
 1003017:	39 c8                	cmp    eax,ecx
 1003019:	72 17                	jb     1003032 <wait2+0x5e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:304
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
 100301b:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 100301d:	83 fa 00             	cmp    edx,0x0
 1003020:	77 04                	ja     1003026 <wait2+0x52>
 1003022:	39 c8                	cmp    eax,ecx
 1003024:	76 0c                	jbe    1003032 <wait2+0x5e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:305
    {__asm__("hlt\n");}
 1003026:	f4                   	hlt    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:304
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
 1003027:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 1003029:	83 fa 00             	cmp    edx,0x0
 100302c:	77 f8                	ja     1003026 <wait2+0x52>
 100302e:	39 c8                	cmp    eax,ecx
 1003030:	77 f4                	ja     1003026 <wait2+0x52>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:307
    {__asm__("hlt\n");}
    //printf("done waiting!\n");
}
 1003032:	5b                   	pop    ebx
 1003033:	5e                   	pop    esi
 1003034:	5f                   	pop    edi
 1003035:	c3                   	ret    
 1003036:	66 90                	xchg   ax,ax

01003038 <kbd_handler_generic>:
kbd_handler_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:38
    kbd_handler_generic();
    return;
}

void kbd_handler_generic()
{
 1003038:	53                   	push   ebx
 1003039:	83 ec 08             	sub    esp,0x8
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100303c:	e4 60                	in     al,0x60
kbd_handler_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:44
    unsigned char lKeyControlVal=0;
    unsigned char rawKey=0;
    unsigned char translatedKeypress=0;
   
    rawKey = inb(KEYB_DATA_PORT);
    kKeyChar = rawKey;//& 0x80;
 100303e:	a2 70 3a 01 01       	mov    ds:0x1013a70,al
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:46

    __asm__("cli\n");
 1003043:	fa                   	cli    
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:48
    
    switch(rawKey)  
 1003044:	3c 9d                	cmp    al,0x9d
 1003046:	74 44                	je     100308c <kbd_handler_generic+0x54>
 1003048:	3c 9d                	cmp    al,0x9d
 100304a:	77 0e                	ja     100305a <kbd_handler_generic+0x22>
 100304c:	3c 2a                	cmp    al,0x2a
 100304e:	74 18                	je     1003068 <kbd_handler_generic+0x30>
 1003050:	3c 38                	cmp    al,0x38
 1003052:	74 44                	je     1003098 <kbd_handler_generic+0x60>
 1003054:	3c 1d                	cmp    al,0x1d
 1003056:	75 6e                	jne    10030c6 <kbd_handler_generic+0x8e>
 1003058:	eb 26                	jmp    1003080 <kbd_handler_generic+0x48>
 100305a:	3c b8                	cmp    al,0xb8
 100305c:	74 46                	je     10030a4 <kbd_handler_generic+0x6c>
 100305e:	3c ba                	cmp    al,0xba
 1003060:	74 4e                	je     10030b0 <kbd_handler_generic+0x78>
 1003062:	3c aa                	cmp    al,0xaa
 1003064:	75 60                	jne    10030c6 <kbd_handler_generic+0x8e>
 1003066:	eb 0c                	jmp    1003074 <kbd_handler_generic+0x3c>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:50
    {
        case KEY_SHIFT_DN: kKeyStatus[INDEX_SHIFT]=1;break;
 1003068:	c6 05 48 3a 01 01 01 	mov    BYTE PTR ds:0x1013a48,0x1
 100306f:	e9 94 01 00 00       	jmp    1003208 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:51
        case KEY_SHIFT_UP: kKeyStatus[INDEX_SHIFT]=0;break;
 1003074:	c6 05 48 3a 01 01 00 	mov    BYTE PTR ds:0x1013a48,0x0
 100307b:	e9 88 01 00 00       	jmp    1003208 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:52
        case KEY_CTRL_DN: kKeyStatus[INDEX_CTRL]=1;break;
 1003080:	c6 05 49 3a 01 01 01 	mov    BYTE PTR ds:0x1013a49,0x1
 1003087:	e9 7c 01 00 00       	jmp    1003208 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:53
        case KEY_CTRL_UP: kKeyStatus[INDEX_CTRL]=0;break;
 100308c:	c6 05 49 3a 01 01 00 	mov    BYTE PTR ds:0x1013a49,0x0
 1003093:	e9 70 01 00 00       	jmp    1003208 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:54
        case KEY_ALT_DN: kKeyStatus[INDEX_ALT]=1;break;
 1003098:	c6 05 4a 3a 01 01 01 	mov    BYTE PTR ds:0x1013a4a,0x1
 100309f:	e9 64 01 00 00       	jmp    1003208 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:55
        case KEY_ALT_UP: kKeyStatus[INDEX_ALT]=0;break;
 10030a4:	c6 05 4a 3a 01 01 00 	mov    BYTE PTR ds:0x1013a4a,0x0
 10030ab:	e9 58 01 00 00       	jmp    1003208 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:56
        case KEY_CAPSLOCK_UP: kKeyStatus[INDEX_CAPSLOCK]=!kKeyStatus[INDEX_CAPSLOCK];break;
 10030b0:	0f b6 05 4b 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a4b
 10030b7:	84 c0                	test   al,al
 10030b9:	0f 94 c0             	sete   al
 10030bc:	a2 4b 3a 01 01       	mov    ds:0x1013a4b,al
 10030c1:	e9 42 01 00 00       	jmp    1003208 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:64
//        case MAKE_UP: kKeyStatus[INDEX_UP]=0;break;
//        case MAKE_DOWN: kKeyStatus[INDEX_DOWN]=0;break;
       default:
//printk("%02X",rawKey);
           //changed from if rawkey & 0x80, so that keydown triggers the key being input
           if (rawKey==BREAK_RIGHT || rawKey==BREAK_LEFT || rawKey==BREAK_UP || rawKey==BREAK_DOWN)
 10030c6:	8d 50 35             	lea    edx,[eax+0x35]
 10030c9:	f6 c2 fd             	test   dl,0xfd
 10030cc:	74 08                	je     10030d6 <kbd_handler_generic+0x9e>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:64 (discriminator 1)
 10030ce:	8d 50 38             	lea    edx,[eax+0x38]
 10030d1:	f6 c2 f7             	test   dl,0xf7
 10030d4:	75 24                	jne    10030fa <kbd_handler_generic+0xc2>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:65
               if (kKeyboardBuffer<(char*)KEYBOARD_BUFFER_ADDRESS+KEYBOARD_BUFFER_SIZE && !kKeyStatus[INDEX_ALT])
 10030d6:	8b 15 e0 03 12 00    	mov    edx,DWORD PTR ds:0x1203e0
 10030dc:	81 fa 2f 25 15 00    	cmp    edx,0x15252f
 10030e2:	77 16                	ja     10030fa <kbd_handler_generic+0xc2>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:65 (discriminator 1)
 10030e4:	0f b6 0d 4a 3a 01 01 	movzx  ecx,BYTE PTR ds:0x1013a4a
 10030eb:	84 c9                	test   cl,cl
 10030ed:	75 0b                	jne    10030fa <kbd_handler_generic+0xc2>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:66
                   *kKeyboardBuffer++=rawKey;
 10030ef:	8d 4a 01             	lea    ecx,[edx+0x1]
 10030f2:	89 0d e0 03 12 00    	mov    DWORD PTR ds:0x1203e0,ecx
 10030f8:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:67
           if (!(rawKey & 0x80))
 10030fa:	84 c0                	test   al,al
 10030fc:	0f 88 06 01 00 00    	js     1003208 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:71
           {
                //rawKey &= 0x7f;
               //printk("%02X",rawKey); 48=up, 50=down
                 if (kKeyStatus[INDEX_SHIFT] || kKeyStatus[INDEX_CAPSLOCK])
 1003102:	0f b6 15 48 3a 01 01 	movzx  edx,BYTE PTR ds:0x1013a48
 1003109:	84 d2                	test   dl,dl
 100310b:	75 0b                	jne    1003118 <kbd_handler_generic+0xe0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:71 (discriminator 1)
 100310d:	0f b6 15 4b 3a 01 01 	movzx  edx,BYTE PTR ds:0x1013a4b
 1003114:	84 d2                	test   dl,dl
 1003116:	74 0c                	je     1003124 <kbd_handler_generic+0xec>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:73
                 {
                     translatedKeypress=keyboard_map_up[rawKey];
 1003118:	0f b6 c0             	movzx  eax,al
 100311b:	0f b6 98 60 50 00 01 	movzx  ebx,BYTE PTR [eax+0x1005060]
 1003122:	eb 0a                	jmp    100312e <kbd_handler_generic+0xf6>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:76
                 }
                 else
                     translatedKeypress=keyboard_map[rawKey];
 1003124:	0f b6 c0             	movzx  eax,al
 1003127:	0f b6 98 e0 50 00 01 	movzx  ebx,BYTE PTR [eax+0x10050e0]
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:83
//                 if ((kDebugLevel & DEBUG_KEYBOARD) == DEBUG_KEYBOARD)
//                 {
//                      printf("%u, %u, %c\n",kKeyChar, rawKey, translatedKeypress);
//                 }
#endif
                if (kKeyStatus[INDEX_CTRL])
 100312e:	0f b6 05 49 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a49
 1003135:	84 c0                	test   al,al
 1003137:	74 13                	je     100314c <kbd_handler_generic+0x114>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:85
                {
                    printk("^");
 1003139:	83 ec 0c             	sub    esp,0xc
 100313c:	68 d3 75 00 01       	push   0x10075d3
 1003141:	e8 31 f4 ff ff       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:86
                    translatedKeypress-=32;
 1003146:	83 eb 20             	sub    ebx,0x20
 1003149:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:89
                }
                //Debug
                if (kKeyStatus[INDEX_ALT] && translatedKeypress==0x6A)
 100314c:	0f b6 05 4a 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a4a
 1003153:	80 fb 6a             	cmp    bl,0x6a
 1003156:	75 05                	jne    100315d <kbd_handler_generic+0x125>
 1003158:	84 c0                	test   al,al
 100315a:	74 01                	je     100315d <kbd_handler_generic+0x125>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:91
                {
                    __asm("int 0x3");
 100315c:	cc                   	int3   
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:93
                }
            if (kKeyStatus[INDEX_ALT] && kKeyStatus[INDEX_CTRL] && translatedKeypress==0xE0)
 100315d:	0f b6 05 4a 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a4a
 1003164:	84 c0                	test   al,al
 1003166:	74 2f                	je     1003197 <kbd_handler_generic+0x15f>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:93 (discriminator 1)
 1003168:	0f b6 05 49 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a49
 100316f:	80 fb e0             	cmp    bl,0xe0
 1003172:	75 23                	jne    1003197 <kbd_handler_generic+0x15f>
 1003174:	84 c0                	test   al,al
 1003176:	74 1f                	je     1003197 <kbd_handler_generic+0x15f>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:96
            {
                translatedKeypress=0;
                reboot(false);
 1003178:	83 ec 0c             	sub    esp,0xc
 100317b:	6a 00                	push   0x0
 100317d:	e8 9d eb ff ff       	call   1001d1f <reboot>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:98
            }
            if (kKeyStatus[INDEX_ALT])
 1003182:	0f b6 05 4a 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a4a
 1003189:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:95
                {
                    __asm("int 0x3");
                }
            if (kKeyStatus[INDEX_ALT] && kKeyStatus[INDEX_CTRL] && translatedKeypress==0xE0)
            {
                translatedKeypress=0;
 100318c:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:98
                reboot(false);
            }
            if (kKeyStatus[INDEX_ALT])
 1003191:	84 c0                	test   al,al
 1003193:	75 69                	jne    10031fe <kbd_handler_generic+0x1c6>
 1003195:	eb 71                	jmp    1003208 <kbd_handler_generic+0x1d0>
 1003197:	0f b6 05 4a 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a4a
 100319e:	84 c0                	test   al,al
 10031a0:	74 66                	je     1003208 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:100
            {
                if (translatedKeypress=='c')
 10031a2:	80 fb 63             	cmp    bl,0x63
 10031a5:	75 4b                	jne    10031f2 <kbd_handler_generic+0x1ba>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:102
                {
                    printk("%u",*kTicksSinceStart);
 10031a7:	a1 60 02 12 00       	mov    eax,ds:0x120260
 10031ac:	8b 00                	mov    eax,DWORD PTR [eax]
 10031ae:	83 ec 08             	sub    esp,0x8
 10031b1:	50                   	push   eax
 10031b2:	68 d5 75 00 01       	push   0x10075d5
 10031b7:	e8 bb f3 ff ff       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:103
                    printk("-%c-%04X:%08X",(exceptionFlags & 0x200)==0x200?'I':'i',exceptionCS, exceptionEIP);
 10031bc:	8b 0d f8 01 12 00    	mov    ecx,DWORD PTR ds:0x1201f8
 10031c2:	8b 15 fc 01 12 00    	mov    edx,DWORD PTR ds:0x1201fc
 10031c8:	a1 f0 01 12 00       	mov    eax,ds:0x1201f0
 10031cd:	83 c4 10             	add    esp,0x10
 10031d0:	25 00 02 00 00       	and    eax,0x200
 10031d5:	83 f8 01             	cmp    eax,0x1
 10031d8:	19 c0                	sbb    eax,eax
 10031da:	83 e0 20             	and    eax,0x20
 10031dd:	83 c0 49             	add    eax,0x49
 10031e0:	51                   	push   ecx
 10031e1:	52                   	push   edx
 10031e2:	50                   	push   eax
 10031e3:	68 d8 75 00 01       	push   0x10075d8
 10031e8:	e8 8a f3 ff ff       	call   1002577 <printk>
 10031ed:	83 c4 10             	add    esp,0x10
 10031f0:	eb 16                	jmp    1003208 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:116
                    printk("The time is currently %s", &currTime);
                    cursorMoveTo(65,SYS_VGA_HEIGHT-1);
                    printk("ticks=%d", *kTicksSinceStart);
                    cursorRestorePosition();
                }
*/                if (translatedKeypress=='d')
 10031f2:	80 fb 64             	cmp    bl,0x64
 10031f5:	75 07                	jne    10031fe <kbd_handler_generic+0x1c6>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:118
                {
                    printDumpedRegs();
 10031f7:	e8 8a e8 ff ff       	call   1001a86 <printDumpedRegs>
 10031fc:	eb 0a                	jmp    1003208 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:120
                }
                if (translatedKeypress=='e')
 10031fe:	80 fb 65             	cmp    bl,0x65
 1003201:	75 05                	jne    1003208 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:122
                {
                    dumpKernelAddresses();
 1003203:	e8 58 eb ff ff       	call   1001d60 <dumpKernelAddresses>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1003208:	e4 61                	in     al,0x61
 100320a:	89 c2                	mov    edx,eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 100320c:	83 c8 82             	or     eax,0xffffff82
 100320f:	e6 61                	out    0x61,al
 1003211:	89 d0                	mov    eax,edx
 1003213:	83 e0 7f             	and    eax,0x7f
 1003216:	83 c8 02             	or     eax,0x2
 1003219:	e6 61                	out    0x61,al
kbd_handler_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:135
    lKeyControlVal |= 0x82;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    lKeyControlVal &= 0x7f;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    return;
}
 100321b:	83 c4 08             	add    esp,0x8
 100321e:	5b                   	pop    ebx
 100321f:	c3                   	ret    

01003220 <ih_keyboard_generic>:
ih_keyboard_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:32
extern volatile uint32_t exceptionSavedESP;
extern volatile uint32_t* kTicksSinceStart;

__attribute__ ((interrupt))
void ih_keyboard_generic(struct interrupt_frame *frame)
{
 1003220:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:33
    kbd_handler_generic();
 1003223:	e8 10 fe ff ff       	call   1003038 <kbd_handler_generic>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:35
    return;
}
 1003228:	83 c4 0c             	add    esp,0xc
 100322b:	c3                   	ret    

0100322c <main>:
main():
/home/yogi/src/os/chrisOSKernel/src/kernel.c:24
extern char kernelDataLoadAddress;
extern struct gdt_ptr kernelGDT;
/*
 * 
 */
int main(int argc, char** argv) {
 100322c:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 1003230:	83 e4 f0             	and    esp,0xfffffff0
 1003233:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 1003236:	55                   	push   ebp
 1003237:	89 e5                	mov    ebp,esp
 1003239:	51                   	push   ecx
 100323a:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/kernel.c:26
    //terminal_clear();
    printk("\nkernel loaded ... \n");
 100323d:	68 e6 75 00 01       	push   0x10075e6
 1003242:	e8 30 f3 ff ff       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:36
        //if (cnt>5)
        //    break;
    }
*/
    
    printk("kernelDataLoadAddress = 0x%08X \n\n",&kernelDataLoadAddress);
 1003247:	83 c4 08             	add    esp,0x8
 100324a:	68 00 00 12 00       	push   0x120000
 100324f:	68 24 83 00 01       	push   0x1008324
 1003254:	e8 1e f3 ff ff       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:37
    mmInit();
 1003259:	e8 9c 03 00 00       	call   10035fa <mmInit>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:38
    taskInit();
 100325e:	e8 0d 0b 00 00       	call   1003d70 <taskInit>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:40
    
    task_t* task=createTask(true);
 1003263:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 100326a:	e8 1e 0c 00 00       	call   1003e8d <createTask>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:42
    
    printk("kernelGDT=0x%08X, base=0x%08X, limit=%u\n",&kernelGDT, kernelGDT.base,kernelGDT.limit);
 100326f:	0f b7 05 4c 04 12 00 	movzx  eax,WORD PTR ds:0x12044c
 1003276:	50                   	push   eax
 1003277:	ff 35 4e 04 12 00    	push   DWORD PTR ds:0x12044e
 100327d:	68 4c 04 12 00       	push   0x12044c
 1003282:	68 48 83 00 01       	push   0x1008348
 1003287:	e8 eb f2 ff ff       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:43
    return (0xbad);
 100328c:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/kernel.c:44
}
 100328f:	b8 ad 0b 00 00       	mov    eax,0xbad
 1003294:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
 1003297:	c9                   	leave  
 1003298:	8d 61 fc             	lea    esp,[ecx-0x4]
 100329b:	c3                   	ret    

0100329c <findEmptyBlock>:
findEmptyBlock():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:21
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})

//Returns pointer to first empty block found
sMemInfo* findEmptyBlock()
{
 100329c:	53                   	push   ebx
 100329d:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:22
    sMemInfo* mInfo=heapMemoryInfo;
 10032a0:	a1 54 3a 01 01       	mov    eax,ds:0x1013a54
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:25
    sMemInfo* lRetVal;
    
    while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000))
 10032a5:	8d 90 80 f6 0b 00    	lea    edx,[eax+0xbf680]
 10032ab:	39 d0                	cmp    eax,edx
 10032ad:	73 32                	jae    10032e1 <findEmptyBlock+0x45>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:27
    {
        if (mInfo->next==NULL)
 10032af:	83 78 18 00          	cmp    DWORD PTR [eax+0x18],0x0
 10032b3:	75 25                	jne    10032da <findEmptyBlock+0x3e>
 10032b5:	eb 06                	jmp    10032bd <findEmptyBlock+0x21>
 10032b7:	83 78 18 00          	cmp    DWORD PTR [eax+0x18],0x0
 10032bb:	75 1d                	jne    10032da <findEmptyBlock+0x3e>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:29
        {
            lRetVal=mInfo+1;
 10032bd:	8d 58 1c             	lea    ebx,[eax+0x1c]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:30
            printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: Returning block # 0x%08X\n",lRetVal);
 10032c0:	83 ec 04             	sub    esp,0x4
 10032c3:	53                   	push   ebx
 10032c4:	68 74 83 00 01       	push   0x1008374
 10032c9:	68 00 00 01 00       	push   0x10000
 10032ce:	e8 bc f2 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:31
            return lRetVal;
 10032d3:	83 c4 10             	add    esp,0x10
 10032d6:	89 d8                	mov    eax,ebx
 10032d8:	eb 21                	jmp    10032fb <findEmptyBlock+0x5f>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:33
        }
         mInfo++;
 10032da:	83 c0 1c             	add    eax,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:25
sMemInfo* findEmptyBlock()
{
    sMemInfo* mInfo=heapMemoryInfo;
    sMemInfo* lRetVal;
    
    while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000))
 10032dd:	39 d0                	cmp    eax,edx
 10032df:	75 d6                	jne    10032b7 <findEmptyBlock+0x1b>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:35
            printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: Returning block # 0x%08X\n",lRetVal);
            return lRetVal;
        }
         mInfo++;
    }
    printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: No empty block found, returning NULL\n");
 10032e1:	83 ec 08             	sub    esp,0x8
 10032e4:	68 a0 83 00 01       	push   0x10083a0
 10032e9:	68 00 00 01 00       	push   0x10000
 10032ee:	e8 9c f2 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:36
    return NULL;
 10032f3:	83 c4 10             	add    esp,0x10
 10032f6:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:37
}
 10032fb:	83 c4 08             	add    esp,0x8
 10032fe:	5b                   	pop    ebx
 10032ff:	c3                   	ret    

01003300 <findBlockByMemoryAddress>:
findBlockByMemoryAddress():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:40

sMemInfo* findBlockByMemoryAddress(uintptr_t* address)
{
 1003300:	53                   	push   ebx
 1003301:	83 ec 08             	sub    esp,0x8
 1003304:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:41
    sMemInfo* mInfo=heapMemoryInfo;
 1003308:	8b 1d 54 3a 01 01    	mov    ebx,DWORD PTR ds:0x1013a54
 100330e:	8d 93 80 f6 0b 00    	lea    edx,[ebx+0xbf680]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:44
    do
    {
        if (mInfo->address==address)
 1003314:	3b 43 04             	cmp    eax,DWORD PTR [ebx+0x4]
 1003317:	75 18                	jne    1003331 <findBlockByMemoryAddress+0x31>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:46
        {
            printd(DEBUG_MEMORY_MANAGEMENT,"findBlockByMemoryAddress: Found block 0x%08X for memory address 0x%08X\n",mInfo,address);
 1003319:	50                   	push   eax
 100331a:	53                   	push   ebx
 100331b:	68 d8 83 00 01       	push   0x10083d8
 1003320:	68 00 00 01 00       	push   0x10000
 1003325:	e8 65 f2 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:47
            return (sMemInfo*)mInfo;
 100332a:	83 c4 10             	add    esp,0x10
 100332d:	89 d8                	mov    eax,ebx
 100332f:	eb 0c                	jmp    100333d <findBlockByMemoryAddress+0x3d>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:49
        }
        mInfo++;
 1003331:	83 c3 1c             	add    ebx,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:50
    } while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000));
 1003334:	39 d3                	cmp    ebx,edx
 1003336:	75 dc                	jne    1003314 <findBlockByMemoryAddress+0x14>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:51
    return NULL;
 1003338:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:52
}
 100333d:	83 c4 08             	add    esp,0x8
 1003340:	5b                   	pop    ebx
 1003341:	c3                   	ret    

01003342 <findAvailableBlockBySize>:
findAvailableBlockBySize():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:56

//Returns a block with enough memory to fulfill the request
uintptr_t* findAvailableBlockBySize(uint32_t pSize)
{
 1003342:	53                   	push   ebx
 1003343:	83 ec 08             	sub    esp,0x8
 1003346:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:57
    sMemInfo* mInfo=heapMemoryInfo;
 100334a:	a1 54 3a 01 01       	mov    eax,ds:0x1013a54
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:61
    
    //First try finding a block starting at the last block instead of the first
    //Get to the last block
    while (mInfo->next)
 100334f:	83 78 18 00          	cmp    DWORD PTR [eax+0x18],0x0
 1003353:	74 11                	je     1003366 <findAvailableBlockBySize+0x24>
 1003355:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:62
        mInfo++;
 1003357:	83 c3 1c             	add    ebx,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:61
{
    sMemInfo* mInfo=heapMemoryInfo;
    
    //First try finding a block starting at the last block instead of the first
    //Get to the last block
    while (mInfo->next)
 100335a:	83 7b 18 00          	cmp    DWORD PTR [ebx+0x18],0x0
 100335e:	75 f7                	jne    1003357 <findAvailableBlockBySize+0x15>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:63
        mInfo++;
    while (mInfo>=heapMemoryInfo)
 1003360:	39 d8                	cmp    eax,ebx
 1003362:	76 04                	jbe    1003368 <findAvailableBlockBySize+0x26>
 1003364:	eb 2e                	jmp    1003394 <findAvailableBlockBySize+0x52>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:57
}

//Returns a block with enough memory to fulfill the request
uintptr_t* findAvailableBlockBySize(uint32_t pSize)
{
    sMemInfo* mInfo=heapMemoryInfo;
 1003366:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:65
    //Get to the last block
    while (mInfo->next)
        mInfo++;
    while (mInfo>=heapMemoryInfo)
    {
        if (mInfo->size>=pSize && (!mInfo->inUse))
 1003368:	39 53 08             	cmp    DWORD PTR [ebx+0x8],edx
 100336b:	72 20                	jb     100338d <findAvailableBlockBySize+0x4b>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:65 (discriminator 1)
 100336d:	80 7b 0c 00          	cmp    BYTE PTR [ebx+0xc],0x0
 1003371:	75 1a                	jne    100338d <findAvailableBlockBySize+0x4b>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:67
        {
            printd(DEBUG_MEMORY_MANAGEMENT,"findAvailableBlockBySize: Returning block address 0x%08X\n",mInfo);
 1003373:	83 ec 04             	sub    esp,0x4
 1003376:	53                   	push   ebx
 1003377:	68 20 84 00 01       	push   0x1008420
 100337c:	68 00 00 01 00       	push   0x10000
 1003381:	e8 09 f2 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:68
            return (uintptr_t*)mInfo;
 1003386:	89 d8                	mov    eax,ebx
 1003388:	83 c4 10             	add    esp,0x10
 100338b:	eb 07                	jmp    1003394 <findAvailableBlockBySize+0x52>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:70
        }
        mInfo--;
 100338d:	83 eb 1c             	sub    ebx,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:63
    
    //First try finding a block starting at the last block instead of the first
    //Get to the last block
    while (mInfo->next)
        mInfo++;
    while (mInfo>=heapMemoryInfo)
 1003390:	39 d8                	cmp    eax,ebx
 1003392:	76 d4                	jbe    1003368 <findAvailableBlockBySize+0x26>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:72
            printd(DEBUG_MEMORY_MANAGEMENT,"findAvailableBlockBySize: Returning block address 0x%08X\n",mInfo);
            return (uintptr_t*)mInfo;
        }
        mInfo--;
    }
}
 1003394:	83 c4 08             	add    esp,0x8
 1003397:	5b                   	pop    ebx
 1003398:	c3                   	ret    

01003399 <allocateBlockFrom>:
allocateBlockFrom():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:76

//Create a new block with the requested amount of memory, and adjust the old block's size and pointer appropriately
uintptr_t* allocateBlockFrom(sMemInfo* mInfoToAllocateFrom, uint32_t size)
{
 1003399:	57                   	push   edi
 100339a:	56                   	push   esi
 100339b:	53                   	push   ebx
 100339c:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 10033a0:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:77
    sMemInfo* mNewInfo=findEmptyBlock();
 10033a4:	e8 f3 fe ff ff       	call   100329c <findEmptyBlock>
 10033a9:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:80
    sMemInfo* mPriorInfo=mNewInfo-1;
    
    printd(DEBUG_MEMORY_MANAGEMENT,"allocateBlockFrom: findEmptyBlock returned 0x%08X\n",mNewInfo);
 10033ab:	83 ec 04             	sub    esp,0x4
 10033ae:	50                   	push   eax
 10033af:	68 5c 84 00 01       	push   0x100845c
 10033b4:	68 00 00 01 00       	push   0x10000
 10033b9:	e8 d1 f1 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:82
    
    mPriorInfo->next=(uintptr_t*)mNewInfo;
 10033be:	89 5b fc             	mov    DWORD PTR [ebx-0x4],ebx
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:85
    
    //Set up the new sMemInfo
    mNewInfo->prev=(uintptr_t*)mPriorInfo;
 10033c1:	8d 43 e4             	lea    eax,[ebx-0x1c]
 10033c4:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:86
    mNewInfo->address=mInfoToAllocateFrom->address;
 10033c6:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
 10033c9:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:87
    mNewInfo->size=size;
 10033cc:	89 7b 08             	mov    DWORD PTR [ebx+0x8],edi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:88
    mNewInfo->inUse=true;
 10033cf:	c6 43 0c 01          	mov    BYTE PTR [ebx+0xc],0x1
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:89
    mNewInfo->cr3=CURRENT_CR3;
 10033d3:	0f 20 d8             	mov    eax,cr3
 10033d6:	89 c0                	mov    eax,eax
 10033d8:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:92
    //mNewInfo pid and next don't get set
    
    mInfoToAllocateFrom->address+=size;
 10033db:	01 7e 04             	add    DWORD PTR [esi+0x4],edi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:93
    mInfoToAllocateFrom->size-=size;
 10033de:	29 7e 08             	sub    DWORD PTR [esi+0x8],edi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:94
    return (uintptr_t*)mNewInfo->address;
 10033e1:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 10033e4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:95
}
 10033e7:	5b                   	pop    ebx
 10033e8:	5e                   	pop    esi
 10033e9:	5f                   	pop    edi
 10033ea:	c3                   	ret    

010033eb <malloc>:
malloc():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:98

uintptr_t* malloc(uint32_t size)
{
 10033eb:	56                   	push   esi
 10033ec:	53                   	push   ebx
 10033ed:	83 ec 04             	sub    esp,0x4
 10033f0:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:100
    uint32_t newSize=size;
    if (newSize%MEMORY_BLOCK_SIZE)
 10033f4:	89 d8                	mov    eax,ebx
 10033f6:	25 ff 0f 00 00       	and    eax,0xfff
 10033fb:	74 1e                	je     100341b <malloc+0x30>
 10033fd:	8d b3 00 10 00 00    	lea    esi,[ebx+0x1000]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:102
    {
        newSize+=(MEMORY_BLOCK_SIZE-(size % MEMORY_BLOCK_SIZE));
 1003403:	29 c6                	sub    esi,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:103
        printd(DEBUG_MEMORY_MANAGEMENT,"malloc: Size adjusted from %u to %u\n",size,newSize);
 1003405:	56                   	push   esi
 1003406:	53                   	push   ebx
 1003407:	68 90 84 00 01       	push   0x1008490
 100340c:	68 00 00 01 00       	push   0x10000
 1003411:	e8 79 f1 ff ff       	call   100258f <printd>
 1003416:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:102
uintptr_t* malloc(uint32_t size)
{
    uint32_t newSize=size;
    if (newSize%MEMORY_BLOCK_SIZE)
    {
        newSize+=(MEMORY_BLOCK_SIZE-(size % MEMORY_BLOCK_SIZE));
 1003419:	89 f3                	mov    ebx,esi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:106
        printd(DEBUG_MEMORY_MANAGEMENT,"malloc: Size adjusted from %u to %u\n",size,newSize);
    }
    uintptr_t* lRetVal;
    uintptr_t* block=findAvailableBlockBySize(newSize);
 100341b:	83 ec 0c             	sub    esp,0xc
 100341e:	53                   	push   ebx
 100341f:	e8 1e ff ff ff       	call   1003342 <findAvailableBlockBySize>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:107
    if ( ((sMemInfo*)(block))->size > newSize)
 1003424:	83 c4 10             	add    esp,0x10
 1003427:	3b 58 08             	cmp    ebx,DWORD PTR [eax+0x8]
 100342a:	73 11                	jae    100343d <malloc+0x52>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:108
       lRetVal=allocateBlockFrom((sMemInfo*)block,newSize);
 100342c:	83 ec 08             	sub    esp,0x8
 100342f:	53                   	push   ebx
 1003430:	50                   	push   eax
 1003431:	e8 63 ff ff ff       	call   1003399 <allocateBlockFrom>
 1003436:	89 c6                	mov    esi,eax
 1003438:	83 c4 10             	add    esp,0x10
 100343b:	eb 03                	jmp    1003440 <malloc+0x55>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:110
    else
        lRetVal=((sMemInfo*)(block))->address;
 100343d:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:111
    printd(DEBUG_MEMORY_MANAGEMENT,"malloc: Returning address 0x%08X\n",lRetVal);
 1003440:	83 ec 04             	sub    esp,0x4
 1003443:	56                   	push   esi
 1003444:	68 b8 84 00 01       	push   0x10084b8
 1003449:	68 00 00 01 00       	push   0x10000
 100344e:	e8 3c f1 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:113
    //Zero out the memory
    memset(lRetVal,0,newSize);
 1003453:	83 c4 0c             	add    esp,0xc
 1003456:	53                   	push   ebx
 1003457:	6a 00                	push   0x0
 1003459:	56                   	push   esi
 100345a:	e8 84 e4 ff ff       	call   10018e3 <memset>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:116
    //pagingMapPage();
    return lRetVal;
}
 100345f:	89 f0                	mov    eax,esi
 1003461:	83 c4 14             	add    esp,0x14
 1003464:	5b                   	pop    ebx
 1003465:	5e                   	pop    esi
 1003466:	c3                   	ret    

01003467 <free>:
free():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:119

void free(uintptr_t* address)
{
 1003467:	53                   	push   ebx
 1003468:	83 ec 14             	sub    esp,0x14
 100346b:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:120
    sMemInfo* mInfo = findBlockByMemoryAddress(address);
 100346f:	53                   	push   ebx
 1003470:	e8 8b fe ff ff       	call   1003300 <findBlockByMemoryAddress>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:121
    if (mInfo!=NULL)
 1003475:	83 c4 10             	add    esp,0x10
 1003478:	85 c0                	test   eax,eax
 100347a:	74 1a                	je     1003496 <free+0x2f>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:123
    {
        mInfo->inUse=false;
 100347c:	c6 40 0c 00          	mov    BYTE PTR [eax+0xc],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:124
        printd(DEBUG_MEMORY_MANAGEMENT,"Freed block 0x%08x for memory address 0x%08x\n",mInfo,address);
 1003480:	53                   	push   ebx
 1003481:	50                   	push   eax
 1003482:	68 dc 84 00 01       	push   0x10084dc
 1003487:	68 00 00 01 00       	push   0x10000
 100348c:	e8 fe f0 ff ff       	call   100258f <printd>
 1003491:	83 c4 10             	add    esp,0x10
 1003494:	eb 16                	jmp    10034ac <free+0x45>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:127
    }
    else
        printd(DEBUG_MEMORY_MANAGEMENT,"free: Could not find memory block for 0x%08X to free, doing nothing\n",address);
 1003496:	83 ec 04             	sub    esp,0x4
 1003499:	53                   	push   ebx
 100349a:	68 0c 85 00 01       	push   0x100850c
 100349f:	68 00 00 01 00       	push   0x10000
 10034a4:	e8 e6 f0 ff ff       	call   100258f <printd>
 10034a9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:128
}
 10034ac:	83 c4 08             	add    esp,0x8
 10034af:	5b                   	pop    ebx
 10034b0:	c3                   	ret    

010034b1 <mallocA1k>:
mallocA1k():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:135
uintptr_t* mallocA1k(uint32_t size)
{
    uintptr_t* lRetVal=0;
    
    return lRetVal;
}
 10034b1:	b8 00 00 00 00       	mov    eax,0x0
 10034b6:	c3                   	ret    

010034b7 <memAvailable>:
memAvailable():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:140

uint32_t memAvailable()
{
    uint32_t lRetVal;
    sMemInfo* mInfo=heapMemoryInfo;
 10034b7:	8b 15 54 3a 01 01    	mov    edx,DWORD PTR ds:0x1013a54
 10034bd:	8d 8a 80 f6 0b 00    	lea    ecx,[edx+0xbf680]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:144

    do
    {
        if (!mInfo->inUse)
 10034c3:	80 7a 0c 00          	cmp    BYTE PTR [edx+0xc],0x0
 10034c7:	75 03                	jne    10034cc <memAvailable+0x15>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:145
            lRetVal+=mInfo->size;
 10034c9:	03 42 08             	add    eax,DWORD PTR [edx+0x8]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:146
        mInfo++;
 10034cc:	83 c2 1c             	add    edx,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:147
    } while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000));
 10034cf:	39 ca                	cmp    edx,ecx
 10034d1:	75 f0                	jne    10034c3 <memAvailable+0xc>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:149
    return lRetVal;
}
 10034d3:	f3 c3                	repz ret 
 10034d5:	66 90                	xchg   ax,ax
 10034d7:	90                   	nop

010034d8 <mmInitHeapTracking>:
mmInitHeapTracking():
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:32
uint32_t kernelPoolMemorySize=1400000;   //20 MB kernel memory

sMemInfo* heapMemoryInfo;

void mmInitHeapTracking()
{
 10034d8:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:33
    heapMemoryInfo=kmmHeapMemoryBaseAddress;
 10034db:	a1 04 05 12 00       	mov    eax,ds:0x120504
 10034e0:	a3 54 3a 01 01       	mov    ds:0x1013a54,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:34
    printd(DEBUG_MEMORY_MANAGEMENT,"Assigning heapMemoryInfo address of 0x%08X\n",heapMemoryInfo);
 10034e5:	50                   	push   eax
 10034e6:	68 54 85 00 01       	push   0x1008554
 10034eb:	68 00 00 01 00       	push   0x10000
 10034f0:	e8 9a f0 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:38
    
    kmmHeapMemoryBaseAddress += sizeof(sMemInfo)*1000;
    kmmHeapMemoryBaseAddress += 0x1000;
    kmmHeapMemoryBaseAddress &= 0xFFFFF000;
 10034f5:	a1 04 05 12 00       	mov    eax,ds:0x120504
 10034fa:	05 60 7d 00 00       	add    eax,0x7d60
 10034ff:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003504:	a3 04 05 12 00       	mov    ds:0x120504,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:39
    kmmHeapMemoryTotal-= sizeof(sMemInfo)*1000; 
 1003509:	81 2d 08 05 12 00 60 	sub    DWORD PTR ds:0x120508,0x6d60
 1003510:	6d 00 00 
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:40
    printd(DEBUG_MEMORY_MANAGEMENT,"heapMemoryInfo = 0x%08X\n",heapMemoryInfo);
 1003513:	83 c4 0c             	add    esp,0xc
 1003516:	ff 35 54 3a 01 01    	push   DWORD PTR ds:0x1013a54
 100351c:	68 d6 76 00 01       	push   0x10076d6
 1003521:	68 00 00 01 00       	push   0x10000
 1003526:	e8 64 f0 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:41
    printd(DEBUG_MEMORY_MANAGEMENT,"Allocating 0x%08X bytes to memory block tracking\n",sizeof(sMemInfo)*1000);
 100352b:	83 c4 0c             	add    esp,0xc
 100352e:	68 60 6d 00 00       	push   0x6d60
 1003533:	68 80 85 00 01       	push   0x1008580
 1003538:	68 00 00 01 00       	push   0x10000
 100353d:	e8 4d f0 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:42
    printd(DEBUG_MEMORY_MANAGEMENT,"User memory base adjusted to 0x%08X\n",kmmHeapMemoryBaseAddress);
 1003542:	83 c4 0c             	add    esp,0xc
 1003545:	ff 35 04 05 12 00    	push   DWORD PTR ds:0x120504
 100354b:	68 b4 85 00 01       	push   0x10085b4
 1003550:	68 00 00 01 00       	push   0x10000
 1003555:	e8 35 f0 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:43
    printd(DEBUG_MEMORY_MANAGEMENT,"User memory size adjusted to 0x%08X\n",kmmHeapMemoryTotal);
 100355a:	83 c4 0c             	add    esp,0xc
 100355d:	ff 35 08 05 12 00    	push   DWORD PTR ds:0x120508
 1003563:	68 dc 85 00 01       	push   0x10085dc
 1003568:	68 00 00 01 00       	push   0x10000
 100356d:	e8 1d f0 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:45

    heapMemoryInfo->address=kmmHeapMemoryBaseAddress;
 1003572:	a1 54 3a 01 01       	mov    eax,ds:0x1013a54
 1003577:	8b 15 04 05 12 00    	mov    edx,DWORD PTR ds:0x120504
 100357d:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:46
    heapMemoryInfo->size=kmmHeapMemoryTotal;
 1003580:	8b 15 08 05 12 00    	mov    edx,DWORD PTR ds:0x120508
 1003586:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:47
    heapMemoryInfo->next=NULL;
 1003589:	c7 40 18 00 00 00 00 	mov    DWORD PTR [eax+0x18],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:48
    heapMemoryInfo->prev=NULL;
 1003590:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1003596:	83 c4 10             	add    esp,0x10
 1003599:	b8 1c 00 00 00       	mov    eax,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:50
    
    for (int cnt=1;cnt<1000;cnt++)
 100359e:	ba 01 00 00 00       	mov    edx,0x1
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:52
    {
        heapMemoryInfo[cnt].address=0;
 10035a3:	89 c1                	mov    ecx,eax
 10035a5:	03 0d 54 3a 01 01    	add    ecx,DWORD PTR ds:0x1013a54
 10035ab:	c7 41 04 00 00 00 00 	mov    DWORD PTR [ecx+0x4],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:53
        heapMemoryInfo[cnt].prev=NULL;
 10035b2:	c7 01 00 00 00 00    	mov    DWORD PTR [ecx],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:54
        if (cnt<999)
 10035b8:	81 fa e6 03 00 00    	cmp    edx,0x3e6
 10035be:	7f 0e                	jg     10035ce <mmInitHeapTracking+0xf6>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:55
            heapMemoryInfo[cnt].next=NULL;
 10035c0:	8b 0d 54 3a 01 01    	mov    ecx,DWORD PTR ds:0x1013a54
 10035c6:	c7 44 01 18 00 00 00 	mov    DWORD PTR [ecx+eax*1+0x18],0x0
 10035cd:	00 
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:56 (discriminator 2)
        heapMemoryInfo[cnt].inUse=false;
 10035ce:	89 c1                	mov    ecx,eax
 10035d0:	03 0d 54 3a 01 01    	add    ecx,DWORD PTR ds:0x1013a54
 10035d6:	c6 41 0c 00          	mov    BYTE PTR [ecx+0xc],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:57 (discriminator 2)
        heapMemoryInfo[cnt].pid=0;
 10035da:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:58 (discriminator 2)
        heapMemoryInfo[cnt].size=0;
 10035e1:	c7 41 08 00 00 00 00 	mov    DWORD PTR [ecx+0x8],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:50 (discriminator 2)
    heapMemoryInfo->address=kmmHeapMemoryBaseAddress;
    heapMemoryInfo->size=kmmHeapMemoryTotal;
    heapMemoryInfo->next=NULL;
    heapMemoryInfo->prev=NULL;
    
    for (int cnt=1;cnt<1000;cnt++)
 10035e8:	83 c2 01             	add    edx,0x1
 10035eb:	83 c0 1c             	add    eax,0x1c
 10035ee:	81 fa e8 03 00 00    	cmp    edx,0x3e8
 10035f4:	75 ad                	jne    10035a3 <mmInitHeapTracking+0xcb>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:60
            heapMemoryInfo[cnt].next=NULL;
        heapMemoryInfo[cnt].inUse=false;
        heapMemoryInfo[cnt].pid=0;
        heapMemoryInfo[cnt].size=0;
    }
}
 10035f6:	83 c4 0c             	add    esp,0xc
 10035f9:	c3                   	ret    

010035fa <mmInit>:
mmInit():
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:64


void mmInit()
{
 10035fa:	56                   	push   esi
 10035fb:	53                   	push   ebx
 10035fc:	83 ec 04             	sub    esp,0x4
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:66
    //0x10000000 represents segment 0xC0000000-0xCFFFFFFF ... don't want to map anything there for now
    kernelMemoryUsed=kernelStart + kernelSize;
 10035ff:	a1 0c 40 00 01       	mov    eax,ds:0x100400c
 1003604:	03 05 08 40 00 01    	add    eax,DWORD PTR ds:0x1004008
 100360a:	a3 50 3a 01 01       	mov    ds:0x1013a50,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:67
    kmmGrossUserMemoryAvailable=kE820MemoryBytes - kernelMemoryUsed;
 100360f:	8b 0d 48 00 12 00    	mov    ecx,DWORD PTR ds:0x120048
 1003615:	8b 1d 4c 00 12 00    	mov    ebx,DWORD PTR ds:0x12004c
 100361b:	89 ca                	mov    edx,ecx
 100361d:	29 c2                	sub    edx,eax
 100361f:	89 15 00 05 12 00    	mov    DWORD PTR ds:0x120500,edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:68
    kmmHeapMemoryTotal=kmmGrossUserMemoryAvailable - kernelPoolMemorySize - kernelMemoryUsed;
 1003625:	8b 35 04 40 00 01    	mov    esi,DWORD PTR ds:0x1004004
 100362b:	29 f2                	sub    edx,esi
 100362d:	29 c2                	sub    edx,eax
 100362f:	89 15 08 05 12 00    	mov    DWORD PTR ds:0x120508,edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:69
    kmmHeapMemoryBaseAddress=(kernelMemoryUsed + 0x100000) & 0xFFFFF000 ;
 1003635:	05 00 00 10 00       	add    eax,0x100000
 100363a:	25 00 f0 ff ff       	and    eax,0xfffff000
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:70
    kKernelPoolMemoryAddress=kmmHeapMemoryBaseAddress;
 100363f:	a3 58 3a 01 01       	mov    ds:0x1013a58,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:71
    kmmHeapMemoryBaseAddress+=kernelPoolMemorySize; //Need some page table memory but we don't want to use Malloc while creating page tables to get it
 1003644:	01 f0                	add    eax,esi
 1003646:	a3 04 05 12 00       	mov    ds:0x120504,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:73
    //Setup the base of the heap
    kMallocBaseAddress=kmmHeapMemoryBaseAddress;
 100364b:	a3 fc 04 12 00       	mov    ds:0x1204fc,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:74
    kMallocCurrAddress=kMallocBaseAddress;
 1003650:	a3 f8 04 12 00       	mov    ds:0x1204f8,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:76
    
    printd(DEBUG_MEMORY_MANAGEMENT,"E820 memory total: %u kb\n", kE820MemoryBytes/1024);
 1003655:	0f ac d9 0a          	shrd   ecx,ebx,0xa
 1003659:	c1 eb 0a             	shr    ebx,0xa
 100365c:	53                   	push   ebx
 100365d:	51                   	push   ecx
 100365e:	68 ef 76 00 01       	push   0x10076ef
 1003663:	68 00 00 01 00       	push   0x10000
 1003668:	e8 22 ef ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:77
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory used by the kernel: %u\n",kernelMemoryUsed);
 100366d:	83 c4 0c             	add    esp,0xc
 1003670:	ff 35 50 3a 01 01    	push   DWORD PTR ds:0x1013a50
 1003676:	68 04 86 00 01       	push   0x1008604
 100367b:	68 00 00 01 00       	push   0x10000
 1003680:	e8 0a ef ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:78
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory available to mm: %u kb\n",kmmGrossUserMemoryAvailable/1024);
 1003685:	83 c4 0c             	add    esp,0xc
 1003688:	a1 00 05 12 00       	mov    eax,ds:0x120500
 100368d:	c1 e8 0a             	shr    eax,0xa
 1003690:	50                   	push   eax
 1003691:	68 24 86 00 01       	push   0x1008624
 1003696:	68 00 00 01 00       	push   0x10000
 100369b:	e8 ef ee ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:79
    printd(DEBUG_MEMORY_MANAGEMENT,"Total memory availabe to user applications: %u kb\n",(kmmGrossUserMemoryAvailable - kernelPoolMemorySize)/1024);
 10036a0:	83 c4 0c             	add    esp,0xc
 10036a3:	a1 00 05 12 00       	mov    eax,ds:0x120500
 10036a8:	2b 05 04 40 00 01    	sub    eax,DWORD PTR ds:0x1004004
 10036ae:	c1 e8 0a             	shr    eax,0xa
 10036b1:	50                   	push   eax
 10036b2:	68 44 86 00 01       	push   0x1008644
 10036b7:	68 00 00 01 00       	push   0x10000
 10036bc:	e8 ce ee ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:80
    printd(DEBUG_MEMORY_MANAGEMENT,"Initializing memory manager\n\n");
 10036c1:	83 c4 08             	add    esp,0x8
 10036c4:	68 09 77 00 01       	push   0x1007709
 10036c9:	68 00 00 01 00       	push   0x10000
 10036ce:	e8 bc ee ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:81
    printd(DEBUG_MEMORY_MANAGEMENT,"Pool\t\tAddress\t\t\tLength\t\t\n");
 10036d3:	83 c4 08             	add    esp,0x8
 10036d6:	68 27 77 00 01       	push   0x1007727
 10036db:	68 00 00 01 00       	push   0x10000
 10036e0:	e8 aa ee ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:82
    printd(DEBUG_MEMORY_MANAGEMENT,"Kernel\t0x%08X\t\t0x%08X\n",kKernelPoolMemoryAddress,kernelPoolMemorySize);
 10036e5:	ff 35 04 40 00 01    	push   DWORD PTR ds:0x1004004
 10036eb:	ff 35 58 3a 01 01    	push   DWORD PTR ds:0x1013a58
 10036f1:	68 41 77 00 01       	push   0x1007741
 10036f6:	68 00 00 01 00       	push   0x10000
 10036fb:	e8 8f ee ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:83
    printd(DEBUG_MEMORY_MANAGEMENT,"User\t\t0x%08X\t\t0x%08X\n",kmmHeapMemoryBaseAddress,kmmHeapMemoryTotal);
 1003700:	83 c4 20             	add    esp,0x20
 1003703:	ff 35 08 05 12 00    	push   DWORD PTR ds:0x120508
 1003709:	ff 35 04 05 12 00    	push   DWORD PTR ds:0x120504
 100370f:	68 58 77 00 01       	push   0x1007758
 1003714:	68 00 00 01 00       	push   0x10000
 1003719:	e8 71 ee ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:85

    mmInitHeapTracking();    
 100371e:	e8 b5 fd ff ff       	call   10034d8 <mmInitHeapTracking>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:88
    //We need to
    uintptr_t startAddr=0x0;
    uintptr_t endAddr= (kernelMemoryUsed + 0x1000) & 0xFFFFF000;
 1003723:	a1 50 3a 01 01       	mov    eax,ds:0x1013a50
 1003728:	8d 98 00 10 00 00    	lea    ebx,[eax+0x1000]
 100372e:	81 e3 00 f0 ff ff    	and    ebx,0xfffff000
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:90
    //Mark everything from the beginning of memory (0xC0000000) to the end of the kernel objects as in-use
    printd(DEBUG_KERNEL_PAGING,"Setting kernel memory range from 0x%08X-0x%08X as in-use\n",startAddr,endAddr);
 1003734:	53                   	push   ebx
 1003735:	6a 00                	push   0x0
 1003737:	68 78 86 00 01       	push   0x1008678
 100373c:	68 00 80 00 00       	push   0x8000
 1003741:	e8 49 ee ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:91
    mmKernelSetPageRangeInUseFlag(startAddr,
 1003746:	83 c4 20             	add    esp,0x20
 1003749:	6a 01                	push   0x1
 100374b:	68 00 10 00 00       	push   0x1000
 1003750:	8d 43 01             	lea    eax,[ebx+0x1]
 1003753:	50                   	push   eax
 1003754:	6a 00                	push   0x0
 1003756:	e8 9c df ff ff       	call   10016f7 <mmKernelSetPageRangeInUseFlag>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:97
            endAddr+1,
            0x1000, /*page size*/
            true);
    startAddr+=0xc0000000;
    endAddr+=0xc0000000;
    printd(DEBUG_KERNEL_PAGING,"Setting kernel memory range from 0x%08X-0x%08X as in-use\n",startAddr,endAddr);
 100375b:	8d 83 00 00 00 c0    	lea    eax,[ebx-0x40000000]
 1003761:	50                   	push   eax
 1003762:	68 00 00 00 c0       	push   0xc0000000
 1003767:	68 78 86 00 01       	push   0x1008678
 100376c:	68 00 80 00 00       	push   0x8000
 1003771:	e8 19 ee ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:98
    mmKernelSetPageRangeInUseFlag(startAddr,
 1003776:	83 c4 20             	add    esp,0x20
 1003779:	6a 01                	push   0x1
 100377b:	68 00 10 00 00       	push   0x1000
 1003780:	81 eb ff ff ff 3f    	sub    ebx,0x3fffffff
 1003786:	53                   	push   ebx
 1003787:	68 00 00 00 c0       	push   0xc0000000
 100378c:	e8 66 df ff ff       	call   10016f7 <mmKernelSetPageRangeInUseFlag>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:119
//                cursorMoveTo(0,cursorGetPosY()-1);
            }
        }
    }
 */  
    printk("\n");
 1003791:	c7 04 24 3f 77 00 01 	mov    DWORD PTR [esp],0x100773f
 1003798:	e8 da ed ff ff       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:121
    
    printd(DEBUG_KERNEL_PAGING,"Test mallocs:\n");
 100379d:	83 c4 08             	add    esp,0x8
 10037a0:	68 6e 77 00 01       	push   0x100776e
 10037a5:	68 00 80 00 00       	push   0x8000
 10037aa:	e8 e0 ed ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:122
    uintptr_t* b1 = malloc(50);
 10037af:	c7 04 24 32 00 00 00 	mov    DWORD PTR [esp],0x32
 10037b6:	e8 30 fc ff ff       	call   10033eb <malloc>
 10037bb:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:123
    sprintf(b1,"The value of b1 = 0x%08X",b1);
 10037bd:	83 c4 0c             	add    esp,0xc
 10037c0:	50                   	push   eax
 10037c1:	68 7d 77 00 01       	push   0x100777d
 10037c6:	50                   	push   eax
 10037c7:	e8 f3 ed ff ff       	call   10025bf <sprintf>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:124
    printd(DEBUG_KERNEL_PAGING,"b1=malloc(1) returned 0x%08X\n\n",b1);
 10037cc:	83 c4 0c             	add    esp,0xc
 10037cf:	53                   	push   ebx
 10037d0:	68 b4 86 00 01       	push   0x10086b4
 10037d5:	68 00 80 00 00       	push   0x8000
 10037da:	e8 b0 ed ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:125
    uintptr_t* b2 = malloc(4095);
 10037df:	c7 04 24 ff 0f 00 00 	mov    DWORD PTR [esp],0xfff
 10037e6:	e8 00 fc ff ff       	call   10033eb <malloc>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:126
    *b2=0xBEEFDEAD;
 10037eb:	c7 00 ad de ef be    	mov    DWORD PTR [eax],0xbeefdead
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:127
    printd(DEBUG_KERNEL_PAGING,"b2=malloc(4095) returned 0x%08X\n\n",b2);
 10037f1:	83 c4 0c             	add    esp,0xc
 10037f4:	50                   	push   eax
 10037f5:	68 d4 86 00 01       	push   0x10086d4
 10037fa:	68 00 80 00 00       	push   0x8000
 10037ff:	e8 8b ed ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:128
    uintptr_t* b5 = malloc(1024*1024*100);
 1003804:	c7 04 24 00 00 40 06 	mov    DWORD PTR [esp],0x6400000
 100380b:	e8 db fb ff ff       	call   10033eb <malloc>
 1003810:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:129
    printd(DEBUG_KERNEL_PAGING,"b4=malloc(100MB) returned 0x%08X\n\n",b5);
 1003812:	83 c4 0c             	add    esp,0xc
 1003815:	50                   	push   eax
 1003816:	68 f8 86 00 01       	push   0x10086f8
 100381b:	68 00 80 00 00       	push   0x8000
 1003820:	e8 6a ed ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:130
    uintptr_t* b6 = malloc(1024*1024*200);
 1003825:	c7 04 24 00 00 80 0c 	mov    DWORD PTR [esp],0xc800000
 100382c:	e8 ba fb ff ff       	call   10033eb <malloc>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:131
    printd(DEBUG_KERNEL_PAGING,"b4=malloc(200MB) returned 0x%08X\n\n",b6);
 1003831:	83 c4 0c             	add    esp,0xc
 1003834:	50                   	push   eax
 1003835:	68 1c 87 00 01       	push   0x100871c
 100383a:	68 00 80 00 00       	push   0x8000
 100383f:	e8 4b ed ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:132
    printd(DEBUG_KERNEL_PAGING,"freeing b2\n");
 1003844:	83 c4 08             	add    esp,0x8
 1003847:	68 96 77 00 01       	push   0x1007796
 100384c:	68 00 80 00 00       	push   0x8000
 1003851:	e8 39 ed ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:133
    free(b5);
 1003856:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1003859:	e8 09 fc ff ff       	call   1003467 <free>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:134
    b5=malloc(100);
 100385e:	c7 04 24 64 00 00 00 	mov    DWORD PTR [esp],0x64
 1003865:	e8 81 fb ff ff       	call   10033eb <malloc>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:135
    printd(DEBUG_KERNEL_PAGING,"b5=malloc(100) returned 0x%08X\n\n",b5);
 100386a:	83 c4 0c             	add    esp,0xc
 100386d:	50                   	push   eax
 100386e:	68 40 87 00 01       	push   0x1008740
 1003873:	68 00 80 00 00       	push   0x8000
 1003878:	e8 12 ed ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:136
    printd(DEBUG_KERNEL_PAGING,"Available memory: %u\n",memAvailable());
 100387d:	e8 35 fc ff ff       	call   10034b7 <memAvailable>
 1003882:	83 c4 0c             	add    esp,0xc
 1003885:	50                   	push   eax
 1003886:	68 a2 77 00 01       	push   0x10077a2
 100388b:	68 00 80 00 00       	push   0x8000
 1003890:	e8 fa ec ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:141
    return;
    
//    for (int cnt=KERNEL_VIRTUAL_EXEC_ADDRESS;cnt<KERNEL_VIRTUAL_EXEC_ADDRESS+0x10000000;cnt+=4096)
//        pagingMapPage
}
 1003895:	83 c4 14             	add    esp,0x14
 1003898:	5b                   	pop    ebx
 1003899:	5e                   	pop    esi
 100389a:	c3                   	ret    
 100389b:	90                   	nop

0100389c <pagingAllocatePagingTablePage>:
pagingAllocatePagingTablePage():
/home/yogi/src/os/chrisOSKernel/src/paging.c:23

#define PAGE_SIZE 0x1000

uint32_t pagingAllocatePagingTablePage()
{
    uint32_t lRetVal = kKernelPoolMemoryAddress;
 100389c:	a1 58 3a 01 01       	mov    eax,ds:0x1013a58
/home/yogi/src/os/chrisOSKernel/src/paging.c:24
    kKernelPoolMemoryAddress+=0x1000;
 10038a1:	8d 90 00 10 00 00    	lea    edx,[eax+0x1000]
 10038a7:	89 15 58 3a 01 01    	mov    DWORD PTR ds:0x1013a58,edx
/home/yogi/src/os/chrisOSKernel/src/paging.c:26
    return lRetVal;
}
 10038ad:	c3                   	ret    

010038ae <pagingGet4kPDEntryValue>:
pagingGet4kPDEntryValue():
/home/yogi/src/os/chrisOSKernel/src/paging.c:29

uint32_t pagingGet4kPDEntryValue(uintptr_t pageDirAddress, uint32_t address)
{
 10038ae:	53                   	push   ebx
 10038af:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/src/paging.c:31
    address&=0xFFFFF000;
    uintptr_t* lTemp=(uint32_t*)((pageDirAddress + (((address & 0xFFC00000) >> 22) << 2)));
 10038b2:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
 10038b6:	c1 eb 16             	shr    ebx,0x16
 10038b9:	c1 e3 02             	shl    ebx,0x2
 10038bc:	03 5c 24 14          	add    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:32
    printd(DEBUG_PAGING,"pagingGet4kPDEntryValue: dirAddressPtr=0x%08x\n", *lTemp);
 10038c0:	ff 33                	push   DWORD PTR [ebx]
 10038c2:	68 14 7b 00 01       	push   0x1007b14
 10038c7:	6a 40                	push   0x40
 10038c9:	e8 c1 ec ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:33
    return (uint32_t)*lTemp;
 10038ce:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/src/paging.c:34
}
 10038d0:	83 c4 18             	add    esp,0x18
 10038d3:	5b                   	pop    ebx
 10038d4:	c3                   	ret    

010038d5 <pagingGet4kPDEntryAddress>:
pagingGet4kPDEntryAddress():
/home/yogi/src/os/chrisOSKernel/src/paging.c:37

uint32_t pagingGet4kPDEntryAddress(uintptr_t pageDirAddress, uint32_t address)
{
 10038d5:	53                   	push   ebx
 10038d6:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/src/paging.c:39
    address&=0xFFFFF000;
    uintptr_t lTemp=((pageDirAddress  | (((address & 0xFFC00000) >> 22) << 2)));
 10038d9:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
 10038dd:	c1 eb 16             	shr    ebx,0x16
 10038e0:	c1 e3 02             	shl    ebx,0x2
 10038e3:	0b 5c 24 14          	or     ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:40
    printd(DEBUG_PAGING,"dirEntryAddress=0x%08x\n", lTemp);
 10038e7:	53                   	push   ebx
 10038e8:	68 1e 74 00 01       	push   0x100741e
 10038ed:	6a 40                	push   0x40
 10038ef:	e8 9b ec ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:42
    return (uint32_t)lTemp & 0xFFFFFFFF;
}
 10038f4:	89 d8                	mov    eax,ebx
 10038f6:	83 c4 18             	add    esp,0x18
 10038f9:	5b                   	pop    ebx
 10038fa:	c3                   	ret    

010038fb <pagingGet4kPTEntryAddress>:
pagingGet4kPTEntryAddress():
/home/yogi/src/os/chrisOSKernel/src/paging.c:45

uint32_t pagingGet4kPTEntryAddress(uintptr_t pageDirAddress, uint32_t address)
{
 10038fb:	53                   	push   ebx
 10038fc:	83 ec 10             	sub    esp,0x10
 10038ff:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/src/paging.c:47
    address&=0xFFFFF000;
    uintptr_t pDirPtr=pagingGet4kPDEntryValue(pageDirAddress,address) & 0xFFFFF000;
 1003903:	89 d8                	mov    eax,ebx
 1003905:	25 00 f0 ff ff       	and    eax,0xfffff000
 100390a:	50                   	push   eax
 100390b:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100390f:	e8 9a ff ff ff       	call   10038ae <pagingGet4kPDEntryValue>
/home/yogi/src/os/chrisOSKernel/src/paging.c:48
    return ((address & 0x3FF000) >> 12) << 2 | pDirPtr;
 1003914:	81 e3 00 f0 3f 00    	and    ebx,0x3ff000
 100391a:	c1 eb 0a             	shr    ebx,0xa
 100391d:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003922:	09 d8                	or     eax,ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:49
}
 1003924:	83 c4 18             	add    esp,0x18
 1003927:	5b                   	pop    ebx
 1003928:	c3                   	ret    

01003929 <pagingGet4kPTEntryValue>:
pagingGet4kPTEntryValue():
/home/yogi/src/os/chrisOSKernel/src/paging.c:52

uint32_t pagingGet4kPTEntryValue(uintptr_t pageDirAddress, uint32_t address)
{
 1003929:	53                   	push   ebx
 100392a:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/paging.c:54
    address&=0xFFFFF000;
    uint32_t* pTablePtr=(uint32_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 100392d:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1003931:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003936:	50                   	push   eax
 1003937:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100393b:	e8 bb ff ff ff       	call   10038fb <pagingGet4kPTEntryAddress>
 1003940:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:55
    printd(DEBUG_PAGING,"pagingGet4kPTEntryValue: pageEntryAddress=0x%08X\n", pTablePtr);
 1003942:	83 c4 0c             	add    esp,0xc
 1003945:	50                   	push   eax
 1003946:	68 44 7b 00 01       	push   0x1007b44
 100394b:	6a 40                	push   0x40
 100394d:	e8 3d ec ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:56
    return *pTablePtr;
 1003952:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/src/paging.c:57
}
 1003954:	83 c4 18             	add    esp,0x18
 1003957:	5b                   	pop    ebx
 1003958:	c3                   	ret    

01003959 <pagingSetPageReadOnlyFlag>:
pagingSetPageReadOnlyFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:60

void pagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly)
{
 1003959:	56                   	push   esi
 100395a:	53                   	push   ebx
 100395b:	83 ec 04             	sub    esp,0x4
 100395e:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1003962:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:61
    printd(DEBUG_PAGING,"pagingMakePageReadOnly: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 1003966:	ff 33                	push   DWORD PTR [ebx]
 1003968:	53                   	push   ebx
 1003969:	68 78 7b 00 01       	push   0x1007b78
 100396e:	6a 40                	push   0x40
 1003970:	e8 1a ec ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:62
    if (readOnly)
 1003975:	83 c4 10             	add    esp,0x10
 1003978:	89 f0                	mov    eax,esi
 100397a:	84 c0                	test   al,al
 100397c:	74 05                	je     1003983 <pagingSetPageReadOnlyFlag+0x2a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:63
       *ptEntry&=0xFFFFFFFD;
 100397e:	83 23 fd             	and    DWORD PTR [ebx],0xfffffffd
 1003981:	eb 03                	jmp    1003986 <pagingSetPageReadOnlyFlag+0x2d>
/home/yogi/src/os/chrisOSKernel/src/paging.c:65
    else
       *ptEntry|=2; 
 1003983:	83 0b 02             	or     DWORD PTR [ebx],0x2
/home/yogi/src/os/chrisOSKernel/src/paging.c:66
    RELOAD_CR3
 1003986:	0f 20 d8             	mov    eax,cr3
 1003989:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:67
    printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 100398c:	83 ec 04             	sub    esp,0x4
 100398f:	ff 33                	push   DWORD PTR [ebx]
 1003991:	68 66 77 00 01       	push   0x1007766
 1003996:	6a 40                	push   0x40
 1003998:	e8 f2 eb ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:68
}
 100399d:	83 c4 14             	add    esp,0x14
 10039a0:	5b                   	pop    ebx
 10039a1:	5e                   	pop    esi
 10039a2:	c3                   	ret    

010039a3 <pagingUpdatePTEPresentFlag>:
pagingUpdatePTEPresentFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:71

void pagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present)
{
 10039a3:	56                   	push   esi
 10039a4:	53                   	push   ebx
 10039a5:	83 ec 04             	sub    esp,0x4
 10039a8:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10039ac:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:72
         printd(DEBUG_PAGING,"pagingUpdatePTEPresentFlag: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 10039b0:	ff 33                	push   DWORD PTR [ebx]
 10039b2:	53                   	push   ebx
 10039b3:	68 b0 7b 00 01       	push   0x1007bb0
 10039b8:	6a 40                	push   0x40
 10039ba:	e8 d0 eb ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:73
         if (present)
 10039bf:	83 c4 10             	add    esp,0x10
 10039c2:	89 f0                	mov    eax,esi
 10039c4:	84 c0                	test   al,al
 10039c6:	74 05                	je     10039cd <pagingUpdatePTEPresentFlag+0x2a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:74
             *ptEntry=*ptEntry | 1;
 10039c8:	83 0b 01             	or     DWORD PTR [ebx],0x1
 10039cb:	eb 03                	jmp    10039d0 <pagingUpdatePTEPresentFlag+0x2d>
/home/yogi/src/os/chrisOSKernel/src/paging.c:76
         else
             *ptEntry&=0xFFFFFFFE;
 10039cd:	83 23 fe             	and    DWORD PTR [ebx],0xfffffffe
/home/yogi/src/os/chrisOSKernel/src/paging.c:77
         __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
 10039d0:	0f 20 d8             	mov    eax,cr3
 10039d3:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:78
         printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 10039d6:	83 ec 04             	sub    esp,0x4
 10039d9:	ff 33                	push   DWORD PTR [ebx]
 10039db:	68 66 77 00 01       	push   0x1007766
 10039e0:	6a 40                	push   0x40
 10039e2:	e8 a8 eb ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:79
}
 10039e7:	83 c4 14             	add    esp,0x14
 10039ea:	5b                   	pop    ebx
 10039eb:	5e                   	pop    esi
 10039ec:	c3                   	ret    

010039ed <pagingSetVirtualRangeRO>:
pagingSetVirtualRangeRO():
/home/yogi/src/os/chrisOSKernel/src/paging.c:82

void pagingSetVirtualRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 10039ed:	55                   	push   ebp
 10039ee:	57                   	push   edi
 10039ef:	56                   	push   esi
 10039f0:	53                   	push   ebx
 10039f1:	83 ec 1c             	sub    esp,0x1c
 10039f4:	8b 5c 24 34          	mov    ebx,DWORD PTR [esp+0x34]
 10039f8:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
 10039fc:	8b 74 24 3c          	mov    esi,DWORD PTR [esp+0x3c]
 1003a00:	89 f0                	mov    eax,esi
 1003a02:	88 44 24 0f          	mov    BYTE PTR [esp+0xf],al
/home/yogi/src/os/chrisOSKernel/src/paging.c:84
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
 1003a06:	57                   	push   edi
 1003a07:	53                   	push   ebx
 1003a08:	68 ec 7b 00 01       	push   0x1007bec
 1003a0d:	6a 40                	push   0x40
 1003a0f:	e8 7b eb ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:85
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 1003a14:	8d 4f 01             	lea    ecx,[edi+0x1]
 1003a17:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
 1003a1b:	83 c4 10             	add    esp,0x10
 1003a1e:	39 cb                	cmp    ebx,ecx
 1003a20:	77 4f                	ja     1003a71 <pagingSetVirtualRangeRO+0x84>
 1003a22:	89 f2                	mov    edx,esi
 1003a24:	84 d2                	test   dl,dl
 1003a26:	b8 39 74 00 01       	mov    eax,0x1007439
 1003a2b:	bd 36 74 00 01       	mov    ebp,0x1007436
 1003a30:	0f 44 e8             	cmove  ebp,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:89
    {
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 1003a33:	0f b6 7c 24 0f       	movzx  edi,BYTE PTR [esp+0xf]
/home/yogi/src/os/chrisOSKernel/src/paging.c:87
{
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
    {
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
 1003a38:	83 ec 08             	sub    esp,0x8
 1003a3b:	53                   	push   ebx
 1003a3c:	ff 74 24 3c          	push   DWORD PTR [esp+0x3c]
 1003a40:	e8 b6 fe ff ff       	call   10038fb <pagingGet4kPTEntryAddress>
 1003a45:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:88
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
 1003a47:	89 2c 24             	mov    DWORD PTR [esp],ebp
 1003a4a:	50                   	push   eax
 1003a4b:	53                   	push   ebx
 1003a4c:	68 3c 74 00 01       	push   0x100743c
 1003a51:	6a 40                	push   0x40
 1003a53:	e8 37 eb ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:89
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 1003a58:	83 c4 18             	add    esp,0x18
 1003a5b:	57                   	push   edi
 1003a5c:	56                   	push   esi
 1003a5d:	e8 69 d8 ff ff       	call   10012cb <kPagingSetPageReadOnlyFlag>
/home/yogi/src/os/chrisOSKernel/src/paging.c:85

void pagingSetVirtualRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 1003a62:	81 c3 00 10 00 00    	add    ebx,0x1000
 1003a68:	83 c4 10             	add    esp,0x10
 1003a6b:	3b 5c 24 08          	cmp    ebx,DWORD PTR [esp+0x8]
 1003a6f:	76 c7                	jbe    1003a38 <pagingSetVirtualRangeRO+0x4b>
/home/yogi/src/os/chrisOSKernel/src/paging.c:92
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
            
    }
}
 1003a71:	83 c4 1c             	add    esp,0x1c
 1003a74:	5b                   	pop    ebx
 1003a75:	5e                   	pop    esi
 1003a76:	5f                   	pop    edi
 1003a77:	5d                   	pop    ebp
 1003a78:	c3                   	ret    

01003a79 <pagingUpdatePresentFlagA>:
pagingUpdatePresentFlagA():
/home/yogi/src/os/chrisOSKernel/src/paging.c:96

//Absolute version, page passed is already virtual
void pagingUpdatePresentFlagA(uintptr_t pageDirAddress, uint32_t address, bool present)
{
 1003a79:	56                   	push   esi
 1003a7a:	53                   	push   ebx
 1003a7b:	83 ec 04             	sub    esp,0x4
 1003a7e:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
 1003a82:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/src/paging.c:97
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: Make 0x%08X %s\n", address, present?"present":"not present");
 1003a86:	84 db                	test   bl,bl
 1003a88:	ba 54 74 00 01       	mov    edx,0x1007454
 1003a8d:	b8 58 74 00 01       	mov    eax,0x1007458
 1003a92:	0f 44 c2             	cmove  eax,edx
 1003a95:	50                   	push   eax
 1003a96:	56                   	push   esi
 1003a97:	68 1c 7c 00 01       	push   0x1007c1c
 1003a9c:	6a 40                	push   0x40
 1003a9e:	e8 ec ea ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:98
        uintptr_t* pagePTE= (uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address&0xFFFFF000);
 1003aa3:	83 c4 08             	add    esp,0x8
 1003aa6:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 1003aac:	56                   	push   esi
 1003aad:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003ab1:	e8 45 fe ff ff       	call   10038fb <pagingGet4kPTEntryAddress>
 1003ab6:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:99
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: updating entry 0x%08X\n", pagePTE);
 1003ab8:	83 c4 0c             	add    esp,0xc
 1003abb:	50                   	push   eax
 1003abc:	68 48 7c 00 01       	push   0x1007c48
 1003ac1:	6a 40                	push   0x40
 1003ac3:	e8 c7 ea ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:100
    pagingUpdatePTEPresentFlag(pagePTE, present);
 1003ac8:	83 c4 08             	add    esp,0x8
 1003acb:	0f b6 db             	movzx  ebx,bl
 1003ace:	53                   	push   ebx
 1003acf:	56                   	push   esi
 1003ad0:	e8 ce fe ff ff       	call   10039a3 <pagingUpdatePTEPresentFlag>
/home/yogi/src/os/chrisOSKernel/src/paging.c:101
}
 1003ad5:	83 c4 14             	add    esp,0x14
 1003ad8:	5b                   	pop    ebx
 1003ad9:	5e                   	pop    esi
 1003ada:	c3                   	ret    

01003adb <pagingUpdatePresentFlagV>:
pagingUpdatePresentFlagV():
/home/yogi/src/os/chrisOSKernel/src/paging.c:104

void pagingUpdatePresentFlagV(uintptr_t pageDirAddress,uint32_t address, bool present)
{
 1003adb:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/paging.c:106
    address+=KERNEL_PAGED_BASE_ADDRESS; 
    pagingUpdatePresentFlagA(pageDirAddress,address, present);
 1003ade:	0f b6 44 24 1c       	movzx  eax,BYTE PTR [esp+0x1c]
 1003ae3:	50                   	push   eax
 1003ae4:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1003ae8:	2d 00 00 00 40       	sub    eax,0x40000000
 1003aed:	50                   	push   eax
 1003aee:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003af2:	e8 82 ff ff ff       	call   1003a79 <pagingUpdatePresentFlagA>
/home/yogi/src/os/chrisOSKernel/src/paging.c:107
}
 1003af7:	83 c4 1c             	add    esp,0x1c
 1003afa:	c3                   	ret    

01003afb <pagingMapPage>:
pagingMapPage():
/home/yogi/src/os/chrisOSKernel/src/paging.c:113

///Map a page to a new address
///mapFrom is the original address
///mapTo is the new address that the page will be available at
void pagingMapPage(uintptr_t pageDirAddress, uintptr_t mapTo, uintptr_t mapFrom, uint8_t flags)
{
 1003afb:	55                   	push   ebp
 1003afc:	57                   	push   edi
 1003afd:	56                   	push   esi
 1003afe:	53                   	push   ebx
 1003aff:	83 ec 0c             	sub    esp,0xc
 1003b02:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 1003b06:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
 1003b0a:	8b 5c 24 2c          	mov    ebx,DWORD PTR [esp+0x2c]
/home/yogi/src/os/chrisOSKernel/src/paging.c:121
    uint32_t *ptrT;
    
    //Get pointer to the page directory
    ptr=(uint32_t*)pageDirAddress;
    //Get the appropriate entry in the page table
    ptrVal=ptr[(mapTo>>22)];
 1003b0e:	89 f0                	mov    eax,esi
 1003b10:	c1 e8 16             	shr    eax,0x16
 1003b13:	8d 7c 85 00          	lea    edi,[ebp+eax*4+0x0]
 1003b17:	8b 07                	mov    eax,DWORD PTR [edi]
/home/yogi/src/os/chrisOSKernel/src/paging.c:122
    if (ptrVal==0)
 1003b19:	85 c0                	test   eax,eax
 1003b1b:	75 46                	jne    1003b63 <pagingMapPage+0x68>
/home/yogi/src/os/chrisOSKernel/src/paging.c:125
    {
        //Get a page for the page table
        *ptrT=(uint32_t*)pagingAllocatePagingTablePage();
 1003b1d:	e8 7a fd ff ff       	call   100389c <pagingAllocatePagingTablePage>
/home/yogi/src/os/chrisOSKernel/src/paging.c:126
        printd(DEBUG_PAGING,"pagingMapPage: Page table didn't exist for address 0x%08X (CR3=0x%08X)\n\tAllocated page @ 0x%08X for the page table\n",mapTo,pageDirAddress,  *ptrT);
 1003b22:	83 ec 0c             	sub    esp,0xc
 1003b25:	50                   	push   eax
 1003b26:	55                   	push   ebp
 1003b27:	56                   	push   esi
 1003b28:	68 64 87 00 01       	push   0x1008764
 1003b2d:	6a 40                	push   0x40
 1003b2f:	e8 5b ea ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:127
        ptr[(mapTo>>22)]=0x20000063;
 1003b34:	c7 07 63 00 00 20    	mov    DWORD PTR [edi],0x20000063
/home/yogi/src/os/chrisOSKernel/src/paging.c:129
        ptrT[(mapTo&0x003FFFFF/4096)]=mapFrom | flags;
        printd(DEBUG_PAGING,"kMapPage: Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)],ptrT[(mapTo&0x003FFFFF/4096)]);
 1003b3a:	83 c4 18             	add    esp,0x18
 1003b3d:	0f b6 db             	movzx  ebx,bl
 1003b40:	0b 5c 24 30          	or     ebx,DWORD PTR [esp+0x30]
 1003b44:	53                   	push   ebx
 1003b45:	89 f0                	mov    eax,esi
 1003b47:	25 ff 03 00 00       	and    eax,0x3ff
 1003b4c:	c1 e0 02             	shl    eax,0x2
 1003b4f:	50                   	push   eax
 1003b50:	57                   	push   edi
 1003b51:	56                   	push   esi
 1003b52:	68 7c 7c 00 01       	push   0x1007c7c
 1003b57:	6a 40                	push   0x40
 1003b59:	e8 31 ea ff ff       	call   100258f <printd>
 1003b5e:	83 c4 20             	add    esp,0x20
 1003b61:	eb 32                	jmp    1003b95 <pagingMapPage+0x9a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:142
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=mapFrom | flags;
 1003b63:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003b68:	89 c2                	mov    edx,eax
 1003b6a:	89 f0                	mov    eax,esi
 1003b6c:	c1 e8 0a             	shr    eax,0xa
 1003b6f:	25 fc 0f 00 00       	and    eax,0xffc
 1003b74:	01 d0                	add    eax,edx
 1003b76:	0f b6 db             	movzx  ebx,bl
 1003b79:	0b 5c 24 28          	or     ebx,DWORD PTR [esp+0x28]
 1003b7d:	89 18                	mov    DWORD PTR [eax],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:143
        printd(DEBUG_PAGING,"2) Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal],ptrT[ptrVal]);
 1003b7f:	83 ec 08             	sub    esp,0x8
 1003b82:	53                   	push   ebx
 1003b83:	50                   	push   eax
 1003b84:	57                   	push   edi
 1003b85:	56                   	push   esi
 1003b86:	68 bc 7c 00 01       	push   0x1007cbc
 1003b8b:	6a 40                	push   0x40
 1003b8d:	e8 fd e9 ff ff       	call   100258f <printd>
 1003b92:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:145
    }
}
 1003b95:	83 c4 0c             	add    esp,0xc
 1003b98:	5b                   	pop    ebx
 1003b99:	5e                   	pop    esi
 1003b9a:	5f                   	pop    edi
 1003b9b:	5d                   	pop    ebp
 1003b9c:	c3                   	ret    

01003b9d <isPageMapped>:
isPageMapped():
/home/yogi/src/os/chrisOSKernel/src/paging.c:148

bool isPageMapped(uintptr_t pageDirAddress, uintptr_t Address)
{
 1003b9d:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/src/paging.c:149
    if (!pagingGet4kPTEntryValue(pageDirAddress,Address))
 1003ba0:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003ba4:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003ba8:	e8 7c fd ff ff       	call   1003929 <pagingGet4kPTEntryValue>
 1003bad:	85 c0                	test   eax,eax
 1003baf:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/src/paging.c:152
        return false;
    return true;
}
 1003bb2:	83 c4 1c             	add    esp,0x1c
 1003bb5:	c3                   	ret    

01003bb6 <unMapPage>:
unMapPage():
/home/yogi/src/os/chrisOSKernel/src/paging.c:155

void unMapPage(uintptr_t pageDirAddress, uintptr_t mapTo, uint8_t newFlags)
{
 1003bb6:	57                   	push   edi
 1003bb7:	56                   	push   esi
 1003bb8:	53                   	push   ebx
 1003bb9:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
 1003bbd:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/src/paging.c:160
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)pageDirAddress;
    ptrVal=ptr[(mapTo>>22)];
 1003bc1:	89 c8                	mov    eax,ecx
 1003bc3:	c1 e8 16             	shr    eax,0x16
 1003bc6:	c1 e0 02             	shl    eax,0x2
 1003bc9:	03 44 24 10          	add    eax,DWORD PTR [esp+0x10]
 1003bcd:	8b 10                	mov    edx,DWORD PTR [eax]
/home/yogi/src/os/chrisOSKernel/src/paging.c:161
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
 1003bcf:	85 d2                	test   edx,edx
 1003bd1:	75 4b                	jne    1003c1e <unMapPage+0x68>
/home/yogi/src/os/chrisOSKernel/src/paging.c:161 (discriminator 1)
 1003bd3:	bf 00 00 00 00       	mov    edi,0x0
 1003bd8:	3b 3d 4c 00 12 00    	cmp    edi,DWORD PTR ds:0x12004c
 1003bde:	72 08                	jb     1003be8 <unMapPage+0x32>
 1003be0:	3b 0d 48 00 12 00    	cmp    ecx,DWORD PTR ds:0x120048
 1003be6:	73 36                	jae    1003c1e <unMapPage+0x68>
/home/yogi/src/os/chrisOSKernel/src/paging.c:164
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
 1003be8:	c7 00 63 00 00 20    	mov    DWORD PTR [eax],0x20000063
/home/yogi/src/os/chrisOSKernel/src/paging.c:165
        ptrT[(mapTo&0x003FFFFF/4096)]=0 | newFlags;
 1003bee:	89 ca                	mov    edx,ecx
 1003bf0:	81 e2 ff 03 00 00    	and    edx,0x3ff
 1003bf6:	8d 34 95 00 00 00 20 	lea    esi,[edx*4+0x20000000]
 1003bfd:	0f b6 db             	movzx  ebx,bl
 1003c00:	89 1c 95 00 00 00 20 	mov    DWORD PTR [edx*4+0x20000000],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:166
        printd(DEBUG_PAGING,"kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)]);
 1003c07:	83 ec 0c             	sub    esp,0xc
 1003c0a:	56                   	push   esi
 1003c0b:	50                   	push   eax
 1003c0c:	51                   	push   ecx
 1003c0d:	68 f8 7c 00 01       	push   0x1007cf8
 1003c12:	6a 40                	push   0x40
 1003c14:	e8 76 e9 ff ff       	call   100258f <printd>
 1003c19:	83 c4 20             	add    esp,0x20
 1003c1c:	eb 2f                	jmp    1003c4d <unMapPage+0x97>
/home/yogi/src/os/chrisOSKernel/src/paging.c:177
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=0 | newFlags;
 1003c1e:	89 d6                	mov    esi,edx
 1003c20:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 1003c26:	89 ca                	mov    edx,ecx
 1003c28:	c1 ea 0a             	shr    edx,0xa
 1003c2b:	81 e2 fc 0f 00 00    	and    edx,0xffc
 1003c31:	01 f2                	add    edx,esi
 1003c33:	0f b6 db             	movzx  ebx,bl
 1003c36:	89 1a                	mov    DWORD PTR [edx],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:178
        printd(DEBUG_PAGING,"2) Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal]);
 1003c38:	83 ec 0c             	sub    esp,0xc
 1003c3b:	52                   	push   edx
 1003c3c:	50                   	push   eax
 1003c3d:	51                   	push   ecx
 1003c3e:	68 30 7d 00 01       	push   0x1007d30
 1003c43:	6a 40                	push   0x40
 1003c45:	e8 45 e9 ff ff       	call   100258f <printd>
 1003c4a:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:180
    }
}
 1003c4d:	5b                   	pop    ebx
 1003c4e:	5e                   	pop    esi
 1003c4f:	5f                   	pop    edi
 1003c50:	c3                   	ret    

01003c51 <pagingSetPhysicalRangeRO>:
pagingSetPhysicalRangeRO():
/home/yogi/src/os/chrisOSKernel/src/paging.c:183

void pagingSetPhysicalRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 1003c51:	83 ec 14             	sub    esp,0x14
 1003c54:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1003c58:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
/home/yogi/src/os/chrisOSKernel/src/paging.c:184
    printd(DEBUG_PAGING,"kMakePhysicalRangeRO: Make 0x%08X(0x%08X)-0x%08X(0x%08X) r/o\n", startAddy, startAddy&0xFffff000, endAddy, endAddy&0xFFFFF000);
 1003c5c:	89 d1                	mov    ecx,edx
 1003c5e:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 1003c64:	51                   	push   ecx
 1003c65:	52                   	push   edx
 1003c66:	89 c2                	mov    edx,eax
 1003c68:	81 e2 00 f0 ff ff    	and    edx,0xfffff000
 1003c6e:	52                   	push   edx
 1003c6f:	50                   	push   eax
 1003c70:	68 60 7d 00 01       	push   0x1007d60
 1003c75:	6a 40                	push   0x40
 1003c77:	e8 13 e9 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:185
        panic("fix this!!!");
 1003c7c:	83 c4 14             	add    esp,0x14
 1003c7f:	68 b8 77 00 01       	push   0x10077b8
 1003c84:	e8 67 e4 ff ff       	call   10020f0 <panic>
/home/yogi/src/os/chrisOSKernel/src/paging.c:187
        //SetVirtualRangeRO((startAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, (endAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, readOnly);
}
 1003c89:	83 c4 1c             	add    esp,0x1c
 1003c8c:	c3                   	ret    

01003c8d <pagingSetPageInUseFlag>:
pagingSetPageInUseFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:190

void pagingSetPageInUseFlag(uintptr_t pageDirAddress, uintptr_t address, bool inUse)
{
 1003c8d:	56                   	push   esi
 1003c8e:	53                   	push   ebx
 1003c8f:	83 ec 04             	sub    esp,0x4
 1003c92:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 1003c96:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:192
    uintptr_t* ptEntry;
    printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 1003c9a:	80 7c 24 18 00       	cmp    BYTE PTR [esp+0x18],0x0
 1003c9f:	74 38                	je     1003cd9 <pagingSetPageInUseFlag+0x4c>
 1003ca1:	68 64 74 00 01       	push   0x1007464
 1003ca6:	53                   	push   ebx
 1003ca7:	68 a0 7d 00 01       	push   0x1007da0
 1003cac:	6a 40                	push   0x40
 1003cae:	e8 dc e8 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:193
    ptEntry=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 1003cb3:	83 c4 08             	add    esp,0x8
 1003cb6:	53                   	push   ebx
 1003cb7:	56                   	push   esi
 1003cb8:	e8 3e fc ff ff       	call   10038fb <pagingGet4kPTEntryAddress>
 1003cbd:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:194
    printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 1003cbf:	ff 30                	push   DWORD PTR [eax]
 1003cc1:	50                   	push   eax
 1003cc2:	68 e4 7d 00 01       	push   0x1007de4
 1003cc7:	6a 40                	push   0x40
 1003cc9:	e8 c1 e8 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:196
    if (inUse)
        *ptEntry|=PAGING_IN_USE_FLAG_MASK;
 1003cce:	81 0b 00 08 00 00    	or     DWORD PTR [ebx],0x800
 1003cd4:	83 c4 20             	add    esp,0x20
 1003cd7:	eb 36                	jmp    1003d0f <pagingSetPageInUseFlag+0x82>
/home/yogi/src/os/chrisOSKernel/src/paging.c:192
}

void pagingSetPageInUseFlag(uintptr_t pageDirAddress, uintptr_t address, bool inUse)
{
    uintptr_t* ptEntry;
    printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 1003cd9:	68 60 74 00 01       	push   0x1007460
 1003cde:	53                   	push   ebx
 1003cdf:	68 a0 7d 00 01       	push   0x1007da0
 1003ce4:	6a 40                	push   0x40
 1003ce6:	e8 a4 e8 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:193
    ptEntry=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 1003ceb:	83 c4 08             	add    esp,0x8
 1003cee:	53                   	push   ebx
 1003cef:	56                   	push   esi
 1003cf0:	e8 06 fc ff ff       	call   10038fb <pagingGet4kPTEntryAddress>
 1003cf5:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:194
    printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 1003cf7:	ff 30                	push   DWORD PTR [eax]
 1003cf9:	50                   	push   eax
 1003cfa:	68 e4 7d 00 01       	push   0x1007de4
 1003cff:	6a 40                	push   0x40
 1003d01:	e8 89 e8 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:198
    if (inUse)
        *ptEntry|=PAGING_IN_USE_FLAG_MASK;
    else
        *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
 1003d06:	81 23 ff f7 ff ff    	and    DWORD PTR [ebx],0xfffff7ff
 1003d0c:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:199
}
 1003d0f:	83 c4 04             	add    esp,0x4
 1003d12:	5b                   	pop    ebx
 1003d13:	5e                   	pop    esi
 1003d14:	c3                   	ret    

01003d15 <pagingSetPageRangeInUseFlag>:
pagingSetPageRangeInUseFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:202

void pagingSetPageRangeInUseFlag(uintptr_t pageDirAddress, uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
 1003d15:	55                   	push   ebp
 1003d16:	57                   	push   edi
 1003d17:	56                   	push   esi
 1003d18:	53                   	push   ebx
 1003d19:	83 ec 0c             	sub    esp,0xc
 1003d1c:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 1003d20:	8b 5c 24 24          	mov    ebx,DWORD PTR [esp+0x24]
 1003d24:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
 1003d28:	0f b6 44 24 30       	movzx  eax,BYTE PTR [esp+0x30]
/home/yogi/src/os/chrisOSKernel/src/paging.c:203
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 1003d2d:	39 fb                	cmp    ebx,edi
 1003d2f:	73 19                	jae    1003d4a <pagingSetPageRangeInUseFlag+0x35>
/home/yogi/src/os/chrisOSKernel/src/paging.c:204 (discriminator 3)
        pagingSetPageInUseFlag(pageDirAddress,cnt,inUse);
 1003d31:	0f b6 f0             	movzx  esi,al
 1003d34:	83 ec 04             	sub    esp,0x4
 1003d37:	56                   	push   esi
 1003d38:	53                   	push   ebx
 1003d39:	55                   	push   ebp
 1003d3a:	e8 4e ff ff ff       	call   1003c8d <pagingSetPageInUseFlag>
 1003d3f:	03 5c 24 3c          	add    ebx,DWORD PTR [esp+0x3c]
/home/yogi/src/os/chrisOSKernel/src/paging.c:203 (discriminator 3)
        *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
}

void pagingSetPageRangeInUseFlag(uintptr_t pageDirAddress, uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 1003d43:	83 c4 10             	add    esp,0x10
 1003d46:	39 fb                	cmp    ebx,edi
 1003d48:	72 ea                	jb     1003d34 <pagingSetPageRangeInUseFlag+0x1f>
/home/yogi/src/os/chrisOSKernel/src/paging.c:205
        pagingSetPageInUseFlag(pageDirAddress,cnt,inUse);
}
 1003d4a:	83 c4 0c             	add    esp,0xc
 1003d4d:	5b                   	pop    ebx
 1003d4e:	5e                   	pop    esi
 1003d4f:	5f                   	pop    edi
 1003d50:	5d                   	pop    ebp
 1003d51:	c3                   	ret    
 1003d52:	66 90                	xchg   ax,ax

01003d54 <syscall169>:
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:25

void syscall169()
{
    uint8_t temp;
 
    __asm__ volatile ("cli"); /* disable all interrupts */
 1003d54:	fa                   	cli    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1003d55:	e4 64                	in     al,0x64
 1003d57:	89 c2                	mov    edx,eax
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:30
    /* Clear all keyboard buffers (output and command buffers) */
    do
    {
        temp = inb(KBRD_INTRFC); /* empty user data */
        if (check_flag(temp, KBRD_BIT_KDATA) != 0)
 1003d59:	a8 01                	test   al,0x1
 1003d5b:	74 02                	je     1003d5f <syscall169+0xb>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1003d5d:	e4 60                	in     al,0x60
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:32
            inb(KBRD_IO); /* empty keyboard data */
    } while (check_flag(temp, KBRD_BIT_UDATA) != 0);
 1003d5f:	f6 c2 02             	test   dl,0x2
 1003d62:	75 f1                	jne    1003d55 <syscall169+0x1>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1003d64:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 1003d69:	e6 64                	out    0x64,al
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:36 (discriminator 1)
 
    outb(KBRD_INTRFC, KBRD_RESET); /* pulse CPU reset line */
loop:
    __asm__ volatile ("hlt"); /* if that didn't work, halt the CPU */
 1003d6b:	f4                   	hlt    
 1003d6c:	eb fd                	jmp    1003d6b <syscall169+0x17>
 1003d6e:	66 90                	xchg   ax,ax

01003d70 <taskInit>:
taskInit():
/home/yogi/src/os/chrisOSKernel/src/task.c:15
extern tss_t* kTSSTable;
extern task_t* kTaskTable;
extern uint32_t kDebugLevel;

void taskInit()
{
 1003d70:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:18 (discriminator 3)
    for (int cnt=0;cnt<TSS_TABLE_RECORD_COUNT/8;cnt++)
    {
        kTaskSlotAvailableInd[cnt]=0xFFFFFFFF;
 1003d75:	8b 15 48 01 12 00    	mov    edx,DWORD PTR ds:0x120148
 1003d7b:	c7 04 02 ff ff ff ff 	mov    DWORD PTR [edx+eax*1],0xffffffff
 1003d82:	83 c0 04             	add    eax,0x4
/home/yogi/src/os/chrisOSKernel/src/task.c:16 (discriminator 3)
extern task_t* kTaskTable;
extern uint32_t kDebugLevel;

void taskInit()
{
    for (int cnt=0;cnt<TSS_TABLE_RECORD_COUNT/8;cnt++)
 1003d85:	3d 00 20 00 00       	cmp    eax,0x2000
 1003d8a:	75 e9                	jne    1003d75 <taskInit+0x5>
/home/yogi/src/os/chrisOSKernel/src/task.c:20
    {
        kTaskSlotAvailableInd[cnt]=0xFFFFFFFF;
    }
}
 1003d8c:	f3 c3                	repz ret 

01003d8e <getTaskSlot>:
getTaskSlot():
/home/yogi/src/os/chrisOSKernel/src/task.c:24

///Find an open TSS slot and mark it in use
task_t* getTaskSlot()
{
 1003d8e:	57                   	push   edi
 1003d8f:	56                   	push   esi
 1003d90:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/src/task.c:26
   int cnt=0,slot=0;
   uint32_t* ptr=kTaskSlotAvailableInd;
 1003d91:	8b 1d 48 01 12 00    	mov    ebx,DWORD PTR ds:0x120148
/home/yogi/src/os/chrisOSKernel/src/task.c:25
}

///Find an open TSS slot and mark it in use
task_t* getTaskSlot()
{
   int cnt=0,slot=0;
 1003d97:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:29
   uint32_t* ptr=kTaskSlotAvailableInd;
    while (cnt < TSS_TABLE_RECORD_COUNT/32)
    {
        printd (DEBUG_TASK,"getTask: Checking slots at 0x%08X, cnt=%u\n",ptr,cnt);
 1003d9c:	56                   	push   esi
 1003d9d:	53                   	push   ebx
 1003d9e:	68 d8 87 00 01       	push   0x10087d8
 1003da3:	68 00 40 00 00       	push   0x4000
 1003da8:	e8 e2 e7 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/task.c:30
        slot=bitsScanF(ptr);
 1003dad:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1003db0:	e8 b6 c8 ff ff       	call   100066b <bitsScanF>
 1003db5:	89 c7                	mov    edi,eax
/home/yogi/src/os/chrisOSKernel/src/task.c:31
        if (slot>-1)
 1003db7:	83 c4 10             	add    esp,0x10
 1003dba:	85 c0                	test   eax,eax
 1003dbc:	78 5f                	js     1003e1d <getTaskSlot+0x8f>
/home/yogi/src/os/chrisOSKernel/src/task.c:33
        {
            task_t* task=&kTaskTable[slot];
 1003dbe:	89 c6                	mov    esi,eax
 1003dc0:	c1 e6 04             	shl    esi,0x4
 1003dc3:	03 35 fc 03 12 00    	add    esi,DWORD PTR ds:0x1203fc
/home/yogi/src/os/chrisOSKernel/src/task.c:34
            printd(DEBUG_TASK,"getTask: Marking TSS %u used\n",slot);
 1003dc9:	83 ec 04             	sub    esp,0x4
 1003dcc:	50                   	push   eax
 1003dcd:	68 c4 77 00 01       	push   0x10077c4
 1003dd2:	68 00 40 00 00       	push   0x4000
 1003dd7:	e8 b3 e7 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/task.c:35
            bitsReset(ptr,slot);
 1003ddc:	83 c4 08             	add    esp,0x8
 1003ddf:	57                   	push   edi
 1003de0:	53                   	push   ebx
 1003de1:	e8 53 c8 ff ff       	call   1000639 <bitsReset>
/home/yogi/src/os/chrisOSKernel/src/task.c:36
            task->tss=&kTSSTable[slot];
 1003de6:	6b c7 68             	imul   eax,edi,0x68
 1003de9:	03 05 f8 03 12 00    	add    eax,DWORD PTR ds:0x1203f8
 1003def:	89 06                	mov    DWORD PTR [esi],eax
/home/yogi/src/os/chrisOSKernel/src/task.c:37
            if (slot>0)
 1003df1:	83 c4 10             	add    esp,0x10
 1003df4:	85 ff                	test   edi,edi
 1003df6:	7e 09                	jle    1003e01 <getTaskSlot+0x73>
/home/yogi/src/os/chrisOSKernel/src/task.c:39
            {
                (task-1)->next=task;
 1003df8:	89 76 f8             	mov    DWORD PTR [esi-0x8],esi
/home/yogi/src/os/chrisOSKernel/src/task.c:40
                task->prev=(task-1);
 1003dfb:	8d 56 f0             	lea    edx,[esi-0x10]
 1003dfe:	89 56 0c             	mov    DWORD PTR [esi+0xc],edx
/home/yogi/src/os/chrisOSKernel/src/task.c:42
            }
            printd(DEBUG_TASK,"getTask: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
 1003e01:	83 ec 0c             	sub    esp,0xc
 1003e04:	50                   	push   eax
 1003e05:	56                   	push   esi
 1003e06:	57                   	push   edi
 1003e07:	68 04 88 00 01       	push   0x1008804
 1003e0c:	68 00 40 00 00       	push   0x4000
 1003e11:	e8 79 e7 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/task.c:43
            return task;
 1003e16:	83 c4 20             	add    esp,0x20
 1003e19:	89 f0                	mov    eax,esi
 1003e1b:	eb 27                	jmp    1003e44 <getTaskSlot+0xb6>
/home/yogi/src/os/chrisOSKernel/src/task.c:45
        }
        ptr+=4;cnt++;
 1003e1d:	83 c3 10             	add    ebx,0x10
 1003e20:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/chrisOSKernel/src/task.c:27
///Find an open TSS slot and mark it in use
task_t* getTaskSlot()
{
   int cnt=0,slot=0;
   uint32_t* ptr=kTaskSlotAvailableInd;
    while (cnt < TSS_TABLE_RECORD_COUNT/32)
 1003e23:	81 fe 00 02 00 00    	cmp    esi,0x200
 1003e29:	0f 85 6d ff ff ff    	jne    1003d9c <getTaskSlot+0xe>
/home/yogi/src/os/chrisOSKernel/src/task.c:47
            printd(DEBUG_TASK,"getTask: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
            return task;
        }
        ptr+=4;cnt++;
    }
    printk("tssUseAvailable: Cannot allocate TSS for new task");
 1003e2f:	83 ec 0c             	sub    esp,0xc
 1003e32:	68 38 88 00 01       	push   0x1008838
 1003e37:	e8 3b e7 ff ff       	call   1002577 <printk>
/home/yogi/src/os/chrisOSKernel/src/task.c:48
    return NULL;
 1003e3c:	83 c4 10             	add    esp,0x10
 1003e3f:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:49
}
 1003e44:	5b                   	pop    ebx
 1003e45:	5e                   	pop    esi
 1003e46:	5f                   	pop    edi
 1003e47:	c3                   	ret    

01003e48 <mmMapKernelIntoTask>:
mmMapKernelIntoTask():
/home/yogi/src/os/chrisOSKernel/src/task.c:52

void mmMapKernelIntoTask(task_t* task)
{
 1003e48:	57                   	push   edi
 1003e49:	56                   	push   esi
 1003e4a:	53                   	push   ebx
 1003e4b:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/task.c:53
    uint32_t debugVal=kDebugLevel;
 1003e4f:	8b 3d 38 03 12 00    	mov    edi,DWORD PTR ds:0x120338
/home/yogi/src/os/chrisOSKernel/src/task.c:54
    kDebugLevel=0;
 1003e55:	c7 05 38 03 12 00 00 	mov    DWORD PTR ds:0x120338,0x0
 1003e5c:	00 00 00 
 1003e5f:	bb 00 00 00 c0       	mov    ebx,0xc0000000
/home/yogi/src/os/chrisOSKernel/src/task.c:56 (discriminator 3)
    for (int cnt=KERNEL_PAGED_BASE_ADDRESS;cnt<KERNEL_PAGED_BASE_ADDRESS+0x0FFFFFFF;cnt+=1000)
        pagingMapPage(task->tss->CR3,cnt,cnt,0x3);
 1003e64:	6a 03                	push   0x3
 1003e66:	53                   	push   ebx
 1003e67:	53                   	push   ebx
 1003e68:	8b 06                	mov    eax,DWORD PTR [esi]
 1003e6a:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 1003e6d:	e8 89 fc ff ff       	call   1003afb <pagingMapPage>
/home/yogi/src/os/chrisOSKernel/src/task.c:55 (discriminator 3)

void mmMapKernelIntoTask(task_t* task)
{
    uint32_t debugVal=kDebugLevel;
    kDebugLevel=0;
    for (int cnt=KERNEL_PAGED_BASE_ADDRESS;cnt<KERNEL_PAGED_BASE_ADDRESS+0x0FFFFFFF;cnt+=1000)
 1003e72:	81 c3 e8 03 00 00    	add    ebx,0x3e8
 1003e78:	83 c4 10             	add    esp,0x10
 1003e7b:	81 fb 20 02 00 d0    	cmp    ebx,0xd0000220
 1003e81:	75 e1                	jne    1003e64 <mmMapKernelIntoTask+0x1c>
/home/yogi/src/os/chrisOSKernel/src/task.c:57
        pagingMapPage(task->tss->CR3,cnt,cnt,0x3);
    kDebugLevel=debugVal;
 1003e83:	89 3d 38 03 12 00    	mov    DWORD PTR ds:0x120338,edi
/home/yogi/src/os/chrisOSKernel/src/task.c:58
}
 1003e89:	5b                   	pop    ebx
 1003e8a:	5e                   	pop    esi
 1003e8b:	5f                   	pop    edi
 1003e8c:	c3                   	ret    

01003e8d <createTask>:
createTask():
/home/yogi/src/os/chrisOSKernel/src/task.c:61

task_t* createTask(bool kernelTSS)
{
 1003e8d:	56                   	push   esi
 1003e8e:	53                   	push   ebx
 1003e8f:	83 ec 04             	sub    esp,0x4
 1003e92:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/task.c:62
    task_t* task=getTaskSlot();
 1003e96:	e8 f3 fe ff ff       	call   1003d8e <getTaskSlot>
/home/yogi/src/os/chrisOSKernel/src/task.c:64
    
    if (task==0)
 1003e9b:	85 c0                	test   eax,eax
 1003e9d:	0f 84 c0 00 00 00    	je     1003f63 <createTask+0xd6>
 1003ea3:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/task.c:66
        return NULL;
    kDebugLevel |= DEBUG_PAGING;
 1003ea5:	83 0d 38 03 12 00 40 	or     DWORD PTR ds:0x120338,0x40
/home/yogi/src/os/chrisOSKernel/src/task.c:69
    
    //Configure the task registers
    task->tss->EAX=0;
 1003eac:	8b 00                	mov    eax,DWORD PTR [eax]
 1003eae:	c7 40 28 00 00 00 00 	mov    DWORD PTR [eax+0x28],0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:70
    task->tss->EBX=task->tss->ECX=task->tss->EDX=task->tss->ESI=task->tss->EDI=task->tss->EBP=0;
 1003eb5:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003eb7:	c7 40 3c 00 00 00 00 	mov    DWORD PTR [eax+0x3c],0x0
 1003ebe:	c7 40 44 00 00 00 00 	mov    DWORD PTR [eax+0x44],0x0
 1003ec5:	c7 40 40 00 00 00 00 	mov    DWORD PTR [eax+0x40],0x0
 1003ecc:	c7 40 30 00 00 00 00 	mov    DWORD PTR [eax+0x30],0x0
 1003ed3:	c7 40 2c 00 00 00 00 	mov    DWORD PTR [eax+0x2c],0x0
 1003eda:	c7 40 34 00 00 00 00 	mov    DWORD PTR [eax+0x34],0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:71
    task->tss->SS0=0x10;
 1003ee1:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003ee3:	66 c7 40 0a 10 00    	mov    WORD PTR [eax+0xa],0x10
/home/yogi/src/os/chrisOSKernel/src/task.c:74
    
    //If it is a kernel task
    if (kernelTSS)
 1003ee9:	89 f0                	mov    eax,esi
 1003eeb:	84 c0                	test   al,al
 1003eed:	74 1c                	je     1003f0b <createTask+0x7e>
/home/yogi/src/os/chrisOSKernel/src/task.c:75
        task->tss->ES=task->tss->DS=task->tss->FS=task->tss->GS=0x10;
 1003eef:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003ef1:	66 c7 40 5e 10 00    	mov    WORD PTR [eax+0x5e],0x10
 1003ef7:	66 c7 40 5a 10 00    	mov    WORD PTR [eax+0x5a],0x10
 1003efd:	66 c7 40 56 10 00    	mov    WORD PTR [eax+0x56],0x10
 1003f03:	66 c7 40 4a 10 00    	mov    WORD PTR [eax+0x4a],0x10
 1003f09:	eb 10                	jmp    1003f1b <createTask+0x8e>
/home/yogi/src/os/chrisOSKernel/src/task.c:77
    else
        panic("write non-kernel segment pop code");
 1003f0b:	83 ec 0c             	sub    esp,0xc
 1003f0e:	68 6c 88 00 01       	push   0x100886c
 1003f13:	e8 d8 e1 ff ff       	call   10020f0 <panic>
 1003f18:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/task.c:78
    task->tss->IOPB=0xABCD;
 1003f1b:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003f1d:	66 c7 40 64 cd ab    	mov    WORD PTR [eax+0x64],0xabcd
/home/yogi/src/os/chrisOSKernel/src/task.c:79
    task->tss->CR3=(uint32_t)malloc(0x1000);
 1003f23:	8b 33                	mov    esi,DWORD PTR [ebx]
 1003f25:	83 ec 0c             	sub    esp,0xc
 1003f28:	68 00 10 00 00       	push   0x1000
 1003f2d:	e8 b9 f4 ff ff       	call   10033eb <malloc>
 1003f32:	89 46 1c             	mov    DWORD PTR [esi+0x1c],eax
/home/yogi/src/os/chrisOSKernel/src/task.c:80
    printd(DEBUG_TASK,"Malloc'd 1k task page directory @ 0x%08X\n",task->tss->CR3);
 1003f35:	83 c4 0c             	add    esp,0xc
 1003f38:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003f3a:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 1003f3d:	68 90 88 00 01       	push   0x1008890
 1003f42:	68 00 40 00 00       	push   0x4000
 1003f47:	e8 43 e6 ff ff       	call   100258f <printd>
/home/yogi/src/os/chrisOSKernel/src/task.c:81
    task->pageTable=(uint32_t*)task->tss->CR3;
 1003f4c:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003f4e:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1003f51:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
/home/yogi/src/os/chrisOSKernel/src/task.c:82
    mmMapKernelIntoTask(task);
 1003f54:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1003f57:	e8 ec fe ff ff       	call   1003e48 <mmMapKernelIntoTask>
/home/yogi/src/os/chrisOSKernel/src/task.c:83
    return task;
 1003f5c:	83 c4 10             	add    esp,0x10
 1003f5f:	89 d8                	mov    eax,ebx
 1003f61:	eb 05                	jmp    1003f68 <createTask+0xdb>
/home/yogi/src/os/chrisOSKernel/src/task.c:65
task_t* createTask(bool kernelTSS)
{
    task_t* task=getTaskSlot();
    
    if (task==0)
        return NULL;
 1003f63:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:84
    task->tss->CR3=(uint32_t)malloc(0x1000);
    printd(DEBUG_TASK,"Malloc'd 1k task page directory @ 0x%08X\n",task->tss->CR3);
    task->pageTable=(uint32_t*)task->tss->CR3;
    mmMapKernelIntoTask(task);
    return task;
}
 1003f68:	83 c4 04             	add    esp,0x4
 1003f6b:	5b                   	pop    ebx
 1003f6c:	5e                   	pop    esi
 1003f6d:	c3                   	ret    
