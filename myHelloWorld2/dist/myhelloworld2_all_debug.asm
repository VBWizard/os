
Debug/cross-Linux-x86/myhelloworld2:     file format elf32-i386


Disassembly of section .text:

01000000 <update_cursor>:
update_cursor():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:44
int8_t savedPosPointer=0;

#define TEXTMODE_MEMORY_START 0xB8000
void update_cursor()
 {
    unsigned short position=(terminal_row*VGA_WIDTH) + terminal_column;
 1000000:	8b 0d 14 10 00 01    	mov    ecx,DWORD PTR ds:0x1001014
 1000006:	8d 0c 89             	lea    ecx,[ecx+ecx*4]
 1000009:	c1 e1 04             	shl    ecx,0x4
 100000c:	66 03 0d 0c 10 00 01 	add    cx,WORD PTR ds:0x100100c
outb():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/include/io.h:23
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
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:55
    outb(0x3D4, 0x0E);
    outb(0x3D5, (unsigned char )((position>>8)&0xFF));
 }

uint8_t make_color(enum vga_color fg, enum vga_color bg) {
        return fg | bg << 4;
 100003e:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 1000043:	c1 e0 04             	shl    eax,0x4
 1000046:	0a 44 24 04          	or     al,BYTE PTR [esp+0x4]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:56
}
 100004a:	c3                   	ret    

0100004b <make_vgaentry>:
make_vgaentry():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:61

uint16_t make_vgaentry(char c, uint8_t color) {
        uint16_t c16 = c;
        uint16_t color16 = color;
        return c16 | color16 << 8;
 100004b:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 1000050:	c1 e0 08             	shl    eax,0x8
 1000053:	66 0f be 54 24 04    	movsx  dx,BYTE PTR [esp+0x4]
 1000059:	09 d0                	or     eax,edx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:62
}
 100005b:	c3                   	ret    

0100005c <terminal_setcolor>:
terminal_setcolor():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:66


void terminal_setcolor(uint8_t color) {
        terminal_color = color;
 100005c:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
 1000060:	a2 0a 10 00 01       	mov    ds:0x100100a,al
 1000065:	c3                   	ret    

01000066 <terminal_putentryat>:
terminal_putentryat():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:69
}

void terminal_putentryat(char c, uint8_t color, size_t x, size_t y) {
 1000066:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:71
    const size_t index = y * VGA_WIDTH + x;
        terminal_buffer[index] = make_vgaentry(c, color);
 100006a:	8d 04 80             	lea    eax,[eax+eax*4]
 100006d:	c1 e0 04             	shl    eax,0x4
 1000070:	03 44 24 0c          	add    eax,DWORD PTR [esp+0xc]
 1000074:	0f b6 54 24 08       	movzx  edx,BYTE PTR [esp+0x8]
 1000079:	c1 e2 08             	shl    edx,0x8
 100007c:	66 0f be 4c 24 04    	movsx  cx,BYTE PTR [esp+0x4]
 1000082:	09 ca                	or     edx,ecx
 1000084:	8b 0d 10 10 00 01    	mov    ecx,DWORD PTR ds:0x1001010
 100008a:	66 89 14 41          	mov    WORD PTR [ecx+eax*2],dx
 100008e:	c3                   	ret    

0100008f <cursorSavePosition>:
cursorSavePosition():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:76
}

void cursorSavePosition()
{
    if (savedPosPointer < 10)
 100008f:	0f b6 05 24 10 00 01 	movzx  eax,BYTE PTR ds:0x1001024
 1000096:	3c 09                	cmp    al,0x9
 1000098:	7f 23                	jg     10000bd <cursorSavePosition+0x2e>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:78
    {
        savedPosX[++savedPosPointer] = terminal_column;
 100009a:	83 c0 01             	add    eax,0x1
 100009d:	a2 24 10 00 01       	mov    ds:0x1001024,al
 10000a2:	0f be c0             	movsx  eax,al
 10000a5:	8b 15 0c 10 00 01    	mov    edx,DWORD PTR ds:0x100100c
 10000ab:	88 90 18 10 00 01    	mov    BYTE PTR [eax+0x1001018],dl
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:79
        savedPosY[savedPosPointer] = terminal_row;
 10000b1:	8b 15 14 10 00 01    	mov    edx,DWORD PTR ds:0x1001014
 10000b7:	88 90 00 10 00 01    	mov    BYTE PTR [eax+0x1001000],dl
 10000bd:	f3 c3                	repz ret 

010000bf <cursorRestorePosition>:
cursorRestorePosition():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:85
    }
}

void cursorRestorePosition()
{
    if (savedPosPointer > 0)
 10000bf:	0f b6 05 24 10 00 01 	movzx  eax,BYTE PTR ds:0x1001024
 10000c6:	84 c0                	test   al,al
 10000c8:	7e 29                	jle    10000f3 <cursorRestorePosition+0x34>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:87
    {
        terminal_column = savedPosX[savedPosPointer];
 10000ca:	0f be d0             	movsx  edx,al
 10000cd:	0f b6 8a 18 10 00 01 	movzx  ecx,BYTE PTR [edx+0x1001018]
 10000d4:	89 0d 0c 10 00 01    	mov    DWORD PTR ds:0x100100c,ecx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:88
        terminal_row = savedPosY[savedPosPointer--];
 10000da:	83 e8 01             	sub    eax,0x1
 10000dd:	a2 24 10 00 01       	mov    ds:0x1001024,al
 10000e2:	0f b6 82 00 10 00 01 	movzx  eax,BYTE PTR [edx+0x1001000]
 10000e9:	a3 14 10 00 01       	mov    ds:0x1001014,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:89
        update_cursor();
 10000ee:	e8 0d ff ff ff       	call   1000000 <update_cursor>
 10000f3:	f3 c3                	repz ret 

010000f5 <terminal_clear>:
terminal_clear():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:94
    }
}

