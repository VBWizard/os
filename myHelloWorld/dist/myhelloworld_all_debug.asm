
Debug/cross-Linux/myhelloworld:     file format elf32-i386


Disassembly of section .text:

10000000 <update_cursor>:
update_cursor():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:26
KERNEL_DATA_SECTION int8_t savedPosPointer=0;
KERNEL_DATA_SECTION uint8_t kTerminalHeight;

void update_cursor()
 {
    unsigned short position=(terminal_row*VGA_WIDTH) + terminal_column;
10000000:	8b 0d 00 00 10 00    	mov    ecx,DWORD PTR ds:0x100000
10000006:	8d 0c 89             	lea    ecx,[ecx+ecx*4]
10000009:	c1 e1 04             	shl    ecx,0x4
1000000c:	66 03 0d 04 00 10 00 	add    cx,WORD PTR ds:0x100004
outb():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
10000013:	ba d4 03 00 00       	mov    edx,0x3d4
10000018:	b8 0f 00 00 00       	mov    eax,0xf
1000001d:	ee                   	out    dx,al
1000001e:	ba d5 03 00 00       	mov    edx,0x3d5
10000023:	89 c8                	mov    eax,ecx
10000025:	ee                   	out    dx,al
10000026:	ba d4 03 00 00       	mov    edx,0x3d4
1000002b:	b8 0e 00 00 00       	mov    eax,0xe
10000030:	ee                   	out    dx,al
10000031:	89 c8                	mov    eax,ecx
10000033:	66 c1 e8 08          	shr    ax,0x8
10000037:	ba d5 03 00 00       	mov    edx,0x3d5
1000003c:	ee                   	out    dx,al
1000003d:	c3                   	ret    

1000003e <make_color>:
make_color():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:38
    outb(0x3D5, (unsigned char )((position>>8)&0xFF));
    //Move the cursor in the bios data area
 }

uint8_t make_color(enum vga_color fg, enum vga_color bg) {
        return fg | bg << 4;
1000003e:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
10000043:	c1 e0 04             	shl    eax,0x4
10000046:	0a 44 24 04          	or     al,BYTE PTR [esp+0x4]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:39
}
1000004a:	c3                   	ret    

1000004b <make_vgaentry>:
make_vgaentry():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:44

uint16_t make_vgaentry(char c, uint8_t color) {
        uint16_t c16 = c;
        uint16_t color16 = color;
        return c16 | color16 << 8;
1000004b:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
10000050:	c1 e0 08             	shl    eax,0x8
10000053:	66 0f be 54 24 04    	movsx  dx,BYTE PTR [esp+0x4]
10000059:	09 d0                	or     eax,edx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:45
}
1000005b:	c3                   	ret    

1000005c <terminal_setcolor>:
terminal_setcolor():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:49


void terminal_setcolor(uint8_t color) {
        terminal_color = color;
1000005c:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
10000060:	a2 08 00 10 00       	mov    ds:0x100008,al
10000065:	c3                   	ret    

10000066 <terminal_putentryat>:
terminal_putentryat():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:52
}

void terminal_putentryat(char c, uint8_t color, size_t x, size_t y) {
10000066:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:54
    const size_t index = y * VGA_WIDTH + x;
        terminal_buffer[index] = make_vgaentry(c, color);
1000006a:	8d 04 80             	lea    eax,[eax+eax*4]
1000006d:	c1 e0 04             	shl    eax,0x4
10000070:	03 44 24 0c          	add    eax,DWORD PTR [esp+0xc]
10000074:	0f b6 54 24 08       	movzx  edx,BYTE PTR [esp+0x8]
10000079:	c1 e2 08             	shl    edx,0x8
1000007c:	66 0f be 4c 24 04    	movsx  cx,BYTE PTR [esp+0x4]
10000082:	09 ca                	or     edx,ecx
10000084:	8b 0d 0c 00 10 00    	mov    ecx,DWORD PTR ds:0x10000c
1000008a:	66 89 14 41          	mov    WORD PTR [ecx+eax*2],dx
1000008e:	c3                   	ret    

1000008f <cursorSavePosition>:
cursorSavePosition():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:59
}

void cursorSavePosition()
{
    if (savedPosPointer < 10)
1000008f:	0f b6 05 26 00 10 00 	movzx  eax,BYTE PTR ds:0x100026
10000096:	3c 09                	cmp    al,0x9
10000098:	7f 23                	jg     100000bd <cursorSavePosition+0x2e>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:61
    {
        savedPosX[++savedPosPointer] = terminal_column;
1000009a:	83 c0 01             	add    eax,0x1
1000009d:	a2 26 00 10 00       	mov    ds:0x100026,al
100000a2:	0f be c0             	movsx  eax,al
100000a5:	8b 15 04 00 10 00    	mov    edx,DWORD PTR ds:0x100004
100000ab:	88 90 10 00 10 00    	mov    BYTE PTR [eax+0x100010],dl
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:62
        savedPosY[savedPosPointer] = terminal_row;
100000b1:	8b 15 00 00 10 00    	mov    edx,DWORD PTR ds:0x100000
100000b7:	88 90 1c 00 10 00    	mov    BYTE PTR [eax+0x10001c],dl
100000bd:	f3 c3                	repz ret 

100000bf <cursorRestorePosition>:
cursorRestorePosition():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:68
    }
}

void cursorRestorePosition()
{
    if (savedPosPointer > 0)
100000bf:	0f b6 05 26 00 10 00 	movzx  eax,BYTE PTR ds:0x100026
100000c6:	84 c0                	test   al,al
100000c8:	7e 29                	jle    100000f3 <cursorRestorePosition+0x34>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:70
    {
        terminal_column = savedPosX[savedPosPointer];
100000ca:	0f be d0             	movsx  edx,al
100000cd:	0f b6 8a 10 00 10 00 	movzx  ecx,BYTE PTR [edx+0x100010]
100000d4:	89 0d 04 00 10 00    	mov    DWORD PTR ds:0x100004,ecx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:71
        terminal_row = savedPosY[savedPosPointer--];
100000da:	83 e8 01             	sub    eax,0x1
100000dd:	a2 26 00 10 00       	mov    ds:0x100026,al
100000e2:	0f b6 82 1c 00 10 00 	movzx  eax,BYTE PTR [edx+0x10001c]
100000e9:	a3 00 00 10 00       	mov    ds:0x100000,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:72
        update_cursor();
100000ee:	e8 0d ff ff ff       	call   10000000 <update_cursor>
100000f3:	f3 c3                	repz ret 

100000f5 <terminal_clear>:
terminal_clear():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:77
    }
}

void terminal_clear()
{
100000f5:	56                   	push   esi
100000f6:	53                   	push   ebx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:79
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
100000f7:	ba 00 00 00 00       	mov    edx,0x0
100000fc:	be 00 00 00 00       	mov    esi,0x0
10000101:	80 3d 27 00 10 00 00 	cmp    BYTE PTR ds:0x100027,0x0
10000108:	75 30                	jne    1000013a <terminal_clear+0x45>
1000010a:	eb 36                	jmp    10000142 <terminal_clear+0x4d>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:82 (discriminator 3)
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
1000010c:	0f b6 05 08 00 10 00 	movzx  eax,BYTE PTR ds:0x100008
10000113:	c1 e0 08             	shl    eax,0x8
10000116:	83 c8 20             	or     eax,0x20
10000119:	8b 0d 0c 00 10 00    	mov    ecx,DWORD PTR ds:0x10000c
1000011f:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
10000123:	83 c2 02             	add    edx,0x2
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:80 (discriminator 3)

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
                for (size_t x = 0; x < VGA_WIDTH; x++) {
10000126:	39 d3                	cmp    ebx,edx
10000128:	75 e2                	jne    1000010c <terminal_clear+0x17>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:79 (discriminator 2)
}

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
1000012a:	83 c6 01             	add    esi,0x1
1000012d:	89 da                	mov    edx,ebx
1000012f:	0f b6 05 27 00 10 00 	movzx  eax,BYTE PTR ds:0x100027
10000136:	39 f0                	cmp    eax,esi
10000138:	76 08                	jbe    10000142 <terminal_clear+0x4d>
1000013a:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
10000140:	eb ca                	jmp    1000010c <terminal_clear+0x17>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:85
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
                }
        }
    terminal_column=0;
10000142:	c7 05 04 00 10 00 00 	mov    DWORD PTR ds:0x100004,0x0
10000149:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:86
    terminal_row=0;
