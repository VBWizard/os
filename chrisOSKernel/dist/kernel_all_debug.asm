
Debug/cross-Linux/kernel:     file format elf32-i386


Disassembly of section .text:

01000000 <update_cursor>:
update_cursor():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:26
KERNEL_DATA_SECTION int8_t savedPosPointer=0;
KERNEL_DATA_SECTION uint8_t kTerminalHeight;

void update_cursor()
 {
    unsigned short position=(terminal_row*VGA_WIDTH) + terminal_column;
 1000000:	8b 0d 00 00 12 00    	mov    ecx,DWORD PTR ds:0x120000
 1000006:	8d 0c 89             	lea    ecx,[ecx+ecx*4]
 1000009:	c1 e1 04             	shl    ecx,0x4
 100000c:	66 03 0d 04 00 12 00 	add    cx,WORD PTR ds:0x120004
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1000013:	ba d4 03 00 00       	mov    edx,0x3d4
 1000018:	b8 0f 00 00 00       	mov    eax,0xf
 100001d:	ee                   	out    dx,al
 100001e:	ba d5 03 00 00       	mov    edx,0x3d5
 1000023:	89 c8                	mov    eax,ecx
 1000025:	ee                   	out    dx,al
 1000026:	ba d4 03 00 00       	mov    edx,0x3d4
 100002b:	b8 0e 00 00 00       	mov    eax,0xe
 1000030:	ee                   	out    dx,al
 1000031:	89 c8                	mov    eax,ecx
 1000033:	66 c1 e8 08          	shr    ax,0x8
 1000037:	ba d5 03 00 00       	mov    edx,0x3d5
 100003c:	ee                   	out    dx,al
 100003d:	c3                   	ret    

0100003e <make_color>:
make_color():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:38
    outb(0x3D5, (unsigned char )((position>>8)&0xFF));
    //Move the cursor in the bios data area
 }

uint8_t make_color(enum vga_color fg, enum vga_color bg) {
        return fg | bg << 4;
 100003e:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 1000043:	c1 e0 04             	shl    eax,0x4
 1000046:	0a 44 24 04          	or     al,BYTE PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:39
}
 100004a:	c3                   	ret    

0100004b <make_vgaentry>:
make_vgaentry():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:44

uint16_t make_vgaentry(char c, uint8_t color) {
        uint16_t c16 = c;
        uint16_t color16 = color;
        return c16 | color16 << 8;
 100004b:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 1000050:	c1 e0 08             	shl    eax,0x8
 1000053:	66 0f be 54 24 04    	movsx  dx,BYTE PTR [esp+0x4]
 1000059:	09 d0                	or     eax,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:45
}
 100005b:	c3                   	ret    

0100005c <terminal_setcolor>:
terminal_setcolor():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:49


void terminal_setcolor(uint8_t color) {
        terminal_color = color;
 100005c:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1000060:	a2 08 00 12 00       	mov    ds:0x120008,al
 1000065:	c3                   	ret    

01000066 <terminal_putentryat>:
terminal_putentryat():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:52
}

void terminal_putentryat(char c, uint8_t color, size_t x, size_t y) {
 1000066:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:54
    const size_t index = y * VGA_WIDTH + x;
        terminal_buffer[index] = make_vgaentry(c, color);
 100006a:	8d 04 80             	lea    eax,[eax+eax*4]
 100006d:	c1 e0 04             	shl    eax,0x4
 1000070:	03 44 24 0c          	add    eax,DWORD PTR [esp+0xc]
 1000074:	0f b6 54 24 08       	movzx  edx,BYTE PTR [esp+0x8]
 1000079:	c1 e2 08             	shl    edx,0x8
 100007c:	66 0f be 4c 24 04    	movsx  cx,BYTE PTR [esp+0x4]
 1000082:	09 ca                	or     edx,ecx
 1000084:	8b 0d 0c 00 12 00    	mov    ecx,DWORD PTR ds:0x12000c
 100008a:	66 89 14 41          	mov    WORD PTR [ecx+eax*2],dx
 100008e:	c3                   	ret    

0100008f <cursorSavePosition>:
cursorSavePosition():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:59
}

void cursorSavePosition()
{
    if (savedPosPointer < 10)
 100008f:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
 1000096:	3c 09                	cmp    al,0x9
 1000098:	7f 23                	jg     10000bd <cursorSavePosition+0x2e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:61
    {
        savedPosX[++savedPosPointer] = terminal_column;
 100009a:	83 c0 01             	add    eax,0x1
 100009d:	a2 26 00 12 00       	mov    ds:0x120026,al
 10000a2:	0f be c0             	movsx  eax,al
 10000a5:	8b 15 04 00 12 00    	mov    edx,DWORD PTR ds:0x120004
 10000ab:	88 90 10 00 12 00    	mov    BYTE PTR [eax+0x120010],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:62
        savedPosY[savedPosPointer] = terminal_row;
 10000b1:	8b 15 00 00 12 00    	mov    edx,DWORD PTR ds:0x120000
 10000b7:	88 90 1c 00 12 00    	mov    BYTE PTR [eax+0x12001c],dl
 10000bd:	f3 c3                	repz ret 

010000bf <cursorRestorePosition>:
cursorRestorePosition():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:68
    }
}

void cursorRestorePosition()
{
    if (savedPosPointer > 0)
 10000bf:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
 10000c6:	84 c0                	test   al,al
 10000c8:	7e 29                	jle    10000f3 <cursorRestorePosition+0x34>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:70
    {
        terminal_column = savedPosX[savedPosPointer];
 10000ca:	0f be d0             	movsx  edx,al
 10000cd:	0f b6 8a 10 00 12 00 	movzx  ecx,BYTE PTR [edx+0x120010]
 10000d4:	89 0d 04 00 12 00    	mov    DWORD PTR ds:0x120004,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:71
        terminal_row = savedPosY[savedPosPointer--];
 10000da:	83 e8 01             	sub    eax,0x1
 10000dd:	a2 26 00 12 00       	mov    ds:0x120026,al
 10000e2:	0f b6 82 1c 00 12 00 	movzx  eax,BYTE PTR [edx+0x12001c]
 10000e9:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:72
        update_cursor();
 10000ee:	e8 0d ff ff ff       	call   1000000 <update_cursor>
 10000f3:	f3 c3                	repz ret 

010000f5 <terminal_clear>:
terminal_clear():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:77
    }
}

void terminal_clear()
{
 10000f5:	56                   	push   esi
 10000f6:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:79
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
 10000f7:	ba 00 00 00 00       	mov    edx,0x0
 10000fc:	be 00 00 00 00       	mov    esi,0x0
 1000101:	80 3d 27 00 12 00 00 	cmp    BYTE PTR ds:0x120027,0x0
 1000108:	75 30                	jne    100013a <terminal_clear+0x45>
 100010a:	eb 36                	jmp    1000142 <terminal_clear+0x4d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:82 (discriminator 3)
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
 100010c:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
 1000113:	c1 e0 08             	shl    eax,0x8
 1000116:	83 c8 20             	or     eax,0x20
 1000119:	8b 0d 0c 00 12 00    	mov    ecx,DWORD PTR ds:0x12000c
 100011f:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
 1000123:	83 c2 02             	add    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:80 (discriminator 3)

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
                for (size_t x = 0; x < VGA_WIDTH; x++) {
 1000126:	39 d3                	cmp    ebx,edx
 1000128:	75 e2                	jne    100010c <terminal_clear+0x17>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:79 (discriminator 2)
}

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
 100012a:	83 c6 01             	add    esi,0x1
 100012d:	89 da                	mov    edx,ebx
 100012f:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
 1000136:	39 f0                	cmp    eax,esi
 1000138:	76 08                	jbe    1000142 <terminal_clear+0x4d>
 100013a:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
 1000140:	eb ca                	jmp    100010c <terminal_clear+0x17>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:85
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
                }
        }
    terminal_column=0;
 1000142:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
 1000149:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:86
    terminal_row=0;
 100014c:	c7 05 00 00 12 00 00 	mov    DWORD PTR ds:0x120000,0x0
 1000153:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:87
    update_cursor();
 1000156:	e8 a5 fe ff ff       	call   1000000 <update_cursor>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:88
}
 100015b:	5b                   	pop    ebx
 100015c:	5e                   	pop    esi
 100015d:	c3                   	ret    

0100015e <terminal_clear_line>:
terminal_clear_line():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:91

void terminal_clear_line(unsigned lineNo)
{
 100015e:	53                   	push   ebx
 100015f:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:92
    if (lineNo>SYS_VGA_HEIGHT-1)
 1000163:	83 f8 31             	cmp    eax,0x31
 1000166:	77 2a                	ja     1000192 <terminal_clear_line+0x34>
 1000168:	8d 14 80             	lea    edx,[eax+eax*4]
 100016b:	c1 e2 05             	shl    edx,0x5
 100016e:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:97 (discriminator 3)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
 1000174:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
 100017b:	c1 e0 08             	shl    eax,0x8
 100017e:	83 c8 20             	or     eax,0x20
 1000181:	8b 0d 0c 00 12 00    	mov    ecx,DWORD PTR ds:0x12000c
 1000187:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
 100018b:	83 c2 02             	add    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:94 (discriminator 3)

void terminal_clear_line(unsigned lineNo)
{
    if (lineNo>SYS_VGA_HEIGHT-1)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
 100018e:	39 da                	cmp    edx,ebx
 1000190:	75 e2                	jne    1000174 <terminal_clear_line+0x16>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:99
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
    }
}
 1000192:	5b                   	pop    ebx
 1000193:	c3                   	ret    

01000194 <terminal_copyline>:
terminal_copyline():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:102

void terminal_copyline(unsigned dstLine, unsigned srcLine)
{
 1000194:	83 ec 10             	sub    esp,0x10
 1000197:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
 100019b:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:107
    unsigned rowBytes = VGA_WIDTH*2;
    uintptr_t dest=(uintptr_t)TEXTMODE_MEMORY_START+(dstLine*rowBytes);
    uintptr_t src=(uintptr_t)TEXTMODE_MEMORY_START+(srcLine*rowBytes);
    
    memcpy((void*)dest,(void*)src,rowBytes);
 100019f:	68 a0 00 00 00       	push   0xa0
 10001a4:	8d 04 80             	lea    eax,[eax+eax*4]
 10001a7:	c1 e0 05             	shl    eax,0x5
 10001aa:	05 00 80 0b 00       	add    eax,0xb8000
 10001af:	50                   	push   eax
 10001b0:	8d 04 92             	lea    eax,[edx+edx*4]
 10001b3:	c1 e0 05             	shl    eax,0x5
 10001b6:	05 00 80 0b 00       	add    eax,0xb8000
 10001bb:	50                   	push   eax
 10001bc:	e8 f7 1d 00 00       	call   1001fb8 <memcpy>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:108
}
 10001c1:	83 c4 1c             	add    esp,0x1c
 10001c4:	c3                   	ret    

010001c5 <terminal_putchar>:
terminal_putchar():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:110

void terminal_putchar(char c) {
 10001c5:	53                   	push   ebx
 10001c6:	83 ec 08             	sub    esp,0x8
 10001c9:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:111
    if (c=='\n')
 10001cd:	3c 0a                	cmp    al,0xa
 10001cf:	75 16                	jne    10001e7 <terminal_putchar+0x22>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:113
    {
            terminal_column = 0;
 10001d1:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
 10001d8:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:114
            terminal_row += 1;
 10001db:	83 05 00 00 12 00 01 	add    DWORD PTR ds:0x120000,0x1
 10001e2:	e9 d8 00 00 00       	jmp    10002bf <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:116
    }
    else if (c=='\b')
 10001e7:	3c 08                	cmp    al,0x8
 10001e9:	75 48                	jne    1000233 <terminal_putchar+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:118
    {
        if (terminal_column > 1)
 10001eb:	a1 04 00 12 00       	mov    eax,ds:0x120004
 10001f0:	83 f8 01             	cmp    eax,0x1
 10001f3:	76 0a                	jbe    10001ff <terminal_putchar+0x3a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:119
            terminal_column--;
 10001f5:	83 e8 01             	sub    eax,0x1
 10001f8:	a3 04 00 12 00       	mov    ds:0x120004,eax
 10001fd:	eb 11                	jmp    1000210 <terminal_putchar+0x4b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:122
        else
        {
            terminal_row--;
 10001ff:	83 2d 00 00 12 00 01 	sub    DWORD PTR ds:0x120000,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:123
            terminal_column=VGA_WIDTH;
 1000206:	c7 05 04 00 12 00 50 	mov    DWORD PTR ds:0x120004,0x50
 100020d:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:125
        }
        terminal_putentryat(' ', terminal_color, terminal_column, terminal_row);
 1000210:	ff 35 00 00 12 00    	push   DWORD PTR ds:0x120000
 1000216:	ff 35 04 00 12 00    	push   DWORD PTR ds:0x120004
 100021c:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
 1000223:	50                   	push   eax
 1000224:	6a 20                	push   0x20
 1000226:	e8 3b fe ff ff       	call   1000066 <terminal_putentryat>
 100022b:	83 c4 10             	add    esp,0x10
 100022e:	e9 8c 00 00 00       	jmp    10002bf <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:128
        
    }
    else if (c=='\t')
 1000233:	3c 09                	cmp    al,0x9
 1000235:	75 3b                	jne    1000272 <terminal_putchar+0xad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:130
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
 1000237:	8b 0d 04 00 12 00    	mov    ecx,DWORD PTR ds:0x120004
 100023d:	ba cd cc cc cc       	mov    edx,0xcccccccd
 1000242:	89 c8                	mov    eax,ecx
 1000244:	f7 e2                	mul    edx
 1000246:	c1 ea 02             	shr    edx,0x2
 1000249:	8d 5c 92 05          	lea    ebx,[edx+edx*4+0x5]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:132
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
 100024d:	39 d9                	cmp    ecx,ebx
 100024f:	b8 05 00 00 00       	mov    eax,0x5
 1000254:	0f 44 d8             	cmove  ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:134
        
        while (terminal_column < goTo)
 1000257:	39 d9                	cmp    ecx,ebx
 1000259:	73 64                	jae    10002bf <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:135
            terminal_putchar(' ');;
 100025b:	83 ec 0c             	sub    esp,0xc
 100025e:	6a 20                	push   0x20
 1000260:	e8 60 ff ff ff       	call   10001c5 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:134
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
        
        while (terminal_column < goTo)
 1000265:	83 c4 10             	add    esp,0x10
 1000268:	3b 1d 04 00 12 00    	cmp    ebx,DWORD PTR ds:0x120004
 100026e:	77 eb                	ja     100025b <terminal_putchar+0x96>
 1000270:	eb 4d                	jmp    10002bf <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:141
    
    //6 - cnt=0 to (5-1) 4
    //8 - cnt= to (5-3) 2
    }
    //We're going to ignore carriage return since most systems don't use it.  Unfortunately the FAT library we are using does
    else if (c=='\r')
 1000272:	3c 0d                	cmp    al,0xd
 1000274:	0f 84 86 00 00 00    	je     1000300 <terminal_putchar+0x13b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:146
        return;

        else
        {
                terminal_putentryat(c, terminal_color, terminal_column, terminal_row);
 100027a:	ff 35 00 00 12 00    	push   DWORD PTR ds:0x120000
 1000280:	ff 35 04 00 12 00    	push   DWORD PTR ds:0x120004
 1000286:	0f b6 15 08 00 12 00 	movzx  edx,BYTE PTR ds:0x120008
 100028d:	52                   	push   edx
 100028e:	0f be c0             	movsx  eax,al
 1000291:	50                   	push   eax
 1000292:	e8 cf fd ff ff       	call   1000066 <terminal_putentryat>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:147
                if (++terminal_column == VGA_WIDTH) {
 1000297:	a1 04 00 12 00       	mov    eax,ds:0x120004
 100029c:	83 c0 01             	add    eax,0x1
 100029f:	83 c4 10             	add    esp,0x10
 10002a2:	83 f8 50             	cmp    eax,0x50
 10002a5:	74 07                	je     10002ae <terminal_putchar+0xe9>
 10002a7:	a3 04 00 12 00       	mov    ds:0x120004,eax
 10002ac:	eb 11                	jmp    10002bf <terminal_putchar+0xfa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:148
                        terminal_column = 0;
 10002ae:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
 10002b5:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:149
                        terminal_row++;
 10002b8:	83 05 00 00 12 00 01 	add    DWORD PTR ds:0x120000,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:152
                }
        }
    if (terminal_row == kTerminalHeight)
 10002bf:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
 10002c6:	3b 05 00 00 12 00    	cmp    eax,DWORD PTR ds:0x120000
 10002cc:	75 2d                	jne    10002fb <terminal_putchar+0x136>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:154 (discriminator 1)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
 10002ce:	85 c0                	test   eax,eax
 10002d0:	74 22                	je     10002f4 <terminal_putchar+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:154
 10002d2:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:155 (discriminator 3)
            terminal_copyline(row, row+1);
 10002d7:	8d 58 01             	lea    ebx,[eax+0x1]
 10002da:	83 ec 08             	sub    esp,0x8
 10002dd:	53                   	push   ebx
 10002de:	50                   	push   eax
 10002df:	e8 b0 fe ff ff       	call   1000194 <terminal_copyline>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:154 (discriminator 3)
                        terminal_row++;
                }
        }
    if (terminal_row == kTerminalHeight)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
 10002e4:	89 d8                	mov    eax,ebx
 10002e6:	0f b6 15 27 00 12 00 	movzx  edx,BYTE PTR ds:0x120027
 10002ed:	83 c4 10             	add    esp,0x10
 10002f0:	39 da                	cmp    edx,ebx
 10002f2:	77 e3                	ja     10002d7 <terminal_putchar+0x112>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:157
            terminal_copyline(row, row+1);
        //memcpy((void *)TEXTMODE_MEMORY_START, (void *)TEXTMODE_MEMORY_START+160, 160*25);
        terminal_row--;
 10002f4:	83 2d 00 00 12 00 01 	sub    DWORD PTR ds:0x120000,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:159
    }
    update_cursor();
 10002fb:	e8 00 fd ff ff       	call   1000000 <update_cursor>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:160
}
 1000300:	83 c4 08             	add    esp,0x8
 1000303:	5b                   	pop    ebx
 1000304:	c3                   	ret    

01000305 <cursorUpdateBiosCursor>:
cursorUpdateBiosCursor():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:165

void cursorUpdateBiosCursor()
{
    uint8_t* bda=(uint8_t*)0x450;
    *bda=(uint8_t)(terminal_column & 0xFF);
 1000305:	a1 04 00 12 00       	mov    eax,ds:0x120004
 100030a:	a2 50 04 00 00       	mov    ds:0x450,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:167
    bda++;
    *bda=(uint8_t)((terminal_row+3) & 0xFF);
 100030f:	0f b6 05 00 00 12 00 	movzx  eax,BYTE PTR ds:0x120000
 1000316:	83 c0 03             	add    eax,0x3
 1000319:	a2 51 04 00 00       	mov    ds:0x451,al
 100031e:	c3                   	ret    

0100031f <cursorMoveTo>:
cursorMoveTo():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:172
}

void cursorMoveTo(uint8_t x, uint8_t y)
{
    terminal_row = y;
 100031f:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 1000324:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:173
    terminal_column = x;
 1000329:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 100032e:	a3 04 00 12 00       	mov    ds:0x120004,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:174
    update_cursor();
 1000333:	e8 c8 fc ff ff       	call   1000000 <update_cursor>
 1000338:	f3 c3                	repz ret 

0100033a <cursorMoveToX>:
cursorMoveToX():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:179
}

void cursorMoveToX(uint8_t x)
{
    terminal_column = x;
 100033a:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 100033f:	a3 04 00 12 00       	mov    ds:0x120004,eax
 1000344:	c3                   	ret    

01000345 <cursorMoveToY>:
cursorMoveToY():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:184
}

void cursorMoveToY(uint8_t y)
{
    terminal_row = y;
 1000345:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 100034a:	a3 00 00 12 00       	mov    ds:0x120000,eax
 100034f:	c3                   	ret    

01000350 <cursorGetPosX>:
cursorGetPosX():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:190
}

uint8_t cursorGetPosX()
{
    return terminal_column;
}
 1000350:	0f b6 05 04 00 12 00 	movzx  eax,BYTE PTR ds:0x120004
 1000357:	c3                   	ret    

01000358 <cursorGetMaxX>:
cursorGetMaxX():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:194
int cursorGetMaxX()
{
    return VGA_WIDTH;
}
 1000358:	b8 50 00 00 00       	mov    eax,0x50
 100035d:	c3                   	ret    

0100035e <cursorGetMaxY>:
cursorGetMaxY():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:198

int cursorGetMaxY()
{
    return kTerminalHeight;
 100035e:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:199
}
 1000365:	c3                   	ret    

01000366 <displayGetMaxXY>:
displayGetMaxXY():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:203

void displayGetMaxXY(int* maxX, int* maxY)
{
    *maxX=VGA_WIDTH;
 1000366:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 100036a:	c7 00 50 00 00 00    	mov    DWORD PTR [eax],0x50
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:204
    *maxY=kTerminalHeight;
 1000370:	0f b6 15 27 00 12 00 	movzx  edx,BYTE PTR ds:0x120027
 1000377:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100037b:	89 10                	mov    DWORD PTR [eax],edx
 100037d:	c3                   	ret    

0100037e <cursorGetPosY>:
cursorGetPosY():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:211
}

uint8_t cursorGetPosY()
{
    return terminal_row;
}
 100037e:	0f b6 05 00 00 12 00 	movzx  eax,BYTE PTR ds:0x120000
 1000385:	c3                   	ret    

01000386 <kTermPrint>:
kTermPrint():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:213

void kTermPrint(const char* data) {
 1000386:	56                   	push   esi
 1000387:	53                   	push   ebx
 1000388:	83 ec 10             	sub    esp,0x10
 100038b:	8b 74 24 1c          	mov    esi,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:214
        size_t datalen = strlen(data);
 100038f:	56                   	push   esi
 1000390:	e8 3b 22 00 00       	call   10025d0 <strlen>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:215
        for (size_t i = 0; i < datalen; i++)
 1000395:	83 c4 10             	add    esp,0x10
 1000398:	85 c0                	test   eax,eax
 100039a:	74 1a                	je     10003b6 <kTermPrint+0x30>
 100039c:	89 f3                	mov    ebx,esi
 100039e:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:216 (discriminator 3)
                terminal_putchar(data[i]);
 10003a0:	83 ec 0c             	sub    esp,0xc
 10003a3:	0f be 13             	movsx  edx,BYTE PTR [ebx]
 10003a6:	52                   	push   edx
 10003a7:	e8 19 fe ff ff       	call   10001c5 <terminal_putchar>
 10003ac:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:215 (discriminator 3)
    return terminal_row;
}

void kTermPrint(const char* data) {
        size_t datalen = strlen(data);
        for (size_t i = 0; i < datalen; i++)
 10003af:	83 c4 10             	add    esp,0x10
 10003b2:	39 f3                	cmp    ebx,esi
 10003b4:	75 ea                	jne    10003a0 <kTermPrint+0x1a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:217
                terminal_putchar(data[i]);
}
 10003b6:	83 c4 04             	add    esp,0x4
 10003b9:	5b                   	pop    ebx
 10003ba:	5e                   	pop    esi
 10003bb:	c3                   	ret    

010003bc <kTermInit>:
kTermInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:221


void kTermInit() {
    kTerminalHeight=SYS_VGA_HEIGHT;
 10003bc:	c6 05 27 00 12 00 32 	mov    BYTE PTR ds:0x120027,0x32
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:222
    terminal_row = 0;
 10003c3:	c7 05 00 00 12 00 00 	mov    DWORD PTR ds:0x120000,0x0
 10003ca:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:223
    terminal_column = 0;
 10003cd:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
 10003d4:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:224
    terminal_color = make_color(COLOR_LIGHT_BROWN, COLOR_BLACK);
 10003d7:	c6 05 08 00 12 00 0e 	mov    BYTE PTR ds:0x120008,0xe
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:225
    terminal_buffer = (uint16_t*) TEXTMODE_MEMORY_START;
 10003de:	c7 05 0c 00 12 00 00 	mov    DWORD PTR ds:0x12000c,0xb8000
 10003e5:	80 0b 00 
 10003e8:	c3                   	ret    

010003e9 <puts>:
puts():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:230
    //terminal_clear();
}

void puts(char* in)
{
 10003e9:	53                   	push   ebx
 10003ea:	83 ec 08             	sub    esp,0x8
 10003ed:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:231
    while (*in>'\0')
 10003f1:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 10003f4:	84 c0                	test   al,al
 10003f6:	7e 19                	jle    1000411 <puts+0x28>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:233
    {
        terminal_putchar(*in++);
 10003f8:	83 c3 01             	add    ebx,0x1
 10003fb:	83 ec 0c             	sub    esp,0xc
 10003fe:	0f be c0             	movsx  eax,al
 1000401:	50                   	push   eax
 1000402:	e8 be fd ff ff       	call   10001c5 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:231
    //terminal_clear();
}

void puts(char* in)
{
    while (*in>'\0')
 1000407:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 100040a:	83 c4 10             	add    esp,0x10
 100040d:	84 c0                	test   al,al
 100040f:	7f e7                	jg     10003f8 <puts+0xf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:235
    {
        terminal_putchar(*in++);
    }
}
 1000411:	83 c4 08             	add    esp,0x8
 1000414:	5b                   	pop    ebx
 1000415:	c3                   	ret    

01000416 <putc>:
putc():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:238

void putc(char c)
{
 1000416:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:239
    terminal_putchar(c);
 1000419:	0f be 44 24 1c       	movsx  eax,BYTE PTR [esp+0x1c]
 100041e:	50                   	push   eax
 100041f:	e8 a1 fd ff ff       	call   10001c5 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:240
 1000424:	83 c4 1c             	add    esp,0x1c
 1000427:	c3                   	ret    

01000428 <keyboardGetKeyFromBuffer>:
keyboardGetKeyFromBuffer():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:20
//Base moves when a key is taken from the buffer
uint8_t keyboardGetKeyFromBuffer()
{
    char lTemp=0;
    //printd(DEBUG_KEYBOARD,"\nkKeyboardBuffer=0x%08X, kKeyboardBufferBase=0x%08X, &kKeyboardBufferBase=0x%08X\n",kKeyboardBuffer, kKeyboardBufferBase,&kKeyboardBufferBase);
    if (kKeyboardBufferBase<=kKeyboardBuffer)
 1000428:	a1 24 04 12 00       	mov    eax,ds:0x120424
 100042d:	8b 15 e0 03 12 00    	mov    edx,DWORD PTR ds:0x1203e0
 1000433:	39 d0                	cmp    eax,edx
 1000435:	77 14                	ja     100044b <keyboardGetKeyFromBuffer+0x23>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:22
    {
        __asm__("cli\n");
 1000437:	fa                   	cli    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:23
        lTemp=*kKeyboardBufferBase++;
 1000438:	8d 48 01             	lea    ecx,[eax+0x1]
 100043b:	89 0d 24 04 12 00    	mov    DWORD PTR ds:0x120424,ecx
 1000441:	0f b6 00             	movzx  eax,BYTE PTR [eax]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:24
        __asm__("sti\n");
 1000444:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:26
    }
    if (kKeyboardBufferBase>kKeyboardBuffer)
 1000445:	39 ca                	cmp    edx,ecx
 1000447:	73 1d                	jae    1000466 <keyboardGetKeyFromBuffer+0x3e>
 1000449:	eb 05                	jmp    1000450 <keyboardGetKeyFromBuffer+0x28>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:18
//Get a key from the keyboard buffer
//Curr moves when a key is put into the buffer
//Base moves when a key is taken from the buffer
uint8_t keyboardGetKeyFromBuffer()
{
    char lTemp=0;
 100044b:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:28
        lTemp=*kKeyboardBufferBase++;
        __asm__("sti\n");
    }
    if (kKeyboardBufferBase>kKeyboardBuffer)
    {
        __asm__("cli\n");
 1000450:	fa                   	cli    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:29
        kKeyboardBufferBase=(char*)KEYBOARD_BUFFER_ADDRESS;
 1000451:	c7 05 24 04 12 00 b0 	mov    DWORD PTR ds:0x120424,0x1524b0
 1000458:	24 15 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:30
        kKeyboardBuffer=(char*)KEYBOARD_BUFFER_ADDRESS-1;
 100045b:	c7 05 e0 03 12 00 af 	mov    DWORD PTR ds:0x1203e0,0x1524af
 1000462:	24 15 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:31
        __asm__("sti\n");
 1000465:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:34
    }
    return lTemp;
}
 1000466:	f3 c3                	repz ret 

01000468 <waitForKeyboardKey>:
waitForKeyboardKey():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:37

char waitForKeyboardKey()
{
 1000468:	53                   	push   ebx
 1000469:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:38
    printd(DEBUG_KEYBOARD,"gKbd-W, %04X\t", kKeyboardBuffer);
 100046c:	ff 35 e0 03 12 00    	push   DWORD PTR ds:0x1203e0
 1000472:	68 04 73 00 01       	push   0x1007304
 1000477:	6a 10                	push   0x10
 1000479:	e8 bd 20 00 00       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:40
    char lTemp=0;
    printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
 100047e:	83 c4 0c             	add    esp,0xc
 1000481:	ff 35 e0 03 12 00    	push   DWORD PTR ds:0x1203e0
 1000487:	68 12 73 00 01       	push   0x1007312
 100048c:	6a 10                	push   0x10
 100048e:	e8 a8 20 00 00       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:42

    while (kKeyboardBuffer==(char*)KEYBOARD_BUFFER_ADDRESS)
 1000493:	83 c4 10             	add    esp,0x10
 1000496:	81 3d e0 03 12 00 b0 	cmp    DWORD PTR ds:0x1203e0,0x1524b0
 100049d:	24 15 00 
 10004a0:	75 30                	jne    10004d2 <waitForKeyboardKey+0x6a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:44
    {
        printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
 10004a2:	83 ec 04             	sub    esp,0x4
 10004a5:	68 b0 24 15 00       	push   0x1524b0
 10004aa:	68 12 73 00 01       	push   0x1007312
 10004af:	6a 10                	push   0x10
 10004b1:	e8 85 20 00 00       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:45
        __asm__("sti\n");
 10004b6:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:46
        waitTicks(1);
 10004b7:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 10004be:	e8 f6 29 00 00       	call   1002eb9 <waitTicks>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:42
{
    printd(DEBUG_KEYBOARD,"gKbd-W, %04X\t", kKeyboardBuffer);
    char lTemp=0;
    printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);

    while (kKeyboardBuffer==(char*)KEYBOARD_BUFFER_ADDRESS)
 10004c3:	83 c4 10             	add    esp,0x10
 10004c6:	81 3d e0 03 12 00 b0 	cmp    DWORD PTR ds:0x1203e0,0x1524b0
 10004cd:	24 15 00 
 10004d0:	74 d0                	je     10004a2 <waitForKeyboardKey+0x3a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:48
    {
        printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
        __asm__("sti\n");
        waitTicks(1);
    }
    lTemp=keyboardGetKeyFromBuffer();
 10004d2:	e8 51 ff ff ff       	call   1000428 <keyboardGetKeyFromBuffer>
 10004d7:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:49
    printd(DEBUG_KEYBOARD,"got a key %u!\n", lTemp);
 10004d9:	83 ec 04             	sub    esp,0x4
 10004dc:	0f be c0             	movsx  eax,al
 10004df:	50                   	push   eax
 10004e0:	68 28 73 00 01       	push   0x1007328
 10004e5:	6a 10                	push   0x10
 10004e7:	e8 4f 20 00 00       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:51
    return lTemp;
}
 10004ec:	89 d8                	mov    eax,ebx
 10004ee:	83 c4 18             	add    esp,0x18
 10004f1:	5b                   	pop    ebx
 10004f2:	c3                   	ret    

010004f3 <getKeyboardKey>:
getKeyboardKey():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:55

char getKeyboardKey()
{
        return keyboardGetKeyFromBuffer();
 10004f3:	e8 30 ff ff ff       	call   1000428 <keyboardGetKeyFromBuffer>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:56
}
 10004f8:	f3 c3                	repz ret 

010004fa <gets>:
gets():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:58
void gets(char* buffer, int len)
{
 10004fa:	57                   	push   edi
 10004fb:	56                   	push   esi
 10004fc:	53                   	push   ebx
 10004fd:	83 ec 14             	sub    esp,0x14
 1000500:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
 1000504:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:59
    volatile char inchar=0;
 1000508:	c6 44 24 13 00       	mov    BYTE PTR [esp+0x13],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:61
    int cnt=0;
    memset(buffer,0,len);
 100050d:	56                   	push   esi
 100050e:	6a 00                	push   0x0
 1000510:	57                   	push   edi
 1000511:	e8 7d 13 00 00       	call   1001893 <memset>
 1000516:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:60
        return keyboardGetKeyFromBuffer();
}
void gets(char* buffer, int len)
{
    volatile char inchar=0;
    int cnt=0;
 1000519:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:78
            if (inchar==0x0a)
            {
                printk("%c",inchar);
                return;
            }
            if (cnt<len-2)
 100051e:	83 ee 02             	sub    esi,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:64
    volatile char inchar=0;
    int cnt=0;
    memset(buffer,0,len);
    while (1==1)
    {
        inchar=getKeyboardKey();
 1000521:	e8 cd ff ff ff       	call   10004f3 <getKeyboardKey>
 1000526:	88 44 24 0f          	mov    BYTE PTR [esp+0xf],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:65
        if (inchar=='\b' && cnt>0)
 100052a:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 100052f:	85 db                	test   ebx,ebx
 1000531:	7e 1d                	jle    1000550 <gets+0x56>
 1000533:	3c 08                	cmp    al,0x8
 1000535:	75 19                	jne    1000550 <gets+0x56>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:67
        {
            buffer[cnt]=0;
 1000537:	c6 04 1f 00          	mov    BYTE PTR [edi+ebx*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:68
            cnt--;
 100053b:	83 eb 01             	sub    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:69
            puts("\b");
 100053e:	83 ec 0c             	sub    esp,0xc
 1000541:	68 37 73 00 01       	push   0x1007337
 1000546:	e8 9e fe ff ff       	call   10003e9 <puts>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:66
    memset(buffer,0,len);
    while (1==1)
    {
        inchar=getKeyboardKey();
        if (inchar=='\b' && cnt>0)
        {
 100054b:	83 c4 10             	add    esp,0x10
 100054e:	eb d1                	jmp    1000521 <gets+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:71
            buffer[cnt]=0;
            cnt--;
            puts("\b");
        }
        else if (inchar>0)
 1000550:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 1000555:	84 c0                	test   al,al
 1000557:	7e c8                	jle    1000521 <gets+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:73
        {
            if (inchar==0x0a)
 1000559:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 100055e:	3c 0a                	cmp    al,0xa
 1000560:	75 1b                	jne    100057d <gets+0x83>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:75
            {
                printk("%c",inchar);
 1000562:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 1000567:	83 ec 08             	sub    esp,0x8
 100056a:	0f be c0             	movsx  eax,al
 100056d:	50                   	push   eax
 100056e:	68 39 73 00 01       	push   0x1007339
 1000573:	e8 ab 1f 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:76
                return;
 1000578:	83 c4 10             	add    esp,0x10
 100057b:	eb 2d                	jmp    10005aa <gets+0xb0>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:78
            }
            if (cnt<len-2)
 100057d:	39 f3                	cmp    ebx,esi
 100057f:	7d a0                	jge    1000521 <gets+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:80
            {
                printk("%c",inchar);
 1000581:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 1000586:	83 ec 08             	sub    esp,0x8
 1000589:	0f be c0             	movsx  eax,al
 100058c:	50                   	push   eax
 100058d:	68 39 73 00 01       	push   0x1007339
 1000592:	e8 8c 1f 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:81
                buffer[cnt++]=inchar;
 1000597:	0f b6 44 24 1f       	movzx  eax,BYTE PTR [esp+0x1f]
 100059c:	88 04 1f             	mov    BYTE PTR [edi+ebx*1],al
 100059f:	83 c4 10             	add    esp,0x10
 10005a2:	8d 5b 01             	lea    ebx,[ebx+0x1]
 10005a5:	e9 77 ff ff ff       	jmp    1000521 <gets+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:85
            }
        }
    }
}
 10005aa:	83 c4 10             	add    esp,0x10
 10005ad:	5b                   	pop    ebx
 10005ae:	5e                   	pop    esi
 10005af:	5f                   	pop    edi
 10005b0:	c3                   	ret    

010005b1 <getc>:
getc():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:89

char getc()
{
   int inchar=getKeyboardKey();
 10005b1:	e8 3d ff ff ff       	call   10004f3 <getKeyboardKey>
 10005b6:	0f be c0             	movsx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:91
   
   while (inchar==0)
 10005b9:	85 c0                	test   eax,eax
 10005bb:	75 11                	jne    10005ce <getc+0x1d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:93
   {
       inchar=getKeyboardKey();
 10005bd:	e8 31 ff ff ff       	call   10004f3 <getKeyboardKey>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:94
        inchar=getKeyboardKey();
 10005c2:	e8 2c ff ff ff       	call   10004f3 <getKeyboardKey>
 10005c7:	0f be c0             	movsx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:91

char getc()
{
   int inchar=getKeyboardKey();
   
   while (inchar==0)
 10005ca:	85 c0                	test   eax,eax
 10005cc:	74 ef                	je     10005bd <getc+0xc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/char/keyboard.c:97
   {
       inchar=getKeyboardKey();
        inchar=getKeyboardKey();
   }
   return inchar;
}
 10005ce:	f3 c3                	repz ret 

010005d0 <bitsSet>:
bitsSet():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:5
#include <stdint.h>
#include <stdbool.h>

bool bitsSet(volatile uint32_t* array, uint32_t bit)
{
 10005d0:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:7
    int lRetVal=0;
    __asm__ volatile ("bts [%[array]],%[bit]\nmov eax,0\nsetc al\n" : [array] "+m" (*array), "=a" (lRetVal) : [bit] "r" (bit));
 10005d4:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10005d8:	0f ab 02             	bts    DWORD PTR [edx],eax
 10005db:	b8 00 00 00 00       	mov    eax,0x0
 10005e0:	0f 92 c0             	setb   al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:8
    return lRetVal;
 10005e3:	85 c0                	test   eax,eax
 10005e5:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:9
}
 10005e8:	c3                   	ret    

010005e9 <bitsReset>:
bitsReset():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:11
bool bitsReset(volatile uint32_t* array, uint32_t bit)
{
 10005e9:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:13
    int lRetVal=0;
    __asm__ volatile ("btr [%[array]],%[bit]\nmov eax,0\nsetc al\n" : [array] "+m" (*array), "=a" (lRetVal) : [bit] "r" (bit));
 10005ed:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10005f1:	0f b3 02             	btr    DWORD PTR [edx],eax
 10005f4:	b8 00 00 00 00       	mov    eax,0x0
 10005f9:	0f 92 c0             	setb   al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:14
    return lRetVal;
 10005fc:	85 c0                	test   eax,eax
 10005fe:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:15
}
 1000601:	c3                   	ret    

01000602 <bitsTest>:
bitsTest():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:17
bool bitsTest(volatile uint32_t* array, uint32_t bit)
{
 1000602:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:19
    int lRetVal=0;
    __asm__ volatile ("bt [%[array]],%[bit]\nmov eax,0\nsetc al\n" :[array] "+m" (*array), "=a" (lRetVal) : [bit] "r" (bit));
 1000606:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100060a:	0f a3 02             	bt     DWORD PTR [edx],eax
 100060d:	b8 00 00 00 00       	mov    eax,0x0
 1000612:	0f 92 c0             	setb   al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:20
    return lRetVal;
 1000615:	85 c0                	test   eax,eax
 1000617:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:21
}
 100061a:	c3                   	ret    

0100061b <bitsScanF>:
bitsScanF():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:24

int bitsScanF(volatile uint32_t* array)
{
 100061b:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:27
    int lRetVal=0;
    bool lErr=false;
    __asm__ volatile ("bsf %[ret],[%[array]]\nsetz cl\n" : [ret] "=b" (lRetVal), [lErr] "=c" (lErr) : [array] "m" (*array));
 100061c:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1000620:	0f bc 18             	bsf    ebx,DWORD PTR [eax]
 1000623:	0f 94 c1             	sete   cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:28
    if (lErr==false)
 1000626:	84 c9                	test   cl,cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:29
        return lRetVal;
 1000628:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100062d:	0f 44 c3             	cmove  eax,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/cpu/bits.c:32
    else
        return -1;
 1000630:	5b                   	pop    ebx
 1000631:	c3                   	ret    
 1000632:	66 90                	xchg   ax,ax

01000634 <ataWaitForDRQ>:
ataWaitForDRQ():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:22
float ticks=0;
struct ataDeviceInfo_t* atablockingReadDev;

//Returns non-zero value IF TIMEOUT
uint8_t __attribute__((noinline)) ataWaitForDRQ(struct ataDeviceInfo_t* devInfo, bool toBeSet, int forHowManyMS)
{
 1000634:	57                   	push   edi
 1000635:	56                   	push   esi
 1000636:	53                   	push   ebx
 1000637:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
 100063b:	0f b6 5c 24 14       	movzx  ebx,BYTE PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:23
    int ticks = forHowManyMS*kTicksPerMS;
 1000640:	8b 4c 24 18          	mov    ecx,DWORD PTR [esp+0x18]
 1000644:	0f af 0d 84 02 12 00 	imul   ecx,DWORD PTR ds:0x120284
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:25
    uint8_t inValue=0;
    while (ticks > 0)
 100064b:	85 c9                	test   ecx,ecx
 100064d:	7e 26                	jle    1000675 <ataWaitForDRQ+0x41>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:30
    {
        STI
        //waitTicks(1);
        __asm__("sti\nhlt\n");
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
 100064f:	0f b7 87 69 02 00 00 	movzx  eax,WORD PTR [edi+0x269]
 1000656:	8d 50 07             	lea    edx,[eax+0x7]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:27
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
    while (ticks > 0)
    {
        STI
 1000659:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:29
        //waitTicks(1);
        __asm__("sti\nhlt\n");
 100065a:	fb                   	sti    
 100065b:	f4                   	hlt    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100065c:	ec                   	in     al,dx
 100065d:	89 c6                	mov    esi,eax
ataWaitForDRQ():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:31
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (toBeSet && (inValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ)
 100065f:	84 db                	test   bl,bl
 1000661:	74 06                	je     1000669 <ataWaitForDRQ+0x35>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:31 (discriminator 1)
 1000663:	a8 08                	test   al,0x8
 1000665:	74 07                	je     100066e <ataWaitForDRQ+0x3a>
 1000667:	eb 31                	jmp    100069a <ataWaitForDRQ+0x66>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:33 (discriminator 1)
                return 0;
        else if ((!toBeSet && (inValue & ATA_STATUS_DRQ) != ATA_STATUS_DRQ))
 1000669:	83 e0 08             	and    eax,0x8
 100066c:	74 31                	je     100069f <ataWaitForDRQ+0x6b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:25
//Returns non-zero value IF TIMEOUT
uint8_t __attribute__((noinline)) ataWaitForDRQ(struct ataDeviceInfo_t* devInfo, bool toBeSet, int forHowManyMS)
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
    while (ticks > 0)
 100066e:	83 e9 01             	sub    ecx,0x1
 1000671:	75 e6                	jne    1000659 <ataWaitForDRQ+0x25>
 1000673:	eb 05                	jmp    100067a <ataWaitForDRQ+0x46>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:24

//Returns non-zero value IF TIMEOUT
uint8_t __attribute__((noinline)) ataWaitForDRQ(struct ataDeviceInfo_t* devInfo, bool toBeSet, int forHowManyMS)
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
 1000675:	be 00 00 00 00       	mov    esi,0x0
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 100067a:	8b 87 69 02 00 00    	mov    eax,DWORD PTR [edi+0x269]
 1000680:	8d 50 01             	lea    edx,[eax+0x1]
 1000683:	ec                   	in     al,dx
ataWaitForDRQ():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:37
                return 0;
        else if ((!toBeSet && (inValue & ATA_STATUS_DRQ) != ATA_STATUS_DRQ))
                return 0;
        ticks--;
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
 1000684:	0f b6 d0             	movzx  edx,al
 1000687:	89 15 68 3a 01 01    	mov    DWORD PTR ds:0x1013a68,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:38
    if ((hdError & 0x4)==0x4)
 100068d:	83 e0 04             	and    eax,0x4
 1000690:	b8 00 00 00 00       	mov    eax,0x0
 1000695:	0f 44 c6             	cmove  eax,esi
 1000698:	eb 05                	jmp    100069f <ataWaitForDRQ+0x6b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:32
        STI
        //waitTicks(1);
        __asm__("sti\nhlt\n");
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (toBeSet && (inValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ)
                return 0;
 100069a:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:41
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
    if ((hdError & 0x4)==0x4)
        return 0;
    return inValue;
}
 100069f:	5b                   	pop    ebx
 10006a0:	5e                   	pop    esi
 10006a1:	5f                   	pop    edi
 10006a2:	c3                   	ret    

010006a3 <ataWaitForIdle>:
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:44

uint8_t ataWaitForIdle(struct ataDeviceInfo_t* devInfo)
{
 10006a3:	53                   	push   ebx
 10006a4:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:48
    ticks = 0;
    uint8_t lValue=0;
    //printk("aaWaitForIdle: ticks(%u@0x%08X)=ATA_STANDARD_WAIT_MS(%d)*kTicksPerMS((%d@0x%08X))\n", ticks, &ticks, (ATA_STANDARD_WAIT_MS), kTicksPerMS, &kTicksPerMS);
    lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
 10006a7:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 10006ab:	8b 98 69 02 00 00    	mov    ebx,DWORD PTR [eax+0x269]
 10006b1:	8d 53 07             	lea    edx,[ebx+0x7]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10006b4:	ec                   	in     al,dx
 10006b5:	89 c1                	mov    ecx,eax
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:51
    if ((lValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ && ticks)
        inw(devInfo->ioPort+ATA_PORT_DATA);
    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 10006b7:	c7 05 5c 3a 01 01 00 	mov    DWORD PTR ds:0x1013a5c,0x3f800000
 10006be:	00 80 3f 
 10006c1:	a1 84 02 12 00       	mov    eax,ds:0x120284
 10006c6:	8d 04 80             	lea    eax,[eax+eax*4]
 10006c9:	01 c0                	add    eax,eax
 10006cb:	89 04 24             	mov    DWORD PTR [esp],eax
 10006ce:	db 04 24             	fild   DWORD PTR [esp]
 10006d1:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
 10006d5:	d9 44 24 04          	fld    DWORD PTR [esp+0x4]
 10006d9:	d9 ee                	fldz   
 10006db:	d9 c9                	fxch   st(1)
 10006dd:	db e9                	fucomi st,st(1)
 10006df:	dd d9                	fstp   st(1)
 10006e1:	72 5a                	jb     100073d <ataWaitForIdle+0x9a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:53
    {
        __asm__("sti\nhlt\n");
 10006e3:	fb                   	sti    
 10006e4:	f4                   	hlt    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10006e5:	ec                   	in     al,dx
 10006e6:	89 c1                	mov    ecx,eax
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:56
        lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
 10006e8:	25 88 00 00 00       	and    eax,0x88
 10006ed:	74 60                	je     100074f <ataWaitForIdle+0xac>
 10006ef:	d9 e8                	fld1   
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:58
                    return 0;
        ticks++;
 10006f1:	d9 e8                	fld1   
 10006f3:	eb 1c                	jmp    1000711 <ataWaitForIdle+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:53
    lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
    if ((lValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ && ticks)
        inw(devInfo->ioPort+ATA_PORT_DATA);
    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
    {
        __asm__("sti\nhlt\n");
 10006f5:	fb                   	sti    
 10006f6:	f4                   	hlt    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10006f7:	ec                   	in     al,dx
 10006f8:	89 c1                	mov    ecx,eax
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:56
        lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
 10006fa:	25 88 00 00 00       	and    eax,0x88
 10006ff:	75 0c                	jne    100070d <ataWaitForIdle+0x6a>
 1000701:	dd d8                	fstp   st(0)
 1000703:	dd d8                	fstp   st(0)
 1000705:	d9 1d 5c 3a 01 01    	fstp   DWORD PTR ds:0x1013a5c
 100070b:	eb 44                	jmp    1000751 <ataWaitForIdle+0xae>
 100070d:	d9 ca                	fxch   st(2)
 100070f:	d9 c9                	fxch   st(1)
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:58
                    return 0;
        ticks++;
 1000711:	dc c1                	fadd   st(1),st
 1000713:	d9 c9                	fxch   st(1)
 1000715:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
 1000719:	d9 44 24 04          	fld    DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:51
    uint8_t lValue=0;
    //printk("aaWaitForIdle: ticks(%u@0x%08X)=ATA_STANDARD_WAIT_MS(%d)*kTicksPerMS((%d@0x%08X))\n", ticks, &ticks, (ATA_STANDARD_WAIT_MS), kTicksPerMS, &kTicksPerMS);
    lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
    if ((lValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ && ticks)
        inw(devInfo->ioPort+ATA_PORT_DATA);
    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 100071d:	d9 c1                	fld    st(1)
 100071f:	d8 c1                	fadd   st,st(1)
 1000721:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
 1000725:	d9 44 24 04          	fld    DWORD PTR [esp+0x4]
 1000729:	d9 cb                	fxch   st(3)
 100072b:	db e9                	fucomi st,st(1)
 100072d:	dd d9                	fstp   st(1)
 100072f:	73 c4                	jae    10006f5 <ataWaitForIdle+0x52>
 1000731:	dd d8                	fstp   st(0)
 1000733:	dd d8                	fstp   st(0)
 1000735:	d9 1d 5c 3a 01 01    	fstp   DWORD PTR ds:0x1013a5c
 100073b:	eb 02                	jmp    100073f <ataWaitForIdle+0x9c>
 100073d:	dd d8                	fstp   st(0)
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 100073f:	8d 53 01             	lea    edx,[ebx+0x1]
 1000742:	ec                   	in     al,dx
ataWaitForIdle():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:60
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
                    return 0;
        ticks++;
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
 1000743:	0f b6 c0             	movzx  eax,al
 1000746:	a3 68 3a 01 01       	mov    ds:0x1013a68,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:61
    return lValue;
 100074b:	89 c8                	mov    eax,ecx
 100074d:	eb 02                	jmp    1000751 <ataWaitForIdle+0xae>
 100074f:	dd d8                	fstp   st(0)
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:62
}
 1000751:	83 c4 08             	add    esp,0x8
 1000754:	5b                   	pop    ebx
 1000755:	c3                   	ret    

01000756 <ataControllerIsReady>:
ataControllerIsReady():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:66


uint8_t ataControllerIsReady(struct ataDeviceInfo_t* devInfo)
{
 1000756:	55                   	push   ebp
 1000757:	57                   	push   edi
 1000758:	56                   	push   esi
 1000759:	53                   	push   ebx
 100075a:	83 ec 0c             	sub    esp,0xc
 100075d:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:69
    int ticks = 0;
    
    int lStatus=0;
 1000761:	bd 00 00 00 00       	mov    ebp,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:67
}


uint8_t ataControllerIsReady(struct ataDeviceInfo_t* devInfo)
{
    int ticks = 0;
 1000766:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:72
    
    int lStatus=0;
    uint8_t err=0;

    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 100076b:	eb 2a                	jmp    1000797 <ataControllerIsReady+0x41>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 100076d:	0f b7 87 69 02 00 00 	movzx  eax,WORD PTR [edi+0x269]
 1000774:	8d 50 07             	lea    edx,[eax+0x7]
 1000777:	ec                   	in     al,dx
 1000778:	89 c3                	mov    ebx,eax
ataControllerIsReady():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:75
    {
        lStatus=inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
 100077a:	83 ec 0c             	sub    esp,0xc
 100077d:	6a 01                	push   0x1
 100077f:	e8 48 27 00 00       	call   1002ecc <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:76
        ticks++;
 1000784:	83 c6 02             	add    esi,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:77
	lStatus &= (ATA_STATUS_BUSY | ATA_STATUS_READY| ATA_STATUS_SEEK);
 1000787:	89 dd                	mov    ebp,ebx
 1000789:	81 e5 d0 00 00 00    	and    ebp,0xd0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:78
        if (lStatus & ATA_STATUS_READY )
 100078f:	83 c4 10             	add    esp,0x10
 1000792:	f6 c3 40             	test   bl,0x40
 1000795:	75 71                	jne    1000808 <ataControllerIsReady+0xb2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:72
    int ticks = 0;
    
    int lStatus=0;
    uint8_t err=0;

    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 1000797:	a1 84 02 12 00       	mov    eax,ds:0x120284
 100079c:	8d 04 80             	lea    eax,[eax+eax*4]
 100079f:	01 c0                	add    eax,eax
 10007a1:	39 c6                	cmp    esi,eax
 10007a3:	7e c8                	jle    100076d <ataControllerIsReady+0x17>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:82
	lStatus &= (ATA_STATUS_BUSY | ATA_STATUS_READY| ATA_STATUS_SEEK);
        if (lStatus & ATA_STATUS_READY )
                return true;
    }

    if (lStatus==ATA_STATUS_ERROR || lStatus==ATA_STATUS_BUSY)
 10007a5:	81 fd 80 00 00 00    	cmp    ebp,0x80
 10007ab:	75 41                	jne    10007ee <ataControllerIsReady+0x98>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10007ad:	ba f1 01 00 00       	mov    edx,0x1f1
 10007b2:	ec                   	in     al,dx
 10007b3:	89 c3                	mov    ebx,eax
ataControllerIsReady():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:86
    {
         err=inb(0x1f1);
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10007b5:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 10007bc:	74 4a                	je     1000808 <ataControllerIsReady+0xb2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:87
            printd(DEBUG_HARDDRIVE,"ataControllerIsReady: DRQ wait failed, lStatus=%02X, err=%02X\n",lStatus,err);
 10007be:	0f b6 c0             	movzx  eax,al
 10007c1:	50                   	push   eax
 10007c2:	68 80 00 00 00       	push   0x80
 10007c7:	68 60 77 00 01       	push   0x1007760
 10007cc:	6a 08                	push   0x8
 10007ce:	e8 68 1d 00 00       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:90
#endif
    }
    if ( (lStatus & ATA_STATUS_READY)==0 && err==4)
 10007d3:	83 c4 10             	add    esp,0x10
 10007d6:	f7 c5 40 00 00 00    	test   ebp,0x40
 10007dc:	75 10                	jne    10007ee <ataControllerIsReady+0x98>
 10007de:	80 fb 04             	cmp    bl,0x4
 10007e1:	0f 94 c0             	sete   al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:91
        lStatus=ATA_STATUS_READY;
 10007e4:	84 c0                	test   al,al
 10007e6:	b8 40 00 00 00       	mov    eax,0x40
 10007eb:	0f 45 e8             	cmovne ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:93
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10007ee:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 10007f5:	74 11                	je     1000808 <ataControllerIsReady+0xb2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:94
            printk("ataControllerIsReady: returning %02X\n",lStatus);
 10007f7:	83 ec 08             	sub    esp,0x8
 10007fa:	55                   	push   ebp
 10007fb:	68 a0 77 00 01       	push   0x10077a0
 1000800:	e8 1e 1d 00 00       	call   1002523 <printk>
 1000805:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:97
#endif
    return true;
}
 1000808:	b8 01 00 00 00       	mov    eax,0x1
 100080d:	83 c4 0c             	add    esp,0xc
 1000810:	5b                   	pop    ebx
 1000811:	5e                   	pop    esi
 1000812:	5f                   	pop    edi
 1000813:	5d                   	pop    ebp
 1000814:	c3                   	ret    

01000815 <ataSelectDrive>:
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:115
		return true;
	return 1;
}

bool ataSelectDrive(struct ataDeviceInfo_t* devInfo, uint8_t head)
{
 1000815:	57                   	push   edi
 1000816:	56                   	push   esi
 1000817:	53                   	push   ebx
 1000818:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 100081c:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:116
    ataWaitForIdle(devInfo);
 1000820:	56                   	push   esi
 1000821:	e8 7d fe ff ff       	call   10006a3 <ataWaitForIdle>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:117
    outb(devInfo->ioPort+ATA_DRIVE_SELECT, devInfo->driveHeadPortDesignation | (head& 0xF) ); 
 1000826:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 100082c:	89 d8                	mov    eax,ebx
 100082e:	83 e0 0f             	and    eax,0xf
 1000831:	0a 86 6e 02 00 00    	or     al,BYTE PTR [esi+0x26e]
 1000837:	8d 51 06             	lea    edx,[ecx+0x6]
 100083a:	ee                   	out    dx,al
ataStatusIsOk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:101
    return true;
}

static bool ataStatusIsOk(struct ataDeviceInfo_t* devInfo)
{
	unsigned char status = inb(devInfo->ioPort+ATA_PORT_STATUS);
 100083b:	8d 51 07             	lea    edx,[ecx+0x7]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100083e:	ec                   	in     al,dx
ataStatusIsOk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:103

	if (status & ATA_STATUS_BUSY)
 100083f:	83 c4 04             	add    esp,0x4
 1000842:	84 c0                	test   al,al
 1000844:	0f 88 92 00 00 00    	js     10008dc <ataSelectDrive+0xc7>
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:136
        unsigned lDrive=inb(devInfo->ioPort+ATA_DRIVE_SELECT);
            printk("ataSelectDrive: Drive selected: %s (%u, 0x%02X), err=0x%02X\n", (lDrive & (1<<4)) == 1<<4?"Slave":"Master", devInfo->driveNo, lDrive, inb(devInfo->ioPort+ATA_PORT_ERROR));
    }
#endif
        
    return 0;
 100084a:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:128
            printk("ataSelectDrive: Failed to select drive %u, bus %u, status=0x%02X is not ok\n", devInfo->driveNo, devInfo->bus, inb(devInfo->ioPort+ATA_PORT_STATUS));
#endif
            return inb(devInfo->ioPort+ATA_PORT_STATUS);
    }
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 100084f:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000856:	0f 84 8e 00 00 00    	je     10008ea <ataSelectDrive+0xd5>
 100085c:	eb 2f                	jmp    100088d <ataSelectDrive+0x78>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 100085e:	ec                   	in     al,dx
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:123
    //printk("Sending 0x%02X", drive==master?ATA_DRIVE_MASTER:ATA_DRIVE_SLAVE | (head& 0xF));
    if (!ataStatusIsOk(devInfo))
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("ataSelectDrive: Failed to select drive %u, bus %u, status=0x%02X is not ok\n", devInfo->driveNo, devInfo->bus, inb(devInfo->ioPort+ATA_PORT_STATUS));
 100085f:	0f b6 c0             	movzx  eax,al
 1000862:	50                   	push   eax
 1000863:	ff b6 61 02 00 00    	push   DWORD PTR [esi+0x261]
 1000869:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 100086f:	68 c8 77 00 01       	push   0x10077c8
 1000874:	e8 aa 1c 00 00       	call   1002523 <printk>
 1000879:	83 c4 10             	add    esp,0x10
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 100087c:	8b 86 69 02 00 00    	mov    eax,DWORD PTR [esi+0x269]
 1000882:	8d 50 07             	lea    edx,[eax+0x7]
 1000885:	ec                   	in     al,dx
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:125
#endif
            return inb(devInfo->ioPort+ATA_PORT_STATUS);
 1000886:	84 c0                	test   al,al
 1000888:	0f 95 c0             	setne  al
 100088b:	eb 5d                	jmp    10008ea <ataSelectDrive+0xd5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:130
    }
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
    {
        wait(10);
 100088d:	83 ec 0c             	sub    esp,0xc
 1000890:	6a 0a                	push   0xa
 1000892:	e8 35 26 00 00       	call   1002ecc <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:131
        unsigned lDrive=inb(devInfo->ioPort+ATA_DRIVE_SELECT);
 1000897:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 100089d:	8d 51 06             	lea    edx,[ecx+0x6]
 10008a0:	ec                   	in     al,dx
 10008a1:	89 c3                	mov    ebx,eax
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:131
 10008a3:	0f b6 f8             	movzx  edi,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10008a6:	8d 51 01             	lea    edx,[ecx+0x1]
 10008a9:	ec                   	in     al,dx
ataSelectDrive():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:132
            printk("ataSelectDrive: Drive selected: %s (%u, 0x%02X), err=0x%02X\n", (lDrive & (1<<4)) == 1<<4?"Slave":"Master", devInfo->driveNo, lDrive, inb(devInfo->ioPort+ATA_PORT_ERROR));
 10008aa:	0f b6 c8             	movzx  ecx,al
 10008ad:	83 e3 10             	and    ebx,0x10
 10008b0:	ba 42 73 00 01       	mov    edx,0x1007342
 10008b5:	b8 3c 73 00 01       	mov    eax,0x100733c
 10008ba:	0f 44 c2             	cmove  eax,edx
 10008bd:	89 0c 24             	mov    DWORD PTR [esp],ecx
 10008c0:	57                   	push   edi
 10008c1:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 10008c7:	50                   	push   eax
 10008c8:	68 14 78 00 01       	push   0x1007814
 10008cd:	e8 51 1c 00 00       	call   1002523 <printk>
 10008d2:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:136
    }
#endif
        
    return 0;
 10008d5:	b8 00 00 00 00       	mov    eax,0x0
 10008da:	eb 0e                	jmp    10008ea <ataSelectDrive+0xd5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:122
    outb(devInfo->ioPort+ATA_DRIVE_SELECT, devInfo->driveHeadPortDesignation | (head& 0xF) ); 
    //printk("Sending 0x%02X", drive==master?ATA_DRIVE_MASTER:ATA_DRIVE_SLAVE | (head& 0xF));
    if (!ataStatusIsOk(devInfo))
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10008dc:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 10008e3:	74 97                	je     100087c <ataSelectDrive+0x67>
 10008e5:	e9 74 ff ff ff       	jmp    100085e <ataSelectDrive+0x49>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:137
            printk("ataSelectDrive: Drive selected: %s (%u, 0x%02X), err=0x%02X\n", (lDrive & (1<<4)) == 1<<4?"Slave":"Master", devInfo->driveNo, lDrive, inb(devInfo->ioPort+ATA_PORT_ERROR));
    }
#endif
        
    return 0;
}
 10008ea:	5b                   	pop    ebx
 10008eb:	5e                   	pop    esi
 10008ec:	5f                   	pop    edi
 10008ed:	c3                   	ret    

010008ee <ataInit>:
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:180
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("ataResetController: controller is ready\n");
#endif
}
int ataInit(struct ataDeviceInfo_t* devInfo)
{
 10008ee:	57                   	push   edi
 10008ef:	56                   	push   esi
 10008f0:	53                   	push   ebx
 10008f1:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10008f5:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 10008fc:	8d 50 07             	lea    edx,[eax+0x7]
 10008ff:	b8 04 00 00 00       	mov    eax,0x4
 1000904:	ee                   	out    dx,al
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:163
}
*/
static void ataResetController(struct ataDeviceInfo_t* devInfo)
{
        outb(devInfo->ioPort+ATA_PORT_COMMAND, 4);
        waitTicks(kTicksPerSecond/10);
 1000905:	83 ec 0c             	sub    esp,0xc
 1000908:	8b 0d 80 02 12 00    	mov    ecx,DWORD PTR ds:0x120280
 100090e:	ba 67 66 66 66       	mov    edx,0x66666667
 1000913:	89 c8                	mov    eax,ecx
 1000915:	f7 ea                	imul   edx
 1000917:	c1 fa 02             	sar    edx,0x2
 100091a:	c1 f9 1f             	sar    ecx,0x1f
 100091d:	29 ca                	sub    edx,ecx
 100091f:	52                   	push   edx
 1000920:	e8 94 25 00 00       	call   1002eb9 <waitTicks>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
 1000925:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 100092c:	8d 90 f6 03 00 00    	lea    edx,[eax+0x3f6]
 1000932:	b8 04 00 00 00       	mov    eax,0x4
 1000937:	ee                   	out    dx,al
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:165
        outb(devInfo->ioPort+ATA_PORT_CONTROL, 1<<2);
        wait(10);
 1000938:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
 100093f:	e8 88 25 00 00       	call   1002ecc <wait>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
 1000944:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 100094b:	8d 90 f6 03 00 00    	lea    edx,[eax+0x3f6]
 1000951:	b8 00 00 00 00       	mov    eax,0x0
 1000956:	ee                   	out    dx,al
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:167
        outb(devInfo->ioPort+ATA_PORT_CONTROL, 0);
        if (!ataControllerIsReady(devInfo))
 1000957:	89 34 24             	mov    DWORD PTR [esp],esi
 100095a:	e8 f7 fd ff ff       	call   1000756 <ataControllerIsReady>
 100095f:	83 c4 10             	add    esp,0x10
 1000962:	84 c0                	test   al,al
 1000964:	75 19                	jne    100097f <ataInit+0x91>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:169
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000966:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 100096d:	74 10                	je     100097f <ataInit+0x91>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:170
            printk("HD-controller still busy\n");
 100096f:	83 ec 0c             	sub    esp,0xc
 1000972:	68 5b 73 00 01       	push   0x100735b
 1000977:	e8 a7 1b 00 00       	call   1002523 <printk>
 100097c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
#endif
        if ((hdError = inb(devInfo->ioPort+ATA_PORT_ERROR)) != 0 && (hdError = inb(devInfo->ioPort+ATA_PORT_ERROR)) != 4)
 100097f:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000986:	8d 50 01             	lea    edx,[eax+0x1]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1000989:	ec                   	in     al,dx
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
 100098a:	84 c0                	test   al,al
 100098c:	75 0c                	jne    100099a <ataInit+0xac>
 100098e:	c7 05 68 3a 01 01 00 	mov    DWORD PTR ds:0x1013a68,0x0
 1000995:	00 00 00 
 1000998:	eb 34                	jmp    10009ce <ataInit+0xe0>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 100099a:	ec                   	in     al,dx
ataResetController():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
 100099b:	0f b6 c0             	movzx  eax,al
 100099e:	a3 68 3a 01 01       	mov    ds:0x1013a68,eax
 10009a3:	83 f8 04             	cmp    eax,0x4
 10009a6:	74 26                	je     10009ce <ataInit+0xe0>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:173
            printk("Controller reset failed on %s bus: %02x\n",devInfo->bus==0?"Primary":"Secondary", hdError);
 10009a8:	83 be 61 02 00 00 00 	cmp    DWORD PTR [esi+0x261],0x0
 10009af:	b9 51 73 00 01       	mov    ecx,0x1007351
 10009b4:	ba 49 73 00 01       	mov    edx,0x1007349
 10009b9:	0f 45 d1             	cmovne edx,ecx
 10009bc:	83 ec 04             	sub    esp,0x4
 10009bf:	50                   	push   eax
 10009c0:	52                   	push   edx
 10009c1:	68 54 78 00 01       	push   0x1007854
 10009c6:	e8 58 1b 00 00       	call   1002523 <printk>
 10009cb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:175
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10009ce:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 10009d5:	74 10                	je     10009e7 <ataInit+0xf9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:176
            printk("ataResetController: controller is ready\n");
 10009d7:	83 ec 0c             	sub    esp,0xc
 10009da:	68 80 78 00 01       	push   0x1007880
 10009df:	e8 3f 1b 00 00       	call   1002523 <printk>
 10009e4:	83 c4 10             	add    esp,0x10
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:183
}
int ataInit(struct ataDeviceInfo_t* devInfo)
{
    ataResetController(devInfo);
    int cStatus=0, ticks=0;
    ataSelectDrive(devInfo,0);
 10009e7:	83 ec 08             	sub    esp,0x8
 10009ea:	6a 00                	push   0x0
 10009ec:	56                   	push   esi
 10009ed:	e8 23 fe ff ff       	call   1000815 <ataSelectDrive>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:184
    outb(devInfo->ioPort+ATA_PORT_SECTORCOUNT, 0x55);
 10009f2:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10009f8:	8d 51 02             	lea    edx,[ecx+0x2]
 10009fb:	b8 55 00 00 00       	mov    eax,0x55
 1000a00:	ee                   	out    dx,al
 1000a01:	8d 51 03             	lea    edx,[ecx+0x3]
 1000a04:	b8 aa ff ff ff       	mov    eax,0xffffffaa
 1000a09:	ee                   	out    dx,al
 1000a0a:	8d 51 04             	lea    edx,[ecx+0x4]
 1000a0d:	b8 55 00 00 00       	mov    eax,0x55
 1000a12:	ee                   	out    dx,al
 1000a13:	8d 51 05             	lea    edx,[ecx+0x5]
 1000a16:	b8 aa ff ff ff       	mov    eax,0xffffffaa
 1000a1b:	ee                   	out    dx,al
 1000a1c:	8d 51 07             	lea    edx,[ecx+0x7]
 1000a1f:	b8 ec ff ff ff       	mov    eax,0xffffffec
 1000a24:	ee                   	out    dx,al
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:189
    outb(devInfo->ioPort+ATA_PORT_SECTOR_NUMBER, 0xAA);
    outb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW,0x55);
    outb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH,0xAA);
    outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
    wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
 1000a25:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1000a2a:	8d 04 80             	lea    eax,[eax+eax*4]
 1000a2d:	01 c0                	add    eax,eax
 1000a2f:	89 04 24             	mov    DWORD PTR [esp],eax
 1000a32:	e8 95 24 00 00       	call   1002ecc <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:190
    cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
 1000a37:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1000a3d:	8d 51 07             	lea    edx,[ecx+0x7]
 1000a40:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:190
 1000a41:	0f b6 d8             	movzx  ebx,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:191
    if (cStatus==0)
 1000a44:	83 c4 10             	add    esp,0x10
 1000a47:	85 db                	test   ebx,ebx
 1000a49:	75 34                	jne    1000a7f <ataInit+0x191>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
        return false;
 1000a4b:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:194
    wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
    cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
    if (cStatus==0)
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000a50:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000a57:	0f 84 4d 01 00 00    	je     1000baa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:195
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
 1000a5d:	83 ec 04             	sub    esp,0x4
 1000a60:	6a 00                	push   0x0
 1000a62:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000a68:	68 75 73 00 01       	push   0x1007375
 1000a6d:	e8 b1 1a 00 00       	call   1002523 <printk>
 1000a72:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
#endif
        return false;
 1000a75:	b8 00 00 00 00       	mov    eax,0x0
 1000a7a:	e9 2b 01 00 00       	jmp    1000baa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:199
    }
    if ((cStatus & 1) == 1)
 1000a7f:	a8 01                	test   al,0x1
 1000a81:	0f 84 80 00 00 00    	je     1000b07 <ataInit+0x219>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000a87:	8d 51 01             	lea    edx,[ecx+0x1]
 1000a8a:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:201
    {
        int err = inb(devInfo->ioPort+ATA_PORT_ERROR);
 1000a8b:	0f b6 f8             	movzx  edi,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:203
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000a8e:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000a95:	74 15                	je     1000aac <ataInit+0x1be>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:204
            printk("drive %02X, cStatus=%02X, errreg=%02X\n",devInfo->driveNo, cStatus,err);
 1000a97:	57                   	push   edi
 1000a98:	53                   	push   ebx
 1000a99:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000a9f:	68 ac 78 00 01       	push   0x10078ac
 1000aa4:	e8 7a 1a 00 00       	call   1002523 <printk>
 1000aa9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:207
#endif
        if (err!=4)
            return false;
 1000aac:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:206
        int err = inb(devInfo->ioPort+ATA_PORT_ERROR);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("drive %02X, cStatus=%02X, errreg=%02X\n",devInfo->driveNo, cStatus,err);
#endif
        if (err!=4)
 1000ab1:	83 ff 04             	cmp    edi,0x4
 1000ab4:	0f 85 f0 00 00 00    	jne    1000baa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:208
            return false;
        useCDROMIdentify = true;
 1000aba:	c6 05 6c 3a 01 01 01 	mov    BYTE PTR ds:0x1013a6c,0x1
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000ac1:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000ac8:	8d 50 07             	lea    edx,[eax+0x7]
 1000acb:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:209
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
 1000acc:	0f b6 d8             	movzx  ebx,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:210
        if (cStatus==0)
 1000acf:	85 db                	test   ebx,ebx
 1000ad1:	75 34                	jne    1000b07 <ataInit+0x219>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:216
        {
#ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
                printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
            return false;
 1000ad3:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:213
        useCDROMIdentify = true;
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (cStatus==0)
        {
#ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000ad8:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000adf:	0f 84 c5 00 00 00    	je     1000baa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:214
                printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
 1000ae5:	83 ec 04             	sub    esp,0x4
 1000ae8:	6a 00                	push   0x0
 1000aea:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000af0:	68 75 73 00 01       	push   0x1007375
 1000af5:	e8 29 1a 00 00       	call   1002523 <printk>
 1000afa:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:216
#endif
            return false;
 1000afd:	b8 00 00 00 00       	mov    eax,0x0
 1000b02:	e9 a3 00 00 00       	jmp    1000baa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:219
        }
    }
    ticks=ATA_STANDARD_WAIT_MS*kTicksPerMS;
 1000b07:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1000b0c:	8d 04 80             	lea    eax,[eax+eax*4]
 1000b0f:	01 c0                	add    eax,eax
 1000b11:	89 c7                	mov    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:220
    while ((cStatus & ATA_STATUS_BUSY) == ATA_STATUS_BUSY && (ticks>0))
 1000b13:	c1 eb 07             	shr    ebx,0x7
 1000b16:	84 db                	test   bl,bl
 1000b18:	74 29                	je     1000b43 <ataInit+0x255>
 1000b1a:	85 c0                	test   eax,eax
 1000b1c:	7e 25                	jle    1000b43 <ataInit+0x255>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000b1e:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000b25:	8d 50 07             	lea    edx,[eax+0x7]
 1000b28:	ec                   	in     al,dx
 1000b29:	89 c3                	mov    ebx,eax
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:223
    {
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
 1000b2b:	83 ec 0c             	sub    esp,0xc
 1000b2e:	6a 01                	push   0x1
 1000b30:	e8 97 23 00 00       	call   1002ecc <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:224
        ticks--;
 1000b35:	83 ef 01             	sub    edi,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:220
#endif
            return false;
        }
    }
    ticks=ATA_STANDARD_WAIT_MS*kTicksPerMS;
    while ((cStatus & ATA_STATUS_BUSY) == ATA_STATUS_BUSY && (ticks>0))
 1000b38:	83 c4 10             	add    esp,0x10
 1000b3b:	84 db                	test   bl,bl
 1000b3d:	79 04                	jns    1000b43 <ataInit+0x255>
 1000b3f:	85 ff                	test   edi,edi
 1000b41:	7f db                	jg     1000b1e <ataInit+0x230>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:226
    {
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
        ticks--;
    }
    if (!ataControllerIsReady(devInfo))
 1000b43:	83 ec 0c             	sub    esp,0xc
 1000b46:	56                   	push   esi
 1000b47:	e8 0a fc ff ff       	call   1000756 <ataControllerIsReady>
 1000b4c:	89 c2                	mov    edx,eax
 1000b4e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:227
        return false;
 1000b51:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:226
    {
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
        ticks--;
    }
    if (!ataControllerIsReady(devInfo))
 1000b56:	84 d2                	test   dl,dl
 1000b58:	74 50                	je     1000baa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:228
        return false;
    if (inb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW)!=0x55 || inb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH)!=0xaa)
 1000b5a:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
 1000b60:	8d 59 04             	lea    ebx,[ecx+0x4]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000b63:	89 da                	mov    edx,ebx
 1000b65:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:228
 1000b66:	3c 55                	cmp    al,0x55
 1000b68:	75 08                	jne    1000b72 <ataInit+0x284>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39 (discriminator 1)
 1000b6a:	8d 51 05             	lea    edx,[ecx+0x5]
 1000b6d:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:228 (discriminator 1)
 1000b6e:	3c aa                	cmp    al,0xaa
 1000b70:	74 33                	je     1000ba5 <ataInit+0x2b7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:231
    {
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000b72:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000b79:	74 21                	je     1000b9c <ataInit+0x2ae>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1000b7b:	8d 51 05             	lea    edx,[ecx+0x5]
 1000b7e:	ec                   	in     al,dx
 1000b7f:	89 c1                	mov    ecx,eax
 1000b81:	89 da                	mov    edx,ebx
 1000b83:	ec                   	in     al,dx
ataInit():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:232
        printk("Cylinder port non-zero (%X,%X), device is non-ATA\n",inb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW), inb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH));
 1000b84:	83 ec 04             	sub    esp,0x4
 1000b87:	0f b6 c9             	movzx  ecx,cl
 1000b8a:	51                   	push   ecx
 1000b8b:	0f b6 c0             	movzx  eax,al
 1000b8e:	50                   	push   eax
 1000b8f:	68 d4 78 00 01       	push   0x10078d4
 1000b94:	e8 8a 19 00 00       	call   1002523 <printk>
 1000b99:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
        return false;
 1000b9c:	0f b6 05 6c 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a6c
 1000ba3:	eb 05                	jmp    1000baa <ataInit+0x2bc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:239
        if (useCDROMIdentify)
            return true;
        else
            return false;
    }
    return true;
 1000ba5:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:240
}
 1000baa:	5b                   	pop    ebx
 1000bab:	5e                   	pop    esi
 1000bac:	5f                   	pop    edi
 1000bad:	c3                   	ret    

01000bae <ataGetModelFromIdentify>:
ataGetModelFromIdentify():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:243

void ataGetModelFromIdentify(struct ataDeviceInfo_t* devInfo)
{
 1000bae:	56                   	push   esi
 1000baf:	53                   	push   ebx
 1000bb0:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:244
    uint16_t* ident=devInfo->ATAIdentifyData+27;
 1000bb4:	8d 46 36             	lea    eax,[esi+0x36]
 1000bb7:	8d 96 01 02 00 00    	lea    edx,[esi+0x201]
 1000bbd:	8d 5e 5e             	lea    ebx,[esi+0x5e]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:247 (discriminator 3)
    for (int cnt=0;cnt<40;cnt+=2)
    {
        devInfo->ATADeviceModel[cnt]=(*ident >> 8) & 0xFF;
 1000bc0:	0f b7 08             	movzx  ecx,WORD PTR [eax]
 1000bc3:	66 c1 e9 08          	shr    cx,0x8
 1000bc7:	88 4a ff             	mov    BYTE PTR [edx-0x1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:248 (discriminator 3)
        devInfo->ATADeviceModel[cnt+1]=(*ident++) & 0xFF;
 1000bca:	83 c0 02             	add    eax,0x2
 1000bcd:	0f b7 48 fe          	movzx  ecx,WORD PTR [eax-0x2]
 1000bd1:	88 0a                	mov    BYTE PTR [edx],cl
 1000bd3:	83 c2 02             	add    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:245 (discriminator 3)
}

void ataGetModelFromIdentify(struct ataDeviceInfo_t* devInfo)
{
    uint16_t* ident=devInfo->ATAIdentifyData+27;
    for (int cnt=0;cnt<40;cnt+=2)
 1000bd6:	39 d8                	cmp    eax,ebx
 1000bd8:	75 e6                	jne    1000bc0 <ataGetModelFromIdentify+0x12>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:250
    {
        devInfo->ATADeviceModel[cnt]=(*ident >> 8) & 0xFF;
        devInfo->ATADeviceModel[cnt+1]=(*ident++) & 0xFF;
    }
    devInfo->ATADeviceModel[79]='\0';
 1000bda:	c6 86 4f 02 00 00 00 	mov    BYTE PTR [esi+0x24f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:251
}
 1000be1:	5b                   	pop    ebx
 1000be2:	5e                   	pop    esi
 1000be3:	c3                   	ret    

01000be4 <ataIdentify>:
ataIdentify():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:254

int ataIdentify(struct ataDeviceInfo_t* devInfo)
{
 1000be4:	56                   	push   esi
 1000be5:	53                   	push   ebx
 1000be6:	83 ec 04             	sub    esp,0x4
 1000be9:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:256
    //For ATA devices, read the identity data.  For SATA, we've already read it into ATAIdentityData
    if (devInfo->queryATAData)
 1000bed:	80 be 50 02 00 00 00 	cmp    BYTE PTR [esi+0x250],0x0
 1000bf4:	74 5c                	je     1000c52 <ataIdentify+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:258
    {
        if (useCDROMIdentify)
 1000bf6:	80 3d 6c 3a 01 01 00 	cmp    BYTE PTR ds:0x1013a6c,0x0
 1000bfd:	74 12                	je     1000c11 <ataIdentify+0x2d>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1000bff:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000c06:	8d 50 07             	lea    edx,[eax+0x7]
 1000c09:	b8 a1 ff ff ff       	mov    eax,0xffffffa1
 1000c0e:	ee                   	out    dx,al
 1000c0f:	eb 10                	jmp    1000c21 <ataIdentify+0x3d>
 1000c11:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000c18:	8d 50 07             	lea    edx,[eax+0x7]
 1000c1b:	b8 ec ff ff ff       	mov    eax,0xffffffec
 1000c20:	ee                   	out    dx,al
ataIdentify():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:262
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_CDROM_COMMAND);
        else
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
        wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
 1000c21:	83 ec 0c             	sub    esp,0xc
 1000c24:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1000c29:	8d 04 80             	lea    eax,[eax+eax*4]
 1000c2c:	01 c0                	add    eax,eax
 1000c2e:	50                   	push   eax
 1000c2f:	e8 98 22 00 00       	call   1002ecc <wait>
 1000c34:	0f b7 96 69 02 00 00 	movzx  edx,WORD PTR [esi+0x269]
 1000c3b:	89 f1                	mov    ecx,esi
 1000c3d:	8d 9e 00 02 00 00    	lea    ebx,[esi+0x200]
 1000c43:	83 c4 10             	add    esp,0x10
inw():
/home/yogi/src/os/chrisOSKernel/include/io.h:46 (discriminator 3)
}

static __inline unsigned short inw(unsigned short __port)
{
	unsigned short __val;
	__asm__ volatile ("inw %0, %1" : "=a" (__val) : "dN" (__port));
 1000c46:	66 ed                	in     ax,dx
ataIdentify():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:265 (discriminator 3)
        for (int readCount=0;readCount<=255;readCount++)
        {
            devInfo->ATAIdentifyData[readCount]=inw(devInfo->ioPort+ATA_PORT_DATA);
 1000c48:	66 89 01             	mov    WORD PTR [ecx],ax
 1000c4b:	83 c1 02             	add    ecx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:263 (discriminator 3)
        if (useCDROMIdentify)
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_CDROM_COMMAND);
        else
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
        wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
        for (int readCount=0;readCount<=255;readCount++)
 1000c4e:	39 d9                	cmp    ecx,ebx
 1000c50:	75 f4                	jne    1000c46 <ataIdentify+0x62>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:268
        {
            devInfo->ATAIdentifyData[readCount]=inw(devInfo->ioPort+ATA_PORT_DATA);
        }
    }
    ataGetModelFromIdentify(devInfo);
 1000c52:	83 ec 0c             	sub    esp,0xc
 1000c55:	56                   	push   esi
 1000c56:	e8 53 ff ff ff       	call   1000bae <ataGetModelFromIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:269
    devInfo->totalSectorCount = devInfo->ATAIdentifyData[60] | (devInfo->ATAIdentifyData[61]<<16);
 1000c5b:	0f b7 46 7a          	movzx  eax,WORD PTR [esi+0x7a]
 1000c5f:	c1 e0 10             	shl    eax,0x10
 1000c62:	0f b7 56 78          	movzx  edx,WORD PTR [esi+0x78]
 1000c66:	09 d0                	or     eax,edx
 1000c68:	89 86 56 02 00 00    	mov    DWORD PTR [esi+0x256],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:270
    devInfo->sectorSize = (devInfo->ATAIdentifyData[106] & 1<<12)==1<<12
 1000c6e:	83 c4 10             	add    esp,0x10
 1000c71:	b8 00 02 00 00       	mov    eax,0x200
 1000c76:	f6 86 d5 00 00 00 10 	test   BYTE PTR [esi+0xd5],0x10
 1000c7d:	74 12                	je     1000c91 <ataIdentify+0xad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:270 (discriminator 1)
 1000c7f:	0f b7 46 24          	movzx  eax,WORD PTR [esi+0x24]
 1000c83:	c1 e0 10             	shl    eax,0x10
 1000c86:	89 c2                	mov    edx,eax
 1000c88:	0f b7 86 ea 00 00 00 	movzx  eax,WORD PTR [esi+0xea]
 1000c8f:	09 d0                	or     eax,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:270 (discriminator 4)
 1000c91:	89 86 5a 02 00 00    	mov    DWORD PTR [esi+0x25a],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:273 (discriminator 4)
            ?devInfo->ATAIdentifyData[117] | (devInfo->ATAIdentifyData[18]<<16)
            :512;
    devInfo->dmaSupported=devInfo->ATAIdentifyData[49]>>8 & 0x1;
 1000c97:	0f b7 46 62          	movzx  eax,WORD PTR [esi+0x62]
 1000c9b:	89 c2                	mov    edx,eax
 1000c9d:	66 c1 ea 08          	shr    dx,0x8
 1000ca1:	83 e2 01             	and    edx,0x1
 1000ca4:	88 96 60 02 00 00    	mov    BYTE PTR [esi+0x260],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:274 (discriminator 4)
    devInfo->lbaSupported=devInfo->ATAIdentifyData[49]>>9 & 0x1;
 1000caa:	66 c1 e8 09          	shr    ax,0x9
 1000cae:	83 e0 01             	and    eax,0x1
 1000cb1:	88 86 5e 02 00 00    	mov    BYTE PTR [esi+0x25e],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:275 (discriminator 4)
    devInfo->lba48Supported=devInfo->ATAIdentifyData[83]>>10 & 0x1;
 1000cb7:	0f b7 86 a6 00 00 00 	movzx  eax,WORD PTR [esi+0xa6]
 1000cbe:	66 c1 e8 0a          	shr    ax,0xa
 1000cc2:	83 e0 01             	and    eax,0x1
 1000cc5:	88 86 5f 02 00 00    	mov    BYTE PTR [esi+0x25f],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:278 (discriminator 4)
    
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000ccb:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000cd2:	74 1d                	je     1000cf1 <ataIdentify+0x10d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:279
        printk("drive %d, model=%s\n",devInfo->driveNo, devInfo->ATADeviceModel);
 1000cd4:	83 ec 04             	sub    esp,0x4
 1000cd7:	8d 86 00 02 00 00    	lea    eax,[esi+0x200]
 1000cdd:	50                   	push   eax
 1000cde:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000ce4:	68 92 73 00 01       	push   0x1007392
 1000ce9:	e8 35 18 00 00       	call   1002523 <printk>
 1000cee:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:282
#endif
    return 1;
}
 1000cf1:	b8 01 00 00 00       	mov    eax,0x1
 1000cf6:	83 c4 04             	add    esp,0x4
 1000cf9:	5b                   	pop    ebx
 1000cfa:	5e                   	pop    esi
 1000cfb:	c3                   	ret    

01000cfc <ataScanForHarddrives>:
ataScanForHarddrives():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:285

int ataScanForHarddrives()
{
 1000cfc:	53                   	push   ebx
 1000cfd:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:286
    kATADeviceInfo[0].bus=ATAPrimary;
 1000d00:	8b 1d c0 02 12 00    	mov    ebx,DWORD PTR ds:0x1202c0
 1000d06:	c7 83 61 02 00 00 00 	mov    DWORD PTR [ebx+0x261],0x0
 1000d0d:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:287
    kATADeviceInfo[0].driveNo=0;
 1000d10:	c7 83 65 02 00 00 00 	mov    DWORD PTR [ebx+0x265],0x0
 1000d17:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:288
    kATADeviceInfo[0].ioPort=0x1F0;
 1000d1a:	c7 83 69 02 00 00 f0 	mov    DWORD PTR [ebx+0x269],0x1f0
 1000d21:	01 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:289
    kATADeviceInfo[0].irqNum=0x14;
 1000d24:	c6 83 6d 02 00 00 14 	mov    BYTE PTR [ebx+0x26d],0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:290
    kATADeviceInfo[0].driveHeadPortDesignation=0xA0;
 1000d2b:	c6 83 6e 02 00 00 a0 	mov    BYTE PTR [ebx+0x26e],0xa0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:291
    kATADeviceInfo[0].queryATAData=true;
 1000d32:	c6 83 50 02 00 00 01 	mov    BYTE PTR [ebx+0x250],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:292
    kATADeviceInfo[0].ATADeviceAvailable=ataInit(&kATADeviceInfo[0]);
 1000d39:	53                   	push   ebx
 1000d3a:	e8 af fb ff ff       	call   10008ee <ataInit>
 1000d3f:	88 83 51 02 00 00    	mov    BYTE PTR [ebx+0x251],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:293
    if (kATADeviceInfo[0].ATADeviceAvailable)
 1000d45:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000d4a:	83 c4 10             	add    esp,0x10
 1000d4d:	80 b8 51 02 00 00 00 	cmp    BYTE PTR [eax+0x251],0x0
 1000d54:	74 35                	je     1000d8b <ataScanForHarddrives+0x8f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:295
    {
        ataIdentify(&kATADeviceInfo[0]);
 1000d56:	83 ec 0c             	sub    esp,0xc
 1000d59:	50                   	push   eax
 1000d5a:	e8 85 fe ff ff       	call   1000be4 <ataIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:296
        if (useCDROMIdentify)
 1000d5f:	83 c4 10             	add    esp,0x10
 1000d62:	80 3d 6c 3a 01 01 00 	cmp    BYTE PTR ds:0x1013a6c,0x0
 1000d69:	74 11                	je     1000d7c <ataScanForHarddrives+0x80>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:297
            kATADeviceInfo[0].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000d6b:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000d70:	c7 80 52 02 00 00 01 	mov    DWORD PTR [eax+0x252],0x1
 1000d77:	00 00 00 
 1000d7a:	eb 0f                	jmp    1000d8b <ataScanForHarddrives+0x8f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:299
        else
            kATADeviceInfo[0].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000d7c:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000d81:	c7 80 52 02 00 00 00 	mov    DWORD PTR [eax+0x252],0x0
 1000d88:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:301
    }
    useCDROMIdentify=false;
 1000d8b:	c6 05 6c 3a 01 01 00 	mov    BYTE PTR ds:0x1013a6c,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:303

    kATADeviceInfo[1].bus=ATAPrimary;
 1000d92:	8b 1d c0 02 12 00    	mov    ebx,DWORD PTR ds:0x1202c0
 1000d98:	c7 83 d4 04 00 00 00 	mov    DWORD PTR [ebx+0x4d4],0x0
 1000d9f:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:304
    kATADeviceInfo[1].driveNo=1;
 1000da2:	c7 83 d8 04 00 00 01 	mov    DWORD PTR [ebx+0x4d8],0x1
 1000da9:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:305
    kATADeviceInfo[1].ioPort=0x1F0;
 1000dac:	c7 83 dc 04 00 00 f0 	mov    DWORD PTR [ebx+0x4dc],0x1f0
 1000db3:	01 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:306
    kATADeviceInfo[1].irqNum=0x14;
 1000db6:	c6 83 e0 04 00 00 14 	mov    BYTE PTR [ebx+0x4e0],0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:307
    kATADeviceInfo[1].driveHeadPortDesignation=0xB0;
 1000dbd:	c6 83 e1 04 00 00 b0 	mov    BYTE PTR [ebx+0x4e1],0xb0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:308
    kATADeviceInfo[1].queryATAData=true;
 1000dc4:	c6 83 c3 04 00 00 01 	mov    BYTE PTR [ebx+0x4c3],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:309
    kATADeviceInfo[1].ATADeviceAvailable=ataInit(&kATADeviceInfo[1]);
 1000dcb:	83 ec 0c             	sub    esp,0xc
 1000dce:	8d 83 73 02 00 00    	lea    eax,[ebx+0x273]
 1000dd4:	50                   	push   eax
 1000dd5:	e8 14 fb ff ff       	call   10008ee <ataInit>
 1000dda:	88 83 c4 04 00 00    	mov    BYTE PTR [ebx+0x4c4],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:310
    if (kATADeviceInfo[1].ATADeviceAvailable)
 1000de0:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000de5:	83 c4 10             	add    esp,0x10
 1000de8:	80 b8 c4 04 00 00 00 	cmp    BYTE PTR [eax+0x4c4],0x0
 1000def:	74 3a                	je     1000e2b <ataScanForHarddrives+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:312
    {
        ataIdentify(&kATADeviceInfo[1]);
 1000df1:	83 ec 0c             	sub    esp,0xc
 1000df4:	05 73 02 00 00       	add    eax,0x273
 1000df9:	50                   	push   eax
 1000dfa:	e8 e5 fd ff ff       	call   1000be4 <ataIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:313
        if (useCDROMIdentify)
 1000dff:	83 c4 10             	add    esp,0x10
 1000e02:	80 3d 6c 3a 01 01 00 	cmp    BYTE PTR ds:0x1013a6c,0x0
 1000e09:	74 11                	je     1000e1c <ataScanForHarddrives+0x120>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:314
            kATADeviceInfo[1].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000e0b:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000e10:	c7 80 c5 04 00 00 01 	mov    DWORD PTR [eax+0x4c5],0x1
 1000e17:	00 00 00 
 1000e1a:	eb 0f                	jmp    1000e2b <ataScanForHarddrives+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:316
        else
            kATADeviceInfo[1].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000e1c:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000e21:	c7 80 c5 04 00 00 00 	mov    DWORD PTR [eax+0x4c5],0x0
 1000e28:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:318
    }
    kATADeviceInfo[2].bus=ATASecondary;
 1000e2b:	8b 1d c0 02 12 00    	mov    ebx,DWORD PTR ds:0x1202c0
 1000e31:	c7 83 47 07 00 00 01 	mov    DWORD PTR [ebx+0x747],0x1
 1000e38:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:319
    kATADeviceInfo[2].driveNo=2;
 1000e3b:	c7 83 4b 07 00 00 02 	mov    DWORD PTR [ebx+0x74b],0x2
 1000e42:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:320
    kATADeviceInfo[2].ioPort=0x170;
 1000e45:	c7 83 4f 07 00 00 70 	mov    DWORD PTR [ebx+0x74f],0x170
 1000e4c:	01 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:321
    kATADeviceInfo[2].irqNum=0x15;
 1000e4f:	c6 83 53 07 00 00 15 	mov    BYTE PTR [ebx+0x753],0x15
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:322
    kATADeviceInfo[2].driveHeadPortDesignation=0xA0;
 1000e56:	c6 83 54 07 00 00 a0 	mov    BYTE PTR [ebx+0x754],0xa0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:323
    kATADeviceInfo[2].queryATAData=false;
 1000e5d:	c6 83 36 07 00 00 00 	mov    BYTE PTR [ebx+0x736],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:324
    kATADeviceInfo[2].ATADeviceAvailable=ataInit(&kATADeviceInfo[2]);
 1000e64:	83 ec 0c             	sub    esp,0xc
 1000e67:	8d 83 e6 04 00 00    	lea    eax,[ebx+0x4e6]
 1000e6d:	50                   	push   eax
 1000e6e:	e8 7b fa ff ff       	call   10008ee <ataInit>
 1000e73:	88 83 37 07 00 00    	mov    BYTE PTR [ebx+0x737],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:325
    if (kATADeviceInfo[2].ATADeviceAvailable)
 1000e79:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000e7e:	83 c4 10             	add    esp,0x10
 1000e81:	80 b8 37 07 00 00 00 	cmp    BYTE PTR [eax+0x737],0x0
 1000e88:	74 3a                	je     1000ec4 <ataScanForHarddrives+0x1c8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:327
    {
        ataIdentify(&kATADeviceInfo[2]);
 1000e8a:	83 ec 0c             	sub    esp,0xc
 1000e8d:	05 e6 04 00 00       	add    eax,0x4e6
 1000e92:	50                   	push   eax
 1000e93:	e8 4c fd ff ff       	call   1000be4 <ataIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:328
        if (useCDROMIdentify)
 1000e98:	83 c4 10             	add    esp,0x10
 1000e9b:	80 3d 6c 3a 01 01 00 	cmp    BYTE PTR ds:0x1013a6c,0x0
 1000ea2:	74 11                	je     1000eb5 <ataScanForHarddrives+0x1b9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:329
            kATADeviceInfo[2].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000ea4:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000ea9:	c7 80 38 07 00 00 01 	mov    DWORD PTR [eax+0x738],0x1
 1000eb0:	00 00 00 
 1000eb3:	eb 0f                	jmp    1000ec4 <ataScanForHarddrives+0x1c8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:331
        else
            kATADeviceInfo[2].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000eb5:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000eba:	c7 80 38 07 00 00 00 	mov    DWORD PTR [eax+0x738],0x0
 1000ec1:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:334
    }

    kATADeviceInfo[3].bus=ATASecondary;
 1000ec4:	8b 1d c0 02 12 00    	mov    ebx,DWORD PTR ds:0x1202c0
 1000eca:	c7 83 ba 09 00 00 01 	mov    DWORD PTR [ebx+0x9ba],0x1
 1000ed1:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:335
    kATADeviceInfo[3].driveNo=3;
 1000ed4:	c7 83 be 09 00 00 03 	mov    DWORD PTR [ebx+0x9be],0x3
 1000edb:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:336
    kATADeviceInfo[3].ioPort=0x170;
 1000ede:	c7 83 c2 09 00 00 70 	mov    DWORD PTR [ebx+0x9c2],0x170
 1000ee5:	01 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:337
    kATADeviceInfo[3].irqNum=0x15;
 1000ee8:	c6 83 c6 09 00 00 15 	mov    BYTE PTR [ebx+0x9c6],0x15
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:338
    kATADeviceInfo[3].driveHeadPortDesignation=0xB0;
 1000eef:	c6 83 c7 09 00 00 b0 	mov    BYTE PTR [ebx+0x9c7],0xb0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:339
    kATADeviceInfo[3].queryATAData=true;
 1000ef6:	c6 83 a9 09 00 00 01 	mov    BYTE PTR [ebx+0x9a9],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:340
    kATADeviceInfo[3].ATADeviceAvailable=ataInit(&kATADeviceInfo[3]);
 1000efd:	83 ec 0c             	sub    esp,0xc
 1000f00:	8d 83 59 07 00 00    	lea    eax,[ebx+0x759]
 1000f06:	50                   	push   eax
 1000f07:	e8 e2 f9 ff ff       	call   10008ee <ataInit>
 1000f0c:	88 83 aa 09 00 00    	mov    BYTE PTR [ebx+0x9aa],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:341
    if (kATADeviceInfo[3].ATADeviceAvailable)
 1000f12:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000f17:	83 c4 10             	add    esp,0x10
 1000f1a:	80 b8 aa 09 00 00 00 	cmp    BYTE PTR [eax+0x9aa],0x0
 1000f21:	74 3a                	je     1000f5d <ataScanForHarddrives+0x261>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:343
    {
        ataIdentify(&kATADeviceInfo[3]);
 1000f23:	83 ec 0c             	sub    esp,0xc
 1000f26:	05 59 07 00 00       	add    eax,0x759
 1000f2b:	50                   	push   eax
 1000f2c:	e8 b3 fc ff ff       	call   1000be4 <ataIdentify>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:344
        if (useCDROMIdentify)
 1000f31:	83 c4 10             	add    esp,0x10
 1000f34:	80 3d 6c 3a 01 01 00 	cmp    BYTE PTR ds:0x1013a6c,0x0
 1000f3b:	74 11                	je     1000f4e <ataScanForHarddrives+0x252>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:345
            kATADeviceInfo[3].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000f3d:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000f42:	c7 80 ab 09 00 00 01 	mov    DWORD PTR [eax+0x9ab],0x1
 1000f49:	00 00 00 
 1000f4c:	eb 0f                	jmp    1000f5d <ataScanForHarddrives+0x261>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:347
        else
            kATADeviceInfo[3].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000f4e:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000f53:	c7 80 ab 09 00 00 00 	mov    DWORD PTR [eax+0x9ab],0x0
 1000f5a:	00 00 00 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:351
    }

#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000f5d:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000f64:	74 22                	je     1000f88 <ataScanForHarddrives+0x28c>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:352
        printk("INIT: Disk1=%s  Disk2=%s\n", kATADeviceInfo[0].ATADeviceModel, kATADeviceInfo[1].ATADeviceModel);
 1000f66:	a1 c0 02 12 00       	mov    eax,ds:0x1202c0
 1000f6b:	83 ec 04             	sub    esp,0x4
 1000f6e:	8d 90 73 04 00 00    	lea    edx,[eax+0x473]
 1000f74:	52                   	push   edx
 1000f75:	05 00 02 00 00       	add    eax,0x200
 1000f7a:	50                   	push   eax
 1000f7b:	68 a6 73 00 01       	push   0x10073a6
 1000f80:	e8 9e 15 00 00       	call   1002523 <printk>
 1000f85:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:355
#endif
            return 0;
}
 1000f88:	b8 00 00 00 00       	mov    eax,0x0
 1000f8d:	83 c4 08             	add    esp,0x8
 1000f90:	5b                   	pop    ebx
 1000f91:	c3                   	ret    

01000f92 <ataBlockingRead28>:
ataBlockingRead28():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:365
        return -1;
    return ataBlockingRead28(sector, buffer, sector_count);
}

int ataBlockingRead28(uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
 1000f92:	55                   	push   ebp
 1000f93:	57                   	push   edi
 1000f94:	56                   	push   esi
 1000f95:	53                   	push   ebx
 1000f96:	83 ec 1c             	sub    esp,0x1c
 1000f99:	8b 74 24 34          	mov    esi,DWORD PTR [esp+0x34]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:370
    //For now if the FAT library calls this, we assume we've already read the same partition most recently
    int lResult=0;
    uint8_t* bufp=buffer;
    uint32_t lSectorsLeft=sector_count;
    uint32_t lSector=sector+partOffset; //this represents the start of the partition
 1000f9d:	a1 64 3a 01 01       	mov    eax,ds:0x1013a64
 1000fa2:	03 44 24 30          	add    eax,DWORD PTR [esp+0x30]
 1000fa6:	89 c5                	mov    ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:373

#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000fa8:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1000faf:	74 18                	je     1000fc9 <ataBlockingRead28+0x37>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:375
        {
            printk("ataBlockingRead28: sec: 0x%08X, buf 0x%08X, cnt 0x%08X\n", lSector, bufp, sector_count);
 1000fb1:	ff 74 24 38          	push   DWORD PTR [esp+0x38]
 1000fb5:	56                   	push   esi
 1000fb6:	50                   	push   eax
 1000fb7:	68 08 79 00 01       	push   0x1007908
 1000fbc:	e8 62 15 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:376
            waitForKeyboardKey();
 1000fc1:	e8 a2 f4 ff ff       	call   1000468 <waitForKeyboardKey>
 1000fc6:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:379
        }
#endif
    lResult=ataWaitForIdle(atablockingReadDev);
 1000fc9:	83 ec 0c             	sub    esp,0xc
 1000fcc:	ff 35 20 90 00 01    	push   DWORD PTR ds:0x1009020
 1000fd2:	e8 cc f6 ff ff       	call   10006a3 <ataWaitForIdle>
 1000fd7:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:380
    if (lResult)
 1000fda:	83 c4 10             	add    esp,0x10
 1000fdd:	85 c0                	test   eax,eax
 1000fdf:	74 11                	je     1000ff2 <ataBlockingRead28+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:381
        panic("ataBlockingRead28: Timeout waiting for DRQ and BSY to be clear (0x%02X)", lResult);
 1000fe1:	83 ec 08             	sub    esp,0x8
 1000fe4:	50                   	push   eax
 1000fe5:	68 40 79 00 01       	push   0x1007940
 1000fea:	e8 b1 10 00 00       	call   10020a0 <panic>
 1000fef:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:386
        //Select the drive we want
        //NOTE: Drive selected prior to calling this function
        //ataSelectDrive(drive,0);
        //Magic bit (6) to set LBA mode and top 4 bits of LBA28 sector # go in bottom 4
    outb(atablockingReadDev->ioPort+ATA_DRIVE_SELECT, inb(atablockingReadDev->ioPort+ATA_DRIVE_SELECT) | (1 << 6) | ((lSector >> 24) & 0x0F));
 1000ff2:	8b 1d 20 90 00 01    	mov    ebx,DWORD PTR ds:0x1009020
 1000ff8:	8b 8b 69 02 00 00    	mov    ecx,DWORD PTR [ebx+0x269]
 1000ffe:	8d 51 06             	lea    edx,[ecx+0x6]
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1001001:	ec                   	in     al,dx
 1001002:	89 c7                	mov    edi,eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001004:	89 e8                	mov    eax,ebp
 1001006:	c1 e8 18             	shr    eax,0x18
 1001009:	83 e0 0f             	and    eax,0xf
 100100c:	83 c8 40             	or     eax,0x40
 100100f:	09 f8                	or     eax,edi
 1001011:	ee                   	out    dx,al
 1001012:	8d 51 02             	lea    edx,[ecx+0x2]
 1001015:	0f b6 44 24 38       	movzx  eax,BYTE PTR [esp+0x38]
 100101a:	ee                   	out    dx,al
 100101b:	8d 51 03             	lea    edx,[ecx+0x3]
 100101e:	89 e8                	mov    eax,ebp
 1001020:	ee                   	out    dx,al
 1001021:	89 e8                	mov    eax,ebp
 1001023:	c1 e8 08             	shr    eax,0x8
 1001026:	8d 51 04             	lea    edx,[ecx+0x4]
 1001029:	ee                   	out    dx,al
 100102a:	89 e8                	mov    eax,ebp
 100102c:	c1 e8 10             	shr    eax,0x10
 100102f:	8d 51 05             	lea    edx,[ecx+0x5]
 1001032:	ee                   	out    dx,al
 1001033:	8d 51 07             	lea    edx,[ecx+0x7]
 1001036:	b8 20 00 00 00       	mov    eax,0x20
 100103b:	ee                   	out    dx,al
ataBlockingRead28():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:396
    //Send the LBA sector number in the next 3 fields + high bit in the 
    outb(atablockingReadDev->ioPort+ATA_PORT_SECTOR_NUMBER, (lSector) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_CYLINDER_LOW, (lSector >> 8) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_CYLINDER_HIGH, (lSector >> 16) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_COMMAND, ATA_COMMAND_READ_SECTOR);
    lResult=ataWaitForDRQ(atablockingReadDev, true, ATA_STANDARD_WAIT_MS*kTicksPerMS);
 100103c:	83 ec 04             	sub    esp,0x4
 100103f:	a1 84 02 12 00       	mov    eax,ds:0x120284
 1001044:	8d 04 80             	lea    eax,[eax+eax*4]
 1001047:	01 c0                	add    eax,eax
 1001049:	50                   	push   eax
 100104a:	6a 01                	push   0x1
 100104c:	53                   	push   ebx
 100104d:	e8 e2 f5 ff ff       	call   1000634 <ataWaitForDRQ>
 1001052:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:397
    if (lResult)
 1001055:	83 c4 10             	add    esp,0x10
 1001058:	85 c0                	test   eax,eax
 100105a:	74 17                	je     1001073 <ataBlockingRead28+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:398
        panic("ataBlockingRead28: Timeout waiting for DRQ to be set Stts=0x%02X, Err=0x%02X", lResult, hdError);
 100105c:	83 ec 04             	sub    esp,0x4
 100105f:	ff 35 68 3a 01 01    	push   DWORD PTR ds:0x1013a68
 1001065:	50                   	push   eax
 1001066:	68 88 79 00 01       	push   0x1007988
 100106b:	e8 30 10 00 00       	call   10020a0 <panic>
 1001070:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:399
    while (lSectorsLeft)
 1001073:	83 7c 24 38 00       	cmp    DWORD PTR [esp+0x38],0x0
 1001078:	0f 84 e7 00 00 00    	je     1001165 <ataBlockingRead28+0x1d3>
 100107e:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
 1001082:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:401
    {
        insw(atablockingReadDev->ioPort+ATA_PORT_DATA, bufp, 256);
 1001086:	a1 20 90 00 01       	mov    eax,ds:0x1009020
insw():
/home/yogi/src/os/chrisOSKernel/include/io.h:87
		      : "d" (__port));
}

static __inline void insw(unsigned short __port, void *__buf, unsigned long __n)
{
	__asm__ volatile ("cld; rep; insw"
 100108b:	8b 90 69 02 00 00    	mov    edx,DWORD PTR [eax+0x269]
 1001091:	89 f7                	mov    edi,esi
 1001093:	b9 00 01 00 00       	mov    ecx,0x100
 1001098:	fc                   	cld    
 1001099:	f3 66 6d             	rep ins WORD PTR es:[edi],dx
ataBlockingRead28():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:403
        #ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 100109c:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 10010a3:	74 40                	je     10010e5 <ataBlockingRead28+0x153>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:405
            {
                printk("ataBlockingRead28: Debugging: ");
 10010a5:	83 ec 0c             	sub    esp,0xc
 10010a8:	68 d8 79 00 01       	push   0x10079d8
 10010ad:	e8 71 14 00 00       	call   1002523 <printk>
 10010b2:	89 f3                	mov    ebx,esi
 10010b4:	8d 7e 14             	lea    edi,[esi+0x14]
 10010b7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:407 (discriminator 3)
                for (int cnt2=0;cnt2<20;cnt2++)
                    printk("%02X ", bufp[cnt2]);
 10010ba:	83 ec 08             	sub    esp,0x8
 10010bd:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 10010c0:	50                   	push   eax
 10010c1:	68 c0 73 00 01       	push   0x10073c0
 10010c6:	e8 58 14 00 00       	call   1002523 <printk>
 10010cb:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:406 (discriminator 3)
        insw(atablockingReadDev->ioPort+ATA_PORT_DATA, bufp, 256);
        #ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            {
                printk("ataBlockingRead28: Debugging: ");
                for (int cnt2=0;cnt2<20;cnt2++)
 10010ce:	83 c4 10             	add    esp,0x10
 10010d1:	39 df                	cmp    edi,ebx
 10010d3:	75 e5                	jne    10010ba <ataBlockingRead28+0x128>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:408
                    printk("%02X ", bufp[cnt2]);
                printk("\n");
 10010d5:	83 ec 0c             	sub    esp,0xc
 10010d8:	68 e7 76 00 01       	push   0x10076e7
 10010dd:	e8 41 14 00 00       	call   1002523 <printk>
 10010e2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:411
            }
        #endif
        if (--lSectorsLeft>0) //zero based vs 1 based
 10010e5:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
 10010ea:	74 79                	je     1001165 <ataBlockingRead28+0x1d3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:413
        {
            wait(50);
 10010ec:	83 ec 0c             	sub    esp,0xc
 10010ef:	6a 32                	push   0x32
 10010f1:	e8 d6 1d 00 00       	call   1002ecc <wait>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:414
            lResult=ataWaitForDRQ(atablockingReadDev, true, ATA_STANDARD_WAIT_MS*kTicksPerMS);
 10010f6:	83 c4 0c             	add    esp,0xc
 10010f9:	a1 84 02 12 00       	mov    eax,ds:0x120284
 10010fe:	8d 04 80             	lea    eax,[eax+eax*4]
 1001101:	01 c0                	add    eax,eax
 1001103:	50                   	push   eax
 1001104:	6a 01                	push   0x1
 1001106:	ff 35 20 90 00 01    	push   DWORD PTR ds:0x1009020
 100110c:	e8 23 f5 ff ff       	call   1000634 <ataWaitForDRQ>
 1001111:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:415
            bufp+=512;
 1001114:	81 c6 00 02 00 00    	add    esi,0x200
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:416
            lSector++;
 100111a:	83 c5 01             	add    ebp,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:417
            if (lResult)
 100111d:	83 c4 10             	add    esp,0x10
 1001120:	85 c0                	test   eax,eax
 1001122:	74 17                	je     100113b <ataBlockingRead28+0x1a9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:418
                panic("ataBlockingRead28: Timeout in read loop, waiting for DRQ to be set Stts=0x%02X, Err=0x%02X", lResult, hdError);
 1001124:	83 ec 04             	sub    esp,0x4
 1001127:	ff 35 68 3a 01 01    	push   DWORD PTR ds:0x1013a68
 100112d:	50                   	push   eax
 100112e:	68 f8 79 00 01       	push   0x10079f8
 1001133:	e8 68 0f 00 00       	call   10020a0 <panic>
 1001138:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:420
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 100113b:	f6 05 38 03 12 00 08 	test   BYTE PTR ds:0x120338,0x8
 1001142:	0f 84 3e ff ff ff    	je     1001086 <ataBlockingRead28+0xf4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:422
        {
            printk("ataBlockingRead28: sec=0x%08X, buf=0x%08X, rep=0x%08X    \n", lSector, bufp, lSectorsLeft);
 1001148:	ff 74 24 0c          	push   DWORD PTR [esp+0xc]
 100114c:	56                   	push   esi
 100114d:	55                   	push   ebp
 100114e:	68 54 7a 00 01       	push   0x1007a54
 1001153:	e8 cb 13 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:423
            waitForKeyboardKey();
 1001158:	e8 0b f3 ff ff       	call   1000468 <waitForKeyboardKey>
 100115d:	83 c4 10             	add    esp,0x10
 1001160:	e9 21 ff ff ff       	jmp    1001086 <ataBlockingRead28+0xf4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:428
        }
#endif
        }
    }
    return 512*sector_count;
 1001165:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
 1001169:	c1 e0 09             	shl    eax,0x9
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:429
}
 100116c:	83 c4 1c             	add    esp,0x1c
 100116f:	5b                   	pop    ebx
 1001170:	5e                   	pop    esi
 1001171:	5f                   	pop    edi
 1001172:	5d                   	pop    ebp
 1001173:	c3                   	ret    

01001174 <ataReadDisk>:
ataReadDisk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:357
        printk("INIT: Disk1=%s  Disk2=%s\n", kATADeviceInfo[0].ATADeviceModel, kATADeviceInfo[1].ATADeviceModel);
#endif
            return 0;
}
int ataReadDisk(struct ataDeviceInfo_t* devInfo, uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
 1001174:	83 ec 0c             	sub    esp,0xc
 1001177:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:358
    atablockingReadDev = devInfo;
 100117b:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 100117f:	89 15 20 90 00 01    	mov    DWORD PTR ds:0x1009020,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:359
    if (sector_count==0)    //this function can be called with a sector_count of 0 in order to set partOffset
 1001185:	85 c0                	test   eax,eax
 1001187:	74 16                	je     100119f <ataReadDisk+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:361
        return -1;
    return ataBlockingRead28(sector, buffer, sector_count);
 1001189:	83 ec 04             	sub    esp,0x4
 100118c:	50                   	push   eax
 100118d:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 1001191:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 1001195:	e8 f8 fd ff ff       	call   1000f92 <ataBlockingRead28>
 100119a:	83 c4 10             	add    esp,0x10
 100119d:	eb 05                	jmp    10011a4 <ataReadDisk+0x30>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:360
}
int ataReadDisk(struct ataDeviceInfo_t* devInfo, uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
    atablockingReadDev = devInfo;
    if (sector_count==0)    //this function can be called with a sector_count of 0 in order to set partOffset
        return -1;
 100119f:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:362
    return ataBlockingRead28(sector, buffer, sector_count);
}
 10011a4:	83 c4 0c             	add    esp,0xc
 10011a7:	c3                   	ret    

010011a8 <ataBlockingWrite28>:
ataBlockingWrite28():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/ata_disk.c:468
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("ataBlockingWrite28: Finished sending data\n");
#endif
    return 512;
*/}
 10011a8:	f3 c3                	repz ret 
 10011aa:	66 90                	xchg   ax,ax

010011ac <kPagingGet4kPDEntryValue>:
kPagingGet4kPDEntryValue():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:19
extern uint32_t*  kKernelPageDir;
extern uint64_t kE820MemoryBytes;
extern uint32_t kDebugLevel;

uint32_t kPagingGet4kPDEntryValue(uint32_t address)
{
 10011ac:	53                   	push   ebx
 10011ad:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:21
    address&=0xFFFFF000;
    uintptr_t* lTemp=(uint32_t*)((KERNEL_PAGE_DIR_ADDRESS + (((address & 0xFFC00000) >> 22) << 2)));
 10011b0:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10011b4:	c1 eb 16             	shr    ebx,0x16
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:23
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10011b7:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10011be:	74 17                	je     10011d7 <kPagingGet4kPDEntryValue+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:24
            printk("pagingGet4kPDEntryValue: dirAddressPtr=0x%08x\n", *lTemp);
 10011c0:	83 ec 08             	sub    esp,0x8
 10011c3:	ff 34 9d 00 e0 1a 00 	push   DWORD PTR [ebx*4+0x1ae000]
 10011ca:	68 90 7a 00 01       	push   0x1007a90
 10011cf:	e8 4f 13 00 00       	call   1002523 <printk>
 10011d4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:26
#endif
    return (uint32_t)*lTemp;
 10011d7:	8b 04 9d 00 e0 1a 00 	mov    eax,DWORD PTR [ebx*4+0x1ae000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:27
}
 10011de:	83 c4 08             	add    esp,0x8
 10011e1:	5b                   	pop    ebx
 10011e2:	c3                   	ret    

010011e3 <kPagingGet4kPDEntryAddress>:
kPagingGet4kPDEntryAddress():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:30

uint32_t kPagingGet4kPDEntryAddress(uint32_t address)
{
 10011e3:	53                   	push   ebx
 10011e4:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:32
    address&=0xFFFFF000;
    uintptr_t lTemp=((KERNEL_PAGE_DIR_ADDRESS  | (((address & 0xFFC00000) >> 22) << 2)));
 10011e7:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10011eb:	c1 eb 16             	shr    ebx,0x16
 10011ee:	c1 e3 02             	shl    ebx,0x2
 10011f1:	81 cb 00 e0 1a 00    	or     ebx,0x1ae000
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:34
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10011f7:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10011fe:	74 11                	je     1001211 <kPagingGet4kPDEntryAddress+0x2e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:35
            printk("dirEntryAddress=0x%08x\n", lTemp);
 1001200:	83 ec 08             	sub    esp,0x8
 1001203:	53                   	push   ebx
 1001204:	68 c6 73 00 01       	push   0x10073c6
 1001209:	e8 15 13 00 00       	call   1002523 <printk>
 100120e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:38
#endif
    return (uint32_t)lTemp & 0xFFFFFFFF;
}
 1001211:	89 d8                	mov    eax,ebx
 1001213:	83 c4 08             	add    esp,0x8
 1001216:	5b                   	pop    ebx
 1001217:	c3                   	ret    

01001218 <kPagingGet4kPTEntryAddress>:
kPagingGet4kPTEntryAddress():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:41

uint32_t kPagingGet4kPTEntryAddress(uint32_t address)
{
 1001218:	53                   	push   ebx
 1001219:	83 ec 14             	sub    esp,0x14
 100121c:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:43
    address&=0xFFFFF000;
    uintptr_t pDirPtr=kPagingGet4kPDEntryValue(address) & 0xFFFFF000;
 1001220:	89 d8                	mov    eax,ebx
 1001222:	25 00 f0 ff ff       	and    eax,0xfffff000
 1001227:	50                   	push   eax
 1001228:	e8 7f ff ff ff       	call   10011ac <kPagingGet4kPDEntryValue>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:44
    return ((address & 0x3FF000) >> 12) << 2 | pDirPtr;
 100122d:	81 e3 00 f0 3f 00    	and    ebx,0x3ff000
 1001233:	c1 eb 0a             	shr    ebx,0xa
 1001236:	25 00 f0 ff ff       	and    eax,0xfffff000
 100123b:	09 d8                	or     eax,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:45
}
 100123d:	83 c4 18             	add    esp,0x18
 1001240:	5b                   	pop    ebx
 1001241:	c3                   	ret    

01001242 <kPagingGet4kPTEntryValue>:
kPagingGet4kPTEntryValue():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:48

uint32_t kPagingGet4kPTEntryValue(uint32_t address)
{
 1001242:	53                   	push   ebx
 1001243:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:50
    address&=0xFFFFF000;
    uint32_t* pTablePtr=(uint32_t*)kPagingGet4kPTEntryAddress(address);
 1001246:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 100124a:	25 00 f0 ff ff       	and    eax,0xfffff000
 100124f:	50                   	push   eax
 1001250:	e8 c3 ff ff ff       	call   1001218 <kPagingGet4kPTEntryAddress>
 1001255:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:52
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001257:	83 c4 10             	add    esp,0x10
 100125a:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001261:	74 11                	je     1001274 <kPagingGet4kPTEntryValue+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:53
             printk("pagingGet4kPTEntryValue: pageEntryAddress=0x%08X\n", pTablePtr);
 1001263:	83 ec 08             	sub    esp,0x8
 1001266:	50                   	push   eax
 1001267:	68 c0 7a 00 01       	push   0x1007ac0
 100126c:	e8 b2 12 00 00       	call   1002523 <printk>
 1001271:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:56
             //printf("pageEntryValue=0x%08X\n", *pTablePtr);
#endif
    return *pTablePtr;
 1001274:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:57
}
 1001276:	83 c4 08             	add    esp,0x8
 1001279:	5b                   	pop    ebx
 100127a:	c3                   	ret    

0100127b <kPagingSetPageReadOnlyFlag>:
kPagingSetPageReadOnlyFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:60

void kPagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly)
{
 100127b:	56                   	push   esi
 100127c:	53                   	push   ebx
 100127d:	83 ec 04             	sub    esp,0x4
 1001280:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1001284:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:62
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001288:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100128f:	74 13                	je     10012a4 <kPagingSetPageReadOnlyFlag+0x29>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:63
            printk("pagingMakePageReadOnly: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 1001291:	83 ec 04             	sub    esp,0x4
 1001294:	ff 33                	push   DWORD PTR [ebx]
 1001296:	53                   	push   ebx
 1001297:	68 f4 7a 00 01       	push   0x1007af4
 100129c:	e8 82 12 00 00       	call   1002523 <printk>
 10012a1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:65
#endif
         if (readOnly)
 10012a4:	89 f0                	mov    eax,esi
 10012a6:	84 c0                	test   al,al
 10012a8:	74 05                	je     10012af <kPagingSetPageReadOnlyFlag+0x34>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:66
            *ptEntry&=0xFFFFFFFD;
 10012aa:	83 23 fd             	and    DWORD PTR [ebx],0xfffffffd
 10012ad:	eb 03                	jmp    10012b2 <kPagingSetPageReadOnlyFlag+0x37>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:68
         else
            *ptEntry|=2; 
 10012af:	83 0b 02             	or     DWORD PTR [ebx],0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:69
    RELOAD_CR3
 10012b2:	0f 20 d8             	mov    eax,cr3
 10012b5:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:71
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10012b8:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10012bf:	74 12                	je     10012d3 <kPagingSetPageReadOnlyFlag+0x58>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:72
            printk("0x%08X\n", *ptEntry);
 10012c1:	83 ec 08             	sub    esp,0x8
 10012c4:	ff 33                	push   DWORD PTR [ebx]
 10012c6:	68 0e 77 00 01       	push   0x100770e
 10012cb:	e8 53 12 00 00       	call   1002523 <printk>
 10012d0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:74
#endif
}
 10012d3:	83 c4 04             	add    esp,0x4
 10012d6:	5b                   	pop    ebx
 10012d7:	5e                   	pop    esi
 10012d8:	c3                   	ret    

010012d9 <kPagingUpdatePTEPresentFlag>:
kPagingUpdatePTEPresentFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:77

void kPagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present)
{
 10012d9:	56                   	push   esi
 10012da:	53                   	push   ebx
 10012db:	83 ec 04             	sub    esp,0x4
 10012de:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10012e2:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:78
         printd(DEBUG_PAGING,"pagingUpdatePTEPresentFlag: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 10012e6:	ff 33                	push   DWORD PTR [ebx]
 10012e8:	53                   	push   ebx
 10012e9:	68 2c 7b 00 01       	push   0x1007b2c
 10012ee:	6a 40                	push   0x40
 10012f0:	e8 46 12 00 00       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:79
         if (present)
 10012f5:	83 c4 10             	add    esp,0x10
 10012f8:	89 f0                	mov    eax,esi
 10012fa:	84 c0                	test   al,al
 10012fc:	74 05                	je     1001303 <kPagingUpdatePTEPresentFlag+0x2a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:80
             *ptEntry=*ptEntry | 1;
 10012fe:	83 0b 01             	or     DWORD PTR [ebx],0x1
 1001301:	eb 03                	jmp    1001306 <kPagingUpdatePTEPresentFlag+0x2d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:82
         else
             *ptEntry&=0xFFFFFFFE;
 1001303:	83 23 fe             	and    DWORD PTR [ebx],0xfffffffe
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:83
         __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
 1001306:	0f 20 d8             	mov    eax,cr3
 1001309:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:84
         printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 100130c:	83 ec 04             	sub    esp,0x4
 100130f:	ff 33                	push   DWORD PTR [ebx]
 1001311:	68 0e 77 00 01       	push   0x100770e
 1001316:	6a 40                	push   0x40
 1001318:	e8 1e 12 00 00       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:85
}
 100131d:	83 c4 14             	add    esp,0x14
 1001320:	5b                   	pop    ebx
 1001321:	5e                   	pop    esi
 1001322:	c3                   	ret    

01001323 <kSetVirtualRangeRO>:
kSetVirtualRangeRO():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:88

void kSetVirtualRangeRO(uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 1001323:	55                   	push   ebp
 1001324:	57                   	push   edi
 1001325:	56                   	push   esi
 1001326:	53                   	push   ebx
 1001327:	83 ec 1c             	sub    esp,0x1c
 100132a:	8b 5c 24 30          	mov    ebx,DWORD PTR [esp+0x30]
 100132e:	8b 6c 24 34          	mov    ebp,DWORD PTR [esp+0x34]
 1001332:	8b 74 24 38          	mov    esi,DWORD PTR [esp+0x38]
 1001336:	89 f7                	mov    edi,esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:91
    uintptr_t* startPTE;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001338:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100133f:	74 12                	je     1001353 <kSetVirtualRangeRO+0x30>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:92
           printk("kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
 1001341:	83 ec 04             	sub    esp,0x4
 1001344:	55                   	push   ebp
 1001345:	53                   	push   ebx
 1001346:	68 68 7b 00 01       	push   0x1007b68
 100134b:	e8 d3 11 00 00       	call   1002523 <printk>
 1001350:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:94 (discriminator 1)
#endif
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 1001353:	83 c5 01             	add    ebp,0x1
 1001356:	39 eb                	cmp    ebx,ebp
 1001358:	77 5b                	ja     10013b5 <kSetVirtualRangeRO+0x92>
 100135a:	89 f0                	mov    eax,esi
 100135c:	84 c0                	test   al,al
 100135e:	b8 e1 73 00 01       	mov    eax,0x10073e1
 1001363:	ba de 73 00 01       	mov    edx,0x10073de
 1001368:	0f 45 c2             	cmovne eax,edx
 100136b:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:101
        startPTE=(uintptr_t*)kPagingGet4kPTEntryAddress(cnt);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printk("0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
#endif
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 100136f:	89 f8                	mov    eax,edi
 1001371:	0f b6 f8             	movzx  edi,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:96
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
           printk("kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
#endif
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
    {
        startPTE=(uintptr_t*)kPagingGet4kPTEntryAddress(cnt);
 1001374:	83 ec 0c             	sub    esp,0xc
 1001377:	53                   	push   ebx
 1001378:	e8 9b fe ff ff       	call   1001218 <kPagingGet4kPTEntryAddress>
 100137d:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:98
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 100137f:	83 c4 10             	add    esp,0x10
 1001382:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001389:	74 13                	je     100139e <kSetVirtualRangeRO+0x7b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:99 (discriminator 4)
            printk("0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
 100138b:	ff 74 24 0c          	push   DWORD PTR [esp+0xc]
 100138f:	50                   	push   eax
 1001390:	53                   	push   ebx
 1001391:	68 e4 73 00 01       	push   0x10073e4
 1001396:	e8 88 11 00 00       	call   1002523 <printk>
 100139b:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:101 (discriminator 2)
#endif
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 100139e:	83 ec 08             	sub    esp,0x8
 10013a1:	57                   	push   edi
 10013a2:	56                   	push   esi
 10013a3:	e8 d3 fe ff ff       	call   100127b <kPagingSetPageReadOnlyFlag>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:94 (discriminator 2)
    uintptr_t* startPTE;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
           printk("kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
#endif
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 10013a8:	81 c3 00 10 00 00    	add    ebx,0x1000
 10013ae:	83 c4 10             	add    esp,0x10
 10013b1:	39 eb                	cmp    ebx,ebp
 10013b3:	76 bf                	jbe    1001374 <kSetVirtualRangeRO+0x51>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:105
#endif
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
            
    }
        //for cnt=0;cnt<=8192;cnt+=4096
}
 10013b5:	83 c4 1c             	add    esp,0x1c
 10013b8:	5b                   	pop    ebx
 10013b9:	5e                   	pop    esi
 10013ba:	5f                   	pop    edi
 10013bb:	5d                   	pop    ebp
 10013bc:	c3                   	ret    

010013bd <kpagingUpdatePresentFlagA>:
kpagingUpdatePresentFlagA():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:109

//Absolute version, page passed is already virtual
void kpagingUpdatePresentFlagA(uint32_t address, bool present)
{
 10013bd:	56                   	push   esi
 10013be:	53                   	push   ebx
 10013bf:	83 ec 04             	sub    esp,0x4
 10013c2:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 10013c6:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:111
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10013ca:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10013d1:	74 21                	je     10013f4 <kpagingUpdatePresentFlagA+0x37>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:112
            printk("kpagingUpdatePresentFlagA: Make 0x%08X %s\n", address, present?"present":"not present");
 10013d3:	84 db                	test   bl,bl
 10013d5:	ba fc 73 00 01       	mov    edx,0x10073fc
 10013da:	b8 00 74 00 01       	mov    eax,0x1007400
 10013df:	0f 44 c2             	cmove  eax,edx
 10013e2:	83 ec 04             	sub    esp,0x4
 10013e5:	50                   	push   eax
 10013e6:	56                   	push   esi
 10013e7:	68 98 7b 00 01       	push   0x1007b98
 10013ec:	e8 32 11 00 00       	call   1002523 <printk>
 10013f1:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:114
#endif
        uintptr_t* pagePTE= (uintptr_t*)kPagingGet4kPTEntryAddress(address&0xFFFFF000);
 10013f4:	83 ec 0c             	sub    esp,0xc
 10013f7:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 10013fd:	56                   	push   esi
 10013fe:	e8 15 fe ff ff       	call   1001218 <kPagingGet4kPTEntryAddress>
 1001403:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:116
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001405:	83 c4 10             	add    esp,0x10
 1001408:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100140f:	74 11                	je     1001422 <kpagingUpdatePresentFlagA+0x65>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:117
            printk("kpagingUpdatePresentFlagA: updating entry 0x%08X\n", pagePTE);
 1001411:	83 ec 08             	sub    esp,0x8
 1001414:	50                   	push   eax
 1001415:	68 c4 7b 00 01       	push   0x1007bc4
 100141a:	e8 04 11 00 00       	call   1002523 <printk>
 100141f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:119
#endif
        kPagingUpdatePTEPresentFlag(pagePTE, present);
 1001422:	83 ec 08             	sub    esp,0x8
 1001425:	0f b6 db             	movzx  ebx,bl
 1001428:	53                   	push   ebx
 1001429:	56                   	push   esi
 100142a:	e8 aa fe ff ff       	call   10012d9 <kPagingUpdatePTEPresentFlag>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:120
}
 100142f:	83 c4 14             	add    esp,0x14
 1001432:	5b                   	pop    ebx
 1001433:	5e                   	pop    esi
 1001434:	c3                   	ret    

01001435 <kpagingUpdatePresentFlagV>:
kpagingUpdatePresentFlagV():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:123

void kpagingUpdatePresentFlagV(uint32_t address, bool present)
{
 1001435:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:125
    address+=KERNEL_PAGED_BASE_ADDRESS; 
    kpagingUpdatePresentFlagA(address, present);
 1001438:	0f b6 44 24 1c       	movzx  eax,BYTE PTR [esp+0x1c]
 100143d:	50                   	push   eax
 100143e:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1001442:	2d 00 00 00 40       	sub    eax,0x40000000
 1001447:	50                   	push   eax
 1001448:	e8 70 ff ff ff       	call   10013bd <kpagingUpdatePresentFlagA>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:126
}
 100144d:	83 c4 1c             	add    esp,0x1c
 1001450:	c3                   	ret    

01001451 <kMapPage>:
kMapPage():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:129

void kMapPage(uintptr_t mapTo, uintptr_t mapFrom, uint8_t flags)
{
 1001451:	57                   	push   edi
 1001452:	56                   	push   esi
 1001453:	53                   	push   ebx
 1001454:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
 1001458:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:134
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)kKernelPageDir;
    ptrVal=ptr[(mapTo>>22)];
 100145c:	89 cb                	mov    ebx,ecx
 100145e:	c1 eb 16             	shr    ebx,0x16
 1001461:	a1 a4 02 12 00       	mov    eax,ds:0x1202a4
 1001466:	8d 1c 98             	lea    ebx,[eax+ebx*4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:135
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
 1001469:	83 3b 00             	cmp    DWORD PTR [ebx],0x0
 100146c:	75 6a                	jne    10014d8 <kMapPage+0x87>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:135 (discriminator 1)
 100146e:	bf 00 00 00 00       	mov    edi,0x0
 1001473:	3b 3d 4c 00 12 00    	cmp    edi,DWORD PTR ds:0x12004c
 1001479:	72 08                	jb     1001483 <kMapPage+0x32>
 100147b:	3b 0d 48 00 12 00    	cmp    ecx,DWORD PTR ds:0x120048
 1001481:	73 41                	jae    10014c4 <kMapPage+0x73>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:138
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
 1001483:	c7 03 63 00 00 20    	mov    DWORD PTR [ebx],0x20000063
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:139
        ptrT[(mapTo&0x003FFFFF/4096)]=mapFrom | flags;
 1001489:	89 c8                	mov    eax,ecx
 100148b:	25 ff 03 00 00       	and    eax,0x3ff
 1001490:	8d 34 85 00 00 00 20 	lea    esi,[eax*4+0x20000000]
 1001497:	0f b6 d2             	movzx  edx,dl
 100149a:	0b 54 24 14          	or     edx,DWORD PTR [esp+0x14]
 100149e:	89 14 85 00 00 00 20 	mov    DWORD PTR [eax*4+0x20000000],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:141
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10014a5:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10014ac:	74 64                	je     1001512 <kMapPage+0xc1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:142
            printk("kMapPage: Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)],ptrT[(mapTo&0x003FFFFF/4096)]);
 10014ae:	83 ec 0c             	sub    esp,0xc
 10014b1:	52                   	push   edx
 10014b2:	56                   	push   esi
 10014b3:	53                   	push   ebx
 10014b4:	51                   	push   ecx
 10014b5:	68 f8 7b 00 01       	push   0x1007bf8
 10014ba:	e8 64 10 00 00       	call   1002523 <printk>
 10014bf:	83 c4 20             	add    esp,0x20
 10014c2:	eb 4e                	jmp    1001512 <kMapPage+0xc1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:150
    else
    {
        //ptrVal right now points to the pdir entry
        ptr=(uint32_t*)kKernelPageDir;
        if (ptr[(mapTo>>22)]==0)
            ptr[mapTo>>22]=(KERNEL_PAGE_TABLE_BASE_ADDRESS + ((mapTo&0x003FFFFF)/4096)) | 0x63;
 10014c4:	89 c8                	mov    eax,ecx
 10014c6:	25 ff ff 3f 00       	and    eax,0x3fffff
 10014cb:	c1 e8 0c             	shr    eax,0xc
 10014ce:	05 00 00 1c 00       	add    eax,0x1c0000
 10014d3:	83 c8 63             	or     eax,0x63
 10014d6:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:156
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=mapFrom | flags;
 10014d8:	8b 33                	mov    esi,DWORD PTR [ebx]
 10014da:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 10014e0:	89 c8                	mov    eax,ecx
 10014e2:	c1 e8 0a             	shr    eax,0xa
 10014e5:	25 fc 0f 00 00       	and    eax,0xffc
 10014ea:	01 f0                	add    eax,esi
 10014ec:	0f b6 d2             	movzx  edx,dl
 10014ef:	0b 54 24 14          	or     edx,DWORD PTR [esp+0x14]
 10014f3:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:160
//                printk("ptrT=%X(%X)\n",&ptrT[ptrVal],ptrT[ptrVal]);
//                STOPHERE2
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10014f5:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10014fc:	74 14                	je     1001512 <kMapPage+0xc1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:161
            printk("2) Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal],ptrT[ptrVal]);
 10014fe:	83 ec 0c             	sub    esp,0xc
 1001501:	52                   	push   edx
 1001502:	50                   	push   eax
 1001503:	53                   	push   ebx
 1001504:	51                   	push   ecx
 1001505:	68 38 7c 00 01       	push   0x1007c38
 100150a:	e8 14 10 00 00       	call   1002523 <printk>
 100150f:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:165
#endif
    }
//    if (ptrT[(src&0x003FFFFF/1000)]==0)
}
 1001512:	5b                   	pop    ebx
 1001513:	5e                   	pop    esi
 1001514:	5f                   	pop    edi
 1001515:	c3                   	ret    

01001516 <kIsPageMapped>:
kIsPageMapped():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:168

bool kIsPageMapped(uintptr_t Address)
{
 1001516:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:169
    if (!kPagingGet4kPTEntryValue(Address))
 1001519:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100151d:	e8 20 fd ff ff       	call   1001242 <kPagingGet4kPTEntryValue>
 1001522:	85 c0                	test   eax,eax
 1001524:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:172
        return false;
    return true;
}
 1001527:	83 c4 1c             	add    esp,0x1c
 100152a:	c3                   	ret    

0100152b <kUnMapPage>:
kUnMapPage():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:175

void kUnMapPage(uintptr_t mapTo, uint8_t newFlags)
{
 100152b:	57                   	push   edi
 100152c:	56                   	push   esi
 100152d:	53                   	push   ebx
 100152e:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
 1001532:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:180
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)kKernelPageDir;
    ptrVal=ptr[(mapTo>>22)];
 1001536:	89 cb                	mov    ebx,ecx
 1001538:	c1 eb 16             	shr    ebx,0x16
 100153b:	a1 a4 02 12 00       	mov    eax,ds:0x1202a4
 1001540:	8d 1c 98             	lea    ebx,[eax+ebx*4]
 1001543:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:181
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
 1001545:	85 c0                	test   eax,eax
 1001547:	75 4e                	jne    1001597 <kUnMapPage+0x6c>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:181 (discriminator 1)
 1001549:	bf 00 00 00 00       	mov    edi,0x0
 100154e:	3b 3d 4c 00 12 00    	cmp    edi,DWORD PTR ds:0x12004c
 1001554:	72 08                	jb     100155e <kUnMapPage+0x33>
 1001556:	3b 0d 48 00 12 00    	cmp    ecx,DWORD PTR ds:0x120048
 100155c:	73 39                	jae    1001597 <kUnMapPage+0x6c>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:184
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
 100155e:	c7 03 63 00 00 20    	mov    DWORD PTR [ebx],0x20000063
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:185
        ptrT[(mapTo&0x003FFFFF/4096)]=0 | newFlags;
 1001564:	89 c8                	mov    eax,ecx
 1001566:	25 ff 03 00 00       	and    eax,0x3ff
 100156b:	8d 34 85 00 00 00 20 	lea    esi,[eax*4+0x20000000]
 1001572:	0f b6 d2             	movzx  edx,dl
 1001575:	89 14 85 00 00 00 20 	mov    DWORD PTR [eax*4+0x20000000],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:187
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 100157c:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 1001583:	74 43                	je     10015c8 <kUnMapPage+0x9d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:188
            printk("kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)]);
 1001585:	56                   	push   esi
 1001586:	53                   	push   ebx
 1001587:	51                   	push   ecx
 1001588:	68 74 7c 00 01       	push   0x1007c74
 100158d:	e8 91 0f 00 00       	call   1002523 <printk>
 1001592:	83 c4 10             	add    esp,0x10
 1001595:	eb 31                	jmp    10015c8 <kUnMapPage+0x9d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:200
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=0 | newFlags;
 1001597:	25 00 f0 ff ff       	and    eax,0xfffff000
 100159c:	89 c6                	mov    esi,eax
 100159e:	89 c8                	mov    eax,ecx
 10015a0:	c1 e8 0a             	shr    eax,0xa
 10015a3:	25 fc 0f 00 00       	and    eax,0xffc
 10015a8:	01 f0                	add    eax,esi
 10015aa:	0f b6 d2             	movzx  edx,dl
 10015ad:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:204
//                printk("ptrT=%X(%X)\n",&ptrT[ptrVal],ptrT[ptrVal]);
//                STOPHERE2
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10015af:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10015b6:	74 10                	je     10015c8 <kUnMapPage+0x9d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:205
            printk("2) Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal]);
 10015b8:	50                   	push   eax
 10015b9:	53                   	push   ebx
 10015ba:	51                   	push   ecx
 10015bb:	68 ac 7c 00 01       	push   0x1007cac
 10015c0:	e8 5e 0f 00 00       	call   1002523 <printk>
 10015c5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:209
#endif
    }
//    if (ptrT[(src&0x003FFFFF/1000)]==0)
}
 10015c8:	5b                   	pop    ebx
 10015c9:	5e                   	pop    esi
 10015ca:	5f                   	pop    edi
 10015cb:	c3                   	ret    

010015cc <kSetPhysicalRangeRO>:
kSetPhysicalRangeRO():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:212

void kSetPhysicalRangeRO(uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 10015cc:	55                   	push   ebp
 10015cd:	57                   	push   edi
 10015ce:	56                   	push   esi
 10015cf:	53                   	push   ebx
 10015d0:	83 ec 0c             	sub    esp,0xc
 10015d3:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 10015d7:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
 10015db:	8b 5c 24 28          	mov    ebx,DWORD PTR [esp+0x28]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:214
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10015df:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 10015e6:	74 22                	je     100160a <kSetPhysicalRangeRO+0x3e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:215
            printk("kMakePhysicalRangeRO: Make 0x%08X(0x%08X)-0x%08X(0x%08X) r/o\n", startAddy, startAddy&0xFffff000, endAddy, endAddy&0xFFFFF000);
 10015e8:	83 ec 0c             	sub    esp,0xc
 10015eb:	89 f0                	mov    eax,esi
 10015ed:	25 00 f0 ff ff       	and    eax,0xfffff000
 10015f2:	50                   	push   eax
 10015f3:	56                   	push   esi
 10015f4:	89 e8                	mov    eax,ebp
 10015f6:	25 00 f0 ff ff       	and    eax,0xfffff000
 10015fb:	50                   	push   eax
 10015fc:	55                   	push   ebp
 10015fd:	68 dc 7c 00 01       	push   0x1007cdc
 1001602:	e8 1c 0f 00 00       	call   1002523 <printk>
 1001607:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:217
#endif
    kSetVirtualRangeRO((startAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, (endAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, readOnly);
 100160a:	83 ec 04             	sub    esp,0x4
 100160d:	0f b6 fb             	movzx  edi,bl
 1001610:	57                   	push   edi
 1001611:	81 ee 00 00 00 40    	sub    esi,0x40000000
 1001617:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 100161d:	56                   	push   esi
 100161e:	8d 9d 00 00 00 c0    	lea    ebx,[ebp-0x40000000]
 1001624:	81 e3 00 f0 ff ff    	and    ebx,0xfffff000
 100162a:	53                   	push   ebx
 100162b:	e8 f3 fc ff ff       	call   1001323 <kSetVirtualRangeRO>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:218
}
 1001630:	83 c4 1c             	add    esp,0x1c
 1001633:	5b                   	pop    ebx
 1001634:	5e                   	pop    esi
 1001635:	5f                   	pop    edi
 1001636:	5d                   	pop    ebp
 1001637:	c3                   	ret    

01001638 <mmKernelSetPageInUseFlag>:
mmKernelSetPageInUseFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:221

void mmKernelSetPageInUseFlag(uintptr_t address, bool inUse)
{
 1001638:	56                   	push   esi
 1001639:	53                   	push   ebx
 100163a:	83 ec 04             	sub    esp,0x4
 100163d:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1001641:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:224
    uintptr_t* ptEntry;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001645:	f6 05 38 03 12 00 40 	test   BYTE PTR ds:0x120338,0x40
 100164c:	74 22                	je     1001670 <mmKernelSetPageInUseFlag+0x38>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:225
           printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 100164e:	89 f0                	mov    eax,esi
 1001650:	84 c0                	test   al,al
 1001652:	ba 08 74 00 01       	mov    edx,0x1007408
 1001657:	b8 0c 74 00 01       	mov    eax,0x100740c
 100165c:	0f 44 c2             	cmove  eax,edx
 100165f:	50                   	push   eax
 1001660:	53                   	push   ebx
 1001661:	68 1c 7d 00 01       	push   0x1007d1c
 1001666:	6a 40                	push   0x40
 1001668:	e8 ce 0e 00 00       	call   100253b <printd>
 100166d:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:227
#endif
        ptEntry=(uintptr_t*)kPagingGet4kPTEntryAddress(address);
 1001670:	83 ec 0c             	sub    esp,0xc
 1001673:	53                   	push   ebx
 1001674:	e8 9f fb ff ff       	call   1001218 <kPagingGet4kPTEntryAddress>
 1001679:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:228
        printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 100167b:	ff 30                	push   DWORD PTR [eax]
 100167d:	50                   	push   eax
 100167e:	68 60 7d 00 01       	push   0x1007d60
 1001683:	6a 40                	push   0x40
 1001685:	e8 b1 0e 00 00       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:229
        if (inUse)
 100168a:	83 c4 20             	add    esp,0x20
 100168d:	89 f0                	mov    eax,esi
 100168f:	84 c0                	test   al,al
 1001691:	74 08                	je     100169b <mmKernelSetPageInUseFlag+0x63>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:230
            *ptEntry|=PAGING_IN_USE_FLAG_MASK;
 1001693:	81 0b 00 08 00 00    	or     DWORD PTR [ebx],0x800
 1001699:	eb 06                	jmp    10016a1 <mmKernelSetPageInUseFlag+0x69>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:232
        else
            *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
 100169b:	81 23 ff f7 ff ff    	and    DWORD PTR [ebx],0xfffff7ff
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:233
}
 10016a1:	83 c4 04             	add    esp,0x4
 10016a4:	5b                   	pop    ebx
 10016a5:	5e                   	pop    esi
 10016a6:	c3                   	ret    

010016a7 <mmKernelSetPageRangeInUseFlag>:
mmKernelSetPageRangeInUseFlag():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:236

void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
 10016a7:	55                   	push   ebp
 10016a8:	57                   	push   edi
 10016a9:	56                   	push   esi
 10016aa:	53                   	push   ebx
 10016ab:	83 ec 0c             	sub    esp,0xc
 10016ae:	8b 5c 24 20          	mov    ebx,DWORD PTR [esp+0x20]
 10016b2:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
 10016b6:	8b 6c 24 28          	mov    ebp,DWORD PTR [esp+0x28]
 10016ba:	0f b6 44 24 2c       	movzx  eax,BYTE PTR [esp+0x2c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:237
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 10016bf:	39 fb                	cmp    ebx,edi
 10016c1:	73 16                	jae    10016d9 <mmKernelSetPageRangeInUseFlag+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:238 (discriminator 3)
        mmKernelSetPageInUseFlag(cnt,inUse);
 10016c3:	0f b6 f0             	movzx  esi,al
 10016c6:	83 ec 08             	sub    esp,0x8
 10016c9:	56                   	push   esi
 10016ca:	53                   	push   ebx
 10016cb:	e8 68 ff ff ff       	call   1001638 <mmKernelSetPageInUseFlag>
 10016d0:	01 eb                	add    ebx,ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:237 (discriminator 3)
            *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
}

void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 10016d2:	83 c4 10             	add    esp,0x10
 10016d5:	39 fb                	cmp    ebx,edi
 10016d7:	72 ed                	jb     10016c6 <mmKernelSetPageRangeInUseFlag+0x1f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:239
        mmKernelSetPageInUseFlag(cnt,inUse);
}
 10016d9:	83 c4 0c             	add    esp,0xc
 10016dc:	5b                   	pop    ebx
 10016dd:	5e                   	pop    esi
 10016de:	5f                   	pop    edi
 10016df:	5d                   	pop    ebp
 10016e0:	c3                   	ret    

010016e1 <mmUnusePageRange>:
mmUnusePageRange():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/kpaging.c:242

void mmUnusePageRange()
{
 10016e1:	f3 c3                	repz ret 
 10016e3:	90                   	nop

010016e4 <reverse>:
reverse():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:29
//#include <string.h>

/* reverse:  reverse string s in place */
extern int strlen(char*);
 void reverse(char s[])
 {
 10016e4:	56                   	push   esi
 10016e5:	53                   	push   ebx
 10016e6:	83 ec 10             	sub    esp,0x10
 10016e9:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:33
     int i, j;
     char c;

     for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
 10016ed:	53                   	push   ebx
 10016ee:	e8 dd 0e 00 00       	call   10025d0 <strlen>
 10016f3:	83 e8 01             	sub    eax,0x1
 10016f6:	83 c4 10             	add    esp,0x10
 10016f9:	85 c0                	test   eax,eax
 10016fb:	7e 1f                	jle    100171c <reverse+0x38>
 10016fd:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:34 (discriminator 3)
         c = s[i];
 1001702:	0f b6 34 13          	movzx  esi,BYTE PTR [ebx+edx*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:35 (discriminator 3)
         s[i] = s[j];
 1001706:	0f b6 0c 03          	movzx  ecx,BYTE PTR [ebx+eax*1]
 100170a:	88 0c 13             	mov    BYTE PTR [ebx+edx*1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:36 (discriminator 3)
         s[j] = c;
 100170d:	89 f1                	mov    ecx,esi
 100170f:	88 0c 03             	mov    BYTE PTR [ebx+eax*1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:33 (discriminator 3)
 void reverse(char s[])
 {
     int i, j;
     char c;

     for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
 1001712:	83 c2 01             	add    edx,0x1
 1001715:	83 e8 01             	sub    eax,0x1
 1001718:	39 c2                	cmp    edx,eax
 100171a:	7c e6                	jl     1001702 <reverse+0x1e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:38
         c = s[i];
         s[i] = s[j];
         s[j] = c;
     }
 }
 100171c:	83 c4 04             	add    esp,0x4
 100171f:	5b                   	pop    ebx
 1001720:	5e                   	pop    esi
 1001721:	c3                   	ret    

01001722 <itoa>:
itoa():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:40
 void itoa(int n, char s[])
 {
 1001722:	55                   	push   ebp
 1001723:	57                   	push   edi
 1001724:	56                   	push   esi
 1001725:	53                   	push   ebx
 1001726:	83 ec 1c             	sub    esp,0x1c
 1001729:	8b 7c 24 34          	mov    edi,DWORD PTR [esp+0x34]
 100172d:	8b 44 24 30          	mov    eax,DWORD PTR [esp+0x30]
 1001731:	c1 f8 1f             	sar    eax,0x1f
 1001734:	89 c1                	mov    ecx,eax
 1001736:	33 4c 24 30          	xor    ecx,DWORD PTR [esp+0x30]
 100173a:	29 c1                	sub    ecx,eax
 100173c:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:47

     if ((sign = n) < 0)  /* record sign */
         n = -n;          /* make n positive */
     i = 0;
     do {       /* generate digits in reverse order */
         s[i++] = n % 10 + '0';   /* get next digit */
 1001741:	bd 67 66 66 66       	mov    ebp,0x66666667
 1001746:	eb 02                	jmp    100174a <itoa+0x28>
 1001748:	89 de                	mov    esi,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:47 (discriminator 1)
 100174a:	8d 5e 01             	lea    ebx,[esi+0x1]
 100174d:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
 1001751:	89 c8                	mov    eax,ecx
 1001753:	f7 ed                	imul   ebp
 1001755:	c1 fa 02             	sar    edx,0x2
 1001758:	89 c8                	mov    eax,ecx
 100175a:	c1 f8 1f             	sar    eax,0x1f
 100175d:	29 c2                	sub    edx,eax
 100175f:	8d 04 92             	lea    eax,[edx+edx*4]
 1001762:	01 c0                	add    eax,eax
 1001764:	29 c1                	sub    ecx,eax
 1001766:	83 c1 30             	add    ecx,0x30
 1001769:	88 4c 1f ff          	mov    BYTE PTR [edi+ebx*1-0x1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:48 (discriminator 1)
     } while ((n /= 10) > 0);     /* delete it */
 100176d:	89 d1                	mov    ecx,edx
 100176f:	85 d2                	test   edx,edx
 1001771:	7f d5                	jg     1001748 <itoa+0x26>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:49
     if (sign < 0)
 1001773:	83 7c 24 30 00       	cmp    DWORD PTR [esp+0x30],0x0
 1001778:	79 0b                	jns    1001785 <itoa+0x63>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:50
         s[i++] = '-';
 100177a:	8d 5e 02             	lea    ebx,[esi+0x2]
 100177d:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1001781:	c6 04 07 2d          	mov    BYTE PTR [edi+eax*1],0x2d
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:51
     s[i] = '\0';
 1001785:	c6 04 1f 00          	mov    BYTE PTR [edi+ebx*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:52
     reverse(s);
 1001789:	83 ec 0c             	sub    esp,0xc
 100178c:	57                   	push   edi
 100178d:	e8 52 ff ff ff       	call   10016e4 <reverse>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:53
 }
 1001792:	83 c4 2c             	add    esp,0x2c
 1001795:	5b                   	pop    ebx
 1001796:	5e                   	pop    esi
 1001797:	5f                   	pop    edi
 1001798:	5d                   	pop    ebp
 1001799:	c3                   	ret    

0100179a <itox>:
itox():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:55
void itox(unsigned int i, char *s)
{
 100179a:	53                   	push   ebx
 100179b:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 100179f:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:58
    unsigned char n;

    s += 4;
 10017a3:	8d 43 04             	lea    eax,[ebx+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:59
    *s = '\0';
 10017a6:	c6 43 04 00          	mov    BYTE PTR [ebx+0x4],0x0
 10017aa:	83 eb 04             	sub    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:62 (discriminator 3)

    for (n = 8; n != 0; --n) {
        *--s = "0123456789ABCDEF"[i & 0x0F];
 10017ad:	83 e8 01             	sub    eax,0x1
 10017b0:	89 d1                	mov    ecx,edx
 10017b2:	83 e1 0f             	and    ecx,0xf
 10017b5:	0f b6 89 13 74 00 01 	movzx  ecx,BYTE PTR [ecx+0x1007413]
 10017bc:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:63 (discriminator 3)
        i >>= 4;
 10017be:	c1 ea 04             	shr    edx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:61 (discriminator 3)
    unsigned char n;

    s += 4;
    *s = '\0';

    for (n = 8; n != 0; --n) {
 10017c1:	39 c3                	cmp    ebx,eax
 10017c3:	75 e8                	jne    10017ad <itox+0x13>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:65
        *--s = "0123456789ABCDEF"[i & 0x0F];
        i >>= 4;
    }
}
 10017c5:	5b                   	pop    ebx
 10017c6:	c3                   	ret    

010017c7 <atoi>:
atoi():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:68
// A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
int atoi(char *str)
{
 10017c7:	8b 4c 24 04          	mov    ecx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:73
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
 10017cb:	0f b6 11             	movzx  edx,BYTE PTR [ecx]
 10017ce:	84 d2                	test   dl,dl
 10017d0:	74 1f                	je     10017f1 <atoi+0x2a>
 10017d2:	83 c1 01             	add    ecx,0x1
 10017d5:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:74 (discriminator 3)
        res = res*10 + str[i] - '0';
 10017da:	8d 04 80             	lea    eax,[eax+eax*4]
 10017dd:	0f be d2             	movsx  edx,dl
 10017e0:	8d 44 42 d0          	lea    eax,[edx+eax*2-0x30]
 10017e4:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:73 (discriminator 3)
{
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
 10017e7:	0f b6 51 ff          	movzx  edx,BYTE PTR [ecx-0x1]
 10017eb:	84 d2                	test   dl,dl
 10017ed:	75 eb                	jne    10017da <atoi+0x13>
 10017ef:	f3 c3                	repz ret 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:69
    }
}
// A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
int atoi(char *str)
{
    int res = 0; // Initialize result
 10017f1:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:78
    for (int i = 0; str[i] != '\0'; ++i)
        res = res*10 + str[i] - '0';
  
    // return result.
    return res;
}
 10017f6:	c3                   	ret    

010017f7 <convert>:
convert():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:81

int convert(int s)
{
 10017f7:	83 ec 10             	sub    esp,0x10
 10017fa:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:83
  int c;
  char hex[] = {'A', 'B', 'C', 'D', 'E', 'F'};
 10017fe:	c6 44 24 0a 41       	mov    BYTE PTR [esp+0xa],0x41
 1001803:	c6 44 24 0b 42       	mov    BYTE PTR [esp+0xb],0x42
 1001808:	c6 44 24 0c 43       	mov    BYTE PTR [esp+0xc],0x43
 100180d:	c6 44 24 0d 44       	mov    BYTE PTR [esp+0xd],0x44
 1001812:	c6 44 24 0e 45       	mov    BYTE PTR [esp+0xe],0x45
 1001817:	c6 44 24 0f 46       	mov    BYTE PTR [esp+0xf],0x46
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:84
  c = (s >= 0 && s < 9) ? s + '0' : hex[s - 10];
 100181c:	83 f8 08             	cmp    eax,0x8
 100181f:	77 05                	ja     1001826 <convert+0x2f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:84 (discriminator 1)
 1001821:	83 c0 30             	add    eax,0x30
 1001824:	eb 04                	jmp    100182a <convert+0x33>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:84 (discriminator 2)
 1001826:	0f be 04 04          	movsx  eax,BYTE PTR [esp+eax*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:86 (discriminator 4)
  return c;
}
 100182a:	83 c4 10             	add    esp,0x10
 100182d:	c3                   	ret    

0100182e <itoha>:
itoha():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:89

void itoha(unsigned int n, char *buf)
{
 100182e:	55                   	push   ebp
 100182f:	57                   	push   edi
 1001830:	56                   	push   esi
 1001831:	53                   	push   ebx
 1001832:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 1001836:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:92
  int i = 0, j =0;
  j=7;
  while(n != 0)
 100183a:	85 db                	test   ebx,ebx
 100183c:	74 25                	je     1001863 <itoha+0x35>
 100183e:	be 07 00 00 00       	mov    esi,0x7
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:94
  {
    i = n % 16;
 1001843:	89 dd                	mov    ebp,ebx
 1001845:	83 e5 0f             	and    ebp,0xf
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:95
      buf[j--] = convert(i);
 1001848:	83 ee 01             	sub    esi,0x1
 100184b:	55                   	push   ebp
 100184c:	e8 a6 ff ff ff       	call   10017f7 <convert>
 1001851:	83 c4 04             	add    esp,0x4
 1001854:	88 44 37 01          	mov    BYTE PTR [edi+esi*1+0x1],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:96
      n = (n - i) / 16;
 1001858:	29 eb                	sub    ebx,ebp
 100185a:	c1 eb 04             	shr    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:92

void itoha(unsigned int n, char *buf)
{
  int i = 0, j =0;
  j=7;
  while(n != 0)
 100185d:	85 db                	test   ebx,ebx
 100185f:	75 e2                	jne    1001843 <itoha+0x15>
 1001861:	eb 05                	jmp    1001868 <itoha+0x3a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:91
}

void itoha(unsigned int n, char *buf)
{
  int i = 0, j =0;
  j=7;
 1001863:	be 07 00 00 00       	mov    esi,0x7
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:98
  {
    i = n % 16;
      buf[j--] = convert(i);
      n = (n - i) / 16;
  }
  buf[j] = '\0';
 1001868:	c6 04 37 00          	mov    BYTE PTR [edi+esi*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:99
}
 100186c:	5b                   	pop    ebx
 100186d:	5e                   	pop    esi
 100186e:	5f                   	pop    edi
 100186f:	5d                   	pop    ebp
 1001870:	c3                   	ret    

01001871 <identify_data_sizes>:
identify_data_sizes():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:102

void identify_data_sizes(sizeof_t* sizes)
{
 1001871:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:103
    sizes->shortSize = sizeof(short);
 1001875:	66 c7 00 02 00       	mov    WORD PTR [eax],0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:104
    sizes->intSize = sizeof(int);
 100187a:	66 c7 40 02 04 00    	mov    WORD PTR [eax+0x2],0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:105
    sizes->longSize = sizeof(long);
 1001880:	66 c7 40 04 04 00    	mov    WORD PTR [eax+0x4],0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:106
    sizes->longLongSize = sizeof(long long);
 1001886:	66 c7 40 06 08 00    	mov    WORD PTR [eax+0x6],0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:107
    sizes->longLongIntSize = sizeof(long long int);
 100188c:	66 c7 40 08 08 00    	mov    WORD PTR [eax+0x8],0x8
 1001892:	c3                   	ret    

01001893 <memset>:
memset():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:111
}

void *memset(void *d1, int val, size_t len)
{
 1001893:	56                   	push   esi
 1001894:	53                   	push   ebx
 1001895:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1001899:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 100189d:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:114
    uint8_t *d = d1;
    uint16_t*e = d1;
    uint16_t eVal=(val << 16) | (val << 8) | val;
 10018a1:	89 f1                	mov    ecx,esi
 10018a3:	c1 e1 08             	shl    ecx,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:118
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
 10018a6:	f6 c2 03             	test   dl,0x3
 10018a9:	75 16                	jne    10018c1 <memset+0x2e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:119
    while (len-=4) {
 10018ab:	83 ea 04             	sub    edx,0x4
 10018ae:	74 43                	je     10018f3 <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:120
        *d++ = fVal;
 10018b0:	89 f3                	mov    ebx,esi
 10018b2:	89 c1                	mov    ecx,eax
 10018b4:	83 c1 01             	add    ecx,0x1
 10018b7:	88 59 ff             	mov    BYTE PTR [ecx-0x1],bl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:119
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
 10018ba:	83 ea 04             	sub    edx,0x4
 10018bd:	75 f5                	jne    10018b4 <memset+0x21>
 10018bf:	eb 32                	jmp    10018f3 <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:122
        *d++ = fVal;
    }
    else if (((len%2)==0))
 10018c1:	f6 c2 01             	test   dl,0x1
 10018c4:	74 0b                	je     10018d1 <memset+0x3e>
 10018c6:	8d 1c 10             	lea    ebx,[eax+edx*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:127
    while (len-=2) {
        *d++ = eVal;
    }
    else
    while (len--) {
 10018c9:	89 c1                	mov    ecx,eax
 10018cb:	85 d2                	test   edx,edx
 10018cd:	75 18                	jne    10018e7 <memset+0x54>
 10018cf:	eb 22                	jmp    10018f3 <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:123
    if ((len%4)==0)
    while (len-=4) {
        *d++ = fVal;
    }
    else if (((len%2)==0))
    while (len-=2) {
 10018d1:	83 ea 02             	sub    edx,0x2
 10018d4:	74 1d                	je     10018f3 <memset+0x60>
 10018d6:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:124
        *d++ = eVal;
 10018d8:	09 f1                	or     ecx,esi
 10018da:	83 c3 01             	add    ebx,0x1
 10018dd:	88 4b ff             	mov    BYTE PTR [ebx-0x1],cl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:123
    if ((len%4)==0)
    while (len-=4) {
        *d++ = fVal;
    }
    else if (((len%2)==0))
    while (len-=2) {
 10018e0:	83 ea 02             	sub    edx,0x2
 10018e3:	75 f5                	jne    10018da <memset+0x47>
 10018e5:	eb 0c                	jmp    10018f3 <memset+0x60>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:128
        *d++ = eVal;
    }
    else
    while (len--) {
        *d++ = val;
 10018e7:	83 c1 01             	add    ecx,0x1
 10018ea:	89 f2                	mov    edx,esi
 10018ec:	88 51 ff             	mov    BYTE PTR [ecx-0x1],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:127
    else if (((len%2)==0))
    while (len-=2) {
        *d++ = eVal;
    }
    else
    while (len--) {
 10018ef:	39 cb                	cmp    ebx,ecx
 10018f1:	75 f4                	jne    10018e7 <memset+0x54>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:131
        *d++ = val;
    }
    return d1;
}
 10018f3:	5b                   	pop    ebx
 10018f4:	5e                   	pop    esi
 10018f5:	c3                   	ret    

010018f6 <bcdToDec>:
bcdToDec():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:134

uint8_t bcdToDec(uint8_t val)
{
 10018f6:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:135
  return ( (val/16*10) + (val%16) );
 10018fa:	89 c2                	mov    edx,eax
 10018fc:	c0 ea 04             	shr    dl,0x4
 10018ff:	8d 14 92             	lea    edx,[edx+edx*4]
 1001902:	83 e0 0f             	and    eax,0xf
 1001905:	8d 04 50             	lea    eax,[eax+edx*2]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:136
}
 1001908:	c3                   	ret    

01001909 <decToBcd>:
decToBcd():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:139

uint8_t decToBcd(uint8_t val)
{
 1001909:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:140
  return ( (val/10*16) + (val%10) );
 100190d:	0f b6 c8             	movzx  ecx,al
 1001910:	8d 14 89             	lea    edx,[ecx+ecx*4]
 1001913:	8d 14 d1             	lea    edx,[ecx+edx*8]
 1001916:	8d 14 92             	lea    edx,[edx+edx*4]
 1001919:	66 c1 ea 0b          	shr    dx,0xb
 100191d:	89 d1                	mov    ecx,edx
 100191f:	c1 e1 04             	shl    ecx,0x4
 1001922:	8d 14 92             	lea    edx,[edx+edx*4]
 1001925:	01 d2                	add    edx,edx
 1001927:	29 d0                	sub    eax,edx
 1001929:	01 c8                	add    eax,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:141
}
 100192b:	c3                   	ret    

0100192c <initSystemDate>:
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:143
void initSystemDate()
{
 100192c:	83 ec 3c             	sub    esp,0x3c
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 100192f:	b8 00 00 00 00       	mov    eax,0x0
 1001934:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1001936:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:147
    struct tm tmbuf;

    outb(0x70, 0x00);
    tmbuf.tm_sec = bcdToDec(inb(0x71));
 1001938:	0f b6 c0             	movzx  eax,al
 100193b:	50                   	push   eax
 100193c:	e8 b5 ff ff ff       	call   10018f6 <bcdToDec>
 1001941:	0f b6 c0             	movzx  eax,al
 1001944:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001948:	b8 02 00 00 00       	mov    eax,0x2
 100194d:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100194f:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:149
    outb(0x70, 0x02);
    tmbuf.tm_min = bcdToDec(inb(0x71));
 1001951:	0f b6 c0             	movzx  eax,al
 1001954:	89 04 24             	mov    DWORD PTR [esp],eax
 1001957:	e8 9a ff ff ff       	call   10018f6 <bcdToDec>
 100195c:	0f b6 c0             	movzx  eax,al
 100195f:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001963:	b8 04 00 00 00       	mov    eax,0x4
 1001968:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100196a:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:151
    outb(0x70, 0x04);
    tmbuf.tm_hour = bcdToDec(inb(0x71));
 100196c:	0f b6 c0             	movzx  eax,al
 100196f:	89 04 24             	mov    DWORD PTR [esp],eax
 1001972:	e8 7f ff ff ff       	call   10018f6 <bcdToDec>
 1001977:	0f b6 c0             	movzx  eax,al
 100197a:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 100197e:	b8 07 00 00 00       	mov    eax,0x7
 1001983:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1001985:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:153
    outb(0x70, 0x07);
    tmbuf.tm_mday = bcdToDec(inb(0x71));
 1001987:	0f b6 c0             	movzx  eax,al
 100198a:	89 04 24             	mov    DWORD PTR [esp],eax
 100198d:	e8 64 ff ff ff       	call   10018f6 <bcdToDec>
 1001992:	0f b6 c0             	movzx  eax,al
 1001995:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001999:	b8 08 00 00 00       	mov    eax,0x8
 100199e:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019a0:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:155
    outb(0x70, 0x08);
    tmbuf.tm_mon = bcdToDec(inb(0x71));
 10019a2:	0f b6 c0             	movzx  eax,al
 10019a5:	89 04 24             	mov    DWORD PTR [esp],eax
 10019a8:	e8 49 ff ff ff       	call   10018f6 <bcdToDec>
 10019ad:	0f b6 c0             	movzx  eax,al
 10019b0:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10019b4:	b8 09 00 00 00       	mov    eax,0x9
 10019b9:	e6 70                	out    0x70,al
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019bb:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:157
    outb(0x70, 0x09);
    tmbuf.tm_year = bcdToDec(inb(0x71));
 10019bd:	0f b6 c0             	movzx  eax,al
 10019c0:	89 04 24             	mov    DWORD PTR [esp],eax
 10019c3:	e8 2e ff ff ff       	call   10018f6 <bcdToDec>
 10019c8:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:158
    tmbuf.tm_isdst = -1;
 10019cb:	c7 44 24 30 ff ff ff 	mov    DWORD PTR [esp+0x30],0xffffffff
 10019d2:	ff 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:160
    tmbuf.tm_year += 2000;
    tmbuf.tm_year = tmbuf.tm_year - 1900;
 10019d3:	0f b6 c0             	movzx  eax,al
 10019d6:	83 c0 64             	add    eax,0x64
 10019d9:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:161
    kSystemStartTime = mktime(&tmbuf);
 10019dd:	8d 44 24 10          	lea    eax,[esp+0x10]
 10019e1:	50                   	push   eax
 10019e2:	e8 a7 0f 00 00       	call   100298e <mktime>
 10019e7:	a3 88 02 12 00       	mov    ds:0x120288,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:162
    kSystemCurrentTime = kSystemStartTime;
 10019ec:	a3 8c 02 12 00       	mov    ds:0x12028c,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:164
//printf("System Date = %d/%d/%d %d:%d:%d\n", tmbuf.tm_mon, tmbuf.tm_mday, tmbuf.tm_year, tmbuf.tm_hour, tmbuf.tm_min, tmbuf.tm_sec, tmbuf.tm_hour, tmbuf.tm_min, tmbuf.tm_sec);
}
 10019f1:	83 c4 4c             	add    esp,0x4c
 10019f4:	c3                   	ret    

010019f5 <strtoupper>:
strtoupper():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:166
char * strtoupper(char* pointerToString)
{
 10019f5:	56                   	push   esi
 10019f6:	53                   	push   ebx
 10019f7:	83 ec 10             	sub    esp,0x10
 10019fa:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:167
    uint8_t start=0, length=strlen(pointerToString);
 10019fe:	53                   	push   ebx
 10019ff:	e8 cc 0b 00 00       	call   10025d0 <strlen>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:171
    char* myPtr=pointerToString;
    
        // Trim.Start:
        while (start<length)
 1001a04:	83 c4 10             	add    esp,0x10
 1001a07:	84 c0                	test   al,al
 1001a09:	74 23                	je     1001a2e <strtoupper+0x39>
 1001a0b:	89 da                	mov    edx,ebx
 1001a0d:	83 e8 01             	sub    eax,0x1
 1001a10:	0f b6 c0             	movzx  eax,al
 1001a13:	8d 74 03 01          	lea    esi,[ebx+eax*1+0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:173
        {
            if (myPtr[start]>='a' && myPtr[start]<='z')
 1001a17:	0f b6 02             	movzx  eax,BYTE PTR [edx]
 1001a1a:	8d 48 9f             	lea    ecx,[eax-0x61]
 1001a1d:	80 f9 19             	cmp    cl,0x19
 1001a20:	77 05                	ja     1001a27 <strtoupper+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:174
                myPtr[start]-=32;
 1001a22:	83 e8 20             	sub    eax,0x20
 1001a25:	88 02                	mov    BYTE PTR [edx],al
 1001a27:	83 c2 01             	add    edx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:171
{
    uint8_t start=0, length=strlen(pointerToString);
    char* myPtr=pointerToString;
    
        // Trim.Start:
        while (start<length)
 1001a2a:	39 f2                	cmp    edx,esi
 1001a2c:	75 e9                	jne    1001a17 <strtoupper+0x22>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:179
                myPtr[start]-=32;
            start++;
        }

    return pointerToString;
}
 1001a2e:	89 d8                	mov    eax,ebx
 1001a30:	83 c4 04             	add    esp,0x4
 1001a33:	5b                   	pop    ebx
 1001a34:	5e                   	pop    esi
 1001a35:	c3                   	ret    

01001a36 <printDumpedRegs>:
printDumpedRegs():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:182

void printDumpedRegs()
{
 1001a36:	57                   	push   edi
 1001a37:	56                   	push   esi
 1001a38:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:183
    uint32_t esp = exceptionSavedESP;
 1001a39:	8b 35 ec 01 12 00    	mov    esi,DWORD PTR ds:0x1201ec
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:187
    uint8_t* lCSIPPtr;

    
    lCSIPPtr=(uint8_t*)(exceptionEIP);
 1001a3f:	8b 1d f8 01 12 00    	mov    ebx,DWORD PTR ds:0x1201f8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:188
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", exceptionAX, exceptionBX, exceptionCX, exceptionDX,exceptionFlags);
 1001a45:	83 ec 08             	sub    esp,0x8
 1001a48:	ff 35 f0 01 12 00    	push   DWORD PTR ds:0x1201f0
 1001a4e:	ff 35 bc 01 12 00    	push   DWORD PTR ds:0x1201bc
 1001a54:	ff 35 b8 01 12 00    	push   DWORD PTR ds:0x1201b8
 1001a5a:	ff 35 b4 01 12 00    	push   DWORD PTR ds:0x1201b4
 1001a60:	ff 35 b0 01 12 00    	push   DWORD PTR ds:0x1201b0
 1001a66:	68 a0 7d 00 01       	push   0x1007da0
 1001a6b:	e8 b3 0a 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:189
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", exceptionBP, exceptionSI, exceptionDI, exceptionSavedESP);
 1001a70:	83 c4 14             	add    esp,0x14
 1001a73:	ff 35 ec 01 12 00    	push   DWORD PTR ds:0x1201ec
 1001a79:	ff 35 c4 01 12 00    	push   DWORD PTR ds:0x1201c4
 1001a7f:	ff 35 c0 01 12 00    	push   DWORD PTR ds:0x1201c0
 1001a85:	ff 35 c8 01 12 00    	push   DWORD PTR ds:0x1201c8
 1001a8b:	68 d0 7d 00 01       	push   0x1007dd0
 1001a90:	e8 8e 0a 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:190
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
 1001a95:	83 c4 14             	add    esp,0x14
 1001a98:	ff 35 d4 01 12 00    	push   DWORD PTR ds:0x1201d4
 1001a9e:	ff 35 d0 01 12 00    	push   DWORD PTR ds:0x1201d0
 1001aa4:	ff 35 00 02 12 00    	push   DWORD PTR ds:0x120200
 1001aaa:	ff 35 cc 01 12 00    	push   DWORD PTR ds:0x1201cc
 1001ab0:	68 f8 7d 00 01       	push   0x1007df8
 1001ab5:	e8 69 0a 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:191
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionGS, exceptionFS);
 1001aba:	83 c4 14             	add    esp,0x14
 1001abd:	ff 35 e0 01 12 00    	push   DWORD PTR ds:0x1201e0
 1001ac3:	ff 35 e4 01 12 00    	push   DWORD PTR ds:0x1201e4
 1001ac9:	ff 35 dc 01 12 00    	push   DWORD PTR ds:0x1201dc
 1001acf:	ff 35 d8 01 12 00    	push   DWORD PTR ds:0x1201d8
 1001ad5:	68 20 7e 00 01       	push   0x1007e20
 1001ada:	e8 44 0a 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:192
    printk("GDT=%08X\n",gdtp.base);
 1001adf:	83 c4 18             	add    esp,0x18
 1001ae2:	ff 35 4e 04 12 00    	push   DWORD PTR ds:0x12044e
 1001ae8:	68 24 74 00 01       	push   0x1007424
 1001aed:	e8 31 0a 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:193
    printk("CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
 1001af2:	ff 35 f4 01 12 00    	push   DWORD PTR ds:0x1201f4
 1001af8:	ff 35 f8 01 12 00    	push   DWORD PTR ds:0x1201f8
 1001afe:	ff 35 fc 01 12 00    	push   DWORD PTR ds:0x1201fc
 1001b04:	68 48 7e 00 01       	push   0x1007e48
 1001b09:	e8 15 0a 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:194
          printk("Bytes at CS:EIP: ");
 1001b0e:	83 c4 14             	add    esp,0x14
 1001b11:	68 2e 74 00 01       	push   0x100742e
 1001b16:	e8 08 0a 00 00       	call   1002523 <printk>
 1001b1b:	8d 7b 13             	lea    edi,[ebx+0x13]
 1001b1e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:196 (discriminator 3)
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
 1001b21:	83 ec 08             	sub    esp,0x8
 1001b24:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001b27:	50                   	push   eax
 1001b28:	68 c0 73 00 01       	push   0x10073c0
 1001b2d:	e8 f1 09 00 00       	call   1002523 <printk>
 1001b32:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:195 (discriminator 3)
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionGS, exceptionFS);
    printk("GDT=%08X\n",gdtp.base);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
 1001b35:	83 c4 10             	add    esp,0x10
 1001b38:	39 df                	cmp    edi,ebx
 1001b3a:	75 e5                	jne    1001b21 <printDumpedRegs+0xeb>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:197
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
 1001b3c:	83 ec 0c             	sub    esp,0xc
 1001b3f:	68 e7 76 00 01       	push   0x10076e7
 1001b44:	e8 da 09 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:198
          printk ("Stack @ 0x%08x:0x%08X:\n",exceptionSS, esp);
 1001b49:	83 c4 0c             	add    esp,0xc
 1001b4c:	56                   	push   esi
 1001b4d:	ff 35 e8 01 12 00    	push   DWORD PTR ds:0x1201e8
 1001b53:	68 40 74 00 01       	push   0x1007440
 1001b58:	e8 c6 09 00 00       	call   1002523 <printk>
 1001b5d:	83 c4 10             	add    esp,0x10
 1001b60:	bb 00 00 00 00       	mov    ebx,0x0
 1001b65:	8d 04 33             	lea    eax,[ebx+esi*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:201 (discriminator 3)
          for (int cnt=0;cnt<10;cnt++)
          {
              printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
 1001b68:	83 ec 04             	sub    esp,0x4
 1001b6b:	8b 15 a8 01 12 00    	mov    edx,DWORD PTR ds:0x1201a8
 1001b71:	ff 34 1a             	push   DWORD PTR [edx+ebx*1]
 1001b74:	50                   	push   eax
 1001b75:	68 58 74 00 01       	push   0x1007458
 1001b7a:	e8 a4 09 00 00       	call   1002523 <printk>
 1001b7f:	83 c3 04             	add    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:199 (discriminator 3)
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
          printk ("Stack @ 0x%08x:0x%08X:\n",exceptionSS, esp);
          for (int cnt=0;cnt<10;cnt++)
 1001b82:	83 c4 10             	add    esp,0x10
 1001b85:	83 fb 28             	cmp    ebx,0x28
 1001b88:	75 db                	jne    1001b65 <printDumpedRegs+0x12f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:206
              printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
              esp+=4;
          }


}
 1001b8a:	5b                   	pop    ebx
 1001b8b:	5e                   	pop    esi
 1001b8c:	5f                   	pop    edi
 1001b8d:	c3                   	ret    

01001b8e <printDebugRegs>:
printDebugRegs():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:209

void printDebugRegs()
{
 1001b8e:	57                   	push   edi
 1001b8f:	56                   	push   esi
 1001b90:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:210
    uint32_t esp = debugSavedESP;
 1001b91:	8b 35 40 02 12 00    	mov    esi,DWORD PTR ds:0x120240
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:213
    uint8_t* lCSIPPtr;

    lCSIPPtr=(uint8_t*)(debugEIP);
 1001b97:	8b 1d 50 02 12 00    	mov    ebx,DWORD PTR ds:0x120250
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:214
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", debugAX, debugBX, debugCX, debugDX,debugFlags);
 1001b9d:	83 ec 08             	sub    esp,0x8
 1001ba0:	ff 35 44 02 12 00    	push   DWORD PTR ds:0x120244
 1001ba6:	ff 35 10 02 12 00    	push   DWORD PTR ds:0x120210
 1001bac:	ff 35 0c 02 12 00    	push   DWORD PTR ds:0x12020c
 1001bb2:	ff 35 08 02 12 00    	push   DWORD PTR ds:0x120208
 1001bb8:	ff 35 04 02 12 00    	push   DWORD PTR ds:0x120204
 1001bbe:	68 a0 7d 00 01       	push   0x1007da0
 1001bc3:	e8 5b 09 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:215
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", debugBP, debugSI, debugDI, debugSavedESP);
 1001bc8:	83 c4 14             	add    esp,0x14
 1001bcb:	ff 35 40 02 12 00    	push   DWORD PTR ds:0x120240
 1001bd1:	ff 35 18 02 12 00    	push   DWORD PTR ds:0x120218
 1001bd7:	ff 35 14 02 12 00    	push   DWORD PTR ds:0x120214
 1001bdd:	ff 35 1c 02 12 00    	push   DWORD PTR ds:0x12021c
 1001be3:	68 d0 7d 00 01       	push   0x1007dd0
 1001be8:	e8 36 09 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:216
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\n", debugCR0, debugCR3, debugCR4);
 1001bed:	83 c4 20             	add    esp,0x20
 1001bf0:	ff 35 28 02 12 00    	push   DWORD PTR ds:0x120228
 1001bf6:	ff 35 24 02 12 00    	push   DWORD PTR ds:0x120224
 1001bfc:	ff 35 20 02 12 00    	push   DWORD PTR ds:0x120220
 1001c02:	68 6a 74 00 01       	push   0x100746a
 1001c07:	e8 17 09 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:217
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", debugDS, debugES, debugGS, debugFS);
 1001c0c:	83 c4 04             	add    esp,0x4
 1001c0f:	ff 35 34 02 12 00    	push   DWORD PTR ds:0x120234
 1001c15:	ff 35 38 02 12 00    	push   DWORD PTR ds:0x120238
 1001c1b:	ff 35 30 02 12 00    	push   DWORD PTR ds:0x120230
 1001c21:	ff 35 2c 02 12 00    	push   DWORD PTR ds:0x12022c
 1001c27:	68 20 7e 00 01       	push   0x1007e20
 1001c2c:	e8 f2 08 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:218
    printk("CS:EIP = %04X:%08X, error code=%08X\n", debugCS, debugEIP, debugErrorCode);
 1001c31:	83 c4 20             	add    esp,0x20
 1001c34:	ff 35 48 02 12 00    	push   DWORD PTR ds:0x120248
 1001c3a:	ff 35 50 02 12 00    	push   DWORD PTR ds:0x120250
 1001c40:	ff 35 4c 02 12 00    	push   DWORD PTR ds:0x12024c
 1001c46:	68 48 7e 00 01       	push   0x1007e48
 1001c4b:	e8 d3 08 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:219
          printk("Bytes at CS:EIP: ");
 1001c50:	c7 04 24 2e 74 00 01 	mov    DWORD PTR [esp],0x100742e
 1001c57:	e8 c7 08 00 00       	call   1002523 <printk>
 1001c5c:	8d 7b 13             	lea    edi,[ebx+0x13]
 1001c5f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:221 (discriminator 3)
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
 1001c62:	83 ec 08             	sub    esp,0x8
 1001c65:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001c68:	50                   	push   eax
 1001c69:	68 c0 73 00 01       	push   0x10073c0
 1001c6e:	e8 b0 08 00 00       	call   1002523 <printk>
 1001c73:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:220 (discriminator 3)
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", debugBP, debugSI, debugDI, debugSavedESP);
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\n", debugCR0, debugCR3, debugCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", debugDS, debugES, debugGS, debugFS);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", debugCS, debugEIP, debugErrorCode);
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
 1001c76:	83 c4 10             	add    esp,0x10
 1001c79:	39 df                	cmp    edi,ebx
 1001c7b:	75 e5                	jne    1001c62 <printDebugRegs+0xd4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:222
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
 1001c7d:	83 ec 0c             	sub    esp,0xc
 1001c80:	68 e7 76 00 01       	push   0x10076e7
 1001c85:	e8 99 08 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:223
          printk ("Stack @ 0x%08x:0x%08X:\n",debugSS, esp);
 1001c8a:	83 c4 0c             	add    esp,0xc
 1001c8d:	56                   	push   esi
 1001c8e:	ff 35 3c 02 12 00    	push   DWORD PTR ds:0x12023c
 1001c94:	68 40 74 00 01       	push   0x1007440
 1001c99:	e8 85 08 00 00       	call   1002523 <printk>
 1001c9e:	83 c4 10             	add    esp,0x10
 1001ca1:	bb 00 00 00 00       	mov    ebx,0x0
 1001ca6:	8d 04 33             	lea    eax,[ebx+esi*1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:226 (discriminator 3)
          for (int cnt=0;cnt<10;cnt++)
          {
              printk("\t0x%08X%: 0x%08X\n",esp, debugSavedStack[cnt]);
 1001ca9:	83 ec 04             	sub    esp,0x4
 1001cac:	8b 15 ac 01 12 00    	mov    edx,DWORD PTR ds:0x1201ac
 1001cb2:	ff 34 1a             	push   DWORD PTR [edx+ebx*1]
 1001cb5:	50                   	push   eax
 1001cb6:	68 58 74 00 01       	push   0x1007458
 1001cbb:	e8 63 08 00 00       	call   1002523 <printk>
 1001cc0:	83 c3 04             	add    ebx,0x4
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:224 (discriminator 3)
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
          printk ("Stack @ 0x%08x:0x%08X:\n",debugSS, esp);
          for (int cnt=0;cnt<10;cnt++)
 1001cc3:	83 c4 10             	add    esp,0x10
 1001cc6:	83 fb 28             	cmp    ebx,0x28
 1001cc9:	75 db                	jne    1001ca6 <printDebugRegs+0x118>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:231
              printk("\t0x%08X%: 0x%08X\n",esp, debugSavedStack[cnt]);
              esp+=4;
          }


}
 1001ccb:	5b                   	pop    ebx
 1001ccc:	5e                   	pop    esi
 1001ccd:	5f                   	pop    edi
 1001cce:	c3                   	ret    

01001ccf <reboot>:
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:239
/* keyboard interface IO port: data and control
   READ:   status port
   WRITE:  control register */
 
void reboot(bool waitFirst)
{
 1001ccf:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:242
    uint8_t temp;
 
    if (waitFirst)
 1001cd2:	80 7c 24 10 00       	cmp    BYTE PTR [esp+0x10],0x0
 1001cd7:	74 1d                	je     1001cf6 <reboot+0x27>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:244
    {
        puts("Rebooting ... ");
 1001cd9:	83 ec 0c             	sub    esp,0xc
 1001cdc:	68 86 74 00 01       	push   0x1007486
 1001ce1:	e8 03 e7 ff ff       	call   10003e9 <puts>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:245
        __asm__("sti\n");
 1001ce6:	fb                   	sti    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:246
        wait(3000);
 1001ce7:	c7 04 24 b8 0b 00 00 	mov    DWORD PTR [esp],0xbb8
 1001cee:	e8 d9 11 00 00       	call   1002ecc <wait>
 1001cf3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:248
    }
    __asm__ volatile ("cli"); /* disable all interrupts */
 1001cf6:	fa                   	cli    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1001cf7:	e4 64                	in     al,0x64
 1001cf9:	89 c2                	mov    edx,eax
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:254
 
    /* Clear all keyboard buffers (output and command buffers) */
    do
    {
        temp = inb(KBRD_INTRFC); /* empty user data */
        if (check_flag(temp, KBRD_BIT_KDATA) != 0)
 1001cfb:	a8 01                	test   al,0x1
 1001cfd:	74 02                	je     1001d01 <reboot+0x32>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1001cff:	e4 60                	in     al,0x60
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:256
            inb(KBRD_IO); /* empty keyboard data */
    } while (check_flag(temp, KBRD_BIT_UDATA) != 0);
 1001d01:	f6 c2 02             	test   dl,0x2
 1001d04:	75 f1                	jne    1001cf7 <reboot+0x28>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001d06:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 1001d0b:	e6 64                	out    0x64,al
reboot():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:260 (discriminator 1)
 
    outb(KBRD_INTRFC, KBRD_RESET); /* pulse CPU reset line */
loop:
    __asm__ volatile ("hlt"); /* if that didn't work, halt the CPU */
 1001d0d:	f4                   	hlt    
 1001d0e:	eb fd                	jmp    1001d0d <reboot+0x3e>

01001d10 <dumpKernelAddresses>:
dumpKernelAddresses():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:265
    goto loop; /* if a NMI is received, halt again */
}

void dumpKernelAddresses()
{
 1001d10:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:266
printk("Kernel Variable List:\n");
 1001d13:	68 95 74 00 01       	push   0x1007495
 1001d18:	e8 06 08 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:267
printk("\tKERNEL_OBJECT_BASE_ADDRESS=0x%08x\n",KERNEL_OBJECT_BASE_ADDRESS);
 1001d1d:	83 c4 08             	add    esp,0x8
 1001d20:	68 00 00 15 00       	push   0x150000
 1001d25:	68 70 7e 00 01       	push   0x1007e70
 1001d2a:	e8 f4 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:268
printk("\tE820_TABLE_ADDRESS=0x%08x (0x%08X)\n",E820_TABLE_ADDRESS);
 1001d2f:	83 c4 08             	add    esp,0x8
 1001d32:	68 00 00 15 00       	push   0x150000
 1001d37:	68 94 7e 00 01       	push   0x1007e94
 1001d3c:	e8 e2 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:269
printk("\tMP_CONFIG_TABLE_ADDRESS=0x%08x\n",MP_CONFIG_TABLE_ADDRESS);
 1001d41:	83 c4 08             	add    esp,0x8
 1001d44:	68 b0 04 15 00       	push   0x1504b0
 1001d49:	68 bc 7e 00 01       	push   0x1007ebc
 1001d4e:	e8 d0 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:270
printk("\tKEYBOARD_BUFFER_ADDRESS=0x%08x\n",KEYBOARD_BUFFER_ADDRESS);
 1001d53:	83 c4 08             	add    esp,0x8
 1001d56:	68 b0 24 15 00       	push   0x1524b0
 1001d5b:	68 e0 7e 00 01       	push   0x1007ee0
 1001d60:	e8 be 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:271
printk("\tIDT_TABLE_ADDRESS=0x%08x\n",IDT_TABLE_ADDRESS);
 1001d65:	83 c4 08             	add    esp,0x8
 1001d68:	68 00 30 15 00       	push   0x153000
 1001d6d:	68 ac 74 00 01       	push   0x10074ac
 1001d72:	e8 ac 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:272
printk("\tINIT_GDT_TABLE_ADDRESS=0x%08x\n",INIT_GDT_TABLE_ADDRESS);
 1001d77:	83 c4 08             	add    esp,0x8
 1001d7a:	68 00 40 15 00       	push   0x154000
 1001d7f:	68 04 7f 00 01       	push   0x1007f04
 1001d84:	e8 9a 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:273
printk("\tTASK_TABLE_ADDRESS=0x%08x\n",TASK_TABLE_ADDRESS);
 1001d89:	83 c4 08             	add    esp,0x8
 1001d8c:	68 00 70 15 00       	push   0x157000
 1001d91:	68 c7 74 00 01       	push   0x10074c7
 1001d96:	e8 88 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:274
printk("\tTSS_TABLE_ADDRESS=0x%08x\n",TSS_TABLE_ADDRESS);
 1001d9b:	83 c4 08             	add    esp,0x8
 1001d9e:	68 00 10 17 00       	push   0x171000
 1001da3:	68 e3 74 00 01       	push   0x10074e3
 1001da8:	e8 76 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:275
printk("\tATA_MBR_ARRAY_ADDRESS=0x%08x\n",ATA_MBR_ARRAY_ADDRESS);
 1001dad:	83 c4 08             	add    esp,0x8
 1001db0:	68 00 b0 18 00       	push   0x18b000
 1001db5:	68 24 7f 00 01       	push   0x1007f24
 1001dba:	e8 64 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:276
printk("\tPCI_DEVICE_LIST_ADDRESS=0x%08x\n",PCI_DEVICE_LIST_ADDRESS);
 1001dbf:	83 c4 08             	add    esp,0x8
 1001dc2:	68 00 c0 18 00       	push   0x18c000
 1001dc7:	68 44 7f 00 01       	push   0x1007f44
 1001dcc:	e8 52 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:277
printk("\tPCI_BRIDGE_LIST_ADDRESS=0x%08x\n",PCI_BRIDGE_LIST_ADDRESS);
 1001dd1:	83 c4 08             	add    esp,0x8
 1001dd4:	68 00 c0 19 00       	push   0x19c000
 1001dd9:	68 68 7f 00 01       	push   0x1007f68
 1001dde:	e8 40 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:278
printk("\tPCI_FUNCTION_LIST_ADDRESS=0x%08x\n",PCI_FUNCTION_LIST_ADDRESS);
 1001de3:	83 c4 08             	add    esp,0x8
 1001de6:	68 00 c0 1a 00       	push   0x1ac000
 1001deb:	68 8c 7f 00 01       	push   0x1007f8c
 1001df0:	e8 2e 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:279
printk("\tGDT_PMODE_16BIT_TABLE_ADDRESS=0x%08x\n",GDT_PMODE_16BIT_TABLE_ADDRESS);
 1001df5:	83 c4 08             	add    esp,0x8
 1001df8:	68 00 d0 1a 00       	push   0x1ad000
 1001dfd:	68 b0 7f 00 01       	push   0x1007fb0
 1001e02:	e8 1c 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:280
printk("\tKERNEL_PAGE_DIR_ADDRESS=0x%08x\n",KERNEL_PAGE_DIR_ADDRESS);
 1001e07:	83 c4 08             	add    esp,0x8
 1001e0a:	68 00 e0 1a 00       	push   0x1ae000
 1001e0f:	68 d8 7f 00 01       	push   0x1007fd8
 1001e14:	e8 0a 07 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:281
printk("\tKERNEL_PAGE_TABLE_BASE_ADDRESS=0x%08x\n",KERNEL_PAGE_TABLE_BASE_ADDRESS);
 1001e19:	83 c4 08             	add    esp,0x8
 1001e1c:	68 00 00 1c 00       	push   0x1c0000
 1001e21:	68 fc 7f 00 01       	push   0x1007ffc
 1001e26:	e8 f8 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:282
printk("\tSAVED_STACK_FOR_EXCEPTIONS_ADDRESS=0x%08x\n",SAVED_STACK_FOR_EXCEPTIONS_ADDRESS);
 1001e2b:	83 c4 08             	add    esp,0x8
 1001e2e:	68 00 10 5c 00       	push   0x5c1000
 1001e33:	68 24 80 00 01       	push   0x1008024
 1001e38:	e8 e6 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:283
printk("\tSAVED_STACK_FOR_DEBUGGING_ADDRESS=0x%08x\n",SAVED_STACK_FOR_DEBUGGING_ADDRESS);
 1001e3d:	83 c4 08             	add    esp,0x8
 1001e40:	68 00 30 5c 00       	push   0x5c3000
 1001e45:	68 50 80 00 01       	push   0x1008050
 1001e4a:	e8 d4 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:284
printk("\tCPU_APIC_REGISTER_REMAP_BASE_ADDRESS=0x%08x\n",CPU_APIC_REGISTER_REMAP_BASE_ADDRESS);
 1001e4f:	83 c4 08             	add    esp,0x8
 1001e52:	68 00 50 5c 00       	push   0x5c5000
 1001e57:	68 7c 80 00 01       	push   0x100807c
 1001e5c:	e8 c2 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:285
printk("\tCPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS=0x%08x\n",CPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS);
 1001e61:	83 c4 08             	add    esp,0x8
 1001e64:	68 00 60 5c 00       	push   0x5c6000
 1001e69:	68 ac 80 00 01       	push   0x10080ac
 1001e6e:	e8 b0 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:286
printk("\tKERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS=0x%08x\n",KERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS);
 1001e73:	83 c4 08             	add    esp,0x8
 1001e76:	68 04 60 5c 00       	push   0x5c6004
 1001e7b:	68 dc 80 00 01       	push   0x10080dc
 1001e80:	e8 9e 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:287
printk("\tAHCI_ABAR_REMAPPED_ADDRESS=0x%08x\n",AHCI_ABAR_REMAPPED_ADDRESS);
 1001e85:	83 c4 08             	add    esp,0x8
 1001e88:	68 00 70 5c 00       	push   0x5c7000
 1001e8d:	68 10 81 00 01       	push   0x1008110
 1001e92:	e8 8c 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:288
printk("\tAHCI_PORT_BASE_REMAP_ADDRESS=0x%08x\n",AHCI_PORT_BASE_REMAP_ADDRESS);
 1001e97:	83 c4 08             	add    esp,0x8
 1001e9a:	68 00 70 60 00       	push   0x607000
 1001e9f:	68 34 81 00 01       	push   0x1008134
 1001ea4:	e8 7a 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:289
printk("\tAHCI_DISK_BUFFER_ADDRESS=0x%08x\n",AHCI_DISK_BUFFER_ADDRESS);
 1001ea9:	83 c4 08             	add    esp,0x8
 1001eac:	68 00 70 74 00       	push   0x747000
 1001eb1:	68 5c 81 00 01       	push   0x100815c
 1001eb6:	e8 68 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:290
printk("\tATA_DEVICE_INFO_ADDRESS=0x%08x\n",ATA_DEVICE_INFO_ADDRESS);
 1001ebb:	83 c4 08             	add    esp,0x8
 1001ebe:	68 00 70 88 00       	push   0x887000
 1001ec3:	68 80 81 00 01       	push   0x1008180
 1001ec8:	e8 56 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:291
printk("\tAHCI_CAPS_ADDRESS=0x%08x\n",AHCI_CAPS_ADDRESS);
 1001ecd:	83 c4 08             	add    esp,0x8
 1001ed0:	68 20 be 88 00       	push   0x88be20
 1001ed5:	68 fe 74 00 01       	push   0x10074fe
 1001eda:	e8 44 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:292
printk("\tTSS_AVAILABLE_ADDRESS=0x%08x\n",TSS_AVAILABLE_ADDRESS);
 1001edf:	83 c4 08             	add    esp,0x8
 1001ee2:	68 40 0c 89 00       	push   0x890c40
 1001ee7:	68 a4 81 00 01       	push   0x10081a4
 1001eec:	e8 32 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:293
printk("\tGDT_AVAILABLE_ADDRESS=0x%08x\n",GDT_AVAILABLE_ADDRESS);
 1001ef1:	83 c4 08             	add    esp,0x8
 1001ef4:	68 40 0d 89 00       	push   0x890d40
 1001ef9:	68 c4 81 00 01       	push   0x10081c4
 1001efe:	e8 20 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:294
printk("\tEXEC_FILE_LOAD_INFO=0x%08x\n",EXEC_FILE_LOAD_INFO);
 1001f03:	83 c4 08             	add    esp,0x8
 1001f06:	68 40 0f 89 00       	push   0x890f40
 1001f0b:	68 19 75 00 01       	push   0x1007519
 1001f10:	e8 0e 06 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:295
printk("\tAHCI_ABAR_ADDRESS=0x%08x\n",AHCI_ABAR_ADDRESS);
 1001f15:	83 c4 08             	add    esp,0x8
 1001f18:	68 e0 95 8a 00       	push   0x8a95e0
 1001f1d:	68 36 75 00 01       	push   0x1007536
 1001f22:	e8 fc 05 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:296
printk("\tEND_OF_KERNEL_OBJECTS_ADDRESS=0x%08x\n",END_OF_KERNEL_OBJECTS_ADDRESS);
 1001f27:	83 c4 08             	add    esp,0x8
 1001f2a:	68 e0 95 9a 00       	push   0x9a95e0
 1001f2f:	68 e4 81 00 01       	push   0x10081e4
 1001f34:	e8 ea 05 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:297
}
 1001f39:	83 c4 1c             	add    esp,0x1c
 1001f3c:	c3                   	ret    

01001f3d <pauseDisplay>:
pauseDisplay():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:300

bool pauseDisplay(bool offerToQuit)
{
 1001f3d:	56                   	push   esi
 1001f3e:	53                   	push   ebx
 1001f3f:	83 ec 04             	sub    esp,0x4
 1001f42:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:301
    if (offerToQuit)
 1001f46:	84 db                	test   bl,bl
 1001f48:	74 12                	je     1001f5c <pauseDisplay+0x1f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:302
        printk("Press q to quit, any other key to continue ...");
 1001f4a:	83 ec 0c             	sub    esp,0xc
 1001f4d:	68 0c 82 00 01       	push   0x100820c
 1001f52:	e8 cc 05 00 00       	call   1002523 <printk>
 1001f57:	83 c4 10             	add    esp,0x10
 1001f5a:	eb 10                	jmp    1001f6c <pauseDisplay+0x2f>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:304
    else
        printk("Press a key to continue ... ");
 1001f5c:	83 ec 0c             	sub    esp,0xc
 1001f5f:	68 51 75 00 01       	push   0x1007551
 1001f64:	e8 ba 05 00 00       	call   1002523 <printk>
 1001f69:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:305
    char lPressedKey=waitForKeyboardKey();
 1001f6c:	e8 f7 e4 ff ff       	call   1000468 <waitForKeyboardKey>
 1001f71:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:306
    cursorMoveToX(0);
 1001f73:	83 ec 0c             	sub    esp,0xc
 1001f76:	6a 00                	push   0x0
 1001f78:	e8 bd e3 ff ff       	call   100033a <cursorMoveToX>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:307
    printk("                                           ");
 1001f7d:	c7 04 24 3c 82 00 01 	mov    DWORD PTR [esp],0x100823c
 1001f84:	e8 9a 05 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:308
    cursorMoveToX(0);
 1001f89:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
 1001f90:	e8 a5 e3 ff ff       	call   100033a <cursorMoveToX>
 1001f95:	89 f0                	mov    eax,esi
 1001f97:	3c 71                	cmp    al,0x71
 1001f99:	0f 94 c0             	sete   al
 1001f9c:	21 d8                	and    eax,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:312
    if (lPressedKey=='q' && offerToQuit)
        return true;
    return false;
}
 1001f9e:	83 c4 14             	add    esp,0x14
 1001fa1:	5b                   	pop    ebx
 1001fa2:	5e                   	pop    esi
 1001fa3:	c3                   	ret    

01001fa4 <mallocTemp>:
mallocTemp():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:317

int memPtr=0xe00000;
uintptr_t* mallocTemp(int size)
{
    uintptr_t lRetVal = memPtr;
 1001fa4:	a1 00 40 00 01       	mov    eax,ds:0x1004000
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:318
    memPtr+=size;
 1001fa9:	89 c2                	mov    edx,eax
 1001fab:	03 54 24 04          	add    edx,DWORD PTR [esp+0x4]
 1001faf:	89 15 00 40 00 01    	mov    DWORD PTR ds:0x1004000,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/init/utility.c:320
    return (uintptr_t*)lRetVal;
 1001fb5:	c3                   	ret    
 1001fb6:	66 90                	xchg   ax,ax

01001fb8 <memcpy>:
memcpy():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:12
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
void * memcpy(void *dest, const void *src, size_t n)
{
 1001fb8:	57                   	push   edi
 1001fb9:	56                   	push   esi
 1001fba:	53                   	push   ebx
 1001fbb:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 1001fbf:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 1001fc3:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:17
    bool dw,dd;
    
    dd=n%4==0;
    dw=n%2==0;
    if (dd)
 1001fc7:	89 d1                	mov    ecx,edx
 1001fc9:	83 e1 03             	and    ecx,0x3
 1001fcc:	75 4d                	jne    100201b <memcpy+0x63>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:19
    {
        n /=4;
 1001fce:	c1 ea 02             	shr    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:23
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
 1001fd1:	39 c3                	cmp    ebx,eax
 1001fd3:	72 0e                	jb     1001fe3 <memcpy+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 1001fd5:	b9 00 00 00 00       	mov    ecx,0x0
 1001fda:	85 d2                	test   edx,edx
 1001fdc:	75 2e                	jne    100200c <memcpy+0x54>
 1001fde:	e9 b6 00 00 00       	jmp    1002099 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:24
        n /=4;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
 1001fe3:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
 1001fea:	01 fb                	add    ebx,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:25
                t += n;
 1001fec:	01 c7                	add    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:26
                while ( (n)-- > 0)
 1001fee:	85 d2                	test   edx,edx
 1001ff0:	0f 84 a3 00 00 00    	je     1002099 <memcpy+0xe1>
 1001ff6:	f7 da                	neg    edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:27
                        *--t = *--f;
 1001ff8:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
 1001ffc:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
 1002000:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:26
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
 1002003:	39 d1                	cmp    ecx,edx
 1002005:	75 f1                	jne    1001ff8 <memcpy+0x40>
 1002007:	e9 8d 00 00 00       	jmp    1002099 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:30
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
 100200c:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
 100200f:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
 1002012:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 1002015:	39 ca                	cmp    edx,ecx
 1002017:	75 f3                	jne    100200c <memcpy+0x54>
 1002019:	eb 7e                	jmp    1002099 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:33
                        *t++ = *f++;
        return dest;
    }
    else if (dw)
 100201b:	89 d1                	mov    ecx,edx
 100201d:	83 e1 01             	and    ecx,0x1
 1002020:	75 42                	jne    1002064 <memcpy+0xac>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:35
    {
        n /=2;
 1002022:	d1 ea                	shr    edx,1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:39
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
 1002024:	39 c3                	cmp    ebx,eax
 1002026:	72 0b                	jb     1002033 <memcpy+0x7b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 1002028:	b9 00 00 00 00       	mov    ecx,0x0
 100202d:	85 d2                	test   edx,edx
 100202f:	75 24                	jne    1002055 <memcpy+0x9d>
 1002031:	eb 66                	jmp    1002099 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:40
        n /=2;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
 1002033:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
 100203a:	01 fb                	add    ebx,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:41
                t += n;
 100203c:	01 c7                	add    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:42
                while ( (n)-- > 0)
 100203e:	85 d2                	test   edx,edx
 1002040:	74 57                	je     1002099 <memcpy+0xe1>
 1002042:	f7 da                	neg    edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:43
                        *--t = *--f;
 1002044:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
 1002048:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
 100204c:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:42
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
 100204f:	39 ca                	cmp    edx,ecx
 1002051:	75 f1                	jne    1002044 <memcpy+0x8c>
 1002053:	eb 44                	jmp    1002099 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:46
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
 1002055:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
 1002058:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
 100205b:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 100205e:	39 ca                	cmp    edx,ecx
 1002060:	75 f3                	jne    1002055 <memcpy+0x9d>
 1002062:	eb 35                	jmp    1002099 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:54
    else
    {
        const char *f = src;
        char *t = dest;

        if (f < t) {
 1002064:	39 c3                	cmp    ebx,eax
 1002066:	72 0b                	jb     1002073 <memcpy+0xbb>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
 1002068:	be 00 00 00 00       	mov    esi,0x0
 100206d:	85 d2                	test   edx,edx
 100206f:	75 1a                	jne    100208b <memcpy+0xd3>
 1002071:	eb 26                	jmp    1002099 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
 1002073:	8d 4a ff             	lea    ecx,[edx-0x1]
 1002076:	85 d2                	test   edx,edx
 1002078:	74 1f                	je     1002099 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:58
                        *--t = *--f;
 100207a:	0f b6 14 0b          	movzx  edx,BYTE PTR [ebx+ecx*1]
 100207e:	88 14 08             	mov    BYTE PTR [eax+ecx*1],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
 1002081:	83 e9 01             	sub    ecx,0x1
 1002084:	83 f9 ff             	cmp    ecx,0xffffffff
 1002087:	75 f1                	jne    100207a <memcpy+0xc2>
 1002089:	eb 0e                	jmp    1002099 <memcpy+0xe1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:61
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
 100208b:	0f b6 0c 33          	movzx  ecx,BYTE PTR [ebx+esi*1]
 100208f:	88 0c 30             	mov    BYTE PTR [eax+esi*1],cl
 1002092:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
 1002095:	39 f2                	cmp    edx,esi
 1002097:	75 f2                	jne    100208b <memcpy+0xd3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/memcpy.c:64
                        *t++ = *f++;
        return dest;
    }
 1002099:	5b                   	pop    ebx
 100209a:	5e                   	pop    esi
 100209b:	5f                   	pop    edi
 100209c:	c3                   	ret    
 100209d:	66 90                	xchg   ax,ax
 100209f:	90                   	nop

010020a0 <panic>:
panic():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:8
#include <stdarg.h>
#include <time.h>
#include "printf.h"

void __attribute__((noinline))panic(const char *format, ...)
{
 10020a0:	53                   	push   ebx
 10020a1:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:10
    va_list args;
    va_start( args, format );
 10020a4:	8d 5c 24 14          	lea    ebx,[esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:11
    printk("\n>>>panic at instruction prior to address 0x%08X<<<\n", __builtin_return_address(0));
 10020a8:	83 ec 08             	sub    esp,0x8
 10020ab:	ff 74 24 14          	push   DWORD PTR [esp+0x14]
 10020af:	68 68 82 00 01       	push   0x1008268
 10020b4:	e8 6a 04 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:12
    printk("  >>>");
 10020b9:	c7 04 24 6e 75 00 01 	mov    DWORD PTR [esp],0x100756e
 10020c0:	e8 5e 04 00 00       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/panic.c:13
    printk_valist( format,args);
 10020c5:	83 c4 08             	add    esp,0x8
 10020c8:	53                   	push   ebx
 10020c9:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 10020cd:	e8 38 04 00 00       	call   100250a <printk_valist>
 10020d2:	83 c4 10             	add    esp,0x10
 10020d5:	eb fe                	jmp    10020d5 <panic+0x35>
 10020d7:	90                   	nop

010020d8 <printchar>:
printchar():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:43
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
	
	if (str) {
 10020d8:	85 c0                	test   eax,eax
 10020da:	74 08                	je     10020e4 <printchar+0xc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:44
		**str = c;
 10020dc:	8b 08                	mov    ecx,DWORD PTR [eax]
 10020de:	88 11                	mov    BYTE PTR [ecx],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:45
		++(*str);
 10020e0:	83 00 01             	add    DWORD PTR [eax],0x1
 10020e3:	c3                   	ret    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:41
//extern bool pauseDisplay(bool offerToQuit);
extern uint32_t kDebugLevel;
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
 10020e4:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:47
	
	if (str) {
		**str = c;
		++(*str);
	}
	else terminal_putchar((unsigned char)c);
 10020e7:	0f b6 d2             	movzx  edx,dl
 10020ea:	52                   	push   edx
 10020eb:	e8 d5 e0 ff ff       	call   10001c5 <terminal_putchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:48
}
 10020f0:	83 c4 1c             	add    esp,0x1c
 10020f3:	c3                   	ret    

010020f4 <prints>:
prints():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:54

#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
 10020f4:	55                   	push   ebp
 10020f5:	57                   	push   edi
 10020f6:	56                   	push   esi
 10020f7:	53                   	push   ebx
 10020f8:	83 ec 1c             	sub    esp,0x1c
 10020fb:	89 c7                	mov    edi,eax
 10020fd:	89 d6                	mov    esi,edx
 10020ff:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
 1002103:	8b 54 24 30          	mov    edx,DWORD PTR [esp+0x30]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:57
	register int pc = 0, padchar = ' ';

	if (width > 0) {
 1002107:	85 c9                	test   ecx,ecx
 1002109:	0f 8e cb 00 00 00    	jle    10021da <prints+0xe6>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60 (discriminator 1)
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
 100210f:	80 3e 00             	cmp    BYTE PTR [esi],0x0
 1002112:	74 1b                	je     100212f <prints+0x3b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60
 1002114:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60 (discriminator 3)
 1002119:	83 c0 01             	add    eax,0x1
 100211c:	80 3c 06 00          	cmp    BYTE PTR [esi+eax*1],0x0
 1002120:	75 f7                	jne    1002119 <prints+0x25>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:61
		if (len >= width) width = 0;
 1002122:	bb 00 00 00 00       	mov    ebx,0x0
 1002127:	39 44 24 0c          	cmp    DWORD PTR [esp+0xc],eax
 100212b:	7e 0f                	jle    100213c <prints+0x48>
 100212d:	eb 05                	jmp    1002134 <prints+0x40>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:60
	register int pc = 0, padchar = ' ';

	if (width > 0) {
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
 100212f:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:62
		if (len >= width) width = 0;
		else width -= len;
 1002134:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 1002138:	29 c1                	sub    ecx,eax
 100213a:	89 cb                	mov    ebx,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:63
		if (pad & PAD_ZERO) padchar = '0';
 100213c:	89 d0                	mov    eax,edx
 100213e:	83 e0 02             	and    eax,0x2
 1002141:	83 f8 01             	cmp    eax,0x1
 1002144:	19 ed                	sbb    ebp,ebp
 1002146:	83 e5 f0             	and    ebp,0xfffffff0
 1002149:	83 c5 30             	add    ebp,0x30
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:65
	}
	if (!(pad & PAD_RIGHT)) {
 100214c:	f6 c2 01             	test   dl,0x1
 100214f:	75 1a                	jne    100216b <prints+0x77>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66 (discriminator 1)
		for ( ; width > 0; --width) {
 1002151:	85 db                	test   ebx,ebx
 1002153:	7e 67                	jle    10021bc <prints+0xc8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66
 1002155:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:67 (discriminator 2)
			printchar (out, padchar);
 1002159:	89 ea                	mov    edx,ebp
 100215b:	89 f8                	mov    eax,edi
 100215d:	e8 76 ff ff ff       	call   10020d8 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66 (discriminator 2)
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
 1002162:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
 1002167:	75 f0                	jne    1002159 <prints+0x65>
 1002169:	eb 66                	jmp    10021d1 <prints+0xdd>
 100216b:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 1)
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 100216f:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 1002172:	84 d2                	test   dl,dl
 1002174:	74 1e                	je     1002194 <prints+0xa0>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 1002176:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 100217b:	29 de                	sub    esi,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:72 (discriminator 2)
		printchar (out, *string);
 100217d:	0f be d2             	movsx  edx,dl
 1002180:	89 f8                	mov    eax,edi
 1002182:	e8 51 ff ff ff       	call   10020d8 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:73 (discriminator 2)
		++pc;
 1002187:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 100218a:	0f b6 14 1e          	movzx  edx,BYTE PTR [esi+ebx*1]
 100218e:	84 d2                	test   dl,dl
 1002190:	75 eb                	jne    100217d <prints+0x89>
 1002192:	eb 05                	jmp    1002199 <prints+0xa5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 1002194:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:75 (discriminator 1)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
 1002199:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 100219d:	85 c0                	test   eax,eax
 100219f:	7e 45                	jle    10021e6 <prints+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:75
 10021a1:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:76 (discriminator 2)
		printchar (out, padchar);
 10021a3:	89 ea                	mov    edx,ebp
 10021a5:	89 f8                	mov    eax,edi
 10021a7:	e8 2c ff ff ff       	call   10020d8 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:75 (discriminator 2)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
 10021ac:	83 ee 01             	sub    esi,0x1
 10021af:	75 f2                	jne    10021a3 <prints+0xaf>
 10021b1:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10021b5:	8d 04 03             	lea    eax,[ebx+eax*1]
 10021b8:	89 c3                	mov    ebx,eax
 10021ba:	eb 2a                	jmp    10021e6 <prints+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:66
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
 10021bc:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
 10021c0:	bb 00 00 00 00       	mov    ebx,0x0
 10021c5:	eb 0a                	jmp    10021d1 <prints+0xdd>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 10021c7:	bd 20 00 00 00       	mov    ebp,0x20
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
 10021cc:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:71
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 10021d1:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 10021d4:	84 d2                	test   dl,dl
 10021d6:	75 a3                	jne    100217b <prints+0x87>
 10021d8:	eb 0c                	jmp    10021e6 <prints+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
 10021da:	f6 c2 01             	test   dl,0x1
 10021dd:	74 e8                	je     10021c7 <prints+0xd3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 10021df:	bd 20 00 00 00       	mov    ebp,0x20
 10021e4:	eb 89                	jmp    100216f <prints+0x7b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:81
		printchar (out, padchar);
		++pc;
	}

	return pc;
}
 10021e6:	89 d8                	mov    eax,ebx
 10021e8:	83 c4 1c             	add    esp,0x1c
 10021eb:	5b                   	pop    ebx
 10021ec:	5e                   	pop    esi
 10021ed:	5f                   	pop    edi
 10021ee:	5d                   	pop    ebp
 10021ef:	c3                   	ret    

010021f0 <printi>:
printi():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:87

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
 10021f0:	55                   	push   ebp
 10021f1:	57                   	push   edi
 10021f2:	56                   	push   esi
 10021f3:	53                   	push   ebx
 10021f4:	83 ec 2c             	sub    esp,0x2c
 10021f7:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:93
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;

	if (i == 0) {
 10021fb:	85 d2                	test   edx,edx
 10021fd:	75 2a                	jne    1002229 <printi+0x39>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:94
		print_buf[0] = '0';
 10021ff:	c6 44 24 14 30       	mov    BYTE PTR [esp+0x14],0x30
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:95
		print_buf[1] = '\0';
 1002204:	c6 44 24 15 00       	mov    BYTE PTR [esp+0x15],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:96
		return prints (out, print_buf, width, pad);
 1002209:	83 ec 0c             	sub    esp,0xc
 100220c:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 1002210:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
 1002214:	8d 54 24 24          	lea    edx,[esp+0x24]
 1002218:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 100221c:	e8 d3 fe ff ff       	call   10020f4 <prints>
 1002221:	83 c4 10             	add    esp,0x10
 1002224:	e9 f1 00 00 00       	jmp    100231a <printi+0x12a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:99
	}

	if (sg && b == 10 && i < 0) {
 1002229:	83 7c 24 40 00       	cmp    DWORD PTR [esp+0x40],0x0
 100222e:	0f 95 c3             	setne  bl
 1002231:	83 f9 0a             	cmp    ecx,0xa
 1002234:	0f 94 c0             	sete   al
 1002237:	84 c3                	test   bl,al
 1002239:	0f 84 c1 00 00 00    	je     1002300 <printi+0x110>
 100223f:	89 d0                	mov    eax,edx
 1002241:	c1 e8 1f             	shr    eax,0x1f
 1002244:	84 c0                	test   al,al
 1002246:	0f 84 b4 00 00 00    	je     1002300 <printi+0x110>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
 100224c:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
 1002251:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:107
	*s = '\0';

	while (u) {
 1002255:	89 d3                	mov    ebx,edx
 1002257:	f7 db                	neg    ebx
 1002259:	74 54                	je     10022af <printi+0xbf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:100
		print_buf[1] = '\0';
		return prints (out, print_buf, width, pad);
	}

	if (sg && b == 10 && i < 0) {
		neg = 1;
 100225b:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
 1002262:	00 
 1002263:	eb 08                	jmp    100226d <printi+0x7d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 1002265:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 100226c:	00 
 100226d:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
 1002271:	89 cf                	mov    edi,ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
 1002273:	8b 44 24 4c          	mov    eax,DWORD PTR [esp+0x4c]
 1002277:	8d 68 c6             	lea    ebp,[eax-0x3a]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
 100227a:	89 d8                	mov    eax,ebx
 100227c:	ba 00 00 00 00       	mov    edx,0x0
 1002281:	f7 f1                	div    ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
 1002283:	8d 04 2a             	lea    eax,[edx+ebp*1]
 1002286:	83 fa 0a             	cmp    edx,0xa
 1002289:	0f 4c c2             	cmovl  eax,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:111
		*--s = t + '0';
 100228c:	83 ee 01             	sub    esi,0x1
 100228f:	83 c0 30             	add    eax,0x30
 1002292:	88 06                	mov    BYTE PTR [esi],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:112
		u /= b;
 1002294:	89 d8                	mov    eax,ebx
 1002296:	ba 00 00 00 00       	mov    edx,0x0
 100229b:	f7 f7                	div    edi
 100229d:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:107
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
 100229f:	85 c0                	test   eax,eax
 10022a1:	75 d7                	jne    100227a <printi+0x8a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 10022a3:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:115
			t += letbase - '0' - 10;
		*--s = t + '0';
		u /= b;
	}

	if (neg) {
 10022a8:	83 7c 24 0c 00       	cmp    DWORD PTR [esp+0xc],0x0
 10022ad:	74 34                	je     10022e3 <printi+0xf3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:116
		if( width && (pad & PAD_ZERO) ) {
 10022af:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
 10022b4:	74 21                	je     10022d7 <printi+0xe7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:116 (discriminator 1)
 10022b6:	f6 44 24 48 02       	test   BYTE PTR [esp+0x48],0x2
 10022bb:	74 1a                	je     10022d7 <printi+0xe7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:117
			printchar (out, '-');
 10022bd:	ba 2d 00 00 00       	mov    edx,0x2d
 10022c2:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10022c6:	e8 0d fe ff ff       	call   10020d8 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:119
			++pc;
			--width;
 10022cb:	83 6c 24 44 01       	sub    DWORD PTR [esp+0x44],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:118
	}

	if (neg) {
		if( width && (pad & PAD_ZERO) ) {
			printchar (out, '-');
			++pc;
 10022d0:	bb 01 00 00 00       	mov    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:119
			--width;
 10022d5:	eb 0c                	jmp    10022e3 <printi+0xf3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:122
		}
		else {
			*--s = '-';
 10022d7:	c6 46 ff 2d          	mov    BYTE PTR [esi-0x1],0x2d
 10022db:	8d 76 ff             	lea    esi,[esi-0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 10022de:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:126
		else {
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
 10022e3:	83 ec 0c             	sub    esp,0xc
 10022e6:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 10022ea:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
 10022ee:	89 f2                	mov    edx,esi
 10022f0:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 10022f4:	e8 fb fd ff ff       	call   10020f4 <prints>
 10022f9:	01 d8                	add    eax,ebx
 10022fb:	83 c4 10             	add    esp,0x10
 10022fe:	eb 1a                	jmp    100231a <printi+0x12a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:91
static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;
 1002300:	89 d3                	mov    ebx,edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
 1002302:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:107

	while (u) {
 1002307:	85 d2                	test   edx,edx
 1002309:	0f 85 56 ff ff ff    	jne    1002265 <printi+0x75>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 100230f:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
 1002314:	8d 74 24 1f          	lea    esi,[esp+0x1f]
 1002318:	eb c9                	jmp    10022e3 <printi+0xf3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:127
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
}
 100231a:	83 c4 2c             	add    esp,0x2c
 100231d:	5b                   	pop    ebx
 100231e:	5e                   	pop    esi
 100231f:	5f                   	pop    edi
 1002320:	5d                   	pop    ebp
 1002321:	c3                   	ret    

01002322 <print>:
print():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:130

static int print(char **out, const char *format, va_list args )
{
 1002322:	55                   	push   ebp
 1002323:	57                   	push   edi
 1002324:	56                   	push   esi
 1002325:	53                   	push   ebx
 1002326:	83 ec 2c             	sub    esp,0x2c
 1002329:	89 c7                	mov    edi,eax
 100232b:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:135
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
 100232f:	0f b6 02             	movzx  eax,BYTE PTR [edx]
 1002332:	84 c0                	test   al,al
 1002334:	0f 84 b8 01 00 00    	je     10024f2 <print+0x1d0>
 100233a:	89 d5                	mov    ebp,edx
 100233c:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:136
		if (*format == '%') {
 1002341:	3c 25                	cmp    al,0x25
 1002343:	0f 85 88 01 00 00    	jne    10024d1 <print+0x1af>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:137
			++format;
 1002349:	8d 5d 01             	lea    ebx,[ebp+0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:139
			width = pad = 0;
			if (*format == '\0') break;
 100234c:	0f b6 55 01          	movzx  edx,BYTE PTR [ebp+0x1]
 1002350:	84 d2                	test   dl,dl
 1002352:	0f 84 9f 01 00 00    	je     10024f7 <print+0x1d5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:140
			if (*format == '%') goto out;
 1002358:	80 fa 25             	cmp    dl,0x25
 100235b:	0f 84 6e 01 00 00    	je     10024cf <print+0x1ad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:138
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
			width = pad = 0;
 1002361:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:141
			if (*format == '\0') break;
			if (*format == '%') goto out;
			if (*format == '-') {
 1002366:	80 fa 2d             	cmp    dl,0x2d
 1002369:	75 08                	jne    1002373 <print+0x51>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:142
				++format;
 100236b:	8d 5d 02             	lea    ebx,[ebp+0x2]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:143
				pad = PAD_RIGHT;
 100236e:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:145
			}
			while (*format == '0') {
 1002373:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
 1002376:	75 0b                	jne    1002383 <print+0x61>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:146
				++format;
 1002378:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:147
				pad |= PAD_ZERO;
 100237b:	83 c8 02             	or     eax,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:145
			if (*format == '%') goto out;
			if (*format == '-') {
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0') {
 100237e:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
 1002381:	74 f5                	je     1002378 <print+0x56>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149 (discriminator 1)
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
 1002383:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
 1002386:	8d 4a d0             	lea    ecx,[edx-0x30]
 1002389:	80 f9 09             	cmp    cl,0x9
 100238c:	77 22                	ja     10023b0 <print+0x8e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149
 100238e:	b9 00 00 00 00       	mov    ecx,0x0
 1002393:	89 c5                	mov    ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:150 (discriminator 2)
				width *= 10;
 1002395:	8d 04 89             	lea    eax,[ecx+ecx*4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:151 (discriminator 2)
				width += *format - '0';
 1002398:	0f be d2             	movsx  edx,dl
 100239b:	8d 4c 42 d0          	lea    ecx,[edx+eax*2-0x30]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149 (discriminator 2)
			}
			while (*format == '0') {
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
 100239f:	83 c3 01             	add    ebx,0x1
 10023a2:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
 10023a5:	8d 42 d0             	lea    eax,[edx-0x30]
 10023a8:	3c 09                	cmp    al,0x9
 10023aa:	76 e9                	jbe    1002395 <print+0x73>
 10023ac:	89 e8                	mov    eax,ebp
 10023ae:	eb 05                	jmp    10023b5 <print+0x93>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:149
 10023b0:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:153
				width *= 10;
				width += *format - '0';
			}
			if( *format == 's' ) {
 10023b5:	80 fa 73             	cmp    dl,0x73
 10023b8:	75 2c                	jne    10023e6 <print+0xc4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:154
				register char *s = (char *)va_arg( args, int );
 10023ba:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 10023be:	8d 6a 04             	lea    ebp,[edx+0x4]
 10023c1:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 10023c5:	8b 12                	mov    edx,DWORD PTR [edx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:155
				pc += prints (out, s?s:"(null)", width, pad);
 10023c7:	85 d2                	test   edx,edx
 10023c9:	bd 74 75 00 01       	mov    ebp,0x1007574
 10023ce:	0f 44 d5             	cmove  edx,ebp
 10023d1:	83 ec 0c             	sub    esp,0xc
 10023d4:	50                   	push   eax
 10023d5:	89 f8                	mov    eax,edi
 10023d7:	e8 18 fd ff ff       	call   10020f4 <prints>
 10023dc:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:156
				continue;
 10023de:	83 c4 10             	add    esp,0x10
 10023e1:	e9 fb 00 00 00       	jmp    10024e1 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:158
			}
			if( *format == 'd' ) {
 10023e6:	80 fa 64             	cmp    dl,0x64
 10023e9:	75 29                	jne    1002414 <print+0xf2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:159
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
 10023eb:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 10023ef:	8d 6a 04             	lea    ebp,[edx+0x4]
 10023f2:	6a 61                	push   0x61
 10023f4:	50                   	push   eax
 10023f5:	51                   	push   ecx
 10023f6:	6a 01                	push   0x1
 10023f8:	b9 0a 00 00 00       	mov    ecx,0xa
 10023fd:	8b 12                	mov    edx,DWORD PTR [edx]
 10023ff:	89 f8                	mov    eax,edi
 1002401:	e8 ea fd ff ff       	call   10021f0 <printi>
 1002406:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:160
				continue;
 1002408:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:159
				register char *s = (char *)va_arg( args, int );
				pc += prints (out, s?s:"(null)", width, pad);
				continue;
			}
			if( *format == 'd' ) {
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
 100240b:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:160
				continue;
 100240f:	e9 cd 00 00 00       	jmp    10024e1 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:162
			}
			if( *format == 'x' ) {
 1002414:	80 fa 78             	cmp    dl,0x78
 1002417:	75 2b                	jne    1002444 <print+0x122>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:163
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
 1002419:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 100241d:	89 ea                	mov    edx,ebp
 100241f:	83 c5 04             	add    ebp,0x4
 1002422:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 1002426:	6a 61                	push   0x61
 1002428:	50                   	push   eax
 1002429:	51                   	push   ecx
 100242a:	6a 00                	push   0x0
 100242c:	b9 10 00 00 00       	mov    ecx,0x10
 1002431:	8b 12                	mov    edx,DWORD PTR [edx]
 1002433:	89 f8                	mov    eax,edi
 1002435:	e8 b6 fd ff ff       	call   10021f0 <printi>
 100243a:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:164
				continue;
 100243c:	83 c4 10             	add    esp,0x10
 100243f:	e9 9d 00 00 00       	jmp    10024e1 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:166
			}
			if( *format == 'X' ) {
 1002444:	80 fa 58             	cmp    dl,0x58
 1002447:	75 26                	jne    100246f <print+0x14d>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:167
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
 1002449:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 100244d:	8d 6a 04             	lea    ebp,[edx+0x4]
 1002450:	6a 41                	push   0x41
 1002452:	50                   	push   eax
 1002453:	51                   	push   ecx
 1002454:	6a 00                	push   0x0
 1002456:	b9 10 00 00 00       	mov    ecx,0x10
 100245b:	8b 12                	mov    edx,DWORD PTR [edx]
 100245d:	89 f8                	mov    eax,edi
 100245f:	e8 8c fd ff ff       	call   10021f0 <printi>
 1002464:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:168
				continue;
 1002466:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:167
			if( *format == 'x' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
				continue;
			}
			if( *format == 'X' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
 1002469:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:168
				continue;
 100246d:	eb 72                	jmp    10024e1 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:170
			}
			if( *format == 'u' ) {
 100246f:	80 fa 75             	cmp    dl,0x75
 1002472:	75 28                	jne    100249c <print+0x17a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:171
				pc += printi (out, va_arg( args, int ), 10, 0, width, pad, 'a');
 1002474:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 1002478:	89 ea                	mov    edx,ebp
 100247a:	83 c5 04             	add    ebp,0x4
 100247d:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 1002481:	6a 61                	push   0x61
 1002483:	50                   	push   eax
 1002484:	51                   	push   ecx
 1002485:	6a 00                	push   0x0
 1002487:	b9 0a 00 00 00       	mov    ecx,0xa
 100248c:	8b 12                	mov    edx,DWORD PTR [edx]
 100248e:	89 f8                	mov    eax,edi
 1002490:	e8 5b fd ff ff       	call   10021f0 <printi>
 1002495:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:172
				continue;
 1002497:	83 c4 10             	add    esp,0x10
 100249a:	eb 45                	jmp    10024e1 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:174
			}
			if( *format == 'c' ) {
 100249c:	80 fa 63             	cmp    dl,0x63
 100249f:	75 40                	jne    10024e1 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:176
				/* char are converted to int then pushed on the stack */
				scr[0] = (char)va_arg( args, int );
 10024a1:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 10024a5:	89 ea                	mov    edx,ebp
 10024a7:	83 c5 04             	add    ebp,0x4
 10024aa:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 10024ae:	8b 12                	mov    edx,DWORD PTR [edx]
 10024b0:	88 54 24 1e          	mov    BYTE PTR [esp+0x1e],dl
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:177
				scr[1] = '\0';
 10024b4:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:178
				pc += prints (out, scr, width, pad);
 10024b9:	83 ec 0c             	sub    esp,0xc
 10024bc:	50                   	push   eax
 10024bd:	8d 54 24 2e          	lea    edx,[esp+0x2e]
 10024c1:	89 f8                	mov    eax,edi
 10024c3:	e8 2c fc ff ff       	call   10020f4 <prints>
 10024c8:	01 c6                	add    esi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:179
				continue;
 10024ca:	83 c4 10             	add    esp,0x10
 10024cd:	eb 12                	jmp    10024e1 <print+0x1bf>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:137
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
 10024cf:	89 dd                	mov    ebp,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:184
				continue;
			}
		}
		else {
		out:
			printchar (out, *format);
 10024d1:	0f be 55 00          	movsx  edx,BYTE PTR [ebp+0x0]
 10024d5:	89 f8                	mov    eax,edi
 10024d7:	e8 fc fb ff ff       	call   10020d8 <printchar>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:185
			++pc;
 10024dc:	83 c6 01             	add    esi,0x1
 10024df:	89 eb                	mov    ebx,ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:135
{
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
 10024e1:	8d 6b 01             	lea    ebp,[ebx+0x1]
 10024e4:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
 10024e8:	84 c0                	test   al,al
 10024ea:	0f 85 51 fe ff ff    	jne    1002341 <print+0x1f>
 10024f0:	eb 05                	jmp    10024f7 <print+0x1d5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:132
}

static int print(char **out, const char *format, va_list args )
{
	register int width, pad;
	register int pc = 0;
 10024f2:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:188
		out:
			printchar (out, *format);
			++pc;
		}
	}
	if (out) **out = '\0';
 10024f7:	85 ff                	test   edi,edi
 10024f9:	74 05                	je     1002500 <print+0x1de>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:188 (discriminator 1)
 10024fb:	8b 07                	mov    eax,DWORD PTR [edi]
 10024fd:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:191
	va_end( args );
	return pc;
}
 1002500:	89 f0                	mov    eax,esi
 1002502:	83 c4 2c             	add    esp,0x2c
 1002505:	5b                   	pop    ebx
 1002506:	5e                   	pop    esi
 1002507:	5f                   	pop    edi
 1002508:	5d                   	pop    ebp
 1002509:	c3                   	ret    

0100250a <printk_valist>:
printk_valist():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:194

int printk_valist(const char *format, va_list args)
{
 100250a:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:195
    return print(0, format, args);
 100250d:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
 1002511:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 1002515:	b8 00 00 00 00       	mov    eax,0x0
 100251a:	e8 03 fe ff ff       	call   1002322 <print>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:196
}
 100251f:	83 c4 0c             	add    esp,0xc
 1002522:	c3                   	ret    

01002523 <printk>:
printk():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:199

int printk(const char *format, ...)
{
 1002523:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:201
        va_list args;
        va_start( args, format );
 1002526:	8d 44 24 14          	lea    eax,[esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:202
        return printk_valist(format, args);
 100252a:	83 ec 08             	sub    esp,0x8
 100252d:	50                   	push   eax
 100252e:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1002532:	e8 d3 ff ff ff       	call   100250a <printk_valist>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:203
}
 1002537:	83 c4 1c             	add    esp,0x1c
 100253a:	c3                   	ret    

0100253b <printd>:
printd():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:209

#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
 100253b:	83 ec 0c             	sub    esp,0xc
 100253e:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:210
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
 1002542:	89 d1                	mov    ecx,edx
 1002544:	23 0d 38 03 12 00    	and    ecx,DWORD PTR ds:0x120338
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:222
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
    }
    return 0;
 100254a:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:210
#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
 100254f:	39 ca                	cmp    edx,ecx
 1002551:	75 14                	jne    1002567 <printd+0x2c>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:214
    {
        va_list args;

        va_start( args, format );
 1002553:	8d 44 24 18          	lea    eax,[esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:220
//        if (++printDLineCount==SYS_VGA_HEIGHT-1)
//        {
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
 1002557:	83 ec 08             	sub    esp,0x8
 100255a:	50                   	push   eax
 100255b:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 100255f:	e8 a6 ff ff ff       	call   100250a <printk_valist>
 1002564:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:223 (discriminator 1)
    }
    return 0;
}
 1002567:	83 c4 0c             	add    esp,0xc
 100256a:	c3                   	ret    

0100256b <sprintf>:
sprintf():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:227
#endif

int sprintf(char *out, const char *format, ...)
{
 100256b:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:231
        va_list args;
        
        va_start( args, format );
        return print( &out, format, args );
 100256e:	8d 4c 24 18          	lea    ecx,[esp+0x18]
 1002572:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
 1002576:	8d 44 24 10          	lea    eax,[esp+0x10]
 100257a:	e8 a3 fd ff ff       	call   1002322 <print>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/printf.c:232
}
 100257f:	83 c4 0c             	add    esp,0xc
 1002582:	c3                   	ret    
 1002583:	90                   	nop

01002584 <strcpy>:
strcpy():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:5
#include "strings.h"

char *
strcpy(char *s1, const char *s2)
{
 1002584:	53                   	push   ebx
 1002585:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1002589:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:6
    char *s = s1;
 100258d:	89 c2                	mov    edx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:7 (discriminator 1)
    while ((*s++ = *s2++) != 0)
 100258f:	83 c2 01             	add    edx,0x1
 1002592:	83 c1 01             	add    ecx,0x1
 1002595:	0f b6 59 ff          	movzx  ebx,BYTE PTR [ecx-0x1]
 1002599:	88 5a ff             	mov    BYTE PTR [edx-0x1],bl
 100259c:	84 db                	test   bl,bl
 100259e:	75 ef                	jne    100258f <strcpy+0xb>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:10
	;
    return (s1);
}
 10025a0:	5b                   	pop    ebx
 10025a1:	c3                   	ret    

010025a2 <strcpyc>:
strcpyc():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:14

char *
strcpyc(char *s1, const char *s2, unsigned count)
{
 10025a2:	56                   	push   esi
 10025a3:	53                   	push   ebx
 10025a4:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10025a8:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16
    char *s = s1;
    while ((*s++ = *s2++) != 0 && count-->0)
 10025ac:	ba 00 00 00 00       	mov    edx,0x0
 10025b1:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 10025b5:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16 (discriminator 2)
 10025b8:	0f b6 0c 16          	movzx  ecx,BYTE PTR [esi+edx*1]
 10025bc:	88 0c 10             	mov    BYTE PTR [eax+edx*1],cl
 10025bf:	84 c9                	test   cl,cl
 10025c1:	74 07                	je     10025ca <strcpyc+0x28>
 10025c3:	83 c2 01             	add    edx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16 (discriminator 1)
 10025c6:	39 d3                	cmp    ebx,edx
 10025c8:	75 ee                	jne    10025b8 <strcpyc+0x16>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strcpy.c:19
	;
    return (s1);
}
 10025ca:	5b                   	pop    ebx
 10025cb:	5e                   	pop    esi
 10025cc:	c3                   	ret    
 10025cd:	66 90                	xchg   ax,ax
 10025cf:	90                   	nop

010025d0 <strlen>:
strlen():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:3
#include <stddef.h>

size_t strlen(const char* str) {
 10025d0:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:5
          size_t ret = 0;
        while ( str[ret] != 0 )
 10025d4:	80 3a 00             	cmp    BYTE PTR [edx],0x0
 10025d7:	74 10                	je     10025e9 <strlen+0x19>
 10025d9:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:6
                ret++;
 10025de:	83 c0 01             	add    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:5
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
 10025e1:	80 3c 02 00          	cmp    BYTE PTR [edx+eax*1],0x0
 10025e5:	75 f7                	jne    10025de <strlen+0xe>
 10025e7:	f3 c3                	repz ret 
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:4
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
 10025e9:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strlen.c:8
        while ( str[ret] != 0 )
                ret++;
        return ret;
}
 10025ee:	c3                   	ret    
 10025ef:	90                   	nop

010025f0 <strncmp>:
strncmp():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:13
 *   array pointed to by `s2'.  [4.11.4.4]
 */
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
 10025f0:	57                   	push   edi
 10025f1:	56                   	push   esi
 10025f2:	53                   	push   ebx
 10025f3:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 10025f7:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
 10025fb:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:14
    for ( ; n > 0; s1++, s2++, --n)
 10025ff:	85 db                	test   ebx,ebx
 1002601:	74 41                	je     1002644 <strncmp+0x54>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:15
	if (*s1 != *s2)
 1002603:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 1002606:	0f b6 0f             	movzx  ecx,BYTE PTR [edi]
 1002609:	38 ca                	cmp    dl,cl
 100260b:	75 1c                	jne    1002629 <strncmp+0x39>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:17
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
 100260d:	84 d2                	test   dl,dl
 100260f:	74 3a                	je     100264b <strncmp+0x5b>
 1002611:	83 eb 01             	sub    ebx,0x1
 1002614:	b8 00 00 00 00       	mov    eax,0x0
 1002619:	eb 1e                	jmp    1002639 <strncmp+0x49>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:15
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
	if (*s1 != *s2)
 100261b:	0f b6 54 06 01       	movzx  edx,BYTE PTR [esi+eax*1+0x1]
 1002620:	0f b6 4c 07 01       	movzx  ecx,BYTE PTR [edi+eax*1+0x1]
 1002625:	38 ca                	cmp    dl,cl
 1002627:	74 09                	je     1002632 <strncmp+0x42>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:16
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
 1002629:	38 ca                	cmp    dl,cl
 100262b:	19 c0                	sbb    eax,eax
 100262d:	83 c8 01             	or     eax,0x1
 1002630:	eb 25                	jmp    1002657 <strncmp+0x67>
 1002632:	83 c0 01             	add    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:17
	else if (*s1 == '\0')
 1002635:	84 d2                	test   dl,dl
 1002637:	74 19                	je     1002652 <strncmp+0x62>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:14
 */
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
 1002639:	39 d8                	cmp    eax,ebx
 100263b:	75 de                	jne    100261b <strncmp+0x2b>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:19
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
    return 0;
 100263d:	b8 00 00 00 00       	mov    eax,0x0
 1002642:	eb 13                	jmp    1002657 <strncmp+0x67>
 1002644:	b8 00 00 00 00       	mov    eax,0x0
 1002649:	eb 0c                	jmp    1002657 <strncmp+0x67>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:18
{
    for ( ; n > 0; s1++, s2++, --n)
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
 100264b:	b8 00 00 00 00       	mov    eax,0x0
 1002650:	eb 05                	jmp    1002657 <strncmp+0x67>
 1002652:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncmp.c:20
    return 0;
}
 1002657:	5b                   	pop    ebx
 1002658:	5e                   	pop    esi
 1002659:	5f                   	pop    edi
 100265a:	c3                   	ret    
 100265b:	90                   	nop

0100265c <strncpy>:
strncpy():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:14
 *   The `strncpy' function returns the value of `s1'.  [4.11.2.4]
 */
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
 100265c:	56                   	push   esi
 100265d:	53                   	push   ebx
 100265e:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
 1002662:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1002666:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
 100266a:	85 c9                	test   ecx,ecx
 100266c:	74 33                	je     10026a1 <strncpy+0x45>
 100266e:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1002671:	84 c0                	test   al,al
 1002673:	74 26                	je     100269b <strncpy+0x3f>
 1002675:	89 f2                	mov    edx,esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:17
	*s++ = *s2++;
 1002677:	83 c2 01             	add    edx,0x1
 100267a:	83 c3 01             	add    ebx,0x1
 100267d:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
 1002680:	83 e9 01             	sub    ecx,0x1
 1002683:	74 1c                	je     10026a1 <strncpy+0x45>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16 (discriminator 1)
 1002685:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1002688:	84 c0                	test   al,al
 100268a:	75 eb                	jne    1002677 <strncpy+0x1b>
 100268c:	eb 0f                	jmp    100269d <strncpy+0x41>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:21
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
	*s++ = '\0';
 100268e:	83 c2 01             	add    edx,0x1
 1002691:	c6 42 ff 00          	mov    BYTE PTR [edx-0x1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:20
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
 1002695:	39 d1                	cmp    ecx,edx
 1002697:	75 f5                	jne    100268e <strncpy+0x32>
 1002699:	eb 06                	jmp    10026a1 <strncpy+0x45>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:15
 */
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
 100269b:	89 f2                	mov    edx,esi
 100269d:	01 d1                	add    ecx,edx
 100269f:	eb ed                	jmp    100268e <strncpy+0x32>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strncpy.c:25
    while (n > 0) {
	*s++ = '\0';
	--n;
    }
    return s1;
}
 10026a1:	89 f0                	mov    eax,esi
 10026a3:	5b                   	pop    ebx
 10026a4:	5e                   	pop    esi
 10026a5:	c3                   	ret    
 10026a6:	66 90                	xchg   ax,ax

010026a8 <strleft>:
strleft():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strparts.c:2
char* strleft(char* val, int cnt)
{
 10026a8:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strparts.c:3
    val[cnt]='\0';
 10026ac:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 10026b0:	c6 04 10 00          	mov    BYTE PTR [eax+edx*1],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/strings/strparts.c:5
    return val;
}
 10026b4:	c3                   	ret    
 10026b5:	66 90                	xchg   ax,ax
 10026b7:	90                   	nop

010026b8 <time>:
time():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:84
};

extern time_t kSystemCurrentTime;
time_t time(time_t* arg)
{
    *arg = kSystemCurrentTime;
 10026b8:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 10026bc:	8b 15 8c 02 12 00    	mov    edx,DWORD PTR ds:0x12028c
 10026c2:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:86
    return kSystemCurrentTime;
}
 10026c4:	a1 8c 02 12 00       	mov    eax,ds:0x12028c
 10026c9:	c3                   	ret    

010026ca <gmtime_r>:
gmtime_r():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:88

struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
 10026ca:	55                   	push   ebp
 10026cb:	57                   	push   edi
 10026cc:	56                   	push   esi
 10026cd:	53                   	push   ebx
 10026ce:	83 ec 08             	sub    esp,0x8
 10026d1:	8b 74 24 20          	mov    esi,DWORD PTR [esp+0x20]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:93
  time_t time = *timer;
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;

  dayclock = (unsigned long) time % SECS_DAY;
 10026d5:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 10026d9:	8b 18                	mov    ebx,DWORD PTR [eax]
 10026db:	ba 07 45 2e c2       	mov    edx,0xc22e4507
 10026e0:	89 d8                	mov    eax,ebx
 10026e2:	f7 e2                	mul    edx
 10026e4:	89 d1                	mov    ecx,edx
 10026e6:	c1 e9 10             	shr    ecx,0x10
 10026e9:	69 c9 80 51 01 00    	imul   ecx,ecx,0x15180
 10026ef:	29 cb                	sub    ebx,ecx
 10026f1:	89 d9                	mov    ecx,ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:94
  dayno = (unsigned long) time / SECS_DAY;
 10026f3:	89 d3                	mov    ebx,edx
 10026f5:	c1 eb 10             	shr    ebx,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:96

  tmbuf->tm_sec = dayclock % 60;
 10026f8:	bd 89 88 88 88       	mov    ebp,0x88888889
 10026fd:	89 c8                	mov    eax,ecx
 10026ff:	f7 e5                	mul    ebp
 1002701:	c1 ea 05             	shr    edx,0x5
 1002704:	6b d2 3c             	imul   edx,edx,0x3c
 1002707:	89 c8                	mov    eax,ecx
 1002709:	29 d0                	sub    eax,edx
 100270b:	89 06                	mov    DWORD PTR [esi],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:97
  tmbuf->tm_min = (dayclock % 3600) / 60;
 100270d:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
 1002712:	89 c8                	mov    eax,ecx
 1002714:	f7 e2                	mul    edx
 1002716:	89 d7                	mov    edi,edx
 1002718:	c1 ef 0b             	shr    edi,0xb
 100271b:	69 c7 10 0e 00 00    	imul   eax,edi,0xe10
 1002721:	29 c1                	sub    ecx,eax
 1002723:	89 c8                	mov    eax,ecx
 1002725:	f7 e5                	mul    ebp
 1002727:	89 d1                	mov    ecx,edx
 1002729:	c1 e9 05             	shr    ecx,0x5
 100272c:	89 4e 04             	mov    DWORD PTR [esi+0x4],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:98
  tmbuf->tm_hour = dayclock / 3600;
 100272f:	89 7e 08             	mov    DWORD PTR [esi+0x8],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:99
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
 1002732:	8d 4b 04             	lea    ecx,[ebx+0x4]
 1002735:	ba 25 49 92 24       	mov    edx,0x24924925
 100273a:	89 c8                	mov    eax,ecx
 100273c:	f7 e2                	mul    edx
 100273e:	89 c8                	mov    eax,ecx
 1002740:	29 d0                	sub    eax,edx
 1002742:	d1 e8                	shr    eax,1
 1002744:	01 c2                	add    edx,eax
 1002746:	c1 ea 02             	shr    edx,0x2
 1002749:	8d 04 d5 00 00 00 00 	lea    eax,[edx*8+0x0]
 1002750:	29 d0                	sub    eax,edx
 1002752:	29 c1                	sub    ecx,eax
 1002754:	89 4e 18             	mov    DWORD PTR [esi+0x18],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:91
}

struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
  time_t time = *timer;
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;
 1002757:	b9 b2 07 00 00       	mov    ecx,0x7b2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 100275c:	bd 1f 85 eb 51       	mov    ebp,0x51eb851f
 1002761:	eb 53                	jmp    10027b6 <gmtime_r+0xec>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 1)
    dayno -= YEARSIZE(year);
 1002763:	89 c8                	mov    eax,ecx
 1002765:	f7 ed                	imul   ebp
 1002767:	c1 fa 05             	sar    edx,0x5
 100276a:	89 c8                	mov    eax,ecx
 100276c:	c1 f8 1f             	sar    eax,0x1f
 100276f:	29 c2                	sub    edx,eax
 1002771:	6b d2 64             	imul   edx,edx,0x64
 1002774:	39 d1                	cmp    ecx,edx
 1002776:	75 26                	jne    100279e <gmtime_r+0xd4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 4)
 1002778:	89 c8                	mov    eax,ecx
 100277a:	f7 ed                	imul   ebp
 100277c:	c1 fa 07             	sar    edx,0x7
 100277f:	89 c8                	mov    eax,ecx
 1002781:	c1 f8 1f             	sar    eax,0x1f
 1002784:	29 c2                	sub    edx,eax
 1002786:	69 c2 90 01 00 00    	imul   eax,edx,0x190
 100278c:	89 cf                	mov    edi,ecx
 100278e:	29 c7                	sub    edi,eax
 1002790:	83 ff 01             	cmp    edi,0x1
 1002793:	19 c0                	sbb    eax,eax
 1002795:	f7 d0                	not    eax
 1002797:	05 6e 01 00 00       	add    eax,0x16e
 100279c:	eb 13                	jmp    10027b1 <gmtime_r+0xe7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101
 100279e:	b8 6e 01 00 00       	mov    eax,0x16e
 10027a3:	eb 0c                	jmp    10027b1 <gmtime_r+0xe7>
 10027a5:	b8 6d 01 00 00       	mov    eax,0x16d
 10027aa:	eb 05                	jmp    10027b1 <gmtime_r+0xe7>
 10027ac:	b8 6e 01 00 00       	mov    eax,0x16e
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 8)
 10027b1:	29 c3                	sub    ebx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:102 (discriminator 8)
    year++;
 10027b3:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 10027b6:	89 cf                	mov    edi,ecx
 10027b8:	83 e7 03             	and    edi,0x3
 10027bb:	0f 85 d5 00 00 00    	jne    1002896 <gmtime_r+0x1cc>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100 (discriminator 1)
 10027c1:	89 c8                	mov    eax,ecx
 10027c3:	f7 ed                	imul   ebp
 10027c5:	c1 fa 05             	sar    edx,0x5
 10027c8:	89 c8                	mov    eax,ecx
 10027ca:	c1 f8 1f             	sar    eax,0x1f
 10027cd:	29 c2                	sub    edx,eax
 10027cf:	6b d2 64             	imul   edx,edx,0x64
 10027d2:	39 d1                	cmp    ecx,edx
 10027d4:	0f 85 0a 01 00 00    	jne    10028e4 <gmtime_r+0x21a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100 (discriminator 4)
 10027da:	89 c8                	mov    eax,ecx
 10027dc:	f7 ed                	imul   ebp
 10027de:	c1 fa 07             	sar    edx,0x7
 10027e1:	89 c8                	mov    eax,ecx
 10027e3:	c1 f8 1f             	sar    eax,0x1f
 10027e6:	29 c2                	sub    edx,eax
 10027e8:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 10027ee:	39 d1                	cmp    ecx,edx
 10027f0:	0f 84 03 01 00 00    	je     10028f9 <gmtime_r+0x22f>
 10027f6:	e9 b0 00 00 00       	jmp    10028ab <gmtime_r+0x1e1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:104
    dayno -= YEARSIZE(year);
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
 10027fb:	8d 81 94 f8 ff ff    	lea    eax,[ecx-0x76c]
 1002801:	89 46 14             	mov    DWORD PTR [esi+0x14],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:105
  tmbuf->tm_yday = dayno;
 1002804:	89 5e 1c             	mov    DWORD PTR [esi+0x1c],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:106
  tmbuf->tm_mon = 0;
 1002807:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
 100280e:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
 1002813:	89 c8                	mov    eax,ecx
 1002815:	f7 ea                	imul   edx
 1002817:	89 d5                	mov    ebp,edx
 1002819:	c1 fd 05             	sar    ebp,0x5
 100281c:	89 c8                	mov    eax,ecx
 100281e:	c1 f8 1f             	sar    eax,0x1f
 1002821:	29 c5                	sub    ebp,eax
 1002823:	6b ed 64             	imul   ebp,ebp,0x64
 1002826:	89 cf                	mov    edi,ecx
 1002828:	29 ef                	sub    edi,ebp
 100282a:	89 fd                	mov    ebp,edi
 100282c:	c1 fa 07             	sar    edx,0x7
 100282f:	29 c2                	sub    edx,eax
 1002831:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002837:	29 d1                	sub    ecx,edx
 1002839:	89 0c 24             	mov    DWORD PTR [esp],ecx
 100283c:	8b 7c 24 04          	mov    edi,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 1002840:	eb 40                	jmp    1002882 <gmtime_r+0x1b8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 1)
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
 1002842:	85 ed                	test   ebp,ebp
 1002844:	75 0d                	jne    1002853 <gmtime_r+0x189>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 4)
 1002846:	83 3c 24 00          	cmp    DWORD PTR [esp],0x0
 100284a:	74 0e                	je     100285a <gmtime_r+0x190>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 6)
 100284c:	ba 00 00 00 00       	mov    edx,0x0
 1002851:	eb 1a                	jmp    100286d <gmtime_r+0x1a3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108
 1002853:	ba 01 00 00 00       	mov    edx,0x1
 1002858:	eb 13                	jmp    100286d <gmtime_r+0x1a3>
 100285a:	ba 01 00 00 00       	mov    edx,0x1
 100285f:	eb 0c                	jmp    100286d <gmtime_r+0x1a3>
 1002861:	ba 01 00 00 00       	mov    edx,0x1
 1002866:	eb 05                	jmp    100286d <gmtime_r+0x1a3>
 1002868:	ba 01 00 00 00       	mov    edx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 8)
 100286d:	8d 0c 12             	lea    ecx,[edx+edx*1]
 1002870:	01 ca                	add    edx,ecx
 1002872:	8d 14 90             	lea    edx,[eax+edx*4]
 1002875:	2b 1c 95 00 50 00 01 	sub    ebx,DWORD PTR [edx*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:109 (discriminator 8)
    tmbuf->tm_mon++;
 100287c:	83 c0 01             	add    eax,0x1
 100287f:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 1002882:	85 ff                	test   edi,edi
 1002884:	75 4c                	jne    10028d2 <gmtime_r+0x208>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107 (discriminator 1)
 1002886:	85 ed                	test   ebp,ebp
 1002888:	0f 85 92 00 00 00    	jne    1002920 <gmtime_r+0x256>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107 (discriminator 4)
 100288e:	83 3c 24 00          	cmp    DWORD PTR [esp],0x0
 1002892:	74 7a                	je     100290e <gmtime_r+0x244>
 1002894:	eb 2a                	jmp    10028c0 <gmtime_r+0x1f6>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 1002896:	81 fb 6c 01 00 00    	cmp    ebx,0x16c
 100289c:	0f 87 03 ff ff ff    	ja     10027a5 <gmtime_r+0xdb>
 10028a2:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 10028a6:	e9 50 ff ff ff       	jmp    10027fb <gmtime_r+0x131>
 10028ab:	81 fb 6c 01 00 00    	cmp    ebx,0x16c
 10028b1:	0f 87 ac fe ff ff    	ja     1002763 <gmtime_r+0x99>
 10028b7:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 10028bb:	e9 3b ff ff ff       	jmp    10027fb <gmtime_r+0x131>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 10028c0:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 10028c3:	3b 1c 85 00 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005000]
 10028ca:	0f 83 72 ff ff ff    	jae    1002842 <gmtime_r+0x178>
 10028d0:	eb 5e                	jmp    1002930 <gmtime_r+0x266>
 10028d2:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 10028d5:	3b 1c 85 00 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005000]
 10028dc:	0f 83 6a ff ff ff    	jae    100284c <gmtime_r+0x182>
 10028e2:	eb 4c                	jmp    1002930 <gmtime_r+0x266>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 10028e4:	81 fb 6d 01 00 00    	cmp    ebx,0x16d
 10028ea:	0f 87 bc fe ff ff    	ja     10027ac <gmtime_r+0xe2>
 10028f0:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 10028f4:	e9 02 ff ff ff       	jmp    10027fb <gmtime_r+0x131>
 10028f9:	81 fb 6d 01 00 00    	cmp    ebx,0x16d
 10028ff:	0f 87 73 fe ff ff    	ja     1002778 <gmtime_r+0xae>
 1002905:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 1002909:	e9 ed fe ff ff       	jmp    10027fb <gmtime_r+0x131>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 100290e:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 1002911:	3b 1c 85 30 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005030]
 1002918:	0f 83 43 ff ff ff    	jae    1002861 <gmtime_r+0x197>
 100291e:	eb 10                	jmp    1002930 <gmtime_r+0x266>
 1002920:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 1002923:	3b 1c 85 30 50 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1005030]
 100292a:	0f 83 38 ff ff ff    	jae    1002868 <gmtime_r+0x19e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:111
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
    tmbuf->tm_mon++;
  }
  tmbuf->tm_mday = dayno + 1;
 1002930:	83 c3 01             	add    ebx,0x1
 1002933:	89 5e 0c             	mov    DWORD PTR [esi+0xc],ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:112
  tmbuf->tm_isdst = 0;
 1002936:	c7 46 20 00 00 00 00 	mov    DWORD PTR [esi+0x20],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:114
  return tmbuf;
}
 100293d:	89 f0                	mov    eax,esi
 100293f:	83 c4 08             	add    esp,0x8
 1002942:	5b                   	pop    ebx
 1002943:	5e                   	pop    esi
 1002944:	5f                   	pop    edi
 1002945:	5d                   	pop    ebp
 1002946:	c3                   	ret    

01002947 <localtime>:
localtime():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:116

struct tm *localtime(const time_t *timer) {
 1002947:	83 ec 30             	sub    esp,0x30
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:120
  time_t t;
  struct tm tmbuf;
  
  t = *timer - kTimeZone;
 100294a:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
 100294e:	8b 00                	mov    eax,DWORD PTR [eax]
 1002950:	2b 05 90 02 12 00    	sub    eax,DWORD PTR ds:0x120290
 1002956:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:121
  return gmtime_r(&t, &tmbuf);
 100295a:	54                   	push   esp
 100295b:	8d 44 24 30          	lea    eax,[esp+0x30]
 100295f:	50                   	push   eax
 1002960:	e8 65 fd ff ff       	call   10026ca <gmtime_r>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:122
}
 1002965:	83 c4 38             	add    esp,0x38
 1002968:	c3                   	ret    

01002969 <localtime_r>:
localtime_r():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:124

struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
 1002969:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:127
  time_t t;

  t = *timer - kTimeZone;
 100296c:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
 1002970:	8b 00                	mov    eax,DWORD PTR [eax]
 1002972:	2b 05 90 02 12 00    	sub    eax,DWORD PTR ds:0x120290
 1002978:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:128
  return gmtime_r(&t, tmbuf);
 100297c:	ff 74 24 18          	push   DWORD PTR [esp+0x18]
 1002980:	8d 44 24 10          	lea    eax,[esp+0x10]
 1002984:	50                   	push   eax
 1002985:	e8 40 fd ff ff       	call   10026ca <gmtime_r>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:129
}
 100298a:	83 c4 18             	add    esp,0x18
 100298d:	c3                   	ret    

0100298e <mktime>:
mktime():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:131

time_t mktime(struct tm *tmbuf) {
 100298e:	55                   	push   ebp
 100298f:	57                   	push   edi
 1002990:	56                   	push   esi
 1002991:	53                   	push   ebx
 1002992:	83 ec 20             	sub    esp,0x20
 1002995:	8b 5c 24 34          	mov    ebx,DWORD PTR [esp+0x34]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:139
  int yday, month;
  /*unsigned*/ long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
 1002999:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 100299b:	ba 89 88 88 88       	mov    edx,0x88888889
 10029a0:	89 c8                	mov    eax,ecx
 10029a2:	f7 ea                	imul   edx
 10029a4:	8d 04 0a             	lea    eax,[edx+ecx*1]
 10029a7:	c1 f8 05             	sar    eax,0x5
 10029aa:	89 ca                	mov    edx,ecx
 10029ac:	c1 fa 1f             	sar    edx,0x1f
 10029af:	29 d0                	sub    eax,edx
 10029b1:	89 c2                	mov    edx,eax
 10029b3:	03 53 04             	add    edx,DWORD PTR [ebx+0x4]
 10029b6:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:140
  tmbuf->tm_sec %= 60;
 10029b9:	6b c0 3c             	imul   eax,eax,0x3c
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:141
  if (tmbuf->tm_sec < 0) {
 10029bc:	29 c1                	sub    ecx,eax
 10029be:	78 04                	js     10029c4 <mktime+0x36>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:140
  /*unsigned*/ long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
  tmbuf->tm_sec %= 60;
 10029c0:	89 0b                	mov    DWORD PTR [ebx],ecx
 10029c2:	eb 0b                	jmp    10029cf <mktime+0x41>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:142
  if (tmbuf->tm_sec < 0) {
    tmbuf->tm_sec += 60;
 10029c4:	83 c1 3c             	add    ecx,0x3c
 10029c7:	89 0b                	mov    DWORD PTR [ebx],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:143
    tmbuf->tm_min--;
 10029c9:	83 ea 01             	sub    edx,0x1
 10029cc:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:145
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
 10029cf:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
 10029d2:	ba 89 88 88 88       	mov    edx,0x88888889
 10029d7:	89 c8                	mov    eax,ecx
 10029d9:	f7 ea                	imul   edx
 10029db:	8d 04 0a             	lea    eax,[edx+ecx*1]
 10029de:	c1 f8 05             	sar    eax,0x5
 10029e1:	89 ca                	mov    edx,ecx
 10029e3:	c1 fa 1f             	sar    edx,0x1f
 10029e6:	29 d0                	sub    eax,edx
 10029e8:	89 c2                	mov    edx,eax
 10029ea:	03 53 08             	add    edx,DWORD PTR [ebx+0x8]
 10029ed:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:146
  tmbuf->tm_min = tmbuf->tm_min % 60;
 10029f0:	6b c0 3c             	imul   eax,eax,0x3c
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:147
  if (tmbuf->tm_min < 0) {
 10029f3:	29 c1                	sub    ecx,eax
 10029f5:	78 05                	js     10029fc <mktime+0x6e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:146
  if (tmbuf->tm_sec < 0) {
    tmbuf->tm_sec += 60;
    tmbuf->tm_min--;
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
  tmbuf->tm_min = tmbuf->tm_min % 60;
 10029f7:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
 10029fa:	eb 0c                	jmp    1002a08 <mktime+0x7a>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:148
  if (tmbuf->tm_min < 0) {
    tmbuf->tm_min += 60;
 10029fc:	83 c1 3c             	add    ecx,0x3c
 10029ff:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:149
    tmbuf->tm_hour--;
 1002a02:	83 ea 01             	sub    edx,0x1
 1002a05:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:151
  }
  day = tmbuf->tm_hour / 24;
 1002a08:	8b 73 08             	mov    esi,DWORD PTR [ebx+0x8]
 1002a0b:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
 1002a10:	89 f0                	mov    eax,esi
 1002a12:	f7 ea                	imul   edx
 1002a14:	c1 fa 02             	sar    edx,0x2
 1002a17:	89 f0                	mov    eax,esi
 1002a19:	c1 f8 1f             	sar    eax,0x1f
 1002a1c:	89 d1                	mov    ecx,edx
 1002a1e:	29 c1                	sub    ecx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:152
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
 1002a20:	8d 04 49             	lea    eax,[ecx+ecx*2]
 1002a23:	c1 e0 03             	shl    eax,0x3
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:153
  if (tmbuf->tm_hour < 0) {
 1002a26:	29 c6                	sub    esi,eax
 1002a28:	78 05                	js     1002a2f <mktime+0xa1>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:152
  if (tmbuf->tm_min < 0) {
    tmbuf->tm_min += 60;
    tmbuf->tm_hour--;
  }
  day = tmbuf->tm_hour / 24;
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
 1002a2a:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
 1002a2d:	eb 09                	jmp    1002a38 <mktime+0xaa>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:154
  if (tmbuf->tm_hour < 0) {
    tmbuf->tm_hour += 24;
 1002a2f:	83 c6 18             	add    esi,0x18
 1002a32:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:155
    day--;
 1002a35:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:157
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
 1002a38:	8b 73 10             	mov    esi,DWORD PTR [ebx+0x10]
 1002a3b:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
 1002a40:	89 f0                	mov    eax,esi
 1002a42:	f7 ea                	imul   edx
 1002a44:	d1 fa                	sar    edx,1
 1002a46:	89 f0                	mov    eax,esi
 1002a48:	c1 f8 1f             	sar    eax,0x1f
 1002a4b:	29 c2                	sub    edx,eax
 1002a4d:	89 d0                	mov    eax,edx
 1002a4f:	03 43 14             	add    eax,DWORD PTR [ebx+0x14]
 1002a52:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:158
  tmbuf->tm_mon %= 12;
 1002a55:	8d 14 52             	lea    edx,[edx+edx*2]
 1002a58:	c1 e2 02             	shl    edx,0x2
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:159
  if (tmbuf->tm_mon < 0) {
 1002a5b:	29 d6                	sub    esi,edx
 1002a5d:	78 05                	js     1002a64 <mktime+0xd6>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:158
  if (tmbuf->tm_hour < 0) {
    tmbuf->tm_hour += 24;
    day--;
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
  tmbuf->tm_mon %= 12;
 1002a5f:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
 1002a62:	eb 0c                	jmp    1002a70 <mktime+0xe2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:160
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
 1002a64:	83 c6 0c             	add    esi,0xc
 1002a67:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:161
    tmbuf->tm_year--;
 1002a6a:	83 e8 01             	sub    eax,0x1
 1002a6d:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:163
  }
  day += (tmbuf->tm_mday - 1);
 1002a70:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
 1002a73:	8d 6c 01 ff          	lea    ebp,[ecx+eax*1-0x1]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:164
  while (day < 0) {
 1002a77:	85 ed                	test   ebp,ebp
 1002a79:	0f 89 f1 00 00 00    	jns    1002b70 <mktime+0x1e2>
 1002a7f:	8b 73 10             	mov    esi,DWORD PTR [ebx+0x10]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169
    if(--tmbuf->tm_mon < 0) {
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002a82:	bf 1f 85 eb 51       	mov    edi,0x51eb851f
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:165
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
    if(--tmbuf->tm_mon < 0) {
 1002a87:	83 ee 01             	sub    esi,0x1
 1002a8a:	79 09                	jns    1002a95 <mktime+0x107>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:166
      tmbuf->tm_year--;
 1002a8c:	83 6b 14 01          	sub    DWORD PTR [ebx+0x14],0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:167
      tmbuf->tm_mon = 11;
 1002a90:	be 0b 00 00 00       	mov    esi,0xb
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002a95:	8b 4b 14             	mov    ecx,DWORD PTR [ebx+0x14]
 1002a98:	b8 00 00 00 00       	mov    eax,0x0
 1002a9d:	f6 c1 03             	test   cl,0x3
 1002aa0:	75 3c                	jne    1002ade <mktime+0x150>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 1)
 1002aa2:	81 c1 6c 07 00 00    	add    ecx,0x76c
 1002aa8:	89 c8                	mov    eax,ecx
 1002aaa:	f7 ef                	imul   edi
 1002aac:	c1 fa 05             	sar    edx,0x5
 1002aaf:	89 c8                	mov    eax,ecx
 1002ab1:	c1 f8 1f             	sar    eax,0x1f
 1002ab4:	29 c2                	sub    edx,eax
 1002ab6:	6b d2 64             	imul   edx,edx,0x64
 1002ab9:	b8 01 00 00 00       	mov    eax,0x1
 1002abe:	39 d1                	cmp    ecx,edx
 1002ac0:	75 1c                	jne    1002ade <mktime+0x150>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 4)
 1002ac2:	89 c8                	mov    eax,ecx
 1002ac4:	f7 ef                	imul   edi
 1002ac6:	c1 fa 07             	sar    edx,0x7
 1002ac9:	89 c8                	mov    eax,ecx
 1002acb:	c1 f8 1f             	sar    eax,0x1f
 1002ace:	29 c2                	sub    edx,eax
 1002ad0:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002ad6:	39 d1                	cmp    ecx,edx
 1002ad8:	0f 94 c0             	sete   al
 1002adb:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 8)
 1002ade:	8d 14 00             	lea    edx,[eax+eax*1]
 1002ae1:	01 d0                	add    eax,edx
 1002ae3:	8d 04 86             	lea    eax,[esi+eax*4]
 1002ae6:	03 2c 85 00 50 00 01 	add    ebp,DWORD PTR [eax*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:164 (discriminator 8)
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
 1002aed:	85 ed                	test   ebp,ebp
 1002aef:	78 96                	js     1002a87 <mktime+0xf9>
 1002af1:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
 1002af4:	eb 7a                	jmp    1002b70 <mktime+0x1e2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 1)
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002af6:	8d be 6c 07 00 00    	lea    edi,[esi+0x76c]
 1002afc:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002b01:	f7 ef                	imul   edi
 1002b03:	c1 fa 05             	sar    edx,0x5
 1002b06:	89 f8                	mov    eax,edi
 1002b08:	c1 f8 1f             	sar    eax,0x1f
 1002b0b:	29 c2                	sub    edx,eax
 1002b0d:	6b d2 64             	imul   edx,edx,0x64
 1002b10:	39 d7                	cmp    edi,edx
 1002b12:	75 27                	jne    1002b3b <mktime+0x1ad>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 4)
 1002b14:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002b19:	f7 ef                	imul   edi
 1002b1b:	c1 fa 07             	sar    edx,0x7
 1002b1e:	89 f8                	mov    eax,edi
 1002b20:	c1 f8 1f             	sar    eax,0x1f
 1002b23:	29 c2                	sub    edx,eax
 1002b25:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002b2b:	b8 01 00 00 00       	mov    eax,0x1
 1002b30:	39 d7                	cmp    edi,edx
 1002b32:	74 13                	je     1002b47 <mktime+0x1b9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 6)
 1002b34:	b8 00 00 00 00       	mov    eax,0x0
 1002b39:	eb 0c                	jmp    1002b47 <mktime+0x1b9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172
 1002b3b:	b8 01 00 00 00       	mov    eax,0x1
 1002b40:	eb 05                	jmp    1002b47 <mktime+0x1b9>
 1002b42:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 8)
 1002b47:	8d 14 00             	lea    edx,[eax+eax*1]
 1002b4a:	01 d0                	add    eax,edx
 1002b4c:	8d 04 81             	lea    eax,[ecx+eax*4]
 1002b4f:	2b 2c 85 00 50 00 01 	sub    ebp,DWORD PTR [eax*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:173 (discriminator 8)
    if (++(tmbuf->tm_mon) == 12) {
 1002b56:	83 c1 01             	add    ecx,0x1
 1002b59:	83 f9 0c             	cmp    ecx,0xc
 1002b5c:	74 05                	je     1002b63 <mktime+0x1d5>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:173
 1002b5e:	89 4b 10             	mov    DWORD PTR [ebx+0x10],ecx
 1002b61:	eb 0d                	jmp    1002b70 <mktime+0x1e2>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:174
      tmbuf->tm_mon = 0;
 1002b63:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:175
      tmbuf->tm_year++;
 1002b6a:	83 c6 01             	add    esi,0x1
 1002b6d:	89 73 14             	mov    DWORD PTR [ebx+0x14],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002b70:	8b 73 14             	mov    esi,DWORD PTR [ebx+0x14]
 1002b73:	f7 c6 03 00 00 00    	test   esi,0x3
 1002b79:	0f 85 ad 02 00 00    	jne    1002e2c <mktime+0x49e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171 (discriminator 1)
 1002b7f:	8d 8e 6c 07 00 00    	lea    ecx,[esi+0x76c]
 1002b85:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002b8a:	f7 e9                	imul   ecx
 1002b8c:	c1 fa 05             	sar    edx,0x5
 1002b8f:	89 c8                	mov    eax,ecx
 1002b91:	c1 f8 1f             	sar    eax,0x1f
 1002b94:	29 c2                	sub    edx,eax
 1002b96:	6b d2 64             	imul   edx,edx,0x64
 1002b99:	39 d1                	cmp    ecx,edx
 1002b9b:	0f 85 b5 02 00 00    	jne    1002e56 <mktime+0x4c8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171 (discriminator 4)
 1002ba1:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002ba6:	f7 e9                	imul   ecx
 1002ba8:	c1 fa 07             	sar    edx,0x7
 1002bab:	89 c8                	mov    eax,ecx
 1002bad:	c1 f8 1f             	sar    eax,0x1f
 1002bb0:	29 c2                	sub    edx,eax
 1002bb2:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002bb8:	39 d1                	cmp    ecx,edx
 1002bba:	0f 84 b6 02 00 00    	je     1002e76 <mktime+0x4e8>
 1002bc0:	e9 7c 02 00 00       	jmp    1002e41 <mktime+0x4b3>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:178
    if (++(tmbuf->tm_mon) == 12) {
      tmbuf->tm_mon = 0;
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
 1002bc5:	8d 45 01             	lea    eax,[ebp+0x1]
 1002bc8:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:180
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
 1002bcb:	83 fe 45             	cmp    esi,0x45
 1002bce:	0f 8e 51 02 00 00    	jle    1002e25 <mktime+0x497>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:190
  // Assume that when day becomes negative, there will certainly
  // be overflow on seconds.
  // The check for overflow needs not to be done for leapyears
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;
 1002bd4:	8d 86 6c 07 00 00    	lea    eax,[esi+0x76c]
 1002bda:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:192

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
 1002bde:	8d 46 ba             	lea    eax,[esi-0x46]
 1002be1:	89 c7                	mov    edi,eax
 1002be3:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:183
  tmbuf->tm_mday = day + 1;
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
  seconds = 0;
  day = 0;                      // Means days since day 0 now
  overflow = 0;
 1002be7:	3d 7c c6 59 00       	cmp    eax,0x59c67c
 1002bec:	0f 9f c0             	setg   al
 1002bef:	0f b6 c0             	movzx  eax,al
 1002bf2:	89 c2                	mov    edx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:193
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
  day = (tm_year - year) * 365;
 1002bf4:	89 f8                	mov    eax,edi
 1002bf6:	69 ff 6d 01 00 00    	imul   edi,edi,0x16d
 1002bfc:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:194
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
 1002c00:	8d 7e bd             	lea    edi,[esi-0x43]
 1002c03:	85 c0                	test   eax,eax
 1002c05:	0f 49 f8             	cmovns edi,eax
 1002c08:	c1 ff 02             	sar    edi,0x2
 1002c0b:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
 1002c10:	2b 44 24 04          	sub    eax,DWORD PTR [esp+0x4]
 1002c14:	8d 77 01             	lea    esi,[edi+0x1]
 1002c17:	89 14 24             	mov    DWORD PTR [esp],edx
 1002c1a:	83 ca 02             	or     edx,0x2
 1002c1d:	39 f0                	cmp    eax,esi
 1002c1f:	89 d6                	mov    esi,edx
 1002c21:	0f 4d 34 24          	cmovge esi,DWORD PTR [esp]
 1002c25:	89 34 24             	mov    DWORD PTR [esp],esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:195
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
 1002c28:	b8 00 00 00 00       	mov    eax,0x0
 1002c2d:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 1002c31:	89 d6                	mov    esi,edx
 1002c33:	83 e6 03             	and    esi,0x3
 1002c36:	89 74 24 1c          	mov    DWORD PTR [esp+0x1c],esi
 1002c3a:	74 19                	je     1002c55 <mktime+0x2c7>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:195 (discriminator 1)
 1002c3c:	89 d6                	mov    esi,edx
 1002c3e:	c1 fa 1f             	sar    edx,0x1f
 1002c41:	c1 ea 1e             	shr    edx,0x1e
 1002c44:	8d 04 16             	lea    eax,[esi+edx*1]
 1002c47:	83 e0 03             	and    eax,0x3
 1002c4a:	29 d0                	sub    eax,edx
 1002c4c:	83 f8 01             	cmp    eax,0x1
 1002c4f:	0f 9e c0             	setle  al
 1002c52:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:195 (discriminator 6)
 1002c55:	01 c7                	add    edi,eax
 1002c57:	03 7c 24 04          	add    edi,DWORD PTR [esp+0x4]
 1002c5b:	89 7c 24 10          	mov    DWORD PTR [esp+0x10],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:196 (discriminator 6)
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
 1002c5f:	bf 1f 85 eb 51       	mov    edi,0x51eb851f
 1002c64:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1002c68:	f7 ef                	imul   edi
 1002c6a:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
 1002c6e:	89 d0                	mov    eax,edx
 1002c70:	c1 f8 05             	sar    eax,0x5
 1002c73:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 1002c77:	89 d6                	mov    esi,edx
 1002c79:	c1 fe 1f             	sar    esi,0x1f
 1002c7c:	89 74 24 18          	mov    DWORD PTR [esp+0x18],esi
 1002c80:	29 f0                	sub    eax,esi
 1002c82:	6b c0 64             	imul   eax,eax,0x64
 1002c85:	29 c2                	sub    edx,eax
 1002c87:	89 d0                	mov    eax,edx
 1002c89:	0f 95 44 24 04       	setne  BYTE PTR [esp+0x4]
 1002c8e:	0f b6 54 24 04       	movzx  edx,BYTE PTR [esp+0x4]
 1002c93:	83 f8 45             	cmp    eax,0x45
 1002c96:	0f 9e c0             	setle  al
 1002c99:	0f b6 c0             	movzx  eax,al
 1002c9c:	89 c6                	mov    esi,eax
 1002c9e:	21 d6                	and    esi,edx
 1002ca0:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1002ca4:	f7 ef                	imul   edi
 1002ca6:	89 d7                	mov    edi,edx
 1002ca8:	c1 ff 05             	sar    edi,0x5
 1002cab:	89 f8                	mov    eax,edi
 1002cad:	8b 7c 24 0c          	mov    edi,DWORD PTR [esp+0xc]
 1002cb1:	c1 ff 1f             	sar    edi,0x1f
 1002cb4:	89 7c 24 0c          	mov    DWORD PTR [esp+0xc],edi
 1002cb8:	29 f8                	sub    eax,edi
 1002cba:	01 c6                	add    esi,eax
 1002cbc:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
 1002cc0:	29 f7                	sub    edi,esi
 1002cc2:	89 fe                	mov    esi,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:197 (discriminator 6)
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);
 1002cc4:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
 1002cc8:	c1 f8 07             	sar    eax,0x7
 1002ccb:	89 c7                	mov    edi,eax
 1002ccd:	2b 7c 24 18          	sub    edi,DWORD PTR [esp+0x18]
 1002cd1:	69 c7 90 01 00 00    	imul   eax,edi,0x190
 1002cd7:	8b 7c 24 08          	mov    edi,DWORD PTR [esp+0x8]
 1002cdb:	29 c7                	sub    edi,eax
 1002cdd:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
 1002ce1:	81 ff 71 01 00 00    	cmp    edi,0x171
 1002ce7:	0f 9e 44 24 10       	setle  BYTE PTR [esp+0x10]
 1002cec:	85 ff                	test   edi,edi
 1002cee:	0f 95 c0             	setne  al
 1002cf1:	0f b6 c0             	movzx  eax,al
 1002cf4:	23 44 24 10          	and    eax,DWORD PTR [esp+0x10]
 1002cf8:	c1 fa 07             	sar    edx,0x7
 1002cfb:	2b 54 24 0c          	sub    edx,DWORD PTR [esp+0xc]
 1002cff:	01 c2                	add    edx,eax
 1002d01:	8d 04 32             	lea    eax,[edx+esi*1]
 1002d04:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:200 (discriminator 6)

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
 1002d08:	85 c9                	test   ecx,ecx
 1002d0a:	7e 46                	jle    1002d52 <mktime+0x3c4>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:200
 1002d0c:	be 00 00 00 00       	mov    esi,0x0
 1002d11:	bf 00 00 00 00       	mov    edi,0x0
 1002d16:	89 6c 24 10          	mov    DWORD PTR [esp+0x10],ebp
 1002d1a:	8b 6c 24 1c          	mov    ebp,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:201
    yday += _ytab[LEAPYEAR(tm_year)][month];
 1002d1e:	b8 00 00 00 00       	mov    eax,0x0
 1002d23:	85 ed                	test   ebp,ebp
 1002d25:	75 0f                	jne    1002d36 <mktime+0x3a8>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:201 (discriminator 4)
 1002d27:	83 7c 24 08 00       	cmp    DWORD PTR [esp+0x8],0x0
 1002d2c:	0f 94 c0             	sete   al
 1002d2f:	0a 44 24 04          	or     al,BYTE PTR [esp+0x4]
 1002d33:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:201 (discriminator 8)
 1002d36:	8d 14 00             	lea    edx,[eax+eax*1]
 1002d39:	01 d0                	add    eax,edx
 1002d3b:	8d 04 86             	lea    eax,[esi+eax*4]
 1002d3e:	03 3c 85 00 50 00 01 	add    edi,DWORD PTR [eax*4+0x1005000]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:202 (discriminator 8)
    month++;
 1002d45:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:200 (discriminator 8)
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
 1002d48:	39 ce                	cmp    esi,ecx
 1002d4a:	75 d2                	jne    1002d1e <mktime+0x390>
 1002d4c:	8b 6c 24 10          	mov    ebp,DWORD PTR [esp+0x10]
 1002d50:	eb 05                	jmp    1002d57 <mktime+0x3c9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:199
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
 1002d52:	bf 00 00 00 00       	mov    edi,0x0
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:204
  while (month < tmbuf->tm_mon) {
    yday += _ytab[LEAPYEAR(tm_year)][month];
    month++;
  }
  yday += (tmbuf->tm_mday - 1);
 1002d57:	01 ef                	add    edi,ebp
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:205
  if (day + yday < 0) overflow|=4;
 1002d59:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
 1002d5d:	01 fe                	add    esi,edi
 1002d5f:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
 1002d62:	89 c8                	mov    eax,ecx
 1002d64:	83 c8 04             	or     eax,0x4
 1002d67:	85 f6                	test   esi,esi
 1002d69:	0f 49 c1             	cmovns eax,ecx
 1002d6c:	89 c5                	mov    ebp,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:208
  day += yday;

  tmbuf->tm_yday = yday;
 1002d6e:	89 7b 1c             	mov    DWORD PTR [ebx+0x1c],edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:209
  tmbuf->tm_wday = (day + 4) % 7;               // Day 0 was thursday (4)
 1002d71:	8d 4e 04             	lea    ecx,[esi+0x4]
 1002d74:	ba 93 24 49 92       	mov    edx,0x92492493
 1002d79:	89 c8                	mov    eax,ecx
 1002d7b:	f7 ea                	imul   edx
 1002d7d:	01 ca                	add    edx,ecx
 1002d7f:	c1 fa 02             	sar    edx,0x2
 1002d82:	89 c8                	mov    eax,ecx
 1002d84:	c1 f8 1f             	sar    eax,0x1f
 1002d87:	29 c2                	sub    edx,eax
 1002d89:	8d 04 d5 00 00 00 00 	lea    eax,[edx*8+0x0]
 1002d90:	29 d0                	sub    eax,edx
 1002d92:	29 c1                	sub    ecx,eax
 1002d94:	89 4b 18             	mov    DWORD PTR [ebx+0x18],ecx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:211

  seconds = ((tmbuf->tm_hour * 60L) + tmbuf->tm_min) * 60L + tmbuf->tm_sec;
 1002d97:	6b 4b 08 3c          	imul   ecx,DWORD PTR [ebx+0x8],0x3c
 1002d9b:	03 4b 04             	add    ecx,DWORD PTR [ebx+0x4]
 1002d9e:	6b c9 3c             	imul   ecx,ecx,0x3c
 1002da1:	03 0b                	add    ecx,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:213

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
 1002da3:	bf ff ff ff 7f       	mov    edi,0x7fffffff
 1002da8:	29 cf                	sub    edi,ecx
 1002daa:	ba 07 45 2e c2       	mov    edx,0xc22e4507
 1002daf:	89 f8                	mov    eax,edi
 1002db1:	f7 ea                	imul   edx
 1002db3:	01 fa                	add    edx,edi
 1002db5:	c1 fa 10             	sar    edx,0x10
 1002db8:	c1 ff 1f             	sar    edi,0x1f
 1002dbb:	29 fa                	sub    edx,edi
 1002dbd:	89 e8                	mov    eax,ebp
 1002dbf:	83 c8 08             	or     eax,0x8
 1002dc2:	39 d6                	cmp    esi,edx
 1002dc4:	0f 4e c5             	cmovle eax,ebp
 1002dc7:	89 04 24             	mov    DWORD PTR [esp],eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:214
  seconds += day * SECS_DAY;
 1002dca:	69 f6 80 51 01 00    	imul   esi,esi,0x15180
 1002dd0:	01 f1                	add    ecx,esi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:217

  // Now adjust according to timezone and daylight saving time
  if (((kTimeZone > 0) && (TIME_MAX - kTimeZone < seconds)) || 
 1002dd2:	a1 90 02 12 00       	mov    eax,ds:0x120290
 1002dd7:	85 c0                	test   eax,eax
 1002dd9:	7e 0b                	jle    1002de6 <mktime+0x458>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:217 (discriminator 1)
 1002ddb:	ba ff ff ff 7f       	mov    edx,0x7fffffff
 1002de0:	29 c2                	sub    edx,eax
 1002de2:	39 d1                	cmp    ecx,edx
 1002de4:	7f 0c                	jg     1002df2 <mktime+0x464>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:217 (discriminator 3)
 1002de6:	85 c0                	test   eax,eax
 1002de8:	79 0c                	jns    1002df6 <mktime+0x468>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:218
      ((kTimeZone < 0) && (seconds < -kTimeZone))) {
 1002dea:	89 c2                	mov    edx,eax
 1002dec:	f7 da                	neg    edx
 1002dee:	39 d1                	cmp    ecx,edx
 1002df0:	7d 04                	jge    1002df6 <mktime+0x468>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:219
          overflow|=16;
 1002df2:	83 0c 24 10          	or     DWORD PTR [esp],0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:221
  }
  seconds += kTimeZone;
 1002df6:	01 c1                	add    ecx,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:224

  if (tmbuf->tm_isdst) {
    dst = _dstbias;
 1002df8:	83 7b 20 00          	cmp    DWORD PTR [ebx+0x20],0x0
 1002dfc:	ba 00 00 00 00       	mov    edx,0x0
 1002e01:	0f 45 15 2c 04 12 00 	cmovne edx,DWORD PTR ds:0x12042c
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:229
  } else {
    dst = 0;
  }

  if (dst > seconds) overflow|=32;        // dst is always non-negative
 1002e08:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 1002e0b:	89 d8                	mov    eax,ebx
 1002e0d:	83 c8 20             	or     eax,0x20
 1002e10:	39 ca                	cmp    edx,ecx
 1002e12:	0f 4e c3             	cmovle eax,ebx
 1002e15:	89 c7                	mov    edi,eax
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:232
  seconds -= dst;

  if (overflow) return (time_t) overflow-2;
 1002e17:	89 f8                	mov    eax,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:235

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
 1002e19:	29 d1                	sub    ecx,edx
 1002e1b:	83 e8 02             	sub    eax,0x2
 1002e1e:	85 ff                	test   edi,edi
 1002e20:	0f 44 c1             	cmove  eax,ecx
 1002e23:	eb 62                	jmp    1002e87 <mktime+0x4f9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:180
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
 1002e25:	b8 19 fc ff ff       	mov    eax,0xfffffc19
 1002e2a:	eb 5b                	jmp    1002e87 <mktime+0x4f9>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002e2c:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e2f:	3b 2c 8d 00 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005000]
 1002e36:	0f 8d f8 fc ff ff    	jge    1002b34 <mktime+0x1a6>
 1002e3c:	e9 84 fd ff ff       	jmp    1002bc5 <mktime+0x237>
 1002e41:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e44:	3b 2c 8d 00 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005000]
 1002e4b:	0f 8d a5 fc ff ff    	jge    1002af6 <mktime+0x168>
 1002e51:	e9 6f fd ff ff       	jmp    1002bc5 <mktime+0x237>
 1002e56:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e59:	3b 2c 8d 30 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005030]
 1002e60:	0f 8d dc fc ff ff    	jge    1002b42 <mktime+0x1b4>
 1002e66:	e9 5a fd ff ff       	jmp    1002bc5 <mktime+0x237>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:172
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002e6b:	8d be 6c 07 00 00    	lea    edi,[esi+0x76c]
 1002e71:	e9 9e fc ff ff       	jmp    1002b14 <mktime+0x186>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002e76:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e79:	3b 2c 8d 30 50 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1005030]
 1002e80:	7d e9                	jge    1002e6b <mktime+0x4dd>
 1002e82:	e9 3e fd ff ff       	jmp    1002bc5 <mktime+0x237>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:236

  if (overflow) return (time_t) overflow-2;

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
}
 1002e87:	83 c4 20             	add    esp,0x20
 1002e8a:	5b                   	pop    ebx
 1002e8b:	5e                   	pop    esi
 1002e8c:	5f                   	pop    edi
 1002e8d:	5d                   	pop    ebp
 1002e8e:	c3                   	ret    

01002e8f <_strdate>:
_strdate():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:241

#if !defined(KERNEL) && !defined(OS_LIB)


char *_strdate(char *s) {
 1002e8f:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:244
  time_t now;

  time(&now);
 1002e92:	8d 44 24 0c          	lea    eax,[esp+0xc]
 1002e96:	50                   	push   eax
 1002e97:	e8 1c f8 ff ff       	call   10026b8 <time>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:248
  //fix me!
  //  strftime(s, 9, "%D", localtime(&now));
  return s;
}
 1002e9c:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002ea0:	83 c4 14             	add    esp,0x14
 1002ea3:	c3                   	ret    

01002ea4 <_strtime>:
_strtime():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:250

char *_strtime(char *s) {
 1002ea4:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:253
  time_t now;

  time(&now);
 1002ea7:	8d 44 24 0c          	lea    eax,[esp+0xc]
 1002eab:	50                   	push   eax
 1002eac:	e8 07 f8 ff ff       	call   10026b8 <time>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:257
  //fix me
  //  strftime(s, 9, "%T", localtime(&now));
  return s;
}
 1002eb1:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002eb5:	83 c4 14             	add    esp,0x14
 1002eb8:	c3                   	ret    

01002eb9 <waitTicks>:
waitTicks():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:260

void __attribute__((noinline))waitTicks(int TicksToWait)
{
 1002eb9:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:262
    //printf("ttw=%u",ttw);
    if (TicksToWait==0)
 1002ebd:	85 c0                	test   eax,eax
 1002ebf:	74 09                	je     1002eca <waitTicks+0x11>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:267 (discriminator 1)
        return;
    //printd(DEBUG_TIMER,"ttw=%08X", TicksToWait);
    do
    {
        __asm("sti\nhlt\n");
 1002ec1:	fb                   	sti    
 1002ec2:	f4                   	hlt    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:268 (discriminator 1)
        TicksToWait--;
 1002ec3:	83 e8 01             	sub    eax,0x1
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:269 (discriminator 1)
    } while (TicksToWait>0);
 1002ec6:	85 c0                	test   eax,eax
 1002ec8:	7f f7                	jg     1002ec1 <waitTicks+0x8>
 1002eca:	f3 c3                	repz ret 

01002ecc <wait>:
wait():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:274
    return;
}

void /*__attribute__((noinline))*/wait(int msToWait)
{
 1002ecc:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:277
    //printk("msToWait=%u, ticksperms=%u, ticksToWait=%u",msToWait, kTicksPerMS, msToWait*kTicksPerMS);
    //STOPHERE2
    waitTicks(msToWait/kTicksPerMS);
 1002ed0:	99                   	cdq    
 1002ed1:	f7 3d 84 02 12 00    	idiv   DWORD PTR ds:0x120284
 1002ed7:	50                   	push   eax
 1002ed8:	e8 dc ff ff ff       	call   1002eb9 <waitTicks>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:278
}
 1002edd:	83 c4 04             	add    esp,0x4
 1002ee0:	c3                   	ret    

01002ee1 <wait3>:
wait3():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:281

void wait3(double msToWait)
{
 1002ee1:	56                   	push   esi
 1002ee2:	53                   	push   ebx
 1002ee3:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:282
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);
 1002ee6:	8b 0d 60 02 12 00    	mov    ecx,DWORD PTR ds:0x120260
 1002eec:	8b 19                	mov    ebx,DWORD PTR [ecx]
 1002eee:	8b 35 80 02 12 00    	mov    esi,DWORD PTR ds:0x120280
 1002ef4:	dd 44 24 30          	fld    QWORD PTR [esp+0x30]
 1002ef8:	b8 e8 03 00 00       	mov    eax,0x3e8
 1002efd:	ba 00 00 00 00       	mov    edx,0x0
 1002f02:	f7 f6                	div    esi
 1002f04:	89 04 24             	mov    DWORD PTR [esp],eax
 1002f07:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f0e:	00 
 1002f0f:	df 2c 24             	fild   QWORD PTR [esp]
 1002f12:	de f9                	fdivp  st(1),st
 1002f14:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1002f17:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f1e:	00 
 1002f1f:	df 2c 24             	fild   QWORD PTR [esp]
 1002f22:	de c1                	faddp  st(1),st
 1002f24:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002f28:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002f2c:	dd 5c 24 18          	fstp   QWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:284

while (endTicks > (double)*kTicksSinceStart)
 1002f30:	8b 01                	mov    eax,DWORD PTR [ecx]
 1002f32:	dd 44 24 18          	fld    QWORD PTR [esp+0x18]
 1002f36:	89 04 24             	mov    DWORD PTR [esp],eax
 1002f39:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f40:	00 
 1002f41:	df 2c 24             	fild   QWORD PTR [esp]
 1002f44:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002f48:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002f4c:	d9 c9                	fxch   st(1)
 1002f4e:	df e9                	fucomip st,st(1)
 1002f50:	dd d8                	fstp   st(0)
 1002f52:	76 26                	jbe    1002f7a <wait3+0x99>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:285
    {__asm__("sti\n hlt\n");}
 1002f54:	fb                   	sti    
 1002f55:	f4                   	hlt    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:284

void wait3(double msToWait)
{
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);

while (endTicks > (double)*kTicksSinceStart)
 1002f56:	8b 01                	mov    eax,DWORD PTR [ecx]
 1002f58:	dd 44 24 18          	fld    QWORD PTR [esp+0x18]
 1002f5c:	89 04 24             	mov    DWORD PTR [esp],eax
 1002f5f:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f66:	00 
 1002f67:	df 2c 24             	fild   QWORD PTR [esp]
 1002f6a:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002f6e:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002f72:	d9 c9                	fxch   st(1)
 1002f74:	df e9                	fucomip st,st(1)
 1002f76:	dd d8                	fstp   st(0)
 1002f78:	77 da                	ja     1002f54 <wait3+0x73>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:287
    {__asm__("sti\n hlt\n");}
    
}
 1002f7a:	83 c4 24             	add    esp,0x24
 1002f7d:	5b                   	pop    ebx
 1002f7e:	5e                   	pop    esi
 1002f7f:	c3                   	ret    

01002f80 <wait2>:
wait2():
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:290

void wait2(unsigned msToWait)
{
 1002f80:	57                   	push   edi
 1002f81:	56                   	push   esi
 1002f82:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:291
    uint64_t startTicks = *kTicksSinceStart;             //25
 1002f83:	8b 1d 60 02 12 00    	mov    ebx,DWORD PTR ds:0x120260
 1002f89:	8b 0b                	mov    ecx,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:292
    unsigned msPerTick = 1000 / kTicksPerSecond;         //18
 1002f8b:	8b 3d 80 02 12 00    	mov    edi,DWORD PTR ds:0x120280
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:294
    uint64_t totalTicksToWait = msToWait/msPerTick;     //4321/18
    uint64_t endTicks = startTicks + totalTicksToWait;
 1002f91:	b8 e8 03 00 00       	mov    eax,0x3e8
 1002f96:	ba 00 00 00 00       	mov    edx,0x0
 1002f9b:	f7 f7                	div    edi
 1002f9d:	89 c6                	mov    esi,eax
 1002f9f:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 1002fa3:	ba 00 00 00 00       	mov    edx,0x0
 1002fa8:	f7 f6                	div    esi
 1002faa:	89 c6                	mov    esi,eax
 1002fac:	bf 00 00 00 00       	mov    edi,0x0
 1002fb1:	89 c8                	mov    eax,ecx
 1002fb3:	ba 00 00 00 00       	mov    edx,0x0
 1002fb8:	01 f0                	add    eax,esi
 1002fba:	11 fa                	adc    edx,edi
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:296

    if (endTicks < *kTicksSinceStart)
 1002fbc:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 1002fbe:	83 fa 00             	cmp    edx,0x0
 1002fc1:	77 04                	ja     1002fc7 <wait2+0x47>
 1002fc3:	39 c8                	cmp    eax,ecx
 1002fc5:	72 17                	jb     1002fde <wait2+0x5e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:304
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
 1002fc7:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 1002fc9:	83 fa 00             	cmp    edx,0x0
 1002fcc:	77 04                	ja     1002fd2 <wait2+0x52>
 1002fce:	39 c8                	cmp    eax,ecx
 1002fd0:	76 0c                	jbe    1002fde <wait2+0x5e>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:305
    {__asm__("hlt\n");}
 1002fd2:	f4                   	hlt    
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:304
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
 1002fd3:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 1002fd5:	83 fa 00             	cmp    edx,0x0
 1002fd8:	77 f8                	ja     1002fd2 <wait2+0x52>
 1002fda:	39 c8                	cmp    eax,ecx
 1002fdc:	77 f4                	ja     1002fd2 <wait2+0x52>
/home/yogi/src/os/chrisOSKernel/../chrisOS/src/time.c:307
    {__asm__("hlt\n");}
    //printf("done waiting!\n");
}
 1002fde:	5b                   	pop    ebx
 1002fdf:	5e                   	pop    esi
 1002fe0:	5f                   	pop    edi
 1002fe1:	c3                   	ret    
 1002fe2:	66 90                	xchg   ax,ax

01002fe4 <kbd_handler_generic>:
kbd_handler_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:38
    kbd_handler_generic();
    return;
}

void kbd_handler_generic()
{
 1002fe4:	53                   	push   ebx
 1002fe5:	83 ec 08             	sub    esp,0x8
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1002fe8:	e4 60                	in     al,0x60
kbd_handler_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:44
    unsigned char lKeyControlVal=0;
    unsigned char rawKey=0;
    unsigned char translatedKeypress=0;
   
    rawKey = inb(KEYB_DATA_PORT);
    kKeyChar = rawKey;//& 0x80;
 1002fea:	a2 70 3a 01 01       	mov    ds:0x1013a70,al
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:46

    __asm__("cli\n");
 1002fef:	fa                   	cli    
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:48
    
    switch(rawKey)  
 1002ff0:	3c 9d                	cmp    al,0x9d
 1002ff2:	74 44                	je     1003038 <kbd_handler_generic+0x54>
 1002ff4:	3c 9d                	cmp    al,0x9d
 1002ff6:	77 0e                	ja     1003006 <kbd_handler_generic+0x22>
 1002ff8:	3c 2a                	cmp    al,0x2a
 1002ffa:	74 18                	je     1003014 <kbd_handler_generic+0x30>
 1002ffc:	3c 38                	cmp    al,0x38
 1002ffe:	74 44                	je     1003044 <kbd_handler_generic+0x60>
 1003000:	3c 1d                	cmp    al,0x1d
 1003002:	75 6e                	jne    1003072 <kbd_handler_generic+0x8e>
 1003004:	eb 26                	jmp    100302c <kbd_handler_generic+0x48>
 1003006:	3c b8                	cmp    al,0xb8
 1003008:	74 46                	je     1003050 <kbd_handler_generic+0x6c>
 100300a:	3c ba                	cmp    al,0xba
 100300c:	74 4e                	je     100305c <kbd_handler_generic+0x78>
 100300e:	3c aa                	cmp    al,0xaa
 1003010:	75 60                	jne    1003072 <kbd_handler_generic+0x8e>
 1003012:	eb 0c                	jmp    1003020 <kbd_handler_generic+0x3c>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:50
    {
        case KEY_SHIFT_DN: kKeyStatus[INDEX_SHIFT]=1;break;
 1003014:	c6 05 48 3a 01 01 01 	mov    BYTE PTR ds:0x1013a48,0x1
 100301b:	e9 94 01 00 00       	jmp    10031b4 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:51
        case KEY_SHIFT_UP: kKeyStatus[INDEX_SHIFT]=0;break;
 1003020:	c6 05 48 3a 01 01 00 	mov    BYTE PTR ds:0x1013a48,0x0
 1003027:	e9 88 01 00 00       	jmp    10031b4 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:52
        case KEY_CTRL_DN: kKeyStatus[INDEX_CTRL]=1;break;
 100302c:	c6 05 49 3a 01 01 01 	mov    BYTE PTR ds:0x1013a49,0x1
 1003033:	e9 7c 01 00 00       	jmp    10031b4 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:53
        case KEY_CTRL_UP: kKeyStatus[INDEX_CTRL]=0;break;
 1003038:	c6 05 49 3a 01 01 00 	mov    BYTE PTR ds:0x1013a49,0x0
 100303f:	e9 70 01 00 00       	jmp    10031b4 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:54
        case KEY_ALT_DN: kKeyStatus[INDEX_ALT]=1;break;
 1003044:	c6 05 4a 3a 01 01 01 	mov    BYTE PTR ds:0x1013a4a,0x1
 100304b:	e9 64 01 00 00       	jmp    10031b4 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:55
        case KEY_ALT_UP: kKeyStatus[INDEX_ALT]=0;break;
 1003050:	c6 05 4a 3a 01 01 00 	mov    BYTE PTR ds:0x1013a4a,0x0
 1003057:	e9 58 01 00 00       	jmp    10031b4 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:56
        case KEY_CAPSLOCK_UP: kKeyStatus[INDEX_CAPSLOCK]=!kKeyStatus[INDEX_CAPSLOCK];break;
 100305c:	0f b6 05 4b 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a4b
 1003063:	84 c0                	test   al,al
 1003065:	0f 94 c0             	sete   al
 1003068:	a2 4b 3a 01 01       	mov    ds:0x1013a4b,al
 100306d:	e9 42 01 00 00       	jmp    10031b4 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:64
//        case MAKE_UP: kKeyStatus[INDEX_UP]=0;break;
//        case MAKE_DOWN: kKeyStatus[INDEX_DOWN]=0;break;
       default:
//printk("%02X",rawKey);
           //changed from if rawkey & 0x80, so that keydown triggers the key being input
           if (rawKey==BREAK_RIGHT || rawKey==BREAK_LEFT || rawKey==BREAK_UP || rawKey==BREAK_DOWN)
 1003072:	8d 50 35             	lea    edx,[eax+0x35]
 1003075:	f6 c2 fd             	test   dl,0xfd
 1003078:	74 08                	je     1003082 <kbd_handler_generic+0x9e>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:64 (discriminator 1)
 100307a:	8d 50 38             	lea    edx,[eax+0x38]
 100307d:	f6 c2 f7             	test   dl,0xf7
 1003080:	75 24                	jne    10030a6 <kbd_handler_generic+0xc2>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:65
               if (kKeyboardBuffer<(char*)KEYBOARD_BUFFER_ADDRESS+KEYBOARD_BUFFER_SIZE && !kKeyStatus[INDEX_ALT])
 1003082:	8b 15 e0 03 12 00    	mov    edx,DWORD PTR ds:0x1203e0
 1003088:	81 fa 2f 25 15 00    	cmp    edx,0x15252f
 100308e:	77 16                	ja     10030a6 <kbd_handler_generic+0xc2>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:65 (discriminator 1)
 1003090:	0f b6 0d 4a 3a 01 01 	movzx  ecx,BYTE PTR ds:0x1013a4a
 1003097:	84 c9                	test   cl,cl
 1003099:	75 0b                	jne    10030a6 <kbd_handler_generic+0xc2>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:66
                   *kKeyboardBuffer++=rawKey;
 100309b:	8d 4a 01             	lea    ecx,[edx+0x1]
 100309e:	89 0d e0 03 12 00    	mov    DWORD PTR ds:0x1203e0,ecx
 10030a4:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:67
           if (!(rawKey & 0x80))
 10030a6:	84 c0                	test   al,al
 10030a8:	0f 88 06 01 00 00    	js     10031b4 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:71
           {
                //rawKey &= 0x7f;
               //printk("%02X",rawKey); 48=up, 50=down
                 if (kKeyStatus[INDEX_SHIFT] || kKeyStatus[INDEX_CAPSLOCK])
 10030ae:	0f b6 15 48 3a 01 01 	movzx  edx,BYTE PTR ds:0x1013a48
 10030b5:	84 d2                	test   dl,dl
 10030b7:	75 0b                	jne    10030c4 <kbd_handler_generic+0xe0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:71 (discriminator 1)
 10030b9:	0f b6 15 4b 3a 01 01 	movzx  edx,BYTE PTR ds:0x1013a4b
 10030c0:	84 d2                	test   dl,dl
 10030c2:	74 0c                	je     10030d0 <kbd_handler_generic+0xec>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:73
                 {
                     translatedKeypress=keyboard_map_up[rawKey];
 10030c4:	0f b6 c0             	movzx  eax,al
 10030c7:	0f b6 98 60 50 00 01 	movzx  ebx,BYTE PTR [eax+0x1005060]
 10030ce:	eb 0a                	jmp    10030da <kbd_handler_generic+0xf6>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:76
                 }
                 else
                     translatedKeypress=keyboard_map[rawKey];
 10030d0:	0f b6 c0             	movzx  eax,al
 10030d3:	0f b6 98 e0 50 00 01 	movzx  ebx,BYTE PTR [eax+0x10050e0]
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:83
//                 if ((kDebugLevel & DEBUG_KEYBOARD) == DEBUG_KEYBOARD)
//                 {
//                      printf("%u, %u, %c\n",kKeyChar, rawKey, translatedKeypress);
//                 }
#endif
                if (kKeyStatus[INDEX_CTRL])
 10030da:	0f b6 05 49 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a49
 10030e1:	84 c0                	test   al,al
 10030e3:	74 13                	je     10030f8 <kbd_handler_generic+0x114>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:85
                {
                    printk("^");
 10030e5:	83 ec 0c             	sub    esp,0xc
 10030e8:	68 7b 75 00 01       	push   0x100757b
 10030ed:	e8 31 f4 ff ff       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:86
                    translatedKeypress-=32;
 10030f2:	83 eb 20             	sub    ebx,0x20
 10030f5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:89
                }
                //Debug
                if (kKeyStatus[INDEX_ALT] && translatedKeypress==0x6A)
 10030f8:	0f b6 05 4a 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a4a
 10030ff:	80 fb 6a             	cmp    bl,0x6a
 1003102:	75 05                	jne    1003109 <kbd_handler_generic+0x125>
 1003104:	84 c0                	test   al,al
 1003106:	74 01                	je     1003109 <kbd_handler_generic+0x125>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:91
                {
                    __asm("int 0x3");
 1003108:	cc                   	int3   
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:93
                }
            if (kKeyStatus[INDEX_ALT] && kKeyStatus[INDEX_CTRL] && translatedKeypress==0xE0)
 1003109:	0f b6 05 4a 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a4a
 1003110:	84 c0                	test   al,al
 1003112:	74 2f                	je     1003143 <kbd_handler_generic+0x15f>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:93 (discriminator 1)
 1003114:	0f b6 05 49 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a49
 100311b:	80 fb e0             	cmp    bl,0xe0
 100311e:	75 23                	jne    1003143 <kbd_handler_generic+0x15f>
 1003120:	84 c0                	test   al,al
 1003122:	74 1f                	je     1003143 <kbd_handler_generic+0x15f>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:96
            {
                translatedKeypress=0;
                reboot(false);
 1003124:	83 ec 0c             	sub    esp,0xc
 1003127:	6a 00                	push   0x0
 1003129:	e8 a1 eb ff ff       	call   1001ccf <reboot>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:98
            }
            if (kKeyStatus[INDEX_ALT])
 100312e:	0f b6 05 4a 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a4a
 1003135:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:95
                {
                    __asm("int 0x3");
                }
            if (kKeyStatus[INDEX_ALT] && kKeyStatus[INDEX_CTRL] && translatedKeypress==0xE0)
            {
                translatedKeypress=0;
 1003138:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:98
                reboot(false);
            }
            if (kKeyStatus[INDEX_ALT])
 100313d:	84 c0                	test   al,al
 100313f:	75 69                	jne    10031aa <kbd_handler_generic+0x1c6>
 1003141:	eb 71                	jmp    10031b4 <kbd_handler_generic+0x1d0>
 1003143:	0f b6 05 4a 3a 01 01 	movzx  eax,BYTE PTR ds:0x1013a4a
 100314a:	84 c0                	test   al,al
 100314c:	74 66                	je     10031b4 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:100
            {
                if (translatedKeypress=='c')
 100314e:	80 fb 63             	cmp    bl,0x63
 1003151:	75 4b                	jne    100319e <kbd_handler_generic+0x1ba>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:102
                {
                    printk("%u",*kTicksSinceStart);
 1003153:	a1 60 02 12 00       	mov    eax,ds:0x120260
 1003158:	8b 00                	mov    eax,DWORD PTR [eax]
 100315a:	83 ec 08             	sub    esp,0x8
 100315d:	50                   	push   eax
 100315e:	68 7d 75 00 01       	push   0x100757d
 1003163:	e8 bb f3 ff ff       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:103
                    printk("-%c-%04X:%08X",(exceptionFlags & 0x200)==0x200?'I':'i',exceptionCS, exceptionEIP);
 1003168:	8b 0d f8 01 12 00    	mov    ecx,DWORD PTR ds:0x1201f8
 100316e:	8b 15 fc 01 12 00    	mov    edx,DWORD PTR ds:0x1201fc
 1003174:	a1 f0 01 12 00       	mov    eax,ds:0x1201f0
 1003179:	83 c4 10             	add    esp,0x10
 100317c:	25 00 02 00 00       	and    eax,0x200
 1003181:	83 f8 01             	cmp    eax,0x1
 1003184:	19 c0                	sbb    eax,eax
 1003186:	83 e0 20             	and    eax,0x20
 1003189:	83 c0 49             	add    eax,0x49
 100318c:	51                   	push   ecx
 100318d:	52                   	push   edx
 100318e:	50                   	push   eax
 100318f:	68 80 75 00 01       	push   0x1007580
 1003194:	e8 8a f3 ff ff       	call   1002523 <printk>
 1003199:	83 c4 10             	add    esp,0x10
 100319c:	eb 16                	jmp    10031b4 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:116
                    printk("The time is currently %s", &currTime);
                    cursorMoveTo(65,SYS_VGA_HEIGHT-1);
                    printk("ticks=%d", *kTicksSinceStart);
                    cursorRestorePosition();
                }
*/                if (translatedKeypress=='d')
 100319e:	80 fb 64             	cmp    bl,0x64
 10031a1:	75 07                	jne    10031aa <kbd_handler_generic+0x1c6>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:118
                {
                    printDumpedRegs();
 10031a3:	e8 8e e8 ff ff       	call   1001a36 <printDumpedRegs>
 10031a8:	eb 0a                	jmp    10031b4 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:120
                }
                if (translatedKeypress=='e')
 10031aa:	80 fb 65             	cmp    bl,0x65
 10031ad:	75 05                	jne    10031b4 <kbd_handler_generic+0x1d0>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:122
                {
                    dumpKernelAddresses();
 10031af:	e8 5c eb ff ff       	call   1001d10 <dumpKernelAddresses>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 10031b4:	e4 61                	in     al,0x61
 10031b6:	89 c2                	mov    edx,eax
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10031b8:	83 c8 82             	or     eax,0xffffff82
 10031bb:	e6 61                	out    0x61,al
 10031bd:	89 d0                	mov    eax,edx
 10031bf:	83 e0 7f             	and    eax,0x7f
 10031c2:	83 c8 02             	or     eax,0x2
 10031c5:	e6 61                	out    0x61,al
kbd_handler_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:135
    lKeyControlVal |= 0x82;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    lKeyControlVal &= 0x7f;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    return;
}
 10031c7:	83 c4 08             	add    esp,0x8
 10031ca:	5b                   	pop    ebx
 10031cb:	c3                   	ret    

010031cc <ih_keyboard_generic>:
ih_keyboard_generic():
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:32
extern volatile uint32_t exceptionSavedESP;
extern volatile uint32_t* kTicksSinceStart;

__attribute__ ((interrupt))
void ih_keyboard_generic(struct interrupt_frame *frame)
{
 10031cc:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:33
    kbd_handler_generic();
 10031cf:	e8 10 fe ff ff       	call   1002fe4 <kbd_handler_generic>
/home/yogi/src/os/chrisOSKernel/src/drivers/drv_genKeyboard.c:35
    return;
}
 10031d4:	83 c4 0c             	add    esp,0xc
 10031d7:	c3                   	ret    

010031d8 <main>:
main():
/home/yogi/src/os/chrisOSKernel/src/kernel.c:23
extern char kernelDataLoadAddress;

/*
 * 
 */
int main(int argc, char** argv) {
 10031d8:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 10031dc:	83 e4 f0             	and    esp,0xfffffff0
 10031df:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 10031e2:	55                   	push   ebp
 10031e3:	89 e5                	mov    ebp,esp
 10031e5:	51                   	push   ecx
 10031e6:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/kernel.c:25
    //terminal_clear();
    printk("\nkernel loaded ... \n");
 10031e9:	68 8e 75 00 01       	push   0x100758e
 10031ee:	e8 30 f3 ff ff       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:35
        //if (cnt>5)
        //    break;
    }
*/
    
    printk("kernelDataLoadAddress = 0x%08X \n\n",&kernelDataLoadAddress);
 10031f3:	83 c4 08             	add    esp,0x8
 10031f6:	68 00 00 12 00       	push   0x120000
 10031fb:	68 a0 82 00 01       	push   0x10082a0
 1003200:	e8 1e f3 ff ff       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:36
    mmInit();
 1003205:	e8 10 03 00 00       	call   100351a <mmInit>
/home/yogi/src/os/chrisOSKernel/src/kernel.c:38
    
    return (0xbad);
 100320a:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/kernel.c:39
}
 100320d:	b8 ad 0b 00 00       	mov    eax,0xbad
 1003212:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
 1003215:	c9                   	leave  
 1003216:	8d 61 fc             	lea    esp,[ecx-0x4]
 1003219:	c3                   	ret    
 100321a:	66 90                	xchg   ax,ax

0100321c <findEmptyBlock>:
findEmptyBlock():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:21
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})

//Returns pointer to first empty block found
sMemInfo* findEmptyBlock()
{
 100321c:	53                   	push   ebx
 100321d:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:22
    sMemInfo* mInfo=heapMemoryInfo;
 1003220:	a1 54 3a 01 01       	mov    eax,ds:0x1013a54
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:27
    sMemInfo* lRetVal;
    
    while (1==1)
    {
        if (mInfo->next==NULL)
 1003225:	83 78 18 00          	cmp    DWORD PTR [eax+0x18],0x0
 1003229:	74 09                	je     1003234 <findEmptyBlock+0x18>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:33
        {
            lRetVal=mInfo+1;
            printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: Returning block # 0x%08X\n",lRetVal);
            return (sMemInfo*)lRetVal;
        }
        mInfo++;
 100322b:	83 c0 1c             	add    eax,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:27
    sMemInfo* mInfo=heapMemoryInfo;
    sMemInfo* lRetVal;
    
    while (1==1)
    {
        if (mInfo->next==NULL)
 100322e:	83 78 18 00          	cmp    DWORD PTR [eax+0x18],0x0
 1003232:	75 f7                	jne    100322b <findEmptyBlock+0xf>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:29
        {
            lRetVal=mInfo+1;
 1003234:	8d 58 1c             	lea    ebx,[eax+0x1c]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:30
            printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: Returning block # 0x%08X\n",lRetVal);
 1003237:	83 ec 04             	sub    esp,0x4
 100323a:	53                   	push   ebx
 100323b:	68 c4 82 00 01       	push   0x10082c4
 1003240:	68 00 00 01 00       	push   0x10000
 1003245:	e8 f1 f2 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:37
        }
        mInfo++;
    }
    printd(DEBUG_MEMORY_MANAGEMENT,"findEmptyBlock: No empty block found, returning NULL\n");
    return NULL;
}
 100324a:	89 d8                	mov    eax,ebx
 100324c:	83 c4 18             	add    esp,0x18
 100324f:	5b                   	pop    ebx
 1003250:	c3                   	ret    

01003251 <findBlockByMemoryAddress>:
findBlockByMemoryAddress():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:40

sMemInfo* findBlockByMemoryAddress(uintptr_t* address)
{
 1003251:	56                   	push   esi
 1003252:	53                   	push   ebx
 1003253:	83 ec 04             	sub    esp,0x4
 1003256:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:41
    uintptr_t* lNext=(uintptr_t*)heapMemoryInfo;
 100325a:	8b 1d 54 3a 01 01    	mov    ebx,DWORD PTR ds:0x1013a54
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:46
    sMemInfo* mInfo;
    do
    {
        mInfo=(sMemInfo*)lNext;
        printk("mInfo->address=0x%08X, address=0x%08X\n",mInfo->address,address);
 1003260:	83 ec 04             	sub    esp,0x4
 1003263:	56                   	push   esi
 1003264:	ff 73 04             	push   DWORD PTR [ebx+0x4]
 1003267:	68 f0 82 00 01       	push   0x10082f0
 100326c:	e8 b2 f2 ff ff       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:47
        if (mInfo->address==address)
 1003271:	83 c4 10             	add    esp,0x10
 1003274:	3b 73 04             	cmp    esi,DWORD PTR [ebx+0x4]
 1003277:	75 18                	jne    1003291 <findBlockByMemoryAddress+0x40>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:49
        {
            printd(DEBUG_MEMORY_MANAGEMENT,"findBlockByMemoryAddress: Found block 0x%08X for memory address 0x%08X\n",mInfo,address);
 1003279:	56                   	push   esi
 100327a:	53                   	push   ebx
 100327b:	68 18 83 00 01       	push   0x1008318
 1003280:	68 00 00 01 00       	push   0x10000
 1003285:	e8 b1 f2 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:50
            return (sMemInfo*)mInfo;
 100328a:	83 c4 10             	add    esp,0x10
 100328d:	89 d8                	mov    eax,ebx
 100328f:	eb 0c                	jmp    100329d <findBlockByMemoryAddress+0x4c>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:52
        }
        lNext=mInfo->next;
 1003291:	8b 5b 18             	mov    ebx,DWORD PTR [ebx+0x18]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:53
    } while (lNext!=NULL);
 1003294:	85 db                	test   ebx,ebx
 1003296:	75 c8                	jne    1003260 <findBlockByMemoryAddress+0xf>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:54
    return NULL;
 1003298:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:55
}
 100329d:	83 c4 04             	add    esp,0x4
 10032a0:	5b                   	pop    ebx
 10032a1:	5e                   	pop    esi
 10032a2:	c3                   	ret    

010032a3 <findAvailableBlockBySize>:
findAvailableBlockBySize():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:59

//Returns a block with enough memory to fulfill the request
uintptr_t* findAvailableBlockBySize(uint32_t pSize)
{
 10032a3:	53                   	push   ebx
 10032a4:	83 ec 08             	sub    esp,0x8
 10032a7:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:61
    sMemInfo* mInfo;
    uintptr_t* lNext=(uintptr_t*)heapMemoryInfo;
 10032ab:	8b 1d 54 3a 01 01    	mov    ebx,DWORD PTR ds:0x1013a54
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:63
    
    while (lNext)
 10032b1:	eb 22                	jmp    10032d5 <findAvailableBlockBySize+0x32>
 10032b3:	eb fe                	jmp    10032b3 <findAvailableBlockBySize+0x10>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:66 (discriminator 1)
    {
        mInfo=(sMemInfo*)lNext;
        if (mInfo->size>=pSize && (!mInfo->inUse))
 10032b5:	80 7b 0c 00          	cmp    BYTE PTR [ebx+0xc],0x0
 10032b9:	75 1a                	jne    10032d5 <findAvailableBlockBySize+0x32>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:68
        {
            printd(DEBUG_MEMORY_MANAGEMENT,"findAvailableBlockBySize: Returning block address 0x%08X\n",mInfo);
 10032bb:	83 ec 04             	sub    esp,0x4
 10032be:	53                   	push   ebx
 10032bf:	68 60 83 00 01       	push   0x1008360
 10032c4:	68 00 00 01 00       	push   0x10000
 10032c9:	e8 6d f2 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:69
            return (uintptr_t*)mInfo;
 10032ce:	83 c4 10             	add    esp,0x10
 10032d1:	89 d8                	mov    eax,ebx
 10032d3:	eb 10                	jmp    10032e5 <findAvailableBlockBySize+0x42>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:63
uintptr_t* findAvailableBlockBySize(uint32_t pSize)
{
    sMemInfo* mInfo;
    uintptr_t* lNext=(uintptr_t*)heapMemoryInfo;
    
    while (lNext)
 10032d5:	85 db                	test   ebx,ebx
 10032d7:	74 07                	je     10032e0 <findAvailableBlockBySize+0x3d>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:66
    {
        mInfo=(sMemInfo*)lNext;
        if (mInfo->size>=pSize && (!mInfo->inUse))
 10032d9:	3b 43 08             	cmp    eax,DWORD PTR [ebx+0x8]
 10032dc:	76 d7                	jbe    10032b5 <findAvailableBlockBySize+0x12>
 10032de:	eb d3                	jmp    10032b3 <findAvailableBlockBySize+0x10>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:72
        {
            printd(DEBUG_MEMORY_MANAGEMENT,"findAvailableBlockBySize: Returning block address 0x%08X\n",mInfo);
            return (uintptr_t*)mInfo;
        }
    }
    return NULL;
 10032e0:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:73
}
 10032e5:	83 c4 08             	add    esp,0x8
 10032e8:	5b                   	pop    ebx
 10032e9:	c3                   	ret    

010032ea <allocateBlockFrom>:
allocateBlockFrom():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:77

//Create a new block with the requested amount of memory, and adjust the old block's size and pointer appropriately
uintptr_t* allocateBlockFrom(sMemInfo* mInfoToAllocateFrom, uint32_t size)
{
 10032ea:	55                   	push   ebp
 10032eb:	57                   	push   edi
 10032ec:	56                   	push   esi
 10032ed:	53                   	push   ebx
 10032ee:	83 ec 0c             	sub    esp,0xc
 10032f1:	8b 74 24 20          	mov    esi,DWORD PTR [esp+0x20]
 10032f5:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:78
    sMemInfo* mNewInfo=findEmptyBlock();
 10032f9:	e8 1e ff ff ff       	call   100321c <findEmptyBlock>
 10032fe:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:79
    sMemInfo* mPriorInfo=mNewInfo--;
 1003300:	8d 68 e4             	lea    ebp,[eax-0x1c]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:81
    
    printd(DEBUG_MEMORY_MANAGEMENT,"allocateBlockFrom: findEmptyBlock returned 0x%08X\n",mNewInfo);
 1003303:	83 ec 04             	sub    esp,0x4
 1003306:	55                   	push   ebp
 1003307:	68 9c 83 00 01       	push   0x100839c
 100330c:	68 00 00 01 00       	push   0x10000
 1003311:	e8 25 f2 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:83
    
    mPriorInfo->next=(uintptr_t*)mNewInfo;
 1003316:	89 6b 18             	mov    DWORD PTR [ebx+0x18],ebp
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:86
    
    //Set up the new sMemInfo
    mNewInfo->prior=(uintptr_t*)mPriorInfo;
 1003319:	89 5b e4             	mov    DWORD PTR [ebx-0x1c],ebx
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:87
    mNewInfo->address=mInfoToAllocateFrom->address;
 100331c:	8b 46 04             	mov    eax,DWORD PTR [esi+0x4]
 100331f:	89 43 e8             	mov    DWORD PTR [ebx-0x18],eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:88
    mNewInfo->size=size;
 1003322:	89 7b ec             	mov    DWORD PTR [ebx-0x14],edi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:89
    mNewInfo->inUse=true;
 1003325:	c6 43 f0 01          	mov    BYTE PTR [ebx-0x10],0x1
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:90
    mNewInfo->cr3=CURRENT_CR3;
 1003329:	0f 20 d8             	mov    eax,cr3
 100332c:	89 c0                	mov    eax,eax
 100332e:	89 43 f8             	mov    DWORD PTR [ebx-0x8],eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:93
    //mNewInfo pid and next don't get set
    
    mInfoToAllocateFrom->address+=size;
 1003331:	01 7e 04             	add    DWORD PTR [esi+0x4],edi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:94
    mInfoToAllocateFrom->size-=size;
 1003334:	29 7e 08             	sub    DWORD PTR [esi+0x8],edi
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:95
    return (uintptr_t*)mNewInfo->address;
 1003337:	8b 43 e8             	mov    eax,DWORD PTR [ebx-0x18]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:96
}
 100333a:	83 c4 1c             	add    esp,0x1c
 100333d:	5b                   	pop    ebx
 100333e:	5e                   	pop    esi
 100333f:	5f                   	pop    edi
 1003340:	5d                   	pop    ebp
 1003341:	c3                   	ret    

01003342 <malloc>:
malloc():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:99

uintptr_t* malloc(uint32_t size)
{
 1003342:	56                   	push   esi
 1003343:	53                   	push   ebx
 1003344:	83 ec 04             	sub    esp,0x4
 1003347:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:100
    uint32_t newSize=size+(MEMORY_BLOCK_SIZE-(size % MEMORY_BLOCK_SIZE));
 100334b:	89 c3                	mov    ebx,eax
 100334d:	81 e3 00 f0 ff ff    	and    ebx,0xfffff000
 1003353:	81 c3 00 10 00 00    	add    ebx,0x1000
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:101
    printd(DEBUG_MEMORY_MANAGEMENT,"malloc: Size adjusted from %u to %u\n",size,newSize);
 1003359:	53                   	push   ebx
 100335a:	50                   	push   eax
 100335b:	68 d0 83 00 01       	push   0x10083d0
 1003360:	68 00 00 01 00       	push   0x10000
 1003365:	e8 d1 f1 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:103
    uintptr_t* lRetVal;
    uintptr_t* block=findAvailableBlockBySize(newSize);
 100336a:	89 1c 24             	mov    DWORD PTR [esp],ebx
 100336d:	e8 31 ff ff ff       	call   10032a3 <findAvailableBlockBySize>
 1003372:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:104
    if ( ((sMemInfo*)(block))->size > newSize)
 1003374:	83 c4 10             	add    esp,0x10
 1003377:	3b 58 08             	cmp    ebx,DWORD PTR [eax+0x8]
 100337a:	73 0f                	jae    100338b <malloc+0x49>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:105
       lRetVal=allocateBlockFrom((sMemInfo*)block,newSize);
 100337c:	83 ec 08             	sub    esp,0x8
 100337f:	53                   	push   ebx
 1003380:	50                   	push   eax
 1003381:	e8 64 ff ff ff       	call   10032ea <allocateBlockFrom>
 1003386:	89 c6                	mov    esi,eax
 1003388:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:108
    else
        lRetVal=block;
    printd(DEBUG_MEMORY_MANAGEMENT,"malloc: Returning address 0x%08X\n",lRetVal);
 100338b:	83 ec 04             	sub    esp,0x4
 100338e:	56                   	push   esi
 100338f:	68 f8 83 00 01       	push   0x10083f8
 1003394:	68 00 00 01 00       	push   0x10000
 1003399:	e8 9d f1 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:111
    //pagingMapPage();
    return lRetVal;
}
 100339e:	89 f0                	mov    eax,esi
 10033a0:	83 c4 14             	add    esp,0x14
 10033a3:	5b                   	pop    ebx
 10033a4:	5e                   	pop    esi
 10033a5:	c3                   	ret    

010033a6 <free>:
free():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:114

void free(uintptr_t* address)
{
 10033a6:	53                   	push   ebx
 10033a7:	83 ec 14             	sub    esp,0x14
 10033aa:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:115
    sMemInfo* mInfo = findBlockByMemoryAddress(address);
 10033ae:	53                   	push   ebx
 10033af:	e8 9d fe ff ff       	call   1003251 <findBlockByMemoryAddress>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:116
    if (mInfo!=NULL)
 10033b4:	83 c4 10             	add    esp,0x10
 10033b7:	85 c0                	test   eax,eax
 10033b9:	74 1a                	je     10033d5 <free+0x2f>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:118
    {
        mInfo->inUse=false;
 10033bb:	c6 40 0c 00          	mov    BYTE PTR [eax+0xc],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:119
        printd(DEBUG_MEMORY_MANAGEMENT,"Freed block 0x%08x for memory address 0x%08x\n",mInfo,address);
 10033bf:	53                   	push   ebx
 10033c0:	50                   	push   eax
 10033c1:	68 1c 84 00 01       	push   0x100841c
 10033c6:	68 00 00 01 00       	push   0x10000
 10033cb:	e8 6b f1 ff ff       	call   100253b <printd>
 10033d0:	83 c4 10             	add    esp,0x10
 10033d3:	eb 16                	jmp    10033eb <free+0x45>
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:122
    }
    else
        printd(DEBUG_MEMORY_MANAGEMENT,"free: Could not find memory block for 0x%08X to free, doing nothing\n",address);
 10033d5:	83 ec 04             	sub    esp,0x4
 10033d8:	53                   	push   ebx
 10033d9:	68 4c 84 00 01       	push   0x100844c
 10033de:	68 00 00 01 00       	push   0x10000
 10033e3:	e8 53 f1 ff ff       	call   100253b <printd>
 10033e8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:123
}
 10033eb:	83 c4 08             	add    esp,0x8
 10033ee:	5b                   	pop    ebx
 10033ef:	c3                   	ret    

010033f0 <mallocA1k>:
mallocA1k():
/home/yogi/src/os/chrisOSKernel/src/mm/alloc.c:130
uintptr_t* mallocA1k(uint32_t size)
{
    uintptr_t* lRetVal=0;
    
    return lRetVal;
}
 10033f0:	b8 00 00 00 00       	mov    eax,0x0
 10033f5:	c3                   	ret    
 10033f6:	66 90                	xchg   ax,ax

010033f8 <mmInitHeapTracking>:
mmInitHeapTracking():
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:32
uint32_t kernelPoolMemorySize=1400000;   //20 MB kernel memory

sMemInfo* heapMemoryInfo;

void mmInitHeapTracking()
{
 10033f8:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:33
    heapMemoryInfo=kmmHeapMemoryBaseAddress;
 10033fb:	a1 04 05 12 00       	mov    eax,ds:0x120504
 1003400:	a3 54 3a 01 01       	mov    ds:0x1013a54,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:34
    printd(DEBUG_MEMORY_MANAGEMENT,"Assigning heapMemoryInfo address of 0x%08X\n",heapMemoryInfo);
 1003405:	50                   	push   eax
 1003406:	68 94 84 00 01       	push   0x1008494
 100340b:	68 00 00 01 00       	push   0x10000
 1003410:	e8 26 f1 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:38
    
    kmmHeapMemoryBaseAddress += sizeof(sMemInfo)*1000;
    kmmHeapMemoryBaseAddress += 0x1000;
    kmmHeapMemoryBaseAddress &= 0xFFFFF000;
 1003415:	a1 04 05 12 00       	mov    eax,ds:0x120504
 100341a:	05 60 7d 00 00       	add    eax,0x7d60
 100341f:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003424:	a3 04 05 12 00       	mov    ds:0x120504,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:39
    kmmHeapMemoryTotal-= sizeof(sMemInfo)*1000; 
 1003429:	81 2d 08 05 12 00 60 	sub    DWORD PTR ds:0x120508,0x6d60
 1003430:	6d 00 00 
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:40
    printd(DEBUG_MEMORY_MANAGEMENT,"heapMemoryInfo = 0x%08X\n",heapMemoryInfo);
 1003433:	83 c4 0c             	add    esp,0xc
 1003436:	ff 35 54 3a 01 01    	push   DWORD PTR ds:0x1013a54
 100343c:	68 7e 76 00 01       	push   0x100767e
 1003441:	68 00 00 01 00       	push   0x10000
 1003446:	e8 f0 f0 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:41
    printd(DEBUG_MEMORY_MANAGEMENT,"Allocating 0x%08X bytes to memory block tracking\n",sizeof(sMemInfo)*1000);
 100344b:	83 c4 0c             	add    esp,0xc
 100344e:	68 60 6d 00 00       	push   0x6d60
 1003453:	68 c0 84 00 01       	push   0x10084c0
 1003458:	68 00 00 01 00       	push   0x10000
 100345d:	e8 d9 f0 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:42
    printd(DEBUG_MEMORY_MANAGEMENT,"User memory base adjusted to 0x%08X\n",kmmHeapMemoryBaseAddress);
 1003462:	83 c4 0c             	add    esp,0xc
 1003465:	ff 35 04 05 12 00    	push   DWORD PTR ds:0x120504
 100346b:	68 f4 84 00 01       	push   0x10084f4
 1003470:	68 00 00 01 00       	push   0x10000
 1003475:	e8 c1 f0 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:43
    printd(DEBUG_MEMORY_MANAGEMENT,"User memory size adjusted to 0x%08X\n",kmmHeapMemoryTotal);
 100347a:	83 c4 0c             	add    esp,0xc
 100347d:	ff 35 08 05 12 00    	push   DWORD PTR ds:0x120508
 1003483:	68 1c 85 00 01       	push   0x100851c
 1003488:	68 00 00 01 00       	push   0x10000
 100348d:	e8 a9 f0 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:45

    heapMemoryInfo->address=kmmHeapMemoryBaseAddress;
 1003492:	a1 54 3a 01 01       	mov    eax,ds:0x1013a54
 1003497:	8b 15 04 05 12 00    	mov    edx,DWORD PTR ds:0x120504
 100349d:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:46
    heapMemoryInfo->size=kmmHeapMemoryTotal;
 10034a0:	8b 15 08 05 12 00    	mov    edx,DWORD PTR ds:0x120508
 10034a6:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:47
    heapMemoryInfo->next=NULL;
 10034a9:	c7 40 18 00 00 00 00 	mov    DWORD PTR [eax+0x18],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:48
    heapMemoryInfo->prior=NULL;
 10034b0:	c7 00 00 00 00 00    	mov    DWORD PTR [eax],0x0
 10034b6:	83 c4 10             	add    esp,0x10
 10034b9:	b8 1c 00 00 00       	mov    eax,0x1c
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:50
    
    for (int cnt=1;cnt<1000;cnt++)
 10034be:	ba 01 00 00 00       	mov    edx,0x1
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:52
    {
        heapMemoryInfo[cnt].address=0;
 10034c3:	89 c1                	mov    ecx,eax
 10034c5:	03 0d 54 3a 01 01    	add    ecx,DWORD PTR ds:0x1013a54
 10034cb:	c7 41 04 00 00 00 00 	mov    DWORD PTR [ecx+0x4],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:53
        heapMemoryInfo[cnt].prior=NULL;
 10034d2:	c7 01 00 00 00 00    	mov    DWORD PTR [ecx],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:54
        if (cnt<999)
 10034d8:	81 fa e6 03 00 00    	cmp    edx,0x3e6
 10034de:	7f 0e                	jg     10034ee <mmInitHeapTracking+0xf6>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:55
            heapMemoryInfo[cnt].next=NULL;
 10034e0:	8b 0d 54 3a 01 01    	mov    ecx,DWORD PTR ds:0x1013a54
 10034e6:	c7 44 01 18 00 00 00 	mov    DWORD PTR [ecx+eax*1+0x18],0x0
 10034ed:	00 
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:56 (discriminator 2)
        heapMemoryInfo[cnt].inUse=false;
 10034ee:	89 c1                	mov    ecx,eax
 10034f0:	03 0d 54 3a 01 01    	add    ecx,DWORD PTR ds:0x1013a54
 10034f6:	c6 41 0c 00          	mov    BYTE PTR [ecx+0xc],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:57 (discriminator 2)
        heapMemoryInfo[cnt].pid=0;
 10034fa:	c7 41 10 00 00 00 00 	mov    DWORD PTR [ecx+0x10],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:58 (discriminator 2)
        heapMemoryInfo[cnt].size=0;
 1003501:	c7 41 08 00 00 00 00 	mov    DWORD PTR [ecx+0x8],0x0
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:50 (discriminator 2)
    heapMemoryInfo->address=kmmHeapMemoryBaseAddress;
    heapMemoryInfo->size=kmmHeapMemoryTotal;
    heapMemoryInfo->next=NULL;
    heapMemoryInfo->prior=NULL;
    
    for (int cnt=1;cnt<1000;cnt++)
 1003508:	83 c2 01             	add    edx,0x1
 100350b:	83 c0 1c             	add    eax,0x1c
 100350e:	81 fa e8 03 00 00    	cmp    edx,0x3e8
 1003514:	75 ad                	jne    10034c3 <mmInitHeapTracking+0xcb>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:60
            heapMemoryInfo[cnt].next=NULL;
        heapMemoryInfo[cnt].inUse=false;
        heapMemoryInfo[cnt].pid=0;
        heapMemoryInfo[cnt].size=0;
    }
}
 1003516:	83 c4 0c             	add    esp,0xc
 1003519:	c3                   	ret    

0100351a <mmInit>:
mmInit():
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:64


void mmInit()
{
 100351a:	56                   	push   esi
 100351b:	53                   	push   ebx
 100351c:	83 ec 04             	sub    esp,0x4
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:66
    //0x10000000 represents segment 0xC0000000-0xCFFFFFFF ... don't want to map anything there for now
    kernelMemoryUsed=kernelStart + kernelSize;
 100351f:	a1 0c 40 00 01       	mov    eax,ds:0x100400c
 1003524:	03 05 08 40 00 01    	add    eax,DWORD PTR ds:0x1004008
 100352a:	a3 50 3a 01 01       	mov    ds:0x1013a50,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:67
    kmmGrossUserMemoryAvailable=kE820MemoryBytes - kernelMemoryUsed;
 100352f:	8b 0d 48 00 12 00    	mov    ecx,DWORD PTR ds:0x120048
 1003535:	8b 1d 4c 00 12 00    	mov    ebx,DWORD PTR ds:0x12004c
 100353b:	89 ca                	mov    edx,ecx
 100353d:	29 c2                	sub    edx,eax
 100353f:	89 15 00 05 12 00    	mov    DWORD PTR ds:0x120500,edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:68
    kmmHeapMemoryTotal=kmmGrossUserMemoryAvailable - kernelPoolMemorySize - kernelMemoryUsed;
 1003545:	8b 35 04 40 00 01    	mov    esi,DWORD PTR ds:0x1004004
 100354b:	29 f2                	sub    edx,esi
 100354d:	29 c2                	sub    edx,eax
 100354f:	89 15 08 05 12 00    	mov    DWORD PTR ds:0x120508,edx
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:69
    kmmHeapMemoryBaseAddress=(kernelMemoryUsed + 0x100000) & 0xFFFFF000 ;
 1003555:	05 00 00 10 00       	add    eax,0x100000
 100355a:	25 00 f0 ff ff       	and    eax,0xfffff000
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:70
    kKernelPoolMemoryAddress=kmmHeapMemoryBaseAddress;
 100355f:	a3 58 3a 01 01       	mov    ds:0x1013a58,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:71
    kmmHeapMemoryBaseAddress+=kernelPoolMemorySize; //Need some page table memory but we don't want to use Malloc while creating page tables to get it
 1003564:	01 f0                	add    eax,esi
 1003566:	a3 04 05 12 00       	mov    ds:0x120504,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:73
    //Setup the base of the heap
    kMallocBaseAddress=kmmHeapMemoryBaseAddress;
 100356b:	a3 fc 04 12 00       	mov    ds:0x1204fc,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:74
    kMallocCurrAddress=kMallocBaseAddress;
 1003570:	a3 f8 04 12 00       	mov    ds:0x1204f8,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:76
    
    printd(DEBUG_MEMORY_MANAGEMENT,"E820 memory total: %u kb\n", kE820MemoryBytes/1024);
 1003575:	0f ac d9 0a          	shrd   ecx,ebx,0xa
 1003579:	c1 eb 0a             	shr    ebx,0xa
 100357c:	53                   	push   ebx
 100357d:	51                   	push   ecx
 100357e:	68 97 76 00 01       	push   0x1007697
 1003583:	68 00 00 01 00       	push   0x10000
 1003588:	e8 ae ef ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:77
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory used by the kernel: %u\n",kernelMemoryUsed);
 100358d:	83 c4 0c             	add    esp,0xc
 1003590:	ff 35 50 3a 01 01    	push   DWORD PTR ds:0x1013a50
 1003596:	68 44 85 00 01       	push   0x1008544
 100359b:	68 00 00 01 00       	push   0x10000
 10035a0:	e8 96 ef ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:78
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory available to mm: %u kb\n",kmmGrossUserMemoryAvailable/1024);
 10035a5:	83 c4 0c             	add    esp,0xc
 10035a8:	a1 00 05 12 00       	mov    eax,ds:0x120500
 10035ad:	c1 e8 0a             	shr    eax,0xa
 10035b0:	50                   	push   eax
 10035b1:	68 64 85 00 01       	push   0x1008564
 10035b6:	68 00 00 01 00       	push   0x10000
 10035bb:	e8 7b ef ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:79
    printd(DEBUG_MEMORY_MANAGEMENT,"Total memory availabe to user applications: %u kb\n",(kmmGrossUserMemoryAvailable - kernelPoolMemorySize)/1024);
 10035c0:	83 c4 0c             	add    esp,0xc
 10035c3:	a1 00 05 12 00       	mov    eax,ds:0x120500
 10035c8:	2b 05 04 40 00 01    	sub    eax,DWORD PTR ds:0x1004004
 10035ce:	c1 e8 0a             	shr    eax,0xa
 10035d1:	50                   	push   eax
 10035d2:	68 84 85 00 01       	push   0x1008584
 10035d7:	68 00 00 01 00       	push   0x10000
 10035dc:	e8 5a ef ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:80
    printd(DEBUG_MEMORY_MANAGEMENT,"Initializing memory manager\n\n");
 10035e1:	83 c4 08             	add    esp,0x8
 10035e4:	68 b1 76 00 01       	push   0x10076b1
 10035e9:	68 00 00 01 00       	push   0x10000
 10035ee:	e8 48 ef ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:81
    printd(DEBUG_MEMORY_MANAGEMENT,"Pool\t\tAddress\t\t\tLength\t\t\n");
 10035f3:	83 c4 08             	add    esp,0x8
 10035f6:	68 cf 76 00 01       	push   0x10076cf
 10035fb:	68 00 00 01 00       	push   0x10000
 1003600:	e8 36 ef ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:82
    printd(DEBUG_MEMORY_MANAGEMENT,"Kernel\t0x%08X\t\t0x%08X\n",kKernelPoolMemoryAddress,kernelPoolMemorySize);
 1003605:	ff 35 04 40 00 01    	push   DWORD PTR ds:0x1004004
 100360b:	ff 35 58 3a 01 01    	push   DWORD PTR ds:0x1013a58
 1003611:	68 e9 76 00 01       	push   0x10076e9
 1003616:	68 00 00 01 00       	push   0x10000
 100361b:	e8 1b ef ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:83
    printd(DEBUG_MEMORY_MANAGEMENT,"User\t\t0x%08X\t\t0x%08X\n",kmmHeapMemoryBaseAddress,kmmHeapMemoryTotal);
 1003620:	83 c4 20             	add    esp,0x20
 1003623:	ff 35 08 05 12 00    	push   DWORD PTR ds:0x120508
 1003629:	ff 35 04 05 12 00    	push   DWORD PTR ds:0x120504
 100362f:	68 00 77 00 01       	push   0x1007700
 1003634:	68 00 00 01 00       	push   0x10000
 1003639:	e8 fd ee ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:85

    mmInitHeapTracking();    
 100363e:	e8 b5 fd ff ff       	call   10033f8 <mmInitHeapTracking>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:88
    //We need to
    uintptr_t startAddr=0x0;
    uintptr_t endAddr= (kernelMemoryUsed + 0x1000) & 0xFFFFF000;
 1003643:	a1 50 3a 01 01       	mov    eax,ds:0x1013a50
 1003648:	8d 98 00 10 00 00    	lea    ebx,[eax+0x1000]
 100364e:	81 e3 00 f0 ff ff    	and    ebx,0xfffff000
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:90
    //Mark everything from the beginning of memory (0xC0000000) to the end of the kernel objects as in-use
    printd(DEBUG_KERNEL_PAGING,"Setting kernel memory range from 0x%08X-0x%08X as in-use\n",startAddr,endAddr);
 1003654:	53                   	push   ebx
 1003655:	6a 00                	push   0x0
 1003657:	68 b8 85 00 01       	push   0x10085b8
 100365c:	68 00 80 00 00       	push   0x8000
 1003661:	e8 d5 ee ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:91
    mmKernelSetPageRangeInUseFlag(startAddr,
 1003666:	83 c4 20             	add    esp,0x20
 1003669:	6a 01                	push   0x1
 100366b:	68 00 10 00 00       	push   0x1000
 1003670:	8d 43 01             	lea    eax,[ebx+0x1]
 1003673:	50                   	push   eax
 1003674:	6a 00                	push   0x0
 1003676:	e8 2c e0 ff ff       	call   10016a7 <mmKernelSetPageRangeInUseFlag>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:97
            endAddr+1,
            0x1000, /*page size*/
            true);
    startAddr+=0xc0000000;
    endAddr+=0xc0000000;
    printd(DEBUG_KERNEL_PAGING,"Setting kernel memory range from 0x%08X-0x%08X as in-use\n",startAddr,endAddr);
 100367b:	8d 83 00 00 00 c0    	lea    eax,[ebx-0x40000000]
 1003681:	50                   	push   eax
 1003682:	68 00 00 00 c0       	push   0xc0000000
 1003687:	68 b8 85 00 01       	push   0x10085b8
 100368c:	68 00 80 00 00       	push   0x8000
 1003691:	e8 a5 ee ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:98
    mmKernelSetPageRangeInUseFlag(startAddr,
 1003696:	83 c4 20             	add    esp,0x20
 1003699:	6a 01                	push   0x1
 100369b:	68 00 10 00 00       	push   0x1000
 10036a0:	81 eb ff ff ff 3f    	sub    ebx,0x3fffffff
 10036a6:	53                   	push   ebx
 10036a7:	68 00 00 00 c0       	push   0xc0000000
 10036ac:	e8 f6 df ff ff       	call   10016a7 <mmKernelSetPageRangeInUseFlag>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:119
//                cursorMoveTo(0,cursorGetPosY()-1);
            }
        }
    }
 */  
    printk("\n");
 10036b1:	c7 04 24 e7 76 00 01 	mov    DWORD PTR [esp],0x10076e7
 10036b8:	e8 66 ee ff ff       	call   1002523 <printk>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:121
    
    printd(DEBUG_KERNEL_PAGING,"Test mallocs:\n");
 10036bd:	83 c4 08             	add    esp,0x8
 10036c0:	68 16 77 00 01       	push   0x1007716
 10036c5:	68 00 80 00 00       	push   0x8000
 10036ca:	e8 6c ee ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:123
    
    uintptr_t* b1 = malloc(10);
 10036cf:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
 10036d6:	e8 67 fc ff ff       	call   1003342 <malloc>
 10036db:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:124
    strcpy(b1,"hello!");
 10036dd:	83 c4 08             	add    esp,0x8
 10036e0:	68 25 77 00 01       	push   0x1007725
 10036e5:	50                   	push   eax
 10036e6:	e8 99 ee ff ff       	call   1002584 <strcpy>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:125
    printd(DEBUG_KERNEL_PAGING,"b1=malloc(1) returned 0x%08X\n\n",b1);
 10036eb:	83 c4 0c             	add    esp,0xc
 10036ee:	53                   	push   ebx
 10036ef:	68 f4 85 00 01       	push   0x10085f4
 10036f4:	68 00 80 00 00       	push   0x8000
 10036f9:	e8 3d ee ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:126
    uintptr_t* b2 = malloc(4095);
 10036fe:	c7 04 24 ff 0f 00 00 	mov    DWORD PTR [esp],0xfff
 1003705:	e8 38 fc ff ff       	call   1003342 <malloc>
 100370a:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:127
    *b2=0xBEEFDEAD;
 100370c:	c7 00 ad de ef be    	mov    DWORD PTR [eax],0xbeefdead
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:128
    printd(DEBUG_KERNEL_PAGING,"b2=malloc(4095) returned 0x%08X\n\n",b2);
 1003712:	83 c4 0c             	add    esp,0xc
 1003715:	50                   	push   eax
 1003716:	68 14 86 00 01       	push   0x1008614
 100371b:	68 00 80 00 00       	push   0x8000
 1003720:	e8 16 ee ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:129
    uintptr_t* b3 = malloc(4096);
 1003725:	c7 04 24 00 10 00 00 	mov    DWORD PTR [esp],0x1000
 100372c:	e8 11 fc ff ff       	call   1003342 <malloc>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:130
    printd(DEBUG_KERNEL_PAGING,"b3=malloc(4096) returned 0x%08X\n\n",b3);
 1003731:	83 c4 0c             	add    esp,0xc
 1003734:	50                   	push   eax
 1003735:	68 38 86 00 01       	push   0x1008638
 100373a:	68 00 80 00 00       	push   0x8000
 100373f:	e8 f7 ed ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:131
    uintptr_t* b4 = malloc(12345);
 1003744:	c7 04 24 39 30 00 00 	mov    DWORD PTR [esp],0x3039
 100374b:	e8 f2 fb ff ff       	call   1003342 <malloc>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:132
    printd(DEBUG_KERNEL_PAGING,"b4=malloc(12345) returned 0x%08X\n\n",b4);
 1003750:	83 c4 0c             	add    esp,0xc
 1003753:	50                   	push   eax
 1003754:	68 5c 86 00 01       	push   0x100865c
 1003759:	68 00 80 00 00       	push   0x8000
 100375e:	e8 d8 ed ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:133
    printd(DEBUG_KERNEL_PAGING,"freeing b2\n");
 1003763:	83 c4 08             	add    esp,0x8
 1003766:	68 2c 77 00 01       	push   0x100772c
 100376b:	68 00 80 00 00       	push   0x8000
 1003770:	e8 c6 ed ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:134
    free(b2);
 1003775:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1003778:	e8 29 fc ff ff       	call   10033a6 <free>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:135
    b2=malloc(100);
 100377d:	c7 04 24 64 00 00 00 	mov    DWORD PTR [esp],0x64
 1003784:	e8 b9 fb ff ff       	call   1003342 <malloc>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:136
    printd(DEBUG_KERNEL_PAGING,"b2=malloc(100) returned 0x%08X\n\n",b2);
 1003789:	83 c4 0c             	add    esp,0xc
 100378c:	50                   	push   eax
 100378d:	68 80 86 00 01       	push   0x1008680
 1003792:	68 00 80 00 00       	push   0x8000
 1003797:	e8 9f ed ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/mm/mm.c:142
    
    return;
    
//    for (int cnt=KERNEL_VIRTUAL_EXEC_ADDRESS;cnt<KERNEL_VIRTUAL_EXEC_ADDRESS+0x10000000;cnt+=4096)
//        pagingMapPage
}
 100379c:	83 c4 14             	add    esp,0x14
 100379f:	5b                   	pop    ebx
 10037a0:	5e                   	pop    esi
 10037a1:	c3                   	ret    
 10037a2:	66 90                	xchg   ax,ax

010037a4 <pagingAllocatePagingTablePage>:
pagingAllocatePagingTablePage():
/home/yogi/src/os/chrisOSKernel/src/paging.c:24
#define PAGE_SIZE 0x1000

uint32_t pagingAllocatePagingTablePage()
{
    uint32_t lRetVal = kKernelPoolMemoryAddress;
    kKernelPoolMemoryAddress+=0x1000;
 10037a4:	81 05 58 3a 01 01 00 	add    DWORD PTR ds:0x1013a58,0x1000
 10037ab:	10 00 00 
/home/yogi/src/os/chrisOSKernel/src/paging.c:25
}
 10037ae:	c3                   	ret    

010037af <pagingGet4kPDEntryValue>:
pagingGet4kPDEntryValue():
/home/yogi/src/os/chrisOSKernel/src/paging.c:28

uint32_t pagingGet4kPDEntryValue(uintptr_t pageDirAddress, uint32_t address)
{
 10037af:	53                   	push   ebx
 10037b0:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/src/paging.c:30
    address&=0xFFFFF000;
    uintptr_t* lTemp=(uint32_t*)((pageDirAddress + (((address & 0xFFC00000) >> 22) << 2)));
 10037b3:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
 10037b7:	c1 eb 16             	shr    ebx,0x16
 10037ba:	c1 e3 02             	shl    ebx,0x2
 10037bd:	03 5c 24 14          	add    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:31
    printd(DEBUG_PAGING,"pagingGet4kPDEntryValue: dirAddressPtr=0x%08x\n", *lTemp);
 10037c1:	ff 33                	push   DWORD PTR [ebx]
 10037c3:	68 90 7a 00 01       	push   0x1007a90
 10037c8:	6a 40                	push   0x40
 10037ca:	e8 6c ed ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:32
    return (uint32_t)*lTemp;
 10037cf:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/src/paging.c:33
}
 10037d1:	83 c4 18             	add    esp,0x18
 10037d4:	5b                   	pop    ebx
 10037d5:	c3                   	ret    

010037d6 <pagingGet4kPDEntryAddress>:
pagingGet4kPDEntryAddress():
/home/yogi/src/os/chrisOSKernel/src/paging.c:36

uint32_t pagingGet4kPDEntryAddress(uintptr_t pageDirAddress, uint32_t address)
{
 10037d6:	53                   	push   ebx
 10037d7:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/chrisOSKernel/src/paging.c:38
    address&=0xFFFFF000;
    uintptr_t lTemp=((pageDirAddress  | (((address & 0xFFC00000) >> 22) << 2)));
 10037da:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
 10037de:	c1 eb 16             	shr    ebx,0x16
 10037e1:	c1 e3 02             	shl    ebx,0x2
 10037e4:	0b 5c 24 14          	or     ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:39
    printd(DEBUG_PAGING,"dirEntryAddress=0x%08x\n", lTemp);
 10037e8:	53                   	push   ebx
 10037e9:	68 c6 73 00 01       	push   0x10073c6
 10037ee:	6a 40                	push   0x40
 10037f0:	e8 46 ed ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:41
    return (uint32_t)lTemp & 0xFFFFFFFF;
}
 10037f5:	89 d8                	mov    eax,ebx
 10037f7:	83 c4 18             	add    esp,0x18
 10037fa:	5b                   	pop    ebx
 10037fb:	c3                   	ret    

010037fc <pagingGet4kPTEntryAddress>:
pagingGet4kPTEntryAddress():
/home/yogi/src/os/chrisOSKernel/src/paging.c:44

uint32_t pagingGet4kPTEntryAddress(uintptr_t pageDirAddress, uint32_t address)
{
 10037fc:	53                   	push   ebx
 10037fd:	83 ec 10             	sub    esp,0x10
 1003800:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/src/os/chrisOSKernel/src/paging.c:46
    address&=0xFFFFF000;
    uintptr_t pDirPtr=pagingGet4kPDEntryValue(pageDirAddress,address) & 0xFFFFF000;
 1003804:	89 d8                	mov    eax,ebx
 1003806:	25 00 f0 ff ff       	and    eax,0xfffff000
 100380b:	50                   	push   eax
 100380c:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003810:	e8 9a ff ff ff       	call   10037af <pagingGet4kPDEntryValue>
/home/yogi/src/os/chrisOSKernel/src/paging.c:47
    return ((address & 0x3FF000) >> 12) << 2 | pDirPtr;
 1003815:	81 e3 00 f0 3f 00    	and    ebx,0x3ff000
 100381b:	c1 eb 0a             	shr    ebx,0xa
 100381e:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003823:	09 d8                	or     eax,ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:48
}
 1003825:	83 c4 18             	add    esp,0x18
 1003828:	5b                   	pop    ebx
 1003829:	c3                   	ret    

0100382a <pagingGet4kPTEntryValue>:
pagingGet4kPTEntryValue():
/home/yogi/src/os/chrisOSKernel/src/paging.c:51

uint32_t pagingGet4kPTEntryValue(uintptr_t pageDirAddress, uint32_t address)
{
 100382a:	53                   	push   ebx
 100382b:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/paging.c:53
    address&=0xFFFFF000;
    uint32_t* pTablePtr=(uint32_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 100382e:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1003832:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003837:	50                   	push   eax
 1003838:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100383c:	e8 bb ff ff ff       	call   10037fc <pagingGet4kPTEntryAddress>
 1003841:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:54
    printd(DEBUG_PAGING,"pagingGet4kPTEntryValue: pageEntryAddress=0x%08X\n", pTablePtr);
 1003843:	83 c4 0c             	add    esp,0xc
 1003846:	50                   	push   eax
 1003847:	68 c0 7a 00 01       	push   0x1007ac0
 100384c:	6a 40                	push   0x40
 100384e:	e8 e8 ec ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:55
    return *pTablePtr;
 1003853:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/src/os/chrisOSKernel/src/paging.c:56
}
 1003855:	83 c4 18             	add    esp,0x18
 1003858:	5b                   	pop    ebx
 1003859:	c3                   	ret    

0100385a <pagingSetPageReadOnlyFlag>:
pagingSetPageReadOnlyFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:59

void pagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly)
{
 100385a:	56                   	push   esi
 100385b:	53                   	push   ebx
 100385c:	83 ec 04             	sub    esp,0x4
 100385f:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1003863:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:60
    printd(DEBUG_PAGING,"pagingMakePageReadOnly: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 1003867:	ff 33                	push   DWORD PTR [ebx]
 1003869:	53                   	push   ebx
 100386a:	68 f4 7a 00 01       	push   0x1007af4
 100386f:	6a 40                	push   0x40
 1003871:	e8 c5 ec ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:61
    if (readOnly)
 1003876:	83 c4 10             	add    esp,0x10
 1003879:	89 f0                	mov    eax,esi
 100387b:	84 c0                	test   al,al
 100387d:	74 05                	je     1003884 <pagingSetPageReadOnlyFlag+0x2a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:62
       *ptEntry&=0xFFFFFFFD;
 100387f:	83 23 fd             	and    DWORD PTR [ebx],0xfffffffd
 1003882:	eb 03                	jmp    1003887 <pagingSetPageReadOnlyFlag+0x2d>
/home/yogi/src/os/chrisOSKernel/src/paging.c:64
    else
       *ptEntry|=2; 
 1003884:	83 0b 02             	or     DWORD PTR [ebx],0x2
/home/yogi/src/os/chrisOSKernel/src/paging.c:65
    RELOAD_CR3
 1003887:	0f 20 d8             	mov    eax,cr3
 100388a:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:66
    printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 100388d:	83 ec 04             	sub    esp,0x4
 1003890:	ff 33                	push   DWORD PTR [ebx]
 1003892:	68 0e 77 00 01       	push   0x100770e
 1003897:	6a 40                	push   0x40
 1003899:	e8 9d ec ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:67
}
 100389e:	83 c4 14             	add    esp,0x14
 10038a1:	5b                   	pop    ebx
 10038a2:	5e                   	pop    esi
 10038a3:	c3                   	ret    

010038a4 <pagingUpdatePTEPresentFlag>:
pagingUpdatePTEPresentFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:70

void pagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present)
{
 10038a4:	56                   	push   esi
 10038a5:	53                   	push   ebx
 10038a6:	83 ec 04             	sub    esp,0x4
 10038a9:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10038ad:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:71
         printd(DEBUG_PAGING,"pagingUpdatePTEPresentFlag: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 10038b1:	ff 33                	push   DWORD PTR [ebx]
 10038b3:	53                   	push   ebx
 10038b4:	68 2c 7b 00 01       	push   0x1007b2c
 10038b9:	6a 40                	push   0x40
 10038bb:	e8 7b ec ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:72
         if (present)
 10038c0:	83 c4 10             	add    esp,0x10
 10038c3:	89 f0                	mov    eax,esi
 10038c5:	84 c0                	test   al,al
 10038c7:	74 05                	je     10038ce <pagingUpdatePTEPresentFlag+0x2a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:73
             *ptEntry=*ptEntry | 1;
 10038c9:	83 0b 01             	or     DWORD PTR [ebx],0x1
 10038cc:	eb 03                	jmp    10038d1 <pagingUpdatePTEPresentFlag+0x2d>
/home/yogi/src/os/chrisOSKernel/src/paging.c:75
         else
             *ptEntry&=0xFFFFFFFE;
 10038ce:	83 23 fe             	and    DWORD PTR [ebx],0xfffffffe
/home/yogi/src/os/chrisOSKernel/src/paging.c:76
         __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
 10038d1:	0f 20 d8             	mov    eax,cr3
 10038d4:	0f 22 d8             	mov    cr3,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:77
         printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 10038d7:	83 ec 04             	sub    esp,0x4
 10038da:	ff 33                	push   DWORD PTR [ebx]
 10038dc:	68 0e 77 00 01       	push   0x100770e
 10038e1:	6a 40                	push   0x40
 10038e3:	e8 53 ec ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:78
}
 10038e8:	83 c4 14             	add    esp,0x14
 10038eb:	5b                   	pop    ebx
 10038ec:	5e                   	pop    esi
 10038ed:	c3                   	ret    

010038ee <pagingSetVirtualRangeRO>:
pagingSetVirtualRangeRO():
/home/yogi/src/os/chrisOSKernel/src/paging.c:81

void pagingSetVirtualRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 10038ee:	55                   	push   ebp
 10038ef:	57                   	push   edi
 10038f0:	56                   	push   esi
 10038f1:	53                   	push   ebx
 10038f2:	83 ec 1c             	sub    esp,0x1c
 10038f5:	8b 5c 24 34          	mov    ebx,DWORD PTR [esp+0x34]
 10038f9:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
 10038fd:	8b 74 24 3c          	mov    esi,DWORD PTR [esp+0x3c]
 1003901:	89 f0                	mov    eax,esi
 1003903:	88 44 24 0f          	mov    BYTE PTR [esp+0xf],al
/home/yogi/src/os/chrisOSKernel/src/paging.c:83
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
 1003907:	57                   	push   edi
 1003908:	53                   	push   ebx
 1003909:	68 68 7b 00 01       	push   0x1007b68
 100390e:	6a 40                	push   0x40
 1003910:	e8 26 ec ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:84
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 1003915:	8d 4f 01             	lea    ecx,[edi+0x1]
 1003918:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
 100391c:	83 c4 10             	add    esp,0x10
 100391f:	39 cb                	cmp    ebx,ecx
 1003921:	77 4f                	ja     1003972 <pagingSetVirtualRangeRO+0x84>
 1003923:	89 f2                	mov    edx,esi
 1003925:	84 d2                	test   dl,dl
 1003927:	b8 e1 73 00 01       	mov    eax,0x10073e1
 100392c:	bd de 73 00 01       	mov    ebp,0x10073de
 1003931:	0f 44 e8             	cmove  ebp,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:88
    {
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 1003934:	0f b6 7c 24 0f       	movzx  edi,BYTE PTR [esp+0xf]
/home/yogi/src/os/chrisOSKernel/src/paging.c:86
{
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
    {
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
 1003939:	83 ec 08             	sub    esp,0x8
 100393c:	53                   	push   ebx
 100393d:	ff 74 24 3c          	push   DWORD PTR [esp+0x3c]
 1003941:	e8 b6 fe ff ff       	call   10037fc <pagingGet4kPTEntryAddress>
 1003946:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:87
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
 1003948:	89 2c 24             	mov    DWORD PTR [esp],ebp
 100394b:	50                   	push   eax
 100394c:	53                   	push   ebx
 100394d:	68 e4 73 00 01       	push   0x10073e4
 1003952:	6a 40                	push   0x40
 1003954:	e8 e2 eb ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:88
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 1003959:	83 c4 18             	add    esp,0x18
 100395c:	57                   	push   edi
 100395d:	56                   	push   esi
 100395e:	e8 18 d9 ff ff       	call   100127b <kPagingSetPageReadOnlyFlag>
/home/yogi/src/os/chrisOSKernel/src/paging.c:84

void pagingSetVirtualRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 1003963:	81 c3 00 10 00 00    	add    ebx,0x1000
 1003969:	83 c4 10             	add    esp,0x10
 100396c:	3b 5c 24 08          	cmp    ebx,DWORD PTR [esp+0x8]
 1003970:	76 c7                	jbe    1003939 <pagingSetVirtualRangeRO+0x4b>
/home/yogi/src/os/chrisOSKernel/src/paging.c:91
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
            
    }
}
 1003972:	83 c4 1c             	add    esp,0x1c
 1003975:	5b                   	pop    ebx
 1003976:	5e                   	pop    esi
 1003977:	5f                   	pop    edi
 1003978:	5d                   	pop    ebp
 1003979:	c3                   	ret    

0100397a <pagingUpdatePresentFlagA>:
pagingUpdatePresentFlagA():
/home/yogi/src/os/chrisOSKernel/src/paging.c:95

//Absolute version, page passed is already virtual
void pagingUpdatePresentFlagA(uintptr_t pageDirAddress, uint32_t address, bool present)
{
 100397a:	56                   	push   esi
 100397b:	53                   	push   ebx
 100397c:	83 ec 04             	sub    esp,0x4
 100397f:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
 1003983:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/src/paging.c:96
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: Make 0x%08X %s\n", address, present?"present":"not present");
 1003987:	84 db                	test   bl,bl
 1003989:	ba fc 73 00 01       	mov    edx,0x10073fc
 100398e:	b8 00 74 00 01       	mov    eax,0x1007400
 1003993:	0f 44 c2             	cmove  eax,edx
 1003996:	50                   	push   eax
 1003997:	56                   	push   esi
 1003998:	68 98 7b 00 01       	push   0x1007b98
 100399d:	6a 40                	push   0x40
 100399f:	e8 97 eb ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:97
        uintptr_t* pagePTE= (uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address&0xFFFFF000);
 10039a4:	83 c4 08             	add    esp,0x8
 10039a7:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 10039ad:	56                   	push   esi
 10039ae:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 10039b2:	e8 45 fe ff ff       	call   10037fc <pagingGet4kPTEntryAddress>
 10039b7:	89 c6                	mov    esi,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:98
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: updating entry 0x%08X\n", pagePTE);
 10039b9:	83 c4 0c             	add    esp,0xc
 10039bc:	50                   	push   eax
 10039bd:	68 c4 7b 00 01       	push   0x1007bc4
 10039c2:	6a 40                	push   0x40
 10039c4:	e8 72 eb ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:99
    pagingUpdatePTEPresentFlag(pagePTE, present);
 10039c9:	83 c4 08             	add    esp,0x8
 10039cc:	0f b6 db             	movzx  ebx,bl
 10039cf:	53                   	push   ebx
 10039d0:	56                   	push   esi
 10039d1:	e8 ce fe ff ff       	call   10038a4 <pagingUpdatePTEPresentFlag>
/home/yogi/src/os/chrisOSKernel/src/paging.c:100
}
 10039d6:	83 c4 14             	add    esp,0x14
 10039d9:	5b                   	pop    ebx
 10039da:	5e                   	pop    esi
 10039db:	c3                   	ret    

010039dc <pagingUpdatePresentFlagV>:
pagingUpdatePresentFlagV():
/home/yogi/src/os/chrisOSKernel/src/paging.c:103

void pagingUpdatePresentFlagV(uintptr_t pageDirAddress,uint32_t address, bool present)
{
 10039dc:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/paging.c:105
    address+=KERNEL_PAGED_BASE_ADDRESS; 
    pagingUpdatePresentFlagA(pageDirAddress,address, present);
 10039df:	0f b6 44 24 1c       	movzx  eax,BYTE PTR [esp+0x1c]
 10039e4:	50                   	push   eax
 10039e5:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 10039e9:	2d 00 00 00 40       	sub    eax,0x40000000
 10039ee:	50                   	push   eax
 10039ef:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 10039f3:	e8 82 ff ff ff       	call   100397a <pagingUpdatePresentFlagA>
/home/yogi/src/os/chrisOSKernel/src/paging.c:106
}
 10039f8:	83 c4 1c             	add    esp,0x1c
 10039fb:	c3                   	ret    

010039fc <pagingMapPage>:
pagingMapPage():
/home/yogi/src/os/chrisOSKernel/src/paging.c:112

///Map a page to a new address
///mapFrom is the original address
///mapTo is the new address that the page will be available at
void pagingMapPage(uintptr_t pageDirAddress, uintptr_t mapTo, uintptr_t mapFrom, uint8_t flags)
{
 10039fc:	55                   	push   ebp
 10039fd:	57                   	push   edi
 10039fe:	56                   	push   esi
 10039ff:	53                   	push   ebx
 1003a00:	83 ec 0c             	sub    esp,0xc
 1003a03:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 1003a07:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
 1003a0b:	8b 5c 24 2c          	mov    ebx,DWORD PTR [esp+0x2c]
/home/yogi/src/os/chrisOSKernel/src/paging.c:120
    uint32_t *ptrT;
    
    //Get pointer to the page directory
    ptr=(uint32_t*)pageDirAddress;
    //Get the appropriate entry in the page table
    ptrVal=ptr[(mapTo>>22)];
 1003a0f:	89 f0                	mov    eax,esi
 1003a11:	c1 e8 16             	shr    eax,0x16
 1003a14:	8d 7c 85 00          	lea    edi,[ebp+eax*4+0x0]
 1003a18:	8b 07                	mov    eax,DWORD PTR [edi]
/home/yogi/src/os/chrisOSKernel/src/paging.c:121
    if (ptrVal==0)
 1003a1a:	85 c0                	test   eax,eax
 1003a1c:	75 46                	jne    1003a64 <pagingMapPage+0x68>
/home/yogi/src/os/chrisOSKernel/src/paging.c:124
    {
        //Get a page for the page table
        *ptrT=(uint32_t*)pagingAllocatePagingTablePage();
 1003a1e:	e8 81 fd ff ff       	call   10037a4 <pagingAllocatePagingTablePage>
/home/yogi/src/os/chrisOSKernel/src/paging.c:125
        printd(DEBUG_PAGING,"pagingMapPage: Page table didn't exist for address 0x%08X (CR3=0x%08X)\n\tAllocated page @ 0x%08X for the page table\n",mapTo,pageDirAddress,  *ptrT);
 1003a23:	83 ec 0c             	sub    esp,0xc
 1003a26:	50                   	push   eax
 1003a27:	55                   	push   ebp
 1003a28:	56                   	push   esi
 1003a29:	68 a4 86 00 01       	push   0x10086a4
 1003a2e:	6a 40                	push   0x40
 1003a30:	e8 06 eb ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:126
        ptr[(mapTo>>22)]=0x20000063;
 1003a35:	c7 07 63 00 00 20    	mov    DWORD PTR [edi],0x20000063
/home/yogi/src/os/chrisOSKernel/src/paging.c:128
        ptrT[(mapTo&0x003FFFFF/4096)]=mapFrom | flags;
        printd(DEBUG_PAGING,"kMapPage: Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)],ptrT[(mapTo&0x003FFFFF/4096)]);
 1003a3b:	83 c4 18             	add    esp,0x18
 1003a3e:	0f b6 db             	movzx  ebx,bl
 1003a41:	0b 5c 24 30          	or     ebx,DWORD PTR [esp+0x30]
 1003a45:	53                   	push   ebx
 1003a46:	89 f0                	mov    eax,esi
 1003a48:	25 ff 03 00 00       	and    eax,0x3ff
 1003a4d:	c1 e0 02             	shl    eax,0x2
 1003a50:	50                   	push   eax
 1003a51:	57                   	push   edi
 1003a52:	56                   	push   esi
 1003a53:	68 f8 7b 00 01       	push   0x1007bf8
 1003a58:	6a 40                	push   0x40
 1003a5a:	e8 dc ea ff ff       	call   100253b <printd>
 1003a5f:	83 c4 20             	add    esp,0x20
 1003a62:	eb 32                	jmp    1003a96 <pagingMapPage+0x9a>
/home/yogi/src/os/chrisOSKernel/src/paging.c:141
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=mapFrom | flags;
 1003a64:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003a69:	89 c2                	mov    edx,eax
 1003a6b:	89 f0                	mov    eax,esi
 1003a6d:	c1 e8 0a             	shr    eax,0xa
 1003a70:	25 fc 0f 00 00       	and    eax,0xffc
 1003a75:	01 d0                	add    eax,edx
 1003a77:	0f b6 db             	movzx  ebx,bl
 1003a7a:	0b 5c 24 28          	or     ebx,DWORD PTR [esp+0x28]
 1003a7e:	89 18                	mov    DWORD PTR [eax],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:142
        printd(DEBUG_PAGING,"2) Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal],ptrT[ptrVal]);
 1003a80:	83 ec 08             	sub    esp,0x8
 1003a83:	53                   	push   ebx
 1003a84:	50                   	push   eax
 1003a85:	57                   	push   edi
 1003a86:	56                   	push   esi
 1003a87:	68 38 7c 00 01       	push   0x1007c38
 1003a8c:	6a 40                	push   0x40
 1003a8e:	e8 a8 ea ff ff       	call   100253b <printd>
 1003a93:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:144
    }
}
 1003a96:	83 c4 0c             	add    esp,0xc
 1003a99:	5b                   	pop    ebx
 1003a9a:	5e                   	pop    esi
 1003a9b:	5f                   	pop    edi
 1003a9c:	5d                   	pop    ebp
 1003a9d:	c3                   	ret    

01003a9e <isPageMapped>:
isPageMapped():
/home/yogi/src/os/chrisOSKernel/src/paging.c:147

bool isPageMapped(uintptr_t pageDirAddress, uintptr_t Address)
{
 1003a9e:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/chrisOSKernel/src/paging.c:148
    if (!pagingGet4kPTEntryValue(pageDirAddress,Address))
 1003aa1:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003aa5:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003aa9:	e8 7c fd ff ff       	call   100382a <pagingGet4kPTEntryValue>
 1003aae:	85 c0                	test   eax,eax
 1003ab0:	0f 95 c0             	setne  al
/home/yogi/src/os/chrisOSKernel/src/paging.c:151
        return false;
    return true;
}
 1003ab3:	83 c4 1c             	add    esp,0x1c
 1003ab6:	c3                   	ret    

01003ab7 <unMapPage>:
unMapPage():
/home/yogi/src/os/chrisOSKernel/src/paging.c:154

void unMapPage(uintptr_t pageDirAddress, uintptr_t mapTo, uint8_t newFlags)
{
 1003ab7:	57                   	push   edi
 1003ab8:	56                   	push   esi
 1003ab9:	53                   	push   ebx
 1003aba:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
 1003abe:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/src/os/chrisOSKernel/src/paging.c:159
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)pageDirAddress;
    ptrVal=ptr[(mapTo>>22)];
 1003ac2:	89 c8                	mov    eax,ecx
 1003ac4:	c1 e8 16             	shr    eax,0x16
 1003ac7:	c1 e0 02             	shl    eax,0x2
 1003aca:	03 44 24 10          	add    eax,DWORD PTR [esp+0x10]
 1003ace:	8b 10                	mov    edx,DWORD PTR [eax]
/home/yogi/src/os/chrisOSKernel/src/paging.c:160
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
 1003ad0:	85 d2                	test   edx,edx
 1003ad2:	75 4b                	jne    1003b1f <unMapPage+0x68>
/home/yogi/src/os/chrisOSKernel/src/paging.c:160 (discriminator 1)
 1003ad4:	bf 00 00 00 00       	mov    edi,0x0
 1003ad9:	3b 3d 4c 00 12 00    	cmp    edi,DWORD PTR ds:0x12004c
 1003adf:	72 08                	jb     1003ae9 <unMapPage+0x32>
 1003ae1:	3b 0d 48 00 12 00    	cmp    ecx,DWORD PTR ds:0x120048
 1003ae7:	73 36                	jae    1003b1f <unMapPage+0x68>
/home/yogi/src/os/chrisOSKernel/src/paging.c:163
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
 1003ae9:	c7 00 63 00 00 20    	mov    DWORD PTR [eax],0x20000063
/home/yogi/src/os/chrisOSKernel/src/paging.c:164
        ptrT[(mapTo&0x003FFFFF/4096)]=0 | newFlags;
 1003aef:	89 ca                	mov    edx,ecx
 1003af1:	81 e2 ff 03 00 00    	and    edx,0x3ff
 1003af7:	8d 34 95 00 00 00 20 	lea    esi,[edx*4+0x20000000]
 1003afe:	0f b6 db             	movzx  ebx,bl
 1003b01:	89 1c 95 00 00 00 20 	mov    DWORD PTR [edx*4+0x20000000],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:165
        printd(DEBUG_PAGING,"kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)]);
 1003b08:	83 ec 0c             	sub    esp,0xc
 1003b0b:	56                   	push   esi
 1003b0c:	50                   	push   eax
 1003b0d:	51                   	push   ecx
 1003b0e:	68 74 7c 00 01       	push   0x1007c74
 1003b13:	6a 40                	push   0x40
 1003b15:	e8 21 ea ff ff       	call   100253b <printd>
 1003b1a:	83 c4 20             	add    esp,0x20
 1003b1d:	eb 2f                	jmp    1003b4e <unMapPage+0x97>
/home/yogi/src/os/chrisOSKernel/src/paging.c:176
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=0 | newFlags;
 1003b1f:	89 d6                	mov    esi,edx
 1003b21:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 1003b27:	89 ca                	mov    edx,ecx
 1003b29:	c1 ea 0a             	shr    edx,0xa
 1003b2c:	81 e2 fc 0f 00 00    	and    edx,0xffc
 1003b32:	01 f2                	add    edx,esi
 1003b34:	0f b6 db             	movzx  ebx,bl
 1003b37:	89 1a                	mov    DWORD PTR [edx],ebx
/home/yogi/src/os/chrisOSKernel/src/paging.c:177
        printd(DEBUG_PAGING,"2) Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal]);
 1003b39:	83 ec 0c             	sub    esp,0xc
 1003b3c:	52                   	push   edx
 1003b3d:	50                   	push   eax
 1003b3e:	51                   	push   ecx
 1003b3f:	68 ac 7c 00 01       	push   0x1007cac
 1003b44:	6a 40                	push   0x40
 1003b46:	e8 f0 e9 ff ff       	call   100253b <printd>
 1003b4b:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:179
    }
}
 1003b4e:	5b                   	pop    ebx
 1003b4f:	5e                   	pop    esi
 1003b50:	5f                   	pop    edi
 1003b51:	c3                   	ret    

01003b52 <pagingSetPhysicalRangeRO>:
pagingSetPhysicalRangeRO():
/home/yogi/src/os/chrisOSKernel/src/paging.c:182

void pagingSetPhysicalRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 1003b52:	83 ec 14             	sub    esp,0x14
 1003b55:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1003b59:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
/home/yogi/src/os/chrisOSKernel/src/paging.c:183
    printd(DEBUG_PAGING,"kMakePhysicalRangeRO: Make 0x%08X(0x%08X)-0x%08X(0x%08X) r/o\n", startAddy, startAddy&0xFffff000, endAddy, endAddy&0xFFFFF000);
 1003b5d:	89 d1                	mov    ecx,edx
 1003b5f:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 1003b65:	51                   	push   ecx
 1003b66:	52                   	push   edx
 1003b67:	89 c2                	mov    edx,eax
 1003b69:	81 e2 00 f0 ff ff    	and    edx,0xfffff000
 1003b6f:	52                   	push   edx
 1003b70:	50                   	push   eax
 1003b71:	68 dc 7c 00 01       	push   0x1007cdc
 1003b76:	6a 40                	push   0x40
 1003b78:	e8 be e9 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:184
        panic("fix this!!!");
 1003b7d:	83 c4 14             	add    esp,0x14
 1003b80:	68 38 77 00 01       	push   0x1007738
 1003b85:	e8 16 e5 ff ff       	call   10020a0 <panic>
/home/yogi/src/os/chrisOSKernel/src/paging.c:186
        //SetVirtualRangeRO((startAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, (endAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, readOnly);
}
 1003b8a:	83 c4 1c             	add    esp,0x1c
 1003b8d:	c3                   	ret    

01003b8e <pagingSetPageInUseFlag>:
pagingSetPageInUseFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:189

void pagingSetPageInUseFlag(uintptr_t pageDirAddress, uintptr_t address, bool inUse)
{
 1003b8e:	56                   	push   esi
 1003b8f:	53                   	push   ebx
 1003b90:	83 ec 04             	sub    esp,0x4
 1003b93:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 1003b97:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
/home/yogi/src/os/chrisOSKernel/src/paging.c:191
    uintptr_t* ptEntry;
    printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 1003b9b:	80 7c 24 18 00       	cmp    BYTE PTR [esp+0x18],0x0
 1003ba0:	74 38                	je     1003bda <pagingSetPageInUseFlag+0x4c>
 1003ba2:	68 0c 74 00 01       	push   0x100740c
 1003ba7:	53                   	push   ebx
 1003ba8:	68 1c 7d 00 01       	push   0x1007d1c
 1003bad:	6a 40                	push   0x40
 1003baf:	e8 87 e9 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:192
    ptEntry=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 1003bb4:	83 c4 08             	add    esp,0x8
 1003bb7:	53                   	push   ebx
 1003bb8:	56                   	push   esi
 1003bb9:	e8 3e fc ff ff       	call   10037fc <pagingGet4kPTEntryAddress>
 1003bbe:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:193
    printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 1003bc0:	ff 30                	push   DWORD PTR [eax]
 1003bc2:	50                   	push   eax
 1003bc3:	68 60 7d 00 01       	push   0x1007d60
 1003bc8:	6a 40                	push   0x40
 1003bca:	e8 6c e9 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:195
    if (inUse)
        *ptEntry|=PAGING_IN_USE_FLAG_MASK;
 1003bcf:	81 0b 00 08 00 00    	or     DWORD PTR [ebx],0x800
 1003bd5:	83 c4 20             	add    esp,0x20
 1003bd8:	eb 36                	jmp    1003c10 <pagingSetPageInUseFlag+0x82>
/home/yogi/src/os/chrisOSKernel/src/paging.c:191
}

void pagingSetPageInUseFlag(uintptr_t pageDirAddress, uintptr_t address, bool inUse)
{
    uintptr_t* ptEntry;
    printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 1003bda:	68 08 74 00 01       	push   0x1007408
 1003bdf:	53                   	push   ebx
 1003be0:	68 1c 7d 00 01       	push   0x1007d1c
 1003be5:	6a 40                	push   0x40
 1003be7:	e8 4f e9 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:192
    ptEntry=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 1003bec:	83 c4 08             	add    esp,0x8
 1003bef:	53                   	push   ebx
 1003bf0:	56                   	push   esi
 1003bf1:	e8 06 fc ff ff       	call   10037fc <pagingGet4kPTEntryAddress>
 1003bf6:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/paging.c:193
    printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 1003bf8:	ff 30                	push   DWORD PTR [eax]
 1003bfa:	50                   	push   eax
 1003bfb:	68 60 7d 00 01       	push   0x1007d60
 1003c00:	6a 40                	push   0x40
 1003c02:	e8 34 e9 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/paging.c:197
    if (inUse)
        *ptEntry|=PAGING_IN_USE_FLAG_MASK;
    else
        *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
 1003c07:	81 23 ff f7 ff ff    	and    DWORD PTR [ebx],0xfffff7ff
 1003c0d:	83 c4 20             	add    esp,0x20
/home/yogi/src/os/chrisOSKernel/src/paging.c:198
}
 1003c10:	83 c4 04             	add    esp,0x4
 1003c13:	5b                   	pop    ebx
 1003c14:	5e                   	pop    esi
 1003c15:	c3                   	ret    

01003c16 <pagingSetPageRangeInUseFlag>:
pagingSetPageRangeInUseFlag():
/home/yogi/src/os/chrisOSKernel/src/paging.c:201

void pagingSetPageRangeInUseFlag(uintptr_t pageDirAddress, uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
 1003c16:	55                   	push   ebp
 1003c17:	57                   	push   edi
 1003c18:	56                   	push   esi
 1003c19:	53                   	push   ebx
 1003c1a:	83 ec 0c             	sub    esp,0xc
 1003c1d:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 1003c21:	8b 5c 24 24          	mov    ebx,DWORD PTR [esp+0x24]
 1003c25:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
 1003c29:	0f b6 44 24 30       	movzx  eax,BYTE PTR [esp+0x30]
/home/yogi/src/os/chrisOSKernel/src/paging.c:202
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 1003c2e:	39 fb                	cmp    ebx,edi
 1003c30:	73 19                	jae    1003c4b <pagingSetPageRangeInUseFlag+0x35>
/home/yogi/src/os/chrisOSKernel/src/paging.c:203 (discriminator 3)
        pagingSetPageInUseFlag(pageDirAddress,cnt,inUse);
 1003c32:	0f b6 f0             	movzx  esi,al
 1003c35:	83 ec 04             	sub    esp,0x4
 1003c38:	56                   	push   esi
 1003c39:	53                   	push   ebx
 1003c3a:	55                   	push   ebp
 1003c3b:	e8 4e ff ff ff       	call   1003b8e <pagingSetPageInUseFlag>
 1003c40:	03 5c 24 3c          	add    ebx,DWORD PTR [esp+0x3c]
/home/yogi/src/os/chrisOSKernel/src/paging.c:202 (discriminator 3)
        *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
}

void pagingSetPageRangeInUseFlag(uintptr_t pageDirAddress, uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 1003c44:	83 c4 10             	add    esp,0x10
 1003c47:	39 fb                	cmp    ebx,edi
 1003c49:	72 ea                	jb     1003c35 <pagingSetPageRangeInUseFlag+0x1f>
/home/yogi/src/os/chrisOSKernel/src/paging.c:204
        pagingSetPageInUseFlag(pageDirAddress,cnt,inUse);
}
 1003c4b:	83 c4 0c             	add    esp,0xc
 1003c4e:	5b                   	pop    ebx
 1003c4f:	5e                   	pop    esi
 1003c50:	5f                   	pop    edi
 1003c51:	5d                   	pop    ebp
 1003c52:	c3                   	ret    
 1003c53:	90                   	nop

01003c54 <syscall169>:
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:25

void syscall169()
{
    uint8_t temp;
 
    __asm__ volatile ("cli"); /* disable all interrupts */
 1003c54:	fa                   	cli    
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1003c55:	e4 64                	in     al,0x64
 1003c57:	89 c2                	mov    edx,eax
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:30
    /* Clear all keyboard buffers (output and command buffers) */
    do
    {
        temp = inb(KBRD_INTRFC); /* empty user data */
        if (check_flag(temp, KBRD_BIT_KDATA) != 0)
 1003c59:	a8 01                	test   al,0x1
 1003c5b:	74 02                	je     1003c5f <syscall169+0xb>
inb():
/home/yogi/src/os/chrisOSKernel/include/io.h:39
 1003c5d:	e4 60                	in     al,0x60
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:32
            inb(KBRD_IO); /* empty keyboard data */
    } while (check_flag(temp, KBRD_BIT_UDATA) != 0);
 1003c5f:	f6 c2 02             	test   dl,0x2
 1003c62:	75 f1                	jne    1003c55 <syscall169+0x1>
outb():
/home/yogi/src/os/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1003c64:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 1003c69:	e6 64                	out    0x64,al
syscall169():
/home/yogi/src/os/chrisOSKernel/src/syscall.c:36 (discriminator 1)
 
    outb(KBRD_INTRFC, KBRD_RESET); /* pulse CPU reset line */
loop:
    __asm__ volatile ("hlt"); /* if that didn't work, halt the CPU */
 1003c6b:	f4                   	hlt    
 1003c6c:	eb fd                	jmp    1003c6b <syscall169+0x17>
 1003c6e:	66 90                	xchg   ax,ax

01003c70 <getTask>:
getTask():
/home/yogi/src/os/chrisOSKernel/src/tss.c:16
extern task_t* kTaskTable;
extern uint32_t kDebugLevel;

///Find an open TSS slot and mark it in use
task_t* getTask()
{
 1003c70:	57                   	push   edi
 1003c71:	56                   	push   esi
 1003c72:	53                   	push   ebx
/home/yogi/src/os/chrisOSKernel/src/tss.c:18
   int cnt=0,slot=0;
   uint32_t* ptr=kTSSSlotAvailableInd;
 1003c73:	8b 1d 48 01 12 00    	mov    ebx,DWORD PTR ds:0x120148
/home/yogi/src/os/chrisOSKernel/src/tss.c:17
extern uint32_t kDebugLevel;

///Find an open TSS slot and mark it in use
task_t* getTask()
{
   int cnt=0,slot=0;
 1003c79:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/chrisOSKernel/src/tss.c:21
   uint32_t* ptr=kTSSSlotAvailableInd;
    while (cnt < TSS_TABLE_RECORD_COUNT/32)
    {
        printd (DEBUG_TASK,"Checking slots at 0x%08X, cnt=%u\n",ptr,cnt);
 1003c7e:	56                   	push   esi
 1003c7f:	53                   	push   ebx
 1003c80:	68 18 87 00 01       	push   0x1008718
 1003c85:	68 00 40 00 00       	push   0x4000
 1003c8a:	e8 ac e8 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/tss.c:22
        slot=bitsScanF(ptr);
 1003c8f:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1003c92:	e8 84 c9 ff ff       	call   100061b <bitsScanF>
 1003c97:	89 c7                	mov    edi,eax
/home/yogi/src/os/chrisOSKernel/src/tss.c:23
        if (slot>-1)
 1003c99:	83 c4 10             	add    esp,0x10
 1003c9c:	85 c0                	test   eax,eax
 1003c9e:	78 4e                	js     1003cee <getTask+0x7e>
/home/yogi/src/os/chrisOSKernel/src/tss.c:25
        {
            task_t* task=&kTaskTable[slot];
 1003ca0:	89 c6                	mov    esi,eax
 1003ca2:	c1 e6 04             	shl    esi,0x4
 1003ca5:	03 35 fc 03 12 00    	add    esi,DWORD PTR ds:0x1203fc
/home/yogi/src/os/chrisOSKernel/src/tss.c:26
            printd(DEBUG_TASK,"TASK: Marking TSS %u used\n",slot);
 1003cab:	83 ec 04             	sub    esp,0x4
 1003cae:	50                   	push   eax
 1003caf:	68 44 77 00 01       	push   0x1007744
 1003cb4:	68 00 40 00 00       	push   0x4000
 1003cb9:	e8 7d e8 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/tss.c:27
            bitsReset(ptr,slot);
 1003cbe:	83 c4 08             	add    esp,0x8
 1003cc1:	57                   	push   edi
 1003cc2:	53                   	push   ebx
 1003cc3:	e8 21 c9 ff ff       	call   10005e9 <bitsReset>
/home/yogi/src/os/chrisOSKernel/src/tss.c:28
            task->tss=&kTSSTable[slot];
 1003cc8:	6b c7 68             	imul   eax,edi,0x68
 1003ccb:	03 05 f8 03 12 00    	add    eax,DWORD PTR ds:0x1203f8
 1003cd1:	89 06                	mov    DWORD PTR [esi],eax
/home/yogi/src/os/chrisOSKernel/src/tss.c:34
            if (slot>0)
            {
                //(task-1)->next=task;
                //task->prev=(task-1);
            }
            printd(DEBUG_TASK,"TASK: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
 1003cd3:	89 04 24             	mov    DWORD PTR [esp],eax
 1003cd6:	56                   	push   esi
 1003cd7:	57                   	push   edi
 1003cd8:	68 3c 87 00 01       	push   0x100873c
 1003cdd:	68 00 40 00 00       	push   0x4000
 1003ce2:	e8 54 e8 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/tss.c:35
            return task;
 1003ce7:	83 c4 20             	add    esp,0x20
 1003cea:	89 f0                	mov    eax,esi
 1003cec:	eb 20                	jmp    1003d0e <getTask+0x9e>
/home/yogi/src/os/chrisOSKernel/src/tss.c:37
        }
        ptr+=4;cnt++;
 1003cee:	83 c3 10             	add    ebx,0x10
 1003cf1:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/chrisOSKernel/src/tss.c:19
///Find an open TSS slot and mark it in use
task_t* getTask()
{
   int cnt=0,slot=0;
   uint32_t* ptr=kTSSSlotAvailableInd;
    while (cnt < TSS_TABLE_RECORD_COUNT/32)
 1003cf4:	83 fe 20             	cmp    esi,0x20
 1003cf7:	75 85                	jne    1003c7e <getTask+0xe>
/home/yogi/src/os/chrisOSKernel/src/tss.c:39
            printd(DEBUG_TASK,"TASK: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
            return task;
        }
        ptr+=4;cnt++;
    }
    panic("tssUseAvailable: Cannot allocate TSS for new task");
 1003cf9:	83 ec 0c             	sub    esp,0xc
 1003cfc:	68 70 87 00 01       	push   0x1008770
 1003d01:	e8 9a e3 ff ff       	call   10020a0 <panic>
/home/yogi/src/os/chrisOSKernel/src/tss.c:40
    return NULL;
 1003d06:	83 c4 10             	add    esp,0x10
 1003d09:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/chrisOSKernel/src/tss.c:41
}
 1003d0e:	5b                   	pop    ebx
 1003d0f:	5e                   	pop    esi
 1003d10:	5f                   	pop    edi
 1003d11:	c3                   	ret    

01003d12 <mmMapKernelIntoTask>:
mmMapKernelIntoTask():
/home/yogi/src/os/chrisOSKernel/src/tss.c:44

void mmMapKernelIntoTask(task_t* task)
{
 1003d12:	57                   	push   edi
 1003d13:	56                   	push   esi
 1003d14:	53                   	push   ebx
 1003d15:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/tss.c:45
    uint32_t debugVal=kDebugLevel;
 1003d19:	8b 3d 38 03 12 00    	mov    edi,DWORD PTR ds:0x120338
/home/yogi/src/os/chrisOSKernel/src/tss.c:46
    kDebugLevel=0;
 1003d1f:	c7 05 38 03 12 00 00 	mov    DWORD PTR ds:0x120338,0x0
 1003d26:	00 00 00 
 1003d29:	bb 00 00 00 c0       	mov    ebx,0xc0000000
/home/yogi/src/os/chrisOSKernel/src/tss.c:48 (discriminator 3)
    for (int cnt=KERNEL_PAGED_BASE_ADDRESS;cnt<KERNEL_PAGED_BASE_ADDRESS+0x0FFFFFFF;cnt+=1000)
        pagingMapPage(task->tss->CR3,cnt,cnt,0x3);
 1003d2e:	6a 03                	push   0x3
 1003d30:	53                   	push   ebx
 1003d31:	53                   	push   ebx
 1003d32:	8b 06                	mov    eax,DWORD PTR [esi]
 1003d34:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 1003d37:	e8 c0 fc ff ff       	call   10039fc <pagingMapPage>
/home/yogi/src/os/chrisOSKernel/src/tss.c:47 (discriminator 3)

void mmMapKernelIntoTask(task_t* task)
{
    uint32_t debugVal=kDebugLevel;
    kDebugLevel=0;
    for (int cnt=KERNEL_PAGED_BASE_ADDRESS;cnt<KERNEL_PAGED_BASE_ADDRESS+0x0FFFFFFF;cnt+=1000)
 1003d3c:	81 c3 e8 03 00 00    	add    ebx,0x3e8
 1003d42:	83 c4 10             	add    esp,0x10
 1003d45:	81 fb 20 02 00 d0    	cmp    ebx,0xd0000220
 1003d4b:	75 e1                	jne    1003d2e <mmMapKernelIntoTask+0x1c>
/home/yogi/src/os/chrisOSKernel/src/tss.c:49
        pagingMapPage(task->tss->CR3,cnt,cnt,0x3);
    kDebugLevel=debugVal;
 1003d4d:	89 3d 38 03 12 00    	mov    DWORD PTR ds:0x120338,edi
/home/yogi/src/os/chrisOSKernel/src/tss.c:50
}
 1003d53:	5b                   	pop    ebx
 1003d54:	5e                   	pop    esi
 1003d55:	5f                   	pop    edi
 1003d56:	c3                   	ret    

01003d57 <createTask>:
createTask():
/home/yogi/src/os/chrisOSKernel/src/tss.c:53

task_t* createTask(bool kernelTSS)
{
 1003d57:	56                   	push   esi
 1003d58:	53                   	push   ebx
 1003d59:	83 ec 04             	sub    esp,0x4
 1003d5c:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/src/os/chrisOSKernel/src/tss.c:54
    task_t* task=getTask();
 1003d60:	e8 0b ff ff ff       	call   1003c70 <getTask>
 1003d65:	89 c3                	mov    ebx,eax
/home/yogi/src/os/chrisOSKernel/src/tss.c:57
    
    
    task->tss->EAX=0;
 1003d67:	8b 00                	mov    eax,DWORD PTR [eax]
 1003d69:	c7 40 28 00 00 00 00 	mov    DWORD PTR [eax+0x28],0x0
/home/yogi/src/os/chrisOSKernel/src/tss.c:58
    task->tss->EBX=task->tss->ECX=task->tss->EDX=task->tss->ESI=task->tss->EDI=task->tss->EBP=0;
 1003d70:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003d72:	c7 40 3c 00 00 00 00 	mov    DWORD PTR [eax+0x3c],0x0
 1003d79:	c7 40 44 00 00 00 00 	mov    DWORD PTR [eax+0x44],0x0
 1003d80:	c7 40 40 00 00 00 00 	mov    DWORD PTR [eax+0x40],0x0
 1003d87:	c7 40 30 00 00 00 00 	mov    DWORD PTR [eax+0x30],0x0
 1003d8e:	c7 40 2c 00 00 00 00 	mov    DWORD PTR [eax+0x2c],0x0
 1003d95:	c7 40 34 00 00 00 00 	mov    DWORD PTR [eax+0x34],0x0
/home/yogi/src/os/chrisOSKernel/src/tss.c:59
    task->tss->SS0=0x10;
 1003d9c:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003d9e:	66 c7 40 0a 10 00    	mov    WORD PTR [eax+0xa],0x10
/home/yogi/src/os/chrisOSKernel/src/tss.c:60
    if (kernelTSS)
 1003da4:	89 f0                	mov    eax,esi
 1003da6:	84 c0                	test   al,al
 1003da8:	74 1c                	je     1003dc6 <createTask+0x6f>
/home/yogi/src/os/chrisOSKernel/src/tss.c:61
        task->tss->ES=task->tss->DS=task->tss->FS=task->tss->GS=0x10;
 1003daa:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003dac:	66 c7 40 5e 10 00    	mov    WORD PTR [eax+0x5e],0x10
 1003db2:	66 c7 40 5a 10 00    	mov    WORD PTR [eax+0x5a],0x10
 1003db8:	66 c7 40 56 10 00    	mov    WORD PTR [eax+0x56],0x10
 1003dbe:	66 c7 40 4a 10 00    	mov    WORD PTR [eax+0x4a],0x10
 1003dc4:	eb 10                	jmp    1003dd6 <createTask+0x7f>
/home/yogi/src/os/chrisOSKernel/src/tss.c:63
    else
        panic("write non-kernel segment pop code");
 1003dc6:	83 ec 0c             	sub    esp,0xc
 1003dc9:	68 a4 87 00 01       	push   0x10087a4
 1003dce:	e8 cd e2 ff ff       	call   10020a0 <panic>
 1003dd3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/chrisOSKernel/src/tss.c:64
    task->tss->IOPB=0xABCD;
 1003dd6:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003dd8:	66 c7 40 64 cd ab    	mov    WORD PTR [eax+0x64],0xabcd
/home/yogi/src/os/chrisOSKernel/src/tss.c:65
    task->tss->CR3=(uint32_t)mallocA1k(0x1000,0x1000);
 1003dde:	8b 33                	mov    esi,DWORD PTR [ebx]
 1003de0:	83 ec 08             	sub    esp,0x8
 1003de3:	68 00 10 00 00       	push   0x1000
 1003de8:	68 00 10 00 00       	push   0x1000
 1003ded:	e8 fe f5 ff ff       	call   10033f0 <mallocA1k>
 1003df2:	89 46 1c             	mov    DWORD PTR [esi+0x1c],eax
/home/yogi/src/os/chrisOSKernel/src/tss.c:66
    printd(DEBUG_TASK,"Malloc'd 1k task page directory @ 0x%08X\n",task->tss->CR3);
 1003df5:	83 c4 0c             	add    esp,0xc
 1003df8:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003dfa:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 1003dfd:	68 c8 87 00 01       	push   0x10087c8
 1003e02:	68 00 40 00 00       	push   0x4000
 1003e07:	e8 2f e7 ff ff       	call   100253b <printd>
/home/yogi/src/os/chrisOSKernel/src/tss.c:67
    task->pageTable=(uint32_t*)task->tss->CR3;
 1003e0c:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003e0e:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1003e11:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
/home/yogi/src/os/chrisOSKernel/src/tss.c:68
    mmMapKernelIntoTask(task);
 1003e14:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1003e17:	e8 f6 fe ff ff       	call   1003d12 <mmMapKernelIntoTask>
/home/yogi/src/os/chrisOSKernel/src/tss.c:70
    return task;
}
 1003e1c:	89 d8                	mov    eax,ebx
 1003e1e:	83 c4 14             	add    esp,0x14
 1003e21:	5b                   	pop    ebx
 1003e22:	5e                   	pop    esi
 1003e23:	c3                   	ret    