void terminal_clear()
{
 10000f5:	53                   	push   ebx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:95
    terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
 10000f6:	c6 05 0a 10 00 01 0a 	mov    BYTE PTR ds:0x100100a,0xa
 10000fd:	ba 00 00 00 00       	mov    edx,0x0
 1000102:	eb 28                	jmp    100012c <terminal_clear+0x37>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:99 (discriminator 3)
        for (size_t y = 0; y < VGA_HEIGHT; y++) {
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
 1000104:	0f b6 05 0a 10 00 01 	movzx  eax,BYTE PTR ds:0x100100a
 100010b:	c1 e0 08             	shl    eax,0x8
 100010e:	83 c8 20             	or     eax,0x20
 1000111:	8b 0d 10 10 00 01    	mov    ecx,DWORD PTR ds:0x1001010
 1000117:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
 100011b:	83 c2 02             	add    edx,0x2
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:97 (discriminator 3)

void terminal_clear()
{
    terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < VGA_HEIGHT; y++) {
                for (size_t x = 0; x < VGA_WIDTH; x++) {
 100011e:	39 da                	cmp    edx,ebx
 1000120:	75 e2                	jne    1000104 <terminal_clear+0xf>
 1000122:	89 da                	mov    edx,ebx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:96 (discriminator 2)
}

void terminal_clear()
{
    terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < VGA_HEIGHT; y++) {
 1000124:	81 fb 40 1f 00 00    	cmp    ebx,0x1f40
 100012a:	74 08                	je     1000134 <terminal_clear+0x3f>
 100012c:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
 1000132:	eb d0                	jmp    1000104 <terminal_clear+0xf>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:102
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
                }
        }
    terminal_column=0;
 1000134:	c7 05 0c 10 00 01 00 	mov    DWORD PTR ds:0x100100c,0x0
 100013b:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:103
    terminal_row=0;
 100013e:	c7 05 14 10 00 01 00 	mov    DWORD PTR ds:0x1001014,0x0
 1000145:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:104
    update_cursor();
 1000148:	e8 b3 fe ff ff       	call   1000000 <update_cursor>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:105
}
 100014d:	5b                   	pop    ebx
 100014e:	c3                   	ret    

0100014f <terminal_clear_line>:
terminal_clear_line():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:108

void terminal_clear_line(unsigned lineNo)
{
 100014f:	53                   	push   ebx
 1000150:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:109
    if (lineNo>VGA_HEIGHT-1)
 1000154:	83 f8 31             	cmp    eax,0x31
 1000157:	77 2a                	ja     1000183 <terminal_clear_line+0x34>
 1000159:	8d 14 80             	lea    edx,[eax+eax*4]
 100015c:	c1 e2 05             	shl    edx,0x5
 100015f:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:114 (discriminator 3)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
 1000165:	0f b6 05 0a 10 00 01 	movzx  eax,BYTE PTR ds:0x100100a
 100016c:	c1 e0 08             	shl    eax,0x8
 100016f:	83 c8 20             	or     eax,0x20
 1000172:	8b 0d 10 10 00 01    	mov    ecx,DWORD PTR ds:0x1001010
 1000178:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
 100017c:	83 c2 02             	add    edx,0x2
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:111 (discriminator 3)

void terminal_clear_line(unsigned lineNo)
{
    if (lineNo>VGA_HEIGHT-1)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
 100017f:	39 da                	cmp    edx,ebx
 1000181:	75 e2                	jne    1000165 <terminal_clear_line+0x16>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:116
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
    }
}
 1000183:	5b                   	pop    ebx
 1000184:	c3                   	ret    

01000185 <terminal_copyline>:
terminal_copyline():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:119

void terminal_copyline(unsigned dstLine, unsigned srcLine)
{
 1000185:	83 ec 10             	sub    esp,0x10
 1000188:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
 100018c:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:124
    unsigned rowBytes = VGA_WIDTH*2;
    uintptr_t dest=(uintptr_t)TEXTMODE_MEMORY_START+(dstLine*rowBytes);
    uintptr_t src=(uintptr_t)TEXTMODE_MEMORY_START+(srcLine*rowBytes);
    
    memcpy((void*)dest,(void*)src,rowBytes);
 1000190:	68 a0 00 00 00       	push   0xa0
 1000195:	8d 04 80             	lea    eax,[eax+eax*4]
 1000198:	c1 e0 05             	shl    eax,0x5
 100019b:	05 00 80 0b 00       	add    eax,0xb8000
 10001a0:	50                   	push   eax
 10001a1:	8d 04 92             	lea    eax,[edx+edx*4]
 10001a4:	c1 e0 05             	shl    eax,0x5
 10001a7:	05 00 80 0b 00       	add    eax,0xb8000
 10001ac:	50                   	push   eax
 10001ad:	e8 4a 06 00 00       	call   10007fc <memcpy>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:125
}
 10001b2:	83 c4 1c             	add    esp,0x1c
 10001b5:	c3                   	ret    

010001b6 <terminal_putchar>:
terminal_putchar():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:127

void terminal_putchar(char c) {
 10001b6:	53                   	push   ebx
 10001b7:	83 ec 08             	sub    esp,0x8
 10001ba:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:128
    if (c=='\n')
 10001be:	3c 0a                	cmp    al,0xa
 10001c0:	75 16                	jne    10001d8 <terminal_putchar+0x22>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:130
    {
            terminal_column = 0;
 10001c2:	c7 05 0c 10 00 01 00 	mov    DWORD PTR ds:0x100100c,0x0
 10001c9:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:131
            terminal_row += 1;
 10001cc:	83 05 14 10 00 01 01 	add    DWORD PTR ds:0x1001014,0x1
 10001d3:	e9 d4 00 00 00       	jmp    10002ac <terminal_putchar+0xf6>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:133
    }
    else if (c=='\b')
 10001d8:	3c 08                	cmp    al,0x8
 10001da:	75 48                	jne    1000224 <terminal_putchar+0x6e>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:135
    {
        if (terminal_column > 1)
 10001dc:	a1 0c 10 00 01       	mov    eax,ds:0x100100c
 10001e1:	83 f8 01             	cmp    eax,0x1
 10001e4:	76 0a                	jbe    10001f0 <terminal_putchar+0x3a>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:136
            terminal_column--;
 10001e6:	83 e8 01             	sub    eax,0x1
 10001e9:	a3 0c 10 00 01       	mov    ds:0x100100c,eax
 10001ee:	eb 11                	jmp    1000201 <terminal_putchar+0x4b>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:139
        else
        {
            terminal_row--;
 10001f0:	83 2d 14 10 00 01 01 	sub    DWORD PTR ds:0x1001014,0x1
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:140
            terminal_column=VGA_WIDTH;
 10001f7:	c7 05 0c 10 00 01 50 	mov    DWORD PTR ds:0x100100c,0x50
 10001fe:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:142
        }
        terminal_putentryat(' ', terminal_color, terminal_column, terminal_row);
 1000201:	ff 35 14 10 00 01    	push   DWORD PTR ds:0x1001014
 1000207:	ff 35 0c 10 00 01    	push   DWORD PTR ds:0x100100c
 100020d:	0f b6 05 0a 10 00 01 	movzx  eax,BYTE PTR ds:0x100100a
 1000214:	50                   	push   eax
 1000215:	6a 20                	push   0x20
 1000217:	e8 4a fe ff ff       	call   1000066 <terminal_putentryat>
 100021c:	83 c4 10             	add    esp,0x10
 100021f:	e9 88 00 00 00       	jmp    10002ac <terminal_putchar+0xf6>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:145
        
    }
    else if (c=='\t')
 1000224:	3c 09                	cmp    al,0x9
 1000226:	75 3b                	jne    1000263 <terminal_putchar+0xad>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:147
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
 1000228:	8b 0d 0c 10 00 01    	mov    ecx,DWORD PTR ds:0x100100c
 100022e:	ba cd cc cc cc       	mov    edx,0xcccccccd
 1000233:	89 c8                	mov    eax,ecx
 1000235:	f7 e2                	mul    edx
 1000237:	c1 ea 02             	shr    edx,0x2
 100023a:	8d 5c 92 05          	lea    ebx,[edx+edx*4+0x5]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:149
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
 100023e:	39 d9                	cmp    ecx,ebx
 1000240:	b8 05 00 00 00       	mov    eax,0x5
 1000245:	0f 44 d8             	cmove  ebx,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:151
        
        while (terminal_column < goTo)
 1000248:	39 d9                	cmp    ecx,ebx
 100024a:	73 60                	jae    10002ac <terminal_putchar+0xf6>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:152
            terminal_putchar(' ');;
 100024c:	83 ec 0c             	sub    esp,0xc
 100024f:	6a 20                	push   0x20
 1000251:	e8 60 ff ff ff       	call   10001b6 <terminal_putchar>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:151
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
        
        while (terminal_column < goTo)
 1000256:	83 c4 10             	add    esp,0x10
 1000259:	3b 1d 0c 10 00 01    	cmp    ebx,DWORD PTR ds:0x100100c
 100025f:	77 eb                	ja     100024c <terminal_putchar+0x96>
 1000261:	eb 49                	jmp    10002ac <terminal_putchar+0xf6>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:158
    
    //6 - cnt=0 to (5-1) 4
    //8 - cnt= to (5-3) 2
    }
    //We're going to ignore carriage return since most systems don't use it.  Unfortunately the FAT library we are using does
    else if (c=='\r')
 1000263:	3c 0d                	cmp    al,0xd
 1000265:	74 76                	je     10002dd <terminal_putchar+0x127>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:163
        return;

        else
        {
                terminal_putentryat(c, terminal_color, terminal_column, terminal_row);
 1000267:	ff 35 14 10 00 01    	push   DWORD PTR ds:0x1001014
 100026d:	ff 35 0c 10 00 01    	push   DWORD PTR ds:0x100100c
 1000273:	0f b6 15 0a 10 00 01 	movzx  edx,BYTE PTR ds:0x100100a
 100027a:	52                   	push   edx
 100027b:	0f be c0             	movsx  eax,al
 100027e:	50                   	push   eax
 100027f:	e8 e2 fd ff ff       	call   1000066 <terminal_putentryat>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:164
                if (++terminal_column == VGA_WIDTH) {
 1000284:	a1 0c 10 00 01       	mov    eax,ds:0x100100c
 1000289:	83 c0 01             	add    eax,0x1
 100028c:	83 c4 10             	add    esp,0x10
 100028f:	83 f8 50             	cmp    eax,0x50
 1000292:	74 07                	je     100029b <terminal_putchar+0xe5>
 1000294:	a3 0c 10 00 01       	mov    ds:0x100100c,eax
 1000299:	eb 11                	jmp    10002ac <terminal_putchar+0xf6>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:165
                        terminal_column = 0;
 100029b:	c7 05 0c 10 00 01 00 	mov    DWORD PTR ds:0x100100c,0x0
 10002a2:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:166
                        terminal_row++;
 10002a5:	83 05 14 10 00 01 01 	add    DWORD PTR ds:0x1001014,0x1
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:169
                }
        }
    if (terminal_row == VGA_HEIGHT)
 10002ac:	83 3d 14 10 00 01 32 	cmp    DWORD PTR ds:0x1001014,0x32
 10002b3:	75 23                	jne    10002d8 <terminal_putchar+0x122>
 10002b5:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:172 (discriminator 3)
    {
        for (unsigned row=0;row<VGA_HEIGHT;row++)
            terminal_copyline(row, row+1);
 10002ba:	8d 58 01             	lea    ebx,[eax+0x1]
 10002bd:	83 ec 08             	sub    esp,0x8
 10002c0:	53                   	push   ebx
 10002c1:	50                   	push   eax
 10002c2:	e8 be fe ff ff       	call   1000185 <terminal_copyline>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:171 (discriminator 3)
                        terminal_row++;
                }
        }
    if (terminal_row == VGA_HEIGHT)
    {
        for (unsigned row=0;row<VGA_HEIGHT;row++)
 10002c7:	89 d8                	mov    eax,ebx
 10002c9:	83 c4 10             	add    esp,0x10
 10002cc:	83 fb 32             	cmp    ebx,0x32
 10002cf:	75 e9                	jne    10002ba <terminal_putchar+0x104>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:174
            terminal_copyline(row, row+1);
        //memcpy((void *)TEXTMODE_MEMORY_START, (void *)TEXTMODE_MEMORY_START+160, 160*25);
        terminal_row--;
 10002d1:	83 2d 14 10 00 01 01 	sub    DWORD PTR ds:0x1001014,0x1
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:176
    }
    update_cursor();
 10002d8:	e8 23 fd ff ff       	call   1000000 <update_cursor>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:177
}
 10002dd:	83 c4 08             	add    esp,0x8
 10002e0:	5b                   	pop    ebx
 10002e1:	c3                   	ret    

