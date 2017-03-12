
Debug/cross-Linux/testmainprogramentry:     file format elf32-i386


Disassembly of section .text:

10000000 <outb>:
outb():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);
void printp(const char *format, ...);
void init_serial();
static __inline void outb(unsigned short __port, unsigned char __val)
{
10000000:	55                   	push   ebp
10000001:	89 e5                	mov    ebp,esp
10000003:	83 ec 08             	sub    esp,0x8
10000006:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
10000009:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000000c:	66 89 55 fc          	mov    WORD PTR [ebp-0x4],dx
10000010:	88 45 f8             	mov    BYTE PTR [ebp-0x8],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/include/io.h:24
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
10000013:	0f b6 45 f8          	movzx  eax,BYTE PTR [ebp-0x8]
10000017:	0f b7 55 fc          	movzx  edx,WORD PTR [ebp-0x4]
1000001b:	ee                   	out    dx,al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/include/io.h:25
}
1000001c:	90                   	nop
1000001d:	c9                   	leave  
1000001e:	c3                   	ret    

1000001f <update_cursor>:
update_cursor():
KERNEL_DATA_SECTION uint8_t savedPosY[10];
KERNEL_DATA_SECTION int8_t savedPosPointer=0;
KERNEL_DATA_SECTION uint8_t kTerminalHeight;

void update_cursor()
 {
1000001f:	55                   	push   ebp
10000020:	89 e5                	mov    ebp,esp
10000022:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:26
    unsigned short position=(terminal_row*VGA_WIDTH) + terminal_column;
10000025:	a1 00 00 12 00       	mov    eax,ds:0x120000
1000002a:	89 c2                	mov    edx,eax
1000002c:	b8 50 00 00 00       	mov    eax,0x50
10000031:	0f af c2             	imul   eax,edx
10000034:	8b 15 04 00 12 00    	mov    edx,DWORD PTR ds:0x120004
1000003a:	01 d0                	add    eax,edx
1000003c:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:29
 
    // cursor LOW port to vga INDEX register
    outb(0x3D4, 0x0F);
10000040:	6a 0f                	push   0xf
10000042:	68 d4 03 00 00       	push   0x3d4
10000047:	e8 b4 ff ff ff       	call   10000000 <outb>
1000004c:	83 c4 08             	add    esp,0x8
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:30
    outb(0x3D5, (unsigned char)(position&0xFF));
1000004f:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
10000053:	0f b6 c0             	movzx  eax,al
10000056:	50                   	push   eax
10000057:	68 d5 03 00 00       	push   0x3d5
1000005c:	e8 9f ff ff ff       	call   10000000 <outb>
10000061:	83 c4 08             	add    esp,0x8
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:32
    // cursor HIGH port to vga INDEX register
    outb(0x3D4, 0x0E);
10000064:	6a 0e                	push   0xe
10000066:	68 d4 03 00 00       	push   0x3d4
1000006b:	e8 90 ff ff ff       	call   10000000 <outb>
10000070:	83 c4 08             	add    esp,0x8
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:33
    outb(0x3D5, (unsigned char )((position>>8)&0xFF));
10000073:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
10000077:	66 c1 e8 08          	shr    ax,0x8
1000007b:	0f b6 c0             	movzx  eax,al
1000007e:	50                   	push   eax
1000007f:	68 d5 03 00 00       	push   0x3d5
10000084:	e8 77 ff ff ff       	call   10000000 <outb>
10000089:	83 c4 08             	add    esp,0x8
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:35
    //Move the cursor in the bios data area
 }
1000008c:	90                   	nop
1000008d:	c9                   	leave  
1000008e:	c3                   	ret    

1000008f <make_color>:
make_color():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:37

uint8_t make_color(enum vga_color fg, enum vga_color bg) {
1000008f:	55                   	push   ebp
10000090:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:38
        return fg | bg << 4;
10000092:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000095:	c1 e0 04             	shl    eax,0x4
10000098:	89 c2                	mov    edx,eax
1000009a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000009d:	09 d0                	or     eax,edx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:39
}
1000009f:	5d                   	pop    ebp
100000a0:	c3                   	ret    

100000a1 <make_vgaentry>:
make_vgaentry():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:41

uint16_t make_vgaentry(char c, uint8_t color) {
100000a1:	55                   	push   ebp
100000a2:	89 e5                	mov    ebp,esp
100000a4:	83 ec 18             	sub    esp,0x18
100000a7:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
100000aa:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100000ad:	88 55 ec             	mov    BYTE PTR [ebp-0x14],dl
100000b0:	88 45 e8             	mov    BYTE PTR [ebp-0x18],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:42
        uint16_t c16 = c;
100000b3:	66 0f be 45 ec       	movsx  ax,BYTE PTR [ebp-0x14]
100000b8:	66 89 45 fe          	mov    WORD PTR [ebp-0x2],ax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:43
        uint16_t color16 = color;
100000bc:	0f b6 45 e8          	movzx  eax,BYTE PTR [ebp-0x18]
100000c0:	66 89 45 fc          	mov    WORD PTR [ebp-0x4],ax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:44
        return c16 | color16 << 8;
100000c4:	0f b7 45 fc          	movzx  eax,WORD PTR [ebp-0x4]
100000c8:	c1 e0 08             	shl    eax,0x8
100000cb:	89 c2                	mov    edx,eax
100000cd:	0f b7 45 fe          	movzx  eax,WORD PTR [ebp-0x2]
100000d1:	09 d0                	or     eax,edx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:45
}
100000d3:	c9                   	leave  
100000d4:	c3                   	ret    

100000d5 <terminal_setcolor>:
terminal_setcolor():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:48


void terminal_setcolor(uint8_t color) {
100000d5:	55                   	push   ebp
100000d6:	89 e5                	mov    ebp,esp
100000d8:	83 ec 04             	sub    esp,0x4
100000db:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100000de:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:49
        terminal_color = color;
100000e1:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
100000e5:	a2 08 00 12 00       	mov    ds:0x120008,al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:50
}
100000ea:	90                   	nop
100000eb:	c9                   	leave  
100000ec:	c3                   	ret    

100000ed <terminal_putentryat>:
terminal_putentryat():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:52

void terminal_putentryat(char c, uint8_t color, size_t x, size_t y) {
100000ed:	55                   	push   ebp
100000ee:	89 e5                	mov    ebp,esp
100000f0:	53                   	push   ebx
100000f1:	83 ec 18             	sub    esp,0x18
100000f4:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
100000f7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100000fa:	88 55 e8             	mov    BYTE PTR [ebp-0x18],dl
100000fd:	88 45 e4             	mov    BYTE PTR [ebp-0x1c],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:53
    const size_t index = y * VGA_WIDTH + x;
10000100:	b8 50 00 00 00       	mov    eax,0x50
10000105:	0f af 45 14          	imul   eax,DWORD PTR [ebp+0x14]
10000109:	89 c2                	mov    edx,eax
1000010b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
1000010e:	01 d0                	add    eax,edx
10000110:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:54
        terminal_buffer[index] = make_vgaentry(c, color);
10000113:	a1 0c 00 12 00       	mov    eax,ds:0x12000c
10000118:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
1000011b:	01 d2                	add    edx,edx
1000011d:	8d 1c 10             	lea    ebx,[eax+edx*1]
10000120:	0f b6 55 e4          	movzx  edx,BYTE PTR [ebp-0x1c]
10000124:	0f be 45 e8          	movsx  eax,BYTE PTR [ebp-0x18]
10000128:	52                   	push   edx
10000129:	50                   	push   eax
1000012a:	e8 72 ff ff ff       	call   100000a1 <make_vgaentry>
1000012f:	83 c4 08             	add    esp,0x8
10000132:	66 89 03             	mov    WORD PTR [ebx],ax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:55
}
10000135:	90                   	nop
10000136:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
10000139:	c9                   	leave  
1000013a:	c3                   	ret    

1000013b <cursorSavePosition>:
cursorSavePosition():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:58

void cursorSavePosition()
{
1000013b:	55                   	push   ebp
1000013c:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:59
    if (savedPosPointer < 10)
1000013e:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
10000145:	3c 09                	cmp    al,0x9
10000147:	7f 3b                	jg     10000184 <cursorSavePosition+0x49>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:61
    {
        savedPosX[++savedPosPointer] = terminal_column;
10000149:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
10000150:	83 c0 01             	add    eax,0x1
10000153:	a2 26 00 12 00       	mov    ds:0x120026,al
10000158:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
1000015f:	0f be c0             	movsx  eax,al
10000162:	8b 15 04 00 12 00    	mov    edx,DWORD PTR ds:0x120004
10000168:	88 90 10 00 12 00    	mov    BYTE PTR [eax+0x120010],dl
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:62
        savedPosY[savedPosPointer] = terminal_row;
1000016e:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
10000175:	0f be c0             	movsx  eax,al
10000178:	8b 15 00 00 12 00    	mov    edx,DWORD PTR ds:0x120000
1000017e:	88 90 1c 00 12 00    	mov    BYTE PTR [eax+0x12001c],dl
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:64
    }
}
10000184:	90                   	nop
10000185:	5d                   	pop    ebp
10000186:	c3                   	ret    

10000187 <cursorRestorePosition>:
cursorRestorePosition():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:67

void cursorRestorePosition()
{
10000187:	55                   	push   ebp
10000188:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:68
    if (savedPosPointer > 0)
1000018a:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
10000191:	84 c0                	test   al,al
10000193:	7e 42                	jle    100001d7 <cursorRestorePosition+0x50>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:70
    {
        terminal_column = savedPosX[savedPosPointer];
10000195:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
1000019c:	0f be c0             	movsx  eax,al
1000019f:	0f b6 80 10 00 12 00 	movzx  eax,BYTE PTR [eax+0x120010]
100001a6:	0f b6 c0             	movzx  eax,al
100001a9:	a3 04 00 12 00       	mov    ds:0x120004,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:71
        terminal_row = savedPosY[savedPosPointer--];
100001ae:	0f b6 05 26 00 12 00 	movzx  eax,BYTE PTR ds:0x120026
100001b5:	89 c2                	mov    edx,eax
100001b7:	83 ea 01             	sub    edx,0x1
100001ba:	88 15 26 00 12 00    	mov    BYTE PTR ds:0x120026,dl
100001c0:	0f be c0             	movsx  eax,al
100001c3:	0f b6 80 1c 00 12 00 	movzx  eax,BYTE PTR [eax+0x12001c]
100001ca:	0f b6 c0             	movzx  eax,al
100001cd:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:72
        update_cursor();
100001d2:	e8 48 fe ff ff       	call   1000001f <update_cursor>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:74
    }
}
100001d7:	90                   	nop
100001d8:	5d                   	pop    ebp
100001d9:	c3                   	ret    

100001da <terminal_clear>:
terminal_clear():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:77

void terminal_clear()
{
100001da:	55                   	push   ebp
100001db:	89 e5                	mov    ebp,esp
100001dd:	53                   	push   ebx
100001de:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:79
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
100001e1:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
100001e8:	eb 53                	jmp    1000023d <terminal_clear+0x63>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:80
                for (size_t x = 0; x < VGA_WIDTH; x++) {
100001ea:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
100001f1:	eb 3c                	jmp    1000022f <terminal_clear+0x55>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:81 (discriminator 3)
                        const size_t index = y * VGA_WIDTH + x;
100001f3:	b8 50 00 00 00       	mov    eax,0x50
100001f8:	0f af 45 f8          	imul   eax,DWORD PTR [ebp-0x8]
100001fc:	89 c2                	mov    edx,eax
100001fe:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000201:	01 d0                	add    eax,edx
10000203:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:82 (discriminator 3)
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
10000206:	a1 0c 00 12 00       	mov    eax,ds:0x12000c
1000020b:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
1000020e:	01 d2                	add    edx,edx
10000210:	8d 1c 10             	lea    ebx,[eax+edx*1]
10000213:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
1000021a:	0f b6 c0             	movzx  eax,al
1000021d:	50                   	push   eax
1000021e:	6a 20                	push   0x20
10000220:	e8 7c fe ff ff       	call   100000a1 <make_vgaentry>
10000225:	83 c4 08             	add    esp,0x8
10000228:	66 89 03             	mov    WORD PTR [ebx],ax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:80 (discriminator 3)

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
                for (size_t x = 0; x < VGA_WIDTH; x++) {
1000022b:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:80 (discriminator 1)
1000022f:	b8 50 00 00 00       	mov    eax,0x50
10000234:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
10000237:	72 ba                	jb     100001f3 <terminal_clear+0x19>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:79 (discriminator 2)
}

void terminal_clear()
{
    //terminal_color = make_color(COLOR_LIGHT_GREEN, COLOR_BLACK);
        for (size_t y = 0; y < kTerminalHeight; y++) {
10000239:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:79 (discriminator 1)
1000023d:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
10000244:	0f b6 c0             	movzx  eax,al
10000247:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
1000024a:	77 9e                	ja     100001ea <terminal_clear+0x10>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:85
                for (size_t x = 0; x < VGA_WIDTH; x++) {
                        const size_t index = y * VGA_WIDTH + x;
                        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
                }
        }
    terminal_column=0;
1000024c:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
10000253:	00 00 00 
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:86
    terminal_row=0;
10000256:	c7 05 00 00 12 00 00 	mov    DWORD PTR ds:0x120000,0x0
1000025d:	00 00 00 
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:87
    update_cursor();
10000260:	e8 ba fd ff ff       	call   1000001f <update_cursor>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:88
}
10000265:	90                   	nop
10000266:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
10000269:	c9                   	leave  
1000026a:	c3                   	ret    

1000026b <terminal_clear_line>:
terminal_clear_line():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:91

void terminal_clear_line(unsigned lineNo)
{
1000026b:	55                   	push   ebp
1000026c:	89 e5                	mov    ebp,esp
1000026e:	53                   	push   ebx
1000026f:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:92
    if (lineNo>SYS_VGA_HEIGHT-1)
10000272:	83 7d 08 31          	cmp    DWORD PTR [ebp+0x8],0x31
10000276:	77 51                	ja     100002c9 <terminal_clear_line+0x5e>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:94
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
10000278:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
1000027f:	eb 3c                	jmp    100002bd <terminal_clear_line+0x52>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:96 (discriminator 3)
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
10000281:	b8 50 00 00 00       	mov    eax,0x50
10000286:	0f af 45 08          	imul   eax,DWORD PTR [ebp+0x8]
1000028a:	89 c2                	mov    edx,eax
1000028c:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
1000028f:	01 d0                	add    eax,edx
10000291:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:97 (discriminator 3)
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
10000294:	a1 0c 00 12 00       	mov    eax,ds:0x12000c
10000299:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
1000029c:	01 d2                	add    edx,edx
1000029e:	8d 1c 10             	lea    ebx,[eax+edx*1]
100002a1:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
100002a8:	0f b6 c0             	movzx  eax,al
100002ab:	50                   	push   eax
100002ac:	6a 20                	push   0x20
100002ae:	e8 ee fd ff ff       	call   100000a1 <make_vgaentry>
100002b3:	83 c4 08             	add    esp,0x8
100002b6:	66 89 03             	mov    WORD PTR [ebx],ax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:94 (discriminator 3)

void terminal_clear_line(unsigned lineNo)
{
    if (lineNo>SYS_VGA_HEIGHT-1)
        return;
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
100002b9:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:94 (discriminator 1)
100002bd:	b8 50 00 00 00       	mov    eax,0x50
100002c2:	39 45 f8             	cmp    DWORD PTR [ebp-0x8],eax
100002c5:	72 ba                	jb     10000281 <terminal_clear_line+0x16>
100002c7:	eb 01                	jmp    100002ca <terminal_clear_line+0x5f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:93
}

void terminal_clear_line(unsigned lineNo)
{
    if (lineNo>SYS_VGA_HEIGHT-1)
        return;
100002c9:	90                   	nop
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:99
    for (unsigned cnt=0;cnt<VGA_WIDTH;cnt++)
    {
        const size_t index = lineNo * VGA_WIDTH + cnt;
        terminal_buffer[index] = make_vgaentry(' ', terminal_color);
    }
}
100002ca:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
100002cd:	c9                   	leave  
100002ce:	c3                   	ret    

100002cf <terminal_copyline>:
terminal_copyline():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:102

void terminal_copyline(unsigned dstLine, unsigned srcLine)
{
100002cf:	55                   	push   ebp
100002d0:	89 e5                	mov    ebp,esp
100002d2:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:103
    unsigned rowBytes = VGA_WIDTH*2;
100002d5:	b8 50 00 00 00       	mov    eax,0x50
100002da:	01 c0                	add    eax,eax
100002dc:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:104
    uintptr_t dest=(uintptr_t)TEXTMODE_MEMORY_START+(dstLine*rowBytes);
100002df:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100002e2:	0f af 45 f4          	imul   eax,DWORD PTR [ebp-0xc]
100002e6:	05 00 80 0b 00       	add    eax,0xb8000
100002eb:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:105
    uintptr_t src=(uintptr_t)TEXTMODE_MEMORY_START+(srcLine*rowBytes);
100002ee:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100002f1:	0f af 45 f4          	imul   eax,DWORD PTR [ebp-0xc]
100002f5:	05 00 80 0b 00       	add    eax,0xb8000
100002fa:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:107
    
    memcpy((void*)dest,(void*)src,rowBytes);
100002fd:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
10000300:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
10000303:	83 ec 04             	sub    esp,0x4
10000306:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
10000309:	52                   	push   edx
1000030a:	50                   	push   eax
1000030b:	e8 60 03 00 00       	call   10000670 <memcpy>
10000310:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:108
}
10000313:	90                   	nop
10000314:	c9                   	leave  
10000315:	c3                   	ret    

10000316 <terminal_putchar>:
terminal_putchar():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:110

void terminal_putchar(char c) {
10000316:	55                   	push   ebp
10000317:	89 e5                	mov    ebp,esp
10000319:	53                   	push   ebx
1000031a:	83 ec 24             	sub    esp,0x24
1000031d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000320:	88 45 e4             	mov    BYTE PTR [ebp-0x1c],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:111
    if (c=='\n')
10000323:	80 7d e4 0a          	cmp    BYTE PTR [ebp-0x1c],0xa
10000327:	75 1c                	jne    10000345 <terminal_putchar+0x2f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:113
    {
            terminal_column = 0;
10000329:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
10000330:	00 00 00 
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:114
            terminal_row += 1;
10000333:	a1 00 00 12 00       	mov    eax,ds:0x120000
10000338:	83 c0 01             	add    eax,0x1
1000033b:	a3 00 00 12 00       	mov    ds:0x120000,eax
10000340:	e9 1f 01 00 00       	jmp    10000464 <terminal_putchar+0x14e>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:116
    }
    else if (c=='\b')
10000345:	80 7d e4 08          	cmp    BYTE PTR [ebp-0x1c],0x8
10000349:	75 58                	jne    100003a3 <terminal_putchar+0x8d>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:118
    {
        if (terminal_column > 1)
1000034b:	a1 04 00 12 00       	mov    eax,ds:0x120004
10000350:	83 f8 01             	cmp    eax,0x1
10000353:	76 0f                	jbe    10000364 <terminal_putchar+0x4e>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:119
            terminal_column--;
10000355:	a1 04 00 12 00       	mov    eax,ds:0x120004
1000035a:	83 e8 01             	sub    eax,0x1
1000035d:	a3 04 00 12 00       	mov    ds:0x120004,eax
10000362:	eb 17                	jmp    1000037b <terminal_putchar+0x65>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:122
        else
        {
            terminal_row--;
10000364:	a1 00 00 12 00       	mov    eax,ds:0x120000
10000369:	83 e8 01             	sub    eax,0x1
1000036c:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:123
            terminal_column=VGA_WIDTH;
10000371:	b8 50 00 00 00       	mov    eax,0x50
10000376:	a3 04 00 12 00       	mov    ds:0x120004,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:125
        }
        terminal_putentryat(' ', terminal_color, terminal_column, terminal_row);
1000037b:	8b 0d 00 00 12 00    	mov    ecx,DWORD PTR ds:0x120000
10000381:	8b 15 04 00 12 00    	mov    edx,DWORD PTR ds:0x120004
10000387:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
1000038e:	0f b6 c0             	movzx  eax,al
10000391:	51                   	push   ecx
10000392:	52                   	push   edx
10000393:	50                   	push   eax
10000394:	6a 20                	push   0x20
10000396:	e8 52 fd ff ff       	call   100000ed <terminal_putentryat>
1000039b:	83 c4 10             	add    esp,0x10
1000039e:	e9 c1 00 00 00       	jmp    10000464 <terminal_putchar+0x14e>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:128
        
    }
    else if (c=='\t')
100003a3:	80 7d e4 09          	cmp    BYTE PTR [ebp-0x1c],0x9
100003a7:	75 59                	jne    10000402 <terminal_putchar+0xec>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:130
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
100003a9:	8b 1d 04 00 12 00    	mov    ebx,DWORD PTR ds:0x120004
100003af:	8b 0d 04 00 12 00    	mov    ecx,DWORD PTR ds:0x120004
100003b5:	ba cd cc cc cc       	mov    edx,0xcccccccd
100003ba:	89 c8                	mov    eax,ecx
100003bc:	f7 e2                	mul    edx
100003be:	c1 ea 02             	shr    edx,0x2
100003c1:	89 d0                	mov    eax,edx
100003c3:	c1 e0 02             	shl    eax,0x2
100003c6:	01 d0                	add    eax,edx
100003c8:	29 c1                	sub    ecx,eax
100003ca:	89 ca                	mov    edx,ecx
100003cc:	89 d8                	mov    eax,ebx
100003ce:	29 d0                	sub    eax,edx
100003d0:	83 c0 05             	add    eax,0x5
100003d3:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:131
        if (goTo==terminal_column)
100003d6:	a1 04 00 12 00       	mov    eax,ds:0x120004
100003db:	39 45 f4             	cmp    DWORD PTR [ebp-0xc],eax
100003de:	75 16                	jne    100003f6 <terminal_putchar+0xe0>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:132
            goTo=SCREEN_SPACES_PER_TAB;
100003e0:	c7 45 f4 05 00 00 00 	mov    DWORD PTR [ebp-0xc],0x5
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:134
        
        while (terminal_column < goTo)
100003e7:	eb 0d                	jmp    100003f6 <terminal_putchar+0xe0>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:135
            terminal_putchar(' ');;
100003e9:	83 ec 0c             	sub    esp,0xc
100003ec:	6a 20                	push   0x20
100003ee:	e8 23 ff ff ff       	call   10000316 <terminal_putchar>
100003f3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:134
    {
        uint32_t goTo= terminal_column + (SCREEN_SPACES_PER_TAB - (terminal_column % SCREEN_SPACES_PER_TAB));
        if (goTo==terminal_column)
            goTo=SCREEN_SPACES_PER_TAB;
        
        while (terminal_column < goTo)
100003f6:	a1 04 00 12 00       	mov    eax,ds:0x120004
100003fb:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
100003fe:	72 e9                	jb     100003e9 <terminal_putchar+0xd3>
10000400:	eb 62                	jmp    10000464 <terminal_putchar+0x14e>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:141
    
    //6 - cnt=0 to (5-1) 4
    //8 - cnt= to (5-3) 2
    }
    //We're going to ignore carriage return since most systems don't use it.  Unfortunately the FAT library we are using does
    else if (c=='\r')
10000402:	80 7d e4 0d          	cmp    BYTE PTR [ebp-0x1c],0xd
10000406:	0f 84 b0 00 00 00    	je     100004bc <terminal_putchar+0x1a6>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:146
        return;

        else
        {
                terminal_putentryat(c, terminal_color, terminal_column, terminal_row);
1000040c:	8b 1d 00 00 12 00    	mov    ebx,DWORD PTR ds:0x120000
10000412:	8b 0d 04 00 12 00    	mov    ecx,DWORD PTR ds:0x120004
10000418:	0f b6 05 08 00 12 00 	movzx  eax,BYTE PTR ds:0x120008
1000041f:	0f b6 d0             	movzx  edx,al
10000422:	0f be 45 e4          	movsx  eax,BYTE PTR [ebp-0x1c]
10000426:	53                   	push   ebx
10000427:	51                   	push   ecx
10000428:	52                   	push   edx
10000429:	50                   	push   eax
1000042a:	e8 be fc ff ff       	call   100000ed <terminal_putentryat>
1000042f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:147
                if (++terminal_column == VGA_WIDTH) {
10000432:	a1 04 00 12 00       	mov    eax,ds:0x120004
10000437:	83 c0 01             	add    eax,0x1
1000043a:	a3 04 00 12 00       	mov    ds:0x120004,eax
1000043f:	a1 04 00 12 00       	mov    eax,ds:0x120004
10000444:	ba 50 00 00 00       	mov    edx,0x50
10000449:	39 d0                	cmp    eax,edx
1000044b:	75 17                	jne    10000464 <terminal_putchar+0x14e>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:148
                        terminal_column = 0;
1000044d:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
10000454:	00 00 00 
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:149
                        terminal_row++;
10000457:	a1 00 00 12 00       	mov    eax,ds:0x120000
1000045c:	83 c0 01             	add    eax,0x1
1000045f:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:152
                }
        }
    if (terminal_row == kTerminalHeight)
10000464:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
1000046b:	0f b6 d0             	movzx  edx,al
1000046e:	a1 00 00 12 00       	mov    eax,ds:0x120000
10000473:	39 c2                	cmp    edx,eax
10000475:	75 3e                	jne    100004b5 <terminal_putchar+0x19f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:154
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
10000477:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
1000047e:	eb 19                	jmp    10000499 <terminal_putchar+0x183>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:155 (discriminator 3)
            terminal_copyline(row, row+1);
10000480:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
10000483:	83 c0 01             	add    eax,0x1
10000486:	83 ec 08             	sub    esp,0x8
10000489:	50                   	push   eax
1000048a:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
1000048d:	e8 3d fe ff ff       	call   100002cf <terminal_copyline>
10000492:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:154 (discriminator 3)
                        terminal_row++;
                }
        }
    if (terminal_row == kTerminalHeight)
    {
        for (unsigned row=0;row<kTerminalHeight;row++)
10000495:	83 45 f0 01          	add    DWORD PTR [ebp-0x10],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:154 (discriminator 1)
10000499:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
100004a0:	0f b6 c0             	movzx  eax,al
100004a3:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
100004a6:	77 d8                	ja     10000480 <terminal_putchar+0x16a>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:157
            terminal_copyline(row, row+1);
        //memcpy((void *)TEXTMODE_MEMORY_START, (void *)TEXTMODE_MEMORY_START+160, 160*25);
        terminal_row--;
100004a8:	a1 00 00 12 00       	mov    eax,ds:0x120000
100004ad:	83 e8 01             	sub    eax,0x1
100004b0:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:159
    }
    update_cursor();
100004b5:	e8 65 fb ff ff       	call   1000001f <update_cursor>
100004ba:	eb 01                	jmp    100004bd <terminal_putchar+0x1a7>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:142
    //6 - cnt=0 to (5-1) 4
    //8 - cnt= to (5-3) 2
    }
    //We're going to ignore carriage return since most systems don't use it.  Unfortunately the FAT library we are using does
    else if (c=='\r')
        return;
100004bc:	90                   	nop
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:160
            terminal_copyline(row, row+1);
        //memcpy((void *)TEXTMODE_MEMORY_START, (void *)TEXTMODE_MEMORY_START+160, 160*25);
        terminal_row--;
    }
    update_cursor();
}
100004bd:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
100004c0:	c9                   	leave  
100004c1:	c3                   	ret    

