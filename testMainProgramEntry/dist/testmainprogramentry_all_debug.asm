
Debug/cross-Linux/testmainprogramentry:     file format elf32-i386


Disassembly of section .text:

10000000 <outb>:
outb():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/include/io.h:22

void IRQ_set_mask(unsigned char IRQline);
void IRQ_clear_mask(unsigned char IRQline);

static __inline void outb(unsigned short __port, unsigned char __val)
{
10000000:	55                   	push   ebp
10000001:	89 e5                	mov    ebp,esp
10000003:	83 ec 08             	sub    esp,0x8
10000006:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
10000009:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000000c:	66 89 55 fc          	mov    WORD PTR [ebp-0x4],dx
10000010:	88 45 f8             	mov    BYTE PTR [ebp-0x8],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/include/io.h:23
	__asm__ volatile ("outb %1, %0" : : "a" (__val), "dN" (__port));
10000013:	0f b6 45 f8          	movzx  eax,BYTE PTR [ebp-0x8]
10000017:	0f b7 55 fc          	movzx  edx,WORD PTR [ebp-0x4]
1000001b:	ee                   	out    dx,al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/include/io.h:24
}
1000001c:	90                   	nop
1000001d:	c9                   	leave  
1000001e:	c3                   	ret    

1000001f <update_cursor>:
update_cursor():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/char/console/basic_display.c:25
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
100005a5:	e8 0a 07 00 00       	call   10000cb4 <strlen>
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

10000804 <printchar>:
printchar():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:41
//extern bool pauseDisplay(bool offerToQuit);
extern uint32_t kDebugLevel;
uint8_t printDLineCount;

static void printchar(char **str, int c)
{
10000804:	55                   	push   ebp
10000805:	89 e5                	mov    ebp,esp
10000807:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:43
	
	if (str) {
1000080a:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
1000080e:	74 19                	je     10000829 <printchar+0x25>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:44
		**str = c;
10000810:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000813:	8b 00                	mov    eax,DWORD PTR [eax]
10000815:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
10000818:	88 10                	mov    BYTE PTR [eax],dl
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:45
		++(*str);
1000081a:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
1000081d:	8b 00                	mov    eax,DWORD PTR [eax]
1000081f:	8d 50 01             	lea    edx,[eax+0x1]
10000822:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000825:	89 10                	mov    DWORD PTR [eax],edx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:48
	}
	else terminal_putchar((unsigned char)c);
}
10000827:	eb 12                	jmp    1000083b <printchar+0x37>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:47
	
	if (str) {
		**str = c;
		++(*str);
	}
	else terminal_putchar((unsigned char)c);
10000829:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000082c:	0f b6 c0             	movzx  eax,al
1000082f:	83 ec 0c             	sub    esp,0xc
10000832:	50                   	push   eax
10000833:	e8 de fa ff ff       	call   10000316 <terminal_putchar>
10000838:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:48
}
1000083b:	90                   	nop
1000083c:	c9                   	leave  
1000083d:	c3                   	ret    

1000083e <prints>:
prints():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:54

#define PAD_RIGHT 1
#define PAD_ZERO 2

