
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
 100020c:	e8 fb 1d 00 00       	call   100200c <memcpy>
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
 10003e0:	e8 43 22 00 00       	call   1002628 <strlen>
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
 10004c2:	68 58 76 00 01       	push   0x1007658
 10004c7:	6a 10                	push   0x10
 10004c9:	e8 c5 20 00 00       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:40
    char lTemp=0;
    printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
 10004ce:	83 c4 0c             	add    esp,0xc
 10004d1:	ff 35 e0 03 12 00    	push   DWORD PTR ds:0x1203e0
 10004d7:	68 66 76 00 01       	push   0x1007666
 10004dc:	6a 10                	push   0x10
 10004de:	e8 b0 20 00 00       	call   1002593 <printd>
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
 10004fa:	68 66 76 00 01       	push   0x1007666
 10004ff:	6a 10                	push   0x10
 1000501:	e8 8d 20 00 00       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:45
        __asm__("sti\n");
 1000506:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:46
        waitTicks(1);
 1000507:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 100050e:	e8 fe 29 00 00       	call   1002f11 <waitTicks>
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
 1000530:	68 7c 76 00 01       	push   0x100767c
 1000535:	6a 10                	push   0x10
 1000537:	e8 57 20 00 00       	call   1002593 <printd>
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
 1000561:	e8 81 13 00 00       	call   10018e7 <memset>
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
 1000591:	68 8b 76 00 01       	push   0x100768b
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
 10005be:	68 8d 76 00 01       	push   0x100768d
 10005c3:	e8 b3 1f 00 00       	call   100257b <printk>
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
 10005dd:	68 8d 76 00 01       	push   0x100768d
 10005e2:	e8 94 1f 00 00       	call   100257b <printk>
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
 10006d7:	89 15 74 4a 01 01    	mov    DWORD PTR ds:0x1014a74,edx
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
 1000707:	c7 05 68 4a 01 01 00 	mov    DWORD PTR ds:0x1014a68,0x3f800000
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
 1000755:	d9 1d 68 4a 01 01    	fstp   DWORD PTR ds:0x1014a68
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
 1000785:	d9 1d 68 4a 01 01    	fstp   DWORD PTR ds:0x1014a68
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
 1000796:	a3 74 4a 01 01       	mov    ds:0x1014a74,eax
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
 10007cf:	e8 50 27 00 00       	call   1002f24 <wait>
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
 1000817:	68 dc 7a 00 01       	push   0x1007adc
 100081c:	6a 08                	push   0x8
 100081e:	e8 70 1d 00 00       	call   1002593 <printd>
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
 100084b:	68 1c 7b 00 01       	push   0x1007b1c
 1000850:	e8 26 1d 00 00       	call   100257b <printk>
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
 10008bf:	68 44 7b 00 01       	push   0x1007b44
 10008c4:	e8 b2 1c 00 00       	call   100257b <printk>
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
 10008e2:	e8 3d 26 00 00       	call   1002f24 <wait>
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
 1000900:	ba 96 76 00 01       	mov    edx,0x1007696
 1000905:	b8 90 76 00 01       	mov    eax,0x1007690
 100090a:	0f 44 c2             	cmove  eax,edx
 100090d:	89 0c 24             	mov    DWORD PTR [esp],ecx
 1000910:	57                   	push   edi
 1000911:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000917:	50                   	push   eax
 1000918:	68 90 7b 00 01       	push   0x1007b90
 100091d:	e8 59 1c 00 00       	call   100257b <printk>
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
 1000970:	e8 9c 25 00 00       	call   1002f11 <waitTicks>
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
 100098f:	e8 90 25 00 00       	call   1002f24 <wait>
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
 10009c2:	68 af 76 00 01       	push   0x10076af
 10009c7:	e8 af 1b 00 00       	call   100257b <printk>
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
 10009de:	c7 05 74 4a 01 01 00 	mov    DWORD PTR ds:0x1014a74,0x0
 10009e5:	00 00 00 
 10009e8:	eb 34                	jmp    1000a1e <ataInit+0xe0>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10009ea:	ec                   	in     al,dx
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
 10009eb:	0f b6 c0             	movzx  eax,al
 10009ee:	a3 74 4a 01 01       	mov    ds:0x1014a74,eax
 10009f3:	83 f8 04             	cmp    eax,0x4
 10009f6:	74 26                	je     1000a1e <ataInit+0xe0>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:173
            printk("Controller reset failed on %s bus: %02x\n",devInfo->bus==0?"Primary":"Secondary", hdError);
 10009f8:	83 be 61 02 00 00 00 	cmp    DWORD PTR [esi+0x261],0x0
 10009ff:	b9 a5 76 00 01       	mov    ecx,0x10076a5
 1000a04:	ba 9d 76 00 01       	mov    edx,0x100769d
 1000a09:	0f 45 d1             	cmovne edx,ecx
 1000a0c:	83 ec 04             	sub    esp,0x4
 1000a0f:	50                   	push   eax
 1000a10:	52                   	push   edx
 1000a11:	68 d0 7b 00 01       	push   0x1007bd0
 1000a16:	e8 60 1b 00 00       	call   100257b <printk>
 1000a1b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:175
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000a1e:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000a25:	74 10                	je     1000a37 <ataInit+0xf9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:176
            printk("ataResetController: controller is ready\n");
 1000a27:	83 ec 0c             	sub    esp,0xc
 1000a2a:	68 fc 7b 00 01       	push   0x1007bfc
 1000a2f:	e8 47 1b 00 00       	call   100257b <printk>
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
 1000a82:	e8 9d 24 00 00       	call   1002f24 <wait>
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
 1000ab8:	68 c9 76 00 01       	push   0x10076c9
 1000abd:	e8 b9 1a 00 00       	call   100257b <printk>
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
 1000aef:	68 28 7c 00 01       	push   0x1007c28
 1000af4:	e8 82 1a 00 00       	call   100257b <printk>
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
 1000b0a:	c6 05 78 4a 01 01 01 	mov    BYTE PTR ds:0x1014a78,0x1
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
 1000b40:	68 c9 76 00 01       	push   0x10076c9
 1000b45:	e8 31 1a 00 00       	call   100257b <printk>
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
 1000b80:	e8 9f 23 00 00       	call   1002f24 <wait>
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
 1000bdf:	68 50 7c 00 01       	push   0x1007c50
 1000be4:	e8 92 19 00 00       	call   100257b <printk>
 1000be9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
        return false;
 1000bec:	0f b6 05 78 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a78
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
 1000c46:	80 3d 78 4a 01 01 00 	cmp    BYTE PTR ds:0x1014a78,0x0
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
 1000c7f:	e8 a0 22 00 00       	call   1002f24 <wait>
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
 1000d34:	68 e6 76 00 01       	push   0x10076e6
 1000d39:	e8 3d 18 00 00       	call   100257b <printk>
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
 1000db2:	80 3d 78 4a 01 01 00 	cmp    BYTE PTR ds:0x1014a78,0x0
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
 1000ddb:	c6 05 78 4a 01 01 00 	mov    BYTE PTR ds:0x1014a78,0x0
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
 1000e52:	80 3d 78 4a 01 01 00 	cmp    BYTE PTR ds:0x1014a78,0x0
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
 1000eeb:	80 3d 78 4a 01 01 00 	cmp    BYTE PTR ds:0x1014a78,0x0
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
 1000f84:	80 3d 78 4a 01 01 00 	cmp    BYTE PTR ds:0x1014a78,0x0
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
 1000fcb:	68 fa 76 00 01       	push   0x10076fa
 1000fd0:	e8 a6 15 00 00       	call   100257b <printk>
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
 1000fed:	a1 70 4a 01 01       	mov    eax,ds:0x1014a70
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
 1001007:	68 84 7c 00 01       	push   0x1007c84
 100100c:	e8 6a 15 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:376
            waitForKeyboardKey();
 1001011:	e8 a2 f4 ff ff       	call   10004b8 <waitForKeyboardKey>
 1001016:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:379
        }
#endif
    lResult=ataWaitForIdle(atablockingReadDev);
 1001019:	83 ec 0c             	sub    esp,0xc
 100101c:	ff 35 20 a0 00 01    	push   DWORD PTR ds:0x100a020
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
 1001035:	68 bc 7c 00 01       	push   0x1007cbc
 100103a:	e8 b5 10 00 00       	call   10020f4 <panic>
 100103f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:386
        //Select the drive we want
        //NOTE: Drive selected prior to calling this function
        //ataSelectDrive(drive,0);
        //Magic bit (6) to set LBA mode and top 4 bits of LBA28 sector # go in bottom 4
    outb(atablockingReadDev->ioPort+ATA_DRIVE_SELECT, inb(atablockingReadDev->ioPort+ATA_DRIVE_SELECT) | (1 << 6) | ((lSector >> 24) & 0x0F));
 1001042:	8b 1d 20 a0 00 01    	mov    ebx,DWORD PTR ds:0x100a020
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
 10010af:	ff 35 74 4a 01 01    	push   DWORD PTR ds:0x1014a74
 10010b5:	50                   	push   eax
 10010b6:	68 04 7d 00 01       	push   0x1007d04
 10010bb:	e8 34 10 00 00       	call   10020f4 <panic>
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
 10010d6:	a1 20 a0 00 01       	mov    eax,ds:0x100a020
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
 10010f8:	68 54 7d 00 01       	push   0x1007d54
 10010fd:	e8 79 14 00 00       	call   100257b <printk>
 1001102:	89 f3                	mov    ebx,esi
 1001104:	8d 7e 14             	lea    edi,[esi+0x14]
 1001107:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:407 (discriminator 3)
                for (int cnt2=0;cnt2<20;cnt2++)
                    printk("%02X ", bufp[cnt2]);
 100110a:	83 ec 08             	sub    esp,0x8
 100110d:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001110:	50                   	push   eax
 1001111:	68 14 77 00 01       	push   0x1007714
 1001116:	e8 60 14 00 00       	call   100257b <printk>
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
 1001128:	68 66 7a 00 01       	push   0x1007a66
 100112d:	e8 49 14 00 00       	call   100257b <printk>
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
 1001141:	e8 de 1d 00 00       	call   1002f24 <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:414
            lResult=ataWaitForDRQ(atablockingReadDev, true, ATA_STANDARD_WAIT_MS*kTicksPerMS);
 1001146:	83 c4 0c             	add    esp,0xc
 1001149:	a1 84 02 12 00       	mov    eax,ds:0x120284
 100114e:	8d 04 80             	lea    eax,[eax+eax*4]
 1001151:	01 c0                	add    eax,eax
 1001153:	50                   	push   eax
 1001154:	6a 01                	push   0x1
 1001156:	ff 35 20 a0 00 01    	push   DWORD PTR ds:0x100a020
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
 1001177:	ff 35 74 4a 01 01    	push   DWORD PTR ds:0x1014a74
 100117d:	50                   	push   eax
 100117e:	68 74 7d 00 01       	push   0x1007d74
 1001183:	e8 6c 0f 00 00       	call   10020f4 <panic>
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
 100119e:	68 d0 7d 00 01       	push   0x1007dd0
 10011a3:	e8 d3 13 00 00       	call   100257b <printk>
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
 10011cf:	89 15 20 a0 00 01    	mov    DWORD PTR ds:0x100a020,edx
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
 100121a:	68 0c 7e 00 01       	push   0x1007e0c
 100121f:	e8 57 13 00 00       	call   100257b <printk>
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
 1001254:	68 1a 77 00 01       	push   0x100771a
 1001259:	e8 1d 13 00 00       	call   100257b <printk>
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
 10012b7:	68 3c 7e 00 01       	push   0x1007e3c
 10012bc:	e8 ba 12 00 00       	call   100257b <printk>
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
 10012e7:	68 70 7e 00 01       	push   0x1007e70
 10012ec:	e8 8a 12 00 00       	call   100257b <printk>
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
 1001316:	68 8d 7a 00 01       	push   0x1007a8d
 100131b:	e8 5b 12 00 00       	call   100257b <printk>
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
 1001339:	68 a8 7e 00 01       	push   0x1007ea8
 100133e:	6a 40                	push   0x40
 1001340:	e8 4e 12 00 00       	call   1002593 <printd>
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
 1001361:	68 8d 7a 00 01       	push   0x1007a8d
 1001366:	6a 40                	push   0x40
 1001368:	e8 26 12 00 00       	call   1002593 <printd>
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
 1001396:	68 e4 7e 00 01       	push   0x1007ee4
 100139b:	e8 db 11 00 00       	call   100257b <printk>
 10013a0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:94 (discriminator 1)
#endif
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 10013a3:	83 c5 01             	add    ebp,0x1
 10013a6:	39 eb                	cmp    ebx,ebp
 10013a8:	77 5b                	ja     1001405 <kSetVirtualRangeRO+0x92>
 10013aa:	89 f0                	mov    eax,esi
 10013ac:	84 c0                	test   al,al
 10013ae:	b8 35 77 00 01       	mov    eax,0x1007735
 10013b3:	ba 32 77 00 01       	mov    edx,0x1007732
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
 10013e1:	68 38 77 00 01       	push   0x1007738
 10013e6:	e8 90 11 00 00       	call   100257b <printk>
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
 1001425:	ba 50 77 00 01       	mov    edx,0x1007750
 100142a:	b8 54 77 00 01       	mov    eax,0x1007754
 100142f:	0f 44 c2             	cmove  eax,edx
 1001432:	83 ec 04             	sub    esp,0x4
 1001435:	50                   	push   eax
 1001436:	56                   	push   esi
 1001437:	68 14 7f 00 01       	push   0x1007f14
 100143c:	e8 3a 11 00 00       	call   100257b <printk>
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
 1001465:	68 40 7f 00 01       	push   0x1007f40
 100146a:	e8 0c 11 00 00       	call   100257b <printk>
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
 1001505:	68 74 7f 00 01       	push   0x1007f74
 100150a:	e8 6c 10 00 00       	call   100257b <printk>
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
 1001555:	68 b4 7f 00 01       	push   0x1007fb4
 100155a:	e8 1c 10 00 00       	call   100257b <printk>
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

void kUnMapPage(uintptr_t mapTo)
{
 100157b:	57                   	push   edi
 100157c:	56                   	push   esi
 100157d:	83 ec 04             	sub    esp,0x4
 1001580:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:180
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)kKernelPageDir;
    ptrVal=ptr[(mapTo>>22)];
 1001584:	89 d1                	mov    ecx,edx
 1001586:	c1 e9 16             	shr    ecx,0x16
 1001589:	a1 a4 02 12 00       	mov    eax,ds:0x1202a4
 100158e:	8d 0c 88             	lea    ecx,[eax+ecx*4]
 1001591:	8b 01                	mov    eax,DWORD PTR [ecx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:181
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
 1001593:	85 c0                	test   eax,eax
 1001595:	75 4f                	jne    10015e6 <kUnMapPage+0x6b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:181 (discriminator 1)
 1001597:	bf 00 00 00 00       	mov    edi,0x0
 100159c:	3b 3d 4c 00 12 00    	cmp    edi,DWORD PTR ds:0x12004c
 10015a2:	72 08                	jb     10015ac <kUnMapPage+0x31>
 10015a4:	3b 15 48 00 12 00    	cmp    edx,DWORD PTR ds:0x120048
 10015aa:	73 3a                	jae    10015e6 <kUnMapPage+0x6b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:184
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
 10015ac:	c7 01 63 00 00 20    	mov    DWORD PTR [ecx],0x20000063
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:185
        ptrT[(mapTo&0x003FFFFF/4096)]=0;
 10015b2:	89 d0                	mov    eax,edx
 10015b4:	25 ff 03 00 00       	and    eax,0x3ff
 10015b9:	8d 34 85 00 00 00 20 	lea    esi,[eax*4+0x20000000]
 10015c0:	c7 04 85 00 00 00 20 	mov    DWORD PTR [eax*4+0x20000000],0x0
 10015c7:	00 00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:187
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10015cb:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10015d2:	74 44                	je     1001618 <kUnMapPage+0x9d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:188
            printk("kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)]);
 10015d4:	56                   	push   esi
 10015d5:	51                   	push   ecx
 10015d6:	52                   	push   edx
 10015d7:	68 f0 7f 00 01       	push   0x1007ff0
 10015dc:	e8 9a 0f 00 00       	call   100257b <printk>
 10015e1:	83 c4 10             	add    esp,0x10
 10015e4:	eb 32                	jmp    1001618 <kUnMapPage+0x9d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:200
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=0;
 10015e6:	25 00 f0 ff ff       	and    eax,0xfffff000
 10015eb:	89 c6                	mov    esi,eax
 10015ed:	89 d0                	mov    eax,edx
 10015ef:	c1 e8 0a             	shr    eax,0xa
 10015f2:	25 fc 0f 00 00       	and    eax,0xffc
 10015f7:	01 f0                	add    eax,esi
 10015f9:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
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
 1001609:	51                   	push   ecx
 100160a:	52                   	push   edx
 100160b:	68 28 80 00 01       	push   0x1008028
 1001610:	e8 66 0f 00 00       	call   100257b <printk>
 1001615:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:209
#endif
    }
//    if (ptrT[(src&0x003FFFFF/1000)]==0)
}
 1001618:	83 c4 04             	add    esp,0x4
 100161b:	5e                   	pop    esi
 100161c:	5f                   	pop    edi
 100161d:	c3                   	ret    

0100161e <kSetPhysicalRangeRO>:
kSetPhysicalRangeRO():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:212

void kSetPhysicalRangeRO(uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 100161e:	55                   	push   ebp
 100161f:	57                   	push   edi
 1001620:	56                   	push   esi
 1001621:	53                   	push   ebx
 1001622:	83 ec 0c             	sub    esp,0xc
 1001625:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 1001629:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
 100162d:	8b 5c 24 28          	mov    ebx,DWORD PTR [esp+0x28]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:214
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001631:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001638:	74 22                	je     100165c <kSetPhysicalRangeRO+0x3e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:215
            printk("kMakePhysicalRangeRO: Make 0x%08X(0x%08X)-0x%08X(0x%08X) r/o\n", startAddy, startAddy&0xFffff000, endAddy, endAddy&0xFFFFF000);
 100163a:	83 ec 0c             	sub    esp,0xc
 100163d:	89 f0                	mov    eax,esi
 100163f:	25 00 f0 ff ff       	and    eax,0xfffff000
 1001644:	50                   	push   eax
 1001645:	56                   	push   esi
 1001646:	89 e8                	mov    eax,ebp
 1001648:	25 00 f0 ff ff       	and    eax,0xfffff000
 100164d:	50                   	push   eax
 100164e:	55                   	push   ebp
 100164f:	68 58 80 00 01       	push   0x1008058
 1001654:	e8 22 0f 00 00       	call   100257b <printk>
 1001659:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:217
#endif
    kSetVirtualRangeRO((startAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, (endAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, readOnly);
 100165c:	83 ec 04             	sub    esp,0x4
 100165f:	0f b6 fb             	movzx  edi,bl
 1001662:	57                   	push   edi
 1001663:	81 ee 00 00 00 40    	sub    esi,0x40000000
 1001669:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 100166f:	56                   	push   esi
 1001670:	8d 9d 00 00 00 c0    	lea    ebx,[ebp-0x40000000]
 1001676:	81 e3 00 f0 ff ff    	and    ebx,0xfffff000
 100167c:	53                   	push   ebx
 100167d:	e8 f1 fc ff ff       	call   1001373 <kSetVirtualRangeRO>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:218
}
 1001682:	83 c4 1c             	add    esp,0x1c
 1001685:	5b                   	pop    ebx
 1001686:	5e                   	pop    esi
 1001687:	5f                   	pop    edi
 1001688:	5d                   	pop    ebp
 1001689:	c3                   	ret    

0100168a <mmKernelSetPageInUseFlag>:
mmKernelSetPageInUseFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:221

void mmKernelSetPageInUseFlag(uintptr_t address, bool inUse)
{
 100168a:	56                   	push   esi
 100168b:	53                   	push   ebx
 100168c:	83 ec 04             	sub    esp,0x4
 100168f:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1001693:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:224
    uintptr_t* ptEntry;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001697:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100169e:	74 22                	je     10016c2 <mmKernelSetPageInUseFlag+0x38>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:225
           printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 10016a0:	89 f0                	mov    eax,esi
 10016a2:	84 c0                	test   al,al
 10016a4:	ba 5c 77 00 01       	mov    edx,0x100775c
 10016a9:	b8 60 77 00 01       	mov    eax,0x1007760
 10016ae:	0f 44 c2             	cmove  eax,edx
 10016b1:	50                   	push   eax
 10016b2:	53                   	push   ebx
 10016b3:	68 98 80 00 01       	push   0x1008098
 10016b8:	6a 40                	push   0x40
 10016ba:	e8 d4 0e 00 00       	call   1002593 <printd>
 10016bf:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:227
#endif
        ptEntry=(uintptr_t*)kPagingGet4kPTEntryAddress(address);
 10016c2:	83 ec 0c             	sub    esp,0xc
 10016c5:	53                   	push   ebx
 10016c6:	e8 9d fb ff ff       	call   1001268 <kPagingGet4kPTEntryAddress>
 10016cb:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:228
        printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 10016cd:	ff 30                	push   DWORD PTR [eax]
 10016cf:	50                   	push   eax
 10016d0:	68 dc 80 00 01       	push   0x10080dc
 10016d5:	6a 40                	push   0x40
 10016d7:	e8 b7 0e 00 00       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:229
        if (inUse)
 10016dc:	83 c4 20             	add    esp,0x20
 10016df:	89 f0                	mov    eax,esi
 10016e1:	84 c0                	test   al,al
 10016e3:	74 08                	je     10016ed <mmKernelSetPageInUseFlag+0x63>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:230
            *ptEntry|=PAGING_IN_USE_FLAG_MASK;
 10016e5:	81 0b 00 08 00 00    	or     DWORD PTR [ebx],0x800
 10016eb:	eb 06                	jmp    10016f3 <mmKernelSetPageInUseFlag+0x69>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:232
        else
            *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
 10016ed:	81 23 ff f7 ff ff    	and    DWORD PTR [ebx],0xfffff7ff
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:233
}
 10016f3:	83 c4 04             	add    esp,0x4
 10016f6:	5b                   	pop    ebx
 10016f7:	5e                   	pop    esi
 10016f8:	c3                   	ret    

010016f9 <mmKernelSetPageRangeInUseFlag>:
mmKernelSetPageRangeInUseFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:236

void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
 10016f9:	55                   	push   ebp
 10016fa:	57                   	push   edi
 10016fb:	56                   	push   esi
 10016fc:	53                   	push   ebx
 10016fd:	83 ec 0c             	sub    esp,0xc
 1001700:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
 1001704:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
 1001708:	8b 6c 24 28          	mov    ebp,DWORD PTR [esp+0x28]
 100170c:	0f b6 44 24 2c       	movzx  eax,BYTE PTR [esp+0x2c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:237
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 1001711:	39 fb                	cmp    ebx,edi
 1001713:	73 16                	jae    100172b <mmKernelSetPageRangeInUseFlag+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:238 (discriminator 3)
        mmKernelSetPageInUseFlag(cnt,inUse);
 1001715:	0f b6 f0             	movzx  esi,al
 1001718:	83 ec 08             	sub    esp,0x8
 100171b:	56                   	push   esi
 100171c:	53                   	push   ebx
 100171d:	e8 68 ff ff ff       	call   100168a <mmKernelSetPageInUseFlag>
 1001722:	01 eb                	add    ebx,ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:237 (discriminator 3)
            *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
}

void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 1001724:	83 c4 10             	add    esp,0x10
 1001727:	39 fb                	cmp    ebx,edi
 1001729:	72 ed                	jb     1001718 <mmKernelSetPageRangeInUseFlag+0x1f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:239
        mmKernelSetPageInUseFlag(cnt,inUse);
}
 100172b:	83 c4 0c             	add    esp,0xc
 100172e:	5b                   	pop    ebx
 100172f:	5e                   	pop    esi
 1001730:	5f                   	pop    edi
 1001731:	5d                   	pop    ebp
 1001732:	c3                   	ret    

01001733 <mmUnusePageRange>:
mmUnusePageRange():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:242

void mmUnusePageRange()
{
 1001733:	f3 c3                	repz ret 
 1001735:	66 90                	xchg   ax,ax
 1001737:	90                   	nop

01001738 <reverse>:
reverse():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:29
//#include <string.h>

/* reverse:  reverse string s in place */
extern int strlen(char*);
 void reverse(char s[])
 {
 1001738:	56                   	push   esi
 1001739:	53                   	push   ebx
 100173a:	83 ec 10             	sub    esp,0x10
 100173d:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:33
     int i, j;
     char c;

     for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
 1001741:	53                   	push   ebx
 1001742:	e8 e1 0e 00 00       	call   1002628 <strlen>
 1001747:	83 e8 01             	sub    eax,0x1
 100174a:	83 c4 10             	add    esp,0x10
 100174d:	85 c0                	test   eax,eax
 100174f:	7e 1f                	jle    1001770 <reverse+0x38>
 1001751:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:34 (discriminator 3)
         c = s[i];
 1001756:	0f b6 34 13          	movzx  esi,BYTE PTR [ebx+edx*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:35 (discriminator 3)
         s[i] = s[j];
 100175a:	0f b6 0c 03          	movzx  ecx,BYTE PTR [ebx+eax*1]
 100175e:	88 0c 13             	mov    BYTE PTR [ebx+edx*1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:36 (discriminator 3)
         s[j] = c;
 1001761:	89 f1                	mov    ecx,esi
 1001763:	88 0c 03             	mov    BYTE PTR [ebx+eax*1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:33 (discriminator 3)
 void reverse(char s[])
 {
     int i, j;
     char c;

     for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
 1001766:	83 c2 01             	add    edx,0x1
 1001769:	83 e8 01             	sub    eax,0x1
 100176c:	39 c2                	cmp    edx,eax
 100176e:	7c e6                	jl     1001756 <reverse+0x1e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:38
         c = s[i];
         s[i] = s[j];
         s[j] = c;
     }
 }
 1001770:	83 c4 04             	add    esp,0x4
 1001773:	5b                   	pop    ebx
 1001774:	5e                   	pop    esi
 1001775:	c3                   	ret    

01001776 <itoa>:
itoa():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:40
 void itoa(int n, char s[])
 {
 1001776:	55                   	push   ebp
 1001777:	57                   	push   edi
 1001778:	56                   	push   esi
 1001779:	53                   	push   ebx
 100177a:	83 ec 1c             	sub    esp,0x1c
 100177d:	8b 7c 24 34          	mov    edi,DWORD PTR [esp+0x34]
 1001781:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
 1001785:	c1 f8 1f             	sar    eax,0x1f
 1001788:	89 c1                	mov    ecx,eax
 100178a:	33 4c 24 30          	xor    ecx,DWORD PTR [esp+0x30]
 100178e:	29 c1                	sub    ecx,eax
 1001790:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:47

     if ((sign = n) < 0)  /* record sign */
         n = -n;          /* make n positive */
     i = 0;
     do {       /* generate digits in reverse order */
         s[i++] = n % 10 + '0';   /* get next digit */
 1001795:	bd 67 66 66 66       	mov    ebp,0x66666667
 100179a:	eb 02                	jmp    100179e <itoa+0x28>
 100179c:	89 de                	mov    esi,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:47 (discriminator 1)
 100179e:	8d 5e 01             	lea    ebx,[esi+0x1]
 10017a1:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
 10017a5:	89 c8                	mov    eax,ecx
 10017a7:	f7 ed                	imul   ebp
 10017a9:	c1 fa 02             	sar    edx,0x2
 10017ac:	89 c8                	mov    eax,ecx
 10017ae:	c1 f8 1f             	sar    eax,0x1f
 10017b1:	29 c2                	sub    edx,eax
 10017b3:	8d 04 92             	lea    eax,[edx+edx*4]
 10017b6:	01 c0                	add    eax,eax
 10017b8:	29 c1                	sub    ecx,eax
 10017ba:	83 c1 30             	add    ecx,0x30
 10017bd:	88 4c 1f ff          	mov    BYTE PTR [edi+ebx*1-0x1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:48 (discriminator 1)
     } while ((n /= 10) > 0);     /* delete it */
 10017c1:	89 d1                	mov    ecx,edx
 10017c3:	85 d2                	test   edx,edx
 10017c5:	7f d5                	jg     100179c <itoa+0x26>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:49
     if (sign < 0)
 10017c7:	83 7c 24 30 00       	cmp    DWORD PTR [esp+0x30],0x0
 10017cc:	79 0b                	jns    10017d9 <itoa+0x63>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:50
         s[i++] = '-';
 10017ce:	8d 5e 02             	lea    ebx,[esi+0x2]
 10017d1:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10017d5:	c6 04 07 2d          	mov    BYTE PTR [edi+eax*1],0x2d
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:51
     s[i] = '\0';
 10017d9:	c6 04 1f 00          	mov    BYTE PTR [edi+ebx*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:52
     reverse(s);
 10017dd:	83 ec 0c             	sub    esp,0xc
 10017e0:	57                   	push   edi
 10017e1:	e8 52 ff ff ff       	call   1001738 <reverse>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:53
 }
 10017e6:	83 c4 2c             	add    esp,0x2c
 10017e9:	5b                   	pop    ebx
 10017ea:	5e                   	pop    esi
 10017eb:	5f                   	pop    edi
 10017ec:	5d                   	pop    ebp
 10017ed:	c3                   	ret    

010017ee <itox>:
itox():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:55
void itox(unsigned int i, char *s)
{
 10017ee:	53                   	push   ebx
 10017ef:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 10017f3:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:58
    unsigned char n;

    s += 4;
 10017f7:	8d 43 04             	lea    eax,[ebx+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:59
    *s = '\0';
 10017fa:	c6 43 04 00          	mov    BYTE PTR [ebx+0x4],0x0
 10017fe:	83 eb 04             	sub    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:62 (discriminator 3)

    for (n = 8; n != 0; --n) {
        *--s = "0123456789ABCDEF"[i & 0x0F];
 1001801:	83 e8 01             	sub    eax,0x1
 1001804:	89 d1                	mov    ecx,edx
 1001806:	83 e1 0f             	and    ecx,0xf
 1001809:	0f b6 89 67 77 00 01 	movzx  ecx,BYTE PTR [ecx+0x1007767]
 1001810:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:63 (discriminator 3)
        i >>= 4;
 1001812:	c1 ea 04             	shr    edx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:61 (discriminator 3)
    unsigned char n;

    s += 4;
    *s = '\0';

    for (n = 8; n != 0; --n) {
 1001815:	39 c3                	cmp    ebx,eax
 1001817:	75 e8                	jne    1001801 <itox+0x13>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:65
        *--s = "0123456789ABCDEF"[i & 0x0F];
        i >>= 4;
    }
}
 1001819:	5b                   	pop    ebx
 100181a:	c3                   	ret    

0100181b <atoi>:
atoi():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:68
// A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
int atoi(char *str)
{
 100181b:	8b 4c 24 04          	mov    ecx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:73
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
 100181f:	0f b6 11             	movzx  edx,BYTE PTR [ecx]
 1001822:	84 d2                	test   dl,dl
 1001824:	74 1f                	je     1001845 <atoi+0x2a>
 1001826:	83 c1 01             	add    ecx,0x1
 1001829:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:74 (discriminator 3)
        res = res*10 + str[i] - '0';
 100182e:	8d 04 80             	lea    eax,[eax+eax*4]
 1001831:	0f be d2             	movsx  edx,dl
 1001834:	8d 44 42 d0          	lea    eax,[edx+eax*2-0x30]
 1001838:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:73 (discriminator 3)
{
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
 100183b:	0f b6 51 ff          	movzx  edx,BYTE PTR [ecx-0x1]
 100183f:	84 d2                	test   dl,dl
 1001841:	75 eb                	jne    100182e <atoi+0x13>
 1001843:	f3 c3                	repz ret 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:69
    }
}
// A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
int atoi(char *str)
{
    int res = 0; // Initialize result
 1001845:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:78
    for (int i = 0; str[i] != '\0'; ++i)
        res = res*10 + str[i] - '0';
  
    // return result.
    return res;
}
 100184a:	c3                   	ret    

0100184b <convert>:
convert():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:81

int convert(int s)
{
 100184b:	83 ec 10             	sub    esp,0x10
 100184e:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:83
  int c;
  char hex[] = {'A', 'B', 'C', 'D', 'E', 'F'};
 1001852:	c6 44 24 0a 41       	mov    BYTE PTR [esp+0xa],0x41
 1001857:	c6 44 24 0b 42       	mov    BYTE PTR [esp+0xb],0x42
 100185c:	c6 44 24 0c 43       	mov    BYTE PTR [esp+0xc],0x43
 1001861:	c6 44 24 0d 44       	mov    BYTE PTR [esp+0xd],0x44
 1001866:	c6 44 24 0e 45       	mov    BYTE PTR [esp+0xe],0x45
 100186b:	c6 44 24 0f 46       	mov    BYTE PTR [esp+0xf],0x46
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:84
  c = (s >= 0 && s < 9) ? s + '0' : hex[s - 10];
 1001870:	83 f8 08             	cmp    eax,0x8
 1001873:	77 05                	ja     100187a <convert+0x2f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:84 (discriminator 1)
 1001875:	83 c0 30             	add    eax,0x30
 1001878:	eb 04                	jmp    100187e <convert+0x33>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:84 (discriminator 2)
 100187a:	0f be 04 04          	movsx  eax,BYTE PTR [esp+eax*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:86 (discriminator 4)
  return c;
}
 100187e:	83 c4 10             	add    esp,0x10
 1001881:	c3                   	ret    

01001882 <itoha>:
itoha():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:89

void itoha(unsigned int n, char *buf)
{
 1001882:	55                   	push   ebp
 1001883:	57                   	push   edi
 1001884:	56                   	push   esi
 1001885:	53                   	push   ebx
 1001886:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 100188a:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:92
  int i = 0, j =0;
  j=7;
  while(n != 0)
 100188e:	85 db                	test   ebx,ebx
 1001890:	74 25                	je     10018b7 <itoha+0x35>
 1001892:	be 07 00 00 00       	mov    esi,0x7
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:94
  {
    i = n % 16;
 1001897:	89 dd                	mov    ebp,ebx
 1001899:	83 e5 0f             	and    ebp,0xf
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:95
      buf[j--] = convert(i);
 100189c:	83 ee 01             	sub    esi,0x1
 100189f:	55                   	push   ebp
 10018a0:	e8 a6 ff ff ff       	call   100184b <convert>
 10018a5:	83 c4 04             	add    esp,0x4
 10018a8:	88 44 37 01          	mov    BYTE PTR [edi+esi*1+0x1],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:96
      n = (n - i) / 16;
 10018ac:	29 eb                	sub    ebx,ebp
 10018ae:	c1 eb 04             	shr    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:92

void itoha(unsigned int n, char *buf)
{
  int i = 0, j =0;
  j=7;
  while(n != 0)
 10018b1:	85 db                	test   ebx,ebx
 10018b3:	75 e2                	jne    1001897 <itoha+0x15>
 10018b5:	eb 05                	jmp    10018bc <itoha+0x3a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:91
}

void itoha(unsigned int n, char *buf)
{
  int i = 0, j =0;
  j=7;
 10018b7:	be 07 00 00 00       	mov    esi,0x7
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:98
  {
    i = n % 16;
      buf[j--] = convert(i);
      n = (n - i) / 16;
  }
  buf[j] = '\0';
 10018bc:	c6 04 37 00          	mov    BYTE PTR [edi+esi*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:99
}
 10018c0:	5b                   	pop    ebx
 10018c1:	5e                   	pop    esi
 10018c2:	5f                   	pop    edi
 10018c3:	5d                   	pop    ebp
 10018c4:	c3                   	ret    

010018c5 <identify_data_sizes>:
identify_data_sizes():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:102

void identify_data_sizes(sizeof_t* sizes)
{
 10018c5:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:103
    sizes->shortSize = sizeof(short);
 10018c9:	66 c7 00 02 00       	mov    WORD PTR [eax],0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:104
    sizes->intSize = sizeof(int);
 10018ce:	66 c7 40 02 04 00    	mov    WORD PTR [eax+0x2],0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:105
    sizes->longSize = sizeof(long);
 10018d4:	66 c7 40 04 04 00    	mov    WORD PTR [eax+0x4],0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:106
    sizes->longLongSize = sizeof(long long);
 10018da:	66 c7 40 06 08 00    	mov    WORD PTR [eax+0x6],0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:107
    sizes->longLongIntSize = sizeof(long long int);
 10018e0:	66 c7 40 08 08 00    	mov    WORD PTR [eax+0x8],0x8
 10018e6:	c3                   	ret    

010018e7 <memset>:
memset():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:111
}

void *memset(void *d1, int val, size_t len)
{
 10018e7:	56                   	push   esi
 10018e8:	53                   	push   ebx
 10018e9:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10018ed:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 10018f1:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:114
    uint8_t *d = d1;
    uint16_t*e = d1;
    uint16_t eVal=(val << 16) | (val << 8) | val;
 10018f5:	89 f1                	mov    ecx,esi
 10018f7:	c1 e1 08             	shl    ecx,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:118
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
 10018fa:	f6 c2 03             	test   dl,0x3
 10018fd:	75 16                	jne    1001915 <memset+0x2e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:119
    while (len-=4) {
 10018ff:	83 ea 04             	sub    edx,0x4
 1001902:	74 43                	je     1001947 <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:120
        *d++ = fVal;
 1001904:	89 f3                	mov    ebx,esi
 1001906:	89 c1                	mov    ecx,eax
 1001908:	83 c1 01             	add    ecx,0x1
 100190b:	88 59 ff             	mov    BYTE PTR [ecx-0x1],bl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:119
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
 100190e:	83 ea 04             	sub    edx,0x4
 1001911:	75 f5                	jne    1001908 <memset+0x21>
 1001913:	eb 32                	jmp    1001947 <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:122
        *d++ = fVal;
    }
    else if (((len%2)==0))
 1001915:	f6 c2 01             	test   dl,0x1
 1001918:	74 0b                	je     1001925 <memset+0x3e>
 100191a:	8d 1c 10             	lea    ebx,[eax+edx*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:127
    while (len-=2) {
        *d++ = eVal;
    }
    else
    while (len--) {
 100191d:	89 c1                	mov    ecx,eax
 100191f:	85 d2                	test   edx,edx
 1001921:	75 18                	jne    100193b <memset+0x54>
 1001923:	eb 22                	jmp    1001947 <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:123
    if ((len%4)==0)
    while (len-=4) {
        *d++ = fVal;
    }
    else if (((len%2)==0))
    while (len-=2) {
 1001925:	83 ea 02             	sub    edx,0x2
 1001928:	74 1d                	je     1001947 <memset+0x60>
 100192a:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:124
        *d++ = eVal;
 100192c:	09 f1                	or     ecx,esi
 100192e:	83 c3 01             	add    ebx,0x1
 1001931:	88 4b ff             	mov    BYTE PTR [ebx-0x1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:123
    if ((len%4)==0)
    while (len-=4) {
        *d++ = fVal;
    }
    else if (((len%2)==0))
    while (len-=2) {
 1001934:	83 ea 02             	sub    edx,0x2
 1001937:	75 f5                	jne    100192e <memset+0x47>
 1001939:	eb 0c                	jmp    1001947 <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:128
        *d++ = eVal;
    }
    else
    while (len--) {
        *d++ = val;
 100193b:	83 c1 01             	add    ecx,0x1
 100193e:	89 f2                	mov    edx,esi
 1001940:	88 51 ff             	mov    BYTE PTR [ecx-0x1],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:127
    else if (((len%2)==0))
    while (len-=2) {
        *d++ = eVal;
    }
    else
    while (len--) {
 1001943:	39 cb                	cmp    ebx,ecx
 1001945:	75 f4                	jne    100193b <memset+0x54>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:131
        *d++ = val;
    }
    return d1;
}
 1001947:	5b                   	pop    ebx
 1001948:	5e                   	pop    esi
 1001949:	c3                   	ret    

0100194a <bcdToDec>:
bcdToDec():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:134

uint8_t bcdToDec(uint8_t val)
{
 100194a:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:135
  return ( (val/16*10) + (val%16) );
 100194e:	89 c2                	mov    edx,eax
 1001950:	c0 ea 04             	shr    dl,0x4
 1001953:	8d 14 92             	lea    edx,[edx+edx*4]
 1001956:	83 e0 0f             	and    eax,0xf
 1001959:	8d 04 50             	lea    eax,[eax+edx*2]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:136
}
 100195c:	c3                   	ret    

0100195d <decToBcd>:
decToBcd():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:139

uint8_t decToBcd(uint8_t val)
{
 100195d:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:140
  return ( (val/10*16) + (val%10) );
 1001961:	0f b6 c8             	movzx  ecx,al
 1001964:	8d 14 89             	lea    edx,[ecx+ecx*4]
 1001967:	8d 14 d1             	lea    edx,[ecx+edx*8]
 100196a:	8d 14 92             	lea    edx,[edx+edx*4]
 100196d:	66 c1 ea 0b          	shr    dx,0xb
 1001971:	89 d1                	mov    ecx,edx
 1001973:	c1 e1 04             	shl    ecx,0x4
 1001976:	8d 14 92             	lea    edx,[edx+edx*4]
 1001979:	01 d2                	add    edx,edx
 100197b:	29 d0                	sub    eax,edx
 100197d:	01 c8                	add    eax,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:141
}
 100197f:	c3                   	ret    

01001980 <initSystemDate>:
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:143
void initSystemDate()
{
 1001980:	83 ec 3c             	sub    esp,0x3c
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001983:	b8 00 00 00 00       	mov    eax,0x0
 1001988:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100198a:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:147
    struct tm tmbuf;

    outb(0x70, 0x00);
    tmbuf.tm_sec = bcdToDec(inb(0x71));
 100198c:	0f b6 c0             	movzx  eax,al
 100198f:	50                   	push   eax
 1001990:	e8 b5 ff ff ff       	call   100194a <bcdToDec>
 1001995:	0f b6 c0             	movzx  eax,al
 1001998:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 100199c:	b8 02 00 00 00       	mov    eax,0x2
 10019a1:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019a3:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:149
    outb(0x70, 0x02);
    tmbuf.tm_min = bcdToDec(inb(0x71));
 10019a5:	0f b6 c0             	movzx  eax,al
 10019a8:	89 04 24             	mov    DWORD PTR [esp],eax
 10019ab:	e8 9a ff ff ff       	call   100194a <bcdToDec>
 10019b0:	0f b6 c0             	movzx  eax,al
 10019b3:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10019b7:	b8 04 00 00 00       	mov    eax,0x4
 10019bc:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019be:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:151
    outb(0x70, 0x04);
    tmbuf.tm_hour = bcdToDec(inb(0x71));
 10019c0:	0f b6 c0             	movzx  eax,al
 10019c3:	89 04 24             	mov    DWORD PTR [esp],eax
 10019c6:	e8 7f ff ff ff       	call   100194a <bcdToDec>
 10019cb:	0f b6 c0             	movzx  eax,al
 10019ce:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10019d2:	b8 07 00 00 00       	mov    eax,0x7
 10019d7:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019d9:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:153
    outb(0x70, 0x07);
    tmbuf.tm_mday = bcdToDec(inb(0x71));
 10019db:	0f b6 c0             	movzx  eax,al
 10019de:	89 04 24             	mov    DWORD PTR [esp],eax
 10019e1:	e8 64 ff ff ff       	call   100194a <bcdToDec>
 10019e6:	0f b6 c0             	movzx  eax,al
 10019e9:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10019ed:	b8 08 00 00 00       	mov    eax,0x8
 10019f2:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019f4:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:155
    outb(0x70, 0x08);
    tmbuf.tm_mon = bcdToDec(inb(0x71));
 10019f6:	0f b6 c0             	movzx  eax,al
 10019f9:	89 04 24             	mov    DWORD PTR [esp],eax
 10019fc:	e8 49 ff ff ff       	call   100194a <bcdToDec>
 1001a01:	0f b6 c0             	movzx  eax,al
 1001a04:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001a08:	b8 09 00 00 00       	mov    eax,0x9
 1001a0d:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1001a0f:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:157
    outb(0x70, 0x09);
    tmbuf.tm_year = bcdToDec(inb(0x71));
 1001a11:	0f b6 c0             	movzx  eax,al
 1001a14:	89 04 24             	mov    DWORD PTR [esp],eax
 1001a17:	e8 2e ff ff ff       	call   100194a <bcdToDec>
 1001a1c:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:158
    tmbuf.tm_isdst = -1;
 1001a1f:	c7 44 24 30 ff ff ff 	mov    DWORD PTR [esp+0x30],0xffffffff
 1001a26:	ff 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:160
    tmbuf.tm_year += 2000;
    tmbuf.tm_year = tmbuf.tm_year - 1900;
 1001a27:	0f b6 c0             	movzx  eax,al
 1001a2a:	83 c0 64             	add    eax,0x64
 1001a2d:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:161
    kSystemStartTime = mktime(&tmbuf);
 1001a31:	8d 44 24 10          	lea    eax,[esp+0x10]
 1001a35:	50                   	push   eax
 1001a36:	e8 ab 0f 00 00       	call   10029e6 <mktime>
 1001a3b:	a3 88 02 12 00       	mov    ds:0x120288,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:162
    kSystemCurrentTime = kSystemStartTime;
 1001a40:	a3 8c 02 12 00       	mov    ds:0x12028c,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:164
//printf("System Date = %d/%d/%d %d:%d:%d\n", tmbuf.tm_mon, tmbuf.tm_mday, tmbuf.tm_year, tmbuf.tm_hour, tmbuf.tm_min, tmbuf.tm_sec, tmbuf.tm_hour, tmbuf.tm_min, tmbuf.tm_sec);
}
 1001a45:	83 c4 4c             	add    esp,0x4c
 1001a48:	c3                   	ret    

01001a49 <strtoupper>:
strtoupper():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:166
char * strtoupper(char* pointerToString)
{
 1001a49:	56                   	push   esi
 1001a4a:	53                   	push   ebx
 1001a4b:	83 ec 10             	sub    esp,0x10
 1001a4e:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:167
    uint8_t start=0, length=strlen(pointerToString);
 1001a52:	53                   	push   ebx
 1001a53:	e8 d0 0b 00 00       	call   1002628 <strlen>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:171
    char* myPtr=pointerToString;
    
        // Trim.Start:
        while (start<length)
 1001a58:	83 c4 10             	add    esp,0x10
 1001a5b:	84 c0                	test   al,al
 1001a5d:	74 23                	je     1001a82 <strtoupper+0x39>
 1001a5f:	89 da                	mov    edx,ebx
 1001a61:	83 e8 01             	sub    eax,0x1
 1001a64:	0f b6 c0             	movzx  eax,al
 1001a67:	8d 74 03 01          	lea    esi,[ebx+eax*1+0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:173
        {
            if (myPtr[start]>='a' && myPtr[start]<='z')
 1001a6b:	0f b6 02             	movzx  eax,BYTE PTR [edx]
 1001a6e:	8d 48 9f             	lea    ecx,[eax-0x61]
 1001a71:	80 f9 19             	cmp    cl,0x19
 1001a74:	77 05                	ja     1001a7b <strtoupper+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:174
                myPtr[start]-=32;
 1001a76:	83 e8 20             	sub    eax,0x20
 1001a79:	88 02                	mov    BYTE PTR [edx],al
 1001a7b:	83 c2 01             	add    edx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:171
{
    uint8_t start=0, length=strlen(pointerToString);
    char* myPtr=pointerToString;
    
        // Trim.Start:
        while (start<length)
 1001a7e:	39 f2                	cmp    edx,esi
 1001a80:	75 e9                	jne    1001a6b <strtoupper+0x22>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:179
                myPtr[start]-=32;
            start++;
        }

    return pointerToString;
}
 1001a82:	89 d8                	mov    eax,ebx
 1001a84:	83 c4 04             	add    esp,0x4
 1001a87:	5b                   	pop    ebx
 1001a88:	5e                   	pop    esi
 1001a89:	c3                   	ret    

01001a8a <printDumpedRegs>:
printDumpedRegs():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:182

void printDumpedRegs()
{
 1001a8a:	57                   	push   edi
 1001a8b:	56                   	push   esi
 1001a8c:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:183
    uint32_t esp = exceptionSavedESP;
 1001a8d:	8b 35 ec 01 12 00    	mov    esi,DWORD PTR ds:0x1201ec
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:187
    uint8_t* lCSIPPtr;

    
    lCSIPPtr=(uint8_t*)(exceptionEIP);
 1001a93:	8b 1d f8 01 12 00    	mov    ebx,DWORD PTR ds:0x1201f8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:188
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", exceptionAX, exceptionBX, exceptionCX, exceptionDX,exceptionFlags);
 1001a99:	83 ec 08             	sub    esp,0x8
 1001a9c:	ff 35 f0 01 12 00    	push   DWORD PTR ds:0x1201f0
 1001aa2:	ff 35 bc 01 12 00    	push   DWORD PTR ds:0x1201bc
 1001aa8:	ff 35 b8 01 12 00    	push   DWORD PTR ds:0x1201b8
 1001aae:	ff 35 b4 01 12 00    	push   DWORD PTR ds:0x1201b4
 1001ab4:	ff 35 b0 01 12 00    	push   DWORD PTR ds:0x1201b0
 1001aba:	68 1c 81 00 01       	push   0x100811c
 1001abf:	e8 b7 0a 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:189
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", exceptionBP, exceptionSI, exceptionDI, exceptionSavedESP);
 1001ac4:	83 c4 14             	add    esp,0x14
 1001ac7:	ff 35 ec 01 12 00    	push   DWORD PTR ds:0x1201ec
 1001acd:	ff 35 c4 01 12 00    	push   DWORD PTR ds:0x1201c4
 1001ad3:	ff 35 c0 01 12 00    	push   DWORD PTR ds:0x1201c0
 1001ad9:	ff 35 c8 01 12 00    	push   DWORD PTR ds:0x1201c8
 1001adf:	68 4c 81 00 01       	push   0x100814c
 1001ae4:	e8 92 0a 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:190
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
 1001ae9:	83 c4 14             	add    esp,0x14
 1001aec:	ff 35 d4 01 12 00    	push   DWORD PTR ds:0x1201d4
 1001af2:	ff 35 d0 01 12 00    	push   DWORD PTR ds:0x1201d0
 1001af8:	ff 35 00 02 12 00    	push   DWORD PTR ds:0x120200
 1001afe:	ff 35 cc 01 12 00    	push   DWORD PTR ds:0x1201cc
 1001b04:	68 74 81 00 01       	push   0x1008174
 1001b09:	e8 6d 0a 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:191
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionGS, exceptionFS);
 1001b0e:	83 c4 14             	add    esp,0x14
 1001b11:	ff 35 e0 01 12 00    	push   DWORD PTR ds:0x1201e0
 1001b17:	ff 35 e4 01 12 00    	push   DWORD PTR ds:0x1201e4
 1001b1d:	ff 35 dc 01 12 00    	push   DWORD PTR ds:0x1201dc
 1001b23:	ff 35 d8 01 12 00    	push   DWORD PTR ds:0x1201d8
 1001b29:	68 9c 81 00 01       	push   0x100819c
 1001b2e:	e8 48 0a 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:192
    printk("GDT=%08X\n",kernelGDT.base);
 1001b33:	83 c4 18             	add    esp,0x18
 1001b36:	ff 35 4e 04 12 00    	push   DWORD PTR ds:0x12044e
 1001b3c:	68 78 77 00 01       	push   0x1007778
 1001b41:	e8 35 0a 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:193
    printk("CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
 1001b46:	ff 35 f4 01 12 00    	push   DWORD PTR ds:0x1201f4
 1001b4c:	ff 35 f8 01 12 00    	push   DWORD PTR ds:0x1201f8
 1001b52:	ff 35 fc 01 12 00    	push   DWORD PTR ds:0x1201fc
 1001b58:	68 c4 81 00 01       	push   0x10081c4
 1001b5d:	e8 19 0a 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:194
          printk("Bytes at CS:EIP: ");
 1001b62:	83 c4 14             	add    esp,0x14
 1001b65:	68 82 77 00 01       	push   0x1007782
 1001b6a:	e8 0c 0a 00 00       	call   100257b <printk>
 1001b6f:	8d 7b 13             	lea    edi,[ebx+0x13]
 1001b72:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:196 (discriminator 3)
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
 1001b75:	83 ec 08             	sub    esp,0x8
 1001b78:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001b7b:	50                   	push   eax
 1001b7c:	68 14 77 00 01       	push   0x1007714
 1001b81:	e8 f5 09 00 00       	call   100257b <printk>
 1001b86:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:195 (discriminator 3)
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionGS, exceptionFS);
    printk("GDT=%08X\n",kernelGDT.base);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
 1001b89:	83 c4 10             	add    esp,0x10
 1001b8c:	39 df                	cmp    edi,ebx
 1001b8e:	75 e5                	jne    1001b75 <printDumpedRegs+0xeb>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:197
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
 1001b90:	83 ec 0c             	sub    esp,0xc
 1001b93:	68 66 7a 00 01       	push   0x1007a66
 1001b98:	e8 de 09 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:198
          printk ("Stack @ 0x%08x:0x%08X:\n",exceptionSS, esp);
 1001b9d:	83 c4 0c             	add    esp,0xc
 1001ba0:	56                   	push   esi
 1001ba1:	ff 35 e8 01 12 00    	push   DWORD PTR ds:0x1201e8
 1001ba7:	68 94 77 00 01       	push   0x1007794
 1001bac:	e8 ca 09 00 00       	call   100257b <printk>
 1001bb1:	83 c4 10             	add    esp,0x10
 1001bb4:	bb 00 00 00 00       	mov    ebx,0x0
 1001bb9:	8d 04 33             	lea    eax,[ebx+esi*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:201 (discriminator 3)
          for (int cnt=0;cnt<10;cnt++)
          {
              printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
 1001bbc:	83 ec 04             	sub    esp,0x4
 1001bbf:	8b 15 a8 01 12 00    	mov    edx,DWORD PTR ds:0x1201a8
 1001bc5:	ff 34 1a             	push   DWORD PTR [edx+ebx*1]
 1001bc8:	50                   	push   eax
 1001bc9:	68 ac 77 00 01       	push   0x10077ac
 1001bce:	e8 a8 09 00 00       	call   100257b <printk>
 1001bd3:	83 c3 04             	add    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:199 (discriminator 3)
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
          printk ("Stack @ 0x%08x:0x%08X:\n",exceptionSS, esp);
          for (int cnt=0;cnt<10;cnt++)
 1001bd6:	83 c4 10             	add    esp,0x10
 1001bd9:	83 fb 28             	cmp    ebx,0x28
 1001bdc:	75 db                	jne    1001bb9 <printDumpedRegs+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:206
              printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
              esp+=4;
          }


}
 1001bde:	5b                   	pop    ebx
 1001bdf:	5e                   	pop    esi
 1001be0:	5f                   	pop    edi
 1001be1:	c3                   	ret    

01001be2 <printDebugRegs>:
printDebugRegs():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:209

void printDebugRegs()
{
 1001be2:	57                   	push   edi
 1001be3:	56                   	push   esi
 1001be4:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:210
    uint32_t esp = debugSavedESP;
 1001be5:	8b 35 40 02 12 00    	mov    esi,DWORD PTR ds:0x120240
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:213
    uint8_t* lCSIPPtr;

    lCSIPPtr=(uint8_t*)(debugEIP);
 1001beb:	8b 1d 50 02 12 00    	mov    ebx,DWORD PTR ds:0x120250
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:214
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", debugAX, debugBX, debugCX, debugDX,debugFlags);
 1001bf1:	83 ec 08             	sub    esp,0x8
 1001bf4:	ff 35 44 02 12 00    	push   DWORD PTR ds:0x120244
 1001bfa:	ff 35 10 02 12 00    	push   DWORD PTR ds:0x120210
 1001c00:	ff 35 0c 02 12 00    	push   DWORD PTR ds:0x12020c
 1001c06:	ff 35 08 02 12 00    	push   DWORD PTR ds:0x120208
 1001c0c:	ff 35 04 02 12 00    	push   DWORD PTR ds:0x120204
 1001c12:	68 1c 81 00 01       	push   0x100811c
 1001c17:	e8 5f 09 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:215
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", debugBP, debugSI, debugDI, debugSavedESP);
 1001c1c:	83 c4 14             	add    esp,0x14
 1001c1f:	ff 35 40 02 12 00    	push   DWORD PTR ds:0x120240
 1001c25:	ff 35 18 02 12 00    	push   DWORD PTR ds:0x120218
 1001c2b:	ff 35 14 02 12 00    	push   DWORD PTR ds:0x120214
 1001c31:	ff 35 1c 02 12 00    	push   DWORD PTR ds:0x12021c
 1001c37:	68 4c 81 00 01       	push   0x100814c
 1001c3c:	e8 3a 09 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:216
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\n", debugCR0, debugCR3, debugCR4);
 1001c41:	83 c4 20             	add    esp,0x20
 1001c44:	ff 35 28 02 12 00    	push   DWORD PTR ds:0x120228
 1001c4a:	ff 35 24 02 12 00    	push   DWORD PTR ds:0x120224
 1001c50:	ff 35 20 02 12 00    	push   DWORD PTR ds:0x120220
 1001c56:	68 be 77 00 01       	push   0x10077be
 1001c5b:	e8 1b 09 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:217
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", debugDS, debugES, debugGS, debugFS);
 1001c60:	83 c4 04             	add    esp,0x4
 1001c63:	ff 35 34 02 12 00    	push   DWORD PTR ds:0x120234
 1001c69:	ff 35 38 02 12 00    	push   DWORD PTR ds:0x120238
 1001c6f:	ff 35 30 02 12 00    	push   DWORD PTR ds:0x120230
 1001c75:	ff 35 2c 02 12 00    	push   DWORD PTR ds:0x12022c
 1001c7b:	68 9c 81 00 01       	push   0x100819c
 1001c80:	e8 f6 08 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:218
    printk("CS:EIP = %04X:%08X, error code=%08X\n", debugCS, debugEIP, debugErrorCode);
 1001c85:	83 c4 20             	add    esp,0x20
 1001c88:	ff 35 48 02 12 00    	push   DWORD PTR ds:0x120248
 1001c8e:	ff 35 50 02 12 00    	push   DWORD PTR ds:0x120250
 1001c94:	ff 35 4c 02 12 00    	push   DWORD PTR ds:0x12024c
 1001c9a:	68 c4 81 00 01       	push   0x10081c4
 1001c9f:	e8 d7 08 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:219
          printk("Bytes at CS:EIP: ");
 1001ca4:	c7 04 24 82 77 00 01 	mov    DWORD PTR [esp],0x1007782
 1001cab:	e8 cb 08 00 00       	call   100257b <printk>
 1001cb0:	8d 7b 13             	lea    edi,[ebx+0x13]
 1001cb3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:221 (discriminator 3)
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
 1001cb6:	83 ec 08             	sub    esp,0x8
 1001cb9:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001cbc:	50                   	push   eax
 1001cbd:	68 14 77 00 01       	push   0x1007714
 1001cc2:	e8 b4 08 00 00       	call   100257b <printk>
 1001cc7:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:220 (discriminator 3)
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", debugBP, debugSI, debugDI, debugSavedESP);
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\n", debugCR0, debugCR3, debugCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", debugDS, debugES, debugGS, debugFS);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", debugCS, debugEIP, debugErrorCode);
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
 1001cca:	83 c4 10             	add    esp,0x10
 1001ccd:	39 df                	cmp    edi,ebx
 1001ccf:	75 e5                	jne    1001cb6 <printDebugRegs+0xd4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:222
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
 1001cd1:	83 ec 0c             	sub    esp,0xc
 1001cd4:	68 66 7a 00 01       	push   0x1007a66
 1001cd9:	e8 9d 08 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:223
          printk ("Stack @ 0x%08x:0x%08X:\n",debugSS, esp);
 1001cde:	83 c4 0c             	add    esp,0xc
 1001ce1:	56                   	push   esi
 1001ce2:	ff 35 3c 02 12 00    	push   DWORD PTR ds:0x12023c
 1001ce8:	68 94 77 00 01       	push   0x1007794
 1001ced:	e8 89 08 00 00       	call   100257b <printk>
 1001cf2:	83 c4 10             	add    esp,0x10
 1001cf5:	bb 00 00 00 00       	mov    ebx,0x0
 1001cfa:	8d 04 33             	lea    eax,[ebx+esi*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:226 (discriminator 3)
          for (int cnt=0;cnt<10;cnt++)
          {
              printk("\t0x%08X%: 0x%08X\n",esp, debugSavedStack[cnt]);
 1001cfd:	83 ec 04             	sub    esp,0x4
 1001d00:	8b 15 ac 01 12 00    	mov    edx,DWORD PTR ds:0x1201ac
 1001d06:	ff 34 1a             	push   DWORD PTR [edx+ebx*1]
 1001d09:	50                   	push   eax
 1001d0a:	68 ac 77 00 01       	push   0x10077ac
 1001d0f:	e8 67 08 00 00       	call   100257b <printk>
 1001d14:	83 c3 04             	add    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:224 (discriminator 3)
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
          printk ("Stack @ 0x%08x:0x%08X:\n",debugSS, esp);
          for (int cnt=0;cnt<10;cnt++)
 1001d17:	83 c4 10             	add    esp,0x10
 1001d1a:	83 fb 28             	cmp    ebx,0x28
 1001d1d:	75 db                	jne    1001cfa <printDebugRegs+0x118>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:231
              printk("\t0x%08X%: 0x%08X\n",esp, debugSavedStack[cnt]);
              esp+=4;
          }


}
 1001d1f:	5b                   	pop    ebx
 1001d20:	5e                   	pop    esi
 1001d21:	5f                   	pop    edi
 1001d22:	c3                   	ret    

01001d23 <reboot>:
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:239
/* keyboard interface IO port: data and control
   READ:   status port
   WRITE:  control register */
 
void reboot(bool waitFirst)
{
 1001d23:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:242
    uint8_t temp;
 
    if (waitFirst)
 1001d26:	80 7c 24 10 00       	cmp    BYTE PTR [esp+0x10],0x0
 1001d2b:	74 1d                	je     1001d4a <reboot+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:244
    {
        puts("Rebooting ... ");
 1001d2d:	83 ec 0c             	sub    esp,0xc
 1001d30:	68 da 77 00 01       	push   0x10077da
 1001d35:	e8 ff e6 ff ff       	call   1000439 <puts>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:245
        __asm__("sti\n");
 1001d3a:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:246
        wait(3000);
 1001d3b:	c7 04 24 b8 0b 00 00 	mov    DWORD PTR [esp],0xbb8
 1001d42:	e8 dd 11 00 00       	call   1002f24 <wait>
 1001d47:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:248
    }
    __asm__ volatile ("cli"); /* disable all interrupts */
 1001d4a:	fa                   	cli    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1001d4b:	e4 64                	in     al,0x64
 1001d4d:	89 c2                	mov    edx,eax
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:254
 
    /* Clear all keyboard buffers (output and command buffers) */
    do
    {
        temp = inb(KBRD_INTRFC); /* empty user data */
        if (check_flag(temp, KBRD_BIT_KDATA) != 0)
 1001d4f:	a8 01                	test   al,0x1
 1001d51:	74 02                	je     1001d55 <reboot+0x32>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1001d53:	e4 60                	in     al,0x60
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:256
            inb(KBRD_IO); /* empty keyboard data */
    } while (check_flag(temp, KBRD_BIT_UDATA) != 0);
 1001d55:	f6 c2 02             	test   dl,0x2
 1001d58:	75 f1                	jne    1001d4b <reboot+0x28>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001d5a:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 1001d5f:	e6 64                	out    0x64,al
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:260 (discriminator 1)
 
    outb(KBRD_INTRFC, KBRD_RESET); /* pulse CPU reset line */
loop:
    __asm__ volatile ("hlt"); /* if that didn't work, halt the CPU */
 1001d61:	f4                   	hlt    
 1001d62:	eb fd                	jmp    1001d61 <reboot+0x3e>

01001d64 <dumpKernelAddresses>:
dumpKernelAddresses():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:265
    goto loop; /* if a NMI is received, halt again */
}

void dumpKernelAddresses()
{
 1001d64:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:266
printk("Kernel Variable List:\n");
 1001d67:	68 e9 77 00 01       	push   0x10077e9
 1001d6c:	e8 0a 08 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:267
printk("\tKERNEL_OBJECT_BASE_ADDRESS=0x%08x\n",KERNEL_OBJECT_BASE_ADDRESS);
 1001d71:	83 c4 08             	add    esp,0x8
 1001d74:	68 00 00 15 00       	push   0x150000
 1001d79:	68 ec 81 00 01       	push   0x10081ec
 1001d7e:	e8 f8 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:268
printk("\tE820_TABLE_ADDRESS=0x%08x (0x%08X)\n",E820_TABLE_ADDRESS);
 1001d83:	83 c4 08             	add    esp,0x8
 1001d86:	68 00 00 15 00       	push   0x150000
 1001d8b:	68 10 82 00 01       	push   0x1008210
 1001d90:	e8 e6 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:269
printk("\tMP_CONFIG_TABLE_ADDRESS=0x%08x\n",MP_CONFIG_TABLE_ADDRESS);
 1001d95:	83 c4 08             	add    esp,0x8
 1001d98:	68 b0 04 15 00       	push   0x1504b0
 1001d9d:	68 38 82 00 01       	push   0x1008238
 1001da2:	e8 d4 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:270
printk("\tKEYBOARD_BUFFER_ADDRESS=0x%08x\n",KEYBOARD_BUFFER_ADDRESS);
 1001da7:	83 c4 08             	add    esp,0x8
 1001daa:	68 b0 24 15 00       	push   0x1524b0
 1001daf:	68 5c 82 00 01       	push   0x100825c
 1001db4:	e8 c2 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:271
printk("\tIDT_TABLE_ADDRESS=0x%08x\n",IDT_TABLE_ADDRESS);
 1001db9:	83 c4 08             	add    esp,0x8
 1001dbc:	68 00 30 15 00       	push   0x153000
 1001dc1:	68 00 78 00 01       	push   0x1007800
 1001dc6:	e8 b0 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:272
printk("\tINIT_GDT_TABLE_ADDRESS=0x%08x\n",INIT_GDT_TABLE_ADDRESS);
 1001dcb:	83 c4 08             	add    esp,0x8
 1001dce:	68 00 40 15 00       	push   0x154000
 1001dd3:	68 80 82 00 01       	push   0x1008280
 1001dd8:	e8 9e 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:273
printk("\tTASK_TABLE_ADDRESS=0x%08x\n",TASK_TABLE_ADDRESS);
 1001ddd:	83 c4 08             	add    esp,0x8
 1001de0:	68 00 50 15 00       	push   0x155000
 1001de5:	68 1b 78 00 01       	push   0x100781b
 1001dea:	e8 8c 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:274
printk("\tTSS_TABLE_ADDRESS=0x%08x\n",TSS_TABLE_ADDRESS);
 1001def:	83 c4 08             	add    esp,0x8
 1001df2:	68 00 60 2e 00       	push   0x2e6000
 1001df7:	68 37 78 00 01       	push   0x1007837
 1001dfc:	e8 7a 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:275
printk("\tATA_MBR_ARRAY_ADDRESS=0x%08x\n",ATA_MBR_ARRAY_ADDRESS);
 1001e01:	83 c4 08             	add    esp,0x8
 1001e04:	68 00 60 48 00       	push   0x486000
 1001e09:	68 a0 82 00 01       	push   0x10082a0
 1001e0e:	e8 68 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:276
printk("\tPCI_DEVICE_LIST_ADDRESS=0x%08x\n",PCI_DEVICE_LIST_ADDRESS);
 1001e13:	83 c4 08             	add    esp,0x8
 1001e16:	68 00 70 48 00       	push   0x487000
 1001e1b:	68 c0 82 00 01       	push   0x10082c0
 1001e20:	e8 56 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:277
printk("\tPCI_BRIDGE_LIST_ADDRESS=0x%08x\n",PCI_BRIDGE_LIST_ADDRESS);
 1001e25:	83 c4 08             	add    esp,0x8
 1001e28:	68 00 70 49 00       	push   0x497000
 1001e2d:	68 e4 82 00 01       	push   0x10082e4
 1001e32:	e8 44 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:278
printk("\tPCI_FUNCTION_LIST_ADDRESS=0x%08x\n",PCI_FUNCTION_LIST_ADDRESS);
 1001e37:	83 c4 08             	add    esp,0x8
 1001e3a:	68 00 70 4a 00       	push   0x4a7000
 1001e3f:	68 08 83 00 01       	push   0x1008308
 1001e44:	e8 32 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:279
printk("\tGDT_PMODE_16BIT_TABLE_ADDRESS=0x%08x\n",GDT_PMODE_16BIT_TABLE_ADDRESS);
 1001e49:	83 c4 08             	add    esp,0x8
 1001e4c:	68 00 80 4a 00       	push   0x4a8000
 1001e51:	68 2c 83 00 01       	push   0x100832c
 1001e56:	e8 20 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:280
printk("\tKERNEL_PAGE_DIR_ADDRESS=0x%08x\n",KERNEL_PAGE_DIR_ADDRESS);
 1001e5b:	83 c4 08             	add    esp,0x8
 1001e5e:	68 00 90 4a 00       	push   0x4a9000
 1001e63:	68 54 83 00 01       	push   0x1008354
 1001e68:	e8 0e 07 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:281
printk("\tKERNEL_PAGE_TABLE_BASE_ADDRESS=0x%08x\n",KERNEL_PAGE_TABLE_BASE_ADDRESS);
 1001e6d:	83 c4 08             	add    esp,0x8
 1001e70:	68 00 b0 4b 00       	push   0x4bb000
 1001e75:	68 78 83 00 01       	push   0x1008378
 1001e7a:	e8 fc 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:282
printk("\tSAVED_STACK_FOR_EXCEPTIONS_ADDRESS=0x%08x\n",SAVED_STACK_FOR_EXCEPTIONS_ADDRESS);
 1001e7f:	83 c4 08             	add    esp,0x8
 1001e82:	68 00 c0 8b 00       	push   0x8bc000
 1001e87:	68 a0 83 00 01       	push   0x10083a0
 1001e8c:	e8 ea 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:283
printk("\tSAVED_STACK_FOR_DEBUGGING_ADDRESS=0x%08x\n",SAVED_STACK_FOR_DEBUGGING_ADDRESS);
 1001e91:	83 c4 08             	add    esp,0x8
 1001e94:	68 00 e0 8b 00       	push   0x8be000
 1001e99:	68 cc 83 00 01       	push   0x10083cc
 1001e9e:	e8 d8 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:284
printk("\tCPU_APIC_REGISTER_REMAP_BASE_ADDRESS=0x%08x\n",CPU_APIC_REGISTER_REMAP_BASE_ADDRESS);
 1001ea3:	83 c4 08             	add    esp,0x8
 1001ea6:	68 00 00 8c 00       	push   0x8c0000
 1001eab:	68 f8 83 00 01       	push   0x10083f8
 1001eb0:	e8 c6 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:285
printk("\tCPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS=0x%08x\n",CPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS);
 1001eb5:	83 c4 08             	add    esp,0x8
 1001eb8:	68 00 10 8c 00       	push   0x8c1000
 1001ebd:	68 28 84 00 01       	push   0x1008428
 1001ec2:	e8 b4 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:286
printk("\tKERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS=0x%08x\n",KERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS);
 1001ec7:	83 c4 08             	add    esp,0x8
 1001eca:	68 04 10 8c 00       	push   0x8c1004
 1001ecf:	68 58 84 00 01       	push   0x1008458
 1001ed4:	e8 a2 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:287
printk("\tAHCI_ABAR_REMAPPED_ADDRESS=0x%08x\n",AHCI_ABAR_REMAPPED_ADDRESS);
 1001ed9:	83 c4 08             	add    esp,0x8
 1001edc:	68 00 20 8c 00       	push   0x8c2000
 1001ee1:	68 8c 84 00 01       	push   0x100848c
 1001ee6:	e8 90 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:288
printk("\tAHCI_PORT_BASE_REMAP_ADDRESS=0x%08x\n",AHCI_PORT_BASE_REMAP_ADDRESS);
 1001eeb:	83 c4 08             	add    esp,0x8
 1001eee:	68 00 20 90 00       	push   0x902000
 1001ef3:	68 b0 84 00 01       	push   0x10084b0
 1001ef8:	e8 7e 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:289
printk("\tAHCI_DISK_BUFFER_ADDRESS=0x%08x\n",AHCI_DISK_BUFFER_ADDRESS);
 1001efd:	83 c4 08             	add    esp,0x8
 1001f00:	68 00 20 a4 00       	push   0xa42000
 1001f05:	68 d8 84 00 01       	push   0x10084d8
 1001f0a:	e8 6c 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:290
printk("\tATA_DEVICE_INFO_ADDRESS=0x%08x\n",ATA_DEVICE_INFO_ADDRESS);
 1001f0f:	83 c4 08             	add    esp,0x8
 1001f12:	68 00 20 b8 00       	push   0xb82000
 1001f17:	68 fc 84 00 01       	push   0x10084fc
 1001f1c:	e8 5a 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:291
printk("\tAHCI_CAPS_ADDRESS=0x%08x\n",AHCI_CAPS_ADDRESS);
 1001f21:	83 c4 08             	add    esp,0x8
 1001f24:	68 20 6e b8 00       	push   0xb86e20
 1001f29:	68 52 78 00 01       	push   0x1007852
 1001f2e:	e8 48 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:292
printk("\tTSS_AVAILABLE_ADDRESS=0x%08x\n",TASK_AVAILABLE_ADDRESS);
 1001f33:	83 c4 08             	add    esp,0x8
 1001f36:	68 40 bc b8 00       	push   0xb8bc40
 1001f3b:	68 20 85 00 01       	push   0x1008520
 1001f40:	e8 36 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:293
printk("\tGDT_AVAILABLE_ADDRESS=0x%08x\n",GDT_AVAILABLE_ADDRESS);
 1001f45:	83 c4 08             	add    esp,0x8
 1001f48:	68 40 c4 b8 00       	push   0xb8c440
 1001f4d:	68 40 85 00 01       	push   0x1008540
 1001f52:	e8 24 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:294
printk("\tEXEC_FILE_LOAD_INFO=0x%08x\n",EXEC_FILE_LOAD_INFO);
 1001f57:	83 c4 08             	add    esp,0x8
 1001f5a:	68 40 cc b8 00       	push   0xb8cc40
 1001f5f:	68 6d 78 00 01       	push   0x100786d
 1001f64:	e8 12 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:295
printk("\tAHCI_ABAR_ADDRESS=0x%08x\n",AHCI_ABAR_ADDRESS);
 1001f69:	83 c4 08             	add    esp,0x8
 1001f6c:	68 e0 52 ba 00       	push   0xba52e0
 1001f71:	68 8a 78 00 01       	push   0x100788a
 1001f76:	e8 00 06 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:296
printk("\tEND_OF_KERNEL_OBJECTS_ADDRESS=0x%08x\n",END_OF_KERNEL_OBJECTS_ADDRESS);
 1001f7b:	83 c4 08             	add    esp,0x8
 1001f7e:	68 e0 52 ca 00       	push   0xca52e0
 1001f83:	68 60 85 00 01       	push   0x1008560
 1001f88:	e8 ee 05 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:297
}
 1001f8d:	83 c4 1c             	add    esp,0x1c
 1001f90:	c3                   	ret    

01001f91 <pauseDisplay>:
pauseDisplay():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:300

bool pauseDisplay(bool offerToQuit)
{
 1001f91:	56                   	push   esi
 1001f92:	53                   	push   ebx
 1001f93:	83 ec 04             	sub    esp,0x4
 1001f96:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:301
    if (offerToQuit)
 1001f9a:	84 db                	test   bl,bl
 1001f9c:	74 12                	je     1001fb0 <pauseDisplay+0x1f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:302
        printk("Press q to quit, any other key to continue ...");
 1001f9e:	83 ec 0c             	sub    esp,0xc
 1001fa1:	68 88 85 00 01       	push   0x1008588
 1001fa6:	e8 d0 05 00 00       	call   100257b <printk>
 1001fab:	83 c4 10             	add    esp,0x10
 1001fae:	eb 10                	jmp    1001fc0 <pauseDisplay+0x2f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:304
    else
        printk("Press a key to continue ... ");
 1001fb0:	83 ec 0c             	sub    esp,0xc
 1001fb3:	68 a5 78 00 01       	push   0x10078a5
 1001fb8:	e8 be 05 00 00       	call   100257b <printk>
 1001fbd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:305
    char lPressedKey=waitForKeyboardKey();
 1001fc0:	e8 f3 e4 ff ff       	call   10004b8 <waitForKeyboardKey>
 1001fc5:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:306
    cursorMoveToX(0);
 1001fc7:	83 ec 0c             	sub    esp,0xc
 1001fca:	6a 00                	push   0x0
 1001fcc:	e8 b9 e3 ff ff       	call   100038a <cursorMoveToX>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:307
    printk("                                           ");
 1001fd1:	c7 04 24 b8 85 00 01 	mov    DWORD PTR [esp],0x10085b8
 1001fd8:	e8 9e 05 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:308
    cursorMoveToX(0);
 1001fdd:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
 1001fe4:	e8 a1 e3 ff ff       	call   100038a <cursorMoveToX>
 1001fe9:	89 f0                	mov    eax,esi
 1001feb:	3c 71                	cmp    al,0x71
 1001fed:	0f 94 c0             	sete   al
 1001ff0:	21 d8                	and    eax,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:312
    if (lPressedKey=='q' && offerToQuit)
        return true;
    return false;
}
 1001ff2:	83 c4 14             	add    esp,0x14
 1001ff5:	5b                   	pop    ebx
 1001ff6:	5e                   	pop    esi
 1001ff7:	c3                   	ret    

01001ff8 <mallocTemp>:
mallocTemp():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:317

int memPtr=0xe00000;
uintptr_t* mallocTemp(int size)
{
    uintptr_t lRetVal = memPtr;
 1001ff8:	a1 00 48 00 01       	mov    eax,ds:0x1004800
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:318
    memPtr+=size;
 1001ffd:	89 c2                	mov    edx,eax
 1001fff:	03 54 24 04          	add    edx,DWORD PTR [esp+0x4]
 1002003:	89 15 00 48 00 01    	mov    DWORD PTR ds:0x1004800,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:320
    return (uintptr_t*)lRetVal;
 1002009:	c3                   	ret    
 100200a:	66 90                	xchg   ax,ax

0100200c <memcpy>:
memcpy():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:12
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
void * memcpy(void *dest, const void *src, size_t n)
{
 100200c:	57                   	push   edi
 100200d:	56                   	push   esi
 100200e:	53                   	push   ebx
 100200f:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 1002013:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 1002017:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:17
    bool dw,dd;
    
    dd=n%4==0;
    dw=n%2==0;
    if (dd)
 100201b:	89 d1                	mov    ecx,edx
 100201d:	83 e1 03             	and    ecx,0x3
 1002020:	75 4d                	jne    100206f <memcpy+0x63>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:19
    {
        n /=4;
 1002022:	c1 ea 02             	shr    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:23
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
 1002025:	39 c3                	cmp    ebx,eax
 1002027:	72 0e                	jb     1002037 <memcpy+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 1002029:	b9 00 00 00 00       	mov    ecx,0x0
 100202e:	85 d2                	test   edx,edx
 1002030:	75 2e                	jne    1002060 <memcpy+0x54>
 1002032:	e9 b6 00 00 00       	jmp    10020ed <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:24
        n /=4;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
 1002037:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
 100203e:	01 fb                	add    ebx,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:25
                t += n;
 1002040:	01 c7                	add    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:26
                while ( (n)-- > 0)
 1002042:	85 d2                	test   edx,edx
 1002044:	0f 84 a3 00 00 00    	je     10020ed <memcpy+0xe1>
 100204a:	f7 da                	neg    edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:27
                        *--t = *--f;
 100204c:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
 1002050:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
 1002054:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:26
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
 1002057:	39 d1                	cmp    ecx,edx
 1002059:	75 f1                	jne    100204c <memcpy+0x40>
 100205b:	e9 8d 00 00 00       	jmp    10020ed <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:30
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
 1002060:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
 1002063:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
 1002066:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 1002069:	39 ca                	cmp    edx,ecx
 100206b:	75 f3                	jne    1002060 <memcpy+0x54>
 100206d:	eb 7e                	jmp    10020ed <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:33
                        *t++ = *f++;
        return dest;
    }
    else if (dw)
 100206f:	89 d1                	mov    ecx,edx
 1002071:	83 e1 01             	and    ecx,0x1
 1002074:	75 42                	jne    10020b8 <memcpy+0xac>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:35
    {
        n /=2;
 1002076:	d1 ea                	shr    edx,1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:39
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
 1002078:	39 c3                	cmp    ebx,eax
 100207a:	72 0b                	jb     1002087 <memcpy+0x7b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 100207c:	b9 00 00 00 00       	mov    ecx,0x0
 1002081:	85 d2                	test   edx,edx
 1002083:	75 24                	jne    10020a9 <memcpy+0x9d>
 1002085:	eb 66                	jmp    10020ed <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:40
        n /=2;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
 1002087:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
 100208e:	01 fb                	add    ebx,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:41
                t += n;
 1002090:	01 c7                	add    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:42
                while ( (n)-- > 0)
 1002092:	85 d2                	test   edx,edx
 1002094:	74 57                	je     10020ed <memcpy+0xe1>
 1002096:	f7 da                	neg    edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:43
                        *--t = *--f;
 1002098:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
 100209c:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
 10020a0:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:42
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
 10020a3:	39 ca                	cmp    edx,ecx
 10020a5:	75 f1                	jne    1002098 <memcpy+0x8c>
 10020a7:	eb 44                	jmp    10020ed <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:46
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
 10020a9:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
 10020ac:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
 10020af:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 10020b2:	39 ca                	cmp    edx,ecx
 10020b4:	75 f3                	jne    10020a9 <memcpy+0x9d>
 10020b6:	eb 35                	jmp    10020ed <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:54
    else
    {
        const char *f = src;
        char *t = dest;

        if (f < t) {
 10020b8:	39 c3                	cmp    ebx,eax
 10020ba:	72 0b                	jb     10020c7 <memcpy+0xbb>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
 10020bc:	be 00 00 00 00       	mov    esi,0x0
 10020c1:	85 d2                	test   edx,edx
 10020c3:	75 1a                	jne    10020df <memcpy+0xd3>
 10020c5:	eb 26                	jmp    10020ed <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
 10020c7:	8d 4a ff             	lea    ecx,[edx-0x1]
 10020ca:	85 d2                	test   edx,edx
 10020cc:	74 1f                	je     10020ed <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:58
                        *--t = *--f;
 10020ce:	0f b6 14 0b          	movzx  edx,BYTE PTR [ebx+ecx*1]
 10020d2:	88 14 08             	mov    BYTE PTR [eax+ecx*1],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
 10020d5:	83 e9 01             	sub    ecx,0x1
 10020d8:	83 f9 ff             	cmp    ecx,0xffffffff
 10020db:	75 f1                	jne    10020ce <memcpy+0xc2>
 10020dd:	eb 0e                	jmp    10020ed <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:61
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
 10020df:	0f b6 0c 33          	movzx  ecx,BYTE PTR [ebx+esi*1]
 10020e3:	88 0c 30             	mov    BYTE PTR [eax+esi*1],cl
 10020e6:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
 10020e9:	39 f2                	cmp    edx,esi
 10020eb:	75 f2                	jne    10020df <memcpy+0xd3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:64
                        *t++ = *f++;
        return dest;
    }
 10020ed:	5b                   	pop    ebx
 10020ee:	5e                   	pop    esi
 10020ef:	5f                   	pop    edi
 10020f0:	c3                   	ret    
 10020f1:	66 90                	xchg   ax,ax
 10020f3:	90                   	nop

010020f4 <panic>:
panic():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:8
#include <stdarg.h>
#include <time.h>
#include "printf.h"

void __attribute__((noinline))panic(const char *format, ...)
{
 10020f4:	53                   	push   ebx
 10020f5:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:10
    va_list args;
    va_start( args, format );
 10020f8:	8d 5c 24 14          	lea    ebx,[esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:11
    printk("\n>>>panic at instruction prior to address 0x%08X<<<\n", __builtin_return_address(0));
 10020fc:	83 ec 08             	sub    esp,0x8
 10020ff:	ff 74 24 14          	push   DWORD PTR [esp+0x14]
 1002103:	68 e4 85 00 01       	push   0x10085e4
 1002108:	e8 6e 04 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:12
    printk("  >>>");
 100210d:	c7 04 24 c2 78 00 01 	mov    DWORD PTR [esp],0x10078c2
 1002114:	e8 62 04 00 00       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:13
    printk_valist( format,args);
 1002119:	83 c4 08             	add    esp,0x8
 100211c:	53                   	push   ebx
 100211d:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1002121:	e8 3c 04 00 00       	call   1002562 <printk_valist>
 1002126:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:15 (discriminator 1)
    panicLoop: 
    __asm__("cli\nhlt\n");
 1002129:	fa                   	cli    
 100212a:	f4                   	hlt    
 100212b:	eb fc                	jmp    1002129 <panic+0x35>
 100212d:	66 90                	xchg   ax,ax
 100212f:	90                   	nop

01002130 <printchar>:
printchar():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:43
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
	
	if (str) {
 1002130:	85 c0                	test   eax,eax
 1002132:	74 08                	je     100213c <printchar+0xc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:44
		**str = c;
 1002134:	8b 08                	mov    ecx,DWORD PTR [eax]
 1002136:	88 11                	mov    BYTE PTR [ecx],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:45
		++(*str);
 1002138:	83 00 01             	add    DWORD PTR [eax],0x1
 100213b:	c3                   	ret    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:41
//extern bool pauseDisplay(bool offerToQuit);
extern uint32_t kDebugLevel;
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
 100213c:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:47
	
	if (str) {
		**str = c;
		++(*str);
	}
	else terminal_putchar((unsigned char)c);
 100213f:	0f b6 d2             	movzx  edx,dl
 1002142:	52                   	push   edx
 1002143:	e8 cd e0 ff ff       	call   1000215 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:48
}
 1002148:	83 c4 1c             	add    esp,0x1c
 100214b:	c3                   	ret    

0100214c <prints>:
prints():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:54

#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
 100214c:	55                   	push   ebp
 100214d:	57                   	push   edi
 100214e:	56                   	push   esi
 100214f:	53                   	push   ebx
 1002150:	83 ec 1c             	sub    esp,0x1c
 1002153:	89 c7                	mov    edi,eax
 1002155:	89 d6                	mov    esi,edx
 1002157:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
 100215b:	8b 54 24 30          	mov    edx,DWORD PTR [esp+0x30]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:57
	register int pc = 0, padchar = ' ';

	if (width > 0) {
 100215f:	85 c9                	test   ecx,ecx
 1002161:	0f 8e cb 00 00 00    	jle    1002232 <prints+0xe6>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60 (discriminator 1)
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
 1002167:	80 3e 00             	cmp    BYTE PTR [esi],0x0
 100216a:	74 1b                	je     1002187 <prints+0x3b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60
 100216c:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60 (discriminator 3)
 1002171:	83 c0 01             	add    eax,0x1
 1002174:	80 3c 06 00          	cmp    BYTE PTR [esi+eax*1],0x0
 1002178:	75 f7                	jne    1002171 <prints+0x25>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:61
		if (len >= width) width = 0;
 100217a:	bb 00 00 00 00       	mov    ebx,0x0
 100217f:	39 44 24 0c          	cmp    DWORD PTR [esp+0xc],eax
 1002183:	7e 0f                	jle    1002194 <prints+0x48>
 1002185:	eb 05                	jmp    100218c <prints+0x40>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60
	register int pc = 0, padchar = ' ';

	if (width > 0) {
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
 1002187:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:62
		if (len >= width) width = 0;
		else width -= len;
 100218c:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 1002190:	29 c1                	sub    ecx,eax
 1002192:	89 cb                	mov    ebx,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:63
		if (pad & PAD_ZERO) padchar = '0';
 1002194:	89 d0                	mov    eax,edx
 1002196:	83 e0 02             	and    eax,0x2
 1002199:	83 f8 01             	cmp    eax,0x1
 100219c:	19 ed                	sbb    ebp,ebp
 100219e:	83 e5 f0             	and    ebp,0xfffffff0
 10021a1:	83 c5 30             	add    ebp,0x30
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:65
	}
	if (!(pad & PAD_RIGHT)) {
 10021a4:	f6 c2 01             	test   dl,0x1
 10021a7:	75 1a                	jne    10021c3 <prints+0x77>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66 (discriminator 1)
		for ( ; width > 0; --width) {
 10021a9:	85 db                	test   ebx,ebx
 10021ab:	7e 67                	jle    1002214 <prints+0xc8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66
 10021ad:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:67 (discriminator 2)
			printchar (out, padchar);
 10021b1:	89 ea                	mov    edx,ebp
 10021b3:	89 f8                	mov    eax,edi
 10021b5:	e8 76 ff ff ff       	call   1002130 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66 (discriminator 2)
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
 10021ba:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
 10021bf:	75 f0                	jne    10021b1 <prints+0x65>
 10021c1:	eb 66                	jmp    1002229 <prints+0xdd>
 10021c3:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 1)
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 10021c7:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 10021ca:	84 d2                	test   dl,dl
 10021cc:	74 1e                	je     10021ec <prints+0xa0>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 10021ce:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 10021d3:	29 de                	sub    esi,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:72 (discriminator 2)
		printchar (out, *string);
 10021d5:	0f be d2             	movsx  edx,dl
 10021d8:	89 f8                	mov    eax,edi
 10021da:	e8 51 ff ff ff       	call   1002130 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:73 (discriminator 2)
		++pc;
 10021df:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 10021e2:	0f b6 14 1e          	movzx  edx,BYTE PTR [esi+ebx*1]
 10021e6:	84 d2                	test   dl,dl
 10021e8:	75 eb                	jne    10021d5 <prints+0x89>
 10021ea:	eb 05                	jmp    10021f1 <prints+0xa5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 10021ec:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:75 (discriminator 1)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
 10021f1:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10021f5:	85 c0                	test   eax,eax
 10021f7:	7e 45                	jle    100223e <prints+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:75
 10021f9:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:76 (discriminator 2)
		printchar (out, padchar);
 10021fb:	89 ea                	mov    edx,ebp
 10021fd:	89 f8                	mov    eax,edi
 10021ff:	e8 2c ff ff ff       	call   1002130 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:75 (discriminator 2)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
 1002204:	83 ee 01             	sub    esi,0x1
 1002207:	75 f2                	jne    10021fb <prints+0xaf>
 1002209:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 100220d:	8d 04 03             	lea    eax,[ebx+eax*1]
 1002210:	89 c3                	mov    ebx,eax
 1002212:	eb 2a                	jmp    100223e <prints+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
 1002214:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
 1002218:	bb 00 00 00 00       	mov    ebx,0x0
 100221d:	eb 0a                	jmp    1002229 <prints+0xdd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 100221f:	bd 20 00 00 00       	mov    ebp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
 1002224:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 1002229:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 100222c:	84 d2                	test   dl,dl
 100222e:	75 a3                	jne    10021d3 <prints+0x87>
 1002230:	eb 0c                	jmp    100223e <prints+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
 1002232:	f6 c2 01             	test   dl,0x1
 1002235:	74 e8                	je     100221f <prints+0xd3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 1002237:	bd 20 00 00 00       	mov    ebp,0x20
 100223c:	eb 89                	jmp    10021c7 <prints+0x7b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:81
		printchar (out, padchar);
		++pc;
	}

	return pc;
}
 100223e:	89 d8                	mov    eax,ebx
 1002240:	83 c4 1c             	add    esp,0x1c
 1002243:	5b                   	pop    ebx
 1002244:	5e                   	pop    esi
 1002245:	5f                   	pop    edi
 1002246:	5d                   	pop    ebp
 1002247:	c3                   	ret    

01002248 <printi>:
printi():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:87

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
 1002248:	55                   	push   ebp
 1002249:	57                   	push   edi
 100224a:	56                   	push   esi
 100224b:	53                   	push   ebx
 100224c:	83 ec 2c             	sub    esp,0x2c
 100224f:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:93
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;

	if (i == 0) {
 1002253:	85 d2                	test   edx,edx
 1002255:	75 2a                	jne    1002281 <printi+0x39>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:94
		print_buf[0] = '0';
 1002257:	c6 44 24 14 30       	mov    BYTE PTR [esp+0x14],0x30
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:95
		print_buf[1] = '\0';
 100225c:	c6 44 24 15 00       	mov    BYTE PTR [esp+0x15],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:96
		return prints (out, print_buf, width, pad);
 1002261:	83 ec 0c             	sub    esp,0xc
 1002264:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 1002268:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
 100226c:	8d 54 24 24          	lea    edx,[esp+0x24]
 1002270:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002274:	e8 d3 fe ff ff       	call   100214c <prints>
 1002279:	83 c4 10             	add    esp,0x10
 100227c:	e9 f1 00 00 00       	jmp    1002372 <printi+0x12a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:99
	}

	if (sg && b == 10 && i < 0) {
 1002281:	83 7c 24 40 00       	cmp    DWORD PTR [esp+0x40],0x0
 1002286:	0f 95 c3             	setne  bl
 1002289:	83 f9 0a             	cmp    ecx,0xa
 100228c:	0f 94 c0             	sete   al
 100228f:	84 c3                	test   bl,al
 1002291:	0f 84 c1 00 00 00    	je     1002358 <printi+0x110>
 1002297:	89 d0                	mov    eax,edx
 1002299:	c1 e8 1f             	shr    eax,0x1f
 100229c:	84 c0                	test   al,al
 100229e:	0f 84 b4 00 00 00    	je     1002358 <printi+0x110>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
 10022a4:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
 10022a9:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:107
	*s = '\0';

	while (u) {
 10022ad:	89 d3                	mov    ebx,edx
 10022af:	f7 db                	neg    ebx
 10022b1:	74 54                	je     1002307 <printi+0xbf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:100
		print_buf[1] = '\0';
		return prints (out, print_buf, width, pad);
	}

	if (sg && b == 10 && i < 0) {
		neg = 1;
 10022b3:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
 10022ba:	00 
 10022bb:	eb 08                	jmp    10022c5 <printi+0x7d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 10022bd:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 10022c4:	00 
 10022c5:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
 10022c9:	89 cf                	mov    edi,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
 10022cb:	8b 44 24 4c          	mov    eax,DWORD PTR [esp+0x4c]
 10022cf:	8d 68 c6             	lea    ebp,[eax-0x3a]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
 10022d2:	89 d8                	mov    eax,ebx
 10022d4:	ba 00 00 00 00       	mov    edx,0x0
 10022d9:	f7 f1                	div    ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
 10022db:	8d 04 2a             	lea    eax,[edx+ebp*1]
 10022de:	83 fa 0a             	cmp    edx,0xa
 10022e1:	0f 4c c2             	cmovl  eax,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:111
		*--s = t + '0';
 10022e4:	83 ee 01             	sub    esi,0x1
 10022e7:	83 c0 30             	add    eax,0x30
 10022ea:	88 06                	mov    BYTE PTR [esi],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:112
		u /= b;
 10022ec:	89 d8                	mov    eax,ebx
 10022ee:	ba 00 00 00 00       	mov    edx,0x0
 10022f3:	f7 f7                	div    edi
 10022f5:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:107
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
 10022f7:	85 c0                	test   eax,eax
 10022f9:	75 d7                	jne    10022d2 <printi+0x8a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 10022fb:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:115
			t += letbase - '0' - 10;
		*--s = t + '0';
		u /= b;
	}

	if (neg) {
 1002300:	83 7c 24 0c 00       	cmp    DWORD PTR [esp+0xc],0x0
 1002305:	74 34                	je     100233b <printi+0xf3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:116
		if( width && (pad & PAD_ZERO) ) {
 1002307:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
 100230c:	74 21                	je     100232f <printi+0xe7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:116 (discriminator 1)
 100230e:	f6 44 24 48 02       	test   BYTE PTR [esp+0x48],0x2
 1002313:	74 1a                	je     100232f <printi+0xe7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:117
			printchar (out, '-');
 1002315:	ba 2d 00 00 00       	mov    edx,0x2d
 100231a:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100231e:	e8 0d fe ff ff       	call   1002130 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:119
			++pc;
			--width;
 1002323:	83 6c 24 44 01       	sub    DWORD PTR [esp+0x44],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:118
	}

	if (neg) {
		if( width && (pad & PAD_ZERO) ) {
			printchar (out, '-');
			++pc;
 1002328:	bb 01 00 00 00       	mov    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:119
			--width;
 100232d:	eb 0c                	jmp    100233b <printi+0xf3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:122
		}
		else {
			*--s = '-';
 100232f:	c6 46 ff 2d          	mov    BYTE PTR [esi-0x1],0x2d
 1002333:	8d 76 ff             	lea    esi,[esi-0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 1002336:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:126
		else {
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
 100233b:	83 ec 0c             	sub    esp,0xc
 100233e:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 1002342:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
 1002346:	89 f2                	mov    edx,esi
 1002348:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 100234c:	e8 fb fd ff ff       	call   100214c <prints>
 1002351:	01 d8                	add    eax,ebx
 1002353:	83 c4 10             	add    esp,0x10
 1002356:	eb 1a                	jmp    1002372 <printi+0x12a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:91
static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;
 1002358:	89 d3                	mov    ebx,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
 100235a:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:107

	while (u) {
 100235f:	85 d2                	test   edx,edx
 1002361:	0f 85 56 ff ff ff    	jne    10022bd <printi+0x75>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 1002367:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
 100236c:	8d 74 24 1f          	lea    esi,[esp+0x1f]
 1002370:	eb c9                	jmp    100233b <printi+0xf3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:127
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
}
 1002372:	83 c4 2c             	add    esp,0x2c
 1002375:	5b                   	pop    ebx
 1002376:	5e                   	pop    esi
 1002377:	5f                   	pop    edi
 1002378:	5d                   	pop    ebp
 1002379:	c3                   	ret    

0100237a <print>:
print():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:130

static int print(char **out, const char *format, va_list args )
{
 100237a:	55                   	push   ebp
 100237b:	57                   	push   edi
 100237c:	56                   	push   esi
 100237d:	53                   	push   ebx
 100237e:	83 ec 2c             	sub    esp,0x2c
 1002381:	89 c7                	mov    edi,eax
 1002383:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:135
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
 1002387:	0f b6 02             	movzx  eax,BYTE PTR [edx]
 100238a:	84 c0                	test   al,al
 100238c:	0f 84 b8 01 00 00    	je     100254a <print+0x1d0>
 1002392:	89 d5                	mov    ebp,edx
 1002394:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:136
		if (*format == '%') {
 1002399:	3c 25                	cmp    al,0x25
 100239b:	0f 85 88 01 00 00    	jne    1002529 <print+0x1af>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:137
			++format;
 10023a1:	8d 5d 01             	lea    ebx,[ebp+0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:139
			width = pad = 0;
			if (*format == '\0') break;
 10023a4:	0f b6 55 01          	movzx  edx,BYTE PTR [ebp+0x1]
 10023a8:	84 d2                	test   dl,dl
 10023aa:	0f 84 9f 01 00 00    	je     100254f <print+0x1d5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:140
			if (*format == '%') goto out;
 10023b0:	80 fa 25             	cmp    dl,0x25
 10023b3:	0f 84 6e 01 00 00    	je     1002527 <print+0x1ad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:138
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
			width = pad = 0;
 10023b9:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:141
			if (*format == '\0') break;
			if (*format == '%') goto out;
			if (*format == '-') {
 10023be:	80 fa 2d             	cmp    dl,0x2d
 10023c1:	75 08                	jne    10023cb <print+0x51>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:142
				++format;
 10023c3:	8d 5d 02             	lea    ebx,[ebp+0x2]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:143
				pad = PAD_RIGHT;
 10023c6:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:145
			}
			while (*format == '0') {
 10023cb:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
 10023ce:	75 0b                	jne    10023db <print+0x61>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:146
				++format;
 10023d0:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:147
				pad |= PAD_ZERO;
 10023d3:	83 c8 02             	or     eax,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:145
			if (*format == '%') goto out;
			if (*format == '-') {
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0') {
 10023d6:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
 10023d9:	74 f5                	je     10023d0 <print+0x56>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149 (discriminator 1)
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
 10023db:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
 10023de:	8d 4a d0             	lea    ecx,[edx-0x30]
 10023e1:	80 f9 09             	cmp    cl,0x9
 10023e4:	77 22                	ja     1002408 <print+0x8e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149
 10023e6:	b9 00 00 00 00       	mov    ecx,0x0
 10023eb:	89 c5                	mov    ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:150 (discriminator 2)
				width *= 10;
 10023ed:	8d 04 89             	lea    eax,[ecx+ecx*4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:151 (discriminator 2)
				width += *format - '0';
 10023f0:	0f be d2             	movsx  edx,dl
 10023f3:	8d 4c 42 d0          	lea    ecx,[edx+eax*2-0x30]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149 (discriminator 2)
			}
			while (*format == '0') {
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
 10023f7:	83 c3 01             	add    ebx,0x1
 10023fa:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
 10023fd:	8d 42 d0             	lea    eax,[edx-0x30]
 1002400:	3c 09                	cmp    al,0x9
 1002402:	76 e9                	jbe    10023ed <print+0x73>
 1002404:	89 e8                	mov    eax,ebp
 1002406:	eb 05                	jmp    100240d <print+0x93>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149
 1002408:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:153
				width *= 10;
				width += *format - '0';
			}
			if( *format == 's' ) {
 100240d:	80 fa 73             	cmp    dl,0x73
 1002410:	75 2c                	jne    100243e <print+0xc4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:154
				register char *s = (char *)va_arg( args, int );
 1002412:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 1002416:	8d 6a 04             	lea    ebp,[edx+0x4]
 1002419:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 100241d:	8b 12                	mov    edx,DWORD PTR [edx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:155
				pc += prints (out, s?s:"(null)", width, pad);
 100241f:	85 d2                	test   edx,edx
 1002421:	bd c8 78 00 01       	mov    ebp,0x10078c8
 1002426:	0f 44 d5             	cmove  edx,ebp
 1002429:	83 ec 0c             	sub    esp,0xc
 100242c:	50                   	push   eax
 100242d:	89 f8                	mov    eax,edi
 100242f:	e8 18 fd ff ff       	call   100214c <prints>
 1002434:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:156
				continue;
 1002436:	83 c4 10             	add    esp,0x10
 1002439:	e9 fb 00 00 00       	jmp    1002539 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:158
			}
			if( *format == 'd' ) {
 100243e:	80 fa 64             	cmp    dl,0x64
 1002441:	75 29                	jne    100246c <print+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:159
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
 1002443:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 1002447:	8d 6a 04             	lea    ebp,[edx+0x4]
 100244a:	6a 61                	push   0x61
 100244c:	50                   	push   eax
 100244d:	51                   	push   ecx
 100244e:	6a 01                	push   0x1
 1002450:	b9 0a 00 00 00       	mov    ecx,0xa
 1002455:	8b 12                	mov    edx,DWORD PTR [edx]
 1002457:	89 f8                	mov    eax,edi
 1002459:	e8 ea fd ff ff       	call   1002248 <printi>
 100245e:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:160
				continue;
 1002460:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:159
				register char *s = (char *)va_arg( args, int );
				pc += prints (out, s?s:"(null)", width, pad);
				continue;
			}
			if( *format == 'd' ) {
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
 1002463:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:160
				continue;
 1002467:	e9 cd 00 00 00       	jmp    1002539 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:162
			}
			if( *format == 'x' ) {
 100246c:	80 fa 78             	cmp    dl,0x78
 100246f:	75 2b                	jne    100249c <print+0x122>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:163
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
 1002471:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 1002475:	89 ea                	mov    edx,ebp
 1002477:	83 c5 04             	add    ebp,0x4
 100247a:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 100247e:	6a 61                	push   0x61
 1002480:	50                   	push   eax
 1002481:	51                   	push   ecx
 1002482:	6a 00                	push   0x0
 1002484:	b9 10 00 00 00       	mov    ecx,0x10
 1002489:	8b 12                	mov    edx,DWORD PTR [edx]
 100248b:	89 f8                	mov    eax,edi
 100248d:	e8 b6 fd ff ff       	call   1002248 <printi>
 1002492:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:164
				continue;
 1002494:	83 c4 10             	add    esp,0x10
 1002497:	e9 9d 00 00 00       	jmp    1002539 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:166
			}
			if( *format == 'X' ) {
 100249c:	80 fa 58             	cmp    dl,0x58
 100249f:	75 26                	jne    10024c7 <print+0x14d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:167
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
 10024a1:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 10024a5:	8d 6a 04             	lea    ebp,[edx+0x4]
 10024a8:	6a 41                	push   0x41
 10024aa:	50                   	push   eax
 10024ab:	51                   	push   ecx
 10024ac:	6a 00                	push   0x0
 10024ae:	b9 10 00 00 00       	mov    ecx,0x10
 10024b3:	8b 12                	mov    edx,DWORD PTR [edx]
 10024b5:	89 f8                	mov    eax,edi
 10024b7:	e8 8c fd ff ff       	call   1002248 <printi>
 10024bc:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:168
				continue;
 10024be:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:167
			if( *format == 'x' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
				continue;
			}
			if( *format == 'X' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
 10024c1:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:168
				continue;
 10024c5:	eb 72                	jmp    1002539 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:170
			}
			if( *format == 'u' ) {
 10024c7:	80 fa 75             	cmp    dl,0x75
 10024ca:	75 28                	jne    10024f4 <print+0x17a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:171
				pc += printi (out, va_arg( args, int ), 10, 0, width, pad, 'a');
 10024cc:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 10024d0:	89 ea                	mov    edx,ebp
 10024d2:	83 c5 04             	add    ebp,0x4
 10024d5:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 10024d9:	6a 61                	push   0x61
 10024db:	50                   	push   eax
 10024dc:	51                   	push   ecx
 10024dd:	6a 00                	push   0x0
 10024df:	b9 0a 00 00 00       	mov    ecx,0xa
 10024e4:	8b 12                	mov    edx,DWORD PTR [edx]
 10024e6:	89 f8                	mov    eax,edi
 10024e8:	e8 5b fd ff ff       	call   1002248 <printi>
 10024ed:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:172
				continue;
 10024ef:	83 c4 10             	add    esp,0x10
 10024f2:	eb 45                	jmp    1002539 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:174
			}
			if( *format == 'c' ) {
 10024f4:	80 fa 63             	cmp    dl,0x63
 10024f7:	75 40                	jne    1002539 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:176
				/* char are converted to int then pushed on the stack */
				scr[0] = (char)va_arg( args, int );
 10024f9:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 10024fd:	89 ea                	mov    edx,ebp
 10024ff:	83 c5 04             	add    ebp,0x4
 1002502:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 1002506:	8b 12                	mov    edx,DWORD PTR [edx]
 1002508:	88 54 24 1e          	mov    BYTE PTR [esp+0x1e],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:177
				scr[1] = '\0';
 100250c:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:178
				pc += prints (out, scr, width, pad);
 1002511:	83 ec 0c             	sub    esp,0xc
 1002514:	50                   	push   eax
 1002515:	8d 54 24 2e          	lea    edx,[esp+0x2e]
 1002519:	89 f8                	mov    eax,edi
 100251b:	e8 2c fc ff ff       	call   100214c <prints>
 1002520:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:179
				continue;
 1002522:	83 c4 10             	add    esp,0x10
 1002525:	eb 12                	jmp    1002539 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:137
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
 1002527:	89 dd                	mov    ebp,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:184
				continue;
			}
		}
		else {
		out:
			printchar (out, *format);
 1002529:	0f be 55 00          	movsx  edx,BYTE PTR [ebp+0x0]
 100252d:	89 f8                	mov    eax,edi
 100252f:	e8 fc fb ff ff       	call   1002130 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:185
			++pc;
 1002534:	83 c6 01             	add    esi,0x1
 1002537:	89 eb                	mov    ebx,ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:135
{
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
 1002539:	8d 6b 01             	lea    ebp,[ebx+0x1]
 100253c:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
 1002540:	84 c0                	test   al,al
 1002542:	0f 85 51 fe ff ff    	jne    1002399 <print+0x1f>
 1002548:	eb 05                	jmp    100254f <print+0x1d5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:132
}

static int print(char **out, const char *format, va_list args )
{
	register int width, pad;
	register int pc = 0;
 100254a:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:188
		out:
			printchar (out, *format);
			++pc;
		}
	}
	if (out) **out = '\0';
 100254f:	85 ff                	test   edi,edi
 1002551:	74 05                	je     1002558 <print+0x1de>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:188 (discriminator 1)
 1002553:	8b 07                	mov    eax,DWORD PTR [edi]
 1002555:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:191
	va_end( args );
	return pc;
}
 1002558:	89 f0                	mov    eax,esi
 100255a:	83 c4 2c             	add    esp,0x2c
 100255d:	5b                   	pop    ebx
 100255e:	5e                   	pop    esi
 100255f:	5f                   	pop    edi
 1002560:	5d                   	pop    ebp
 1002561:	c3                   	ret    

01002562 <printk_valist>:
printk_valist():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:194

int printk_valist(const char *format, va_list args)
{
 1002562:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:195
    return print(0, format, args);
 1002565:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
 1002569:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 100256d:	b8 00 00 00 00       	mov    eax,0x0
 1002572:	e8 03 fe ff ff       	call   100237a <print>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:196
}
 1002577:	83 c4 0c             	add    esp,0xc
 100257a:	c3                   	ret    

0100257b <printk>:
printk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:199

int printk(const char *format, ...)
{
 100257b:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:201
        va_list args;
        va_start( args, format );
 100257e:	8d 44 24 14          	lea    eax,[esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:202
        return printk_valist(format, args);
 1002582:	83 ec 08             	sub    esp,0x8
 1002585:	50                   	push   eax
 1002586:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100258a:	e8 d3 ff ff ff       	call   1002562 <printk_valist>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:203
}
 100258f:	83 c4 1c             	add    esp,0x1c
 1002592:	c3                   	ret    

01002593 <printd>:
printd():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:209

#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
 1002593:	83 ec 0c             	sub    esp,0xc
 1002596:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:210
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
 100259a:	89 d1                	mov    ecx,edx
 100259c:	23 0d 38 03 12 00    	and    ecx,DWORD PTR ds:0x120338
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:222
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
    }
    return 0;
 10025a2:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:210
#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
 10025a7:	39 ca                	cmp    edx,ecx
 10025a9:	75 14                	jne    10025bf <printd+0x2c>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:214
    {
        va_list args;

        va_start( args, format );
 10025ab:	8d 44 24 18          	lea    eax,[esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:220
//        if (++printDLineCount==SYS_VGA_HEIGHT-1)
//        {
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
 10025af:	83 ec 08             	sub    esp,0x8
 10025b2:	50                   	push   eax
 10025b3:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 10025b7:	e8 a6 ff ff ff       	call   1002562 <printk_valist>
 10025bc:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:223 (discriminator 1)
    }
    return 0;
}
 10025bf:	83 c4 0c             	add    esp,0xc
 10025c2:	c3                   	ret    

010025c3 <sprintf>:
sprintf():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:227
#endif

int sprintf(char *out, const char *format, ...)
{
 10025c3:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:231
        va_list args;
        
        va_start( args, format );
        return print( &out, format, args );
 10025c6:	8d 4c 24 18          	lea    ecx,[esp+0x18]
 10025ca:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
 10025ce:	8d 44 24 10          	lea    eax,[esp+0x10]
 10025d2:	e8 a3 fd ff ff       	call   100237a <print>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:232
}
 10025d7:	83 c4 0c             	add    esp,0xc
 10025da:	c3                   	ret    
 10025db:	90                   	nop

010025dc <strcpy>:
strcpy():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:5
#include "strings.h"

char *
strcpy(char *s1, const char *s2)
{
 10025dc:	53                   	push   ebx
 10025dd:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10025e1:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:6
    char *s = s1;
 10025e5:	89 c2                	mov    edx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:7 (discriminator 1)
    while ((*s++ = *s2++) != 0)
 10025e7:	83 c2 01             	add    edx,0x1
 10025ea:	83 c1 01             	add    ecx,0x1
 10025ed:	0f b6 59 ff          	movzx  ebx,BYTE PTR [ecx-0x1]
 10025f1:	88 5a ff             	mov    BYTE PTR [edx-0x1],bl
 10025f4:	84 db                	test   bl,bl
 10025f6:	75 ef                	jne    10025e7 <strcpy+0xb>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:10
	;
    return (s1);
}
 10025f8:	5b                   	pop    ebx
 10025f9:	c3                   	ret    

010025fa <strcpyc>:
strcpyc():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:14

char *
strcpyc(char *s1, const char *s2, unsigned count)
{
 10025fa:	56                   	push   esi
 10025fb:	53                   	push   ebx
 10025fc:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1002600:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16
    char *s = s1;
    while ((*s++ = *s2++) != 0 && count-->0)
 1002604:	ba 00 00 00 00       	mov    edx,0x0
 1002609:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 100260d:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16 (discriminator 2)
 1002610:	0f b6 0c 16          	movzx  ecx,BYTE PTR [esi+edx*1]
 1002614:	88 0c 10             	mov    BYTE PTR [eax+edx*1],cl
 1002617:	84 c9                	test   cl,cl
 1002619:	74 07                	je     1002622 <strcpyc+0x28>
 100261b:	83 c2 01             	add    edx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16 (discriminator 1)
 100261e:	39 d3                	cmp    ebx,edx
 1002620:	75 ee                	jne    1002610 <strcpyc+0x16>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:19
	;
    return (s1);
}
 1002622:	5b                   	pop    ebx
 1002623:	5e                   	pop    esi
 1002624:	c3                   	ret    
 1002625:	66 90                	xchg   ax,ax
 1002627:	90                   	nop

01002628 <strlen>:
strlen():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:3
#include <stddef.h>

size_t strlen(const char* str) {
 1002628:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:5
          size_t ret = 0;
        while ( str[ret] != 0 )
 100262c:	80 3a 00             	cmp    BYTE PTR [edx],0x0
 100262f:	74 10                	je     1002641 <strlen+0x19>
 1002631:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:6
                ret++;
 1002636:	83 c0 01             	add    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:5
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
 1002639:	80 3c 02 00          	cmp    BYTE PTR [edx+eax*1],0x0
 100263d:	75 f7                	jne    1002636 <strlen+0xe>
 100263f:	f3 c3                	repz ret 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:4
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
 1002641:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:8
        while ( str[ret] != 0 )
                ret++;
        return ret;
}
 1002646:	c3                   	ret    
 1002647:	90                   	nop

01002648 <strncmp>:
strncmp():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:13
 *   array pointed to by `s2'.  [4.11.4.4]
 */
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
 1002648:	57                   	push   edi
 1002649:	56                   	push   esi
 100264a:	53                   	push   ebx
 100264b:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 100264f:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
 1002653:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:14
    for ( ; n > 0; s1++, s2++, --n)
 1002657:	85 db                	test   ebx,ebx
 1002659:	74 41                	je     100269c <strncmp+0x54>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:15
	if (*s1 != *s2)
 100265b:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 100265e:	0f b6 0f             	movzx  ecx,BYTE PTR [edi]
 1002661:	38 ca                	cmp    dl,cl
 1002663:	75 1c                	jne    1002681 <strncmp+0x39>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:17
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
 1002665:	84 d2                	test   dl,dl
 1002667:	74 3a                	je     10026a3 <strncmp+0x5b>
 1002669:	83 eb 01             	sub    ebx,0x1
 100266c:	b8 00 00 00 00       	mov    eax,0x0
 1002671:	eb 1e                	jmp    1002691 <strncmp+0x49>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:15
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
	if (*s1 != *s2)
 1002673:	0f b6 54 06 01       	movzx  edx,BYTE PTR [esi+eax*1+0x1]
 1002678:	0f b6 4c 07 01       	movzx  ecx,BYTE PTR [edi+eax*1+0x1]
 100267d:	38 ca                	cmp    dl,cl
 100267f:	74 09                	je     100268a <strncmp+0x42>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:16
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
 1002681:	38 ca                	cmp    dl,cl
 1002683:	19 c0                	sbb    eax,eax
 1002685:	83 c8 01             	or     eax,0x1
 1002688:	eb 25                	jmp    10026af <strncmp+0x67>
 100268a:	83 c0 01             	add    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:17
	else if (*s1 == '\0')
 100268d:	84 d2                	test   dl,dl
 100268f:	74 19                	je     10026aa <strncmp+0x62>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:14
 */
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
 1002691:	39 d8                	cmp    eax,ebx
 1002693:	75 de                	jne    1002673 <strncmp+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:19
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
    return 0;
 1002695:	b8 00 00 00 00       	mov    eax,0x0
 100269a:	eb 13                	jmp    10026af <strncmp+0x67>
 100269c:	b8 00 00 00 00       	mov    eax,0x0
 10026a1:	eb 0c                	jmp    10026af <strncmp+0x67>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:18
{
    for ( ; n > 0; s1++, s2++, --n)
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
 10026a3:	b8 00 00 00 00       	mov    eax,0x0
 10026a8:	eb 05                	jmp    10026af <strncmp+0x67>
 10026aa:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:20
    return 0;
}
 10026af:	5b                   	pop    ebx
 10026b0:	5e                   	pop    esi
 10026b1:	5f                   	pop    edi
 10026b2:	c3                   	ret    
 10026b3:	90                   	nop

010026b4 <strncpy>:
strncpy():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:14
 *   The `strncpy' function returns the value of `s1'.  [4.11.2.4]
 */
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
 10026b4:	56                   	push   esi
 10026b5:	53                   	push   ebx
 10026b6:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
 10026ba:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10026be:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
 10026c2:	85 c9                	test   ecx,ecx
 10026c4:	74 33                	je     10026f9 <strncpy+0x45>
 10026c6:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 10026c9:	84 c0                	test   al,al
 10026cb:	74 26                	je     10026f3 <strncpy+0x3f>
 10026cd:	89 f2                	mov    edx,esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:17
	*s++ = *s2++;
 10026cf:	83 c2 01             	add    edx,0x1
 10026d2:	83 c3 01             	add    ebx,0x1
 10026d5:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
 10026d8:	83 e9 01             	sub    ecx,0x1
 10026db:	74 1c                	je     10026f9 <strncpy+0x45>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16 (discriminator 1)
 10026dd:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 10026e0:	84 c0                	test   al,al
 10026e2:	75 eb                	jne    10026cf <strncpy+0x1b>
 10026e4:	eb 0f                	jmp    10026f5 <strncpy+0x41>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:21
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
	*s++ = '\0';
 10026e6:	83 c2 01             	add    edx,0x1
 10026e9:	c6 42 ff 00          	mov    BYTE PTR [edx-0x1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:20
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
 10026ed:	39 d1                	cmp    ecx,edx
 10026ef:	75 f5                	jne    10026e6 <strncpy+0x32>
 10026f1:	eb 06                	jmp    10026f9 <strncpy+0x45>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:15
 */
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
 10026f3:	89 f2                	mov    edx,esi
 10026f5:	01 d1                	add    ecx,edx
 10026f7:	eb ed                	jmp    10026e6 <strncpy+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:25
    while (n > 0) {
	*s++ = '\0';
	--n;
    }
    return s1;
}
 10026f9:	89 f0                	mov    eax,esi
 10026fb:	5b                   	pop    ebx
 10026fc:	5e                   	pop    esi
 10026fd:	c3                   	ret    
 10026fe:	66 90                	xchg   ax,ax

01002700 <strleft>:
strleft():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strparts.c:2
char* strleft(char* val, int cnt)
{
 1002700:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strparts.c:3
    val[cnt]='\0';
 1002704:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 1002708:	c6 04 10 00          	mov    BYTE PTR [eax+edx*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strparts.c:5
    return val;
}
 100270c:	c3                   	ret    
 100270d:	66 90                	xchg   ax,ax
 100270f:	90                   	nop

01002710 <time>:
time():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:84
};

extern time_t kSystemCurrentTime;
time_t time(time_t* arg)
{
    *arg = kSystemCurrentTime;
 1002710:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1002714:	8b 15 8c 02 12 00    	mov    edx,DWORD PTR ds:0x12028c
 100271a:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:86
    return kSystemCurrentTime;
}
 100271c:	a1 8c 02 12 00       	mov    eax,ds:0x12028c
 1002721:	c3                   	ret    

01002722 <gmtime_r>:
gmtime_r():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:88

struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
 1002722:	55                   	push   ebp
 1002723:	57                   	push   edi
 1002724:	56                   	push   esi
 1002725:	53                   	push   ebx
 1002726:	83 ec 08             	sub    esp,0x8
 1002729:	8b 74 24 20          	mov    esi,DWORD PTR [esp+0x20]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:93
  time_t time = *timer;
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;

  dayclock = (unsigned long) time % SECS_DAY;
 100272d:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1002731:	8b 18                	mov    ebx,DWORD PTR [eax]
 1002733:	ba 07 45 2e c2       	mov    edx,0xc22e4507
 1002738:	89 d8                	mov    eax,ebx
 100273a:	f7 e2                	mul    edx
 100273c:	89 d1                	mov    ecx,edx
 100273e:	c1 e9 10             	shr    ecx,0x10
 1002741:	69 c9 80 51 01 00    	imul   ecx,ecx,0x15180
 1002747:	29 cb                	sub    ebx,ecx
 1002749:	89 d9                	mov    ecx,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:94
  dayno = (unsigned long) time / SECS_DAY;
 100274b:	89 d3                	mov    ebx,edx
 100274d:	c1 eb 10             	shr    ebx,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:96

  tmbuf->tm_sec = dayclock % 60;
 1002750:	bd 89 88 88 88       	mov    ebp,0x88888889
 1002755:	89 c8                	mov    eax,ecx
 1002757:	f7 e5                	mul    ebp
 1002759:	c1 ea 05             	shr    edx,0x5
 100275c:	6b d2 3c             	imul   edx,edx,0x3c
 100275f:	89 c8                	mov    eax,ecx
 1002761:	29 d0                	sub    eax,edx
 1002763:	89 06                	mov    DWORD PTR [esi],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:97
  tmbuf->tm_min = (dayclock % 3600) / 60;
 1002765:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
 100276a:	89 c8                	mov    eax,ecx
 100276c:	f7 e2                	mul    edx
 100276e:	89 d7                	mov    edi,edx
 1002770:	c1 ef 0b             	shr    edi,0xb
 1002773:	69 c7 10 0e 00 00    	imul   eax,edi,0xe10
 1002779:	29 c1                	sub    ecx,eax
 100277b:	89 c8                	mov    eax,ecx
 100277d:	f7 e5                	mul    ebp
 100277f:	89 d1                	mov    ecx,edx
 1002781:	c1 e9 05             	shr    ecx,0x5
 1002784:	89 4e 04             	mov    DWORD PTR [esi+0x4],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:98
  tmbuf->tm_hour = dayclock / 3600;
 1002787:	89 7e 08             	mov    DWORD PTR [esi+0x8],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:99
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
 100278a:	8d 4b 04             	lea    ecx,[ebx+0x4]
 100278d:	ba 25 49 92 24       	mov    edx,0x24924925
 1002792:	89 c8                	mov    eax,ecx
 1002794:	f7 e2                	mul    edx
 1002796:	89 c8                	mov    eax,ecx
 1002798:	29 d0                	sub    eax,edx
 100279a:	d1 e8                	shr    eax,1
 100279c:	01 c2                	add    edx,eax
 100279e:	c1 ea 02             	shr    edx,0x2
 10027a1:	8d 04 d5 00 00 00 00 	lea    eax,[edx*8+0x0]
 10027a8:	29 d0                	sub    eax,edx
 10027aa:	29 c1                	sub    ecx,eax
 10027ac:	89 4e 18             	mov    DWORD PTR [esi+0x18],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:91
}

struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
  time_t time = *timer;
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;
 10027af:	b9 b2 07 00 00       	mov    ecx,0x7b2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 10027b4:	bd 1f 85 eb 51       	mov    ebp,0x51eb851f
 10027b9:	eb 53                	jmp    100280e <gmtime_r+0xec>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 1)
    dayno -= YEARSIZE(year);
 10027bb:	89 c8                	mov    eax,ecx
 10027bd:	f7 ed                	imul   ebp
 10027bf:	c1 fa 05             	sar    edx,0x5
 10027c2:	89 c8                	mov    eax,ecx
 10027c4:	c1 f8 1f             	sar    eax,0x1f
 10027c7:	29 c2                	sub    edx,eax
 10027c9:	6b d2 64             	imul   edx,edx,0x64
 10027cc:	39 d1                	cmp    ecx,edx
 10027ce:	75 26                	jne    10027f6 <gmtime_r+0xd4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 4)
 10027d0:	89 c8                	mov    eax,ecx
 10027d2:	f7 ed                	imul   ebp
 10027d4:	c1 fa 07             	sar    edx,0x7
 10027d7:	89 c8                	mov    eax,ecx
 10027d9:	c1 f8 1f             	sar    eax,0x1f
 10027dc:	29 c2                	sub    edx,eax
 10027de:	69 c2 90 01 00 00    	imul   eax,edx,0x190
 10027e4:	89 cf                	mov    edi,ecx
 10027e6:	29 c7                	sub    edi,eax
 10027e8:	83 ff 01             	cmp    edi,0x1
 10027eb:	19 c0                	sbb    eax,eax
 10027ed:	f7 d0                	not    eax
 10027ef:	05 6e 01 00 00       	add    eax,0x16e
 10027f4:	eb 13                	jmp    1002809 <gmtime_r+0xe7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101
 10027f6:	b8 6e 01 00 00       	mov    eax,0x16e
 10027fb:	eb 0c                	jmp    1002809 <gmtime_r+0xe7>
 10027fd:	b8 6d 01 00 00       	mov    eax,0x16d
 1002802:	eb 05                	jmp    1002809 <gmtime_r+0xe7>
 1002804:	b8 6e 01 00 00       	mov    eax,0x16e
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 8)
 1002809:	29 c3                	sub    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:102 (discriminator 8)
    year++;
 100280b:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 100280e:	89 cf                	mov    edi,ecx
 1002810:	83 e7 03             	and    edi,0x3
 1002813:	0f 85 d5 00 00 00    	jne    10028ee <gmtime_r+0x1cc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100 (discriminator 1)
 1002819:	89 c8                	mov    eax,ecx
 100281b:	f7 ed                	imul   ebp
 100281d:	c1 fa 05             	sar    edx,0x5
 1002820:	89 c8                	mov    eax,ecx
 1002822:	c1 f8 1f             	sar    eax,0x1f
 1002825:	29 c2                	sub    edx,eax
 1002827:	6b d2 64             	imul   edx,edx,0x64
 100282a:	39 d1                	cmp    ecx,edx
 100282c:	0f 85 0a 01 00 00    	jne    100293c <gmtime_r+0x21a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100 (discriminator 4)
 1002832:	89 c8                	mov    eax,ecx
 1002834:	f7 ed                	imul   ebp
 1002836:	c1 fa 07             	sar    edx,0x7
 1002839:	89 c8                	mov    eax,ecx
 100283b:	c1 f8 1f             	sar    eax,0x1f
 100283e:	29 c2                	sub    edx,eax
 1002840:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002846:	39 d1                	cmp    ecx,edx
 1002848:	0f 84 03 01 00 00    	je     1002951 <gmtime_r+0x22f>
 100284e:	e9 b0 00 00 00       	jmp    1002903 <gmtime_r+0x1e1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:104
    dayno -= YEARSIZE(year);
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
 1002853:	8d 81 94 f8 ff ff    	lea    eax,[ecx-0x76c]
 1002859:	89 46 14             	mov    DWORD PTR [esi+0x14],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:105
  tmbuf->tm_yday = dayno;
 100285c:	89 5e 1c             	mov    DWORD PTR [esi+0x1c],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:106
  tmbuf->tm_mon = 0;
 100285f:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
 1002866:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
 100286b:	89 c8                	mov    eax,ecx
 100286d:	f7 ea                	imul   edx
 100286f:	89 d5                	mov    ebp,edx
 1002871:	c1 fd 05             	sar    ebp,0x5
 1002874:	89 c8                	mov    eax,ecx
 1002876:	c1 f8 1f             	sar    eax,0x1f
 1002879:	29 c5                	sub    ebp,eax
 100287b:	6b ed 64             	imul   ebp,ebp,0x64
 100287e:	89 cf                	mov    edi,ecx
 1002880:	29 ef                	sub    edi,ebp
 1002882:	89 fd                	mov    ebp,edi
 1002884:	c1 fa 07             	sar    edx,0x7
 1002887:	29 c2                	sub    edx,eax
 1002889:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 100288f:	29 d1                	sub    ecx,edx
 1002891:	89 0c 24             	mov    DWORD PTR [esp],ecx
 1002894:	8b 7c 24 04          	mov    edi,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 1002898:	eb 40                	jmp    10028da <gmtime_r+0x1b8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 1)
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
 100289a:	85 ed                	test   ebp,ebp
 100289c:	75 0d                	jne    10028ab <gmtime_r+0x189>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 4)
 100289e:	83 3c 24 00          	cmp    DWORD PTR [esp],0x0
 10028a2:	74 0e                	je     10028b2 <gmtime_r+0x190>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 6)
 10028a4:	ba 00 00 00 00       	mov    edx,0x0
 10028a9:	eb 1a                	jmp    10028c5 <gmtime_r+0x1a3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108
 10028ab:	ba 01 00 00 00       	mov    edx,0x1
 10028b0:	eb 13                	jmp    10028c5 <gmtime_r+0x1a3>
 10028b2:	ba 01 00 00 00       	mov    edx,0x1
 10028b7:	eb 0c                	jmp    10028c5 <gmtime_r+0x1a3>
 10028b9:	ba 01 00 00 00       	mov    edx,0x1
 10028be:	eb 05                	jmp    10028c5 <gmtime_r+0x1a3>
 10028c0:	ba 01 00 00 00       	mov    edx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 8)
 10028c5:	8d 0c 12             	lea    ecx,[edx+edx*1]
 10028c8:	01 ca                	add    edx,ecx
 10028ca:	8d 14 90             	lea    edx,[eax+edx*4]
 10028cd:	2b 1c 95 00 50 00 01 	sub    ebx,DWORD PTR [edx*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:109 (discriminator 8)
    tmbuf->tm_mon++;
 10028d4:	83 c0 01             	add    eax,0x1
 10028d7:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 10028da:	85 ff                	test   edi,edi
 10028dc:	75 4c                	jne    100292a <gmtime_r+0x208>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107 (discriminator 1)
 10028de:	85 ed                	test   ebp,ebp
 10028e0:	0f 85 92 00 00 00    	jne    1002978 <gmtime_r+0x256>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107 (discriminator 4)
 10028e6:	83 3c 24 00          	cmp    DWORD PTR [esp],0x0
 10028ea:	74 7a                	je     1002966 <gmtime_r+0x244>
 10028ec:	eb 2a                	jmp    1002918 <gmtime_r+0x1f6>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 10028ee:	81 fb 6c 01 00 00    	cmp    ebx,0x16c
 10028f4:	0f 87 03 ff ff ff    	ja     10027fd <gmtime_r+0xdb>
 10028fa:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 10028fe:	e9 50 ff ff ff       	jmp    1002853 <gmtime_r+0x131>
 1002903:	81 fb 6c 01 00 00    	cmp    ebx,0x16c
 1002909:	0f 87 ac fe ff ff    	ja     10027bb <gmtime_r+0x99>
 100290f:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 1002913:	e9 3b ff ff ff       	jmp    1002853 <gmtime_r+0x131>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 1002918:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 100291b:	3b 1c 85 00 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005000]
 1002922:	0f 83 72 ff ff ff    	jae    100289a <gmtime_r+0x178>
 1002928:	eb 5e                	jmp    1002988 <gmtime_r+0x266>
 100292a:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 100292d:	3b 1c 85 00 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005000]
 1002934:	0f 83 6a ff ff ff    	jae    10028a4 <gmtime_r+0x182>
 100293a:	eb 4c                	jmp    1002988 <gmtime_r+0x266>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 100293c:	81 fb 6d 01 00 00    	cmp    ebx,0x16d
 1002942:	0f 87 bc fe ff ff    	ja     1002804 <gmtime_r+0xe2>
 1002948:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 100294c:	e9 02 ff ff ff       	jmp    1002853 <gmtime_r+0x131>
 1002951:	81 fb 6d 01 00 00    	cmp    ebx,0x16d
 1002957:	0f 87 73 fe ff ff    	ja     10027d0 <gmtime_r+0xae>
 100295d:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 1002961:	e9 ed fe ff ff       	jmp    1002853 <gmtime_r+0x131>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 1002966:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 1002969:	3b 1c 85 30 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005030]
 1002970:	0f 83 43 ff ff ff    	jae    10028b9 <gmtime_r+0x197>
 1002976:	eb 10                	jmp    1002988 <gmtime_r+0x266>
 1002978:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 100297b:	3b 1c 85 30 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005030]
 1002982:	0f 83 38 ff ff ff    	jae    10028c0 <gmtime_r+0x19e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:111
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
    tmbuf->tm_mon++;
  }
  tmbuf->tm_mday = dayno + 1;
 1002988:	83 c3 01             	add    ebx,0x1
 100298b:	89 5e 0c             	mov    DWORD PTR [esi+0xc],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:112
  tmbuf->tm_isdst = 0;
 100298e:	c7 46 20 00 00 00 00 	mov    DWORD PTR [esi+0x20],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:114
  return tmbuf;
}
 1002995:	89 f0                	mov    eax,esi
 1002997:	83 c4 08             	add    esp,0x8
 100299a:	5b                   	pop    ebx
 100299b:	5e                   	pop    esi
 100299c:	5f                   	pop    edi
 100299d:	5d                   	pop    ebp
 100299e:	c3                   	ret    

0100299f <localtime>:
localtime():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:116

struct tm *localtime(const time_t *timer) {
 100299f:	83 ec 30             	sub    esp,0x30
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:120
  time_t t;
  struct tm tmbuf;
  
  t = *timer - kTimeZone;
 10029a2:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
 10029a6:	8b 00                	mov    eax,DWORD PTR [eax]
 10029a8:	2b 05 90 02 12 00    	sub    eax,DWORD PTR ds:0x120290
 10029ae:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:121
  return gmtime_r(&t, &tmbuf);
 10029b2:	54                   	push   esp
 10029b3:	8d 44 24 30          	lea    eax,[esp+0x30]
 10029b7:	50                   	push   eax
 10029b8:	e8 65 fd ff ff       	call   1002722 <gmtime_r>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:122
}
 10029bd:	83 c4 38             	add    esp,0x38
 10029c0:	c3                   	ret    

010029c1 <localtime_r>:
localtime_r():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:124

struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
 10029c1:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:127
  time_t t;

  t = *timer - kTimeZone;
 10029c4:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
 10029c8:	8b 00                	mov    eax,DWORD PTR [eax]
 10029ca:	2b 05 90 02 12 00    	sub    eax,DWORD PTR ds:0x120290
 10029d0:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:128
  return gmtime_r(&t, tmbuf);
 10029d4:	ff 74 24 18          	push   DWORD PTR [esp+0x18]
 10029d8:	8d 44 24 10          	lea    eax,[esp+0x10]
 10029dc:	50                   	push   eax
 10029dd:	e8 40 fd ff ff       	call   1002722 <gmtime_r>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:129
}
 10029e2:	83 c4 18             	add    esp,0x18
 10029e5:	c3                   	ret    

010029e6 <mktime>:
mktime():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:131

time_t mktime(struct tm *tmbuf) {
 10029e6:	55                   	push   ebp
 10029e7:	57                   	push   edi
 10029e8:	56                   	push   esi
 10029e9:	53                   	push   ebx
 10029ea:	83 ec 20             	sub    esp,0x20
 10029ed:	8b 5c 24 34          	mov    ebx,DWORD PTR [esp+0x34]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:139
  int yday, month;
  /*unsigned*/ long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
 10029f1:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 10029f3:	ba 89 88 88 88       	mov    edx,0x88888889
 10029f8:	89 c8                	mov    eax,ecx
 10029fa:	f7 ea                	imul   edx
 10029fc:	8d 04 0a             	lea    eax,[edx+ecx*1]
 10029ff:	c1 f8 05             	sar    eax,0x5
 1002a02:	89 ca                	mov    edx,ecx
 1002a04:	c1 fa 1f             	sar    edx,0x1f
 1002a07:	29 d0                	sub    eax,edx
 1002a09:	89 c2                	mov    edx,eax
 1002a0b:	03 53 04             	add    edx,DWORD PTR [ebx+0x4]
 1002a0e:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:140
  tmbuf->tm_sec %= 60;
 1002a11:	6b c0 3c             	imul   eax,eax,0x3c
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:141
  if (tmbuf->tm_sec < 0) {
 1002a14:	29 c1                	sub    ecx,eax
 1002a16:	78 04                	js     1002a1c <mktime+0x36>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:140
  /*unsigned*/ long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
  tmbuf->tm_sec %= 60;
 1002a18:	89 0b                	mov    DWORD PTR [ebx],ecx
 1002a1a:	eb 0b                	jmp    1002a27 <mktime+0x41>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:142
  if (tmbuf->tm_sec < 0) {
    tmbuf->tm_sec += 60;
 1002a1c:	83 c1 3c             	add    ecx,0x3c
 1002a1f:	89 0b                	mov    DWORD PTR [ebx],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:143
    tmbuf->tm_min--;
 1002a21:	83 ea 01             	sub    edx,0x1
 1002a24:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:145
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
 1002a27:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
 1002a2a:	ba 89 88 88 88       	mov    edx,0x88888889
 1002a2f:	89 c8                	mov    eax,ecx
 1002a31:	f7 ea                	imul   edx
 1002a33:	8d 04 0a             	lea    eax,[edx+ecx*1]
 1002a36:	c1 f8 05             	sar    eax,0x5
 1002a39:	89 ca                	mov    edx,ecx
 1002a3b:	c1 fa 1f             	sar    edx,0x1f
 1002a3e:	29 d0                	sub    eax,edx
 1002a40:	89 c2                	mov    edx,eax
 1002a42:	03 53 08             	add    edx,DWORD PTR [ebx+0x8]
 1002a45:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:146
  tmbuf->tm_min = tmbuf->tm_min % 60;
 1002a48:	6b c0 3c             	imul   eax,eax,0x3c
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:147
  if (tmbuf->tm_min < 0) {
 1002a4b:	29 c1                	sub    ecx,eax
 1002a4d:	78 05                	js     1002a54 <mktime+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:146
  if (tmbuf->tm_sec < 0) {
    tmbuf->tm_sec += 60;
    tmbuf->tm_min--;
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
  tmbuf->tm_min = tmbuf->tm_min % 60;
 1002a4f:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
 1002a52:	eb 0c                	jmp    1002a60 <mktime+0x7a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:148
  if (tmbuf->tm_min < 0) {
    tmbuf->tm_min += 60;
 1002a54:	83 c1 3c             	add    ecx,0x3c
 1002a57:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:149
    tmbuf->tm_hour--;
 1002a5a:	83 ea 01             	sub    edx,0x1
 1002a5d:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:151
  }
  day = tmbuf->tm_hour / 24;
 1002a60:	8b 73 08             	mov    esi,DWORD PTR [ebx+0x8]
 1002a63:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
 1002a68:	89 f0                	mov    eax,esi
 1002a6a:	f7 ea                	imul   edx
 1002a6c:	c1 fa 02             	sar    edx,0x2
 1002a6f:	89 f0                	mov    eax,esi
 1002a71:	c1 f8 1f             	sar    eax,0x1f
 1002a74:	89 d1                	mov    ecx,edx
 1002a76:	29 c1                	sub    ecx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:152
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
 1002a78:	8d 04 49             	lea    eax,[ecx+ecx*2]
 1002a7b:	c1 e0 03             	shl    eax,0x3
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:153
  if (tmbuf->tm_hour < 0) {
 1002a7e:	29 c6                	sub    esi,eax
 1002a80:	78 05                	js     1002a87 <mktime+0xa1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:152
  if (tmbuf->tm_min < 0) {
    tmbuf->tm_min += 60;
    tmbuf->tm_hour--;
  }
  day = tmbuf->tm_hour / 24;
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
 1002a82:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
 1002a85:	eb 09                	jmp    1002a90 <mktime+0xaa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:154
  if (tmbuf->tm_hour < 0) {
    tmbuf->tm_hour += 24;
 1002a87:	83 c6 18             	add    esi,0x18
 1002a8a:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:155
    day--;
 1002a8d:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:157
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
 1002a90:	8b 73 10             	mov    esi,DWORD PTR [ebx+0x10]
 1002a93:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
 1002a98:	89 f0                	mov    eax,esi
 1002a9a:	f7 ea                	imul   edx
 1002a9c:	d1 fa                	sar    edx,1
 1002a9e:	89 f0                	mov    eax,esi
 1002aa0:	c1 f8 1f             	sar    eax,0x1f
 1002aa3:	29 c2                	sub    edx,eax
 1002aa5:	89 d0                	mov    eax,edx
 1002aa7:	03 43 14             	add    eax,DWORD PTR [ebx+0x14]
 1002aaa:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:158
  tmbuf->tm_mon %= 12;
 1002aad:	8d 14 52             	lea    edx,[edx+edx*2]
 1002ab0:	c1 e2 02             	shl    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:159
  if (tmbuf->tm_mon < 0) {
 1002ab3:	29 d6                	sub    esi,edx
 1002ab5:	78 05                	js     1002abc <mktime+0xd6>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:158
  if (tmbuf->tm_hour < 0) {
    tmbuf->tm_hour += 24;
    day--;
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
  tmbuf->tm_mon %= 12;
 1002ab7:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
 1002aba:	eb 0c                	jmp    1002ac8 <mktime+0xe2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:160
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
 1002abc:	83 c6 0c             	add    esi,0xc
 1002abf:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:161
    tmbuf->tm_year--;
 1002ac2:	83 e8 01             	sub    eax,0x1
 1002ac5:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:163
  }
  day += (tmbuf->tm_mday - 1);
 1002ac8:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
 1002acb:	8d 6c 01 ff          	lea    ebp,[ecx+eax*1-0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:164
  while (day < 0) {
 1002acf:	85 ed                	test   ebp,ebp
 1002ad1:	0f 89 f1 00 00 00    	jns    1002bc8 <mktime+0x1e2>
 1002ad7:	8b 73 10             	mov    esi,DWORD PTR [ebx+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169
    if(--tmbuf->tm_mon < 0) {
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002ada:	bf 1f 85 eb 51       	mov    edi,0x51eb851f
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:165
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
    if(--tmbuf->tm_mon < 0) {
 1002adf:	83 ee 01             	sub    esi,0x1
 1002ae2:	79 09                	jns    1002aed <mktime+0x107>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:166
      tmbuf->tm_year--;
 1002ae4:	83 6b 14 01          	sub    DWORD PTR [ebx+0x14],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:167
      tmbuf->tm_mon = 11;
 1002ae8:	be 0b 00 00 00       	mov    esi,0xb
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002aed:	8b 4b 14             	mov    ecx,DWORD PTR [ebx+0x14]
 1002af0:	b8 00 00 00 00       	mov    eax,0x0
 1002af5:	f6 c1 03             	test   cl,0x3
 1002af8:	75 3c                	jne    1002b36 <mktime+0x150>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 1)
 1002afa:	81 c1 6c 07 00 00    	add    ecx,0x76c
 1002b00:	89 c8                	mov    eax,ecx
 1002b02:	f7 ef                	imul   edi
 1002b04:	c1 fa 05             	sar    edx,0x5
 1002b07:	89 c8                	mov    eax,ecx
 1002b09:	c1 f8 1f             	sar    eax,0x1f
 1002b0c:	29 c2                	sub    edx,eax
 1002b0e:	6b d2 64             	imul   edx,edx,0x64
 1002b11:	b8 01 00 00 00       	mov    eax,0x1
 1002b16:	39 d1                	cmp    ecx,edx
 1002b18:	75 1c                	jne    1002b36 <mktime+0x150>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 4)
 1002b1a:	89 c8                	mov    eax,ecx
 1002b1c:	f7 ef                	imul   edi
 1002b1e:	c1 fa 07             	sar    edx,0x7
 1002b21:	89 c8                	mov    eax,ecx
 1002b23:	c1 f8 1f             	sar    eax,0x1f
 1002b26:	29 c2                	sub    edx,eax
 1002b28:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002b2e:	39 d1                	cmp    ecx,edx
 1002b30:	0f 94 c0             	sete   al
 1002b33:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 8)
 1002b36:	8d 14 00             	lea    edx,[eax+eax*1]
 1002b39:	01 d0                	add    eax,edx
 1002b3b:	8d 04 86             	lea    eax,[esi+eax*4]
 1002b3e:	03 2c 85 00 50 00 01 	add    ebp,DWORD PTR [eax*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:164 (discriminator 8)
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
 1002b45:	85 ed                	test   ebp,ebp
 1002b47:	78 96                	js     1002adf <mktime+0xf9>
 1002b49:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
 1002b4c:	eb 7a                	jmp    1002bc8 <mktime+0x1e2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 1)
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002b4e:	8d be 6c 07 00 00    	lea    edi,[esi+0x76c]
 1002b54:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002b59:	f7 ef                	imul   edi
 1002b5b:	c1 fa 05             	sar    edx,0x5
 1002b5e:	89 f8                	mov    eax,edi
 1002b60:	c1 f8 1f             	sar    eax,0x1f
 1002b63:	29 c2                	sub    edx,eax
 1002b65:	6b d2 64             	imul   edx,edx,0x64
 1002b68:	39 d7                	cmp    edi,edx
 1002b6a:	75 27                	jne    1002b93 <mktime+0x1ad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 4)
 1002b6c:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002b71:	f7 ef                	imul   edi
 1002b73:	c1 fa 07             	sar    edx,0x7
 1002b76:	89 f8                	mov    eax,edi
 1002b78:	c1 f8 1f             	sar    eax,0x1f
 1002b7b:	29 c2                	sub    edx,eax
 1002b7d:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002b83:	b8 01 00 00 00       	mov    eax,0x1
 1002b88:	39 d7                	cmp    edi,edx
 1002b8a:	74 13                	je     1002b9f <mktime+0x1b9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 6)
 1002b8c:	b8 00 00 00 00       	mov    eax,0x0
 1002b91:	eb 0c                	jmp    1002b9f <mktime+0x1b9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172
 1002b93:	b8 01 00 00 00       	mov    eax,0x1
 1002b98:	eb 05                	jmp    1002b9f <mktime+0x1b9>
 1002b9a:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 8)
 1002b9f:	8d 14 00             	lea    edx,[eax+eax*1]
 1002ba2:	01 d0                	add    eax,edx
 1002ba4:	8d 04 81             	lea    eax,[ecx+eax*4]
 1002ba7:	2b 2c 85 00 50 00 01 	sub    ebp,DWORD PTR [eax*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:173 (discriminator 8)
    if (++(tmbuf->tm_mon) == 12) {
 1002bae:	83 c1 01             	add    ecx,0x1
 1002bb1:	83 f9 0c             	cmp    ecx,0xc
 1002bb4:	74 05                	je     1002bbb <mktime+0x1d5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:173
 1002bb6:	89 4b 10             	mov    DWORD PTR [ebx+0x10],ecx
 1002bb9:	eb 0d                	jmp    1002bc8 <mktime+0x1e2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:174
      tmbuf->tm_mon = 0;
 1002bbb:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:175
      tmbuf->tm_year++;
 1002bc2:	83 c6 01             	add    esi,0x1
 1002bc5:	89 73 14             	mov    DWORD PTR [ebx+0x14],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002bc8:	8b 73 14             	mov    esi,DWORD PTR [ebx+0x14]
 1002bcb:	f7 c6 03 00 00 00    	test   esi,0x3
 1002bd1:	0f 85 ad 02 00 00    	jne    1002e84 <mktime+0x49e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171 (discriminator 1)
 1002bd7:	8d 8e 6c 07 00 00    	lea    ecx,[esi+0x76c]
 1002bdd:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002be2:	f7 e9                	imul   ecx
 1002be4:	c1 fa 05             	sar    edx,0x5
 1002be7:	89 c8                	mov    eax,ecx
 1002be9:	c1 f8 1f             	sar    eax,0x1f
 1002bec:	29 c2                	sub    edx,eax
 1002bee:	6b d2 64             	imul   edx,edx,0x64
 1002bf1:	39 d1                	cmp    ecx,edx
 1002bf3:	0f 85 b5 02 00 00    	jne    1002eae <mktime+0x4c8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171 (discriminator 4)
 1002bf9:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002bfe:	f7 e9                	imul   ecx
 1002c00:	c1 fa 07             	sar    edx,0x7
 1002c03:	89 c8                	mov    eax,ecx
 1002c05:	c1 f8 1f             	sar    eax,0x1f
 1002c08:	29 c2                	sub    edx,eax
 1002c0a:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002c10:	39 d1                	cmp    ecx,edx
 1002c12:	0f 84 b6 02 00 00    	je     1002ece <mktime+0x4e8>
 1002c18:	e9 7c 02 00 00       	jmp    1002e99 <mktime+0x4b3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:178
    if (++(tmbuf->tm_mon) == 12) {
      tmbuf->tm_mon = 0;
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
 1002c1d:	8d 45 01             	lea    eax,[ebp+0x1]
 1002c20:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:180
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
 1002c23:	83 fe 45             	cmp    esi,0x45
 1002c26:	0f 8e 51 02 00 00    	jle    1002e7d <mktime+0x497>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:190
  // Assume that when day becomes negative, there will certainly
  // be overflow on seconds.
  // The check for overflow needs not to be done for leapyears
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;
 1002c2c:	8d 86 6c 07 00 00    	lea    eax,[esi+0x76c]
 1002c32:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:192

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
 1002c36:	8d 46 ba             	lea    eax,[esi-0x46]
 1002c39:	89 c7                	mov    edi,eax
 1002c3b:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:183
  tmbuf->tm_mday = day + 1;
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
  seconds = 0;
  day = 0;                      // Means days since day 0 now
  overflow = 0;
 1002c3f:	3d 7c c6 59 00       	cmp    eax,0x59c67c
 1002c44:	0f 9f c0             	setg   al
 1002c47:	0f b6 c0             	movzx  eax,al
 1002c4a:	89 c2                	mov    edx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:193
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
  day = (tm_year - year) * 365;
 1002c4c:	89 f8                	mov    eax,edi
 1002c4e:	69 ff 6d 01 00 00    	imul   edi,edi,0x16d
 1002c54:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:194
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
 1002c58:	8d 7e bd             	lea    edi,[esi-0x43]
 1002c5b:	85 c0                	test   eax,eax
 1002c5d:	0f 49 f8             	cmovns edi,eax
 1002c60:	c1 ff 02             	sar    edi,0x2
 1002c63:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
 1002c68:	2b 44 24 04          	sub    eax,DWORD PTR [esp+0x4]
 1002c6c:	8d 77 01             	lea    esi,[edi+0x1]
 1002c6f:	89 14 24             	mov    DWORD PTR [esp],edx
 1002c72:	83 ca 02             	or     edx,0x2
 1002c75:	39 f0                	cmp    eax,esi
 1002c77:	89 d6                	mov    esi,edx
 1002c79:	0f 4d 34 24          	cmovge esi,DWORD PTR [esp]
 1002c7d:	89 34 24             	mov    DWORD PTR [esp],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:195
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
 1002c80:	b8 00 00 00 00       	mov    eax,0x0
 1002c85:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 1002c89:	89 d6                	mov    esi,edx
 1002c8b:	83 e6 03             	and    esi,0x3
 1002c8e:	89 74 24 1c          	mov    DWORD PTR [esp+0x1c],esi
 1002c92:	74 19                	je     1002cad <mktime+0x2c7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:195 (discriminator 1)
 1002c94:	89 d6                	mov    esi,edx
 1002c96:	c1 fa 1f             	sar    edx,0x1f
 1002c99:	c1 ea 1e             	shr    edx,0x1e
 1002c9c:	8d 04 16             	lea    eax,[esi+edx*1]
 1002c9f:	83 e0 03             	and    eax,0x3
 1002ca2:	29 d0                	sub    eax,edx
 1002ca4:	83 f8 01             	cmp    eax,0x1
 1002ca7:	0f 9e c0             	setle  al
 1002caa:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:195 (discriminator 6)
 1002cad:	01 c7                	add    edi,eax
 1002caf:	03 7c 24 04          	add    edi,DWORD PTR [esp+0x4]
 1002cb3:	89 7c 24 10          	mov    DWORD PTR [esp+0x10],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:196 (discriminator 6)
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
 1002cb7:	bf 1f 85 eb 51       	mov    edi,0x51eb851f
 1002cbc:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1002cc0:	f7 ef                	imul   edi
 1002cc2:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
 1002cc6:	89 d0                	mov    eax,edx
 1002cc8:	c1 f8 05             	sar    eax,0x5
 1002ccb:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 1002ccf:	89 d6                	mov    esi,edx
 1002cd1:	c1 fe 1f             	sar    esi,0x1f
 1002cd4:	89 74 24 18          	mov    DWORD PTR [esp+0x18],esi
 1002cd8:	29 f0                	sub    eax,esi
 1002cda:	6b c0 64             	imul   eax,eax,0x64
 1002cdd:	29 c2                	sub    edx,eax
 1002cdf:	89 d0                	mov    eax,edx
 1002ce1:	0f 95 44 24 04       	setne  BYTE PTR [esp+0x4]
 1002ce6:	0f b6 54 24 04       	movzx  edx,BYTE PTR [esp+0x4]
 1002ceb:	83 f8 45             	cmp    eax,0x45
 1002cee:	0f 9e c0             	setle  al
 1002cf1:	0f b6 c0             	movzx  eax,al
 1002cf4:	89 c6                	mov    esi,eax
 1002cf6:	21 d6                	and    esi,edx
 1002cf8:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1002cfc:	f7 ef                	imul   edi
 1002cfe:	89 d7                	mov    edi,edx
 1002d00:	c1 ff 05             	sar    edi,0x5
 1002d03:	89 f8                	mov    eax,edi
 1002d05:	8b 7c 24 0c          	mov    edi,DWORD PTR [esp+0xc]
 1002d09:	c1 ff 1f             	sar    edi,0x1f
 1002d0c:	89 7c 24 0c          	mov    DWORD PTR [esp+0xc],edi
 1002d10:	29 f8                	sub    eax,edi
 1002d12:	01 c6                	add    esi,eax
 1002d14:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
 1002d18:	29 f7                	sub    edi,esi
 1002d1a:	89 fe                	mov    esi,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:197 (discriminator 6)
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);
 1002d1c:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
 1002d20:	c1 f8 07             	sar    eax,0x7
 1002d23:	89 c7                	mov    edi,eax
 1002d25:	2b 7c 24 18          	sub    edi,DWORD PTR [esp+0x18]
 1002d29:	69 c7 90 01 00 00    	imul   eax,edi,0x190
 1002d2f:	8b 7c 24 08          	mov    edi,DWORD PTR [esp+0x8]
 1002d33:	29 c7                	sub    edi,eax
 1002d35:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
 1002d39:	81 ff 71 01 00 00    	cmp    edi,0x171
 1002d3f:	0f 9e 44 24 10       	setle  BYTE PTR [esp+0x10]
 1002d44:	85 ff                	test   edi,edi
 1002d46:	0f 95 c0             	setne  al
 1002d49:	0f b6 c0             	movzx  eax,al
 1002d4c:	23 44 24 10          	and    eax,DWORD PTR [esp+0x10]
 1002d50:	c1 fa 07             	sar    edx,0x7
 1002d53:	2b 54 24 0c          	sub    edx,DWORD PTR [esp+0xc]
 1002d57:	01 c2                	add    edx,eax
 1002d59:	8d 04 32             	lea    eax,[edx+esi*1]
 1002d5c:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:200 (discriminator 6)

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
 1002d60:	85 c9                	test   ecx,ecx
 1002d62:	7e 46                	jle    1002daa <mktime+0x3c4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:200
 1002d64:	be 00 00 00 00       	mov    esi,0x0
 1002d69:	bf 00 00 00 00       	mov    edi,0x0
 1002d6e:	89 6c 24 10          	mov    DWORD PTR [esp+0x10],ebp
 1002d72:	8b 6c 24 1c          	mov    ebp,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:201
    yday += _ytab[LEAPYEAR(tm_year)][month];
 1002d76:	b8 00 00 00 00       	mov    eax,0x0
 1002d7b:	85 ed                	test   ebp,ebp
 1002d7d:	75 0f                	jne    1002d8e <mktime+0x3a8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:201 (discriminator 4)
 1002d7f:	83 7c 24 08 00       	cmp    DWORD PTR [esp+0x8],0x0
 1002d84:	0f 94 c0             	sete   al
 1002d87:	0a 44 24 04          	or     al,BYTE PTR [esp+0x4]
 1002d8b:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:201 (discriminator 8)
 1002d8e:	8d 14 00             	lea    edx,[eax+eax*1]
 1002d91:	01 d0                	add    eax,edx
 1002d93:	8d 04 86             	lea    eax,[esi+eax*4]
 1002d96:	03 3c 85 00 50 00 01 	add    edi,DWORD PTR [eax*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:202 (discriminator 8)
    month++;
 1002d9d:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:200 (discriminator 8)
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
 1002da0:	39 ce                	cmp    esi,ecx
 1002da2:	75 d2                	jne    1002d76 <mktime+0x390>
 1002da4:	8b 6c 24 10          	mov    ebp,DWORD PTR [esp+0x10]
 1002da8:	eb 05                	jmp    1002daf <mktime+0x3c9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:199
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
 1002daa:	bf 00 00 00 00       	mov    edi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:204
  while (month < tmbuf->tm_mon) {
    yday += _ytab[LEAPYEAR(tm_year)][month];
    month++;
  }
  yday += (tmbuf->tm_mday - 1);
 1002daf:	01 ef                	add    edi,ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:205
  if (day + yday < 0) overflow|=4;
 1002db1:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
 1002db5:	01 fe                	add    esi,edi
 1002db7:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
 1002dba:	89 c8                	mov    eax,ecx
 1002dbc:	83 c8 04             	or     eax,0x4
 1002dbf:	85 f6                	test   esi,esi
 1002dc1:	0f 49 c1             	cmovns eax,ecx
 1002dc4:	89 c5                	mov    ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:208
  day += yday;

  tmbuf->tm_yday = yday;
 1002dc6:	89 7b 1c             	mov    DWORD PTR [ebx+0x1c],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:209
  tmbuf->tm_wday = (day + 4) % 7;               // Day 0 was thursday (4)
 1002dc9:	8d 4e 04             	lea    ecx,[esi+0x4]
 1002dcc:	ba 93 24 49 92       	mov    edx,0x92492493
 1002dd1:	89 c8                	mov    eax,ecx
 1002dd3:	f7 ea                	imul   edx
 1002dd5:	01 ca                	add    edx,ecx
 1002dd7:	c1 fa 02             	sar    edx,0x2
 1002dda:	89 c8                	mov    eax,ecx
 1002ddc:	c1 f8 1f             	sar    eax,0x1f
 1002ddf:	29 c2                	sub    edx,eax
 1002de1:	8d 04 d5 00 00 00 00 	lea    eax,[edx*8+0x0]
 1002de8:	29 d0                	sub    eax,edx
 1002dea:	29 c1                	sub    ecx,eax
 1002dec:	89 4b 18             	mov    DWORD PTR [ebx+0x18],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:211

  seconds = ((tmbuf->tm_hour * 60L) + tmbuf->tm_min) * 60L + tmbuf->tm_sec;
 1002def:	6b 4b 08 3c          	imul   ecx,DWORD PTR [ebx+0x8],0x3c
 1002df3:	03 4b 04             	add    ecx,DWORD PTR [ebx+0x4]
 1002df6:	6b c9 3c             	imul   ecx,ecx,0x3c
 1002df9:	03 0b                	add    ecx,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:213

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
 1002dfb:	bf ff ff ff 7f       	mov    edi,0x7fffffff
 1002e00:	29 cf                	sub    edi,ecx
 1002e02:	ba 07 45 2e c2       	mov    edx,0xc22e4507
 1002e07:	89 f8                	mov    eax,edi
 1002e09:	f7 ea                	imul   edx
 1002e0b:	01 fa                	add    edx,edi
 1002e0d:	c1 fa 10             	sar    edx,0x10
 1002e10:	c1 ff 1f             	sar    edi,0x1f
 1002e13:	29 fa                	sub    edx,edi
 1002e15:	89 e8                	mov    eax,ebp
 1002e17:	83 c8 08             	or     eax,0x8
 1002e1a:	39 d6                	cmp    esi,edx
 1002e1c:	0f 4e c5             	cmovle eax,ebp
 1002e1f:	89 04 24             	mov    DWORD PTR [esp],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:214
  seconds += day * SECS_DAY;
 1002e22:	69 f6 80 51 01 00    	imul   esi,esi,0x15180
 1002e28:	01 f1                	add    ecx,esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:217

  // Now adjust according to timezone and daylight saving time
  if (((kTimeZone > 0) && (TIME_MAX - kTimeZone < seconds)) || 
 1002e2a:	a1 90 02 12 00       	mov    eax,ds:0x120290
 1002e2f:	85 c0                	test   eax,eax
 1002e31:	7e 0b                	jle    1002e3e <mktime+0x458>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:217 (discriminator 1)
 1002e33:	ba ff ff ff 7f       	mov    edx,0x7fffffff
 1002e38:	29 c2                	sub    edx,eax
 1002e3a:	39 d1                	cmp    ecx,edx
 1002e3c:	7f 0c                	jg     1002e4a <mktime+0x464>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:217 (discriminator 3)
 1002e3e:	85 c0                	test   eax,eax
 1002e40:	79 0c                	jns    1002e4e <mktime+0x468>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:218
      ((kTimeZone < 0) && (seconds < -kTimeZone))) {
 1002e42:	89 c2                	mov    edx,eax
 1002e44:	f7 da                	neg    edx
 1002e46:	39 d1                	cmp    ecx,edx
 1002e48:	7d 04                	jge    1002e4e <mktime+0x468>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:219
          overflow|=16;
 1002e4a:	83 0c 24 10          	or     DWORD PTR [esp],0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:221
  }
  seconds += kTimeZone;
 1002e4e:	01 c1                	add    ecx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:224

  if (tmbuf->tm_isdst) {
    dst = _dstbias;
 1002e50:	83 7b 20 00          	cmp    DWORD PTR [ebx+0x20],0x0
 1002e54:	ba 00 00 00 00       	mov    edx,0x0
 1002e59:	0f 45 15 2c 04 12 00 	cmovne edx,DWORD PTR ds:0x12042c
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:229
  } else {
    dst = 0;
  }

  if (dst > seconds) overflow|=32;        // dst is always non-negative
 1002e60:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 1002e63:	89 d8                	mov    eax,ebx
 1002e65:	83 c8 20             	or     eax,0x20
 1002e68:	39 ca                	cmp    edx,ecx
 1002e6a:	0f 4e c3             	cmovle eax,ebx
 1002e6d:	89 c7                	mov    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:232
  seconds -= dst;

  if (overflow) return (time_t) overflow-2;
 1002e6f:	89 f8                	mov    eax,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:235

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
 1002e71:	29 d1                	sub    ecx,edx
 1002e73:	83 e8 02             	sub    eax,0x2
 1002e76:	85 ff                	test   edi,edi
 1002e78:	0f 44 c1             	cmove  eax,ecx
 1002e7b:	eb 62                	jmp    1002edf <mktime+0x4f9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:180
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
 1002e7d:	b8 19 fc ff ff       	mov    eax,0xfffffc19
 1002e82:	eb 5b                	jmp    1002edf <mktime+0x4f9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002e84:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e87:	3b 2c 8d 00 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005000]
 1002e8e:	0f 8d f8 fc ff ff    	jge    1002b8c <mktime+0x1a6>
 1002e94:	e9 84 fd ff ff       	jmp    1002c1d <mktime+0x237>
 1002e99:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e9c:	3b 2c 8d 00 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005000]
 1002ea3:	0f 8d a5 fc ff ff    	jge    1002b4e <mktime+0x168>
 1002ea9:	e9 6f fd ff ff       	jmp    1002c1d <mktime+0x237>
 1002eae:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002eb1:	3b 2c 8d 30 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005030]
 1002eb8:	0f 8d dc fc ff ff    	jge    1002b9a <mktime+0x1b4>
 1002ebe:	e9 5a fd ff ff       	jmp    1002c1d <mktime+0x237>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002ec3:	8d be 6c 07 00 00    	lea    edi,[esi+0x76c]
 1002ec9:	e9 9e fc ff ff       	jmp    1002b6c <mktime+0x186>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002ece:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002ed1:	3b 2c 8d 30 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005030]
 1002ed8:	7d e9                	jge    1002ec3 <mktime+0x4dd>
 1002eda:	e9 3e fd ff ff       	jmp    1002c1d <mktime+0x237>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:236

  if (overflow) return (time_t) overflow-2;

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
}
 1002edf:	83 c4 20             	add    esp,0x20
 1002ee2:	5b                   	pop    ebx
 1002ee3:	5e                   	pop    esi
 1002ee4:	5f                   	pop    edi
 1002ee5:	5d                   	pop    ebp
 1002ee6:	c3                   	ret    

01002ee7 <_strdate>:
_strdate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:241

#if !defined(KERNEL) && !defined(OS_LIB)


char *_strdate(char *s) {
 1002ee7:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:244
  time_t now;

  time(&now);
 1002eea:	8d 44 24 0c          	lea    eax,[esp+0xc]
 1002eee:	50                   	push   eax
 1002eef:	e8 1c f8 ff ff       	call   1002710 <time>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:248
  //fix me!
  //  strftime(s, 9, "%D", localtime(&now));
  return s;
}
 1002ef4:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002ef8:	83 c4 14             	add    esp,0x14
 1002efb:	c3                   	ret    

01002efc <_strtime>:
_strtime():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:250

char *_strtime(char *s) {
 1002efc:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:253
  time_t now;

  time(&now);
 1002eff:	8d 44 24 0c          	lea    eax,[esp+0xc]
 1002f03:	50                   	push   eax
 1002f04:	e8 07 f8 ff ff       	call   1002710 <time>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:257
  //fix me
  //  strftime(s, 9, "%T", localtime(&now));
  return s;
}
 1002f09:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002f0d:	83 c4 14             	add    esp,0x14
 1002f10:	c3                   	ret    

01002f11 <waitTicks>:
waitTicks():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:260

void __attribute__((noinline))waitTicks(int TicksToWait)
{
 1002f11:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:262
    //printf("ttw=%u",ttw);
    if (TicksToWait==0)
 1002f15:	85 c0                	test   eax,eax
 1002f17:	74 09                	je     1002f22 <waitTicks+0x11>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:267 (discriminator 1)
        return;
    //printd(DEBUG_TIMER,"ttw=%08X", TicksToWait);
    do
    {
        __asm("sti\nhlt\n");
 1002f19:	fb                   	sti    
 1002f1a:	f4                   	hlt    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:268 (discriminator 1)
        TicksToWait--;
 1002f1b:	83 e8 01             	sub    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:269 (discriminator 1)
    } while (TicksToWait>0);
 1002f1e:	85 c0                	test   eax,eax
 1002f20:	7f f7                	jg     1002f19 <waitTicks+0x8>
 1002f22:	f3 c3                	repz ret 

01002f24 <wait>:
wait():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:274
    return;
}

void /*__attribute__((noinline))*/wait(int msToWait)
{
 1002f24:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:277
    //printk("msToWait=%u, ticksperms=%u, ticksToWait=%u",msToWait, kTicksPerMS, msToWait*kTicksPerMS);
    //STOPHERE2
    waitTicks(msToWait/kTicksPerMS);
 1002f28:	99                   	cdq    
 1002f29:	f7 3d 84 02 12 00    	idiv   DWORD PTR ds:0x120284
 1002f2f:	50                   	push   eax
 1002f30:	e8 dc ff ff ff       	call   1002f11 <waitTicks>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:278
}
 1002f35:	83 c4 04             	add    esp,0x4
 1002f38:	c3                   	ret    

01002f39 <wait3>:
wait3():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:281

void wait3(double msToWait)
{
 1002f39:	56                   	push   esi
 1002f3a:	53                   	push   ebx
 1002f3b:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:282
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);
 1002f3e:	8b 0d 60 02 12 00    	mov    ecx,DWORD PTR ds:0x120260
 1002f44:	8b 19                	mov    ebx,DWORD PTR [ecx]
 1002f46:	8b 35 80 02 12 00    	mov    esi,DWORD PTR ds:0x120280
 1002f4c:	dd 44 24 30          	fld    QWORD PTR [esp+0x30]
 1002f50:	b8 e8 03 00 00       	mov    eax,0x3e8
 1002f55:	ba 00 00 00 00       	mov    edx,0x0
 1002f5a:	f7 f6                	div    esi
 1002f5c:	89 04 24             	mov    DWORD PTR [esp],eax
 1002f5f:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f66:	00 
 1002f67:	df 2c 24             	fild   QWORD PTR [esp]
 1002f6a:	de f9                	fdivp  st(1),st
 1002f6c:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1002f6f:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f76:	00 
 1002f77:	df 2c 24             	fild   QWORD PTR [esp]
 1002f7a:	de c1                	faddp  st(1),st
 1002f7c:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002f80:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002f84:	dd 5c 24 18          	fstp   QWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:284

while (endTicks > (double)*kTicksSinceStart)
 1002f88:	8b 01                	mov    eax,DWORD PTR [ecx]
 1002f8a:	dd 44 24 18          	fld    QWORD PTR [esp+0x18]
 1002f8e:	89 04 24             	mov    DWORD PTR [esp],eax
 1002f91:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f98:	00 
 1002f99:	df 2c 24             	fild   QWORD PTR [esp]
 1002f9c:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002fa0:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002fa4:	d9 c9                	fxch   st(1)
 1002fa6:	df e9                	fucomip st,st(1)
 1002fa8:	dd d8                	fstp   st(0)
 1002faa:	76 26                	jbe    1002fd2 <wait3+0x99>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:285
    {__asm__("sti\n hlt\n");}
 1002fac:	fb                   	sti    
 1002fad:	f4                   	hlt    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:284

void wait3(double msToWait)
{
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);

while (endTicks > (double)*kTicksSinceStart)
 1002fae:	8b 01                	mov    eax,DWORD PTR [ecx]
 1002fb0:	dd 44 24 18          	fld    QWORD PTR [esp+0x18]
 1002fb4:	89 04 24             	mov    DWORD PTR [esp],eax
 1002fb7:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002fbe:	00 
 1002fbf:	df 2c 24             	fild   QWORD PTR [esp]
 1002fc2:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002fc6:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002fca:	d9 c9                	fxch   st(1)
 1002fcc:	df e9                	fucomip st,st(1)
 1002fce:	dd d8                	fstp   st(0)
 1002fd0:	77 da                	ja     1002fac <wait3+0x73>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:287
    {__asm__("sti\n hlt\n");}
    
}
 1002fd2:	83 c4 24             	add    esp,0x24
 1002fd5:	5b                   	pop    ebx
 1002fd6:	5e                   	pop    esi
 1002fd7:	c3                   	ret    

01002fd8 <wait2>:
wait2():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:290

void wait2(unsigned msToWait)
{
 1002fd8:	57                   	push   edi
 1002fd9:	56                   	push   esi
 1002fda:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:291
    uint64_t startTicks = *kTicksSinceStart;             //25
 1002fdb:	8b 1d 60 02 12 00    	mov    ebx,DWORD PTR ds:0x120260
 1002fe1:	8b 0b                	mov    ecx,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:292
    unsigned msPerTick = 1000 / kTicksPerSecond;         //18
 1002fe3:	8b 3d 80 02 12 00    	mov    edi,DWORD PTR ds:0x120280
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:294
    uint64_t totalTicksToWait = msToWait/msPerTick;     //4321/18
    uint64_t endTicks = startTicks + totalTicksToWait;
 1002fe9:	b8 e8 03 00 00       	mov    eax,0x3e8
 1002fee:	ba 00 00 00 00       	mov    edx,0x0
 1002ff3:	f7 f7                	div    edi
 1002ff5:	89 c6                	mov    esi,eax
 1002ff7:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 1002ffb:	ba 00 00 00 00       	mov    edx,0x0
 1003000:	f7 f6                	div    esi
 1003002:	89 c6                	mov    esi,eax
 1003004:	bf 00 00 00 00       	mov    edi,0x0
 1003009:	89 c8                	mov    eax,ecx
 100300b:	ba 00 00 00 00       	mov    edx,0x0
 1003010:	01 f0                	add    eax,esi
 1003012:	11 fa                	adc    edx,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:296

    if (endTicks < *kTicksSinceStart)
 1003014:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 1003016:	83 fa 00             	cmp    edx,0x0
 1003019:	77 04                	ja     100301f <wait2+0x47>
 100301b:	39 c8                	cmp    eax,ecx
 100301d:	72 17                	jb     1003036 <wait2+0x5e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:304
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
 100301f:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 1003021:	83 fa 00             	cmp    edx,0x0
 1003024:	77 04                	ja     100302a <wait2+0x52>
 1003026:	39 c8                	cmp    eax,ecx
 1003028:	76 0c                	jbe    1003036 <wait2+0x5e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:305
    {__asm__("hlt\n");}
 100302a:	f4                   	hlt    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:304
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
 100302b:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 100302d:	83 fa 00             	cmp    edx,0x0
 1003030:	77 f8                	ja     100302a <wait2+0x52>
 1003032:	39 c8                	cmp    eax,ecx
 1003034:	77 f4                	ja     100302a <wait2+0x52>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:307
    {__asm__("hlt\n");}
    //printf("done waiting!\n");
}
 1003036:	5b                   	pop    ebx
 1003037:	5e                   	pop    esi
 1003038:	5f                   	pop    edi
 1003039:	c3                   	ret    
 100303a:	66 90                	xchg   ax,ax

0100303c <kbd_handler_generic>:
kbd_handler_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:38
    kbd_handler_generic();
    return;
}

void kbd_handler_generic()
{
 100303c:	53                   	push   ebx
 100303d:	83 ec 08             	sub    esp,0x8
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1003040:	e4 60                	in     al,0x60
kbd_handler_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:44
    unsigned char lKeyControlVal=0;
    unsigned char rawKey=0;
    unsigned char translatedKeypress=0;
   
    rawKey = inb(KEYB_DATA_PORT);
    kKeyChar = rawKey;//& 0x80;
 1003042:	a2 7c 4a 01 01       	mov    ds:0x1014a7c,al
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:46

    __asm__("cli\n");
 1003047:	fa                   	cli    
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:48
    
    switch(rawKey)  
 1003048:	3c 9d                	cmp    al,0x9d
 100304a:	74 44                	je     1003090 <kbd_handler_generic+0x54>
 100304c:	3c 9d                	cmp    al,0x9d
 100304e:	77 0e                	ja     100305e <kbd_handler_generic+0x22>
 1003050:	3c 2a                	cmp    al,0x2a
 1003052:	74 18                	je     100306c <kbd_handler_generic+0x30>
 1003054:	3c 38                	cmp    al,0x38
 1003056:	74 44                	je     100309c <kbd_handler_generic+0x60>
 1003058:	3c 1d                	cmp    al,0x1d
 100305a:	75 6e                	jne    10030ca <kbd_handler_generic+0x8e>
 100305c:	eb 26                	jmp    1003084 <kbd_handler_generic+0x48>
 100305e:	3c b8                	cmp    al,0xb8
 1003060:	74 46                	je     10030a8 <kbd_handler_generic+0x6c>
 1003062:	3c ba                	cmp    al,0xba
 1003064:	74 4e                	je     10030b4 <kbd_handler_generic+0x78>
 1003066:	3c aa                	cmp    al,0xaa
 1003068:	75 60                	jne    10030ca <kbd_handler_generic+0x8e>
 100306a:	eb 0c                	jmp    1003078 <kbd_handler_generic+0x3c>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:50
    {
        case KEY_SHIFT_DN: kKeyStatus[INDEX_SHIFT]=1;break;
 100306c:	c6 05 48 4a 01 01 01 	mov    BYTE PTR ds:0x1014a48,0x1
 1003073:	e9 94 01 00 00       	jmp    100320c <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:51
        case KEY_SHIFT_UP: kKeyStatus[INDEX_SHIFT]=0;break;
 1003078:	c6 05 48 4a 01 01 00 	mov    BYTE PTR ds:0x1014a48,0x0
 100307f:	e9 88 01 00 00       	jmp    100320c <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:52
        case KEY_CTRL_DN: kKeyStatus[INDEX_CTRL]=1;break;
 1003084:	c6 05 49 4a 01 01 01 	mov    BYTE PTR ds:0x1014a49,0x1
 100308b:	e9 7c 01 00 00       	jmp    100320c <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:53
        case KEY_CTRL_UP: kKeyStatus[INDEX_CTRL]=0;break;
 1003090:	c6 05 49 4a 01 01 00 	mov    BYTE PTR ds:0x1014a49,0x0
 1003097:	e9 70 01 00 00       	jmp    100320c <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:54
        case KEY_ALT_DN: kKeyStatus[INDEX_ALT]=1;break;
 100309c:	c6 05 4a 4a 01 01 01 	mov    BYTE PTR ds:0x1014a4a,0x1
 10030a3:	e9 64 01 00 00       	jmp    100320c <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:55
        case KEY_ALT_UP: kKeyStatus[INDEX_ALT]=0;break;
 10030a8:	c6 05 4a 4a 01 01 00 	mov    BYTE PTR ds:0x1014a4a,0x0
 10030af:	e9 58 01 00 00       	jmp    100320c <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:56
        case KEY_CAPSLOCK_UP: kKeyStatus[INDEX_CAPSLOCK]=!kKeyStatus[INDEX_CAPSLOCK];break;
 10030b4:	0f b6 05 4b 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a4b
 10030bb:	84 c0                	test   al,al
 10030bd:	0f 94 c0             	sete   al
 10030c0:	a2 4b 4a 01 01       	mov    ds:0x1014a4b,al
 10030c5:	e9 42 01 00 00       	jmp    100320c <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:64
//        case MAKE_UP: kKeyStatus[INDEX_UP]=0;break;
//        case MAKE_DOWN: kKeyStatus[INDEX_DOWN]=0;break;
       default:
//printk("%02X",rawKey);
           //changed from if rawkey & 0x80, so that keydown triggers the key being input
           if (rawKey==BREAK_RIGHT || rawKey==BREAK_LEFT || rawKey==BREAK_UP || rawKey==BREAK_DOWN)
 10030ca:	8d 50 35             	lea    edx,[eax+0x35]
 10030cd:	f6 c2 fd             	test   dl,0xfd
 10030d0:	74 08                	je     10030da <kbd_handler_generic+0x9e>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:64 (discriminator 1)
 10030d2:	8d 50 38             	lea    edx,[eax+0x38]
 10030d5:	f6 c2 f7             	test   dl,0xf7
 10030d8:	75 24                	jne    10030fe <kbd_handler_generic+0xc2>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:65
               if (kKeyboardBuffer<(char*)KEYBOARD_BUFFER_ADDRESS+KEYBOARD_BUFFER_SIZE && !kKeyStatus[INDEX_ALT])
 10030da:	8b 15 e0 03 12 00    	mov    edx,DWORD PTR ds:0x1203e0
 10030e0:	81 fa 2f 25 15 00    	cmp    edx,0x15252f
 10030e6:	77 16                	ja     10030fe <kbd_handler_generic+0xc2>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:65 (discriminator 1)
 10030e8:	0f b6 0d 4a 4a 01 01 	movzx  ecx,BYTE PTR ds:0x1014a4a
 10030ef:	84 c9                	test   cl,cl
 10030f1:	75 0b                	jne    10030fe <kbd_handler_generic+0xc2>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:66
                   *kKeyboardBuffer++=rawKey;
 10030f3:	8d 4a 01             	lea    ecx,[edx+0x1]
 10030f6:	89 0d e0 03 12 00    	mov    DWORD PTR ds:0x1203e0,ecx
 10030fc:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:67
           if (!(rawKey & 0x80))
 10030fe:	84 c0                	test   al,al
 1003100:	0f 88 06 01 00 00    	js     100320c <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:71
           {
                //rawKey &= 0x7f;
               //printk("%02X",rawKey); 48=up, 50=down
                 if (kKeyStatus[INDEX_SHIFT] || kKeyStatus[INDEX_CAPSLOCK])
 1003106:	0f b6 15 48 4a 01 01 	movzx  edx,BYTE PTR ds:0x1014a48
 100310d:	84 d2                	test   dl,dl
 100310f:	75 0b                	jne    100311c <kbd_handler_generic+0xe0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:71 (discriminator 1)
 1003111:	0f b6 15 4b 4a 01 01 	movzx  edx,BYTE PTR ds:0x1014a4b
 1003118:	84 d2                	test   dl,dl
 100311a:	74 0c                	je     1003128 <kbd_handler_generic+0xec>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:73
                 {
                     translatedKeypress=keyboard_map_up[rawKey];
 100311c:	0f b6 c0             	movzx  eax,al
 100311f:	0f b6 98 60 50 00 01 	movzx  ebx,BYTE PTR [eax+0x1005060]
 1003126:	eb 0a                	jmp    1003132 <kbd_handler_generic+0xf6>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:76
                 }
                 else
                     translatedKeypress=keyboard_map[rawKey];
 1003128:	0f b6 c0             	movzx  eax,al
 100312b:	0f b6 98 e0 50 00 01 	movzx  ebx,BYTE PTR [eax+0x10050e0]
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:83
//                 if ((kDebugLevel & DEBUG_KEYBOARD) == DEBUG_KEYBOARD)
//                 {
//                      printf("%u, %u, %c\n",kKeyChar, rawKey, translatedKeypress);
//                 }
#endif
                if (kKeyStatus[INDEX_CTRL])
 1003132:	0f b6 05 49 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a49
 1003139:	84 c0                	test   al,al
 100313b:	74 13                	je     1003150 <kbd_handler_generic+0x114>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:85
                {
                    printk("^");
 100313d:	83 ec 0c             	sub    esp,0xc
 1003140:	68 cf 78 00 01       	push   0x10078cf
 1003145:	e8 31 f4 ff ff       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:86
                    translatedKeypress-=32;
 100314a:	83 eb 20             	sub    ebx,0x20
 100314d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:89
                }
                //Debug
                if (kKeyStatus[INDEX_ALT] && translatedKeypress==0x6A)
 1003150:	0f b6 05 4a 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a4a
 1003157:	80 fb 6a             	cmp    bl,0x6a
 100315a:	75 05                	jne    1003161 <kbd_handler_generic+0x125>
 100315c:	84 c0                	test   al,al
 100315e:	74 01                	je     1003161 <kbd_handler_generic+0x125>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:91
                {
                    __asm("int 0x3");
 1003160:	cc                   	int3   
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:93
                }
            if (kKeyStatus[INDEX_ALT] && kKeyStatus[INDEX_CTRL] && translatedKeypress==0xE0)
 1003161:	0f b6 05 4a 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a4a
 1003168:	84 c0                	test   al,al
 100316a:	74 2f                	je     100319b <kbd_handler_generic+0x15f>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:93 (discriminator 1)
 100316c:	0f b6 05 49 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a49
 1003173:	80 fb e0             	cmp    bl,0xe0
 1003176:	75 23                	jne    100319b <kbd_handler_generic+0x15f>
 1003178:	84 c0                	test   al,al
 100317a:	74 1f                	je     100319b <kbd_handler_generic+0x15f>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:96
            {
                translatedKeypress=0;
                reboot(false);
 100317c:	83 ec 0c             	sub    esp,0xc
 100317f:	6a 00                	push   0x0
 1003181:	e8 9d eb ff ff       	call   1001d23 <reboot>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:98
            }
            if (kKeyStatus[INDEX_ALT])
 1003186:	0f b6 05 4a 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a4a
 100318d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:95
                {
                    __asm("int 0x3");
                }
            if (kKeyStatus[INDEX_ALT] && kKeyStatus[INDEX_CTRL] && translatedKeypress==0xE0)
            {
                translatedKeypress=0;
 1003190:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:98
                reboot(false);
            }
            if (kKeyStatus[INDEX_ALT])
 1003195:	84 c0                	test   al,al
 1003197:	75 69                	jne    1003202 <kbd_handler_generic+0x1c6>
 1003199:	eb 71                	jmp    100320c <kbd_handler_generic+0x1d0>
 100319b:	0f b6 05 4a 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a4a
 10031a2:	84 c0                	test   al,al
 10031a4:	74 66                	je     100320c <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:100
            {
                if (translatedKeypress=='c')
 10031a6:	80 fb 63             	cmp    bl,0x63
 10031a9:	75 4b                	jne    10031f6 <kbd_handler_generic+0x1ba>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:102
                {
                    printk("%u",*kTicksSinceStart);
 10031ab:	a1 60 02 12 00       	mov    eax,ds:0x120260
 10031b0:	8b 00                	mov    eax,DWORD PTR [eax]
 10031b2:	83 ec 08             	sub    esp,0x8
 10031b5:	50                   	push   eax
 10031b6:	68 d1 78 00 01       	push   0x10078d1
 10031bb:	e8 bb f3 ff ff       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:103
                    printk("-%c-%04X:%08X",(exceptionFlags & 0x200)==0x200?'I':'i',exceptionCS, exceptionEIP);
 10031c0:	8b 0d f8 01 12 00    	mov    ecx,DWORD PTR ds:0x1201f8
 10031c6:	8b 15 fc 01 12 00    	mov    edx,DWORD PTR ds:0x1201fc
 10031cc:	a1 f0 01 12 00       	mov    eax,ds:0x1201f0
 10031d1:	83 c4 10             	add    esp,0x10
 10031d4:	25 00 02 00 00       	and    eax,0x200
 10031d9:	83 f8 01             	cmp    eax,0x1
 10031dc:	19 c0                	sbb    eax,eax
 10031de:	83 e0 20             	and    eax,0x20
 10031e1:	83 c0 49             	add    eax,0x49
 10031e4:	51                   	push   ecx
 10031e5:	52                   	push   edx
 10031e6:	50                   	push   eax
 10031e7:	68 d4 78 00 01       	push   0x10078d4
 10031ec:	e8 8a f3 ff ff       	call   100257b <printk>
 10031f1:	83 c4 10             	add    esp,0x10
 10031f4:	eb 16                	jmp    100320c <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:116
                    printk("The time is currently %s", &currTime);
                    cursorMoveTo(65,SYS_VGA_HEIGHT-1);
                    printk("ticks=%d", *kTicksSinceStart);
                    cursorRestorePosition();
                }
*/                if (translatedKeypress=='d')
 10031f6:	80 fb 64             	cmp    bl,0x64
 10031f9:	75 07                	jne    1003202 <kbd_handler_generic+0x1c6>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:118
                {
                    printDumpedRegs();
 10031fb:	e8 8a e8 ff ff       	call   1001a8a <printDumpedRegs>
 1003200:	eb 0a                	jmp    100320c <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:120
                }
                if (translatedKeypress=='e')
 1003202:	80 fb 65             	cmp    bl,0x65
 1003205:	75 05                	jne    100320c <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:122
                {
                    dumpKernelAddresses();
 1003207:	e8 58 eb ff ff       	call   1001d64 <dumpKernelAddresses>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 100320c:	e4 61                	in     al,0x61
 100320e:	89 c2                	mov    edx,eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1003210:	83 c8 82             	or     eax,0xffffff82
 1003213:	e6 61                	out    0x61,al
 1003215:	89 d0                	mov    eax,edx
 1003217:	83 e0 7f             	and    eax,0x7f
 100321a:	83 c8 02             	or     eax,0x2
 100321d:	e6 61                	out    0x61,al
kbd_handler_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:135
    lKeyControlVal |= 0x82;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    lKeyControlVal &= 0x7f;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    return;
}
 100321f:	83 c4 08             	add    esp,0x8
 1003222:	5b                   	pop    ebx
 1003223:	c3                   	ret    

01003224 <ih_keyboard_generic>:
ih_keyboard_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:32
extern volatile uint32_t exceptionSavedESP;
extern volatile uint32_t* kTicksSinceStart;

__attribute__ ((interrupt))
void ih_keyboard_generic(struct interrupt_frame *frame)
{
 1003224:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:33
    kbd_handler_generic();
 1003227:	e8 10 fe ff ff       	call   100303c <kbd_handler_generic>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:35
    return;
}
 100322c:	83 c4 0c             	add    esp,0xc
 100322f:	c3                   	ret    

01003230 <main>:
main():
/home/yogi/src/os/chrisOSKernel/src/kernel.c:26
extern char kernelDataLoadAddress;
extern struct gdt_ptr kernelGDT;
/*
 * 
 */
int main(int argc, char** argv) {
 1003230:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 1003234:	83 e4 f0             	and    esp,0xfffffff0
 1003237:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 100323a:	55                   	push   ebp
 100323b:	89 e5                	mov    ebp,esp
 100323d:	53                   	push   ebx
 100323e:	51                   	push   ecx
/home/yogi/src/os/chrisOSKernel/src/kernel.c:28
    //terminal_clear();
    printk("\nkernel loaded ... \n");
 100323f:	83 ec 0c             	sub    esp,0xc
 1003242:	68 e2 78 00 01       	push   0x10078e2
 1003247:	e8 2f f3 ff ff       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:37
        printk("Param %u=%s\n",cnt,argv[cnt]);
        //if (cnt>5)
        //    break;
    }
*/
    printk("Initializing memory management ...\n");
 100324c:	c7 04 24 1c 86 00 01 	mov    DWORD PTR [esp],0x100861c
 1003253:	e8 23 f3 ff ff       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:38
    kDebugLevel |= DEBUG_KERNEL_PAGING;
 1003258:	81 0d 38 03 12 00 00 	or     DWORD PTR ds:0x120338,0x8000
 100325f:	80 00 00 
/home/yogi/src/os/chrisOSKernel/src/kernel.c:39
    mmInit();
 1003262:	e8 63 06 00 00       	call   10038ca <mmInit>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:42
//    kDebugLevel |= DEBUG_MEMORY_MANAGEMENT;
//    kDebugLevel |= DEBUG_PAGING;
    kDebugLevel |= DEBUG_MALLOC;
 1003267:	81 0d 38 03 12 00 00 	or     DWORD PTR ds:0x120338,0x80000
 100326e:	00 08 00 
/home/yogi/src/os/chrisOSKernel/src/kernel.c:43
    printk("Done initializing memory management.\n\nInitializing malloc ...\n");
 1003271:	c7 04 24 40 86 00 01 	mov    DWORD PTR [esp],0x1008640
 1003278:	e8 fe f2 ff ff       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:44
    initMalloc();
 100327d:	e8 19 03 00 00       	call   100359b <initMalloc>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:45
    printk("Done initializing malloc\n\nInitializing task management ...\n");
 1003282:	c7 04 24 80 86 00 01 	mov    DWORD PTR [esp],0x1008680
 1003289:	e8 ed f2 ff ff       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:46
    taskInit();
 100328e:	e8 dd 0f 00 00       	call   1004270 <taskInit>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:47
    printk("Done initializing task management\n\n");
 1003293:	c7 04 24 bc 86 00 01 	mov    DWORD PTR [esp],0x10086bc
 100329a:	e8 dc f2 ff ff       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:51
    
    //process_t* process = createProcess(false,'/myhelloworld');

    int* a = malloc(50);
 100329f:	c7 04 24 32 00 00 00 	mov    DWORD PTR [esp],0x32
 10032a6:	e8 d2 04 00 00       	call   100377d <malloc>
 10032ab:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/kernel.c:52
    a[0]=0xDEADBEEF;
 10032ad:	c7 00 ef be ad de    	mov    DWORD PTR [eax],0xdeadbeef
/home/yogi/src/os/chrisOSKernel/src/kernel.c:53
    printk("a[0](0x%08X)=0x%08X\n",&a[0],a[0]);
 10032b3:	83 c4 0c             	add    esp,0xc
 10032b6:	68 ef be ad de       	push   0xdeadbeef
 10032bb:	50                   	push   eax
 10032bc:	68 f7 78 00 01       	push   0x10078f7
 10032c1:	e8 b5 f2 ff ff       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:54
    a[1]=0xBEADFEED;
 10032c6:	c7 43 04 ed fe ad be 	mov    DWORD PTR [ebx+0x4],0xbeadfeed
 10032cd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/kernel.c:59
    return 0;
    char* b = malloc(512);
    
    return (0xbad);
}
 10032d0:	b8 00 00 00 00       	mov    eax,0x0
 10032d5:	8d 65 f8             	lea    esp,[ebp-0x8]
 10032d8:	59                   	pop    ecx
 10032d9:	5b                   	pop    ebx
 10032da:	5d                   	pop    ebp
 10032db:	8d 61 fc             	lea    esp,[ecx-0x4]
 10032de:	c3                   	ret    
 10032df:	90                   	nop

010032e0 <findEmptyBlock>:
findEmptyBlock():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:18
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})

//Returns pointer to first empty block found
sMemInfo* findEmptyBlock()
{
 10032e0:	53                   	push   ebx
 10032e1:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:19
    sMemInfo* mInfo=heapMemoryInfo;
 10032e4:	a1 60 4a 01 01       	mov    eax,ds:0x1014a60
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:22
    sMemInfo* lRetVal;
    
    while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000))
 10032e9:	8d 90 80 f6 0b 00    	lea    edx,[eax+0xbf680]
 10032ef:	39 d0                	cmp    eax,edx
 10032f1:	73 32                	jae    1003325 <findEmptyBlock+0x45>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:24
    {
        if (mInfo->next==NULL)
 10032f3:	83 78 18 00          	cmp    DWORD PTR [eax+0x18],0x0
 10032f7:	75 25                	jne    100331e <findEmptyBlock+0x3e>
 10032f9:	eb 06                	jmp    1003301 <findEmptyBlock+0x21>
 10032fb:	83 78 18 00          	cmp    DWORD PTR [eax+0x18],0x0
 10032ff:	75 1d                	jne    100331e <findEmptyBlock+0x3e>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:26
        {
            lRetVal=mInfo+1;
 1003301:	8d 58 1c             	lea    ebx,[eax+0x1c]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:27
            printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: Returning block # 0x%08X\n",lRetVal);
 1003304:	83 ec 04             	sub    esp,0x4
 1003307:	53                   	push   ebx
 1003308:	68 e0 86 00 01       	push   0x10086e0
 100330d:	68 00 00 01 00       	push   0x10000
 1003312:	e8 7c f2 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:28
            return lRetVal;
 1003317:	83 c4 10             	add    esp,0x10
 100331a:	89 d8                	mov    eax,ebx
 100331c:	eb 21                	jmp    100333f <findEmptyBlock+0x5f>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:30
        }
         mInfo++;
 100331e:	83 c0 1c             	add    eax,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:22
sMemInfo* findEmptyBlock()
{
    sMemInfo* mInfo=heapMemoryInfo;
    sMemInfo* lRetVal;
    
    while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000))
 1003321:	39 d0                	cmp    eax,edx
 1003323:	75 d6                	jne    10032fb <findEmptyBlock+0x1b>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:32
            printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: Returning block # 0x%08X\n",lRetVal);
            return lRetVal;
        }
         mInfo++;
    }
    printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: No empty block found, returning NULL\n");
 1003325:	83 ec 08             	sub    esp,0x8
 1003328:	68 0c 87 00 01       	push   0x100870c
 100332d:	68 00 00 01 00       	push   0x10000
 1003332:	e8 5c f2 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:33
    return NULL;
 1003337:	83 c4 10             	add    esp,0x10
 100333a:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:34
}
 100333f:	83 c4 08             	add    esp,0x8
 1003342:	5b                   	pop    ebx
 1003343:	c3                   	ret    

01003344 <findBlockByMemoryAddress>:
findBlockByMemoryAddress():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:37

sMemInfo* findBlockByMemoryAddress(uintptr_t* address)
{
 1003344:	53                   	push   ebx
 1003345:	83 ec 08             	sub    esp,0x8
 1003348:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:38
    sMemInfo* mInfo=heapMemoryInfo;
 100334c:	8b 1d 60 4a 01 01    	mov    ebx,DWORD PTR ds:0x1014a60
 1003352:	8d 93 80 f6 0b 00    	lea    edx,[ebx+0xbf680]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:41
    do
    {
        if (mInfo->address==address)
 1003358:	3b 43 04             	cmp    eax,DWORD PTR [ebx+0x4]
 100335b:	75 18                	jne    1003375 <findBlockByMemoryAddress+0x31>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:43
        {
            printd(DEBUG_MEMORY_MANAGEMENT,"findBlockByMemoryAddress: Found block 0x%08X for memory address 0x%08X\n",mInfo,address);
 100335d:	50                   	push   eax
 100335e:	53                   	push   ebx
 100335f:	68 44 87 00 01       	push   0x1008744
 1003364:	68 00 00 01 00       	push   0x10000
 1003369:	e8 25 f2 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:44
            return (sMemInfo*)mInfo;
 100336e:	83 c4 10             	add    esp,0x10
 1003371:	89 d8                	mov    eax,ebx
 1003373:	eb 0c                	jmp    1003381 <findBlockByMemoryAddress+0x3d>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:46
        }
        mInfo++;
 1003375:	83 c3 1c             	add    ebx,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:47
    } while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000));
 1003378:	39 d3                	cmp    ebx,edx
 100337a:	75 dc                	jne    1003358 <findBlockByMemoryAddress+0x14>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:48
    return NULL;
 100337c:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:49
}
 1003381:	83 c4 08             	add    esp,0x8
 1003384:	5b                   	pop    ebx
 1003385:	c3                   	ret    

01003386 <findAvailableBlockBySize>:
findAvailableBlockBySize():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:53

//Returns a block with enough memory to fulfill the request
uintptr_t* findAvailableBlockBySize(uint32_t pSize)
{
 1003386:	53                   	push   ebx
 1003387:	83 ec 08             	sub    esp,0x8
 100338a:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:54
    sMemInfo* mInfo=heapMemoryInfo;
 100338e:	a1 60 4a 01 01       	mov    eax,ds:0x1014a60
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:58
    
    //First try finding a block starting at the last block instead of the first
    //Get to the last block
    while (mInfo->next)
 1003393:	83 78 18 00          	cmp    DWORD PTR [eax+0x18],0x0
 1003397:	74 11                	je     10033aa <findAvailableBlockBySize+0x24>
 1003399:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:59
        mInfo++;
 100339b:	83 c3 1c             	add    ebx,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:58
{
    sMemInfo* mInfo=heapMemoryInfo;
    
    //First try finding a block starting at the last block instead of the first
    //Get to the last block
    while (mInfo->next)
 100339e:	83 7b 18 00          	cmp    DWORD PTR [ebx+0x18],0x0
 10033a2:	75 f7                	jne    100339b <findAvailableBlockBySize+0x15>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:60
        mInfo++;
    while (mInfo>=heapMemoryInfo)
 10033a4:	39 d8                	cmp    eax,ebx
 10033a6:	76 04                	jbe    10033ac <findAvailableBlockBySize+0x26>
 10033a8:	eb 2e                	jmp    10033d8 <findAvailableBlockBySize+0x52>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:54
}

//Returns a block with enough memory to fulfill the request
uintptr_t* findAvailableBlockBySize(uint32_t pSize)
{
    sMemInfo* mInfo=heapMemoryInfo;
 10033aa:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:62
    //Get to the last block
    while (mInfo->next)
        mInfo++;
    while (mInfo>=heapMemoryInfo)
    {
        if (mInfo->size>=pSize && (!mInfo->inUse))
 10033ac:	39 53 08             	cmp    DWORD PTR [ebx+0x8],edx
 10033af:	72 20                	jb     10033d1 <findAvailableBlockBySize+0x4b>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:62 (discriminator 1)
 10033b1:	80 7b 0c 00          	cmp    BYTE PTR [ebx+0xc],0x0
 10033b5:	75 1a                	jne    10033d1 <findAvailableBlockBySize+0x4b>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:64
        {
            printd(DEBUG_MEMORY_MANAGEMENT,"findAvailableBlockBySize: Returning block address 0x%08X\n",mInfo);
 10033b7:	83 ec 04             	sub    esp,0x4
 10033ba:	53                   	push   ebx
 10033bb:	68 8c 87 00 01       	push   0x100878c
 10033c0:	68 00 00 01 00       	push   0x10000
 10033c5:	e8 c9 f1 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:65
            return (uintptr_t*)mInfo;
 10033ca:	89 d8                	mov    eax,ebx
 10033cc:	83 c4 10             	add    esp,0x10
 10033cf:	eb 07                	jmp    10033d8 <findAvailableBlockBySize+0x52>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:67
        }
        mInfo--;
 10033d1:	83 eb 1c             	sub    ebx,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:60
    
    //First try finding a block starting at the last block instead of the first
    //Get to the last block
    while (mInfo->next)
        mInfo++;
    while (mInfo>=heapMemoryInfo)
 10033d4:	39 d8                	cmp    eax,ebx
 10033d6:	76 d4                	jbe    10033ac <findAvailableBlockBySize+0x26>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:69
            printd(DEBUG_MEMORY_MANAGEMENT,"findAvailableBlockBySize: Returning block address 0x%08X\n",mInfo);
            return (uintptr_t*)mInfo;
        }
        mInfo--;
    }
}
 10033d8:	83 c4 08             	add    esp,0x8
 10033db:	5b                   	pop    ebx
 10033dc:	c3                   	ret    

010033dd <allocateBlockFrom>:
allocateBlockFrom():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:73

//Create a new block with the requested amount of memory, and adjust the old block's size and pointer appropriately
uintptr_t* allocateBlockFrom(sMemInfo* mInfoToAllocateFrom, uint32_t size)
{
 10033dd:	57                   	push   edi
 10033de:	56                   	push   esi
 10033df:	53                   	push   ebx
 10033e0:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 10033e4:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:74
    sMemInfo* mNewInfo=findEmptyBlock();
 10033e8:	e8 f3 fe ff ff       	call   10032e0 <findEmptyBlock>
 10033ed:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:77
    sMemInfo* mPriorInfo=mNewInfo-1;
    
    printd(DEBUG_MEMORY_MANAGEMENT,"allocateBlockFrom: findEmptyBlock returned 0x%08X\n",mNewInfo);
 10033ef:	83 ec 04             	sub    esp,0x4
 10033f2:	50                   	push   eax
 10033f3:	68 c8 87 00 01       	push   0x10087c8
 10033f8:	68 00 00 01 00       	push   0x10000
 10033fd:	e8 91 f1 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:79
    
    mPriorInfo->next=(uintptr_t*)mNewInfo;
 1003402:	89 5b fc             	mov    DWORD PTR [ebx-0x4],ebx
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:82
    
    //Set up the new sMemInfo
    mNewInfo->prev=(uintptr_t*)mPriorInfo;
 1003405:	8d 43 e4             	lea    eax,[ebx-0x1c]
 1003408:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:83
    mNewInfo->address=mInfoToAllocateFrom->address;
 100340a:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
 100340d:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:84
    mNewInfo->size=size;
 1003410:	89 7b 08             	mov    DWORD PTR [ebx+0x8],edi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:85
    mNewInfo->inUse=true;
 1003413:	c6 43 0c 01          	mov    BYTE PTR [ebx+0xc],0x1
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:86
    mNewInfo->cr3=CURRENT_CR3;
 1003417:	0f 20 d8             	mov    eax,cr3
 100341a:	89 c0                	mov    eax,eax
 100341c:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:89
    //mNewInfo pid and next don't get set
    
    mInfoToAllocateFrom->address+=size;
 100341f:	01 7e 04             	add    DWORD PTR [esi+0x4],edi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:90
    mInfoToAllocateFrom->size-=size;
 1003422:	29 7e 08             	sub    DWORD PTR [esi+0x8],edi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:91
    return (uintptr_t*)mNewInfo->address;
 1003425:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 1003428:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:92
}
 100342b:	5b                   	pop    ebx
 100342c:	5e                   	pop    esi
 100342d:	5f                   	pop    edi
 100342e:	c3                   	ret    

0100342f <allocPages>:
allocPages():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:95

void* allocPages(uint32_t size)
{
 100342f:	56                   	push   esi
 1003430:	53                   	push   ebx
 1003431:	83 ec 04             	sub    esp,0x4
 1003434:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:97
    uint32_t newSize=size;
    if (newSize%PAGE_SIZE)
 1003438:	89 d8                	mov    eax,ebx
 100343a:	25 ff 0f 00 00       	and    eax,0xfff
 100343f:	74 1e                	je     100345f <allocPages+0x30>
 1003441:	8d b3 00 10 00 00    	lea    esi,[ebx+0x1000]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:99
    {
        newSize+=(PAGE_SIZE-(size % PAGE_SIZE));
 1003447:	29 c6                	sub    esi,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:100
        printd(DEBUG_MEMORY_MANAGEMENT,"allocPages: Size adjusted from %u to %u\n",size,newSize);
 1003449:	56                   	push   esi
 100344a:	53                   	push   ebx
 100344b:	68 fc 87 00 01       	push   0x10087fc
 1003450:	68 00 00 01 00       	push   0x10000
 1003455:	e8 39 f1 ff ff       	call   1002593 <printd>
 100345a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:99
void* allocPages(uint32_t size)
{
    uint32_t newSize=size;
    if (newSize%PAGE_SIZE)
    {
        newSize+=(PAGE_SIZE-(size % PAGE_SIZE));
 100345d:	89 f3                	mov    ebx,esi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:103
        printd(DEBUG_MEMORY_MANAGEMENT,"allocPages: Size adjusted from %u to %u\n",size,newSize);
    }
    uintptr_t* lRetVal;
    uintptr_t* block=findAvailableBlockBySize(newSize);
 100345f:	83 ec 0c             	sub    esp,0xc
 1003462:	53                   	push   ebx
 1003463:	e8 1e ff ff ff       	call   1003386 <findAvailableBlockBySize>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:104
    if ( ((sMemInfo*)(block))->size > newSize)
 1003468:	83 c4 10             	add    esp,0x10
 100346b:	3b 58 08             	cmp    ebx,DWORD PTR [eax+0x8]
 100346e:	73 11                	jae    1003481 <allocPages+0x52>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:105
       lRetVal=allocateBlockFrom((sMemInfo*)block,newSize);
 1003470:	83 ec 08             	sub    esp,0x8
 1003473:	53                   	push   ebx
 1003474:	50                   	push   eax
 1003475:	e8 63 ff ff ff       	call   10033dd <allocateBlockFrom>
 100347a:	89 c6                	mov    esi,eax
 100347c:	83 c4 10             	add    esp,0x10
 100347f:	eb 03                	jmp    1003484 <allocPages+0x55>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:107
    else
        lRetVal=((sMemInfo*)(block))->address;
 1003481:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:109
    //Map page into our address space
    pagingMapPage(CURRENT_CR3,lRetVal,lRetVal,0x7);
 1003484:	0f 20 d8             	mov    eax,cr3
 1003487:	89 c0                	mov    eax,eax
 1003489:	6a 07                	push   0x7
 100348b:	56                   	push   esi
 100348c:	56                   	push   esi
 100348d:	50                   	push   eax
 100348e:	e8 21 0b 00 00       	call   1003fb4 <pagingMapPage>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:111
    //Zero out the memory
    printd(DEBUG_MEMORY_MANAGEMENT,"allocPages: Zeroing out page(s) at 0x%08X for 0x%08X\n",lRetVal,newSize);
 1003493:	53                   	push   ebx
 1003494:	56                   	push   esi
 1003495:	68 28 88 00 01       	push   0x1008828
 100349a:	68 00 00 01 00       	push   0x10000
 100349f:	e8 ef f0 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:112
    memset(lRetVal,0,newSize);
 10034a4:	83 c4 1c             	add    esp,0x1c
 10034a7:	53                   	push   ebx
 10034a8:	6a 00                	push   0x0
 10034aa:	56                   	push   esi
 10034ab:	e8 37 e4 ff ff       	call   10018e7 <memset>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:113
    printd(DEBUG_MEMORY_MANAGEMENT,"allocPages: Returning address 0x%08X\n",lRetVal);
 10034b0:	83 c4 0c             	add    esp,0xc
 10034b3:	56                   	push   esi
 10034b4:	68 60 88 00 01       	push   0x1008860
 10034b9:	68 00 00 01 00       	push   0x10000
 10034be:	e8 d0 f0 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:115
    return lRetVal;
}
 10034c3:	89 f0                	mov    eax,esi
 10034c5:	83 c4 14             	add    esp,0x14
 10034c8:	5b                   	pop    ebx
 10034c9:	5e                   	pop    esi
 10034ca:	c3                   	ret    

010034cb <freePage>:
freePage():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:118

void freePage(void* address)
{
 10034cb:	53                   	push   ebx
 10034cc:	83 ec 14             	sub    esp,0x14
 10034cf:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:119
    sMemInfo* mInfo = findBlockByMemoryAddress(address);
 10034d3:	53                   	push   ebx
 10034d4:	e8 6b fe ff ff       	call   1003344 <findBlockByMemoryAddress>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:120
    if (mInfo!=NULL)
 10034d9:	83 c4 10             	add    esp,0x10
 10034dc:	85 c0                	test   eax,eax
 10034de:	74 1a                	je     10034fa <freePage+0x2f>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:122
    {
        mInfo->inUse=false;
 10034e0:	c6 40 0c 00          	mov    BYTE PTR [eax+0xc],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:123
        printd(DEBUG_MEMORY_MANAGEMENT,"Freed block 0x%08x for memory address 0x%08x\n",mInfo,address);
 10034e4:	53                   	push   ebx
 10034e5:	50                   	push   eax
 10034e6:	68 88 88 00 01       	push   0x1008888
 10034eb:	68 00 00 01 00       	push   0x10000
 10034f0:	e8 9e f0 ff ff       	call   1002593 <printd>
 10034f5:	83 c4 10             	add    esp,0x10
 10034f8:	eb 16                	jmp    1003510 <freePage+0x45>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:126
    }
    else
        printd(DEBUG_MEMORY_MANAGEMENT,"free: Could not find memory block for 0x%08X to free, doing nothing\n",address);
 10034fa:	83 ec 04             	sub    esp,0x4
 10034fd:	53                   	push   ebx
 10034fe:	68 b8 88 00 01       	push   0x10088b8
 1003503:	68 00 00 01 00       	push   0x10000
 1003508:	e8 86 f0 ff ff       	call   1002593 <printd>
 100350d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:127
}
 1003510:	83 c4 08             	add    esp,0x8
 1003513:	5b                   	pop    ebx
 1003514:	c3                   	ret    

01003515 <mallocA1k>:
mallocA1k():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:134
uintptr_t* mallocA1k(uint32_t size)
{
    uintptr_t* lRetVal=0;
    
    return lRetVal;
}
 1003515:	b8 00 00 00 00       	mov    eax,0x0
 100351a:	c3                   	ret    

0100351b <memAvailable>:
memAvailable():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:139

uint32_t memAvailable()
{
    uint32_t lRetVal;
    sMemInfo* mInfo=heapMemoryInfo;
 100351b:	8b 15 60 4a 01 01    	mov    edx,DWORD PTR ds:0x1014a60
 1003521:	8d 8a 80 f6 0b 00    	lea    ecx,[edx+0xbf680]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:143

    do
    {
        if (!mInfo->inUse)
 1003527:	80 7a 0c 00          	cmp    BYTE PTR [edx+0xc],0x0
 100352b:	75 03                	jne    1003530 <memAvailable+0x15>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:144
            lRetVal+=mInfo->size;
 100352d:	03 42 08             	add    eax,DWORD PTR [edx+0x8]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:145
        mInfo++;
 1003530:	83 c2 1c             	add    edx,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:146
    } while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000));
 1003533:	39 ca                	cmp    edx,ecx
 1003535:	75 f0                	jne    1003527 <memAvailable+0xc>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:148
    return lRetVal;
}
 1003537:	f3 c3                	repz ret 
 1003539:	66 90                	xchg   ax,ax
 100353b:	90                   	nop

0100353c <initHeapPagePtr>:
initHeapPagePtr():
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:37
    kHeapPagePtr->prev=NO_PREV_HEAP_PTR;
    initHeapPagePtr(kHeapPagePtr);
}

void initHeapPagePtr(heapPtrPage* pagePtr)
{
 100353c:	53                   	push   ebx
 100353d:	83 ec 08             	sub    esp,0x8
 1003540:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:38
    printd(DEBUG_MALLOC,"initHeapPagePtr Initializing pointer page @ 0x%08X, 0x%08X pointers\n",pagePtr,POINTERS_PER_HEAP_PTR_PAGE);
 1003544:	68 ff 01 00 00       	push   0x1ff
 1003549:	53                   	push   ebx
 100354a:	68 00 89 00 01       	push   0x1008900
 100354f:	68 00 00 08 00       	push   0x80000
 1003554:	e8 3a f0 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:39
    pagePtr->next=NO_NEXT_HEAP_PTR;
 1003559:	c7 83 fc 0f 00 00 ff 	mov    DWORD PTR [ebx+0xffc],0xffffffff
 1003560:	ff ff ff 
 1003563:	8d 43 04             	lea    eax,[ebx+0x4]
 1003566:	8d 93 fc 0f 00 00    	lea    edx,[ebx+0xffc]
 100356c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:42 (discriminator 3)
    for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
    {
        pagePtr->ptrs[cnt].address=NULL;
 100356f:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:43 (discriminator 3)
        pagePtr->ptrs[cnt].size=0;
 1003575:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
 100357c:	83 c0 08             	add    eax,0x8
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:40 (discriminator 3)

void initHeapPagePtr(heapPtrPage* pagePtr)
{
    printd(DEBUG_MALLOC,"initHeapPagePtr Initializing pointer page @ 0x%08X, 0x%08X pointers\n",pagePtr,POINTERS_PER_HEAP_PTR_PAGE);
    pagePtr->next=NO_NEXT_HEAP_PTR;
    for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
 100357f:	39 d0                	cmp    eax,edx
 1003581:	75 ec                	jne    100356f <initHeapPagePtr+0x33>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:45
    {
        pagePtr->ptrs[cnt].address=NULL;
        pagePtr->ptrs[cnt].size=0;
    }
    printd(DEBUG_MALLOC,"initHeapPagePtr Done\n",pagePtr);
 1003583:	83 ec 04             	sub    esp,0x4
 1003586:	53                   	push   ebx
 1003587:	68 e7 79 00 01       	push   0x10079e7
 100358c:	68 00 00 08 00       	push   0x80000
 1003591:	e8 fd ef ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:46
}
 1003596:	83 c4 18             	add    esp,0x18
 1003599:	5b                   	pop    ebx
 100359a:	c3                   	ret    

0100359b <initMalloc>:
initMalloc():
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:30
                      cr3Val;})

void initHeapPagePtr(heapPtrPage* pagePtr);

void initMalloc()
{
 100359b:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:31
    kHeapPagePtr = allocPages(sizeof(heapPtrPage));
 100359e:	68 00 10 00 00       	push   0x1000
 10035a3:	e8 87 fe ff ff       	call   100342f <allocPages>
 10035a8:	a3 50 4a 01 01       	mov    ds:0x1014a50,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:32
    kHeapPagePtr->prev=NO_PREV_HEAP_PTR;
 10035ad:	c7 00 fe ff ff ff    	mov    DWORD PTR [eax],0xfffffffe
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:33
    initHeapPagePtr(kHeapPagePtr);
 10035b3:	83 c4 04             	add    esp,0x4
 10035b6:	ff 35 50 4a 01 01    	push   DWORD PTR ds:0x1014a50
 10035bc:	e8 7b ff ff ff       	call   100353c <initHeapPagePtr>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:34
}
 10035c1:	83 c4 1c             	add    esp,0x1c
 10035c4:	c3                   	ret    

010035c5 <findFreeMallocPointer>:
findFreeMallocPointer():
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:49
    }
    printd(DEBUG_MALLOC,"initHeapPagePtr Done\n",pagePtr);
}

void* findFreeMallocPointer()
{
 10035c5:	56                   	push   esi
 10035c6:	53                   	push   ebx
 10035c7:	83 ec 04             	sub    esp,0x4
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:50
    heapPtrPage* ptrPg=kHeapPagePtr;
 10035ca:	8b 35 50 4a 01 01    	mov    esi,DWORD PTR ds:0x1014a50
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:55
    heapPtrPage* newPtrPage;

    while (1==1)
    {
        printd(DEBUG_MALLOC,"findFreeMallocPointer: Scanning for a free memory pointer\n");
 10035d0:	83 ec 08             	sub    esp,0x8
 10035d3:	68 48 89 00 01       	push   0x1008948
 10035d8:	68 00 00 08 00       	push   0x80000
 10035dd:	e8 b1 ef ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:57
        for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
        if (ptrPg->ptrs[cnt].address==NULL)
 10035e2:	83 c4 10             	add    esp,0x10
 10035e5:	83 7e 04 00          	cmp    DWORD PTR [esi+0x4],0x0
 10035e9:	74 11                	je     10035fc <findFreeMallocPointer+0x37>
 10035eb:	bb 01 00 00 00       	mov    ebx,0x1
 10035f0:	83 7c de 04 00       	cmp    DWORD PTR [esi+ebx*8+0x4],0x0
 10035f5:	75 0f                	jne    1003606 <findFreeMallocPointer+0x41>
 10035f7:	e9 8c 00 00 00       	jmp    1003688 <findFreeMallocPointer+0xc3>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:56
    heapPtrPage* newPtrPage;

    while (1==1)
    {
        printd(DEBUG_MALLOC,"findFreeMallocPointer: Scanning for a free memory pointer\n");
        for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
 10035fc:	bb 00 00 00 00       	mov    ebx,0x0
 1003601:	e9 82 00 00 00       	jmp    1003688 <findFreeMallocPointer+0xc3>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:56 (discriminator 2)
 1003606:	83 c3 01             	add    ebx,0x1
 1003609:	81 fb ff 01 00 00    	cmp    ebx,0x1ff
 100360f:	75 df                	jne    10035f0 <findFreeMallocPointer+0x2b>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:64
            printd(DEBUG_MALLOC,"findFreeMallocPointer: Found memory pointer on page 0 (0x%08X)\n",ptrPg);
            return &ptrPg->ptrs[cnt];
        }
        
        //If we've reached the last memory pointer on the page
        if (ptrPg->next==NO_NEXT_HEAP_PTR)
 1003611:	83 be fc 0f 00 00 ff 	cmp    DWORD PTR [esi+0xffc],0xffffffff
 1003618:	75 48                	jne    1003662 <findFreeMallocPointer+0x9d>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:66
        {
            printd(DEBUG_MALLOC,"No next heapPtrPage, creating one\n",ptrPg->next);
 100361a:	83 ec 04             	sub    esp,0x4
 100361d:	6a ff                	push   0xffffffff
 100361f:	68 c4 89 00 01       	push   0x10089c4
 1003624:	68 00 00 08 00       	push   0x80000
 1003629:	e8 65 ef ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:68
            //Create a new page and link it to the existing one
            newPtrPage=allocPages(sizeof(heapPtrPage));
 100362e:	c7 04 24 00 10 00 00 	mov    DWORD PTR [esp],0x1000
 1003635:	e8 f5 fd ff ff       	call   100342f <allocPages>
 100363a:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:69
            initHeapPagePtr(newPtrPage);
 100363c:	89 04 24             	mov    DWORD PTR [esp],eax
 100363f:	e8 f8 fe ff ff       	call   100353c <initHeapPagePtr>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:70
            ptrPg->next=newPtrPage;
 1003644:	89 9e fc 0f 00 00    	mov    DWORD PTR [esi+0xffc],ebx
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:71
            newPtrPage->prev=ptrPg;
 100364a:	89 33                	mov    DWORD PTR [ebx],esi
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:72
            printd(DEBUG_MALLOC,"Initialized new heapPtrPage @ 0x%08X\n\n",newPtrPage);
 100364c:	83 c4 0c             	add    esp,0xc
 100364f:	53                   	push   ebx
 1003650:	68 e8 89 00 01       	push   0x10089e8
 1003655:	68 00 00 08 00       	push   0x80000
 100365a:	e8 34 ef ff ff       	call   1002593 <printd>
 100365f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:74
        }
        printd(DEBUG_MALLOC,"Moving to next heapPtrPage @ 0x%08X\n",ptrPg->next);
 1003662:	83 ec 04             	sub    esp,0x4
 1003665:	ff b6 fc 0f 00 00    	push   DWORD PTR [esi+0xffc]
 100366b:	68 10 8a 00 01       	push   0x1008a10
 1003670:	68 00 00 08 00       	push   0x80000
 1003675:	e8 19 ef ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:75
        ptrPg=(heapPtrPage*)ptrPg->next;
 100367a:	8b b6 fc 0f 00 00    	mov    esi,DWORD PTR [esi+0xffc]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:76
    }
 1003680:	83 c4 10             	add    esp,0x10
 1003683:	e9 48 ff ff ff       	jmp    10035d0 <findFreeMallocPointer+0xb>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:59
    {
        printd(DEBUG_MALLOC,"findFreeMallocPointer: Scanning for a free memory pointer\n");
        for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
        if (ptrPg->ptrs[cnt].address==NULL)
        {
            printd(DEBUG_MALLOC,"findFreeMallocPointer: Found memory pointer on page 0 (0x%08X)\n",ptrPg);
 1003688:	83 ec 04             	sub    esp,0x4
 100368b:	56                   	push   esi
 100368c:	68 84 89 00 01       	push   0x1008984
 1003691:	68 00 00 08 00       	push   0x80000
 1003696:	e8 f8 ee ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:60
            return &ptrPg->ptrs[cnt];
 100369b:	8d 44 de 04          	lea    eax,[esi+ebx*8+0x4]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:78
        }
        printd(DEBUG_MALLOC,"Moving to next heapPtrPage @ 0x%08X\n",ptrPg->next);
        ptrPg=(heapPtrPage*)ptrPg->next;
    }
    panic("findFreeMallocPointer: Should not have gotten to this point");
}
 100369f:	83 c4 14             	add    esp,0x14
 10036a2:	5b                   	pop    ebx
 10036a3:	5e                   	pop    esi
 10036a4:	c3                   	ret    

010036a5 <allocateMemoryToProcess>:
allocateMemoryToProcess():
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:81

void allocateMemoryToProcess(heapPtr* ptr, size_t size)
{
 10036a5:	55                   	push   ebp
 10036a6:	57                   	push   edi
 10036a7:	56                   	push   esi
 10036a8:	53                   	push   ebx
 10036a9:	83 ec 1c             	sub    esp,0x1c
 10036ac:	8b 7c 24 30          	mov    edi,DWORD PTR [esp+0x30]
 10036b0:	8b 6c 24 34          	mov    ebp,DWORD PTR [esp+0x34]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:85
    uint32_t newSize=size;
    uint32_t* allocdPage;
    
    if (newSize%PAGE_SIZE)
 10036b4:	89 e8                	mov    eax,ebp
 10036b6:	25 ff 0f 00 00       	and    eax,0xfff
 10036bb:	74 1e                	je     10036db <allocateMemoryToProcess+0x36>
 10036bd:	8d 9d 00 10 00 00    	lea    ebx,[ebp+0x1000]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:87
    {
        newSize+=(PAGE_SIZE-(size % PAGE_SIZE));
 10036c3:	29 c3                	sub    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:88
        printd(DEBUG_MALLOC,"allocateMemoryToProcess: Size adjusted from %u to %u\n",size,newSize);
 10036c5:	53                   	push   ebx
 10036c6:	55                   	push   ebp
 10036c7:	68 38 8a 00 01       	push   0x1008a38
 10036cc:	68 00 00 08 00       	push   0x80000
 10036d1:	e8 bd ee ff ff       	call   1002593 <printd>
 10036d6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:87
    uint32_t newSize=size;
    uint32_t* allocdPage;
    
    if (newSize%PAGE_SIZE)
    {
        newSize+=(PAGE_SIZE-(size % PAGE_SIZE));
 10036d9:	89 dd                	mov    ebp,ebx
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:91
        printd(DEBUG_MALLOC,"allocateMemoryToProcess: Size adjusted from %u to %u\n",size,newSize);
    }

    allocdPage=allocPages(newSize);
 10036db:	83 ec 0c             	sub    esp,0xc
 10036de:	55                   	push   ebp
 10036df:	e8 4b fd ff ff       	call   100342f <allocPages>
 10036e4:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:92
    printd(DEBUG_MALLOC,"Used allocPages to allocate 0x%08X bytes at 0x%08X\n",ptr->size,allocdPage);
 10036e6:	50                   	push   eax
 10036e7:	ff 77 04             	push   DWORD PTR [edi+0x4]
 10036ea:	68 70 8a 00 01       	push   0x1008a70
 10036ef:	68 00 00 08 00       	push   0x80000
 10036f4:	e8 9a ee ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:93
    uintptr_t virtualAddress=pagingFindAvailableAddressToMapTo(CURRENT_CR3,newSize/PAGE_SIZE);
 10036f9:	0f 20 d8             	mov    eax,cr3
 10036fc:	89 c0                	mov    eax,eax
 10036fe:	83 c4 18             	add    esp,0x18
 1003701:	89 ea                	mov    edx,ebp
 1003703:	c1 ea 0c             	shr    edx,0xc
 1003706:	52                   	push   edx
 1003707:	50                   	push   eax
 1003708:	e8 db 03 00 00       	call   1003ae8 <pagingFindAvailableAddressToMapTo>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:94
    ptr->address=virtualAddress;
 100370d:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
 1003711:	89 07                	mov    DWORD PTR [edi],eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:95
    printd(DEBUG_MALLOC,"before for loop: newSize=0x%08X, physialAddress=0x%08X, stop=0x%08X\n",newSize, allocdPage,(uint32_t)(allocdPage)+newSize);
 1003713:	8d 34 2b             	lea    esi,[ebx+ebp*1]
 1003716:	89 34 24             	mov    DWORD PTR [esp],esi
 1003719:	53                   	push   ebx
 100371a:	55                   	push   ebp
 100371b:	68 a4 8a 00 01       	push   0x1008aa4
 1003720:	68 00 00 08 00       	push   0x80000
 1003725:	e8 69 ee ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:96
    for (void* physicalAddress=allocdPage;physicalAddress<(uint32_t)(allocdPage)+newSize;physicalAddress+=PAGE_SIZE)
 100372a:	89 74 24 28          	mov    DWORD PTR [esp+0x28],esi
 100372e:	83 c4 20             	add    esp,0x20
 1003731:	39 f3                	cmp    ebx,esi
 1003733:	73 40                	jae    1003775 <allocateMemoryToProcess+0xd0>
 1003735:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
 1003739:	81 c6 00 10 00 00    	add    esi,0x1000
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:98
    {
        pagingMapPage(CURRENT_CR3,virtualAddress+=PAGE_SIZE,physicalAddress,0x03);
 100373f:	0f 20 d8             	mov    eax,cr3
 1003742:	89 c5                	mov    ebp,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:98 (discriminator 3)
 1003744:	6a 03                	push   0x3
 1003746:	53                   	push   ebx
 1003747:	56                   	push   esi
 1003748:	55                   	push   ebp
 1003749:	e8 66 08 00 00       	call   1003fb4 <pagingMapPage>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:99 (discriminator 3)
        printd(DEBUG_MALLOC,"allocateMemoryToProcess: Mapped 0x%08X to 0x%08X\n",physicalAddress,ptr->address);
 100374e:	ff 37                	push   DWORD PTR [edi]
 1003750:	53                   	push   ebx
 1003751:	68 ec 8a 00 01       	push   0x1008aec
 1003756:	68 00 00 08 00       	push   0x80000
 100375b:	e8 33 ee ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:96 (discriminator 3)
    allocdPage=allocPages(newSize);
    printd(DEBUG_MALLOC,"Used allocPages to allocate 0x%08X bytes at 0x%08X\n",ptr->size,allocdPage);
    uintptr_t virtualAddress=pagingFindAvailableAddressToMapTo(CURRENT_CR3,newSize/PAGE_SIZE);
    ptr->address=virtualAddress;
    printd(DEBUG_MALLOC,"before for loop: newSize=0x%08X, physialAddress=0x%08X, stop=0x%08X\n",newSize, allocdPage,(uint32_t)(allocdPage)+newSize);
    for (void* physicalAddress=allocdPage;physicalAddress<(uint32_t)(allocdPage)+newSize;physicalAddress+=PAGE_SIZE)
 1003760:	81 c3 00 10 00 00    	add    ebx,0x1000
 1003766:	81 c6 00 20 00 00    	add    esi,0x2000
 100376c:	83 c4 20             	add    esp,0x20
 100376f:	3b 5c 24 08          	cmp    ebx,DWORD PTR [esp+0x8]
 1003773:	72 cf                	jb     1003744 <allocateMemoryToProcess+0x9f>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:102
    {
        pagingMapPage(CURRENT_CR3,virtualAddress+=PAGE_SIZE,physicalAddress,0x03);
        printd(DEBUG_MALLOC,"allocateMemoryToProcess: Mapped 0x%08X to 0x%08X\n",physicalAddress,ptr->address);
        virtualAddress+=PAGE_SIZE;
    }
}
 1003775:	83 c4 1c             	add    esp,0x1c
 1003778:	5b                   	pop    ebx
 1003779:	5e                   	pop    esi
 100377a:	5f                   	pop    edi
 100377b:	5d                   	pop    ebp
 100377c:	c3                   	ret    

0100377d <malloc>:
malloc():
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:106


void* malloc(size_t size)
{
 100377d:	56                   	push   esi
 100377e:	53                   	push   ebx
 100377f:	83 ec 04             	sub    esp,0x4
 1003782:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:110
    heapPtr* ptr;
    
    //First find a page to place the memory pointer on
    ptr=findFreeMallocPointer();
 1003786:	e8 3a fe ff ff       	call   10035c5 <findFreeMallocPointer>
 100378b:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:113
    //Next get a memory address to point to and map the memory into the process
    
    ptr->address=0;
 100378d:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:114
    ptr->size=size;
 1003793:	89 70 04             	mov    DWORD PTR [eax+0x4],esi
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:115
    allocateMemoryToProcess(ptr,size);
 1003796:	83 ec 08             	sub    esp,0x8
 1003799:	56                   	push   esi
 100379a:	50                   	push   eax
 100379b:	e8 05 ff ff ff       	call   10036a5 <allocateMemoryToProcess>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:116
    return ptr->address;
 10037a0:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:117
 10037a2:	83 c4 14             	add    esp,0x14
 10037a5:	5b                   	pop    ebx
 10037a6:	5e                   	pop    esi
 10037a7:	c3                   	ret    

010037a8 <mmInitHeapTracking>:
mmInitHeapTracking():
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:36
uint32_t kernelPoolMemorySize=1400000;   //20 MB kernel memory

sMemInfo* heapMemoryInfo;

void mmInitHeapTracking()
{
 10037a8:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:37
    heapMemoryInfo=kmmHeapMemoryBaseAddress;
 10037ab:	a1 04 05 12 00       	mov    eax,ds:0x120504
 10037b0:	a3 60 4a 01 01       	mov    ds:0x1014a60,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:38
    printd(DEBUG_MEMORY_MANAGEMENT,"Assigning heapMemoryInfo address of 0x%08X\n",heapMemoryInfo);
 10037b5:	50                   	push   eax
 10037b6:	68 20 8b 00 01       	push   0x1008b20
 10037bb:	68 00 00 01 00       	push   0x10000
 10037c0:	e8 ce ed ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:42
    
    kmmHeapMemoryBaseAddress += sizeof(sMemInfo)*1000;
    kmmHeapMemoryBaseAddress += 0x1000;
    kmmHeapMemoryBaseAddress &= 0xFFFFF000;
 10037c5:	a1 04 05 12 00       	mov    eax,ds:0x120504
 10037ca:	05 60 7d 00 00       	add    eax,0x7d60
 10037cf:	25 00 f0 ff ff       	and    eax,0xfffff000
 10037d4:	a3 04 05 12 00       	mov    ds:0x120504,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:43
    kmmHeapMemoryTotal-= sizeof(sMemInfo)*1000; 
 10037d9:	81 2d 08 05 12 00 60 	sub    DWORD PTR ds:0x120508,0x6d60
 10037e0:	6d 00 00 
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:44
    printd(DEBUG_MEMORY_MANAGEMENT,"heapMemoryInfo = 0x%08X\n",heapMemoryInfo);
 10037e3:	83 c4 0c             	add    esp,0xc
 10037e6:	ff 35 60 4a 01 01    	push   DWORD PTR ds:0x1014a60
 10037ec:	68 fd 79 00 01       	push   0x10079fd
 10037f1:	68 00 00 01 00       	push   0x10000
 10037f6:	e8 98 ed ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:45
    printd(DEBUG_MEMORY_MANAGEMENT,"Allocating 0x%08X bytes to memory block tracking\n",sizeof(sMemInfo)*1000);
 10037fb:	83 c4 0c             	add    esp,0xc
 10037fe:	68 60 6d 00 00       	push   0x6d60
 1003803:	68 4c 8b 00 01       	push   0x1008b4c
 1003808:	68 00 00 01 00       	push   0x10000
 100380d:	e8 81 ed ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:46
    printd(DEBUG_MEMORY_MANAGEMENT,"User memory base adjusted to 0x%08X\n",kmmHeapMemoryBaseAddress);
 1003812:	83 c4 0c             	add    esp,0xc
 1003815:	ff 35 04 05 12 00    	push   DWORD PTR ds:0x120504
 100381b:	68 80 8b 00 01       	push   0x1008b80
 1003820:	68 00 00 01 00       	push   0x10000
 1003825:	e8 69 ed ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:47
    printd(DEBUG_MEMORY_MANAGEMENT,"User memory size adjusted to 0x%08X\n",kmmHeapMemoryTotal);
 100382a:	83 c4 0c             	add    esp,0xc
 100382d:	ff 35 08 05 12 00    	push   DWORD PTR ds:0x120508
 1003833:	68 a8 8b 00 01       	push   0x1008ba8
 1003838:	68 00 00 01 00       	push   0x10000
 100383d:	e8 51 ed ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:49

    heapMemoryInfo->address=kmmHeapMemoryBaseAddress;
 1003842:	a1 60 4a 01 01       	mov    eax,ds:0x1014a60
 1003847:	8b 15 04 05 12 00    	mov    edx,DWORD PTR ds:0x120504
 100384d:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:50
    heapMemoryInfo->size=kmmHeapMemoryTotal;
 1003850:	8b 15 08 05 12 00    	mov    edx,DWORD PTR ds:0x120508
 1003856:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:51
    heapMemoryInfo->next=NULL;
 1003859:	c7 40 18 00 00 00 00 	mov    DWORD PTR [eax+0x18],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:52
    heapMemoryInfo->prev=NULL;
 1003860:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1003866:	83 c4 10             	add    esp,0x10
 1003869:	b8 1c 00 00 00       	mov    eax,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:54
    
    for (int cnt=1;cnt<1000;cnt++)
 100386e:	ba 01 00 00 00       	mov    edx,0x1
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:56
    {
        heapMemoryInfo[cnt].address=0;
 1003873:	89 c1                	mov    ecx,eax
 1003875:	03 0d 60 4a 01 01    	add    ecx,DWORD PTR ds:0x1014a60
 100387b:	c7 41 04 00 00 00 00 	mov    DWORD PTR [ecx+0x4],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:57
        heapMemoryInfo[cnt].prev=NULL;
 1003882:	c7 01 00 00 00 00    	mov    DWORD PTR [ecx],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:58
        if (cnt<999)
 1003888:	81 fa e6 03 00 00    	cmp    edx,0x3e6
 100388e:	7f 0e                	jg     100389e <mmInitHeapTracking+0xf6>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:59
            heapMemoryInfo[cnt].next=NULL;
 1003890:	8b 0d 60 4a 01 01    	mov    ecx,DWORD PTR ds:0x1014a60
 1003896:	c7 44 01 18 00 00 00 	mov    DWORD PTR [ecx+eax*1+0x18],0x0
 100389d:	00 
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:60 (discriminator 2)
        heapMemoryInfo[cnt].inUse=false;
 100389e:	89 c1                	mov    ecx,eax
 10038a0:	03 0d 60 4a 01 01    	add    ecx,DWORD PTR ds:0x1014a60
 10038a6:	c6 41 0c 00          	mov    BYTE PTR [ecx+0xc],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:61 (discriminator 2)
        heapMemoryInfo[cnt].pid=0;
 10038aa:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:62 (discriminator 2)
        heapMemoryInfo[cnt].size=0;
 10038b1:	c7 41 08 00 00 00 00 	mov    DWORD PTR [ecx+0x8],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:54 (discriminator 2)
    heapMemoryInfo->address=kmmHeapMemoryBaseAddress;
    heapMemoryInfo->size=kmmHeapMemoryTotal;
    heapMemoryInfo->next=NULL;
    heapMemoryInfo->prev=NULL;
    
    for (int cnt=1;cnt<1000;cnt++)
 10038b8:	83 c2 01             	add    edx,0x1
 10038bb:	83 c0 1c             	add    eax,0x1c
 10038be:	81 fa e8 03 00 00    	cmp    edx,0x3e8
 10038c4:	75 ad                	jne    1003873 <mmInitHeapTracking+0xcb>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:64
            heapMemoryInfo[cnt].next=NULL;
        heapMemoryInfo[cnt].inUse=false;
        heapMemoryInfo[cnt].pid=0;
        heapMemoryInfo[cnt].size=0;
    }
}
 10038c6:	83 c4 0c             	add    esp,0xc
 10038c9:	c3                   	ret    

010038ca <mmInit>:
mmInit():
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:68


void mmInit()
{
 10038ca:	56                   	push   esi
 10038cb:	53                   	push   ebx
 10038cc:	83 ec 04             	sub    esp,0x4
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:70
    //0x10000000 represents segment 0xC0000000-0xCFFFFFFF ... don't want to map anything there for now
    kernelMemoryUsed=kernelStart + kernelSize;
 10038cf:	a1 0c 48 00 01       	mov    eax,ds:0x100480c
 10038d4:	03 05 08 48 00 01    	add    eax,DWORD PTR ds:0x1004808
 10038da:	a3 5c 4a 01 01       	mov    ds:0x1014a5c,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:71
    kmmGrossUserMemoryAvailable=kE820MemoryBytes - kernelMemoryUsed;
 10038df:	8b 0d 48 00 12 00    	mov    ecx,DWORD PTR ds:0x120048
 10038e5:	8b 1d 4c 00 12 00    	mov    ebx,DWORD PTR ds:0x12004c
 10038eb:	89 ca                	mov    edx,ecx
 10038ed:	29 c2                	sub    edx,eax
 10038ef:	89 15 00 05 12 00    	mov    DWORD PTR ds:0x120500,edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:72
    kmmHeapMemoryTotal=kmmGrossUserMemoryAvailable - kernelPoolMemorySize - kernelMemoryUsed;
 10038f5:	8b 35 04 48 00 01    	mov    esi,DWORD PTR ds:0x1004804
 10038fb:	29 f2                	sub    edx,esi
 10038fd:	29 c2                	sub    edx,eax
 10038ff:	89 15 08 05 12 00    	mov    DWORD PTR ds:0x120508,edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:73
    kmmHeapMemoryBaseAddress=(kernelMemoryUsed + 0x100000) & 0xFFFFF000 ;
 1003905:	05 00 00 10 00       	add    eax,0x100000
 100390a:	25 00 f0 ff ff       	and    eax,0xfffff000
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:74
    kKernelPoolMemoryAddress=kmmHeapMemoryBaseAddress;
 100390f:	a3 64 4a 01 01       	mov    ds:0x1014a64,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:75
    kmmHeapMemoryBaseAddress+=kernelPoolMemorySize; //Need some page table memory but we don't want to use Malloc while creating page tables to get it
 1003914:	01 f0                	add    eax,esi
 1003916:	a3 04 05 12 00       	mov    ds:0x120504,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:77
    //Setup the base of the heap
    kMallocBaseAddress=kmmHeapMemoryBaseAddress;
 100391b:	a3 fc 04 12 00       	mov    ds:0x1204fc,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:78
    kMallocCurrAddress=kMallocBaseAddress;
 1003920:	a3 f8 04 12 00       	mov    ds:0x1204f8,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:80
    
    printd(DEBUG_MEMORY_MANAGEMENT,"E820 memory total: %u kb\n", kE820MemoryBytes/1024);
 1003925:	0f ac d9 0a          	shrd   ecx,ebx,0xa
 1003929:	c1 eb 0a             	shr    ebx,0xa
 100392c:	53                   	push   ebx
 100392d:	51                   	push   ecx
 100392e:	68 16 7a 00 01       	push   0x1007a16
 1003933:	68 00 00 01 00       	push   0x10000
 1003938:	e8 56 ec ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:81
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory used by the kernel: %u\n",kernelMemoryUsed);
 100393d:	83 c4 0c             	add    esp,0xc
 1003940:	ff 35 5c 4a 01 01    	push   DWORD PTR ds:0x1014a5c
 1003946:	68 d0 8b 00 01       	push   0x1008bd0
 100394b:	68 00 00 01 00       	push   0x10000
 1003950:	e8 3e ec ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:82
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory available to mm: %u kb\n",kmmGrossUserMemoryAvailable/1024);
 1003955:	83 c4 0c             	add    esp,0xc
 1003958:	a1 00 05 12 00       	mov    eax,ds:0x120500
 100395d:	c1 e8 0a             	shr    eax,0xa
 1003960:	50                   	push   eax
 1003961:	68 f0 8b 00 01       	push   0x1008bf0
 1003966:	68 00 00 01 00       	push   0x10000
 100396b:	e8 23 ec ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:83
    printd(DEBUG_MEMORY_MANAGEMENT,"Total memory availabe to user applications: %u kb\n",(kmmGrossUserMemoryAvailable - kernelPoolMemorySize)/1024);
 1003970:	83 c4 0c             	add    esp,0xc
 1003973:	a1 00 05 12 00       	mov    eax,ds:0x120500
 1003978:	2b 05 04 48 00 01    	sub    eax,DWORD PTR ds:0x1004804
 100397e:	c1 e8 0a             	shr    eax,0xa
 1003981:	50                   	push   eax
 1003982:	68 10 8c 00 01       	push   0x1008c10
 1003987:	68 00 00 01 00       	push   0x10000
 100398c:	e8 02 ec ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:84
    printd(DEBUG_MEMORY_MANAGEMENT,"Initializing memory manager\n\n");
 1003991:	83 c4 08             	add    esp,0x8
 1003994:	68 30 7a 00 01       	push   0x1007a30
 1003999:	68 00 00 01 00       	push   0x10000
 100399e:	e8 f0 eb ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:85
    printd(DEBUG_MEMORY_MANAGEMENT,"Pool\t\tAddress\t\t\tLength\t\t\n");
 10039a3:	83 c4 08             	add    esp,0x8
 10039a6:	68 4e 7a 00 01       	push   0x1007a4e
 10039ab:	68 00 00 01 00       	push   0x10000
 10039b0:	e8 de eb ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:86
    printd(DEBUG_MEMORY_MANAGEMENT,"Kernel\t0x%08X\t\t0x%08X\n",kKernelPoolMemoryAddress,kernelPoolMemorySize);
 10039b5:	ff 35 04 48 00 01    	push   DWORD PTR ds:0x1004804
 10039bb:	ff 35 64 4a 01 01    	push   DWORD PTR ds:0x1014a64
 10039c1:	68 68 7a 00 01       	push   0x1007a68
 10039c6:	68 00 00 01 00       	push   0x10000
 10039cb:	e8 c3 eb ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:87
    printd(DEBUG_MEMORY_MANAGEMENT,"User\t\t0x%08X\t\t0x%08X\n",kmmHeapMemoryBaseAddress,kmmHeapMemoryTotal);
 10039d0:	83 c4 20             	add    esp,0x20
 10039d3:	ff 35 08 05 12 00    	push   DWORD PTR ds:0x120508
 10039d9:	ff 35 04 05 12 00    	push   DWORD PTR ds:0x120504
 10039df:	68 7f 7a 00 01       	push   0x1007a7f
 10039e4:	68 00 00 01 00       	push   0x10000
 10039e9:	e8 a5 eb ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:89

    mmInitHeapTracking();    
 10039ee:	e8 b5 fd ff ff       	call   10037a8 <mmInitHeapTracking>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:92
    //We need to
    uintptr_t startAddr=0x0;
    uintptr_t endAddr= (kernelMemoryUsed + 0x1000) & 0xFFFFF000;
 10039f3:	a1 5c 4a 01 01       	mov    eax,ds:0x1014a5c
 10039f8:	8d 98 00 10 00 00    	lea    ebx,[eax+0x1000]
 10039fe:	81 e3 00 f0 ff ff    	and    ebx,0xfffff000
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:94
    //Mark everything from the beginning of memory (0xC0000000) to the end of the kernel objects as in-use
    printd(DEBUG_KERNEL_PAGING,"Setting kernel memory range from 0x%08X-0x%08X as in-use\n",startAddr,endAddr);
 1003a04:	53                   	push   ebx
 1003a05:	6a 00                	push   0x0
 1003a07:	68 44 8c 00 01       	push   0x1008c44
 1003a0c:	68 00 80 00 00       	push   0x8000
 1003a11:	e8 7d eb ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:95
    mmKernelSetPageRangeInUseFlag(startAddr,
 1003a16:	83 c4 20             	add    esp,0x20
 1003a19:	6a 01                	push   0x1
 1003a1b:	68 00 10 00 00       	push   0x1000
 1003a20:	8d 43 01             	lea    eax,[ebx+0x1]
 1003a23:	50                   	push   eax
 1003a24:	6a 00                	push   0x0
 1003a26:	e8 ce dc ff ff       	call   10016f9 <mmKernelSetPageRangeInUseFlag>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:101
            endAddr+1,
            0x1000, /*page size*/
            true);
    startAddr+=0xc0000000;
    endAddr+=0xc0000000;
    printd(DEBUG_KERNEL_PAGING,"Setting kernel memory range from 0x%08X-0x%08X as in-use\n",startAddr,endAddr);
 1003a2b:	8d 83 00 00 00 c0    	lea    eax,[ebx-0x40000000]
 1003a31:	50                   	push   eax
 1003a32:	68 00 00 00 c0       	push   0xc0000000
 1003a37:	68 44 8c 00 01       	push   0x1008c44
 1003a3c:	68 00 80 00 00       	push   0x8000
 1003a41:	e8 4d eb ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:102
    mmKernelSetPageRangeInUseFlag(startAddr,
 1003a46:	83 c4 20             	add    esp,0x20
 1003a49:	6a 01                	push   0x1
 1003a4b:	68 00 10 00 00       	push   0x1000
 1003a50:	81 eb ff ff ff 3f    	sub    ebx,0x3fffffff
 1003a56:	53                   	push   ebx
 1003a57:	68 00 00 00 c0       	push   0xc0000000
 1003a5c:	e8 98 dc ff ff       	call   10016f9 <mmKernelSetPageRangeInUseFlag>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:107
            endAddr+1,
            0x1000, /*page size*/
            true);

    startAddr=kmmHeapMemoryBaseAddress; 
 1003a61:	8b 1d 04 05 12 00    	mov    ebx,DWORD PTR ds:0x120504
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:108
    printd(DEBUG_KERNEL_PAGING,"Zeroing page entries for memory range 0x%08X-0x%08X",startAddr,0x9FFFFFFF);
 1003a67:	68 ff ff ff 9f       	push   0x9fffffff
 1003a6c:	53                   	push   ebx
 1003a6d:	68 80 8c 00 01       	push   0x1008c80
 1003a72:	68 00 80 00 00       	push   0x8000
 1003a77:	e8 17 eb ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:109
    for (uintptr_t cnt=startAddr;cnt<=0x9FFFFFFF;cnt+=0x1000)
 1003a7c:	83 c4 20             	add    esp,0x20
 1003a7f:	81 fb ff ff ff 9f    	cmp    ebx,0x9fffffff
 1003a85:	77 4c                	ja     1003ad3 <mmInit+0x209>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:113
    {
        if (cnt<0xC0000000 || cnt>0xCFFFFFFF)
        {
            unMapPage(CURRENT_CR3,cnt,0x0);
 1003a87:	0f 20 d8             	mov    eax,cr3
 1003a8a:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:111

    startAddr=kmmHeapMemoryBaseAddress; 
    printd(DEBUG_KERNEL_PAGING,"Zeroing page entries for memory range 0x%08X-0x%08X",startAddr,0x9FFFFFFF);
    for (uintptr_t cnt=startAddr;cnt<=0x9FFFFFFF;cnt+=0x1000)
    {
        if (cnt<0xC0000000 || cnt>0xCFFFFFFF)
 1003a8c:	8d 83 00 00 00 40    	lea    eax,[ebx+0x40000000]
 1003a92:	3d ff ff ff 0f       	cmp    eax,0xfffffff
 1003a97:	76 2c                	jbe    1003ac5 <mmInit+0x1fb>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:113
        {
            unMapPage(CURRENT_CR3,cnt,0x0);
 1003a99:	83 ec 04             	sub    esp,0x4
 1003a9c:	6a 00                	push   0x0
 1003a9e:	53                   	push   ebx
 1003a9f:	56                   	push   esi
 1003aa0:	e8 ca 05 00 00       	call   100406f <unMapPage>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:114
            if (cnt%0x10000000==0)
 1003aa5:	83 c4 10             	add    esp,0x10
 1003aa8:	f7 c3 ff ff ff 0f    	test   ebx,0xfffffff
 1003aae:	75 15                	jne    1003ac5 <mmInit+0x1fb>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:117
            {
//                printk("0x%08X-0x%08X\n",cnt,kPagingGet4kPTEntryValue(cnt));
                printd(DEBUG_KERNEL_PAGING,".");
 1003ab0:	83 ec 08             	sub    esp,0x8
 1003ab3:	68 95 7a 00 01       	push   0x1007a95
 1003ab8:	68 00 80 00 00       	push   0x8000
 1003abd:	e8 d1 ea ff ff       	call   1002593 <printd>
 1003ac2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:109 (discriminator 2)
            0x1000, /*page size*/
            true);

    startAddr=kmmHeapMemoryBaseAddress; 
    printd(DEBUG_KERNEL_PAGING,"Zeroing page entries for memory range 0x%08X-0x%08X",startAddr,0x9FFFFFFF);
    for (uintptr_t cnt=startAddr;cnt<=0x9FFFFFFF;cnt+=0x1000)
 1003ac5:	81 c3 00 10 00 00    	add    ebx,0x1000
 1003acb:	81 fb ff ff ff 9f    	cmp    ebx,0x9fffffff
 1003ad1:	76 b9                	jbe    1003a8c <mmInit+0x1c2>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:123
//                cursorMoveTo(0,cursorGetPosY()-1);
            }
        }
    }
 
    printk("\n");
 1003ad3:	83 ec 0c             	sub    esp,0xc
 1003ad6:	68 66 7a 00 01       	push   0x1007a66
 1003adb:	e8 9b ea ff ff       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:145
    printd(DEBUG_KERNEL_PAGING,"Available memory: %u\n",memAvailable());
    return;
  */  
//    for (int cnt=KERNEL_VIRTUAL_EXEC_ADDRESS;cnt<KERNEL_VIRTUAL_EXEC_ADDRESS+0x10000000;cnt+=4096)
//        pagingMapPage
}
 1003ae0:	83 c4 14             	add    esp,0x14
 1003ae3:	5b                   	pop    ebx
 1003ae4:	5e                   	pop    esi
 1003ae5:	c3                   	ret    
 1003ae6:	66 90                	xchg   ax,ax

01003ae8 <pagingFindAvailableAddressToMapTo>:
pagingFindAvailableAddressToMapTo():
/home/yogi/src/os/chrisOSKernel/src/paging.c:24
uint32_t kKernelPoolMemoryAddress;



uint32_t pagingFindAvailableAddressToMapTo(uintptr_t pageDirAddress,int pagesToFind)
{
 1003ae8:	55                   	push   ebp
 1003ae9:	57                   	push   edi
 1003aea:	56                   	push   esi
 1003aeb:	53                   	push   ebx
 1003aec:	83 ec 30             	sub    esp,0x30
/home/yogi/src/os/chrisOSKernel/src/paging.c:26
    uint32_t* dir;
    dir=(uint32_t*)pageDirAddress;
 1003aef:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
 1003af3:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:36
    uint32_t foundPageTableEntry;
    uint32_t foundPageTableEntryNum;
    int dirEntryNumber=0;
    uint32_t lRetVal;
    currentPDE=dir;
    lastPDE=dir+(PAGE_SIZE/4);
 1003af7:	05 00 10 00 00       	add    eax,0x1000
 1003afc:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:38
    
    printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding page entries to accomodate 0x%08X pages\n",pagesToFind);
 1003b00:	ff 74 24 48          	push   DWORD PTR [esp+0x48]
 1003b04:	68 b4 8c 00 01       	push   0x1008cb4
 1003b09:	6a 40                	push   0x40
 1003b0b:	e8 83 ea ff ff       	call   1002593 <printd>
 1003b10:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/paging.c:35
    bool found=false;
    uint32_t foundPageTableEntry;
    uint32_t foundPageTableEntryNum;
    int dirEntryNumber=0;
    uint32_t lRetVal;
    currentPDE=dir;
 1003b13:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
 1003b17:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:26


uint32_t pagingFindAvailableAddressToMapTo(uintptr_t pageDirAddress,int pagesToFind)
{
    uint32_t* dir;
    dir=(uint32_t*)pageDirAddress;
 1003b1b:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:33
    uint32_t* currentPDE,*lastPDE;
    int foundEntryCount;
    bool found=false;
    uint32_t foundPageTableEntry;
    uint32_t foundPageTableEntryNum;
    int dirEntryNumber=0;
 1003b1d:	bd 00 00 00 00       	mov    ebp,0x0
/home/yogi/src/os/chrisOSKernel/src/paging.c:30
    uint32_t* dir;
    dir=(uint32_t*)pageDirAddress;
    uint32_t* tablePtr;
    uint32_t* currentPDE,*lastPDE;
    int foundEntryCount;
    bool found=false;
 1003b22:	c6 44 24 17 00       	mov    BYTE PTR [esp+0x17],0x0
 1003b27:	05 04 10 00 00       	add    eax,0x1004
 1003b2c:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:42
    
    printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding page entries to accomodate 0x%08X pages\n",pagesToFind);
    //Scan the page directory for an entry that is in use
    do
    {
        printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding existing page directory entry\n");
 1003b30:	83 ec 08             	sub    esp,0x8
 1003b33:	68 04 8d 00 01       	push   0x1008d04
 1003b38:	6a 40                	push   0x40
 1003b3a:	e8 54 ea ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:43
        for (uint32_t* cnt=currentPDE;cnt<=lastPDE;cnt++)
 1003b3f:	83 c4 10             	add    esp,0x10
 1003b42:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1003b46:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
 1003b4a:	39 c8                	cmp    eax,ecx
 1003b4c:	77 32                	ja     1003b80 <pagingFindAvailableAddressToMapTo+0x98>
/home/yogi/src/os/chrisOSKernel/src/paging.c:45
        {
            if (*dir==0)
 1003b4e:	83 3b 00             	cmp    DWORD PTR [ebx],0x0
 1003b51:	0f 85 a1 01 00 00    	jne    1003cf8 <pagingFindAvailableAddressToMapTo+0x210>
 1003b57:	83 c0 04             	add    eax,0x4
 1003b5a:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
 1003b5e:	29 c2                	sub    edx,eax
 1003b60:	89 d0                	mov    eax,edx
 1003b62:	c1 e8 02             	shr    eax,0x2
 1003b65:	8d 44 05 01          	lea    eax,[ebp+eax*1+0x1]
 1003b69:	eb 09                	jmp    1003b74 <pagingFindAvailableAddressToMapTo+0x8c>
 1003b6b:	83 3b 00             	cmp    DWORD PTR [ebx],0x0
 1003b6e:	0f 85 84 01 00 00    	jne    1003cf8 <pagingFindAvailableAddressToMapTo+0x210>
/home/yogi/src/os/chrisOSKernel/src/paging.c:47 (discriminator 2)
            {
                dir++;
 1003b74:	83 c3 04             	add    ebx,0x4
/home/yogi/src/os/chrisOSKernel/src/paging.c:48 (discriminator 2)
                dirEntryNumber++;
 1003b77:	83 c5 01             	add    ebp,0x1
/home/yogi/src/os/chrisOSKernel/src/paging.c:43 (discriminator 2)
    printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding page entries to accomodate 0x%08X pages\n",pagesToFind);
    //Scan the page directory for an entry that is in use
    do
    {
        printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding existing page directory entry\n");
        for (uint32_t* cnt=currentPDE;cnt<=lastPDE;cnt++)
 1003b7a:	39 c5                	cmp    ebp,eax
 1003b7c:	75 ed                	jne    1003b6b <pagingFindAvailableAddressToMapTo+0x83>
 1003b7e:	eb 02                	jmp    1003b82 <pagingFindAvailableAddressToMapTo+0x9a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:43
 1003b80:	89 e8                	mov    eax,ebp
/home/yogi/src/os/chrisOSKernel/src/paging.c:55
            else
                break;
        }

        //If we didn't find a page directory in use, put the first entry into use
        if (*dir==0)
 1003b82:	83 3b 00             	cmp    DWORD PTR [ebx],0x0
 1003b85:	75 37                	jne    1003bbe <pagingFindAvailableAddressToMapTo+0xd6>
/home/yogi/src/os/chrisOSKernel/src/paging.c:58
        {
            dir=(uint32_t*)pageDirAddress;
            *dir=(uint32_t)allocPages(PAGE_SIZE);
 1003b87:	83 ec 0c             	sub    esp,0xc
 1003b8a:	68 00 10 00 00       	push   0x1000
 1003b8f:	e8 9b f8 ff ff       	call   100342f <allocPages>
/home/yogi/src/os/chrisOSKernel/src/paging.c:60
            *dir &= 0xFFFFF000;
            *dir |= 0x7;
 1003b94:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003b99:	83 c8 07             	or     eax,0x7
 1003b9c:	8b 7c 24 2c          	mov    edi,DWORD PTR [esp+0x2c]
 1003ba0:	89 07                	mov    DWORD PTR [edi],eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:62
            dirEntryNumber=0;
            printd(DEBUG_PAGING,"pagingFindAvailablePageTable: No available directory entry, allocated one at 0x%08X, placed at PDE entry 0 (0x%08X)\n",*dir,dir);
 1003ba2:	57                   	push   edi
 1003ba3:	50                   	push   eax
 1003ba4:	68 4c 8d 00 01       	push   0x1008d4c
 1003ba9:	6a 40                	push   0x40
 1003bab:	e8 e3 e9 ff ff       	call   1002593 <printd>
 1003bb0:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:57
        }

        //If we didn't find a page directory in use, put the first entry into use
        if (*dir==0)
        {
            dir=(uint32_t*)pageDirAddress;
 1003bb3:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
/home/yogi/src/os/chrisOSKernel/src/paging.c:61
            *dir=(uint32_t)allocPages(PAGE_SIZE);
            *dir &= 0xFFFFF000;
            *dir |= 0x7;
            dirEntryNumber=0;
 1003bb7:	bd 00 00 00 00       	mov    ebp,0x0
 1003bbc:	eb 06                	jmp    1003bc4 <pagingFindAvailableAddressToMapTo+0xdc>
 1003bbe:	89 c5                	mov    ebp,eax
 1003bc0:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:70
        currentPDE=dir;
        foundEntryCount=0;
        foundPageTableEntry=0;
        foundPageTableEntryNum=0;
        
        tablePtr=(uint32_t*)*dir;
 1003bc4:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
 1003bc8:	8b 01                	mov    eax,DWORD PTR [ecx]
/home/yogi/src/os/chrisOSKernel/src/paging.c:71
        tablePtr=(uint32_t*)((uint32_t)tablePtr & 0xFFFFF000);
 1003bca:	89 c6                	mov    esi,eax
 1003bcc:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
/home/yogi/src/os/chrisOSKernel/src/paging.c:73
        
        printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Found PDE=0x%08X (0x%08X)\n",currentPDE,*currentPDE);
 1003bd2:	50                   	push   eax
 1003bd3:	51                   	push   ecx
 1003bd4:	68 c4 8d 00 01       	push   0x1008dc4
 1003bd9:	6a 40                	push   0x40
 1003bdb:	e8 b3 e9 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:76
        
        //Find sequential table entries large enough to hold the requested amount of memory
        printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding free page table entries\n");
 1003be0:	83 c4 08             	add    esp,0x8
 1003be3:	68 00 8e 00 01       	push   0x1008e00
 1003be8:	6a 40                	push   0x40
 1003bea:	e8 a4 e9 ff ff       	call   1002593 <printd>
 1003bef:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/paging.c:77
        for (int cnt=0;cnt<(PAGE_SIZE/4)-1;cnt++)
 1003bf2:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/src/paging.c:68
        }

        currentPDE=dir;
        foundEntryCount=0;
        foundPageTableEntry=0;
        foundPageTableEntryNum=0;
 1003bf7:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1003bfe:	00 
/home/yogi/src/os/chrisOSKernel/src/paging.c:67
            printd(DEBUG_PAGING,"pagingFindAvailablePageTable: No available directory entry, allocated one at 0x%08X, placed at PDE entry 0 (0x%08X)\n",*dir,dir);
        }

        currentPDE=dir;
        foundEntryCount=0;
        foundPageTableEntry=0;
 1003bff:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
/home/yogi/src/os/chrisOSKernel/src/paging.c:66
            dirEntryNumber=0;
            printd(DEBUG_PAGING,"pagingFindAvailablePageTable: No available directory entry, allocated one at 0x%08X, placed at PDE entry 0 (0x%08X)\n",*dir,dir);
        }

        currentPDE=dir;
        foundEntryCount=0;
 1003c06:	bf 00 00 00 00       	mov    edi,0x0
 1003c0b:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 1003c0f:	8b 6c 24 44          	mov    ebp,DWORD PTR [esp+0x44]
/home/yogi/src/os/chrisOSKernel/src/paging.c:80
        //Find sequential table entries large enough to hold the requested amount of memory
        printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding free page table entries\n");
        for (int cnt=0;cnt<(PAGE_SIZE/4)-1;cnt++)
        {
            //If entry is in use
            if (*tablePtr!=0)
 1003c13:	83 3e 00             	cmp    DWORD PTR [esi],0x0
 1003c16:	74 19                	je     1003c31 <pagingFindAvailableAddressToMapTo+0x149>
/home/yogi/src/os/chrisOSKernel/src/paging.c:85
            {
                //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Page %u of %u is in use (0x%08X=0x%08X), starting again\n",foundEntryCount+1,pagesToFind,tablePtr,*tablePtr);
                //reset the found entry count and move to the next entry
                foundEntryCount=0;
                tablePtr++;
 1003c18:	83 c6 04             	add    esi,0x4
/home/yogi/src/os/chrisOSKernel/src/paging.c:87
                foundPageTableEntry=0;
                foundPageTableEntryNum=0;
 1003c1b:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1003c22:	00 
/home/yogi/src/os/chrisOSKernel/src/paging.c:86
            {
                //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Page %u of %u is in use (0x%08X=0x%08X), starting again\n",foundEntryCount+1,pagesToFind,tablePtr,*tablePtr);
                //reset the found entry count and move to the next entry
                foundEntryCount=0;
                tablePtr++;
                foundPageTableEntry=0;
 1003c23:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
/home/yogi/src/os/chrisOSKernel/src/paging.c:84
            //If entry is in use
            if (*tablePtr!=0)
            {
                //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Page %u of %u is in use (0x%08X=0x%08X), starting again\n",foundEntryCount+1,pagesToFind,tablePtr,*tablePtr);
                //reset the found entry count and move to the next entry
                foundEntryCount=0;
 1003c2a:	bf 00 00 00 00       	mov    edi,0x0
 1003c2f:	eb 64                	jmp    1003c95 <pagingFindAvailableAddressToMapTo+0x1ad>
/home/yogi/src/os/chrisOSKernel/src/paging.c:92
                foundPageTableEntryNum=0;
            }
            else
            {
                //Entry not in use, increment the found entry count
                foundEntryCount++;
 1003c31:	83 c7 01             	add    edi,0x1
/home/yogi/src/os/chrisOSKernel/src/paging.c:93
                printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Page %u of %u available ... continuing\n",foundEntryCount,pagesToFind);
 1003c34:	55                   	push   ebp
 1003c35:	57                   	push   edi
 1003c36:	68 40 8e 00 01       	push   0x1008e40
 1003c3b:	6a 40                	push   0x40
 1003c3d:	e8 51 e9 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:94
                if (foundPageTableEntry==0)
 1003c42:	83 c4 10             	add    esp,0x10
 1003c45:	83 3c 24 00          	cmp    DWORD PTR [esp],0x0
 1003c49:	75 07                	jne    1003c52 <pagingFindAvailableAddressToMapTo+0x16a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:96
                {
                    foundPageTableEntry=(uint32_t)tablePtr;
 1003c4b:	89 34 24             	mov    DWORD PTR [esp],esi
/home/yogi/src/os/chrisOSKernel/src/paging.c:97
                    foundPageTableEntryNum=cnt;
 1003c4e:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:100
                }
                //If we found enough entries which aren't in use, bail out of the FOR
                if (foundEntryCount==pagesToFind)
 1003c52:	39 fd                	cmp    ebp,edi
 1003c54:	75 3f                	jne    1003c95 <pagingFindAvailableAddressToMapTo+0x1ad>
 1003c56:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/src/paging.c:102
                {
                    printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Found available page entries at entry 0x%08X\n",foundPageTableEntry);
 1003c5a:	83 ec 04             	sub    esp,0x4
 1003c5d:	ff 74 24 04          	push   DWORD PTR [esp+0x4]
 1003c61:	68 88 8e 00 01       	push   0x1008e88
 1003c66:	6a 40                	push   0x40
 1003c68:	e8 26 e9 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:108
                    found=true;
                    break;
                }
            }
        }
        printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Not enough pages at dir entry 0x%08X (%u-%u)\n",currentPDE,foundEntryCount,pagesToFind);
 1003c6d:	83 c4 04             	add    esp,0x4
 1003c70:	ff 74 24 50          	push   DWORD PTR [esp+0x50]
 1003c74:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 1003c78:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003c7c:	68 d4 8e 00 01       	push   0x1008ed4
 1003c81:	6a 40                	push   0x40
 1003c83:	e8 0b e9 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:110
        dir++;
        dirEntryNumber++;
 1003c88:	83 c5 01             	add    ebp,0x1
 1003c8b:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:103
                }
                //If we found enough entries which aren't in use, bail out of the FOR
                if (foundEntryCount==pagesToFind)
                {
                    printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Found available page entries at entry 0x%08X\n",foundPageTableEntry);
                    found=true;
 1003c8e:	c6 44 24 17 01       	mov    BYTE PTR [esp+0x17],0x1
 1003c93:	eb 46                	jmp    1003cdb <pagingFindAvailableAddressToMapTo+0x1f3>
/home/yogi/src/os/chrisOSKernel/src/paging.c:77 (discriminator 2)
        
        printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Found PDE=0x%08X (0x%08X)\n",currentPDE,*currentPDE);
        
        //Find sequential table entries large enough to hold the requested amount of memory
        printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding free page table entries\n");
        for (int cnt=0;cnt<(PAGE_SIZE/4)-1;cnt++)
 1003c95:	83 c3 01             	add    ebx,0x1
 1003c98:	81 fb ff 03 00 00    	cmp    ebx,0x3ff
 1003c9e:	0f 85 6f ff ff ff    	jne    1003c13 <pagingFindAvailableAddressToMapTo+0x12b>
 1003ca4:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/src/paging.c:108
                    found=true;
                    break;
                }
            }
        }
        printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Not enough pages at dir entry 0x%08X (%u-%u)\n",currentPDE,foundEntryCount,pagesToFind);
 1003ca8:	83 ec 0c             	sub    esp,0xc
 1003cab:	ff 74 24 50          	push   DWORD PTR [esp+0x50]
 1003caf:	57                   	push   edi
 1003cb0:	8b 7c 24 1c          	mov    edi,DWORD PTR [esp+0x1c]
 1003cb4:	57                   	push   edi
 1003cb5:	68 d4 8e 00 01       	push   0x1008ed4
 1003cba:	6a 40                	push   0x40
 1003cbc:	e8 d2 e8 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:109
        dir++;
 1003cc1:	8d 5f 04             	lea    ebx,[edi+0x4]
/home/yogi/src/os/chrisOSKernel/src/paging.c:110
        dirEntryNumber++;
 1003cc4:	83 c5 01             	add    ebp,0x1
/home/yogi/src/os/chrisOSKernel/src/paging.c:111
    } while ( !found && currentPDE<lastPDE);
 1003cc7:	83 c4 20             	add    esp,0x20
 1003cca:	3b 7c 24 10          	cmp    edi,DWORD PTR [esp+0x10]
 1003cce:	0f 92 c0             	setb   al
 1003cd1:	38 44 24 17          	cmp    BYTE PTR [esp+0x17],al
 1003cd5:	0f 82 55 fe ff ff    	jb     1003b30 <pagingFindAvailableAddressToMapTo+0x48>
/home/yogi/src/os/chrisOSKernel/src/paging.c:113
    
    if (!found)
 1003cdb:	80 7c 24 17 00       	cmp    BYTE PTR [esp+0x17],0x0
 1003ce0:	75 1f                	jne    1003d01 <pagingFindAvailableAddressToMapTo+0x219>
/home/yogi/src/os/chrisOSKernel/src/paging.c:114
        panic("pagingFindAvailablePageTable: Could not find a free PTE, PDE=0x%08X\n",pageDirAddress);
 1003ce2:	83 ec 08             	sub    esp,0x8
 1003ce5:	ff 74 24 48          	push   DWORD PTR [esp+0x48]
 1003ce9:	68 20 8f 00 01       	push   0x1008f20
 1003cee:	e8 01 e4 ff ff       	call   10020f4 <panic>
 1003cf3:	83 c4 10             	add    esp,0x10
 1003cf6:	eb 09                	jmp    1003d01 <pagingFindAvailableAddressToMapTo+0x219>
/home/yogi/src/os/chrisOSKernel/src/paging.c:61
        {
            dir=(uint32_t*)pageDirAddress;
            *dir=(uint32_t)allocPages(PAGE_SIZE);
            *dir &= 0xFFFFF000;
            *dir |= 0x7;
            dirEntryNumber=0;
 1003cf8:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
 1003cfc:	e9 c3 fe ff ff       	jmp    1003bc4 <pagingFindAvailableAddressToMapTo+0xdc>
/home/yogi/src/os/chrisOSKernel/src/paging.c:116
    } while ( !found && currentPDE<lastPDE);
    
    if (!found)
        panic("pagingFindAvailablePageTable: Could not find a free PTE, PDE=0x%08X\n",pageDirAddress);

    printd(DEBUG_PAGING,"dirEntryNumber=0x%08X, foundPageTableEntry=0x%08X\n",dirEntryNumber,foundPageTableEntryNum);
 1003d01:	8b 7c 24 04          	mov    edi,DWORD PTR [esp+0x4]
 1003d05:	57                   	push   edi
 1003d06:	55                   	push   ebp
 1003d07:	68 68 8f 00 01       	push   0x1008f68
 1003d0c:	6a 40                	push   0x40
 1003d0e:	e8 80 e8 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:117
    lRetVal=(uint32_t)((dirEntryNumber*0x400000) + (foundPageTableEntryNum*4096));
 1003d13:	89 eb                	mov    ebx,ebp
 1003d15:	c1 e3 16             	shl    ebx,0x16
 1003d18:	89 f8                	mov    eax,edi
 1003d1a:	c1 e0 0c             	shl    eax,0xc
 1003d1d:	01 c3                	add    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:118
    printd(DEBUG_PAGING,"Found page directory entry 0x%08X, starting page entry 0x%08X\n",currentPDE,foundPageTableEntry);
 1003d1f:	ff 74 24 10          	push   DWORD PTR [esp+0x10]
 1003d23:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003d27:	68 9c 8f 00 01       	push   0x1008f9c
 1003d2c:	6a 40                	push   0x40
 1003d2e:	e8 60 e8 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:119
    printd(DEBUG_PAGING,"\tfor 0x%08X bytes of memory starting at address 0x%08X\n",pagesToFind*PAGE_SIZE,lRetVal);
 1003d33:	83 c4 20             	add    esp,0x20
 1003d36:	53                   	push   ebx
 1003d37:	8b 44 24 48          	mov    eax,DWORD PTR [esp+0x48]
 1003d3b:	c1 e0 0c             	shl    eax,0xc
 1003d3e:	50                   	push   eax
 1003d3f:	68 dc 8f 00 01       	push   0x1008fdc
 1003d44:	6a 40                	push   0x40
 1003d46:	e8 48 e8 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:121
    return lRetVal;
}
 1003d4b:	89 d8                	mov    eax,ebx
 1003d4d:	83 c4 3c             	add    esp,0x3c
 1003d50:	5b                   	pop    ebx
 1003d51:	5e                   	pop    esi
 1003d52:	5f                   	pop    edi
 1003d53:	5d                   	pop    ebp
 1003d54:	c3                   	ret    

01003d55 <pagingAllocatePagingTablePage>:
pagingAllocatePagingTablePage():
/home/yogi/src/os/chrisOSKernel/src/paging.c:125

uint32_t pagingAllocatePagingTablePage()
{
    uint32_t lRetVal = kKernelPoolMemoryAddress;
 1003d55:	a1 64 4a 01 01       	mov    eax,ds:0x1014a64
/home/yogi/src/os/chrisOSKernel/src/paging.c:126
    kKernelPoolMemoryAddress+=0x1000;
 1003d5a:	8d 90 00 10 00 00    	lea    edx,[eax+0x1000]
 1003d60:	89 15 64 4a 01 01    	mov    DWORD PTR ds:0x1014a64,edx
/home/yogi/src/os/chrisOSKernel/src/paging.c:128
    return lRetVal;
}
 1003d66:	c3                   	ret    

01003d67 <pagingGet4kPDEntryValue>:
pagingGet4kPDEntryValue():
/home/yogi/src/os/chrisOSKernel/src/paging.c:131

uint32_t pagingGet4kPDEntryValue(uintptr_t pageDirAddress, uint32_t address)
{
 1003d67:	53                   	push   ebx
 1003d68:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/src/paging.c:133
    address&=0xFFFFF000;
    uintptr_t* lTemp=(uint32_t*)((pageDirAddress + (((address & 0xFFC00000) >> 22) << 2)));
 1003d6b:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
 1003d6f:	c1 eb 16             	shr    ebx,0x16
 1003d72:	c1 e3 02             	shl    ebx,0x2
 1003d75:	03 5c 24 14          	add    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:134
    printd(DEBUG_PAGING,"pagingGet4kPDEntryValue: dirAddressPtr=0x%08x\n", *lTemp);
 1003d79:	ff 33                	push   DWORD PTR [ebx]
 1003d7b:	68 0c 7e 00 01       	push   0x1007e0c
 1003d80:	6a 40                	push   0x40
 1003d82:	e8 0c e8 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:135
    return (uint32_t)*lTemp;
 1003d87:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/src/paging.c:136
}
 1003d89:	83 c4 18             	add    esp,0x18
 1003d8c:	5b                   	pop    ebx
 1003d8d:	c3                   	ret    

01003d8e <pagingGet4kPDEntryAddress>:
pagingGet4kPDEntryAddress():
/home/yogi/src/os/chrisOSKernel/src/paging.c:139

uint32_t pagingGet4kPDEntryAddress(uintptr_t pageDirAddress, uint32_t address)
{
 1003d8e:	53                   	push   ebx
 1003d8f:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/src/paging.c:141
    address&=0xFFFFF000;
    uintptr_t lTemp=((pageDirAddress  | (((address & 0xFFC00000) >> 22) << 2)));
 1003d92:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
 1003d96:	c1 eb 16             	shr    ebx,0x16
 1003d99:	c1 e3 02             	shl    ebx,0x2
 1003d9c:	0b 5c 24 14          	or     ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:142
    printd(DEBUG_PAGING,"pagingGet4kPDEntryAddress: dirEntryAddress=0x%08x\n", lTemp);
 1003da0:	53                   	push   ebx
 1003da1:	68 14 90 00 01       	push   0x1009014
 1003da6:	6a 40                	push   0x40
 1003da8:	e8 e6 e7 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:144
    return (uint32_t)lTemp & 0xFFFFFFFF;
}
 1003dad:	89 d8                	mov    eax,ebx
 1003daf:	83 c4 18             	add    esp,0x18
 1003db2:	5b                   	pop    ebx
 1003db3:	c3                   	ret    

01003db4 <pagingGet4kPTEntryAddress>:
pagingGet4kPTEntryAddress():
/home/yogi/src/os/chrisOSKernel/src/paging.c:147

uint32_t pagingGet4kPTEntryAddress(uintptr_t pageDirAddress, uint32_t address)
{
 1003db4:	53                   	push   ebx
 1003db5:	83 ec 10             	sub    esp,0x10
 1003db8:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/src/paging.c:149
    address&=0xFFFFF000;
    uintptr_t pDirPtr=pagingGet4kPDEntryValue(pageDirAddress,address) & 0xFFFFF000;
 1003dbc:	89 d8                	mov    eax,ebx
 1003dbe:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003dc3:	50                   	push   eax
 1003dc4:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003dc8:	e8 9a ff ff ff       	call   1003d67 <pagingGet4kPDEntryValue>
/home/yogi/src/os/chrisOSKernel/src/paging.c:150
    return ((address & 0x3FF000) >> 12) << 2 | pDirPtr;
 1003dcd:	81 e3 00 f0 3f 00    	and    ebx,0x3ff000
 1003dd3:	c1 eb 0a             	shr    ebx,0xa
 1003dd6:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003ddb:	09 d8                	or     eax,ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:151
}
 1003ddd:	83 c4 18             	add    esp,0x18
 1003de0:	5b                   	pop    ebx
 1003de1:	c3                   	ret    

01003de2 <pagingGet4kPTEntryValue>:
pagingGet4kPTEntryValue():
/home/yogi/src/os/chrisOSKernel/src/paging.c:154

uint32_t pagingGet4kPTEntryValue(uintptr_t pageDirAddress, uint32_t address)
{
 1003de2:	53                   	push   ebx
 1003de3:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/paging.c:156
    address&=0xFFFFF000;
    uint32_t* pTablePtr=(uint32_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 1003de6:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1003dea:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003def:	50                   	push   eax
 1003df0:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003df4:	e8 bb ff ff ff       	call   1003db4 <pagingGet4kPTEntryAddress>
 1003df9:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:157
    printd(DEBUG_PAGING,"pagingGet4kPTEntryValue: pageEntryAddress=0x%08X\n", pTablePtr);
 1003dfb:	83 c4 0c             	add    esp,0xc
 1003dfe:	50                   	push   eax
 1003dff:	68 3c 7e 00 01       	push   0x1007e3c
 1003e04:	6a 40                	push   0x40
 1003e06:	e8 88 e7 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:158
    return *pTablePtr;
 1003e0b:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/src/paging.c:159
}
 1003e0d:	83 c4 18             	add    esp,0x18
 1003e10:	5b                   	pop    ebx
 1003e11:	c3                   	ret    

01003e12 <pagingSetPageReadOnlyFlag>:
pagingSetPageReadOnlyFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:162

void pagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly)
{
 1003e12:	56                   	push   esi
 1003e13:	53                   	push   ebx
 1003e14:	83 ec 04             	sub    esp,0x4
 1003e17:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1003e1b:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:163
    printd(DEBUG_PAGING,"pagingMakePageReadOnly: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 1003e1f:	ff 33                	push   DWORD PTR [ebx]
 1003e21:	53                   	push   ebx
 1003e22:	68 70 7e 00 01       	push   0x1007e70
 1003e27:	6a 40                	push   0x40
 1003e29:	e8 65 e7 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:164
    if (readOnly)
 1003e2e:	83 c4 10             	add    esp,0x10
 1003e31:	89 f0                	mov    eax,esi
 1003e33:	84 c0                	test   al,al
 1003e35:	74 05                	je     1003e3c <pagingSetPageReadOnlyFlag+0x2a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:165
       *ptEntry&=0xFFFFFFFD;
 1003e37:	83 23 fd             	and    DWORD PTR [ebx],0xfffffffd
 1003e3a:	eb 03                	jmp    1003e3f <pagingSetPageReadOnlyFlag+0x2d>
/home/yogi/src/os/chrisOSKernel/src/paging.c:167
    else
       *ptEntry|=2; 
 1003e3c:	83 0b 02             	or     DWORD PTR [ebx],0x2
/home/yogi/src/os/chrisOSKernel/src/paging.c:168
    RELOAD_CR3
 1003e3f:	0f 20 d8             	mov    eax,cr3
 1003e42:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:169
    printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 1003e45:	83 ec 04             	sub    esp,0x4
 1003e48:	ff 33                	push   DWORD PTR [ebx]
 1003e4a:	68 8d 7a 00 01       	push   0x1007a8d
 1003e4f:	6a 40                	push   0x40
 1003e51:	e8 3d e7 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:170
}
 1003e56:	83 c4 14             	add    esp,0x14
 1003e59:	5b                   	pop    ebx
 1003e5a:	5e                   	pop    esi
 1003e5b:	c3                   	ret    

01003e5c <pagingUpdatePTEPresentFlag>:
pagingUpdatePTEPresentFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:173

void pagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present)
{
 1003e5c:	56                   	push   esi
 1003e5d:	53                   	push   ebx
 1003e5e:	83 ec 04             	sub    esp,0x4
 1003e61:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1003e65:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:174
         printd(DEBUG_PAGING,"pagingUpdatePTEPresentFlag: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 1003e69:	ff 33                	push   DWORD PTR [ebx]
 1003e6b:	53                   	push   ebx
 1003e6c:	68 a8 7e 00 01       	push   0x1007ea8
 1003e71:	6a 40                	push   0x40
 1003e73:	e8 1b e7 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:175
         if (present)
 1003e78:	83 c4 10             	add    esp,0x10
 1003e7b:	89 f0                	mov    eax,esi
 1003e7d:	84 c0                	test   al,al
 1003e7f:	74 05                	je     1003e86 <pagingUpdatePTEPresentFlag+0x2a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:176
             *ptEntry=*ptEntry | 1;
 1003e81:	83 0b 01             	or     DWORD PTR [ebx],0x1
 1003e84:	eb 03                	jmp    1003e89 <pagingUpdatePTEPresentFlag+0x2d>
/home/yogi/src/os/chrisOSKernel/src/paging.c:178
         else
             *ptEntry&=0xFFFFFFFE;
 1003e86:	83 23 fe             	and    DWORD PTR [ebx],0xfffffffe
/home/yogi/src/os/chrisOSKernel/src/paging.c:179
         __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
 1003e89:	0f 20 d8             	mov    eax,cr3
 1003e8c:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:180
         printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 1003e8f:	83 ec 04             	sub    esp,0x4
 1003e92:	ff 33                	push   DWORD PTR [ebx]
 1003e94:	68 8d 7a 00 01       	push   0x1007a8d
 1003e99:	6a 40                	push   0x40
 1003e9b:	e8 f3 e6 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:181
}
 1003ea0:	83 c4 14             	add    esp,0x14
 1003ea3:	5b                   	pop    ebx
 1003ea4:	5e                   	pop    esi
 1003ea5:	c3                   	ret    

01003ea6 <pagingSetVirtualRangeRO>:
pagingSetVirtualRangeRO():
/home/yogi/src/os/chrisOSKernel/src/paging.c:184

void pagingSetVirtualRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 1003ea6:	55                   	push   ebp
 1003ea7:	57                   	push   edi
 1003ea8:	56                   	push   esi
 1003ea9:	53                   	push   ebx
 1003eaa:	83 ec 1c             	sub    esp,0x1c
 1003ead:	8b 5c 24 34          	mov    ebx,DWORD PTR [esp+0x34]
 1003eb1:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
 1003eb5:	8b 74 24 3c          	mov    esi,DWORD PTR [esp+0x3c]
 1003eb9:	89 f0                	mov    eax,esi
 1003ebb:	88 44 24 0f          	mov    BYTE PTR [esp+0xf],al
/home/yogi/src/os/chrisOSKernel/src/paging.c:186
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
 1003ebf:	57                   	push   edi
 1003ec0:	53                   	push   ebx
 1003ec1:	68 e4 7e 00 01       	push   0x1007ee4
 1003ec6:	6a 40                	push   0x40
 1003ec8:	e8 c6 e6 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:187
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 1003ecd:	8d 4f 01             	lea    ecx,[edi+0x1]
 1003ed0:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
 1003ed4:	83 c4 10             	add    esp,0x10
 1003ed7:	39 cb                	cmp    ebx,ecx
 1003ed9:	77 4f                	ja     1003f2a <pagingSetVirtualRangeRO+0x84>
 1003edb:	89 f2                	mov    edx,esi
 1003edd:	84 d2                	test   dl,dl
 1003edf:	b8 35 77 00 01       	mov    eax,0x1007735
 1003ee4:	bd 32 77 00 01       	mov    ebp,0x1007732
 1003ee9:	0f 44 e8             	cmove  ebp,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:191
    {
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 1003eec:	0f b6 7c 24 0f       	movzx  edi,BYTE PTR [esp+0xf]
/home/yogi/src/os/chrisOSKernel/src/paging.c:189
{
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
    {
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
 1003ef1:	83 ec 08             	sub    esp,0x8
 1003ef4:	53                   	push   ebx
 1003ef5:	ff 74 24 3c          	push   DWORD PTR [esp+0x3c]
 1003ef9:	e8 b6 fe ff ff       	call   1003db4 <pagingGet4kPTEntryAddress>
 1003efe:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:190
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
 1003f00:	89 2c 24             	mov    DWORD PTR [esp],ebp
 1003f03:	50                   	push   eax
 1003f04:	53                   	push   ebx
 1003f05:	68 38 77 00 01       	push   0x1007738
 1003f0a:	6a 40                	push   0x40
 1003f0c:	e8 82 e6 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:191
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 1003f11:	83 c4 18             	add    esp,0x18
 1003f14:	57                   	push   edi
 1003f15:	56                   	push   esi
 1003f16:	e8 b0 d3 ff ff       	call   10012cb <kPagingSetPageReadOnlyFlag>
/home/yogi/src/os/chrisOSKernel/src/paging.c:187

void pagingSetVirtualRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 1003f1b:	81 c3 00 10 00 00    	add    ebx,0x1000
 1003f21:	83 c4 10             	add    esp,0x10
 1003f24:	3b 5c 24 08          	cmp    ebx,DWORD PTR [esp+0x8]
 1003f28:	76 c7                	jbe    1003ef1 <pagingSetVirtualRangeRO+0x4b>
/home/yogi/src/os/chrisOSKernel/src/paging.c:194
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
            
    }
}
 1003f2a:	83 c4 1c             	add    esp,0x1c
 1003f2d:	5b                   	pop    ebx
 1003f2e:	5e                   	pop    esi
 1003f2f:	5f                   	pop    edi
 1003f30:	5d                   	pop    ebp
 1003f31:	c3                   	ret    

01003f32 <pagingUpdatePresentFlagA>:
pagingUpdatePresentFlagA():
/home/yogi/src/os/chrisOSKernel/src/paging.c:198

//Absolute version, page passed is already virtual
void pagingUpdatePresentFlagA(uintptr_t pageDirAddress, uint32_t address, bool present)
{
 1003f32:	56                   	push   esi
 1003f33:	53                   	push   ebx
 1003f34:	83 ec 04             	sub    esp,0x4
 1003f37:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
 1003f3b:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/src/paging.c:199
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: Make 0x%08X %s\n", address, present?"present":"not present");
 1003f3f:	84 db                	test   bl,bl
 1003f41:	ba 50 77 00 01       	mov    edx,0x1007750
 1003f46:	b8 54 77 00 01       	mov    eax,0x1007754
 1003f4b:	0f 44 c2             	cmove  eax,edx
 1003f4e:	50                   	push   eax
 1003f4f:	56                   	push   esi
 1003f50:	68 14 7f 00 01       	push   0x1007f14
 1003f55:	6a 40                	push   0x40
 1003f57:	e8 37 e6 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:200
        uintptr_t* pagePTE= (uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address&0xFFFFF000);
 1003f5c:	83 c4 08             	add    esp,0x8
 1003f5f:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 1003f65:	56                   	push   esi
 1003f66:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003f6a:	e8 45 fe ff ff       	call   1003db4 <pagingGet4kPTEntryAddress>
 1003f6f:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:201
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: updating entry 0x%08X\n", pagePTE);
 1003f71:	83 c4 0c             	add    esp,0xc
 1003f74:	50                   	push   eax
 1003f75:	68 40 7f 00 01       	push   0x1007f40
 1003f7a:	6a 40                	push   0x40
 1003f7c:	e8 12 e6 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:202
    pagingUpdatePTEPresentFlag(pagePTE, present);
 1003f81:	83 c4 08             	add    esp,0x8
 1003f84:	0f b6 db             	movzx  ebx,bl
 1003f87:	53                   	push   ebx
 1003f88:	56                   	push   esi
 1003f89:	e8 ce fe ff ff       	call   1003e5c <pagingUpdatePTEPresentFlag>
/home/yogi/src/os/chrisOSKernel/src/paging.c:203
}
 1003f8e:	83 c4 14             	add    esp,0x14
 1003f91:	5b                   	pop    ebx
 1003f92:	5e                   	pop    esi
 1003f93:	c3                   	ret    

01003f94 <pagingUpdatePresentFlagV>:
pagingUpdatePresentFlagV():
/home/yogi/src/os/chrisOSKernel/src/paging.c:206

void pagingUpdatePresentFlagV(uintptr_t pageDirAddress,uint32_t address, bool present)
{
 1003f94:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/paging.c:208
    address+=KERNEL_PAGED_BASE_ADDRESS; 
    pagingUpdatePresentFlagA(pageDirAddress,address, present);
 1003f97:	0f b6 44 24 1c       	movzx  eax,BYTE PTR [esp+0x1c]
 1003f9c:	50                   	push   eax
 1003f9d:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1003fa1:	2d 00 00 00 40       	sub    eax,0x40000000
 1003fa6:	50                   	push   eax
 1003fa7:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003fab:	e8 82 ff ff ff       	call   1003f32 <pagingUpdatePresentFlagA>
/home/yogi/src/os/chrisOSKernel/src/paging.c:209
}
 1003fb0:	83 c4 1c             	add    esp,0x1c
 1003fb3:	c3                   	ret    

01003fb4 <pagingMapPage>:
pagingMapPage():
/home/yogi/src/os/chrisOSKernel/src/paging.c:213

///Map a page to a new address
void pagingMapPage(uintptr_t pageDirAddress, uintptr_t virtualAddress, uintptr_t physicalAddress, uint8_t flags)
{
 1003fb4:	55                   	push   ebp
 1003fb5:	57                   	push   edi
 1003fb6:	56                   	push   esi
 1003fb7:	53                   	push   ebx
 1003fb8:	83 ec 0c             	sub    esp,0xc
 1003fbb:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 1003fbf:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
 1003fc3:	8b 5c 24 2c          	mov    ebx,DWORD PTR [esp+0x2c]
/home/yogi/src/os/chrisOSKernel/src/paging.c:221
    uint32_t *ptrT;
    
    //Get pointer to the page directory
    ptr=(uint32_t*)pageDirAddress;
    //Get the appropriate entry in the page table
    ptrVal=ptr[(virtualAddress>>22)];
 1003fc7:	89 f0                	mov    eax,esi
 1003fc9:	c1 e8 16             	shr    eax,0x16
 1003fcc:	8d 7c 85 00          	lea    edi,[ebp+eax*4+0x0]
 1003fd0:	8b 07                	mov    eax,DWORD PTR [edi]
/home/yogi/src/os/chrisOSKernel/src/paging.c:222
    if (ptrVal==0)
 1003fd2:	85 c0                	test   eax,eax
 1003fd4:	75 46                	jne    100401c <pagingMapPage+0x68>
/home/yogi/src/os/chrisOSKernel/src/paging.c:225
    {
        //Get a page for the page table
        *ptrT=(uint32_t*)pagingAllocatePagingTablePage();
 1003fd6:	e8 7a fd ff ff       	call   1003d55 <pagingAllocatePagingTablePage>
/home/yogi/src/os/chrisOSKernel/src/paging.c:226
        printd(DEBUG_PAGING,"pagingMapPage: Page table didn't exist for address 0x%08X (CR3=0x%08X)\n\tAllocated page @ 0x%08X for the page table\n",virtualAddress,pageDirAddress,  *ptrT);
 1003fdb:	83 ec 0c             	sub    esp,0xc
 1003fde:	50                   	push   eax
 1003fdf:	55                   	push   ebp
 1003fe0:	56                   	push   esi
 1003fe1:	68 48 90 00 01       	push   0x1009048
 1003fe6:	6a 40                	push   0x40
 1003fe8:	e8 a6 e5 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:227
        ptr[(virtualAddress>>22)]=0x20000063;
 1003fed:	c7 07 63 00 00 20    	mov    DWORD PTR [edi],0x20000063
/home/yogi/src/os/chrisOSKernel/src/paging.c:229
        ptrT[(virtualAddress&0x003FFFFF/4096)]=physicalAddress | flags;
        printd(DEBUG_PAGING,"kMapPage: Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", virtualAddress, &ptr[(virtualAddress>>22)], &ptrT[(virtualAddress&0x003FFFFF/4096)],ptrT[(virtualAddress&0x003FFFFF/4096)]);
 1003ff3:	83 c4 18             	add    esp,0x18
 1003ff6:	0f b6 db             	movzx  ebx,bl
 1003ff9:	0b 5c 24 30          	or     ebx,DWORD PTR [esp+0x30]
 1003ffd:	53                   	push   ebx
 1003ffe:	89 f0                	mov    eax,esi
 1004000:	25 ff 03 00 00       	and    eax,0x3ff
 1004005:	c1 e0 02             	shl    eax,0x2
 1004008:	50                   	push   eax
 1004009:	57                   	push   edi
 100400a:	56                   	push   esi
 100400b:	68 74 7f 00 01       	push   0x1007f74
 1004010:	6a 40                	push   0x40
 1004012:	e8 7c e5 ff ff       	call   1002593 <printd>
 1004017:	83 c4 20             	add    esp,0x20
 100401a:	eb 32                	jmp    100404e <pagingMapPage+0x9a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:242
        ptrVal=ptr[virtualAddress>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(virtualAddress&0x003FFFFF)/4096;
        ptrT[ptrVal]=physicalAddress | flags;
 100401c:	25 00 f0 ff ff       	and    eax,0xfffff000
 1004021:	89 c2                	mov    edx,eax
 1004023:	89 f0                	mov    eax,esi
 1004025:	c1 e8 0a             	shr    eax,0xa
 1004028:	25 fc 0f 00 00       	and    eax,0xffc
 100402d:	01 d0                	add    eax,edx
 100402f:	0f b6 db             	movzx  ebx,bl
 1004032:	0b 5c 24 28          	or     ebx,DWORD PTR [esp+0x28]
 1004036:	89 18                	mov    DWORD PTR [eax],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:243
        printd(DEBUG_PAGING,"kMapPage:(2) Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", virtualAddress, &ptr[(virtualAddress>>22)], &ptrT[ptrVal],ptrT[ptrVal]);
 1004038:	83 ec 08             	sub    esp,0x8
 100403b:	53                   	push   ebx
 100403c:	50                   	push   eax
 100403d:	57                   	push   edi
 100403e:	56                   	push   esi
 100403f:	68 bc 90 00 01       	push   0x10090bc
 1004044:	6a 40                	push   0x40
 1004046:	e8 48 e5 ff ff       	call   1002593 <printd>
 100404b:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:245
    }
}
 100404e:	83 c4 0c             	add    esp,0xc
 1004051:	5b                   	pop    ebx
 1004052:	5e                   	pop    esi
 1004053:	5f                   	pop    edi
 1004054:	5d                   	pop    ebp
 1004055:	c3                   	ret    

01004056 <isPageMapped>:
isPageMapped():
/home/yogi/src/os/chrisOSKernel/src/paging.c:248

bool isPageMapped(uintptr_t pageDirAddress, uintptr_t Address)
{
 1004056:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/src/paging.c:249
    if (!pagingGet4kPTEntryValue(pageDirAddress,Address))
 1004059:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100405d:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1004061:	e8 7c fd ff ff       	call   1003de2 <pagingGet4kPTEntryValue>
 1004066:	85 c0                	test   eax,eax
 1004068:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/src/paging.c:252
        return false;
    return true;
}
 100406b:	83 c4 1c             	add    esp,0x1c
 100406e:	c3                   	ret    

0100406f <unMapPage>:
unMapPage():
/home/yogi/src/os/chrisOSKernel/src/paging.c:255

void unMapPage(uintptr_t pageDirAddress, uintptr_t pageToUnmap, uint8_t newFlags)
{
 100406f:	57                   	push   edi
 1004070:	56                   	push   esi
 1004071:	53                   	push   ebx
 1004072:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
 1004076:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/src/paging.c:260
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)pageDirAddress;
    ptrVal=ptr[(pageToUnmap>>22)];
 100407a:	89 c8                	mov    eax,ecx
 100407c:	c1 e8 16             	shr    eax,0x16
 100407f:	c1 e0 02             	shl    eax,0x2
 1004082:	03 44 24 10          	add    eax,DWORD PTR [esp+0x10]
 1004086:	8b 10                	mov    edx,DWORD PTR [eax]
/home/yogi/src/os/chrisOSKernel/src/paging.c:261
    if (ptrVal==0 && pageToUnmap < kE820MemoryBytes)
 1004088:	85 d2                	test   edx,edx
 100408a:	75 4b                	jne    10040d7 <unMapPage+0x68>
/home/yogi/src/os/chrisOSKernel/src/paging.c:261 (discriminator 1)
 100408c:	bf 00 00 00 00       	mov    edi,0x0
 1004091:	3b 3d 4c 00 12 00    	cmp    edi,DWORD PTR ds:0x12004c
 1004097:	72 08                	jb     10040a1 <unMapPage+0x32>
 1004099:	3b 0d 48 00 12 00    	cmp    ecx,DWORD PTR ds:0x120048
 100409f:	73 36                	jae    10040d7 <unMapPage+0x68>
/home/yogi/src/os/chrisOSKernel/src/paging.c:264
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(pageToUnmap>>22)]=0x20000063;
 10040a1:	c7 00 63 00 00 20    	mov    DWORD PTR [eax],0x20000063
/home/yogi/src/os/chrisOSKernel/src/paging.c:265
        ptrT[(pageToUnmap&0x003FFFFF/4096)]=0 | newFlags;
 10040a7:	89 ca                	mov    edx,ecx
 10040a9:	81 e2 ff 03 00 00    	and    edx,0x3ff
 10040af:	8d 34 95 00 00 00 20 	lea    esi,[edx*4+0x20000000]
 10040b6:	0f b6 db             	movzx  ebx,bl
 10040b9:	89 1c 95 00 00 00 20 	mov    DWORD PTR [edx*4+0x20000000],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:266
        printd(DEBUG_PAGING,"kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", pageToUnmap, &ptr[(pageToUnmap>>22)], &ptrT[(pageToUnmap&0x003FFFFF/4096)]);
 10040c0:	83 ec 0c             	sub    esp,0xc
 10040c3:	56                   	push   esi
 10040c4:	50                   	push   eax
 10040c5:	51                   	push   ecx
 10040c6:	68 f0 7f 00 01       	push   0x1007ff0
 10040cb:	6a 40                	push   0x40
 10040cd:	e8 c1 e4 ff ff       	call   1002593 <printd>
 10040d2:	83 c4 20             	add    esp,0x20
 10040d5:	eb 2f                	jmp    1004106 <unMapPage+0x97>
/home/yogi/src/os/chrisOSKernel/src/paging.c:277
        ptrVal=ptr[pageToUnmap>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(pageToUnmap&0x003FFFFF)/4096;
        ptrT[ptrVal]=0 | newFlags;
 10040d7:	89 d6                	mov    esi,edx
 10040d9:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 10040df:	89 ca                	mov    edx,ecx
 10040e1:	c1 ea 0a             	shr    edx,0xa
 10040e4:	81 e2 fc 0f 00 00    	and    edx,0xffc
 10040ea:	01 f2                	add    edx,esi
 10040ec:	0f b6 db             	movzx  ebx,bl
 10040ef:	89 1a                	mov    DWORD PTR [edx],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:278
        printd(DEBUG_PAGING,"2) Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", pageToUnmap, &ptr[(pageToUnmap>>22)], &ptrT[ptrVal]);
 10040f1:	83 ec 0c             	sub    esp,0xc
 10040f4:	52                   	push   edx
 10040f5:	50                   	push   eax
 10040f6:	51                   	push   ecx
 10040f7:	68 28 80 00 01       	push   0x1008028
 10040fc:	6a 40                	push   0x40
 10040fe:	e8 90 e4 ff ff       	call   1002593 <printd>
 1004103:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:280
    }
}
 1004106:	5b                   	pop    ebx
 1004107:	5e                   	pop    esi
 1004108:	5f                   	pop    edi
 1004109:	c3                   	ret    

0100410a <pagingSetPhysicalRangeRO>:
pagingSetPhysicalRangeRO():
/home/yogi/src/os/chrisOSKernel/src/paging.c:283

void pagingSetPhysicalRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 100410a:	83 ec 14             	sub    esp,0x14
 100410d:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1004111:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
/home/yogi/src/os/chrisOSKernel/src/paging.c:284
    printd(DEBUG_PAGING,"kMakePhysicalRangeRO: Make 0x%08X(0x%08X)-0x%08X(0x%08X) r/o\n", startAddy, startAddy&0xFffff000, endAddy, endAddy&0xFFFFF000);
 1004115:	89 d1                	mov    ecx,edx
 1004117:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 100411d:	51                   	push   ecx
 100411e:	52                   	push   edx
 100411f:	89 c2                	mov    edx,eax
 1004121:	81 e2 00 f0 ff ff    	and    edx,0xfffff000
 1004127:	52                   	push   edx
 1004128:	50                   	push   eax
 1004129:	68 58 80 00 01       	push   0x1008058
 100412e:	6a 40                	push   0x40
 1004130:	e8 5e e4 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:285
        panic("fix this!!!");
 1004135:	83 c4 14             	add    esp,0x14
 1004138:	68 97 7a 00 01       	push   0x1007a97
 100413d:	e8 b2 df ff ff       	call   10020f4 <panic>
/home/yogi/src/os/chrisOSKernel/src/paging.c:287
        //SetVirtualRangeRO((startAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, (endAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, readOnly);
}
 1004142:	83 c4 1c             	add    esp,0x1c
 1004145:	c3                   	ret    

01004146 <pagingSetPageInUseFlag>:
pagingSetPageInUseFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:290

void pagingSetPageInUseFlag(uintptr_t pageDirAddress, uintptr_t address, bool inUse)
{
 1004146:	56                   	push   esi
 1004147:	53                   	push   ebx
 1004148:	83 ec 04             	sub    esp,0x4
 100414b:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 100414f:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:292
    uintptr_t* ptEntry;
    printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 1004153:	80 7c 24 18 00       	cmp    BYTE PTR [esp+0x18],0x0
 1004158:	74 38                	je     1004192 <pagingSetPageInUseFlag+0x4c>
 100415a:	68 60 77 00 01       	push   0x1007760
 100415f:	53                   	push   ebx
 1004160:	68 98 80 00 01       	push   0x1008098
 1004165:	6a 40                	push   0x40
 1004167:	e8 27 e4 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:293
    ptEntry=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 100416c:	83 c4 08             	add    esp,0x8
 100416f:	53                   	push   ebx
 1004170:	56                   	push   esi
 1004171:	e8 3e fc ff ff       	call   1003db4 <pagingGet4kPTEntryAddress>
 1004176:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:294
    printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 1004178:	ff 30                	push   DWORD PTR [eax]
 100417a:	50                   	push   eax
 100417b:	68 dc 80 00 01       	push   0x10080dc
 1004180:	6a 40                	push   0x40
 1004182:	e8 0c e4 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:296
    if (inUse)
        *ptEntry|=PAGING_IN_USE_FLAG_MASK;
 1004187:	81 0b 00 08 00 00    	or     DWORD PTR [ebx],0x800
 100418d:	83 c4 20             	add    esp,0x20
 1004190:	eb 36                	jmp    10041c8 <pagingSetPageInUseFlag+0x82>
/home/yogi/src/os/chrisOSKernel/src/paging.c:292
}

void pagingSetPageInUseFlag(uintptr_t pageDirAddress, uintptr_t address, bool inUse)
{
    uintptr_t* ptEntry;
    printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 1004192:	68 5c 77 00 01       	push   0x100775c
 1004197:	53                   	push   ebx
 1004198:	68 98 80 00 01       	push   0x1008098
 100419d:	6a 40                	push   0x40
 100419f:	e8 ef e3 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:293
    ptEntry=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 10041a4:	83 c4 08             	add    esp,0x8
 10041a7:	53                   	push   ebx
 10041a8:	56                   	push   esi
 10041a9:	e8 06 fc ff ff       	call   1003db4 <pagingGet4kPTEntryAddress>
 10041ae:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:294
    printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 10041b0:	ff 30                	push   DWORD PTR [eax]
 10041b2:	50                   	push   eax
 10041b3:	68 dc 80 00 01       	push   0x10080dc
 10041b8:	6a 40                	push   0x40
 10041ba:	e8 d4 e3 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:298
    if (inUse)
        *ptEntry|=PAGING_IN_USE_FLAG_MASK;
    else
        *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
 10041bf:	81 23 ff f7 ff ff    	and    DWORD PTR [ebx],0xfffff7ff
 10041c5:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:299
}
 10041c8:	83 c4 04             	add    esp,0x4
 10041cb:	5b                   	pop    ebx
 10041cc:	5e                   	pop    esi
 10041cd:	c3                   	ret    

010041ce <pagingSetPageRangeInUseFlag>:
pagingSetPageRangeInUseFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:302

void pagingSetPageRangeInUseFlag(uintptr_t pageDirAddress, uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
 10041ce:	55                   	push   ebp
 10041cf:	57                   	push   edi
 10041d0:	56                   	push   esi
 10041d1:	53                   	push   ebx
 10041d2:	83 ec 0c             	sub    esp,0xc
 10041d5:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 10041d9:	8b 5c 24 24          	mov    ebx,DWORD PTR [esp+0x24]
 10041dd:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
 10041e1:	0f b6 44 24 30       	movzx  eax,BYTE PTR [esp+0x30]
/home/yogi/src/os/chrisOSKernel/src/paging.c:303
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 10041e6:	39 fb                	cmp    ebx,edi
 10041e8:	73 19                	jae    1004203 <pagingSetPageRangeInUseFlag+0x35>
/home/yogi/src/os/chrisOSKernel/src/paging.c:304 (discriminator 3)
        pagingSetPageInUseFlag(pageDirAddress,cnt,inUse);
 10041ea:	0f b6 f0             	movzx  esi,al
 10041ed:	83 ec 04             	sub    esp,0x4
 10041f0:	56                   	push   esi
 10041f1:	53                   	push   ebx
 10041f2:	55                   	push   ebp
 10041f3:	e8 4e ff ff ff       	call   1004146 <pagingSetPageInUseFlag>
 10041f8:	03 5c 24 3c          	add    ebx,DWORD PTR [esp+0x3c]
/home/yogi/src/os/chrisOSKernel/src/paging.c:303 (discriminator 3)
        *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
}

void pagingSetPageRangeInUseFlag(uintptr_t pageDirAddress, uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 10041fc:	83 c4 10             	add    esp,0x10
 10041ff:	39 fb                	cmp    ebx,edi
 1004201:	72 ea                	jb     10041ed <pagingSetPageRangeInUseFlag+0x1f>
/home/yogi/src/os/chrisOSKernel/src/paging.c:305
        pagingSetPageInUseFlag(pageDirAddress,cnt,inUse);
}
 1004203:	83 c4 0c             	add    esp,0xc
 1004206:	5b                   	pop    ebx
 1004207:	5e                   	pop    esi
 1004208:	5f                   	pop    edi
 1004209:	5d                   	pop    ebp
 100420a:	c3                   	ret    
 100420b:	90                   	nop

0100420c <destroyProcess>:
destroyProcess():
/home/yogi/src/os/chrisOSKernel/src/process.c:15
#include "process.h"
#include "alloc.h"
#include "printf.h"

void destroyProcess(process_t* process)
{
 100420c:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/src/process.c:16
    freePage(process);
 100420f:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1004213:	e8 b3 f2 ff ff       	call   10034cb <freePage>
/home/yogi/src/os/chrisOSKernel/src/process.c:17
}
 1004218:	83 c4 1c             	add    esp,0x1c
 100421b:	c3                   	ret    

0100421c <createProcess>:
createProcess():
/home/yogi/src/os/chrisOSKernel/src/process.c:20

process_t* createProcess(bool kernelTSS, char* path)
{
 100421c:	53                   	push   ebx
 100421d:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/src/process.c:24

    process_t* process;
    
    process=(process_t*)allocPages(sizeof(process_t));
 1004220:	68 04 02 00 00       	push   0x204
 1004225:	e8 05 f2 ff ff       	call   100342f <allocPages>
 100422a:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/process.c:25
    printd(DEBUG_PROCESS,"Created Process @ 0x%08X\n",process);
 100422c:	83 c4 0c             	add    esp,0xc
 100422f:	50                   	push   eax
 1004230:	68 a3 7a 00 01       	push   0x1007aa3
 1004235:	68 00 00 04 00       	push   0x40000
 100423a:	e8 54 e3 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/process.c:26
    process->task=createTask(true);
 100423f:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 1004246:	e8 42 01 00 00       	call   100438d <createTask>
 100424b:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/chrisOSKernel/src/process.c:29
    
    
 100424d:	83 c4 18             	add    esp,0x18
 1004250:	5b                   	pop    ebx
 1004251:	c3                   	ret    
 1004252:	66 90                	xchg   ax,ax

01004254 <syscall169>:
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:25

void syscall169()
{
    uint8_t temp;
 
    __asm__ volatile ("cli"); /* disable all interrupts */
 1004254:	fa                   	cli    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1004255:	e4 64                	in     al,0x64
 1004257:	89 c2                	mov    edx,eax
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:30
    /* Clear all keyboard buffers (output and command buffers) */
    do
    {
        temp = inb(KBRD_INTRFC); /* empty user data */
        if (check_flag(temp, KBRD_BIT_KDATA) != 0)
 1004259:	a8 01                	test   al,0x1
 100425b:	74 02                	je     100425f <syscall169+0xb>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 100425d:	e4 60                	in     al,0x60
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:32
            inb(KBRD_IO); /* empty keyboard data */
    } while (check_flag(temp, KBRD_BIT_UDATA) != 0);
 100425f:	f6 c2 02             	test   dl,0x2
 1004262:	75 f1                	jne    1004255 <syscall169+0x1>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1004264:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 1004269:	e6 64                	out    0x64,al
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:36 (discriminator 1)
 
    outb(KBRD_INTRFC, KBRD_RESET); /* pulse CPU reset line */
loop:
    __asm__ volatile ("hlt"); /* if that didn't work, halt the CPU */
 100426b:	f4                   	hlt    
 100426c:	eb fd                	jmp    100426b <syscall169+0x17>
 100426e:	66 90                	xchg   ax,ax

01004270 <taskInit>:
taskInit():
/home/yogi/src/os/chrisOSKernel/src/task.c:15
extern tss_t* kTSSTable;
extern task_t* kTaskTable;
extern uint32_t kDebugLevel;

void taskInit()
{
 1004270:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:18 (discriminator 3)
    for (int cnt=0;cnt<TSS_TABLE_RECORD_COUNT/8;cnt++)
    {
        kTaskSlotAvailableInd[cnt]=0xFFFFFFFF;
 1004275:	8b 15 48 01 12 00    	mov    edx,DWORD PTR ds:0x120148
 100427b:	c7 04 02 ff ff ff ff 	mov    DWORD PTR [edx+eax*1],0xffffffff
 1004282:	83 c0 04             	add    eax,0x4
/home/yogi/src/os/chrisOSKernel/src/task.c:16 (discriminator 3)
extern task_t* kTaskTable;
extern uint32_t kDebugLevel;

void taskInit()
{
    for (int cnt=0;cnt<TSS_TABLE_RECORD_COUNT/8;cnt++)
 1004285:	3d 00 20 00 00       	cmp    eax,0x2000
 100428a:	75 e9                	jne    1004275 <taskInit+0x5>
/home/yogi/src/os/chrisOSKernel/src/task.c:20
    {
        kTaskSlotAvailableInd[cnt]=0xFFFFFFFF;
    }
}
 100428c:	f3 c3                	repz ret 

0100428e <getTaskSlot>:
getTaskSlot():
/home/yogi/src/os/chrisOSKernel/src/task.c:24

///Find an open TSS slot and mark it in use
task_t* getTaskSlot()
{
 100428e:	57                   	push   edi
 100428f:	56                   	push   esi
 1004290:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/src/task.c:26
   int cnt=0,slot=0;
   uint32_t* ptr=kTaskSlotAvailableInd;
 1004291:	8b 1d 48 01 12 00    	mov    ebx,DWORD PTR ds:0x120148
/home/yogi/src/os/chrisOSKernel/src/task.c:25
}

///Find an open TSS slot and mark it in use
task_t* getTaskSlot()
{
   int cnt=0,slot=0;
 1004297:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:29
   uint32_t* ptr=kTaskSlotAvailableInd;
    while (cnt < TSS_TABLE_RECORD_COUNT/32)
    {
        printd (DEBUG_TASK,"getTask: Checking slots at 0x%08X, cnt=%u\n",ptr,cnt);
 100429c:	56                   	push   esi
 100429d:	53                   	push   ebx
 100429e:	68 00 91 00 01       	push   0x1009100
 10042a3:	68 00 40 00 00       	push   0x4000
 10042a8:	e8 e6 e2 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/task.c:30
        slot=bitsScanF(ptr);
 10042ad:	89 1c 24             	mov    DWORD PTR [esp],ebx
 10042b0:	e8 b6 c3 ff ff       	call   100066b <bitsScanF>
 10042b5:	89 c7                	mov    edi,eax
/home/yogi/src/os/chrisOSKernel/src/task.c:31
        if (slot>-1)
 10042b7:	83 c4 10             	add    esp,0x10
 10042ba:	85 c0                	test   eax,eax
 10042bc:	78 5f                	js     100431d <getTaskSlot+0x8f>
/home/yogi/src/os/chrisOSKernel/src/task.c:33
        {
            task_t* task=&kTaskTable[slot];
 10042be:	89 c6                	mov    esi,eax
 10042c0:	c1 e6 04             	shl    esi,0x4
 10042c3:	03 35 fc 03 12 00    	add    esi,DWORD PTR ds:0x1203fc
/home/yogi/src/os/chrisOSKernel/src/task.c:34
            printd(DEBUG_TASK,"getTask: Marking TSS %u used\n",slot);
 10042c9:	83 ec 04             	sub    esp,0x4
 10042cc:	50                   	push   eax
 10042cd:	68 bd 7a 00 01       	push   0x1007abd
 10042d2:	68 00 40 00 00       	push   0x4000
 10042d7:	e8 b7 e2 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/task.c:35
            bitsReset(ptr,slot);
 10042dc:	83 c4 08             	add    esp,0x8
 10042df:	57                   	push   edi
 10042e0:	53                   	push   ebx
 10042e1:	e8 53 c3 ff ff       	call   1000639 <bitsReset>
/home/yogi/src/os/chrisOSKernel/src/task.c:36
            task->tss=&kTSSTable[slot];
 10042e6:	6b c7 68             	imul   eax,edi,0x68
 10042e9:	03 05 f8 03 12 00    	add    eax,DWORD PTR ds:0x1203f8
 10042ef:	89 06                	mov    DWORD PTR [esi],eax
/home/yogi/src/os/chrisOSKernel/src/task.c:37
            if (slot>0)
 10042f1:	83 c4 10             	add    esp,0x10
 10042f4:	85 ff                	test   edi,edi
 10042f6:	7e 09                	jle    1004301 <getTaskSlot+0x73>
/home/yogi/src/os/chrisOSKernel/src/task.c:39
            {
                (task-1)->next=task;
 10042f8:	89 76 f8             	mov    DWORD PTR [esi-0x8],esi
/home/yogi/src/os/chrisOSKernel/src/task.c:40
                task->prev=(task-1);
 10042fb:	8d 56 f0             	lea    edx,[esi-0x10]
 10042fe:	89 56 0c             	mov    DWORD PTR [esi+0xc],edx
/home/yogi/src/os/chrisOSKernel/src/task.c:42
            }
            printd(DEBUG_TASK,"getTask: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
 1004301:	83 ec 0c             	sub    esp,0xc
 1004304:	50                   	push   eax
 1004305:	56                   	push   esi
 1004306:	57                   	push   edi
 1004307:	68 2c 91 00 01       	push   0x100912c
 100430c:	68 00 40 00 00       	push   0x4000
 1004311:	e8 7d e2 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/task.c:43
            return task;
 1004316:	83 c4 20             	add    esp,0x20
 1004319:	89 f0                	mov    eax,esi
 100431b:	eb 27                	jmp    1004344 <getTaskSlot+0xb6>
/home/yogi/src/os/chrisOSKernel/src/task.c:45
        }
        ptr++;cnt++;
 100431d:	83 c3 04             	add    ebx,0x4
 1004320:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/chrisOSKernel/src/task.c:27
///Find an open TSS slot and mark it in use
task_t* getTaskSlot()
{
   int cnt=0,slot=0;
   uint32_t* ptr=kTaskSlotAvailableInd;
    while (cnt < TSS_TABLE_RECORD_COUNT/32)
 1004323:	81 fe 00 02 00 00    	cmp    esi,0x200
 1004329:	0f 85 6d ff ff ff    	jne    100429c <getTaskSlot+0xe>
/home/yogi/src/os/chrisOSKernel/src/task.c:47
            printd(DEBUG_TASK,"getTask: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
            return task;
        }
        ptr++;cnt++;
    }
    printk("tssUseAvailable: Cannot allocate TSS for new task");
 100432f:	83 ec 0c             	sub    esp,0xc
 1004332:	68 60 91 00 01       	push   0x1009160
 1004337:	e8 3f e2 ff ff       	call   100257b <printk>
/home/yogi/src/os/chrisOSKernel/src/task.c:48
    return NULL;
 100433c:	83 c4 10             	add    esp,0x10
 100433f:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:49
}
 1004344:	5b                   	pop    ebx
 1004345:	5e                   	pop    esi
 1004346:	5f                   	pop    edi
 1004347:	c3                   	ret    

01004348 <mmMapKernelIntoTask>:
mmMapKernelIntoTask():
/home/yogi/src/os/chrisOSKernel/src/task.c:52

void mmMapKernelIntoTask(task_t* task)
{
 1004348:	57                   	push   edi
 1004349:	56                   	push   esi
 100434a:	53                   	push   ebx
 100434b:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/task.c:53
    uint32_t debugVal=kDebugLevel;
 100434f:	8b 3d 38 03 12 00    	mov    edi,DWORD PTR ds:0x120338
/home/yogi/src/os/chrisOSKernel/src/task.c:54
    kDebugLevel=0;
 1004355:	c7 05 38 03 12 00 00 	mov    DWORD PTR ds:0x120338,0x0
 100435c:	00 00 00 
 100435f:	bb 00 00 00 c0       	mov    ebx,0xc0000000
/home/yogi/src/os/chrisOSKernel/src/task.c:56 (discriminator 3)
    for (int cnt=KERNEL_PAGED_BASE_ADDRESS;cnt<KERNEL_PAGED_BASE_ADDRESS+0x0FFFFFFF;cnt+=1000)
        pagingMapPage(task->tss->CR3,cnt,cnt,0x3);
 1004364:	6a 03                	push   0x3
 1004366:	53                   	push   ebx
 1004367:	53                   	push   ebx
 1004368:	8b 06                	mov    eax,DWORD PTR [esi]
 100436a:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 100436d:	e8 42 fc ff ff       	call   1003fb4 <pagingMapPage>
/home/yogi/src/os/chrisOSKernel/src/task.c:55 (discriminator 3)

void mmMapKernelIntoTask(task_t* task)
{
    uint32_t debugVal=kDebugLevel;
    kDebugLevel=0;
    for (int cnt=KERNEL_PAGED_BASE_ADDRESS;cnt<KERNEL_PAGED_BASE_ADDRESS+0x0FFFFFFF;cnt+=1000)
 1004372:	81 c3 e8 03 00 00    	add    ebx,0x3e8
 1004378:	83 c4 10             	add    esp,0x10
 100437b:	81 fb 20 02 00 d0    	cmp    ebx,0xd0000220
 1004381:	75 e1                	jne    1004364 <mmMapKernelIntoTask+0x1c>
/home/yogi/src/os/chrisOSKernel/src/task.c:57
        pagingMapPage(task->tss->CR3,cnt,cnt,0x3);
    kDebugLevel=debugVal;
 1004383:	89 3d 38 03 12 00    	mov    DWORD PTR ds:0x120338,edi
/home/yogi/src/os/chrisOSKernel/src/task.c:58
}
 1004389:	5b                   	pop    ebx
 100438a:	5e                   	pop    esi
 100438b:	5f                   	pop    edi
 100438c:	c3                   	ret    

0100438d <createTask>:
createTask():
/home/yogi/src/os/chrisOSKernel/src/task.c:61

task_t* createTask(bool kernelTSS)
{
 100438d:	56                   	push   esi
 100438e:	53                   	push   ebx
 100438f:	83 ec 04             	sub    esp,0x4
 1004392:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/task.c:62
    task_t* task=getTaskSlot();     //create task in the kTaskTable, also a tss in the same slot# in kTSSTable
 1004396:	e8 f3 fe ff ff       	call   100428e <getTaskSlot>
/home/yogi/src/os/chrisOSKernel/src/task.c:64
    
    if (task==0)
 100439b:	85 c0                	test   eax,eax
 100439d:	0f 84 c0 00 00 00    	je     1004463 <createTask+0xd6>
 10043a3:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/task.c:66
        return NULL;
    kDebugLevel |= DEBUG_PAGING;
 10043a5:	83 0d 38 03 12 00 40 	or     DWORD PTR ds:0x120338,0x40
/home/yogi/src/os/chrisOSKernel/src/task.c:69
    
    //Configure the task registers
    task->tss->EAX=0;
 10043ac:	8b 00                	mov    eax,DWORD PTR [eax]
 10043ae:	c7 40 28 00 00 00 00 	mov    DWORD PTR [eax+0x28],0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:70
    task->tss->EBX=task->tss->ECX=task->tss->EDX=task->tss->ESI=task->tss->EDI=task->tss->EBP=0;
 10043b5:	8b 03                	mov    eax,DWORD PTR [ebx]
 10043b7:	c7 40 3c 00 00 00 00 	mov    DWORD PTR [eax+0x3c],0x0
 10043be:	c7 40 44 00 00 00 00 	mov    DWORD PTR [eax+0x44],0x0
 10043c5:	c7 40 40 00 00 00 00 	mov    DWORD PTR [eax+0x40],0x0
 10043cc:	c7 40 30 00 00 00 00 	mov    DWORD PTR [eax+0x30],0x0
 10043d3:	c7 40 2c 00 00 00 00 	mov    DWORD PTR [eax+0x2c],0x0
 10043da:	c7 40 34 00 00 00 00 	mov    DWORD PTR [eax+0x34],0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:71
    task->tss->SS0=0x10;
 10043e1:	8b 03                	mov    eax,DWORD PTR [ebx]
 10043e3:	66 c7 40 0a 10 00    	mov    WORD PTR [eax+0xa],0x10
/home/yogi/src/os/chrisOSKernel/src/task.c:74
    
    //If it is a kernel task
    if (kernelTSS)
 10043e9:	89 f0                	mov    eax,esi
 10043eb:	84 c0                	test   al,al
 10043ed:	74 1c                	je     100440b <createTask+0x7e>
/home/yogi/src/os/chrisOSKernel/src/task.c:75
        task->tss->ES=task->tss->DS=task->tss->FS=task->tss->GS=0x10;
 10043ef:	8b 03                	mov    eax,DWORD PTR [ebx]
 10043f1:	66 c7 40 5e 10 00    	mov    WORD PTR [eax+0x5e],0x10
 10043f7:	66 c7 40 5a 10 00    	mov    WORD PTR [eax+0x5a],0x10
 10043fd:	66 c7 40 56 10 00    	mov    WORD PTR [eax+0x56],0x10
 1004403:	66 c7 40 4a 10 00    	mov    WORD PTR [eax+0x4a],0x10
 1004409:	eb 10                	jmp    100441b <createTask+0x8e>
/home/yogi/src/os/chrisOSKernel/src/task.c:77
    else
        panic("write non-kernel segment pop code");
 100440b:	83 ec 0c             	sub    esp,0xc
 100440e:	68 94 91 00 01       	push   0x1009194
 1004413:	e8 dc dc ff ff       	call   10020f4 <panic>
 1004418:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/task.c:78
    task->tss->IOPB=0xFFFF;
 100441b:	8b 03                	mov    eax,DWORD PTR [ebx]
 100441d:	66 c7 40 64 ff ff    	mov    WORD PTR [eax+0x64],0xffff
/home/yogi/src/os/chrisOSKernel/src/task.c:79
    task->tss->CR3=(uint32_t)allocPages(0x1000);
 1004423:	8b 33                	mov    esi,DWORD PTR [ebx]
 1004425:	83 ec 0c             	sub    esp,0xc
 1004428:	68 00 10 00 00       	push   0x1000
 100442d:	e8 fd ef ff ff       	call   100342f <allocPages>
 1004432:	89 46 1c             	mov    DWORD PTR [esi+0x1c],eax
/home/yogi/src/os/chrisOSKernel/src/task.c:80
    printd(DEBUG_TASK,"Malloc'd 1k task page directory @ 0x%08X\n",task->tss->CR3);
 1004435:	83 c4 0c             	add    esp,0xc
 1004438:	8b 03                	mov    eax,DWORD PTR [ebx]
 100443a:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 100443d:	68 b8 91 00 01       	push   0x10091b8
 1004442:	68 00 40 00 00       	push   0x4000
 1004447:	e8 47 e1 ff ff       	call   1002593 <printd>
/home/yogi/src/os/chrisOSKernel/src/task.c:81
    task->pageTable=(uint32_t*)task->tss->CR3;
 100444c:	8b 03                	mov    eax,DWORD PTR [ebx]
 100444e:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1004451:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
/home/yogi/src/os/chrisOSKernel/src/task.c:82
    mmMapKernelIntoTask(task);
 1004454:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1004457:	e8 ec fe ff ff       	call   1004348 <mmMapKernelIntoTask>
/home/yogi/src/os/chrisOSKernel/src/task.c:83
    return task;
 100445c:	83 c4 10             	add    esp,0x10
 100445f:	89 d8                	mov    eax,ebx
 1004461:	eb 05                	jmp    1004468 <createTask+0xdb>
/home/yogi/src/os/chrisOSKernel/src/task.c:65
task_t* createTask(bool kernelTSS)
{
    task_t* task=getTaskSlot();     //create task in the kTaskTable, also a tss in the same slot# in kTSSTable
    
    if (task==0)
        return NULL;
 1004463:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:84
    task->tss->CR3=(uint32_t)allocPages(0x1000);
    printd(DEBUG_TASK,"Malloc'd 1k task page directory @ 0x%08X\n",task->tss->CR3);
    task->pageTable=(uint32_t*)task->tss->CR3;
    mmMapKernelIntoTask(task);
    return task;
}
 1004468:	83 c4 04             	add    esp,0x4
 100446b:	5b                   	pop    ebx
 100446c:	5e                   	pop    esi
 100446d:	c3                   	ret    