1000014c:	c7 05 00 00 10 00 00 	mov    DWORD PTR ds:0x100000,0x0
10000153:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:87
    update_cursor();
10000156:	e8 a5 fe ff ff       	call   10000000 <update_cursor>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:88
}
1000015b:	5b                   	pop    ebx
1000015c:	5e                   	pop    esi
1000015d:	c3                   	ret    

1000015e <terminal_clear_line>:
terminal_clear_line():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:91

void terminal_clear_line(unsigned lineNo)
{
1000015e:	53                   	push   ebx
1000015f:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:92
    if (lineNo>SYS_VGA_HEIGHT-1)
10000163:	83 f8 31             	cmp    eax,0x31
10000166:	77 2a                	ja     10000192 <terminal_clear_line+0x34>
10000168:	8d 14 80             	lea    edx,[eax+eax*4]
1000016b:	c1 e2 05             	shl    edx,0x5
1000016e:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:97 (discriminator 3)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
10000174:	0f b6 05 08 00 10 00 	movzx  eax,BYTE PTR ds:0x100008
1000017b:	c1 e0 08             	shl    eax,0x8
1000017e:	83 c8 20             	or     eax,0x20
10000181:	8b 0d 0c 00 10 00    	mov    ecx,DWORD PTR ds:0x10000c
10000187:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
1000018b:	83 c2 02             	add    edx,0x2
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:94 (discriminator 3)

void terminal_clear_line(unsigned lineNo)
{
    if (lineNo>SYS_VGA_HEIGHT-1)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
1000018e:	39 da                	cmp    edx,ebx
10000190:	75 e2                	jne    10000174 <terminal_clear_line+0x16>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:99
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
    }
}
10000192:	5b                   	pop    ebx
10000193:	c3                   	ret    

10000194 <terminal_copyline>:
terminal_copyline():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:102

void terminal_copyline(unsigned dstLine, unsigned srcLine)
{
10000194:	83 ec 10             	sub    esp,0x10
10000197:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
1000019b:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:107
    unsigned rowBytes = VGA_WIDTH*2;
    uintptr_t dest=(uintptr_t)TEXTMODE_MEMORY_START+(dstLine*rowBytes);
    uintptr_t src=(uintptr_t)TEXTMODE_MEMORY_START+(srcLine*rowBytes);
    
    memcpy((void*)dest,(void*)src,rowBytes);
1000019f:	68 a0 00 00 00       	push   0xa0
100001a4:	8d 04 80             	lea    eax,[eax+eax*4]
100001a7:	c1 e0 05             	shl    eax,0x5
100001aa:	05 00 80 0b 00       	add    eax,0xb8000
100001af:	50                   	push   eax
100001b0:	8d 04 92             	lea    eax,[edx+edx*4]
100001b3:	c1 e0 05             	shl    eax,0x5
100001b6:	05 00 80 0b 00       	add    eax,0xb8000
100001bb:	50                   	push   eax
100001bc:	e8 67 02 00 00       	call   10000428 <memcpy>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:108
}
100001c1:	83 c4 1c             	add    esp,0x1c
100001c4:	c3                   	ret    

100001c5 <terminal_putchar>:
terminal_putchar():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:110

void terminal_putchar(char c) {
100001c5:	53                   	push   ebx
100001c6:	83 ec 08             	sub    esp,0x8
100001c9:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:111
    if (c=='\n')
100001cd:	3c 0a                	cmp    al,0xa
100001cf:	75 16                	jne    100001e7 <terminal_putchar+0x22>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:113
    {
            terminal_column = 0;
100001d1:	c7 05 04 00 10 00 00 	mov    DWORD PTR ds:0x100004,0x0
100001d8:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:114
            terminal_row += 1;
100001db:	83 05 00 00 10 00 01 	add    DWORD PTR ds:0x100000,0x1
100001e2:	e9 d8 00 00 00       	jmp    100002bf <terminal_putchar+0xfa>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:116
    }
    else if (c=='\b')
100001e7:	3c 08                	cmp    al,0x8
100001e9:	75 48                	jne    10000233 <terminal_putchar+0x6e>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:118
    {
        if (terminal_column > 1)
100001eb:	a1 04 00 10 00       	mov    eax,ds:0x100004
100001f0:	83 f8 01             	cmp    eax,0x1
100001f3:	76 0a                	jbe    100001ff <terminal_putchar+0x3a>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:119
            terminal_column--;
100001f5:	83 e8 01             	sub    eax,0x1
100001f8:	a3 04 00 10 00       	mov    ds:0x100004,eax
100001fd:	eb 11                	jmp    10000210 <terminal_putchar+0x4b>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:122
        else
        {
            terminal_row--;
100001ff:	83 2d 00 00 10 00 01 	sub    DWORD PTR ds:0x100000,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:123
            terminal_column=VGA_WIDTH;
10000206:	c7 05 04 00 10 00 50 	mov    DWORD PTR ds:0x100004,0x50
1000020d:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:125
        }
        terminal_putentryat(' ', terminal_color, terminal_column, terminal_row);
10000210:	ff 35 00 00 10 00    	push   DWORD PTR ds:0x100000
10000216:	ff 35 04 00 10 00    	push   DWORD PTR ds:0x100004
1000021c:	0f b6 05 08 00 10 00 	movzx  eax,BYTE PTR ds:0x100008
10000223:	50                   	push   eax
10000224:	6a 20                	push   0x20
10000226:	e8 3b fe ff ff       	call   10000066 <terminal_putentryat>
1000022b:	83 c4 10             	add    esp,0x10
1000022e:	e9 8c 00 00 00       	jmp    100002bf <terminal_putchar+0xfa>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:128
        
    }
    else if (c=='\t')
10000233:	3c 09                	cmp    al,0x9
10000235:	75 3b                	jne    10000272 <terminal_putchar+0xad>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:130
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
10000237:	8b 0d 04 00 10 00    	mov    ecx,DWORD PTR ds:0x100004
1000023d:	ba cd cc cc cc       	mov    edx,0xcccccccd
10000242:	89 c8                	mov    eax,ecx
10000244:	f7 e2                	mul    edx
10000246:	c1 ea 02             	shr    edx,0x2
10000249:	8d 5c 92 05          	lea    ebx,[edx+edx*4+0x5]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:132
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
1000024d:	39 d9                	cmp    ecx,ebx
1000024f:	b8 05 00 00 00       	mov    eax,0x5
10000254:	0f 44 d8             	cmove  ebx,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:134
        
        while (terminal_column < goTo)
10000257:	39 d9                	cmp    ecx,ebx
10000259:	73 64                	jae    100002bf <terminal_putchar+0xfa>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:135
            terminal_putchar(' ');;
1000025b:	83 ec 0c             	sub    esp,0xc
1000025e:	6a 20                	push   0x20
10000260:	e8 60 ff ff ff       	call   100001c5 <terminal_putchar>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:134
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
        
        while (terminal_column < goTo)
10000265:	83 c4 10             	add    esp,0x10
10000268:	3b 1d 04 00 10 00    	cmp    ebx,DWORD PTR ds:0x100004
1000026e:	77 eb                	ja     1000025b <terminal_putchar+0x96>
10000270:	eb 4d                	jmp    100002bf <terminal_putchar+0xfa>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:141
    
    //6 - cnt=0 to (5-1) 4
    //8 - cnt= to (5-3) 2
    }
    //We're going to ignore carriage return since most systems don't use it.  Unfortunately the FAT library we are using does
    else if (c=='\r')
