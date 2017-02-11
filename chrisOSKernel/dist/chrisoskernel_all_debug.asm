
Debug/cross-Linux/chrisoskernel:     file format elf32-i386


Disassembly of section .text:

01000000 <update_cursor>:
update_cursor():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:26
KERNEL_DATA_SECTION int8_t savedPosPointer=0;
KERNEL_DATA_SECTION uint8_t kTerminalHeight;

void update_cursor()
 {
    unsigned short position=(terminal_row*VGA_WIDTH) + terminal_column;
 1000000:	8b 0d 00 00 00 02    	mov    ecx,DWORD PTR ds:0x2000000
 1000006:	8d 0c 89             	lea    ecx,[ecx+ecx*4]
 1000009:	c1 e1 04             	shl    ecx,0x4
 100000c:	66 03 0d 04 00 00 02 	add    cx,WORD PTR ds:0x2000004
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:38
    outb(0x3D5, (unsigned char )((position>>8)&0xFF));
    //Move the cursor in the bios data area
 }

uint8_t make_color(enum vga_color fg, enum vga_color bg) {
        return fg | bg << 4;
 100003e:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 1000043:	c1 e0 04             	shl    eax,0x4
 1000046:	0a 44 24 04          	or     al,BYTE PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:39
}
 100004a:	c3                   	ret    

0100004b <make_vgaentry>:
make_vgaentry():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:44

uint16_t make_vgaentry(char c, uint8_t color) {
        uint16_t c16 = c;
        uint16_t color16 = color;
        return c16 | color16 << 8;
 100004b:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 1000050:	c1 e0 08             	shl    eax,0x8
 1000053:	66 0f be 54 24 04    	movsx  dx,BYTE PTR [esp+0x4]
 1000059:	09 d0                	or     eax,edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:45
}
 100005b:	c3                   	ret    

0100005c <terminal_setcolor>:
terminal_setcolor():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:49


void terminal_setcolor(uint8_t color) {
        terminal_color = color;
 100005c:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1000060:	a2 08 00 00 02       	mov    ds:0x2000008,al
 1000065:	c3                   	ret    

01000066 <terminal_putentryat>:
terminal_putentryat():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:52
}

void terminal_putentryat(char c, uint8_t color, size_t x, size_t y) {
 1000066:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:54
    const size_t index = y * VGA_WIDTH + x;
        terminal_buffer[index] = make_vgaentry(c, color);
 100006a:	8d 04 80             	lea    eax,[eax+eax*4]
 100006d:	c1 e0 04             	shl    eax,0x4
 1000070:	03 44 24 0c          	add    eax,DWORD PTR [esp+0xc]
 1000074:	0f b6 54 24 08       	movzx  edx,BYTE PTR [esp+0x8]
 1000079:	c1 e2 08             	shl    edx,0x8
 100007c:	66 0f be 4c 24 04    	movsx  cx,BYTE PTR [esp+0x4]
 1000082:	09 ca                	or     edx,ecx
 1000084:	8b 0d 0c 00 00 02    	mov    ecx,DWORD PTR ds:0x200000c
 100008a:	66 89 14 41          	mov    WORD PTR [ecx+eax*2],dx
 100008e:	c3                   	ret    

0100008f <cursorSavePosition>:
cursorSavePosition():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:59
}

void cursorSavePosition()
{
    if (savedPosPointer < 10)
 100008f:	0f b6 05 26 00 00 02 	movzx  eax,BYTE PTR ds:0x2000026
 1000096:	3c 09                	cmp    al,0x9
 1000098:	7f 23                	jg     10000bd <cursorSavePosition+0x2e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:61
    {
        savedPosX[++savedPosPointer] = terminal_column;
 100009a:	83 c0 01             	add    eax,0x1
 100009d:	a2 26 00 00 02       	mov    ds:0x2000026,al
 10000a2:	0f be c0             	movsx  eax,al
 10000a5:	8b 15 04 00 00 02    	mov    edx,DWORD PTR ds:0x2000004
 10000ab:	88 90 10 00 00 02    	mov    BYTE PTR [eax+0x2000010],dl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:62
        savedPosY[savedPosPointer] = terminal_row;
 10000b1:	8b 15 00 00 00 02    	mov    edx,DWORD PTR ds:0x2000000
 10000b7:	88 90 1c 00 00 02    	mov    BYTE PTR [eax+0x200001c],dl
 10000bd:	f3 c3                	repz ret 

010000bf <cursorRestorePosition>:
cursorRestorePosition():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:68
    }
}

void cursorRestorePosition()
{
    if (savedPosPointer > 0)
 10000bf:	0f b6 05 26 00 00 02 	movzx  eax,BYTE PTR ds:0x2000026
 10000c6:	84 c0                	test   al,al
 10000c8:	7e 29                	jle    10000f3 <cursorRestorePosition+0x34>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:70
    {
        terminal_column = savedPosX[savedPosPointer];
 10000ca:	0f be d0             	movsx  edx,al
 10000cd:	0f b6 8a 10 00 00 02 	movzx  ecx,BYTE PTR [edx+0x2000010]
 10000d4:	89 0d 04 00 00 02    	mov    DWORD PTR ds:0x2000004,ecx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:71
        terminal_row = savedPosY[savedPosPointer--];
 10000da:	83 e8 01             	sub    eax,0x1
 10000dd:	a2 26 00 00 02       	mov    ds:0x2000026,al
 10000e2:	0f b6 82 1c 00 00 02 	movzx  eax,BYTE PTR [edx+0x200001c]
 10000e9:	a3 00 00 00 02       	mov    ds:0x2000000,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:72
        update_cursor();
 10000ee:	e8 0d ff ff ff       	call   1000000 <update_cursor>
 10000f3:	f3 c3                	repz ret 

010000f5 <terminal_clear>:
terminal_clear():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:77
    }
}

void terminal_clear()
{
 10000f5:	56                   	push   esi
 10000f6:	53                   	push   ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:79
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
 10000f7:	ba 00 00 00 00       	mov    edx,0x0
 10000fc:	be 00 00 00 00       	mov    esi,0x0
 1000101:	80 3d 27 00 00 02 00 	cmp    BYTE PTR ds:0x2000027,0x0
 1000108:	75 30                	jne    100013a <terminal_clear+0x45>
 100010a:	eb 36                	jmp    1000142 <terminal_clear+0x4d>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:82 (discriminator 3)
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
 100010c:	0f b6 05 08 00 00 02 	movzx  eax,BYTE PTR ds:0x2000008
 1000113:	c1 e0 08             	shl    eax,0x8
 1000116:	83 c8 20             	or     eax,0x20
 1000119:	8b 0d 0c 00 00 02    	mov    ecx,DWORD PTR ds:0x200000c
 100011f:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
 1000123:	83 c2 02             	add    edx,0x2
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:80 (discriminator 3)

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
                for (size_t x = 0; x < VGA_WIDTH; x++) {
 1000126:	39 d3                	cmp    ebx,edx
 1000128:	75 e2                	jne    100010c <terminal_clear+0x17>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:79 (discriminator 2)
}

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
 100012a:	83 c6 01             	add    esi,0x1
 100012d:	89 da                	mov    edx,ebx
 100012f:	0f b6 05 27 00 00 02 	movzx  eax,BYTE PTR ds:0x2000027
 1000136:	39 f0                	cmp    eax,esi
 1000138:	76 08                	jbe    1000142 <terminal_clear+0x4d>
 100013a:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
 1000140:	eb ca                	jmp    100010c <terminal_clear+0x17>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:85
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
                }
        }
    terminal_column=0;
 1000142:	c7 05 04 00 00 02 00 	mov    DWORD PTR ds:0x2000004,0x0
 1000149:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:86
    terminal_row=0;
 100014c:	c7 05 00 00 00 02 00 	mov    DWORD PTR ds:0x2000000,0x0
 1000153:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:87
    update_cursor();
 1000156:	e8 a5 fe ff ff       	call   1000000 <update_cursor>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:88
}
 100015b:	5b                   	pop    ebx
 100015c:	5e                   	pop    esi
 100015d:	c3                   	ret    

0100015e <terminal_clear_line>:
terminal_clear_line():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:91

void terminal_clear_line(unsigned lineNo)
{
 100015e:	53                   	push   ebx
 100015f:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:92
    if (lineNo>SYS_VGA_HEIGHT-1)
 1000163:	83 f8 31             	cmp    eax,0x31
 1000166:	77 2a                	ja     1000192 <terminal_clear_line+0x34>
 1000168:	8d 14 80             	lea    edx,[eax+eax*4]
 100016b:	c1 e2 05             	shl    edx,0x5
 100016e:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:97 (discriminator 3)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
 1000174:	0f b6 05 08 00 00 02 	movzx  eax,BYTE PTR ds:0x2000008
 100017b:	c1 e0 08             	shl    eax,0x8
 100017e:	83 c8 20             	or     eax,0x20
 1000181:	8b 0d 0c 00 00 02    	mov    ecx,DWORD PTR ds:0x200000c
 1000187:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
 100018b:	83 c2 02             	add    edx,0x2
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:94 (discriminator 3)

void terminal_clear_line(unsigned lineNo)
{
    if (lineNo>SYS_VGA_HEIGHT-1)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
 100018e:	39 da                	cmp    edx,ebx
 1000190:	75 e2                	jne    1000174 <terminal_clear_line+0x16>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:99
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
    }
}
 1000192:	5b                   	pop    ebx
 1000193:	c3                   	ret    

01000194 <terminal_copyline>:
terminal_copyline():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:102

void terminal_copyline(unsigned dstLine, unsigned srcLine)
{
 1000194:	83 ec 10             	sub    esp,0x10
 1000197:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
 100019b:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:107
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
 10001bc:	e8 fb 1d 00 00       	call   1001fbc <memcpy>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:108
}
 10001c1:	83 c4 1c             	add    esp,0x1c
 10001c4:	c3                   	ret    

010001c5 <terminal_putchar>:
terminal_putchar():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:110

void terminal_putchar(char c) {
 10001c5:	53                   	push   ebx
 10001c6:	83 ec 08             	sub    esp,0x8
 10001c9:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:111
    if (c=='\n')
 10001cd:	3c 0a                	cmp    al,0xa
 10001cf:	75 16                	jne    10001e7 <terminal_putchar+0x22>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:113
    {
            terminal_column = 0;
 10001d1:	c7 05 04 00 00 02 00 	mov    DWORD PTR ds:0x2000004,0x0
 10001d8:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:114
            terminal_row += 1;
 10001db:	83 05 00 00 00 02 01 	add    DWORD PTR ds:0x2000000,0x1
 10001e2:	e9 d8 00 00 00       	jmp    10002bf <terminal_putchar+0xfa>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:116
    }
    else if (c=='\b')
 10001e7:	3c 08                	cmp    al,0x8
 10001e9:	75 48                	jne    1000233 <terminal_putchar+0x6e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:118
    {
        if (terminal_column > 1)
 10001eb:	a1 04 00 00 02       	mov    eax,ds:0x2000004
 10001f0:	83 f8 01             	cmp    eax,0x1
 10001f3:	76 0a                	jbe    10001ff <terminal_putchar+0x3a>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:119
            terminal_column--;
 10001f5:	83 e8 01             	sub    eax,0x1
 10001f8:	a3 04 00 00 02       	mov    ds:0x2000004,eax
 10001fd:	eb 11                	jmp    1000210 <terminal_putchar+0x4b>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:122
        else
        {
            terminal_row--;
 10001ff:	83 2d 00 00 00 02 01 	sub    DWORD PTR ds:0x2000000,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:123
            terminal_column=VGA_WIDTH;
 1000206:	c7 05 04 00 00 02 50 	mov    DWORD PTR ds:0x2000004,0x50
 100020d:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:125
        }
        terminal_putentryat(' ', terminal_color, terminal_column, terminal_row);
 1000210:	ff 35 00 00 00 02    	push   DWORD PTR ds:0x2000000
 1000216:	ff 35 04 00 00 02    	push   DWORD PTR ds:0x2000004
 100021c:	0f b6 05 08 00 00 02 	movzx  eax,BYTE PTR ds:0x2000008
 1000223:	50                   	push   eax
 1000224:	6a 20                	push   0x20
 1000226:	e8 3b fe ff ff       	call   1000066 <terminal_putentryat>
 100022b:	83 c4 10             	add    esp,0x10
 100022e:	e9 8c 00 00 00       	jmp    10002bf <terminal_putchar+0xfa>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:128
        
    }
    else if (c=='\t')
 1000233:	3c 09                	cmp    al,0x9
 1000235:	75 3b                	jne    1000272 <terminal_putchar+0xad>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:130
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
 1000237:	8b 0d 04 00 00 02    	mov    ecx,DWORD PTR ds:0x2000004
 100023d:	ba cd cc cc cc       	mov    edx,0xcccccccd
 1000242:	89 c8                	mov    eax,ecx
 1000244:	f7 e2                	mul    edx
 1000246:	c1 ea 02             	shr    edx,0x2
 1000249:	8d 5c 92 05          	lea    ebx,[edx+edx*4+0x5]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:132
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
 100024d:	39 d9                	cmp    ecx,ebx
 100024f:	b8 05 00 00 00       	mov    eax,0x5
 1000254:	0f 44 d8             	cmove  ebx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:134
        
        while (terminal_column < goTo)
 1000257:	39 d9                	cmp    ecx,ebx
 1000259:	73 64                	jae    10002bf <terminal_putchar+0xfa>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:135
            terminal_putchar(' ');;
 100025b:	83 ec 0c             	sub    esp,0xc
 100025e:	6a 20                	push   0x20
 1000260:	e8 60 ff ff ff       	call   10001c5 <terminal_putchar>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:134
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
        
        while (terminal_column < goTo)
 1000265:	83 c4 10             	add    esp,0x10
 1000268:	3b 1d 04 00 00 02    	cmp    ebx,DWORD PTR ds:0x2000004
 100026e:	77 eb                	ja     100025b <terminal_putchar+0x96>
 1000270:	eb 4d                	jmp    10002bf <terminal_putchar+0xfa>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:141
    
    //6 - cnt=0 to (5-1) 4
    //8 - cnt= to (5-3) 2
    }
    //We're going to ignore carriage return since most systems don't use it.  Unfortunately the FAT library we are using does
    else if (c=='\r')
 1000272:	3c 0d                	cmp    al,0xd
 1000274:	0f 84 86 00 00 00    	je     1000300 <terminal_putchar+0x13b>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:146
        return;

        else
        {
                terminal_putentryat(c, terminal_color, terminal_column, terminal_row);
 100027a:	ff 35 00 00 00 02    	push   DWORD PTR ds:0x2000000
 1000280:	ff 35 04 00 00 02    	push   DWORD PTR ds:0x2000004
 1000286:	0f b6 15 08 00 00 02 	movzx  edx,BYTE PTR ds:0x2000008
 100028d:	52                   	push   edx
 100028e:	0f be c0             	movsx  eax,al
 1000291:	50                   	push   eax
 1000292:	e8 cf fd ff ff       	call   1000066 <terminal_putentryat>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:147
                if (++terminal_column == VGA_WIDTH) {
 1000297:	a1 04 00 00 02       	mov    eax,ds:0x2000004
 100029c:	83 c0 01             	add    eax,0x1
 100029f:	83 c4 10             	add    esp,0x10
 10002a2:	83 f8 50             	cmp    eax,0x50
 10002a5:	74 07                	je     10002ae <terminal_putchar+0xe9>
 10002a7:	a3 04 00 00 02       	mov    ds:0x2000004,eax
 10002ac:	eb 11                	jmp    10002bf <terminal_putchar+0xfa>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:148
                        terminal_column = 0;
 10002ae:	c7 05 04 00 00 02 00 	mov    DWORD PTR ds:0x2000004,0x0
 10002b5:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:149
                        terminal_row++;
 10002b8:	83 05 00 00 00 02 01 	add    DWORD PTR ds:0x2000000,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:152
                }
        }
    if (terminal_row == kTerminalHeight)
 10002bf:	0f b6 05 27 00 00 02 	movzx  eax,BYTE PTR ds:0x2000027
 10002c6:	3b 05 00 00 00 02    	cmp    eax,DWORD PTR ds:0x2000000
 10002cc:	75 2d                	jne    10002fb <terminal_putchar+0x136>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:154 (discriminator 1)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
 10002ce:	85 c0                	test   eax,eax
 10002d0:	74 22                	je     10002f4 <terminal_putchar+0x12f>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:154
 10002d2:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:155 (discriminator 3)
            terminal_copyline(row, row+1);
 10002d7:	8d 58 01             	lea    ebx,[eax+0x1]
 10002da:	83 ec 08             	sub    esp,0x8
 10002dd:	53                   	push   ebx
 10002de:	50                   	push   eax
 10002df:	e8 b0 fe ff ff       	call   1000194 <terminal_copyline>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:154 (discriminator 3)
                        terminal_row++;
                }
        }
    if (terminal_row == kTerminalHeight)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
 10002e4:	89 d8                	mov    eax,ebx
 10002e6:	0f b6 15 27 00 00 02 	movzx  edx,BYTE PTR ds:0x2000027
 10002ed:	83 c4 10             	add    esp,0x10
 10002f0:	39 da                	cmp    edx,ebx
 10002f2:	77 e3                	ja     10002d7 <terminal_putchar+0x112>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:157
            terminal_copyline(row, row+1);
        //memcpy((void *)TEXTMODE_MEMORY_START, (void *)TEXTMODE_MEMORY_START+160, 160*25);
        terminal_row--;
 10002f4:	83 2d 00 00 00 02 01 	sub    DWORD PTR ds:0x2000000,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:159
    }
    update_cursor();
 10002fb:	e8 00 fd ff ff       	call   1000000 <update_cursor>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:160
}
 1000300:	83 c4 08             	add    esp,0x8
 1000303:	5b                   	pop    ebx
 1000304:	c3                   	ret    

01000305 <cursorUpdateBiosCursor>:
cursorUpdateBiosCursor():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:165

void cursorUpdateBiosCursor()
{
    uint8_t* bda=(uint8_t*)0x450;
    *bda=(uint8_t)(terminal_column & 0xFF);
 1000305:	a1 04 00 00 02       	mov    eax,ds:0x2000004
 100030a:	a2 50 04 00 00       	mov    ds:0x450,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:167
    bda++;
    *bda=(uint8_t)((terminal_row+3) & 0xFF);
 100030f:	0f b6 05 00 00 00 02 	movzx  eax,BYTE PTR ds:0x2000000
 1000316:	83 c0 03             	add    eax,0x3
 1000319:	a2 51 04 00 00       	mov    ds:0x451,al
 100031e:	c3                   	ret    

0100031f <cursorMoveTo>:
cursorMoveTo():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:172
}

void cursorMoveTo(uint8_t x, uint8_t y)
{
    terminal_row = y;
 100031f:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 1000324:	a3 00 00 00 02       	mov    ds:0x2000000,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:173
    terminal_column = x;
 1000329:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 100032e:	a3 04 00 00 02       	mov    ds:0x2000004,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:174
    update_cursor();
 1000333:	e8 c8 fc ff ff       	call   1000000 <update_cursor>
 1000338:	f3 c3                	repz ret 

0100033a <cursorMoveToX>:
cursorMoveToX():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:179
}

void cursorMoveToX(uint8_t x)
{
    terminal_column = x;
 100033a:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 100033f:	a3 04 00 00 02       	mov    ds:0x2000004,eax
 1000344:	c3                   	ret    

01000345 <cursorMoveToY>:
cursorMoveToY():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:184
}

void cursorMoveToY(uint8_t y)
{
    terminal_row = y;
 1000345:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 100034a:	a3 00 00 00 02       	mov    ds:0x2000000,eax
 100034f:	c3                   	ret    

01000350 <cursorGetPosX>:
cursorGetPosX():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:190
}

uint8_t cursorGetPosX()
{
    return terminal_column;
}
 1000350:	0f b6 05 04 00 00 02 	movzx  eax,BYTE PTR ds:0x2000004
 1000357:	c3                   	ret    

01000358 <cursorGetMaxX>:
cursorGetMaxX():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:194
int cursorGetMaxX()
{
    return VGA_WIDTH;
}
 1000358:	b8 50 00 00 00       	mov    eax,0x50
 100035d:	c3                   	ret    

0100035e <cursorGetMaxY>:
cursorGetMaxY():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:198

int cursorGetMaxY()
{
    return kTerminalHeight;
 100035e:	0f b6 05 27 00 00 02 	movzx  eax,BYTE PTR ds:0x2000027
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:199
}
 1000365:	c3                   	ret    

01000366 <displayGetMaxXY>:
displayGetMaxXY():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:203

void displayGetMaxXY(int* maxX, int* maxY)
{
    *maxX=VGA_WIDTH;
 1000366:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 100036a:	c7 00 50 00 00 00    	mov    DWORD PTR [eax],0x50
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:204
    *maxY=kTerminalHeight;
 1000370:	0f b6 15 27 00 00 02 	movzx  edx,BYTE PTR ds:0x2000027
 1000377:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100037b:	89 10                	mov    DWORD PTR [eax],edx
 100037d:	c3                   	ret    

0100037e <cursorGetPosY>:
cursorGetPosY():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:211
}

uint8_t cursorGetPosY()
{
    return terminal_row;
}
 100037e:	0f b6 05 00 00 00 02 	movzx  eax,BYTE PTR ds:0x2000000
 1000385:	c3                   	ret    

01000386 <kTermPrint>:
kTermPrint():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:213

void kTermPrint(const char* data) {
 1000386:	56                   	push   esi
 1000387:	53                   	push   ebx
 1000388:	83 ec 10             	sub    esp,0x10
 100038b:	8b 74 24 1c          	mov    esi,DWORD PTR [esp+0x1c]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:214
        size_t datalen = strlen(data);
 100038f:	56                   	push   esi
 1000390:	e8 3f 22 00 00       	call   10025d4 <strlen>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:215
        for (size_t i = 0; i < datalen; i++)
 1000395:	83 c4 10             	add    esp,0x10
 1000398:	85 c0                	test   eax,eax
 100039a:	74 1a                	je     10003b6 <kTermPrint+0x30>
 100039c:	89 f3                	mov    ebx,esi
 100039e:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:216 (discriminator 3)
                terminal_putchar(data[i]);
 10003a0:	83 ec 0c             	sub    esp,0xc
 10003a3:	0f be 13             	movsx  edx,BYTE PTR [ebx]
 10003a6:	52                   	push   edx
 10003a7:	e8 19 fe ff ff       	call   10001c5 <terminal_putchar>
 10003ac:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:215 (discriminator 3)
    return terminal_row;
}

void kTermPrint(const char* data) {
        size_t datalen = strlen(data);
        for (size_t i = 0; i < datalen; i++)
 10003af:	83 c4 10             	add    esp,0x10
 10003b2:	39 f3                	cmp    ebx,esi
 10003b4:	75 ea                	jne    10003a0 <kTermPrint+0x1a>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:217
                terminal_putchar(data[i]);
}
 10003b6:	83 c4 04             	add    esp,0x4
 10003b9:	5b                   	pop    ebx
 10003ba:	5e                   	pop    esi
 10003bb:	c3                   	ret    

010003bc <kTermInit>:
kTermInit():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:221


void kTermInit() {
    kTerminalHeight=SYS_VGA_HEIGHT;
 10003bc:	c6 05 27 00 00 02 32 	mov    BYTE PTR ds:0x2000027,0x32
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:222
    terminal_row = 0;
 10003c3:	c7 05 00 00 00 02 00 	mov    DWORD PTR ds:0x2000000,0x0
 10003ca:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:223
    terminal_column = 0;
 10003cd:	c7 05 04 00 00 02 00 	mov    DWORD PTR ds:0x2000004,0x0
 10003d4:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:224
    terminal_color = make_color(COLOR_LIGHT_BROWN, COLOR_BLACK);
 10003d7:	c6 05 08 00 00 02 0e 	mov    BYTE PTR ds:0x2000008,0xe
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:225
    terminal_buffer = (uint16_t*) TEXTMODE_MEMORY_START;
 10003de:	c7 05 0c 00 00 02 00 	mov    DWORD PTR ds:0x200000c,0xb8000
 10003e5:	80 0b 00 
 10003e8:	c3                   	ret    

010003e9 <puts>:
puts():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:230
    //terminal_clear();
}

void puts(char* in)
{
 10003e9:	53                   	push   ebx
 10003ea:	83 ec 08             	sub    esp,0x8
 10003ed:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:231
    while (*in>'\0')
 10003f1:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 10003f4:	84 c0                	test   al,al
 10003f6:	7e 19                	jle    1000411 <puts+0x28>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:233
    {
        terminal_putchar(*in++);
 10003f8:	83 c3 01             	add    ebx,0x1
 10003fb:	83 ec 0c             	sub    esp,0xc
 10003fe:	0f be c0             	movsx  eax,al
 1000401:	50                   	push   eax
 1000402:	e8 be fd ff ff       	call   10001c5 <terminal_putchar>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:231
    //terminal_clear();
}

void puts(char* in)
{
    while (*in>'\0')
 1000407:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 100040a:	83 c4 10             	add    esp,0x10
 100040d:	84 c0                	test   al,al
 100040f:	7f e7                	jg     10003f8 <puts+0xf>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:235
    {
        terminal_putchar(*in++);
    }
}
 1000411:	83 c4 08             	add    esp,0x8
 1000414:	5b                   	pop    ebx
 1000415:	c3                   	ret    

01000416 <putc>:
putc():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:238

void putc(char c)
{
 1000416:	83 ec 18             	sub    esp,0x18
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:239
    terminal_putchar(c);
 1000419:	0f be 44 24 1c       	movsx  eax,BYTE PTR [esp+0x1c]
 100041e:	50                   	push   eax
 100041f:	e8 a1 fd ff ff       	call   10001c5 <terminal_putchar>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/console/basic_display.c:240
 1000424:	83 c4 1c             	add    esp,0x1c
 1000427:	c3                   	ret    

01000428 <keyboardGetKeyFromBuffer>:
keyboardGetKeyFromBuffer():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:20
//Base moves when a key is taken from the buffer
uint8_t keyboardGetKeyFromBuffer()
{
    char lTemp=0;
    //printd(DEBUG_KEYBOARD,"\nkKeyboardBuffer=0x%08X, kKeyboardBufferBase=0x%08X, &kKeyboardBufferBase=0x%08X\n",kKeyboardBuffer, kKeyboardBufferBase,&kKeyboardBufferBase);
    if (kKeyboardBufferBase<=kKeyboardBuffer)
 1000428:	a1 24 04 00 02       	mov    eax,ds:0x2000424
 100042d:	8b 15 e0 03 00 02    	mov    edx,DWORD PTR ds:0x20003e0
 1000433:	39 d0                	cmp    eax,edx
 1000435:	77 14                	ja     100044b <keyboardGetKeyFromBuffer+0x23>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:22
    {
        __asm__("cli\n");
 1000437:	fa                   	cli    
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:23
        lTemp=*kKeyboardBufferBase++;
 1000438:	8d 48 01             	lea    ecx,[eax+0x1]
 100043b:	89 0d 24 04 00 02    	mov    DWORD PTR ds:0x2000424,ecx
 1000441:	0f b6 00             	movzx  eax,BYTE PTR [eax]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:24
        __asm__("sti\n");
 1000444:	fb                   	sti    
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:26
    }
    if (kKeyboardBufferBase>kKeyboardBuffer)
 1000445:	39 ca                	cmp    edx,ecx
 1000447:	73 1d                	jae    1000466 <keyboardGetKeyFromBuffer+0x3e>
 1000449:	eb 05                	jmp    1000450 <keyboardGetKeyFromBuffer+0x28>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:18
//Get a key from the keyboard buffer
//Curr moves when a key is put into the buffer
//Base moves when a key is taken from the buffer
uint8_t keyboardGetKeyFromBuffer()
{
    char lTemp=0;
 100044b:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:28
        lTemp=*kKeyboardBufferBase++;
        __asm__("sti\n");
    }
    if (kKeyboardBufferBase>kKeyboardBuffer)
    {
        __asm__("cli\n");
 1000450:	fa                   	cli    
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:29
        kKeyboardBufferBase=(char*)KEYBOARD_BUFFER_ADDRESS;
 1000451:	c7 05 24 04 00 02 c0 	mov    DWORD PTR ds:0x2000424,0x2832c0
 1000458:	32 28 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:30
        kKeyboardBuffer=(char*)KEYBOARD_BUFFER_ADDRESS-1;
 100045b:	c7 05 e0 03 00 02 bf 	mov    DWORD PTR ds:0x20003e0,0x2832bf
 1000462:	32 28 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:31
        __asm__("sti\n");
 1000465:	fb                   	sti    
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:34
    }
    return lTemp;
}
 1000466:	f3 c3                	repz ret 

01000468 <waitForKeyboardKey>:
waitForKeyboardKey():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:37

char waitForKeyboardKey()
{
 1000468:	53                   	push   ebx
 1000469:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:38
    printd(DEBUG_KEYBOARD,"gKbd-W, %04X\t", kKeyboardBuffer);
 100046c:	ff 35 e0 03 00 02    	push   DWORD PTR ds:0x20003e0
 1000472:	68 70 61 00 01       	push   0x1006170
 1000477:	6a 10                	push   0x10
 1000479:	e8 c1 20 00 00       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:40
    char lTemp=0;
    printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
 100047e:	83 c4 0c             	add    esp,0xc
 1000481:	ff 35 e0 03 00 02    	push   DWORD PTR ds:0x20003e0
 1000487:	68 7e 61 00 01       	push   0x100617e
 100048c:	6a 10                	push   0x10
 100048e:	e8 ac 20 00 00       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:42

    while (kKeyboardBuffer==(char*)KEYBOARD_BUFFER_ADDRESS)
 1000493:	83 c4 10             	add    esp,0x10
 1000496:	81 3d e0 03 00 02 c0 	cmp    DWORD PTR ds:0x20003e0,0x2832c0
 100049d:	32 28 00 
 10004a0:	75 30                	jne    10004d2 <waitForKeyboardKey+0x6a>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:44
    {
        printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
 10004a2:	83 ec 04             	sub    esp,0x4
 10004a5:	68 c0 32 28 00       	push   0x2832c0
 10004aa:	68 7e 61 00 01       	push   0x100617e
 10004af:	6a 10                	push   0x10
 10004b1:	e8 89 20 00 00       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:45
        __asm__("sti\n");
 10004b6:	fb                   	sti    
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:46
        waitTicks(1);
 10004b7:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
 10004be:	e8 fa 29 00 00       	call   1002ebd <waitTicks>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:42
{
    printd(DEBUG_KEYBOARD,"gKbd-W, %04X\t", kKeyboardBuffer);
    char lTemp=0;
    printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);

    while (kKeyboardBuffer==(char*)KEYBOARD_BUFFER_ADDRESS)
 10004c3:	83 c4 10             	add    esp,0x10
 10004c6:	81 3d e0 03 00 02 c0 	cmp    DWORD PTR ds:0x20003e0,0x2832c0
 10004cd:	32 28 00 
 10004d0:	74 d0                	je     10004a2 <waitForKeyboardKey+0x3a>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:48
    {
        printd(DEBUG_KEYBOARD,"kKeyboardBuffer=%04X\n", kKeyboardBuffer);
        __asm__("sti\n");
        waitTicks(1);
    }
    lTemp=keyboardGetKeyFromBuffer();
 10004d2:	e8 51 ff ff ff       	call   1000428 <keyboardGetKeyFromBuffer>
 10004d7:	89 c3                	mov    ebx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:49
    printd(DEBUG_KEYBOARD,"got a key %u!\n", lTemp);
 10004d9:	83 ec 04             	sub    esp,0x4
 10004dc:	0f be c0             	movsx  eax,al
 10004df:	50                   	push   eax
 10004e0:	68 94 61 00 01       	push   0x1006194
 10004e5:	6a 10                	push   0x10
 10004e7:	e8 53 20 00 00       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:51
    return lTemp;
}
 10004ec:	89 d8                	mov    eax,ebx
 10004ee:	83 c4 18             	add    esp,0x18
 10004f1:	5b                   	pop    ebx
 10004f2:	c3                   	ret    

010004f3 <getKeyboardKey>:
getKeyboardKey():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:55

char getKeyboardKey()
{
        return keyboardGetKeyFromBuffer();
 10004f3:	e8 30 ff ff ff       	call   1000428 <keyboardGetKeyFromBuffer>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:56
}
 10004f8:	f3 c3                	repz ret 

010004fa <gets>:
gets():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:58
void gets(char* buffer, int len)
{
 10004fa:	57                   	push   edi
 10004fb:	56                   	push   esi
 10004fc:	53                   	push   ebx
 10004fd:	83 ec 14             	sub    esp,0x14
 1000500:	8b 7c 24 24          	mov    edi,DWORD PTR [esp+0x24]
 1000504:	8b 74 24 28          	mov    esi,DWORD PTR [esp+0x28]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:59
    volatile char inchar=0;
 1000508:	c6 44 24 13 00       	mov    BYTE PTR [esp+0x13],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:61
    int cnt=0;
    memset(buffer,0,len);
 100050d:	56                   	push   esi
 100050e:	6a 00                	push   0x0
 1000510:	57                   	push   edi
 1000511:	e8 7d 13 00 00       	call   1001893 <memset>
 1000516:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:60
        return keyboardGetKeyFromBuffer();
}
void gets(char* buffer, int len)
{
    volatile char inchar=0;
    int cnt=0;
 1000519:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:78
            if (inchar==0x0a)
            {
                printk("%c",inchar);
                return;
            }
            if (cnt<len-2)
 100051e:	83 ee 02             	sub    esi,0x2
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:64
    volatile char inchar=0;
    int cnt=0;
    memset(buffer,0,len);
    while (1==1)
    {
        inchar=getKeyboardKey();
 1000521:	e8 cd ff ff ff       	call   10004f3 <getKeyboardKey>
 1000526:	88 44 24 0f          	mov    BYTE PTR [esp+0xf],al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:65
        if (inchar=='\b' && cnt>0)
 100052a:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 100052f:	85 db                	test   ebx,ebx
 1000531:	7e 1d                	jle    1000550 <gets+0x56>
 1000533:	3c 08                	cmp    al,0x8
 1000535:	75 19                	jne    1000550 <gets+0x56>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:67
        {
            buffer[cnt]=0;
 1000537:	c6 04 1f 00          	mov    BYTE PTR [edi+ebx*1],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:68
            cnt--;
 100053b:	83 eb 01             	sub    ebx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:69
            puts("\b");
 100053e:	83 ec 0c             	sub    esp,0xc
 1000541:	68 a3 61 00 01       	push   0x10061a3
 1000546:	e8 9e fe ff ff       	call   10003e9 <puts>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:66
    memset(buffer,0,len);
    while (1==1)
    {
        inchar=getKeyboardKey();
        if (inchar=='\b' && cnt>0)
        {
 100054b:	83 c4 10             	add    esp,0x10
 100054e:	eb d1                	jmp    1000521 <gets+0x27>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:71
            buffer[cnt]=0;
            cnt--;
            puts("\b");
        }
        else if (inchar>0)
 1000550:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 1000555:	84 c0                	test   al,al
 1000557:	7e c8                	jle    1000521 <gets+0x27>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:73
        {
            if (inchar==0x0a)
 1000559:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 100055e:	3c 0a                	cmp    al,0xa
 1000560:	75 1b                	jne    100057d <gets+0x83>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:75
            {
                printk("%c",inchar);
 1000562:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 1000567:	83 ec 08             	sub    esp,0x8
 100056a:	0f be c0             	movsx  eax,al
 100056d:	50                   	push   eax
 100056e:	68 a5 61 00 01       	push   0x10061a5
 1000573:	e8 af 1f 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:76
                return;
 1000578:	83 c4 10             	add    esp,0x10
 100057b:	eb 2d                	jmp    10005aa <gets+0xb0>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:78
            }
            if (cnt<len-2)
 100057d:	39 f3                	cmp    ebx,esi
 100057f:	7d a0                	jge    1000521 <gets+0x27>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:80
            {
                printk("%c",inchar);
 1000581:	0f b6 44 24 0f       	movzx  eax,BYTE PTR [esp+0xf]
 1000586:	83 ec 08             	sub    esp,0x8
 1000589:	0f be c0             	movsx  eax,al
 100058c:	50                   	push   eax
 100058d:	68 a5 61 00 01       	push   0x10061a5
 1000592:	e8 90 1f 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:81
                buffer[cnt++]=inchar;
 1000597:	0f b6 44 24 1f       	movzx  eax,BYTE PTR [esp+0x1f]
 100059c:	88 04 1f             	mov    BYTE PTR [edi+ebx*1],al
 100059f:	83 c4 10             	add    esp,0x10
 10005a2:	8d 5b 01             	lea    ebx,[ebx+0x1]
 10005a5:	e9 77 ff ff ff       	jmp    1000521 <gets+0x27>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:85
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:89

char getc()
{
   int inchar=getKeyboardKey();
 10005b1:	e8 3d ff ff ff       	call   10004f3 <getKeyboardKey>
 10005b6:	0f be c0             	movsx  eax,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:91
   
   while (inchar==0)
 10005b9:	85 c0                	test   eax,eax
 10005bb:	75 11                	jne    10005ce <getc+0x1d>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:93
   {
       inchar=getKeyboardKey();
 10005bd:	e8 31 ff ff ff       	call   10004f3 <getKeyboardKey>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:94
        inchar=getKeyboardKey();
 10005c2:	e8 2c ff ff ff       	call   10004f3 <getKeyboardKey>
 10005c7:	0f be c0             	movsx  eax,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:91

char getc()
{
   int inchar=getKeyboardKey();
   
   while (inchar==0)
 10005ca:	85 c0                	test   eax,eax
 10005cc:	74 ef                	je     10005bd <getc+0xc>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/char/keyboard.c:97
   {
       inchar=getKeyboardKey();
        inchar=getKeyboardKey();
   }
   return inchar;
}
 10005ce:	f3 c3                	repz ret 

010005d0 <bitsSet>:
bitsSet():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:5
#include <stdint.h>
#include <stdbool.h>

bool bitsSet(volatile uint32_t* array, uint32_t bit)
{
 10005d0:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:7
    int lRetVal=0;
    __asm__ volatile ("bts [%[array]],%[bit]\nmov eax,0\nsetc al\n" : [array] "+m" (*array), "=a" (lRetVal) : [bit] "r" (bit));
 10005d4:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10005d8:	0f ab 02             	bts    DWORD PTR [edx],eax
 10005db:	b8 00 00 00 00       	mov    eax,0x0
 10005e0:	0f 92 c0             	setb   al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:8
    return lRetVal;
 10005e3:	85 c0                	test   eax,eax
 10005e5:	0f 95 c0             	setne  al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:9
}
 10005e8:	c3                   	ret    

010005e9 <bitsReset>:
bitsReset():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:11
bool bitsReset(volatile uint32_t* array, uint32_t bit)
{
 10005e9:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:13
    int lRetVal=0;
    __asm__ volatile ("btr [%[array]],%[bit]\nmov eax,0\nsetc al\n" : [array] "+m" (*array), "=a" (lRetVal) : [bit] "r" (bit));
 10005ed:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10005f1:	0f b3 02             	btr    DWORD PTR [edx],eax
 10005f4:	b8 00 00 00 00       	mov    eax,0x0
 10005f9:	0f 92 c0             	setb   al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:14
    return lRetVal;
 10005fc:	85 c0                	test   eax,eax
 10005fe:	0f 95 c0             	setne  al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:15
}
 1000601:	c3                   	ret    

01000602 <bitsTest>:
bitsTest():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:17
bool bitsTest(volatile uint32_t* array, uint32_t bit)
{
 1000602:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:19
    int lRetVal=0;
    __asm__ volatile ("bt [%[array]],%[bit]\nmov eax,0\nsetc al\n" :[array] "+m" (*array), "=a" (lRetVal) : [bit] "r" (bit));
 1000606:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100060a:	0f a3 02             	bt     DWORD PTR [edx],eax
 100060d:	b8 00 00 00 00       	mov    eax,0x0
 1000612:	0f 92 c0             	setb   al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:20
    return lRetVal;
 1000615:	85 c0                	test   eax,eax
 1000617:	0f 95 c0             	setne  al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:21
}
 100061a:	c3                   	ret    

0100061b <bitsScanF>:
bitsScanF():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:24

int bitsScanF(volatile uint32_t* array)
{
 100061b:	53                   	push   ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:27
    int lRetVal=0;
    bool lErr=false;
    __asm__ volatile ("bsf %[ret],[%[array]]\nsetz cl\n" : [ret] "=b" (lRetVal), [lErr] "=c" (lErr) : [array] "m" (*array));
 100061c:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1000620:	0f bc 18             	bsf    ebx,DWORD PTR [eax]
 1000623:	0f 94 c1             	sete   cl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:28
    if (lErr==false)
 1000626:	84 c9                	test   cl,cl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:29
        return lRetVal;
 1000628:	b8 ff ff ff ff       	mov    eax,0xffffffff
 100062d:	0f 44 c3             	cmove  eax,ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/cpu/bits.c:32
    else
        return -1;
 1000630:	5b                   	pop    ebx
 1000631:	c3                   	ret    
 1000632:	66 90                	xchg   ax,ax

01000634 <ataWaitForDRQ>:
ataWaitForDRQ():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:22
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:23
    int ticks = forHowManyMS*kTicksPerMS;
 1000640:	8b 4c 24 18          	mov    ecx,DWORD PTR [esp+0x18]
 1000644:	0f af 0d 84 02 00 02 	imul   ecx,DWORD PTR ds:0x2000284
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:25
    uint8_t inValue=0;
    while (ticks > 0)
 100064b:	85 c9                	test   ecx,ecx
 100064d:	7e 26                	jle    1000675 <ataWaitForDRQ+0x41>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:30
    {
        STI
        //waitTicks(1);
        __asm__("sti\nhlt\n");
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
 100064f:	0f b7 87 69 02 00 00 	movzx  eax,WORD PTR [edi+0x269]
 1000656:	8d 50 07             	lea    edx,[eax+0x7]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:27
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
    while (ticks > 0)
    {
        STI
 1000659:	fb                   	sti    
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:29
        //waitTicks(1);
        __asm__("sti\nhlt\n");
 100065a:	fb                   	sti    
 100065b:	f4                   	hlt    
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100065c:	ec                   	in     al,dx
 100065d:	89 c6                	mov    esi,eax
ataWaitForDRQ():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:31
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (toBeSet && (inValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ)
 100065f:	84 db                	test   bl,bl
 1000661:	74 06                	je     1000669 <ataWaitForDRQ+0x35>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:31 (discriminator 1)
 1000663:	a8 08                	test   al,0x8
 1000665:	74 07                	je     100066e <ataWaitForDRQ+0x3a>
 1000667:	eb 31                	jmp    100069a <ataWaitForDRQ+0x66>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:33 (discriminator 1)
                return 0;
        else if ((!toBeSet && (inValue & ATA_STATUS_DRQ) != ATA_STATUS_DRQ))
 1000669:	83 e0 08             	and    eax,0x8
 100066c:	74 31                	je     100069f <ataWaitForDRQ+0x6b>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:25
//Returns non-zero value IF TIMEOUT
uint8_t __attribute__((noinline)) ataWaitForDRQ(struct ataDeviceInfo_t* devInfo, bool toBeSet, int forHowManyMS)
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
    while (ticks > 0)
 100066e:	83 e9 01             	sub    ecx,0x1
 1000671:	75 e6                	jne    1000659 <ataWaitForDRQ+0x25>
 1000673:	eb 05                	jmp    100067a <ataWaitForDRQ+0x46>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:24

//Returns non-zero value IF TIMEOUT
uint8_t __attribute__((noinline)) ataWaitForDRQ(struct ataDeviceInfo_t* devInfo, bool toBeSet, int forHowManyMS)
{
    int ticks = forHowManyMS*kTicksPerMS;
    uint8_t inValue=0;
 1000675:	be 00 00 00 00       	mov    esi,0x0
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 100067a:	8b 87 69 02 00 00    	mov    eax,DWORD PTR [edi+0x269]
 1000680:	8d 50 01             	lea    edx,[eax+0x1]
 1000683:	ec                   	in     al,dx
ataWaitForDRQ():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:37
                return 0;
        else if ((!toBeSet && (inValue & ATA_STATUS_DRQ) != ATA_STATUS_DRQ))
                return 0;
        ticks--;
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
 1000684:	0f b6 d0             	movzx  edx,al
 1000687:	89 15 64 2a 01 01    	mov    DWORD PTR ds:0x1012a64,edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:38
    if ((hdError & 0x4)==0x4)
 100068d:	83 e0 04             	and    eax,0x4
 1000690:	b8 00 00 00 00       	mov    eax,0x0
 1000695:	0f 44 c6             	cmove  eax,esi
 1000698:	eb 05                	jmp    100069f <ataWaitForDRQ+0x6b>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:32
        STI
        //waitTicks(1);
        __asm__("sti\nhlt\n");
        inValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (toBeSet && (inValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ)
                return 0;
 100069a:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:41
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:44

uint8_t ataWaitForIdle(struct ataDeviceInfo_t* devInfo)
{
 10006a3:	53                   	push   ebx
 10006a4:	83 ec 08             	sub    esp,0x8
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:48
    ticks = 0;
    uint8_t lValue=0;
    //printk("aaWaitForIdle: ticks(%u@0x%08X)=ATA_STANDARD_WAIT_MS(%d)*kTicksPerMS((%d@0x%08X))\n", ticks, &ticks, (ATA_STANDARD_WAIT_MS), kTicksPerMS, &kTicksPerMS);
    lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
 10006a7:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 10006ab:	8b 98 69 02 00 00    	mov    ebx,DWORD PTR [eax+0x269]
 10006b1:	8d 53 07             	lea    edx,[ebx+0x7]
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 10006b4:	ec                   	in     al,dx
 10006b5:	89 c1                	mov    ecx,eax
ataWaitForIdle():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:51
    if ((lValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ && ticks)
        inw(devInfo->ioPort+ATA_PORT_DATA);
    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 10006b7:	c7 05 58 2a 01 01 00 	mov    DWORD PTR ds:0x1012a58,0x3f800000
 10006be:	00 80 3f 
 10006c1:	a1 84 02 00 02       	mov    eax,ds:0x2000284
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:53
    {
        __asm__("sti\nhlt\n");
 10006e3:	fb                   	sti    
 10006e4:	f4                   	hlt    
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 10006e5:	ec                   	in     al,dx
 10006e6:	89 c1                	mov    ecx,eax
ataWaitForIdle():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:56
        lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
 10006e8:	25 88 00 00 00       	and    eax,0x88
 10006ed:	74 60                	je     100074f <ataWaitForIdle+0xac>
 10006ef:	d9 e8                	fld1   
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:58
                    return 0;
        ticks++;
 10006f1:	d9 e8                	fld1   
 10006f3:	eb 1c                	jmp    1000711 <ataWaitForIdle+0x6e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:53
    lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
    if ((lValue & ATA_STATUS_DRQ) == ATA_STATUS_DRQ && ticks)
        inw(devInfo->ioPort+ATA_PORT_DATA);
    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
    {
        __asm__("sti\nhlt\n");
 10006f5:	fb                   	sti    
 10006f6:	f4                   	hlt    
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 10006f7:	ec                   	in     al,dx
 10006f8:	89 c1                	mov    ecx,eax
ataWaitForIdle():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:56
        lValue=inb(devInfo->ioPort+ATA_PORT_STATUS);
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
 10006fa:	25 88 00 00 00       	and    eax,0x88
 10006ff:	75 0c                	jne    100070d <ataWaitForIdle+0x6a>
 1000701:	dd d8                	fstp   st(0)
 1000703:	dd d8                	fstp   st(0)
 1000705:	d9 1d 58 2a 01 01    	fstp   DWORD PTR ds:0x1012a58
 100070b:	eb 44                	jmp    1000751 <ataWaitForIdle+0xae>
 100070d:	d9 ca                	fxch   st(2)
 100070f:	d9 c9                	fxch   st(1)
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:58
                    return 0;
        ticks++;
 1000711:	dc c1                	fadd   st(1),st
 1000713:	d9 c9                	fxch   st(1)
 1000715:	d9 5c 24 04          	fstp   DWORD PTR [esp+0x4]
 1000719:	d9 44 24 04          	fld    DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:51
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
 1000735:	d9 1d 58 2a 01 01    	fstp   DWORD PTR ds:0x1012a58
 100073b:	eb 02                	jmp    100073f <ataWaitForIdle+0x9c>
 100073d:	dd d8                	fstp   st(0)
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 100073f:	8d 53 01             	lea    edx,[ebx+0x1]
 1000742:	ec                   	in     al,dx
ataWaitForIdle():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:60
            //If both BUSY and DRQ are zero, then, the command is probably complete. 
        if ((lValue & (ATA_STATUS_DRQ | ATA_STATUS_BUSY)) == 0 )
                    return 0;
        ticks++;
    }
    hdError=inb(devInfo->ioPort+ATA_PORT_ERROR);
 1000743:	0f b6 c0             	movzx  eax,al
 1000746:	a3 64 2a 01 01       	mov    ds:0x1012a64,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:61
    return lValue;
 100074b:	89 c8                	mov    eax,ecx
 100074d:	eb 02                	jmp    1000751 <ataWaitForIdle+0xae>
 100074f:	dd d8                	fstp   st(0)
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:62
}
 1000751:	83 c4 08             	add    esp,0x8
 1000754:	5b                   	pop    ebx
 1000755:	c3                   	ret    

01000756 <ataControllerIsReady>:
ataControllerIsReady():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:66


uint8_t ataControllerIsReady(struct ataDeviceInfo_t* devInfo)
{
 1000756:	55                   	push   ebp
 1000757:	57                   	push   edi
 1000758:	56                   	push   esi
 1000759:	53                   	push   ebx
 100075a:	83 ec 0c             	sub    esp,0xc
 100075d:	8b 7c 24 20          	mov    edi,DWORD PTR [esp+0x20]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:69
    int ticks = 0;
    
    int lStatus=0;
 1000761:	bd 00 00 00 00       	mov    ebp,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:67
}


uint8_t ataControllerIsReady(struct ataDeviceInfo_t* devInfo)
{
    int ticks = 0;
 1000766:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:72
    
    int lStatus=0;
    uint8_t err=0;

    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 100076b:	eb 2a                	jmp    1000797 <ataControllerIsReady+0x41>
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 100076d:	0f b7 87 69 02 00 00 	movzx  eax,WORD PTR [edi+0x269]
 1000774:	8d 50 07             	lea    edx,[eax+0x7]
 1000777:	ec                   	in     al,dx
 1000778:	89 c3                	mov    ebx,eax
ataControllerIsReady():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:75
    {
        lStatus=inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
 100077a:	83 ec 0c             	sub    esp,0xc
 100077d:	6a 01                	push   0x1
 100077f:	e8 4c 27 00 00       	call   1002ed0 <wait>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:76
        ticks++;
 1000784:	83 c6 02             	add    esi,0x2
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:77
	lStatus &= (ATA_STATUS_BUSY | ATA_STATUS_READY| ATA_STATUS_SEEK);
 1000787:	89 dd                	mov    ebp,ebx
 1000789:	81 e5 d0 00 00 00    	and    ebp,0xd0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:78
        if (lStatus & ATA_STATUS_READY )
 100078f:	83 c4 10             	add    esp,0x10
 1000792:	f6 c3 40             	test   bl,0x40
 1000795:	75 71                	jne    1000808 <ataControllerIsReady+0xb2>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:72
    int ticks = 0;
    
    int lStatus=0;
    uint8_t err=0;

    while (ticks++<=ATA_STANDARD_WAIT_MS*kTicksPerMS)
 1000797:	a1 84 02 00 02       	mov    eax,ds:0x2000284
 100079c:	8d 04 80             	lea    eax,[eax+eax*4]
 100079f:	01 c0                	add    eax,eax
 10007a1:	39 c6                	cmp    esi,eax
 10007a3:	7e c8                	jle    100076d <ataControllerIsReady+0x17>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:82
	lStatus &= (ATA_STATUS_BUSY | ATA_STATUS_READY| ATA_STATUS_SEEK);
        if (lStatus & ATA_STATUS_READY )
                return true;
    }

    if (lStatus==ATA_STATUS_ERROR || lStatus==ATA_STATUS_BUSY)
 10007a5:	81 fd 80 00 00 00    	cmp    ebp,0x80
 10007ab:	75 41                	jne    10007ee <ataControllerIsReady+0x98>
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 10007ad:	ba f1 01 00 00       	mov    edx,0x1f1
 10007b2:	ec                   	in     al,dx
 10007b3:	89 c3                	mov    ebx,eax
ataControllerIsReady():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:86
    {
         err=inb(0x1f1);
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10007b5:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 10007bc:	74 4a                	je     1000808 <ataControllerIsReady+0xb2>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:87
            printd(DEBUG_HARDDRIVE,"ataControllerIsReady: DRQ wait failed, lStatus=%02X, err=%02X\n",lStatus,err);
 10007be:	0f b6 c0             	movzx  eax,al
 10007c1:	50                   	push   eax
 10007c2:	68 80 00 00 00       	push   0x80
 10007c7:	68 ac 65 00 01       	push   0x10065ac
 10007cc:	6a 08                	push   0x8
 10007ce:	e8 6c 1d 00 00       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:90
#endif
    }
    if ( (lStatus & ATA_STATUS_READY)==0 && err==4)
 10007d3:	83 c4 10             	add    esp,0x10
 10007d6:	f7 c5 40 00 00 00    	test   ebp,0x40
 10007dc:	75 10                	jne    10007ee <ataControllerIsReady+0x98>
 10007de:	80 fb 04             	cmp    bl,0x4
 10007e1:	0f 94 c0             	sete   al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:91
        lStatus=ATA_STATUS_READY;
 10007e4:	84 c0                	test   al,al
 10007e6:	b8 40 00 00 00       	mov    eax,0x40
 10007eb:	0f 45 e8             	cmovne ebp,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:93
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10007ee:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 10007f5:	74 11                	je     1000808 <ataControllerIsReady+0xb2>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:94
            printk("ataControllerIsReady: returning %02X\n",lStatus);
 10007f7:	83 ec 08             	sub    esp,0x8
 10007fa:	55                   	push   ebp
 10007fb:	68 ec 65 00 01       	push   0x10065ec
 1000800:	e8 22 1d 00 00       	call   1002527 <printk>
 1000805:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:97
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:115
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:116
    ataWaitForIdle(devInfo);
 1000820:	56                   	push   esi
 1000821:	e8 7d fe ff ff       	call   10006a3 <ataWaitForIdle>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:117
    outb(devInfo->ioPort+ATA_DRIVE_SELECT, devInfo->driveHeadPortDesignation | (head& 0xF) ); 
 1000826:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:101
    return true;
}

static bool ataStatusIsOk(struct ataDeviceInfo_t* devInfo)
{
	unsigned char status = inb(devInfo->ioPort+ATA_PORT_STATUS);
 100083b:	8d 51 07             	lea    edx,[ecx+0x7]
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100083e:	ec                   	in     al,dx
ataStatusIsOk():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:103

	if (status & ATA_STATUS_BUSY)
 100083f:	83 c4 04             	add    esp,0x4
 1000842:	84 c0                	test   al,al
 1000844:	0f 88 92 00 00 00    	js     10008dc <ataSelectDrive+0xc7>
ataSelectDrive():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:136
        unsigned lDrive=inb(devInfo->ioPort+ATA_DRIVE_SELECT);
            printk("ataSelectDrive: Drive selected: %s (%u, 0x%02X), err=0x%02X\n", (lDrive & (1<<4)) == 1<<4?"Slave":"Master", devInfo->driveNo, lDrive, inb(devInfo->ioPort+ATA_PORT_ERROR));
    }
#endif
        
    return 0;
 100084a:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:128
            printk("ataSelectDrive: Failed to select drive %u, bus %u, status=0x%02X is not ok\n", devInfo->driveNo, devInfo->bus, inb(devInfo->ioPort+ATA_PORT_STATUS));
#endif
            return inb(devInfo->ioPort+ATA_PORT_STATUS);
    }
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 100084f:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 1000856:	0f 84 8e 00 00 00    	je     10008ea <ataSelectDrive+0xd5>
 100085c:	eb 2f                	jmp    100088d <ataSelectDrive+0x78>
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 100085e:	ec                   	in     al,dx
ataSelectDrive():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:123
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
 100086f:	68 14 66 00 01       	push   0x1006614
 1000874:	e8 ae 1c 00 00       	call   1002527 <printk>
 1000879:	83 c4 10             	add    esp,0x10
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 100087c:	8b 86 69 02 00 00    	mov    eax,DWORD PTR [esi+0x269]
 1000882:	8d 50 07             	lea    edx,[eax+0x7]
 1000885:	ec                   	in     al,dx
ataSelectDrive():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:125
#endif
            return inb(devInfo->ioPort+ATA_PORT_STATUS);
 1000886:	84 c0                	test   al,al
 1000888:	0f 95 c0             	setne  al
 100088b:	eb 5d                	jmp    10008ea <ataSelectDrive+0xd5>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:130
    }
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
    {
        wait(10);
 100088d:	83 ec 0c             	sub    esp,0xc
 1000890:	6a 0a                	push   0xa
 1000892:	e8 39 26 00 00       	call   1002ed0 <wait>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:131
        unsigned lDrive=inb(devInfo->ioPort+ATA_DRIVE_SELECT);
 1000897:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 100089d:	8d 51 06             	lea    edx,[ecx+0x6]
 10008a0:	ec                   	in     al,dx
 10008a1:	89 c3                	mov    ebx,eax
ataSelectDrive():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:131
 10008a3:	0f b6 f8             	movzx  edi,al
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 10008a6:	8d 51 01             	lea    edx,[ecx+0x1]
 10008a9:	ec                   	in     al,dx
ataSelectDrive():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:132
            printk("ataSelectDrive: Drive selected: %s (%u, 0x%02X), err=0x%02X\n", (lDrive & (1<<4)) == 1<<4?"Slave":"Master", devInfo->driveNo, lDrive, inb(devInfo->ioPort+ATA_PORT_ERROR));
 10008aa:	0f b6 c8             	movzx  ecx,al
 10008ad:	83 e3 10             	and    ebx,0x10
 10008b0:	ba ae 61 00 01       	mov    edx,0x10061ae
 10008b5:	b8 a8 61 00 01       	mov    eax,0x10061a8
 10008ba:	0f 44 c2             	cmove  eax,edx
 10008bd:	89 0c 24             	mov    DWORD PTR [esp],ecx
 10008c0:	57                   	push   edi
 10008c1:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 10008c7:	50                   	push   eax
 10008c8:	68 60 66 00 01       	push   0x1006660
 10008cd:	e8 55 1c 00 00       	call   1002527 <printk>
 10008d2:	83 c4 20             	add    esp,0x20
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:136
    }
#endif
        
    return 0;
 10008d5:	b8 00 00 00 00       	mov    eax,0x0
 10008da:	eb 0e                	jmp    10008ea <ataSelectDrive+0xd5>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:122
    outb(devInfo->ioPort+ATA_DRIVE_SELECT, devInfo->driveHeadPortDesignation | (head& 0xF) ); 
    //printk("Sending 0x%02X", drive==master?ATA_DRIVE_MASTER:ATA_DRIVE_SLAVE | (head& 0xF));
    if (!ataStatusIsOk(devInfo))
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10008dc:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 10008e3:	74 97                	je     100087c <ataSelectDrive+0x67>
 10008e5:	e9 74 ff ff ff       	jmp    100085e <ataSelectDrive+0x49>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:137
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:180
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
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:163
}
*/
static void ataResetController(struct ataDeviceInfo_t* devInfo)
{
        outb(devInfo->ioPort+ATA_PORT_COMMAND, 4);
        waitTicks(kTicksPerSecond/10);
 1000905:	83 ec 0c             	sub    esp,0xc
 1000908:	8b 0d 80 02 00 02    	mov    ecx,DWORD PTR ds:0x2000280
 100090e:	ba 67 66 66 66       	mov    edx,0x66666667
 1000913:	89 c8                	mov    eax,ecx
 1000915:	f7 ea                	imul   edx
 1000917:	c1 fa 02             	sar    edx,0x2
 100091a:	c1 f9 1f             	sar    ecx,0x1f
 100091d:	29 ca                	sub    edx,ecx
 100091f:	52                   	push   edx
 1000920:	e8 98 25 00 00       	call   1002ebd <waitTicks>
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
 1000925:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 100092c:	8d 90 f6 03 00 00    	lea    edx,[eax+0x3f6]
 1000932:	b8 04 00 00 00       	mov    eax,0x4
 1000937:	ee                   	out    dx,al
ataResetController():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:165
        outb(devInfo->ioPort+ATA_PORT_CONTROL, 1<<2);
        wait(10);
 1000938:	c7 04 24 0a 00 00 00 	mov    DWORD PTR [esp],0xa
 100093f:	e8 8c 25 00 00       	call   1002ed0 <wait>
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
 1000944:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 100094b:	8d 90 f6 03 00 00    	lea    edx,[eax+0x3f6]
 1000951:	b8 00 00 00 00       	mov    eax,0x0
 1000956:	ee                   	out    dx,al
ataResetController():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:167
        outb(devInfo->ioPort+ATA_PORT_CONTROL, 0);
        if (!ataControllerIsReady(devInfo))
 1000957:	89 34 24             	mov    DWORD PTR [esp],esi
 100095a:	e8 f7 fd ff ff       	call   1000756 <ataControllerIsReady>
 100095f:	83 c4 10             	add    esp,0x10
 1000962:	84 c0                	test   al,al
 1000964:	75 19                	jne    100097f <ataInit+0x91>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:169
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000966:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 100096d:	74 10                	je     100097f <ataInit+0x91>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:170
            printk("HD-controller still busy\n");
 100096f:	83 ec 0c             	sub    esp,0xc
 1000972:	68 c7 61 00 01       	push   0x10061c7
 1000977:	e8 ab 1b 00 00       	call   1002527 <printk>
 100097c:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
#endif
        if ((hdError = inb(devInfo->ioPort+ATA_PORT_ERROR)) != 0 && (hdError = inb(devInfo->ioPort+ATA_PORT_ERROR)) != 4)
 100097f:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000986:	8d 50 01             	lea    edx,[eax+0x1]
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1000989:	ec                   	in     al,dx
ataResetController():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
 100098a:	84 c0                	test   al,al
 100098c:	75 0c                	jne    100099a <ataInit+0xac>
 100098e:	c7 05 64 2a 01 01 00 	mov    DWORD PTR ds:0x1012a64,0x0
 1000995:	00 00 00 
 1000998:	eb 34                	jmp    10009ce <ataInit+0xe0>
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 100099a:	ec                   	in     al,dx
ataResetController():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:172
 100099b:	0f b6 c0             	movzx  eax,al
 100099e:	a3 64 2a 01 01       	mov    ds:0x1012a64,eax
 10009a3:	83 f8 04             	cmp    eax,0x4
 10009a6:	74 26                	je     10009ce <ataInit+0xe0>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:173
            printk("Controller reset failed on %s bus: %02x\n",devInfo->bus==0?"Primary":"Secondary", hdError);
 10009a8:	83 be 61 02 00 00 00 	cmp    DWORD PTR [esi+0x261],0x0
 10009af:	b9 bd 61 00 01       	mov    ecx,0x10061bd
 10009b4:	ba b5 61 00 01       	mov    edx,0x10061b5
 10009b9:	0f 45 d1             	cmovne edx,ecx
 10009bc:	83 ec 04             	sub    esp,0x4
 10009bf:	50                   	push   eax
 10009c0:	52                   	push   edx
 10009c1:	68 a0 66 00 01       	push   0x10066a0
 10009c6:	e8 5c 1b 00 00       	call   1002527 <printk>
 10009cb:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:175
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 10009ce:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 10009d5:	74 10                	je     10009e7 <ataInit+0xf9>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:176
            printk("ataResetController: controller is ready\n");
 10009d7:	83 ec 0c             	sub    esp,0xc
 10009da:	68 cc 66 00 01       	push   0x10066cc
 10009df:	e8 43 1b 00 00       	call   1002527 <printk>
 10009e4:	83 c4 10             	add    esp,0x10
ataInit():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:183
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:184
    outb(devInfo->ioPort+ATA_PORT_SECTORCOUNT, 0x55);
 10009f2:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:189
    outb(devInfo->ioPort+ATA_PORT_SECTOR_NUMBER, 0xAA);
    outb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW,0x55);
    outb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH,0xAA);
    outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
    wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
 1000a25:	a1 84 02 00 02       	mov    eax,ds:0x2000284
 1000a2a:	8d 04 80             	lea    eax,[eax+eax*4]
 1000a2d:	01 c0                	add    eax,eax
 1000a2f:	89 04 24             	mov    DWORD PTR [esp],eax
 1000a32:	e8 99 24 00 00       	call   1002ed0 <wait>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:190
    cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
 1000a37:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1000a3d:	8d 51 07             	lea    edx,[ecx+0x7]
 1000a40:	ec                   	in     al,dx
ataInit():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:190
 1000a41:	0f b6 d8             	movzx  ebx,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:191
    if (cStatus==0)
 1000a44:	83 c4 10             	add    esp,0x10
 1000a47:	85 db                	test   ebx,ebx
 1000a49:	75 34                	jne    1000a7f <ataInit+0x191>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
        return false;
 1000a4b:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:194
    wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
    cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
    if (cStatus==0)
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000a50:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 1000a57:	0f 84 4d 01 00 00    	je     1000baa <ataInit+0x2bc>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:195
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
 1000a5d:	83 ec 04             	sub    esp,0x4
 1000a60:	6a 00                	push   0x0
 1000a62:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000a68:	68 e1 61 00 01       	push   0x10061e1
 1000a6d:	e8 b5 1a 00 00       	call   1002527 <printk>
 1000a72:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
#endif
        return false;
 1000a75:	b8 00 00 00 00       	mov    eax,0x0
 1000a7a:	e9 2b 01 00 00       	jmp    1000baa <ataInit+0x2bc>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:199
    }
    if ((cStatus & 1) == 1)
 1000a7f:	a8 01                	test   al,0x1
 1000a81:	0f 84 80 00 00 00    	je     1000b07 <ataInit+0x219>
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 1000a87:	8d 51 01             	lea    edx,[ecx+0x1]
 1000a8a:	ec                   	in     al,dx
ataInit():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:201
    {
        int err = inb(devInfo->ioPort+ATA_PORT_ERROR);
 1000a8b:	0f b6 f8             	movzx  edi,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:203
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000a8e:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 1000a95:	74 15                	je     1000aac <ataInit+0x1be>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:204
            printk("drive %02X, cStatus=%02X, errreg=%02X\n",devInfo->driveNo, cStatus,err);
 1000a97:	57                   	push   edi
 1000a98:	53                   	push   ebx
 1000a99:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000a9f:	68 f8 66 00 01       	push   0x10066f8
 1000aa4:	e8 7e 1a 00 00       	call   1002527 <printk>
 1000aa9:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:207
#endif
        if (err!=4)
            return false;
 1000aac:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:206
        int err = inb(devInfo->ioPort+ATA_PORT_ERROR);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("drive %02X, cStatus=%02X, errreg=%02X\n",devInfo->driveNo, cStatus,err);
#endif
        if (err!=4)
 1000ab1:	83 ff 04             	cmp    edi,0x4
 1000ab4:	0f 85 f0 00 00 00    	jne    1000baa <ataInit+0x2bc>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:208
            return false;
        useCDROMIdentify = true;
 1000aba:	c6 05 68 2a 01 01 01 	mov    BYTE PTR ds:0x1012a68,0x1
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 1000ac1:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000ac8:	8d 50 07             	lea    edx,[eax+0x7]
 1000acb:	ec                   	in     al,dx
ataInit():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:209
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
 1000acc:	0f b6 d8             	movzx  ebx,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:210
        if (cStatus==0)
 1000acf:	85 db                	test   ebx,ebx
 1000ad1:	75 34                	jne    1000b07 <ataInit+0x219>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:216
        {
#ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
                printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
            return false;
 1000ad3:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:213
        useCDROMIdentify = true;
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        if (cStatus==0)
        {
#ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000ad8:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 1000adf:	0f 84 c5 00 00 00    	je     1000baa <ataInit+0x2bc>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:214
                printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
 1000ae5:	83 ec 04             	sub    esp,0x4
 1000ae8:	6a 00                	push   0x0
 1000aea:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000af0:	68 e1 61 00 01       	push   0x10061e1
 1000af5:	e8 2d 1a 00 00       	call   1002527 <printk>
 1000afa:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:216
#endif
            return false;
 1000afd:	b8 00 00 00 00       	mov    eax,0x0
 1000b02:	e9 a3 00 00 00       	jmp    1000baa <ataInit+0x2bc>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:219
        }
    }
    ticks=ATA_STANDARD_WAIT_MS*kTicksPerMS;
 1000b07:	a1 84 02 00 02       	mov    eax,ds:0x2000284
 1000b0c:	8d 04 80             	lea    eax,[eax+eax*4]
 1000b0f:	01 c0                	add    eax,eax
 1000b11:	89 c7                	mov    edi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:220
    while ((cStatus & ATA_STATUS_BUSY) == ATA_STATUS_BUSY && (ticks>0))
 1000b13:	c1 eb 07             	shr    ebx,0x7
 1000b16:	84 db                	test   bl,bl
 1000b18:	74 29                	je     1000b43 <ataInit+0x255>
 1000b1a:	85 c0                	test   eax,eax
 1000b1c:	7e 25                	jle    1000b43 <ataInit+0x255>
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 1000b1e:	0f b7 86 69 02 00 00 	movzx  eax,WORD PTR [esi+0x269]
 1000b25:	8d 50 07             	lea    edx,[eax+0x7]
 1000b28:	ec                   	in     al,dx
 1000b29:	89 c3                	mov    ebx,eax
ataInit():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:223
    {
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
 1000b2b:	83 ec 0c             	sub    esp,0xc
 1000b2e:	6a 01                	push   0x1
 1000b30:	e8 9b 23 00 00       	call   1002ed0 <wait>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:224
        ticks--;
 1000b35:	83 ef 01             	sub    edi,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:220
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:226
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:227
        return false;
 1000b51:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:226
    {
        cStatus = inb(devInfo->ioPort+ATA_PORT_STATUS);
        wait(1);
        ticks--;
    }
    if (!ataControllerIsReady(devInfo))
 1000b56:	84 d2                	test   dl,dl
 1000b58:	74 50                	je     1000baa <ataInit+0x2bc>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:228
        return false;
    if (inb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW)!=0x55 || inb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH)!=0xaa)
 1000b5a:	8b 8e 69 02 00 00    	mov    ecx,DWORD PTR [esi+0x269]
 1000b60:	8d 59 04             	lea    ebx,[ecx+0x4]
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 1000b63:	89 da                	mov    edx,ebx
 1000b65:	ec                   	in     al,dx
ataInit():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:228
 1000b66:	3c 55                	cmp    al,0x55
 1000b68:	75 08                	jne    1000b72 <ataInit+0x284>
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39 (discriminator 1)
 1000b6a:	8d 51 05             	lea    edx,[ecx+0x5]
 1000b6d:	ec                   	in     al,dx
ataInit():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:228 (discriminator 1)
 1000b6e:	3c aa                	cmp    al,0xaa
 1000b70:	74 33                	je     1000ba5 <ataInit+0x2b7>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:231
    {
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000b72:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 1000b79:	74 21                	je     1000b9c <ataInit+0x2ae>
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 1000b7b:	8d 51 05             	lea    edx,[ecx+0x5]
 1000b7e:	ec                   	in     al,dx
 1000b7f:	89 c1                	mov    ecx,eax
 1000b81:	89 da                	mov    edx,ebx
 1000b83:	ec                   	in     al,dx
ataInit():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:232
        printk("Cylinder port non-zero (%X,%X), device is non-ATA\n",inb(devInfo->ioPort+ATA_PORT_CYLINDER_LOW), inb(devInfo->ioPort+ATA_PORT_CYLINDER_HIGH));
 1000b84:	83 ec 04             	sub    esp,0x4
 1000b87:	0f b6 c9             	movzx  ecx,cl
 1000b8a:	51                   	push   ecx
 1000b8b:	0f b6 c0             	movzx  eax,al
 1000b8e:	50                   	push   eax
 1000b8f:	68 20 67 00 01       	push   0x1006720
 1000b94:	e8 8e 19 00 00       	call   1002527 <printk>
 1000b99:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:197
    {
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            printk("Drive %02X, not ready(%02X)\n",devInfo->driveNo, cStatus);
#endif
        return false;
 1000b9c:	0f b6 05 68 2a 01 01 	movzx  eax,BYTE PTR ds:0x1012a68
 1000ba3:	eb 05                	jmp    1000baa <ataInit+0x2bc>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:239
        if (useCDROMIdentify)
            return true;
        else
            return false;
    }
    return true;
 1000ba5:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:240
}
 1000baa:	5b                   	pop    ebx
 1000bab:	5e                   	pop    esi
 1000bac:	5f                   	pop    edi
 1000bad:	c3                   	ret    

01000bae <ataGetModelFromIdentify>:
ataGetModelFromIdentify():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:243

void ataGetModelFromIdentify(struct ataDeviceInfo_t* devInfo)
{
 1000bae:	56                   	push   esi
 1000baf:	53                   	push   ebx
 1000bb0:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:244
    uint16_t* ident=devInfo->ATAIdentifyData+27;
 1000bb4:	8d 46 36             	lea    eax,[esi+0x36]
 1000bb7:	8d 96 01 02 00 00    	lea    edx,[esi+0x201]
 1000bbd:	8d 5e 5e             	lea    ebx,[esi+0x5e]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:247 (discriminator 3)
    for (int cnt=0;cnt<40;cnt+=2)
    {
        devInfo->ATADeviceModel[cnt]=(*ident >> 8) & 0xFF;
 1000bc0:	0f b7 08             	movzx  ecx,WORD PTR [eax]
 1000bc3:	66 c1 e9 08          	shr    cx,0x8
 1000bc7:	88 4a ff             	mov    BYTE PTR [edx-0x1],cl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:248 (discriminator 3)
        devInfo->ATADeviceModel[cnt+1]=(*ident++) & 0xFF;
 1000bca:	83 c0 02             	add    eax,0x2
 1000bcd:	0f b7 48 fe          	movzx  ecx,WORD PTR [eax-0x2]
 1000bd1:	88 0a                	mov    BYTE PTR [edx],cl
 1000bd3:	83 c2 02             	add    edx,0x2
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:245 (discriminator 3)
}

void ataGetModelFromIdentify(struct ataDeviceInfo_t* devInfo)
{
    uint16_t* ident=devInfo->ATAIdentifyData+27;
    for (int cnt=0;cnt<40;cnt+=2)
 1000bd6:	39 d8                	cmp    eax,ebx
 1000bd8:	75 e6                	jne    1000bc0 <ataGetModelFromIdentify+0x12>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:250
    {
        devInfo->ATADeviceModel[cnt]=(*ident >> 8) & 0xFF;
        devInfo->ATADeviceModel[cnt+1]=(*ident++) & 0xFF;
    }
    devInfo->ATADeviceModel[79]='\0';
 1000bda:	c6 86 4f 02 00 00 00 	mov    BYTE PTR [esi+0x24f],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:251
}
 1000be1:	5b                   	pop    ebx
 1000be2:	5e                   	pop    esi
 1000be3:	c3                   	ret    

01000be4 <ataIdentify>:
ataIdentify():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:254

int ataIdentify(struct ataDeviceInfo_t* devInfo)
{
 1000be4:	56                   	push   esi
 1000be5:	53                   	push   ebx
 1000be6:	83 ec 04             	sub    esp,0x4
 1000be9:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:256
    //For ATA devices, read the identity data.  For SATA, we've already read it into ATAIdentityData
    if (devInfo->queryATAData)
 1000bed:	80 be 50 02 00 00 00 	cmp    BYTE PTR [esi+0x250],0x0
 1000bf4:	74 5c                	je     1000c52 <ataIdentify+0x6e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:258
    {
        if (useCDROMIdentify)
 1000bf6:	80 3d 68 2a 01 01 00 	cmp    BYTE PTR ds:0x1012a68,0x0
 1000bfd:	74 12                	je     1000c11 <ataIdentify+0x2d>
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:262
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_CDROM_COMMAND);
        else
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
        wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
 1000c21:	83 ec 0c             	sub    esp,0xc
 1000c24:	a1 84 02 00 02       	mov    eax,ds:0x2000284
 1000c29:	8d 04 80             	lea    eax,[eax+eax*4]
 1000c2c:	01 c0                	add    eax,eax
 1000c2e:	50                   	push   eax
 1000c2f:	e8 9c 22 00 00       	call   1002ed0 <wait>
 1000c34:	0f b7 96 69 02 00 00 	movzx  edx,WORD PTR [esi+0x269]
 1000c3b:	89 f1                	mov    ecx,esi
 1000c3d:	8d 9e 00 02 00 00    	lea    ebx,[esi+0x200]
 1000c43:	83 c4 10             	add    esp,0x10
inw():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:46 (discriminator 3)
}

static __inline unsigned short inw(unsigned short __port)
{
	unsigned short __val;
	__asm__ volatile ("inw %0, %1" : "=a" (__val) : "dN" (__port));
 1000c46:	66 ed                	in     ax,dx
ataIdentify():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:265 (discriminator 3)
        for (int readCount=0;readCount<=255;readCount++)
        {
            devInfo->ATAIdentifyData[readCount]=inw(devInfo->ioPort+ATA_PORT_DATA);
 1000c48:	66 89 01             	mov    WORD PTR [ecx],ax
 1000c4b:	83 c1 02             	add    ecx,0x2
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:263 (discriminator 3)
        if (useCDROMIdentify)
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_CDROM_COMMAND);
        else
            outb(devInfo->ioPort+ATA_PORT_COMMAND, ATA_IDENTIFY_COMMAND);
        wait(ATA_STANDARD_WAIT_MS*kTicksPerMS);
        for (int readCount=0;readCount<=255;readCount++)
 1000c4e:	39 d9                	cmp    ecx,ebx
 1000c50:	75 f4                	jne    1000c46 <ataIdentify+0x62>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:268
        {
            devInfo->ATAIdentifyData[readCount]=inw(devInfo->ioPort+ATA_PORT_DATA);
        }
    }
    ataGetModelFromIdentify(devInfo);
 1000c52:	83 ec 0c             	sub    esp,0xc
 1000c55:	56                   	push   esi
 1000c56:	e8 53 ff ff ff       	call   1000bae <ataGetModelFromIdentify>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:269
    devInfo->totalSectorCount = devInfo->ATAIdentifyData[60] | (devInfo->ATAIdentifyData[61]<<16);
 1000c5b:	0f b7 46 7a          	movzx  eax,WORD PTR [esi+0x7a]
 1000c5f:	c1 e0 10             	shl    eax,0x10
 1000c62:	0f b7 56 78          	movzx  edx,WORD PTR [esi+0x78]
 1000c66:	09 d0                	or     eax,edx
 1000c68:	89 86 56 02 00 00    	mov    DWORD PTR [esi+0x256],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:270
    devInfo->sectorSize = (devInfo->ATAIdentifyData[106] & 1<<12)==1<<12
 1000c6e:	83 c4 10             	add    esp,0x10
 1000c71:	b8 00 02 00 00       	mov    eax,0x200
 1000c76:	f6 86 d5 00 00 00 10 	test   BYTE PTR [esi+0xd5],0x10
 1000c7d:	74 12                	je     1000c91 <ataIdentify+0xad>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:270 (discriminator 1)
 1000c7f:	0f b7 46 24          	movzx  eax,WORD PTR [esi+0x24]
 1000c83:	c1 e0 10             	shl    eax,0x10
 1000c86:	89 c2                	mov    edx,eax
 1000c88:	0f b7 86 ea 00 00 00 	movzx  eax,WORD PTR [esi+0xea]
 1000c8f:	09 d0                	or     eax,edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:270 (discriminator 4)
 1000c91:	89 86 5a 02 00 00    	mov    DWORD PTR [esi+0x25a],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:273 (discriminator 4)
            ?devInfo->ATAIdentifyData[117] | (devInfo->ATAIdentifyData[18]<<16)
            :512;
    devInfo->dmaSupported=devInfo->ATAIdentifyData[49]>>8 & 0x1;
 1000c97:	0f b7 46 62          	movzx  eax,WORD PTR [esi+0x62]
 1000c9b:	89 c2                	mov    edx,eax
 1000c9d:	66 c1 ea 08          	shr    dx,0x8
 1000ca1:	83 e2 01             	and    edx,0x1
 1000ca4:	88 96 60 02 00 00    	mov    BYTE PTR [esi+0x260],dl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:274 (discriminator 4)
    devInfo->lbaSupported=devInfo->ATAIdentifyData[49]>>9 & 0x1;
 1000caa:	66 c1 e8 09          	shr    ax,0x9
 1000cae:	83 e0 01             	and    eax,0x1
 1000cb1:	88 86 5e 02 00 00    	mov    BYTE PTR [esi+0x25e],al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:275 (discriminator 4)
    devInfo->lba48Supported=devInfo->ATAIdentifyData[83]>>10 & 0x1;
 1000cb7:	0f b7 86 a6 00 00 00 	movzx  eax,WORD PTR [esi+0xa6]
 1000cbe:	66 c1 e8 0a          	shr    ax,0xa
 1000cc2:	83 e0 01             	and    eax,0x1
 1000cc5:	88 86 5f 02 00 00    	mov    BYTE PTR [esi+0x25f],al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:278 (discriminator 4)
    
#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000ccb:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 1000cd2:	74 1d                	je     1000cf1 <ataIdentify+0x10d>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:279
        printk("drive %d, model=%s\n",devInfo->driveNo, devInfo->ATADeviceModel);
 1000cd4:	83 ec 04             	sub    esp,0x4
 1000cd7:	8d 86 00 02 00 00    	lea    eax,[esi+0x200]
 1000cdd:	50                   	push   eax
 1000cde:	ff b6 65 02 00 00    	push   DWORD PTR [esi+0x265]
 1000ce4:	68 fe 61 00 01       	push   0x10061fe
 1000ce9:	e8 39 18 00 00       	call   1002527 <printk>
 1000cee:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:282
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:285

int ataScanForHarddrives()
{
 1000cfc:	53                   	push   ebx
 1000cfd:	83 ec 14             	sub    esp,0x14
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:286
    kATADeviceInfo[0].bus=ATAPrimary;
 1000d00:	8b 1d c0 02 00 02    	mov    ebx,DWORD PTR ds:0x20002c0
 1000d06:	c7 83 61 02 00 00 00 	mov    DWORD PTR [ebx+0x261],0x0
 1000d0d:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:287
    kATADeviceInfo[0].driveNo=0;
 1000d10:	c7 83 65 02 00 00 00 	mov    DWORD PTR [ebx+0x265],0x0
 1000d17:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:288
    kATADeviceInfo[0].ioPort=0x1F0;
 1000d1a:	c7 83 69 02 00 00 f0 	mov    DWORD PTR [ebx+0x269],0x1f0
 1000d21:	01 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:289
    kATADeviceInfo[0].irqNum=0x14;
 1000d24:	c6 83 6d 02 00 00 14 	mov    BYTE PTR [ebx+0x26d],0x14
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:290
    kATADeviceInfo[0].driveHeadPortDesignation=0xA0;
 1000d2b:	c6 83 6e 02 00 00 a0 	mov    BYTE PTR [ebx+0x26e],0xa0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:291
    kATADeviceInfo[0].queryATAData=true;
 1000d32:	c6 83 50 02 00 00 01 	mov    BYTE PTR [ebx+0x250],0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:292
    kATADeviceInfo[0].ATADeviceAvailable=ataInit(&kATADeviceInfo[0]);
 1000d39:	53                   	push   ebx
 1000d3a:	e8 af fb ff ff       	call   10008ee <ataInit>
 1000d3f:	88 83 51 02 00 00    	mov    BYTE PTR [ebx+0x251],al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:293
    if (kATADeviceInfo[0].ATADeviceAvailable)
 1000d45:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000d4a:	83 c4 10             	add    esp,0x10
 1000d4d:	80 b8 51 02 00 00 00 	cmp    BYTE PTR [eax+0x251],0x0
 1000d54:	74 35                	je     1000d8b <ataScanForHarddrives+0x8f>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:295
    {
        ataIdentify(&kATADeviceInfo[0]);
 1000d56:	83 ec 0c             	sub    esp,0xc
 1000d59:	50                   	push   eax
 1000d5a:	e8 85 fe ff ff       	call   1000be4 <ataIdentify>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:296
        if (useCDROMIdentify)
 1000d5f:	83 c4 10             	add    esp,0x10
 1000d62:	80 3d 68 2a 01 01 00 	cmp    BYTE PTR ds:0x1012a68,0x0
 1000d69:	74 11                	je     1000d7c <ataScanForHarddrives+0x80>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:297
            kATADeviceInfo[0].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000d6b:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000d70:	c7 80 52 02 00 00 01 	mov    DWORD PTR [eax+0x252],0x1
 1000d77:	00 00 00 
 1000d7a:	eb 0f                	jmp    1000d8b <ataScanForHarddrives+0x8f>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:299
        else
            kATADeviceInfo[0].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000d7c:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000d81:	c7 80 52 02 00 00 00 	mov    DWORD PTR [eax+0x252],0x0
 1000d88:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:301
    }
    useCDROMIdentify=false;
 1000d8b:	c6 05 68 2a 01 01 00 	mov    BYTE PTR ds:0x1012a68,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:303

    kATADeviceInfo[1].bus=ATAPrimary;
 1000d92:	8b 1d c0 02 00 02    	mov    ebx,DWORD PTR ds:0x20002c0
 1000d98:	c7 83 d4 04 00 00 00 	mov    DWORD PTR [ebx+0x4d4],0x0
 1000d9f:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:304
    kATADeviceInfo[1].driveNo=1;
 1000da2:	c7 83 d8 04 00 00 01 	mov    DWORD PTR [ebx+0x4d8],0x1
 1000da9:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:305
    kATADeviceInfo[1].ioPort=0x1F0;
 1000dac:	c7 83 dc 04 00 00 f0 	mov    DWORD PTR [ebx+0x4dc],0x1f0
 1000db3:	01 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:306
    kATADeviceInfo[1].irqNum=0x14;
 1000db6:	c6 83 e0 04 00 00 14 	mov    BYTE PTR [ebx+0x4e0],0x14
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:307
    kATADeviceInfo[1].driveHeadPortDesignation=0xB0;
 1000dbd:	c6 83 e1 04 00 00 b0 	mov    BYTE PTR [ebx+0x4e1],0xb0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:308
    kATADeviceInfo[1].queryATAData=true;
 1000dc4:	c6 83 c3 04 00 00 01 	mov    BYTE PTR [ebx+0x4c3],0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:309
    kATADeviceInfo[1].ATADeviceAvailable=ataInit(&kATADeviceInfo[1]);
 1000dcb:	83 ec 0c             	sub    esp,0xc
 1000dce:	8d 83 73 02 00 00    	lea    eax,[ebx+0x273]
 1000dd4:	50                   	push   eax
 1000dd5:	e8 14 fb ff ff       	call   10008ee <ataInit>
 1000dda:	88 83 c4 04 00 00    	mov    BYTE PTR [ebx+0x4c4],al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:310
    if (kATADeviceInfo[1].ATADeviceAvailable)
 1000de0:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000de5:	83 c4 10             	add    esp,0x10
 1000de8:	80 b8 c4 04 00 00 00 	cmp    BYTE PTR [eax+0x4c4],0x0
 1000def:	74 3a                	je     1000e2b <ataScanForHarddrives+0x12f>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:312
    {
        ataIdentify(&kATADeviceInfo[1]);
 1000df1:	83 ec 0c             	sub    esp,0xc
 1000df4:	05 73 02 00 00       	add    eax,0x273
 1000df9:	50                   	push   eax
 1000dfa:	e8 e5 fd ff ff       	call   1000be4 <ataIdentify>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:313
        if (useCDROMIdentify)
 1000dff:	83 c4 10             	add    esp,0x10
 1000e02:	80 3d 68 2a 01 01 00 	cmp    BYTE PTR ds:0x1012a68,0x0
 1000e09:	74 11                	je     1000e1c <ataScanForHarddrives+0x120>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:314
            kATADeviceInfo[1].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000e0b:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000e10:	c7 80 c5 04 00 00 01 	mov    DWORD PTR [eax+0x4c5],0x1
 1000e17:	00 00 00 
 1000e1a:	eb 0f                	jmp    1000e2b <ataScanForHarddrives+0x12f>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:316
        else
            kATADeviceInfo[1].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000e1c:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000e21:	c7 80 c5 04 00 00 00 	mov    DWORD PTR [eax+0x4c5],0x0
 1000e28:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:318
    }
    kATADeviceInfo[2].bus=ATASecondary;
 1000e2b:	8b 1d c0 02 00 02    	mov    ebx,DWORD PTR ds:0x20002c0
 1000e31:	c7 83 47 07 00 00 01 	mov    DWORD PTR [ebx+0x747],0x1
 1000e38:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:319
    kATADeviceInfo[2].driveNo=2;
 1000e3b:	c7 83 4b 07 00 00 02 	mov    DWORD PTR [ebx+0x74b],0x2
 1000e42:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:320
    kATADeviceInfo[2].ioPort=0x170;
 1000e45:	c7 83 4f 07 00 00 70 	mov    DWORD PTR [ebx+0x74f],0x170
 1000e4c:	01 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:321
    kATADeviceInfo[2].irqNum=0x15;
 1000e4f:	c6 83 53 07 00 00 15 	mov    BYTE PTR [ebx+0x753],0x15
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:322
    kATADeviceInfo[2].driveHeadPortDesignation=0xA0;
 1000e56:	c6 83 54 07 00 00 a0 	mov    BYTE PTR [ebx+0x754],0xa0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:323
    kATADeviceInfo[2].queryATAData=false;
 1000e5d:	c6 83 36 07 00 00 00 	mov    BYTE PTR [ebx+0x736],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:324
    kATADeviceInfo[2].ATADeviceAvailable=ataInit(&kATADeviceInfo[2]);
 1000e64:	83 ec 0c             	sub    esp,0xc
 1000e67:	8d 83 e6 04 00 00    	lea    eax,[ebx+0x4e6]
 1000e6d:	50                   	push   eax
 1000e6e:	e8 7b fa ff ff       	call   10008ee <ataInit>
 1000e73:	88 83 37 07 00 00    	mov    BYTE PTR [ebx+0x737],al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:325
    if (kATADeviceInfo[2].ATADeviceAvailable)
 1000e79:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000e7e:	83 c4 10             	add    esp,0x10
 1000e81:	80 b8 37 07 00 00 00 	cmp    BYTE PTR [eax+0x737],0x0
 1000e88:	74 3a                	je     1000ec4 <ataScanForHarddrives+0x1c8>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:327
    {
        ataIdentify(&kATADeviceInfo[2]);
 1000e8a:	83 ec 0c             	sub    esp,0xc
 1000e8d:	05 e6 04 00 00       	add    eax,0x4e6
 1000e92:	50                   	push   eax
 1000e93:	e8 4c fd ff ff       	call   1000be4 <ataIdentify>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:328
        if (useCDROMIdentify)
 1000e98:	83 c4 10             	add    esp,0x10
 1000e9b:	80 3d 68 2a 01 01 00 	cmp    BYTE PTR ds:0x1012a68,0x0
 1000ea2:	74 11                	je     1000eb5 <ataScanForHarddrives+0x1b9>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:329
            kATADeviceInfo[2].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000ea4:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000ea9:	c7 80 38 07 00 00 01 	mov    DWORD PTR [eax+0x738],0x1
 1000eb0:	00 00 00 
 1000eb3:	eb 0f                	jmp    1000ec4 <ataScanForHarddrives+0x1c8>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:331
        else
            kATADeviceInfo[2].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000eb5:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000eba:	c7 80 38 07 00 00 00 	mov    DWORD PTR [eax+0x738],0x0
 1000ec1:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:334
    }

    kATADeviceInfo[3].bus=ATASecondary;
 1000ec4:	8b 1d c0 02 00 02    	mov    ebx,DWORD PTR ds:0x20002c0
 1000eca:	c7 83 ba 09 00 00 01 	mov    DWORD PTR [ebx+0x9ba],0x1
 1000ed1:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:335
    kATADeviceInfo[3].driveNo=3;
 1000ed4:	c7 83 be 09 00 00 03 	mov    DWORD PTR [ebx+0x9be],0x3
 1000edb:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:336
    kATADeviceInfo[3].ioPort=0x170;
 1000ede:	c7 83 c2 09 00 00 70 	mov    DWORD PTR [ebx+0x9c2],0x170
 1000ee5:	01 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:337
    kATADeviceInfo[3].irqNum=0x15;
 1000ee8:	c6 83 c6 09 00 00 15 	mov    BYTE PTR [ebx+0x9c6],0x15
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:338
    kATADeviceInfo[3].driveHeadPortDesignation=0xB0;
 1000eef:	c6 83 c7 09 00 00 b0 	mov    BYTE PTR [ebx+0x9c7],0xb0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:339
    kATADeviceInfo[3].queryATAData=true;
 1000ef6:	c6 83 a9 09 00 00 01 	mov    BYTE PTR [ebx+0x9a9],0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:340
    kATADeviceInfo[3].ATADeviceAvailable=ataInit(&kATADeviceInfo[3]);
 1000efd:	83 ec 0c             	sub    esp,0xc
 1000f00:	8d 83 59 07 00 00    	lea    eax,[ebx+0x759]
 1000f06:	50                   	push   eax
 1000f07:	e8 e2 f9 ff ff       	call   10008ee <ataInit>
 1000f0c:	88 83 aa 09 00 00    	mov    BYTE PTR [ebx+0x9aa],al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:341
    if (kATADeviceInfo[3].ATADeviceAvailable)
 1000f12:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000f17:	83 c4 10             	add    esp,0x10
 1000f1a:	80 b8 aa 09 00 00 00 	cmp    BYTE PTR [eax+0x9aa],0x0
 1000f21:	74 3a                	je     1000f5d <ataScanForHarddrives+0x261>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:343
    {
        ataIdentify(&kATADeviceInfo[3]);
 1000f23:	83 ec 0c             	sub    esp,0xc
 1000f26:	05 59 07 00 00       	add    eax,0x759
 1000f2b:	50                   	push   eax
 1000f2c:	e8 b3 fc ff ff       	call   1000be4 <ataIdentify>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:344
        if (useCDROMIdentify)
 1000f31:	83 c4 10             	add    esp,0x10
 1000f34:	80 3d 68 2a 01 01 00 	cmp    BYTE PTR ds:0x1012a68,0x0
 1000f3b:	74 11                	je     1000f4e <ataScanForHarddrives+0x252>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:345
            kATADeviceInfo[3].ATADeviceType=ATA_DEVICE_TYPE_CD;
 1000f3d:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000f42:	c7 80 ab 09 00 00 01 	mov    DWORD PTR [eax+0x9ab],0x1
 1000f49:	00 00 00 
 1000f4c:	eb 0f                	jmp    1000f5d <ataScanForHarddrives+0x261>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:347
        else
            kATADeviceInfo[3].ATADeviceType=ATA_DEVICE_TYPE_HD;
 1000f4e:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000f53:	c7 80 ab 09 00 00 00 	mov    DWORD PTR [eax+0x9ab],0x0
 1000f5a:	00 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:351
    }

#ifndef DEBUG_NONE
    if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000f5d:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 1000f64:	74 22                	je     1000f88 <ataScanForHarddrives+0x28c>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:352
        printk("INIT: Disk1=%s  Disk2=%s\n", kATADeviceInfo[0].ATADeviceModel, kATADeviceInfo[1].ATADeviceModel);
 1000f66:	a1 c0 02 00 02       	mov    eax,ds:0x20002c0
 1000f6b:	83 ec 04             	sub    esp,0x4
 1000f6e:	8d 90 73 04 00 00    	lea    edx,[eax+0x473]
 1000f74:	52                   	push   edx
 1000f75:	05 00 02 00 00       	add    eax,0x200
 1000f7a:	50                   	push   eax
 1000f7b:	68 12 62 00 01       	push   0x1006212
 1000f80:	e8 a2 15 00 00       	call   1002527 <printk>
 1000f85:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:355
#endif
            return 0;
}
 1000f88:	b8 00 00 00 00       	mov    eax,0x0
 1000f8d:	83 c4 08             	add    esp,0x8
 1000f90:	5b                   	pop    ebx
 1000f91:	c3                   	ret    

01000f92 <ataBlockingRead28>:
ataBlockingRead28():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:365
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:370
    //For now if the FAT library calls this, we assume we've already read the same partition most recently
    int lResult=0;
    uint8_t* bufp=buffer;
    uint32_t lSectorsLeft=sector_count;
    uint32_t lSector=sector+partOffset; //this represents the start of the partition
 1000f9d:	a1 60 2a 01 01       	mov    eax,ds:0x1012a60
 1000fa2:	03 44 24 30          	add    eax,DWORD PTR [esp+0x30]
 1000fa6:	89 c5                	mov    ebp,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:373

#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 1000fa8:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 1000faf:	74 18                	je     1000fc9 <ataBlockingRead28+0x37>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:375
        {
            printk("ataBlockingRead28: sec: 0x%08X, buf 0x%08X, cnt 0x%08X\n", lSector, bufp, sector_count);
 1000fb1:	ff 74 24 38          	push   DWORD PTR [esp+0x38]
 1000fb5:	56                   	push   esi
 1000fb6:	50                   	push   eax
 1000fb7:	68 54 67 00 01       	push   0x1006754
 1000fbc:	e8 66 15 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:376
            waitForKeyboardKey();
 1000fc1:	e8 a2 f4 ff ff       	call   1000468 <waitForKeyboardKey>
 1000fc6:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:379
        }
#endif
    lResult=ataWaitForIdle(atablockingReadDev);
 1000fc9:	83 ec 0c             	sub    esp,0xc
 1000fcc:	ff 35 20 80 00 01    	push   DWORD PTR ds:0x1008020
 1000fd2:	e8 cc f6 ff ff       	call   10006a3 <ataWaitForIdle>
 1000fd7:	0f b6 c0             	movzx  eax,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:380
    if (lResult)
 1000fda:	83 c4 10             	add    esp,0x10
 1000fdd:	85 c0                	test   eax,eax
 1000fdf:	74 11                	je     1000ff2 <ataBlockingRead28+0x60>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:381
        panic("ataBlockingRead28: Timeout waiting for DRQ and BSY to be clear (0x%02X)", lResult);
 1000fe1:	83 ec 08             	sub    esp,0x8
 1000fe4:	50                   	push   eax
 1000fe5:	68 8c 67 00 01       	push   0x100678c
 1000fea:	e8 b5 10 00 00       	call   10020a4 <panic>
 1000fef:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:386
        //Select the drive we want
        //NOTE: Drive selected prior to calling this function
        //ataSelectDrive(drive,0);
        //Magic bit (6) to set LBA mode and top 4 bits of LBA28 sector # go in bottom 4
    outb(atablockingReadDev->ioPort+ATA_DRIVE_SELECT, inb(atablockingReadDev->ioPort+ATA_DRIVE_SELECT) | (1 << 6) | ((lSector >> 24) & 0x0F));
 1000ff2:	8b 1d 20 80 00 01    	mov    ebx,DWORD PTR ds:0x1008020
 1000ff8:	8b 8b 69 02 00 00    	mov    ecx,DWORD PTR [ebx+0x269]
 1000ffe:	8d 51 06             	lea    edx,[ecx+0x6]
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1001001:	ec                   	in     al,dx
 1001002:	89 c7                	mov    edi,eax
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:396
    //Send the LBA sector number in the next 3 fields + high bit in the 
    outb(atablockingReadDev->ioPort+ATA_PORT_SECTOR_NUMBER, (lSector) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_CYLINDER_LOW, (lSector >> 8) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_CYLINDER_HIGH, (lSector >> 16) & 0xFF);
    outb(atablockingReadDev->ioPort+ATA_PORT_COMMAND, ATA_COMMAND_READ_SECTOR);
    lResult=ataWaitForDRQ(atablockingReadDev, true, ATA_STANDARD_WAIT_MS*kTicksPerMS);
 100103c:	83 ec 04             	sub    esp,0x4
 100103f:	a1 84 02 00 02       	mov    eax,ds:0x2000284
 1001044:	8d 04 80             	lea    eax,[eax+eax*4]
 1001047:	01 c0                	add    eax,eax
 1001049:	50                   	push   eax
 100104a:	6a 01                	push   0x1
 100104c:	53                   	push   ebx
 100104d:	e8 e2 f5 ff ff       	call   1000634 <ataWaitForDRQ>
 1001052:	0f b6 c0             	movzx  eax,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:397
    if (lResult)
 1001055:	83 c4 10             	add    esp,0x10
 1001058:	85 c0                	test   eax,eax
 100105a:	74 17                	je     1001073 <ataBlockingRead28+0xe1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:398
        panic("ataBlockingRead28: Timeout waiting for DRQ to be set Stts=0x%02X, Err=0x%02X", lResult, hdError);
 100105c:	83 ec 04             	sub    esp,0x4
 100105f:	ff 35 64 2a 01 01    	push   DWORD PTR ds:0x1012a64
 1001065:	50                   	push   eax
 1001066:	68 d4 67 00 01       	push   0x10067d4
 100106b:	e8 34 10 00 00       	call   10020a4 <panic>
 1001070:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:399
    while (lSectorsLeft)
 1001073:	83 7c 24 38 00       	cmp    DWORD PTR [esp+0x38],0x0
 1001078:	0f 84 e7 00 00 00    	je     1001165 <ataBlockingRead28+0x1d3>
 100107e:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
 1001082:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:401
    {
        insw(atablockingReadDev->ioPort+ATA_PORT_DATA, bufp, 256);
 1001086:	a1 20 80 00 01       	mov    eax,ds:0x1008020
insw():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:87
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:403
        #ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 100109c:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 10010a3:	74 40                	je     10010e5 <ataBlockingRead28+0x153>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:405
            {
                printk("ataBlockingRead28: Debugging: ");
 10010a5:	83 ec 0c             	sub    esp,0xc
 10010a8:	68 24 68 00 01       	push   0x1006824
 10010ad:	e8 75 14 00 00       	call   1002527 <printk>
 10010b2:	89 f3                	mov    ebx,esi
 10010b4:	8d 7e 14             	lea    edi,[esi+0x14]
 10010b7:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:407 (discriminator 3)
                for (int cnt2=0;cnt2<20;cnt2++)
                    printk("%02X ", bufp[cnt2]);
 10010ba:	83 ec 08             	sub    esp,0x8
 10010bd:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 10010c0:	50                   	push   eax
 10010c1:	68 2c 62 00 01       	push   0x100622c
 10010c6:	e8 5c 14 00 00       	call   1002527 <printk>
 10010cb:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:406 (discriminator 3)
        insw(atablockingReadDev->ioPort+ATA_PORT_DATA, bufp, 256);
        #ifndef DEBUG_NONE
            if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
            {
                printk("ataBlockingRead28: Debugging: ");
                for (int cnt2=0;cnt2<20;cnt2++)
 10010ce:	83 c4 10             	add    esp,0x10
 10010d1:	39 df                	cmp    edi,ebx
 10010d3:	75 e5                	jne    10010ba <ataBlockingRead28+0x128>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:408
                    printk("%02X ", bufp[cnt2]);
                printk("\n");
 10010d5:	83 ec 0c             	sub    esp,0xc
 10010d8:	68 5b 65 00 01       	push   0x100655b
 10010dd:	e8 45 14 00 00       	call   1002527 <printk>
 10010e2:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:411
            }
        #endif
        if (--lSectorsLeft>0) //zero based vs 1 based
 10010e5:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
 10010ea:	74 79                	je     1001165 <ataBlockingRead28+0x1d3>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:413
        {
            wait(50);
 10010ec:	83 ec 0c             	sub    esp,0xc
 10010ef:	6a 32                	push   0x32
 10010f1:	e8 da 1d 00 00       	call   1002ed0 <wait>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:414
            lResult=ataWaitForDRQ(atablockingReadDev, true, ATA_STANDARD_WAIT_MS*kTicksPerMS);
 10010f6:	83 c4 0c             	add    esp,0xc
 10010f9:	a1 84 02 00 02       	mov    eax,ds:0x2000284
 10010fe:	8d 04 80             	lea    eax,[eax+eax*4]
 1001101:	01 c0                	add    eax,eax
 1001103:	50                   	push   eax
 1001104:	6a 01                	push   0x1
 1001106:	ff 35 20 80 00 01    	push   DWORD PTR ds:0x1008020
 100110c:	e8 23 f5 ff ff       	call   1000634 <ataWaitForDRQ>
 1001111:	0f b6 c0             	movzx  eax,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:415
            bufp+=512;
 1001114:	81 c6 00 02 00 00    	add    esi,0x200
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:416
            lSector++;
 100111a:	83 c5 01             	add    ebp,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:417
            if (lResult)
 100111d:	83 c4 10             	add    esp,0x10
 1001120:	85 c0                	test   eax,eax
 1001122:	74 17                	je     100113b <ataBlockingRead28+0x1a9>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:418
                panic("ataBlockingRead28: Timeout in read loop, waiting for DRQ to be set Stts=0x%02X, Err=0x%02X", lResult, hdError);
 1001124:	83 ec 04             	sub    esp,0x4
 1001127:	ff 35 64 2a 01 01    	push   DWORD PTR ds:0x1012a64
 100112d:	50                   	push   eax
 100112e:	68 44 68 00 01       	push   0x1006844
 1001133:	e8 6c 0f 00 00       	call   10020a4 <panic>
 1001138:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:420
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_HARDDRIVE) == DEBUG_HARDDRIVE)
 100113b:	f6 05 38 03 00 02 08 	test   BYTE PTR ds:0x2000338,0x8
 1001142:	0f 84 3e ff ff ff    	je     1001086 <ataBlockingRead28+0xf4>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:422
        {
            printk("ataBlockingRead28: sec=0x%08X, buf=0x%08X, rep=0x%08X    \n", lSector, bufp, lSectorsLeft);
 1001148:	ff 74 24 0c          	push   DWORD PTR [esp+0xc]
 100114c:	56                   	push   esi
 100114d:	55                   	push   ebp
 100114e:	68 a0 68 00 01       	push   0x10068a0
 1001153:	e8 cf 13 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:423
            waitForKeyboardKey();
 1001158:	e8 0b f3 ff ff       	call   1000468 <waitForKeyboardKey>
 100115d:	83 c4 10             	add    esp,0x10
 1001160:	e9 21 ff ff ff       	jmp    1001086 <ataBlockingRead28+0xf4>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:428
        }
#endif
        }
    }
    return 512*sector_count;
 1001165:	8b 44 24 38          	mov    eax,DWORD PTR [esp+0x38]
 1001169:	c1 e0 09             	shl    eax,0x9
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:429
}
 100116c:	83 c4 1c             	add    esp,0x1c
 100116f:	5b                   	pop    ebx
 1001170:	5e                   	pop    esi
 1001171:	5f                   	pop    edi
 1001172:	5d                   	pop    ebp
 1001173:	c3                   	ret    

01001174 <ataReadDisk>:
ataReadDisk():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:357
        printk("INIT: Disk1=%s  Disk2=%s\n", kATADeviceInfo[0].ATADeviceModel, kATADeviceInfo[1].ATADeviceModel);
#endif
            return 0;
}
int ataReadDisk(struct ataDeviceInfo_t* devInfo, uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
 1001174:	83 ec 0c             	sub    esp,0xc
 1001177:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:358
    atablockingReadDev = devInfo;
 100117b:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 100117f:	89 15 20 80 00 01    	mov    DWORD PTR ds:0x1008020,edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:359
    if (sector_count==0)    //this function can be called with a sector_count of 0 in order to set partOffset
 1001185:	85 c0                	test   eax,eax
 1001187:	74 16                	je     100119f <ataReadDisk+0x2b>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:361
        return -1;
    return ataBlockingRead28(sector, buffer, sector_count);
 1001189:	83 ec 04             	sub    esp,0x4
 100118c:	50                   	push   eax
 100118d:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 1001191:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 1001195:	e8 f8 fd ff ff       	call   1000f92 <ataBlockingRead28>
 100119a:	83 c4 10             	add    esp,0x10
 100119d:	eb 05                	jmp    10011a4 <ataReadDisk+0x30>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:360
}
int ataReadDisk(struct ataDeviceInfo_t* devInfo, uint32_t sector, uint8_t *buffer, uint32_t sector_count)
{
    atablockingReadDev = devInfo;
    if (sector_count==0)    //this function can be called with a sector_count of 0 in order to set partOffset
        return -1;
 100119f:	b8 ff ff ff ff       	mov    eax,0xffffffff
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:362
    return ataBlockingRead28(sector, buffer, sector_count);
}
 10011a4:	83 c4 0c             	add    esp,0xc
 10011a7:	c3                   	ret    

010011a8 <ataBlockingWrite28>:
ataBlockingWrite28():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/ata_disk.c:468
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:19
extern uint32_t*  kKernelPageDir;
extern uint64_t kE820MemoryBytes;
extern uint32_t kDebugLevel;

uint32_t kPagingGet4kPDEntryValue(uint32_t address)
{
 10011ac:	53                   	push   ebx
 10011ad:	83 ec 08             	sub    esp,0x8
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:21
    address&=0xFFFFF000;
    uintptr_t* lTemp=(uint32_t*)((KERNEL_PAGE_DIR_ADDRESS + (((address & 0xFFC00000) >> 22) << 2)));
 10011b0:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10011b4:	c1 eb 16             	shr    ebx,0x16
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:23
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10011b7:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 10011be:	74 17                	je     10011d7 <kPagingGet4kPDEntryValue+0x2b>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:24
            printk("pagingGet4kPDEntryValue: dirAddressPtr=0x%08x\n", *lTemp);
 10011c0:	83 ec 08             	sub    esp,0x8
 10011c3:	ff 34 9d 00 d0 2d 00 	push   DWORD PTR [ebx*4+0x2dd000]
 10011ca:	68 dc 68 00 01       	push   0x10068dc
 10011cf:	e8 53 13 00 00       	call   1002527 <printk>
 10011d4:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:26
#endif
    return (uint32_t)*lTemp;
 10011d7:	8b 04 9d 00 d0 2d 00 	mov    eax,DWORD PTR [ebx*4+0x2dd000]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:27
}
 10011de:	83 c4 08             	add    esp,0x8
 10011e1:	5b                   	pop    ebx
 10011e2:	c3                   	ret    

010011e3 <kPagingGet4kPDEntryAddress>:
kPagingGet4kPDEntryAddress():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:30

uint32_t kPagingGet4kPDEntryAddress(uint32_t address)
{
 10011e3:	53                   	push   ebx
 10011e4:	83 ec 08             	sub    esp,0x8
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:32
    address&=0xFFFFF000;
    uintptr_t lTemp=((KERNEL_PAGE_DIR_ADDRESS  | (((address & 0xFFC00000) >> 22) << 2)));
 10011e7:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10011eb:	c1 eb 16             	shr    ebx,0x16
 10011ee:	c1 e3 02             	shl    ebx,0x2
 10011f1:	81 cb 00 d0 2d 00    	or     ebx,0x2dd000
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:34
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10011f7:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 10011fe:	74 11                	je     1001211 <kPagingGet4kPDEntryAddress+0x2e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:35
            printk("dirEntryAddress=0x%08x\n", lTemp);
 1001200:	83 ec 08             	sub    esp,0x8
 1001203:	53                   	push   ebx
 1001204:	68 32 62 00 01       	push   0x1006232
 1001209:	e8 19 13 00 00       	call   1002527 <printk>
 100120e:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:38
#endif
    return (uint32_t)lTemp & 0xFFFFFFFF;
}
 1001211:	89 d8                	mov    eax,ebx
 1001213:	83 c4 08             	add    esp,0x8
 1001216:	5b                   	pop    ebx
 1001217:	c3                   	ret    

01001218 <kPagingGet4kPTEntryAddress>:
kPagingGet4kPTEntryAddress():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:41

uint32_t kPagingGet4kPTEntryAddress(uint32_t address)
{
 1001218:	53                   	push   ebx
 1001219:	83 ec 14             	sub    esp,0x14
 100121c:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:43
    address&=0xFFFFF000;
    uintptr_t pDirPtr=kPagingGet4kPDEntryValue(address) & 0xFFFFF000;
 1001220:	89 d8                	mov    eax,ebx
 1001222:	25 00 f0 ff ff       	and    eax,0xfffff000
 1001227:	50                   	push   eax
 1001228:	e8 7f ff ff ff       	call   10011ac <kPagingGet4kPDEntryValue>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:44
    return ((address & 0x3FF000) >> 12) << 2 | pDirPtr;
 100122d:	81 e3 00 f0 3f 00    	and    ebx,0x3ff000
 1001233:	c1 eb 0a             	shr    ebx,0xa
 1001236:	25 00 f0 ff ff       	and    eax,0xfffff000
 100123b:	09 d8                	or     eax,ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:45
}
 100123d:	83 c4 18             	add    esp,0x18
 1001240:	5b                   	pop    ebx
 1001241:	c3                   	ret    

01001242 <kPagingGet4kPTEntryValue>:
kPagingGet4kPTEntryValue():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:48

uint32_t kPagingGet4kPTEntryValue(uint32_t address)
{
 1001242:	53                   	push   ebx
 1001243:	83 ec 14             	sub    esp,0x14
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:50
    address&=0xFFFFF000;
    uint32_t* pTablePtr=(uint32_t*)kPagingGet4kPTEntryAddress(address);
 1001246:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 100124a:	25 00 f0 ff ff       	and    eax,0xfffff000
 100124f:	50                   	push   eax
 1001250:	e8 c3 ff ff ff       	call   1001218 <kPagingGet4kPTEntryAddress>
 1001255:	89 c3                	mov    ebx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:52
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001257:	83 c4 10             	add    esp,0x10
 100125a:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 1001261:	74 11                	je     1001274 <kPagingGet4kPTEntryValue+0x32>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:53
             printk("pagingGet4kPTEntryValue: pageEntryAddress=0x%08X\n", pTablePtr);
 1001263:	83 ec 08             	sub    esp,0x8
 1001266:	50                   	push   eax
 1001267:	68 0c 69 00 01       	push   0x100690c
 100126c:	e8 b6 12 00 00       	call   1002527 <printk>
 1001271:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:56
             //printf("pageEntryValue=0x%08X\n", *pTablePtr);
#endif
    return *pTablePtr;
 1001274:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:57
}
 1001276:	83 c4 08             	add    esp,0x8
 1001279:	5b                   	pop    ebx
 100127a:	c3                   	ret    

0100127b <kPagingSetPageReadOnlyFlag>:
kPagingSetPageReadOnlyFlag():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:60

void kPagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly)
{
 100127b:	56                   	push   esi
 100127c:	53                   	push   ebx
 100127d:	83 ec 04             	sub    esp,0x4
 1001280:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1001284:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:62
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001288:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 100128f:	74 13                	je     10012a4 <kPagingSetPageReadOnlyFlag+0x29>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:63
            printk("pagingMakePageReadOnly: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 1001291:	83 ec 04             	sub    esp,0x4
 1001294:	ff 33                	push   DWORD PTR [ebx]
 1001296:	53                   	push   ebx
 1001297:	68 40 69 00 01       	push   0x1006940
 100129c:	e8 86 12 00 00       	call   1002527 <printk>
 10012a1:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:65
#endif
         if (readOnly)
 10012a4:	89 f0                	mov    eax,esi
 10012a6:	84 c0                	test   al,al
 10012a8:	74 05                	je     10012af <kPagingSetPageReadOnlyFlag+0x34>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:66
            *ptEntry&=0xFFFFFFFD;
 10012aa:	83 23 fd             	and    DWORD PTR [ebx],0xfffffffd
 10012ad:	eb 03                	jmp    10012b2 <kPagingSetPageReadOnlyFlag+0x37>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:68
         else
            *ptEntry|=2; 
 10012af:	83 0b 02             	or     DWORD PTR [ebx],0x2
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:69
    RELOAD_CR3
 10012b2:	0f 20 d8             	mov    eax,cr3
 10012b5:	0f 22 d8             	mov    cr3,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:71
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10012b8:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 10012bf:	74 12                	je     10012d3 <kPagingSetPageReadOnlyFlag+0x58>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:72
            printk("0x%08X\n", *ptEntry);
 10012c1:	83 ec 08             	sub    esp,0x8
 10012c4:	ff 33                	push   DWORD PTR [ebx]
 10012c6:	68 ce 62 00 01       	push   0x10062ce
 10012cb:	e8 57 12 00 00       	call   1002527 <printk>
 10012d0:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:74
#endif
}
 10012d3:	83 c4 04             	add    esp,0x4
 10012d6:	5b                   	pop    ebx
 10012d7:	5e                   	pop    esi
 10012d8:	c3                   	ret    

010012d9 <kPagingUpdatePTEPresentFlag>:
kPagingUpdatePTEPresentFlag():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:77

void kPagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present)
{
 10012d9:	56                   	push   esi
 10012da:	53                   	push   ebx
 10012db:	83 ec 04             	sub    esp,0x4
 10012de:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10012e2:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:78
         printd(DEBUG_PAGING,"pagingUpdatePTEPresentFlag: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 10012e6:	ff 33                	push   DWORD PTR [ebx]
 10012e8:	53                   	push   ebx
 10012e9:	68 78 69 00 01       	push   0x1006978
 10012ee:	6a 40                	push   0x40
 10012f0:	e8 4a 12 00 00       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:79
         if (present)
 10012f5:	83 c4 10             	add    esp,0x10
 10012f8:	89 f0                	mov    eax,esi
 10012fa:	84 c0                	test   al,al
 10012fc:	74 05                	je     1001303 <kPagingUpdatePTEPresentFlag+0x2a>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:80
             *ptEntry=*ptEntry | 1;
 10012fe:	83 0b 01             	or     DWORD PTR [ebx],0x1
 1001301:	eb 03                	jmp    1001306 <kPagingUpdatePTEPresentFlag+0x2d>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:82
         else
             *ptEntry&=0xFFFFFFFE;
 1001303:	83 23 fe             	and    DWORD PTR [ebx],0xfffffffe
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:83
         __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
 1001306:	0f 20 d8             	mov    eax,cr3
 1001309:	0f 22 d8             	mov    cr3,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:84
         printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 100130c:	83 ec 04             	sub    esp,0x4
 100130f:	ff 33                	push   DWORD PTR [ebx]
 1001311:	68 ce 62 00 01       	push   0x10062ce
 1001316:	6a 40                	push   0x40
 1001318:	e8 22 12 00 00       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:85
}
 100131d:	83 c4 14             	add    esp,0x14
 1001320:	5b                   	pop    ebx
 1001321:	5e                   	pop    esi
 1001322:	c3                   	ret    

01001323 <kSetVirtualRangeRO>:
kSetVirtualRangeRO():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:88

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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:91
    uintptr_t* startPTE;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001338:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 100133f:	74 12                	je     1001353 <kSetVirtualRangeRO+0x30>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:92
           printk("kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
 1001341:	83 ec 04             	sub    esp,0x4
 1001344:	55                   	push   ebp
 1001345:	53                   	push   ebx
 1001346:	68 b4 69 00 01       	push   0x10069b4
 100134b:	e8 d7 11 00 00       	call   1002527 <printk>
 1001350:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:94 (discriminator 1)
#endif
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 1001353:	83 c5 01             	add    ebp,0x1
 1001356:	39 eb                	cmp    ebx,ebp
 1001358:	77 5b                	ja     10013b5 <kSetVirtualRangeRO+0x92>
 100135a:	89 f0                	mov    eax,esi
 100135c:	84 c0                	test   al,al
 100135e:	b8 4d 62 00 01       	mov    eax,0x100624d
 1001363:	ba 4a 62 00 01       	mov    edx,0x100624a
 1001368:	0f 45 c2             	cmovne eax,edx
 100136b:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:101
        startPTE=(uintptr_t*)kPagingGet4kPTEntryAddress(cnt);
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
            printk("0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
#endif
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 100136f:	89 f8                	mov    eax,edi
 1001371:	0f b6 f8             	movzx  edi,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:96
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:98
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 100137f:	83 c4 10             	add    esp,0x10
 1001382:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 1001389:	74 13                	je     100139e <kSetVirtualRangeRO+0x7b>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:99 (discriminator 4)
            printk("0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
 100138b:	ff 74 24 0c          	push   DWORD PTR [esp+0xc]
 100138f:	50                   	push   eax
 1001390:	53                   	push   ebx
 1001391:	68 50 62 00 01       	push   0x1006250
 1001396:	e8 8c 11 00 00       	call   1002527 <printk>
 100139b:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:101 (discriminator 2)
#endif
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 100139e:	83 ec 08             	sub    esp,0x8
 10013a1:	57                   	push   edi
 10013a2:	56                   	push   esi
 10013a3:	e8 d3 fe ff ff       	call   100127b <kPagingSetPageReadOnlyFlag>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:94 (discriminator 2)
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:105
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:109

//Absolute version, page passed is already virtual
void kpagingUpdatePresentFlagA(uint32_t address, bool present)
{
 10013bd:	56                   	push   esi
 10013be:	53                   	push   ebx
 10013bf:	83 ec 04             	sub    esp,0x4
 10013c2:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 10013c6:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:111
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10013ca:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 10013d1:	74 21                	je     10013f4 <kpagingUpdatePresentFlagA+0x37>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:112
            printk("kpagingUpdatePresentFlagA: Make 0x%08X %s\n", address, present?"present":"not present");
 10013d3:	84 db                	test   bl,bl
 10013d5:	ba 68 62 00 01       	mov    edx,0x1006268
 10013da:	b8 6c 62 00 01       	mov    eax,0x100626c
 10013df:	0f 44 c2             	cmove  eax,edx
 10013e2:	83 ec 04             	sub    esp,0x4
 10013e5:	50                   	push   eax
 10013e6:	56                   	push   esi
 10013e7:	68 e4 69 00 01       	push   0x10069e4
 10013ec:	e8 36 11 00 00       	call   1002527 <printk>
 10013f1:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:114
#endif
        uintptr_t* pagePTE= (uintptr_t*)kPagingGet4kPTEntryAddress(address&0xFFFFF000);
 10013f4:	83 ec 0c             	sub    esp,0xc
 10013f7:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 10013fd:	56                   	push   esi
 10013fe:	e8 15 fe ff ff       	call   1001218 <kPagingGet4kPTEntryAddress>
 1001403:	89 c6                	mov    esi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:116
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001405:	83 c4 10             	add    esp,0x10
 1001408:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 100140f:	74 11                	je     1001422 <kpagingUpdatePresentFlagA+0x65>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:117
            printk("kpagingUpdatePresentFlagA: updating entry 0x%08X\n", pagePTE);
 1001411:	83 ec 08             	sub    esp,0x8
 1001414:	50                   	push   eax
 1001415:	68 10 6a 00 01       	push   0x1006a10
 100141a:	e8 08 11 00 00       	call   1002527 <printk>
 100141f:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:119
#endif
        kPagingUpdatePTEPresentFlag(pagePTE, present);
 1001422:	83 ec 08             	sub    esp,0x8
 1001425:	0f b6 db             	movzx  ebx,bl
 1001428:	53                   	push   ebx
 1001429:	56                   	push   esi
 100142a:	e8 aa fe ff ff       	call   10012d9 <kPagingUpdatePTEPresentFlag>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:120
}
 100142f:	83 c4 14             	add    esp,0x14
 1001432:	5b                   	pop    ebx
 1001433:	5e                   	pop    esi
 1001434:	c3                   	ret    

01001435 <kpagingUpdatePresentFlagV>:
kpagingUpdatePresentFlagV():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:123

void kpagingUpdatePresentFlagV(uint32_t address, bool present)
{
 1001435:	83 ec 14             	sub    esp,0x14
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:125
    address+=KERNEL_PAGED_BASE_ADDRESS; 
    kpagingUpdatePresentFlagA(address, present);
 1001438:	0f b6 44 24 1c       	movzx  eax,BYTE PTR [esp+0x1c]
 100143d:	50                   	push   eax
 100143e:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1001442:	2d 00 00 00 40       	sub    eax,0x40000000
 1001447:	50                   	push   eax
 1001448:	e8 70 ff ff ff       	call   10013bd <kpagingUpdatePresentFlagA>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:126
}
 100144d:	83 c4 1c             	add    esp,0x1c
 1001450:	c3                   	ret    

01001451 <kMapPage>:
kMapPage():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:129

void kMapPage(uintptr_t mapTo, uintptr_t mapFrom, uint8_t flags)
{
 1001451:	57                   	push   edi
 1001452:	56                   	push   esi
 1001453:	53                   	push   ebx
 1001454:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
 1001458:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:134
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)kKernelPageDir;
    ptrVal=ptr[(mapTo>>22)];
 100145c:	89 cb                	mov    ebx,ecx
 100145e:	c1 eb 16             	shr    ebx,0x16
 1001461:	a1 a4 02 00 02       	mov    eax,ds:0x20002a4
 1001466:	8d 1c 98             	lea    ebx,[eax+ebx*4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:135
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
 1001469:	83 3b 00             	cmp    DWORD PTR [ebx],0x0
 100146c:	75 6a                	jne    10014d8 <kMapPage+0x87>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:135 (discriminator 1)
 100146e:	bf 00 00 00 00       	mov    edi,0x0
 1001473:	3b 3d 4c 00 00 02    	cmp    edi,DWORD PTR ds:0x200004c
 1001479:	72 08                	jb     1001483 <kMapPage+0x32>
 100147b:	3b 0d 48 00 00 02    	cmp    ecx,DWORD PTR ds:0x2000048
 1001481:	73 41                	jae    10014c4 <kMapPage+0x73>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:138
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
 1001483:	c7 03 63 00 00 20    	mov    DWORD PTR [ebx],0x20000063
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:139
        ptrT[(mapTo&0x003FFFFF/4096)]=mapFrom | flags;
 1001489:	89 c8                	mov    eax,ecx
 100148b:	25 ff 03 00 00       	and    eax,0x3ff
 1001490:	8d 34 85 00 00 00 20 	lea    esi,[eax*4+0x20000000]
 1001497:	0f b6 d2             	movzx  edx,dl
 100149a:	0b 54 24 14          	or     edx,DWORD PTR [esp+0x14]
 100149e:	89 14 85 00 00 00 20 	mov    DWORD PTR [eax*4+0x20000000],edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:141
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10014a5:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 10014ac:	74 64                	je     1001512 <kMapPage+0xc1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:142
            printk("kMapPage: Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)],ptrT[(mapTo&0x003FFFFF/4096)]);
 10014ae:	83 ec 0c             	sub    esp,0xc
 10014b1:	52                   	push   edx
 10014b2:	56                   	push   esi
 10014b3:	53                   	push   ebx
 10014b4:	51                   	push   ecx
 10014b5:	68 44 6a 00 01       	push   0x1006a44
 10014ba:	e8 68 10 00 00       	call   1002527 <printk>
 10014bf:	83 c4 20             	add    esp,0x20
 10014c2:	eb 4e                	jmp    1001512 <kMapPage+0xc1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:150
    else
    {
        //ptrVal right now points to the pdir entry
        ptr=(uint32_t*)kKernelPageDir;
        if (ptr[(mapTo>>22)]==0)
            ptr[mapTo>>22]=(KERNEL_PAGE_TABLE_BASE_ADDRESS + ((mapTo&0x003FFFFF)/4096)) | 0x63;
 10014c4:	89 c8                	mov    eax,ecx
 10014c6:	25 ff ff 3f 00       	and    eax,0x3fffff
 10014cb:	c1 e8 0c             	shr    eax,0xc
 10014ce:	05 00 f0 2e 00       	add    eax,0x2ef000
 10014d3:	83 c8 63             	or     eax,0x63
 10014d6:	89 03                	mov    DWORD PTR [ebx],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:156
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:160
//                printk("ptrT=%X(%X)\n",&ptrT[ptrVal],ptrT[ptrVal]);
//                STOPHERE2
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10014f5:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 10014fc:	74 14                	je     1001512 <kMapPage+0xc1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:161
            printk("2) Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal],ptrT[ptrVal]);
 10014fe:	83 ec 0c             	sub    esp,0xc
 1001501:	52                   	push   edx
 1001502:	50                   	push   eax
 1001503:	53                   	push   ebx
 1001504:	51                   	push   ecx
 1001505:	68 84 6a 00 01       	push   0x1006a84
 100150a:	e8 18 10 00 00       	call   1002527 <printk>
 100150f:	83 c4 20             	add    esp,0x20
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:165
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:168

bool kIsPageMapped(uintptr_t Address)
{
 1001516:	83 ec 18             	sub    esp,0x18
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:169
    if (!kPagingGet4kPTEntryValue(Address))
 1001519:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100151d:	e8 20 fd ff ff       	call   1001242 <kPagingGet4kPTEntryValue>
 1001522:	85 c0                	test   eax,eax
 1001524:	0f 95 c0             	setne  al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:172
        return false;
    return true;
}
 1001527:	83 c4 1c             	add    esp,0x1c
 100152a:	c3                   	ret    

0100152b <kUnMapPage>:
kUnMapPage():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:175

void kUnMapPage(uintptr_t mapTo, uint8_t newFlags)
{
 100152b:	57                   	push   edi
 100152c:	56                   	push   esi
 100152d:	53                   	push   ebx
 100152e:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
 1001532:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:180
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)kKernelPageDir;
    ptrVal=ptr[(mapTo>>22)];
 1001536:	89 cb                	mov    ebx,ecx
 1001538:	c1 eb 16             	shr    ebx,0x16
 100153b:	a1 a4 02 00 02       	mov    eax,ds:0x20002a4
 1001540:	8d 1c 98             	lea    ebx,[eax+ebx*4]
 1001543:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:181
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
 1001545:	85 c0                	test   eax,eax
 1001547:	75 4e                	jne    1001597 <kUnMapPage+0x6c>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:181 (discriminator 1)
 1001549:	bf 00 00 00 00       	mov    edi,0x0
 100154e:	3b 3d 4c 00 00 02    	cmp    edi,DWORD PTR ds:0x200004c
 1001554:	72 08                	jb     100155e <kUnMapPage+0x33>
 1001556:	3b 0d 48 00 00 02    	cmp    ecx,DWORD PTR ds:0x2000048
 100155c:	73 39                	jae    1001597 <kUnMapPage+0x6c>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:184
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
 100155e:	c7 03 63 00 00 20    	mov    DWORD PTR [ebx],0x20000063
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:185
        ptrT[(mapTo&0x003FFFFF/4096)]=0 | newFlags;
 1001564:	89 c8                	mov    eax,ecx
 1001566:	25 ff 03 00 00       	and    eax,0x3ff
 100156b:	8d 34 85 00 00 00 20 	lea    esi,[eax*4+0x20000000]
 1001572:	0f b6 d2             	movzx  edx,dl
 1001575:	89 14 85 00 00 00 20 	mov    DWORD PTR [eax*4+0x20000000],edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:187
#ifndef DEBUG_NONE
         if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 100157c:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 1001583:	74 43                	je     10015c8 <kUnMapPage+0x9d>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:188
            printk("kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)]);
 1001585:	56                   	push   esi
 1001586:	53                   	push   ebx
 1001587:	51                   	push   ecx
 1001588:	68 c0 6a 00 01       	push   0x1006ac0
 100158d:	e8 95 0f 00 00       	call   1002527 <printk>
 1001592:	83 c4 10             	add    esp,0x10
 1001595:	eb 31                	jmp    10015c8 <kUnMapPage+0x9d>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:200
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:204
//                printk("ptrT=%X(%X)\n",&ptrT[ptrVal],ptrT[ptrVal]);
//                STOPHERE2
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10015af:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 10015b6:	74 10                	je     10015c8 <kUnMapPage+0x9d>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:205
            printk("2) Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal]);
 10015b8:	50                   	push   eax
 10015b9:	53                   	push   ebx
 10015ba:	51                   	push   ecx
 10015bb:	68 f8 6a 00 01       	push   0x1006af8
 10015c0:	e8 62 0f 00 00       	call   1002527 <printk>
 10015c5:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:209
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:212

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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:214
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 10015df:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 10015e6:	74 22                	je     100160a <kSetPhysicalRangeRO+0x3e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:215
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
 10015fd:	68 28 6b 00 01       	push   0x1006b28
 1001602:	e8 20 0f 00 00       	call   1002527 <printk>
 1001607:	83 c4 20             	add    esp,0x20
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:217
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:218
}
 1001630:	83 c4 1c             	add    esp,0x1c
 1001633:	5b                   	pop    ebx
 1001634:	5e                   	pop    esi
 1001635:	5f                   	pop    edi
 1001636:	5d                   	pop    ebp
 1001637:	c3                   	ret    

01001638 <mmKernelSetPageInUseFlag>:
mmKernelSetPageInUseFlag():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:221

void mmKernelSetPageInUseFlag(uintptr_t address, bool inUse)
{
 1001638:	56                   	push   esi
 1001639:	53                   	push   ebx
 100163a:	83 ec 04             	sub    esp,0x4
 100163d:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 1001641:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:224
    uintptr_t* ptEntry;
#ifndef DEBUG_NONE
        if ((kDebugLevel & DEBUG_PAGING) == DEBUG_PAGING)
 1001645:	f6 05 38 03 00 02 40 	test   BYTE PTR ds:0x2000338,0x40
 100164c:	74 22                	je     1001670 <mmKernelSetPageInUseFlag+0x38>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:225
           printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 100164e:	89 f0                	mov    eax,esi
 1001650:	84 c0                	test   al,al
 1001652:	ba 74 62 00 01       	mov    edx,0x1006274
 1001657:	b8 78 62 00 01       	mov    eax,0x1006278
 100165c:	0f 44 c2             	cmove  eax,edx
 100165f:	50                   	push   eax
 1001660:	53                   	push   ebx
 1001661:	68 68 6b 00 01       	push   0x1006b68
 1001666:	6a 40                	push   0x40
 1001668:	e8 d2 0e 00 00       	call   100253f <printd>
 100166d:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:227
#endif
        ptEntry=(uintptr_t*)kPagingGet4kPTEntryAddress(address);
 1001670:	83 ec 0c             	sub    esp,0xc
 1001673:	53                   	push   ebx
 1001674:	e8 9f fb ff ff       	call   1001218 <kPagingGet4kPTEntryAddress>
 1001679:	89 c3                	mov    ebx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:228
        printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 100167b:	ff 30                	push   DWORD PTR [eax]
 100167d:	50                   	push   eax
 100167e:	68 ac 6b 00 01       	push   0x1006bac
 1001683:	6a 40                	push   0x40
 1001685:	e8 b5 0e 00 00       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:229
        if (inUse)
 100168a:	83 c4 20             	add    esp,0x20
 100168d:	89 f0                	mov    eax,esi
 100168f:	84 c0                	test   al,al
 1001691:	74 08                	je     100169b <mmKernelSetPageInUseFlag+0x63>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:230
            *ptEntry|=PAGING_IN_USE_FLAG_MASK;
 1001693:	81 0b 00 08 00 00    	or     DWORD PTR [ebx],0x800
 1001699:	eb 06                	jmp    10016a1 <mmKernelSetPageInUseFlag+0x69>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:232
        else
            *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
 100169b:	81 23 ff f7 ff ff    	and    DWORD PTR [ebx],0xfffff7ff
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:233
}
 10016a1:	83 c4 04             	add    esp,0x4
 10016a4:	5b                   	pop    ebx
 10016a5:	5e                   	pop    esi
 10016a6:	c3                   	ret    

010016a7 <mmKernelSetPageRangeInUseFlag>:
mmKernelSetPageRangeInUseFlag():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:236

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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:237
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 10016bf:	39 fb                	cmp    ebx,edi
 10016c1:	73 16                	jae    10016d9 <mmKernelSetPageRangeInUseFlag+0x32>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:238 (discriminator 3)
        mmKernelSetPageInUseFlag(cnt,inUse);
 10016c3:	0f b6 f0             	movzx  esi,al
 10016c6:	83 ec 08             	sub    esp,0x8
 10016c9:	56                   	push   esi
 10016ca:	53                   	push   ebx
 10016cb:	e8 68 ff ff ff       	call   1001638 <mmKernelSetPageInUseFlag>
 10016d0:	01 eb                	add    ebx,ebp
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:237 (discriminator 3)
            *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
}

void mmKernelSetPageRangeInUseFlag(uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 10016d2:	83 c4 10             	add    esp,0x10
 10016d5:	39 fb                	cmp    ebx,edi
 10016d7:	72 ed                	jb     10016c6 <mmKernelSetPageRangeInUseFlag+0x1f>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:239
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/kpaging.c:242

void mmUnusePageRange()
{
 10016e1:	f3 c3                	repz ret 
 10016e3:	90                   	nop

010016e4 <reverse>:
reverse():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:29
//#include <string.h>

/* reverse:  reverse string s in place */
extern int strlen(char*);
 void reverse(char s[])
 {
 10016e4:	56                   	push   esi
 10016e5:	53                   	push   ebx
 10016e6:	83 ec 10             	sub    esp,0x10
 10016e9:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:33
     int i, j;
     char c;

     for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
 10016ed:	53                   	push   ebx
 10016ee:	e8 e1 0e 00 00       	call   10025d4 <strlen>
 10016f3:	83 e8 01             	sub    eax,0x1
 10016f6:	83 c4 10             	add    esp,0x10
 10016f9:	85 c0                	test   eax,eax
 10016fb:	7e 1f                	jle    100171c <reverse+0x38>
 10016fd:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:34 (discriminator 3)
         c = s[i];
 1001702:	0f b6 34 13          	movzx  esi,BYTE PTR [ebx+edx*1]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:35 (discriminator 3)
         s[i] = s[j];
 1001706:	0f b6 0c 03          	movzx  ecx,BYTE PTR [ebx+eax*1]
 100170a:	88 0c 13             	mov    BYTE PTR [ebx+edx*1],cl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:36 (discriminator 3)
         s[j] = c;
 100170d:	89 f1                	mov    ecx,esi
 100170f:	88 0c 03             	mov    BYTE PTR [ebx+eax*1],cl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:33 (discriminator 3)
 void reverse(char s[])
 {
     int i, j;
     char c;

     for (i = 0, j = strlen(s)-1; i<j; i++, j--) {
 1001712:	83 c2 01             	add    edx,0x1
 1001715:	83 e8 01             	sub    eax,0x1
 1001718:	39 c2                	cmp    edx,eax
 100171a:	7c e6                	jl     1001702 <reverse+0x1e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:38
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:40
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:47

     if ((sign = n) < 0)  /* record sign */
         n = -n;          /* make n positive */
     i = 0;
     do {       /* generate digits in reverse order */
         s[i++] = n % 10 + '0';   /* get next digit */
 1001741:	bd 67 66 66 66       	mov    ebp,0x66666667
 1001746:	eb 02                	jmp    100174a <itoa+0x28>
 1001748:	89 de                	mov    esi,ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:47 (discriminator 1)
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:48 (discriminator 1)
     } while ((n /= 10) > 0);     /* delete it */
 100176d:	89 d1                	mov    ecx,edx
 100176f:	85 d2                	test   edx,edx
 1001771:	7f d5                	jg     1001748 <itoa+0x26>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:49
     if (sign < 0)
 1001773:	83 7c 24 30 00       	cmp    DWORD PTR [esp+0x30],0x0
 1001778:	79 0b                	jns    1001785 <itoa+0x63>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:50
         s[i++] = '-';
 100177a:	8d 5e 02             	lea    ebx,[esi+0x2]
 100177d:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1001781:	c6 04 07 2d          	mov    BYTE PTR [edi+eax*1],0x2d
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:51
     s[i] = '\0';
 1001785:	c6 04 1f 00          	mov    BYTE PTR [edi+ebx*1],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:52
     reverse(s);
 1001789:	83 ec 0c             	sub    esp,0xc
 100178c:	57                   	push   edi
 100178d:	e8 52 ff ff ff       	call   10016e4 <reverse>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:53
 }
 1001792:	83 c4 2c             	add    esp,0x2c
 1001795:	5b                   	pop    ebx
 1001796:	5e                   	pop    esi
 1001797:	5f                   	pop    edi
 1001798:	5d                   	pop    ebp
 1001799:	c3                   	ret    

0100179a <itox>:
itox():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:55
void itox(unsigned int i, char *s)
{
 100179a:	53                   	push   ebx
 100179b:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 100179f:	8b 5c 24 0c          	mov    ebx,DWORD PTR [esp+0xc]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:58
    unsigned char n;

    s += 4;
 10017a3:	8d 43 04             	lea    eax,[ebx+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:59
    *s = '\0';
 10017a6:	c6 43 04 00          	mov    BYTE PTR [ebx+0x4],0x0
 10017aa:	83 eb 04             	sub    ebx,0x4
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:62 (discriminator 3)

    for (n = 8; n != 0; --n) {
        *--s = "0123456789ABCDEF"[i & 0x0F];
 10017ad:	83 e8 01             	sub    eax,0x1
 10017b0:	89 d1                	mov    ecx,edx
 10017b2:	83 e1 0f             	and    ecx,0xf
 10017b5:	0f b6 89 7f 62 00 01 	movzx  ecx,BYTE PTR [ecx+0x100627f]
 10017bc:	88 08                	mov    BYTE PTR [eax],cl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:63 (discriminator 3)
        i >>= 4;
 10017be:	c1 ea 04             	shr    edx,0x4
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:61 (discriminator 3)
    unsigned char n;

    s += 4;
    *s = '\0';

    for (n = 8; n != 0; --n) {
 10017c1:	39 c3                	cmp    ebx,eax
 10017c3:	75 e8                	jne    10017ad <itox+0x13>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:65
        *--s = "0123456789ABCDEF"[i & 0x0F];
        i >>= 4;
    }
}
 10017c5:	5b                   	pop    ebx
 10017c6:	c3                   	ret    

010017c7 <atoi>:
atoi():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:68
// A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
int atoi(char *str)
{
 10017c7:	8b 4c 24 04          	mov    ecx,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:73
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
 10017cb:	0f b6 11             	movzx  edx,BYTE PTR [ecx]
 10017ce:	84 d2                	test   dl,dl
 10017d0:	74 1f                	je     10017f1 <atoi+0x2a>
 10017d2:	83 c1 01             	add    ecx,0x1
 10017d5:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:74 (discriminator 3)
        res = res*10 + str[i] - '0';
 10017da:	8d 04 80             	lea    eax,[eax+eax*4]
 10017dd:	0f be d2             	movsx  edx,dl
 10017e0:	8d 44 42 d0          	lea    eax,[edx+eax*2-0x30]
 10017e4:	83 c1 01             	add    ecx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:73 (discriminator 3)
{
    int res = 0; // Initialize result
  
    // Iterate through all characters of input string and
    // update result
    for (int i = 0; str[i] != '\0'; ++i)
 10017e7:	0f b6 51 ff          	movzx  edx,BYTE PTR [ecx-0x1]
 10017eb:	84 d2                	test   dl,dl
 10017ed:	75 eb                	jne    10017da <atoi+0x13>
 10017ef:	f3 c3                	repz ret 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:69
    }
}
// A simple atoi() function - from http://www.geeksforgeeks.org/write-your-own-atoi
int atoi(char *str)
{
    int res = 0; // Initialize result
 10017f1:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:78
    for (int i = 0; str[i] != '\0'; ++i)
        res = res*10 + str[i] - '0';
  
    // return result.
    return res;
}
 10017f6:	c3                   	ret    

010017f7 <convert>:
convert():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:81

int convert(int s)
{
 10017f7:	83 ec 10             	sub    esp,0x10
 10017fa:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:83
  int c;
  char hex[] = {'A', 'B', 'C', 'D', 'E', 'F'};
 10017fe:	c6 44 24 0a 41       	mov    BYTE PTR [esp+0xa],0x41
 1001803:	c6 44 24 0b 42       	mov    BYTE PTR [esp+0xb],0x42
 1001808:	c6 44 24 0c 43       	mov    BYTE PTR [esp+0xc],0x43
 100180d:	c6 44 24 0d 44       	mov    BYTE PTR [esp+0xd],0x44
 1001812:	c6 44 24 0e 45       	mov    BYTE PTR [esp+0xe],0x45
 1001817:	c6 44 24 0f 46       	mov    BYTE PTR [esp+0xf],0x46
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:84
  c = (s >= 0 && s < 9) ? s + '0' : hex[s - 10];
 100181c:	83 f8 08             	cmp    eax,0x8
 100181f:	77 05                	ja     1001826 <convert+0x2f>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:84 (discriminator 1)
 1001821:	83 c0 30             	add    eax,0x30
 1001824:	eb 04                	jmp    100182a <convert+0x33>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:84 (discriminator 2)
 1001826:	0f be 04 04          	movsx  eax,BYTE PTR [esp+eax*1]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:86 (discriminator 4)
  return c;
}
 100182a:	83 c4 10             	add    esp,0x10
 100182d:	c3                   	ret    

0100182e <itoha>:
itoha():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:89

void itoha(unsigned int n, char *buf)
{
 100182e:	55                   	push   ebp
 100182f:	57                   	push   edi
 1001830:	56                   	push   esi
 1001831:	53                   	push   ebx
 1001832:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 1001836:	8b 7c 24 18          	mov    edi,DWORD PTR [esp+0x18]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:92
  int i = 0, j =0;
  j=7;
  while(n != 0)
 100183a:	85 db                	test   ebx,ebx
 100183c:	74 25                	je     1001863 <itoha+0x35>
 100183e:	be 07 00 00 00       	mov    esi,0x7
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:94
  {
    i = n % 16;
 1001843:	89 dd                	mov    ebp,ebx
 1001845:	83 e5 0f             	and    ebp,0xf
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:95
      buf[j--] = convert(i);
 1001848:	83 ee 01             	sub    esi,0x1
 100184b:	55                   	push   ebp
 100184c:	e8 a6 ff ff ff       	call   10017f7 <convert>
 1001851:	83 c4 04             	add    esp,0x4
 1001854:	88 44 37 01          	mov    BYTE PTR [edi+esi*1+0x1],al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:96
      n = (n - i) / 16;
 1001858:	29 eb                	sub    ebx,ebp
 100185a:	c1 eb 04             	shr    ebx,0x4
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:92

void itoha(unsigned int n, char *buf)
{
  int i = 0, j =0;
  j=7;
  while(n != 0)
 100185d:	85 db                	test   ebx,ebx
 100185f:	75 e2                	jne    1001843 <itoha+0x15>
 1001861:	eb 05                	jmp    1001868 <itoha+0x3a>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:91
}

void itoha(unsigned int n, char *buf)
{
  int i = 0, j =0;
  j=7;
 1001863:	be 07 00 00 00       	mov    esi,0x7
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:98
  {
    i = n % 16;
      buf[j--] = convert(i);
      n = (n - i) / 16;
  }
  buf[j] = '\0';
 1001868:	c6 04 37 00          	mov    BYTE PTR [edi+esi*1],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:99
}
 100186c:	5b                   	pop    ebx
 100186d:	5e                   	pop    esi
 100186e:	5f                   	pop    edi
 100186f:	5d                   	pop    ebp
 1001870:	c3                   	ret    

01001871 <identify_data_sizes>:
identify_data_sizes():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:102

void identify_data_sizes(sizeof_t* sizes)
{
 1001871:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:103
    sizes->shortSize = sizeof(short);
 1001875:	66 c7 00 02 00       	mov    WORD PTR [eax],0x2
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:104
    sizes->intSize = sizeof(int);
 100187a:	66 c7 40 02 04 00    	mov    WORD PTR [eax+0x2],0x4
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:105
    sizes->longSize = sizeof(long);
 1001880:	66 c7 40 04 04 00    	mov    WORD PTR [eax+0x4],0x4
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:106
    sizes->longLongSize = sizeof(long long);
 1001886:	66 c7 40 06 08 00    	mov    WORD PTR [eax+0x6],0x8
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:107
    sizes->longLongIntSize = sizeof(long long int);
 100188c:	66 c7 40 08 08 00    	mov    WORD PTR [eax+0x8],0x8
 1001892:	c3                   	ret    

01001893 <memset>:
memset():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:111
}

void *memset(void *d1, int val, size_t len)
{
 1001893:	56                   	push   esi
 1001894:	53                   	push   ebx
 1001895:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1001899:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 100189d:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:114
    uint8_t *d = d1;
    uint16_t*e = d1;
    uint16_t eVal=(val << 16) | (val << 8) | val;
 10018a1:	89 f1                	mov    ecx,esi
 10018a3:	c1 e1 08             	shl    ecx,0x8
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:118
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
 10018a6:	f6 c2 03             	test   dl,0x3
 10018a9:	75 16                	jne    10018c1 <memset+0x2e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:119
    while (len-=4) {
 10018ab:	83 ea 04             	sub    edx,0x4
 10018ae:	74 43                	je     10018f3 <memset+0x60>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:120
        *d++ = fVal;
 10018b0:	89 f3                	mov    ebx,esi
 10018b2:	89 c1                	mov    ecx,eax
 10018b4:	83 c1 01             	add    ecx,0x1
 10018b7:	88 59 ff             	mov    BYTE PTR [ecx-0x1],bl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:119
    uint16_t eVal=(val << 16) | (val << 8) | val;
    uint32_t*f = d1;
    uint32_t fVal=(val << 24) | (val << 16) | (val << 8) | val;
    
    if ((len%4)==0)
    while (len-=4) {
 10018ba:	83 ea 04             	sub    edx,0x4
 10018bd:	75 f5                	jne    10018b4 <memset+0x21>
 10018bf:	eb 32                	jmp    10018f3 <memset+0x60>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:122
        *d++ = fVal;
    }
    else if (((len%2)==0))
 10018c1:	f6 c2 01             	test   dl,0x1
 10018c4:	74 0b                	je     10018d1 <memset+0x3e>
 10018c6:	8d 1c 10             	lea    ebx,[eax+edx*1]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:127
    while (len-=2) {
        *d++ = eVal;
    }
    else
    while (len--) {
 10018c9:	89 c1                	mov    ecx,eax
 10018cb:	85 d2                	test   edx,edx
 10018cd:	75 18                	jne    10018e7 <memset+0x54>
 10018cf:	eb 22                	jmp    10018f3 <memset+0x60>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:123
    if ((len%4)==0)
    while (len-=4) {
        *d++ = fVal;
    }
    else if (((len%2)==0))
    while (len-=2) {
 10018d1:	83 ea 02             	sub    edx,0x2
 10018d4:	74 1d                	je     10018f3 <memset+0x60>
 10018d6:	89 c3                	mov    ebx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:124
        *d++ = eVal;
 10018d8:	09 f1                	or     ecx,esi
 10018da:	83 c3 01             	add    ebx,0x1
 10018dd:	88 4b ff             	mov    BYTE PTR [ebx-0x1],cl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:123
    if ((len%4)==0)
    while (len-=4) {
        *d++ = fVal;
    }
    else if (((len%2)==0))
    while (len-=2) {
 10018e0:	83 ea 02             	sub    edx,0x2
 10018e3:	75 f5                	jne    10018da <memset+0x47>
 10018e5:	eb 0c                	jmp    10018f3 <memset+0x60>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:128
        *d++ = eVal;
    }
    else
    while (len--) {
        *d++ = val;
 10018e7:	83 c1 01             	add    ecx,0x1
 10018ea:	89 f2                	mov    edx,esi
 10018ec:	88 51 ff             	mov    BYTE PTR [ecx-0x1],dl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:127
    else if (((len%2)==0))
    while (len-=2) {
        *d++ = eVal;
    }
    else
    while (len--) {
 10018ef:	39 cb                	cmp    ebx,ecx
 10018f1:	75 f4                	jne    10018e7 <memset+0x54>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:131
        *d++ = val;
    }
    return d1;
}
 10018f3:	5b                   	pop    ebx
 10018f4:	5e                   	pop    esi
 10018f5:	c3                   	ret    

010018f6 <bcdToDec>:
bcdToDec():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:134

uint8_t bcdToDec(uint8_t val)
{
 10018f6:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:135
  return ( (val/16*10) + (val%16) );
 10018fa:	89 c2                	mov    edx,eax
 10018fc:	c0 ea 04             	shr    dl,0x4
 10018ff:	8d 14 92             	lea    edx,[edx+edx*4]
 1001902:	83 e0 0f             	and    eax,0xf
 1001905:	8d 04 50             	lea    eax,[eax+edx*2]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:136
}
 1001908:	c3                   	ret    

01001909 <decToBcd>:
decToBcd():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:139

uint8_t decToBcd(uint8_t val)
{
 1001909:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:140
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:141
}
 100192b:	c3                   	ret    

0100192c <initSystemDate>:
initSystemDate():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:143
void initSystemDate()
{
 100192c:	83 ec 3c             	sub    esp,0x3c
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 100192f:	b8 00 00 00 00       	mov    eax,0x0
 1001934:	e6 70                	out    0x70,al
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1001936:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:147
    struct tm tmbuf;

    outb(0x70, 0x00);
    tmbuf.tm_sec = bcdToDec(inb(0x71));
 1001938:	0f b6 c0             	movzx  eax,al
 100193b:	50                   	push   eax
 100193c:	e8 b5 ff ff ff       	call   10018f6 <bcdToDec>
 1001941:	0f b6 c0             	movzx  eax,al
 1001944:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001948:	b8 02 00 00 00       	mov    eax,0x2
 100194d:	e6 70                	out    0x70,al
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100194f:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:149
    outb(0x70, 0x02);
    tmbuf.tm_min = bcdToDec(inb(0x71));
 1001951:	0f b6 c0             	movzx  eax,al
 1001954:	89 04 24             	mov    DWORD PTR [esp],eax
 1001957:	e8 9a ff ff ff       	call   10018f6 <bcdToDec>
 100195c:	0f b6 c0             	movzx  eax,al
 100195f:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001963:	b8 04 00 00 00       	mov    eax,0x4
 1001968:	e6 70                	out    0x70,al
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 100196a:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:151
    outb(0x70, 0x04);
    tmbuf.tm_hour = bcdToDec(inb(0x71));
 100196c:	0f b6 c0             	movzx  eax,al
 100196f:	89 04 24             	mov    DWORD PTR [esp],eax
 1001972:	e8 7f ff ff ff       	call   10018f6 <bcdToDec>
 1001977:	0f b6 c0             	movzx  eax,al
 100197a:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 100197e:	b8 07 00 00 00       	mov    eax,0x7
 1001983:	e6 70                	out    0x70,al
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1001985:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:153
    outb(0x70, 0x07);
    tmbuf.tm_mday = bcdToDec(inb(0x71));
 1001987:	0f b6 c0             	movzx  eax,al
 100198a:	89 04 24             	mov    DWORD PTR [esp],eax
 100198d:	e8 64 ff ff ff       	call   10018f6 <bcdToDec>
 1001992:	0f b6 c0             	movzx  eax,al
 1001995:	89 44 24 14          	mov    DWORD PTR [esp+0x14],eax
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001999:	b8 08 00 00 00       	mov    eax,0x8
 100199e:	e6 70                	out    0x70,al
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019a0:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:155
    outb(0x70, 0x08);
    tmbuf.tm_mon = bcdToDec(inb(0x71));
 10019a2:	0f b6 c0             	movzx  eax,al
 10019a5:	89 04 24             	mov    DWORD PTR [esp],eax
 10019a8:	e8 49 ff ff ff       	call   10018f6 <bcdToDec>
 10019ad:	0f b6 c0             	movzx  eax,al
 10019b0:	89 44 24 18          	mov    DWORD PTR [esp+0x18],eax
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10019b4:	b8 09 00 00 00       	mov    eax,0x9
 10019b9:	e6 70                	out    0x70,al
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 10019bb:	e4 71                	in     al,0x71
initSystemDate():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:157
    outb(0x70, 0x09);
    tmbuf.tm_year = bcdToDec(inb(0x71));
 10019bd:	0f b6 c0             	movzx  eax,al
 10019c0:	89 04 24             	mov    DWORD PTR [esp],eax
 10019c3:	e8 2e ff ff ff       	call   10018f6 <bcdToDec>
 10019c8:	83 ec 08             	sub    esp,0x8
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:158
    tmbuf.tm_isdst = -1;
 10019cb:	c7 44 24 30 ff ff ff 	mov    DWORD PTR [esp+0x30],0xffffffff
 10019d2:	ff 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:160
    tmbuf.tm_year += 2000;
    tmbuf.tm_year = tmbuf.tm_year - 1900;
 10019d3:	0f b6 c0             	movzx  eax,al
 10019d6:	83 c0 64             	add    eax,0x64
 10019d9:	89 44 24 24          	mov    DWORD PTR [esp+0x24],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:161
    kSystemStartTime = mktime(&tmbuf);
 10019dd:	8d 44 24 10          	lea    eax,[esp+0x10]
 10019e1:	50                   	push   eax
 10019e2:	e8 ab 0f 00 00       	call   1002992 <mktime>
 10019e7:	a3 88 02 00 02       	mov    ds:0x2000288,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:162
    kSystemCurrentTime = kSystemStartTime;
 10019ec:	a3 8c 02 00 02       	mov    ds:0x200028c,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:164
//printf("System Date = %d/%d/%d %d:%d:%d\n", tmbuf.tm_mon, tmbuf.tm_mday, tmbuf.tm_year, tmbuf.tm_hour, tmbuf.tm_min, tmbuf.tm_sec, tmbuf.tm_hour, tmbuf.tm_min, tmbuf.tm_sec);
}
 10019f1:	83 c4 4c             	add    esp,0x4c
 10019f4:	c3                   	ret    

010019f5 <strtoupper>:
strtoupper():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:166
char * strtoupper(char* pointerToString)
{
 10019f5:	56                   	push   esi
 10019f6:	53                   	push   ebx
 10019f7:	83 ec 10             	sub    esp,0x10
 10019fa:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:167
    uint8_t start=0, length=strlen(pointerToString);
 10019fe:	53                   	push   ebx
 10019ff:	e8 d0 0b 00 00       	call   10025d4 <strlen>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:171
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:173
        {
            if (myPtr[start]>='a' && myPtr[start]<='z')
 1001a17:	0f b6 02             	movzx  eax,BYTE PTR [edx]
 1001a1a:	8d 48 9f             	lea    ecx,[eax-0x61]
 1001a1d:	80 f9 19             	cmp    cl,0x19
 1001a20:	77 05                	ja     1001a27 <strtoupper+0x32>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:174
                myPtr[start]-=32;
 1001a22:	83 e8 20             	sub    eax,0x20
 1001a25:	88 02                	mov    BYTE PTR [edx],al
 1001a27:	83 c2 01             	add    edx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:171
{
    uint8_t start=0, length=strlen(pointerToString);
    char* myPtr=pointerToString;
    
        // Trim.Start:
        while (start<length)
 1001a2a:	39 f2                	cmp    edx,esi
 1001a2c:	75 e9                	jne    1001a17 <strtoupper+0x22>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:179
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:182

void printDumpedRegs()
{
 1001a36:	57                   	push   edi
 1001a37:	56                   	push   esi
 1001a38:	53                   	push   ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:183
    uint32_t esp = exceptionSavedESP;
 1001a39:	8b 35 ec 01 00 02    	mov    esi,DWORD PTR ds:0x20001ec
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:187
    uint8_t* lCSIPPtr;

    
    lCSIPPtr=(uint8_t*)(exceptionEIP);
 1001a3f:	8b 1d f8 01 00 02    	mov    ebx,DWORD PTR ds:0x20001f8
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:188
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", exceptionAX, exceptionBX, exceptionCX, exceptionDX,exceptionFlags);
 1001a45:	83 ec 08             	sub    esp,0x8
 1001a48:	ff 35 f0 01 00 02    	push   DWORD PTR ds:0x20001f0
 1001a4e:	ff 35 bc 01 00 02    	push   DWORD PTR ds:0x20001bc
 1001a54:	ff 35 b8 01 00 02    	push   DWORD PTR ds:0x20001b8
 1001a5a:	ff 35 b4 01 00 02    	push   DWORD PTR ds:0x20001b4
 1001a60:	ff 35 b0 01 00 02    	push   DWORD PTR ds:0x20001b0
 1001a66:	68 ec 6b 00 01       	push   0x1006bec
 1001a6b:	e8 b7 0a 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:189
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", exceptionBP, exceptionSI, exceptionDI, exceptionSavedESP);
 1001a70:	83 c4 14             	add    esp,0x14
 1001a73:	ff 35 ec 01 00 02    	push   DWORD PTR ds:0x20001ec
 1001a79:	ff 35 c4 01 00 02    	push   DWORD PTR ds:0x20001c4
 1001a7f:	ff 35 c0 01 00 02    	push   DWORD PTR ds:0x20001c0
 1001a85:	ff 35 c8 01 00 02    	push   DWORD PTR ds:0x20001c8
 1001a8b:	68 1c 6c 00 01       	push   0x1006c1c
 1001a90:	e8 92 0a 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:190
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
 1001a95:	83 c4 14             	add    esp,0x14
 1001a98:	ff 35 d4 01 00 02    	push   DWORD PTR ds:0x20001d4
 1001a9e:	ff 35 d0 01 00 02    	push   DWORD PTR ds:0x20001d0
 1001aa4:	ff 35 00 02 00 02    	push   DWORD PTR ds:0x2000200
 1001aaa:	ff 35 cc 01 00 02    	push   DWORD PTR ds:0x20001cc
 1001ab0:	68 44 6c 00 01       	push   0x1006c44
 1001ab5:	e8 6d 0a 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:191
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionGS, exceptionFS);
 1001aba:	83 c4 14             	add    esp,0x14
 1001abd:	ff 35 e0 01 00 02    	push   DWORD PTR ds:0x20001e0
 1001ac3:	ff 35 e4 01 00 02    	push   DWORD PTR ds:0x20001e4
 1001ac9:	ff 35 dc 01 00 02    	push   DWORD PTR ds:0x20001dc
 1001acf:	ff 35 d8 01 00 02    	push   DWORD PTR ds:0x20001d8
 1001ad5:	68 6c 6c 00 01       	push   0x1006c6c
 1001ada:	e8 48 0a 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:192
    printk("GDT=%08X\n",gdtp.base);
 1001adf:	83 c4 18             	add    esp,0x18
 1001ae2:	ff 35 4e 04 00 02    	push   DWORD PTR ds:0x200044e
 1001ae8:	68 90 62 00 01       	push   0x1006290
 1001aed:	e8 35 0a 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:193
    printk("CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
 1001af2:	ff 35 f4 01 00 02    	push   DWORD PTR ds:0x20001f4
 1001af8:	ff 35 f8 01 00 02    	push   DWORD PTR ds:0x20001f8
 1001afe:	ff 35 fc 01 00 02    	push   DWORD PTR ds:0x20001fc
 1001b04:	68 94 6c 00 01       	push   0x1006c94
 1001b09:	e8 19 0a 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:194
          printk("Bytes at CS:EIP: ");
 1001b0e:	83 c4 14             	add    esp,0x14
 1001b11:	68 9a 62 00 01       	push   0x100629a
 1001b16:	e8 0c 0a 00 00       	call   1002527 <printk>
 1001b1b:	8d 7b 13             	lea    edi,[ebx+0x13]
 1001b1e:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:196 (discriminator 3)
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
 1001b21:	83 ec 08             	sub    esp,0x8
 1001b24:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001b27:	50                   	push   eax
 1001b28:	68 2c 62 00 01       	push   0x100622c
 1001b2d:	e8 f5 09 00 00       	call   1002527 <printk>
 1001b32:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:195 (discriminator 3)
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\tCR4=%08X\n", exceptionCR0, exceptionCR2, exceptionCR3, exceptionCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", exceptionDS, exceptionES, exceptionGS, exceptionFS);
    printk("GDT=%08X\n",gdtp.base);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", exceptionCS, exceptionEIP, exceptionErrorCode);
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
 1001b35:	83 c4 10             	add    esp,0x10
 1001b38:	39 df                	cmp    edi,ebx
 1001b3a:	75 e5                	jne    1001b21 <printDumpedRegs+0xeb>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:197
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
 1001b3c:	83 ec 0c             	sub    esp,0xc
 1001b3f:	68 5b 65 00 01       	push   0x100655b
 1001b44:	e8 de 09 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:198
          printk ("Stack @ 0x%08x:0x%08X:\n",exceptionSS, esp);
 1001b49:	83 c4 0c             	add    esp,0xc
 1001b4c:	56                   	push   esi
 1001b4d:	ff 35 e8 01 00 02    	push   DWORD PTR ds:0x20001e8
 1001b53:	68 ac 62 00 01       	push   0x10062ac
 1001b58:	e8 ca 09 00 00       	call   1002527 <printk>
 1001b5d:	83 c4 10             	add    esp,0x10
 1001b60:	bb 00 00 00 00       	mov    ebx,0x0
 1001b65:	8d 04 33             	lea    eax,[ebx+esi*1]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:201 (discriminator 3)
          for (int cnt=0;cnt<10;cnt++)
          {
              printk("\t0x%08X%: 0x%08X\n",esp, exceptionSavedStack[cnt]);
 1001b68:	83 ec 04             	sub    esp,0x4
 1001b6b:	8b 15 a8 01 00 02    	mov    edx,DWORD PTR ds:0x20001a8
 1001b71:	ff 34 1a             	push   DWORD PTR [edx+ebx*1]
 1001b74:	50                   	push   eax
 1001b75:	68 c4 62 00 01       	push   0x10062c4
 1001b7a:	e8 a8 09 00 00       	call   1002527 <printk>
 1001b7f:	83 c3 04             	add    ebx,0x4
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:199 (discriminator 3)
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
          printk ("Stack @ 0x%08x:0x%08X:\n",exceptionSS, esp);
          for (int cnt=0;cnt<10;cnt++)
 1001b82:	83 c4 10             	add    esp,0x10
 1001b85:	83 fb 28             	cmp    ebx,0x28
 1001b88:	75 db                	jne    1001b65 <printDumpedRegs+0x12f>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:206
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:209

void printDebugRegs()
{
 1001b8e:	57                   	push   edi
 1001b8f:	56                   	push   esi
 1001b90:	53                   	push   ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:210
    uint32_t esp = debugSavedESP;
 1001b91:	8b 35 40 02 00 02    	mov    esi,DWORD PTR ds:0x2000240
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:213
    uint8_t* lCSIPPtr;

    lCSIPPtr=(uint8_t*)(debugEIP);
 1001b97:	8b 1d 50 02 00 02    	mov    ebx,DWORD PTR ds:0x2000250
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:214
    printk("EAX=%08X\tEBX=%08X\tECX=%08X\tEDX=%08X\tEFL=%08X\n", debugAX, debugBX, debugCX, debugDX,debugFlags);
 1001b9d:	83 ec 08             	sub    esp,0x8
 1001ba0:	ff 35 44 02 00 02    	push   DWORD PTR ds:0x2000244
 1001ba6:	ff 35 10 02 00 02    	push   DWORD PTR ds:0x2000210
 1001bac:	ff 35 0c 02 00 02    	push   DWORD PTR ds:0x200020c
 1001bb2:	ff 35 08 02 00 02    	push   DWORD PTR ds:0x2000208
 1001bb8:	ff 35 04 02 00 02    	push   DWORD PTR ds:0x2000204
 1001bbe:	68 ec 6b 00 01       	push   0x1006bec
 1001bc3:	e8 5f 09 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:215
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", debugBP, debugSI, debugDI, debugSavedESP);
 1001bc8:	83 c4 14             	add    esp,0x14
 1001bcb:	ff 35 40 02 00 02    	push   DWORD PTR ds:0x2000240
 1001bd1:	ff 35 18 02 00 02    	push   DWORD PTR ds:0x2000218
 1001bd7:	ff 35 14 02 00 02    	push   DWORD PTR ds:0x2000214
 1001bdd:	ff 35 1c 02 00 02    	push   DWORD PTR ds:0x200021c
 1001be3:	68 1c 6c 00 01       	push   0x1006c1c
 1001be8:	e8 3a 09 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:216
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\n", debugCR0, debugCR3, debugCR4);
 1001bed:	83 c4 20             	add    esp,0x20
 1001bf0:	ff 35 28 02 00 02    	push   DWORD PTR ds:0x2000228
 1001bf6:	ff 35 24 02 00 02    	push   DWORD PTR ds:0x2000224
 1001bfc:	ff 35 20 02 00 02    	push   DWORD PTR ds:0x2000220
 1001c02:	68 d6 62 00 01       	push   0x10062d6
 1001c07:	e8 1b 09 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:217
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", debugDS, debugES, debugGS, debugFS);
 1001c0c:	83 c4 04             	add    esp,0x4
 1001c0f:	ff 35 34 02 00 02    	push   DWORD PTR ds:0x2000234
 1001c15:	ff 35 38 02 00 02    	push   DWORD PTR ds:0x2000238
 1001c1b:	ff 35 30 02 00 02    	push   DWORD PTR ds:0x2000230
 1001c21:	ff 35 2c 02 00 02    	push   DWORD PTR ds:0x200022c
 1001c27:	68 6c 6c 00 01       	push   0x1006c6c
 1001c2c:	e8 f6 08 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:218
    printk("CS:EIP = %04X:%08X, error code=%08X\n", debugCS, debugEIP, debugErrorCode);
 1001c31:	83 c4 20             	add    esp,0x20
 1001c34:	ff 35 48 02 00 02    	push   DWORD PTR ds:0x2000248
 1001c3a:	ff 35 50 02 00 02    	push   DWORD PTR ds:0x2000250
 1001c40:	ff 35 4c 02 00 02    	push   DWORD PTR ds:0x200024c
 1001c46:	68 94 6c 00 01       	push   0x1006c94
 1001c4b:	e8 d7 08 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:219
          printk("Bytes at CS:EIP: ");
 1001c50:	c7 04 24 9a 62 00 01 	mov    DWORD PTR [esp],0x100629a
 1001c57:	e8 cb 08 00 00       	call   1002527 <printk>
 1001c5c:	8d 7b 13             	lea    edi,[ebx+0x13]
 1001c5f:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:221 (discriminator 3)
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
 1001c62:	83 ec 08             	sub    esp,0x8
 1001c65:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1001c68:	50                   	push   eax
 1001c69:	68 2c 62 00 01       	push   0x100622c
 1001c6e:	e8 b4 08 00 00       	call   1002527 <printk>
 1001c73:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:220 (discriminator 3)
    printk("EBP=%08X\tESI=%08X\tEDI=%08X\tESP=%08X\n", debugBP, debugSI, debugDI, debugSavedESP);
    printk("CR0=%08X\tCR2=%08X\tCR3=%08X\n", debugCR0, debugCR3, debugCR4);
    printk(" DS=%08X\t ES=%08X\t FS=%08X\t GS=%08X\n", debugDS, debugES, debugGS, debugFS);
    printk("CS:EIP = %04X:%08X, error code=%08X\n", debugCS, debugEIP, debugErrorCode);
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
 1001c76:	83 c4 10             	add    esp,0x10
 1001c79:	39 df                	cmp    edi,ebx
 1001c7b:	75 e5                	jne    1001c62 <printDebugRegs+0xd4>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:222
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
 1001c7d:	83 ec 0c             	sub    esp,0xc
 1001c80:	68 5b 65 00 01       	push   0x100655b
 1001c85:	e8 9d 08 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:223
          printk ("Stack @ 0x%08x:0x%08X:\n",debugSS, esp);
 1001c8a:	83 c4 0c             	add    esp,0xc
 1001c8d:	56                   	push   esi
 1001c8e:	ff 35 3c 02 00 02    	push   DWORD PTR ds:0x200023c
 1001c94:	68 ac 62 00 01       	push   0x10062ac
 1001c99:	e8 89 08 00 00       	call   1002527 <printk>
 1001c9e:	83 c4 10             	add    esp,0x10
 1001ca1:	bb 00 00 00 00       	mov    ebx,0x0
 1001ca6:	8d 04 33             	lea    eax,[ebx+esi*1]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:226 (discriminator 3)
          for (int cnt=0;cnt<10;cnt++)
          {
              printk("\t0x%08X%: 0x%08X\n",esp, debugSavedStack[cnt]);
 1001ca9:	83 ec 04             	sub    esp,0x4
 1001cac:	8b 15 ac 01 00 02    	mov    edx,DWORD PTR ds:0x20001ac
 1001cb2:	ff 34 1a             	push   DWORD PTR [edx+ebx*1]
 1001cb5:	50                   	push   eax
 1001cb6:	68 c4 62 00 01       	push   0x10062c4
 1001cbb:	e8 67 08 00 00       	call   1002527 <printk>
 1001cc0:	83 c3 04             	add    ebx,0x4
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:224 (discriminator 3)
          printk("Bytes at CS:EIP: ");
          for (int cnt=0;cnt<19;cnt++)
              printk("%02X ", lCSIPPtr[cnt]);
          printk("\n");
          printk ("Stack @ 0x%08x:0x%08X:\n",debugSS, esp);
          for (int cnt=0;cnt<10;cnt++)
 1001cc3:	83 c4 10             	add    esp,0x10
 1001cc6:	83 fb 28             	cmp    ebx,0x28
 1001cc9:	75 db                	jne    1001ca6 <printDebugRegs+0x118>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:231
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
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:239
/* keyboard interface IO port: data and control
   READ:   status port
   WRITE:  control register */
 
void reboot(bool waitFirst)
{
 1001ccf:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:242
    uint8_t temp;
 
    if (waitFirst)
 1001cd2:	80 7c 24 10 00       	cmp    BYTE PTR [esp+0x10],0x0
 1001cd7:	74 1d                	je     1001cf6 <reboot+0x27>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:244
    {
        puts("Rebooting ... ");
 1001cd9:	83 ec 0c             	sub    esp,0xc
 1001cdc:	68 f2 62 00 01       	push   0x10062f2
 1001ce1:	e8 03 e7 ff ff       	call   10003e9 <puts>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:245
        __asm__("sti\n");
 1001ce6:	fb                   	sti    
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:246
        wait(3000);
 1001ce7:	c7 04 24 b8 0b 00 00 	mov    DWORD PTR [esp],0xbb8
 1001cee:	e8 dd 11 00 00       	call   1002ed0 <wait>
 1001cf3:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:248
    }
    __asm__ volatile ("cli"); /* disable all interrupts */
 1001cf6:	fa                   	cli    
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 1001cf7:	e4 64                	in     al,0x64
 1001cf9:	89 c2                	mov    edx,eax
reboot():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:254
 
    /* Clear all keyboard buffers (output and command buffers) */
    do
    {
        temp = inb(KBRD_INTRFC); /* empty user data */
        if (check_flag(temp, KBRD_BIT_KDATA) != 0)
 1001cfb:	a8 01                	test   al,0x1
 1001cfd:	74 02                	je     1001d01 <reboot+0x32>
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 1001cff:	e4 60                	in     al,0x60
reboot():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:256
            inb(KBRD_IO); /* empty keyboard data */
    } while (check_flag(temp, KBRD_BIT_UDATA) != 0);
 1001d01:	f6 c2 02             	test   dl,0x2
 1001d04:	75 f1                	jne    1001cf7 <reboot+0x28>
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 1001d06:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 1001d0b:	e6 64                	out    0x64,al
reboot():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:260 (discriminator 1)
 
    outb(KBRD_INTRFC, KBRD_RESET); /* pulse CPU reset line */
loop:
    __asm__ volatile ("hlt"); /* if that didn't work, halt the CPU */
 1001d0d:	f4                   	hlt    
 1001d0e:	eb fd                	jmp    1001d0d <reboot+0x3e>

01001d10 <dumpKernelAddresses>:
dumpKernelAddresses():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:265
    goto loop; /* if a NMI is received, halt again */
}

void dumpKernelAddresses()
{
 1001d10:	83 ec 14             	sub    esp,0x14
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:266
printk("Kernel Variable List:\n\tKERNEL_OBJECT_BASE_ADDRESS0x%08X\n",KERNEL_OBJECT_BASE_ADDRESS);
 1001d13:	68 00 00 28 00       	push   0x280000
 1001d18:	68 bc 6c 00 01       	push   0x1006cbc
 1001d1d:	e8 05 08 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:267
printk("\tKERNEL_OBJECT_BASE_ADDRESS=0x%08x\n",KERNEL_OBJECT_BASE_ADDRESS);
 1001d22:	83 c4 08             	add    esp,0x8
 1001d25:	68 00 00 28 00       	push   0x280000
 1001d2a:	68 f8 6c 00 01       	push   0x1006cf8
 1001d2f:	e8 f3 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:268
printk("\tE820_TABLE_ADDRESS=0x%08x\n",E820_TABLE_ADDRESS);
 1001d34:	83 c4 08             	add    esp,0x8
 1001d37:	68 00 00 28 00       	push   0x280000
 1001d3c:	68 01 63 00 01       	push   0x1006301
 1001d41:	e8 e1 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:269
printk("\tMP_CONFIG_TABLE_ADDRESS=0x%08x\n",MP_CONFIG_TABLE_ADDRESS);
 1001d46:	83 c4 08             	add    esp,0x8
 1001d49:	68 c0 12 28 00       	push   0x2812c0
 1001d4e:	68 1c 6d 00 01       	push   0x1006d1c
 1001d53:	e8 cf 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:270
printk("\tKEYBOARD_BUFFER_ADDRESS=0x%08x\n",KEYBOARD_BUFFER_ADDRESS);
 1001d58:	83 c4 08             	add    esp,0x8
 1001d5b:	68 c0 32 28 00       	push   0x2832c0
 1001d60:	68 40 6d 00 01       	push   0x1006d40
 1001d65:	e8 bd 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:271
printk("\tIDT_TABLE_ADDRESS=0x%08x\n",IDT_TABLE_ADDRESS);
 1001d6a:	83 c4 08             	add    esp,0x8
 1001d6d:	68 00 40 28 00       	push   0x284000
 1001d72:	68 1d 63 00 01       	push   0x100631d
 1001d77:	e8 ab 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:272
printk("\tINIT_GDT_TABLE_ADDRESS=0x%08x\n",INIT_GDT_TABLE_ADDRESS);
 1001d7c:	83 c4 08             	add    esp,0x8
 1001d7f:	68 00 50 28 00       	push   0x285000
 1001d84:	68 64 6d 00 01       	push   0x1006d64
 1001d89:	e8 99 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:273
printk("\tTASK_TABLE_ADDRESS=0x%08x\n",TASK_TABLE_ADDRESS);
 1001d8e:	83 c4 08             	add    esp,0x8
 1001d91:	68 00 60 28 00       	push   0x286000
 1001d96:	68 38 63 00 01       	push   0x1006338
 1001d9b:	e8 87 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:274
printk("\tTSS_TABLE_ADDRESS=0x%08x\n",TSS_TABLE_ADDRESS);
 1001da0:	83 c4 08             	add    esp,0x8
 1001da3:	68 00 00 2a 00       	push   0x2a0000
 1001da8:	68 54 63 00 01       	push   0x1006354
 1001dad:	e8 75 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:275
printk("\tATA_MBR_ARRAY_ADDRESS=0x%08x\n",ATA_MBR_ARRAY_ADDRESS);
 1001db2:	83 c4 08             	add    esp,0x8
 1001db5:	68 00 a0 2b 00       	push   0x2ba000
 1001dba:	68 84 6d 00 01       	push   0x1006d84
 1001dbf:	e8 63 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:276
printk("\tPCI_DEVICE_LIST_ADDRESS=0x%08x\n",PCI_DEVICE_LIST_ADDRESS);
 1001dc4:	83 c4 08             	add    esp,0x8
 1001dc7:	68 00 b0 2b 00       	push   0x2bb000
 1001dcc:	68 a4 6d 00 01       	push   0x1006da4
 1001dd1:	e8 51 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:277
printk("\tPCI_BRIDGE_LIST_ADDRESS=0x%08x\n",PCI_BRIDGE_LIST_ADDRESS);
 1001dd6:	83 c4 08             	add    esp,0x8
 1001dd9:	68 00 b0 2c 00       	push   0x2cb000
 1001dde:	68 c8 6d 00 01       	push   0x1006dc8
 1001de3:	e8 3f 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:278
printk("\tPCI_FUNCTION_LIST_ADDRESS=0x%08x\n",PCI_FUNCTION_LIST_ADDRESS);
 1001de8:	83 c4 08             	add    esp,0x8
 1001deb:	68 00 b0 2d 00       	push   0x2db000
 1001df0:	68 ec 6d 00 01       	push   0x1006dec
 1001df5:	e8 2d 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:279
printk("\tGDT_PMODE_16BIT_TABLE_ADDRESS=0x%08x\n",GDT_PMODE_16BIT_TABLE_ADDRESS);
 1001dfa:	83 c4 08             	add    esp,0x8
 1001dfd:	68 00 c0 2d 00       	push   0x2dc000
 1001e02:	68 10 6e 00 01       	push   0x1006e10
 1001e07:	e8 1b 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:280
printk("\tKERNEL_PAGE_DIR_ADDRESS=0x%08x\n",KERNEL_PAGE_DIR_ADDRESS);
 1001e0c:	83 c4 08             	add    esp,0x8
 1001e0f:	68 00 d0 2d 00       	push   0x2dd000
 1001e14:	68 38 6e 00 01       	push   0x1006e38
 1001e19:	e8 09 07 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:281
printk("\tKERNEL_PAGE_TABLE_BASE_ADDRESS=0x%08x\n",KERNEL_PAGE_TABLE_BASE_ADDRESS);
 1001e1e:	83 c4 08             	add    esp,0x8
 1001e21:	68 00 f0 2e 00       	push   0x2ef000
 1001e26:	68 5c 6e 00 01       	push   0x1006e5c
 1001e2b:	e8 f7 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:282
printk("\tSAVED_STACK_FOR_EXCEPTIONS_ADDRESS=0x%08x\n",SAVED_STACK_FOR_EXCEPTIONS_ADDRESS);
 1001e30:	83 c4 08             	add    esp,0x8
 1001e33:	68 00 00 6f 00       	push   0x6f0000
 1001e38:	68 84 6e 00 01       	push   0x1006e84
 1001e3d:	e8 e5 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:283
printk("\tSAVED_STACK_FOR_DEBUGGING_ADDRESS=0x%08x\n",SAVED_STACK_FOR_DEBUGGING_ADDRESS);
 1001e42:	83 c4 08             	add    esp,0x8
 1001e45:	68 00 20 6f 00       	push   0x6f2000
 1001e4a:	68 b0 6e 00 01       	push   0x1006eb0
 1001e4f:	e8 d3 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:284
printk("\tCPU_APIC_REGISTER_REMAP_BASE_ADDRESS=0x%08x\n",CPU_APIC_REGISTER_REMAP_BASE_ADDRESS);
 1001e54:	83 c4 08             	add    esp,0x8
 1001e57:	68 00 40 6f 00       	push   0x6f4000
 1001e5c:	68 dc 6e 00 01       	push   0x1006edc
 1001e61:	e8 c1 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:285
printk("\tCPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS=0x%08x\n",CPU_IOAPIC_REGISTER_REMAP_BASE_ADDRESS);
 1001e66:	83 c4 08             	add    esp,0x8
 1001e69:	68 00 50 6f 00       	push   0x6f5000
 1001e6e:	68 0c 6f 00 01       	push   0x1006f0c
 1001e73:	e8 af 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:286
printk("\tKERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS=0x%08x\n",KERNEL_TICKS_SINCE_START_VARIABLE_ADDRESS);
 1001e78:	83 c4 08             	add    esp,0x8
 1001e7b:	68 04 50 6f 00       	push   0x6f5004
 1001e80:	68 3c 6f 00 01       	push   0x1006f3c
 1001e85:	e8 9d 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:287
printk("\tAHCI_ABAR_REMAPPED_ADDRESS=0x%08x\n",AHCI_ABAR_REMAPPED_ADDRESS);
 1001e8a:	83 c4 08             	add    esp,0x8
 1001e8d:	68 00 60 6f 00       	push   0x6f6000
 1001e92:	68 70 6f 00 01       	push   0x1006f70
 1001e97:	e8 8b 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:288
printk("\tAHCI_PORT_BASE_REMAP_ADDRESS=0x%08x\n",AHCI_PORT_BASE_REMAP_ADDRESS);
 1001e9c:	83 c4 08             	add    esp,0x8
 1001e9f:	68 00 60 73 00       	push   0x736000
 1001ea4:	68 94 6f 00 01       	push   0x1006f94
 1001ea9:	e8 79 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:289
printk("\tAHCI_DISK_BUFFER_ADDRESS=0x%08x\n",AHCI_DISK_BUFFER_ADDRESS);
 1001eae:	83 c4 08             	add    esp,0x8
 1001eb1:	68 00 60 87 00       	push   0x876000
 1001eb6:	68 bc 6f 00 01       	push   0x1006fbc
 1001ebb:	e8 67 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:290
printk("\tATA_DEVICE_INFO_ADDRESS=0x%08x\n",ATA_DEVICE_INFO_ADDRESS);
 1001ec0:	83 c4 08             	add    esp,0x8
 1001ec3:	68 00 60 9b 00       	push   0x9b6000
 1001ec8:	68 e0 6f 00 01       	push   0x1006fe0
 1001ecd:	e8 55 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:291
printk("\tAHCI_CAPS_ADDRESS=0x%08x\n",AHCI_CAPS_ADDRESS);
 1001ed2:	83 c4 08             	add    esp,0x8
 1001ed5:	68 20 ae 9b 00       	push   0x9bae20
 1001eda:	68 6f 63 00 01       	push   0x100636f
 1001edf:	e8 43 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:292
printk("\tTSS_AVAILABLE_ADDRESS=0x%08x\n",TSS_AVAILABLE_ADDRESS);
 1001ee4:	83 c4 08             	add    esp,0x8
 1001ee7:	68 40 fc 9b 00       	push   0x9bfc40
 1001eec:	68 04 70 00 01       	push   0x1007004
 1001ef1:	e8 31 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:293
printk("\tGDT_AVAILABLE_ADDRESS=0x%08x\n",GDT_AVAILABLE_ADDRESS);
 1001ef6:	83 c4 08             	add    esp,0x8
 1001ef9:	68 40 fd 9b 00       	push   0x9bfd40
 1001efe:	68 24 70 00 01       	push   0x1007024
 1001f03:	e8 1f 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:294
printk("\tEXEC_FILE_LOAD_INFO=0x%08x\n",EXEC_FILE_LOAD_INFO);
 1001f08:	83 c4 08             	add    esp,0x8
 1001f0b:	68 40 ff 9b 00       	push   0x9bff40
 1001f10:	68 8a 63 00 01       	push   0x100638a
 1001f15:	e8 0d 06 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:295
printk("\tAHCI_ABAR_ADDRESS=0x%08x\n",AHCI_ABAR_ADDRESS);
 1001f1a:	83 c4 08             	add    esp,0x8
 1001f1d:	68 e0 85 9d 00       	push   0x9d85e0
 1001f22:	68 a7 63 00 01       	push   0x10063a7
 1001f27:	e8 fb 05 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:296
printk("\tEND_OF_KERNEL_OBJECTS_ADDRESS=0x%08x\n",END_OF_KERNEL_OBJECTS_ADDRESS);
 1001f2c:	83 c4 08             	add    esp,0x8
 1001f2f:	68 e0 85 ad 00       	push   0xad85e0
 1001f34:	68 44 70 00 01       	push   0x1007044
 1001f39:	e8 e9 05 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:297
}
 1001f3e:	83 c4 1c             	add    esp,0x1c
 1001f41:	c3                   	ret    

01001f42 <pauseDisplay>:
pauseDisplay():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:300

bool pauseDisplay(bool offerToQuit)
{
 1001f42:	56                   	push   esi
 1001f43:	53                   	push   ebx
 1001f44:	83 ec 04             	sub    esp,0x4
 1001f47:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:301
    if (offerToQuit)
 1001f4b:	84 db                	test   bl,bl
 1001f4d:	74 12                	je     1001f61 <pauseDisplay+0x1f>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:302
        printk("Press q to quit, any other key to continue ...");
 1001f4f:	83 ec 0c             	sub    esp,0xc
 1001f52:	68 6c 70 00 01       	push   0x100706c
 1001f57:	e8 cb 05 00 00       	call   1002527 <printk>
 1001f5c:	83 c4 10             	add    esp,0x10
 1001f5f:	eb 10                	jmp    1001f71 <pauseDisplay+0x2f>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:304
    else
        printk("Press a key to continue ... ");
 1001f61:	83 ec 0c             	sub    esp,0xc
 1001f64:	68 c2 63 00 01       	push   0x10063c2
 1001f69:	e8 b9 05 00 00       	call   1002527 <printk>
 1001f6e:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:305
    char lPressedKey=waitForKeyboardKey();
 1001f71:	e8 f2 e4 ff ff       	call   1000468 <waitForKeyboardKey>
 1001f76:	89 c6                	mov    esi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:306
    cursorMoveToX(0);
 1001f78:	83 ec 0c             	sub    esp,0xc
 1001f7b:	6a 00                	push   0x0
 1001f7d:	e8 b8 e3 ff ff       	call   100033a <cursorMoveToX>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:307
    printk("                                           ");
 1001f82:	c7 04 24 9c 70 00 01 	mov    DWORD PTR [esp],0x100709c
 1001f89:	e8 99 05 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:308
    cursorMoveToX(0);
 1001f8e:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
 1001f95:	e8 a0 e3 ff ff       	call   100033a <cursorMoveToX>
 1001f9a:	89 f0                	mov    eax,esi
 1001f9c:	3c 71                	cmp    al,0x71
 1001f9e:	0f 94 c0             	sete   al
 1001fa1:	21 d8                	and    eax,ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:312
    if (lPressedKey=='q' && offerToQuit)
        return true;
    return false;
}
 1001fa3:	83 c4 14             	add    esp,0x14
 1001fa6:	5b                   	pop    ebx
 1001fa7:	5e                   	pop    esi
 1001fa8:	c3                   	ret    

01001fa9 <mallocTemp>:
mallocTemp():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:317

int memPtr=0xe00000;
uintptr_t* mallocTemp(int size)
{
    uintptr_t lRetVal = memPtr;
 1001fa9:	a1 00 3c 00 01       	mov    eax,ds:0x1003c00
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:318
    memPtr+=size;
 1001fae:	89 c2                	mov    edx,eax
 1001fb0:	03 54 24 04          	add    edx,DWORD PTR [esp+0x4]
 1001fb4:	89 15 00 3c 00 01    	mov    DWORD PTR ds:0x1003c00,edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/init/utility.c:320
    return (uintptr_t*)lRetVal;
 1001fba:	c3                   	ret    
 1001fbb:	90                   	nop

01001fbc <memcpy>:
memcpy():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:12
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
void * memcpy(void *dest, const void *src, size_t n)
{
 1001fbc:	57                   	push   edi
 1001fbd:	56                   	push   esi
 1001fbe:	53                   	push   ebx
 1001fbf:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 1001fc3:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 1001fc7:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:17
    bool dw,dd;
    
    dd=n%4==0;
    dw=n%2==0;
    if (dd)
 1001fcb:	89 d1                	mov    ecx,edx
 1001fcd:	83 e1 03             	and    ecx,0x3
 1001fd0:	75 4d                	jne    100201f <memcpy+0x63>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:19
    {
        n /=4;
 1001fd2:	c1 ea 02             	shr    edx,0x2
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:23
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
 1001fd5:	39 c3                	cmp    ebx,eax
 1001fd7:	72 0e                	jb     1001fe7 <memcpy+0x2b>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 1001fd9:	b9 00 00 00 00       	mov    ecx,0x0
 1001fde:	85 d2                	test   edx,edx
 1001fe0:	75 2e                	jne    1002010 <memcpy+0x54>
 1001fe2:	e9 b6 00 00 00       	jmp    100209d <memcpy+0xe1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:24
        n /=4;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
 1001fe7:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
 1001fee:	01 fb                	add    ebx,edi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:25
                t += n;
 1001ff0:	01 c7                	add    edi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:26
                while ( (n)-- > 0)
 1001ff2:	85 d2                	test   edx,edx
 1001ff4:	0f 84 a3 00 00 00    	je     100209d <memcpy+0xe1>
 1001ffa:	f7 da                	neg    edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:27
                        *--t = *--f;
 1001ffc:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
 1002000:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
 1002004:	83 e9 01             	sub    ecx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:26
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
 1002007:	39 d1                	cmp    ecx,edx
 1002009:	75 f1                	jne    1001ffc <memcpy+0x40>
 100200b:	e9 8d 00 00 00       	jmp    100209d <memcpy+0xe1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:30
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
 1002010:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
 1002013:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
 1002016:	83 c1 01             	add    ecx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 1002019:	39 ca                	cmp    edx,ecx
 100201b:	75 f3                	jne    1002010 <memcpy+0x54>
 100201d:	eb 7e                	jmp    100209d <memcpy+0xe1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:33
                        *t++ = *f++;
        return dest;
    }
    else if (dw)
 100201f:	89 d1                	mov    ecx,edx
 1002021:	83 e1 01             	and    ecx,0x1
 1002024:	75 42                	jne    1002068 <memcpy+0xac>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:35
    {
        n /=2;
 1002026:	d1 ea                	shr    edx,1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:39
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
 1002028:	39 c3                	cmp    ebx,eax
 100202a:	72 0b                	jb     1002037 <memcpy+0x7b>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 100202c:	b9 00 00 00 00       	mov    ecx,0x0
 1002031:	85 d2                	test   edx,edx
 1002033:	75 24                	jne    1002059 <memcpy+0x9d>
 1002035:	eb 66                	jmp    100209d <memcpy+0xe1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:40
        n /=2;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
 1002037:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
 100203e:	01 fb                	add    ebx,edi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:41
                t += n;
 1002040:	01 c7                	add    edi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:42
                while ( (n)-- > 0)
 1002042:	85 d2                	test   edx,edx
 1002044:	74 57                	je     100209d <memcpy+0xe1>
 1002046:	f7 da                	neg    edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:43
                        *--t = *--f;
 1002048:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
 100204c:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
 1002050:	83 e9 01             	sub    ecx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:42
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
 1002053:	39 ca                	cmp    edx,ecx
 1002055:	75 f1                	jne    1002048 <memcpy+0x8c>
 1002057:	eb 44                	jmp    100209d <memcpy+0xe1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:46
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
 1002059:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
 100205c:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
 100205f:	83 c1 01             	add    ecx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
 1002062:	39 ca                	cmp    edx,ecx
 1002064:	75 f3                	jne    1002059 <memcpy+0x9d>
 1002066:	eb 35                	jmp    100209d <memcpy+0xe1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:54
    else
    {
        const char *f = src;
        char *t = dest;

        if (f < t) {
 1002068:	39 c3                	cmp    ebx,eax
 100206a:	72 0b                	jb     1002077 <memcpy+0xbb>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
 100206c:	be 00 00 00 00       	mov    esi,0x0
 1002071:	85 d2                	test   edx,edx
 1002073:	75 1a                	jne    100208f <memcpy+0xd3>
 1002075:	eb 26                	jmp    100209d <memcpy+0xe1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
 1002077:	8d 4a ff             	lea    ecx,[edx-0x1]
 100207a:	85 d2                	test   edx,edx
 100207c:	74 1f                	je     100209d <memcpy+0xe1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:58
                        *--t = *--f;
 100207e:	0f b6 14 0b          	movzx  edx,BYTE PTR [ebx+ecx*1]
 1002082:	88 14 08             	mov    BYTE PTR [eax+ecx*1],dl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
 1002085:	83 e9 01             	sub    ecx,0x1
 1002088:	83 f9 ff             	cmp    ecx,0xffffffff
 100208b:	75 f1                	jne    100207e <memcpy+0xc2>
 100208d:	eb 0e                	jmp    100209d <memcpy+0xe1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:61
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
 100208f:	0f b6 0c 33          	movzx  ecx,BYTE PTR [ebx+esi*1]
 1002093:	88 0c 30             	mov    BYTE PTR [eax+esi*1],cl
 1002096:	83 c6 01             	add    esi,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
 1002099:	39 f2                	cmp    edx,esi
 100209b:	75 f2                	jne    100208f <memcpy+0xd3>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/memcpy.c:64
                        *t++ = *f++;
        return dest;
    }
 100209d:	5b                   	pop    ebx
 100209e:	5e                   	pop    esi
 100209f:	5f                   	pop    edi
 10020a0:	c3                   	ret    
 10020a1:	66 90                	xchg   ax,ax
 10020a3:	90                   	nop

010020a4 <panic>:
panic():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/panic.c:8
#include <stdarg.h>
#include <time.h>
#include "printf.h"

void __attribute__((noinline))panic(const char *format, ...)
{
 10020a4:	53                   	push   ebx
 10020a5:	83 ec 08             	sub    esp,0x8
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/panic.c:10
    va_list args;
    va_start( args, format );
 10020a8:	8d 5c 24 14          	lea    ebx,[esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/panic.c:11
    printk("\n>>>panic at instruction prior to address 0x%08X<<<\n", __builtin_return_address(0));
 10020ac:	83 ec 08             	sub    esp,0x8
 10020af:	ff 74 24 14          	push   DWORD PTR [esp+0x14]
 10020b3:	68 c8 70 00 01       	push   0x10070c8
 10020b8:	e8 6a 04 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/panic.c:12
    printk("  >>>");
 10020bd:	c7 04 24 df 63 00 01 	mov    DWORD PTR [esp],0x10063df
 10020c4:	e8 5e 04 00 00       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/panic.c:13
    printk_valist( format,args);
 10020c9:	83 c4 08             	add    esp,0x8
 10020cc:	53                   	push   ebx
 10020cd:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 10020d1:	e8 38 04 00 00       	call   100250e <printk_valist>
 10020d6:	83 c4 10             	add    esp,0x10
 10020d9:	eb fe                	jmp    10020d9 <panic+0x35>
 10020db:	90                   	nop

010020dc <printchar>:
printchar():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:43
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
	
	if (str) {
 10020dc:	85 c0                	test   eax,eax
 10020de:	74 08                	je     10020e8 <printchar+0xc>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:44
		**str = c;
 10020e0:	8b 08                	mov    ecx,DWORD PTR [eax]
 10020e2:	88 11                	mov    BYTE PTR [ecx],dl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:45
		++(*str);
 10020e4:	83 00 01             	add    DWORD PTR [eax],0x1
 10020e7:	c3                   	ret    
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:41
//extern bool pauseDisplay(bool offerToQuit);
extern uint32_t kDebugLevel;
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
 10020e8:	83 ec 18             	sub    esp,0x18
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:47
	
	if (str) {
		**str = c;
		++(*str);
	}
	else terminal_putchar((unsigned char)c);
 10020eb:	0f b6 d2             	movzx  edx,dl
 10020ee:	52                   	push   edx
 10020ef:	e8 d1 e0 ff ff       	call   10001c5 <terminal_putchar>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:48
}
 10020f4:	83 c4 1c             	add    esp,0x1c
 10020f7:	c3                   	ret    

010020f8 <prints>:
prints():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:54

#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
 10020f8:	55                   	push   ebp
 10020f9:	57                   	push   edi
 10020fa:	56                   	push   esi
 10020fb:	53                   	push   ebx
 10020fc:	83 ec 1c             	sub    esp,0x1c
 10020ff:	89 c7                	mov    edi,eax
 1002101:	89 d6                	mov    esi,edx
 1002103:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
 1002107:	8b 54 24 30          	mov    edx,DWORD PTR [esp+0x30]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:57
	register int pc = 0, padchar = ' ';

	if (width > 0) {
 100210b:	85 c9                	test   ecx,ecx
 100210d:	0f 8e cb 00 00 00    	jle    10021de <prints+0xe6>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:60 (discriminator 1)
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
 1002113:	80 3e 00             	cmp    BYTE PTR [esi],0x0
 1002116:	74 1b                	je     1002133 <prints+0x3b>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:60
 1002118:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:60 (discriminator 3)
 100211d:	83 c0 01             	add    eax,0x1
 1002120:	80 3c 06 00          	cmp    BYTE PTR [esi+eax*1],0x0
 1002124:	75 f7                	jne    100211d <prints+0x25>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:61
		if (len >= width) width = 0;
 1002126:	bb 00 00 00 00       	mov    ebx,0x0
 100212b:	39 44 24 0c          	cmp    DWORD PTR [esp+0xc],eax
 100212f:	7e 0f                	jle    1002140 <prints+0x48>
 1002131:	eb 05                	jmp    1002138 <prints+0x40>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:60
	register int pc = 0, padchar = ' ';

	if (width > 0) {
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
 1002133:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:62
		if (len >= width) width = 0;
		else width -= len;
 1002138:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 100213c:	29 c1                	sub    ecx,eax
 100213e:	89 cb                	mov    ebx,ecx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:63
		if (pad & PAD_ZERO) padchar = '0';
 1002140:	89 d0                	mov    eax,edx
 1002142:	83 e0 02             	and    eax,0x2
 1002145:	83 f8 01             	cmp    eax,0x1
 1002148:	19 ed                	sbb    ebp,ebp
 100214a:	83 e5 f0             	and    ebp,0xfffffff0
 100214d:	83 c5 30             	add    ebp,0x30
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:65
	}
	if (!(pad & PAD_RIGHT)) {
 1002150:	f6 c2 01             	test   dl,0x1
 1002153:	75 1a                	jne    100216f <prints+0x77>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:66 (discriminator 1)
		for ( ; width > 0; --width) {
 1002155:	85 db                	test   ebx,ebx
 1002157:	7e 67                	jle    10021c0 <prints+0xc8>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:66
 1002159:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:67 (discriminator 2)
			printchar (out, padchar);
 100215d:	89 ea                	mov    edx,ebp
 100215f:	89 f8                	mov    eax,edi
 1002161:	e8 76 ff ff ff       	call   10020dc <printchar>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:66 (discriminator 2)
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
 1002166:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
 100216b:	75 f0                	jne    100215d <prints+0x65>
 100216d:	eb 66                	jmp    10021d5 <prints+0xdd>
 100216f:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 1)
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 1002173:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 1002176:	84 d2                	test   dl,dl
 1002178:	74 1e                	je     1002198 <prints+0xa0>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 100217a:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 100217f:	29 de                	sub    esi,ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:72 (discriminator 2)
		printchar (out, *string);
 1002181:	0f be d2             	movsx  edx,dl
 1002184:	89 f8                	mov    eax,edi
 1002186:	e8 51 ff ff ff       	call   10020dc <printchar>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:73 (discriminator 2)
		++pc;
 100218b:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 100218e:	0f b6 14 1e          	movzx  edx,BYTE PTR [esi+ebx*1]
 1002192:	84 d2                	test   dl,dl
 1002194:	75 eb                	jne    1002181 <prints+0x89>
 1002196:	eb 05                	jmp    100219d <prints+0xa5>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 1002198:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:75 (discriminator 1)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
 100219d:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10021a1:	85 c0                	test   eax,eax
 10021a3:	7e 45                	jle    10021ea <prints+0xf2>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:75
 10021a5:	89 c6                	mov    esi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:76 (discriminator 2)
		printchar (out, padchar);
 10021a7:	89 ea                	mov    edx,ebp
 10021a9:	89 f8                	mov    eax,edi
 10021ab:	e8 2c ff ff ff       	call   10020dc <printchar>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:75 (discriminator 2)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
 10021b0:	83 ee 01             	sub    esi,0x1
 10021b3:	75 f2                	jne    10021a7 <prints+0xaf>
 10021b5:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10021b9:	8d 04 03             	lea    eax,[ebx+eax*1]
 10021bc:	89 c3                	mov    ebx,eax
 10021be:	eb 2a                	jmp    10021ea <prints+0xf2>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:66
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
 10021c0:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
 10021c4:	bb 00 00 00 00       	mov    ebx,0x0
 10021c9:	eb 0a                	jmp    10021d5 <prints+0xdd>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 10021cb:	bd 20 00 00 00       	mov    ebp,0x20
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
 10021d0:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:71
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 10021d5:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 10021d8:	84 d2                	test   dl,dl
 10021da:	75 a3                	jne    100217f <prints+0x87>
 10021dc:	eb 0c                	jmp    10021ea <prints+0xf2>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
 10021de:	f6 c2 01             	test   dl,0x1
 10021e1:	74 e8                	je     10021cb <prints+0xd3>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 10021e3:	bd 20 00 00 00       	mov    ebp,0x20
 10021e8:	eb 89                	jmp    1002173 <prints+0x7b>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:81
		printchar (out, padchar);
		++pc;
	}

	return pc;
}
 10021ea:	89 d8                	mov    eax,ebx
 10021ec:	83 c4 1c             	add    esp,0x1c
 10021ef:	5b                   	pop    ebx
 10021f0:	5e                   	pop    esi
 10021f1:	5f                   	pop    edi
 10021f2:	5d                   	pop    ebp
 10021f3:	c3                   	ret    

010021f4 <printi>:
printi():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:87

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
 10021f4:	55                   	push   ebp
 10021f5:	57                   	push   edi
 10021f6:	56                   	push   esi
 10021f7:	53                   	push   ebx
 10021f8:	83 ec 2c             	sub    esp,0x2c
 10021fb:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:93
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;

	if (i == 0) {
 10021ff:	85 d2                	test   edx,edx
 1002201:	75 2a                	jne    100222d <printi+0x39>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:94
		print_buf[0] = '0';
 1002203:	c6 44 24 14 30       	mov    BYTE PTR [esp+0x14],0x30
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:95
		print_buf[1] = '\0';
 1002208:	c6 44 24 15 00       	mov    BYTE PTR [esp+0x15],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:96
		return prints (out, print_buf, width, pad);
 100220d:	83 ec 0c             	sub    esp,0xc
 1002210:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 1002214:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
 1002218:	8d 54 24 24          	lea    edx,[esp+0x24]
 100221c:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002220:	e8 d3 fe ff ff       	call   10020f8 <prints>
 1002225:	83 c4 10             	add    esp,0x10
 1002228:	e9 f1 00 00 00       	jmp    100231e <printi+0x12a>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:99
	}

	if (sg && b == 10 && i < 0) {
 100222d:	83 7c 24 40 00       	cmp    DWORD PTR [esp+0x40],0x0
 1002232:	0f 95 c3             	setne  bl
 1002235:	83 f9 0a             	cmp    ecx,0xa
 1002238:	0f 94 c0             	sete   al
 100223b:	84 c3                	test   bl,al
 100223d:	0f 84 c1 00 00 00    	je     1002304 <printi+0x110>
 1002243:	89 d0                	mov    eax,edx
 1002245:	c1 e8 1f             	shr    eax,0x1f
 1002248:	84 c0                	test   al,al
 100224a:	0f 84 b4 00 00 00    	je     1002304 <printi+0x110>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
 1002250:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
 1002255:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:107
	*s = '\0';

	while (u) {
 1002259:	89 d3                	mov    ebx,edx
 100225b:	f7 db                	neg    ebx
 100225d:	74 54                	je     10022b3 <printi+0xbf>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:100
		print_buf[1] = '\0';
		return prints (out, print_buf, width, pad);
	}

	if (sg && b == 10 && i < 0) {
		neg = 1;
 100225f:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
 1002266:	00 
 1002267:	eb 08                	jmp    1002271 <printi+0x7d>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 1002269:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 1002270:	00 
 1002271:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
 1002275:	89 cf                	mov    edi,ecx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
 1002277:	8b 44 24 4c          	mov    eax,DWORD PTR [esp+0x4c]
 100227b:	8d 68 c6             	lea    ebp,[eax-0x3a]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
 100227e:	89 d8                	mov    eax,ebx
 1002280:	ba 00 00 00 00       	mov    edx,0x0
 1002285:	f7 f1                	div    ecx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
 1002287:	8d 04 2a             	lea    eax,[edx+ebp*1]
 100228a:	83 fa 0a             	cmp    edx,0xa
 100228d:	0f 4c c2             	cmovl  eax,edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:111
		*--s = t + '0';
 1002290:	83 ee 01             	sub    esi,0x1
 1002293:	83 c0 30             	add    eax,0x30
 1002296:	88 06                	mov    BYTE PTR [esi],al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:112
		u /= b;
 1002298:	89 d8                	mov    eax,ebx
 100229a:	ba 00 00 00 00       	mov    edx,0x0
 100229f:	f7 f7                	div    edi
 10022a1:	89 c3                	mov    ebx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:107
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
 10022a3:	85 c0                	test   eax,eax
 10022a5:	75 d7                	jne    100227e <printi+0x8a>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 10022a7:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:115
			t += letbase - '0' - 10;
		*--s = t + '0';
		u /= b;
	}

	if (neg) {
 10022ac:	83 7c 24 0c 00       	cmp    DWORD PTR [esp+0xc],0x0
 10022b1:	74 34                	je     10022e7 <printi+0xf3>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:116
		if( width && (pad & PAD_ZERO) ) {
 10022b3:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
 10022b8:	74 21                	je     10022db <printi+0xe7>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:116 (discriminator 1)
 10022ba:	f6 44 24 48 02       	test   BYTE PTR [esp+0x48],0x2
 10022bf:	74 1a                	je     10022db <printi+0xe7>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:117
			printchar (out, '-');
 10022c1:	ba 2d 00 00 00       	mov    edx,0x2d
 10022c6:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 10022ca:	e8 0d fe ff ff       	call   10020dc <printchar>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:119
			++pc;
			--width;
 10022cf:	83 6c 24 44 01       	sub    DWORD PTR [esp+0x44],0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:118
	}

	if (neg) {
		if( width && (pad & PAD_ZERO) ) {
			printchar (out, '-');
			++pc;
 10022d4:	bb 01 00 00 00       	mov    ebx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:119
			--width;
 10022d9:	eb 0c                	jmp    10022e7 <printi+0xf3>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:122
		}
		else {
			*--s = '-';
 10022db:	c6 46 ff 2d          	mov    BYTE PTR [esi-0x1],0x2d
 10022df:	8d 76 ff             	lea    esi,[esi-0x1]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 10022e2:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:126
		else {
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
 10022e7:	83 ec 0c             	sub    esp,0xc
 10022ea:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 10022ee:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
 10022f2:	89 f2                	mov    edx,esi
 10022f4:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 10022f8:	e8 fb fd ff ff       	call   10020f8 <prints>
 10022fd:	01 d8                	add    eax,ebx
 10022ff:	83 c4 10             	add    esp,0x10
 1002302:	eb 1a                	jmp    100231e <printi+0x12a>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:91
static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;
 1002304:	89 d3                	mov    ebx,edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
 1002306:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:107

	while (u) {
 100230b:	85 d2                	test   edx,edx
 100230d:	0f 85 56 ff ff ff    	jne    1002269 <printi+0x75>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 1002313:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
 1002318:	8d 74 24 1f          	lea    esi,[esp+0x1f]
 100231c:	eb c9                	jmp    10022e7 <printi+0xf3>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:127
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
}
 100231e:	83 c4 2c             	add    esp,0x2c
 1002321:	5b                   	pop    ebx
 1002322:	5e                   	pop    esi
 1002323:	5f                   	pop    edi
 1002324:	5d                   	pop    ebp
 1002325:	c3                   	ret    

01002326 <print>:
print():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:130

static int print(char **out, const char *format, va_list args )
{
 1002326:	55                   	push   ebp
 1002327:	57                   	push   edi
 1002328:	56                   	push   esi
 1002329:	53                   	push   ebx
 100232a:	83 ec 2c             	sub    esp,0x2c
 100232d:	89 c7                	mov    edi,eax
 100232f:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:135
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
 1002333:	0f b6 02             	movzx  eax,BYTE PTR [edx]
 1002336:	84 c0                	test   al,al
 1002338:	0f 84 b8 01 00 00    	je     10024f6 <print+0x1d0>
 100233e:	89 d5                	mov    ebp,edx
 1002340:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:136
		if (*format == '%') {
 1002345:	3c 25                	cmp    al,0x25
 1002347:	0f 85 88 01 00 00    	jne    10024d5 <print+0x1af>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:137
			++format;
 100234d:	8d 5d 01             	lea    ebx,[ebp+0x1]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:139
			width = pad = 0;
			if (*format == '\0') break;
 1002350:	0f b6 55 01          	movzx  edx,BYTE PTR [ebp+0x1]
 1002354:	84 d2                	test   dl,dl
 1002356:	0f 84 9f 01 00 00    	je     10024fb <print+0x1d5>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:140
			if (*format == '%') goto out;
 100235c:	80 fa 25             	cmp    dl,0x25
 100235f:	0f 84 6e 01 00 00    	je     10024d3 <print+0x1ad>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:138
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
			width = pad = 0;
 1002365:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:141
			if (*format == '\0') break;
			if (*format == '%') goto out;
			if (*format == '-') {
 100236a:	80 fa 2d             	cmp    dl,0x2d
 100236d:	75 08                	jne    1002377 <print+0x51>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:142
				++format;
 100236f:	8d 5d 02             	lea    ebx,[ebp+0x2]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:143
				pad = PAD_RIGHT;
 1002372:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:145
			}
			while (*format == '0') {
 1002377:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
 100237a:	75 0b                	jne    1002387 <print+0x61>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:146
				++format;
 100237c:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:147
				pad |= PAD_ZERO;
 100237f:	83 c8 02             	or     eax,0x2
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:145
			if (*format == '%') goto out;
			if (*format == '-') {
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0') {
 1002382:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
 1002385:	74 f5                	je     100237c <print+0x56>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:149 (discriminator 1)
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
 1002387:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
 100238a:	8d 4a d0             	lea    ecx,[edx-0x30]
 100238d:	80 f9 09             	cmp    cl,0x9
 1002390:	77 22                	ja     10023b4 <print+0x8e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:149
 1002392:	b9 00 00 00 00       	mov    ecx,0x0
 1002397:	89 c5                	mov    ebp,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:150 (discriminator 2)
				width *= 10;
 1002399:	8d 04 89             	lea    eax,[ecx+ecx*4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:151 (discriminator 2)
				width += *format - '0';
 100239c:	0f be d2             	movsx  edx,dl
 100239f:	8d 4c 42 d0          	lea    ecx,[edx+eax*2-0x30]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:149 (discriminator 2)
			}
			while (*format == '0') {
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
 10023a3:	83 c3 01             	add    ebx,0x1
 10023a6:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
 10023a9:	8d 42 d0             	lea    eax,[edx-0x30]
 10023ac:	3c 09                	cmp    al,0x9
 10023ae:	76 e9                	jbe    1002399 <print+0x73>
 10023b0:	89 e8                	mov    eax,ebp
 10023b2:	eb 05                	jmp    10023b9 <print+0x93>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:149
 10023b4:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:153
				width *= 10;
				width += *format - '0';
			}
			if( *format == 's' ) {
 10023b9:	80 fa 73             	cmp    dl,0x73
 10023bc:	75 2c                	jne    10023ea <print+0xc4>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:154
				register char *s = (char *)va_arg( args, int );
 10023be:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 10023c2:	8d 6a 04             	lea    ebp,[edx+0x4]
 10023c5:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 10023c9:	8b 12                	mov    edx,DWORD PTR [edx]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:155
				pc += prints (out, s?s:"(null)", width, pad);
 10023cb:	85 d2                	test   edx,edx
 10023cd:	bd e5 63 00 01       	mov    ebp,0x10063e5
 10023d2:	0f 44 d5             	cmove  edx,ebp
 10023d5:	83 ec 0c             	sub    esp,0xc
 10023d8:	50                   	push   eax
 10023d9:	89 f8                	mov    eax,edi
 10023db:	e8 18 fd ff ff       	call   10020f8 <prints>
 10023e0:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:156
				continue;
 10023e2:	83 c4 10             	add    esp,0x10
 10023e5:	e9 fb 00 00 00       	jmp    10024e5 <print+0x1bf>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:158
			}
			if( *format == 'd' ) {
 10023ea:	80 fa 64             	cmp    dl,0x64
 10023ed:	75 29                	jne    1002418 <print+0xf2>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:159
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
 10023ef:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 10023f3:	8d 6a 04             	lea    ebp,[edx+0x4]
 10023f6:	6a 61                	push   0x61
 10023f8:	50                   	push   eax
 10023f9:	51                   	push   ecx
 10023fa:	6a 01                	push   0x1
 10023fc:	b9 0a 00 00 00       	mov    ecx,0xa
 1002401:	8b 12                	mov    edx,DWORD PTR [edx]
 1002403:	89 f8                	mov    eax,edi
 1002405:	e8 ea fd ff ff       	call   10021f4 <printi>
 100240a:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:160
				continue;
 100240c:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:159
				register char *s = (char *)va_arg( args, int );
				pc += prints (out, s?s:"(null)", width, pad);
				continue;
			}
			if( *format == 'd' ) {
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
 100240f:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:160
				continue;
 1002413:	e9 cd 00 00 00       	jmp    10024e5 <print+0x1bf>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:162
			}
			if( *format == 'x' ) {
 1002418:	80 fa 78             	cmp    dl,0x78
 100241b:	75 2b                	jne    1002448 <print+0x122>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:163
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
 100241d:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 1002421:	89 ea                	mov    edx,ebp
 1002423:	83 c5 04             	add    ebp,0x4
 1002426:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 100242a:	6a 61                	push   0x61
 100242c:	50                   	push   eax
 100242d:	51                   	push   ecx
 100242e:	6a 00                	push   0x0
 1002430:	b9 10 00 00 00       	mov    ecx,0x10
 1002435:	8b 12                	mov    edx,DWORD PTR [edx]
 1002437:	89 f8                	mov    eax,edi
 1002439:	e8 b6 fd ff ff       	call   10021f4 <printi>
 100243e:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:164
				continue;
 1002440:	83 c4 10             	add    esp,0x10
 1002443:	e9 9d 00 00 00       	jmp    10024e5 <print+0x1bf>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:166
			}
			if( *format == 'X' ) {
 1002448:	80 fa 58             	cmp    dl,0x58
 100244b:	75 26                	jne    1002473 <print+0x14d>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:167
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
 100244d:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 1002451:	8d 6a 04             	lea    ebp,[edx+0x4]
 1002454:	6a 41                	push   0x41
 1002456:	50                   	push   eax
 1002457:	51                   	push   ecx
 1002458:	6a 00                	push   0x0
 100245a:	b9 10 00 00 00       	mov    ecx,0x10
 100245f:	8b 12                	mov    edx,DWORD PTR [edx]
 1002461:	89 f8                	mov    eax,edi
 1002463:	e8 8c fd ff ff       	call   10021f4 <printi>
 1002468:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:168
				continue;
 100246a:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:167
			if( *format == 'x' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
				continue;
			}
			if( *format == 'X' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
 100246d:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:168
				continue;
 1002471:	eb 72                	jmp    10024e5 <print+0x1bf>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:170
			}
			if( *format == 'u' ) {
 1002473:	80 fa 75             	cmp    dl,0x75
 1002476:	75 28                	jne    10024a0 <print+0x17a>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:171
				pc += printi (out, va_arg( args, int ), 10, 0, width, pad, 'a');
 1002478:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 100247c:	89 ea                	mov    edx,ebp
 100247e:	83 c5 04             	add    ebp,0x4
 1002481:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 1002485:	6a 61                	push   0x61
 1002487:	50                   	push   eax
 1002488:	51                   	push   ecx
 1002489:	6a 00                	push   0x0
 100248b:	b9 0a 00 00 00       	mov    ecx,0xa
 1002490:	8b 12                	mov    edx,DWORD PTR [edx]
 1002492:	89 f8                	mov    eax,edi
 1002494:	e8 5b fd ff ff       	call   10021f4 <printi>
 1002499:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:172
				continue;
 100249b:	83 c4 10             	add    esp,0x10
 100249e:	eb 45                	jmp    10024e5 <print+0x1bf>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:174
			}
			if( *format == 'c' ) {
 10024a0:	80 fa 63             	cmp    dl,0x63
 10024a3:	75 40                	jne    10024e5 <print+0x1bf>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:176
				/* char are converted to int then pushed on the stack */
				scr[0] = (char)va_arg( args, int );
 10024a5:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 10024a9:	89 ea                	mov    edx,ebp
 10024ab:	83 c5 04             	add    ebp,0x4
 10024ae:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 10024b2:	8b 12                	mov    edx,DWORD PTR [edx]
 10024b4:	88 54 24 1e          	mov    BYTE PTR [esp+0x1e],dl
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:177
				scr[1] = '\0';
 10024b8:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:178
				pc += prints (out, scr, width, pad);
 10024bd:	83 ec 0c             	sub    esp,0xc
 10024c0:	50                   	push   eax
 10024c1:	8d 54 24 2e          	lea    edx,[esp+0x2e]
 10024c5:	89 f8                	mov    eax,edi
 10024c7:	e8 2c fc ff ff       	call   10020f8 <prints>
 10024cc:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:179
				continue;
 10024ce:	83 c4 10             	add    esp,0x10
 10024d1:	eb 12                	jmp    10024e5 <print+0x1bf>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:137
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
 10024d3:	89 dd                	mov    ebp,ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:184
				continue;
			}
		}
		else {
		out:
			printchar (out, *format);
 10024d5:	0f be 55 00          	movsx  edx,BYTE PTR [ebp+0x0]
 10024d9:	89 f8                	mov    eax,edi
 10024db:	e8 fc fb ff ff       	call   10020dc <printchar>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:185
			++pc;
 10024e0:	83 c6 01             	add    esi,0x1
 10024e3:	89 eb                	mov    ebx,ebp
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:135
{
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
 10024e5:	8d 6b 01             	lea    ebp,[ebx+0x1]
 10024e8:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
 10024ec:	84 c0                	test   al,al
 10024ee:	0f 85 51 fe ff ff    	jne    1002345 <print+0x1f>
 10024f4:	eb 05                	jmp    10024fb <print+0x1d5>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:132
}

static int print(char **out, const char *format, va_list args )
{
	register int width, pad;
	register int pc = 0;
 10024f6:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:188
		out:
			printchar (out, *format);
			++pc;
		}
	}
	if (out) **out = '\0';
 10024fb:	85 ff                	test   edi,edi
 10024fd:	74 05                	je     1002504 <print+0x1de>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:188 (discriminator 1)
 10024ff:	8b 07                	mov    eax,DWORD PTR [edi]
 1002501:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:191
	va_end( args );
	return pc;
}
 1002504:	89 f0                	mov    eax,esi
 1002506:	83 c4 2c             	add    esp,0x2c
 1002509:	5b                   	pop    ebx
 100250a:	5e                   	pop    esi
 100250b:	5f                   	pop    edi
 100250c:	5d                   	pop    ebp
 100250d:	c3                   	ret    

0100250e <printk_valist>:
printk_valist():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:194

int printk_valist(const char *format, va_list args)
{
 100250e:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:195
    return print(0, format, args);
 1002511:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
 1002515:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 1002519:	b8 00 00 00 00       	mov    eax,0x0
 100251e:	e8 03 fe ff ff       	call   1002326 <print>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:196
}
 1002523:	83 c4 0c             	add    esp,0xc
 1002526:	c3                   	ret    

01002527 <printk>:
printk():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:199

int printk(const char *format, ...)
{
 1002527:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:201
        va_list args;
        va_start( args, format );
 100252a:	8d 44 24 14          	lea    eax,[esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:202
        return printk_valist(format, args);
 100252e:	83 ec 08             	sub    esp,0x8
 1002531:	50                   	push   eax
 1002532:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1002536:	e8 d3 ff ff ff       	call   100250e <printk_valist>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:203
}
 100253b:	83 c4 1c             	add    esp,0x1c
 100253e:	c3                   	ret    

0100253f <printd>:
printd():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:209

#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
 100253f:	83 ec 0c             	sub    esp,0xc
 1002542:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:210
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
 1002546:	89 d1                	mov    ecx,edx
 1002548:	23 0d 38 03 00 02    	and    ecx,DWORD PTR ds:0x2000338
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:222
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
    }
    return 0;
 100254e:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:210
#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
 1002553:	39 ca                	cmp    edx,ecx
 1002555:	75 14                	jne    100256b <printd+0x2c>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:214
    {
        va_list args;

        va_start( args, format );
 1002557:	8d 44 24 18          	lea    eax,[esp+0x18]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:220
//        if (++printDLineCount==SYS_VGA_HEIGHT-1)
//        {
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
 100255b:	83 ec 08             	sub    esp,0x8
 100255e:	50                   	push   eax
 100255f:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
 1002563:	e8 a6 ff ff ff       	call   100250e <printk_valist>
 1002568:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:223 (discriminator 1)
    }
    return 0;
}
 100256b:	83 c4 0c             	add    esp,0xc
 100256e:	c3                   	ret    

0100256f <sprintf>:
sprintf():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:227
#endif

int sprintf(char *out, const char *format, ...)
{
 100256f:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:231
        va_list args;
        
        va_start( args, format );
        return print( &out, format, args );
 1002572:	8d 4c 24 18          	lea    ecx,[esp+0x18]
 1002576:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
 100257a:	8d 44 24 10          	lea    eax,[esp+0x10]
 100257e:	e8 a3 fd ff ff       	call   1002326 <print>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/printf.c:232
}
 1002583:	83 c4 0c             	add    esp,0xc
 1002586:	c3                   	ret    
 1002587:	90                   	nop

01002588 <strcpy>:
strcpy():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strcpy.c:5
#include "strings.h"

char *
strcpy(char *s1, const char *s2)
{
 1002588:	53                   	push   ebx
 1002589:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100258d:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strcpy.c:6
    char *s = s1;
 1002591:	89 c2                	mov    edx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strcpy.c:7 (discriminator 1)
    while ((*s++ = *s2++) != 0)
 1002593:	83 c2 01             	add    edx,0x1
 1002596:	83 c1 01             	add    ecx,0x1
 1002599:	0f b6 59 ff          	movzx  ebx,BYTE PTR [ecx-0x1]
 100259d:	88 5a ff             	mov    BYTE PTR [edx-0x1],bl
 10025a0:	84 db                	test   bl,bl
 10025a2:	75 ef                	jne    1002593 <strcpy+0xb>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strcpy.c:10
	;
    return (s1);
}
 10025a4:	5b                   	pop    ebx
 10025a5:	c3                   	ret    

010025a6 <strcpyc>:
strcpyc():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strcpy.c:14

char *
strcpyc(char *s1, const char *s2, unsigned count)
{
 10025a6:	56                   	push   esi
 10025a7:	53                   	push   ebx
 10025a8:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 10025ac:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16
    char *s = s1;
    while ((*s++ = *s2++) != 0 && count-->0)
 10025b0:	ba 00 00 00 00       	mov    edx,0x0
 10025b5:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
 10025b9:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16 (discriminator 2)
 10025bc:	0f b6 0c 16          	movzx  ecx,BYTE PTR [esi+edx*1]
 10025c0:	88 0c 10             	mov    BYTE PTR [eax+edx*1],cl
 10025c3:	84 c9                	test   cl,cl
 10025c5:	74 07                	je     10025ce <strcpyc+0x28>
 10025c7:	83 c2 01             	add    edx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strcpy.c:16 (discriminator 1)
 10025ca:	39 d3                	cmp    ebx,edx
 10025cc:	75 ee                	jne    10025bc <strcpyc+0x16>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strcpy.c:19
	;
    return (s1);
}
 10025ce:	5b                   	pop    ebx
 10025cf:	5e                   	pop    esi
 10025d0:	c3                   	ret    
 10025d1:	66 90                	xchg   ax,ax
 10025d3:	90                   	nop

010025d4 <strlen>:
strlen():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strlen.c:3
#include <stddef.h>

size_t strlen(const char* str) {
 10025d4:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strlen.c:5
          size_t ret = 0;
        while ( str[ret] != 0 )
 10025d8:	80 3a 00             	cmp    BYTE PTR [edx],0x0
 10025db:	74 10                	je     10025ed <strlen+0x19>
 10025dd:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strlen.c:6
                ret++;
 10025e2:	83 c0 01             	add    eax,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strlen.c:5
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
 10025e5:	80 3c 02 00          	cmp    BYTE PTR [edx+eax*1],0x0
 10025e9:	75 f7                	jne    10025e2 <strlen+0xe>
 10025eb:	f3 c3                	repz ret 
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strlen.c:4
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
 10025ed:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strlen.c:8
        while ( str[ret] != 0 )
                ret++;
        return ret;
}
 10025f2:	c3                   	ret    
 10025f3:	90                   	nop

010025f4 <strncmp>:
strncmp():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncmp.c:13
 *   array pointed to by `s2'.  [4.11.4.4]
 */
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
 10025f4:	57                   	push   edi
 10025f5:	56                   	push   esi
 10025f6:	53                   	push   ebx
 10025f7:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 10025fb:	8b 7c 24 14          	mov    edi,DWORD PTR [esp+0x14]
 10025ff:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncmp.c:14
    for ( ; n > 0; s1++, s2++, --n)
 1002603:	85 db                	test   ebx,ebx
 1002605:	74 41                	je     1002648 <strncmp+0x54>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncmp.c:15
	if (*s1 != *s2)
 1002607:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 100260a:	0f b6 0f             	movzx  ecx,BYTE PTR [edi]
 100260d:	38 ca                	cmp    dl,cl
 100260f:	75 1c                	jne    100262d <strncmp+0x39>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncmp.c:17
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
 1002611:	84 d2                	test   dl,dl
 1002613:	74 3a                	je     100264f <strncmp+0x5b>
 1002615:	83 eb 01             	sub    ebx,0x1
 1002618:	b8 00 00 00 00       	mov    eax,0x0
 100261d:	eb 1e                	jmp    100263d <strncmp+0x49>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncmp.c:15
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
	if (*s1 != *s2)
 100261f:	0f b6 54 06 01       	movzx  edx,BYTE PTR [esi+eax*1+0x1]
 1002624:	0f b6 4c 07 01       	movzx  ecx,BYTE PTR [edi+eax*1+0x1]
 1002629:	38 ca                	cmp    dl,cl
 100262b:	74 09                	je     1002636 <strncmp+0x42>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncmp.c:16
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
 100262d:	38 ca                	cmp    dl,cl
 100262f:	19 c0                	sbb    eax,eax
 1002631:	83 c8 01             	or     eax,0x1
 1002634:	eb 25                	jmp    100265b <strncmp+0x67>
 1002636:	83 c0 01             	add    eax,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncmp.c:17
	else if (*s1 == '\0')
 1002639:	84 d2                	test   dl,dl
 100263b:	74 19                	je     1002656 <strncmp+0x62>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncmp.c:14
 */
#include <stddef.h>

int strncmp(const char *s1, const char *s2, size_t n)
{
    for ( ; n > 0; s1++, s2++, --n)
 100263d:	39 d8                	cmp    eax,ebx
 100263f:	75 de                	jne    100261f <strncmp+0x2b>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncmp.c:19
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
    return 0;
 1002641:	b8 00 00 00 00       	mov    eax,0x0
 1002646:	eb 13                	jmp    100265b <strncmp+0x67>
 1002648:	b8 00 00 00 00       	mov    eax,0x0
 100264d:	eb 0c                	jmp    100265b <strncmp+0x67>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncmp.c:18
{
    for ( ; n > 0; s1++, s2++, --n)
	if (*s1 != *s2)
	    return ((*(unsigned char *)s1 < *(unsigned char *)s2) ? -1 : +1);
	else if (*s1 == '\0')
	    return 0;
 100264f:	b8 00 00 00 00       	mov    eax,0x0
 1002654:	eb 05                	jmp    100265b <strncmp+0x67>
 1002656:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncmp.c:20
    return 0;
}
 100265b:	5b                   	pop    ebx
 100265c:	5e                   	pop    esi
 100265d:	5f                   	pop    edi
 100265e:	c3                   	ret    
 100265f:	90                   	nop

01002660 <strncpy>:
strncpy():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncpy.c:14
 *   The `strncpy' function returns the value of `s1'.  [4.11.2.4]
 */
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
 1002660:	56                   	push   esi
 1002661:	53                   	push   ebx
 1002662:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
 1002666:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 100266a:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
 100266e:	85 c9                	test   ecx,ecx
 1002670:	74 33                	je     10026a5 <strncpy+0x45>
 1002672:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 1002675:	84 c0                	test   al,al
 1002677:	74 26                	je     100269f <strncpy+0x3f>
 1002679:	89 f2                	mov    edx,esi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncpy.c:17
	*s++ = *s2++;
 100267b:	83 c2 01             	add    edx,0x1
 100267e:	83 c3 01             	add    ebx,0x1
 1002681:	88 42 ff             	mov    BYTE PTR [edx-0x1],al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
 1002684:	83 e9 01             	sub    ecx,0x1
 1002687:	74 1c                	je     10026a5 <strncpy+0x45>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncpy.c:16 (discriminator 1)
 1002689:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
 100268c:	84 c0                	test   al,al
 100268e:	75 eb                	jne    100267b <strncpy+0x1b>
 1002690:	eb 0f                	jmp    10026a1 <strncpy+0x41>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncpy.c:21
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
	*s++ = '\0';
 1002692:	83 c2 01             	add    edx,0x1
 1002695:	c6 42 ff 00          	mov    BYTE PTR [edx-0x1],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncpy.c:20
    char *s = s1;
    while (n > 0 && *s2 != '\0') {
	*s++ = *s2++;
	--n;
    }
    while (n > 0) {
 1002699:	39 d1                	cmp    ecx,edx
 100269b:	75 f5                	jne    1002692 <strncpy+0x32>
 100269d:	eb 06                	jmp    10026a5 <strncpy+0x45>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncpy.c:15
 */
#include <stddef.h>

char * strncpy(char *s1, const char *s2, size_t n)
{
    char *s = s1;
 100269f:	89 f2                	mov    edx,esi
 10026a1:	01 d1                	add    ecx,edx
 10026a3:	eb ed                	jmp    1002692 <strncpy+0x32>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strncpy.c:25
    while (n > 0) {
	*s++ = '\0';
	--n;
    }
    return s1;
}
 10026a5:	89 f0                	mov    eax,esi
 10026a7:	5b                   	pop    ebx
 10026a8:	5e                   	pop    esi
 10026a9:	c3                   	ret    
 10026aa:	66 90                	xchg   ax,ax

010026ac <strleft>:
strleft():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strparts.c:2
char* strleft(char* val, int cnt)
{
 10026ac:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strparts.c:3
    val[cnt]='\0';
 10026b0:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 10026b4:	c6 04 10 00          	mov    BYTE PTR [eax+edx*1],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/strings/strparts.c:5
    return val;
}
 10026b8:	c3                   	ret    
 10026b9:	66 90                	xchg   ax,ax
 10026bb:	90                   	nop

010026bc <time>:
time():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:84
};

extern time_t kSystemCurrentTime;
time_t time(time_t* arg)
{
    *arg = kSystemCurrentTime;
 10026bc:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 10026c0:	8b 15 8c 02 00 02    	mov    edx,DWORD PTR ds:0x200028c
 10026c6:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:86
    return kSystemCurrentTime;
}
 10026c8:	a1 8c 02 00 02       	mov    eax,ds:0x200028c
 10026cd:	c3                   	ret    

010026ce <gmtime_r>:
gmtime_r():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:88

struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
 10026ce:	55                   	push   ebp
 10026cf:	57                   	push   edi
 10026d0:	56                   	push   esi
 10026d1:	53                   	push   ebx
 10026d2:	83 ec 08             	sub    esp,0x8
 10026d5:	8b 74 24 20          	mov    esi,DWORD PTR [esp+0x20]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:93
  time_t time = *timer;
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;

  dayclock = (unsigned long) time % SECS_DAY;
 10026d9:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 10026dd:	8b 18                	mov    ebx,DWORD PTR [eax]
 10026df:	ba 07 45 2e c2       	mov    edx,0xc22e4507
 10026e4:	89 d8                	mov    eax,ebx
 10026e6:	f7 e2                	mul    edx
 10026e8:	89 d1                	mov    ecx,edx
 10026ea:	c1 e9 10             	shr    ecx,0x10
 10026ed:	69 c9 80 51 01 00    	imul   ecx,ecx,0x15180
 10026f3:	29 cb                	sub    ebx,ecx
 10026f5:	89 d9                	mov    ecx,ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:94
  dayno = (unsigned long) time / SECS_DAY;
 10026f7:	89 d3                	mov    ebx,edx
 10026f9:	c1 eb 10             	shr    ebx,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:96

  tmbuf->tm_sec = dayclock % 60;
 10026fc:	bd 89 88 88 88       	mov    ebp,0x88888889
 1002701:	89 c8                	mov    eax,ecx
 1002703:	f7 e5                	mul    ebp
 1002705:	c1 ea 05             	shr    edx,0x5
 1002708:	6b d2 3c             	imul   edx,edx,0x3c
 100270b:	89 c8                	mov    eax,ecx
 100270d:	29 d0                	sub    eax,edx
 100270f:	89 06                	mov    DWORD PTR [esi],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:97
  tmbuf->tm_min = (dayclock % 3600) / 60;
 1002711:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
 1002716:	89 c8                	mov    eax,ecx
 1002718:	f7 e2                	mul    edx
 100271a:	89 d7                	mov    edi,edx
 100271c:	c1 ef 0b             	shr    edi,0xb
 100271f:	69 c7 10 0e 00 00    	imul   eax,edi,0xe10
 1002725:	29 c1                	sub    ecx,eax
 1002727:	89 c8                	mov    eax,ecx
 1002729:	f7 e5                	mul    ebp
 100272b:	89 d1                	mov    ecx,edx
 100272d:	c1 e9 05             	shr    ecx,0x5
 1002730:	89 4e 04             	mov    DWORD PTR [esi+0x4],ecx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:98
  tmbuf->tm_hour = dayclock / 3600;
 1002733:	89 7e 08             	mov    DWORD PTR [esi+0x8],edi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:99
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
 1002736:	8d 4b 04             	lea    ecx,[ebx+0x4]
 1002739:	ba 25 49 92 24       	mov    edx,0x24924925
 100273e:	89 c8                	mov    eax,ecx
 1002740:	f7 e2                	mul    edx
 1002742:	89 c8                	mov    eax,ecx
 1002744:	29 d0                	sub    eax,edx
 1002746:	d1 e8                	shr    eax,1
 1002748:	01 c2                	add    edx,eax
 100274a:	c1 ea 02             	shr    edx,0x2
 100274d:	8d 04 d5 00 00 00 00 	lea    eax,[edx*8+0x0]
 1002754:	29 d0                	sub    eax,edx
 1002756:	29 c1                	sub    ecx,eax
 1002758:	89 4e 18             	mov    DWORD PTR [esi+0x18],ecx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:91
}

struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
  time_t time = *timer;
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;
 100275b:	b9 b2 07 00 00       	mov    ecx,0x7b2
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 1002760:	bd 1f 85 eb 51       	mov    ebp,0x51eb851f
 1002765:	eb 53                	jmp    10027ba <gmtime_r+0xec>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 1)
    dayno -= YEARSIZE(year);
 1002767:	89 c8                	mov    eax,ecx
 1002769:	f7 ed                	imul   ebp
 100276b:	c1 fa 05             	sar    edx,0x5
 100276e:	89 c8                	mov    eax,ecx
 1002770:	c1 f8 1f             	sar    eax,0x1f
 1002773:	29 c2                	sub    edx,eax
 1002775:	6b d2 64             	imul   edx,edx,0x64
 1002778:	39 d1                	cmp    ecx,edx
 100277a:	75 26                	jne    10027a2 <gmtime_r+0xd4>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 4)
 100277c:	89 c8                	mov    eax,ecx
 100277e:	f7 ed                	imul   ebp
 1002780:	c1 fa 07             	sar    edx,0x7
 1002783:	89 c8                	mov    eax,ecx
 1002785:	c1 f8 1f             	sar    eax,0x1f
 1002788:	29 c2                	sub    edx,eax
 100278a:	69 c2 90 01 00 00    	imul   eax,edx,0x190
 1002790:	89 cf                	mov    edi,ecx
 1002792:	29 c7                	sub    edi,eax
 1002794:	83 ff 01             	cmp    edi,0x1
 1002797:	19 c0                	sbb    eax,eax
 1002799:	f7 d0                	not    eax
 100279b:	05 6e 01 00 00       	add    eax,0x16e
 10027a0:	eb 13                	jmp    10027b5 <gmtime_r+0xe7>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:101
 10027a2:	b8 6e 01 00 00       	mov    eax,0x16e
 10027a7:	eb 0c                	jmp    10027b5 <gmtime_r+0xe7>
 10027a9:	b8 6d 01 00 00       	mov    eax,0x16d
 10027ae:	eb 05                	jmp    10027b5 <gmtime_r+0xe7>
 10027b0:	b8 6e 01 00 00       	mov    eax,0x16e
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:101 (discriminator 8)
 10027b5:	29 c3                	sub    ebx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:102 (discriminator 8)
    year++;
 10027b7:	83 c1 01             	add    ecx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 10027ba:	89 cf                	mov    edi,ecx
 10027bc:	83 e7 03             	and    edi,0x3
 10027bf:	0f 85 d5 00 00 00    	jne    100289a <gmtime_r+0x1cc>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:100 (discriminator 1)
 10027c5:	89 c8                	mov    eax,ecx
 10027c7:	f7 ed                	imul   ebp
 10027c9:	c1 fa 05             	sar    edx,0x5
 10027cc:	89 c8                	mov    eax,ecx
 10027ce:	c1 f8 1f             	sar    eax,0x1f
 10027d1:	29 c2                	sub    edx,eax
 10027d3:	6b d2 64             	imul   edx,edx,0x64
 10027d6:	39 d1                	cmp    ecx,edx
 10027d8:	0f 85 0a 01 00 00    	jne    10028e8 <gmtime_r+0x21a>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:100 (discriminator 4)
 10027de:	89 c8                	mov    eax,ecx
 10027e0:	f7 ed                	imul   ebp
 10027e2:	c1 fa 07             	sar    edx,0x7
 10027e5:	89 c8                	mov    eax,ecx
 10027e7:	c1 f8 1f             	sar    eax,0x1f
 10027ea:	29 c2                	sub    edx,eax
 10027ec:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 10027f2:	39 d1                	cmp    ecx,edx
 10027f4:	0f 84 03 01 00 00    	je     10028fd <gmtime_r+0x22f>
 10027fa:	e9 b0 00 00 00       	jmp    10028af <gmtime_r+0x1e1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:104
    dayno -= YEARSIZE(year);
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
 10027ff:	8d 81 94 f8 ff ff    	lea    eax,[ecx-0x76c]
 1002805:	89 46 14             	mov    DWORD PTR [esi+0x14],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:105
  tmbuf->tm_yday = dayno;
 1002808:	89 5e 1c             	mov    DWORD PTR [esi+0x1c],ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:106
  tmbuf->tm_mon = 0;
 100280b:	c7 46 10 00 00 00 00 	mov    DWORD PTR [esi+0x10],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:108
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
 1002812:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
 1002817:	89 c8                	mov    eax,ecx
 1002819:	f7 ea                	imul   edx
 100281b:	89 d5                	mov    ebp,edx
 100281d:	c1 fd 05             	sar    ebp,0x5
 1002820:	89 c8                	mov    eax,ecx
 1002822:	c1 f8 1f             	sar    eax,0x1f
 1002825:	29 c5                	sub    ebp,eax
 1002827:	6b ed 64             	imul   ebp,ebp,0x64
 100282a:	89 cf                	mov    edi,ecx
 100282c:	29 ef                	sub    edi,ebp
 100282e:	89 fd                	mov    ebp,edi
 1002830:	c1 fa 07             	sar    edx,0x7
 1002833:	29 c2                	sub    edx,eax
 1002835:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 100283b:	29 d1                	sub    ecx,edx
 100283d:	89 0c 24             	mov    DWORD PTR [esp],ecx
 1002840:	8b 7c 24 04          	mov    edi,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 1002844:	eb 40                	jmp    1002886 <gmtime_r+0x1b8>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 1)
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
 1002846:	85 ed                	test   ebp,ebp
 1002848:	75 0d                	jne    1002857 <gmtime_r+0x189>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 4)
 100284a:	83 3c 24 00          	cmp    DWORD PTR [esp],0x0
 100284e:	74 0e                	je     100285e <gmtime_r+0x190>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 6)
 1002850:	ba 00 00 00 00       	mov    edx,0x0
 1002855:	eb 1a                	jmp    1002871 <gmtime_r+0x1a3>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:108
 1002857:	ba 01 00 00 00       	mov    edx,0x1
 100285c:	eb 13                	jmp    1002871 <gmtime_r+0x1a3>
 100285e:	ba 01 00 00 00       	mov    edx,0x1
 1002863:	eb 0c                	jmp    1002871 <gmtime_r+0x1a3>
 1002865:	ba 01 00 00 00       	mov    edx,0x1
 100286a:	eb 05                	jmp    1002871 <gmtime_r+0x1a3>
 100286c:	ba 01 00 00 00       	mov    edx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:108 (discriminator 8)
 1002871:	8d 0c 12             	lea    ecx,[edx+edx*1]
 1002874:	01 ca                	add    edx,ecx
 1002876:	8d 14 90             	lea    edx,[eax+edx*4]
 1002879:	2b 1c 95 00 40 00 01 	sub    ebx,DWORD PTR [edx*4+0x1004000]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:109 (discriminator 8)
    tmbuf->tm_mon++;
 1002880:	83 c0 01             	add    eax,0x1
 1002883:	89 46 10             	mov    DWORD PTR [esi+0x10],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 1002886:	85 ff                	test   edi,edi
 1002888:	75 4c                	jne    10028d6 <gmtime_r+0x208>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:107 (discriminator 1)
 100288a:	85 ed                	test   ebp,ebp
 100288c:	0f 85 92 00 00 00    	jne    1002924 <gmtime_r+0x256>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:107 (discriminator 4)
 1002892:	83 3c 24 00          	cmp    DWORD PTR [esp],0x0
 1002896:	74 7a                	je     1002912 <gmtime_r+0x244>
 1002898:	eb 2a                	jmp    10028c4 <gmtime_r+0x1f6>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 100289a:	81 fb 6c 01 00 00    	cmp    ebx,0x16c
 10028a0:	0f 87 03 ff ff ff    	ja     10027a9 <gmtime_r+0xdb>
 10028a6:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 10028aa:	e9 50 ff ff ff       	jmp    10027ff <gmtime_r+0x131>
 10028af:	81 fb 6c 01 00 00    	cmp    ebx,0x16c
 10028b5:	0f 87 ac fe ff ff    	ja     1002767 <gmtime_r+0x99>
 10028bb:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 10028bf:	e9 3b ff ff ff       	jmp    10027ff <gmtime_r+0x131>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 10028c4:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 10028c7:	3b 1c 85 00 40 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1004000]
 10028ce:	0f 83 72 ff ff ff    	jae    1002846 <gmtime_r+0x178>
 10028d4:	eb 5e                	jmp    1002934 <gmtime_r+0x266>
 10028d6:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 10028d9:	3b 1c 85 00 40 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1004000]
 10028e0:	0f 83 6a ff ff ff    	jae    1002850 <gmtime_r+0x182>
 10028e6:	eb 4c                	jmp    1002934 <gmtime_r+0x266>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
 10028e8:	81 fb 6d 01 00 00    	cmp    ebx,0x16d
 10028ee:	0f 87 bc fe ff ff    	ja     10027b0 <gmtime_r+0xe2>
 10028f4:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 10028f8:	e9 02 ff ff ff       	jmp    10027ff <gmtime_r+0x131>
 10028fd:	81 fb 6d 01 00 00    	cmp    ebx,0x16d
 1002903:	0f 87 73 fe ff ff    	ja     100277c <gmtime_r+0xae>
 1002909:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
 100290d:	e9 ed fe ff ff       	jmp    10027ff <gmtime_r+0x131>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
 1002912:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 1002915:	3b 1c 85 30 40 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1004030]
 100291c:	0f 83 43 ff ff ff    	jae    1002865 <gmtime_r+0x197>
 1002922:	eb 10                	jmp    1002934 <gmtime_r+0x266>
 1002924:	8b 46 10             	mov    eax,DWORD PTR [esi+0x10]
 1002927:	3b 1c 85 30 40 00 01 	cmp    ebx,DWORD PTR [eax*4+0x1004030]
 100292e:	0f 83 38 ff ff ff    	jae    100286c <gmtime_r+0x19e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:111
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
    tmbuf->tm_mon++;
  }
  tmbuf->tm_mday = dayno + 1;
 1002934:	83 c3 01             	add    ebx,0x1
 1002937:	89 5e 0c             	mov    DWORD PTR [esi+0xc],ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:112
  tmbuf->tm_isdst = 0;
 100293a:	c7 46 20 00 00 00 00 	mov    DWORD PTR [esi+0x20],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:114
  return tmbuf;
}
 1002941:	89 f0                	mov    eax,esi
 1002943:	83 c4 08             	add    esp,0x8
 1002946:	5b                   	pop    ebx
 1002947:	5e                   	pop    esi
 1002948:	5f                   	pop    edi
 1002949:	5d                   	pop    ebp
 100294a:	c3                   	ret    

0100294b <localtime>:
localtime():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:116

struct tm *localtime(const time_t *timer) {
 100294b:	83 ec 30             	sub    esp,0x30
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:120
  time_t t;
  struct tm tmbuf;
  
  t = *timer - kTimeZone;
 100294e:	8b 44 24 34          	mov    eax,DWORD PTR [esp+0x34]
 1002952:	8b 00                	mov    eax,DWORD PTR [eax]
 1002954:	2b 05 90 02 00 02    	sub    eax,DWORD PTR ds:0x2000290
 100295a:	89 44 24 2c          	mov    DWORD PTR [esp+0x2c],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:121
  return gmtime_r(&t, &tmbuf);
 100295e:	54                   	push   esp
 100295f:	8d 44 24 30          	lea    eax,[esp+0x30]
 1002963:	50                   	push   eax
 1002964:	e8 65 fd ff ff       	call   10026ce <gmtime_r>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:122
}
 1002969:	83 c4 38             	add    esp,0x38
 100296c:	c3                   	ret    

0100296d <localtime_r>:
localtime_r():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:124

struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
 100296d:	83 ec 10             	sub    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:127
  time_t t;

  t = *timer - kTimeZone;
 1002970:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
 1002974:	8b 00                	mov    eax,DWORD PTR [eax]
 1002976:	2b 05 90 02 00 02    	sub    eax,DWORD PTR ds:0x2000290
 100297c:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:128
  return gmtime_r(&t, tmbuf);
 1002980:	ff 74 24 18          	push   DWORD PTR [esp+0x18]
 1002984:	8d 44 24 10          	lea    eax,[esp+0x10]
 1002988:	50                   	push   eax
 1002989:	e8 40 fd ff ff       	call   10026ce <gmtime_r>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:129
}
 100298e:	83 c4 18             	add    esp,0x18
 1002991:	c3                   	ret    

01002992 <mktime>:
mktime():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:131

time_t mktime(struct tm *tmbuf) {
 1002992:	55                   	push   ebp
 1002993:	57                   	push   edi
 1002994:	56                   	push   esi
 1002995:	53                   	push   ebx
 1002996:	83 ec 20             	sub    esp,0x20
 1002999:	8b 5c 24 34          	mov    ebx,DWORD PTR [esp+0x34]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:139
  int yday, month;
  /*unsigned*/ long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
 100299d:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 100299f:	ba 89 88 88 88       	mov    edx,0x88888889
 10029a4:	89 c8                	mov    eax,ecx
 10029a6:	f7 ea                	imul   edx
 10029a8:	8d 04 0a             	lea    eax,[edx+ecx*1]
 10029ab:	c1 f8 05             	sar    eax,0x5
 10029ae:	89 ca                	mov    edx,ecx
 10029b0:	c1 fa 1f             	sar    edx,0x1f
 10029b3:	29 d0                	sub    eax,edx
 10029b5:	89 c2                	mov    edx,eax
 10029b7:	03 53 04             	add    edx,DWORD PTR [ebx+0x4]
 10029ba:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:140
  tmbuf->tm_sec %= 60;
 10029bd:	6b c0 3c             	imul   eax,eax,0x3c
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:141
  if (tmbuf->tm_sec < 0) {
 10029c0:	29 c1                	sub    ecx,eax
 10029c2:	78 04                	js     10029c8 <mktime+0x36>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:140
  /*unsigned*/ long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
  tmbuf->tm_sec %= 60;
 10029c4:	89 0b                	mov    DWORD PTR [ebx],ecx
 10029c6:	eb 0b                	jmp    10029d3 <mktime+0x41>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:142
  if (tmbuf->tm_sec < 0) {
    tmbuf->tm_sec += 60;
 10029c8:	83 c1 3c             	add    ecx,0x3c
 10029cb:	89 0b                	mov    DWORD PTR [ebx],ecx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:143
    tmbuf->tm_min--;
 10029cd:	83 ea 01             	sub    edx,0x1
 10029d0:	89 53 04             	mov    DWORD PTR [ebx+0x4],edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:145
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
 10029d3:	8b 4b 04             	mov    ecx,DWORD PTR [ebx+0x4]
 10029d6:	ba 89 88 88 88       	mov    edx,0x88888889
 10029db:	89 c8                	mov    eax,ecx
 10029dd:	f7 ea                	imul   edx
 10029df:	8d 04 0a             	lea    eax,[edx+ecx*1]
 10029e2:	c1 f8 05             	sar    eax,0x5
 10029e5:	89 ca                	mov    edx,ecx
 10029e7:	c1 fa 1f             	sar    edx,0x1f
 10029ea:	29 d0                	sub    eax,edx
 10029ec:	89 c2                	mov    edx,eax
 10029ee:	03 53 08             	add    edx,DWORD PTR [ebx+0x8]
 10029f1:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:146
  tmbuf->tm_min = tmbuf->tm_min % 60;
 10029f4:	6b c0 3c             	imul   eax,eax,0x3c
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:147
  if (tmbuf->tm_min < 0) {
 10029f7:	29 c1                	sub    ecx,eax
 10029f9:	78 05                	js     1002a00 <mktime+0x6e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:146
  if (tmbuf->tm_sec < 0) {
    tmbuf->tm_sec += 60;
    tmbuf->tm_min--;
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
  tmbuf->tm_min = tmbuf->tm_min % 60;
 10029fb:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
 10029fe:	eb 0c                	jmp    1002a0c <mktime+0x7a>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:148
  if (tmbuf->tm_min < 0) {
    tmbuf->tm_min += 60;
 1002a00:	83 c1 3c             	add    ecx,0x3c
 1002a03:	89 4b 04             	mov    DWORD PTR [ebx+0x4],ecx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:149
    tmbuf->tm_hour--;
 1002a06:	83 ea 01             	sub    edx,0x1
 1002a09:	89 53 08             	mov    DWORD PTR [ebx+0x8],edx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:151
  }
  day = tmbuf->tm_hour / 24;
 1002a0c:	8b 73 08             	mov    esi,DWORD PTR [ebx+0x8]
 1002a0f:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
 1002a14:	89 f0                	mov    eax,esi
 1002a16:	f7 ea                	imul   edx
 1002a18:	c1 fa 02             	sar    edx,0x2
 1002a1b:	89 f0                	mov    eax,esi
 1002a1d:	c1 f8 1f             	sar    eax,0x1f
 1002a20:	89 d1                	mov    ecx,edx
 1002a22:	29 c1                	sub    ecx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:152
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
 1002a24:	8d 04 49             	lea    eax,[ecx+ecx*2]
 1002a27:	c1 e0 03             	shl    eax,0x3
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:153
  if (tmbuf->tm_hour < 0) {
 1002a2a:	29 c6                	sub    esi,eax
 1002a2c:	78 05                	js     1002a33 <mktime+0xa1>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:152
  if (tmbuf->tm_min < 0) {
    tmbuf->tm_min += 60;
    tmbuf->tm_hour--;
  }
  day = tmbuf->tm_hour / 24;
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
 1002a2e:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
 1002a31:	eb 09                	jmp    1002a3c <mktime+0xaa>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:154
  if (tmbuf->tm_hour < 0) {
    tmbuf->tm_hour += 24;
 1002a33:	83 c6 18             	add    esi,0x18
 1002a36:	89 73 08             	mov    DWORD PTR [ebx+0x8],esi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:155
    day--;
 1002a39:	83 e9 01             	sub    ecx,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:157
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
 1002a3c:	8b 73 10             	mov    esi,DWORD PTR [ebx+0x10]
 1002a3f:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
 1002a44:	89 f0                	mov    eax,esi
 1002a46:	f7 ea                	imul   edx
 1002a48:	d1 fa                	sar    edx,1
 1002a4a:	89 f0                	mov    eax,esi
 1002a4c:	c1 f8 1f             	sar    eax,0x1f
 1002a4f:	29 c2                	sub    edx,eax
 1002a51:	89 d0                	mov    eax,edx
 1002a53:	03 43 14             	add    eax,DWORD PTR [ebx+0x14]
 1002a56:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:158
  tmbuf->tm_mon %= 12;
 1002a59:	8d 14 52             	lea    edx,[edx+edx*2]
 1002a5c:	c1 e2 02             	shl    edx,0x2
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:159
  if (tmbuf->tm_mon < 0) {
 1002a5f:	29 d6                	sub    esi,edx
 1002a61:	78 05                	js     1002a68 <mktime+0xd6>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:158
  if (tmbuf->tm_hour < 0) {
    tmbuf->tm_hour += 24;
    day--;
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
  tmbuf->tm_mon %= 12;
 1002a63:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
 1002a66:	eb 0c                	jmp    1002a74 <mktime+0xe2>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:160
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
 1002a68:	83 c6 0c             	add    esi,0xc
 1002a6b:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:161
    tmbuf->tm_year--;
 1002a6e:	83 e8 01             	sub    eax,0x1
 1002a71:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:163
  }
  day += (tmbuf->tm_mday - 1);
 1002a74:	8b 43 0c             	mov    eax,DWORD PTR [ebx+0xc]
 1002a77:	8d 6c 01 ff          	lea    ebp,[ecx+eax*1-0x1]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:164
  while (day < 0) {
 1002a7b:	85 ed                	test   ebp,ebp
 1002a7d:	0f 89 f1 00 00 00    	jns    1002b74 <mktime+0x1e2>
 1002a83:	8b 73 10             	mov    esi,DWORD PTR [ebx+0x10]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:169
    if(--tmbuf->tm_mon < 0) {
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002a86:	bf 1f 85 eb 51       	mov    edi,0x51eb851f
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:165
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
    if(--tmbuf->tm_mon < 0) {
 1002a8b:	83 ee 01             	sub    esi,0x1
 1002a8e:	79 09                	jns    1002a99 <mktime+0x107>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:166
      tmbuf->tm_year--;
 1002a90:	83 6b 14 01          	sub    DWORD PTR [ebx+0x14],0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:167
      tmbuf->tm_mon = 11;
 1002a94:	be 0b 00 00 00       	mov    esi,0xb
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:169
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002a99:	8b 4b 14             	mov    ecx,DWORD PTR [ebx+0x14]
 1002a9c:	b8 00 00 00 00       	mov    eax,0x0
 1002aa1:	f6 c1 03             	test   cl,0x3
 1002aa4:	75 3c                	jne    1002ae2 <mktime+0x150>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 1)
 1002aa6:	81 c1 6c 07 00 00    	add    ecx,0x76c
 1002aac:	89 c8                	mov    eax,ecx
 1002aae:	f7 ef                	imul   edi
 1002ab0:	c1 fa 05             	sar    edx,0x5
 1002ab3:	89 c8                	mov    eax,ecx
 1002ab5:	c1 f8 1f             	sar    eax,0x1f
 1002ab8:	29 c2                	sub    edx,eax
 1002aba:	6b d2 64             	imul   edx,edx,0x64
 1002abd:	b8 01 00 00 00       	mov    eax,0x1
 1002ac2:	39 d1                	cmp    ecx,edx
 1002ac4:	75 1c                	jne    1002ae2 <mktime+0x150>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 4)
 1002ac6:	89 c8                	mov    eax,ecx
 1002ac8:	f7 ef                	imul   edi
 1002aca:	c1 fa 07             	sar    edx,0x7
 1002acd:	89 c8                	mov    eax,ecx
 1002acf:	c1 f8 1f             	sar    eax,0x1f
 1002ad2:	29 c2                	sub    edx,eax
 1002ad4:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002ada:	39 d1                	cmp    ecx,edx
 1002adc:	0f 94 c0             	sete   al
 1002adf:	0f b6 c0             	movzx  eax,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:169 (discriminator 8)
 1002ae2:	8d 14 00             	lea    edx,[eax+eax*1]
 1002ae5:	01 d0                	add    eax,edx
 1002ae7:	8d 04 86             	lea    eax,[esi+eax*4]
 1002aea:	03 2c 85 00 40 00 01 	add    ebp,DWORD PTR [eax*4+0x1004000]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:164 (discriminator 8)
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
 1002af1:	85 ed                	test   ebp,ebp
 1002af3:	78 96                	js     1002a8b <mktime+0xf9>
 1002af5:	89 73 10             	mov    DWORD PTR [ebx+0x10],esi
 1002af8:	eb 7a                	jmp    1002b74 <mktime+0x1e2>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 1)
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002afa:	8d be 6c 07 00 00    	lea    edi,[esi+0x76c]
 1002b00:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002b05:	f7 ef                	imul   edi
 1002b07:	c1 fa 05             	sar    edx,0x5
 1002b0a:	89 f8                	mov    eax,edi
 1002b0c:	c1 f8 1f             	sar    eax,0x1f
 1002b0f:	29 c2                	sub    edx,eax
 1002b11:	6b d2 64             	imul   edx,edx,0x64
 1002b14:	39 d7                	cmp    edi,edx
 1002b16:	75 27                	jne    1002b3f <mktime+0x1ad>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 4)
 1002b18:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002b1d:	f7 ef                	imul   edi
 1002b1f:	c1 fa 07             	sar    edx,0x7
 1002b22:	89 f8                	mov    eax,edi
 1002b24:	c1 f8 1f             	sar    eax,0x1f
 1002b27:	29 c2                	sub    edx,eax
 1002b29:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002b2f:	b8 01 00 00 00       	mov    eax,0x1
 1002b34:	39 d7                	cmp    edi,edx
 1002b36:	74 13                	je     1002b4b <mktime+0x1b9>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 6)
 1002b38:	b8 00 00 00 00       	mov    eax,0x0
 1002b3d:	eb 0c                	jmp    1002b4b <mktime+0x1b9>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:172
 1002b3f:	b8 01 00 00 00       	mov    eax,0x1
 1002b44:	eb 05                	jmp    1002b4b <mktime+0x1b9>
 1002b46:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:172 (discriminator 8)
 1002b4b:	8d 14 00             	lea    edx,[eax+eax*1]
 1002b4e:	01 d0                	add    eax,edx
 1002b50:	8d 04 81             	lea    eax,[ecx+eax*4]
 1002b53:	2b 2c 85 00 40 00 01 	sub    ebp,DWORD PTR [eax*4+0x1004000]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:173 (discriminator 8)
    if (++(tmbuf->tm_mon) == 12) {
 1002b5a:	83 c1 01             	add    ecx,0x1
 1002b5d:	83 f9 0c             	cmp    ecx,0xc
 1002b60:	74 05                	je     1002b67 <mktime+0x1d5>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:173
 1002b62:	89 4b 10             	mov    DWORD PTR [ebx+0x10],ecx
 1002b65:	eb 0d                	jmp    1002b74 <mktime+0x1e2>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:174
      tmbuf->tm_mon = 0;
 1002b67:	c7 43 10 00 00 00 00 	mov    DWORD PTR [ebx+0x10],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:175
      tmbuf->tm_year++;
 1002b6e:	83 c6 01             	add    esi,0x1
 1002b71:	89 73 14             	mov    DWORD PTR [ebx+0x14],esi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002b74:	8b 73 14             	mov    esi,DWORD PTR [ebx+0x14]
 1002b77:	f7 c6 03 00 00 00    	test   esi,0x3
 1002b7d:	0f 85 ad 02 00 00    	jne    1002e30 <mktime+0x49e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:171 (discriminator 1)
 1002b83:	8d 8e 6c 07 00 00    	lea    ecx,[esi+0x76c]
 1002b89:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002b8e:	f7 e9                	imul   ecx
 1002b90:	c1 fa 05             	sar    edx,0x5
 1002b93:	89 c8                	mov    eax,ecx
 1002b95:	c1 f8 1f             	sar    eax,0x1f
 1002b98:	29 c2                	sub    edx,eax
 1002b9a:	6b d2 64             	imul   edx,edx,0x64
 1002b9d:	39 d1                	cmp    ecx,edx
 1002b9f:	0f 85 b5 02 00 00    	jne    1002e5a <mktime+0x4c8>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:171 (discriminator 4)
 1002ba5:	b8 1f 85 eb 51       	mov    eax,0x51eb851f
 1002baa:	f7 e9                	imul   ecx
 1002bac:	c1 fa 07             	sar    edx,0x7
 1002baf:	89 c8                	mov    eax,ecx
 1002bb1:	c1 f8 1f             	sar    eax,0x1f
 1002bb4:	29 c2                	sub    edx,eax
 1002bb6:	69 d2 90 01 00 00    	imul   edx,edx,0x190
 1002bbc:	39 d1                	cmp    ecx,edx
 1002bbe:	0f 84 b6 02 00 00    	je     1002e7a <mktime+0x4e8>
 1002bc4:	e9 7c 02 00 00       	jmp    1002e45 <mktime+0x4b3>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:178
    if (++(tmbuf->tm_mon) == 12) {
      tmbuf->tm_mon = 0;
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
 1002bc9:	8d 45 01             	lea    eax,[ebp+0x1]
 1002bcc:	89 43 0c             	mov    DWORD PTR [ebx+0xc],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:180
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
 1002bcf:	83 fe 45             	cmp    esi,0x45
 1002bd2:	0f 8e 51 02 00 00    	jle    1002e29 <mktime+0x497>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:190
  // Assume that when day becomes negative, there will certainly
  // be overflow on seconds.
  // The check for overflow needs not to be done for leapyears
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;
 1002bd8:	8d 86 6c 07 00 00    	lea    eax,[esi+0x76c]
 1002bde:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:192

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
 1002be2:	8d 46 ba             	lea    eax,[esi-0x46]
 1002be5:	89 c7                	mov    edi,eax
 1002be7:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:183
  tmbuf->tm_mday = day + 1;
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
  seconds = 0;
  day = 0;                      // Means days since day 0 now
  overflow = 0;
 1002beb:	3d 7c c6 59 00       	cmp    eax,0x59c67c
 1002bf0:	0f 9f c0             	setg   al
 1002bf3:	0f b6 c0             	movzx  eax,al
 1002bf6:	89 c2                	mov    edx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:193
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
  day = (tm_year - year) * 365;
 1002bf8:	89 f8                	mov    eax,edi
 1002bfa:	69 ff 6d 01 00 00    	imul   edi,edi,0x16d
 1002c00:	89 7c 24 04          	mov    DWORD PTR [esp+0x4],edi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:194
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
 1002c04:	8d 7e bd             	lea    edi,[esi-0x43]
 1002c07:	85 c0                	test   eax,eax
 1002c09:	0f 49 f8             	cmovns edi,eax
 1002c0c:	c1 ff 02             	sar    edi,0x2
 1002c0f:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
 1002c14:	2b 44 24 04          	sub    eax,DWORD PTR [esp+0x4]
 1002c18:	8d 77 01             	lea    esi,[edi+0x1]
 1002c1b:	89 14 24             	mov    DWORD PTR [esp],edx
 1002c1e:	83 ca 02             	or     edx,0x2
 1002c21:	39 f0                	cmp    eax,esi
 1002c23:	89 d6                	mov    esi,edx
 1002c25:	0f 4d 34 24          	cmovge esi,DWORD PTR [esp]
 1002c29:	89 34 24             	mov    DWORD PTR [esp],esi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:195
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
 1002c2c:	b8 00 00 00 00       	mov    eax,0x0
 1002c31:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 1002c35:	89 d6                	mov    esi,edx
 1002c37:	83 e6 03             	and    esi,0x3
 1002c3a:	89 74 24 1c          	mov    DWORD PTR [esp+0x1c],esi
 1002c3e:	74 19                	je     1002c59 <mktime+0x2c7>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:195 (discriminator 1)
 1002c40:	89 d6                	mov    esi,edx
 1002c42:	c1 fa 1f             	sar    edx,0x1f
 1002c45:	c1 ea 1e             	shr    edx,0x1e
 1002c48:	8d 04 16             	lea    eax,[esi+edx*1]
 1002c4b:	83 e0 03             	and    eax,0x3
 1002c4e:	29 d0                	sub    eax,edx
 1002c50:	83 f8 01             	cmp    eax,0x1
 1002c53:	0f 9e c0             	setle  al
 1002c56:	0f b6 c0             	movzx  eax,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:195 (discriminator 6)
 1002c59:	01 c7                	add    edi,eax
 1002c5b:	03 7c 24 04          	add    edi,DWORD PTR [esp+0x4]
 1002c5f:	89 7c 24 10          	mov    DWORD PTR [esp+0x10],edi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:196 (discriminator 6)
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
 1002c63:	bf 1f 85 eb 51       	mov    edi,0x51eb851f
 1002c68:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 1002c6c:	f7 ef                	imul   edi
 1002c6e:	89 54 24 14          	mov    DWORD PTR [esp+0x14],edx
 1002c72:	89 d0                	mov    eax,edx
 1002c74:	c1 f8 05             	sar    eax,0x5
 1002c77:	8b 54 24 08          	mov    edx,DWORD PTR [esp+0x8]
 1002c7b:	89 d6                	mov    esi,edx
 1002c7d:	c1 fe 1f             	sar    esi,0x1f
 1002c80:	89 74 24 18          	mov    DWORD PTR [esp+0x18],esi
 1002c84:	29 f0                	sub    eax,esi
 1002c86:	6b c0 64             	imul   eax,eax,0x64
 1002c89:	29 c2                	sub    edx,eax
 1002c8b:	89 d0                	mov    eax,edx
 1002c8d:	0f 95 44 24 04       	setne  BYTE PTR [esp+0x4]
 1002c92:	0f b6 54 24 04       	movzx  edx,BYTE PTR [esp+0x4]
 1002c97:	83 f8 45             	cmp    eax,0x45
 1002c9a:	0f 9e c0             	setle  al
 1002c9d:	0f b6 c0             	movzx  eax,al
 1002ca0:	89 c6                	mov    esi,eax
 1002ca2:	21 d6                	and    esi,edx
 1002ca4:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1002ca8:	f7 ef                	imul   edi
 1002caa:	89 d7                	mov    edi,edx
 1002cac:	c1 ff 05             	sar    edi,0x5
 1002caf:	89 f8                	mov    eax,edi
 1002cb1:	8b 7c 24 0c          	mov    edi,DWORD PTR [esp+0xc]
 1002cb5:	c1 ff 1f             	sar    edi,0x1f
 1002cb8:	89 7c 24 0c          	mov    DWORD PTR [esp+0xc],edi
 1002cbc:	29 f8                	sub    eax,edi
 1002cbe:	01 c6                	add    esi,eax
 1002cc0:	8b 7c 24 10          	mov    edi,DWORD PTR [esp+0x10]
 1002cc4:	29 f7                	sub    edi,esi
 1002cc6:	89 fe                	mov    esi,edi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:197 (discriminator 6)
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);
 1002cc8:	8b 44 24 14          	mov    eax,DWORD PTR [esp+0x14]
 1002ccc:	c1 f8 07             	sar    eax,0x7
 1002ccf:	89 c7                	mov    edi,eax
 1002cd1:	2b 7c 24 18          	sub    edi,DWORD PTR [esp+0x18]
 1002cd5:	69 c7 90 01 00 00    	imul   eax,edi,0x190
 1002cdb:	8b 7c 24 08          	mov    edi,DWORD PTR [esp+0x8]
 1002cdf:	29 c7                	sub    edi,eax
 1002ce1:	89 7c 24 08          	mov    DWORD PTR [esp+0x8],edi
 1002ce5:	81 ff 71 01 00 00    	cmp    edi,0x171
 1002ceb:	0f 9e 44 24 10       	setle  BYTE PTR [esp+0x10]
 1002cf0:	85 ff                	test   edi,edi
 1002cf2:	0f 95 c0             	setne  al
 1002cf5:	0f b6 c0             	movzx  eax,al
 1002cf8:	23 44 24 10          	and    eax,DWORD PTR [esp+0x10]
 1002cfc:	c1 fa 07             	sar    edx,0x7
 1002cff:	2b 54 24 0c          	sub    edx,DWORD PTR [esp+0xc]
 1002d03:	01 c2                	add    edx,eax
 1002d05:	8d 04 32             	lea    eax,[edx+esi*1]
 1002d08:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:200 (discriminator 6)

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
 1002d0c:	85 c9                	test   ecx,ecx
 1002d0e:	7e 46                	jle    1002d56 <mktime+0x3c4>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:200
 1002d10:	be 00 00 00 00       	mov    esi,0x0
 1002d15:	bf 00 00 00 00       	mov    edi,0x0
 1002d1a:	89 6c 24 10          	mov    DWORD PTR [esp+0x10],ebp
 1002d1e:	8b 6c 24 1c          	mov    ebp,DWORD PTR [esp+0x1c]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:201
    yday += _ytab[LEAPYEAR(tm_year)][month];
 1002d22:	b8 00 00 00 00       	mov    eax,0x0
 1002d27:	85 ed                	test   ebp,ebp
 1002d29:	75 0f                	jne    1002d3a <mktime+0x3a8>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:201 (discriminator 4)
 1002d2b:	83 7c 24 08 00       	cmp    DWORD PTR [esp+0x8],0x0
 1002d30:	0f 94 c0             	sete   al
 1002d33:	0a 44 24 04          	or     al,BYTE PTR [esp+0x4]
 1002d37:	0f b6 c0             	movzx  eax,al
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:201 (discriminator 8)
 1002d3a:	8d 14 00             	lea    edx,[eax+eax*1]
 1002d3d:	01 d0                	add    eax,edx
 1002d3f:	8d 04 86             	lea    eax,[esi+eax*4]
 1002d42:	03 3c 85 00 40 00 01 	add    edi,DWORD PTR [eax*4+0x1004000]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:202 (discriminator 8)
    month++;
 1002d49:	83 c6 01             	add    esi,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:200 (discriminator 8)
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
 1002d4c:	39 ce                	cmp    esi,ecx
 1002d4e:	75 d2                	jne    1002d22 <mktime+0x390>
 1002d50:	8b 6c 24 10          	mov    ebp,DWORD PTR [esp+0x10]
 1002d54:	eb 05                	jmp    1002d5b <mktime+0x3c9>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:199
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
 1002d56:	bf 00 00 00 00       	mov    edi,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:204
  while (month < tmbuf->tm_mon) {
    yday += _ytab[LEAPYEAR(tm_year)][month];
    month++;
  }
  yday += (tmbuf->tm_mday - 1);
 1002d5b:	01 ef                	add    edi,ebp
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:205
  if (day + yday < 0) overflow|=4;
 1002d5d:	8b 74 24 0c          	mov    esi,DWORD PTR [esp+0xc]
 1002d61:	01 fe                	add    esi,edi
 1002d63:	8b 0c 24             	mov    ecx,DWORD PTR [esp]
 1002d66:	89 c8                	mov    eax,ecx
 1002d68:	83 c8 04             	or     eax,0x4
 1002d6b:	85 f6                	test   esi,esi
 1002d6d:	0f 49 c1             	cmovns eax,ecx
 1002d70:	89 c5                	mov    ebp,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:208
  day += yday;

  tmbuf->tm_yday = yday;
 1002d72:	89 7b 1c             	mov    DWORD PTR [ebx+0x1c],edi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:209
  tmbuf->tm_wday = (day + 4) % 7;               // Day 0 was thursday (4)
 1002d75:	8d 4e 04             	lea    ecx,[esi+0x4]
 1002d78:	ba 93 24 49 92       	mov    edx,0x92492493
 1002d7d:	89 c8                	mov    eax,ecx
 1002d7f:	f7 ea                	imul   edx
 1002d81:	01 ca                	add    edx,ecx
 1002d83:	c1 fa 02             	sar    edx,0x2
 1002d86:	89 c8                	mov    eax,ecx
 1002d88:	c1 f8 1f             	sar    eax,0x1f
 1002d8b:	29 c2                	sub    edx,eax
 1002d8d:	8d 04 d5 00 00 00 00 	lea    eax,[edx*8+0x0]
 1002d94:	29 d0                	sub    eax,edx
 1002d96:	29 c1                	sub    ecx,eax
 1002d98:	89 4b 18             	mov    DWORD PTR [ebx+0x18],ecx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:211

  seconds = ((tmbuf->tm_hour * 60L) + tmbuf->tm_min) * 60L + tmbuf->tm_sec;
 1002d9b:	6b 4b 08 3c          	imul   ecx,DWORD PTR [ebx+0x8],0x3c
 1002d9f:	03 4b 04             	add    ecx,DWORD PTR [ebx+0x4]
 1002da2:	6b c9 3c             	imul   ecx,ecx,0x3c
 1002da5:	03 0b                	add    ecx,DWORD PTR [ebx]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:213

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
 1002da7:	bf ff ff ff 7f       	mov    edi,0x7fffffff
 1002dac:	29 cf                	sub    edi,ecx
 1002dae:	ba 07 45 2e c2       	mov    edx,0xc22e4507
 1002db3:	89 f8                	mov    eax,edi
 1002db5:	f7 ea                	imul   edx
 1002db7:	01 fa                	add    edx,edi
 1002db9:	c1 fa 10             	sar    edx,0x10
 1002dbc:	c1 ff 1f             	sar    edi,0x1f
 1002dbf:	29 fa                	sub    edx,edi
 1002dc1:	89 e8                	mov    eax,ebp
 1002dc3:	83 c8 08             	or     eax,0x8
 1002dc6:	39 d6                	cmp    esi,edx
 1002dc8:	0f 4e c5             	cmovle eax,ebp
 1002dcb:	89 04 24             	mov    DWORD PTR [esp],eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:214
  seconds += day * SECS_DAY;
 1002dce:	69 f6 80 51 01 00    	imul   esi,esi,0x15180
 1002dd4:	01 f1                	add    ecx,esi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:217

  // Now adjust according to timezone and daylight saving time
  if (((kTimeZone > 0) && (TIME_MAX - kTimeZone < seconds)) || 
 1002dd6:	a1 90 02 00 02       	mov    eax,ds:0x2000290
 1002ddb:	85 c0                	test   eax,eax
 1002ddd:	7e 0b                	jle    1002dea <mktime+0x458>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:217 (discriminator 1)
 1002ddf:	ba ff ff ff 7f       	mov    edx,0x7fffffff
 1002de4:	29 c2                	sub    edx,eax
 1002de6:	39 d1                	cmp    ecx,edx
 1002de8:	7f 0c                	jg     1002df6 <mktime+0x464>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:217 (discriminator 3)
 1002dea:	85 c0                	test   eax,eax
 1002dec:	79 0c                	jns    1002dfa <mktime+0x468>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:218
      ((kTimeZone < 0) && (seconds < -kTimeZone))) {
 1002dee:	89 c2                	mov    edx,eax
 1002df0:	f7 da                	neg    edx
 1002df2:	39 d1                	cmp    ecx,edx
 1002df4:	7d 04                	jge    1002dfa <mktime+0x468>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:219
          overflow|=16;
 1002df6:	83 0c 24 10          	or     DWORD PTR [esp],0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:221
  }
  seconds += kTimeZone;
 1002dfa:	01 c1                	add    ecx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:224

  if (tmbuf->tm_isdst) {
    dst = _dstbias;
 1002dfc:	83 7b 20 00          	cmp    DWORD PTR [ebx+0x20],0x0
 1002e00:	ba 00 00 00 00       	mov    edx,0x0
 1002e05:	0f 45 15 2c 04 00 02 	cmovne edx,DWORD PTR ds:0x200042c
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:229
  } else {
    dst = 0;
  }

  if (dst > seconds) overflow|=32;        // dst is always non-negative
 1002e0c:	8b 1c 24             	mov    ebx,DWORD PTR [esp]
 1002e0f:	89 d8                	mov    eax,ebx
 1002e11:	83 c8 20             	or     eax,0x20
 1002e14:	39 ca                	cmp    edx,ecx
 1002e16:	0f 4e c3             	cmovle eax,ebx
 1002e19:	89 c7                	mov    edi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:232
  seconds -= dst;

  if (overflow) return (time_t) overflow-2;
 1002e1b:	89 f8                	mov    eax,edi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:235

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
 1002e1d:	29 d1                	sub    ecx,edx
 1002e1f:	83 e8 02             	sub    eax,0x2
 1002e22:	85 ff                	test   edi,edi
 1002e24:	0f 44 c1             	cmove  eax,ecx
 1002e27:	eb 62                	jmp    1002e8b <mktime+0x4f9>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:180
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
  year = EPOCH_YR;
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
 1002e29:	b8 19 fc ff ff       	mov    eax,0xfffffc19
 1002e2e:	eb 5b                	jmp    1002e8b <mktime+0x4f9>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002e30:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e33:	3b 2c 8d 00 40 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1004000]
 1002e3a:	0f 8d f8 fc ff ff    	jge    1002b38 <mktime+0x1a6>
 1002e40:	e9 84 fd ff ff       	jmp    1002bc9 <mktime+0x237>
 1002e45:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e48:	3b 2c 8d 00 40 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1004000]
 1002e4f:	0f 8d a5 fc ff ff    	jge    1002afa <mktime+0x168>
 1002e55:	e9 6f fd ff ff       	jmp    1002bc9 <mktime+0x237>
 1002e5a:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e5d:	3b 2c 8d 30 40 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1004030]
 1002e64:	0f 8d dc fc ff ff    	jge    1002b46 <mktime+0x1b4>
 1002e6a:	e9 5a fd ff ff       	jmp    1002bc9 <mktime+0x237>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:172
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
 1002e6f:	8d be 6c 07 00 00    	lea    edi,[esi+0x76c]
 1002e75:	e9 9e fc ff ff       	jmp    1002b18 <mktime+0x186>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
 1002e7a:	8b 4b 10             	mov    ecx,DWORD PTR [ebx+0x10]
 1002e7d:	3b 2c 8d 30 40 00 01 	cmp    ebp,DWORD PTR [ecx*4+0x1004030]
 1002e84:	7d e9                	jge    1002e6f <mktime+0x4dd>
 1002e86:	e9 3e fd ff ff       	jmp    1002bc9 <mktime+0x237>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:236

  if (overflow) return (time_t) overflow-2;

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
}
 1002e8b:	83 c4 20             	add    esp,0x20
 1002e8e:	5b                   	pop    ebx
 1002e8f:	5e                   	pop    esi
 1002e90:	5f                   	pop    edi
 1002e91:	5d                   	pop    ebp
 1002e92:	c3                   	ret    

01002e93 <_strdate>:
_strdate():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:241

#if !defined(KERNEL) && !defined(OS_LIB)


char *_strdate(char *s) {
 1002e93:	83 ec 10             	sub    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:244
  time_t now;

  time(&now);
 1002e96:	8d 44 24 0c          	lea    eax,[esp+0xc]
 1002e9a:	50                   	push   eax
 1002e9b:	e8 1c f8 ff ff       	call   10026bc <time>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:248
  //fix me!
  //  strftime(s, 9, "%D", localtime(&now));
  return s;
}
 1002ea0:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002ea4:	83 c4 14             	add    esp,0x14
 1002ea7:	c3                   	ret    

01002ea8 <_strtime>:
_strtime():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:250

char *_strtime(char *s) {
 1002ea8:	83 ec 10             	sub    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:253
  time_t now;

  time(&now);
 1002eab:	8d 44 24 0c          	lea    eax,[esp+0xc]
 1002eaf:	50                   	push   eax
 1002eb0:	e8 07 f8 ff ff       	call   10026bc <time>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:257
  //fix me
  //  strftime(s, 9, "%T", localtime(&now));
  return s;
}
 1002eb5:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 1002eb9:	83 c4 14             	add    esp,0x14
 1002ebc:	c3                   	ret    

01002ebd <waitTicks>:
waitTicks():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:260

void __attribute__((noinline))waitTicks(int TicksToWait)
{
 1002ebd:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:262
    //printf("ttw=%u",ttw);
    if (TicksToWait==0)
 1002ec1:	85 c0                	test   eax,eax
 1002ec3:	74 09                	je     1002ece <waitTicks+0x11>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:267 (discriminator 1)
        return;
    //printd(DEBUG_TIMER,"ttw=%08X", TicksToWait);
    do
    {
        __asm("sti\nhlt\n");
 1002ec5:	fb                   	sti    
 1002ec6:	f4                   	hlt    
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:268 (discriminator 1)
        TicksToWait--;
 1002ec7:	83 e8 01             	sub    eax,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:269 (discriminator 1)
    } while (TicksToWait>0);
 1002eca:	85 c0                	test   eax,eax
 1002ecc:	7f f7                	jg     1002ec5 <waitTicks+0x8>
 1002ece:	f3 c3                	repz ret 

01002ed0 <wait>:
wait():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:274
    return;
}

void /*__attribute__((noinline))*/wait(int msToWait)
{
 1002ed0:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:277
    //printk("msToWait=%u, ticksperms=%u, ticksToWait=%u",msToWait, kTicksPerMS, msToWait*kTicksPerMS);
    //STOPHERE2
    waitTicks(msToWait/kTicksPerMS);
 1002ed4:	99                   	cdq    
 1002ed5:	f7 3d 84 02 00 02    	idiv   DWORD PTR ds:0x2000284
 1002edb:	50                   	push   eax
 1002edc:	e8 dc ff ff ff       	call   1002ebd <waitTicks>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:278
}
 1002ee1:	83 c4 04             	add    esp,0x4
 1002ee4:	c3                   	ret    

01002ee5 <wait3>:
wait3():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:281

void wait3(double msToWait)
{
 1002ee5:	56                   	push   esi
 1002ee6:	53                   	push   ebx
 1002ee7:	83 ec 24             	sub    esp,0x24
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:282
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);
 1002eea:	8b 0d 60 02 00 02    	mov    ecx,DWORD PTR ds:0x2000260
 1002ef0:	8b 19                	mov    ebx,DWORD PTR [ecx]
 1002ef2:	8b 35 80 02 00 02    	mov    esi,DWORD PTR ds:0x2000280
 1002ef8:	dd 44 24 30          	fld    QWORD PTR [esp+0x30]
 1002efc:	b8 e8 03 00 00       	mov    eax,0x3e8
 1002f01:	ba 00 00 00 00       	mov    edx,0x0
 1002f06:	f7 f6                	div    esi
 1002f08:	89 04 24             	mov    DWORD PTR [esp],eax
 1002f0b:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f12:	00 
 1002f13:	df 2c 24             	fild   QWORD PTR [esp]
 1002f16:	de f9                	fdivp  st(1),st
 1002f18:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1002f1b:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f22:	00 
 1002f23:	df 2c 24             	fild   QWORD PTR [esp]
 1002f26:	de c1                	faddp  st(1),st
 1002f28:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002f2c:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002f30:	dd 5c 24 18          	fstp   QWORD PTR [esp+0x18]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:284

while (endTicks > (double)*kTicksSinceStart)
 1002f34:	8b 01                	mov    eax,DWORD PTR [ecx]
 1002f36:	dd 44 24 18          	fld    QWORD PTR [esp+0x18]
 1002f3a:	89 04 24             	mov    DWORD PTR [esp],eax
 1002f3d:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f44:	00 
 1002f45:	df 2c 24             	fild   QWORD PTR [esp]
 1002f48:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002f4c:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002f50:	d9 c9                	fxch   st(1)
 1002f52:	df e9                	fucomip st,st(1)
 1002f54:	dd d8                	fstp   st(0)
 1002f56:	76 26                	jbe    1002f7e <wait3+0x99>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:285
    {__asm__("sti\n hlt\n");}
 1002f58:	fb                   	sti    
 1002f59:	f4                   	hlt    
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:284

void wait3(double msToWait)
{
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);

while (endTicks > (double)*kTicksSinceStart)
 1002f5a:	8b 01                	mov    eax,DWORD PTR [ecx]
 1002f5c:	dd 44 24 18          	fld    QWORD PTR [esp+0x18]
 1002f60:	89 04 24             	mov    DWORD PTR [esp],eax
 1002f63:	c7 44 24 04 00 00 00 	mov    DWORD PTR [esp+0x4],0x0
 1002f6a:	00 
 1002f6b:	df 2c 24             	fild   QWORD PTR [esp]
 1002f6e:	dd 5c 24 08          	fstp   QWORD PTR [esp+0x8]
 1002f72:	dd 44 24 08          	fld    QWORD PTR [esp+0x8]
 1002f76:	d9 c9                	fxch   st(1)
 1002f78:	df e9                	fucomip st,st(1)
 1002f7a:	dd d8                	fstp   st(0)
 1002f7c:	77 da                	ja     1002f58 <wait3+0x73>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:287
    {__asm__("sti\n hlt\n");}
    
}
 1002f7e:	83 c4 24             	add    esp,0x24
 1002f81:	5b                   	pop    ebx
 1002f82:	5e                   	pop    esi
 1002f83:	c3                   	ret    

01002f84 <wait2>:
wait2():
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:290

void wait2(unsigned msToWait)
{
 1002f84:	57                   	push   edi
 1002f85:	56                   	push   esi
 1002f86:	53                   	push   ebx
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:291
    uint64_t startTicks = *kTicksSinceStart;             //25
 1002f87:	8b 1d 60 02 00 02    	mov    ebx,DWORD PTR ds:0x2000260
 1002f8d:	8b 0b                	mov    ecx,DWORD PTR [ebx]
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:292
    unsigned msPerTick = 1000 / kTicksPerSecond;         //18
 1002f8f:	8b 3d 80 02 00 02    	mov    edi,DWORD PTR ds:0x2000280
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:294
    uint64_t totalTicksToWait = msToWait/msPerTick;     //4321/18
    uint64_t endTicks = startTicks + totalTicksToWait;
 1002f95:	b8 e8 03 00 00       	mov    eax,0x3e8
 1002f9a:	ba 00 00 00 00       	mov    edx,0x0
 1002f9f:	f7 f7                	div    edi
 1002fa1:	89 c6                	mov    esi,eax
 1002fa3:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
 1002fa7:	ba 00 00 00 00       	mov    edx,0x0
 1002fac:	f7 f6                	div    esi
 1002fae:	89 c6                	mov    esi,eax
 1002fb0:	bf 00 00 00 00       	mov    edi,0x0
 1002fb5:	89 c8                	mov    eax,ecx
 1002fb7:	ba 00 00 00 00       	mov    edx,0x0
 1002fbc:	01 f0                	add    eax,esi
 1002fbe:	11 fa                	adc    edx,edi
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:296

    if (endTicks < *kTicksSinceStart)
 1002fc0:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 1002fc2:	83 fa 00             	cmp    edx,0x0
 1002fc5:	77 04                	ja     1002fcb <wait2+0x47>
 1002fc7:	39 c8                	cmp    eax,ecx
 1002fc9:	72 17                	jb     1002fe2 <wait2+0x5e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:304
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
 1002fcb:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 1002fcd:	83 fa 00             	cmp    edx,0x0
 1002fd0:	77 04                	ja     1002fd6 <wait2+0x52>
 1002fd2:	39 c8                	cmp    eax,ecx
 1002fd4:	76 0c                	jbe    1002fe2 <wait2+0x5e>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:305
    {__asm__("hlt\n");}
 1002fd6:	f4                   	hlt    
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:304
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
 1002fd7:	8b 0b                	mov    ecx,DWORD PTR [ebx]
 1002fd9:	83 fa 00             	cmp    edx,0x0
 1002fdc:	77 f8                	ja     1002fd6 <wait2+0x52>
 1002fde:	39 c8                	cmp    eax,ecx
 1002fe0:	77 f4                	ja     1002fd6 <wait2+0x52>
/home/yogi/NetBeansProjects/chrisOSKernel/../chrisOS/src/time.c:307
    {__asm__("hlt\n");}
    //printf("done waiting!\n");
}
 1002fe2:	5b                   	pop    ebx
 1002fe3:	5e                   	pop    esi
 1002fe4:	5f                   	pop    edi
 1002fe5:	c3                   	ret    
 1002fe6:	66 90                	xchg   ax,ax

01002fe8 <kbd_handler_generic>:
kbd_handler_generic():
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:38
    kbd_handler_generic();
    return;
}

void kbd_handler_generic()
{
 1002fe8:	53                   	push   ebx
 1002fe9:	83 ec 08             	sub    esp,0x8
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1002fec:	e4 60                	in     al,0x60
kbd_handler_generic():
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:44
    unsigned char lKeyControlVal=0;
    unsigned char rawKey=0;
    unsigned char translatedKeypress=0;
   
    rawKey = inb(KEYB_DATA_PORT);
    kKeyChar = rawKey;//& 0x80;
 1002fee:	a2 6c 2a 01 01       	mov    ds:0x1012a6c,al
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:46

    __asm__("cli\n");
 1002ff3:	fa                   	cli    
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:48
    
    switch(rawKey)  
 1002ff4:	3c 9d                	cmp    al,0x9d
 1002ff6:	74 44                	je     100303c <kbd_handler_generic+0x54>
 1002ff8:	3c 9d                	cmp    al,0x9d
 1002ffa:	77 0e                	ja     100300a <kbd_handler_generic+0x22>
 1002ffc:	3c 2a                	cmp    al,0x2a
 1002ffe:	74 18                	je     1003018 <kbd_handler_generic+0x30>
 1003000:	3c 38                	cmp    al,0x38
 1003002:	74 44                	je     1003048 <kbd_handler_generic+0x60>
 1003004:	3c 1d                	cmp    al,0x1d
 1003006:	75 6e                	jne    1003076 <kbd_handler_generic+0x8e>
 1003008:	eb 26                	jmp    1003030 <kbd_handler_generic+0x48>
 100300a:	3c b8                	cmp    al,0xb8
 100300c:	74 46                	je     1003054 <kbd_handler_generic+0x6c>
 100300e:	3c ba                	cmp    al,0xba
 1003010:	74 4e                	je     1003060 <kbd_handler_generic+0x78>
 1003012:	3c aa                	cmp    al,0xaa
 1003014:	75 60                	jne    1003076 <kbd_handler_generic+0x8e>
 1003016:	eb 0c                	jmp    1003024 <kbd_handler_generic+0x3c>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:50
    {
        case KEY_SHIFT_DN: kKeyStatus[INDEX_SHIFT]=1;break;
 1003018:	c6 05 48 2a 01 01 01 	mov    BYTE PTR ds:0x1012a48,0x1
 100301f:	e9 94 01 00 00       	jmp    10031b8 <kbd_handler_generic+0x1d0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:51
        case KEY_SHIFT_UP: kKeyStatus[INDEX_SHIFT]=0;break;
 1003024:	c6 05 48 2a 01 01 00 	mov    BYTE PTR ds:0x1012a48,0x0
 100302b:	e9 88 01 00 00       	jmp    10031b8 <kbd_handler_generic+0x1d0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:52
        case KEY_CTRL_DN: kKeyStatus[INDEX_CTRL]=1;break;
 1003030:	c6 05 49 2a 01 01 01 	mov    BYTE PTR ds:0x1012a49,0x1
 1003037:	e9 7c 01 00 00       	jmp    10031b8 <kbd_handler_generic+0x1d0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:53
        case KEY_CTRL_UP: kKeyStatus[INDEX_CTRL]=0;break;
 100303c:	c6 05 49 2a 01 01 00 	mov    BYTE PTR ds:0x1012a49,0x0
 1003043:	e9 70 01 00 00       	jmp    10031b8 <kbd_handler_generic+0x1d0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:54
        case KEY_ALT_DN: kKeyStatus[INDEX_ALT]=1;break;
 1003048:	c6 05 4a 2a 01 01 01 	mov    BYTE PTR ds:0x1012a4a,0x1
 100304f:	e9 64 01 00 00       	jmp    10031b8 <kbd_handler_generic+0x1d0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:55
        case KEY_ALT_UP: kKeyStatus[INDEX_ALT]=0;break;
 1003054:	c6 05 4a 2a 01 01 00 	mov    BYTE PTR ds:0x1012a4a,0x0
 100305b:	e9 58 01 00 00       	jmp    10031b8 <kbd_handler_generic+0x1d0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:56
        case KEY_CAPSLOCK_UP: kKeyStatus[INDEX_CAPSLOCK]=!kKeyStatus[INDEX_CAPSLOCK];break;
 1003060:	0f b6 05 4b 2a 01 01 	movzx  eax,BYTE PTR ds:0x1012a4b
 1003067:	84 c0                	test   al,al
 1003069:	0f 94 c0             	sete   al
 100306c:	a2 4b 2a 01 01       	mov    ds:0x1012a4b,al
 1003071:	e9 42 01 00 00       	jmp    10031b8 <kbd_handler_generic+0x1d0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:64
//        case MAKE_UP: kKeyStatus[INDEX_UP]=0;break;
//        case MAKE_DOWN: kKeyStatus[INDEX_DOWN]=0;break;
       default:
//printk("%02X",rawKey);
           //changed from if rawkey & 0x80, so that keydown triggers the key being input
           if (rawKey==BREAK_RIGHT || rawKey==BREAK_LEFT || rawKey==BREAK_UP || rawKey==BREAK_DOWN)
 1003076:	8d 50 35             	lea    edx,[eax+0x35]
 1003079:	f6 c2 fd             	test   dl,0xfd
 100307c:	74 08                	je     1003086 <kbd_handler_generic+0x9e>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:64 (discriminator 1)
 100307e:	8d 50 38             	lea    edx,[eax+0x38]
 1003081:	f6 c2 f7             	test   dl,0xf7
 1003084:	75 24                	jne    10030aa <kbd_handler_generic+0xc2>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:65
               if (kKeyboardBuffer<(char*)KEYBOARD_BUFFER_ADDRESS+KEYBOARD_BUFFER_SIZE && !kKeyStatus[INDEX_ALT])
 1003086:	8b 15 e0 03 00 02    	mov    edx,DWORD PTR ds:0x20003e0
 100308c:	81 fa 3f 33 28 00    	cmp    edx,0x28333f
 1003092:	77 16                	ja     10030aa <kbd_handler_generic+0xc2>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:65 (discriminator 1)
 1003094:	0f b6 0d 4a 2a 01 01 	movzx  ecx,BYTE PTR ds:0x1012a4a
 100309b:	84 c9                	test   cl,cl
 100309d:	75 0b                	jne    10030aa <kbd_handler_generic+0xc2>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:66
                   *kKeyboardBuffer++=rawKey;
 100309f:	8d 4a 01             	lea    ecx,[edx+0x1]
 10030a2:	89 0d e0 03 00 02    	mov    DWORD PTR ds:0x20003e0,ecx
 10030a8:	88 02                	mov    BYTE PTR [edx],al
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:67
           if (!(rawKey & 0x80))
 10030aa:	84 c0                	test   al,al
 10030ac:	0f 88 06 01 00 00    	js     10031b8 <kbd_handler_generic+0x1d0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:71
           {
                //rawKey &= 0x7f;
               //printk("%02X",rawKey); 48=up, 50=down
                 if (kKeyStatus[INDEX_SHIFT] || kKeyStatus[INDEX_CAPSLOCK])
 10030b2:	0f b6 15 48 2a 01 01 	movzx  edx,BYTE PTR ds:0x1012a48
 10030b9:	84 d2                	test   dl,dl
 10030bb:	75 0b                	jne    10030c8 <kbd_handler_generic+0xe0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:71 (discriminator 1)
 10030bd:	0f b6 15 4b 2a 01 01 	movzx  edx,BYTE PTR ds:0x1012a4b
 10030c4:	84 d2                	test   dl,dl
 10030c6:	74 0c                	je     10030d4 <kbd_handler_generic+0xec>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:73
                 {
                     translatedKeypress=keyboard_map_up[rawKey];
 10030c8:	0f b6 c0             	movzx  eax,al
 10030cb:	0f b6 98 60 40 00 01 	movzx  ebx,BYTE PTR [eax+0x1004060]
 10030d2:	eb 0a                	jmp    10030de <kbd_handler_generic+0xf6>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:76
                 }
                 else
                     translatedKeypress=keyboard_map[rawKey];
 10030d4:	0f b6 c0             	movzx  eax,al
 10030d7:	0f b6 98 e0 40 00 01 	movzx  ebx,BYTE PTR [eax+0x10040e0]
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:83
//                 if ((kDebugLevel & DEBUG_KEYBOARD) == DEBUG_KEYBOARD)
//                 {
//                      printf("%u, %u, %c\n",kKeyChar, rawKey, translatedKeypress);
//                 }
#endif
                if (kKeyStatus[INDEX_CTRL])
 10030de:	0f b6 05 49 2a 01 01 	movzx  eax,BYTE PTR ds:0x1012a49
 10030e5:	84 c0                	test   al,al
 10030e7:	74 13                	je     10030fc <kbd_handler_generic+0x114>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:85
                {
                    printk("^");
 10030e9:	83 ec 0c             	sub    esp,0xc
 10030ec:	68 ec 63 00 01       	push   0x10063ec
 10030f1:	e8 31 f4 ff ff       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:86
                    translatedKeypress-=32;
 10030f6:	83 eb 20             	sub    ebx,0x20
 10030f9:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:89
                }
                //Debug
                if (kKeyStatus[INDEX_ALT] && translatedKeypress==0x6A)
 10030fc:	0f b6 05 4a 2a 01 01 	movzx  eax,BYTE PTR ds:0x1012a4a
 1003103:	80 fb 6a             	cmp    bl,0x6a
 1003106:	75 05                	jne    100310d <kbd_handler_generic+0x125>
 1003108:	84 c0                	test   al,al
 100310a:	74 01                	je     100310d <kbd_handler_generic+0x125>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:91
                {
                    __asm("int 0x3");
 100310c:	cc                   	int3   
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:93
                }
            if (kKeyStatus[INDEX_ALT] && kKeyStatus[INDEX_CTRL] && translatedKeypress==0xE0)
 100310d:	0f b6 05 4a 2a 01 01 	movzx  eax,BYTE PTR ds:0x1012a4a
 1003114:	84 c0                	test   al,al
 1003116:	74 2f                	je     1003147 <kbd_handler_generic+0x15f>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:93 (discriminator 1)
 1003118:	0f b6 05 49 2a 01 01 	movzx  eax,BYTE PTR ds:0x1012a49
 100311f:	80 fb e0             	cmp    bl,0xe0
 1003122:	75 23                	jne    1003147 <kbd_handler_generic+0x15f>
 1003124:	84 c0                	test   al,al
 1003126:	74 1f                	je     1003147 <kbd_handler_generic+0x15f>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:96
            {
                translatedKeypress=0;
                reboot(false);
 1003128:	83 ec 0c             	sub    esp,0xc
 100312b:	6a 00                	push   0x0
 100312d:	e8 9d eb ff ff       	call   1001ccf <reboot>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:98
            }
            if (kKeyStatus[INDEX_ALT])
 1003132:	0f b6 05 4a 2a 01 01 	movzx  eax,BYTE PTR ds:0x1012a4a
 1003139:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:95
                {
                    __asm("int 0x3");
                }
            if (kKeyStatus[INDEX_ALT] && kKeyStatus[INDEX_CTRL] && translatedKeypress==0xE0)
            {
                translatedKeypress=0;
 100313c:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:98
                reboot(false);
            }
            if (kKeyStatus[INDEX_ALT])
 1003141:	84 c0                	test   al,al
 1003143:	75 69                	jne    10031ae <kbd_handler_generic+0x1c6>
 1003145:	eb 71                	jmp    10031b8 <kbd_handler_generic+0x1d0>
 1003147:	0f b6 05 4a 2a 01 01 	movzx  eax,BYTE PTR ds:0x1012a4a
 100314e:	84 c0                	test   al,al
 1003150:	74 66                	je     10031b8 <kbd_handler_generic+0x1d0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:100
            {
                if (translatedKeypress=='c')
 1003152:	80 fb 63             	cmp    bl,0x63
 1003155:	75 4b                	jne    10031a2 <kbd_handler_generic+0x1ba>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:102
                {
                    printk("%u",*kTicksSinceStart);
 1003157:	a1 60 02 00 02       	mov    eax,ds:0x2000260
 100315c:	8b 00                	mov    eax,DWORD PTR [eax]
 100315e:	83 ec 08             	sub    esp,0x8
 1003161:	50                   	push   eax
 1003162:	68 ee 63 00 01       	push   0x10063ee
 1003167:	e8 bb f3 ff ff       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:103
                    printk("-%c-%04X:%08X",(exceptionFlags & 0x200)==0x200?'I':'i',exceptionCS, exceptionEIP);
 100316c:	8b 0d f8 01 00 02    	mov    ecx,DWORD PTR ds:0x20001f8
 1003172:	8b 15 fc 01 00 02    	mov    edx,DWORD PTR ds:0x20001fc
 1003178:	a1 f0 01 00 02       	mov    eax,ds:0x20001f0
 100317d:	83 c4 10             	add    esp,0x10
 1003180:	25 00 02 00 00       	and    eax,0x200
 1003185:	83 f8 01             	cmp    eax,0x1
 1003188:	19 c0                	sbb    eax,eax
 100318a:	83 e0 20             	and    eax,0x20
 100318d:	83 c0 49             	add    eax,0x49
 1003190:	51                   	push   ecx
 1003191:	52                   	push   edx
 1003192:	50                   	push   eax
 1003193:	68 f1 63 00 01       	push   0x10063f1
 1003198:	e8 8a f3 ff ff       	call   1002527 <printk>
 100319d:	83 c4 10             	add    esp,0x10
 10031a0:	eb 16                	jmp    10031b8 <kbd_handler_generic+0x1d0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:116
                    printk("The time is currently %s", &currTime);
                    cursorMoveTo(65,SYS_VGA_HEIGHT-1);
                    printk("ticks=%d", *kTicksSinceStart);
                    cursorRestorePosition();
                }
*/                if (translatedKeypress=='d')
 10031a2:	80 fb 64             	cmp    bl,0x64
 10031a5:	75 07                	jne    10031ae <kbd_handler_generic+0x1c6>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:118
                {
                    printDumpedRegs();
 10031a7:	e8 8a e8 ff ff       	call   1001a36 <printDumpedRegs>
 10031ac:	eb 0a                	jmp    10031b8 <kbd_handler_generic+0x1d0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:120
                }
                if (translatedKeypress=='e')
 10031ae:	80 fb 65             	cmp    bl,0x65
 10031b1:	75 05                	jne    10031b8 <kbd_handler_generic+0x1d0>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:122
                {
                    dumpKernelAddresses();
 10031b3:	e8 58 eb ff ff       	call   1001d10 <dumpKernelAddresses>
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 10031b8:	e4 61                	in     al,0x61
 10031ba:	89 c2                	mov    edx,eax
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10031bc:	83 c8 82             	or     eax,0xffffff82
 10031bf:	e6 61                	out    0x61,al
 10031c1:	89 d0                	mov    eax,edx
 10031c3:	83 e0 7f             	and    eax,0x7f
 10031c6:	83 c8 02             	or     eax,0x2
 10031c9:	e6 61                	out    0x61,al
kbd_handler_generic():
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:135
    lKeyControlVal |= 0x82;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    lKeyControlVal &= 0x7f;
    outb(KEYB_CTRL_PORT, lKeyControlVal);
    return;
}
 10031cb:	83 c4 08             	add    esp,0x8
 10031ce:	5b                   	pop    ebx
 10031cf:	c3                   	ret    

010031d0 <ih_keyboard_generic>:
ih_keyboard_generic():
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:32
extern volatile uint32_t exceptionSavedESP;
extern volatile uint32_t* kTicksSinceStart;

__attribute__ ((interrupt))
void ih_keyboard_generic(struct interrupt_frame *frame)
{
 10031d0:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:33
    kbd_handler_generic();
 10031d3:	e8 10 fe ff ff       	call   1002fe8 <kbd_handler_generic>
/home/yogi/NetBeansProjects/chrisOSKernel/src/drivers/drv_genKeyboard.c:35
    return;
}
 10031d8:	83 c4 0c             	add    esp,0xc
 10031db:	c3                   	ret    

010031dc <main>:
main():
/home/yogi/NetBeansProjects/chrisOSKernel/src/kernel.c:22


/*
 * 
 */
int main(int argc, char** argv) {
 10031dc:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 10031e0:	83 e4 f0             	and    esp,0xfffffff0
 10031e3:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 10031e6:	55                   	push   ebp
 10031e7:	89 e5                	mov    ebp,esp
 10031e9:	57                   	push   edi
 10031ea:	56                   	push   esi
 10031eb:	53                   	push   ebx
 10031ec:	51                   	push   ecx
 10031ed:	83 ec 14             	sub    esp,0x14
 10031f0:	8b 31                	mov    esi,DWORD PTR [ecx]
 10031f2:	8b 79 04             	mov    edi,DWORD PTR [ecx+0x4]
/home/yogi/NetBeansProjects/chrisOSKernel/src/kernel.c:25
   
    //terminal_clear();
    printk("\nkernel loaded ... \n");
 10031f5:	68 ff 63 00 01       	push   0x10063ff
 10031fa:	e8 28 f3 ff ff       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/src/kernel.c:27
    
    printk("Param count=%u\n",argc);
 10031ff:	83 c4 08             	add    esp,0x8
 1003202:	56                   	push   esi
 1003203:	68 14 64 00 01       	push   0x1006414
 1003208:	e8 1a f3 ff ff       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/src/kernel.c:28
    for (int cnt=0;cnt<argc;cnt++)
 100320d:	83 c4 10             	add    esp,0x10
 1003210:	85 f6                	test   esi,esi
 1003212:	7e 20                	jle    1003234 <main+0x58>
 1003214:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/src/kernel.c:30 (discriminator 3)
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
 1003219:	83 ec 04             	sub    esp,0x4
 100321c:	ff 34 9f             	push   DWORD PTR [edi+ebx*4]
 100321f:	53                   	push   ebx
 1003220:	68 24 64 00 01       	push   0x1006424
 1003225:	e8 fd f2 ff ff       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/src/kernel.c:28 (discriminator 3)
   
    //terminal_clear();
    printk("\nkernel loaded ... \n");
    
    printk("Param count=%u\n",argc);
    for (int cnt=0;cnt<argc;cnt++)
 100322a:	83 c3 01             	add    ebx,0x1
 100322d:	83 c4 10             	add    esp,0x10
 1003230:	39 de                	cmp    esi,ebx
 1003232:	75 e5                	jne    1003219 <main+0x3d>
/home/yogi/NetBeansProjects/chrisOSKernel/src/kernel.c:34
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
        //if (cnt>5)
        //    break;
    }
    mmInit();
 1003234:	e8 b7 00 00 00       	call   10032f0 <mmInit>
/home/yogi/NetBeansProjects/chrisOSKernel/src/kernel.c:37
    
    return (0xbad);
}
 1003239:	b8 ad 0b 00 00       	mov    eax,0xbad
 100323e:	8d 65 f0             	lea    esp,[ebp-0x10]
 1003241:	59                   	pop    ecx
 1003242:	5b                   	pop    ebx
 1003243:	5e                   	pop    esi
 1003244:	5f                   	pop    edi
 1003245:	5d                   	pop    ebp
 1003246:	8d 61 fc             	lea    esp,[ecx-0x4]
 1003249:	c3                   	ret    
 100324a:	66 90                	xchg   ax,ax

0100324c <malloc>:
malloc():
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:12
#define CURRENT_CR3 ({uint32_t cr3Val; \
                      __asm__("mov eax,cr3\n mov %[cr3Val],eax\n":[cr3Val] "=r" (cr3Val));\
                      cr3Val;})

uintptr_t* malloc(uint32_t size)
{
 100324c:	53                   	push   ebx
 100324d:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:13
    uint32_t lRetVal = kMallocCurrAddress;
 1003250:	8b 1d f8 04 00 02    	mov    ebx,DWORD PTR ds:0x20004f8
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:14
    printd(DEBUG_MEMORY_MANAGEMENT,"malloc: Using heap address 0x%08X\n",lRetVal);
 1003256:	53                   	push   ebx
 1003257:	68 00 71 00 01       	push   0x1007100
 100325c:	68 00 00 01 00       	push   0x10000
 1003261:	e8 d9 f2 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:15
    pagingMapPage(CURRENT_CR3,lRetVal,lRetVal,0x03);
 1003266:	0f 20 d8             	mov    eax,cr3
 1003269:	89 c0                	mov    eax,eax
 100326b:	6a 03                	push   0x3
 100326d:	53                   	push   ebx
 100326e:	53                   	push   ebx
 100326f:	50                   	push   eax
 1003270:	e8 c3 04 00 00       	call   1003738 <pagingMapPage>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:16
    printd(DEBUG_MEMORY_MANAGEMENT,"Mapped 0x%08X with attribs 0x03\n",lRetVal);
 1003275:	83 c4 1c             	add    esp,0x1c
 1003278:	53                   	push   ebx
 1003279:	68 24 71 00 01       	push   0x1007124
 100327e:	68 00 00 01 00       	push   0x10000
 1003283:	e8 b7 f2 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:17
    kMallocCurrAddress+=size;   
 1003288:	8b 44 24 20          	mov    eax,DWORD PTR [esp+0x20]
 100328c:	03 05 f8 04 00 02    	add    eax,DWORD PTR ds:0x20004f8
 1003292:	a3 f8 04 00 02       	mov    ds:0x20004f8,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:18
    printd(DEBUG_MEMORY_MANAGEMENT,"Updated current malloc address to 0x%08X\n",kMallocCurrAddress);
 1003297:	83 c4 0c             	add    esp,0xc
 100329a:	50                   	push   eax
 100329b:	68 48 71 00 01       	push   0x1007148
 10032a0:	68 00 00 01 00       	push   0x10000
 10032a5:	e8 95 f2 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:20
    return lRetVal;
}
 10032aa:	89 d8                	mov    eax,ebx
 10032ac:	83 c4 18             	add    esp,0x18
 10032af:	5b                   	pop    ebx
 10032b0:	c3                   	ret    

010032b1 <mallocA1k>:
mallocA1k():
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:23

uintptr_t* mallocA1k(uint32_t size)
{
 10032b1:	53                   	push   ebx
 10032b2:	83 ec 14             	sub    esp,0x14
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:26
    uint32_t lRetVal;
    //printd(DEBUG_MEMORY_MANAGEMENT,"mallocA: Aligned kMallocCurrAddress from 0x%08X to ",kMallocCurrAddress);
    kMallocCurrAddress=(kMallocCurrAddress+0x1000) & (0xFFFFF000);
 10032b5:	a1 f8 04 00 02       	mov    eax,ds:0x20004f8
 10032ba:	05 00 10 00 00       	add    eax,0x1000
 10032bf:	25 00 f0 ff ff       	and    eax,0xfffff000
 10032c4:	a3 f8 04 00 02       	mov    ds:0x20004f8,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:29
    //printd(DEBUG_MEMORY_MANAGEMENT,"0x%08X\n",kMallocCurrAddress);
    
    lRetVal=malloc(size);
 10032c9:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 10032cd:	e8 7a ff ff ff       	call   100324c <malloc>
 10032d2:	89 c3                	mov    ebx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:30
    printd(DEBUG_MEMORY_MANAGEMENT,"mallocA: Returning address 0x%08X\n",lRetVal);
 10032d4:	83 c4 0c             	add    esp,0xc
 10032d7:	50                   	push   eax
 10032d8:	68 74 71 00 01       	push   0x1007174
 10032dd:	68 00 00 01 00       	push   0x10000
 10032e2:	e8 58 f2 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:32
    return lRetVal;
}
 10032e7:	89 d8                	mov    eax,ebx
 10032e9:	83 c4 18             	add    esp,0x18
 10032ec:	5b                   	pop    ebx
 10032ed:	c3                   	ret    

010032ee <kmalloc>:
kmalloc():
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/alloc.c:40
//NOTE: bits 9-11 of a page-table entry are available.  Bit 11 will be used as an "in use" indicator.
//That way we can quickly scan the page tables for non-used entries, rather than keep a table of tables
uintptr_t kmalloc()
{
    
 10032ee:	f3 c3                	repz ret 

010032f0 <mmInit>:
mmInit():
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:26
        kMallocBaseAddress,kMallocCurrAddress;

uint32_t* kmmMemBlockData;

void mmInit()
{
 10032f0:	53                   	push   ebx
 10032f1:	83 ec 08             	sub    esp,0x8
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:28
    //0x10000000 represents segment 0xC0000000-0xCFFFFFFF ... don't want to map anything there for now
    kmmGrossMemoryAvailable=(kE820MemoryBytes - (KERNEL_DATA_LOAD_ADDRESS+0x100000)) & 0xFFFFF000;
 10032f4:	8b 0d 48 00 00 02    	mov    ecx,DWORD PTR ds:0x2000048
 10032fa:	8b 1d 4c 00 00 02    	mov    ebx,DWORD PTR ds:0x200004c
 1003300:	8d 81 00 00 f0 fd    	lea    eax,[ecx-0x2100000]
 1003306:	25 00 f0 ff ff       	and    eax,0xfffff000
 100330b:	a3 10 05 00 02       	mov    ds:0x2000510,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:29
    kmmGrossUserMemoryAvailable=kmmGrossMemoryAvailable - (KERNEL_PHYSICAL_EXEC_ADDRESS + 100000);
 1003310:	2d a0 86 01 01       	sub    eax,0x10186a0
 1003315:	a3 00 05 00 02       	mov    ds:0x2000500,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:30
    kmmHeapMemoryTotal=kmmGrossUserMemoryAvailable;
 100331a:	a3 0c 05 00 02       	mov    ds:0x200050c,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:32
    kmmHeapMemoryBaseAddress=kmmGrossMemoryAvailable-kmmHeapMemoryTotal;
    kPagingPageMemoryAddress=kmmHeapMemoryBaseAddress;
 100331f:	c7 05 54 2a 01 01 a0 	mov    DWORD PTR ds:0x1012a54,0x10186a0
 1003326:	86 01 01 
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:33
    kmmHeapMemoryBaseAddress+=(0x1000*0x200); //Need some page table memory but we don't want to use Malloc while creating page tables to get it
 1003329:	c7 05 08 05 00 02 a0 	mov    DWORD PTR ds:0x2000508,0x12186a0
 1003330:	86 21 01 
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:35
    //Setup the base of the heap
    kMallocBaseAddress=kmmHeapMemoryBaseAddress;
 1003333:	c7 05 fc 04 00 02 a0 	mov    DWORD PTR ds:0x20004fc,0x12186a0
 100333a:	86 21 01 
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:36
    kMallocCurrAddress=kMallocBaseAddress;
 100333d:	c7 05 f8 04 00 02 a0 	mov    DWORD PTR ds:0x20004f8,0x12186a0
 1003344:	86 21 01 
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:38
    
    printd(DEBUG_MEMORY_MANAGEMENT,"E820 memory total: %u kb\n", kE820MemoryBytes/1024);
 1003347:	0f ac d9 0a          	shrd   ecx,ebx,0xa
 100334b:	c1 eb 0a             	shr    ebx,0xa
 100334e:	53                   	push   ebx
 100334f:	51                   	push   ecx
 1003350:	68 0c 65 00 01       	push   0x100650c
 1003355:	68 00 00 01 00       	push   0x10000
 100335a:	e8 e0 f1 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:39
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory Available after kernel loaded: %u kb\n", kmmGrossMemoryAvailable/1024);
 100335f:	83 c4 0c             	add    esp,0xc
 1003362:	a1 10 05 00 02       	mov    eax,ds:0x2000510
 1003367:	c1 e8 0a             	shr    eax,0xa
 100336a:	50                   	push   eax
 100336b:	68 98 71 00 01       	push   0x1007198
 1003370:	68 00 00 01 00       	push   0x10000
 1003375:	e8 c5 f1 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:40
    printd(DEBUG_MEMORY_MANAGEMENT,"Memory available to mm: %u kb\n",kmmGrossMemoryAvailable/1024);
 100337a:	83 c4 0c             	add    esp,0xc
 100337d:	a1 10 05 00 02       	mov    eax,ds:0x2000510
 1003382:	c1 e8 0a             	shr    eax,0xa
 1003385:	50                   	push   eax
 1003386:	68 c8 71 00 01       	push   0x10071c8
 100338b:	68 00 00 01 00       	push   0x10000
 1003390:	e8 aa f1 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:41
    printd(DEBUG_MEMORY_MANAGEMENT,"Total memory availabe to user applications: %u kb\n",kmmGrossUserMemoryAvailable/1024);
 1003395:	83 c4 0c             	add    esp,0xc
 1003398:	a1 00 05 00 02       	mov    eax,ds:0x2000500
 100339d:	c1 e8 0a             	shr    eax,0xa
 10033a0:	50                   	push   eax
 10033a1:	68 e8 71 00 01       	push   0x10071e8
 10033a6:	68 00 00 01 00       	push   0x10000
 10033ab:	e8 8f f1 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:42
    printd(DEBUG_MEMORY_MANAGEMENT,"Initializing memory manager\n\n");
 10033b0:	83 c4 08             	add    esp,0x8
 10033b3:	68 26 65 00 01       	push   0x1006526
 10033b8:	68 00 00 01 00       	push   0x10000
 10033bd:	e8 7d f1 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:43
    printd(DEBUG_MEMORY_MANAGEMENT,"Pool\t\tAddress\t\tLength\t\t\n");
 10033c2:	83 c4 08             	add    esp,0x8
 10033c5:	68 44 65 00 01       	push   0x1006544
 10033ca:	68 00 00 01 00       	push   0x10000
 10033cf:	e8 6b f1 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:44
    printd(DEBUG_MEMORY_MANAGEMENT,"Heap\t\t%08X\t\t%08X\n",kmmHeapMemoryBaseAddress,kmmHeapMemoryTotal);
 10033d4:	ff 35 0c 05 00 02    	push   DWORD PTR ds:0x200050c
 10033da:	ff 35 08 05 00 02    	push   DWORD PTR ds:0x2000508
 10033e0:	68 5d 65 00 01       	push   0x100655d
 10033e5:	68 00 00 01 00       	push   0x10000
 10033ea:	e8 50 f1 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:45
    printd(DEBUG_MEMORY_MANAGEMENT,"Paging\t%08X\t\t%08X\n",kPagingPageMemoryAddress,0x1000*200);
 10033ef:	83 c4 20             	add    esp,0x20
 10033f2:	68 00 80 0c 00       	push   0xc8000
 10033f7:	ff 35 54 2a 01 01    	push   DWORD PTR ds:0x1012a54
 10033fd:	68 6f 65 00 01       	push   0x100656f
 1003402:	68 00 00 01 00       	push   0x10000
 1003407:	e8 33 f1 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:51
    //We need to 

    uintptr_t startAddr=0x0;
    uintptr_t endAddr= (KERNEL_DATA_LOAD_ADDRESS+ 0x100000) & 0xFFFFF000;
    //Mark everything from the beginning of memory (0xC0000000) to the end of the kernel objects as in-use
    printd(DEBUG_KERNEL_PAGING,"Setting kernel memory range from 0x%08X-0x%08X as in-use\n",startAddr,endAddr);
 100340c:	68 00 00 10 02       	push   0x2100000
 1003411:	6a 00                	push   0x0
 1003413:	68 1c 72 00 01       	push   0x100721c
 1003418:	68 00 80 00 00       	push   0x8000
 100341d:	e8 1d f1 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:52
    mmKernelSetPageRangeInUseFlag(startAddr,
 1003422:	83 c4 20             	add    esp,0x20
 1003425:	6a 01                	push   0x1
 1003427:	68 00 10 00 00       	push   0x1000
 100342c:	68 01 00 10 02       	push   0x2100001
 1003431:	6a 00                	push   0x0
 1003433:	e8 6f e2 ff ff       	call   10016a7 <mmKernelSetPageRangeInUseFlag>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:58
            endAddr+1,
            0x1000, /*page size*/
            true);
    startAddr+=0xc0000000;
    endAddr+=0xc0000000;
    printd(DEBUG_KERNEL_PAGING,"Setting kernel memory range from 0x%08X-0x%08X as in-use\n",startAddr,endAddr);
 1003438:	68 00 00 10 c2       	push   0xc2100000
 100343d:	68 00 00 00 c0       	push   0xc0000000
 1003442:	68 1c 72 00 01       	push   0x100721c
 1003447:	68 00 80 00 00       	push   0x8000
 100344c:	e8 ee f0 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:59
    mmKernelSetPageRangeInUseFlag(startAddr,
 1003451:	83 c4 20             	add    esp,0x20
 1003454:	6a 01                	push   0x1
 1003456:	68 00 10 00 00       	push   0x1000
 100345b:	68 01 00 10 c2       	push   0xc2100001
 1003460:	68 00 00 00 c0       	push   0xc0000000
 1003465:	e8 3d e2 ff ff       	call   10016a7 <mmKernelSetPageRangeInUseFlag>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:65
            endAddr+1,
            0x1000, /*page size*/
            true);

    startAddr=(KERNEL_PHYSICAL_EXEC_ADDRESS+0x100000); //2nd 100000 is for the kernel run space
    printd(DEBUG_KERNEL_PAGING,"Setting kernel range 0x%08X-0x%08X not present ",startAddr,0x9FFFFFFF);
 100346a:	68 ff ff ff 9f       	push   0x9fffffff
 100346f:	68 00 00 10 01       	push   0x1100000
 1003474:	68 58 72 00 01       	push   0x1007258
 1003479:	68 00 80 00 00       	push   0x8000
 100347e:	e8 bc f0 ff ff       	call   100253f <printd>
 1003483:	83 c4 20             	add    esp,0x20
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:66
    for (uintptr_t cnt=startAddr;cnt<=0x9FFFFFFF;cnt+=0x1000)
 1003486:	bb 00 00 10 01       	mov    ebx,0x1100000
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:68
    {
        if (cnt<0xC0000000 || cnt>0xCFFFFFFF)
 100348b:	8d 83 00 00 00 40    	lea    eax,[ebx+0x40000000]
 1003491:	3d ff ff ff 0f       	cmp    eax,0xfffffff
 1003496:	76 26                	jbe    10034be <mmInit+0x1ce>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:70
        {
            kpagingUpdatePresentFlagA(cnt,false);
 1003498:	83 ec 08             	sub    esp,0x8
 100349b:	6a 00                	push   0x0
 100349d:	53                   	push   ebx
 100349e:	e8 1a df ff ff       	call   10013bd <kpagingUpdatePresentFlagA>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:71
            if (cnt%0x10000000==0)
 10034a3:	83 c4 10             	add    esp,0x10
 10034a6:	f7 c3 ff ff ff 0f    	test   ebx,0xfffffff
 10034ac:	75 10                	jne    10034be <mmInit+0x1ce>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:74
            {
//                printk("0x%08X-0x%08X\n",cnt,kPagingGet4kPTEntryValue(cnt));
                printk(".");
 10034ae:	83 ec 0c             	sub    esp,0xc
 10034b1:	68 82 65 00 01       	push   0x1006582
 10034b6:	e8 6c f0 ff ff       	call   1002527 <printk>
 10034bb:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:66 (discriminator 2)
            0x1000, /*page size*/
            true);

    startAddr=(KERNEL_PHYSICAL_EXEC_ADDRESS+0x100000); //2nd 100000 is for the kernel run space
    printd(DEBUG_KERNEL_PAGING,"Setting kernel range 0x%08X-0x%08X not present ",startAddr,0x9FFFFFFF);
    for (uintptr_t cnt=startAddr;cnt<=0x9FFFFFFF;cnt+=0x1000)
 10034be:	81 c3 00 10 00 00    	add    ebx,0x1000
 10034c4:	81 fb 00 00 00 a0    	cmp    ebx,0xa0000000
 10034ca:	75 bf                	jne    100348b <mmInit+0x19b>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:79
                printk(".");
//                cursorMoveTo(0,cursorGetPosY()-1);
            }
        }
    }
    printk("\n");
 10034cc:	83 ec 0c             	sub    esp,0xc
 10034cf:	68 5b 65 00 01       	push   0x100655b
 10034d4:	e8 4e f0 ff ff       	call   1002527 <printk>
/home/yogi/NetBeansProjects/chrisOSKernel/src/mm/mm.c:84
    return;
    
//    for (int cnt=KERNEL_VIRTUAL_EXEC_ADDRESS;cnt<KERNEL_VIRTUAL_EXEC_ADDRESS+0x10000000;cnt+=4096)
//        pagingMapPage
}
 10034d9:	83 c4 18             	add    esp,0x18
 10034dc:	5b                   	pop    ebx
 10034dd:	c3                   	ret    
 10034de:	66 90                	xchg   ax,ax

010034e0 <pagingAllocatePagingTablePage>:
pagingAllocatePagingTablePage():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:24
#define PAGE_SIZE 0x1000

uint32_t pagingAllocatePagingTablePage()
{
    uint32_t lRetVal = kPagingPageMemoryAddress;
    kPagingPageMemoryAddress+=0x1000;
 10034e0:	81 05 54 2a 01 01 00 	add    DWORD PTR ds:0x1012a54,0x1000
 10034e7:	10 00 00 
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:25
}
 10034ea:	c3                   	ret    

010034eb <pagingGet4kPDEntryValue>:
pagingGet4kPDEntryValue():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:28

uint32_t pagingGet4kPDEntryValue(uintptr_t pageDirAddress, uint32_t address)
{
 10034eb:	53                   	push   ebx
 10034ec:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:30
    address&=0xFFFFF000;
    uintptr_t* lTemp=(uint32_t*)((pageDirAddress + (((address & 0xFFC00000) >> 22) << 2)));
 10034ef:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
 10034f3:	c1 eb 16             	shr    ebx,0x16
 10034f6:	c1 e3 02             	shl    ebx,0x2
 10034f9:	03 5c 24 14          	add    ebx,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:31
    printd(DEBUG_PAGING,"pagingGet4kPDEntryValue: dirAddressPtr=0x%08x\n", *lTemp);
 10034fd:	ff 33                	push   DWORD PTR [ebx]
 10034ff:	68 dc 68 00 01       	push   0x10068dc
 1003504:	6a 40                	push   0x40
 1003506:	e8 34 f0 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:32
    return (uint32_t)*lTemp;
 100350b:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:33
}
 100350d:	83 c4 18             	add    esp,0x18
 1003510:	5b                   	pop    ebx
 1003511:	c3                   	ret    

01003512 <pagingGet4kPDEntryAddress>:
pagingGet4kPDEntryAddress():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:36

uint32_t pagingGet4kPDEntryAddress(uintptr_t pageDirAddress, uint32_t address)
{
 1003512:	53                   	push   ebx
 1003513:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:38
    address&=0xFFFFF000;
    uintptr_t lTemp=((pageDirAddress  | (((address & 0xFFC00000) >> 22) << 2)));
 1003516:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
 100351a:	c1 eb 16             	shr    ebx,0x16
 100351d:	c1 e3 02             	shl    ebx,0x2
 1003520:	0b 5c 24 14          	or     ebx,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:39
    printd(DEBUG_PAGING,"dirEntryAddress=0x%08x\n", lTemp);
 1003524:	53                   	push   ebx
 1003525:	68 32 62 00 01       	push   0x1006232
 100352a:	6a 40                	push   0x40
 100352c:	e8 0e f0 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:41
    return (uint32_t)lTemp & 0xFFFFFFFF;
}
 1003531:	89 d8                	mov    eax,ebx
 1003533:	83 c4 18             	add    esp,0x18
 1003536:	5b                   	pop    ebx
 1003537:	c3                   	ret    

01003538 <pagingGet4kPTEntryAddress>:
pagingGet4kPTEntryAddress():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:44

uint32_t pagingGet4kPTEntryAddress(uintptr_t pageDirAddress, uint32_t address)
{
 1003538:	53                   	push   ebx
 1003539:	83 ec 10             	sub    esp,0x10
 100353c:	8b 5c 24 1c          	mov    ebx,DWORD PTR [esp+0x1c]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:46
    address&=0xFFFFF000;
    uintptr_t pDirPtr=pagingGet4kPDEntryValue(pageDirAddress,address) & 0xFFFFF000;
 1003540:	89 d8                	mov    eax,ebx
 1003542:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003547:	50                   	push   eax
 1003548:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100354c:	e8 9a ff ff ff       	call   10034eb <pagingGet4kPDEntryValue>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:47
    return ((address & 0x3FF000) >> 12) << 2 | pDirPtr;
 1003551:	81 e3 00 f0 3f 00    	and    ebx,0x3ff000
 1003557:	c1 eb 0a             	shr    ebx,0xa
 100355a:	25 00 f0 ff ff       	and    eax,0xfffff000
 100355f:	09 d8                	or     eax,ebx
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:48
}
 1003561:	83 c4 18             	add    esp,0x18
 1003564:	5b                   	pop    ebx
 1003565:	c3                   	ret    

01003566 <pagingGet4kPTEntryValue>:
pagingGet4kPTEntryValue():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:51

uint32_t pagingGet4kPTEntryValue(uintptr_t pageDirAddress, uint32_t address)
{
 1003566:	53                   	push   ebx
 1003567:	83 ec 10             	sub    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:53
    address&=0xFFFFF000;
    uint32_t* pTablePtr=(uint32_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 100356a:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 100356e:	25 00 f0 ff ff       	and    eax,0xfffff000
 1003573:	50                   	push   eax
 1003574:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1003578:	e8 bb ff ff ff       	call   1003538 <pagingGet4kPTEntryAddress>
 100357d:	89 c3                	mov    ebx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:54
    printd(DEBUG_PAGING,"pagingGet4kPTEntryValue: pageEntryAddress=0x%08X\n", pTablePtr);
 100357f:	83 c4 0c             	add    esp,0xc
 1003582:	50                   	push   eax
 1003583:	68 0c 69 00 01       	push   0x100690c
 1003588:	6a 40                	push   0x40
 100358a:	e8 b0 ef ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:55
    return *pTablePtr;
 100358f:	8b 03                	mov    eax,DWORD PTR [ebx]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:56
}
 1003591:	83 c4 18             	add    esp,0x18
 1003594:	5b                   	pop    ebx
 1003595:	c3                   	ret    

01003596 <pagingSetPageReadOnlyFlag>:
pagingSetPageReadOnlyFlag():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:59

void pagingSetPageReadOnlyFlag(uintptr_t* ptEntry, bool readOnly)
{
 1003596:	56                   	push   esi
 1003597:	53                   	push   ebx
 1003598:	83 ec 04             	sub    esp,0x4
 100359b:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 100359f:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:60
    printd(DEBUG_PAGING,"pagingMakePageReadOnly: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 10035a3:	ff 33                	push   DWORD PTR [ebx]
 10035a5:	53                   	push   ebx
 10035a6:	68 40 69 00 01       	push   0x1006940
 10035ab:	6a 40                	push   0x40
 10035ad:	e8 8d ef ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:61
    if (readOnly)
 10035b2:	83 c4 10             	add    esp,0x10
 10035b5:	89 f0                	mov    eax,esi
 10035b7:	84 c0                	test   al,al
 10035b9:	74 05                	je     10035c0 <pagingSetPageReadOnlyFlag+0x2a>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:62
       *ptEntry&=0xFFFFFFFD;
 10035bb:	83 23 fd             	and    DWORD PTR [ebx],0xfffffffd
 10035be:	eb 03                	jmp    10035c3 <pagingSetPageReadOnlyFlag+0x2d>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:64
    else
       *ptEntry|=2; 
 10035c0:	83 0b 02             	or     DWORD PTR [ebx],0x2
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:65
    RELOAD_CR3
 10035c3:	0f 20 d8             	mov    eax,cr3
 10035c6:	0f 22 d8             	mov    cr3,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:66
    printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 10035c9:	83 ec 04             	sub    esp,0x4
 10035cc:	ff 33                	push   DWORD PTR [ebx]
 10035ce:	68 ce 62 00 01       	push   0x10062ce
 10035d3:	6a 40                	push   0x40
 10035d5:	e8 65 ef ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:67
}
 10035da:	83 c4 14             	add    esp,0x14
 10035dd:	5b                   	pop    ebx
 10035de:	5e                   	pop    esi
 10035df:	c3                   	ret    

010035e0 <pagingUpdatePTEPresentFlag>:
pagingUpdatePTEPresentFlag():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:70

void pagingUpdatePTEPresentFlag(uintptr_t* ptEntry, bool present)
{
 10035e0:	56                   	push   esi
 10035e1:	53                   	push   ebx
 10035e2:	83 ec 04             	sub    esp,0x4
 10035e5:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
 10035e9:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:71
         printd(DEBUG_PAGING,"pagingUpdatePTEPresentFlag: 0x%08X - before/after: 0x%08X/", ptEntry, *ptEntry);
 10035ed:	ff 33                	push   DWORD PTR [ebx]
 10035ef:	53                   	push   ebx
 10035f0:	68 78 69 00 01       	push   0x1006978
 10035f5:	6a 40                	push   0x40
 10035f7:	e8 43 ef ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:72
         if (present)
 10035fc:	83 c4 10             	add    esp,0x10
 10035ff:	89 f0                	mov    eax,esi
 1003601:	84 c0                	test   al,al
 1003603:	74 05                	je     100360a <pagingUpdatePTEPresentFlag+0x2a>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:73
             *ptEntry=*ptEntry | 1;
 1003605:	83 0b 01             	or     DWORD PTR [ebx],0x1
 1003608:	eb 03                	jmp    100360d <pagingUpdatePTEPresentFlag+0x2d>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:75
         else
             *ptEntry&=0xFFFFFFFE;
 100360a:	83 23 fe             	and    DWORD PTR [ebx],0xfffffffe
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:76
         __asm__("mov eax,cr3\nmov cr3,eax\n":::"eax");
 100360d:	0f 20 d8             	mov    eax,cr3
 1003610:	0f 22 d8             	mov    cr3,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:77
         printd(DEBUG_PAGING,"0x%08X\n", *ptEntry);
 1003613:	83 ec 04             	sub    esp,0x4
 1003616:	ff 33                	push   DWORD PTR [ebx]
 1003618:	68 ce 62 00 01       	push   0x10062ce
 100361d:	6a 40                	push   0x40
 100361f:	e8 1b ef ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:78
}
 1003624:	83 c4 14             	add    esp,0x14
 1003627:	5b                   	pop    ebx
 1003628:	5e                   	pop    esi
 1003629:	c3                   	ret    

0100362a <pagingSetVirtualRangeRO>:
pagingSetVirtualRangeRO():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:81

void pagingSetVirtualRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 100362a:	55                   	push   ebp
 100362b:	57                   	push   edi
 100362c:	56                   	push   esi
 100362d:	53                   	push   ebx
 100362e:	83 ec 1c             	sub    esp,0x1c
 1003631:	8b 5c 24 34          	mov    ebx,DWORD PTR [esp+0x34]
 1003635:	8b 7c 24 38          	mov    edi,DWORD PTR [esp+0x38]
 1003639:	8b 74 24 3c          	mov    esi,DWORD PTR [esp+0x3c]
 100363d:	89 f0                	mov    eax,esi
 100363f:	88 44 24 0f          	mov    BYTE PTR [esp+0xf],al
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:83
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
 1003643:	57                   	push   edi
 1003644:	53                   	push   ebx
 1003645:	68 b4 69 00 01       	push   0x10069b4
 100364a:	6a 40                	push   0x40
 100364c:	e8 ee ee ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:84
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 1003651:	8d 4f 01             	lea    ecx,[edi+0x1]
 1003654:	89 4c 24 18          	mov    DWORD PTR [esp+0x18],ecx
 1003658:	83 c4 10             	add    esp,0x10
 100365b:	39 cb                	cmp    ebx,ecx
 100365d:	77 4f                	ja     10036ae <pagingSetVirtualRangeRO+0x84>
 100365f:	89 f2                	mov    edx,esi
 1003661:	84 d2                	test   dl,dl
 1003663:	b8 4d 62 00 01       	mov    eax,0x100624d
 1003668:	bd 4a 62 00 01       	mov    ebp,0x100624a
 100366d:	0f 44 e8             	cmove  ebp,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:88
    {
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 1003670:	0f b6 7c 24 0f       	movzx  edi,BYTE PTR [esp+0xf]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:86
{
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
    {
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
 1003675:	83 ec 08             	sub    esp,0x8
 1003678:	53                   	push   ebx
 1003679:	ff 74 24 3c          	push   DWORD PTR [esp+0x3c]
 100367d:	e8 b6 fe ff ff       	call   1003538 <pagingGet4kPTEntryAddress>
 1003682:	89 c6                	mov    esi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:87
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
 1003684:	89 2c 24             	mov    DWORD PTR [esp],ebp
 1003687:	50                   	push   eax
 1003688:	53                   	push   ebx
 1003689:	68 50 62 00 01       	push   0x1006250
 100368e:	6a 40                	push   0x40
 1003690:	e8 aa ee ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:88
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
 1003695:	83 c4 18             	add    esp,0x18
 1003698:	57                   	push   edi
 1003699:	56                   	push   esi
 100369a:	e8 dc db ff ff       	call   100127b <kPagingSetPageReadOnlyFlag>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:84

void pagingSetVirtualRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
    uintptr_t* startPTE;
    printd(DEBUG_PAGING,"kMakeVirtualRangeRO: Make 0x%08X-0x%08X r/o\n", startAddy, endAddy);
    for (uint32_t cnt=(startAddy);cnt<=(endAddy)+1;cnt+=0x1000)
 100369f:	81 c3 00 10 00 00    	add    ebx,0x1000
 10036a5:	83 c4 10             	add    esp,0x10
 10036a8:	3b 5c 24 08          	cmp    ebx,DWORD PTR [esp+0x8]
 10036ac:	76 c7                	jbe    1003675 <pagingSetVirtualRangeRO+0x4b>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:91
        startPTE=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,cnt);
        printd(DEBUG_PAGING,"0x%08X (0x%08X) %s --> ", cnt, startPTE, readOnly?"ro":"rw");
        kPagingSetPageReadOnlyFlag(startPTE++, readOnly);
            
    }
}
 10036ae:	83 c4 1c             	add    esp,0x1c
 10036b1:	5b                   	pop    ebx
 10036b2:	5e                   	pop    esi
 10036b3:	5f                   	pop    edi
 10036b4:	5d                   	pop    ebp
 10036b5:	c3                   	ret    

010036b6 <pagingUpdatePresentFlagA>:
pagingUpdatePresentFlagA():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:95

//Absolute version, page passed is already virtual
void pagingUpdatePresentFlagA(uintptr_t pageDirAddress, uint32_t address, bool present)
{
 10036b6:	56                   	push   esi
 10036b7:	53                   	push   ebx
 10036b8:	83 ec 04             	sub    esp,0x4
 10036bb:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
 10036bf:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:96
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: Make 0x%08X %s\n", address, present?"present":"not present");
 10036c3:	84 db                	test   bl,bl
 10036c5:	ba 68 62 00 01       	mov    edx,0x1006268
 10036ca:	b8 6c 62 00 01       	mov    eax,0x100626c
 10036cf:	0f 44 c2             	cmove  eax,edx
 10036d2:	50                   	push   eax
 10036d3:	56                   	push   esi
 10036d4:	68 e4 69 00 01       	push   0x10069e4
 10036d9:	6a 40                	push   0x40
 10036db:	e8 5f ee ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:97
        uintptr_t* pagePTE= (uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address&0xFFFFF000);
 10036e0:	83 c4 08             	add    esp,0x8
 10036e3:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 10036e9:	56                   	push   esi
 10036ea:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 10036ee:	e8 45 fe ff ff       	call   1003538 <pagingGet4kPTEntryAddress>
 10036f3:	89 c6                	mov    esi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:98
    printd(DEBUG_PAGING,"kpagingUpdatePresentFlagA: updating entry 0x%08X\n", pagePTE);
 10036f5:	83 c4 0c             	add    esp,0xc
 10036f8:	50                   	push   eax
 10036f9:	68 10 6a 00 01       	push   0x1006a10
 10036fe:	6a 40                	push   0x40
 1003700:	e8 3a ee ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:99
    pagingUpdatePTEPresentFlag(pagePTE, present);
 1003705:	83 c4 08             	add    esp,0x8
 1003708:	0f b6 db             	movzx  ebx,bl
 100370b:	53                   	push   ebx
 100370c:	56                   	push   esi
 100370d:	e8 ce fe ff ff       	call   10035e0 <pagingUpdatePTEPresentFlag>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:100
}
 1003712:	83 c4 14             	add    esp,0x14
 1003715:	5b                   	pop    ebx
 1003716:	5e                   	pop    esi
 1003717:	c3                   	ret    

01003718 <pagingUpdatePresentFlagV>:
pagingUpdatePresentFlagV():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:103

void pagingUpdatePresentFlagV(uintptr_t pageDirAddress,uint32_t address, bool present)
{
 1003718:	83 ec 10             	sub    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:105
    address+=KERNEL_PAGED_BASE_ADDRESS; 
    pagingUpdatePresentFlagA(pageDirAddress,address, present);
 100371b:	0f b6 44 24 1c       	movzx  eax,BYTE PTR [esp+0x1c]
 1003720:	50                   	push   eax
 1003721:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1003725:	2d 00 00 00 40       	sub    eax,0x40000000
 100372a:	50                   	push   eax
 100372b:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 100372f:	e8 82 ff ff ff       	call   10036b6 <pagingUpdatePresentFlagA>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:106
}
 1003734:	83 c4 1c             	add    esp,0x1c
 1003737:	c3                   	ret    

01003738 <pagingMapPage>:
pagingMapPage():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:112

///Map a page to a new address
///mapFrom is the original address
///mapTo is the new address that the page will be available at
void pagingMapPage(uintptr_t pageDirAddress, uintptr_t mapTo, uintptr_t mapFrom, uint8_t flags)
{
 1003738:	55                   	push   ebp
 1003739:	57                   	push   edi
 100373a:	56                   	push   esi
 100373b:	53                   	push   ebx
 100373c:	83 ec 0c             	sub    esp,0xc
 100373f:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 1003743:	8b 74 24 24          	mov    esi,DWORD PTR [esp+0x24]
 1003747:	8b 5c 24 2c          	mov    ebx,DWORD PTR [esp+0x2c]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:120
    uint32_t *ptrT;
    
    //Get pointer to the page directory
    ptr=(uint32_t*)pageDirAddress;
    //Get the appropriate entry in the page table
    ptrVal=ptr[(mapTo>>22)];
 100374b:	89 f0                	mov    eax,esi
 100374d:	c1 e8 16             	shr    eax,0x16
 1003750:	8d 7c 85 00          	lea    edi,[ebp+eax*4+0x0]
 1003754:	8b 07                	mov    eax,DWORD PTR [edi]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:121
    if (ptrVal==0)
 1003756:	85 c0                	test   eax,eax
 1003758:	75 46                	jne    10037a0 <pagingMapPage+0x68>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:124
    {
        //Get a page for the page table
        *ptrT=(uint32_t*)pagingAllocatePagingTablePage();
 100375a:	e8 81 fd ff ff       	call   10034e0 <pagingAllocatePagingTablePage>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:125
        printd(DEBUG_PAGING,"pagingMapPage: Page table didn't exist for address 0x%08X (CR3=0x%08X)\n\tAllocated page @ 0x%08X for the page table\n",mapTo,pageDirAddress,  *ptrT);
 100375f:	83 ec 0c             	sub    esp,0xc
 1003762:	50                   	push   eax
 1003763:	55                   	push   ebp
 1003764:	56                   	push   esi
 1003765:	68 88 72 00 01       	push   0x1007288
 100376a:	6a 40                	push   0x40
 100376c:	e8 ce ed ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:126
        ptr[(mapTo>>22)]=0x20000063;
 1003771:	c7 07 63 00 00 20    	mov    DWORD PTR [edi],0x20000063
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:128
        ptrT[(mapTo&0x003FFFFF/4096)]=mapFrom | flags;
        printd(DEBUG_PAGING,"kMapPage: Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)],ptrT[(mapTo&0x003FFFFF/4096)]);
 1003777:	83 c4 18             	add    esp,0x18
 100377a:	0f b6 db             	movzx  ebx,bl
 100377d:	0b 5c 24 30          	or     ebx,DWORD PTR [esp+0x30]
 1003781:	53                   	push   ebx
 1003782:	89 f0                	mov    eax,esi
 1003784:	25 ff 03 00 00       	and    eax,0x3ff
 1003789:	c1 e0 02             	shl    eax,0x2
 100378c:	50                   	push   eax
 100378d:	57                   	push   edi
 100378e:	56                   	push   esi
 100378f:	68 44 6a 00 01       	push   0x1006a44
 1003794:	6a 40                	push   0x40
 1003796:	e8 a4 ed ff ff       	call   100253f <printd>
 100379b:	83 c4 20             	add    esp,0x20
 100379e:	eb 32                	jmp    10037d2 <pagingMapPage+0x9a>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:141
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=mapFrom | flags;
 10037a0:	25 00 f0 ff ff       	and    eax,0xfffff000
 10037a5:	89 c2                	mov    edx,eax
 10037a7:	89 f0                	mov    eax,esi
 10037a9:	c1 e8 0a             	shr    eax,0xa
 10037ac:	25 fc 0f 00 00       	and    eax,0xffc
 10037b1:	01 d0                	add    eax,edx
 10037b3:	0f b6 db             	movzx  ebx,bl
 10037b6:	0b 5c 24 28          	or     ebx,DWORD PTR [esp+0x28]
 10037ba:	89 18                	mov    DWORD PTR [eax],ebx
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:142
        printd(DEBUG_PAGING,"2) Mapped 0x%08X via dir=0x%08X, page=0x%08X, to 0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal],ptrT[ptrVal]);
 10037bc:	83 ec 08             	sub    esp,0x8
 10037bf:	53                   	push   ebx
 10037c0:	50                   	push   eax
 10037c1:	57                   	push   edi
 10037c2:	56                   	push   esi
 10037c3:	68 84 6a 00 01       	push   0x1006a84
 10037c8:	6a 40                	push   0x40
 10037ca:	e8 70 ed ff ff       	call   100253f <printd>
 10037cf:	83 c4 20             	add    esp,0x20
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:144
    }
}
 10037d2:	83 c4 0c             	add    esp,0xc
 10037d5:	5b                   	pop    ebx
 10037d6:	5e                   	pop    esi
 10037d7:	5f                   	pop    edi
 10037d8:	5d                   	pop    ebp
 10037d9:	c3                   	ret    

010037da <isPageMapped>:
isPageMapped():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:147

bool isPageMapped(uintptr_t pageDirAddress, uintptr_t Address)
{
 10037da:	83 ec 14             	sub    esp,0x14
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:148
    if (!pagingGet4kPTEntryValue(pageDirAddress,Address))
 10037dd:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 10037e1:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 10037e5:	e8 7c fd ff ff       	call   1003566 <pagingGet4kPTEntryValue>
 10037ea:	85 c0                	test   eax,eax
 10037ec:	0f 95 c0             	setne  al
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:151
        return false;
    return true;
}
 10037ef:	83 c4 1c             	add    esp,0x1c
 10037f2:	c3                   	ret    

010037f3 <unMapPage>:
unMapPage():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:154

void unMapPage(uintptr_t pageDirAddress, uintptr_t mapTo, uint8_t newFlags)
{
 10037f3:	57                   	push   edi
 10037f4:	56                   	push   esi
 10037f5:	53                   	push   ebx
 10037f6:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
 10037fa:	8b 5c 24 18          	mov    ebx,DWORD PTR [esp+0x18]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:159
    uint32_t *ptr;
    uint32_t ptrVal;
    uint32_t *ptrT;
    ptr=(uint32_t*)pageDirAddress;
    ptrVal=ptr[(mapTo>>22)];
 10037fe:	89 c8                	mov    eax,ecx
 1003800:	c1 e8 16             	shr    eax,0x16
 1003803:	c1 e0 02             	shl    eax,0x2
 1003806:	03 44 24 10          	add    eax,DWORD PTR [esp+0x10]
 100380a:	8b 10                	mov    edx,DWORD PTR [eax]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:160
    if (ptrVal==0 && mapTo < kE820MemoryBytes)
 100380c:	85 d2                	test   edx,edx
 100380e:	75 4b                	jne    100385b <unMapPage+0x68>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:160 (discriminator 1)
 1003810:	bf 00 00 00 00       	mov    edi,0x0
 1003815:	3b 3d 4c 00 00 02    	cmp    edi,DWORD PTR ds:0x200004c
 100381b:	72 08                	jb     1003825 <unMapPage+0x32>
 100381d:	3b 0d 48 00 00 02    	cmp    ecx,DWORD PTR ds:0x2000048
 1003823:	73 36                	jae    100385b <unMapPage+0x68>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:163
    {
        ptrT=(uint32_t*)0x20000000;
        ptr[(mapTo>>22)]=0x20000063;
 1003825:	c7 00 63 00 00 20    	mov    DWORD PTR [eax],0x20000063
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:164
        ptrT[(mapTo&0x003FFFFF/4096)]=0 | newFlags;
 100382b:	89 ca                	mov    edx,ecx
 100382d:	81 e2 ff 03 00 00    	and    edx,0x3ff
 1003833:	8d 34 95 00 00 00 20 	lea    esi,[edx*4+0x20000000]
 100383a:	0f b6 db             	movzx  ebx,bl
 100383d:	89 1c 95 00 00 00 20 	mov    DWORD PTR [edx*4+0x20000000],ebx
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:165
        printd(DEBUG_PAGING,"kMapPage: Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[(mapTo&0x003FFFFF/4096)]);
 1003844:	83 ec 0c             	sub    esp,0xc
 1003847:	56                   	push   esi
 1003848:	50                   	push   eax
 1003849:	51                   	push   ecx
 100384a:	68 c0 6a 00 01       	push   0x1006ac0
 100384f:	6a 40                	push   0x40
 1003851:	e8 e9 ec ff ff       	call   100253f <printd>
 1003856:	83 c4 20             	add    esp,0x20
 1003859:	eb 2f                	jmp    100388a <unMapPage+0x97>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:176
        ptrVal=ptr[mapTo>>22];
        ptrVal=(ptrVal&0xFFFFF000);
        ptrT=(uint32_t*)ptrVal;
        //Now ptrVal will point to offset within page table
        ptrVal=(mapTo&0x003FFFFF)/4096;
        ptrT[ptrVal]=0 | newFlags;
 100385b:	89 d6                	mov    esi,edx
 100385d:	81 e6 00 f0 ff ff    	and    esi,0xfffff000
 1003863:	89 ca                	mov    edx,ecx
 1003865:	c1 ea 0a             	shr    edx,0xa
 1003868:	81 e2 fc 0f 00 00    	and    edx,0xffc
 100386e:	01 f2                	add    edx,esi
 1003870:	0f b6 db             	movzx  ebx,bl
 1003873:	89 1a                	mov    DWORD PTR [edx],ebx
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:177
        printd(DEBUG_PAGING,"2) Unmapped 0x%08X via dir=0x%08X, page=0x%08X\n", mapTo, &ptr[(mapTo>>22)], &ptrT[ptrVal]);
 1003875:	83 ec 0c             	sub    esp,0xc
 1003878:	52                   	push   edx
 1003879:	50                   	push   eax
 100387a:	51                   	push   ecx
 100387b:	68 f8 6a 00 01       	push   0x1006af8
 1003880:	6a 40                	push   0x40
 1003882:	e8 b8 ec ff ff       	call   100253f <printd>
 1003887:	83 c4 20             	add    esp,0x20
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:179
    }
}
 100388a:	5b                   	pop    ebx
 100388b:	5e                   	pop    esi
 100388c:	5f                   	pop    edi
 100388d:	c3                   	ret    

0100388e <pagingSetPhysicalRangeRO>:
pagingSetPhysicalRangeRO():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:182

void pagingSetPhysicalRangeRO(uintptr_t pageDirAddress, uint32_t startAddy, uint32_t endAddy, bool readOnly)
{
 100388e:	83 ec 14             	sub    esp,0x14
 1003891:	8b 44 24 1c          	mov    eax,DWORD PTR [esp+0x1c]
 1003895:	8b 54 24 20          	mov    edx,DWORD PTR [esp+0x20]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:183
    printd(DEBUG_PAGING,"kMakePhysicalRangeRO: Make 0x%08X(0x%08X)-0x%08X(0x%08X) r/o\n", startAddy, startAddy&0xFffff000, endAddy, endAddy&0xFFFFF000);
 1003899:	89 d1                	mov    ecx,edx
 100389b:	81 e1 00 f0 ff ff    	and    ecx,0xfffff000
 10038a1:	51                   	push   ecx
 10038a2:	52                   	push   edx
 10038a3:	89 c2                	mov    edx,eax
 10038a5:	81 e2 00 f0 ff ff    	and    edx,0xfffff000
 10038ab:	52                   	push   edx
 10038ac:	50                   	push   eax
 10038ad:	68 28 6b 00 01       	push   0x1006b28
 10038b2:	6a 40                	push   0x40
 10038b4:	e8 86 ec ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:184
        panic("fix this!!!");
 10038b9:	83 c4 14             	add    esp,0x14
 10038bc:	68 84 65 00 01       	push   0x1006584
 10038c1:	e8 de e7 ff ff       	call   10020a4 <panic>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:186
        //SetVirtualRangeRO((startAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, (endAddy + KERNEL_PAGED_BASE_ADDRESS) & 0xFFFFF000, readOnly);
}
 10038c6:	83 c4 1c             	add    esp,0x1c
 10038c9:	c3                   	ret    

010038ca <pagingSetPageInUseFlag>:
pagingSetPageInUseFlag():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:189

void pagingSetPageInUseFlag(uintptr_t pageDirAddress, uintptr_t address, bool inUse)
{
 10038ca:	56                   	push   esi
 10038cb:	53                   	push   ebx
 10038cc:	83 ec 04             	sub    esp,0x4
 10038cf:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
 10038d3:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:191
    uintptr_t* ptEntry;
    printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 10038d7:	80 7c 24 18 00       	cmp    BYTE PTR [esp+0x18],0x0
 10038dc:	74 38                	je     1003916 <pagingSetPageInUseFlag+0x4c>
 10038de:	68 78 62 00 01       	push   0x1006278
 10038e3:	53                   	push   ebx
 10038e4:	68 68 6b 00 01       	push   0x1006b68
 10038e9:	6a 40                	push   0x40
 10038eb:	e8 4f ec ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:192
    ptEntry=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 10038f0:	83 c4 08             	add    esp,0x8
 10038f3:	53                   	push   ebx
 10038f4:	56                   	push   esi
 10038f5:	e8 3e fc ff ff       	call   1003538 <pagingGet4kPTEntryAddress>
 10038fa:	89 c3                	mov    ebx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:193
    printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 10038fc:	ff 30                	push   DWORD PTR [eax]
 10038fe:	50                   	push   eax
 10038ff:	68 ac 6b 00 01       	push   0x1006bac
 1003904:	6a 40                	push   0x40
 1003906:	e8 34 ec ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:195
    if (inUse)
        *ptEntry|=PAGING_IN_USE_FLAG_MASK;
 100390b:	81 0b 00 08 00 00    	or     DWORD PTR [ebx],0x800
 1003911:	83 c4 20             	add    esp,0x20
 1003914:	eb 36                	jmp    100394c <pagingSetPageInUseFlag+0x82>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:191
}

void pagingSetPageInUseFlag(uintptr_t pageDirAddress, uintptr_t address, bool inUse)
{
    uintptr_t* ptEntry;
    printd(DEBUG_PAGING, "mmKernelSetPageInUseFlag: Marking page with address 0x%08X as %s\n", address, inUse?"in use":"not in use");
 1003916:	68 74 62 00 01       	push   0x1006274
 100391b:	53                   	push   ebx
 100391c:	68 68 6b 00 01       	push   0x1006b68
 1003921:	6a 40                	push   0x40
 1003923:	e8 17 ec ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:192
    ptEntry=(uintptr_t*)pagingGet4kPTEntryAddress(pageDirAddress,address);
 1003928:	83 c4 08             	add    esp,0x8
 100392b:	53                   	push   ebx
 100392c:	56                   	push   esi
 100392d:	e8 06 fc ff ff       	call   1003538 <pagingGet4kPTEntryAddress>
 1003932:	89 c3                	mov    ebx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:193
    printd(DEBUG_PAGING,"mmKernelSetPageInUseFlag: PTE=0x%08X, Before PTE value=0x%08X\n",ptEntry,*ptEntry);
 1003934:	ff 30                	push   DWORD PTR [eax]
 1003936:	50                   	push   eax
 1003937:	68 ac 6b 00 01       	push   0x1006bac
 100393c:	6a 40                	push   0x40
 100393e:	e8 fc eb ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:197
    if (inUse)
        *ptEntry|=PAGING_IN_USE_FLAG_MASK;
    else
        *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
 1003943:	81 23 ff f7 ff ff    	and    DWORD PTR [ebx],0xfffff7ff
 1003949:	83 c4 20             	add    esp,0x20
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:198
}
 100394c:	83 c4 04             	add    esp,0x4
 100394f:	5b                   	pop    ebx
 1003950:	5e                   	pop    esi
 1003951:	c3                   	ret    

01003952 <pagingSetPageRangeInUseFlag>:
pagingSetPageRangeInUseFlag():
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:201

void pagingSetPageRangeInUseFlag(uintptr_t pageDirAddress, uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
 1003952:	55                   	push   ebp
 1003953:	57                   	push   edi
 1003954:	56                   	push   esi
 1003955:	53                   	push   ebx
 1003956:	83 ec 0c             	sub    esp,0xc
 1003959:	8b 6c 24 20          	mov    ebp,DWORD PTR [esp+0x20]
 100395d:	8b 5c 24 24          	mov    ebx,DWORD PTR [esp+0x24]
 1003961:	8b 7c 24 28          	mov    edi,DWORD PTR [esp+0x28]
 1003965:	0f b6 44 24 30       	movzx  eax,BYTE PTR [esp+0x30]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:202
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 100396a:	39 fb                	cmp    ebx,edi
 100396c:	73 19                	jae    1003987 <pagingSetPageRangeInUseFlag+0x35>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:203 (discriminator 3)
        pagingSetPageInUseFlag(pageDirAddress,cnt,inUse);
 100396e:	0f b6 f0             	movzx  esi,al
 1003971:	83 ec 04             	sub    esp,0x4
 1003974:	56                   	push   esi
 1003975:	53                   	push   ebx
 1003976:	55                   	push   ebp
 1003977:	e8 4e ff ff ff       	call   10038ca <pagingSetPageInUseFlag>
 100397c:	03 5c 24 3c          	add    ebx,DWORD PTR [esp+0x3c]
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:202 (discriminator 3)
        *ptEntry&=~PAGING_IN_USE_FLAG_MASK;
}

void pagingSetPageRangeInUseFlag(uintptr_t pageDirAddress, uintptr_t startAddress, uintptr_t endAddress, int pageSize, bool inUse)
{
    for (uintptr_t cnt=startAddress;cnt<endAddress;cnt+=pageSize)
 1003980:	83 c4 10             	add    esp,0x10
 1003983:	39 fb                	cmp    ebx,edi
 1003985:	72 ea                	jb     1003971 <pagingSetPageRangeInUseFlag+0x1f>
/home/yogi/NetBeansProjects/chrisOSKernel/src/paging.c:204
        pagingSetPageInUseFlag(pageDirAddress,cnt,inUse);
}
 1003987:	83 c4 0c             	add    esp,0xc
 100398a:	5b                   	pop    ebx
 100398b:	5e                   	pop    esi
 100398c:	5f                   	pop    edi
 100398d:	5d                   	pop    ebp
 100398e:	c3                   	ret    
 100398f:	90                   	nop

01003990 <syscall169>:
syscall169():
/home/yogi/NetBeansProjects/chrisOSKernel/src/syscall.c:25

void syscall169()
{
    uint8_t temp;
 
    __asm__ volatile ("cli"); /* disable all interrupts */
 1003990:	fa                   	cli    
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
}

static __inline unsigned char inb(unsigned short __port)
{
	unsigned char __val;
	__asm__ volatile ("inb %0, %1" : "=a" (__val) : "dN" (__port));
 1003991:	e4 64                	in     al,0x64
 1003993:	89 c2                	mov    edx,eax
syscall169():
/home/yogi/NetBeansProjects/chrisOSKernel/src/syscall.c:30
    /* Clear all keyboard buffers (output and command buffers) */
    do
    {
        temp = inb(KBRD_INTRFC); /* empty user data */
        if (check_flag(temp, KBRD_BIT_KDATA) != 0)
 1003995:	a8 01                	test   al,0x1
 1003997:	74 02                	je     100399b <syscall169+0xb>
inb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:39
 1003999:	e4 60                	in     al,0x60
syscall169():
/home/yogi/NetBeansProjects/chrisOSKernel/src/syscall.c:32
            inb(KBRD_IO); /* empty keyboard data */
    } while (check_flag(temp, KBRD_BIT_UDATA) != 0);
 100399b:	f6 c2 02             	test   dl,0x2
 100399e:	75 f1                	jne    1003991 <syscall169+0x1>
outb():
/home/yogi/NetBeansProjects/chrisOSKernel/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
 10039a0:	b8 fe ff ff ff       	mov    eax,0xfffffffe
 10039a5:	e6 64                	out    0x64,al
syscall169():
/home/yogi/NetBeansProjects/chrisOSKernel/src/syscall.c:36 (discriminator 1)
 
    outb(KBRD_INTRFC, KBRD_RESET); /* pulse CPU reset line */
loop:
    __asm__ volatile ("hlt"); /* if that didn't work, halt the CPU */
 10039a7:	f4                   	hlt    
 10039a8:	eb fd                	jmp    10039a7 <syscall169+0x17>
 10039aa:	66 90                	xchg   ax,ax

010039ac <getTask>:
getTask():
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:16
extern task_t* kTaskTable;
extern uint32_t kDebugLevel;

///Find an open TSS slot and mark it in use
task_t* getTask()
{
 10039ac:	57                   	push   edi
 10039ad:	56                   	push   esi
 10039ae:	53                   	push   ebx
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:18
   int cnt=0,slot=0;
   uint32_t* ptr=kTSSAvailable;
 10039af:	8b 1d f4 03 00 02    	mov    ebx,DWORD PTR ds:0x20003f4
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:17
extern uint32_t kDebugLevel;

///Find an open TSS slot and mark it in use
task_t* getTask()
{
   int cnt=0,slot=0;
 10039b5:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:21
   uint32_t* ptr=kTSSAvailable;
    while (cnt < TSS_TABLE_RECORD_COUNT/32)
    {
        printd (DEBUG_TASK,"Checking slots at 0x%08X, cnt=%u\n",ptr,cnt);
 10039ba:	56                   	push   esi
 10039bb:	53                   	push   ebx
 10039bc:	68 fc 72 00 01       	push   0x10072fc
 10039c1:	68 00 40 00 00       	push   0x4000
 10039c6:	e8 74 eb ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:22
        slot=bitsScanF(ptr);
 10039cb:	89 1c 24             	mov    DWORD PTR [esp],ebx
 10039ce:	e8 48 cc ff ff       	call   100061b <bitsScanF>
 10039d3:	89 c7                	mov    edi,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:23
        if (slot>-1)
 10039d5:	83 c4 10             	add    esp,0x10
 10039d8:	85 c0                	test   eax,eax
 10039da:	78 4e                	js     1003a2a <getTask+0x7e>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:25
        {
            task_t* task=&kTaskTable[slot];
 10039dc:	89 c6                	mov    esi,eax
 10039de:	c1 e6 04             	shl    esi,0x4
 10039e1:	03 35 fc 03 00 02    	add    esi,DWORD PTR ds:0x20003fc
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:26
            printd(DEBUG_TASK,"TASK: Marking TSS %u used\n",slot);
 10039e7:	83 ec 04             	sub    esp,0x4
 10039ea:	50                   	push   eax
 10039eb:	68 90 65 00 01       	push   0x1006590
 10039f0:	68 00 40 00 00       	push   0x4000
 10039f5:	e8 45 eb ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:27
            bitsReset(ptr,slot);
 10039fa:	83 c4 08             	add    esp,0x8
 10039fd:	57                   	push   edi
 10039fe:	53                   	push   ebx
 10039ff:	e8 e5 cb ff ff       	call   10005e9 <bitsReset>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:28
            task->tss=&kTSSTable[slot];
 1003a04:	6b c7 68             	imul   eax,edi,0x68
 1003a07:	03 05 f8 03 00 02    	add    eax,DWORD PTR ds:0x20003f8
 1003a0d:	89 06                	mov    DWORD PTR [esi],eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:34
            if (slot>0)
            {
                //(task-1)->next=task;
                //task->prev=(task-1);
            }
            printd(DEBUG_TASK,"TASK: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
 1003a0f:	89 04 24             	mov    DWORD PTR [esp],eax
 1003a12:	56                   	push   esi
 1003a13:	57                   	push   edi
 1003a14:	68 20 73 00 01       	push   0x1007320
 1003a19:	68 00 40 00 00       	push   0x4000
 1003a1e:	e8 1c eb ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:35
            return task;
 1003a23:	83 c4 20             	add    esp,0x20
 1003a26:	89 f0                	mov    eax,esi
 1003a28:	eb 20                	jmp    1003a4a <getTask+0x9e>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:37
        }
        ptr+=4;cnt++;
 1003a2a:	83 c3 10             	add    ebx,0x10
 1003a2d:	83 c6 01             	add    esi,0x1
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:19
///Find an open TSS slot and mark it in use
task_t* getTask()
{
   int cnt=0,slot=0;
   uint32_t* ptr=kTSSAvailable;
    while (cnt < TSS_TABLE_RECORD_COUNT/32)
 1003a30:	83 fe 20             	cmp    esi,0x20
 1003a33:	75 85                	jne    10039ba <getTask+0xe>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:39
            printd(DEBUG_TASK,"TASK: Using task %u @ 0x%08X, set TSS to 0x%08X\n",slot, task,task->tss);
            return task;
        }
        ptr+=4;cnt++;
    }
    panic("tssUseAvailable: Cannot allocate TSS for new task");
 1003a35:	83 ec 0c             	sub    esp,0xc
 1003a38:	68 54 73 00 01       	push   0x1007354
 1003a3d:	e8 62 e6 ff ff       	call   10020a4 <panic>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:40
    return NULL;
 1003a42:	83 c4 10             	add    esp,0x10
 1003a45:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:41
}
 1003a4a:	5b                   	pop    ebx
 1003a4b:	5e                   	pop    esi
 1003a4c:	5f                   	pop    edi
 1003a4d:	c3                   	ret    

01003a4e <mmMapKernelIntoTask>:
mmMapKernelIntoTask():
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:44

void mmMapKernelIntoTask(task_t* task)
{
 1003a4e:	57                   	push   edi
 1003a4f:	56                   	push   esi
 1003a50:	53                   	push   ebx
 1003a51:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:45
    uint32_t debugVal=kDebugLevel;
 1003a55:	8b 3d 38 03 00 02    	mov    edi,DWORD PTR ds:0x2000338
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:46
    kDebugLevel=0;
 1003a5b:	c7 05 38 03 00 02 00 	mov    DWORD PTR ds:0x2000338,0x0
 1003a62:	00 00 00 
 1003a65:	bb 00 00 00 c0       	mov    ebx,0xc0000000
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:48 (discriminator 3)
    for (int cnt=KERNEL_PAGED_BASE_ADDRESS;cnt<KERNEL_PAGED_BASE_ADDRESS+0x0FFFFFFF;cnt+=1000)
        pagingMapPage(task->tss->CR3,cnt,cnt,0x3);
 1003a6a:	6a 03                	push   0x3
 1003a6c:	53                   	push   ebx
 1003a6d:	53                   	push   ebx
 1003a6e:	8b 06                	mov    eax,DWORD PTR [esi]
 1003a70:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 1003a73:	e8 c0 fc ff ff       	call   1003738 <pagingMapPage>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:47 (discriminator 3)

void mmMapKernelIntoTask(task_t* task)
{
    uint32_t debugVal=kDebugLevel;
    kDebugLevel=0;
    for (int cnt=KERNEL_PAGED_BASE_ADDRESS;cnt<KERNEL_PAGED_BASE_ADDRESS+0x0FFFFFFF;cnt+=1000)
 1003a78:	81 c3 e8 03 00 00    	add    ebx,0x3e8
 1003a7e:	83 c4 10             	add    esp,0x10
 1003a81:	81 fb 20 02 00 d0    	cmp    ebx,0xd0000220
 1003a87:	75 e1                	jne    1003a6a <mmMapKernelIntoTask+0x1c>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:49
        pagingMapPage(task->tss->CR3,cnt,cnt,0x3);
    kDebugLevel=debugVal;
 1003a89:	89 3d 38 03 00 02    	mov    DWORD PTR ds:0x2000338,edi
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:50
}
 1003a8f:	5b                   	pop    ebx
 1003a90:	5e                   	pop    esi
 1003a91:	5f                   	pop    edi
 1003a92:	c3                   	ret    

01003a93 <createTask>:
createTask():
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:53

task_t* createTask(bool kernelTSS)
{
 1003a93:	56                   	push   esi
 1003a94:	53                   	push   ebx
 1003a95:	83 ec 04             	sub    esp,0x4
 1003a98:	8b 74 24 10          	mov    esi,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:54
    task_t* task=getTask();
 1003a9c:	e8 0b ff ff ff       	call   10039ac <getTask>
 1003aa1:	89 c3                	mov    ebx,eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:57
    
    
    task->tss->EAX=0;
 1003aa3:	8b 00                	mov    eax,DWORD PTR [eax]
 1003aa5:	c7 40 28 00 00 00 00 	mov    DWORD PTR [eax+0x28],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:58
    task->tss->EBX=task->tss->ECX=task->tss->EDX=task->tss->ESI=task->tss->EDI=task->tss->EBP=0;
 1003aac:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003aae:	c7 40 3c 00 00 00 00 	mov    DWORD PTR [eax+0x3c],0x0
 1003ab5:	c7 40 44 00 00 00 00 	mov    DWORD PTR [eax+0x44],0x0
 1003abc:	c7 40 40 00 00 00 00 	mov    DWORD PTR [eax+0x40],0x0
 1003ac3:	c7 40 30 00 00 00 00 	mov    DWORD PTR [eax+0x30],0x0
 1003aca:	c7 40 2c 00 00 00 00 	mov    DWORD PTR [eax+0x2c],0x0
 1003ad1:	c7 40 34 00 00 00 00 	mov    DWORD PTR [eax+0x34],0x0
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:59
    task->tss->SS0=0x10;
 1003ad8:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003ada:	66 c7 40 0a 10 00    	mov    WORD PTR [eax+0xa],0x10
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:60
    if (kernelTSS)
 1003ae0:	89 f0                	mov    eax,esi
 1003ae2:	84 c0                	test   al,al
 1003ae4:	74 1c                	je     1003b02 <createTask+0x6f>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:61
        task->tss->ES=task->tss->DS=task->tss->FS=task->tss->GS=0x10;
 1003ae6:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003ae8:	66 c7 40 5e 10 00    	mov    WORD PTR [eax+0x5e],0x10
 1003aee:	66 c7 40 5a 10 00    	mov    WORD PTR [eax+0x5a],0x10
 1003af4:	66 c7 40 56 10 00    	mov    WORD PTR [eax+0x56],0x10
 1003afa:	66 c7 40 4a 10 00    	mov    WORD PTR [eax+0x4a],0x10
 1003b00:	eb 10                	jmp    1003b12 <createTask+0x7f>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:63
    else
        panic("write non-kernel segment pop code");
 1003b02:	83 ec 0c             	sub    esp,0xc
 1003b05:	68 88 73 00 01       	push   0x1007388
 1003b0a:	e8 95 e5 ff ff       	call   10020a4 <panic>
 1003b0f:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:64
    task->tss->IOPB=0xABCD;
 1003b12:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003b14:	66 c7 40 64 cd ab    	mov    WORD PTR [eax+0x64],0xabcd
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:65
    task->tss->CR3=(uint32_t)mallocA1k(0x1000,0x1000);
 1003b1a:	8b 33                	mov    esi,DWORD PTR [ebx]
 1003b1c:	83 ec 08             	sub    esp,0x8
 1003b1f:	68 00 10 00 00       	push   0x1000
 1003b24:	68 00 10 00 00       	push   0x1000
 1003b29:	e8 83 f7 ff ff       	call   10032b1 <mallocA1k>
 1003b2e:	89 46 1c             	mov    DWORD PTR [esi+0x1c],eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:66
    printd(DEBUG_TASK,"Malloc'd 1k task page directory @ 0x%08X\n",task->tss->CR3);
 1003b31:	83 c4 0c             	add    esp,0xc
 1003b34:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003b36:	ff 70 1c             	push   DWORD PTR [eax+0x1c]
 1003b39:	68 ac 73 00 01       	push   0x10073ac
 1003b3e:	68 00 40 00 00       	push   0x4000
 1003b43:	e8 f7 e9 ff ff       	call   100253f <printd>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:67
    task->pageTable=(uint32_t*)task->tss->CR3;
 1003b48:	8b 03                	mov    eax,DWORD PTR [ebx]
 1003b4a:	8b 40 1c             	mov    eax,DWORD PTR [eax+0x1c]
 1003b4d:	89 43 04             	mov    DWORD PTR [ebx+0x4],eax
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:68
    mmMapKernelIntoTask(task);
 1003b50:	89 1c 24             	mov    DWORD PTR [esp],ebx
 1003b53:	e8 f6 fe ff ff       	call   1003a4e <mmMapKernelIntoTask>
/home/yogi/NetBeansProjects/chrisOSKernel/src/tss.c:70
    return task;
}
 1003b58:	89 d8                	mov    eax,ebx
 1003b5a:	83 c4 14             	add    esp,0x14
 1003b5d:	5b                   	pop    ebx
 1003b5e:	5e                   	pop    esi
 1003b5f:	c3                   	ret    