100004c2 <cursorUpdateBiosCursor>:
cursorUpdateBiosCursor():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:163

void cursorUpdateBiosCursor()
{
100004c2:	55                   	push   ebp
100004c3:	89 e5                	mov    ebp,esp
100004c5:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:164
    uint8_t* bda=(uint8_t*)0x450;
100004c8:	c7 45 fc 50 04 00 00 	mov    DWORD PTR [ebp-0x4],0x450
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:165
    *bda=(uint8_t)(terminal_column & 0xFF);
100004cf:	a1 04 00 12 00       	mov    eax,ds:0x120004
100004d4:	89 c2                	mov    edx,eax
100004d6:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
100004d9:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:166
    bda++;
100004db:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:167
    *bda=(uint8_t)((terminal_row+3) & 0xFF);
100004df:	a1 00 00 12 00       	mov    eax,ds:0x120000
100004e4:	8d 50 03             	lea    edx,[eax+0x3]
100004e7:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
100004ea:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:168
}
100004ec:	90                   	nop
100004ed:	c9                   	leave  
100004ee:	c3                   	ret    

100004ef <cursorMoveTo>:
cursorMoveTo():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:171

void cursorMoveTo(uint8_t x, uint8_t y)
{
100004ef:	55                   	push   ebp
100004f0:	89 e5                	mov    ebp,esp
100004f2:	83 ec 08             	sub    esp,0x8
100004f5:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
100004f8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100004fb:	88 55 fc             	mov    BYTE PTR [ebp-0x4],dl
100004fe:	88 45 f8             	mov    BYTE PTR [ebp-0x8],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:172
    terminal_row = y;
10000501:	0f b6 45 f8          	movzx  eax,BYTE PTR [ebp-0x8]
10000505:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:173
    terminal_column = x;
1000050a:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
1000050e:	a3 04 00 12 00       	mov    ds:0x120004,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:174
    update_cursor();
10000513:	e8 07 fb ff ff       	call   1000001f <update_cursor>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:175
}
10000518:	90                   	nop
10000519:	c9                   	leave  
1000051a:	c3                   	ret    

1000051b <cursorMoveToX>:
cursorMoveToX():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:178

void cursorMoveToX(uint8_t x)
{
1000051b:	55                   	push   ebp
1000051c:	89 e5                	mov    ebp,esp
1000051e:	83 ec 04             	sub    esp,0x4
10000521:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000524:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:179
    terminal_column = x;
10000527:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
1000052b:	a3 04 00 12 00       	mov    ds:0x120004,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:180
}
10000530:	90                   	nop
10000531:	c9                   	leave  
10000532:	c3                   	ret    

10000533 <cursorMoveToY>:
cursorMoveToY():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:183

void cursorMoveToY(uint8_t y)
{
10000533:	55                   	push   ebp
10000534:	89 e5                	mov    ebp,esp
10000536:	83 ec 04             	sub    esp,0x4
10000539:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000053c:	88 45 fc             	mov    BYTE PTR [ebp-0x4],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:184
    terminal_row = y;
1000053f:	0f b6 45 fc          	movzx  eax,BYTE PTR [ebp-0x4]
10000543:	a3 00 00 12 00       	mov    ds:0x120000,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:185
}
10000548:	90                   	nop
10000549:	c9                   	leave  
1000054a:	c3                   	ret    

1000054b <cursorGetPosX>:
cursorGetPosX():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:188

uint8_t cursorGetPosX()
{
1000054b:	55                   	push   ebp
1000054c:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:189
    return terminal_column;
1000054e:	a1 04 00 12 00       	mov    eax,ds:0x120004
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:190
}
10000553:	5d                   	pop    ebp
10000554:	c3                   	ret    

10000555 <cursorGetMaxX>:
cursorGetMaxX():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:192
int cursorGetMaxX()
{
10000555:	55                   	push   ebp
10000556:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:193
    return VGA_WIDTH;
10000558:	b8 50 00 00 00       	mov    eax,0x50
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:194
}
1000055d:	5d                   	pop    ebp
1000055e:	c3                   	ret    

1000055f <cursorGetMaxY>:
cursorGetMaxY():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:197

int cursorGetMaxY()
{
1000055f:	55                   	push   ebp
10000560:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:198
    return kTerminalHeight;
10000562:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
10000569:	0f b6 c0             	movzx  eax,al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:199
}
1000056c:	5d                   	pop    ebp
1000056d:	c3                   	ret    

1000056e <displayGetMaxXY>:
displayGetMaxXY():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:202

void displayGetMaxXY(int* maxX, int* maxY)
{
1000056e:	55                   	push   ebp
1000056f:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:203
    *maxX=VGA_WIDTH;
10000571:	b8 50 00 00 00       	mov    eax,0x50
10000576:	89 c2                	mov    edx,eax
10000578:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000057b:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:204
    *maxY=kTerminalHeight;
1000057d:	0f b6 05 27 00 12 00 	movzx  eax,BYTE PTR ds:0x120027
10000584:	0f b6 d0             	movzx  edx,al
10000587:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000058a:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:205
    return;
1000058c:	90                   	nop
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:206
}
1000058d:	5d                   	pop    ebp
1000058e:	c3                   	ret    

1000058f <cursorGetPosY>:
cursorGetPosY():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:209

uint8_t cursorGetPosY()
{
1000058f:	55                   	push   ebp
10000590:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:210
    return terminal_row;
10000592:	a1 00 00 12 00       	mov    eax,ds:0x120000
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:211
}
10000597:	5d                   	pop    ebp
10000598:	c3                   	ret    

10000599 <kTermPrint>:
kTermPrint():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:213

void kTermPrint(const char* data) {
10000599:	55                   	push   ebp
1000059a:	89 e5                	mov    ebp,esp
1000059c:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:214
        size_t datalen = strlen(data);
1000059f:	83 ec 0c             	sub    esp,0xc
100005a2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100005a5:	e8 ea 07 00 00       	call   10000d94 <strlen>
100005aa:	83 c4 10             	add    esp,0x10
100005ad:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:215
        for (size_t i = 0; i < datalen; i++)
100005b0:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
100005b7:	eb 1e                	jmp    100005d7 <kTermPrint+0x3e>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:216 (discriminator 3)
                terminal_putchar(data[i]);
100005b9:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
100005bc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
100005bf:	01 d0                	add    eax,edx
100005c1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
100005c4:	0f be c0             	movsx  eax,al
100005c7:	83 ec 0c             	sub    esp,0xc
100005ca:	50                   	push   eax
100005cb:	e8 46 fd ff ff       	call   10000316 <terminal_putchar>
100005d0:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:215 (discriminator 3)
    return terminal_row;
}

void kTermPrint(const char* data) {
        size_t datalen = strlen(data);
        for (size_t i = 0; i < datalen; i++)
100005d3:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:215 (discriminator 1)
100005d7:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
100005da:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
100005dd:	72 da                	jb     100005b9 <kTermPrint+0x20>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:217
                terminal_putchar(data[i]);
}
100005df:	90                   	nop
100005e0:	c9                   	leave  
100005e1:	c3                   	ret    

100005e2 <kTermInit>:
kTermInit():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:220


void kTermInit() {
100005e2:	55                   	push   ebp
100005e3:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:221
    kTerminalHeight=SYS_VGA_HEIGHT;
100005e5:	c6 05 27 00 12 00 32 	mov    BYTE PTR ds:0x120027,0x32
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:222
    terminal_row = 0;
100005ec:	c7 05 00 00 12 00 00 	mov    DWORD PTR ds:0x120000,0x0
100005f3:	00 00 00 
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:223
    terminal_column = 0;
100005f6:	c7 05 04 00 12 00 00 	mov    DWORD PTR ds:0x120004,0x0
100005fd:	00 00 00 
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:224
    terminal_color = make_color(COLOR_LIGHT_BROWN, COLOR_BLACK);
10000600:	6a 00                	push   0x0
10000602:	6a 0e                	push   0xe
10000604:	e8 86 fa ff ff       	call   1000008f <make_color>
10000609:	83 c4 08             	add    esp,0x8
1000060c:	a2 08 00 12 00       	mov    ds:0x120008,al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:225
    terminal_buffer = (uint16_t*) TEXTMODE_MEMORY_START;
10000611:	c7 05 0c 00 12 00 00 	mov    DWORD PTR ds:0x12000c,0xb8000
10000618:	80 0b 00 
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:227
    //terminal_clear();
}
1000061b:	90                   	nop
1000061c:	c9                   	leave  
1000061d:	c3                   	ret    

1000061e <puts>:
puts():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:230