010002e2 <cursorMoveTo>:
cursorMoveTo():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:182


void cursorMoveTo(uint8_t x, uint8_t y)
{
    terminal_row = y;
 10002e2:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
 10002e7:	a3 14 10 00 01       	mov    ds:0x1001014,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:183
    terminal_column = x;
 10002ec:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 10002f1:	a3 0c 10 00 01       	mov    ds:0x100100c,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:184
    update_cursor();
 10002f6:	e8 05 fd ff ff       	call   1000000 <update_cursor>
 10002fb:	f3 c3                	repz ret 

010002fd <cursorMoveToX>:
cursorMoveToX():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:189
}

void cursorMoveToX(uint8_t x)
{
    terminal_column = x;
 10002fd:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 1000302:	a3 0c 10 00 01       	mov    ds:0x100100c,eax
 1000307:	c3                   	ret    

01000308 <cursorMoveToY>:
cursorMoveToY():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:194
}

void cursorMoveToY(uint8_t y)
{
    terminal_row = y;
 1000308:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
 100030d:	a3 14 10 00 01       	mov    ds:0x1001014,eax
 1000312:	c3                   	ret    

01000313 <cursorGetPosX>:
cursorGetPosX():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:200
}

uint8_t cursorGetPosX()
{
    return terminal_column;
}
 1000313:	0f b6 05 0c 10 00 01 	movzx  eax,BYTE PTR ds:0x100100c
 100031a:	c3                   	ret    

0100031b <cursorGetPosY>:
cursorGetPosY():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:205

uint8_t cursorGetPosY()
{
    return terminal_row;
}
 100031b:	0f b6 05 14 10 00 01 	movzx  eax,BYTE PTR ds:0x1001014
 1000322:	c3                   	ret    

01000323 <kTermPrint>:
kTermPrint():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:207

void kTermPrint(const char* data) {
 1000323:	56                   	push   esi
 1000324:	53                   	push   ebx
 1000325:	83 ec 10             	sub    esp,0x10
 1000328:	8b 74 24 1c          	mov    esi,DWORD PTR [esp+0x1c]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:208
        size_t datalen = strlen(data);
 100032c:	56                   	push   esi
 100032d:	e8 4e 05 00 00       	call   1000880 <strlen>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:209
        for (size_t i = 0; i < datalen; i++)
 1000332:	83 c4 10             	add    esp,0x10
 1000335:	85 c0                	test   eax,eax
 1000337:	74 1a                	je     1000353 <kTermPrint+0x30>
 1000339:	89 f3                	mov    ebx,esi
 100033b:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:210 (discriminator 3)
                terminal_putchar(data[i]);
 100033d:	83 ec 0c             	sub    esp,0xc
 1000340:	0f be 13             	movsx  edx,BYTE PTR [ebx]
 1000343:	52                   	push   edx
 1000344:	e8 6d fe ff ff       	call   10001b6 <terminal_putchar>
 1000349:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:209 (discriminator 3)
    return terminal_row;
}

