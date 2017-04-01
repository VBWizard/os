
Debug/cross-Linux/myhelloworld:     file format elf32-i386


Disassembly of section .text:

00400000 <update_cursor>:
update_cursor():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:26
KERNEL_DATA_SECTION int8_t savedPosPointer=0;
KERNEL_DATA_SECTION uint8_t kTerminalHeight;

void update_cursor()
 {
    unsigned short position=(terminal_row*VGA_WIDTH) + terminal_column;
  400000:	8b 0d 00 00 12 00    	mov    ecx,DWORD PTR ds:0x120000
  400006:	8d 0c 89             	lea    ecx,[ecx+ecx*4]
  400009:	c1 e1 04             	shl    ecx,0x4
  40000c:	66 03 0d 04 00 12 00 	add    cx,WORD PTR ds:0x120004
outb():
/home/yogi/src/os/myHelloWorld/../chrisOS/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
  400013:	ba d4 03 00 00       	mov    edx,0x3d4
  400018:	b8 0f 00 00 00       	mov    eax,0xf
  40001d:	ee                   	out    dx,al
  40001e:	ba d5 03 00 00       	mov    edx,0x3d5
  400023:	89 c8                	mov    eax,ecx
  400025:	ee                   	out    dx,al
  400026:	ba d4 03 00 00       	mov    edx,0x3d4
  40002b:	b8 0e 00 00 00       	mov    eax,0xe
  400030:	ee                   	out    dx,al
  400031:	89 c8                	mov    eax,ecx
  400033:	66 c1 e8 08          	shr    ax,0x8
  400037:	ba d5 03 00 00       	mov    edx,0x3d5
  40003c:	ee                   	out    dx,al
  40003d:	c3                   	ret    

0040003e <make_color>:
make_color():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:38
    outb(0x3D5, (unsigned char )((position>>8)&0xFF));
    //Move the cursor in the bios data area
 }

uint8_t make_color(enum vga_color fg, enum vga_color bg) {
        return fg | bg << 4;
  40003e:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
  400043:	c1 e0 04             	shl    eax,0x4
  400046:	0a 44 24 04          	or     al,BYTE PTR [esp+0x4]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:39
}
  40004a:	c3                   	ret    

0040004b <make_vgaentry>:
make_vgaentry():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:44

uint16_t make_vgaentry(char c, uint8_t color) {
        uint16_t c16 = c;
        uint16_t color16 = color;
        return c16 | color16 << 8;
  40004b:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
  400050:	c1 e0 08             	shl    eax,0x8
  400053:	66 0f be 54 24 04    	movsx  dx,BYTE PTR [esp+0x4]
  400059:	09 d0                	or     eax,edx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:45
}
  40005b:	c3                   	ret    

0040005c <terminal_setcolor>:
terminal_setcolor():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:49


void terminal_setcolor(uint8_t color) {
        terminal_color = color;
  40005c:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  400060:	a2 08 00 12 00       	mov    ds:0x120008,al
  400065:	c3                   	ret    

00400066 <terminal_putentryat>:
terminal_putentryat():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:52
}

void terminal_putentryat(char c, uint8_t color, size_t x, size_t y) {
  400066:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:54
    const size_t index = y * VGA_WIDTH + x;
        terminal_buffer[index] = make_vgaentry(c, color);
  40006a:	8d 04 80             	lea    eax,[eax+eax*4]
  40006d:	c1 e0 04             	shl    eax,0x4
  400070:	03 44 24 0c          	add    eax,DWORD PTR [esp+0xc]
  400074:	0f b6 54 24 08       	movzx  edx,BYTE PTR [esp+0x8]
  400079:	c1 e2 08             	shl    edx,0x8
  40007c:	66 0f be 4c 24 04    	movsx  cx,BYTE PTR [esp+0x4]
  400082:	09 ca                	or     edx,ecx
  400084:	8b 0d 0c 00 12 00    	mov    ecx,DWORD PTR ds:0x12000c
  40008a:	66 89 14 41          	mov    WORD PTR [ecx+eax*2],dx
  40008e:	c3                   	ret    

0040008f <cursorSavePosition>:
cursorSavePosition():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:59
}

void cursorSavePosition()
{
    if (savedPosPointer < 10)
  40008f:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
  400096:	3c 09                	cmp    al,0x9
  400098:	7f 23                	jg     4000bd <cursorSavePosition+0x2e>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:61
    {
        savedPosX[++savedPosPointer] = terminal_column;
  40009a:	83 c0 01             	add    eax,0x1
  40009d:	a2 26 00 12 00       	mov    ds:0x120026,al
  4000a2:	0f be c0             	movsx  eax,al
  4000a5:	8b 15 04 00 12 00    	mov    edx,DWORD PTR ds:0x120004
  4000ab:	88 90 10 00 12 00    	mov    BYTE PTR [eax+0x120010],dl
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:62
        savedPosY[savedPosPointer] = terminal_row;
  4000b1:	8b 15 00 00 12 00    	mov    edx,DWORD PTR ds:0x120000
  4000b7:	88 90 1c 00 12 00    	mov    BYTE PTR [eax+0x12001c],dl
  4000bd:	f3 c3                	repz ret 

004000bf <cursorRestorePosition>:
cursorRestorePosition():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:68
    }
}

void cursorRestorePosition()
{
    if (savedPosPointer > 0)
  4000bf:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
  4000c6:	84 c0                	test   al,al
  4000c8:	7e 29                	jle    4000f3 <cursorRestorePosition+0x34>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:70
    {
        terminal_column = savedPosX[savedPosPointer];
  4000ca:	0f be d0             	movsx  edx,al
  4000cd:	0f b6 8a 10 00 12 00 	movzx  ecx,BYTE PTR [edx+0x120010]
  4000d4:	89 0d 04 00 12 00    	mov    DWORD PTR ds:0x120004,ecx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:71
        terminal_row = savedPosY[savedPosPointer--];
  4000da:	83 e8 01             	sub    eax,0x1
  4000dd:	a2 26 00 12 00       	mov    ds:0x120026,al
  4000e2:	0f b6 82 1c 00 12 00 	movzx  eax,BYTE PTR [edx+0x12001c]
  4000e9:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:72
        update_cursor();
  4000ee:	e8 0d ff ff ff       	call   400000 <update_cursor>
  4000f3:	f3 c3                	repz ret 

004000f5 <terminal_clear>:
terminal_clear():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:77
    }
}

void terminal_clear()
{
  4000f5:	56                   	push   esi
  4000f6:	53                   	push   ebx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:79
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
  4000f7:	ba 00 00 00 00       	mov    edx,0x0
  4000fc:	be 00 00 00 00       	mov    esi,0x0
  400101:	80 3d 27 00 12 00 00 	cmp    BYTE PTR ds:0x120027,0x0
  400108:	75 30                	jne    40013a <terminal_clear+0x45>
  40010a:	eb 36                	jmp    400142 <terminal_clear+0x4d>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:82 (discriminator 3)
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
  40010c:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
  400113:	c1 e0 08             	shl    eax,0x8
  400116:	83 c8 20             	or     eax,0x20
  400119:	8b 0d 0c 00 12 00    	mov    ecx,DWORD PTR ds:0x12000c
  40011f:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
  400123:	83 c2 02             	add    edx,0x2
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:80 (discriminator 3)

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
                for (size_t x = 0; x < VGA_WIDTH; x++) {
  400126:	39 d3                	cmp    ebx,edx
  400128:	75 e2                	jne    40010c <terminal_clear+0x17>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:79 (discriminator 2)
}

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
  40012a:	83 c6 01             	add    esi,0x1
  40012d:	89 da                	mov    edx,ebx
  40012f:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
  400136:	39 f0                	cmp    eax,esi
  400138:	76 08                	jbe    400142 <terminal_clear+0x4d>
  40013a:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
  400140:	eb ca                	jmp    40010c <terminal_clear+0x17>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:85
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
                }
        }
    terminal_column=0;
  400142:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
  400149:	00 00 00 
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:86
    terminal_row=0;
  40014c:	c7 05 00 00 12 00 00 	mov    DWORD PTR ds:0x120000,0x0
  400153:	00 00 00 
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:87
    update_cursor();
  400156:	e8 a5 fe ff ff       	call   400000 <update_cursor>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:88
}
  40015b:	5b                   	pop    ebx
  40015c:	5e                   	pop    esi
  40015d:	c3                   	ret    

0040015e <terminal_clear_line>:
terminal_clear_line():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:91