void puts(char* in)
{
1000061e:	55                   	push   ebp
1000061f:	89 e5                	mov    ebp,esp
10000621:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:231
    while (*in>'\0')
10000624:	eb 1b                	jmp    10000641 <puts+0x23>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:233
    {
        terminal_putchar(*in++);
10000626:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000629:	8d 50 01             	lea    edx,[eax+0x1]
1000062c:	89 55 08             	mov    DWORD PTR [ebp+0x8],edx
1000062f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000632:	0f be c0             	movsx  eax,al
10000635:	83 ec 0c             	sub    esp,0xc
10000638:	50                   	push   eax
10000639:	e8 d8 fc ff ff       	call   10000316 <terminal_putchar>
1000063e:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:231
    //terminal_clear();
}

void puts(char* in)
{
    while (*in>'\0')
10000641:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000644:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000647:	84 c0                	test   al,al
10000649:	7f db                	jg     10000626 <puts+0x8>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:235
    {
        terminal_putchar(*in++);
    }
}
1000064b:	90                   	nop
1000064c:	c9                   	leave  
1000064d:	c3                   	ret    

1000064e <putc>:
putc():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:238

void putc(char c)
{
1000064e:	55                   	push   ebp
1000064f:	89 e5                	mov    ebp,esp
10000651:	83 ec 18             	sub    esp,0x18
10000654:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000657:	88 45 f4             	mov    BYTE PTR [ebp-0xc],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:239
    terminal_putchar(c);
1000065a:	0f be 45 f4          	movsx  eax,BYTE PTR [ebp-0xc]
1000065e:	83 ec 0c             	sub    esp,0xc
10000661:	50                   	push   eax
10000662:	e8 af fc ff ff       	call   10000316 <terminal_putchar>
10000667:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:240
1000066a:	90                   	nop
1000066b:	c9                   	leave  
1000066c:	c3                   	ret    
1000066d:	66 90                	xchg   ax,ax
1000066f:	90                   	nop

10000670 <memcpy>:
memcpy():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:12
 */
//clr 05/26/2016: Modified to copy by 4 or 2 bytes if applicable
//This is needed for many memory mapped registers which cannot be
//copied a byte at a time
void * memcpy(void *dest, const void *src, size_t n)
{
10000670:	55                   	push   ebp
10000671:	89 e5                	mov    ebp,esp
10000673:	83 ec 20             	sub    esp,0x20
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:15
    bool dw,dd;
    
    dd=n%4==0;
10000676:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000679:	83 e0 03             	and    eax,0x3
1000067c:	85 c0                	test   eax,eax
1000067e:	0f 94 c0             	sete   al
10000681:	88 45 e7             	mov    BYTE PTR [ebp-0x19],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:16
    dw=n%2==0;
10000684:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000687:	83 e0 01             	and    eax,0x1
1000068a:	85 c0                	test   eax,eax
1000068c:	0f 94 c0             	sete   al
1000068f:	88 45 e6             	mov    BYTE PTR [ebp-0x1a],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:17
    if (dd)
10000692:	80 7d e7 00          	cmp    BYTE PTR [ebp-0x19],0x0
10000696:	74 7d                	je     10000715 <memcpy+0xa5>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:19
    {
        n /=4;
10000698:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
1000069b:	c1 e8 02             	shr    eax,0x2
1000069e:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:20
        const uint32_t *f = src;
100006a1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100006a4:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:21
        uint32_t *t = dest;
100006a7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100006aa:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:23

        if (f < t) {
100006ad:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
100006b0:	3b 45 f8             	cmp    eax,DWORD PTR [ebp-0x8]
100006b3:	73 4b                	jae    10000700 <memcpy+0x90>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:24
                f += n;
100006b5:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
100006b8:	c1 e0 02             	shl    eax,0x2
100006bb:	01 45 fc             	add    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:25
                t += n;
100006be:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
100006c1:	c1 e0 02             	shl    eax,0x2
100006c4:	01 45 f8             	add    DWORD PTR [ebp-0x8],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:26
                while ( (n)-- > 0)
100006c7:	eb 12                	jmp    100006db <memcpy+0x6b>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:27
                        *--t = *--f;
100006c9:	83 6d f8 04          	sub    DWORD PTR [ebp-0x8],0x4
100006cd:	83 6d fc 04          	sub    DWORD PTR [ebp-0x4],0x4
100006d1:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
100006d4:	8b 10                	mov    edx,DWORD PTR [eax]
100006d6:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
100006d9:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:26
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
100006db:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
100006de:	8d 50 ff             	lea    edx,[eax-0x1]
100006e1:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
100006e4:	85 c0                	test   eax,eax
100006e6:	75 e1                	jne    100006c9 <memcpy+0x59>
100006e8:	eb 23                	jmp    1000070d <memcpy+0x9d>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:30
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
100006ea:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
100006ed:	8d 50 04             	lea    edx,[eax+0x4]
100006f0:	89 55 f8             	mov    DWORD PTR [ebp-0x8],edx
100006f3:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
100006f6:	8d 4a 04             	lea    ecx,[edx+0x4]
100006f9:	89 4d fc             	mov    DWORD PTR [ebp-0x4],ecx
100006fc:	8b 12                	mov    edx,DWORD PTR [edx]
100006fe:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:29
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
10000700:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000703:	8d 50 ff             	lea    edx,[eax-0x1]
10000706:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000709:	85 c0                	test   eax,eax
1000070b:	75 dd                	jne    100006ea <memcpy+0x7a>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:31
                        *t++ = *f++;
        return dest;
1000070d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000710:	e9 ea 00 00 00       	jmp    100007ff <memcpy+0x18f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:33
    }
    else if (dw)
10000715:	80 7d e6 00          	cmp    BYTE PTR [ebp-0x1a],0x0
10000719:	74 79                	je     10000794 <memcpy+0x124>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:35
    {
        n /=2;
1000071b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
1000071e:	d1 e8                	shr    eax,1
10000720:	89 45 10             	mov    DWORD PTR [ebp+0x10],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:36
        const uint32_t *f = src;
10000723:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000726:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:37
        uint32_t *t = dest;
10000729:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000072c:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:39

        if (f < t) {
1000072f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000732:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
10000735:	73 4b                	jae    10000782 <memcpy+0x112>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:40
                f += n;
10000737:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
1000073a:	c1 e0 02             	shl    eax,0x2
1000073d:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:41
                t += n;
10000740:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000743:	c1 e0 02             	shl    eax,0x2
10000746:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:42
                while ( (n)-- > 0)
10000749:	eb 12                	jmp    1000075d <memcpy+0xed>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:43
                        *--t = *--f;
1000074b:	83 6d f0 04          	sub    DWORD PTR [ebp-0x10],0x4
1000074f:	83 6d f4 04          	sub    DWORD PTR [ebp-0xc],0x4
10000753:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000756:	8b 10                	mov    edx,DWORD PTR [eax]
10000758:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
1000075b:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:42
        uint32_t *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while ( (n)-- > 0)
1000075d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000760:	8d 50 ff             	lea    edx,[eax-0x1]
10000763:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000766:	85 c0                	test   eax,eax
10000768:	75 e1                	jne    1000074b <memcpy+0xdb>
1000076a:	eb 23                	jmp    1000078f <memcpy+0x11f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:46
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
                        *t++ = *f++;
1000076c:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
1000076f:	8d 50 04             	lea    edx,[eax+0x4]
10000772:	89 55 f0             	mov    DWORD PTR [ebp-0x10],edx
10000775:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
10000778:	8d 4a 04             	lea    ecx,[edx+0x4]
1000077b:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
1000077e:	8b 12                	mov    edx,DWORD PTR [edx]
10000780:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:45
                f += n;
                t += n;
                while ( (n)-- > 0)
                        *--t = *--f;
        } else
                while ( (n)-- > 0)
10000782:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000785:	8d 50 ff             	lea    edx,[eax-0x1]
10000788:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
1000078b:	85 c0                	test   eax,eax
1000078d:	75 dd                	jne    1000076c <memcpy+0xfc>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:47
                        *t++ = *f++;
        return dest;
1000078f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000792:	eb 6b                	jmp    100007ff <memcpy+0x18f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:51
    }
    else
    {
        const char *f = src;
10000794:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000797:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:52
        char *t = dest;
1000079a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000079d:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:54

        if (f < t) {
100007a0:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
100007a3:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
100007a6:	73 47                	jae    100007ef <memcpy+0x17f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:55
                f += n;
100007a8:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
100007ab:	01 45 ec             	add    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:56
                t += n;
100007ae:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
100007b1:	01 45 e8             	add    DWORD PTR [ebp-0x18],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:57
                while (n-- > 0)
100007b4:	eb 13                	jmp    100007c9 <memcpy+0x159>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:58
                        *--t = *--f;
100007b6:	83 6d e8 01          	sub    DWORD PTR [ebp-0x18],0x1
100007ba:	83 6d ec 01          	sub    DWORD PTR [ebp-0x14],0x1
100007be:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
100007c1:	0f b6 10             	movzx  edx,BYTE PTR [eax]
100007c4:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
100007c7:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:57
        char *t = dest;

        if (f < t) {
                f += n;
                t += n;
                while (n-- > 0)
100007c9:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
100007cc:	8d 50 ff             	lea    edx,[eax-0x1]
100007cf:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
100007d2:	85 c0                	test   eax,eax
100007d4:	75 e0                	jne    100007b6 <memcpy+0x146>
100007d6:	eb 24                	jmp    100007fc <memcpy+0x18c>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:61
                        *--t = *--f;
        } else
                while (n-- > 0)
                        *t++ = *f++;
100007d8:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
100007db:	8d 50 01             	lea    edx,[eax+0x1]
100007de:	89 55 e8             	mov    DWORD PTR [ebp-0x18],edx
100007e1:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
100007e4:	8d 4a 01             	lea    ecx,[edx+0x1]
100007e7:	89 4d ec             	mov    DWORD PTR [ebp-0x14],ecx
100007ea:	0f b6 12             	movzx  edx,BYTE PTR [edx]
100007ed:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:60
                f += n;
                t += n;
                while (n-- > 0)
                        *--t = *--f;
        } else
                while (n-- > 0)
100007ef:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
100007f2:	8d 50 ff             	lea    edx,[eax-0x1]
100007f5:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
100007f8:	85 c0                	test   eax,eax
100007fa:	75 dc                	jne    100007d8 <memcpy+0x168>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:62
                        *t++ = *f++;
        return dest;
100007fc:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/memcpy.c:64
    }
}
100007ff:	c9                   	leave  
10000800:	c3                   	ret    
10000801:	66 90                	xchg   ax,ax
10000803:	90                   	nop

10000804 <outb>:
outb():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/include/io.h:23
void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);
void printp(const char *format, ...);
void init_serial();
static __inline void outb(unsigned short __port, unsigned char __val)
{
10000804:	55                   	push   ebp
10000805:	89 e5                	mov    ebp,esp
10000807:	83 ec 08             	sub    esp,0x8
1000080a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
1000080d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000810:	66 89 55 fc          	mov    WORD PTR [ebp-0x4],dx
10000814:	88 45 f8             	mov    BYTE PTR [ebp-0x8],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/include/io.h:24
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
10000817:	0f b6 45 f8          	movzx  eax,BYTE PTR [ebp-0x8]
1000081b:	0f b7 55 fc          	movzx  edx,WORD PTR [ebp-0x4]
1000081f:	ee                   	out    dx,al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/include/io.h:25
}
10000820:	90                   	nop
10000821:	c9                   	leave  
10000822:	c3                   	ret    

10000823 <printchar>:
printchar():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:45
//extern bool pauseDisplay(bool offerToQuit);
extern uint32_t kDebugLevel;
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
10000823:	55                   	push   ebp
10000824:	89 e5                	mov    ebp,esp
10000826:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:47
	
	if (str) {
10000829:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
1000082d:	74 19                	je     10000848 <printchar+0x25>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:48
		**str = c;
1000082f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000832:	8b 00                	mov    eax,DWORD PTR [eax]
10000834:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
10000837:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:49
		++(*str);
10000839:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000083c:	8b 00                	mov    eax,DWORD PTR [eax]
1000083e:	8d 50 01             	lea    edx,[eax+0x1]
10000841:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000844:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:52
	}
	else terminal_putchar((unsigned char)c);
}
10000846:	eb 12                	jmp    1000085a <printchar+0x37>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:51
	
	if (str) {
		**str = c;
		++(*str);
	}
	else terminal_putchar((unsigned char)c);
10000848:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000084b:	0f b6 c0             	movzx  eax,al
1000084e:	83 ec 0c             	sub    esp,0xc
10000851:	50                   	push   eax
10000852:	e8 bf fa ff ff       	call   10000316 <terminal_putchar>
10000857:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:52
}
1000085a:	90                   	nop
1000085b:	c9                   	leave  
1000085c:	c3                   	ret    

1000085d <prints>:
prints():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:58

#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
1000085d:	55                   	push   ebp
1000085e:	89 e5                	mov    ebp,esp
10000860:	57                   	push   edi
10000861:	56                   	push   esi
10000862:	53                   	push   ebx
10000863:	83 ec 1c             	sub    esp,0x1c
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:59
	register int pc = 0, padchar = ' ';
10000866:	bb 00 00 00 00       	mov    ebx,0x0
1000086b:	c7 45 e4 20 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x20
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:61

	if (width > 0) {
10000872:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
10000876:	7e 39                	jle    100008b1 <prints+0x54>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:62
		register int len = 0;
10000878:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:64
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
1000087d:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
10000880:	eb 06                	jmp    10000888 <prints+0x2b>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:64 (discriminator 3)
10000882:	83 c6 01             	add    esi,0x1
10000885:	83 c7 01             	add    edi,0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:64 (discriminator 1)
10000888:	0f b6 07             	movzx  eax,BYTE PTR [edi]
1000088b:	84 c0                	test   al,al
1000088d:	75 f3                	jne    10000882 <prints+0x25>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:65
		if (len >= width) width = 0;
1000088f:	3b 75 10             	cmp    esi,DWORD PTR [ebp+0x10]
10000892:	7c 09                	jl     1000089d <prints+0x40>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:65 (discriminator 1)
10000894:	c7 45 10 00 00 00 00 	mov    DWORD PTR [ebp+0x10],0x0
1000089b:	eb 03                	jmp    100008a0 <prints+0x43>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:66
		else width -= len;
1000089d:	29 75 10             	sub    DWORD PTR [ebp+0x10],esi
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:67
		if (pad & PAD_ZERO) padchar = '0';
100008a0:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
100008a3:	83 e0 02             	and    eax,0x2
100008a6:	85 c0                	test   eax,eax
100008a8:	74 07                	je     100008b1 <prints+0x54>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:67 (discriminator 1)
100008aa:	c7 45 e4 30 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x30
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:69
	}
	if (!(pad & PAD_RIGHT)) {
100008b1:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
100008b4:	83 e0 01             	and    eax,0x1
100008b7:	85 c0                	test   eax,eax
100008b9:	75 41                	jne    100008fc <prints+0x9f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:70
		for ( ; width > 0; --width) {
100008bb:	eb 18                	jmp    100008d5 <prints+0x78>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:71 (discriminator 2)
			printchar (out, padchar);
100008bd:	83 ec 08             	sub    esp,0x8
100008c0:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
100008c3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100008c6:	e8 58 ff ff ff       	call   10000823 <printchar>
100008cb:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:72 (discriminator 2)
			++pc;
100008ce:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:70 (discriminator 2)
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
100008d1:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:70 (discriminator 1)
100008d5:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
100008d9:	7f e2                	jg     100008bd <prints+0x60>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:75
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
100008db:	eb 1f                	jmp    100008fc <prints+0x9f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:76 (discriminator 2)
		printchar (out, *string);
100008dd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100008e0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
100008e3:	0f be c0             	movsx  eax,al
100008e6:	83 ec 08             	sub    esp,0x8
100008e9:	50                   	push   eax
100008ea:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100008ed:	e8 31 ff ff ff       	call   10000823 <printchar>
100008f2:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:77 (discriminator 2)
		++pc;
100008f5:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:75 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
100008f8:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:75 (discriminator 1)
100008fc:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100008ff:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000902:	84 c0                	test   al,al
10000904:	75 d7                	jne    100008dd <prints+0x80>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:79
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
10000906:	eb 18                	jmp    10000920 <prints+0xc3>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:80 (discriminator 2)
		printchar (out, padchar);
10000908:	83 ec 08             	sub    esp,0x8
1000090b:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
1000090e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000911:	e8 0d ff ff ff       	call   10000823 <printchar>
10000916:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:81 (discriminator 2)
		++pc;
10000919:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:79 (discriminator 2)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
1000091c:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:79 (discriminator 1)
10000920:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
10000924:	7f e2                	jg     10000908 <prints+0xab>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:84
		printchar (out, padchar);
		++pc;
	}

	return pc;
10000926:	89 d8                	mov    eax,ebx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:85
}
10000928:	8d 65 f4             	lea    esp,[ebp-0xc]
1000092b:	5b                   	pop    ebx
1000092c:	5e                   	pop    esi
1000092d:	5f                   	pop    edi
1000092e:	5d                   	pop    ebp
1000092f:	c3                   	ret    

10000930 <printi>:
printi():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:91

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
10000930:	55                   	push   ebp
10000931:	89 e5                	mov    ebp,esp
10000933:	57                   	push   edi
10000934:	56                   	push   esi
10000935:	53                   	push   ebx
10000936:	83 ec 2c             	sub    esp,0x2c
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:94
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
10000939:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
10000940:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:95
	register unsigned int u = i;
10000947:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:97

	if (i == 0) {
1000094a:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
1000094e:	75 22                	jne    10000972 <printi+0x42>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:98
		print_buf[0] = '0';
10000950:	c6 45 dc 30          	mov    BYTE PTR [ebp-0x24],0x30
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:99
		print_buf[1] = '\0';
10000954:	c6 45 dd 00          	mov    BYTE PTR [ebp-0x23],0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:100
		return prints (out, print_buf, width, pad);
10000958:	ff 75 1c             	push   DWORD PTR [ebp+0x1c]
1000095b:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1000095e:	8d 45 dc             	lea    eax,[ebp-0x24]
10000961:	50                   	push   eax
10000962:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000965:	e8 f3 fe ff ff       	call   1000085d <prints>
1000096a:	83 c4 10             	add    esp,0x10
1000096d:	e9 af 00 00 00       	jmp    10000a21 <printi+0xf1>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:103
	}

	if (sg && b == 10 && i < 0) {
10000972:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
10000976:	74 1a                	je     10000992 <printi+0x62>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:103 (discriminator 1)
10000978:	83 7d 10 0a          	cmp    DWORD PTR [ebp+0x10],0xa
1000097c:	75 14                	jne    10000992 <printi+0x62>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:103 (discriminator 2)
1000097e:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
10000982:	79 0e                	jns    10000992 <printi+0x62>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:104
		neg = 1;
10000984:	c7 45 d4 01 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:105
		u = -i;
1000098b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000098e:	f7 d8                	neg    eax
10000990:	89 c6                	mov    esi,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:108
	}

	s = print_buf + PRINT_BUF_LEN-1;
10000992:	8d 5d dc             	lea    ebx,[ebp-0x24]
10000995:	83 c3 0b             	add    ebx,0xb
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:109
	*s = '\0';
10000998:	c6 03 00             	mov    BYTE PTR [ebx],0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:111

	while (u) {
1000099b:	eb 35                	jmp    100009d2 <printi+0xa2>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:112
		t = u % b;
1000099d:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
100009a0:	89 f0                	mov    eax,esi
100009a2:	ba 00 00 00 00       	mov    edx,0x0
100009a7:	f7 f1                	div    ecx
100009a9:	89 d0                	mov    eax,edx
100009ab:	89 c7                	mov    edi,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:113
		if( t >= 10 )
100009ad:	83 ff 09             	cmp    edi,0x9
100009b0:	7e 08                	jle    100009ba <printi+0x8a>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:114
			t += letbase - '0' - 10;
100009b2:	8b 45 20             	mov    eax,DWORD PTR [ebp+0x20]
100009b5:	83 e8 3a             	sub    eax,0x3a
100009b8:	01 c7                	add    edi,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:115
		*--s = t + '0';
100009ba:	83 eb 01             	sub    ebx,0x1
100009bd:	89 f8                	mov    eax,edi
100009bf:	83 c0 30             	add    eax,0x30
100009c2:	88 03                	mov    BYTE PTR [ebx],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:116
		u /= b;
100009c4:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
100009c7:	89 f0                	mov    eax,esi
100009c9:	ba 00 00 00 00       	mov    edx,0x0
100009ce:	f7 f1                	div    ecx
100009d0:	89 c6                	mov    esi,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:111
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
100009d2:	85 f6                	test   esi,esi
100009d4:	75 c7                	jne    1000099d <printi+0x6d>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:119
			t += letbase - '0' - 10;
		*--s = t + '0';
		u /= b;
	}

	if (neg) {
100009d6:	83 7d d4 00          	cmp    DWORD PTR [ebp-0x2c],0x0
100009da:	74 30                	je     10000a0c <printi+0xdc>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:120
		if( width && (pad & PAD_ZERO) ) {
100009dc:	83 7d 18 00          	cmp    DWORD PTR [ebp+0x18],0x0
100009e0:	74 24                	je     10000a06 <printi+0xd6>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:120 (discriminator 1)
100009e2:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
100009e5:	83 e0 02             	and    eax,0x2
100009e8:	85 c0                	test   eax,eax
100009ea:	74 1a                	je     10000a06 <printi+0xd6>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:121
			printchar (out, '-');
100009ec:	83 ec 08             	sub    esp,0x8
100009ef:	6a 2d                	push   0x2d
100009f1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100009f4:	e8 2a fe ff ff       	call   10000823 <printchar>
100009f9:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:122
			++pc;
100009fc:	83 45 d0 01          	add    DWORD PTR [ebp-0x30],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:123
			--width;
10000a00:	83 6d 18 01          	sub    DWORD PTR [ebp+0x18],0x1
10000a04:	eb 06                	jmp    10000a0c <printi+0xdc>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:126
		}
		else {
			*--s = '-';
10000a06:	83 eb 01             	sub    ebx,0x1
10000a09:	c6 03 2d             	mov    BYTE PTR [ebx],0x2d
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:130
		}
	}

	return pc + prints (out, s, width, pad);
10000a0c:	ff 75 1c             	push   DWORD PTR [ebp+0x1c]
10000a0f:	ff 75 18             	push   DWORD PTR [ebp+0x18]
10000a12:	53                   	push   ebx
10000a13:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000a16:	e8 42 fe ff ff       	call   1000085d <prints>
10000a1b:	83 c4 10             	add    esp,0x10
10000a1e:	03 45 d0             	add    eax,DWORD PTR [ebp-0x30]
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:131 (discriminator 1)
}
10000a21:	8d 65 f4             	lea    esp,[ebp-0xc]
10000a24:	5b                   	pop    ebx
10000a25:	5e                   	pop    esi
10000a26:	5f                   	pop    edi
10000a27:	5d                   	pop    ebp
10000a28:	c3                   	ret    

10000a29 <print>:
print():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:134