10000272:	3c 0d                	cmp    al,0xd
10000274:	0f 84 86 00 00 00    	je     10000300 <terminal_putchar+0x13b>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:146
        return;

        else
        {
                terminal_putentryat(c, terminal_color, terminal_column, terminal_row);
1000027a:	ff 35 00 00 10 00    	push   DWORD PTR ds:0x100000
10000280:	ff 35 04 00 10 00    	push   DWORD PTR ds:0x100004
10000286:	0f b6 15 08 00 10 00 	movzx  edx,BYTE PTR ds:0x100008
1000028d:	52                   	push   edx
1000028e:	0f be c0             	movsx  eax,al
10000291:	50                   	push   eax
10000292:	e8 cf fd ff ff       	call   10000066 <terminal_putentryat>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:147
                if (++terminal_column == VGA_WIDTH) {
10000297:	a1 04 00 10 00       	mov    eax,ds:0x100004
1000029c:	83 c0 01             	add    eax,0x1
1000029f:	83 c4 10             	add    esp,0x10
100002a2:	83 f8 50             	cmp    eax,0x50
100002a5:	74 07                	je     100002ae <terminal_putchar+0xe9>
100002a7:	a3 04 00 10 00       	mov    ds:0x100004,eax
100002ac:	eb 11                	jmp    100002bf <terminal_putchar+0xfa>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:148
                        terminal_column = 0;
100002ae:	c7 05 04 00 10 00 00 	mov    DWORD PTR ds:0x100004,0x0
100002b5:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:149
                        terminal_row++;
100002b8:	83 05 00 00 10 00 01 	add    DWORD PTR ds:0x100000,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:152
                }
        }
    if (terminal_row == kTerminalHeight)
100002bf:	0f b6 05 27 00 10 00 	movzx  eax,BYTE PTR ds:0x100027
100002c6:	3b 05 00 00 10 00    	cmp    eax,DWORD PTR ds:0x100000
100002cc:	75 2d                	jne    100002fb <terminal_putchar+0x136>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:154 (discriminator 1)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
100002ce:	85 c0                	test   eax,eax
100002d0:	74 22                	je     100002f4 <terminal_putchar+0x12f>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:154
100002d2:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:155 (discriminator 3)
            terminal_copyline(row, row+1);
100002d7:	8d 58 01             	lea    ebx,[eax+0x1]
100002da:	83 ec 08             	sub    esp,0x8
100002dd:	53                   	push   ebx
100002de:	50                   	push   eax
100002df:	e8 b0 fe ff ff       	call   10000194 <terminal_copyline>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:154 (discriminator 3)
                        terminal_row++;
                }
        }
    if (terminal_row == kTerminalHeight)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
100002e4:	89 d8                	mov    eax,ebx
100002e6:	0f b6 15 27 00 10 00 	movzx  edx,BYTE PTR ds:0x100027
100002ed:	83 c4 10             	add    esp,0x10
100002f0:	39 da                	cmp    edx,ebx
100002f2:	77 e3                	ja     100002d7 <terminal_putchar+0x112>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:157
            terminal_copyline(row, row+1);
        //memcpy((void *)TEXTMODE_MEMORY_START, (void *)TEXTMODE_MEMORY_START+160, 160*25);
        terminal_row--;
100002f4:	83 2d 00 00 10 00 01 	sub    DWORD PTR ds:0x100000,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:159
    }
    update_cursor();
100002fb:	e8 00 fd ff ff       	call   10000000 <update_cursor>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:160
}
10000300:	83 c4 08             	add    esp,0x8
10000303:	5b                   	pop    ebx
10000304:	c3                   	ret    

10000305 <cursorUpdateBiosCursor>:
cursorUpdateBiosCursor():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:165

void cursorUpdateBiosCursor()
{
    uint8_t* bda=(uint8_t*)0x450;
    *bda=(uint8_t)(terminal_column & 0xFF);
10000305:	a1 04 00 10 00       	mov    eax,ds:0x100004
1000030a:	a2 50 04 00 00       	mov    ds:0x450,al
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:167
    bda++;
    *bda=(uint8_t)((terminal_row+3) & 0xFF);
1000030f:	0f b6 05 00 00 10 00 	movzx  eax,BYTE PTR ds:0x100000
10000316:	83 c0 03             	add    eax,0x3
10000319:	a2 51 04 00 00       	mov    ds:0x451,al
1000031e:	c3                   	ret    

1000031f <cursorMoveTo>:
cursorMoveTo():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:172
}

void cursorMoveTo(uint8_t x, uint8_t y)
{
    terminal_row = y;
1000031f:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
10000324:	a3 00 00 10 00       	mov    ds:0x100000,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:173
    terminal_column = x;
10000329:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
1000032e:	a3 04 00 10 00       	mov    ds:0x100004,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:174
    update_cursor();
10000333:	e8 c8 fc ff ff       	call   10000000 <update_cursor>
10000338:	f3 c3                	repz ret 

1000033a <cursorMoveToX>:
cursorMoveToX():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:179
}

void cursorMoveToX(uint8_t x)
{
    terminal_column = x;
1000033a:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
1000033f:	a3 04 00 10 00       	mov    ds:0x100004,eax
10000344:	c3                   	ret    

10000345 <cursorMoveToY>:
cursorMoveToY():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:184
}

void cursorMoveToY(uint8_t y)
{
    terminal_row = y;
10000345:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
1000034a:	a3 00 00 10 00       	mov    ds:0x100000,eax
1000034f:	c3                   	ret    

10000350 <cursorGetPosX>:
cursorGetPosX():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:190
}

uint8_t cursorGetPosX()
{
    return terminal_column;
}
10000350:	0f b6 05 04 00 10 00 	movzx  eax,BYTE PTR ds:0x100004
10000357:	c3                   	ret    

10000358 <cursorGetMaxX>:
cursorGetMaxX():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:194
int cursorGetMaxX()
{
    return VGA_WIDTH;
}
10000358:	b8 50 00 00 00       	mov    eax,0x50
1000035d:	c3                   	ret    

1000035e <cursorGetMaxY>:
cursorGetMaxY():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:198

int cursorGetMaxY()
{
    return kTerminalHeight;
1000035e:	0f b6 05 27 00 10 00 	movzx  eax,BYTE PTR ds:0x100027
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:199
}
10000365:	c3                   	ret    

10000366 <displayGetMaxXY>:
displayGetMaxXY():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:203

void displayGetMaxXY(int* maxX, int* maxY)
{
    *maxX=VGA_WIDTH;
10000366:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
1000036a:	c7 00 50 00 00 00    	mov    DWORD PTR [eax],0x50
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:204
    *maxY=kTerminalHeight;
10000370:	0f b6 15 27 00 10 00 	movzx  edx,BYTE PTR ds:0x100027
10000377:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
1000037b:	89 10                	mov    DWORD PTR [eax],edx
1000037d:	c3                   	ret    

1000037e <cursorGetPosY>:
cursorGetPosY():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:211
}

uint8_t cursorGetPosY()
{
    return terminal_row;
}
1000037e:	0f b6 05 00 00 10 00 	movzx  eax,BYTE PTR ds:0x100000
10000385:	c3                   	ret    

10000386 <kTermPrint>:
kTermPrint():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:213

void kTermPrint(const char* data) {
10000386:	56                   	push   esi
10000387:	53                   	push   ebx
10000388:	83 ec 10             	sub    esp,0x10
1000038b:	8b 74 24 1c          	mov    esi,DWORD PTR [esp+0x1c]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:214
        size_t datalen = strlen(data);
1000038f:	56                   	push   esi
10000390:	e8 5f 06 00 00       	call   100009f4 <strlen>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:215
        for (size_t i = 0; i < datalen; i++)
10000395:	83 c4 10             	add    esp,0x10
10000398:	85 c0                	test   eax,eax
1000039a:	74 1a                	je     100003b6 <kTermPrint+0x30>
1000039c:	89 f3                	mov    ebx,esi
1000039e:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:216 (discriminator 3)
                terminal_putchar(data[i]);
100003a0:	83 ec 0c             	sub    esp,0xc
100003a3:	0f be 13             	movsx  edx,BYTE PTR [ebx]
100003a6:	52                   	push   edx
100003a7:	e8 19 fe ff ff       	call   100001c5 <terminal_putchar>
100003ac:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:215 (discriminator 3)
    return terminal_row;
}

void kTermPrint(const char* data) {
        size_t datalen = strlen(data);
        for (size_t i = 0; i < datalen; i++)
100003af:	83 c4 10             	add    esp,0x10
100003b2:	39 f3                	cmp    ebx,esi
100003b4:	75 ea                	jne    100003a0 <kTermPrint+0x1a>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:217
                terminal_putchar(data[i]);
}
100003b6:	83 c4 04             	add    esp,0x4
100003b9:	5b                   	pop    ebx
100003ba:	5e                   	pop    esi
100003bb:	c3                   	ret    

100003bc <kTermInit>:
kTermInit():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:221