void terminal_clear_line(unsigned lineNo)
{
  40015e:	53                   	push   ebx
  40015f:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:92
    if (lineNo>SYS_VGA_HEIGHT-1)
  400163:	83 f8 31             	cmp    eax,0x31
  400166:	77 2a                	ja     400192 <terminal_clear_line+0x34>
  400168:	8d 14 80             	lea    edx,[eax+eax*4]
  40016b:	c1 e2 05             	shl    edx,0x5
  40016e:	8d 9a a0 00 00 00    	lea    ebx,[edx+0xa0]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:97 (discriminator 3)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
  400174:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
  40017b:	c1 e0 08             	shl    eax,0x8
  40017e:	83 c8 20             	or     eax,0x20
  400181:	8b 0d 0c 00 12 00    	mov    ecx,DWORD PTR ds:0x12000c
  400187:	66 89 04 11          	mov    WORD PTR [ecx+edx*1],ax
  40018b:	83 c2 02             	add    edx,0x2
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:94 (discriminator 3)

void terminal_clear_line(unsigned lineNo)
{
    if (lineNo>SYS_VGA_HEIGHT-1)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
  40018e:	39 da                	cmp    edx,ebx
  400190:	75 e2                	jne    400174 <terminal_clear_line+0x16>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:99
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
    }
}
  400192:	5b                   	pop    ebx
  400193:	c3                   	ret    

00400194 <terminal_copyline>:
terminal_copyline():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:102

void terminal_copyline(unsigned dstLine, unsigned srcLine)
{
  400194:	83 ec 10             	sub    esp,0x10
  400197:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  40019b:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:107
    unsigned rowBytes = VGA_WIDTH*2;
    uintptr_t dest=(uintptr_t)TEXTMODE_MEMORY_START+(dstLine*rowBytes);
    uintptr_t src=(uintptr_t)TEXTMODE_MEMORY_START+(srcLine*rowBytes);
    
    memcpy((void*)dest,(void*)src,rowBytes);
  40019f:	68 a0 00 00 00       	push   0xa0
  4001a4:	8d 04 80             	lea    eax,[eax+eax*4]
  4001a7:	c1 e0 05             	shl    eax,0x5
  4001aa:	05 00 80 0b 00       	add    eax,0xb8000
  4001af:	50                   	push   eax
  4001b0:	8d 04 92             	lea    eax,[edx+edx*4]
  4001b3:	c1 e0 05             	shl    eax,0x5
  4001b6:	05 00 80 0b 00       	add    eax,0xb8000
  4001bb:	50                   	push   eax
  4001bc:	e8 67 02 00 00       	call   400428 <memcpy>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:108
}
  4001c1:	83 c4 1c             	add    esp,0x1c
  4001c4:	c3                   	ret    

004001c5 <terminal_putchar>:
terminal_putchar():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:110

void terminal_putchar(char c) {
  4001c5:	53                   	push   ebx
  4001c6:	83 ec 08             	sub    esp,0x8
  4001c9:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:111
    if (c=='\n')
  4001cd:	3c 0a                	cmp    al,0xa
  4001cf:	75 16                	jne    4001e7 <terminal_putchar+0x22>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:113
    {
            terminal_column = 0;
  4001d1:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
  4001d8:	00 00 00 
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:114
            terminal_row += 1;
  4001db:	83 05 00 00 12 00 01 	add    DWORD PTR ds:0x120000,0x1
  4001e2:	e9 d8 00 00 00       	jmp    4002bf <terminal_putchar+0xfa>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:116
    }
    else if (c=='\b')
  4001e7:	3c 08                	cmp    al,0x8
  4001e9:	75 48                	jne    400233 <terminal_putchar+0x6e>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:118
    {
        if (terminal_column > 1)
  4001eb:	a1 04 00 12 00       	mov    eax,ds:0x120004
  4001f0:	83 f8 01             	cmp    eax,0x1
  4001f3:	76 0a                	jbe    4001ff <terminal_putchar+0x3a>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:119
            terminal_column--;
  4001f5:	83 e8 01             	sub    eax,0x1
  4001f8:	a3 04 00 12 00       	mov    ds:0x120004,eax
  4001fd:	eb 11                	jmp    400210 <terminal_putchar+0x4b>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:122
        else
        {
            terminal_row--;
  4001ff:	83 2d 00 00 12 00 01 	sub    DWORD PTR ds:0x120000,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:123
            terminal_column=VGA_WIDTH;
  400206:	c7 05 04 00 12 00 50 	mov    DWORD PTR ds:0x120004,0x50
  40020d:	00 00 00 
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:125
        }
        terminal_putentryat(' ', terminal_color, terminal_column, terminal_row);
  400210:	ff 35 00 00 12 00    	push   DWORD PTR ds:0x120000
  400216:	ff 35 04 00 12 00    	push   DWORD PTR ds:0x120004
  40021c:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
  400223:	50                   	push   eax
  400224:	6a 20                	push   0x20
  400226:	e8 3b fe ff ff       	call   400066 <terminal_putentryat>
  40022b:	83 c4 10             	add    esp,0x10
  40022e:	e9 8c 00 00 00       	jmp    4002bf <terminal_putchar+0xfa>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:128
        
    }
    else if (c=='\t')
  400233:	3c 09                	cmp    al,0x9
  400235:	75 3b                	jne    400272 <terminal_putchar+0xad>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:130
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
  400237:	8b 0d 04 00 12 00    	mov    ecx,DWORD PTR ds:0x120004
  40023d:	ba cd cc cc cc       	mov    edx,0xcccccccd
  400242:	89 c8                	mov    eax,ecx
  400244:	f7 e2                	mul    edx
  400246:	c1 ea 02             	shr    edx,0x2
  400249:	8d 5c 92 05          	lea    ebx,[edx+edx*4+0x5]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:132
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
  40024d:	39 d9                	cmp    ecx,ebx
  40024f:	b8 05 00 00 00       	mov    eax,0x5
  400254:	0f 44 d8             	cmove  ebx,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:134
        
        while (terminal_column < goTo)
  400257:	39 d9                	cmp    ecx,ebx
  400259:	73 64                	jae    4002bf <terminal_putchar+0xfa>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:135
            terminal_putchar(' ');;
  40025b:	83 ec 0c             	sub    esp,0xc
  40025e:	6a 20                	push   0x20
  400260:	e8 60 ff ff ff       	call   4001c5 <terminal_putchar>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:134
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
        
        while (terminal_column < goTo)
  400265:	83 c4 10             	add    esp,0x10
  400268:	3b 1d 04 00 12 00    	cmp    ebx,DWORD PTR ds:0x120004
  40026e:	77 eb                	ja     40025b <terminal_putchar+0x96>
  400270:	eb 4d                	jmp    4002bf <terminal_putchar+0xfa>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:141
    
    //6 - cnt=0 to (5-1) 4
    //8 - cnt= to (5-3) 2
    }
    //We're going to ignore carriage return since most systems don't use it.  Unfortunately the FAT library we are using does
    else if (c=='\r')
  400272:	3c 0d                	cmp    al,0xd
  400274:	0f 84 86 00 00 00    	je     400300 <terminal_putchar+0x13b>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:146
        return;

        else
        {
                terminal_putentryat(c, terminal_color, terminal_column, terminal_row);
  40027a:	ff 35 00 00 12 00    	push   DWORD PTR ds:0x120000
  400280:	ff 35 04 00 12 00    	push   DWORD PTR ds:0x120004
  400286:	0f b6 15 08 00 12 00 	movzx  edx,BYTE PTR ds:0x120008
  40028d:	52                   	push   edx
  40028e:	0f be c0             	movsx  eax,al
  400291:	50                   	push   eax
  400292:	e8 cf fd ff ff       	call   400066 <terminal_putentryat>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:147
                if (++terminal_column == VGA_WIDTH) {
  400297:	a1 04 00 12 00       	mov    eax,ds:0x120004
  40029c:	83 c0 01             	add    eax,0x1
  40029f:	83 c4 10             	add    esp,0x10
  4002a2:	83 f8 50             	cmp    eax,0x50
  4002a5:	74 07                	je     4002ae <terminal_putchar+0xe9>
  4002a7:	a3 04 00 12 00       	mov    ds:0x120004,eax
  4002ac:	eb 11                	jmp    4002bf <terminal_putchar+0xfa>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:148
                        terminal_column = 0;
  4002ae:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
  4002b5:	00 00 00 
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:149
                        terminal_row++;
  4002b8:	83 05 00 00 12 00 01 	add    DWORD PTR ds:0x120000,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:152
                }
        }
    if (terminal_row == kTerminalHeight)
  4002bf:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
  4002c6:	3b 05 00 00 12 00    	cmp    eax,DWORD PTR ds:0x120000
  4002cc:	75 2d                	jne    4002fb <terminal_putchar+0x136>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:154 (discriminator 1)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
  4002ce:	85 c0                	test   eax,eax
  4002d0:	74 22                	je     4002f4 <terminal_putchar+0x12f>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:154
  4002d2:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:155 (discriminator 3)
            terminal_copyline(row, row+1);
  4002d7:	8d 58 01             	lea    ebx,[eax+0x1]
  4002da:	83 ec 08             	sub    esp,0x8
  4002dd:	53                   	push   ebx
  4002de:	50                   	push   eax
  4002df:	e8 b0 fe ff ff       	call   400194 <terminal_copyline>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:154 (discriminator 3)
                        terminal_row++;
                }
        }
    if (terminal_row == kTerminalHeight)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
  4002e4:	89 d8                	mov    eax,ebx
  4002e6:	0f b6 15 27 00 12 00 	movzx  edx,BYTE PTR ds:0x120027
  4002ed:	83 c4 10             	add    esp,0x10
  4002f0:	39 da                	cmp    edx,ebx
  4002f2:	77 e3                	ja     4002d7 <terminal_putchar+0x112>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:157
            terminal_copyline(row, row+1);
        //memcpy((void *)TEXTMODE_MEMORY_START, (void *)TEXTMODE_MEMORY_START+160, 160*25);
        terminal_row--;
  4002f4:	83 2d 00 00 12 00 01 	sub    DWORD PTR ds:0x120000,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:159
    }
    update_cursor();
  4002fb:	e8 00 fd ff ff       	call   400000 <update_cursor>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:160
}
  400300:	83 c4 08             	add    esp,0x8
  400303:	5b                   	pop    ebx
  400304:	c3                   	ret    