void kTermPrint(const char* data) {
        size_t datalen = strlen(data);
        for (size_t i = 0; i < datalen; i++)
 100034c:	83 c4 10             	add    esp,0x10
 100034f:	39 f3                	cmp    ebx,esi
 1000351:	75 ea                	jne    100033d <kTermPrint+0x1a>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:211
                terminal_putchar(data[i]);
}
 1000353:	83 c4 04             	add    esp,0x4
 1000356:	5b                   	pop    ebx
 1000357:	5e                   	pop    esi
 1000358:	c3                   	ret    

01000359 <kTermInit>:
kTermInit():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:215


void kTermInit() {
        terminal_row = 0;
 1000359:	c7 05 14 10 00 01 00 	mov    DWORD PTR ds:0x1001014,0x0
 1000360:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:216
        terminal_column = 0;
 1000363:	c7 05 0c 10 00 01 00 	mov    DWORD PTR ds:0x100100c,0x0
 100036a:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:217
        terminal_color = make_color(COLOR_LIGHT_BROWN, COLOR_BLACK);
 100036d:	c6 05 0a 10 00 01 0e 	mov    BYTE PTR ds:0x100100a,0xe
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/basic_display.c:218
        terminal_buffer = (uint16_t*) TEXTMODE_MEMORY_START;
 1000374:	c7 05 10 10 00 01 00 	mov    DWORD PTR ds:0x1001010,0xb8000
 100037b:	80 0b 00 
 100037e:	c3                   	ret    
 100037f:	90                   	nop

01000380 <printchar>:
printchar():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:39
#include "charDev.h"

static void printchar(char **str, int c)
{
	
	if (str) {
 1000380:	85 c0                	test   eax,eax
 1000382:	74 08                	je     100038c <printchar+0xc>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:40
		**str = c;
 1000384:	8b 08                	mov    ecx,DWORD PTR [eax]
 1000386:	88 11                	mov    BYTE PTR [ecx],dl
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:41
		++(*str);
 1000388:	83 00 01             	add    DWORD PTR [eax],0x1
 100038b:	c3                   	ret    
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:37
#include "charDev.h"

#include "charDev.h"

static void printchar(char **str, int c)
{
 100038c:	83 ec 18             	sub    esp,0x18
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:43
	
	if (str) {
		**str = c;
		++(*str);
	}
	else terminal_putchar((unsigned char)c);
 100038f:	0f be d2             	movsx  edx,dl
 1000392:	52                   	push   edx
 1000393:	e8 1e fe ff ff       	call   10001b6 <terminal_putchar>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:44
}
 1000398:	83 c4 1c             	add    esp,0x1c
 100039b:	c3                   	ret    

0100039c <prints>:
prints():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:50

#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
 100039c:	55                   	push   ebp
 100039d:	57                   	push   edi
 100039e:	56                   	push   esi
 100039f:	53                   	push   ebx
 10003a0:	83 ec 1c             	sub    esp,0x1c
 10003a3:	89 c7                	mov    edi,eax
 10003a5:	89 d6                	mov    esi,edx
 10003a7:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
 10003ab:	8b 54 24 30          	mov    edx,DWORD PTR [esp+0x30]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:53
	register int pc = 0, padchar = ' ';

	if (width > 0) {
 10003af:	85 c9                	test   ecx,ecx
 10003b1:	0f 8e cb 00 00 00    	jle    1000482 <prints+0xe6>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:56 (discriminator 1)
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
 10003b7:	80 3e 00             	cmp    BYTE PTR [esi],0x0
 10003ba:	74 1b                	je     10003d7 <prints+0x3b>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:56
 10003bc:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:56 (discriminator 3)
 10003c1:	83 c0 01             	add    eax,0x1
 10003c4:	80 3c 06 00          	cmp    BYTE PTR [esi+eax*1],0x0
 10003c8:	75 f7                	jne    10003c1 <prints+0x25>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:57
		if (len >= width) width = 0;
 10003ca:	bb 00 00 00 00       	mov    ebx,0x0
 10003cf:	39 44 24 0c          	cmp    DWORD PTR [esp+0xc],eax
 10003d3:	7e 0f                	jle    10003e4 <prints+0x48>
 10003d5:	eb 05                	jmp    10003dc <prints+0x40>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:56
	register int pc = 0, padchar = ' ';

	if (width > 0) {
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
 10003d7:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:58
		if (len >= width) width = 0;
		else width -= len;
 10003dc:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
 10003e0:	29 c1                	sub    ecx,eax
 10003e2:	89 cb                	mov    ebx,ecx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:59
		if (pad & PAD_ZERO) padchar = '0';
 10003e4:	89 d0                	mov    eax,edx
 10003e6:	83 e0 02             	and    eax,0x2
 10003e9:	83 f8 01             	cmp    eax,0x1
 10003ec:	19 ed                	sbb    ebp,ebp
 10003ee:	83 e5 f0             	and    ebp,0xfffffff0
 10003f1:	83 c5 30             	add    ebp,0x30
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:61
	}
	if (!(pad & PAD_RIGHT)) {
 10003f4:	f6 c2 01             	test   dl,0x1
 10003f7:	75 1a                	jne    1000413 <prints+0x77>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:62 (discriminator 1)
		for ( ; width > 0; --width) {
 10003f9:	85 db                	test   ebx,ebx
 10003fb:	7e 67                	jle    1000464 <prints+0xc8>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:62
 10003fd:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:63 (discriminator 2)
			printchar (out, padchar);
 1000401:	89 ea                	mov    edx,ebp
 1000403:	89 f8                	mov    eax,edi
 1000405:	e8 76 ff ff ff       	call   1000380 <printchar>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:62 (discriminator 2)
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
 100040a:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
 100040f:	75 f0                	jne    1000401 <prints+0x65>
 1000411:	eb 66                	jmp    1000479 <prints+0xdd>
 1000413:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:67 (discriminator 1)
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 1000417:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 100041a:	84 d2                	test   dl,dl
 100041c:	74 1e                	je     100043c <prints+0xa0>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:51
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 100041e:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:67 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 1000423:	29 de                	sub    esi,ebx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:68 (discriminator 2)
		printchar (out, *string);
 1000425:	0f be d2             	movsx  edx,dl
 1000428:	89 f8                	mov    eax,edi
 100042a:	e8 51 ff ff ff       	call   1000380 <printchar>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:69 (discriminator 2)
		++pc;
 100042f:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:67 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 1000432:	0f b6 14 1e          	movzx  edx,BYTE PTR [esi+ebx*1]
 1000436:	84 d2                	test   dl,dl
 1000438:	75 eb                	jne    1000425 <prints+0x89>
 100043a:	eb 05                	jmp    1000441 <prints+0xa5>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:51
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 100043c:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:71 (discriminator 1)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
 1000441:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1000445:	85 c0                	test   eax,eax
 1000447:	7e 45                	jle    100048e <prints+0xf2>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:71
 1000449:	89 c6                	mov    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:72 (discriminator 2)
		printchar (out, padchar);
 100044b:	89 ea                	mov    edx,ebp
 100044d:	89 f8                	mov    eax,edi
 100044f:	e8 2c ff ff ff       	call   1000380 <printchar>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:71 (discriminator 2)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
 1000454:	83 ee 01             	sub    esi,0x1
 1000457:	75 f2                	jne    100044b <prints+0xaf>
 1000459:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 100045d:	8d 04 03             	lea    eax,[ebx+eax*1]
 1000460:	89 c3                	mov    ebx,eax
 1000462:	eb 2a                	jmp    100048e <prints+0xf2>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:62
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
 1000464:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
 1000468:	bb 00 00 00 00       	mov    ebx,0x0
 100046d:	eb 0a                	jmp    1000479 <prints+0xdd>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:51
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 100046f:	bd 20 00 00 00       	mov    ebp,0x20
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:61
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
 1000474:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:67
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
 1000479:	0f b6 16             	movzx  edx,BYTE PTR [esi]
 100047c:	84 d2                	test   dl,dl
 100047e:	75 a3                	jne    1000423 <prints+0x87>
 1000480:	eb 0c                	jmp    100048e <prints+0xf2>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:61
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
 1000482:	f6 c2 01             	test   dl,0x1
 1000485:	74 e8                	je     100046f <prints+0xd3>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:51
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
 1000487:	bd 20 00 00 00       	mov    ebp,0x20
 100048c:	eb 89                	jmp    1000417 <prints+0x7b>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:77
		printchar (out, padchar);
		++pc;
	}

	return pc;
}
 100048e:	89 d8                	mov    eax,ebx
 1000490:	83 c4 1c             	add    esp,0x1c
 1000493:	5b                   	pop    ebx
 1000494:	5e                   	pop    esi
 1000495:	5f                   	pop    edi
 1000496:	5d                   	pop    ebp
 1000497:	c3                   	ret    

01000498 <printi>:
printi():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:83

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
 1000498:	55                   	push   ebp
 1000499:	57                   	push   edi
 100049a:	56                   	push   esi
 100049b:	53                   	push   ebx
 100049c:	83 ec 2c             	sub    esp,0x2c
 100049f:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:89
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;

	if (i == 0) {
 10004a3:	85 d2                	test   edx,edx
 10004a5:	75 2a                	jne    10004d1 <printi+0x39>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:90
		print_buf[0] = '0';
 10004a7:	c6 44 24 14 30       	mov    BYTE PTR [esp+0x14],0x30
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:91
		print_buf[1] = '\0';
 10004ac:	c6 44 24 15 00       	mov    BYTE PTR [esp+0x15],0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:92
		return prints (out, print_buf, width, pad);
 10004b1:	83 ec 0c             	sub    esp,0xc
 10004b4:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 10004b8:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
 10004bc:	8d 54 24 24          	lea    edx,[esp+0x24]
 10004c0:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 10004c4:	e8 d3 fe ff ff       	call   100039c <prints>
 10004c9:	83 c4 10             	add    esp,0x10
 10004cc:	e9 f1 00 00 00       	jmp    10005c2 <printi+0x12a>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:95
	}

	if (sg && b == 10 && i < 0) {
 10004d1:	83 7c 24 40 00       	cmp    DWORD PTR [esp+0x40],0x0
 10004d6:	0f 95 c3             	setne  bl
 10004d9:	83 f9 0a             	cmp    ecx,0xa
 10004dc:	0f 94 c0             	sete   al
 10004df:	84 c3                	test   bl,al
 10004e1:	0f 84 c1 00 00 00    	je     10005a8 <printi+0x110>
 10004e7:	89 d0                	mov    eax,edx
 10004e9:	c1 e8 1f             	shr    eax,0x1f
 10004ec:	84 c0                	test   al,al
 10004ee:	0f 84 b4 00 00 00    	je     10005a8 <printi+0x110>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:101
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
 10004f4:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:100
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
 10004f9:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:103
	*s = '\0';

	while (u) {
 10004fd:	89 d3                	mov    ebx,edx
 10004ff:	f7 db                	neg    ebx
 1000501:	74 54                	je     1000557 <printi+0xbf>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:96
		print_buf[1] = '\0';
		return prints (out, print_buf, width, pad);
	}

	if (sg && b == 10 && i < 0) {
		neg = 1;
 1000503:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
 100050a:	00 
 100050b:	eb 08                	jmp    1000515 <printi+0x7d>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:86

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 100050d:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
 1000514:	00 
 1000515:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:104

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
 1000519:	89 cf                	mov    edi,ecx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:106
		if( t >= 10 )
			t += letbase - '0' - 10;
 100051b:	8b 44 24 4c          	mov    eax,DWORD PTR [esp+0x4c]
 100051f:	8d 68 c6             	lea    ebp,[eax-0x3a]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:104

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
 1000522:	89 d8                	mov    eax,ebx
 1000524:	ba 00 00 00 00       	mov    edx,0x0
 1000529:	f7 f1                	div    ecx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:106
		if( t >= 10 )
			t += letbase - '0' - 10;
 100052b:	8d 04 2a             	lea    eax,[edx+ebp*1]
 100052e:	83 fa 0a             	cmp    edx,0xa
 1000531:	0f 4c c2             	cmovl  eax,edx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:107
		*--s = t + '0';
 1000534:	83 ee 01             	sub    esi,0x1
 1000537:	83 c0 30             	add    eax,0x30
 100053a:	88 06                	mov    BYTE PTR [esi],al
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:108
		u /= b;
 100053c:	89 d8                	mov    eax,ebx
 100053e:	ba 00 00 00 00       	mov    edx,0x0
 1000543:	f7 f7                	div    edi
 1000545:	89 c3                	mov    ebx,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:103
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
 1000547:	85 c0                	test   eax,eax
 1000549:	75 d7                	jne    1000522 <printi+0x8a>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:86

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 100054b:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:111
			t += letbase - '0' - 10;
		*--s = t + '0';
		u /= b;
	}

	if (neg) {
 1000550:	83 7c 24 0c 00       	cmp    DWORD PTR [esp+0xc],0x0
 1000555:	74 34                	je     100058b <printi+0xf3>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:112
		if( width && (pad & PAD_ZERO) ) {
 1000557:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
 100055c:	74 21                	je     100057f <printi+0xe7>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:112 (discriminator 1)
 100055e:	f6 44 24 48 02       	test   BYTE PTR [esp+0x48],0x2
 1000563:	74 1a                	je     100057f <printi+0xe7>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:113
			printchar (out, '-');
 1000565:	ba 2d 00 00 00       	mov    edx,0x2d
 100056a:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
 100056e:	e8 0d fe ff ff       	call   1000380 <printchar>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:115
			++pc;
			--width;
 1000573:	83 6c 24 44 01       	sub    DWORD PTR [esp+0x44],0x1
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:114
	}

	if (neg) {
		if( width && (pad & PAD_ZERO) ) {
			printchar (out, '-');
			++pc;
 1000578:	bb 01 00 00 00       	mov    ebx,0x1
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:115
			--width;
 100057d:	eb 0c                	jmp    100058b <printi+0xf3>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:118
		}
		else {
			*--s = '-';
 100057f:	c6 46 ff 2d          	mov    BYTE PTR [esi-0x1],0x2d
 1000583:	8d 76 ff             	lea    esi,[esi-0x1]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:86

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 1000586:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:122
		else {
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
 100058b:	83 ec 0c             	sub    esp,0xc
 100058e:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
 1000592:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
 1000596:	89 f2                	mov    edx,esi
 1000598:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
 100059c:	e8 fb fd ff ff       	call   100039c <prints>
 10005a1:	01 d8                	add    eax,ebx
 10005a3:	83 c4 10             	add    esp,0x10
 10005a6:	eb 1a                	jmp    10005c2 <printi+0x12a>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:87
static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;
 10005a8:	89 d3                	mov    ebx,edx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:101
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
 10005aa:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:103

	while (u) {
 10005af:	85 d2                	test   edx,edx
 10005b1:	0f 85 56 ff ff ff    	jne    100050d <printi+0x75>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:86

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
 10005b7:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:100
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
 10005bc:	8d 74 24 1f          	lea    esi,[esp+0x1f]
 10005c0:	eb c9                	jmp    100058b <printi+0xf3>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:123
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
}
 10005c2:	83 c4 2c             	add    esp,0x2c
 10005c5:	5b                   	pop    ebx
 10005c6:	5e                   	pop    esi
 10005c7:	5f                   	pop    edi
 10005c8:	5d                   	pop    ebp
 10005c9:	c3                   	ret    

010005ca <print>:
print():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:126

static int print(char **out, const char *format, va_list args )
{
 10005ca:	55                   	push   ebp
 10005cb:	57                   	push   edi
 10005cc:	56                   	push   esi
 10005cd:	53                   	push   ebx
 10005ce:	83 ec 2c             	sub    esp,0x2c
 10005d1:	89 c7                	mov    edi,eax
 10005d3:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:131
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
 10005d7:	0f b6 02             	movzx  eax,BYTE PTR [edx]
 10005da:	84 c0                	test   al,al
 10005dc:	0f 84 b8 01 00 00    	je     100079a <print+0x1d0>
 10005e2:	89 d5                	mov    ebp,edx
 10005e4:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:132
		if (*format == '%') {
 10005e9:	3c 25                	cmp    al,0x25
 10005eb:	0f 85 88 01 00 00    	jne    1000779 <print+0x1af>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:133
			++format;
 10005f1:	8d 5d 01             	lea    ebx,[ebp+0x1]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:135
			width = pad = 0;
			if (*format == '\0') break;
 10005f4:	0f b6 55 01          	movzx  edx,BYTE PTR [ebp+0x1]
 10005f8:	84 d2                	test   dl,dl
 10005fa:	0f 84 9f 01 00 00    	je     100079f <print+0x1d5>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:136
			if (*format == '%') goto out;
 1000600:	80 fa 25             	cmp    dl,0x25
 1000603:	0f 84 6e 01 00 00    	je     1000777 <print+0x1ad>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:134
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
			width = pad = 0;
 1000609:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:137
			if (*format == '\0') break;
			if (*format == '%') goto out;
			if (*format == '-') {
 100060e:	80 fa 2d             	cmp    dl,0x2d
 1000611:	75 08                	jne    100061b <print+0x51>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:138
				++format;
 1000613:	8d 5d 02             	lea    ebx,[ebp+0x2]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:139
				pad = PAD_RIGHT;
 1000616:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:141
			}
			while (*format == '0') {
 100061b:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
 100061e:	75 0b                	jne    100062b <print+0x61>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:142
				++format;
 1000620:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:143
				pad |= PAD_ZERO;
 1000623:	83 c8 02             	or     eax,0x2
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:141
			if (*format == '%') goto out;
			if (*format == '-') {
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0') {
 1000626:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
 1000629:	74 f5                	je     1000620 <print+0x56>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:145 (discriminator 1)
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
 100062b:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
 100062e:	8d 4a d0             	lea    ecx,[edx-0x30]
 1000631:	80 f9 09             	cmp    cl,0x9
 1000634:	77 22                	ja     1000658 <print+0x8e>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:145
 1000636:	b9 00 00 00 00       	mov    ecx,0x0
 100063b:	89 c5                	mov    ebp,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:146 (discriminator 2)
				width *= 10;
 100063d:	8d 04 89             	lea    eax,[ecx+ecx*4]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:147 (discriminator 2)
				width += *format - '0';
 1000640:	0f be d2             	movsx  edx,dl
 1000643:	8d 4c 42 d0          	lea    ecx,[edx+eax*2-0x30]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:145 (discriminator 2)
			}
			while (*format == '0') {
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
 1000647:	83 c3 01             	add    ebx,0x1
 100064a:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
 100064d:	8d 42 d0             	lea    eax,[edx-0x30]
 1000650:	3c 09                	cmp    al,0x9
 1000652:	76 e9                	jbe    100063d <print+0x73>
 1000654:	89 e8                	mov    eax,ebp
 1000656:	eb 05                	jmp    100065d <print+0x93>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:145
 1000658:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:149
				width *= 10;
				width += *format - '0';
			}
			if( *format == 's' ) {
 100065d:	80 fa 73             	cmp    dl,0x73
 1000660:	75 2c                	jne    100068e <print+0xc4>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:150
				register char *s = (char *)va_arg( args, int );
 1000662:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 1000666:	8d 6a 04             	lea    ebp,[edx+0x4]
 1000669:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 100066d:	8b 12                	mov    edx,DWORD PTR [edx]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:151
				pc += prints (out, s?s:"(null)", width, pad);
 100066f:	85 d2                	test   edx,edx
 1000671:	bd ec 0d 00 01       	mov    ebp,0x1000dec
 1000676:	0f 44 d5             	cmove  edx,ebp
 1000679:	83 ec 0c             	sub    esp,0xc
 100067c:	50                   	push   eax
 100067d:	89 f8                	mov    eax,edi
 100067f:	e8 18 fd ff ff       	call   100039c <prints>
 1000684:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:152
				continue;
 1000686:	83 c4 10             	add    esp,0x10
 1000689:	e9 fb 00 00 00       	jmp    1000789 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:154
			}
			if( *format == 'd' ) {
 100068e:	80 fa 64             	cmp    dl,0x64
 1000691:	75 29                	jne    10006bc <print+0xf2>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:155
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
 1000693:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 1000697:	8d 6a 04             	lea    ebp,[edx+0x4]
 100069a:	6a 61                	push   0x61
 100069c:	50                   	push   eax
 100069d:	51                   	push   ecx
 100069e:	6a 01                	push   0x1
 10006a0:	b9 0a 00 00 00       	mov    ecx,0xa
 10006a5:	8b 12                	mov    edx,DWORD PTR [edx]
 10006a7:	89 f8                	mov    eax,edi
 10006a9:	e8 ea fd ff ff       	call   1000498 <printi>
 10006ae:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:156
				continue;
 10006b0:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:155
				register char *s = (char *)va_arg( args, int );
				pc += prints (out, s?s:"(null)", width, pad);
				continue;
			}
			if( *format == 'd' ) {
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
 10006b3:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:156
				continue;
 10006b7:	e9 cd 00 00 00       	jmp    1000789 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:158
			}
			if( *format == 'x' ) {
 10006bc:	80 fa 78             	cmp    dl,0x78
 10006bf:	75 2b                	jne    10006ec <print+0x122>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:159
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
 10006c1:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 10006c5:	89 ea                	mov    edx,ebp
 10006c7:	83 c5 04             	add    ebp,0x4
 10006ca:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 10006ce:	6a 61                	push   0x61
 10006d0:	50                   	push   eax
 10006d1:	51                   	push   ecx
 10006d2:	6a 00                	push   0x0
 10006d4:	b9 10 00 00 00       	mov    ecx,0x10
 10006d9:	8b 12                	mov    edx,DWORD PTR [edx]
 10006db:	89 f8                	mov    eax,edi
 10006dd:	e8 b6 fd ff ff       	call   1000498 <printi>
 10006e2:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:160
				continue;
 10006e4:	83 c4 10             	add    esp,0x10
 10006e7:	e9 9d 00 00 00       	jmp    1000789 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:162
			}
			if( *format == 'X' ) {
 10006ec:	80 fa 58             	cmp    dl,0x58
 10006ef:	75 26                	jne    1000717 <print+0x14d>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:163
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
 10006f1:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
 10006f5:	8d 6a 04             	lea    ebp,[edx+0x4]
 10006f8:	6a 41                	push   0x41
 10006fa:	50                   	push   eax
 10006fb:	51                   	push   ecx
 10006fc:	6a 00                	push   0x0
 10006fe:	b9 10 00 00 00       	mov    ecx,0x10
 1000703:	8b 12                	mov    edx,DWORD PTR [edx]
 1000705:	89 f8                	mov    eax,edi
 1000707:	e8 8c fd ff ff       	call   1000498 <printi>
 100070c:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:164
				continue;
 100070e:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:163
			if( *format == 'x' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
				continue;
			}
			if( *format == 'X' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
 1000711:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:164
				continue;
 1000715:	eb 72                	jmp    1000789 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:166
			}
			if( *format == 'u' ) {
 1000717:	80 fa 75             	cmp    dl,0x75
 100071a:	75 28                	jne    1000744 <print+0x17a>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:167
				pc += printi (out, va_arg( args, int ), 10, 0, width, pad, 'a');
 100071c:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 1000720:	89 ea                	mov    edx,ebp
 1000722:	83 c5 04             	add    ebp,0x4
 1000725:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 1000729:	6a 61                	push   0x61
 100072b:	50                   	push   eax
 100072c:	51                   	push   ecx
 100072d:	6a 00                	push   0x0
 100072f:	b9 0a 00 00 00       	mov    ecx,0xa
 1000734:	8b 12                	mov    edx,DWORD PTR [edx]
 1000736:	89 f8                	mov    eax,edi
 1000738:	e8 5b fd ff ff       	call   1000498 <printi>
 100073d:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:168
				continue;
 100073f:	83 c4 10             	add    esp,0x10
 1000742:	eb 45                	jmp    1000789 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:170
			}
			if( *format == 'c' ) {
 1000744:	80 fa 63             	cmp    dl,0x63
 1000747:	75 40                	jne    1000789 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:172
				/* char are converted to int then pushed on the stack */
				scr[0] = (char)va_arg( args, int );
 1000749:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
 100074d:	89 ea                	mov    edx,ebp
 100074f:	83 c5 04             	add    ebp,0x4
 1000752:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
 1000756:	8b 12                	mov    edx,DWORD PTR [edx]
 1000758:	88 54 24 1e          	mov    BYTE PTR [esp+0x1e],dl
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:173
				scr[1] = '\0';
 100075c:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:174
				pc += prints (out, scr, width, pad);
 1000761:	83 ec 0c             	sub    esp,0xc
 1000764:	50                   	push   eax
 1000765:	8d 54 24 2e          	lea    edx,[esp+0x2e]
 1000769:	89 f8                	mov    eax,edi
 100076b:	e8 2c fc ff ff       	call   100039c <prints>
 1000770:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:175
				continue;
 1000772:	83 c4 10             	add    esp,0x10
 1000775:	eb 12                	jmp    1000789 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:133
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
 1000777:	89 dd                	mov    ebp,ebx
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:180
				continue;
			}
		}
		else {
		out:
			printchar (out, *format);
 1000779:	0f be 55 00          	movsx  edx,BYTE PTR [ebp+0x0]
 100077d:	89 f8                	mov    eax,edi
 100077f:	e8 fc fb ff ff       	call   1000380 <printchar>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:181
			++pc;
 1000784:	83 c6 01             	add    esi,0x1
 1000787:	89 eb                	mov    ebx,ebp
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:131
{
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
 1000789:	8d 6b 01             	lea    ebp,[ebx+0x1]
 100078c:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
 1000790:	84 c0                	test   al,al
 1000792:	0f 85 51 fe ff ff    	jne    10005e9 <print+0x1f>
 1000798:	eb 05                	jmp    100079f <print+0x1d5>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:128
}

static int print(char **out, const char *format, va_list args )
{
	register int width, pad;
	register int pc = 0;
 100079a:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:184
		out:
			printchar (out, *format);
			++pc;
		}
	}
	if (out) **out = '\0';
 100079f:	85 ff                	test   edi,edi
 10007a1:	74 05                	je     10007a8 <print+0x1de>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:184 (discriminator 1)
 10007a3:	8b 07                	mov    eax,DWORD PTR [edi]
 10007a5:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:187
	va_end( args );
	return pc;
}
 10007a8:	89 f0                	mov    eax,esi
 10007aa:	83 c4 2c             	add    esp,0x2c
 10007ad:	5b                   	pop    ebx
 10007ae:	5e                   	pop    esi
 10007af:	5f                   	pop    edi
 10007b0:	5d                   	pop    ebp
 10007b1:	c3                   	ret    

010007b2 <printk_valist>:
printk_valist():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:190

int printk_valist(const char *format, va_list args)
{
 10007b2:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:191
    return print(0, format, args);
 10007b5:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
 10007b9:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
 10007bd:	b8 00 00 00 00       	mov    eax,0x0
 10007c2:	e8 03 fe ff ff       	call   10005ca <print>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:192
}
 10007c7:	83 c4 0c             	add    esp,0xc
 10007ca:	c3                   	ret    

010007cb <printk>:
printk():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:195

int printk(const char *format, ...)
{
 10007cb:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:198
        va_list args;
        
        va_start( args, format );
 10007ce:	8d 44 24 14          	lea    eax,[esp+0x14]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:199
        return printk_valist(format, args);
 10007d2:	83 ec 08             	sub    esp,0x8
 10007d5:	50                   	push   eax
 10007d6:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 10007da:	e8 d3 ff ff ff       	call   10007b2 <printk_valist>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:200
}
 10007df:	83 c4 1c             	add    esp,0x1c
 10007e2:	c3                   	ret    

010007e3 <sprintf>:
sprintf():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:203

int sprintf(char *out, const char *format, ...)
{
 10007e3:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:207
        va_list args;
        
        va_start( args, format );
        return print( &out, format, args );
 10007e6:	8d 4c 24 18          	lea    ecx,[esp+0x18]
 10007ea:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
 10007ee:	8d 44 24 10          	lea    eax,[esp+0x10]
 10007f2:	e8 d3 fd ff ff       	call   10005ca <print>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/char/console/printf1.c:208
}
 10007f7:	83 c4 0c             	add    esp,0xc
 10007fa:	c3                   	ret    
 10007fb:	90                   	nop

010007fc <memcpy>:
memcpy():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/memcpy.c:7

/*
 * This is designed to be small, not fast.
 */
void * memcpy(void *s1, const void *s2, size_t n)
{
 10007fc:	56                   	push   esi
 10007fd:	53                   	push   ebx
 10007fe:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
 1000802:	8b 4c 24 10          	mov    ecx,DWORD PTR [esp+0x10]
 1000806:	8b 74 24 14          	mov    esi,DWORD PTR [esp+0x14]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/memcpy.c:11
	const char *f = s2;
	char *t = s1;

	if (f < t) {
 100080a:	39 c1                	cmp    ecx,eax
 100080c:	72 0b                	jb     1000819 <memcpy+0x1d>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/memcpy.c:17
		f += n;
		t += n;
		while (n-- > 0)
			*--t = *--f;
	} else
		while (n-- > 0)
 100080e:	ba 00 00 00 00       	mov    edx,0x0
 1000813:	85 f6                	test   esi,esi
 1000815:	75 1a                	jne    1000831 <memcpy+0x35>
 1000817:	eb 26                	jmp    100083f <memcpy+0x43>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/memcpy.c:14
	char *t = s1;

	if (f < t) {
		f += n;
		t += n;
		while (n-- > 0)
 1000819:	8d 56 ff             	lea    edx,[esi-0x1]
 100081c:	85 f6                	test   esi,esi
 100081e:	74 1f                	je     100083f <memcpy+0x43>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/memcpy.c:15
			*--t = *--f;
 1000820:	0f b6 1c 11          	movzx  ebx,BYTE PTR [ecx+edx*1]
 1000824:	88 1c 10             	mov    BYTE PTR [eax+edx*1],bl
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/memcpy.c:14
	char *t = s1;

	if (f < t) {
		f += n;
		t += n;
		while (n-- > 0)
 1000827:	83 ea 01             	sub    edx,0x1
 100082a:	83 fa ff             	cmp    edx,0xffffffff
 100082d:	75 f1                	jne    1000820 <memcpy+0x24>
 100082f:	eb 0e                	jmp    100083f <memcpy+0x43>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/memcpy.c:18
			*--t = *--f;
	} else
		while (n-- > 0)
			*t++ = *f++;
 1000831:	0f b6 1c 11          	movzx  ebx,BYTE PTR [ecx+edx*1]
 1000835:	88 1c 10             	mov    BYTE PTR [eax+edx*1],bl
 1000838:	83 c2 01             	add    edx,0x1
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/memcpy.c:17
		f += n;
		t += n;
		while (n-- > 0)
			*--t = *--f;
	} else
		while (n-- > 0)
 100083b:	39 d6                	cmp    esi,edx
 100083d:	75 f2                	jne    1000831 <memcpy+0x35>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/memcpy.c:20
			*t++ = *f++;
	return s1;
 100083f:	5b                   	pop    ebx
 1000840:	5e                   	pop    esi
 1000841:	c3                   	ret    
 1000842:	66 90                	xchg   ax,ax

01000844 <panic>:
panic():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/panic.c:8
#include <stdarg.h>
#include <time.h>
#include "utility.h"

void __attribute__((noinline))panic(const char *format, ...)
{
 1000844:	53                   	push   ebx
 1000845:	83 ec 08             	sub    esp,0x8
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/panic.c:10
    va_list args;
    va_start( args, format );
 1000848:	8d 5c 24 14          	lea    ebx,[esp+0x14]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/panic.c:11
    printk("\n>>>panic at instruction prior to address 0x%08X<<<\n", __builtin_return_address(0));
 100084c:	83 ec 08             	sub    esp,0x8
 100084f:	ff 74 24 14          	push   DWORD PTR [esp+0x14]
 1000853:	68 fc 0d 00 01       	push   0x1000dfc
 1000858:	e8 6e ff ff ff       	call   10007cb <printk>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/panic.c:12
    printk("  >>>");
 100085d:	c7 04 24 f3 0d 00 01 	mov    DWORD PTR [esp],0x1000df3
 1000864:	e8 62 ff ff ff       	call   10007cb <printk>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/panic.c:13
    printk_valist( format,args);
 1000869:	83 c4 08             	add    esp,0x8
 100086c:	53                   	push   ebx
 100086d:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
 1000871:	e8 3c ff ff ff       	call   10007b2 <printk_valist>
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/panic.c:14
    STOPHERE2
 1000876:	fa                   	cli    
 1000877:	f4                   	hlt    
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/panic.c:15
}
 1000878:	83 c4 18             	add    esp,0x18
 100087b:	5b                   	pop    ebx
 100087c:	c3                   	ret    
 100087d:	66 90                	xchg   ax,ax
 100087f:	90                   	nop

01000880 <strlen>:
strlen():
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/strings/strlen.c:3
#include <stddef.h>

size_t strlen(const char* str) {
 1000880:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/strings/strlen.c:5
          size_t ret = 0;
        while ( str[ret] != 0 )
 1000884:	80 3a 00             	cmp    BYTE PTR [edx],0x0
 1000887:	74 10                	je     1000899 <strlen+0x19>
 1000889:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/strings/strlen.c:6
                ret++;
 100088e:	83 c0 01             	add    eax,0x1
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/strings/strlen.c:5
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
 1000891:	80 3c 02 00          	cmp    BYTE PTR [edx+eax*1],0x0
 1000895:	75 f7                	jne    100088e <strlen+0xe>
 1000897:	f3 c3                	repz ret 
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/strings/strlen.c:4
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
 1000899:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld2/../chrisOS/src/strings/strlen.c:8
        while ( str[ret] != 0 )
                ret++;
        return ret;
}
 100089e:	c3                   	ret    
 100089f:	90                   	nop

010008a0 <main>:
main():
/home/yogi/NetBeansProjects/myHelloWorld2/main.c:14
#include <stdlib.h>

/*
 * myHelloWorld2
 */
void main() {
 10008a0:	8d 4c 24 04          	lea    ecx,[esp+0x4]
 10008a4:	83 e4 f0             	and    esp,0xfffffff0
 10008a7:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
 10008aa:	55                   	push   ebp
 10008ab:	89 e5                	mov    ebp,esp
 10008ad:	51                   	push   ecx
 10008ae:	83 ec 04             	sub    esp,0x4

010008b1 <_start>:
/home/yogi/NetBeansProjects/myHelloWorld2/main.c:16
__asm__(".global _start\n .type _start, @function \n_start:\n" );
    kTermInit();
 10008b1:	e8 a3 fa ff ff       	call   1000359 <kTermInit>
/home/yogi/NetBeansProjects/myHelloWorld2/main.c:17
    cursorMoveTo(1,46);
 10008b6:	83 ec 08             	sub    esp,0x8
 10008b9:	6a 2e                	push   0x2e
 10008bb:	6a 01                	push   0x1
 10008bd:	e8 20 fa ff ff       	call   10002e2 <cursorMoveTo>
/home/yogi/NetBeansProjects/myHelloWorld2/main.c:18
    printk("myHelloWorld 2 loaded, doing nothing!\n");
 10008c2:	c7 04 24 34 0e 00 01 	mov    DWORD PTR [esp],0x1000e34
 10008c9:	e8 fd fe ff ff       	call   10007cb <printk>
/home/yogi/NetBeansProjects/myHelloWorld2/main.c:20
    //return (EXIT_SUCCESS);
}
 10008ce:	83 c4 10             	add    esp,0x10
 10008d1:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
 10008d4:	c9                   	leave  
 10008d5:	8d 61 fc             	lea    esp,[ecx-0x4]
 10008d8:	c3                   	ret    
_start():
 10008d9:	66 90                	xchg   ax,ax
 10008db:	90                   	nop