void kTermInit() {
    kTerminalHeight=SYS_VGA_HEIGHT;
100003bc:	c6 05 27 00 10 00 32 	mov    BYTE PTR ds:0x100027,0x32
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:222
    terminal_row = 0;
100003c3:	c7 05 00 00 10 00 00 	mov    DWORD PTR ds:0x100000,0x0
100003ca:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:223
    terminal_column = 0;
100003cd:	c7 05 04 00 10 00 00 	mov    DWORD PTR ds:0x100004,0x0
100003d4:	00 00 00 
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:224
    terminal_color = make_color(COLOR_LIGHT_BROWN, COLOR_BLACK);
100003d7:	c6 05 08 00 10 00 0e 	mov    BYTE PTR ds:0x100008,0xe
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:225
    terminal_buffer = (uint16_t*) TEXTMODE_MEMORY_START;
100003de:	c7 05 0c 00 10 00 00 	mov    DWORD PTR ds:0x10000c,0xb8000
100003e5:	80 0b 00 
100003e8:	c3                   	ret    

100003e9 <puts>:
puts():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:230
    //terminal_clear();
}

void puts(char* in)
{
100003e9:	53                   	push   ebx
100003ea:	83 ec 08             	sub    esp,0x8
100003ed:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:231
    while (*in>'\0')
100003f1:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
100003f4:	84 c0                	test   al,al
100003f6:	7e 19                	jle    10000411 <puts+0x28>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:233
    {
        terminal_putchar(*in++);
100003f8:	83 c3 01             	add    ebx,0x1
100003fb:	83 ec 0c             	sub    esp,0xc
100003fe:	0f be c0             	movsx  eax,al
10000401:	50                   	push   eax
10000402:	e8 be fd ff ff       	call   100001c5 <terminal_putchar>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:231
    //terminal_clear();
}

void puts(char* in)
{
    while (*in>'\0')
10000407:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
1000040a:	83 c4 10             	add    esp,0x10
1000040d:	84 c0                	test   al,al
1000040f:	7f e7                	jg     100003f8 <puts+0xf>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:235
    {
        terminal_putchar(*in++);
    }
}
10000411:	83 c4 08             	add    esp,0x8
10000414:	5b                   	pop    ebx
10000415:	c3                   	ret    

10000416 <putc>:
putc():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:238

void putc(char c)
{
10000416:	83 ec 18             	sub    esp,0x18
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:239
    terminal_putchar(c);
10000419:	0f be 44 24 1c       	movsx  eax,BYTE PTR [esp+0x1c]
1000041e:	50                   	push   eax
1000041f:	e8 a1 fd ff ff       	call   100001c5 <terminal_putchar>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/char/console/basic_display.c:240
10000424:	83 c4 1c             	add    esp,0x1c
10000427:	c3                   	ret    

10000428 <memcpy>:
memcpy():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:12
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
void * memcpy(void *dest, const void *src, size_t n)
{
10000428:	57                   	push   edi
10000429:	56                   	push   esi
1000042a:	53                   	push   ebx
1000042b:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
1000042f:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
10000433:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:17
    bool dw,dd;
    
    dd=n%4==0;
    dw=n%2==0;
    if (dd)
10000437:	89 d1                	mov    ecx,edx
10000439:	83 e1 03             	and    ecx,0x3
1000043c:	75 4d                	jne    1000048b <memcpy+0x63>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:19
    {
        n /=4;
1000043e:	c1 ea 02             	shr    edx,0x2
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:23
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
10000441:	39 c3                	cmp    ebx,eax
10000443:	72 0e                	jb     10000453 <memcpy+0x2b>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
10000445:	b9 00 00 00 00       	mov    ecx,0x0
1000044a:	85 d2                	test   edx,edx
1000044c:	75 2e                	jne    1000047c <memcpy+0x54>
1000044e:	e9 b6 00 00 00       	jmp    10000509 <memcpy+0xe1>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:24
        n /=4;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
10000453:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
1000045a:	01 fb                	add    ebx,edi
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:25
                t += n;
1000045c:	01 c7                	add    edi,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:26
                while ( (n)-- > 0)
1000045e:	85 d2                	test   edx,edx
10000460:	0f 84 a3 00 00 00    	je     10000509 <memcpy+0xe1>
10000466:	f7 da                	neg    edx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:27
                        *--t = *--f;
10000468:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
1000046c:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
10000470:	83 e9 01             	sub    ecx,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:26
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
10000473:	39 d1                	cmp    ecx,edx
10000475:	75 f1                	jne    10000468 <memcpy+0x40>
10000477:	e9 8d 00 00 00       	jmp    10000509 <memcpy+0xe1>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:30
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
1000047c:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
1000047f:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
10000482:	83 c1 01             	add    ecx,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
10000485:	39 ca                	cmp    edx,ecx
10000487:	75 f3                	jne    1000047c <memcpy+0x54>
10000489:	eb 7e                	jmp    10000509 <memcpy+0xe1>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:33
                        *t++ = *f++;
        return dest;
    }
    else if (dw)
1000048b:	89 d1                	mov    ecx,edx
1000048d:	83 e1 01             	and    ecx,0x1
10000490:	75 42                	jne    100004d4 <memcpy+0xac>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:35
    {
        n /=2;
10000492:	d1 ea                	shr    edx,1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:39
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
10000494:	39 c3                	cmp    ebx,eax
10000496:	72 0b                	jb     100004a3 <memcpy+0x7b>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
10000498:	b9 00 00 00 00       	mov    ecx,0x0
1000049d:	85 d2                	test   edx,edx
1000049f:	75 24                	jne    100004c5 <memcpy+0x9d>
100004a1:	eb 66                	jmp    10000509 <memcpy+0xe1>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:40
        n /=2;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
100004a3:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
100004aa:	01 fb                	add    ebx,edi
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:41
                t += n;
100004ac:	01 c7                	add    edi,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:42
                while ( (n)-- > 0)
100004ae:	85 d2                	test   edx,edx
100004b0:	74 57                	je     10000509 <memcpy+0xe1>
100004b2:	f7 da                	neg    edx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:43
                        *--t = *--f;
100004b4:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
100004b8:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
100004bc:	83 e9 01             	sub    ecx,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:42
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
100004bf:	39 ca                	cmp    edx,ecx
100004c1:	75 f1                	jne    100004b4 <memcpy+0x8c>
100004c3:	eb 44                	jmp    10000509 <memcpy+0xe1>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:46
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
100004c5:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
100004c8:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
100004cb:	83 c1 01             	add    ecx,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
100004ce:	39 ca                	cmp    edx,ecx
100004d0:	75 f3                	jne    100004c5 <memcpy+0x9d>
100004d2:	eb 35                	jmp    10000509 <memcpy+0xe1>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:54
    else
    {
        const char *f = src;
        char *t = dest;

        if (f < t) {
100004d4:	39 c3                	cmp    ebx,eax
100004d6:	72 0b                	jb     100004e3 <memcpy+0xbb>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
100004d8:	be 00 00 00 00       	mov    esi,0x0
100004dd:	85 d2                	test   edx,edx
100004df:	75 1a                	jne    100004fb <memcpy+0xd3>
100004e1:	eb 26                	jmp    10000509 <memcpy+0xe1>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
100004e3:	8d 4a ff             	lea    ecx,[edx-0x1]
100004e6:	85 d2                	test   edx,edx
100004e8:	74 1f                	je     10000509 <memcpy+0xe1>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:58
                        *--t = *--f;
100004ea:	0f b6 14 0b          	movzx  edx,BYTE PTR [ebx+ecx*1]
100004ee:	88 14 08             	mov    BYTE PTR [eax+ecx*1],dl
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
100004f1:	83 e9 01             	sub    ecx,0x1
100004f4:	83 f9 ff             	cmp    ecx,0xffffffff
100004f7:	75 f1                	jne    100004ea <memcpy+0xc2>
100004f9:	eb 0e                	jmp    10000509 <memcpy+0xe1>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:61
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
100004fb:	0f b6 0c 33          	movzx  ecx,BYTE PTR [ebx+esi*1]
100004ff:	88 0c 30             	mov    BYTE PTR [eax+esi*1],cl
10000502:	83 c6 01             	add    esi,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
10000505:	39 f2                	cmp    edx,esi
10000507:	75 f2                	jne    100004fb <memcpy+0xd3>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/memcpy.c:64
                        *t++ = *f++;
        return dest;
    }
10000509:	5b                   	pop    ebx
1000050a:	5e                   	pop    esi
1000050b:	5f                   	pop    edi
1000050c:	c3                   	ret    
1000050d:	66 90                	xchg   ax,ax
1000050f:	90                   	nop

10000510 <panic>:
panic():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/panic.c:8
#include <stdarg.h>
#include <time.h>
#include "printf.h"

void __attribute__((noinline))panic(const char *format, ...)
{
10000510:	53                   	push   ebx
10000511:	83 ec 08             	sub    esp,0x8
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/panic.c:10
    va_list args;
    va_start( args, format );
10000514:	8d 5c 24 14          	lea    ebx,[esp+0x14]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/panic.c:11
    printk("\n>>>panic at instruction prior to address 0x%08X<<<\n", __builtin_return_address(0));
10000518:	83 ec 08             	sub    esp,0x8
1000051b:	ff 74 24 14          	push   DWORD PTR [esp+0x14]
1000051f:	68 90 10 00 10       	push   0x10001090
10000524:	e8 6a 04 00 00       	call   10000993 <printk>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/panic.c:12
    printk("  >>>");
10000529:	c7 04 24 24 11 00 10 	mov    DWORD PTR [esp],0x10001124
10000530:	e8 5e 04 00 00       	call   10000993 <printk>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/panic.c:13
    printk_valist( format,args);
10000535:	83 c4 08             	add    esp,0x8
10000538:	53                   	push   ebx
10000539:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
1000053d:	e8 38 04 00 00       	call   1000097a <printk_valist>
10000542:	83 c4 10             	add    esp,0x10
10000545:	eb fe                	jmp    10000545 <panic+0x35>
10000547:	90                   	nop

10000548 <printchar>:
printchar():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:43
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
	
	if (str) {
10000548:	85 c0                	test   eax,eax
1000054a:	74 08                	je     10000554 <printchar+0xc>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:44
		**str = c;
1000054c:	8b 08                	mov    ecx,DWORD PTR [eax]
1000054e:	88 11                	mov    BYTE PTR [ecx],dl
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:45
		++(*str);
10000550:	83 00 01             	add    DWORD PTR [eax],0x1
10000553:	c3                   	ret    
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:41
//extern bool pauseDisplay(bool offerToQuit);
extern uint32_t kDebugLevel;
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
10000554:	83 ec 18             	sub    esp,0x18
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:47
	
	if (str) {
		**str = c;
		++(*str);
	}
	else terminal_putchar((unsigned char)c);
10000557:	0f b6 d2             	movzx  edx,dl
1000055a:	52                   	push   edx
1000055b:	e8 65 fc ff ff       	call   100001c5 <terminal_putchar>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:48
}
10000560:	83 c4 1c             	add    esp,0x1c
10000563:	c3                   	ret    

10000564 <prints>:
prints():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:54

#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
10000564:	55                   	push   ebp
10000565:	57                   	push   edi
10000566:	56                   	push   esi
10000567:	53                   	push   ebx
10000568:	83 ec 1c             	sub    esp,0x1c
1000056b:	89 c7                	mov    edi,eax
1000056d:	89 d6                	mov    esi,edx
1000056f:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
10000573:	8b 54 24 30          	mov    edx,DWORD PTR [esp+0x30]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:57
	register int pc = 0, padchar = ' ';

	if (width > 0) {
10000577:	85 c9                	test   ecx,ecx
10000579:	0f 8e cb 00 00 00    	jle    1000064a <prints+0xe6>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:60 (discriminator 1)
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
1000057f:	80 3e 00             	cmp    BYTE PTR [esi],0x0
10000582:	74 1b                	je     1000059f <prints+0x3b>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:60
10000584:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:60 (discriminator 3)
10000589:	83 c0 01             	add    eax,0x1
1000058c:	80 3c 06 00          	cmp    BYTE PTR [esi+eax*1],0x0
10000590:	75 f7                	jne    10000589 <prints+0x25>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:61
		if (len >= width) width = 0;
10000592:	bb 00 00 00 00       	mov    ebx,0x0
10000597:	39 44 24 0c          	cmp    DWORD PTR [esp+0xc],eax
1000059b:	7e 0f                	jle    100005ac <prints+0x48>
1000059d:	eb 05                	jmp    100005a4 <prints+0x40>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:60
	register int pc = 0, padchar = ' ';

	if (width > 0) {
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
1000059f:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:62
		if (len >= width) width = 0;
		else width -= len;
100005a4:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
100005a8:	29 c1                	sub    ecx,eax
100005aa:	89 cb                	mov    ebx,ecx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:63
		if (pad & PAD_ZERO) padchar = '0';
100005ac:	89 d0                	mov    eax,edx
100005ae:	83 e0 02             	and    eax,0x2
100005b1:	83 f8 01             	cmp    eax,0x1
100005b4:	19 ed                	sbb    ebp,ebp
100005b6:	83 e5 f0             	and    ebp,0xfffffff0
100005b9:	83 c5 30             	add    ebp,0x30
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:65
	}
	if (!(pad & PAD_RIGHT)) {
100005bc:	f6 c2 01             	test   dl,0x1
100005bf:	75 1a                	jne    100005db <prints+0x77>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:66 (discriminator 1)
		for ( ; width > 0; --width) {
100005c1:	85 db                	test   ebx,ebx
100005c3:	7e 67                	jle    1000062c <prints+0xc8>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:66
100005c5:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:67 (discriminator 2)
			printchar (out, padchar);
100005c9:	89 ea                	mov    edx,ebp
100005cb:	89 f8                	mov    eax,edi
100005cd:	e8 76 ff ff ff       	call   10000548 <printchar>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:66 (discriminator 2)
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
100005d2:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
100005d7:	75 f0                	jne    100005c9 <prints+0x65>
100005d9:	eb 66                	jmp    10000641 <prints+0xdd>
100005db:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:71 (discriminator 1)
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
100005df:	0f b6 16             	movzx  edx,BYTE PTR [esi]
100005e2:	84 d2                	test   dl,dl
100005e4:	74 1e                	je     10000604 <prints+0xa0>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
100005e6:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
100005eb:	29 de                	sub    esi,ebx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:72 (discriminator 2)
		printchar (out, *string);
100005ed:	0f be d2             	movsx  edx,dl
100005f0:	89 f8                	mov    eax,edi
100005f2:	e8 51 ff ff ff       	call   10000548 <printchar>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:73 (discriminator 2)
		++pc;
100005f7:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
100005fa:	0f b6 14 1e          	movzx  edx,BYTE PTR [esi+ebx*1]
100005fe:	84 d2                	test   dl,dl
10000600:	75 eb                	jne    100005ed <prints+0x89>
10000602:	eb 05                	jmp    10000609 <prints+0xa5>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
10000604:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:75 (discriminator 1)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
10000609:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
1000060d:	85 c0                	test   eax,eax
1000060f:	7e 45                	jle    10000656 <prints+0xf2>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:75
10000611:	89 c6                	mov    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:76 (discriminator 2)
		printchar (out, padchar);
10000613:	89 ea                	mov    edx,ebp
10000615:	89 f8                	mov    eax,edi
10000617:	e8 2c ff ff ff       	call   10000548 <printchar>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:75 (discriminator 2)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
1000061c:	83 ee 01             	sub    esi,0x1
1000061f:	75 f2                	jne    10000613 <prints+0xaf>
10000621:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
10000625:	8d 04 03             	lea    eax,[ebx+eax*1]
10000628:	89 c3                	mov    ebx,eax
1000062a:	eb 2a                	jmp    10000656 <prints+0xf2>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:66
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
1000062c:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
10000630:	bb 00 00 00 00       	mov    ebx,0x0
10000635:	eb 0a                	jmp    10000641 <prints+0xdd>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
10000637:	bd 20 00 00 00       	mov    ebp,0x20
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
1000063c:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:71
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
10000641:	0f b6 16             	movzx  edx,BYTE PTR [esi]
10000644:	84 d2                	test   dl,dl
10000646:	75 a3                	jne    100005eb <prints+0x87>
10000648:	eb 0c                	jmp    10000656 <prints+0xf2>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
1000064a:	f6 c2 01             	test   dl,0x1
1000064d:	74 e8                	je     10000637 <prints+0xd3>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
1000064f:	bd 20 00 00 00       	mov    ebp,0x20
10000654:	eb 89                	jmp    100005df <prints+0x7b>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:81
		printchar (out, padchar);
		++pc;
	}

	return pc;
}
10000656:	89 d8                	mov    eax,ebx
10000658:	83 c4 1c             	add    esp,0x1c
1000065b:	5b                   	pop    ebx
1000065c:	5e                   	pop    esi
1000065d:	5f                   	pop    edi
1000065e:	5d                   	pop    ebp
1000065f:	c3                   	ret    

10000660 <printi>:
printi():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:87

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
10000660:	55                   	push   ebp
10000661:	57                   	push   edi
10000662:	56                   	push   esi
10000663:	53                   	push   ebx
10000664:	83 ec 2c             	sub    esp,0x2c
10000667:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:93
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;

	if (i == 0) {
1000066b:	85 d2                	test   edx,edx
1000066d:	75 2a                	jne    10000699 <printi+0x39>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:94
		print_buf[0] = '0';
1000066f:	c6 44 24 14 30       	mov    BYTE PTR [esp+0x14],0x30
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:95
		print_buf[1] = '\0';
10000674:	c6 44 24 15 00       	mov    BYTE PTR [esp+0x15],0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:96
		return prints (out, print_buf, width, pad);
10000679:	83 ec 0c             	sub    esp,0xc
1000067c:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
10000680:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
10000684:	8d 54 24 24          	lea    edx,[esp+0x24]
10000688:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
1000068c:	e8 d3 fe ff ff       	call   10000564 <prints>
10000691:	83 c4 10             	add    esp,0x10
10000694:	e9 f1 00 00 00       	jmp    1000078a <printi+0x12a>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:99
	}

	if (sg && b == 10 && i < 0) {
10000699:	83 7c 24 40 00       	cmp    DWORD PTR [esp+0x40],0x0
1000069e:	0f 95 c3             	setne  bl
100006a1:	83 f9 0a             	cmp    ecx,0xa
100006a4:	0f 94 c0             	sete   al
100006a7:	84 c3                	test   bl,al
100006a9:	0f 84 c1 00 00 00    	je     10000770 <printi+0x110>
100006af:	89 d0                	mov    eax,edx
100006b1:	c1 e8 1f             	shr    eax,0x1f
100006b4:	84 c0                	test   al,al
100006b6:	0f 84 b4 00 00 00    	je     10000770 <printi+0x110>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
100006bc:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
100006c1:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:107
	*s = '\0';

	while (u) {
100006c5:	89 d3                	mov    ebx,edx
100006c7:	f7 db                	neg    ebx
100006c9:	74 54                	je     1000071f <printi+0xbf>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:100
		print_buf[1] = '\0';
		return prints (out, print_buf, width, pad);
	}

	if (sg && b == 10 && i < 0) {
		neg = 1;
100006cb:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
100006d2:	00 
100006d3:	eb 08                	jmp    100006dd <printi+0x7d>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
100006d5:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
100006dc:	00 
100006dd:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
100006e1:	89 cf                	mov    edi,ecx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
100006e3:	8b 44 24 4c          	mov    eax,DWORD PTR [esp+0x4c]
100006e7:	8d 68 c6             	lea    ebp,[eax-0x3a]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
100006ea:	89 d8                	mov    eax,ebx
100006ec:	ba 00 00 00 00       	mov    edx,0x0
100006f1:	f7 f1                	div    ecx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
100006f3:	8d 04 2a             	lea    eax,[edx+ebp*1]
100006f6:	83 fa 0a             	cmp    edx,0xa
100006f9:	0f 4c c2             	cmovl  eax,edx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:111
		*--s = t + '0';
100006fc:	83 ee 01             	sub    esi,0x1
100006ff:	83 c0 30             	add    eax,0x30
10000702:	88 06                	mov    BYTE PTR [esi],al
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:112
		u /= b;
10000704:	89 d8                	mov    eax,ebx
10000706:	ba 00 00 00 00       	mov    edx,0x0
1000070b:	f7 f7                	div    edi
1000070d:	89 c3                	mov    ebx,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:107
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
1000070f:	85 c0                	test   eax,eax
10000711:	75 d7                	jne    100006ea <printi+0x8a>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
10000713:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:115
			t += letbase - '0' - 10;
		*--s = t + '0';
		u /= b;
	}

	if (neg) {
10000718:	83 7c 24 0c 00       	cmp    DWORD PTR [esp+0xc],0x0
1000071d:	74 34                	je     10000753 <printi+0xf3>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:116
		if( width && (pad & PAD_ZERO) ) {
1000071f:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
10000724:	74 21                	je     10000747 <printi+0xe7>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:116 (discriminator 1)
10000726:	f6 44 24 48 02       	test   BYTE PTR [esp+0x48],0x2
1000072b:	74 1a                	je     10000747 <printi+0xe7>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:117
			printchar (out, '-');
1000072d:	ba 2d 00 00 00       	mov    edx,0x2d
10000732:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
10000736:	e8 0d fe ff ff       	call   10000548 <printchar>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:119
			++pc;
			--width;
1000073b:	83 6c 24 44 01       	sub    DWORD PTR [esp+0x44],0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:118
	}

	if (neg) {
		if( width && (pad & PAD_ZERO) ) {
			printchar (out, '-');
			++pc;
10000740:	bb 01 00 00 00       	mov    ebx,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:119
			--width;
10000745:	eb 0c                	jmp    10000753 <printi+0xf3>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:122
		}
		else {
			*--s = '-';
10000747:	c6 46 ff 2d          	mov    BYTE PTR [esi-0x1],0x2d
1000074b:	8d 76 ff             	lea    esi,[esi-0x1]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
1000074e:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:126
		else {
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
10000753:	83 ec 0c             	sub    esp,0xc
10000756:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
1000075a:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
1000075e:	89 f2                	mov    edx,esi
10000760:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
10000764:	e8 fb fd ff ff       	call   10000564 <prints>
10000769:	01 d8                	add    eax,ebx
1000076b:	83 c4 10             	add    esp,0x10
1000076e:	eb 1a                	jmp    1000078a <printi+0x12a>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:91
static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;
10000770:	89 d3                	mov    ebx,edx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
10000772:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:107

	while (u) {
10000777:	85 d2                	test   edx,edx
10000779:	0f 85 56 ff ff ff    	jne    100006d5 <printi+0x75>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
1000077f:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
10000784:	8d 74 24 1f          	lea    esi,[esp+0x1f]
10000788:	eb c9                	jmp    10000753 <printi+0xf3>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:127
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
}
1000078a:	83 c4 2c             	add    esp,0x2c
1000078d:	5b                   	pop    ebx
1000078e:	5e                   	pop    esi
1000078f:	5f                   	pop    edi
10000790:	5d                   	pop    ebp
10000791:	c3                   	ret    

10000792 <print>:
print():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:130

static int print(char **out, const char *format, va_list args )
{
10000792:	55                   	push   ebp
10000793:	57                   	push   edi
10000794:	56                   	push   esi
10000795:	53                   	push   ebx
10000796:	83 ec 2c             	sub    esp,0x2c
10000799:	89 c7                	mov    edi,eax
1000079b:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:135
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
1000079f:	0f b6 02             	movzx  eax,BYTE PTR [edx]
100007a2:	84 c0                	test   al,al
100007a4:	0f 84 b8 01 00 00    	je     10000962 <print+0x1d0>
100007aa:	89 d5                	mov    ebp,edx
100007ac:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:136
		if (*format == '%') {
100007b1:	3c 25                	cmp    al,0x25
100007b3:	0f 85 88 01 00 00    	jne    10000941 <print+0x1af>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:137
			++format;
100007b9:	8d 5d 01             	lea    ebx,[ebp+0x1]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:139
			width = pad = 0;
			if (*format == '\0') break;
100007bc:	0f b6 55 01          	movzx  edx,BYTE PTR [ebp+0x1]
100007c0:	84 d2                	test   dl,dl
100007c2:	0f 84 9f 01 00 00    	je     10000967 <print+0x1d5>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:140
			if (*format == '%') goto out;
100007c8:	80 fa 25             	cmp    dl,0x25
100007cb:	0f 84 6e 01 00 00    	je     1000093f <print+0x1ad>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:138
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
			width = pad = 0;
100007d1:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:141
			if (*format == '\0') break;
			if (*format == '%') goto out;
			if (*format == '-') {
100007d6:	80 fa 2d             	cmp    dl,0x2d
100007d9:	75 08                	jne    100007e3 <print+0x51>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:142
				++format;
100007db:	8d 5d 02             	lea    ebx,[ebp+0x2]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:143
				pad = PAD_RIGHT;
100007de:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:145
			}
			while (*format == '0') {
100007e3:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
100007e6:	75 0b                	jne    100007f3 <print+0x61>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:146
				++format;
100007e8:	83 c3 01             	add    ebx,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:147
				pad |= PAD_ZERO;
100007eb:	83 c8 02             	or     eax,0x2
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:145
			if (*format == '%') goto out;
			if (*format == '-') {
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0') {
100007ee:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
100007f1:	74 f5                	je     100007e8 <print+0x56>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:149 (discriminator 1)
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
100007f3:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
100007f6:	8d 4a d0             	lea    ecx,[edx-0x30]
100007f9:	80 f9 09             	cmp    cl,0x9
100007fc:	77 22                	ja     10000820 <print+0x8e>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:149
100007fe:	b9 00 00 00 00       	mov    ecx,0x0
10000803:	89 c5                	mov    ebp,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:150 (discriminator 2)
				width *= 10;
10000805:	8d 04 89             	lea    eax,[ecx+ecx*4]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:151 (discriminator 2)
				width += *format - '0';
10000808:	0f be d2             	movsx  edx,dl
1000080b:	8d 4c 42 d0          	lea    ecx,[edx+eax*2-0x30]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:149 (discriminator 2)
			}
			while (*format == '0') {
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
1000080f:	83 c3 01             	add    ebx,0x1
10000812:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
10000815:	8d 42 d0             	lea    eax,[edx-0x30]
10000818:	3c 09                	cmp    al,0x9
1000081a:	76 e9                	jbe    10000805 <print+0x73>
1000081c:	89 e8                	mov    eax,ebp
1000081e:	eb 05                	jmp    10000825 <print+0x93>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:149
10000820:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:153
				width *= 10;
				width += *format - '0';
			}
			if( *format == 's' ) {
10000825:	80 fa 73             	cmp    dl,0x73
10000828:	75 2c                	jne    10000856 <print+0xc4>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:154
				register char *s = (char *)va_arg( args, int );
1000082a:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
1000082e:	8d 6a 04             	lea    ebp,[edx+0x4]
10000831:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
10000835:	8b 12                	mov    edx,DWORD PTR [edx]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:155
				pc += prints (out, s?s:"(null)", width, pad);
10000837:	85 d2                	test   edx,edx
10000839:	bd 2a 11 00 10       	mov    ebp,0x1000112a
1000083e:	0f 44 d5             	cmove  edx,ebp
10000841:	83 ec 0c             	sub    esp,0xc
10000844:	50                   	push   eax
10000845:	89 f8                	mov    eax,edi
10000847:	e8 18 fd ff ff       	call   10000564 <prints>
1000084c:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:156
				continue;
1000084e:	83 c4 10             	add    esp,0x10
10000851:	e9 fb 00 00 00       	jmp    10000951 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:158
			}
			if( *format == 'd' ) {
10000856:	80 fa 64             	cmp    dl,0x64
10000859:	75 29                	jne    10000884 <print+0xf2>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:159
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
1000085b:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
1000085f:	8d 6a 04             	lea    ebp,[edx+0x4]
10000862:	6a 61                	push   0x61
10000864:	50                   	push   eax
10000865:	51                   	push   ecx
10000866:	6a 01                	push   0x1
10000868:	b9 0a 00 00 00       	mov    ecx,0xa
1000086d:	8b 12                	mov    edx,DWORD PTR [edx]
1000086f:	89 f8                	mov    eax,edi
10000871:	e8 ea fd ff ff       	call   10000660 <printi>
10000876:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:160
				continue;
10000878:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:159
				register char *s = (char *)va_arg( args, int );
				pc += prints (out, s?s:"(null)", width, pad);
				continue;
			}
			if( *format == 'd' ) {
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
1000087b:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:160
				continue;
1000087f:	e9 cd 00 00 00       	jmp    10000951 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:162
			}
			if( *format == 'x' ) {
10000884:	80 fa 78             	cmp    dl,0x78
10000887:	75 2b                	jne    100008b4 <print+0x122>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:163
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
10000889:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
1000088d:	89 ea                	mov    edx,ebp
1000088f:	83 c5 04             	add    ebp,0x4
10000892:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
10000896:	6a 61                	push   0x61
10000898:	50                   	push   eax
10000899:	51                   	push   ecx
1000089a:	6a 00                	push   0x0
1000089c:	b9 10 00 00 00       	mov    ecx,0x10
100008a1:	8b 12                	mov    edx,DWORD PTR [edx]
100008a3:	89 f8                	mov    eax,edi
100008a5:	e8 b6 fd ff ff       	call   10000660 <printi>
100008aa:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:164
				continue;
100008ac:	83 c4 10             	add    esp,0x10
100008af:	e9 9d 00 00 00       	jmp    10000951 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:166
			}
			if( *format == 'X' ) {
100008b4:	80 fa 58             	cmp    dl,0x58
100008b7:	75 26                	jne    100008df <print+0x14d>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:167
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
100008b9:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
100008bd:	8d 6a 04             	lea    ebp,[edx+0x4]
100008c0:	6a 41                	push   0x41
100008c2:	50                   	push   eax
100008c3:	51                   	push   ecx
100008c4:	6a 00                	push   0x0
100008c6:	b9 10 00 00 00       	mov    ecx,0x10
100008cb:	8b 12                	mov    edx,DWORD PTR [edx]
100008cd:	89 f8                	mov    eax,edi
100008cf:	e8 8c fd ff ff       	call   10000660 <printi>
100008d4:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:168
				continue;
100008d6:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:167
			if( *format == 'x' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
				continue;
			}
			if( *format == 'X' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
100008d9:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:168
				continue;
100008dd:	eb 72                	jmp    10000951 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:170
			}
			if( *format == 'u' ) {
100008df:	80 fa 75             	cmp    dl,0x75
100008e2:	75 28                	jne    1000090c <print+0x17a>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:171
				pc += printi (out, va_arg( args, int ), 10, 0, width, pad, 'a');
100008e4:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
100008e8:	89 ea                	mov    edx,ebp
100008ea:	83 c5 04             	add    ebp,0x4
100008ed:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
100008f1:	6a 61                	push   0x61
100008f3:	50                   	push   eax
100008f4:	51                   	push   ecx
100008f5:	6a 00                	push   0x0
100008f7:	b9 0a 00 00 00       	mov    ecx,0xa
100008fc:	8b 12                	mov    edx,DWORD PTR [edx]
100008fe:	89 f8                	mov    eax,edi
10000900:	e8 5b fd ff ff       	call   10000660 <printi>
10000905:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:172
				continue;
10000907:	83 c4 10             	add    esp,0x10
1000090a:	eb 45                	jmp    10000951 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:174
			}
			if( *format == 'c' ) {
1000090c:	80 fa 63             	cmp    dl,0x63
1000090f:	75 40                	jne    10000951 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:176
				/* char are converted to int then pushed on the stack */
				scr[0] = (char)va_arg( args, int );
10000911:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
10000915:	89 ea                	mov    edx,ebp
10000917:	83 c5 04             	add    ebp,0x4
1000091a:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
1000091e:	8b 12                	mov    edx,DWORD PTR [edx]
10000920:	88 54 24 1e          	mov    BYTE PTR [esp+0x1e],dl
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:177
				scr[1] = '\0';
10000924:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:178
				pc += prints (out, scr, width, pad);
10000929:	83 ec 0c             	sub    esp,0xc
1000092c:	50                   	push   eax
1000092d:	8d 54 24 2e          	lea    edx,[esp+0x2e]
10000931:	89 f8                	mov    eax,edi
10000933:	e8 2c fc ff ff       	call   10000564 <prints>
10000938:	01 c6                	add    esi,eax
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:179
				continue;
1000093a:	83 c4 10             	add    esp,0x10
1000093d:	eb 12                	jmp    10000951 <print+0x1bf>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:137
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
1000093f:	89 dd                	mov    ebp,ebx
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:184
				continue;
			}
		}
		else {
		out:
			printchar (out, *format);
10000941:	0f be 55 00          	movsx  edx,BYTE PTR [ebp+0x0]
10000945:	89 f8                	mov    eax,edi
10000947:	e8 fc fb ff ff       	call   10000548 <printchar>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:185
			++pc;
1000094c:	83 c6 01             	add    esi,0x1
1000094f:	89 eb                	mov    ebx,ebp
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:135
{
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
10000951:	8d 6b 01             	lea    ebp,[ebx+0x1]
10000954:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
10000958:	84 c0                	test   al,al
1000095a:	0f 85 51 fe ff ff    	jne    100007b1 <print+0x1f>
10000960:	eb 05                	jmp    10000967 <print+0x1d5>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:132
}

static int print(char **out, const char *format, va_list args )
{
	register int width, pad;
	register int pc = 0;
10000962:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:188
		out:
			printchar (out, *format);
			++pc;
		}
	}
	if (out) **out = '\0';
10000967:	85 ff                	test   edi,edi
10000969:	74 05                	je     10000970 <print+0x1de>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:188 (discriminator 1)
1000096b:	8b 07                	mov    eax,DWORD PTR [edi]
1000096d:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:191
	va_end( args );
	return pc;
}
10000970:	89 f0                	mov    eax,esi
10000972:	83 c4 2c             	add    esp,0x2c
10000975:	5b                   	pop    ebx
10000976:	5e                   	pop    esi
10000977:	5f                   	pop    edi
10000978:	5d                   	pop    ebp
10000979:	c3                   	ret    

1000097a <printk_valist>:
printk_valist():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:194

int printk_valist(const char *format, va_list args)
{
1000097a:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:195
    return print(0, format, args);
1000097d:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
10000981:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
10000985:	b8 00 00 00 00       	mov    eax,0x0
1000098a:	e8 03 fe ff ff       	call   10000792 <print>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:196
}
1000098f:	83 c4 0c             	add    esp,0xc
10000992:	c3                   	ret    

10000993 <printk>:
printk():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:199

int printk(const char *format, ...)
{
10000993:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:201
        va_list args;
        va_start( args, format );
10000996:	8d 44 24 14          	lea    eax,[esp+0x14]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:202
        return printk_valist(format, args);
1000099a:	83 ec 08             	sub    esp,0x8
1000099d:	50                   	push   eax
1000099e:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
100009a2:	e8 d3 ff ff ff       	call   1000097a <printk_valist>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:203
}
100009a7:	83 c4 1c             	add    esp,0x1c
100009aa:	c3                   	ret    

100009ab <printd>:
printd():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:209

#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
100009ab:	83 ec 0c             	sub    esp,0xc
100009ae:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:210
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
100009b2:	89 d1                	mov    ecx,edx
100009b4:	23 0d 38 03 10 00    	and    ecx,DWORD PTR ds:0x100338
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:222
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
    }
    return 0;
100009ba:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:210
#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
100009bf:	39 ca                	cmp    edx,ecx
100009c1:	75 14                	jne    100009d7 <printd+0x2c>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:214
    {
        va_list args;

        va_start( args, format );
100009c3:	8d 44 24 18          	lea    eax,[esp+0x18]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:220
//        if (++printDLineCount==SYS_VGA_HEIGHT-1)
//        {
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
100009c7:	83 ec 08             	sub    esp,0x8
100009ca:	50                   	push   eax
100009cb:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
100009cf:	e8 a6 ff ff ff       	call   1000097a <printk_valist>
100009d4:	83 c4 10             	add    esp,0x10
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:223 (discriminator 1)
    }
    return 0;
}
100009d7:	83 c4 0c             	add    esp,0xc
100009da:	c3                   	ret    

100009db <sprintf>:
sprintf():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:227
#endif

int sprintf(char *out, const char *format, ...)
{
100009db:	83 ec 0c             	sub    esp,0xc
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:231
        va_list args;
        
        va_start( args, format );
        return print( &out, format, args );
100009de:	8d 4c 24 18          	lea    ecx,[esp+0x18]
100009e2:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
100009e6:	8d 44 24 10          	lea    eax,[esp+0x10]
100009ea:	e8 a3 fd ff ff       	call   10000792 <print>
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/printf.c:232
}
100009ef:	83 c4 0c             	add    esp,0xc
100009f2:	c3                   	ret    
100009f3:	90                   	nop

100009f4 <strlen>:
strlen():
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/strings/strlen.c:3
#include <stddef.h>

size_t strlen(const char* str) {
100009f4:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/strings/strlen.c:5
          size_t ret = 0;
        while ( str[ret] != 0 )
100009f8:	80 3a 00             	cmp    BYTE PTR [edx],0x0
100009fb:	74 10                	je     10000a0d <strlen+0x19>
100009fd:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/strings/strlen.c:6
                ret++;
10000a02:	83 c0 01             	add    eax,0x1
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/strings/strlen.c:5
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
10000a05:	80 3c 02 00          	cmp    BYTE PTR [edx+eax*1],0x0
10000a09:	75 f7                	jne    10000a02 <strlen+0xe>
10000a0b:	f3 c3                	repz ret 
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/strings/strlen.c:4
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
10000a0d:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/NetBeansProjects/myHelloWorld/../chrisOS/src/strings/strlen.c:8
        while ( str[ret] != 0 )
                ret++;
        return ret;
}
10000a12:	c3                   	ret    
10000a13:	90                   	nop

10000a14 <dddd>:
dddd():
/home/yogi/NetBeansProjects/myHelloWorld/main.c:20
 * MyHelloWorld
 */

volatile  uint32_t* kTicksSinceStart;
uint32_t test=0;
void dddd(void) {
10000a14:	83 ec 14             	sub    esp,0x14
/home/yogi/NetBeansProjects/myHelloWorld/main.c:22
    uint32_t savedESP;
    test=&savedPosPointer;
10000a17:	c7 05 20 ca 00 10 26 	mov    DWORD PTR ds:0x1000ca20,0x100026
10000a1e:	00 10 00 
/home/yogi/NetBeansProjects/myHelloWorld/main.c:23
    terminal_setcolor(make_color(COLOR_LIGHT_BROWN,COLOR_BLUE));
10000a21:	6a 01                	push   0x1
10000a23:	6a 0e                	push   0xe
10000a25:	e8 14 f6 ff ff       	call   1000003e <make_color>
10000a2a:	89 04 24             	mov    DWORD PTR [esp],eax
10000a2d:	e8 2a f6 ff ff       	call   1000005c <terminal_setcolor>
/home/yogi/NetBeansProjects/myHelloWorld/main.c:24
    terminal_clear();
10000a32:	e8 be f6 ff ff       	call   100000f5 <terminal_clear>
/home/yogi/NetBeansProjects/myHelloWorld/main.c:25
    printk("myHelloWorld 1 loaded!\n");
10000a37:	c7 04 24 31 11 00 10 	mov    DWORD PTR [esp],0x10001131
10000a3e:	e8 50 ff ff ff       	call   10000993 <printk>
/home/yogi/NetBeansProjects/myHelloWorld/main.c:26
    printk("Inside/before testFunction, system ticks=%u\n", *kTicksSinceStart);
10000a43:	a1 60 02 10 00       	mov    eax,ds:0x100260
10000a48:	8b 00                	mov    eax,DWORD PTR [eax]
10000a4a:	83 c4 08             	add    esp,0x8
10000a4d:	50                   	push   eax
10000a4e:	68 c8 10 00 10       	push   0x100010c8
10000a53:	e8 3b ff ff ff       	call   10000993 <printk>
/home/yogi/NetBeansProjects/myHelloWorld/main.c:27
    uint32_t ticks=*kTicksSinceStart;
10000a58:	a1 60 02 10 00       	mov    eax,ds:0x100260
10000a5d:	8b 10                	mov    edx,DWORD PTR [eax]
/home/yogi/NetBeansProjects/myHelloWorld/main.c:28
    __asm__("sti\n");
10000a5f:	fb                   	sti    
/home/yogi/NetBeansProjects/myHelloWorld/main.c:29
    {__asm__("hlt\n");}
10000a60:	f4                   	hlt    
/home/yogi/NetBeansProjects/myHelloWorld/main.c:30
    printk("Inside/after testFunction, system ticks=%u\n", *kTicksSinceStart);
10000a61:	8b 00                	mov    eax,DWORD PTR [eax]
10000a63:	83 c4 08             	add    esp,0x8
10000a66:	50                   	push   eax
10000a67:	68 f8 10 00 10       	push   0x100010f8
10000a6c:	e8 22 ff ff ff       	call   10000993 <printk>
/home/yogi/NetBeansProjects/myHelloWorld/main.c:31
}
10000a71:	83 c4 1c             	add    esp,0x1c
10000a74:	c3                   	ret    