00400305 <cursorUpdateBiosCursor>:
cursorUpdateBiosCursor():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:165

void cursorUpdateBiosCursor()
{
    uint8_t* bda=(uint8_t*)0x450;
    *bda=(uint8_t)(terminal_column & 0xFF);
  400305:	a1 04 00 12 00       	mov    eax,ds:0x120004
  40030a:	a2 50 04 00 00       	mov    ds:0x450,al
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:167
    bda++;
    *bda=(uint8_t)((terminal_row+3) & 0xFF);
  40030f:	0f b6 05 00 00 12 00 	movzx  eax,BYTE PTR ds:0x120000
  400316:	83 c0 03             	add    eax,0x3
  400319:	a2 51 04 00 00       	mov    ds:0x451,al
  40031e:	c3                   	ret    

0040031f <cursorMoveTo>:
cursorMoveTo():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:172
}

void cursorMoveTo(uint8_t x, uint8_t y)
{
    terminal_row = y;
  40031f:	0f b6 44 24 08       	movzx  eax,BYTE PTR [esp+0x8]
  400324:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:173
    terminal_column = x;
  400329:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
  40032e:	a3 04 00 12 00       	mov    ds:0x120004,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:174
    update_cursor();
  400333:	e8 c8 fc ff ff       	call   400000 <update_cursor>
  400338:	f3 c3                	repz ret 

0040033a <cursorMoveToX>:
cursorMoveToX():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:179
}

void cursorMoveToX(uint8_t x)
{
    terminal_column = x;
  40033a:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
  40033f:	a3 04 00 12 00       	mov    ds:0x120004,eax
  400344:	c3                   	ret    

00400345 <cursorMoveToY>:
cursorMoveToY():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:184
}

void cursorMoveToY(uint8_t y)
{
    terminal_row = y;
  400345:	0f b6 44 24 04       	movzx  eax,BYTE PTR [esp+0x4]
  40034a:	a3 00 00 12 00       	mov    ds:0x120000,eax
  40034f:	c3                   	ret    

00400350 <cursorGetPosX>:
cursorGetPosX():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:190
}

uint8_t cursorGetPosX()
{
    return terminal_column;
}
  400350:	0f b6 05 04 00 12 00 	movzx  eax,BYTE PTR ds:0x120004
  400357:	c3                   	ret    

00400358 <cursorGetMaxX>:
cursorGetMaxX():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:194
int cursorGetMaxX()
{
    return VGA_WIDTH;
}
  400358:	b8 50 00 00 00       	mov    eax,0x50
  40035d:	c3                   	ret    

0040035e <cursorGetMaxY>:
cursorGetMaxY():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:198

int cursorGetMaxY()
{
    return kTerminalHeight;
  40035e:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:199
}
  400365:	c3                   	ret    

00400366 <displayGetMaxXY>:
displayGetMaxXY():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:203

void displayGetMaxXY(int* maxX, int* maxY)
{
    *maxX=VGA_WIDTH;
  400366:	8b 44 24 04          	mov    eax,DWORD PTR [esp+0x4]
  40036a:	c7 00 50 00 00 00    	mov    DWORD PTR [eax],0x50
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:204
    *maxY=kTerminalHeight;
  400370:	0f b6 15 27 00 12 00 	movzx  edx,BYTE PTR ds:0x120027
  400377:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  40037b:	89 10                	mov    DWORD PTR [eax],edx
  40037d:	c3                   	ret    

0040037e <cursorGetPosY>:
cursorGetPosY():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:211
}

uint8_t cursorGetPosY()
{
    return terminal_row;
}
  40037e:	0f b6 05 00 00 12 00 	movzx  eax,BYTE PTR ds:0x120000
  400385:	c3                   	ret    

00400386 <kTermPrint>:
kTermPrint():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:213

void kTermPrint(const char* data) {
  400386:	56                   	push   esi
  400387:	53                   	push   ebx
  400388:	83 ec 10             	sub    esp,0x10
  40038b:	8b 74 24 1c          	mov    esi,DWORD PTR [esp+0x1c]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:214
        size_t datalen = strlen(data);
  40038f:	56                   	push   esi
  400390:	e8 63 06 00 00       	call   4009f8 <strlen>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:215
        for (size_t i = 0; i < datalen; i++)
  400395:	83 c4 10             	add    esp,0x10
  400398:	85 c0                	test   eax,eax
  40039a:	74 1a                	je     4003b6 <kTermPrint+0x30>
  40039c:	89 f3                	mov    ebx,esi
  40039e:	01 c6                	add    esi,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:216 (discriminator 3)
                terminal_putchar(data[i]);
  4003a0:	83 ec 0c             	sub    esp,0xc
  4003a3:	0f be 13             	movsx  edx,BYTE PTR [ebx]
  4003a6:	52                   	push   edx
  4003a7:	e8 19 fe ff ff       	call   4001c5 <terminal_putchar>
  4003ac:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:215 (discriminator 3)
    return terminal_row;
}

void kTermPrint(const char* data) {
        size_t datalen = strlen(data);
        for (size_t i = 0; i < datalen; i++)
  4003af:	83 c4 10             	add    esp,0x10
  4003b2:	39 f3                	cmp    ebx,esi
  4003b4:	75 ea                	jne    4003a0 <kTermPrint+0x1a>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:217
                terminal_putchar(data[i]);
}
  4003b6:	83 c4 04             	add    esp,0x4
  4003b9:	5b                   	pop    ebx
  4003ba:	5e                   	pop    esi
  4003bb:	c3                   	ret    

004003bc <kTermInit>:
kTermInit():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:221


void kTermInit() {
    kTerminalHeight=SYS_VGA_HEIGHT;
  4003bc:	c6 05 27 00 12 00 32 	mov    BYTE PTR ds:0x120027,0x32
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:222
    terminal_row = 0;
  4003c3:	c7 05 00 00 12 00 00 	mov    DWORD PTR ds:0x120000,0x0
  4003ca:	00 00 00 
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:223
    terminal_column = 0;
  4003cd:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
  4003d4:	00 00 00 
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:224
    terminal_color = make_color(COLOR_LIGHT_BROWN, COLOR_BLACK);
  4003d7:	c6 05 08 00 12 00 0e 	mov    BYTE PTR ds:0x120008,0xe
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:225
    terminal_buffer = (uint16_t*) TEXTMODE_MEMORY_START;
  4003de:	c7 05 0c 00 12 00 00 	mov    DWORD PTR ds:0x12000c,0xb8000
  4003e5:	80 0b 00 
  4003e8:	c3                   	ret    

004003e9 <puts>:
puts():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:230
    //terminal_clear();
}