static int prints(char **out, const char *string, int width, int pad)
{
1000083e:	55                   	push   ebp
1000083f:	89 e5                	mov    ebp,esp
10000841:	57                   	push   edi
10000842:	56                   	push   esi
10000843:	53                   	push   ebx
10000844:	83 ec 1c             	sub    esp,0x1c
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:55
	register int pc = 0, padchar = ' ';
10000847:	bb 00 00 00 00       	mov    ebx,0x0
1000084c:	c7 45 e4 20 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x20
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:57

	if (width > 0) {
10000853:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
10000857:	7e 39                	jle    10000892 <prints+0x54>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:58
		register int len = 0;
10000859:	be 00 00 00 00       	mov    esi,0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:60
		register const char *ptr;
		for (ptr = string; *ptr; ++ptr) ++len;
1000085e:	8b 7d 0c             	mov    edi,DWORD PTR [ebp+0xc]
10000861:	eb 06                	jmp    10000869 <prints+0x2b>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:60 (discriminator 3)
10000863:	83 c6 01             	add    esi,0x1
10000866:	83 c7 01             	add    edi,0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:60 (discriminator 1)
10000869:	0f b6 07             	movzx  eax,BYTE PTR [edi]
1000086c:	84 c0                	test   al,al
1000086e:	75 f3                	jne    10000863 <prints+0x25>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:61
		if (len >= width) width = 0;
10000870:	3b 75 10             	cmp    esi,DWORD PTR [ebp+0x10]
10000873:	7c 09                	jl     1000087e <prints+0x40>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:61 (discriminator 1)
10000875:	c7 45 10 00 00 00 00 	mov    DWORD PTR [ebp+0x10],0x0
1000087c:	eb 03                	jmp    10000881 <prints+0x43>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:62
		else width -= len;
1000087e:	29 75 10             	sub    DWORD PTR [ebp+0x10],esi
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:63
		if (pad & PAD_ZERO) padchar = '0';
10000881:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
10000884:	83 e0 02             	and    eax,0x2
10000887:	85 c0                	test   eax,eax
10000889:	74 07                	je     10000892 <prints+0x54>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:63 (discriminator 1)
1000088b:	c7 45 e4 30 00 00 00 	mov    DWORD PTR [ebp-0x1c],0x30
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:65
	}
	if (!(pad & PAD_RIGHT)) {
10000892:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
10000895:	83 e0 01             	and    eax,0x1
10000898:	85 c0                	test   eax,eax
1000089a:	75 41                	jne    100008dd <prints+0x9f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:66
		for ( ; width > 0; --width) {
1000089c:	eb 18                	jmp    100008b6 <prints+0x78>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:67 (discriminator 2)
			printchar (out, padchar);
1000089e:	83 ec 08             	sub    esp,0x8
100008a1:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
100008a4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100008a7:	e8 58 ff ff ff       	call   10000804 <printchar>
100008ac:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:68 (discriminator 2)
			++pc;
100008af:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:66 (discriminator 2)
		if (len >= width) width = 0;
		else width -= len;
		if (pad & PAD_ZERO) padchar = '0';
	}
	if (!(pad & PAD_RIGHT)) {
		for ( ; width > 0; --width) {
100008b2:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:66 (discriminator 1)
100008b6:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
100008ba:	7f e2                	jg     1000089e <prints+0x60>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:71
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
100008bc:	eb 1f                	jmp    100008dd <prints+0x9f>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:72 (discriminator 2)
		printchar (out, *string);
100008be:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100008c1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
100008c4:	0f be c0             	movsx  eax,al
100008c7:	83 ec 08             	sub    esp,0x8
100008ca:	50                   	push   eax
100008cb:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100008ce:	e8 31 ff ff ff       	call   10000804 <printchar>
100008d3:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:73 (discriminator 2)
		++pc;
100008d6:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:71 (discriminator 2)
		for ( ; width > 0; --width) {
			printchar (out, padchar);
			++pc;
		}
	}
	for ( ; *string ; ++string) {
100008d9:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:71 (discriminator 1)
100008dd:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
100008e0:	0f b6 00             	movzx  eax,BYTE PTR [eax]
100008e3:	84 c0                	test   al,al
100008e5:	75 d7                	jne    100008be <prints+0x80>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:75
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
100008e7:	eb 18                	jmp    10000901 <prints+0xc3>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:76 (discriminator 2)
		printchar (out, padchar);
100008e9:	83 ec 08             	sub    esp,0x8
100008ec:	ff 75 e4             	push   DWORD PTR [ebp-0x1c]
100008ef:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100008f2:	e8 0d ff ff ff       	call   10000804 <printchar>
100008f7:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:77 (discriminator 2)
		++pc;
100008fa:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:75 (discriminator 2)
	}
	for ( ; *string ; ++string) {
		printchar (out, *string);
		++pc;
	}
	for ( ; width > 0; --width) {
100008fd:	83 6d 10 01          	sub    DWORD PTR [ebp+0x10],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:75 (discriminator 1)
10000901:	83 7d 10 00          	cmp    DWORD PTR [ebp+0x10],0x0
10000905:	7f e2                	jg     100008e9 <prints+0xab>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:80
		printchar (out, padchar);
		++pc;
	}

	return pc;
10000907:	89 d8                	mov    eax,ebx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:81
}
10000909:	8d 65 f4             	lea    esp,[ebp-0xc]
1000090c:	5b                   	pop    ebx
1000090d:	5e                   	pop    esi
1000090e:	5f                   	pop    edi
1000090f:	5d                   	pop    ebp
10000910:	c3                   	ret    

10000911 <printi>:
printi():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:87

/* the following should be enough for 32 bit int */
#define PRINT_BUF_LEN 12

static int printi(char **out, int i, int b, int sg, int width, int pad, int letbase)
{
10000911:	55                   	push   ebp
10000912:	89 e5                	mov    ebp,esp
10000914:	57                   	push   edi
10000915:	56                   	push   esi
10000916:	53                   	push   ebx
10000917:	83 ec 2c             	sub    esp,0x2c
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:90
	char print_buf[PRINT_BUF_LEN];
	register char *s;
	register int t, neg = 0, pc = 0;
1000091a:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
10000921:	c7 45 d0 00 00 00 00 	mov    DWORD PTR [ebp-0x30],0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:91
	register unsigned int u = i;
10000928:	8b 75 0c             	mov    esi,DWORD PTR [ebp+0xc]
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:93

	if (i == 0) {
1000092b:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
1000092f:	75 22                	jne    10000953 <printi+0x42>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:94
		print_buf[0] = '0';
10000931:	c6 45 dc 30          	mov    BYTE PTR [ebp-0x24],0x30
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:95
		print_buf[1] = '\0';
10000935:	c6 45 dd 00          	mov    BYTE PTR [ebp-0x23],0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:96
		return prints (out, print_buf, width, pad);
10000939:	ff 75 1c             	push   DWORD PTR [ebp+0x1c]
1000093c:	ff 75 18             	push   DWORD PTR [ebp+0x18]
1000093f:	8d 45 dc             	lea    eax,[ebp-0x24]
10000942:	50                   	push   eax
10000943:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000946:	e8 f3 fe ff ff       	call   1000083e <prints>
1000094b:	83 c4 10             	add    esp,0x10
1000094e:	e9 af 00 00 00       	jmp    10000a02 <printi+0xf1>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:99
	}

	if (sg && b == 10 && i < 0) {
10000953:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
10000957:	74 1a                	je     10000973 <printi+0x62>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:99 (discriminator 1)
10000959:	83 7d 10 0a          	cmp    DWORD PTR [ebp+0x10],0xa
1000095d:	75 14                	jne    10000973 <printi+0x62>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:99 (discriminator 2)
1000095f:	83 7d 0c 00          	cmp    DWORD PTR [ebp+0xc],0x0
10000963:	79 0e                	jns    10000973 <printi+0x62>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:100
		neg = 1;
10000965:	c7 45 d4 01 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:101
		u = -i;
1000096c:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
1000096f:	f7 d8                	neg    eax
10000971:	89 c6                	mov    esi,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:104
	}

	s = print_buf + PRINT_BUF_LEN-1;
10000973:	8d 5d dc             	lea    ebx,[ebp-0x24]
10000976:	83 c3 0b             	add    ebx,0xb
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:105
	*s = '\0';
10000979:	c6 03 00             	mov    BYTE PTR [ebx],0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:107

	while (u) {
1000097c:	eb 35                	jmp    100009b3 <printi+0xa2>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:108
		t = u % b;
1000097e:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
10000981:	89 f0                	mov    eax,esi
10000983:	ba 00 00 00 00       	mov    edx,0x0
10000988:	f7 f1                	div    ecx
1000098a:	89 d0                	mov    eax,edx
1000098c:	89 c7                	mov    edi,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:109
		if( t >= 10 )
1000098e:	83 ff 09             	cmp    edi,0x9
10000991:	7e 08                	jle    1000099b <printi+0x8a>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:110
			t += letbase - '0' - 10;
10000993:	8b 45 20             	mov    eax,DWORD PTR [ebp+0x20]
10000996:	83 e8 3a             	sub    eax,0x3a
10000999:	01 c7                	add    edi,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:111
		*--s = t + '0';
1000099b:	83 eb 01             	sub    ebx,0x1
1000099e:	89 f8                	mov    eax,edi
100009a0:	83 c0 30             	add    eax,0x30
100009a3:	88 03                	mov    BYTE PTR [ebx],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:112
		u /= b;
100009a5:	8b 4d 10             	mov    ecx,DWORD PTR [ebp+0x10]
100009a8:	89 f0                	mov    eax,esi
100009aa:	ba 00 00 00 00       	mov    edx,0x0
100009af:	f7 f1                	div    ecx
100009b1:	89 c6                	mov    esi,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:107
	}

	s = print_buf + PRINT_BUF_LEN-1;
	*s = '\0';

	while (u) {
100009b3:	85 f6                	test   esi,esi
100009b5:	75 c7                	jne    1000097e <printi+0x6d>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:115
			t += letbase - '0' - 10;
		*--s = t + '0';
		u /= b;
	}

	if (neg) {
100009b7:	83 7d d4 00          	cmp    DWORD PTR [ebp-0x2c],0x0
100009bb:	74 30                	je     100009ed <printi+0xdc>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:116
		if( width && (pad & PAD_ZERO) ) {
100009bd:	83 7d 18 00          	cmp    DWORD PTR [ebp+0x18],0x0
100009c1:	74 24                	je     100009e7 <printi+0xd6>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:116 (discriminator 1)
100009c3:	8b 45 1c             	mov    eax,DWORD PTR [ebp+0x1c]
100009c6:	83 e0 02             	and    eax,0x2
100009c9:	85 c0                	test   eax,eax
100009cb:	74 1a                	je     100009e7 <printi+0xd6>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:117
			printchar (out, '-');
100009cd:	83 ec 08             	sub    esp,0x8
100009d0:	6a 2d                	push   0x2d
100009d2:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100009d5:	e8 2a fe ff ff       	call   10000804 <printchar>
100009da:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:118
			++pc;
100009dd:	83 45 d0 01          	add    DWORD PTR [ebp-0x30],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:119
			--width;
100009e1:	83 6d 18 01          	sub    DWORD PTR [ebp+0x18],0x1
100009e5:	eb 06                	jmp    100009ed <printi+0xdc>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:122
		}
		else {
			*--s = '-';
100009e7:	83 eb 01             	sub    ebx,0x1
100009ea:	c6 03 2d             	mov    BYTE PTR [ebx],0x2d
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:126
		}
	}

	return pc + prints (out, s, width, pad);
100009ed:	ff 75 1c             	push   DWORD PTR [ebp+0x1c]
100009f0:	ff 75 18             	push   DWORD PTR [ebp+0x18]
100009f3:	53                   	push   ebx
100009f4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
100009f7:	e8 42 fe ff ff       	call   1000083e <prints>
100009fc:	83 c4 10             	add    esp,0x10
100009ff:	03 45 d0             	add    eax,DWORD PTR [ebp-0x30]
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:127 (discriminator 1)
}
10000a02:	8d 65 f4             	lea    esp,[ebp-0xc]
10000a05:	5b                   	pop    ebx
10000a06:	5e                   	pop    esi
10000a07:	5f                   	pop    edi
10000a08:	5d                   	pop    ebp
10000a09:	c3                   	ret    

10000a0a <print>:
print():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:130

static int print(char **out, const char *format, va_list args )
{
10000a0a:	55                   	push   ebp
10000a0b:	89 e5                	mov    ebp,esp
10000a0d:	57                   	push   edi
10000a0e:	56                   	push   esi
10000a0f:	53                   	push   ebx
10000a10:	83 ec 1c             	sub    esp,0x1c
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:132
	register int width, pad;
	register int pc = 0;
10000a13:	bb 00 00 00 00       	mov    ebx,0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:135
	char scr[2];

	for (; *format != 0; ++format) {
10000a18:	e9 da 01 00 00       	jmp    10000bf7 <print+0x1ed>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:136
		if (*format == '%') {
10000a1d:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000a20:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000a23:	3c 25                	cmp    al,0x25
10000a25:	0f 85 ad 01 00 00    	jne    10000bd8 <print+0x1ce>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:137
			++format;
10000a2b:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:138
			width = pad = 0;
10000a2f:	bf 00 00 00 00       	mov    edi,0x0
10000a34:	89 fe                	mov    esi,edi
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:139
			if (*format == '\0') break;
10000a36:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000a39:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000a3c:	84 c0                	test   al,al
10000a3e:	0f 84 c3 01 00 00    	je     10000c07 <print+0x1fd>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:140
			if (*format == '%') goto out;
10000a44:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000a47:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000a4a:	3c 25                	cmp    al,0x25
10000a4c:	0f 84 85 01 00 00    	je     10000bd7 <print+0x1cd>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:141
			if (*format == '-') {
10000a52:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000a55:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000a58:	3c 2d                	cmp    al,0x2d
10000a5a:	75 12                	jne    10000a6e <print+0x64>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:142
				++format;
10000a5c:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:143
				pad = PAD_RIGHT;
10000a60:	bf 01 00 00 00       	mov    edi,0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:145
			}
			while (*format == '0') {
10000a65:	eb 07                	jmp    10000a6e <print+0x64>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:146
				++format;
10000a67:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:147
				pad |= PAD_ZERO;
10000a6b:	83 cf 02             	or     edi,0x2
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:145
			if (*format == '%') goto out;
			if (*format == '-') {
				++format;
				pad = PAD_RIGHT;
			}
			while (*format == '0') {
10000a6e:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000a71:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000a74:	3c 30                	cmp    al,0x30
10000a76:	74 ef                	je     10000a67 <print+0x5d>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:149
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
10000a78:	eb 1d                	jmp    10000a97 <print+0x8d>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:150 (discriminator 3)
				width *= 10;
10000a7a:	89 f0                	mov    eax,esi
10000a7c:	c1 e0 02             	shl    eax,0x2
10000a7f:	01 f0                	add    eax,esi
10000a81:	01 c0                	add    eax,eax
10000a83:	89 c6                	mov    esi,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:151 (discriminator 3)
				width += *format - '0';
10000a85:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000a88:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000a8b:	0f be c0             	movsx  eax,al
10000a8e:	83 e8 30             	sub    eax,0x30
10000a91:	01 c6                	add    esi,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:149 (discriminator 3)
			}
			while (*format == '0') {
				++format;
				pad |= PAD_ZERO;
			}
			for ( ; *format >= '0' && *format <= '9'; ++format) {
10000a93:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:149 (discriminator 1)
10000a97:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000a9a:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000a9d:	3c 2f                	cmp    al,0x2f
10000a9f:	7e 0a                	jle    10000aab <print+0xa1>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:149 (discriminator 2)
10000aa1:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000aa4:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000aa7:	3c 39                	cmp    al,0x39
10000aa9:	7e cf                	jle    10000a7a <print+0x70>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:153
				width *= 10;
				width += *format - '0';
			}
			if( *format == 's' ) {
10000aab:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000aae:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000ab1:	3c 73                	cmp    al,0x73
10000ab3:	75 2b                	jne    10000ae0 <print+0xd6>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:154
				register char *s = (char *)va_arg( args, int );
10000ab5:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000ab8:	8d 50 04             	lea    edx,[eax+0x4]
10000abb:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000abe:	8b 00                	mov    eax,DWORD PTR [eax]
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:155
				pc += prints (out, s?s:"(null)", width, pad);
10000ac0:	85 c0                	test   eax,eax
10000ac2:	74 02                	je     10000ac6 <print+0xbc>
10000ac4:	eb 05                	jmp    10000acb <print+0xc1>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:155 (discriminator 2)
10000ac6:	b8 08 11 00 10       	mov    eax,0x10001108
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:155 (discriminator 4)
10000acb:	57                   	push   edi
10000acc:	56                   	push   esi
10000acd:	50                   	push   eax
10000ace:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000ad1:	e8 68 fd ff ff       	call   1000083e <prints>
10000ad6:	83 c4 10             	add    esp,0x10
10000ad9:	01 c3                	add    ebx,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:156 (discriminator 4)
				continue;
10000adb:	e9 13 01 00 00       	jmp    10000bf3 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:158
			}
			if( *format == 'd' ) {
10000ae0:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000ae3:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000ae6:	3c 64                	cmp    al,0x64
10000ae8:	75 29                	jne    10000b13 <print+0x109>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:159
				pc += printi (out, va_arg( args, int ), 10, 1, width, pad, 'a');
10000aea:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000aed:	8d 50 04             	lea    edx,[eax+0x4]
10000af0:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000af3:	8b 00                	mov    eax,DWORD PTR [eax]
10000af5:	83 ec 04             	sub    esp,0x4
10000af8:	6a 61                	push   0x61
10000afa:	57                   	push   edi
10000afb:	56                   	push   esi
10000afc:	6a 01                	push   0x1
10000afe:	6a 0a                	push   0xa
10000b00:	50                   	push   eax
10000b01:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000b04:	e8 08 fe ff ff       	call   10000911 <printi>
10000b09:	83 c4 20             	add    esp,0x20
10000b0c:	01 c3                	add    ebx,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:160
				continue;
10000b0e:	e9 e0 00 00 00       	jmp    10000bf3 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:162
			}
			if( *format == 'x' ) {
10000b13:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000b16:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000b19:	3c 78                	cmp    al,0x78
10000b1b:	75 29                	jne    10000b46 <print+0x13c>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:163
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'a');
10000b1d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000b20:	8d 50 04             	lea    edx,[eax+0x4]
10000b23:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000b26:	8b 00                	mov    eax,DWORD PTR [eax]
10000b28:	83 ec 04             	sub    esp,0x4
10000b2b:	6a 61                	push   0x61
10000b2d:	57                   	push   edi
10000b2e:	56                   	push   esi
10000b2f:	6a 00                	push   0x0
10000b31:	6a 10                	push   0x10
10000b33:	50                   	push   eax
10000b34:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000b37:	e8 d5 fd ff ff       	call   10000911 <printi>
10000b3c:	83 c4 20             	add    esp,0x20
10000b3f:	01 c3                	add    ebx,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:164
				continue;
10000b41:	e9 ad 00 00 00       	jmp    10000bf3 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:166
			}
			if( *format == 'X' ) {
10000b46:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000b49:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000b4c:	3c 58                	cmp    al,0x58
10000b4e:	75 26                	jne    10000b76 <print+0x16c>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:167
				pc += printi (out, va_arg( args, int ), 16, 0, width, pad, 'A');
10000b50:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000b53:	8d 50 04             	lea    edx,[eax+0x4]
10000b56:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000b59:	8b 00                	mov    eax,DWORD PTR [eax]
10000b5b:	83 ec 04             	sub    esp,0x4
10000b5e:	6a 41                	push   0x41
10000b60:	57                   	push   edi
10000b61:	56                   	push   esi
10000b62:	6a 00                	push   0x0
10000b64:	6a 10                	push   0x10
10000b66:	50                   	push   eax
10000b67:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000b6a:	e8 a2 fd ff ff       	call   10000911 <printi>
10000b6f:	83 c4 20             	add    esp,0x20
10000b72:	01 c3                	add    ebx,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:168
				continue;
10000b74:	eb 7d                	jmp    10000bf3 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:170
			}
			if( *format == 'u' ) {
10000b76:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000b79:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000b7c:	3c 75                	cmp    al,0x75
10000b7e:	75 26                	jne    10000ba6 <print+0x19c>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:171
				pc += printi (out, va_arg( args, int ), 10, 0, width, pad, 'a');
10000b80:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000b83:	8d 50 04             	lea    edx,[eax+0x4]
10000b86:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000b89:	8b 00                	mov    eax,DWORD PTR [eax]
10000b8b:	83 ec 04             	sub    esp,0x4
10000b8e:	6a 61                	push   0x61
10000b90:	57                   	push   edi
10000b91:	56                   	push   esi
10000b92:	6a 00                	push   0x0
10000b94:	6a 0a                	push   0xa
10000b96:	50                   	push   eax
10000b97:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000b9a:	e8 72 fd ff ff       	call   10000911 <printi>
10000b9f:	83 c4 20             	add    esp,0x20
10000ba2:	01 c3                	add    ebx,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:172
				continue;
10000ba4:	eb 4d                	jmp    10000bf3 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:174
			}
			if( *format == 'c' ) {
10000ba6:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000ba9:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000bac:	3c 63                	cmp    al,0x63
10000bae:	75 43                	jne    10000bf3 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:176
				/* char are converted to int then pushed on the stack */
				scr[0] = (char)va_arg( args, int );
10000bb0:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
10000bb3:	8d 50 04             	lea    edx,[eax+0x4]
10000bb6:	89 55 10             	mov    DWORD PTR [ebp+0x10],edx
10000bb9:	8b 00                	mov    eax,DWORD PTR [eax]
10000bbb:	88 45 e6             	mov    BYTE PTR [ebp-0x1a],al
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:177
				scr[1] = '\0';
10000bbe:	c6 45 e7 00          	mov    BYTE PTR [ebp-0x19],0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:178
				pc += prints (out, scr, width, pad);
10000bc2:	57                   	push   edi
10000bc3:	56                   	push   esi
10000bc4:	8d 45 e6             	lea    eax,[ebp-0x1a]
10000bc7:	50                   	push   eax
10000bc8:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000bcb:	e8 6e fc ff ff       	call   1000083e <prints>
10000bd0:	83 c4 10             	add    esp,0x10
10000bd3:	01 c3                	add    ebx,eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:179
				continue;
10000bd5:	eb 1c                	jmp    10000bf3 <print+0x1e9>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:140
	for (; *format != 0; ++format) {
		if (*format == '%') {
			++format;
			width = pad = 0;
			if (*format == '\0') break;
			if (*format == '%') goto out;
10000bd7:	90                   	nop
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:184
				continue;
			}
		}
		else {
		out:
			printchar (out, *format);
10000bd8:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000bdb:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000bde:	0f be c0             	movsx  eax,al
10000be1:	83 ec 08             	sub    esp,0x8
10000be4:	50                   	push   eax
10000be5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000be8:	e8 17 fc ff ff       	call   10000804 <printchar>
10000bed:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:185
			++pc;
10000bf0:	83 c3 01             	add    ebx,0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:135
{
	register int width, pad;
	register int pc = 0;
	char scr[2];

	for (; *format != 0; ++format) {
10000bf3:	83 45 0c 01          	add    DWORD PTR [ebp+0xc],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:135 (discriminator 1)
10000bf7:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
10000bfa:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000bfd:	84 c0                	test   al,al
10000bff:	0f 85 18 fe ff ff    	jne    10000a1d <print+0x13>
10000c05:	eb 01                	jmp    10000c08 <print+0x1fe>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:139
		if (*format == '%') {
			++format;
			width = pad = 0;
			if (*format == '\0') break;
10000c07:	90                   	nop
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:188
		out:
			printchar (out, *format);
			++pc;
		}
	}
	if (out) **out = '\0';
10000c08:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
10000c0c:	74 08                	je     10000c16 <print+0x20c>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:188 (discriminator 1)
10000c0e:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
10000c11:	8b 00                	mov    eax,DWORD PTR [eax]
10000c13:	c6 00 00             	mov    BYTE PTR [eax],0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:190
	va_end( args );
	return pc;
10000c16:	89 d8                	mov    eax,ebx
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:191
}
10000c18:	8d 65 f4             	lea    esp,[ebp-0xc]
10000c1b:	5b                   	pop    ebx
10000c1c:	5e                   	pop    esi
10000c1d:	5f                   	pop    edi
10000c1e:	5d                   	pop    ebp
10000c1f:	c3                   	ret    

10000c20 <printk_valist>:
printk_valist():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:194

int printk_valist(const char *format, va_list args)
{
10000c20:	55                   	push   ebp
10000c21:	89 e5                	mov    ebp,esp
10000c23:	83 ec 08             	sub    esp,0x8
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:195
    return print(0, format, args);
10000c26:	83 ec 04             	sub    esp,0x4
10000c29:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10000c2c:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000c2f:	6a 00                	push   0x0
10000c31:	e8 d4 fd ff ff       	call   10000a0a <print>
10000c36:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:196
}
10000c39:	c9                   	leave  
10000c3a:	c3                   	ret    

10000c3b <printk>:
printk():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:199

int printk(const char *format, ...)
{
10000c3b:	55                   	push   ebp
10000c3c:	89 e5                	mov    ebp,esp
10000c3e:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:201
        va_list args;
        va_start( args, format );
10000c41:	8d 45 0c             	lea    eax,[ebp+0xc]
10000c44:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:202
        return printk_valist(format, args);
10000c47:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000c4a:	83 ec 08             	sub    esp,0x8
10000c4d:	50                   	push   eax
10000c4e:	ff 75 08             	push   DWORD PTR [ebp+0x8]
10000c51:	e8 ca ff ff ff       	call   10000c20 <printk_valist>
10000c56:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:203
}
10000c59:	c9                   	leave  
10000c5a:	c3                   	ret    

10000c5b <printd>:
printd():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:209

#ifdef DEBUG_NONE
int printd() {}
#else
int printd(uint32_t DebugLevel, const char *format, ...)
{
10000c5b:	55                   	push   ebp
10000c5c:	89 e5                	mov    ebp,esp
10000c5e:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:210
    if ((kDebugLevel & DebugLevel) == DebugLevel)    
10000c61:	a1 78 98 12 00       	mov    eax,ds:0x129878
10000c66:	23 45 08             	and    eax,DWORD PTR [ebp+0x8]
10000c69:	3b 45 08             	cmp    eax,DWORD PTR [ebp+0x8]
10000c6c:	75 1a                	jne    10000c88 <printd+0x2d>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:214
    {
        va_list args;

        va_start( args, format );
10000c6e:	8d 45 10             	lea    eax,[ebp+0x10]
10000c71:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:220
//        if (++printDLineCount==SYS_VGA_HEIGHT-1)
//        {
//            pauseDisplay(false);
//            printDLineCount=0;
//        }
        return printk_valist(format, args);
10000c74:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000c77:	83 ec 08             	sub    esp,0x8
10000c7a:	50                   	push   eax
10000c7b:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10000c7e:	e8 9d ff ff ff       	call   10000c20 <printk_valist>
10000c83:	83 c4 10             	add    esp,0x10
10000c86:	eb 05                	jmp    10000c8d <printd+0x32>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:222
    }
    return 0;
10000c88:	b8 00 00 00 00       	mov    eax,0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:223 (discriminator 1)
}
10000c8d:	c9                   	leave  
10000c8e:	c3                   	ret    

10000c8f <sprintf>:
sprintf():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:227
#endif

int sprintf(char *out, const char *format, ...)
{
10000c8f:	55                   	push   ebp
10000c90:	89 e5                	mov    ebp,esp
10000c92:	83 ec 18             	sub    esp,0x18
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:230
        va_list args;
        
        va_start( args, format );
10000c95:	8d 45 10             	lea    eax,[ebp+0x10]
10000c98:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:231
        return print( &out, format, args );
10000c9b:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000c9e:	83 ec 04             	sub    esp,0x4
10000ca1:	50                   	push   eax
10000ca2:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
10000ca5:	8d 45 08             	lea    eax,[ebp+0x8]
10000ca8:	50                   	push   eax
10000ca9:	e8 5c fd ff ff       	call   10000a0a <print>
10000cae:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/printf.c:232
}
10000cb1:	c9                   	leave  
10000cb2:	c3                   	ret    
10000cb3:	90                   	nop

10000cb4 <strlen>:
strlen():
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:3
#include <stddef.h>

size_t strlen(const char* str) {
10000cb4:	55                   	push   ebp
10000cb5:	89 e5                	mov    ebp,esp
10000cb7:	83 ec 10             	sub    esp,0x10
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:4
          size_t ret = 0;
10000cba:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:5
        while ( str[ret] != 0 )
10000cc1:	eb 04                	jmp    10000cc7 <strlen+0x13>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:6
                ret++;
10000cc3:	83 45 fc 01          	add    DWORD PTR [ebp-0x4],0x1
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:5
#include <stddef.h>

size_t strlen(const char* str) {
          size_t ret = 0;
        while ( str[ret] != 0 )
10000cc7:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
10000cca:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
10000ccd:	01 d0                	add    eax,edx
10000ccf:	0f b6 00             	movzx  eax,BYTE PTR [eax]
10000cd2:	84 c0                	test   al,al
10000cd4:	75 ed                	jne    10000cc3 <strlen+0xf>
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:7
                ret++;
        return ret;
10000cd6:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
/home/yogi/src/os/testMainProgramEntry/../chrisOS/src/strings/strlen.c:8
}
10000cd9:	c9                   	leave  
10000cda:	c3                   	ret    
10000cdb:	90                   	nop

10000cdc <main>:
main():
/home/yogi/src/os/testMainProgramEntry/main.c:13
#include "../chrisOS/include/kernelObjects.h"

/*
 * testMainProgramEntry
 */
int main(int argc, char** argv) {
10000cdc:	8d 4c 24 04          	lea    ecx,[esp+0x4]
10000ce0:	83 e4 f0             	and    esp,0xfffffff0
10000ce3:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
10000ce6:	55                   	push   ebp
10000ce7:	89 e5                	mov    ebp,esp
10000ce9:	53                   	push   ebx
10000cea:	51                   	push   ecx
10000ceb:	83 ec 10             	sub    esp,0x10
10000cee:	89 cb                	mov    ebx,ecx
/home/yogi/src/os/testMainProgramEntry/main.c:17
    register int *esp __asm__("esp");
    //printk("Hello from testmainprogramentry!!!");
    //__asm__("cld\nint 0x80\n");
    int a=argc;
10000cf0:	8b 03                	mov    eax,DWORD PTR [ebx]
10000cf2:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
/home/yogi/src/os/testMainProgramEntry/main.c:18
    printk("Param count=%u\n",argc);
10000cf5:	83 ec 08             	sub    esp,0x8
10000cf8:	ff 33                	push   DWORD PTR [ebx]
10000cfa:	68 ea 11 00 10       	push   0x100011ea
10000cff:	e8 37 ff ff ff       	call   10000c3b <printk>
10000d04:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/main.c:19
    char** b=argv;
10000d07:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
10000d0a:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
/home/yogi/src/os/testMainProgramEntry/main.c:20
    for (int cnt=0;cnt<6;cnt++)
10000d0d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
10000d14:	eb 29                	jmp    10000d3f <main+0x63>
/home/yogi/src/os/testMainProgramEntry/main.c:22 (discriminator 3)
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
10000d16:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
10000d19:	8d 14 85 00 00 00 00 	lea    edx,[eax*4+0x0]
10000d20:	8b 43 04             	mov    eax,DWORD PTR [ebx+0x4]
10000d23:	01 d0                	add    eax,edx
10000d25:	8b 00                	mov    eax,DWORD PTR [eax]
10000d27:	83 ec 04             	sub    esp,0x4
10000d2a:	50                   	push   eax
10000d2b:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
10000d2e:	68 fa 11 00 10       	push   0x100011fa
10000d33:	e8 03 ff ff ff       	call   10000c3b <printk>
10000d38:	83 c4 10             	add    esp,0x10
/home/yogi/src/os/testMainProgramEntry/main.c:20 (discriminator 3)
    //printk("Hello from testmainprogramentry!!!");
    //__asm__("cld\nint 0x80\n");
    int a=argc;
    printk("Param count=%u\n",argc);
    char** b=argv;
    for (int cnt=0;cnt<6;cnt++)
10000d3b:	83 45 f4 01          	add    DWORD PTR [ebp-0xc],0x1
/home/yogi/src/os/testMainProgramEntry/main.c:20 (discriminator 1)
10000d3f:	83 7d f4 05          	cmp    DWORD PTR [ebp-0xc],0x5
10000d43:	7e d1                	jle    10000d16 <main+0x3a>
/home/yogi/src/os/testMainProgramEntry/main.c:24 (discriminator 1)
    {
        printk("Param %u=%s\n",cnt,argv[cnt]);
    }
    jmp3: goto jmp3;
10000d45:	eb fe                	jmp    10000d45 <main+0x69>
