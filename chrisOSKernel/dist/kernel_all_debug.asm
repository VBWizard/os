
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

0100004e <getCS>:
getCS():
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:49
.global getCS
.type getCS, @function
getCS:
.code32
    push cs
 100004e:	0e                   	push   cs
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:50
    pop eax
 100004f:	58                   	pop    eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/asm/asmFunctions.s:51
 1000050:	c3                   	ret    
 1000051:	66 90                	xchg   ax,ax
 1000053:	90                   	nop

01000054 <update_cursor>:
update_cursor():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:26
KERNEL_DATA_SECTION int8_t savedPosPointer=0;
KERNEL_DATA_SECTION uint8_t kTerminalHeight;

void update_cursor()
 {
    unsigned short position=(terminal_row*VGA_WIDTH) + terminal_column;
 1000054:	8b 0d 00 00 12 00    	mov    ecx,DWORD PTR ds:0x120000
 100005a:	8d 0c 89             	lea    ecx,[ecx+ecx*4]
 100005d:	c1 e1 04             	shl    ecx,0x4
 1000060:	66 03 0d 04 00 12 00 	add    cx,WORD PTR ds:0x120004
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1000067:	ba d4 03 00 00       	mov    edx,0x3d4
 100006c:	b8 0f 00 00 00       	mov    eax,0xf
 1000071:	ee                   	out    dx,al
 1000072:	ba d5 03 00 00       	mov    edx,0x3d5
 1000077:	89 c8                	mov    eax,ecx
 1000079:	ee                   	out    dx,al
 100007a:	ba d4 03 00 00       	mov    edx,0x3d4
 100007f:	b8 0e 00 00 00       	mov    eax,0xe
 1000084:	ee                   	out    dx,al
 1000085:	89 c8                	mov    eax,ecx
 1000087:	66 c1 e8 08          	shr    ax,0x8
 100008b:	ba d5 03 00 00       	mov    edx,0x3d5
 1000090:	ee                   	out    dx,al
 1000091:	c3                   	ret    

01000092 <make_color>:
make_color():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:38
    outb(0x3D5, (unsigned char )((position>>8)&0xFF));
    //Move the cursor in the bios data area
 }

uint8_t make_color(enum vga_color fg, enum vga_color bg) {
        return fg | bg << 4;
 1000092:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 1000097:	c1 e0 04             	shl    eax,0x4
 100009a:	0a 44 24 04          	or     al,BYTE PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:39
}
 100009e:	c3                   	ret    

0100009f <make_vgaentry>:
make_vgaentry():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:44

uint16_t make_vgaentry(char c, uint8_t color) {
        uint16_t c16 = c;
        uint16_t color16 = color;
        return c16 | color16 << 8;
 100009f:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 10000a4:	c1 e0 08             	shl    eax,0x8
 10000a7:	66 0f be 54 24 04    	movsx  dx,BYTE PTR [esp+0x4]
 10000ad:	09 d0                	or     eax,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:45
}
 10000af:	c3                   	ret    

010000b0 <terminal_setcolor>:
terminal_setcolor():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:49


void terminal_setcolor(uint8_t color) {
        terminal_color = color;
 10000b0:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 10000b4:	a2 08 00 12 00       	mov    ds:0x120008,al
 10000b9:	c3                   	ret    

010000ba <terminal_putentryat>:
terminal_putentryat():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:52
}

void terminal_putentryat(char c, uint8_t color, size_t x, size_t y) {
 10000ba:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:54
    const size_t index = y * VGA_WIDTH + x;
        terminal_buffer[index] = make_vgaentry(c, color);
 10000be:	8d 04 80             	lea    eax,[eax+eax*4]
 10000c1:	c1 e0 04             	shl    eax,0x4
 10000c4:	03 44 24 0c          	add    eax,DWORD PTR [esp+0xc]
 10000c8:	0f b6 54 24 08       	movzx  edx,BYTE PTR [esp+0x8]
 10000cd:	c1 e2 08             	shl    edx,0x8
 10000d0:	66 0f be 4c 24 04    	movsx  cx,BYTE PTR [esp+0x4]
 10000d6:	09 ca                	or     edx,ecx
 10000d8:	8b 0d 0c 00 12 00    	mov    ecx,DWORD PTR ds:0x12000c
 10000de:	66 89 14 41          	mov    WORD PTR [ecx+eax*2],dx
 10000e2:	c3                   	ret    

010000e3 <cursorSavePosition>:
cursorSavePosition():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:59
}

void cursorSavePosition()
{
    if (savedPosPointer < 10)
 10000e3:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
 10000ea:	3c 09                	cmp    al,0x9
 10000ec:	7f 23                	jg     1000111 <cursorSavePosition+0x2e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:61
    {
        savedPosX[++savedPosPointer] = terminal_column;
 10000ee:	83 c0 01             	add    eax,0x1
 10000f1:	a2 26 00 12 00       	mov    ds:0x120026,al
 10000f6:	0f be c0             	movsx  eax,al
 10000f9:	8b 15 04 00 12 00    	mov    edx,DWORD PTR ds:0x120004
 10000ff:	88 90 10 00 12 00    	mov    BYTE PTR [eax+0x120010],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:62
        savedPosY[savedPosPointer] = terminal_row;
 1000105:	8b 15 00 00 12 00    	mov    edx,DWORD PTR ds:0x120000
 100010b:	88 90 1c 00 12 00    	mov    BYTE PTR [eax+0x12001c],dl
 1000111:	f3 c3                	repz ret 

01000113 <cursorRestorePosition>:
cursorRestorePosition():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:68
    }
}

void cursorRestorePosition()
{
    if (savedPosPointer > 0)
 1000113:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
 100011a:	84 c0                	test   al,al
 100011c:	7e 29                	jle    1000147 <cursorRestorePosition+0x34>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:70
    {
        terminal_column = savedPosX[savedPosPointer];
 100011e:	0f be d0             	movsx  edx,al
 1000121:	0f b6 8a 10 00 12 00 	movzx  ecx,BYTE PTR [edx+0x120010]
 1000128:	89 0d 04 00 12 00    	mov    DWORD PTR ds:0x120004,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:71
        terminal_row = savedPosY[savedPosPointer--];
 100012e:	83 e8 01             	sub    eax,0x1
 1000131:	a2 26 00 12 00       	mov    ds:0x120026,al
 1000136:	0f b6 82 1c 00 12 00 	movzx  eax,BYTE PTR [edx+0x12001c]
 100013d:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:72
        update_cursor();
 1000142:	e8 0d ff ff ff       	call   1000054 <update_cursor>
 1000147:	f3 c3                	repz ret 

01000149 <terminal_clear>:
terminal_clear():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:77
    }
}

void terminal_clear()
{
 1000149:	56                   	push   esi
 100014a:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:79
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
 100014b:	ba 00 00 00 00       	mov    edx,0x0
 1000150:	be 00 00 00 00       	mov    esi,0x0
 1000155:	80 3d 27 00 12 00 00 	cmp    BYTE PTR ds:0x120027,0x0
 100015c:	75 30                	jne    100018e <terminal_clear+0x45>
 100015e:	eb 36                	jmp    1000196 <terminal_clear+0x4d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:82 (discriminator 3)
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
 1000160:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
 1000167:	c1 e0 08             	shl    eax,0x8
 100016a:	83 c8 20             	or     eax,0x20
 100016d:	8b 0d 0c 00 12 00    	mov    ecx,DWORD PTR ds:0x12000c
 1000173:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
 1000177:	83 c2 02             	add    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:80 (discriminator 3)

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
                for (size_t x = 0; x < VGA_WIDTH; x++) {
 100017a:	39 d3                	cmp    ebx,edx
 100017c:	75 e2                	jne    1000160 <terminal_clear+0x17>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:79 (discriminator 2)
}

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
 100017e:	83 c6 01             	add    esi,0x1
 1000181:	89 da                	mov    edx,ebx
 1000183:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
 100018a:	39 f0                	cmp    eax,esi
 100018c:	76 08                	jbe    1000196 <terminal_clear+0x4d>
 100018e:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
 1000194:	eb ca                	jmp    1000160 <terminal_clear+0x17>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:85
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
                }
        }
    terminal_column=0;
 1000196:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
 100019d:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:86
    terminal_row=0;
 10001a0:	c7 05 00 00 12 00 00 	mov    DWORD PTR ds:0x120000,0x0
 10001a7:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:87
    update_cursor();
 10001aa:	e8 a5 fe ff ff       	call   1000054 <update_cursor>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:88
}
 10001af:	5b                   	pop    ebx
 10001b0:	5e                   	pop    esi
 10001b1:	c3                   	ret    

010001b2 <terminal_clear_line>:
terminal_clear_line():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:91

void terminal_clear_line(unsigned lineNo)
{
 10001b2:	53                   	push   ebx
 10001b3:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:92
    if (lineNo>SYS_VGA_HEIGHT-1)
 10001b7:	83 f8 31             	cmp    eax,0x31
 10001ba:	77 2a                	ja     10001e6 <terminal_clear_line+0x34>
 10001bc:	8d 14 80             	lea    edx,[eax+eax*4]
 10001bf:	c1 e2 05             	shl    edx,0x5
 10001c2:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:97 (discriminator 3)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
 10001c8:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
 10001cf:	c1 e0 08             	shl    eax,0x8
 10001d2:	83 c8 20             	or     eax,0x20
 10001d5:	8b 0d 0c 00 12 00    	mov    ecx,DWORD PTR ds:0x12000c
 10001db:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
 10001df:	83 c2 02             	add    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:94 (discriminator 3)

void terminal_clear_line(unsigned lineNo)
{
    if (lineNo>SYS_VGA_HEIGHT-1)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
 10001e2:	39 da                	cmp    edx,ebx
 10001e4:	75 e2                	jne    10001c8 <terminal_clear_line+0x16>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:99
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
    }
}
 10001e6:	5b                   	pop    ebx
 10001e7:	c3                   	ret    

010001e8 <terminal_copyline>:
terminal_copyline():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:102

void terminal_copyline(unsigned dstLine, unsigned srcLine)
{
 10001e8:	83 ec 10             	sub    esp,0x10
 10001eb:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
 10001ef:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:107
    unsigned rowBytes = VGA_WIDTH*2;
    uintptr_t dest=(uintptr_t)TEXTMODE_MEMORY_START+(dstLine*rowBytes);
    uintptr_t src=(uintptr_t)TEXTMODE_MEMORY_START+(srcLine*rowBytes);
    
    memcpy((void*)dest,(void*)src,rowBytes);
 10001f3:	68 a0 00 00 00       	push   0xa0
 10001f8:	8d 04 80             	lea    eax,[eax+eax*4]
 10001fb:	c1 e0 05             	shl    eax,0x5
 10001fe:	05 00 80 0b 00       	add    eax,0xb8000
 1000203:	50                   	push   eax
 1000204:	8d 04 92             	lea    eax,[edx+edx*4]
 1000207:	c1 e0 05             	shl    eax,0x5
 100020a:	05 00 80 0b 00       	add    eax,0xb8000
 100020f:	50                   	push   eax
 1000210:	e8 fb 1d 00 00       	call   1002010 <memcpy>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:108
}
 1000215:	83 c4 1c             	add    esp,0x1c
 1000218:	c3                   	ret    

01000219 <terminal_putchar>:
terminal_putchar():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:110

void terminal_putchar(char c) {
 1000219:	53                   	push   ebx
 100021a:	83 ec 08             	sub    esp,0x8
 100021d:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:111
    if (c=='\n')
 1000221:	3c 0a                	cmp    al,0xa
 1000223:	75 16                	jne    100023b <terminal_putchar+0x22>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:113
    {
            terminal_column = 0;
 1000225:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
 100022c:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:114
            terminal_row += 1;
 100022f:	83 05 00 00 12 00 01 	add    DWORD PTR ds:0x120000,0x1
 1000236:	e9 d8 00 00 00       	jmp    1000313 <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:116
    }
    else if (c=='\b')
 100023b:	3c 08                	cmp    al,0x8
 100023d:	75 48                	jne    1000287 <terminal_putchar+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:118
    {
        if (terminal_column > 1)
 100023f:	a1 04 00 12 00       	mov    eax,ds:0x120004
 1000244:	83 f8 01             	cmp    eax,0x1
 1000247:	76 0a                	jbe    1000253 <terminal_putchar+0x3a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:119
            terminal_column--;
 1000249:	83 e8 01             	sub    eax,0x1
 100024c:	a3 04 00 12 00       	mov    ds:0x120004,eax
 1000251:	eb 11                	jmp    1000264 <terminal_putchar+0x4b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:122
        else
        {
            terminal_row--;
 1000253:	83 2d 00 00 12 00 01 	sub    DWORD PTR ds:0x120000,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:123
            terminal_column=VGA_WIDTH;
 100025a:	c7 05 04 00 12 00 50 	mov    DWORD PTR ds:0x120004,0x50
 1000261:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:125
        }
        terminal_putentryat(' ', terminal_color, terminal_column, terminal_row);
 1000264:	ff 35 00 00 12 00    	push   DWORD PTR ds:0x120000
 100026a:	ff 35 04 00 12 00    	push   DWORD PTR ds:0x120004
 1000270:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
 1000277:	50                   	push   eax
 1000278:	6a 20                	push   0x20
 100027a:	e8 3b fe ff ff       	call   10000ba <terminal_putentryat>
 100027f:	83 c4 10             	add    esp,0x10
 1000282:	e9 8c 00 00 00       	jmp    1000313 <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:128
        
    }
    else if (c=='\t')
 1000287:	3c 09                	cmp    al,0x9
 1000289:	75 3b                	jne    10002c6 <terminal_putchar+0xad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:130
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
 100028b:	8b 0d 04 00 12 00    	mov    ecx,DWORD PTR ds:0x120004
 1000291:	ba cd cc cc cc       	mov    edx,0xcccccccd
 1000296:	89 c8                	mov    eax,ecx
 1000298:	f7 e2                	mul    edx
 100029a:	c1 ea 02             	shr    edx,0x2
 100029d:	8d 5c 92 05          	lea    ebx,[edx+edx*4+0x5]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:132
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
 10002a1:	39 d9                	cmp    ecx,ebx
 10002a3:	b8 05 00 00 00       	mov    eax,0x5
 10002a8:	0f 44 d8             	cmove  ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:134
        
        while (terminal_column < goTo)
 10002ab:	39 d9                	cmp    ecx,ebx
 10002ad:	73 64                	jae    1000313 <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:135
            terminal_putchar(' ');;
 10002af:	83 ec 0c             	sub    esp,0xc
 10002b2:	6a 20                	push   0x20
 10002b4:	e8 60 ff ff ff       	call   1000219 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:134
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
        
        while (terminal_column < goTo)
 10002b9:	83 c4 10             	add    esp,0x10
 10002bc:	3b 1d 04 00 12 00    	cmp    ebx,DWORD PTR ds:0x120004
 10002c2:	77 eb                	ja     10002af <terminal_putchar+0x96>
 10002c4:	eb 4d                	jmp    1000313 <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:141
    
    //6 - cnt=0 to (5-1) 4
    //8 - cnt= to (5-3) 2
    }
    //We're going to ignore carriage return since most systems don't use it.  Unfortunately the FAT library we are using does
    else if (c=='\r')
 10002c6:	3c 0d                	cmp    al,0xd
 10002c8:	0f 84 86 00 00 00    	je     1000354 <terminal_putchar+0x13b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:146
        return;

        else
        {
                terminal_putentryat(c, terminal_color, terminal_column, terminal_row);
 10002ce:	ff 35 00 00 12 00    	push   DWORD PTR ds:0x120000
 10002d4:	ff 35 04 00 12 00    	push   DWORD PTR ds:0x120004
 10002da:	0f b6 15 08 00 12 00 	movzx  edx,BYTE PTR ds:0x120008
 10002e1:	52                   	push   edx
 10002e2:	0f be c0             	movsx  eax,al
 10002e5:	50                   	push   eax
 10002e6:	e8 cf fd ff ff       	call   10000ba <terminal_putentryat>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:147
                if (++terminal_column == VGA_WIDTH) {
 10002eb:	a1 04 00 12 00       	mov    eax,ds:0x120004
 10002f0:	83 c0 01             	add    eax,0x1
 10002f3:	83 c4 10             	add    esp,0x10
 10002f6:	83 f8 50             	cmp    eax,0x50
 10002f9:	74 07                	je     1000302 <terminal_putchar+0xe9>
 10002fb:	a3 04 00 12 00       	mov    ds:0x120004,eax
 1000300:	eb 11                	jmp    1000313 <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:148
                        terminal_column = 0;
 1000302:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
 1000309:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:149
                        terminal_row++;
 100030c:	83 05 00 00 12 00 01 	add    DWORD PTR ds:0x120000,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:152
                }
        }
    if (terminal_row == kTerminalHeight)
 1000313:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
 100031a:	3b 05 00 00 12 00    	cmp    eax,DWORD PTR ds:0x120000
 1000320:	75 2d                	jne    100034f <terminal_putchar+0x136>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:154 (discriminator 1)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
 1000322:	85 c0                	test   eax,eax
 1000324:	74 22                	je     1000348 <terminal_putchar+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:154
 1000326:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:155 (discriminator 3)
            terminal_copyline(row, row+1);
 100032b:	8d 58 01             	lea    ebx,[eax+0x1]
 100032e:	83 ec 08             	sub    esp,0x8
 1000331:	53                   	push   ebx
 1000332:	50                   	push   eax
 1000333:	e8 b0 fe ff ff       	call   10001e8 <terminal_copyline>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:154 (discriminator 3)
                        terminal_row++;
                }
        }
    if (terminal_row == kTerminalHeight)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
 1000338:	89 d8                	mov    eax,ebx
 100033a:	0f b6 15 27 00 12 00 	movzx  edx,BYTE PTR ds:0x120027
 1000341:	83 c4 10             	add    esp,0x10
 1000344:	39 da                	cmp    edx,ebx
 1000346:	77 e3                	ja     100032b <terminal_putchar+0x112>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:157
            terminal_copyline(row, row+1);
        //memcpy((void *)TEXTMODE_MEMORY_START, (void *)TEXTMODE_MEMORY_START+160, 160*25);
        terminal_row--;
 1000348:	83 2d 00 00 12 00 01 	sub    DWORD PTR ds:0x120000,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:159
    }
    update_cursor();
 100034f:	e8 00 fd ff ff       	call   1000054 <update_cursor>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:160
}
 1000354:	83 c4 08             	add    esp,0x8
 1000357:	5b                   	pop    ebx
 1000358:	c3                   	ret    

01000359 <cursorUpdateBiosCursor>:
cursorUpdateBiosCursor():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:165

void cursorUpdateBiosCursor()
{
    uint8_t* bda=(uint8_t*)0x450;
    *bda=(uint8_t)(terminal_column & 0xFF);
 1000359:	a1 04 00 12 00       	mov    eax,ds:0x120004
 100035e:	a2 50 04 00 00       	mov    ds:0x450,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:167
    bda++;
    *bda=(uint8_t)((terminal_row+3) & 0xFF);
 1000363:	0f b6 05 00 00 12 00 	movzx  eax,BYTE PTR ds:0x120000
 100036a:	83 c0 03             	add    eax,0x3
 100036d:	a2 51 04 00 00       	mov    ds:0x451,al
 1000372:	c3                   	ret    

01000373 <cursorMoveTo>:
cursorMoveTo():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:172
}

void cursorMoveTo(uint8_t x, uint8_t y)
{
    terminal_row = y;
 1000373:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 1000378:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:173
    terminal_column = x;
 100037d:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 1000382:	a3 04 00 12 00       	mov    ds:0x120004,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:174
    update_cursor();
 1000387:	e8 c8 fc ff ff       	call   1000054 <update_cursor>
 100038c:	f3 c3                	repz ret 

0100038e <cursorMoveToX>:
cursorMoveToX():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:179
}

void cursorMoveToX(uint8_t x)
{
    terminal_column = x;
 100038e:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 1000393:	a3 04 00 12 00       	mov    ds:0x120004,eax
 1000398:	c3                   	ret    

01000399 <cursorMoveToY>:
cursorMoveToY():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:184
}

void cursorMoveToY(uint8_t y)
{
    terminal_row = y;
 1000399:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 100039e:	a3 00 00 12 00       	mov    ds:0x120000,eax
 10003a3:	c3                   	ret    

010003a4 <cursorGetPosX>:
cursorGetPosX():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:190
}

uint8_t cursorGetPosX()
{
    return terminal_column;
}
 10003a4:	0f b6 05 04 00 12 00 	movzx  eax,BYTE PTR ds:0x120004
 10003ab:	c3                   	ret    

010003ac <cursorGetMaxX>:
cursorGetMaxX():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:194
int cursorGetMaxX()
{
    return VGA_WIDTH;
}
 10003ac:	b8 50 00 00 00       	mov    eax,0x50
 10003b1:	c3                   	ret    

010003b2 <cursorGetMaxY>:
cursorGetMaxY():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:198

int cursorGetMaxY()
{
    return kTerminalHeight;
 10003b2:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:199
}
 10003b9:	c3                   	ret    

010003ba <displayGetMaxXY>:
displayGetMaxXY():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:203

void displayGetMaxXY(int* maxX, int* maxY)
{
    *maxX=VGA_WIDTH;
 10003ba:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 10003be:	c7 00 50 00 00 00    	mov    DWORD PTR [eax],0x50
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:204
    *maxY=kTerminalHeight;
 10003c4:	0f b6 15 27 00 12 00 	movzx  edx,BYTE PTR ds:0x120027
 10003cb:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10003cf:	89 10                	mov    DWORD PTR [eax],edx
 10003d1:	c3                   	ret    

010003d2 <cursorGetPosY>:
cursorGetPosY():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:211
}

uint8_t cursorGetPosY()
{
    return terminal_row;
}
 10003d2:	0f b6 05 00 00 12 00 	movzx  eax,BYTE PTR ds:0x120000
 10003d9:	c3                   	ret    

010003da <kTermPrint>:
kTermPrint():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:213

void kTermPrint(const char* data) {
 10003da:	56                   	push   esi
 10003db:	53                   	push   ebx
 10003dc:	83 ec 10             	sub    esp,0x10
 10003df:	8b 74 24 1c          	mov    esi,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:214
        size_t datalen = strlen(data);
 10003e3:	56                   	push   esi
 10003e4:	e8 43 22 00 00       	call   100262c <strlen>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:215
        for (size_t i = 0; i < datalen; i++)
 10003e9:	83 c4 10             	add    esp,0x10
 10003ec:	85 c0                	test   eax,eax
 10003ee:	74 1a                	je     100040a <kTermPrint+0x30>
 10003f0:	89 f3                	mov    ebx,esi
 10003f2:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:216 (discriminator 3)
                terminal_putchar(data[i]);
 10003f4:	83 ec 0c             	sub    esp,0xc
 10003f7:	0f be 13             	movsx  edx,BYTE PTR [ebx]
 10003fa:	52                   	push   edx
 10003fb:	e8 19 fe ff ff       	call   1000219 <terminal_putchar>
 1000400:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:215 (discriminator 3)
    return terminal_row;
}

void kTermPrint(const char* data) {
        size_t datalen = strlen(data);
        for (size_t i = 0; i < datalen; i++)
 1000403:	83 c4 10             	add    esp,0x10
 1000406:	39 f3                	cmp    ebx,esi
 1000408:	75 ea                	jne    10003f4 <kTermPrint+0x1a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:217
                terminal_putchar(data[i]);
}
 100040a:	83 c4 04             	add    esp,0x4
 100040d:	5b                   	pop    ebx
 100040e:	5e                   	pop    esi
 100040f:	c3                   	ret    

01000410 <kTermInit>:
kTermInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:221


void kTermInit() {
    kTerminalHeight=SYS_VGA_HEIGHT;
 1000410:	c6 05 27 00 12 00 32 	mov    BYTE PTR ds:0x120027,0x32
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:222
    terminal_row = 0;
 1000417:	c7 05 00 00 12 00 00 	mov    DWORD PTR ds:0x120000,0x0
 100041e:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:223
    terminal_column = 0;
 1000421:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
 1000428:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:224
    terminal_color = make_color(COLOR_LIGHT_BROWN, COLOR_BLACK);
 100042b:	c6 05 08 00 12 00 0e 	mov    BYTE PTR ds:0x120008,0xe
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:225
    terminal_buffer = (uint16_t*) TEXTMODE_MEMORY_START;
 1000432:	c7 05 0c 00 12 00 00 	mov    DWORD PTR ds:0x12000c,0xb8000
 1000439:	80 0b 00 
 100043c:	c3                   	ret    

0100043d <puts>:
puts():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:230
    //terminal_clear();
}

void puts(char* in)
{
 100043d:	53                   	push   ebx
 100043e:	83 ec 08             	sub    esp,0x8
 1000441:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:231
    while (*in>'\0')
 1000445:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1000448:	84 c0                	test   al,al
 100044a:	7e 19                	jle    1000465 <puts+0x28>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:233
    {
        terminal_putchar(*in++);
 100044c:	83 c3 01             	add    ebx,0x1
 100044f:	83 ec 0c             	sub    esp,0xc
 1000452:	0f be c0             	movsx  eax,al
 1000455:	50                   	push   eax
 1000456:	e8 be fd ff ff       	call   1000219 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:231
    //terminal_clear();
}

void puts(char* in)
{
    while (*in>'\0')
 100045b:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 100045e:	83 c4 10             	add    esp,0x10
 1000461:	84 c0                	test   al,al
 1000463:	7f e7                	jg     100044c <puts+0xf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:235
    {
        terminal_putchar(*in++);
    }
}
 1000465:	83 c4 08             	add    esp,0x8
 1000468:	5b                   	pop    ebx
 1000469:	c3                   	ret    

0100046a <putc>:
putc():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:238

void putc(char c)
{
 100046a:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:239
    terminal_putchar(c);
 100046d:	0f be 44 24 1c       	movsx  eax,BYTE PTR [esp+0x1c]
 1000472:	50                   	push   eax
 1000473:	e8 a1 fd ff ff       	call   1000219 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:240
 1000478:	83 c4 1c             	add    esp,0x1c
 100047b:	c3                   	ret    

0100047c <keyboardGetKeyFromBuffer>:
keyboardGetKeyFromBuffer():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:20
//Base moves when a key is taken from the buffer
uint8_t keyboardGetKeyFromBuffer()
{
    char lTemp=0;
    //printd(DEBUG_KEYBOARD,"\nkKeyboardBuffer=0x%08X, kKeyboardBufferBase=0x%08X, &kKeyboardBufferBase=0x%08X\n",kKeyboardBuffer, kKeyboardBufferBase,&kKeyboardBufferBase);
    if (kKeyboardBufferBase<=kKeyboardBuffer)
 100047c:	a1 24 04 12 00       	mov    eax,ds:0x120424
 1000481:	8b 15 e0 03 12 00    	mov    edx,DWORD PTR ds:0x1203e0
 1000487:	39 d0                	cmp    eax,edx
 1000489:	77 14                	ja     100049f <keyboardGetKeyFromBuffer+0x23>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:22
    {
        __asm__("cli\n");
 100048b:	fa                   	cli    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:23
        lTemp=*kKeyboardBufferBase++;
 100048c:	8d 48 01             	lea    ecx,[eax+0x1]
 100048f:	89 0d 24 04 12 00    	mov    DWORD PTR ds:0x120424,ecx
 1000495:	0f b6 00             	movzx  eax,BYTE PTR [eax]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:24
        __asm__("sti\n");
 1000498:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:26
    }
    if (kKeyboardBufferBase>kKeyboardBuffer)
 1000499:	39 ca                	cmp    edx,ecx
 100049b:	73 1d                	jae    10004ba <keyboardGetKeyFromBuffer+0x3e>
 100049d:	eb 05                	jmp    10004a4 <keyboardGetKeyFromBuffer+0x28>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:18
//Get a key from the keyboard buffer
//Curr moves when a key is put into the buffer
//Base moves when a key is taken from the buffer
uint8_t keyboardGetKeyFromBuffer()
{
    char lTemp=0;
 100049f:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:28
        lTemp=*kKeyboardBufferBase++;
        __asm__("sti\n");
    }
    if (kKeyboardBufferBase>kKeyboardBuffer)
    {
        __asm__("cli\n");
 10004a4:	fa                   	cli    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:29
        kKeyboardBufferBase=(char*)KEYBOARD_BUFFER_ADDRESS;
 10004a5:	c7 05 24 04 12 00 b0 	mov    DWORD PTR ds:0x120424,0x1524b0
 10004ac:	24 15 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:30
        kKeyboardBuffer=(char*)KEYBOARD_BUFFER_ADDRESS-1;
 10004af:	c7 05 e0 03 12 00 af 	mov    DWORD PTR ds:0x1203e0,0x1524af
 10004b6:	24 15 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:31
        __asm__("sti\n");
 10004b9:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:34
    }
    return lTemp;
}
 10004ba:	f3 c3                	repz ret 

010004bc <waitForKeyboardKey>:
waitForKeyboardKey():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:37

char waitForKeyboardKey()
{
 10004bc:	53                   	push   ebx
 10004bd:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:38
    printd(DEBUG_KEYBOARD,"gKbd-W, %04X\t", kKeyboardBuffer);
 10004c0:	ff 35 e0 03 12 00    	push   DWORD PTR ds:0x1203e0
 10004c6:	68 f4 75 00 01       	push   0x10075f4
 10004cb:	6a 10                	push   0x10
 10004cd:	e8 c5 20 00 00       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:40
    char lTemp=0;
    printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
 10004d2:	83 c4 0c             	add    esp,0xc
 10004d5:	ff 35 e0 03 12 00    	push   DWORD PTR ds:0x1203e0
 10004db:	68 02 76 00 01       	push   0x1007602
 10004e0:	6a 10                	push   0x10
 10004e2:	e8 b0 20 00 00       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:42

    while (kKeyboardBuffer==(char*)KEYBOARD_BUFFER_ADDRESS)
 10004e7:	83 c4 10             	add    esp,0x10
 10004ea:	81 3d e0 03 12 00 b0 	cmp    DWORD PTR ds:0x1203e0,0x1524b0
 10004f1:	24 15 00 
 10004f4:	75 30                	jne    1000526 <waitForKeyboardKey+0x6a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:44
    {
        printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
 10004f6:	83 ec 04             	sub    esp,0x4
 10004f9:	68 b0 24 15 00       	push   0x1524b0
 10004fe:	68 02 76 00 01       	push   0x1007602
 1000503:	6a 10                	push   0x10
 1000505:	e8 8d 20 00 00       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:45
        __asm__("sti\n");
 100050a:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:46
        waitTicks(1);
 100050b:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 1000512:	e8 fe 29 00 00       	call   1002f15 <waitTicks>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:42
{
    printd(DEBUG_KEYBOARD,"gKbd-W, %04X\t", kKeyboardBuffer);
    char lTemp=0;
    printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);

    while (kKeyboardBuffer==(char*)KEYBOARD_BUFFER_ADDRESS)
 1000517:	83 c4 10             	add    esp,0x10
 100051a:	81 3d e0 03 12 00 b0 	cmp    DWORD PTR ds:0x1203e0,0x1524b0
 1000521:	24 15 00 
 1000524:	74 d0                	je     10004f6 <waitForKeyboardKey+0x3a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:48
    {
        printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
        __asm__("sti\n");
        waitTicks(1);
    }
    lTemp=keyboardGetKeyFromBuffer();
 1000526:	e8 51 ff ff ff       	call   100047c <keyboardGetKeyFromBuffer>
 100052b:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:49
    printd(DEBUG_KEYBOARD,"got a key %u!\n", lTemp);
 100052d:	83 ec 04             	sub    esp,0x4
 1000530:	0f be c0             	movsx  eax,al
 1000533:	50                   	push   eax
 1000534:	68 18 76 00 01       	push   0x1007618
 1000539:	6a 10                	push   0x10
 100053b:	e8 57 20 00 00       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:51
    return lTemp;
}
 1000540:	89 d8                	mov    eax,ebx
 1000542:	83 c4 18             	add    esp,0x18
 1000545:	5b                   	pop    ebx
 1000546:	c3                   	ret    

01000547 <getKeyboardKey>:
getKeyboardKey():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:55

char getKeyboardKey()
{
        return keyboardGetKeyFromBuffer();
 1000547:	e8 30 ff ff ff       	call   100047c <keyboardGetKeyFromBuffer>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:56
}
 100054c:	f3 c3                	repz ret 

0100054e <gets>:
gets():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:58
void gets(char* buffer, int len)
{
 100054e:	57                   	push   edi
 100054f:	56                   	push   esi
 1000550:	53                   	push   ebx
 1000551:	83 ec 14             	sub    esp,0x14
 1000554:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
 1000558:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:59
    volatile char inchar=0;
 100055c:	c6 44 24 13 00       	mov    BYTE PTR [esp+0x13],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:61
    int cnt=0;
    memset(buffer,0,len);
 1000561:	56                   	push   esi
 1000562:	6a 00                	push   0x0
 1000564:	57                   	push   edi
 1000565:	e8 81 13 00 00       	call   10018eb <memset>
 100056a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:60
        return keyboardGetKeyFromBuffer();
}
void gets(char* buffer, int len)
{
    volatile char inchar=0;
    int cnt=0;
 100056d:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:78
            if (inchar==0x0a)
            {
                printk("%c",inchar);
                return;
            }
            if (cnt<len-2)
 1000572:	83 ee 02             	sub    esi,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:64
    volatile char inchar=0;
    int cnt=0;
    memset(buffer,0,len);
    while (1==1)
    {
        inchar=getKeyboardKey();
 1000575:	e8 cd ff ff ff       	call   1000547 <getKeyboardKey>
 100057a:	88 44 24 0f          	mov    BYTE PTR [esp+0xf],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:65
        if (inchar=='\b' && cnt>0)
 100057e:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 1000583:	85 db                	test   ebx,ebx
 1000585:	7e 1d                	jle    10005a4 <gets+0x56>
 1000587:	3c 08                	cmp    al,0x8
 1000589:	75 19                	jne    10005a4 <gets+0x56>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:67
        {
            buffer[cnt]=0;
 100058b:	c6 04 1f 00          	mov    BYTE PTR [edi+ebx*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:68
            cnt--;
 100058f:	83 eb 01             	sub    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:69
            puts("\b");
 1000592:	83 ec 0c             	sub    esp,0xc
 1000595:	68 27 76 00 01       	push   0x1007627
 100059a:	e8 9e fe ff ff       	call   100043d <puts>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:66
    memset(buffer,0,len);
    while (1==1)
    {
        inchar=getKeyboardKey();
        if (inchar=='\b' && cnt>0)
        {
 100059f:	83 c4 10             	add    esp,0x10
 10005a2:	eb d1                	jmp    1000575 <gets+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:71
            buffer[cnt]=0;
            cnt--;
            puts("\b");
        }
        else if (inchar>0)
 10005a4:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 10005a9:	84 c0                	test   al,al
 10005ab:	7e c8                	jle    1000575 <gets+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:73
        {
            if (inchar==0x0a)
 10005ad:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 10005b2:	3c 0a                	cmp    al,0xa
 10005b4:	75 1b                	jne    10005d1 <gets+0x83>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:75
            {
                printk("%c",inchar);
 10005b6:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 10005bb:	83 ec 08             	sub    esp,0x8
 10005be:	0f be c0             	movsx  eax,al
 10005c1:	50                   	push   eax
 10005c2:	68 29 76 00 01       	push   0x1007629
 10005c7:	e8 b3 1f 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:76
                return;
 10005cc:	83 c4 10             	add    esp,0x10
 10005cf:	eb 2d                	jmp    10005fe <gets+0xb0>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:78
            }
            if (cnt<len-2)
 10005d1:	39 f3                	cmp    ebx,esi
 10005d3:	7d a0                	jge    1000575 <gets+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:80
            {
                printk("%c",inchar);
 10005d5:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 10005da:	83 ec 08             	sub    esp,0x8
 10005dd:	0f be c0             	movsx  eax,al
 10005e0:	50                   	push   eax
 10005e1:	68 29 76 00 01       	push   0x1007629
 10005e6:	e8 94 1f 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:81
                buffer[cnt++]=inchar;
 10005eb:	0f b6 44 24 1f       	movzx  eax,BYTE PTR [esp+0x1f]
 10005f0:	88 04 1f             	mov    BYTE PTR [edi+ebx*1],al
 10005f3:	83 c4 10             	add    esp,0x10
 10005f6:	8d 5b 01             	lea    ebx,[ebx+0x1]
 10005f9:	e9 77 ff ff ff       	jmp    1000575 <gets+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:85
            }
        }
    }
}
 10005fe:	83 c4 10             	add    esp,0x10
 1000601:	5b                   	pop    ebx
 1000602:	5e                   	pop    esi
 1000603:	5f                   	pop    edi
 1000604:	c3                   	ret    

01000605 <getc>:
getc():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:89

char getc()
{
   int inchar=getKeyboardKey();
 1000605:	e8 3d ff ff ff       	call   1000547 <getKeyboardKey>
 100060a:	0f be c0             	movsx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:91
   
   while (inchar==0)
 100060d:	85 c0                	test   eax,eax
 100060f:	75 11                	jne    1000622 <getc+0x1d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:93
   {
       inchar=getKeyboardKey();
 1000611:	e8 31 ff ff ff       	call   1000547 <getKeyboardKey>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:94
        inchar=getKeyboardKey();
 1000616:	e8 2c ff ff ff       	call   1000547 <getKeyboardKey>
 100061b:	0f be c0             	movsx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:91

char getc()
{
   int inchar=getKeyboardKey();
   
   while (inchar==0)
 100061e:	85 c0                	test   eax,eax
 1000620:	74 ef                	je     1000611 <getc+0xc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:97
   {
       inchar=getKeyboardKey();
        inchar=getKeyboardKey();
   }
   return inchar;
}
 1000622:	f3 c3                	repz ret 

01000624 <bitsSet>:
bitsSet():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:5
#include <stdint.h>
#include <stdbool.h>

bool bitsSet(volatile uint32_t* array, uint32_t bit)
{
 1000624:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:7
    int lRetVal=0;
    __asm__ volatile ("bts [%[array]],%[bit]\nmov eax,0\nsetc al\n" : [array] "+m" (*array), "=a" (lRetVal) : [bit] "r" (bit));
 1000628:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100062c:	0f ab 02             	bts    DWORD PTR [edx],eax
 100062f:	b8 00 00 00 00       	mov    eax,0x0
 1000634:	0f 92 c0             	setb   al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:8
    return lRetVal;
 1000637:	85 c0                	test   eax,eax
 1000639:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:9
}
 100063c:	c3                   	ret    

0100063d <bitsReset>:
bitsReset():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:11
bool bitsReset(volatile uint32_t* array, uint32_t bit)
{
 100063d:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:13
    int lRetVal=0;
    __asm__ volatile ("btr [%[array]],%[bit]\nmov eax,0\nsetc al\n" : [array] "+m" (*array), "=a" (lRetVal) : [bit] "r" (bit));
 1000641:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1000645:	0f b3 02             	btr    DWORD PTR [edx],eax
 1000648:	b8 00 00 00 00       	mov    eax,0x0
 100064d:	0f 92 c0             	setb   al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:14
    return lRetVal;
 1000650:	85 c0                	test   eax,eax
 1000652:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:15
}
 1000655:	c3                   	ret    

01000656 <bitsTest>:
bitsTest():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:17
bool bitsTest(volatile uint32_t* array, uint32_t bit)
{
 1000656:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:19
    int lRetVal=0;
    __asm__ volatile ("bt [%[array]],%[bit]\nmov eax,0\nsetc al\n" :[array] "+m" (*array), "=a" (lRetVal) : [bit] "r" (bit));
 100065a:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100065e:	0f a3 02             	bt     DWORD PTR [edx],eax
 1000661:	b8 00 00 00 00       	mov    eax,0x0
 1000666:	0f 92 c0             	setb   al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:20
    return lRetVal;
 1000669:	85 c0                	test   eax,eax
 100066b:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:21
}
 100066e:	c3                   	ret    

0100066f <bitsScanF>:
bitsScanF():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:24

int bitsScanF(volatile uint32_t* array)
{
 100066f:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:27
    int lRetVal=0;
    bool lErr=false;
    __asm__ volatile ("bsf %[ret],[%[array]]\nsetz cl\n" : [ret] "=b" (lRetVal), [lErr] "=c" (lErr) : [array] "m" (*array));
 1000670:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1000674:	0f bc 18             	bsf    ebx,DWORD PTR [eax]
 1000677:	0f 94 c1             	sete   cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:28
    if (lErr==false)
 100067a:	84 c9                	test   cl,cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:29
        return lRetVal;
 100067c:	b8 ff ff ff ff       	mov    eax,0xffffffff
 1000681:	0f 44 c3             	cmove  eax,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:32
    else
        return -1;
 1000684:	5b                   	pop    ebx
 1000685:	c3                   	ret    
 1000686:	66 90                	xchg   ax,ax

01000688 <ataWaitForDRQ>:
ataWaitForDRQ():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:22
float ticks=0;
struct ataDeviceInfo_t* atablockingReadDev;

//Returns non-zero value IF TIMEOUT
uint8_t __attribute__((noinline)) ataWaitForDRQ(struct ataDeviceInfo_t* devInfo, bool toBeSet, int forHowManyMS)
{
 1000688:	57                   	push   edi
 1000689:	56                   	push   esi
 100068a:	53                   	push   ebx
 100068b:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
 100068f:	0f b6 5c 24 14       	movzx  ebx,BYTE PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:23
    int ticks = forHowManyMS*kTicksPerMS;
 1000694:	8b 4c 24 18          	mov    ecx,DWORD PTR [esp+0x18]
 1000698:	0f af 0d 84 02 12 00 	imul   ecx,DWORD PTR ds:0x120284
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:25
    uint8_t inValue=0;
    while (ticks > 0)
 100069f:	85 c9                	test   ecx,ecx
 10006a1:	7e 26                	jle    10006c9 <ataWaitForDRQ+0x41>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:30
    {
        STI
        //waitTicks(1);
        __asm__("sti\nhlt\n");
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
 10006a3:	0f b7 87 69 02 00 00 	movzx  eax,WORD PTR [edi+0x269]
 10006aa:	8d 50 07             	lea    edx,[eax+0x7]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:27
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
    while (ticks > 0)
    {
        STI
 10006ad:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:29
        //waitTicks(1);
        __asm__("sti\nhlt\n");
 10006ae:	fb                   	sti    
 10006af:	f4                   	hlt    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10006b0:	ec                   	in     al,dx
 10006b1:	89 c6                	mov    esi,eax
ataWaitForDRQ():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:31
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (toBeSet && (inValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ)
 10006b3:	84 db                	test   bl,bl
 10006b5:	74 06                	je     10006bd <ataWaitForDRQ+0x35>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:31 (discriminator 1)
 10006b7:	a8 08                	test   al,0x8
 10006b9:	74 07                	je     10006c2 <ataWaitForDRQ+0x3a>
 10006bb:	eb 31                	jmp    10006ee <ataWaitForDRQ+0x66>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:33 (discriminator 1)
                return 0;
        else if ((!toBeSet && (inValue & ATA_STATUS_DRQ) != ATA_STATUS_DRQ))
 10006bd:	83 e0 08             	and    eax,0x8
 10006c0:	74 31                	je     10006f3 <ataWaitForDRQ+0x6b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:25
//Returns non-zero value IF TIMEOUT
uint8_t __attribute__((noinline)) ataWaitForDRQ(struct ataDeviceInfo_t* devInfo, bool toBeSet, int forHowManyMS)
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
    while (ticks > 0)
 10006c2:	83 e9 01             	sub    ecx,0x1
 10006c5:	75 e6                	jne    10006ad <ataWaitForDRQ+0x25>
 10006c7:	eb 05                	jmp    10006ce <ataWaitForDRQ+0x46>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:24

//Returns non-zero value IF TIMEOUT
uint8_t __attribute__((noinline)) ataWaitForDRQ(struct ataDeviceInfo_t* devInfo, bool toBeSet, int forHowManyMS)
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
 10006c9:	be 00 00 00 00       	mov    esi,0x0
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10006ce:	8b 87 69 02 00 00    	mov    eax,DWORD PTR [edi+0x269]
 10006d4:	8d 50 01             	lea    edx,[eax+0x1]
 10006d7:	ec                   	in     al,dx
ataWaitForDRQ():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:37
                return 0;
        else if ((!toBeSet && (inValue & ATA_STATUS_DRQ) != ATA_STATUS_DRQ))
                return 0;
        ticks--;
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
 10006d8:	0f b6 d0             	movzx  edx,al
 10006db:	89 15 74 4a 01 01    	mov    DWORD PTR ds:0x1014a74,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:38
    if ((hdError & 0x4)==0x4)
 10006e1:	83 e0 04             	and    eax,0x4
 10006e4:	b8 00 00 00 00       	mov    eax,0x0
 10006e9:	0f 44 c6             	cmove  eax,esi
 10006ec:	eb 05                	jmp    10006f3 <ataWaitForDRQ+0x6b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:32
        STI
        //waitTicks(1);
        __asm__("sti\nhlt\n");
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (toBeSet && (inValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ)
                return 0;
 10006ee:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:41
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
    if ((hdError & 0x4)==0x4)
        return 0;
    return inValue;
}
 10006f3:	5b                   	pop    ebx
 10006f4:	5e                   	pop    esi
 10006f5:	5f                   	pop    edi
 10006f6:	c3                   	ret    

010006f7 <ataWaitForIdle>:
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:44

uint8_t ataWaitForIdle(struct ataDeviceInfo_t* devInfo)
{
 10006f7:	53                   	push   ebx
 10006f8:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:48
    ticks = 0;
    uint8_t lValue=0;
    //printk("aaWaitForIdle: ticks(%u@0x%08X)=ATA_STANDARD_WAIT_MS(%d)*kTicksPerMS((%d@0x%08X))\n", ticks, &ticks, (ATA_STANDARD_WAIT_MS), kTicksPerMS, &kTicksPerMS);
    lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
 10006fb:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 10006ff:	8b 98 69 02 00 00    	mov    ebx,DWORD PTR [eax+0x269]
 1000705:	8d 53 07             	lea    edx,[ebx+0x7]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000708:	ec                   	in     al,dx
 1000709:	89 c1                	mov    ecx,eax
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:51
    if ((lValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ && ticks)
        inw(devInfo->ioPort+ATA_PORT_DATA);
    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 100070b:	c7 05 68 4a 01 01 00 	mov    DWORD PTR ds:0x1014a68,0x3f800000
 1000712:	00 80 3f 
 1000715:	a1 84 02 12 00       	mov    eax,ds:0x120284
 100071a:	8d 04 80             	lea    eax,[eax+eax*4]
 100071d:	01 c0                	add    eax,eax
 100071f:	89 04 24             	mov    DWORD PTR [esp],eax
 1000722:	db 04 24             	fild   DWORD PTR [esp]
 1000725:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
 1000729:	d9 44 24 04          	fld    DWORD PTR [esp+0x4]
 100072d:	d9 ee                	fldz   
 100072f:	d9 c9                	fxch   st(1)
 1000731:	db e9                	fucomi st,st(1)
 1000733:	dd d9                	fstp   st(1)
 1000735:	72 5a                	jb     1000791 <ataWaitForIdle+0x9a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:53
    {
        __asm__("sti\nhlt\n");
 1000737:	fb                   	sti    
 1000738:	f4                   	hlt    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000739:	ec                   	in     al,dx
 100073a:	89 c1                	mov    ecx,eax
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:56
        lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
 100073c:	25 88 00 00 00       	and    eax,0x88
 1000741:	74 60                	je     10007a3 <ataWaitForIdle+0xac>
 1000743:	d9 e8                	fld1   
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:58
                    return 0;
        ticks++;
 1000745:	d9 e8                	fld1   
 1000747:	eb 1c                	jmp    1000765 <ataWaitForIdle+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:53
    lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
    if ((lValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ && ticks)
        inw(devInfo->ioPort+ATA_PORT_DATA);
    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
    {
        __asm__("sti\nhlt\n");
 1000749:	fb                   	sti    
 100074a:	f4                   	hlt    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 100074b:	ec                   	in     al,dx
 100074c:	89 c1                	mov    ecx,eax
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:56
        lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
 100074e:	25 88 00 00 00       	and    eax,0x88
 1000753:	75 0c                	jne    1000761 <ataWaitForIdle+0x6a>
 1000755:	dd d8                	fstp   st(0)
 1000757:	dd d8                	fstp   st(0)
 1000759:	d9 1d 68 4a 01 01    	fstp   DWORD PTR ds:0x1014a68
 100075f:	eb 44                	jmp    10007a5 <ataWaitForIdle+0xae>
 1000761:	d9 ca                	fxch   st(2)
 1000763:	d9 c9                	fxch   st(1)
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:58
                    return 0;
        ticks++;
 1000765:	dc c1                	fadd   st(1),st
 1000767:	d9 c9                	fxch   st(1)
 1000769:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
 100076d:	d9 44 24 04          	fld    DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:51
    uint8_t lValue=0;
    //printk("aaWaitForIdle: ticks(%u@0x%08X)=ATA_STANDARD_WAIT_MS(%d)*kTicksPerMS((%d@0x%08X))\n", ticks, &ticks, (ATA_STANDARD_WAIT_MS), kTicksPerMS, &kTicksPerMS);
    lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
    if ((lValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ && ticks)
        inw(devInfo->ioPort+ATA_PORT_DATA);
    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 1000771:	d9 c1                	fld    st(1)
 1000773:	d8 c1                	fadd   st,st(1)
 1000775:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
 1000779:	d9 44 24 04          	fld    DWORD PTR [esp+0x4]
 100077d:	d9 cb                	fxch   st(3)
 100077f:	db e9                	fucomi st,st(1)
 1000781:	dd d9                	fstp   st(1)
 1000783:	73 c4                	jae    1000749 <ataWaitForIdle+0x52>
 1000785:	dd d8                	fstp   st(0)
 1000787:	dd d8                	fstp   st(0)
 1000789:	d9 1d 68 4a 01 01    	fstp   DWORD PTR ds:0x1014a68
 100078f:	eb 02                	jmp    1000793 <ataWaitForIdle+0x9c>
 1000791:	dd d8                	fstp   st(0)
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000793:	8d 53 01             	lea    edx,[ebx+0x1]
 1000796:	ec                   	in     al,dx
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:60
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
                    return 0;
        ticks++;
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
 1000797:	0f b6 c0             	movzx  eax,al
 100079a:	a3 74 4a 01 01       	mov    ds:0x1014a74,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:61
    return lValue;
 100079f:	89 c8                	mov    eax,ecx
 10007a1:	eb 02                	jmp    10007a5 <ataWaitForIdle+0xae>
 10007a3:	dd d8                	fstp   st(0)
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:62
}
 10007a5:	83 c4 08             	add    esp,0x8
 10007a8:	5b                   	pop    ebx
 10007a9:	c3                   	ret    

010007aa <ataControllerIsReady>:
ataControllerIsReady():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:66


uint8_t ataControllerIsReady(struct ataDeviceInfo_t* devInfo)
{
 10007aa:	55                   	push   ebp
 10007ab:	57                   	push   edi
 10007ac:	56                   	push   esi
 10007ad:	53                   	push   ebx
 10007ae:	83 ec 0c             	sub    esp,0xc
 10007b1:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:69
    int ticks = 0;
    
    int lStatus=0;
 10007b5:	bd 00 00 00 00       	mov    ebp,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:67
}


uint8_t ataControllerIsReady(struct ataDeviceInfo_t* devInfo)
{
    int ticks = 0;
 10007ba:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:72
    
    int lStatus=0;
    uint8_t err=0;

    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 10007bf:	eb 2a                	jmp    10007eb <ataControllerIsReady+0x41>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10007c1:	0f b7 87 69 02 00 00 	movzx  eax,WORD PTR [edi+0x269]
 10007c8:	8d 50 07             	lea    edx,[eax+0x7]
 10007cb:	ec                   	in     al,dx
 10007cc:	89 c3                	mov    ebx,eax
ataControllerIsReady():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:75
    {
        lStatus=inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
 10007ce:	83 ec 0c             	sub    esp,0xc
 10007d1:	6a 01                	push   0x1
 10007d3:	e8 50 27 00 00       	call   1002f28 <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:76
        ticks++;
 10007d8:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:77
	lStatus &= (ATA_STATUS_BUSY | ATA_STATUS_READY| ATA_STATUS_SEEK);
 10007db:	89 dd                	mov    ebp,ebx
 10007dd:	81 e5 d0 00 00 00    	and    ebp,0xd0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:78
        if (lStatus & ATA_STATUS_READY )
 10007e3:	83 c4 10             	add    esp,0x10
 10007e6:	f6 c3 40             	test   bl,0x40
 10007e9:	75 71                	jne    100085c <ataControllerIsReady+0xb2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:72
    int ticks = 0;
    
    int lStatus=0;
    uint8_t err=0;

    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 10007eb:	a1 84 02 12 00       	mov    eax,ds:0x120284
 10007f0:	8d 04 80             	lea    eax,[eax+eax*4]
 10007f3:	01 c0                	add    eax,eax
 10007f5:	39 c6                	cmp    esi,eax
 10007f7:	7e c8                	jle    10007c1 <ataControllerIsReady+0x17>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:82
	lStatus &= (ATA_STATUS_BUSY | ATA_STATUS_READY| ATA_STATUS_SEEK);
        if (lStatus & ATA_STATUS_READY )
                return true;
    }

    if (lStatus==ATA_STATUS_ERROR || lStatus==ATA_STATUS_BUSY)
 10007f9:	81 fd 80 00 00 00    	cmp    ebp,0x80
 10007ff:	75 41                	jne    1000842 <ataControllerIsReady+0x98>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000801:	ba f1 01 00 00       	mov    edx,0x1f1
 1000806:	ec                   	in     al,dx
 1000807:	89 c3                	mov    ebx,eax
ataControllerIsReady():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:86
    {
         err=inb(0x1f1);
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000809:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000810:	74 4a                	je     100085c <ataControllerIsReady+0xb2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:87
            printd(DEBUG_HARDDRIVE,"ataControllerIsReady: DRQ wait failed, lStatus=%02X, err=%02X\n",lStatus,err);
 1000812:	0f b6 c0             	movzx  eax,al
 1000815:	50                   	push   eax
 1000816:	68 80 00 00 00       	push   0x80
 100081b:	68 d4 7a 00 01       	push   0x1007ad4
 1000820:	6a 08                	push   0x8
 1000822:	e8 70 1d 00 00       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:90
#endif
    }
    if ( (lStatus & ATA_STATUS_READY)==0 && err==4)
 1000827:	83 c4 10             	add    esp,0x10
 100082a:	f7 c5 40 00 00 00    	test   ebp,0x40
 1000830:	75 10                	jne    1000842 <ataControllerIsReady+0x98>
 1000832:	80 fb 04             	cmp    bl,0x4
 1000835:	0f 94 c0             	sete   al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:91
        lStatus=ATA_STATUS_READY;
 1000838:	84 c0                	test   al,al
 100083a:	b8 40 00 00 00       	mov    eax,0x40
 100083f:	0f 45 e8             	cmovne ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:93
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000842:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000849:	74 11                	je     100085c <ataControllerIsReady+0xb2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:94
            printk("ataControllerIsReady: returning %02X\n",lStatus);
 100084b:	83 ec 08             	sub    esp,0x8
 100084e:	55                   	push   ebp
 100084f:	68 14 7b 00 01       	push   0x1007b14
 1000854:	e8 26 1d 00 00       	call   100257f <printk>
 1000859:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:97
#endif
    return true;
}
 100085c:	b8 01 00 00 00       	mov    eax,0x1
 1000861:	83 c4 0c             	add    esp,0xc
 1000864:	5b                   	pop    ebx
 1000865:	5e                   	pop    esi
 1000866:	5f                   	pop    edi
 1000867:	5d                   	pop    ebp
 1000868:	c3                   	ret    

01000869 <ataSelectDrive>:
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:115
		return true;
	return 1;
}

bool ataSelectDrive(struct ataDeviceInfo_t* devInfo, uint8_t head)
{
 1000869:	57                   	push   edi
 100086a:	56                   	push   esi
 100086b:	53                   	push   ebx
 100086c:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 1000870:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:116
    ataWaitForIdle(devInfo);
 1000874:	56                   	push   esi
 1000875:	e8 7d fe ff ff       	call   10006f7 <ataWaitForIdle>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:117
    outb(devInfo->ioPort+ATA_DRIVE_SELECT, devInfo->driveHeadPortDesignation | (head& 0xF) ); 
 100087a:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1000880:	89 d8                	mov    eax,ebx
 1000882:	83 e0 0f             	and    eax,0xf
 1000885:	0a 86 6e 02 00 00    	or     al,BYTE PTR [esi+0x26e]
 100088b:	8d 51 06             	lea    edx,[ecx+0x6]
 100088e:	ee                   	out    dx,al
ataStatusIsOk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:101
    return true;
}

static bool ataStatusIsOk(struct ataDeviceInfo_t* devInfo)
{
	unsigned char status = inb(devInfo->ioPort+ATA_PORT_STATUS);
 100088f:	8d 51 07             	lea    edx,[ecx+0x7]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1000892:	ec                   	in     al,dx
ataStatusIsOk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:103

	if (status & ATA_STATUS_BUSY)
 1000893:	83 c4 04             	add    esp,0x4
 1000896:	84 c0                	test   al,al
 1000898:	0f 88 92 00 00 00    	js     1000930 <ataSelectDrive+0xc7>
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:136
        unsigned lDrive=inb(devInfo->ioPort+ATA_DRIVE_SELECT);
            printk("ataSelectDrive: Drive selected: %s (%u, 0x%02X), err=0x%02X\n", (lDrive & (1<<4)) == 1<<4?"Slave":"Master", devInfo->driveNo, lDrive, inb(devInfo->ioPort+ATA_PORT_ERROR));
    }
#endif
        
    return 0;
 100089e:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:128
            printk("ataSelectDrive: Failed to select drive %u, bus %u, status=0x%02X is not ok\n", devInfo->driveNo, devInfo->bus, inb(devInfo->ioPort+ATA_PORT_STATUS));
#endif
            return inb(devInfo->ioPort+ATA_PORT_STATUS);
    }
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10008a3:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 10008aa:	0f 84 8e 00 00 00    	je     100093e <ataSelectDrive+0xd5>
 10008b0:	eb 2f                	jmp    10008e1 <ataSelectDrive+0x78>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10008b2:	ec                   	in     al,dx
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:123
    //printk("Sending 0x%02X", drive==master?ATA_DRIVE_MASTER:ATA_DRIVE_SLAVE | (head& 0xF));
    if (!ataStatusIsOk(devInfo))
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("ataSelectDrive: Failed to select drive %u, bus %u, status=0x%02X is not ok\n", devInfo->driveNo, devInfo->bus, inb(devInfo->ioPort+ATA_PORT_STATUS));
 10008b3:	0f b6 c0             	movzx  eax,al
 10008b6:	50                   	push   eax
 10008b7:	ff b6 61 02 00 00    	push   DWORD PTR [esi+0x261]
 10008bd:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 10008c3:	68 3c 7b 00 01       	push   0x1007b3c
 10008c8:	e8 b2 1c 00 00       	call   100257f <printk>
 10008cd:	83 c4 10             	add    esp,0x10
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10008d0:	8b 86 69 02 00 00    	mov    eax,DWORD PTR [esi+0x269]
 10008d6:	8d 50 07             	lea    edx,[eax+0x7]
 10008d9:	ec                   	in     al,dx
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:125
#endif
            return inb(devInfo->ioPort+ATA_PORT_STATUS);
 10008da:	84 c0                	test   al,al
 10008dc:	0f 95 c0             	setne  al
 10008df:	eb 5d                	jmp    100093e <ataSelectDrive+0xd5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:130
    }
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
    {
        wait(10);
 10008e1:	83 ec 0c             	sub    esp,0xc
 10008e4:	6a 0a                	push   0xa
 10008e6:	e8 3d 26 00 00       	call   1002f28 <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:131
        unsigned lDrive=inb(devInfo->ioPort+ATA_DRIVE_SELECT);
 10008eb:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10008f1:	8d 51 06             	lea    edx,[ecx+0x6]
 10008f4:	ec                   	in     al,dx
 10008f5:	89 c3                	mov    ebx,eax
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:131
 10008f7:	0f b6 f8             	movzx  edi,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10008fa:	8d 51 01             	lea    edx,[ecx+0x1]
 10008fd:	ec                   	in     al,dx
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:132
            printk("ataSelectDrive: Drive selected: %s (%u, 0x%02X), err=0x%02X\n", (lDrive & (1<<4)) == 1<<4?"Slave":"Master", devInfo->driveNo, lDrive, inb(devInfo->ioPort+ATA_PORT_ERROR));
 10008fe:	0f b6 c8             	movzx  ecx,al
 1000901:	83 e3 10             	and    ebx,0x10
 1000904:	ba 32 76 00 01       	mov    edx,0x1007632
 1000909:	b8 2c 76 00 01       	mov    eax,0x100762c
 100090e:	0f 44 c2             	cmove  eax,edx
 1000911:	89 0c 24             	mov    DWORD PTR [esp],ecx
 1000914:	57                   	push   edi
 1000915:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 100091b:	50                   	push   eax
 100091c:	68 88 7b 00 01       	push   0x1007b88
 1000921:	e8 59 1c 00 00       	call   100257f <printk>
 1000926:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:136
    }
#endif
        
    return 0;
 1000929:	b8 00 00 00 00       	mov    eax,0x0
 100092e:	eb 0e                	jmp    100093e <ataSelectDrive+0xd5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:122
    outb(devInfo->ioPort+ATA_DRIVE_SELECT, devInfo->driveHeadPortDesignation | (head& 0xF) ); 
    //printk("Sending 0x%02X", drive==master?ATA_DRIVE_MASTER:ATA_DRIVE_SLAVE | (head& 0xF));
    if (!ataStatusIsOk(devInfo))
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000930:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000937:	74 97                	je     10008d0 <ataSelectDrive+0x67>
 1000939:	e9 74 ff ff ff       	jmp    10008b2 <ataSelectDrive+0x49>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:137
            printk("ataSelectDrive: Drive selected: %s (%u, 0x%02X), err=0x%02X\n", (lDrive & (1<<4)) == 1<<4?"Slave":"Master", devInfo->driveNo, lDrive, inb(devInfo->ioPort+ATA_PORT_ERROR));
    }
#endif
        
    return 0;
}
 100093e:	5b                   	pop    ebx
 100093f:	5e                   	pop    esi
 1000940:	5f                   	pop    edi
 1000941:	c3                   	ret    

01000942 <ataInit>:
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:180
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("ataResetController: controller is ready\n");
#endif
}
int ataInit(struct ataDeviceInfo_t* devInfo)
{
 1000942:	57                   	push   edi
 1000943:	56                   	push   esi
 1000944:	53                   	push   ebx
 1000945:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1000949:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000950:	8d 50 07             	lea    edx,[eax+0x7]
 1000953:	b8 04 00 00 00       	mov    eax,0x4
 1000958:	ee                   	out    dx,al
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:163
}
*/
static void ataResetController(struct ataDeviceInfo_t* devInfo)
{
        outb(devInfo->ioPort+ATA_PORT_COMMAND, 4);
        waitTicks(kTicksPerSecond/10);
 1000959:	83 ec 0c             	sub    esp,0xc
 100095c:	8b 0d 80 02 12 00    	mov    ecx,DWORD PTR ds:0x120280
 1000962:	ba 67 66 66 66       	mov    edx,0x66666667
 1000967:	89 c8                	mov    eax,ecx
 1000969:	f7 ea                	imul   edx
 100096b:	c1 fa 02             	sar    edx,0x2
 100096e:	c1 f9 1f             	sar    ecx,0x1f
 1000971:	29 ca                	sub    edx,ecx
 1000973:	52                   	push   edx
 1000974:	e8 9c 25 00 00       	call   1002f15 <waitTicks>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
 1000979:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000980:	8d 90 f6 03 00 00    	lea    edx,[eax+0x3f6]
 1000986:	b8 04 00 00 00       	mov    eax,0x4
 100098b:	ee                   	out    dx,al
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:165
        outb(devInfo->ioPort+ATA_PORT_CONTROL, 1<<2);
        wait(10);
 100098c:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
 1000993:	e8 90 25 00 00       	call   1002f28 <wait>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
 1000998:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 100099f:	8d 90 f6 03 00 00    	lea    edx,[eax+0x3f6]
 10009a5:	b8 00 00 00 00       	mov    eax,0x0
 10009aa:	ee                   	out    dx,al
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:167
        outb(devInfo->ioPort+ATA_PORT_CONTROL, 0);
        if (!ataControllerIsReady(devInfo))
 10009ab:	89 34 24             	mov    DWORD PTR [esp],esi
 10009ae:	e8 f7 fd ff ff       	call   10007aa <ataControllerIsReady>
 10009b3:	83 c4 10             	add    esp,0x10
 10009b6:	84 c0                	test   al,al
 10009b8:	75 19                	jne    10009d3 <ataInit+0x91>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:169
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10009ba:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 10009c1:	74 10                	je     10009d3 <ataInit+0x91>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:170
            printk("HD-controller still busy\n");
 10009c3:	83 ec 0c             	sub    esp,0xc
 10009c6:	68 4b 76 00 01       	push   0x100764b
 10009cb:	e8 af 1b 00 00       	call   100257f <printk>
 10009d0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
#endif
        if ((hdError = inb(devInfo->ioPort+ATA_PORT_ERROR)) != 0 && (hdError = inb(devInfo->ioPort+ATA_PORT_ERROR)) != 4)
 10009d3:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 10009da:	8d 50 01             	lea    edx,[eax+0x1]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10009dd:	ec                   	in     al,dx
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
 10009de:	84 c0                	test   al,al
 10009e0:	75 0c                	jne    10009ee <ataInit+0xac>
 10009e2:	c7 05 74 4a 01 01 00 	mov    DWORD PTR ds:0x1014a74,0x0
 10009e9:	00 00 00 
 10009ec:	eb 34                	jmp    1000a22 <ataInit+0xe0>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10009ee:	ec                   	in     al,dx
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
 10009ef:	0f b6 c0             	movzx  eax,al
 10009f2:	a3 74 4a 01 01       	mov    ds:0x1014a74,eax
 10009f7:	83 f8 04             	cmp    eax,0x4
 10009fa:	74 26                	je     1000a22 <ataInit+0xe0>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:173
            printk("Controller reset failed on %s bus: %02x\n",devInfo->bus==0?"Primary":"Secondary", hdError);
 10009fc:	83 be 61 02 00 00 00 	cmp    DWORD PTR [esi+0x261],0x0
 1000a03:	b9 41 76 00 01       	mov    ecx,0x1007641
 1000a08:	ba 39 76 00 01       	mov    edx,0x1007639
 1000a0d:	0f 45 d1             	cmovne edx,ecx
 1000a10:	83 ec 04             	sub    esp,0x4
 1000a13:	50                   	push   eax
 1000a14:	52                   	push   edx
 1000a15:	68 c8 7b 00 01       	push   0x1007bc8
 1000a1a:	e8 60 1b 00 00       	call   100257f <printk>
 1000a1f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:175
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000a22:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000a29:	74 10                	je     1000a3b <ataInit+0xf9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:176
            printk("ataResetController: controller is ready\n");
 1000a2b:	83 ec 0c             	sub    esp,0xc
 1000a2e:	68 f4 7b 00 01       	push   0x1007bf4
 1000a33:	e8 47 1b 00 00       	call   100257f <printk>
 1000a38:	83 c4 10             	add    esp,0x10
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:183
}
int ataInit(struct ataDeviceInfo_t* devInfo)
{
    ataResetController(devInfo);
    int cStatus=0, ticks=0;
    ataSelectDrive(devInfo,0);
 1000a3b:	83 ec 08             	sub    esp,0x8
 1000a3e:	6a 00                	push   0x0
 1000a40:	56                   	push   esi
 1000a41:	e8 23 fe ff ff       	call   1000869 <ataSelectDrive>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:184
    outb(devInfo->ioPort+ATA_PORT_SECTORCOUNT, 0x55);
 1000a46:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1000a4c:	8d 51 02             	lea    edx,[ecx+0x2]
 1000a4f:	b8 55 00 00 00       	mov    eax,0x55
 1000a54:	ee                   	out    dx,al
 1000a55:	8d 51 03             	lea    edx,[ecx+0x3]
 1000a58:	b8 aa ff ff ff       	mov    eax,0xffffffaa
 1000a5d:	ee                   	out    dx,al
 1000a5e:	8d 51 04             	lea    edx,[ecx+0x4]
 1000a61:	b8 55 00 00 00       	mov    eax,0x55
 1000a66:	ee                   	out    dx,al
 1000a67:	8d 51 05             	lea    edx,[ecx+0x5]
 1000a6a:	b8 aa ff ff ff       	mov    eax,0xffffffaa
 1000a6f:	ee                   	out    dx,al
 1000a70:	8d 51 07             	lea    edx,[ecx+0x7]
 1000a73:	b8 ec ff ff ff       	mov    eax,0xffffffec
 1000a78:	ee                   	out    dx,al
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:189
    outb(devInfo->ioPort+ATA_PORT_SECTOR_NUMBER, 0xAA);
    outb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW,0x55);
    outb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH,0xAA);
    outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
    wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
 1000a79:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1000a7e:	8d 04 80             	lea    eax,[eax+eax*4]
 1000a81:	01 c0                	add    eax,eax
 1000a83:	89 04 24             	mov    DWORD PTR [esp],eax
 1000a86:	e8 9d 24 00 00       	call   1002f28 <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:190
    cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
 1000a8b:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1000a91:	8d 51 07             	lea    edx,[ecx+0x7]
 1000a94:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:190
 1000a95:	0f b6 d8             	movzx  ebx,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:191
    if (cStatus==0)
 1000a98:	83 c4 10             	add    esp,0x10
 1000a9b:	85 db                	test   ebx,ebx
 1000a9d:	75 34                	jne    1000ad3 <ataInit+0x191>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
        return false;
 1000a9f:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:194
    wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
    cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
    if (cStatus==0)
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000aa4:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000aab:	0f 84 4d 01 00 00    	je     1000bfe <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:195
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
 1000ab1:	83 ec 04             	sub    esp,0x4
 1000ab4:	6a 00                	push   0x0
 1000ab6:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000abc:	68 65 76 00 01       	push   0x1007665
 1000ac1:	e8 b9 1a 00 00       	call   100257f <printk>
 1000ac6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
#endif
        return false;
 1000ac9:	b8 00 00 00 00       	mov    eax,0x0
 1000ace:	e9 2b 01 00 00       	jmp    1000bfe <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:199
    }
    if ((cStatus & 1) == 1)
 1000ad3:	a8 01                	test   al,0x1
 1000ad5:	0f 84 80 00 00 00    	je     1000b5b <ataInit+0x219>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000adb:	8d 51 01             	lea    edx,[ecx+0x1]
 1000ade:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:201
    {
        int err = inb(devInfo->ioPort+ATA_PORT_ERROR);
 1000adf:	0f b6 f8             	movzx  edi,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:203
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000ae2:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000ae9:	74 15                	je     1000b00 <ataInit+0x1be>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:204
            printk("drive %02X, cStatus=%02X, errreg=%02X\n",devInfo->driveNo, cStatus,err);
 1000aeb:	57                   	push   edi
 1000aec:	53                   	push   ebx
 1000aed:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000af3:	68 20 7c 00 01       	push   0x1007c20
 1000af8:	e8 82 1a 00 00       	call   100257f <printk>
 1000afd:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:207
#endif
        if (err!=4)
            return false;
 1000b00:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:206
        int err = inb(devInfo->ioPort+ATA_PORT_ERROR);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("drive %02X, cStatus=%02X, errreg=%02X\n",devInfo->driveNo, cStatus,err);
#endif
        if (err!=4)
 1000b05:	83 ff 04             	cmp    edi,0x4
 1000b08:	0f 85 f0 00 00 00    	jne    1000bfe <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:208
            return false;
        useCDROMIdentify = true;
 1000b0e:	c6 05 78 4a 01 01 01 	mov    BYTE PTR ds:0x1014a78,0x1
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000b15:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000b1c:	8d 50 07             	lea    edx,[eax+0x7]
 1000b1f:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:209
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
 1000b20:	0f b6 d8             	movzx  ebx,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:210
        if (cStatus==0)
 1000b23:	85 db                	test   ebx,ebx
 1000b25:	75 34                	jne    1000b5b <ataInit+0x219>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:216
        {
#ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
                printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
            return false;
 1000b27:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:213
        useCDROMIdentify = true;
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (cStatus==0)
        {
#ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000b2c:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000b33:	0f 84 c5 00 00 00    	je     1000bfe <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:214
                printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
 1000b39:	83 ec 04             	sub    esp,0x4
 1000b3c:	6a 00                	push   0x0
 1000b3e:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000b44:	68 65 76 00 01       	push   0x1007665
 1000b49:	e8 31 1a 00 00       	call   100257f <printk>
 1000b4e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:216
#endif
            return false;
 1000b51:	b8 00 00 00 00       	mov    eax,0x0
 1000b56:	e9 a3 00 00 00       	jmp    1000bfe <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:219
        }
    }
    ticks=ATA_STANDARD_WAIT_MS*kTicksPerMS;
 1000b5b:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1000b60:	8d 04 80             	lea    eax,[eax+eax*4]
 1000b63:	01 c0                	add    eax,eax
 1000b65:	89 c7                	mov    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:220
    while ((cStatus & ATA_STATUS_BUSY) == ATA_STATUS_BUSY && (ticks>0))
 1000b67:	c1 eb 07             	shr    ebx,0x7
 1000b6a:	84 db                	test   bl,bl
 1000b6c:	74 29                	je     1000b97 <ataInit+0x255>
 1000b6e:	85 c0                	test   eax,eax
 1000b70:	7e 25                	jle    1000b97 <ataInit+0x255>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000b72:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000b79:	8d 50 07             	lea    edx,[eax+0x7]
 1000b7c:	ec                   	in     al,dx
 1000b7d:	89 c3                	mov    ebx,eax
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:223
    {
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
 1000b7f:	83 ec 0c             	sub    esp,0xc
 1000b82:	6a 01                	push   0x1
 1000b84:	e8 9f 23 00 00       	call   1002f28 <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:224
        ticks--;
 1000b89:	83 ef 01             	sub    edi,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:220
#endif
            return false;
        }
    }
    ticks=ATA_STANDARD_WAIT_MS*kTicksPerMS;
    while ((cStatus & ATA_STATUS_BUSY) == ATA_STATUS_BUSY && (ticks>0))
 1000b8c:	83 c4 10             	add    esp,0x10
 1000b8f:	84 db                	test   bl,bl
 1000b91:	79 04                	jns    1000b97 <ataInit+0x255>
 1000b93:	85 ff                	test   edi,edi
 1000b95:	7f db                	jg     1000b72 <ataInit+0x230>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:226
    {
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
        ticks--;
    }
    if (!ataControllerIsReady(devInfo))
 1000b97:	83 ec 0c             	sub    esp,0xc
 1000b9a:	56                   	push   esi
 1000b9b:	e8 0a fc ff ff       	call   10007aa <ataControllerIsReady>
 1000ba0:	89 c2                	mov    edx,eax
 1000ba2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:227
        return false;
 1000ba5:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:226
    {
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
        ticks--;
    }
    if (!ataControllerIsReady(devInfo))
 1000baa:	84 d2                	test   dl,dl
 1000bac:	74 50                	je     1000bfe <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:228
        return false;
    if (inb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW)!=0x55 || inb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH)!=0xaa)
 1000bae:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
 1000bb4:	8d 59 04             	lea    ebx,[ecx+0x4]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000bb7:	89 da                	mov    edx,ebx
 1000bb9:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:228
 1000bba:	3c 55                	cmp    al,0x55
 1000bbc:	75 08                	jne    1000bc6 <ataInit+0x284>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39 (discriminator 1)
 1000bbe:	8d 51 05             	lea    edx,[ecx+0x5]
 1000bc1:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:228 (discriminator 1)
 1000bc2:	3c aa                	cmp    al,0xaa
 1000bc4:	74 33                	je     1000bf9 <ataInit+0x2b7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:231
    {
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000bc6:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000bcd:	74 21                	je     1000bf0 <ataInit+0x2ae>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000bcf:	8d 51 05             	lea    edx,[ecx+0x5]
 1000bd2:	ec                   	in     al,dx
 1000bd3:	89 c1                	mov    ecx,eax
 1000bd5:	89 da                	mov    edx,ebx
 1000bd7:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:232
        printk("Cylinder port non-zero (%X,%X), device is non-ATA\n",inb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW), inb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH));
 1000bd8:	83 ec 04             	sub    esp,0x4
 1000bdb:	0f b6 c9             	movzx  ecx,cl
 1000bde:	51                   	push   ecx
 1000bdf:	0f b6 c0             	movzx  eax,al
 1000be2:	50                   	push   eax
 1000be3:	68 48 7c 00 01       	push   0x1007c48
 1000be8:	e8 92 19 00 00       	call   100257f <printk>
 1000bed:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
        return false;
 1000bf0:	0f b6 05 78 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a78
 1000bf7:	eb 05                	jmp    1000bfe <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:239
        if (useCDROMIdentify)
            return true;
        else
            return false;
    }
    return true;
 1000bf9:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:240
}
 1000bfe:	5b                   	pop    ebx
 1000bff:	5e                   	pop    esi
 1000c00:	5f                   	pop    edi
 1000c01:	c3                   	ret    

01000c02 <ataGetModelFromIdentify>:
ataGetModelFromIdentify():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:243

void ataGetModelFromIdentify(struct ataDeviceInfo_t* devInfo)
{
 1000c02:	56                   	push   esi
 1000c03:	53                   	push   ebx
 1000c04:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:244
    uint16_t* ident=devInfo->ATAIdentifyData+27;
 1000c08:	8d 46 36             	lea    eax,[esi+0x36]
 1000c0b:	8d 96 01 02 00 00    	lea    edx,[esi+0x201]
 1000c11:	8d 5e 5e             	lea    ebx,[esi+0x5e]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:247 (discriminator 3)
    for (int cnt=0;cnt<40;cnt+=2)
    {
        devInfo->ATADeviceModel[cnt]=(*ident >> 8) & 0xFF;
 1000c14:	0f b7 08             	movzx  ecx,WORD PTR [eax]
 1000c17:	66 c1 e9 08          	shr    cx,0x8
 1000c1b:	88 4a ff             	mov    BYTE PTR [edx-0x1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:248 (discriminator 3)
        devInfo->ATADeviceModel[cnt+1]=(*ident++) & 0xFF;
 1000c1e:	83 c0 02             	add    eax,0x2
 1000c21:	0f b7 48 fe          	movzx  ecx,WORD PTR [eax-0x2]
 1000c25:	88 0a                	mov    BYTE PTR [edx],cl
 1000c27:	83 c2 02             	add    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:245 (discriminator 3)
}

void ataGetModelFromIdentify(struct ataDeviceInfo_t* devInfo)
{
    uint16_t* ident=devInfo->ATAIdentifyData+27;
    for (int cnt=0;cnt<40;cnt+=2)
 1000c2a:	39 d8                	cmp    eax,ebx
 1000c2c:	75 e6                	jne    1000c14 <ataGetModelFromIdentify+0x12>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:250
    {
        devInfo->ATADeviceModel[cnt]=(*ident >> 8) & 0xFF;
        devInfo->ATADeviceModel[cnt+1]=(*ident++) & 0xFF;
    }
    devInfo->ATADeviceModel[79]='\0';
 1000c2e:	c6 86 4f 02 00 00 00 	mov    BYTE PTR [esi+0x24f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:251
}
 1000c35:	5b                   	pop    ebx
 1000c36:	5e                   	pop    esi
 1000c37:	c3                   	ret    

01000c38 <ataIdentify>:
ataIdentify():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:254

int ataIdentify(struct ataDeviceInfo_t* devInfo)
{
 1000c38:	56                   	push   esi
 1000c39:	53                   	push   ebx
 1000c3a:	83 ec 04             	sub    esp,0x4
 1000c3d:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:256
    //For ATA devices, read the identity data.  For SATA, we've already read it into ATAIdentityData
    if (devInfo->queryATAData)
 1000c41:	80 be 50 02 00 00 00 	cmp    BYTE PTR [esi+0x250],0x0
 1000c48:	74 5c                	je     1000ca6 <ataIdentify+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:258
    {
        if (useCDROMIdentify)
 1000c4a:	80 3d 78 4a 01 01 00 	cmp    BYTE PTR ds:0x1014a78,0x0
 1000c51:	74 12                	je     1000c65 <ataIdentify+0x2d>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1000c53:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000c5a:	8d 50 07             	lea    edx,[eax+0x7]
 1000c5d:	b8 a1 ff ff ff       	mov    eax,0xffffffa1
 1000c62:	ee                   	out    dx,al
 1000c63:	eb 10                	jmp    1000c75 <ataIdentify+0x3d>
 1000c65:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000c6c:	8d 50 07             	lea    edx,[eax+0x7]
 1000c6f:	b8 ec ff ff ff       	mov    eax,0xffffffec
 1000c74:	ee                   	out    dx,al
ataIdentify():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:262
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_CDROM_COMMAND);
        else
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
        wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
 1000c75:	83 ec 0c             	sub    esp,0xc
 1000c78:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1000c7d:	8d 04 80             	lea    eax,[eax+eax*4]
 1000c80:	01 c0                	add    eax,eax
 1000c82:	50                   	push   eax
 1000c83:	e8 a0 22 00 00       	call   1002f28 <wait>
 1000c88:	0f b7 96 69 02 00 00 	movzx  edx,WORD PTR [esi+0x269]
 1000c8f:	89 f1                	mov    ecx,esi
 1000c91:	8d 9e 00 02 00 00    	lea    ebx,[esi+0x200]
 1000c97:	83 c4 10             	add    esp,0x10
inw():
/home/yogi/src/os/chrisOSKernel/include/io.h:46 (discriminator 3)
}

static __inline unsigned short inw(unsigned short __port)
{
	unsigned short __val;
	__asm__ volatile ("inw %0, %1" : "=a" (__val) : "dN" (__port));
 1000c9a:	66 ed                	in     ax,dx
ataIdentify():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:265 (discriminator 3)
        for (int readCount=0;readCount<=255;readCount++)
        {
            devInfo->ATAIdentifyData[readCount]=inw(devInfo->ioPort+ATA_PORT_DATA);
 1000c9c:	66 89 01             	mov    WORD PTR [ecx],ax
 1000c9f:	83 c1 02             	add    ecx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:263 (discriminator 3)
        if (useCDROMIdentify)
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_CDROM_COMMAND);
        else
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
        wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
        for (int readCount=0;readCount<=255;readCount++)
 1000ca2:	39 d9                	cmp    ecx,ebx
 1000ca4:	75 f4                	jne    1000c9a <ataIdentify+0x62>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:268
        {
            devInfo->ATAIdentifyData[readCount]=inw(devInfo->ioPort+ATA_PORT_DATA);
        }
    }
    ataGetModelFromIdentify(devInfo);
 1000ca6:	83 ec 0c             	sub    esp,0xc
 1000ca9:	56                   	push   esi
 1000caa:	e8 53 ff ff ff       	call   1000c02 <ataGetModelFromIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:269
    devInfo->totalSectorCount = devInfo->ATAIdentifyData[60] | (devInfo->ATAIdentifyData[61]<<16);
 1000caf:	0f b7 46 7a          	movzx  eax,WORD PTR [esi+0x7a]
 1000cb3:	c1 e0 10             	shl    eax,0x10
 1000cb6:	0f b7 56 78          	movzx  edx,WORD PTR [esi+0x78]
 1000cba:	09 d0                	or     eax,edx
 1000cbc:	89 86 56 02 00 00    	mov    DWORD PTR [esi+0x256],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:270
    devInfo->sectorSize = (devInfo->ATAIdentifyData[106] & 1<<12)==1<<12
 1000cc2:	83 c4 10             	add    esp,0x10
 1000cc5:	b8 00 02 00 00       	mov    eax,0x200
 1000cca:	f6 86 d5 00 00 00 10 	test   BYTE PTR [esi+0xd5],0x10
 1000cd1:	74 12                	je     1000ce5 <ataIdentify+0xad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:270 (discriminator 1)
 1000cd3:	0f b7 46 24          	movzx  eax,WORD PTR [esi+0x24]
 1000cd7:	c1 e0 10             	shl    eax,0x10
 1000cda:	89 c2                	mov    edx,eax
 1000cdc:	0f b7 86 ea 00 00 00 	movzx  eax,WORD PTR [esi+0xea]
 1000ce3:	09 d0                	or     eax,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:270 (discriminator 4)
 1000ce5:	89 86 5a 02 00 00    	mov    DWORD PTR [esi+0x25a],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:273 (discriminator 4)
            ?devInfo->ATAIdentifyData[117] | (devInfo->ATAIdentifyData[18]<<16)
            :512;
    devInfo->dmaSupported=devInfo->ATAIdentifyData[49]>>8 & 0x1;
 1000ceb:	0f b7 46 62          	movzx  eax,WORD PTR [esi+0x62]
 1000cef:	89 c2                	mov    edx,eax
 1000cf1:	66 c1 ea 08          	shr    dx,0x8
 1000cf5:	83 e2 01             	and    edx,0x1
 1000cf8:	88 96 60 02 00 00    	mov    BYTE PTR [esi+0x260],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:274 (discriminator 4)
    devInfo->lbaSupported=devInfo->ATAIdentifyData[49]>>9 & 0x1;
 1000cfe:	66 c1 e8 09          	shr    ax,0x9
 1000d02:	83 e0 01             	and    eax,0x1
 1000d05:	88 86 5e 02 00 00    	mov    BYTE PTR [esi+0x25e],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:275 (discriminator 4)
    devInfo->lba48Supported=devInfo->ATAIdentifyData[83]>>10 & 0x1;
 1000d0b:	0f b7 86 a6 00 00 00 	movzx  eax,WORD PTR [esi+0xa6]
 1000d12:	66 c1 e8 0a          	shr    ax,0xa
 1000d16:	83 e0 01             	and    eax,0x1
 1000d19:	88 86 5f 02 00 00    	mov    BYTE PTR [esi+0x25f],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:278 (discriminator 4)
    
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000d1f:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000d26:	74 1d                	je     1000d45 <ataIdentify+0x10d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:279
        printk("drive %d, model=%s\n",devInfo->driveNo, devInfo->ATADeviceModel);
 1000d28:	83 ec 04             	sub    esp,0x4
 1000d2b:	8d 86 00 02 00 00    	lea    eax,[esi+0x200]
 1000d31:	50                   	push   eax
 1000d32:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000d38:	68 82 76 00 01       	push   0x1007682
 1000d3d:	e8 3d 18 00 00       	call   100257f <printk>
 1000d42:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:282
#endif
    return 1;
}
 1000d45:	b8 01 00 00 00       	mov    eax,0x1
 1000d4a:	83 c4 04             	add    esp,0x4
 1000d4d:	5b                   	pop    ebx
 1000d4e:	5e                   	pop    esi
 1000d4f:	c3                   	ret    

01000d50 <ataScanForHarddrives>:
ataScanForHarddrives():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:285

int ataScanForHarddrives()
{
 1000d50:	53                   	push   ebx
 1000d51:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:286
    kATADeviceInfo[0].bus=ATAPrimary;
 1000d54:	8b 1d c0 02 12 00    	mov    ebx,DWORD PTR ds:0x1202c0
 1000d5a:	c7 83 61 02 00 00 00 	mov    DWORD PTR [ebx+0x261],0x0
 1000d61:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:287
    kATADeviceInfo[0].driveNo=0;
 1000d64:	c7 83 65 02 00 00 00 	mov    DWORD PTR [ebx+0x265],0x0
 1000d6b:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:288
    kATADeviceInfo[0].ioPort=0x1F0;
 1000d6e:	c7 83 69 02 00 00 f0 	mov    DWORD PTR [ebx+0x269],0x1f0
 1000d75:	01 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:289
    kATADeviceInfo[0].irqNum=0x14;
 1000d78:	c6 83 6d 02 00 00 14 	mov    BYTE PTR [ebx+0x26d],0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:290
    kATADeviceInfo[0].driveHeadPortDesignation=0xA0;
 1000d7f:	c6 83 6e 02 00 00 a0 	mov    BYTE PTR [ebx+0x26e],0xa0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:291
    kATADeviceInfo[0].queryATAData=true;
 1000d86:	c6 83 50 02 00 00 01 	mov    BYTE PTR [ebx+0x250],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:292
    kATADeviceInfo[0].ATADeviceAvailable=ataInit(&kATADeviceInfo[0]);
 1000d8d:	53                   	push   ebx
 1000d8e:	e8 af fb ff ff       	call   1000942 <ataInit>
 1000d93:	88 83 51 02 00 00    	mov    BYTE PTR [ebx+0x251],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:293
    if (kATADeviceInfo[0].ATADeviceAvailable)
 1000d99:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000d9e:	83 c4 10             	add    esp,0x10
 1000da1:	80 b8 51 02 00 00 00 	cmp    BYTE PTR [eax+0x251],0x0
 1000da8:	74 35                	je     1000ddf <ataScanForHarddrives+0x8f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:295
    {
        ataIdentify(&kATADeviceInfo[0]);
 1000daa:	83 ec 0c             	sub    esp,0xc
 1000dad:	50                   	push   eax
 1000dae:	e8 85 fe ff ff       	call   1000c38 <ataIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:296
        if (useCDROMIdentify)
 1000db3:	83 c4 10             	add    esp,0x10
 1000db6:	80 3d 78 4a 01 01 00 	cmp    BYTE PTR ds:0x1014a78,0x0
 1000dbd:	74 11                	je     1000dd0 <ataScanForHarddrives+0x80>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:297
            kATADeviceInfo[0].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000dbf:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000dc4:	c7 80 52 02 00 00 01 	mov    DWORD PTR [eax+0x252],0x1
 1000dcb:	00 00 00 
 1000dce:	eb 0f                	jmp    1000ddf <ataScanForHarddrives+0x8f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:299
        else
            kATADeviceInfo[0].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000dd0:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000dd5:	c7 80 52 02 00 00 00 	mov    DWORD PTR [eax+0x252],0x0
 1000ddc:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:301
    }
    useCDROMIdentify=false;
 1000ddf:	c6 05 78 4a 01 01 00 	mov    BYTE PTR ds:0x1014a78,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:303

    kATADeviceInfo[1].bus=ATAPrimary;
 1000de6:	8b 1d c0 02 12 00    	mov    ebx,DWORD PTR ds:0x1202c0
 1000dec:	c7 83 d4 04 00 00 00 	mov    DWORD PTR [ebx+0x4d4],0x0
 1000df3:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:304
    kATADeviceInfo[1].driveNo=1;
 1000df6:	c7 83 d8 04 00 00 01 	mov    DWORD PTR [ebx+0x4d8],0x1
 1000dfd:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:305
    kATADeviceInfo[1].ioPort=0x1F0;
 1000e00:	c7 83 dc 04 00 00 f0 	mov    DWORD PTR [ebx+0x4dc],0x1f0
 1000e07:	01 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:306
    kATADeviceInfo[1].irqNum=0x14;
 1000e0a:	c6 83 e0 04 00 00 14 	mov    BYTE PTR [ebx+0x4e0],0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:307
    kATADeviceInfo[1].driveHeadPortDesignation=0xB0;
 1000e11:	c6 83 e1 04 00 00 b0 	mov    BYTE PTR [ebx+0x4e1],0xb0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:308
    kATADeviceInfo[1].queryATAData=true;
 1000e18:	c6 83 c3 04 00 00 01 	mov    BYTE PTR [ebx+0x4c3],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:309
    kATADeviceInfo[1].ATADeviceAvailable=ataInit(&kATADeviceInfo[1]);
 1000e1f:	83 ec 0c             	sub    esp,0xc
 1000e22:	8d 83 73 02 00 00    	lea    eax,[ebx+0x273]
 1000e28:	50                   	push   eax
 1000e29:	e8 14 fb ff ff       	call   1000942 <ataInit>
 1000e2e:	88 83 c4 04 00 00    	mov    BYTE PTR [ebx+0x4c4],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:310
    if (kATADeviceInfo[1].ATADeviceAvailable)
 1000e34:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000e39:	83 c4 10             	add    esp,0x10
 1000e3c:	80 b8 c4 04 00 00 00 	cmp    BYTE PTR [eax+0x4c4],0x0
 1000e43:	74 3a                	je     1000e7f <ataScanForHarddrives+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:312
    {
        ataIdentify(&kATADeviceInfo[1]);
 1000e45:	83 ec 0c             	sub    esp,0xc
 1000e48:	05 73 02 00 00       	add    eax,0x273
 1000e4d:	50                   	push   eax
 1000e4e:	e8 e5 fd ff ff       	call   1000c38 <ataIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:313
        if (useCDROMIdentify)
 1000e53:	83 c4 10             	add    esp,0x10
 1000e56:	80 3d 78 4a 01 01 00 	cmp    BYTE PTR ds:0x1014a78,0x0
 1000e5d:	74 11                	je     1000e70 <ataScanForHarddrives+0x120>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:314
            kATADeviceInfo[1].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000e5f:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000e64:	c7 80 c5 04 00 00 01 	mov    DWORD PTR [eax+0x4c5],0x1
 1000e6b:	00 00 00 
 1000e6e:	eb 0f                	jmp    1000e7f <ataScanForHarddrives+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:316
        else
            kATADeviceInfo[1].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000e70:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000e75:	c7 80 c5 04 00 00 00 	mov    DWORD PTR [eax+0x4c5],0x0
 1000e7c:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:318
    }
    kATADeviceInfo[2].bus=ATASecondary;
 1000e7f:	8b 1d c0 02 12 00    	mov    ebx,DWORD PTR ds:0x1202c0
 1000e85:	c7 83 47 07 00 00 01 	mov    DWORD PTR [ebx+0x747],0x1
 1000e8c:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:319
    kATADeviceInfo[2].driveNo=2;
 1000e8f:	c7 83 4b 07 00 00 02 	mov    DWORD PTR [ebx+0x74b],0x2
 1000e96:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:320
    kATADeviceInfo[2].ioPort=0x170;
 1000e99:	c7 83 4f 07 00 00 70 	mov    DWORD PTR [ebx+0x74f],0x170
 1000ea0:	01 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:321
    kATADeviceInfo[2].irqNum=0x15;
 1000ea3:	c6 83 53 07 00 00 15 	mov    BYTE PTR [ebx+0x753],0x15
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:322
    kATADeviceInfo[2].driveHeadPortDesignation=0xA0;
 1000eaa:	c6 83 54 07 00 00 a0 	mov    BYTE PTR [ebx+0x754],0xa0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:323
    kATADeviceInfo[2].queryATAData=false;
 1000eb1:	c6 83 36 07 00 00 00 	mov    BYTE PTR [ebx+0x736],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:324
    kATADeviceInfo[2].ATADeviceAvailable=ataInit(&kATADeviceInfo[2]);
 1000eb8:	83 ec 0c             	sub    esp,0xc
 1000ebb:	8d 83 e6 04 00 00    	lea    eax,[ebx+0x4e6]
 1000ec1:	50                   	push   eax
 1000ec2:	e8 7b fa ff ff       	call   1000942 <ataInit>
 1000ec7:	88 83 37 07 00 00    	mov    BYTE PTR [ebx+0x737],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:325
    if (kATADeviceInfo[2].ATADeviceAvailable)
 1000ecd:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000ed2:	83 c4 10             	add    esp,0x10
 1000ed5:	80 b8 37 07 00 00 00 	cmp    BYTE PTR [eax+0x737],0x0
 1000edc:	74 3a                	je     1000f18 <ataScanForHarddrives+0x1c8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:327
    {
        ataIdentify(&kATADeviceInfo[2]);
 1000ede:	83 ec 0c             	sub    esp,0xc
 1000ee1:	05 e6 04 00 00       	add    eax,0x4e6
 1000ee6:	50                   	push   eax
 1000ee7:	e8 4c fd ff ff       	call   1000c38 <ataIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:328
        if (useCDROMIdentify)
 1000eec:	83 c4 10             	add    esp,0x10
 1000eef:	80 3d 78 4a 01 01 00 	cmp    BYTE PTR ds:0x1014a78,0x0
 1000ef6:	74 11                	je     1000f09 <ataScanForHarddrives+0x1b9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:329
            kATADeviceInfo[2].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000ef8:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000efd:	c7 80 38 07 00 00 01 	mov    DWORD PTR [eax+0x738],0x1
 1000f04:	00 00 00 
 1000f07:	eb 0f                	jmp    1000f18 <ataScanForHarddrives+0x1c8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:331
        else
            kATADeviceInfo[2].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000f09:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000f0e:	c7 80 38 07 00 00 00 	mov    DWORD PTR [eax+0x738],0x0
 1000f15:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:334
    }

    kATADeviceInfo[3].bus=ATASecondary;
 1000f18:	8b 1d c0 02 12 00    	mov    ebx,DWORD PTR ds:0x1202c0
 1000f1e:	c7 83 ba 09 00 00 01 	mov    DWORD PTR [ebx+0x9ba],0x1
 1000f25:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:335
    kATADeviceInfo[3].driveNo=3;
 1000f28:	c7 83 be 09 00 00 03 	mov    DWORD PTR [ebx+0x9be],0x3
 1000f2f:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:336
    kATADeviceInfo[3].ioPort=0x170;
 1000f32:	c7 83 c2 09 00 00 70 	mov    DWORD PTR [ebx+0x9c2],0x170
 1000f39:	01 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:337
    kATADeviceInfo[3].irqNum=0x15;
 1000f3c:	c6 83 c6 09 00 00 15 	mov    BYTE PTR [ebx+0x9c6],0x15
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:338
    kATADeviceInfo[3].driveHeadPortDesignation=0xB0;
 1000f43:	c6 83 c7 09 00 00 b0 	mov    BYTE PTR [ebx+0x9c7],0xb0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:339
    kATADeviceInfo[3].queryATAData=true;
 1000f4a:	c6 83 a9 09 00 00 01 	mov    BYTE PTR [ebx+0x9a9],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:340
    kATADeviceInfo[3].ATADeviceAvailable=ataInit(&kATADeviceInfo[3]);
 1000f51:	83 ec 0c             	sub    esp,0xc
 1000f54:	8d 83 59 07 00 00    	lea    eax,[ebx+0x759]
 1000f5a:	50                   	push   eax
 1000f5b:	e8 e2 f9 ff ff       	call   1000942 <ataInit>
 1000f60:	88 83 aa 09 00 00    	mov    BYTE PTR [ebx+0x9aa],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:341
    if (kATADeviceInfo[3].ATADeviceAvailable)
 1000f66:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000f6b:	83 c4 10             	add    esp,0x10
 1000f6e:	80 b8 aa 09 00 00 00 	cmp    BYTE PTR [eax+0x9aa],0x0
 1000f75:	74 3a                	je     1000fb1 <ataScanForHarddrives+0x261>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:343
    {
        ataIdentify(&kATADeviceInfo[3]);
 1000f77:	83 ec 0c             	sub    esp,0xc
 1000f7a:	05 59 07 00 00       	add    eax,0x759
 1000f7f:	50                   	push   eax
 1000f80:	e8 b3 fc ff ff       	call   1000c38 <ataIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:344
        if (useCDROMIdentify)
 1000f85:	83 c4 10             	add    esp,0x10
 1000f88:	80 3d 78 4a 01 01 00 	cmp    BYTE PTR ds:0x1014a78,0x0
 1000f8f:	74 11                	je     1000fa2 <ataScanForHarddrives+0x252>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:345
            kATADeviceInfo[3].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000f91:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000f96:	c7 80 ab 09 00 00 01 	mov    DWORD PTR [eax+0x9ab],0x1
 1000f9d:	00 00 00 
 1000fa0:	eb 0f                	jmp    1000fb1 <ataScanForHarddrives+0x261>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:347
        else
            kATADeviceInfo[3].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000fa2:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000fa7:	c7 80 ab 09 00 00 00 	mov    DWORD PTR [eax+0x9ab],0x0
 1000fae:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:351
    }

#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000fb1:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000fb8:	74 22                	je     1000fdc <ataScanForHarddrives+0x28c>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:352
        printk("INIT: Disk1=%s  Disk2=%s\n", kATADeviceInfo[0].ATADeviceModel, kATADeviceInfo[1].ATADeviceModel);
 1000fba:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000fbf:	83 ec 04             	sub    esp,0x4
 1000fc2:	8d 90 73 04 00 00    	lea    edx,[eax+0x473]
 1000fc8:	52                   	push   edx
 1000fc9:	05 00 02 00 00       	add    eax,0x200
 1000fce:	50                   	push   eax
 1000fcf:	68 96 76 00 01       	push   0x1007696
 1000fd4:	e8 a6 15 00 00       	call   100257f <printk>
 1000fd9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:355
#endif
            return 0;
}
 1000fdc:	b8 00 00 00 00       	mov    eax,0x0
 1000fe1:	83 c4 08             	add    esp,0x8
 1000fe4:	5b                   	pop    ebx
 1000fe5:	c3                   	ret    

01000fe6 <ataBlockingRead28>:
ataBlockingRead28():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:365
        return -1;
    return ataBlockingRead28(sector, buffer, sector_count);
}

int ataBlockingRead28(uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
 1000fe6:	55                   	push   ebp
 1000fe7:	57                   	push   edi
 1000fe8:	56                   	push   esi
 1000fe9:	53                   	push   ebx
 1000fea:	83 ec 1c             	sub    esp,0x1c
 1000fed:	8b 74 24 34          	mov    esi,DWORD PTR [esp+0x34]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:370
    //For now if the FAT library calls this, we assume we've already read the same partition most recently
    int lResult=0;
    uint8_t* bufp=buffer;
    uint32_t lSectorsLeft=sector_count;
    uint32_t lSector=sector+partOffset; //this represents the start of the partition
 1000ff1:	a1 70 4a 01 01       	mov    eax,ds:0x1014a70
 1000ff6:	03 44 24 30          	add    eax,DWORD PTR [esp+0x30]
 1000ffa:	89 c5                	mov    ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:373

#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000ffc:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1001003:	74 18                	je     100101d <ataBlockingRead28+0x37>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:375
        {
            printk("ataBlockingRead28: sec: 0x%08X, buf 0x%08X, cnt 0x%08X\n", lSector, bufp, sector_count);
 1001005:	ff 74 24 38          	push   DWORD PTR [esp+0x38]
 1001009:	56                   	push   esi
 100100a:	50                   	push   eax
 100100b:	68 7c 7c 00 01       	push   0x1007c7c
 1001010:	e8 6a 15 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:376
            waitForKeyboardKey();
 1001015:	e8 a2 f4 ff ff       	call   10004bc <waitForKeyboardKey>
 100101a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:379
        }
#endif
    lResult=ataWaitForIdle(atablockingReadDev);
 100101d:	83 ec 0c             	sub    esp,0xc
 1001020:	ff 35 20 a0 00 01    	push   DWORD PTR ds:0x100a020
 1001026:	e8 cc f6 ff ff       	call   10006f7 <ataWaitForIdle>
 100102b:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:380
    if (lResult)
 100102e:	83 c4 10             	add    esp,0x10
 1001031:	85 c0                	test   eax,eax
 1001033:	74 11                	je     1001046 <ataBlockingRead28+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:381
        panic("ataBlockingRead28: Timeout waiting for DRQ and BSY to be clear (0x%02X)", lResult);
 1001035:	83 ec 08             	sub    esp,0x8
 1001038:	50                   	push   eax
 1001039:	68 b4 7c 00 01       	push   0x1007cb4
 100103e:	e8 b5 10 00 00       	call   10020f8 <panic>
 1001043:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:386
        //Select the drive we want
        //NOTE: Drive selected prior to calling this function
        //ataSelectDrive(drive,0);
        //Magic bit (6) to set LBA mode and top 4 bits of LBA28 sector # go in bottom 4
    outb(atablockingReadDev->ioPort+ATA_DRIVE_SELECT, inb(atablockingReadDev->ioPort+ATA_DRIVE_SELECT) | (1 << 6) | ((lSector >> 24) & 0x0F));
 1001046:	8b 1d 20 a0 00 01    	mov    ebx,DWORD PTR ds:0x100a020
 100104c:	8b 8b 69 02 00 00    	mov    ecx,DWORD PTR [ebx+0x269]
 1001052:	8d 51 06             	lea    edx,[ecx+0x6]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1001055:	ec                   	in     al,dx
 1001056:	89 c7                	mov    edi,eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001058:	89 e8                	mov    eax,ebp
 100105a:	c1 e8 18             	shr    eax,0x18
 100105d:	83 e0 0f             	and    eax,0xf
 1001060:	83 c8 40             	or     eax,0x40
 1001063:	09 f8                	or     eax,edi
 1001065:	ee                   	out    dx,al
 1001066:	8d 51 02             	lea    edx,[ecx+0x2]
 1001069:	0f b6 44 24 38       	movzx  eax,BYTE PTR [esp+0x38]
 100106e:	ee                   	out    dx,al
 100106f:	8d 51 03             	lea    edx,[ecx+0x3]
 1001072:	89 e8                	mov    eax,ebp
 1001074:	ee                   	out    dx,al
 1001075:	89 e8                	mov    eax,ebp
 1001077:	c1 e8 08             	shr    eax,0x8
 100107a:	8d 51 04             	lea    edx,[ecx+0x4]
 100107d:	ee                   	out    dx,al
 100107e:	89 e8                	mov    eax,ebp
 1001080:	c1 e8 10             	shr    eax,0x10
 1001083:	8d 51 05             	lea    edx,[ecx+0x5]
 1001086:	ee                   	out    dx,al
 1001087:	8d 51 07             	lea    edx,[ecx+0x7]
 100108a:	b8 20 00 00 00       	mov    eax,0x20
 100108f:	ee                   	out    dx,al
ataBlockingRead28():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:396
    //Send the LBA sector number in the next 3 fields + high bit in the 
    outb(atablockingReadDev->ioPort+ATA_PORT_SECTOR_NUMBER, (lSector) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_CYLINDER_LOW, (lSector >> 8) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_CYLINDER_HIGH, (lSector >> 16) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_COMMAND, ATA_COMMAND_READ_SECTOR);
    lResult=ataWaitForDRQ(atablockingReadDev, true, ATA_STANDARD_WAIT_MS*kTicksPerMS);
 1001090:	83 ec 04             	sub    esp,0x4
 1001093:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1001098:	8d 04 80             	lea    eax,[eax+eax*4]
 100109b:	01 c0                	add    eax,eax
 100109d:	50                   	push   eax
 100109e:	6a 01                	push   0x1
 10010a0:	53                   	push   ebx
 10010a1:	e8 e2 f5 ff ff       	call   1000688 <ataWaitForDRQ>
 10010a6:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:397
    if (lResult)
 10010a9:	83 c4 10             	add    esp,0x10
 10010ac:	85 c0                	test   eax,eax
 10010ae:	74 17                	je     10010c7 <ataBlockingRead28+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:398
        panic("ataBlockingRead28: Timeout waiting for DRQ to be set Stts=0x%02X, Err=0x%02X", lResult, hdError);
 10010b0:	83 ec 04             	sub    esp,0x4
 10010b3:	ff 35 74 4a 01 01    	push   DWORD PTR ds:0x1014a74
 10010b9:	50                   	push   eax
 10010ba:	68 fc 7c 00 01       	push   0x1007cfc
 10010bf:	e8 34 10 00 00       	call   10020f8 <panic>
 10010c4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:399
    while (lSectorsLeft)
 10010c7:	83 7c 24 38 00       	cmp    DWORD PTR [esp+0x38],0x0
 10010cc:	0f 84 e7 00 00 00    	je     10011b9 <ataBlockingRead28+0x1d3>
 10010d2:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
 10010d6:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:401
    {
        insw(atablockingReadDev->ioPort+ATA_PORT_DATA, bufp, 256);
 10010da:	a1 20 a0 00 01       	mov    eax,ds:0x100a020
insw():
/home/yogi/src/os/chrisOSKernel/include/io.h:87
		      : "d" (__port));
}

static __inline void insw(unsigned short __port, void *__buf, unsigned long __n)
{
	__asm__ volatile ("cld; rep; insw"
 10010df:	8b 90 69 02 00 00    	mov    edx,DWORD PTR [eax+0x269]
 10010e5:	89 f7                	mov    edi,esi
 10010e7:	b9 00 01 00 00       	mov    ecx,0x100
 10010ec:	fc                   	cld    
 10010ed:	f3 66 6d             	rep ins WORD PTR es:[edi],dx
ataBlockingRead28():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:403
        #ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10010f0:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 10010f7:	74 40                	je     1001139 <ataBlockingRead28+0x153>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:405
            {
                printk("ataBlockingRead28: Debugging: ");
 10010f9:	83 ec 0c             	sub    esp,0xc
 10010fc:	68 4c 7d 00 01       	push   0x1007d4c
 1001101:	e8 79 14 00 00       	call   100257f <printk>
 1001106:	89 f3                	mov    ebx,esi
 1001108:	8d 7e 14             	lea    edi,[esi+0x14]
 100110b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:407 (discriminator 3)
                for (int cnt2=0;cnt2<20;cnt2++)
                    printk("%02X ", bufp[cnt2]);
 100110e:	83 ec 08             	sub    esp,0x8
 1001111:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001114:	50                   	push   eax
 1001115:	68 b0 76 00 01       	push   0x10076b0
 100111a:	e8 60 14 00 00       	call   100257f <printk>
 100111f:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:406 (discriminator 3)
        insw(atablockingReadDev->ioPort+ATA_PORT_DATA, bufp, 256);
        #ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            {
                printk("ataBlockingRead28: Debugging: ");
                for (int cnt2=0;cnt2<20;cnt2++)
 1001122:	83 c4 10             	add    esp,0x10
 1001125:	39 df                	cmp    edi,ebx
 1001127:	75 e5                	jne    100110e <ataBlockingRead28+0x128>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:408
                    printk("%02X ", bufp[cnt2]);
                printk("\n");
 1001129:	83 ec 0c             	sub    esp,0xc
 100112c:	68 5e 7a 00 01       	push   0x1007a5e
 1001131:	e8 49 14 00 00       	call   100257f <printk>
 1001136:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:411
            }
        #endif
        if (--lSectorsLeft>0) //zero based vs 1 based
 1001139:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
 100113e:	74 79                	je     10011b9 <ataBlockingRead28+0x1d3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:413
        {
            wait(50);
 1001140:	83 ec 0c             	sub    esp,0xc
 1001143:	6a 32                	push   0x32
 1001145:	e8 de 1d 00 00       	call   1002f28 <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:414
            lResult=ataWaitForDRQ(atablockingReadDev, true, ATA_STANDARD_WAIT_MS*kTicksPerMS);
 100114a:	83 c4 0c             	add    esp,0xc
 100114d:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1001152:	8d 04 80             	lea    eax,[eax+eax*4]
 1001155:	01 c0                	add    eax,eax
 1001157:	50                   	push   eax
 1001158:	6a 01                	push   0x1
 100115a:	ff 35 20 a0 00 01    	push   DWORD PTR ds:0x100a020
 1001160:	e8 23 f5 ff ff       	call   1000688 <ataWaitForDRQ>
 1001165:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:415
            bufp+=512;
 1001168:	81 c6 00 02 00 00    	add    esi,0x200
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:416
            lSector++;
 100116e:	83 c5 01             	add    ebp,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:417
            if (lResult)
 1001171:	83 c4 10             	add    esp,0x10
 1001174:	85 c0                	test   eax,eax
 1001176:	74 17                	je     100118f <ataBlockingRead28+0x1a9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:418
                panic("ataBlockingRead28: Timeout in read loop, waiting for DRQ to be set Stts=0x%02X, Err=0x%02X", lResult, hdError);
 1001178:	83 ec 04             	sub    esp,0x4
 100117b:	ff 35 74 4a 01 01    	push   DWORD PTR ds:0x1014a74
 1001181:	50                   	push   eax
 1001182:	68 6c 7d 00 01       	push   0x1007d6c
 1001187:	e8 6c 0f 00 00       	call   10020f8 <panic>
 100118c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:420
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 100118f:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1001196:	0f 84 3e ff ff ff    	je     10010da <ataBlockingRead28+0xf4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:422
        {
            printk("ataBlockingRead28: sec=0x%08X, buf=0x%08X, rep=0x%08X    \n", lSector, bufp, lSectorsLeft);
 100119c:	ff 74 24 0c          	push   DWORD PTR [esp+0xc]
 10011a0:	56                   	push   esi
 10011a1:	55                   	push   ebp
 10011a2:	68 c8 7d 00 01       	push   0x1007dc8
 10011a7:	e8 d3 13 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:423
            waitForKeyboardKey();
 10011ac:	e8 0b f3 ff ff       	call   10004bc <waitForKeyboardKey>
 10011b1:	83 c4 10             	add    esp,0x10
 10011b4:	e9 21 ff ff ff       	jmp    10010da <ataBlockingRead28+0xf4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:428
        }
#endif
        }
    }
    return 512*sector_count;
 10011b9:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
 10011bd:	c1 e0 09             	shl    eax,0x9
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:429
}
 10011c0:	83 c4 1c             	add    esp,0x1c
 10011c3:	5b                   	pop    ebx
 10011c4:	5e                   	pop    esi
 10011c5:	5f                   	pop    edi
 10011c6:	5d                   	pop    ebp
 10011c7:	c3                   	ret    

010011c8 <ataReadDisk>:
ataReadDisk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:357
        printk("INIT: Disk1=%s  Disk2=%s\n", kATADeviceInfo[0].ATADeviceModel, kATADeviceInfo[1].ATADeviceModel);
#endif
            return 0;
}
int ataReadDisk(struct ataDeviceInfo_t* devInfo, uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
 10011c8:	83 ec 0c             	sub    esp,0xc
 10011cb:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:358
    atablockingReadDev = devInfo;
 10011cf:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 10011d3:	89 15 20 a0 00 01    	mov    DWORD PTR ds:0x100a020,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:359
    if (sector_count==0)    //this function can be called with a sector_count of 0 in order to set partOffset
 10011d9:	85 c0                	test   eax,eax
 10011db:	74 16                	je     10011f3 <ataReadDisk+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:361
        return -1;
    return ataBlockingRead28(sector, buffer, sector_count);
 10011dd:	83 ec 04             	sub    esp,0x4
 10011e0:	50                   	push   eax
 10011e1:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 10011e5:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 10011e9:	e8 f8 fd ff ff       	call   1000fe6 <ataBlockingRead28>
 10011ee:	83 c4 10             	add    esp,0x10
 10011f1:	eb 05                	jmp    10011f8 <ataReadDisk+0x30>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:360
}
int ataReadDisk(struct ataDeviceInfo_t* devInfo, uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
    atablockingReadDev = devInfo;
    if (sector_count==0)    //this function can be called with a sector_count of 0 in order to set partOffset
        return -1;
 10011f3:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:362
    return ataBlockingRead28(sector, buffer, sector_count);
}
 10011f8:	83 c4 0c             	add    esp,0xc
 10011fb:	c3                   	ret    

010011fc <ataBlockingWrite28>:
ataBlockingWrite28():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:468
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("ataBlockingWrite28: Finished sending data\n");
#endif
    return 512;
*/}
 10011fc:	f3 c3                	repz ret 
 10011fe:	66 90                	xchg   ax,ax

01001200 <kPagingGet4kPDEntryValue>:
kPagingGet4kPDEntryValue():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:19
extern uint32_t*  kKernelPageDir;
extern uint64_t kE820MemoryBytes;
extern uint32_t kDebugLevel;

uint32_t kPagingGet4kPDEntryValue(uint32_t address)
{
 1001200:	53                   	push   ebx
 1001201:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:21
    address&=0xFFFFF000;
    uintptr_t* lTemp=(uint32_t*)((KERNEL_PAGE_DIR_ADDRESS + (((address & 0xFFC00000) >> 22) << 2)));
 1001204:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1001208:	c1 eb 16             	shr    ebx,0x16
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:23
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 100120b:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001212:	74 17                	je     100122b <kPagingGet4kPDEntryValue+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:24
            printk("pagingGet4kPDEntryValue: dirAddressPtr=0x%08x\n", *lTemp);
 1001214:	83 ec 08             	sub    esp,0x8
 1001217:	ff 34 9d 00 90 4a 00 	push   DWORD PTR [ebx*4+0x4a9000]
 100121e:	68 04 7e 00 01       	push   0x1007e04
 1001223:	e8 57 13 00 00       	call   100257f <printk>
 1001228:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:26
#endif
    return (uint32_t)*lTemp;
 100122b:	8b 04 9d 00 90 4a 00 	mov    eax,DWORD PTR [ebx*4+0x4a9000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:27
}
 1001232:	83 c4 08             	add    esp,0x8
 1001235:	5b                   	pop    ebx
 1001236:	c3                   	ret    

01001237 <kPagingGet4kPDEntryAddress>:
kPagingGet4kPDEntryAddress():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:30

uint32_t kPagingGet4kPDEntryAddress(uint32_t address)
{
 1001237:	53                   	push   ebx
 1001238:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:32
    address&=0xFFFFF000;
    uintptr_t lTemp=((KERNEL_PAGE_DIR_ADDRESS  | (((address & 0xFFC00000) >> 22) << 2)));
 100123b:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 100123f:	c1 eb 16             	shr    ebx,0x16
 1001242:	c1 e3 02             	shl    ebx,0x2
 1001245:	81 cb 00 90 4a 00    	or     ebx,0x4a9000
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:34
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 100124b:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001252:	74 11                	je     1001265 <kPagingGet4kPDEntryAddress+0x2e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:35
            printk("dirEntryAddress=0x%08x\n", lTemp);
 1001254:	83 ec 08             	sub    esp,0x8
 1001257:	53                   	push   ebx
 1001258:	68 b6 76 00 01       	push   0x10076b6
 100125d:	e8 1d 13 00 00       	call   100257f <printk>
 1001262:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:38
#endif
    return (uint32_t)lTemp & 0xFFFFFFFF;
}
 1001265:	89 d8                	mov    eax,ebx
 1001267:	83 c4 08             	add    esp,0x8
 100126a:	5b                   	pop    ebx
 100126b:	c3                   	ret    

0100126c <kPagingGet4kPTEntryAddress>:
kPagingGet4kPTEntryAddress():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:41

uint32_t kPagingGet4kPTEntryAddress(uint32_t address)
{
 100126c:	53                   	push   ebx
 100126d:	83 ec 14             	sub    esp,0x14
 1001270:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:43
    address&=0xFFFFF000;
    uintptr_t pDirPtr=kPagingGet4kPDEntryValue(address) & 0xFFFFF000;
 1001274:	89 d8                	mov    eax,ebx
 1001276:	25 00 f0 ff ff       	and    eax,0xfffff000
 100127b:	50                   	push   eax
 100127c:	e8 7f ff ff ff       	call   1001200 <kPagingGet4kPDEntryValue>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:44
    return ((address & 0x3FF000) >> 12) << 2 | pDirPtr;
 1001281:	81 e3 00 f0 3f 00    	and    ebx,0x3ff000
 1001287:	c1 eb 0a             	shr    ebx,0xa
 100128a:	25 00 f0 ff ff       	and    eax,0xfffff000
 100128f:	09 d8                	or     eax,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:45
}
 1001291:	83 c4 18             	add    esp,0x18
 1001294:	5b                   	pop    ebx
 1001295:	c3                   	ret    

01001296 <kPagingGet4kPTEntryValue>:
kPagingGet4kPTEntryValue():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:48

uint32_t kPagingGet4kPTEntryValue(uint32_t address)
{
 1001296:	53                   	push   ebx
 1001297:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:50
    address&=0xFFFFF000;
    uint32_t* pTablePtr=(uint32_t*)kPagingGet4kPTEntryAddress(address);
 100129a:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 100129e:	25 00 f0 ff ff       	and    eax,0xfffff000
 10012a3:	50                   	push   eax
 10012a4:	e8 c3 ff ff ff       	call   100126c <kPagingGet4kPTEntryAddress>
 10012a9:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:52
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10012ab:	83 c4 10             	add    esp,0x10
 10012ae:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10012b5:	74 11                	je     10012c8 <kPagingGet4kPTEntryValue+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:53
             printk("pagingGet4kPTEntryValue: pageEntryAddress=0x%08X\n", pTablePtr);
 10012b7:	83 ec 08             	sub    esp,0x8
 10012ba:	50                   	push   eax
 10012bb:	68 34 7e 00 01       	push   0x1007e34
 10012c0:	e8 ba 12 00 00       	call   100257f <printk>
 10012c5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:56
             //printf("pageEntryValue=0x%08X\n", *pTablePtr);
#endif
    return *pTablePtr;
 10012c8:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:57
}
 10012ca:	83 c4 08             	add    esp,0x8
 10012cd:	5b                   	pop    ebx
 10012ce:	c3                   	ret    

010012cf <kPagingSetPageReadOnlyFlag>:
kPagingSetPageReadOnlyFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:60

void kPagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly)
{
 10012cf:	56                   	push   esi
 10012d0:	53                   	push   ebx
 10012d1:	83 ec 04             	sub    esp,0x4
 10012d4:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10012d8:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:62
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10012dc:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10012e3:	74 13                	je     10012f8 <kPagingSetPageReadOnlyFlag+0x29>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:63
            printk("pagingMakePageReadOnly: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 10012e5:	83 ec 04             	sub    esp,0x4
 10012e8:	ff 33                	push   DWORD PTR [ebx]
 10012ea:	53                   	push   ebx
 10012eb:	68 68 7e 00 01       	push   0x1007e68
 10012f0:	e8 8a 12 00 00       	call   100257f <printk>
 10012f5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:65
#endif
         if (readOnly)
 10012f8:	89 f0                	mov    eax,esi
 10012fa:	84 c0                	test   al,al
 10012fc:	74 05                	je     1001303 <kPagingSetPageReadOnlyFlag+0x34>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:66
            *ptEntry&=0xFFFFFFFD;
 10012fe:	83 23 fd             	and    DWORD PTR [ebx],0xfffffffd
 1001301:	eb 03                	jmp    1001306 <kPagingSetPageReadOnlyFlag+0x37>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:68
         else
            *ptEntry|=2; 
 1001303:	83 0b 02             	or     DWORD PTR [ebx],0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:69
    RELOAD_CR3
 1001306:	0f 20 d8             	mov    eax,cr3
 1001309:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:71
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 100130c:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001313:	74 12                	je     1001327 <kPagingSetPageReadOnlyFlag+0x58>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:72
            printk("0x%08X\n", *ptEntry);
 1001315:	83 ec 08             	sub    esp,0x8
 1001318:	ff 33                	push   DWORD PTR [ebx]
 100131a:	68 85 7a 00 01       	push   0x1007a85
 100131f:	e8 5b 12 00 00       	call   100257f <printk>
 1001324:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:74
#endif
}
 1001327:	83 c4 04             	add    esp,0x4
 100132a:	5b                   	pop    ebx
 100132b:	5e                   	pop    esi
 100132c:	c3                   	ret    

0100132d <kPagingUpdatePTEPresentFlag>:
kPagingUpdatePTEPresentFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:77

void kPagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present)
{
 100132d:	56                   	push   esi
 100132e:	53                   	push   ebx
 100132f:	83 ec 04             	sub    esp,0x4
 1001332:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1001336:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:78
         printd(DEBUG_PAGING,"pagingUpdatePTEPresentFlag: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 100133a:	ff 33                	push   DWORD PTR [ebx]
 100133c:	53                   	push   ebx
 100133d:	68 a0 7e 00 01       	push   0x1007ea0
 1001342:	6a 40                	push   0x40
 1001344:	e8 4e 12 00 00       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:79
         if (present)
 1001349:	83 c4 10             	add    esp,0x10
 100134c:	89 f0                	mov    eax,esi
 100134e:	84 c0                	test   al,al
 1001350:	74 05                	je     1001357 <kPagingUpdatePTEPresentFlag+0x2a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:80
             *ptEntry=*ptEntry | 1;
 1001352:	83 0b 01             	or     DWORD PTR [ebx],0x1
 1001355:	eb 03                	jmp    100135a <kPagingUpdatePTEPresentFlag+0x2d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:82
         else
             *ptEntry&=0xFFFFFFFE;
 1001357:	83 23 fe             	and    DWORD PTR [ebx],0xfffffffe
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:83
         __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
 100135a:	0f 20 d8             	mov    eax,cr3
 100135d:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:84
         printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 1001360:	83 ec 04             	sub    esp,0x4
 1001363:	ff 33                	push   DWORD PTR [ebx]
 1001365:	68 85 7a 00 01       	push   0x1007a85
 100136a:	6a 40                	push   0x40
 100136c:	e8 26 12 00 00       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:85
}
 1001371:	83 c4 14             	add    esp,0x14
 1001374:	5b                   	pop    ebx
 1001375:	5e                   	pop    esi
 1001376:	c3                   	ret    

01001377 <kSetVirtualRangeRO>:
kSetVirtualRangeRO():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:88

void kSetVirtualRangeRO(uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 1001377:	55                   	push   ebp
 1001378:	57                   	push   edi
 1001379:	56                   	push   esi
 100137a:	53                   	push   ebx
 100137b:	83 ec 1c             	sub    esp,0x1c
 100137e:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
 1001382:	8b 6c 24 34          	mov    ebp,DWORD PTR [esp+0x34]
 1001386:	8b 74 24 38          	mov    esi,DWORD PTR [esp+0x38]
 100138a:	89 f7                	mov    edi,esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:91
    uintptr_t* startPTE;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 100138c:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001393:	74 12                	je     10013a7 <kSetVirtualRangeRO+0x30>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:92
           printk("kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
 1001395:	83 ec 04             	sub    esp,0x4
 1001398:	55                   	push   ebp
 1001399:	53                   	push   ebx
 100139a:	68 dc 7e 00 01       	push   0x1007edc
 100139f:	e8 db 11 00 00       	call   100257f <printk>
 10013a4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:94 (discriminator 1)
#endif
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 10013a7:	83 c5 01             	add    ebp,0x1
 10013aa:	39 eb                	cmp    ebx,ebp
 10013ac:	77 5b                	ja     1001409 <kSetVirtualRangeRO+0x92>
 10013ae:	89 f0                	mov    eax,esi
 10013b0:	84 c0                	test   al,al
 10013b2:	b8 d1 76 00 01       	mov    eax,0x10076d1
 10013b7:	ba ce 76 00 01       	mov    edx,0x10076ce
 10013bc:	0f 45 c2             	cmovne eax,edx
 10013bf:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:101
        startPTE=(uintptr_t*)kPagingGet4kPTEntryAddress(cnt);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printk("0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
#endif
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 10013c3:	89 f8                	mov    eax,edi
 10013c5:	0f b6 f8             	movzx  edi,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:96
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
           printk("kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
#endif
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
    {
        startPTE=(uintptr_t*)kPagingGet4kPTEntryAddress(cnt);
 10013c8:	83 ec 0c             	sub    esp,0xc
 10013cb:	53                   	push   ebx
 10013cc:	e8 9b fe ff ff       	call   100126c <kPagingGet4kPTEntryAddress>
 10013d1:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:98
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10013d3:	83 c4 10             	add    esp,0x10
 10013d6:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10013dd:	74 13                	je     10013f2 <kSetVirtualRangeRO+0x7b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:99 (discriminator 4)
            printk("0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
 10013df:	ff 74 24 0c          	push   DWORD PTR [esp+0xc]
 10013e3:	50                   	push   eax
 10013e4:	53                   	push   ebx
 10013e5:	68 d4 76 00 01       	push   0x10076d4
 10013ea:	e8 90 11 00 00       	call   100257f <printk>
 10013ef:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:101 (discriminator 2)
#endif
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 10013f2:	83 ec 08             	sub    esp,0x8
 10013f5:	57                   	push   edi
 10013f6:	56                   	push   esi
 10013f7:	e8 d3 fe ff ff       	call   10012cf <kPagingSetPageReadOnlyFlag>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:94 (discriminator 2)
    uintptr_t* startPTE;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
           printk("kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
#endif
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 10013fc:	81 c3 00 10 00 00    	add    ebx,0x1000
 1001402:	83 c4 10             	add    esp,0x10
 1001405:	39 eb                	cmp    ebx,ebp
 1001407:	76 bf                	jbe    10013c8 <kSetVirtualRangeRO+0x51>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:105
#endif
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
            
    }
        //for cnt=0;cnt<=8192;cnt+=4096
}
 1001409:	83 c4 1c             	add    esp,0x1c
 100140c:	5b                   	pop    ebx
 100140d:	5e                   	pop    esi
 100140e:	5f                   	pop    edi
 100140f:	5d                   	pop    ebp
 1001410:	c3                   	ret    

01001411 <kpagingUpdatePresentFlagA>:
kpagingUpdatePresentFlagA():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:109

//Absolute version, page passed is already virtual
void kpagingUpdatePresentFlagA(uint32_t address, bool present)
{
 1001411:	56                   	push   esi
 1001412:	53                   	push   ebx
 1001413:	83 ec 04             	sub    esp,0x4
 1001416:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 100141a:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:111
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 100141e:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001425:	74 21                	je     1001448 <kpagingUpdatePresentFlagA+0x37>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:112
            printk("kpagingUpdatePresentFlagA: Make 0x%08X %s\n", address, present?"present":"not present");
 1001427:	84 db                	test   bl,bl
 1001429:	ba ec 76 00 01       	mov    edx,0x10076ec
 100142e:	b8 f0 76 00 01       	mov    eax,0x10076f0
 1001433:	0f 44 c2             	cmove  eax,edx
 1001436:	83 ec 04             	sub    esp,0x4
 1001439:	50                   	push   eax
 100143a:	56                   	push   esi
 100143b:	68 0c 7f 00 01       	push   0x1007f0c
 1001440:	e8 3a 11 00 00       	call   100257f <printk>
 1001445:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:114
#endif
        uintptr_t* pagePTE= (uintptr_t*)kPagingGet4kPTEntryAddress(address&0xFFFFF000);
 1001448:	83 ec 0c             	sub    esp,0xc
 100144b:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 1001451:	56                   	push   esi
 1001452:	e8 15 fe ff ff       	call   100126c <kPagingGet4kPTEntryAddress>
 1001457:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:116
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001459:	83 c4 10             	add    esp,0x10
 100145c:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001463:	74 11                	je     1001476 <kpagingUpdatePresentFlagA+0x65>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:117
            printk("kpagingUpdatePresentFlagA: updating entry 0x%08X\n", pagePTE);
 1001465:	83 ec 08             	sub    esp,0x8
 1001468:	50                   	push   eax
 1001469:	68 38 7f 00 01       	push   0x1007f38
 100146e:	e8 0c 11 00 00       	call   100257f <printk>
 1001473:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:119
#endif
        kPagingUpdatePTEPresentFlag(pagePTE, present);
 1001476:	83 ec 08             	sub    esp,0x8
 1001479:	0f b6 db             	movzx  ebx,bl
 100147c:	53                   	push   ebx
 100147d:	56                   	push   esi
 100147e:	e8 aa fe ff ff       	call   100132d <kPagingUpdatePTEPresentFlag>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:120
}
 1001483:	83 c4 14             	add    esp,0x14
 1001486:	5b                   	pop    ebx
 1001487:	5e                   	pop    esi
 1001488:	c3                   	ret    

01001489 <kpagingUpdatePresentFlagV>:
kpagingUpdatePresentFlagV():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:123

void kpagingUpdatePresentFlagV(uint32_t address, bool present)
{
 1001489:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:125
    address+=KERNEL_PAGED_BASE_ADDRESS; 
    kpagingUpdatePresentFlagA(address, present);
 100148c:	0f b6 44 24 1c       	movzx  eax,BYTE PTR [esp+0x1c]
 1001491:	50                   	push   eax
 1001492:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1001496:	2d 00 00 00 40       	sub    eax,0x40000000
 100149b:	50                   	push   eax
 100149c:	e8 70 ff ff ff       	call   1001411 <kpagingUpdatePresentFlagA>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:126
}
 10014a1:	83 c4 1c             	add    esp,0x1c
 10014a4:	c3                   	ret    

010014a5 <kMapPage>:
kMapPage():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:129

void kMapPage(uintptr_t mapTo, uintptr_t mapFrom, uint8_t flags)
{
 10014a5:	57                   	push   edi
 10014a6:	56                   	push   esi
 10014a7:	53                   	push   ebx
 10014a8:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
 10014ac:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:134
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)kKernelPageDir;
    ptrVal=ptr[(mapTo>>22)];
 10014b0:	89 cb                	mov    ebx,ecx
 10014b2:	c1 eb 16             	shr    ebx,0x16
 10014b5:	a1 a4 02 12 00       	mov    eax,ds:0x1202a4
 10014ba:	8d 1c 98             	lea    ebx,[eax+ebx*4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:135
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
 10014bd:	83 3b 00             	cmp    DWORD PTR [ebx],0x0
 10014c0:	75 6a                	jne    100152c <kMapPage+0x87>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:135 (discriminator 1)
 10014c2:	bf 00 00 00 00       	mov    edi,0x0
 10014c7:	3b 3d 4c 00 12 00    	cmp    edi,DWORD PTR ds:0x12004c
 10014cd:	72 08                	jb     10014d7 <kMapPage+0x32>
 10014cf:	3b 0d 48 00 12 00    	cmp    ecx,DWORD PTR ds:0x120048
 10014d5:	73 41                	jae    1001518 <kMapPage+0x73>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:138
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
 10014d7:	c7 03 63 00 00 20    	mov    DWORD PTR [ebx],0x20000063
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:139
        ptrT[(mapTo&0x003FFFFF/4096)]=mapFrom | flags;
 10014dd:	89 c8                	mov    eax,ecx
 10014df:	25 ff 03 00 00       	and    eax,0x3ff
 10014e4:	8d 34 85 00 00 00 20 	lea    esi,[eax*4+0x20000000]
 10014eb:	0f b6 d2             	movzx  edx,dl
 10014ee:	0b 54 24 14          	or     edx,DWORD PTR [esp+0x14]
 10014f2:	89 14 85 00 00 00 20 	mov    DWORD PTR [eax*4+0x20000000],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:141
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10014f9:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001500:	74 64                	je     1001566 <kMapPage+0xc1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:142
            printk("kMapPage: Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)],ptrT[(mapTo&0x003FFFFF/4096)]);
 1001502:	83 ec 0c             	sub    esp,0xc
 1001505:	52                   	push   edx
 1001506:	56                   	push   esi
 1001507:	53                   	push   ebx
 1001508:	51                   	push   ecx
 1001509:	68 6c 7f 00 01       	push   0x1007f6c
 100150e:	e8 6c 10 00 00       	call   100257f <printk>
 1001513:	83 c4 20             	add    esp,0x20
 1001516:	eb 4e                	jmp    1001566 <kMapPage+0xc1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:150
    else
    {
        //ptrVal right now points to the pdir entry
        ptr=(uint32_t*)kKernelPageDir;
        if (ptr[(mapTo>>22)]==0)
            ptr[mapTo>>22]=(KERNEL_PAGE_TABLE_BASE_ADDRESS + ((mapTo&0x003FFFFF)/4096)) | 0x63;
 1001518:	89 c8                	mov    eax,ecx
 100151a:	25 ff ff 3f 00       	and    eax,0x3fffff
 100151f:	c1 e8 0c             	shr    eax,0xc
 1001522:	05 00 b0 4b 00       	add    eax,0x4bb000
 1001527:	83 c8 63             	or     eax,0x63
 100152a:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:156
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=mapFrom | flags;
 100152c:	8b 33                	mov    esi,DWORD PTR [ebx]
 100152e:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 1001534:	89 c8                	mov    eax,ecx
 1001536:	c1 e8 0a             	shr    eax,0xa
 1001539:	25 fc 0f 00 00       	and    eax,0xffc
 100153e:	01 f0                	add    eax,esi
 1001540:	0f b6 d2             	movzx  edx,dl
 1001543:	0b 54 24 14          	or     edx,DWORD PTR [esp+0x14]
 1001547:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:160
//                printk("ptrT=%X(%X)\n",&ptrT[ptrVal],ptrT[ptrVal]);
//                STOPHERE2
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001549:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001550:	74 14                	je     1001566 <kMapPage+0xc1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:161
            printk("2) Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal],ptrT[ptrVal]);
 1001552:	83 ec 0c             	sub    esp,0xc
 1001555:	52                   	push   edx
 1001556:	50                   	push   eax
 1001557:	53                   	push   ebx
 1001558:	51                   	push   ecx
 1001559:	68 ac 7f 00 01       	push   0x1007fac
 100155e:	e8 1c 10 00 00       	call   100257f <printk>
 1001563:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:165
#endif
    }
//    if (ptrT[(src&0x003FFFFF/1000)]==0)
}
 1001566:	5b                   	pop    ebx
 1001567:	5e                   	pop    esi
 1001568:	5f                   	pop    edi
 1001569:	c3                   	ret    

0100156a <kIsPageMapped>:
kIsPageMapped():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:168

bool kIsPageMapped(uintptr_t Address)
{
 100156a:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:169
    if (!kPagingGet4kPTEntryValue(Address))
 100156d:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1001571:	e8 20 fd ff ff       	call   1001296 <kPagingGet4kPTEntryValue>
 1001576:	85 c0                	test   eax,eax
 1001578:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:172
        return false;
    return true;
}
 100157b:	83 c4 1c             	add    esp,0x1c
 100157e:	c3                   	ret    

0100157f <kUnMapPage>:
kUnMapPage():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:175

void kUnMapPage(uintptr_t mapTo)
{
 100157f:	57                   	push   edi
 1001580:	56                   	push   esi
 1001581:	83 ec 04             	sub    esp,0x4
 1001584:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:180
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)kKernelPageDir;
    ptrVal=ptr[(mapTo>>22)];
 1001588:	89 d1                	mov    ecx,edx
 100158a:	c1 e9 16             	shr    ecx,0x16
 100158d:	a1 a4 02 12 00       	mov    eax,ds:0x1202a4
 1001592:	8d 0c 88             	lea    ecx,[eax+ecx*4]
 1001595:	8b 01                	mov    eax,DWORD PTR [ecx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:181
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
 1001597:	85 c0                	test   eax,eax
 1001599:	75 4f                	jne    10015ea <kUnMapPage+0x6b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:181 (discriminator 1)
 100159b:	bf 00 00 00 00       	mov    edi,0x0
 10015a0:	3b 3d 4c 00 12 00    	cmp    edi,DWORD PTR ds:0x12004c
 10015a6:	72 08                	jb     10015b0 <kUnMapPage+0x31>
 10015a8:	3b 15 48 00 12 00    	cmp    edx,DWORD PTR ds:0x120048
 10015ae:	73 3a                	jae    10015ea <kUnMapPage+0x6b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:184
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
 10015b0:	c7 01 63 00 00 20    	mov    DWORD PTR [ecx],0x20000063
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:185
        ptrT[(mapTo&0x003FFFFF/4096)]=0;
 10015b6:	89 d0                	mov    eax,edx
 10015b8:	25 ff 03 00 00       	and    eax,0x3ff
 10015bd:	8d 34 85 00 00 00 20 	lea    esi,[eax*4+0x20000000]
 10015c4:	c7 04 85 00 00 00 20 	mov    DWORD PTR [eax*4+0x20000000],0x0
 10015cb:	00 00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:187
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10015cf:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10015d6:	74 44                	je     100161c <kUnMapPage+0x9d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:188
            printk("kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)]);
 10015d8:	56                   	push   esi
 10015d9:	51                   	push   ecx
 10015da:	52                   	push   edx
 10015db:	68 e8 7f 00 01       	push   0x1007fe8
 10015e0:	e8 9a 0f 00 00       	call   100257f <printk>
 10015e5:	83 c4 10             	add    esp,0x10
 10015e8:	eb 32                	jmp    100161c <kUnMapPage+0x9d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:200
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=0;
 10015ea:	25 00 f0 ff ff       	and    eax,0xfffff000
 10015ef:	89 c6                	mov    esi,eax
 10015f1:	89 d0                	mov    eax,edx
 10015f3:	c1 e8 0a             	shr    eax,0xa
 10015f6:	25 fc 0f 00 00       	and    eax,0xffc
 10015fb:	01 f0                	add    eax,esi
 10015fd:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:204
//                printk("ptrT=%X(%X)\n",&ptrT[ptrVal],ptrT[ptrVal]);
//                STOPHERE2
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001603:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100160a:	74 10                	je     100161c <kUnMapPage+0x9d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:205
            printk("2) Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal]);
 100160c:	50                   	push   eax
 100160d:	51                   	push   ecx
 100160e:	52                   	push   edx
 100160f:	68 20 80 00 01       	push   0x1008020
 1001614:	e8 66 0f 00 00       	call   100257f <printk>
 1001619:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:209
#endif
    }
//    if (ptrT[(src&0x003FFFFF/1000)]==0)
}
 100161c:	83 c4 04             	add    esp,0x4
 100161f:	5e                   	pop    esi
 1001620:	5f                   	pop    edi
 1001621:	c3                   	ret    

01001622 <kSetPhysicalRangeRO>:
kSetPhysicalRangeRO():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:212

void kSetPhysicalRangeRO(uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 1001622:	55                   	push   ebp
 1001623:	57                   	push   edi
 1001624:	56                   	push   esi
 1001625:	53                   	push   ebx
 1001626:	83 ec 0c             	sub    esp,0xc
 1001629:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 100162d:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
 1001631:	8b 5c 24 28          	mov    ebx,DWORD PTR [esp+0x28]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:214
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001635:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100163c:	74 22                	je     1001660 <kSetPhysicalRangeRO+0x3e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:215
            printk("kMakePhysicalRangeRO: Make 0x%08X(0x%08X)-0x%08X(0x%08X) r/o\n", startAddy, startAddy&0xFffff000, endAddy, endAddy&0xFFFFF000);
 100163e:	83 ec 0c             	sub    esp,0xc
 1001641:	89 f0                	mov    eax,esi
 1001643:	25 00 f0 ff ff       	and    eax,0xfffff000
 1001648:	50                   	push   eax
 1001649:	56                   	push   esi
 100164a:	89 e8                	mov    eax,ebp
 100164c:	25 00 f0 ff ff       	and    eax,0xfffff000
 1001651:	50                   	push   eax
 1001652:	55                   	push   ebp
 1001653:	68 50 80 00 01       	push   0x1008050
 1001658:	e8 22 0f 00 00       	call   100257f <printk>
 100165d:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:217
#endif
    kSetVirtualRangeRO((startAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, (endAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, readOnly);
 1001660:	83 ec 04             	sub    esp,0x4
 1001663:	0f b6 fb             	movzx  edi,bl
 1001666:	57                   	push   edi
 1001667:	81 ee 00 00 00 40    	sub    esi,0x40000000
 100166d:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 1001673:	56                   	push   esi
 1001674:	8d 9d 00 00 00 c0    	lea    ebx,[ebp-0x40000000]
 100167a:	81 e3 00 f0 ff ff    	and    ebx,0xfffff000
 1001680:	53                   	push   ebx
 1001681:	e8 f1 fc ff ff       	call   1001377 <kSetVirtualRangeRO>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:218
}
 1001686:	83 c4 1c             	add    esp,0x1c
 1001689:	5b                   	pop    ebx
 100168a:	5e                   	pop    esi
 100168b:	5f                   	pop    edi
 100168c:	5d                   	pop    ebp
 100168d:	c3                   	ret    

0100168e <mmKernelSetPageInUseFlag>:
mmKernelSetPageInUseFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:221

void mmKernelSetPageInUseFlag(uintptr_t address, bool inUse)
{
 100168e:	56                   	push   esi
 100168f:	53                   	push   ebx
 1001690:	83 ec 04             	sub    esp,0x4
 1001693:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1001697:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:224
    uintptr_t* ptEntry;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 100169b:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10016a2:	74 22                	je     10016c6 <mmKernelSetPageInUseFlag+0x38>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:225
           printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 10016a4:	89 f0                	mov    eax,esi
 10016a6:	84 c0                	test   al,al
 10016a8:	ba f8 76 00 01       	mov    edx,0x10076f8
 10016ad:	b8 fc 76 00 01       	mov    eax,0x10076fc
 10016b2:	0f 44 c2             	cmove  eax,edx
 10016b5:	50                   	push   eax
 10016b6:	53                   	push   ebx
 10016b7:	68 90 80 00 01       	push   0x1008090
 10016bc:	6a 40                	push   0x40
 10016be:	e8 d4 0e 00 00       	call   1002597 <printd>
 10016c3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:227
#endif
        ptEntry=(uintptr_t*)kPagingGet4kPTEntryAddress(address);
 10016c6:	83 ec 0c             	sub    esp,0xc
 10016c9:	53                   	push   ebx
 10016ca:	e8 9d fb ff ff       	call   100126c <kPagingGet4kPTEntryAddress>
 10016cf:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:228
        printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 10016d1:	ff 30                	push   DWORD PTR [eax]
 10016d3:	50                   	push   eax
 10016d4:	68 d4 80 00 01       	push   0x10080d4
 10016d9:	6a 40                	push   0x40
 10016db:	e8 b7 0e 00 00       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:229
        if (inUse)
 10016e0:	83 c4 20             	add    esp,0x20
 10016e3:	89 f0                	mov    eax,esi
 10016e5:	84 c0                	test   al,al
 10016e7:	74 08                	je     10016f1 <mmKernelSetPageInUseFlag+0x63>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:230
            *ptEntry|=PAGING_IN_USE_FLAG_MASK;
 10016e9:	81 0b 00 08 00 00    	or     DWORD PTR [ebx],0x800
 10016ef:	eb 06                	jmp    10016f7 <mmKernelSetPageInUseFlag+0x69>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:232
        else
            *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
 10016f1:	81 23 ff f7 ff ff    	and    DWORD PTR [ebx],0xfffff7ff
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:233
}
 10016f7:	83 c4 04             	add    esp,0x4
 10016fa:	5b                   	pop    ebx
 10016fb:	5e                   	pop    esi
 10016fc:	c3                   	ret    

010016fd <mmKernelSetPageRangeInUseFlag>:
mmKernelSetPageRangeInUseFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:236

void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
 10016fd:	55                   	push   ebp
 10016fe:	57                   	push   edi
 10016ff:	56                   	push   esi
 1001700:	53                   	push   ebx
 1001701:	83 ec 0c             	sub    esp,0xc
 1001704:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
 1001708:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
 100170c:	8b 6c 24 28          	mov    ebp,DWORD PTR [esp+0x28]
 1001710:	0f b6 44 24 2c       	movzx  eax,BYTE PTR [esp+0x2c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:237
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 1001715:	39 fb                	cmp    ebx,edi
 1001717:	73 16                	jae    100172f <mmKernelSetPageRangeInUseFlag+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:238 (discriminator 3)
        mmKernelSetPageInUseFlag(cnt,inUse);
 1001719:	0f b6 f0             	movzx  esi,al
 100171c:	83 ec 08             	sub    esp,0x8
 100171f:	56                   	push   esi
 1001720:	53                   	push   ebx
 1001721:	e8 68 ff ff ff       	call   100168e <mmKernelSetPageInUseFlag>
 1001726:	01 eb                	add    ebx,ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:237 (discriminator 3)
            *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
}

void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 1001728:	83 c4 10             	add    esp,0x10
 100172b:	39 fb                	cmp    ebx,edi
 100172d:	72 ed                	jb     100171c <mmKernelSetPageRangeInUseFlag+0x1f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:239
        mmKernelSetPageInUseFlag(cnt,inUse);
}
 100172f:	83 c4 0c             	add    esp,0xc
 1001732:	5b                   	pop    ebx
 1001733:	5e                   	pop    esi
 1001734:	5f                   	pop    edi
 1001735:	5d                   	pop    ebp
 1001736:	c3                   	ret    

01001737 <mmUnusePageRange>:
mmUnusePageRange():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:242

void mmUnusePageRange()
{
 1001737:	f3 c3                	repz ret 
 1001739:	66 90                	xchg   ax,ax
 100173b:	90                   	nop

0100173c <reverse>:
reverse():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:29
//#include <string.h>

/* reverse:  reverse string s in place */
extern int strlen(char*);
 void reverse(char s[])
 {
 100173c:	56                   	push   esi
 100173d:	53                   	push   ebx
 100173e:	83 ec 10             	sub    esp,0x10
 1001741:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:33
     int i, j;
     char c;

     for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
 1001745:	53                   	push   ebx
 1001746:	e8 e1 0e 00 00       	call   100262c <strlen>
 100174b:	83 e8 01             	sub    eax,0x1
 100174e:	83 c4 10             	add    esp,0x10
 1001751:	85 c0                	test   eax,eax
 1001753:	7e 1f                	jle    1001774 <reverse+0x38>
 1001755:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:34 (discriminator 3)
         c = s[i];
 100175a:	0f b6 34 13          	movzx  esi,BYTE PTR [ebx+edx*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:35 (discriminator 3)
         s[i] = s[j];
 100175e:	0f b6 0c 03          	movzx  ecx,BYTE PTR [ebx+eax*1]
 1001762:	88 0c 13             	mov    BYTE PTR [ebx+edx*1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:36 (discriminator 3)
         s[j] = c;
 1001765:	89 f1                	mov    ecx,esi
 1001767:	88 0c 03             	mov    BYTE PTR [ebx+eax*1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:33 (discriminator 3)
 void reverse(char s[])
 {
     int i, j;
     char c;

     for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
 100176a:	83 c2 01             	add    edx,0x1
 100176d:	83 e8 01             	sub    eax,0x1
 1001770:	39 c2                	cmp    edx,eax
 1001772:	7c e6                	jl     100175a <reverse+0x1e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:38
         c = s[i];
         s[i] = s[j];
         s[j] = c;
     }
 }
 1001774:	83 c4 04             	add    esp,0x4
 1001777:	5b                   	pop    ebx
 1001778:	5e                   	pop    esi
 1001779:	c3                   	ret    

0100177a <itoa>:
itoa():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:40
 void itoa(int n, char s[])
 {
 100177a:	55                   	push   ebp
 100177b:	57                   	push   edi
 100177c:	56                   	push   esi
 100177d:	53                   	push   ebx
 100177e:	83 ec 1c             	sub    esp,0x1c
 1001781:	8b 7c 24 34          	mov    edi,DWORD PTR [esp+0x34]
 1001785:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
 1001789:	c1 f8 1f             	sar    eax,0x1f
 100178c:	89 c1                	mov    ecx,eax
 100178e:	33 4c 24 30          	xor    ecx,DWORD PTR [esp+0x30]
 1001792:	29 c1                	sub    ecx,eax
 1001794:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:47

     if ((sign = n) < 0)  /* record sign */
         n = -n;          /* make n positive */
     i = 0;
     do {       /* generate digits in reverse order */
         s[i++] = n % 10 + '0';   /* get next digit */
 1001799:	bd 67 66 66 66       	mov    ebp,0x66666667
 100179e:	eb 02                	jmp    10017a2 <itoa+0x28>
 10017a0:	89 de                	mov    esi,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:47 (discriminator 1)
 10017a2:	8d 5e 01             	lea    ebx,[esi+0x1]
 10017a5:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
 10017a9:	89 c8                	mov    eax,ecx
 10017ab:	f7 ed                	imul   ebp
 10017ad:	c1 fa 02             	sar    edx,0x2
 10017b0:	89 c8                	mov    eax,ecx
 10017b2:	c1 f8 1f             	sar    eax,0x1f
 10017b5:	29 c2                	sub    edx,eax
 10017b7:	8d 04 92             	lea    eax,[edx+edx*4]
 10017ba:	01 c0                	add    eax,eax
 10017bc:	29 c1                	sub    ecx,eax
 10017be:	83 c1 30             	add    ecx,0x30
 10017c1:	88 4c 1f ff          	mov    BYTE PTR [edi+ebx*1-0x1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:48 (discriminator 1)
     } while ((n /= 10) > 0);     /* delete it */
 10017c5:	89 d1                	mov    ecx,edx
 10017c7:	85 d2                	test   edx,edx
 10017c9:	7f d5                	jg     10017a0 <itoa+0x26>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:49
     if (sign < 0)
 10017cb:	83 7c 24 30 00       	cmp    DWORD PTR [esp+0x30],0x0
 10017d0:	79 0b                	jns    10017dd <itoa+0x63>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:50
         s[i++] = '-';
 10017d2:	8d 5e 02             	lea    ebx,[esi+0x2]
 10017d5:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10017d9:	c6 04 07 2d          	mov    BYTE PTR [edi+eax*1],0x2d
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:51
     s[i] = '\0';
 10017dd:	c6 04 1f 00          	mov    BYTE PTR [edi+ebx*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:52
     reverse(s);
 10017e1:	83 ec 0c             	sub    esp,0xc
 10017e4:	57                   	push   edi
 10017e5:	e8 52 ff ff ff       	call   100173c <reverse>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:53
 }
 10017ea:	83 c4 2c             	add    esp,0x2c
 10017ed:	5b                   	pop    ebx
 10017ee:	5e                   	pop    esi
 10017ef:	5f                   	pop    edi
 10017f0:	5d                   	pop    ebp
 10017f1:	c3                   	ret    

010017f2 <itox>:
itox():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:55
void itox(unsigned int i, char *s)
{
 10017f2:	53                   	push   ebx
 10017f3:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 10017f7:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:58
    unsigned char n;

    s += 4;
 10017fb:	8d 43 04             	lea    eax,[ebx+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:59
    *s = '\0';
 10017fe:	c6 43 04 00          	mov    BYTE PTR [ebx+0x4],0x0
 1001802:	83 eb 04             	sub    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:62 (discriminator 3)

    for (n = 8; n != 0; --n) {
        *--s = "0123456789ABCDEF"[i & 0x0F];
 1001805:	83 e8 01             	sub    eax,0x1
 1001808:	89 d1                	mov    ecx,edx
 100180a:	83 e1 0f             	and    ecx,0xf
 100180d:	0f b6 89 03 77 00 01 	movzx  ecx,BYTE PTR [ecx+0x1007703]
 1001814:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:63 (discriminator 3)
        i >>= 4;
 1001816:	c1 ea 04             	shr    edx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:61 (discriminator 3)
    unsigned char n;

    s += 4;
    *s = '\0';

    for (n = 8; n != 0; --n) {
 1001819:	39 c3                	cmp    ebx,eax
 100181b:	75 e8                	jne    1001805 <itox+0x13>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:65
        *--s = "0123456789ABCDEF"[i & 0x0F];
        i >>= 4;
    }
}
 100181d:	5b                   	pop    ebx
 100181e:	c3                   	ret    

0100181f <atoi>:
atoi():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:68
// A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
int atoi(char *str)
{
 100181f:	8b 4c 24 04          	mov    ecx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:73
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
 1001823:	0f b6 11             	movzx  edx,BYTE PTR [ecx]
 1001826:	84 d2                	test   dl,dl
 1001828:	74 1f                	je     1001849 <atoi+0x2a>
 100182a:	83 c1 01             	add    ecx,0x1
 100182d:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:74 (discriminator 3)
        res = res*10 + str[i] - '0';
 1001832:	8d 04 80             	lea    eax,[eax+eax*4]
 1001835:	0f be d2             	movsx  edx,dl
 1001838:	8d 44 42 d0          	lea    eax,[edx+eax*2-0x30]
 100183c:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:73 (discriminator 3)
{
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
 100183f:	0f b6 51 ff          	movzx  edx,BYTE PTR [ecx-0x1]
 1001843:	84 d2                	test   dl,dl
 1001845:	75 eb                	jne    1001832 <atoi+0x13>
 1001847:	f3 c3                	repz ret 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:69
    }
}
// A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
int atoi(char *str)
{
    int res = 0; // Initialize result
 1001849:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:78
    for (int i = 0; str[i] != '\0'; ++i)
        res = res*10 + str[i] - '0';
  
    // return result.
    return res;
}
 100184e:	c3                   	ret    

0100184f <convert>:
convert():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:81

int convert(int s)
{
 100184f:	83 ec 10             	sub    esp,0x10
 1001852:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:83
  int c;
  char hex[] = {'A', 'B', 'C', 'D', 'E', 'F'};
 1001856:	c6 44 24 0a 41       	mov    BYTE PTR [esp+0xa],0x41
 100185b:	c6 44 24 0b 42       	mov    BYTE PTR [esp+0xb],0x42
 1001860:	c6 44 24 0c 43       	mov    BYTE PTR [esp+0xc],0x43
 1001865:	c6 44 24 0d 44       	mov    BYTE PTR [esp+0xd],0x44
 100186a:	c6 44 24 0e 45       	mov    BYTE PTR [esp+0xe],0x45
 100186f:	c6 44 24 0f 46       	mov    BYTE PTR [esp+0xf],0x46
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:84
  c = (s >= 0 && s < 9) ? s + '0' : hex[s - 10];
 1001874:	83 f8 08             	cmp    eax,0x8
 1001877:	77 05                	ja     100187e <convert+0x2f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:84 (discriminator 1)
 1001879:	83 c0 30             	add    eax,0x30
 100187c:	eb 04                	jmp    1001882 <convert+0x33>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:84 (discriminator 2)
 100187e:	0f be 04 04          	movsx  eax,BYTE PTR [esp+eax*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:86 (discriminator 4)
  return c;
}
 1001882:	83 c4 10             	add    esp,0x10
 1001885:	c3                   	ret    

01001886 <itoha>:
itoha():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:89

void itoha(unsigned int n, char *buf)
{
 1001886:	55                   	push   ebp
 1001887:	57                   	push   edi
 1001888:	56                   	push   esi
 1001889:	53                   	push   ebx
 100188a:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 100188e:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:92
  int i = 0, j =0;
  j=7;
  while(n != 0)
 1001892:	85 db                	test   ebx,ebx
 1001894:	74 25                	je     10018bb <itoha+0x35>
 1001896:	be 07 00 00 00       	mov    esi,0x7
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:94
  {
    i = n % 16;
 100189b:	89 dd                	mov    ebp,ebx
 100189d:	83 e5 0f             	and    ebp,0xf
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:95
      buf[j--] = convert(i);
 10018a0:	83 ee 01             	sub    esi,0x1
 10018a3:	55                   	push   ebp
 10018a4:	e8 a6 ff ff ff       	call   100184f <convert>
 10018a9:	83 c4 04             	add    esp,0x4
 10018ac:	88 44 37 01          	mov    BYTE PTR [edi+esi*1+0x1],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:96
      n = (n - i) / 16;
 10018b0:	29 eb                	sub    ebx,ebp
 10018b2:	c1 eb 04             	shr    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:92

void itoha(unsigned int n, char *buf)
{
  int i = 0, j =0;
  j=7;
  while(n != 0)
 10018b5:	85 db                	test   ebx,ebx
 10018b7:	75 e2                	jne    100189b <itoha+0x15>
 10018b9:	eb 05                	jmp    10018c0 <itoha+0x3a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:91
}

void itoha(unsigned int n, char *buf)
{
  int i = 0, j =0;
  j=7;
 10018bb:	be 07 00 00 00       	mov    esi,0x7
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:98
  {
    i = n % 16;
      buf[j--] = convert(i);
      n = (n - i) / 16;
  }
  buf[j] = '\0';
 10018c0:	c6 04 37 00          	mov    BYTE PTR [edi+esi*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:99
}
 10018c4:	5b                   	pop    ebx
 10018c5:	5e                   	pop    esi
 10018c6:	5f                   	pop    edi
 10018c7:	5d                   	pop    ebp
 10018c8:	c3                   	ret    

010018c9 <identify_data_sizes>:
identify_data_sizes():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:102

void identify_data_sizes(sizeof_t* sizes)
{
 10018c9:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:103
    sizes->shortSize = sizeof(short);
 10018cd:	66 c7 00 02 00       	mov    WORD PTR [eax],0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:104
    sizes->intSize = sizeof(int);
 10018d2:	66 c7 40 02 04 00    	mov    WORD PTR [eax+0x2],0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:105
    sizes->longSize = sizeof(long);
 10018d8:	66 c7 40 04 04 00    	mov    WORD PTR [eax+0x4],0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:106
    sizes->longLongSize = sizeof(long long);
 10018de:	66 c7 40 06 08 00    	mov    WORD PTR [eax+0x6],0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:107
    sizes->longLongIntSize = sizeof(long long int);
 10018e4:	66 c7 40 08 08 00    	mov    WORD PTR [eax+0x8],0x8
 10018ea:	c3                   	ret    

010018eb <memset>:
memset():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:111
}

void *memset(void *d1, int val, size_t len)
{
 10018eb:	56                   	push   esi
 10018ec:	53                   	push   ebx
 10018ed:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10018f1:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 10018f5:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:114
    uint8_t *d = d1;
    uint16_t*e = d1;
    uint16_t eVal=(val << 16) | (val << 8) | val;
 10018f9:	89 f1                	mov    ecx,esi
 10018fb:	c1 e1 08             	shl    ecx,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:118
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
 10018fe:	f6 c2 03             	test   dl,0x3
 1001901:	75 16                	jne    1001919 <memset+0x2e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:119
    while (len-=4) {
 1001903:	83 ea 04             	sub    edx,0x4
 1001906:	74 43                	je     100194b <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:120
        *d++ = fVal;
 1001908:	89 f3                	mov    ebx,esi
 100190a:	89 c1                	mov    ecx,eax
 100190c:	83 c1 01             	add    ecx,0x1
 100190f:	88 59 ff             	mov    BYTE PTR [ecx-0x1],bl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:119
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
 1001912:	83 ea 04             	sub    edx,0x4
 1001915:	75 f5                	jne    100190c <memset+0x21>
 1001917:	eb 32                	jmp    100194b <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:122
        *d++ = fVal;
    }
    else if (((len%2)==0))
 1001919:	f6 c2 01             	test   dl,0x1
 100191c:	74 0b                	je     1001929 <memset+0x3e>
 100191e:	8d 1c 10             	lea    ebx,[eax+edx*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:127
    while (len-=2) {
        *d++ = eVal;
    }
    else
    while (len--) {
 1001921:	89 c1                	mov    ecx,eax
 1001923:	85 d2                	test   edx,edx
 1001925:	75 18                	jne    100193f <memset+0x54>
 1001927:	eb 22                	jmp    100194b <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:123
    if ((len%4)==0)
    while (len-=4) {
        *d++ = fVal;
    }
    else if (((len%2)==0))
    while (len-=2) {
 1001929:	83 ea 02             	sub    edx,0x2
 100192c:	74 1d                	je     100194b <memset+0x60>
 100192e:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:124
        *d++ = eVal;
 1001930:	09 f1                	or     ecx,esi
 1001932:	83 c3 01             	add    ebx,0x1
 1001935:	88 4b ff             	mov    BYTE PTR [ebx-0x1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:123
    if ((len%4)==0)
    while (len-=4) {
        *d++ = fVal;
    }
    else if (((len%2)==0))
    while (len-=2) {
 1001938:	83 ea 02             	sub    edx,0x2
 100193b:	75 f5                	jne    1001932 <memset+0x47>
 100193d:	eb 0c                	jmp    100194b <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:128
        *d++ = eVal;
    }
    else
    while (len--) {
        *d++ = val;
 100193f:	83 c1 01             	add    ecx,0x1
 1001942:	89 f2                	mov    edx,esi
 1001944:	88 51 ff             	mov    BYTE PTR [ecx-0x1],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:127
    else if (((len%2)==0))
    while (len-=2) {
        *d++ = eVal;
    }
    else
    while (len--) {
 1001947:	39 cb                	cmp    ebx,ecx
 1001949:	75 f4                	jne    100193f <memset+0x54>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:131
        *d++ = val;
    }
    return d1;
}
 100194b:	5b                   	pop    ebx
 100194c:	5e                   	pop    esi
 100194d:	c3                   	ret    

0100194e <bcdToDec>:
bcdToDec():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:134

uint8_t bcdToDec(uint8_t val)
{
 100194e:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:135
  return ( (val/16*10) + (val%16) );
 1001952:	89 c2                	mov    edx,eax
 1001954:	c0 ea 04             	shr    dl,0x4
 1001957:	8d 14 92             	lea    edx,[edx+edx*4]
 100195a:	83 e0 0f             	and    eax,0xf
 100195d:	8d 04 50             	lea    eax,[eax+edx*2]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:136
}
 1001960:	c3                   	ret    

01001961 <decToBcd>:
decToBcd():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:139

uint8_t decToBcd(uint8_t val)
{
 1001961:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:140
  return ( (val/10*16) + (val%10) );
 1001965:	0f b6 c8             	movzx  ecx,al
 1001968:	8d 14 89             	lea    edx,[ecx+ecx*4]
 100196b:	8d 14 d1             	lea    edx,[ecx+edx*8]
 100196e:	8d 14 92             	lea    edx,[edx+edx*4]
 1001971:	66 c1 ea 0b          	shr    dx,0xb
 1001975:	89 d1                	mov    ecx,edx
 1001977:	c1 e1 04             	shl    ecx,0x4
 100197a:	8d 14 92             	lea    edx,[edx+edx*4]
 100197d:	01 d2                	add    edx,edx
 100197f:	29 d0                	sub    eax,edx
 1001981:	01 c8                	add    eax,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:141
}
 1001983:	c3                   	ret    

01001984 <initSystemDate>:
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:143
void initSystemDate()
{
 1001984:	83 ec 3c             	sub    esp,0x3c
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001987:	b8 00 00 00 00       	mov    eax,0x0
 100198c:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100198e:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:147
    struct tm tmbuf;

    outb(0x70, 0x00);
    tmbuf.tm_sec = bcdToDec(inb(0x71));
 1001990:	0f b6 c0             	movzx  eax,al
 1001993:	50                   	push   eax
 1001994:	e8 b5 ff ff ff       	call   100194e <bcdToDec>
 1001999:	0f b6 c0             	movzx  eax,al
 100199c:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10019a0:	b8 02 00 00 00       	mov    eax,0x2
 10019a5:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019a7:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:149
    outb(0x70, 0x02);
    tmbuf.tm_min = bcdToDec(inb(0x71));
 10019a9:	0f b6 c0             	movzx  eax,al
 10019ac:	89 04 24             	mov    DWORD PTR [esp],eax
 10019af:	e8 9a ff ff ff       	call   100194e <bcdToDec>
 10019b4:	0f b6 c0             	movzx  eax,al
 10019b7:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10019bb:	b8 04 00 00 00       	mov    eax,0x4
 10019c0:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019c2:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:151
    outb(0x70, 0x04);
    tmbuf.tm_hour = bcdToDec(inb(0x71));
 10019c4:	0f b6 c0             	movzx  eax,al
 10019c7:	89 04 24             	mov    DWORD PTR [esp],eax
 10019ca:	e8 7f ff ff ff       	call   100194e <bcdToDec>
 10019cf:	0f b6 c0             	movzx  eax,al
 10019d2:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10019d6:	b8 07 00 00 00       	mov    eax,0x7
 10019db:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019dd:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:153
    outb(0x70, 0x07);
    tmbuf.tm_mday = bcdToDec(inb(0x71));
 10019df:	0f b6 c0             	movzx  eax,al
 10019e2:	89 04 24             	mov    DWORD PTR [esp],eax
 10019e5:	e8 64 ff ff ff       	call   100194e <bcdToDec>
 10019ea:	0f b6 c0             	movzx  eax,al
 10019ed:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10019f1:	b8 08 00 00 00       	mov    eax,0x8
 10019f6:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019f8:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:155
    outb(0x70, 0x08);
    tmbuf.tm_mon = bcdToDec(inb(0x71));
 10019fa:	0f b6 c0             	movzx  eax,al
 10019fd:	89 04 24             	mov    DWORD PTR [esp],eax
 1001a00:	e8 49 ff ff ff       	call   100194e <bcdToDec>
 1001a05:	0f b6 c0             	movzx  eax,al
 1001a08:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001a0c:	b8 09 00 00 00       	mov    eax,0x9
 1001a11:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1001a13:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:157
    outb(0x70, 0x09);
    tmbuf.tm_year = bcdToDec(inb(0x71));
 1001a15:	0f b6 c0             	movzx  eax,al
 1001a18:	89 04 24             	mov    DWORD PTR [esp],eax
 1001a1b:	e8 2e ff ff ff       	call   100194e <bcdToDec>
 1001a20:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:158
    tmbuf.tm_isdst = -1;
 1001a23:	c7 44 24 30 ff ff ff 	mov    DWORD PTR [esp+0x30],0xffffffff
 1001a2a:	ff 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:160
    tmbuf.tm_year += 2000;
    tmbuf.tm_year = tmbuf.tm_year - 1900;
 1001a2b:	0f b6 c0             	movzx  eax,al
 1001a2e:	83 c0 64             	add    eax,0x64
 1001a31:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:161
    kSystemStartTime = mktime(&tmbuf);
 1001a35:	8d 44 24 10          	lea    eax,[esp+0x10]
 1001a39:	50                   	push   eax
 1001a3a:	e8 ab 0f 00 00       	call   10029ea <mktime>
 1001a3f:	a3 88 02 12 00       	mov    ds:0x120288,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:162
    kSystemCurrentTime = kSystemStartTime;
 1001a44:	a3 8c 02 12 00       	mov    ds:0x12028c,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:164
//printf("System Date = %d/%d/%d %d:%d:%d\n", tmbuf.tm_mon, tmbuf.tm_mday, tmbuf.tm_year, tmbuf.tm_hour, tmbuf.tm_min, tmbuf.tm_sec, tmbuf.tm_hour, tmbuf.tm_min, tmbuf.tm_sec);
}
 1001a49:	83 c4 4c             	add    esp,0x4c
 1001a4c:	c3                   	ret    

01001a4d <strtoupper>:
strtoupper():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:166
char * strtoupper(char* pointerToString)
{
 1001a4d:	56                   	push   esi
 1001a4e:	53                   	push   ebx
 1001a4f:	83 ec 10             	sub    esp,0x10
 1001a52:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:167
    uint8_t start=0, length=strlen(pointerToString);
 1001a56:	53                   	push   ebx
 1001a57:	e8 d0 0b 00 00       	call   100262c <strlen>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:171
    char* myPtr=pointerToString;
    
        // Trim.Start:
        while (start<length)
 1001a5c:	83 c4 10             	add    esp,0x10
 1001a5f:	84 c0                	test   al,al
 1001a61:	74 23                	je     1001a86 <strtoupper+0x39>
 1001a63:	89 da                	mov    edx,ebx
 1001a65:	83 e8 01             	sub    eax,0x1
 1001a68:	0f b6 c0             	movzx  eax,al
 1001a6b:	8d 74 03 01          	lea    esi,[ebx+eax*1+0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:173
        {
            if (myPtr[start]>='a' && myPtr[start]<='z')
 1001a6f:	0f b6 02             	movzx  eax,BYTE PTR [edx]
 1001a72:	8d 48 9f             	lea    ecx,[eax-0x61]
 1001a75:	80 f9 19             	cmp    cl,0x19
 1001a78:	77 05                	ja     1001a7f <strtoupper+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:174
                myPtr[start]-=32;
 1001a7a:	83 e8 20             	sub    eax,0x20
 1001a7d:	88 02                	mov    BYTE PTR [edx],al
 1001a7f:	83 c2 01             	add    edx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:171
{
    uint8_t start=0, length=strlen(pointerToString);
    char* myPtr=pointerToString;
    
        // Trim.Start:
        while (start<length)
 1001a82:	39 f2                	cmp    edx,esi
 1001a84:	75 e9                	jne    1001a6f <strtoupper+0x22>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:179
                myPtr[start]-=32;
            start++;
        }

    return pointerToString;
}
 1001a86:	89 d8                	mov    eax,ebx
 1001a88:	83 c4 04             	add    esp,0x4
 1001a8b:	5b                   	pop    ebx
 1001a8c:	5e                   	pop    esi
 1001a8d:	c3                   	ret    

01001a8e <printDumpedRegs>:
printDumpedRegs():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:182

void printDumpedRegs()
{
 1001a8e:	57                   	push   edi
 1001a8f:	56                   	push   esi
 1001a90:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:183
    uint32_t esp = exceptionSavedESP;
 1001a91:	8b 35 ec 01 12 00    	mov    esi,DWORD PTR ds:0x1201ec
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:187
    uint8_t* lCSIPPtr;

    
    lCSIPPtr=(uint8_t*)(exceptionEIP);
 1001a97:	8b 1d f8 01 12 00    	mov    ebx,DWORD PTR ds:0x1201f8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:188
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", exceptionAX, exceptionBX, exceptionCX, exceptionDX,exceptionFlags);
 1001a9d:	83 ec 08             	sub    esp,0x8
 1001aa0:	ff 35 f0 01 12 00    	push   DWORD PTR ds:0x1201f0
 1001aa6:	ff 35 bc 01 12 00    	push   DWORD PTR ds:0x1201bc
 1001aac:	ff 35 b8 01 12 00    	push   DWORD PTR ds:0x1201b8
 1001ab2:	ff 35 b4 01 12 00    	push   DWORD PTR ds:0x1201b4
 1001ab8:	ff 35 b0 01 12 00    	push   DWORD PTR ds:0x1201b0
 1001abe:	68 14 81 00 01       	push   0x1008114
 1001ac3:	e8 b7 0a 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:189
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", exceptionBP, exceptionSI, exceptionDI, exceptionSavedESP);
 1001ac8:	83 c4 14             	add    esp,0x14
 1001acb:	ff 35 ec 01 12 00    	push   DWORD PTR ds:0x1201ec
 1001ad1:	ff 35 c4 01 12 00    	push   DWORD PTR ds:0x1201c4
 1001ad7:	ff 35 c0 01 12 00    	push   DWORD PTR ds:0x1201c0
 1001add:	ff 35 c8 01 12 00    	push   DWORD PTR ds:0x1201c8
 1001ae3:	68 44 81 00 01       	push   0x1008144
 1001ae8:	e8 92 0a 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:190
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
 1001aed:	83 c4 14             	add    esp,0x14
 1001af0:	ff 35 d4 01 12 00    	push   DWORD PTR ds:0x1201d4
 1001af6:	ff 35 d0 01 12 00    	push   DWORD PTR ds:0x1201d0
 1001afc:	ff 35 00 02 12 00    	push   DWORD PTR ds:0x120200
 1001b02:	ff 35 cc 01 12 00    	push   DWORD PTR ds:0x1201cc
 1001b08:	68 6c 81 00 01       	push   0x100816c
 1001b0d:	e8 6d 0a 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:191
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionGS, exceptionFS);
 1001b12:	83 c4 14             	add    esp,0x14
 1001b15:	ff 35 e0 01 12 00    	push   DWORD PTR ds:0x1201e0
 1001b1b:	ff 35 e4 01 12 00    	push   DWORD PTR ds:0x1201e4
 1001b21:	ff 35 dc 01 12 00    	push   DWORD PTR ds:0x1201dc
 1001b27:	ff 35 d8 01 12 00    	push   DWORD PTR ds:0x1201d8
 1001b2d:	68 94 81 00 01       	push   0x1008194
 1001b32:	e8 48 0a 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:192
    printk("GDT=%08X\n",kernelGDT.base);
 1001b37:	83 c4 18             	add    esp,0x18
 1001b3a:	ff 35 4e 04 12 00    	push   DWORD PTR ds:0x12044e
 1001b40:	68 14 77 00 01       	push   0x1007714
 1001b45:	e8 35 0a 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:193
    printk("CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
 1001b4a:	ff 35 f4 01 12 00    	push   DWORD PTR ds:0x1201f4
 1001b50:	ff 35 f8 01 12 00    	push   DWORD PTR ds:0x1201f8
 1001b56:	ff 35 fc 01 12 00    	push   DWORD PTR ds:0x1201fc
 1001b5c:	68 bc 81 00 01       	push   0x10081bc
 1001b61:	e8 19 0a 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:194
          printk("Bytes at CS:EIP: ");
 1001b66:	83 c4 14             	add    esp,0x14
 1001b69:	68 1e 77 00 01       	push   0x100771e
 1001b6e:	e8 0c 0a 00 00       	call   100257f <printk>
 1001b73:	8d 7b 13             	lea    edi,[ebx+0x13]
 1001b76:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:196 (discriminator 3)
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
 1001b79:	83 ec 08             	sub    esp,0x8
 1001b7c:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001b7f:	50                   	push   eax
 1001b80:	68 b0 76 00 01       	push   0x10076b0
 1001b85:	e8 f5 09 00 00       	call   100257f <printk>
 1001b8a:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:195 (discriminator 3)
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionGS, exceptionFS);
    printk("GDT=%08X\n",kernelGDT.base);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
 1001b8d:	83 c4 10             	add    esp,0x10
 1001b90:	39 df                	cmp    edi,ebx
 1001b92:	75 e5                	jne    1001b79 <printDumpedRegs+0xeb>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:197
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
 1001b94:	83 ec 0c             	sub    esp,0xc
 1001b97:	68 5e 7a 00 01       	push   0x1007a5e
 1001b9c:	e8 de 09 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:198
          printk ("Stack @ 0x%08x:0x%08X:\n",exceptionSS, esp);
 1001ba1:	83 c4 0c             	add    esp,0xc
 1001ba4:	56                   	push   esi
 1001ba5:	ff 35 e8 01 12 00    	push   DWORD PTR ds:0x1201e8
 1001bab:	68 30 77 00 01       	push   0x1007730
 1001bb0:	e8 ca 09 00 00       	call   100257f <printk>
 1001bb5:	83 c4 10             	add    esp,0x10
 1001bb8:	bb 00 00 00 00       	mov    ebx,0x0
 1001bbd:	8d 04 33             	lea    eax,[ebx+esi*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:201 (discriminator 3)
          for (int cnt=0;cnt<10;cnt++)
          {
              printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
 1001bc0:	83 ec 04             	sub    esp,0x4
 1001bc3:	8b 15 a8 01 12 00    	mov    edx,DWORD PTR ds:0x1201a8
 1001bc9:	ff 34 1a             	push   DWORD PTR [edx+ebx*1]
 1001bcc:	50                   	push   eax
 1001bcd:	68 48 77 00 01       	push   0x1007748
 1001bd2:	e8 a8 09 00 00       	call   100257f <printk>
 1001bd7:	83 c3 04             	add    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:199 (discriminator 3)
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
          printk ("Stack @ 0x%08x:0x%08X:\n",exceptionSS, esp);
          for (int cnt=0;cnt<10;cnt++)
 1001bda:	83 c4 10             	add    esp,0x10
 1001bdd:	83 fb 28             	cmp    ebx,0x28
 1001be0:	75 db                	jne    1001bbd <printDumpedRegs+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:206
              printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
              esp+=4;
          }


}
 1001be2:	5b                   	pop    ebx
 1001be3:	5e                   	pop    esi
 1001be4:	5f                   	pop    edi
 1001be5:	c3                   	ret    

01001be6 <printDebugRegs>:
printDebugRegs():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:209

void printDebugRegs()
{
 1001be6:	57                   	push   edi
 1001be7:	56                   	push   esi
 1001be8:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:210
    uint32_t esp = debugSavedESP;
 1001be9:	8b 35 40 02 12 00    	mov    esi,DWORD PTR ds:0x120240
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:213
    uint8_t* lCSIPPtr;

    lCSIPPtr=(uint8_t*)(debugEIP);
 1001bef:	8b 1d 50 02 12 00    	mov    ebx,DWORD PTR ds:0x120250
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:214
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", debugAX, debugBX, debugCX, debugDX,debugFlags);
 1001bf5:	83 ec 08             	sub    esp,0x8
 1001bf8:	ff 35 44 02 12 00    	push   DWORD PTR ds:0x120244
 1001bfe:	ff 35 10 02 12 00    	push   DWORD PTR ds:0x120210
 1001c04:	ff 35 0c 02 12 00    	push   DWORD PTR ds:0x12020c
 1001c0a:	ff 35 08 02 12 00    	push   DWORD PTR ds:0x120208
 1001c10:	ff 35 04 02 12 00    	push   DWORD PTR ds:0x120204
 1001c16:	68 14 81 00 01       	push   0x1008114
 1001c1b:	e8 5f 09 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:215
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", debugBP, debugSI, debugDI, debugSavedESP);
 1001c20:	83 c4 14             	add    esp,0x14
 1001c23:	ff 35 40 02 12 00    	push   DWORD PTR ds:0x120240
 1001c29:	ff 35 18 02 12 00    	push   DWORD PTR ds:0x120218
 1001c2f:	ff 35 14 02 12 00    	push   DWORD PTR ds:0x120214
 1001c35:	ff 35 1c 02 12 00    	push   DWORD PTR ds:0x12021c
 1001c3b:	68 44 81 00 01       	push   0x1008144
 1001c40:	e8 3a 09 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:216
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\n", debugCR0, debugCR3, debugCR4);
 1001c45:	83 c4 20             	add    esp,0x20
 1001c48:	ff 35 28 02 12 00    	push   DWORD PTR ds:0x120228
 1001c4e:	ff 35 24 02 12 00    	push   DWORD PTR ds:0x120224
 1001c54:	ff 35 20 02 12 00    	push   DWORD PTR ds:0x120220
 1001c5a:	68 5a 77 00 01       	push   0x100775a
 1001c5f:	e8 1b 09 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:217
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", debugDS, debugES, debugGS, debugFS);
 1001c64:	83 c4 04             	add    esp,0x4
 1001c67:	ff 35 34 02 12 00    	push   DWORD PTR ds:0x120234
 1001c6d:	ff 35 38 02 12 00    	push   DWORD PTR ds:0x120238
 1001c73:	ff 35 30 02 12 00    	push   DWORD PTR ds:0x120230
 1001c79:	ff 35 2c 02 12 00    	push   DWORD PTR ds:0x12022c
 1001c7f:	68 94 81 00 01       	push   0x1008194
 1001c84:	e8 f6 08 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:218
    printk("CS:EIP = %04X:%08X, error code=%08X\n", debugCS, debugEIP, debugErrorCode);
 1001c89:	83 c4 20             	add    esp,0x20
 1001c8c:	ff 35 48 02 12 00    	push   DWORD PTR ds:0x120248
 1001c92:	ff 35 50 02 12 00    	push   DWORD PTR ds:0x120250
 1001c98:	ff 35 4c 02 12 00    	push   DWORD PTR ds:0x12024c
 1001c9e:	68 bc 81 00 01       	push   0x10081bc
 1001ca3:	e8 d7 08 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:219
          printk("Bytes at CS:EIP: ");
 1001ca8:	c7 04 24 1e 77 00 01 	mov    DWORD PTR [esp],0x100771e
 1001caf:	e8 cb 08 00 00       	call   100257f <printk>
 1001cb4:	8d 7b 13             	lea    edi,[ebx+0x13]
 1001cb7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:221 (discriminator 3)
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
 1001cba:	83 ec 08             	sub    esp,0x8
 1001cbd:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001cc0:	50                   	push   eax
 1001cc1:	68 b0 76 00 01       	push   0x10076b0
 1001cc6:	e8 b4 08 00 00       	call   100257f <printk>
 1001ccb:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:220 (discriminator 3)
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", debugBP, debugSI, debugDI, debugSavedESP);
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\n", debugCR0, debugCR3, debugCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", debugDS, debugES, debugGS, debugFS);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", debugCS, debugEIP, debugErrorCode);
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
 1001cce:	83 c4 10             	add    esp,0x10
 1001cd1:	39 df                	cmp    edi,ebx
 1001cd3:	75 e5                	jne    1001cba <printDebugRegs+0xd4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:222
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
 1001cd5:	83 ec 0c             	sub    esp,0xc
 1001cd8:	68 5e 7a 00 01       	push   0x1007a5e
 1001cdd:	e8 9d 08 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:223
          printk ("Stack @ 0x%08x:0x%08X:\n",debugSS, esp);
 1001ce2:	83 c4 0c             	add    esp,0xc
 1001ce5:	56                   	push   esi
 1001ce6:	ff 35 3c 02 12 00    	push   DWORD PTR ds:0x12023c
 1001cec:	68 30 77 00 01       	push   0x1007730
 1001cf1:	e8 89 08 00 00       	call   100257f <printk>
 1001cf6:	83 c4 10             	add    esp,0x10
 1001cf9:	bb 00 00 00 00       	mov    ebx,0x0
 1001cfe:	8d 04 33             	lea    eax,[ebx+esi*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:226 (discriminator 3)
          for (int cnt=0;cnt<10;cnt++)
          {
              printk("\t0x%08X%: 0x%08X\n",esp, debugSavedStack[cnt]);
 1001d01:	83 ec 04             	sub    esp,0x4
 1001d04:	8b 15 ac 01 12 00    	mov    edx,DWORD PTR ds:0x1201ac
 1001d0a:	ff 34 1a             	push   DWORD PTR [edx+ebx*1]
 1001d0d:	50                   	push   eax
 1001d0e:	68 48 77 00 01       	push   0x1007748
 1001d13:	e8 67 08 00 00       	call   100257f <printk>
 1001d18:	83 c3 04             	add    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:224 (discriminator 3)
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
          printk ("Stack @ 0x%08x:0x%08X:\n",debugSS, esp);
          for (int cnt=0;cnt<10;cnt++)
 1001d1b:	83 c4 10             	add    esp,0x10
 1001d1e:	83 fb 28             	cmp    ebx,0x28
 1001d21:	75 db                	jne    1001cfe <printDebugRegs+0x118>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:231
              printk("\t0x%08X%: 0x%08X\n",esp, debugSavedStack[cnt]);
              esp+=4;
          }


}
 1001d23:	5b                   	pop    ebx
 1001d24:	5e                   	pop    esi
 1001d25:	5f                   	pop    edi
 1001d26:	c3                   	ret    

01001d27 <reboot>:
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:239
/* keyboard interface IO port: data and control
   READ:   status port
   WRITE:  control register */
 
void reboot(bool waitFirst)
{
 1001d27:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:242
    uint8_t temp;
 
    if (waitFirst)
 1001d2a:	80 7c 24 10 00       	cmp    BYTE PTR [esp+0x10],0x0
 1001d2f:	74 1d                	je     1001d4e <reboot+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:244
    {
        puts("Rebooting ... ");
 1001d31:	83 ec 0c             	sub    esp,0xc
 1001d34:	68 76 77 00 01       	push   0x1007776
 1001d39:	e8 ff e6 ff ff       	call   100043d <puts>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:245
        __asm__("sti\n");
 1001d3e:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:246
        wait(3000);
 1001d3f:	c7 04 24 b8 0b 00 00 	mov    DWORD PTR [esp],0xbb8
 1001d46:	e8 dd 11 00 00       	call   1002f28 <wait>
 1001d4b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:248
    }
    __asm__ volatile ("cli"); /* disable all interrupts */
 1001d4e:	fa                   	cli    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1001d4f:	e4 64                	in     al,0x64
 1001d51:	89 c2                	mov    edx,eax
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:254
 
    /* Clear all keyboard buffers (output and command buffers) */
    do
    {
        temp = inb(KBRD_INTRFC); /* empty user data */
        if (check_flag(temp, KBRD_BIT_KDATA) != 0)
 1001d53:	a8 01                	test   al,0x1
 1001d55:	74 02                	je     1001d59 <reboot+0x32>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1001d57:	e4 60                	in     al,0x60
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:256
            inb(KBRD_IO); /* empty keyboard data */
    } while (check_flag(temp, KBRD_BIT_UDATA) != 0);
 1001d59:	f6 c2 02             	test   dl,0x2
 1001d5c:	75 f1                	jne    1001d4f <reboot+0x28>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001d5e:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 1001d63:	e6 64                	out    0x64,al
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:260 (discriminator 1)
 
    outb(KBRD_INTRFC, KBRD_RESET); /* pulse CPU reset line */
loop:
    __asm__ volatile ("hlt"); /* if that didn't work, halt the CPU */
 1001d65:	f4                   	hlt    
 1001d66:	eb fd                	jmp    1001d65 <reboot+0x3e>

01001d68 <dumpKernelAddresses>:
dumpKernelAddresses():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:265
    goto loop; /* if a NMI is received, halt again */
}

void dumpKernelAddresses()
{
 1001d68:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:266
printk("Kernel Variable List:\n");
 1001d6b:	68 85 77 00 01       	push   0x1007785
 1001d70:	e8 0a 08 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:267
printk("\tKERNEL_OBJECT_BASE_ADDRESS=0x%08x\n",KERNEL_OBJECT_BASE_ADDRESS);
 1001d75:	83 c4 08             	add    esp,0x8
 1001d78:	68 00 00 15 00       	push   0x150000
 1001d7d:	68 e4 81 00 01       	push   0x10081e4
 1001d82:	e8 f8 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:268
printk("\tE820_TABLE_ADDRESS=0x%08x (0x%08X)\n",E820_TABLE_ADDRESS);
 1001d87:	83 c4 08             	add    esp,0x8
 1001d8a:	68 00 00 15 00       	push   0x150000
 1001d8f:	68 08 82 00 01       	push   0x1008208
 1001d94:	e8 e6 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:269
printk("\tMP_CONFIG_TABLE_ADDRESS=0x%08x\n",MP_CONFIG_TABLE_ADDRESS);
 1001d99:	83 c4 08             	add    esp,0x8
 1001d9c:	68 b0 04 15 00       	push   0x1504b0
 1001da1:	68 30 82 00 01       	push   0x1008230
 1001da6:	e8 d4 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:270
printk("\tKEYBOARD_BUFFER_ADDRESS=0x%08x\n",KEYBOARD_BUFFER_ADDRESS);
 1001dab:	83 c4 08             	add    esp,0x8
 1001dae:	68 b0 24 15 00       	push   0x1524b0
 1001db3:	68 54 82 00 01       	push   0x1008254
 1001db8:	e8 c2 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:271
printk("\tIDT_TABLE_ADDRESS=0x%08x\n",IDT_TABLE_ADDRESS);
 1001dbd:	83 c4 08             	add    esp,0x8
 1001dc0:	68 00 30 15 00       	push   0x153000
 1001dc5:	68 9c 77 00 01       	push   0x100779c
 1001dca:	e8 b0 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:272
printk("\tINIT_GDT_TABLE_ADDRESS=0x%08x\n",INIT_GDT_TABLE_ADDRESS);
 1001dcf:	83 c4 08             	add    esp,0x8
 1001dd2:	68 00 40 15 00       	push   0x154000
 1001dd7:	68 78 82 00 01       	push   0x1008278
 1001ddc:	e8 9e 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:273
printk("\tTASK_TABLE_ADDRESS=0x%08x\n",TASK_TABLE_ADDRESS);
 1001de1:	83 c4 08             	add    esp,0x8
 1001de4:	68 00 50 15 00       	push   0x155000
 1001de9:	68 b7 77 00 01       	push   0x10077b7
 1001dee:	e8 8c 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:274
printk("\tTSS_TABLE_ADDRESS=0x%08x\n",TSS_TABLE_ADDRESS);
 1001df3:	83 c4 08             	add    esp,0x8
 1001df6:	68 00 60 2e 00       	push   0x2e6000
 1001dfb:	68 d3 77 00 01       	push   0x10077d3
 1001e00:	e8 7a 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:275
printk("\tATA_MBR_ARRAY_ADDRESS=0x%08x\n",ATA_MBR_ARRAY_ADDRESS);
 1001e05:	83 c4 08             	add    esp,0x8
 1001e08:	68 00 60 48 00       	push   0x486000
 1001e0d:	68 98 82 00 01       	push   0x1008298
 1001e12:	e8 68 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:276
printk("\tPCI_DEVICE_LIST_ADDRESS=0x%08x\n",PCI_DEVICE_LIST_ADDRESS);
 1001e17:	83 c4 08             	add    esp,0x8
 1001e1a:	68 00 70 48 00       	push   0x487000
 1001e1f:	68 b8 82 00 01       	push   0x10082b8
 1001e24:	e8 56 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:277
printk("\tPCI_BRIDGE_LIST_ADDRESS=0x%08x\n",PCI_BRIDGE_LIST_ADDRESS);
 1001e29:	83 c4 08             	add    esp,0x8
 1001e2c:	68 00 70 49 00       	push   0x497000
 1001e31:	68 dc 82 00 01       	push   0x10082dc
 1001e36:	e8 44 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:278
printk("\tPCI_FUNCTION_LIST_ADDRESS=0x%08x\n",PCI_FUNCTION_LIST_ADDRESS);
 1001e3b:	83 c4 08             	add    esp,0x8
 1001e3e:	68 00 70 4a 00       	push   0x4a7000
 1001e43:	68 00 83 00 01       	push   0x1008300
 1001e48:	e8 32 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:279
printk("\tGDT_PMODE_16BIT_TABLE_ADDRESS=0x%08x\n",GDT_PMODE_16BIT_TABLE_ADDRESS);
 1001e4d:	83 c4 08             	add    esp,0x8
 1001e50:	68 00 80 4a 00       	push   0x4a8000
 1001e55:	68 24 83 00 01       	push   0x1008324
 1001e5a:	e8 20 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:280
printk("\tKERNEL_PAGE_DIR_ADDRESS=0x%08x\n",KERNEL_PAGE_DIR_ADDRESS);
 1001e5f:	83 c4 08             	add    esp,0x8
 1001e62:	68 00 90 4a 00       	push   0x4a9000
 1001e67:	68 4c 83 00 01       	push   0x100834c
 1001e6c:	e8 0e 07 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:281
printk("\tKERNEL_PAGE_TABLE_BASE_ADDRESS=0x%08x\n",KERNEL_PAGE_TABLE_BASE_ADDRESS);
 1001e71:	83 c4 08             	add    esp,0x8
 1001e74:	68 00 b0 4b 00       	push   0x4bb000
 1001e79:	68 70 83 00 01       	push   0x1008370
 1001e7e:	e8 fc 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:282
printk("\tSAVED_STACK_FOR_EXCEPTIONS_ADDRESS=0x%08x\n",SAVED_STACK_FOR_EXCEPTIONS_ADDRESS);
 1001e83:	83 c4 08             	add    esp,0x8
 1001e86:	68 00 c0 8b 00       	push   0x8bc000
 1001e8b:	68 98 83 00 01       	push   0x1008398
 1001e90:	e8 ea 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:283
printk("\tSAVED_STACK_FOR_DEBUGGING_ADDRESS=0x%08x\n",SAVED_STACK_FOR_DEBUGGING_ADDRESS);
 1001e95:	83 c4 08             	add    esp,0x8
 1001e98:	68 00 e0 8b 00       	push   0x8be000
 1001e9d:	68 c4 83 00 01       	push   0x10083c4
 1001ea2:	e8 d8 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:284
printk("\tCPU_APIC_REGISTER_REMAP_BASE_ADDRESS=0x%08x\n",CPU_APIC_REGISTER_REMAP_BASE_ADDRESS);
 1001ea7:	83 c4 08             	add    esp,0x8
 1001eaa:	68 00 00 8c 00       	push   0x8c0000
 1001eaf:	68 f0 83 00 01       	push   0x10083f0
 1001eb4:	e8 c6 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:285
printk("\tCPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS=0x%08x\n",CPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS);
 1001eb9:	83 c4 08             	add    esp,0x8
 1001ebc:	68 00 10 8c 00       	push   0x8c1000
 1001ec1:	68 20 84 00 01       	push   0x1008420
 1001ec6:	e8 b4 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:286
printk("\tKERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS=0x%08x\n",KERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS);
 1001ecb:	83 c4 08             	add    esp,0x8
 1001ece:	68 04 10 8c 00       	push   0x8c1004
 1001ed3:	68 50 84 00 01       	push   0x1008450
 1001ed8:	e8 a2 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:287
printk("\tAHCI_ABAR_REMAPPED_ADDRESS=0x%08x\n",AHCI_ABAR_REMAPPED_ADDRESS);
 1001edd:	83 c4 08             	add    esp,0x8
 1001ee0:	68 00 20 8c 00       	push   0x8c2000
 1001ee5:	68 84 84 00 01       	push   0x1008484
 1001eea:	e8 90 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:288
printk("\tAHCI_PORT_BASE_REMAP_ADDRESS=0x%08x\n",AHCI_PORT_BASE_REMAP_ADDRESS);
 1001eef:	83 c4 08             	add    esp,0x8
 1001ef2:	68 00 20 90 00       	push   0x902000
 1001ef7:	68 a8 84 00 01       	push   0x10084a8
 1001efc:	e8 7e 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:289
printk("\tAHCI_DISK_BUFFER_ADDRESS=0x%08x\n",AHCI_DISK_BUFFER_ADDRESS);
 1001f01:	83 c4 08             	add    esp,0x8
 1001f04:	68 00 20 a4 00       	push   0xa42000
 1001f09:	68 d0 84 00 01       	push   0x10084d0
 1001f0e:	e8 6c 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:290
printk("\tATA_DEVICE_INFO_ADDRESS=0x%08x\n",ATA_DEVICE_INFO_ADDRESS);
 1001f13:	83 c4 08             	add    esp,0x8
 1001f16:	68 00 20 b8 00       	push   0xb82000
 1001f1b:	68 f4 84 00 01       	push   0x10084f4
 1001f20:	e8 5a 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:291
printk("\tAHCI_CAPS_ADDRESS=0x%08x\n",AHCI_CAPS_ADDRESS);
 1001f25:	83 c4 08             	add    esp,0x8
 1001f28:	68 20 6e b8 00       	push   0xb86e20
 1001f2d:	68 ee 77 00 01       	push   0x10077ee
 1001f32:	e8 48 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:292
printk("\tTSS_AVAILABLE_ADDRESS=0x%08x\n",TASK_AVAILABLE_ADDRESS);
 1001f37:	83 c4 08             	add    esp,0x8
 1001f3a:	68 40 bc b8 00       	push   0xb8bc40
 1001f3f:	68 18 85 00 01       	push   0x1008518
 1001f44:	e8 36 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:293
printk("\tGDT_AVAILABLE_ADDRESS=0x%08x\n",GDT_AVAILABLE_ADDRESS);
 1001f49:	83 c4 08             	add    esp,0x8
 1001f4c:	68 40 c4 b8 00       	push   0xb8c440
 1001f51:	68 38 85 00 01       	push   0x1008538
 1001f56:	e8 24 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:294
printk("\tEXEC_FILE_LOAD_INFO=0x%08x\n",EXEC_FILE_LOAD_INFO);
 1001f5b:	83 c4 08             	add    esp,0x8
 1001f5e:	68 40 cc b8 00       	push   0xb8cc40
 1001f63:	68 09 78 00 01       	push   0x1007809
 1001f68:	e8 12 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:295
printk("\tAHCI_ABAR_ADDRESS=0x%08x\n",AHCI_ABAR_ADDRESS);
 1001f6d:	83 c4 08             	add    esp,0x8
 1001f70:	68 e0 52 ba 00       	push   0xba52e0
 1001f75:	68 26 78 00 01       	push   0x1007826
 1001f7a:	e8 00 06 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:296
printk("\tEND_OF_KERNEL_OBJECTS_ADDRESS=0x%08x\n",END_OF_KERNEL_OBJECTS_ADDRESS);
 1001f7f:	83 c4 08             	add    esp,0x8
 1001f82:	68 e0 52 ca 00       	push   0xca52e0
 1001f87:	68 58 85 00 01       	push   0x1008558
 1001f8c:	e8 ee 05 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:297
}
 1001f91:	83 c4 1c             	add    esp,0x1c
 1001f94:	c3                   	ret    

01001f95 <pauseDisplay>:
pauseDisplay():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:300

bool pauseDisplay(bool offerToQuit)
{
 1001f95:	56                   	push   esi
 1001f96:	53                   	push   ebx
 1001f97:	83 ec 04             	sub    esp,0x4
 1001f9a:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:301
    if (offerToQuit)
 1001f9e:	84 db                	test   bl,bl
 1001fa0:	74 12                	je     1001fb4 <pauseDisplay+0x1f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:302
        printk("Press q to quit, any other key to continue ...");
 1001fa2:	83 ec 0c             	sub    esp,0xc
 1001fa5:	68 80 85 00 01       	push   0x1008580
 1001faa:	e8 d0 05 00 00       	call   100257f <printk>
 1001faf:	83 c4 10             	add    esp,0x10
 1001fb2:	eb 10                	jmp    1001fc4 <pauseDisplay+0x2f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:304
    else
        printk("Press a key to continue ... ");
 1001fb4:	83 ec 0c             	sub    esp,0xc
 1001fb7:	68 41 78 00 01       	push   0x1007841
 1001fbc:	e8 be 05 00 00       	call   100257f <printk>
 1001fc1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:305
    char lPressedKey=waitForKeyboardKey();
 1001fc4:	e8 f3 e4 ff ff       	call   10004bc <waitForKeyboardKey>
 1001fc9:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:306
    cursorMoveToX(0);
 1001fcb:	83 ec 0c             	sub    esp,0xc
 1001fce:	6a 00                	push   0x0
 1001fd0:	e8 b9 e3 ff ff       	call   100038e <cursorMoveToX>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:307
    printk("                                           ");
 1001fd5:	c7 04 24 b0 85 00 01 	mov    DWORD PTR [esp],0x10085b0
 1001fdc:	e8 9e 05 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:308
    cursorMoveToX(0);
 1001fe1:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
 1001fe8:	e8 a1 e3 ff ff       	call   100038e <cursorMoveToX>
 1001fed:	89 f0                	mov    eax,esi
 1001fef:	3c 71                	cmp    al,0x71
 1001ff1:	0f 94 c0             	sete   al
 1001ff4:	21 d8                	and    eax,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:312
    if (lPressedKey=='q' && offerToQuit)
        return true;
    return false;
}
 1001ff6:	83 c4 14             	add    esp,0x14
 1001ff9:	5b                   	pop    ebx
 1001ffa:	5e                   	pop    esi
 1001ffb:	c3                   	ret    

01001ffc <mallocTemp>:
mallocTemp():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:317

int memPtr=0xe00000;
uintptr_t* mallocTemp(int size)
{
    uintptr_t lRetVal = memPtr;
 1001ffc:	a1 00 48 00 01       	mov    eax,ds:0x1004800
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:318
    memPtr+=size;
 1002001:	89 c2                	mov    edx,eax
 1002003:	03 54 24 04          	add    edx,DWORD PTR [esp+0x4]
 1002007:	89 15 00 48 00 01    	mov    DWORD PTR ds:0x1004800,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:320
    return (uintptr_t*)lRetVal;
 100200d:	c3                   	ret    
 100200e:	66 90                	xchg   ax,ax

01002010 <memcpy>:
memcpy():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:12
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
void * memcpy(void *dest, const void *src, size_t n)
{
 1002010:	57                   	push   edi
 1002011:	56                   	push   esi
 1002012:	53                   	push   ebx
 1002013:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 1002017:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 100201b:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:17
    bool dw,dd;
    
    dd=n%4==0;
    dw=n%2==0;
    if (dd)
 100201f:	89 d1                	mov    ecx,edx
 1002021:	83 e1 03             	and    ecx,0x3
 1002024:	75 4d                	jne    1002073 <memcpy+0x63>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:19
    {
        n /=4;
 1002026:	c1 ea 02             	shr    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:23
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
 1002029:	39 c3                	cmp    ebx,eax
 100202b:	72 0e                	jb     100203b <memcpy+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 100202d:	b9 00 00 00 00       	mov    ecx,0x0
 1002032:	85 d2                	test   edx,edx
 1002034:	75 2e                	jne    1002064 <memcpy+0x54>
 1002036:	e9 b6 00 00 00       	jmp    10020f1 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:24
        n /=4;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
 100203b:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
 1002042:	01 fb                	add    ebx,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:25
                t += n;
 1002044:	01 c7                	add    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:26
                while ( (n)-- > 0)
 1002046:	85 d2                	test   edx,edx
 1002048:	0f 84 a3 00 00 00    	je     10020f1 <memcpy+0xe1>
 100204e:	f7 da                	neg    edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:27
                        *--t = *--f;
 1002050:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
 1002054:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
 1002058:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:26
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
 100205b:	39 d1                	cmp    ecx,edx
 100205d:	75 f1                	jne    1002050 <memcpy+0x40>
 100205f:	e9 8d 00 00 00       	jmp    10020f1 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:30
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
 1002064:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
 1002067:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
 100206a:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 100206d:	39 ca                	cmp    edx,ecx
 100206f:	75 f3                	jne    1002064 <memcpy+0x54>
 1002071:	eb 7e                	jmp    10020f1 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:33
                        *t++ = *f++;
        return dest;
    }
    else if (dw)
 1002073:	89 d1                	mov    ecx,edx
 1002075:	83 e1 01             	and    ecx,0x1
 1002078:	75 42                	jne    10020bc <memcpy+0xac>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:35
    {
        n /=2;
 100207a:	d1 ea                	shr    edx,1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:39
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
 100207c:	39 c3                	cmp    ebx,eax
 100207e:	72 0b                	jb     100208b <memcpy+0x7b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 1002080:	b9 00 00 00 00       	mov    ecx,0x0
 1002085:	85 d2                	test   edx,edx
 1002087:	75 24                	jne    10020ad <memcpy+0x9d>
 1002089:	eb 66                	jmp    10020f1 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:40
        n /=2;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
 100208b:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
 1002092:	01 fb                	add    ebx,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:41
                t += n;
 1002094:	01 c7                	add    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:42
                while ( (n)-- > 0)
 1002096:	85 d2                	test   edx,edx
 1002098:	74 57                	je     10020f1 <memcpy+0xe1>
 100209a:	f7 da                	neg    edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:43
                        *--t = *--f;
 100209c:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
 10020a0:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
 10020a4:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:42
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
 10020a7:	39 ca                	cmp    edx,ecx
 10020a9:	75 f1                	jne    100209c <memcpy+0x8c>
 10020ab:	eb 44                	jmp    10020f1 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:46
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
 10020ad:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
 10020b0:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
 10020b3:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 10020b6:	39 ca                	cmp    edx,ecx
 10020b8:	75 f3                	jne    10020ad <memcpy+0x9d>
 10020ba:	eb 35                	jmp    10020f1 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:54
    else
    {
        const char *f = src;
        char *t = dest;

        if (f < t) {
 10020bc:	39 c3                	cmp    ebx,eax
 10020be:	72 0b                	jb     10020cb <memcpy+0xbb>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
 10020c0:	be 00 00 00 00       	mov    esi,0x0
 10020c5:	85 d2                	test   edx,edx
 10020c7:	75 1a                	jne    10020e3 <memcpy+0xd3>
 10020c9:	eb 26                	jmp    10020f1 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
 10020cb:	8d 4a ff             	lea    ecx,[edx-0x1]
 10020ce:	85 d2                	test   edx,edx
 10020d0:	74 1f                	je     10020f1 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:58
                        *--t = *--f;
 10020d2:	0f b6 14 0b          	movzx  edx,BYTE PTR [ebx+ecx*1]
 10020d6:	88 14 08             	mov    BYTE PTR [eax+ecx*1],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
 10020d9:	83 e9 01             	sub    ecx,0x1
 10020dc:	83 f9 ff             	cmp    ecx,0xffffffff
 10020df:	75 f1                	jne    10020d2 <memcpy+0xc2>
 10020e1:	eb 0e                	jmp    10020f1 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:61
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
 10020e3:	0f b6 0c 33          	movzx  ecx,BYTE PTR [ebx+esi*1]
 10020e7:	88 0c 30             	mov    BYTE PTR [eax+esi*1],cl
 10020ea:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
 10020ed:	39 f2                	cmp    edx,esi
 10020ef:	75 f2                	jne    10020e3 <memcpy+0xd3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:64
                        *t++ = *f++;
        return dest;
    }
 10020f1:	5b                   	pop    ebx
 10020f2:	5e                   	pop    esi
 10020f3:	5f                   	pop    edi
 10020f4:	c3                   	ret    
 10020f5:	66 90                	xchg   ax,ax
 10020f7:	90                   	nop

010020f8 <panic>:
panic():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:8
#include <stdarg.h>
#include <time.h>
#include "printf.h"

void __attribute__((noinline))panic(const char *format, ...)
{
 10020f8:	53                   	push   ebx
 10020f9:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:10
    va_list args;
    va_start( args, format );
 10020fc:	8d 5c 24 14          	lea    ebx,[esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:11
    printk("\n>>>panic at instruction prior to address 0x%08X<<<\n", __builtin_return_address(0));
 1002100:	83 ec 08             	sub    esp,0x8
 1002103:	ff 74 24 14          	push   DWORD PTR [esp+0x14]
 1002107:	68 dc 85 00 01       	push   0x10085dc
 100210c:	e8 6e 04 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:12
    printk("  >>>");
 1002111:	c7 04 24 5e 78 00 01 	mov    DWORD PTR [esp],0x100785e
 1002118:	e8 62 04 00 00       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:13
    printk_valist( format,args);
 100211d:	83 c4 08             	add    esp,0x8
 1002120:	53                   	push   ebx
 1002121:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1002125:	e8 3c 04 00 00       	call   1002566 <printk_valist>
 100212a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:15 (discriminator 1)
    panicLoop: 
    __asm__("cli\nhlt\n");
 100212d:	fa                   	cli    
 100212e:	f4                   	hlt    
 100212f:	eb fc                	jmp    100212d <panic+0x35>
 1002131:	66 90                	xchg   ax,ax
 1002133:	90                   	nop

01002134 <printchar>:
printchar():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:43
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
	
	if (str) {
 1002134:	85 c0                	test   eax,eax
 1002136:	74 08                	je     1002140 <printchar+0xc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:44
		**str = c;
 1002138:	8b 08                	mov    ecx,DWORD PTR [eax]
 100213a:	88 11                	mov    BYTE PTR [ecx],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:45
		++(*str);
 100213c:	83 00 01             	add    DWORD PTR [eax],0x1
 100213f:	c3                   	ret    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:41
//extern bool pauseDisplay(bool offerToQuit);
extern uint32_t kDebugLevel;
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
 1002140:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:47
	
	if (str) {
		**str = c;
		++(*str);
	}
	else terminal_putchar((unsigned char)c);
 1002143:	0f b6 d2             	movzx  edx,dl
 1002146:	52                   	push   edx
 1002147:	e8 cd e0 ff ff       	call   1000219 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:48
}
 100214c:	83 c4 1c             	add    esp,0x1c
 100214f:	c3                   	ret    

01002150 <prints>:
prints():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:54

#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
 1002150:	55                   	push   ebp
 1002151:	57                   	push   edi
 1002152:	56                   	push   esi
 1002153:	53                   	push   ebx
 1002154:	83 ec 1c             	sub    esp,0x1c
 1002157:	89 c7                	mov    edi,eax
 1002159:	89 d6                	mov    esi,edx
 100215b:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
 100215f:	8b 54 24 30          	mov    edx,DWORD PTR [esp+0x30]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:57
	register int pc = 0, padchar = ' ';

	if (width > 0) {
 1002163:	85 c9                	test   ecx,ecx
 1002165:	0f 8e cb 00 00 00    	jle    1002236 <prints+0xe6>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60 (discriminator 1)
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
 100216b:	80 3e 00             	cmp    BYTE PTR [esi],0x0
 100216e:	74 1b                	je     100218b <prints+0x3b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60
 1002170:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60 (discriminator 3)
 1002175:	83 c0 01             	add    eax,0x1
 1002178:	80 3c 06 00          	cmp    BYTE PTR [esi+eax*1],0x0
 100217c:	75 f7                	jne    1002175 <prints+0x25>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:61
		if (len >= width) width = 0;
 100217e:	bb 00 00 00 00       	mov    ebx,0x0
 1002183:	39 44 24 0c          	cmp    DWORD PTR [esp+0xc],eax
 1002187:	7e 0f                	jle    1002198 <prints+0x48>
 1002189:	eb 05                	jmp    1002190 <prints+0x40>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60
	register int pc = 0, padchar = ' ';

	if (width > 0) {
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
 100218b:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:62
		if (len >= width) width = 0;
		else width -= len;
 1002190:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 1002194:	29 c1                	sub    ecx,eax
 1002196:	89 cb                	mov    ebx,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:63
		if (pad & PAD_ZERO) padchar = '0';
 1002198:	89 d0                	mov    eax,edx
 100219a:	83 e0 02             	and    eax,0x2
 100219d:	83 f8 01             	cmp    eax,0x1
 10021a0:	19 ed                	sbb    ebp,ebp
 10021a2:	83 e5 f0             	and    ebp,0xfffffff0
 10021a5:	83 c5 30             	add    ebp,0x30
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:65
	}
	if (!(pad & PAD_RIGHT)) {
 10021a8:	f6 c2 01             	test   dl,0x1
 10021ab:	75 1a                	jne    10021c7 <prints+0x77>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66 (discriminator 1)
		for ( ; width > 0; --width) {
 10021ad:	85 db                	test   ebx,ebx
 10021af:	7e 67                	jle    1002218 <prints+0xc8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66
 10021b1:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:67 (discriminator 2)
			printchar (out, padchar);
 10021b5:	89 ea                	mov    edx,ebp
 10021b7:	89 f8                	mov    eax,edi
 10021b9:	e8 76 ff ff ff       	call   1002134 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66 (discriminator 2)
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
 10021be:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
 10021c3:	75 f0                	jne    10021b5 <prints+0x65>
 10021c5:	eb 66                	jmp    100222d <prints+0xdd>
 10021c7:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 1)
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 10021cb:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 10021ce:	84 d2                	test   dl,dl
 10021d0:	74 1e                	je     10021f0 <prints+0xa0>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 10021d2:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 10021d7:	29 de                	sub    esi,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:72 (discriminator 2)
		printchar (out, *string);
 10021d9:	0f be d2             	movsx  edx,dl
 10021dc:	89 f8                	mov    eax,edi
 10021de:	e8 51 ff ff ff       	call   1002134 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:73 (discriminator 2)
		++pc;
 10021e3:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 10021e6:	0f b6 14 1e          	movzx  edx,BYTE PTR [esi+ebx*1]
 10021ea:	84 d2                	test   dl,dl
 10021ec:	75 eb                	jne    10021d9 <prints+0x89>
 10021ee:	eb 05                	jmp    10021f5 <prints+0xa5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 10021f0:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:75 (discriminator 1)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
 10021f5:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10021f9:	85 c0                	test   eax,eax
 10021fb:	7e 45                	jle    1002242 <prints+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:75
 10021fd:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:76 (discriminator 2)
		printchar (out, padchar);
 10021ff:	89 ea                	mov    edx,ebp
 1002201:	89 f8                	mov    eax,edi
 1002203:	e8 2c ff ff ff       	call   1002134 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:75 (discriminator 2)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
 1002208:	83 ee 01             	sub    esi,0x1
 100220b:	75 f2                	jne    10021ff <prints+0xaf>
 100220d:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1002211:	8d 04 03             	lea    eax,[ebx+eax*1]
 1002214:	89 c3                	mov    ebx,eax
 1002216:	eb 2a                	jmp    1002242 <prints+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
 1002218:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
 100221c:	bb 00 00 00 00       	mov    ebx,0x0
 1002221:	eb 0a                	jmp    100222d <prints+0xdd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 1002223:	bd 20 00 00 00       	mov    ebp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
 1002228:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 100222d:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 1002230:	84 d2                	test   dl,dl
 1002232:	75 a3                	jne    10021d7 <prints+0x87>
 1002234:	eb 0c                	jmp    1002242 <prints+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
 1002236:	f6 c2 01             	test   dl,0x1
 1002239:	74 e8                	je     1002223 <prints+0xd3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 100223b:	bd 20 00 00 00       	mov    ebp,0x20
 1002240:	eb 89                	jmp    10021cb <prints+0x7b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:81
		printchar (out, padchar);
		++pc;
	}

	return pc;
}
 1002242:	89 d8                	mov    eax,ebx
 1002244:	83 c4 1c             	add    esp,0x1c
 1002247:	5b                   	pop    ebx
 1002248:	5e                   	pop    esi
 1002249:	5f                   	pop    edi
 100224a:	5d                   	pop    ebp
 100224b:	c3                   	ret    

0100224c <printi>:
printi():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:87

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
 100224c:	55                   	push   ebp
 100224d:	57                   	push   edi
 100224e:	56                   	push   esi
 100224f:	53                   	push   ebx
 1002250:	83 ec 2c             	sub    esp,0x2c
 1002253:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:93
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;

	if (i == 0) {
 1002257:	85 d2                	test   edx,edx
 1002259:	75 2a                	jne    1002285 <printi+0x39>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:94
		print_buf[0] = '0';
 100225b:	c6 44 24 14 30       	mov    BYTE PTR [esp+0x14],0x30
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:95
		print_buf[1] = '\0';
 1002260:	c6 44 24 15 00       	mov    BYTE PTR [esp+0x15],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:96
		return prints (out, print_buf, width, pad);
 1002265:	83 ec 0c             	sub    esp,0xc
 1002268:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 100226c:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
 1002270:	8d 54 24 24          	lea    edx,[esp+0x24]
 1002274:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002278:	e8 d3 fe ff ff       	call   1002150 <prints>
 100227d:	83 c4 10             	add    esp,0x10
 1002280:	e9 f1 00 00 00       	jmp    1002376 <printi+0x12a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:99
	}

	if (sg && b == 10 && i < 0) {
 1002285:	83 7c 24 40 00       	cmp    DWORD PTR [esp+0x40],0x0
 100228a:	0f 95 c3             	setne  bl
 100228d:	83 f9 0a             	cmp    ecx,0xa
 1002290:	0f 94 c0             	sete   al
 1002293:	84 c3                	test   bl,al
 1002295:	0f 84 c1 00 00 00    	je     100235c <printi+0x110>
 100229b:	89 d0                	mov    eax,edx
 100229d:	c1 e8 1f             	shr    eax,0x1f
 10022a0:	84 c0                	test   al,al
 10022a2:	0f 84 b4 00 00 00    	je     100235c <printi+0x110>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
 10022a8:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
 10022ad:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:107
	*s = '\0';

	while (u) {
 10022b1:	89 d3                	mov    ebx,edx
 10022b3:	f7 db                	neg    ebx
 10022b5:	74 54                	je     100230b <printi+0xbf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:100
		print_buf[1] = '\0';
		return prints (out, print_buf, width, pad);
	}

	if (sg && b == 10 && i < 0) {
		neg = 1;
 10022b7:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
 10022be:	00 
 10022bf:	eb 08                	jmp    10022c9 <printi+0x7d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 10022c1:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 10022c8:	00 
 10022c9:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
 10022cd:	89 cf                	mov    edi,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
 10022cf:	8b 44 24 4c          	mov    eax,DWORD PTR [esp+0x4c]
 10022d3:	8d 68 c6             	lea    ebp,[eax-0x3a]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
 10022d6:	89 d8                	mov    eax,ebx
 10022d8:	ba 00 00 00 00       	mov    edx,0x0
 10022dd:	f7 f1                	div    ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
 10022df:	8d 04 2a             	lea    eax,[edx+ebp*1]
 10022e2:	83 fa 0a             	cmp    edx,0xa
 10022e5:	0f 4c c2             	cmovl  eax,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:111
		*--s = t + '0';
 10022e8:	83 ee 01             	sub    esi,0x1
 10022eb:	83 c0 30             	add    eax,0x30
 10022ee:	88 06                	mov    BYTE PTR [esi],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:112
		u /= b;
 10022f0:	89 d8                	mov    eax,ebx
 10022f2:	ba 00 00 00 00       	mov    edx,0x0
 10022f7:	f7 f7                	div    edi
 10022f9:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:107
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
 10022fb:	85 c0                	test   eax,eax
 10022fd:	75 d7                	jne    10022d6 <printi+0x8a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 10022ff:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:115
			t += letbase - '0' - 10;
		*--s = t + '0';
		u /= b;
	}

	if (neg) {
 1002304:	83 7c 24 0c 00       	cmp    DWORD PTR [esp+0xc],0x0
 1002309:	74 34                	je     100233f <printi+0xf3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:116
		if( width && (pad & PAD_ZERO) ) {
 100230b:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
 1002310:	74 21                	je     1002333 <printi+0xe7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:116 (discriminator 1)
 1002312:	f6 44 24 48 02       	test   BYTE PTR [esp+0x48],0x2
 1002317:	74 1a                	je     1002333 <printi+0xe7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:117
			printchar (out, '-');
 1002319:	ba 2d 00 00 00       	mov    edx,0x2d
 100231e:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1002322:	e8 0d fe ff ff       	call   1002134 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:119
			++pc;
			--width;
 1002327:	83 6c 24 44 01       	sub    DWORD PTR [esp+0x44],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:118
	}

	if (neg) {
		if( width && (pad & PAD_ZERO) ) {
			printchar (out, '-');
			++pc;
 100232c:	bb 01 00 00 00       	mov    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:119
			--width;
 1002331:	eb 0c                	jmp    100233f <printi+0xf3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:122
		}
		else {
			*--s = '-';
 1002333:	c6 46 ff 2d          	mov    BYTE PTR [esi-0x1],0x2d
 1002337:	8d 76 ff             	lea    esi,[esi-0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 100233a:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:126
		else {
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
 100233f:	83 ec 0c             	sub    esp,0xc
 1002342:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 1002346:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
 100234a:	89 f2                	mov    edx,esi
 100234c:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002350:	e8 fb fd ff ff       	call   1002150 <prints>
 1002355:	01 d8                	add    eax,ebx
 1002357:	83 c4 10             	add    esp,0x10
 100235a:	eb 1a                	jmp    1002376 <printi+0x12a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:91
static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;
 100235c:	89 d3                	mov    ebx,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
 100235e:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:107

	while (u) {
 1002363:	85 d2                	test   edx,edx
 1002365:	0f 85 56 ff ff ff    	jne    10022c1 <printi+0x75>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 100236b:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
 1002370:	8d 74 24 1f          	lea    esi,[esp+0x1f]
 1002374:	eb c9                	jmp    100233f <printi+0xf3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:127
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
}
 1002376:	83 c4 2c             	add    esp,0x2c
 1002379:	5b                   	pop    ebx
 100237a:	5e                   	pop    esi
 100237b:	5f                   	pop    edi
 100237c:	5d                   	pop    ebp
 100237d:	c3                   	ret    

0100237e <print>:
print():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:130

static int print(char **out, const char *format, va_list args )
{
 100237e:	55                   	push   ebp
 100237f:	57                   	push   edi
 1002380:	56                   	push   esi
 1002381:	53                   	push   ebx
 1002382:	83 ec 2c             	sub    esp,0x2c
 1002385:	89 c7                	mov    edi,eax
 1002387:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:135
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
 100238b:	0f b6 02             	movzx  eax,BYTE PTR [edx]
 100238e:	84 c0                	test   al,al
 1002390:	0f 84 b8 01 00 00    	je     100254e <print+0x1d0>
 1002396:	89 d5                	mov    ebp,edx
 1002398:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:136
		if (*format == '%') {
 100239d:	3c 25                	cmp    al,0x25
 100239f:	0f 85 88 01 00 00    	jne    100252d <print+0x1af>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:137
			++format;
 10023a5:	8d 5d 01             	lea    ebx,[ebp+0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:139
			width = pad = 0;
			if (*format == '\0') break;
 10023a8:	0f b6 55 01          	movzx  edx,BYTE PTR [ebp+0x1]
 10023ac:	84 d2                	test   dl,dl
 10023ae:	0f 84 9f 01 00 00    	je     1002553 <print+0x1d5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:140
			if (*format == '%') goto out;
 10023b4:	80 fa 25             	cmp    dl,0x25
 10023b7:	0f 84 6e 01 00 00    	je     100252b <print+0x1ad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:138
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
			width = pad = 0;
 10023bd:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:141
			if (*format == '\0') break;
			if (*format == '%') goto out;
			if (*format == '-') {
 10023c2:	80 fa 2d             	cmp    dl,0x2d
 10023c5:	75 08                	jne    10023cf <print+0x51>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:142
				++format;
 10023c7:	8d 5d 02             	lea    ebx,[ebp+0x2]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:143
				pad = PAD_RIGHT;
 10023ca:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:145
			}
			while (*format == '0') {
 10023cf:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
 10023d2:	75 0b                	jne    10023df <print+0x61>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:146
				++format;
 10023d4:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:147
				pad |= PAD_ZERO;
 10023d7:	83 c8 02             	or     eax,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:145
			if (*format == '%') goto out;
			if (*format == '-') {
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0') {
 10023da:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
 10023dd:	74 f5                	je     10023d4 <print+0x56>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149 (discriminator 1)
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
 10023df:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
 10023e2:	8d 4a d0             	lea    ecx,[edx-0x30]
 10023e5:	80 f9 09             	cmp    cl,0x9
 10023e8:	77 22                	ja     100240c <print+0x8e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149
 10023ea:	b9 00 00 00 00       	mov    ecx,0x0
 10023ef:	89 c5                	mov    ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:150 (discriminator 2)
				width *= 10;
 10023f1:	8d 04 89             	lea    eax,[ecx+ecx*4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:151 (discriminator 2)
				width += *format - '0';
 10023f4:	0f be d2             	movsx  edx,dl
 10023f7:	8d 4c 42 d0          	lea    ecx,[edx+eax*2-0x30]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149 (discriminator 2)
			}
			while (*format == '0') {
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
 10023fb:	83 c3 01             	add    ebx,0x1
 10023fe:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
 1002401:	8d 42 d0             	lea    eax,[edx-0x30]
 1002404:	3c 09                	cmp    al,0x9
 1002406:	76 e9                	jbe    10023f1 <print+0x73>
 1002408:	89 e8                	mov    eax,ebp
 100240a:	eb 05                	jmp    1002411 <print+0x93>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149
 100240c:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:153
				width *= 10;
				width += *format - '0';
			}
			if( *format == 's' ) {
 1002411:	80 fa 73             	cmp    dl,0x73
 1002414:	75 2c                	jne    1002442 <print+0xc4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:154
				register char *s = (char *)va_arg( args, int );
 1002416:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 100241a:	8d 6a 04             	lea    ebp,[edx+0x4]
 100241d:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 1002421:	8b 12                	mov    edx,DWORD PTR [edx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:155
				pc += prints (out, s?s:"(null)", width, pad);
 1002423:	85 d2                	test   edx,edx
 1002425:	bd 64 78 00 01       	mov    ebp,0x1007864
 100242a:	0f 44 d5             	cmove  edx,ebp
 100242d:	83 ec 0c             	sub    esp,0xc
 1002430:	50                   	push   eax
 1002431:	89 f8                	mov    eax,edi
 1002433:	e8 18 fd ff ff       	call   1002150 <prints>
 1002438:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:156
				continue;
 100243a:	83 c4 10             	add    esp,0x10
 100243d:	e9 fb 00 00 00       	jmp    100253d <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:158
			}
			if( *format == 'd' ) {
 1002442:	80 fa 64             	cmp    dl,0x64
 1002445:	75 29                	jne    1002470 <print+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:159
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
 1002447:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 100244b:	8d 6a 04             	lea    ebp,[edx+0x4]
 100244e:	6a 61                	push   0x61
 1002450:	50                   	push   eax
 1002451:	51                   	push   ecx
 1002452:	6a 01                	push   0x1
 1002454:	b9 0a 00 00 00       	mov    ecx,0xa
 1002459:	8b 12                	mov    edx,DWORD PTR [edx]
 100245b:	89 f8                	mov    eax,edi
 100245d:	e8 ea fd ff ff       	call   100224c <printi>
 1002462:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:160
				continue;
 1002464:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:159
				register char *s = (char *)va_arg( args, int );
				pc += prints (out, s?s:"(null)", width, pad);
				continue;
			}
			if( *format == 'd' ) {
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
 1002467:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:160
				continue;
 100246b:	e9 cd 00 00 00       	jmp    100253d <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:162
			}
			if( *format == 'x' ) {
 1002470:	80 fa 78             	cmp    dl,0x78
 1002473:	75 2b                	jne    10024a0 <print+0x122>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:163
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
 1002475:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 1002479:	89 ea                	mov    edx,ebp
 100247b:	83 c5 04             	add    ebp,0x4
 100247e:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 1002482:	6a 61                	push   0x61
 1002484:	50                   	push   eax
 1002485:	51                   	push   ecx
 1002486:	6a 00                	push   0x0
 1002488:	b9 10 00 00 00       	mov    ecx,0x10
 100248d:	8b 12                	mov    edx,DWORD PTR [edx]
 100248f:	89 f8                	mov    eax,edi
 1002491:	e8 b6 fd ff ff       	call   100224c <printi>
 1002496:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:164
				continue;
 1002498:	83 c4 10             	add    esp,0x10
 100249b:	e9 9d 00 00 00       	jmp    100253d <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:166
			}
			if( *format == 'X' ) {
 10024a0:	80 fa 58             	cmp    dl,0x58
 10024a3:	75 26                	jne    10024cb <print+0x14d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:167
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
 10024a5:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 10024a9:	8d 6a 04             	lea    ebp,[edx+0x4]
 10024ac:	6a 41                	push   0x41
 10024ae:	50                   	push   eax
 10024af:	51                   	push   ecx
 10024b0:	6a 00                	push   0x0
 10024b2:	b9 10 00 00 00       	mov    ecx,0x10
 10024b7:	8b 12                	mov    edx,DWORD PTR [edx]
 10024b9:	89 f8                	mov    eax,edi
 10024bb:	e8 8c fd ff ff       	call   100224c <printi>
 10024c0:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:168
				continue;
 10024c2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:167
			if( *format == 'x' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
				continue;
			}
			if( *format == 'X' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
 10024c5:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:168
				continue;
 10024c9:	eb 72                	jmp    100253d <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:170
			}
			if( *format == 'u' ) {
 10024cb:	80 fa 75             	cmp    dl,0x75
 10024ce:	75 28                	jne    10024f8 <print+0x17a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:171
				pc += printi (out, va_arg( args, int ), 10, 0, width, pad, 'a');
 10024d0:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 10024d4:	89 ea                	mov    edx,ebp
 10024d6:	83 c5 04             	add    ebp,0x4
 10024d9:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 10024dd:	6a 61                	push   0x61
 10024df:	50                   	push   eax
 10024e0:	51                   	push   ecx
 10024e1:	6a 00                	push   0x0
 10024e3:	b9 0a 00 00 00       	mov    ecx,0xa
 10024e8:	8b 12                	mov    edx,DWORD PTR [edx]
 10024ea:	89 f8                	mov    eax,edi
 10024ec:	e8 5b fd ff ff       	call   100224c <printi>
 10024f1:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:172
				continue;
 10024f3:	83 c4 10             	add    esp,0x10
 10024f6:	eb 45                	jmp    100253d <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:174
			}
			if( *format == 'c' ) {
 10024f8:	80 fa 63             	cmp    dl,0x63
 10024fb:	75 40                	jne    100253d <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:176
				/* char are converted to int then pushed on the stack */
				scr[0] = (char)va_arg( args, int );
 10024fd:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 1002501:	89 ea                	mov    edx,ebp
 1002503:	83 c5 04             	add    ebp,0x4
 1002506:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 100250a:	8b 12                	mov    edx,DWORD PTR [edx]
 100250c:	88 54 24 1e          	mov    BYTE PTR [esp+0x1e],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:177
				scr[1] = '\0';
 1002510:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:178
				pc += prints (out, scr, width, pad);
 1002515:	83 ec 0c             	sub    esp,0xc
 1002518:	50                   	push   eax
 1002519:	8d 54 24 2e          	lea    edx,[esp+0x2e]
 100251d:	89 f8                	mov    eax,edi
 100251f:	e8 2c fc ff ff       	call   1002150 <prints>
 1002524:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:179
				continue;
 1002526:	83 c4 10             	add    esp,0x10
 1002529:	eb 12                	jmp    100253d <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:137
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
 100252b:	89 dd                	mov    ebp,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:184
				continue;
			}
		}
		else {
		out:
			printchar (out, *format);
 100252d:	0f be 55 00          	movsx  edx,BYTE PTR [ebp+0x0]
 1002531:	89 f8                	mov    eax,edi
 1002533:	e8 fc fb ff ff       	call   1002134 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:185
			++pc;
 1002538:	83 c6 01             	add    esi,0x1
 100253b:	89 eb                	mov    ebx,ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:135
{
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
 100253d:	8d 6b 01             	lea    ebp,[ebx+0x1]
 1002540:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
 1002544:	84 c0                	test   al,al
 1002546:	0f 85 51 fe ff ff    	jne    100239d <print+0x1f>
 100254c:	eb 05                	jmp    1002553 <print+0x1d5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:132
}

static int print(char **out, const char *format, va_list args )
{
	register int width, pad;
	register int pc = 0;
 100254e:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:188
		out:
			printchar (out, *format);
			++pc;
		}
	}
	if (out) **out = '\0';
 1002553:	85 ff                	test   edi,edi
 1002555:	74 05                	je     100255c <print+0x1de>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:188 (discriminator 1)
 1002557:	8b 07                	mov    eax,DWORD PTR [edi]
 1002559:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:191
	va_end( args );
	return pc;
}
 100255c:	89 f0                	mov    eax,esi
 100255e:	83 c4 2c             	add    esp,0x2c
 1002561:	5b                   	pop    ebx
 1002562:	5e                   	pop    esi
 1002563:	5f                   	pop    edi
 1002564:	5d                   	pop    ebp
 1002565:	c3                   	ret    

01002566 <printk_valist>:
printk_valist():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:194

int printk_valist(const char *format, va_list args)
{
 1002566:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:195
    return print(0, format, args);
 1002569:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
 100256d:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 1002571:	b8 00 00 00 00       	mov    eax,0x0
 1002576:	e8 03 fe ff ff       	call   100237e <print>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:196
}
 100257b:	83 c4 0c             	add    esp,0xc
 100257e:	c3                   	ret    

0100257f <printk>:
printk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:199

int printk(const char *format, ...)
{
 100257f:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:201
        va_list args;
        va_start( args, format );
 1002582:	8d 44 24 14          	lea    eax,[esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:202
        return printk_valist(format, args);
 1002586:	83 ec 08             	sub    esp,0x8
 1002589:	50                   	push   eax
 100258a:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100258e:	e8 d3 ff ff ff       	call   1002566 <printk_valist>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:203
}
 1002593:	83 c4 1c             	add    esp,0x1c
 1002596:	c3                   	ret    

01002597 <printd>:
printd():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:209

#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
 1002597:	83 ec 0c             	sub    esp,0xc
 100259a:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:210
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
 100259e:	89 d1                	mov    ecx,edx
 10025a0:	23 0d 38 03 12 00    	and    ecx,DWORD PTR ds:0x120338
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:222
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
    }
    return 0;
 10025a6:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:210
#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
 10025ab:	39 ca                	cmp    edx,ecx
 10025ad:	75 14                	jne    10025c3 <printd+0x2c>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:214
    {
        va_list args;

        va_start( args, format );
 10025af:	8d 44 24 18          	lea    eax,[esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:220
//        if (++printDLineCount==SYS_VGA_HEIGHT-1)
//        {
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
 10025b3:	83 ec 08             	sub    esp,0x8
 10025b6:	50                   	push   eax
 10025b7:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 10025bb:	e8 a6 ff ff ff       	call   1002566 <printk_valist>
 10025c0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:223 (discriminator 1)
    }
    return 0;
}
 10025c3:	83 c4 0c             	add    esp,0xc
 10025c6:	c3                   	ret    

010025c7 <sprintf>:
sprintf():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:227
#endif

int sprintf(char *out, const char *format, ...)
{
 10025c7:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:231
        va_list args;
        
        va_start( args, format );
        return print( &out, format, args );
 10025ca:	8d 4c 24 18          	lea    ecx,[esp+0x18]
 10025ce:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
 10025d2:	8d 44 24 10          	lea    eax,[esp+0x10]
 10025d6:	e8 a3 fd ff ff       	call   100237e <print>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:232
}
 10025db:	83 c4 0c             	add    esp,0xc
 10025de:	c3                   	ret    
 10025df:	90                   	nop

010025e0 <strcpy>:
strcpy():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:5
#include "strings.h"

char *
strcpy(char *s1, const char *s2)
{
 10025e0:	53                   	push   ebx
 10025e1:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10025e5:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:6
    char *s = s1;
 10025e9:	89 c2                	mov    edx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:7 (discriminator 1)
    while ((*s++ = *s2++) != 0)
 10025eb:	83 c2 01             	add    edx,0x1
 10025ee:	83 c1 01             	add    ecx,0x1
 10025f1:	0f b6 59 ff          	movzx  ebx,BYTE PTR [ecx-0x1]
 10025f5:	88 5a ff             	mov    BYTE PTR [edx-0x1],bl
 10025f8:	84 db                	test   bl,bl
 10025fa:	75 ef                	jne    10025eb <strcpy+0xb>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:10
	;
    return (s1);
}
 10025fc:	5b                   	pop    ebx
 10025fd:	c3                   	ret    

010025fe <strcpyc>:
strcpyc():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:14

char *
strcpyc(char *s1, const char *s2, unsigned count)
{
 10025fe:	56                   	push   esi
 10025ff:	53                   	push   ebx
 1002600:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1002604:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16
    char *s = s1;
    while ((*s++ = *s2++) != 0 && count-->0)
 1002608:	ba 00 00 00 00       	mov    edx,0x0
 100260d:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 1002611:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16 (discriminator 2)
 1002614:	0f b6 0c 16          	movzx  ecx,BYTE PTR [esi+edx*1]
 1002618:	88 0c 10             	mov    BYTE PTR [eax+edx*1],cl
 100261b:	84 c9                	test   cl,cl
 100261d:	74 07                	je     1002626 <strcpyc+0x28>
 100261f:	83 c2 01             	add    edx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16 (discriminator 1)
 1002622:	39 d3                	cmp    ebx,edx
 1002624:	75 ee                	jne    1002614 <strcpyc+0x16>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:19
	;
    return (s1);
}
 1002626:	5b                   	pop    ebx
 1002627:	5e                   	pop    esi
 1002628:	c3                   	ret    
 1002629:	66 90                	xchg   ax,ax
 100262b:	90                   	nop

0100262c <strlen>:
strlen():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:3
#include <stddef.h>

size_t strlen(const char* str) {
 100262c:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:5
          size_t ret = 0;
        while ( str[ret] != 0 )
 1002630:	80 3a 00             	cmp    BYTE PTR [edx],0x0
 1002633:	74 10                	je     1002645 <strlen+0x19>
 1002635:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:6
                ret++;
 100263a:	83 c0 01             	add    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:5
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
 100263d:	80 3c 02 00          	cmp    BYTE PTR [edx+eax*1],0x0
 1002641:	75 f7                	jne    100263a <strlen+0xe>
 1002643:	f3 c3                	repz ret 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:4
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
 1002645:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:8
        while ( str[ret] != 0 )
                ret++;
        return ret;
}
 100264a:	c3                   	ret    
 100264b:	90                   	nop

0100264c <strncmp>:
strncmp():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:13
 *   array pointed to by `s2'.  [4.11.4.4]
 */
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
 100264c:	57                   	push   edi
 100264d:	56                   	push   esi
 100264e:	53                   	push   ebx
 100264f:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 1002653:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
 1002657:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:14
    for ( ; n > 0; s1++, s2++, --n)
 100265b:	85 db                	test   ebx,ebx
 100265d:	74 41                	je     10026a0 <strncmp+0x54>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:15
	if (*s1 != *s2)
 100265f:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 1002662:	0f b6 0f             	movzx  ecx,BYTE PTR [edi]
 1002665:	38 ca                	cmp    dl,cl
 1002667:	75 1c                	jne    1002685 <strncmp+0x39>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:17
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
 1002669:	84 d2                	test   dl,dl
 100266b:	74 3a                	je     10026a7 <strncmp+0x5b>
 100266d:	83 eb 01             	sub    ebx,0x1
 1002670:	b8 00 00 00 00       	mov    eax,0x0
 1002675:	eb 1e                	jmp    1002695 <strncmp+0x49>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:15
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
	if (*s1 != *s2)
 1002677:	0f b6 54 06 01       	movzx  edx,BYTE PTR [esi+eax*1+0x1]
 100267c:	0f b6 4c 07 01       	movzx  ecx,BYTE PTR [edi+eax*1+0x1]
 1002681:	38 ca                	cmp    dl,cl
 1002683:	74 09                	je     100268e <strncmp+0x42>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:16
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
 1002685:	38 ca                	cmp    dl,cl
 1002687:	19 c0                	sbb    eax,eax
 1002689:	83 c8 01             	or     eax,0x1
 100268c:	eb 25                	jmp    10026b3 <strncmp+0x67>
 100268e:	83 c0 01             	add    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:17
	else if (*s1 == '\0')
 1002691:	84 d2                	test   dl,dl
 1002693:	74 19                	je     10026ae <strncmp+0x62>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:14
 */
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
 1002695:	39 d8                	cmp    eax,ebx
 1002697:	75 de                	jne    1002677 <strncmp+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:19
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
    return 0;
 1002699:	b8 00 00 00 00       	mov    eax,0x0
 100269e:	eb 13                	jmp    10026b3 <strncmp+0x67>
 10026a0:	b8 00 00 00 00       	mov    eax,0x0
 10026a5:	eb 0c                	jmp    10026b3 <strncmp+0x67>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:18
{
    for ( ; n > 0; s1++, s2++, --n)
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
 10026a7:	b8 00 00 00 00       	mov    eax,0x0
 10026ac:	eb 05                	jmp    10026b3 <strncmp+0x67>
 10026ae:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:20
    return 0;
}
 10026b3:	5b                   	pop    ebx
 10026b4:	5e                   	pop    esi
 10026b5:	5f                   	pop    edi
 10026b6:	c3                   	ret    
 10026b7:	90                   	nop

010026b8 <strncpy>:
strncpy():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:14
 *   The `strncpy' function returns the value of `s1'.  [4.11.2.4]
 */
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
 10026b8:	56                   	push   esi
 10026b9:	53                   	push   ebx
 10026ba:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
 10026be:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10026c2:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
 10026c6:	85 c9                	test   ecx,ecx
 10026c8:	74 33                	je     10026fd <strncpy+0x45>
 10026ca:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 10026cd:	84 c0                	test   al,al
 10026cf:	74 26                	je     10026f7 <strncpy+0x3f>
 10026d1:	89 f2                	mov    edx,esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:17
	*s++ = *s2++;
 10026d3:	83 c2 01             	add    edx,0x1
 10026d6:	83 c3 01             	add    ebx,0x1
 10026d9:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
 10026dc:	83 e9 01             	sub    ecx,0x1
 10026df:	74 1c                	je     10026fd <strncpy+0x45>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16 (discriminator 1)
 10026e1:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 10026e4:	84 c0                	test   al,al
 10026e6:	75 eb                	jne    10026d3 <strncpy+0x1b>
 10026e8:	eb 0f                	jmp    10026f9 <strncpy+0x41>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:21
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
	*s++ = '\0';
 10026ea:	83 c2 01             	add    edx,0x1
 10026ed:	c6 42 ff 00          	mov    BYTE PTR [edx-0x1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:20
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
 10026f1:	39 d1                	cmp    ecx,edx
 10026f3:	75 f5                	jne    10026ea <strncpy+0x32>
 10026f5:	eb 06                	jmp    10026fd <strncpy+0x45>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:15
 */
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
 10026f7:	89 f2                	mov    edx,esi
 10026f9:	01 d1                	add    ecx,edx
 10026fb:	eb ed                	jmp    10026ea <strncpy+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:25
    while (n > 0) {
	*s++ = '\0';
	--n;
    }
    return s1;
}
 10026fd:	89 f0                	mov    eax,esi
 10026ff:	5b                   	pop    ebx
 1002700:	5e                   	pop    esi
 1002701:	c3                   	ret    
 1002702:	66 90                	xchg   ax,ax

01002704 <strleft>:
strleft():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strparts.c:2
char* strleft(char* val, int cnt)
{
 1002704:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strparts.c:3
    val[cnt]='\0';
 1002708:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 100270c:	c6 04 10 00          	mov    BYTE PTR [eax+edx*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strparts.c:5
    return val;
}
 1002710:	c3                   	ret    
 1002711:	66 90                	xchg   ax,ax
 1002713:	90                   	nop

01002714 <time>:
time():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:84
};

extern time_t kSystemCurrentTime;
time_t time(time_t* arg)
{
    *arg = kSystemCurrentTime;
 1002714:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1002718:	8b 15 8c 02 12 00    	mov    edx,DWORD PTR ds:0x12028c
 100271e:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:86
    return kSystemCurrentTime;
}
 1002720:	a1 8c 02 12 00       	mov    eax,ds:0x12028c
 1002725:	c3                   	ret    

01002726 <gmtime_r>:
gmtime_r():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:88

struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
 1002726:	55                   	push   ebp
 1002727:	57                   	push   edi
 1002728:	56                   	push   esi
 1002729:	53                   	push   ebx
 100272a:	83 ec 08             	sub    esp,0x8
 100272d:	8b 74 24 20          	mov    esi,DWORD PTR [esp+0x20]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:93
  time_t time = *timer;
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;

  dayclock = (unsigned long) time % SECS_DAY;
 1002731:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1002735:	8b 18                	mov    ebx,DWORD PTR [eax]
 1002737:	ba 07 45 2e c2       	mov    edx,0xc22e4507
 100273c:	89 d8                	mov    eax,ebx
 100273e:	f7 e2                	mul    edx
 1002740:	89 d1                	mov    ecx,edx
 1002742:	c1 e9 10             	shr    ecx,0x10
 1002745:	69 c9 80 51 01 00    	imul   ecx,ecx,0x15180
 100274b:	29 cb                	sub    ebx,ecx
 100274d:	89 d9                	mov    ecx,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:94
  dayno = (unsigned long) time / SECS_DAY;
 100274f:	89 d3                	mov    ebx,edx
 1002751:	c1 eb 10             	shr    ebx,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:96

  tmbuf->tm_sec = dayclock % 60;
 1002754:	bd 89 88 88 88       	mov    ebp,0x88888889
 1002759:	89 c8                	mov    eax,ecx
 100275b:	f7 e5                	mul    ebp
 100275d:	c1 ea 05             	shr    edx,0x5
 1002760:	6b d2 3c             	imul   edx,edx,0x3c
 1002763:	89 c8                	mov    eax,ecx
 1002765:	29 d0                	sub    eax,edx
 1002767:	89 06                	mov    DWORD PTR [esi],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:97
  tmbuf->tm_min = (dayclock % 3600) / 60;
 1002769:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
 100276e:	89 c8                	mov    eax,ecx
 1002770:	f7 e2                	mul    edx
 1002772:	89 d7                	mov    edi,edx
 1002774:	c1 ef 0b             	shr    edi,0xb
 1002777:	69 c7 10 0e 00 00    	imul   eax,edi,0xe10
 100277d:	29 c1                	sub    ecx,eax
 100277f:	89 c8                	mov    eax,ecx
 1002781:	f7 e5                	mul    ebp
 1002783:	89 d1                	mov    ecx,edx
 1002785:	c1 e9 05             	shr    ecx,0x5
 1002788:	89 4e 04             	mov    DWORD PTR [esi+0x4],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:98
  tmbuf->tm_hour = dayclock / 3600;
 100278b:	89 7e 08             	mov    DWORD PTR [esi+0x8],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:99
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
 100278e:	8d 4b 04             	lea    ecx,[ebx+0x4]
 1002791:	ba 25 49 92 24       	mov    edx,0x24924925
 1002796:	89 c8                	mov    eax,ecx
 1002798:	f7 e2                	mul    edx
 100279a:	89 c8                	mov    eax,ecx
 100279c:	29 d0                	sub    eax,edx
 100279e:	d1 e8                	shr    eax,1
 10027a0:	01 c2                	add    edx,eax
 10027a2:	c1 ea 02             	shr    edx,0x2
 10027a5:	8d 04 d5 00 00 00 00 	lea    eax,[edx*8+0x0]
 10027ac:	29 d0                	sub    eax,edx
 10027ae:	29 c1                	sub    ecx,eax
 10027b0:	89 4e 18             	mov    DWORD PTR [esi+0x18],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:91
}

struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
  time_t time = *timer;
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;
 10027b3:	b9 b2 07 00 00       	mov    ecx,0x7b2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 10027b8:	bd 1f 85 eb 51       	mov    ebp,0x51eb851f
 10027bd:	eb 53                	jmp    1002812 <gmtime_r+0xec>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 1)
    dayno -= YEARSIZE(year);
 10027bf:	89 c8                	mov    eax,ecx
 10027c1:	f7 ed                	imul   ebp
 10027c3:	c1 fa 05             	sar    edx,0x5
 10027c6:	89 c8                	mov    eax,ecx
 10027c8:	c1 f8 1f             	sar    eax,0x1f
 10027cb:	29 c2                	sub    edx,eax
 10027cd:	6b d2 64             	imul   edx,edx,0x64
 10027d0:	39 d1                	cmp    ecx,edx
 10027d2:	75 26                	jne    10027fa <gmtime_r+0xd4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 4)
 10027d4:	89 c8                	mov    eax,ecx
 10027d6:	f7 ed                	imul   ebp
 10027d8:	c1 fa 07             	sar    edx,0x7
 10027db:	89 c8                	mov    eax,ecx
 10027dd:	c1 f8 1f             	sar    eax,0x1f
 10027e0:	29 c2                	sub    edx,eax
 10027e2:	69 c2 90 01 00 00    	imul   eax,edx,0x190
 10027e8:	89 cf                	mov    edi,ecx
 10027ea:	29 c7                	sub    edi,eax
 10027ec:	83 ff 01             	cmp    edi,0x1
 10027ef:	19 c0                	sbb    eax,eax
 10027f1:	f7 d0                	not    eax
 10027f3:	05 6e 01 00 00       	add    eax,0x16e
 10027f8:	eb 13                	jmp    100280d <gmtime_r+0xe7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101
 10027fa:	b8 6e 01 00 00       	mov    eax,0x16e
 10027ff:	eb 0c                	jmp    100280d <gmtime_r+0xe7>
 1002801:	b8 6d 01 00 00       	mov    eax,0x16d
 1002806:	eb 05                	jmp    100280d <gmtime_r+0xe7>
 1002808:	b8 6e 01 00 00       	mov    eax,0x16e
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 8)
 100280d:	29 c3                	sub    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:102 (discriminator 8)
    year++;
 100280f:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 1002812:	89 cf                	mov    edi,ecx
 1002814:	83 e7 03             	and    edi,0x3
 1002817:	0f 85 d5 00 00 00    	jne    10028f2 <gmtime_r+0x1cc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100 (discriminator 1)
 100281d:	89 c8                	mov    eax,ecx
 100281f:	f7 ed                	imul   ebp
 1002821:	c1 fa 05             	sar    edx,0x5
 1002824:	89 c8                	mov    eax,ecx
 1002826:	c1 f8 1f             	sar    eax,0x1f
 1002829:	29 c2                	sub    edx,eax
 100282b:	6b d2 64             	imul   edx,edx,0x64
 100282e:	39 d1                	cmp    ecx,edx
 1002830:	0f 85 0a 01 00 00    	jne    1002940 <gmtime_r+0x21a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100 (discriminator 4)
 1002836:	89 c8                	mov    eax,ecx
 1002838:	f7 ed                	imul   ebp
 100283a:	c1 fa 07             	sar    edx,0x7
 100283d:	89 c8                	mov    eax,ecx
 100283f:	c1 f8 1f             	sar    eax,0x1f
 1002842:	29 c2                	sub    edx,eax
 1002844:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 100284a:	39 d1                	cmp    ecx,edx
 100284c:	0f 84 03 01 00 00    	je     1002955 <gmtime_r+0x22f>
 1002852:	e9 b0 00 00 00       	jmp    1002907 <gmtime_r+0x1e1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:104
    dayno -= YEARSIZE(year);
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
 1002857:	8d 81 94 f8 ff ff    	lea    eax,[ecx-0x76c]
 100285d:	89 46 14             	mov    DWORD PTR [esi+0x14],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:105
  tmbuf->tm_yday = dayno;
 1002860:	89 5e 1c             	mov    DWORD PTR [esi+0x1c],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:106
  tmbuf->tm_mon = 0;
 1002863:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
 100286a:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
 100286f:	89 c8                	mov    eax,ecx
 1002871:	f7 ea                	imul   edx
 1002873:	89 d5                	mov    ebp,edx
 1002875:	c1 fd 05             	sar    ebp,0x5
 1002878:	89 c8                	mov    eax,ecx
 100287a:	c1 f8 1f             	sar    eax,0x1f
 100287d:	29 c5                	sub    ebp,eax
 100287f:	6b ed 64             	imul   ebp,ebp,0x64
 1002882:	89 cf                	mov    edi,ecx
 1002884:	29 ef                	sub    edi,ebp
 1002886:	89 fd                	mov    ebp,edi
 1002888:	c1 fa 07             	sar    edx,0x7
 100288b:	29 c2                	sub    edx,eax
 100288d:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002893:	29 d1                	sub    ecx,edx
 1002895:	89 0c 24             	mov    DWORD PTR [esp],ecx
 1002898:	8b 7c 24 04          	mov    edi,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 100289c:	eb 40                	jmp    10028de <gmtime_r+0x1b8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 1)
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
 100289e:	85 ed                	test   ebp,ebp
 10028a0:	75 0d                	jne    10028af <gmtime_r+0x189>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 4)
 10028a2:	83 3c 24 00          	cmp    DWORD PTR [esp],0x0
 10028a6:	74 0e                	je     10028b6 <gmtime_r+0x190>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 6)
 10028a8:	ba 00 00 00 00       	mov    edx,0x0
 10028ad:	eb 1a                	jmp    10028c9 <gmtime_r+0x1a3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108
 10028af:	ba 01 00 00 00       	mov    edx,0x1
 10028b4:	eb 13                	jmp    10028c9 <gmtime_r+0x1a3>
 10028b6:	ba 01 00 00 00       	mov    edx,0x1
 10028bb:	eb 0c                	jmp    10028c9 <gmtime_r+0x1a3>
 10028bd:	ba 01 00 00 00       	mov    edx,0x1
 10028c2:	eb 05                	jmp    10028c9 <gmtime_r+0x1a3>
 10028c4:	ba 01 00 00 00       	mov    edx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 8)
 10028c9:	8d 0c 12             	lea    ecx,[edx+edx*1]
 10028cc:	01 ca                	add    edx,ecx
 10028ce:	8d 14 90             	lea    edx,[eax+edx*4]
 10028d1:	2b 1c 95 00 50 00 01 	sub    ebx,DWORD PTR [edx*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:109 (discriminator 8)
    tmbuf->tm_mon++;
 10028d8:	83 c0 01             	add    eax,0x1
 10028db:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 10028de:	85 ff                	test   edi,edi
 10028e0:	75 4c                	jne    100292e <gmtime_r+0x208>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107 (discriminator 1)
 10028e2:	85 ed                	test   ebp,ebp
 10028e4:	0f 85 92 00 00 00    	jne    100297c <gmtime_r+0x256>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107 (discriminator 4)
 10028ea:	83 3c 24 00          	cmp    DWORD PTR [esp],0x0
 10028ee:	74 7a                	je     100296a <gmtime_r+0x244>
 10028f0:	eb 2a                	jmp    100291c <gmtime_r+0x1f6>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 10028f2:	81 fb 6c 01 00 00    	cmp    ebx,0x16c
 10028f8:	0f 87 03 ff ff ff    	ja     1002801 <gmtime_r+0xdb>
 10028fe:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 1002902:	e9 50 ff ff ff       	jmp    1002857 <gmtime_r+0x131>
 1002907:	81 fb 6c 01 00 00    	cmp    ebx,0x16c
 100290d:	0f 87 ac fe ff ff    	ja     10027bf <gmtime_r+0x99>
 1002913:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 1002917:	e9 3b ff ff ff       	jmp    1002857 <gmtime_r+0x131>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 100291c:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 100291f:	3b 1c 85 00 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005000]
 1002926:	0f 83 72 ff ff ff    	jae    100289e <gmtime_r+0x178>
 100292c:	eb 5e                	jmp    100298c <gmtime_r+0x266>
 100292e:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 1002931:	3b 1c 85 00 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005000]
 1002938:	0f 83 6a ff ff ff    	jae    10028a8 <gmtime_r+0x182>
 100293e:	eb 4c                	jmp    100298c <gmtime_r+0x266>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 1002940:	81 fb 6d 01 00 00    	cmp    ebx,0x16d
 1002946:	0f 87 bc fe ff ff    	ja     1002808 <gmtime_r+0xe2>
 100294c:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 1002950:	e9 02 ff ff ff       	jmp    1002857 <gmtime_r+0x131>
 1002955:	81 fb 6d 01 00 00    	cmp    ebx,0x16d
 100295b:	0f 87 73 fe ff ff    	ja     10027d4 <gmtime_r+0xae>
 1002961:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 1002965:	e9 ed fe ff ff       	jmp    1002857 <gmtime_r+0x131>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 100296a:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 100296d:	3b 1c 85 30 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005030]
 1002974:	0f 83 43 ff ff ff    	jae    10028bd <gmtime_r+0x197>
 100297a:	eb 10                	jmp    100298c <gmtime_r+0x266>
 100297c:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 100297f:	3b 1c 85 30 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005030]
 1002986:	0f 83 38 ff ff ff    	jae    10028c4 <gmtime_r+0x19e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:111
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
    tmbuf->tm_mon++;
  }
  tmbuf->tm_mday = dayno + 1;
 100298c:	83 c3 01             	add    ebx,0x1
 100298f:	89 5e 0c             	mov    DWORD PTR [esi+0xc],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:112
  tmbuf->tm_isdst = 0;
 1002992:	c7 46 20 00 00 00 00 	mov    DWORD PTR [esi+0x20],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:114
  return tmbuf;
}
 1002999:	89 f0                	mov    eax,esi
 100299b:	83 c4 08             	add    esp,0x8
 100299e:	5b                   	pop    ebx
 100299f:	5e                   	pop    esi
 10029a0:	5f                   	pop    edi
 10029a1:	5d                   	pop    ebp
 10029a2:	c3                   	ret    

010029a3 <localtime>:
localtime():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:116

struct tm *localtime(const time_t *timer) {
 10029a3:	83 ec 30             	sub    esp,0x30
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:120
  time_t t;
  struct tm tmbuf;
  
  t = *timer - kTimeZone;
 10029a6:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
 10029aa:	8b 00                	mov    eax,DWORD PTR [eax]
 10029ac:	2b 05 90 02 12 00    	sub    eax,DWORD PTR ds:0x120290
 10029b2:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:121
  return gmtime_r(&t, &tmbuf);
 10029b6:	54                   	push   esp
 10029b7:	8d 44 24 30          	lea    eax,[esp+0x30]
 10029bb:	50                   	push   eax
 10029bc:	e8 65 fd ff ff       	call   1002726 <gmtime_r>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:122
}
 10029c1:	83 c4 38             	add    esp,0x38
 10029c4:	c3                   	ret    

010029c5 <localtime_r>:
localtime_r():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:124

struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
 10029c5:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:127
  time_t t;

  t = *timer - kTimeZone;
 10029c8:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
 10029cc:	8b 00                	mov    eax,DWORD PTR [eax]
 10029ce:	2b 05 90 02 12 00    	sub    eax,DWORD PTR ds:0x120290
 10029d4:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:128
  return gmtime_r(&t, tmbuf);
 10029d8:	ff 74 24 18          	push   DWORD PTR [esp+0x18]
 10029dc:	8d 44 24 10          	lea    eax,[esp+0x10]
 10029e0:	50                   	push   eax
 10029e1:	e8 40 fd ff ff       	call   1002726 <gmtime_r>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:129
}
 10029e6:	83 c4 18             	add    esp,0x18
 10029e9:	c3                   	ret    

010029ea <mktime>:
mktime():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:131

time_t mktime(struct tm *tmbuf) {
 10029ea:	55                   	push   ebp
 10029eb:	57                   	push   edi
 10029ec:	56                   	push   esi
 10029ed:	53                   	push   ebx
 10029ee:	83 ec 20             	sub    esp,0x20
 10029f1:	8b 5c 24 34          	mov    ebx,DWORD PTR [esp+0x34]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:139
  int yday, month;
  /*unsigned*/ long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
 10029f5:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 10029f7:	ba 89 88 88 88       	mov    edx,0x88888889
 10029fc:	89 c8                	mov    eax,ecx
 10029fe:	f7 ea                	imul   edx
 1002a00:	8d 04 0a             	lea    eax,[edx+ecx*1]
 1002a03:	c1 f8 05             	sar    eax,0x5
 1002a06:	89 ca                	mov    edx,ecx
 1002a08:	c1 fa 1f             	sar    edx,0x1f
 1002a0b:	29 d0                	sub    eax,edx
 1002a0d:	89 c2                	mov    edx,eax
 1002a0f:	03 53 04             	add    edx,DWORD PTR [ebx+0x4]
 1002a12:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:140
  tmbuf->tm_sec %= 60;
 1002a15:	6b c0 3c             	imul   eax,eax,0x3c
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:141
  if (tmbuf->tm_sec < 0) {
 1002a18:	29 c1                	sub    ecx,eax
 1002a1a:	78 04                	js     1002a20 <mktime+0x36>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:140
  /*unsigned*/ long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
  tmbuf->tm_sec %= 60;
 1002a1c:	89 0b                	mov    DWORD PTR [ebx],ecx
 1002a1e:	eb 0b                	jmp    1002a2b <mktime+0x41>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:142
  if (tmbuf->tm_sec < 0) {
    tmbuf->tm_sec += 60;
 1002a20:	83 c1 3c             	add    ecx,0x3c
 1002a23:	89 0b                	mov    DWORD PTR [ebx],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:143
    tmbuf->tm_min--;
 1002a25:	83 ea 01             	sub    edx,0x1
 1002a28:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:145
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
 1002a2b:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
 1002a2e:	ba 89 88 88 88       	mov    edx,0x88888889
 1002a33:	89 c8                	mov    eax,ecx
 1002a35:	f7 ea                	imul   edx
 1002a37:	8d 04 0a             	lea    eax,[edx+ecx*1]
 1002a3a:	c1 f8 05             	sar    eax,0x5
 1002a3d:	89 ca                	mov    edx,ecx
 1002a3f:	c1 fa 1f             	sar    edx,0x1f
 1002a42:	29 d0                	sub    eax,edx
 1002a44:	89 c2                	mov    edx,eax
 1002a46:	03 53 08             	add    edx,DWORD PTR [ebx+0x8]
 1002a49:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:146
  tmbuf->tm_min = tmbuf->tm_min % 60;
 1002a4c:	6b c0 3c             	imul   eax,eax,0x3c
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:147
  if (tmbuf->tm_min < 0) {
 1002a4f:	29 c1                	sub    ecx,eax
 1002a51:	78 05                	js     1002a58 <mktime+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:146
  if (tmbuf->tm_sec < 0) {
    tmbuf->tm_sec += 60;
    tmbuf->tm_min--;
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
  tmbuf->tm_min = tmbuf->tm_min % 60;
 1002a53:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
 1002a56:	eb 0c                	jmp    1002a64 <mktime+0x7a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:148
  if (tmbuf->tm_min < 0) {
    tmbuf->tm_min += 60;
 1002a58:	83 c1 3c             	add    ecx,0x3c
 1002a5b:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:149
    tmbuf->tm_hour--;
 1002a5e:	83 ea 01             	sub    edx,0x1
 1002a61:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:151
  }
  day = tmbuf->tm_hour / 24;
 1002a64:	8b 73 08             	mov    esi,DWORD PTR [ebx+0x8]
 1002a67:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
 1002a6c:	89 f0                	mov    eax,esi
 1002a6e:	f7 ea                	imul   edx
 1002a70:	c1 fa 02             	sar    edx,0x2
 1002a73:	89 f0                	mov    eax,esi
 1002a75:	c1 f8 1f             	sar    eax,0x1f
 1002a78:	89 d1                	mov    ecx,edx
 1002a7a:	29 c1                	sub    ecx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:152
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
 1002a7c:	8d 04 49             	lea    eax,[ecx+ecx*2]
 1002a7f:	c1 e0 03             	shl    eax,0x3
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:153
  if (tmbuf->tm_hour < 0) {
 1002a82:	29 c6                	sub    esi,eax
 1002a84:	78 05                	js     1002a8b <mktime+0xa1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:152
  if (tmbuf->tm_min < 0) {
    tmbuf->tm_min += 60;
    tmbuf->tm_hour--;
  }
  day = tmbuf->tm_hour / 24;
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
 1002a86:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
 1002a89:	eb 09                	jmp    1002a94 <mktime+0xaa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:154
  if (tmbuf->tm_hour < 0) {
    tmbuf->tm_hour += 24;
 1002a8b:	83 c6 18             	add    esi,0x18
 1002a8e:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:155
    day--;
 1002a91:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:157
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
 1002a94:	8b 73 10             	mov    esi,DWORD PTR [ebx+0x10]
 1002a97:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
 1002a9c:	89 f0                	mov    eax,esi
 1002a9e:	f7 ea                	imul   edx
 1002aa0:	d1 fa                	sar    edx,1
 1002aa2:	89 f0                	mov    eax,esi
 1002aa4:	c1 f8 1f             	sar    eax,0x1f
 1002aa7:	29 c2                	sub    edx,eax
 1002aa9:	89 d0                	mov    eax,edx
 1002aab:	03 43 14             	add    eax,DWORD PTR [ebx+0x14]
 1002aae:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:158
  tmbuf->tm_mon %= 12;
 1002ab1:	8d 14 52             	lea    edx,[edx+edx*2]
 1002ab4:	c1 e2 02             	shl    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:159
  if (tmbuf->tm_mon < 0) {
 1002ab7:	29 d6                	sub    esi,edx
 1002ab9:	78 05                	js     1002ac0 <mktime+0xd6>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:158
  if (tmbuf->tm_hour < 0) {
    tmbuf->tm_hour += 24;
    day--;
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
  tmbuf->tm_mon %= 12;
 1002abb:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
 1002abe:	eb 0c                	jmp    1002acc <mktime+0xe2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:160
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
 1002ac0:	83 c6 0c             	add    esi,0xc
 1002ac3:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:161
    tmbuf->tm_year--;
 1002ac6:	83 e8 01             	sub    eax,0x1
 1002ac9:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:163
  }
  day += (tmbuf->tm_mday - 1);
 1002acc:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
 1002acf:	8d 6c 01 ff          	lea    ebp,[ecx+eax*1-0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:164
  while (day < 0) {
 1002ad3:	85 ed                	test   ebp,ebp
 1002ad5:	0f 89 f1 00 00 00    	jns    1002bcc <mktime+0x1e2>
 1002adb:	8b 73 10             	mov    esi,DWORD PTR [ebx+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169
    if(--tmbuf->tm_mon < 0) {
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002ade:	bf 1f 85 eb 51       	mov    edi,0x51eb851f
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:165
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
    if(--tmbuf->tm_mon < 0) {
 1002ae3:	83 ee 01             	sub    esi,0x1
 1002ae6:	79 09                	jns    1002af1 <mktime+0x107>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:166
      tmbuf->tm_year--;
 1002ae8:	83 6b 14 01          	sub    DWORD PTR [ebx+0x14],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:167
      tmbuf->tm_mon = 11;
 1002aec:	be 0b 00 00 00       	mov    esi,0xb
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002af1:	8b 4b 14             	mov    ecx,DWORD PTR [ebx+0x14]
 1002af4:	b8 00 00 00 00       	mov    eax,0x0
 1002af9:	f6 c1 03             	test   cl,0x3
 1002afc:	75 3c                	jne    1002b3a <mktime+0x150>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 1)
 1002afe:	81 c1 6c 07 00 00    	add    ecx,0x76c
 1002b04:	89 c8                	mov    eax,ecx
 1002b06:	f7 ef                	imul   edi
 1002b08:	c1 fa 05             	sar    edx,0x5
 1002b0b:	89 c8                	mov    eax,ecx
 1002b0d:	c1 f8 1f             	sar    eax,0x1f
 1002b10:	29 c2                	sub    edx,eax
 1002b12:	6b d2 64             	imul   edx,edx,0x64
 1002b15:	b8 01 00 00 00       	mov    eax,0x1
 1002b1a:	39 d1                	cmp    ecx,edx
 1002b1c:	75 1c                	jne    1002b3a <mktime+0x150>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 4)
 1002b1e:	89 c8                	mov    eax,ecx
 1002b20:	f7 ef                	imul   edi
 1002b22:	c1 fa 07             	sar    edx,0x7
 1002b25:	89 c8                	mov    eax,ecx
 1002b27:	c1 f8 1f             	sar    eax,0x1f
 1002b2a:	29 c2                	sub    edx,eax
 1002b2c:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002b32:	39 d1                	cmp    ecx,edx
 1002b34:	0f 94 c0             	sete   al
 1002b37:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 8)
 1002b3a:	8d 14 00             	lea    edx,[eax+eax*1]
 1002b3d:	01 d0                	add    eax,edx
 1002b3f:	8d 04 86             	lea    eax,[esi+eax*4]
 1002b42:	03 2c 85 00 50 00 01 	add    ebp,DWORD PTR [eax*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:164 (discriminator 8)
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
 1002b49:	85 ed                	test   ebp,ebp
 1002b4b:	78 96                	js     1002ae3 <mktime+0xf9>
 1002b4d:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
 1002b50:	eb 7a                	jmp    1002bcc <mktime+0x1e2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 1)
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002b52:	8d be 6c 07 00 00    	lea    edi,[esi+0x76c]
 1002b58:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002b5d:	f7 ef                	imul   edi
 1002b5f:	c1 fa 05             	sar    edx,0x5
 1002b62:	89 f8                	mov    eax,edi
 1002b64:	c1 f8 1f             	sar    eax,0x1f
 1002b67:	29 c2                	sub    edx,eax
 1002b69:	6b d2 64             	imul   edx,edx,0x64
 1002b6c:	39 d7                	cmp    edi,edx
 1002b6e:	75 27                	jne    1002b97 <mktime+0x1ad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 4)
 1002b70:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002b75:	f7 ef                	imul   edi
 1002b77:	c1 fa 07             	sar    edx,0x7
 1002b7a:	89 f8                	mov    eax,edi
 1002b7c:	c1 f8 1f             	sar    eax,0x1f
 1002b7f:	29 c2                	sub    edx,eax
 1002b81:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002b87:	b8 01 00 00 00       	mov    eax,0x1
 1002b8c:	39 d7                	cmp    edi,edx
 1002b8e:	74 13                	je     1002ba3 <mktime+0x1b9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 6)
 1002b90:	b8 00 00 00 00       	mov    eax,0x0
 1002b95:	eb 0c                	jmp    1002ba3 <mktime+0x1b9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172
 1002b97:	b8 01 00 00 00       	mov    eax,0x1
 1002b9c:	eb 05                	jmp    1002ba3 <mktime+0x1b9>
 1002b9e:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 8)
 1002ba3:	8d 14 00             	lea    edx,[eax+eax*1]
 1002ba6:	01 d0                	add    eax,edx
 1002ba8:	8d 04 81             	lea    eax,[ecx+eax*4]
 1002bab:	2b 2c 85 00 50 00 01 	sub    ebp,DWORD PTR [eax*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:173 (discriminator 8)
    if (++(tmbuf->tm_mon) == 12) {
 1002bb2:	83 c1 01             	add    ecx,0x1
 1002bb5:	83 f9 0c             	cmp    ecx,0xc
 1002bb8:	74 05                	je     1002bbf <mktime+0x1d5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:173
 1002bba:	89 4b 10             	mov    DWORD PTR [ebx+0x10],ecx
 1002bbd:	eb 0d                	jmp    1002bcc <mktime+0x1e2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:174
      tmbuf->tm_mon = 0;
 1002bbf:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:175
      tmbuf->tm_year++;
 1002bc6:	83 c6 01             	add    esi,0x1
 1002bc9:	89 73 14             	mov    DWORD PTR [ebx+0x14],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002bcc:	8b 73 14             	mov    esi,DWORD PTR [ebx+0x14]
 1002bcf:	f7 c6 03 00 00 00    	test   esi,0x3
 1002bd5:	0f 85 ad 02 00 00    	jne    1002e88 <mktime+0x49e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171 (discriminator 1)
 1002bdb:	8d 8e 6c 07 00 00    	lea    ecx,[esi+0x76c]
 1002be1:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002be6:	f7 e9                	imul   ecx
 1002be8:	c1 fa 05             	sar    edx,0x5
 1002beb:	89 c8                	mov    eax,ecx
 1002bed:	c1 f8 1f             	sar    eax,0x1f
 1002bf0:	29 c2                	sub    edx,eax
 1002bf2:	6b d2 64             	imul   edx,edx,0x64
 1002bf5:	39 d1                	cmp    ecx,edx
 1002bf7:	0f 85 b5 02 00 00    	jne    1002eb2 <mktime+0x4c8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171 (discriminator 4)
 1002bfd:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002c02:	f7 e9                	imul   ecx
 1002c04:	c1 fa 07             	sar    edx,0x7
 1002c07:	89 c8                	mov    eax,ecx
 1002c09:	c1 f8 1f             	sar    eax,0x1f
 1002c0c:	29 c2                	sub    edx,eax
 1002c0e:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002c14:	39 d1                	cmp    ecx,edx
 1002c16:	0f 84 b6 02 00 00    	je     1002ed2 <mktime+0x4e8>
 1002c1c:	e9 7c 02 00 00       	jmp    1002e9d <mktime+0x4b3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:178
    if (++(tmbuf->tm_mon) == 12) {
      tmbuf->tm_mon = 0;
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
 1002c21:	8d 45 01             	lea    eax,[ebp+0x1]
 1002c24:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:180
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
 1002c27:	83 fe 45             	cmp    esi,0x45
 1002c2a:	0f 8e 51 02 00 00    	jle    1002e81 <mktime+0x497>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:190
  // Assume that when day becomes negative, there will certainly
  // be overflow on seconds.
  // The check for overflow needs not to be done for leapyears
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;
 1002c30:	8d 86 6c 07 00 00    	lea    eax,[esi+0x76c]
 1002c36:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:192

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
 1002c3a:	8d 46 ba             	lea    eax,[esi-0x46]
 1002c3d:	89 c7                	mov    edi,eax
 1002c3f:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:183
  tmbuf->tm_mday = day + 1;
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
  seconds = 0;
  day = 0;                      // Means days since day 0 now
  overflow = 0;
 1002c43:	3d 7c c6 59 00       	cmp    eax,0x59c67c
 1002c48:	0f 9f c0             	setg   al
 1002c4b:	0f b6 c0             	movzx  eax,al
 1002c4e:	89 c2                	mov    edx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:193
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
  day = (tm_year - year) * 365;
 1002c50:	89 f8                	mov    eax,edi
 1002c52:	69 ff 6d 01 00 00    	imul   edi,edi,0x16d
 1002c58:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:194
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
 1002c5c:	8d 7e bd             	lea    edi,[esi-0x43]
 1002c5f:	85 c0                	test   eax,eax
 1002c61:	0f 49 f8             	cmovns edi,eax
 1002c64:	c1 ff 02             	sar    edi,0x2
 1002c67:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
 1002c6c:	2b 44 24 04          	sub    eax,DWORD PTR [esp+0x4]
 1002c70:	8d 77 01             	lea    esi,[edi+0x1]
 1002c73:	89 14 24             	mov    DWORD PTR [esp],edx
 1002c76:	83 ca 02             	or     edx,0x2
 1002c79:	39 f0                	cmp    eax,esi
 1002c7b:	89 d6                	mov    esi,edx
 1002c7d:	0f 4d 34 24          	cmovge esi,DWORD PTR [esp]
 1002c81:	89 34 24             	mov    DWORD PTR [esp],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:195
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
 1002c84:	b8 00 00 00 00       	mov    eax,0x0
 1002c89:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 1002c8d:	89 d6                	mov    esi,edx
 1002c8f:	83 e6 03             	and    esi,0x3
 1002c92:	89 74 24 1c          	mov    DWORD PTR [esp+0x1c],esi
 1002c96:	74 19                	je     1002cb1 <mktime+0x2c7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:195 (discriminator 1)
 1002c98:	89 d6                	mov    esi,edx
 1002c9a:	c1 fa 1f             	sar    edx,0x1f
 1002c9d:	c1 ea 1e             	shr    edx,0x1e
 1002ca0:	8d 04 16             	lea    eax,[esi+edx*1]
 1002ca3:	83 e0 03             	and    eax,0x3
 1002ca6:	29 d0                	sub    eax,edx
 1002ca8:	83 f8 01             	cmp    eax,0x1
 1002cab:	0f 9e c0             	setle  al
 1002cae:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:195 (discriminator 6)
 1002cb1:	01 c7                	add    edi,eax
 1002cb3:	03 7c 24 04          	add    edi,DWORD PTR [esp+0x4]
 1002cb7:	89 7c 24 10          	mov    DWORD PTR [esp+0x10],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:196 (discriminator 6)
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
 1002cbb:	bf 1f 85 eb 51       	mov    edi,0x51eb851f
 1002cc0:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1002cc4:	f7 ef                	imul   edi
 1002cc6:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
 1002cca:	89 d0                	mov    eax,edx
 1002ccc:	c1 f8 05             	sar    eax,0x5
 1002ccf:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 1002cd3:	89 d6                	mov    esi,edx
 1002cd5:	c1 fe 1f             	sar    esi,0x1f
 1002cd8:	89 74 24 18          	mov    DWORD PTR [esp+0x18],esi
 1002cdc:	29 f0                	sub    eax,esi
 1002cde:	6b c0 64             	imul   eax,eax,0x64
 1002ce1:	29 c2                	sub    edx,eax
 1002ce3:	89 d0                	mov    eax,edx
 1002ce5:	0f 95 44 24 04       	setne  BYTE PTR [esp+0x4]
 1002cea:	0f b6 54 24 04       	movzx  edx,BYTE PTR [esp+0x4]
 1002cef:	83 f8 45             	cmp    eax,0x45
 1002cf2:	0f 9e c0             	setle  al
 1002cf5:	0f b6 c0             	movzx  eax,al
 1002cf8:	89 c6                	mov    esi,eax
 1002cfa:	21 d6                	and    esi,edx
 1002cfc:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1002d00:	f7 ef                	imul   edi
 1002d02:	89 d7                	mov    edi,edx
 1002d04:	c1 ff 05             	sar    edi,0x5
 1002d07:	89 f8                	mov    eax,edi
 1002d09:	8b 7c 24 0c          	mov    edi,DWORD PTR [esp+0xc]
 1002d0d:	c1 ff 1f             	sar    edi,0x1f
 1002d10:	89 7c 24 0c          	mov    DWORD PTR [esp+0xc],edi
 1002d14:	29 f8                	sub    eax,edi
 1002d16:	01 c6                	add    esi,eax
 1002d18:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
 1002d1c:	29 f7                	sub    edi,esi
 1002d1e:	89 fe                	mov    esi,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:197 (discriminator 6)
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);
 1002d20:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
 1002d24:	c1 f8 07             	sar    eax,0x7
 1002d27:	89 c7                	mov    edi,eax
 1002d29:	2b 7c 24 18          	sub    edi,DWORD PTR [esp+0x18]
 1002d2d:	69 c7 90 01 00 00    	imul   eax,edi,0x190
 1002d33:	8b 7c 24 08          	mov    edi,DWORD PTR [esp+0x8]
 1002d37:	29 c7                	sub    edi,eax
 1002d39:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
 1002d3d:	81 ff 71 01 00 00    	cmp    edi,0x171
 1002d43:	0f 9e 44 24 10       	setle  BYTE PTR [esp+0x10]
 1002d48:	85 ff                	test   edi,edi
 1002d4a:	0f 95 c0             	setne  al
 1002d4d:	0f b6 c0             	movzx  eax,al
 1002d50:	23 44 24 10          	and    eax,DWORD PTR [esp+0x10]
 1002d54:	c1 fa 07             	sar    edx,0x7
 1002d57:	2b 54 24 0c          	sub    edx,DWORD PTR [esp+0xc]
 1002d5b:	01 c2                	add    edx,eax
 1002d5d:	8d 04 32             	lea    eax,[edx+esi*1]
 1002d60:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:200 (discriminator 6)

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
 1002d64:	85 c9                	test   ecx,ecx
 1002d66:	7e 46                	jle    1002dae <mktime+0x3c4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:200
 1002d68:	be 00 00 00 00       	mov    esi,0x0
 1002d6d:	bf 00 00 00 00       	mov    edi,0x0
 1002d72:	89 6c 24 10          	mov    DWORD PTR [esp+0x10],ebp
 1002d76:	8b 6c 24 1c          	mov    ebp,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:201
    yday += _ytab[LEAPYEAR(tm_year)][month];
 1002d7a:	b8 00 00 00 00       	mov    eax,0x0
 1002d7f:	85 ed                	test   ebp,ebp
 1002d81:	75 0f                	jne    1002d92 <mktime+0x3a8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:201 (discriminator 4)
 1002d83:	83 7c 24 08 00       	cmp    DWORD PTR [esp+0x8],0x0
 1002d88:	0f 94 c0             	sete   al
 1002d8b:	0a 44 24 04          	or     al,BYTE PTR [esp+0x4]
 1002d8f:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:201 (discriminator 8)
 1002d92:	8d 14 00             	lea    edx,[eax+eax*1]
 1002d95:	01 d0                	add    eax,edx
 1002d97:	8d 04 86             	lea    eax,[esi+eax*4]
 1002d9a:	03 3c 85 00 50 00 01 	add    edi,DWORD PTR [eax*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:202 (discriminator 8)
    month++;
 1002da1:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:200 (discriminator 8)
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
 1002da4:	39 ce                	cmp    esi,ecx
 1002da6:	75 d2                	jne    1002d7a <mktime+0x390>
 1002da8:	8b 6c 24 10          	mov    ebp,DWORD PTR [esp+0x10]
 1002dac:	eb 05                	jmp    1002db3 <mktime+0x3c9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:199
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
 1002dae:	bf 00 00 00 00       	mov    edi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:204
  while (month < tmbuf->tm_mon) {
    yday += _ytab[LEAPYEAR(tm_year)][month];
    month++;
  }
  yday += (tmbuf->tm_mday - 1);
 1002db3:	01 ef                	add    edi,ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:205
  if (day + yday < 0) overflow|=4;
 1002db5:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
 1002db9:	01 fe                	add    esi,edi
 1002dbb:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
 1002dbe:	89 c8                	mov    eax,ecx
 1002dc0:	83 c8 04             	or     eax,0x4
 1002dc3:	85 f6                	test   esi,esi
 1002dc5:	0f 49 c1             	cmovns eax,ecx
 1002dc8:	89 c5                	mov    ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:208
  day += yday;

  tmbuf->tm_yday = yday;
 1002dca:	89 7b 1c             	mov    DWORD PTR [ebx+0x1c],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:209
  tmbuf->tm_wday = (day + 4) % 7;               // Day 0 was thursday (4)
 1002dcd:	8d 4e 04             	lea    ecx,[esi+0x4]
 1002dd0:	ba 93 24 49 92       	mov    edx,0x92492493
 1002dd5:	89 c8                	mov    eax,ecx
 1002dd7:	f7 ea                	imul   edx
 1002dd9:	01 ca                	add    edx,ecx
 1002ddb:	c1 fa 02             	sar    edx,0x2
 1002dde:	89 c8                	mov    eax,ecx
 1002de0:	c1 f8 1f             	sar    eax,0x1f
 1002de3:	29 c2                	sub    edx,eax
 1002de5:	8d 04 d5 00 00 00 00 	lea    eax,[edx*8+0x0]
 1002dec:	29 d0                	sub    eax,edx
 1002dee:	29 c1                	sub    ecx,eax
 1002df0:	89 4b 18             	mov    DWORD PTR [ebx+0x18],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:211

  seconds = ((tmbuf->tm_hour * 60L) + tmbuf->tm_min) * 60L + tmbuf->tm_sec;
 1002df3:	6b 4b 08 3c          	imul   ecx,DWORD PTR [ebx+0x8],0x3c
 1002df7:	03 4b 04             	add    ecx,DWORD PTR [ebx+0x4]
 1002dfa:	6b c9 3c             	imul   ecx,ecx,0x3c
 1002dfd:	03 0b                	add    ecx,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:213

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
 1002dff:	bf ff ff ff 7f       	mov    edi,0x7fffffff
 1002e04:	29 cf                	sub    edi,ecx
 1002e06:	ba 07 45 2e c2       	mov    edx,0xc22e4507
 1002e0b:	89 f8                	mov    eax,edi
 1002e0d:	f7 ea                	imul   edx
 1002e0f:	01 fa                	add    edx,edi
 1002e11:	c1 fa 10             	sar    edx,0x10
 1002e14:	c1 ff 1f             	sar    edi,0x1f
 1002e17:	29 fa                	sub    edx,edi
 1002e19:	89 e8                	mov    eax,ebp
 1002e1b:	83 c8 08             	or     eax,0x8
 1002e1e:	39 d6                	cmp    esi,edx
 1002e20:	0f 4e c5             	cmovle eax,ebp
 1002e23:	89 04 24             	mov    DWORD PTR [esp],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:214
  seconds += day * SECS_DAY;
 1002e26:	69 f6 80 51 01 00    	imul   esi,esi,0x15180
 1002e2c:	01 f1                	add    ecx,esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:217

  // Now adjust according to timezone and daylight saving time
  if (((kTimeZone > 0) && (TIME_MAX - kTimeZone < seconds)) || 
 1002e2e:	a1 90 02 12 00       	mov    eax,ds:0x120290
 1002e33:	85 c0                	test   eax,eax
 1002e35:	7e 0b                	jle    1002e42 <mktime+0x458>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:217 (discriminator 1)
 1002e37:	ba ff ff ff 7f       	mov    edx,0x7fffffff
 1002e3c:	29 c2                	sub    edx,eax
 1002e3e:	39 d1                	cmp    ecx,edx
 1002e40:	7f 0c                	jg     1002e4e <mktime+0x464>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:217 (discriminator 3)
 1002e42:	85 c0                	test   eax,eax
 1002e44:	79 0c                	jns    1002e52 <mktime+0x468>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:218
      ((kTimeZone < 0) && (seconds < -kTimeZone))) {
 1002e46:	89 c2                	mov    edx,eax
 1002e48:	f7 da                	neg    edx
 1002e4a:	39 d1                	cmp    ecx,edx
 1002e4c:	7d 04                	jge    1002e52 <mktime+0x468>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:219
          overflow|=16;
 1002e4e:	83 0c 24 10          	or     DWORD PTR [esp],0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:221
  }
  seconds += kTimeZone;
 1002e52:	01 c1                	add    ecx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:224

  if (tmbuf->tm_isdst) {
    dst = _dstbias;
 1002e54:	83 7b 20 00          	cmp    DWORD PTR [ebx+0x20],0x0
 1002e58:	ba 00 00 00 00       	mov    edx,0x0
 1002e5d:	0f 45 15 2c 04 12 00 	cmovne edx,DWORD PTR ds:0x12042c
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:229
  } else {
    dst = 0;
  }

  if (dst > seconds) overflow|=32;        // dst is always non-negative
 1002e64:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 1002e67:	89 d8                	mov    eax,ebx
 1002e69:	83 c8 20             	or     eax,0x20
 1002e6c:	39 ca                	cmp    edx,ecx
 1002e6e:	0f 4e c3             	cmovle eax,ebx
 1002e71:	89 c7                	mov    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:232
  seconds -= dst;

  if (overflow) return (time_t) overflow-2;
 1002e73:	89 f8                	mov    eax,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:235

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
 1002e75:	29 d1                	sub    ecx,edx
 1002e77:	83 e8 02             	sub    eax,0x2
 1002e7a:	85 ff                	test   edi,edi
 1002e7c:	0f 44 c1             	cmove  eax,ecx
 1002e7f:	eb 62                	jmp    1002ee3 <mktime+0x4f9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:180
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
 1002e81:	b8 19 fc ff ff       	mov    eax,0xfffffc19
 1002e86:	eb 5b                	jmp    1002ee3 <mktime+0x4f9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002e88:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e8b:	3b 2c 8d 00 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005000]
 1002e92:	0f 8d f8 fc ff ff    	jge    1002b90 <mktime+0x1a6>
 1002e98:	e9 84 fd ff ff       	jmp    1002c21 <mktime+0x237>
 1002e9d:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002ea0:	3b 2c 8d 00 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005000]
 1002ea7:	0f 8d a5 fc ff ff    	jge    1002b52 <mktime+0x168>
 1002ead:	e9 6f fd ff ff       	jmp    1002c21 <mktime+0x237>
 1002eb2:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002eb5:	3b 2c 8d 30 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005030]
 1002ebc:	0f 8d dc fc ff ff    	jge    1002b9e <mktime+0x1b4>
 1002ec2:	e9 5a fd ff ff       	jmp    1002c21 <mktime+0x237>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002ec7:	8d be 6c 07 00 00    	lea    edi,[esi+0x76c]
 1002ecd:	e9 9e fc ff ff       	jmp    1002b70 <mktime+0x186>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002ed2:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002ed5:	3b 2c 8d 30 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005030]
 1002edc:	7d e9                	jge    1002ec7 <mktime+0x4dd>
 1002ede:	e9 3e fd ff ff       	jmp    1002c21 <mktime+0x237>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:236

  if (overflow) return (time_t) overflow-2;

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
}
 1002ee3:	83 c4 20             	add    esp,0x20
 1002ee6:	5b                   	pop    ebx
 1002ee7:	5e                   	pop    esi
 1002ee8:	5f                   	pop    edi
 1002ee9:	5d                   	pop    ebp
 1002eea:	c3                   	ret    

01002eeb <_strdate>:
_strdate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:241

#if !defined(KERNEL) && !defined(OS_LIB)


char *_strdate(char *s) {
 1002eeb:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:244
  time_t now;

  time(&now);
 1002eee:	8d 44 24 0c          	lea    eax,[esp+0xc]
 1002ef2:	50                   	push   eax
 1002ef3:	e8 1c f8 ff ff       	call   1002714 <time>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:248
  //fix me!
  //  strftime(s, 9, "%D", localtime(&now));
  return s;
}
 1002ef8:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002efc:	83 c4 14             	add    esp,0x14
 1002eff:	c3                   	ret    

01002f00 <_strtime>:
_strtime():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:250

char *_strtime(char *s) {
 1002f00:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:253
  time_t now;

  time(&now);
 1002f03:	8d 44 24 0c          	lea    eax,[esp+0xc]
 1002f07:	50                   	push   eax
 1002f08:	e8 07 f8 ff ff       	call   1002714 <time>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:257
  //fix me
  //  strftime(s, 9, "%T", localtime(&now));
  return s;
}
 1002f0d:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002f11:	83 c4 14             	add    esp,0x14
 1002f14:	c3                   	ret    

01002f15 <waitTicks>:
waitTicks():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:260

void __attribute__((noinline))waitTicks(int TicksToWait)
{
 1002f15:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:262
    //printf("ttw=%u",ttw);
    if (TicksToWait==0)
 1002f19:	85 c0                	test   eax,eax
 1002f1b:	74 09                	je     1002f26 <waitTicks+0x11>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:267 (discriminator 1)
        return;
    //printd(DEBUG_TIMER,"ttw=%08X", TicksToWait);
    do
    {
        __asm("sti\nhlt\n");
 1002f1d:	fb                   	sti    
 1002f1e:	f4                   	hlt    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:268 (discriminator 1)
        TicksToWait--;
 1002f1f:	83 e8 01             	sub    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:269 (discriminator 1)
    } while (TicksToWait>0);
 1002f22:	85 c0                	test   eax,eax
 1002f24:	7f f7                	jg     1002f1d <waitTicks+0x8>
 1002f26:	f3 c3                	repz ret 

01002f28 <wait>:
wait():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:274
    return;
}

void /*__attribute__((noinline))*/wait(int msToWait)
{
 1002f28:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:277
    //printk("msToWait=%u, ticksperms=%u, ticksToWait=%u",msToWait, kTicksPerMS, msToWait*kTicksPerMS);
    //STOPHERE2
    waitTicks(msToWait/kTicksPerMS);
 1002f2c:	99                   	cdq    
 1002f2d:	f7 3d 84 02 12 00    	idiv   DWORD PTR ds:0x120284
 1002f33:	50                   	push   eax
 1002f34:	e8 dc ff ff ff       	call   1002f15 <waitTicks>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:278
}
 1002f39:	83 c4 04             	add    esp,0x4
 1002f3c:	c3                   	ret    

01002f3d <wait3>:
wait3():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:281

void wait3(double msToWait)
{
 1002f3d:	56                   	push   esi
 1002f3e:	53                   	push   ebx
 1002f3f:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:282
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);
 1002f42:	8b 0d 60 02 12 00    	mov    ecx,DWORD PTR ds:0x120260
 1002f48:	8b 19                	mov    ebx,DWORD PTR [ecx]
 1002f4a:	8b 35 80 02 12 00    	mov    esi,DWORD PTR ds:0x120280
 1002f50:	dd 44 24 30          	fld    QWORD PTR [esp+0x30]
 1002f54:	b8 e8 03 00 00       	mov    eax,0x3e8
 1002f59:	ba 00 00 00 00       	mov    edx,0x0
 1002f5e:	f7 f6                	div    esi
 1002f60:	89 04 24             	mov    DWORD PTR [esp],eax
 1002f63:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f6a:	00 
 1002f6b:	df 2c 24             	fild   QWORD PTR [esp]
 1002f6e:	de f9                	fdivp  st(1),st
 1002f70:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1002f73:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f7a:	00 
 1002f7b:	df 2c 24             	fild   QWORD PTR [esp]
 1002f7e:	de c1                	faddp  st(1),st
 1002f80:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002f84:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002f88:	dd 5c 24 18          	fstp   QWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:284

while (endTicks > (double)*kTicksSinceStart)
 1002f8c:	8b 01                	mov    eax,DWORD PTR [ecx]
 1002f8e:	dd 44 24 18          	fld    QWORD PTR [esp+0x18]
 1002f92:	89 04 24             	mov    DWORD PTR [esp],eax
 1002f95:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f9c:	00 
 1002f9d:	df 2c 24             	fild   QWORD PTR [esp]
 1002fa0:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002fa4:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002fa8:	d9 c9                	fxch   st(1)
 1002faa:	df e9                	fucomip st,st(1)
 1002fac:	dd d8                	fstp   st(0)
 1002fae:	76 26                	jbe    1002fd6 <wait3+0x99>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:285
    {__asm__("sti\n hlt\n");}
 1002fb0:	fb                   	sti    
 1002fb1:	f4                   	hlt    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:284

void wait3(double msToWait)
{
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);

while (endTicks > (double)*kTicksSinceStart)
 1002fb2:	8b 01                	mov    eax,DWORD PTR [ecx]
 1002fb4:	dd 44 24 18          	fld    QWORD PTR [esp+0x18]
 1002fb8:	89 04 24             	mov    DWORD PTR [esp],eax
 1002fbb:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002fc2:	00 
 1002fc3:	df 2c 24             	fild   QWORD PTR [esp]
 1002fc6:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002fca:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002fce:	d9 c9                	fxch   st(1)
 1002fd0:	df e9                	fucomip st,st(1)
 1002fd2:	dd d8                	fstp   st(0)
 1002fd4:	77 da                	ja     1002fb0 <wait3+0x73>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:287
    {__asm__("sti\n hlt\n");}
    
}
 1002fd6:	83 c4 24             	add    esp,0x24
 1002fd9:	5b                   	pop    ebx
 1002fda:	5e                   	pop    esi
 1002fdb:	c3                   	ret    

01002fdc <wait2>:
wait2():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:290

void wait2(unsigned msToWait)
{
 1002fdc:	57                   	push   edi
 1002fdd:	56                   	push   esi
 1002fde:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:291
    uint64_t startTicks = *kTicksSinceStart;             //25
 1002fdf:	8b 1d 60 02 12 00    	mov    ebx,DWORD PTR ds:0x120260
 1002fe5:	8b 0b                	mov    ecx,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:292
    unsigned msPerTick = 1000 / kTicksPerSecond;         //18
 1002fe7:	8b 3d 80 02 12 00    	mov    edi,DWORD PTR ds:0x120280
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:294
    uint64_t totalTicksToWait = msToWait/msPerTick;     //4321/18
    uint64_t endTicks = startTicks + totalTicksToWait;
 1002fed:	b8 e8 03 00 00       	mov    eax,0x3e8
 1002ff2:	ba 00 00 00 00       	mov    edx,0x0
 1002ff7:	f7 f7                	div    edi
 1002ff9:	89 c6                	mov    esi,eax
 1002ffb:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 1002fff:	ba 00 00 00 00       	mov    edx,0x0
 1003004:	f7 f6                	div    esi
 1003006:	89 c6                	mov    esi,eax
 1003008:	bf 00 00 00 00       	mov    edi,0x0
 100300d:	89 c8                	mov    eax,ecx
 100300f:	ba 00 00 00 00       	mov    edx,0x0
 1003014:	01 f0                	add    eax,esi
 1003016:	11 fa                	adc    edx,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:296

    if (endTicks < *kTicksSinceStart)
 1003018:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 100301a:	83 fa 00             	cmp    edx,0x0
 100301d:	77 04                	ja     1003023 <wait2+0x47>
 100301f:	39 c8                	cmp    eax,ecx
 1003021:	72 17                	jb     100303a <wait2+0x5e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:304
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
 1003023:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 1003025:	83 fa 00             	cmp    edx,0x0
 1003028:	77 04                	ja     100302e <wait2+0x52>
 100302a:	39 c8                	cmp    eax,ecx
 100302c:	76 0c                	jbe    100303a <wait2+0x5e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:305
    {__asm__("hlt\n");}
 100302e:	f4                   	hlt    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:304
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
 100302f:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 1003031:	83 fa 00             	cmp    edx,0x0
 1003034:	77 f8                	ja     100302e <wait2+0x52>
 1003036:	39 c8                	cmp    eax,ecx
 1003038:	77 f4                	ja     100302e <wait2+0x52>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:307
    {__asm__("hlt\n");}
    //printf("done waiting!\n");
}
 100303a:	5b                   	pop    ebx
 100303b:	5e                   	pop    esi
 100303c:	5f                   	pop    edi
 100303d:	c3                   	ret    
 100303e:	66 90                	xchg   ax,ax

01003040 <kbd_handler_generic>:
kbd_handler_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:38
    kbd_handler_generic();
    return;
}

void kbd_handler_generic()
{
 1003040:	53                   	push   ebx
 1003041:	83 ec 08             	sub    esp,0x8
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1003044:	e4 60                	in     al,0x60
kbd_handler_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:44
    unsigned char lKeyControlVal=0;
    unsigned char rawKey=0;
    unsigned char translatedKeypress=0;
   
    rawKey = inb(KEYB_DATA_PORT);
    kKeyChar = rawKey;//& 0x80;
 1003046:	a2 7c 4a 01 01       	mov    ds:0x1014a7c,al
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:46

    __asm__("cli\n");
 100304b:	fa                   	cli    
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:48
    
    switch(rawKey)  
 100304c:	3c 9d                	cmp    al,0x9d
 100304e:	74 44                	je     1003094 <kbd_handler_generic+0x54>
 1003050:	3c 9d                	cmp    al,0x9d
 1003052:	77 0e                	ja     1003062 <kbd_handler_generic+0x22>
 1003054:	3c 2a                	cmp    al,0x2a
 1003056:	74 18                	je     1003070 <kbd_handler_generic+0x30>
 1003058:	3c 38                	cmp    al,0x38
 100305a:	74 44                	je     10030a0 <kbd_handler_generic+0x60>
 100305c:	3c 1d                	cmp    al,0x1d
 100305e:	75 6e                	jne    10030ce <kbd_handler_generic+0x8e>
 1003060:	eb 26                	jmp    1003088 <kbd_handler_generic+0x48>
 1003062:	3c b8                	cmp    al,0xb8
 1003064:	74 46                	je     10030ac <kbd_handler_generic+0x6c>
 1003066:	3c ba                	cmp    al,0xba
 1003068:	74 4e                	je     10030b8 <kbd_handler_generic+0x78>
 100306a:	3c aa                	cmp    al,0xaa
 100306c:	75 60                	jne    10030ce <kbd_handler_generic+0x8e>
 100306e:	eb 0c                	jmp    100307c <kbd_handler_generic+0x3c>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:50
    {
        case KEY_SHIFT_DN: kKeyStatus[INDEX_SHIFT]=1;break;
 1003070:	c6 05 48 4a 01 01 01 	mov    BYTE PTR ds:0x1014a48,0x1
 1003077:	e9 94 01 00 00       	jmp    1003210 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:51
        case KEY_SHIFT_UP: kKeyStatus[INDEX_SHIFT]=0;break;
 100307c:	c6 05 48 4a 01 01 00 	mov    BYTE PTR ds:0x1014a48,0x0
 1003083:	e9 88 01 00 00       	jmp    1003210 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:52
        case KEY_CTRL_DN: kKeyStatus[INDEX_CTRL]=1;break;
 1003088:	c6 05 49 4a 01 01 01 	mov    BYTE PTR ds:0x1014a49,0x1
 100308f:	e9 7c 01 00 00       	jmp    1003210 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:53
        case KEY_CTRL_UP: kKeyStatus[INDEX_CTRL]=0;break;
 1003094:	c6 05 49 4a 01 01 00 	mov    BYTE PTR ds:0x1014a49,0x0
 100309b:	e9 70 01 00 00       	jmp    1003210 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:54
        case KEY_ALT_DN: kKeyStatus[INDEX_ALT]=1;break;
 10030a0:	c6 05 4a 4a 01 01 01 	mov    BYTE PTR ds:0x1014a4a,0x1
 10030a7:	e9 64 01 00 00       	jmp    1003210 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:55
        case KEY_ALT_UP: kKeyStatus[INDEX_ALT]=0;break;
 10030ac:	c6 05 4a 4a 01 01 00 	mov    BYTE PTR ds:0x1014a4a,0x0
 10030b3:	e9 58 01 00 00       	jmp    1003210 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:56
        case KEY_CAPSLOCK_UP: kKeyStatus[INDEX_CAPSLOCK]=!kKeyStatus[INDEX_CAPSLOCK];break;
 10030b8:	0f b6 05 4b 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a4b
 10030bf:	84 c0                	test   al,al
 10030c1:	0f 94 c0             	sete   al
 10030c4:	a2 4b 4a 01 01       	mov    ds:0x1014a4b,al
 10030c9:	e9 42 01 00 00       	jmp    1003210 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:64
//        case MAKE_UP: kKeyStatus[INDEX_UP]=0;break;
//        case MAKE_DOWN: kKeyStatus[INDEX_DOWN]=0;break;
       default:
//printk("%02X",rawKey);
           //changed from if rawkey & 0x80, so that keydown triggers the key being input
           if (rawKey==BREAK_RIGHT || rawKey==BREAK_LEFT || rawKey==BREAK_UP || rawKey==BREAK_DOWN)
 10030ce:	8d 50 35             	lea    edx,[eax+0x35]
 10030d1:	f6 c2 fd             	test   dl,0xfd
 10030d4:	74 08                	je     10030de <kbd_handler_generic+0x9e>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:64 (discriminator 1)
 10030d6:	8d 50 38             	lea    edx,[eax+0x38]
 10030d9:	f6 c2 f7             	test   dl,0xf7
 10030dc:	75 24                	jne    1003102 <kbd_handler_generic+0xc2>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:65
               if (kKeyboardBuffer<(char*)KEYBOARD_BUFFER_ADDRESS+KEYBOARD_BUFFER_SIZE && !kKeyStatus[INDEX_ALT])
 10030de:	8b 15 e0 03 12 00    	mov    edx,DWORD PTR ds:0x1203e0
 10030e4:	81 fa 2f 25 15 00    	cmp    edx,0x15252f
 10030ea:	77 16                	ja     1003102 <kbd_handler_generic+0xc2>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:65 (discriminator 1)
 10030ec:	0f b6 0d 4a 4a 01 01 	movzx  ecx,BYTE PTR ds:0x1014a4a
 10030f3:	84 c9                	test   cl,cl
 10030f5:	75 0b                	jne    1003102 <kbd_handler_generic+0xc2>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:66
                   *kKeyboardBuffer++=rawKey;
 10030f7:	8d 4a 01             	lea    ecx,[edx+0x1]
 10030fa:	89 0d e0 03 12 00    	mov    DWORD PTR ds:0x1203e0,ecx
 1003100:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:67
           if (!(rawKey & 0x80))
 1003102:	84 c0                	test   al,al
 1003104:	0f 88 06 01 00 00    	js     1003210 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:71
           {
                //rawKey &= 0x7f;
               //printk("%02X",rawKey); 48=up, 50=down
                 if (kKeyStatus[INDEX_SHIFT] || kKeyStatus[INDEX_CAPSLOCK])
 100310a:	0f b6 15 48 4a 01 01 	movzx  edx,BYTE PTR ds:0x1014a48
 1003111:	84 d2                	test   dl,dl
 1003113:	75 0b                	jne    1003120 <kbd_handler_generic+0xe0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:71 (discriminator 1)
 1003115:	0f b6 15 4b 4a 01 01 	movzx  edx,BYTE PTR ds:0x1014a4b
 100311c:	84 d2                	test   dl,dl
 100311e:	74 0c                	je     100312c <kbd_handler_generic+0xec>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:73
                 {
                     translatedKeypress=keyboard_map_up[rawKey];
 1003120:	0f b6 c0             	movzx  eax,al
 1003123:	0f b6 98 60 50 00 01 	movzx  ebx,BYTE PTR [eax+0x1005060]
 100312a:	eb 0a                	jmp    1003136 <kbd_handler_generic+0xf6>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:76
                 }
                 else
                     translatedKeypress=keyboard_map[rawKey];
 100312c:	0f b6 c0             	movzx  eax,al
 100312f:	0f b6 98 e0 50 00 01 	movzx  ebx,BYTE PTR [eax+0x10050e0]
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:83
//                 if ((kDebugLevel & DEBUG_KEYBOARD) == DEBUG_KEYBOARD)
//                 {
//                      printf("%u, %u, %c\n",kKeyChar, rawKey, translatedKeypress);
//                 }
#endif
                if (kKeyStatus[INDEX_CTRL])
 1003136:	0f b6 05 49 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a49
 100313d:	84 c0                	test   al,al
 100313f:	74 13                	je     1003154 <kbd_handler_generic+0x114>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:85
                {
                    printk("^");
 1003141:	83 ec 0c             	sub    esp,0xc
 1003144:	68 6b 78 00 01       	push   0x100786b
 1003149:	e8 31 f4 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:86
                    translatedKeypress-=32;
 100314e:	83 eb 20             	sub    ebx,0x20
 1003151:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:89
                }
                //Debug
                if (kKeyStatus[INDEX_ALT] && translatedKeypress==0x6A)
 1003154:	0f b6 05 4a 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a4a
 100315b:	80 fb 6a             	cmp    bl,0x6a
 100315e:	75 05                	jne    1003165 <kbd_handler_generic+0x125>
 1003160:	84 c0                	test   al,al
 1003162:	74 01                	je     1003165 <kbd_handler_generic+0x125>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:91
                {
                    __asm("int 0x3");
 1003164:	cc                   	int3   
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:93
                }
            if (kKeyStatus[INDEX_ALT] && kKeyStatus[INDEX_CTRL] && translatedKeypress==0xE0)
 1003165:	0f b6 05 4a 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a4a
 100316c:	84 c0                	test   al,al
 100316e:	74 2f                	je     100319f <kbd_handler_generic+0x15f>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:93 (discriminator 1)
 1003170:	0f b6 05 49 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a49
 1003177:	80 fb e0             	cmp    bl,0xe0
 100317a:	75 23                	jne    100319f <kbd_handler_generic+0x15f>
 100317c:	84 c0                	test   al,al
 100317e:	74 1f                	je     100319f <kbd_handler_generic+0x15f>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:96
            {
                translatedKeypress=0;
                reboot(false);
 1003180:	83 ec 0c             	sub    esp,0xc
 1003183:	6a 00                	push   0x0
 1003185:	e8 9d eb ff ff       	call   1001d27 <reboot>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:98
            }
            if (kKeyStatus[INDEX_ALT])
 100318a:	0f b6 05 4a 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a4a
 1003191:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:95
                {
                    __asm("int 0x3");
                }
            if (kKeyStatus[INDEX_ALT] && kKeyStatus[INDEX_CTRL] && translatedKeypress==0xE0)
            {
                translatedKeypress=0;
 1003194:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:98
                reboot(false);
            }
            if (kKeyStatus[INDEX_ALT])
 1003199:	84 c0                	test   al,al
 100319b:	75 69                	jne    1003206 <kbd_handler_generic+0x1c6>
 100319d:	eb 71                	jmp    1003210 <kbd_handler_generic+0x1d0>
 100319f:	0f b6 05 4a 4a 01 01 	movzx  eax,BYTE PTR ds:0x1014a4a
 10031a6:	84 c0                	test   al,al
 10031a8:	74 66                	je     1003210 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:100
            {
                if (translatedKeypress=='c')
 10031aa:	80 fb 63             	cmp    bl,0x63
 10031ad:	75 4b                	jne    10031fa <kbd_handler_generic+0x1ba>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:102
                {
                    printk("%u",*kTicksSinceStart);
 10031af:	a1 60 02 12 00       	mov    eax,ds:0x120260
 10031b4:	8b 00                	mov    eax,DWORD PTR [eax]
 10031b6:	83 ec 08             	sub    esp,0x8
 10031b9:	50                   	push   eax
 10031ba:	68 6d 78 00 01       	push   0x100786d
 10031bf:	e8 bb f3 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:103
                    printk("-%c-%04X:%08X",(exceptionFlags & 0x200)==0x200?'I':'i',exceptionCS, exceptionEIP);
 10031c4:	8b 0d f8 01 12 00    	mov    ecx,DWORD PTR ds:0x1201f8
 10031ca:	8b 15 fc 01 12 00    	mov    edx,DWORD PTR ds:0x1201fc
 10031d0:	a1 f0 01 12 00       	mov    eax,ds:0x1201f0
 10031d5:	83 c4 10             	add    esp,0x10
 10031d8:	25 00 02 00 00       	and    eax,0x200
 10031dd:	83 f8 01             	cmp    eax,0x1
 10031e0:	19 c0                	sbb    eax,eax
 10031e2:	83 e0 20             	and    eax,0x20
 10031e5:	83 c0 49             	add    eax,0x49
 10031e8:	51                   	push   ecx
 10031e9:	52                   	push   edx
 10031ea:	50                   	push   eax
 10031eb:	68 70 78 00 01       	push   0x1007870
 10031f0:	e8 8a f3 ff ff       	call   100257f <printk>
 10031f5:	83 c4 10             	add    esp,0x10
 10031f8:	eb 16                	jmp    1003210 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:116
                    printk("The time is currently %s", &currTime);
                    cursorMoveTo(65,SYS_VGA_HEIGHT-1);
                    printk("ticks=%d", *kTicksSinceStart);
                    cursorRestorePosition();
                }
*/                if (translatedKeypress=='d')
 10031fa:	80 fb 64             	cmp    bl,0x64
 10031fd:	75 07                	jne    1003206 <kbd_handler_generic+0x1c6>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:118
                {
                    printDumpedRegs();
 10031ff:	e8 8a e8 ff ff       	call   1001a8e <printDumpedRegs>
 1003204:	eb 0a                	jmp    1003210 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:120
                }
                if (translatedKeypress=='e')
 1003206:	80 fb 65             	cmp    bl,0x65
 1003209:	75 05                	jne    1003210 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:122
                {
                    dumpKernelAddresses();
 100320b:	e8 58 eb ff ff       	call   1001d68 <dumpKernelAddresses>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1003210:	e4 61                	in     al,0x61
 1003212:	89 c2                	mov    edx,eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1003214:	83 c8 82             	or     eax,0xffffff82
 1003217:	e6 61                	out    0x61,al
 1003219:	89 d0                	mov    eax,edx
 100321b:	83 e0 7f             	and    eax,0x7f
 100321e:	83 c8 02             	or     eax,0x2
 1003221:	e6 61                	out    0x61,al
kbd_handler_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:135
    lKeyControlVal |= 0x82;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    lKeyControlVal &= 0x7f;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    return;
}
 1003223:	83 c4 08             	add    esp,0x8
 1003226:	5b                   	pop    ebx
 1003227:	c3                   	ret    

01003228 <ih_keyboard_generic>:
ih_keyboard_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:32
extern volatile uint32_t exceptionSavedESP;
extern volatile uint32_t* kTicksSinceStart;

__attribute__ ((interrupt))
void ih_keyboard_generic(struct interrupt_frame *frame)
{
 1003228:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:33
    kbd_handler_generic();
 100322b:	e8 10 fe ff ff       	call   1003040 <kbd_handler_generic>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:35
    return;
}
 1003230:	83 c4 0c             	add    esp,0xc
 1003233:	c3                   	ret    

01003234 <main>:
main():
/home/yogi/src/os/chrisOSKernel/src/kernel.c:27
extern struct gdt_ptr kernelGDT;

/*
 * 
 */
int main(int argc, char** argv) {
 1003234:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 1003238:	83 e4 f0             	and    esp,0xfffffff0
 100323b:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 100323e:	55                   	push   ebp
 100323f:	89 e5                	mov    ebp,esp
 1003241:	56                   	push   esi
 1003242:	53                   	push   ebx
 1003243:	51                   	push   ecx
 1003244:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/src/kernel.c:29
    //terminal_clear();
    printk("\nkernel loaded ... \n");
 1003247:	68 7e 78 00 01       	push   0x100787e
 100324c:	e8 2e f3 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:38
        printk("Param %u=%s\n",cnt,argv[cnt]);
        //if (cnt>5)
        //    break;
    }
*/
    printk("Initializing memory management ...\n");
 1003251:	c7 04 24 14 86 00 01 	mov    DWORD PTR [esp],0x1008614
 1003258:	e8 22 f3 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:39
    kDebugLevel |= DEBUG_KERNEL_PAGING;
 100325d:	81 0d 38 03 12 00 00 	or     DWORD PTR ds:0x120338,0x8000
 1003264:	80 00 00 
/home/yogi/src/os/chrisOSKernel/src/kernel.c:40
    mmInit();
 1003267:	e8 fa 06 00 00       	call   1003966 <mmInit>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:44
//    kDebugLevel |= DEBUG_MEMORY_MANAGEMENT;
//    kDebugLevel |= DEBUG_PAGING;
//    kDebugLevel |= DEBUG_MALLOC;
    printk("Done initializing memory management.\n\nInitializing malloc ...\n");
 100326c:	c7 04 24 38 86 00 01 	mov    DWORD PTR [esp],0x1008638
 1003273:	e8 07 f3 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:45
    initMalloc();
 1003278:	e8 be 03 00 00       	call   100363b <initMalloc>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:46
    printk("Done initializing malloc\n\nInitializing task management ...\n");
 100327d:	c7 04 24 78 86 00 01 	mov    DWORD PTR [esp],0x1008678
 1003284:	e8 f6 f2 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:47
    taskInit();
 1003289:	e8 c6 0f 00 00       	call   1004254 <taskInit>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:48
    printk("Done initializing task management\n\n");
 100328e:	c7 04 24 b4 86 00 01 	mov    DWORD PTR [esp],0x10086b4
 1003295:	e8 e5 f2 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:52
    
    //process_t* process = createProcess(false,'/myhelloworld');

    printk("\n\n***************************MALLOC TEST 1***********************************\n");
 100329a:	c7 04 24 d8 86 00 01 	mov    DWORD PTR [esp],0x10086d8
 10032a1:	e8 d9 f2 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:53
    int* a = malloc(5000);
 10032a6:	c7 04 24 88 13 00 00 	mov    DWORD PTR [esp],0x1388
 10032ad:	e8 4a 05 00 00       	call   10037fc <malloc>
 10032b2:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/kernel.c:54
    a[0]=0xDEADBEEF;
 10032b4:	c7 00 ef be ad de    	mov    DWORD PTR [eax],0xdeadbeef
/home/yogi/src/os/chrisOSKernel/src/kernel.c:56
    uint32_t* v=(uint32_t*)0x4c39ec;
    a[1]=0xBEADFEED;
 10032ba:	c7 40 04 ed fe ad be 	mov    DWORD PTR [eax+0x4],0xbeadfeed
/home/yogi/src/os/chrisOSKernel/src/kernel.c:57
    printk("\n\n***************************MALLOC TEST 2***********************************\n");
 10032c1:	c7 04 24 28 87 00 01 	mov    DWORD PTR [esp],0x1008728
 10032c8:	e8 b2 f2 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:58
    char* b = malloc(512);
 10032cd:	c7 04 24 00 02 00 00 	mov    DWORD PTR [esp],0x200
 10032d4:	e8 23 05 00 00       	call   10037fc <malloc>
 10032d9:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/kernel.c:59
    strcpy(b,"Hello world!!!\n");
 10032db:	83 c4 08             	add    esp,0x8
 10032de:	68 93 78 00 01       	push   0x1007893
 10032e3:	50                   	push   eax
 10032e4:	e8 f7 f2 ff ff       	call   10025e0 <strcpy>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:60
    printk("a[0](0x%08X)=0x%08X\n\n\n",&a[0],a[0]);
 10032e9:	83 c4 0c             	add    esp,0xc
 10032ec:	ff 36                	push   DWORD PTR [esi]
 10032ee:	56                   	push   esi
 10032ef:	68 a3 78 00 01       	push   0x10078a3
 10032f4:	e8 86 f2 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:61
    printk("b[0](0x%08X)=0x%08X=%s\n",&b[0],b[0],b);
 10032f9:	53                   	push   ebx
 10032fa:	0f be 03             	movsx  eax,BYTE PTR [ebx]
 10032fd:	50                   	push   eax
 10032fe:	53                   	push   ebx
 10032ff:	68 ba 78 00 01       	push   0x10078ba
 1003304:	e8 76 f2 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:63

    printk("\n\n*************************** MALLOC TEST 3 ***********************************\n");
 1003309:	83 c4 14             	add    esp,0x14
 100330c:	68 78 87 00 01       	push   0x1008778
 1003311:	e8 69 f2 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:67
    uint32_t* ca[10];
    goto MALLOCTESTS;
    MALLOCTESTS:
    ca[0]=malloc(10);
 1003316:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
 100331d:	e8 da 04 00 00       	call   10037fc <malloc>
 1003322:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/kernel.c:68
    ca[1]=malloc(10);
 1003324:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
 100332b:	e8 cc 04 00 00       	call   10037fc <malloc>
 1003330:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/kernel.c:69
    *ca[0]=1;
 1003332:	c7 06 01 00 00 00    	mov    DWORD PTR [esi],0x1
/home/yogi/src/os/chrisOSKernel/src/kernel.c:70
    *ca[1]=2;
 1003338:	c7 00 02 00 00 00    	mov    DWORD PTR [eax],0x2
/home/yogi/src/os/chrisOSKernel/src/kernel.c:71
    printk("ca[0]=0x%08X, *ca[0]=%u\n",ca[0],*ca[0]);
 100333e:	83 c4 0c             	add    esp,0xc
 1003341:	ff 36                	push   DWORD PTR [esi]
 1003343:	56                   	push   esi
 1003344:	68 d2 78 00 01       	push   0x10078d2
 1003349:	e8 31 f2 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:72
    printk("ca[1]=0x%08X, *ca[1]=%u\n",ca[1],*ca[1]);
 100334e:	83 c4 0c             	add    esp,0xc
 1003351:	ff 33                	push   DWORD PTR [ebx]
 1003353:	53                   	push   ebx
 1003354:	68 eb 78 00 01       	push   0x10078eb
 1003359:	e8 21 f2 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:73
    printk("\n");
 100335e:	c7 04 24 5e 7a 00 01 	mov    DWORD PTR [esp],0x1007a5e
 1003365:	e8 15 f2 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:75
    
    return (0xbad);
 100336a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/kernel.c:76
}
 100336d:	b8 ad 0b 00 00       	mov    eax,0xbad
 1003372:	8d 65 f4             	lea    esp,[ebp-0xc]
 1003375:	59                   	pop    ecx
 1003376:	5b                   	pop    ebx
 1003377:	5e                   	pop    esi
 1003378:	5d                   	pop    ebp
 1003379:	8d 61 fc             	lea    esp,[ecx-0x4]
 100337c:	c3                   	ret    
 100337d:	66 90                	xchg   ax,ax
 100337f:	90                   	nop

01003380 <findEmptyBlock>:
findEmptyBlock():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:18
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})

//Returns pointer to first empty block found
sMemInfo* findEmptyBlock()
{
 1003380:	53                   	push   ebx
 1003381:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:19
    sMemInfo* mInfo=heapMemoryInfo;
 1003384:	a1 60 4a 01 01       	mov    eax,ds:0x1014a60
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:22
    sMemInfo* lRetVal;
    
    while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000))
 1003389:	8d 90 80 f6 0b 00    	lea    edx,[eax+0xbf680]
 100338f:	39 d0                	cmp    eax,edx
 1003391:	73 32                	jae    10033c5 <findEmptyBlock+0x45>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:24
    {
        if (mInfo->next==NULL)
 1003393:	83 78 18 00          	cmp    DWORD PTR [eax+0x18],0x0
 1003397:	75 25                	jne    10033be <findEmptyBlock+0x3e>
 1003399:	eb 06                	jmp    10033a1 <findEmptyBlock+0x21>
 100339b:	83 78 18 00          	cmp    DWORD PTR [eax+0x18],0x0
 100339f:	75 1d                	jne    10033be <findEmptyBlock+0x3e>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:26
        {
            lRetVal=mInfo+1;
 10033a1:	8d 58 1c             	lea    ebx,[eax+0x1c]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:27
            printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: Returning block # 0x%08X\n",lRetVal);
 10033a4:	83 ec 04             	sub    esp,0x4
 10033a7:	53                   	push   ebx
 10033a8:	68 cc 87 00 01       	push   0x10087cc
 10033ad:	68 00 00 01 00       	push   0x10000
 10033b2:	e8 e0 f1 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:28
            return lRetVal;
 10033b7:	83 c4 10             	add    esp,0x10
 10033ba:	89 d8                	mov    eax,ebx
 10033bc:	eb 21                	jmp    10033df <findEmptyBlock+0x5f>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:30
        }
         mInfo++;
 10033be:	83 c0 1c             	add    eax,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:22
sMemInfo* findEmptyBlock()
{
    sMemInfo* mInfo=heapMemoryInfo;
    sMemInfo* lRetVal;
    
    while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000))
 10033c1:	39 d0                	cmp    eax,edx
 10033c3:	75 d6                	jne    100339b <findEmptyBlock+0x1b>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:32
            printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: Returning block # 0x%08X\n",lRetVal);
            return lRetVal;
        }
         mInfo++;
    }
    printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: No empty block found, returning NULL\n");
 10033c5:	83 ec 08             	sub    esp,0x8
 10033c8:	68 f8 87 00 01       	push   0x10087f8
 10033cd:	68 00 00 01 00       	push   0x10000
 10033d2:	e8 c0 f1 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:33
    return NULL;
 10033d7:	83 c4 10             	add    esp,0x10
 10033da:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:34
}
 10033df:	83 c4 08             	add    esp,0x8
 10033e2:	5b                   	pop    ebx
 10033e3:	c3                   	ret    

010033e4 <findBlockByMemoryAddress>:
findBlockByMemoryAddress():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:37

sMemInfo* findBlockByMemoryAddress(uintptr_t* address)
{
 10033e4:	53                   	push   ebx
 10033e5:	83 ec 08             	sub    esp,0x8
 10033e8:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:38
    sMemInfo* mInfo=heapMemoryInfo;
 10033ec:	8b 1d 60 4a 01 01    	mov    ebx,DWORD PTR ds:0x1014a60
 10033f2:	8d 93 80 f6 0b 00    	lea    edx,[ebx+0xbf680]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:41
    do
    {
        if (mInfo->address==address)
 10033f8:	3b 43 04             	cmp    eax,DWORD PTR [ebx+0x4]
 10033fb:	75 18                	jne    1003415 <findBlockByMemoryAddress+0x31>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:43
        {
            printd(DEBUG_MEMORY_MANAGEMENT,"findBlockByMemoryAddress: Found block 0x%08X for memory address 0x%08X\n",mInfo,address);
 10033fd:	50                   	push   eax
 10033fe:	53                   	push   ebx
 10033ff:	68 30 88 00 01       	push   0x1008830
 1003404:	68 00 00 01 00       	push   0x10000
 1003409:	e8 89 f1 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:44
            return (sMemInfo*)mInfo;
 100340e:	83 c4 10             	add    esp,0x10
 1003411:	89 d8                	mov    eax,ebx
 1003413:	eb 0c                	jmp    1003421 <findBlockByMemoryAddress+0x3d>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:46
        }
        mInfo++;
 1003415:	83 c3 1c             	add    ebx,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:47
    } while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000));
 1003418:	39 d3                	cmp    ebx,edx
 100341a:	75 dc                	jne    10033f8 <findBlockByMemoryAddress+0x14>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:48
    return NULL;
 100341c:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:49
}
 1003421:	83 c4 08             	add    esp,0x8
 1003424:	5b                   	pop    ebx
 1003425:	c3                   	ret    

01003426 <findAvailableBlockBySize>:
findAvailableBlockBySize():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:53

//Returns a block with enough memory to fulfill the request
uintptr_t* findAvailableBlockBySize(uint32_t pSize)
{
 1003426:	53                   	push   ebx
 1003427:	83 ec 08             	sub    esp,0x8
 100342a:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:54
    sMemInfo* mInfo=heapMemoryInfo;
 100342e:	a1 60 4a 01 01       	mov    eax,ds:0x1014a60
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:58
    
    //First try finding a block starting at the last block instead of the first
    //Get to the last block
    while (mInfo->next)
 1003433:	83 78 18 00          	cmp    DWORD PTR [eax+0x18],0x0
 1003437:	74 11                	je     100344a <findAvailableBlockBySize+0x24>
 1003439:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:59
        mInfo++;
 100343b:	83 c3 1c             	add    ebx,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:58
{
    sMemInfo* mInfo=heapMemoryInfo;
    
    //First try finding a block starting at the last block instead of the first
    //Get to the last block
    while (mInfo->next)
 100343e:	83 7b 18 00          	cmp    DWORD PTR [ebx+0x18],0x0
 1003442:	75 f7                	jne    100343b <findAvailableBlockBySize+0x15>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:60
        mInfo++;
    while (mInfo>=heapMemoryInfo)
 1003444:	39 d8                	cmp    eax,ebx
 1003446:	76 04                	jbe    100344c <findAvailableBlockBySize+0x26>
 1003448:	eb 2e                	jmp    1003478 <findAvailableBlockBySize+0x52>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:54
}

//Returns a block with enough memory to fulfill the request
uintptr_t* findAvailableBlockBySize(uint32_t pSize)
{
    sMemInfo* mInfo=heapMemoryInfo;
 100344a:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:62
    //Get to the last block
    while (mInfo->next)
        mInfo++;
    while (mInfo>=heapMemoryInfo)
    {
        if (mInfo->size>=pSize && (!mInfo->inUse))
 100344c:	39 53 08             	cmp    DWORD PTR [ebx+0x8],edx
 100344f:	72 20                	jb     1003471 <findAvailableBlockBySize+0x4b>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:62 (discriminator 1)
 1003451:	80 7b 0c 00          	cmp    BYTE PTR [ebx+0xc],0x0
 1003455:	75 1a                	jne    1003471 <findAvailableBlockBySize+0x4b>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:64
        {
            printd(DEBUG_MEMORY_MANAGEMENT,"findAvailableBlockBySize: Returning block address 0x%08X\n",mInfo);
 1003457:	83 ec 04             	sub    esp,0x4
 100345a:	53                   	push   ebx
 100345b:	68 78 88 00 01       	push   0x1008878
 1003460:	68 00 00 01 00       	push   0x10000
 1003465:	e8 2d f1 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:65
            return (uintptr_t*)mInfo;
 100346a:	89 d8                	mov    eax,ebx
 100346c:	83 c4 10             	add    esp,0x10
 100346f:	eb 07                	jmp    1003478 <findAvailableBlockBySize+0x52>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:67
        }
        mInfo--;
 1003471:	83 eb 1c             	sub    ebx,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:60
    
    //First try finding a block starting at the last block instead of the first
    //Get to the last block
    while (mInfo->next)
        mInfo++;
    while (mInfo>=heapMemoryInfo)
 1003474:	39 d8                	cmp    eax,ebx
 1003476:	76 d4                	jbe    100344c <findAvailableBlockBySize+0x26>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:69
            printd(DEBUG_MEMORY_MANAGEMENT,"findAvailableBlockBySize: Returning block address 0x%08X\n",mInfo);
            return (uintptr_t*)mInfo;
        }
        mInfo--;
    }
}
 1003478:	83 c4 08             	add    esp,0x8
 100347b:	5b                   	pop    ebx
 100347c:	c3                   	ret    

0100347d <allocateBlockFrom>:
allocateBlockFrom():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:73

//Create a new block with the requested amount of memory, and adjust the old block's size and pointer appropriately
uintptr_t* allocateBlockFrom(sMemInfo* mInfoToAllocateFrom, uint32_t size)
{
 100347d:	57                   	push   edi
 100347e:	56                   	push   esi
 100347f:	53                   	push   ebx
 1003480:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 1003484:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:74
    sMemInfo* mNewInfo=findEmptyBlock();
 1003488:	e8 f3 fe ff ff       	call   1003380 <findEmptyBlock>
 100348d:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:77
    sMemInfo* mPriorInfo=mNewInfo-1;
    
    printd(DEBUG_MEMORY_MANAGEMENT,"allocateBlockFrom: findEmptyBlock returned 0x%08X\n",mNewInfo);
 100348f:	83 ec 04             	sub    esp,0x4
 1003492:	50                   	push   eax
 1003493:	68 b4 88 00 01       	push   0x10088b4
 1003498:	68 00 00 01 00       	push   0x10000
 100349d:	e8 f5 f0 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:79
    
    mPriorInfo->next=(uintptr_t*)mNewInfo;
 10034a2:	89 5b fc             	mov    DWORD PTR [ebx-0x4],ebx
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:82
    
    //Set up the new sMemInfo
    mNewInfo->prev=(uintptr_t*)mPriorInfo;
 10034a5:	8d 43 e4             	lea    eax,[ebx-0x1c]
 10034a8:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:83
    mNewInfo->address=mInfoToAllocateFrom->address;
 10034aa:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
 10034ad:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:84
    mNewInfo->size=size;
 10034b0:	89 7b 08             	mov    DWORD PTR [ebx+0x8],edi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:85
    mNewInfo->inUse=true;
 10034b3:	c6 43 0c 01          	mov    BYTE PTR [ebx+0xc],0x1
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:86
    mNewInfo->cr3=CURRENT_CR3;
 10034b7:	0f 20 d8             	mov    eax,cr3
 10034ba:	89 c0                	mov    eax,eax
 10034bc:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:89
    //mNewInfo pid and next don't get set
    
    mInfoToAllocateFrom->address+=size;
 10034bf:	01 7e 04             	add    DWORD PTR [esi+0x4],edi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:90
    mInfoToAllocateFrom->size-=size;
 10034c2:	29 7e 08             	sub    DWORD PTR [esi+0x8],edi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:91
    return (uintptr_t*)mNewInfo->address;
 10034c5:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
 10034c8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:92
}
 10034cb:	5b                   	pop    ebx
 10034cc:	5e                   	pop    esi
 10034cd:	5f                   	pop    edi
 10034ce:	c3                   	ret    

010034cf <allocPages>:
allocPages():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:95

void* allocPages(uint32_t size)
{
 10034cf:	56                   	push   esi
 10034d0:	53                   	push   ebx
 10034d1:	83 ec 04             	sub    esp,0x4
 10034d4:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:97
    uint32_t newSize=size;
    if (newSize%PAGE_SIZE)
 10034d8:	89 d8                	mov    eax,ebx
 10034da:	25 ff 0f 00 00       	and    eax,0xfff
 10034df:	74 1e                	je     10034ff <allocPages+0x30>
 10034e1:	8d b3 00 10 00 00    	lea    esi,[ebx+0x1000]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:99
    {
        newSize+=(PAGE_SIZE-(size % PAGE_SIZE));
 10034e7:	29 c6                	sub    esi,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:100
        printd(DEBUG_MEMORY_MANAGEMENT,"allocPages: Size adjusted from %u to %u\n",size,newSize);
 10034e9:	56                   	push   esi
 10034ea:	53                   	push   ebx
 10034eb:	68 e8 88 00 01       	push   0x10088e8
 10034f0:	68 00 00 01 00       	push   0x10000
 10034f5:	e8 9d f0 ff ff       	call   1002597 <printd>
 10034fa:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:99
void* allocPages(uint32_t size)
{
    uint32_t newSize=size;
    if (newSize%PAGE_SIZE)
    {
        newSize+=(PAGE_SIZE-(size % PAGE_SIZE));
 10034fd:	89 f3                	mov    ebx,esi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:103
        printd(DEBUG_MEMORY_MANAGEMENT,"allocPages: Size adjusted from %u to %u\n",size,newSize);
    }
    uintptr_t* lRetVal;
    uintptr_t* block=findAvailableBlockBySize(newSize);
 10034ff:	83 ec 0c             	sub    esp,0xc
 1003502:	53                   	push   ebx
 1003503:	e8 1e ff ff ff       	call   1003426 <findAvailableBlockBySize>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:104
    if ( ((sMemInfo*)(block))->size > newSize)
 1003508:	83 c4 10             	add    esp,0x10
 100350b:	3b 58 08             	cmp    ebx,DWORD PTR [eax+0x8]
 100350e:	73 11                	jae    1003521 <allocPages+0x52>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:105
       lRetVal=allocateBlockFrom((sMemInfo*)block,newSize);
 1003510:	83 ec 08             	sub    esp,0x8
 1003513:	53                   	push   ebx
 1003514:	50                   	push   eax
 1003515:	e8 63 ff ff ff       	call   100347d <allocateBlockFrom>
 100351a:	89 c6                	mov    esi,eax
 100351c:	83 c4 10             	add    esp,0x10
 100351f:	eb 03                	jmp    1003524 <allocPages+0x55>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:107
    else
        lRetVal=((sMemInfo*)(block))->address;
 1003521:	8b 70 04             	mov    esi,DWORD PTR [eax+0x4]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:109
    //Map page into our address space
    pagingMapPage(CURRENT_CR3,lRetVal,lRetVal,0x7);
 1003524:	0f 20 d8             	mov    eax,cr3
 1003527:	89 c0                	mov    eax,eax
 1003529:	6a 07                	push   0x7
 100352b:	56                   	push   esi
 100352c:	56                   	push   esi
 100352d:	50                   	push   eax
 100352e:	e8 63 0a 00 00       	call   1003f96 <pagingMapPage>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:111
    //Zero out the memory
    printd(DEBUG_MEMORY_MANAGEMENT,"allocPages: Zeroing out page(s) at 0x%08X for 0x%08X\n",lRetVal,newSize);
 1003533:	53                   	push   ebx
 1003534:	56                   	push   esi
 1003535:	68 14 89 00 01       	push   0x1008914
 100353a:	68 00 00 01 00       	push   0x10000
 100353f:	e8 53 f0 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:112
    memset(lRetVal,0,newSize);
 1003544:	83 c4 1c             	add    esp,0x1c
 1003547:	53                   	push   ebx
 1003548:	6a 00                	push   0x0
 100354a:	56                   	push   esi
 100354b:	e8 9b e3 ff ff       	call   10018eb <memset>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:113
    printd(DEBUG_MEMORY_MANAGEMENT,"allocPages: Returning address 0x%08X\n",lRetVal);
 1003550:	83 c4 0c             	add    esp,0xc
 1003553:	56                   	push   esi
 1003554:	68 4c 89 00 01       	push   0x100894c
 1003559:	68 00 00 01 00       	push   0x10000
 100355e:	e8 34 f0 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:115
    return lRetVal;
}
 1003563:	89 f0                	mov    eax,esi
 1003565:	83 c4 14             	add    esp,0x14
 1003568:	5b                   	pop    ebx
 1003569:	5e                   	pop    esi
 100356a:	c3                   	ret    

0100356b <freePage>:
freePage():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:118

void freePage(void* address)
{
 100356b:	53                   	push   ebx
 100356c:	83 ec 14             	sub    esp,0x14
 100356f:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:119
    sMemInfo* mInfo = findBlockByMemoryAddress(address);
 1003573:	53                   	push   ebx
 1003574:	e8 6b fe ff ff       	call   10033e4 <findBlockByMemoryAddress>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:120
    if (mInfo!=NULL)
 1003579:	83 c4 10             	add    esp,0x10
 100357c:	85 c0                	test   eax,eax
 100357e:	74 1a                	je     100359a <freePage+0x2f>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:122
    {
        mInfo->inUse=false;
 1003580:	c6 40 0c 00          	mov    BYTE PTR [eax+0xc],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:123
        printd(DEBUG_MEMORY_MANAGEMENT,"Freed block 0x%08x for memory address 0x%08x\n",mInfo,address);
 1003584:	53                   	push   ebx
 1003585:	50                   	push   eax
 1003586:	68 74 89 00 01       	push   0x1008974
 100358b:	68 00 00 01 00       	push   0x10000
 1003590:	e8 02 f0 ff ff       	call   1002597 <printd>
 1003595:	83 c4 10             	add    esp,0x10
 1003598:	eb 16                	jmp    10035b0 <freePage+0x45>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:126
    }
    else
        printd(DEBUG_MEMORY_MANAGEMENT,"free: Could not find memory block for 0x%08X to free, doing nothing\n",address);
 100359a:	83 ec 04             	sub    esp,0x4
 100359d:	53                   	push   ebx
 100359e:	68 a4 89 00 01       	push   0x10089a4
 10035a3:	68 00 00 01 00       	push   0x10000
 10035a8:	e8 ea ef ff ff       	call   1002597 <printd>
 10035ad:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:127
}
 10035b0:	83 c4 08             	add    esp,0x8
 10035b3:	5b                   	pop    ebx
 10035b4:	c3                   	ret    

010035b5 <mallocA1k>:
mallocA1k():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:134
uintptr_t* mallocA1k(uint32_t size)
{
    uintptr_t* lRetVal=0;
    
    return lRetVal;
}
 10035b5:	b8 00 00 00 00       	mov    eax,0x0
 10035ba:	c3                   	ret    

010035bb <memAvailable>:
memAvailable():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:139

uint32_t memAvailable()
{
    uint32_t lRetVal;
    sMemInfo* mInfo=heapMemoryInfo;
 10035bb:	8b 15 60 4a 01 01    	mov    edx,DWORD PTR ds:0x1014a60
 10035c1:	8d 8a 80 f6 0b 00    	lea    ecx,[edx+0xbf680]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:143

    do
    {
        if (!mInfo->inUse)
 10035c7:	80 7a 0c 00          	cmp    BYTE PTR [edx+0xc],0x0
 10035cb:	75 03                	jne    10035d0 <memAvailable+0x15>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:144
            lRetVal+=mInfo->size;
 10035cd:	03 42 08             	add    eax,DWORD PTR [edx+0x8]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:145
        mInfo++;
 10035d0:	83 c2 1c             	add    edx,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:146
    } while (mInfo<heapMemoryInfo+(sizeof(sMemInfo)*1000));
 10035d3:	39 ca                	cmp    edx,ecx
 10035d5:	75 f0                	jne    10035c7 <memAvailable+0xc>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:148
    return lRetVal;
}
 10035d7:	f3 c3                	repz ret 
 10035d9:	66 90                	xchg   ax,ax
 10035db:	90                   	nop

010035dc <initHeapPagePtr>:
initHeapPagePtr():
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:40
    kHeapPagePtr->prev=NO_PREV_HEAP_PTR;
    initHeapPagePtr(kHeapPagePtr);
}

void initHeapPagePtr(heapPtrPage* pagePtr)
{
 10035dc:	53                   	push   ebx
 10035dd:	83 ec 08             	sub    esp,0x8
 10035e0:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:41
    printd(DEBUG_MALLOC,"initHeapPagePtr Initializing pointer page @ 0x%08X, 0x%08X pointers\n",pagePtr,POINTERS_PER_HEAP_PTR_PAGE);
 10035e4:	68 ff 01 00 00       	push   0x1ff
 10035e9:	53                   	push   ebx
 10035ea:	68 ec 89 00 01       	push   0x10089ec
 10035ef:	68 00 00 08 00       	push   0x80000
 10035f4:	e8 9e ef ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:42
    pagePtr->next=NO_NEXT_HEAP_PTR;
 10035f9:	c7 83 fc 0f 00 00 ff 	mov    DWORD PTR [ebx+0xffc],0xffffffff
 1003600:	ff ff ff 
 1003603:	8d 43 04             	lea    eax,[ebx+0x4]
 1003606:	8d 93 fc 0f 00 00    	lea    edx,[ebx+0xffc]
 100360c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:45 (discriminator 3)
    for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
    {
        pagePtr->ptrs[cnt].address=NULL;
 100360f:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:46 (discriminator 3)
        pagePtr->ptrs[cnt].size=0;
 1003615:	c7 40 04 00 00 00 00 	mov    DWORD PTR [eax+0x4],0x0
 100361c:	83 c0 08             	add    eax,0x8
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:43 (discriminator 3)

void initHeapPagePtr(heapPtrPage* pagePtr)
{
    printd(DEBUG_MALLOC,"initHeapPagePtr Initializing pointer page @ 0x%08X, 0x%08X pointers\n",pagePtr,POINTERS_PER_HEAP_PTR_PAGE);
    pagePtr->next=NO_NEXT_HEAP_PTR;
    for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
 100361f:	39 d0                	cmp    eax,edx
 1003621:	75 ec                	jne    100360f <initHeapPagePtr+0x33>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:48
    {
        pagePtr->ptrs[cnt].address=NULL;
        pagePtr->ptrs[cnt].size=0;
    }
    printd(DEBUG_MALLOC,"initHeapPagePtr Done\n",pagePtr);
 1003623:	83 ec 04             	sub    esp,0x4
 1003626:	53                   	push   ebx
 1003627:	68 df 79 00 01       	push   0x10079df
 100362c:	68 00 00 08 00       	push   0x80000
 1003631:	e8 61 ef ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:49
}
 1003636:	83 c4 18             	add    esp,0x18
 1003639:	5b                   	pop    ebx
 100363a:	c3                   	ret    

0100363b <initMalloc>:
initMalloc():
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:33
                      cr3Val;})

void initHeapPagePtr(heapPtrPage* pagePtr);

void initMalloc()
{
 100363b:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:34
    kHeapPagePtr = allocPages(sizeof(heapPtrPage));
 100363e:	68 00 10 00 00       	push   0x1000
 1003643:	e8 87 fe ff ff       	call   10034cf <allocPages>
 1003648:	a3 50 4a 01 01       	mov    ds:0x1014a50,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:35
    kHeapPagePtr->prev=NO_PREV_HEAP_PTR;
 100364d:	c7 00 fe ff ff ff    	mov    DWORD PTR [eax],0xfffffffe
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:36
    initHeapPagePtr(kHeapPagePtr);
 1003653:	83 c4 04             	add    esp,0x4
 1003656:	ff 35 50 4a 01 01    	push   DWORD PTR ds:0x1014a50
 100365c:	e8 7b ff ff ff       	call   10035dc <initHeapPagePtr>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:37
}
 1003661:	83 c4 1c             	add    esp,0x1c
 1003664:	c3                   	ret    

01003665 <findFreeMallocPointer>:
findFreeMallocPointer():
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:52
    }
    printd(DEBUG_MALLOC,"initHeapPagePtr Done\n",pagePtr);
}

void* findFreeMallocPointer()
{
 1003665:	56                   	push   esi
 1003666:	53                   	push   ebx
 1003667:	83 ec 04             	sub    esp,0x4
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:53
    heapPtrPage* ptrPg=kHeapPagePtr;
 100366a:	8b 35 50 4a 01 01    	mov    esi,DWORD PTR ds:0x1014a50
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:58
    heapPtrPage* newPtrPage;

    while (1==1)
    {
        printd(DEBUG_MALLOC,"findFreeMallocPointer: Scanning for a free memory pointer\n");
 1003670:	83 ec 08             	sub    esp,0x8
 1003673:	68 34 8a 00 01       	push   0x1008a34
 1003678:	68 00 00 08 00       	push   0x80000
 100367d:	e8 15 ef ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:60
        for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
        if (ptrPg->ptrs[cnt].address==NULL)
 1003682:	83 c4 10             	add    esp,0x10
 1003685:	83 7e 04 00          	cmp    DWORD PTR [esi+0x4],0x0
 1003689:	74 11                	je     100369c <findFreeMallocPointer+0x37>
 100368b:	bb 01 00 00 00       	mov    ebx,0x1
 1003690:	83 7c de 04 00       	cmp    DWORD PTR [esi+ebx*8+0x4],0x0
 1003695:	75 0f                	jne    10036a6 <findFreeMallocPointer+0x41>
 1003697:	e9 8c 00 00 00       	jmp    1003728 <findFreeMallocPointer+0xc3>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:59
    heapPtrPage* newPtrPage;

    while (1==1)
    {
        printd(DEBUG_MALLOC,"findFreeMallocPointer: Scanning for a free memory pointer\n");
        for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
 100369c:	bb 00 00 00 00       	mov    ebx,0x0
 10036a1:	e9 82 00 00 00       	jmp    1003728 <findFreeMallocPointer+0xc3>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:59 (discriminator 2)
 10036a6:	83 c3 01             	add    ebx,0x1
 10036a9:	81 fb ff 01 00 00    	cmp    ebx,0x1ff
 10036af:	75 df                	jne    1003690 <findFreeMallocPointer+0x2b>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:67
            printd(DEBUG_MALLOC,"findFreeMallocPointer: Found memory pointer on page 0 (0x%08X)\n",ptrPg);
            return &ptrPg->ptrs[cnt];
        }
        
        //If we've reached the last memory pointer on the page
        if (ptrPg->next==NO_NEXT_HEAP_PTR)
 10036b1:	83 be fc 0f 00 00 ff 	cmp    DWORD PTR [esi+0xffc],0xffffffff
 10036b8:	75 48                	jne    1003702 <findFreeMallocPointer+0x9d>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:69
        {
            printd(DEBUG_MALLOC,"No next heapPtrPage, creating one\n",ptrPg->next);
 10036ba:	83 ec 04             	sub    esp,0x4
 10036bd:	6a ff                	push   0xffffffff
 10036bf:	68 b0 8a 00 01       	push   0x1008ab0
 10036c4:	68 00 00 08 00       	push   0x80000
 10036c9:	e8 c9 ee ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:71
            //Create a new page and link it to the existing one
            newPtrPage=allocPages(sizeof(heapPtrPage));
 10036ce:	c7 04 24 00 10 00 00 	mov    DWORD PTR [esp],0x1000
 10036d5:	e8 f5 fd ff ff       	call   10034cf <allocPages>
 10036da:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:72
            initHeapPagePtr(newPtrPage);
 10036dc:	89 04 24             	mov    DWORD PTR [esp],eax
 10036df:	e8 f8 fe ff ff       	call   10035dc <initHeapPagePtr>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:73
            ptrPg->next=newPtrPage;
 10036e4:	89 9e fc 0f 00 00    	mov    DWORD PTR [esi+0xffc],ebx
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:74
            newPtrPage->prev=ptrPg;
 10036ea:	89 33                	mov    DWORD PTR [ebx],esi
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:75
            printd(DEBUG_MALLOC,"Initialized new heapPtrPage @ 0x%08X\n\n",newPtrPage);
 10036ec:	83 c4 0c             	add    esp,0xc
 10036ef:	53                   	push   ebx
 10036f0:	68 d4 8a 00 01       	push   0x1008ad4
 10036f5:	68 00 00 08 00       	push   0x80000
 10036fa:	e8 98 ee ff ff       	call   1002597 <printd>
 10036ff:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:77
        }
        printd(DEBUG_MALLOC,"Moving to next heapPtrPage @ 0x%08X\n",ptrPg->next);
 1003702:	83 ec 04             	sub    esp,0x4
 1003705:	ff b6 fc 0f 00 00    	push   DWORD PTR [esi+0xffc]
 100370b:	68 fc 8a 00 01       	push   0x1008afc
 1003710:	68 00 00 08 00       	push   0x80000
 1003715:	e8 7d ee ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:78
        ptrPg=(heapPtrPage*)ptrPg->next;
 100371a:	8b b6 fc 0f 00 00    	mov    esi,DWORD PTR [esi+0xffc]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:79
    }
 1003720:	83 c4 10             	add    esp,0x10
 1003723:	e9 48 ff ff ff       	jmp    1003670 <findFreeMallocPointer+0xb>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:62
    {
        printd(DEBUG_MALLOC,"findFreeMallocPointer: Scanning for a free memory pointer\n");
        for (int cnt=0;cnt<(int)(POINTERS_PER_HEAP_PTR_PAGE);cnt++)
        if (ptrPg->ptrs[cnt].address==NULL)
        {
            printd(DEBUG_MALLOC,"findFreeMallocPointer: Found memory pointer on page 0 (0x%08X)\n",ptrPg);
 1003728:	83 ec 04             	sub    esp,0x4
 100372b:	56                   	push   esi
 100372c:	68 70 8a 00 01       	push   0x1008a70
 1003731:	68 00 00 08 00       	push   0x80000
 1003736:	e8 5c ee ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:63
            return &ptrPg->ptrs[cnt];
 100373b:	8d 44 de 04          	lea    eax,[esi+ebx*8+0x4]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:81
        }
        printd(DEBUG_MALLOC,"Moving to next heapPtrPage @ 0x%08X\n",ptrPg->next);
        ptrPg=(heapPtrPage*)ptrPg->next;
    }
    panic("findFreeMallocPointer: Should not have gotten to this point");
}
 100373f:	83 c4 14             	add    esp,0x14
 1003742:	5b                   	pop    ebx
 1003743:	5e                   	pop    esi
 1003744:	c3                   	ret    

01003745 <allocateMemoryToProcess>:
allocateMemoryToProcess():
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:84

void allocateMemoryToProcess(heapPtr* ptr, size_t size, bool isKernel)
{
 1003745:	55                   	push   ebp
 1003746:	57                   	push   edi
 1003747:	56                   	push   esi
 1003748:	53                   	push   ebx
 1003749:	83 ec 1c             	sub    esp,0x1c
 100374c:	8b 6c 24 30          	mov    ebp,DWORD PTR [esp+0x30]
 1003750:	8b 74 24 34          	mov    esi,DWORD PTR [esp+0x34]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:90
    uint32_t newSize=size;
    uint32_t* allocdPage;
    
    //While we are using allocPages, we need to adjust the size to a multiple of 4096
    //*******************************************************************************
    if (newSize%PAGE_SIZE)
 1003754:	89 f0                	mov    eax,esi
 1003756:	25 ff 0f 00 00       	and    eax,0xfff
 100375b:	74 1e                	je     100377b <allocateMemoryToProcess+0x36>
 100375d:	8d 9e 00 10 00 00    	lea    ebx,[esi+0x1000]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:92
    {
        newSize+=(PAGE_SIZE-(size % PAGE_SIZE));
 1003763:	29 c3                	sub    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:93
        printd(DEBUG_MALLOC,"aMTP: Size adjusted from %u to %u\n",size,newSize);
 1003765:	53                   	push   ebx
 1003766:	56                   	push   esi
 1003767:	68 24 8b 00 01       	push   0x1008b24
 100376c:	68 00 00 08 00       	push   0x80000
 1003771:	e8 21 ee ff ff       	call   1002597 <printd>
 1003776:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:92
    
    //While we are using allocPages, we need to adjust the size to a multiple of 4096
    //*******************************************************************************
    if (newSize%PAGE_SIZE)
    {
        newSize+=(PAGE_SIZE-(size % PAGE_SIZE));
 1003779:	89 de                	mov    esi,ebx
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:96
        printd(DEBUG_MALLOC,"aMTP: Size adjusted from %u to %u\n",size,newSize);
    }
    //*******************************************************************************
    allocdPage=allocPages(newSize);
 100377b:	83 ec 0c             	sub    esp,0xc
 100377e:	56                   	push   esi
 100377f:	e8 4b fd ff ff       	call   10034cf <allocPages>
 1003784:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:97
    printd(DEBUG_MALLOC,"aMTP: Used allocPages to allocate 0x%08X bytes at 0x%08X\n",ptr->size,allocdPage);
 1003786:	50                   	push   eax
 1003787:	ff 75 04             	push   DWORD PTR [ebp+0x4]
 100378a:	68 48 8b 00 01       	push   0x1008b48
 100378f:	68 00 00 08 00       	push   0x80000
 1003794:	e8 fe ed ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:98
    uintptr_t virtualAddress=pagingFindAvailableAddressToMapTo(CURRENT_CR3,newSize/PAGE_SIZE);
 1003799:	0f 20 d8             	mov    eax,cr3
 100379c:	89 c0                	mov    eax,eax
 100379e:	83 c4 18             	add    esp,0x18
 10037a1:	89 f2                	mov    edx,esi
 10037a3:	c1 ea 0c             	shr    edx,0xc
 10037a6:	52                   	push   edx
 10037a7:	50                   	push   eax
 10037a8:	e8 d7 03 00 00       	call   1003b84 <pagingFindAvailableAddressToMapTo>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:99
    ptr->address=virtualAddress;
 10037ad:	89 45 00             	mov    DWORD PTR [ebp+0x0],eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:109
        virtualAddress|=bootGdt[cs].base_low;
        virtualAddress|=bootGdt[cs].base_middle<<16;
        virtualAddress|=bootGdt[cs].base_high<<24;
        printd(DEBUG_MALLOC,"aMTP: Adjusted virtual address to 0x%08X since we're running a kernel process\n",virtualAddress);
    }
*/    for (void* physicalAddress=allocdPage;physicalAddress<(uint32_t)(allocdPage)+newSize;physicalAddress+=PAGE_SIZE)
 10037b0:	8d 0c 1e             	lea    ecx,[esi+ebx*1]
 10037b3:	89 4c 24 1c          	mov    DWORD PTR [esp+0x1c],ecx
 10037b7:	83 c4 10             	add    esp,0x10
 10037ba:	39 cb                	cmp    ebx,ecx
 10037bc:	73 36                	jae    10037f4 <allocateMemoryToProcess+0xaf>
 10037be:	29 d8                	sub    eax,ebx
 10037c0:	89 c7                	mov    edi,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:111 (discriminator 3)
    {
        pagingMapPage(CURRENT_CR3,virtualAddress,physicalAddress,0x07);
 10037c2:	0f 20 d8             	mov    eax,cr3
 10037c5:	89 c5                	mov    ebp,eax
 10037c7:	8d 34 3b             	lea    esi,[ebx+edi*1]
 10037ca:	6a 07                	push   0x7
 10037cc:	53                   	push   ebx
 10037cd:	56                   	push   esi
 10037ce:	55                   	push   ebp
 10037cf:	e8 c2 07 00 00       	call   1003f96 <pagingMapPage>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:112 (discriminator 3)
        printd(DEBUG_MALLOC,"aMTP: Mapped phys page 0x%08X to process' virt page 0x%08X\n",physicalAddress,virtualAddress);
 10037d4:	56                   	push   esi
 10037d5:	53                   	push   ebx
 10037d6:	68 84 8b 00 01       	push   0x1008b84
 10037db:	68 00 00 08 00       	push   0x80000
 10037e0:	e8 b2 ed ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:109 (discriminator 3)
        virtualAddress|=bootGdt[cs].base_low;
        virtualAddress|=bootGdt[cs].base_middle<<16;
        virtualAddress|=bootGdt[cs].base_high<<24;
        printd(DEBUG_MALLOC,"aMTP: Adjusted virtual address to 0x%08X since we're running a kernel process\n",virtualAddress);
    }
*/    for (void* physicalAddress=allocdPage;physicalAddress<(uint32_t)(allocdPage)+newSize;physicalAddress+=PAGE_SIZE)
 10037e5:	81 c3 00 10 00 00    	add    ebx,0x1000
 10037eb:	83 c4 20             	add    esp,0x20
 10037ee:	3b 5c 24 0c          	cmp    ebx,DWORD PTR [esp+0xc]
 10037f2:	72 d3                	jb     10037c7 <allocateMemoryToProcess+0x82>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:115
    {
        pagingMapPage(CURRENT_CR3,virtualAddress,physicalAddress,0x07);
        printd(DEBUG_MALLOC,"aMTP: Mapped phys page 0x%08X to process' virt page 0x%08X\n",physicalAddress,virtualAddress);
        virtualAddress+=PAGE_SIZE;
    }
}
 10037f4:	83 c4 1c             	add    esp,0x1c
 10037f7:	5b                   	pop    ebx
 10037f8:	5e                   	pop    esi
 10037f9:	5f                   	pop    edi
 10037fa:	5d                   	pop    ebp
 10037fb:	c3                   	ret    

010037fc <malloc>:
malloc():
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:119


void* malloc(size_t size)
{
 10037fc:	57                   	push   edi
 10037fd:	56                   	push   esi
 10037fe:	53                   	push   ebx
 10037ff:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:120
    uint32_t cs=getCS()>>3;
 1003803:	e8 46 c8 ff ff       	call   100004e <getCS>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:121
    bool isKernel=(bootGdt[cs].access & 0x60)==0x0;
 1003808:	c1 e8 03             	shr    eax,0x3
 100380b:	8b 15 48 04 12 00    	mov    edx,DWORD PTR ds:0x120448
 1003811:	f6 44 c2 05 60       	test   BYTE PTR [edx+eax*8+0x5],0x60
 1003816:	0f 94 c0             	sete   al
 1003819:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:125
    
    heapPtr* ptr;
    //First find a page to place the memory pointer on
    ptr=findFreeMallocPointer();
 100381b:	e8 45 fe ff ff       	call   1003665 <findFreeMallocPointer>
 1003820:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:128
    //Next get a memory address to point to and map the memory into the process
    
    ptr->address=0;
 1003822:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:129
    ptr->size=size;
 1003828:	89 78 04             	mov    DWORD PTR [eax+0x4],edi
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:130
    allocateMemoryToProcess(ptr,size,isKernel);
 100382b:	83 ec 04             	sub    esp,0x4
 100382e:	89 f0                	mov    eax,esi
 1003830:	0f b6 f0             	movzx  esi,al
 1003833:	56                   	push   esi
 1003834:	57                   	push   edi
 1003835:	53                   	push   ebx
 1003836:	e8 0a ff ff ff       	call   1003745 <allocateMemoryToProcess>
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:131
    return ptr->address;
 100383b:	8b 03                	mov    eax,DWORD PTR [ebx]
 100383d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/malloc.c:132
 1003840:	5b                   	pop    ebx
 1003841:	5e                   	pop    esi
 1003842:	5f                   	pop    edi
 1003843:	c3                   	ret    

01003844 <mmInitHeapTracking>:
mmInitHeapTracking():
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:36
uint32_t kernelPoolMemorySize=1400000;   //20 MB kernel memory

sMemInfo* heapMemoryInfo;

void mmInitHeapTracking()
{
 1003844:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:37
    heapMemoryInfo=kmmHeapMemoryBaseAddress;
 1003847:	a1 04 05 12 00       	mov    eax,ds:0x120504
 100384c:	a3 60 4a 01 01       	mov    ds:0x1014a60,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:38
    printd(DEBUG_MEMORY_MANAGEMENT,"Assigning heapMemoryInfo address of 0x%08X\n",heapMemoryInfo);
 1003851:	50                   	push   eax
 1003852:	68 c0 8b 00 01       	push   0x1008bc0
 1003857:	68 00 00 01 00       	push   0x10000
 100385c:	e8 36 ed ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:42
    
    kmmHeapMemoryBaseAddress += sizeof(sMemInfo)*1000;
    kmmHeapMemoryBaseAddress += 0x1000;
    kmmHeapMemoryBaseAddress &= 0xFFFFF000;
 1003861:	a1 04 05 12 00       	mov    eax,ds:0x120504
 1003866:	05 60 7d 00 00       	add    eax,0x7d60
 100386b:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003870:	a3 04 05 12 00       	mov    ds:0x120504,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:43
    kmmHeapMemoryTotal-= sizeof(sMemInfo)*1000; 
 1003875:	81 2d 08 05 12 00 60 	sub    DWORD PTR ds:0x120508,0x6d60
 100387c:	6d 00 00 
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:44
    printd(DEBUG_MEMORY_MANAGEMENT,"heapMemoryInfo = 0x%08X\n",heapMemoryInfo);
 100387f:	83 c4 0c             	add    esp,0xc
 1003882:	ff 35 60 4a 01 01    	push   DWORD PTR ds:0x1014a60
 1003888:	68 f5 79 00 01       	push   0x10079f5
 100388d:	68 00 00 01 00       	push   0x10000
 1003892:	e8 00 ed ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:45
    printd(DEBUG_MEMORY_MANAGEMENT,"Allocating 0x%08X bytes to memory block tracking\n",sizeof(sMemInfo)*1000);
 1003897:	83 c4 0c             	add    esp,0xc
 100389a:	68 60 6d 00 00       	push   0x6d60
 100389f:	68 ec 8b 00 01       	push   0x1008bec
 10038a4:	68 00 00 01 00       	push   0x10000
 10038a9:	e8 e9 ec ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:46
    printd(DEBUG_MEMORY_MANAGEMENT,"User memory base adjusted to 0x%08X\n",kmmHeapMemoryBaseAddress);
 10038ae:	83 c4 0c             	add    esp,0xc
 10038b1:	ff 35 04 05 12 00    	push   DWORD PTR ds:0x120504
 10038b7:	68 20 8c 00 01       	push   0x1008c20
 10038bc:	68 00 00 01 00       	push   0x10000
 10038c1:	e8 d1 ec ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:47
    printd(DEBUG_MEMORY_MANAGEMENT,"User memory size adjusted to 0x%08X\n",kmmHeapMemoryTotal);
 10038c6:	83 c4 0c             	add    esp,0xc
 10038c9:	ff 35 08 05 12 00    	push   DWORD PTR ds:0x120508
 10038cf:	68 48 8c 00 01       	push   0x1008c48
 10038d4:	68 00 00 01 00       	push   0x10000
 10038d9:	e8 b9 ec ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:49

    heapMemoryInfo->address=kmmHeapMemoryBaseAddress;
 10038de:	a1 60 4a 01 01       	mov    eax,ds:0x1014a60
 10038e3:	8b 15 04 05 12 00    	mov    edx,DWORD PTR ds:0x120504
 10038e9:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:50
    heapMemoryInfo->size=kmmHeapMemoryTotal;
 10038ec:	8b 15 08 05 12 00    	mov    edx,DWORD PTR ds:0x120508
 10038f2:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:51
    heapMemoryInfo->next=NULL;
 10038f5:	c7 40 18 00 00 00 00 	mov    DWORD PTR [eax+0x18],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:52
    heapMemoryInfo->prev=NULL;
 10038fc:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 1003902:	83 c4 10             	add    esp,0x10
 1003905:	b8 1c 00 00 00       	mov    eax,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:54
    
    for (int cnt=1;cnt<1000;cnt++)
 100390a:	ba 01 00 00 00       	mov    edx,0x1
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:56
    {
        heapMemoryInfo[cnt].address=0;
 100390f:	89 c1                	mov    ecx,eax
 1003911:	03 0d 60 4a 01 01    	add    ecx,DWORD PTR ds:0x1014a60
 1003917:	c7 41 04 00 00 00 00 	mov    DWORD PTR [ecx+0x4],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:57
        heapMemoryInfo[cnt].prev=NULL;
 100391e:	c7 01 00 00 00 00    	mov    DWORD PTR [ecx],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:58
        if (cnt<999)
 1003924:	81 fa e6 03 00 00    	cmp    edx,0x3e6
 100392a:	7f 0e                	jg     100393a <mmInitHeapTracking+0xf6>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:59
            heapMemoryInfo[cnt].next=NULL;
 100392c:	8b 0d 60 4a 01 01    	mov    ecx,DWORD PTR ds:0x1014a60
 1003932:	c7 44 01 18 00 00 00 	mov    DWORD PTR [ecx+eax*1+0x18],0x0
 1003939:	00 
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:60 (discriminator 2)
        heapMemoryInfo[cnt].inUse=false;
 100393a:	89 c1                	mov    ecx,eax
 100393c:	03 0d 60 4a 01 01    	add    ecx,DWORD PTR ds:0x1014a60
 1003942:	c6 41 0c 00          	mov    BYTE PTR [ecx+0xc],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:61 (discriminator 2)
        heapMemoryInfo[cnt].pid=0;
 1003946:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:62 (discriminator 2)
        heapMemoryInfo[cnt].size=0;
 100394d:	c7 41 08 00 00 00 00 	mov    DWORD PTR [ecx+0x8],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:54 (discriminator 2)
    heapMemoryInfo->address=kmmHeapMemoryBaseAddress;
    heapMemoryInfo->size=kmmHeapMemoryTotal;
    heapMemoryInfo->next=NULL;
    heapMemoryInfo->prev=NULL;
    
    for (int cnt=1;cnt<1000;cnt++)
 1003954:	83 c2 01             	add    edx,0x1
 1003957:	83 c0 1c             	add    eax,0x1c
 100395a:	81 fa e8 03 00 00    	cmp    edx,0x3e8
 1003960:	75 ad                	jne    100390f <mmInitHeapTracking+0xcb>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:64
            heapMemoryInfo[cnt].next=NULL;
        heapMemoryInfo[cnt].inUse=false;
        heapMemoryInfo[cnt].pid=0;
        heapMemoryInfo[cnt].size=0;
    }
}
 1003962:	83 c4 0c             	add    esp,0xc
 1003965:	c3                   	ret    

01003966 <mmInit>:
mmInit():
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:68


void mmInit()
{
 1003966:	56                   	push   esi
 1003967:	53                   	push   ebx
 1003968:	83 ec 04             	sub    esp,0x4
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:70
    //0x10000000 represents segment 0xC0000000-0xCFFFFFFF ... don't want to map anything there for now
    kernelMemoryUsed=kernelStart + kernelSize;
 100396b:	a1 0c 48 00 01       	mov    eax,ds:0x100480c
 1003970:	03 05 08 48 00 01    	add    eax,DWORD PTR ds:0x1004808
 1003976:	a3 5c 4a 01 01       	mov    ds:0x1014a5c,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:71
    kmmGrossUserMemoryAvailable=kE820MemoryBytes - kernelMemoryUsed;
 100397b:	8b 0d 48 00 12 00    	mov    ecx,DWORD PTR ds:0x120048
 1003981:	8b 1d 4c 00 12 00    	mov    ebx,DWORD PTR ds:0x12004c
 1003987:	89 ca                	mov    edx,ecx
 1003989:	29 c2                	sub    edx,eax
 100398b:	89 15 00 05 12 00    	mov    DWORD PTR ds:0x120500,edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:72
    kmmHeapMemoryTotal=kmmGrossUserMemoryAvailable - kernelPoolMemorySize - kernelMemoryUsed;
 1003991:	8b 35 04 48 00 01    	mov    esi,DWORD PTR ds:0x1004804
 1003997:	29 f2                	sub    edx,esi
 1003999:	29 c2                	sub    edx,eax
 100399b:	89 15 08 05 12 00    	mov    DWORD PTR ds:0x120508,edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:73
    kmmHeapMemoryBaseAddress=(kernelMemoryUsed + 0x100000) & 0xFFFFF000 ;
 10039a1:	05 00 00 10 00       	add    eax,0x100000
 10039a6:	25 00 f0 ff ff       	and    eax,0xfffff000
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:74
    kKernelPoolMemoryAddress=kmmHeapMemoryBaseAddress;
 10039ab:	a3 64 4a 01 01       	mov    ds:0x1014a64,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:75
    kmmHeapMemoryBaseAddress+=kernelPoolMemorySize; //Need some page table memory but we don't want to use Malloc while creating page tables to get it
 10039b0:	01 f0                	add    eax,esi
 10039b2:	a3 04 05 12 00       	mov    ds:0x120504,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:77
    //Setup the base of the heap
    kMallocBaseAddress=kmmHeapMemoryBaseAddress;
 10039b7:	a3 fc 04 12 00       	mov    ds:0x1204fc,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:78
    kMallocCurrAddress=kMallocBaseAddress;
 10039bc:	a3 f8 04 12 00       	mov    ds:0x1204f8,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:80
    
    printd(DEBUG_MEMORY_MANAGEMENT,"E820 memory total: %u kb\n", kE820MemoryBytes/1024);
 10039c1:	0f ac d9 0a          	shrd   ecx,ebx,0xa
 10039c5:	c1 eb 0a             	shr    ebx,0xa
 10039c8:	53                   	push   ebx
 10039c9:	51                   	push   ecx
 10039ca:	68 0e 7a 00 01       	push   0x1007a0e
 10039cf:	68 00 00 01 00       	push   0x10000
 10039d4:	e8 be eb ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:81
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory used by the kernel: %u\n",kernelMemoryUsed);
 10039d9:	83 c4 0c             	add    esp,0xc
 10039dc:	ff 35 5c 4a 01 01    	push   DWORD PTR ds:0x1014a5c
 10039e2:	68 70 8c 00 01       	push   0x1008c70
 10039e7:	68 00 00 01 00       	push   0x10000
 10039ec:	e8 a6 eb ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:82
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory available to mm: %u kb\n",kmmGrossUserMemoryAvailable/1024);
 10039f1:	83 c4 0c             	add    esp,0xc
 10039f4:	a1 00 05 12 00       	mov    eax,ds:0x120500
 10039f9:	c1 e8 0a             	shr    eax,0xa
 10039fc:	50                   	push   eax
 10039fd:	68 90 8c 00 01       	push   0x1008c90
 1003a02:	68 00 00 01 00       	push   0x10000
 1003a07:	e8 8b eb ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:83
    printd(DEBUG_MEMORY_MANAGEMENT,"Total memory availabe to user applications: %u kb\n",(kmmGrossUserMemoryAvailable - kernelPoolMemorySize)/1024);
 1003a0c:	83 c4 0c             	add    esp,0xc
 1003a0f:	a1 00 05 12 00       	mov    eax,ds:0x120500
 1003a14:	2b 05 04 48 00 01    	sub    eax,DWORD PTR ds:0x1004804
 1003a1a:	c1 e8 0a             	shr    eax,0xa
 1003a1d:	50                   	push   eax
 1003a1e:	68 b0 8c 00 01       	push   0x1008cb0
 1003a23:	68 00 00 01 00       	push   0x10000
 1003a28:	e8 6a eb ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:84
    printd(DEBUG_MEMORY_MANAGEMENT,"Initializing memory manager\n\n");
 1003a2d:	83 c4 08             	add    esp,0x8
 1003a30:	68 28 7a 00 01       	push   0x1007a28
 1003a35:	68 00 00 01 00       	push   0x10000
 1003a3a:	e8 58 eb ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:85
    printd(DEBUG_MEMORY_MANAGEMENT,"Pool\t\tAddress\t\t\tLength\t\t\n");
 1003a3f:	83 c4 08             	add    esp,0x8
 1003a42:	68 46 7a 00 01       	push   0x1007a46
 1003a47:	68 00 00 01 00       	push   0x10000
 1003a4c:	e8 46 eb ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:86
    printd(DEBUG_MEMORY_MANAGEMENT,"Kernel\t0x%08X\t\t0x%08X\n",kKernelPoolMemoryAddress,kernelPoolMemorySize);
 1003a51:	ff 35 04 48 00 01    	push   DWORD PTR ds:0x1004804
 1003a57:	ff 35 64 4a 01 01    	push   DWORD PTR ds:0x1014a64
 1003a5d:	68 60 7a 00 01       	push   0x1007a60
 1003a62:	68 00 00 01 00       	push   0x10000
 1003a67:	e8 2b eb ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:87
    printd(DEBUG_MEMORY_MANAGEMENT,"User\t\t0x%08X\t\t0x%08X\n",kmmHeapMemoryBaseAddress,kmmHeapMemoryTotal);
 1003a6c:	83 c4 20             	add    esp,0x20
 1003a6f:	ff 35 08 05 12 00    	push   DWORD PTR ds:0x120508
 1003a75:	ff 35 04 05 12 00    	push   DWORD PTR ds:0x120504
 1003a7b:	68 77 7a 00 01       	push   0x1007a77
 1003a80:	68 00 00 01 00       	push   0x10000
 1003a85:	e8 0d eb ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:89

    mmInitHeapTracking();    
 1003a8a:	e8 b5 fd ff ff       	call   1003844 <mmInitHeapTracking>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:92
    //We need to
    uintptr_t startAddr=0x0;
    uintptr_t endAddr= (kernelMemoryUsed + 0x1000) & 0xFFFFF000;
 1003a8f:	a1 5c 4a 01 01       	mov    eax,ds:0x1014a5c
 1003a94:	8d 98 00 10 00 00    	lea    ebx,[eax+0x1000]
 1003a9a:	81 e3 00 f0 ff ff    	and    ebx,0xfffff000
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:94
    //Mark everything from the beginning of memory (0xC0000000) to the end of the kernel objects as in-use
    printd(DEBUG_KERNEL_PAGING,"Setting kernel memory range from 0x%08X-0x%08X as in-use\n",startAddr,endAddr);
 1003aa0:	53                   	push   ebx
 1003aa1:	6a 00                	push   0x0
 1003aa3:	68 e4 8c 00 01       	push   0x1008ce4
 1003aa8:	68 00 80 00 00       	push   0x8000
 1003aad:	e8 e5 ea ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:95
    mmKernelSetPageRangeInUseFlag(startAddr,
 1003ab2:	83 c4 20             	add    esp,0x20
 1003ab5:	6a 01                	push   0x1
 1003ab7:	68 00 10 00 00       	push   0x1000
 1003abc:	8d 43 01             	lea    eax,[ebx+0x1]
 1003abf:	50                   	push   eax
 1003ac0:	6a 00                	push   0x0
 1003ac2:	e8 36 dc ff ff       	call   10016fd <mmKernelSetPageRangeInUseFlag>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:101
            endAddr+1,
            0x1000, /*page size*/
            true);
    startAddr+=0xc0000000;
    endAddr+=0xc0000000;
    printd(DEBUG_KERNEL_PAGING,"Setting kernel memory range from 0x%08X-0x%08X as in-use\n",startAddr,endAddr);
 1003ac7:	8d 83 00 00 00 c0    	lea    eax,[ebx-0x40000000]
 1003acd:	50                   	push   eax
 1003ace:	68 00 00 00 c0       	push   0xc0000000
 1003ad3:	68 e4 8c 00 01       	push   0x1008ce4
 1003ad8:	68 00 80 00 00       	push   0x8000
 1003add:	e8 b5 ea ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:102
    mmKernelSetPageRangeInUseFlag(startAddr,
 1003ae2:	83 c4 20             	add    esp,0x20
 1003ae5:	6a 01                	push   0x1
 1003ae7:	68 00 10 00 00       	push   0x1000
 1003aec:	81 eb ff ff ff 3f    	sub    ebx,0x3fffffff
 1003af2:	53                   	push   ebx
 1003af3:	68 00 00 00 c0       	push   0xc0000000
 1003af8:	e8 00 dc ff ff       	call   10016fd <mmKernelSetPageRangeInUseFlag>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:107
            endAddr+1,
            0x1000, /*page size*/
            true);

    startAddr=kmmHeapMemoryBaseAddress; 
 1003afd:	8b 1d 04 05 12 00    	mov    ebx,DWORD PTR ds:0x120504
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:108
    printd(DEBUG_KERNEL_PAGING,"Zeroing page entries for memory range 0x%08X-0x%08X",startAddr,0x9FFFFFFF);
 1003b03:	68 ff ff ff 9f       	push   0x9fffffff
 1003b08:	53                   	push   ebx
 1003b09:	68 20 8d 00 01       	push   0x1008d20
 1003b0e:	68 00 80 00 00       	push   0x8000
 1003b13:	e8 7f ea ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:109
    for (uintptr_t cnt=startAddr;cnt<=0x9FFFFFFF;cnt+=0x1000)
 1003b18:	83 c4 20             	add    esp,0x20
 1003b1b:	81 fb ff ff ff 9f    	cmp    ebx,0x9fffffff
 1003b21:	77 4c                	ja     1003b6f <mmInit+0x209>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:113
    {
        if (cnt<0xC0000000 || cnt>0xCFFFFFFF)
        {
            unMapPage(CURRENT_CR3,cnt,0x0);
 1003b23:	0f 20 d8             	mov    eax,cr3
 1003b26:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:111

    startAddr=kmmHeapMemoryBaseAddress; 
    printd(DEBUG_KERNEL_PAGING,"Zeroing page entries for memory range 0x%08X-0x%08X",startAddr,0x9FFFFFFF);
    for (uintptr_t cnt=startAddr;cnt<=0x9FFFFFFF;cnt+=0x1000)
    {
        if (cnt<0xC0000000 || cnt>0xCFFFFFFF)
 1003b28:	8d 83 00 00 00 40    	lea    eax,[ebx+0x40000000]
 1003b2e:	3d ff ff ff 0f       	cmp    eax,0xfffffff
 1003b33:	76 2c                	jbe    1003b61 <mmInit+0x1fb>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:113
        {
            unMapPage(CURRENT_CR3,cnt,0x0);
 1003b35:	83 ec 04             	sub    esp,0x4
 1003b38:	6a 00                	push   0x0
 1003b3a:	53                   	push   ebx
 1003b3b:	56                   	push   esi
 1003b3c:	e8 10 05 00 00       	call   1004051 <unMapPage>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:114
            if (cnt%0x10000000==0)
 1003b41:	83 c4 10             	add    esp,0x10
 1003b44:	f7 c3 ff ff ff 0f    	test   ebx,0xfffffff
 1003b4a:	75 15                	jne    1003b61 <mmInit+0x1fb>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:117
            {
//                printk("0x%08X-0x%08X\n",cnt,kPagingGet4kPTEntryValue(cnt));
                printd(DEBUG_KERNEL_PAGING,".");
 1003b4c:	83 ec 08             	sub    esp,0x8
 1003b4f:	68 8d 7a 00 01       	push   0x1007a8d
 1003b54:	68 00 80 00 00       	push   0x8000
 1003b59:	e8 39 ea ff ff       	call   1002597 <printd>
 1003b5e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:109 (discriminator 2)
            0x1000, /*page size*/
            true);

    startAddr=kmmHeapMemoryBaseAddress; 
    printd(DEBUG_KERNEL_PAGING,"Zeroing page entries for memory range 0x%08X-0x%08X",startAddr,0x9FFFFFFF);
    for (uintptr_t cnt=startAddr;cnt<=0x9FFFFFFF;cnt+=0x1000)
 1003b61:	81 c3 00 10 00 00    	add    ebx,0x1000
 1003b67:	81 fb ff ff ff 9f    	cmp    ebx,0x9fffffff
 1003b6d:	76 b9                	jbe    1003b28 <mmInit+0x1c2>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:123
//                cursorMoveTo(0,cursorGetPosY()-1);
            }
        }
    }
 
    printk("\n");
 1003b6f:	83 ec 0c             	sub    esp,0xc
 1003b72:	68 5e 7a 00 01       	push   0x1007a5e
 1003b77:	e8 03 ea ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:145
    printd(DEBUG_KERNEL_PAGING,"Available memory: %u\n",memAvailable());
    return;
  */  
//    for (int cnt=KERNEL_VIRTUAL_EXEC_ADDRESS;cnt<KERNEL_VIRTUAL_EXEC_ADDRESS+0x10000000;cnt+=4096)
//        pagingMapPage
}
 1003b7c:	83 c4 14             	add    esp,0x14
 1003b7f:	5b                   	pop    ebx
 1003b80:	5e                   	pop    esi
 1003b81:	c3                   	ret    
 1003b82:	66 90                	xchg   ax,ax

01003b84 <pagingFindAvailableAddressToMapTo>:
pagingFindAvailableAddressToMapTo():
/home/yogi/src/os/chrisOSKernel/src/paging.c:24
uint32_t kKernelPoolMemoryAddress;



uint32_t pagingFindAvailableAddressToMapTo(uintptr_t pageDirAddress,int pagesToFind)
{
 1003b84:	55                   	push   ebp
 1003b85:	57                   	push   edi
 1003b86:	56                   	push   esi
 1003b87:	53                   	push   ebx
 1003b88:	83 ec 30             	sub    esp,0x30
 1003b8b:	8b 7c 24 48          	mov    edi,DWORD PTR [esp+0x48]
/home/yogi/src/os/chrisOSKernel/src/paging.c:26
    uint32_t* dir;
    dir=(uint32_t*)pageDirAddress;
 1003b8f:	8b 44 24 44          	mov    eax,DWORD PTR [esp+0x44]
 1003b93:	89 44 24 20          	mov    DWORD PTR [esp+0x20],eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:36
    uint32_t foundPageTableEntry;
    uint32_t foundPageTableEntryNum;
    int dirEntryNumber=0;
    uint32_t lRetVal;
    currentPDE=dir;
    lastPDE=dir+(PAGE_SIZE/4);
 1003b97:	05 00 10 00 00       	add    eax,0x1000
 1003b9c:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:38
    
    printd(DEBUG_PAGING,"pFAATMT: Finding PTEs to accomodate 0x%08X pgs\n",pagesToFind);
 1003ba0:	57                   	push   edi
 1003ba1:	68 54 8d 00 01       	push   0x1008d54
 1003ba6:	6a 40                	push   0x40
 1003ba8:	e8 ea e9 ff ff       	call   1002597 <printd>
 1003bad:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/paging.c:35
    bool found=false;
    uint32_t foundPageTableEntry;
    uint32_t foundPageTableEntryNum;
    int dirEntryNumber=0;
    uint32_t lRetVal;
    currentPDE=dir;
 1003bb0:	8b 44 24 40          	mov    eax,DWORD PTR [esp+0x40]
 1003bb4:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:33
    uint32_t* currentPDE,*lastPDE;
    int foundPageEntryCount;
    bool found=false;
    uint32_t foundPageTableEntry;
    uint32_t foundPageTableEntryNum;
    int dirEntryNumber=0;
 1003bb8:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/chrisOSKernel/src/paging.c:30
    uint32_t* dir;
    dir=(uint32_t*)pageDirAddress;
    uint32_t* tablePtr;
    uint32_t* currentPDE,*lastPDE;
    int foundPageEntryCount;
    bool found=false;
 1003bbd:	c6 44 24 17 00       	mov    BYTE PTR [esp+0x17],0x0
 1003bc2:	89 c6                	mov    esi,eax
 1003bc4:	81 c6 04 10 00 00    	add    esi,0x1004
 1003bca:	89 74 24 18          	mov    DWORD PTR [esp+0x18],esi
/home/yogi/src/os/chrisOSKernel/src/paging.c:43
    printd(DEBUG_PAGING,"pFAATMT: Finding PTEs to accomodate 0x%08X pgs\n",pagesToFind);
    //Scan the page directory for an entry that is in use
    do
    {
        //printd(DEBUG_PAGING,"pFAATMT: Finding existing page directory entry\n");
        for (uint32_t* cnt=currentPDE;cnt<=lastPDE;cnt++)
 1003bce:	8b 74 24 08          	mov    esi,DWORD PTR [esp+0x8]
 1003bd2:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1003bd6:	39 de                	cmp    esi,ebx
 1003bd8:	77 34                	ja     1003c0e <pagingFindAvailableAddressToMapTo+0x8a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:45
        {
            if (*dir==0)
 1003bda:	83 38 00             	cmp    DWORD PTR [eax],0x0
 1003bdd:	0f 85 04 01 00 00    	jne    1003ce7 <pagingFindAvailableAddressToMapTo+0x163>
 1003be3:	89 f1                	mov    ecx,esi
 1003be5:	83 c1 04             	add    ecx,0x4
 1003be8:	8b 74 24 18          	mov    esi,DWORD PTR [esp+0x18]
 1003bec:	29 ce                	sub    esi,ecx
 1003bee:	89 f1                	mov    ecx,esi
 1003bf0:	c1 e9 02             	shr    ecx,0x2
 1003bf3:	8d 6c 0a 01          	lea    ebp,[edx+ecx*1+0x1]
 1003bf7:	eb 09                	jmp    1003c02 <pagingFindAvailableAddressToMapTo+0x7e>
 1003bf9:	83 38 00             	cmp    DWORD PTR [eax],0x0
 1003bfc:	0f 85 e5 00 00 00    	jne    1003ce7 <pagingFindAvailableAddressToMapTo+0x163>
/home/yogi/src/os/chrisOSKernel/src/paging.c:47 (discriminator 2)
            {
                dir++;
 1003c02:	83 c0 04             	add    eax,0x4
/home/yogi/src/os/chrisOSKernel/src/paging.c:48 (discriminator 2)
                dirEntryNumber++;
 1003c05:	83 c2 01             	add    edx,0x1
/home/yogi/src/os/chrisOSKernel/src/paging.c:43 (discriminator 2)
    printd(DEBUG_PAGING,"pFAATMT: Finding PTEs to accomodate 0x%08X pgs\n",pagesToFind);
    //Scan the page directory for an entry that is in use
    do
    {
        //printd(DEBUG_PAGING,"pFAATMT: Finding existing page directory entry\n");
        for (uint32_t* cnt=currentPDE;cnt<=lastPDE;cnt++)
 1003c08:	39 ea                	cmp    edx,ebp
 1003c0a:	75 ed                	jne    1003bf9 <pagingFindAvailableAddressToMapTo+0x75>
 1003c0c:	eb 02                	jmp    1003c10 <pagingFindAvailableAddressToMapTo+0x8c>
/home/yogi/src/os/chrisOSKernel/src/paging.c:43
 1003c0e:	89 d5                	mov    ebp,edx
 1003c10:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:55
            else
                break;
        }

        //If we didn't find a page directory in use, put the first entry into use
        if (*dir==0)
 1003c14:	83 38 00             	cmp    DWORD PTR [eax],0x0
 1003c17:	75 35                	jne    1003c4e <pagingFindAvailableAddressToMapTo+0xca>
/home/yogi/src/os/chrisOSKernel/src/paging.c:58
        {
            dir=(uint32_t*)pageDirAddress;
            *dir=(uint32_t)allocPages(PAGE_SIZE);
 1003c19:	83 ec 0c             	sub    esp,0xc
 1003c1c:	68 00 10 00 00       	push   0x1000
 1003c21:	e8 a9 f8 ff ff       	call   10034cf <allocPages>
/home/yogi/src/os/chrisOSKernel/src/paging.c:60
            *dir &= 0xFFFFF000;
            *dir |= 0x7;
 1003c26:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003c2b:	83 c8 07             	or     eax,0x7
 1003c2e:	8b 74 24 2c          	mov    esi,DWORD PTR [esp+0x2c]
 1003c32:	89 06                	mov    DWORD PTR [esi],eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:62
            dirEntryNumber=0;
            printd(DEBUG_PAGING,"pFAATMT: No available directory entry, allocated one at 0x%08X, placed at PDE entry 0 (0x%08X)\n",*dir,dir);
 1003c34:	56                   	push   esi
 1003c35:	50                   	push   eax
 1003c36:	68 84 8d 00 01       	push   0x1008d84
 1003c3b:	6a 40                	push   0x40
 1003c3d:	e8 55 e9 ff ff       	call   1002597 <printd>
 1003c42:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:57
        }

        //If we didn't find a page directory in use, put the first entry into use
        if (*dir==0)
        {
            dir=(uint32_t*)pageDirAddress;
 1003c45:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
/home/yogi/src/os/chrisOSKernel/src/paging.c:61
            *dir=(uint32_t)allocPages(PAGE_SIZE);
            *dir &= 0xFFFFF000;
            *dir |= 0x7;
            dirEntryNumber=0;
 1003c49:	bd 00 00 00 00       	mov    ebp,0x0
/home/yogi/src/os/chrisOSKernel/src/paging.c:71
        foundPageEntryCount=0;
        foundPageTableEntry=0;
        foundPageTableEntryNum=0;
        
        tablePtr=(uint32_t*)*dir;
        tablePtr=(uint32_t*)((uint32_t)tablePtr & 0xFFFFF000);
 1003c4e:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1003c52:	8b 00                	mov    eax,DWORD PTR [eax]
 1003c54:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
 1003c58:	89 c2                	mov    edx,eax
 1003c5a:	81 e2 00 f0 ff ff    	and    edx,0xfffff000
/home/yogi/src/os/chrisOSKernel/src/paging.c:77
        
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Found PDE=0x%08X (0x%08X)\n",currentPDE,*currentPDE);
        
        //Find sequential table entries large enough to hold the requested amount of memory
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding free page table entries\n");
        for (int cnt=0;cnt<(PAGE_SIZE/4)-1;cnt++)
 1003c60:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/paging.c:68
        }

        currentPDE=dir;
        foundPageEntryCount=0;
        foundPageTableEntry=0;
        foundPageTableEntryNum=0;
 1003c65:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/src/paging.c:67
            printd(DEBUG_PAGING,"pFAATMT: No available directory entry, allocated one at 0x%08X, placed at PDE entry 0 (0x%08X)\n",*dir,dir);
        }

        currentPDE=dir;
        foundPageEntryCount=0;
        foundPageTableEntry=0;
 1003c6a:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/src/paging.c:66
            dirEntryNumber=0;
            printd(DEBUG_PAGING,"pFAATMT: No available directory entry, allocated one at 0x%08X, placed at PDE entry 0 (0x%08X)\n",*dir,dir);
        }

        currentPDE=dir;
        foundPageEntryCount=0;
 1003c6f:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/chrisOSKernel/src/paging.c:80
        //Find sequential table entries large enough to hold the requested amount of memory
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding free page table entries\n");
        for (int cnt=0;cnt<(PAGE_SIZE/4)-1;cnt++)
        {
            //If entry is in use
            if (*tablePtr!=0)
 1003c74:	83 3a 00             	cmp    DWORD PTR [edx],0x0
 1003c77:	74 14                	je     1003c8d <pagingFindAvailableAddressToMapTo+0x109>
/home/yogi/src/os/chrisOSKernel/src/paging.c:85
            {
                //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Page %u of %u is in use (0x%08X=0x%08X), starting again\n",foundEntryCount+1,pagesToFind,tablePtr,*tablePtr);
                //reset the found entry count and move to the next entry
                foundPageEntryCount=0;
                tablePtr++;
 1003c79:	83 c2 04             	add    edx,0x4
/home/yogi/src/os/chrisOSKernel/src/paging.c:87
                foundPageTableEntry=0;
                foundPageTableEntryNum=0;
 1003c7c:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/src/paging.c:86
            {
                //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Page %u of %u is in use (0x%08X=0x%08X), starting again\n",foundEntryCount+1,pagesToFind,tablePtr,*tablePtr);
                //reset the found entry count and move to the next entry
                foundPageEntryCount=0;
                tablePtr++;
                foundPageTableEntry=0;
 1003c81:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/src/paging.c:84
            //If entry is in use
            if (*tablePtr!=0)
            {
                //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Page %u of %u is in use (0x%08X=0x%08X), starting again\n",foundEntryCount+1,pagesToFind,tablePtr,*tablePtr);
                //reset the found entry count and move to the next entry
                foundPageEntryCount=0;
 1003c86:	b9 00 00 00 00       	mov    ecx,0x0
 1003c8b:	eb 0f                	jmp    1003c9c <pagingFindAvailableAddressToMapTo+0x118>
/home/yogi/src/os/chrisOSKernel/src/paging.c:92
                foundPageTableEntryNum=0;
            }
            else
            {
                //Entry not in use, increment the found entry count
                foundPageEntryCount++;
 1003c8d:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/src/paging.c:94
                //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Page %u of %u available ... continuing\n",foundEntryCount,pagesToFind);
                if (foundPageTableEntry==0)
 1003c90:	85 db                	test   ebx,ebx
 1003c92:	75 04                	jne    1003c98 <pagingFindAvailableAddressToMapTo+0x114>
/home/yogi/src/os/chrisOSKernel/src/paging.c:96
                {
                    foundPageTableEntry=(uint32_t)tablePtr;
 1003c94:	89 d3                	mov    ebx,edx
/home/yogi/src/os/chrisOSKernel/src/paging.c:97
                    foundPageTableEntryNum=cnt;
 1003c96:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:100
                }
                //If we found enough entries which aren't in use, bail out of the FOR
                if (foundPageEntryCount==pagesToFind)
 1003c98:	39 cf                	cmp    edi,ecx
 1003c9a:	74 29                	je     1003cc5 <pagingFindAvailableAddressToMapTo+0x141>
/home/yogi/src/os/chrisOSKernel/src/paging.c:77 (discriminator 2)
        
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Found PDE=0x%08X (0x%08X)\n",currentPDE,*currentPDE);
        
        //Find sequential table entries large enough to hold the requested amount of memory
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Finding free page table entries\n");
        for (int cnt=0;cnt<(PAGE_SIZE/4)-1;cnt++)
 1003c9c:	83 c0 01             	add    eax,0x1
 1003c9f:	3d ff 03 00 00       	cmp    eax,0x3ff
 1003ca4:	75 ce                	jne    1003c74 <pagingFindAvailableAddressToMapTo+0xf0>
/home/yogi/src/os/chrisOSKernel/src/paging.c:109
                    break;
                }
            }
        }
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Not enough pages at dir entry 0x%08X (%u-%u)\n",currentPDE,foundEntryCount,pagesToFind);
        dir++;
 1003ca6:	8b 4c 24 08          	mov    ecx,DWORD PTR [esp+0x8]
 1003caa:	89 c8                	mov    eax,ecx
 1003cac:	83 c0 04             	add    eax,0x4
/home/yogi/src/os/chrisOSKernel/src/paging.c:110
        dirEntryNumber++;
 1003caf:	8d 55 01             	lea    edx,[ebp+0x1]
/home/yogi/src/os/chrisOSKernel/src/paging.c:111
    } while ( !found && currentPDE<lastPDE);
 1003cb2:	3b 4c 24 10          	cmp    ecx,DWORD PTR [esp+0x10]
 1003cb6:	0f 92 c1             	setb   cl
 1003cb9:	38 4c 24 17          	cmp    BYTE PTR [esp+0x17],cl
 1003cbd:	0f 82 0b ff ff ff    	jb     1003bce <pagingFindAvailableAddressToMapTo+0x4a>
 1003cc3:	eb 05                	jmp    1003cca <pagingFindAvailableAddressToMapTo+0x146>
/home/yogi/src/os/chrisOSKernel/src/paging.c:103
                }
                //If we found enough entries which aren't in use, bail out of the FOR
                if (foundPageEntryCount==pagesToFind)
                {
                    //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Found available page entries at entry 0x%08X\n",foundPageTableEntry);
                    found=true;
 1003cc5:	c6 44 24 17 01       	mov    BYTE PTR [esp+0x17],0x1
/home/yogi/src/os/chrisOSKernel/src/paging.c:113
        //printd(DEBUG_PAGING,"pagingFindAvailablePageTable: Not enough pages at dir entry 0x%08X (%u-%u)\n",currentPDE,foundEntryCount,pagesToFind);
        dir++;
        dirEntryNumber++;
    } while ( !found && currentPDE<lastPDE);
    
    if (!found)
 1003cca:	80 7c 24 17 00       	cmp    BYTE PTR [esp+0x17],0x0
 1003ccf:	75 21                	jne    1003cf2 <pagingFindAvailableAddressToMapTo+0x16e>
/home/yogi/src/os/chrisOSKernel/src/paging.c:114
        panic("pFAATMT: Could not find a free PTE, PDE=0x%08X\n",pageDirAddress);
 1003cd1:	83 ec 08             	sub    esp,0x8
 1003cd4:	ff 74 24 48          	push   DWORD PTR [esp+0x48]
 1003cd8:	68 e4 8d 00 01       	push   0x1008de4
 1003cdd:	e8 16 e4 ff ff       	call   10020f8 <panic>
 1003ce2:	83 c4 10             	add    esp,0x10
 1003ce5:	eb 0b                	jmp    1003cf2 <pagingFindAvailableAddressToMapTo+0x16e>
/home/yogi/src/os/chrisOSKernel/src/paging.c:61
        {
            dir=(uint32_t*)pageDirAddress;
            *dir=(uint32_t)allocPages(PAGE_SIZE);
            *dir &= 0xFFFFF000;
            *dir |= 0x7;
            dirEntryNumber=0;
 1003ce7:	89 d5                	mov    ebp,edx
 1003ce9:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
 1003ced:	e9 5c ff ff ff       	jmp    1003c4e <pagingFindAvailableAddressToMapTo+0xca>
/home/yogi/src/os/chrisOSKernel/src/paging.c:118
    if (!found)
        panic("pFAATMT: Could not find a free PTE, PDE=0x%08X\n",pageDirAddress);

    dirEntryNumber--;
    
    printd(DEBUG_PAGING,"pFAATMT: dirEntry#=0x%08X, ptEntry#=0x%08X\n",dirEntryNumber,foundPageTableEntryNum);
 1003cf2:	56                   	push   esi
 1003cf3:	55                   	push   ebp
 1003cf4:	68 14 8e 00 01       	push   0x1008e14
 1003cf9:	6a 40                	push   0x40
 1003cfb:	e8 97 e8 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:119
    lRetVal=(uint32_t)((dirEntryNumber*(PAGE_SIZE*1024)) + (foundPageTableEntryNum*PAGE_SIZE));
 1003d00:	c1 e5 16             	shl    ebp,0x16
 1003d03:	c1 e6 0c             	shl    esi,0xc
 1003d06:	01 ee                	add    esi,ebp
/home/yogi/src/os/chrisOSKernel/src/paging.c:120
    printd(DEBUG_PAGING,"pFAATMT: Found PDE 0x%08X, starting PTE 0x%08X\n",currentPDE,foundPageTableEntry);
 1003d08:	53                   	push   ebx
 1003d09:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003d0d:	68 40 8e 00 01       	push   0x1008e40
 1003d12:	6a 40                	push   0x40
 1003d14:	e8 7e e8 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:121
    printd(DEBUG_PAGING,"\tfor 0x%08X bytes at virt address 0x%08X\n",pagesToFind*PAGE_SIZE,lRetVal);
 1003d19:	83 c4 20             	add    esp,0x20
 1003d1c:	56                   	push   esi
 1003d1d:	c1 e7 0c             	shl    edi,0xc
 1003d20:	57                   	push   edi
 1003d21:	68 70 8e 00 01       	push   0x1008e70
 1003d26:	6a 40                	push   0x40
 1003d28:	e8 6a e8 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:123
    return lRetVal;
}
 1003d2d:	89 f0                	mov    eax,esi
 1003d2f:	83 c4 3c             	add    esp,0x3c
 1003d32:	5b                   	pop    ebx
 1003d33:	5e                   	pop    esi
 1003d34:	5f                   	pop    edi
 1003d35:	5d                   	pop    ebp
 1003d36:	c3                   	ret    

01003d37 <pagingAllocatePagingTablePage>:
pagingAllocatePagingTablePage():
/home/yogi/src/os/chrisOSKernel/src/paging.c:127

uint32_t pagingAllocatePagingTablePage()
{
    uint32_t lRetVal = kKernelPoolMemoryAddress;
 1003d37:	a1 64 4a 01 01       	mov    eax,ds:0x1014a64
/home/yogi/src/os/chrisOSKernel/src/paging.c:128
    kKernelPoolMemoryAddress+=0x1000;
 1003d3c:	8d 90 00 10 00 00    	lea    edx,[eax+0x1000]
 1003d42:	89 15 64 4a 01 01    	mov    DWORD PTR ds:0x1014a64,edx
/home/yogi/src/os/chrisOSKernel/src/paging.c:130
    return lRetVal;
}
 1003d48:	c3                   	ret    

01003d49 <pagingGet4kPDEntryValue>:
pagingGet4kPDEntryValue():
/home/yogi/src/os/chrisOSKernel/src/paging.c:133

uint32_t pagingGet4kPDEntryValue(uintptr_t pageDirAddress, uint32_t address)
{
 1003d49:	53                   	push   ebx
 1003d4a:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/src/paging.c:135
    address&=0xFFFFF000;
    uintptr_t* lTemp=(uint32_t*)((pageDirAddress + (((address & 0xFFC00000) >> 22) << 2)));
 1003d4d:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
 1003d51:	c1 eb 16             	shr    ebx,0x16
 1003d54:	c1 e3 02             	shl    ebx,0x2
 1003d57:	03 5c 24 14          	add    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:136
    printd(DEBUG_PAGING,"pagingGet4kPDEntryValue: dirAddressPtr=0x%08x\n", *lTemp);
 1003d5b:	ff 33                	push   DWORD PTR [ebx]
 1003d5d:	68 04 7e 00 01       	push   0x1007e04
 1003d62:	6a 40                	push   0x40
 1003d64:	e8 2e e8 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:137
    return (uint32_t)*lTemp;
 1003d69:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/src/paging.c:138
}
 1003d6b:	83 c4 18             	add    esp,0x18
 1003d6e:	5b                   	pop    ebx
 1003d6f:	c3                   	ret    

01003d70 <pagingGet4kPDEntryAddress>:
pagingGet4kPDEntryAddress():
/home/yogi/src/os/chrisOSKernel/src/paging.c:141

uint32_t pagingGet4kPDEntryAddress(uintptr_t pageDirAddress, uint32_t address)
{
 1003d70:	53                   	push   ebx
 1003d71:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/src/paging.c:143
    address&=0xFFFFF000;
    uintptr_t lTemp=((pageDirAddress  | (((address & 0xFFC00000) >> 22) << 2)));
 1003d74:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
 1003d78:	c1 eb 16             	shr    ebx,0x16
 1003d7b:	c1 e3 02             	shl    ebx,0x2
 1003d7e:	0b 5c 24 14          	or     ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:144
    printd(DEBUG_PAGING,"pagingGet4kPDEntryAddress: dirEntryAddress=0x%08x\n", lTemp);
 1003d82:	53                   	push   ebx
 1003d83:	68 9c 8e 00 01       	push   0x1008e9c
 1003d88:	6a 40                	push   0x40
 1003d8a:	e8 08 e8 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:146
    return (uint32_t)lTemp & 0xFFFFFFFF;
}
 1003d8f:	89 d8                	mov    eax,ebx
 1003d91:	83 c4 18             	add    esp,0x18
 1003d94:	5b                   	pop    ebx
 1003d95:	c3                   	ret    

01003d96 <pagingGet4kPTEntryAddress>:
pagingGet4kPTEntryAddress():
/home/yogi/src/os/chrisOSKernel/src/paging.c:149

uint32_t pagingGet4kPTEntryAddress(uintptr_t pageDirAddress, uint32_t address)
{
 1003d96:	53                   	push   ebx
 1003d97:	83 ec 10             	sub    esp,0x10
 1003d9a:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/src/paging.c:151
    address&=0xFFFFF000;
    uintptr_t pDirPtr=pagingGet4kPDEntryValue(pageDirAddress,address) & 0xFFFFF000;
 1003d9e:	89 d8                	mov    eax,ebx
 1003da0:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003da5:	50                   	push   eax
 1003da6:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003daa:	e8 9a ff ff ff       	call   1003d49 <pagingGet4kPDEntryValue>
/home/yogi/src/os/chrisOSKernel/src/paging.c:152
    return ((address & 0x3FF000) >> 12) << 2 | pDirPtr;
 1003daf:	81 e3 00 f0 3f 00    	and    ebx,0x3ff000
 1003db5:	c1 eb 0a             	shr    ebx,0xa
 1003db8:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003dbd:	09 d8                	or     eax,ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:153
}
 1003dbf:	83 c4 18             	add    esp,0x18
 1003dc2:	5b                   	pop    ebx
 1003dc3:	c3                   	ret    

01003dc4 <pagingGet4kPTEntryValue>:
pagingGet4kPTEntryValue():
/home/yogi/src/os/chrisOSKernel/src/paging.c:156

uint32_t pagingGet4kPTEntryValue(uintptr_t pageDirAddress, uint32_t address)
{
 1003dc4:	53                   	push   ebx
 1003dc5:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/paging.c:158
    address&=0xFFFFF000;
    uint32_t* pTablePtr=(uint32_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 1003dc8:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1003dcc:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003dd1:	50                   	push   eax
 1003dd2:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003dd6:	e8 bb ff ff ff       	call   1003d96 <pagingGet4kPTEntryAddress>
 1003ddb:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:159
    printd(DEBUG_PAGING,"pagingGet4kPTEntryValue: pageEntryAddress=0x%08X\n", pTablePtr);
 1003ddd:	83 c4 0c             	add    esp,0xc
 1003de0:	50                   	push   eax
 1003de1:	68 34 7e 00 01       	push   0x1007e34
 1003de6:	6a 40                	push   0x40
 1003de8:	e8 aa e7 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:160
    return *pTablePtr;
 1003ded:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/src/paging.c:161
}
 1003def:	83 c4 18             	add    esp,0x18
 1003df2:	5b                   	pop    ebx
 1003df3:	c3                   	ret    

01003df4 <pagingSetPageReadOnlyFlag>:
pagingSetPageReadOnlyFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:164

void pagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly)
{
 1003df4:	56                   	push   esi
 1003df5:	53                   	push   ebx
 1003df6:	83 ec 04             	sub    esp,0x4
 1003df9:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1003dfd:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:165
    printd(DEBUG_PAGING,"pagingMakePageReadOnly: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 1003e01:	ff 33                	push   DWORD PTR [ebx]
 1003e03:	53                   	push   ebx
 1003e04:	68 68 7e 00 01       	push   0x1007e68
 1003e09:	6a 40                	push   0x40
 1003e0b:	e8 87 e7 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:166
    if (readOnly)
 1003e10:	83 c4 10             	add    esp,0x10
 1003e13:	89 f0                	mov    eax,esi
 1003e15:	84 c0                	test   al,al
 1003e17:	74 05                	je     1003e1e <pagingSetPageReadOnlyFlag+0x2a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:167
       *ptEntry&=0xFFFFFFFD;
 1003e19:	83 23 fd             	and    DWORD PTR [ebx],0xfffffffd
 1003e1c:	eb 03                	jmp    1003e21 <pagingSetPageReadOnlyFlag+0x2d>
/home/yogi/src/os/chrisOSKernel/src/paging.c:169
    else
       *ptEntry|=2; 
 1003e1e:	83 0b 02             	or     DWORD PTR [ebx],0x2
/home/yogi/src/os/chrisOSKernel/src/paging.c:170
    RELOAD_CR3
 1003e21:	0f 20 d8             	mov    eax,cr3
 1003e24:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:171
    printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 1003e27:	83 ec 04             	sub    esp,0x4
 1003e2a:	ff 33                	push   DWORD PTR [ebx]
 1003e2c:	68 85 7a 00 01       	push   0x1007a85
 1003e31:	6a 40                	push   0x40
 1003e33:	e8 5f e7 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:172
}
 1003e38:	83 c4 14             	add    esp,0x14
 1003e3b:	5b                   	pop    ebx
 1003e3c:	5e                   	pop    esi
 1003e3d:	c3                   	ret    

01003e3e <pagingUpdatePTEPresentFlag>:
pagingUpdatePTEPresentFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:175

void pagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present)
{
 1003e3e:	56                   	push   esi
 1003e3f:	53                   	push   ebx
 1003e40:	83 ec 04             	sub    esp,0x4
 1003e43:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1003e47:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:176
         printd(DEBUG_PAGING,"pagingUpdatePTEPresentFlag: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 1003e4b:	ff 33                	push   DWORD PTR [ebx]
 1003e4d:	53                   	push   ebx
 1003e4e:	68 a0 7e 00 01       	push   0x1007ea0
 1003e53:	6a 40                	push   0x40
 1003e55:	e8 3d e7 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:177
         if (present)
 1003e5a:	83 c4 10             	add    esp,0x10
 1003e5d:	89 f0                	mov    eax,esi
 1003e5f:	84 c0                	test   al,al
 1003e61:	74 05                	je     1003e68 <pagingUpdatePTEPresentFlag+0x2a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:178
             *ptEntry=*ptEntry | 1;
 1003e63:	83 0b 01             	or     DWORD PTR [ebx],0x1
 1003e66:	eb 03                	jmp    1003e6b <pagingUpdatePTEPresentFlag+0x2d>
/home/yogi/src/os/chrisOSKernel/src/paging.c:180
         else
             *ptEntry&=0xFFFFFFFE;
 1003e68:	83 23 fe             	and    DWORD PTR [ebx],0xfffffffe
/home/yogi/src/os/chrisOSKernel/src/paging.c:181
         __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
 1003e6b:	0f 20 d8             	mov    eax,cr3
 1003e6e:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:182
         printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 1003e71:	83 ec 04             	sub    esp,0x4
 1003e74:	ff 33                	push   DWORD PTR [ebx]
 1003e76:	68 85 7a 00 01       	push   0x1007a85
 1003e7b:	6a 40                	push   0x40
 1003e7d:	e8 15 e7 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:183
}
 1003e82:	83 c4 14             	add    esp,0x14
 1003e85:	5b                   	pop    ebx
 1003e86:	5e                   	pop    esi
 1003e87:	c3                   	ret    

01003e88 <pagingSetVirtualRangeRO>:
pagingSetVirtualRangeRO():
/home/yogi/src/os/chrisOSKernel/src/paging.c:186

void pagingSetVirtualRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 1003e88:	55                   	push   ebp
 1003e89:	57                   	push   edi
 1003e8a:	56                   	push   esi
 1003e8b:	53                   	push   ebx
 1003e8c:	83 ec 1c             	sub    esp,0x1c
 1003e8f:	8b 5c 24 34          	mov    ebx,DWORD PTR [esp+0x34]
 1003e93:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
 1003e97:	8b 74 24 3c          	mov    esi,DWORD PTR [esp+0x3c]
 1003e9b:	89 f0                	mov    eax,esi
 1003e9d:	88 44 24 0f          	mov    BYTE PTR [esp+0xf],al
/home/yogi/src/os/chrisOSKernel/src/paging.c:188
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
 1003ea1:	57                   	push   edi
 1003ea2:	53                   	push   ebx
 1003ea3:	68 dc 7e 00 01       	push   0x1007edc
 1003ea8:	6a 40                	push   0x40
 1003eaa:	e8 e8 e6 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:189
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 1003eaf:	8d 4f 01             	lea    ecx,[edi+0x1]
 1003eb2:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
 1003eb6:	83 c4 10             	add    esp,0x10
 1003eb9:	39 cb                	cmp    ebx,ecx
 1003ebb:	77 4f                	ja     1003f0c <pagingSetVirtualRangeRO+0x84>
 1003ebd:	89 f2                	mov    edx,esi
 1003ebf:	84 d2                	test   dl,dl
 1003ec1:	b8 d1 76 00 01       	mov    eax,0x10076d1
 1003ec6:	bd ce 76 00 01       	mov    ebp,0x10076ce
 1003ecb:	0f 44 e8             	cmove  ebp,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:193
    {
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 1003ece:	0f b6 7c 24 0f       	movzx  edi,BYTE PTR [esp+0xf]
/home/yogi/src/os/chrisOSKernel/src/paging.c:191
{
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
    {
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
 1003ed3:	83 ec 08             	sub    esp,0x8
 1003ed6:	53                   	push   ebx
 1003ed7:	ff 74 24 3c          	push   DWORD PTR [esp+0x3c]
 1003edb:	e8 b6 fe ff ff       	call   1003d96 <pagingGet4kPTEntryAddress>
 1003ee0:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:192
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
 1003ee2:	89 2c 24             	mov    DWORD PTR [esp],ebp
 1003ee5:	50                   	push   eax
 1003ee6:	53                   	push   ebx
 1003ee7:	68 d4 76 00 01       	push   0x10076d4
 1003eec:	6a 40                	push   0x40
 1003eee:	e8 a4 e6 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:193
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 1003ef3:	83 c4 18             	add    esp,0x18
 1003ef6:	57                   	push   edi
 1003ef7:	56                   	push   esi
 1003ef8:	e8 d2 d3 ff ff       	call   10012cf <kPagingSetPageReadOnlyFlag>
/home/yogi/src/os/chrisOSKernel/src/paging.c:189

void pagingSetVirtualRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 1003efd:	81 c3 00 10 00 00    	add    ebx,0x1000
 1003f03:	83 c4 10             	add    esp,0x10
 1003f06:	3b 5c 24 08          	cmp    ebx,DWORD PTR [esp+0x8]
 1003f0a:	76 c7                	jbe    1003ed3 <pagingSetVirtualRangeRO+0x4b>
/home/yogi/src/os/chrisOSKernel/src/paging.c:196
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
            
    }
}
 1003f0c:	83 c4 1c             	add    esp,0x1c
 1003f0f:	5b                   	pop    ebx
 1003f10:	5e                   	pop    esi
 1003f11:	5f                   	pop    edi
 1003f12:	5d                   	pop    ebp
 1003f13:	c3                   	ret    

01003f14 <pagingUpdatePresentFlagA>:
pagingUpdatePresentFlagA():
/home/yogi/src/os/chrisOSKernel/src/paging.c:200

//Absolute version, page passed is already virtual
void pagingUpdatePresentFlagA(uintptr_t pageDirAddress, uint32_t address, bool present)
{
 1003f14:	56                   	push   esi
 1003f15:	53                   	push   ebx
 1003f16:	83 ec 04             	sub    esp,0x4
 1003f19:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
 1003f1d:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/src/paging.c:201
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: Make 0x%08X %s\n", address, present?"present":"not present");
 1003f21:	84 db                	test   bl,bl
 1003f23:	ba ec 76 00 01       	mov    edx,0x10076ec
 1003f28:	b8 f0 76 00 01       	mov    eax,0x10076f0
 1003f2d:	0f 44 c2             	cmove  eax,edx
 1003f30:	50                   	push   eax
 1003f31:	56                   	push   esi
 1003f32:	68 0c 7f 00 01       	push   0x1007f0c
 1003f37:	6a 40                	push   0x40
 1003f39:	e8 59 e6 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:202
        uintptr_t* pagePTE= (uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address&0xFFFFF000);
 1003f3e:	83 c4 08             	add    esp,0x8
 1003f41:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 1003f47:	56                   	push   esi
 1003f48:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003f4c:	e8 45 fe ff ff       	call   1003d96 <pagingGet4kPTEntryAddress>
 1003f51:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:203
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: updating entry 0x%08X\n", pagePTE);
 1003f53:	83 c4 0c             	add    esp,0xc
 1003f56:	50                   	push   eax
 1003f57:	68 38 7f 00 01       	push   0x1007f38
 1003f5c:	6a 40                	push   0x40
 1003f5e:	e8 34 e6 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:204
    pagingUpdatePTEPresentFlag(pagePTE, present);
 1003f63:	83 c4 08             	add    esp,0x8
 1003f66:	0f b6 db             	movzx  ebx,bl
 1003f69:	53                   	push   ebx
 1003f6a:	56                   	push   esi
 1003f6b:	e8 ce fe ff ff       	call   1003e3e <pagingUpdatePTEPresentFlag>
/home/yogi/src/os/chrisOSKernel/src/paging.c:205
}
 1003f70:	83 c4 14             	add    esp,0x14
 1003f73:	5b                   	pop    ebx
 1003f74:	5e                   	pop    esi
 1003f75:	c3                   	ret    

01003f76 <pagingUpdatePresentFlagV>:
pagingUpdatePresentFlagV():
/home/yogi/src/os/chrisOSKernel/src/paging.c:208

void pagingUpdatePresentFlagV(uintptr_t pageDirAddress,uint32_t address, bool present)
{
 1003f76:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/paging.c:210
    address+=KERNEL_PAGED_BASE_ADDRESS; 
    pagingUpdatePresentFlagA(pageDirAddress,address, present);
 1003f79:	0f b6 44 24 1c       	movzx  eax,BYTE PTR [esp+0x1c]
 1003f7e:	50                   	push   eax
 1003f7f:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1003f83:	2d 00 00 00 40       	sub    eax,0x40000000
 1003f88:	50                   	push   eax
 1003f89:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003f8d:	e8 82 ff ff ff       	call   1003f14 <pagingUpdatePresentFlagA>
/home/yogi/src/os/chrisOSKernel/src/paging.c:211
}
 1003f92:	83 c4 1c             	add    esp,0x1c
 1003f95:	c3                   	ret    

01003f96 <pagingMapPage>:
pagingMapPage():
/home/yogi/src/os/chrisOSKernel/src/paging.c:215

///Map a page to a new address
void pagingMapPage(uintptr_t pageDirAddress, uintptr_t virtualAddress, uintptr_t physicalAddress, uint8_t flags)
{
 1003f96:	55                   	push   ebp
 1003f97:	57                   	push   edi
 1003f98:	56                   	push   esi
 1003f99:	53                   	push   ebx
 1003f9a:	83 ec 0c             	sub    esp,0xc
 1003f9d:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 1003fa1:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
 1003fa5:	8b 5c 24 2c          	mov    ebx,DWORD PTR [esp+0x2c]
/home/yogi/src/os/chrisOSKernel/src/paging.c:223
    uint32_t *ptrT;
    
    //Get pointer to the page directory
    ptr=(uint32_t*)pageDirAddress;
    //Get the appropriate entry in the page table
    ptrVal=ptr[(virtualAddress>>22)];
 1003fa9:	89 f0                	mov    eax,esi
 1003fab:	c1 e8 16             	shr    eax,0x16
 1003fae:	8d 7c 85 00          	lea    edi,[ebp+eax*4+0x0]
 1003fb2:	8b 07                	mov    eax,DWORD PTR [edi]
/home/yogi/src/os/chrisOSKernel/src/paging.c:224
    if (ptrVal==0)
 1003fb4:	85 c0                	test   eax,eax
 1003fb6:	75 46                	jne    1003ffe <pagingMapPage+0x68>
/home/yogi/src/os/chrisOSKernel/src/paging.c:227
    {
        //Get a page for the page table
        *ptrT=(uint32_t*)pagingAllocatePagingTablePage();
 1003fb8:	e8 7a fd ff ff       	call   1003d37 <pagingAllocatePagingTablePage>
/home/yogi/src/os/chrisOSKernel/src/paging.c:228
        printd(DEBUG_PAGING,"pagingMapPage: Page table didn't exist for address 0x%08X (CR3=0x%08X)\n\tAllocated page @ 0x%08X for the page table\n",virtualAddress,pageDirAddress,  *ptrT);
 1003fbd:	83 ec 0c             	sub    esp,0xc
 1003fc0:	50                   	push   eax
 1003fc1:	55                   	push   ebp
 1003fc2:	56                   	push   esi
 1003fc3:	68 d0 8e 00 01       	push   0x1008ed0
 1003fc8:	6a 40                	push   0x40
 1003fca:	e8 c8 e5 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:229
        ptr[(virtualAddress>>22)]=0x20000063;
 1003fcf:	c7 07 63 00 00 20    	mov    DWORD PTR [edi],0x20000063
/home/yogi/src/os/chrisOSKernel/src/paging.c:231
        ptrT[(virtualAddress&0x003FFFFF/4096)]=physicalAddress | flags;
        printd(DEBUG_PAGING,"kMapPage: Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", virtualAddress, &ptr[(virtualAddress>>22)], &ptrT[(virtualAddress&0x003FFFFF/4096)],ptrT[(virtualAddress&0x003FFFFF/4096)]);
 1003fd5:	83 c4 18             	add    esp,0x18
 1003fd8:	0f b6 db             	movzx  ebx,bl
 1003fdb:	0b 5c 24 30          	or     ebx,DWORD PTR [esp+0x30]
 1003fdf:	53                   	push   ebx
 1003fe0:	89 f0                	mov    eax,esi
 1003fe2:	25 ff 03 00 00       	and    eax,0x3ff
 1003fe7:	c1 e0 02             	shl    eax,0x2
 1003fea:	50                   	push   eax
 1003feb:	57                   	push   edi
 1003fec:	56                   	push   esi
 1003fed:	68 6c 7f 00 01       	push   0x1007f6c
 1003ff2:	6a 40                	push   0x40
 1003ff4:	e8 9e e5 ff ff       	call   1002597 <printd>
 1003ff9:	83 c4 20             	add    esp,0x20
 1003ffc:	eb 32                	jmp    1004030 <pagingMapPage+0x9a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:244
        ptrVal=ptr[virtualAddress>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(virtualAddress&0x003FFFFF)/4096;
        ptrT[ptrVal]=physicalAddress | flags;
 1003ffe:	25 00 f0 ff ff       	and    eax,0xfffff000
 1004003:	89 c2                	mov    edx,eax
 1004005:	89 f0                	mov    eax,esi
 1004007:	c1 e8 0a             	shr    eax,0xa
 100400a:	25 fc 0f 00 00       	and    eax,0xffc
 100400f:	01 d0                	add    eax,edx
 1004011:	0f b6 db             	movzx  ebx,bl
 1004014:	0b 5c 24 28          	or     ebx,DWORD PTR [esp+0x28]
 1004018:	89 18                	mov    DWORD PTR [eax],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:245
        printd(DEBUG_PAGING,"kMapPage:(2) Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", virtualAddress, &ptr[(virtualAddress>>22)], &ptrT[ptrVal],ptrT[ptrVal]);
 100401a:	83 ec 08             	sub    esp,0x8
 100401d:	53                   	push   ebx
 100401e:	50                   	push   eax
 100401f:	57                   	push   edi
 1004020:	56                   	push   esi
 1004021:	68 44 8f 00 01       	push   0x1008f44
 1004026:	6a 40                	push   0x40
 1004028:	e8 6a e5 ff ff       	call   1002597 <printd>
 100402d:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:247
    }
}
 1004030:	83 c4 0c             	add    esp,0xc
 1004033:	5b                   	pop    ebx
 1004034:	5e                   	pop    esi
 1004035:	5f                   	pop    edi
 1004036:	5d                   	pop    ebp
 1004037:	c3                   	ret    

01004038 <isPageMapped>:
isPageMapped():
/home/yogi/src/os/chrisOSKernel/src/paging.c:250

bool isPageMapped(uintptr_t pageDirAddress, uintptr_t Address)
{
 1004038:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/src/paging.c:251
    if (!pagingGet4kPTEntryValue(pageDirAddress,Address))
 100403b:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100403f:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1004043:	e8 7c fd ff ff       	call   1003dc4 <pagingGet4kPTEntryValue>
 1004048:	85 c0                	test   eax,eax
 100404a:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/src/paging.c:254
        return false;
    return true;
}
 100404d:	83 c4 1c             	add    esp,0x1c
 1004050:	c3                   	ret    

01004051 <unMapPage>:
unMapPage():
/home/yogi/src/os/chrisOSKernel/src/paging.c:257

void unMapPage(uintptr_t pageDirAddress, uintptr_t pageToUnmap, uint8_t newFlags)
{
 1004051:	57                   	push   edi
 1004052:	56                   	push   esi
 1004053:	53                   	push   ebx
 1004054:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
 1004058:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/src/paging.c:262
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)pageDirAddress;
    ptrVal=ptr[(pageToUnmap>>22)];
 100405c:	89 c8                	mov    eax,ecx
 100405e:	c1 e8 16             	shr    eax,0x16
 1004061:	c1 e0 02             	shl    eax,0x2
 1004064:	03 44 24 10          	add    eax,DWORD PTR [esp+0x10]
 1004068:	8b 10                	mov    edx,DWORD PTR [eax]
/home/yogi/src/os/chrisOSKernel/src/paging.c:263
    if (ptrVal==0 && pageToUnmap < kE820MemoryBytes)
 100406a:	85 d2                	test   edx,edx
 100406c:	75 4b                	jne    10040b9 <unMapPage+0x68>
/home/yogi/src/os/chrisOSKernel/src/paging.c:263 (discriminator 1)
 100406e:	bf 00 00 00 00       	mov    edi,0x0
 1004073:	3b 3d 4c 00 12 00    	cmp    edi,DWORD PTR ds:0x12004c
 1004079:	72 08                	jb     1004083 <unMapPage+0x32>
 100407b:	3b 0d 48 00 12 00    	cmp    ecx,DWORD PTR ds:0x120048
 1004081:	73 36                	jae    10040b9 <unMapPage+0x68>
/home/yogi/src/os/chrisOSKernel/src/paging.c:266
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(pageToUnmap>>22)]=0x20000063;
 1004083:	c7 00 63 00 00 20    	mov    DWORD PTR [eax],0x20000063
/home/yogi/src/os/chrisOSKernel/src/paging.c:267
        ptrT[(pageToUnmap&0x003FFFFF/4096)]=0 | newFlags;
 1004089:	89 ca                	mov    edx,ecx
 100408b:	81 e2 ff 03 00 00    	and    edx,0x3ff
 1004091:	8d 34 95 00 00 00 20 	lea    esi,[edx*4+0x20000000]
 1004098:	0f b6 db             	movzx  ebx,bl
 100409b:	89 1c 95 00 00 00 20 	mov    DWORD PTR [edx*4+0x20000000],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:268
        printd(DEBUG_PAGING,"kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", pageToUnmap, &ptr[(pageToUnmap>>22)], &ptrT[(pageToUnmap&0x003FFFFF/4096)]);
 10040a2:	83 ec 0c             	sub    esp,0xc
 10040a5:	56                   	push   esi
 10040a6:	50                   	push   eax
 10040a7:	51                   	push   ecx
 10040a8:	68 e8 7f 00 01       	push   0x1007fe8
 10040ad:	6a 40                	push   0x40
 10040af:	e8 e3 e4 ff ff       	call   1002597 <printd>
 10040b4:	83 c4 20             	add    esp,0x20
 10040b7:	eb 2f                	jmp    10040e8 <unMapPage+0x97>
/home/yogi/src/os/chrisOSKernel/src/paging.c:279
        ptrVal=ptr[pageToUnmap>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(pageToUnmap&0x003FFFFF)/4096;
        ptrT[ptrVal]=0 | newFlags;
 10040b9:	89 d6                	mov    esi,edx
 10040bb:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 10040c1:	89 ca                	mov    edx,ecx
 10040c3:	c1 ea 0a             	shr    edx,0xa
 10040c6:	81 e2 fc 0f 00 00    	and    edx,0xffc
 10040cc:	01 f2                	add    edx,esi
 10040ce:	0f b6 db             	movzx  ebx,bl
 10040d1:	89 1a                	mov    DWORD PTR [edx],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:280
        printd(DEBUG_PAGING,"2) Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", pageToUnmap, &ptr[(pageToUnmap>>22)], &ptrT[ptrVal]);
 10040d3:	83 ec 0c             	sub    esp,0xc
 10040d6:	52                   	push   edx
 10040d7:	50                   	push   eax
 10040d8:	51                   	push   ecx
 10040d9:	68 20 80 00 01       	push   0x1008020
 10040de:	6a 40                	push   0x40
 10040e0:	e8 b2 e4 ff ff       	call   1002597 <printd>
 10040e5:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:282
    }
}
 10040e8:	5b                   	pop    ebx
 10040e9:	5e                   	pop    esi
 10040ea:	5f                   	pop    edi
 10040eb:	c3                   	ret    

010040ec <pagingSetPhysicalRangeRO>:
pagingSetPhysicalRangeRO():
/home/yogi/src/os/chrisOSKernel/src/paging.c:285

void pagingSetPhysicalRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 10040ec:	83 ec 14             	sub    esp,0x14
 10040ef:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 10040f3:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
/home/yogi/src/os/chrisOSKernel/src/paging.c:286
    printd(DEBUG_PAGING,"kMakePhysicalRangeRO: Make 0x%08X(0x%08X)-0x%08X(0x%08X) r/o\n", startAddy, startAddy&0xFffff000, endAddy, endAddy&0xFFFFF000);
 10040f7:	89 d1                	mov    ecx,edx
 10040f9:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 10040ff:	51                   	push   ecx
 1004100:	52                   	push   edx
 1004101:	89 c2                	mov    edx,eax
 1004103:	81 e2 00 f0 ff ff    	and    edx,0xfffff000
 1004109:	52                   	push   edx
 100410a:	50                   	push   eax
 100410b:	68 50 80 00 01       	push   0x1008050
 1004110:	6a 40                	push   0x40
 1004112:	e8 80 e4 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:287
        panic("fix this!!!");
 1004117:	83 c4 14             	add    esp,0x14
 100411a:	68 8f 7a 00 01       	push   0x1007a8f
 100411f:	e8 d4 df ff ff       	call   10020f8 <panic>
/home/yogi/src/os/chrisOSKernel/src/paging.c:289
        //SetVirtualRangeRO((startAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, (endAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, readOnly);
}
 1004124:	83 c4 1c             	add    esp,0x1c
 1004127:	c3                   	ret    

01004128 <pagingSetPageInUseFlag>:
pagingSetPageInUseFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:292

void pagingSetPageInUseFlag(uintptr_t pageDirAddress, uintptr_t address, bool inUse)
{
 1004128:	56                   	push   esi
 1004129:	53                   	push   ebx
 100412a:	83 ec 04             	sub    esp,0x4
 100412d:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 1004131:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:294
    uintptr_t* ptEntry;
    printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 1004135:	80 7c 24 18 00       	cmp    BYTE PTR [esp+0x18],0x0
 100413a:	74 38                	je     1004174 <pagingSetPageInUseFlag+0x4c>
 100413c:	68 fc 76 00 01       	push   0x10076fc
 1004141:	53                   	push   ebx
 1004142:	68 90 80 00 01       	push   0x1008090
 1004147:	6a 40                	push   0x40
 1004149:	e8 49 e4 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:295
    ptEntry=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 100414e:	83 c4 08             	add    esp,0x8
 1004151:	53                   	push   ebx
 1004152:	56                   	push   esi
 1004153:	e8 3e fc ff ff       	call   1003d96 <pagingGet4kPTEntryAddress>
 1004158:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:296
    printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 100415a:	ff 30                	push   DWORD PTR [eax]
 100415c:	50                   	push   eax
 100415d:	68 d4 80 00 01       	push   0x10080d4
 1004162:	6a 40                	push   0x40
 1004164:	e8 2e e4 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:298
    if (inUse)
        *ptEntry|=PAGING_IN_USE_FLAG_MASK;
 1004169:	81 0b 00 08 00 00    	or     DWORD PTR [ebx],0x800
 100416f:	83 c4 20             	add    esp,0x20
 1004172:	eb 36                	jmp    10041aa <pagingSetPageInUseFlag+0x82>
/home/yogi/src/os/chrisOSKernel/src/paging.c:294
}

void pagingSetPageInUseFlag(uintptr_t pageDirAddress, uintptr_t address, bool inUse)
{
    uintptr_t* ptEntry;
    printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 1004174:	68 f8 76 00 01       	push   0x10076f8
 1004179:	53                   	push   ebx
 100417a:	68 90 80 00 01       	push   0x1008090
 100417f:	6a 40                	push   0x40
 1004181:	e8 11 e4 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:295
    ptEntry=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 1004186:	83 c4 08             	add    esp,0x8
 1004189:	53                   	push   ebx
 100418a:	56                   	push   esi
 100418b:	e8 06 fc ff ff       	call   1003d96 <pagingGet4kPTEntryAddress>
 1004190:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:296
    printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 1004192:	ff 30                	push   DWORD PTR [eax]
 1004194:	50                   	push   eax
 1004195:	68 d4 80 00 01       	push   0x10080d4
 100419a:	6a 40                	push   0x40
 100419c:	e8 f6 e3 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:300
    if (inUse)
        *ptEntry|=PAGING_IN_USE_FLAG_MASK;
    else
        *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
 10041a1:	81 23 ff f7 ff ff    	and    DWORD PTR [ebx],0xfffff7ff
 10041a7:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:301
}
 10041aa:	83 c4 04             	add    esp,0x4
 10041ad:	5b                   	pop    ebx
 10041ae:	5e                   	pop    esi
 10041af:	c3                   	ret    

010041b0 <pagingSetPageRangeInUseFlag>:
pagingSetPageRangeInUseFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:304

void pagingSetPageRangeInUseFlag(uintptr_t pageDirAddress, uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
 10041b0:	55                   	push   ebp
 10041b1:	57                   	push   edi
 10041b2:	56                   	push   esi
 10041b3:	53                   	push   ebx
 10041b4:	83 ec 0c             	sub    esp,0xc
 10041b7:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 10041bb:	8b 5c 24 24          	mov    ebx,DWORD PTR [esp+0x24]
 10041bf:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
 10041c3:	0f b6 44 24 30       	movzx  eax,BYTE PTR [esp+0x30]
/home/yogi/src/os/chrisOSKernel/src/paging.c:305
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 10041c8:	39 fb                	cmp    ebx,edi
 10041ca:	73 19                	jae    10041e5 <pagingSetPageRangeInUseFlag+0x35>
/home/yogi/src/os/chrisOSKernel/src/paging.c:306 (discriminator 3)
        pagingSetPageInUseFlag(pageDirAddress,cnt,inUse);
 10041cc:	0f b6 f0             	movzx  esi,al
 10041cf:	83 ec 04             	sub    esp,0x4
 10041d2:	56                   	push   esi
 10041d3:	53                   	push   ebx
 10041d4:	55                   	push   ebp
 10041d5:	e8 4e ff ff ff       	call   1004128 <pagingSetPageInUseFlag>
 10041da:	03 5c 24 3c          	add    ebx,DWORD PTR [esp+0x3c]
/home/yogi/src/os/chrisOSKernel/src/paging.c:305 (discriminator 3)
        *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
}

void pagingSetPageRangeInUseFlag(uintptr_t pageDirAddress, uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 10041de:	83 c4 10             	add    esp,0x10
 10041e1:	39 fb                	cmp    ebx,edi
 10041e3:	72 ea                	jb     10041cf <pagingSetPageRangeInUseFlag+0x1f>
/home/yogi/src/os/chrisOSKernel/src/paging.c:307
        pagingSetPageInUseFlag(pageDirAddress,cnt,inUse);
}
 10041e5:	83 c4 0c             	add    esp,0xc
 10041e8:	5b                   	pop    ebx
 10041e9:	5e                   	pop    esi
 10041ea:	5f                   	pop    edi
 10041eb:	5d                   	pop    ebp
 10041ec:	c3                   	ret    
 10041ed:	66 90                	xchg   ax,ax
 10041ef:	90                   	nop

010041f0 <destroyProcess>:
destroyProcess():
/home/yogi/src/os/chrisOSKernel/src/process.c:15
#include "process.h"
#include "alloc.h"
#include "printf.h"

void destroyProcess(process_t* process)
{
 10041f0:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/src/process.c:16
    freePage(process);
 10041f3:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 10041f7:	e8 6f f3 ff ff       	call   100356b <freePage>
/home/yogi/src/os/chrisOSKernel/src/process.c:17
}
 10041fc:	83 c4 1c             	add    esp,0x1c
 10041ff:	c3                   	ret    

01004200 <createProcess>:
createProcess():
/home/yogi/src/os/chrisOSKernel/src/process.c:20

process_t* createProcess(bool kernelTSS, char* path)
{
 1004200:	53                   	push   ebx
 1004201:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/src/process.c:24

    process_t* process;
    
    process=(process_t*)allocPages(sizeof(process_t));
 1004204:	68 04 02 00 00       	push   0x204
 1004209:	e8 c1 f2 ff ff       	call   10034cf <allocPages>
 100420e:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/process.c:25
    printd(DEBUG_PROCESS,"Created Process @ 0x%08X\n",process);
 1004210:	83 c4 0c             	add    esp,0xc
 1004213:	50                   	push   eax
 1004214:	68 9b 7a 00 01       	push   0x1007a9b
 1004219:	68 00 00 04 00       	push   0x40000
 100421e:	e8 74 e3 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/process.c:26
    process->task=createTask(true);
 1004223:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 100422a:	e8 42 01 00 00       	call   1004371 <createTask>
 100422f:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/chrisOSKernel/src/process.c:29
    
    
 1004231:	83 c4 18             	add    esp,0x18
 1004234:	5b                   	pop    ebx
 1004235:	c3                   	ret    
 1004236:	66 90                	xchg   ax,ax

01004238 <syscall169>:
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:25

void syscall169()
{
    uint8_t temp;
 
    __asm__ volatile ("cli"); /* disable all interrupts */
 1004238:	fa                   	cli    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1004239:	e4 64                	in     al,0x64
 100423b:	89 c2                	mov    edx,eax
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:30
    /* Clear all keyboard buffers (output and command buffers) */
    do
    {
        temp = inb(KBRD_INTRFC); /* empty user data */
        if (check_flag(temp, KBRD_BIT_KDATA) != 0)
 100423d:	a8 01                	test   al,0x1
 100423f:	74 02                	je     1004243 <syscall169+0xb>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1004241:	e4 60                	in     al,0x60
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:32
            inb(KBRD_IO); /* empty keyboard data */
    } while (check_flag(temp, KBRD_BIT_UDATA) != 0);
 1004243:	f6 c2 02             	test   dl,0x2
 1004246:	75 f1                	jne    1004239 <syscall169+0x1>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1004248:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 100424d:	e6 64                	out    0x64,al
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:36 (discriminator 1)
 
    outb(KBRD_INTRFC, KBRD_RESET); /* pulse CPU reset line */
loop:
    __asm__ volatile ("hlt"); /* if that didn't work, halt the CPU */
 100424f:	f4                   	hlt    
 1004250:	eb fd                	jmp    100424f <syscall169+0x17>
 1004252:	66 90                	xchg   ax,ax

01004254 <taskInit>:
taskInit():
/home/yogi/src/os/chrisOSKernel/src/task.c:15
extern tss_t* kTSSTable;
extern task_t* kTaskTable;
extern uint32_t kDebugLevel;

void taskInit()
{
 1004254:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:18 (discriminator 3)
    for (int cnt=0;cnt<TSS_TABLE_RECORD_COUNT/8;cnt++)
    {
        kTaskSlotAvailableInd[cnt]=0xFFFFFFFF;
 1004259:	8b 15 f4 03 12 00    	mov    edx,DWORD PTR ds:0x1203f4
 100425f:	c7 04 02 ff ff ff ff 	mov    DWORD PTR [edx+eax*1],0xffffffff
 1004266:	83 c0 04             	add    eax,0x4
/home/yogi/src/os/chrisOSKernel/src/task.c:16 (discriminator 3)
extern task_t* kTaskTable;
extern uint32_t kDebugLevel;

void taskInit()
{
    for (int cnt=0;cnt<TSS_TABLE_RECORD_COUNT/8;cnt++)
 1004269:	3d 00 20 00 00       	cmp    eax,0x2000
 100426e:	75 e9                	jne    1004259 <taskInit+0x5>
/home/yogi/src/os/chrisOSKernel/src/task.c:20
    {
        kTaskSlotAvailableInd[cnt]=0xFFFFFFFF;
    }
}
 1004270:	f3 c3                	repz ret 

01004272 <getTaskSlot>:
getTaskSlot():
/home/yogi/src/os/chrisOSKernel/src/task.c:24

///Find an open TSS slot and mark it in use
task_t* getTaskSlot()
{
 1004272:	57                   	push   edi
 1004273:	56                   	push   esi
 1004274:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/src/task.c:26
   int cnt=0,slot=0;
   uint32_t* ptr=kTaskSlotAvailableInd;
 1004275:	8b 1d f4 03 12 00    	mov    ebx,DWORD PTR ds:0x1203f4
/home/yogi/src/os/chrisOSKernel/src/task.c:25
}

///Find an open TSS slot and mark it in use
task_t* getTaskSlot()
{
   int cnt=0,slot=0;
 100427b:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:29
   uint32_t* ptr=kTaskSlotAvailableInd;
    while (cnt < TSS_TABLE_RECORD_COUNT/32)
    {
        printd (DEBUG_TASK,"getTask: Checking slots at 0x%08X, cnt=%u\n",ptr,cnt);
 1004280:	56                   	push   esi
 1004281:	53                   	push   ebx
 1004282:	68 88 8f 00 01       	push   0x1008f88
 1004287:	68 00 40 00 00       	push   0x4000
 100428c:	e8 06 e3 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/task.c:30
        slot=bitsScanF(ptr);
 1004291:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1004294:	e8 d6 c3 ff ff       	call   100066f <bitsScanF>
 1004299:	89 c7                	mov    edi,eax
/home/yogi/src/os/chrisOSKernel/src/task.c:31
        if (slot>-1)
 100429b:	83 c4 10             	add    esp,0x10
 100429e:	85 c0                	test   eax,eax
 10042a0:	78 5f                	js     1004301 <getTaskSlot+0x8f>
/home/yogi/src/os/chrisOSKernel/src/task.c:33
        {
            task_t* task=&kTaskTable[slot];
 10042a2:	89 c6                	mov    esi,eax
 10042a4:	c1 e6 04             	shl    esi,0x4
 10042a7:	03 35 fc 03 12 00    	add    esi,DWORD PTR ds:0x1203fc
/home/yogi/src/os/chrisOSKernel/src/task.c:34
            printd(DEBUG_TASK,"getTask: Marking TSS %u used\n",slot);
 10042ad:	83 ec 04             	sub    esp,0x4
 10042b0:	50                   	push   eax
 10042b1:	68 b5 7a 00 01       	push   0x1007ab5
 10042b6:	68 00 40 00 00       	push   0x4000
 10042bb:	e8 d7 e2 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/task.c:35
            bitsReset(ptr,slot);
 10042c0:	83 c4 08             	add    esp,0x8
 10042c3:	57                   	push   edi
 10042c4:	53                   	push   ebx
 10042c5:	e8 73 c3 ff ff       	call   100063d <bitsReset>
/home/yogi/src/os/chrisOSKernel/src/task.c:36
            task->tss=&kTSSTable[slot];
 10042ca:	6b c7 68             	imul   eax,edi,0x68
 10042cd:	03 05 f8 03 12 00    	add    eax,DWORD PTR ds:0x1203f8
 10042d3:	89 06                	mov    DWORD PTR [esi],eax
/home/yogi/src/os/chrisOSKernel/src/task.c:37
            if (slot>0)
 10042d5:	83 c4 10             	add    esp,0x10
 10042d8:	85 ff                	test   edi,edi
 10042da:	7e 09                	jle    10042e5 <getTaskSlot+0x73>
/home/yogi/src/os/chrisOSKernel/src/task.c:39
            {
                (task-1)->next=task;
 10042dc:	89 76 f8             	mov    DWORD PTR [esi-0x8],esi
/home/yogi/src/os/chrisOSKernel/src/task.c:40
                task->prev=(task-1);
 10042df:	8d 56 f0             	lea    edx,[esi-0x10]
 10042e2:	89 56 0c             	mov    DWORD PTR [esi+0xc],edx
/home/yogi/src/os/chrisOSKernel/src/task.c:42
            }
            printd(DEBUG_TASK,"getTask: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
 10042e5:	83 ec 0c             	sub    esp,0xc
 10042e8:	50                   	push   eax
 10042e9:	56                   	push   esi
 10042ea:	57                   	push   edi
 10042eb:	68 b4 8f 00 01       	push   0x1008fb4
 10042f0:	68 00 40 00 00       	push   0x4000
 10042f5:	e8 9d e2 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/task.c:43
            return task;
 10042fa:	83 c4 20             	add    esp,0x20
 10042fd:	89 f0                	mov    eax,esi
 10042ff:	eb 27                	jmp    1004328 <getTaskSlot+0xb6>
/home/yogi/src/os/chrisOSKernel/src/task.c:45
        }
        ptr++;cnt++;
 1004301:	83 c3 04             	add    ebx,0x4
 1004304:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/chrisOSKernel/src/task.c:27
///Find an open TSS slot and mark it in use
task_t* getTaskSlot()
{
   int cnt=0,slot=0;
   uint32_t* ptr=kTaskSlotAvailableInd;
    while (cnt < TSS_TABLE_RECORD_COUNT/32)
 1004307:	81 fe 00 02 00 00    	cmp    esi,0x200
 100430d:	0f 85 6d ff ff ff    	jne    1004280 <getTaskSlot+0xe>
/home/yogi/src/os/chrisOSKernel/src/task.c:47
            printd(DEBUG_TASK,"getTask: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
            return task;
        }
        ptr++;cnt++;
    }
    printk("tssUseAvailable: Cannot allocate TSS for new task");
 1004313:	83 ec 0c             	sub    esp,0xc
 1004316:	68 e8 8f 00 01       	push   0x1008fe8
 100431b:	e8 5f e2 ff ff       	call   100257f <printk>
/home/yogi/src/os/chrisOSKernel/src/task.c:48
    return NULL;
 1004320:	83 c4 10             	add    esp,0x10
 1004323:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:49
}
 1004328:	5b                   	pop    ebx
 1004329:	5e                   	pop    esi
 100432a:	5f                   	pop    edi
 100432b:	c3                   	ret    

0100432c <mmMapKernelIntoTask>:
mmMapKernelIntoTask():
/home/yogi/src/os/chrisOSKernel/src/task.c:52

void mmMapKernelIntoTask(task_t* task)
{
 100432c:	57                   	push   edi
 100432d:	56                   	push   esi
 100432e:	53                   	push   ebx
 100432f:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/task.c:53
    uint32_t debugVal=kDebugLevel;
 1004333:	8b 3d 38 03 12 00    	mov    edi,DWORD PTR ds:0x120338
/home/yogi/src/os/chrisOSKernel/src/task.c:54
    kDebugLevel=0;
 1004339:	c7 05 38 03 12 00 00 	mov    DWORD PTR ds:0x120338,0x0
 1004340:	00 00 00 
 1004343:	bb 00 00 00 c0       	mov    ebx,0xc0000000
/home/yogi/src/os/chrisOSKernel/src/task.c:56 (discriminator 3)
    for (int cnt=KERNEL_PAGED_BASE_ADDRESS;cnt<KERNEL_PAGED_BASE_ADDRESS+0x0FFFFFFF;cnt+=1000)
        pagingMapPage(task->tss->CR3,cnt,cnt,0x3);
 1004348:	6a 03                	push   0x3
 100434a:	53                   	push   ebx
 100434b:	53                   	push   ebx
 100434c:	8b 06                	mov    eax,DWORD PTR [esi]
 100434e:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 1004351:	e8 40 fc ff ff       	call   1003f96 <pagingMapPage>
/home/yogi/src/os/chrisOSKernel/src/task.c:55 (discriminator 3)

void mmMapKernelIntoTask(task_t* task)
{
    uint32_t debugVal=kDebugLevel;
    kDebugLevel=0;
    for (int cnt=KERNEL_PAGED_BASE_ADDRESS;cnt<KERNEL_PAGED_BASE_ADDRESS+0x0FFFFFFF;cnt+=1000)
 1004356:	81 c3 e8 03 00 00    	add    ebx,0x3e8
 100435c:	83 c4 10             	add    esp,0x10
 100435f:	81 fb 20 02 00 d0    	cmp    ebx,0xd0000220
 1004365:	75 e1                	jne    1004348 <mmMapKernelIntoTask+0x1c>
/home/yogi/src/os/chrisOSKernel/src/task.c:57
        pagingMapPage(task->tss->CR3,cnt,cnt,0x3);
    kDebugLevel=debugVal;
 1004367:	89 3d 38 03 12 00    	mov    DWORD PTR ds:0x120338,edi
/home/yogi/src/os/chrisOSKernel/src/task.c:58
}
 100436d:	5b                   	pop    ebx
 100436e:	5e                   	pop    esi
 100436f:	5f                   	pop    edi
 1004370:	c3                   	ret    

01004371 <createTask>:
createTask():
/home/yogi/src/os/chrisOSKernel/src/task.c:61

task_t* createTask(bool kernelTSS)
{
 1004371:	56                   	push   esi
 1004372:	53                   	push   ebx
 1004373:	83 ec 04             	sub    esp,0x4
 1004376:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/task.c:62
    task_t* task=getTaskSlot();     //create task in the kTaskTable, also a tss in the same slot# in kTSSTable
 100437a:	e8 f3 fe ff ff       	call   1004272 <getTaskSlot>
/home/yogi/src/os/chrisOSKernel/src/task.c:64
    
    if (task==0)
 100437f:	85 c0                	test   eax,eax
 1004381:	0f 84 c0 00 00 00    	je     1004447 <createTask+0xd6>
 1004387:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/task.c:66
        return NULL;
    kDebugLevel |= DEBUG_PAGING;
 1004389:	83 0d 38 03 12 00 40 	or     DWORD PTR ds:0x120338,0x40
/home/yogi/src/os/chrisOSKernel/src/task.c:69
    
    //Configure the task registers
    task->tss->EAX=0;
 1004390:	8b 00                	mov    eax,DWORD PTR [eax]
 1004392:	c7 40 28 00 00 00 00 	mov    DWORD PTR [eax+0x28],0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:70
    task->tss->EBX=task->tss->ECX=task->tss->EDX=task->tss->ESI=task->tss->EDI=task->tss->EBP=0;
 1004399:	8b 03                	mov    eax,DWORD PTR [ebx]
 100439b:	c7 40 3c 00 00 00 00 	mov    DWORD PTR [eax+0x3c],0x0
 10043a2:	c7 40 44 00 00 00 00 	mov    DWORD PTR [eax+0x44],0x0
 10043a9:	c7 40 40 00 00 00 00 	mov    DWORD PTR [eax+0x40],0x0
 10043b0:	c7 40 30 00 00 00 00 	mov    DWORD PTR [eax+0x30],0x0
 10043b7:	c7 40 2c 00 00 00 00 	mov    DWORD PTR [eax+0x2c],0x0
 10043be:	c7 40 34 00 00 00 00 	mov    DWORD PTR [eax+0x34],0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:71
    task->tss->SS0=0x10;
 10043c5:	8b 03                	mov    eax,DWORD PTR [ebx]
 10043c7:	66 c7 40 0a 10 00    	mov    WORD PTR [eax+0xa],0x10
/home/yogi/src/os/chrisOSKernel/src/task.c:74
    
    //If it is a kernel task
    if (kernelTSS)
 10043cd:	89 f0                	mov    eax,esi
 10043cf:	84 c0                	test   al,al
 10043d1:	74 1c                	je     10043ef <createTask+0x7e>
/home/yogi/src/os/chrisOSKernel/src/task.c:75
        task->tss->ES=task->tss->DS=task->tss->FS=task->tss->GS=0x10;
 10043d3:	8b 03                	mov    eax,DWORD PTR [ebx]
 10043d5:	66 c7 40 5e 10 00    	mov    WORD PTR [eax+0x5e],0x10
 10043db:	66 c7 40 5a 10 00    	mov    WORD PTR [eax+0x5a],0x10
 10043e1:	66 c7 40 56 10 00    	mov    WORD PTR [eax+0x56],0x10
 10043e7:	66 c7 40 4a 10 00    	mov    WORD PTR [eax+0x4a],0x10
 10043ed:	eb 10                	jmp    10043ff <createTask+0x8e>
/home/yogi/src/os/chrisOSKernel/src/task.c:77
    else
        panic("write non-kernel segment pop code");
 10043ef:	83 ec 0c             	sub    esp,0xc
 10043f2:	68 1c 90 00 01       	push   0x100901c
 10043f7:	e8 fc dc ff ff       	call   10020f8 <panic>
 10043fc:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/task.c:78
    task->tss->IOPB=0xFFFF;
 10043ff:	8b 03                	mov    eax,DWORD PTR [ebx]
 1004401:	66 c7 40 64 ff ff    	mov    WORD PTR [eax+0x64],0xffff
/home/yogi/src/os/chrisOSKernel/src/task.c:79
    task->tss->CR3=(uint32_t)allocPages(0x1000);
 1004407:	8b 33                	mov    esi,DWORD PTR [ebx]
 1004409:	83 ec 0c             	sub    esp,0xc
 100440c:	68 00 10 00 00       	push   0x1000
 1004411:	e8 b9 f0 ff ff       	call   10034cf <allocPages>
 1004416:	89 46 1c             	mov    DWORD PTR [esi+0x1c],eax
/home/yogi/src/os/chrisOSKernel/src/task.c:80
    printd(DEBUG_TASK,"Malloc'd 1k task page directory @ 0x%08X\n",task->tss->CR3);
 1004419:	83 c4 0c             	add    esp,0xc
 100441c:	8b 03                	mov    eax,DWORD PTR [ebx]
 100441e:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 1004421:	68 40 90 00 01       	push   0x1009040
 1004426:	68 00 40 00 00       	push   0x4000
 100442b:	e8 67 e1 ff ff       	call   1002597 <printd>
/home/yogi/src/os/chrisOSKernel/src/task.c:81
    task->pageTable=(uint32_t*)task->tss->CR3;
 1004430:	8b 03                	mov    eax,DWORD PTR [ebx]
 1004432:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1004435:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
/home/yogi/src/os/chrisOSKernel/src/task.c:82
    mmMapKernelIntoTask(task);
 1004438:	89 1c 24             	mov    DWORD PTR [esp],ebx
 100443b:	e8 ec fe ff ff       	call   100432c <mmMapKernelIntoTask>
/home/yogi/src/os/chrisOSKernel/src/task.c:83
    return task;
 1004440:	83 c4 10             	add    esp,0x10
 1004443:	89 d8                	mov    eax,ebx
 1004445:	eb 05                	jmp    100444c <createTask+0xdb>
/home/yogi/src/os/chrisOSKernel/src/task.c:65
task_t* createTask(bool kernelTSS)
{
    task_t* task=getTaskSlot();     //create task in the kTaskTable, also a tss in the same slot# in kTSSTable
    
    if (task==0)
        return NULL;
 1004447:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/task.c:84
    task->tss->CR3=(uint32_t)allocPages(0x1000);
    printd(DEBUG_TASK,"Malloc'd 1k task page directory @ 0x%08X\n",task->tss->CR3);
    task->pageTable=(uint32_t*)task->tss->CR3;
    mmMapKernelIntoTask(task);
    return task;
}
 100444c:	83 c4 04             	add    esp,0x4
 100444f:	5b                   	pop    ebx
 1004450:	5e                   	pop    esi
 1004451:	c3                   	ret    