void puts(char* in)
{
  4003e9:	53                   	push   ebx
  4003ea:	83 ec 08             	sub    esp,0x8
  4003ed:	8b 5c 24 10          	mov    ebx,DWORD PTR [esp+0x10]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:231
    while (*in>'\0')
  4003f1:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  4003f4:	84 c0                	test   al,al
  4003f6:	7e 19                	jle    400411 <puts+0x28>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:233
    {
        terminal_putchar(*in++);
  4003f8:	83 c3 01             	add    ebx,0x1
  4003fb:	83 ec 0c             	sub    esp,0xc
  4003fe:	0f be c0             	movsx  eax,al
  400401:	50                   	push   eax
  400402:	e8 be fd ff ff       	call   4001c5 <terminal_putchar>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:231
    //terminal_clear();
}

void puts(char* in)
{
    while (*in>'\0')
  400407:	0f b6 03             	movzx  eax,BYTE PTR [ebx]
  40040a:	83 c4 10             	add    esp,0x10
  40040d:	84 c0                	test   al,al
  40040f:	7f e7                	jg     4003f8 <puts+0xf>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:235
    {
        terminal_putchar(*in++);
    }
}
  400411:	83 c4 08             	add    esp,0x8
  400414:	5b                   	pop    ebx
  400415:	c3                   	ret    

00400416 <putc>:
putc():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:238

void putc(char c)
{
  400416:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:239
    terminal_putchar(c);
  400419:	0f be 44 24 1c       	movsx  eax,BYTE PTR [esp+0x1c]
  40041e:	50                   	push   eax
  40041f:	e8 a1 fd ff ff       	call   4001c5 <terminal_putchar>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/char/console/basic_display.c:240
  400424:	83 c4 1c             	add    esp,0x1c
  400427:	c3                   	ret    

00400428 <memcpy>:
memcpy():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:12
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
void * memcpy(void *dest, const void *src, size_t n)
{
  400428:	57                   	push   edi
  400429:	56                   	push   esi
  40042a:	53                   	push   ebx
  40042b:	8b 44 24 10          	mov    eax,DWORD PTR [esp+0x10]
  40042f:	8b 5c 24 14          	mov    ebx,DWORD PTR [esp+0x14]
  400433:	8b 54 24 18          	mov    edx,DWORD PTR [esp+0x18]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:17
    bool dw,dd;
    
    dd=n%4==0;
    dw=n%2==0;
    if (dd)
  400437:	89 d1                	mov    ecx,edx
  400439:	83 e1 03             	and    ecx,0x3
  40043c:	75 4d                	jne    40048b <memcpy+0x63>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:19
    {
        n /=4;
  40043e:	c1 ea 02             	shr    edx,0x2
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:23
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
  400441:	39 c3                	cmp    ebx,eax
  400443:	72 0e                	jb     400453 <memcpy+0x2b>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
  400445:	b9 00 00 00 00       	mov    ecx,0x0
  40044a:	85 d2                	test   edx,edx
  40044c:	75 2e                	jne    40047c <memcpy+0x54>
  40044e:	e9 b6 00 00 00       	jmp    400509 <memcpy+0xe1>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:24
        n /=4;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
  400453:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
  40045a:	01 fb                	add    ebx,edi
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:25
                t += n;
  40045c:	01 c7                	add    edi,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:26
                while ( (n)-- > 0)
  40045e:	85 d2                	test   edx,edx
  400460:	0f 84 a3 00 00 00    	je     400509 <memcpy+0xe1>
  400466:	f7 da                	neg    edx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:27
                        *--t = *--f;
  400468:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
  40046c:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
  400470:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:26
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
  400473:	39 d1                	cmp    ecx,edx
  400475:	75 f1                	jne    400468 <memcpy+0x40>
  400477:	e9 8d 00 00 00       	jmp    400509 <memcpy+0xe1>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:30
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
  40047c:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
  40047f:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
  400482:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
  400485:	39 ca                	cmp    edx,ecx
  400487:	75 f3                	jne    40047c <memcpy+0x54>
  400489:	eb 7e                	jmp    400509 <memcpy+0xe1>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:33
                        *t++ = *f++;
        return dest;
    }
    else if (dw)
  40048b:	89 d1                	mov    ecx,edx
  40048d:	83 e1 01             	and    ecx,0x1
  400490:	75 42                	jne    4004d4 <memcpy+0xac>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:35
    {
        n /=2;
  400492:	d1 ea                	shr    edx,1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:39
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
  400494:	39 c3                	cmp    ebx,eax
  400496:	72 0b                	jb     4004a3 <memcpy+0x7b>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
  400498:	b9 00 00 00 00       	mov    ecx,0x0
  40049d:	85 d2                	test   edx,edx
  40049f:	75 24                	jne    4004c5 <memcpy+0x9d>
  4004a1:	eb 66                	jmp    400509 <memcpy+0xe1>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:40
        n /=2;
        const uint32_t *f = src;
        uint32_t *t = dest;

        if (f < t) {
                f += n;
  4004a3:	8d 3c 95 00 00 00 00 	lea    edi,[edx*4+0x0]
  4004aa:	01 fb                	add    ebx,edi
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:41
                t += n;
  4004ac:	01 c7                	add    edi,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:42
                while ( (n)-- > 0)
  4004ae:	85 d2                	test   edx,edx
  4004b0:	74 57                	je     400509 <memcpy+0xe1>
  4004b2:	f7 da                	neg    edx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:43
                        *--t = *--f;
  4004b4:	8b 74 8b fc          	mov    esi,DWORD PTR [ebx+ecx*4-0x4]
  4004b8:	89 74 8f fc          	mov    DWORD PTR [edi+ecx*4-0x4],esi
  4004bc:	83 e9 01             	sub    ecx,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:42
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
  4004bf:	39 ca                	cmp    edx,ecx
  4004c1:	75 f1                	jne    4004b4 <memcpy+0x8c>
  4004c3:	eb 44                	jmp    400509 <memcpy+0xe1>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:46
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
  4004c5:	8b 34 8b             	mov    esi,DWORD PTR [ebx+ecx*4]
  4004c8:	89 34 88             	mov    DWORD PTR [eax+ecx*4],esi
  4004cb:	83 c1 01             	add    ecx,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
  4004ce:	39 ca                	cmp    edx,ecx
  4004d0:	75 f3                	jne    4004c5 <memcpy+0x9d>
  4004d2:	eb 35                	jmp    400509 <memcpy+0xe1>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:54
    else
    {
        const char *f = src;
        char *t = dest;

        if (f < t) {
  4004d4:	39 c3                	cmp    ebx,eax
  4004d6:	72 0b                	jb     4004e3 <memcpy+0xbb>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
  4004d8:	be 00 00 00 00       	mov    esi,0x0
  4004dd:	85 d2                	test   edx,edx
  4004df:	75 1a                	jne    4004fb <memcpy+0xd3>
  4004e1:	eb 26                	jmp    400509 <memcpy+0xe1>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
  4004e3:	8d 4a ff             	lea    ecx,[edx-0x1]
  4004e6:	85 d2                	test   edx,edx
  4004e8:	74 1f                	je     400509 <memcpy+0xe1>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:58
                        *--t = *--f;
  4004ea:	0f b6 14 0b          	movzx  edx,BYTE PTR [ebx+ecx*1]
  4004ee:	88 14 08             	mov    BYTE PTR [eax+ecx*1],dl
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
  4004f1:	83 e9 01             	sub    ecx,0x1
  4004f4:	83 f9 ff             	cmp    ecx,0xffffffff
  4004f7:	75 f1                	jne    4004ea <memcpy+0xc2>
  4004f9:	eb 0e                	jmp    400509 <memcpy+0xe1>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:61
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
  4004fb:	0f b6 0c 33          	movzx  ecx,BYTE PTR [ebx+esi*1]
  4004ff:	88 0c 30             	mov    BYTE PTR [eax+esi*1],cl
  400502:	83 c6 01             	add    esi,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
  400505:	39 f2                	cmp    edx,esi
  400507:	75 f2                	jne    4004fb <memcpy+0xd3>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/memcpy.c:64
                        *t++ = *f++;
        return dest;
    }
  400509:	5b                   	pop    ebx
  40050a:	5e                   	pop    esi
  40050b:	5f                   	pop    edi
  40050c:	c3                   	ret    
  40050d:	66 90                	xchg   ax,ax
  40050f:	90                   	nop

00400510 <panic>:
panic():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/panic.c:8
#include <stdarg.h>
#include <time.h>
#include "printf.h"

void __attribute__((noinline))panic(const char *format, ...)
{
  400510:	53                   	push   ebx
  400511:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/myHelloWorld/../chrisOS/src/panic.c:10
    va_list args;
    va_start( args, format );
  400514:	8d 5c 24 14          	lea    ebx,[esp+0x14]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/panic.c:11
    printk("\n>>>panic at instruction prior to address 0x%08X<<<\n", __builtin_return_address(0));
  400518:	83 ec 08             	sub    esp,0x8
  40051b:	ff 74 24 14          	push   DWORD PTR [esp+0x14]
  40051f:	68 94 10 40 00       	push   0x401094
  400524:	e8 6e 04 00 00       	call   400997 <printk>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/panic.c:12
    printk("  >>>");
  400529:	c7 04 24 28 11 40 00 	mov    DWORD PTR [esp],0x401128
  400530:	e8 62 04 00 00       	call   400997 <printk>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/panic.c:13
    printk_valist( format,args);
  400535:	83 c4 08             	add    esp,0x8
  400538:	53                   	push   ebx
  400539:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
  40053d:	e8 3c 04 00 00       	call   40097e <printk_valist>
  400542:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/myHelloWorld/../chrisOS/src/panic.c:15 (discriminator 1)
    panicLoop: 
    __asm__("cli\nhlt\n");
  400545:	fa                   	cli    
  400546:	f4                   	hlt    
  400547:	eb fc                	jmp    400545 <panic+0x35>
  400549:	66 90                	xchg   ax,ax
  40054b:	90                   	nop

0040054c <printchar>:
printchar():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:43
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
	
	if (str) {
  40054c:	85 c0                	test   eax,eax
  40054e:	74 08                	je     400558 <printchar+0xc>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:44
		**str = c;
  400550:	8b 08                	mov    ecx,DWORD PTR [eax]
  400552:	88 11                	mov    BYTE PTR [ecx],dl
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:45
		++(*str);
  400554:	83 00 01             	add    DWORD PTR [eax],0x1
  400557:	c3                   	ret    
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:41
//extern bool pauseDisplay(bool offerToQuit);
extern uint32_t kDebugLevel;
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
  400558:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:47
	
	if (str) {
		**str = c;
		++(*str);
	}
	else terminal_putchar((unsigned char)c);
  40055b:	0f b6 d2             	movzx  edx,dl
  40055e:	52                   	push   edx
  40055f:	e8 61 fc ff ff       	call   4001c5 <terminal_putchar>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:48
}
  400564:	83 c4 1c             	add    esp,0x1c
  400567:	c3                   	ret    

00400568 <prints>:
prints():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:54

#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
  400568:	55                   	push   ebp
  400569:	57                   	push   edi
  40056a:	56                   	push   esi
  40056b:	53                   	push   ebx
  40056c:	83 ec 1c             	sub    esp,0x1c
  40056f:	89 c7                	mov    edi,eax
  400571:	89 d6                	mov    esi,edx
  400573:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  400577:	8b 54 24 30          	mov    edx,DWORD PTR [esp+0x30]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:57
	register int pc = 0, padchar = ' ';

	if (width > 0) {
  40057b:	85 c9                	test   ecx,ecx
  40057d:	0f 8e cb 00 00 00    	jle    40064e <prints+0xe6>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:60 (discriminator 1)
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
  400583:	80 3e 00             	cmp    BYTE PTR [esi],0x0
  400586:	74 1b                	je     4005a3 <prints+0x3b>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:60
  400588:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:60 (discriminator 3)
  40058d:	83 c0 01             	add    eax,0x1
  400590:	80 3c 06 00          	cmp    BYTE PTR [esi+eax*1],0x0
  400594:	75 f7                	jne    40058d <prints+0x25>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:61
		if (len >= width) width = 0;
  400596:	bb 00 00 00 00       	mov    ebx,0x0
  40059b:	39 44 24 0c          	cmp    DWORD PTR [esp+0xc],eax
  40059f:	7e 0f                	jle    4005b0 <prints+0x48>
  4005a1:	eb 05                	jmp    4005a8 <prints+0x40>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:60
	register int pc = 0, padchar = ' ';

	if (width > 0) {
		register int len = 0;
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
  4005a3:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:62
		if (len >= width) width = 0;
		else width -= len;
  4005a8:	8b 4c 24 0c          	mov    ecx,DWORD PTR [esp+0xc]
  4005ac:	29 c1                	sub    ecx,eax
  4005ae:	89 cb                	mov    ebx,ecx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:63
		if (pad & PAD_ZERO) padchar = '0';
  4005b0:	89 d0                	mov    eax,edx
  4005b2:	83 e0 02             	and    eax,0x2
  4005b5:	83 f8 01             	cmp    eax,0x1
  4005b8:	19 ed                	sbb    ebp,ebp
  4005ba:	83 e5 f0             	and    ebp,0xfffffff0
  4005bd:	83 c5 30             	add    ebp,0x30
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:65
	}
	if (!(pad & PAD_RIGHT)) {
  4005c0:	f6 c2 01             	test   dl,0x1
  4005c3:	75 1a                	jne    4005df <prints+0x77>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:66 (discriminator 1)
		for ( ; width > 0; --width) {
  4005c5:	85 db                	test   ebx,ebx
  4005c7:	7e 67                	jle    400630 <prints+0xc8>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:66
  4005c9:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:67 (discriminator 2)
			printchar (out, padchar);
  4005cd:	89 ea                	mov    edx,ebp
  4005cf:	89 f8                	mov    eax,edi
  4005d1:	e8 76 ff ff ff       	call   40054c <printchar>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:66 (discriminator 2)
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
  4005d6:	83 6c 24 0c 01       	sub    DWORD PTR [esp+0xc],0x1
  4005db:	75 f0                	jne    4005cd <prints+0x65>
  4005dd:	eb 66                	jmp    400645 <prints+0xdd>
  4005df:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:71 (discriminator 1)
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
  4005e3:	0f b6 16             	movzx  edx,BYTE PTR [esi]
  4005e6:	84 d2                	test   dl,dl
  4005e8:	74 1e                	je     400608 <prints+0xa0>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
  4005ea:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
  4005ef:	29 de                	sub    esi,ebx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:72 (discriminator 2)
		printchar (out, *string);
  4005f1:	0f be d2             	movsx  edx,dl
  4005f4:	89 f8                	mov    eax,edi
  4005f6:	e8 51 ff ff ff       	call   40054c <printchar>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:73 (discriminator 2)
		++pc;
  4005fb:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
  4005fe:	0f b6 14 1e          	movzx  edx,BYTE PTR [esi+ebx*1]
  400602:	84 d2                	test   dl,dl
  400604:	75 eb                	jne    4005f1 <prints+0x89>
  400606:	eb 05                	jmp    40060d <prints+0xa5>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
  400608:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:75 (discriminator 1)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
  40060d:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  400611:	85 c0                	test   eax,eax
  400613:	7e 45                	jle    40065a <prints+0xf2>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:75
  400615:	89 c6                	mov    esi,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:76 (discriminator 2)
		printchar (out, padchar);
  400617:	89 ea                	mov    edx,ebp
  400619:	89 f8                	mov    eax,edi
  40061b:	e8 2c ff ff ff       	call   40054c <printchar>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:75 (discriminator 2)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
  400620:	83 ee 01             	sub    esi,0x1
  400623:	75 f2                	jne    400617 <prints+0xaf>
  400625:	8b 44 24 0c          	mov    eax,DWORD PTR [esp+0xc]
  400629:	8d 04 03             	lea    eax,[ebx+eax*1]
  40062c:	89 c3                	mov    ebx,eax
  40062e:	eb 2a                	jmp    40065a <prints+0xf2>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:66
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
  400630:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
  400634:	bb 00 00 00 00       	mov    ebx,0x0
  400639:	eb 0a                	jmp    400645 <prints+0xdd>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
  40063b:	bd 20 00 00 00       	mov    ebp,0x20
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
  400640:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:71
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
  400645:	0f b6 16             	movzx  edx,BYTE PTR [esi]
  400648:	84 d2                	test   dl,dl
  40064a:	75 a3                	jne    4005ef <prints+0x87>
  40064c:	eb 0c                	jmp    40065a <prints+0xf2>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:65
		for (ptr = string; *ptr; ++ptr) ++len;
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
  40064e:	f6 c2 01             	test   dl,0x1
  400651:	74 e8                	je     40063b <prints+0xd3>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:55
#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
	register int pc = 0, padchar = ' ';
  400653:	bd 20 00 00 00       	mov    ebp,0x20
  400658:	eb 89                	jmp    4005e3 <prints+0x7b>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:81
		printchar (out, padchar);
		++pc;
	}

	return pc;
}
  40065a:	89 d8                	mov    eax,ebx
  40065c:	83 c4 1c             	add    esp,0x1c
  40065f:	5b                   	pop    ebx
  400660:	5e                   	pop    esi
  400661:	5f                   	pop    edi
  400662:	5d                   	pop    ebp
  400663:	c3                   	ret    

00400664 <printi>:
printi():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:87

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
  400664:	55                   	push   ebp
  400665:	57                   	push   edi
  400666:	56                   	push   esi
  400667:	53                   	push   ebx
  400668:	83 ec 2c             	sub    esp,0x2c
  40066b:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:93
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;

	if (i == 0) {
  40066f:	85 d2                	test   edx,edx
  400671:	75 2a                	jne    40069d <printi+0x39>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:94
		print_buf[0] = '0';
  400673:	c6 44 24 14 30       	mov    BYTE PTR [esp+0x14],0x30
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:95
		print_buf[1] = '\0';
  400678:	c6 44 24 15 00       	mov    BYTE PTR [esp+0x15],0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:96
		return prints (out, print_buf, width, pad);
  40067d:	83 ec 0c             	sub    esp,0xc
  400680:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
  400684:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
  400688:	8d 54 24 24          	lea    edx,[esp+0x24]
  40068c:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  400690:	e8 d3 fe ff ff       	call   400568 <prints>
  400695:	83 c4 10             	add    esp,0x10
  400698:	e9 f1 00 00 00       	jmp    40078e <printi+0x12a>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:99
	}

	if (sg && b == 10 && i < 0) {
  40069d:	83 7c 24 40 00       	cmp    DWORD PTR [esp+0x40],0x0
  4006a2:	0f 95 c3             	setne  bl
  4006a5:	83 f9 0a             	cmp    ecx,0xa
  4006a8:	0f 94 c0             	sete   al
  4006ab:	84 c3                	test   bl,al
  4006ad:	0f 84 c1 00 00 00    	je     400774 <printi+0x110>
  4006b3:	89 d0                	mov    eax,edx
  4006b5:	c1 e8 1f             	shr    eax,0x1f
  4006b8:	84 c0                	test   al,al
  4006ba:	0f 84 b4 00 00 00    	je     400774 <printi+0x110>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
  4006c0:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
  4006c5:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:107
	*s = '\0';

	while (u) {
  4006c9:	89 d3                	mov    ebx,edx
  4006cb:	f7 db                	neg    ebx
  4006cd:	74 54                	je     400723 <printi+0xbf>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:100
		print_buf[1] = '\0';
		return prints (out, print_buf, width, pad);
	}

	if (sg && b == 10 && i < 0) {
		neg = 1;
  4006cf:	c7 44 24 0c 01 00 00 	mov    DWORD PTR [esp+0xc],0x1
  4006d6:	00 
  4006d7:	eb 08                	jmp    4006e1 <printi+0x7d>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
  4006d9:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  4006e0:	00 
  4006e1:	8d 74 24 1f          	lea    esi,[esp+0x1f]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
  4006e5:	89 cf                	mov    edi,ecx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
  4006e7:	8b 44 24 4c          	mov    eax,DWORD PTR [esp+0x4c]
  4006eb:	8d 68 c6             	lea    ebp,[eax-0x3a]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:108

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
		t = u % b;
  4006ee:	89 d8                	mov    eax,ebx
  4006f0:	ba 00 00 00 00       	mov    edx,0x0
  4006f5:	f7 f1                	div    ecx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:110
		if( t >= 10 )
			t += letbase - '0' - 10;
  4006f7:	8d 04 2a             	lea    eax,[edx+ebp*1]
  4006fa:	83 fa 0a             	cmp    edx,0xa
  4006fd:	0f 4c c2             	cmovl  eax,edx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:111
		*--s = t + '0';
  400700:	83 ee 01             	sub    esi,0x1
  400703:	83 c0 30             	add    eax,0x30
  400706:	88 06                	mov    BYTE PTR [esi],al
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:112
		u /= b;
  400708:	89 d8                	mov    eax,ebx
  40070a:	ba 00 00 00 00       	mov    edx,0x0
  40070f:	f7 f7                	div    edi
  400711:	89 c3                	mov    ebx,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:107
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
  400713:	85 c0                	test   eax,eax
  400715:	75 d7                	jne    4006ee <printi+0x8a>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
  400717:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:115
			t += letbase - '0' - 10;
		*--s = t + '0';
		u /= b;
	}

	if (neg) {
  40071c:	83 7c 24 0c 00       	cmp    DWORD PTR [esp+0xc],0x0
  400721:	74 34                	je     400757 <printi+0xf3>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:116
		if( width && (pad & PAD_ZERO) ) {
  400723:	83 7c 24 44 00       	cmp    DWORD PTR [esp+0x44],0x0
  400728:	74 21                	je     40074b <printi+0xe7>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:116 (discriminator 1)
  40072a:	f6 44 24 48 02       	test   BYTE PTR [esp+0x48],0x2
  40072f:	74 1a                	je     40074b <printi+0xe7>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:117
			printchar (out, '-');
  400731:	ba 2d 00 00 00       	mov    edx,0x2d
  400736:	8b 44 24 08          	mov    eax,DWORD PTR [esp+0x8]
  40073a:	e8 0d fe ff ff       	call   40054c <printchar>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:119
			++pc;
			--width;
  40073f:	83 6c 24 44 01       	sub    DWORD PTR [esp+0x44],0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:118
	}

	if (neg) {
		if( width && (pad & PAD_ZERO) ) {
			printchar (out, '-');
			++pc;
  400744:	bb 01 00 00 00       	mov    ebx,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:119
			--width;
  400749:	eb 0c                	jmp    400757 <printi+0xf3>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:122
		}
		else {
			*--s = '-';
  40074b:	c6 46 ff 2d          	mov    BYTE PTR [esi-0x1],0x2d
  40074f:	8d 76 ff             	lea    esi,[esi-0x1]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
  400752:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:126
		else {
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
  400757:	83 ec 0c             	sub    esp,0xc
  40075a:	ff 74 24 54          	push   DWORD PTR [esp+0x54]
  40075e:	8b 4c 24 54          	mov    ecx,DWORD PTR [esp+0x54]
  400762:	89 f2                	mov    edx,esi
  400764:	8b 44 24 18          	mov    eax,DWORD PTR [esp+0x18]
  400768:	e8 fb fd ff ff       	call   400568 <prints>
  40076d:	01 d8                	add    eax,ebx
  40076f:	83 c4 10             	add    esp,0x10
  400772:	eb 1a                	jmp    40078e <printi+0x12a>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:91
static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
	register unsigned int u = i;
  400774:	89 d3                	mov    ebx,edx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:105
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';
  400776:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:107

	while (u) {
  40077b:	85 d2                	test   edx,edx
  40077d:	0f 85 56 ff ff ff    	jne    4006d9 <printi+0x75>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:90

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
  400783:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:104
	if (sg && b == 10 && i < 0) {
		neg = 1;
		u = -i;
	}

	s = print_buf + PRINT_BUF_LEN-1;
  400788:	8d 74 24 1f          	lea    esi,[esp+0x1f]
  40078c:	eb c9                	jmp    400757 <printi+0xf3>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:127
			*--s = '-';
		}
	}

	return pc + prints (out, s, width, pad);
}
  40078e:	83 c4 2c             	add    esp,0x2c
  400791:	5b                   	pop    ebx
  400792:	5e                   	pop    esi
  400793:	5f                   	pop    edi
  400794:	5d                   	pop    ebp
  400795:	c3                   	ret    

00400796 <print>:
print():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:130

static int print(char **out, const char *format, va_list args )
{
  400796:	55                   	push   ebp
  400797:	57                   	push   edi
  400798:	56                   	push   esi
  400799:	53                   	push   ebx
  40079a:	83 ec 2c             	sub    esp,0x2c
  40079d:	89 c7                	mov    edi,eax
  40079f:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:135
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
  4007a3:	0f b6 02             	movzx  eax,BYTE PTR [edx]
  4007a6:	84 c0                	test   al,al
  4007a8:	0f 84 b8 01 00 00    	je     400966 <print+0x1d0>
  4007ae:	89 d5                	mov    ebp,edx
  4007b0:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:136
		if (*format == '%') {
  4007b5:	3c 25                	cmp    al,0x25
  4007b7:	0f 85 88 01 00 00    	jne    400945 <print+0x1af>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:137
			++format;
  4007bd:	8d 5d 01             	lea    ebx,[ebp+0x1]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:139
			width = pad = 0;
			if (*format == '\0') break;
  4007c0:	0f b6 55 01          	movzx  edx,BYTE PTR [ebp+0x1]
  4007c4:	84 d2                	test   dl,dl
  4007c6:	0f 84 9f 01 00 00    	je     40096b <print+0x1d5>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:140
			if (*format == '%') goto out;
  4007cc:	80 fa 25             	cmp    dl,0x25
  4007cf:	0f 84 6e 01 00 00    	je     400943 <print+0x1ad>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:138
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
			width = pad = 0;
  4007d5:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:141
			if (*format == '\0') break;
			if (*format == '%') goto out;
			if (*format == '-') {
  4007da:	80 fa 2d             	cmp    dl,0x2d
  4007dd:	75 08                	jne    4007e7 <print+0x51>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:142
				++format;
  4007df:	8d 5d 02             	lea    ebx,[ebp+0x2]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:143
				pad = PAD_RIGHT;
  4007e2:	b8 01 00 00 00       	mov    eax,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:145
			}
			while (*format == '0') {
  4007e7:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
  4007ea:	75 0b                	jne    4007f7 <print+0x61>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:146
				++format;
  4007ec:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:147
				pad |= PAD_ZERO;
  4007ef:	83 c8 02             	or     eax,0x2
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:145
			if (*format == '%') goto out;
			if (*format == '-') {
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0') {
  4007f2:	80 3b 30             	cmp    BYTE PTR [ebx],0x30
  4007f5:	74 f5                	je     4007ec <print+0x56>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:149 (discriminator 1)
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
  4007f7:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
  4007fa:	8d 4a d0             	lea    ecx,[edx-0x30]
  4007fd:	80 f9 09             	cmp    cl,0x9
  400800:	77 22                	ja     400824 <print+0x8e>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:149
  400802:	b9 00 00 00 00       	mov    ecx,0x0
  400807:	89 c5                	mov    ebp,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:150 (discriminator 2)
				width *= 10;
  400809:	8d 04 89             	lea    eax,[ecx+ecx*4]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:151 (discriminator 2)
				width += *format - '0';
  40080c:	0f be d2             	movsx  edx,dl
  40080f:	8d 4c 42 d0          	lea    ecx,[edx+eax*2-0x30]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:149 (discriminator 2)
			}
			while (*format == '0') {
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
  400813:	83 c3 01             	add    ebx,0x1
  400816:	0f b6 13             	movzx  edx,BYTE PTR [ebx]
  400819:	8d 42 d0             	lea    eax,[edx-0x30]
  40081c:	3c 09                	cmp    al,0x9
  40081e:	76 e9                	jbe    400809 <print+0x73>
  400820:	89 e8                	mov    eax,ebp
  400822:	eb 05                	jmp    400829 <print+0x93>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:149
  400824:	b9 00 00 00 00       	mov    ecx,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:153
				width *= 10;
				width += *format - '0';
			}
			if( *format == 's' ) {
  400829:	80 fa 73             	cmp    dl,0x73
  40082c:	75 2c                	jne    40085a <print+0xc4>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:154
				register char *s = (char *)va_arg( args, int );
  40082e:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  400832:	8d 6a 04             	lea    ebp,[edx+0x4]
  400835:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
  400839:	8b 12                	mov    edx,DWORD PTR [edx]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:155
				pc += prints (out, s?s:"(null)", width, pad);
  40083b:	85 d2                	test   edx,edx
  40083d:	bd 2e 11 40 00       	mov    ebp,0x40112e
  400842:	0f 44 d5             	cmove  edx,ebp
  400845:	83 ec 0c             	sub    esp,0xc
  400848:	50                   	push   eax
  400849:	89 f8                	mov    eax,edi
  40084b:	e8 18 fd ff ff       	call   400568 <prints>
  400850:	01 c6                	add    esi,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:156
				continue;
  400852:	83 c4 10             	add    esp,0x10
  400855:	e9 fb 00 00 00       	jmp    400955 <print+0x1bf>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:158
			}
			if( *format == 'd' ) {
  40085a:	80 fa 64             	cmp    dl,0x64
  40085d:	75 29                	jne    400888 <print+0xf2>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:159
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
  40085f:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  400863:	8d 6a 04             	lea    ebp,[edx+0x4]
  400866:	6a 61                	push   0x61
  400868:	50                   	push   eax
  400869:	51                   	push   ecx
  40086a:	6a 01                	push   0x1
  40086c:	b9 0a 00 00 00       	mov    ecx,0xa
  400871:	8b 12                	mov    edx,DWORD PTR [edx]
  400873:	89 f8                	mov    eax,edi
  400875:	e8 ea fd ff ff       	call   400664 <printi>
  40087a:	01 c6                	add    esi,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:160
				continue;
  40087c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:159
				register char *s = (char *)va_arg( args, int );
				pc += prints (out, s?s:"(null)", width, pad);
				continue;
			}
			if( *format == 'd' ) {
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
  40087f:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:160
				continue;
  400883:	e9 cd 00 00 00       	jmp    400955 <print+0x1bf>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:162
			}
			if( *format == 'x' ) {
  400888:	80 fa 78             	cmp    dl,0x78
  40088b:	75 2b                	jne    4008b8 <print+0x122>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:163
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
  40088d:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
  400891:	89 ea                	mov    edx,ebp
  400893:	83 c5 04             	add    ebp,0x4
  400896:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
  40089a:	6a 61                	push   0x61
  40089c:	50                   	push   eax
  40089d:	51                   	push   ecx
  40089e:	6a 00                	push   0x0
  4008a0:	b9 10 00 00 00       	mov    ecx,0x10
  4008a5:	8b 12                	mov    edx,DWORD PTR [edx]
  4008a7:	89 f8                	mov    eax,edi
  4008a9:	e8 b6 fd ff ff       	call   400664 <printi>
  4008ae:	01 c6                	add    esi,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:164
				continue;
  4008b0:	83 c4 10             	add    esp,0x10
  4008b3:	e9 9d 00 00 00       	jmp    400955 <print+0x1bf>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:166
			}
			if( *format == 'X' ) {
  4008b8:	80 fa 58             	cmp    dl,0x58
  4008bb:	75 26                	jne    4008e3 <print+0x14d>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:167
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
  4008bd:	8b 54 24 0c          	mov    edx,DWORD PTR [esp+0xc]
  4008c1:	8d 6a 04             	lea    ebp,[edx+0x4]
  4008c4:	6a 41                	push   0x41
  4008c6:	50                   	push   eax
  4008c7:	51                   	push   ecx
  4008c8:	6a 00                	push   0x0
  4008ca:	b9 10 00 00 00       	mov    ecx,0x10
  4008cf:	8b 12                	mov    edx,DWORD PTR [edx]
  4008d1:	89 f8                	mov    eax,edi
  4008d3:	e8 8c fd ff ff       	call   400664 <printi>
  4008d8:	01 c6                	add    esi,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:168
				continue;
  4008da:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:167
			if( *format == 'x' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
				continue;
			}
			if( *format == 'X' ) {
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
  4008dd:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:168
				continue;
  4008e1:	eb 72                	jmp    400955 <print+0x1bf>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:170
			}
			if( *format == 'u' ) {
  4008e3:	80 fa 75             	cmp    dl,0x75
  4008e6:	75 28                	jne    400910 <print+0x17a>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:171
				pc += printi (out, va_arg( args, int ), 10, 0, width, pad, 'a');
  4008e8:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
  4008ec:	89 ea                	mov    edx,ebp
  4008ee:	83 c5 04             	add    ebp,0x4
  4008f1:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
  4008f5:	6a 61                	push   0x61
  4008f7:	50                   	push   eax
  4008f8:	51                   	push   ecx
  4008f9:	6a 00                	push   0x0
  4008fb:	b9 0a 00 00 00       	mov    ecx,0xa
  400900:	8b 12                	mov    edx,DWORD PTR [edx]
  400902:	89 f8                	mov    eax,edi
  400904:	e8 5b fd ff ff       	call   400664 <printi>
  400909:	01 c6                	add    esi,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:172
				continue;
  40090b:	83 c4 10             	add    esp,0x10
  40090e:	eb 45                	jmp    400955 <print+0x1bf>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:174
			}
			if( *format == 'c' ) {
  400910:	80 fa 63             	cmp    dl,0x63
  400913:	75 40                	jne    400955 <print+0x1bf>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:176
				/* char are converted to int then pushed on the stack */
				scr[0] = (char)va_arg( args, int );
  400915:	8b 6c 24 0c          	mov    ebp,DWORD PTR [esp+0xc]
  400919:	89 ea                	mov    edx,ebp
  40091b:	83 c5 04             	add    ebp,0x4
  40091e:	89 6c 24 0c          	mov    DWORD PTR [esp+0xc],ebp
  400922:	8b 12                	mov    edx,DWORD PTR [edx]
  400924:	88 54 24 1e          	mov    BYTE PTR [esp+0x1e],dl
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:177
				scr[1] = '\0';
  400928:	c6 44 24 1f 00       	mov    BYTE PTR [esp+0x1f],0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:178
				pc += prints (out, scr, width, pad);
  40092d:	83 ec 0c             	sub    esp,0xc
  400930:	50                   	push   eax
  400931:	8d 54 24 2e          	lea    edx,[esp+0x2e]
  400935:	89 f8                	mov    eax,edi
  400937:	e8 2c fc ff ff       	call   400568 <prints>
  40093c:	01 c6                	add    esi,eax
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:179
				continue;
  40093e:	83 c4 10             	add    esp,0x10
  400941:	eb 12                	jmp    400955 <print+0x1bf>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:137
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
  400943:	89 dd                	mov    ebp,ebx
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:184
				continue;
			}
		}
		else {
		out:
			printchar (out, *format);
  400945:	0f be 55 00          	movsx  edx,BYTE PTR [ebp+0x0]
  400949:	89 f8                	mov    eax,edi
  40094b:	e8 fc fb ff ff       	call   40054c <printchar>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:185
			++pc;
  400950:	83 c6 01             	add    esi,0x1
  400953:	89 eb                	mov    ebx,ebp
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:135
{
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
  400955:	8d 6b 01             	lea    ebp,[ebx+0x1]
  400958:	0f b6 43 01          	movzx  eax,BYTE PTR [ebx+0x1]
  40095c:	84 c0                	test   al,al
  40095e:	0f 85 51 fe ff ff    	jne    4007b5 <print+0x1f>
  400964:	eb 05                	jmp    40096b <print+0x1d5>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:132
}

static int print(char **out, const char *format, va_list args )
{
	register int width, pad;
	register int pc = 0;
  400966:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:188
		out:
			printchar (out, *format);
			++pc;
		}
	}
	if (out) **out = '\0';
  40096b:	85 ff                	test   edi,edi
  40096d:	74 05                	je     400974 <print+0x1de>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:188 (discriminator 1)
  40096f:	8b 07                	mov    eax,DWORD PTR [edi]
  400971:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:191
	va_end( args );
	return pc;
}
  400974:	89 f0                	mov    eax,esi
  400976:	83 c4 2c             	add    esp,0x2c
  400979:	5b                   	pop    ebx
  40097a:	5e                   	pop    esi
  40097b:	5f                   	pop    edi
  40097c:	5d                   	pop    ebp
  40097d:	c3                   	ret    

0040097e <printk_valist>:
printk_valist():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:194

int printk_valist(const char *format, va_list args)
{
  40097e:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:195
    return print(0, format, args);
  400981:	8b 4c 24 14          	mov    ecx,DWORD PTR [esp+0x14]
  400985:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
  400989:	b8 00 00 00 00       	mov    eax,0x0
  40098e:	e8 03 fe ff ff       	call   400796 <print>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:196
}
  400993:	83 c4 0c             	add    esp,0xc
  400996:	c3                   	ret    

00400997 <printk>:
printk():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:199

int printk(const char *format, ...)
{
  400997:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:201
        va_list args;
        va_start( args, format );
  40099a:	8d 44 24 14          	lea    eax,[esp+0x14]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:202
        return printk_valist(format, args);
  40099e:	83 ec 08             	sub    esp,0x8
  4009a1:	50                   	push   eax
  4009a2:	ff 74 24 1c          	push   DWORD PTR [esp+0x1c]
  4009a6:	e8 d3 ff ff ff       	call   40097e <printk_valist>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:203
}
  4009ab:	83 c4 1c             	add    esp,0x1c
  4009ae:	c3                   	ret    

004009af <printd>:
printd():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:209

#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
  4009af:	83 ec 0c             	sub    esp,0xc
  4009b2:	8b 54 24 10          	mov    edx,DWORD PTR [esp+0x10]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:210
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
  4009b6:	89 d1                	mov    ecx,edx
  4009b8:	23 0d 78 48 12 00    	and    ecx,DWORD PTR ds:0x124878
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:222
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
    }
    return 0;
  4009be:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:210
#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
  4009c3:	39 ca                	cmp    edx,ecx
  4009c5:	75 14                	jne    4009db <printd+0x2c>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:214
    {
        va_list args;

        va_start( args, format );
  4009c7:	8d 44 24 18          	lea    eax,[esp+0x18]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:220
//        if (++printDLineCount==SYS_VGA_HEIGHT-1)
//        {
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
  4009cb:	83 ec 08             	sub    esp,0x8
  4009ce:	50                   	push   eax
  4009cf:	ff 74 24 20          	push   DWORD PTR [esp+0x20]
  4009d3:	e8 a6 ff ff ff       	call   40097e <printk_valist>
  4009d8:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:223 (discriminator 1)
    }
    return 0;
}
  4009db:	83 c4 0c             	add    esp,0xc
  4009de:	c3                   	ret    

004009df <sprintf>:
sprintf():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:227
#endif

int sprintf(char *out, const char *format, ...)
{
  4009df:	83 ec 0c             	sub    esp,0xc
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:231
        va_list args;
        
        va_start( args, format );
        return print( &out, format, args );
  4009e2:	8d 4c 24 18          	lea    ecx,[esp+0x18]
  4009e6:	8b 54 24 14          	mov    edx,DWORD PTR [esp+0x14]
  4009ea:	8d 44 24 10          	lea    eax,[esp+0x10]
  4009ee:	e8 a3 fd ff ff       	call   400796 <print>
/home/yogi/src/os/myHelloWorld/../chrisOS/src/printf.c:232
}
  4009f3:	83 c4 0c             	add    esp,0xc
  4009f6:	c3                   	ret    
  4009f7:	90                   	nop

004009f8 <strlen>:
strlen():
/home/yogi/src/os/myHelloWorld/../chrisOS/src/strings/strlen.c:3
#include <stddef.h>

size_t strlen(const char* str) {
  4009f8:	8b 54 24 04          	mov    edx,DWORD PTR [esp+0x4]
/home/yogi/src/os/myHelloWorld/../chrisOS/src/strings/strlen.c:5
          size_t ret = 0;
        while ( str[ret] != 0 )
  4009fc:	80 3a 00             	cmp    BYTE PTR [edx],0x0
  4009ff:	74 10                	je     400a11 <strlen+0x19>
  400a01:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/strings/strlen.c:6
                ret++;
  400a06:	83 c0 01             	add    eax,0x1
/home/yogi/src/os/myHelloWorld/../chrisOS/src/strings/strlen.c:5
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
  400a09:	80 3c 02 00          	cmp    BYTE PTR [edx+eax*1],0x0
  400a0d:	75 f7                	jne    400a06 <strlen+0xe>
  400a0f:	f3 c3                	repz ret 
/home/yogi/src/os/myHelloWorld/../chrisOS/src/strings/strlen.c:4
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
  400a11:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/myHelloWorld/../chrisOS/src/strings/strlen.c:8
        while ( str[ret] != 0 )
                ret++;
        return ret;
}
  400a16:	c3                   	ret    
  400a17:	90                   	nop

00400a18 <dddd>:
dddd():
/home/yogi/src/os/myHelloWorld/main.c:20
 * MyHelloWorld
 */

volatile  uint32_t* kTicksSinceStart;
uint32_t test=0;
void dddd(void) {
  400a18:	83 ec 14             	sub    esp,0x14
/home/yogi/src/os/myHelloWorld/main.c:22
    uint32_t savedESP;
    test=&savedPosPointer;
  400a1b:	c7 05 20 ca 40 00 26 	mov    DWORD PTR ds:0x40ca20,0x120026
  400a22:	00 12 00 
/home/yogi/src/os/myHelloWorld/main.c:23
    terminal_setcolor(make_color(COLOR_LIGHT_BROWN,COLOR_BLUE));
  400a25:	6a 01                	push   0x1
  400a27:	6a 0e                	push   0xe
  400a29:	e8 10 f6 ff ff       	call   40003e <make_color>
  400a2e:	89 04 24             	mov    DWORD PTR [esp],eax
  400a31:	e8 26 f6 ff ff       	call   40005c <terminal_setcolor>
/home/yogi/src/os/myHelloWorld/main.c:24
    terminal_clear();
  400a36:	e8 ba f6 ff ff       	call   4000f5 <terminal_clear>
/home/yogi/src/os/myHelloWorld/main.c:25
    printk("myHelloWorld 1 loaded!\n");
  400a3b:	c7 04 24 35 11 40 00 	mov    DWORD PTR [esp],0x401135
  400a42:	e8 50 ff ff ff       	call   400997 <printk>
/home/yogi/src/os/myHelloWorld/main.c:26
    printk("Inside/before testFunction, system ticks=%u\n", *kTicksSinceStart);
  400a47:	a1 a0 47 12 00       	mov    eax,ds:0x1247a0
  400a4c:	8b 00                	mov    eax,DWORD PTR [eax]
  400a4e:	83 c4 08             	add    esp,0x8
  400a51:	50                   	push   eax
  400a52:	68 cc 10 40 00       	push   0x4010cc
  400a57:	e8 3b ff ff ff       	call   400997 <printk>
/home/yogi/src/os/myHelloWorld/main.c:27
    uint32_t ticks=*kTicksSinceStart;
  400a5c:	a1 a0 47 12 00       	mov    eax,ds:0x1247a0
  400a61:	8b 10                	mov    edx,DWORD PTR [eax]
/home/yogi/src/os/myHelloWorld/main.c:28
    __asm__("sti\n");
  400a63:	fb                   	sti    
/home/yogi/src/os/myHelloWorld/main.c:29
    {__asm__("hlt\n");}
  400a64:	f4                   	hlt    
/home/yogi/src/os/myHelloWorld/main.c:30
    printk("Inside/after testFunction, system ticks=%u\n", *kTicksSinceStart);
  400a65:	8b 00                	mov    eax,DWORD PTR [eax]
  400a67:	83 c4 08             	add    esp,0x8
  400a6a:	50                   	push   eax
  400a6b:	68 fc 10 40 00       	push   0x4010fc
  400a70:	e8 22 ff ff ff       	call   400997 <printk>
/home/yogi/src/os/myHelloWorld/main.c:31
}
  400a75:	83 c4 1c             	add    esp,0x1c
  400a78:	c3                   	ret    