static int print(char **out, const char *format, va_list args )
{
10000a29:	55                   	push   ebp
10000a2a:	89 e5                	mov    ebp,esp
10000a2c:	57                   	push   edi
10000a2d:	56                   	push   esi
10000a2e:	53                   	push   ebx
10000a2f:	83 ec 1c             	sub    esp,0x1c
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:136
	register int width, pad;
	register int pc = 0;
10000a32:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:139
	char scr[2];

	for (; *format != 0; ++format) {
10000a37:	e9 da 01 00 00       	jmp    10000c16 <print+0x1ed>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:140
		if (*format == '%') {
10000a3c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000a3f:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000a42:	3c 25                	cmp    al,0x25
10000a44:	0f 85 ad 01 00 00    	jne    10000bf7 <print+0x1ce>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:141
			++format;
10000a4a:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:142
			width = pad = 0;
10000a4e:	bf 00 00 00 00       	mov    edi,0x0
10000a53:	89 fe                	mov    esi,edi
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:143
			if (*format == '\0') break;
10000a55:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000a58:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000a5b:	84 c0                	test   al,al
10000a5d:	0f 84 c3 01 00 00    	je     10000c26 <print+0x1fd>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:144
			if (*format == '%') goto out;
10000a63:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000a66:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000a69:	3c 25                	cmp    al,0x25
10000a6b:	0f 84 85 01 00 00    	je     10000bf6 <print+0x1cd>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:145
			if (*format == '-') {
10000a71:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000a74:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000a77:	3c 2d                	cmp    al,0x2d
10000a79:	75 12                	jne    10000a8d <print+0x64>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:146
				++format;
10000a7b:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:147
				pad = PAD_RIGHT;
10000a7f:	bf 01 00 00 00       	mov    edi,0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:149
			}
			while (*format == '0') {
10000a84:	eb 07                	jmp    10000a8d <print+0x64>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:150
				++format;
10000a86:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:151
				pad |= PAD_ZERO;
10000a8a:	83 cf 02             	or     edi,0x2
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:149
			if (*format == '%') goto out;
			if (*format == '-') {
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0') {
10000a8d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000a90:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000a93:	3c 30                	cmp    al,0x30
10000a95:	74 ef                	je     10000a86 <print+0x5d>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:153
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
10000a97:	eb 1d                	jmp    10000ab6 <print+0x8d>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:154 (discriminator 3)
				width *= 10;
10000a99:	89 f0                	mov    eax,esi
10000a9b:	c1 e0 02             	shl    eax,0x2
10000a9e:	01 f0                	add    eax,esi
10000aa0:	01 c0                	add    eax,eax
10000aa2:	89 c6                	mov    esi,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:155 (discriminator 3)
				width += *format - '0';
10000aa4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000aa7:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000aaa:	0f be c0             	movsx  eax,al
10000aad:	83 e8 30             	sub    eax,0x30
10000ab0:	01 c6                	add    esi,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:153 (discriminator 3)
			}
			while (*format == '0') {
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
10000ab2:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:153 (discriminator 1)
10000ab6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000ab9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000abc:	3c 2f                	cmp    al,0x2f
10000abe:	7e 0a                	jle    10000aca <print+0xa1>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:153 (discriminator 2)
10000ac0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000ac3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000ac6:	3c 39                	cmp    al,0x39
10000ac8:	7e cf                	jle    10000a99 <print+0x70>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:157
				width *= 10;
				width += *format - '0';
			}
			if( *format == 's' ) {
10000aca:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000acd:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000ad0:	3c 73                	cmp    al,0x73
10000ad2:	75 2b                	jne    10000aff <print+0xd6>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:158
				register char *s = (char *)va_arg( args, int );
10000ad4:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000ad7:	8d 50 04             	lea    edx,[eax+0x4]
10000ada:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000add:	8b 00                	mov    eax,DWORD PTR [eax]
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:159
				pc += prints (out, s?s:"(null)", width, pad);
10000adf:	85 c0                	test   eax,eax
10000ae1:	74 02                	je     10000ae5 <print+0xbc>
10000ae3:	eb 05                	jmp    10000aea <print+0xc1>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:159 (discriminator 2)
10000ae5:	b8 08 21 00 10       	mov    eax,0x10002108
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:159 (discriminator 4)
10000aea:	57                   	push   edi
10000aeb:	56                   	push   esi
10000aec:	50                   	push   eax
10000aed:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000af0:	e8 68 fd ff ff       	call   1000085d <prints>
10000af5:	83 c4 10             	add    esp,0x10
10000af8:	01 c3                	add    ebx,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:160 (discriminator 4)
				continue;
10000afa:	e9 13 01 00 00       	jmp    10000c12 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:162
			}
			if( *format == 'd' ) {
10000aff:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000b02:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000b05:	3c 64                	cmp    al,0x64
10000b07:	75 29                	jne    10000b32 <print+0x109>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:163
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
10000b09:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000b0c:	8d 50 04             	lea    edx,[eax+0x4]
10000b0f:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000b12:	8b 00                	mov    eax,DWORD PTR [eax]
10000b14:	83 ec 04             	sub    esp,0x4
10000b17:	6a 61                	push   0x61
10000b19:	57                   	push   edi
10000b1a:	56                   	push   esi
10000b1b:	6a 01                	push   0x1
10000b1d:	6a 0a                	push   0xa
10000b1f:	50                   	push   eax
10000b20:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000b23:	e8 08 fe ff ff       	call   10000930 <printi>
10000b28:	83 c4 20             	add    esp,0x20
10000b2b:	01 c3                	add    ebx,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:164
				continue;
10000b2d:	e9 e0 00 00 00       	jmp    10000c12 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:166
			}
			if( *format == 'x' ) {
10000b32:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000b35:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000b38:	3c 78                	cmp    al,0x78
10000b3a:	75 29                	jne    10000b65 <print+0x13c>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:167
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
10000b3c:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000b3f:	8d 50 04             	lea    edx,[eax+0x4]
10000b42:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000b45:	8b 00                	mov    eax,DWORD PTR [eax]
10000b47:	83 ec 04             	sub    esp,0x4
10000b4a:	6a 61                	push   0x61
10000b4c:	57                   	push   edi
10000b4d:	56                   	push   esi
10000b4e:	6a 00                	push   0x0
10000b50:	6a 10                	push   0x10
10000b52:	50                   	push   eax
10000b53:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000b56:	e8 d5 fd ff ff       	call   10000930 <printi>
10000b5b:	83 c4 20             	add    esp,0x20
10000b5e:	01 c3                	add    ebx,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:168
				continue;
10000b60:	e9 ad 00 00 00       	jmp    10000c12 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:170
			}
			if( *format == 'X' ) {
10000b65:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000b68:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000b6b:	3c 58                	cmp    al,0x58
10000b6d:	75 26                	jne    10000b95 <print+0x16c>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:171
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
10000b6f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000b72:	8d 50 04             	lea    edx,[eax+0x4]
10000b75:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000b78:	8b 00                	mov    eax,DWORD PTR [eax]
10000b7a:	83 ec 04             	sub    esp,0x4
10000b7d:	6a 41                	push   0x41
10000b7f:	57                   	push   edi
10000b80:	56                   	push   esi
10000b81:	6a 00                	push   0x0
10000b83:	6a 10                	push   0x10
10000b85:	50                   	push   eax
10000b86:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000b89:	e8 a2 fd ff ff       	call   10000930 <printi>
10000b8e:	83 c4 20             	add    esp,0x20
10000b91:	01 c3                	add    ebx,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:172
				continue;
10000b93:	eb 7d                	jmp    10000c12 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:174
			}
			if( *format == 'u' ) {
10000b95:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000b98:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000b9b:	3c 75                	cmp    al,0x75
10000b9d:	75 26                	jne    10000bc5 <print+0x19c>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:175
				pc += printi (out, va_arg( args, int ), 10, 0, width, pad, 'a');
10000b9f:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000ba2:	8d 50 04             	lea    edx,[eax+0x4]
10000ba5:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000ba8:	8b 00                	mov    eax,DWORD PTR [eax]
10000baa:	83 ec 04             	sub    esp,0x4
10000bad:	6a 61                	push   0x61
10000baf:	57                   	push   edi
10000bb0:	56                   	push   esi
10000bb1:	6a 00                	push   0x0
10000bb3:	6a 0a                	push   0xa
10000bb5:	50                   	push   eax
10000bb6:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000bb9:	e8 72 fd ff ff       	call   10000930 <printi>
10000bbe:	83 c4 20             	add    esp,0x20
10000bc1:	01 c3                	add    ebx,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:176
				continue;
10000bc3:	eb 4d                	jmp    10000c12 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:178
			}
			if( *format == 'c' ) {
10000bc5:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000bc8:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000bcb:	3c 63                	cmp    al,0x63
10000bcd:	75 43                	jne    10000c12 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:180
				/* char are converted to int then pushed on the stack */
				scr[0] = (char)va_arg( args, int );
10000bcf:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000bd2:	8d 50 04             	lea    edx,[eax+0x4]
10000bd5:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000bd8:	8b 00                	mov    eax,DWORD PTR [eax]
10000bda:	88 45 e6             	mov    BYTE PTR [ebp-0x1a],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:181
				scr[1] = '\0';
10000bdd:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:182
				pc += prints (out, scr, width, pad);
10000be1:	57                   	push   edi
10000be2:	56                   	push   esi
10000be3:	8d 45 e6             	lea    eax,[ebp-0x1a]
10000be6:	50                   	push   eax
10000be7:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000bea:	e8 6e fc ff ff       	call   1000085d <prints>
10000bef:	83 c4 10             	add    esp,0x10
10000bf2:	01 c3                	add    ebx,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:183
				continue;
10000bf4:	eb 1c                	jmp    10000c12 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:144
	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
			width = pad = 0;
			if (*format == '\0') break;
			if (*format == '%') goto out;
10000bf6:	90                   	nop
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:188
				continue;
			}
		}
		else {
		out:
			printchar (out, *format);
10000bf7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000bfa:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000bfd:	0f be c0             	movsx  eax,al
10000c00:	83 ec 08             	sub    esp,0x8
10000c03:	50                   	push   eax
10000c04:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000c07:	e8 17 fc ff ff       	call   10000823 <printchar>
10000c0c:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:189
			++pc;
10000c0f:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:139
{
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
10000c12:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:139 (discriminator 1)
10000c16:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000c19:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000c1c:	84 c0                	test   al,al
10000c1e:	0f 85 18 fe ff ff    	jne    10000a3c <print+0x13>
10000c24:	eb 01                	jmp    10000c27 <print+0x1fe>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:143
		if (*format == '%') {
			++format;
			width = pad = 0;
			if (*format == '\0') break;
10000c26:	90                   	nop
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:192
		out:
			printchar (out, *format);
			++pc;
		}
	}
	if (out) **out = '\0';
10000c27:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
10000c2b:	74 08                	je     10000c35 <print+0x20c>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:192 (discriminator 1)
10000c2d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000c30:	8b 00                	mov    eax,DWORD PTR [eax]
10000c32:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:194
	va_end( args );
	return pc;
10000c35:	89 d8                	mov    eax,ebx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:195
}
10000c37:	8d 65 f4             	lea    esp,[ebp-0xc]
10000c3a:	5b                   	pop    ebx
10000c3b:	5e                   	pop    esi
10000c3c:	5f                   	pop    edi
10000c3d:	5d                   	pop    ebp
10000c3e:	c3                   	ret    

10000c3f <printd_valist>:
printd_valist():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:198

int printd_valist(const char *format, va_list args)
{
10000c3f:	55                   	push   ebp
10000c40:	89 e5                	mov    ebp,esp
10000c42:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:199
    return print(0, format, args);
10000c45:	83 ec 04             	sub    esp,0x4
10000c48:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10000c4b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000c4e:	6a 00                	push   0x0
10000c50:	e8 d4 fd ff ff       	call   10000a29 <print>
10000c55:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:200
}
10000c58:	c9                   	leave  
10000c59:	c3                   	ret    

10000c5a <printp_valist>:
printp_valist():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:203

int printp_valist(const char *format, va_list args)
{
10000c5a:	55                   	push   ebp
10000c5b:	89 e5                	mov    ebp,esp
10000c5d:	81 ec 18 04 00 00    	sub    esp,0x418
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:205
    char inString[1024];
    char* in=inString;
10000c63:	8d 85 f4 fb ff ff    	lea    eax,[ebp-0x40c]
10000c69:	89 85 f0 fb ff ff    	mov    DWORD PTR [ebp-0x410],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:207

    print(&in, format,args);
10000c6f:	83 ec 04             	sub    esp,0x4
10000c72:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10000c75:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000c78:	8d 85 f0 fb ff ff    	lea    eax,[ebp-0x410]
10000c7e:	50                   	push   eax
10000c7f:	e8 a5 fd ff ff       	call   10000a29 <print>
10000c84:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:209
    
    for (int cnt=0;cnt<strlen(inString);cnt++)
10000c87:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
10000c8e:	eb 26                	jmp    10000cb6 <printp_valist+0x5c>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:211 (discriminator 3)
    {
            outb(0x3f8,inString[cnt]);
10000c90:	8d 95 f4 fb ff ff    	lea    edx,[ebp-0x40c]
10000c96:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000c99:	01 d0                	add    eax,edx
10000c9b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000c9e:	0f b6 c0             	movzx  eax,al
10000ca1:	83 ec 08             	sub    esp,0x8
10000ca4:	50                   	push   eax
10000ca5:	68 f8 03 00 00       	push   0x3f8
10000caa:	e8 55 fb ff ff       	call   10000804 <outb>
10000caf:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:209 (discriminator 3)
    char inString[1024];
    char* in=inString;

    print(&in, format,args);
    
    for (int cnt=0;cnt<strlen(inString);cnt++)
10000cb2:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:209 (discriminator 1)
10000cb6:	83 ec 0c             	sub    esp,0xc
10000cb9:	8d 85 f4 fb ff ff    	lea    eax,[ebp-0x40c]
10000cbf:	50                   	push   eax
10000cc0:	e8 cf 00 00 00       	call   10000d94 <strlen>
10000cc5:	83 c4 10             	add    esp,0x10
10000cc8:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
10000ccb:	7f c3                	jg     10000c90 <printp_valist+0x36>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:214
    {
            outb(0x3f8,inString[cnt]);
    }
    
}
10000ccd:	90                   	nop
10000cce:	c9                   	leave  
10000ccf:	c3                   	ret    

10000cd0 <printp>:
printp():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:217

void printp(const char *format, ...)
{
10000cd0:	55                   	push   ebp
10000cd1:	89 e5                	mov    ebp,esp
10000cd3:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:219
    va_list args;
    va_start( args, format );
10000cd6:	8d 45 0c             	lea    eax,[ebp+0xc]
10000cd9:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:220
}
10000cdc:	90                   	nop
10000cdd:	c9                   	leave  
10000cde:	c3                   	ret    

10000cdf <printk_valist>:
printk_valist():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:223

int printk_valist(const char *format, va_list args)
{
10000cdf:	55                   	push   ebp
10000ce0:	89 e5                	mov    ebp,esp
10000ce2:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:224
    return print(0, format, args);
10000ce5:	83 ec 04             	sub    esp,0x4
10000ce8:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10000ceb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000cee:	6a 00                	push   0x0
10000cf0:	e8 34 fd ff ff       	call   10000a29 <print>
10000cf5:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:225
}
10000cf8:	c9                   	leave  
10000cf9:	c3                   	ret    

10000cfa <printk>:
printk():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:228

int printk(const char *format, ...)
{
10000cfa:	55                   	push   ebp
10000cfb:	89 e5                	mov    ebp,esp
10000cfd:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:230
        va_list args;
        va_start( args, format );
10000d00:	8d 45 0c             	lea    eax,[ebp+0xc]
10000d03:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:231
        return printk_valist(format, args);
10000d06:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000d09:	83 ec 08             	sub    esp,0x8
10000d0c:	50                   	push   eax
10000d0d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000d10:	e8 ca ff ff ff       	call   10000cdf <printk_valist>
10000d15:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:232
}
10000d18:	c9                   	leave  
10000d19:	c3                   	ret    

10000d1a <printd>:
printd():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:238

#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
10000d1a:	55                   	push   ebp
10000d1b:	89 e5                	mov    ebp,esp
10000d1d:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:239
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
10000d20:	a1 78 98 12 00       	mov    eax,ds:0x129878
10000d25:	23 45 08             	and    eax,DWORD PTR [ebp+0x8]
10000d28:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
10000d2b:	75 3c                	jne    10000d69 <printd+0x4f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:243
    {
        va_list args;

        va_start( args, format );
10000d2d:	8d 45 10             	lea    eax,[ebp+0x10]
10000d30:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:245
        
        if (kDebugLevel & DEBUG_PRINT_TO_PORT)
10000d33:	a1 78 98 12 00       	mov    eax,ds:0x129878
10000d38:	25 00 00 20 00       	and    eax,0x200000
10000d3d:	85 c0                	test   eax,eax
10000d3f:	74 14                	je     10000d55 <printd+0x3b>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:246
            printp_valist(format,args);
10000d41:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000d44:	83 ec 08             	sub    esp,0x8
10000d47:	50                   	push   eax
10000d48:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10000d4b:	e8 0a ff ff ff       	call   10000c5a <printp_valist>
10000d50:	83 c4 10             	add    esp,0x10
10000d53:	eb 14                	jmp    10000d69 <printd+0x4f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:248
        else
            return printk_valist(format, args);
10000d55:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000d58:	83 ec 08             	sub    esp,0x8
10000d5b:	50                   	push   eax
10000d5c:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10000d5f:	e8 7b ff ff ff       	call   10000cdf <printk_valist>
10000d64:	83 c4 10             	add    esp,0x10
10000d67:	eb 05                	jmp    10000d6e <printd+0x54>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:250
    }
    return 0;
10000d69:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:251
}
10000d6e:	c9                   	leave  
10000d6f:	c3                   	ret    

10000d70 <sprintf>:
sprintf():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:255
#endif

int sprintf(char *out, const char *format, ...)
{
10000d70:	55                   	push   ebp
10000d71:	89 e5                	mov    ebp,esp
10000d73:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:258
        va_list args;
        
        va_start( args, format );
10000d76:	8d 45 10             	lea    eax,[ebp+0x10]
10000d79:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:259
        return print( &out, format, args );
10000d7c:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000d7f:	83 ec 04             	sub    esp,0x4
10000d82:	50                   	push   eax
10000d83:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10000d86:	8d 45 08             	lea    eax,[ebp+0x8]
10000d89:	50                   	push   eax
10000d8a:	e8 9a fc ff ff       	call   10000a29 <print>
10000d8f:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:260
}
10000d92:	c9                   	leave  
10000d93:	c3                   	ret    

10000d94 <strlen>:
strlen():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:3
#include <stddef.h>

size_t strlen(const char* str) {
10000d94:	55                   	push   ebp
10000d95:	89 e5                	mov    ebp,esp
10000d97:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:4
          size_t ret = 0;
10000d9a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:5
        while ( str[ret] != 0 )
10000da1:	eb 04                	jmp    10000da7 <strlen+0x13>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:6
                ret++;
10000da3:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:5
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
10000da7:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
10000daa:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
10000dad:	01 d0                	add    eax,edx
10000daf:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000db2:	84 c0                	test   al,al
10000db4:	75 ed                	jne    10000da3 <strlen+0xf>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:7
                ret++;
        return ret;
10000db6:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:8
}
10000db9:	c9                   	leave  
10000dba:	c3                   	ret    
10000dbb:	90                   	nop

10000dbc <main>:
main():
/home/yogi/src/os/testMainProgramEntry/main.c:13
#include "../chrisOS/include/kernelObjects.h"

/*
 * testMainProgramEntry
 */
int main(int argc, char** argv) {
10000dbc:	8d 4c 24 04          	lea    ecx,[esp+0x4]
10000dc0:	83 e4 f0             	and    esp,0xfffffff0
10000dc3:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
10000dc6:	55                   	push   ebp
10000dc7:	89 e5                	mov    ebp,esp
10000dc9:	53                   	push   ebx
10000dca:	51                   	push   ecx
10000dcb:	83 ec 10             	sub    esp,0x10
10000dce:	89 cb                	mov    ebx,ecx
/home/yogi/src/os/testMainProgramEntry/main.c:16
    uint64_t temp;
    //printk("Hello from testmainprogramentry!!!");
    int a=argc;
10000dd0:	8b 03                	mov    eax,DWORD PTR [ebx]
10000dd2:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/testMainProgramEntry/main.c:17
    printk("Param count=%u\n",argc);
10000dd5:	83 ec 08             	sub    esp,0x8
10000dd8:	ff 33                	push   DWORD PTR [ebx]
10000dda:	68 ea 21 00 10       	push   0x100021ea
10000ddf:	e8 16 ff ff ff       	call   10000cfa <printk>
10000de4:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/main.c:18
    char** b=argv;
10000de7:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
10000dea:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/testMainProgramEntry/main.c:19
    for (int cnt=0;cnt<argc;cnt++)
10000ded:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
10000df4:	eb 29                	jmp    10000e1f <main+0x63>
/home/yogi/src/os/testMainProgramEntry/main.c:21 (discriminator 3)
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
10000df6:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000df9:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
10000e00:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
10000e03:	01 d0                	add    eax,edx
10000e05:	8b 00                	mov    eax,DWORD PTR [eax]
10000e07:	83 ec 04             	sub    esp,0x4
10000e0a:	50                   	push   eax
10000e0b:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
10000e0e:	68 fa 21 00 10       	push   0x100021fa
10000e13:	e8 e2 fe ff ff       	call   10000cfa <printk>
10000e18:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/main.c:19 (discriminator 3)
    uint64_t temp;
    //printk("Hello from testmainprogramentry!!!");
    int a=argc;
    printk("Param count=%u\n",argc);
    char** b=argv;
    for (int cnt=0;cnt<argc;cnt++)
10000e1b:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/testMainProgramEntry/main.c:19 (discriminator 1)
10000e1f:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000e22:	3b 03                	cmp    eax,DWORD PTR [ebx]
10000e24:	7c d0                	jl     10000df6 <main+0x3a>
/home/yogi/src/os/testMainProgramEntry/main.c:28
    jumpHere:
/*    if (temp%1000000==0)
        printd(DEBUG_PROCESS,"\tStill in the loop, %u iterations\n",temp);
    temp++;
    goto jumpHere;
*/    __asm__("mov eax,0\ncld\nint 0x80\n");
10000e26:	b8 00 00 00 00       	mov    eax,0x0
10000e2b:	fc                   	cld    
10000e2c:	cd 80                	int    0x80
/home/yogi/src/os/testMainProgramEntry/main.c:30
//    goto jumpHere;
    return 0x1234;
10000e2e:	b8 34 12 00 00       	mov    eax,0x1234
/home/yogi/src/os/testMainProgramEntry/main.c:31
}
10000e33:	8d 65 f8             	lea    esp,[ebp-0x8]
10000e36:	59                   	pop    ecx
10000e37:	5b                   	pop    ebx
10000e38:	5d                   	pop    ebp
10000e39:	8d 61 fc             	lea    esp,[ecx-0x4]
10000e3c:	c3                   	ret    
10000e3d:	66 90                	xchg   ax,ax
10000e3f:	90                   	nop

10000e40 <time>:
time():
/home/yogi/src/os/testMainProgramEntry/time.c:83
  {31, 29, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}
};

extern time_t kSystemCurrentTime;
time_t time(time_t* arg)
{
10000e40:	55                   	push   ebp
10000e41:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/time.c:84
    *arg = kSystemCurrentTime;
10000e43:	8b 15 cc 97 12 00    	mov    edx,DWORD PTR ds:0x1297cc
10000e49:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000e4c:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/testMainProgramEntry/time.c:85
    return kSystemCurrentTime;
10000e4e:	a1 cc 97 12 00       	mov    eax,ds:0x1297cc
/home/yogi/src/os/testMainProgramEntry/time.c:86
}
10000e53:	5d                   	pop    ebp
10000e54:	c3                   	ret    

10000e55 <gmtime_r>:
gmtime_r():
/home/yogi/src/os/testMainProgramEntry/time.c:88

struct tm *gmtime_r(const time_t *timer, struct tm *tmbuf) {
10000e55:	55                   	push   ebp
10000e56:	89 e5                	mov    ebp,esp
10000e58:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/testMainProgramEntry/time.c:89
  time_t time = *timer;
10000e5b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000e5e:	8b 00                	mov    eax,DWORD PTR [eax]
10000e60:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/time.c:91
  unsigned long dayclock, dayno;
  int year = EPOCH_YR;
10000e63:	c7 45 f8 b2 07 00 00 	mov    DWORD PTR [ebp-0x8],0x7b2
/home/yogi/src/os/testMainProgramEntry/time.c:93

  dayclock = (unsigned long) time % SECS_DAY;
10000e6a:	8b 4d f4             	mov    ecx,DWORD PTR [ebp-0xc]
10000e6d:	ba 07 45 2e c2       	mov    edx,0xc22e4507
10000e72:	89 c8                	mov    eax,ecx
10000e74:	f7 e2                	mul    edx
10000e76:	89 d0                	mov    eax,edx
10000e78:	c1 e8 10             	shr    eax,0x10
10000e7b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10000e7e:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
10000e81:	69 c0 80 51 01 00    	imul   eax,eax,0x15180
10000e87:	29 c1                	sub    ecx,eax
10000e89:	89 c8                	mov    eax,ecx
10000e8b:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/testMainProgramEntry/time.c:94
  dayno = (unsigned long) time / SECS_DAY;
10000e8e:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000e91:	ba 07 45 2e c2       	mov    edx,0xc22e4507
10000e96:	f7 e2                	mul    edx
10000e98:	89 d0                	mov    eax,edx
10000e9a:	c1 e8 10             	shr    eax,0x10
10000e9d:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/testMainProgramEntry/time.c:96

  tmbuf->tm_sec = dayclock % 60;
10000ea0:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
10000ea3:	ba 89 88 88 88       	mov    edx,0x88888889
10000ea8:	89 c8                	mov    eax,ecx
10000eaa:	f7 e2                	mul    edx
10000eac:	89 d0                	mov    eax,edx
10000eae:	c1 e8 05             	shr    eax,0x5
10000eb1:	89 c2                	mov    edx,eax
10000eb3:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
10000eba:	89 c2                	mov    edx,eax
10000ebc:	89 d0                	mov    eax,edx
10000ebe:	c1 e0 04             	shl    eax,0x4
10000ec1:	29 d0                	sub    eax,edx
10000ec3:	29 c1                	sub    ecx,eax
10000ec5:	89 c8                	mov    eax,ecx
10000ec7:	89 c2                	mov    edx,eax
10000ec9:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000ecc:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/testMainProgramEntry/time.c:97
  tmbuf->tm_min = (dayclock % 3600) / 60;
10000ece:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
10000ed1:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
10000ed6:	89 c8                	mov    eax,ecx
10000ed8:	f7 e2                	mul    edx
10000eda:	89 d0                	mov    eax,edx
10000edc:	c1 e8 0b             	shr    eax,0xb
10000edf:	69 c0 10 0e 00 00    	imul   eax,eax,0xe10
10000ee5:	29 c1                	sub    ecx,eax
10000ee7:	89 c8                	mov    eax,ecx
10000ee9:	ba 89 88 88 88       	mov    edx,0x88888889
10000eee:	f7 e2                	mul    edx
10000ef0:	89 d0                	mov    eax,edx
10000ef2:	c1 e8 05             	shr    eax,0x5
10000ef5:	89 c2                	mov    edx,eax
10000ef7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000efa:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/testMainProgramEntry/time.c:98
  tmbuf->tm_hour = dayclock / 3600;
10000efd:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
10000f00:	ba c5 b3 a2 91       	mov    edx,0x91a2b3c5
10000f05:	f7 e2                	mul    edx
10000f07:	89 d0                	mov    eax,edx
10000f09:	c1 e8 0b             	shr    eax,0xb
10000f0c:	89 c2                	mov    edx,eax
10000f0e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000f11:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/testMainProgramEntry/time.c:99
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
10000f14:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
10000f17:	8d 48 04             	lea    ecx,[eax+0x4]
10000f1a:	ba 25 49 92 24       	mov    edx,0x24924925
10000f1f:	89 c8                	mov    eax,ecx
10000f21:	f7 e2                	mul    edx
10000f23:	89 c8                	mov    eax,ecx
10000f25:	29 d0                	sub    eax,edx
10000f27:	d1 e8                	shr    eax,1
10000f29:	01 d0                	add    eax,edx
10000f2b:	c1 e8 02             	shr    eax,0x2
10000f2e:	89 c2                	mov    edx,eax
10000f30:	c1 e2 03             	shl    edx,0x3
10000f33:	29 c2                	sub    edx,eax
10000f35:	89 c8                	mov    eax,ecx
10000f37:	29 d0                	sub    eax,edx
10000f39:	89 c2                	mov    edx,eax
10000f3b:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000f3e:	89 50 18             	mov    DWORD PTR [eax+0x18],edx
/home/yogi/src/os/testMainProgramEntry/time.c:100
  while (dayno >= (unsigned long) YEARSIZE(year)) {
10000f41:	eb 66                	jmp    10000fa9 <gmtime_r+0x154>
/home/yogi/src/os/testMainProgramEntry/time.c:101
    dayno -= YEARSIZE(year);
10000f43:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
10000f46:	83 e0 03             	and    eax,0x3
10000f49:	85 c0                	test   eax,eax
10000f4b:	75 50                	jne    10000f9d <gmtime_r+0x148>
/home/yogi/src/os/testMainProgramEntry/time.c:101 (discriminator 1)
10000f4d:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
10000f50:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
10000f55:	89 c8                	mov    eax,ecx
10000f57:	f7 ea                	imul   edx
10000f59:	c1 fa 05             	sar    edx,0x5
10000f5c:	89 c8                	mov    eax,ecx
10000f5e:	c1 f8 1f             	sar    eax,0x1f
10000f61:	29 c2                	sub    edx,eax
10000f63:	89 d0                	mov    eax,edx
10000f65:	6b c0 64             	imul   eax,eax,0x64
10000f68:	29 c1                	sub    ecx,eax
10000f6a:	89 c8                	mov    eax,ecx
10000f6c:	85 c0                	test   eax,eax
10000f6e:	75 26                	jne    10000f96 <gmtime_r+0x141>
/home/yogi/src/os/testMainProgramEntry/time.c:101 (discriminator 4)
10000f70:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
10000f73:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
10000f78:	89 c8                	mov    eax,ecx
10000f7a:	f7 ea                	imul   edx
10000f7c:	c1 fa 07             	sar    edx,0x7
10000f7f:	89 c8                	mov    eax,ecx
10000f81:	c1 f8 1f             	sar    eax,0x1f
10000f84:	29 c2                	sub    edx,eax
10000f86:	89 d0                	mov    eax,edx
10000f88:	69 c0 90 01 00 00    	imul   eax,eax,0x190
10000f8e:	29 c1                	sub    ecx,eax
10000f90:	89 c8                	mov    eax,ecx
10000f92:	85 c0                	test   eax,eax
10000f94:	75 07                	jne    10000f9d <gmtime_r+0x148>
/home/yogi/src/os/testMainProgramEntry/time.c:101 (discriminator 5)
10000f96:	b8 6e 01 00 00       	mov    eax,0x16e
10000f9b:	eb 05                	jmp    10000fa2 <gmtime_r+0x14d>
/home/yogi/src/os/testMainProgramEntry/time.c:101 (discriminator 6)
10000f9d:	b8 6d 01 00 00       	mov    eax,0x16d
/home/yogi/src/os/testMainProgramEntry/time.c:101 (discriminator 8)
10000fa2:	29 45 fc             	sub    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/testMainProgramEntry/time.c:102 (discriminator 8)
    year++;
10000fa5:	83 45 f8 01          	add    DWORD PTR [ebp-0x8],0x1
/home/yogi/src/os/testMainProgramEntry/time.c:100

  tmbuf->tm_sec = dayclock % 60;
  tmbuf->tm_min = (dayclock % 3600) / 60;
  tmbuf->tm_hour = dayclock / 3600;
  tmbuf->tm_wday = (dayno + 4) % 7; // Day 0 was a thursday
  while (dayno >= (unsigned long) YEARSIZE(year)) {
10000fa9:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
10000fac:	83 e0 03             	and    eax,0x3
10000faf:	85 c0                	test   eax,eax
10000fb1:	75 50                	jne    10001003 <gmtime_r+0x1ae>
/home/yogi/src/os/testMainProgramEntry/time.c:100 (discriminator 1)
10000fb3:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
10000fb6:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
10000fbb:	89 c8                	mov    eax,ecx
10000fbd:	f7 ea                	imul   edx
10000fbf:	c1 fa 05             	sar    edx,0x5
10000fc2:	89 c8                	mov    eax,ecx
10000fc4:	c1 f8 1f             	sar    eax,0x1f
10000fc7:	29 c2                	sub    edx,eax
10000fc9:	89 d0                	mov    eax,edx
10000fcb:	6b c0 64             	imul   eax,eax,0x64
10000fce:	29 c1                	sub    ecx,eax
10000fd0:	89 c8                	mov    eax,ecx
10000fd2:	85 c0                	test   eax,eax
10000fd4:	75 26                	jne    10000ffc <gmtime_r+0x1a7>
/home/yogi/src/os/testMainProgramEntry/time.c:100 (discriminator 4)
10000fd6:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
10000fd9:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
10000fde:	89 c8                	mov    eax,ecx
10000fe0:	f7 ea                	imul   edx
10000fe2:	c1 fa 07             	sar    edx,0x7
10000fe5:	89 c8                	mov    eax,ecx
10000fe7:	c1 f8 1f             	sar    eax,0x1f
10000fea:	29 c2                	sub    edx,eax
10000fec:	89 d0                	mov    eax,edx
10000fee:	69 c0 90 01 00 00    	imul   eax,eax,0x190
10000ff4:	29 c1                	sub    ecx,eax
10000ff6:	89 c8                	mov    eax,ecx
10000ff8:	85 c0                	test   eax,eax
10000ffa:	75 07                	jne    10001003 <gmtime_r+0x1ae>
/home/yogi/src/os/testMainProgramEntry/time.c:100 (discriminator 5)
10000ffc:	b8 6e 01 00 00       	mov    eax,0x16e
10001001:	eb 05                	jmp    10001008 <gmtime_r+0x1b3>
/home/yogi/src/os/testMainProgramEntry/time.c:100 (discriminator 6)
10001003:	b8 6d 01 00 00       	mov    eax,0x16d
/home/yogi/src/os/testMainProgramEntry/time.c:100 (discriminator 8)
10001008:	3b 45 fc             	cmp    eax,DWORD PTR [ebp-0x4]
1000100b:	0f 86 32 ff ff ff    	jbe    10000f43 <gmtime_r+0xee>
/home/yogi/src/os/testMainProgramEntry/time.c:104
    dayno -= YEARSIZE(year);
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
10001011:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
10001014:	8d 90 94 f8 ff ff    	lea    edx,[eax-0x76c]
1000101a:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000101d:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/testMainProgramEntry/time.c:105
  tmbuf->tm_yday = dayno;
10001020:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
10001023:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10001026:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/src/os/testMainProgramEntry/time.c:106
  tmbuf->tm_mon = 0;
10001029:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000102c:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/src/os/testMainProgramEntry/time.c:107
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
10001033:	e9 89 00 00 00       	jmp    100010c1 <gmtime_r+0x26c>
/home/yogi/src/os/testMainProgramEntry/time.c:108
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
10001038:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
1000103b:	83 e0 03             	and    eax,0x3
1000103e:	85 c0                	test   eax,eax
10001040:	75 50                	jne    10001092 <gmtime_r+0x23d>
/home/yogi/src/os/testMainProgramEntry/time.c:108 (discriminator 1)
10001042:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
10001045:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
1000104a:	89 c8                	mov    eax,ecx
1000104c:	f7 ea                	imul   edx
1000104e:	c1 fa 05             	sar    edx,0x5
10001051:	89 c8                	mov    eax,ecx
10001053:	c1 f8 1f             	sar    eax,0x1f
10001056:	29 c2                	sub    edx,eax
10001058:	89 d0                	mov    eax,edx
1000105a:	6b c0 64             	imul   eax,eax,0x64
1000105d:	29 c1                	sub    ecx,eax
1000105f:	89 c8                	mov    eax,ecx
10001061:	85 c0                	test   eax,eax
10001063:	75 26                	jne    1000108b <gmtime_r+0x236>
/home/yogi/src/os/testMainProgramEntry/time.c:108 (discriminator 4)
10001065:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
10001068:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
1000106d:	89 c8                	mov    eax,ecx
1000106f:	f7 ea                	imul   edx
10001071:	c1 fa 07             	sar    edx,0x7
10001074:	89 c8                	mov    eax,ecx
10001076:	c1 f8 1f             	sar    eax,0x1f
10001079:	29 c2                	sub    edx,eax
1000107b:	89 d0                	mov    eax,edx
1000107d:	69 c0 90 01 00 00    	imul   eax,eax,0x190
10001083:	29 c1                	sub    ecx,eax
10001085:	89 c8                	mov    eax,ecx
10001087:	85 c0                	test   eax,eax
10001089:	75 07                	jne    10001092 <gmtime_r+0x23d>
/home/yogi/src/os/testMainProgramEntry/time.c:108 (discriminator 5)
1000108b:	ba 01 00 00 00       	mov    edx,0x1
10001090:	eb 05                	jmp    10001097 <gmtime_r+0x242>
/home/yogi/src/os/testMainProgramEntry/time.c:108 (discriminator 6)
10001092:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/testMainProgramEntry/time.c:108 (discriminator 8)
10001097:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000109a:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
1000109d:	89 d0                	mov    eax,edx
1000109f:	01 c0                	add    eax,eax
100010a1:	01 d0                	add    eax,edx
100010a3:	c1 e0 02             	shl    eax,0x2
100010a6:	01 c8                	add    eax,ecx
100010a8:	8b 04 85 20 22 00 10 	mov    eax,DWORD PTR [eax*4+0x10002220]
100010af:	29 45 fc             	sub    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/testMainProgramEntry/time.c:109 (discriminator 8)
    tmbuf->tm_mon++;
100010b2:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100010b5:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
100010b8:	8d 50 01             	lea    edx,[eax+0x1]
100010bb:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100010be:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/testMainProgramEntry/time.c:107
    year++;
  }
  tmbuf->tm_year = year - YEAR0;
  tmbuf->tm_yday = dayno;
  tmbuf->tm_mon = 0;
  while (dayno >= (unsigned long) _ytab[LEAPYEAR(year)][tmbuf->tm_mon]) {
100010c1:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
100010c4:	83 e0 03             	and    eax,0x3
100010c7:	85 c0                	test   eax,eax
100010c9:	75 50                	jne    1000111b <gmtime_r+0x2c6>
/home/yogi/src/os/testMainProgramEntry/time.c:107 (discriminator 1)
100010cb:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
100010ce:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
100010d3:	89 c8                	mov    eax,ecx
100010d5:	f7 ea                	imul   edx
100010d7:	c1 fa 05             	sar    edx,0x5
100010da:	89 c8                	mov    eax,ecx
100010dc:	c1 f8 1f             	sar    eax,0x1f
100010df:	29 c2                	sub    edx,eax
100010e1:	89 d0                	mov    eax,edx
100010e3:	6b c0 64             	imul   eax,eax,0x64
100010e6:	29 c1                	sub    ecx,eax
100010e8:	89 c8                	mov    eax,ecx
100010ea:	85 c0                	test   eax,eax
100010ec:	75 26                	jne    10001114 <gmtime_r+0x2bf>
/home/yogi/src/os/testMainProgramEntry/time.c:107 (discriminator 4)
100010ee:	8b 4d f8             	mov    ecx,DWORD PTR [ebp-0x8]
100010f1:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
100010f6:	89 c8                	mov    eax,ecx
100010f8:	f7 ea                	imul   edx
100010fa:	c1 fa 07             	sar    edx,0x7
100010fd:	89 c8                	mov    eax,ecx
100010ff:	c1 f8 1f             	sar    eax,0x1f
10001102:	29 c2                	sub    edx,eax
10001104:	89 d0                	mov    eax,edx
10001106:	69 c0 90 01 00 00    	imul   eax,eax,0x190
1000110c:	29 c1                	sub    ecx,eax
1000110e:	89 c8                	mov    eax,ecx
10001110:	85 c0                	test   eax,eax
10001112:	75 07                	jne    1000111b <gmtime_r+0x2c6>
/home/yogi/src/os/testMainProgramEntry/time.c:107 (discriminator 5)
10001114:	ba 01 00 00 00       	mov    edx,0x1
10001119:	eb 05                	jmp    10001120 <gmtime_r+0x2cb>
/home/yogi/src/os/testMainProgramEntry/time.c:107 (discriminator 6)
1000111b:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/testMainProgramEntry/time.c:107 (discriminator 8)
10001120:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10001123:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
10001126:	89 d0                	mov    eax,edx
10001128:	01 c0                	add    eax,eax
1000112a:	01 d0                	add    eax,edx
1000112c:	c1 e0 02             	shl    eax,0x2
1000112f:	01 c8                	add    eax,ecx
10001131:	8b 04 85 20 22 00 10 	mov    eax,DWORD PTR [eax*4+0x10002220]
10001138:	3b 45 fc             	cmp    eax,DWORD PTR [ebp-0x4]
1000113b:	0f 86 f7 fe ff ff    	jbe    10001038 <gmtime_r+0x1e3>
/home/yogi/src/os/testMainProgramEntry/time.c:111
    dayno -= _ytab[LEAPYEAR(year)][tmbuf->tm_mon];
    tmbuf->tm_mon++;
  }
  tmbuf->tm_mday = dayno + 1;
10001141:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
10001144:	83 c0 01             	add    eax,0x1
10001147:	89 c2                	mov    edx,eax
10001149:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000114c:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/testMainProgramEntry/time.c:112
  tmbuf->tm_isdst = 0;
1000114f:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10001152:	c7 40 20 00 00 00 00 	mov    DWORD PTR [eax+0x20],0x0
/home/yogi/src/os/testMainProgramEntry/time.c:113
  return tmbuf;
10001159:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
/home/yogi/src/os/testMainProgramEntry/time.c:114
}
1000115c:	c9                   	leave  
1000115d:	c3                   	ret    

1000115e <localtime>:
localtime():
/home/yogi/src/os/testMainProgramEntry/time.c:116

struct tm *localtime(const time_t *timer) {
1000115e:	55                   	push   ebp
1000115f:	89 e5                	mov    ebp,esp
10001161:	83 ec 30             	sub    esp,0x30
/home/yogi/src/os/testMainProgramEntry/time.c:120
  time_t t;
  struct tm tmbuf;
  
  t = *timer - kTimeZone;
10001164:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001167:	8b 10                	mov    edx,DWORD PTR [eax]
10001169:	a1 d0 97 12 00       	mov    eax,ds:0x1297d0
1000116e:	29 c2                	sub    edx,eax
10001170:	89 d0                	mov    eax,edx
10001172:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/testMainProgramEntry/time.c:121
  return gmtime_r(&t, &tmbuf);
10001175:	8d 45 d0             	lea    eax,[ebp-0x30]
10001178:	50                   	push   eax
10001179:	8d 45 fc             	lea    eax,[ebp-0x4]
1000117c:	50                   	push   eax
1000117d:	e8 d3 fc ff ff       	call   10000e55 <gmtime_r>
10001182:	83 c4 08             	add    esp,0x8
/home/yogi/src/os/testMainProgramEntry/time.c:122
}
10001185:	c9                   	leave  
10001186:	c3                   	ret    

10001187 <localtime_r>:
localtime_r():
/home/yogi/src/os/testMainProgramEntry/time.c:124

struct tm *localtime_r(const time_t *timer, struct tm *tmbuf) {
10001187:	55                   	push   ebp
10001188:	89 e5                	mov    ebp,esp
1000118a:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/testMainProgramEntry/time.c:127
  time_t t;

  t = *timer - kTimeZone;
1000118d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001190:	8b 10                	mov    edx,DWORD PTR [eax]
10001192:	a1 d0 97 12 00       	mov    eax,ds:0x1297d0
10001197:	29 c2                	sub    edx,eax
10001199:	89 d0                	mov    eax,edx
1000119b:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
/home/yogi/src/os/testMainProgramEntry/time.c:128
  return gmtime_r(&t, tmbuf);
1000119e:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
100011a1:	8d 45 fc             	lea    eax,[ebp-0x4]
100011a4:	50                   	push   eax
100011a5:	e8 ab fc ff ff       	call   10000e55 <gmtime_r>
100011aa:	83 c4 08             	add    esp,0x8
/home/yogi/src/os/testMainProgramEntry/time.c:129
}
100011ad:	c9                   	leave  
100011ae:	c3                   	ret    

100011af <mktime>:
mktime():
/home/yogi/src/os/testMainProgramEntry/time.c:131

time_t mktime(struct tm *tmbuf) {
100011af:	55                   	push   ebp
100011b0:	89 e5                	mov    ebp,esp
100011b2:	56                   	push   esi
100011b3:	53                   	push   ebx
100011b4:	83 ec 20             	sub    esp,0x20
/home/yogi/src/os/testMainProgramEntry/time.c:139
  int yday, month;
  /*unsigned*/ long seconds;
  int overflow;
  long dst;

  tmbuf->tm_min += tmbuf->tm_sec / 60;
100011b7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100011ba:	8b 58 04             	mov    ebx,DWORD PTR [eax+0x4]
100011bd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100011c0:	8b 08                	mov    ecx,DWORD PTR [eax]
100011c2:	ba 89 88 88 88       	mov    edx,0x88888889
100011c7:	89 c8                	mov    eax,ecx
100011c9:	f7 ea                	imul   edx
100011cb:	8d 04 0a             	lea    eax,[edx+ecx*1]
100011ce:	c1 f8 05             	sar    eax,0x5
100011d1:	89 c2                	mov    edx,eax
100011d3:	89 c8                	mov    eax,ecx
100011d5:	c1 f8 1f             	sar    eax,0x1f
100011d8:	29 c2                	sub    edx,eax
100011da:	89 d0                	mov    eax,edx
100011dc:	8d 14 03             	lea    edx,[ebx+eax*1]
100011df:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100011e2:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/testMainProgramEntry/time.c:140
  tmbuf->tm_sec %= 60;
100011e5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100011e8:	8b 08                	mov    ecx,DWORD PTR [eax]
100011ea:	ba 89 88 88 88       	mov    edx,0x88888889
100011ef:	89 c8                	mov    eax,ecx
100011f1:	f7 ea                	imul   edx
100011f3:	8d 04 0a             	lea    eax,[edx+ecx*1]
100011f6:	c1 f8 05             	sar    eax,0x5
100011f9:	89 c2                	mov    edx,eax
100011fb:	89 c8                	mov    eax,ecx
100011fd:	c1 f8 1f             	sar    eax,0x1f
10001200:	29 c2                	sub    edx,eax
10001202:	89 d0                	mov    eax,edx
10001204:	89 c2                	mov    edx,eax
10001206:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
1000120d:	89 c2                	mov    edx,eax
1000120f:	89 d0                	mov    eax,edx
10001211:	c1 e0 04             	shl    eax,0x4
10001214:	29 d0                	sub    eax,edx
10001216:	29 c1                	sub    ecx,eax
10001218:	89 c8                	mov    eax,ecx
1000121a:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
1000121d:	89 02                	mov    DWORD PTR [edx],eax
/home/yogi/src/os/testMainProgramEntry/time.c:141
  if (tmbuf->tm_sec < 0) {
1000121f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001222:	8b 00                	mov    eax,DWORD PTR [eax]
10001224:	85 c0                	test   eax,eax
10001226:	79 1c                	jns    10001244 <mktime+0x95>
/home/yogi/src/os/testMainProgramEntry/time.c:142
    tmbuf->tm_sec += 60;
10001228:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000122b:	8b 00                	mov    eax,DWORD PTR [eax]
1000122d:	8d 50 3c             	lea    edx,[eax+0x3c]
10001230:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001233:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/testMainProgramEntry/time.c:143
    tmbuf->tm_min--;
10001235:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001238:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
1000123b:	8d 50 ff             	lea    edx,[eax-0x1]
1000123e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001241:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/testMainProgramEntry/time.c:145
  }
  tmbuf->tm_hour += tmbuf->tm_min / 60;
10001244:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001247:	8b 58 08             	mov    ebx,DWORD PTR [eax+0x8]
1000124a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000124d:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
10001250:	ba 89 88 88 88       	mov    edx,0x88888889
10001255:	89 c8                	mov    eax,ecx
10001257:	f7 ea                	imul   edx
10001259:	8d 04 0a             	lea    eax,[edx+ecx*1]
1000125c:	c1 f8 05             	sar    eax,0x5
1000125f:	89 c2                	mov    edx,eax
10001261:	89 c8                	mov    eax,ecx
10001263:	c1 f8 1f             	sar    eax,0x1f
10001266:	29 c2                	sub    edx,eax
10001268:	89 d0                	mov    eax,edx
1000126a:	8d 14 03             	lea    edx,[ebx+eax*1]
1000126d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001270:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/testMainProgramEntry/time.c:146
  tmbuf->tm_min = tmbuf->tm_min % 60;
10001273:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001276:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
10001279:	ba 89 88 88 88       	mov    edx,0x88888889
1000127e:	89 c8                	mov    eax,ecx
10001280:	f7 ea                	imul   edx
10001282:	8d 04 0a             	lea    eax,[edx+ecx*1]
10001285:	c1 f8 05             	sar    eax,0x5
10001288:	89 c2                	mov    edx,eax
1000128a:	89 c8                	mov    eax,ecx
1000128c:	c1 f8 1f             	sar    eax,0x1f
1000128f:	29 c2                	sub    edx,eax
10001291:	89 d0                	mov    eax,edx
10001293:	89 c2                	mov    edx,eax
10001295:	8d 04 95 00 00 00 00 	lea    eax,[edx*4+0x0]
1000129c:	89 c2                	mov    edx,eax
1000129e:	89 d0                	mov    eax,edx
100012a0:	c1 e0 04             	shl    eax,0x4
100012a3:	29 d0                	sub    eax,edx
100012a5:	29 c1                	sub    ecx,eax
100012a7:	89 c8                	mov    eax,ecx
100012a9:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
100012ac:	89 42 04             	mov    DWORD PTR [edx+0x4],eax
/home/yogi/src/os/testMainProgramEntry/time.c:147
  if (tmbuf->tm_min < 0) {
100012af:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100012b2:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
100012b5:	85 c0                	test   eax,eax
100012b7:	79 1e                	jns    100012d7 <mktime+0x128>
/home/yogi/src/os/testMainProgramEntry/time.c:148
    tmbuf->tm_min += 60;
100012b9:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100012bc:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
100012bf:	8d 50 3c             	lea    edx,[eax+0x3c]
100012c2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100012c5:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
/home/yogi/src/os/testMainProgramEntry/time.c:149
    tmbuf->tm_hour--;
100012c8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100012cb:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
100012ce:	8d 50 ff             	lea    edx,[eax-0x1]
100012d1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100012d4:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/testMainProgramEntry/time.c:151
  }
  day = tmbuf->tm_hour / 24;
100012d7:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100012da:	8b 48 08             	mov    ecx,DWORD PTR [eax+0x8]
100012dd:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
100012e2:	89 c8                	mov    eax,ecx
100012e4:	f7 ea                	imul   edx
100012e6:	c1 fa 02             	sar    edx,0x2
100012e9:	89 c8                	mov    eax,ecx
100012eb:	c1 f8 1f             	sar    eax,0x1f
100012ee:	29 c2                	sub    edx,eax
100012f0:	89 d0                	mov    eax,edx
100012f2:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/time.c:152
  tmbuf->tm_hour= tmbuf->tm_hour % 24;
100012f5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100012f8:	8b 48 08             	mov    ecx,DWORD PTR [eax+0x8]
100012fb:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
10001300:	89 c8                	mov    eax,ecx
10001302:	f7 ea                	imul   edx
10001304:	c1 fa 02             	sar    edx,0x2
10001307:	89 c8                	mov    eax,ecx
10001309:	c1 f8 1f             	sar    eax,0x1f
1000130c:	29 c2                	sub    edx,eax
1000130e:	89 d0                	mov    eax,edx
10001310:	01 c0                	add    eax,eax
10001312:	01 d0                	add    eax,edx
10001314:	c1 e0 03             	shl    eax,0x3
10001317:	29 c1                	sub    ecx,eax
10001319:	89 ca                	mov    edx,ecx
1000131b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000131e:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/testMainProgramEntry/time.c:153
  if (tmbuf->tm_hour < 0) {
10001321:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001324:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
10001327:	85 c0                	test   eax,eax
10001329:	79 13                	jns    1000133e <mktime+0x18f>
/home/yogi/src/os/testMainProgramEntry/time.c:154
    tmbuf->tm_hour += 24;
1000132b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000132e:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
10001331:	8d 50 18             	lea    edx,[eax+0x18]
10001334:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001337:	89 50 08             	mov    DWORD PTR [eax+0x8],edx
/home/yogi/src/os/testMainProgramEntry/time.c:155
    day--;
1000133a:	83 6d f4 01          	sub    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/testMainProgramEntry/time.c:157
  }
  tmbuf->tm_year += tmbuf->tm_mon / 12;
1000133e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001341:	8b 58 14             	mov    ebx,DWORD PTR [eax+0x14]
10001344:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001347:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
1000134a:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
1000134f:	89 c8                	mov    eax,ecx
10001351:	f7 ea                	imul   edx
10001353:	d1 fa                	sar    edx,1
10001355:	89 c8                	mov    eax,ecx
10001357:	c1 f8 1f             	sar    eax,0x1f
1000135a:	29 c2                	sub    edx,eax
1000135c:	89 d0                	mov    eax,edx
1000135e:	8d 14 03             	lea    edx,[ebx+eax*1]
10001361:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001364:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/testMainProgramEntry/time.c:158
  tmbuf->tm_mon %= 12;
10001367:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000136a:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
1000136d:	ba ab aa aa 2a       	mov    edx,0x2aaaaaab
10001372:	89 c8                	mov    eax,ecx
10001374:	f7 ea                	imul   edx
10001376:	d1 fa                	sar    edx,1
10001378:	89 c8                	mov    eax,ecx
1000137a:	c1 f8 1f             	sar    eax,0x1f
1000137d:	29 c2                	sub    edx,eax
1000137f:	89 d0                	mov    eax,edx
10001381:	01 c0                	add    eax,eax
10001383:	01 d0                	add    eax,edx
10001385:	c1 e0 02             	shl    eax,0x2
10001388:	29 c1                	sub    ecx,eax
1000138a:	89 ca                	mov    edx,ecx
1000138c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000138f:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/testMainProgramEntry/time.c:159
  if (tmbuf->tm_mon < 0) {
10001392:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001395:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
10001398:	85 c0                	test   eax,eax
1000139a:	79 1e                	jns    100013ba <mktime+0x20b>
/home/yogi/src/os/testMainProgramEntry/time.c:160
    tmbuf->tm_mon += 12;
1000139c:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000139f:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
100013a2:	8d 50 0c             	lea    edx,[eax+0xc]
100013a5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100013a8:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
/home/yogi/src/os/testMainProgramEntry/time.c:161
    tmbuf->tm_year--;
100013ab:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100013ae:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
100013b1:	8d 50 ff             	lea    edx,[eax-0x1]
100013b4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100013b7:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/testMainProgramEntry/time.c:163
  }
  day += (tmbuf->tm_mday - 1);
100013ba:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100013bd:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
100013c0:	83 e8 01             	sub    eax,0x1
100013c3:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/time.c:164
  while (day < 0) {
100013c6:	e9 c1 00 00 00       	jmp    1000148c <mktime+0x2dd>
/home/yogi/src/os/testMainProgramEntry/time.c:165
    if(--tmbuf->tm_mon < 0) {
100013cb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100013ce:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
100013d1:	8d 50 ff             	lea    edx,[eax-0x1]
100013d4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100013d7:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
100013da:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100013dd:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
100013e0:	85 c0                	test   eax,eax
100013e2:	79 19                	jns    100013fd <mktime+0x24e>
/home/yogi/src/os/testMainProgramEntry/time.c:166
      tmbuf->tm_year--;
100013e4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100013e7:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
100013ea:	8d 50 ff             	lea    edx,[eax-0x1]
100013ed:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100013f0:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/testMainProgramEntry/time.c:167
      tmbuf->tm_mon = 11;
100013f3:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100013f6:	c7 40 10 0b 00 00 00 	mov    DWORD PTR [eax+0x10],0xb
/home/yogi/src/os/testMainProgramEntry/time.c:169
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
100013fd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001400:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
10001403:	83 e0 03             	and    eax,0x3
10001406:	85 c0                	test   eax,eax
10001408:	75 62                	jne    1000146c <mktime+0x2bd>
/home/yogi/src/os/testMainProgramEntry/time.c:169 (discriminator 1)
1000140a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000140d:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
10001410:	8d 88 6c 07 00 00    	lea    ecx,[eax+0x76c]
10001416:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
1000141b:	89 c8                	mov    eax,ecx
1000141d:	f7 ea                	imul   edx
1000141f:	c1 fa 05             	sar    edx,0x5
10001422:	89 c8                	mov    eax,ecx
10001424:	c1 f8 1f             	sar    eax,0x1f
10001427:	29 c2                	sub    edx,eax
10001429:	89 d0                	mov    eax,edx
1000142b:	6b c0 64             	imul   eax,eax,0x64
1000142e:	29 c1                	sub    ecx,eax
10001430:	89 c8                	mov    eax,ecx
10001432:	85 c0                	test   eax,eax
10001434:	75 2f                	jne    10001465 <mktime+0x2b6>
/home/yogi/src/os/testMainProgramEntry/time.c:169 (discriminator 4)
10001436:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001439:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
1000143c:	8d 88 6c 07 00 00    	lea    ecx,[eax+0x76c]
10001442:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
10001447:	89 c8                	mov    eax,ecx
10001449:	f7 ea                	imul   edx
1000144b:	c1 fa 07             	sar    edx,0x7
1000144e:	89 c8                	mov    eax,ecx
10001450:	c1 f8 1f             	sar    eax,0x1f
10001453:	29 c2                	sub    edx,eax
10001455:	89 d0                	mov    eax,edx
10001457:	69 c0 90 01 00 00    	imul   eax,eax,0x190
1000145d:	29 c1                	sub    ecx,eax
1000145f:	89 c8                	mov    eax,ecx
10001461:	85 c0                	test   eax,eax
10001463:	75 07                	jne    1000146c <mktime+0x2bd>
/home/yogi/src/os/testMainProgramEntry/time.c:169 (discriminator 5)
10001465:	ba 01 00 00 00       	mov    edx,0x1
1000146a:	eb 05                	jmp    10001471 <mktime+0x2c2>
/home/yogi/src/os/testMainProgramEntry/time.c:169 (discriminator 6)
1000146c:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/testMainProgramEntry/time.c:169 (discriminator 8)
10001471:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001474:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
10001477:	89 d0                	mov    eax,edx
10001479:	01 c0                	add    eax,eax
1000147b:	01 d0                	add    eax,edx
1000147d:	c1 e0 02             	shl    eax,0x2
10001480:	01 c8                	add    eax,ecx
10001482:	8b 04 85 20 22 00 10 	mov    eax,DWORD PTR [eax*4+0x10002220]
10001489:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/time.c:164
  if (tmbuf->tm_mon < 0) {
    tmbuf->tm_mon += 12;
    tmbuf->tm_year--;
  }
  day += (tmbuf->tm_mday - 1);
  while (day < 0) {
1000148c:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
10001490:	0f 88 35 ff ff ff    	js     100013cb <mktime+0x21c>
/home/yogi/src/os/testMainProgramEntry/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
10001496:	e9 c2 00 00 00       	jmp    1000155d <mktime+0x3ae>
/home/yogi/src/os/testMainProgramEntry/time.c:172
    day -= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
1000149b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000149e:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
100014a1:	83 e0 03             	and    eax,0x3
100014a4:	85 c0                	test   eax,eax
100014a6:	75 62                	jne    1000150a <mktime+0x35b>
/home/yogi/src/os/testMainProgramEntry/time.c:172 (discriminator 1)
100014a8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100014ab:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
100014ae:	8d 88 6c 07 00 00    	lea    ecx,[eax+0x76c]
100014b4:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
100014b9:	89 c8                	mov    eax,ecx
100014bb:	f7 ea                	imul   edx
100014bd:	c1 fa 05             	sar    edx,0x5
100014c0:	89 c8                	mov    eax,ecx
100014c2:	c1 f8 1f             	sar    eax,0x1f
100014c5:	29 c2                	sub    edx,eax
100014c7:	89 d0                	mov    eax,edx
100014c9:	6b c0 64             	imul   eax,eax,0x64
100014cc:	29 c1                	sub    ecx,eax
100014ce:	89 c8                	mov    eax,ecx
100014d0:	85 c0                	test   eax,eax
100014d2:	75 2f                	jne    10001503 <mktime+0x354>
/home/yogi/src/os/testMainProgramEntry/time.c:172 (discriminator 4)
100014d4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100014d7:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
100014da:	8d 88 6c 07 00 00    	lea    ecx,[eax+0x76c]
100014e0:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
100014e5:	89 c8                	mov    eax,ecx
100014e7:	f7 ea                	imul   edx
100014e9:	c1 fa 07             	sar    edx,0x7
100014ec:	89 c8                	mov    eax,ecx
100014ee:	c1 f8 1f             	sar    eax,0x1f
100014f1:	29 c2                	sub    edx,eax
100014f3:	89 d0                	mov    eax,edx
100014f5:	69 c0 90 01 00 00    	imul   eax,eax,0x190
100014fb:	29 c1                	sub    ecx,eax
100014fd:	89 c8                	mov    eax,ecx
100014ff:	85 c0                	test   eax,eax
10001501:	75 07                	jne    1000150a <mktime+0x35b>
/home/yogi/src/os/testMainProgramEntry/time.c:172 (discriminator 5)
10001503:	ba 01 00 00 00       	mov    edx,0x1
10001508:	eb 05                	jmp    1000150f <mktime+0x360>
/home/yogi/src/os/testMainProgramEntry/time.c:172 (discriminator 6)
1000150a:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/testMainProgramEntry/time.c:172 (discriminator 8)
1000150f:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001512:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
10001515:	89 d0                	mov    eax,edx
10001517:	01 c0                	add    eax,eax
10001519:	01 d0                	add    eax,edx
1000151b:	c1 e0 02             	shl    eax,0x2
1000151e:	01 c8                	add    eax,ecx
10001520:	8b 04 85 20 22 00 10 	mov    eax,DWORD PTR [eax*4+0x10002220]
10001527:	29 45 f4             	sub    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/time.c:173 (discriminator 8)
    if (++(tmbuf->tm_mon) == 12) {
1000152a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000152d:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
10001530:	8d 50 01             	lea    edx,[eax+0x1]
10001533:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001536:	89 50 10             	mov    DWORD PTR [eax+0x10],edx
10001539:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000153c:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
1000153f:	83 f8 0c             	cmp    eax,0xc
10001542:	75 19                	jne    1000155d <mktime+0x3ae>
/home/yogi/src/os/testMainProgramEntry/time.c:174
      tmbuf->tm_mon = 0;
10001544:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001547:	c7 40 10 00 00 00 00 	mov    DWORD PTR [eax+0x10],0x0
/home/yogi/src/os/testMainProgramEntry/time.c:175
      tmbuf->tm_year++;
1000154e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001551:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
10001554:	8d 50 01             	lea    edx,[eax+0x1]
10001557:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000155a:	89 50 14             	mov    DWORD PTR [eax+0x14],edx
/home/yogi/src/os/testMainProgramEntry/time.c:171
      tmbuf->tm_year--;
      tmbuf->tm_mon = 11;
    }
    day += _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon];
  }
  while (day >= _ytab[LEAPYEAR(YEAR0 + tmbuf->tm_year)][tmbuf->tm_mon]) {
1000155d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001560:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
10001563:	83 e0 03             	and    eax,0x3
10001566:	85 c0                	test   eax,eax
10001568:	75 62                	jne    100015cc <mktime+0x41d>
/home/yogi/src/os/testMainProgramEntry/time.c:171 (discriminator 1)
1000156a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000156d:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
10001570:	8d 88 6c 07 00 00    	lea    ecx,[eax+0x76c]
10001576:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
1000157b:	89 c8                	mov    eax,ecx
1000157d:	f7 ea                	imul   edx
1000157f:	c1 fa 05             	sar    edx,0x5
10001582:	89 c8                	mov    eax,ecx
10001584:	c1 f8 1f             	sar    eax,0x1f
10001587:	29 c2                	sub    edx,eax
10001589:	89 d0                	mov    eax,edx
1000158b:	6b c0 64             	imul   eax,eax,0x64
1000158e:	29 c1                	sub    ecx,eax
10001590:	89 c8                	mov    eax,ecx
10001592:	85 c0                	test   eax,eax
10001594:	75 2f                	jne    100015c5 <mktime+0x416>
/home/yogi/src/os/testMainProgramEntry/time.c:171 (discriminator 4)
10001596:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001599:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
1000159c:	8d 88 6c 07 00 00    	lea    ecx,[eax+0x76c]
100015a2:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
100015a7:	89 c8                	mov    eax,ecx
100015a9:	f7 ea                	imul   edx
100015ab:	c1 fa 07             	sar    edx,0x7
100015ae:	89 c8                	mov    eax,ecx
100015b0:	c1 f8 1f             	sar    eax,0x1f
100015b3:	29 c2                	sub    edx,eax
100015b5:	89 d0                	mov    eax,edx
100015b7:	69 c0 90 01 00 00    	imul   eax,eax,0x190
100015bd:	29 c1                	sub    ecx,eax
100015bf:	89 c8                	mov    eax,ecx
100015c1:	85 c0                	test   eax,eax
100015c3:	75 07                	jne    100015cc <mktime+0x41d>
/home/yogi/src/os/testMainProgramEntry/time.c:171 (discriminator 5)
100015c5:	ba 01 00 00 00       	mov    edx,0x1
100015ca:	eb 05                	jmp    100015d1 <mktime+0x422>
/home/yogi/src/os/testMainProgramEntry/time.c:171 (discriminator 6)
100015cc:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/testMainProgramEntry/time.c:171 (discriminator 8)
100015d1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100015d4:	8b 48 10             	mov    ecx,DWORD PTR [eax+0x10]
100015d7:	89 d0                	mov    eax,edx
100015d9:	01 c0                	add    eax,eax
100015db:	01 d0                	add    eax,edx
100015dd:	c1 e0 02             	shl    eax,0x2
100015e0:	01 c8                	add    eax,ecx
100015e2:	8b 04 85 20 22 00 10 	mov    eax,DWORD PTR [eax*4+0x10002220]
100015e9:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
100015ec:	0f 8e a9 fe ff ff    	jle    1000149b <mktime+0x2ec>
/home/yogi/src/os/testMainProgramEntry/time.c:178
    if (++(tmbuf->tm_mon) == 12) {
      tmbuf->tm_mon = 0;
      tmbuf->tm_year++;
    }
  }
  tmbuf->tm_mday = day + 1;
100015f2:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
100015f5:	8d 50 01             	lea    edx,[eax+0x1]
100015f8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100015fb:	89 50 0c             	mov    DWORD PTR [eax+0xc],edx
/home/yogi/src/os/testMainProgramEntry/time.c:179
  year = EPOCH_YR;
100015fe:	c7 45 e0 b2 07 00 00 	mov    DWORD PTR [ebp-0x20],0x7b2
/home/yogi/src/os/testMainProgramEntry/time.c:180
  if (tmbuf->tm_year < year - YEAR0) return (time_t) -999;
10001605:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001608:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
1000160b:	8b 55 e0             	mov    edx,DWORD PTR [ebp-0x20]
1000160e:	81 ea 6c 07 00 00    	sub    edx,0x76c
10001614:	39 d0                	cmp    eax,edx
10001616:	7d 0a                	jge    10001622 <mktime+0x473>
/home/yogi/src/os/testMainProgramEntry/time.c:180 (discriminator 1)
10001618:	b8 19 fc ff ff       	mov    eax,0xfffffc19
1000161d:	e9 c0 03 00 00       	jmp    100019e2 <mktime+0x833>
/home/yogi/src/os/testMainProgramEntry/time.c:181
  seconds = 0;
10001622:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
/home/yogi/src/os/testMainProgramEntry/time.c:182
  day = 0;                      // Means days since day 0 now
10001629:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/testMainProgramEntry/time.c:183
  overflow = 0;
10001630:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
/home/yogi/src/os/testMainProgramEntry/time.c:190
  // Assume that when day becomes negative, there will certainly
  // be overflow on seconds.
  // The check for overflow needs not to be done for leapyears
  // divisible by 400.
  // The code only works when year (1970) is not a leapyear.
  tm_year = tmbuf->tm_year + YEAR0;
10001637:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000163a:	8b 40 14             	mov    eax,DWORD PTR [eax+0x14]
1000163d:	05 6c 07 00 00       	add    eax,0x76c
10001642:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
/home/yogi/src/os/testMainProgramEntry/time.c:192

  if (TIME_MAX / 365 < tm_year - year) overflow=1;
10001645:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
10001648:	2b 45 e0             	sub    eax,DWORD PTR [ebp-0x20]
1000164b:	3d 7c c6 59 00       	cmp    eax,0x59c67c
10001650:	7e 07                	jle    10001659 <mktime+0x4aa>
/home/yogi/src/os/testMainProgramEntry/time.c:192 (discriminator 1)
10001652:	c7 45 e8 01 00 00 00 	mov    DWORD PTR [ebp-0x18],0x1
/home/yogi/src/os/testMainProgramEntry/time.c:193
  day = (tm_year - year) * 365;
10001659:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
1000165c:	2b 45 e0             	sub    eax,DWORD PTR [ebp-0x20]
1000165f:	69 c0 6d 01 00 00    	imul   eax,eax,0x16d
10001665:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/time.c:194
  if (TIME_MAX - day < (tm_year - year) / 4 + 1) overflow|=2;
10001668:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
1000166d:	2b 45 f4             	sub    eax,DWORD PTR [ebp-0xc]
10001670:	89 c2                	mov    edx,eax
10001672:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
10001675:	2b 45 e0             	sub    eax,DWORD PTR [ebp-0x20]
10001678:	8d 48 03             	lea    ecx,[eax+0x3]
1000167b:	85 c0                	test   eax,eax
1000167d:	0f 48 c1             	cmovs  eax,ecx
10001680:	c1 f8 02             	sar    eax,0x2
10001683:	83 c0 01             	add    eax,0x1
10001686:	39 c2                	cmp    edx,eax
10001688:	7d 04                	jge    1000168e <mktime+0x4df>
/home/yogi/src/os/testMainProgramEntry/time.c:194 (discriminator 1)
1000168a:	83 4d e8 02          	or     DWORD PTR [ebp-0x18],0x2
/home/yogi/src/os/testMainProgramEntry/time.c:195
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
1000168e:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
10001691:	2b 45 e0             	sub    eax,DWORD PTR [ebp-0x20]
10001694:	8d 50 03             	lea    edx,[eax+0x3]
10001697:	85 c0                	test   eax,eax
10001699:	0f 48 c2             	cmovs  eax,edx
1000169c:	c1 f8 02             	sar    eax,0x2
1000169f:	89 c1                	mov    ecx,eax
100016a1:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
100016a4:	83 e0 03             	and    eax,0x3
100016a7:	85 c0                	test   eax,eax
100016a9:	74 29                	je     100016d4 <mktime+0x525>
/home/yogi/src/os/testMainProgramEntry/time.c:195 (discriminator 1)
100016ab:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
100016ae:	99                   	cdq    
100016af:	c1 ea 1e             	shr    edx,0x1e
100016b2:	01 d0                	add    eax,edx
100016b4:	83 e0 03             	and    eax,0x3
100016b7:	29 d0                	sub    eax,edx
100016b9:	89 c3                	mov    ebx,eax
100016bb:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
100016be:	99                   	cdq    
100016bf:	c1 ea 1e             	shr    edx,0x1e
100016c2:	01 d0                	add    eax,edx
100016c4:	83 e0 03             	and    eax,0x3
100016c7:	29 d0                	sub    eax,edx
100016c9:	39 c3                	cmp    ebx,eax
100016cb:	7d 07                	jge    100016d4 <mktime+0x525>
/home/yogi/src/os/testMainProgramEntry/time.c:195 (discriminator 3)
100016cd:	b8 01 00 00 00       	mov    eax,0x1
100016d2:	eb 05                	jmp    100016d9 <mktime+0x52a>
/home/yogi/src/os/testMainProgramEntry/time.c:195 (discriminator 4)
100016d4:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/testMainProgramEntry/time.c:195 (discriminator 6)
100016d9:	01 c8                	add    eax,ecx
100016db:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/time.c:196 (discriminator 6)
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
100016de:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
100016e1:	2b 45 e0             	sub    eax,DWORD PTR [ebp-0x20]
100016e4:	89 c1                	mov    ecx,eax
100016e6:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
100016eb:	89 c8                	mov    eax,ecx
100016ed:	f7 ea                	imul   edx
100016ef:	c1 fa 05             	sar    edx,0x5
100016f2:	89 c8                	mov    eax,ecx
100016f4:	c1 f8 1f             	sar    eax,0x1f
100016f7:	89 d6                	mov    esi,edx
100016f9:	29 c6                	sub    esi,eax
100016fb:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
100016fe:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
10001703:	89 c8                	mov    eax,ecx
10001705:	f7 ea                	imul   edx
10001707:	c1 fa 05             	sar    edx,0x5
1000170a:	89 c8                	mov    eax,ecx
1000170c:	c1 f8 1f             	sar    eax,0x1f
1000170f:	29 c2                	sub    edx,eax
10001711:	89 d0                	mov    eax,edx
10001713:	6b c0 64             	imul   eax,eax,0x64
10001716:	29 c1                	sub    ecx,eax
10001718:	89 c8                	mov    eax,ecx
1000171a:	85 c0                	test   eax,eax
1000171c:	74 49                	je     10001767 <mktime+0x5b8>
/home/yogi/src/os/testMainProgramEntry/time.c:196 (discriminator 1)
1000171e:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
10001721:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
10001726:	89 c8                	mov    eax,ecx
10001728:	f7 ea                	imul   edx
1000172a:	c1 fa 05             	sar    edx,0x5
1000172d:	89 c8                	mov    eax,ecx
1000172f:	c1 f8 1f             	sar    eax,0x1f
10001732:	89 d3                	mov    ebx,edx
10001734:	29 c3                	sub    ebx,eax
10001736:	6b c3 64             	imul   eax,ebx,0x64
10001739:	89 cb                	mov    ebx,ecx
1000173b:	29 c3                	sub    ebx,eax
1000173d:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
10001740:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
10001745:	89 c8                	mov    eax,ecx
10001747:	f7 ea                	imul   edx
10001749:	c1 fa 05             	sar    edx,0x5
1000174c:	89 c8                	mov    eax,ecx
1000174e:	c1 f8 1f             	sar    eax,0x1f
10001751:	29 c2                	sub    edx,eax
10001753:	89 d0                	mov    eax,edx
10001755:	6b c0 64             	imul   eax,eax,0x64
10001758:	29 c1                	sub    ecx,eax
1000175a:	89 c8                	mov    eax,ecx
1000175c:	39 c3                	cmp    ebx,eax
1000175e:	7d 07                	jge    10001767 <mktime+0x5b8>
/home/yogi/src/os/testMainProgramEntry/time.c:196 (discriminator 3)
10001760:	b8 01 00 00 00       	mov    eax,0x1
10001765:	eb 05                	jmp    1000176c <mktime+0x5bd>
/home/yogi/src/os/testMainProgramEntry/time.c:196 (discriminator 4)
10001767:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/testMainProgramEntry/time.c:196 (discriminator 6)
1000176c:	01 f0                	add    eax,esi
1000176e:	29 45 f4             	sub    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/time.c:197 (discriminator 6)
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);
10001771:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
10001774:	2b 45 e0             	sub    eax,DWORD PTR [ebp-0x20]
10001777:	89 c1                	mov    ecx,eax
10001779:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
1000177e:	89 c8                	mov    eax,ecx
10001780:	f7 ea                	imul   edx
10001782:	c1 fa 07             	sar    edx,0x7
10001785:	89 c8                	mov    eax,ecx
10001787:	c1 f8 1f             	sar    eax,0x1f
1000178a:	89 d6                	mov    esi,edx
1000178c:	29 c6                	sub    esi,eax
1000178e:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
10001791:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
10001796:	89 c8                	mov    eax,ecx
10001798:	f7 ea                	imul   edx
1000179a:	c1 fa 07             	sar    edx,0x7
1000179d:	89 c8                	mov    eax,ecx
1000179f:	c1 f8 1f             	sar    eax,0x1f
100017a2:	29 c2                	sub    edx,eax
100017a4:	89 d0                	mov    eax,edx
100017a6:	69 c0 90 01 00 00    	imul   eax,eax,0x190
100017ac:	29 c1                	sub    ecx,eax
100017ae:	89 c8                	mov    eax,ecx
100017b0:	85 c0                	test   eax,eax
100017b2:	74 4f                	je     10001803 <mktime+0x654>
/home/yogi/src/os/testMainProgramEntry/time.c:197 (discriminator 1)
100017b4:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
100017b7:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
100017bc:	89 c8                	mov    eax,ecx
100017be:	f7 ea                	imul   edx
100017c0:	c1 fa 07             	sar    edx,0x7
100017c3:	89 c8                	mov    eax,ecx
100017c5:	c1 f8 1f             	sar    eax,0x1f
100017c8:	89 d3                	mov    ebx,edx
100017ca:	29 c3                	sub    ebx,eax
100017cc:	69 c3 90 01 00 00    	imul   eax,ebx,0x190
100017d2:	89 cb                	mov    ebx,ecx
100017d4:	29 c3                	sub    ebx,eax
100017d6:	8b 4d e0             	mov    ecx,DWORD PTR [ebp-0x20]
100017d9:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
100017de:	89 c8                	mov    eax,ecx
100017e0:	f7 ea                	imul   edx
100017e2:	c1 fa 07             	sar    edx,0x7
100017e5:	89 c8                	mov    eax,ecx
100017e7:	c1 f8 1f             	sar    eax,0x1f
100017ea:	29 c2                	sub    edx,eax
100017ec:	89 d0                	mov    eax,edx
100017ee:	69 c0 90 01 00 00    	imul   eax,eax,0x190
100017f4:	29 c1                	sub    ecx,eax
100017f6:	89 c8                	mov    eax,ecx
100017f8:	39 c3                	cmp    ebx,eax
100017fa:	7d 07                	jge    10001803 <mktime+0x654>
/home/yogi/src/os/testMainProgramEntry/time.c:197 (discriminator 3)
100017fc:	b8 01 00 00 00       	mov    eax,0x1
10001801:	eb 05                	jmp    10001808 <mktime+0x659>
/home/yogi/src/os/testMainProgramEntry/time.c:197 (discriminator 4)
10001803:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/testMainProgramEntry/time.c:197 (discriminator 6)
10001808:	01 f0                	add    eax,esi
1000180a:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/time.c:199 (discriminator 6)

  yday = month = 0;
1000180d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
10001814:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
10001817:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/testMainProgramEntry/time.c:200 (discriminator 6)
  while (month < tmbuf->tm_mon) {
1000181a:	eb 7b                	jmp    10001897 <mktime+0x6e8>
/home/yogi/src/os/testMainProgramEntry/time.c:201
    yday += _ytab[LEAPYEAR(tm_year)][month];
1000181c:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
1000181f:	83 e0 03             	and    eax,0x3
10001822:	85 c0                	test   eax,eax
10001824:	75 50                	jne    10001876 <mktime+0x6c7>
/home/yogi/src/os/testMainProgramEntry/time.c:201 (discriminator 1)
10001826:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
10001829:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
1000182e:	89 c8                	mov    eax,ecx
10001830:	f7 ea                	imul   edx
10001832:	c1 fa 05             	sar    edx,0x5
10001835:	89 c8                	mov    eax,ecx
10001837:	c1 f8 1f             	sar    eax,0x1f
1000183a:	29 c2                	sub    edx,eax
1000183c:	89 d0                	mov    eax,edx
1000183e:	6b c0 64             	imul   eax,eax,0x64
10001841:	29 c1                	sub    ecx,eax
10001843:	89 c8                	mov    eax,ecx
10001845:	85 c0                	test   eax,eax
10001847:	75 26                	jne    1000186f <mktime+0x6c0>
/home/yogi/src/os/testMainProgramEntry/time.c:201 (discriminator 4)
10001849:	8b 4d d8             	mov    ecx,DWORD PTR [ebp-0x28]
1000184c:	ba 1f 85 eb 51       	mov    edx,0x51eb851f
10001851:	89 c8                	mov    eax,ecx
10001853:	f7 ea                	imul   edx
10001855:	c1 fa 07             	sar    edx,0x7
10001858:	89 c8                	mov    eax,ecx
1000185a:	c1 f8 1f             	sar    eax,0x1f
1000185d:	29 c2                	sub    edx,eax
1000185f:	89 d0                	mov    eax,edx
10001861:	69 c0 90 01 00 00    	imul   eax,eax,0x190
10001867:	29 c1                	sub    ecx,eax
10001869:	89 c8                	mov    eax,ecx
1000186b:	85 c0                	test   eax,eax
1000186d:	75 07                	jne    10001876 <mktime+0x6c7>
/home/yogi/src/os/testMainProgramEntry/time.c:201 (discriminator 5)
1000186f:	ba 01 00 00 00       	mov    edx,0x1
10001874:	eb 05                	jmp    1000187b <mktime+0x6cc>
/home/yogi/src/os/testMainProgramEntry/time.c:201 (discriminator 6)
10001876:	ba 00 00 00 00       	mov    edx,0x0
/home/yogi/src/os/testMainProgramEntry/time.c:201 (discriminator 8)
1000187b:	89 d0                	mov    eax,edx
1000187d:	01 c0                	add    eax,eax
1000187f:	01 d0                	add    eax,edx
10001881:	c1 e0 02             	shl    eax,0x2
10001884:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
10001887:	01 d0                	add    eax,edx
10001889:	8b 04 85 20 22 00 10 	mov    eax,DWORD PTR [eax*4+0x10002220]
10001890:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/testMainProgramEntry/time.c:202 (discriminator 8)
    month++;
10001893:	83 45 ec 01          	add    DWORD PTR [ebp-0x14],0x1
/home/yogi/src/os/testMainProgramEntry/time.c:200
  day += (tm_year - year) / 4 + ((tm_year % 4) && tm_year % 4 < year % 4);
  day -= (tm_year - year) / 100 + ((tm_year % 100) && tm_year % 100 < year % 100);
  day += (tm_year - year) / 400 + ((tm_year % 400) && tm_year % 400 < year % 400);

  yday = month = 0;
  while (month < tmbuf->tm_mon) {
10001897:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000189a:	8b 40 10             	mov    eax,DWORD PTR [eax+0x10]
1000189d:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
100018a0:	0f 8f 76 ff ff ff    	jg     1000181c <mktime+0x66d>
/home/yogi/src/os/testMainProgramEntry/time.c:204
    yday += _ytab[LEAPYEAR(tm_year)][month];
    month++;
  }
  yday += (tmbuf->tm_mday - 1);
100018a6:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100018a9:	8b 40 0c             	mov    eax,DWORD PTR [eax+0xc]
100018ac:	83 e8 01             	sub    eax,0x1
100018af:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/testMainProgramEntry/time.c:205
  if (day + yday < 0) overflow|=4;
100018b2:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
100018b5:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
100018b8:	01 d0                	add    eax,edx
100018ba:	85 c0                	test   eax,eax
100018bc:	79 04                	jns    100018c2 <mktime+0x713>
/home/yogi/src/os/testMainProgramEntry/time.c:205 (discriminator 1)
100018be:	83 4d e8 04          	or     DWORD PTR [ebp-0x18],0x4
/home/yogi/src/os/testMainProgramEntry/time.c:206
  day += yday;
100018c2:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
100018c5:	01 45 f4             	add    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/time.c:208

  tmbuf->tm_yday = yday;
100018c8:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100018cb:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
100018ce:	89 50 1c             	mov    DWORD PTR [eax+0x1c],edx
/home/yogi/src/os/testMainProgramEntry/time.c:209
  tmbuf->tm_wday = (day + 4) % 7;               // Day 0 was thursday (4)
100018d1:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
100018d4:	8d 48 04             	lea    ecx,[eax+0x4]
100018d7:	ba 93 24 49 92       	mov    edx,0x92492493
100018dc:	89 c8                	mov    eax,ecx
100018de:	f7 ea                	imul   edx
100018e0:	8d 04 0a             	lea    eax,[edx+ecx*1]
100018e3:	c1 f8 02             	sar    eax,0x2
100018e6:	89 c2                	mov    edx,eax
100018e8:	89 c8                	mov    eax,ecx
100018ea:	c1 f8 1f             	sar    eax,0x1f
100018ed:	29 c2                	sub    edx,eax
100018ef:	89 d0                	mov    eax,edx
100018f1:	89 c2                	mov    edx,eax
100018f3:	c1 e2 03             	shl    edx,0x3
100018f6:	29 c2                	sub    edx,eax
100018f8:	89 c8                	mov    eax,ecx
100018fa:	29 d0                	sub    eax,edx
100018fc:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
100018ff:	89 42 18             	mov    DWORD PTR [edx+0x18],eax
/home/yogi/src/os/testMainProgramEntry/time.c:211

  seconds = ((tmbuf->tm_hour * 60L) + tmbuf->tm_min) * 60L + tmbuf->tm_sec;
10001902:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001905:	8b 40 08             	mov    eax,DWORD PTR [eax+0x8]
10001908:	c1 e0 02             	shl    eax,0x2
1000190b:	89 c2                	mov    edx,eax
1000190d:	c1 e2 04             	shl    edx,0x4
10001910:	29 c2                	sub    edx,eax
10001912:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001915:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
10001918:	01 d0                	add    eax,edx
1000191a:	c1 e0 02             	shl    eax,0x2
1000191d:	89 c2                	mov    edx,eax
1000191f:	c1 e2 04             	shl    edx,0x4
10001922:	29 c2                	sub    edx,eax
10001924:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001927:	8b 00                	mov    eax,DWORD PTR [eax]
10001929:	01 d0                	add    eax,edx
1000192b:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/testMainProgramEntry/time.c:213

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
1000192e:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
10001933:	2b 45 dc             	sub    eax,DWORD PTR [ebp-0x24]
10001936:	89 c1                	mov    ecx,eax
10001938:	ba 07 45 2e c2       	mov    edx,0xc22e4507
1000193d:	89 c8                	mov    eax,ecx
1000193f:	f7 ea                	imul   edx
10001941:	8d 04 0a             	lea    eax,[edx+ecx*1]
10001944:	c1 f8 10             	sar    eax,0x10
10001947:	89 c2                	mov    edx,eax
10001949:	89 c8                	mov    eax,ecx
1000194b:	c1 f8 1f             	sar    eax,0x1f
1000194e:	29 c2                	sub    edx,eax
10001950:	89 d0                	mov    eax,edx
10001952:	3b 45 f4             	cmp    eax,DWORD PTR [ebp-0xc]
10001955:	7d 04                	jge    1000195b <mktime+0x7ac>
/home/yogi/src/os/testMainProgramEntry/time.c:213 (discriminator 1)
10001957:	83 4d e8 08          	or     DWORD PTR [ebp-0x18],0x8
/home/yogi/src/os/testMainProgramEntry/time.c:214
  seconds += day * SECS_DAY;
1000195b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
1000195e:	69 c0 80 51 01 00    	imul   eax,eax,0x15180
10001964:	01 45 dc             	add    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/testMainProgramEntry/time.c:217

  // Now adjust according to timezone and daylight saving time
  if (((kTimeZone > 0) && (TIME_MAX - kTimeZone < seconds)) || 
10001967:	a1 d0 97 12 00       	mov    eax,ds:0x1297d0
1000196c:	85 c0                	test   eax,eax
1000196e:	7e 13                	jle    10001983 <mktime+0x7d4>
/home/yogi/src/os/testMainProgramEntry/time.c:217 (discriminator 1)
10001970:	a1 d0 97 12 00       	mov    eax,ds:0x1297d0
10001975:	ba ff ff ff 7f       	mov    edx,0x7fffffff
1000197a:	29 c2                	sub    edx,eax
1000197c:	89 d0                	mov    eax,edx
1000197e:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
10001981:	7c 15                	jl     10001998 <mktime+0x7e9>
/home/yogi/src/os/testMainProgramEntry/time.c:218 (discriminator 3)
      ((kTimeZone < 0) && (seconds < -kTimeZone))) {
10001983:	a1 d0 97 12 00       	mov    eax,ds:0x1297d0
/home/yogi/src/os/testMainProgramEntry/time.c:217 (discriminator 3)

  if ((TIME_MAX - seconds) / SECS_DAY < day) overflow|=8;
  seconds += day * SECS_DAY;

  // Now adjust according to timezone and daylight saving time
  if (((kTimeZone > 0) && (TIME_MAX - kTimeZone < seconds)) || 
10001988:	85 c0                	test   eax,eax
1000198a:	79 10                	jns    1000199c <mktime+0x7ed>
/home/yogi/src/os/testMainProgramEntry/time.c:218
      ((kTimeZone < 0) && (seconds < -kTimeZone))) {
1000198c:	a1 d0 97 12 00       	mov    eax,ds:0x1297d0
10001991:	f7 d8                	neg    eax
10001993:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
10001996:	7e 04                	jle    1000199c <mktime+0x7ed>
/home/yogi/src/os/testMainProgramEntry/time.c:219
          overflow|=16;
10001998:	83 4d e8 10          	or     DWORD PTR [ebp-0x18],0x10
/home/yogi/src/os/testMainProgramEntry/time.c:221
  }
  seconds += kTimeZone;
1000199c:	a1 d0 97 12 00       	mov    eax,ds:0x1297d0
100019a1:	01 45 dc             	add    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/testMainProgramEntry/time.c:223

  if (tmbuf->tm_isdst) {
100019a4:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
100019a7:	8b 40 20             	mov    eax,DWORD PTR [eax+0x20]
100019aa:	85 c0                	test   eax,eax
100019ac:	74 0a                	je     100019b8 <mktime+0x809>
/home/yogi/src/os/testMainProgramEntry/time.c:224
    dst = _dstbias;
100019ae:	a1 68 99 12 00       	mov    eax,ds:0x129968
100019b3:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
100019b6:	eb 07                	jmp    100019bf <mktime+0x810>
/home/yogi/src/os/testMainProgramEntry/time.c:226
  } else {
    dst = 0;
100019b8:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/testMainProgramEntry/time.c:229
  }

  if (dst > seconds) overflow|=32;        // dst is always non-negative
100019bf:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
100019c2:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
100019c5:	7e 04                	jle    100019cb <mktime+0x81c>
/home/yogi/src/os/testMainProgramEntry/time.c:229 (discriminator 1)
100019c7:	83 4d e8 20          	or     DWORD PTR [ebp-0x18],0x20
/home/yogi/src/os/testMainProgramEntry/time.c:230
  seconds -= dst;
100019cb:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
100019ce:	29 45 dc             	sub    DWORD PTR [ebp-0x24],eax
/home/yogi/src/os/testMainProgramEntry/time.c:232

  if (overflow) return (time_t) overflow-2;
100019d1:	83 7d e8 00          	cmp    DWORD PTR [ebp-0x18],0x0
100019d5:	74 08                	je     100019df <mktime+0x830>
/home/yogi/src/os/testMainProgramEntry/time.c:232 (discriminator 1)
100019d7:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
100019da:	83 e8 02             	sub    eax,0x2
100019dd:	eb 03                	jmp    100019e2 <mktime+0x833>
/home/yogi/src/os/testMainProgramEntry/time.c:235

  if ((time_t) seconds != seconds) return (time_t) -1;
  return (time_t) seconds;
100019df:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
/home/yogi/src/os/testMainProgramEntry/time.c:236
}
100019e2:	83 c4 20             	add    esp,0x20
100019e5:	5b                   	pop    ebx
100019e6:	5e                   	pop    esi
100019e7:	5d                   	pop    ebp
100019e8:	c3                   	ret    

100019e9 <_strdate>:
_strdate():
/home/yogi/src/os/testMainProgramEntry/time.c:241

#if !defined(KERNEL) && !defined(OS_LIB)


char *_strdate(char *s) {
100019e9:	55                   	push   ebp
100019ea:	89 e5                	mov    ebp,esp
100019ec:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/testMainProgramEntry/time.c:244
  time_t now;

  time(&now);
100019ef:	8d 45 fc             	lea    eax,[ebp-0x4]
100019f2:	50                   	push   eax
100019f3:	e8 48 f4 ff ff       	call   10000e40 <time>
100019f8:	83 c4 04             	add    esp,0x4
/home/yogi/src/os/testMainProgramEntry/time.c:247
  //fix me!
  //  strftime(s, 9, "%D", localtime(&now));
  return s;
100019fb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/testMainProgramEntry/time.c:248
}
100019fe:	c9                   	leave  
100019ff:	c3                   	ret    

10001a00 <_strtime>:
_strtime():
/home/yogi/src/os/testMainProgramEntry/time.c:250

char *_strtime(char *s) {
10001a00:	55                   	push   ebp
10001a01:	89 e5                	mov    ebp,esp
10001a03:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/testMainProgramEntry/time.c:253
  time_t now;

  time(&now);
10001a06:	8d 45 fc             	lea    eax,[ebp-0x4]
10001a09:	50                   	push   eax
10001a0a:	e8 31 f4 ff ff       	call   10000e40 <time>
10001a0f:	83 c4 04             	add    esp,0x4
/home/yogi/src/os/testMainProgramEntry/time.c:256
  //fix me
  //  strftime(s, 9, "%T", localtime(&now));
  return s;
10001a12:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
/home/yogi/src/os/testMainProgramEntry/time.c:257
}
10001a15:	c9                   	leave  
10001a16:	c3                   	ret    

10001a17 <waitTicks>:
waitTicks():
/home/yogi/src/os/testMainProgramEntry/time.c:260

void __attribute__((noinline))waitTicks(int TicksToWait)
{
10001a17:	55                   	push   ebp
10001a18:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/time.c:262
    //printf("ttw=%u",ttw);
    if (TicksToWait==0)
10001a1a:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
10001a1e:	74 0f                	je     10001a2f <waitTicks+0x18>
/home/yogi/src/os/testMainProgramEntry/time.c:267 (discriminator 1)
        return;
    //printd(DEBUG_TIMER,"ttw=%08X", TicksToWait);
    do
    {
        __asm("sti\nhlt\n");
10001a20:	fb                   	sti    
10001a21:	f4                   	hlt    
/home/yogi/src/os/testMainProgramEntry/time.c:268 (discriminator 1)
        TicksToWait--;
10001a22:	83 6d 08 01          	sub    DWORD PTR [ebp+0x8],0x1
/home/yogi/src/os/testMainProgramEntry/time.c:269 (discriminator 1)
    } while (TicksToWait>0);
10001a26:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
10001a2a:	7f f4                	jg     10001a20 <waitTicks+0x9>
/home/yogi/src/os/testMainProgramEntry/time.c:270 (discriminator 2)
    return;
10001a2c:	90                   	nop
10001a2d:	eb 01                	jmp    10001a30 <waitTicks+0x19>
/home/yogi/src/os/testMainProgramEntry/time.c:263

void __attribute__((noinline))waitTicks(int TicksToWait)
{
    //printf("ttw=%u",ttw);
    if (TicksToWait==0)
        return;
10001a2f:	90                   	nop
/home/yogi/src/os/testMainProgramEntry/time.c:271
    {
        __asm("sti\nhlt\n");
        TicksToWait--;
    } while (TicksToWait>0);
    return;
}
10001a30:	5d                   	pop    ebp
10001a31:	c3                   	ret    

10001a32 <wait>:
wait():
/home/yogi/src/os/testMainProgramEntry/time.c:274

void /*__attribute__((noinline))*/wait(int msToWait)
{
10001a32:	55                   	push   ebp
10001a33:	89 e5                	mov    ebp,esp
/home/yogi/src/os/testMainProgramEntry/time.c:277
    //printk("msToWait=%u, ticksperms=%u, ticksToWait=%u",msToWait, kTicksPerMS, msToWait*kTicksPerMS);
    //STOPHERE2
    waitTicks(msToWait/kTicksPerMS);
10001a35:	8b 0d c4 97 12 00    	mov    ecx,DWORD PTR ds:0x1297c4
10001a3b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001a3e:	99                   	cdq    
10001a3f:	f7 f9                	idiv   ecx
10001a41:	50                   	push   eax
10001a42:	e8 d0 ff ff ff       	call   10001a17 <waitTicks>
10001a47:	83 c4 04             	add    esp,0x4
/home/yogi/src/os/testMainProgramEntry/time.c:278
}
10001a4a:	90                   	nop
10001a4b:	c9                   	leave  
10001a4c:	c3                   	ret    

10001a4d <wait3>:
wait3():
/home/yogi/src/os/testMainProgramEntry/time.c:281

void wait3(double msToWait)
{
10001a4d:	55                   	push   ebp
10001a4e:	89 e5                	mov    ebp,esp
10001a50:	83 ec 28             	sub    esp,0x28
10001a53:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001a56:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
10001a59:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10001a5c:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/testMainProgramEntry/time.c:282
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);
10001a5f:	a1 a4 97 12 00       	mov    eax,ds:0x1297a4
10001a64:	8b 00                	mov    eax,DWORD PTR [eax]
10001a66:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
10001a69:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
10001a70:	df 6d d8             	fild   QWORD PTR [ebp-0x28]
10001a73:	dd 5d e0             	fstp   QWORD PTR [ebp-0x20]
10001a76:	dd 45 e0             	fld    QWORD PTR [ebp-0x20]
10001a79:	dd 45 e8             	fld    QWORD PTR [ebp-0x18]
10001a7c:	8b 0d c0 97 12 00    	mov    ecx,DWORD PTR ds:0x1297c0
10001a82:	b8 e8 03 00 00       	mov    eax,0x3e8
10001a87:	ba 00 00 00 00       	mov    edx,0x0
10001a8c:	f7 f1                	div    ecx
10001a8e:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
10001a91:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
10001a98:	df 6d d8             	fild   QWORD PTR [ebp-0x28]
10001a9b:	dd 5d e0             	fstp   QWORD PTR [ebp-0x20]
10001a9e:	dd 45 e0             	fld    QWORD PTR [ebp-0x20]
10001aa1:	de f9                	fdivp  st(1),st
10001aa3:	de c1                	faddp  st(1),st
10001aa5:	dd 5d e0             	fstp   QWORD PTR [ebp-0x20]
10001aa8:	dd 45 e0             	fld    QWORD PTR [ebp-0x20]
10001aab:	dd 5d f8             	fstp   QWORD PTR [ebp-0x8]
/home/yogi/src/os/testMainProgramEntry/time.c:284

while (endTicks > (double)*kTicksSinceStart)
10001aae:	eb 02                	jmp    10001ab2 <wait3+0x65>
/home/yogi/src/os/testMainProgramEntry/time.c:285
    {__asm__("sti\n hlt\n");}
10001ab0:	fb                   	sti    
10001ab1:	f4                   	hlt    
/home/yogi/src/os/testMainProgramEntry/time.c:284

void wait3(double msToWait)
{
volatile double endTicks = (double)*kTicksSinceStart + msToWait/ (1000/kTicksPerSecond);

while (endTicks > (double)*kTicksSinceStart)
10001ab2:	a1 a4 97 12 00       	mov    eax,ds:0x1297a4
10001ab7:	8b 00                	mov    eax,DWORD PTR [eax]
10001ab9:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
10001abc:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
10001ac3:	df 6d d8             	fild   QWORD PTR [ebp-0x28]
10001ac6:	dd 5d e0             	fstp   QWORD PTR [ebp-0x20]
10001ac9:	dd 45 e0             	fld    QWORD PTR [ebp-0x20]
10001acc:	dd 45 f8             	fld    QWORD PTR [ebp-0x8]
10001acf:	df e9                	fucomip st,st(1)
10001ad1:	dd d8                	fstp   st(0)
10001ad3:	77 db                	ja     10001ab0 <wait3+0x63>
/home/yogi/src/os/testMainProgramEntry/time.c:287
    {__asm__("sti\n hlt\n");}
    
}
10001ad5:	90                   	nop
10001ad6:	c9                   	leave  
10001ad7:	c3                   	ret    

10001ad8 <wait2>:
wait2():
/home/yogi/src/os/testMainProgramEntry/time.c:290

void wait2(unsigned msToWait)
{
10001ad8:	55                   	push   ebp
10001ad9:	89 e5                	mov    ebp,esp
10001adb:	53                   	push   ebx
10001adc:	83 ec 24             	sub    esp,0x24
/home/yogi/src/os/testMainProgramEntry/time.c:291
    uint64_t startTicks = *kTicksSinceStart;             //25
10001adf:	a1 a4 97 12 00       	mov    eax,ds:0x1297a4
10001ae4:	8b 00                	mov    eax,DWORD PTR [eax]
10001ae6:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
10001ae9:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
/home/yogi/src/os/testMainProgramEntry/time.c:292
    unsigned msPerTick = 1000 / kTicksPerSecond;         //18
10001af0:	8b 1d c0 97 12 00    	mov    ebx,DWORD PTR ds:0x1297c0
10001af6:	b8 e8 03 00 00       	mov    eax,0x3e8
10001afb:	ba 00 00 00 00       	mov    edx,0x0
10001b00:	f7 f3                	div    ebx
10001b02:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/testMainProgramEntry/time.c:293
    uint64_t totalTicksToWait = msToWait/msPerTick;     //4321/18
10001b05:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10001b08:	ba 00 00 00 00       	mov    edx,0x0
10001b0d:	f7 75 ec             	div    DWORD PTR [ebp-0x14]
10001b10:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
10001b13:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x0
/home/yogi/src/os/testMainProgramEntry/time.c:294
    uint64_t endTicks = startTicks + totalTicksToWait;
10001b1a:	8b 4d f0             	mov    ecx,DWORD PTR [ebp-0x10]
10001b1d:	8b 5d f4             	mov    ebx,DWORD PTR [ebp-0xc]
10001b20:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
10001b23:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
10001b26:	01 c8                	add    eax,ecx
10001b28:	11 da                	adc    edx,ebx
10001b2a:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
10001b2d:	89 55 dc             	mov    DWORD PTR [ebp-0x24],edx
/home/yogi/src/os/testMainProgramEntry/time.c:296

    if (endTicks < *kTicksSinceStart)
10001b30:	a1 a4 97 12 00       	mov    eax,ds:0x1297a4
10001b35:	8b 00                	mov    eax,DWORD PTR [eax]
10001b37:	ba 00 00 00 00       	mov    edx,0x0
10001b3c:	3b 55 dc             	cmp    edx,DWORD PTR [ebp-0x24]
10001b3f:	72 0d                	jb     10001b4e <wait2+0x76>
10001b41:	3b 55 dc             	cmp    edx,DWORD PTR [ebp-0x24]
10001b44:	77 25                	ja     10001b6b <wait2+0x93>
10001b46:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
10001b49:	77 20                	ja     10001b6b <wait2+0x93>
/home/yogi/src/os/testMainProgramEntry/time.c:304
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
10001b4b:	eb 01                	jmp    10001b4e <wait2+0x76>
/home/yogi/src/os/testMainProgramEntry/time.c:305
    {__asm__("hlt\n");}
10001b4d:	f4                   	hlt    
/home/yogi/src/os/testMainProgramEntry/time.c:304
    //waitTicks(totalTicksToWait);
    //return;
    //printf("Waiting %u, ticks since start=%u  ms", msToWait, kTicksSinceStart);
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
10001b4e:	a1 a4 97 12 00       	mov    eax,ds:0x1297a4
10001b53:	8b 00                	mov    eax,DWORD PTR [eax]
10001b55:	ba 00 00 00 00       	mov    edx,0x0
10001b5a:	3b 55 dc             	cmp    edx,DWORD PTR [ebp-0x24]
10001b5d:	72 ee                	jb     10001b4d <wait2+0x75>
10001b5f:	3b 55 dc             	cmp    edx,DWORD PTR [ebp-0x24]
10001b62:	77 08                	ja     10001b6c <wait2+0x94>
10001b64:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
10001b67:	72 e4                	jb     10001b4d <wait2+0x75>
10001b69:	eb 01                	jmp    10001b6c <wait2+0x94>
/home/yogi/src/os/testMainProgramEntry/time.c:297
    unsigned msPerTick = 1000 / kTicksPerSecond;         //18
    uint64_t totalTicksToWait = msToWait/msPerTick;     //4321/18
    uint64_t endTicks = startTicks + totalTicksToWait;

    if (endTicks < *kTicksSinceStart)
        return;
10001b6b:	90                   	nop
/home/yogi/src/os/testMainProgramEntry/time.c:307
    //printf ("startTicks=%u, msPerTick=%u, totalTicksToWait=%u, endTicks=%u, kTicksSinceStart=%u", startTicks, msPerTick, totalTicksToWait, endTicks, kTicksSinceStart);
    //printf("\nStart waiting ... endTicks=%u, kTicksSinceStart=%u\n",endTicks, kTicksSinceStart);
    while (endTicks > *kTicksSinceStart)
    {__asm__("hlt\n");}
    //printf("done waiting!\n");
}
10001b6c:	83 c4 24             	add    esp,0x24
10001b6f:	5b                   	pop    ebx
10001b70:	5d                   	pop    ebp
10001b71:	c3                   	ret    
